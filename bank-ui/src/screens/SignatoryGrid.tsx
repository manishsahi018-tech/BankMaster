import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import type { Account } from '../types.ts'
import { codeLabel } from '../codes.ts'

// Mirrors legacy frmJuristicSignatory.frm — stsigntab rows (QUERY-SPECS §20).

const COLUMNS: GridColumn[] = [
  { key: 'signatoryNo', label: 'Signatory No' },
  { key: 'signatoryShortName', label: 'Name' },
  { key: 'idType', label: 'Id Type', render: (v) => codeLabel('idType', v) },
  { key: 'idNo', label: 'Id Number' },
  { key: 'branchCode', label: 'Branch' },
]

export default function SignatoryGrid({
  account,
  rows,
  onDetail,
  hasMore = false,
  onMore,
  onExit,
}: {
  account: Account
  rows: GridRow[]
  onDetail: (row: GridRow) => void
  hasMore?: boolean
  onMore?: () => void
  onExit: () => void
}) {
  return (
    <GridScreen
      kicker="Account"
      title="Signatory Details"
      header={[{ label: 'Account No', value: account.accountNumber }]}
      columns={COLUMNS}
      rows={rows}
      emptyText="No signatories for this account."
      buttonGroups={[
        [
          {
            label: 'Enquiry',
            kind: 'primary',
            onClick: ({ row, notify }) => {
              if (!row) {
                notify('warn', 'Empty row selected — please select a signatory.')
                return
              }
              onDetail(row)
            },
          },
          {
            label: 'More',
            onClick: ({ notify }) => {
              if (hasMore && onMore) onMore()
              else notify('warn', 'No more match found.')
            },
          },
          { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
        ],
      ]}
    />
  )
}
