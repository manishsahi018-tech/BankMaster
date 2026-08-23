import { SectionCard } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import StatusBadge, { statusTone } from '../components/StatusBadge.tsx'
import { codeLabel } from '../codes.ts'
import {
  RoText,
  RoCombo,
  Field,
  Segmented,
  DateTriple,
  dateParts,
  labelCls,
  btnKinds,
} from '../components/legacyForm.tsx'
import type { ReactNode } from 'react'
import type { Account } from '../types.ts'

import { t } from '../i18n/index.ts'
// Legacy frmAccct.frm ("Account Maintenance") — single-account detail.
// docs/Screens/Picture8.png is a capture of this form in enquiry mode and is the
// authority for the FIELDS, their labels and their control types. Where the
// .frm's design-time captions disagree with the capture the capture wins, since
// Form_Load overwrites every caption from frmAccountCaption(n, UserLang)
// (frmAccct.frm:2421-2451) — hence "Last Update CSD" and "Supervisor Approved"
// rather than the .frm literals "Last Amend CSD Date" / "Supervisor App. Date".
//
// The LAYOUT is deliberately not the legacy's. The form is one frame of eighteen
// two-column rows, which on a 1200px page turned into a single tall slab of
// half-width boxes — most of them empty on any given account, and each a
// different width, so the rows never lined up. Here the same thirty fields are
// grouped into four cards on a uniform four-column grid, which divides evenly:
// status is 2 rows, the middle card is exactly 4x4, the audit card is one row.
// Reading order inside each card still follows the form, left to right instead
// of down two columns.
//
// The band above the cards is not in the legacy at all. It repeats the five
// facts an operator opens this screen to check, so the page has something to
// land on instead of thirty identical boxes.
//
// Statement frequency, account status, interest application and branch are
// served by /api/codes (stctltab 'SF' / 'AS' / 'IA' and stctltabBD), so their
// values come from the archive rather than from hard-coded literals.

// Blank field template — defines the screen's field set/shape. Every field
// defaults to empty so any column the backend leaves blank renders EMPTY rather
// than a fabricated value; real data (account.maintenance from api.accountDetail
// / api.accountSnapshot) overrides these.
const BLANK = {
  currencyCode: '', currencyName: '', ledgerCode: '', ledgerName: '',
  customerNo: '', customerName: '', subAccount: '', iban: '',
  intApplication: '', dormant: '', stmtFrequency: '', statementDay: '',
  accountStatus: '', otherReason: '', statusUpdReason: '', samaStatus: '',
  uniqueNo: '', uniqueSub: '', creditLimit: '', intLastRun: '', payAccountNo: '',
  acOpenDate: '', intFreqCode: '', intApplDay: '', drInterestRate: '',
  crInterestRate: '', collateral: '', branchCode: '', memoNote1: '', memoNote2: '',
  lastTransDate: '', lastAmendDate: '', lastAmendUser: '', supervisorId: '',
  lastUpdateCsd: '', supervisorApproved: '',
}

// The two OptionButton pairs the form carries, in the form's own option order.
//
// Dormant: dormantFlag "1" selects Yes, anything else No
// (globalFunctions.bas:9145-9149). The API hands this over already decoded to
// "Yes"/"No", so match on the word and fall back to No exactly as the legacy's
// Else branch does.
const DORMANT = ['Yes', 'No'] as const
const isDormant = (value: string) => value.trim().toLowerCase() === 'yes'

// Statement Day: statementDay "0" selects Br.Stmt.Day (opt0131), anything else
// Month End (opt3112) — globalFunctions.bas:9109-9113, and the same pairing in
// reverse when the form saves (frmAccct.frm:1822-1826). Br.Stmt.Day is FIRST
// because that is the order the running form shows (Picture8.png), which is the
// reverse of the .frm's declaration order.
const STMT_DAY = ['Br.Stmt.Day', 'Month End'] as const
const stmtDayIndex = (value: string) => (value.trim() === '0' ? 0 : 1)

/**
 * Port of displayIban (globalFunctions.bas:12680-12689) — the IBAN in four-
 * character groups separated by single spaces, and BLANK when the field is
 * empty or its first six characters are "000000", which is how the legacy
 * marks "no IBAN on this account" rather than leaving it empty.
 *
 * The .bas slices six fixed groups out of a 24-character string; the regex is
 * the same for a 24-character IBAN and degrades sanely if the archive ever
 * hands back a longer or shorter one. Stored whitespace is dropped before
 * regrouping rather than added to.
 */
const asIban = (value: string) => {
  const iban = (value ?? '').replace(/\s+/g, '')
  if (!iban || iban.startsWith('000000')) return ''
  return iban.replace(/(.{4})(?=.)/g, '$1 ')
}

