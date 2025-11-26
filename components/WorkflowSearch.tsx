'use client';

import { useState, useEffect } from 'react';
import { Search } from 'lucide-react';

interface WorkflowSearchProps {
    searchQuery: string;
    onSearchChange: (query: string) => void;
    placeholder?: string;
}

// Inline useDebounce hook
function useDebounce(value: string, delay: number) {
    const [debouncedValue, setDebouncedValue] = useState(value);

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

export default function WorkflowSearch({ searchQuery, onSearchChange, placeholder = 'Search workflows...' }: WorkflowSearchProps) {
    const [localQuery, setLocalQuery] = useState(searchQuery);
    const debouncedQuery = useDebounce(localQuery, 300);

    useEffect(() => {
        onSearchChange(debouncedQuery);
    }, [debouncedQuery, onSearchChange]);

    return (
        <div className="relative w-full">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-secondary" />
            <input
                type="text"
                value={localQuery}
                onChange={(e) => setLocalQuery(e.target.value)}
                placeholder={placeholder}
                className="w-full pl-12 pr-4 py-2.5 rounded-lg bg-white/60 border border-gray-200 text-sm text-primary placeholder:text-secondary focus:outline-none focus:ring-2 focus:ring-brand/50 hover:bg-white/80 transition-colors"
            />
        </div>
    );
}
