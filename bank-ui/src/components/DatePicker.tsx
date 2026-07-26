// Self-contained calendar date picker (no external dependency — the target PC is
// offline). The stored value is the legacy YYYYMMDD string the API expects; the
// button shows it as DD/MM/YYYY and a popover calendar edits it.
import { useEffect, useRef, useState } from 'react'

const WEEKDAYS = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
const MONTHS = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
]

const pad = (n: number) => String(n).padStart(2, '0')

/** Parse a YYYYMMDD string to a Date, or null if it isn't a valid date. */
function parse(v: string): Date | null {
  if (!/^\d{8}$/.test(v)) return null
  const y = +v.slice(0, 4)
  const m = +v.slice(4, 6) - 1
  const d = +v.slice(6, 8)
  const dt = new Date(y, m, d)
  return dt.getFullYear() === y && dt.getMonth() === m && dt.getDate() === d ? dt : null
}

const toYmd = (dt: Date) => `${dt.getFullYear()}${pad(dt.getMonth() + 1)}${pad(dt.getDate())}`

const display = (v: string) => {
  const dt = parse(v)
  return dt ? `${pad(dt.getDate())}/${pad(dt.getMonth() + 1)}/${dt.getFullYear()}` : ''
}

export function DatePicker({
  value,
  onChange,
  id,
  className = '',
  placeholder = 'dd/mm/yyyy',
  min = '',
  max = '',
}: {
  value: string
  onChange: (yyyymmdd: string) => void
  id?: string
  className?: string
  placeholder?: string
  /** Inclusive lower/upper bounds as YYYYMMDD; days outside are disabled. */
  min?: string
  max?: string
}) {
  const [open, setOpen] = useState(false)
  const rootRef = useRef<HTMLDivElement>(null)
  const selected = parse(value)
  const [view, setView] = useState(() => selected ?? new Date())

  // Jump the visible month to the selected date whenever the popover opens.
  useEffect(() => {
    if (open) setView(parse(value) ?? new Date())
  }, [open, value])

  // Close on outside click / Escape.
  useEffect(() => {
    if (!open) return
    const onOutside = (e: MouseEvent | TouchEvent) => {
      if (rootRef.current && !rootRef.current.contains(e.target as Node)) setOpen(false)
    }
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setOpen(false)
    }
    document.addEventListener('mousedown', onOutside)
    document.addEventListener('touchstart', onOutside)
    document.addEventListener('keydown', onKey)
    return () => {
      document.removeEventListener('mousedown', onOutside)
      document.removeEventListener('touchstart', onOutside)
      document.removeEventListener('keydown', onKey)
    }
  }, [open])

  const year = view.getFullYear()
  const month = view.getMonth()
  const firstWeekday = new Date(year, month, 1).getDay()
  const daysInMonth = new Date(year, month + 1, 0).getDate()
  const cells: (number | null)[] = [
    ...Array<null>(firstWeekday).fill(null),
    ...Array.from({ length: daysInMonth }, (_, i) => i + 1),
  ]
  const today = new Date()
  const isToday = (d: number) =>
    year === today.getFullYear() && month === today.getMonth() && d === today.getDate()
  const isSelected = (d: number) =>
    !!selected &&
    year === selected.getFullYear() &&
    month === selected.getMonth() &&
    d === selected.getDate()

  // YYYYMMDD is zero-padded, so lexicographic compare == chronological compare.
  const outOfRange = (ymd: string) => (!!min && ymd < min) || (!!max && ymd > max)
  const todayYmd = toYmd(today)
  const todayDisabled = outOfRange(todayYmd)

  const pick = (d: number) => {
    onChange(toYmd(new Date(year, month, d)))
    setOpen(false)
  }

  return (
    <div className="relative" ref={rootRef}>
      <button
        type="button"
        id={id}
        onClick={() => setOpen((o) => !o)}
        className={`flex items-center gap-2 rounded-lg border border-edge-strong bg-surface px-3 py-2.5 text-sm shadow-xs transition-colors hover:bg-surface-muted focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50 ${className}`}
      >
        <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4 shrink-0 text-muted">
          <path
            fillRule="evenodd"
            d="M5.75 2a.75.75 0 0 1 .75.75V4h7V2.75a.75.75 0 0 1 1.5 0V4h.25A2.75 2.75 0 0 1 18 6.75v8.5A2.75 2.75 0 0 1 15.25 18H4.75A2.75 2.75 0 0 1 2 15.25v-8.5A2.75 2.75 0 0 1 4.75 4H5V2.75A.75.75 0 0 1 5.75 2Zm10.75 6.5H3.5v6.75c0 .69.56 1.25 1.25 1.25h10.5c.69 0 1.25-.56 1.25-1.25V8.5Z"
            clipRule="evenodd"
          />
        </svg>
        <span className={display(value) ? 'text-ink' : 'text-muted-soft'}>
          {display(value) || placeholder}
        </span>
      </button>

      {open && (
        <div className="absolute left-0 top-12 z-50 w-64 rounded-2xl border border-edge bg-surface p-3 shadow-lg">
          <div className="mb-2 flex items-center justify-between">
            <button
              type="button"
              onClick={() => setView(new Date(year, month - 1, 1))}
              aria-label="Previous month"
              className="rounded-lg p-1.5 text-muted transition-colors hover:bg-surface-muted hover:text-ink"
            >
              <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4">
                <path fillRule="evenodd" d="M12.79 5.23a.75.75 0 0 1 0 1.06L9.06 10l3.73 3.71a.75.75 0 1 1-1.06 1.06l-4.25-4.24a.75.75 0 0 1 0-1.06l4.25-4.24a.75.75 0 0 1 1.06 0Z" clipRule="evenodd" />
              </svg>
            </button>
            <span className="text-sm font-semibold text-ink">
              {MONTHS[month]} {year}
            </span>
            <button
              type="button"
              onClick={() => setView(new Date(year, month + 1, 1))}
              aria-label="Next month"
              className="rounded-lg p-1.5 text-muted transition-colors hover:bg-surface-muted hover:text-ink"
            >
              <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4">
                <path fillRule="evenodd" d="M7.21 14.77a.75.75 0 0 1 0-1.06L10.94 10 7.21 6.29a.75.75 0 1 1 1.06-1.06l4.25 4.24a.75.75 0 0 1 0 1.06l-4.25 4.24a.75.75 0 0 1-1.06 0Z" clipRule="evenodd" />
              </svg>
            </button>
          </div>

          <div className="mb-1 grid grid-cols-7 gap-0.5 text-center text-[11px] font-medium text-muted-soft">
            {WEEKDAYS.map((w) => (
              <span key={w} className="py-1">
                {w}
              </span>
            ))}
          </div>

          <div className="grid grid-cols-7 gap-0.5">
            {cells.map((d, i) => {
              if (d === null) return <span key={i} />
              const disabled = outOfRange(toYmd(new Date(year, month, d)))
              return (
                <button
                  key={i}
                  type="button"
                  disabled={disabled}
                  onClick={() => pick(d)}
                  className={`h-8 rounded-lg text-sm transition-colors ${
                    disabled
                      ? 'cursor-not-allowed text-muted-soft opacity-40'
                      : isSelected(d)
                        ? 'bg-primary font-semibold text-white'
                        : isToday(d)
                          ? 'border border-primary/40 text-primary-ink hover:bg-primary-soft'
                          : 'text-ink hover:bg-surface-muted'
                  }`}
                >
                  {d}
                </button>
              )
            })}
          </div>

          <div className="mt-2 border-t border-edge-soft pt-2 text-right">
            <button
              type="button"
              disabled={todayDisabled}
              onClick={() => {
                onChange(todayYmd)
                setOpen(false)
              }}
              className={`rounded-md px-2 py-1 text-xs font-medium transition-colors ${
                todayDisabled
                  ? 'cursor-not-allowed text-muted-soft opacity-40'
                  : 'text-primary-ink hover:bg-primary-soft'
              }`}
            >
              Today
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
