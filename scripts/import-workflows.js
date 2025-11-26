#!/usr/bin/env node

/**
 * Workflow Import Script
 * 
 * This script processes workflows from the n8nworkflows.xyz repository
 * and prepares them for use in the n8n Workflow Store.
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Configuration
const SOURCE_DIR = '/tmp/n8nworkflows/workflows';
const TARGET_DIR = path.join(__dirname, '../public/workflows');
const MAX_WORKFLOWS = 100; // Import top 100 workflows initially

// Ensure target directories exist
const DIRS = {
    data: path.join(TARGET_DIR, 'data'),
    images: path.join(TARGET_DIR, 'images'),
    json: path.join(TARGET_DIR, 'json'),
};

Object.values(DIRS).forEach(dir => {
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
    }
});

/**
 * Read and parse a JSON file
 */
function readJSON(filePath) {
    try {
        const content = fs.readFileSync(filePath, 'utf8');
        return JSON.parse(content);
    } catch (error) {
        return null;
    }
}

/**
 * Extract description from README
 */
function extractDescription(readmePath) {
    try {
        const content = fs.readFileSync(readmePath, 'utf8');
        const lines = content.split('\n');
        let description = '';
        let foundOverview = false;

        for (const line of lines) {
            if (line.includes('Workflow Overview') || line.includes('Overview')) {
                foundOverview = true;
                continue;
            }
            if (foundOverview && line.trim() && !line.startsWith('#') && !line.startsWith('http')) {
                description = line.trim();
                break;
            }
        }

        return description || lines.find(l => l.trim() && !l.startsWith('#') && !l.startsWith('http'))?.trim() || '';
    } catch (error) {
        return '';
    }
}

/**
 * Extract workflow data from a workflow directory
 */
function extractWorkflowData(workflowDir, processedCount) {
    const dirName = path.basename(workflowDir);

    try {
        const files = fs.readdirSync(workflowDir);

        // Find files
        const metadataFile = files.find(f => f.startsWith('metada-') && f.endsWith('.json'));
        const workflowFile = files.find(f => f.endsWith('.json') && !f.startsWith('metada-'));
        const thumbnailFile = files.find(f => f.endsWith('.webp'));
        const readmeFile = files.find(f => f.startsWith('readme-') && f.endsWith('.md'));

        if (!metadataFile || !workflowFile) {
            if (processedCount < 5) console.log(`⚠️  Skipping ${dirName}: missing files`);
            return null;
        }

        const metadata = readJSON(path.join(workflowDir, metadataFile));
        const workflow = readJSON(path.join(workflowDir, workflowFile));

        if (!metadata || !workflow) {
            if (processedCount < 5) console.log(`⚠️  Skipping ${dirName}: failed to parse JSON`);
            return null;
        }

        // Extract ID from metadata filename
        const id = metadataFile.replace('metada-', '').replace('.json', '');

        // Extract description from README
        const description = readmeFile ? extractDescription(path.join(workflowDir, readmeFile)) : '';

        // Extract title from directory name (remove ID suffix)
        const title = dirName.replace(/-\d+$/, '').trim();

        // Extract node types
        const nodes = metadata.nodeTypes ? Object.keys(metadata.nodeTypes).map(n => n.replace('n8n-nodes-base.', '')) : [];

        // Extract tags from categories
        const tags = metadata.categories ? metadata.categories.map(c => c.name) : [];

        return {
            id,
            dirName,
            title,
            description,
            metadata,
            workflow,
            workflowFile,
            thumbnailPath: thumbnailFile ? path.join(workflowDir, thumbnailFile) : null,
            thumbnailFile,
            nodes,
            tags,
        };
    } catch (error) {
        return null;
    }
}

/**
 * Process all workflows
 */
function processWorkflows() {
    console.log('🚀 Starting workflow import...');
    console.log(`📁 Source: ${SOURCE_DIR}`);
    console.log(`📁 Target: ${TARGET_DIR}`);
    console.log(`📊 Max workflows: ${MAX_WORKFLOWS}\n`);

    // Check if source directory exists
    if (!fs.existsSync(SOURCE_DIR)) {
        console.error(`❌ Source directory not found: ${SOURCE_DIR}`);
        console.error('Please ensure the repository has been cloned to /tmp/n8nworkflows');
        process.exit(1);
    }

    // Get all workflow directories
    const workflowDirs = fs.readdirSync(SOURCE_DIR)
        .map(name => path.join(SOURCE_DIR, name))
        .filter(dir => {
            try {
                return fs.statSync(dir).isDirectory();
            } catch (e) {
                return false;
            }
        });

    console.log(`📦 Found ${workflowDirs.length} workflow directories\n`);

    // Process workflows
    const workflows = [];
    let processed = 0;
    let skipped = 0;

    for (const dir of workflowDirs.slice(0, MAX_WORKFLOWS)) {
        const data = extractWorkflowData(dir, processed);

        if (!data) {
            skipped++;
            continue;
        }

        // Copy workflow JSON
        const jsonTarget = path.join(DIRS.json, `${data.id}.json`);
        const jsonSource = path.join(dir, data.workflowFile);
        try {
            fs.copyFileSync(jsonSource, jsonTarget);
        } catch (e) {
            skipped++;
            continue;
        }

        // Copy thumbnail
        if (data.thumbnailPath && data.thumbnailFile) {
            const imageTarget = path.join(DIRS.images, `${data.id}.webp`);
            try {
                fs.copyFileSync(data.thumbnailPath, imageTarget);
            } catch (e) {
                // Thumbnail is optional
            }
        }

        // Create workflow index entry
        workflows.push({
            id: data.id,
            title: data.title,
            description: data.description.substring(0, 200), // Limit description length
            author: data.metadata.user_username || 'Unknown',
            tags: data.tags,
            nodes: data.nodes,
            createdAt: new Date().toISOString(),
            updatedAt: new Date().toISOString(),
            views: 0,
            price: 0, // All workflows are free
            thumbnail: `/workflows/images/${data.id}.webp`,
            jsonPath: `/workflows/json/${data.id}.json`,
        });

        processed++;

        if (processed % 10 === 0) {
            console.log(`✅ Processed ${processed}/${MAX_WORKFLOWS} workflows...`);
        }
    }

    // Write index file
    const indexPath = path.join(DIRS.data, 'workflows.json');
    fs.writeFileSync(
        indexPath,
        JSON.stringify(workflows, null, 2)
    );

    console.log(`\n✨ Import complete!`);
    console.log(`📊 Processed: ${processed}`);
    console.log(`⚠️  Skipped: ${skipped}`);
    console.log(`📄 Index file: ${indexPath}`);
    console.log(`\n💡 Tip: Refresh your browser to see the new workflows!`);
}

// Run the script
processWorkflows();
