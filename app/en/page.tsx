import LanguageSwitcher from '@/components/LanguageSwitcher'
import WorkflowCard from '@/components/WorkflowCard'
import t from '@/messages/en.json'

export default function Page() {
  const workflows = [
    { title: 'RSS to Telegram', price: 0, json: { name: 'rss_to_telegram' } },
    { title: 'GitHub Issue Notifier', price: 9.9, json: { name: 'github_issue_notifier' } }
  ]
  return (
    <div className="space-y-6">
      <header className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">{t.title}</h1>
        <LanguageSwitcher current={'en'} />
      </header>
      <input className="w-full border rounded px-3 py-2" placeholder={t.search_placeholder} />
      <section className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
        {workflows.map((w) => (
          <WorkflowCard key={w.title} title={w.title} price={w.price} json={w.json} t={t as any} />
        ))}
      </section>
    </div>
  )
}