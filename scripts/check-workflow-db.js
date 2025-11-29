
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Load env vars from .env.local
dotenv.config({ path: path.resolve(__dirname, '../.env.local') });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY; // Or SERVICE_ROLE_KEY if needed for update, but ANON is fine for read usually if RLS allows, but for scripts usually need service role or anon with open policies. 
// Let's try with ANON first, if it fails we might need a service role key if user has one, but usually local dev has one.
// Actually, for backend scripts, we usually need the Service Role Key to bypass RLS, but let's see if ANON works for public read.

if (!supabaseUrl || !supabaseKey) {
    console.error('Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function checkWorkflow() {
    const id = '4448';
    console.log(`Checking workflow ${id}...`);

    const { data, error } = await supabase
        .from('workflows')
        .select('id, title, description')
        .eq('id', id)
        .single();

    if (error) {
        console.error('Error fetching workflow:', error);
        return;
    }

    console.log('Workflow Data:', data);

    // Also check translations
    const { data: translations, error: transError } = await supabase
        .from('workflow_translations')
        .select('*')
        .eq('workflow_id', id);

    if (transError) {
        console.error('Error fetching translations:', transError);
    } else {
        console.log('Translations:', translations);
    }
}

checkWorkflow();
