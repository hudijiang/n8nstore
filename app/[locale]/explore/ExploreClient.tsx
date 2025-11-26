'use client';

import { useState, useEffect } from 'react';
import WorkflowCard from '@/components/WorkflowCard';
import Card from '@/components/ui/Card';
import WorkflowSearch from '@/components/WorkflowSearch';
import CategoryFilter from '@/components/CategoryFilter';
import Breadcrumbs from '@/components/Breadcrumbs';
import AdSlot from '@/components/AdSlot';
import { Grid, List } from 'lucide-react';

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

interface ExploreClientProps {
    locale: string;
    translations: Record<string, string>;
}

export default function ExploreClient({ locale, translations }: ExploreClientProps) {
    const [workflows, setWorkflows] = useState<Workflow[]>([]);
    const [loading, setLoading] = useState(true);
    const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
    const [searchQuery, setSearchQuery] = useState('');
    const [sortBy, setSortBy] = useState('views');
    const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid');
    const [page, setPage] = useState(1);
    const [hasMore, setHasMore] = useState(true);

    useEffect(() => {
        async function fetchWorkflows() {
            setLoading(true);
            try {
                const params = new URLSearchParams({
                    locale,
                    sort: sortBy,
                    limit: '24',
                    offset: ((page - 1) * 24).toString(),
                    ...(selectedCategory && { category: selectedCategory }),
                    ...(searchQuery && { search: searchQuery }),
                });

                const response = await fetch(`/api/workflows?${params}`);
                const data = await response.json();

                if (data.workflows) {
                    if (page === 1) {
                        setWorkflows(data.workflows);
                    } else {
                        setWorkflows(prev => [...prev, ...data.workflows]);
                    }
                    setHasMore(data.workflows.length === 24);
                }
            } catch (error) {
                console.error('Error fetching workflows:', error);
            } finally {
                setLoading(false);
            }
        }

        fetchWorkflows();
    }, [locale, selectedCategory, searchQuery, sortBy, page]);

    // Reset page when filters change
    useEffect(() => {
        setPage(1);
    }, [selectedCategory, searchQuery, sortBy]);

    return (
        <div className="space-y-6 pb-20">
            {/* Breadcrumbs */}
            <Breadcrumbs
                locale={locale}
                items={[
                    { label: '探索' },
                ]}
            />

            {/* Header */}
            <Card className="w-full p-8 bg-white/60">
                <h1 className="text-4xl font-bold text-primary font-averia mb-2">
                    探索工作流
                </h1>
                <p className="text-lg text-secondary">
                    浏览所有可用的 n8n 工作流模板
                </p>
            </Card>

            {/* Top Ad Slot */}
            <div className="flex justify-center">
                <AdSlot size="leaderboard" />
            </div>

            {/* Filters and Controls */}
            <div className="space-y-4">
                {/* Category, Search, Sort, View Mode */}
                <div className="flex flex-col lg:flex-row gap-4 items-center">
                    {/* Category Filter */}
                    <div className="w-full lg:w-auto">
                        <CategoryFilter
                            selectedCategory={selectedCategory}
                            onCategoryChange={setSelectedCategory}
                        />
                    </div>

                    {/* Search */}
                    <div className="w-full lg:flex-1 max-w-md">
                        <WorkflowSearch
                            searchQuery={searchQuery}
                            onSearchChange={setSearchQuery}
                            placeholder="搜索工作流..."
                        />
                    </div>

                    {/* Sort */}
                    <div className="w-full lg:w-auto">
                        <select
                            value={sortBy}
                            onChange={(e) => setSortBy(e.target.value)}
                            className="w-full px-4 py-2.5 rounded-lg bg-white/60 border border-gray-200 text-sm font-medium text-secondary focus:outline-none focus:ring-2 focus:ring-brand/50 hover:bg-white/80 transition-colors"
                        >
                            <option value="views">最多浏览</option>
                            <option value="created_at">最新发布</option>
                            <option value="price">价格：低到高</option>
                        </select>
                    </div>

                    {/* View Mode Toggle */}
                    <div className="flex gap-2 bg-white/60 rounded-lg p-1 border border-gray-200">
                        <button
                            onClick={() => setViewMode('grid')}
                            className={`p-2 rounded-md transition-colors ${viewMode === 'grid'
                                ? 'bg-brand text-white'
                                : 'text-secondary hover:text-primary'
                                }`}
                        >
                            <Grid className="w-5 h-5" />
                        </button>
                        <button
                            onClick={() => setViewMode('list')}
                            className={`p-2 rounded-md transition-colors ${viewMode === 'list'
                                ? 'bg-brand text-white'
                                : 'text-secondary hover:text-primary'
                                }`}
                        >
                            <List className="w-5 h-5" />
                        </button>
                    </div>
                </div>

                {/* Results Count */}
                <div className="text-sm text-secondary">
                    找到 {workflows.length} 个工作流
                </div>
            </div>

            {/* Workflows Display */}
            {loading && page === 1 ? (
                <div className={viewMode === 'grid'
                    ? 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6'
                    : 'space-y-4'
                }>
                    {[...Array(8)].map((_, i) => (
                        <div
                            key={i}
                            className={viewMode === 'grid'
                                ? 'h-96 bg-white/30 rounded-2xl animate-pulse'
                                : 'h-32 bg-white/30 rounded-2xl animate-pulse'
                            }
                        />
                    ))}
                </div>
            ) : workflows.length > 0 ? (
                <>
                    <div className={viewMode === 'grid'
                        ? 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6'
                        : 'space-y-4'
                    }>
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

                    {/* Load More Button */}
                    {hasMore && (
                        <div className="flex justify-center pt-8">
                            <button
                                onClick={() => setPage(p => p + 1)}
                                disabled={loading}
                                className="px-8 py-3 rounded-full bg-brand text-white font-medium hover:bg-teal-500 transition-all shadow-md hover:shadow-lg disabled:opacity-50 disabled:cursor-not-allowed"
                            >
                                {loading ? '加载中...' : '加载更多'}
                            </button>
                        </div>
                    )}
                </>
            ) : (
                <Card className="p-12 text-center bg-white/60">
                    <p className="text-secondary text-lg">未找到工作流</p>
                    <p className="text-sm text-secondary mt-2">尝试调整筛选条件</p>
                </Card>
            )}
        </div>
    );
}
