import GridScreen, { moreAction } from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Account, Customer } from '../types.ts'
import { sod0data } from '../schema/index.ts'
import { column } from '../schema/helpers.ts'

// Mirrors legacy frmStdOrdGrid.frm ("Standing Order Information").
// Rows are sod0data records from the archival dictionary.

const COLUMNS = [
  column(sod0data, 'sodNo', { label: 'S/O Number' }),
  column(sod0data, 'paymentType'),
  column(sod0data, 'paymentAmt', { label: 'Payment Amount' }),
  column(sod0data, 'payAccNo', { label: 'Pay Acc No' }),
  column(sod0data, 'orderType'),
  column(sod0data, 'paymentFrequency', { label: 'Payment Freq' }),
]

export default function StandingOrderGrid({
  account,
  customer,
  rows,
  onEnquiry,
  onExit,
}: {
  account: Account
  customer: Customer
  rows: GridRow[]
  onEnquiry: (row: GridRow) => void
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Account"
      title="Standing Orders"
      header={[
        { label: 'Account No', value: account.accountNumber },
        { label: 'Customer #', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No standing orders for this account."
      buttonGroups={[
        [
          { label: 'New Standing Order', disabled: true, title: 'Available in update mode only' },
          { label: 'Stop Standing Order', disabled: true, title: 'Available in update mode only' },
          {
            label: 'Enquiry',
            kind: 'primary',
            onClick: ({ row, notify }) => {
              if (!row) {
                notify('warn', 'Empty row selected — please select a standing order.')
                return
              }
              onEnquiry(row)
            },
          },
          { label: 'More', onClick: moreAction },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
