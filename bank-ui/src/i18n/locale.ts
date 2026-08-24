// Locale selection — the revamp's port of the legacy `UserLang` global
// (globalVaribles.bas: ARABIC = 0, ENGLISH = 1) and frmChangeScreenLang.frm,
// which offered the operator an Arabic/English radio pair and a "Change
// Language" button.
//
// Shaped like theme.ts on purpose: a value applied as attributes on <html>,
// persisted to localStorage, with a ?lang= dev override. The difference is
// that locale also has to reach React — a theme is pure CSS, but every label
// re-renders when the locale changes — so this module doubles as a store that
// components subscribe to through useSyncExternalStore.

import { useSyncExternalStore } from 'react'

export type Locale = 'en' | 'ar'

export const LOCALES: { key: Locale; label: string; nativeLabel: string }[] = [
  { key: 'en', label: 'English', nativeLabel: 'English' },
  { key: 'ar', label: 'Arabic', nativeLabel: 'العربية' },
]

const STORAGE_KEY = 'csd-locale'
const DEFAULT_LOCALE: Locale = 'en'

/** RTL is a property of the locale, not a separate setting. */
export const dirOf = (locale: Locale): 'rtl' | 'ltr' => (locale === 'ar' ? 'rtl' : 'ltr')

function read(): Locale {
  // Dev convenience: ?lang=ar forces a locale (handy for testing), matching
  // theme.ts's ?theme= override.
  const param = new URLSearchParams(window.location.search).get('lang')
  if (param === 'ar' || param === 'en') return param
  try {
    const stored = localStorage.getItem(STORAGE_KEY)
    if (stored === 'ar' || stored === 'en') return stored
  } catch {
    // private browsing — fall through to the default
  }
  return DEFAULT_LOCALE
}

let current: Locale = DEFAULT_LOCALE
const listeners = new Set<() => void>()

/**
 * Writes the locale onto <html>. `dir` is what actually mirrors the layout:
 * every direction-sensitive rule in index.css and every logical Tailwind
 * utility (ms-/me-/ps-/pe-/start-/end-/text-start/text-end) keys off it, so no
 * component has to know which way the page runs. `lang` drives font selection
 * and the browser's own text handling.
 */
export function applyLocale(locale: Locale) {
  current = locale
  const root = document.documentElement
  root.lang = locale
  root.dir = dirOf(locale)
  try {
    localStorage.setItem(STORAGE_KEY, locale)
  } catch {
    // private browsing — the locale just won't persist
  }
}

/** Applies the persisted locale before the first paint (called from main.tsx). */
export function loadLocale(): Locale {
  const locale = read()
  applyLocale(locale)
  return locale
}

export function getLocale(): Locale {
  return current
}

export function setLocale(locale: Locale) {
  if (locale === current) return
  applyLocale(locale)
  listeners.forEach((notify) => notify())
}

function subscribe(listener: () => void): () => void {
  listeners.add(listener)
  return () => {
    listeners.delete(listener)
  }
}

/**
 * Run something whenever the locale changes, outside React. codes.ts uses this
 * to re-fetch /api/codes: the reference-data descriptions come back in the
 * operator's language, so the sets loaded for English are stale the moment the
 * screens switch to Arabic.
 */
export const subscribeLocale = subscribe

/**
 * Re-renders the caller when the locale changes. App calls this once at the
 * top, which is enough to re-render every screen below it — the same trick
 * useCodes() uses for the reference-data sets.
 */
export function useLocale(): Locale {
  return useSyncExternalStore(subscribe, getLocale, getLocale)
}
