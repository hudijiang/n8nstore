import Link from 'next/link'

export default function Page() {
  return (
    <div className="space-y-4">
      <h1 className="text-xl font-semibold">n8n Workflow Store</h1>
      <p>Choose a language:</p>
      <div className="flex gap-2">
        {['en', 'ja', 'zh', 'de', 'fr', 'es'].map((l) => (
          <Link key={l} href={`/${l}`} className="px-2 py-1 rounded bg-gray-200">
            {l.toUpperCase()}
          </Link>
        ))}
      </div>
    </div>
  )
}
