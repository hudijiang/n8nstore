import Card from '@/components/ui/Card'
import { Copy, Download } from 'lucide-react'
import { notFound } from 'next/navigation'
import Breadcrumbs from '@/components/Breadcrumbs'
import RelatedWorkflows from '@/components/RelatedWorkflows'
import AdSlot from '@/components/AdSlot'
import type { Metadata } from 'next'

async function getMessages(locale: string) {
    try {
        const mod = await import(`../../../../messages/${locale}.json`)
        return mod.default as Record<string, string>
    } catch (error) {
        console.error(`Error loading messages for ${locale}:`, error)
        return {}
    }
}

async function getWorkflow(id: string, locale: string) {
    try {
        // Force localhost:3000 for now as env var might be wrong
        const baseUrl = 'http://localhost:3000'
        // const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || 'http://localhost:3000'
        const response = await fetch(`${baseUrl}/api/workflows/${id}?locale=${locale}`, {
            cache: 'no-store'
        })

        if (!response.ok) {
            return null
        }

        return await response.json()
    } catch (error) {
        console.error('Error fetching workflow:', error)
        return null
    }
}

async function getWorkflowJSON(jsonUrl: string) {
    try {
        const baseUrl = 'http://localhost:3000'
        // const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || 'http://localhost:3000'
        const response = await fetch(`${baseUrl}${jsonUrl}`, {
            cache: 'no-store'
        })

        if (!response.ok) {
            return null
        }

        return await response.json()
    } catch (error) {
        console.error('Error fetching workflow JSON:', error)
        return null
    }
}

// Generate metadata for SEO
export async function generateMetadata({ params }: { params: { id: string; locale: string } }): Promise<Metadata> {
    const workflow = await getWorkflow(params.id, params.locale)

    if (!workflow) {
        return {
            title: 'Workflow Not Found',
        }
    }

    const title = `${workflow.title} - n8n Workflow Store`
    const description = workflow.description || `Download ${workflow.title} n8n workflow template`

    return {
        title,
        description,
        openGraph: {
            title,
            description,
            images: workflow.thumbnail_url ? [workflow.thumbnail_url] : [],
            type: 'website',
        },
        twitter: {
            card: 'summary_large_image',
            title,
            description,
            images: workflow.thumbnail_url ? [workflow.thumbnail_url] : [],
        },
    }
}

