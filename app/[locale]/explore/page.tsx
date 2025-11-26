import ExploreClient from './ExploreClient'
import type { Metadata } from 'next'

async function getMessages(locale: string) {
    const mod = await import(`../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export async function generateMetadata({ params }: { params: { locale: string } }): Promise<Metadata> {
    return {
        title: '探索工作流 - n8n Workflow Store',
        description: '浏览所有可用的 n8n 工作流模板，找到适合您需求的自动化解决方案。',
        openGraph: {
            title: '探索工作流 - n8n Workflow Store',
            description: '浏览所有可用的 n8n 工作流模板',
            type: 'website',
        },
    }
}

export default async function ExplorePage({ params }: { params: { locale: string } }) {
    const t = await getMessages(params.locale)

    return <ExploreClient locale={params.locale} translations={t} />
}
