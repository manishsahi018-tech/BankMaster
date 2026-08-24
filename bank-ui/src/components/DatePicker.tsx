// Self-contained calendar date picker (no external dependency — the target PC is
// offline). The stored value is the legacy YYYYMMDD string the API expects; the
// button shows it as DD/MM/YYYY and a popover calendar edits it.
import { useEffect, useMemo, useRef, useState } from 'react'
import { useT } from '../i18n/index.ts'
import type { Locale } from '../i18n/locale.ts'

/**
 * Month and weekday names come from Intl, not from the translation dictionary:
 * they are calendar data every platform already ships, and nineteen more
 * dictionary entries would be nineteen more things to keep right.
 *
 * The locale tag is deliberately bare 'ar' rather than 'ar-SA'. ar-SA defaults
 * to the ISLAMIC calendar, which would label a Gregorian date grid with Hijri
 * month names — the archival dates are Gregorian, so `calendar: 'gregory'`
 * pins it either way.
 *
 * The DAY NUMBERS in the grid are rendered as plain JS numbers, never through
 * Intl, so they stay Western in both locales — as the legacy screens show.
 */
function calendarNames(locale: Locale) {
  const tag = locale === 'ar' ? 'ar' : 'en-GB'
  const monthFmt = new Intl.DateTimeFormat(tag, { month: 'long', calendar: 'gregory' })
  const weekdayFmt = new Intl.DateTimeFormat(tag, { weekday: 'short', calendar: 'gregory' })
  const monthShortFmt = new Intl.DateTimeFormat(tag, { month: 'short', calendar: 'gregory' })
  // 2021-08-01 was a Sunday, which is where the grid's first column starts.
  const weekdays = Array.from({ length: 7 }, (_, i) => weekdayFmt.format(new Date(2021, 7, 1 + i)))
  const months = Array.from({ length: 12 }, (_, i) => monthFmt.format(new Date(2021, i, 1)))
  const monthsShort = Array.from({ length: 12 }, (_, i) => monthShortFmt.format(new Date(2021, i, 1)))
  return { weekdays, months, monthsShort }
}

const pad = (n: number) => String(n).padStart(2, '0')

