import type { ReactNode } from 'react'

// Shared primitives for the customer profile screens rebuilt from the legacy
// VB6 forms (frmIndividualSaudi, frmIndividualOthers, frmJuristicMain).
//
// The look follows the Customer Profile design: segmented calendar toggles, an
// Identity Documents table, DD/MM/YYYY triples and pill status chips. Enquiry
// mode is read-only — the legacy disables every frame in search/history mode —
// so nothing here is interactive, but it keeps the shape of the form.

/** stcusttab dates are raw YYYYMMDD; the legacy renders them as [dd][mm][yyyy]. */
export function dateParts(value: unknown): { d: string; m: string; y: string } {
  const s = String(value ?? '').trim()
  if (s.length < 8) return { d: '', m: '', y: '' }
  return { y: s.slice(0, 4), m: s.slice(4, 6), d: s.slice(6, 8) }
}

/** Legacy convention throughout: "0" or blank selects the first option. */
export const isFirst = (code: unknown) => {
  const s = String(code ?? '').trim()
  return s === '' || s === '0'
}

export const labelCls = 'mb-1.5 block text-sm font-medium text-ink-soft'

const boxBase =
  'block w-full rounded-lg border border-edge-strong bg-surface px-3 py-2 text-sm text-ink ' +
  'shadow-xs whitespace-pre-wrap break-words min-h-[2.375rem]'

/**
 * A read-only value box styled like the form's text input.
 *
 * Deliberately a div rather than an <input>: an input clips anything wider than
 * the control, silently truncating long names and addresses. This wraps, so no
 * value is ever hidden on an enquiry screen. Full text is also on hover.
 */
export function RoText({
  value,
  className = '',
  dir,
  muted = false,
}: {
  value: unknown
  className?: string
  dir?: 'auto' | 'rtl' | 'ltr'
  /** grey ground — the legacy greys fields it never lets you edit */
  muted?: boolean
}) {
  const text = value == null ? '' : String(value)
  return (
    <div
      dir={dir ?? 'auto'}
      title={text || undefined}
      className={`${boxBase} ${muted ? 'border-edge bg-surface-muted text-muted' : ''} ${className}`}
    >
      {text || ' '}
    </div>
  )
}

/** Read-only counterpart of the Select control — keeps the chevron affordance. */
export function RoCombo({
  value,
  className = '',
  dir,
}: {
  value: unknown
  className?: string
  dir?: 'auto' | 'rtl' | 'ltr'
}) {
  const text = value == null ? '' : String(value)
  return (
    <div className={`relative ${className}`}>
      <div dir={dir ?? 'auto'} title={text || undefined} className={`${boxBase} pr-9`}>
        {text || ' '}
      </div>
      <svg
        viewBox="0 0 20 20"
        fill="currentColor"
        aria-hidden
        className="pointer-events-none absolute right-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-soft"
      >
        <path
          fillRule="evenodd"
          d="M5.23 7.21a.75.75 0 0 1 1.06.02L10 11.17l3.71-3.94a.75.75 0 1 1 1.08 1.04l-4.25 4.5a.75.75 0 0 1-1.08 0l-4.25-4.5a.75.75 0 0 1 .02-1.06Z"
          clipRule="evenodd"
        />
      </svg>
    </div>
  )
}

export function Field({
  label,
  children,
  className = '',
}: {
  label: string
  children: ReactNode
  className?: string
}) {
  return (
    <div className={className}>
      <span className={labelCls}>{label}</span>
      {children}
    </div>
  )
}

/** Segmented choice, showing the stored option. Read-only: the legacy greys these. */
export function Segmented({ options, selected }: { options: readonly string[]; selected: number }) {
  return (
    <div className="inline-flex rounded-lg border border-edge-strong bg-surface p-0.5 shadow-xs">
      {options.map((opt, i) => (
        <span
          key={opt}
          className={`rounded-md px-2.5 py-1 text-xs font-medium ${
            i === selected ? 'bg-primary text-white shadow-sm' : 'text-muted'
          }`}
        >
          {opt}
        </span>
      ))}
    </div>
  )
}

/** DD / MM / YYYY — the legacy gives each part its own control. */
export function DateTriple({ value }: { value: unknown }) {
  const { d, m, y } = dateParts(value)
  const part = (v: string, w: string, ph: string) => (
    <span
      className={`${w} rounded-md border border-edge-strong bg-surface px-1.5 py-1.5 text-center text-sm shadow-xs tabular-nums ${
        v ? 'text-ink' : 'text-faint'
      }`}
    >
      {v || ph}
    </span>
  )
  return (
    <div className="flex items-center gap-1">
      {part(d, 'w-10', 'DD')}
      <span className="text-faint">/</span>
      {part(m, 'w-10', 'MM')}
      <span className="text-faint">/</span>
      {part(y, 'w-14', 'YYYY')}
    </div>
  )
}

