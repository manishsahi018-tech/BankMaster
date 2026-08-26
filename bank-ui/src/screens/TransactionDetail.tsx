import DetailScreen from '../components/DetailScreen.tsx'
import type { GridRow } from '../components/GridScreen.tsx'
import { codeLabel, useCodes } from '../codes.ts'
import { t } from '../i18n/index.ts'
import { formatAmount, formatDate } from '../schema/helpers.ts'

// Mirrors legacy frmBMTransDetails.frm — thd0data recType-0 header plus
// recType-1 narratives (QUERY-SPECS §18).
//
// Title and field labels are the RUNTIME captions (frmBmTransDetailCaption,
// applied in frmBMTransDetails.frm:503-517), which differ from the .frm's
// design-time ones: the table says "Trans.Date" and "Trans.Amount" where the
// form was laid out with "Trans Date" and "Trans Amount", and names the window
// "Bankmaster Transaction Detail".

/**
 * Statement flag, code-with-description as the legacy's stmtflagInfo lookup
 * rendered it (globalFunctions.bas:8734).
 *
 * The reference set enumerates only 0 and 1 — the two values thd0data.ts
 * documents. cbswift.c:1902 treats anything ABOVE '1' as a reversal, which is
 * what the enquiry's RR filter selects, but nothing in the schema or the C
 * names those values individually. So they resolve to a bare code, and the
 * reversal meaning is added here from the rule that IS attested rather than
 * being guessed at in the code set.
 */
function stmtFlagLabel(value: unknown): string {
  const code = String(value ?? '').trim()
  if (!code) return ''
  const label = codeLabel('stmtFlag', code)
  return code > '1' ? `${label} (${t('reversal')})` : label
}

export default function TransactionDetail({ detail, onReturn }: { detail: GridRow; onReturn: () => void }) {
  useCodes()
  return (
    <DetailScreen
      kicker="Account"
      title="Bankmaster Transaction Detail"
      chips={[
        { label: 'Account Number', value: detail.accNo },
        { label: 'Reference No.', value: detail.transRef },
        { label: 'Customer Name', value: detail.custName },
      ]}
      sections={[
        {
          title: 'Transaction',
          fields: [
            { label: 'Trans.Date', value: formatDate(detail.postDate) },
            { label: 'Value Date', value: formatDate(detail.valueDate) },
            { label: 'Trans.Amount', value: formatAmount(detail.transAmt) },
            { label: 'Transaction Type', value: codeLabel('bmTransType', detail.transType) },
            { label: 'User Id', value: detail.userId },
            { label: 'Supervisor Id', value: detail.supervisorId },
            { label: 'Statement Flag', value: stmtFlagLabel(detail.stmtFlag) },
          ],
        },
        {
          title: 'Narratives',
          fields: [
            { label: 'Narrative 1', value: detail.narrative1, wide: true },
            { label: 'Narrative 2', value: detail.narrative2, wide: true },
            { label: 'Narrative 3', value: detail.narrative3, wide: true },
          ],
        },
      ]}
      buttons={[{ label: 'Return', kind: 'primary', onClick: onReturn }]}
    />
  )
}
