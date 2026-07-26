import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate, formatTimestamp } from '../schema/helpers.ts'

// Mirrors legacy frmChequeBookHistory.frm — the lifecycle audit of one
// stchqtab record (QUERY-SPECS §12).

const formatTime = (v: unknown) => {
  const s = String(v ?? '')
  return /^\d{6}$/.test(s) ? `${s.slice(0, 2)}:${s.slice(2, 4)}:${s.slice(4, 6)}` : s
}

export default function ChequeBookHistory({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
  const stage = (title: string, date: unknown, time: unknown, user: unknown) => ({
    title,
    fields: [
      { label: 'Date', value: formatDate(date) },
      { label: 'Time', value: formatTime(time) },
      { label: 'User', value: user as string },
    ],
  })
  return (
    <DetailScreen
      kicker="Account"
      title="Cheque Book History"
      chips={[
        { label: 'Account No', value: detail.accNo },
        { label: 'Requested', value: formatTimestamp(detail.requestDateTime) },
        { label: 'Request User', value: detail.requestUserId },
      ]}
      sections={[
        stage('Produced', detail.producedDate, detail.producedTime, detail.producedUserId),
        stage('Received by Branch', detail.recdByBranchDate, detail.recdByBranchTime, detail.recdByBranchUserId),
        stage('Issued to Customer', detail.issuedToCustDate, detail.issuedToCustTime, detail.issuedToCustUserId),
        {
          title: 'Rejection',
          fields: [
            { label: 'Date', value: formatDate(detail.rejectedDate) },
            { label: 'Time', value: formatTime(detail.rejectedTime) },
            { label: 'User', value: detail.rejectedUserId },
            { label: 'Reason', value: detail.rejectedReason },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
