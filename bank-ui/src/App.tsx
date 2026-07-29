import { useEffect, useState } from 'react'
import type { Account, Customer, SearchCriteria } from './types.ts'
import type { GridRow } from './components/GridScreen.tsx'
import ProcessingOverlay from './components/ProcessingOverlay.tsx'
import { useToast } from './components/Toast.tsx'
import { api } from './api.ts'
import type { BlockedAmountBreakup as Breakup, CardSearchResult } from './api.ts'
import TopNav from './components/TopNav.tsx'
import Login from './screens/Login.tsx'
import { session, signOut } from './session.ts'
import { useCodes } from './codes.ts'
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
import MerchantStatement from './screens/MerchantStatement.tsx'

interface ScreenState {
  name: string
  customer?: Customer
  account?: Account
  criteria?: SearchCriteria
  from?: string
  /** customer search results (EnquirySelect) */
  searchRows?: Customer[]
  /** the scan was cut short — legacy incompleteFlag (cbbranch.c:1750) */
  searchIncomplete?: boolean
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
  /** card search params, kept so "More" can page the card grid */
  cardsQuery?: Record<string, string>
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
  /** individual page 2 attributes (frmIndividualSaudiAcctInfo) */
  acctInfo?: Record<string, string>
  /** required document codes for the customer's SAMA sub-category */
  documents?: string[]
}

