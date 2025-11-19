import Header from '@/components/Header'
import Tag from '@/components/Tag'
import ReviewList from '@/components/ReviewList'
import ReviewForm from '@/components/ReviewForm'

async function getMessages(locale: string) {
    const mod = await import(`../../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function WorkflowPage({ params }: { params: { locale: string; id: string } }) {
    const t = await getMessages(params.locale)

    // Mock data - in real app this would fetch from DB
    const workflow = {
        id: params.id,
        title: 'RSS to Telegram',
        price: 0,
        description: 'This workflow automatically monitors RSS feeds and sends new items to a specified Telegram channel. It handles deduplication and formatting.',
        tags: ['RSS', 'Telegram', 'Notify'],
        thumbnailUrl: 'https://picsum.photos/seed/rss/800/400',
        json: { name: 'rss_to_telegram', nodes: [] },
        author: { name: 'n8n Official', avatar: 'https://github.com/n8n-io.png' },
        version: '1.0.0',
        n8nVersion: '1.0+',
        updatedAt: '2023-10-15',
        reviews: [
            { id: '1', user: { name: 'John Doe' }, rating: 5, comment: 'Works perfectly! Saved me hours.', created_at: '2023-11-01' },
            { id: '2', user: { name: 'Jane Smith' }, rating: 4, comment: 'Good, but needs some configuration.', created_at: '2023-11-05' }
        ]
    }

    return (
        <>
            <Header title={t.title} locale={params.locale} label={t.switch_language} />

            <main className="container py-12">
                <div className="grid lg:grid-cols-3 gap-8">
                    {/* Left Column: Image & Info & Reviews */}
                    <div className="lg:col-span-2 space-y-8">
                        <div className="rounded-3xl overflow-hidden shadow-apple-card bg-white">
                            <img src={workflow.thumbnailUrl} alt={workflow.title} className="w-full h-[400px] object-cover" />
                        </div>

                        <div className="bg-white/80 backdrop-blur-xl rounded-3xl p-8 shadow-apple-card border border-white/20">
                            <h2 className="text-2xl font-semibold mb-4">{t.description}</h2>
                            <p className="text-gray-600 leading-relaxed text-lg">{workflow.description}</p>
                        </div>

                        {/* Reviews Section */}
                        <div className="space-y-6">
                            <h2 className="text-2xl font-semibold px-2">{t.reviews}</h2>
                            <ReviewForm />
                            <ReviewList reviews={workflow.reviews} />
                        </div>

                        {/* JSON Preview */}
                        <div className="bg-gray-900 rounded-3xl p-6 shadow-apple-card overflow-hidden">
                            <div className="flex justify-between items-center mb-4">
                                <span className="text-gray-400 text-sm font-mono">workflow.json</span>
                                <button className="text-xs bg-gray-800 text-gray-300 px-3 py-1 rounded-full hover:bg-gray-700">Copy</button>
                            </div>
                            <pre className="text-green-400 font-mono text-sm overflow-x-auto p-4 bg-black/30 rounded-xl">
                                {JSON.stringify(workflow.json, null, 2)}
                            </pre>
                        </div>
                    </div>

                    {/* Right Column: Actions & Meta */}
                    <div className="space-y-6">
                        <div className="bg-white/80 backdrop-blur-xl rounded-3xl p-6 shadow-apple-card border border-white/20 sticky top-24">
                            <h1 className="text-3xl font-bold text-gray-900 mb-2">{workflow.title}</h1>

                            <div className="flex items-center gap-3 mb-6">
                                <img src={workflow.author.avatar} alt={workflow.author.name} className="w-8 h-8 rounded-full" />
                                <span className="text-sm text-gray-600">by <span className="font-medium text-gray-900">{workflow.author.name}</span></span>
                            </div>

                            <div className="flex flex-wrap gap-2 mb-6">
                                {workflow.tags.map(tag => <Tag key={tag}>{tag}</Tag>)}
                            </div>

                            <div className="flex items-baseline gap-2 mb-8">
                                <span className="text-4xl font-bold text-gray-900">{workflow.price === 0 ? t.free : `$${workflow.price}`}</span>
                            </div>

                            <div className="space-y-3">
                                <button className="w-full py-4 rounded-full bg-apple-blue text-white font-semibold shadow-lg shadow-blue-500/30 hover:bg-blue-600 transition-all active:scale-95">
                                    {workflow.price === 0 ? t.get_workflow : t.buy_now}
                                </button>
                                <button className="w-full py-4 rounded-full bg-gray-100 text-gray-900 font-medium hover:bg-gray-200 transition-all active:scale-95">
                                    {t.preview}
                                </button>
                            </div>

                            <div className="mt-8 pt-8 border-t border-gray-100 space-y-4">
                                <div className="flex justify-between text-sm">
                                    <span className="text-gray-500">{t.version}</span>
                                    <span className="font-medium">{workflow.version}</span>
                                </div>
                                <div className="flex justify-between text-sm">
                                    <span className="text-gray-500">{t.n8n_version}</span>
                                    <span className="font-medium bg-blue-50 text-blue-600 px-2 py-0.5 rounded-full">{workflow.n8nVersion}</span>
                                </div>
                                <div className="flex justify-between text-sm">
                                    <span className="text-gray-500">{t.last_updated}</span>
                                    <span className="font-medium">{workflow.updatedAt}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </>
    )
}
