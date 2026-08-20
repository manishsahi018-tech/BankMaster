import { SectionCard } from '../components/fields.tsx'
import { codeLabel } from '../codes.ts'
import { RoText, RoCombo, Field, Segmented, CheckBoxGroup } from '../components/legacyForm.tsx'

// Shared controls for the customer profile's later pages —
// frmIndividualSaudiAcctInfo, frmIndividualOthers2 and
// frmIndividualOthersAcctInfo.
//
// All three are VB6 DATA-ENTRY forms, so they are rebuilt from the legacyForm
// primitives the profile's page 1 uses — combos with a chevron, segmented
// option pairs, check-box chips — rather than from DetailScreen, which is the
// vocabulary for drill-down detail views. A profile page that turns from a form
// into a detail card reads as a different application.
//
// The overlap between the three forms is not a coincidence: the Saudi form is
// the Others' TWO pages merged into one (its 76 controls are the Others page-2
// employment block plus the Others page-3 accounts and card frames), which is
// why the Others profile needs an extra page and the Saudi one does not.

/** Legacy option pairs: '1' selects Yes, anything else (blank included) No. */
export const yesNoIndex = (v?: string) => (v === '1' ? 0 : 1)

/** The date-type radio pair — '0' is Hijri, anything else Gregorian. */
export const HIJRI_GREG = ['Hijri', 'Gregorian'] as const
export const calendarIndex = (dateType?: string) => (dateType === '0' ? 0 : 1)

/**
 * The raw YYYYMMDD for the calendar the record was entered in.
 *
 * Each date slot on the forms is ONE triple beside that radio pair, while the
 * views carry both calendars — so the type picks. When the chosen calendar is
 * blank the other is used rather than showing DD/MM/YYYY placeholders, since a
 * date recorded in either calendar is still the date.
 */
export const pickRaw = (dateType?: string, hijri?: string, gregorian?: string): string => {
  const h = (hijri ?? '').trim()
  const g = (gregorian ?? '').trim()
  return (dateType === '0' ? h : g) || h || g
}

/** Yes/No exactly as the forms' option pairs render it. */
export const YesNo = ({ value }: { value?: string }) => (
  <Segmented options={['Yes', 'No']} selected={yesNoIndex(value)} />
)

/** The six ownership boxes, read one CHARACTER each (globalFunctions.bas:6455-6485). */
const OWNERSHIP = [
  'Rented Home',
  'Own House',
  'Com. Accomodation',
  'Rented Car',
  'Own Car',
  'Company Transport',
] as const

export function OwnershipFlags({ packed }: { packed?: string }) {
  const flags = packed ?? ''
  return (
    <div>
      <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
        Owner Ship
      </p>
      <CheckBoxGroup flags={OWNERSHIP.map((label, i) => ({ label, on: flags.charAt(i) === '1' }))} />
    </div>
  )
}

/**
 * The Current / Saving / Other A/c frame both AcctInfo forms end with.
 *
 * The legacy lays each facility out as ONE ROW — a Yes/No pair saying whether
 * the account exists, then its currency, status, statement frequency and cheque
 * book — so that is the shape here, rather than a card per facility. The flag
 * slots carry "1" when the account log had a row; "Other" has no flag of its
 * own and the legacy keys it on the ledger code it carries (cbothers.c:7256).
 */