export default function App() {
  // Restore the persisted session on refresh instead of forcing re-login.
  const [screen, setScreen] = useState<ScreenState>(
    session.loggedIn ? { name: 'search' } : { name: 'login' },
  )
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const toast = useToast()
  // /api/codes is loaded in the background; re-render here when it lands so
  // every screen below swaps its raw codes for "<code>-<description>" labels.
  useCodes()

  // Any error raised by the fetch helpers surfaces as a top-center toast that
  // hides itself after 7s (replaces the old inline banner). Clearing the state
  // immediately keeps a single error from re-toasting on later renders.
  useEffect(() => {
    if (error) {
      toast.error(error)
      setError(null)
    }
  }, [error, toast])

  // Customer context carried between screens, like the legacy globals.
  const customer: Customer | null = screen.customer
    ? { ...screen.customer, name: screen.customer.shortName || screen.customer.custNo }
    : null

  const go = (name: string, extra: Partial<ScreenState> = {}) =>
    setScreen((s) => ({ ...s, ...extra, name }))

  // Appends the next 10-row page to a paged grid (legacy "More" button).
  const appendPage = (
    key: 'searchRows' | 'gridRows' | 'accountRows',
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

  // "More" for the card grid: the payload is a CardSearchResult (header + rows),
  // not a plain array, so it appends the next page's rows onto the existing
  // result while keeping the header.
  const moreCards = () => {
    if (!screen.cardsResult?.hasMore || !screen.cardsQuery) return
    const nextPage = (screen.page ?? 0) + 1
    setBusy(true)
    setError(null)
    api
      .searchCards(screen.cardsQuery, nextPage)
      .then((r) =>
        setScreen((s) => ({
          ...s,
          cardsResult: s.cardsResult
            ? { ...s.cardsResult, rows: [...s.cardsResult.rows, ...r.rows], hasMore: r.hasMore }
            : r,
          page: nextPage,
        })),
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
        atHome={screen.name === 'search'}
        onHome={() => setScreen({ name: 'search' })}
        onSignOut={() => {
          signOut()
          setScreen({ name: 'login' })
        }}
      />
      {/* Subtle accent glow under the header; follows the selected theme. */}
      <div className="pointer-events-none absolute inset-x-0 top-16 h-64 bg-gradient-to-b from-primary-soft/70 to-transparent" />
      <div className="relative">

      {/* Blocking processing modal while a server call is in flight; errors are
          routed to the top-center toast (see the effect above). */}
      <ProcessingOverlay show={busy} label="Fetching from server…" />

      {screen.name === 'search' && (
        <CustomerStaticData
          onSearch={(criteria) =>
            goFetch('results', { criteria }, async () => {
              const r = await api.searchCustomers(criteria.params)
              return {
                searchRows: r.rows,
                page: 0,
                hasMore: r.hasMore,
                searchIncomplete: r.incomplete ?? false,
              }
            })
          }
          onCards={(params) =>
            goFetch('cards', { cardsFrom: 'search' }, async () => ({
              cardsResult: await api.searchCards(params),
              cardsQuery: params,
              page: 0,
            }))
          }
          // cmdMerchant opens frmMerchantStmt directly — no search or customer
          // context is carried across; the merchant number is keyed there.
          onMerchant={() => go('merchant')}
          onAccounts={(custNo, accNo, cardNo) => {
            if (!custNo && !accNo && !cardNo) {
              setError('Enter a customer no, account no or card number first.')
              return
            }
            // Legacy service 21 — processAccSearchRequest, cbbranch2.c:5626-5723.
            // Three branches, in the C's own priority order (custNo, then accNo,
            // then cardNo), each keyed differently.
            goFetch('accounts', { from: 'search' }, async () => {
              // The header customer: typed (:5630), the 7 chars embedded at
              // accNo[5..11] (:5653), or the card's owner (:5673+).
              const headerCustNo = custNo
                ? custNo.padStart(7, '0')
                : accNo
                  ? accNo.padEnd(14).slice(5, 12)
                  : (await api.searchCards({ cardNo: cardNo! })).custNo.padStart(7, '0')

              // checkCustNo gate (:5631-5643, :5654-5667): an unknown customer
              // is "Invalid Customer Number..Please Check" and FAILURE — the C
              // never opens the grid, and App's `customer &&` guard would
              // otherwise blank the page. A too-short account number lands here
              // too, exactly as it does in the C (accNo[5..11] = spaces).
              const cust = await api.searchCustomers({ custNo: headerCustNo })
              if (!cust.rows[0]) {
                throw new Error('Invalid Customer Number..Please Check')
              }

              // accNo  -> index 1 + isRead(ISEQUAL): THAT account only, and an
              //           unknown account is an empty grid, not an error (:5823).
              // custNo -> index 3 range scan over the customer's accounts
              //           (:5646-5648, loop :5900-5906).
              const accts = accNo
                ? await api.accountByNumber(accNo.trim())
                : await api.accounts(headerCustNo)

              return {
                customer: cust.rows[0],
                accountRows: accts.rows,
                hasMore: accts.hasMore,
                page: 0,
              }
            })
          }}
        />
      )}

      {screen.name === 'results' && screen.criteria && (
        <EnquirySelect
          criteria={screen.criteria}
          incomplete={screen.searchIncomplete ?? false}
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
              goFetch('detail', { customer: row, historyAsOf: undefined }, async () => ({
                profile: await api.customerProfile(row.custNo),
              }))
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

      {screen.name === 'detail' && screen.profile && (
        <IndividualSaudi
          profile={screen.profile}
          historyAsOf={screen.historyAsOf}
          onNextPage={() =>
            goFetch('detail2', {}, async () => ({
              acctInfo: await api.customerAcctInfo(customer!.custNo),
            }))
          }
          onAccounts={() =>
            goFetch('accounts', { from: 'detail' }, async () => {
              const _r = await api.accounts(customer!.custNo)
              return { accountRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onCards={() =>
            goFetch('cards', { cardsFrom: 'detail' }, async () => ({
              cardsResult: await api.searchCards({ custNo: customer!.custNo }),
              cardsQuery: { custNo: customer!.custNo },
              page: 0,
            }))
          }
          onHeirs={() =>
            goFetch('heirs', { partyFrom: 'detail' }, async () => {
              const _r = await api.heirs(customer!.custNo)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onReferences={() =>
            goFetch('references', { partyFrom: 'detail' }, async () => {
              const _r = await api.references(customer!.custNo)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onJointHolders={() =>
            goFetch('jointHolders', { partyFrom: 'detail' }, async () => {
              const _r = await api.jointHolders(customer!.custNo)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
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
            goFetch('accounts', { from: 'juristic' }, async () => {
              const _r = await api.accounts(customer!.custNo)
              return { accountRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onOwners={() =>
            goFetch('owners', { partyFrom: 'juristic' }, async () => {
              const _r = await api.owners(customer!.custNo)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onReferences={() =>
            goFetch('references', { partyFrom: 'juristic' }, async () => {
              const _r = await api.references(customer!.custNo)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
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
            goFetch('accounts', { from: 'individualOthers' }, async () => {
              const _r = await api.accounts(customer!.custNo)
              return { accountRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onCards={() =>
            goFetch('cards', { cardsFrom: 'individualOthers' }, async () => ({
              cardsResult: await api.searchCards({ custNo: customer!.custNo }),
              cardsQuery: { custNo: customer!.custNo },
              page: 0,
            }))
          }
          onHeirs={() =>
            goFetch('heirs', { partyFrom: 'individualOthers' }, async () => {
              const _r = await api.heirs(customer!.custNo)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onReferences={() =>
            goFetch('references', { partyFrom: 'individualOthers' }, async () => {
              const _r = await api.references(customer!.custNo)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onJointHolders={() =>
            goFetch('jointHolders', { partyFrom: 'individualOthers' }, async () => {
              const _r = await api.jointHolders(customer!.custNo)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onBack={() => go('results')}
        />
      )}

      {screen.name === 'heirs' && customer && (
        <HeirsProxy customer={customer} rows={screen.gridRows ?? []} hasMore={screen.hasMore ?? false} onMore={appendPage('gridRows', (p) => api.heirs(customer.custNo, p))} onExit={() => go(screen.partyFrom ?? 'detail')} />
      )}

      {screen.name === 'jointHolders' && customer && (
        <JointHolders customer={customer} rows={screen.gridRows ?? []} hasMore={screen.hasMore ?? false} onMore={appendPage('gridRows', (p) => api.jointHolders(customer.custNo, p))} onExit={() => go(screen.partyFrom ?? 'detail')} />
      )}

      {screen.name === 'references' && customer && (
        <References customer={customer} rows={screen.gridRows ?? []} hasMore={screen.hasMore ?? false} onMore={appendPage('gridRows', (p) => api.references(customer.custNo, p))} onExit={() => go(screen.partyFrom ?? 'detail')} />
      )}

      {screen.name === 'owners' && customer && (
        <Owners customer={customer} rows={screen.gridRows ?? []} hasMore={screen.hasMore ?? false} onMore={appendPage('gridRows', (p) => api.owners(customer.custNo, p))} onExit={() => go(screen.partyFrom ?? 'juristic')} />
      )}

      {screen.name === 'detail2' && screen.acctInfo && (
        <IndividualSaudiAcctInfo
          customer={customer}
          acctInfo={screen.acctInfo}
          onPrevPage={() => go('detail')}
          onDocuments={() =>
            goFetch('documents', {}, async () => ({
              documents: await api.requiredDocuments(customer!.custNo),
            }))
          }
          onCancel={() => setScreen({ name: 'search' })}
        />
      )}

      {screen.name === 'documents' && screen.documents && (
        <EssentialDocuments
          customer={customer}
          documents={screen.documents}
          onReturn={() => go('detail2')}
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
              goFetch('detail', { historyAsOf: dt }, async () => ({
                profile: await api.customerProfileAsOf(customer.custNo, dt),
              }))
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
          hasMore={screen.hasMore ?? false}
          onMore={appendPage('accountRows', (p) => api.accounts(customer.custNo, p))}
          onEnquiry={(account) =>
            goFetch('accountDetail', { account, historyAsOf: undefined }, async () => ({
              snapshot: await api.accountDetail(account.accountNumber),
            }))
          }
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
          account={{
            ...screen.account!,
            // Live detail (api.accountDetail) and history snapshot
            // (api.accountSnapshot) both land in screen.snapshot; merge either
            // over the account's own maintenance defaults.
            maintenance: { ...(screen.account!.maintenance ?? {}), ...(screen.snapshot ?? {}) },
          }}
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
          onCustomerInfo={() =>
            customer &&
            goFetch('detail', { historyAsOf: undefined }, async () => ({
              profile: await api.customerProfile(customer.custNo),
            }))
          }
          onCancel={() => go('accounts')}
          onSignatories={() =>
            goFetch('signatories', {}, async () => {
              const _r = await api.signatoriesByAccount(screen.account!.accountNumber)
              return { gridRows: _r.rows, hasMore: _r.hasMore, page: 0 }
            })
          }
          onCards={() =>
            goFetch('cards', { cardsFrom: 'accountDetail' }, async () => ({
              cardsResult: await api.searchCards({ accNo: screen.account!.accountNumber }),
              cardsQuery: { accNo: screen.account!.accountNumber },
              page: 0,
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

      {/* cmdExit unloads frmMerchantStmt and returns to frmEnquiry. */}
      {screen.name === 'merchant' && <MerchantStatement onExit={() => go('search')} />}

      {screen.name === 'cards' && screen.cardsResult && (
        <CardGrid
          result={screen.cardsResult}
          onMore={moreCards}
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
          hasMore={screen.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.signatoriesByAccount(screen.account!.accountNumber, p))}
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