/** YYYYMMDD (or a 14-char stamp) as the form writes it. */
const asDate = (value: string) => {
  const { d, m, y } = dateParts(value)
  return y ? `${d}/${m}/${y}` : ''
}

/** One reading in the summary band. */
function Stat({ label, children }: { label: string; children: ReactNode }) {
  return (
    <div className="min-w-0">
      <p className="text-xs text-muted-soft">{t(label)}</p>
      <div className="mt-1 truncate text-sm font-medium text-ink-soft">{children || '—'}</div>
    </div>
  )
}

/** A legacy row that pairs a short code box with the name beside it. */
function CodeAndName({
  label,
  code,
  name,
  codeWidth = 'w-16',
  dir,
}: {
  label: string
  code: string
  name: string
  codeWidth?: string
  dir?: 'auto' | 'rtl' | 'ltr'
}) {
  return (
    <div className="sm:col-span-2">
      <span className={labelCls}>{t(label)}</span>
      <div className="flex gap-2">
        <RoText value={code} className={`${codeWidth} text-center tabular-nums`} />
        <RoText value={name} dir={dir} />
      </div>
    </div>
  )
}

/** A rate box with the form's trailing per-cent sign. */
function Percent({ label, value }: { label: string; value: string }) {
  return (
    <div>
      <span className={labelCls}>{t(label)}</span>
      <div className="flex items-center gap-2">
        <RoText value={value} className="tabular-nums" />
        <span className="text-sm text-muted">%</span>
      </div>
    </div>
  )
}

// READ-ONLY. This is an enquiry application: nothing on this screen ever saved
// — there is no submit and no API to call — so every value renders as a value.
//
// The legacy frmAccct also carried Create / Approve / Reject and Supervisor
// Comments. All four are DISABLED in the mode this screen reproduces
// (accSearchAction / accHistoryAction, frmAccct.frm:2607-2623) and are dropped
// rather than drawn greyed: the first three are maintenance actions with no
// counterpart here, and restoring them means building the save path that never
// existed. Time Deposit Info is left out for the same reason — it needs a screen
// of its own behind it.

const GRID = 'grid gap-x-5 gap-y-4 sm:grid-cols-2 lg:grid-cols-4'

