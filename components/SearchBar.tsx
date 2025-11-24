'use client'

import { useState } from 'react'
import { Search } from 'lucide-react'

export default function SearchBar({ placeholder }: { placeholder: string }) {
  const [query, setQuery] = useState('')

  return (
    <div className="relative group w-full">
      <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
        <Search className="h-5 w-5 text-secondary group-focus-within:text-brand transition-colors" />
      </div>
      <input
        type="text"
        className="block w-full pl-11 pr-4 py-3.5 bg-white/50 border border-white backdrop-blur-sm rounded-full text-primary placeholder-secondary focus:outline-none focus:ring-2 focus:ring-brand/20 focus:bg-white transition-all shadow-sm"
        placeholder={placeholder}
        value={query}
        onChange={(e) => setQuery(e.target.value)}
      />
    </div>
  )
}