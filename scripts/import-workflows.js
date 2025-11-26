#!/usr/bin/env node

/**
 * Workflow Import Script
 * 
 * This script processes workflows from the n8nworkflows.xyz repository
 * and prepares them for use in the n8n Workflow Store.
 */

const fs = require('fs');
const path = require('path');

// Configuration
const SOURCE_DIR = '/tmp/n8nworkflows/archive/workflows';
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
        console.error(`Error reading ${filePath}:`, error.message);
        return null;
    }
}

/**
 * Extract workflow data from a workflow directory
 */
function extractWorkflowData(workflowDir) {
    const metadataPath = path.join(workflowDir, 'metadata.json');
    const workflowPath = path.join(workflowDir, 'workflow.json');

    const metadata = readJSON(metadataPath);
    const workflow = readJSON(workflowPath);

    if (!metadata || !workflow) {
        return null;
    }

    // Find the thumbnail image
    const files = fs.readdirSync(workflowDir);
    const thumbnail = files.find(f => f.endsWith('.webp'));

    return {
        id: path.basename(workflowDir),
        metadata,
        workflow,
        thumbnailPath: thumbnail ? path.join(workflowDir, thumbnail) : null,
    };
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
        .filter(dir => fs.statSync(dir).isDirectory());

    console.log(`📦 Found ${workflowDirs.length} workflows`);

    // Process workflows
    const workflows = [];
    let processed = 0;
    let skipped = 0;

    for (const dir of workflowDirs.slice(0, MAX_WORKFLOWS)) {
        const data = extractWorkflowData(dir);

        if (!data) {
            skipped++;
            continue;
        }

        // Copy workflow JSON
        const jsonTarget = path.join(DIRS.json, `${data.id}.json`);
        fs.copyFileSync(
            path.join(dir, 'workflow.json'),
            jsonTarget
        );

        // Copy thumbnail
        if (data.thumbnailPath) {
            const imageTarget = path.join(DIRS.images, `${data.id}.webp`);
            fs.copyFileSync(data.thumbnailPath, imageTarget);
        }

        // Create workflow index entry
        workflows.push({
            id: data.id,
            title: data.metadata.name || data.id,
            description: data.metadata.description || '',
            author: data.metadata.user?.username || 'Unknown',
            tags: data.metadata.tags || [],
            nodes: data.metadata.nodes || [],
            createdAt: data.metadata.createdAt,
            updatedAt: data.metadata.updatedAt,
            views: data.metadata.views || 0,
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
}

// Run the script
processWorkflows();
