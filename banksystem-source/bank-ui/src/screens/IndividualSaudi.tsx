import { useState, type ChangeEvent } from 'react'
import { Field, TextInput, Select, SectionCard } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import { hasAuthority } from '../session.ts'
import type { Customer } from '../types.ts'

// Mirrors legacy frmIndividualSaudi.frm — page 1 of the Individual Saudi
// National customer profile. Field max-lengths come from the form controls.

const ISSUED_AT = ['الرياض', 'جدة', 'الدمام', 'القطيف', 'صفوى', 'مكة المكرمة']
const TITLES = ['01-Mr.', '02-Mrs.', '03-Miss', '04-Dr.', '05-Sheikh']
const BRANCHES = ['0001-Head Office', '0127-SWAIDI', '0002-City Centre']
const ALT_BRANCHES = ['0000-NONE', ...BRANCHES]
const CITIES = ['الرياض', 'جدة', 'الدمام', 'صفوى', 'القطيف']
const COUNTRIES = ['001 - Saudi Arabia', '002 - Bahrain', '003 - Kuwait', '004 - UAE']
const BUSINESS_TYPES = ['266-ANB Staff', '001-Government', '002-Private Sector', '003-Self Employed', '004-Retired']

// The six special-status flags across the top of the legacy form.
const STATUS_FLAGS = [
  { key: 'blind', label: 'Blind / Illiterate' },
  { key: 'veiled', label: 'Veiled Woman' },
  { key: 'incompetent', label: 'Incompetent Person' },
  { key: 'minor', label: 'Minor' },
  { key: 'minorSpl', label: 'Minor with Special Circumstances' },
  { key: 'mentDisabled', label: 'Mentally Disabled' },
] as const

// Identity documents block: five document rows, each with number, issuing
// place, Hijri/Gregorian date type, issue and expiry dates (max len 15 / 4).
type DateParts = { d: string; m: string; y: string }

const emptyDate: DateParts = { d: '', m: '', y: '' }
const DOC_ROWS = [
  { key: 'id', label: 'ID Number' },
  { key: 'passport', label: 'Passport No' },
  { key: 'hafiza', label: 'Hafiza No' },
  { key: 'samaAuth', label: 'Sama Auth No' },
  { key: 'familyRegn', label: 'Family Regn No' },
] as const

const SAMPLE = {
  customerNo: '0415741',
  branch: '0127-SWAIDI',
  altBranch: '0000-NONE',
  sysDate: '9/7/2025',
  flags: { blind: false, veiled: false, incompetent: false, minor: false, minorSpl: false, mentDisabled: false },
  docs: {
    id: { number: '1009326404', issuedAt: 'القطيف', dateType: 'H', issue: { d: '28', m: '01', y: '1414' }, expiry: { d: '02', m: '04', y: '1434' } },
    passport: { number: '', issuedAt: '', dateType: 'H', issue: { ...emptyDate }, expiry: { ...emptyDate } },
    hafiza: { number: '1009326404', issuedAt: 'القطيف', dateType: 'H', issue: { d: '14', m: '01', y: '1414' }, expiry: { d: '01', m: '01', y: '1434' } },
    samaAuth: { number: '', issuedAt: '', dateType: 'H', issue: { ...emptyDate }, expiry: { ...emptyDate } },
    familyRegn: { number: '', issuedAt: '', dateType: 'H', issue: { ...emptyDate }, expiry: { ...emptyDate } },
  },
  certOfBirthNo: '',
  language: 'Arabic',
  titleCode: '01-Mr.',
  names: {
    arabic: { first: 'حسين', second: 'سعيد', third: 'عبدالوهاب', last: 'كاظم', short: 'كاظم حسين سعيد عبدالوهاب' },
    english: { first: 'Hussain', second: 'Saeed', third: 'Abdulwahab', last: 'Kadem', short: 'Kadem Hussain Saeed Abdulwahab' },
  },
  dob: { calendar: 'Hijri', d: '17', m: '01', y: '1398' },
  gender: 'Male',
  maritalStatus: 'Married',
  dependents: '1',
  residency: 'Resident',
  businessType: '266-ANB Staff',
  addressType: 'PO Box',
  address1: 'المنطقة الشرقية',
  address2: 'البنك العربي الوطني-السويدي',
  poBox: '724',
  city: 'صفوى',
  zipCode: '31921',
  country: '001 - Saudi Arabia',
  phoneOff: { code: '01', number: '4261200' },
  phoneRes: { code: '01', number: '6642791' },
  fax: { code: '', number: '4261827' },
  mobile: { code: '05', number: '55877547' },
  pager: '37948',
  email: 'hkadem@anb.com.sa',
  opening: { date: '04/07/1998', branch: '0127', makerId: 'MIGRATION', supervisorId: 'MIGRATION' },
  update: { date: '31/05/2006', branch: '0127', makerId: '54302', supervisorId: '52551' },
}

