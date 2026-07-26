import type { ComponentProps, ReactNode } from 'react'

export function Field({
  label,
  htmlFor,
  children,
  className = '',
}: {
  label: string
  htmlFor?: string
  children: ReactNode
  className?: string
}) {
  return (
    <div className={className}>
      <label htmlFor={htmlFor} className="mb-1.5 block text-sm font-medium text-ink-soft">
        {label}
      </label>
      {children}
    </div>
  )
}

const inputBase =
  'block w-full rounded-lg border border-edge-strong bg-surface px-3 py-2 text-sm text-ink ' +
  'placeholder:text-muted-soft shadow-xs transition-colors ' +
  'focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/25 ' +
  'disabled:cursor-not-allowed disabled:bg-surface-muted disabled:text-muted-soft'

export function TextInput({ className = '', ...props }: ComponentProps<'input'>) {
  return <input type="text" className={`${inputBase} ${className}`} {...props} />
}

export function Select({
  className = '',
  placeholder,
  options = [],
  ...props
}: ComponentProps<'select'> & { placeholder?: string; options?: string[] }) {
  return (
    <div className="relative">
      {/* All callers control the select via `value`; the empty-string option
          renders the placeholder while nothing is chosen. */}
      <select className={`${inputBase} appearance-none pr-9 ${className}`} {...props}>
        <option value="" disabled>
          {placeholder ?? 'Select…'}
        </option>
        {options.map((opt) => (
          <option key={opt} value={opt}>
            {opt}
          </option>
        ))}
      </select>
      <svg
        viewBox="0 0 20 20"
        fill="currentColor"
        className="pointer-events-none absolute right-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-soft"
      >
        <path
          fillRule="evenodd"
          d="M5.23 7.21a.75.75 0 0 1 1.06.02L10 11.17l3.71-3.94a.75.75 0 1 1 1.08 1.04l-4.25 4.5a.75.75 0 0 1-1.08 0l-4.25-4.5a.75.75 0 0 1 .02-1.06Z"
          clipRule="evenodd"
        />
      </svg>
    </div>
  )
}

export function SectionCard({
  title,
  description,
  children,
}: {
  title: string
  description?: string
  children: ReactNode
}) {
  return (
    <section className="rounded-2xl border border-edge bg-surface p-5 shadow-sm sm:p-6">
      <div className="mb-5 flex gap-2.5">
        <span aria-hidden className="mt-0.5 h-4 w-1 shrink-0 rounded-full bg-primary" />
        <div>
          <h2 className="text-sm font-semibold text-ink">{title}</h2>
          {description && <p className="mt-0.5 text-xs text-muted">{description}</p>}
        </div>
      </div>
      {children}
    </section>
  )
}
