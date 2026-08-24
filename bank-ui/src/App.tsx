import { useEffect, useState } from 'react'
import type { Account, Customer, SearchCriteria } from './types.ts'
import type { GridRow } from './components/GridScreen.tsx'
import ProcessingOverlay from './components/ProcessingOverlay.tsx'
import { useToast } from './components/Toast.tsx'
import { api } from './api.ts'
import type {
  BlockedAmountBreakup as Breakup,
  CardSearchResult,
  EssentialDocumentsPayload,
} from './api.ts'
import TopNav from './components/TopNav.tsx'
import Login from './screens/Login.tsx'
import { session, signOut } from './session.ts'
import { useCodes } from './codes.ts'
import { useLocale } from './i18n/locale.ts'
import { profileScreenFor, partyPanelsFor } from './screenSet.ts'
import { useRequestPending } from './pending.ts'
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
import IndividualOthersAcctInfo from './screens/IndividualOthersAcctInfo.tsx'
import IndividualOthersPage2 from './screens/IndividualOthersPage2.tsx'
import HeirsProxy from './screens/HeirsProxy.tsx'
import JointHolders from './screens/JointHolders.tsx'
import References from './screens/References.tsx'
import Owners from './screens/Owners.tsx'
import OwnerDetail from './screens/OwnerDetail.tsx'
import PartyDetail from './screens/PartyDetail.tsx'
import JointHolderDetail from './screens/JointHolderDetail.tsx'
import MerchantStatement from './screens/MerchantStatement.tsx'
import HistoricalStatement from './screens/HistoricalStatement.tsx'
import PdpStatement from './screens/PdpStatement.tsx'
import OnDemandStatement from './screens/OnDemandStatement.tsx'
import TransactionInquiry from './screens/TransactionInquiry.tsx'
import SadadTransEnquiry from './screens/SadadTransEnquiry.tsx'

/** The row-sets that page against the server. */
type PagedKey = 'searchRows' | 'gridRows' | 'accountRows' | 'cardsResult'

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
  /**
   * Screen a customer profile returns to.
   *
   * <p>A profile is opened from three places — the search results, the
   * Customer Update History (in history mode) and an account's Customer
   * Information button — and its Cancel used to be hardcoded, so exiting a
   * profile opened from the update history dropped the operator back on the
   * empty search form and lost the list they were working through.
   */
  profileFrom?: string
  /** screen to return to from a related-party grid */
  partyFrom?: string
  /** grid to return to from a related-party DETAIL */
  partyBack?: string
  /**
   * Server pagination cursor, PER ROW-SET.
   *
   * <p>A cursor describes ONE grid, but four different row-sets share this
   * screen state — searchRows, accountRows, cardsResult and gridRows (every
   * other paged grid) — and go()/goFetch() merge the previous state forward.
   * A single page/hasMore pair therefore leaked between grids: exiting the
   * paged Customer Update History back to the search results carried the
   * history's hasMore onto the results pager, which then showed a live Next
   * on a single-row result set.
   *
   * <p>Keyed by row-set, each grid reads only its own cursor and the others
   * survive the trip — which they must, since the rows themselves do.
   */
  paging?: Partial<Record<PagedKey, { page: number; hasMore: boolean }>>
  /** set when showing a stcustlog/stacclog snapshot (legacy history mode) */
  historyAsOf?: string
  /** stacclog maintenance-field overrides for the account history snapshot */
  snapshot?: Record<string, string>
  /** juristic page 2 data (frmJuristicAccountInfo) */
  juristicInfo?: GridRow
  /** screen to return to from Essential Documents (both page-2 screens open it) */
  docsFrom?: string
  /** screen to exit to from the signatory grid */
  signatoriesFrom?: string
  /** signatory grid is scoped to the CUSTOMER rather than one account */
  byCustomer?: boolean
  /** individual page 2 attributes (frmIndividualSaudiAcctInfo) */
  acctInfo?: Record<string, string>
  /** frmDocuments payload — required + supplied document codes and Others */
  documents?: EssentialDocumentsPayload
}

