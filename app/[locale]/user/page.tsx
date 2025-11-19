import Header from '@/components/Header'

async function getMessages(locale: string) {
    const mod = await import(`../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function UserPage({ params }: { params: { locale: string } }) {
    const t = await getMessages(params.locale)

    // Mock user data
    const user = {
        name: 'Alex Chen',
        email: 'alex@example.com',
        avatar: 'https://ui-avatars.com/api/?name=Alex+Chen&background=0D8ABC&color=fff',
        joined: '2023-09-01'
    }

    const orders = [
        { id: 'ORD-001', date: '2023-10-01', item: 'GitHub Issue Notifier', amount: 9.99, status: 'Completed' },
        { id: 'ORD-002', date: '2023-10-05', item: 'SEO Analyzer', amount: 14.99, status: 'Completed' }
    ]

    return (
        <>
            <Header title={t.title} locale={params.locale} label={t.switch_language} />

            <main className="container py-12">
                <div className="flex flex-col md:flex-row gap-8">
                    {/* Sidebar */}
                    <aside className="w-full md:w-64 space-y-4">
                        <div className="bg-white/80 backdrop-blur-xl rounded-3xl p-6 shadow-apple-card border border-white/20 text-center">
                            <img src={user.avatar} alt={user.name} className="w-20 h-20 rounded-full mx-auto mb-4 shadow-md" />
                            <h2 className="font-semibold text-lg">{user.name}</h2>
                            <p className="text-sm text-gray-500">{user.email}</p>
                        </div>

                        <nav className="bg-white/80 backdrop-blur-xl rounded-3xl p-4 shadow-apple-card border border-white/20 space-y-1">
                            {[t.profile, t.my_workflows, t.orders, t.settings].map((item, i) => (
                                <button key={item} className={`w-full text-left px-4 py-3 rounded-xl transition-colors ${i === 0 ? 'bg-apple-blue text-white font-medium' : 'hover:bg-gray-50 text-gray-600'}`}>
                                    {item}
                                </button>
                            ))}
                        </nav>
                    </aside>

                    {/* Main Content */}
                    <div className="flex-1 space-y-8">
                        <div className="bg-white/80 backdrop-blur-xl rounded-3xl p-8 shadow-apple-card border border-white/20">
                            <h2 className="text-2xl font-bold mb-6">{t.recent_orders}</h2>
                            <div className="overflow-x-auto">
                                <table className="w-full">
                                    <thead>
                                        <tr className="text-left border-b border-gray-100">
                                            <th className="pb-4 font-medium text-gray-500 pl-4">{t.order_id}</th>
                                            <th className="pb-4 font-medium text-gray-500">{t.item}</th>
                                            <th className="pb-4 font-medium text-gray-500">{t.date}</th>
                                            <th className="pb-4 font-medium text-gray-500">{t.amount}</th>
                                            <th className="pb-4 font-medium text-gray-500 pr-4">{t.status}</th>
                                        </tr>
                                    </thead>
                                    <tbody className="text-sm">
                                        {orders.map((order) => (
                                            <tr key={order.id} className="border-b border-gray-50 last:border-0 hover:bg-gray-50/50 transition-colors">
                                                <td className="py-4 pl-4 font-mono text-gray-600">{order.id}</td>
                                                <td className="py-4 font-medium">{order.item}</td>
                                                <td className="py-4 text-gray-500">{order.date}</td>
                                                <td className="py-4 font-medium">${order.amount}</td>
                                                <td className="py-4 pr-4">
                                                    <span className="bg-green-100 text-green-700 px-2 py-1 rounded-full text-xs font-medium">
                                                        {order.status}
                                                    </span>
                                                </td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </>
    )
}
