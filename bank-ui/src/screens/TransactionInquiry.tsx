import { useState } from 'react'
import { Field, TextInput, ReadOnlyInput, Select } from '../components/fields.tsx'
import SourceBanner from '../components/SourceBanner.tsx'
import { useToast } from '../components/Toast.tsx'
import type { Account } from '../types.ts'
import type { OnlineStatementPage, OnlineTransaction } from '../api.ts'
import { api, ApiError } from '../api.ts'
import { balanceMarker, formatGatewayDate, formatMinor, splitAmount } from '../gateway.ts'

// Mirrors legacy frmTransaction.frm ("Transaction Enquiry", the frmAccount
// cmdTransaction button, authority ~60/~61/~62).
//
// NOT frmTransEnq.frm — that is the separate "Transaction Type Enquiry" button,
// which speaks cbcmssrv service 85 over thd0data and IS built (see
// TransactionEnquiry.tsx). This one speaks the online-gateway envelope
// (checkSum / branchName / Source / EOT, service 11) to bmrtServer over its own
// socket, and has no archival source at all. That connection is what
// bank.online-db (DB #2) is reserved for; until it exists the banner below says
// so and MockOnlineEnquiryRepository stands in.
//
// Ported unchanged: the two mutually exclusive starting points, the absent
// toDate, the pointer paging loop and the ten grid columns.

const DAYS = Array.from({ length: 31 }, (_, i) => String(i + 1).padStart(2, '0'))
const MONTHS = Array.from({ length: 12 }, (_, i) => String(i + 1).padStart(2, '0'))

// cmdGo_Click loops while completionFlag = "0" with no cap.
const MAX_PAGES = 500

// Grid captions 6-15 of frmTransactionCaption (globalVaribles.bas:5944-5963).
// Narrative-2 and Narrative-3 are captions 16-17 and render as extra lines
// UNDER the row rather than as their own columns, which is why the legacy sizes
// the grid as (records * 4) + 2 rows.
const COLUMNS = [
  'Tlr Id',
  'Post Date',
  'Value Date',
  'Narrative-1',
  'Debit Amt',
  'Credit Amt',
  'Balance',
  'Supervisor Id',
  'Transaction counter',
  'Statement Flag',
] as const

const digitsOnly = (value: string) => value.replace(/\D/g, '')

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

interface Row {
  txn: OnlineTransaction
  credit: boolean
  minor: number
  balanceMinor: number
}

/**
 * loadLocalDb (:620) computes cfBalance as it inserts each row — but ONLY when
 * the enquiry started from a date. When the operator starts from a transaction
 * NUMBER the legacy forces cfBalance to 0 for every row (:634-637), because a
 * mid-stream start has no opening balance to carry and a running total from
 * nowhere would be a lie. Reproduced exactly.
 */
function buildRows(
  bfBalanceMinor: number,
  transactions: OnlineTransaction[],
  startedFromNumber: boolean,
): Row[] {
  let balance = bfBalanceMinor
  return transactions.map((txn) => {
    const { credit, minor } = splitAmount(txn.transAmt)
    if (startedFromNumber) {
      return { txn, credit, minor, balanceMinor: 0 }
    }
    balance = credit ? balance + minor : balance - minor
    return { txn, credit, minor, balanceMinor: balance }
  })
}

