import GridScreen from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Account, Customer } from '../types.ts'
import { stchqtab } from '../schema/index.ts'
import { column } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmChequeBookGrid.frm ("Cheque Book Request Information").

// Enquiry-only build: the create/amend/delete actions are hidden rather than
// shown disabled. Flip to false to restore them.
const ENQUIRY_ONLY = true
// New/Amend/Delete are maintenance actions enabled only for authorised
// operators in update mode; in enquiry mode they stay disabled.
// Rows are stchqtab records from the archival dictionary.

const COLUMNS = [
  column(stchqtab, 'deliveryBranchCode', { label: 'Delivery Branch' }),
  column(stchqtab, 'requestUserId', { label: 'Request User' }),
  // stchqtab's own descriptions carry both domains — 1 personal / 2 corporate,
  // and 1 Requested … 9 Rejected by branch — so the grid shows "1-Personal"
  // rather than a bare digit, as the legacy combos do.
  column(stchqtab, 'chequeType', {
    render: (v) => codeLabel('chequeType', v as string) || (v as string),
  }),
  column(stchqtab, 'booksRequested', { label: '# Books Requested', align: 'right' }),
  column(stchqtab, 'reqDate', { label: 'Req. Date' }),
  column(stchqtab, 'requestStatus', {
    label: 'Request Status',
    render: (v) => codeLabel('chequeBookStatus', v as string) || (v as string),
  }),
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
          // Hidden for enquiry-only (write actions: create / amend / delete a
          // cheque book request). Shown disabled they only advertised a
          // capability this build does not have.
          ...(ENQUIRY_ONLY
            ? []
            : [
                { label: 'New Cheque Book Request', disabled: true, title: 'Available in update mode only' },
                { label: 'Amend Cheque Book Request', disabled: true, title: 'Available in update mode only' },
                { label: 'Delete Cheque Book Request', disabled: true, title: 'Available in update mode only' },
              ]),
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
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
