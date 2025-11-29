import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

// Force dynamic rendering to prevent build-time errors
export const dynamic = 'force-dynamic';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function GET(
    request: NextRequest,
    { params }: { params: { id: string } }
) {
    const { id } = params;
    const searchParams = request.nextUrl.searchParams;
    const locale = searchParams.get('locale') || 'en';

    const supabase = createClient(supabaseUrl, supabaseKey);

    try {
        // Fetch workflow with translations
        const { data: workflow, error } = await supabase
            .from('workflows')
            .select(`
        *,
        workflow_translations(locale, title, description),
        workflow_categories(
          categories(id, name, slug, icon)
        ),
        workflow_nodes(node_type, node_count)
      `)
            .eq('id', id)
            .eq('published', true)
            .single();

        if (error || !workflow) {
            return NextResponse.json(
                { error: 'Workflow not found' },
                { status: 404 }
            );
        }

        // Get translation for requested locale
        const translation = workflow.workflow_translations?.find(
            (t: any) => t.locale === locale
        ) || workflow.workflow_translations?.[0];

        // Transform data
        const result = {
            id: workflow.id,
            title: translation?.title || workflow.title,
            description: translation?.description || workflow.description,
            author: workflow.author,
            thumbnail: workflow.thumbnail_url,
            jsonPath: workflow.json_url,
            views: workflow.views,
            price: workflow.price,
            categories: workflow.workflow_categories?.map((wc: any) => wc.categories) || [],
            nodes: workflow.workflow_nodes?.map((wn: any) => ({
                type: wn.node_type,
                count: wn.node_count,
            })) || [],
            translations: workflow.workflow_translations || [],
            createdAt: workflow.created_at,
            updatedAt: workflow.updated_at,
        };

        return NextResponse.json(result);

    } catch (error) {
        console.error('Unexpected error:', error);
        return NextResponse.json(
            { error: 'Internal server error' },
            { status: 500 }
        );
    }
}
