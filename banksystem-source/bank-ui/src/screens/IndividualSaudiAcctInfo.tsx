import { useState, type ChangeEvent } from 'react'
import { Field, TextInput, Select, SectionCard } from '../components/fields.tsx'
import type { Customer } from '../types.ts'

// Mirrors legacy frmIndividualSaudiAcctInfo.frm — page 2 of the Individual
// Saudi National profile ("Individual Saudi Account Details").

const EDUCATION = ['0001-Primary', '0002-Secondary', '0003-Diploma', '0004-Graduate', '0005-Post Graduate']
const PROFESSIONS = ['0001-Government', '0002-Private', '0006-ANB Staff', '0007-Business']
const POSITIONS = ['0001-Manager', '0002-Officer', '0005-Others']
const INCOMES = ['0001-Below 3000', '0002-3001-5000', '0003-5001-10000', '0004-Above 10000']
const SEGMENTATIONS = ['1-High Networth', '2-Affluent', '3-Mass']
const PACKAGES = ['0-NONE', '1-Golden Package', '2-Silver Package']
const CURRENCIES = ['01 - Saudi Riyal', '02 - US Dollar']
const ACC_STATUSES = ['00 - Open', '03 - Account Stopped', '04 - No Debits']
const STMT_FREQS = ['01 - None', '04 - Monthly', '05 - Quarterly']
const CITIES = ['الرياض', 'جدة', 'الدمام', 'صفوى', 'القطيف']

const OWNERSHIP = [
  { key: 'rentedHome', label: 'Rented Home' },
  { key: 'ownHouse', label: 'Own House' },
  { key: 'comAccomodation', label: 'Com. Accomodation' },
  { key: 'rentedCar', label: 'Rented Car' },
  { key: 'ownCar', label: 'Own Car' },
  { key: 'companyTransport', label: 'Company Transport' },
] as const

const SAMPLE = {
  education: '0003-Diploma',
  profession: '0006-ANB Staff',
  position: '0005-Others',
  monthlyIncome: '0003-5001-10000',
  segmentation: '1-High Networth',
  marketingMemo: '',
  custAdviceFlag: 'Yes',
  ownership: { rentedHome: true, ownHouse: false, comAccomodation: false, rentedCar: false, ownCar: true, companyTransport: false },
  employerName: 'البنك العربي الوطني',
  dept: 'فرع السويدي',
  po: '61128',
  city: 'الرياض',
  zip: '11565',
  custUpdatedForSama: 'Yes',
  relationshipManager: '',
  generalMemo: '',
  packageAc: '0-NONE',
  segmentStmtOverride: 'No',
  excludeAtmFees: 'No',
  excludeMinBalanceFees: 'No',
  accounts: {
    current: { open: 'No', currency: '01 - Saudi Riyal', status: '00 - Open', stmtFreq: '04 - Monthly', chequeBook: 'No' },
    saving: { open: 'No', currency: '01 - Saudi Riyal', status: '00 - Open', stmtFreq: '04 - Monthly', chequeBook: null as string | null },
    other: { open: 'No', type: '', currency: '01 - Saudi Riyal', status: '00 - Open', stmtFreq: '04 - Monthly', chequeBook: 'No' },
  },
  singleJoint: 'Single',
  natureOfSignature: 'Single',
  freezingGracePeriod: '0',
  cardType: 'Elec.Intl',
  primaryIntlCard: 'No',
  primaryCardName: '',
  secondaryIntlCard: 'No',
  secondaryCardName: '',
  cardDeliveredTo: 'GPS',
  gpsStreet: '',
  gpsAddress2: '',
  gpsUnit: '',
  gpsCity: '',
  gpsZip1: '',
  gpsZip2: '',
}

function Segmented({
  options,
  value,
  onChange,
  disabledOptions = [],
}: {
  options: readonly string[]
  value: string
  onChange?: (opt: string) => void
  disabledOptions?: readonly string[]
}) {
  return (
    <div className="inline-flex rounded-lg border border-edge-strong bg-surface p-0.5 shadow-xs">
      {options.map((opt) => (
        <button
          key={opt}
          type="button"
          disabled={disabledOptions.includes(opt)}
          onClick={() => onChange?.(opt)}
          className={`rounded-md px-2.5 py-1 text-xs font-medium transition-colors disabled:cursor-not-allowed disabled:text-faint ${
            value === opt ? 'bg-primary text-white shadow-sm' : 'text-muted hover:bg-surface-muted'
          }`}
        >
          {opt}
        </button>
      ))}
    </div>
  )
}

