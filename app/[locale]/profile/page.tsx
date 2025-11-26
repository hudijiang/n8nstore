import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import { User, Mail, MapPin, Globe, Calendar, Edit2, Save, X } from 'lucide-react'
import ProfileClient from './ProfileClient'

async function getMessages(locale: string) {
    const mod = await import(`../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function ProfilePage({ params }: { params: { locale: string } }) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    if (!user) {
        redirect(`/${params.locale}`)
    }

    // Get user profile
    const { data: profile } = await supabase
        .from('user_profiles')
        .select('*')
        .eq('id', user.id)
        .single()

    // Get user stats
    const { data: purchases } = await supabase
        .from('user_purchases')
        .select('*')
        .eq('user_id', user.id)

    const { data: favorites } = await supabase
        .from('user_favorites')
        .select('*, workflows(*)')
        .eq('user_id', user.id)

    const t = await getMessages(params.locale)

    return (
        <div className="pb-20 space-y-6">
            <div className="flex items-center justify-between">
                <h1 className="text-3xl font-bold text-primary">个人资料</h1>
            </div>

            <div className="grid lg:grid-cols-3 gap-6">
                {/* Left Column: Profile Info */}
                <div className="lg:col-span-2 space-y-6">
                    <ProfileClient
                        user={user}
                        profile={profile}
                        locale={params.locale}
                    />

                    {/* Favorites */}
                    <Card className="p-6 bg-white/60">
                        <h2 className="text-xl font-bold text-primary mb-4">我的收藏</h2>
                        {favorites && favorites.length > 0 ? (
                            <div className="grid gap-4">
                                {favorites.map((fav: any) => (
                                    <div key={fav.workflow_id} className="flex items-center gap-4 p-4 rounded-xl bg-gray-50 hover:bg-gray-100 transition-colors">
                                        <img
                                            src={fav.workflows.thumbnail_url}
                                            alt={fav.workflows.title}
                                            className="w-16 h-16 rounded-lg object-cover"
                                        />
                                        <div className="flex-1">
                                            <h3 className="font-medium text-primary">{fav.workflows.title}</h3>
                                            <p className="text-sm text-secondary line-clamp-1">{fav.workflows.description}</p>
                                        </div>
                                        <a
                                            href={`/${params.locale}/workflow/${fav.workflow_id}`}
                                            className="px-4 py-2 rounded-lg bg-brand text-white text-sm font-medium hover:bg-teal-500 transition-colors"
                                        >
                                            查看
                                        </a>
                                    </div>
                                ))}
                            </div>
                        ) : (
                            <p className="text-secondary text-center py-8">暂无收藏</p>
                        )}
                    </Card>
                </div>

                {/* Right Column: Stats & Purchases */}
                <div className="space-y-6">
                    {/* Stats */}
                    <Card className="p-6 bg-white/60">
                        <h2 className="text-lg font-bold text-primary mb-4">统计信息</h2>
                        <div className="space-y-4">
                            <div className="flex items-center justify-between">
                                <span className="text-secondary">购买数量</span>
                                <span className="text-2xl font-bold text-brand">{purchases?.length || 0}</span>
                            </div>
                            <div className="flex items-center justify-between">
                                <span className="text-secondary">收藏数量</span>
                                <span className="text-2xl font-bold text-brand">{favorites?.length || 0}</span>
                            </div>
                            <div className="flex items-center justify-between">
                                <span className="text-secondary">总消费</span>
                                <span className="text-2xl font-bold text-brand">
                                    ${purchases?.reduce((sum: number, p: any) => sum + parseFloat(p.amount), 0).toFixed(2) || '0.00'}
                                </span>
                            </div>
                        </div>
                    </Card>

                    {/* Recent Purchases */}
                    <Card className="p-6 bg-white/60">
                        <h2 className="text-lg font-bold text-primary mb-4">最近购买</h2>
                        {purchases && purchases.length > 0 ? (
                            <div className="space-y-3">
                                {purchases.slice(0, 5).map((purchase: any) => (
                                    <div key={purchase.id} className="p-3 rounded-lg bg-gray-50">
                                        <div className="flex justify-between items-start mb-1">
                                            <span className="text-sm font-medium text-primary">工作流 #{purchase.workflow_id.substring(0, 8)}</span>
                                            <span className="text-sm font-bold text-brand">${purchase.amount}</span>
                                        </div>
                                        <span className="text-xs text-secondary">
                                            {new Date(purchase.purchased_at).toLocaleDateString()}
                                        </span>
                                    </div>
                                ))}
                            </div>
                        ) : (
                            <p className="text-secondary text-center py-4 text-sm">暂无购买记录</p>
                        )}
                    </Card>
                </div>
            </div>
        </div>
    )
}
