import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate } from '../schema/helpers.ts'
import { Segmented, isFirst } from '../components/legacyForm.tsx'
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
      title="Signatory Details"
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
            {
              // An OptionButton pair on the legacy form, so it is drawn as one
              // here too — the same control PartyDetail, OwnerDetail and
              // JointHolderDetail use for their Yes/No rows. Segmented
              // translates its own options.
              label: 'Signatory Enabled',
              node: <Segmented options={['Yes', 'No']} selected={detail.activeStatus === '1' ? 0 : 1} />,
            },
            { label: 'Arabic Name', value: arabicName, wide: true },
            { label: 'English Name', value: englishName, wide: true },
            { label: 'Arabic Short Name', value: detail.aShortName, wide: true },
            { label: 'English Short Name', value: detail.eShortName, wide: true },
            // The form shows this only when the signature is disabled; it is
            // the reason someone turned it off, and it is the first thing an
            // operator looking at a blocked signatory needs.
            ...(detail.activeStatus === '1'
              ? []
              : [
                  {
                    label: 'Reason for Disabled signatory',
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
            { label: 'Diplomatic Passport No', value: detail.diplomaticPpNo },
            { label: 'Issued At', value: detail.idIssuedAt },
            {
              label: 'Date Type',
              node: (
                <Segmented options={['Hijri', 'Gregorian']} selected={isFirst(detail.idDateType) ? 0 : 1} />
              ),
            },
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
