import { SectionCard } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import type { Customer } from '../types.ts'
import { codeLabel } from '../codes.ts'
import { btnKinds, PrevPageButton } from '../components/legacyForm.tsx'
import { AccountFacilities, AccountHolding, CardAndDelivery } from './profilePageFields.tsx'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmIndividualOthersAcctInfo.frm ("Account Details-Other
// Individuals", headed "Individuals Other Customer details - Page 3") as a
// READ-ONLY enquiry. It is the THIRD page of the Others profile, reached from
// IndividualOthersPage2 — frmIndividualOthers2.frm:2473-2493 — not the second;
// the port used to jump here straight from page 1.
//
// This form is NOT the Others equivalent of frmIndividualSaudiAcctInfo's
// content. Its control set is a strict SUBSET of the Saudi form's (45 of 76,
// nothing unique), and none of the 31 the Saudi form adds — education,
// profession, income, employer, segmentation, memos, relationship manager — are
// here. On the Others profile those live one page earlier, on
// frmIndividualOthers2 (IndividualOthersPage2), which is exactly why that page
// had to exist rather than being folded into this one.
//
// What this form holds is four frames: the accounts block, single/joint holding
// with signature nature, the card request and its delivery address — every one
// of them shared with the Saudi page 2, so all four are built from
// profilePageFields rather than restated here. The accounts block is genuine
// enquiry data: getAcctInfo reads it BACK from the account log
// (cbothers.c:7183-7306), and frmJuristicAccountInfo renders the same fields the
// same way. The card frame is not; see CardAndDelivery.

export default function IndividualOthersAcctInfo({
  customer,
  acctInfo,
  historyAsOf,
  onPrevPage,
  onDocuments,
  onCancel,
}: {
  customer: Customer | null
  acctInfo: Record<string, string>
  historyAsOf?: string
  onPrevPage: () => void
  onDocuments: () => void
  onCancel: () => void
}) {
  const a = acctInfo
  const mainCategory = codeLabel('samaMainCategory', customer?.mainCategoryCode)
  const subCategory = codeLabel('samaSubCategory', customer?.subCategoryCode)

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {t('Individual — Other Nationality')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">{t('Account Details')}</h1>
          <p className="mt-1 text-sm text-muted">
            {t('Page 3 of 3 — account facilities, signature and card request.')}
          </p>
        </div>
        <div className="flex flex-col items-end gap-1.5">
          <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
            {t('Customer {custNo}', { custNo: customer?.custNo ?? '' })}
          </span>
          {(mainCategory || subCategory) && (
            <p className="text-xs text-muted">
              <span className="font-medium text-ink-soft">{t('Category')}</span> {mainCategory}
              {subCategory ? ` · ${subCategory}` : ''}
            </p>
          )}
        </div>
      </div>

      <HistoryBanner asOf={historyAsOf} />

      <div className="grid gap-5">
        <SectionCard title="Accounts to Open">
          <AccountFacilities a={a} />
          <div className="mt-5 border-t border-edge-soft pt-4">
            <AccountHolding a={a} />
          </div>
        </SectionCard>

        <CardAndDelivery />

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <PrevPageButton onClick={onPrevPage} />
          <button type="button" onClick={onDocuments} className={btnKinds.secondary}>
            {t('Documents')}
          </button>
          <button type="button" onClick={onCancel} className={`${btnKinds.danger} ms-auto`}>
            {t('Cancel')}
          </button>
        </div>
      </div>
    </main>
  )
}
