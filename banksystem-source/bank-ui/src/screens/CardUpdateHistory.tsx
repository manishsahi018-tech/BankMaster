import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import StatusBadge, { statusTone } from '../components/StatusBadge.tsx'
import { formatTimestamp, maskCardNo } from '../schema/helpers.ts'

// Mirrors legacy frmCardUpdateHistory.frm — stcardlog, msgType '1'
// (QUERY-SPECS §15). Same shape as the other update histories.

const COLUMNS: GridColumn[] = [
  { key: 'branchCode', label: 'Branch' },
  { key: 'userId', label: 'User Id' },
  { key: 'dateTime', label: 'Date Time', render: formatTimestamp },
  {
    key: 'bmUpdateStatus',
    label: 'Pending Status',
    render: (v) => <StatusBadge value={v} tone={statusTone(v)} />,
  },
  { key: 'supervisorId', label: 'Supervisor Id' },
  { key: 'lastUpdateDateTime', label: 'Approved Date Time', render: formatTimestamp },
  { key: 'requestType', label: 'Request Type' },
]

export default function CardUpdateHistory({
  cardNo,
  rows,
  hasMore = false,
  onMore,
  onExit,
}: {
  cardNo: string
  rows: GridRow[]
  hasMore?: boolean
  onMore?: () => void
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Cards"
      title="Card Update History"
      header={[{ label: 'Card Number', value: maskCardNo(cardNo) }]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No update history for this card."
      buttonGroups={[
        [
          {
            label: 'More',
            onClick: ({ notify }) => {
              if (hasMore && onMore) onMore()
              else notify('warn', 'No more match found.')
            },
          },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
