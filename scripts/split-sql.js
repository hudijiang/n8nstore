#!/usr/bin/env node

/**
 * Split large SQL file into smaller batches for Supabase SQL Editor
 * Each batch will be small enough to execute without timeout
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const SQL_FILE = path.join(__dirname, '../supabase/migrations/import_workflows.sql');
const OUTPUT_DIR = path.join(__dirname, '../supabase/migrations/batches');

console.log('📦 Splitting SQL file into batches...\n');

// Create output directory
if (!fs.existsSync(OUTPUT_DIR)) {
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });
}

// Read SQL file
const sql = fs.readFileSync(SQL_FILE, 'utf8');

// Split by workflow (each workflow has a comment like "-- Workflow 1:")
const workflowBlocks = [];
let currentBlock = '';
let blockCount = 0;

const lines = sql.split('\n');
for (const line of lines) {
    if (line.startsWith('-- Workflow ') && currentBlock.length > 0) {
        workflowBlocks.push(currentBlock);
        currentBlock = '';
        blockCount++;
    }
    currentBlock += line + '\n';
}
if (currentBlock.length > 0) {
    workflowBlocks.push(currentBlock);
}

console.log(`Found ${workflowBlocks.length} workflow blocks\n`);

// Group into batches of 500 workflows each
const BATCH_SIZE = 500;
const batches = [];

for (let i = 0; i < workflowBlocks.length; i += BATCH_SIZE) {
    const batchBlocks = workflowBlocks.slice(i, i + BATCH_SIZE);
    const batchSql = `-- Batch ${Math.floor(i / BATCH_SIZE) + 1} (Workflows ${i + 1} to ${Math.min(i + BATCH_SIZE, workflowBlocks.length)})\n\nBEGIN;\n\n` +
        batchBlocks.join('\n') +
        `\nCOMMIT;\n`;

    batches.push(batchSql);
}

console.log(`Created ${batches.length} batches of ~${BATCH_SIZE} workflows each\n`);

// Write batch files
batches.forEach((batch, index) => {
    const filename = `batch_${String(index + 1).padStart(2, '0')}.sql`;
    const filepath = path.join(OUTPUT_DIR, filename);
    fs.writeFileSync(filepath, batch);

    const sizeMB = (batch.length / (1024 * 1024)).toFixed(2);
    console.log(`✅ ${filename} (${sizeMB} MB)`);
});

// Create cleanup file
const cleanupSql = `-- Cleanup existing data before import
-- Run this FIRST before importing batches

BEGIN;

DELETE FROM workflow_nodes;
DELETE FROM workflow_categories;
DELETE FROM workflow_translations;
DELETE FROM workflows;

COMMIT;

-- Verify cleanup
SELECT 
    (SELECT COUNT(*) FROM workflows) as workflows_count,
    (SELECT COUNT(*) FROM workflow_translations) as translations_count,
    (SELECT COUNT(*) FROM workflow_categories) as categories_count,
    (SELECT COUNT(*) FROM workflow_nodes) as nodes_count;
`;

fs.writeFileSync(path.join(OUTPUT_DIR, '00_cleanup.sql'), cleanupSql);
console.log(`✅ 00_cleanup.sql (cleanup script)`);

// Create instructions
const instructions = `# SQL Import Instructions

## Files Created

- \`00_cleanup.sql\` - Run this FIRST to clean existing data
- \`batch_01.sql\` to \`batch_${String(batches.length).padStart(2, '0')}.sql\` - Import batches

## Import Steps

### 1. Open Supabase Dashboard
Go to: https://supabase.com/dashboard/project/kvntpigiuwlpirwdmavb

### 2. Navigate to SQL Editor
Click on "SQL Editor" in the left sidebar

### 3. Run Cleanup (IMPORTANT!)
- Copy content of \`00_cleanup.sql\`
- Paste into SQL Editor
- Click "Run"
- Verify all counts are 0

### 4. Import Batches
For each batch file (01 to ${String(batches.length).padStart(2, '0')}):
- Copy content of \`batch_XX.sql\`
- Paste into SQL Editor
- Click "Run"
- Wait for completion (each batch takes ~30-60 seconds)
- Verify no errors

### 5. Verify Import
After all batches complete, run:
\`\`\`sql
SELECT COUNT(*) FROM workflows;
-- Should return: 6217

SELECT COUNT(*) FROM workflow_translations;
-- Should return: 6217

SELECT locale, COUNT(*) 
FROM workflow_translations 
GROUP BY locale;
-- Should show: en: 6217
\`\`\`

## Tips

- Import during low-traffic hours
- Don't close browser during import
- If a batch fails, you can re-run it
- Each batch is independent (uses ON CONFLICT)

## Estimated Time

- Cleanup: ~5 seconds
- Each batch: ~30-60 seconds
- Total: ~${Math.ceil(batches.length * 0.75)} minutes

## Troubleshooting

If you get timeout errors:
- Reduce BATCH_SIZE in this script to 250
- Re-run: \`node scripts/split-sql.js\`
- Import smaller batches

If you get duplicate key errors:
- Run cleanup script again
- Restart from batch_01.sql
`;

fs.writeFileSync(path.join(OUTPUT_DIR, 'README.md'), instructions);
console.log(`✅ README.md (instructions)`);

console.log(`\n✅ All files created in: ${OUTPUT_DIR}`);
console.log(`\n📝 Next steps:`);
console.log(`   1. Open Supabase SQL Editor`);
console.log(`   2. Run 00_cleanup.sql`);
console.log(`   3. Run batch_01.sql through batch_${String(batches.length).padStart(2, '0')}.sql`);
console.log(`   4. Verify with: SELECT COUNT(*) FROM workflows;`);
console.log(`\n⏱️  Estimated time: ~${Math.ceil(batches.length * 0.75)} minutes`);
