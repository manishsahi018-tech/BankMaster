import { SectionCard } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import type { Customer } from '../types.ts'
import { codeLabel } from '../codes.ts'
import {
  RoText,
  RoCombo,
  Field,
  Segmented,
  DateTriple,
  NextPageButton,
  PrevPageButton,
  btnKinds,
} from '../components/legacyForm.tsx'
import {
  EmploymentAndIncome,
  PackageFeesAndMemos,
  HIJRI_GREG,
  calendarIndex,
  pickRaw,
} from './profilePageFields.tsx'

// Mirrors legacy frmIndividualOthers2.frm ("Customers Maintenance Page 2 - For
// Other Individuals") — the page the profile used to skip — field for field, in
// the form's own frame order and with the form's own controls: combos for the
// code lists, Yes/No segments for the option pairs, six ownership check-boxes,
// and DD/MM/YYYY triples beside a Hijri/Gregorian segment for every date.
//
// It is built from the legacyForm primitives rather than DetailScreen so that it
// reads as the same FORM as page 1 (IndividualOthers). DetailScreen is the
// vocabulary for drill-down detail views; a profile page that mirrors a VB6
// data-entry form belongs in the vocabulary its page 1 already uses, or the
// operator turns the page and lands somewhere that looks like a different app.
//
// The legacy order is page 1 (frmIndividualOthers) → cmdNext → THIS page
// (frmIndividualOthers.frm:3822) → cmdNextPage → frmIndividualOthersAcctInfo
// (frmIndividualOthers2.frm:2473-2493), and Previous Page walks back the same way.
//
// Sources, all from the C's enquiry pass (processIndividualOthersDetails,
// cbothers.c:2860-3200), served together by /api/customers/{custNo}/acct-info:
//   stcusttab   employment, income, ownership, fees, memos, package
//   staddrtab   addressType '01' — the abroad/home-country address block
//   stidtab     idType 'M' home country id, 'S' SAMA authorisation,
//               'A' approval document (idRefName is the approver's name)
//
// Read-only throughout: the legacy disables every frame in search/history mode.

