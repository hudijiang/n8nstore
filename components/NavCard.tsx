'use client'

import Card from '@/components/ui/Card'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useState, memo } from 'react'
import { cn } from '@/lib/utils'
import { Home, Search, User, ShoppingBag } from 'lucide-react'

interface NavCardProps {
    translations: Record<string, string>
    locale: string
    authButton: React.ReactNode
}

const getMenuList = (t: Record<string, string>) => [
    {
        icon: Home,
        label: t.nav_home || 'Home',
        href: '/',
    },
    {
        icon: Search,
        label: t.nav_explore || 'Explore',
        href: '/explore',
    },
    {
        icon: ShoppingBag,
        label: t.nav_orders || 'My Orders',
        href: '/user',
    },
    {
        icon: User,
        label: t.nav_profile || 'Profile',
        href: '/profile',
    },
]

function NavCard({ translations, locale, authButton }: NavCardProps) {
    const pathname = usePathname()
    const [searchQuery, setSearchQuery] = useState('')

    // Use the locale prop instead of extracting from pathname
    const currentLocale = locale
    const menuList = getMenuList(translations)

    return (
        <Card className="fixed top-0 left-0 right-0 z-50 mx-4 mt-4 px-6 py-4">
            <div className="flex items-center justify-between gap-6">
                {/* Logo */}
                <Link href={`/${currentLocale}` as any} className="flex items-center gap-3 shrink-0">
                    <div className="w-10 h-10 rounded-full bg-brand/20 flex items-center justify-center text-brand font-bold text-xl font-averia">
                        N
                    </div>
                    <div>
                        <div className="font-averia text-xl leading-none font-medium text-primary">n8n Store</div>
                        <div className="text-brand text-xs font-medium">Workflow Market</div>
                    </div>
                </Link>

                {/* Navigation Menu */}
                <nav className="flex items-center gap-2">
                    {menuList.map((item) => {
                        const fullPath = `/${currentLocale}${item.href}`
                        const isActive = pathname === fullPath || (item.href !== '/' && pathname.startsWith(fullPath))

                        return (
                            <Link
                                key={item.href}
                                href={fullPath as any}
                                className={cn(
                                    'flex items-center gap-2 px-4 py-2 rounded-full transition-colors',
                                    isActive
                                        ? 'bg-brand text-white font-medium'
                                        : 'text-secondary hover:bg-white/50 hover:text-primary'
                                )}
                            >
                                <item.icon className="w-5 h-5" />
                                <span className="text-sm">{item.label}</span>
                            </Link>
                        )
                    })}
                </nav>

                {/* Search Bar */}
                <div className="flex-1 max-w-md">
                    <div className="relative">
                        <Search
                            className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-secondary cursor-pointer hover:text-primary transition-colors"
                            onClick={() => {
                                if (searchQuery.trim()) {
                                    window.location.href = `/${currentLocale}?search=${encodeURIComponent(searchQuery)}`
                                }
                            }}
                        />
                        <input
                            type="text"
                            placeholder={translations.search_workflows || 'Search workflows...'}
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            onKeyDown={(e) => {
                                if (e.key === 'Enter' && searchQuery.trim()) {
                                    window.location.href = `/${currentLocale}?search=${encodeURIComponent(searchQuery)}`
                                }
                            }}
                            className="w-full pl-12 pr-4 py-2 rounded-full bg-white/50 border border-gray-200/50 text-sm text-primary placeholder:text-secondary focus:outline-none focus:ring-2 focus:ring-brand/50 focus:bg-white transition-all"
                        />
                    </div>
                </div>

                {/* Auth Button */}
                <div className="shrink-0">
                    {authButton}
                </div>
            </div>
        </Card>
    )
}

export default memo(NavCard)
