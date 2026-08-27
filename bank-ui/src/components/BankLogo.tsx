import { t } from '../i18n/index.ts'

// The bank's mark, on every sheet the app prints.
//
// The legacy did this too, and did it per PAGE rather than per document:
// globalFunctions.bas paints `frmLogin.anbLogo1` at the top-left corner of the
// sheet, and re-paints it after every `Printer.NewPage` (~8 call sites, e.g.
// :11353). The image it painted is embedded in OnlineStmt.frx and is
// byte-identical to docs/CSD for CBS-CMS VER 4.0.5/ANB Logo new4.bmp — the ANB
// mark, 127x59. This is the modern mark in its place.
//
// INLINE, not an <img src>. A logo the browser is still fetching when
// window.print() opens the dialog prints as an empty box, and print.ts fires
// print() the moment the operator presses the button — there is no load to
// wait on here. It also survives the app being served from inside the jar,
// where a missing asset path fails silently on paper and nowhere else.
//
// The fill stays the brand blue on paper. The print rules in index.css force
// `color: #000` over everything inside .print-page to keep the UI's greys off
// the sheet, but `color` does not reach an SVG `fill` attribute — the one place
// colour is wanted is the one place that rule cannot touch.

/**
 * The mark, sized by its height — `className` sets that, the width follows the
 * 50:21 artwork.
 *
 * Callers put it in a row that is ALREADY at least as tall as the mark (the
 * card's two-line heading block), because the printed sheet is a fixed box:
 * .print-page .print-per-page > * is 270mm and statementPages.ts cuts the
 * transactions to fill exactly what is left. Height added to a card header
 * comes straight off the last transaction on every sheet.
 */
export function BankLogo({ className = 'h-6 w-auto' }: { className?: string }) {
  return (
    <svg
      className={className}
      viewBox="0 0 50 21"
      fill="none"
      role="img"
      aria-label={t('Arab National Bank')}
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        d="M15.1 9.4V20.5H11.8V9.4C11.8 8.7 11.4 8.4 11.2 8.3C11 8.2 10.5 7.9 9.9 8.2C7.7 9.2 5.7 10.4 3.8 11.8C3.5 12.1 3.3 12.5 3.3 12.9C3.3 13.1 3.4 13.6 3.8 14C5.5 15.3 7.3 16.4 9.3 17.3L8.5 20.6C6.1 19.5 3.9 18.2 1.8 16.6C0.600001 15.7 0 14.4 0 12.9C0 11.4 0.7 10.1 1.9 9.2C4 7.6 6.3 6.3 8.7 5.2C10.2 4.5 11.8 4.7 13.2 5.5C14.3 6.3 15.1 7.8 15.1 9.4ZM48.1 9C46 7.4 43.7 6.1 41.3 5V5.1L40.5 8.3C42.5 9.2 44.3 10.4 46.1 11.7C46.4 12 46.6 12.4 46.6 12.8C46.6 13 46.5 13.5 46.1 13.9C44.2 15.3 42.1 16.6 40 17.5C39.4 17.8 38.9 17.5 38.7 17.4C38.5 17.3 38.1 16.9 38.1 16.3V0H34.8V16.3C34.8 17.9 35.6 19.4 36.9 20.2C37.7 20.7 38.5 20.9 39.4 20.9C40.1 20.9 40.7 20.8 41.3 20.5C43.7 19.4 46 18.1 48.1 16.5C49.3 15.6 49.9 14.3 49.9 12.8C49.9 11.2 49.3 9.9 48.1 9ZM32.1 10.9C32.1 7.5 29.3 4.7 25.9 4.7H21.1C19.3 4.7 17.8 6.2 17.8 8V20.4H21.1V8H25.9C27.5 8 28.8 9.3 28.8 10.9V20.4H32.1V10.9Z"
        fill="#0071CE"
      />
    </svg>
  )
}
