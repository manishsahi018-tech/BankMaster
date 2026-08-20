import { SectionCard } from '../components/fields.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { formatAmount } from '../schema/helpers.ts'
import { RoText, Field, DateTriple, BackArrow } from '../components/legacyForm.tsx'

// Mirrors legacy frmStopChqDetails.frm — pyd0data point read plus the latest
// ststchqlog entry (QUERY-SPECS §10) — as a FORM, which is what the legacy is:
// seven text boxes, a DD/MM/YYYY stop date and one free-text box, in this order.
//
// Its labels are the form's own, and one of them corrects a mislabel: the box
// captioned "Reason" is filled from payeeName —
//
//     frmStopChqDetails.txtDetails = recvStopChqDetail.payeeName
//     (globalFunctions.bas:4595)
//
// so pyd0data's payeeName column carries the REASON the cheque was stopped, not
// a payee. This screen showed it as "Payee Name", which is the column's name
// rather than the field's meaning, and left the operator without the one thing
// a stop-cheque enquiry is usually opened to find.
//
// The legacy's other buttons — Create, Approve, Reject, Supervisor Comments —
// are the write path and stay out of this build; its Cancel is our Return.

export default function StopChequeDetail({
  detail,
  onReturn,
}: {
  detail: GridRow
  onReturn: () => void
}) {
  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">Account</p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            Stop Cheque Details
          </h1>
          <p className="mt-1 text-sm text-muted">Read-only enquiry.</p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          Cheque {String(detail.chequeNo ?? '')}
        </span>
      </div>

      <div className="grid gap-5">
        <SectionCard title="Stop Cheque Details">
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            <Field label="User stopped the cheque">
              <RoText value={detail.stopChqUserId} />
            </Field>
            <Field label="Account Number">
              <RoText value={detail.accNo} className="tabular-nums" />
            </Field>
            <Field label="Stop Date">
              <DateTriple value={detail.dateStop} />
            </Field>
            <Field label="From Cheque">
              <RoText value={detail.chequeFrom} className="tabular-nums" />
            </Field>
            <Field label="To Cheque No.">
              <RoText value={detail.chequeNo} className="tabular-nums" />
            </Field>
            <Field label="Cheque Amount">
              <RoText value={formatAmount(detail.amount)} className="tabular-nums" />
            </Field>
            <Field label="Reason" className="lg:col-span-3">
              <RoText value={detail.payeeName} />
            </Field>
          </div>
        </SectionCard>

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <button
            type="button"
            onClick={onReturn}
            className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
          >
            <BackArrow />
            Return
          </button>
        </div>
      </div>
    </main>
  )
}
