import type {
  HistoricalStatement as Statement,
  HistoricalStatementLine as Line,
} from '../api.ts'
import { formatDate, formatPlainAmount, todayYyyymmdd } from '../schema/helpers.ts'
import { codeDescription } from '../codes.ts'
import { t } from '../i18n/index.ts'
import { getLocale } from '../i18n/locale.ts'

// The rendering of one archived statement, shared by the two screens that
// produce them: Historical Statement Printing (the BM archive) and PDP
// Statements (the PDP one). Both screens receive the same HistoricalStatement
// shape from the server — the archives differ in WHICH header columns are
// filled, not in the shape — so the card renders every field conditionally and
// each archive's blanks simply do not appear. Keeping one component is what
// stops the two screens drifting into showing the same statement differently.

/**
 * The legacy names the archive by month; "20240331" -> "March 2024", and
 * "مارس 2024" under Arabic.
 *
 * <p>The month name is the one piece of text on this card that no dictionary
 * can carry — it is derived from the data, not written by us — so it is
 * formatted for the active locale instead of translated.
 *
 * <p>Both extensions on the Arabic tag are load-bearing. ca-gregory: `ar`
 * resolves to the Islamic calendar in some runtimes, which would print a
 * Gregorian STMT_DATE under a Hijri month name — the wrong month, stated
 * confidently. nu-latn: the app keeps Western numerals throughout under Arabic
 * (the legacy screens show "27/01/2001" unchanged), and a year in
 * Arabic-Indic digits here would be the only place that did not.
 */
function monthLabel(yyyymmdd: string): string {
  if (!/^\d{8}$/.test(yyyymmdd)) return yyyymmdd
  const date = new Date(
    Number(yyyymmdd.slice(0, 4)),
    Number(yyyymmdd.slice(4, 6)) - 1,
    Number(yyyymmdd.slice(6, 8)),
  )
  const tag = getLocale() === 'ar' ? 'ar-u-ca-gregory-nu-latn' : 'en-GB'
  return date.toLocaleDateString(tag, { month: 'long', year: 'numeric' })
}

/**
 * How the currency prints: the stored ISO code under English, its name under
 * Arabic.
 *
 * English keeps "SAR" — the code IS the English reading of it, and a statement
 * that has always said SAR should go on saying SAR. Arabic has no such
 * convention, which is what made this the one field on the card still in
 * English there, so it resolves to the name the reference sets carry.
 *
 * The two keyings of stctltabXC are both tried because the archives store a
 * currency the way their own source did: `isoCurrency` is keyed on the 3-char
 * ISO alpha ("SAR"), `currency` on BankMaster's own 2-char code ("01"). An
 * unresolvable code returns itself, so nothing is ever lost.
 */
function currencyLabel(crncy: string): string {
  if (getLocale() !== 'ar') return crncy
  const iso = codeDescription('isoCurrency', crncy)
  return iso !== crncy ? iso : codeDescription('currency', crncy)
}

/** Stable React key — a PDP customer enquiry can span several accounts. */
export function statementKey(s: Statement): string {
  return `${s.source}-${s.acctNum}-${s.stmtDate}-${s.stmtNum}-${s.pageNum}`
}

function addressLines(s: Statement): string[] {
  return [s.custAdr1, s.custAdr2, s.custAdr3, s.custAdr4].filter((l) => l.trim() !== '')
}

/** The filled narrative lines of one transaction, in printed order. */
function narrativeOf(line: Statement['lines'][number]): string[] {
  return [line.narrative1, line.narrative2, line.narrative3, line.narrative4].filter(
    (n) => n.trim() !== '',
  )
}

/**
 * One statement's header block and transaction table.
 *
 * `page`/`pages` are the statement's position in the pack the screen is
 * showing, not anything the archive carries: print CSS starts every card on a
 * fresh sheet (.print-per-page in index.css), so numbering the statements IS
 * numbering the sheets. The archive's own PAGE_NUM cannot serve here — the
 * repository folds a PDP statement's per-page header rows into one statement
 * and keeps the lowest, so it reads 1 on every card; its page COUNT is the
 * separate "N printed pages" note in the header.
 */
