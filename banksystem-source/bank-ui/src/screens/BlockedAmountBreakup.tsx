import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn } from '../components/GridScreen.tsx'
import type { BlockedAmountBreakup as Breakup } from '../api.ts'
import { formatAmount } from '../schema/helpers.ts'

// Mirrors legacy frmBlockedAmtBreakup.frm — five-source union of blocked
// amounts (QUERY-SPECS §16).

const PRODUCT_TYPES: Record<string, string> = {
  B: 'BM Loan',
  F: 'FINNONE Loan',
  O: 'Other BM Blocking',
  M: 'Manual Card Block',
  C: 'Card Arrear Block',
  A: 'Manual Account Block',
}

const COLUMNS: GridColumn[] = [
  { key: 'productType', label: 'Blocking Type', render: (v) => PRODUCT_TYPES[v] ?? v },
  { key: 'productNo', label: 'Product / Reference No' },
  { key: 'blockedAmt', label: 'Blocked Amount', align: 'right', render: formatAmount },
  { key: 'userIdBlocked', label: 'Blocked By' },
]

export default function BlockedAmountBreakup({ breakup, onReturn }: { breakup: Breakup; onReturn: () => void }) {
  return (
    <GridScreen
      kicker="Account"
      title="Breakup of Blocked Amount"
      header={[
        { label: 'Account No', value: breakup.accNo },
        { label: 'Total Blocked Balance', value: formatAmount(breakup.blockedBal) },
      ]}
      columns={COLUMNS}
      rows={breakup.details}
      emptyText="No blocked amounts for this account."
      buttonGroups={[[{ label: 'Return', kind: 'primary', onClick: () => onReturn() }]]}
    />
  )
}
