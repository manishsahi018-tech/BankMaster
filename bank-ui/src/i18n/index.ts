// Translation lookup.
//
// The key IS the English string: `t('Account Number')`. That is unusual for a
// React app, but it is the right trade here for two reasons. The screens are
// ports of named VB6 forms whose English captions are already the bank's
// vocabulary, and the dictionary we translate from is keyed the same way — the
// legacy caption arrays pair Arabic with the very English string the screen
// shows. Inventing a parallel key namespace would mean maintaining a mapping
// from our ids to the legacy's English just to reach the Arabic. It also keeps
// the English build byte-identical: under 'en', t() returns its argument.
//
// Where the same English genuinely needs two Arabic renderings, the caller
// disambiguates with a context prefix — t('grid|Action') — and ar-extra.ts
// carries the context-qualified entry.

import LEGACY_AR from './legacy-ar.ts'
import AR_EXTRA from './ar-extra.ts'
import { getLocale, useLocale, type Locale } from './locale.ts'

/**
 * Lookup key: case- and punctuation-insensitive, so a caller's "Account No:"
 * finds the dictionary's "Account No". Mirrors normalise() in
 * scripts/extract-legacy-captions.py — the two must agree or generated entries
 * become unreachable.
 */
function normaliseKey(text: string): string {
  return text.replace(/\s+/g, ' ').trim().replace(/[:*.…]+$/, '').trim().toLowerCase()
}

/** Context prefix, if any: 'grid|Action' → ['grid', 'Action']. */
function splitContext(key: string): { context: string | null; text: string } {
  const bar = key.indexOf('|')
  if (bar < 0) return { context: null, text: key }
  return { context: key.slice(0, bar), text: key.slice(bar + 1) }
}

/** English strings we asked for and had no Arabic for — reported by missingAr(). */
const missing = new Set<string>()

function lookupAr(key: string): string | undefined {
  const { context, text } = splitContext(key)
  const norm = normaliseKey(text)
  // Hand-written entries win over the generated legacy table, and a
  // context-qualified entry wins over the bare one.
  if (context) {
    const scoped = AR_EXTRA[`${context}|${norm}`]
    if (scoped) return scoped
  }
  return AR_EXTRA[norm] ?? LEGACY_AR[norm]
}

/**
 * Translates `key` into the active locale, substituting `{name}` placeholders.
 *
 * An untranslated string falls through to its English, which is the behaviour
 * we want on an enquiry screen: a label in the wrong language still tells the
 * operator what the field is, where a thrown error or a bare key would not.
 */
export function t(key: string, vars?: Record<string, string | number>): string {
  return translate(getLocale(), key, vars)
}

/**
 * The same lookup, in a locale named by the CALLER rather than by the operator.
 *
 * Almost everything wants t(): the app is in the operator's language and that
 * is the end of it. The exception is a DOCUMENT that carries its own language.
 * An archived statement does — BM_STMT_HEADER and PDP_STMT_HEADER record the
 * LANG_CODE the statement was produced in — and the archive's answer, not the
 * operator's current preference, is what that document has to be rendered in:
 * an Arabic statement is an Arabic statement whoever pulls it up.
 */
export function translate(
  locale: Locale,
  key: string,
  vars?: Record<string, string | number>,
): string {
  const { text } = splitContext(key)
  // A blank label is a caller passing through an absent value, not a string
  // anyone needs translated — return it without recording a miss.
  if (!text) return text
  let out = text
  if (locale === 'ar') {
    const arabic = lookupAr(key)
    if (arabic) out = arabic
    else if (import.meta.env.DEV) missing.add(text)
  }
  if (vars) {
    out = out.replace(/\{(\w+)\}/g, (whole, name: string) =>
      name in vars ? String(vars[name]) : whole,
    )
  }
  return out
}

/**
 * t() bound to the current locale, for components that must re-render when it
 * changes. t() itself reads the locale at call time, so a component that does
 * not subscribe would keep its stale English until something else re-rendered
 * it — this is the subscription.
 */
export function useT(): { t: typeof t; locale: Locale } {
  const locale = useLocale()
  return { t, locale }
}

/**
 * The English strings that had no Arabic this session (dev only) — run
 * `window.__missingAr()` in the console after walking a screen to find gaps to
 * add to ar-extra.ts.
 */
export function missingAr(): string[] {
  return [...missing].sort()
}

if (import.meta.env.DEV) {
  ;(window as unknown as { __missingAr: () => string[] }).__missingAr = missingAr

  // A hand-written key that is not already in normalised form can never be
  // reached: lookups normalise first, so an entry keyed 'Stmt. Freq.' or
  // 'Fetching from server…' sits in the map and is silently skipped. That is
  // invisible — the string just renders English — so it is asserted here
  // rather than left to be noticed on a screen.
  const unreachable = Object.keys(AR_EXTRA).filter((k) => normaliseKey(k) !== k)
  if (unreachable.length) {
    console.error(
      `[i18n] ${unreachable.length} ar-extra key(s) are not in normalised form and will never match:`,
      unreachable,
    )
  }
}

export { useLocale, getLocale, setLocale, applyLocale, loadLocale, LOCALES, dirOf } from './locale.ts'
export type { Locale } from './locale.ts'
