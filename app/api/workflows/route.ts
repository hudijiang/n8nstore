import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

// Force dynamic rendering to prevent build-time errors
export const dynamic = 'force-dynamic';

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
        // Build query - simplified to avoid complex joins
        let query = supabase
            .from('workflows')
            .select('*', { count: 'exact' })
            .eq('published', true);

        // Search filter
        if (search) {
            query = query.or(`title.ilike.%${search}%,description.ilike.%${search}%`);
        }

        // Category filter
        if (category) {
            // Note: This is tricky with the current schema because categories are in a separate table.
            // For now, we'll keep category filtering in memory or use a more complex join if needed.
            // But since the user asked about search, let's focus on search.
            // Actually, to do category filtering at DB level we'd need !inner join or similar.
            // Let's keep category filtering in memory for now as it wasn't the issue, 
            // BUT we must be careful because pagination happens before in-memory filtering.
            // Ideally ALL filtering should be DB level. 

            // However, the immediate fix for "search" is to add the search query.
            // Let's stick to the plan: Move Search to Database Query.
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

        const { data: workflows, error, count } = await query;

        if (error) {
            console.error('Database error:', error);
            return NextResponse.json(
                { error: 'Failed to fetch workflows', details: error.message },
                { status: 500 }
            );
        }

        // Fetch translations, categories, and nodes separately for each workflow
        const enrichedWorkflows = await Promise.all(
            (workflows || []).map(async (workflow) => {
                // Get translation
                const { data: translations } = await supabase
                    .from('workflow_translations')
                    .select('title, description')
                    .eq('workflow_id', workflow.id)
                    .eq('locale', locale)
                    .limit(1);

                // Get categories
                const { data: workflowCategories } = await supabase
                    .from('workflow_categories')
                    .select('category_id, categories(id, name, slug, icon)')
                    .eq('workflow_id', workflow.id);

                // Get nodes
                const { data: nodes } = await supabase
                    .from('workflow_nodes')
                    .select('node_type')
                    .eq('workflow_id', workflow.id);

                const translation = translations?.[0];

                return {
                    id: workflow.id,
                    title: translation?.title || workflow.title,
                    description: translation?.description || workflow.description,
                    author: workflow.author,
                    thumbnail: workflow.thumbnail_url,
                    jsonPath: workflow.json_url,
                    views: workflow.views,
                    price: workflow.price,
                    categories: workflowCategories?.map((wc: any) => wc.categories).filter(Boolean) || [],
                    nodes: nodes?.map((n: any) => n.node_type) || [],
                    createdAt: workflow.created_at,
                    updatedAt: workflow.updated_at,
                };
            })
        );

        // Apply category filter in memory if needed (LIMITATION: this still has the pagination issue for categories)
        // But we fixed the search issue.
        let filteredWorkflows = enrichedWorkflows;

        if (category) {
            filteredWorkflows = filteredWorkflows.filter(w =>
                w.categories.some((c: any) => c.slug === category)
            );
        }

        return NextResponse.json({
            workflows: filteredWorkflows,
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
