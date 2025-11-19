"use client"
import { useState } from 'react'

export default function SearchBar({ placeholder, onChange }: { placeholder: string; onChange?: (q: string) => void }) {
  const [q, setQ] = useState('')
  return (
    <div className="relative group">
      <input
        className="w-full border border-gray-200 rounded-full px-5 py-3.5 pl-12 bg-white/80 backdrop-blur-sm shadow-sm transition-all duration-300 focus:outline-none focus:ring-4 focus:ring-apple-blue/20 focus:border-apple-blue hover:shadow-md hover:bg-white"
        placeholder={placeholder}
        value={q}
        onChange={(e) => {
          const v = e.target.value
          setQ(v)
          onChange?.(v)
        }}
      />
      <span className="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 group-focus-within:text-apple-blue transition-colors">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={2} stroke="currentColor" className="w-5 h-5">
          <path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
        </svg>
      </span>
    </div>
  )
}