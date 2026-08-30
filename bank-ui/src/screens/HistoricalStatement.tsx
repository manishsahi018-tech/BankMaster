import { useEffect, useRef, useState } from 'react'
import { Field, TextInput, ReadOnlyInput, Select } from '../components/fields.tsx'
import { useToast } from '../components/Toast.tsx'
import { StatementCard, statementKey } from '../components/StatementCard.tsx'
import { packLocale } from '../components/statementLocale.ts'
import { StatementAnalysisReport } from '../components/StatementAnalysis.tsx'
import { analyseStatements } from '../components/statementAnalysis.ts'
import type { StatementAnalysis } from '../components/statementAnalysis.ts'
import { paginateStatements } from '../components/statementPages.ts'
import type { Account } from '../types.ts'
import type { HistoricalStatement as Statement } from '../api.ts'
import { api } from '../api.ts'
import { codeLabel } from '../codes.ts'
import { hasAuthority } from '../session.ts'
import { printDocument } from '../print.ts'
import { downloadWorkbook } from '../xlsx.ts'
import { DownloadExcelButton } from '../components/DownloadExcelButton.tsx'
import {
  archivedPeriod,
  archivedStatementSheet,
  statementFileName,
} from '../components/statementExport.ts'

import { t, translate } from '../i18n/index.ts'
import { dirOf } from '../i18n/locale.ts'
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
// ANALYSE IS PORTED, from docs/analyse.c. The legacy shelled that compiled
// utility over the merged print file (prtall.$s! -> prtall.$a!) and read the
// result back as text — Notepad for View, portrait A4 Courier for Print. Its
// source has since turned up, so the figures are its figures rather than the
// reconstruction that stood here before: seventeen of them, over a spool it
// had to parse column by column and we read as fields. statementAnalysis.ts
// maps each one to its line in the C, and names the two places we knowingly
// diverge — leap years, which analyse.c gets wrong, and missing statements,
// which DB #3 can answer exactly where the spool could only be guessed at.
//
// The per-month table under those figures is OURS. The legacy report has no
// monthly breakdown; this is the same data the operator would otherwise read
// by paging the sheets.
//
// The four HO buttons stay out: View HO Stmt, Print HO Stmt, Analyse HO Stmt
// and View HO Analysis all read prtall.$s! / prtall.$h! out of reqPath — the
// directory the FTP request below fetched into. Nothing fetches into it now,
// so there is no file for any of them to open.
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
  // errAnalysisSuccess (:532) — the status-bar text AND the MsgBox the legacy
  // raised when analyse.exe returned. Both said the same thing, so one toast
  // carries it.
  analysisDone: 'Analysis successfully completed..',
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
  // What the sheet is called — the heading printed at the top of it AND the
  // name the browser saves it under, from the one string so the two cannot
  // disagree. One name for both routes: the tag = "D" route differs in how the
  // account is keyed, not in what comes out of the archive, and the document it
  // produces is the same BankMaster statement, so it carries the same title.
  const documentName = 'BankMaster Account Statement'
  // The analysis is its own document and saves under its own name — a folder
  // holding both must not have two files called the same thing.
  const analysisDocumentName = 'BankMaster Statement Analysis'
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

  // The DOCUMENT's language, from BM_STMT_HEADER's LANG_CODE — not the
  // operator's. The form, the buttons and the counts line stay on the app
  // locale: those are the app talking to the operator, where the cards are the
  // bank talking to the customer. See statementLocale.ts.
  //
  // The ANALYSIS is not covered. It is not the archived document — it is a
  // reading of it, computed here and never sent to anybody — so it stays in the
  // operator's language along with the rest of the screen.
  const docLocale = packLocale(statements ?? [])
  const docName = translate(docLocale, documentName)
  const [generating, setGenerating] = useState(false)
  const [downloading, setDownloading] = useState(false)
  // cmdAnalyse's output, held separately from the statements it was computed
  // from: the legacy wrote it to its own file and the View/Print Analysis
  // buttons keyed off that file existing, not off the statement's.
  const [analysis, setAnalysis] = useState<StatementAnalysis | null>(null)
  /**
   * WHICH of the two reports is on screen. They are alternatives, not
   * independent panels: View Statement shows the statement and puts the
   * analysis away, View Analysis does the reverse.
   *
   * That is what the legacy's buttons did, once you account for the medium.
   * cmdViewStmt shelled wordpad on prtall.$e! and cmdViewAnalysis shelled
   * notepad on prtall.$a! — each opened its own window IN FRONT of whatever
   * was there, so only one report ever faced the operator. Two independently
   * toggled panels stacked down one page is not that; one view at a time is.
   *
   * Starts on the statement because that is the only one that can exist first:
   * there is no analysis until Analysis has been pressed.
   */
  const [view, setView] = useState<'statement' | 'analysis'>('statement')
  /**
   * Bumped by the two View buttons, and by nothing else.
   *
   * The scroll below has to fire on every press — including a press that does
   * not change `view`, i.e. asking for the report already chosen, which should
   * still take you to it. `view` alone cannot express that, and Generate must
   * NOT scroll: it sets the view too, and yanking the page down on every
   * generate is not what the button is for.
   */
  const [viewRequest, setViewRequest] = useState(0)
  /**
   * Which report the browser is about to put on paper.
   *
   * The stylesheet reveals exactly one .print-page region and positions it
   * absolutely, leaving everything else in flow but invisible — so a second
   * report left mounted would contribute nothing but its HEIGHT, and print as
   * trailing blank sheets. Both regions therefore consult this: the one being
   * printed takes .print-page, the other is `hidden` outright.
   *
   * It is state rather than a class toggled just before window.print() because
   * the DOM has to be committed BEFORE the print dialog reads it; the effect
   * below runs after the commit, which is the guarantee a straight-line call
   * cannot make.
   */
  const [printing, setPrinting] = useState<'statement' | 'analysis' | null>(null)
  const analysisRef = useRef<HTMLDivElement>(null)
  const statementRef = useRef<HTMLDivElement>(null)
  const toast = useToast()

  /**
   * Bring the chosen report into view.
   *
   * The legacy's View buttons shelled Notepad and wordpad, so the result
   * arrived as a new window in front of everything. A panel added to a page
   * cannot do that on its own: it can sit below the fold, and a button whose
   * effect is off-screen reads as a button that does nothing. Scrolling to it
   * is what makes the click visible.
   */
  useEffect(() => {
    if (viewRequest === 0) return
    const target = view === 'analysis' ? analysisRef : statementRef
    target.current?.scrollIntoView({ behavior: 'smooth', block: 'start' })
  }, [viewRequest, view])

  /** cmdViewStmt (:1117) and cmdViewAnalysis (:1067) — one report at a time. */
  const showReport = (which: 'statement' | 'analysis') => {
    setView(which)
    setViewRequest((n) => n + 1)
  }

  useEffect(() => {
    if (printing === null) return
    let settled = false
    const done = () => {
      if (settled) return
      settled = true
      setPrinting(null)
    }
    // afterprint is the RIGHT signal, but it cannot be the only one. This flag
    // hides one of the two reports while it is set, so a signal that never
    // arrives does not merely leave a stale title — it strands the other
    // report inside a hidden div, where a later Generate renders invisibly and
    // the screen looks broken. (Headless Chrome reproduces exactly that: its
    // window.print() is a no-op and fires nothing.) So anything that means the
    // operator is back on the page clears it: the dialog closing, the window
    // regaining focus, or simply the next click or keystroke. Whichever lands
    // first wins; `settled` keeps the rest from firing a second setState.
    const events: [EventTarget, string][] = [
      [window, 'afterprint'],
      [window, 'focus'],
      [document, 'pointerdown'],
      [document, 'keydown'],
    ]
    for (const [target, type] of events) target.addEventListener(type, done, { once: true })
    printDocument(printing === 'analysis' ? t(analysisDocumentName) : docName)
    return () => {
      for (const [target, type] of events) target.removeEventListener(type, done)
    }
  }, [printing, analysisDocumentName, docName])

  // Legacy disableButtons (:1570): ANY edit re-enables Generate and kills
  // View/Print, so a report can never be shown against a changed form.
  const set = (key: keyof typeof form, value: string) => {
    setForm((f) => ({ ...f, [key]: value }))
    clearReport()
  }

  /**
   * disableButtons() (:1576) in one place: the report goes, and the analysis
   * goes with it. The legacy cleared Analyse/View Analysis/Print Analysis in
   * the same breath as View/Print Statement, and it had to — prtall.$a! was
   * computed from a spool that no longer described the form on screen.
   */
  function clearReport() {
    setStatements(null)
    setAnalysis(null)
    setView('statement')
    // Nothing is being printed once the report it was printing is gone, and a
    // flag left set here would hide the next one.
    setPrinting(null)
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
        clearReport()
        toast.warn(MSG.noReport)
        return
      }
      // enablePrintButtons (:1595) turns View/Print Statement and Analyse on
      // and View Analysis explicitly OFF: a fresh report has no analysis yet,
      // and any analysis still in hand belongs to the previous one.
      setStatements(rows)
      setAnalysis(null)
      // A fresh report is shown as a statement, and the analysis of the
      // PREVIOUS one must not be what is on screen when it lands.
      setView('statement')
      setPrinting(null)
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

  /**
   * The statement as a workbook — one transaction per row, each carrying its
   * own statement's header (statementExport.ts).
   *
   * The legacy had no counterpart, and could not have: its report was a spool
   * FILE it shelled wordpad on. What it did have was the reason for this — the
   * Analysis button, which existed because an operator needs the statement
   * ADDED UP, not just read. Analysis answers the questions the legacy's
   * analyse.exe was written to answer; this hands over the rows so the operator
   * can ask their own.
   *
   * clearReport() drops the statements on any edit to the form, so the account
   * and period named in the file name always describe the rows inside it.
   */
  const handleDownload = async () => {
    if (!hasReport) return
    setDownloading(true)
    try {
      await downloadWorkbook(
        statementFileName(
          docName,
          accNo.trim(),
          archivedPeriod(
            `${form.fromYear}${form.fromMonth}`,
            `${form.toYear}${form.toMonth}`,
          ),
        ),
        archivedStatementSheet(statements!, docName, docLocale),
      )
      toast.success(t('Statement downloaded — {txns} transactions.', { txns: lineCount }))
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : String(e))
    } finally {
      setDownloading(false)
    }
  }

  /**
   * cmdAnalyse_Click (:507), minus the shell-out. The legacy ran analyse.exe
   * over the spool and then enabled View/Print Analysis; here the computation
   * is synchronous, so the wait message it showed in between (errWaitAnalysis)
   * has nothing to cover and is not raised.
   *
   * Like the legacy, this does NOT open the result — cmdAnalyse only enabled
   * the two buttons that show it. View Analysis is still a deliberate second
   * click.
   */
  const handleAnalyse = () => {
    if (!hasReport) return
    setAnalysis(analyseStatements(statements!))
    // enablePrintButtons (:1595) leaves cmdViewAnalysis OFF: computing the
    // analysis does not display it, so the view stays where it is.
    toast.success(MSG.analysisDone)
  }

  /**
   * The two boxes the legacy filled from the account number itself: currency
   * from digits 1-2 and account type from 3-5, each looked up for its
   * description and shown as "<code>-<description>"
   * (frmAccount.frm:857-878 on the normal route, frmHistStmt.frm:758-780 on the
   * deleted-account one). The Access tables it read, currencyinfo and
   * bmledgerinfo, are the stctltabXC and stctltabMM views this build serves as
   * the `currency` and `ledger` reference sets.
   *
   * Derived as the account is typed rather than filled once. The legacy could
   * only fill them at the two moments it had an account in hand; deriving them
   * means the deleted-account route shows them while the operator keys, and
   * neither route can leave a stale pair beside a changed account number.
   */
  const currencyLabel = codeLabel('currency', accNo.slice(0, 2))
  const acctTypeLabel = codeLabel('ledger', accNo.slice(2, 5))

  // Which region is on paper, and which is merely mounted — see `printing`.
  const printingAnalysis = printing === 'analysis'
  const analysisOnScreen = analysis !== null && (view === 'analysis' || printingAnalysis)

  const secondaryBtn =
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft ' +
    'shadow-xs transition-colors hover:bg-surface-muted ' +
    'disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft'

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
          {t('Account')}
        </p>
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
                  clearReport()
                }}
              />
            ) : (
              <ReadOnlyInput
                id="accNo"
                value={accNo}
                readOnly
                title={
                  deletedAccountRoute ? 'Keying an account here requires authority ~87' : undefined
                }
              />
            )}
          </Field>

          {/* txtCurrDesc / txtAcctDesc — display-only on both routes; the
              legacy never let either be typed, they were only ever derived
              from the account number. */}
          <Field label="Currency" htmlFor="currency">
            <ReadOnlyInput id="currency" value={currencyLabel} readOnly />
          </Field>

          <Field label="Account Type" htmlFor="acctType">
            <ReadOnlyInput id="acctType" value={acctTypeLabel} readOnly />
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

        {/* THE LEGACY'S BUTTONS, in the legacy's own
            captions — taken from frmHistStmtCaption (frmHistStmt.frm:1171-1181),
            not from the .frm's design-time Caption= properties, which are stale.
            The VB6 laid them out as a 5 x 2 block with Exit centred underneath;
            here they are grouped by what they act on, which is the same three
            groups the legacy's two rows already implied — less the four Head
            Office buttons, held back for now (see the header comment).

            Csv and FTP are the two the legacy itself hid (Visible = 0 on both;
            FTP is revealed only for authority ~94, and Csv never). They are not
            on the screen this replaces, so they are not here either. */}
        <div className="mt-5 flex flex-wrap items-center gap-3 border-t border-edge-soft pt-4">
          {/* ONE DELIBERATE DEPARTURE from the legacy's gating, and the only
                one on this screen: enablePrintButtons (:1595) sets
                cmdGenerate.Enabled = False, so after a successful generate the
                legacy would not let you press it again until an edit to the
                form re-ran disableButtons. That guarded the SPOOL FILE it had
                just written — regenerating would have overwritten the thing
                View and Print were about to read. There is no file here, a
                re-run is a fresh query and nothing else, and disabling it would
                also leave a failed request needing a pointless field edit
                before it could be retried. */}
          <button
            type="button"
            onClick={handleGenerate}
            disabled={generating}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong disabled:cursor-not-allowed disabled:bg-faint"
          >
            {generating ? t('Generating…') : t('Generate Stmt')}
          </button>

          {/* cmdViewStmt (:1117) — wordpad on prtall.$e!, the converted
                spool. The report is already on the page here, so "view" is a
                matter of getting the operator to it and back: the same
                show/scroll/hide the analysis button does. It stays enabled on
                the same terms as the legacy's (enablePrintButtons :1595). */}
          <button
            type="button"
            disabled={!hasReport}
            aria-pressed={view === 'statement'}
            onClick={() => showReport('statement')}
            title={hasReport ? undefined : t('Generate a statement first')}
            className={secondaryBtn}
          >
            {t('View Statement')}
          </button>

          {/* Legacy cmdPrintStmt shells the spool file to the printer in
                landscape; in the browser that is window.print() over the sheet
                rendered below. */}
          <button
            type="button"
            disabled={!hasReport}
            onClick={() => setPrinting('statement')}
            title={hasReport ? undefined : t('Generate a statement first')}
            className={secondaryBtn}
          >
            {t('Print Statement')}
          </button>

          {/* The legacy's second row became this rule. One line reads better
                than two, but the split those rows drew — what acts on the
                statement, what acts on its analysis — is worth keeping visible,
                and a rule costs a line nothing. It folds away below sm, where
                the buttons wrap and a divider between wrapped rows would be
                pointing at nothing. */}
          <span className="mx-1 hidden h-6 w-px bg-edge sm:block" aria-hidden="true" />

          {/* cmdAnalyse — enabled by enablePrintButtons (:1595), i.e. only
                once there is a report to analyse. */}
          <button
            type="button"
            disabled={!hasReport}
            onClick={handleAnalyse}
            title={hasReport ? undefined : t('Generate a statement first')}
            className={secondaryBtn}
          >
            {t('Analysis')}
          </button>

          {/* cmdViewAnalysis — Notepad on prtall.$a! in the legacy, which is
                the analysis appearing in its own window. Here it appears above
                the statements, and the same button puts it away again: a panel
                on the page needs a way to be closed that a separate Notepad
                window did not. aria-pressed says which of the two the next
                click does, since the caption is the legacy's and stays put. */}
          <button
            type="button"
            disabled={analysis === null}
            aria-pressed={view === 'analysis'}
            onClick={() => showReport('analysis')}
            title={analysis === null ? t('Run Analysis first') : undefined}
            className={secondaryBtn}
          >
            {t('View Analysis')}
          </button>

          {/* cmdPrintAnalysis (:793) — portrait A4 Courier, and it read the
                analysis FILE, so it never depended on the analysis being open.
                Neither does this: printing reveals the report whether or not
                View Analysis has been clicked. */}
          <button
            type="button"
            disabled={analysis === null}
            onClick={() => setPrinting('analysis')}
            title={analysis === null ? t('Run Analysis first') : undefined}
            className={secondaryBtn}
          >
            {t('Print Analysis')}
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

      {/* The analysis, ABOVE the statements rather than after them. The legacy
          opened it in a Notepad window that landed in front of the operator;
          appended below a pack of statement cards it opens several screens
          down instead, and View Analysis reads as a dead button. Mounted from
          the moment it is computed so Print Analysis can reach it without it
          being on screen, and `hidden` until something asks for it.

          Which of the two reports reaches the paper is decided by print-exclude
          (a @media print rule), NOT by hiding one on screen: the flag driving
          it depends on the browser firing afterprint, and when that did not
          arrive the statement stayed hidden and Generate appeared to return
          nothing. Screen state no longer depends on it. */}
      {analysis !== null && (
        <div
          ref={analysisRef}
          /* scroll-mt-24 keeps the scroll below from parking the report's own
             heading underneath the sticky top bar. print-exclude keeps this
             report off the paper when the STATEMENT is the one printing — and
             only off the paper, never off the screen. */
          className={printingAnalysis ? 'print-page' : 'print-exclude scroll-mt-24'}
          hidden={!analysisOnScreen}
        >
          {/* No print-only document header here, unlike the statement region
              below: the report's own card is headed with the document name
              already, and a second copy of it printed the title twice. The
              statement region needs one because ITS cards are headed by month,
              not by the document. */}
          <div className="mt-6">
            <StatementAnalysisReport
              analysis={analysis}
              documentName={analysisDocumentName}
              accountNumber={accNo.trim()}
              currency={currencyLabel}
              accountType={acctTypeLabel}
            />
          </div>
        </div>
      )}

      {/* The report region, and the ONLY thing that prints — the printout is
          this markup rather than a second, print-only rendering that has to be
          kept in step with it by hand. Same arrangement as the PDP screen. */}
      {hasReport && (
        <div
          ref={statementRef}
          className={
            printingAnalysis
              ? 'print-exclude'
              : `print-page scroll-mt-24${view === 'statement' ? '' : ' screen-hidden'}`
          }
        >
          {/* Paper has to name the DOCUMENT; the screen's own <h1> names the
              screen it lives on. Just the title — the account, branch, month
              and customer all appear on every statement card below. Both routes
              print it under the one name. */}
          <header dir={dirOf(docLocale)} className="print-only mb-4 border-b border-edge pb-3">
            <h1 className="text-lg font-bold text-ink">{docName}</h1>
          </header>

          {/* Translated through a placeholder form, like the PDP screen's — the
              English plural pair had no Arabic and showed through untranslated. */}
          {/* The report's own header line: what it covers on the left, what
              can be done with it on the right. The action bar above acts on the
              FORM — enablePrintButtons (:1595) turns its buttons on and off
              because they are there before there is a report; this acts on the
              report itself, so it arrives and leaves with it. Off the paper,
              like the line beside it. */}
          <div className="print-hidden mt-6 flex flex-wrap items-center justify-between gap-3">
            <p className="text-sm text-muted">
              {t('{stmts} statements · {txns} transactions', {
                stmts: statements!.length,
                txns: lineCount,
              })}
            </p>
            <DownloadExcelButton onClick={handleDownload} busy={downloading} />
          </div>
          <div className="mt-3 space-y-5 print-per-page">
            {paginateStatements(statements!).map((sheet, i, all) => (
              <StatementCard
                key={`${statementKey(sheet.statement)}-${i}`}
                statement={sheet.statement}
                locale={docLocale}
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
