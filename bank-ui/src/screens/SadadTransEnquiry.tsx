import { useState } from 'react'
import GridScreen from '../components/GridScreen.tsx'
import type { GridColumn, GridRow } from '../components/GridScreen.tsx'
import { useToast } from '../components/Toast.tsx'
import { DatePicker } from '../components/DatePicker.tsx'
import { Field, TextInput } from '../components/fields.tsx'
import { api } from '../api.ts'
import { formatAmount, formatTimestamp } from '../schema/helpers.ts'

import { t } from '../i18n/index.ts'
// Mirrors legacy frmSadadTransEnq.frm ("SADAD Transaction enquiry"), reached in
// the legacy through frmSadadMain from the customer search screen — which is why
// it hangs off Customer Service here.
//
// NOT frmBillEnquiry. That form ("Utility Bill Enquiry", Get Bill Details) asks
// the SADAD network for a bill's LIVE status over Tuxedo (UTBLENQ/SADBILLENQ);
// no archival view carries it, so it cannot be ported — see the note on
// JdbcSadadRepository. This screen is the history of payments the branch made,
// which stsadadlog does carry.
//
// The four criteria are the form's own, and the server preserves the legacy's
// key semantics (cbsadad.c:1654-1658): the subscription number narrows only
// when a company id is given, and an all-blank enquiry returns nothing rather
// than the whole file.

const COLUMNS: GridColumn[] = [
  { key: 'transDateTime', label: 'Trans. Date', render: formatTimestamp },
  { key: 'branchCode', label: 'Branch Code' },
  { key: 'tellerId', label: 'Teller Id' },
  { key: 'companyId', label: 'Company Id' },
  { key: 'subscriptionNo', label: 'Subs. Number' },
  { key: 'drAccNo', label: 'Debit A/c #' },
  { key: 'billAmt', label: 'Bill Amount', align: 'right', render: formatAmount },
  { key: 'transRefNo', label: 'Trans. Ref. No.' },
  { key: 'valueDate', label: 'Value Date' },
  { key: 'paymentType', label: 'Payment Type' },
  { key: 'postingStatus', label: 'Posting Status' },
  { key: 'supervisorId', label: 'Supervisor Id' },
]

export default function SadadTransEnquiry({ onExit }: { onExit: () => void }) {
  const [companyId, setCompanyId] = useState('')
  const [subscriptionNo, setSubscriptionNo] = useState('')
  const [tellerId, setTellerId] = useState('')
  const [transDate, setTransDate] = useState('')
  const [rows, setRows] = useState<GridRow[] | null>(null)
  const [page, setPage] = useState(0)
  const [hasMore, setHasMore] = useState(false)
  const [fetching, setFetching] = useState(false)
  const toast = useToast()

  const params = () => ({ companyId, subscriptionNo, tellerId, transDate })

  const fetchPage = (next: number, append: boolean) => {
    setFetching(true)
    api
      .sadadTransactions(params(), next)
      .then((r) => {
        setRows((prev) => (append ? [...(prev ?? []), ...r.rows] : r.rows))
        setPage(next)
        setHasMore(r.hasMore)
        if (!append && r.rows.length === 0) {
          toast.warn('No SADAD transactions match this enquiry.')
        }
      })
      .catch((e: unknown) => toast.error(e instanceof Error ? e.message : String(e)))
      .finally(() => setFetching(false))
  }

  // cmdGo_Click. The legacy leaves the server to decide an empty request; the
  // message below saves the round trip and says which fields it wants.
  const onGo = () => {
    if (!companyId.trim() && !tellerId.trim() && !transDate.trim()) {
      toast.warn('Enter a utility company, teller id or transaction date to search on.')
      return
    }
    fetchPage(0, false)
  }

  return (
    <div>
      <div className="mx-auto max-w-7xl px-4 pt-8 sm:px-6">
        <div className="flex flex-wrap items-end gap-4 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <Field label="Utility Company Id" htmlFor="sadadCompany">
            <TextInput
              id="sadadCompany"
              maxLength={10}
              value={companyId}
              onChange={(e) => setCompanyId(e.target.value)}
              className="w-40"
            />
          </Field>
          <Field label="Subscription Number" htmlFor="sadadSubs">
            <TextInput
              id="sadadSubs"
              maxLength={20}
              value={subscriptionNo}
              onChange={(e) => setSubscriptionNo(e.target.value)}
              className="w-48"
              // The server ignores it without a company id; say so rather than
              // silently dropping the filter.
              title="Narrows the search only when a utility company id is given"
            />
          </Field>
          <Field label="Teller Id" htmlFor="sadadTeller">
            <TextInput
              id="sadadTeller"
              maxLength={10}
              value={tellerId}
              onChange={(e) => setTellerId(e.target.value)}
              className="w-36"
            />
          </Field>
          <Field label="Transaction Date" htmlFor="sadadDate">
            <DatePicker id="sadadDate" value={transDate} onChange={setTransDate} className="w-40" />
          </Field>
          <button
            type="button"
            onClick={onGo}
            disabled={fetching}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong disabled:cursor-not-allowed disabled:bg-faint"
          >
            {fetching ? t('Fetching…') : t('Go')}
          </button>
        </div>
      </div>

      <GridScreen
        kicker="Customer Service"
        title="SADAD Transaction Enquiry"
        columns={COLUMNS}
        rows={rows ?? []}
        emptyText={rows === null ? 'Enter a search and press Go.' : 'No transactions found.'}
        hasMore={hasMore}
        onMore={() => {
          if (!hasMore || fetching) return
          fetchPage(page + 1, true)
        }}
        minWidth="min-w-[1100px]"
        buttonGroups={[
          [
            { label: 'Refresh', onClick: () => fetchPage(0, false) },
            { label: 'Exit', kind: 'danger', alignEnd: true, onClick: () => onExit() },
          ],
        ]}
      />
    </div>
  )
}
