import GridScreen from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Account, Customer } from '../types.ts'
import StatusBadge, { statusTone } from '../components/StatusBadge.tsx'
import { stacclog } from '../schema/index.ts'
import { column, formatTimestamp } from '../schema/helpers.ts'

// Mirrors legacy frmAcctUpdateHistory.frm ("Account Update History").
// Rows are stacclog records; the legacy "Pending Status" is bmUpdateStatus
// and the approval timestamp is lastUpdateDateTime.

const COLUMNS = [
  column(stacclog, 'branchCode', { label: 'Branch' }),
  column(stacclog, 'userId', { label: 'User Id' }),
  // dateTime and lastUpdateDateTime are typed String (size 14) in the
  // workbook but hold YYYYMMDDHH24MISS values, so format them explicitly.
  column(stacclog, 'dateTime', { label: 'Date Time', render: formatTimestamp }),
  column(stacclog, 'bmUpdateStatus', {
    label: 'Pending Status',
    render: (v) => <StatusBadge value={v} tone={statusTone(v)} />,
  }),
  column(stacclog, 'supervisorId', { label: 'Supervisor Id' }),
  column(stacclog, 'lastUpdateDateTime', { label: 'Approved Date Time', render: formatTimestamp }),
]

export default function AcctUpdateHistory({
  account,
  customer,
  rows,
  hasMore = false,
  onMore,
  onViewDetail,
  onExit,
}: {
  account: Account
  customer: Customer
  rows: GridRow[]
  hasMore?: boolean
  onMore?: () => void
  onViewDetail: (row: GridRow) => void
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Account"
      title="Account Update History"
      header={[
        { label: 'Account No', value: account.accountNumber },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No update history found for this account."
      buttonGroups={[
        [
          {
            label: 'More',
            onClick: ({ notify }) => {
              if (hasMore && onMore) onMore()
              else notify('warn', 'No more match found.')
            },
          },
          {
            // Legacy getAcctDetails: opens frmAccount in history mode with
            // the stacclog snapshot (service 33 requestType 01).
            label: 'View Details',
            kind: 'primary',
            onClick: ({ row, notify }) => {
              if (!row) {
                notify('warn', 'Empty row selected — please select an entry.')
                return
              }
              onViewDetail(row)
            },
          },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
