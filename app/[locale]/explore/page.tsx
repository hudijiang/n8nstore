import ExploreClient from './ExploreClient'

async function getMessages(locale: string) {
    const mod = await import(`../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function ExplorePage({ params }: { params: { locale: string } }) {
    const t = await getMessages(params.locale)

    return <ExploreClient locale={params.locale} translations={t} />
}
