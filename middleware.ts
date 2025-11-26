import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'
import { createServerClient, type CookieOptions } from '@supabase/ssr'

const locales = ['en', 'ja', 'zh', 'de', 'fr', 'es']

export async function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl

  // Handle Vite client requests
  if (pathname.startsWith('/@vite/client')) {
    return new NextResponse(null, { status: 204 })
  }

  let response = NextResponse.next({
    request: {
      headers: req.headers,
    },
  })

  // Refresh Supabase session
  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        get(name: string) {
          return req.cookies.get(name)?.value
        },
        set(name: string, value: string, options: CookieOptions) {
          req.cookies.set({
            name,
            value,
            ...options,
          })
          response = NextResponse.next({
            request: {
              headers: req.headers,
            },
          })
          response.cookies.set({
            name,
            value,
            ...options,
          })
        },
        remove(name: string, options: CookieOptions) {
          req.cookies.set({
            name,
            value: '',
            ...options,
          })
          response = NextResponse.next({
            request: {
              headers: req.headers,
            },
          })
          response.cookies.set({
            name,
            value: '',
            ...options,
          })
        },
      },
    }
  )

  await supabase.auth.getUser()

  // Handle locale redirect
  if (pathname === '/') {
    const cookieLocale = req.cookies.get('locale')?.value
    const accept = (req.headers.get('accept-language') || '').toLowerCase()
    let target = cookieLocale && locales.includes(cookieLocale) ? cookieLocale : ''
    if (!target) {
      target = locales.find((l) => accept.includes(l)) || 'zh'
    }
    const url = new URL(`/${target}`, req.url)
    return NextResponse.redirect(url)
  }

  return response
}

export const config = {
  matcher: [
    '/',
    '/@vite/client',
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
  ]
}
