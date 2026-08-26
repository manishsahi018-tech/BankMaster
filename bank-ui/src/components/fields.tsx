import type { ComponentProps, ReactNode } from 'react'
import { useT } from '../i18n/index.ts'

// Labels, placeholders and section headings are translated HERE rather than by
// the screens that use these primitives — the same rule GridScreen follows, so
// a screen's config stays in English and English stays the dictionary key.
// Nothing else is: option lists are reference-data descriptions that arrive
// from /api/codes already in the operator's language, and running them through
// t() would look up a customer's own data in a UI dictionary.

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
  const { t } = useT()
  return (
    <div className={className}>
      <label htmlFor={htmlFor} className="mb-1.5 block text-sm font-medium text-ink-soft">
        {t(label)}
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

// Boxed but non-editable — the enquiry-only counterpart to TextInput. Keeps the
// legacy forms' field-per-box look while making it obvious nothing is editable.
const readOnlyBase =
  'block w-full rounded-lg border border-edge bg-surface-muted px-3 py-2 text-sm text-muted ' +
  'shadow-xs focus:outline-none focus:ring-2 focus:ring-primary/25'

export function ReadOnlyInput({ className = '', ...props }: ComponentProps<'input'>) {
  return <input type="text" readOnly className={`${readOnlyBase} ${className}`} {...props} />
}

/**
 * An EDITABLE combo: a text box with a dropdown of suggestions.
 *
 * This is VB6's ComboBox Style 0, which is what most of the legacy forms
 * actually used — the operator picks a suggestion or types a value the list
 * does not offer. Select (below) is Style 2, the drop-down LIST, and the two
 * are not interchangeable: rendering a Style 0 combo as a Select silently
 * removes the ability to enter anything the list is missing, which matters
 * wherever the suggestion list comes from reference data that may be
 * incomplete or absent.
 *
 * Suggestions are the same "<code>-<description>" strings Select takes, so a
 * caller slices the code back out exactly as the legacy's Mid$(combo, 1, n)
 * did. A blank list is a legitimate state: the field is then plain free text,
 * which is precisely how the legacy behaved when its local lookup table had no
 * rows.
 */
export function Combo({
  className = '',
  options = [],
  listId,
  placeholder,
  ...props
}: ComponentProps<'input'> & { options?: string[]; listId: string }) {
  const { t } = useT()
  return (
    <>
      <input
        type="text"
        list={listId}
        placeholder={placeholder ? t(placeholder) : undefined}
        className={`${inputBase} ${className}`}
        {...props}
      />
      <datalist id={listId}>
        {options.map((opt) => (
          <option key={opt} value={opt} />
        ))}
      </datalist>
    </>
  )
}

export function Select({
  className = '',
  placeholder,
  options = [],
  ...props
}: ComponentProps<'select'> & { placeholder?: string; options?: string[] }) {
  const { t } = useT()
  return (
    <div className="relative">
      {/* All callers control the select via `value`; the empty-string option
          renders the placeholder while nothing is chosen. */}
      <select className={`${inputBase} appearance-none pe-9 ${className}`} {...props}>
        <option value="" disabled>
          {placeholder ? t(placeholder) : t('Select…')}
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
        className="pointer-events-none absolute end-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-soft"
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
  const { t } = useT()
  return (
    <section className="rounded-2xl border border-edge bg-surface p-5 shadow-sm sm:p-6">
      <div className="mb-5 flex gap-2.5">
        <span aria-hidden className="mt-0.5 h-4 w-1 shrink-0 rounded-full bg-primary" />
        <div>
          <h2 className="text-sm font-semibold text-ink">{t(title)}</h2>
          {description && <p className="mt-0.5 text-xs text-muted">{t(description)}</p>}
        </div>
      </div>
      {children}
    </section>
  )
}
