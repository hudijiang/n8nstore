import WorkflowCard from '@/components/WorkflowCard'
import Card from '@/components/ui/Card'
import fs from 'fs'
import path from 'path'

const locales = ['en', 'ja', 'zh', 'de', 'fr', 'es']

async function getMessages(locale: string) {
  if (!locales.includes(locale)) {
    return {}
  }
  const mod = await import(`../../messages/${locale}.json`)
  return mod.default as Record<string, string>
}

async function getWorkflows() {
  try {
    const filePath = path.join(process.cwd(), 'public/workflows/data/workflows.json')
    const fileContent = fs.readFileSync(filePath, 'utf8')
    return JSON.parse(fileContent)
  } catch (error) {
    console.error('Error loading workflows:', error)
    return []
  }
}

export default async function Page({ params }: { params: { locale: string } }) {
  const t = await getMessages(params.locale)
  const allWorkflows = await getWorkflows()

  // Display first 6 workflows
  const workflows = allWorkflows.slice(0, 6)

  return (
    <div className="space-y-6 pb-20">
      {/* Hero Section */}
      <Card className="w-full p-8 flex flex-col items-center text-center space-y-4 bg-white/60">
        <h1 className="text-4xl md:text-5xl font-bold tracking-tight text-primary font-averia">
          {t.hero_title}
        </h1>
        <p className="text-lg text-secondary max-w-2xl mx-auto">
          {t.hero_description}
        </p>
      </Card>

      {/* Filters */}
      <div className="flex gap-3 overflow-x-auto pb-2 scrollbar-none">
        {[
          { key: 'all', label: t.filter_all || 'All' },
          { key: 'automation', label: t.filter_automation || 'Automation' },
          { key: 'integration', label: t.filter_integration || 'Integration' },
          { key: 'finance', label: t.filter_finance || 'Finance' },
          { key: 'productivity', label: t.filter_productivity || 'Productivity' }
        ].map((filter, i) => (
          <button
            key={filter.key}
            className={`px-5 py-2.5 rounded-full text-sm font-medium transition-all ${i === 0 ? 'bg-brand text-white shadow-lg shadow-brand/20' : 'bg-white/50 text-secondary hover:bg-white hover:text-primary'}`}
          >
            {filter.label}
          </button>
        ))}
      </div>

      {/* Workflow Grid */}
      <div className="grid md:grid-cols-2 xl:grid-cols-3 gap-6">
        {workflows.map((w: any) => (
          <div key={w.id} className="h-[400px]">
            <WorkflowCard
              title={w.title}
              price={w.price}
              json={{ name: w.id }}
              t={t}
              description={w.description}
              tags={w.tags}
              thumbnailUrl={w.thumbnail}
            />
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