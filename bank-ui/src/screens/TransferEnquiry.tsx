import { useState } from 'react'
import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import { useToast } from '../components/Toast.tsx'
import { DatePicker } from '../components/DatePicker.tsx'
import { Field, TextInput } from '../components/fields.tsx'
import type { Account } from '../types.ts'
import TransferDetail from './TransferDetail.tsx'
import { api } from '../api.ts'
import { formatAmount, formatDate, todayYyyymmdd } from '../schema/helpers.ts'

import { t } from '../i18n/index.ts'
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
  // Legacy seeds both dates with today and lets the operator change them
  // (frmAccount.frm cmdTransferEnq_Click).
  const [fromDate, setFromDate] = useState(todayYyyymmdd)
  const [toDate, setToDate] = useState(todayYyyymmdd)
  const [refNo, setRefNo] = useState('')
  const [rows, setRows] = useState<GridRow[] | null>(null)
  // Server paging state. The API windows the scan in SQL (10 rows per page), so
  // the grid holds only the pages actually asked for: `page` is the last one
  // fetched, `hasMore` is the server saying another exists.
  const [page, setPage] = useState(0)
  const [hasMore, setHasMore] = useState(false)
  const [fetching, setFetching] = useState(false)
  const [detail, setDetail] = useState<GridRow | null>(null)
  // Fetch errors surface as the shared top-center toast (shim keeps the existing
  // setError('…') call sites; setError('') is a no-op).
  const toast = useToast()
  const setError = (msg: string) => {
    if (msg) toast.error(msg)
  }

  // Fetch restarts at page 0 and replaces the grid; a new date range or
  // reference has nothing to do with the pages already on screen.
  const fetchRows = () => {
    setError('')
    setFetching(true)
    api
      .sarieTransfers(account.accountNumber, { fromDate, toDate, refNo }, 0)
      .then((r) => {
        setRows(r.rows)
        setPage(0)
        setHasMore(r.hasMore)
      })
      .catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))
      .finally(() => setFetching(false))
  }

  // GridScreen's pager calls this when Next steps past the last loaded page:
  // fetch the next server page and append it (App's appendPage, kept local
  // because this screen owns its own fetch rather than going through App).
  const fetchMore = () => {
    if (!hasMore || fetching) return
    const next = page + 1
    setFetching(true)
    api
      .sarieTransfers(account.accountNumber, { fromDate, toDate, refNo }, next)
      .then((r) => {
        setRows((prev) => [...(prev ?? []), ...r.rows])
        setPage(next)
        setHasMore(r.hasMore)
      })
      .catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))
      .finally(() => setFetching(false))
  }

  if (detail) {
    return <TransferDetail detail={detail} onReturn={() => setDetail(null)} />
  }

  return (
    <div>
      <div className="mx-auto max-w-7xl px-4 pt-8 sm:px-6">
        <div className="flex flex-wrap items-end gap-4 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <Field label="From Date" htmlFor="trFrom">
            <DatePicker id="trFrom" value={fromDate} onChange={setFromDate} className="w-40" max={toDate} />
          </Field>
          <Field label="To Date" htmlFor="trTo">
            <DatePicker id="trTo" value={toDate} onChange={setToDate} className="w-40" min={fromDate} />
          </Field>
          <Field label="Reference No (optional)" htmlFor="trRef">
            <TextInput id="trRef" maxLength={10} value={refNo} onChange={(e) => setRefNo(e.target.value)} className="w-40" />
          </Field>
          <button
            type="button"
            onClick={fetchRows}
            disabled={fetching}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong disabled:cursor-not-allowed disabled:bg-faint"
          >
            {fetching ? t('Fetching…') : t('Fetch Transfers')}
          </button>
        </div>
      </div>
      <GridScreen
        kicker="Account"
        title="Transfer Enquiry"
        header={[{ label: 'Account No', value: account.accountNumber }]}
        columns={COLUMNS}
        rows={rows ?? []}
        emptyText={rows === null ? 'Enter a date range and fetch.' : 'No transfers in this range.'}
        hasMore={hasMore}
        onMore={fetchMore}
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
