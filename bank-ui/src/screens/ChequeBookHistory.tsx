import { SectionCard } from '../components/fields.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatDate } from '../schema/helpers.ts'
import { RoText, Field, EventGrid, BackArrow, type HistoryEvent } from '../components/legacyForm.tsx'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmChequeBookHistory.frm — the lifecycle audit of one stchqtab
// record (QUERY-SPECS §12).
//
// ONE grid, as the form has it: Date | Time | Action | User Id, with an account
// number above it and a Return button below. The stages are rows, each emitted
// only when its date is present, in the order the form emits them
// (frmChequeBookHistory.frm:159-235).
//
// This replaced four labelled stage sections. Same correction as Card / Pin
// History: a lifecycle is a log, and rendering it as sections loses the shape
// the operator reads it in — down the Action column, in order.

/** The action words are the form's own (frmChequeBookGridCaption 17-20). */
function buildEvents(d: Record<string, unknown>): HistoryEvent[] {
  const has = (v: unknown) => String(v ?? '').trim() !== ''
  const rows: HistoryEvent[] = []
  const stamp = String(d.requestDateTime ?? '')
  const requestDate = /^\d{14}$/.test(stamp) ? stamp.slice(0, 8) : stamp
  const requestTime = /^\d{14}$/.test(stamp) ? stamp.slice(8, 14) : ''

  if (has(requestDate)) {
    rows.push({ date: requestDate, time: requestTime, action: 'Processed', user: d.requestUserId })
  }
  if (has(d.producedDate)) {
    rows.push({
      date: d.producedDate,
      time: d.producedTime,
      action: 'Produced',
      user: d.producedUserId,
    })
  }
  if (has(d.recdByBranchDate)) {
    rows.push({
      date: d.recdByBranchDate,
      time: d.recdByBranchTime,
      action: 'Received By Branch',
      user: d.recdByBranchUserId,
    })
  }
  if (has(d.issuedToCustDate)) {
    rows.push({
      date: d.issuedToCustDate,
      time: d.issuedToCustTime,
      action: 'Issued to customer',
      user: d.issuedToCustUserId,
    })
  }
  if (has(d.rejectedDate)) {
    // " Rejected  (reason)" — the form builds this one inline rather than from
    // its caption table (frmChequeBookHistory.frm:231).
    rows.push({
      date: d.rejectedDate,
      time: d.rejectedTime,
      action: `Rejected  (${String(d.rejectedReason ?? '').trim()})`,
      user: d.rejectedUserId,
    })
  }
  return rows
}

export default function ChequeBookHistory({
  detail,
  onReturn,
}: {
  detail: GridRow
  onReturn: () => void
}) {
  const rows = buildEvents(detail as Record<string, unknown>)
  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">{t('Account')}</p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">{t('Cheque Book History')}</h1>
      </div>

      <div className="grid gap-5">
        <SectionCard title="Cheque Book History">
          <div className="mb-4 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Account Number">
              <RoText value={detail.accNo} muted className="tabular-nums" />
            </Field>
          </div>
          <EventGrid rows={rows} dateFormat={formatDate} />
        </SectionCard>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <button
            type="button"
            onClick={onReturn}
            className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
          >
            <BackArrow />
            {t('Return')}
          </button>
        </div>
      </div>
    </main>
  )
}
