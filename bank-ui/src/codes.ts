// Reference-data code sets loaded once from /api/codes (legacy: stctltab
// recType rows + the Access combo tables). Screens translate raw codes to the
// legacy "<code>-<description>" display form.
//
// The load is NON-BLOCKING: nothing waits on it. Both accessors already degrade
// on their own (codeLabel returns the bare code, codeOptions its fallback), so a
// screen rendered before the sets arrive is correct, just less descriptive. App
// subscribes via useCodes() and re-renders once they land, which swaps the raw
// codes for labels in place. The API caches the sets server-side and pre-loads
// them at startup, so in practice this window is short.

import { useSyncExternalStore } from 'react'
import { api } from './api.ts'
import type { CodeEntry } from './api.ts'
import { getLocale, subscribeLocale, type Locale } from './i18n/locale.ts'

let CODES: Record<string, CodeEntry[]> = {}
/**
 * The locale the loaded sets describe.
 *
 * <p>The API answers /api/codes in the language the request asked for, so the
 * sets are locale-specific data, not static reference data — switching to
 * Arabic with English descriptions still in hand would leave every combo and
 * every code→description label reading English on an otherwise Arabic screen.
 */
let loadedFor: Locale | null = null
/** Bumped when the sets arrive; useSyncExternalStore snapshots this. */
let version = 0
const listeners = new Set<() => void>()
let inFlight: Promise<void> | null = null

/**
 * Starts the code-set load. Safe to call more than once — concurrent callers
 * share the same request. Never rejects: an API failure leaves the sets empty
 * so the caller is not forced to handle it.
 */
export function initCodes(): Promise<void> {
  if (inFlight) return inFlight
  const locale = getLocale()
  inFlight = api
    .codes()
    .then((sets) => {
      CODES = sets
      loadedFor = locale
    })
    .catch(() => {
      CODES = {}
      loadedFor = null
    })
    .finally(() => {
      inFlight = null
      version += 1
      listeners.forEach((notify) => notify())
    })
  return inFlight
}

// Re-fetch on a language switch. Nothing awaits this: the sets that are
// already in hand keep rendering (in the previous language) until the new ones
// land, and the version bump then swaps them in place — the same degrade-in-
// place behaviour as the very first load.
subscribeLocale(() => {
  if (loadedFor === null || loadedFor === getLocale()) return
  void initCodes()
})

function subscribe(listener: () => void): () => void {
  listeners.add(listener)
  return () => {
    listeners.delete(listener)
  }
}

const snapshot = () => version

/**
 * Re-renders the caller when the code sets arrive. App calls this once, so every
 * screen below it picks up the labels without each screen subscribing itself.
 */
export function useCodes(): number {
  return useSyncExternalStore(subscribe, snapshot, snapshot)
}

/**
 * The sets whose reference code is WIDER than the code the data stores, and so
 * cannot be matched on equality.
 *
 * stcusttab holds educationCode / professionCode / positionCode / monthlyIncome
 * in 2 characters and segmentation / packageAcc in 1, while stctltab.ctlCode is
 * 4 — the stored "03" is the TAIL of the reference code "0003". The legacy
 * matched exactly that way, positionally: Mid(cmbEducation.List(i), 3, 2) =
 * tCode (globalFunctions.bas:2439, and the same three lines below it for
 * profession, position and income), with the 1-char pair added to their combos
 * as Right(code, 1) (frmIndividualOthers2.frm:2680, 2694).
 *
 * titleCode is deliberately NOT here: it is a 2-char code matched from the LEFT
 * (globalFunctions.bas:1644), which is plain equality.
 */
const TAIL_MATCHED = new Set([
  'education',
  'profession',
  'position',
  'monthlyIncome',
  'segmentation',
  'packageAcc',
])

/**
 * "Q" → "Q-Iqama"; unknown or blank codes pass through unchanged.
 *
 * The label carries the ENTRY's code, not the code passed in — for a
 * tail-matched set those differ ("03" resolves to "0003-Diploma"), and the full
 * reference code is what the legacy combo showed.
 */
export function codeLabel(set: string, code: unknown): string {
  const c = String(code ?? '').trim()
  if (!c) return ''
  const entries = CODES[set]
  const found =
    entries?.find((e) => e.code === c) ??
    (TAIL_MATCHED.has(set)
      ? entries?.find((e) => e.code.length > c.length && e.code.endsWith(c))
      : undefined)
  return found ? `${found.code}-${found.description}` : c
}

/** Combo options as "<code>-<description>"; falls back when the API is down. */
export function codeOptions(set: string, fallback: string[] = []): string[] {
  const entries = CODES[set]
  return entries?.length ? entries.map((e) => `${e.code}-${e.description}`) : fallback
}
