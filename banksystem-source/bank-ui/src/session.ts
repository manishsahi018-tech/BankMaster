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

export const session = {
  loggedIn: false,
  userId: '',
  authorityLevel: '',
  nameSearchAllowed: '0',
  userName: '',
  branchCode: '',
}

/** Applies a successful login response (legacy status 000). */
export function applySession(s: SessionInfo): void {
  session.loggedIn = true
  session.userId = s.userId
  session.authorityLevel = s.authorityLevel + (s.authorityLevel2 ?? '')
  session.nameSearchAllowed = s.nameSearchAllowed
  session.userName = s.userName
  session.branchCode = s.branchCode
}

/** Clears the operator session (sign out / return to the logon window). */
export function signOut(): void {
  session.loggedIn = false
  session.userId = ''
  session.authorityLevel = ''
  session.nameSearchAllowed = '0'
  session.userName = ''
  session.branchCode = ''
}

export const hasAuthority = (code: string) => session.authorityLevel.includes(code)

// Merchant-only operators (authorityLevel exactly "~81~") cannot run customer searches.
export const isMerchantOnly = () => session.authorityLevel.trim() === '~81~'