export default function AccountMaintenance({
  account,
  historyAsOf,
  onSamaHistory,
  onStatusHistory,
  onCustomerInfo,
  onCancel,
  onSignatories,
  onCards,
}: {
  account: Account
  historyAsOf?: string
  onSamaHistory: () => void
  onStatusHistory: () => void
  onCustomerInfo: () => void
  onCancel: () => void
  onSignatories: () => void
  onCards: () => void
}) {
  // Derived, not state: nothing can change it, and a useState initializer would
  // pin the FIRST account/snapshot it was mounted with if this screen is ever
  // re-rendered with new props instead of remounted.
  const data = { ...BLANK, ...(account?.maintenance ?? {}) }
  const status = codeLabel('accStatus', data.accountStatus)

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-5 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">{t('Account')}</p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            {t('Account Maintenance')}
          </h1>
          <p className="mt-1 text-sm text-muted" dir="auto">
            {data.customerName}
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold tabular-nums text-primary-ink">
          {t('A/c {accNo}', { accNo: account?.accountNumber ?? '' })}
        </span>
      </div>

      <HistoryBanner asOf={historyAsOf} />

      {/* At-a-glance band: the five readings the enquiry is usually opened for. */}
      <div className="mb-5 grid grid-cols-2 gap-x-6 gap-y-4 rounded-2xl border border-edge bg-surface px-5 py-4 shadow-sm sm:grid-cols-3 lg:grid-cols-5">
        <Stat label="Account Status">
          {status && <StatusBadge value={status} tone={statusTone(data.accountStatus)} />}
        </Stat>
        <Stat label="SAMA Status">
          {data.samaStatus && (
            <StatusBadge value={data.samaStatus} tone={statusTone(data.samaStatus)} />
          )}
        </Stat>
        <Stat label="Dormant">
          {data.dormant && (
            <StatusBadge value={t(data.dormant)} tone={isDormant(data.dormant) ? 'warn' : 'neutral'} />
          )}
        </Stat>
        <Stat label="Opened">{asDate(data.acOpenDate)}</Stat>
        <Stat label="Branch">{codeLabel('branch', data.branchCode)}</Stat>
      </div>

      <div className="grid gap-5">
        <SectionCard title="Account">
          <div className={GRID}>
            <CodeAndName label="Currency" code={data.currencyCode} name={data.currencyName} />
            <CodeAndName label="Ledger" code={data.ledgerCode} name={data.ledgerName} />
            <CodeAndName
              label="Customer No"
              code={data.customerNo}
              name={data.customerName}
              codeWidth="w-28"
            />
            <Field label="IBAN" className="sm:col-span-2">
              <RoText value={asIban(data.iban)} className="tabular-nums" />
            </Field>
            <Field label="Sub Account">
              <RoText value={data.subAccount} className="w-16 text-center tabular-nums" />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Status & Statements">
          <div className={GRID}>
            <Field label="Int. Application">
              <RoCombo value={codeLabel('intApplication', data.intApplication)} />
            </Field>
            <Field label="Stmt. Frequency">
              <RoCombo value={codeLabel('stmtFreq', data.stmtFrequency)} />
            </Field>
            <Field label="Account Status">
              <RoCombo value={status} />
            </Field>
            <Field label="SAMA status">
              <RoCombo value={data.samaStatus} />
            </Field>

            <Field label="Dormant">
              <Segmented options={DORMANT} selected={isDormant(data.dormant) ? 0 : 1} />
            </Field>
            <Field label="Statement Day">
              <Segmented options={STMT_DAY} selected={stmtDayIndex(data.statementDay)} />
            </Field>
            <Field label="A/c Status upd reason">
              <RoCombo value={data.statusUpdReason} />
            </Field>
            <Field label="Other reason">
              <RoText value={data.otherReason} />
            </Field>
          </div>
        </SectionCard>

        {/* Sixteen fields over a four-column grid — exactly four rows, in the
            form's own order read across instead of down. */}
        <SectionCard title="Interest, Limits & References">
          <div className={GRID}>
            <Field label="Unique No">
              <RoText value={data.uniqueNo} className="tabular-nums" />
            </Field>
            <Field label="Unique Sub">
              <RoText value={data.uniqueSub} className="tabular-nums" />
            </Field>
            <Field label="Credit Limit">
              <RoText value={data.creditLimit} className="tabular-nums" />
            </Field>
            <Field label="Int.Last run">
              <RoText value={data.intLastRun} className="tabular-nums" />
            </Field>

            <Field label="Pay Account No">
              <RoText value={data.payAccountNo} className="tabular-nums" />
            </Field>
            <Field label="A/c open Date">
              <DateTriple value={data.acOpenDate} />
            </Field>
            <Field label="Int freq code">
              <RoText value={data.intFreqCode} />
            </Field>
            <Field label="Int appl day">
              <RoText value={data.intApplDay} className="tabular-nums" />
            </Field>

            <Percent label="Dr Interest Rate" value={data.drInterestRate} />
            <Percent label="Cr Interest Rate" value={data.crInterestRate} />
            <Field label="Collateral">
              <RoText value={data.collateral} />
            </Field>
            <Field label="Branch code">
              <RoCombo value={codeLabel('branch', data.branchCode)} />
            </Field>

            <Field label="Memo note-1">
              <RoText value={data.memoNote1} />
            </Field>
            <Field label="Memo note-2">
              <RoText value={data.memoNote2} />
            </Field>
            <Field label="Last Trans Date">
              <DateTriple value={data.lastTransDate} />
            </Field>
            <Field label="Last amend Date">
              <DateTriple value={data.lastAmendDate} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Amendment Audit" description="Written by the system, not by this screen.">
          <div className={GRID}>
            <Field label="Last Amend user">
              <RoText value={data.lastAmendUser} />
            </Field>
            <Field label="Last Update CSD">
              <DateTriple value={data.lastUpdateCsd} />
            </Field>
            <Field label="Supervisor Id">
              <RoText value={data.supervisorId} />
            </Field>
            <Field label="Supervisor Approved">
              <DateTriple value={data.supervisorApproved} />
            </Field>
          </div>
        </SectionCard>

        <div className="rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          {/* One wrapping row: every button here NAVIGATES. Nothing on this bar
              writes, so there is no second group to separate it from. */}
          <div className="flex flex-wrap items-center gap-3">
            <button type="button" onClick={onSignatories} className={btnKinds.secondary}>
              {t('Signatory')}
            </button>
            <button type="button" onClick={onCards} className={btnKinds.secondary}>
              {t('ATM Card')}
            </button>
            <button type="button" onClick={onCustomerInfo} className={btnKinds.secondary}>
              {t('Customer Info')}
            </button>
            <button type="button" onClick={onStatusHistory} className={btnKinds.secondary}>
              {t('A/C Status History')}
            </button>
            <button type="button" onClick={onSamaHistory} className={btnKinds.secondary}>
              {t('SAMA status history')}
            </button>
            <button type="button" onClick={onCancel} className={`ms-auto ${btnKinds.danger}`}>
              {t('Cancel')}
            </button>
          </div>
        </div>
      </div>
    </main>
  )
}
