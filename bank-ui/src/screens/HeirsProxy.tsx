import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import type { Customer } from '../types.ts'
import { formatDate } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmIndividualHeirs.frm ("Heirs/Proxy Details") —
// stheirtab rows (QUERY-SPECS §22). heirType: H = heir, P = proxy.

const COLUMNS: GridColumn[] = [
  { key: 'heirNo', label: 'No' },
  { key: 'heirType', label: 'Type', render: (v) => (v === 'H' ? 'Heir' : v === 'P' ? 'Proxy' : v) },
  { key: 'shortName', label: 'Name' },
  { key: 'idType', label: 'Id Type', render: (v) => codeLabel('idType', v) },
  { key: 'idNo', label: 'Id Number' },
  { key: 'proxyNo', label: 'Proxy No' },
  { key: 'proxyIssueDateG', label: 'Proxy Issue Date', render: formatDate },
  { key: 'activeStatus', label: 'Active' },
]

export default function HeirsProxy({
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
      title="Heirs / Proxy Details"
      header={[
        { label: 'Customer No', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No heirs or proxies recorded for this customer."
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
                notify('warn', 'Empty row selected — please select a heir.')
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
