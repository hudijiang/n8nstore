import Card from '@/components/ui/Card'

async function getMessages(locale: string) {
    const mod = await import(`../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function UserPage({ params }: { params: { locale: string } }) {
    const t = await getMessages(params.locale)

    return (
        <div className="pb-20">
            <div className="flex flex-col lg:flex-row gap-8">
                {/* Sidebar */}
                <aside className="w-full lg:w-64 shrink-0 space-y-6">
                    <Card className="p-6 flex flex-col items-center bg-white/60">
                        <div className="w-24 h-24 rounded-full bg-gradient-to-br from-brand to-teal-400 p-1 mb-4">
                            <img src="https://i.pravatar.cc/150?u=me" alt="User" className="w-full h-full rounded-full border-4 border-white" />
                        </div>
                        <h2 className="text-xl font-bold text-primary font-averia">Alex Chen</h2>
                        <p className="text-secondary text-sm">Pro Member</p>
                    </Card>

                    <Card className="p-2 bg-white/60">
                        <nav className="space-y-1">
                            {[t.profile, t.my_workflows, t.orders, t.settings].map((item, i) => (
                                <button key={item} className={`w-full text-left px-4 py-3 rounded-2xl transition-all font-medium ${i === 0 ? 'bg-brand text-white shadow-lg shadow-brand/20' : 'text-secondary hover:bg-white hover:text-primary'}`}>
                                    {item}
                                </button>
                            ))}
                        </nav>
                    </Card>
                </aside>

                {/* Main Content */}
                <div className="flex-1 space-y-8">
                    <Card className="p-8 bg-white/60">
                        <h2 className="text-2xl font-bold mb-6 font-averia text-primary">{t.recent_orders}</h2>
                        <div className="overflow-x-auto">
                            <table className="w-full">
                                <thead>
                                    <tr className="text-left border-b border-gray-200/50">
                                        <th className="pb-4 font-medium text-secondary pl-4">{t.order_id}</th>
                                        <th className="pb-4 font-medium text-secondary">{t.item}</th>
                                        <th className="pb-4 font-medium text-secondary">{t.date}</th>
                                        <th className="pb-4 font-medium text-secondary">{t.amount}</th>
                                        <th className="pb-4 font-medium text-secondary pr-4">{t.status}</th>
                                    </tr>
                                </thead>
                                <tbody className="text-sm">
                                    {[1, 2, 3].map((i) => (
                                        <tr key={i} className="border-b border-gray-100/50 hover:bg-white/50 transition-colors">
                                            <td className="py-4 pl-4 font-mono text-secondary">#ORD-2024-00{i}</td>
                                            <td className="py-4 font-medium text-primary">GitHub Issue Notifier</td>
                                            <td className="py-4 text-secondary">Jan {20 - i}, 2024</td>
                                            <td className="py-4 font-medium text-primary">$9.90</td>
                                            <td className="py-4 pr-4">
                                                <span className="px-2.5 py-1 rounded-full bg-green-100 text-green-700 text-xs font-bold">Paid</span>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </Card>
                </div>
            </div>
        </div>
    )
}
