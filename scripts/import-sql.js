#!/usr/bin/env node

/**
 * Import SQL file to Supabase using Node.js
 * Alternative to Supabase CLI when CLI is not available
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
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    console.error('❌ Missing Supabase credentials');
    console.error('Required: NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

const SQL_FILE = path.join(__dirname, '../supabase/migrations/import_workflows.sql');

console.log('🚀 Starting SQL import via Node.js...\n');
console.log(`📄 File: ${SQL_FILE}`);

// Check file exists
if (!fs.existsSync(SQL_FILE)) {
    console.error(`❌ SQL file not found: ${SQL_FILE}`);
    process.exit(1);
}

// Get file size
const stats = fs.statSync(SQL_FILE);
const fileSizeMB = (stats.size / (1024 * 1024)).toFixed(2);
console.log(`📊 File size: ${fileSizeMB} MB`);

// Read SQL file
console.log('\n📖 Reading SQL file...');
const sql = fs.readFileSync(SQL_FILE, 'utf8');

// Split into batches (Supabase has query size limits)
const statements = sql
    .split(';')
    .map(s => s.trim())
    .filter(s => s.length > 0 && !s.startsWith('--'));

console.log(`📦 Total SQL statements: ${statements.length.toLocaleString()}`);

// Execute in batches
const BATCH_SIZE = 100;
const batches = [];
for (let i = 0; i < statements.length; i += BATCH_SIZE) {
    batches.push(statements.slice(i, i + BATCH_SIZE));
}

console.log(`🔄 Batches: ${batches.length}`);
console.log('\n⏳ Starting import (this may take 5-10 minutes)...\n');

let successCount = 0;
let errorCount = 0;

for (let i = 0; i < batches.length; i++) {
    const batch = batches[i];
    const batchSql = batch.join(';\n') + ';';

    try {
        // Use rpc to execute raw SQL
        const { error } = await supabase.rpc('exec_sql', { sql_query: batchSql });

        if (error) {
            // If rpc doesn't exist, try direct query
            const response = await fetch(`${supabaseUrl}/rest/v1/rpc/exec_sql`, {
                method: 'POST',
                headers: {
                    'apikey': supabaseServiceKey,
                    'Authorization': `Bearer ${supabaseServiceKey}`,
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ sql_query: batchSql })
            });

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${await response.text()}`);
            }
        }

        successCount += batch.length;

        if ((i + 1) % 10 === 0) {
            const progress = ((i + 1) / batches.length * 100).toFixed(1);
            console.log(`✅ Progress: ${progress}% (${successCount.toLocaleString()} statements)`);
        }

    } catch (error) {
        errorCount += batch.length;
        console.error(`❌ Batch ${i + 1} failed:`, error.message);

        // Try to continue with next batch
        continue;
    }
}

console.log('\n📊 Import Summary:');
console.log(`   ✅ Success: ${successCount.toLocaleString()} statements`);
console.log(`   ❌ Errors: ${errorCount.toLocaleString()} statements`);

if (errorCount > 0) {
    console.log('\n⚠️  Some statements failed. This might be normal if:');
    console.log('   - Records already exist (ON CONFLICT clauses)');
    console.log('   - RPC function not available (need manual SQL execution)');
    console.log('\n💡 Alternative: Use psql or Supabase SQL Editor');
}

console.log('\n✅ Import process completed!');
console.log('\n🔍 Run verification:');
console.log('   node scripts/verify-database.js');
