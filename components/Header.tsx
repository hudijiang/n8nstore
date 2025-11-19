import LanguageSwitcher from '@/components/LanguageSwitcher'

export default function Header({ title, locale, label = 'Language' }: { title: string; locale: string; label?: string }) {
  return (
    <header className="sticky top-0 z-50 w-full bg-white/80 backdrop-blur-xl border-b border-gray-200/50 shadow-sm transition-all">
      <div className="container flex items-center justify-between py-4">
        <div className="flex items-center gap-3">
          <div className="h-10 w-10 rounded-xl bg-gradient-to-br from-apple-blue to-blue-600 flex items-center justify-center shadow-lg shadow-blue-500/20">
            <span className="text-white font-bold text-lg">n8n</span>
          </div>
          <h1 className="text-xl font-semibold tracking-tight text-gray-900">{title}</h1>
        </div>
        <LanguageSwitcher current={locale} label={label} />
      </div>
    </header>
  )
}
