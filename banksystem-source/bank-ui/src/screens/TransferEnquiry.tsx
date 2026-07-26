import { useState } from 'react'
import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import { Field, TextInput } from '../components/fields.tsx'
import type { Account } from '../types.ts'
import TransferDetail from './TransferDetail.tsx'
import { api } from '../api.ts'
import { formatAmount, formatDate } from '../schema/helpers.ts'

// Mirrors legacy frmSarieTransferEnq.frm over rid0data — QUERY-SPECS §17.

const COLUMNS: GridColumn[] = [
  { key: 'transRef', label: 'Reference No' },
  { key: 'issueDate', label: 'Issue Date', render: formatDate },
  { key: 'valueDate', label: 'Value Date', render: formatDate },
  { key: 'drAccNo', label: 'Debit Account' },
  { key: 'netAmt', label: 'Amount', align: 'right', render: formatAmount },
  { key: 'transCurrCode', label: 'Curr' },
  { key: 'payAmt', label: 'Payment Amount', align: 'right', render: formatAmount },
  { key: 'payCurrCode', label: 'Pay Curr' },
  { key: 'statusFlag', label: 'Status' },
]

export default function TransferEnquiry({
  account,
  onExit,
}: {
  account: Account
  onExit: () => void
}) {
  const [fromDate, setFromDate] = useState('20090101')
  const [toDate, setToDate] = useState('20091231')
  const [refNo, setRefNo] = useState('')
  const [rows, setRows] = useState<GridRow[] | null>(null)
  const [detail, setDetail] = useState<GridRow | null>(null)
  const [error, setError] = useState('')

  const fetchRows = () => {
    setError('')
    api
      .sarieTransfers(account.accountNumber, { fromDate, toDate, refNo })
      .then((r) => setRows(r.rows))
      .catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))
  }

  if (detail) {
    return <TransferDetail detail={detail} onReturn={() => setDetail(null)} />
  }

  return (
    <div>
      <div className="mx-auto max-w-7xl px-4 pt-8 sm:px-6">
        <div className="flex flex-wrap items-end gap-4 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <Field label="From Date (YYYYMMDD)" htmlFor="trFrom">
            <TextInput id="trFrom" maxLength={8} value={fromDate} onChange={(e) => setFromDate(e.target.value)} className="w-36" />
          </Field>
          <Field label="To Date (YYYYMMDD)" htmlFor="trTo">
            <TextInput id="trTo" maxLength={8} value={toDate} onChange={(e) => setToDate(e.target.value)} className="w-36" />
          </Field>
          <Field label="Reference No (optional)" htmlFor="trRef">
            <TextInput id="trRef" maxLength={10} value={refNo} onChange={(e) => setRefNo(e.target.value)} className="w-40" />
          </Field>
          <button
            type="button"
            onClick={fetchRows}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
          >
            Fetch Transfers
          </button>
          {error && <p className="text-sm text-danger">{error}</p>}
        </div>
      </div>
      <GridScreen
        kicker="Account"
        title="Transfer Enquiry"
        header={[{ label: 'Account No', value: account.accountNumber }]}
        columns={COLUMNS}
        rows={rows ?? []}
        emptyText={rows === null ? 'Enter a date range and fetch.' : 'No transfers in this range.'}
        buttonGroups={[
          [
            {
              label: 'Transfer Detail',
              kind: 'primary',
              onClick: ({ row, notify }) => {
                if (!row) {
                  notify('warn', 'Empty row selected — please select a transfer.')
                  return
                }
                api
                  .transferDetail(String(row.transRef))
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
