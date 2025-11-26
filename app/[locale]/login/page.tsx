import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import LoginClient from './LoginClient'

async function getMessages(locale: string) {
    const mod = await import(`../../../messages/${locale}.json`)
    return mod.default as Record<string, string>
}

export default async function LoginPage({ params }: { params: { locale: string } }) {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    // If already logged in, redirect to home
    if (user) {
        redirect(`/${params.locale}`)
    }

    const t = await getMessages(params.locale)

    return (
        <div className="min-h-[80vh] flex items-center justify-center pb-20">
            <LoginClient locale={params.locale} translations={t} />
        </div>
    )
}
