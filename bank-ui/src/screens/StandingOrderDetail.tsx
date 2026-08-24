import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import StatusBadge from '../components/StatusBadge.tsx'
import { formatAmount, formatDate } from '../schema/helpers.ts'

import { t } from '../i18n/index.ts'
import { codeLabel } from '../codes.ts'
import { Segmented } from '../components/legacyForm.tsx'
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
            { label: 'Order Type', value: codeLabel('orderType', detail.orderType) },
            { label: 'Payment Type', value: codeLabel('paymentType', detail.paymentType) },
            { label: 'Pay Mode', value: codeLabel('paymentMode', detail.paymentMode) },
            { label: 'Pay Freq', value: codeLabel('paymentFrequency', detail.paymentFrequency) },
            // frameCommission / frameNextDay: two OptionButton pairs the form
            // draws between "No of payments made" and "Payment Amount", both
            // read as "0 means the first button, anything else the second"
            // (frmStdOrdGrid.frm:623). They were dropped entirely, so two of
            // the order's terms never reached the screen.
            //
            // limitInExcessFlag and transactionDateFlag stay out: the wire
            // record carries them (:517, :528) but frmStandingOrderDetail has
            // no control for either, so the legacy never shows them.
            {
              label: 'Commission Flag',
              node: <Segmented options={['Yes', 'No']} selected={detail.commissionFlag === '0' ? 1 : 0} />,
            },
            {
              label: 'Next Day Flag',
              node: (
                <Segmented
                  options={['Process Same Day', 'Process Next Day']}
                  selected={detail.processNextDayFlag === '0' ? 0 : 1}
                />
              ),
              wide: true,
            },
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
