import type {
  HistoricalStatement as Statement,
  HistoricalStatementLine as Line,
  OnlineStatementPage,
  OnlineTransaction,
} from '../api.ts'
import type { Border, Row, RowCell, Sheet, Style } from '../xlsx.ts'
import { excelDate, excelNumber } from '../xlsx.ts'
import { cutIntoSheets, paginateStatements, rowCost, ROW_PADDING } from './statementPages.ts'
import { currencyLabel, monthLabel } from './StatementCard.tsx'
import { bankLogoPng, BANK_LOGO_PNG_HEIGHT, BANK_LOGO_PNG_WIDTH } from './bankLogoPng.ts'
import { formatPdpAccount, todayYyyymmdd } from '../schema/helpers.ts'
import {
  balanceMarker,
  coinDenomination,
  coinPrecision,
  formatGatewayDate,
} from '../gateway.ts'
import { translate, type Locale } from '../i18n/index.ts'

// The statements as a WORKBOOK — the same document the screen shows and the
// printer prints, in Excel.
//
// This is deliberately not a data dump. The statement card is the bank's
// document: the mark in the top corner, the heading with the month, the header
// block naming the customer, branch, IBAN and address, the seven-column
// transaction table, the page footer. An operator who saves the workbook and an
// operator who saves the PDF should be holding the same thing, so the layout
// here follows StatementCard.tsx band for band, in its colours (the light
// theme's, which is what the printed sheet uses whatever the screen is set to).
//
// The PAGINATION is the screen's too, not Excel's. statementPages.ts cuts the
// transactions into sheets so that the "Page N of M" in each footer is true;
// the same cut runs here, each sheet gets a manual page break after it, and the
// workbook prints the same pages as the browser does. A second, independent
// idea of where a page ends would have put a different number in the footer
// than on the paper.
//
// The MERCHANT statement has no export and gets no button: the acquiring system
// sends it as pre-rendered 150-char print lines rather than records, so there
// is no document to rebuild — only a block of text that is already a text file.

// ---------------------------------------------------------------------------
// The screen's palette and type scale
// ---------------------------------------------------------------------------

// index.css, the light theme. Fixed rather than read from the running theme:
// the printed sheet is light whatever the screen is set to (the print rules
// force it), and a workbook exported from dark mode must not come out black.
const INK = 'FF0F172A'
const INK_SOFT = 'FF334155'
const MUTED = 'FF64748B'
const MUTED_SOFT = 'FF94A3B8'
const HEADER_FILL = 'FFF6F8FB'
const EDGE = 'FFE2E8F0'
const EDGE_SOFT = 'FFEEF2F6'

const RULE: Border = { style: 'thin', color: EDGE }
const RULE_SOFT: Border = { style: 'thin', color: EDGE_SOFT }

/** Amounts as the screen renders them — two decimals, three when they are there. */
const AMOUNT = '#,##0.00#'
const DATE = 'dd/mm/yyyy'

/** The em dash the screen puts in an empty debit or credit cell. */
const EMPTY = '—'

const HEAD: Style = {
  bold: true,
  size: 8,
  color: MUTED_SOFT,
  valign: 'bottom',
  bottom: RULE_SOFT,
}
/**
 * The END of the reading direction — right in English, LEFT in Arabic.
 *
 * Excel's horizontal alignment is physical, not logical: a cell set to "right"
 * stays on the right edge even in a right-to-left sheet, where the reading eye
 * finishes on the left. So the mirroring the browser gets for free from
 * `dir="rtl"` and Tailwind's logical utilities has to be spelled out here.
 */
type Align = Style['align']
const endOf = (locale: Locale): Align => (locale === 'ar' ? 'left' : 'right')

