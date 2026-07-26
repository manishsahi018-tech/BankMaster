import GridScreen, { moreAction } from '../components/GridScreen.tsx'
import type { GridButtonContext, GridColumn, Notify } from '../components/GridScreen.tsx'
import StatusBadge, { statusTone } from '../components/StatusBadge.tsx'
import type { Account, Customer } from '../types.ts'
import { hasAuthority } from '../session.ts'

// Mirrors legacy frmAccount.frm ("Account" MDI child) — the account grid a
// customer's Account button opens, with the two rows of facility buttons.
// Facility buttons follow the frmAccount.frm:1822-1865 authority branches:
// ~60 view-only and ~61 full both get Statement/Transaction/ChequeBook/
// HistStmt; StdOrd + StopCheque are ~62 (teller ops) only; DestroyCheque
// is ~61/~62.

const COLUMNS: GridColumn[] = [
  { key: 'accountNumber', label: 'Account Number' },
  { key: 'bookBalance', label: 'Book Balance', align: 'right' },
  { key: 'clearedBalance', label: 'Cleared Balance', align: 'right' },
  { key: 'blockedBalance', label: 'Blocked Balance', align: 'right' },
  {
    key: 'accountStatus',
    label: 'Account Status',
    render: (v) => <StatusBadge value={v} tone={statusTone(v)} />,
  },
  { key: 'creditLimit', label: 'Credit Limit', align: 'right' },
  { key: 'dormantFlag', label: 'Dormant Flag' },
]

export default function AccountInfo({
  customer,
  rows,
  onEnquiry,
  onChequeBook,
  onStandingOrder,
  onStopCheque,
  onUpdateHistory,
  onBlockedBreakup,
  onTransactions,
  onTransfers,
  onExit,
}: {
  customer: Customer
  rows: Account[]
  onEnquiry: (account: Account) => void
  onChequeBook: (account: Account) => void
  onStandingOrder: (account: Account) => void
  onStopCheque: (account: Account) => void
  onUpdateHistory: (account: Account) => void
  onBlockedBreakup: (account: Account) => void
  onTransactions: (account: Account) => void
  onTransfers: (account: Account) => void
  onExit: () => void
}) {
  const needRow = (fn: (row: any, notify: Notify) => void) => ({ row, notify }: GridButtonContext) => {
    if (!row) {
      notify('warn', 'Empty row selected — please select an account.')
      return
    }
    fn(row, notify)
  }
  const stub = (text: string) => needRow((row, notify) => notify('info', `${text} for account ${row.accountNumber} — to be built.`))

  const canView = hasAuthority('~60') || hasAuthority('~61') || hasAuthority('~62')
  const canTellerOps = hasAuthority('~62')
  const canDestroyCheque = hasAuthority('~61') || hasAuthority('~62')
  const noAuthority = 'Not available at your authority level'

  return (
    <GridScreen
      kicker="Account"
      title="Account Information"
      header={[
        { label: 'Customer #', value: customer.custNo },
        { label: 'Customer Name', value: customer.name },
      ]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No accounts found for this customer."
      buttonGroups={[
        [
          { label: 'Enquiry', kind: 'primary', onClick: needRow((row) => onEnquiry(row)) },
          { label: 'More', onClick: moreAction },
          { label: 'Ondemand Statement', disabled: !canView, title: canView ? undefined : noAuthority, onClick: stub('On-demand statement') },
          { label: 'Transaction Enquiry', disabled: !canView, title: canView ? undefined : noAuthority, onClick: stub('Transaction enquiry') },
          { label: 'Cheque Book Request', disabled: !canView, title: canView ? undefined : noAuthority, onClick: needRow((row) => onChequeBook(row)) },
          { label: 'Standing Order', disabled: !canTellerOps, title: canTellerOps ? undefined : noAuthority, onClick: needRow((row) => onStandingOrder(row)) },
          { label: 'Stop Cheque', disabled: !canTellerOps, title: canTellerOps ? undefined : noAuthority, onClick: needRow((row) => onStopCheque(row)) },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
        [
          { label: 'Destroy Cheque', disabled: !canDestroyCheque, title: canDestroyCheque ? undefined : noAuthority, onClick: stub('Destroy cheque') },
          { label: 'Historical Statement', disabled: !canView, title: canView ? undefined : noAuthority, onClick: stub('Historical statement') },
          { label: 'BM Transaction Enquiry', onClick: needRow((row) => onTransactions(row)) },
          { label: 'Transfer Enquiry', onClick: needRow((row) => onTransfers(row)) },
          { label: 'Blocked Amount Breakup', onClick: needRow((row) => onBlockedBreakup(row)) },
          { label: 'Account Update History', onClick: needRow((row) => onUpdateHistory(row)) },
        ],
      ]}
    />
  )
}
