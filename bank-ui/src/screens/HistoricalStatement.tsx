import { useState } from 'react'
import { Field, TextInput, ReadOnlyInput, Select } from '../components/fields.tsx'
import { useToast } from '../components/Toast.tsx'
import { StatementCard, statementKey } from '../components/StatementCard.tsx'
import { paginateStatements } from '../components/statementPages.ts'
import type { Account } from '../types.ts'
import type { HistoricalStatement as Statement } from '../api.ts'
import { api } from '../api.ts'
import { hasAuthority } from '../session.ts'

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
// BRANCH CODE HAS NO BOX ON EITHER ROUTE. On the normal route it is copied
// from the grid row (frmAccount.frm:853) and the legacy shows it disabled, so
// there was never anything to type. On the DELETED-ACCOUNT route the legacy did
// let the operator key it — but look at what it then did with it: branch chose
// which Btrieve FILE to open, and DB #3 has no such partition, so for BM it is
// not a predicate at all (see JdbcStatementRepository). The one rule left that
// reads it, the staff-branch refusal, is guarded by `tag <> "D"` (:782) and so
// never fires on this route. It was a required field controlling nothing, and
// it is gone; the server drops the 4-character requirement for this route to
// match.
//
// THIS SCREEN READS THE BM ARCHIVE ONLY. DB #3 holds two header/detail pairs,
// BM and PDP; BM is the one that holds the statements this legacy screen itself
// produced, so it is what the screen asks for, always. PDP is a separate
// archive and gets its own screen — nothing here selects between them, and a
// result is never a merge of the two.
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
  // Carried from the grid row, never keyed. There is no box for it on either
  // route — see the branch-code note in the header comment — so on the
  // deleted-account route, which has no row, it is simply absent.
  const branchCode = account?.branchCode ?? ''
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
    // Only where a branch was carried. On the deleted-account route there is
    // none to carry and none to key, so there is nothing to check.
    if (!deletedAccountRoute && branchCode.trim().length !== 4) return MSG.branchCode
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
        // Fixed: this screen is the BM archive's. PDP gets its own screen.
        system: 'BM',
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

  // Branch Code is carried from the grid row and only typed on the
  // deleted-account route, where there is no row to carry it.
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
        <div className="grid gap-x-6 gap-y-4 sm:grid-cols-2 lg:grid-cols-4">
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

      {/* The report region, and the ONLY thing that prints — the printout is
          this markup rather than a second, print-only rendering that has to be
          kept in step with it by hand. Same arrangement as the PDP screen. */}
      {hasReport && (
        <div className="print-page">
          {/* Paper has to name the DOCUMENT; the screen's own <h1> names the
              screen it lives on. Just the title — the account, branch, month
              and customer all appear on every statement card below. The legacy's
              tag = "D" route prints a statement for a CLOSED account, so the
              paper says which of the two documents it is. */}
          <header className="print-only mb-4 border-b border-edge pb-3">
            <h1 className="text-lg font-bold text-ink">
              {deletedAccountRoute
                ? t('BankMaster Deleted Account Statement')
                : t('BankMaster Account Statement')}
            </h1>
          </header>

          {/* Translated through a placeholder form, like the PDP screen's — the
              English plural pair had no Arabic and showed through untranslated. */}
          <p className="print-hidden mt-6 text-sm text-muted">
            {t('{stmts} statements · {txns} transactions', {
              stmts: statements!.length,
              txns: lineCount,
            })}
          </p>
          <div className="mt-3 space-y-5 print-per-page">
            {paginateStatements(statements!).map((sheet, i, all) => (
              <StatementCard
                key={`${statementKey(sheet.statement)}-${i}`}
                statement={sheet.statement}
                lines={sheet.lines}
                continued={sheet.continued}
                page={i + 1}
                pages={all.length}
              />
            ))}
          </div>
        </div>
      )}
    </main>
  )
}
