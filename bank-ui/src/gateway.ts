// Amount handling for the ONLINE GATEWAY replies (services 07 and 11).
//
// Kept apart from schema/helpers.ts on purpose. Those decode ARCHIVAL values:
// overpunch-signed amount strings and packed BM dates. The gateway uses neither.
// Its amounts are signed decimal strings in MINOR units, and the sign character
// is the Dr/Cr flag rather than part of the number — the legacy tests
// `Mid$(transAmt, 1, 1) = "+"` for credit and then takes Abs() for display
// (OnlineStmt.frm:1136-1140, frmTransaction.frm:626-631). Running either
// module's decoder over the other's data silently produces wrong money.

/**
 * coinDenomination — what the legacy divides every amount by before display.
 *
 * decimalPlace "1"/"2"/"3" give 10/100/1000; anything else gives 1, i.e. a
 * whole-unit currency (OnlineStmt.frm:748-760, and the identical block in
 * frmTransaction.frm:427-440).
 */
export function coinDenomination(decimalPlace: string): number {
  switch (decimalPlace?.trim()) {
    case '1':
      return 10
    case '2':
      return 100
    case '3':
      return 1000
    default:
      return 1
  }
}

/** Decimals to render, matching coinDenomination. */
export function coinPrecision(decimalPlace: string): number {
  const place = decimalPlace?.trim()
  return place === '1' || place === '2' || place === '3' ? Number(place) : 0
}

/**
 * Splits a gateway amount into its side and its magnitude in MINOR units.
 *
 * Returns credit=true for a leading "+", false otherwise — the legacy's exact
 * test, which means an unsigned amount counts as a DEBIT.
 */
export function splitAmount(transAmt: string): { credit: boolean; minor: number } {
  const raw = (transAmt ?? '').trim()
  const credit = raw.startsWith('+')
  const digits = raw.replace(/^[+-]/, '')
  const minor = Number(digits)
  return { credit, minor: Number.isNaN(minor) ? 0 : minor }
}

/** Minor units -> display string, divided and padded per decimalPlace. */
export function formatMinor(minor: number, decimalPlace: string): string {
  const value = minor / coinDenomination(decimalPlace)
  const precision = coinPrecision(decimalPlace)
  return value.toLocaleString('en-US', {
    minimumFractionDigits: precision,
    maximumFractionDigits: precision,
  })
}

/**
 * The running balance's C/D marker.
 *
 * The legacy prints "C" when the carried balance is >= 0 and "D" when it is
 * negative, showing the ABSOLUTE value beside it (OnlineStmt.frm:1186-1195).
 * Zero prints as neither in the brought-forward line but as "C" in the body;
 * the body's rule is the one used here, since that is what a row shows.
 */
export function balanceMarker(minor: number): 'C' | 'D' {
  return minor >= 0 ? 'C' : 'D'
}

/** YYYYMMDD -> DD/MM/YYYY, the gateway screens' date format. */
export function formatGatewayDate(yyyymmdd: string): string {
  const v = (yyyymmdd ?? '').trim()
  if (!/^\d{8}$/.test(v)) return v
  return `${v.slice(6, 8)}/${v.slice(4, 6)}/${v.slice(0, 4)}`
}

/** Today as YYYYMMDD. */
export function todayYyyymmdd(): string {
  const d = new Date()
  const p = (n: number) => String(n).padStart(2, '0')
  return `${d.getFullYear()}${p(d.getMonth() + 1)}${p(d.getDate())}`
}