export function AccountFacilities({ a }: { a: Record<string, string> }) {
  const row = (
    label: string,
    present: boolean,
    cells: { label: string; node: React.ReactNode }[],
  ) => (
    <div className="grid gap-4 border-t border-edge-soft pt-4 first:border-t-0 first:pt-0 sm:grid-cols-2 lg:grid-cols-5">
      <Field label={label}>
        <Segmented options={['Yes', 'No']} selected={present ? 0 : 1} />
      </Field>
      {present ? (
        cells.map((c) => (
          <Field key={c.label} label={c.label}>
            {c.node}
          </Field>
        ))
      ) : (
        <div className="self-end pb-2 text-sm text-muted-soft lg:col-span-4">Not requested.</div>
      )}
    </div>
  )
  return (
    <div className="grid gap-4">
      {row('Current A/c', a.currentAcFlag === '1', [
        { label: 'Curr.', node: <RoCombo value={codeLabel('currency', a.currentAcCurrency)} /> },
        { label: 'Acc. Status', node: <RoCombo value={codeLabel('accStatus', a.currentAcStatus)} /> },
        { label: 'Stmt. Freq.', node: <RoCombo value={codeLabel('stmtFreq', a.currentAcStmtFreq)} /> },
        { label: 'Check Book', node: <YesNo value={a.currentAcChequeBook} /> },
      ])}
      {row('Saving A/c', a.savingAcFlag === '1', [
        { label: 'Curr.', node: <RoCombo value={codeLabel('currency', a.savingAcCurrency)} /> },
        { label: 'Acc. Status', node: <RoCombo value={codeLabel('accStatus', a.savingAcStatus)} /> },
        { label: 'Stmt. Freq.', node: <RoCombo value={codeLabel('stmtFreq', a.savingAcStmtFreq)} /> },
        // The Saving row has no cheque book on either form.
        { label: '', node: <span /> },
      ])}
      {/* Other A/c leads with a COMBO where the other two rows have a Yes/No
          pair — the legacy has no flag for it and keys presence on the ledger
          code itself (cbothers.c:7256, and Picture4.png shows the combo). */}
      <div className="grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-5">
        <Field label="Other A/c">
          <RoCombo value={codeLabel('ledger', a.otherAcLedger)} />
        </Field>
        <Field label="Curr.">
          <RoCombo value={codeLabel('currency', a.otherAcCurrency)} />
        </Field>
        <Field label="Acc. Status">
          <RoCombo value={codeLabel('accStatus', a.otherAcStatus)} />
        </Field>
        <Field label="Stmt. Freq.">
          <RoCombo value={codeLabel('stmtFreq', a.otherAcStmtFreq)} />
        </Field>
        <Field label="Check Book">
          <YesNo value={a.otherAcChequeBook} />
        </Field>
      </div>
    </div>
  )
}

/** Single/Joint holding + signature nature — the frame under the accounts block. */
export function AccountHolding({
  a,
  withGracePeriod = false,
}: {
  a: Record<string, string>
  /** the Saudi form parks the grace period at the end of THIS row; the Others
   *  profile keeps it in its page-2 lower frame, beside the references */
  withGracePeriod?: boolean
}) {
  const holding = a.singleJointAcc === 'S' ? 0 : a.singleJointAcc === 'J' ? 1 : 2
  return (
    <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      <Field label="Single / Joint A/c">
        <Segmented options={['Single', 'Joint', 'Unidentified']} selected={holding} />
      </Field>
      <Field label="Nature of Signature">
        <Segmented options={['Single', 'Joint']} selected={a.signatureNature === 'J' ? 1 : 0} />
      </Field>
      {withGracePeriod && (
        <Field label="Freezing Grace Period">
          <div className="flex items-center gap-2">
            <RoText value={a.freezingGracePeriod} className="w-20 text-center tabular-nums" />
            <span className="text-sm text-muted">Day(s)</span>
          </div>
        </Field>
      )}
    </div>
  )
}

/** frmIndividual*AcctInfo's design-time option defaults, as Picture4.png shows
 *  them: Elec.Intl, Primary/Secondary card No, delivery to GPS. */
const CARD_TYPE_DEFAULT = 0
const CARD_REQUIRED_DEFAULT = 1
const DELIVERY_DEFAULT = 3

/**
 * The Card & Delivery frame, on the form's defaults.
 *
 * Both AcctInfo forms carry Card Type, Primary / Secondary Int'l card with the
 * name on each, Card Delivered to and a GPS delivery address. They are real
 * enquiry data there — but they are read from custLogRec, the stcustlog
 * create/update record, and only on the supervisor-pending replies
 * (cbothers.c:2948/2975/3711, cbsaudi.c:2762/2791/3256). The live customer
 * master has no such columns: stcusttab holds no cardType, electronIntl* or
 * delivery* at all.
 *
 * So for an approved customer — every customer this enquiry-only app can reach —
 * there is nothing to select from. The option groups therefore show the VB6
 * form's DESIGN-TIME defaults (Elec.Intl, No, No, GPS), which is what the legacy
 * puts on screen in the same situation: those marks come from the form, not from
 * the customer's record.
 *
 * That is a deliberate choice, made 2026-08-20, of fidelity over inference, and
 * the reason the section note is not optional: without it "Primary Int'l Card:
 * No" reads as a fact about the customer, when the archive does not know either
 * way and an issued card would be on Card Info regardless.
 */