/**
 * A row of read-only CHECK-BOXES — the legacy's packed flag groups (special
 * status on frmIndividualSaudi, ownership on the page-2 forms).
 *
 * Square boxes with a tick, not pills with a round check: the source control is
 * a VB6 check-box group, and a round mark in a pill reads as a RADIO — i.e. as
 * "pick one" where the form means "tick any". Unticked boxes stay visible, so
 * the group shows what was NOT selected, which is half of what a flag row says.
 */
export function CheckBoxGroup({ flags }: { flags: { label: string; on: boolean }[] }) {
  return (
    <div className="flex flex-wrap gap-x-6 gap-y-2.5">
      {flags.map(({ label, on }) => (
        <span
          key={label}
          className={`inline-flex items-center gap-2 text-sm ${
            on ? 'font-medium text-ink' : 'text-muted'
          }`}
        >
          <span
            aria-hidden
            className={`flex h-4 w-4 shrink-0 items-center justify-center rounded-[4px] border ${
              on ? 'border-primary bg-primary' : 'border-edge-strong bg-surface'
            }`}
          >
            {on && (
              <svg
                viewBox="0 0 12 12"
                fill="none"
                stroke="white"
                strokeWidth="2.5"
                className="h-2.5 w-2.5"
              >
                <path d="M2.5 6.5 5 9l4.5-5.5" strokeLinecap="round" strokeLinejoin="round" />
              </svg>
            )}
          </span>
          {label}
        </span>
      ))}
    </div>
  )
}

export interface IdRowData {
  idType?: string
  idNo?: string
  idIssuedAt?: string
  idDateType?: string
  /** Q rows only: "1" = Plastic, else Book. */
  iqamaType?: string
  idIssueDateH?: string
  idIssueDateG?: string
  idExpiryDateH?: string
  idExpiryDateG?: string
  /** Juristic 'A' row only: the Approver Name. */
  idRefName?: string
}

export interface DocRow {
  label: string
  row: IdRowData
  /** row-specific trailing cell, e.g. the Iqama Book/Plastic choice */
  extra?: ReactNode
}

/**
 * The Identity Documents table. `showIssuedAt` is false on the juristic
 * Licence / SAMA / Approver rows, which carry no issued-at control.
 */
