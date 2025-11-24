import Header from '@/components/Header'
import Tag from '@/components/Tag'
import ReviewList from '@/components/ReviewList'
import ReviewForm from '@/components/ReviewForm'
import Card from '@/components/ui/Card'
import { Check, Copy, Download, Share2 } from 'lucide-react'

async function getMessages(locale: string) {
    const mod = await import(`../../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function WorkflowPage({ params }: { params: { id: string; locale: string } }) {
    const t = await getMessages(params.locale)

    // Mock data
    const workflow = {
        id: params.id,
        title: params.id === 'rss' ? t.workflow_rss_title : t.workflow_github_title,
        description: params.id === 'rss' ? t.workflow_rss_desc : t.workflow_github_desc,
        price: params.id === 'rss' ? 0 : 9.9,
        author: { name: 'John Doe', avatar: 'https://i.pravatar.cc/150?u=john' },
        tags: ['Automation', 'Productivity'],
        version: '1.2.0',
        n8nVersion: '1.0+',
        updatedAt: '2024-01-15',
        reviews: [
            { id: 1, user: 'Alice', rating: 5, comment: 'Great workflow!', date: '2024-01-20' },
            { id: 2, user: 'Bob', rating: 4, comment: 'Works well but needs config.', date: '2024-01-18' }
        ],
        json: {
            name: params.id,
            nodes: [{ parameters: {}, name: "Start", type: "n8n-nodes-base.start" }]
        }
    }

    return (
        <div className="pb-20 space-y-6">
            <div className="grid lg:grid-cols-3 gap-6">
                {/* Left Column: Main Content */}
                <div className="lg:col-span-2 space-y-6">
                    <Card className="p-0 overflow-hidden bg-white/60">
                        <div className="h-64 bg-gray-100 relative">
                            <img src={`https://picsum.photos/seed/${params.id}/800/400`} alt={workflow.title} className="w-full h-full object-cover" />
                            <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
                            <div className="absolute bottom-6 left-6 text-white">
                                <h1 className="text-3xl font-bold font-averia mb-2">{workflow.title}</h1>
                                <div className="flex items-center gap-3 text-sm opacity-90">
                                    <img src={workflow.author.avatar} alt={workflow.author.name} className="w-6 h-6 rounded-full border border-white/50" />
                                    <span>by {workflow.author.name}</span>
                                    <span>•</span>
                                    <span>v{workflow.version}</span>
                                </div>
                            </div>
                        </div>
                        <div className="p-8">
                            <h2 className="text-xl font-bold text-primary mb-4">{t.description}</h2>
                            <p className="text-secondary leading-relaxed text-lg">{workflow.description}</p>
                        </div>
                    </Card>

                    <Card className="p-8 bg-white/60">
                        <h2 className="text-xl font-bold text-primary mb-6">{t.reviews}</h2>
                        <ReviewForm />
                        <div className="mt-8">
                            <ReviewList reviews={workflow.reviews} />
                        </div>
                    </Card>
                </div>

                {/* Right Column: Sidebar */}
                <div className="space-y-6">
                    <Card className="p-6 sticky top-24 bg-white/60">
                        <div className="flex items-baseline justify-between mb-8">
                            <span className="text-secondary font-medium">Price</span>
                            <span className="text-4xl font-bold text-primary font-averia">{workflow.price === 0 ? t.free : `$${workflow.price}`}</span>
                        </div>

                        <div className="space-y-3">
                            <button className="w-full py-4 rounded-full bg-brand text-white font-bold shadow-lg shadow-brand/20 hover:bg-teal-500 transition-all active:scale-95">
                                {workflow.price === 0 ? t.get_workflow : t.buy_now}
                            </button>
                            <button className="w-full py-4 rounded-full bg-white border border-white text-primary font-medium hover:bg-gray-50 transition-all active:scale-95 shadow-sm">
                                {t.preview}
                            </button>
                        </div>

                        <div className="mt-8 pt-8 border-t border-gray-200/50 space-y-4">
                            <div className="flex justify-between text-sm">
                                <span className="text-secondary">{t.n8n_version}</span>
                                <span className="font-medium text-primary bg-brand/10 text-brand px-2 py-0.5 rounded-md">{workflow.n8nVersion}</span>
                            </div>
                            <div className="flex justify-between text-sm">
                                <span className="text-secondary">{t.last_updated}</span>
                                <span className="font-medium text-primary">{workflow.updatedAt}</span>
                            </div>
                        </div>
                    </Card>

                    <Card className="p-6 bg-gray-900 text-white overflow-hidden">
                        <div className="flex justify-between items-center mb-4">
                            <span className="text-gray-400 text-sm font-mono">workflow.json</span>
                            <Copy className="w-4 h-4 text-gray-400 hover:text-white cursor-pointer transition-colors" />
                        </div>
                        <pre className="text-brand font-mono text-xs overflow-x-auto p-4 bg-black/30 rounded-2xl">
                            {JSON.stringify(workflow.json, null, 2)}
                        </pre>
                    </Card>
                </div>
            </div>
        </div>
    )
}
