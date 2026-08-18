// Typed client for bank-api (Java/Spring Boot — the modern cbcmssrv).
// Endpoint ↔ legacy service-code map lives in bank-api/README.md.

import type { Account, Customer } from './types.ts'
import type { GridRow } from './components/GridScreen.tsx'
import { getToken, setToken, signOut } from './session.ts'
import { encryptPassword } from './pocCrypto.ts'
import { beginRequest, endRequest } from './pending.ts'

/** Bearer header from the stored JWT (empty before login / for public calls). */
function authHeaders(): Record<string, string> {
  const token = getToken()
  return token ? { Authorization: `Bearer ${token}` } : {}
}

/**
 * Sliding session: when a near-expiry token is used, the API returns a refreshed
 * one in the X-Refresh-Token header — adopt it so an active operator's session
 * never lapses (see TokenSlidingRefreshFilter).
 */
function adoptRefreshedToken(res: Response): void {
  const refreshed = res.headers.get('X-Refresh-Token')
  if (refreshed) setToken(refreshed)
}

/** An expired/invalid token: drop the session and return to the login screen. */
function onUnauthorized(): never {
  signOut()
  window.location.reload()
  throw new Error('Your session has expired — please log in again.')
}

// Dev: Vite serves the UI on 5173/5199 and the API runs separately on 8085.
// Production: the built UI is packaged into the bank-api jar and served from
// the same origin, so relative URLs work whatever host/port the jar uses.
const BASE = import.meta.env.VITE_API_URL ?? (import.meta.env.DEV ? 'http://localhost:8085' : '')

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

/**
 * What the operator is told when a call fails.
 *
 * The message on screen is deliberately NOT the technical one. It used to be —
 * `API 500 on /api/accounts/…/transactions — {"detail":…}` went straight into a
 * toast, which means nothing to a branch user, leaks internal paths and table
 * names, and leaves support with no way to tie a complaint to a log line.
 *
 * The split is by status, not by blanket suppression, because a 4xx body is
 * usually a BUSINESS message that the legacy showed in a MsgBox and that we
 * ported deliberately — "Invalid Customer Number..Please Check", "Account
 * Number cannot be empty..Please enter". Hiding those would make the app less
 * usable than the VB6 original, so they are shown verbatim.
 *
 * Technical failures (5xx, network, unparsable body) become a per-screen
 * sentence plus a reference. The reference comes from the server when it
 * reached the server (ApiExceptionHandler logs the stack against it); when the
 * request never landed, the client mints one so the console line can still be
 * found.
 */
export class ApiError extends Error {
  readonly status: number
  readonly reference: string | null
  /** True when the message came from the server and is safe to show as-is. */
  readonly isBusinessMessage: boolean

  constructor(
    message: string,
    opts: { status: number; reference?: string | null; isBusinessMessage?: boolean },
  ) {
    super(message)
    this.name = 'ApiError'
    this.status = opts.status
    this.reference = opts.reference ?? null
    this.isBusinessMessage = opts.isBusinessMessage ?? false
  }
}

/** Same alphabet as the server's: no vowels, no 0/O or 1/I to misread aloud. */
function clientReference(): string {
  const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  return Array.from(
    { length: 6 },
    () => alphabet[Math.floor(Math.random() * alphabet.length)],
  ).join('')
}

/**
 * `action` completes "Could not …" and is supplied per endpoint below, so the
 * operator is told what failed on the screen they are looking at rather than
 * getting one flat "something went wrong".
 */
function technicalMessage(action: string, reference: string): string {
  return `Could not ${action}. Please try again — if it keeps happening, quote reference ${reference} to the help desk.`
}

/** Reads a Spring ProblemDetail body, tolerating a non-JSON error page. */
async function readProblem(
  res: Response,
): Promise<{ detail: string; reference: string | null }> {
  const text = await res.text().catch(() => '')
  try {
    const body = JSON.parse(text) as { detail?: string; reference?: string }
    return { detail: (body.detail ?? '').trim(), reference: body.reference ?? null }
  } catch {
    return { detail: '', reference: null }
  }
}

/**
 * The two requests that must NOT raise the blocking overlay.
 *
 * /api/login — the login screen has its own button state, and App does not even
 * mount the overlay until past it.
 *
 * /api/codes — loaded in the background at boot on purpose; blocking the first
 * paint on reference data was removed deliberately (see initCodes in main.tsx).
 * Covering it with a modal would put that back.
 */
