import GridScreen, { moreAction } from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import type { Customer } from '../types.ts'
import { formatDate } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmIndividualJoint.frm ("Joint Account details") —
// stjointtab rows (QUERY-SPECS §22).

const COLUMNS: GridColumn[] = [
  { key: 'jointCustNo', label: 'Joint Cust No' },
  { key: 'shortName', label: 'Name' },
  { key: 'idType', label: 'Id Type', render: (v) => codeLabel('idType', v) },
  { key: 'idNo', label: 'Id Number' },
  { key: 'nationality', label: 'Nationality', render: (v) => codeLabel('country', v) },
  { key: 'mobileNo', label: 'Mobile' },
  { key: 'jointOpenDate', label: 'Joined', render: formatDate },
  { key: 'activeStatus', label: 'Active' },
]

export default function JointHolders({
  customer,
  rows,
  onExit,
}: {
  customer: Customer
  rows: GridRow[]
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Customer Service"
      title="Joint Account Holders"
      header={[
        { label: 'Customer No', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No joint holders recorded for this customer."
      buttonGroups={[
        [
          { label: 'More', onClick: moreAction },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
