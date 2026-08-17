import DetailScreen from '../components/DetailScreen.tsx'
import type { Customer } from '../types.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmIndividualOthersAcctInfo.frm — page 2 of the Individual
// Others profile — as a READ-ONLY enquiry.
//
// This form is NOT the Others equivalent of frmIndividualSaudiAcctInfo's
// content. Its control set is a strict SUBSET of the Saudi form's (45 of 76,
// nothing unique), and none of the 31 the Saudi form adds — education,
// profession, income, employer, segmentation, memos, relationship manager — are
// here. What remains is three frames: the accounts block, card type/delivery,
// and signature nature. So the two page-2 screens legitimately show different
// things; this one is not a trimmed copy of the other.
//
// Card type and delivery are omitted. Which card to issue and where to post it
// is a create-time instruction with no archival counterpart, and cards that
// actually exist have their own screens off stcardtab (Card Info on page 1).
// The accounts block is different in kind: getAcctInfo reads it BACK from the
// account log (cbothers.c:7183-7306), and frmJuristicAccountInfo already
// renders exactly these fields as enquiry data — so it is shown here too, from
// the same derivation.

const yesNo0 = (v?: string): string =>
  v === '1' ? 'Yes' : v === '0' || v === '' || v == null ? 'No' : v
const signature = (v?: string): string => (v === 'J' ? 'Joint' : v === 'S' ? 'Single' : (v ?? ''))

export default function IndividualOthersAcctInfo({
  customer,
  acctInfo,
  onPrevPage,
  onDocuments,
  onCancel,
}: {
  customer: Customer | null
  acctInfo: Record<string, string>
  onPrevPage: () => void
  onDocuments: () => void
  onCancel: () => void
}) {
  const a = acctInfo

  // The legacy renders a facility's row only when its check-box is set; the
  // flag slots carry "1" when the account log had a row. An absent facility
  // says "Not requested" rather than showing four blanks, matching how
  // JuristicAccountInfo handles the same slots.
  const facility = (
    title: string,
    present: boolean,
    fields: { label: string; value: string }[],
  ): { title: string; fields: { label: string; value: string; wide?: boolean }[] } => ({
    title,
    fields: present ? fields : [{ label: '', value: 'Not requested.', wide: true }],
  })

  return (
    <DetailScreen
      kicker="Individual — Others"
      title="Account Details"
      subtitle="Read-only enquiry — page 2: account facilities and signature."
      chips={[
        { label: 'Customer No', value: customer?.custNo },
        { label: 'Nature of Signature', value: signature(a.signatureNature) },
      ]}
      sections={[
        facility('Current Account', a.currentAcFlag === '1', [
          { label: 'Currency', value: codeLabel('currency', a.currentAcCurrency) },
          { label: 'Stmt. Frequency', value: codeLabel('stmtFreq', a.currentAcStmtFreq) },
          { label: 'Cheque Book', value: yesNo0(a.currentAcChequeBook) },
          { label: 'A/c Status', value: codeLabel('accStatus', a.currentAcStatus) },
        ]),
        facility('Saving Account', a.savingAcFlag === '1', [
          { label: 'Currency', value: codeLabel('currency', a.savingAcCurrency) },
          { label: 'Stmt. Frequency', value: codeLabel('stmtFreq', a.savingAcStmtFreq) },
          { label: 'A/c Status', value: codeLabel('accStatus', a.savingAcStatus) },
        ]),
        // "Other" has no flag slot of its own — the legacy keys it on the
        // ledger code it carries (cbothers.c:7256), so that is the presence test.
        facility('Other Account', !!a.otherAcLedger, [
          { label: 'Ledger', value: codeLabel('ledger', a.otherAcLedger) },
          { label: 'Currency', value: codeLabel('currency', a.otherAcCurrency) },
          { label: 'Stmt. Frequency', value: codeLabel('stmtFreq', a.otherAcStmtFreq) },
          { label: 'Cheque Book', value: yesNo0(a.otherAcChequeBook) },
          { label: 'A/c Status', value: codeLabel('accStatus', a.otherAcStatus) },
        ]),
      ]}
      buttons={[
        { label: 'Previous Page', kind: 'primary', onClick: onPrevPage },
        { label: 'Documents', onClick: onDocuments },
        { label: 'Cancel', kind: 'danger', onClick: onCancel },
      ]}
    />
  )
}
