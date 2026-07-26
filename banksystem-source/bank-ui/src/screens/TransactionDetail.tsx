import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatAmount, formatDate } from '../schema/helpers.ts'

// Mirrors legacy frmBMTransDetails.frm — thd0data recType-0 header plus
// recType-1 narratives (QUERY-SPECS §18).

export default function TransactionDetail({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
  return (
    <DetailScreen
      kicker="Account"
      title="BankMaster Transaction Details"
      chips={[
        { label: 'Account No', value: detail.accNo },
        { label: 'Reference No', value: detail.transRef },
        { label: 'Customer', value: detail.custName },
      ]}
      sections={[
        {
          title: 'Transaction',
          fields: [
            { label: 'Post Date', value: formatDate(detail.postDate) },
            { label: 'Value Date', value: formatDate(detail.valueDate) },
            { label: 'Amount', value: formatAmount(detail.transAmt) },
            { label: 'Type', value: detail.transType },
            { label: 'User Id', value: detail.userId },
            { label: 'Supervisor Id', value: detail.supervisorId },
            { label: 'Statement Flag', value: detail.stmtFlag },
          ],
        },
        {
          title: 'Narratives',
          fields: [
            { label: 'Narrative 1', value: detail.narrative1, wide: true },
            { label: 'Narrative 2', value: detail.narrative2, wide: true },
            { label: 'Narrative 3', value: detail.narrative3, wide: true },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
