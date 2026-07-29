import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import type { Customer } from '../types.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmJuristicOwner.frm ("Owner/ Management Details") —
// stowntab rows (QUERY-SPECS §22).

const COLUMNS: GridColumn[] = [
  { key: 'ownerNo', label: 'No' },
  { key: 'ownerType', label: 'Type', render: (v) => (v === 'O' ? 'Owner' : v === 'M' ? 'Management' : v) },
  { key: 'shortName', label: 'Name' },
  { key: 'idType', label: 'Id Type', render: (v) => codeLabel('idType', v) },
  { key: 'idNo', label: 'Id Number' },
  { key: 'parentCompanyName', label: 'Parent Company' },
  { key: 'shareHoldingPerc', label: 'Share %', align: 'right' },
  { key: 'ownerEnabled', label: 'Active' },
]

export default function Owners({
  customer,
  rows,
  hasMore = false,
  onMore,
  onExit,
}: {
  customer: Customer
  rows: GridRow[]
  hasMore?: boolean
  onMore?: () => void
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Juristic Customer"
      title="Owner / Management Details"
      header={[
        { label: 'Customer No', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No owners recorded for this customer."
      hasMore={hasMore}
      onMore={onMore}
      buttonGroups={[
        [
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
