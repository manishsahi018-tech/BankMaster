import { useState } from 'react'
import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import { Field, TextInput, Select } from '../components/fields.tsx'
import type { Account } from '../types.ts'
import TransactionDetail from './TransactionDetail.tsx'
import { api } from '../api.ts'
import { formatAmount, formatDate } from '../schema/helpers.ts'

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
  const [fromDate, setFromDate] = useState('20090101')
  const [toDate, setToDate] = useState('20091231')
  const [transType, setTransType] = useState('')
  const [rows, setRows] = useState<GridRow[] | null>(null)
  const [detail, setDetail] = useState<GridRow | null>(null)
  const [error, setError] = useState('')

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
          <Field label="From Date (YYYYMMDD)" htmlFor="fromDate">
            <TextInput id="fromDate" maxLength={8} value={fromDate} onChange={(e) => setFromDate(e.target.value)} className="w-36" />
          </Field>
          <Field label="To Date (YYYYMMDD)" htmlFor="toDate">
            <TextInput id="toDate" maxLength={8} value={toDate} onChange={(e) => setToDate(e.target.value)} className="w-36" />
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
          {error && <p className="text-sm text-danger">{error}</p>}
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
