// Typed client for bank-api (Java/Spring Boot — the modern cbcmssrv).
// Endpoint ↔ legacy service-code map lives in bank-api/README.md.

import type { Account, Customer } from './types.ts'
import type { GridRow } from './components/GridScreen.tsx'
import { getToken, signOut } from './session.ts'
import { encryptPassword } from './pocCrypto.ts'

/** Bearer header from the stored JWT (empty before login / for public calls). */
function authHeaders(): Record<string, string> {
  const token = getToken()
  return token ? { Authorization: `Bearer ${token}` } : {}
}

/** An expired/invalid token: drop the session and return to the login screen. */
function onUnauthorized(): never {
  signOut()
  window.location.reload()
  throw new Error('Your session has expired — please log in again.')
}

// Dev: Vite serves the UI on 5173/5199 and the API runs separately on 8080.
// Production: the built UI is packaged into the bank-api jar and served from
// the same origin, so relative URLs work whatever host/port the jar uses.
const BASE = import.meta.env.VITE_API_URL ?? (import.meta.env.DEV ? 'http://localhost:8080' : '')

/** One reference-data code + display description. */
export interface CodeEntry {
  code: string
  description: string
}

/** Paged fetch: 10 rows per request; hasMore = a full page came back. */
export interface Paged<T> {
  rows: T[]
  hasMore: boolean
  /**
   * The scan was truncated — the legacy's incompleteFlag (cbbranch.c:1750).
   * The C set it when a search timed out mid-scan and flushed what it had, so
   * the operator knew the list was cut. Here it means the row cap was reached.
   */
  incomplete?: boolean
}

/** Subset of the legacy resMsgLogin (service 00) served by /api/session. */
export interface SessionInfo {
  userId: string
  userName: string
  branchCode: string
  authorityLevel: string
  authorityLevel2: string
  langPref: string
  bankingDate: string
  currentDateH: string
  currentDateG: string
  nameSearchAllowed: string
  idleTimeOutPeriod: string
}

/**
 * Login outcome (legacy resMsgLogin status codes): 000 success, 102 invalid
 * user, 103 invalid password, 104 locked, 105 closed. session only on 000.
 */
export interface LoginResult {
  status: string
  message: string
  session: SessionInfo | null
  token: string | null
}

async function get<T>(path: string, params?: Record<string, string>): Promise<T> {
  const entries = Object.entries(params ?? {}).filter(([, v]) => v !== '')
  const qs = entries.length ? `?${new URLSearchParams(entries)}` : ''
  const res = await fetch(`${BASE}${path}${qs}`, { headers: authHeaders() })
  if (res.status === 401) onUnauthorized()
  if (!res.ok) {
    const body = await res.text().catch(() => '')
    throw new Error(`API ${res.status} on ${path}${body ? ` — ${body.slice(0, 200)}` : ''}`)
  }
  return res.json() as Promise<T>
}

