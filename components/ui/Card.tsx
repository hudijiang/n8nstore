'use client'

import { cn } from '@/lib/utils'
import { HTMLAttributes, forwardRef } from 'react'

interface CardProps extends HTMLAttributes<HTMLDivElement> {
    width?: number | string
    height?: number | string
}

const Card = forwardRef<HTMLDivElement, CardProps>(
    ({ className, children, width, height, style, ...props }, ref) => {
        return (
            <div
                ref={ref}
                className={cn('glass-card', className)}
                style={{
                    width,
                    height,
                    ...style,
                }}
                {...props}
            >
                {children}
            </div>
        )
    }
)

Card.displayName = 'Card'

export default Card
