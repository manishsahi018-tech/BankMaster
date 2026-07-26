import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import StatusBadge from '../components/StatusBadge.tsx'
import { formatAmount, formatDate } from '../schema/helpers.ts'

// Mirrors legacy frmStandingOrderDetail.frm — sod0data joined with
// gld0data / stcusttab / latest stsodlog (QUERY-SPECS §11).

export default function StandingOrderDetail({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
  return (
    <DetailScreen
      kicker="Account"
      title="Standing Order Detail"
      chips={[
        { label: 'Account No', value: detail.accNo },
        { label: 'S/O Number', value: detail.sodNo },
        {
          label: 'Update Status',
          value: (
            <StatusBadge
              value={detail.pending ? 'Pending approval' : 'Confirmed'}
              tone={detail.pending ? 'warn' : 'success'}
            />
          ),
        },
      ]}
      sections={[
        {
          title: 'Order',
          fields: [
            { label: 'Order Type', value: detail.orderType },
            { label: 'Payment Type', value: detail.paymentType },
            { label: 'Payment Mode', value: detail.paymentMode },
            { label: 'Payment Frequency', value: detail.paymentFrequency },
          ],
        },
        {
          title: 'Schedule',
          fields: [
            { label: 'First Payment', value: formatDate(detail.firstPaymentDate) },
            { label: 'Next Payment', value: formatDate(detail.nextPaymentDate) },
            { label: 'Final Payment', value: formatDate(detail.finalPaymentDate) },
            { label: 'Last Processed', value: formatDate(detail.lastProcessedDate) },
            { label: 'Payments To Be Made', value: detail.paymentsToBeMade },
            { label: 'Payments Made', value: detail.paymentsMade },
          ],
        },
        {
          title: 'Amounts',
          fields: [
            { label: 'Payment Amount', value: formatAmount(detail.paymentAmt) },
            { label: 'Total To Pay', value: formatAmount(detail.totalToPay) },
            { label: 'Total Paid To Date', value: formatAmount(detail.totalPaidToDate) },
            { label: 'Threshold Amount', value: formatAmount(detail.thresholdAmt) },
          ],
        },
        {
          title: 'Payee',
          fields: [
            { label: 'Pay Account No', value: detail.payAccNo },
            { label: 'Payee Customer Name', value: detail.payeeCustName, wide: true },
          ],
        },
        {
          title: 'Narratives & Remarks',
          fields: [
            { label: 'Debit Narrative 1', value: detail.drNarrative1, wide: true },
            { label: 'Debit Narrative 2', value: detail.drNarrative2, wide: true },
            { label: 'Credit Narrative 1', value: detail.crNarrative1, wide: true },
            { label: 'Credit Narrative 2', value: detail.crNarrative2, wide: true },
            { label: 'Remarks', value: detail.remarks, wide: true },
          ],
        },
        {
          title: 'Audit',
          description: 'Populated by the system.',
          fields: [
            { label: 'Branch Code', value: detail.branchCode },
            { label: 'Customer Branch', value: detail.custBranchCode },
            { label: 'Last Update User', value: detail.lastUpdateUserId },
            { label: 'Last Update Date', value: formatDate(detail.lastUpdateDate) },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
