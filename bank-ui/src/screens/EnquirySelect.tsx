import { useState } from 'react'
import { useToast } from '../components/Toast.tsx'
import { hasAuthority } from '../session.ts'
import type { Customer, SearchCriteria } from '../types.ts'
import { codeLabel } from '../codes.ts'
import { PAGE_SIZE, Pager } from '../components/GridScreen.tsx'
import { SearchIcon } from '../components/legacyForm.tsx'

import { t } from '../i18n/index.ts'
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
          {t('Enquiry Select Screen')}
        </p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
          {t('Search Results')}
        </h1>
        <p className="mt-1 text-sm text-muted">
          {rows.length > 1
            ? t('The search resulted in several matches — please select one.')
            : t('Select the match to continue.')}
        </p>
      </div>

      <div className="mb-5 flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
        <span className="text-sm font-medium text-ink-soft">{t('Search Criteria')}</span>
        <span className="rounded-lg bg-primary-soft px-3 py-1.5 text-sm font-medium text-primary-ink">
          {t(criteria.label)}
        </span>
        <input
          readOnly
          value={criteria.value}
          className="w-56 cursor-default rounded-lg border border-edge bg-surface-muted px-3 py-1.5 text-sm text-muted focus:outline-none"
        />
        <span className="ms-auto text-xs text-muted-soft">
          {/* Two whole phrases rather than an English "-es" glued on: Arabic
              does not pluralise by suffix, and the count is a Latin run that
              has to stay out of the translated text. */}
          {rows.length === 1
            ? t('{count} match', { count: rows.length })
            : t('{count} matches', { count: rows.length })}
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
              <tr className="border-b border-edge bg-surface-muted text-start">
                {COLUMNS.map((col) => (
                  <th
                    key={col.key}
                    className="whitespace-nowrap px-3.5 py-3 text-xs font-semibold uppercase tracking-wide text-muted"
                  >
                    {t(col.label)}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.length === 0 && (
                <tr>
                  <td colSpan={COLUMNS.length} className="px-4 py-12 text-center text-muted-soft">
                    {t('No matches found.')}
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
                  aria-selected={selected === i}
                  className={`cursor-pointer border-b border-edge-soft transition-colors last:border-b-0 ${
                    selected === i
                      ? 'bg-primary-selected'
                      : 'odd:bg-surface even:bg-surface-muted/40 hover:bg-surface-muted'
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
                      } ${
                        // Same selection marker as GridScreen: an accent bar on
                        // the first cell (a <tr> box-shadow is not painted under
                        // border-collapse), and darker ink across the row.
                        selected === i && col.key === 'custNo'
                          ? 'shadow-[inset_3px_0_0_0_var(--primary)]'
                          : ''
                      } ${selected === i && col.key !== 'custNo' ? 'text-ink' : ''}`}
                    >
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
          <SearchIcon />
          {t('Enquiry')}
        </button>

        {/* Hidden for enquiry-only (write actions: create / modify customer). */}
        {!ENQUIRY_ONLY && (
          <>
            <button
              type="button"
              // Not "to be built" — OUT OF SCOPE. frmCustCategorize is a router,
              // not an enquiry: it picks a main/sub category and then launches
              // one of five CREATE screens (New/Upd Customer, Quick Customer,
              // Internal Customer, New Customer via phone, Quick Pension
              // Customer). This build is enquiry-only, so the whole branch stays
              // behind ENQUIRY_ONLY rather than waiting on a data source.
              onClick={() =>
                toast.info(
                  'Customer Categorize opens the customer-creation screens, which are outside this enquiry-only build.',
                )
              }
              className={secondaryBtn}
            >
              {t('New Customer')}
            </button>

            <button
              type="button"
              disabled={!hasAuthority('~01')}
              title={hasAuthority('~01') ? undefined : 'Requires customer-update authority (~01)'}
              className={secondaryBtn}
            >
              {t('Update Customer')}
            </button>
          </>
        )}

        <button type="button" onClick={handleHistory} className={secondaryBtn}>
          {t('Customer Update History')}
        </button>

        {SHOW_DORMANT_FACILITIES && (
          <>
            <button type="button" className={secondaryBtn}>{t('Telephone Pin')}</button>
            <button type="button" className={secondaryBtn}>{t('T-Pin History')}</button>
            <button type="button" className={secondaryBtn}>{t('Register E-Statement')}</button>
          </>
        )}

        <button
          type="button"
          onClick={onBack}
          className="ms-auto rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
        >
          {t('Cancel')}
        </button>
      </div>
    </main>
  )
}
