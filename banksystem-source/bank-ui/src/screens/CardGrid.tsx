import GridScreen, { moreAction } from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import type { CardSearchResult } from '../api.ts'
import { formatDate, maskCardNo } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmCardGrid.frm ("Card Management") — stcardtab rows plus
// the DB #2 customer header (QUERY-SPECS §13). Card numbers are masked in
// the grid for PCI compliance (legacy cbrouter.c v1.1).

const COLUMNS: GridColumn[] = [
  { key: 'cardNo', label: 'Card Number', render: maskCardNo },
  { key: 'nameOnTheCard', label: 'Name on the Card' },
  { key: 'firstIssueDate', label: 'Issue Date', render: formatDate },
  { key: 'expireDate', label: 'Expiry Date', render: formatDate },
  { key: 'cardStatus', label: 'Card Status', render: (v) => codeLabel('cardStatus', v) },
  { key: 'requestStatus', label: 'Request Status', render: (v) => codeLabel('cardRequestStatus', v) },
  { key: 'pinRequestStatus', label: 'Pin Status', render: (v) => codeLabel('cardRequestStatus', v) },
  { key: 'coreAccNo', label: 'Account No' },
]

export default function CardGrid({
  result,
  onDetail,
  onHistory,
  onUpdateHistory,
  onExit,
}: {
  result: CardSearchResult
  onDetail: (row: GridRow) => void
  onHistory: (row: GridRow) => void
  onUpdateHistory: (row: GridRow) => void
  onExit: () => void
}) {
  const needRow = (fn: (row: GridRow) => void) =>
    ({ row, notify }: { row: GridRow | undefined; notify: (k: 'info' | 'warn', t: string) => void }) => {
      if (!row) {
        notify('warn', 'Empty row selected — please select a card.')
        return
      }
      fn(row)
    }
  return (
    <GridScreen
      kicker="Cards"
      title="Card Management"
      header={[
        { label: 'Customer #', value: result.custNo },
        { label: 'Customer Name', value: result.shortName },
        { label: 'Branch', value: result.custBranchCode },
        { label: 'City', value: result.cityName },
      ]}
      columns={COLUMNS}
      rows={result.rows}
      emptyText="No cards found."
      buttonGroups={[
        [
          { label: 'Card Detail', kind: 'primary', onClick: needRow(onDetail) },
          { label: 'Card / Pin History', onClick: needRow(onHistory) },
          { label: 'Update History', onClick: needRow(onUpdateHistory) },
          { label: 'More', onClick: moreAction },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
