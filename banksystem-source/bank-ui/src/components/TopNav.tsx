import { useEffect, useState } from 'react'
import { ACCENTS, applyTheme, loadTheme } from '../theme.ts'
import { session } from '../session.ts'

const MENU_ITEMS = [
  { label: 'Reports', enabled: true },
  { label: 'Customer Service', enabled: true },
  { label: 'Supervisor', enabled: false },
  { label: 'Card Production Centre', enabled: false },
  { label: 'About', enabled: true },
]

function ThemePicker() {
  const [theme, setTheme] = useState(loadTheme)
  const [open, setOpen] = useState(false)

  useEffect(() => {
    applyTheme(theme)
  }, [theme])

  return (
    <div className="relative">
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        title="Theme"
        aria-label="Choose theme"
        className="flex h-9 w-9 items-center justify-center rounded-full border border-edge bg-surface text-muted shadow-xs transition-colors hover:bg-surface-muted hover:text-ink"
      >
        <svg viewBox="0 0 20 20" fill="currentColor" className="h-4.5 w-4.5">
          <path
            fillRule="evenodd"
            d="M10 2a8 8 0 0 0 0 16h.5a2.5 2.5 0 0 0 2.5-2.5v-.5a1 1 0 0 1 1-1h1.5A2.5 2.5 0 0 0 18 11.5V10a8 8 0 0 0-8-8Zm-4.5 9a1.25 1.25 0 1 1 0-2.5 1.25 1.25 0 0 1 0 2.5ZM7.75 6.25a1.25 1.25 0 1 1-2.5 0 1.25 1.25 0 0 1 2.5 0ZM11 5.75a1.25 1.25 0 1 1-2.5 0 1.25 1.25 0 0 1 2.5 0Zm2.75 2.5a1.25 1.25 0 1 1 0-2.5 1.25 1.25 0 0 1 0 2.5Z"
            clipRule="evenodd"
          />
        </svg>
      </button>

      {open && (
        <>
          <button
            type="button"
            aria-label="Close theme picker"
            className="fixed inset-0 z-30 cursor-default"
            onClick={() => setOpen(false)}
          />
          <div className="absolute right-0 top-11 z-40 w-60 rounded-2xl border border-edge bg-surface p-4 shadow-lg">
            <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-muted-soft">
              Mode
            </p>
            <div className="mb-4 inline-flex rounded-lg border border-edge-strong bg-surface p-0.5 shadow-xs">
              {(['light', 'dark'] as const).map((mode) => (
                <button
                  key={mode}
                  type="button"
                  onClick={() => setTheme((t) => ({ ...t, mode }))}
                  className={`rounded-md px-3 py-1.5 text-xs font-medium capitalize transition-colors ${
                    theme.mode === mode
                      ? 'bg-primary text-white shadow-sm'
                      : 'text-muted hover:bg-surface-muted'
                  }`}
                >
                  {mode === 'light' ? '☀ Light' : '☾ Dark'}
                </button>
              ))}
            </div>

            <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-muted-soft">
              Accent Color
            </p>
            <div className="grid grid-cols-3 gap-2">
              {ACCENTS.map((accent) => (
                <button
                  key={accent.key}
                  type="button"
                  onClick={() => setTheme((t) => ({ ...t, accent: accent.key }))}
                  className={`flex flex-col items-center gap-1.5 rounded-xl border px-2 py-2 text-[11px] font-medium transition-colors ${
                    theme.accent === accent.key
                      ? 'border-primary bg-primary-soft text-primary-ink'
                      : 'border-edge text-muted hover:bg-surface-muted'
                  }`}
                >
                  <span
                    className="h-5 w-5 rounded-full border border-black/10 shadow-sm"
                    style={{ backgroundColor: accent.swatch }}
                  />
                  {accent.label}
                </button>
              ))}
            </div>
          </div>
        </>
      )}
    </div>
  )
}

export default function TopNav({ onSignOut }: { onSignOut?: () => void }) {
  const [active, setActive] = useState('Customer Service')

  return (
    <header className="sticky top-0 z-20 border-b border-edge bg-surface/90 backdrop-blur">
      <div className="mx-auto flex h-16 max-w-6xl items-center justify-between px-4 sm:px-6">
        <div className="flex items-center gap-3">
          <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-gradient-to-br from-primary to-primary-strong text-white shadow-sm">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="h-5 w-5">
              <path d="M3 9.5 12 4l9 5.5" strokeLinecap="round" strokeLinejoin="round" />
              <path d="M5 10v7M9.5 10v7M14.5 10v7M19 10v7" strokeLinecap="round" />
              <path d="M3 20h18" strokeLinecap="round" />
            </svg>
          </div>
          <div className="leading-tight">
            <p className="text-sm font-semibold text-ink">Static Data Management</p>
            <p className="text-xs text-muted">Core Banking System</p>
          </div>
        </div>

        <nav className="hidden items-center gap-1 md:flex">
          {MENU_ITEMS.map((item) => (
            <button
              key={item.label}
              disabled={!item.enabled}
              onClick={() => setActive(item.label)}
              className={[
                'rounded-lg px-3 py-2 text-sm font-medium transition-colors',
                !item.enabled
                  ? 'cursor-not-allowed text-faint'
                  : active === item.label
                    ? 'bg-primary-soft text-primary-ink'
                    : 'text-muted hover:bg-surface-muted hover:text-ink',
              ].join(' ')}
            >
              {item.label}
            </button>
          ))}
        </nav>

        <div className="flex items-center gap-2.5">
          {session.loggedIn && (
            <span className="hidden rounded-full bg-surface-muted px-3 py-1.5 text-xs font-medium text-muted sm:inline">
              {session.userName} · Branch {session.branchCode}
            </span>
          )}
          <ThemePicker />
          {onSignOut && (
            <button
              type="button"
              onClick={onSignOut}
              title="Sign out"
              className="rounded-lg border border-edge-strong bg-surface px-3 py-1.5 text-xs font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
            >
              Sign out
            </button>
          )}
        </div>
      </div>
    </header>
  )
}
