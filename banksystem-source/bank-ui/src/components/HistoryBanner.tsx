import { formatTimestamp } from '../schema/helpers.ts'

/**
 * History-mode marker — the legacy forms show an lblHistory label when
 * opened from an update-history row (custHistoryAction / accHistoryAction).
 * Rendered under the screen title when a snapshot is being displayed.
 */
export default function HistoryBanner({ asOf }: { asOf?: string }) {
  if (!asOf) return null
  return (
    <div className="mb-5 flex items-center gap-2.5 rounded-xl border border-warn/40 bg-warn-soft px-4 py-3 text-sm text-warn">
      <svg viewBox="0 0 20 20" fill="currentColor" className="h-5 w-5 shrink-0 opacity-70">
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm.75-13a.75.75 0 0 0-1.5 0v5c0 .27.144.518.377.651l3.5 2a.75.75 0 1 0 .746-1.302L10.75 9.565V5Z"
          clipRule="evenodd"
        />
      </svg>
      History — this is the record as of {formatTimestamp(asOf)}, not the live profile.
    </div>
  )
}
