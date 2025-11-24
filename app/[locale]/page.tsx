import SearchBar from '@/components/SearchBar'
import WorkflowCard from '@/components/WorkflowCard'
import Card from '@/components/ui/Card'

const locales = ['en', 'ja', 'zh', 'de', 'fr', 'es']

async function getMessages(locale: string) {
  if (!locales.includes(locale)) {
    return {}
  }
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
    <div className="space-y-6 pb-20">
      {/* Hero / Search Section */}
      <Card className="w-full p-8 flex flex-col items-center text-center space-y-6 bg-white/60">
        <h1 className="text-4xl md:text-5xl font-bold tracking-tight text-primary font-averia">
          {t.hero_title}
        </h1>
        <p className="text-lg text-secondary max-w-2xl mx-auto">
          {t.hero_description}
        </p>
        <div className="w-full max-w-xl">
          <SearchBar placeholder={t.search_placeholder} />
        </div>
      </Card>

      {/* Filters */}
      <div className="flex gap-3 overflow-x-auto pb-2 scrollbar-none">
        {['All', 'Automation', 'Integration', 'Finance', 'Productivity'].map((filter, i) => (
          <button
            key={filter}
            className={`px-5 py-2.5 rounded-full text-sm font-medium transition-all ${i === 0 ? 'bg-brand text-white shadow-lg shadow-brand/20' : 'bg-white/50 text-secondary hover:bg-white hover:text-primary'}`}
          >
            {filter}
          </button>
        ))}
      </div>

      {/* Workflow Grid */}
      <div className="grid md:grid-cols-2 xl:grid-cols-3 gap-6">
        {workflows.map((w) => (
          <div key={w.title} className="h-[400px]">
            <WorkflowCard title={w.title} price={w.price} json={w.json} t={t} description={w.description} tags={w.tags} thumbnailUrl={w.thumbnailUrl} />
          </div>
        ))}
      </div>

      <div className="mt-12 text-center">
        <button className="px-8 py-3 rounded-full bg-white/50 border border-white text-secondary font-medium hover:bg-white transition-colors shadow-sm">
          {t.load_more}
        </button>
      </div>
    </div>
  )
}

export const dynamic = 'force-static'

export function generateStaticParams() {
  return ['en', 'ja', 'zh', 'de', 'fr', 'es'].map((locale) => ({ locale }))
}