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
  DocTable,
  AuditCards,
  NextPageButton,
  isFirst,
  btnKinds,
  type IdRowData,
} from '../components/legacyForm.tsx'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmIndividualOthers.frm — page 1 of the customer profile for
// non-Saudi individuals, field for field.
//
// Differs from frmIndividualSaudi: three ID rows (Iqama / Passport / Visa)
// instead of five, a Book/Plastic Iqama Type, an explicit Nationality, and no
// Cert-of-Birth or special-status block. The legacy disables every frame in
// search/history mode, so this renders read-only throughout.

// Enquiry-only build: supervisor-approval actions are hidden rather than
// shown disabled. A permanently greyed button advertises a capability this
// build does not have, and invites "why can't I click that?" — the legacy only
// ever enables it inside the approval workflow (supervisorAction), which is a
// write path and out of scope. Flip to false to restore it.
const ENQUIRY_ONLY = true

export default function IndividualOthers({
  profile,
  historyAsOf,
  onAccounts,
  onCards,
  onNextPage,
  onHeirs,
  onReferences,
  onBack,
}: {
  profile: GridRow
  historyAsOf?: string
  onAccounts: () => void
  onCards?: () => void
  onNextPage?: () => void
  /** Never present on this family — see partyPanelsFor in screenSet.ts. */
  onHeirs?: () => void
  /** Present only for sub category 63 — see partyPanelsFor in screenSet.ts. */
  onReferences?: () => void
  onBack: () => void
}) {
  // cbothers.c:2992-3060 buckets stidtab idCategory='C' by idType:
  // Q = Iqama, P = Passport, V = Visa. stcusttab keeps bare numbers as fallback.
  const docs: IdRowData[] = profile.idDocuments ?? []
  const byType = (t: string) => docs.find((d) => (d as GridRow).idType === t)
  const iqamaRow: IdRowData = byType('Q') ?? {
    idNo: profile.idNo,
    idIssuedAt: profile.idIssuedAt,
    idDateType: profile.idDateType,
    idIssueDateH: profile.idIssueDateH,
    idIssueDateG: profile.idIssueDateG,
    idExpiryDateH: profile.idExpiryDateH,
    idExpiryDateG: profile.idExpiryDateG,
  }
  const docRows = [
    {
      label: 'Iqama Number',
      row: iqamaRow,
      // "1" = Plastic, else Book (cbserver.h:522) — only meaningful on this row
      extra: (
        <Segmented
          options={['Book', 'Plastic']}
          selected={String(iqamaRow.iqamaType ?? '').trim() === '1' ? 1 : 0}
        />
      ),
    },
    { label: 'PP Number', row: byType('P') ?? { idNo: profile.passportNo }, extra: null },
    { label: 'Visa Number', row: byType('V') ?? { idNo: profile.visaNo }, extra: null },
  ]

  const dobHijri = isFirst(profile.dobDateType)
  const poBoxMode = String(profile.addressType ?? '').trim() !== '1'
  const marital = String(profile.marritalStatus ?? '').trim().toUpperCase()
  const maritalIdx = marital === 'M' || marital === '0' ? 0 : marital === 'S' || marital === '1' ? 1 : 2
  const sex = String(profile.sexCode ?? '').trim().toUpperCase()

  // Saudi Post packs its parts into address1/zipCode; char 6 is a separator the
  // legacy discards (fillFrmIndividualOthers in globalFunctions.bas).
  const zip = String(profile.zipCode ?? '')

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {t('Individual — Other Nationality')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">{t('Customer Profile')}</h1>
          <p className="mt-1 text-sm text-muted">
            {t('Page 1 of 3 — identity, personal and contact information.')}
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
            <Field label="Category">
              <RoCombo value={codeLabel('samaMainCategory', profile.samaMainCategory)} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard
          title="Identity Documents"
          description="Issue and expiry dates follow the selected calendar (H = Hijri, G = Gregorian)."
        >
          <DocTable rows={docRows} extraHeader="Iqama Type" />
        </SectionCard>

        <SectionCard title="Personal Details">
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

          {/* name grid: 5 parts x Arabic / English */}
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

          <div className="mt-5 grid gap-4 sm:grid-cols-3">
            <Field label="Date of Birth">
              <div className="flex flex-wrap items-center gap-2">
                <Segmented options={['Hijri', 'Gregorian']} selected={dobHijri ? 0 : 1} />
                <DateTriple value={dobHijri ? profile.dobDateH : profile.dobDateG} />
              </div>
            </Field>
            <Field label="Gender">
              <Segmented options={['Male', 'Female']} selected={sex === 'F' ? 1 : 0} />
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
            <Field label="Business Type">
              <RoCombo value={codeLabel('businessType', profile.businessType)} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Address &amp; Contact">
          <div className="grid gap-4 sm:grid-cols-3">
            <Field label="Address Type">
              <Segmented options={['P.O. Box', 'Saudi Post']} selected={poBoxMode ? 0 : 1} />
            </Field>
            {poBoxMode ? (
              <>
                <Field label="Address Line 1">
                  <RoText value={profile.address1} />
                </Field>
                <Field label="Address Line 2">
                  <RoText value={profile.address2} />
                </Field>
              </>
            ) : (
              <>
                {/* stcusttab carries gprsNo (8) and unitNo (5) as their own
                    columns, both "Added for Saudi postal address". These used
                    to be sliced out of address1 — a packing the schema never
                    describes, which showed the first five characters of the
                    street as a GPS number and never showed gprsNo at all.
                    JointHolderDetail reads the columns directly; so does this
                    now. */}
                <Field label="GPS Number">
                  <RoText value={profile.gprsNo} className="tabular-nums" />
                </Field>
                <Field label="Street Name">
                  <RoText value={profile.address1} />
                </Field>
              </>
            )}
          </div>

          <div className="mt-4 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label={poBoxMode ? 'P.O. Box' : 'Unit'}>
              <RoText value={poBoxMode ? profile.poBox : profile.unitNo} />
            </Field>
            <Field label="City">
              <RoCombo value={profile.cityName} />
            </Field>
            {poBoxMode ? (
              <>
                <Field label="Zip Code">
                  <RoText value={profile.zipCode} className="tabular-nums" />
                </Field>
                <Field label="Country">
                  <RoCombo value={codeLabel('country', profile.country)} />
                </Field>
              </>
            ) : (
              <>
                <Field label="Zip Code">
                  <RoText value={zip.slice(0, 5)} className="tabular-nums" />
                </Field>
                <Field label="Additional No">
                  <RoText value={zip.slice(6)} className="tabular-nums" />
                </Field>
              </>
            )}
          </div>

          <div className="mt-4 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-3">
            <Field label="Phone (Office)">
              <div className="flex gap-2">
                <RoText value={profile.telOffAreaCode} className="w-16 text-center tabular-nums" />
                <RoText value={profile.telOffNo} className="tabular-nums" />
                <RoText value={profile.telOffExt} className="w-16 tabular-nums" />
              </div>
            </Field>
            <Field label="Phone (Residence)">
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
              {/* legacy splits the stored 10 chars into [area 1-2][number 3-10] */}
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
            <Field label="E-Mail">
              <RoText value={profile.eMail} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Open / Update Details" description="Audit trail — populated by the system.">
          <AuditCards audit={profile.openUpdate ?? {}} openDateFallback={profile.custOpenDate} />
        </SectionCard>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <button type="button" onClick={onAccounts} className={btnKinds.secondary}>
            {t('Account')}
          </button>
          <button type="button" onClick={() => onCards?.()} className={btnKinds.secondary}>
            {t('ATM Card')}
          </button>
          {/* Not buttons in the legacy: cmdNext sends sub category 63 to the
              SAUDI page 2 with its reference grid and everything else straight
              to frmIndividualOthers2 (frmIndividualOthers.frm:3828-3866). No
              sub category on this family reaches the heirs form, so onHeirs is
              never passed — it stays in the signature because the two profile
              screens are called from the same place. */}
          {onHeirs && (
            <button type="button" onClick={onHeirs} className={btnKinds.secondary}>
              {t('Heirs / Proxy')}
            </button>
          )}
          {onReferences && (
            <button type="button" onClick={onReferences} className={btnKinds.secondary}>
              {t('References')}
            </button>
          )}
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
          {/* cmdNext — frmIndividualOthers has one and so does the Saudi form;
              it was the only profile here without its page 2. */}
          <NextPageButton onClick={() => onNextPage?.()} />
          {/* No ms-auto here: NextPageButton already carries one, and TWO auto
              margins in a flex row split the free space between them — which
              left Next Page stranded mid-row instead of beside Cancel. */}
          <button type="button" onClick={onBack} className={btnKinds.danger}>
            {t('Cancel')}
          </button>
        </div>
      </div>
    </main>
  )
}