function Segmented({
  options,
  value,
  onChange,
}: {
  options: readonly string[]
  value: string
  onChange?: (opt: string) => void
}) {
  return (
    <div className="inline-flex rounded-lg border border-edge-strong bg-surface p-0.5 shadow-xs">
      {options.map((opt) => (
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
}

function DateTriple({
  value,
  onChange,
}: {
  value: DateParts
  onChange?: (value: DateParts) => void
}) {
  const part = (k: keyof DateParts, w: string, max: number, ph: string) => (
    <input
      value={value[k]}
      maxLength={max}
      placeholder={ph}
      onChange={(e) => onChange?.({ ...value, [k]: e.target.value.replace(/\D/g, '') })}
      className={`${w} rounded-md border border-edge-strong bg-surface px-1.5 py-1.5 text-center text-sm text-ink shadow-xs focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/25`}
    />
  )
  return (
    <div className="flex items-center gap-1">
      {part('d', 'w-10', 2, 'DD')}
      <span className="text-faint">/</span>
      {part('m', 'w-10', 2, 'MM')}
      <span className="text-faint">/</span>
      {part('y', 'w-14', 4, 'YYYY')}
    </div>
  )
}

export default function IndividualSaudi({
  customer,
  historyAsOf,
  onBack,
  onNextPage,
  onAccounts,
  onCards,
  onHeirs,
  onReferences,
  onJointHolders,
}: {
  customer: Customer | null
  historyAsOf?: string
  onBack: () => void
  onNextPage?: () => void
  onAccounts?: () => void
  onCards?: () => void
  onHeirs?: () => void
  onReferences?: () => void
  onJointHolders?: () => void
}) {
  const [data, setData] = useState({ ...SAMPLE, customerNo: customer?.custNo ?? SAMPLE.customerNo })
  const [notice, setNotice] = useState<{ kind: 'info' | 'warn'; text: string } | null>(null)

  const set = (key: keyof typeof SAMPLE) => (value: unknown) => setData((d) => ({ ...d, [key]: value }))
  const setInput = (key: keyof typeof SAMPLE) => (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) =>
    set(key)(e.target.value)
  const setDoc = (docKey: keyof typeof SAMPLE.docs, field: string) => (value: unknown) =>
    setData((d) => ({ ...d, docs: { ...d.docs, [docKey]: { ...d.docs[docKey], [field]: value } } }))
  const setName = (lang: 'arabic' | 'english', field: string) => (e: ChangeEvent<HTMLInputElement>) =>
    setData((d) => ({
      ...d,
      names: { ...d.names, [lang]: { ...d.names[lang], [field]: e.target.value } },
    }))
  const toggleFlag = (key: keyof typeof SAMPLE.flags) =>
    setData((d) => ({ ...d, flags: { ...d.flags, [key]: !d.flags[key] } }))

  // cmdAcctInfo_Click / cmdCardInfo_Click: authority-gated, then search by
  // the loaded customer number.
  const handleAccount = () => {
    if (!hasAuthority('~6')) {
      setNotice({ kind: 'warn', text: 'You are not authorised for account facilities.' })
      return
    }
    onAccounts?.()
  }
  const handleCardInfo = () => {
    if (!hasAuthority('~4')) {
      setNotice({ kind: 'warn', text: 'You are not authorised for card facilities.' })
      return
    }
    onCards?.()
  }

  const labelCls = 'mb-1.5 block text-sm font-medium text-ink-soft'
  const roCls =
    'block w-full rounded-lg border border-edge bg-surface-muted px-3 py-2 text-sm text-muted shadow-xs focus:outline-none'

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            Individual — Saudi National
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            Customer Profile
          </h1>
          <p className="mt-1 text-sm text-muted">
            Page 1 of 2 — identity, personal and contact information.
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          Customer {data.customerNo}
        </span>
      </div>

      <HistoryBanner asOf={historyAsOf} />

      {notice && (
        <div
          className={`mb-5 flex items-center gap-2.5 rounded-xl border px-4 py-3 text-sm ${
            notice.kind === 'warn'
              ? 'border-warn/40 bg-warn-soft text-warn'
              : 'border-primary/30 bg-primary-soft text-primary-ink'
          }`}
        >
          {notice.text}
        </div>
      )}

      <div className="grid gap-5">
        <SectionCard title="Registration">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Customer Number" htmlFor="custNo">
              <input id="custNo" readOnly value={data.customerNo} className={roCls} />
            </Field>
            <Field label="Branch" htmlFor="branch">
              <Select id="branch" options={BRANCHES} value={data.branch} onChange={setInput('branch')} />
            </Field>
            <Field label="Alternative Br. Code" htmlFor="altBranch">
              <Select id="altBranch" options={ALT_BRANCHES} value={data.altBranch} onChange={setInput('altBranch')} />
            </Field>
            <Field label="Date" htmlFor="sysDate">
              <input id="sysDate" readOnly value={data.sysDate} className={roCls} />
            </Field>
          </div>

          <div className="mt-5 border-t border-edge-soft pt-4">
            <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
              Special Status
            </p>
            <div className="flex flex-wrap gap-2">
              {STATUS_FLAGS.map((flag) => {
                const on = data.flags[flag.key]
                return (
                  <button
                    key={flag.key}
                    type="button"
                    onClick={() => toggleFlag(flag.key)}
                    className={`inline-flex items-center gap-1.5 rounded-full border px-3 py-1.5 text-xs font-medium transition-colors ${
                      on
                        ? 'border-primary bg-primary-soft text-primary-ink'
                        : 'border-edge-strong bg-surface text-muted hover:bg-surface-muted'
                    }`}
                  >
                    <span
                      className={`flex h-3.5 w-3.5 items-center justify-center rounded-full border ${
                        on ? 'border-primary bg-primary' : 'border-edge-strong bg-surface'
                      }`}
                    >
                      {on && (
                        <svg viewBox="0 0 12 12" fill="none" stroke="white" strokeWidth="2.5" className="h-2.5 w-2.5">
                          <path d="M2.5 6.5 5 9l4.5-5.5" strokeLinecap="round" strokeLinejoin="round" />
                        </svg>
                      )}
                    </span>
                    {flag.label}
                  </button>
                )
              })}
            </div>
          </div>
        </SectionCard>

        <SectionCard
          title="Identity Documents"
          description="Issue and expiry dates follow the selected calendar (H = Hijri, G = Gregorian)."
        >
          <div className="overflow-x-auto">
            <table className="w-full min-w-[900px] border-collapse text-sm">
              <thead>
                <tr className="border-b border-edge text-left">
                  {['Document', 'Number', 'Issued At', 'Calendar', 'Issue Date', 'Expiry Date'].map((h) => (
                    <th key={h} className="whitespace-nowrap px-2 py-2.5 text-xs font-semibold uppercase tracking-wide text-muted">
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {DOC_ROWS.map(({ key, label }) => {
                  const doc = data.docs[key]
                  return (
                    <tr key={key} className="border-b border-edge-soft last:border-b-0">
                      <td className="whitespace-nowrap px-2 py-2.5 font-medium text-ink-soft">{label}</td>
                      <td className="px-2 py-2.5">
                        <TextInput
                          maxLength={15}
                          value={doc.number}
                          onChange={(e) => setDoc(key, 'number')(e.target.value)}
                          className="w-40"
                        />
                      </td>
                      <td className="px-2 py-2.5">
                        <Select
                          options={ISSUED_AT}
                          value={doc.issuedAt}
                          onChange={(e) => setDoc(key, 'issuedAt')(e.target.value)}
                          className="w-36"
                        />
                      </td>
                      <td className="px-2 py-2.5">
                        <Segmented options={['H', 'G']} value={doc.dateType} onChange={setDoc(key, 'dateType')} />
                      </td>
                      <td className="px-2 py-2.5">
                        <DateTriple value={doc.issue} onChange={setDoc(key, 'issue')} />
                      </td>
                      <td className="px-2 py-2.5">
                        <DateTriple value={doc.expiry} onChange={setDoc(key, 'expiry')} />
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </SectionCard>

        <SectionCard title="Personal Details">
          <div className="grid gap-4 sm:grid-cols-3">
            <Field label="Cert. of Birth No" htmlFor="cobNo">
              <TextInput id="cobNo" maxLength={15} value={data.certOfBirthNo} onChange={setInput('certOfBirthNo')} />
            </Field>
            <div>
              <span className={labelCls}>Language</span>
              <Segmented options={['Arabic', 'English']} value={data.language} onChange={set('language')} />
            </div>
            <Field label="Title Code" htmlFor="title">
              <Select id="title" options={TITLES} value={data.titleCode} onChange={setInput('titleCode')} />
            </Field>
          </div>

          <div className="mt-5 overflow-x-auto">
            <table className="w-full min-w-[820px] border-collapse text-sm">
              <thead>
                <tr className="border-b border-edge text-left">
                  {['', 'First Name', '2nd Name', '3rd Name', 'Last Name', 'Short Name'].map((h, i) => (
                    <th key={i} className="whitespace-nowrap px-2 py-2.5 text-xs font-semibold uppercase tracking-wide text-muted">
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {([
                  ['arabic', 'Arabic'],
                  ['english', 'English'],
                ] as const).map(([lang, label]) => (
                  <tr key={lang} className="border-b border-edge-soft last:border-b-0">
                    <td className="whitespace-nowrap px-2 py-2.5 font-medium text-ink-soft">{label}</td>
                    {(['first', 'second', 'third', 'last'] as const).map((f) => (
                      <td key={f} className="px-2 py-2.5">
                        <TextInput dir="auto" maxLength={15} value={data.names[lang][f]} onChange={setName(lang, f)} />
                      </td>
                    ))}
                    <td className="px-2 py-2.5">
                      <TextInput dir="auto" maxLength={30} value={data.names[lang].short} onChange={setName(lang, 'short')} className="min-w-52" />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-3">
            <div>
              <span className={labelCls}>Date of Birth</span>
              <div className="flex flex-wrap items-center gap-2">
                <Segmented
                  options={['Hijri', 'Gregorian']}
                  value={data.dob.calendar}
                  onChange={(v) => set('dob')({ ...data.dob, calendar: v })}
                />
                <DateTriple value={data.dob} onChange={(v) => set('dob')({ ...data.dob, ...v })} />
              </div>
            </div>
            <div>
              <span className={labelCls}>Gender</span>
              <Segmented options={['Male', 'Female']} value={data.gender} onChange={set('gender')} />
            </div>
            <div>
              <span className={labelCls}>Marital Status</span>
              <Segmented options={['Married', 'Single', 'Others']} value={data.maritalStatus} onChange={set('maritalStatus')} />
            </div>
            <Field label="Dependents" htmlFor="dependents">
              <TextInput id="dependents" maxLength={2} value={data.dependents} onChange={setInput('dependents')} className="w-20" />
            </Field>
            <div>
              <span className={labelCls}>Resident / Non-Resident</span>
              <Segmented options={['Resident', 'Non Resident']} value={data.residency} onChange={set('residency')} />
            </div>
            <Field label="Business Type" htmlFor="bizType">
              <Select id="bizType" options={BUSINESS_TYPES} value={data.businessType} onChange={setInput('businessType')} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Address & Contact">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <div>
              <span className={labelCls}>Address Type</span>
              <Segmented options={['PO Box', 'GPS']} value={data.addressType} onChange={set('addressType')} />
            </div>
            <Field label="Address Line 1" htmlFor="addr1" className="lg:col-span-2">
              <TextInput id="addr1" dir="auto" maxLength={30} value={data.address1} onChange={setInput('address1')} />
            </Field>
            <Field label="Address Line 2" htmlFor="addr2" className="lg:col-span-1">
              <TextInput id="addr2" dir="auto" maxLength={30} value={data.address2} onChange={setInput('address2')} />
            </Field>
            <Field label="P.O. Box" htmlFor="poBox">
              <TextInput id="poBox" maxLength={10} value={data.poBox} onChange={setInput('poBox')} />
            </Field>
            <Field label="City" htmlFor="city">
              <Select id="city" options={CITIES} value={data.city} onChange={setInput('city')} />
            </Field>
            <Field label="Zip Code" htmlFor="zip">
              <TextInput id="zip" maxLength={10} value={data.zipCode} onChange={setInput('zipCode')} />
            </Field>
            <Field label="Country" htmlFor="country">
              <Select id="country" options={COUNTRIES} value={data.country} onChange={setInput('country')} />
            </Field>
          </div>

          <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-3">
            {([
              ['phoneOff', 'Phone (Office)', 4, 10],
              ['phoneRes', 'Phone (Residence)', 4, 10],
              ['fax', 'Fax', 4, 10],
              ['mobile', 'Mobile', 2, 8],
            ] as const).map(([key, label, codeLen, numLen]) => (
              <div key={key}>
                <span className={labelCls}>{label}</span>
                <div className="flex gap-2">
                  <TextInput
                    aria-label={`${label} code`}
                    maxLength={codeLen}
                    value={data[key].code}
                    onChange={(e) => set(key)({ ...data[key], code: e.target.value })}
                    className="w-16"
                    placeholder="Code"
                  />
                  <TextInput
                    aria-label={`${label} number`}
                    maxLength={numLen}
                    value={data[key].number}
                    onChange={(e) => set(key)({ ...data[key], number: e.target.value })}
                  />
                </div>
              </div>
            ))}
            <Field label="Pager" htmlFor="pager">
              <TextInput id="pager" maxLength={10} value={data.pager} onChange={setInput('pager')} />
            </Field>
            <Field label="E-Mail" htmlFor="email">
              <TextInput id="email" maxLength={30} value={data.email} onChange={setInput('email')} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Open / Update Details" description="Audit trail — populated by the system.">
          <div className="grid gap-4 lg:grid-cols-2">
            {([
              ['opening', 'Opening Details', 'Opening Date'],
              ['update', 'Update Details', 'Last Update Date'],
            ] as const).map(([key, title, dateLabel]) => (
              <div key={key} className="rounded-xl border border-edge bg-surface-muted/60 p-4">
                <p className="mb-3 text-xs font-semibold uppercase tracking-wider text-muted-soft">{title}</p>
                <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
                  {[
                    [dateLabel, data[key].date],
                    ['Branch', data[key].branch],
                    ['Maker ID', data[key].makerId],
                    ['Supervisor ID', data[key].supervisorId],
                  ].map(([l, v]) => (
                    <div key={l}>
                      <p className="text-xs text-muted-soft">{l}</p>
                      <p className="mt-0.5 text-sm font-medium text-ink-soft">{v}</p>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </SectionCard>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <button
            type="button"
            onClick={handleAccount}
            className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
          >
            Account
          </button>
          <button
            type="button"
            onClick={handleCardInfo}
            className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
          >
            Card Info
          </button>
          <button
            type="button"
            onClick={() => onHeirs?.()}
            className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
          >
            Heirs / Proxy
          </button>
          <button
            type="button"
            onClick={() => onReferences?.()}
            className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
          >
            References
          </button>
          <button
            type="button"
            onClick={() => onJointHolders?.()}
            className="rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
          >
            Joint Holders
          </button>
          {/* Enabled only during supervisor approval flows in the legacy app. */}
          <button
            type="button"
            disabled
            title="Available during supervisor approval only"
            className="rounded-lg border border-edge bg-surface-muted px-4 py-2.5 text-sm font-medium text-muted-soft shadow-xs cursor-not-allowed"
          >
            Supervisor Comments
          </button>

          <button
            type="button"
            onClick={() => onNextPage?.()}
            className="ml-auto inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50"
          >
            Next Page
            <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4">
              <path
                fillRule="evenodd"
                d="M3 10a.75.75 0 0 1 .75-.75h10.638L10.23 5.29a.75.75 0 1 1 1.04-1.08l5.5 5.25a.75.75 0 0 1 0 1.08l-5.5 5.25a.75.75 0 1 1-1.04-1.08l4.158-3.96H3.75A.75.75 0 0 1 3 10Z"
                clipRule="evenodd"
              />
            </svg>
          </button>
          <button
            type="button"
            onClick={onBack}
            className="rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
          >
            Cancel
          </button>
        </div>
      </div>
    </main>
  )
}
