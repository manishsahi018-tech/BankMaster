// Whether any server request is in flight, so ONE loader can cover the whole
// app.
//
// This lives beside the fetch layer rather than in the screens on purpose. The
// overlay used to be driven by a `busy` flag that only App.goFetch set, so it
// appeared for navigation but never for a screen that fetched on its own —
// Transaction/Transfer Enquiry, the three statement screens and Merchant all
// silently opted out, and Transfer Enquiry showed no in-flight feedback of any
// kind. Counting requests at the single choke point every call already passes
// through means a screen cannot forget to raise it, and no new screen has to
// remember.

import { useSyncExternalStore } from 'react'

/**
 * How long the overlay lingers after the last request finishes.
 *
 * Several screens page in a LOOP — TransactionEnquiry walks up to 100 pages,
 * the statement screens follow the gateway's pointer until it signals
 * completion — so the count returns to zero between pages. Hiding instantly
 * would strobe the overlay once per page. Waiting a beat before hiding turns a
 * burst of requests into one continuous overlay, and costs an unnoticeable
 * delay on a single call.
 */
const HIDE_DELAY_MS = 200

let inFlight = 0
let visible = false
let hideTimer: ReturnType<typeof setTimeout> | undefined
const listeners = new Set<() => void>()

function setVisible(next: boolean): void {
  if (visible === next) return
  visible = next
  for (const listener of listeners) listener()
}

/** Call when a request starts. Shows the overlay immediately. */
export function beginRequest(): void {
  inFlight += 1
  if (hideTimer !== undefined) {
    clearTimeout(hideTimer)
    hideTimer = undefined
  }
  setVisible(true)
}

/**
 * Call when a request settles — from a `finally`, so a rejected or aborted
 * request cannot strand the counter above zero and pin the overlay on screen
 * forever.
 */
export function endRequest(): void {
  inFlight = Math.max(0, inFlight - 1)
  if (inFlight > 0) return
  if (hideTimer !== undefined) clearTimeout(hideTimer)
  hideTimer = setTimeout(() => {
    hideTimer = undefined
    // Re-check: another request may have started while we waited.
    if (inFlight === 0) setVisible(false)
  }, HIDE_DELAY_MS)
}

function subscribe(listener: () => void): () => void {
  listeners.add(listener)
  return () => {
    listeners.delete(listener)
  }
}

function snapshot(): boolean {
  return visible
}

/** True while a request is in flight (plus the short settle window). */
export function useRequestPending(): boolean {
  return useSyncExternalStore(subscribe, snapshot, snapshot)
}
