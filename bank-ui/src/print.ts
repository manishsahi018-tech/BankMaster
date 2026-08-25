// Printing a NAMED document.
//
// The browser gives a page exactly one channel for its document name, and it
// is document.title: it is what the print dialog puts in the sheet's header,
// and — the one that matters — what "Save as PDF" offers as the filename.
// Every screen here runs inside one SPA whose <title> is the shell's ("Static
// Data Management — CBS", index.html), so every statement anyone printed
// arrived as that same name, and a folder of saved PDFs was a row of identical
// files distinguished only by "(1)", "(2)".
//
// So each screen that prints names its own document, and the name is the one
// the paper already carries — "PDP Account Statement" is the heading on the
// sheet AND the file it saves as.

/**
 * Print the page as `documentName`, restoring the shell title afterwards.
 *
 * The restore hangs off `afterprint` rather than following `window.print()`:
 * the browser reads the title while the preview is open — that is when the
 * filename is decided — so putting the shell title back on the next line
 * races the dialog in any browser whose print() does not block. `afterprint`
 * fires when the dialog closes, printed or cancelled, in every browser the app
 * supports; `once` keeps repeat prints from stacking listeners.
 */
export function printDocument(documentName: string): void {
  const shellTitle = document.title
  document.title = documentName
  window.addEventListener('afterprint', () => { document.title = shellTitle }, { once: true })
  window.print()
}
