// Theme selection: an accent palette plus light/dark mode, applied as data
// attributes on <html> and picked up by the CSS variables in index.css.

export const ACCENTS = [
  { key: 'sapphire', label: 'Sapphire', swatch: '#1d4ed8' },
  { key: 'emerald', label: 'Emerald', swatch: '#047857' },
  { key: 'violet', label: 'Violet', swatch: '#6d28d9' },
  { key: 'rose', label: 'Rose', swatch: '#be123c' },
  { key: 'amber', label: 'Amber', swatch: '#b45309' },
  { key: 'teal', label: 'Teal', swatch: '#0f766e' },
]

export interface Theme {
  mode: 'light' | 'dark'
  accent: string
}

const STORAGE_KEY = 'csd-theme'
const DEFAULT_THEME: Theme = { mode: 'light', accent: 'sapphire' }

export function applyTheme(theme: Theme) {
  const root = document.documentElement
  root.dataset.mode = theme.mode
  root.dataset.accent = theme.accent
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(theme))
  } catch {
    // private browsing — theme just won't persist
  }
}

export function loadTheme(): Theme {
  // Dev convenience: ?theme=dark:emerald forces a theme (handy for testing).
  const param = new URLSearchParams(window.location.search).get('theme')
  if (param) {
    const [mode, accent] = param.split(':')
    return {
      mode: mode === 'dark' ? 'dark' : 'light',
      accent: accent && ACCENTS.some((a) => a.key === accent) ? accent : DEFAULT_THEME.accent,
    }
  }
  try {
    const stored: unknown = JSON.parse(localStorage.getItem(STORAGE_KEY) ?? 'null')
    if (
      typeof stored === 'object' &&
      stored !== null &&
      'mode' in stored &&
      'accent' in stored
    )
      return stored as Theme
  } catch {
    // fall through to default
  }
  return DEFAULT_THEME
}
