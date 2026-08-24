import GridScreen from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Account, Customer } from '../types.ts'
import { sod0data } from '../schema/index.ts'
import { column } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmStdOrdGrid.frm ("Standing Order Information").
// Rows are sod0data records from the archival dictionary.

// The three coded columns resolve through the same stctltab sets the detail
// screen uses (ST / PT / PF); the grid was left showing bare codes when those
// sets were added.
const COLUMNS = [
  column(sod0data, 'sodNo', { label: 'S/O Number' }),
  column(sod0data, 'paymentType', {
    label: 'Pay Type',
    render: (v) => codeLabel('paymentType', v as string) || (v as string),
  }),
  column(sod0data, 'paymentAmt', { label: 'Payment Amount' }),
  column(sod0data, 'payAccNo', { label: 'Payee Account' }),
  column(sod0data, 'orderType', {
    label: 'S/O Type',
    render: (v) => codeLabel('orderType', v as string) || (v as string),
  }),
  column(sod0data, 'paymentFrequency', {
    label: 'Pay Freq',
    render: (v) => codeLabel('paymentFrequency', v as string) || (v as string),
  }),
]

// Enquiry-only build: write/teller actions are hidden. Flip to false to restore.
const ENQUIRY_ONLY = true

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
          // Hidden for enquiry-only (write actions: create / stop standing order).
          ...(ENQUIRY_ONLY
            ? []
            : [
                { label: 'New Standing Order', disabled: true, title: 'Available in update mode only' },
                { label: 'Stop Standing Order', disabled: true, title: 'Available in update mode only' },
              ]),
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
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