const YesNo = (props: { value: string; onChange?: (opt: string) => void }) => (
  <Segmented options={['Yes', 'No']} {...props} />
)

export default function IndividualSaudiAcctInfo({
  customer,
  onPrevPage,
  onDocuments,
  onCancel,
}: {
  customer: Customer | null
  onPrevPage: () => void
  onDocuments: () => void
  onCancel: () => void
}) {
  const [data, setData] = useState(SAMPLE)
  const [notice] = useState<string | null>(null)

  const set = (key: keyof typeof SAMPLE) => (value: unknown) => setData((d) => ({ ...d, [key]: value }))
  const setInput = (key: keyof typeof SAMPLE) => (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) =>
    set(key)(e.target.value)
  const setAcct = (acct: keyof typeof SAMPLE.accounts, field: string) => (value: unknown) =>
    setData((d) => ({ ...d, accounts: { ...d.accounts, [acct]: { ...d.accounts[acct], [field]: value } } }))
  const toggleOwnership = (key: keyof typeof SAMPLE.ownership) =>
    setData((d) => ({ ...d, ownership: { ...d.ownership, [key]: !d.ownership[key] } }))

  const labelCls = 'mb-1.5 block text-sm font-medium text-ink-soft'

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            Individual — Saudi National
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            Account Details
          </h1>
          <p className="mt-1 text-sm text-muted">
            Page 2 of 2 — employment, accounts, cards and delivery.
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          Customer {customer?.custNo}
        </span>
      </div>

      {notice && (
        <div className="mb-5 rounded-xl border border-primary/30 bg-primary-soft px-4 py-3 text-sm text-primary-ink">
          {notice}
        </div>
      )}

      <div className="grid gap-5">
        <SectionCard title="Employment & Income">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Education" htmlFor="education">
              <Select id="education" options={EDUCATION} value={data.education} onChange={setInput('education')} />
            </Field>
            <Field label="Profession" htmlFor="profession">
              <Select id="profession" options={PROFESSIONS} value={data.profession} onChange={setInput('profession')} />
            </Field>
            <Field label="Position" htmlFor="position">
              <Select id="position" options={POSITIONS} value={data.position} onChange={setInput('position')} />
            </Field>
            <Field label="Monthly Income" htmlFor="income">
              <Select id="income" options={INCOMES} value={data.monthlyIncome} onChange={setInput('monthlyIncome')} />
            </Field>
            <Field label="Segmentation" htmlFor="segmentation">
              <Select id="segmentation" options={SEGMENTATIONS} value={data.segmentation} onChange={setInput('segmentation')} />
            </Field>
            <Field label="Marketing Memo" htmlFor="mktMemo" className="sm:col-span-2">
              <TextInput id="mktMemo" value={data.marketingMemo} onChange={setInput('marketingMemo')} />
            </Field>
            <div>
              <span className={labelCls}>Cust. Advice Flag</span>
              <YesNo value={data.custAdviceFlag} onChange={set('custAdviceFlag')} />
            </div>
          </div>

          <div className="mt-5 border-t border-edge-soft pt-4">
            <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">Ownership</p>
            <div className="flex flex-wrap gap-2">
              {OWNERSHIP.map(({ key, label }) => {
                const on = data.ownership[key]
                return (
                  <button
                    key={key}
                    type="button"
                    onClick={() => toggleOwnership(key)}
                    className={`rounded-full border px-3 py-1.5 text-xs font-medium transition-colors ${
                      on ? 'border-primary bg-primary-soft text-primary-ink' : 'border-edge-strong bg-surface text-muted hover:bg-surface-muted'
                    }`}
                  >
                    {on ? '✓ ' : ''}{label}
                  </button>
                )
              })}
            </div>
          </div>

          <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-5">
            <Field label="Employer Name" htmlFor="employer" className="lg:col-span-2">
              <TextInput id="employer" dir="auto" value={data.employerName} onChange={setInput('employerName')} />
            </Field>
            <Field label="Dept." htmlFor="dept">
              <TextInput id="dept" dir="auto" value={data.dept} onChange={setInput('dept')} />
            </Field>
            <Field label="P.O." htmlFor="po">
              <TextInput id="po" maxLength={10} value={data.po} onChange={setInput('po')} />
            </Field>
            <Field label="Zip" htmlFor="zip">
              <TextInput id="zip" maxLength={10} value={data.zip} onChange={setInput('zip')} />
            </Field>
            <Field label="City" htmlFor="empCity">
              <Select id="empCity" options={CITIES} value={data.city} onChange={setInput('city')} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="SAMA, Memos & Fees">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <div>
              <span className={labelCls}>Cust. Updated for SAMA</span>
              <YesNo value={data.custUpdatedForSama} onChange={set('custUpdatedForSama')} />
            </div>
            <Field label="Relationship Manager" htmlFor="relMgr">
              <TextInput id="relMgr" value={data.relationshipManager} onChange={setInput('relationshipManager')} />
            </Field>
            <Field label="General Memo" htmlFor="genMemo" className="lg:col-span-2">
              <TextInput id="genMemo" value={data.generalMemo} onChange={setInput('generalMemo')} />
            </Field>
            <Field label="Package A/c" htmlFor="package">
              <Select id="package" options={PACKAGES} value={data.packageAc} onChange={setInput('packageAc')} />
            </Field>
            <div>
              <span className={labelCls}>Segment Statement Override</span>
              <YesNo value={data.segmentStmtOverride} onChange={set('segmentStmtOverride')} />
            </div>
            <div>
              <span className={labelCls}>Exclude from ATM Fees</span>
              <YesNo value={data.excludeAtmFees} onChange={set('excludeAtmFees')} />
            </div>
            <div>
              <span className={labelCls}>Exclude from Min. Balance Fees</span>
              <YesNo value={data.excludeMinBalanceFees} onChange={set('excludeMinBalanceFees')} />
            </div>
          </div>
        </SectionCard>

        <SectionCard
          title="Accounts to Open"
          description="Requested accounts with currency, status, statement frequency and cheque book."
        >
          <div className="overflow-x-auto">
            <table className="w-full min-w-[880px] border-collapse text-sm">
              <thead>
                <tr className="border-b border-edge text-left">
                  {['Account', 'Open', 'Currency', 'Acc. Status', 'Stmt. Freq', 'Cheque Book'].map((h) => (
                    <th key={h} className="whitespace-nowrap px-2 py-2.5 text-xs font-semibold uppercase tracking-wide text-muted">
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {([
                  ['current', 'Current A/c'],
                  ['saving', 'Saving A/c'],
                  ['other', 'Other A/c'],
                ] as const).map(([key, label]) => {
                  const acct = data.accounts[key]
                  return (
                    <tr key={key} className="border-b border-edge-soft last:border-b-0">
                      <td className="whitespace-nowrap px-2 py-2.5 font-medium text-ink-soft">
                        {key === 'other' ? (
                          <div className="flex items-center gap-2">
                            {label}
                            <TextInput
                              aria-label="Other account type"
                              value={data.accounts.other.type}
                              onChange={(e) => setAcct(key, 'type')(e.target.value)}
                              className="w-20"
                            />
                          </div>
                        ) : (
                          label
                        )}
                      </td>
                      <td className="px-2 py-2.5">
                        <YesNo value={acct.open} onChange={setAcct(key, 'open')} />
                      </td>
                      <td className="px-2 py-2.5">
                        <Select aria-label={`${label} currency`} options={CURRENCIES} value={acct.currency} onChange={(e) => setAcct(key, 'currency')(e.target.value)} className="w-40" />
                      </td>
                      <td className="px-2 py-2.5">
                        <Select aria-label={`${label} status`} options={ACC_STATUSES} value={acct.status} onChange={(e) => setAcct(key, 'status')(e.target.value)} className="w-36" />
                      </td>
                      <td className="px-2 py-2.5">
                        <Select aria-label={`${label} statement frequency`} options={STMT_FREQS} value={acct.stmtFreq} onChange={(e) => setAcct(key, 'stmtFreq')(e.target.value)} className="w-32" />
                      </td>
                      <td className="px-2 py-2.5">
                        {acct.chequeBook !== null ? (
                          <YesNo value={acct.chequeBook} onChange={setAcct(key, 'chequeBook')} />
                        ) : (
                          <span className="text-faint">—</span>
                        )}
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>

          <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-3">
            <div>
              <span className={labelCls}>Single / Joint A/c</span>
              <Segmented
                options={['Single', 'Joint', 'Unidentified']}
                disabledOptions={['Unidentified']}
                value={data.singleJoint}
                onChange={set('singleJoint')}
              />
            </div>
            <div>
              <span className={labelCls}>Nature of Signature</span>
              <Segmented options={['Single', 'Joint']} value={data.natureOfSignature} onChange={set('natureOfSignature')} />
            </div>
            <div>
              <span className={labelCls}>Freezing Grace Period</span>
              <div className="flex items-center gap-2">
                <TextInput
                  aria-label="Freezing grace period"
                  maxLength={3}
                  value={data.freezingGracePeriod}
                  onChange={setInput('freezingGracePeriod')}
                  className="w-20"
                />
                <span className="text-sm text-muted">Day(s)</span>
              </div>
            </div>
          </div>
        </SectionCard>

        <SectionCard title="Cards & Delivery">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            <div>
              <span className={labelCls}>Card Type</span>
              <Segmented options={['Elec.Intl', 'El.Chip']} value={data.cardType} onChange={set('cardType')} />
            </div>
            <div>
              <span className={labelCls}>Primary Int'l Card</span>
              <YesNo value={data.primaryIntlCard} onChange={set('primaryIntlCard')} />
            </div>
            <Field label="Name on the Card (Primary)" htmlFor="priCardName">
              <TextInput id="priCardName" maxLength={30} value={data.primaryCardName} onChange={setInput('primaryCardName')} />
            </Field>
            <div>
              <span className={labelCls}>Secondary Int'l Card</span>
              <YesNo value={data.secondaryIntlCard} onChange={set('secondaryIntlCard')} />
            </div>
            <Field label="Name on the Card (Secondary)" htmlFor="secCardName" className="lg:col-span-2">
              <TextInput id="secCardName" maxLength={30} value={data.secondaryCardName} onChange={setInput('secondaryCardName')} />
            </Field>
          </div>

          <div className="mt-5 border-t border-edge-soft pt-4">
            <span className={labelCls}>Card Delivered To</span>
            <Segmented
              options={['Customer Branch', 'Request Branch', 'Mail', 'GPS']}
              value={data.cardDeliveredTo}
              onChange={set('cardDeliveredTo')}
            />
            {data.cardDeliveredTo === 'GPS' && (
              <div className="mt-4 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                <Field label="GPS # — Street / Area Name" htmlFor="gpsStreet" className="lg:col-span-2">
                  <TextInput id="gpsStreet" maxLength={24} value={data.gpsStreet} onChange={setInput('gpsStreet')} />
                </Field>
                <Field label="Address 2" htmlFor="gpsAddr2" className="lg:col-span-2">
                  <TextInput id="gpsAddr2" value={data.gpsAddress2} onChange={setInput('gpsAddress2')} />
                </Field>
                <Field label="Unit" htmlFor="gpsUnit">
                  <TextInput id="gpsUnit" maxLength={5} value={data.gpsUnit} onChange={setInput('gpsUnit')} />
                </Field>
                <Field label="City" htmlFor="gpsCity">
                  <Select id="gpsCity" placeholder="Select city" options={CITIES} value={data.gpsCity} onChange={setInput('gpsCity')} />
                </Field>
                <div>
                  <span className={labelCls}>Zip Code</span>
                  <div className="flex items-center gap-2">
                    <TextInput aria-label="Zip code" maxLength={5} value={data.gpsZip1} onChange={setInput('gpsZip1')} className="w-24" />
                    <span className="text-faint">—</span>
                    <TextInput aria-label="Additional number" maxLength={4} value={data.gpsZip2} onChange={setInput('gpsZip2')} className="w-20" />
                  </div>
                </div>
              </div>
            )}
          </div>
        </SectionCard>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <button
            type="button"
            onClick={onPrevPage}
            className="inline-flex items-center gap-2 rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
          >
            <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4">
              <path
                fillRule="evenodd"
                d="M17 10a.75.75 0 0 1-.75.75H5.612l4.158 3.96a.75.75 0 1 1-1.04 1.08l-5.5-5.25a.75.75 0 0 1 0-1.08l5.5-5.25a.75.75 0 1 1 1.04 1.08L5.612 9.25H16.25A.75.75 0 0 1 17 10Z"
                clipRule="evenodd"
              />
            </svg>
            Previous Page
          </button>

          {/* Create / Print / Approve / Reject / Joint Account belong to the
              new-customer and supervisor flows; disabled in enquiry mode. */}
          {['Create', 'Print Application', 'Approve', 'Reject', 'Joint Account'].map((label) => (
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
            onClick={onDocuments}
            className="ml-auto rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
          >
            Documents
          </button>
          <button
            type="button"
            onClick={onCancel}
            className="rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
          >
            Cancel
          </button>
        </div>
      </div>
    </main>
  )
}
