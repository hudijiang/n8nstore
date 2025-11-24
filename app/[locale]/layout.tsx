import { Inter } from 'next/font/google'
import '../globals.css'
import NavCard from '@/components/NavCard'

const inter = Inter({ subsets: ['latin'] })

export default function LocaleLayout({
  children,
  params: { locale }
}: {
  children: React.ReactNode
  params: { locale: string }
}) {
  return (
    <html lang={locale} className="h-full">
      <body className={`${inter.className} min-h-screen bg-bg text-primary antialiased selection:bg-brand/20 selection:text-brand`}>
        <div className="mx-auto max-w-[1400px] p-4 lg:p-8 flex items-start gap-8">
          <NavCard />
          <main className="flex-1 w-full min-w-0">
            {children}
          </main>
        </div>
      </body>
    </html>
  )
}