import { useState } from 'react'
import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import { useToast } from '../components/Toast.tsx'
import { Field, Select } from '../components/fields.tsx'
import { DatePicker } from '../components/DatePicker.tsx'
import type { Account } from '../types.ts'
import TransactionDetail from './TransactionDetail.tsx'
import { api } from '../api.ts'
import { formatAmount, formatDate, todayYyyymmdd } from '../schema/helpers.ts'

// Mirrors legacy frmTransaction.frm ("Transaction Enquiry") over thd0data —
// QUERY-SPECS §18. Self-fetching: the date range parameterizes the query.

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
  // Fetch errors surface as the shared top-center toast (shim keeps the existing
  // setError('…') call sites; setError('') is a no-op).
  const toast = useToast()
  const setError = (msg: string) => {
    if (msg) toast.error(msg)
  }

  const fetchRows = () => {
    setError('')
    api
      .bmTransactions(account.accountNumber, { fromDate, toDate, transType })
      .then((r) => setRows(r.rows))
      .catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))
  }

  if (detail) {
    return <TransactionDetail detail={detail} onReturn={() => setDetail(null)} />
  }

  return (
    <div>
      <div className="mx-auto max-w-7xl px-4 pt-8 sm:px-6">
        <div className="flex flex-wrap items-end gap-4 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
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
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
          >
            Fetch Transactions
          </button>
        </div>
      </div>
      <GridScreen
        kicker="Account"
        title="BM Transaction Enquiry"
        header={[{ label: 'Account No', value: account.accountNumber }]}
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
            { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
          ],
        ]}
      />
    </div>
  )
}
