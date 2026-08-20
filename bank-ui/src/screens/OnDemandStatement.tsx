import { useState } from 'react'
import { Field, TextInput, ReadOnlyInput, Select } from '../components/fields.tsx'
import SourceBanner from '../components/SourceBanner.tsx'
import { useToast } from '../components/Toast.tsx'
import type { Account } from '../types.ts'
import type { OnlineStatementPage, OnlineTransaction } from '../api.ts'
import { api, ApiError } from '../api.ts'
import {
  balanceMarker,
  formatGatewayDate,
  formatMinor,
  splitAmount,
  todayYyyymmdd,
} from '../gateway.ts'

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
// pointer paging loop, the running carried balance, the movement totals and the
// printed sheet.

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

  const secondaryBtn =
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft ' +
    'shadow-xs transition-colors hover:bg-surface-muted ' +
    'disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft'

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
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">Account</p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
          OnLine Statement Printing
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
            {generating ? 'Generating…' : 'Print Statement'}
          </button>
          <button
            type="button"
            disabled={!hasReport}
            onClick={() => window.print()}
            title={hasReport ? undefined : 'Generate a statement first'}
            className={secondaryBtn}
          >
            Send to Printer
          </button>
          <button
            type="button"
            onClick={onExit}
            className="ml-auto rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
          >
            Exit
          </button>
        </div>
      </div>

      {hasReport && page && (
        <section className="mt-5 overflow-hidden rounded-2xl border border-edge bg-surface shadow-sm">
          <header className="border-b border-edge-soft bg-surface-muted px-4 py-4 sm:px-5">
            <h2 className="text-base font-semibold text-ink">ON DEMAND STATEMENT</h2>
            <p className="mt-0.5 text-sm text-muted">
              {page.branchName} · {formatGatewayDate(page.fromDate)} to{' '}
              {formatGatewayDate(page.toDate)}
            </p>
            <p className="mt-1 text-sm text-ink-soft">
              {page.custName} — {page.address}
            </p>
          </header>

          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-edge-soft text-left text-xs uppercase tracking-wider text-muted-soft">
                  <th className="px-4 py-2.5 font-semibold">Tlr Id</th>
                  <th className="px-4 py-2.5 font-semibold">Trans. Date</th>
                  <th className="px-4 py-2.5 font-semibold">Particulars</th>
                  <th className="px-4 py-2.5 font-semibold">Value Date</th>
                  <th className="px-4 py-2.5 text-right font-semibold">Debit</th>
                  <th className="px-4 py-2.5 text-right font-semibold">Credit</th>
                  <th className="px-4 py-2.5 text-right font-semibold">Balance</th>
                </tr>
              </thead>
              <tbody>
                {/* "Balance Brought Forward" (:1108-1119) — the opening line. */}
                <tr className="border-b border-edge-soft bg-surface-muted/50">
                  <td className="px-4 py-2.5 text-muted">—</td>
                  <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-muted">
                    {formatGatewayDate(page.fromDate)}
                  </td>
                  <td className="px-4 py-2.5 font-medium text-ink-soft" colSpan={3}>
                    Balance Brought Forward
                  </td>
                  <td className="px-4 py-2.5" />
                  <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums font-medium text-ink">
                    {formatMinor(Math.abs(Number(page.bfBalance) || 0), decimals)}{' '}
                    <span className="text-xs font-normal text-muted">
                      {balanceMarker(Number(page.bfBalance) || 0)}
                    </span>
                  </td>
                </tr>
                {rows!.map((r, i) => {
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
                      <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums text-ink-soft">
                        {r.credit ? '—' : formatMinor(r.minor, decimals)}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums text-ink-soft">
                        {r.credit ? formatMinor(r.minor, decimals) : '—'}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums font-medium text-ink">
                        {formatMinor(Math.abs(r.balanceMinor), decimals)}{' '}
                        <span className="text-xs font-normal text-muted">
                          {balanceMarker(r.balanceMinor)}
                        </span>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
              <tfoot className="border-t-2 border-edge">
                <tr>
                  <td className="px-4 py-2.5 text-xs uppercase tracking-wider text-muted-soft" colSpan={4}>
                    Value of Movements
                  </td>
                  <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums font-semibold text-ink">
                    {formatMinor(totals.debit, decimals)}
                  </td>
                  <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums font-semibold text-ink">
                    {formatMinor(totals.credit, decimals)}
                  </td>
                  <td />
                </tr>
                <tr>
                  <td className="px-4 py-2.5 text-xs uppercase tracking-wider text-muted-soft" colSpan={4}>
                    Number of Movements
                  </td>
                  <td className="px-4 py-2.5 text-right tabular-nums text-ink-soft">
                    {totals.debitCount}
                  </td>
                  <td className="px-4 py-2.5 text-right tabular-nums text-ink-soft">
                    {totals.creditCount}
                  </td>
                  <td />
                </tr>
              </tfoot>
            </table>
          </div>

          {/* The legacy's closing line, printed on every statement (:822). */}
          <footer className="border-t border-edge-soft px-4 py-2.5 text-xs text-muted-soft sm:px-5">
            Issued Upon your request. NOT A SUBSTITUTE FOR PERIODIC STATEMENT
          </footer>
        </section>
      )}

      {hasReport && page && (
        <section className="print-sheet print-landscape" aria-hidden="true">
          <h1>On Demand Statement — {account.accountNumber}</h1>
          <p className="print-meta">
            {page.custName} · {page.branchName} · {formatGatewayDate(page.fromDate)} to{' '}
            {formatGatewayDate(page.toDate)} · Printed {new Date().toLocaleString('en-GB')}
          </p>
          <table>
            <thead>
              <tr>
                <th>Tlr Id</th>
                <th>Trans. Date</th>
                <th>Particulars</th>
                <th>Value Date</th>
                <th className="right">Debit</th>
                <th className="right">Credit</th>
                <th className="right">Balance</th>
              </tr>
            </thead>
            <tbody>
              {rows!.map((r, i) => (
                <tr key={i}>
                  <td>{r.txn.userId}</td>
                  <td>{formatGatewayDate(r.txn.postDate)}</td>
                  <td>
                    {[r.txn.narrative1, r.txn.narrative2, r.txn.narrative3]
                      .filter((n) => n.trim() !== '')
                      .join(' / ')}
                  </td>
                  <td>{formatGatewayDate(r.txn.valueDate)}</td>
                  <td className="right">{r.credit ? '' : formatMinor(r.minor, decimals)}</td>
                  <td className="right">{r.credit ? formatMinor(r.minor, decimals) : ''}</td>
                  <td className="right">
                    {formatMinor(Math.abs(r.balanceMinor), decimals)} {balanceMarker(r.balanceMinor)}
                  </td>
                </tr>
              ))}
            </tbody>
            <tfoot>
              <tr>
                <td colSpan={4}>Value of Movements</td>
                <td className="right">{formatMinor(totals.debit, decimals)}</td>
                <td className="right">{formatMinor(totals.credit, decimals)}</td>
                <td />
              </tr>
            </tfoot>
          </table>
          <p className="print-meta">
            Issued Upon your request. NOT A SUBSTITUTE FOR PERIODIC STATEMENT
          </p>
        </section>
      )}
    </main>
  )
}
