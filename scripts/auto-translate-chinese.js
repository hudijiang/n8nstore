#!/usr/bin/env node

/**
 * Auto-translate workflows using Google Translate (free tier)
 * This script uses the unofficial Google Translate API
 */

import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';
import https from 'https';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

// Simple Google Translate function (no API key needed)
async function translateText(text, targetLang = 'zh-CN') {
    if (!text || text.length === 0) return '';

    const url = `https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=${targetLang}&dt=t&q=${encodeURIComponent(text)}`;

    return new Promise((resolve, reject) => {
        https.get(url, (res) => {
            let data = '';
            res.on('data', chunk => data += chunk);
            res.on('end', () => {
                try {
                    const parsed = JSON.parse(data);
                    const translated = parsed[0].map(item => item[0]).join('');
                    resolve(translated);
                } catch (e) {
                    resolve(text); // Fallback to original
                }
            });
        }).on('error', () => resolve(text));
    });
}

// Delay function to avoid rate limiting
const delay = ms => new Promise(resolve => setTimeout(resolve, ms));

async function main() {
    console.log('🌍 Auto-translating workflows to Chinese...\n');

    const supabase = createClient(supabaseUrl, supabaseKey);

    // Fetch all English translations
    let allWorkflows = [];
    let page = 0;
    const PAGE_SIZE = 1000;

    while (true) {
        const { data, error } = await supabase
            .from('workflow_translations')
            .select('workflow_id, title, description')
            .eq('locale', 'en')
            .order('workflow_id')
            .range(page * PAGE_SIZE, (page + 1) * PAGE_SIZE - 1);

        if (error || !data || data.length === 0) break;

        allWorkflows = allWorkflows.concat(data);
        console.log(`📥 Fetched ${allWorkflows.length} workflows...`);
        page++;

        if (data.length < PAGE_SIZE) break;
    }

    console.log(`\n📦 Total: ${allWorkflows.length} workflows\n`);
    console.log('🔄 Translating... (this will take ~30-60 minutes)\n');

    const OUTPUT_FILE = path.join(__dirname, '../supabase/migrations/translations_chinese_auto.sql');

    let sql = `-- Auto-translated Chinese translations
-- Generated: ${new Date().toISOString()}
-- Total: ${allWorkflows.length} workflows

BEGIN;

`;

    for (let i = 0; i < allWorkflows.length; i++) {
        const workflow = allWorkflows[i];

        // Translate title and description
        const titleZh = await translateText(workflow.title, 'zh-CN');
        const descZh = await translateText(workflow.description, 'zh-CN');

        // Escape quotes
        const titleEscaped = titleZh.replace(/'/g, "''");
        const descEscaped = descZh.replace(/'/g, "''");

        sql += `-- [${i + 1}/${allWorkflows.length}] ${workflow.workflow_id}
INSERT INTO workflow_translations (workflow_id, locale, title, description)
VALUES ('${workflow.workflow_id}', 'zh', '${titleEscaped}', '${descEscaped}')
ON CONFLICT (workflow_id, locale) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

`;

        if ((i + 1) % 50 === 0) {
            console.log(`✅ Translated ${i + 1} / ${allWorkflows.length} (${((i + 1) / allWorkflows.length * 100).toFixed(1)}%)`);
            // Save progress
            fs.writeFileSync(OUTPUT_FILE, sql + '\nCOMMIT;\n');
        }

        // Rate limiting: 1 request per 100ms
        await delay(100);
    }

    sql += `COMMIT;\n`;
    fs.writeFileSync(OUTPUT_FILE, sql);

    console.log(`\n✅ Translation complete!`);
    console.log(`📄 File: ${OUTPUT_FILE}`);
    console.log(`📊 Size: ${(fs.statSync(OUTPUT_FILE).size / (1024 * 1024)).toFixed(2)} MB`);
    console.log(`\n📌 Next step: Import to Supabase SQL Editor`);
}

main().catch(console.error);
