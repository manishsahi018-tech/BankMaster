import GridScreen from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Account } from '../types.ts'
import { stacclog } from '../schema/index.ts'
import { column } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'

// A/C Status History — legacy service 57 requestType '0' (getAcctStatusHistory
// in cbothers.c): stacclog rows where statusChanged='1', including the change
// reason. The SAMA variant (requestType '1') is SamaStatusHistory.tsx.

const COLUMNS = [
  column(stacclog, 'dateTime', { label: 'Date & Time' }),
  column(stacclog, 'userId', { label: 'User Id' }),
  column(stacclog, 'supervisorId', { label: 'Supervisor Id' }),
  column(stacclog, 'lastUpdateDateTime', { label: 'Approved Date & Time' }),
  column(stacclog, 'fromStatus', {
    label: 'From Status',
    render: (v) => codeLabel('accStatus', v),
  }),
  column(stacclog, 'toStatus', {
    label: 'To Status',
    render: (v) => codeLabel('accStatus', v),
  }),
  column(stacclog, 'accStatusChangeReason', { label: 'Reason for Changing' }),
]

export default function AcctStatusHistory({
  account,
  rows,
  onReturn,
}: { account: Account; rows: GridRow[]; onReturn: () => void }) {
  return (
    <GridScreen
      kicker="Account"
      title="Account Status History"
      header={[{ label: 'Account Number', value: account.accountNumber }]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No status changes recorded for this account."
      buttonGroups={[
        [{ label: 'Return', kind: 'primary', onClick: () => onReturn() }],
      ]}
    />
  )
}
