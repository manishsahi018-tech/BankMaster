import { useEffect, useRef, useState } from 'react'
import { createPortal } from 'react-dom'
import { ACCENTS, applyTheme, loadTheme } from '../theme.ts'
import { session } from '../session.ts'
import LocalePicker from './LocalePicker.tsx'
import { useT } from '../i18n/index.ts'

// About dialog — content ported from the legacy frmAbout.frm / statdata.vbp
// (App.Title + version 4.0.5 + copyright). Reports / Supervisor / Card
// Production Centre are separate CBS-CMS applications, not part of this
// Customer Static Data module, so they are not offered here.
function AboutDialog({ onClose }: { onClose: () => void }) {
  const { t } = useT()
  // Portalled to document.body: the sticky header uses backdrop-blur, which
  // makes it the containing block for fixed children — so a dialog rendered
  // inside it would center on the header, not the viewport.
  return createPortal(
    <>
      <button
        type="button"
        aria-label={t('Close about dialog')}
        className="fixed inset-0 z-40 cursor-default bg-ink/40 backdrop-blur-sm"
        onClick={onClose}
      />
      <div
        role="dialog"
        aria-modal="true"
        aria-label={t('About')}
        className="fixed left-1/2 top-1/2 z-50 w-[92%] max-w-md -translate-x-1/2 -translate-y-1/2 rounded-2xl border border-edge bg-surface p-6 shadow-lg"
      >
        <div className="flex items-start gap-4">
          <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-gradient-to-br from-primary to-primary-strong text-white shadow-sm">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="h-6 w-6">
              <path d="M3 9.5 12 4l9 5.5" strokeLinecap="round" strokeLinejoin="round" />
              <path d="M5 10v7M9.5 10v7M14.5 10v7M19 10v7" strokeLinecap="round" />
              <path d="M3 20h18" strokeLinecap="round" />
            </svg>
          </div>
          <div className="min-w-0">
            <h2 className="text-lg font-semibold text-ink">{t('Static Data Management for CBS')}</h2>
            <p className="mt-0.5 text-sm text-muted">{t('Version {version}', { version: '4.0.5' })}</p>
            <p className="mt-3 text-sm text-ink-soft">{t('This software used to manage ATM cards.')}</p>
            <p className="mt-3 text-xs text-muted-soft">{t('Copyright © Arab National Bank, Riyadh')}</p>
          </div>
        </div>
        <div className="mt-6 flex justify-end">
          <button
            type="button"
            onClick={onClose}
            className="rounded-lg bg-primary px-5 py-2 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
          >
            {t('OK')}
          </button>
        </div>
      </div>
    </>,
    document.body,
  )
}

function ThemePicker() {
  const { t } = useT()
  const [theme, setTheme] = useState(loadTheme)
  const [open, setOpen] = useState(false)
  const rootRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    applyTheme(theme)
  }, [theme])

  // Close the popover on any click/tap outside it, or on Escape.
  useEffect(() => {
    if (!open) return
    const onOutside = (e: MouseEvent | TouchEvent) => {
      if (rootRef.current && !rootRef.current.contains(e.target as Node)) setOpen(false)
    }
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setOpen(false)
    }
    document.addEventListener('mousedown', onOutside)
    document.addEventListener('touchstart', onOutside)
    document.addEventListener('keydown', onKey)
    return () => {
      document.removeEventListener('mousedown', onOutside)
      document.removeEventListener('touchstart', onOutside)
      document.removeEventListener('keydown', onKey)
    }
  }, [open])

  return (
    <div className="relative" ref={rootRef}>
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        title={t('Theme')}
        aria-label={t('Choose theme')}
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
        <div className="absolute end-0 top-11 z-40 w-60 rounded-2xl border border-edge bg-surface p-4 shadow-lg">
            <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-muted-soft">
              {t('Mode')}
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
                  {/* The glyph carries the meaning either way round, so it
                      leads and the word follows it in both directions. */}
                  {mode === 'light' ? `☀ ${t('Light')}` : `☾ ${t('Dark')}`}
                </button>
              ))}
            </div>

            <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-muted-soft">
              {t('Accent Color')}
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
                  {t(accent.label)}
                </button>
              ))}
            </div>
          </div>
      )}
    </div>
  )
}

export default function TopNav({
  onSignOut,
  onHome,
  atHome = false,
}: {
  onSignOut?: () => void
  onHome?: () => void
  atHome?: boolean
}) {
  const { t } = useT()
  const [aboutOpen, setAboutOpen] = useState(false)

  const navBtn = 'rounded-lg px-3 py-2 text-sm font-medium transition-colors'
  const idleBtn = 'text-muted hover:bg-surface-muted hover:text-ink'
  const activeBtn = 'bg-primary-soft text-primary-ink'

  return (
    <header className="print-hidden sticky top-0 z-20 border-b border-edge bg-surface/90 backdrop-blur">
      <div className="mx-auto flex h-16 max-w-6xl items-center justify-between px-4 sm:px-6">
        {/* brand + nav travel together on the left; session controls stay right */}
        <div className="flex items-center gap-6">
          <div className="flex items-center gap-3">
            <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-gradient-to-br from-primary to-primary-strong text-white shadow-sm">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="h-5 w-5">
                <path d="M3 9.5 12 4l9 5.5" strokeLinecap="round" strokeLinejoin="round" />
                <path d="M5 10v7M9.5 10v7M14.5 10v7M19 10v7" strokeLinecap="round" />
                <path d="M3 20h18" strokeLinecap="round" />
              </svg>
            </div>
            <div className="leading-tight">
              <p className="text-sm font-semibold text-ink">{t('Static Data Management')}</p>
              <p className="text-xs text-muted">{t('Core Banking System')}</p>
            </div>
          </div>

          <nav className="hidden items-center gap-1 md:flex">
            {/* Home = this module's landing screen (the customer search).
                About opens the ported frmAbout dialog. */}
            <button
              type="button"
              onClick={() => onHome?.()}
              className={`${navBtn} ${atHome ? activeBtn : idleBtn}`}
            >
              {t('Home')}
            </button>
            <button type="button" onClick={() => setAboutOpen(true)} className={`${navBtn} ${idleBtn}`}>
              {t('About')}
            </button>
          </nav>
        </div>

        <div className="flex items-center gap-2.5">
          {session.loggedIn && (
            <span className="hidden rounded-full bg-surface-muted px-3 py-1.5 text-xs font-medium text-muted sm:inline">
              {/* The operator's id and branch code are Latin/numeric and must
                  not be reordered by the bidi algorithm when the label beside
                  them is Arabic. */}
              <span className="ltr-value inline-block">{session.userName}</span>
              {' · '}
              {t('Branch')} <span className="ltr-value inline-block">{session.branchCode}</span>
            </span>
          )}
          {/* The locale link sits next to the operator's name, where the legacy
              put its Change Screen Language menu item. */}
          <LocalePicker />
          <ThemePicker />
          {onSignOut && (
            <button
              type="button"
              onClick={onSignOut}
              title={t('Sign out')}
              className="rounded-lg border border-edge-strong bg-surface px-3 py-1.5 text-xs font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
            >
              {t('Sign out')}
            </button>
          )}
        </div>
      </div>

      {aboutOpen && <AboutDialog onClose={() => setAboutOpen(false)} />}
    </header>
  )
}
