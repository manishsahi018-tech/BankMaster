import { SectionCard } from '../components/fields.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Customer } from '../types.ts'
import { codeLabel } from '../codes.ts'
import {
  RoText,
  RoCombo,
  Field,
  Segmented,
  DateTriple,
  CheckBoxGroup,
  BackArrow,
  isFirst,
} from '../components/legacyForm.tsx'

import { t } from '../i18n/index.ts'
// The panel behind the Joint Holders grid — frmIndividualJoint's double-click
// (jointInfoGrid_DblClick → fetchJointDetailInfo), and the widest of the
// related-party panels at 56 labels, 42 text boxes and 19 option buttons.
//
// It is laid out as a PROFILE rather than as a party card, because that is what
// the data is: stjointtab keeps a joint holder as a near-complete customer
// record — 73 columns — so the frames here mirror the customer profile's own
// (identity, personal, address, employment) and no side reads are needed.
//
// Two column names carry over from the view as-is: a2ndName/a3rdName, where
// stcusttab says aSecondName, and `segmenation`, which is misspelled in the
// view itself.

const OWNERSHIP = [
  'Rented Home',
  'Own House',
  'Com. Accomodation',
  'Rented Car',
  'Own Car',
  'Company Transport',
] as const

export default function JointHolderDetail({
  customer,
  detail,
  onReturn,
}: {
  customer: Customer | null
  detail: GridRow
  onReturn: () => void
}) {
  const d = detail as Record<string, string>
  const idHijri = d.idDateType === '0'
  const dobHijri = isFirst(d.dobDateType)
  const poBoxMode = String(d.addressType ?? '').trim() !== '1'
  const sex = String(d.sexCode ?? '').trim().toUpperCase()
  const marital = String(d.marritalStatus ?? '').trim().toUpperCase()
  const maritalIdx = marital === 'M' || marital === '0' ? 0 : marital === 'S' || marital === '1' ? 1 : 2

  const phone = (area?: string, no?: string, ext?: string) => (
    <div className="flex gap-2">
      <RoText value={area} className="w-16 text-center tabular-nums" />
      <RoText value={no} className="tabular-nums" />
      <RoText value={ext} className="w-16 tabular-nums" />
    </div>
  )

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {t('Joint Holders')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            {t('Joint Holder Details')}
          </h1>
          <p className="mt-1 text-sm text-muted">
            {t('Read-only enquiry — identity, personal, address and employment.')}
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          {t('Customer {custNo} · Joint {jointNo}', { custNo: customer?.custNo ?? '', jointNo: d.jointCustNo })}
        </span>
      </div>

      <div className="grid gap-5">
        <SectionCard title="Registration">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Joint Customer Number">
              <RoText value={d.jointCustNo} muted className="tabular-nums" />
            </Field>
            <Field label="Branch">
              <RoCombo value={codeLabel('branch', d.branchCode)} />
            </Field>
            <Field label="Joined On">
              <DateTriple value={d.jointOpenDate} />
            </Field>
            <Field label="Active">
              <Segmented options={['Yes', 'No']} selected={d.activeStatus === '1' ? 0 : 1} />
            </Field>
          </div>

          <div className="mt-5 overflow-x-auto border-t border-edge-soft pt-4">
            <div className="grid min-w-[760px] grid-cols-[5rem_repeat(5,1fr)] gap-x-3 gap-y-2">
              <span />
              {['First Name', '2nd Name', '3rd Name', 'Last Name', 'Short Name'].map((h) => (
                <span
                  key={h}
                  className="text-xs font-semibold uppercase tracking-wide text-muted-soft"
                >
                  {t(h)}
                </span>
              ))}
              <span className="self-center text-sm font-medium text-ink-soft">{t('Arabic')}</span>
              <RoText value={d.aFirstName} dir="rtl" className="text-end" />
              <RoText value={d.a2ndName} dir="rtl" className="text-end" />
              <RoText value={d.a3rdName} dir="rtl" className="text-end" />
              <RoText value={d.aLastName} dir="rtl" className="text-end" />
              <RoText value={d.aShortName} dir="rtl" className="text-end" />
              <span className="self-center text-sm font-medium text-ink-soft">{t('English')}</span>
              <RoText value={d.eFirstName} />
              <RoText value={d.e2ndName} />
              <RoText value={d.e3rdName} />
              <RoText value={d.eLastName} />
              <RoText value={d.eShortName} />
            </div>
          </div>
        </SectionCard>

        <SectionCard
          title="Identity Document"
          description="Issue and expiry follow the selected calendar (H = Hijri, G = Gregorian)."
        >
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="ID Type">
              <RoCombo value={codeLabel('idType', d.idType)} />
            </Field>
            <Field label="ID Number">
              <RoText value={d.idNo} />
            </Field>
            <Field label="Issued At">
              <RoText value={d.idIssuedAt} />
            </Field>
            <Field label="ID Date Type">
              <Segmented options={['Hijri', 'Gregorian']} selected={idHijri ? 0 : 1} />
            </Field>
            <Field label="Issue Date">
              <DateTriple value={idHijri ? d.idIssueDateH : d.idIssueDateG} />
            </Field>
            <Field label="Expiry Date">
              <DateTriple value={idHijri ? d.idExpiryDateH : d.idExpiryDateG} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Personal Details">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Language">
              <Segmented options={['Arabic', 'English']} selected={isFirst(d.preferredLang) ? 0 : 1} />
            </Field>
            <Field label="Nationality">
              <RoCombo value={codeLabel('country', d.nationality)} />
            </Field>
            <Field label="Title Code">
              <RoCombo value={codeLabel('title', d.titleCode) || d.titleCode} />
            </Field>
            <Field label="Gender">
              <Segmented options={['Male', 'Female']} selected={sex === 'F' ? 1 : 0} />
            </Field>
            <Field label="Date of Birth">
              <div className="flex flex-wrap items-center gap-2">
                <Segmented options={['Hijri', 'Gregorian']} selected={dobHijri ? 0 : 1} />
                <DateTriple value={dobHijri ? d.dobDateH : d.dobDateG} />
              </div>
            </Field>
            <Field label="Marital Status">
              <Segmented options={['Married', 'Single', 'Other']} selected={maritalIdx} />
            </Field>
            <Field label="Dependents">
              <RoText value={d.noOfDependents} className="tabular-nums" />
            </Field>
            <Field label="Resident / Non-Resident">
              <Segmented options={['Resident', 'Non-Resident']} selected={isFirst(d.residentStatus) ? 0 : 1} />
            </Field>
            <Field label="Business Type">
              <RoCombo value={codeLabel('businessType', d.businessType)} />
            </Field>
            <Field label="VIP">
              <RoText value={d.vipCode} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Address & Contact">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Address Type">
              <Segmented options={['P.O. Box', 'Saudi Post']} selected={poBoxMode ? 0 : 1} />
            </Field>
            <Field label="Address Line 1" className="lg:col-span-2">
              <RoText value={d.address1} />
            </Field>
            <Field label="Address Line 2" className="lg:col-span-2">
              <RoText value={d.address2} />
            </Field>
            <Field label={poBoxMode ? 'P.O. Box' : 'Unit'}>
              <RoText value={poBoxMode ? d.poBox : d.unitNo} className="tabular-nums" />
            </Field>
            <Field label="GPS Number">
              <RoText value={d.gprsNo} className="tabular-nums" />
            </Field>
            <Field label="City">
              <RoCombo value={d.cityName} />
            </Field>
            <Field label="Zip Code">
              <RoText value={d.zipCode} className="tabular-nums" />
            </Field>
            <Field label="Country">
              <RoCombo value={codeLabel('country', d.country)} />
            </Field>
            <Field label="Phone (Office)">{phone(d.telOffAreaCode, d.telOffNo, d.telOffExt)}</Field>
            <Field label="Phone (Residence)">
              {phone(d.telHomeAreaCode, d.telHomeNo, d.telHomeExt)}
            </Field>
            <Field label="Fax">{phone(d.faxAreaCode, d.faxNo, d.faxExt)}</Field>
            <Field label="Mobile">
              <RoText value={d.mobileNo} className="tabular-nums" />
            </Field>
            <Field label="Pager">
              <RoText value={d.pagerNo} className="tabular-nums" />
            </Field>
            <Field label="E-Mail" className="lg:col-span-2">
              <RoText value={d.eMail} dir="ltr" />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Employment & Income">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Education">
              <RoCombo value={codeLabel('education', d.educationCode) || d.educationCode} />
            </Field>
            <Field label="Profession">
              <RoCombo value={codeLabel('profession', d.professionCode) || d.professionCode} />
            </Field>
            <Field label="Position">
              <RoCombo value={codeLabel('position', d.positionCode) || d.positionCode} />
            </Field>
            <Field label="Monthly Income">
              <RoCombo value={codeLabel('monthlyIncome', d.monthlyIncome) || d.monthlyIncome} />
            </Field>
            <Field label="Segmentation">
              {/* `segmenation` — the view's own spelling. */}
              <RoCombo value={codeLabel('segmentation', d.segmenation) || d.segmenation} />
            </Field>
          </div>

          <div className="mt-5 border-t border-edge-soft pt-4">
            <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
              {t('Owner Ship')}
            </p>
            <CheckBoxGroup
              flags={OWNERSHIP.map((label, i) => ({
                label,
                on: (d.ownerShip ?? '').charAt(i) === '1',
              }))}
            />
          </div>

          <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-5">
            <Field label="Employer Name" className="lg:col-span-2">
              <RoText value={d.employerName} />
            </Field>
            <Field label="Dept.">
              <RoText value={d.department} />
            </Field>
            <Field label="P.O.">
              <RoText value={d.employerPoBox} className="tabular-nums" />
            </Field>
            <Field label="City">
              <RoText value={d.employerCity} />
            </Field>
            <Field label="Zip">
              <RoText value={d.employerZipCode} className="tabular-nums" />
            </Field>
          </div>
        </SectionCard>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <button
            type="button"
            onClick={onReturn}
            className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
          >
            <BackArrow />
            {t('Return')}
          </button>
        </div>
      </div>
    </main>
  )
}
