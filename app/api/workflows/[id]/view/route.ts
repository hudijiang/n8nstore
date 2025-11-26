import { createClient } from '@supabase/supabase-js';
import { NextRequest, NextResponse } from 'next/server';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export async function POST(
    request: NextRequest,
    { params }: { params: { id: string } }
) {
    const { id } = params;

    const supabase = createClient(supabaseUrl, supabaseKey);

    try {
        // Get client info
        const userAgent = request.headers.get('user-agent') || '';
        const ipAddress = request.headers.get('x-forwarded-for') ||
            request.headers.get('x-real-ip') ||
            'unknown';

        // Record view
        const { error: viewError } = await supabase
            .from('workflow_views')
            .insert({
                workflow_id: id,
                ip_address: ipAddress,
                user_agent: userAgent,
            });

        if (viewError) {
            console.error('Error recording view:', viewError);
        }

        // Increment view count using database function
        const { error: incrementError } = await supabase
            .rpc('increment_workflow_views', { workflow_id_param: id });

        if (incrementError) {
            console.error('Error incrementing views:', incrementError);
            return NextResponse.json(
                { error: 'Failed to record view' },
                { status: 500 }
            );
        }

        return NextResponse.json({ success: true });

    } catch (error) {
        console.error('Unexpected error:', error);
        return NextResponse.json(
            { error: 'Internal server error' },
            { status: 500 }
        );
    }
}