export default function IndividualOthersPage2({
  customer,
  acctInfo,
  historyAsOf,
  onPrevPage,
  onNextPage,
  onCancel,
}: {
  customer: Customer | null
  acctInfo: Record<string, string>
  historyAsOf?: string
  onPrevPage: () => void
  onNextPage: () => void
  onCancel: () => void
}) {
  const a = acctInfo
  const mainCategory = codeLabel('samaMainCategory', customer?.mainCategoryCode)
  const subCategory = codeLabel('samaSubCategory', customer?.subCategoryCode)

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            Individual — Other Nationality
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">Customer Details</h1>
          <p className="mt-1 text-sm text-muted">
            Page 2 of 3 — employment, ownership, home country and approvals.
          </p>
        </div>
        {/* The form heads itself with the customer's category pair —
            lblMainCategoryDesc / lblSubCategoryDesc, set in Form_Load
            (frmIndividualOthers2.frm:2514-2515). */}
        <div className="flex flex-col items-end gap-1.5">
          <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
            Customer {customer?.custNo}
          </span>
          {(mainCategory || subCategory) && (
            <p className="text-xs text-muted">
              <span className="font-medium text-ink-soft">Category</span> {mainCategory}
              {subCategory ? ` · ${subCategory}` : ''}
            </p>
          )}
        </div>
      </div>

      <HistoryBanner asOf={historyAsOf} />

      <div className="grid gap-5">
        {/* Frames 1 and 2 are shared with the Saudi page 2, which carries the
            same two frames above its accounts block. */}
        <EmploymentAndIncome a={a} />
        <PackageFeesAndMemos a={a} />

        {/* Frame 3 — home country id and the abroad address with its own contacts. */}
        <SectionCard title="Home Country">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Home Country ID">
              <RoText value={a.homeCountryId} />
            </Field>
            <Field label="ID Date Type">
              <Segmented
                options={HIJRI_GREG}
                selected={calendarIndex(a.homeCountryIdDateType)}
              />
            </Field>
            <Field label="Issue Date">
              <DateTriple
                value={pickRaw(
                  a.homeCountryIdDateType,
                  a.homeCountryIdIssueDateH,
                  a.homeCountryIdIssueDateG,
                )}
              />
            </Field>
            <Field label="Expiry Date">
              <DateTriple
                value={pickRaw(
                  a.homeCountryIdDateType,
                  a.homeCountryIdExpiryDateH,
                  a.homeCountryIdExpiryDateG,
                )}
              />
            </Field>
            <Field label="Home Address" className="lg:col-span-2">
              <RoText value={a.homeAddress1} />
            </Field>
            <Field label="Home Address 2" className="lg:col-span-2">
              <RoText value={a.homeAddress2} />
            </Field>
            <Field label="P.O. Box">
              <RoText value={a.homePoBox} className="tabular-nums" />
            </Field>
            <Field label="City">
              <RoCombo value={a.homeCityName} />
            </Field>
            <Field label="Zip Code">
              <RoText value={a.homeZipCode} className="tabular-nums" />
            </Field>
            <Field label="Country">
              <RoCombo value={codeLabel('country', a.homeCountry)} />
            </Field>
            <Field label="Phone (Off)">
              <div className="flex gap-2">
                <RoText value={a.homeTelOffAreaCode} className="w-16 text-center tabular-nums" />
                <RoText value={a.homeTelOffNo} className="tabular-nums" />
                <RoText value={a.homeTelOffExt} className="w-16 tabular-nums" />
              </div>
            </Field>
            <Field label="Phone (Res.)">
              <div className="flex gap-2">
                <RoText value={a.homeTelHomeAreaCode} className="w-16 text-center tabular-nums" />
                <RoText value={a.homeTelHomeNo} className="tabular-nums" />
                <RoText value={a.homeTelHomeExt} className="w-16 tabular-nums" />
              </div>
            </Field>
            <Field label="Fax">
              <div className="flex gap-2">
                <RoText value={a.homeFaxAreaCode} className="w-16 text-center tabular-nums" />
                <RoText value={a.homeFaxNo} className="tabular-nums" />
                <RoText value={a.homeFaxExt} className="w-16 tabular-nums" />
              </div>
            </Field>
            <Field label="Mobile">
              <RoText value={a.homeMobileNo} className="tabular-nums" />
            </Field>
            <Field label="Pager">
              <RoText value={a.homePagerNo} className="tabular-nums" />
            </Field>
            <Field label="E-Mail" className="lg:col-span-2">
              <RoText value={a.homeEmail} dir="ltr" />
            </Field>
          </div>
        </SectionCard>

        {/* Frame 4 — the form's lower block: grace period, references, approvals. */}
        <SectionCard title="References & Approvals">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Freezing Grace Period">
              <div className="flex items-center gap-2">
                <RoText value={a.freezingGracePeriod} className="w-20 text-center tabular-nums" />
                <span className="text-sm text-muted">Day(s)</span>
              </div>
            </Field>
            <Field label="Inter-Group Acc. No.">
              <RoText value={a.interGroupAccNo} className="tabular-nums" />
            </Field>
            <Field label="Special Reference No.">
              <RoText value={a.specialRefNo} />
            </Field>
            <div className="hidden lg:block" />
            <Field label="SAMA Approval No.">
              <RoText value={a.samaAuthNo} />
            </Field>
            <Field label="Date Type">
              <Segmented options={HIJRI_GREG} selected={calendarIndex(a.samaAuthDateType)} />
            </Field>
            <Field label="SAMA Approval Date">
              <DateTriple value={pickRaw(a.samaAuthDateType, a.samaAuthDateH, a.samaAuthDateG)} />
            </Field>
            <div className="hidden lg:block" />
            <Field label="Approver No.">
              <RoText value={a.approvalRefNo} />
            </Field>
            <Field label="Date Type">
              <Segmented options={HIJRI_GREG} selected={calendarIndex(a.appDateType)} />
            </Field>
            <Field label="Issue Date">
              <DateTriple value={pickRaw(a.appDateType, a.appIssueDateH, a.appIssueDateG)} />
            </Field>
            <Field label="Expiry Date">
              <DateTriple value={pickRaw(a.appDateType, a.appExpiryDateH, a.appExpiryDateG)} />
            </Field>
            <Field label="Approver Name" className="lg:col-span-2">
              <RoText value={a.appRefName} />
            </Field>
          </div>
        </SectionCard>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <PrevPageButton onClick={onPrevPage} />
          <NextPageButton onClick={onNextPage} />
          <button type="button" onClick={onCancel} className={btnKinds.danger}>
            Cancel
          </button>
        </div>
      </div>
    </main>
  )
}
