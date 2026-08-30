// Writing a real .xlsx, without a library.
//
// The statement screens export the statement as a WORKBOOK, and the workbook is
// the same document as the printed sheet: the mark in the corner, the header
// block, the transaction table, the page footer. So this is not a table writer
// with a bold first row — it is enough of OOXML to lay a document out: styles
// per cell, merged spans, an embedded image, and the page breaks that put one
// statement on one printed page.
//
// It is hand-written rather than pulled from npm because of what an .xlsx
// actually is: a ZIP of a few small XML parts. SheetJS and exceljs each cost
// around a megabyte, this app's whole runtime dependency list is React and
// Tailwind, and the UI bundle is packaged INTO the api jar — so a megabyte of
// spreadsheet library would ride along in every deployment.
//
// The parts written here are the minimum Excel will open, plus the drawing:
//
//   [Content_Types].xml            what each part is
//   _rels/.rels                    the package points at the workbook
//   xl/workbook.xml                the workbook names its one sheet
//   xl/_rels/workbook.xml.rels     the workbook points at the sheet and styles
//   xl/styles.xml                  every distinct cell style, deduplicated
//   xl/worksheets/sheet1.xml       the cells
//   xl/worksheets/_rels/…          the sheet points at its drawing
//   xl/drawings/drawing1.xml       where each image sits
//   xl/drawings/_rels/…            the drawing points at the image bytes
//   xl/media/imageN.png            the image itself
//
// Strings are written INLINE (t="inlineStr") rather than through a
// sharedStrings part. Shared strings exist to deduplicate repeated text, which
// is a real saving on a sheet of categories and next to none on a statement,
// and skipping it removes a whole part and its cross-references.

// ---------------------------------------------------------------------------
// The document model
// ---------------------------------------------------------------------------

/** A cell's value: a number (formatted by its style), a string, or nothing. */
export type CellValue = string | number | null | undefined

export interface Border {
  style?: 'thin' | 'medium' | 'double'
  /** ARGB, e.g. 'FFE5E7EB'. */
  color?: string
}

/**
 * How one cell looks. Every distinct combination becomes one entry in
 * styles.xml, so callers describe the look they want and never count indices.
 */
export interface Style {
  bold?: boolean
  /** Points. Excel's own default is 11. */
  size?: number
  /** ARGB text colour. */
  color?: string
  /** ARGB solid fill. */
  fill?: string
  /** Excel number format code — 'dd/mm/yyyy', '#,##0.00#'. */
  numFmt?: string
  align?: 'left' | 'center' | 'right'
  valign?: 'top' | 'center' | 'bottom'
  wrap?: boolean
  top?: Border
  bottom?: Border
  left?: Border
  right?: Border
}

export interface Cell {
  value?: CellValue
  style?: Style
  /** Columns this cell occupies. Anything above 1 is written as a merge. */
  span?: number
}

/** A bare value is a cell with no style — the common case, kept short. */
export type RowCell = Cell | CellValue

export interface Row {
  cells: RowCell[]
  /** Height in points. Omitted lets Excel size the row to its content. */
  height?: number
  /** Start a new printed page after this row. */
  breakAfter?: boolean
}

export interface SheetImage {
  png: Uint8Array
  /** 0-based cell the image is anchored to. */
  col: number
  row: number
  /** Display size in pixels. */
  width: number
  height: number
  /** Nudge from the anchor cell's top-left corner, in pixels. */
  offsetX?: number
  offsetY?: number
}

export interface Sheet {
  /** Tab name. Trimmed to Excel's 31 characters and stripped of []:*?/\ */
  name: string
  /** Column widths, left to right, in Excel's character units. */
  columns: number[]
  rows: Row[]
  images?: SheetImage[]
  /**
   * Hide the grid. A statement is a document, and the ruled grid behind it is
   * the one thing that would say "spreadsheet" louder than the layout says
   * "statement".
   */
  hideGridLines?: boolean
  landscape?: boolean
}

// ---------------------------------------------------------------------------
// Values
// ---------------------------------------------------------------------------

