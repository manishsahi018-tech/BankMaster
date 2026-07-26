import { useState } from 'react'
import type { Account, Customer, SearchCriteria } from './types.ts'
import type { GridRow } from './components/GridScreen.tsx'
import { api } from './api.ts'
import type { BlockedAmountBreakup as Breakup, CardSearchResult } from './api.ts'
import TopNav from './components/TopNav.tsx'
import Login from './screens/Login.tsx'
import { signOut } from './session.ts'
import CustomerStaticData from './screens/CustomerStaticData.tsx'
import EnquirySelect from './screens/EnquirySelect.tsx'
import IndividualSaudi from './screens/IndividualSaudi.tsx'
import IndividualSaudiAcctInfo from './screens/IndividualSaudiAcctInfo.tsx'
import EssentialDocuments from './screens/EssentialDocuments.tsx'
import AccountInfo from './screens/AccountInfo.tsx'
import AccountMaintenance from './screens/AccountMaintenance.tsx'
import CustUpdateHistory from './screens/CustUpdateHistory.tsx'
import AcctUpdateHistory from './screens/AcctUpdateHistory.tsx'
import ChequeBookGrid from './screens/ChequeBookGrid.tsx'
import StandingOrderGrid from './screens/StandingOrderGrid.tsx'
import StopChequeGrid from './screens/StopChequeGrid.tsx'
import SamaStatusHistory from './screens/SamaStatusHistory.tsx'
import AcctStatusHistory from './screens/AcctStatusHistory.tsx'
import StopChequeDetail from './screens/StopChequeDetail.tsx'
import StandingOrderDetail from './screens/StandingOrderDetail.tsx'
import ChequeBookHistory from './screens/ChequeBookHistory.tsx'
import BlockedAmountBreakup from './screens/BlockedAmountBreakup.tsx'
import TransactionEnquiry from './screens/TransactionEnquiry.tsx'
import TransferEnquiry from './screens/TransferEnquiry.tsx'
import CardGrid from './screens/CardGrid.tsx'
import CardDetail from './screens/CardDetail.tsx'
import CardUpdateHistory from './screens/CardUpdateHistory.tsx'
import CardHistory from './screens/CardHistory.tsx'
import SignatoryGrid from './screens/SignatoryGrid.tsx'
import SignatoryDetail from './screens/SignatoryDetail.tsx'
import JuristicMain from './screens/JuristicMain.tsx'
import JuristicAccountInfo from './screens/JuristicAccountInfo.tsx'
import IndividualOthers from './screens/IndividualOthers.tsx'
import HeirsProxy from './screens/HeirsProxy.tsx'
import JointHolders from './screens/JointHolders.tsx'
import References from './screens/References.tsx'
import Owners from './screens/Owners.tsx'

interface ScreenState {
  name: string
  customer?: Customer
  account?: Account
  criteria?: SearchCriteria
  from?: string
  /** customer search results (EnquirySelect) */
  searchRows?: Customer[]
  /** account grid rows (AccountInfo) */
  accountRows?: Account[]
  /** rows for the current archival grid screen */
  gridRows?: GridRow[]
  /** payload for the current detail screen */
  detail?: GridRow
  /** blocked-amount breakup payload */
  breakup?: Breakup
  /** card grid payload (rows + DB #2 customer header) */
  cardsResult?: CardSearchResult
  /** card number for the card history screens */
  card?: string
  /** screen to return to from the card grid */
  cardsFrom?: string
  /** stcusttab profile for the tier-2 customer detail screens */
  profile?: GridRow
  /** screen to return to from a related-party grid */
  partyFrom?: string
  /** server-side pagination cursor for the current paged grid */
  page?: number
  hasMore?: boolean
  /** set when showing a stcustlog/stacclog snapshot (legacy history mode) */
  historyAsOf?: string
  /** stacclog maintenance-field overrides for the account history snapshot */
  snapshot?: Record<string, string>
  /** juristic page 2 data (frmJuristicAccountInfo) */
  juristicInfo?: GridRow
}

