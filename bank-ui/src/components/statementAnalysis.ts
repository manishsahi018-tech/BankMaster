import type { HistoricalStatement as Statement } from '../api.ts'

// The Analysis the legacy produced, RECONSTRUCTED — not ported.
//
// cmdAnalyse_Click (frmHistStmt.frm:507) shelled a compiled utility over the
// merged print spool, `analyse prtall.$s! prtall.$a!`, and the result was read
// back as plain text: View Analysis opened it in Notepad (:1067) and Print
// Analysis sent it to the printer in PORTRAIT A4 Courier (:793). analyse.exe
// lives on the branch's util drive (anbLibrary.bas:334-339, default i:\hist\);
// it is not in the source dump and no sample of its output survives with it.
// There is nothing to port, so this is a reasoned reconstruction and should be
// replaced the moment a real analysis listing turns up.
//
// What is certain is what it had to work from. The spool was the printed
// statement: dates, narratives, a debit column, a credit column and a running
// balance. An analysis over that can only be a count-and-total of those
// columns, so that is what this computes — and only where the columns support
// the arithmetic on their own:
//
//   * DR_AMT and CR_AMT are unsigned magnitudes, so each side sums cleanly and
//     the difference between them is the period's net movement.
//   * RUN_BAL carries its debit/credit sense in a SEPARATE marker,
//     RUN_BAL_TYPE, which the legacy never interpreted — StatementCard prints
//     it verbatim beside the figure for exactly that reason. So the closing
//     balance is carried through with its marker and never has arithmetic done
//     to it. That rules out two figures an analysis would otherwise carry: an
//     opening balance (reversing the first line's movement out of its running
//     balance) and a highest/lowest balance. Both need a sign convention this
//     archive does not state, and a balance stated with the wrong sign is worse
//     than one not stated at all.

/** One statement's line in the analysis — the archive stores one per month. */
export interface AnalysisPeriod {
  /** STMT_DATE of the statement summarised, YYYYMMDD. */
  stmtDate: string
  stmtNum: string
  txns: number
  debits: number
  credits: number
  /** credits - debits: what the period moved the account by. */
  net: number
  /**
   * RUN_BAL of the statement's LAST line, with its RUN_BAL_TYPE marker
   * alongside. The lines arrive in printed order (the repository orders them
   * by TXN_ORDER), so the last one carries the balance the sheet closed on.
   */
  closingBal: string
  closingBalType: string
}

export interface StatementAnalysis {
  /** One row per statement, oldest first. */
  periods: AnalysisPeriod[]
  txns: number
  debits: number
  credits: number
  net: number
  /** STMT_DATE of the first and last statement covered, for the heading. */
  fromStmtDate: string
  toStmtDate: string
}

/**
 * A statement amount as a number. The archive stores these as plain decimal
 * strings from Oracle NUMBER(30,3) — never the overpunch-signed archival form
 * — so Number() is the whole conversion. Blank and unparseable both fall to 0:
 * a missing debit on a credit line is the normal case, not an error.
 */
function amountOf(value: string): number {
  const n = Number(String(value ?? '').trim())
  return Number.isFinite(n) ? n : 0
}

export function analyseStatements(statements: Statement[]): StatementAnalysis {
  // Oldest first, whatever order the request came back in: an analysis is read
  // down the months, and the grand total below must not depend on row order.
  const ordered = [...statements].sort((a, b) => a.stmtDate.localeCompare(b.stmtDate))

  const periods: AnalysisPeriod[] = ordered.map((s) => {
    const debits = s.lines.reduce((sum, l) => sum + amountOf(l.drAmt), 0)
    const credits = s.lines.reduce((sum, l) => sum + amountOf(l.crAmt), 0)
    const last = s.lines[s.lines.length - 1]
    return {
      stmtDate: s.stmtDate,
      stmtNum: s.stmtNum,
      txns: s.lines.length,
      debits,
      credits,
      net: credits - debits,
      closingBal: last?.runBal ?? '',
      closingBalType: last?.runBalType ?? '',
    }
  })

  const sum = (pick: (p: AnalysisPeriod) => number) => periods.reduce((n, p) => n + pick(p), 0)
  const debits = sum((p) => p.debits)
  const credits = sum((p) => p.credits)

  return {
    periods,
    txns: sum((p) => p.txns),
    debits,
    credits,
    net: credits - debits,
    fromStmtDate: periods[0]?.stmtDate ?? '',
    toStmtDate: periods[periods.length - 1]?.stmtDate ?? '',
  }
}
