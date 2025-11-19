import { StarIcon } from '@heroicons/react/24/solid'
import { StarIcon as StarIconOutline } from '@heroicons/react/24/outline'

export default function ReviewList({ reviews }: { reviews: any[] }) {
    return (
        <div className="space-y-6">
            <h3 className="text-xl font-semibold">Reviews ({reviews.length})</h3>
            {reviews.length === 0 ? (
                <p className="text-gray-500">No reviews yet. Be the first to review!</p>
            ) : (
                <div className="space-y-4">
                    {reviews.map((review) => (
                        <div key={review.id} className="bg-white/50 backdrop-blur-sm rounded-2xl p-4 border border-gray-100">
                            <div className="flex items-center justify-between mb-2">
                                <div className="flex items-center gap-2">
                                    <div className="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-xs font-bold">
                                        {review.user.name[0]}
                                    </div>
                                    <span className="font-medium text-sm">{review.user.name}</span>
                                </div>
                                <span className="text-xs text-gray-400">{new Date(review.created_at).toLocaleDateString()}</span>
                            </div>
                            <div className="flex mb-2">
                                {[1, 2, 3, 4, 5].map((star) => (
                                    <StarIcon key={star} className={`w-4 h-4 ${star <= review.rating ? 'text-yellow-400' : 'text-gray-300'}`} />
                                ))}
                            </div>
                            <p className="text-gray-600 text-sm">{review.comment}</p>
                        </div>
                    ))}
                </div>
            )}
        </div>
    )
}
