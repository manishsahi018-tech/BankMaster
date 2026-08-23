import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatAmount, formatDate } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmSarieTransDetails.frm — rid0data point read
// (QUERY-SPECS §17).

export default function TransferDetail({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
  return (
    <DetailScreen
      kicker="Account"
      title="Transfer Details"
      chips={[
        { label: 'Reference No', value: detail.transRef },
        // The repository maps rid0data.statusFlag into this key
        // (JdbcTransferRepository:254); the name it shares with
        // sod0data.paymentType is a coincidence, not the same domain.
        { label: 'Status', value: codeLabel('transferStatus', detail.paymentType) },
        { label: 'Customer', value: detail.custName },
      ]}
      sections={[
        {
          title: 'Transfer',
          fields: [
            { label: 'Issue Date', value: formatDate(detail.issueDate) },
            { label: 'Value Date', value: formatDate(detail.valueDate) },
            { label: 'Debit Account', value: detail.drAccNo },
            { label: 'Credit Account', value: detail.crAccNo },
            { label: 'Amount', value: formatAmount(detail.netAmt) },
            { label: 'Currency', value: codeLabel('currency', detail.transCurrCode) },
            { label: 'Payment Amount', value: formatAmount(detail.payAmt) },
            { label: 'Payment Currency', value: codeLabel('currency', detail.payCurrCode) },
            { label: 'Exchange Rate', value: detail.exchangeRate },
            // rid0data.paymentStatus. The legacy resolves it against
            // transfertypeinfo and prints "code-text" beside the payment
            // status (frmSarieTransferEnq.frm:1373); it was fetched but never
            // rendered, so the transfer's own type never reached the screen.
            { label: 'Transfer Type', value: codeLabel('transferType', detail.transType) },
            { label: 'Purpose', value: detail.transferPurpose },
            { label: 'Branch', value: detail.branchCode },
          ],
        },
        {
          title: 'Parties',
          fields: [
            { label: 'Applicant', value: detail.applicantName, wide: true },
            { label: 'Beneficiary', value: detail.benefName, wide: true },
            { label: 'Beneficiary Address 1', value: detail.benefAddr1, wide: true },
            { label: 'Beneficiary Address 2', value: detail.benefAddr2, wide: true },
            { label: 'Beneficiary Bank', value: detail.benefBank, wide: true },
            { label: 'Message', value: detail.message1, wide: true },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