export function DocTable({
  rows,
  showIssuedAt = true,
  extraHeader,
}: {
  rows: DocRow[]
  showIssuedAt?: boolean
  extraHeader?: string
}) {
  const heads = [
    'Document',
    'Number',
    ...(showIssuedAt ? ['Issued At'] : []),
    'Calendar',
    'Issue Date',
    'Expiry Date',
    ...(extraHeader ? [extraHeader] : []),
  ]
  return (
    <div className="overflow-x-auto">
      <table className="w-full min-w-[860px] border-collapse text-sm">
        <thead>
          <tr className="border-b border-edge text-left">
            {heads.map((h) => (
              <th
                key={h}
                className="whitespace-nowrap px-2 py-2.5 text-xs font-semibold uppercase tracking-wide text-muted"
              >
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map(({ label, row, extra }) => {
            const hijri = isFirst(row.idDateType)
            return (
              <tr key={label} className="border-b border-edge-soft last:border-b-0">
                <td className="whitespace-nowrap px-2 py-2.5 font-medium text-ink-soft">{label}</td>
                <td className="px-2 py-2.5">
                  <RoText value={row.idNo} className="w-40" />
                </td>
                {showIssuedAt && (
                  <td className="px-2 py-2.5">
                    <RoCombo value={row.idIssuedAt} className="w-36" />
                  </td>
                )}
                <td className="px-2 py-2.5">
                  <Segmented options={['H', 'G']} selected={hijri ? 0 : 1} />
                </td>
                <td className="px-2 py-2.5">
                  <DateTriple value={hijri ? row.idIssueDateH : row.idIssueDateG} />
                </td>
                <td className="px-2 py-2.5">
                  <DateTriple value={hijri ? row.idExpiryDateH : row.idExpiryDateG} />
                </td>
                {extraHeader && <td className="px-2 py-2.5">{extra}</td>}
              </tr>
            )
          })}
        </tbody>
      </table>
    </div>
  )
}

export interface AuditInfo {
  openDate?: string
  openBranch?: string
  openMakerId?: string
  openSupervisorId?: string
  lastUpdateDate?: string
  updateBranch?: string
  updateMakerId?: string
  updateSupervisorId?: string
}

const fmt = (v: unknown) => {
  const { d, m, y } = dateParts(v)
  return y ? `${d}/${m}/${y}` : ''
}

/** The two read-only audit cards at the foot of every customer form. */
export function AuditCards({ audit, openDateFallback }: { audit: AuditInfo; openDateFallback?: unknown }) {
  const card = (title: string, cells: { label: string; value: unknown }[]) => (
    <div className="rounded-xl border border-edge bg-surface-muted p-4">
      <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">{title}</p>
      <div className="grid grid-cols-2 gap-x-4 gap-y-3 sm:grid-cols-4">
        {cells.map(({ label, value }) => (
          <div key={label}>
            <p className="text-xs text-muted-soft">{label}</p>
            <p className="mt-0.5 text-sm font-medium text-ink-soft">{String(value ?? '') || '—'}</p>
          </div>
        ))}
      </div>
    </div>
  )
  return (
    <div className="grid gap-4 lg:grid-cols-2">
      {card('Opening Details', [
        { label: 'Opening Date', value: fmt(audit.openDate ?? openDateFallback) },
        { label: 'Branch', value: audit.openBranch },
        { label: 'Maker ID', value: audit.openMakerId },
        { label: 'Supervisor ID', value: audit.openSupervisorId },
      ])}
      {card('Update Details', [
        { label: 'Last Update Date', value: fmt(audit.lastUpdateDate) },
        { label: 'Branch', value: audit.updateBranch },
        { label: 'Maker ID', value: audit.updateMakerId },
        { label: 'Supervisor ID', value: audit.updateSupervisorId },
      ])}
    </div>
  )
}

export const btnKinds = {
  secondary:
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted',
  danger:
    'rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft',
  disabled:
    'rounded-lg border border-edge bg-surface-muted px-4 py-2.5 text-sm font-medium text-muted-soft shadow-xs cursor-not-allowed',
}

/**
 * The leading arrow on every backward action — Previous Page on the profile
 * forms, Return on the detail and history screens.
 *
 * One definition, and it is the FORWARD chevron rotated, so the back and next
 * arrows can never drift out of step with each other.
 */
export function BackArrow() {
  return (
    <svg viewBox="0 0 20 20" fill="currentColor" aria-hidden className="h-4 w-4 rotate-180">
      <path
        fillRule="evenodd"
        d="M3 10a.75.75 0 0 1 .75-.75h10.638L10.23 5.29a.75.75 0 1 1 1.04-1.08l5.5 5.25a.75.75 0 0 1 0 1.08l-5.5 5.25a.75.75 0 1 1-1.04-1.08l4.158-3.96H3.75A.75.75 0 0 1 3 10Z"
        clipRule="evenodd"
      />
    </svg>
  )
}

/**
 * The magnifier on every "Enquiry" action — the button that opens the selected
 * row's detail. Same path the search screen's own Enquiry button carried
 * inline; promoted here so the grids and that button cannot drift apart.
 */
export function SearchIcon() {
  return (
    <svg viewBox="0 0 20 20" fill="currentColor" aria-hidden className="h-4 w-4">
      <path
        fillRule="evenodd"
        d="M9 3.5a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11ZM2 9a7 7 0 1 1 12.452 4.391l3.328 3.329a.75.75 0 1 1-1.06 1.06l-3.329-3.328A7 7 0 0 1 2 9Z"
        clipRule="evenodd"
      />
    </svg>
  )
}

/**
 * The primary BACKWARD action, paired with {@link NextPageButton}.
 *
 * Same weight as Next Page rather than a quiet secondary: on the legacy forms
 * the two page buttons sit side by side as equals — a multi-page profile is
 * walked in both directions, and on the last page Previous is the only way on.
 * The arrow is the Next chevron rotated, so the pair can never drift apart.
 */
export function PrevPageButton({ onClick }: { onClick: () => void }) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50"
    >
      <BackArrow />
      Previous Page
    </button>
  )
}

/** The primary forward action, with the design's trailing arrow. */
export function NextPageButton({ onClick }: { onClick: () => void }) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="ml-auto inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50"
    >
      Next Page
      <svg viewBox="0 0 20 20" fill="currentColor" aria-hidden className="h-4 w-4">
        <path
          fillRule="evenodd"
          d="M3 10a.75.75 0 0 1 .75-.75h10.638L10.23 5.29a.75.75 0 1 1 1.04-1.08l5.5 5.25a.75.75 0 0 1 0 1.08l-5.5 5.25a.75.75 0 1 1-1.04-1.08l4.158-3.96H3.75A.75.75 0 0 1 3 10Z"
          clipRule="evenodd"
        />
      </svg>
    </button>
  )
}