export function StatementCard({
  statement,
  lines,
  continued = false,
  page,
  pages,
}: {
  statement: Statement
  /** The transactions on THIS sheet; the whole statement when not paginated. */
  lines?: Line[]
  continued?: boolean
  page?: number
  pages?: number
}) {
  const s = statement
  const rows = lines ?? s.lines
  const address = addressLines(s)
  return (
    <section className="print-expand overflow-hidden rounded-2xl border border-edge bg-surface shadow-sm">
      <header className="border-b border-edge-soft bg-surface-muted px-4 py-4 sm:px-5">
        <div className="flex flex-wrap items-start justify-between gap-3">
          <div>
            <h2 className="text-base font-semibold text-ink">
              {t('Statement for {month}', { month: monthLabel(s.stmtDate) })}
              {s.stmtNum && (
                <span className="ms-2 text-sm font-normal text-muted">
                  {t('No. {stmtNum}', { stmtNum: s.stmtNum })}
                </span>
              )}
              {/* A statement whose transactions did not fit one sheet repeats
                  its whole header on the next, so each sheet identifies itself
                  — and says which of the two it is. */}
              {continued && (
                <span className="ms-2 text-sm font-normal text-muted">{t('(continued)')}</span>
              )}
            </h2>
            {/* ACCT_TYPE and CRNCY are the archive's own words, and under
                Arabic they were the one line on the card still reading English.
                ACCT_TYPE is free text ("CURRENT ACCOUNT"), so it goes through
                the caption dictionary — an entry it has no Arabic for falls
                through to its English, which is t()'s normal behaviour. CRNCY
                is a code, so it goes through the reference sets instead. */}
            <p className="mt-0.5 text-sm text-muted">
              {s.acctNum}
              {s.acctType && ` · ${t(s.acctType)}`}
              {s.crncy && ` · ${currencyLabel(s.crncy)}`}
            </p>
          </div>
          <div className="text-end">
            {/* Top right of the header, where a statement carries its date.
                TODAY — the day the document is being produced — not the
                archived period, which the heading on the left already names.
                Read at render time, so a session left open overnight dates the
                sheet it actually prints on.

                One line — label, dash, date — with the value in full-strength
                ink: the first pass set the whole thing in the quiet grey the
                asides use, and a date nobody can read is the same as no
                date. */}
            <p className="text-end text-sm text-ink">
              <span className="text-xs uppercase tracking-wider text-muted-soft">
                {t('Statement Date')}
              </span>
              {' - '}
              <span className="font-medium">{formatDate(todayYyyymmdd())}</span>
            </p>
            {/* pageCount, and deliberately NOT pageNum. The PDP header holds one
                row per printed page and the repository folds them into one
                statement, keeping the FIRST row's fields — ordered by PAGE_NUM,
                so the pageNum that survives is always the group's lowest, i.e.
                1 for every statement. Shown, it claimed "Page 1" on every card
                and on every printed sheet. The count is the real information:
                how many pages the archived statement ran to. */}
            {s.pageCount > 1 && (
              <p className="mt-1 text-xs text-muted-soft">
                {t('{pages} printed pages', { pages: s.pageCount })}
              </p>
            )}
          </div>
        </div>

        <dl className="mt-4 grid gap-x-6 gap-y-2 text-sm sm:grid-cols-2 lg:grid-cols-3">
          <div>
            <dt className="text-xs uppercase tracking-wider text-muted-soft">{t('Customer')}</dt>
            <dd className="text-ink-soft">
              {s.custName || '—'}
              {s.custNum && <span className="ms-1 text-muted">({s.custNum})</span>}
            </dd>
          </div>
          <div>
            <dt className="text-xs uppercase tracking-wider text-muted-soft">{t('Branch')}</dt>
            <dd className="text-ink-soft">
              {s.branchCode}
              {s.branchName && ` — ${s.branchName}`}
            </dd>
          </div>
          {s.iban && (
            <div>
              <dt className="text-xs uppercase tracking-wider text-muted-soft">{t('IBAN')}</dt>
              <dd className="font-mono text-xs text-ink-soft">{s.iban}</dd>
            </div>
          )}
          {s.refNum && (
            <div>
              <dt className="text-xs uppercase tracking-wider text-muted-soft">{t('Reference')}</dt>
              <dd className="text-ink-soft">{s.refNum}</dd>
            </div>
          )}
          {address.length > 0 && (
            <div className="sm:col-span-2 lg:col-span-1">
              <dt className="text-xs uppercase tracking-wider text-muted-soft">{t('Address')}</dt>
              <dd className="text-ink-soft">{address.join(', ')}</dd>
            </div>
          )}
        </dl>
      </header>

      {rows.length === 0 ? (
        <p className="px-4 py-6 text-sm text-muted sm:px-5">
          {t('This statement has a header but no transaction lines in the archive.')}
        </p>
      ) : (
        <div className="overflow-x-auto print-expand">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-edge-soft text-start text-xs uppercase tracking-wider text-muted-soft">
                <th className="px-4 py-2.5 font-semibold">{t('Date')}</th>
                <th className="px-4 py-2.5 font-semibold">{t('Value Date')}</th>
                <th className="px-4 py-2.5 font-semibold">{t('Narrative')}</th>
                <th className="px-4 py-2.5 font-semibold">{t('Branch')}</th>
                <th className="px-4 py-2.5 text-end font-semibold">{t('Debit')}</th>
                <th className="px-4 py-2.5 text-end font-semibold">{t('Credit')}</th>
                <th className="px-4 py-2.5 text-end font-semibold">{t('Balance')}</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((line) => {
                // NARRATIVE1-4 are the four printed narrative lines; blanks are
                // common, so only the filled ones are stacked.
                const narrative = narrativeOf(line)
                return (
                  <tr key={line.txnOrder} className="border-b border-edge-soft last:border-0">
                    <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-ink-soft">
                      {formatDate(line.txnDate)}
                    </td>
                    <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-muted">
                      {formatDate(line.valueDate)}
                    </td>
                    <td className="px-4 py-2.5 text-ink-soft">
                      {narrative.length === 0 ? (
                        <span className="text-muted-soft">—</span>
                      ) : (
                        narrative.map((n, i) => (
                          <span key={i} className={i === 0 ? 'block' : 'block text-muted'}>
                            {n}
                          </span>
                        ))
                      )}
                    </td>
                    <td className="whitespace-nowrap px-4 py-2.5 text-muted">
                      {line.txnBranchCode}
                    </td>
                    <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums text-ink-soft">
                      {formatPlainAmount(line.drAmt) || '—'}
                    </td>
                    <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums text-ink-soft">
                      {formatPlainAmount(line.crAmt) || '—'}
                    </td>
                    <td className="whitespace-nowrap px-4 py-2.5 text-end tabular-nums font-medium text-ink">
                      {formatPlainAmount(line.runBal)}
                      {/* RUN_BAL_TYPE is the DR/CR marker the printed statement
                          carried beside the running balance. Shown verbatim —
                          the legacy never interpreted it either. */}
                      {line.runBalType && (
                        <span className="ms-1 text-xs font-normal text-muted">
                          {line.runBalType}
                        </span>
                      )}
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
      )}

      {/* Foot of every card, on screen and on paper alike — a printed pack is
          read as a document, and a document says which sheet you are holding. */}
      {page !== undefined && pages !== undefined && (
        <footer className="border-t border-edge-soft px-4 py-2 text-end text-xs text-muted-soft sm:px-5">
          {t('Page {page} of {pages}', { page, pages })}
        </footer>
      )}
    </section>
  )
}
