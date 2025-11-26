'use client';

import { useState, useEffect } from 'react';
import WorkflowCard from '@/components/WorkflowCard';
import Card from '@/components/ui/Card';
import WorkflowSearch from '@/components/WorkflowSearch';
import CategoryFilter from '@/components/CategoryFilter';

interface Workflow {
    id: string;
    title: string;
    description: string;
    author: string;
    thumbnail: string;
    jsonPath: string;
    views: number;
    price: number;
    categories: any[];
    nodes: string[];
}

interface HomeClientProps {
    locale: string;
    translations: Record<string, string>;
}

export default function HomeClient({ locale, translations }: HomeClientProps) {
    const [workflows, setWorkflows] = useState<Workflow[]>([]);
    const [loading, setLoading] = useState(true);
    const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
    const [searchQuery, setSearchQuery] = useState('');
    const [sortBy, setSortBy] = useState('views');

    useEffect(() => {
        async function fetchWorkflows() {
            setLoading(true);
            try {
                const params = new URLSearchParams({
                    locale,
                    sort: sortBy,
                    limit: '12',
                    ...(selectedCategory && { category: selectedCategory }),
                    ...(searchQuery && { search: searchQuery }),
                });

                const response = await fetch(`/api/workflows?${params}`);
                const data = await response.json();

                if (data.workflows) {
                    setWorkflows(data.workflows);
                }
            } catch (error) {
                console.error('Error fetching workflows:', error);
            } finally {
                setLoading(false);
            }
        }

        fetchWorkflows();
    }, [locale, selectedCategory, searchQuery, sortBy]);

    return (
        <div className="space-y-6 pb-20">
            {/* Hero Section */}
            <Card className="w-full p-8 flex flex-col items-center text-center space-y-4 bg-white/60">
                <h1 className="text-4xl md:text-5xl font-bold tracking-tight text-primary font-averia">
                    {translations.hero_title}
                </h1>
                <p className="text-lg text-secondary max-w-2xl">
                    {translations.hero_description}
                </p>
            </Card>

            {/* Category Filter */}
            <div className="flex items-center justify-center">
                <CategoryFilter
                    selectedCategory={selectedCategory}
                    onCategoryChange={setSelectedCategory}
                />
            </div>

            {/* Search and Sort Controls */}
            <div className="flex flex-col sm:flex-row gap-4 items-center justify-between">
                {/* Search */}
                <div className="w-full sm:w-auto sm:flex-1 max-w-md">
                    <WorkflowSearch
                        searchQuery={searchQuery}
                        onSearchChange={setSearchQuery}
                        placeholder={translations.search_placeholder || 'Search workflows...'}
                    />
                </div>

                {/* Sort */}
                <div className="w-full sm:w-auto">
                    <select
                        value={sortBy}
                        onChange={(e) => setSortBy(e.target.value as 'views' | 'created_at')}
                        className="w-full px-4 py-2.5 rounded-lg bg-white/60 border border-gray-200 text-sm font-medium text-secondary focus:outline-none focus:ring-2 focus:ring-brand/50 hover:bg-white/80 transition-colors"
                    >
                        <option value="views">{translations.sort_by_views || 'Most Viewed'}</option>
                        <option value="created_at">{translations.sort_by_newest || 'Latest'}</option>
                    </select>
                </div>
            </div>

            {/* Workflows Grid */}
            <div>
                <h2 className="text-2xl font-bold text-primary mb-4">
                    {selectedCategory
                        ? `${translations.category_workflows || 'Workflows'}`
                        : translations.featured_workflows || 'Featured Workflows'
                    }
                </h2>

                {loading ? (
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {[...Array(6)].map((_, i) => (
                            <div
                                key={i}
                                className="h-96 bg-white/30 rounded-2xl animate-pulse"
                            />
                        ))}
                    </div>
                ) : workflows.length > 0 ? (
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        {workflows.map((workflow) => (
                            <WorkflowCard
                                key={workflow.id}
                                id={workflow.id}
                                title={workflow.title}
                                description={workflow.description}
                                author={workflow.author}
                                price={workflow.price}
                                thumbnail={workflow.thumbnail}
                                tags={workflow.categories.map(c => c.name)}
                                locale={locale}
                            />
                        ))}
                    </div>
                ) : (
                    <div className="text-center py-12">
                        <p className="text-secondary text-lg">No workflows found</p>
                    </div>
                )}
            </div>
        </div>
    );
}
