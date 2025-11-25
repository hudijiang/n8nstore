import NavCard from './NavCard'

const locales = ['en', 'ja', 'zh', 'de', 'fr', 'es']

async function getMessages(locale: string) {
    if (!locales.includes(locale)) {
        return {}
    }
    const mod = await import(`../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function NavCardWrapper({ locale }: { locale: string }) {
    const t = await getMessages(locale)

    return <NavCard translations={t} />
}
