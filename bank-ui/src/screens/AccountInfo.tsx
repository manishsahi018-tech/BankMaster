import GridScreen from '../components/GridScreen.tsx'
import type { GridButtonContext, GridColumn, Notify } from '../components/GridScreen.tsx'
import StatusBadge, { statusTone } from '../components/StatusBadge.tsx'
import type { Account, Customer } from '../types.ts'
import { hasAuthority } from '../session.ts'
import { codeLabel } from '../codes.ts'
import { formatAmount } from '../schema/helpers.ts'

// Mirrors legacy frmAccount.frm ("Account" MDI child) — the account grid a
// customer's Account button opens, with the two rows of facility buttons.
// Facility buttons follow the frmAccount.frm:1822-1865 authority branches:
// ~60 view-only and ~61 full both get Statement/Transaction/ChequeBook/
// HistStmt; StdOrd + StopCheque are ~62 (teller ops) only; DestroyCheque
// is ~61/~62.

const COLUMNS: GridColumn[] = [
  { key: 'accountNumber', label: 'Account Number' },
  { key: 'bookBalance', label: 'Book Balance', align: 'right', render: formatAmount },
  { key: 'clearedBalance', label: 'Cleared Balance', align: 'right', render: formatAmount },
  { key: 'blockedBalance', label: 'Blocked Balance', align: 'right', render: formatAmount },
  {
    key: 'accountStatus',
    // codeLabel yields "<code>-<description>", so statusTone still matches on
    // the leading code and the badge colour is unaffected.
    label: 'Account Status',
    render: (v) => <StatusBadge value={codeLabel('accStatus', v)} tone={statusTone(v)} />,
  },
  { key: 'creditLimit', label: 'Credit Limit', align: 'right', render: formatAmount },
  { key: 'dormantFlag', label: 'Dormant Flag' },
]

// Enquiry-only build: write/teller actions are hidden. Flip to false to restore.
const ENQUIRY_ONLY = true

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
  onHistStatement,
  onOndemandStatement,
  onTransactionInquiry,
  hasMore = false,
  onMore,
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
  onHistStatement: (account: Account) => void
  onOndemandStatement: (account: Account) => void
  onTransactionInquiry: (account: Account) => void
  hasMore?: boolean
  onMore?: () => void
  onExit: () => void
}) {
  const needRow = (fn: (row: any, notify: Notify) => void) => ({ row, notify }: GridButtonContext) => {
    if (!row) {
      notify('warn', 'Empty row selected — please select an account.')
      return
    }
    // Every legacy row action re-checks the balance-enquiry restriction before
    // opening anything (frmAccount.frm:836-842, :1114-1120, :1285-1291,
    // :1365-1371 — cmdStatement / cmdTransaction / cmdTransEnq / cmdHistStmt
    // all do the same three lines). The server has already zeroed the amounts;
    // this stops the operator drilling into the account at all.
    if (row.balEnqRestricted === '1') {
      notify('warn', 'Not authorized to access the account details of enquiry restricted branch')
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
      hasMore={hasMore}
      onMore={onMore}
      buttonGroups={[
        [
          { label: 'Enquiry', kind: 'primary', onClick: needRow((row) => onEnquiry(row)) },
          // Legacy cmdStatement — frmInputform (OnlineStmt.frm) over the ONLINE
          // GATEWAY envelope (checkSum/branchName/Source/EOT), service 07, not
          // cbcmssrv. No archival view behind it; the screen says so at the top.
          {
            label: 'Ondemand Statement',
            disabled: !canView,
            title: canView ? undefined : noAuthority,
            onClick: needRow((row) => onOndemandStatement(row)),
          },
          // Legacy cmdTransaction — frmTransaction.frm, same gateway, service
          // 11. The ARCHIVAL transaction enquiry is "Transaction Type Enquiry"
          // below; these two are different screens against different sources.
          {
            label: 'Transaction Inquiry',
            disabled: !canView,
            title: canView ? undefined : noAuthority,
            onClick: needRow((row) => onTransactionInquiry(row)),
          },
          { label: 'Cheque Book Request', disabled: !canView, title: canView ? undefined : noAuthority, onClick: needRow((row) => onChequeBook(row)) },
          { label: 'Standing Order', disabled: !canTellerOps, title: canTellerOps ? undefined : noAuthority, onClick: needRow((row) => onStandingOrder(row)) },
          { label: 'Stop Cheque', disabled: !canTellerOps, title: canTellerOps ? undefined : noAuthority, onClick: needRow((row) => onStopCheque(row)) },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
        [
          // Hidden for enquiry-only (write action: destroy cheque).
          ...(ENQUIRY_ONLY
            ? []
            : [{ label: 'Destroy Cheque', disabled: !canDestroyCheque, title: canDestroyCheque ? undefined : noAuthority, onClick: stub('Destroy cheque') }]),
          // Legacy cmdHistStmt ("Historical Statement") — frmHistStmt.frm. The
          // only screen served by DB #3, the statement archive: the legacy read
          // it from Btrieve indexes and zipped page files on a mapped drive,
          // which that database replaces. Unlike the two buttons above it does
          // NOT need the Finacle/online source.
          {
            label: 'Historical Statement',
            disabled: !canView,
            title: canView ? undefined : noAuthority,
            onClick: needRow((row) => onHistStatement(row)),
          },
          // Legacy cmdTransEnq ("Transaction Type Enquiry") — service 85 over
          // thd0data, with the date range + trans-type filter.
          { label: 'Transaction Type Enquiry', onClick: needRow((row) => onTransactions(row)) },
          { label: 'Transfer Enquiry', onClick: needRow((row) => onTransfers(row)) },
          { label: 'Blocked Amount Breakup', onClick: needRow((row) => onBlockedBreakup(row)) },
          { label: 'Account Update History', onClick: needRow((row) => onUpdateHistory(row)) },
        ],
      ]}
    />
  )
}