/**
 * An archival YYYYMMDD as an Excel serial date — or the string back untouched
 * when it is not one, which is how a blank or a malformed archival date
 * survives into the sheet instead of becoming a wrong day in 1900.
 *
 * A real serial is what makes the cell a DATE: it prints in the sheet's own
 * dd/mm/yyyy the way the screen shows it, and it still sorts and filters as a
 * date if the operator ever wants that.
 *
 * The epoch is 1899-12-30, not the 1900-01-01 the format nominally counts from:
 * Excel inherited Lotus 1-2-3's belief that 1900 was a leap year, so every date
 * after February 1900 sits one day further along than the true count. Moving
 * the epoch back two days absorbs both that phantom day and the 1-based count.
 *
 * Built in UTC so a machine west of Greenwich does not land the midnight on the
 * day before.
 */
export function excelDate(yyyymmdd: unknown): number | string {
  const v = String(yyyymmdd ?? '').trim()
  if (!/^\d{8}$/.test(v)) return v
  const ms = Date.UTC(Number(v.slice(0, 4)), Number(v.slice(4, 6)) - 1, Number(v.slice(6, 8)))
  return Math.round(ms / 86_400_000) + 25_569
}

/**
 * A decimal string as a number Excel can add up — or the string, if it is not
 * one. The archive's CR_AMT/DR_AMT/RUN_BAL are plain Oracle decimals (see
 * formatPlainAmount), so this is a Number() and not the overpunch decoder.
 */
export function excelNumber(value: unknown): number | string {
  const raw = String(value ?? '').trim()
  if (raw === '') return ''
  const n = Number(raw)
  return Number.isNaN(n) ? raw : n
}

// ---------------------------------------------------------------------------
// XML
// ---------------------------------------------------------------------------

const XML_DECL = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'

/**
 * The characters XML 1.0 has no representation for at all, dropped.
 *
 * This is not defensive tidying. These rows come from a mainframe archive over
 * fixed-width fields, a stray NUL or form feed inside a narrative is entirely
 * possible, and one of them makes the whole workbook unopenable — Excel reports
 * "unreadable content" and names no part, so the cause would have to be found
 * by hand. Tab, newline and carriage return stay: a stacked narrative is one
 * cell with newlines in it.
 */
function stripForbidden(value: string): string {
  let out = ''
  for (const ch of value) {
    const code = ch.charCodeAt(0)
    if (code < 32 && code !== 9 && code !== 10 && code !== 13) continue
    out += ch
  }
  return out
}

function xmlText(value: string): string {
  return stripForbidden(value)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
}

/** 0 -> A, 25 -> Z, 26 -> AA. */
function columnLetter(index: number): string {
  let out = ''
  let n = index
  do {
    out = String.fromCharCode(65 + (n % 26)) + out
    n = Math.floor(n / 26) - 1
  } while (n >= 0)
  return out
}

// ---------------------------------------------------------------------------
// Styles
// ---------------------------------------------------------------------------

/**
 * The style table, built by asking for looks and getting indices back.
 *
 * Fonts, fills, borders and number formats are each deduplicated separately
 * before the cell formats that combine them, because that is how styles.xml is
 * shaped — a cellXf refers to the four by index. A statement uses perhaps a
 * dozen distinct looks across thousands of cells, so the table stays tiny
 * however long the report is.
 */
class StyleTable {
  private numFmts: string[] = []
  private fonts: string[] = ['<font><sz val="11"/><name val="Calibri"/></font>']
  // Excel requires the first two fills to be none and gray125, in that order,
  // whether or not anything uses them.
  private fills: string[] = [
    '<fill><patternFill patternType="none"/></fill>',
    '<fill><patternFill patternType="gray125"/></fill>',
  ]
  private borders: string[] = ['<border><left/><right/><top/><bottom/><diagonal/></border>']
  private xfs: string[] = ['<xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>']

  private static intern(list: string[], xml: string): number {
    const at = list.indexOf(xml)
    return at < 0 ? list.push(xml) - 1 : at
  }

