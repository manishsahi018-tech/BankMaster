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
  StatusChips,
  DocTable,
  AuditCards,
  isFirst,
  btnKinds,
  NextPageButton,
  type IdRowData,
} from '../components/legacyForm.tsx'

// Mirrors legacy frmIndividualSaudi.frm — page 1 of the Individual Saudi
// National customer profile, field for field. The legacy disables every frame
// in search/supervisor/history mode, so this renders read-only throughout.
//
// Data is the real stcusttab profile (api.customerProfile) — or the stcustlog
// snapshot in history mode (api.customerProfileAsOf) — passed in as `profile`.

export default function IndividualSaudi({
  profile,
  historyAsOf,
  onNextPage,
  onAccounts,
  onCards,
  onHeirs,
  onReferences,
  onJointHolders,
  onBack,
}: {
  profile: GridRow
  historyAsOf?: string
  onNextPage?: () => void
  onAccounts?: () => void
  onCards?: () => void
  onHeirs?: () => void
  onReferences?: () => void
  onJointHolders?: () => void
  onBack: () => void
}) {
  // stidtab is the richer source; fall back to the bare stcusttab numbers when
  // a row is absent (the legacy C treats stcusttab the same way).
  const docs: IdRowData[] = profile.idDocuments ?? []
  const byType = (t: string) => docs.find((d) => (d as GridRow).idType === t)
  const idRow: IdRowData = byType('I') ?? {
    idNo: profile.idNo,
    idIssuedAt: profile.idIssuedAt,
    idDateType: profile.idDateType,
    idIssueDateH: profile.idIssueDateH,
    idIssueDateG: profile.idIssueDateG,
    idExpiryDateH: profile.idExpiryDateH,
    idExpiryDateG: profile.idExpiryDateG,
  }
  // 'S' and 'E' (succession deed) both land on the Sama Auth row — cbsaudi.c:2864
  const docRows = [
    { label: 'ID Number', row: idRow },
    { label: 'Passport No', row: byType('P') ?? { idNo: profile.passportNo } },
    { label: 'Hafiza No', row: byType('H') ?? { idNo: profile.hafizaNo } },
    {
      label: 'Sama Auth No',
      row: byType('S') ?? byType('E') ?? { idNo: profile.samaAuthNo || profile.succDeedNo },
    },
    { label: 'Family Regn No', row: byType('F') ?? { idNo: profile.familyRegnNo } },
  ]

  const flags = String(profile.referenceReqdFor ?? '')
  const flag = (pos: number) => flags.charAt(pos - 1) === '1'

  const dobHijri = isFirst(profile.dobDateType)
  const poBoxMode = String(profile.addressType ?? '').trim() !== '1'
  const marital = String(profile.marritalStatus ?? '').trim().toUpperCase()
  const maritalIdx = marital === 'M' || marital === '0' ? 0 : marital === 'S' || marital === '1' ? 1 : 2
  const sex = String(profile.sexCode ?? '').trim().toUpperCase()
  const addr1 = String(profile.address1 ?? '')

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            Individual — Saudi National
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">Customer Profile</h1>
          <p className="mt-1 text-sm text-muted">
            Page 1 of 2 — identity, personal and contact information.
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          Customer {profile.custNo}
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

          <div className="mt-5 border-t border-edge-soft pt-4">
            <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
              Special Status
            </p>
            <StatusChips
              flags={[
                { label: 'Blind / Illiterate', on: flag(1) },
                { label: 'Veiled Woman', on: flag(2) },
                { label: 'Incompetent Person', on: flag(3) },
                { label: 'Minor', on: flag(4) },
                { label: 'Minor with Special Circumstances', on: flag(5) },
                { label: 'Mentally Disabled', on: flag(6) },
              ]}
            />
          </div>
        </SectionCard>

        <SectionCard
          title="Identity Documents"
          description="Issue and expiry dates follow the selected calendar (H = Hijri, G = Gregorian)."
        >
          <DocTable rows={docRows} />
        </SectionCard>

        <SectionCard title="Personal Details">
          <div className="grid gap-4 sm:grid-cols-3">
            <Field label="Cert. of Birth No">
              <RoText value={profile.certificateOfBirthNo} />
            </Field>
            <Field label="Language">
              <Segmented options={['Arabic', 'English']} selected={isFirst(profile.preferredLang) ? 0 : 1} />
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
                  {h}
                </span>
              ))}

              <span className="self-center text-sm font-medium text-ink-soft">Arabic</span>
              <RoText value={profile.aFirstName} dir="rtl" className="text-right" />
              <RoText value={profile.a2ndName} dir="rtl" className="text-right" />
              <RoText value={profile.a3rdName} dir="rtl" className="text-right" />
              <RoText value={profile.aLastName} dir="rtl" className="text-right" />
              <RoText value={profile.aShortName} dir="rtl" className="text-right" />

              <span className="self-center text-sm font-medium text-ink-soft">English</span>
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
              <Segmented options={['PO Box', 'GPS']} selected={poBoxMode ? 0 : 1} />
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
                <Field label="GPS Number">
                  <RoText value={addr1.slice(0, 5)} />
                </Field>
                <Field label="Street Name">
                  <RoText value={addr1.slice(6)} />
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
            <Field label="Zip Code">
              <RoText value={profile.zipCode} className="tabular-nums" />
            </Field>
            <Field label="Country">
              <RoCombo value={codeLabel('country', profile.country)} />
            </Field>
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
          <button type="button" onClick={() => onAccounts?.()} className={btnKinds.secondary}>
            Account
          </button>
          <button type="button" onClick={() => onCards?.()} className={btnKinds.secondary}>
            Card Info
          </button>
          <button type="button" onClick={() => onHeirs?.()} className={btnKinds.secondary}>
            Heirs / Proxy
          </button>
          <button type="button" onClick={() => onReferences?.()} className={btnKinds.secondary}>
            References
          </button>
          <button type="button" onClick={() => onJointHolders?.()} className={btnKinds.secondary}>
            Joint Holders
          </button>
          {/* stcustlog.supervisorComments is not in the point read — see notes */}
          <button
            type="button"
            disabled
            title="Available during supervisor approval only"
            className={btnKinds.disabled}
          >
            Supervisor Comments
          </button>
          <NextPageButton onClick={() => onNextPage?.()} />
          <button type="button" onClick={onBack} className={btnKinds.danger}>
            Cancel
          </button>
        </div>
      </div>
    </main>
  )
}
