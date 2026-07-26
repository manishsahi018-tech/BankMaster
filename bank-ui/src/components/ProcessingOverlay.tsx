// Blocking "processing" modal shown while a server request is in flight, so the
// operator sees that work is happening in the backend and cannot double-submit.
// Portalled to document.body so the dim backdrop covers the whole viewport
// (the sticky header's backdrop-blur would otherwise clip a nested overlay).
import { useEffect, useState } from 'react'
import { createPortal } from 'react-dom'

export default function ProcessingOverlay({
  show,
  label = 'Fetching from server…',
}: {
  show: boolean
  label?: string
}) {
  // Fade + scale the card in on mount for a softer, less jarring appearance.
  const [mounted, setMounted] = useState(false)
  useEffect(() => {
    if (!show) return
    const raf = requestAnimationFrame(() => setMounted(true))
    return () => {
      cancelAnimationFrame(raf)
      setMounted(false)
    }
  }, [show])

  if (!show) return null

  return createPortal(
    <div
      role="status"
      aria-live="polite"
      aria-busy="true"
      className="fixed inset-0 z-[90] flex items-center justify-center bg-ink/50 p-4 backdrop-blur-[3px]"
    >
      <div
        className={`flex flex-col items-center gap-5 rounded-2xl border border-edge bg-surface px-12 py-9 shadow-2xl transition-all duration-200 ease-out ${
          mounted ? 'scale-100 opacity-100' : 'scale-95 opacity-0'
        }`}
      >
        {/* Spinner: a faint track with a rotating primary arc, plus a soft
            pulsing halo and the brand mark held static in the centre. */}
        <span className="relative flex h-14 w-14 items-center justify-center">
          <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-primary/15" />
          <span className="absolute h-14 w-14 animate-spin rounded-full border-[3px] border-primary/15 border-t-primary" />
          <svg
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="1.8"
            className="h-6 w-6 text-primary"
          >
            <path d="M3 9.5 12 4l9 5.5" strokeLinecap="round" strokeLinejoin="round" />
            <path d="M5 10v7M9.5 10v7M14.5 10v7M19 10v7" strokeLinecap="round" />
            <path d="M3 20h18" strokeLinecap="round" />
          </svg>
        </span>

        <div className="text-center">
          <p className="text-sm font-semibold text-ink">{label}</p>
          <p className="mt-1 text-xs text-muted">Please wait a moment…</p>
        </div>
      </div>
    </div>,
    document.body,
  )
}