  /** The cellXfs index for `style`, registering whatever it needs on the way. */
  indexOf(style: Style | undefined): number {
    if (!style) return 0

    // Number format ids below 164 are reserved for Excel's built-ins, so a
    // custom code takes the next id after those.
    const numFmtId = style.numFmt ? 164 + StyleTable.intern(this.numFmts, style.numFmt) : 0

    const font =
      '<font>' +
      (style.bold ? '<b/>' : '') +
      `<sz val="${style.size ?? 11}"/>` +
      (style.color ? `<color rgb="${style.color}"/>` : '') +
      '<name val="Calibri"/>' +
      '</font>'
    const fontId = StyleTable.intern(this.fonts, font)

    const fillId = style.fill
      ? StyleTable.intern(
          this.fills,
          `<fill><patternFill patternType="solid"><fgColor rgb="${style.fill}"/>` +
            '<bgColor indexed="64"/></patternFill></fill>',
        )
      : 0

    const side = (name: string, border: Border | undefined) =>
      border?.style
        ? `<${name} style="${border.style}"><color rgb="${border.color ?? 'FF000000'}"/></${name}>`
        : `<${name}/>`
    const borderXml =
      '<border>' +
      side('left', style.left) +
      side('right', style.right) +
      side('top', style.top) +
      side('bottom', style.bottom) +
      '<diagonal/>' +
      '</border>'
    const borderId = StyleTable.intern(this.borders, borderXml)

    const alignment =
      style.align || style.valign || style.wrap
        ? '<alignment' +
          (style.align ? ` horizontal="${style.align}"` : '') +
          (style.valign ? ` vertical="${style.valign}"` : '') +
          (style.wrap ? ' wrapText="1"' : '') +
          '/>'
        : ''

    const xf =
      `<xf numFmtId="${numFmtId}" fontId="${fontId}" fillId="${fillId}" borderId="${borderId}"` +
      ' xfId="0"' +
      (numFmtId ? ' applyNumberFormat="1"' : '') +
      (fontId ? ' applyFont="1"' : '') +
      (fillId ? ' applyFill="1"' : '') +
      (borderId ? ' applyBorder="1"' : '') +
      (alignment ? ' applyAlignment="1">' + alignment + '</xf>' : '/>')
    return StyleTable.intern(this.xfs, xf)
  }

  xml(): string {
    const numFmts = this.numFmts
      .map((code, i) => `<numFmt numFmtId="${164 + i}" formatCode="${xmlText(code)}"/>`)
      .join('')
    return (
      XML_DECL +
      '<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">' +
      (numFmts ? `<numFmts count="${this.numFmts.length}">${numFmts}</numFmts>` : '') +
      `<fonts count="${this.fonts.length}">${this.fonts.join('')}</fonts>` +
      `<fills count="${this.fills.length}">${this.fills.join('')}</fills>` +
      `<borders count="${this.borders.length}">${this.borders.join('')}</borders>` +
      '<cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>' +
      `<cellXfs count="${this.xfs.length}">${this.xfs.join('')}</cellXfs>` +
      '<cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>' +
      '</styleSheet>'
    )
  }
}

// ---------------------------------------------------------------------------
// The sheet
// ---------------------------------------------------------------------------

function cellXml(ref: string, value: CellValue, styleId: number): string {
  const s = styleId ? ` s="${styleId}"` : ''
  if (value === null || value === undefined || value === '') return `<c r="${ref}"${s}/>`
  if (typeof value === 'number' && Number.isFinite(value)) {
    return `<c r="${ref}"${s}><v>${value}</v></c>`
  }
  // xml:space="preserve", because fixed-width archival fields arrive padded and
  // a narrative that begins with its own indentation should keep it.
  return (
    `<c r="${ref}"${s} t="inlineStr"><is><t xml:space="preserve">` +
    `${xmlText(String(value))}</t></is></c>`
  )
}

const asCell = (cell: RowCell): Cell =>
  cell !== null && typeof cell === 'object' ? cell : { value: cell }

/** Pixels to EMU, the unit OOXML drawings measure in. */
const EMU = 9525

