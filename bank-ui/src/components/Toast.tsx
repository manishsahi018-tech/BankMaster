// Top-center feedback toasts. A single provider mounted above the app exposes
// useToast(); any screen can push a message that pins to the top-center of the
// viewport and auto-hides after 7 seconds (or when the user closes it).
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useRef,
  useState,
} from 'react'
import type { ReactNode } from 'react'
import { createPortal } from 'react-dom'

export type ToastKind = 'error' | 'warn' | 'info' | 'success'

interface ToastItem {
  id: number
  kind: ToastKind
  text: string
}

interface ToastApi {
  push: (kind: ToastKind, text: string) => void
  error: (text: string) => void
  warn: (text: string) => void
  info: (text: string) => void
  success: (text: string) => void
}

const ToastContext = createContext<ToastApi | null>(null)

/** Push feedback toasts from any screen. Must be under <ToastProvider>. */
export function useToast(): ToastApi {
  const ctx = useContext(ToastContext)
  if (!ctx) throw new Error('useToast must be used within <ToastProvider>')
  return ctx
}

/** How long a toast stays before it hides itself. */
const AUTO_HIDE_MS = 7000

export function ToastProvider({ children }: { children: ReactNode }) {
  const [toasts, setToasts] = useState<ToastItem[]>([])
  const idRef = useRef(0)
  const timerRef = useRef<number | null>(null)

  const remove = useCallback(() => {
    if (timerRef.current !== null) window.clearTimeout(timerRef.current)
    timerRef.current = null
    setToasts([])
  }, [])

  // Only ONE toast is shown at a time: a new message REPLACES the current one
  // rather than stacking, so repeating an action (e.g. clicking a grid button
  // with no row selected) refreshes the single toast instead of piling them up.
  const push = useCallback((kind: ToastKind, text: string) => {
    if (!text) return
    const id = (idRef.current += 1)
    setToasts([{ id, kind, text }])
    if (timerRef.current !== null) window.clearTimeout(timerRef.current)
    timerRef.current = window.setTimeout(() => setToasts([]), AUTO_HIDE_MS)
  }, [])

  const api = useMemo<ToastApi>(
    () => ({
      push,
      error: (text) => push('error', text),
      warn: (text) => push('warn', text),
      info: (text) => push('info', text),
      success: (text) => push('success', text),
    }),
    [push],
  )

  return (
    <ToastContext.Provider value={api}>
      {children}
      {createPortal(<Toaster toasts={toasts} onClose={remove} />, document.body)}
    </ToastContext.Provider>
  )
}

function Toaster({ toasts, onClose }: { toasts: ToastItem[]; onClose: (id: number) => void }) {
  return (
    <div className="pointer-events-none fixed inset-x-0 top-20 z-[100] flex flex-col items-center gap-2 px-4">
      {toasts.map((t) => (
        <ToastCard key={t.id} toast={t} onClose={() => onClose(t.id)} />
      ))}
    </div>
  )
}

const KIND_STYLE: Record<ToastKind, string> = {
  error: 'border-danger/30 bg-danger-soft text-danger',
  warn: 'border-warn/40 bg-warn-soft text-warn',
  info: 'border-primary/30 bg-primary-soft text-primary-ink',
  success: 'border-primary/30 bg-primary-soft text-primary-ink',
}

function ToastCard({ toast, onClose }: { toast: ToastItem; onClose: () => void }) {
  // Slide/fade in on mount for a bit of polish.
  const [shown, setShown] = useState(false)
  useEffect(() => {
    const raf = requestAnimationFrame(() => setShown(true))
    return () => cancelAnimationFrame(raf)
  }, [])

  return (
    <div
      role={toast.kind === 'error' ? 'alert' : 'status'}
      className={`pointer-events-auto flex w-full max-w-md items-start gap-2.5 rounded-xl border px-4 py-3 text-sm shadow-lg transition-all duration-200 ${
        KIND_STYLE[toast.kind]
      } ${shown ? 'translate-y-0 opacity-100' : '-translate-y-2 opacity-0'}`}
    >
      <span className="min-w-0 flex-1 break-words">{toast.text}</span>
      <button
        type="button"
        aria-label="Dismiss"
        onClick={onClose}
        className="-mr-1 -mt-0.5 shrink-0 rounded p-0.5 text-current opacity-60 transition-opacity hover:opacity-100"
      >
        <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4">
          <path d="M6.28 5.22a.75.75 0 0 0-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 1 0 1.06 1.06L10 11.06l3.72 3.72a.75.75 0 1 0 1.06-1.06L11.06 10l3.72-3.72a.75.75 0 0 0-1.06-1.06L10 8.94 6.28 5.22Z" />
        </svg>
      </button>
    </div>
  )
}
