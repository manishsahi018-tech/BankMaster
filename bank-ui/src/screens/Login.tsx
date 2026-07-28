// Legacy frmLogin (staticData.frm) — the LOGON WINDOW. Faithful behaviors:
// Enter on User Id moves focus to Password (staticData.frm:803), user id is
// upcased (:811), password rejects non-ASCII chars (errNoArabicCharacters,
// :791), and after a 000 response the client still applies the legacy
// "insufficient privileges" gate (:474 — must hold one of ~00 ~01 ~02 ~4
// ~6 ~3 ~99 ~8). The branch-match gate (:490) is dropped: the web client
// has no local statdata.ini branch; the branch comes from the profile.
// Password lifecycle statuses (101/106/107) are gone — LDAP owns them.
import { useEffect, useRef, useState } from 'react'
import { api } from '../api.ts'
import { applySession, setToken } from '../session.ts'
import { initCodes } from '../codes.ts'

const ALLOWED_AT_LOGIN = ['~00', '~01', '~02', '~4', '~6', '~3', '~99', '~8']

function Clock() {
  const [now, setNow] = useState(() => new Date())
  useEffect(() => {
    const t = setInterval(() => setNow(new Date()), 500)
    return () => clearInterval(t)
  }, [])
  return (
    <div className="flex items-center gap-4 text-xs text-muted">
      <span>{now.toLocaleDateString('en-GB')}</span>
      <span className="tabular-nums">{now.toLocaleTimeString('en-GB')}</span>
    </div>
  )
}

export default function Login({ onLogin }: { onLogin: () => void }) {
  const [userId, setUserId] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const passwordRef = useRef<HTMLInputElement>(null)

  const submit = (e: React.FormEvent) => {
    e.preventDefault()
    if (!userId.trim() || !password) {
      setError('Please enter User Id and Password')
      return
    }
    setBusy(true)
    setError(null)
    api
      .login(userId.trim().toUpperCase(), password)
      .then(async (r) => {
        if (r.status !== '000' || !r.session) {
          setError(r.message)
          setPassword('')
          return
        }
        const auth = r.session.authorityLevel + (r.session.authorityLevel2 ?? '')
        if (!ALLOWED_AT_LOGIN.some((code) => auth.includes(code))) {
          setError('You are not authorised to use this application')
          return
        }
        if (r.token) setToken(r.token)
        applySession(r.session)
        // Start the reference-code load now that the token is set, but do NOT
        // wait on it — the operator reaches the first screen immediately and
        // App swaps raw codes for labels when the sets arrive.
        void initCodes()
        onLogin()
      })
      .catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))
      .finally(() => setBusy(false))
  }

  return (
    <div className="relative flex min-h-screen items-center justify-center bg-page px-4 font-sans text-ink">
      <div className="pointer-events-none absolute inset-x-0 top-0 h-64 bg-gradient-to-b from-primary-soft/70 to-transparent" />

      <form
        onSubmit={submit}
        className="relative w-full max-w-md rounded-2xl border border-edge bg-surface p-8 shadow-sm"
      >
        <div className="mb-6 flex items-start justify-between">
          <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-gradient-to-br from-primary to-primary-strong text-white shadow-sm">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="h-6 w-6">
              <path d="M3 9.5 12 4l9 5.5" strokeLinecap="round" strokeLinejoin="round" />
              <path d="M5 10v7M9.5 10v7M14.5 10v7M19 10v7" strokeLinecap="round" />
              <path d="M3 20h18" strokeLinecap="round" />
            </svg>
          </div>
          <Clock />
        </div>

        <h1 className="text-lg font-semibold tracking-wide text-ink">STATIC DATA MAINTENANCE</h1>
        <p className="mt-1 text-sm font-medium text-muted">Logon Window</p>
        <p className="text-xs text-muted-soft">Ver 2.5 — Enquiry</p>

        {error && (
          <div className="mt-5 rounded-xl border border-danger/30 bg-danger-soft px-4 py-2.5 text-sm text-danger">
            {error}
          </div>
        )}

        <div className="mt-6 space-y-4">
          <label className="block">
            <span className="mb-1.5 block text-sm font-medium text-ink-soft">User Id</span>
            <input
              type="text"
              value={userId}
              maxLength={20}
              autoFocus
              autoComplete="username"
              onChange={(e) => setUserId(e.target.value)}
              onBlur={() => setUserId((u) => u.toUpperCase())}
              onKeyDown={(e) => {
                if (e.key === 'Enter' && userId.trim()) {
                  e.preventDefault()
                  passwordRef.current?.focus()
                }
              }}
              className="w-full rounded-lg border border-edge-strong bg-surface px-3.5 py-2.5 text-sm uppercase shadow-xs focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50"
            />
          </label>

          <label className="block">
            <span className="mb-1.5 block text-sm font-medium text-ink-soft">Password</span>
            <input
              ref={passwordRef}
              type="password"
              value={password}
              maxLength={16}
              autoComplete="current-password"
              onChange={(e) => {
                // Legacy rejects chars > 127 in the password field.
                setPassword(e.target.value.replace(/[^\x20-\x7e]/g, ''))
              }}
              className="w-full rounded-lg border border-edge-strong bg-surface px-3.5 py-2.5 text-sm shadow-xs focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50"
            />
          </label>
        </div>

        <div className="mt-7">
          <button
            type="submit"
            disabled={busy}
            className="inline-flex w-full items-center justify-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50 disabled:cursor-not-allowed disabled:bg-faint"
          >
            {busy ? 'Logging on…' : 'Login'}
          </button>
        </div>
      </form>
    </div>
  )
}