function buildSheet(sheet: Sheet, styles: StyleTable, hasDrawing: boolean): string {
  const width = Math.max(sheet.columns.length, 1)
  const lastColumn = columnLetter(width - 1)
  const merges: string[] = []
  const breaks: number[] = []

  const rowsXml = sheet.rows
    .map((row, r) => {
      let column = 0
      const cells = row.cells
        .map((raw) => {
          const cell = asCell(raw)
          const span = Math.max(cell.span ?? 1, 1)
          const ref = `${columnLetter(column)}${r + 1}`
          const styleId = styles.indexOf(cell.style)
          // The cells a merge covers still have to be written, and written with
          // the SAME style: Excel draws a merged range's fill and borders from
          // every cell in it, not from the top-left one, so leaving them out
          // gives a merged heading a fill that stops a third of the way across.
          let xml = cellXml(ref, cell.value, styleId)
          for (let i = 1; i < span; i += 1) {
            xml += cellXml(`${columnLetter(column + i)}${r + 1}`, '', styleId)
          }
          if (span > 1) merges.push(`${ref}:${columnLetter(column + span - 1)}${r + 1}`)
          column += span
          return xml
        })
        .join('')
      if (row.breakAfter) breaks.push(r + 1)
      const attrs =
        `<row r="${r + 1}"` + (row.height ? ` ht="${row.height}" customHeight="1"` : '') + '>'
      return `${attrs}${cells}</row>`
    })
    .join('')

  const cols = sheet.columns
    .map((w, i) => `<col min="${i + 1}" max="${i + 1}" width="${w}" customWidth="1"/>`)
    .join('')

  const mergeXml = merges.length
    ? `<mergeCells count="${merges.length}">` +
      merges.map((ref) => `<mergeCell ref="${ref}"/>`).join('') +
      '</mergeCells>'
    : ''

  // A break on the last row would only add a trailing blank page.
  const pageBreaks = breaks.filter((r) => r < sheet.rows.length)
  const breakXml = pageBreaks.length
    ? `<rowBreaks count="${pageBreaks.length}" manualBreakCount="${pageBreaks.length}">` +
      pageBreaks.map((r) => `<brk id="${r}" max="16383" man="1"/>`).join('') +
      '</rowBreaks>'
    : ''

  // The element order below is the schema's, not a preference: sheetPr,
  // dimension, sheetViews, sheetFormatPr, cols, sheetData, mergeCells,
  // pageMargins, pageSetup, rowBreaks, drawing. Excel rejects the part outright
  // if any two are transposed.
  return (
    XML_DECL +
    '<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"' +
    ' xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">' +
    '<sheetPr><pageSetUpPr fitToPage="1"/></sheetPr>' +
    `<dimension ref="A1:${lastColumn}${Math.max(sheet.rows.length, 1)}"/>` +
    '<sheetViews><sheetView' +
    (sheet.hideGridLines ? ' showGridLines="0"' : '') +
    ' workbookViewId="0"><selection activeCell="A1" sqref="A1"/></sheetView></sheetViews>' +
    '<sheetFormatPr defaultRowHeight="15"/>' +
    (cols ? `<cols>${cols}</cols>` : '') +
    `<sheetData>${rowsXml}</sheetData>` +
    mergeXml +
    '<pageMargins left="0.4" right="0.4" top="0.5" bottom="0.5" header="0.3" footer="0.3"/>' +
    // A4, scaled to the page WIDTH so the transaction table never spills a
    // column onto a sheet of its own. fitToHeight="0" leaves the height alone,
    // because the row breaks above already decide where each page ends — the
    // same decision .print-per-page makes for the browser's print.
    '<pageSetup paperSize="9" fitToWidth="1" fitToHeight="0"' +
    ` orientation="${sheet.landscape ? 'landscape' : 'portrait'}"/>` +
    breakXml +
    (hasDrawing ? '<drawing r:id="rId1"/>' : '') +
    '</worksheet>'
  )
}

/**
 * The drawing part: where each image sits and how big it is.
 *
 * `relIds` is one relationship id per image, and several anchors normally share
 * one — a statement pack draws the SAME mark at the head of every card, and
 * embedding it once per card would put sixty copies of it in a sixty-page
 * export.
 */
