import GridScreen, { moreAction } from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Account, Customer } from '../types.ts'
import { stchqtab } from '../schema/index.ts'
import { column } from '../schema/helpers.ts'

// Mirrors legacy frmChequeBookGrid.frm ("Cheque Book Request Information").
// New/Amend/Delete are maintenance actions enabled only for authorised
// operators in update mode; in enquiry mode they stay disabled.
// Rows are stchqtab records from the archival dictionary.

const COLUMNS = [
  column(stchqtab, 'deliveryBranchCode', { label: 'Delivery Branch' }),
  column(stchqtab, 'requestUserId', { label: 'Request User' }),
  column(stchqtab, 'chequeType'),
  column(stchqtab, 'booksRequested', { label: '# Books Requested', align: 'right' }),
  column(stchqtab, 'reqDate', { label: 'Req. Date' }),
  column(stchqtab, 'requestStatus', { label: 'Request Status' }),
  // The workbook mistypes these two as Date (they are 8-digit cheque
  // numbers), which would trigger the date formatter — render them raw.
  column(stchqtab, 'chequeNoFrom', { label: 'From Cheque No', render: (v) => v }),
  column(stchqtab, 'chequeNoTo', { label: 'To Cheque No', render: (v) => v }),
]

export default function ChequeBookGrid({
  account,
  customer,
  rows,
  onHistory,
  onExit,
}: {
  account: Account
  customer: Customer
  rows: GridRow[]
  onHistory: (row: GridRow) => void
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Account"
      title="Cheque Book Requests"
      header={[
        { label: 'Account No', value: account.accountNumber },
        { label: 'Customer #', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No cheque book requests for this account."
      buttonGroups={[
        [
          { label: 'New Cheque Book Request', disabled: true, title: 'Available in update mode only' },
          { label: 'Amend Cheque Book Request', disabled: true, title: 'Available in update mode only' },
          { label: 'Delete Cheque Book Request', disabled: true, title: 'Available in update mode only' },
          {
            label: 'History',
            onClick: ({ row, notify }) => {
              if (!row) {
                notify('warn', 'Empty row selected — please select a request.')
                return
              }
              onHistory(row)
            },
          },
          { label: 'More', onClick: moreAction },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
