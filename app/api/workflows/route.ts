import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function GET(request: NextRequest) {
    const searchParams = request.nextUrl.searchParams;

    // Query parameters
    const locale = searchParams.get('locale') || 'en';
    const category = searchParams.get('category');
    const search = searchParams.get('search');
    const sort = searchParams.get('sort') || 'views'; // views, created_at
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '12');

    const supabase = createClient(supabaseUrl, supabaseKey);

    try {
        // Build query
        let query = supabase
            .from('workflows')
            .select(`
        *,
        workflow_translations!inner(title, description),
        workflow_categories(
          categories(id, name, slug, icon)
        ),
        workflow_nodes(node_type, node_count)
      `, { count: 'exact' })
            .eq('published', true)
            .eq('workflow_translations.locale', locale);

        // Category filter
        if (category) {
            query = query.eq('workflow_categories.categories.slug', category);
        }

        // Search filter
        if (search) {
            query = query.textSearch('workflow_translations.fts', search);
        }

        // Sorting
        if (sort === 'views') {
            query = query.order('views', { ascending: false });
        } else if (sort === 'created_at') {
            query = query.order('created_at', { ascending: false });
        }

        // Pagination
        const from = (page - 1) * limit;
        const to = from + limit - 1;
        query = query.range(from, to);

        const { data, error, count } = await query;

        if (error) {
            console.error('Database error:', error);
            return NextResponse.json(
                { error: 'Failed to fetch workflows' },
                { status: 500 }
            );
        }

        // Transform data
        const workflows = data?.map(workflow => ({
            id: workflow.id,
            title: workflow.workflow_translations[0]?.title || workflow.title,
            description: workflow.workflow_translations[0]?.description || workflow.description,
            author: workflow.author,
            thumbnail: workflow.thumbnail_url,
            jsonPath: workflow.json_url,
            views: workflow.views,
            price: workflow.price,
            categories: workflow.workflow_categories?.map((wc: any) => wc.categories) || [],
            nodes: workflow.workflow_nodes?.map((wn: any) => wn.node_type) || [],
            createdAt: workflow.created_at,
            updatedAt: workflow.updated_at,
        })) || [];

        return NextResponse.json({
            workflows,
            pagination: {
                page,
                limit,
                total: count || 0,
                totalPages: Math.ceil((count || 0) / limit),
            },
        });

    } catch (error) {
        console.error('Unexpected error:', error);
        return NextResponse.json(
            { error: 'Internal server error' },
            { status: 500 }
        );
    }
}
