#!/usr/bin/env node

/**
 * Database Import Script
 * 
 * This script imports workflows from JSON file to Supabase database
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config({ path: '.env.local' });

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Supabase configuration
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing Supabase credentials');
    console.error('Please set NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env.local');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// Category mapping based on tags and nodes
const CATEGORY_MAPPING = {
    'AI': ['ai'],
    'Automation': ['automation'],
    'Integration': ['integration'],
    'Finance': ['finance'],
    'Productivity': ['productivity'],
    'Marketing': ['marketing'],
    'Engineering': ['engineering'],
    'Data Processing': ['data-processing'],
    'Communication': ['communication'],
    'DevOps': ['devops'],
};

/**
 * Map tags to category IDs
 */
function mapCategories(tags, nodes) {
    const categories = new Set();

    // Map based on tags
    tags.forEach(tag => {
        const tagLower = tag.toLowerCase();
        if (tagLower.includes('ai') || tagLower.includes('machine learning')) {
            categories.add('ai');
        } else if (tagLower.includes('automat')) {
            categories.add('automation');
        } else if (tagLower.includes('integrat')) {
            categories.add('integration');
        } else if (tagLower.includes('financ') || tagLower.includes('payment')) {
            categories.add('finance');
        } else if (tagLower.includes('product')) {
            categories.add('productivity');
        } else if (tagLower.includes('market')) {
            categories.add('marketing');
        } else if (tagLower.includes('engineer') || tagLower.includes('develop')) {
            categories.add('engineering');
        } else if (tagLower.includes('data')) {
            categories.add('data-processing');
        } else if (tagLower.includes('communicat') || tagLower.includes('message')) {
            categories.add('communication');
        } else if (tagLower.includes('devops') || tagLower.includes('deploy')) {
            categories.add('devops');
        }
    });

    // Map based on nodes
    const nodeTypes = nodes.map(n => n.toLowerCase());
    if (nodeTypes.some(n => n.includes('openai') || n.includes('gpt') || n.includes('gemini') || n.includes('claude'))) {
        categories.add('ai');
    }
    if (nodeTypes.some(n => n.includes('gmail') || n.includes('slack') || n.includes('telegram'))) {
        categories.add('communication');
    }
    if (nodeTypes.some(n => n.includes('stripe') || n.includes('paypal'))) {
        categories.add('finance');
    }
    if (nodeTypes.some(n => n.includes('sheets') || n.includes('airtable') || n.includes('notion'))) {
        categories.add('productivity');
    }

    // Default to automation if no category found
    if (categories.size === 0) {
        categories.add('automation');
    }

    return Array.from(categories);
}

/**
 * Import workflows to database
 */
async function importWorkflows() {
    console.log('🚀 Starting database import...\n');

    // Read workflows JSON
    const jsonPath = path.join(__dirname, '../public/workflows/data/workflows.json');
    const workflows = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));

    console.log(`📦 Found ${workflows.length} workflows to import\n`);

    // Get categories from database
    const { data: categories, error: catError } = await supabase
        .from('categories')
        .select('id, slug');

    if (catError) {
        console.error('❌ Error fetching categories:', catError);
        process.exit(1);
    }

    const categoryMap = {};
    categories.forEach(cat => {
        categoryMap[cat.slug] = cat.id;
    });

    let imported = 0;
    let skipped = 0;
    let errors = 0;

    for (const workflow of workflows) {
        try {
            // 1. Insert workflow
            const { data: workflowData, error: workflowError } = await supabase
                .from('workflows')
                .upsert({
                    id: workflow.id,
                    title: workflow.title,
                    description: workflow.description,
                    author: workflow.author,
                    thumbnail_url: workflow.thumbnail,
                    json_url: workflow.jsonPath,
                    views: workflow.views || 0,
                    price: workflow.price || 0,
                    published: true,
                }, {
                    onConflict: 'id'
                })
                .select()
                .single();

            if (workflowError) {
                console.error(`❌ Error importing workflow ${workflow.id}:`, workflowError.message);
                errors++;
                continue;
            }

            // 2. Insert English translation (original)
            const { error: translationError } = await supabase
                .from('workflow_translations')
                .upsert({
                    workflow_id: workflow.id,
                    locale: 'en',
                    title: workflow.title,
                    description: workflow.description,
                }, {
                    onConflict: 'workflow_id,locale'
                });

            if (translationError) {
                console.error(`⚠️  Error adding translation for ${workflow.id}:`, translationError.message);
            }

            // 3. Map and insert categories
            const categorySlugs = mapCategories(workflow.tags || [], workflow.nodes || []);
            const categoryIds = categorySlugs
                .map(slug => categoryMap[slug])
                .filter(id => id !== undefined);

            if (categoryIds.length > 0) {
                const categoryInserts = categoryIds.map(catId => ({
                    workflow_id: workflow.id,
                    category_id: catId,
                }));

                const { error: catLinkError } = await supabase
                    .from('workflow_categories')
                    .upsert(categoryInserts, {
                        onConflict: 'workflow_id,category_id'
                    });

                if (catLinkError) {
                    console.error(`⚠️  Error linking categories for ${workflow.id}:`, catLinkError.message);
                }
            }

            // 4. Insert nodes
            if (workflow.nodes && workflow.nodes.length > 0) {
                const nodeInserts = workflow.nodes.map(nodeType => ({
                    workflow_id: workflow.id,
                    node_type: nodeType,
                    node_count: 1,
                }));

                // Delete existing nodes first
                await supabase
                    .from('workflow_nodes')
                    .delete()
                    .eq('workflow_id', workflow.id);

                const { error: nodesError } = await supabase
                    .from('workflow_nodes')
                    .insert(nodeInserts);

                if (nodesError) {
                    console.error(`⚠️  Error adding nodes for ${workflow.id}:`, nodesError.message);
                }
            }

            imported++;

            if (imported % 10 === 0) {
                console.log(`✅ Imported ${imported}/${workflows.length} workflows...`);
            }

        } catch (error) {
            console.error(`❌ Unexpected error for workflow ${workflow.id}:`, error);
            errors++;
        }
    }

    console.log(`\n✨ Import complete!`);
    console.log(`📊 Imported: ${imported}`);
    console.log(`⚠️  Skipped: ${skipped}`);
    console.log(`❌ Errors: ${errors}`);

    // Verify import
    const { count } = await supabase
        .from('workflows')
        .select('*', { count: 'exact', head: true });

    console.log(`\n📈 Total workflows in database: ${count}`);
}

// Run the import
importWorkflows().catch(error => {
    console.error('Fatal error:', error);
    process.exit(1);
});
