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
  isFirst,
  btnKinds,
  NextPageButton,
  type IdRowData,
} from '../components/legacyForm.tsx'

// Mirrors legacy frmJuristicMain.frm — page 1 of the juristic customer profile,
// field for field, and — through `variant` — its two siblings
// frmJuristicDiplomats and frmJuristicNonResident.
//
// The three forms share 145 of their controls; each variant adds ONE
// registration block and its own heading, which is why they are one component
// with a variant rather than three files:
//   diplomats    Diplomatic Card / Passport / Visa numbers with their dates
//                (frmJuristicDiplomats: txtDiplomaticCardNo, txtPPNo, txtVisaNo)
//   nonResident  Contract No with its dates (frmJuristicNonResident: txtContractNo)
// Which one opens is decided by sub category, not by anything on the customer
// record itself — see screenSet.ts.
//
// Differs from the individual forms: four registration rows (C.R. / Licence /
// SAMA Auth / Approver) of which only C.R. carries an issued-at; a company-name
// grid of First / 2nd / Short (no 3rd or Last) plus an Alpha Search;
// shareholding percentages; and a Date of Establishment in place of Date of
// Birth. No title, gender, marital status, dependents or personal ID blocks.

// Enquiry-only build: supervisor-approval actions are hidden rather than
// shown disabled. A permanently greyed button advertises a capability this
// build does not have, and invites "why can't I click that?" — the legacy only
// ever enables it inside the approval workflow (supervisorAction), which is a
// write path and out of scope. Flip to false to restore it.
const ENQUIRY_ONLY = true

/** The three juristic forms, keyed as screenSet.ts names them. */
export type JuristicVariant = 'main' | 'diplomats' | 'nonResident'

const HEADINGS: Record<JuristicVariant, { kicker: string; title: string }> = {
  main: { kicker: 'Juristic Customer', title: 'Customer Profile' },
  diplomats: { kicker: 'Juristic — Diplomatic', title: 'Resident Juristic Customer' },
  nonResident: { kicker: 'Juristic — Non-Resident', title: 'Non-Resident Juristic Customer' },
}

