import { Inter } from 'next/font/google'
import '../globals.css'
import NavCardWrapper from '@/components/NavCardWrapper'
import BlurredBubblesBackground from '@/components/backgrounds/blurred-bubbles'
import { AuthProvider } from '@/components/auth/AuthProvider'

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
        <AuthProvider>
          <BlurredBubblesBackground />
          <NavCardWrapper locale={locale} />
          <div className="relative z-0 pt-32 px-4 lg:px-8">
            <main className="w-full max-w-[1200px] mx-auto">
              {children}
            </main>
          </div>
        </AuthProvider>
      </body>
    </html>
  )
}