/**
 * The as-of key a history drill-down puts in the URL path.
 *
 * A log row can reach the grid with no timestamp — the repositories map the
 * column through BmForms.isoToBmTimestamp, which yields "" for a NULL — and an
 * empty segment silently truncates the URL to `…/snapshot/`, which matches no
 * mapping and comes back 404. That reads as "the record is missing" when the
 * real problem is that the row never had a key to look it up by. Guard here so
 * the operator is told which it is.
 *
 * Returns null when there is nothing usable to key on.
 */
function asOfKey(value: unknown): string | null {
  const s = value == null ? '' : String(value).trim()
  return s === '' || s === 'undefined' || s === 'null' ? null : s
}

/**
 * frmDocuments' fetch. All three page-2 screens open the same form, and each
 * can be showing either the live customer record or an stcustlog snapshot, so
 * the as-of key of the screen that opened it decides which read runs — the
 * legacy's custHistoryAction path is fed from custLogRec, not custTabRec
 * (cbothers.c:3703-3704).
 */
const fetchDocuments = (custNo: string, asOf?: string) =>
  asOf ? api.documentsAsOf(custNo, asOf) : api.documents(custNo)

const NO_TIMESTAMP =
  'This history row carries no timestamp, so the record behind it cannot be opened.'

export default function App() {
  // Restore the persisted session on refresh instead of forcing re-login.
  const [screen, setScreen] = useState<ScreenState>(
    session.loggedIn ? { name: 'search' } : { name: 'login' },
  )
  const [busy, setBusy] = useState(false)
  // Any request raises the overlay now, wherever it was started from — the
  // self-fetching screens included. busy stays because it also covers the
  // state-swap after goFetch's request settles.
  const requestPending = useRequestPending()
  const [error, setError] = useState<string | null>(null)
  const toast = useToast()
  // /api/codes is loaded in the background; re-render here when it lands so
  // every screen below swaps its raw codes for "<code>-<description>" labels.
  useCodes()
  // One subscription at the top is enough to re-label the whole tree when the
  // operator switches language — t() reads the locale at call time, so every
  // screen below re-renders with the new one without subscribing itself.
  useLocale()

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
  // Which related-party panels this customer's sub category reaches —
  // the legacy's Next Page branching, see partyPanelsFor.
  const parties = partyPanelsFor(customer?.mainCategoryCode, customer?.subCategoryCode)

  /**
   * `paging` is merged a level deeper than everything else: a spread would let
   * one screen's cursor entry wipe the others, and the row-sets they belong to
   * outlive the navigation.
   */
  const merge = (s: ScreenState, ...parts: Partial<ScreenState>[]): ScreenState => {
    const next = Object.assign({}, s, ...parts) as ScreenState
    const paging = parts.reduce((acc, p) => (p.paging ? { ...acc, ...p.paging } : acc), s.paging)
    return paging ? { ...next, paging } : next
  }

  const go = (name: string, extra: Partial<ScreenState> = {}) =>
    setScreen((s) => ({ ...merge(s, extra), name }))

  // Appends the next 10-row page to a paged grid (legacy "More" button).
  const appendPage = (
    key: Exclude<PagedKey, 'cardsResult'>,
    fetcher: (page: number) => Promise<{ rows: unknown[]; hasMore: boolean }>,
  ) => () => {
    const nextPage = (screen.paging?.[key]?.page ?? 0) + 1
    setBusy(true)
    setError(null)
    fetcher(nextPage)
      .then((r) =>
        setScreen(
          (s) =>
            ({
              ...s,
              [key]: [...((s[key] as unknown[] | undefined) ?? []), ...r.rows],
              paging: { ...s.paging, [key]: { page: nextPage, hasMore: r.hasMore } },
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
    const nextPage = (screen.paging?.cardsResult?.page ?? 0) + 1
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
          paging: { ...s.paging, cardsResult: { page: nextPage, hasMore: r.hasMore } },
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
      .then((data) => setScreen((s) => ({ ...merge(s, extra, data), name })))
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
      <ProcessingOverlay show={busy || requestPending} label="Fetching from server…" />

      {screen.name === 'search' && (
        <CustomerStaticData
          onSearch={(criteria) =>
            goFetch('results', { criteria }, async () => {
              const r = await api.searchCustomers(criteria.params)
              return {
                searchRows: r.rows,
                paging: { searchRows: { page: 0, hasMore: r.hasMore } },
                searchIncomplete: r.incomplete ?? false,
              }
            })
          }
          onCards={(params) =>
            goFetch('cards', { cardsFrom: 'search' }, async () => ({
              cardsResult: await api.searchCards(params),
              cardsQuery: params,
              paging: { cardsResult: { page: 0, hasMore: false } },
            }))
          }
          // cmdMerchant opens frmMerchantStmt directly — no search or customer
          // context is carried across; the merchant number is keyed there.
          onMerchant={() => go('merchant')}
          onSadadTransactions={() => go('sadadTransactions')}
          onDeletedAcctStatement={() => go('deletedAcctStatement')}
          onPdpStatement={() => go('pdpStatement')}
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
                paging: { accountRows: { page: 0, hasMore: accts.hasMore } },
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
          hasMore={screen.paging?.searchRows?.hasMore ?? false}
          onMore={appendPage('searchRows', (p) => api.searchCustomers(screen.criteria!.params, p))}
          onBack={() => setScreen({ name: 'search' })}
          onEnquiry={(row) => {
            // getScreenSetNo (globalFunctions.bas:4810) decides the form from
            // main + sub category, and frmEnquirySelect.frm:643-646 refuses to
            // open anything when it answers '-1'. Ported literally in
            // screenSet.ts — this used to guess from idType, which the legacy
            // never reads here.
            const screen = profileScreenFor(row.mainCategoryCode, row.subCategoryCode)
            if (!screen) {
              toast.warn(
                `No profile screen for main category ${row.mainCategoryCode || '—'} ` +
                  `and sub category ${row.subCategoryCode || '—'}.`,
              )
              return
            }
            goFetch(screen, { customer: row, historyAsOf: undefined, profileFrom: 'results' }, async () => ({
              profile: await api.customerProfile(row.custNo),
            }))
          }}
          onHistory={(row) =>
            goFetch('custHistory', { customer: row }, async () => {
              const r = await api.custUpdateHistory(row.custNo)
              return { gridRows: r.rows, paging: { gridRows: { page: 0, hasMore: r.hasMore } } }
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
              return { accountRows: _r.rows, paging: { accountRows: { page: 0, hasMore: _r.hasMore } } }
            })
          }
          onCards={() =>
            goFetch('cards', { cardsFrom: 'detail' }, async () => ({
              cardsResult: await api.searchCards({ custNo: customer!.custNo }),
              cardsQuery: { custNo: customer!.custNo },
              paging: { cardsResult: { page: 0, hasMore: false } },
            }))
          }
          onHeirs={
            parties.heirs
              ? () =>
                  goFetch('heirs', { partyFrom: 'detail' }, async () => {
                    const _r = await api.heirs(customer!.custNo)
                    return { gridRows: _r.rows, paging: { gridRows: { page: 0, hasMore: _r.hasMore } } }
                  })
              : undefined
          }
          onReferences={
            parties.references
              ? () =>
                  goFetch('references', { partyFrom: 'detail' }, async () => {
                    const _r = await api.references(customer!.custNo)
                    return { gridRows: _r.rows, paging: { gridRows: { page: 0, hasMore: _r.hasMore } } }
                  })
              : undefined
          }
          onBack={() => go(screen.profileFrom ?? 'results')}
        />
      )}

      {(screen.name === 'juristic'
        || screen.name === 'juristicDiplomats'
        || screen.name === 'juristicNonResident') && screen.profile && (
        <JuristicMain
          profile={screen.profile}
          variant={
            screen.name === 'juristicDiplomats'
              ? 'diplomats'
              : screen.name === 'juristicNonResident'
                ? 'nonResident'
                : 'main'
          }
          historyAsOf={screen.historyAsOf}
          onNextPage={() =>
            goFetch('juristic2', { from: screen.name }, async () => ({
              juristicInfo: await api.juristicAccountInfo(customer!.custNo),
            }))
          }
          onAccounts={() =>
            goFetch('accounts', { from: 'juristic' }, async () => {
              const _r = await api.accounts(customer!.custNo)
              return { accountRows: _r.rows, paging: { accountRows: { page: 0, hasMore: _r.hasMore } } }
            })
          }
          onOwners={() =>
            goFetch('owners', { partyFrom: screen.name }, async () => {
              const _r = await api.owners(customer!.custNo)
              return { gridRows: _r.rows, paging: { gridRows: { page: 0, hasMore: _r.hasMore } } }
            })
          }
          onBack={() => go(screen.profileFrom ?? 'results')}
        />
      )}

      {screen.name === 'juristic2' && screen.profile && screen.juristicInfo && (
        <JuristicAccountInfo
          profile={screen.profile}
          info={screen.juristicInfo}
          onPrevPage={() => go(screen.from ?? 'juristic')}
          // cmdSignatory loads frmJuristicSignatory BY CUSTOMER NUMBER, not by
          // account (frmJuristicAccountInfo.frm:2270) — a juristic customer's
          // signatories span its accounts.
          onSignatories={() =>
            goFetch('signatories', { signatoriesFrom: 'juristic2', byCustomer: true }, async () => {
              const r = await api.signatoriesByCustomer(customer!.custNo)
              return { gridRows: r.rows, paging: { gridRows: { page: 0, hasMore: r.hasMore } } }
            })
          }
          onOwners={() =>
            goFetch('owners', { partyFrom: 'juristic2' }, async () => {
              const r = await api.owners(customer!.custNo)
              return { gridRows: r.rows, paging: { gridRows: { page: 0, hasMore: r.hasMore } } }
            })
          }
          onDocuments={() =>
            goFetch('documents', { docsFrom: 'juristic2' }, async () => ({
              documents: await fetchDocuments(customer!.custNo, screen.historyAsOf),
            }))
          }
          onCancel={() => go(screen.profileFrom ?? 'results')}
        />
      )}

      {screen.name === 'individualOthers' && screen.profile && (
        <IndividualOthers
          profile={screen.profile}
          historyAsOf={screen.historyAsOf}
          onAccounts={() =>
            goFetch('accounts', { from: 'individualOthers' }, async () => {
              const _r = await api.accounts(customer!.custNo)
              return { accountRows: _r.rows, paging: { accountRows: { page: 0, hasMore: _r.hasMore } } }
            })
          }
          onCards={() =>
            goFetch('cards', { cardsFrom: 'individualOthers' }, async () => ({
              cardsResult: await api.searchCards({ custNo: customer!.custNo }),
              cardsQuery: { custNo: customer!.custNo },
              paging: { cardsResult: { page: 0, hasMore: false } },
            }))
          }
          onNextPage={() =>
            goFetch('others2', {}, async () => ({
              acctInfo: await api.customerAcctInfo(customer!.custNo),
            }))
          }
          onHeirs={
            parties.heirs
              ? () =>
                  goFetch('heirs', { partyFrom: 'individualOthers' }, async () => {
                    const _r = await api.heirs(customer!.custNo)
                    return { gridRows: _r.rows, paging: { gridRows: { page: 0, hasMore: _r.hasMore } } }
                  })
              : undefined
          }
          onReferences={
            parties.references
              ? () =>
                  goFetch('references', { partyFrom: 'individualOthers' }, async () => {
                    const _r = await api.references(customer!.custNo)
                    return { gridRows: _r.rows, paging: { gridRows: { page: 0, hasMore: _r.hasMore } } }
                  })
              : undefined
          }
          onBack={() => go(screen.profileFrom ?? 'results')}
        />
      )}

      {screen.name === 'heirs' && customer && (
        <HeirsProxy
          customer={customer}
          rows={screen.gridRows ?? []}
          hasMore={screen.paging?.gridRows?.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.heirs(customer.custNo, p))}
          onEnquiry={(row) =>
            goFetch('partyDetail', { partyBack: 'heirs' }, async () => ({
              detail: await api.heirDetail(customer.custNo, String(row.heirNo ?? '')),
            }))
          }
          onExit={() => go(screen.partyFrom ?? 'detail')}
        />
      )}

      {screen.name === 'jointHolders' && customer && (
        <JointHolders
          customer={customer}
          rows={screen.gridRows ?? []}
          hasMore={screen.paging?.gridRows?.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.jointHolders(customer.custNo, p))}
          onEnquiry={(row) =>
            goFetch('jointHolderDetail', {}, async () => ({
              detail: await api.jointHolderDetail(customer.custNo, String(row.jointCustNo ?? '')),
            }))
          }
          onExit={() => go(screen.partyFrom ?? 'detail')}
        />
      )}

      {screen.name === 'references' && customer && (
        <References
          customer={customer}
          rows={screen.gridRows ?? []}
          hasMore={screen.paging?.gridRows?.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.references(customer.custNo, p))}
          onEnquiry={(row) =>
            goFetch('partyDetail', { partyBack: 'references' }, async () => ({
              detail: await api.referenceDetail(customer.custNo, String(row.referenceNo ?? '')),
            }))
          }
          onExit={() => go(screen.partyFrom ?? 'detail')}
        />
      )}

      {screen.name === 'owners' && customer && (
        <Owners
          customer={customer}
          rows={screen.gridRows ?? []}
          hasMore={screen.paging?.gridRows?.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.owners(customer.custNo, p))}
          onEnquiry={(row) =>
            goFetch('ownerDetail', {}, async () => ({
              detail: await api.ownerDetail(customer.custNo, String(row.ownerNo ?? '')),
            }))
          }
          onExit={() => go(screen.partyFrom ?? 'juristic')}
        />
      )}

      {screen.name === 'detail2' && screen.acctInfo && (
        <IndividualSaudiAcctInfo
          customer={customer}
          acctInfo={screen.acctInfo}
          historyAsOf={screen.historyAsOf}
          onPrevPage={() => go('detail')}
          onDocuments={() =>
            // Reset docsFrom rather than relying on its default — the juristic
            // page 2 sets it, and `go` would carry that value into here.
            goFetch('documents', { docsFrom: 'detail2' }, async () => ({
              documents: await fetchDocuments(customer!.custNo, screen.historyAsOf),
            }))
          }
          onCancel={() => go(screen.profileFrom ?? 'results')}
        />
      )}

      {/* The Others profile is THREE pages in the legacy, not two:
          frmIndividualOthers → frmIndividualOthers2 → frmIndividualOthersAcctInfo
          (frmIndividualOthers.frm:3822, frmIndividualOthers2.frm:2473-2493).
          'others3' carries the account-details page that 'others2' used to hold;
          both read the same acct-info payload, so stepping between them is a
          plain go() with no second fetch. */}
      {screen.name === 'others2' && screen.acctInfo && (
        <IndividualOthersPage2
          customer={customer}
          acctInfo={screen.acctInfo}
          historyAsOf={screen.historyAsOf}
          onPrevPage={() => go('individualOthers')}
          onNextPage={() => go('others3')}
          onCancel={() => go(screen.profileFrom ?? 'results')}
        />
      )}

      {screen.name === 'others3' && screen.acctInfo && (
        <IndividualOthersAcctInfo
          customer={customer}
          acctInfo={screen.acctInfo}
          historyAsOf={screen.historyAsOf}
          onPrevPage={() => go('others2')}
          onDocuments={() =>
            goFetch('documents', { docsFrom: 'others3' }, async () => ({
              documents: await fetchDocuments(customer!.custNo, screen.historyAsOf),
            }))
          }
          onCancel={() => go(screen.profileFrom ?? 'results')}
        />
      )}

      {screen.name === 'sadadTransactions' && (
        <SadadTransEnquiry onExit={() => setScreen({ name: 'search' })} />
      )}

      {screen.name === 'jointHolderDetail' && screen.detail && (
        <JointHolderDetail
          customer={customer}
          detail={screen.detail}
          onReturn={() => go('jointHolders')}
        />
      )}

      {screen.name === 'partyDetail' && screen.detail && (
        <PartyDetail
          customer={customer}
          detail={screen.detail}
          onReturn={() => go(screen.partyBack ?? 'references')}
        />
      )}

      {screen.name === 'ownerDetail' && screen.detail && (
        <OwnerDetail
          customer={customer}
          detail={screen.detail}
          onReturn={() => go('owners')}
        />
      )}

      {screen.name === 'documents' && screen.documents && (
        <EssentialDocuments
          customer={customer}
          documents={screen.documents}
          historyAsOf={screen.historyAsOf}
          // Both page-2 screens open Documents, so Return has to go back to
          // whichever one did rather than always to the individual's.
          onReturn={() => go(screen.docsFrom ?? 'detail2')}
        />
      )}

      {screen.name === 'custHistory' && customer && (
        <CustUpdateHistory
          customer={{ custNo: customer.custNo, name: customer.name, branchCode: customer.branchCode }}
          rows={screen.gridRows ?? []}
          hasMore={screen.paging?.gridRows?.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.custUpdateHistory(customer.custNo, p))}
          onViewDetail={(row) => {
            // Legacy getCustDetails: fetch the stcustlog snapshot for the
            // row's timestamp and open the matching profile form read-only
            // (loadCorrespondingForm routing, history mode).
            const dt = asOfKey(row.dateTime)
            if (!dt) {
              setError(NO_TIMESTAMP)
              return
            }
            if (customer.mainCategoryCode !== '01') {
              goFetch('juristic', { historyAsOf: dt, profileFrom: 'custHistory' }, async () => ({
                profile: await api.customerProfileAsOf(customer.custNo, dt),
              }))
            } else if (customer.idType === 'I') {
              goFetch('detail', { historyAsOf: dt, profileFrom: 'custHistory' }, async () => ({
                profile: await api.customerProfileAsOf(customer.custNo, dt),
              }))
            } else {
              goFetch('individualOthers', { historyAsOf: dt, profileFrom: 'custHistory' }, async () => ({
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
          hasMore={screen.paging?.accountRows?.hasMore ?? false}
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
              return { gridRows: r.rows, paging: { gridRows: { page: 0, hasMore: r.hasMore } } }
            })
          }
          onBlockedBreakup={(account) =>
            goFetch('blockedBreakup', { account }, async () => ({
              breakup: await api.blockedAmountBreakup(account.accountNumber),
            }))
          }
          onTransactions={(account) => go('transactions', { account })}
          onTransfers={(account) => go('transfers', { account })}
          onHistStatement={(account) => go('histStatement', { account })}
          onOndemandStatement={(account) => go('ondemandStatement', { account })}
          onTransactionInquiry={(account) => go('transactionInquiry', { account })}
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
            goFetch('detail', { historyAsOf: undefined, profileFrom: 'accountDetail' }, async () => ({
              profile: await api.customerProfile(customer.custNo),
            }))
          }
          onCancel={() => go('accounts')}
          onSignatories={() =>
            // Both flags are reset explicitly, not left to default: `go` merges
            // into the previous screen state, so a juristic customer-scoped
            // visit earlier in the session would otherwise leave byCustomer true
            // here and render an account list against the wrong query.
            goFetch('signatories', { byCustomer: false, signatoriesFrom: 'accountDetail' }, async () => {
              const _r = await api.signatoriesByAccount(screen.account!.accountNumber)
              return { gridRows: _r.rows, paging: { gridRows: { page: 0, hasMore: _r.hasMore } } }
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
          hasMore={screen.paging?.gridRows?.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.acctUpdateHistory(screen.account!.accountNumber, p))}
          onViewDetail={(row) => {
            // Legacy getAcctDetails: stacclog snapshot → frmAccount in
            // history mode (service 33 requestType 01).
            const dt = asOfKey(row.dateTime)
            if (!dt) {
              setError(NO_TIMESTAMP)
              return
            }
            goFetch('accountDetail', { historyAsOf: dt }, async () => ({
              snapshot: await api.accountSnapshot(screen.account!.accountNumber, dt),
            }))
          }}
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

      {/* cmdExit unloads frmHistStmt and returns to the account grid. */}
      {screen.name === 'histStatement' && (
        <HistoricalStatement account={screen.account!} onExit={() => go('accounts')} />
      )}

      {/* The same screen on the legacy's tag = "D" route: no account context,
          the number is typed, and Exit returns to search rather than a grid. */}
      {screen.name === 'deletedAcctStatement' && (
        <HistoricalStatement deletedAccountRoute onExit={() => go('search')} />
      )}

      {/* The PDP archive's own screen. Like the merchant one it carries no
          customer context across — branch, customer and account are keyed on
          the form itself — so Exit returns to search. */}
      {screen.name === 'pdpStatement' && <PdpStatement onExit={() => go('search')} />}

      {/* The two online-gateway screens. Both carry the customer's name from
          the grid context, as the legacy copies it onto the form. */}
      {screen.name === 'ondemandStatement' && (
        <OnDemandStatement
          account={screen.account!}
          customerName={customer?.name ?? ''}
          onExit={() => go('accounts')}
        />
      )}

      {screen.name === 'transactionInquiry' && (
        <TransactionInquiry
          account={screen.account!}
          customerName={customer?.name ?? ''}
          onExit={() => go('accounts')}
        />
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
              return { gridRows: r.rows, paging: { gridRows: { page: 0, hasMore: r.hasMore } } }
            })
          }
          onExit={() => go(screen.cardsFrom ?? 'search')}
        />
      )}

      {screen.name === 'cardDetail' && screen.detail && (
        <CardDetail
          detail={screen.detail}
          historyAsOf={screen.historyAsOf}
          // A snapshot was opened FROM the update history, so Return goes back
          // there rather than to the card grid the live detail came from.
          onReturn={() => go(screen.historyAsOf ? 'cardUpdateHistory' : 'cards')}
        />
      )}

      {screen.name === 'cardHistory' && (
        <CardHistory cardNo={screen.card ?? ''} entries={screen.gridRows ?? []} onReturn={() => go('cards')} />
      )}

      {screen.name === 'cardUpdateHistory' && (
        <CardUpdateHistory
          cardNo={screen.card ?? ''}
          rows={screen.gridRows ?? []}
          hasMore={screen.paging?.gridRows?.hasMore ?? false}
          onMore={appendPage('gridRows', (p) => api.cardUpdateHistory(screen.card ?? '', p))}
          onViewDetail={(row) => {
            const dt = asOfKey(row.dateTime)
            if (!dt) {
              toast.warn(NO_TIMESTAMP)
              return
            }
            goFetch('cardDetail', { historyAsOf: dt }, async () => ({
              detail: await api.cardSnapshot(
                screen.card ?? '',
                dt,
                String(row.branchCode ?? ''),
                String(row.userId ?? ''),
              ),
            }))
          }}
          onExit={() => go('cards')}
        />
      )}

      {screen.name === 'signatories' && (
        <SignatoryGrid
          account={screen.byCustomer ? undefined : screen.account!}
          customer={customer ?? undefined}
          rows={screen.gridRows ?? []}
          hasMore={screen.paging?.gridRows?.hasMore ?? false}
          onMore={appendPage('gridRows', (p) =>
            screen.byCustomer
              ? api.signatoriesByCustomer(customer!.custNo, p)
              : api.signatoriesByAccount(screen.account!.accountNumber, p),
          )}
          // The detail is keyed on (accNo, signatoryNo). A customer-scoped list
          // spans accounts, so the account has to come from the ROW rather than
          // from screen.account — which is not even set on that path.
          onDetail={(row) =>
            goFetch('signatoryDetail', {}, async () => ({
              detail: await api.signatoryDetail(
                screen.byCustomer ? String(row.accNo) : screen.account!.accountNumber,
                String(row.signatoryNo),
              ),
            }))
          }
          onExit={() => go(screen.signatoriesFrom ?? 'accountDetail')}
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