export default function JuristicMain({
  profile,
  variant = 'main',
  historyAsOf,
  onAccounts,
  onOwners,
  onReferences,
  onNextPage,
  onBack,
}: {
  profile: GridRow
  variant?: JuristicVariant
  historyAsOf?: string
  onAccounts: () => void
  onOwners: () => void
  onReferences: () => void
  onNextPage: () => void
  onBack: () => void
}) {
  // cbjuristic.c:3098-3170 buckets stidtab idCategory='C' by idType:
  // C = commercial registration, L = licence, S = Sama auth, A = approval ref.
  const docs: IdRowData[] = profile.idDocuments ?? []
  const byType = (t: string) => docs.find((d) => (d as GridRow).idType === t)
  const crRow: IdRowData = byType('C') ?? {
    idNo: profile.crNo,
    idIssuedAt: profile.crIssuedAt,
    idDateType: profile.crIssueDateType,
    idIssueDateH: profile.crIssueDateH,
    idIssueDateG: profile.crIssueDateG,
  }
  const appRow: IdRowData = byType('A') ?? { idNo: profile.approvalRefNo }
  // Only the C.R. row has an issued-at, so it renders as its own table.
  // cbjuristic.c:3097-3168 keys every registration document by idType:
  // C commercial registration, L licence, S SAMA authority, P passport,
  // D diplomatic card, V visa, T contract, A approval reference.
  const variantRows =
    variant === 'diplomats'
      ? [
          { label: 'Diplomatic Card No', row: byType('D') ?? { idNo: profile.diplomaticCardNo } },
          { label: 'PP Number', row: byType('P') ?? { idNo: profile.passportNo } },
          { label: 'Visa Number', row: byType('V') ?? { idNo: profile.visaNo } },
        ]
      : variant === 'nonResident'
        ? [{ label: 'Contract No', row: byType('T') ?? { idNo: profile.contractNo } }]
        : []
  const otherRows = [
    { label: 'License No', row: byType('L') ?? { idNo: profile.licenseNo } },
    { label: 'SAMA Auth No', row: byType('S') ?? { idNo: profile.samaAuthNo } },
    { label: 'Approver No.', row: appRow },
    ...variantRows,
  ]

  // Date of Establishment reuses the DOB columns — cbjuristic.c:3212-3214
  const doeHijri = isFirst(profile.dobDateType)
  const poBoxMode = String(profile.addressType ?? '').trim() !== '1'
  const addr1 = String(profile.address1 ?? '')
  const zip = String(profile.zipCode ?? '')

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {HEADINGS[variant].kicker}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            {HEADINGS[variant].title}
          </h1>
          <p className="mt-1 text-sm text-muted">
            Page 1 of 2 — registration, company and contact information.
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
        </SectionCard>

        <SectionCard
          title="Registration Documents"
          description="Issue and expiry dates follow the selected calendar (H = Hijri, G = Gregorian). Only the C.R. carries an issuing place."
        >
          <DocTable rows={[{ label: 'C.R Number', row: crRow }]} />
          <div className="mt-2">
            <DocTable rows={otherRows} showIssuedAt={false} />
          </div>

          <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-3">
            <Field label="Approver Name">
              <RoText value={appRow.idRefName} />
            </Field>
            <Field label="Nationality">
              <RoCombo value={codeLabel('country', profile.nationality)} />
            </Field>
            <Field label="Language">
              <Segmented options={['Arabic', 'English']} selected={isFirst(profile.preferredLang) ? 0 : 1} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Company Name">
          <div className="overflow-x-auto">
            <div className="grid min-w-[640px] grid-cols-[6rem_repeat(3,1fr)] gap-x-3 gap-y-2">
              <span />
              {['First Name', '2nd Name', 'Short Name'].map((h) => (
                <span key={h} className="text-xs font-semibold uppercase tracking-wide text-muted-soft">
                  {h}
                </span>
              ))}

              <span className="self-center text-sm font-medium text-ink-soft">Arabic</span>
              <RoText value={profile.aOrgName1} dir="rtl" className="text-right" />
              <RoText value={profile.aOrgName2} dir="rtl" className="text-right" />
              <RoText value={profile.aOrgShortName} dir="rtl" className="text-right" />

              <span className="self-center text-sm font-medium text-ink-soft">English</span>
              <RoText value={profile.eOrgName1} />
              <RoText value={profile.eOrgName2} />
              <RoText value={profile.eOrgShortName} />
            </div>
          </div>

          <div className="mt-4 border-t border-edge-soft pt-4 sm:max-w-xs">
            <Field label="Alpha Search">
              <RoText value={profile.orgAlphaSearchCode} />
            </Field>
          </div>
        </SectionCard>

        <SectionCard title="Commercial">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Purpose of Account" className="sm:col-span-2">
              <RoText value={profile.purposeOfAccount} />
            </Field>
            <Field label="Govt. Shareholding %">
              <RoText value={profile.govtShareHoldingPerc} className="tabular-nums" />
            </Field>
            <Field label="Saudi Shareholding %">
              <RoText value={profile.saudiShareHoldingPerc} className="tabular-nums" />
            </Field>
            <Field label="Foreign Shareholding %">
              <RoText value={profile.foreignShareHoldingPerc} className="tabular-nums" />
            </Field>
            <Field label="Date of Establishment" className="sm:col-span-2">
              <div className="flex flex-wrap items-center gap-2">
                <Segmented options={['Hijri', 'Gregorian']} selected={doeHijri ? 0 : 1} />
                {/* the DOE row has no expiry */}
                <DateTriple value={doeHijri ? profile.dobDateH : profile.dobDateG} />
              </div>
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
                <Field label="Office Address 1">
                  <RoText value={profile.address1} />
                </Field>
                <Field label="Office Address 2">
                  <RoText value={profile.address2} />
                </Field>
              </>
            ) : (
              <>
                <Field label="GPS Number">
                  <RoText value={addr1.slice(0, 5)} />
                </Field>
                <Field label="Street / Area Name">
                  <RoText value={addr1.slice(6)} />
                </Field>
              </>
            )}
          </div>

          <div className="mt-4 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label={poBoxMode ? 'P.O. Box' : 'Unit'}>
              <RoText value={profile.poBox} />
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
            Account
          </button>
          <button type="button" onClick={onOwners} className={btnKinds.secondary}>
            Owner / Management
          </button>
          <button type="button" onClick={onReferences} className={btnKinds.secondary}>
            References
          </button>
          {!ENQUIRY_ONLY && (
            <button
              type="button"
              disabled
              title="Available during supervisor approval only"
              className={btnKinds.disabled}
            >
              Supervisor Comments
            </button>
          )}
          <NextPageButton onClick={onNextPage} />
          <button type="button" onClick={onBack} className={btnKinds.danger}>
            Cancel
          </button>
        </div>
      </div>
    </main>
  )
}
