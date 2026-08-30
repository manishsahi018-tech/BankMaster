import { useState } from 'react'
import { Field, TextInput, Select } from '../components/fields.tsx'
import { useToast } from '../components/Toast.tsx'
import { StatementCard, statementKey } from '../components/StatementCard.tsx'
import { packLocale } from '../components/statementLocale.ts'
import { paginateStatements } from '../components/statementPages.ts'
import type { HistoricalStatement as Statement } from '../api.ts'
import { api } from '../api.ts'
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
// PDP Statements — the OTHER archive DB #3 holds.
//
// THIS SCREEN HAS NO LEGACY FORM. frmHistStmt read one Btrieve index tree keyed
// on the account, and the "PDP" name appears nowhere in the VB6, the C or the
// archival dictionary — it is the second header/detail table pair in DB #3,
// identified by column shape (see JdbcStatementRepository). So the screen is
// designed rather than ported, and the design is deliberately the Historical
// Statement Printing screen's: same month/year range controls, same validation
// order, same messages wherever the input is the same one, same result cards.
// An operator who knows that screen knows this one.
//
// WHAT IS GENUINELY DIFFERENT, and the whole reason it is a separate screen
// rather than a selector on the other one: the PDP header carries CUST_NUM,
// which the BM header does not. That means the enquiry can start from a
// CUSTOMER instead of from one account, and its answer can therefore span
// SEVERAL accounts — every account of that customer with a PDP statement in the
// period. Nothing on the Historical screen can express that.
//
// The two are EXCLUSIVE, by request: one or the other, never both. So the
// screen keys off exactly one identifier and the operator is never composing a
// pair that has to belong together — keying the one disables AND empties the
// other rather than waiting to refuse the combination at Generate.
//
// Branch Code belongs to the CUSTOMER route and only to it. It is a real
// predicate there, not the carried-from-the-grid value it is on the Historical
// screen: the PDP header is branch-filtered, and a customer number without a
// branch would sweep every branch. An account number identifies its own
// statements, so the account route asks for no branch — which makes the screen
// two self-contained routes rather than one form with an optional half:
//
//   branch + customer number   →  every account that customer holds
//   account number             →  that one account
//
// Touching either route greys out and clears everything the OTHER route needs,
// so the operator only ever has one route's worth of input in front of them —
// and a branch code counts as touching the customer route, because it is half
// of it. Clearing every box on the screen puts both routes back within reach.
//
// ACCT_NUM is 19 here, not the 14 the rest of the app keys. That is the PDP
// table's own width — the BM archive and the online gateway both hold 14 — so
// the limit belongs to this screen alone and must not be copied outward.

const MONTHS = Array.from({ length: 12 }, (_, i) => String(i + 1).padStart(2, '0'))

/**
 * What the sheet is called — the heading printed at the top of it AND the name
 * the browser saves it under, from the one string so the two cannot disagree.
 */
const DOCUMENT_NAME = 'PDP Account Statement'

/**
 * Same default as the Historical screen (frmHistStmt.frm:1195-1197): Finacle
 * went live in July 2009 and the archive stops at that cutover, so today's date
 * would default the range's upper half to months that cannot hold a statement.
 */
const LAST_ARCHIVED_YEAR = '2009'
const LAST_ARCHIVED_MONTH = '07'

// The first four are the Historical screen's own messages, transcribed there
// from the inline comments beside each MsgBox in frmHistStmt.frm. Reused
// verbatim so the same mistake reads the same on both screens; the server
// raises the identical strings, these are only the client-side shortcut.
const ACCOUNT_LENGTH = 19

const MSG = {
  branchCode: 'Branch Code should be 4 characters..Please enter it again',
  fromYear: 'From year cannot be blank...please enter it ..',
  fromMonth: 'From month cannot be blank..please enter it...',
  toYear: 'To Date cannot be blank...please enter it ..',
  toMonth: 'To month cannot be blank..please enter it...',
  // New — this screen's own inputs. Worded like the ones above them.
  custOrAccount:
    'Customer number or account number cannot be spaces...Please enter one of them...',
  bothKeyed: 'Enter either a customer number or an account number, not both',
  noReport: 'No report found for this account for a given period',
  extracted: 'Statement extracted successfully.....',
} as const

const digitsOnly = (value: string) => value.replace(/\D/g, '')

