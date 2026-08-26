import { formatDate, formatPlainAmount } from '../schema/helpers.ts'
import { monthLabel } from './StatementCard.tsx'
import type { StatementAnalysis as Analysis, Extreme } from './statementAnalysis.ts'
import { t } from '../i18n/index.ts'

// The rendering of an Analysis — see statementAnalysis.ts for what every figure
// is and where in analyse.c it comes from.
//
// The legacy's analysis file was PORTRAIT A4 Courier (cmdPrintAnalysis_Click,
// frmHistStmt.frm:793-814), unlike the landscape statement spool beside it, so
// this report carries no .print-landscape: portrait is the stylesheet's default
// and the analysis is a narrow report that wants it.
//
// LAYOUT. analyse.exe wrote one flat column of label-colon-figure lines. That
// is a teleprinter talking, not a design, and setting it as a monospace block
// would be copying the limitation rather than the report. The figures are laid
// out as the pairs they actually are — deposits against withdrawals, the two
// balance extremes together, the three daily-balance figures as one band — with
// the legacy's own labels and its own order within each group. The per-month
// table, which the legacy had no equivalent of, follows underneath.

/** A count, not money — grouped, but never given decimal places. */
const count = (n: number) => n.toLocaleString('en-US')

/** Money with its sign; a negative balance reads as one. */
const money = (n: number) => formatPlainAmount(n)

function Figure({
  label,
  value,
  occurredOn,
  strong = false,
}: {
  label: string
  value: string
  /** YYYYMMDD — renders the legacy's "Occurred on <date>" tail. */
  occurredOn?: string
  strong?: boolean
}) {
  return (
    <div className="flex flex-wrap items-baseline justify-between gap-x-4 gap-y-0.5 py-1.5">
      <span className="text-sm text-muted">{t(label)}</span>
      <span className="flex items-baseline gap-2">
        {occurredOn && (
          <span className="text-xs text-muted-soft">
            {t('Occurred on {date}', { date: formatDate(occurredOn) })}
          </span>
        )}
        <span
          className={`tabular-nums ${strong ? 'text-base font-semibold text-ink' : 'text-sm font-medium text-ink-soft'}`}
        >
          {value}
        </span>
      </span>
    </div>
  )
}

function Group({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <div className="break-inside-avoid rounded-xl border border-edge-soft bg-surface-muted/40 p-4">
      <h3 className="mb-1.5 text-xs font-semibold uppercase tracking-wide text-muted-soft">
        {t(title)}
      </h3>
      <div className="divide-y divide-edge-soft">{children}</div>
    </div>
  )
}

const extreme = (e: Extreme) => ({ value: money(e.amount), occurredOn: e.date || undefined })

