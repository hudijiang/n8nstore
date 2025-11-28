#!/usr/bin/env node

/**
 * Generate complete Chinese translations SQL file
 * This creates ONE SQL file with ALL 6,217 Chinese translations
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

console.log('🌍 Generating complete Chinese translations SQL...\n');

// Fetch all English translations with pagination
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
        console.error('❌ Error fetching workflows:', error.message);
        process.exit(1);
    }

    if (workflows && workflows.length > 0) {
        allWorkflows = allWorkflows.concat(workflows);
        console.log(`📥 Fetched page ${page + 1}: ${workflows.length} workflows (total: ${allWorkflows.length})`);
        page++;
        hasMore = workflows.length === PAGE_SIZE;
    } else {
        hasMore = false;
    }
}

console.log(`\n📦 Total workflows: ${allWorkflows.length}`);
console.log(`\n🔄 Generating SQL with placeholder translations...\n`);

// Create SQL file
const OUTPUT_FILE = path.join(__dirname, '../supabase/migrations/translations_chinese.sql');

let sql = `-- Chinese translations for all workflows
-- Generated: ${new Date().toISOString()}
-- Total workflows: ${allWorkflows.length}
--
-- NOTE: This file contains placeholder translations
-- You can use AI to translate in batches by editing this file
--
-- Format: Each INSERT statement has:
--   - workflow_id
--   - locale: 'zh'
--   - title: Chinese translation (currently same as English)
--   - description: Chinese translation (currently same as English)

BEGIN;

`;

// Generate INSERT statements
allWorkflows.forEach((workflow, index) => {
    // Escape single quotes
    const titleEn = workflow.title.replace(/'/g, "''");
    const descEn = workflow.description.replace(/'/g, "''");

    // For now, use English as placeholder - will be replaced by AI translation
    const titleZh = titleEn; // TODO: Translate to Chinese
    const descZh = descEn;   // TODO: Translate to Chinese

    sql += `-- Workflow ${index + 1}: ${workflow.workflow_id}
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('${workflow.workflow_id}', 'zh', '${titleZh}', '${descZh}')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

`;

    if ((index + 1) % 500 === 0) {
        console.log(`✅ Generated ${index + 1} / ${allWorkflows.length} translations`);
    }
});

sql += `
COMMIT;

-- Verify import
SELECT locale, COUNT(*) as count
FROM workflow_translations
GROUP BY locale
ORDER BY locale;
`;

fs.writeFileSync(OUTPUT_FILE, sql);

console.log(`\n✅ SQL file created: ${OUTPUT_FILE}`);
console.log(`📊 File size: ${(fs.statSync(OUTPUT_FILE).size / (1024 * 1024)).toFixed(2)} MB`);
console.log(`\n📌 Next steps:`);
console.log(`   1. Use AI to translate the SQL file in batches`);
console.log(`   2. Replace English text with Chinese translations`);
console.log(`   3. Import to Supabase SQL Editor`);
console.log(`\n💡 Tip: You can ask AI to translate sections of the file`);
console.log(`   Example: "Translate lines 1-1000 from English to Chinese"`);