export default function TransactionInquiry({
  account,
  customerName,
  onExit,
}: {
  account: Account
  customerName: string
  onExit: () => void
}) {
  const [form, setForm] = useState({
    startDay: '',
    startMonth: '',
    startYear: '',
    startTrans: '',
  })
  const [page, setPage] = useState<OnlineStatementPage | null>(null)
  const [rows, setRows] = useState<Row[] | null>(null)
  const [startedFromNumber, setStartedFromNumber] = useState(false)
  const [unavailable, setUnavailable] = useState<string | null>(null)
  const [fetching, setFetching] = useState(false)
  const toast = useToast()

  const reset = () => {
    setRows(null)
    setPage(null)
  }

  /**
   * The two starting points are mutually exclusive. The legacy enforces it by
   * CLEARING the other control rather than by complaining: typing a start
   * transaction blanks the date (cmdGo_Click:343-347), and completing the date
   * blanks the transaction number (txtStartYear_LostFocus:874-880).
   */
  const setDatePart = (key: 'startDay' | 'startMonth' | 'startYear', value: string) => {
    setForm((f) => {
      const next = { ...f, [key]: value }
      if (next.startDay && next.startMonth && next.startYear) next.startTrans = ''
      return next
    })
    reset()
  }

  const setStartTrans = (value: string) => {
    setForm((f) =>
      Number(value) > 0
        ? { ...f, startTrans: value, startDay: '', startMonth: '', startYear: '' }
        : { ...f, startTrans: value },
    )
    reset()
  }

  const startDate = `${form.startYear}${form.startMonth}${form.startDay}`
  const byNumber = Number(form.startTrans) > 0

  const handleGo = async () => {
    if (!byNumber) {
      if (!form.startDay || !form.startMonth || !form.startYear || !validDate(startDate)) {
        // errInvalidDate — the legacy's single message for both cases.
        toast.warn('Start Date is blank or Incomplete')
        return
      }
    }
    setFetching(true)
    setUnavailable(null)
    try {
      const all: OnlineTransaction[] = []
      let pointer = '00000'
      let first: OnlineStatementPage | null = null
      let fetched = 0
      let complete = false
      while (!complete && fetched < MAX_PAGES) {
        const reply = await api.onlineTransactions(account.accountNumber, {
          fromDate: byNumber ? '' : startDate,
          startTrans: byNumber ? form.startTrans : '',
          lastTransPtr: pointer,
        })
        first ??= reply
        all.push(...reply.transactions)
        pointer = reply.lastTransPtr
        complete = reply.completionFlag === '1'
        fetched += 1
      }

      if (!first || all.length === 0) {
        reset()
        // errNoMatchFound, raised on noOfTransHere = "000" (:424-427).
        toast.warn('No matching transactions found')
        return
      }
      setPage(first)
      setStartedFromNumber(byNumber)
      setRows(buildRows(Number(first.bfBalance) || 0, all, byNumber))
      if (!complete) {
        toast.warn(
          `Stopped after ${all.length} transactions — the gateway did not signal completion. ` +
            'Start later; the list below is partial.',
        )
      }
    } catch (e: unknown) {
      if (e instanceof ApiError && e.status === 501) {
        setUnavailable(e.message)
        reset()
      } else {
        toast.error(e instanceof Error ? e.message : String(e))
      }
    } finally {
      setFetching(false)
    }
  }

  const decimals = page?.decimalPlace ?? '3'
  const hasRows = rows !== null && rows.length > 0

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">Account</p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">Transaction Enquiry</h1>
      </div>

      {unavailable ? (
        <SourceBanner tone="missing" title="No source connected — this enquiry cannot run">
          <p>{unavailable}</p>
        </SourceBanner>
      ) : (
        <SourceBanner title="Demo data — the online gateway is not connected">
          <p>Rows below are generated. Service 11 (bmrtServer) is not wired up here.</p>
        </SourceBanner>
      )}

      <div className="rounded-2xl border border-edge bg-surface p-5 shadow-sm sm:p-6">
        <div className="grid gap-x-6 gap-y-4 sm:grid-cols-2 lg:grid-cols-4">
          <Field label="Account No" htmlFor="accNo">
            <ReadOnlyInput id="accNo" value={account.accountNumber} readOnly />
          </Field>
          <Field label="Customer Name" htmlFor="custName">
            <ReadOnlyInput id="custName" value={page?.custName || customerName} readOnly />
          </Field>

          <Field label="Start Date" htmlFor="startDay">
            <div className="flex gap-2">
              <div className="w-20 shrink-0">
                <Select
                  id="startDay"
                  options={DAYS}
                  value={form.startDay}
                  placeholder="DD"
                  onChange={(e) => setDatePart('startDay', e.target.value)}
                />
              </div>
              <div className="w-20 shrink-0">
                <Select
                  aria-label="Start month"
                  options={MONTHS}
                  value={form.startMonth}
                  placeholder="MM"
                  onChange={(e) => setDatePart('startMonth', e.target.value)}
                />
              </div>
              <div className="w-24 shrink-0">
                <TextInput
                  aria-label="Start year"
                  inputMode="numeric"
                  value={form.startYear}
                  maxLength={4}
                  onChange={(e) => setDatePart('startYear', digitsOnly(e.target.value))}
                  placeholder="YYYY"
                />
              </div>
            </div>
          </Field>

          <Field label="Start Txn number" htmlFor="startTrans">
            <TextInput
              id="startTrans"
              inputMode="numeric"
              value={form.startTrans}
              maxLength={5}
              onChange={(e) => setStartTrans(digitsOnly(e.target.value))}
              placeholder="00000"
            />
          </Field>
        </div>

        {/* The mutual exclusion is invisible in the legacy — one control silently
            blanks the other. Saying which one is in force costs nothing. */}
        <p className="mt-4 text-xs text-muted">
          {byNumber
            ? `Starting from transaction ${form.startTrans} — the start date is ignored, and no running balance is carried (the legacy zeroes it for a mid-stream start).`
            : 'Starting from the date above. The gateway supplies its own end date — the legacy sends none, because the branch PC clock could not be trusted.'}
        </p>

        <div className="mt-5 flex flex-wrap items-center gap-3 border-t border-edge-soft pt-4">
          <button
            type="button"
            onClick={handleGo}
            disabled={fetching}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong disabled:cursor-not-allowed disabled:bg-faint"
          >
            {fetching ? 'Fetching…' : 'Go'}
          </button>
          <button
            type="button"
            onClick={onExit}
            className="ml-auto rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
          >
            Return to Account Menu
          </button>
        </div>
      </div>

      {hasRows && (
        <>
          <p className="mt-6 text-sm text-muted">{rows!.length} transactions</p>
          <section className="mt-3 overflow-x-auto rounded-2xl border border-edge bg-surface shadow-sm">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-edge-soft text-left text-xs uppercase tracking-wider text-muted-soft">
                  {COLUMNS.map((c, i) => (
                    <th
                      key={c}
                      className={`px-4 py-2.5 font-semibold ${i >= 4 && i <= 6 ? 'text-right' : ''}`}
                    >
                      {c}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {rows!.map((r, i) => {
                  const extra = [r.txn.narrative2, r.txn.narrative3].filter((n) => n.trim() !== '')
                  return (
                    <tr key={`${r.txn.transCounter}-${i}`} className="border-b border-edge-soft last:border-0">
                      <td className="whitespace-nowrap px-4 py-2.5 text-muted">{r.txn.userId}</td>
                      <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-ink-soft">
                        {formatGatewayDate(r.txn.postDate)}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-muted">
                        {formatGatewayDate(r.txn.valueDate)}
                      </td>
                      <td className="px-4 py-2.5 text-ink-soft">
                        <span className="block">{r.txn.narrative1}</span>
                        {extra.map((n, k) => (
                          <span key={k} className="block text-muted">
                            {n}
                          </span>
                        ))}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums text-ink-soft">
                        {r.credit ? '—' : formatMinor(r.minor, decimals)}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums text-ink-soft">
                        {r.credit ? formatMinor(r.minor, decimals) : '—'}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-right tabular-nums font-medium text-ink">
                        {startedFromNumber ? (
                          <span className="text-muted-soft">—</span>
                        ) : (
                          <>
                            {formatMinor(Math.abs(r.balanceMinor), decimals)}{' '}
                            <span className="text-xs font-normal text-muted">
                              {balanceMarker(r.balanceMinor)}
                            </span>
                          </>
                        )}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-muted">
                        {r.txn.supervisorId || '—'}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-muted">
                        {r.txn.transCounter}
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-muted">{r.txn.stmtFlag}</td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </section>
        </>
      )}
    </main>
  )
}
