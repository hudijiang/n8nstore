#!/usr/bin/env node

/**
 * Import all workflows from /tmp/n8nworkflows/workflows
 * Processes 6,240+ workflows with metadata, JSON, and thumbnails
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const SOURCE_DIR = '/tmp/n8nworkflows/workflows';
const TARGET_DIR = path.join(__dirname, '../public/workflows');
const OUTPUT_JSON = path.join(TARGET_DIR, 'data/workflows.json');

console.log('🚀 Starting workflow import...\n');

// Read all workflow directories
const workflowDirs = fs.readdirSync(SOURCE_DIR, { withFileTypes: true })
    .filter(dirent => dirent.isDirectory())
    .map(dirent => dirent.name);

console.log(`📦 Found ${workflowDirs.length} workflow directories\n`);

const workflows = [];
let processed = 0;
let errors = 0;

for (const dirName of workflowDirs) {
    try {
        const dirPath = path.join(SOURCE_DIR, dirName);

        // Extract workflow ID from directory name (last part after dash)
        const match = dirName.match(/-(\d+)$/);
        if (!match) {
            console.log(`⚠️  Skipping ${dirName} - no ID found`);
            continue;
        }

        const workflowId = match[1];

        // Find metadata file (metada-{id}.json or metadata-{id}.json)
        const files = fs.readdirSync(dirPath);
        const metadataFile = files.find(f => f.match(/metada?-\d+\.json$/));
        const workflowFile = files.find(f => f.endsWith('.json') && !f.includes('metada'));
        const imageFile = files.find(f => f.endsWith('.webp'));

        if (!metadataFile || !workflowFile) {
            console.log(`⚠️  Skipping ${dirName} - missing files`);
            errors++;
            continue;
        }

        // Read metadata
        const metadataPath = path.join(dirPath, metadataFile);
        const metadata = JSON.parse(fs.readFileSync(metadataPath, 'utf8'));

        // Read workflow JSON to get title and description
        const workflowPath = path.join(dirPath, workflowFile);
        const workflowData = JSON.parse(fs.readFileSync(workflowPath, 'utf8'));

        // Extract node types
        const nodes = [];
        if (metadata.nodeTypes) {
            for (const [nodeType, info] of Object.entries(metadata.nodeTypes)) {
                // Add each node type (count times)
                for (let i = 0; i < (info.count || 1); i++) {
                    nodes.push(nodeType);
                }
            }
        }

        // Extract tags from categories
        const tags = metadata.categories ? metadata.categories.map(c => c.name) : [];

        // Create workflow object
        const workflow = {
            id: workflowId,
            title: workflowData.name || dirName.replace(/-\d+$/, ''),
            description: workflowData.meta?.description || '',
            author: metadata.user_username || 'unknown',
            tags: tags,
            nodes: nodes.slice(0, 20), // Limit to 20 nodes
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
            views: 0,
            price: 0,
            thumbnail: `/workflows/images/${workflowId}.webp`,
            jsonPath: `/workflows/json/${workflowId}.json`
        };

        workflows.push(workflow);

        // Copy files to target directory
        // Copy thumbnail
        if (imageFile) {
            const sourcePath = path.join(dirPath, imageFile);
            const targetPath = path.join(TARGET_DIR, 'images', `${workflowId}.webp`);
            fs.copyFileSync(sourcePath, targetPath);
        }

        // Copy workflow JSON
        const targetJsonPath = path.join(TARGET_DIR, 'json', `${workflowId}.json`);
        fs.copyFileSync(workflowPath, targetJsonPath);

        processed++;

        if (processed % 100 === 0) {
            console.log(`✅ Processed ${processed} workflows...`);
        }

    } catch (error) {
        console.error(`❌ Error processing ${dirName}:`, error.message);
        errors++;
    }
}

// Write workflows.json
fs.writeFileSync(OUTPUT_JSON, JSON.stringify(workflows, null, 2));

console.log(`\n✅ Import complete!`);
console.log(`📊 Statistics:`);
console.log(`   - Total directories: ${workflowDirs.length}`);
console.log(`   - Successfully processed: ${processed}`);
console.log(`   - Errors: ${errors}`);
console.log(`   - Output: ${OUTPUT_JSON}`);
console.log(`\n💡 Next steps:`);
console.log(`   1. Run: node scripts/generate-import-sql.js`);
console.log(`   2. Import SQL file to Supabase`);
