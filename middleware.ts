import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

const locales = ['en', 'ja', 'zh', 'de', 'fr', 'es']

export function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl
  if (pathname.startsWith('/@vite/client')) {
    return new NextResponse(null, { status: 204 })
  }
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
  return NextResponse.next()
}

export const config = {
  matcher: ['/', '/@vite/client']
}
