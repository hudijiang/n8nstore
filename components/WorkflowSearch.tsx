'use client';

import { useState, useEffect } from 'react';
import { Search } from 'lucide-react';

// Simple debounce hook inline
function useDebounce<T>(value: T, delay: number = 300): T {
    const [debouncedValue, setDebouncedValue] = useState<T>(value);

    useEffect(() => {
        const handler = setTimeout(() => {
            setDebouncedValue(value);
        }, delay);

        return () => {
            clearTimeout(handler);
        };
    }, [value, delay]);

    return debouncedValue;
}

interface WorkflowSearchProps {
    locale: string;
    onSearch: (query: string) => void;
    placeholder?: string;
}

export default function WorkflowSearch({ locale, onSearch, placeholder }: WorkflowSearchProps) {
    const [query, setQuery] = useState('');
    const debouncedQuery = useDebounce(query, 300);

    useEffect(() => {
        onSearch(debouncedQuery);
    }, [debouncedQuery, onSearch]);

    return (
        <div className="relative w-full max-w-md">
            <div className="relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-secondary" />
                <input
                    type="text"
                    value={query}
                    onChange={(e) => setQuery(e.target.value)}
                    placeholder={placeholder || 'Search workflows...'}
                    className="w-full pl-12 pr-4 py-3 rounded-full bg-white/60 backdrop-blur-sm border border-white/20 focus:outline-none focus:ring-2 focus:ring-brand/50 focus:border-brand/50 transition-all"
                />
            </div>
        </div>
    );
}
