'use client';

import Card from './ui/Card';

interface AdSlotProps {
    size: 'banner' | 'sidebar' | 'square' | 'leaderboard';
    className?: string;
}

const adSizes = {
    banner: { width: 728, height: 90, label: '728 x 90' },
    leaderboard: { width: 970, height: 90, label: '970 x 90' },
    sidebar: { width: 300, height: 600, label: '300 x 600' },
    square: { width: 300, height: 250, label: '300 x 250' },
};

export default function AdSlot({ size, className = '' }: AdSlotProps) {
    const { width, height, label } = adSizes[size];

    return (
        <Card
            className={`flex items-center justify-center bg-gradient-to-br from-gray-50 to-gray-100 border-2 border-dashed border-gray-300 ${className}`}
            style={{ width: '100%', maxWidth: `${width}px`, height: `${height}px` }}
        >
            <div className="text-center text-gray-400">
                <div className="text-sm font-medium mb-1">广告位</div>
                <div className="text-xs">{label}</div>
            </div>
        </Card>
    );
}
