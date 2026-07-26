import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors the legacy signatory drill-down — stsigntab ⋈ stidtab with
// idCategory 'S' (QUERY-SPECS §20).

export default function SignatoryDetail({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
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
          title: 'Identification',
          description: 'ID details from the signatory ID record (category S).',
          fields: [
            { label: 'Id Type', value: codeLabel('idType', detail.idType) },
            { label: 'Id Number', value: detail.idNo },
            { label: 'Date Type', value: detail.idDateType },
            { label: 'Issued At', value: detail.idIssuedAt },
            { label: 'Issue Date (Hijri)', value: formatDate(detail.idIssueDateH) },
            { label: 'Issue Date (Gregorian)', value: formatDate(detail.idIssueDateG) },
            { label: 'Expiry Date (Hijri)', value: formatDate(detail.idExpiryDateH) },
            { label: 'Expiry Date (Gregorian)', value: formatDate(detail.idExpiryDateG) },
            { label: 'Customer Branch', value: detail.custBranchCode },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
