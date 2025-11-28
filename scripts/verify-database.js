#!/usr/bin/env node

/**
 * Verify database import status
 * Checks workflows, translations, categories, and nodes
 */

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing Supabase credentials in .env.local');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('🔍 Verifying database import status...\n');

async function checkTable(tableName, description) {
    try {
        const { count, error } = await supabase
            .from(tableName)
            .select('*', { count: 'exact', head: true });

        if (error) {
            console.log(`❌ ${description}: Error - ${error.message}`);
            return 0;
        }

        console.log(`✅ ${description}: ${count?.toLocaleString() || 0} records`);
        return count || 0;
    } catch (err) {
        console.log(`❌ ${description}: ${err.message}`);
        return 0;
    }
}

async function checkTranslations() {
    try {
        const locales = ['en', 'zh', 'ja', 'de', 'fr', 'es'];
        console.log('\n📊 Translation breakdown by language:');

        for (const locale of locales) {
            const { count, error } = await supabase
                .from('workflow_translations')
                .select('*', { count: 'exact', head: true })
                .eq('locale', locale);

            if (error) {
                console.log(`   ${locale}: Error - ${error.message}`);
            } else {
                const icon = count > 0 ? '✅' : '❌';
                console.log(`   ${icon} ${locale.toUpperCase()}: ${count?.toLocaleString() || 0} translations`);
            }
        }
    } catch (err) {
        console.log(`❌ Error checking translations: ${err.message}`);
    }
}

async function sampleWorkflow() {
    try {
        console.log('\n📝 Sample workflow (ID: 4448):');

        const { data: workflow, error } = await supabase
            .from('workflows')
            .select(`
                id,
                title,
                description,
                author,
                price,
                views,
                workflow_translations(locale, title, description)
            `)
            .eq('id', '4448')
            .single();

        if (error) {
            console.log(`   ❌ Error: ${error.message}`);
            return;
        }

        console.log(`   Title: ${workflow.title}`);
        console.log(`   Author: ${workflow.author}`);
        console.log(`   Translations: ${workflow.workflow_translations?.length || 0}`);

        if (workflow.workflow_translations) {
            workflow.workflow_translations.forEach(t => {
                console.log(`      - ${t.locale}: ${t.title.substring(0, 50)}...`);
            });
        }
    } catch (err) {
        console.log(`   ❌ Error: ${err.message}`);
    }
}

async function main() {
    const workflowCount = await checkTable('workflows', 'Workflows');
    const translationCount = await checkTable('workflow_translations', 'Translations');
    const categoryCount = await checkTable('workflow_categories', 'Category mappings');
    const nodeCount = await checkTable('workflow_nodes', 'Node records');

    await checkTranslations();
    await sampleWorkflow();

    console.log('\n📊 Summary:');
    console.log(`   Expected workflows: 6,217`);
    console.log(`   Actual workflows: ${workflowCount.toLocaleString()}`);
    console.log(`   Match: ${workflowCount === 6217 ? '✅ YES' : '❌ NO'}`);

    console.log(`\n   Expected translations (en only): 6,217`);
    console.log(`   Actual translations: ${translationCount.toLocaleString()}`);

    if (translationCount === 6217) {
        console.log('   Status: ✅ English only (need to add other languages)');
    } else if (translationCount > 6217) {
        console.log('   Status: ✅ Multiple languages imported');
    } else {
        console.log('   Status: ❌ Incomplete import');
    }

    console.log('\n💡 Next steps:');
    if (workflowCount === 0) {
        console.log('   1. Import SQL file to Supabase');
        console.log('   2. Run: supabase db push');
    } else if (translationCount === workflowCount) {
        console.log('   1. Generate translations for other languages (zh, ja, de, fr, es)');
        console.log('   2. Import translation data');
    } else {
        console.log('   1. Database is ready!');
        console.log('   2. Test the application');
    }
}

main().catch(console.error);
