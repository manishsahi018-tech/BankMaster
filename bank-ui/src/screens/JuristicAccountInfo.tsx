import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmJuristicAccountInfo.frm ("Account Details") — page 2 of
// the juristic profile. Enquiry subset: in history/search/supervisor modes
// the legacy form disables every input frame, so this read-only rendering
// matches the enquiry behavior. The create/approve/reject maintenance path
// is out of scope.

const yesNo = (v: unknown) => (v === '1' ? 'Yes' : v === '0' ? 'No' : '')

export default function JuristicAccountInfo({
  profile,
  info,
  onPrevPage,
  onSignatories,
  onOwners,
  onDocuments,
  onCancel,
}: {
  profile: GridRow
  info: GridRow
  onPrevPage: () => void
  onSignatories: () => void
  onOwners: () => void
  onDocuments: () => void
  onCancel: () => void
}) {
  // These arrive as raw codes from stacclog (acctFacilityRows), so they are
  // resolved here. They used to render bare — the mock hid it by returning
  // pre-formatted strings like "01 - Monthly", which the Denodo path never
  // does. codeLabel falls back to the code, so a value the mock still
  // pre-formats passes through unchanged.
  const facilityRow = (prefix: string) => [
    { label: 'Currency', value: codeLabel('currency', info[`${prefix}Currency`]) },
    { label: 'Stmt. Frequency', value: codeLabel('stmtFreq', info[`${prefix}StmtFreq`]) },
    { label: 'Cheque Book', value: yesNo(info[`${prefix}ChequeBook`]) },
    { label: 'A/c Status', value: codeLabel('accStatus', info[`${prefix}Status`]) },
  ]
  return (
    <DetailScreen
      kicker="Juristic Customer"
      title="Account Details"
      subtitle="Page 2 of 2 — read-only enquiry, account facilities and service flags."
      chips={[
        { label: 'Customer No', value: profile.custNo },
        { label: 'Organization', value: profile.eOrgShortName || profile.aOrgShortName },
        { label: 'Category', value: codeLabel('samaMainCategory', profile.samaMainCategory) },
      ]}
      sections={[
        {
          title: 'Home Country Address',
          fields: [
            { label: 'Address 1', value: info.address1, wide: true },
            { label: 'Address 2', value: info.address2, wide: true },
            { label: 'P.O. Box', value: info.poBox },
            { label: 'Zip Code', value: info.zipCode },
            { label: 'City', value: info.city },
            { label: 'Country', value: codeLabel('country', info.country) },
            { label: 'Office Phone', value: info.offPhone },
            { label: 'Residence Phone', value: info.resPhone },
            { label: 'Fax', value: info.fax },
            { label: 'Mobile', value: info.mobile },
            { label: 'Pager', value: info.pager },
            { label: 'E-mail', value: info.email },
          ],
        },
        {
          title: 'Current Account',
          description: info.currentAcFlag === '1' ? undefined : 'Not requested.',
          fields: info.currentAcFlag === '1' ? facilityRow('currentAc') : [],
        },
        {
          title: 'Saving Account',
          description: info.savingAcFlag === '1' ? undefined : 'Not requested.',
          fields:
            info.savingAcFlag === '1'
              ? facilityRow('savingAc').filter((f) => f.label !== 'Cheque Book')
              : [],
        },
        {
          title: 'Other Account',
          description: info.otherAcLedger ? undefined : 'Not requested.',
          fields: info.otherAcLedger
            ? [
                { label: 'Ledger', value: codeLabel('ledger', info.otherAcLedger) },
                ...facilityRow('otherAc'),
              ]
            : [],
        },
        {
          title: 'Signature & Service Flags',
          fields: [
            {
              label: 'Nature of Signature',
              // stcusttab.signatureNature is 0-single / 1-joint. This tested
              // for 'J' and 'S', which the column never holds, so the field
              // rendered EMPTY for every customer in both locales.
              value: codeLabel('signatureNature', info.signatureNature),
            },
            { label: 'Internet Facility', value: yesNo(info.internetFlag) },
            { label: 'Customer Advice', value: yesNo(info.customerAdvice) },
            { label: 'Update for SAMA', value: yesNo(info.updateForSama) },
          ],
        },
        {
          title: 'Relationship & Memos',
          fields: [
            { label: 'Relationship Manager', value: info.relationshipManager },
            { label: 'Freezing Grace Period (Days)', value: info.freezingGracePeriod },
            { label: 'General Memo', value: info.generalMemo, wide: true },
            { label: 'Marketing Memo', value: info.marketingMemo, wide: true },
          ],
        },
      ]}
      // The legacy form's enquiry-reachable buttons, in its own left-to-right
      // order (frmJuristicAccountInfo.frm cmdPrevPage / cmdSignatory / cmdOwner
      // / cmdDocuments / cmdCancel). Create, Approve and Reject are the
      // maintenance path and stay out of an enquiry build.
      //
      // All three drill-downs take the legacy's SEARCH branch, which is the one
      // that runs when searchAction / custHistoryAction is set: it skips
      // validateFrmJuristicAcctInfo and the gDateTime stamp — both create-time
      // concerns — and simply loads the target form by customer number
      // (:2179 cmdOwner, :2270 cmdSignatory).
      buttons={[
        { label: 'Previous Page', kind: 'primary', onClick: onPrevPage },
        { label: 'Signatory Details', onClick: onSignatories },
        { label: 'Owner Details', onClick: onOwners },
        { label: 'Documents', onClick: onDocuments },
        // cmdCancel_Click is `Unload Me` (:1974) — it leaves the customer
        // entirely, unlike Previous Page which only steps back a page. Matches
        // the individual page 2's Cancel.
        { label: 'Cancel', kind: 'danger', onClick: onCancel },
      ]}
    />
  )
}
