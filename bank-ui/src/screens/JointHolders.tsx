import { useState } from 'react'
import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import JointAccountNamesModal from '../components/JointAccountNamesModal.tsx'
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
  acctInfo,
  hasMore = false,
  onMore,
  onEnquiry,
  onExit,
}: {
  customer: Customer
  rows: GridRow[]
  /** page-2 payload; carries the frmJointAccName values off stcusttab */
  acctInfo?: Record<string, string>
  hasMore?: boolean
  onMore?: () => void
  onEnquiry: (row: GridRow) => void
  onExit: () => void
}) {
  const [namesOpen, setNamesOpen] = useState(false)

  return (
    <>
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
        hasMore={hasMore}
        onMore={onMore}
        buttonGroups={[
          [
            {
              // frmIndividualJoint opens the holder's full record on a grid
              // DOUBLE-CLICK (jointInfoGrid_DblClick → fetchJointDetailInfo);
              // ported as this app's Enquiry button.
              label: 'Enquiry',
              kind: 'primary',
              onClick: ({ row, notify }) => {
                if (!row) {
                  notify('warn', 'Empty row selected — please select a joint holder.')
                  return
                }
                onEnquiry(row)
              },
            },
            {
              // frmJointAccName, which the legacy popped on the way OUT of this
              // grid. On demand instead — the three names are read-only either
              // way, and an operator who does not want them is not stopped.
              label: 'Joint Account Names',
              onClick: () => setNamesOpen(true),
            },
            { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
          ],
        ]}
      />

      {namesOpen && (
        <JointAccountNamesModal
          chequeLine1={acctInfo?.jointAccNameOnCheck1}
          chequeLine2={acctInfo?.jointAccNameOnCheck2}
          reportsName={acctInfo?.jointAccNameOnReports}
          onClose={() => setNamesOpen(false)}
        />
      )}
    </>
  )
}
