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
  BackArrow,
} from '../components/legacyForm.tsx'

import { t } from '../i18n/index.ts'
// The detail panel of legacy frmJuristicOwner — the 54 text boxes, 10 combos
// and 10 option buttons the grid does NOT carry.
//
// The legacy has no button for this: double-clicking a row calls fetchOwnerInfo
// (frmJuristicOwner.frm:3650, service 77) and fills the panel in place. A
// double-click has no affordance and does not survive touch, so the port makes
// it the grid's Enquiry button — the word this app already uses everywhere for
// "open the selected row" — and gives the record its own screen.
//
// Sources, as readOwnerTabInfo assembles them (cbsama.c:2302-2450): stowntab on
// custNo + ownerNo; the owner's stidtab row, which is idCategory 'W' rather
// than the customer's own 'C'; and staddrtab rows whose addressNo is the
// ownerNo — type '03' local, '04' home, each with its own contacts.

/** Owner ('O') or management ('M') — the form's two-way option group. */
const ownerKind = (v?: string) => (v === 'M' ? 1 : 0)

/** Saudi Post addresses put the unit number where the P.O. Box sits (:2402). */
const poBoxOf = (a: Record<string, string>) => (a.addrType === '1' ? a.unitNo : a.poBox)

function AddressBlock({ title, a }: { title: string; a: Record<string, string> }) {
  const phone = (area?: string, no?: string, ext?: string) => (
    <div className="flex gap-2">
      <RoText value={area} className="w-16 text-center tabular-nums" />
      <RoText value={no} className="tabular-nums" />
      <RoText value={ext} className="w-16 tabular-nums" />
    </div>
  )
  return (
    <SectionCard title={title}>
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Field label="Address 1" className="lg:col-span-2">
          <RoText value={a.address1} />
        </Field>
        <Field label="Address 2" className="lg:col-span-2">
          <RoText value={a.address2} />
        </Field>
        <Field label="P.O. Box">
          <RoText value={poBoxOf(a)} className="tabular-nums" />
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
        <Field label="Phone (Res.)">{phone(a.telHomeAreaCode, a.telHomeNo, a.telHomeExt)}</Field>
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
  )
}

export default function OwnerDetail({
  customer,
  detail,
  onReturn,
}: {
  customer: Customer | null
  detail: GridRow
  onReturn: () => void
}) {
  const d = detail as Record<string, string>
  const local = (detail.local ?? {}) as Record<string, string>
  const home = (detail.home ?? {}) as Record<string, string>
  const hijri = d.idDateType === '0'

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {t('Juristic Customer')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            {t('Owner Details')}
          </h1>
          <p className="mt-1 text-sm text-muted">
            {t('Read-only enquiry — one row of Owner / Management Details in full.')}
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          {t('Customer {custNo} · Owner {ownerNo}', { custNo: customer?.custNo ?? '', ownerNo: d.ownerNo })}
        </span>
      </div>

      <div className="grid gap-5">
        <SectionCard title="Owner">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Owner Number">
              <RoText value={d.ownerNo} muted className="tabular-nums" />
            </Field>
            <Field label="Owner Type">
              <Segmented options={['Owner', 'Management']} selected={ownerKind(d.ownerType)} />
            </Field>
            <Field label="Share Holding %">
              <RoText value={d.shareHoldingPerc} className="tabular-nums" />
            </Field>
            <Field label="Active">
              <Segmented options={['Yes', 'No']} selected={d.ownerEnabled === '1' ? 0 : 1} />
            </Field>
            <Field label="Branch">
              <RoCombo value={codeLabel('branch', d.branchCode)} />
            </Field>
            <Field label="Parent Company" className="lg:col-span-3">
              <RoText value={d.parentCompanyName} />
            </Field>
          </div>

          {/* Both scripts, the same 5-part grid the profile forms use. */}
          <div className="mt-5 overflow-x-auto border-t border-edge-soft pt-4">
            <div className="grid min-w-[760px] grid-cols-[5rem_repeat(5,1fr)] gap-x-3 gap-y-2">
              <span />
              {['First Name', '2nd Name', '3rd Name', 'Last Name', 'Short Name'].map((h) => (
                <span key={h} className="text-xs font-semibold uppercase tracking-wide text-muted-soft">
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
        </SectionCard>

        <SectionCard
          title="Identity Document"
          description="Issue and expiry follow the selected calendar (H = Hijri, G = Gregorian)."
        >
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Id Type">
              <RoCombo value={codeLabel('idType', d.idType)} />
            </Field>
            <Field label="Id Number">
              <RoText value={d.idNo} />
            </Field>
            <Field label="Issued At">
              <RoText value={d.idIssuedAt} />
            </Field>
            <Field label="Date Type">
              <Segmented options={['Hijri', 'Gregorian']} selected={hijri ? 0 : 1} />
            </Field>
            <Field label="Issue Date">
              <DateTriple value={hijri ? d.idIssueDateH : d.idIssueDateG} />
            </Field>
            <Field label="Expiry Date">
              <DateTriple value={hijri ? d.idExpiryDateH : d.idExpiryDateG} />
            </Field>
          </div>
        </SectionCard>

        <AddressBlock title="Local Address" a={local} />
        <AddressBlock title="Home Country Address" a={home} />

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          {/* A detail screen returns; only the paged profile forms say
              Previous Page. */}
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
