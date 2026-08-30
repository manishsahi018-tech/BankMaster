import { useState } from 'react'
import { Field, TextInput, ReadOnlyInput, Select } from '../components/fields.tsx'
import SourceBanner from '../components/SourceBanner.tsx'
import { useToast } from '../components/Toast.tsx'
import type { Account } from '../types.ts'
import type { OnlineStatementPage, OnlineTransaction } from '../api.ts'
import { api, ApiError } from '../api.ts'
import { printDocument } from '../print.ts'
import { downloadWorkbook } from '../xlsx.ts'
import { DownloadExcelButton } from '../components/DownloadExcelButton.tsx'
import { onlineStatementSheet, statementFileName } from '../components/statementExport.ts'
import { BankLogo } from '../components/BankLogo.tsx'
import {
  balanceMarker,
  formatGatewayDate,
  formatMinor,
  splitAmount,
  todayYyyymmdd,
} from '../gateway.ts'

import { t } from '../i18n/index.ts'
import { cutIntoSheets, rowCost, ROW_PADDING } from '../components/statementPages.ts'
// Mirrors legacy frmInputform (OnlineStmt.frm, "OnLine Statement Printing") —
// the frmAccount cmdStatement button, authority ~60/~61/~62.
//
// cmdStatement first asks cbcmssrv for the IBAN (service "BB",
// frmAccount.frm:1130), then opens frmInputform, whose Form_Load connects to a
// SEPARATE socket — bmrtServer at onlineHostName:OnlinePort — and sends service
// "07". A separate socket, but NOT a separate data source: the server on the
// far end is cbrt01, whose getOndemandStmt() is a local read over
// gld0data/crd0data/thd0data (QUERY-SPECS §21.1). So this is served from the
// archival DB like every other screen — JdbcOnlineEnquiryRepository.
//
// The one thing that separates this screen from Transaction Inquiry is that the
// statement HIDES rows flagged do-not-print, and its balance brought forward is
// walked back over only the rows it shows. The two screens can therefore report
// different opening balances for the same account and range, correctly.
//
// Ported unchanged: the day-granular date pair, the validation order, the
// pointer paging loop, the running carried balance and the movement totals.
//
// cmdPrintStmt built the statement and spooled it to the printer in ONE action.
// This screen splits the two, as the archived-statement screens do: Generate
// Stmt fetches and renders, Print Statement prints what is on the screen and is
// dead until there is something to print. The operator reads the statement
// before spending paper on it, and a print that comes out wrong is re-printed
// without going back to the gateway for the same rows. There is still no
// second, print-only rendering of the statement: what prints is the report
// section below, marked .print-page.

const DAYS = Array.from({ length: 31 }, (_, i) => String(i + 1).padStart(2, '0'))
const MONTHS = Array.from({ length: 12 }, (_, i) => String(i + 1).padStart(2, '0'))

// Legacy message text, from the inline comments beside each MsgBox.
const MSG = {
  emptyAccount: 'Account Number cannot be empty..Please enter',
  invalidFromDate: 'From Date is blank or Incomplete From Date',
  invalidToDate: 'To_Date is blank or Incomplete To Date',
} as const

// generateReport loops until completionFlag = "1" with no cap. MAX_PAGES bounds
// a runaway gateway; hitting it is reported, never silently truncated.
const MAX_PAGES = 500

const digitsOnly = (value: string) => value.replace(/\D/g, '')

