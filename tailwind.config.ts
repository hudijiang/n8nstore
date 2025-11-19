import type { Config } from 'tailwindcss'

export default {
  content: ['./app/**/*.{ts,tsx}', './components/**/*.{ts,tsx}'],
  theme: {
    extend: {
      colors: {
        // Apple System Colors
        'apple-blue': '#007AFF',
        'apple-gray': {
          50: '#F9FAFB',
          100: '#F2F2F7', // System Gray 6
          200: '#E5E5EA', // System Gray 5
          300: '#D1D1D6', // System Gray 4
          400: '#C7C7CC', // System Gray 3
          500: '#AEAEB2', // System Gray 2
          600: '#8E8E93', // System Gray
          700: '#636366',
          800: '#48484A',
          900: '#3A3A3C',
          950: '#1C1C1E',
        },
        'apple-bg': '#F5F5F7',
      },
      fontFamily: {
        sans: [
          'Inter',
          '-apple-system',
          'BlinkMacSystemFont',
          'Segoe UI',
          'Roboto',
          'Helvetica',
          'Arial',
          'sans-serif',
        ],
      },
      boxShadow: {
        'apple-card': '0 4px 24px rgba(0, 0, 0, 0.04)',
        'apple-hover': '0 8px 32px rgba(0, 0, 0, 0.08)',
        'glass': '0 8px 32px 0 rgba(31, 38, 135, 0.07)',
      },
      backdropBlur: {
        xs: '2px',
      }
    }
  },
  plugins: []
} satisfies Config