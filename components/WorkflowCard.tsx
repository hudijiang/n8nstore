"use client"
import { useState } from 'react'
import Tag from '@/components/Tag'

export default function WorkflowCard({ title, price, json, t, description, tags = [], thumbnailUrl }: { title: string; price?: number; json: object; t: Record<string, string>; description?: string; tags?: string[]; thumbnailUrl?: string }) {
  const [copied, setCopied] = useState(false)
  const handleCopy = async () => {
    await navigator.clipboard.writeText(JSON.stringify(json, null, 2))
    setCopied(true)
    setTimeout(() => setCopied(false), 1500)
  }
  const handleDownload = () => {
    const blob = new Blob([JSON.stringify(json, null, 2)], { type: 'application/json' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `${title.replace(/\s+/g, '-')}.json`
    a.click()
    URL.revokeObjectURL(url)
  }
  return (
    <div className="group relative flex flex-col bg-white rounded-3xl shadow-apple-card hover:shadow-apple-hover hover:scale-[1.02] transition-all duration-300 overflow-hidden border border-gray-100">
      <div className="relative h-48 w-full overflow-hidden bg-gray-50">
        {thumbnailUrl ? (
          <img src={thumbnailUrl} alt={title} className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105" loading="lazy" />
        ) : (
          <div className="h-full w-full bg-gradient-to-br from-blue-50 to-indigo-50 flex items-center justify-center">
            <span className="text-4xl opacity-20">⚡️</span>
          </div>
        )}
        <div className="absolute top-3 right-3">
          <span className={`px-3 py-1 rounded-full text-xs font-medium backdrop-blur-md ${price ? 'bg-white/90 text-gray-900 shadow-sm' : 'bg-emerald-500/90 text-white shadow-sm'}`}>
            {price ? `${t.paid}` : `${t.free}`}
          </span>
        </div>
      </div>

      <div className="flex flex-col flex-1 p-5">
        <h3 className="font-semibold text-lg text-gray-900 mb-2 line-clamp-1 tracking-tight">{title}</h3>
        {description && <p className="text-sm text-gray-500 mb-4 line-clamp-2 leading-relaxed">{description}</p>}

        <div className="mt-auto space-y-4">
          {tags.length > 0 && (
            <div className="flex flex-wrap gap-2">
              {tags.slice(0, 3).map((tag) => (
                <Tag key={tag}>{tag}</Tag>
              ))}
            </div>
          )}

          <div className="flex gap-2 pt-2">
            <button onClick={handleCopy} className="flex-1 px-4 py-2.5 rounded-full bg-apple-blue text-white text-sm font-medium hover:bg-blue-600 transition-colors shadow-sm shadow-blue-200 active:scale-95 transform duration-100">
              {copied ? 'Copied!' : t.copy_json}
            </button>
            <button onClick={handleDownload} className="px-4 py-2.5 rounded-full bg-gray-100 text-gray-600 text-sm font-medium hover:bg-gray-200 transition-colors active:scale-95 transform duration-100">
              {t.download_json}
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}