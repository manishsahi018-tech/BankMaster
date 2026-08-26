import type { HistoricalStatement as Statement } from '../api.ts'

// The Analysis the legacy produced — PORTED from docs/analyse.c, the source of
// the analyse.exe that frmHistStmt shelled.
//
// cmdAnalyse_Click (frmHistStmt.frm:520) ran `analyse <out>prtall.$s!
// <out>prtall.$a!` and cmdAnalysisHoStmt_Click (:537) ran the same binary over
// an HO-supplied spool into prtall.$h!; View Analysis opened the result in
// Notepad and Print Analysis sent it to the printer, PORTRAIT A4 Courier
// (:793). One program, one algorithm, two input directories.
//
// This file replaces the reasoned reconstruction that stood here before
// analyse.c turned up. That reconstruction produced a per-month table and four
// figures; the real report produces seventeen and no monthly breakdown at all.
// The table is KEPT — it is genuinely useful and the operator asked for it —
// and the legacy's figures are computed alongside it.
//
// WHAT analyse.c WORKED FROM, and why we do not. It parsed the PRINTED SPOOL:
// fixed-column text, page breaks on 0x0C, columns offset by `lang*n` after
// sniffing line 11 for high-bit bytes to tell Arabic from English. We have the
// rows the page was printed FROM, so every scrape it did is a field lookup
// here. That removes the language branch entirely — it existed only because
// Arabic and English pages put the columns in different places.
//
// TWO DELIBERATE DIVERGENCES, both flagged rather than silently copied:
//
//  1. DAY ARITHMETIC. analyse.c computes `yy*365 + jmon[mm] + dd` with no leap
//     correction, so every span drifts one day per 29 February inside it and
//     every average-daily-balance figure is off by that much. We use real
//     calendar days. The legacy's printed figures for a span crossing a leap
//     day will therefore differ slightly from ours; ours are the correct ones.
//
//  2. MISSING STATEMENTS. analyse.c could only INFER them: on a line with no
//     movement (the brought-forward line at the top of a sheet) it compared the
//     printed balance against a balance it had rolled forward itself, and
//     called a discrepancy over 0.01 spanning more than 2 days a missing
//     period. It had nothing else — the spool is only the sheets it was given.
//     DB #3 stores one statement row per month, so a gap in the STMT_DATE
//     sequence IS the missing statement, exactly and without inference.
//
// The sign convention the old reconstruction refused to assume is settled by
// this source. analyse.c negates the running balance on the printed DR marker
// — `newrec[14] == 'D'` in the English layout, byte 229 in the Arabic — so
// RUN_BAL_TYPE beginning 'D' means a negative balance. Highest/lowest balance
// and all three average-daily-balance figures depend on that and are computed
// here because of it.

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
   * RUN_BAL of the statement's LAST line, SIGNED. The lines arrive in printed
   * order (the repository orders them by TXN_ORDER), so the last one carries
   * the balance the sheet closed on, and RUN_BAL_TYPE gives it its sign.
   */
  closingBal: number
  /** The marker itself, still shown beside the figure as the sheet did. */
  closingBalType: string
}

/** A figure and the date it happened on — the legacy's "Occurred on" pairs. */
export interface Extreme {
  amount: number
  /** TXN_DATE, YYYYMMDD; blank when there were no lines at all. */
  date: string
}

/**
 * A run of months with no statement, as YYYYMM bounds — the FIRST and LAST
 * month actually missing, not the months either side of the gap.
 *
 * analyse.c could only print the bracket, `prev_date - curr_date`, because it
 * was reporting two sheets whose balances did not join up and had no idea what
 * belonged between them. We know: the months are simply absent from the
 * STMT_DATE sequence, so we name them. A single missing month has from === to.
 */
export interface MissingPeriod {
  from: string
  to: string
}

export interface StatementAnalysis {
  /** One row per statement, oldest first. Ours, not the legacy's. */
  periods: AnalysisPeriod[]

  // ---- Analysis Period ----
  /** TXN_DATE of the first transaction, YYYYMMDD. */
  fromDate: string
  /** STMT_DATE of the last statement, YYYYMMDD — where the legacy's end date
   *  came from (it scraped it off the page header). */
  toDate: string
  /** STMT_DATE bounds, for the panel heading's month labels. */
  fromStmtDate: string
  toStmtDate: string

  // ---- The legacy report ----
  largestDeposit: Extreme
  largestWithdrawal: Extreme
  highestBalance: Extreme
  lowestBalance: Extreme

  depositCount: number
  depositTotal: number
  depositAverage: number

  withdrawalCount: number
  withdrawalTotal: number
  withdrawalAverage: number

  /** Days the balance was negative, and the average balance across them. */
  daysInDebit: number
  averageBalanceInDebit: number
  /** Days the balance was positive, and the average balance across them. */
  daysInCredit: number
  averageBalanceInCredit: number
  /** Whole span, and the time-weighted average across it. */
  days: number
  averageDailyBalance: number

  branchTxns: number
  anbAtm: number
  spanAtm: number
  pos: number

