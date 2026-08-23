import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import StatusBadge from '../components/StatusBadge.tsx'
import { formatAmount, formatDate } from '../schema/helpers.ts'

import { t } from '../i18n/index.ts'
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
              value={detail.pending ? t('Pending approval') : t('Confirmed')}
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
            { label: 'Pay Mode', value: detail.paymentMode },
            { label: 'Pay Freq', value: detail.paymentFrequency },
          ],
        },
        {
          title: 'Schedule',
          fields: [
            { label: 'First Pay Date', value: formatDate(detail.firstPaymentDate) },
            { label: 'Next Pay Date', value: formatDate(detail.nextPaymentDate) },
            { label: 'Final Pay Date', value: formatDate(detail.finalPaymentDate) },
            { label: 'Last Process Dt', value: formatDate(detail.lastProcessedDate) },
            { label: 'No of payments to make', value: detail.paymentsToBeMade },
            { label: 'No of payments made', value: detail.paymentsMade },
          ],
        },
        {
          title: 'Amounts',
          fields: [
            { label: 'Payment Amount', value: formatAmount(detail.paymentAmt) },
            { label: 'Total Amt to pay', value: formatAmount(detail.totalToPay) },
            { label: 'Amt paid to date', value: formatAmount(detail.totalPaidToDate) },
            { label: 'Threshold', value: formatAmount(detail.thresholdAmt) },
          ],
        },
        {
          title: 'Payee',
          fields: [
            { label: 'Payee Account', value: detail.payAccNo },
            { label: 'Payee Customer Name', value: detail.payeeCustName, wide: true },
          ],
        },
        {
          title: 'Narratives & Remarks',
          fields: [
            { label: 'Dr Narrative-1', value: detail.drNarrative1, wide: true },
            { label: 'Dr Narrative-2', value: detail.drNarrative2, wide: true },
            { label: 'Cr Narrative-1', value: detail.crNarrative1, wide: true },
            { label: 'Cr Narrative-2', value: detail.crNarrative2, wide: true },
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
