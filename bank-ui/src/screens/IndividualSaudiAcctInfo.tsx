import DetailScreen from '../components/DetailScreen.tsx'
import type { Customer } from '../types.ts'

// Mirrors legacy frmIndividualSaudiAcctInfo.frm — page 2 of the Individual Saudi
// profile — as a READ-ONLY enquiry. Data is the customer's stcusttab attributes
// (api.customerAcctInfo). The legacy "Accounts to Open" and "Cards & Delivery"
// sections are new-customer create inputs, not enquiry data, so they are omitted.

const yesNo = (v?: string) => (v === '1' ? 'Yes' : v === '0' || v === '' || v == null ? 'No' : v)
const signature = (v?: string) => (v === 'J' ? 'Joint' : v === 'S' ? 'Single' : v ?? '')

export default function IndividualSaudiAcctInfo({
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
  return (
    <DetailScreen
      kicker="Individual — Saudi National"
      title="Account Details"
      subtitle="Read-only enquiry — page 2: employment, income, SAMA & memos."
      chips={[
        { label: 'Customer No', value: customer?.custNo },
        { label: 'Segmentation', value: a.segmentation },
        { label: 'Package A/c', value: a.packageAcc },
      ]}
      sections={[
        {
          title: 'Employment & Income',
          fields: [
            { label: 'Education', value: a.education },
            { label: 'Profession', value: a.profession },
            { label: 'Position', value: a.position },
            { label: 'Monthly Income', value: a.monthlyIncome },
            { label: 'Employer Name', value: a.employerName, wide: true },
            { label: 'Employer P.O. Box', value: a.employerPoBox },
            { label: 'Employer City', value: a.employerCity },
            { label: 'Employer Zip', value: a.employerZipCode },
          ],
        },
        {
          title: 'SAMA, Memos & Fees',
          fields: [
            { label: 'Customer Advice Flag', value: yesNo(a.custAdviceFlag) },
            { label: 'Updated for SAMA', value: yesNo(a.updatedForSama) },
            { label: 'Nature of Signature', value: signature(a.signatureNature) },
            { label: 'Freezing Grace Period (Days)', value: a.freezingGracePeriod },
            { label: 'Relationship Manager', value: a.relationshipManager },
            { label: 'General Memo', value: a.generalMemo, wide: true },
            { label: 'Marketing Memo', value: a.marketingMemo, wide: true },
          ],
        },
      ]}
      buttons={[
        { label: 'Previous Page', kind: 'primary', onClick: onPrevPage },
        { label: 'Documents', onClick: onDocuments },
        { label: 'Cancel', kind: 'danger', onClick: onCancel },
      ]}
    />
  )
}
