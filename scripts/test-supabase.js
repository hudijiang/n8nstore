#!/usr/bin/env node

/**
 * Test Supabase Connection
 */

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

console.log('Testing Supabase connection...');
console.log('URL:', supabaseUrl);
console.log('Key format:', supabaseKey?.substring(0, 20) + '...');

const supabase = createClient(supabaseUrl, supabaseKey);

async function testConnection() {
    try {
        console.log('\n1. Testing categories table...');
        const { data, error } = await supabase
            .from('categories')
            .select('*')
            .limit(1);

        if (error) {
            console.error('❌ Error:', error);
        } else {
            console.log('✅ Success! Found', data?.length || 0, 'categories');
            if (data && data.length > 0) {
                console.log('Sample:', data[0]);
            }
        }
    } catch (error) {
        console.error('❌ Exception:', error);
    }
}

testConnection();