function buildDrawing(images: SheetImage[], relIds: number[]): string {
  const anchors = images
    .map((image, i) => {
      const cx = Math.round(image.width * EMU)
      const cy = Math.round(image.height * EMU)
      // oneCellAnchor, not twoCell: the mark keeps the size it is given instead
      // of stretching with whatever cells happen to be under it.
      return (
        '<xdr:oneCellAnchor>' +
        '<xdr:from>' +
        `<xdr:col>${image.col}</xdr:col>` +
        `<xdr:colOff>${Math.round((image.offsetX ?? 0) * EMU)}</xdr:colOff>` +
        `<xdr:row>${image.row}</xdr:row>` +
        `<xdr:rowOff>${Math.round((image.offsetY ?? 0) * EMU)}</xdr:rowOff>` +
        '</xdr:from>' +
        `<xdr:ext cx="${cx}" cy="${cy}"/>` +
        '<xdr:pic>' +
        '<xdr:nvPicPr>' +
        `<xdr:cNvPr id="${i + 2}" name="Picture ${i + 1}"/>` +
        '<xdr:cNvPicPr><a:picLocks noChangeAspect="1"/></xdr:cNvPicPr>' +
        '</xdr:nvPicPr>' +
        '<xdr:blipFill>' +
        '<a:blip xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"' +
        ` r:embed="rId${relIds[i]}"/>` +
        '<a:stretch><a:fillRect/></a:stretch>' +
        '</xdr:blipFill>' +
        '<xdr:spPr>' +
        `<a:xfrm><a:off x="0" y="0"/><a:ext cx="${cx}" cy="${cy}"/></a:xfrm>` +
        '<a:prstGeom prst="rect"><a:avLst/></a:prstGeom>' +
        '</xdr:spPr>' +
        '</xdr:pic>' +
        '<xdr:clientData/>' +
        '</xdr:oneCellAnchor>'
      )
    })
    .join('')
  return (
    XML_DECL +
    '<xdr:wsDr xmlns:xdr="http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing"' +
    ' xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">' +
    anchors +
    '</xdr:wsDr>'
  )
}

/** Excel's tab-name rules: 31 characters, and none of []:*?/\ */
function sheetName(name: string): string {
  const clean = name.replace(/[[\]:*?/\\]/g, ' ').replace(/\s+/g, ' ').trim()
  return (clean || 'Sheet1').slice(0, 31)
}

// ---------------------------------------------------------------------------
// ZIP
// ---------------------------------------------------------------------------

const CRC_TABLE = (() => {
  const table = new Uint32Array(256)
  for (let i = 0; i < 256; i += 1) {
    let c = i
    for (let k = 0; k < 8; k += 1) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1
    table[i] = c >>> 0
  }
  return table
})()

function crc32(bytes: Uint8Array): number {
  let c = 0xffffffff
  for (let i = 0; i < bytes.length; i += 1) c = CRC_TABLE[(c ^ bytes[i]) & 0xff] ^ (c >>> 8)
  return (c ^ 0xffffffff) >>> 0
}

/**
 * Deflated, when the browser can.
 *
 * CompressionStream is in every browser this app supports, but it is asked
 * rather than assumed, and a refusal simply stores the part instead — both are
 * valid ZIP, and Excel opens either. It is worth the two branches: a year of one
 * account's statements is several megabytes of XML stored and a few hundred
 * kilobytes deflated, which is the difference between a download that looks
 * broken and one that does not.
 */
async function deflate(bytes: Uint8Array): Promise<{ data: Uint8Array; method: number }> {
  if (typeof CompressionStream === 'undefined') return { data: bytes, method: 0 }
  try {
    const stream = new Blob([bytes as BlobPart])
      .stream()
      .pipeThrough(new CompressionStream('deflate-raw'))
    const data = new Uint8Array(await new Response(stream).arrayBuffer())
    return { data, method: 8 }
  } catch {
    return { data: bytes, method: 0 }
  }
}

interface ZipEntry {
  name: string
  /** Stored or deflated, per `method`. */
  data: Uint8Array
  method: number
  /** CRC and length of the UNCOMPRESSED part, which is what the headers carry. */
  crc: number
  size: number
}

