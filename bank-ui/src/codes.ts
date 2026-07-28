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

let CODES: Record<string, CodeEntry[]> = {}
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
  inFlight = api
    .codes()
    .then((sets) => {
      CODES = sets
    })
    .catch(() => {
      CODES = {}
    })
    .finally(() => {
      inFlight = null
      version += 1
      listeners.forEach((notify) => notify())
    })
  return inFlight
}

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

/** "Q" → "Q-Iqama"; unknown or blank codes pass through unchanged. */
export function codeLabel(set: string, code: unknown): string {
  const c = String(code ?? '').trim()
  if (!c) return ''
  const found = CODES[set]?.find((e) => e.code === c)
  return found ? `${c}-${found.description}` : c
}

/** Combo options as "<code>-<description>"; falls back when the API is down. */
export function codeOptions(set: string, fallback: string[] = []): string[] {
  const entries = CODES[set]
  return entries?.length ? entries.map((e) => `${e.code}-${e.description}`) : fallback
}