const SILENT_PATHS = ['/api/login', '/api/codes']

const raisesOverlay = (path: string) => !SILENT_PATHS.some((p) => path.startsWith(p))

async function request<T>(
  path: string,
  action: string,
  init: RequestInit,
  opts: { skipUnauthorized?: boolean } = {},
): Promise<T> {
  // Every call in this module funnels through here, which is why the overlay is
  // counted at this level rather than per screen.
  const tracked = raisesOverlay(path)
  if (tracked) beginRequest()
  try {
    return await send<T>(path, action, init, opts)
  } finally {
    // finally, not after the return: a thrown ApiError must still release the
    // counter, or the overlay stays up for the rest of the session.
    if (tracked) endRequest()
  }
}

async function send<T>(
  path: string,
  action: string,
  init: RequestInit,
  opts: { skipUnauthorized?: boolean },
): Promise<T> {
  let res: Response
  try {
    res = await fetch(`${BASE}${path}`, init)
  } catch (cause) {
    // The request never landed — server down, DNS, offline, CORS.
    const reference = clientReference()
    console.error(`[${reference}] Request to ${path} failed to reach the server`, cause)
    throw new ApiError(technicalMessage(action, reference), { status: 0, reference })
  }

  adoptRefreshedToken(res)
  if (res.status === 401 && !opts.skipUnauthorized) onUnauthorized()

  if (!res.ok) {
    const { detail, reference } = await readProblem(res)
    // 4xx carries the ported legacy message — show it as the legacy did.
    // 501 joins it: "this facility has no data source in this environment" is a
    // standing condition the operator should read in full, not a fault to chase
    // with a support reference (see NotAvailableException).
    const explains = (res.status >= 400 && res.status < 500) || res.status === 501
    if (explains && detail) {
      throw new ApiError(detail, { status: res.status, reference, isBusinessMessage: true })
    }
    const ref = reference ?? clientReference()
    console.error(
      `[${ref}] ${res.status} on ${path}${detail ? ` — ${detail}` : ''}`,
    )
    throw new ApiError(technicalMessage(action, ref), { status: res.status, reference: ref })
  }

  try {
    return (await res.json()) as T
  } catch (cause) {
    // 2xx with a body we cannot read is a server-side defect, not a user error.
    const reference = clientReference()
    console.error(`[${reference}] Unreadable response body from ${path}`, cause)
    throw new ApiError(technicalMessage(action, reference), {
      status: res.status,
      reference,
    })
  }
}

function get<T>(path: string, action: string, params?: Record<string, string>): Promise<T> {
  const entries = Object.entries(params ?? {}).filter(([, v]) => v !== '')
  const qs = entries.length ? `?${new URLSearchParams(entries)}` : ''
  return request<T>(`${path}${qs}`, action, { headers: authHeaders() })
}

function post<T>(path: string, action: string, body: unknown): Promise<T> {
  return request<T>(
    path,
    action,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', ...authHeaders() },
      body: JSON.stringify(body),
    },
    // A failed login must not bounce through onUnauthorized — it IS the login.
    { skipUnauthorized: path === '/api/login' },
  )
}

