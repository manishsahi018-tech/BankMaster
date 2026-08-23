import { SectionCard, Field, ReadOnlyInput } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import { codeLabel } from '../codes.ts'
import { BackArrow } from '../components/legacyForm.tsx'
import type { EssentialDocumentsPayload } from '../api.ts'
import type { Customer } from '../types.ts'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmDocuments.frm ("Essential Documents") as a READ-ONLY
// enquiry. Both lists are real archival data:
//
//   Documents List for Sub Category — stctltabDC's documnetNo1..20 for the
//     customer's SAMA main+sub category, which is the legacy's
//     categorydocinfo.documents read (frmDocuments.frm:322-324).
//   Documents Submitted           — stcusttab.documentsSupplied, 60 chars of
//     3-char codes. The legacy fills lstSelectedDoc from it in enquiry mode too
//     (frmDocuments.frm:376-392); searchAction / custHistoryAction only DISABLE
//     the controls (:352-358), they do not blank them.
//   Others                        — stcusttab.documentOther (50 chars), the
//     legacy's txtDocOthers = otherDocumentsEntered (:391).
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
// Now the FALLBACK rather than the only source: stctltab carries document type
// names under record type 'DT' (the workbook's own RecordType list), served as
// the `documentType` code set. That is what fills 028, 030, 032 and the rest on
// a real deployment; these seven stay for mock mode and for a deployment whose
// stctltab has no 'DT' rows.
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
const docLabel = (code: string) => {
  const fromCodes = codeLabel('documentType', code)
  if (fromCodes && fromCodes !== code) return fromCodes
  return DOCUMENT_NAMES[code] ? `${code} — ${DOCUMENT_NAMES[code]}` : `${code} — Not defined in local`
}

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
  historyAsOf,
  onReturn,
}: {
  customer: Customer | null
  documents: EssentialDocumentsPayload
  historyAsOf?: string
  onReturn: () => void
}) {
  const mainCategory = codeLabel('samaMainCategory', customer?.mainCategoryCode)
  const subCategory = codeLabel('samaSubCategory', customer?.subCategoryCode)

  // The legacy builds the submitted list by walking the CATEGORY list and
  // keeping the entries whose code appears in documentsSupplied
  // (frmDocuments.frm:383-389), so a supplied code outside the sub-category's
  // list is not shown and each row carries the same resolved name as its
  // counterpart on the left. `extra` is that discarded remainder — the legacy
  // drops it silently, which hides a real mismatch between the customer record
  // and the category definition, so it is listed rather than swallowed.
  const supplied = new Set(documents.supplied)
  const submitted = documents.required.filter((code) => supplied.has(code))
  const extra = documents.supplied.filter((code) => !documents.required.includes(code))

  return (
    <main className="mx-auto max-w-5xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {t('Essential Documents')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            {t('Documents for Sub Category')}
          </h1>
          <p className="mt-1 text-sm text-muted">
            {t("What this customer's SAMA sub-category requires, and what was submitted.")}
          </p>
        </div>
        <div className="flex flex-col items-end gap-1.5">
          <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
            {t('Customer {custNo}', { custNo: customer?.custNo ?? '' })}
          </span>
          {/* lblMainCategoryDesc / lblSubCategoryDesc, which Form_Load sets
              from the customer being viewed (frmDocuments.frm:296-297) — not
              a fixed "Individual — Saudi National". */}
          {(mainCategory || subCategory) && (
            <p className="text-xs text-muted">
              <span className="font-medium text-ink-soft">{t('Category')}</span> {mainCategory}
              {subCategory ? ` · ${subCategory}` : ''}
            </p>
          )}
        </div>
      </div>

      <HistoryBanner asOf={historyAsOf} />

      <SectionCard title="Documents for Sub Category">
        <div className="flex flex-col items-stretch gap-4 sm:flex-row sm:items-center">
          <DocList
            title="Documents List for Sub Category"
            items={documents.required.map(docLabel)}
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
                title={t('Marking documents submitted is a create-time action, not part of this enquiry')}
                className="cursor-not-allowed rounded-lg border border-edge bg-surface-muted px-3 py-2 text-sm font-semibold text-muted-soft shadow-xs"
              >
                {t(glyph)}
              </button>
            ))}
          </div>

          <DocList
            title="Documents Submitted"
            items={submitted.map(docLabel)}
            emptyText="No documents recorded as submitted for this customer."
          />
        </div>

        {extra.length > 0 && (
          <p className="mt-3 text-xs text-muted">
            <span className="font-medium text-ink-soft">{t('Also on record:')}</span>{' '}
            {extra.map(docLabel).join(', ')} — submitted but not in this sub-category's list.
          </p>
        )}

        <div className="mt-5 border-t border-edge-soft pt-4">
          <Field label="Others" htmlFor="others">
            <ReadOnlyInput
              id="others"
              value={documents.other}
              placeholder={t('None recorded')}
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
          {t('Return')}
        </button>
      </div>
    </main>
  )
}