const headEnd = (end: Align): Style => ({ ...HEAD, align: end })
const LABEL: Style = { size: 8, color: MUTED_SOFT, fill: HEADER_FILL, valign: 'bottom' }
const VALUE: Style = { size: 9, color: INK_SOFT, fill: HEADER_FILL, valign: 'top' }
const BODY: Style = { size: 9, color: INK_SOFT, valign: 'top', bottom: RULE_SOFT }
const BODY_MUTED: Style = { ...BODY, color: MUTED }
const BODY_DATE: Style = { ...BODY, numFmt: DATE }
const bodyAmount = (end: Align): Style => ({ ...BODY, numFmt: AMOUNT, align: end })
const bodyTextEnd = (end: Align): Style => ({ ...BODY, align: end })
const NARRATIVE: Style = { ...BODY, wrap: true }
const BLOCK: Style = { fill: HEADER_FILL }

/**
 * The running balance's own format: the number, then the DR/CR marker the
 * printed statement carries beside it.
 *
 * Putting the marker in the FORMAT rather than in the text keeps the cell a
 * number — it still adds up, and it still right-aligns with the column above
 * it — while reading exactly as the screen does. The marker is stripped to
 * letters because it goes inside a quoted literal in the format code, and the
 * archive's RUN_BAL_TYPE is not a field anyone has validated.
 */
function balanceFormat(marker: string): string {
  const clean = marker.replace(/[^A-Za-z]/g, '').slice(0, 4)
  return clean ? `${AMOUNT} "${clean}"` : AMOUNT
}

/** The gateway's decimalPlace as a format code: 3 -> '#,##0.000'. */
function gatewayFormat(decimalPlace: string, marker = ''): string {
  const places = coinPrecision(decimalPlace)
  const base = places === 0 ? '#,##0' : `#,##0.${'0'.repeat(places)}`
  const clean = marker.replace(/[^A-Za-z]/g, '').slice(0, 4)
  return clean ? `${base} "${clean}"` : base
}

// ---------------------------------------------------------------------------
// File naming
// ---------------------------------------------------------------------------

/**
 * A file name Windows will accept, from the document's own name and whatever
 * identifies this particular enquiry.
 *
 * The document name is the one the sheet and the print dialog already use, so a
 * saved PDF and a saved workbook of the same enquiry sit next to each other
 * under the same name — which is the whole reason print.ts names the document
 * in the first place.
 */
