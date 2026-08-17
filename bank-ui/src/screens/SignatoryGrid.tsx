import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import type { Account, Customer } from '../types.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmJuristicSignatory.frm — stsigntab rows (QUERY-SPECS §20).
//
// The legacy opens this form from two places with two different scopes, and so
// does this screen:
//   by ACCOUNT   — frmAccct cmdSignatory, the signatories of one account
//   by CUSTOMER  — frmJuristicAccountInfo cmdSignatory (:2270), which loads by
//                  customer number across every account the customer holds
// The customer-scoped listing adds an Account No column, because its rows span
// accounts and the signatory number alone does not say which one a row belongs
// to. Opening a detail keeps working either way: every row carries its own
// accNo, which is what the detail lookup is keyed on.

const BASE_COLUMNS: GridColumn[] = [
  { key: 'signatoryNo', label: 'Signatory No' },
  { key: 'signatoryShortName', label: 'Name' },
  { key: 'idType', label: 'Id Type', render: (v) => codeLabel('idType', v) },
  { key: 'idNo', label: 'Id Number' },
  { key: 'branchCode', label: 'Branch' },
]

const ACCOUNT_COLUMN: GridColumn = { key: 'accNo', label: 'Account No' }

export default function SignatoryGrid({
  account,
  customer,
  rows,
  onDetail,
  hasMore = false,
  onMore,
  onExit,
}: {
  /** Set when scoped to one account. Exactly one of account / customer is given. */
  account?: Account
  /** Set when scoped to a customer, from the juristic page 2. */
  customer?: Customer
  rows: GridRow[]
  onDetail: (row: GridRow) => void
  hasMore?: boolean
  onMore?: () => void
  onExit: () => void
}) {
  const byCustomer = !account
  return (
    <GridScreen
      kicker={byCustomer ? 'Juristic Customer' : 'Account'}
      title="Signatory Details"
      header={
        byCustomer
          ? [
              { label: 'Customer #', value: customer?.custNo ?? '' },
              { label: 'Customer Name', value: customer?.name ?? '' },
            ]
          : [{ label: 'Account No', value: account!.accountNumber }]
      }
      columns={byCustomer ? [ACCOUNT_COLUMN, ...BASE_COLUMNS] : BASE_COLUMNS}
      rows={rows}
      emptyText={
        byCustomer
          ? 'No signatories on any of this customer’s accounts.'
          : 'No signatories for this account.'
      }
      hasMore={hasMore}
      onMore={onMore}
      buttonGroups={[
        [
          {
            label: 'Enquiry',
            kind: 'primary',
            onClick: ({ row, notify }) => {
              if (!row) {
                notify('warn', 'Empty row selected — please select a signatory.')
                return
              }
              onDetail(row)
            },
          },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
