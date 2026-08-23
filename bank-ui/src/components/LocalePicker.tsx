import { LOCALES, setLocale, useLocale } from '../i18n/locale.ts'
import { t } from '../i18n/index.ts'

// The revamp's frmChangeScreenLang.frm. The legacy opened a modal with an
// Arabic/English radio pair and a "Change Language" button; with exactly two
// locales that is three clicks for a one-bit choice, so this is the one link
// the dialog was worth — it names the language you would switch TO, in that
// language, which is the convention every bilingual site here follows and
// needs no translation of its own to be readable.
//
// One appearance, in two places: beside the operator name in the header, and
// opposite the mark on the logon form. It carried a second `plain` variant for
// a centred link under the logon form; that placement is gone and both callers
// now render the same pill, so the variant went with it.

const GlobeIcon = () => (
  <svg viewBox="0 0 20 20" fill="none" stroke="currentColor" strokeWidth="1.5" aria-hidden className="h-4 w-4">
    <circle cx="10" cy="10" r="7.25" />
    <ellipse cx="10" cy="10" rx="3.25" ry="7.25" />
    <path d="M3 10h14M4.2 6h11.6M4.2 14h11.6" strokeLinecap="round" />
  </svg>
)

export default function LocalePicker() {
  const locale = useLocale()
  const other = LOCALES.find((l) => l.key !== locale) ?? LOCALES[0]

  const className =
    'inline-flex items-center gap-1.5 rounded-lg border border-edge-strong bg-surface px-2.5 py-1.5 text-xs font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted'

  return (
    <button
      type="button"
      onClick={() => setLocale(other.key)}
      // The accessible name has to say what the control DOES; the visible text
      // is just the target language's own name, which on its own reads as a
      // label rather than an action.
      aria-label={`${t('Change the screen language')} — ${other.label}`}
      title={t('Choose language')}
      lang={other.key}
      className={className}
    >
      <GlobeIcon />
      {other.nativeLabel}
    </button>
  )
}
