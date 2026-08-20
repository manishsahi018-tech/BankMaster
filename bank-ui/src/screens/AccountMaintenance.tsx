import { Field, ReadOnlyInput, SectionCard } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import { codeLabel } from '../codes.ts'
import type { Account } from '../types.ts'

// Mirrors legacy frmAccct.frm ("Account Maintenance") — single-account detail.

// Statement frequency, account status and branch used to be hard-coded lists
// here. All three are served by /api/codes now (stctltab 'SF' / 'AS' and
// stctltabBD), so the values come from the archive rather than from three
// literals that disagreed with it.

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

// READ-ONLY. This is an enquiry application: nothing on this screen ever saved
// — there is no submit and no API to call — so every value renders as a value.
//
// Dormant and Statement Day used to be segmented toggles rendered disabled.
// Disabled is not the same as read-only: they still drew as controls, still lit
// up on hover, and still read to an operator as something that ought to be
// clickable and merely isn't right now. They are ReadOnlyInput like every other
// field now, so the screen makes one consistent promise instead of two.
//
// The legacy frmAccct also carried Supervisor Comments / Create / Approve /
// Reject. Those are maintenance actions with no counterpart here and are gone
// rather than hidden behind a flag; restoring them means building the save path
// that never existed, not flipping a boolean.

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

  const labelCls = 'mb-1.5 block text-sm font-medium text-ink-soft'
  const roCls =
    'block w-full rounded-lg border border-edge bg-surface-muted px-3 py-2 text-sm text-muted shadow-xs focus:outline-none'
  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">Account</p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            Account Maintenance
          </h1>
          <p className="mt-1 text-sm text-muted">{data.customerName}</p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          A/c {account?.accountNumber}
        </span>
      </div>

      <HistoryBanner asOf={historyAsOf} />

      <div className="grid gap-5">
        <SectionCard title="Account Identity">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <div>
              <span className={labelCls}>Currency</span>
              <div className="flex gap-2">
                <input readOnly value={data.currencyCode} className={`${roCls} w-16`} />
                <input readOnly value={data.currencyName} className={roCls} />
              </div>
            </div>
            <div className="lg:col-span-2">
              <span className={labelCls}>Ledger</span>
              <div className="flex gap-2">
                <input readOnly value={data.ledgerCode} className={`${roCls} w-16`} />
                <input readOnly dir="auto" value={data.ledgerName} className={roCls} />
              </div>
            </div>
            <Field label="Sub Account" htmlFor="subAcct">
              <input id="subAcct" readOnly value={data.subAccount} className={`${roCls} w-20`} />
            </Field>
            <div className="lg:col-span-2">
              <span className={labelCls}>Customer No</span>
              <div className="flex gap-2">
                <input readOnly value={data.customerNo} className={`${roCls} w-28`} />
                <input readOnly value={data.customerName} className={roCls} />
              </div>
            </div>
            <Field label="IBAN" htmlFor="iban" className="lg:col-span-2">
              <input id="iban" readOnly value={data.iban} className={`${roCls} tabular-nums`} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Status & Statements">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Int. Application" htmlFor="intApp">
              {/* Served from stctltab recType 'IA'. The two hard-coded options
                  this replaced were both incomplete and wrong: the domain has
                  four values (gld0data.intApplication), and 1 is "Pay to another
                  account", not "Transfer". */}
              <ReadOnlyInput id="intApp" value={codeLabel('intApplication', data.intApplication)} />
            </Field>
            <Field label="Dormant" htmlFor="dormant">
              <ReadOnlyInput id="dormant" value={data.dormant} />
            </Field>
            <Field label="Stmt. Frequency" htmlFor="stmtFreq">
              {/* Read-only, and resolved through /api/codes rather than a
                  hard-coded option list. It was an editable Select whose
                  options were three literals — wrong for an enquiry screen on
                  both counts: it offered an edit that can never be saved, and
                  its list disagreed with the archival domain (stctltab 'SF'
                  has seven values, and 01 is Non-automatic, not Monthly). */}
              <ReadOnlyInput id="stmtFreq" value={codeLabel('stmtFreq', data.stmtFrequency)} />
            </Field>
            <Field label="Statement Day" htmlFor="stmtDay">
              <ReadOnlyInput id="stmtDay" value={data.statementDay} />
            </Field>
            <Field label="Account Status" htmlFor="accStatus">
              <ReadOnlyInput id="accStatus" value={codeLabel('accStatus', data.accountStatus)} />
            </Field>
            <Field label="A/c Status Upd Reason" htmlFor="statusReason">
              <ReadOnlyInput id="statusReason" value={data.statusUpdReason} />
            </Field>
            <Field label="Other Reason" htmlFor="otherReason">
              <ReadOnlyInput id="otherReason" value={data.otherReason} />
            </Field>
            <Field label="SAMA Status" htmlFor="samaStatus">
              {/* Maintained by SAMA processes; read-only on this screen. */}
              <input id="samaStatus" readOnly value={data.samaStatus} className={roCls} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Limits, Interest & References">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Unique No" htmlFor="uniqueNo">
              <ReadOnlyInput id="uniqueNo" value={data.uniqueNo} />
            </Field>
            <Field label="Unique Sub" htmlFor="uniqueSub">
              <ReadOnlyInput id="uniqueSub" value={data.uniqueSub} />
            </Field>
            <Field label="Credit Limit" htmlFor="creditLimit">
              <ReadOnlyInput id="creditLimit" value={data.creditLimit} />
            </Field>
            <Field label="Int. Last Run" htmlFor="intLastRun">
              <input id="intLastRun" readOnly value={data.intLastRun} className={roCls} />
            </Field>
            <Field label="Pay Account No" htmlFor="payAcct">
              <ReadOnlyInput id="payAcct" value={data.payAccountNo} />
            </Field>
            <Field label="A/c Open Date" htmlFor="openDate">
              <input id="openDate" readOnly value={data.acOpenDate} className={roCls} />
            </Field>
            <Field label="Int. Freq Code" htmlFor="intFreq">
              <ReadOnlyInput id="intFreq" value={data.intFreqCode} />
            </Field>
            <Field label="Int. Appl Day" htmlFor="intApplDay">
              <ReadOnlyInput id="intApplDay" value={data.intApplDay} />
            </Field>
            <div>
              <span className={labelCls}>Dr Interest Rate</span>
              <div className="flex items-center gap-2">
                <ReadOnlyInput aria-label="Dr interest rate" value={data.drInterestRate} className="w-24" />
                <span className="text-sm text-muted">%</span>
              </div>
            </div>
            <div>
              <span className={labelCls}>Cr Interest Rate</span>
              <div className="flex items-center gap-2">
                <ReadOnlyInput aria-label="Cr interest rate" value={data.crInterestRate} className="w-24" />
                <span className="text-sm text-muted">%</span>
              </div>
            </div>
            <Field label="Collateral" htmlFor="collateral">
              <ReadOnlyInput id="collateral" value={data.collateral} />
            </Field>
            <Field label="Branch Code" htmlFor="branchCode">
              {/* branch has been a served code set all along; this Select was
                  offering three hard-coded branches instead. */}
              <ReadOnlyInput id="branchCode" value={codeLabel('branch', data.branchCode)} />
            </Field>
            <Field label="Memo Note 1" htmlFor="memo1">
              <ReadOnlyInput id="memo1" value={data.memoNote1} />
            </Field>
            <Field label="Memo Note 2" htmlFor="memo2">
              <ReadOnlyInput id="memo2" value={data.memoNote2} />
            </Field>
            <Field label="Last Trans Date" htmlFor="lastTrans">
              <input id="lastTrans" readOnly value={data.lastTransDate} className={roCls} />
            </Field>
            <Field label="Last Amend Date" htmlFor="lastAmend">
              <input id="lastAmend" readOnly value={data.lastAmendDate} className={roCls} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Amendment Audit" description="Populated by the system.">
          <div className="grid grid-cols-2 gap-4 sm:grid-cols-4">
            {[
              ['Last Amend User', data.lastAmendUser],
              ['Supervisor Id', data.supervisorId],
              ['Last Update CSD', data.lastUpdateCsd],
              ['Supervisor Approved', data.supervisorApproved],
            ].map(([l, v]) => (
              <div key={l} className="rounded-xl border border-edge bg-surface-muted/60 p-3">
                <p className="text-xs text-muted-soft">{l}</p>
                <p className="mt-0.5 text-sm font-medium text-ink-soft">{v}</p>
              </div>
            ))}
          </div>
        </SectionCard>

        <div className="rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          {/* One wrapping row: every button here NAVIGATES. Nothing on this bar
              writes, so there is no second group to separate it from. */}
          <div className="flex flex-wrap items-center gap-3">
            <button
              type="button"
              onClick={onSignatories}
              className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
            >
              Signatory
            </button>
            <button
              type="button"
              onClick={onCards}
              className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
            >
              ATM Card
            </button>
            <button
              type="button"
              onClick={onCustomerInfo}
              className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
            >
              Customer Info
            </button>
            <button
              type="button"
              onClick={onStatusHistory}
              className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
            >
              A/C Status History
            </button>
            <button
              type="button"
              onClick={onSamaHistory}
              className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
            >
              SAMA Status History
            </button>
            <button
              type="button"
              onClick={onCancel}
              className="ml-auto rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
            >
              Cancel
            </button>
          </div>
        </div>
      </div>
    </main>
  )
}