export function StatementAnalysisReport({
  analysis,
  documentName,
  accountNumber,
  currency,
  accountType,
}: {
  analysis: Analysis
  /** Names the document on paper and in the browser's save dialog alike. */
  documentName: string
  accountNumber: string
  /** Already in the legacy's "<code>-<description>" form, or blank. */
  currency: string
  accountType: string
}) {
  const { periods } = analysis
  const head = 'px-4 py-2.5 font-semibold'
  const cell = 'whitespace-nowrap px-4 py-2.5 tabular-nums'
  return (
    <section className="print-expand overflow-hidden rounded-2xl border border-edge bg-surface shadow-sm">
      <header className="border-b border-edge-soft bg-surface-muted px-4 py-4 sm:px-5">
        <h2 className="text-base font-semibold text-ink">{t(documentName)}</h2>
        <p className="mt-0.5 text-sm text-muted">
          <span className="whitespace-nowrap tabular-nums">{accountNumber}</span>
          {currency && ` · ${currency}`}
          {accountType && ` · ${accountType}`}
        </p>
        {/* The legacy's "Analysis Period" line: first transaction date to the
            statement end date, both as dates rather than months. */}
        {analysis.fromDate && (
          <p className="mt-1 text-sm text-muted">
            {t('Analysis Period: {from} - {to}', {
              from: formatDate(analysis.fromDate),
              to: formatDate(analysis.toDate),
            })}
          </p>
        )}
      </header>

      <div className="grid gap-3 p-4 sm:grid-cols-2 sm:p-5">
        <Group title="Deposits">
          <Figure label="Largest Deposit Amount" {...extreme(analysis.largestDeposit)} />
          <Figure label="Number of Deposits" value={count(analysis.depositCount)} />
          <Figure label="Total Amount of Deposits" value={money(analysis.depositTotal)} />
          <Figure label="Average Deposit Amount" value={money(analysis.depositAverage)} />
        </Group>

        <Group title="Withdrawals">
          <Figure label="Largest Withdrawal Amount" {...extreme(analysis.largestWithdrawal)} />
          <Figure label="Number of Withdrawals" value={count(analysis.withdrawalCount)} />
          <Figure label="Total Amount of Withdrawals" value={money(analysis.withdrawalTotal)} />
          <Figure label="Average Withdrawal Amount" value={money(analysis.withdrawalAverage)} />
        </Group>

        <Group title="Balance">
          <Figure label="Highest Balance" {...extreme(analysis.highestBalance)} strong />
          <Figure label="Lowest Balance" {...extreme(analysis.lowestBalance)} strong />
        </Group>

        <Group title="Average Daily Balance">
          {/* Time-weighted, and split by side — a balance that spent 300 days
              at 500 and 5 days at 90,000 is not averaged by counting rows. */}
          <Figure
            label="Number of days in credit"
            value={`${count(analysis.daysInCredit)}  ·  ${money(analysis.averageBalanceInCredit)}`}
          />
          <Figure
            label="Number of days in debit"
            value={`${count(analysis.daysInDebit)}  ·  ${money(analysis.averageBalanceInDebit)}`}
          />
          <Figure
            label="Average Daily Balance"
            value={money(analysis.averageDailyBalance)}
            strong
          />
        </Group>

        <Group title="Channels">
          <Figure label="Branch Transactions" value={count(analysis.branchTxns)} />
          <Figure label="ATM Card Transactions — ANB" value={count(analysis.anbAtm)} />
          <Figure label="ATM Card Transactions — SPAN" value={count(analysis.spanAtm)} />
          <Figure label="ATM Card Transactions — POS" value={count(analysis.pos)} />
        </Group>

        {analysis.missingPeriods.length > 0 && (
          <Group title="Missing statements for the following periods">
            {/* The months themselves, not the sheets either side of them —
                one row per run, collapsed when a run is a single month. */}
            {analysis.missingPeriods.map((m) => (
              <p key={`${m.from}-${m.to}`} className="py-1.5 text-sm text-ink-soft">
                {m.from === m.to
                  ? monthLabel(`${m.from}01`)
                  : `${monthLabel(`${m.from}01`)} – ${monthLabel(`${m.to}01`)}`}
              </p>
            ))}
          </Group>
        )}
      </div>

      <div className="overflow-x-auto print-expand">
        <table className="w-full text-sm">
          <thead className="border-y border-edge-soft bg-surface text-start text-muted">
            <tr className="text-start">
              <th className={head}>{t('Period')}</th>
              <th className={head}>{t('Statement No')}</th>
              <th className={`${head} text-end`}>{t('Transactions')}</th>
              <th className={`${head} text-end`}>{t('Debit')}</th>
              <th className={`${head} text-end`}>{t('Credit')}</th>
              <th className={`${head} text-end`}>{t('Net Movement')}</th>
              <th className={`${head} text-end`}>{t('Closing Balance')}</th>
            </tr>
          </thead>
          <tbody>
            {periods.map((p) => (
              <tr key={`${p.stmtDate}-${p.stmtNum}`} className="border-b border-edge-soft">
                <td className={`${cell} text-ink-soft`}>{monthLabel(p.stmtDate)}</td>
                <td className={`${cell} text-muted`}>{p.stmtNum || '—'}</td>
                <td className={`${cell} text-end text-ink-soft`}>{count(p.txns)}</td>
                <td className={`${cell} text-end text-ink-soft`}>
                  {formatPlainAmount(p.debits)}
                </td>
                <td className={`${cell} text-end text-ink-soft`}>
                  {formatPlainAmount(p.credits)}
                </td>
                <td className={`${cell} text-end text-ink-soft`}>{formatPlainAmount(p.net)}</td>
                <td className={`${cell} text-end font-medium text-ink`}>
                  {money(p.closingBal)}
                  {/* The marker still prints beside the figure as the sheet
                      showed it, even though the sign now carries the meaning. */}
                  {p.closingBalType && (
                    <span className="ms-1 text-xs font-normal text-muted">{p.closingBalType}</span>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
          <tfoot>
            <tr className="border-t-2 border-edge font-semibold text-ink">
              <td className={cell} colSpan={2}>
                {t('Total')}
              </td>
              <td className={`${cell} text-end`}>{count(analysis.txns)}</td>
              <td className={`${cell} text-end`}>{formatPlainAmount(analysis.debits)}</td>
              <td className={`${cell} text-end`}>{formatPlainAmount(analysis.credits)}</td>
              <td className={`${cell} text-end`}>{formatPlainAmount(analysis.net)}</td>
              {/* No grand-total closing balance: balances do not add up, and
                  the last period's closing figure is already on its own row. */}
              <td className={cell} />
            </tr>
          </tfoot>
        </table>
      </div>
    </section>
  )
}
