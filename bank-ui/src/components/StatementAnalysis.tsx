import { formatPlainAmount } from '../schema/helpers.ts'
import { monthLabel } from './StatementCard.tsx'
import type { StatementAnalysis as Analysis } from './statementAnalysis.ts'
import { t } from '../i18n/index.ts'

// The rendering of an Analysis — see statementAnalysis.ts for what the figures
// are and why they stop where they do.
//
// The legacy's analysis file was PORTRAIT A4 Courier (cmdPrintAnalysis_Click,
// frmHistStmt.frm:793-814), unlike the landscape statement spool beside it, so
// this report carries no .print-landscape: portrait is the stylesheet's default
// and the analysis is a narrow table that wants it.

/** A count, not money — grouped, but never given decimal places. */
const count = (n: number) => n.toLocaleString('en-US')

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
        {analysis.fromStmtDate && (
          <p className="mt-1 text-sm text-muted">
            {t('Covers {from} to {to}', {
              from: monthLabel(analysis.fromStmtDate),
              to: monthLabel(analysis.toStmtDate),
            })}
          </p>
        )}
      </header>

      <div className="overflow-x-auto print-expand">
        <table className="w-full text-sm">
          <thead className="border-b border-edge-soft bg-surface text-start text-muted">
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
                  {formatPlainAmount(p.closingBal) || '—'}
                  {/* Carried through with its marker, never interpreted — the
                      same treatment the transaction table gives it. */}
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
