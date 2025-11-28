#!/usr/bin/env node

/**
 * Comprehensive database verification
 * Checks data integrity, duplicates, and completeness
 */

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('🔍 Comprehensive Database Verification\n');
console.log('='.repeat(60) + '\n');

async function checkCounts() {
    console.log('📊 1. Record Counts\n');

    const tables = [
        { name: 'workflows', expected: 6217 },
        { name: 'workflow_translations', expected: 6217 },
        { name: 'workflow_categories', expected: null },
        { name: 'workflow_nodes', expected: null }
    ];

    const results = {};

    for (const table of tables) {
        const { count, error } = await supabase
            .from(table.name)
            .select('*', { count: 'exact', head: true });

        if (error) {
            console.log(`   ❌ ${table.name}: Error - ${error.message}`);
            results[table.name] = 0;
        } else {
            const status = table.expected && count === table.expected ? '✅' :
                table.expected && count < table.expected ? '⚠️' :
                    table.expected && count > table.expected ? '❗' : '✅';
            console.log(`   ${status} ${table.name}: ${count?.toLocaleString() || 0}${table.expected ? ` (expected: ${table.expected.toLocaleString()})` : ''}`);
            results[table.name] = count || 0;
        }
    }

    console.log('');
    return results;
}

async function checkDuplicates() {
    console.log('🔎 2. Duplicate Check\n');

    // Check for duplicate workflow IDs
    const { data: workflows } = await supabase
        .from('workflows')
        .select('id');

    if (workflows) {
        const ids = workflows.map(w => w.id);
        const uniqueIds = new Set(ids);
        const duplicateCount = ids.length - uniqueIds.size;

        if (duplicateCount === 0) {
            console.log('   ✅ No duplicate workflow IDs');
        } else {
            console.log(`   ❌ Found ${duplicateCount} duplicate workflow IDs`);

            // Find which IDs are duplicated
            const idCounts = {};
            ids.forEach(id => {
                idCounts[id] = (idCounts[id] || 0) + 1;
            });
            const dups = Object.entries(idCounts).filter(([_, count]) => count > 1);
            console.log(`   Duplicated IDs: ${dups.map(([id, count]) => `${id}(${count}x)`).join(', ')}`);
        }
    }

    // Check for duplicate translations
    const { data: translations } = await supabase
        .from('workflow_translations')
        .select('workflow_id, locale');

    if (translations) {
        const keys = translations.map(t => `${t.workflow_id}-${t.locale}`);
        const uniqueKeys = new Set(keys);
        const dupCount = keys.length - uniqueKeys.size;

        if (dupCount === 0) {
            console.log('   ✅ No duplicate translations');
        } else {
            console.log(`   ❌ Found ${dupCount} duplicate translations`);
        }
    }

    console.log('');
}

async function checkTranslations() {
    console.log('🌍 3. Translation Coverage\n');

    const locales = ['en', 'zh', 'ja', 'de', 'fr', 'es'];

    for (const locale of locales) {
        const { count } = await supabase
            .from('workflow_translations')
            .select('*', { count: 'exact', head: true })
            .eq('locale', locale);

        const icon = count > 0 ? '✅' : '❌';
        const percentage = count ? ((count / 6217) * 100).toFixed(1) : '0.0';
        console.log(`   ${icon} ${locale.toUpperCase()}: ${count?.toLocaleString() || 0} (${percentage}%)`);
    }

    console.log('');
}

async function checkDataIntegrity() {
    console.log('🔧 4. Data Integrity\n');

    // Check for workflows without translations
    const { data: noTranslations } = await supabase
        .from('workflows')
        .select('id')
        .not('id', 'in', `(SELECT workflow_id FROM workflow_translations)`);

    if (noTranslations && noTranslations.length > 0) {
        console.log(`   ⚠️  ${noTranslations.length} workflows without translations`);
    } else {
        console.log('   ✅ All workflows have translations');
    }

    // Check for orphaned translations
    const { count: orphanedCount } = await supabase
        .from('workflow_translations')
        .select('*', { count: 'exact', head: true })
        .not('workflow_id', 'in', `(SELECT id FROM workflows)`);

    if (orphanedCount > 0) {
        console.log(`   ⚠️  ${orphanedCount} orphaned translations`);
    } else {
        console.log('   ✅ No orphaned translations');
    }

    // Check for null values
    const { count: nullTitles } = await supabase
        .from('workflows')
        .select('*', { count: 'exact', head: true })
        .is('title', null);

    if (nullTitles > 0) {
        console.log(`   ⚠️  ${nullTitles} workflows with null titles`);
    } else {
        console.log('   ✅ No null titles');
    }

    console.log('');
}

