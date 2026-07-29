import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn } from '../components/GridScreen.tsx'
import type { BlockedAmountBreakup as Breakup } from '../api.ts'
import { amountValue, formatAmount } from '../schema/helpers.ts'

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

/** §16 source view -> the blocking type it contributes. */
const SOURCE_LABELS: Record<string, string> = {
  gld0data: 'BM Loan',
  aad0data: 'FINNONE Loan',
  bkd0data: 'Other BM Blocking',
  ccarrblk: 'Card Arrear Block',
  staccblk: 'Manual Account Block',
}

const COLUMNS: GridColumn[] = [
  { key: 'productType', label: 'Blocking Type', render: (v) => PRODUCT_TYPES[v] ?? v },
  { key: 'productNo', label: 'Product / Reference No' },
  { key: 'blockedAmt', label: 'Blocked Amount', align: 'right', render: formatAmount },
  { key: 'userIdBlocked', label: 'Blocked By' },
]

// The "Total Blocked Balance" tile is the gld0data header figure and is read
// INDEPENDENTLY of the detail rows (JdbcAccountRepository.blockedAmountBreakup).
// So the two can legitimately disagree — a source view can be absent (bkd0data
// and ccarrblk are both missing from Denodo today), a source query can fail at
// runtime, or the legacy 31-row cap can truncate. Previously the difference
// just vanished: the tile showed more than the rows added up to and nothing on
// screen said why, which reads as wrong data rather than partial data.
//
// Anything below half a halala is rounding, not a real gap.
const EPSILON = 0.005

export default function BlockedAmountBreakup({ breakup, onReturn }: { breakup: Breakup; onReturn: () => void }) {
  const total = amountValue(breakup.blockedBal) ?? 0
  const listed = breakup.details.reduce<number>(
    (sum, row) => sum + (amountValue(row.blockedAmt) ?? 0),
    0,
  )
  const gap = total - listed
  const hasGap = Math.abs(gap) >= EPSILON

  const missing = (breakup.unavailableSources ?? [])
    .map((s) => SOURCE_LABELS[s] ?? s)
    .filter((v, i, a) => a.indexOf(v) === i)

  // Say what is known, in descending order of certainty: which sources failed,
  // then the row cap, then "cause unknown" rather than inventing one.
  const reason = missing.length
    ? `${missing.length === 1 ? 'This source is' : 'These sources are'} unavailable: ${missing.join(', ')}.`
    : breakup.truncated
      ? `The list stops at the legacy cap of 31 rows, so later blocks are not shown.`
      : `The rows shown do not account for it; the cause is not recorded.`

  return (
    <div>
      {hasGap && (
        <div className="mx-auto max-w-7xl px-4 pt-8 sm:px-6">
          <div className="rounded-2xl border border-warn/40 bg-warn-soft px-4 py-3 text-sm text-warn sm:px-5">
            <p className="font-semibold">
              {gap > 0 ? 'Not every block is itemised below' : 'Listed blocks exceed the account total'}
            </p>
            <p className="mt-0.5">
              The total comes from the account record, the rows from the blocking tables, and they
              disagree by{' '}
              <span className="font-semibold tabular-nums">{formatAmount(Math.abs(gap))}</span>
              {gap > 0 ? ' that is blocked but not listed. ' : ' more than the account total. '}
              {reason}
            </p>
            {breakup.truncated && missing.length > 0 && (
              <p className="mt-0.5">The list also stops at the legacy cap of 31 rows.</p>
            )}
          </div>
        </div>
      )}
      <GridScreen
        kicker="Account"
        title="Breakup of Blocked Amount"
        header={[
          { label: 'Account No', value: breakup.accNo },
          { label: 'Total Blocked Balance', value: formatAmount(breakup.blockedBal) },
          // Only worth showing when it differs from the total — otherwise it is
          // the same number twice.
          ...(hasGap ? [{ label: 'Itemised Below', value: formatAmount(listed) }] : []),
        ]}
        columns={COLUMNS}
        rows={breakup.details}
        emptyText={
          hasGap
            ? 'None of this account’s blocks could be listed — see the note above.'
            : 'No blocked amounts for this account.'
        }
        buttonGroups={[[{ label: 'Return', kind: 'primary', onClick: () => onReturn() }]]}
      />
    </div>
  )
}
