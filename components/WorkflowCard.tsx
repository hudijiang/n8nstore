"use client"

import { useState, useEffect } from 'react'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import Tag from './Tag'
import { Download, Copy, Check, ExternalLink } from 'lucide-react'

interface WorkflowCardProps {
  id: string
  title: string
  description: string
  author: string
  price: number
  thumbnail: string
  tags: string[]
  locale: string
}

export default function WorkflowCard({ id, title, description, author, price, thumbnail, tags = [], locale }: WorkflowCardProps) {
  const [copied, setCopied] = useState(false)
  const [t, setT] = useState<any>({ free: 'Free', copy_json: 'Copy', download_json: 'Download' })

  // Load translations
  useEffect(() => {
    async function loadTranslations() {
      try {
        const messages = await import(`../../messages/${locale}.json`)
        setT(messages.default)
      } catch (error) {
        console.error('Error loading translations:', error)
      }
    }
    loadTranslations()
  }, [locale])


  const handleCopy = async () => {
    try {
      const response = await fetch(thumbnail.replace('/images/', '/json/').replace('.webp', '.json'))
      const json = await response.json()
      navigator.clipboard.writeText(JSON.stringify(json, null, 2))
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch (error) {
      console.error('Error copying workflow:', error)
    }
  }

  const handleDownload = async () => {
    try {
      const response = await fetch(thumbnail.replace('/images/', '/json/').replace('.webp', '.json'))
      const json = await response.json()
      const blob = new Blob([JSON.stringify(json, null, 2)], { type: 'application/json' })
      const url = URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = `${title.replace(/[^a-z0-9]/gi, '_').toLowerCase()}.json`
      a.click()
      URL.revokeObjectURL(url)
    } catch (error) {
      console.error('Error downloading workflow:', error)
    }
  }

  return (
    <a href={`/${locale}/workflow/${id}`} className="block">
      <Card className="group relative overflow-hidden transition-all hover:-translate-y-1 hover:shadow-lg p-0 flex flex-col h-full">
        {/* Thumbnail Section */}
        <div className="relative h-48 w-full overflow-hidden rounded-t-[40px] bg-gray-100">
          <img
            src={thumbnail}
            alt={title}
            className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
          />
          <div className="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent opacity-60" />

          <div className="absolute bottom-4 left-4 right-4 flex justify-end items-end">
            <div className="bg-white/90 backdrop-blur text-primary px-3 py-1 rounded-full text-sm font-bold shadow-sm">
              {price === 0 ? (t.free || 'Free') : `$${price}`}
            </div>
          </div>
        </div>

        {/* Content Section */}
        <div className="p-6 flex flex-col flex-1">
          {/* Tags */}
          {tags && tags.length > 0 && (
            <div className="flex flex-wrap gap-2 mb-2">
              {tags.slice(0, 3).map((tag, index) => (
                <Link
                  key={index}
                  href={`/${locale}?category=${encodeURIComponent(tag)}` as any}
                  className="px-3 py-1 rounded-full bg-brand/10 text-brand text-xs font-medium hover:bg-brand/20 transition-colors"
                  onClick={(e: React.MouseEvent) => e.stopPropagation()}
                >
                  {tag}
                </Link>
              ))}
              {tags.length > 3 && (
                <span className="px-3 py-1 rounded-full bg-gray-100 text-gray-500 text-xs">
                  +{tags.length - 3}
                </span>
              )}
            </div>
          )}
          <h3 className="text-xl font-bold text-primary mb-2 line-clamp-1">{title}</h3>
          <p className="text-secondary text-sm leading-relaxed line-clamp-2 mb-6 flex-1">
            {description}
          </p>

          {/* Actions */}
          <div className="flex items-center gap-2 mt-auto pt-4 border-t border-gray-100/50">
            <button
              onClick={(e) => {
                e.preventDefault()
                handleCopy()
              }}
              className="flex-1 flex items-center justify-center gap-2 py-2.5 rounded-xl bg-bg hover:bg-gray-200 text-secondary text-sm font-medium transition-colors"
            >
              {copied ? <Check className="w-4 h-4 text-green-500" /> : <Copy className="w-4 h-4" />}
              {copied ? 'Copied' : (t.copy_json || 'Copy')}
            </button>

            <button
              onClick={(e) => {
                e.preventDefault()
                handleDownload()
              }}
              className="flex-1 flex items-center justify-center gap-2 py-2.5 rounded-xl bg-brand text-white text-sm font-medium hover:bg-teal-500 transition-colors shadow-nav-hover"
            >
              <Download className="w-4 h-4" />
              {t.download_json || 'Download'}
            </button>
          </div>
        </div>
      </Card>
    </a>
  )
}