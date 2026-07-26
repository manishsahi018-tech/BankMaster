import GridScreen, { moreAction } from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Account, Customer } from '../types.ts'
import { pyd0data } from '../schema/index.ts'
import { column } from '../schema/helpers.ts'

// Mirrors legacy frmStopChequeGrid.frm ("Stop Cheque Grid").
// Rows are pyd0data records (recType CH = stopped cheque, SP = stop payment).

const COLUMNS = [
  column(pyd0data, 'chequeNo', { label: 'Cheque Number' }),
  column(pyd0data, 'amount'),
  column(pyd0data, 'dateStop', { label: 'Date Stopped' }),
  column(pyd0data, 'payeeName'),
  column(pyd0data, 'chequeFrom', { label: 'From Cheque Number' }),
]

export default function StopChequeGrid({
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
      title="Stop Cheque Information"
      header={[
        { label: 'Account No', value: account.accountNumber },
        { label: 'Customer #', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No stopped cheques for this account."
      buttonGroups={[
        [
          {
            label: 'Enquiry',
            kind: 'primary',
            onClick: ({ row, notify }) => {
              if (!row) {
                notify('warn', 'Empty row selected — please select a cheque.')
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
