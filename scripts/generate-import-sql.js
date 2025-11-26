#!/usr/bin/env node

/**
 * Generate SQL INSERT statements for manual import
 * 
 * Use this if direct API connection fails due to network issues
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Read workflows JSON
const jsonPath = path.join(__dirname, '../public/workflows/data/workflows.json');
const workflows = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));

console.log('🚀 Generating SQL INSERT statements...\n');
console.log(`📦 Found ${workflows.length} workflows\n`);

// Generate SQL file
let sql = `-- Auto-generated SQL for workflow import
-- Generated: ${new Date().toISOString()}
-- Workflows: ${workflows.length}

BEGIN;

`;

// Insert workflows
workflows.forEach((workflow, index) => {
    const id = workflow.id.replace(/'/g, "''");
    const title = workflow.title.replace(/'/g, "''");
    const description = (workflow.description || '').replace(/'/g, "''");
    const author = (workflow.author || 'Unknown').replace(/'/g, "''");
    const thumbnail = workflow.thumbnail.replace(/'/g, "''");
    const jsonPath = workflow.jsonPath.replace(/'/g, "''");

    sql += `-- Workflow ${index + 1}: ${workflow.title.substring(0, 50)}
INSERT INTO workflows (id, title, description, author, thumbnail_url, json_url, views, price, published)
VALUES ('${id}', '${title}', '${description}', '${author}', '${thumbnail}', '${jsonPath}', ${workflow.views || 0}, ${workflow.price || 0}, true)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description,
  author = EXCLUDED.author,
  thumbnail_url = EXCLUDED.thumbnail_url,
  json_url = EXCLUDED.json_url;

-- English translation
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('${id}', 'en', '${title}', '${description}')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

`;

    // Add categories (simple mapping)
    const categories = [];
    const tags = workflow.tags || [];
    const nodes = workflow.nodes || [];

    tags.forEach(tag => {
        const tagLower = tag.toLowerCase();
        if (tagLower.includes('ai')) categories.push(1);
        else if (tagLower.includes('automat')) categories.push(2);
        else if (tagLower.includes('integrat')) categories.push(3);
        else if (tagLower.includes('financ')) categories.push(4);
        else if (tagLower.includes('product')) categories.push(5);
        else if (tagLower.includes('market')) categories.push(6);
        else if (tagLower.includes('engineer')) categories.push(7);
        else if (tagLower.includes('data')) categories.push(8);
        else if (tagLower.includes('communicat')) categories.push(9);
        else if (tagLower.includes('devops')) categories.push(10);
    });

    if (categories.length === 0) categories.push(2); // Default to Automation

    const uniqueCategories = [...new Set(categories)];
    uniqueCategories.forEach(catId => {
        sql += `INSERT INTO workflow_categories (workflow_id, category_id)
VALUES ('${id}', ${catId})
ON CONFLICT DO NOTHING;

`;
    });

    // Add nodes
    if (nodes.length > 0) {
        nodes.slice(0, 10).forEach(node => { // Limit to 10 nodes
            const nodeType = node.replace(/'/g, "''");
            sql += `INSERT INTO workflow_nodes (workflow_id, node_type, node_count)
VALUES ('${id}', '${nodeType}', 1);

`;
        });
    }
});

sql += `
COMMIT;

-- Verify import
SELECT COUNT(*) as total_workflows FROM workflows;
SELECT COUNT(*) as total_translations FROM workflow_translations;
SELECT COUNT(*) as total_categories FROM workflow_categories;
SELECT COUNT(*) as total_nodes FROM workflow_nodes;
`;

// Write SQL file
const outputPath = path.join(__dirname, '../supabase/migrations/import_workflows.sql');
fs.writeFileSync(outputPath, sql);

console.log(`✅ SQL file generated: ${outputPath}`);
console.log(`\n📝 To import:`);
console.log(`1. Open Supabase SQL Editor`);
console.log(`2. Copy and paste the content of: supabase/migrations/import_workflows.sql`);
console.log(`3. Click "Run"`);
console.log(`\n💡 This will import all ${workflows.length} workflows into your database`);
