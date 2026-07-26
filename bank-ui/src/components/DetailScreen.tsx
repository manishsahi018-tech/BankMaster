import type { ReactNode } from 'react'
import { SectionCard, Field, ReadOnlyInput } from './fields.tsx'

// Shared layout for read-only detail screens (stop cheque, standing order,
// card, transaction, transfer, signatory details). Each legacy detail form
// is a thin config over this component.

export interface DetailField {
  label: string
  /** Plain scalars only — rendered into a read-only <input>, which cannot hold JSX. */
  value: string | number | null | undefined
  /** span two grid columns (long values like names/narratives) */
  wide?: boolean
}

const fieldId = (section: string, label: string) =>
  `${section}-${label}`.toLowerCase().replace(/[^a-z0-9]+/g, '-')

export interface DetailSection {
  title: string
  description?: string
  fields: DetailField[]
}

export interface DetailButton {
  label: string
  kind?: 'primary' | 'secondary' | 'danger'
  onClick: () => void
}

const btnKinds = {
  primary:
    'rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong',
  secondary:
    'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted',
  danger:
    'rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft',
}

export default function DetailScreen({
  kicker,
  title,
  subtitle,
  banner,
  chips = [],
  sections,
  buttons,
}: {
  kicker: string
  title: string
  subtitle?: string
  banner?: ReactNode
  chips?: { label: string; value?: ReactNode }[]
  sections: DetailSection[]
  buttons: DetailButton[]
}) {
  return (
    <main className="mx-auto max-w-6xl px-4 py-8 sm:px-6">
      <div className="mb-6">
        <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">{kicker}</p>
        <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">{title}</h1>
        {subtitle && <p className="mt-1 text-sm text-muted">{subtitle}</p>}
      </div>

      {banner}

      {chips.length > 0 && (
        <div className="mb-5 flex flex-wrap items-center gap-x-8 gap-y-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          {chips.map(({ label, value }) => (
            <div key={label}>
              <p className="text-xs text-muted-soft">{label}</p>
              <p dir="auto" className="mt-0.5 text-sm font-semibold text-ink">
                {value || '—'}
              </p>
            </div>
          ))}
        </div>
      )}

      <div className="grid gap-5">
        {sections.map((section) => (
          <SectionCard key={section.title} title={section.title} description={section.description}>
            <div className="grid gap-x-6 gap-y-4 sm:grid-cols-2 lg:grid-cols-4">
              {section.fields.map((f) => {
                const id = fieldId(section.title, f.label)
                return (
                  <Field
                    key={f.label}
                    label={f.label}
                    htmlFor={id}
                    className={f.wide ? 'sm:col-span-2' : ''}
                  >
                    {/* Blank columns render as an empty box rather than a dash —
                        same convention as frmAccct.frm / AccountMaintenance. */}
                    <ReadOnlyInput id={id} dir="auto" value={f.value == null ? '' : String(f.value)} />
                  </Field>
                )
              })}
            </div>
          </SectionCard>
        ))}

        <div className="flex flex-wrap items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          {buttons.map((btn) => (
            <button
              key={btn.label}
              type="button"
              onClick={btn.onClick}
              className={`${btnKinds[btn.kind ?? 'secondary']} ${btn.kind === 'danger' ? 'ml-auto' : ''}`}
            >
              {btn.label}
            </button>
          ))}
        </div>
      </div>
    </main>
  )
}
