#!/usr/bin/env node

/**
 * Generate Chinese translations in smaller, manageable SQL files
 * Each file contains 500 workflows for easier AI translation
 */

import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('🌍 Generating Chinese translation batches...\n');

// Fetch all English translations
let allWorkflows = [];
let page = 0;
const PAGE_SIZE = 1000;
let hasMore = true;

while (hasMore) {
    const { data: workflows, error } = await supabase
        .from('workflow_translations')
        .select('workflow_id, title, description')
        .eq('locale', 'en')
        .order('workflow_id')
        .range(page * PAGE_SIZE, (page + 1) * PAGE_SIZE - 1);

    if (error) {
        console.error('❌ Error:', error.message);
        process.exit(1);
    }

    if (workflows && workflows.length > 0) {
        allWorkflows = allWorkflows.concat(workflows);
        page++;
        hasMore = workflows.length === PAGE_SIZE;
    } else {
        hasMore = false;
    }
}

console.log(`📦 Total workflows: ${allWorkflows.length}\n`);

// Create output directory
const OUTPUT_DIR = path.join(__dirname, '../supabase/migrations/translations_zh');
if (!fs.existsSync(OUTPUT_DIR)) {
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });
}

// Split into batches of 500
const BATCH_SIZE = 500;
const batches = [];

for (let i = 0; i < allWorkflows.length; i += BATCH_SIZE) {
    batches.push(allWorkflows.slice(i, i + BATCH_SIZE));
}

console.log(`📝 Creating ${batches.length} SQL batch files...\n`);

// Generate each batch file
batches.forEach((batch, batchIndex) => {
    let sql = `-- Chinese translations batch ${batchIndex + 1}/${batches.length}
-- Workflows: ${batch[0].workflow_id} to ${batch[batch.length - 1].workflow_id}
-- Count: ${batch.length}
--
-- INSTRUCTIONS FOR AI TRANSLATION:
-- 1. Translate all English titles and descriptions to Chinese
-- 2. Keep the SQL structure intact
-- 3. Only modify the text between single quotes after 'zh', 
-- 4. Preserve special characters and formatting
--
-- Example:
-- BEFORE: VALUES ('123', 'zh', 'AI Email Assistant', 'This workflow automates...')
-- AFTER:  VALUES ('123', 'zh', 'AI 邮件助手', '此工作流自动化...')

BEGIN;

`;

    batch.forEach((workflow, index) => {
        const titleEn = workflow.title.replace(/'/g, "''");
        const descEn = workflow.description.replace(/'/g, "''");

        sql += `-- [${batchIndex * BATCH_SIZE + index + 1}] Workflow ID: ${workflow.workflow_id}
-- EN Title: ${workflow.title.substring(0, 80)}${workflow.title.length > 80 ? '...' : ''}
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('${workflow.workflow_id}', 'zh', '${titleEn}', '${descEn}')
ON CONFLICT (workflow_id, locale) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

`;
    });

    sql += `COMMIT;\n`;

    const filename = `zh_batch_${String(batchIndex + 1).padStart(2, '0')}.sql`;
    fs.writeFileSync(path.join(OUTPUT_DIR, filename), sql);

    const sizeMB = (sql.length / (1024 * 1024)).toFixed(2);
    console.log(`✅ ${filename} (${batch.length} workflows, ${sizeMB} MB)`);
});

// Create merge script
const mergeScript = `#!/bin/bash
# Merge all translated batch files into one

cat zh_batch_*.sql > ../translations_chinese_complete.sql

echo "✅ Merged all batches into translations_chinese_complete.sql"
`;

fs.writeFileSync(path.join(OUTPUT_DIR, 'merge.sh'), mergeScript);
fs.chmodSync(path.join(OUTPUT_DIR, 'merge.sh'), '755');

// Create README
const readme = `# Chinese Translation Batches

## Files

- \`zh_batch_01.sql\` to \`zh_batch_${String(batches.length).padStart(2, '0')}.sql\` - Translation batches
- \`merge.sh\` - Script to merge all batches

## Translation Workflow

### Step 1: Translate Each Batch

For each file (zh_batch_01.sql to zh_batch_${String(batches.length).padStart(2, '0')}.sql):

1. Open the file
2. Ask AI: "Please translate all English text in this SQL file to Chinese. Only translate the text between single quotes after 'zh', keep all SQL syntax unchanged."
3. Save the translated file

### Step 2: Merge Batches

After all batches are translated:

\`\`\`bash
cd supabase/migrations/translations_zh
./merge.sh
\`\`\`

This creates \`translations_chinese_complete.sql\` with all 6,217 translations.

### Step 3: Import to Database

Import the merged file to Supabase SQL Editor.

## Tips

- Translate batches in order (01, 02, 03...)
- Verify each batch before moving to next
- You can translate multiple batches in parallel
- Each batch is independent

## Progress Tracking

- [ ] zh_batch_01.sql (500 workflows)
- [ ] zh_batch_02.sql (500 workflows)
- [ ] zh_batch_03.sql (500 workflows)
- [ ] zh_batch_04.sql (500 workflows)
- [ ] zh_batch_05.sql (500 workflows)
- [ ] zh_batch_06.sql (500 workflows)
- [ ] zh_batch_07.sql (500 workflows)
- [ ] zh_batch_08.sql (500 workflows)
- [ ] zh_batch_09.sql (500 workflows)
- [ ] zh_batch_10.sql (500 workflows)
- [ ] zh_batch_11.sql (500 workflows)
- [ ] zh_batch_12.sql (500 workflows)
- [ ] zh_batch_13.sql (217 workflows)

Total: ${allWorkflows.length} workflows
`;

fs.writeFileSync(path.join(OUTPUT_DIR, 'README.md'), readme);

console.log(`\n✅ All files created in: ${OUTPUT_DIR}`);
console.log(`\n📌 Next steps:`);
console.log(`   1. Translate each batch file using AI`);
console.log(`   2. Run: cd ${OUTPUT_DIR} && ./merge.sh`);
console.log(`   3. Import merged file to Supabase`);
console.log(`\n💡 I can help translate the first batch now if you'd like!`);
