import { SectionCard } from '../components/fields.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate, maskCardNo } from '../schema/helpers.ts'
import {
  BackArrow,
  EventGrid,
  type HistoryEvent,
} from '../components/legacyForm.tsx'

// Mirrors legacy frmCardHistory.frm ("Card / Pin History") — stcardlog
// completed lifecycle records (QUERY-SPECS §15).
//
// TWO grids, as the form has them: CardHistory and pinHistory, each
// Date | Time | Action | User Id. Every fetched record contributes EVENT ROWS
// to one or both, so a card renewed three times shows three requests here.
//
// This replaced a single detail card that rendered `entries[0]` as six labelled
// stage sections. It read well for one request and silently dropped the rest —
// the repository returns up to 51 records (MAX_TRACKING_ROWS) and the screen
// showed one, which is the opposite of what a history screen is for.
//
// The action vocabulary and which grid each row lands in are the form's own
// (frmCardHistory.frm:250-770).

const has = (v: unknown) => String(v ?? '').trim() !== ''

/**
 * The legacy splits a 14-char YYYYMMDDHH24MISS stamp into its halves
 * (formatDate + formatTime(Mid$(stamp, 9, 6))). Anything that is not a full
 * stamp is passed through as the date rather than sliced into nonsense.
 */
const isStamp = (v: unknown) => /^\d{14}$/.test(String(v ?? '').trim())
const stampDate = (v: unknown) => (isStamp(v) ? String(v).slice(0, 8) : String(v ?? '').trim())
const stampTime = (v: unknown) => (isStamp(v) ? String(v).slice(8, 14) : '')

/**
 * The request-type branch (frmCardHistory.frm:250-495).
 *
 * Types outside this list fall back to the raw code: the legacy looks the rest
 * up in a requestTypeInfo table in the branch PC's local Access database, which
 * has no archival counterpart — the same gap as the document names.
 */
const REQUEST_ACTION: Record<string, string> = {
  '0': 'Requested',
  '1': 'Card Renewed',
  '2': 'Force Card',
  '3': 'Force pin',
  '4': 'Card Deactivated',
  '5': 'Activation Requested',
  '6': 'Change Address',
  '7': 'Restriction  Requested',
  '8': 'Unrestriction  Requested',
}

const APPROVED_ACTION: Record<string, string> = {
  '0': 'Approved',
  '2': 'Force Card  Approved',
  '3': 'Force pin Approved',
  '5': 'Activation Approved',
  '7': 'Restriction  Approved',
  '8': 'Unrestriction  Approved',
}

/** Card and PIN event rows for every fetched record, in the form's order. */
function buildEvents(entries: GridRow[]): { card: HistoryEvent[]; pin: HistoryEvent[] } {
  const card: HistoryEvent[] = []
  const pin: HistoryEvent[] = []

  for (const e of entries) {
    const type = String(e.requestType ?? '').trim()
    const requested = REQUEST_ACTION[type] ?? type
    const rejected = has(e.rejectedDate)

    // The request row. Type '3' is a PIN request and is the one that goes to
    // the PIN grid alone; '0' opens both.
    const row: HistoryEvent = {
      date: stampDate(e.requestDateTime),
      time: stampTime(e.requestDateTime),
      action: requested,
      user: e.requestUserId,
    }
    if (type === '3') pin.push(row)
    else card.push(row)
    if (type === '0') pin.push(row)

    // Then its outcome: a rejection carries its reason, an approval the
    // supervisor who gave it.
    if (rejected) {
      const reject: HistoryEvent = {
        date: e.rejectedDate,
        time: e.rejectedTime,
        action: `Rejected( ${String(e.rejectedReason ?? '').trim()})`,
        user: e.rejectedUserId,
      }
      card.push(reject)
    } else if (APPROVED_ACTION[type]) {
      const approve: HistoryEvent = {
        date: stampDate(e.lastUpdateDateTime),
        time: stampTime(e.lastUpdateDateTime),
        action: APPROVED_ACTION[type],
        user: e.supervisorId,
      }
      if (type === '3') pin.push(approve)
      else card.push(approve)
      if (type === '0') pin.push(approve)
    }

    // The production trail, which the form builds for card requests only —
    // types '0', '1' and '2' (:495, :603, :631, :659).
    if (['0', '1', '2'].includes(type)) {
      if (has(e.processDateTime)) {
        card.push({
          date: stampDate(e.processDateTime),
          time: stampTime(e.processDateTime),
          action: 'Sent to DC9000',
          user: 'EOD-Extract',
        })
      }
      if (has(e.cardGeneratedDate)) {
        card.push({
          date: e.cardGeneratedDate,
          time: e.cardGeneratedTime,
          action: 'Produced at DC9000',
          user: e.cardGeneratedUserId,
        })
      }
      if (has(e.cBranchReceiptDate)) {
        card.push({
          date: e.cBranchReceiptDate,
          time: e.cBranchReceiptTime,
          action: 'Received By Branch',
          user: e.cBranchReceiptUserId,
        })
      }
      if (has(e.cCustIssueDate)) {
        card.push({
          date: e.cCustIssueDate,
          time: e.cCustIssueTime,
          action: 'Issued to customer',
          user: e.cCustIssueUserId,
        })
      }
      if (has(e.pinGeneratedDate)) {
        pin.push({
          date: e.pinGeneratedDate,
          time: e.pinGeneratedTime,
          action: 'Printed at HSM',
          user: e.pinGeneratedUserId,
        })
      }
      if (has(e.pBranchReceiptDate)) {
        pin.push({
          date: e.pBranchReceiptDate,
          time: e.pBranchReceiptTime,
          action: 'Received by branch',
          user: e.pBranchReceiptUserId,
        })
      }
      if (has(e.pCustIssueDate)) {
        pin.push({
          date: e.pCustIssueDate,
          time: e.pCustIssueTime,
          action: 'Issue to customer',
          user: e.pCustIssueUserId,
        })
      }
    }
  }
  return { card, pin }
}

function HistoryGrid({ title, rows }: { title: string; rows: HistoryEvent[] }) {
  return (
    <SectionCard title={title}>
      <EventGrid rows={rows} dateFormat={formatDate} />
    </SectionCard>
  )
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
  const { card, pin } = buildEvents(entries)
  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">Cards</p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">Card / Pin History</h1>
          <p className="mt-1 text-sm text-muted">
            {entries.length} completed {entries.length === 1 ? 'request' : 'requests'}.
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          Card {maskCardNo(cardNo)}
        </span>
      </div>

      {/* Side by side as the form has them, stacking on a narrow screen. */}
      <div className="grid gap-5 lg:grid-cols-2">
        <HistoryGrid title="Card History" rows={card} />
        <HistoryGrid title="Pin History" rows={pin} />
      </div>

      <div className="mt-5 flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
        <button
          type="button"
          onClick={onReturn}
          className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
        >
          <BackArrow />
          Return to Card Details
        </button>
      </div>
    </main>
  )
}
