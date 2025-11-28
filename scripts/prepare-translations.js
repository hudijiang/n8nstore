#!/usr/bin/env node

/**
 * Generate Chinese translations for all workflows
 * This script will create SQL INSERT statements for Chinese translations
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

console.log('🌍 Generating Chinese translations...\n');

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

console.log(`\n📦 Total workflows to translate: ${allWorkflows.length}\n`);

const workflows = allWorkflows;

// This file will be used to store translations that need AI assistance
// For now, we'll create a template that can be filled in
const OUTPUT_DIR = path.join(__dirname, '../supabase/migrations/translations');
if (!fs.existsSync(OUTPUT_DIR)) {
    fs.mkdirSync(OUTPUT_DIR, { recursive: true });
}

// Split into batches of 100 for easier processing
const BATCH_SIZE = 100;
const batches = [];

for (let i = 0; i < workflows.length; i += BATCH_SIZE) {
    batches.push(workflows.slice(i, i + BATCH_SIZE));
}

console.log(`📝 Creating ${batches.length} translation batch files...\n`);

// Create a JSON file for each batch that can be translated
batches.forEach((batch, index) => {
    const batchData = batch.map(w => ({
        workflow_id: w.workflow_id,
        title_en: w.title,
        description_en: w.description,
        title_zh: '', // To be filled
        description_zh: '' // To be filled
    }));

    const filename = `batch_${String(index + 1).padStart(3, '0')}_to_translate.json`;
    fs.writeFileSync(
        path.join(OUTPUT_DIR, filename),
        JSON.stringify(batchData, null, 2)
    );

    console.log(`✅ Created ${filename} (${batch.length} workflows)`);
});

// Create README with instructions
const readme = `# Translation Workflow

## Files Created

${batches.length} JSON files containing workflows to translate.

## How to Translate

### Option 1: AI Assistant (Recommended)
Ask AI to translate each batch file:
- Open batch_001_to_translate.json
- Ask: "Please translate all title_en and description_en fields to Chinese and fill in title_zh and description_zh"
- Save the translated file

### Option 2: Manual Translation
Edit each JSON file and fill in the Chinese translations.

### Option 3: Translation API
Use Google Translate API or similar service to batch translate.

## After Translation

Run the conversion script to generate SQL:
\`\`\`bash
node scripts/convert-translations-to-sql.js
\`\`\`

This will create SQL INSERT statements from the translated JSON files.

## Import to Database

Execute the generated SQL file in Supabase SQL Editor.
`;

fs.writeFileSync(path.join(OUTPUT_DIR, 'README.md'), readme);

console.log(`\n✅ All batch files created in: ${OUTPUT_DIR}`);
console.log(`\n📌 Next steps:`);
console.log(`   1. Translate the JSON files (use AI assistant)`);
console.log(`   2. Run: node scripts/convert-translations-to-sql.js`);
console.log(`   3. Import the generated SQL to Supabase`);
