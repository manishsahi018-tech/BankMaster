import { SectionCard } from '../components/fields.tsx'
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

      <SectionCard title="Documents List for Sub Category">
        <ul className="divide-y divide-edge-soft rounded-xl border border-edge-strong bg-surface shadow-xs">
          {documents.length === 0 && (
            <li className="px-3 py-8 text-center text-sm text-muted-soft">
              No documents configured for this sub-category.
            </li>
          )}
          {documents.map((code) => (
            <li key={code} className="px-3 py-2.5 text-sm text-ink-soft">
              {docLabel(code)}
            </li>
          ))}
        </ul>
      </SectionCard>

      <div className="mt-5 flex items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
        <button
          type="button"
          onClick={onReturn}
          className="rounded-lg bg-primary px-6 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
        >
          Return
        </button>
      </div>
    </main>
  )
}
