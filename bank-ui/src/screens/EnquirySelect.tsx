import { useState } from 'react'
import { useToast } from '../components/Toast.tsx'
import { hasAuthority } from '../session.ts'
import type { Customer, SearchCriteria } from '../types.ts'
import { codeLabel } from '../codes.ts'
import { PAGE_SIZE, Pager } from '../components/GridScreen.tsx'

// Mirrors legacy frmEnquirySelect.frm ("Enquiry Select Screen").
// Column keys match the recvSearchMsg.details fields so the backend
// response can be mapped straight onto rows later.
const COLUMNS: { key: keyof Customer; label: string; render?: (v: unknown) => string }[] = [
  { key: 'custNo', label: 'Customer No' },
  { key: 'idType', label: 'Id Type', render: (v) => codeLabel('idType', v) },
  { key: 'idNo', label: 'Id Number' },
  { key: 'telNo', label: 'Tel Number' },
  { key: 'telExt', label: 'Tel Extn' },
  { key: 'firstName', label: 'First Name' },
  { key: 'secondName', label: 'Second Name' },
  { key: 'lastName', label: 'Last Name' },
  { key: 'shortName', label: 'Short Name' },
  { key: 'branchCode', label: 'Branch Code', render: (v) => codeLabel('branch', v) },
  { key: 'mainCategoryCode', label: 'Main Category', render: (v) => codeLabel('samaMainCategory', v) },
  { key: 'subCategoryCode', label: 'Sub Category', render: (v) => codeLabel('samaSubCategory', v) },
]

// Telephone Pin, T-Pin History and Register E-Statement are Visible=0 on the
// legacy form and never shown by any code path in VER 4.0.5.
const SHOW_DORMANT_FACILITIES = false
// Enquiry-only build: write/maintenance actions (New/Update Customer, etc.) are
// hidden from the UI. Flip to false to restore them when write mode is built.
const ENQUIRY_ONLY = true

const secondaryBtn =
  'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft ' +
  'shadow-xs transition-colors hover:bg-surface-muted ' +
  'disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft'

