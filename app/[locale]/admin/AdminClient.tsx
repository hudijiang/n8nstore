'use client';

import { useState } from 'react';
import Card from '@/components/ui/Card';
import { Plus, Edit2, Trash2, Search, Filter, Eye } from 'lucide-react';

interface AdminClientProps {
    workflows: any[];
    categories: any[];
    locale: string;
}

export default function AdminClient({ workflows, categories, locale }: AdminClientProps) {
    const [searchQuery, setSearchQuery] = useState('');
    const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
    const [showAddModal, setShowAddModal] = useState(false);

    const filteredWorkflows = workflows.filter(workflow => {
        const matchesSearch = workflow.title?.toLowerCase().includes(searchQuery.toLowerCase());
        const matchesCategory = !selectedCategory ||
            workflow.workflow_categories?.some((wc: any) => wc.categories?.slug === selectedCategory);
        return matchesSearch && matchesCategory;
    });

    return (
        <div className="space-y-6">
            {/* Stats Cards */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                <Card className="p-6 bg-white/60">
                    <div className="text-sm text-secondary mb-1">总工作流</div>
                    <div className="text-3xl font-bold text-brand">{workflows.length}</div>
                </Card>
                <Card className="p-6 bg-white/60">
                    <div className="text-sm text-secondary mb-1">已发布</div>
                    <div className="text-3xl font-bold text-green-600">
                        {workflows.filter(w => w.published).length}
                    </div>
                </Card>
                <Card className="p-6 bg-white/60">
                    <div className="text-sm text-secondary mb-1">草稿</div>
                    <div className="text-3xl font-bold text-orange-600">
                        {workflows.filter(w => !w.published).length}
                    </div>
                </Card>
                <Card className="p-6 bg-white/60">
                    <div className="text-sm text-secondary mb-1">分类数</div>
                    <div className="text-3xl font-bold text-purple-600">{categories.length}</div>
                </Card>
            </div>

            {/* Filters and Actions */}
            <Card className="p-6 bg-white/60">
                <div className="flex flex-col md:flex-row gap-4 items-center justify-between">
                    <div className="flex-1 w-full md:w-auto">
                        <div className="relative">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-secondary" />
                            <input
                                type="text"
                                value={searchQuery}
                                onChange={(e) => setSearchQuery(e.target.value)}
                                placeholder="搜索工作流..."
                                className="w-full pl-10 pr-4 py-2.5 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-brand/50"
                            />
                        </div>
                    </div>

                    <div className="flex gap-3 w-full md:w-auto">
                        <select
                            value={selectedCategory || ''}
                            onChange={(e) => setSelectedCategory(e.target.value || null)}
                            className="px-4 py-2.5 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-brand/50"
                        >
                            <option value="">所有分类</option>
                            {categories.map((cat) => (
                                <option key={cat.id} value={cat.slug}>
                                    {cat.icon} {cat.name}
                                </option>
                            ))}
                        </select>

                        <button
                            onClick={() => setShowAddModal(true)}
                            className="flex items-center gap-2 px-6 py-2.5 rounded-lg bg-brand text-white hover:bg-teal-500 transition-colors font-medium whitespace-nowrap"
                        >
                            <Plus className="w-5 h-5" />
                            新增工作流
                        </button>
                    </div>
                </div>
            </Card>

            {/* Workflows Table */}
            <Card className="p-6 bg-white/60 overflow-hidden">
                <div className="overflow-x-auto">
                    <table className="w-full">
                        <thead>
                            <tr className="border-b border-gray-200">
                                <th className="text-left py-3 px-4 text-sm font-medium text-secondary">缩略图</th>
                                <th className="text-left py-3 px-4 text-sm font-medium text-secondary">标题</th>
                                <th className="text-left py-3 px-4 text-sm font-medium text-secondary">作者</th>
                                <th className="text-left py-3 px-4 text-sm font-medium text-secondary">分类</th>
                                <th className="text-left py-3 px-4 text-sm font-medium text-secondary">浏览量</th>
                                <th className="text-left py-3 px-4 text-sm font-medium text-secondary">价格</th>
                                <th className="text-left py-3 px-4 text-sm font-medium text-secondary">状态</th>
                                <th className="text-right py-3 px-4 text-sm font-medium text-secondary">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {filteredWorkflows.map((workflow) => (
                                <tr key={workflow.id} className="border-b border-gray-100 hover:bg-gray-50 transition-colors">
                                    <td className="py-3 px-4">
                                        <img
                                            src={workflow.thumbnail_url}
                                            alt={workflow.title}
                                            className="w-16 h-12 rounded-lg object-cover"
                                        />
                                    </td>
                                    <td className="py-3 px-4">
                                        <div className="font-medium text-primary max-w-xs truncate">
                                            {workflow.title}
                                        </div>
                                        <div className="text-xs text-secondary">ID: {workflow.id}</div>
                                    </td>
                                    <td className="py-3 px-4 text-sm text-secondary">{workflow.author}</td>
                                    <td className="py-3 px-4">
                                        <div className="flex flex-wrap gap-1">
                                            {workflow.workflow_categories?.slice(0, 2).map((wc: any, idx: number) => (
                                                <span
                                                    key={idx}
                                                    className="px-2 py-0.5 rounded-full bg-brand/10 text-brand text-xs"
                                                >
                                                    {wc.categories?.icon}
                                                </span>
                                            ))}
                                        </div>
                                    </td>
                                    <td className="py-3 px-4 text-sm text-secondary">{workflow.views}</td>
                                    <td className="py-3 px-4 text-sm font-medium text-primary">
                                        {workflow.price === 0 ? '免费' : `$${workflow.price}`}
                                    </td>
                                    <td className="py-3 px-4">
                                        <span
                                            className={`px-2 py-1 rounded-full text-xs font-medium ${workflow.published
                                                    ? 'bg-green-100 text-green-700'
                                                    : 'bg-orange-100 text-orange-700'
                                                }`}
                                        >
                                            {workflow.published ? '已发布' : '草稿'}
                                        </span>
                                    </td>
                                    <td className="py-3 px-4">
                                        <div className="flex items-center justify-end gap-2">
                                            <a
                                                href={`/${locale}/workflow/${workflow.id}`}
                                                target="_blank"
                                                rel="noopener noreferrer"
                                                className="p-2 rounded-lg hover:bg-gray-200 transition-colors"
                                                title="查看"
                                            >
                                                <Eye className="w-4 h-4 text-secondary" />
                                            </a>
                                            <button
                                                className="p-2 rounded-lg hover:bg-gray-200 transition-colors"
                                                title="编辑"
                                            >
                                                <Edit2 className="w-4 h-4 text-secondary" />
                                            </button>
                                            <button
                                                className="p-2 rounded-lg hover:bg-red-100 transition-colors"
                                                title="删除"
                                            >
                                                <Trash2 className="w-4 h-4 text-red-600" />
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>

                    {filteredWorkflows.length === 0 && (
                        <div className="text-center py-12 text-secondary">
                            未找到工作流
                        </div>
                    )}
                </div>
            </Card>

            {/* Add Workflow Modal (placeholder) */}
            {showAddModal && (
                <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
                    <Card className="w-full max-w-2xl p-8 bg-white">
                        <h2 className="text-2xl font-bold text-primary mb-6">新增工作流</h2>
                        <p className="text-secondary mb-4">
                            此功能正在开发中。您可以通过 Supabase Dashboard 或 SQL 脚本添加工作流。
                        </p>
                        <button
                            onClick={() => setShowAddModal(false)}
                            className="px-6 py-2.5 rounded-lg bg-brand text-white hover:bg-teal-500 transition-colors"
                        >
                            关闭
                        </button>
                    </Card>
                </div>
            )}
        </div>
    );
}