/** The parts as one ZIP: local headers, then a central directory, then the EOCD. */
function zipBytes(entries: ZipEntry[]): Uint8Array {
  const encoder = new TextEncoder()
  const names = entries.map((e) => encoder.encode(e.name))
  const localSize = entries.reduce((n, e, i) => n + 30 + names[i].length + e.data.length, 0)
  const centralSize = entries.reduce((n, _, i) => n + 46 + names[i].length, 0)
  const out = new Uint8Array(localSize + centralSize + 22)
  const view = new DataView(out.buffer)

  // One fixed timestamp for every part rather than the clock: nothing reads it,
  // and a constant makes the same statement export byte-identical twice over,
  // which is what lets one be diffed against another. 1 January 2020, in the
  // DOS packing ZIP has always used — year from 1980, seconds in units of two.
  const dosTime = 0
  const dosDate = ((2020 - 1980) << 9) | (1 << 5) | 1

  const offsets: number[] = []
  let at = 0
  entries.forEach((entry, i) => {
    offsets.push(at)
    view.setUint32(at, 0x04034b50, true)
    view.setUint16(at + 4, 20, true) // version needed
    view.setUint16(at + 6, 0, true) // flags
    view.setUint16(at + 8, entry.method, true)
    view.setUint16(at + 10, dosTime, true)
    view.setUint16(at + 12, dosDate, true)
    view.setUint32(at + 14, entry.crc, true)
    view.setUint32(at + 18, entry.data.length, true) // compressed
    view.setUint32(at + 22, entry.size, true) // uncompressed
    view.setUint16(at + 26, names[i].length, true)
    view.setUint16(at + 28, 0, true) // extra
    out.set(names[i], at + 30)
    out.set(entry.data, at + 30 + names[i].length)
    at += 30 + names[i].length + entry.data.length
  })

  const centralStart = at
  entries.forEach((entry, i) => {
    view.setUint32(at, 0x02014b50, true)
    view.setUint16(at + 4, 20, true) // version made by
    view.setUint16(at + 6, 20, true) // version needed
    view.setUint16(at + 8, 0, true)
    view.setUint16(at + 10, entry.method, true)
    view.setUint16(at + 12, dosTime, true)
    view.setUint16(at + 14, dosDate, true)
    view.setUint32(at + 16, entry.crc, true)
    view.setUint32(at + 20, entry.data.length, true)
    view.setUint32(at + 24, entry.size, true)
    view.setUint16(at + 28, names[i].length, true)
    view.setUint16(at + 30, 0, true) // extra
    view.setUint16(at + 32, 0, true) // comment
    view.setUint16(at + 34, 0, true) // disk
    view.setUint16(at + 36, 0, true) // internal attrs
    view.setUint32(at + 38, 0, true) // external attrs
    view.setUint32(at + 42, offsets[i], true)
    out.set(names[i], at + 46)
    at += 46 + names[i].length
  })

  view.setUint32(at, 0x06054b50, true)
  view.setUint16(at + 4, 0, true)
  view.setUint16(at + 6, 0, true)
  view.setUint16(at + 8, entries.length, true)
  view.setUint16(at + 10, entries.length, true)
  view.setUint32(at + 12, at - centralStart, true)
  view.setUint32(at + 16, centralStart, true)
  view.setUint16(at + 20, 0, true)

  return out
}

// ---------------------------------------------------------------------------
// The workbook
// ---------------------------------------------------------------------------

const RELS_NS = 'http://schemas.openxmlformats.org/package/2006/relationships'
const DOC_RELS = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships'
const SML = 'application/vnd.openxmlformats-officedocument.spreadsheetml'

function contentTypes(hasDrawing: boolean): string {
  return (
    XML_DECL +
    '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">' +
    '<Default Extension="rels"' +
    ' ContentType="application/vnd.openxmlformats-package.relationships+xml"/>' +
    '<Default Extension="xml" ContentType="application/xml"/>' +
    (hasDrawing ? '<Default Extension="png" ContentType="image/png"/>' : '') +
    `<Override PartName="/xl/workbook.xml" ContentType="${SML}.sheet.main+xml"/>` +
    `<Override PartName="/xl/worksheets/sheet1.xml" ContentType="${SML}.worksheet+xml"/>` +
    `<Override PartName="/xl/styles.xml" ContentType="${SML}.styles+xml"/>` +
    (hasDrawing
      ? '<Override PartName="/xl/drawings/drawing1.xml"' +
        ' ContentType="application/vnd.openxmlformats-officedocument.drawing+xml"/>'
      : '') +
    '</Types>'
  )
}

const ROOT_RELS =
  XML_DECL +
  `<Relationships xmlns="${RELS_NS}">` +
  `<Relationship Id="rId1" Type="${DOC_RELS}/officeDocument" Target="xl/workbook.xml"/>` +
  '</Relationships>'

