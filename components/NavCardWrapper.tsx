import NavCard from './NavCard'
import AuthButton from './auth/AuthButton'

async function getMessages(locale: string) {
    const mod = await import(`../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function NavCardWrapper({ locale }: { locale: string }) {
    const translations = await getMessages(locale)
    return <NavCard translations={translations} locale={locale} authButton={<AuthButton locale={locale} />} />
}