export default function EnquirySelect({
  criteria,
  rows,
  incomplete = false,
  hasMore = false,
  onMore,
  onBack,
  onEnquiry,
  onHistory,
}: {
  criteria: SearchCriteria
  rows: Customer[]
  /** the scan was cut short — legacy incompleteFlag (cbbranch.c:1750) */
  incomplete?: boolean
  hasMore?: boolean
  onMore?: () => void
  onBack: () => void
  onEnquiry?: (row: Customer) => void
  onHistory?: (row: Customer) => void
}) {
  const [selected, setSelected] = useState(0) // legacy defaults to the first data row
  const [page, setPage] = useState(0)
  const toast = useToast()

  const selectedRow = rows[selected]
  const currentPage = Math.min(page, Math.max(0, Math.ceil(rows.length / PAGE_SIZE) - 1))
  const visibleRows = rows.slice(currentPage * PAGE_SIZE, (currentPage + 1) * PAGE_SIZE)
  const turnPage = (p: number) => {
    setPage(p)
    setSelected(p * PAGE_SIZE)
  }

  // cmdEnquiry_Click / SearchResultGrid_DblClick — loadCorrespondingForm picks
  // the detail form by the customer's main category (individual vs juristic).
  const handleEnquiry = () => {
    if (!selectedRow) {
      toast.warn('Empty row selected — please select a row with a value.')
      return
    }
    onEnquiry?.(selectedRow)
  }

  // cmdHistory_Click — opens Customer Update History for the selected row.
  const handleHistory = () => {
    if (!selectedRow) {
      toast.warn('Empty row selected — please select a row with a value.')
      return
    }
    onHistory?.(selectedRow)
  }

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
          Enquiry Select Screen
        </p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
          Search Results
        </h1>
        <p className="mt-1 text-sm text-muted">
          {rows.length > 1
            ? 'The search resulted in several matches — please select one.'
            : 'Select the match to continue.'}
        </p>
      </div>

      <div className="mb-5 flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
        <span className="text-sm font-medium text-ink-soft">Search Criteria</span>
        <span className="rounded-lg bg-primary-soft px-3 py-1.5 text-sm font-medium text-primary-ink">
          {criteria.label}
        </span>
        <input
          readOnly
          value={criteria.value}
          className="w-56 cursor-default rounded-lg border border-edge bg-surface-muted px-3 py-1.5 text-sm text-muted focus:outline-none"
        />
        <span className="ml-auto text-xs text-muted-soft">
          {rows.length} match{rows.length === 1 ? '' : 'es'}
          {incomplete && '+'}
        </span>
      </div>

      {/* incompleteFlag (cbbranch.c:1742-1756): the legacy told the operator
          when a search could not be completed rather than passing a partial
          list off as the whole answer. */}
      {incomplete && (
        <div className="mb-5 flex items-center gap-2.5 rounded-xl border border-warn/40 bg-warn-soft px-4 py-3 text-sm text-warn">
          Search could not be completed — more records exist than can be
          returned. Narrow the criteria to see the rest.
        </div>
      )}


      <div className="overflow-hidden rounded-2xl border border-edge bg-surface shadow-sm">
        <div className="overflow-x-auto">
          <table className="w-full min-w-[1100px] border-collapse text-sm">
            <thead>
              <tr className="border-b border-edge bg-surface-muted text-left">
                {COLUMNS.map((col) => (
                  <th
                    key={col.key}
                    className="whitespace-nowrap px-3.5 py-3 text-xs font-semibold uppercase tracking-wide text-muted"
                  >
                    {col.label}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.length === 0 && (
                <tr>
                  <td colSpan={COLUMNS.length} className="px-4 py-12 text-center text-muted-soft">
                    No matches found.
                  </td>
                </tr>
              )}
              {visibleRows.map((row, vi) => {
                const i = currentPage * PAGE_SIZE + vi
                return (
                <tr
                  key={row.custNo}
                  onClick={() => setSelected(i)}
                  onDoubleClick={handleEnquiry}
                  className={`cursor-pointer border-b border-edge-soft transition-colors last:border-b-0 ${
                    selected === i ? 'bg-primary-soft/70' : 'odd:bg-surface even:bg-surface-muted/40 hover:bg-surface-muted'
                  }`}
                >
                  {COLUMNS.map((col) => (
                    <td
                      key={col.key}
                      dir="auto"
                      className={`whitespace-nowrap px-3.5 py-2.5 ${
                        col.key === 'custNo'
                          ? 'font-semibold text-primary-ink'
                          : 'text-ink-soft'
                      }`}
                    >
                      {selected === i && col.key === 'custNo' && (
                        <span className="mr-2 inline-block h-2 w-2 rounded-full bg-primary align-middle" />
                      )}
                      {col.render ? col.render(row[col.key]) : row[col.key]}
                    </td>
                  ))}
                </tr>
                )
              })}
            </tbody>
          </table>
        </div>
        {/* Next fetches the following server page when it runs past what is
            loaded — the separate "More" button this replaced is gone. */}
        <Pager
          total={rows.length}
          page={currentPage}
          onPage={turnPage}
          hasMore={hasMore}
          onMore={onMore}
        />
      </div>

      <div className="mt-5 flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
        <button
          type="button"
          onClick={handleEnquiry}
          className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50"
        >
          <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4">
            <path
              fillRule="evenodd"
              d="M9 3.5a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11ZM2 9a7 7 0 1 1 12.452 4.391l3.328 3.329a.75.75 0 1 1-1.06 1.06l-3.329-3.328A7 7 0 0 1 2 9Z"
              clipRule="evenodd"
            />
          </svg>
          Enquiry
        </button>

        {/* Hidden for enquiry-only (write actions: create / modify customer). */}
        {!ENQUIRY_ONLY && (
          <>
            <button
              type="button"
              onClick={() =>
                toast.info('Opens Customer Categorize for a new customer (to be built).')
              }
              className={secondaryBtn}
            >
              New Customer
            </button>

            <button
              type="button"
              disabled={!hasAuthority('~01')}
              title={hasAuthority('~01') ? undefined : 'Requires customer-update authority (~01)'}
              className={secondaryBtn}
            >
              Update Customer
            </button>
          </>
        )}

        <button type="button" onClick={handleHistory} className={secondaryBtn}>
          Customer Update History
        </button>

        {SHOW_DORMANT_FACILITIES && (
          <>
            <button type="button" className={secondaryBtn}>Telephone Pin</button>
            <button type="button" className={secondaryBtn}>T-Pin History</button>
            <button type="button" className={secondaryBtn}>Register E-Statement</button>
          </>
        )}

        <button
          type="button"
          onClick={onBack}
          className="ml-auto rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
        >
          Cancel
        </button>
      </div>
    </main>
  )
}
