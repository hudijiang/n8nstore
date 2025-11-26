import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import AdminClient from './AdminClient'

export default async function AdminPage({ params }: { params: { locale: string } }) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
        redirect(`/${params.locale}`)
    }

    // Check if user is admin (you can add admin check logic here)
    // For now, we'll allow any logged-in user to access admin

    // Get all workflows
    const { data: workflows } = await supabase
        .from('workflows')
        .select('*, workflow_translations(*), workflow_categories(categories(*))')
        .order('created_at', { ascending: false })

    // Get categories
    const { data: categories } = await supabase
        .from('categories')
        .select('*')
        .order('name')

    return (
        <div className="pb-20 space-y-6">
            <div className="flex items-center justify-between">
                <div>
                    <h1 className="text-3xl font-bold text-primary">后台管理</h1>
                    <p className="text-secondary mt-1">管理工作流和分类</p>
                </div>
            </div>

            <AdminClient
                workflows={workflows || []}
                categories={categories || []}
                locale={params.locale}
            />
        </div>
    )
}
