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
} from '../components/legacyForm.tsx'

import { t } from '../i18n/index.ts'
// The detail panel behind the Reference / Legal Representative and Heirs /
// Proxy grids — frmIndividualSaudi2 (35 text boxes, 9 combos, 6 check boxes)
// and frmIndividualHeirs (37 text boxes, 10 combos, 8 option buttons).
//
// Both are opened in the legacy by DOUBLE-CLICKING a grid row
// (referenceInfoGrid_DblClick :2722, heirInfoGrid_DblClick :2807), which fills
// the panel in place. Ported as the grid's Enquiry button for the same reason
// as the owner one: a double-click has no affordance and does not survive touch.
//
// One component because the two panels are the same form — same names, same
// identity block, same single address — differing only in their extras: the
// reference's required-for flags against the heir's proxy. `kind` decides.

/** The six flags the reference panel shows as check boxes, in the form's order. */
const REQUIRED_FOR = [
  'Blind Person',
  'Veiled Woman',
  'Incompetent Person',
  'Minor',
  'Minor with special Circumstances',
  'Mentally Disabled',
] as const

export default function PartyDetail({
  customer,
  detail,
  onReturn,
}: {
  customer: Customer | null
  detail: GridRow
  onReturn: () => void
}) {
  const d = detail as Record<string, string>
  const a = (detail.address ?? {}) as Record<string, string>
  const isHeir = d.kind === 'heir'
  const hijri = d.idDateType === '0'
  const proxyHijri = d.proxyDateType === '0'
  const flags = d.referenceReqdFor ?? ''

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
            {isHeir ? t('Heirs / Proxy') : t('Reference / Legal Representative')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            {isHeir ? t('Heir Details') : t('Reference Details')}
          </h1>
          <p className="mt-1 text-sm text-muted">
            {isHeir
              ? t('Read-only enquiry — identity, proxy and address.')
              : t('Read-only enquiry — identity, required-for and address.')}
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          {/* The two numbers are Latin runs; the placeholders keep them out of
              the translated text so bidi cannot reorder them. */}
          {isHeir
            ? t('Customer {custNo} · Heir {partyNo}', { custNo: customer?.custNo ?? '', partyNo: d.partyNo })
            : t('Customer {custNo} · Reference {partyNo}', { custNo: customer?.custNo ?? '', partyNo: d.partyNo })}
        </span>
      </div>

      <div className="grid gap-5">
        <SectionCard title={isHeir ? 'Heir' : 'Reference'}>
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label={isHeir ? 'Heir Number' : 'Reference Number'}>
              <RoText value={d.partyNo} muted className="tabular-nums" />
            </Field>
            <Field label="Type">
              <RoCombo value={d.partyType} />
            </Field>
            <Field label="Active">
              <Segmented options={['Yes', 'No']} selected={d.activeStatus === '1' ? 0 : 1} />
            </Field>
            <Field label="Branch">
              <RoCombo value={codeLabel('branch', d.branchCode)} />
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
              <RoText value={d.aFirstName} dir="rtl" className="text-start" />
              <RoText value={d.aSecondName} dir="rtl" className="text-start" />
              <RoText value={d.aThirdName} dir="rtl" className="text-start" />
              <RoText value={d.aLastName} dir="rtl" className="text-start" />
              <RoText value={d.aShortName} dir="rtl" className="text-start" />
              <span className="self-center text-sm font-medium text-ink-soft">{t('English')}</span>
              <RoText value={d.eFirstName} />
              <RoText value={d.eSecondName} />
              <RoText value={d.eThirdName} />
              <RoText value={d.eLastName} />
              <RoText value={d.eShortName} />
            </div>
          </div>

          {/* The reference panel's own frame; the heir form has no equivalent. */}
          {!isHeir && (
            <div className="mt-5 border-t border-edge-soft pt-4">
              <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
                {t('Reference Required For')}
              </p>
              <CheckBoxGroup
                flags={REQUIRED_FOR.map((label, i) => ({ label, on: flags.charAt(i) === '1' }))}
              />
            </div>
          )}
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
              <Segmented options={['Hijri', 'Gregorian']} selected={hijri ? 0 : 1} />
            </Field>
            <Field label="Issue Date">
              <DateTriple value={hijri ? d.idIssueDateH : d.idIssueDateG} />
            </Field>
            <Field label="Expiry Date">
              <DateTriple value={hijri ? d.idExpiryDateH : d.idExpiryDateG} />
            </Field>
          </div>

          {/* stheirtab's own columns, not an ID row — a proxy is a document the
              heir holds, with only an issue date. */}
          {isHeir && (
            <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-4">
              <Field label="Proxy Number">
                <RoText value={d.proxyNo} />
              </Field>
              <Field label="Date Type">
                <Segmented options={['Hijri', 'Gregorian']} selected={proxyHijri ? 0 : 1} />
              </Field>
              <Field label="Proxy Issue Date">
                <DateTriple value={proxyHijri ? d.proxyIssueDateH : d.proxyIssueDateG} />
              </Field>
            </div>
          )}
        </SectionCard>

        <SectionCard title="Address">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Address 1" className="lg:col-span-2">
              <RoText value={a.address1} />
            </Field>
            <Field label="Address 2" className="lg:col-span-2">
              <RoText value={a.address2} />
            </Field>
            <Field label="P.O. Box">
              {/* Saudi Post rows carry the unit number where the box sits. */}
              <RoText value={a.addrType === '1' ? a.unitNo : a.poBox} className="tabular-nums" />
            </Field>
            <Field label="City">
              <RoCombo value={a.cityName} />
            </Field>
            <Field label="Zip Code">
              <RoText value={a.zipCode} className="tabular-nums" />
            </Field>
            <Field label="Country">
              <RoCombo value={codeLabel('country', a.country)} />
            </Field>
            <Field label="Phone (Off)">{phone(a.telOffAreaCode, a.telOffNo, a.telOffExt)}</Field>
            <Field label="Phone (Res.)">
              {phone(a.telHomeAreaCode, a.telHomeNo, a.telHomeExt)}
            </Field>
            <Field label="Fax">{phone(a.faxAreaCode, a.faxNo, a.faxExt)}</Field>
            <Field label="Mobile">
              <RoText value={a.mobileNo} className="tabular-nums" />
            </Field>
            <Field label="Pager">
              <RoText value={a.pagerNo} className="tabular-nums" />
            </Field>
            <Field label="E-Mail" className="lg:col-span-2">
              <RoText value={a.eMail} dir="ltr" />
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
