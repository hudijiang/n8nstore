import { ReactNode } from 'react'

export default function LocaleLayout({ children }: { children: ReactNode; params: { locale: string } }) {
  return (
    <div className="min-h-screen bg-apple-bg text-gray-900 font-sans antialiased selection:bg-apple-blue/20 selection:text-apple-blue">
      {children}
    </div>
  )
}