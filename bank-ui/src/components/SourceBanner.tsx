import type { ReactNode } from 'react'
import { useT } from '../i18n/index.ts'

/**
 * The persistent "this screen has no source to read" notice at the top of a
 * screen — currently the two cbrt01 enquiries (OnLine Statement Printing and
 * Transaction Enquiry) when the API answers 501.
 *
 * A banner, never a toast. This is a STANDING CONDITION of the screen — it is
 * true the whole time the screen is open, it is not a response to an action,
 * and it must still be readable after the operator has clicked something else.
 * Toasts are for the transient half (validation, success, fetch failure); the
 * two must not be swapped, or a permanent caveat scrolls away after 7s.
 *
 * It once carried a second, amber `tone` for the case where a screen WORKED but
 * its figures were synthetic. Both screens now read the archival database, so
 * that state cannot occur and the tone was removed rather than left as an
 * unreachable branch; a future screen that needs it should re-add it
 * deliberately, next to the caller that proves it happens.
 *
 * Always say WHICH source is absent. "Not available" tells an operator nothing
 * and tells support less; naming the system means a second screen blocked on
 * the same gap is recognisably the same problem.
 */
export default function SourceBanner({
  title,
  children,
}: {
  title: string
  children: ReactNode
}) {
  const { t } = useT()
  return (
    <div
      className="mb-5 rounded-2xl border border-danger/40 bg-danger-soft px-4 py-3 text-sm text-danger sm:px-5"
      role="status"
    >
      <p className="font-semibold">{t(title)}</p>
      <div className="mt-0.5 space-y-1">{children}</div>
    </div>
  )
}
