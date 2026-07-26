import GridScreen from '../components/GridScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import type { Account } from '../types.ts'
import { stsamaacc } from '../schema/index.ts'
import { column } from '../schema/helpers.ts'

// Mirrors legacy frmAcctStatusHistory.frm ("SAMA account status history details").
// Rows are stsamaacc records. The legacy form split date and time into two
// columns; the archival table stores single YYYYMMDDHH24MISS timestamps, so
// the request and approval each render as one Date & Time column here.

const COLUMNS = [
  column(stsamaacc, 'dateTime', { label: 'Date & Time' }),
  column(stsamaacc, 'userId', { label: 'User Id' }),
  column(stsamaacc, 'supervisorId', { label: 'Supervisor Id' }),
  column(stsamaacc, 'lastUpdateDateTime', { label: 'Approved Date & Time' }),
  column(stsamaacc, 'fromStatus', { label: 'From Status' }),
  column(stsamaacc, 'toStatus', { label: 'To Status' }),
  column(stsamaacc, 'accStatusChangeReason', { label: 'Reason for Changing' }),
]

export default function SamaStatusHistory({
  account,
  rows,
  onReturn,
}: { account: Account; rows: GridRow[]; onReturn: () => void }) {
  return (
    <GridScreen
      kicker="Account"
      title="SAMA Account Status History"
      header={[{ label: 'Account Number', value: account.accountNumber }]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No SAMA status changes recorded for this account."
      buttonGroups={[
        [{ label: 'Return', kind: 'primary', onClick: () => onReturn() }],
      ]}
    />
  )
}
