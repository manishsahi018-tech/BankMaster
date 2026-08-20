import { SectionCard, Field, ReadOnlyInput } from '../components/fields.tsx'
import { BackArrow } from '../components/legacyForm.tsx'
import type { Customer } from '../types.ts'

// Mirrors legacy frmDocuments.frm ("Essential Documents") as a READ-ONLY
// enquiry: the documents REQUIRED for the customer's SAMA sub-category, from
// stctltabDC (api.requiredDocuments). The legacy "documents submitted" tracking
// is create-time and not part of the archival enquiry data.
//
// NAMES ARE INCOMPLETE, and the map below is not the legacy's design.
// frmDocuments.frm:337-347 resolved every code against a documentinfo table in
// the client's local Access database —
//
//     select * from documentinfo where documentcode = '<code>'
//     tmpStr = tCode & "-" & rs("englishname")   ' or arabicname
//
// — so the legacy carried the FULL set, client-side but data-driven. That table
// has no archival counterpart (stctltabDC is only the category-to-codes
// mapping, with no name columns) and it is not in this repo; only the compiled
// statdata.exe is. These seven entries were transcribed from screenshots and
// cover the mock's fixture codes exactly, which is why mock mode always looked
// complete and real stctltabDC data shows bare codes like 028, 030, 032.
//
// Fill this from the office Access DB's documentinfo table when it is to hand.
const DOCUMENT_NAMES: Record<string, string> = {
  '001': 'Signature of a/c holder',
  '002': 'Thump Imprint/Personal Stamp',
  '008': 'Personal Id card of a/c holder',
  '009': 'Family regn book of a/c holder',
  '025': 'Valid passport copy',
  '051': 'A/C opening agreement',
  '074': 'Family Record',
}

// The legacy did not show a bare code either: a code missing from documentinfo
// rendered as "<code>-Not defined in local" (frmDocuments.frm:347). Saying so
// beats a naked number, which reads as a broken screen rather than a name this
// deployment cannot resolve.
const docLabel = (code: string) =>
  DOCUMENT_NAMES[code] ? `${code} — ${DOCUMENT_NAMES[code]}` : `${code} — Not defined in local`

/**
 * One of the two lists. Read-only: rows are not selectable, because the legacy
 * disables both lists in enquiry mode (frmDocuments.frm:352-358), so there is
 * nothing a selection could lead to.
 */
function DocList({
  title,
  items,
  emptyText,
}: {
  title: string
  items: string[]
  emptyText: string
}) {
  return (
    <div className="flex-1">
      <p className="mb-2 text-sm font-semibold text-ink-soft">{title}</p>
      <ul className="h-64 divide-y divide-edge-soft overflow-y-auto rounded-xl border border-edge-strong bg-surface shadow-xs">
        {items.length === 0 && (
          <li className="px-3 py-8 text-center text-sm text-muted-soft">{emptyText}</li>
        )}
        {items.map((label) => (
          <li key={label} className="px-3 py-2.5 text-sm text-ink-soft">
            {label}
          </li>
        ))}
      </ul>
    </div>
  )
}

export default function EssentialDocuments({
  customer,
  documents,
  onReturn,
}: {
  customer: Customer | null
  documents: string[]
  onReturn: () => void
}) {
  return (
    <main className="mx-auto max-w-5xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            Individual — Saudi National
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">Essential Documents</h1>
          <p className="mt-1 text-sm text-muted">
            Documents required for the customer's SAMA sub-category.
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          Customer {customer?.custNo}
        </span>
      </div>

      <SectionCard title="Documents for Sub Category">
        <div className="flex flex-col items-stretch gap-4 sm:flex-row sm:items-center">
          <DocList
            title="Documents List for Sub Category"
            items={documents.map(docLabel)}
            emptyText="No documents configured for this sub-category."
          />

          {/* The transfer buttons are present and inert, which is what the
              legacy shows an enquiry user: cmdAddDoc and cmdRemoveDoc are
              disabled together with both lists whenever searchAction /
              supervisorAction / custHistoryAction is set
              (frmDocuments.frm:352-358). */}
          <div className="flex shrink-0 flex-row justify-center gap-2 sm:flex-col">
            {['»', '«'].map((glyph) => (
              <button
                key={glyph}
                type="button"
                disabled
                title="Marking documents submitted is a create-time action, not part of this enquiry"
                className="cursor-not-allowed rounded-lg border border-edge bg-surface-muted px-3 py-2 text-sm font-semibold text-muted-soft shadow-xs"
              >
                {glyph}
              </button>
            ))}
          </div>

          <DocList
            title="Documents Submitted"
            items={[]}
            emptyText="Not held in the archive — recorded when the account is opened."
          />
        </div>

        <div className="mt-5 border-t border-edge-soft pt-4">
          <Field label="Others" htmlFor="others">
            <ReadOnlyInput
              id="others"
              value=""
              placeholder="Not held in the archive"
            />
          </Field>
        </div>
      </SectionCard>

      <div className="mt-5 flex items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
        {/* This screen builds its own footer rather than going through
            DetailScreen, so it carries the back arrow itself — the shared
            renderers attach it by label and never see this button. */}
        <button
          type="button"
          onClick={onReturn}
          className="inline-flex items-center gap-2 rounded-lg bg-primary px-6 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
        >
          <BackArrow />
          Return
        </button>
      </div>
    </main>
  )
}
