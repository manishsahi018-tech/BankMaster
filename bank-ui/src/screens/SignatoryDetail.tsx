import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors the legacy signatory drill-down — stsigntab ⋈ stidtab with
// idCategory 'S' (QUERY-SPECS §20).

/** The panel shows the parts; joined here since this screen is a detail view. */
const joinName = (...parts: unknown[]) =>
  parts.map((p) => String(p ?? '').trim()).filter(Boolean).join(' ')

export default function SignatoryDetail({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
  const arabicName = joinName(
    detail.aFirstName, detail.aSecondName, detail.aThirdName, detail.aLastName,
  )
  const englishName = joinName(
    detail.eFirstName, detail.eSecondName, detail.eThirdName, detail.eLastName,
  )
  return (
    <DetailScreen
      kicker="Account"
      title="Signatory Detail"
      chips={[
        { label: 'Account No', value: detail.accNo },
        { label: 'Signatory No', value: detail.signatoryNo },
        { label: 'Name', value: detail.signatoryShortName },
      ]}
      sections={[
        {
          title: 'Signatory',
          fields: [
            { label: 'Account No', value: detail.accNo },
            { label: 'Signatory No', value: detail.signatoryNo },
            { label: 'Customer Branch', value: detail.custBranchCode },
            { label: 'Signature Enabled', value: detail.activeStatus === '1' ? 'Yes' : 'No' },
            { label: 'Arabic Name', value: arabicName, wide: true },
            { label: 'English Name', value: englishName, wide: true },
            { label: 'Short Name', value: detail.signatoryShortName, wide: true },
            // The form shows this only when the signature is disabled; it is
            // the reason someone turned it off, and it is the first thing an
            // operator looking at a blocked signatory needs.
            ...(detail.activeStatus === '1'
              ? []
              : [
                  {
                    label: 'Reason for Disabled Signature',
                    value: detail.reason,
                    wide: true,
                  },
                  { label: 'Action Date', value: formatDate(detail.signatureActionDate) },
                ]),
          ],
        },
        {
          title: 'Identity Document',
          fields: [
            { label: 'Id Type', value: codeLabel('idType', detail.idType) },
            { label: 'Id Number', value: detail.idNo },
            { label: 'Diplomatic PP Number', value: detail.diplomaticPpNo },
            { label: 'Issued At', value: detail.idIssuedAt },
            { label: 'Date Type', value: detail.idDateType === '0' ? 'Hijri' : 'Gregorian' },
            { label: 'Issue Date (Hijri)', value: formatDate(detail.idIssueDateH) },
            { label: 'Issue Date (Gregorian)', value: formatDate(detail.idIssueDateG) },
            { label: 'Expiry Date (Hijri)', value: formatDate(detail.idExpiryDateH) },
            { label: 'Expiry Date (Gregorian)', value: formatDate(detail.idExpiryDateG) },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
