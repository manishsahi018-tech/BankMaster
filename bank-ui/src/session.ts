// Operator session, populated by the Login screen from POST /api/login
// (legacy recvLoginMsg). Screens render only after login, so they can keep
// reading these fields synchronously.
// Authority codes are ~xx~ pairs built like legacy formatAuthLevel
// (globalFunctions.bas:4713); single-digit gates are family matches — ~4
// hits ~41/~42/~45 (cards), ~6 hits ~60/~61/~62 (accounts):
//   ~4  ATM card facilities          ~6, ~32  account facilities
//   ~41 CSO menus + reports          ~42      supervisor menus
//   ~43 card production centre       ~81      merchant facilities
//   ~87 historical statement         ~99      enquiry-only user
import type { SessionInfo } from './api.ts'

type Session = {
  loggedIn: boolean
  userId: string
  authorityLevel: string
  nameSearchAllowed: string
  userName: string
  branchCode: string
}

const EMPTY: Session = {
  loggedIn: false,
  userId: '',
  authorityLevel: '',
  nameSearchAllowed: '0',
  userName: '',
  branchCode: '',
}

// Persisted in sessionStorage so a page refresh does NOT log the operator out
// (it clears when the tab/window closes). No password/token is stored — only the
// display + authority fields the UI reads. /api/session can't restore it (it is a
// mocked stub returning a fixed user), so the client keeps the real session.
const STORAGE_KEY = 'csd.session'
const TOKEN_KEY = 'csd.token'

/** The JWT sent as a Bearer header on every /api call (see api.ts). */
export function getToken(): string | null {
  try {
    return sessionStorage.getItem(TOKEN_KEY)
  } catch {
    return null
  }
}

export function setToken(token: string): void {
  try {
    sessionStorage.setItem(TOKEN_KEY, token)
  } catch {
    /* ignore */
  }
}

function load(): Session {
  try {
    const raw = sessionStorage.getItem(STORAGE_KEY)
    if (raw) return { ...EMPTY, ...(JSON.parse(raw) as Partial<Session>), loggedIn: true }
  } catch {
    /* storage unavailable — fall through to empty session */
  }
  return { ...EMPTY }
}

export const session: Session = load()

/** Applies a successful login response (legacy status 000) and persists it. */
export function applySession(s: SessionInfo): void {
  session.loggedIn = true
  session.userId = s.userId
  session.authorityLevel = s.authorityLevel + (s.authorityLevel2 ?? '')
  session.nameSearchAllowed = s.nameSearchAllowed
  session.userName = s.userName
  session.branchCode = s.branchCode
  try {
    const { loggedIn, ...persisted } = session
    void loggedIn
    sessionStorage.setItem(STORAGE_KEY, JSON.stringify(persisted))
  } catch {
    /* storage unavailable — session stays in memory only */
  }
}

/** Clears the operator session (sign out / return to the logon window). */
export function signOut(): void {
  Object.assign(session, EMPTY)
  try {
    sessionStorage.removeItem(STORAGE_KEY)
    sessionStorage.removeItem(TOKEN_KEY)
  } catch {
    /* ignore */
  }
}

export const hasAuthority = (code: string) => session.authorityLevel.includes(code)

// Merchant-only operators (authorityLevel exactly "~81~") cannot run customer searches.
export const isMerchantOnly = () => session.authorityLevel.trim() === '~81~'

// The client half of the API's EnquiryRestrictions switch — the identity-based
// gates that refused an enquiry because of WHO was asking: the balance-enquiry
// restriction on the account grid's row actions (AccountInfo) and the
// enquiry-only / merchant-only lock on the customer Search button
// (CustomerStaticData). Both are OFF: any logged-in operator may search any
// customer and open any account. Keep this in step with
// EnquiryRestrictions.ENABLED on the server — the server is the one that
// matters, this only stops the UI refusing first.
export const ENQUIRY_RESTRICTIONS_ENABLED = false
