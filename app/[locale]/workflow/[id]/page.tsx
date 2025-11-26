import Card from '@/components/ui/Card'
import { Copy, Download } from 'lucide-react'
import { notFound } from 'next/navigation'

async function getMessages(locale: string) {
    const mod = await import(`../../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

async function getWorkflow(id: string, locale: string) {
    try {
        const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || 'http://localhost:3001'
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
        const baseUrl = process.env.NEXT_PUBLIC_BASE_URL || 'http://localhost:3001'
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

export default async function WorkflowPage({ params }: { params: { id: string; locale: string } }) {
    const t = await getMessages(params.locale)
    const workflow = await getWorkflow(params.id, params.locale)

    if (!workflow) {
        notFound()
    }

    const workflowJSON = await getWorkflowJSON(workflow.jsonPath)

    return (
        <div className="pb-20 space-y-6">
            <div className="grid lg:grid-cols-3 gap-6">
                {/* Left Column: Main Content */}
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
                        <div className="p-8">
                            <h2 className="text-xl font-bold text-primary mb-4">{t.description}</h2>
                            <p className="text-secondary leading-relaxed text-lg">{workflow.description}</p>

                            {/* Categories */}
                            {workflow.categories && workflow.categories.length > 0 && (
                                <div className="mt-6">
                                    <h3 className="text-sm font-medium text-secondary mb-3">Categories</h3>
                                    <div className="flex flex-wrap gap-2">
                                        {workflow.categories.map((category: any) => (
                                            <span
                                                key={category.id}
                                                className="px-3 py-1 rounded-full bg-brand/10 text-brand text-sm font-medium"
                                            >
                                                {category.icon} {category.name}
                                            </span>
                                        ))}
                                    </div>
                                </div>
                            )}

                            {/* Nodes */}
                            {workflow.nodes && workflow.nodes.length > 0 && (
                                <div className="mt-6">
                                    <h3 className="text-sm font-medium text-secondary mb-3">Nodes Used</h3>
                                    <div className="flex flex-wrap gap-2">
                                        {workflow.nodes.slice(0, 10).map((node: any, index: number) => (
                                            <span
                                                key={index}
                                                className="px-3 py-1 rounded-full bg-gray-100 text-gray-700 text-xs font-mono"
                                            >
                                                {typeof node === 'string' ? node : node.type}
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
                            <span className="text-secondary font-medium">Price</span>
                            <span className="text-4xl font-bold text-primary font-averia">
                                {workflow.price === 0 ? t.free : `$${workflow.price}`}
                            </span>
                        </div>

                        <div className="space-y-3">
                            <a
                                href={workflow.jsonPath}
                                download
                                className="w-full py-4 rounded-full bg-brand text-white font-bold shadow-lg shadow-brand/20 hover:bg-teal-500 transition-all active:scale-95 flex items-center justify-center gap-2"
                            >
                                <Download className="w-5 h-5" />
                                {workflow.price === 0 ? t.get_workflow : t.buy_now}
                            </a>
                        </div>

                        <div className="mt-8 pt-8 border-t border-gray-200/50 space-y-4">
                            <div className="flex justify-between text-sm">
                                <span className="text-secondary">Views</span>
                                <span className="font-medium text-primary">{workflow.views}</span>
                            </div>
                            <div className="flex justify-between text-sm">
                                <span className="text-secondary">{t.last_updated}</span>
                                <span className="font-medium text-primary">
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
                </div>
            </div>
        </div>
    )
}
