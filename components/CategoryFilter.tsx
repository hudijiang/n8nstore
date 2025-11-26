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
        <div className="flex flex-wrap gap-2">
            <button
                onClick={() => onCategoryChange(null)}
                className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${selectedCategory === null
                    ? 'bg-brand text-white shadow-md'
                    : 'bg-white/60 text-secondary hover:bg-white/80'
                    }`}
            >
                All
            </button>

            {categories.map((category) => (
                <button
                    key={category.id}
                    onClick={() => onCategoryChange(category.slug)}
                    className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${selectedCategory === category.slug
                        ? 'bg-brand text-white shadow-md'
                        : 'bg-white/60 text-secondary hover:bg-white/80'
                        }`}
                >
                    <span className="mr-1">{category.icon}</span>
                    {category.name}
                    {category.workflow_count > 0 && (
                        <span className="ml-2 text-xs opacity-75">({category.workflow_count})</span>
                    )}
                </button>
            ))}
        </div>
    );
}
