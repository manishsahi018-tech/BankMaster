import { useState, type ReactNode } from 'react'
import { useToast } from './Toast.tsx'

// Shared layout for the legacy MSFlexGrid screens (account grid, histories,
// cheque book / standing order / stop cheque grids). Each legacy grid form is
// a thin config over this component.

export const PAGE_SIZE = 10 // revamp page size (legacy server fetched 20 at a time)

export type GridRow = Record<string, any>
export type Notify = (kind: 'info' | 'warn', text: string) => void

export interface GridColumn {
  key: string
  label: string
  align?: 'right'
  render?: (value: any, row: GridRow) => ReactNode
}

export interface GridButtonContext {
  row: GridRow | undefined
  rows: GridRow[]
  notify: Notify
}

export interface GridButton {
  label: string
  kind?: 'primary' | 'secondary' | 'danger'
  disabled?: boolean
  title?: string
  alignEnd?: boolean
  onClick?: (ctx: GridButtonContext) => void
}

interface GridScreenProps {
  kicker: string
  title: string
  subtitle?: string
  header?: { label: string; value?: string }[]
  columns: GridColumn[]
  rows: GridRow[]
  emptyText?: string
  buttonGroups?: GridButton[][]
  minWidth?: string
}

const btnKinds = {
  primary:
    'inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50 disabled:cursor-not-allowed disabled:bg-faint',
  secondary:
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft',
  danger:
    'rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft',
}

// Standard cmdMore_Click behaviour shared by every grid form.
export const moreAction = ({ rows, notify }: GridButtonContext) => {
  if (rows.length < PAGE_SIZE) {
    notify('warn', 'No more match found.')
    return
  }
  notify('info', `Fetching next ${PAGE_SIZE} records — needs the backend.`)
}

/** Footer pager for the loaded rows; hidden while they fit on one page. */
export function Pager({
  total,
  page,
  onPage,
}: {
  total: number
  page: number
  onPage: (page: number) => void
}) {
  const pageCount = Math.ceil(total / PAGE_SIZE)
  if (pageCount <= 1) return null
  const from = page * PAGE_SIZE + 1
  const to = Math.min(total, from + PAGE_SIZE - 1)
  const pagerBtn =
    'rounded-lg border border-edge-strong bg-surface px-3 py-1.5 text-xs font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted disabled:cursor-not-allowed disabled:border-edge disabled:text-muted-soft'
  return (
    <div className="flex items-center justify-between gap-3 border-t border-edge px-4 py-3">
      <span className="text-xs text-muted">
        Showing {from}–{to} of {total}
      </span>
      <div className="flex items-center gap-2">
        <button type="button" disabled={page === 0} onClick={() => onPage(page - 1)} className={pagerBtn}>
          ‹ Previous
        </button>
        <span className="text-xs tabular-nums text-muted">
          Page {page + 1} of {pageCount}
        </span>
        <button
          type="button"
          disabled={page >= pageCount - 1}
          onClick={() => onPage(page + 1)}
          className={pagerBtn}
        >
          Next ›
        </button>
      </div>
    </div>
  )
}

export default function GridScreen({
  kicker,
  title,
  subtitle,
  header = [],
  columns,
  rows,
  emptyText = 'No records found.',
  buttonGroups = [],
  minWidth = 'min-w-[900px]',
}: GridScreenProps) {
  const [selected, setSelected] = useState(0)
  const [page, setPage] = useState(0)
  // Grid messages (empty selection, "no more matches", "to be built") surface as
  // the shared top-center toast rather than an inline banner.
  const toast = useToast()
  const notify: Notify = (kind, text) => (kind === 'warn' ? toast.warn(text) : toast.info(text))
  const selectedRow = rows[selected]

  // Clamp rather than effect-reset so a shrinking row set never strands the
  // pager past the last page; "More" fetches only ever grow the set.
  const currentPage = Math.min(page, Math.max(0, Math.ceil(rows.length / PAGE_SIZE) - 1))
  const visibleRows = rows.slice(currentPage * PAGE_SIZE, (currentPage + 1) * PAGE_SIZE)
  const turnPage = (p: number) => {
    setPage(p)
    setSelected(p * PAGE_SIZE) // legacy grids auto-select the first data row
  }

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">{kicker}</p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">{title}</h1>
        {subtitle && <p className="mt-1 text-sm text-muted">{subtitle}</p>}
      </div>

      {header.length > 0 && (
        <div className="mb-5 flex flex-wrap items-center gap-x-8 gap-y-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          {header.map(({ label, value }) => (
            <div key={label}>
              <p className="text-xs text-muted-soft">{label}</p>
              <p dir="auto" className="mt-0.5 text-sm font-semibold text-ink">
                {value || '—'}
              </p>
            </div>
          ))}
        </div>
      )}


      <div className="overflow-hidden rounded-2xl border border-edge bg-surface shadow-sm">
        <div className="overflow-x-auto">
          <table className={`w-full ${minWidth} border-collapse text-sm`}>
            <thead>
              <tr className="border-b border-edge bg-surface-muted text-left">
                {columns.map((col) => (
                  <th
                    key={col.key}
                    className={`whitespace-nowrap px-3.5 py-3 text-xs font-semibold uppercase tracking-wide text-muted ${
                      col.align === 'right' ? 'text-right' : ''
                    }`}
                  >
                    {col.label}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.length === 0 && (
                <tr>
                  <td colSpan={columns.length} className="px-4 py-14 text-center text-muted-soft">
                    {emptyText}
                  </td>
                </tr>
              )}
              {visibleRows.map((row, vi) => {
                const i = currentPage * PAGE_SIZE + vi
                return (
                <tr
                  key={i}
                  onClick={() => setSelected(i)}
                  className={`cursor-pointer border-b border-edge-soft transition-colors last:border-b-0 ${
                    selected === i
                      ? 'bg-primary-soft/70'
                      : 'odd:bg-surface even:bg-surface-muted/40 hover:bg-surface-muted'
                  }`}
                >
                  {columns.map((col, ci) => (
                    <td
                      key={col.key}
                      dir="auto"
                      className={`whitespace-nowrap px-3.5 py-2.5 ${
                        col.align === 'right' ? 'text-right tabular-nums' : ''
                      } ${ci === 0 ? 'font-semibold text-primary-ink' : 'text-ink-soft'}`}
                    >
                      {col.render ? col.render(row[col.key], row) : row[col.key]}
                    </td>
                  ))}
                </tr>
                )
              })}
            </tbody>
          </table>
        </div>
        <Pager total={rows.length} page={currentPage} onPage={turnPage} />
      </div>

      <div className="mt-5 grid gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
        {buttonGroups.map((group, gi) => (
          <div key={gi} className="flex flex-wrap items-center gap-3">
            {group.map((btn) => (
              <button
                key={btn.label}
                type="button"
                disabled={btn.disabled}
                title={btn.title}
                onClick={() => btn.onClick?.({ row: selectedRow, rows, notify })}
                className={`${btnKinds[btn.kind ?? 'secondary']} ${btn.alignEnd ? 'ml-auto' : ''}`}
              >
                {btn.label}
              </button>
            ))}
          </div>
        ))}
      </div>
    </main>
  )
}
