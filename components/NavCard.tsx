'use client'

import Card from '@/components/ui/Card'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useState } from 'react'
import { motion } from 'framer-motion'
import { cn } from '@/lib/utils'
import { Home, Search, User, Settings, ShoppingBag } from 'lucide-react'

const list = [
    {
        icon: Home,
        label: 'Home',
        href: '/',
    },
    {
        icon: Search,
        label: 'Explore',
        href: '/explore', // We might map this to search or category
    },
    {
        icon: ShoppingBag,
        label: 'My Orders',
        href: '/user',
    },
    {
        icon: User,
        label: 'Profile',
        href: '/user',
    },
]

export default function NavCard() {
    const pathname = usePathname()
    const [hoveredIndex, setHoveredIndex] = useState<number | null>(null)

    // Simplified layout: Fixed sidebar on desktop, bottom bar on mobile? 
    // For 1:1 copy of the "floating" look, we'll position it relative to the viewport or grid.
    // Here we implement the "Full" form style from the reference.

    return (
        <Card className="flex flex-col p-6 w-[280px] h-[434px] sticky top-24 hidden lg:flex">
            <div className="flex items-center gap-3 mb-8">
                <div className="w-10 h-10 rounded-full bg-brand/20 flex items-center justify-center text-brand font-bold text-xl font-averia">
                    N
                </div>
                <div>
                    <div className="font-averia text-2xl leading-none font-medium text-primary">n8n Store</div>
                    <div className="text-brand mt-1 text-xs font-medium">Workflow Market</div>
                </div>
            </div>

            <div className="text-secondary text-sm uppercase mb-4">Menu</div>

            <div className="relative space-y-2">
                {hoveredIndex !== null && (
                    <motion.div
                        className="absolute rounded-full border bg-white/50"
                        layoutId="nav-hover"
                        initial={false}
                        animate={{
                            top: hoveredIndex * (52 + 8), // 52px height + 8px gap (approx)
                            left: 0,
                            width: '100%',
                            height: 52,
                        }}
                        transition={{
                            type: 'spring',
                            stiffness: 400,
                            damping: 30,
                        }}
                    />
                )}

                {list.map((item, index) => {
                    // Simple active check. For real app, use exact match or startsWith
                    const isActive = pathname === item.href || (item.href !== '/' && pathname.startsWith(item.href))

                    return (
                        <Link
                            key={item.href}
                            href={item.href as any}
                            className={cn(
                                'relative z-10 flex items-center gap-3 rounded-full px-5 py-3 transition-colors',
                                isActive ? 'text-primary font-medium' : 'text-secondary'
                            )}
                            onMouseEnter={() => setHoveredIndex(index)}
                            onMouseLeave={() => setHoveredIndex(null)}
                        >
                            <item.icon className={cn("w-6 h-6", isActive ? "text-brand" : "text-secondary")} />
                            <span>{item.label}</span>
                        </Link>
                    )
                })}
            </div>
        </Card>
    )
}
