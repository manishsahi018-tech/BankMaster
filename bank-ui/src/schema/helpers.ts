// Hand-written helpers over the generated table modules in ./tables/.
// Screens build their grid columns and input maxLengths from these so the
// UI stays in lock-step with the archival dictionary.

import type { SchemaField, SchemaTable } from './types.ts'
import type { GridColumn } from '../components/GridScreen.tsx'

export function getField(table: SchemaTable, name: string): SchemaField {
  const field = table.fields.find((f) => f.name === name)
  if (!field) throw new Error(`schema table ${table.name} has no column "${name}"`)
  return field
}

// Max input length for a field, from the dictionary's Size column.
export function maxLen(table: SchemaTable, name: string): number | undefined {
  const size = getField(table, name).size
  return typeof size === 'number' ? size : undefined
}

const ACRONYMS = new Set(['ID', 'IBAN', 'SAMA', 'VIP', 'ATM', 'GL', 'BM', 'GPRS'])

// "CHEQUE BOOK REQUEST STATUS" → "Cheque Book Request Status". A few
// workbook rows have no display name; fall back to the camelCase column
// name ("paymentFrequency" → "PAYMENT FREQUENCY") before title-casing.
export function fieldLabel(field: SchemaField): string {
  const raw = field.label ?? field.name.replace(/([a-z0-9])([A-Z])/g, '$1 $2').toUpperCase()
  return raw
    .split(' ')
    .map((word) => {
      const bare = word.replace(/[^A-Za-z0-9]/g, '')
      if (ACRONYMS.has(bare)) return word
      if (word.includes('.')) return word // "P.O." and friends
      return word.charAt(0) + word.slice(1).toLowerCase()
    })
    .join(' ')
}

/**
 * Today as YYYYMMDD — the enquiry date range defaults.
 *
 * The legacy seeds both the start and end date of frmTransEnq and
 * frmSarieTransferEnq with the client's current date, then lets the operator
 * change them (frmAccount.frm cmdTransEnq_Click / cmdTransferEnq_Click:
 * `txtStartYear = CStr(Year(Date))`, `cmbStartMonth = Format(CStr(Month(Date)),
 * "00")`, … and the same three for End).
 */
export function todayYyyymmdd(): string {
  const d = new Date()
  const p = (n: number) => String(n).padStart(2, '0')
  return `${d.getFullYear()}${p(d.getMonth() + 1)}${p(d.getDate())}`
}

// Archival dates are YYYYMMDD strings.
export function formatDate(value: unknown): string {
  const v = String(value ?? '')
  if (!/^\d{8}$/.test(v)) return v
  return `${v.slice(6, 8)}/${v.slice(4, 6)}/${v.slice(0, 4)}`
}

// Archival timestamps are YYYYMMDDHH24MISS strings.
export function formatTimestamp(value: unknown): string {
  const v = String(value ?? '')
  if (!/^\d{14}$/.test(v)) return v
  return `${formatDate(v.slice(0, 8))} ${v.slice(8, 10)}:${v.slice(10, 12)}:${v.slice(12, 14)}`
}

// Archival amounts are Numeric 16,3.
/**
 * Raw archival amount -> number, recovering the trailing-overpunch sign the BM
 * files use for negatives: the last byte of a negative amount is 'P'..'Y'
 * ('P' = 0 … 'Y' = 9, i.e. the digit + 0x20). Mirrors BmForms.amountOrNull on
 * the API side (cbcmssrv bmAmtToDbl @ 0x0ce8f4) and the legacy's own test,
 * `If Not IsNumeric(Right(Trim(transamt)), 1)) Then tmpStr = "-" & bmAmtToDbl(…)`
 * (frmTransEnq.frm:663-668).
 *
 * Returns null for blank/unparsable input so callers can fall back to showing
 * the raw text rather than a misleading 0.
 */
export function amountValue(value: unknown): number | null {
  if (value == null) return null
  const raw = String(value).trim()
  if (raw === '') return null
  const last = raw.charAt(raw.length - 1)
  const negative = last >= 'P' && last <= 'Y'
  const digits = negative
    ? raw.slice(0, -1) + String.fromCharCode(last.charCodeAt(0) - 0x20)
    : raw
  const n = Number(digits)
  if (Number.isNaN(n)) return null
  return negative ? -n : n
}

export function formatAmount(value: unknown): string {
  const n = amountValue(value)
  if (n === null) return String(value ?? '')
  return n.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 3 })
}

const RENDERERS: Partial<Record<string, (value: unknown) => string>> = {
  date: formatDate,
  timestamp: formatTimestamp,
  numeric: formatAmount,
}

// Card numbers are never displayed in full (PCI) — mask all but last 4.
export function maskCardNo(value: unknown): string {
  const card = String(value ?? '')
  return card.length > 4 ? '*'.repeat(card.length - 4) + card.slice(-4) : card
}

// GridScreen column bound to a schema field: the key is the archival column
// name, so backend rows shaped like the table bind with no mapping layer.
export function column(
  table: SchemaTable,
  name: string,
  overrides: Partial<GridColumn> = {},
): GridColumn {
  const field = getField(table, name)
  const col: GridColumn = { key: field.name, label: fieldLabel(field) }
  if (field.type === 'numeric') col.align = 'right'
  const render = field.type ? RENDERERS[field.type] : undefined
  if (render) col.render = render
  return { ...col, ...overrides }
}
