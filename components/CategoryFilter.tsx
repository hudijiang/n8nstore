'use client';

import { useEffect, useState } from 'react';

interface Category {
    id: number;
    name: string;
    slug: string;
    icon: string;
    count: number;
}

interface CategoryFilterProps {
    selectedCategory: string | null;
    onCategoryChange: (slug: string | null) => void;
}

export default function CategoryFilter({ selectedCategory, onCategoryChange }: CategoryFilterProps) {
    const [categories, setCategories] = useState<Category[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function fetchCategories() {
            try {
                const response = await fetch('/api/categories');
                if (response.ok) {
                    const data = await response.json();
                    setCategories(data);
                }
            } catch (error) {
                console.error('Error fetching categories:', error);
            } finally {
                setLoading(false);
            }
        }

        fetchCategories();
    }, []);

    if (loading) {
        return (
            <div className="flex gap-2 overflow-x-auto pb-2">
                {[...Array(6)].map((_, i) => (
                    <div
                        key={i}
                        className="px-5 py-2.5 rounded-full bg-white/30 animate-pulse"
                        style={{ width: '120px', height: '42px' }}
                    />
                ))}
            </div>
        );
    }

    return (
        <div className="flex gap-2 overflow-x-auto pb-2 scrollbar-hide">
            <button
                onClick={() => onCategoryChange(null)}
                className={`px-5 py-2.5 rounded-full text-sm font-medium transition-all whitespace-nowrap ${selectedCategory === null
                        ? 'bg-brand text-white shadow-lg shadow-brand/20'
                        : 'bg-white/50 text-secondary hover:bg-white hover:text-primary'
                    }`}
            >
                All
            </button>
            {categories.map((category) => (
                <button
                    key={category.id}
                    onClick={() => onCategoryChange(category.slug)}
                    className={`px-5 py-2.5 rounded-full text-sm font-medium transition-all whitespace-nowrap flex items-center gap-2 ${selectedCategory === category.slug
                            ? 'bg-brand text-white shadow-lg shadow-brand/20'
                            : 'bg-white/50 text-secondary hover:bg-white hover:text-primary'
                        }`}
                >
                    <span>{category.icon}</span>
                    <span>{category.name}</span>
                    {category.count > 0 && (
                        <span className="text-xs opacity-70">({category.count})</span>
                    )}
                </button>
            ))}
        </div>
    );
}