/** globalFunctions.bas:2902 validDate("YYYYMMDD"). */
function validDate(yyyymmdd: string): boolean {
  if (!/^\d{8}$/.test(yyyymmdd)) return false
  const year = Number(yyyymmdd.slice(0, 4))
  const month = Number(yyyymmdd.slice(4, 6))
  const day = Number(yyyymmdd.slice(6, 8))
  if (!year || month < 1 || month > 12 || day < 1) return false
  const days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  const leap = (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0
  return day <= (month === 2 && leap ? 29 : days[month - 1])
}

/** A transaction with the running balance the legacy carries down the page. */
interface StatementRow {
  txn: OnlineTransaction
  credit: boolean
  minor: number
  balanceMinor: number
}

/**
 * Builds the printed statement body from every fetched page.
 *
 * The running balance is cfBalance: seeded from bfBalance, then += credit /
 * -= debit per transaction, printed as an absolute value with a C or D marker
 * (OnlineStmt.frm:1173-1195). It is computed here rather than taken from the
 * gateway because the gateway does not send it — only the opening balance.
 */
function buildRows(bfBalanceMinor: number, transactions: OnlineTransaction[]): StatementRow[] {
  let balance = bfBalanceMinor
  return transactions.map((txn) => {
    const { credit, minor } = splitAmount(txn.transAmt)
    balance = credit ? balance + minor : balance - minor
    return { txn, credit, minor, balanceMinor: balance }
  })
}

export default function OnDemandStatement({
  account,
  customerName,
  onExit,
}: {
  account: Account
  customerName: string
  onExit: () => void
}) {
  const today = todayYyyymmdd()
  const [form, setForm] = useState({
    fromDay: '',
    fromMonth: '',
    fromYear: '',
    toDay: today.slice(6, 8),
    toMonth: today.slice(4, 6),
    toYear: today.slice(0, 4),
  })
  const [page, setPage] = useState<OnlineStatementPage | null>(null)
  const [rows, setRows] = useState<StatementRow[] | null>(null)
  const [unavailable, setUnavailable] = useState<string | null>(null)
  const [generating, setGenerating] = useState(false)
  const [downloading, setDownloading] = useState(false)
  const toast = useToast()

  // Any edit invalidates a generated report, as disableButtons does.
  const set = (key: keyof typeof form, value: string) => {
    setForm((f) => ({ ...f, [key]: value }))
    setRows(null)
    setPage(null)
  }

  const fromDate = `${form.fromYear}${form.fromMonth}${form.fromDay}`
  const toDate = `${form.toYear}${form.toMonth}${form.toDay}`

  /** cmdPrintStmt_Click (:551) validation, in the legacy's own order. */
  const validate = (): string | null => {
    if (account.accountNumber.trim() === '') return MSG.emptyAccount
    if (!form.fromDay || !form.fromMonth || !form.fromYear) return MSG.invalidFromDate
    if (!form.toDay || !form.toMonth || !form.toYear) return MSG.invalidToDate
    if (!validDate(fromDate)) return MSG.invalidFromDate
    if (!validDate(toDate)) return MSG.invalidToDate
    return null
  }

  const handleGenerate = async () => {
    const problem = validate()
    if (problem) {
      toast.warn(problem)
      return
    }
    setGenerating(true)
    setUnavailable(null)
    try {
      // generateReport (:1123): keep requesting with the previous reply's
      // lastTransPtr until completionFlag is "1", appending every batch.
      const all: OnlineTransaction[] = []
      let pointer = '00000'
      let first: OnlineStatementPage | null = null
      let fetched = 0
      let complete = false
      while (!complete && fetched < MAX_PAGES) {
        const reply = await api.onDemandStatement(account.accountNumber, {
          fromDate,
          toDate,
          lastTransPtr: pointer,
        })
        first ??= reply
        all.push(...reply.transactions)
        pointer = reply.lastTransPtr
        complete = reply.completionFlag === '1'
        fetched += 1
      }

      if (!first || all.length === 0) {
        setRows(null)
        setPage(null)
        toast.warn('No transactions found for this account for the given period')
        return
      }
      setPage(first)
      setRows(buildRows(Number(first.bfBalance) || 0, all))
      if (!complete) {
        toast.warn(
          `Stopped after ${all.length} transactions — the gateway did not signal completion. ` +
            'Narrow the period; the statement below is partial.',
        )
      } else {
        toast.success(`Statement generated — ${all.length} transactions.`)
      }
    } catch (e: unknown) {
      // 501 is the standing "no source here" condition, not a fault to chase.
      // Promote it into the banner so it stays readable, rather than letting it
      // vanish with the toast.
      if (e instanceof ApiError && e.status === 501) {
        setUnavailable(e.message)
        setRows(null)
        setPage(null)
      } else {
        toast.error(e instanceof Error ? e.message : String(e))
      }
    } finally {
      setGenerating(false)
    }
  }

  const secondaryBtn =
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft ' +
    'shadow-xs transition-colors hover:bg-surface-muted ' +
    'disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft'

  const decimals = page?.decimalPlace ?? '3'
  const hasReport = rows !== null && rows.length > 0
  // "Value of Movements" and "Number of Movements" (:806-812).
  const totals = (rows ?? []).reduce(
    (acc, r) => ({
      debit: acc.debit + (r.credit ? 0 : r.minor),
      credit: acc.credit + (r.credit ? r.minor : 0),
      debitCount: acc.debitCount + (r.credit ? 0 : 1),
      creditCount: acc.creditCount + (r.credit ? 1 : 0),
    }),
    { debit: 0, credit: 0, debitCount: 0, creditCount: 0 },
  )

  /**
   * The statement cut into printed sheets.
   *
   * Two blocks on the sheet are not transactions and still take space: the
   * brought forward line opens the first sheet and the movement totals close
   * the last, so each is reserved against its own sheet's budget — a totals
   * block that did not fit would print past the bottom edge of the paper,
   * where the fixed sheet boxes in index.css put nothing.
   */
  const sheets = cutIntoSheets(
    rows ?? [],
    (r) => rowCost([r.txn.narrative1, r.txn.narrative2, r.txn.narrative3]),
    {
      firstSheetReserve: 1 + ROW_PADDING,            // brought forward
      lastSheetReserve: 2 * (1 + ROW_PADDING) + 1,   // two totals rows + the rule above them
    },
  )

  /**
   * The statement as a workbook — the same rows, opened by the brought forward
   * line, with the running balance this screen computed (statementExport.ts).
   *
   * The movement totals do NOT go in: they close the printed document, and a
   * totals row inside a filterable table is the one row that goes wrong the
   * moment anyone sorts or filters. SUM does that job in the spreadsheet.
   *
   * Named for the period the GATEWAY reports back, not the boxes on the form.
   * They agree — set() drops the report on any edit — but the reply is what the
   * rows actually came from.
   */
  const handleDownload = async () => {
    if (!hasReport || !page) return
    setDownloading(true)
    try {
      const documentName = t('On Demand Statement')
      await downloadWorkbook(
        statementFileName(
          documentName,
          account.accountNumber,
          `${page.fromDate} to ${page.toDate}`,
        ),
        onlineStatementSheet(page, rows!, documentName),
      )
      toast.success(t('Statement downloaded — {txns} transactions.', { txns: rows!.length }))
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : String(e))
    } finally {
      setDownloading(false)
    }
  }

  const dateFields = (which: 'from' | 'to') => (
    <div className="flex gap-2">
      <div className="w-20 shrink-0">
        <Select
          id={`${which}Day`}
          options={DAYS}
          value={form[`${which}Day`]}
          placeholder="DD"
          onChange={(e) => set(`${which}Day`, e.target.value)}
        />
      </div>
      <div className="w-20 shrink-0">
        <Select
          options={MONTHS}
          aria-label={`${which} month`}
          value={form[`${which}Month`]}
          placeholder="MM"
          onChange={(e) => set(`${which}Month`, e.target.value)}
        />
      </div>
      <div className="w-24 shrink-0">
        <TextInput
          aria-label={`${which} year`}
          inputMode="numeric"
          value={form[`${which}Year`]}
          maxLength={4}
          onChange={(e) => set(`${which}Year`, digitsOnly(e.target.value))}
          placeholder="YYYY"
        />
      </div>
    </div>
  )

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">{t('Account')}</p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
          {t('OnLine Statement Printing')}
        </h1>
      </div>

      {/* Only the cannot-fetch case gets a banner. The screen no longer carries a
          standing "demo data" caveat: it is served from thd0data, gld0data and
          crd0data (legacy service 07) against the archival database. */}
      {unavailable && (
        <SourceBanner title="No source connected — this statement cannot be produced">
          <p>{unavailable}</p>
        </SourceBanner>
      )}

      <div className="rounded-2xl border border-edge bg-surface p-5 shadow-sm sm:p-6">
        <div className="grid gap-x-6 gap-y-4 sm:grid-cols-2 lg:grid-cols-3">
          <Field label="Account Number" htmlFor="accNo">
            <ReadOnlyInput id="accNo" value={account.accountNumber} readOnly />
          </Field>
          <Field label="Account Name" htmlFor="accName">
            <ReadOnlyInput id="accName" value={page?.custName || customerName} readOnly />
          </Field>
          {/* IBAN comes from the cbcmssrv "BB" fetch in the legacy and from the
              gateway reply here; blank until a statement is generated. */}
          <Field label="IBAN" htmlFor="iban">
            <ReadOnlyInput id="iban" value={page ? account.accountNumber : ''} readOnly />
          </Field>
          <Field label="From Date" htmlFor="fromDay">
            {dateFields('from')}
          </Field>
          <Field label="To Date" htmlFor="toDay">
            {dateFields('to')}
          </Field>
        </div>

        <div className="mt-5 flex flex-wrap items-center gap-3 border-t border-edge-soft pt-4">
          <button
            type="button"
            onClick={handleGenerate}
            disabled={generating}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong disabled:cursor-not-allowed disabled:bg-faint"
          >
            {generating ? t('Generating…') : t('Generate Stmt')}
          </button>

          <button
            type="button"
            disabled={!hasReport}
            // Title Case, though the heading on the sheet shouts it the way
            // the gateway's own report does: this is a filename. t() normalises
            // case, so both reach the same dictionary entry.
            onClick={() => printDocument(t('On Demand Statement'))}
            title={hasReport ? undefined : 'Generate a statement first'}
            className={secondaryBtn}
          >
            {t('Print Statement')}
          </button>
          <button
            type="button"
            onClick={onExit}
            className="ms-auto rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
          >
            {t('Exit')}
          </button>
        </div>
      </div>

      {/* The report, and the ONLY thing that prints. It needs no print-only
          heading the way the two archived-statement screens do: the section
          already names the document ("ON DEMAND STATEMENT") and carries the
          branch, period and customer, so the sheet is titled by what is on
          screen. */}
      {hasReport && page && (
        <div className="print-page">
          {/* One sheet per card, exactly as the two archived-statement screens
              print: the rows are cut to fit a sheet HERE (statementPages.ts) so
              that the number in each footer is the number of the sheet it is
              printed on. The gateway hands back one long run of transactions —
              it has no idea where a page ends — and the browser will not say
              where it broke, so this is the only place that can know. */}
          {/* Top right of the report, below the Exit button in the card
              above. The action bar acts on the FORM; this acts on the report,
              so it arrives with the report and goes when it does. Off the
              paper — a button printed onto a bank statement would be absurd. */}
          <div className="print-hidden mt-6 flex justify-end">
            <DownloadExcelButton onClick={handleDownload} busy={downloading} />
          </div>

          <div className="mt-5 space-y-5 print-per-page">
            {sheets.map((sheetRows, i) => {
              const first = i === 0
              const last = i === sheets.length - 1
              return (
                <section
                  key={i}
                  className="print-expand overflow-hidden rounded-2xl border border-edge bg-surface shadow-sm"
                >
                  <header className="border-b border-edge-soft bg-surface-muted px-4 py-4 sm:px-5">
                    <div className="flex flex-wrap items-start justify-between gap-3">
                      {/* The mark rides in the heading row, not above it: this
                          card is a fixed-height sheet box and the rows were cut
                          to fill it, so header height taken here comes off the
                          last transaction on every sheet. The row is three
                          lines tall and the mark is not, so it takes none. */}
                      <div className="flex items-start gap-3">
                        <BankLogo className="mt-0.5 h-6 w-auto shrink-0" />
                        <div>
                          {/* Every sheet repeats the whole heading, so a sheet
                              that leaves the pile still says whose statement it
                              is — and says which of them it is. */}
                          <h2 className="text-base font-semibold text-ink">
                            {t('ON DEMAND STATEMENT')}
                            {!first && (
                              <span className="ms-2 text-sm font-normal text-muted">
                                {t('(continued)')}
                              </span>
                            )}
                          </h2>
                          <p className="mt-0.5 text-sm text-muted">
                            {page.branchName} · {formatGatewayDate(page.fromDate)} to{' '}
                            {formatGatewayDate(page.toDate)}
                          </p>
                          <p className="mt-1 text-sm text-ink-soft">
                            {page.custName} — {page.address}
                          </p>
                        </div>
                      </div>
                      {/* Top right, as on the archived-statement cards: the day
                          the document is produced, not the period it covers —
                          that is named on the left. This statement is issued on
                          demand, so the two are never the same thing. */}
                      <p className="text-end text-sm text-ink">
                        <span className="text-xs uppercase tracking-wider text-muted-soft">
                          {t('Statement Date')}
                        </span>
                        {' - '}
                        <span className="font-medium">{formatGatewayDate(todayYyyymmdd())}</span>
                      </p>
                    </div>
                  </header>

                  <div className="overflow-x-auto print-expand">
                    <table className="w-full text-sm">
                      <thead>
                        <tr className="border-b border-edge-soft text-start text-xs uppercase tracking-wider text-muted-soft">
                          <th className="px-4 py-2.5 font-semibold">{t('Tlr Id')}</th>
                          <th className="px-4 py-2.5 font-semibold">{t('Trans. Date')}</th>
                          <th className="px-4 py-2.5 font-semibold">{t('Particulars')}</th>
                          <th className="px-4 py-2.5 font-semibold">{t('Value Date')}</th>
                          <th className="px-4 py-2.5 text-end font-semibold">{t('Debit')}</th>
                          <th className="px-4 py-2.5 text-end font-semibold">{t('Credit')}</th>
                          <th className="px-4 py-2.5 text-end font-semibold">{t('Balance')}</th>
                        </tr>
                      </thead>
                      <tbody>
                        {first && (
                          <tr className="border-b border-edge-soft bg-surface-muted/50">
                            <td className="px-4 py-2.5 text-muted">—</td>
                            <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-muted">
                              {formatGatewayDate(page.fromDate)}
                            </td>
                            <td className="px-4 py-2.5 font-medium text-ink-soft" colSpan={3}>
                              {t('Balance Brought Forward')}
                            </td>
                            <td className="px-4 py-2.5" />
                            <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums font-medium text-ink">
                              {formatMinor(Math.abs(Number(page.bfBalance) || 0), decimals)}{' '}
                              <span className="text-xs font-normal text-muted">
                                {balanceMarker(Number(page.bfBalance) || 0)}
                              </span>
                            </td>
                          </tr>
                        )}
                          {sheetRows.map((r, i) => {
                            const narrative = [r.txn.narrative1, r.txn.narrative2, r.txn.narrative3].filter(
                              (n) => n.trim() !== '',
                            )
                            return (
                              <tr key={`${r.txn.transCounter}-${i}`} className="border-b border-edge-soft last:border-0">
                                <td className="whitespace-nowrap px-4 py-2.5 text-muted">{r.txn.userId}</td>
                                <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-ink-soft">
                                  {formatGatewayDate(r.txn.postDate)}
                                </td>
                                <td className="px-4 py-2.5 text-ink-soft">
                                  {narrative.map((n, k) => (
                                    <span key={k} className={k === 0 ? 'block' : 'block text-muted'}>
                                      {n}
                                    </span>
                                  ))}
                                </td>
                                <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-muted">
                                  {formatGatewayDate(r.txn.valueDate)}
                                </td>
                                <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums text-ink-soft">
                                  {r.credit ? '—' : formatMinor(r.minor, decimals)}
                                </td>
                                <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums text-ink-soft">
                                  {r.credit ? formatMinor(r.minor, decimals) : '—'}
                                </td>
                                <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums font-medium text-ink">
                                  {formatMinor(Math.abs(r.balanceMinor), decimals)}{' '}
                                  <span className="text-xs font-normal text-muted">
                                    {balanceMarker(r.balanceMinor)}
                                  </span>
                                </td>
                              </tr>
                            )
                          })}
                      </tbody>
                      {/* The movement totals close the statement, so they print
                          under the LAST sheet only — the budget above keeps a
                          place for them there. */}
                      {last && (
                        <tfoot className="border-t-2 border-edge">
                          <tr>
                            <td className="px-4 py-2.5 text-xs uppercase tracking-wider text-muted-soft" colSpan={4}>
                              {t('Value of Movements')}
                            </td>
                            <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums font-semibold text-ink">
                              {formatMinor(totals.debit, decimals)}
                            </td>
                            <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums font-semibold text-ink">
                              {formatMinor(totals.credit, decimals)}
                            </td>
                            <td />
                          </tr>
                          <tr>
                            <td className="px-4 py-2.5 text-xs uppercase tracking-wider text-muted-soft" colSpan={4}>
                              {t('Number of Movements')}
                            </td>
                            <td className="px-4 py-2.5 text-end tabular-nums text-ink-soft">
                              {totals.debitCount}
                            </td>
                            <td className="px-4 py-2.5 text-end tabular-nums text-ink-soft">
                              {totals.creditCount}
                            </td>
                            <td />
                          </tr>
                        </tfoot>
                      )}
                    </table>
                  </div>

                  {/* The sheet's own number, where the two archived-statement
                      screens carry theirs. The legacy printed its "Issued upon
                      your request" disclaimer here too (OnlineStmt.frm:822);
                      dropped on request. */}
                  <footer className="border-t border-edge-soft px-4 py-2.5 text-end text-xs text-muted-soft sm:px-5">
                    {t('Page {page} of {pages}', { page: i + 1, pages: sheets.length })}
                  </footer>
                </section>
              )
            })}
          </div>
        </div>
      )}
    </main>
  )
}
