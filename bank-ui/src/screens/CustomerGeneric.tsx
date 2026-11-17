import { SectionCard } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { codeLabel } from '../codes.ts'
import {
  RoText,
  RoCombo,
  Field,
  Segmented,
  DateTriple,
  isFirst,
  btnKinds,
  NextPageButton,
} from '../components/legacyForm.tsx'

import { t } from '../i18n/index.ts'
// Mirrors frmCustomer — "Customer Maintenance", the generic customer form.
//
// This is the form a customer opens on when the category pair cannot pick a
// specialised one: getScreenSetNo is consulted only when BOTH categories carry
// a value (frmEnquirySelect.frm:642, frmCustUpdateHistory.frm:355), and a blank
// either side is screen set '0', which is this form. Both routes reach it the
// same way, so an uncategorised customer opens here from Search Results and
// from Customer Update History alike.
//
// Its field set is the union of the individual and juristic profiles rather
// than a subset of either — with no category to say which kind of customer this
// is, the form carries both the personal frames and the company ones. The
// Company Information card is therefore always rendered, unlike the individual
// profiles which have no such frame at all.
//
// Labels come from frmCustomerCaption (globalVaribles.bas), the table Form_Load
// writes over the designer captions at runtime.
//
// Data is the same stcusttab profile the other profile screens use
// (api.customerProfile), or the stcustlog snapshot in history mode
// (api.customerProfileAsOf).

/** Enquiry-only build: the supervisor-approval action is hidden, not disabled. */
const ENQUIRY_ONLY = true

