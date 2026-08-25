import { useState } from 'react'
import { Field, TextInput, Select } from '../components/fields.tsx'
import { useToast } from '../components/Toast.tsx'
import { api } from '../api.ts'
import { formatDate, todayYyyymmdd } from '../schema/helpers.ts'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmMerchantStmt.frm ("Merchant Statement Printing", the
// frmEnquiry cmdMerchant button, authority ~81).
//
// THE ROWS HAVE NO REAL SOURCE. The legacy screen does not talk to cbcmssrv at
// all: Form_Load reads its own mrchdata.ini (HOST=ndev, PORT=8200) and opens a
// second Winsock to the acquiring/POS system, which returns the statement
// already rendered as 150-char print lines. QUERY-SPECS §21 records the same
// verdict from the C sweep — role 81 is all that exists here; there is no
// merchant Denodo view and no merchant table in the archival dictionary.
//
// /api/merchant/statement is therefore backed by MockMerchantRepository, which
// stands in for that external system rather than for a database. The rows are
// synthetic; the banner below says so on screen. Everything else — the form,
// the validation order, the month shift, the paging, View and Print — is ported
// from the legacy and works unchanged once a real acquirer client replaces the
// mock.

const STMT_TYPES = [
  { key: 'item', code: '0', label: 'Itemwise' },
  { key: 'group', code: '1', label: 'Groupwise' },
  { key: 'chain', code: '2', label: 'Chain' },
  { key: 'outlet', code: '3', label: 'Outlet' },
] as const

type StmtKey = (typeof STMT_TYPES)[number]['key']

const MONTHS = Array.from({ length: 12 }, (_, i) => String(i + 1).padStart(2, '0'))

// Legacy message text, transcribed from the inline VB comments beside each
// MsgBox in frmMerchantStmt.frm — the errXxx(UserLang) string table itself is
// not in the source dump, so these comments are the only record of the wording.
const MSG = {
  // errSpaceAccNo — the legacy really does say "Account Number" on the merchant
  // number field; it reuses the account message rather than a merchant one.
  emptyMerchantNo: 'Account Number cannot be empty..Please enter',
  invalidFromDate: 'From Date is blank or Incomplete From Date',
  invalidToDate: 'To_Date is blank or Incomplete To Date',
  invalidMerchantNo: 'Invalid Merchant no.. Please check and correct....',
  noStatement: 'No report found for this merchant for the given period',
} as const

const isLeap = (y: number) => (y % 4 === 0 && y % 100 !== 0) || y % 400 === 0

// globalFunctions.bas:4734 — lastDay("YYYYMM") -> "DD".
function lastDay(yyyymm: string): string {
  const days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  const month = Number(yyyymm.slice(4, 6))
  if (month === 2 && isLeap(Number(yyyymm.slice(0, 4)))) return '29'
  return String(days[month - 1]).padStart(2, '0')
}

// globalFunctions.bas:2902 — validDate("YYYYMMDD").
function validDate(yyyymmdd: string): boolean {
  const year = Number(yyyymmdd.slice(0, 4))
  const month = Number(yyyymmdd.slice(4, 6))
  const day = Number(yyyymmdd.slice(6, 8))
  if (!year || month < 1 || month > 12 || day < 1) return false
  return day <= Number(lastDay(yyyymmdd.slice(0, 6)))
}

// frmMerchantStmt.frm:988 — incMonth("YYYYMM") rolls 12 into January of YYYY+1.
function incMonth(yyyymm: string): string {
  const year = Number(yyyymm.slice(0, 4))
  const month = Number(yyyymm.slice(4, 6))
  if (month === 12) return `${year + 1}01`
  return `${year}${String(month + 1).padStart(2, '0')}`
}

/**
 * The request the legacy builds in formatMerchRequest (:863) — kept as a real
 * function because it encodes the one piece of behaviour a reader would
 * otherwise never guess: BOTH dates are pushed forward one month before they go
 * on the wire. Typing Jan 2024 -> Mar 2024 requests 20240201 -> 20240430.
 *
 * userId is 10 chars and merchantNo 16, both LEFT-justified and blank-padded
 * (Format masks "!@@@@@@@@@@" / "!@@@@@@@@@@@@@@@@"). The literal msgLen
 * "00386" in the legacy never reaches the wire — lines 401-402 overwrite the
 * first 6 bytes with the actual computed length — so it is not modelled here.
 */
interface MerchantRequest {
  service: '00'
  lastTransPtr: string
  stmtType: string
  merchantNo: string
  fromDate: string
  toDate: string
}

function formatMerchRequest(
  merchantNo: string,
  fromYyyymm: string,
  toYyyymm: string,
  stmtType: string,
  lastTransPtr: string,
): MerchantRequest {
  const to = incMonth(toYyyymm)
  return {
    service: '00',
    lastTransPtr,
    stmtType,
    merchantNo: merchantNo.trim().padEnd(16),
    fromDate: `${incMonth(fromYyyymm)}01`,
    toDate: `${to}${lastDay(to)}`,
  }
}

/**
 * Fetches the statement's print lines for one request page.
 *
 * The contract mirrors parseMerchStmtMessage (:893) and generateMerchStmt
 * (:475): the reply carries lastRecCount, completionFlag and the page's
 * 150-char lines. The caller re-sends with lastRecCount as the next pointer
 * while completionFlag <> "1", appending every line. Nothing is parsed out of
 * a line — the acquiring system does the formatting, pagination (Chr(12) page
 * breaks) and totalling, exactly as the legacy's merchant server did.
 */
async function fetchStatement(req: MerchantRequest): Promise<{
  lines: string[]
  lastRecCount: string
  completionFlag: string
}> {
  const page = await api.merchantStatement({
    merchantNo: req.merchantNo.trim(),
    stmtType: req.stmtType,
    fromDate: req.fromDate,
    toDate: req.toDate,
    lastTransPtr: req.lastTransPtr,
  })
  return {
    lines: page.lines,
    lastRecCount: page.lastRecCount,
    completionFlag: page.completionFlag,
  }
}

// The legacy loops until completionFlag = "1" with no cap. MAX_PAGES bounds a
// runaway server here for the same reason TransactionEnquiry does, and hitting
// it is reported rather than silently truncating the statement.
const MAX_PAGES = 500

const initialForm = {
  merchantNo: '',
  fromMonth: '',
  fromYear: '',
  // Form_Load (:653-654) seeds only the To date with the current month/year.
  toMonth: String(new Date().getMonth() + 1).padStart(2, '0'),
  toYear: String(new Date().getFullYear()),
}

export default function MerchantStatement({ onExit }: { onExit: () => void }) {
  const [form, setForm] = useState(initialForm)
  const [stmtType, setStmtType] = useState<StmtKey>('item')
  const [lines, setLines] = useState<string[] | null>(null)
  const [generating, setGenerating] = useState(false)
  const toast = useToast()

  // Legacy disableButton (:970): ANY edit re-enables Generate and kills Print,
  // so a report can never be printed against a changed form.
  const set = (key: keyof typeof initialForm, value: string) => {
    setForm((f) => ({ ...f, [key]: value }))
    setLines(null)
  }

  const setType = (key: StmtKey) => {
    setStmtType(key)
    setLines(null)
  }

  /**
 * The spool file cut into its printed PAGES.
 *
 * <p>The server plants a form feed (Chr(12)) at the start of every line that
 * began a new page on the legacy's printer, exactly as cmdPrintStmt_Click read
 * them back. Splitting there is what lets one page be separated from the next —
 * by a rule and a gap on screen, by an actual sheet of paper in print. Rendered
 * as one run instead, page 2's header butts straight onto page 1's last
 * transaction with nothing between them.
 *
 * <p>It also gets the control character itself off the screen, and the break
 * onto an element that can carry one: `break-before` is a property of BLOCK
 * boxes, and the spans this used to emit inside one <pre> were inline, so the
 * page break it asked for was never honoured.
 */
function spoolPages(lines: string[]): string[][] {
  const pages: string[][] = []
  for (const line of lines) {
    if (line.startsWith('\f') || pages.length === 0) pages.push([])
    pages[pages.length - 1].push(line.replace(/^\f/, ''))
  }
  return pages
}

const digitsOnly = (value: string) => value.replace(/\D/g, '')

  /**
   * cmdGenerate_Click (:322) validation, in the legacy's own order.
   *
   * The length rules are deliberately asymmetric and are reproduced as-is:
   *   Itemwise      leading digit -> exactly 12 or 16; leading "S1" -> exactly 8;
   *                 any other non-numeric prefix -> unchecked
   *   Chain/Outlet  exactly 16
   *   Groupwise     no length check at all
   */
  const validate = (): string | null => {
    const merchantNo = form.merchantNo.trim()
    if (merchantNo.length === 0) return MSG.emptyMerchantNo
    if (form.fromMonth === '' || form.fromYear === '') return MSG.invalidFromDate
    if (form.toMonth === '' || form.toYear === '') return MSG.invalidToDate

    if (stmtType === 'item') {
      if (/^\d/.test(merchantNo)) {
        if (merchantNo.length !== 12 && merchantNo.length !== 16) return MSG.invalidMerchantNo
      } else if (merchantNo.slice(0, 2).toUpperCase() === 'S1') {
        if (merchantNo.length !== 8) return MSG.invalidMerchantNo
      }
    } else if (stmtType === 'chain' || stmtType === 'outlet') {
      if (merchantNo.length !== 16) return MSG.invalidMerchantNo
    }

    if (!validDate(`${form.fromYear}${form.fromMonth}01`)) return MSG.invalidFromDate
    if (!validDate(`${form.toYear}${form.toMonth}01`)) return MSG.invalidToDate
    return null
  }

  const handleGenerate = async () => {
    const problem = validate()
    if (problem) {
      toast.warn(problem)
      return
    }

    const code = STMT_TYPES.find((st) => st.key === stmtType)!.code
    setGenerating(true)
    try {
      // generateMerchStmt (:475): page until completionFlag = "1", appending
      // every batch's lines. lastTransPtr starts at "00000" (:396).
      const all: string[] = []
      let pointer = '00000'
      let page = 0
      let complete = false
      while (!complete && page < MAX_PAGES) {
        const req = formatMerchRequest(
          form.merchantNo,
          `${form.fromYear}${form.fromMonth}`,
          `${form.toYear}${form.toMonth}`,
          code,
          pointer,
        )
        const r = await fetchStatement(req)
        all.push(...r.lines)
        pointer = r.lastRecCount
        complete = r.completionFlag === '1'
        page += 1
      }

      // reportFoundFlag (:486-488): no rows across every page is not an error,
      // it is "no report found", and Print stays disabled.
      if (all.length === 0) {
        toast.warn(MSG.noStatement)
        return
      }
      setLines(all)
      if (!complete) {
        toast.warn(
          `Stopped after ${all.length} lines — the server did not signal completion. ` +
            'Narrow the period; the report below is partial.',
        )
      } else {
        toast.success(`Statement generated — ${all.length} lines.`)
      }
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : String(e))
    } finally {
      setGenerating(false)
    }
  }

  const hasReport = lines !== null && lines.length > 0
  // What actually went on the wire, shown so the month shift is visible rather
  // than silent. Only meaningful once both halves of a date are filled in.
  const wire =
    form.fromMonth && form.fromYear && form.toMonth && form.toYear
      ? formatMerchRequest(
          form.merchantNo,
          `${form.fromYear}${form.fromMonth}`,
          `${form.toYear}${form.toMonth}`,
          STMT_TYPES.find((st) => st.key === stmtType)!.code,
          '00000',
        )
      : null

  const secondaryBtn =
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft ' +
    'shadow-xs transition-colors hover:bg-surface-muted ' +
    'disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft'

  return (
    <main className="mx-auto max-w-6xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">{t('Merchant')}</p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
          {t('Merchant Statement Printing')}
        </h1>
      </div>

      {/* Persistent status banner, not a toast: this is a standing condition of
          the screen, not a response to an action. Matches the HistoryBanner
          convention for state that stays true while the screen is open. */}
      <div className="mb-5 rounded-2xl border border-warn/40 bg-warn-soft px-4 py-3 text-sm text-warn sm:px-5">
        <p className="font-semibold">{t('Demo data — no acquiring system connected')}</p>
        {/* One sentence with the two code names as placeholders. Splitting it
            around <code> elements made it untranslatable: the clauses do not
            fall in that order in Arabic. */}
        <p className="mt-0.5">
          {t(
            'These statements are generated by {repo}, which stands in for the acquiring/POS system the legacy reaches over its own {ini} host:port. There is no merchant view in Denodo and no merchant table in the archival schema, so every figure below is synthetic.',
            { repo: 'MockMerchantRepository', ini: 'mrchdata.ini' },
          )}
        </p>
      </div>

      <div className="rounded-2xl border border-edge bg-surface p-5 shadow-sm sm:p-6">
        <div className="grid gap-x-6 gap-y-4 sm:grid-cols-2 lg:grid-cols-3">
          <Field label="Merchant Number" htmlFor="merchantNo">
            <TextInput
              id="merchantNo"
              value={form.merchantNo}
              maxLength={16}
              onChange={(e) => set('merchantNo', e.target.value)}
              placeholder={t('12 or 16 digits, or S1 + 6')}
            />
          </Field>

          {/* Month + year sit side by side as they do on the legacy form. Both
              controls carry w-full from the shared field styles, so the widths
              live on wrappers with shrink-0 — otherwise the year input squeezes
              the month select until its value is clipped. */}
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

        {/* frameReportType — four mutually exclusive options, Itemwise default. */}
        <fieldset className="mt-5 border-t border-edge-soft pt-4">
          <legend className="sr-only">{t('Statement Type')}</legend>
          <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
            {t('Statement Type')}
          </p>
          <div className="flex flex-wrap items-center gap-x-6 gap-y-2">
            {STMT_TYPES.map((st) => (
              <label key={st.key} className="flex items-center gap-2 text-sm text-ink-soft">
                <input
                  type="radio"
                  name="stmtType"
                  value={st.key}
                  checked={stmtType === st.key}
                  onChange={() => setType(st.key)}
                  className="h-4 w-4 accent-primary"
                />
                {t(st.label)}
              </label>
            ))}
          </div>
        </fieldset>

        {/* The month shift is invisible in the legacy — the operator types one
            period and a different one is requested. Surfacing it costs nothing
            and stops it being rediscovered as a bug later. */}
        {wire && (
          <p className="mt-4 text-xs text-muted">
            {t('Requests')} <span className="font-medium tabular-nums text-ink-soft">{wire.fromDate}</span>{' '}
            to <span className="font-medium tabular-nums text-ink-soft">{wire.toDate}</span> — the
            legacy advances both dates one month (formatMerchRequest).
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

          {/* The legacy's View shells WordPad on c:\merchStmt\mrchstmt.prt,
              because there the report was a FILE. Here it is the screen: a
              generated statement is on it, so there is nothing to reveal and
              no View button to reveal it with. Print prints what is already
              there, as on the other statement screens. */}
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

      {/* The spooled report — server-rendered fixed-width lines, shown as-is in
          a monospace block because there are no columns to parse out — and the
          ONLY thing that prints. It needs no heading of its own: the spool file
          carries its own, "MERCHANT STATEMENT - <TYPE>" with the merchant and
          the period, repeated at the top of every page. Not the page number —
          that is the one field the header does NOT carry, and the footer below
          supplies it.

          Landscape, as cmdPrintStmt_Click printed it (Courier New 10pt,
          vbPRORLandscape), and each line the server prefixed with Chr(12) — a
          form feed — starts a new sheet. That is why the lines are rendered one
          span each rather than joined: the marker has to survive as a break, and
          the control character itself must not reach the screen. */}
      {hasReport && (
        <section className="print-page print-landscape mt-5 overflow-x-auto print-expand rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          {/* The spool arrives already paginated — the acquiring system decides
              where a page ends and marks it with a form feed — so unlike the
              statement screens nothing has to be cut here. What was missing is
              the number: the header the spool repeats at the top of every page
              deliberately carries none (MockMerchantRepository.headerLine), and
              once the pages are separate sheets a reader has no way to tell one
              from the next. print-per-page makes each page its own sheet and
              pins its number to the foot of it. */}
          <div className="print-per-page">
            {spoolPages(lines!).map((page, i, all) => (
              <div
                key={i}
                // Every page after the first is set off from the one above it:
                // a rule and a gap on screen, its own sheet in print (see
                // .page-break in index.css, which also drops the rule — the
                // sheet edge is the separator there — and supplies the top
                // margin the page box no longer has).
                className={i > 0 ? 'page-break mt-7 border-t border-edge-soft pt-7' : ''}
              >
                <pre className="whitespace-pre font-mono text-xs leading-5 text-ink">
                  {page.join('\n')}
                </pre>
                {/* The sheet's own line: the day the statement was produced on
                    the left, which sheet you are holding on the right. The
                    spool text carries neither — the acquiring system formats
                    the page, and its header deliberately repeats the same
                    fields on every one of them. */}
                <footer className="mt-2 flex items-baseline justify-between gap-4 text-xs text-muted-soft">
                  <span>
                    <span className="uppercase tracking-wider">{t('Statement Date')}</span>
                    {' - '}
                    <span className="font-medium text-ink">{formatDate(todayYyyymmdd())}</span>
                  </span>
                  <span className="shrink-0">
                    {t('Page {page} of {pages}', { page: i + 1, pages: all.length })}
                  </span>
                </footer>
              </div>
            ))}
          </div>
        </section>
      )}

    </main>
  )
}
