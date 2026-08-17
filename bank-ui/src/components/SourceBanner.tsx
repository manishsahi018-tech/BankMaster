import type { ReactNode } from 'react'

/**
 * The persistent "where this data comes from" notice at the top of a screen.
 *
 * A banner, never a toast. This is a STANDING CONDITION of the screen — it is
 * true the whole time the screen is open, it is not a response to an action,
 * and it must still be readable after the operator has clicked something else.
 * Toasts are for the transient half (validation, success, fetch failure); the
 * two must not be swapped, or a permanent caveat scrolls away after 7s.
 *
 * `tone` distinguishes the two cases a reader must not confuse:
 *   'demo'    the screen works, but the figures are synthetic because the real
 *             source is not connected in this environment
 *   'missing' the screen cannot fetch at all here
 *
 * Both say WHICH source is absent. "Not available" tells an operator nothing
 * and tells support less; naming the system means a second screen blocked on
 * the same gap is recognisably the same problem.
 */
export default function SourceBanner({
  tone = 'demo',
  title,
  children,
}: {
  tone?: 'demo' | 'missing'
  title: string
  children: ReactNode
}) {
  const styles =
    tone === 'missing'
      ? 'border-danger/40 bg-danger-soft text-danger'
      : 'border-warn/40 bg-warn-soft text-warn'
  return (
    <div className={`mb-5 rounded-2xl border px-4 py-3 text-sm sm:px-5 ${styles}`} role="status">
      <p className="font-semibold">{title}</p>
      <div className="mt-0.5 space-y-1">{children}</div>
    </div>
  )
}
