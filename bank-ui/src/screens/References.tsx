import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import type { Customer } from '../types.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmIndividualSaudi2.frm ("Reference / Legal Representative
// Details") — stcreftab rows (QUERY-SPECS §22).

const COLUMNS: GridColumn[] = [
  { key: 'referenceNo', label: 'No' },
  { key: 'referenceType', label: 'Type', render: (v) => (v === 'L' ? 'Legal Rep.' : v === 'R' ? 'Reference' : v) },
  { key: 'referenceReqdFor', label: 'Required For' },
  { key: 'shortName', label: 'Name' },
  { key: 'idType', label: 'Id Type', render: (v) => codeLabel('idType', v) },
  { key: 'idNo', label: 'Id Number' },
  { key: 'activeStatus', label: 'Active' },
]

export default function References({
  customer,
  rows,
  hasMore = false,
  onMore,
  onEnquiry,
  onExit,
}: {
  customer: Customer
  rows: GridRow[]
  hasMore?: boolean
  onMore?: () => void
  onEnquiry: (row: GridRow) => void
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Customer Service"
      title="Reference / Legal Representative Details"
      header={[
        { label: 'Customer No', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No references recorded for this customer."
      hasMore={hasMore}
      onMore={onMore}
      buttonGroups={[
        [
          {
            // The legacy opens this panel on a grid DOUBLE-CLICK; ported as the
            // button this app uses for "open the selected row".
            label: 'Enquiry',
            kind: 'primary',
            onClick: ({ row, notify }) => {
              if (!row) {
                notify('warn', 'Empty row selected — please select a reference.')
                return
              }
              onEnquiry(row)
            },
          },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