export const api = {
  session: () => get<SessionInfo>('/api/session', 'restore your session'),

  /**
   * Legacy service 00 logon; credential check is an LDAP/AD bind behind the API.
   * The password is AES-encrypted client-side (pocCrypto) so the plaintext never
   * crosses the network — the backend decrypts it to perform the bind.
   */
  login: async (userId: string, password: string) =>
    post<LoginResult>('/api/login', 'sign you in', { userId, password: await encryptPassword(password) }),

  /** Reference-data code sets (stctltab + combo tables). */
  codes: () => get<Record<string, CodeEntry[]>>('/api/codes', 'load the reference data'),

  /** Legacy service 16; params mirror reqMsgSearch fields. */
  searchCustomers: (params: Record<string, string>, page = 0) =>
    get<Paged<Customer>>('/api/customers', 'run the customer search', { ...params, page: String(page) }),

  /** Legacy service 67 (msgType 0) — stcustlog rows. */
  custUpdateHistory: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/update-history`, 'load the customer update history', { page: String(page) }),

  /** Legacy service 21 — account grid for a customer. */
  accounts: (custNo: string, page = 0) =>
    get<Paged<Account>>(`/api/customers/${custNo}/accounts`, 'load the accounts for this customer', { page: String(page) }),

  /**
   * Legacy service 21, SEARCH_BY_ACCTNO branch — an exact read returning that
   * one account (cbbranch2.c:5823 isRead ISEQUAL), or an empty grid.
   */
  accountByNumber: (accNo: string) =>
    get<Paged<Account>>(`/api/accounts/${accNo}/summary`, 'look up this account'),

  /** stacclog rows. */
  acctUpdateHistory: (accNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/accounts/${accNo}/update-history`, 'load the account update history', { page: String(page) }),

  /** stchqtab rows. */
  chequeBookRequests: (accNo: string) =>
    get<GridRow[]>(`/api/accounts/${accNo}/chequebook-requests`, 'load the cheque book requests'),

  /** sod0data rows. */
  standingOrders: (accNo: string) => get<GridRow[]>(`/api/accounts/${accNo}/standing-orders`, 'load the standing orders'),

  /** pyd0data rows. */
  stopCheques: (accNo: string) => get<GridRow[]>(`/api/accounts/${accNo}/stop-cheques`, 'load the stop cheques'),

  /** stacclog SAMA columns (legacy service 57 requestType 1). */
  samaStatusHistory: (accNo: string) =>
    get<GridRow[]>(`/api/accounts/${accNo}/sama-status-history`, 'load the SAMA status history'),

  /** stacclog account-status changes incl. reason (service 57 requestType 0). */
  acctStatusHistory: (accNo: string) =>
    get<GridRow[]>(`/api/accounts/${accNo}/status-history`, 'load the account status history'),

  // ---- Tier-1 endpoints (QUERY-SPECS.md Part 2) ----

  stopChequeDetail: (accNo: string, chequeNo: string) =>
    get<GridRow>(`/api/accounts/${accNo}/stop-cheques/${chequeNo}`, 'open this stop cheque'),

  standingOrderDetail: (accNo: string, sodNo: string) =>
    get<GridRow>(`/api/accounts/${accNo}/standing-orders/${sodNo}`, 'open this standing order'),

  chequeBookHistory: (accNo: string, reqDate: string) =>
    get<GridRow>(`/api/accounts/${accNo}/chequebook-requests/${reqDate}/history`, 'open this cheque book history'),

  blockedAmountBreakup: (accNo: string) =>
    get<BlockedAmountBreakup>(`/api/accounts/${accNo}/blocked-amount-breakup`, 'load the blocked amount breakup'),

  /** Exactly one of custNo / accNo / cardNo (legacy priority order). */
  searchCards: (params: Record<string, string>, page = 0) =>
    get<CardSearchResult>('/api/cards', 'load the cards', { ...params, page: String(page) }),

  cardDetail: (cardNo: string) => get<GridRow>(`/api/cards/${cardNo}`, 'open this card'),

  cardUpdateHistory: (cardNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/cards/${cardNo}/update-history`, 'load the card update history', { page: String(page) }),

  /** Card/PIN lifecycle — completed records only, max 50. */
  cardTrackingHistory: (cardNo: string) => get<GridRow[]>(`/api/cards/${cardNo}/history`, 'load the card and PIN history'),

  sarieTransfers: (accNo: string, params: Record<string, string>, page = 0) =>
    get<Paged<GridRow>>(`/api/accounts/${accNo}/transfers`, 'fetch the transfers', { ...params, page: String(page) }),

  transferDetail: (refNo: string, transDate = '') =>
    get<GridRow>(`/api/transfers/${refNo}`, 'open this transfer', transDate ? { transDate } : undefined),

  bmTransactions: (accNo: string, params: Record<string, string>, page = 0) =>
    get<Paged<GridRow>>(`/api/accounts/${accNo}/transactions`, 'fetch the transactions', { ...params, page: String(page) }),

  bmTransactionDetail: (accNo: string, refNo: string) =>
    get<GridRow>(`/api/accounts/${accNo}/transactions/${refNo}`, 'open this transaction'),

  /**
   * One page of a merchant statement (legacy frmMerchantStmt, authority ~81).
   * Unlike every other call here the rows are pre-rendered fixed-width print
   * lines, not records — the acquiring/POS system formats and totals them.
   * Page by sending back the previous reply's lastRecCount until
   * completionFlag is "1".
   */
  merchantStatement: (params: {
    merchantNo: string
    stmtType: string
    fromDate: string
    toDate: string
    lastTransPtr: string
  }) => get<MerchantStatementPage>('/api/merchant/statement', 'generate the merchant statement', params),

  /**
   * Archived statements for an account (legacy frmHistStmt, cmdHistStmt).
   * Served from DB #3, the statement archive — a different database from every
   * other call here. Both months are inclusive YYYYMM, matching the legacy
   * form's year+month controls.
   */
  historicalStatements: (
    accNo: string,
    params: {
      branchCode: string
      fromYearMonth: string
      toYearMonth: string
      /**
       * Which of the archive's two systems to read — "BM" or "PDP". No legacy
       * counterpart: the Btrieve index tree the screen replaced held one
       * archive. Exactly one is read, so the reply is never a merge of both.
       */
      system: StatementSystem
      /** "true" selects the deleted-account route (legacy tag "D", needs ~87). */
      deletedAccount?: string
    },
  ) =>
    get<HistoricalStatement[]>(
      `/api/accounts/${accNo}/historical-statement`,
      'generate the historical statement',
      params,
    ),

  /**
   * On-demand Statement (legacy frmInputform, service 07) — one gateway page.
   * Day-granular. Page by sending back lastTransPtr until completionFlag "1".
   */
  onDemandStatement: (
    accNo: string,
    params: { fromDate: string; toDate: string; lastTransPtr: string },
  ) =>
    get<OnlineStatementPage>(
      `/api/accounts/${accNo}/ondemand-statement`,
      'generate the on-demand statement',
      params,
    ),

  /**
   * Transaction Inquiry (legacy frmTransaction, service 11) — one gateway page.
   * There is no toDate: the gateway supplies its own current date, because the
   * branch PC's clock could not be trusted (frmTransaction.frm:860-864).
   */
  onlineTransactions: (
    accNo: string,
    params: { fromDate: string; startTrans: string; lastTransPtr: string },
  ) =>
    get<OnlineStatementPage>(
      `/api/accounts/${accNo}/online-transactions`,
      'fetch the transactions',
      params,
    ),

  signatoriesByAccount: (accNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/accounts/${accNo}/signatories`, 'load the signatories', { page: String(page) }),

  /**
   * Every signatory of a CUSTOMER, across all their accounts — the listing the
   * legacy's juristic page 2 opens (frmJuristicAccountInfo cmdSignatory, which
   * loads frmJuristicSignatory by customer number, not by account). Rows carry
   * their own accNo, so a detail can still be opened from one.
   */
  signatoriesByCustomer: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/signatories`, 'load the signatories', { page: String(page) }),

  signatoryDetail: (accNo: string, signatoryNo: string) =>
    get<GridRow>(`/api/accounts/${accNo}/signatories/${signatoryNo}`, 'open this signatory'),

  // ---- Tier-2: customer profile + related parties (QUERY-SPECS.md §22) ----

  /** stcusttab record for the customer detail screens. */
  customerProfile: (custNo: string) => get<GridRow>(`/api/customers/${custNo}/profile`, 'open the customer profile'),

  /** stcustlog snapshot (legacy service 11 requestType 01, history mode). */
  customerProfileAsOf: (custNo: string, dateTime: string) =>
    get<GridRow>(`/api/customers/${custNo}/profile-asof/${dateTime}`, 'open the customer profile as it was on that date'),

  /** stacclog snapshot (legacy service 33 requestType 01, history mode). */
  accountSnapshot: (accNo: string, dateTime: string) =>
    get<Record<string, string>>(`/api/accounts/${accNo}/snapshot/${dateTime}`, 'open the account as it was on that date'),

  /** Current account master (gld0data) for the AccountMaintenance screen. */
  accountDetail: (accNo: string) =>
    get<Record<string, string>>(`/api/accounts/${accNo}/detail`, 'open the account details'),

  /** Juristic page 2 (frmJuristicAccountInfo) enquiry data. */
  juristicAccountInfo: (custNo: string) =>
    get<GridRow>(`/api/customers/${custNo}/juristic-account-info`, 'load the account details page'),

  /** stheirtab rows. */
  heirs: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/heirs`, 'load the heirs and proxies', { page: String(page) }),

  /** stjointtab rows. */
  jointHolders: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/joint-holders`, 'load the joint holders', { page: String(page) }),

  /** stcreftab rows. */
  references: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/references`, 'load the references', { page: String(page) }),

  /** stowntab rows (juristic owner/management). */
  owners: (custNo: string, page = 0) =>
    get<Paged<GridRow>>(`/api/customers/${custNo}/owners`, 'load the owners and management', { page: String(page) }),

  /** Individual page-2 attributes (stcusttab) for the Account Details screen. */
  customerAcctInfo: (custNo: string) =>
    get<Record<string, string>>(`/api/customers/${custNo}/acct-info`, 'load the account information page'),

  /** Required document codes for the customer's SAMA sub-category (stctltabDC). */
  requiredDocuments: (custNo: string) =>
    get<string[]>(`/api/customers/${custNo}/documents`, 'load the required documents'),
}