async function sampleData() {
    console.log('📝 5. Sample Data\n');

    // Get a random workflow
    const { data: workflows } = await supabase
        .from('workflows')
        .select(`
            id,
            title,
            author,
            price,
            views,
            workflow_translations(locale, title),
            workflow_categories(category_id),
            workflow_nodes(node_type)
        `)
        .limit(3);

    if (workflows && workflows.length > 0) {
        workflows.forEach((w, i) => {
            console.log(`   Sample ${i + 1}:`);
            console.log(`   ID: ${w.id}`);
            console.log(`   Title: ${w.title.substring(0, 50)}...`);
            console.log(`   Author: ${w.author}`);
            console.log(`   Translations: ${w.workflow_translations?.length || 0}`);
            console.log(`   Categories: ${w.workflow_categories?.length || 0}`);
            console.log(`   Nodes: ${w.workflow_nodes?.length || 0}`);
            console.log('');
        });
    }
}

async function checkIDRanges() {
    console.log('🔢 6. ID Range Analysis\n');

    const { data: minMax } = await supabase
        .from('workflows')
        .select('id')
        .order('id', { ascending: true })
        .limit(1);

    const { data: maxData } = await supabase
        .from('workflows')
        .select('id')
        .order('id', { ascending: false })
        .limit(1);

    if (minMax && maxData) {
        console.log(`   Smallest ID: ${minMax[0]?.id}`);
        console.log(`   Largest ID: ${maxData[0]?.id}`);
    }

    console.log('');
}

async function generateReport(counts) {
    console.log('='.repeat(60));
    console.log('\n📋 VERIFICATION SUMMARY\n');

    const workflowsOK = counts.workflows === 6217;
    const translationsOK = counts.workflow_translations === 6217;

    if (workflowsOK && translationsOK) {
        console.log('✅ DATABASE IMPORT SUCCESSFUL!\n');
        console.log('All expected records are present:');
        console.log(`   ✅ ${counts.workflows.toLocaleString()} workflows`);
        console.log(`   ✅ ${counts.workflow_translations.toLocaleString()} translations (English)`);
        console.log(`   ✅ ${counts.workflow_categories.toLocaleString()} category mappings`);
        console.log(`   ✅ ${counts.workflow_nodes.toLocaleString()} node records`);

        console.log('\n📌 Next Steps:');
        console.log('   1. ✅ Data import complete');
        console.log('   2. ⏳ Generate translations for other languages (zh, ja, de, fr, es)');
        console.log('   3. ⏳ Test application functionality');
        console.log('   4. ⏳ Deploy to production');
    } else {
        console.log('⚠️  IMPORT INCOMPLETE\n');

        if (!workflowsOK) {
            console.log(`   ❌ Workflows: ${counts.workflows} / 6217 (${((counts.workflows / 6217) * 100).toFixed(1)}%)`);
        }

        if (!translationsOK) {
            console.log(`   ❌ Translations: ${counts.workflow_translations} / 6217 (${((counts.workflow_translations / 6217) * 100).toFixed(1)}%)`);
        }

        console.log('\n💡 Recommendations:');
        console.log('   1. Check for failed batch imports');
        console.log('   2. Re-run missing batches');
        console.log('   3. Verify no errors in Supabase logs');
    }

    console.log('\n' + '='.repeat(60));
}

async function main() {
    try {
        const counts = await checkCounts();
        await checkDuplicates();
        await checkTranslations();
        await checkDataIntegrity();
        await sampleData();
        await checkIDRanges();
        await generateReport(counts);
    } catch (error) {
        console.error('\n❌ Verification failed:', error.message);
        process.exit(1);
    }
}

main();
