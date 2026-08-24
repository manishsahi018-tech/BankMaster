import type { HistoricalStatement as Statement } from '../api.ts'
import { formatDate, formatPlainAmount } from '../schema/helpers.ts'
import { t } from '../i18n/index.ts'

// The rendering of one archived statement, shared by the two screens that
// produce them: Historical Statement Printing (the BM archive) and PDP
// Statements (the PDP one). Both screens receive the same HistoricalStatement
// shape from the server — the archives differ in WHICH header columns are
// filled, not in the shape — so the card renders every field conditionally and
// each archive's blanks simply do not appear. Keeping one component is what
// stops the two screens drifting into showing the same statement differently.

/** The legacy names the archive by month; "20240331" -> "March 2024". */
export function monthLabel(yyyymmdd: string): string {
  if (!/^\d{8}$/.test(yyyymmdd)) return yyyymmdd
  const date = new Date(
    Number(yyyymmdd.slice(0, 4)),
    Number(yyyymmdd.slice(4, 6)) - 1,
    Number(yyyymmdd.slice(6, 8)),
  )
  return date.toLocaleDateString('en-GB', { month: 'long', year: 'numeric' })
}

/** Stable React key — a PDP customer enquiry can span several accounts. */
export function statementKey(s: Statement): string {
  return `${s.source}-${s.acctNum}-${s.stmtDate}-${s.stmtNum}-${s.pageNum}`
}

/**
 * LANG_CODE is NVARCHAR2(2) and the legacy's own values were the single chars
 * "a" and "e" (stmtSpec.lang, tested as `If stmtLang = "e"` in processStmt).
 * The archive may equally hold the "0"/"3" pair the print header used
 * (cmdCsv_Click reads Mid$(tLine, 47, 1): "0" = Arabic, "3" = English) or an
 * ISO code, so all three are mapped and anything unrecognised is shown raw
 * rather than guessed at.
 */
function languageLabel(code: string): string {
  const c = code.trim().toLowerCase()
  if (c === 'a' || c === '0' || c === 'ar') return 'Arabic'
  if (c === 'e' || c === '3' || c === 'en') return 'English'
  return code
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

/** One statement's header block and transaction table. */
export function StatementCard({ statement }: { statement: Statement }) {
  const s = statement
  const address = addressLines(s)
  return (
    <section className="overflow-hidden rounded-2xl border border-edge bg-surface shadow-sm">
      <header className="border-b border-edge-soft bg-surface-muted px-4 py-4 sm:px-5">
        <div className="flex flex-wrap items-start justify-between gap-3">
          <div>
            <h2 className="text-base font-semibold text-ink">
              Statement for {monthLabel(s.stmtDate)}
              {s.stmtNum && (
                <span className="ms-2 text-sm font-normal text-muted">No. {s.stmtNum}</span>
              )}
            </h2>
            <p className="mt-0.5 text-sm text-muted">
              {s.acctNum}
              {s.acctType && ` · ${s.acctType}`}
              {s.crncy && ` · ${s.crncy}`}
            </p>
          </div>
          {s.pageCount > 1 && (
            <div className="text-end text-xs text-muted-soft">
              <p>{s.pageCount} printed pages</p>
            </div>
          )}
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
          {/* LANG_CODE is the descendant of stmtSpec.lang, which drove the
              legacy's lanfix pass over the rendered page. It no longer changes
              how anything is displayed — these are fields, not a page image —
              but it still records which language the statement was PRODUCED in,
              which is why an archived copy can differ from what the account's
              current language preference would produce today. */}
          {s.langCode && (
            <div>
              <dt className="text-xs uppercase tracking-wider text-muted-soft">
                {t('Statement Language')}
              </dt>
              <dd className="text-ink-soft">{languageLabel(s.langCode)}</dd>
            </div>
          )}
          {s.pageNum && (
            <div>
              <dt className="text-xs uppercase tracking-wider text-muted-soft">{t('Page')}</dt>
              <dd className="text-ink-soft">{s.pageNum}</dd>
            </div>
          )}
        </dl>
      </header>

      {s.lines.length === 0 ? (
        <p className="px-4 py-6 text-sm text-muted sm:px-5">
          {t('This statement has a header but no transaction lines in the archive.')}
        </p>
      ) : (
        <div className="overflow-x-auto">
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
              {s.lines.map((line) => {
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

      {/* FILE_NAME is the descendant of stmtSpec.stmtFile — the zipped page file
          the Btrieve index used to point at. Kept visible because support still
          reconciles against those archive filenames. */}
      {s.fileName && (
        <footer className="border-t border-edge-soft px-4 py-2 text-xs text-muted-soft sm:px-5">
          {t('Archive file')} <span className="font-mono">{s.fileName}</span>
          {s.branchData && <> · branch data {s.branchData}</>}
        </footer>
      )}
    </section>
  )
}

/**
 * One statement as a page of the print-only sheet, mirroring the legacy's
 * landscape printed layout. The account number is in the caption because a PDP
 * enquiry can print several accounts onto one sheet.
 */
export function StatementPrintTable({ statement }: { statement: Statement }) {
  const s = statement
  return (
    <table className="page-break">
      <caption>
        {s.acctNum} · {monthLabel(s.stmtDate)}
        {s.stmtNum && ` — statement ${s.stmtNum}`} · {s.custName} · {s.branchCode} {s.branchName} ·{' '}
        {s.crncy}
      </caption>
      <thead>
        <tr>
          <th>{t('Date')}</th>
          <th>{t('Value Date')}</th>
          <th>{t('Narrative')}</th>
          <th className="right">{t('Debit')}</th>
          <th className="right">{t('Credit')}</th>
          <th className="right">{t('Balance')}</th>
        </tr>
      </thead>
      <tbody>
        {s.lines.map((line) => (
          <tr key={line.txnOrder}>
            <td>{formatDate(line.txnDate)}</td>
            <td>{formatDate(line.valueDate)}</td>
            <td>{narrativeOf(line).join(' / ')}</td>
            <td className="right">{formatPlainAmount(line.drAmt)}</td>
            <td className="right">{formatPlainAmount(line.crAmt)}</td>
            <td className="right">
              {formatPlainAmount(line.runBal)} {line.runBalType}
            </td>
          </tr>
        ))}
      </tbody>
    </table>
  )
}
