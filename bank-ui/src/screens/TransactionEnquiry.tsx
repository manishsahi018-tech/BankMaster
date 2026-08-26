import { useState } from 'react'
import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import { useToast } from '../components/Toast.tsx'
import { Field, Select } from '../components/fields.tsx'
import { DatePicker } from '../components/DatePicker.tsx'
import type { Account } from '../types.ts'
import TransactionDetail from './TransactionDetail.tsx'
import { api } from '../api.ts'
import { amountValue, formatAmount, formatDate, todayYyyymmdd } from '../schema/helpers.ts'
import { printDocument } from '../print.ts'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmTransEnq.frm ("BM Transaction Enquiry", the frmAccount
// cmdTransEnq button) over thd0data — QUERY-SPECS §18, server service 85
// (cbswift.c processBmTransEnq).
//
// THE CAPTION IS THE RUNTIME ONE. Form_Load overwrites both the window
// caption and the heading label from frmBmTransEnqCaption(0)
// (frmTransEnq.frm:757-758), so the .frm's design-time "Transaction Enquiry
// using specific type" never reached an operator — and neither did
// "Transaction Type Enquiry", which is cmdTransEnq's design-time caption,
// replaced from frmAccountGridCaption(27) at frmAccount.frm:1598.
//
// Self-fetching: the date range and
// trans type parameterize the query, matching the legacy's three-way filter
// (blank = all, RR = reversals via statmentFlag > '1', else exact match).
//
// NOT frmTransaction.frm — that is the separate "Transaction Enquiry" button,
// which speaks the online-gateway envelope (checkSum/Source/EOT, services
// 07/11) rather than cbcmssrv, and has no archival source. It stays stubbed
// in AccountInfo until DB #2 exists.

const COLUMNS: GridColumn[] = [
  { key: 'transRef', label: 'Reference No' },
  { key: 'postDate', label: 'Post Date', render: formatDate },
  { key: 'valueDate', label: 'Value Date', render: formatDate },
  { key: 'transAmt', label: 'Amount', align: 'right', render: formatAmount },
  { key: 'transType', label: 'Type' },
  { key: 'transCounter', label: 'Counter' },
  { key: 'userId', label: 'User Id' },
]

const TRANS_TYPES = ['', '01', '02', 'RR']

// The legacy does NOT stop at one page: cmdGo_Click fetches 20 rows at a time
// (`Do While recvBmTransEnqMsg.completionFlag = "0"`), loads every batch into a
// local table, and only then fills the grid, sums the amounts and enables
// Print. We do the same over the API's 10-row pages so the Total and the
// printed report cover the whole result, not just the first page.
//
// MAX_PAGES bounds a runaway date range — the bmTransactions query applies no
// server-side row cap. Hitting it is reported, never silently truncated.
const MAX_PAGES = 100

export default function TransactionEnquiry({
  account,
  onExit,
}: {
  account: Account
  onExit: () => void
}) {
  // Legacy seeds both dates with today and lets the operator change them
  // (frmAccount.frm cmdTransEnq_Click).
  const [fromDate, setFromDate] = useState(todayYyyymmdd)
  const [toDate, setToDate] = useState(todayYyyymmdd)
  const [transType, setTransType] = useState('')
  const [rows, setRows] = useState<GridRow[] | null>(null)
  const [detail, setDetail] = useState<GridRow | null>(null)
  const [fetching, setFetching] = useState(false)
  // Fetch errors surface as the shared top-center toast (shim keeps the existing
  // setError('…') call sites; setError('') is a no-op).
  const toast = useToast()
  const setError = (msg: string) => {
    if (msg) toast.error(msg)
  }

  const fetchRows = async () => {
    setError('')
    setFetching(true)
    try {
      const all: GridRow[] = []
      let page = 0
      let more = true
      while (more && page < MAX_PAGES) {
        const r = await api.bmTransactions(
          account.accountNumber,
          { fromDate, toDate, transType },
          page,
        )
        all.push(...r.rows)
        more = r.hasMore
        page += 1
      }
      setRows(all)
      if (more) {
        toast.warn(
          `Stopped after ${all.length} transactions — narrow the date range to see the rest. The Total below covers only what was loaded.`,
        )
      }
    } catch (e: unknown) {
      setError(e instanceof Error ? e.message : String(e))
    } finally {
      setFetching(false)
    }
  }

  // Legacy loadLocalDb (frmTransEnq.frm:855-862) accumulates totalTransAmt over
  // every fetched row, applying the overpunch sign; cmdPrint_Click then prints
  // it as the "Total" line. Rows whose amount will not parse are skipped here
  // exactly as the legacy's `If Len(RTrim(rs("transamt"))) = 0 Then tranAmt = 0`
  // leaves them out of the sum.
  //
  // No coinDenomination scaling: the legacy divides by the currency's decimal
  // places before printing, but our grid shows amounts unscaled, so scaling only
  // the total would put it out of step with the rows above it. Revisit together
  // once real Denodo amounts confirm whether the view stores minor units.
  const total = (rows ?? []).reduce<number>((sum, r) => sum + (amountValue(r.transAmt) ?? 0), 0)

  if (detail) {
    return <TransactionDetail detail={detail} onReturn={() => setDetail(null)} />
  }

  return (
    // The whole screen is the print region — everything in it except the filter
    // bar and the grid's own controls IS the report, and printing it is what
    // keeps the sheet and the screen from drifting apart.
    <div className="print-page">
      <div className="mx-auto max-w-7xl px-4 pt-8 sm:px-6">
        <div className="print-hidden flex flex-wrap items-end gap-4 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <Field label="From Date" htmlFor="fromDate">
            <DatePicker id="fromDate" value={fromDate} onChange={setFromDate} className="w-40" max={toDate} />
          </Field>
          <Field label="To Date" htmlFor="toDate">
            <DatePicker id="toDate" value={toDate} onChange={setToDate} className="w-40" min={fromDate} />
          </Field>
          <Field label="Trans Type (RR = reversals)" htmlFor="transType">
            <Select id="transType" options={TRANS_TYPES.filter(Boolean)} value={transType} onChange={(e) => setTransType(e.target.value)} className="w-40" />
          </Field>
          <button
            type="button"
            onClick={fetchRows}
            disabled={fetching}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong disabled:cursor-not-allowed disabled:bg-faint"
          >
            {fetching ? t('Fetching…') : t('Fetch Transactions')}
          </button>
        </div>
        {rows !== null && rows.length > 0 && (
          <div className="mt-3 flex flex-wrap items-baseline justify-end gap-x-6 gap-y-1 rounded-2xl border border-edge bg-surface-muted px-4 py-3 text-sm sm:px-5">
            <span className="text-muted">
              {rows.length} transaction{rows.length === 1 ? '' : 's'}
            </span>
            <span className="text-ink-soft">
              {t('Total')} <span className="ms-2 font-semibold tabular-nums text-ink">{formatAmount(total)}</span>
            </span>
          </div>
        )}
      </div>
      <GridScreen
        kicker="Account"
        title="BM Transaction Enquiry"
        // The filter bar does not print, so the range and type it holds are
        // repeated as header fields — cmdPrint_Click put exactly these in the
        // printed report's heading. On screen as well as on paper: a chip the
        // sheet has and the screen does not is the drift this is avoiding.
        header={[
          { label: 'Account No', value: account.accountNumber },
          { label: 'From Date', value: formatDate(fromDate) },
          { label: 'To Date', value: formatDate(toDate) },
          {
            label: 'Trans Type',
            value: transType === 'RR' ? 'RR (reversals)' : transType || 'All',
          },
        ]}
        columns={COLUMNS}
        rows={rows ?? []}
        emptyText={rows === null ? 'Enter a date range and fetch.' : 'No transactions in this range.'}
        buttonGroups={[
          [
            {
              label: 'Transaction Detail',
              kind: 'primary',
              onClick: ({ row, notify }) => {
                if (!row) {
                  notify('warn', 'Empty row selected — please select a transaction.')
                  return
                }
                api
                  .bmTransactionDetail(account.accountNumber, String(row.transRef))
                  .then(setDetail)
                  .catch((e: unknown) => notify('warn', e instanceof Error ? e.message : String(e)))
              },
            },
            {
              // Legacy cmdPrint_Click (frmTransEnq.frm:620-730): report header,
              // one line per transaction, then the Total. The C-era version
              // wrote a spool file and drove Printer directly; here it is
              // window.print() over the screen itself — the header fields, the
              // Total band and the grid, which GridScreen renders UNPAGED while
              // the sheet is laid out so the report covers every fetched row.
              label: 'Print',
              disabled: !rows || rows.length === 0,
              title: !rows || rows.length === 0 ? 'Fetch transactions first' : undefined,
              // Named for the screen's own report — this one prints the
              // enquiry, not a statement.
              onClick: () => printDocument(t('BM Transaction Enquiry')),
            },
            { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
          ],
        ]}
      />
    </div>
  )
}