async function post<T>(path: string, body: unknown): Promise<T> {
  const res = await fetch(`${BASE}${path}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', ...authHeaders() },
    body: JSON.stringify(body),
  })
  if (res.status === 401 && path !== '/api/login') onUnauthorized()
  if (!res.ok) {
    const text = await res.text().catch(() => '')
    throw new Error(`API ${res.status} on ${path}${text ? ` — ${text.slice(0, 200)}` : ''}`)
  }
  return res.json() as Promise<T>
}

export const api = {
  session: () => get<SessionInfo>('/api/session'),

  /**
   * Legacy service 00 logon; credential check is an LDAP/AD bind behind the API.
   * The password is AES-encrypted client-side (pocCrypto) so the plaintext never
   * crosses the network — the backend decrypts it to perform the bind.
   */
  login: async (userId: string, password: string) =>
    post<LoginResult>('/api/login', { userId, password: await encryptPassword(password) }),

  /** Reference-data code sets (stctltab + combo tables). */
  codes: () => get<Record<string, CodeEntry[]>>('/api/codes'),

  /** Legacy service 16; params mirror reqMsgSearch fields. */
  searchCustomers: (params: Record<string, string>, page = 0) =>
    get<Paged<Customer>>('/api/customers', { ...params, page: String(page) }),

  /** Legacy service 67 (msgType 0) — stcustlog rows. */
  custUpdateHistory: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/update-history`, { page: String(page) }),

  /** Legacy service 21 — account grid for a customer. */
  accounts: (custNo: string, page = 0) =>
    get<Paged<Account>>(`/api/customers/${custNo}/accounts`, { page: String(page) }),

  /**
   * Legacy service 21, SEARCH_BY_ACCTNO branch — an exact read returning that
   * one account (cbbranch2.c:5823 isRead ISEQUAL), or an empty grid.
   */
  accountByNumber: (accNo: string) =>
    get<Paged<Account>>(`/api/accounts/${accNo}/summary`),

  /** stacclog rows. */
  acctUpdateHistory: (accNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/accounts/${accNo}/update-history`, { page: String(page) }),

  /** stchqtab rows. */
  chequeBookRequests: (accNo: string) =>
    get<GridRow[]>(`/api/accounts/${accNo}/chequebook-requests`),

  /** sod0data rows. */
  standingOrders: (accNo: string) => get<GridRow[]>(`/api/accounts/${accNo}/standing-orders`),

  /** pyd0data rows. */
  stopCheques: (accNo: string) => get<GridRow[]>(`/api/accounts/${accNo}/stop-cheques`),

  /** stacclog SAMA columns (legacy service 57 requestType 1). */
  samaStatusHistory: (accNo: string) =>
    get<GridRow[]>(`/api/accounts/${accNo}/sama-status-history`),

  /** stacclog account-status changes incl. reason (service 57 requestType 0). */
  acctStatusHistory: (accNo: string) =>
    get<GridRow[]>(`/api/accounts/${accNo}/status-history`),

  // ---- Tier-1 endpoints (QUERY-SPECS.md Part 2) ----

  stopChequeDetail: (accNo: string, chequeNo: string) =>
    get<GridRow>(`/api/accounts/${accNo}/stop-cheques/${chequeNo}`),

  standingOrderDetail: (accNo: string, sodNo: string) =>
    get<GridRow>(`/api/accounts/${accNo}/standing-orders/${sodNo}`),

  chequeBookHistory: (accNo: string, reqDate: string) =>
    get<GridRow>(`/api/accounts/${accNo}/chequebook-requests/${reqDate}/history`),

  blockedAmountBreakup: (accNo: string) =>
    get<BlockedAmountBreakup>(`/api/accounts/${accNo}/blocked-amount-breakup`),

  /** Exactly one of custNo / accNo / cardNo (legacy priority order). */
  searchCards: (params: Record<string, string>, page = 0) =>
    get<CardSearchResult>('/api/cards', { ...params, page: String(page) }),

  cardDetail: (cardNo: string) => get<GridRow>(`/api/cards/${cardNo}`),

  cardUpdateHistory: (cardNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/cards/${cardNo}/update-history`, { page: String(page) }),

  /** Card/PIN lifecycle — completed records only, max 50. */
  cardTrackingHistory: (cardNo: string) => get<GridRow[]>(`/api/cards/${cardNo}/history`),

  sarieTransfers: (accNo: string, params: Record<string, string>, page = 0) =>
    get<Paged<GridRow>>(`/api/accounts/${accNo}/transfers`, { ...params, page: String(page) }),

  transferDetail: (refNo: string, transDate = '') =>
    get<GridRow>(`/api/transfers/${refNo}`, transDate ? { transDate } : undefined),

  bmTransactions: (accNo: string, params: Record<string, string>, page = 0) =>
    get<Paged<GridRow>>(`/api/accounts/${accNo}/transactions`, { ...params, page: String(page) }),

  bmTransactionDetail: (accNo: string, refNo: string) =>
    get<GridRow>(`/api/accounts/${accNo}/transactions/${refNo}`),

  signatoriesByAccount: (accNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/accounts/${accNo}/signatories`, { page: String(page) }),

  signatoryDetail: (accNo: string, signatoryNo: string) =>
    get<GridRow>(`/api/accounts/${accNo}/signatories/${signatoryNo}`),

  // ---- Tier-2: customer profile + related parties (QUERY-SPECS.md §22) ----

  /** stcusttab record for the customer detail screens. */
  customerProfile: (custNo: string) => get<GridRow>(`/api/customers/${custNo}/profile`),

  /** stcustlog snapshot (legacy service 11 requestType 01, history mode). */
  customerProfileAsOf: (custNo: string, dateTime: string) =>
    get<GridRow>(`/api/customers/${custNo}/profile-asof/${dateTime}`),

  /** stacclog snapshot (legacy service 33 requestType 01, history mode). */
  accountSnapshot: (accNo: string, dateTime: string) =>
    get<Record<string, string>>(`/api/accounts/${accNo}/snapshot/${dateTime}`),

  /** Current account master (gld0data) for the AccountMaintenance screen. */
  accountDetail: (accNo: string) =>
    get<Record<string, string>>(`/api/accounts/${accNo}/detail`),

  /** Juristic page 2 (frmJuristicAccountInfo) enquiry data. */
  juristicAccountInfo: (custNo: string) =>
    get<GridRow>(`/api/customers/${custNo}/juristic-account-info`),

  /** stheirtab rows. */
  heirs: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/heirs`, { page: String(page) }),

  /** stjointtab rows. */
  jointHolders: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/joint-holders`, { page: String(page) }),

  /** stcreftab rows. */
  references: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/references`, { page: String(page) }),

  /** stowntab rows (juristic owner/management). */
  owners: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/owners`, { page: String(page) }),

  /** Individual page-2 attributes (stcusttab) for the Account Details screen. */
  customerAcctInfo: (custNo: string) =>
    get<Record<string, string>>(`/api/customers/${custNo}/acct-info`),

  /** Required document codes for the customer's SAMA sub-category (stctltabDC). */
  requiredDocuments: (custNo: string) =>
    get<string[]>(`/api/customers/${custNo}/documents`),
}

/** Blocked amount breakup — QUERY-SPECS.md §16. */
export interface BlockedAmountBreakup {
  accNo: string
  blockedBal: string
  details: GridRow[]
}

/** Card grid response — local card rows + DB #2 customer header (§13). */
export interface CardSearchResult {
  custNo: string
  shortName: string
  address1: string
  poBox: string
  cityName: string
  zipCode: string
  custBranchCode: string
  custType: string
  customerLang: string
  rows: GridRow[]
  hasMore: boolean
}
