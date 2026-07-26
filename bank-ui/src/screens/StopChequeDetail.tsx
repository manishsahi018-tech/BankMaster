import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatAmount, formatDate } from '../schema/helpers.ts'

// Mirrors legacy frmStopChqDetails.frm — pyd0data point read plus the
// latest ststchqlog entry (QUERY-SPECS §10).

export default function StopChequeDetail({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
  return (
    <DetailScreen
      kicker="Account"
      title="Stop Cheque Details"
      chips={[
        { label: 'Account No', value: detail.accNo },
        { label: 'Cheque Number', value: detail.chequeNo },
      ]}
      sections={[
        {
          title: 'Stop Payment',
          fields: [
            { label: 'Amount', value: formatAmount(detail.amount) },
            { label: 'Date Stopped', value: formatDate(detail.dateStop) },
            { label: 'Payee Name', value: detail.payeeName, wide: true },
            { label: 'From Cheque Number', value: detail.chequeFrom },
            { label: 'Stopped By (User)', value: detail.stopChqUserId },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
