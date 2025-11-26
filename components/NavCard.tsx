'use client'

import Card from '@/components/ui/Card'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useState, memo } from 'react'
import { motion } from 'framer-motion'
import { cn } from '@/lib/utils'
import { Home, Search, User, ShoppingBag, Globe, ChevronDown } from 'lucide-react'

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

const languages = [
    { code: 'en', label: 'English' },
    { code: 'zh', label: '中文' },
    { code: 'ja', label: '日本語' },
    { code: 'de', label: 'Deutsch' },
    { code: 'fr', label: 'Français' },
    { code: 'es', label: 'Español' },
]

function NavCard({ translations, locale, authButton }: NavCardProps) {
    const pathname = usePathname()
    const [showLanguages, setShowLanguages] = useState(false)
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
                        <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-secondary" />
                        <input
                            type="text"
                            placeholder={translations.search_workflows || 'Search workflows...'}
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="w-full pl-12 pr-4 py-2 rounded-full bg-white/50 border border-gray-200/50 text-sm text-primary placeholder:text-secondary focus:outline-none focus:ring-2 focus:ring-brand/50 focus:bg-white transition-all"
                        />
                    </div>
                </div>

                {/* Language Switcher */}
                <div
                    className="relative shrink-0"
                    onMouseEnter={() => setShowLanguages(true)}
                    onMouseLeave={() => setShowLanguages(false)}
                >
                    <button
                        className="flex items-center gap-2 px-4 py-2 rounded-full hover:bg-white/50 transition-colors text-secondary hover:text-primary"
                    >
                        <Globe className="w-5 h-5" />
                        <span className="text-sm font-medium">
                            {languages.find(l => l.code === currentLocale)?.label}
                        </span>
                        <ChevronDown className={cn(
                            "w-4 h-4 transition-transform",
                            showLanguages && "rotate-180"
                        )} />
                    </button>

                    {showLanguages && (
                        <motion.div
                            initial={{ opacity: 0, y: -10 }}
                            animate={{ opacity: 1, y: 0 }}
                            className="absolute right-0 top-full pt-2 pb-2"
                        >
                            <div className="bg-white rounded-[20px] shadow-glass-card border border-gray-200/50 py-2 min-w-[150px]">
                                {languages.map((lang) => {
                                    const newPath = pathname.replace(`/${currentLocale}`, `/${lang.code}`)
                                    const isCurrentLang = lang.code === currentLocale

                                    return (
                                        <Link
                                            key={lang.code}
                                            href={newPath as any}
                                            className={cn(
                                                'block px-4 py-2 text-sm transition-colors',
                                                isCurrentLang
                                                    ? 'bg-brand/10 text-brand font-medium'
                                                    : 'text-secondary hover:bg-gray-50 hover:text-primary'
                                            )}
                                        >
                                            {lang.label}
                                        </Link>
                                    )
                                })}
                            </div>
                        </motion.div>
                    )}
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
