'use client';

import { useEffect, useState } from 'react';
import WorkflowCard from './WorkflowCard';

interface Workflow {
    id: string;
    title: string;
    description: string;
    author: string;
    thumbnail: string;
    price: number;
    categories: any[];
}

interface RelatedWorkflowsProps {
    workflowId: string;
    categorySlug?: string;
    locale: string;
}

export default function RelatedWorkflows({ workflowId, categorySlug, locale }: RelatedWorkflowsProps) {
    const [workflows, setWorkflows] = useState<Workflow[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function fetchRelated() {
            try {
                const params = new URLSearchParams({
                    locale,
                    limit: '4',
                    sort: 'views',
                    ...(categorySlug && { category: categorySlug }),
                });

                const response = await fetch(`/api/workflows?${params}`);
                const data = await response.json();

                if (data.workflows) {
                    // Filter out current workflow
                    const related = data.workflows.filter((w: Workflow) => w.id !== workflowId);
                    setWorkflows(related.slice(0, 3));
                }
            } catch (error) {
                console.error('Error fetching related workflows:', error);
            } finally {
                setLoading(false);
            }
        }

        fetchRelated();
    }, [workflowId, categorySlug, locale]);

    if (loading) {
        return (
            <div className="space-y-4">
                <h2 className="text-2xl font-bold text-primary">相关工作流</h2>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                    {[...Array(3)].map((_, i) => (
                        <div key={i} className="h-80 bg-white/30 rounded-2xl animate-pulse" />
                    ))}
                </div>
            </div>
        );
    }

    if (workflows.length === 0) {
        return null;
    }

    return (
        <div className="space-y-4">
            <h2 className="text-2xl font-bold text-primary">相关工作流</h2>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
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
        </div>
    );
}