export default function PdpStatement({ onExit }: { onExit: () => void }) {
  const [form, setForm] = useState({
    branchCode: '',
    custNo: '',
    accNo: '',
    fromMonth: '',
    fromYear: '',
    toMonth: LAST_ARCHIVED_MONTH,
    toYear: LAST_ARCHIVED_YEAR,
  })
  const [statements, setStatements] = useState<Statement[] | null>(null)
  const [generating, setGenerating] = useState(false)
  const [downloading, setDownloading] = useState(false)
  const toast = useToast()

  // Legacy disableButtons (frmHistStmt.frm:1570): ANY edit invalidates the
  // report on screen, so what is displayed can never belong to a changed form.
  //
  // On top of that, touching a box on either route CLEARS the other route's
  // boxes. Greying them out alone would leave a stale value sitting in a
  // disabled input that the operator can see but not correct — and if they then
  // cleared their way back, that old value would come alive again and key an
  // enquiry nobody meant to ask. Emptying the other route makes the switch
  // total: what is on screen is always exactly one route's worth of input.
  const set = (key: keyof typeof form, value: string) => {
    const cleared: Partial<typeof form> =
      key === 'branchCode' || key === 'custNo'
        ? { accNo: '' }
        : key === 'accNo'
          ? { branchCode: '', custNo: '' }
          : {}
    setForm((f) => ({ ...f, ...cleared, [key]: value }))
    setStatements(null)
  }

  // Exactly one route at a time: touching either route locks out AND empties
  // the other's boxes. A branch code counts as the customer route just as the
  // customer number does — the two are one route together, so keying either
  // half of it is what greys out the account number. The rule shows up as
  // something the form will not let you do rather than as a refusal after the
  // round trip.
  const byCustomer = form.branchCode.trim() !== '' || form.custNo.trim() !== ''
  const byAccount = form.accNo.trim() !== ''

  /**
   * cmdGenerate_Click's order, except that the identifier is asked for BEFORE
   * the branch rather than after it. It has to be: until one of the two
   * identifiers is known there is no route yet, and only one of the routes
   * wants a branch at all.
   */
  const validate = (): string | null => {
    if (form.custNo.trim() === '' && form.accNo.trim() === '') return MSG.custOrAccount
    // Unreachable while the inputs disable each other, but a disabled input is
    // not a control — the same rule is enforced on the server, and this keeps
    // the message the operator sees identical either way.
    if (form.custNo.trim() !== '' && form.accNo.trim() !== '') return MSG.bothKeyed
    // Customer route only. The account route sends no branch and is not asked
    // for one.
    if (form.custNo.trim() !== '' && form.branchCode.trim().length !== 4) return MSG.branchCode
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
      const rows = await api.pdpStatements({
        // Already blank on the account route — keying an account clears it —
        // so there is nothing here to guard against.
        branchCode: form.branchCode.trim(),
        // Padded to 7 the way the search screen pads it (CustomerStaticData's
        // padStart(7, '0') before service 21) so an operator can key 1234 for
        // customer 0001234 here as they do there. If real PDP data turns out to
        // hold CUST_NUM unpadded, this is the one line to drop.
        custNo: form.custNo.trim() === '' ? '' : form.custNo.trim().padStart(7, '0'),
        accNo: form.accNo.trim(),
        fromYearMonth: `${form.fromYear}${form.fromMonth}`,
        toYearMonth: `${form.toYear}${form.toMonth}`,
      })
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

  const hasReport = statements !== null && statements.length > 0
  const rows = statements ?? []
  const lineCount = rows.reduce((n, s) => n + s.lines.length, 0)
  // A customer-number enquiry answers for every account that customer holds, so
  // say how many the report covers — otherwise a two-account result reads as
  // one account with a confusing duplicate month.
  const accountCount = new Set(rows.map((s) => s.acctNum)).size

  // The DOCUMENT's language, from PDP_STMT_HEADER's LANG_CODE — not the
  // operator's. The form above and the counts line below stay on the app
  // locale: those are the app talking to the operator, where the cards are the
  // bank talking to the customer. See statementLocale.ts.
  const docLocale = packLocale(rows)
  const docName = translate(docLocale, DOCUMENT_NAME)

  /**
   * The same statements as a workbook — one transaction per row, each carrying
   * its own statement's header (statementExport.ts).
   *
   * The form is guaranteed to still describe what is on screen: set() drops the
   * report on any edit, so the period and identifier named in the file name
   * cannot belong to a different enquiry than the rows inside it.
   *
   * A customer-route report can span several accounts, so the file is named for
   * whichever identifier was keyed rather than for one account it happens to
   * contain.
   */
  const handleDownload = async () => {
    if (!hasReport) return
    setDownloading(true)
    try {
      await downloadWorkbook(
        statementFileName(
          docName,
          form.accNo.trim() || form.custNo.trim(),
          archivedPeriod(
            `${form.fromYear}${form.fromMonth}`,
            `${form.toYear}${form.toMonth}`,
          ),
        ),
        archivedStatementSheet(rows, docName, docLocale),
      )
      toast.success(t('Statement downloaded — {txns} transactions.', { txns: lineCount }))
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : String(e))
    } finally {
      setDownloading(false)
    }
  }

  const secondaryBtn =
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft ' +
    'shadow-xs transition-colors hover:bg-surface-muted ' +
    'disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft'

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
          {t('Enquiries & Services')}
        </p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
          {t('Historical Statement Printing — PDP')}
        </h1>
      </div>

      <div className="rounded-2xl border border-edge bg-surface p-5 shadow-sm sm:p-6">
        <div className="grid gap-x-6 gap-y-4 sm:grid-cols-2 lg:grid-cols-3">
          {/* Filters the PDP header, unlike on the Historical screen where it is
              carried from the grid row and only authorises. Required by the
              CUSTOMER route and part of it — an account number narrows to one
              account on its own, so keying one greys this out with the customer
              number it goes with. */}
          <Field label="Branch Code" htmlFor="pdpBranchCode">
            <TextInput
              id="pdpBranchCode"
              value={form.branchCode}
              maxLength={4}
              inputMode="numeric"
              disabled={byAccount}
              onChange={(e) => set('branchCode', digitsOnly(e.target.value))}
              placeholder="0000"
              title={byAccount ? t('Not needed when searching by account number') : undefined}
              className={byAccount ? 'cursor-not-allowed bg-surface-muted text-muted' : ''}
            />
          </Field>

          {/* CUST_NUM exists on the PDP header alone — this box is the reason
              the screen exists. It travels with the branch above it: the two
              together are one route, the account number below is the other. */}
          <Field label="PDP Customer Number" htmlFor="pdpCustNo">
            <TextInput
              id="pdpCustNo"
              value={form.custNo}
              maxLength={7}
              inputMode="numeric"
              disabled={byAccount}
              onChange={(e) => set('custNo', digitsOnly(e.target.value))}
              placeholder={t('7 digits')}
              title={byAccount ? t('Clear the account number to search by customer') : undefined}
              className={byAccount ? 'cursor-not-allowed bg-surface-muted text-muted' : ''}
            />
          </Field>

          {/* 19, not the 14 every other account box in the app takes: PDP's
              ACCT_NUM is that wide in DB #3. */}
          <Field label="PDP Account Number" htmlFor="pdpAccNo">
            <TextInput
              id="pdpAccNo"
              value={form.accNo}
              maxLength={ACCOUNT_LENGTH}
              inputMode="numeric"
              disabled={byCustomer}
              onChange={(e) => set('accNo', digitsOnly(e.target.value))}
              placeholder={t('19 digits')}
              title={
                byCustomer ? t('Clear the branch and customer number to search by account') : undefined
              }
              className={byCustomer ? 'cursor-not-allowed bg-surface-muted text-muted' : ''}
            />
          </Field>

          <Field label="From Date (month / year)" htmlFor="pdpFromMonth">
            <div className="flex gap-2">
              <div className="w-24 shrink-0">
                <Select
                  id="pdpFromMonth"
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

          <Field label="To Date (month / year)" htmlFor="pdpToMonth">
            <div className="flex gap-2">
              <div className="w-24 shrink-0">
                <Select
                  id="pdpToMonth"
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

        <p className="mt-4 text-xs text-muted">
          {t(
            'Enter a branch code and customer number to cover every account that customer holds, or an account number on its own for one account — one route or the other, not both.',
          )}
          {form.fromMonth && form.fromYear && form.toMonth && form.toYear && (
            <>
              {' '}
              Covers whole months — {form.fromMonth}/{form.fromYear} to {form.toMonth}/
              {form.toYear} inclusive.
            </>
          )}
        </p>

        <div className="mt-5 flex flex-wrap items-center gap-3 border-t border-edge-soft pt-4">
          <button
            type="button"
            onClick={handleGenerate}
            disabled={generating}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong disabled:cursor-not-allowed disabled:bg-faint"
          >
            {generating ? t('Generating…') : t('Generate Stmt')}
          </button>

          <button
            type="button"
            disabled={!hasReport}
            onClick={() => printDocument(docName)}
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

      {/* The report region, and the ONLY thing that prints. The printout is
          this markup — the same cards, the same columns, the same wording —
          rather than a second, print-only rendering of the same statements that
          has to be kept in step with it by hand. */}
      {hasReport && (
        <div className="print-page">
          {/* Paper has to name the DOCUMENT; the screen's own <h1> names the
              screen it lives on, which means nothing once it is printed. Just
              the title: the customer, account, branch and period all appear on
              every statement card below, and repeating them here only invites
              the two to disagree. */}
          <header dir={dirOf(docLocale)} className="print-only mb-4 border-b border-edge pb-3">
            <h1 className="text-lg font-bold text-ink">{docName}</h1>
          </header>

          {/* One form for any count rather than an English singular/plural
              pair: three independent counts would need eight keys, and Arabic
              does not split two ways in the first place. */}
          {/* The report's own header line: what it covers on the left, what
              can be done with it on the right. The action bar above acts on the
              FORM — its buttons are there before there is a report and grey out
              to say so; this acts on the report itself, so it arrives and
              leaves with it. Off the paper, like the line beside it: a button
              printed onto a bank statement would be absurd. */}
          <div className="print-hidden mt-6 flex flex-wrap items-center justify-between gap-3">
            <p className="text-sm text-muted">
              {t('{stmts} statements · {accts} accounts · {txns} transactions', {
                stmts: rows.length,
                accts: accountCount,
                txns: lineCount,
              })}
            </p>
            <DownloadExcelButton onClick={handleDownload} busy={downloading} />
          </div>
          <div className="mt-3 space-y-5 print-per-page">
            {paginateStatements(rows).map((sheet, i, all) => (
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