export default function CustomerGeneric({
  profile,
  historyAsOf,
  onNextPage,
  onAccounts,
  onCards,
  onBack,
}: {
  profile: GridRow
  historyAsOf?: string
  onNextPage?: () => void
  onAccounts?: () => void
  onCards?: () => void
  onBack: () => void
}) {
  // custType '0' is a person; anything else is an organisation, and the two
  // date-of-birth captions become "DOE Type" / "Date of Esta." — the one label
  // swap fillFrmCustomer performs (globalFunctions.bas:2207-2217, captions
  // 26/29 vs 71/72).
  const juristic = String(profile.custType ?? '').trim() !== '0'
  const dobLabel = juristic ? 'Date of Esta.' : 'Date of Birth'

  const idHijri = isFirst(profile.idDateType)
  const dobHijri = isFirst(profile.dobDateType)
  const crHijri = isFirst(profile.crIssueDateType)

  const marital = String(profile.marritalStatus ?? '').trim().toUpperCase()
  const maritalIdx = marital === 'M' || marital === '0' ? 0 : marital === 'S' || marital === '1' ? 1 : 2
  const sex = String(profile.sexCode ?? '').trim().toUpperCase()
  const vip = String(profile.vipCode ?? '').trim()

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {t('Uncategorised Customer')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            {t('Customer Maintenance')}
          </h1>
          <p className="mt-1 text-sm text-muted">
            {t('This customer carries no SAMA category, so the general customer form is shown.')}
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          {t('Customer {custNo}', { custNo: profile.custNo })}
        </span>
      </div>

      <HistoryBanner asOf={historyAsOf} />

      <div className="grid gap-5">
        <SectionCard title="Registration">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Customer Number">
              <RoText value={profile.custNo} muted className="tabular-nums" />
            </Field>
            <Field label="Branch">
              <RoCombo value={codeLabel('branch', profile.branchCode)} />
            </Field>
            <Field label="Alternative Br. Code">
              <RoCombo
                value={
                  String(profile.altBranchCode ?? '').trim() === '0000' || !profile.altBranchCode
                    ? '0000-NONE'
                    : codeLabel('branch', profile.altBranchCode)
                }
              />
            </Field>
            {/* The legacy fills this combo from customertypeinfo, a table in
                its LOCAL Access database, and /api/codes carries no equivalent
                list — the archival dictionary describes custType but maps no
                code to a name. Shown as the stored code rather than a label
                invented here. */}
            <Field label="Cust. Type">
              <RoText value={profile.custType} className="tabular-nums" />
            </Field>
          </div>
        </SectionCard>

        <SectionCard
          title="Identity"
          description="Issue and expiry dates follow the selected calendar (H = Hijri, G = Gregorian)."
        >
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            <Field label="ID Type">
              <RoCombo value={codeLabel('idType', profile.idType) || profile.idType} />
            </Field>
            <Field label="ID Number">
              <RoText value={profile.idNo} className="tabular-nums" />
            </Field>
            <Field label="Issued At">
              <RoCombo value={profile.idIssuedAt} />
            </Field>
            <Field label="ID Date Type">
              <Segmented options={['Hijri', 'Gregorian']} selected={idHijri ? 0 : 1} />
            </Field>
            <Field label="Issue Date">
              <DateTriple value={idHijri ? profile.idIssueDateH : profile.idIssueDateG} />
            </Field>
            <Field label="Expiry Date">
              <DateTriple value={idHijri ? profile.idExpiryDateH : profile.idExpiryDateG} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Customer Name">
          <div className="grid gap-4 sm:grid-cols-3">
            <Field label="Language">
              <Segmented options={['Arabic', 'English']} selected={isFirst(profile.preferredLang) ? 0 : 1} />
            </Field>
            <Field label="Nationality">
              <RoCombo value={codeLabel('country', profile.nationality)} />
            </Field>
            <Field label="Title Code">
              <RoCombo value={codeLabel('title', profile.titleCode) || profile.titleCode} />
            </Field>
          </div>

          {/* name grid: 5 parts x Arabic / English, as frameCustomerName lays
              them out — the same shape the individual profiles use. */}
          <div className="mt-5 overflow-x-auto">
            <div className="grid min-w-[760px] grid-cols-[5rem_repeat(5,1fr)] gap-x-3 gap-y-2">
              <span />
              {['First Name', '2nd Name', '3rd Name', 'Last Name', 'Short Name'].map((h) => (
                <span key={h} className="text-xs font-semibold uppercase tracking-wide text-muted-soft">
                  {t(h)}
                </span>
              ))}

              <span className="self-center text-sm font-medium text-ink-soft">{t('Arabic')}</span>
              <RoText value={profile.aFirstName} dir="rtl" className="text-start" />
              <RoText value={profile.a2ndName} dir="rtl" className="text-start" />
              <RoText value={profile.a3rdName} dir="rtl" className="text-start" />
              <RoText value={profile.aLastName} dir="rtl" className="text-start" />
              <RoText value={profile.aShortName} dir="rtl" className="text-start" />

              <span className="self-center text-sm font-medium text-ink-soft">{t('English')}</span>
              <RoText value={profile.eFirstName} />
              <RoText value={profile.e2ndName} />
              <RoText value={profile.e3rdName} />
              <RoText value={profile.eLastName} />
              <RoText value={profile.eShortName} />
            </div>
          </div>
        </SectionCard>

        <SectionCard title="Personal Details">
          <div className="grid gap-4 sm:grid-cols-3">
            <Field label={dobLabel}>
              <div className="flex flex-wrap items-center gap-2">
                <Segmented options={['Hijri', 'Gregorian']} selected={dobHijri ? 0 : 1} />
                <DateTriple value={dobHijri ? profile.dobDateH : profile.dobDateG} />
              </div>
            </Field>
            <Field label="Gender">
              <Segmented options={['Male', 'Female']} selected={sex === 'F' ? 1 : 0} />
            </Field>
            <Field label="VIP">
              <Segmented options={['Yes', 'No']} selected={vip === '1' ? 0 : 1} />
            </Field>
            <Field label="Marital Status">
              <Segmented options={['Married', 'Single', 'Others']} selected={maritalIdx} />
            </Field>
            <Field label="Dependents">
              <RoText value={profile.noOfDependents} className="tabular-nums" />
            </Field>
            <Field label="Resident / Non-Resident">
              <Segmented
                options={['Resident', 'Non Resident']}
                selected={isFirst(profile.residentStatus) ? 0 : 1}
              />
            </Field>
            {/* cmbBusinessType sits at form level (frmCustomer.frm:716), OUTSIDE
                frameCompanyInfo (:1219-1585) — it describes the customer, not
                the company, and an individual carries one too. */}
            <Field label="Business Type">
              <RoCombo value={codeLabel('businessType', profile.businessType)} />
            </Field>
          </div>
        </SectionCard>

        {/* frameCompanyInfo. Always rendered: with no category to say whether
            this customer is a person or an organisation, the legacy shows the
            frame either way and leaves it blank for a person. */}
        <SectionCard
          title="Company Information"
          description="Blank for a personal customer."
        >
          <div className="overflow-x-auto">
            <div className="grid min-w-[560px] grid-cols-[5rem_1fr_1fr] gap-x-3 gap-y-2">
              <span />
              {['Organisation Name', 'Short Name'].map((h) => (
                <span key={h} className="text-xs font-semibold uppercase tracking-wide text-muted-soft">
                  {t(h)}
                </span>
              ))}

              <span className="self-center text-sm font-medium text-ink-soft">{t('Arabic')}</span>
              <RoText value={profile.aOrgName1} dir="rtl" className="text-start" />
              <RoText value={profile.aOrgShortName} dir="rtl" className="text-start" />

              <span />
              <RoText value={profile.aOrgName2} dir="rtl" className="text-start" />
              <span />

              <span className="self-center text-sm font-medium text-ink-soft">{t('English')}</span>
              <RoText value={profile.eOrgName1} />
              <RoText value={profile.eOrgShortName} />

              <span />
              <RoText value={profile.eOrgName2} />
              <span />
            </div>
          </div>

          <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-3">
            <Field label="Org Alpha Search">
              <RoText value={profile.orgAlphaSearchCode} />
            </Field>
            <Field label="C.R.Number">
              <RoText value={profile.crNo} className="tabular-nums" />
            </Field>
            <Field label="Issued At">
              <RoCombo value={profile.crIssuedAt} />
            </Field>
            <Field label="Date Type">
              <Segmented options={['Hijri', 'Gregorian']} selected={crHijri ? 0 : 1} />
            </Field>
            <Field label="Issue Date">
              <DateTriple value={crHijri ? profile.crIssueDateH : profile.crIssueDateG} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Address & Contact">
          <div className="grid gap-4 sm:grid-cols-2">
            <Field label="Address">
              <RoText value={profile.address1} />
            </Field>
            <Field label="Address 2">
              <RoText value={profile.address2} />
            </Field>
          </div>

          <div className="mt-4 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="P.O. Box">
              <RoText value={profile.poBox} />
            </Field>
            <Field label="City">
              <RoCombo value={profile.cityName} />
            </Field>
            <Field label="Zip Code">
              <RoText value={profile.zipCode} className="tabular-nums" />
            </Field>
            <Field label="Country">
              <RoCombo value={codeLabel('country', profile.country)} />
            </Field>
          </div>

          <div className="mt-4 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-3">
            <Field label="Phone(Off)">
              <div className="flex gap-2">
                <RoText value={profile.telOffAreaCode} className="w-16 text-center tabular-nums" />
                <RoText value={profile.telOffNo} className="tabular-nums" />
                <RoText value={profile.telOffExt} className="w-16 tabular-nums" />
              </div>
            </Field>
            <Field label="Phone(Res.)">
              <div className="flex gap-2">
                <RoText value={profile.telHomeAreaCode} className="w-16 text-center tabular-nums" />
                <RoText value={profile.telHomeNo} className="tabular-nums" />
                <RoText value={profile.telHomeExt} className="w-16 tabular-nums" />
              </div>
            </Field>
            <Field label="Fax">
              <div className="flex gap-2">
                <RoText value={profile.faxAreaCode} className="w-16 text-center tabular-nums" />
                <RoText value={profile.faxNo} className="tabular-nums" />
                <RoText value={profile.faxExt} className="w-16 tabular-nums" />
              </div>
            </Field>
            <Field label="Mobile">
              {/* stored as 10 chars, split [area 1-2][number 3-10] */}
              <div className="flex gap-2">
                <RoText
                  value={String(profile.mobileNo ?? '').slice(0, 2)}
                  className="w-16 text-center tabular-nums"
                />
                <RoText value={String(profile.mobileNo ?? '').slice(2)} className="tabular-nums" />
              </div>
            </Field>
            <Field label="Pager">
              <RoText value={profile.pagerNo} className="tabular-nums" />
            </Field>
            <Field label="E_Mail">
              <RoText value={profile.eMail} />
            </Field>
          </div>
        </SectionCard>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <button type="button" onClick={() => onAccounts?.()} className={btnKinds.secondary}>
            {t('Account')}
          </button>
          <button type="button" onClick={() => onCards?.()} className={btnKinds.secondary}>
            {t('Card Info')}
          </button>
          {!ENQUIRY_ONLY && (
            <button
              type="button"
              disabled
              title={t('Available during supervisor approval only')}
              className={btnKinds.disabled}
            >
              {t('Supervisor Comments')}
            </button>
          )}
          <NextPageButton onClick={() => onNextPage?.()} />
          <button type="button" onClick={onBack} className={btnKinds.danger}>
            {t('Cancel')}
          </button>
        </div>
      </div>
    </main>
  )
}
