// Reference-data code sets loaded once at boot from /api/codes (legacy:
// stctltab recType rows + the Access combo tables). Screens translate raw
// codes to the legacy "<code>-<description>" display form.

import { api } from './api.ts'
import type { CodeEntry } from './api.ts'

let CODES: Record<string, CodeEntry[]> = {}

/** Loads the code sets before first render; empty sets if the API is down. */
export async function initCodes(): Promise<void> {
  try {
    CODES = await api.codes()
  } catch {
    CODES = {}
  }
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