/** Blocked amount breakup — QUERY-SPECS.md §16. */
export interface BlockedAmountBreakup {
  accNo: string
  blockedBal: string
  details: GridRow[]
  /**
   * Legacy view names whose query failed (§16 sources — bkd0data and ccarrblk
   * are absent from Denodo today). The header total comes from gld0data and is
   * read independently of the rows, so when a source drops out the total
   * exceeds what is listed.
   */
  unavailableSources?: string[]
  /** True when the legacy 31-row cap stopped further rows. */
  truncated?: boolean
}

/**
 * One page of a merchant statement (§21). `lines` are the server's rendered
 * 150-char print lines — a leading \f marks a printer page break. Nothing
 * parses them; the client only spools what it is given.
 */
export interface MerchantStatementPage {
  merchantNo: string
  lines: string[]
  lastRecCount: string
  completionFlag: string
}

/**
 * One transaction line of an archived statement (STMT_TXN / PDP_STMT_TXN).
 *
 * Amounts are plain decimal strings from Oracle NUMBER(30,3) — NOT the
 * overpunch-signed archival strings, so they must be rendered with
 * formatPlainAmount, never formatAmount. Dates are YYYYMMDD.
 */
export interface HistoricalStatementLine {
  txnOrder: string
  txnBranchCode: string
  txnDate: string
  valueDate: string
  narrative1: string
  narrative2: string
  narrative3: string
  narrative4: string
  crAmt: string
  drAmt: string
  runBal: string
  runBalType: string
}

