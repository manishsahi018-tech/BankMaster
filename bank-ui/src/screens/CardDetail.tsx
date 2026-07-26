import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { maskCardNo } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmCardDetails.frm — stcardtab point read (QUERY-SPECS §14).

export default function CardDetail({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
  return (
    <DetailScreen
      kicker="Cards"
      title="Card Maintenance"
      chips={[
        { label: 'Card Number', value: maskCardNo(String(detail.cardNo ?? '')) },
        { label: 'Customer #', value: detail.custNo },
        { label: 'Customer Name', value: detail.custName },
      ]}
      sections={[
        {
          title: 'Card',
          fields: [
            { label: 'Name on the Card', value: detail.nameOnTheCard, wide: true },
            { label: 'Card Type', value: detail.cardType },
            { label: 'Request Status', value: codeLabel('cardRequestStatus', detail.requestStatus) },
            { label: 'New / Update', value: detail.newOrUpdate },
            { label: 'Delivery Branch', value: detail.deliveryBranchCode },
            { label: 'Account No', value: detail.coreAccNo },
            { label: 'Sequence No', value: detail.sequenceNo },
            { label: 'Customer Category', value: detail.custCategory },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