// How far back the year dropdown reaches when the caller gives no `min` bound.
// The archival data predates the app by a long way, so this is deliberately
// generous; widen it here if a teller ever needs to reach further.
const YEARS_BACK = 30
// …and how far forward with no `max`. Enquiry screens look at the past, so one
// year of headroom is enough to cover a post-dated value already in the field.
const YEARS_FORWARD = 1

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

  const { t, locale } = useT()
  const { weekdays, monthsShort } = useMemo(() => calendarNames(locale), [locale])

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

  // A month is reachable when any day in it is inside [min, max] — i.e. it does
  // not end before min nor start after max. Used to grey out dead months in the
  // dropdown and to stop the ‹ › arrows walking out of the allowed range.
  const monthInRange = (y: number, m: number) =>
    !(
      (!!min && toYmd(new Date(y, m + 1, 0)) < min) ||
      (!!max && toYmd(new Date(y, m, 1)) > max)
    )

  // Years the dropdown offers: the bounds when the caller gave them, otherwise a
  // window around today. The viewed and selected years are folded in so a value
  // already outside that window still shows up rather than silently vanishing.
  const minYear = parse(min)?.getFullYear()
  const maxYear = parse(max)?.getFullYear()
  const selectedYear = selected?.getFullYear() ?? year
  const firstYear = Math.min(minYear ?? today.getFullYear() - YEARS_BACK, year, selectedYear)
  const lastYear = Math.max(maxYear ?? today.getFullYear() + YEARS_FORWARD, year, selectedYear)
  // Newest first — enquiries are far more often about recent dates than old ones.
  const years = Array.from({ length: lastYear - firstYear + 1 }, (_, i) => lastYear - i)

  // Jumping straight to a year can land on a month outside [min, max] (picking
  // 2026 while viewing December when max is 2026-03-15). Snap to the nearest
  // reachable month in that year so the grid is never entirely disabled.
  const showMonth = (y: number, m: number) => {
    let month0 = m
    if (!monthInRange(y, month0)) {
      if (maxYear === y && !!max && toYmd(new Date(y, month0, 1)) > max) {
        month0 = parse(max)!.getMonth()
      } else if (minYear === y) {
        month0 = parse(min)!.getMonth()
      }
    }
    setView(new Date(y, month0, 1))
  }

  const headerControl =
    'rounded-lg border border-edge-strong bg-surface px-2 py-1 text-sm font-semibold text-ink ' +
    'transition-colors hover:bg-surface-muted focus:outline-none focus-visible:ring-2 ' +
    'focus-visible:ring-primary/50 disabled:cursor-not-allowed disabled:opacity-40'

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
          {display(value) || t(placeholder)}
        </span>
      </button>

      {open && (
        <div className="absolute start-0 top-12 z-50 w-72 rounded-2xl border border-edge bg-surface p-3 shadow-lg">
          {/* Month and year are dropdowns, not just a label: reaching a date
              years back through the ‹ › arrows alone is 12 clicks per year. The
              arrows stay for stepping a month at a time. */}
          <div className="mb-2 flex items-center gap-1">
            <button
              type="button"
              onClick={() => setView(new Date(year, month - 1, 1))}
              disabled={!monthInRange(year, month - 1)}
              aria-label={t('Previous month')}
              className="rounded-lg p-1.5 text-muted transition-colors hover:bg-surface-muted hover:text-ink disabled:cursor-not-allowed disabled:opacity-40 disabled:hover:bg-transparent"
            >
              <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4 rtl:-scale-x-100">
                <path fillRule="evenodd" d="M12.79 5.23a.75.75 0 0 1 0 1.06L9.06 10l3.73 3.71a.75.75 0 1 1-1.06 1.06l-4.25-4.24a.75.75 0 0 1 0-1.06l4.25-4.24a.75.75 0 0 1 1.06 0Z" clipRule="evenodd" />
              </svg>
            </button>

            <div className="flex flex-1 items-center justify-center gap-1">
              <select
                value={month}
                onChange={(e) => showMonth(year, +e.target.value)}
                aria-label={t('Month')}
                className={headerControl}
              >
                {monthsShort.map((name, i) => (
                  <option key={name} value={i} disabled={!monthInRange(year, i)}>
                    {name}
                  </option>
                ))}
              </select>
              <select
                value={year}
                onChange={(e) => showMonth(+e.target.value, month)}
                aria-label={t('Year')}
                className={headerControl}
              >
                {years.map((y) => (
                  <option key={y} value={y}>
                    {y}
                  </option>
                ))}
              </select>
            </div>

            <button
              type="button"
              onClick={() => setView(new Date(year, month + 1, 1))}
              disabled={!monthInRange(year, month + 1)}
              aria-label={t('Next month')}
              className="rounded-lg p-1.5 text-muted transition-colors hover:bg-surface-muted hover:text-ink disabled:cursor-not-allowed disabled:opacity-40 disabled:hover:bg-transparent"
            >
              <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4 rtl:-scale-x-100">
                <path fillRule="evenodd" d="M7.21 14.77a.75.75 0 0 1 0-1.06L10.94 10 7.21 6.29a.75.75 0 1 1 1.06-1.06l4.25 4.24a.75.75 0 0 1 0 1.06l-4.25 4.24a.75.75 0 0 1-1.06 0Z" clipRule="evenodd" />
              </svg>
            </button>
          </div>

          <div className="mb-1 grid grid-cols-7 gap-0.5 text-center text-[11px] font-medium text-muted-soft">
            {weekdays.map((w) => (
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

          <div className="mt-2 border-t border-edge-soft pt-2 text-end">
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
              {t('Today')}
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
