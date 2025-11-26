'use client';

import Link from 'next/link';
import { ChevronRight, Home } from 'lucide-react';

interface BreadcrumbItem {
    label: string;
    href?: string;
}

interface BreadcrumbsProps {
    items: BreadcrumbItem[];
    locale: string;
}

export default function Breadcrumbs({ items, locale }: BreadcrumbsProps) {
    return (
        <nav aria-label="Breadcrumb" className="mb-6">
            <ol className="flex items-center gap-2 text-sm text-secondary flex-wrap">
                {/* Home */}
                <li className="flex items-center gap-2">
                    <Link
                        href={`/${locale}` as any}
                        className="flex items-center gap-1 hover:text-brand transition-colors"
                    >
                        <Home className="w-4 h-4" />
                        <span>Home</span>
                    </Link>
                    {items.length > 0 && <ChevronRight className="w-4 h-4" />}
                </li>

                {/* Breadcrumb items */}
                {items.map((item, index) => {
                    const isLast = index === items.length - 1;

                    return (
                        <li key={index} className="flex items-center gap-2">
                            {item.href && !isLast ? (
                                <Link
                                    href={item.href as any}
                                    className="hover:text-brand transition-colors"
                                >
                                    {item.label}
                                </Link>
                            ) : (
                                <span className={isLast ? 'text-primary font-medium' : ''}>
                                    {item.label}
                                </span>
                            )}
                            {!isLast && <ChevronRight className="w-4 h-4" />}
                        </li>
                    );
                })}
            </ol>

            {/* Schema.org structured data */}
            <script
                type="application/ld+json"
                dangerouslySetInnerHTML={{
                    __html: JSON.stringify({
                        '@context': 'https://schema.org',
                        '@type': 'BreadcrumbList',
                        itemListElement: [
                            {
                                '@type': 'ListItem',
                                position: 1,
                                name: 'Home',
                                item: `${typeof window !== 'undefined' ? window.location.origin : ''}/${locale}`,
                            },
                            ...items.map((item, index) => ({
                                '@type': 'ListItem',
                                position: index + 2,
                                name: item.label,
                                ...(item.href && {
                                    item: `${typeof window !== 'undefined' ? window.location.origin : ''}${item.href}`,
                                }),
                            })),
                        ],
                    }),
                }}
            />
        </nav>
    );
}
