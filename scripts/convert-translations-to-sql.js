#!/usr/bin/env node

/**
 * Convert translated JSON files to SQL INSERT statements
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const TRANSLATIONS_DIR = path.join(__dirname, '../supabase/migrations/translations');
const OUTPUT_FILE = path.join(__dirname, '../supabase/migrations/chinese_translations.sql');

console.log('🔄 Converting translations to SQL...\n');

// Find all translated JSON files
const files = fs.readdirSync(TRANSLATIONS_DIR)
    .filter(f => f.endsWith('_to_translate.json'))
    .sort();

console.log(`📁 Found ${files.length} batch files\n`);

let sql = `-- Chinese translations for workflows
-- Generated: ${new Date().toISOString()}

BEGIN;

`;

let totalTranslated = 0;
let totalSkipped = 0;

files.forEach((filename, index) => {
    const filepath = path.join(TRANSLATIONS_DIR, filename);
    const data = JSON.parse(fs.readFileSync(filepath, 'utf8'));

    let batchTranslated = 0;
    let batchSkipped = 0;

    data.forEach(item => {
        if (item.title_zh && item.description_zh) {
            // Escape single quotes
            const titleZh = item.title_zh.replace(/'/g, "''");
            const descZh = item.description_zh.replace(/'/g, "''");

            sql += `INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('${item.workflow_id}', 'zh', '${titleZh}', '${descZh}')
ON CONFLICT (workflow_id, locale) DO UPDATE SET
  title = EXCLUDED.title,
  description = EXCLUDED.description;

`;
            batchTranslated++;
        } else {
            batchSkipped++;
        }
    });

    totalTranslated += batchTranslated;
    totalSkipped += batchSkipped;

    const status = batchSkipped === 0 ? '✅' : '⚠️';
    console.log(`${status} ${filename}: ${batchTranslated} translated, ${batchSkipped} skipped`);
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

console.log(`\n📊 Summary:`);
console.log(`   ✅ Translated: ${totalTranslated}`);
console.log(`   ⚠️  Skipped: ${totalSkipped}`);
console.log(`\n✅ SQL file created: ${OUTPUT_FILE}`);
console.log(`\n📌 Next step:`);
console.log(`   Import to Supabase SQL Editor`);
