import { t } from '../i18n/index.ts'

// The statement screens' Download Excel button.
//
// It lives at the top RIGHT of the report rather than in the action bar with
// Generate and Print, and that is a distinction worth keeping: the action bar
// acts on the FORM — it is there before there is anything to act on, and its
// buttons grey out to say so — while this acts on the report underneath it. So
// it appears with the report and goes with it, which is the same rule the
// disabled state was expressing, said without a dead button.
//
// print-hidden is the caller's job, not this component's: the button sits
// inside the .print-page region on every screen that uses it, and a button
// printed onto a bank statement would be absurd.

function DownloadIcon() {
  return (
    <svg
      className="h-4 w-4 shrink-0"
      viewBox="0 0 20 20"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.6"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      <path d="M10 3v8.5" />
      <path d="m6.25 8.25 3.75 3.75 3.75-3.75" />
      <path d="M4 15.75h12" />
    </svg>
  )
}

export function DownloadExcelButton({
  onClick,
  busy = false,
}: {
  onClick: () => void
  /** True while the workbook is being built, which a long report takes a moment. */
  busy?: boolean
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      disabled={busy}
      title={t('Download this statement as an Excel workbook')}
      className="inline-flex items-center gap-2 rounded-lg border border-edge-strong bg-surface px-3.5 py-2
        text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted
        disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft"
    >
      <DownloadIcon />
      {busy ? t('Preparing…') : t('Download Excel')}
    </button>
  )
}