export default async function WorkflowPage({ params }: { params: { id: string; locale: string } }) {
    const t = await getMessages(params.locale)
    const workflow = await getWorkflow(params.id, params.locale)

    if (!workflow) {
        notFound()
    }

    const workflowJSON = workflow.json_url ? await getWorkflowJSON(workflow.json_url) : null

    // Get first category for breadcrumb
    const firstCategory = workflow.categories?.[0]

    return (
        <div className="pb-20 space-y-6">
            {/* Breadcrumbs */}
            <Breadcrumbs
                locale={params.locale}
                items={[
                    { label: t.nav_explore || 'Explore', href: `/${params.locale}/explore` },
                    { label: workflow.title },
                ]}
            />

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                {/* Main Content */}
                <div className="lg:col-span-2 space-y-6">
                    <Card className="p-0 overflow-hidden bg-white/60">
                        <div className="h-64 bg-gray-100 relative">
                            <img
                                src={workflow.thumbnail}
                                alt={workflow.title}
                                className="w-full h-full object-cover"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
                            <div className="absolute bottom-6 left-6 text-white">
                                <h1 className="text-3xl font-bold font-averia mb-2">{workflow.title}</h1>
                                <div className="flex items-center gap-3 text-sm opacity-90">
                                    <span>by {workflow.author}</span>
                                    <span>•</span>
                                    <span>{workflow.views} views</span>
                                </div>
                            </div>
                        </div>

                        <div className="p-6 space-y-6">
                            <div>
                                <h2 className="text-2xl font-bold text-primary mb-4">{t.description || '描述'}</h2>
                                <p className="text-secondary leading-relaxed whitespace-pre-wrap">
                                    {workflow.description}
                                </p>
                            </div>

                            {workflow.categories && workflow.categories.length > 0 && (
                                <div>
                                    <h3 className="text-lg font-semibold text-primary mb-3">{t.categories || 'Categories'}</h3>
                                    <div className="flex flex-wrap gap-2">
                                        {workflow.categories.map((category: any, index: number) => (
                                            <span
                                                key={index}
                                                className="px-4 py-2 rounded-full bg-brand/10 text-brand font-medium"
                                            >
                                                {category.icon} {category.name}
                                            </span>
                                        ))}
                                    </div>
                                </div>
                            )}

                            {workflow.nodes && workflow.nodes.length > 0 && (
                                <div>
                                    <h3 className="text-lg font-semibold text-primary mb-3">{t.nodes_used || 'Nodes Used'}</h3>
                                    <div className="flex flex-wrap gap-2">
                                        {workflow.nodes.slice(0, 10).map((node: any, index: number) => (
                                            <span
                                                key={index}
                                                className="px-3 py-1 rounded-full bg-gray-100 text-gray-600 text-sm font-mono"
                                            >
                                                {node.type}
                                            </span>
                                        ))}
                                        {workflow.nodes.length > 10 && (
                                            <span className="px-3 py-1 rounded-full bg-gray-100 text-gray-500 text-xs">
                                                +{workflow.nodes.length - 10} more
                                            </span>
                                        )}
                                    </div>
                                </div>
                            )}
                        </div>
                    </Card>
                </div>

                {/* Right Column: Sidebar */}
                <div className="space-y-6">
                    <Card className="p-6 bg-white/60">
                        <div className="flex items-baseline justify-between mb-8">
                            <span className="text-secondary font-medium">{t.price || 'Price'}</span>
                            <span className="text-4xl font-bold text-brand">
                                {workflow.price === 0 ? (t.free || '免费') : `$${workflow.price}`}
                            </span>
                        </div>

                        <button className="w-full py-4 rounded-xl bg-brand text-white font-medium hover:bg-teal-500 transition-all shadow-md hover:shadow-lg mb-4">
                            {t.get_workflow || '获取工作流'}
                        </button>

                        <div className="space-y-4 pt-4 border-t border-gray-200">
                            <div className="flex justify-between items-center">
                                <span className="text-secondary text-sm">{t.views || 'Views'}</span>
                                <span className="text-primary font-medium">{workflow.views}</span>
                            </div>
                            <div className="flex justify-between items-center">
                                <span className="text-secondary text-sm">{t.last_updated || '最后更新'}</span>
                                <span className="text-primary font-medium">
                                    {new Date(workflow.updatedAt).toLocaleDateString()}
                                </span>
                            </div>
                        </div>
                    </Card>

                    {workflowJSON && (
                        <Card className="p-6 bg-gray-900 text-white overflow-hidden">
                            <div className="flex justify-between items-center mb-4">
                                <span className="text-gray-400 text-sm font-mono">workflow.json</span>
                                <Copy className="w-4 h-4 text-gray-400 hover:text-white cursor-pointer transition-colors" />
                            </div>
                            <pre className="text-brand font-mono text-xs overflow-x-auto p-4 bg-black/30 rounded-2xl max-h-96">
                                {JSON.stringify(workflowJSON, null, 2)}
                            </pre>
                        </Card>
                    )}

                    {/* Ad Slot - Sidebar */}
                    <AdSlot size="square" className="mx-auto" />
                </div>
            </div>

            {/* Related Workflows */}
            <div className="mt-12">
                <RelatedWorkflows
                    workflowId={params.id}
                    categorySlug={firstCategory?.slug}
                    locale={params.locale}
                />
            </div>

            {/* Bottom Ad Slot */}
            <div className="flex justify-center mt-8">
                <AdSlot size="leaderboard" />
            </div>
        </div>
    )
}
