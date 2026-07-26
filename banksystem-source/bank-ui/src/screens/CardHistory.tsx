import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate, formatTimestamp, maskCardNo } from '../schema/helpers.ts'

// Mirrors legacy frmCardHistory.frm ("Card / Pin History") — stcardlog
// completed lifecycle records (QUERY-SPECS §15). Shows the latest record's
// card + PIN stage trail.

const formatTime = (v: unknown) => {
  const s = String(v ?? '')
  return /^\d{6}$/.test(s) ? `${s.slice(0, 2)}:${s.slice(2, 4)}:${s.slice(4, 6)}` : s
}

export default function CardHistory({
  cardNo,
  entries,
  onReturn,
}: {
  cardNo: string
  entries: GridRow[]
  onReturn: () => void
}) {
  const e = entries[0] ?? {}
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
      kicker="Cards"
      title="Card / Pin History"
      subtitle={entries.length > 1 ? `${entries.length} completed requests — showing the most recent.` : undefined}
      chips={[
        { label: 'Card Number', value: maskCardNo(cardNo) },
        { label: 'Requested', value: formatTimestamp(e.requestDateTime) },
        { label: 'Request User', value: e.requestUserId },
        { label: 'Supervisor', value: e.supervisorId },
      ]}
      sections={[
        stage('Card Generated', e.cardGeneratedDate, e.cardGeneratedTime, e.cardGeneratedUserId),
        stage('Card Received by Branch', e.cBranchReceiptDate, e.cBranchReceiptTime, e.cBranchReceiptUserId),
        stage('Card Issued to Customer', e.cCustIssueDate, e.cCustIssueTime, e.cCustIssueUserId),
        stage('PIN Generated', e.pinGeneratedDate, e.pinGeneratedTime, e.pinGeneratedUserId),
        stage('PIN Received by Branch', e.pBranchReceiptDate, e.pBranchReceiptTime, e.pBranchReceiptUserId),
        stage('PIN Issued to Customer', e.pCustIssueDate, e.pCustIssueTime, e.pCustIssueUserId),
        {
          title: 'Rejection',
          fields: [
            { label: 'Date', value: formatDate(e.rejectedDate) },
            { label: 'Time', value: formatTime(e.rejectedTime) },
            { label: 'User', value: e.rejectedUserId },
            { label: 'Reason', value: e.rejectedReason },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
