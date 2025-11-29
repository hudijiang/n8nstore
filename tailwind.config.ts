import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        brand: 'var(--color-brand)', // #35bfab
        primary: 'var(--color-primary)', // #334f52
        secondary: 'var(--color-secondary)', // #7b888e
        bg: 'var(--color-bg)', // #eeeeee
        border: 'var(--color-border)', // #fff
      },
      fontFamily: {
        sans: [
          'PingFang SC',
          '-apple-system',
          'system-ui',
          'Segoe UI',
          'Roboto',
          'Ubuntu',
          'Cantarell',
          'Noto Sans',
          'sans-serif',
          'BlinkMacSystemFont',
          'Helvetica Neue',
          'Hiragino Sans GB',
          'Microsoft YaHei',
          'Arial',
        ],
        averia: ['"Averia Gruesa Libre"', 'sans-serif'],
      },
      borderRadius: {
        '4xl': '40px',
      },
      boxShadow: {
        'glass-card': '0 40px 50px -32px rgba(0, 0, 0, 0.05), inset 0 0 20px rgba(255, 255, 255, 0.25)',
        'nav-hover': '0 4px 12px rgba(0, 0, 0, 0.05)',
      },
      backdropBlur: {
        xs: '2px',
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
export default config