export function statementFileName(documentName: string, ...parts: string[]): string {
  return [documentName, ...parts.filter((p) => p.trim() !== '')]
    .join(' - ')
    .replace(/[\\/:*?"<>|]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

/** "200901" -> "01-2009", the way the screens' month/year pair reads. */
function periodLabel(yyyymm: string): string {
  return /^\d{6}$/.test(yyyymm) ? `${yyyymm.slice(4, 6)}-${yyyymm.slice(0, 4)}` : yyyymm
}

/** The period both archived-statement screens name their file after. */
export function archivedPeriod(fromYearMonth: string, toYearMonth: string): string {
  return `${periodLabel(fromYearMonth)} to ${periodLabel(toYearMonth)}`
}

// ---------------------------------------------------------------------------
// Laying a card out
// ---------------------------------------------------------------------------

/** Seven columns, the width of the transaction table on both kinds of sheet. */
const WIDTH = 7

/**
 * The sheet under construction: rows, and where the mark has to be dropped.
 *
 * Every card starts with a logo, and a logo is anchored to a ROW NUMBER — which
 * is only known once everything above it has been laid out. So the builder
 * hands out the current row index as it goes rather than the caller counting.
 */
class SheetBuilder {
  readonly rows: Row[] = []
  readonly logoRows: number[] = []
  /** The DOCUMENT's language — the archive's LANG_CODE, not the operator's. */
  readonly locale: Locale
  /** Which side of a cell the reading direction ends on. */
  readonly end: Align

  constructor(locale: Locale) {
    this.locale = locale
    this.end = endOf(locale)
  }

  /** Translated into the document's language rather than the screen's. */
  tr = (key: string, vars?: Record<string, string | number>): string =>
    translate(this.locale, key, vars)

  /** Appends a row and returns its 0-based index. */
  push(cells: RowCell[], height?: number, breakAfter = false): number {
    this.rows.push({ cells, height, breakAfter })
    return this.rows.length - 1
  }

  /** A row of the header block's fill and nothing else. */
  spacer(height = 6, style?: Style): number {
    return this.push([{ value: '', span: WIDTH, style }], height)
  }

  /** Marks the row the mark is drawn over. */
  logoAt(row: number): void {
    this.logoRows.push(row)
  }

  /** The document heading the printed sheet carries above the first card. */
  title(documentName: string): void {
    this.push(
      [{ value: documentName, span: WIDTH, style: { bold: true, size: 14, color: INK } }],
      20,
    )
    this.push([{ value: '', span: WIDTH, style: { bottom: RULE } }], 4)
    this.spacer(6)
  }

  /**
   * The header block's label/value bands, three to a row as the card's grid
   * lays them out.
   *
   * Only filled fields are passed in, exactly as the card renders each band
   * conditionally — an archive that carries no IBAN shows no IBAN heading.
   */
  bands(fields: { label: string; value: string }[]): void {
    const SPANS = [2, 2, 3]
    for (let at = 0; at < fields.length; at += 3) {
      const group = fields.slice(at, at + 3)
      // A short last group takes the width the missing ones would have had,
      // rather than leaving the fill stopping short of the card's right edge.
      const spans = SPANS.slice(0, group.length)
      spans[spans.length - 1] += SPANS.slice(group.length).reduce((n, s) => n + s, 0)
      this.push(
        group.map((f, i) => ({ value: this.tr(f.label), span: spans[i], style: LABEL })),
        12,
      )
      this.push(
        group.map((f, i) => ({ value: f.value, span: spans[i], style: VALUE })),
        14,
      )
    }
  }

  /** The transaction table's column headings. */
  tableHead(headings: string[], numeric: number[]): void {
    this.push(
      headings.map((h, i) => ({
        value: this.tr(h),
        style: numeric.includes(i) ? headEnd(this.end) : HEAD,
      })),
      16,
    )
  }

  /**
   * Closes a card: the gap after it, and the page break.
   *
   * NO "Page N of M" here, though the screen and the printed sheet both carry
   * one at this exact spot. On paper that number is the reader's only way to
   * order a dropped pile, and it is true because the rows were dealt into
   * sheets before printing. A workbook is not read that way — it scrolls, the
   * reader is never holding sheet 3 of 12 wondering where it goes, and a stray
   * "Page 3 of 12" halfway down a spreadsheet reads as data. The cut itself is
   * still the screen's, so PRINTING the workbook still produces the same pages;
   * only the caption is dropped.
   */
  endCard(): void {
    // The gap belongs to the page that is ending, so the break goes below it.
    this.push([{ value: '', span: WIDTH }], 8, true)
  }

  sheet(name: string, columns: number[]): Sheet {
    const png = bankLogoPng()
    return {
      name,
      columns,
      // Excel's own mirroring: the columns run right-to-left, so an Arabic
      // statement opens laid out the way its printed counterpart is.
      rightToLeft: this.locale === 'ar',
      rows: this.rows,
      images: this.logoRows.map((row) => ({
        png,
        col: 0,
        row,
        width: BANK_LOGO_PNG_WIDTH,
        height: BANK_LOGO_PNG_HEIGHT,
        offsetX: 5,
        offsetY: 4,
      })),
      hideGridLines: true,
    }
  }
}

/** The filled lines of a stacked field, as one wrapped cell. */
function stacked(...lines: string[]): string {
  return lines.map((n) => n.trim()).filter((n) => n !== '').join('\n')
}

// ---------------------------------------------------------------------------
// The archived statements — Historical (BM) and PDP
// ---------------------------------------------------------------------------

/** The seven columns of the archived statement's table. */
const ARCHIVED_COLUMNS = [13, 13, 44, 10, 15, 15, 17]

function addressOf(s: Statement): string {
  return [s.custAdr1, s.custAdr2, s.custAdr3, s.custAdr4]
    .map((l) => l.trim())
    .filter((l) => l !== '')
    .join(', ')
}

/** The card's header block: the same fields, in the card's own order. */
function archivedFields(s: Statement): { label: string; value: string }[] {
  const fields = [
    {
      label: 'Customer',
      value: s.custName
        ? s.custNum
          ? `${s.custName} (${s.custNum})`
          : s.custName
        : EMPTY,
    },
    { label: 'Branch', value: s.branchName ? `${s.branchCode} — ${s.branchName}` : s.branchCode },
  ]
  if (s.iban) fields.push({ label: 'IBAN', value: s.iban })
  if (s.refNum) fields.push({ label: 'Reference', value: s.refNum })
  const address = addressOf(s)
  if (address) fields.push({ label: 'Address', value: address })
  return fields
}

/** One statement's card: the header block and its transactions. */
function archivedCard(
  build: SheetBuilder,
  s: Statement,
  lines: Line[],
  continued: boolean,
): void {
  // The heading row. The mark rides in it, at the left, exactly where the card
  // puts it — column A is the Date column and wide enough to hold it.
  const heading =
    build.tr('Statement for {month}', { month: monthLabel(s.stmtDate, build.locale) }) +
    (s.stmtNum ? `   ${build.tr('No. {stmtNum}', { stmtNum: s.stmtNum })}` : '') +
    (continued ? `   ${build.tr('(continued)')}` : '')
  const headingRow = build.push(
    [
      { value: '', style: BLOCK },
      { value: heading, span: 3, style: { bold: true, size: 12, color: INK, fill: HEADER_FILL, valign: 'center' } },
      {
        value: build.tr('Statement Date'),
        span: 2,
        style: { ...LABEL, align: build.end, valign: 'center' },
      },
      {
        value: excelDate(todayYyyymmdd()),
        style: {
          size: 9,
          bold: true,
          color: INK,
          fill: HEADER_FILL,
          align: build.end,
          valign: 'center',
          numFmt: DATE,
        },
      },
    ],
    24,
  )
  build.logoAt(headingRow)

  // PDP's 19-digit account is grouped the way the card groups it; BM's 14 keep
  // their stored form.
  const account = s.source === 'PDP' ? formatPdpAccount(s.acctNum) : s.acctNum
  const subheading = [
    account,
    s.acctType && build.tr(s.acctType),
    s.crncy && currencyLabel(s.crncy, build.locale),
  ]
    .filter(Boolean)
    .join(' · ')
  build.push(
    [
      { value: '', style: BLOCK },
      { value: subheading, span: 3, style: { size: 9, color: MUTED, fill: HEADER_FILL } },
      {
        // pageCount, not pageNum — see the note in StatementCard: the archive's
        // own PAGE_NUM reads 1 on every folded statement.
        value: s.pageCount > 1 ? build.tr('{pages} printed pages', { pages: s.pageCount }) : '',
        span: 3,
        style: { ...LABEL, align: build.end },
      },
    ],
    14,
  )
  build.spacer(4, BLOCK)
  build.bands(archivedFields(s))
  build.spacer(6, { ...BLOCK, bottom: RULE })

  build.tableHead(
    ['Date', 'Value Date', 'Narrative', 'Branch', 'Debit', 'Credit', 'Balance'],
    [4, 5, 6],
  )

  if (lines.length === 0) {
    build.push(
      [
        {
          value: build.tr('This statement has a header but no transaction lines in the archive.'),
          span: WIDTH,
          style: { size: 9, color: MUTED, bottom: RULE_SOFT },
        },
      ],
      18,
    )
  }

  for (const line of lines) {
    const narrative = stacked(line.narrative1, line.narrative2, line.narrative3, line.narrative4)
    build.push(
      [
        { value: excelDate(line.txnDate), style: BODY_DATE },
        { value: excelDate(line.valueDate), style: { ...BODY_DATE, color: MUTED } },
        { value: narrative || EMPTY, style: NARRATIVE },
        { value: line.txnBranchCode, style: BODY_MUTED },
        {
          value: excelNumber(line.drAmt) === '' ? EMPTY : excelNumber(line.drAmt),
          style: excelNumber(line.drAmt) === '' ? bodyTextEnd(build.end) : bodyAmount(build.end),
        },
        {
          value: excelNumber(line.crAmt) === '' ? EMPTY : excelNumber(line.crAmt),
          style: excelNumber(line.crAmt) === '' ? bodyTextEnd(build.end) : bodyAmount(build.end),
        },
        {
          value: excelNumber(line.runBal),
          style: {
            ...BODY,
            bold: true,
            color: INK,
            align: build.end,
            numFmt: balanceFormat(line.runBalType),
          },
        },
      ],
      // Room for the narrative's stacked lines, which is what makes a row tall.
      Math.max(15, 11 * narrative.split('\n').length + 4),
    )
  }

  build.endCard()
}

/** Every statement on screen, cut into the same sheets the screen shows. */
export function archivedStatementSheet(
  statements: Statement[],
  documentName: string,
  /** The document's own language (statementLocale.ts), not the operator's. */
  locale: Locale,
): Sheet {
  const build = new SheetBuilder(locale)
  build.title(documentName)
  for (const sheet of paginateStatements(statements)) {
    archivedCard(build, sheet.statement, sheet.lines, sheet.continued)
  }
  return build.sheet(documentName, ARCHIVED_COLUMNS)
}

// ---------------------------------------------------------------------------
// The on-demand statement — the online gateway
// ---------------------------------------------------------------------------

/** The seven columns of the on-demand statement's table. */
const ONLINE_COLUMNS = [11, 13, 42, 13, 15, 15, 17]

/**
 * One row of the on-demand statement: the same shape the screen carries down
 * the page, with the running balance it computed.
 *
 * Declared structurally rather than imported from the screen, so this module
 * depends on nothing that renders.
 */
export interface OnlineRow {
  txn: OnlineTransaction
  credit: boolean
  /** Minor units, as the gateway sends them. */
  minor: number
  balanceMinor: number
}

/**
 * The on-demand statement as the screen shows it: one card per sheet, opened by
 * the brought forward line and closed by the movement totals.
 *
 * The screen's own cut is reused (statementPages.ts, with the same reserves for
 * those two blocks) so the page numbers in the footers are the page numbers the
 * workbook prints.
 */
export function onlineStatementSheet(
  page: OnlineStatementPage,
  rows: OnlineRow[],
  documentName: string,
  /**
   * The OPERATOR's locale, unlike the archived sheets'. This statement is
   * produced now rather than recovered, so it is in the language of the person
   * asking for it — the same language the screen it came off was in.
   */
  locale: Locale,
): Sheet {
  const build = new SheetBuilder(locale)
  const dp = page.decimalPlace || '3'
  const major = (minor: number) => minor / coinDenomination(dp)
  const amountStyle: Style = { ...BODY, numFmt: gatewayFormat(dp), align: build.end }

  const sheets = cutIntoSheets(
    rows,
    (r) => rowCost([r.txn.narrative1, r.txn.narrative2, r.txn.narrative3]),
    {
      firstSheetReserve: 1 + ROW_PADDING, // brought forward
      lastSheetReserve: 2 * (1 + ROW_PADDING) + 1, // two totals rows and the rule
    },
  )

  // "Value of Movements" and "Number of Movements", as the screen totals them.
  const totals = rows.reduce(
    (acc, r) => ({
      debit: acc.debit + (r.credit ? 0 : r.minor),
      credit: acc.credit + (r.credit ? r.minor : 0),
      debitCount: acc.debitCount + (r.credit ? 0 : 1),
      creditCount: acc.creditCount + (r.credit ? 1 : 0),
    }),
    { debit: 0, credit: 0, debitCount: 0, creditCount: 0 },
  )

  build.title(documentName)

  sheets.forEach((sheetRows, i) => {
    const first = i === 0
    const last = i === sheets.length - 1

    const headingRow = build.push(
      [
        { value: '', style: BLOCK },
        {
          value: build.tr('ON DEMAND STATEMENT') + (first ? '' : `   ${build.tr('(continued)')}`),
          span: 3,
          style: { bold: true, size: 12, color: INK, fill: HEADER_FILL, valign: 'center' },
        },
        {
          value: build.tr('Statement Date'),
          span: 2,
          style: { ...LABEL, align: build.end, valign: 'center' },
        },
        {
          value: excelDate(todayYyyymmdd()),
          style: {
            size: 9,
            bold: true,
            color: INK,
            fill: HEADER_FILL,
            align: build.end,
            valign: 'center',
            numFmt: DATE,
          },
        },
      ],
      24,
    )
    build.logoAt(headingRow)

    build.push(
      [
        { value: '', style: BLOCK },
        {
          // The screen's own line, verbatim — "to" is not a caption, it is
          // the join between two dates, and the screen does not translate it.
          value:
            `${page.branchName} · ${formatGatewayDate(page.fromDate)}` +
            ` to ${formatGatewayDate(page.toDate)}`,
          span: 6,
          style: { size: 9, color: MUTED, fill: HEADER_FILL },
        },
      ],
      14,
    )
    build.push(
      [
        { value: '', style: BLOCK },
        {
          value: `${page.custName} — ${page.address}`,
          span: 6,
          style: { size: 9, color: INK_SOFT, fill: HEADER_FILL },
        },
      ],
      14,
    )
    build.spacer(6, { ...BLOCK, bottom: RULE })

    build.tableHead(
      ['Tlr Id', 'Trans. Date', 'Particulars', 'Value Date', 'Debit', 'Credit', 'Balance'],
      [4, 5, 6],
    )

    if (first) {
      const bf = Number(page.bfBalance) || 0
      build.push(
        [
          { value: EMPTY, style: BODY_MUTED },
          { value: excelDate(page.fromDate), style: { ...BODY_DATE, color: MUTED } },
          { value: build.tr('Balance Brought Forward'), span: 3, style: { ...BODY, bold: true } },
          { value: '', style: BODY },
          {
            value: major(Math.abs(bf)),
            style: {
              ...BODY,
              bold: true,
              color: INK,
              align: build.end,
              numFmt: gatewayFormat(dp, balanceMarker(bf)),
            },
          },
        ],
        15,
      )
    }

    for (const r of sheetRows) {
      const narrative = stacked(r.txn.narrative1, r.txn.narrative2, r.txn.narrative3)
      build.push(
        [
          { value: r.txn.userId, style: BODY_MUTED },
          { value: excelDate(r.txn.postDate), style: BODY_DATE },
          { value: narrative, style: NARRATIVE },
          { value: excelDate(r.txn.valueDate), style: { ...BODY_DATE, color: MUTED } },
          {
            value: r.credit ? EMPTY : major(r.minor),
            style: r.credit ? bodyTextEnd(build.end) : amountStyle,
          },
          {
            value: r.credit ? major(r.minor) : EMPTY,
            style: r.credit ? amountStyle : bodyTextEnd(build.end),
          },
          {
            value: major(Math.abs(r.balanceMinor)),
            style: {
              ...BODY,
              bold: true,
              color: INK,
              align: build.end,
              numFmt: gatewayFormat(dp, balanceMarker(r.balanceMinor)),
            },
          },
        ],
        Math.max(15, 11 * Math.max(narrative.split('\n').length, 1) + 4),
      )
    }

    // The totals close the statement, so they print under the LAST sheet only —
    // the cut above kept a place for them there.
    if (last) {
      const totalStyle: Style = {
        size: 9,
        bold: true,
        color: INK,
        align: build.end,
        numFmt: gatewayFormat(dp),
        top: { style: 'medium', color: EDGE },
      }
      const totalLabel: Style = {
        size: 8,
        color: MUTED_SOFT,
        top: { style: 'medium', color: EDGE },
      }
      build.push(
        [
          { value: build.tr('Value of Movements'), span: 4, style: totalLabel },
          { value: major(totals.debit), style: totalStyle },
          { value: major(totals.credit), style: totalStyle },
          { value: '', style: { top: { style: 'medium', color: EDGE } } },
        ],
        16,
      )
      build.push(
        [
          { value: build.tr('Number of Movements'), span: 4, style: { size: 8, color: MUTED_SOFT } },
          { value: totals.debitCount, style: { size: 9, color: INK_SOFT, align: build.end } },
          { value: totals.creditCount, style: { size: 9, color: INK_SOFT, align: build.end } },
          '',
        ],
        15,
      )
    }

    build.endCard()
  })

  return build.sheet(documentName, ONLINE_COLUMNS)
}
