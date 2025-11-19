"use client"
import Link from 'next/link'
import { useEffect, useRef, useState } from 'react'

const locales = ['en', 'ja', 'zh', 'de', 'fr', 'es'] as const
const names: Record<(typeof locales)[number], string> = {
  en: 'English',
  ja: '日本語',
  zh: '中文',
  de: 'Deutsch',
  fr: 'Français',
  es: 'Español'
}

export default function LanguageSwitcher({ current, label = 'Language' }: { current: string; label?: string }) {
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement | null>(null)
  useEffect(() => {
    const onDocClick = (e: MouseEvent) => {
      if (!ref.current) return
      if (!ref.current.contains(e.target as Node)) setOpen(false)
    }
    document.addEventListener('click', onDocClick)
    return () => document.removeEventListener('click', onDocClick)
  }, [])
  const setPref = (loc: string) => {
    document.cookie = `locale=${loc}; path=/; max-age=31536000`
    setOpen(false)
  }
  const currentName = names[(current as typeof locales[number]) || 'en'] || 'English'
  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        aria-haspopup="listbox"
        aria-expanded={open}
        className="inline-flex items-center gap-2 px-3 py-2 rounded-lg border bg-white shadow-sm hover:bg-gray-50"
        onClick={() => setOpen((v) => !v)}
      >
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" className="text-gray-600"><path d="M12 2a10 10 0 100 20 10 10 0 000-20zm0 0s4 3.5 4 10-4 10-4 10" stroke="currentColor" strokeWidth="1.5"/><path d="M12 2s-4 3.5-4 10 4 10 4 10" stroke="currentColor" strokeWidth="1.5"/><path d="M2 12h20" stroke="currentColor" strokeWidth="1.5"/></svg>
        <span className="text-sm text-gray-700">{label}</span>
        <span className="text-sm font-medium text-gray-900">{currentName}</span>
        <svg width="12" height="12" viewBox="0 0 20 20" className="text-gray-500"><path d="M5 7l5 5 5-5" fill="currentColor"/></svg>
      </button>
      {open && (
        <ul role="listbox" aria-label={label} className="absolute right-0 mt-2 w-44 rounded-lg border bg-white shadow-lg overflow-hidden">
          {locales.map((loc) => (
            <li key={loc} role="option" aria-selected={loc === current}>
              <Link
                href={`/${loc}`}
                onClick={() => setPref(loc)}
                className={`flex items-center justify-between px-3 py-2 text-sm hover:bg-gray-50 ${loc === current ? 'bg-gray-100' : ''}`}
              >
                <span>{names[loc]}</span>
                <span className="text-xs text-gray-500">{loc.toUpperCase()}</span>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}