const WORKBOOK_RELS =
  XML_DECL +
  `<Relationships xmlns="${RELS_NS}">` +
  `<Relationship Id="rId1" Type="${DOC_RELS}/worksheet" Target="worksheets/sheet1.xml"/>` +
  `<Relationship Id="rId2" Type="${DOC_RELS}/styles" Target="styles.xml"/>` +
  '</Relationships>'

/** The workbook as a Blob, ready to hand to the browser. */
export async function workbookBlob(sheet: Sheet): Promise<Blob> {
  const images = sheet.images ?? []
  const hasDrawing = images.length > 0

  // The same bytes are embedded once however many anchors point at them, keyed
  // on the buffer itself: a caller that draws one mark on forty cards passes
  // the same Uint8Array forty times, and that is exactly the case worth not
  // storing forty times over.
  const media: Uint8Array[] = []
  const mediaRel = new Map<Uint8Array, number>()
  for (const image of images) {
    if (!mediaRel.has(image.png)) {
      media.push(image.png)
      mediaRel.set(image.png, media.length)
    }
  }
  const relIds = images.map((image) => mediaRel.get(image.png)!)
  const styles = new StyleTable()
  // The sheet is built FIRST: building it is what registers every style, so
  // styles.xml can only be serialised once it has run.
  const sheetXml = buildSheet(sheet, styles, hasDrawing)

  const workbook =
    XML_DECL +
    '<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"' +
    ` xmlns:r="${DOC_RELS}">` +
    `<sheets><sheet name="${xmlText(sheetName(sheet.name))}" sheetId="1" r:id="rId1"/></sheets>` +
    '</workbook>'

  const parts: [string, string][] = [
    ['[Content_Types].xml', contentTypes(hasDrawing)],
    ['_rels/.rels', ROOT_RELS],
    ['xl/workbook.xml', workbook],
    ['xl/_rels/workbook.xml.rels', WORKBOOK_RELS],
    ['xl/styles.xml', styles.xml()],
    ['xl/worksheets/sheet1.xml', sheetXml],
  ]

  if (hasDrawing) {
    parts.push([
      'xl/worksheets/_rels/sheet1.xml.rels',
      XML_DECL +
        `<Relationships xmlns="${RELS_NS}">` +
        `<Relationship Id="rId1" Type="${DOC_RELS}/drawing" Target="../drawings/drawing1.xml"/>` +
        '</Relationships>',
    ])
    parts.push(['xl/drawings/drawing1.xml', buildDrawing(images, relIds)])
    parts.push([
      'xl/drawings/_rels/drawing1.xml.rels',
      XML_DECL +
        `<Relationships xmlns="${RELS_NS}">` +
        media
          .map(
            (_, i) =>
              `<Relationship Id="rId${i + 1}" Type="${DOC_RELS}/image"` +
              ` Target="../media/image${i + 1}.png"/>`,
          )
          .join('') +
        '</Relationships>',
    ])
  }

  const encoder = new TextEncoder()
  const entries: ZipEntry[] = []
  for (const [name, xml] of parts) {
    const raw = encoder.encode(xml)
    const { data, method } = await deflate(raw)
    entries.push({ name, data, method, crc: crc32(raw), size: raw.length })
  }
  for (const [i, png] of media.entries()) {
    // A PNG is deflated already; running it through again costs time and gains
    // nothing, so the bytes are stored.
    entries.push({
      name: `xl/media/image${i + 1}.png`,
      data: png,
      method: 0,
      crc: crc32(png),
      size: png.length,
    })
  }

  return new Blob([zipBytes(entries) as BlobPart], { type: `${SML}.sheet` })
}

/**
 * Save `sheet` as `filename`.xlsx.
 *
 * The anchor has to be in the document before it is clicked — Firefox ignores a
 * detached one — and the object URL is released on the next tick rather than
 * immediately, because revoking it in the same turn as the click races the
 * browser's read of it.
 */
export async function downloadWorkbook(filename: string, sheet: Sheet): Promise<void> {
  const blob = await workbookBlob(sheet)
  const url = URL.createObjectURL(blob)
  const link = document.createElement('a')
  link.href = url
  link.download = filename.toLowerCase().endsWith('.xlsx') ? filename : `${filename}.xlsx`
  document.body.appendChild(link)
  link.click()
  link.remove()
  setTimeout(() => URL.revokeObjectURL(url), 0)
}
