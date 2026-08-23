import { useState } from 'react'
import { Field, TextInput, ReadOnlyInput, Select } from '../components/fields.tsx'
import { useToast } from '../components/Toast.tsx'
import type { Account } from '../types.ts'
import type { HistoricalStatement as Statement, StatementSystem } from '../api.ts'
import { api } from '../api.ts'
import { hasAuthority } from '../session.ts'
import { formatDate, formatPlainAmount } from '../schema/helpers.ts'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmHistStmt.frm ("Historical Statement Printing", the
// frmAccount cmdHistStmt button, authority ~60/~61/~62).
//
// WHAT THE LEGACY DID, AND WHY THIS SCREEN CANNOT BE A LITERAL PORT.
// The legacy never had statement DATA. generateReport (:1252) looped YYYYMM
// from-to, opened one Btrieve index per branch per month
// (<STMTPATH><brn3>\s<brn3><bmYY><MM>.idx), and each index record — accNo,
// lang, stmtFile, zipFileNo — named a PRE-RENDERED page file inside a ZIP.
// processStmt (:1435) wrote a batch script to unzip it, lanfix it for language
// and fmerge it into a print spool, which a2w then converted for View/Print.
// The operator only ever saw a page image; there were no fields to show.
//
// DB #3 stores those statements relationally, so the same request now yields
// header + transaction ROWS. The inputs, the validation, the gating and the
// empty-result message are ported exactly; the output is a grid because there
// is no longer a rendered page to display. Print reproduces the legacy's
// landscape sheet.
//
// The month loop and the two BM key encodings (convertAcc2Bm, convertYear2Bm)
// are deliberately absent — they existed only to build Btrieve keys.
//
// THE SYSTEM SELECTOR is new as a control, but not as an idea. The legacy had
// TWO sources on this screen and made the operator choose with separate buttons:
// Generate/View/Print read the BRANCH archive it built from Btrieve, while View
// HO / Print HO read reqPath\prtall.$s! — a pre-merged statement delivered by
// Head Office and requested over FTP (cmdFtp -> frmSendFile), whose absence the
// screen reports as "Please call HO". DB #3 holds two header/detail pairs, BM
// and PDP, and the selector is that same either/or in one control. Whether the
// pairs line up with branch-vs-HO is a hypothesis, not a fact — see
// JdbcStatementRepository. Exactly one pair is read, so a result is never a
// merge of the two archives.
//
// NOT PORTED, descoped deliberately: Analyse. The legacy shelled out to an
// `analyse` utility over the merged print file (prtall.$s! -> prtall.$a!, and
// prtall.$h! for the HO variant) and opened the result in Notepad — four
// buttons in all. It operated on rendered text, which no longer exists here.
//
// Not ported either: the FTP request to Head Office. It fetched a FILE onto a
// mapped drive, which has no meaning against a relational archive.

const MONTHS = Array.from({ length: 12 }, (_, i) => String(i + 1).padStart(2, '0'))

/**
 * Where the BM archive ends: Finacle went live in July 2009 and nothing was
 * written here after it (frmHistStmt.frm:1195-1197). Measured data agrees — the
 * BM archival views span 1992-2009.
 */
const LAST_ARCHIVED_YEAR = '2009'
const LAST_ARCHIVED_MONTH = '07'

/** The two archives DB #3 holds. Sent verbatim — the API takes these strings. */
const SYSTEMS: StatementSystem[] = ['BM', 'PDP']

// Legacy message text, transcribed from the inline comments beside each MsgBox
// in frmHistStmt.frm — the errXxx(UserLang) string table is not in the source
// dump, so those comments are the only record of the wording.
const MSG = {
  branchCode: 'Branch Code should be 4 characters..Please enter it again',
  emptyAccount: 'Account number cannot be spaces...Please enter it...',
  fromYear: 'From year cannot be blank...please enter it ..',
  fromMonth: 'From month cannot be blank..please enter it...',
  toYear: 'To Date cannot be blank...please enter it ..',
  toMonth: 'To month cannot be blank..please enter it...',
  // errNoReportFound (:1414) — the legacy's outcome when every month's index
  // came back without the account.
  noReport: 'No report found for this account for a given period',
  // The status-bar text on success (:1409).
  extracted: 'Statement extracted successfully.....',
} as const

const digitsOnly = (value: string) => value.replace(/\D/g, '')

/** The legacy names the archive by month; "202403" -> "March 2024". */
function monthLabel(yyyymmdd: string): string {
  if (!/^\d{8}$/.test(yyyymmdd)) return yyyymmdd
  const date = new Date(
    Number(yyyymmdd.slice(0, 4)),
    Number(yyyymmdd.slice(4, 6)) - 1,
    Number(yyyymmdd.slice(6, 8)),
  )
  return date.toLocaleDateString('en-GB', { month: 'long', year: 'numeric' })
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

/** One statement's header block and transaction table. */
function StatementCard({ statement }: { statement: Statement }) {
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
          <div className="text-end text-xs text-muted-soft">
            {/* Which archive this came from — the System that was selected,
                echoed back by the server. Redundant on screen while the
                selector is in view, but it is what makes a saved or printed
                sheet self-describing, and nothing in the legacy says what
                separates the two archives. */}
            <span className="rounded-md border border-edge px-2 py-0.5 font-medium text-ink-soft">
              {s.source} archive
            </span>
            {s.pageCount > 1 && <p className="mt-1">{s.pageCount} printed pages</p>}
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
                const narrative = [
                  line.narrative1,
                  line.narrative2,
                  line.narrative3,
                  line.narrative4,
                ].filter((n) => n.trim() !== '')
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

export default function HistoricalStatement({
  account,
  deletedAccountRoute = false,
  onExit,
}: {
  /** Absent on the deleted-account route — there is no grid row to carry one. */
  account?: Account
  /**
   * The legacy's frmHistStmt.tag = "D" (frmCustomerSearch.frm:1177): the same
   * form opened from the SEARCH screen instead of the account grid, to produce
   * statements for accounts that no longer exist.
   */
  deletedAccountRoute?: boolean
  onExit: () => void
}) {
  // frmAccount.frm:852-853 copies the account's GL branch and number onto the
  // form; the account number is display-only there (txtAccNo.Enabled = 0). On
  // the deleted-account route there is nothing to copy, so both are typed.
  const canKeyAccount = deletedAccountRoute && hasAuthority('~87')
  const [accNo, setAccNo] = useState(account?.accountNumber ?? '')
  const [branchCode, setBranchCode] = useState(account?.branchCode ?? '')
  // Defaults to BM: it is the archive that holds the statements the legacy
  // screen itself produced, so an operator who never touches the selector gets
  // what the legacy would have given them.
  const [system, setSystem] = useState<StatementSystem>('BM')
  const [form, setForm] = useState({
    fromMonth: '',
    fromYear: '',
    // Form_Load (:1195-1197) hardcodes these, having COMMENTED OUT the
    // Year(Date)/Month(Date) version above them: "since Finacle is implemented
    // on Jul'2009, historical end date is defaulted to Jul.2009". The BM
    // archive stops at the Finacle cutover, so today's date would default the
    // range's upper half to months that cannot hold a statement.
    toMonth: LAST_ARCHIVED_MONTH,
    toYear: LAST_ARCHIVED_YEAR,
  })
  const [statements, setStatements] = useState<Statement[] | null>(null)
  const [generating, setGenerating] = useState(false)
  const toast = useToast()

  // Legacy disableButtons (:1570): ANY edit re-enables Generate and kills
  // View/Print, so a report can never be shown against a changed form.
  const set = (key: keyof typeof form, value: string) => {
    setForm((f) => ({ ...f, [key]: value }))
    setStatements(null)
  }

  /** cmdGenerate_Click (:686) validation, in the legacy's own order. */
  const validate = (): string | null => {
    if (branchCode.trim().length !== 4) return MSG.branchCode
    if (accNo.trim() === '') return MSG.emptyAccount
    if (form.fromYear === '') return MSG.fromYear
    if (form.fromMonth === '') return MSG.fromMonth
    if (form.toYear === '') return MSG.toYear
    if (form.toMonth === '') return MSG.toMonth
    return null
  }

  const handleGenerate = async () => {
    const problem = validate()
    if (problem) {
      toast.warn(problem)
      return
    }
    setGenerating(true)
    try {
      const rows = await api.historicalStatements(accNo.trim(), {
        branchCode: branchCode.trim(),
        fromYearMonth: `${form.fromYear}${form.fromMonth}`,
        toYearMonth: `${form.toYear}${form.toMonth}`,
        system,
        // The route is a server-side decision, not just a screen mode: it
        // skips the staff-branch rule and adds the still-exists refusal.
        ...(deletedAccountRoute ? { deletedAccount: 'true' } : {}),
      })
      // reportFoundFlag (:1383, :1414): no statement in any month is not an
      // error, it is "no report found", and View/Print stay disabled.
      if (rows.length === 0) {
        setStatements(null)
        toast.warn(MSG.noReport)
        return
      }
      setStatements(rows)
      toast.success(MSG.extracted)
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : String(e))
    } finally {
      setGenerating(false)
    }
  }

  const showBranchCode = system === 'PDP' || deletedAccountRoute
  const hasReport = statements !== null && statements.length > 0
  const lineCount = (statements ?? []).reduce((n, s) => n + s.lines.length, 0)

  const secondaryBtn =
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft ' +
    'shadow-xs transition-colors hover:bg-surface-muted ' +
    'disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft'

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">{t('Account')}</p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
          {t('Historical Statement Printing')}
        </h1>
      </div>

      <div className="rounded-2xl border border-edge bg-surface p-5 shadow-sm sm:p-6">
        {/* Above the legacy fields and separated from them, because it does not
            narrow the enquiry the way they do — it picks WHICH ARCHIVE the
            enquiry runs against: BM and PDP are separate sets of tables, and a
            statement in one need not be in the other. Changing it invalidates
            any report on screen, same as editing a field (legacy
            disableButtons, :1570). */}
        <div className="mb-5 border-b border-edge-soft pb-5">
          <Field label="System" htmlFor="system" className="w-40">
            <Select
              id="system"
              options={SYSTEMS}
              value={system}
              onChange={(e) => {
                setSystem(e.target.value as StatementSystem)
                setStatements(null)
              }}
            />
          </Field>
        </div>

        <div className="grid gap-x-6 gap-y-4 sm:grid-cols-2 lg:grid-cols-4">
          {/* Branch Code filters the PDP header query and nothing else, so it is
              only worth showing for PDP. It is still SENT for BM — the value
              comes off the grid row and the server still validates it and keys
              the staff-branch rule on it — it just has nothing to control there.
              The exception is the deleted-account route: no grid row means no
              branch to carry, so hiding the box would leave the operator unable
              to satisfy a 4-character rule they cannot see. */}
          {showBranchCode && (
            <Field label="Branch Code" htmlFor="branchCode">
              <TextInput
                id="branchCode"
                value={branchCode}
                maxLength={4}
                inputMode="numeric"
                onChange={(e) => {
                  setBranchCode(digitsOnly(e.target.value))
                  setStatements(null)
                }}
                placeholder="0000"
              />
            </Field>
          )}

          {/* txtAccNo.Enabled = 0 by default — carried from the grid. The
              deleted-account route enables it, and only for ~87
              (frmCustomerSearch.frm:1179-1181): without that authority the
              legacy leaves the box disabled, so the route cannot be used. */}
          <Field label="Account Number" htmlFor="accNo">
            {canKeyAccount ? (
              <TextInput
                id="accNo"
                value={accNo}
                maxLength={14}
                inputMode="numeric"
                placeholder={t('14 digits')}
                onChange={(e) => {
                  setAccNo(digitsOnly(e.target.value))
                  setStatements(null)
                }}
              />
            ) : (
              <ReadOnlyInput
                id="accNo"
                value={accNo}
                readOnly
                title={
                  deletedAccountRoute
                    ? 'Keying an account here requires authority ~87'
                    : undefined
                }
              />
            )}
          </Field>

          <Field label="From Date (month / year)" htmlFor="fromMonth">
            <div className="flex gap-2">
              <div className="w-24 shrink-0">
                <Select
                  id="fromMonth"
                  options={MONTHS}
                  value={form.fromMonth}
                  placeholder="MM"
                  onChange={(e) => set('fromMonth', e.target.value)}
                />
              </div>
              <div className="w-28 shrink-0">
                <TextInput
                  aria-label={t('From year')}
                  inputMode="numeric"
                  value={form.fromYear}
                  maxLength={4}
                  onChange={(e) => set('fromYear', digitsOnly(e.target.value))}
                  placeholder="YYYY"
                />
              </div>
            </div>
          </Field>

          <Field label="To Date (month / year)" htmlFor="toMonth">
            <div className="flex gap-2">
              <div className="w-24 shrink-0">
                <Select
                  id="toMonth"
                  options={MONTHS}
                  value={form.toMonth}
                  placeholder="MM"
                  onChange={(e) => set('toMonth', e.target.value)}
                />
              </div>
              <div className="w-28 shrink-0">
                <TextInput
                  aria-label={t('To year')}
                  inputMode="numeric"
                  value={form.toYear}
                  maxLength={4}
                  onChange={(e) => set('toYear', digitsOnly(e.target.value))}
                  placeholder="YYYY"
                />
              </div>
            </div>
          </Field>
        </div>

        {/* The legacy asks for months and silently covers whole months. Saying
            so costs nothing and stops the boundary being rediscovered later. */}
        {form.fromMonth && form.fromYear && form.toMonth && form.toYear && (
          <p className="mt-4 text-xs text-muted">
            Covers whole months — {form.fromMonth}/{form.fromYear} to {form.toMonth}/{form.toYear}{' '}
            inclusive.
          </p>
        )}

        <div className="mt-5 flex flex-wrap items-center gap-3 border-t border-edge-soft pt-4">
          <button
            type="button"
            onClick={handleGenerate}
            disabled={generating}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong disabled:cursor-not-allowed disabled:bg-faint"
          >
            {generating ? t('Generating…') : t('Generate Stmt')}
          </button>

          {/* Legacy cmdPrintStmt shells the spool file to the printer in
              landscape; in the browser that is window.print() over the sheet
              rendered below. */}
          <button
            type="button"
            disabled={!hasReport}
            onClick={() => window.print()}
            title={hasReport ? undefined : 'Generate a statement first'}
            className={secondaryBtn}
          >
            {t('Print Statement')}
          </button>

          <button
            type="button"
            onClick={onExit}
            className="ms-auto rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
          >
            {t('Exit')}
          </button>
        </div>
      </div>

      {hasReport && (
        <>
          <p className="mt-6 text-sm text-muted">
            {statements!.length} statement{statements!.length === 1 ? '' : 's'} · {lineCount}{' '}
            transaction{lineCount === 1 ? '' : 's'}
          </p>
          <div className="mt-3 space-y-5">
            {statements!.map((s) => (
              <StatementCard key={`${s.source}-${s.stmtDate}-${s.stmtNum}`} statement={s} />
            ))}
          </div>
        </>
      )}

      {/* Print-only sheet: one table per statement, landscape, mirroring the
          legacy's printed layout. */}
      {hasReport && (
        <section className="print-sheet print-landscape" aria-hidden="true">
          <h1>Historical Statement — {accNo}</h1>
          <p className="print-meta">
            {system} archive · Branch {branchCode} · {form.fromMonth}/{form.fromYear} to{' '}
            {form.toMonth}/{form.toYear} · Printed {new Date().toLocaleString('en-GB')}
          </p>
          {statements!.map((s) => (
            <table key={`${s.source}-${s.stmtDate}-${s.stmtNum}`} className="page-break">
              <caption>
                {monthLabel(s.stmtDate)}
                {s.stmtNum && ` — statement ${s.stmtNum}`} · {s.custName} · {s.branchCode}{' '}
                {s.branchName} · {s.crncy}
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
                    <td>
                      {[line.narrative1, line.narrative2, line.narrative3, line.narrative4]
                        .filter((n) => n.trim() !== '')
                        .join(' / ')}
                    </td>
                    <td className="right">{formatPlainAmount(line.drAmt)}</td>
                    <td className="right">{formatPlainAmount(line.crAmt)}</td>
                    <td className="right">
                      {formatPlainAmount(line.runBal)} {line.runBalType}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          ))}
        </section>
      )}
    </main>
  )
}