export function CardAndDelivery() {
  return (
    <SectionCard
      title="Card & Delivery"
      description="Captured when the customer is created and held on the pending record, not on the customer master — so the marks below are the form's defaults, not this customer's card. Cards actually issued are on Card Info."
    >
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Field label="Card Type">
          <Segmented options={['Elec.Intl', 'El.Chip']} selected={CARD_TYPE_DEFAULT} />
        </Field>
      </div>

      <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-4">
        <Field label="Primary Int'l Card">
          <Segmented options={['Yes', 'No']} selected={CARD_REQUIRED_DEFAULT} />
        </Field>
        <Field label="Name on the Card" className="lg:col-span-3">
          <RoText value="" />
        </Field>
        <Field label="Secondary Int'l Card">
          <Segmented options={['Yes', 'No']} selected={CARD_REQUIRED_DEFAULT} />
        </Field>
        <Field label="Name on the Card" className="lg:col-span-3">
          <RoText value="" />
        </Field>
      </div>

      <div className="mt-5 border-t border-edge-soft pt-4">
        <Field label="Card Delivered to">
          <Segmented
            options={['Customer Branch', 'Request Branch', 'Mail', 'GPS']}
            selected={DELIVERY_DEFAULT}
          />
        </Field>
        <div className="mt-4 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <Field label="GPS #-Street/Area Name" className="lg:col-span-2">
            <RoText value="" />
          </Field>
          <Field label="Address2" className="lg:col-span-2">
            <RoText value="" />
          </Field>
          <Field label="Unit">
            <RoText value="" />
          </Field>
          <Field label="City">
            <RoCombo value="" />
          </Field>
          <Field label="Zip Code" className="lg:col-span-2">
            <RoText value="" />
          </Field>
        </div>
      </div>
    </SectionCard>
  )
}

/** The employment block both page-2 forms open with, identical on each. */
export function EmploymentAndIncome({ a }: { a: Record<string, string> }) {
  return (
    <SectionCard title="Customer Details">
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Field label="Education">
          <RoCombo value={a.education} />
        </Field>
        <Field label="Profession">
          <RoCombo value={a.profession} />
        </Field>
        <Field label="Position">
          <RoCombo value={a.position} />
        </Field>
        <Field label="Monthly Income">
          <RoCombo value={a.monthlyIncome} />
        </Field>
        <Field label="Segmentation">
          <RoCombo value={a.segmentation} />
        </Field>
        <Field label="Marketing Memo" className="lg:col-span-2">
          <RoText value={a.marketingMemo} />
        </Field>
        <Field label="Cust. Advice Flag">
          <YesNo value={a.custAdviceFlag} />
        </Field>
      </div>

      <div className="mt-5 border-t border-edge-soft pt-4">
        <OwnershipFlags packed={a.ownerShip} />
      </div>

      <div className="mt-5 grid gap-4 border-t border-edge-soft pt-4 sm:grid-cols-2 lg:grid-cols-5">
        <Field label="Employer Name" className="lg:col-span-2">
          <RoText value={a.employerName} />
        </Field>
        <Field label="Dept.">
          <RoText value={a.department} />
        </Field>
        <Field label="P.O.">
          <RoText value={a.employerPoBox} className="tabular-nums" />
        </Field>
        <Field label="City">
          <RoText value={a.employerCity} />
        </Field>
        <Field label="Zip">
          <RoText value={a.employerZipCode} className="tabular-nums" />
        </Field>
      </div>
    </SectionCard>
  )
}

/** SAMA flag, memos, package and the two fee exclusions — the form's order. */
export function PackageFeesAndMemos({ a }: { a: Record<string, string> }) {
  return (
    <SectionCard title="Package, Fees & Memos">
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Field label="Cust. Updated for SAMA">
          <YesNo value={a.updatedForSama} />
        </Field>
        <Field label="Relationship Manager">
          <RoText value={a.relationshipManager} />
        </Field>
        <Field label="General Memo" className="lg:col-span-2">
          <RoText value={a.generalMemo} />
        </Field>
        <Field label="Package A/c">
          <RoCombo value={a.packageAcc} />
        </Field>
        <Field label="Segment Statement Override">
          <YesNo value={a.pkgStmtFreqOverride} />
        </Field>
        {/* One "Exclude from" label over both pairs on the form. */}
        <Field label="Exclude from — ATM Fees">
          <YesNo value={a.excludeFromAtmFees} />
        </Field>
        <Field label="Exclude from — Minimum Balance Fees">
          <YesNo value={a.excludeFromMinBalFees} />
        </Field>
      </div>
    </SectionCard>
  )
}
