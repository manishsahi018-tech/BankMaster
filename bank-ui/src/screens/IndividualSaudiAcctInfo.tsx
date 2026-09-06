import { SectionCard } from '../components/fields.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import type { Customer } from '../types.ts'
import { codeLabel } from '../codes.ts'
import { btnKinds, PrevPageButton } from '../components/legacyForm.tsx'
import {
  AccountFacilities,
  AccountHolding,
  CardAndDelivery,
  EmploymentAndIncome,
  PackageFeesAndMemos,
} from './profilePageFields.tsx'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmIndividualSaudiAcctInfo.frm ("Individual Saudi Customer
// Account Details") — page 2 of the Individual Saudi profile — as a READ-ONLY
// enquiry, served by api.customerAcctInfo.
//
// This form is the WIDE one: 76 controls against frmIndividualOthersAcctInfo's
// 45. It carries the employment and income block, the package and fee flags,
// the three account facilities, single/joint holding with signature nature, and
// the card request — i.e. everything the Others profile splits across ITS pages
// 2 and 3 (frmIndividualOthers2 + frmIndividualOthersAcctInfo). That is why the
// Others profile needs a page this one does not.
//
// Built from the legacyForm primitives, like page 1 and every frame it shares
// with the Others pages (profilePageFields). It rendered as a DetailScreen —
// label-above value boxes with a chip header — which showed the data but not the
// FORM: the option pairs read as the words "Yes"/"No", the six ownership boxes
// as one joined sentence, and the account facilities as three separate cards.
//
// Not shown: the Home Country frame, which is Others-only (a Saudi national has
// no abroad address on this form), and the card fields — see CardAndDelivery.

export default function IndividualSaudiAcctInfo({
  customer,
  acctInfo,
  historyAsOf,
  onPrevPage,
  onJointAcc,
  onDocuments,
  onCancel,
}: {
  customer: Customer | null
  acctInfo: Record<string, string>
  historyAsOf?: string
  onPrevPage: () => void
  onJointAcc: () => void
  onDocuments: () => void
  onCancel: () => void
}) {
  const a = acctInfo
  const isJoint = a.singleJointAcc === '1'
  const mainCategory = codeLabel('samaMainCategory', customer?.mainCategoryCode)
  const subCategory = codeLabel('samaSubCategory', customer?.subCategoryCode)

  return (
    <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {t('Individual — Saudi National')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">{t('Account Details')}</h1>
          <p className="mt-1 text-sm text-muted">
            {t('Page 2 of 2 — employment, fees, account facilities and signature.')}
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
        <EmploymentAndIncome a={a} />
        <PackageFeesAndMemos a={a} />

        <SectionCard title="Accounts to Open">
          <AccountFacilities a={a} />
          <div className="mt-5 border-t border-edge-soft pt-4">
            <AccountHolding a={a} withGracePeriod />
          </div>
        </SectionCard>

        <CardAndDelivery />

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <PrevPageButton onClick={onPrevPage} />
          {/* cmdJointAcc, in its legacy slot between Prev Page and Documents
              (frmIndividualSaudiAcctInfo.frm: Left 765 / 7845 / 9060 across that button
              row). Always drawn, never hidden — the legacy only ever toggles
              Enabled, and it toggles it on exactly one thing, repeated in every
              mode branch (frmIndividualSaudiAcctInfo.frm:4489,4526):

                If optJoint.Value = True Then cmdJointAcc.Enabled = True _
                                         Else cmdJointAcc.Enabled = False

              optJoint is the Single / Joint A/c radio, i.e.
              stcusttab.singleJointAcc = '1' (0 single, 2 unidentified) — the
              same column AccountHolding draws above. The click handler's
              errNotAJointAccount MsgBox is the create/update guard and never
              runs under searchAction, so the Enabled rule is the whole story
              for an enquiry. */}
          <button
            type="button"
            onClick={isJoint ? onJointAcc : undefined}
            disabled={!isJoint}
            title={isJoint ? undefined : t('This account is not a joint account')}
            className={isJoint ? btnKinds.secondary : btnKinds.disabled}
          >
            {t('Joint Account')}
          </button>
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
