import HomeClient from './HomeClient'
import type { Metadata } from 'next'

const locales = ['en', 'ja', 'zh', 'de', 'fr', 'es']

async function getMessages(locale: string) {
  // The original code had a check: if (!locales.includes(locale)) { return {} }
  // The provided change removes this check.
  const mod = await import(`../../messages/${locale}.json`)
  return mod.default as Record<string, string>
}

export async function generateMetadata({ params }: { params: { locale: string } }): Promise<Metadata> {
  const t = await getMessages(params.locale)

  return {
    title: 'n8n Workflow Store - 自动化工作流市场',
    description: t.hero_description || '发现并下载精选的 n8n 工作流模板，让任务自动化变得简单。',
    openGraph: {
      title: 'n8n Workflow Store',
      description: t.hero_description || '发现并下载精选的 n8n 工作流模板',
      type: 'website',
    },
    twitter: {
      card: 'summary_large_image',
      title: 'n8n Workflow Store',
      description: t.hero_description || '发现并下载精选的 n8n 工作流模板',
    },
  }
}

export default async function Page({ params }: { params: { locale: string } }) {
  const translations = await getMessages(params.locale)

  return <HomeClient locale={params.locale} translations={translations} />
}