
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Load env vars
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkPublished() {
    console.log('Checking workflow counts...');

    // Count all
    const { count: total, error: err1 } = await supabase
        .from('workflows')
        .select('*', { count: 'exact', head: true });

    if (err1) console.error('Error counting total:', err1);
    else console.log(`Total workflows: ${total}`);

    // Count published
    const { count: published, error: err2 } = await supabase
        .from('workflows')
        .select('*', { count: 'exact', head: true })
        .eq('published', true);

    if (err2) console.error('Error counting published:', err2);
    else console.log(`Published workflows: ${published}`);

    // List first 5 workflows to see their status
    const { data: sample, error: err3 } = await supabase
        .from('workflows')
        .select('id, title, published')
        .limit(5);

    if (err3) console.error('Error fetching sample:', err3);
    else {
        console.log('Sample workflows:', sample);
    }
}

checkPublished();
