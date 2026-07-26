import DetailScreen from '../components/DetailScreen.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmIndividualOthers.frm ("Individual Customer Details -
// Others") as a read-only enquiry — non-Saudi individuals (iqama/passport).

export default function IndividualOthers({
  profile,
  historyAsOf,
  onAccounts,
  onHeirs,
  onReferences,
  onJointHolders,
  onBack,
}: {
  profile: GridRow
  historyAsOf?: string
  onAccounts: () => void
  onHeirs: () => void
  onReferences: () => void
  onJointHolders: () => void
  onBack: () => void
}) {
  return (
    <DetailScreen
      kicker="Individual — Other Nationality"
      title="Customer Details"
      subtitle="Read-only enquiry — non-Saudi individual profile."
      banner={<HistoryBanner asOf={historyAsOf} />}
      chips={[
        { label: 'Customer No', value: profile.custNo },
        { label: 'Nationality', value: codeLabel('country', profile.nationality) },
        { label: 'Branch', value: codeLabel('branch', profile.branchCode) },
      ]}
      sections={[
        {
          title: 'Identification',
          fields: [
            { label: 'Id Type', value: codeLabel('idType', profile.idType) },
            { label: 'Id Number', value: profile.idNo },
            { label: 'Issued At', value: profile.idIssuedAt },
            { label: 'Preferred Language', value: codeLabel('language', profile.preferredLang) },
            { label: 'Issue Date (Hijri)', value: formatDate(profile.idIssueDateH) },
            { label: 'Issue Date (Gregorian)', value: formatDate(profile.idIssueDateG) },
            { label: 'Expiry Date (Hijri)', value: formatDate(profile.idExpiryDateH) },
            { label: 'Expiry Date (Gregorian)', value: formatDate(profile.idExpiryDateG) },
          ],
        },
        {
          title: 'Personal',
          fields: [
            { label: 'Arabic Name', value: [profile.aFirstName, profile.a2ndName, profile.a3rdName, profile.aLastName].filter(Boolean).join(' '), wide: true },
            { label: 'English Name', value: [profile.eFirstName, profile.e2ndName, profile.e3rdName, profile.eLastName].filter(Boolean).join(' '), wide: true },
            { label: 'Short Name', value: profile.eShortName || profile.aShortName, wide: true },
            { label: 'Date of Birth (Hijri)', value: formatDate(profile.dobDateH) },
            { label: 'Date of Birth (Gregorian)', value: formatDate(profile.dobDateG) },
            { label: 'Gender', value: codeLabel('sex', profile.sexCode) },
            { label: 'Marital Status', value: codeLabel('maritalStatus', profile.marritalStatus) },
            { label: 'Business Type', value: codeLabel('businessType', profile.businessType) },
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
            { label: 'Home Phone', value: profile.telHomeNo },
            { label: 'Mobile', value: profile.mobileNo },
            { label: 'E-Mail', value: profile.eMail, wide: true },
          ],
        },
      ]}
      buttons={[
        { label: 'Accounts', kind: 'primary', onClick: onAccounts },
        { label: 'Heirs / Proxy', onClick: onHeirs },
        { label: 'References', onClick: onReferences },
        { label: 'Joint Holders', onClick: onJointHolders },
        { label: 'Back', kind: 'danger', onClick: onBack },
      ]}
    />
  )
}
