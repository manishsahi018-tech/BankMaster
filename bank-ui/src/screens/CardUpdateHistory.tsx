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
  onViewDetail,
  onExit,
}: {
  cardNo: string
  rows: GridRow[]
  hasMore?: boolean
  onMore?: () => void
  onViewDetail: (row: GridRow) => void
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
      hasMore={hasMore}
      onMore={onMore}
      buttonGroups={[
        [
          {
            // cmdViewDetail → getCardDetails (frmCardUpdateHistory.frm:175-176):
            // re-reads the card from THIS log row (service 25 requestType '01',
            // keyed branch + user + datetime + card) and shows the card detail
            // in history mode. The three key parts are the row's own first
            // columns, so the selected row carries everything the read needs.
            label: 'View Detail',
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
