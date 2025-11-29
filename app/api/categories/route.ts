import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

// Force dynamic rendering to prevent build-time errors
export const dynamic = 'force-dynamic';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function GET(request: NextRequest) {
    const supabase = createClient(supabaseUrl, supabaseKey);

    try {
        // Fetch all categories with workflow count
        const { data: categories, error } = await supabase
            .from('categories')
            .select(`
        *,
        workflow_categories(count)
      `)
            .order('name');

        if (error) {
            console.error('Database error:', error);
            return NextResponse.json(
                { error: 'Failed to fetch categories' },
                { status: 500 }
            );
        }

        // Transform data to include count
        const result = categories?.map(category => ({
            id: category.id,
            name: category.name,
            slug: category.slug,
            icon: category.icon,
            description: category.description,
            count: category.workflow_categories?.length || 0,
        })) || [];

        return NextResponse.json(result);

    } catch (error) {
        console.error('Unexpected error:', error);
        return NextResponse.json(
            { error: 'Internal server error' },
            { status: 500 }
        );
    }
}
