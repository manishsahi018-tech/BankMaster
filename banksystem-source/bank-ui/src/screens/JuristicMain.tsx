import DetailScreen from '../components/DetailScreen.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmJuristicMain.frm ("Customer Details" — juristic) as a
// read-only enquiry over the stcusttab profile. The legacy variants
// (Diplomats / Non-Resident / Public-Corp) differ by category, not layout.

export default function JuristicMain({
  profile,
  historyAsOf,
  onAccounts,
  onOwners,
  onReferences,
  onNextPage,
  onBack,
}: {
  profile: GridRow
  historyAsOf?: string
  onAccounts: () => void
  onOwners: () => void
  onReferences: () => void
  onNextPage: () => void
  onBack: () => void
}) {
  return (
    <DetailScreen
      kicker="Juristic Customer"
      title="Customer Details"
      subtitle="Page 1 of 2 — read-only enquiry, juristic customer profile."
      banner={<HistoryBanner asOf={historyAsOf} />}
      chips={[
        { label: 'Customer No', value: profile.custNo },
        { label: 'Category', value: codeLabel('samaMainCategory', profile.samaMainCategory) },
        { label: 'Branch', value: codeLabel('branch', profile.branchCode) },
      ]}
      sections={[
        {
          title: 'Organization',
          fields: [
            { label: 'Arabic Name', value: profile.aOrgName1, wide: true },
            { label: 'English Name', value: profile.eOrgName1, wide: true },
            { label: 'Arabic Short Name', value: profile.aOrgShortName, wide: true },
            { label: 'English Short Name', value: profile.eOrgShortName, wide: true },
          ],
        },
        {
          title: 'Commercial Registration',
          fields: [
            { label: 'CR Number', value: profile.crNo },
            { label: 'Issued At', value: profile.crIssuedAt },
            { label: 'Issue Date (Hijri)', value: formatDate(profile.crIssueDateH) },
            { label: 'Issue Date (Gregorian)', value: formatDate(profile.crIssueDateG) },
            { label: 'Business Type', value: codeLabel('businessType', profile.businessType) },
            { label: 'Nationality', value: codeLabel('country', profile.nationality) },
            { label: 'Relationship Manager', value: profile.relationshipManager },
            { label: 'Customer Open Date', value: formatDate(profile.custOpenDate) },
          ],
        },
        {
          title: 'Address & Contact',
          fields: [
            { label: 'Address 1', value: profile.address1, wide: true },
            { label: 'Address 2', value: profile.address2, wide: true },
            { label: 'P.O. Box', value: profile.poBox },
            { label: 'City', value: profile.cityName },
            { label: 'Zip Code', value: profile.zipCode },
            { label: 'Country', value: codeLabel('country', profile.country) },
            { label: 'Office Phone', value: profile.telOffNo },
            { label: 'Mobile', value: profile.mobileNo },
            { label: 'E-Mail', value: profile.eMail, wide: true },
          ],
        },
      ]}
      buttons={[
        { label: 'Accounts', kind: 'primary', onClick: onAccounts },
        { label: 'Owner / Management', onClick: onOwners },
        { label: 'References', onClick: onReferences },
        { label: 'Next Page', onClick: onNextPage },
        { label: 'Back', kind: 'danger', onClick: onBack },
      ]}
    />
  )
}
