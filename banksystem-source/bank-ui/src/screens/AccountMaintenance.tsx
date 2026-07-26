import { useState, type ChangeEvent } from 'react'
import { Field, TextInput, Select, SectionCard } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import type { Account } from '../types.ts'

// Mirrors legacy frmAccct.frm ("Account Maintenance") — single-account detail.

const INT_APPLICATIONS = ['0-Capitalise', '1-Transfer']
const STMT_FREQS = ['01 - None', '04 - Monthly', '05 - Quarterly']
const ACC_STATUSES = ['00 - Open', '03 - Account Stopped', '04 - No Debits', '08 - Enquiry Restricted']
const BRANCHES = ['0128 - MUTANABI', '0127 - SWAIDI', '0001 - Head Office']

const SAMPLE = {
  currencyCode: '01',
  currencyName: 'Saudi Riyal',
  ledgerCode: '008',
  ledgerName: 'تحت الطلب - قطاع خاص مقيــم',
  customerNo: '0783945',
  customerName: 'ALTAMEEMI MOHD ZAIDAAN',
  subAccount: '03',
  iban: 'SA22 3030 0001 0080 7839 4503',
  intApplication: '0-Capitalise',
  dormant: 'No',
  stmtFrequency: '01 - None',
  statementDay: 'Br.Stmt.Day',
  accountStatus: '00 - Open',
  otherReason: '',
  statusUpdReason: '',
  samaStatus: '00 - Open',
  uniqueNo: '',
  uniqueSub: '',
  creditLimit: '0',
  intLastRun: '0.00',
  payAccountNo: '',
  acOpenDate: '26/04/2008',
  intFreqCode: 'M01',
  intApplDay: '31',
  drInterestRate: '21',
  crInterestRate: '0',
  collateral: '',
  branchCode: '0128 - MUTANABI',
  memoNote1: '30931',
  memoNote2: '',
  lastTransDate: '05/07/2009',
  lastAmendDate: '03/05/2008',
  lastAmendUser: '83415',
  supervisorId: '1_RET_MAIL',
  lastUpdateCsd: '30/05/2009',
  supervisorApproved: '30/05/2009',
}

