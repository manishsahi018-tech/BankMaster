import DetailScreen from '../components/DetailScreen.tsx'
import HistoryBanner from '../components/HistoryBanner.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { maskCardNo } from '../schema/helpers.ts'
import { codeLabel } from '../codes.ts'
import { Segmented } from '../components/legacyForm.tsx'

// Mirrors legacy frmCardDetails.frm — stcardtab point read (QUERY-SPECS §14).

export default function CardDetail({
  detail,
  historyAsOf,
  onReturn,
}: {
  detail: GridRow
  /** set when opened from Card Update History — the legacy's cardHistoryAction,
   *  which shows the record as one update left it and disables further drill-in
   *  (frmCardUpdateHistory.frm:376). */
  historyAsOf?: string
  onReturn: () => void
}) {
  return (
    <DetailScreen
      banner={<HistoryBanner asOf={historyAsOf} />}
      kicker="Cards"
      title="Card Maintenance"
      chips={[
        { label: 'Card Number', value: maskCardNo(String(detail.cardNo ?? '')) },
        { label: 'Customer #', value: detail.custNo },
        { label: 'Customer Name', value: detail.custName },
      ]}
      sections={[
        {
          title: 'Card',
          fields: [
            { label: 'Name on the Card', value: detail.nameOnTheCard, wide: true },
            { label: 'Card Type', value: codeLabel('cardType', detail.cardType) },
            { label: 'Request Status', value: codeLabel('cardRequestStatus', detail.requestStatus) },
            // Frame1 (optNew / optReplacement) — 'R' selects Replacement,
            // anything else New (globalFunctions.bas:9873). Our repository
            // spells the same bit 'N'/'U' (requestType '0' → initial card).
            {
              label: 'New or Replacement',
              node: (
                <Segmented
                  options={['New', 'Replacement']}
                  selected={detail.newOrUpdate === 'N' ? 0 : 1}
                />
              ),
            },
            { label: 'Delivery Branch', value: detail.deliveryBranchCode },
            // Two account numbers come down and only one was shown. They are
            // different keys — the card grid searches on a 14-digit BM number
            // or a 16-digit core one (JdbcCardRepository:94) — so both are
            // named rather than left as a bare "Account No".
            { label: 'Core Account No', value: detail.coreAccNo },
            { label: 'BM Account No', value: detail.bmAccNo },
            { label: 'Sequence No', value: detail.sequenceNo },
            // FrameCustType: a four-way OptionButton group, V/P/K/C
            // (globalFunctions.bas:9879-9888). This rendered the raw letter,
            // so a package customer read as "K".
            {
              label: 'Cust.category',
              node: (
                <Segmented
                  options={['VIP', 'Pension', 'Package', 'CPS']}
                  // custCategory is blank far more often than not — the 'P'
                  // half needs a DB #2 mapping that does not exist yet — and
                  // ''.indexOf would answer 0, lighting up VIP for everyone.
                  selected={detail.custCategory ? 'VPKC'.indexOf(String(detail.custCategory)) : -1}
                />
              ),
              wide: true,
            },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
