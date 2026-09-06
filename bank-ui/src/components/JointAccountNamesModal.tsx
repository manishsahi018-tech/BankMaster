// frmJointAccName.frm — "Joint Account Names": the two 30-character cheque
// lines and the reports name held on the customer record.
//
// The legacy shows this as a modal in enquiry mode, with every box disabled,
// popped automatically when the operator leaves the joint holders grid
// (frmIndividualJoint.frm:2578-2603 cmdCancel_Click / :2610-2640 cmdDone_Click,
// under supervisorAction Or searchAction Or custHistoryAction). Here it is
// opened on demand from a button on that grid instead of ambushing the
// operator on the way out — same read-only content, same single dismiss.
import { useEffect } from 'react'
import { createPortal } from 'react-dom'
import { Field, RoText } from './legacyForm.tsx'
import { useT } from '../i18n/index.ts'

export default function JointAccountNamesModal({
  chequeLine1,
  chequeLine2,
  reportsName,
  onClose,
}: {
  chequeLine1?: string
  chequeLine2?: string
  reportsName?: string
  onClose: () => void
}) {
  const { t } = useT()

  // Escape closes, as it did on a VB6 modal (KeyPreview = True). The Close
  // button stays the only visible way out — there is nothing here to confirm.
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [onClose])

  return createPortal(
    <div
      role="dialog"
      aria-modal="true"
      aria-label={t('Joint Account Names')}
      className="fixed inset-0 z-[80] flex items-center justify-center bg-ink/50 p-4 backdrop-blur-[3px]"
    >
      <div className="w-full max-w-xl rounded-2xl border border-edge bg-surface p-5 shadow-2xl sm:p-6">
        <h2 className="text-lg font-semibold tracking-tight text-ink">
          {t('Joint Account Names')}
        </h2>

        <div className="mt-5 grid gap-4">
          {/* One label over two boxes, as the legacy laid it out: the caption
              carries "Line-1" and a second label alone carries "Line-2". */}
          <Field label="Joint Account Name on Cheque Line-1">
            <RoText value={chequeLine1} />
          </Field>
          <Field label="Line-2">
            <RoText value={chequeLine2} />
          </Field>
          <Field label="Joint Account Name on Reports">
            <RoText value={reportsName} />
          </Field>
        </div>

        <div className="mt-6 flex justify-end">
          <button
            type="button"
            autoFocus
            onClick={onClose}
            className="rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50"
          >
            {t('Close')}
          </button>
        </div>
      </div>
    </div>,
    document.body,
  )
}
