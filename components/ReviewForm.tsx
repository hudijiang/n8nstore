"use client"
import { useState } from 'react'
import { StarIcon } from '@heroicons/react/24/solid'
import { StarIcon as StarIconOutline } from '@heroicons/react/24/outline'

export default function ReviewForm() {
    const [rating, setRating] = useState(0)
    const [hover, setHover] = useState(0)
    const [comment, setComment] = useState('')

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault()
        // TODO: Submit to Supabase
        alert('Review submitted! (Mock)')
        setRating(0)
        setComment('')
    }

    return (
        <form onSubmit={handleSubmit} className="bg-white/80 backdrop-blur-xl rounded-3xl p-6 shadow-apple-card border border-white/20 space-y-4">
            <h3 className="text-lg font-semibold">Write a Review</h3>

            <div className="flex gap-1">
                {[1, 2, 3, 4, 5].map((star) => (
                    <button
                        key={star}
                        type="button"
                        className="focus:outline-none transition-transform hover:scale-110"
                        onClick={() => setRating(star)}
                        onMouseEnter={() => setHover(star)}
                        onMouseLeave={() => setHover(0)}
                    >
                        {star <= (hover || rating) ? (
                            <StarIcon className="w-6 h-6 text-yellow-400" />
                        ) : (
                            <StarIconOutline className="w-6 h-6 text-gray-300" />
                        )}
                    </button>
                ))}
            </div>

            <textarea
                className="w-full border border-gray-200 rounded-xl p-3 focus:ring-2 focus:ring-apple-blue focus:border-transparent outline-none resize-none bg-white/50"
                rows={3}
                placeholder="Share your experience..."
                value={comment}
                onChange={(e) => setComment(e.target.value)}
                required
            />

            <button
                type="submit"
                disabled={rating === 0}
                className="px-6 py-2 rounded-full bg-apple-blue text-white font-medium disabled:opacity-50 disabled:cursor-not-allowed hover:bg-blue-600 transition-colors"
            >
                Post Review
            </button>
        </form>
    )
}