const YesNo = ({ value, onChange }: { value: string; onChange?: (opt: string) => void }) => (
  <div className="inline-flex rounded-lg border border-edge-strong bg-surface p-0.5 shadow-xs">
    {['Yes', 'No'].map((opt) => (
      <button
        key={opt}
        type="button"
        onClick={() => onChange?.(opt)}
        className={`rounded-md px-2.5 py-1 text-xs font-medium transition-colors ${
          value === opt ? 'bg-primary text-white shadow-sm' : 'text-muted hover:bg-surface-muted'
        }`}
      >
        {opt}
      </button>
    ))}
  </div>
)

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
  const [data, setData] = useState({ ...SAMPLE, ...(account?.maintenance ?? {}) })

  const set = (key: keyof typeof SAMPLE) => (value: string) => setData((d) => ({ ...d, [key]: value }))
  const setInput = (key: keyof typeof SAMPLE) => (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) =>
    set(key)(e.target.value)

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
              <Select id="intApp" options={INT_APPLICATIONS} value={data.intApplication} onChange={setInput('intApplication')} />
            </Field>
            <div>
              <span className={labelCls}>Dormant</span>
              <YesNo value={data.dormant} onChange={set('dormant')} />
            </div>
            <Field label="Stmt. Frequency" htmlFor="stmtFreq">
              <Select id="stmtFreq" options={STMT_FREQS} value={data.stmtFrequency} onChange={setInput('stmtFrequency')} />
            </Field>
            <div>
              <span className={labelCls}>Statement Day</span>
              <div className="inline-flex rounded-lg border border-edge-strong bg-surface p-0.5 shadow-xs">
                {['Br.Stmt.Day', 'Month End'].map((opt) => (
                  <button
                    key={opt}
                    type="button"
                    onClick={() => set('statementDay')(opt)}
                    className={`rounded-md px-2.5 py-1 text-xs font-medium transition-colors ${
                      data.statementDay === opt ? 'bg-primary text-white shadow-sm' : 'text-muted hover:bg-surface-muted'
                    }`}
                  >
                    {opt}
                  </button>
                ))}
              </div>
            </div>
            <Field label="Account Status" htmlFor="accStatus">
              <Select id="accStatus" options={ACC_STATUSES} value={data.accountStatus} onChange={setInput('accountStatus')} />
            </Field>
            <Field label="A/c Status Upd Reason" htmlFor="statusReason">
              <TextInput id="statusReason" value={data.statusUpdReason} onChange={setInput('statusUpdReason')} />
            </Field>
            <Field label="Other Reason" htmlFor="otherReason">
              <TextInput id="otherReason" value={data.otherReason} onChange={setInput('otherReason')} />
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
              <TextInput id="uniqueNo" value={data.uniqueNo} onChange={setInput('uniqueNo')} />
            </Field>
            <Field label="Unique Sub" htmlFor="uniqueSub">
              <TextInput id="uniqueSub" value={data.uniqueSub} onChange={setInput('uniqueSub')} />
            </Field>
            <Field label="Credit Limit" htmlFor="creditLimit">
              <TextInput id="creditLimit" value={data.creditLimit} onChange={setInput('creditLimit')} />
            </Field>
            <Field label="Int. Last Run" htmlFor="intLastRun">
              <input id="intLastRun" readOnly value={data.intLastRun} className={roCls} />
            </Field>
            <Field label="Pay Account No" htmlFor="payAcct">
              <TextInput id="payAcct" value={data.payAccountNo} onChange={setInput('payAccountNo')} />
            </Field>
            <Field label="A/c Open Date" htmlFor="openDate">
              <input id="openDate" readOnly value={data.acOpenDate} className={roCls} />
            </Field>
            <Field label="Int. Freq Code" htmlFor="intFreq">
              <TextInput id="intFreq" maxLength={3} value={data.intFreqCode} onChange={setInput('intFreqCode')} />
            </Field>
            <Field label="Int. Appl Day" htmlFor="intApplDay">
              <TextInput id="intApplDay" maxLength={2} value={data.intApplDay} onChange={setInput('intApplDay')} />
            </Field>
            <div>
              <span className={labelCls}>Dr Interest Rate</span>
              <div className="flex items-center gap-2">
                <TextInput aria-label="Dr interest rate" value={data.drInterestRate} onChange={setInput('drInterestRate')} className="w-24" />
                <span className="text-sm text-muted">%</span>
              </div>
            </div>
            <div>
              <span className={labelCls}>Cr Interest Rate</span>
              <div className="flex items-center gap-2">
                <TextInput aria-label="Cr interest rate" value={data.crInterestRate} onChange={setInput('crInterestRate')} className="w-24" />
                <span className="text-sm text-muted">%</span>
              </div>
            </div>
            <Field label="Collateral" htmlFor="collateral">
              <TextInput id="collateral" value={data.collateral} onChange={setInput('collateral')} />
            </Field>
            <Field label="Branch Code" htmlFor="branchCode">
              <Select id="branchCode" options={BRANCHES} value={data.branchCode} onChange={setInput('branchCode')} />
            </Field>
            <Field label="Memo Note 1" htmlFor="memo1">
              <TextInput id="memo1" value={data.memoNote1} onChange={setInput('memoNote1')} />
            </Field>
            <Field label="Memo Note 2" htmlFor="memo2">
              <TextInput id="memo2" value={data.memoNote2} onChange={setInput('memoNote2')} />
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

        <div className="grid gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <div className="flex flex-wrap items-center gap-3">
            {/* Supervisor / creation actions — enquiry mode keeps them disabled. */}
            {['Supervisor Comments', 'Create', 'Approve', 'Reject'].map((label) => (
              <button
                key={label}
                type="button"
                disabled
                title="Available in create / supervisor mode only"
                className="cursor-not-allowed rounded-lg border border-edge bg-surface-muted px-4 py-2.5 text-sm font-medium text-muted-soft shadow-xs"
              >
                {label}
              </button>
            ))}
            <button
              type="button"
              onClick={onSignatories}
              className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
            >
              Signatory
            </button>
          </div>
          <div className="flex flex-wrap items-center gap-3">
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
