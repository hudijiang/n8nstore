import Header from '@/components/Header'
import SearchBar from '@/components/SearchBar'
import WorkflowCard from '@/components/WorkflowCard'

async function getMessages(locale: string) {
  const mod = await import(`../../messages/${locale}.json`)
  return mod.default as Record<string, string>
}

export default async function Page({ params }: { params: { locale: string } }) {
  const t = await getMessages(params.locale)
  const workflows = [
    { title: t.workflow_rss_title, price: 0, json: { name: 'rss_to_telegram' }, description: t.workflow_rss_desc, tags: ['RSS', 'Telegram', 'Notify'], thumbnailUrl: 'https://picsum.photos/seed/rss/600/240' },
    { title: t.workflow_github_title, price: 9.9, json: { name: 'github_issue_notifier' }, description: t.workflow_github_desc, tags: ['GitHub', 'Alert', 'Issue'], thumbnailUrl: 'https://picsum.photos/seed/github/600/240' },
    { title: t.workflow_email_title, price: 0, json: { name: 'email_parser_to_sheets' }, description: t.workflow_email_desc, tags: ['Email', 'Parser', 'Sheets'], thumbnailUrl: 'https://picsum.photos/seed/email/600/240' }
  ]
  return (
    <>
      <Header title={t.title} locale={params.locale} label={t.switch_language} />

      <main className="container pb-20">
        {/* Hero Section */}
        <section className="py-16 md:py-24 flex flex-col items-center text-center space-y-8 max-w-3xl mx-auto">
          <div className="space-y-4">
            <h2 className="text-4xl md:text-6xl font-bold tracking-tight text-gray-900 bg-clip-text text-transparent bg-gradient-to-b from-gray-900 to-gray-600 pb-2">
              {t.hero_title}
            </h2>
            <p className="text-lg md:text-xl text-gray-500 max-w-2xl mx-auto leading-relaxed">
              {t.hero_description}
            </p>
          </div>

          <div className="w-full max-w-xl shadow-xl shadow-blue-500/5 rounded-full">
            <SearchBar placeholder={t.search_placeholder} />
          </div>
        </section>

        {/* Workflow Grid */}
        <section>
          <div className="flex flex-col md:flex-row md:items-center justify-between mb-8 gap-4">
            <h3 className="text-2xl font-semibold tracking-tight text-gray-900">{t.featured_workflows}</h3>

            {/* Filters */}
            <div className="flex gap-2 overflow-x-auto pb-2 md:pb-0">
              <button className="px-4 py-2 rounded-full bg-gray-900 text-white text-sm font-medium whitespace-nowrap">All</button>
              <button className="px-4 py-2 rounded-full bg-white text-gray-600 text-sm font-medium border border-gray-200 hover:bg-gray-50 whitespace-nowrap">Automation</button>
              <button className="px-4 py-2 rounded-full bg-white text-gray-600 text-sm font-medium border border-gray-200 hover:bg-gray-50 whitespace-nowrap">Integration</button>
              <button className="px-4 py-2 rounded-full bg-white text-gray-600 text-sm font-medium border border-gray-200 hover:bg-gray-50 whitespace-nowrap">Uses: HTTP Request</button>
              <button className="px-4 py-2 rounded-full bg-white text-gray-600 text-sm font-medium border border-gray-200 hover:bg-gray-50 whitespace-nowrap">Uses: Gmail</button>
            </div>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {workflows.map((w) => (
              <WorkflowCard key={w.title} title={w.title} price={w.price} json={w.json} t={t} description={w.description} tags={w.tags} thumbnailUrl={w.thumbnailUrl} />
            ))}
          </div>

          <div className="mt-12 text-center">
            <button className="px-8 py-3 rounded-full bg-white border border-gray-200 text-gray-900 font-medium hover:bg-gray-50 transition-colors shadow-sm">
              {t.load_more}
            </button>
          </div>
        </section>
      </main>
    </>
  )
}

export const dynamic = 'force-static'

export function generateStaticParams() {
  return ['en', 'ja', 'zh', 'de', 'fr', 'es'].map((locale) => ({ locale }))
}