import GridScreen from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Customer } from '../types.ts'
import StatusBadge, { statusTone } from '../components/StatusBadge.tsx'
import { stcustlog } from '../schema/index.ts'
import { column } from '../schema/helpers.ts'

// Mirrors legacy frmCustUpdateHistory.frm ("Customer Update History").
// Rows are stcustlog records; the legacy "Pending Status" is bmUpdateStatus,
// the approval timestamp is lastUpdateDateTime and the categories are the
// SAMA main/sub category codes.

const COLUMNS = [
  column(stcustlog, 'branchCode', { label: 'Branch' }),
  column(stcustlog, 'userId', { label: 'User Id' }),
  column(stcustlog, 'dateTime', { label: 'Date Time' }),
  column(stcustlog, 'bmUpdateStatus', {
    label: 'Pending Status',
    render: (v) => <StatusBadge value={v} tone={statusTone(v)} />,
  }),
  column(stcustlog, 'supervisorId', { label: 'Supervisor Id' }),
  column(stcustlog, 'lastUpdateDateTime', { label: 'Approved Date Time' }),
  column(stcustlog, 'samaMainCategory', { label: 'Main Cat' }),
  column(stcustlog, 'samaSubCategory', { label: 'Sub Cat' }),
]

export default function CustUpdateHistory({
  customer,
  rows,
  hasMore = false,
  onMore,
  onViewDetail,
  onExit,
}: {
  customer: Customer
  rows: GridRow[]
  hasMore?: boolean
  onMore?: () => void
  onViewDetail: (row: GridRow) => void
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Customer Service"
      title="Customer Update History"
      header={[
        { label: 'Customer No', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
        { label: 'Cust. Br. Code', value: customer.branchCode },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No update history found."
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
            // Legacy getCustDetails: opens the profile form in history mode
            // with the stcustlog snapshot (service 11 requestType 01).
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