  missingPeriods: MissingPeriod[]

  // ---- Totals under the per-month table ----
  txns: number
  debits: number
  credits: number
  net: number
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

/**
 * RUN_BAL with the sign RUN_BAL_TYPE gives it — analyse.c's `if(newrec[80] ==
 * 229 || (newrec[14] == 'D' && newrec[88] == '/')) b_amount = -b_amount`.
 * RUN_BAL itself is stored as a magnitude, so the marker is the only sign.
 */
function signedBalance(runBal: string, runBalType: string): number {
  const magnitude = Math.abs(amountOf(runBal))
  return String(runBalType ?? '').trim().toUpperCase().startsWith('D') ? -magnitude : magnitude
}

/** YYYYMMDD → days since epoch. Real calendar days — see divergence 1 above. */
function dayNumber(yyyymmdd: string): number | null {
  const s = String(yyyymmdd ?? '').trim()
  if (!/^\d{8}$/.test(s)) return null
  const ms = Date.UTC(+s.slice(0, 4), +s.slice(4, 6) - 1, +s.slice(6, 8))
  return Number.isNaN(ms) ? null : Math.round(ms / 86_400_000)
}

/**
 * Which channel a line came through, or null.
 *
 * analyse.c matched the PRINTED narrative column against three fixed 23-char
 * strings, in this order — "WITHDRAWAL - ATM(OTHERS)" (a card used on another
 * bank's machine, so SPAN), then "WITHDRAWAL - ATM" (ANB's own), then "POS".
 * The order is load-bearing: the OTHERS test has to run first or every SPAN
 * withdrawal is counted as an ANB one, and that is preserved here.
 *
 * The strings themselves are NOT, because they were column-padded text off a
 * print sheet and we have the narrative fields instead. This matches on the
 * legacy's distinguishing words across all four narrative lines. If real DB #3
 * narratives turn out to carry the printed wording verbatim, tighten this to
 * the exact constants above — they are the authority, this is the port of what
 * they were discriminating.
 *
 * POS is matched on a WORD boundary. A substring test would count every
 * "DEPOSIT" line as a point-of-sale purchase.
 */
function channelOf(narrative: string): 'span' | 'anb' | 'pos' | null {
  const n = narrative.toUpperCase()
  if (/\bATM\b/.test(n)) return /\bOTHER/.test(n) ? 'span' : 'anb'
  if (/\bPOS\b/.test(n)) return 'pos'
  return null
}

/**
 * Was this posted at a branch?
 *
 * analyse.c: `brno > 100 && brno < 399` excluding 197, 198, 199 and 299 — the
 * pseudo-branch numbers the bank used for non-branch origination. Bounds are
 * the legacy's own and EXCLUSIVE at both ends, so 100 and 399 do not count.
 */
const NON_BRANCH = new Set([197, 198, 199, 299])
function isBranchTxn(txnBranchCode: string): boolean {
  const n = Number(String(txnBranchCode ?? '').trim())
  if (!Number.isFinite(n)) return false
  return n > 100 && n < 399 && !NON_BRANCH.has(n)
}

/** YYYYMMDD → YYYYMM. */
const monthOf = (yyyymmdd: string) => String(yyyymmdd ?? '').slice(0, 6)

/** YYYYMM as a month ordinal, and back — so gaps are plain subtraction. */
const ordinalOf = (yyyymm: string) => +yyyymm.slice(0, 4) * 12 + (+yyyymm.slice(4, 6) - 1)
const monthFromOrdinal = (n: number) =>
  `${String(Math.floor(n / 12)).padStart(4, '0')}${String((n % 12) + 1).padStart(2, '0')}`

/** The runs of months absent from a sorted YYYYMM sequence. */
function gapsBetween(months: string[]): MissingPeriod[] {
  const gaps: MissingPeriod[] = []
  for (let i = 1; i < months.length; i++) {
    const after = ordinalOf(months[i - 1]) + 1
    const before = ordinalOf(months[i]) - 1
    if (before >= after) {
      gaps.push({ from: monthFromOrdinal(after), to: monthFromOrdinal(before) })
    }
  }
  return gaps
}

export function analyseStatements(statements: Statement[]): StatementAnalysis {
  // Oldest first, whatever order the request came back in: an analysis is read
  // down the months, and the running weighting below depends on order.
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
      closingBal: last ? signedBalance(last.runBal, last.runBalType) : 0,
      closingBalType: last?.runBalType ?? '',
    }
  })

  // Every line of every statement, in printed order — the legacy read one
  // merged spool and never saw a statement boundary, so neither does this.
  const lines = ordered.flatMap((s) => s.lines)

  let depositCount = 0
  let withdrawalCount = 0
  let depositTotal = 0
  let withdrawalTotal = 0
  let largestDeposit: Extreme = { amount: 0, date: '' }
  let largestWithdrawal: Extreme = { amount: 0, date: '' }
  let highestBalance: Extreme = { amount: 0, date: '' }
  let lowestBalance: Extreme = { amount: 0, date: '' }
  let branchTxns = 0
  let anbAtm = 0
  let spanAtm = 0
  let pos = 0

  // Time-weighted balance accumulators, split by side exactly as analyse.c
  // splits them into ptotalamount/pdays and ntotalamount/ndays.
  let weighted = 0
  let weightedCredit = 0
  let weightedDebit = 0
  let daysInCredit = 0
  let daysInDebit = 0

  let firstDay: number | null = null
  let prevDay: number | null = null
  let balance = 0
  let fromDate = ''

  for (const line of lines) {
    const day = dayNumber(line.txnDate)
    const debit = amountOf(line.drAmt)
    const credit = amountOf(line.crAmt)

    withdrawalTotal += debit
    depositTotal += credit
    // The legacy counted a NON-BLANK column, not a non-zero amount
    // (`memcmp(&newrec[...], "  ", 2) != 0`), so a printed 0.00 counted.
    if (String(line.drAmt ?? '').trim() !== '') withdrawalCount++
    if (String(line.crAmt ?? '').trim() !== '') depositCount++

    if (firstDay === null && day !== null) {
      // First line seeds the extremes and the clock, as `if(first == 0)` does.
      firstDay = day
      prevDay = day
      fromDate = line.txnDate
      largestDeposit = { amount: credit, date: line.txnDate }
      largestWithdrawal = { amount: debit, date: line.txnDate }
      balance = signedBalance(line.runBal, line.runBalType)
      highestBalance = { amount: balance, date: line.txnDate }
      lowestBalance = { amount: balance, date: line.txnDate }
    }

    // Weight the interval that just ENDED by the balance that was in force
    // through it — analyse.c accumulates before reassigning b_amount.
    if (day !== null && prevDay !== null) {
      const span = Math.max(0, day - prevDay)
      if (span > 0) {
        weighted += balance * span
        if (balance < 0) {
          weightedDebit += balance * span
          daysInDebit += span
        } else {
          weightedCredit += balance * span
          daysInCredit += span
        }
      }
      prevDay = Math.max(prevDay, day)
    }

    balance = signedBalance(line.runBal, line.runBalType)

    if (credit > largestDeposit.amount) largestDeposit = { amount: credit, date: line.txnDate }
    if (debit > largestWithdrawal.amount) largestWithdrawal = { amount: debit, date: line.txnDate }
    if (balance > highestBalance.amount) highestBalance = { amount: balance, date: line.txnDate }
    if (balance < lowestBalance.amount) lowestBalance = { amount: balance, date: line.txnDate }

    if (isBranchTxn(line.txnBranchCode)) branchTxns++
    const channel = channelOf(
      `${line.narrative1} ${line.narrative2} ${line.narrative3} ${line.narrative4}`,
    )
    if (channel === 'span') spanAtm++
    else if (channel === 'anb') anbAtm++
    else if (channel === 'pos') pos++
  }

  // The final stretch, last transaction to the statement end date. analyse.c
  // does this after the read loop, off the end date it scraped from the page.
  const toDate = ordered[ordered.length - 1]?.stmtDate ?? ''
  const lastDay = dayNumber(toDate)
  if (lastDay !== null && prevDay !== null && lastDay > prevDay) {
    const span = lastDay - prevDay
    weighted += balance * span
    if (balance < 0) {
      weightedDebit += balance * span
      daysInDebit += span
    } else {
      weightedCredit += balance * span
      daysInCredit += span
    }
    prevDay = lastDay
  }

  // `days = lastjday - firstjday` — the legacy's own final assignment, which
  // drops the +1 it used inside the loop.
  const days = firstDay !== null && prevDay !== null ? Math.max(0, prevDay - firstDay) : 0

  const missingPeriods = gapsBetween(periods.map((p) => monthOf(p.stmtDate)).filter(Boolean))

  const sum = (pick: (p: AnalysisPeriod) => number) => periods.reduce((n, p) => n + pick(p), 0)
  const debits = sum((p) => p.debits)
  const credits = sum((p) => p.credits)

  return {
    periods,

    fromDate,
    toDate,
    fromStmtDate: periods[0]?.stmtDate ?? '',
    toStmtDate: periods[periods.length - 1]?.stmtDate ?? '',

    largestDeposit,
    largestWithdrawal,
    highestBalance,
    lowestBalance,

    depositCount,
    depositTotal,
    depositAverage: depositCount > 0 ? depositTotal / depositCount : depositTotal,
    withdrawalCount,
    withdrawalTotal,
    withdrawalAverage: withdrawalCount > 0 ? withdrawalTotal / withdrawalCount : withdrawalTotal,

    daysInDebit,
    averageBalanceInDebit: daysInDebit > 0 ? weightedDebit / daysInDebit : 0,
    daysInCredit,
    averageBalanceInCredit: daysInCredit > 0 ? weightedCredit / daysInCredit : 0,
    days,
    averageDailyBalance: days > 0 ? weighted / days : 0,

    branchTxns,
    anbAtm,
    spanAtm,
    pos,

    missingPeriods,

    txns: sum((p) => p.txns),
    debits,
    credits,
    net: credits - debits,
  }
}