/**
 * The two archives DB #3 holds, each its own header/detail table pair. The
 * operator picks one on the Historical Statement screen; nothing in the legacy
 * records what separates them, so neither is a default the other can stand in
 * for — see JdbcStatementRepository.
 */
export type StatementSystem = 'BM' | 'PDP'

/**
 * One archived statement: a header plus its transaction lines.
 *
 * `source` echoes back the system the request asked for. Fields only one
 * archive carries arrive empty on the other: BM has stmtNum, iban and refNum,
 * PDP has custNum, pageNum and branchData.
 */
export interface HistoricalStatement {
  source: StatementSystem
  acctNum: string
  stmtDate: string
  stmtNum: string
  branchCode: string
  branchName: string
  acctType: string
  custNum: string
  custName: string
  custAdr1: string
  custAdr2: string
  custAdr3: string
  custAdr4: string
  crncy: string
  iban: string
  refNum: string
  langCode: string
  pageNum: string
  pageCount: number
  branchData: string
  fileName: string
  lines: HistoricalStatementLine[]
}

/**
 * One transaction as the online gateway returns it.
 *
 * `transAmt` is a signed decimal string in MINOR units whose leading character
 * is the side: "+" is credit, anything else debit. Divide by 10^decimalPlace
 * before display — see onlineAmount() in the screens.
 */
export interface OnlineTransaction {
  userId: string
  postDate: string
  valueDate: string
  transType: string
  transAmt: string
  narrative1: string
  narrative2: string
  narrative3: string
  referenceNo: string
  supervisorId: string
  transCounter: string
  stmtFlag: string
}

/**
 * One page of an online-gateway reply, shared by On-demand Statement and
 * Transaction Inquiry. `bfBalance` (minor units) seeds the running balance and
 * arrives only on the first page; keep paging while completionFlag is not "1".
 */
export interface OnlineStatementPage {
  responseStatus: string
  accNo: string
  custName: string
  address: string
  branchCode: string
  branchName: string
  langCode: string
  decimalPlace: string
  bfBalance: string
  fromDate: string
  toDate: string
  transactions: OnlineTransaction[]
  lastTransPtr: string
  completionFlag: string
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