export default function App() {
  const [screen, setScreen] = useState<ScreenState>({ name: 'login' })
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  // Customer context carried between screens, like the legacy globals.
  const customer: Customer | null = screen.customer
    ? { ...screen.customer, name: screen.customer.shortName || screen.customer.custNo }
    : null

  const go = (name: string, extra: Partial<ScreenState> = {}) =>
    setScreen((s) => ({ ...s, ...extra, name }))

  // Appends the next 10-row page to a paged grid (legacy "More" button).
  const appendPage = (
    key: 'searchRows' | 'gridRows',
    fetcher: (page: number) => Promise<{ rows: unknown[]; hasMore: boolean }>,
  ) => () => {
    const nextPage = (screen.page ?? 0) + 1
    setBusy(true)
    setError(null)
    fetcher(nextPage)
      .then((r) =>
        setScreen(
          (s) =>
            ({
              ...s,
              [key]: [...((s[key] as unknown[] | undefined) ?? []), ...r.rows],
              page: nextPage,
              hasMore: r.hasMore,
            }) as ScreenState,
        ),
      )
      .catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))
      .finally(() => setBusy(false))
  }

  // Fetch-then-navigate: the current screen stays up while the API call runs;
  // failures surface in the banner below the nav instead of navigating.
  const goFetch = (
    name: string,
    extra: Partial<ScreenState>,
    fetcher: () => Promise<Partial<ScreenState>>,
  ) => {
    setBusy(true)
    setError(null)
    fetcher()
      .then((data) => setScreen((s) => ({ ...s, ...extra, ...data, name })))
      .catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))
      .finally(() => setBusy(false))
  }

  // Legacy frmLogin is the startup form; everything else renders after it.
  if (screen.name === 'login') {
    return <Login onLogin={() => setScreen({ name: 'search' })} />
  }

  return (
    <div className="relative min-h-screen bg-page font-sans text-ink">
      <TopNav
        onSignOut={() => {
          signOut()
          setScreen({ name: 'login' })
        }}
      />
      {/* Subtle accent glow under the header; follows the selected theme. */}
      <div className="pointer-events-none absolute inset-x-0 top-16 h-64 bg-gradient-to-b from-primary-soft/70 to-transparent" />
      <div className="relative">

      {(busy || error) && (
        <div className="mx-auto max-w-7xl px-4 pt-4 sm:px-6">
          {busy && (
            <div className="rounded-xl border border-primary/30 bg-primary-soft px-4 py-2.5 text-sm text-primary-ink">
              Fetching from server…
            </div>
          )}
          {error && (
            <div className="rounded-xl border border-danger/30 bg-danger-soft px-4 py-2.5 text-sm text-danger">
              {error}
            </div>
          )}
        </div>
      )}

      {screen.name === 'search' && (
        <CustomerStaticData
          onSearch={(criteria) =>
            goFetch('results', { criteria }, async () => {
              const r = await api.searchCustomers(criteria.params)
              return { searchRows: r.rows, page: 0, hasMore: r.hasMore }
            })
          }
          onCards={(params) =>
            goFetch('cards', { cardsFrom: 'search' }, async () => ({
              cardsResult: await api.searchCards(params),
            }))
          }
          onAccounts={(custNo, cardNo) => {
            if (!custNo && !cardNo) {
              setError('Enter a customer no, account no or card number first.')
              return
            }
            // Legacy opcode 21 resolves the customer and their accounts in
            // one call; here it is a customer lookup plus the account grid.
            // A card number resolves to the customer first (legacy: card
            // read → custNo from bmAccNo digits 6-12), then the same flow.
            goFetch('accounts', { from: 'search' }, async () => {
              const padded = custNo
                ? custNo.padStart(7, '0')
                : (await api.searchCards({ cardNo: cardNo! })).custNo.padStart(7, '0')
              const [cust, accts] = await Promise.all([
                api.searchCustomers({ custNo: padded }),
                api.accounts(padded),
              ])
              return { customer: cust.rows[0], accountRows: accts.rows }
            })
          }}
        />
      )}

      {screen.name === 'results' && screen.criteria && (
        <EnquirySelect
          criteria={screen.criteria}
          rows={screen.searchRows ?? []}
          hasMore={screen.hasMore ?? false}
          onMore={appendPage('searchRows', (p) => api.searchCustomers(screen.criteria!.params, p))}
          onBack={() => setScreen({ name: 'search' })}
          onEnquiry={(row) => {
            // loadCorrespondingForm: main category 01 = individual (Saudi
            // nationals with idType 'I' open the editable Saudi profile,
            // others the read-only Others profile); anything else = juristic.
            if (row.mainCategoryCode !== '01') {
              goFetch('juristic', { customer: row, historyAsOf: undefined }, async () => ({
                profile: await api.customerProfile(row.custNo),
              }))
            } else if (row.idType === 'I') {
              go('detail', { customer: row, historyAsOf: undefined })
            } else {
              goFetch('individualOthers', { customer: row, historyAsOf: undefined }, async () => ({
                profile: await api.customerProfile(row.custNo),
              }))
            }
          }}
          onHistory={(row) =>
            goFetch('custHistory', { customer: row }, async () => {
              const r = await api.custUpdateHistory(row.custNo)
              return { gridRows: r.rows, page: 0, hasMore: r.hasMore }
            })
          }
        />
      )}

      {screen.name === 'detail' && (
        <IndividualSaudi
          customer={customer}
          historyAsOf={screen.historyAsOf}
          onNextPage={() => go('detail2')}
          onAccounts={() =>
            goFetch('accounts', { from: 'detail' }, async () => ({
              accountRows: (await api.accounts(customer!.custNo)).rows,
            }))
          }
          onCards={() =>
            goFetch('cards', { cardsFrom: 'detail' }, async () => ({
              cardsResult: await api.searchCards({ custNo: customer!.custNo }),
            }))
          }
          onHeirs={() =>
            goFetch('heirs', { partyFrom: 'detail' }, async () => ({
              gridRows: (await api.heirs(customer!.custNo)).rows,
            }))
          }
          onReferences={() =>
            goFetch('references', { partyFrom: 'detail' }, async () => ({
              gridRows: (await api.references(customer!.custNo)).rows,
            }))
          }
          onJointHolders={() =>
            goFetch('jointHolders', { partyFrom: 'detail' }, async () => ({
              gridRows: (await api.jointHolders(customer!.custNo)).rows,
            }))
          }
          onBack={() => setScreen({ name: 'search' })}
        />
      )}

      {screen.name === 'juristic' && screen.profile && (
        <JuristicMain
          profile={screen.profile}
          historyAsOf={screen.historyAsOf}
          onNextPage={() =>
            goFetch('juristic2', {}, async () => ({
              juristicInfo: await api.juristicAccountInfo(customer!.custNo),
            }))
          }
          onAccounts={() =>
            goFetch('accounts', { from: 'juristic' }, async () => ({
              accountRows: (await api.accounts(customer!.custNo)).rows,
            }))
          }
          onOwners={() =>
            goFetch('owners', { partyFrom: 'juristic' }, async () => ({
              gridRows: (await api.owners(customer!.custNo)).rows,
            }))
          }
          onReferences={() =>
            goFetch('references', { partyFrom: 'juristic' }, async () => ({
              gridRows: (await api.references(customer!.custNo)).rows,
            }))
          }
          onBack={() => go('results')}
        />
      )}

      {screen.name === 'juristic2' && screen.profile && screen.juristicInfo && (
        <JuristicAccountInfo
          profile={screen.profile}
          info={screen.juristicInfo}
          onPrevPage={() => go('juristic')}
        />
      )}

      {screen.name === 'individualOthers' && screen.profile && (
        <IndividualOthers
          profile={screen.profile}
          historyAsOf={screen.historyAsOf}
          onAccounts={() =>
            goFetch('accounts', { from: 'individualOthers' }, async () => ({
              accountRows: (await api.accounts(customer!.custNo)).rows,
            }))
          }
          onHeirs={() =>
            goFetch('heirs', { partyFrom: 'individualOthers' }, async () => ({
              gridRows: (await api.heirs(customer!.custNo)).rows,
            }))
          }
          onReferences={() =>
            goFetch('references', { partyFrom: 'individualOthers' }, async () => ({
              gridRows: (await api.references(customer!.custNo)).rows,
            }))
          }
          onJointHolders={() =>
            goFetch('jointHolders', { partyFrom: 'individualOthers' }, async () => ({
              gridRows: (await api.jointHolders(customer!.custNo)).rows,
            }))
          }
          onBack={() => go('results')}
        />
      )}

      {screen.name === 'heirs' && customer && (
        <HeirsProxy customer={customer} rows={screen.gridRows ?? []} onExit={() => go(screen.partyFrom ?? 'detail')} />
      )}

      {screen.name === 'jointHolders' && customer && (
        <JointHolders customer={customer} rows={screen.gridRows ?? []} onExit={() => go(screen.partyFrom ?? 'detail')} />
      )}

      {screen.name === 'references' && customer && (
        <References customer={customer} rows={screen.gridRows ?? []} onExit={() => go(screen.partyFrom ?? 'detail')} />
      )}

      {screen.name === 'owners' && customer && (
        <Owners customer={customer} rows={screen.gridRows ?? []} onExit={() => go(screen.partyFrom ?? 'juristic')} />
      )}

      {screen.name === 'detail2' && (
        <IndividualSaudiAcctInfo
          customer={customer}
          onPrevPage={() => go('detail')}
          onDocuments={() => go('documents')}
          onCancel={() => setScreen({ name: 'search' })}
        />
      )}

      {screen.name === 'documents' && (
        <EssentialDocuments
          customer={customer}
          onOk={() => go('detail2')}
          onExit={() => go('detail2')}
        />
      )}

      {screen.name === 'custHistory' && customer && (
        <CustUpdateHistory
          customer={{ custNo: customer.custNo, name: customer.name, branchCode: customer.branchCode }}
          rows={screen.gridRows ?? []}
          hasMore={screen.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.custUpdateHistory(customer.custNo, p))}
          onViewDetail={(row) => {
            // Legacy getCustDetails: fetch the stcustlog snapshot for the
            // row's timestamp and open the matching profile form read-only
            // (loadCorrespondingForm routing, history mode).
            const dt = String(row.dateTime)
            if (customer.mainCategoryCode !== '01') {
              goFetch('juristic', { historyAsOf: dt }, async () => ({
                profile: await api.customerProfileAsOf(customer.custNo, dt),
              }))
            } else if (customer.idType === 'I') {
              go('detail', { historyAsOf: dt })
            } else {
              goFetch('individualOthers', { historyAsOf: dt }, async () => ({
                profile: await api.customerProfileAsOf(customer.custNo, dt),
              }))
            }
          }}
          onExit={() => go('results')}
        />
      )}

      {screen.name === 'accounts' && customer && (
        <AccountInfo
          customer={customer}
          rows={screen.accountRows ?? []}
          onEnquiry={(account) => go('accountDetail', { account, historyAsOf: undefined, snapshot: undefined })}
          onChequeBook={(account) =>
            goFetch('chequeBooks', { account }, async () => ({
              gridRows: await api.chequeBookRequests(account.accountNumber),
            }))
          }
          onStandingOrder={(account) =>
            goFetch('standingOrders', { account }, async () => ({
              gridRows: await api.standingOrders(account.accountNumber),
            }))
          }
          onStopCheque={(account) =>
            goFetch('stopCheques', { account }, async () => ({
              gridRows: await api.stopCheques(account.accountNumber),
            }))
          }
          onUpdateHistory={(account) =>
            goFetch('acctHistory', { account }, async () => {
              const r = await api.acctUpdateHistory(account.accountNumber)
              return { gridRows: r.rows, page: 0, hasMore: r.hasMore }
            })
          }
          onBlockedBreakup={(account) =>
            goFetch('blockedBreakup', { account }, async () => ({
              breakup: await api.blockedAmountBreakup(account.accountNumber),
            }))
          }
          onTransactions={(account) => go('transactions', { account })}
          onTransfers={(account) => go('transfers', { account })}
          onExit={() => go(screen.from ?? 'detail')}
        />
      )}

      {screen.name === 'accountDetail' && (
        <AccountMaintenance
          account={
            screen.historyAsOf
              ? { ...screen.account!, maintenance: { ...screen.account!.maintenance, ...screen.snapshot } }
              : screen.account!
          }
          historyAsOf={screen.historyAsOf}
          onSamaHistory={() =>
            goFetch('samaHistory', {}, async () => ({
              gridRows: await api.samaStatusHistory(screen.account!.accountNumber),
            }))
          }
          onStatusHistory={() =>
            goFetch('statusHistory', {}, async () => ({
              gridRows: await api.acctStatusHistory(screen.account!.accountNumber),
            }))
          }
          onCustomerInfo={() => go('detail')}
          onCancel={() => go('accounts')}
          onSignatories={() =>
            goFetch('signatories', {}, async () => ({
              gridRows: (await api.signatoriesByAccount(screen.account!.accountNumber)).rows,
            }))
          }
          onCards={() =>
            goFetch('cards', { cardsFrom: 'accountDetail' }, async () => ({
              cardsResult: await api.searchCards({ accNo: screen.account!.accountNumber }),
            }))
          }
        />
      )}

      {screen.name === 'acctHistory' && customer && (
        <AcctUpdateHistory
          account={screen.account!}
          customer={customer}
          rows={screen.gridRows ?? []}
          hasMore={screen.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.acctUpdateHistory(screen.account!.accountNumber, p))}
          onViewDetail={(row) =>
            // Legacy getAcctDetails: stacclog snapshot → frmAccount in
            // history mode (service 33 requestType 01).
            goFetch('accountDetail', { historyAsOf: String(row.dateTime) }, async () => ({
              snapshot: await api.accountSnapshot(screen.account!.accountNumber, String(row.dateTime)),
            }))
          }
          onExit={() => go('accounts')}
        />
      )}

      {screen.name === 'chequeBooks' && customer && (
        <ChequeBookGrid
          account={screen.account!}
          customer={customer}
          rows={screen.gridRows ?? []}
          onHistory={(row) =>
            goFetch('chequeBookHistory', {}, async () => ({
              detail: await api.chequeBookHistory(screen.account!.accountNumber, String(row.reqDate)),
            }))
          }
          onExit={() => go('accounts')}
        />
      )}

      {screen.name === 'standingOrders' && customer && (
        <StandingOrderGrid
          account={screen.account!}
          customer={customer}
          rows={screen.gridRows ?? []}
          onEnquiry={(row) =>
            goFetch('standingOrderDetail', {}, async () => ({
              detail: await api.standingOrderDetail(screen.account!.accountNumber, String(row.sodNo)),
            }))
          }
          onExit={() => go('accounts')}
        />
      )}

      {screen.name === 'stopCheques' && customer && (
        <StopChequeGrid
          account={screen.account!}
          customer={customer}
          rows={screen.gridRows ?? []}
          onEnquiry={(row) =>
            goFetch('stopChequeDetail', {}, async () => ({
              detail: await api.stopChequeDetail(screen.account!.accountNumber, String(row.chequeNo)),
            }))
          }
          onExit={() => go('accounts')}
        />
      )}

      {screen.name === 'stopChequeDetail' && screen.detail && (
        <StopChequeDetail detail={screen.detail} onReturn={() => go('stopCheques')} />
      )}

      {screen.name === 'standingOrderDetail' && screen.detail && (
        <StandingOrderDetail detail={screen.detail} onReturn={() => go('standingOrders')} />
      )}

      {screen.name === 'chequeBookHistory' && screen.detail && (
        <ChequeBookHistory detail={screen.detail} onReturn={() => go('chequeBooks')} />
      )}

      {screen.name === 'blockedBreakup' && screen.breakup && (
        <BlockedAmountBreakup breakup={screen.breakup} onReturn={() => go('accounts')} />
      )}

      {screen.name === 'transactions' && (
        <TransactionEnquiry account={screen.account!} onExit={() => go('accounts')} />
      )}

      {screen.name === 'transfers' && (
        <TransferEnquiry account={screen.account!} onExit={() => go('accounts')} />
      )}

      {screen.name === 'cards' && screen.cardsResult && (
        <CardGrid
          result={screen.cardsResult}
          onDetail={(row) =>
            goFetch('cardDetail', {}, async () => ({ detail: await api.cardDetail(String(row.cardNo)) }))
          }
          onHistory={(row) =>
            goFetch('cardHistory', { card: String(row.cardNo) }, async () => ({
              gridRows: await api.cardTrackingHistory(String(row.cardNo)),
            }))
          }
          onUpdateHistory={(row) =>
            goFetch('cardUpdateHistory', { card: String(row.cardNo) }, async () => {
              const r = await api.cardUpdateHistory(String(row.cardNo))
              return { gridRows: r.rows, page: 0, hasMore: r.hasMore }
            })
          }
          onExit={() => go(screen.cardsFrom ?? 'search')}
        />
      )}

      {screen.name === 'cardDetail' && screen.detail && (
        <CardDetail detail={screen.detail} onReturn={() => go('cards')} />
      )}

      {screen.name === 'cardHistory' && (
        <CardHistory cardNo={screen.card ?? ''} entries={screen.gridRows ?? []} onReturn={() => go('cards')} />
      )}

      {screen.name === 'cardUpdateHistory' && (
        <CardUpdateHistory
          cardNo={screen.card ?? ''}
          rows={screen.gridRows ?? []}
          hasMore={screen.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.cardUpdateHistory(screen.card ?? '', p))}
          onExit={() => go('cards')}
        />
      )}

      {screen.name === 'signatories' && (
        <SignatoryGrid
          account={screen.account!}
          rows={screen.gridRows ?? []}
          onDetail={(row) =>
            goFetch('signatoryDetail', {}, async () => ({
              detail: await api.signatoryDetail(screen.account!.accountNumber, String(row.signatoryNo)),
            }))
          }
          onExit={() => go('accountDetail')}
        />
      )}

      {screen.name === 'signatoryDetail' && screen.detail && (
        <SignatoryDetail detail={screen.detail} onReturn={() => go('signatories')} />
      )}

      {screen.name === 'samaHistory' && (
        <SamaStatusHistory
          account={screen.account!}
          rows={screen.gridRows ?? []}
          onReturn={() => go('accountDetail')}
        />
      )}

      {screen.name === 'statusHistory' && (
        <AcctStatusHistory
          account={screen.account!}
          rows={screen.gridRows ?? []}
          onReturn={() => go('accountDetail')}
        />
      )}
      </div>
    </div>
  )
}
