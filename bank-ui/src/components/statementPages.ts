import type { HistoricalStatement as Statement, HistoricalStatementLine as Line } from '../api.ts'

/**
 * The statements cut into SHEETS.
 *
 * A printed page number can only be true if the page breaks are ours. CSS has
 * no way to read the printer's own counter — counter(page)/counter(pages) live
 * in @page margin boxes, which no browser implements — and the browser will not
 * tell the document where it decided to break. So the transactions are dealt
 * out into sheet-sized cards here, print CSS puts one card on one sheet
 * (.print-per-page in index.css), and the card's footer number IS the sheet
 * number. It is the same arrangement the legacy spooler had: its pages were
 * measured in LINES — 40 transactions under four header lines — and a form feed
 * marked where one ended.
 *
 * The unit is a TEXT LINE of the printed table, because that is what varies: a
 * transaction carries one to four narrative lines, and a long narrative wraps
 * inside its column. Counting rows instead would let four four-line rows pass
 * for four one-line rows and overflow the sheet.
 */

/**
 * Lines of table body one sheet holds, in units of one printed text line.
 *
 * MEASURED, in Chrome, against the print rules in index.css rather than
 * estimated: a text line of the printed table is 15.3px (8.5pt on 1.35), and
 * the first sheet — the tight one, since it gives 16mm to the document heading
 * — leaves 729px of body between the card's header, table head and footer.
 * That is 47 lines for a PDP statement and about 45 for a BM one, whose header
 * carries an IBAN and a reference row PDP has not got.
 *
 * The budget sits below the smaller of those on purpose. Every number here is
 * a measurement of ONE rendering, and a sheet that overflows costs a wrong page
 * number on every sheet after it, where a sheet that runs short costs white
 * space nobody notices.
 */
const LINES_PER_SHEET = 40

/** Characters of narrative that fit one line of the column at print size. */
const NARRATIVE_CHARS = 38

/**
 * What one transaction row costs, in text lines: its narrative lines (a row
 * with no narrative still occupies one), each counted for the wrapping it will
 * do, plus a share for the row's own cell padding — 3px top and bottom against
 * a 4.05mm line is a bit under half a line.
 *
 * Exported because the on-demand statement prints the same kind of row from a
 * different source, and the two must be cut the same way.
 */
export function rowCost(narratives: string[]): number {
  const lines = narratives
    .filter((n) => n.trim() !== '')
    .reduce((n, text) => n + Math.max(1, Math.ceil(text.trim().length / NARRATIVE_CHARS)), 0)
  return ROW_PADDING + Math.max(1, lines)
}

/** A row's cell padding, as a fraction of a text line. */
export const ROW_PADDING = 0.4

function cost(line: Line): number {
  return rowCost([line.narrative1, line.narrative2, line.narrative3, line.narrative4])
}

/**
 * Rows dealt into sheets, each sheet filled to the line budget.
 *
 * `firstSheetReserve` and `lastSheetReserve` are for the rows a sheet carries
 * that are not in this list — the on-demand statement opens with a brought
 * forward line and closes with its movement totals, and a total block that did
 * not fit would land on a sheet of its own or, worse, past the bottom edge of
 * the last one.
 */
export function cutIntoSheets<T>(
  rows: T[],
  cost: (row: T) => number,
  opts: { budget?: number; firstSheetReserve?: number; lastSheetReserve?: number } = {},
): T[][] {
  const budget = opts.budget ?? LINES_PER_SHEET
  const sheets: T[][] = [[]]
  let used = opts.firstSheetReserve ?? 0
  rows.forEach((row, i) => {
    const c = cost(row)
    // The closing block has to fit under whichever sheet ends up last.
    const reserve = i === rows.length - 1 ? (opts.lastSheetReserve ?? 0) : 0
    // A single row taller than a whole sheet cannot be split — it goes on its
    // own sheet and is allowed to run over rather than be lost.
    if (sheets[sheets.length - 1].length > 0 && used + c + reserve > budget) {
      sheets.push([])
      used = 0
    }
    sheets[sheets.length - 1].push(row)
    used += c
  })
  return sheets
}

/** One sheet: the statement it belongs to and the transactions printed on it. */
export interface StatementPage {
  statement: Statement
  lines: Line[]
  /** True on the second and later sheets of the same statement. */
  continued: boolean
}

/**
 * Every statement in order, each cut into as many sheets as its transactions
 * need. A statement with no lines still gets its sheet — the header is the
 * document, and an archived statement with a header and no detail rows is a
 * real case the card already renders.
 */
export function paginateStatements(statements: Statement[]): StatementPage[] {
  const pages: StatementPage[] = []
  for (const statement of statements) {
    cutIntoSheets(statement.lines, cost).forEach((lines, i) =>
      pages.push({ statement, lines, continued: i > 0 }))
  }
  return pages
}
