import { useState } from 'react'
import { SectionCard, TextInput, Field } from '../components/fields.tsx'
import type { Customer } from '../types.ts'

// Mirrors legacy frmDocuments.frm ("Essential Documents") — dual list of
// required documents for the sub-category vs documents submitted.

const DOCUMENT_LIST = [
  '001-Signature of a/c holder',
  '002-Thump Imprint/Personal Stamp',
  '008-Personal Id card of a/c holder',
  '009-Family regn book of a/c holder',
  '025-Valid passport copy',
  '051-A/C opening agreement',
  '074-Family Record',
]

const INITIAL_SUBMITTED = ['001-Signature of a/c holder', '008-Personal Id card of a/c holder']

function DocList({
  title,
  items,
  selected,
  onSelect,
}: {
  title: string
  items: string[]
  selected: string | null
  onSelect: (doc: string) => void
}) {
  return (
    <div className="flex-1">
      <p className="mb-2 text-sm font-semibold text-ink-soft">{title}</p>
      <ul className="h-64 overflow-y-auto rounded-xl border border-edge-strong bg-surface shadow-xs">
        {items.length === 0 && (
          <li className="px-3 py-8 text-center text-sm text-muted-soft">No documents</li>
        )}
        {items.map((doc) => (
          <li key={doc}>
            <button
              type="button"
              onClick={() => onSelect(doc)}
              className={`w-full px-3 py-2 text-left text-sm transition-colors ${
                selected === doc ? 'bg-primary text-white' : 'text-ink-soft hover:bg-surface-muted'
              }`}
            >
              {doc}
            </button>
          </li>
        ))}
      </ul>
    </div>
  )
}

export default function EssentialDocuments({
  customer,
  onOk,
  onExit,
}: {
  customer: Customer | null
  onOk: (result: { submitted: string[]; others: string }) => void
  onExit: () => void
}) {
  const [submitted, setSubmitted] = useState(INITIAL_SUBMITTED)
  const [selLeft, setSelLeft] = useState<string | null>(null)
  const [selRight, setSelRight] = useState<string | null>(null)
  const [others, setOthers] = useState('')

  const available = DOCUMENT_LIST.filter((d) => !submitted.includes(d))

  const add = () => {
    if (!selLeft) return
    setSubmitted((s) => [...s, selLeft].sort())
    setSelLeft(null)
  }
  const remove = () => {
    if (!selRight) return
    setSubmitted((s) => s.filter((d) => d !== selRight))
    setSelRight(null)
  }

  return (
    <main className="mx-auto max-w-5xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            Individual — Saudi National
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            Essential Documents
          </h1>
          <p className="mt-1 text-sm text-muted">
            Move the documents the customer has submitted to the right-hand list.
          </p>
        </div>
        <span className="rounded-full bg-primary-soft px-3 py-1.5 text-sm font-semibold text-primary-ink">
          Customer {customer?.custNo}
        </span>
      </div>

      <SectionCard title="Documents for Sub-Category">
        <div className="flex flex-col items-stretch gap-4 sm:flex-row sm:items-center">
          <DocList
            title="Documents List for Sub Category"
            items={available}
            selected={selLeft}
            onSelect={setSelLeft}
          />
          <div className="flex shrink-0 flex-row justify-center gap-2 sm:flex-col">
            <button
              type="button"
              onClick={add}
              disabled={!selLeft}
              title="Mark as submitted"
              className="rounded-lg border border-edge-strong bg-surface px-3 py-2 text-sm font-semibold text-ink-soft shadow-xs transition-colors hover:bg-surface-muted disabled:cursor-not-allowed disabled:text-faint"
            >
              »
            </button>
            <button
              type="button"
              onClick={remove}
              disabled={!selRight}
              title="Remove from submitted"
              className="rounded-lg border border-edge-strong bg-surface px-3 py-2 text-sm font-semibold text-ink-soft shadow-xs transition-colors hover:bg-surface-muted disabled:cursor-not-allowed disabled:text-faint"
            >
              «
            </button>
          </div>
          <DocList
            title="Documents Submitted"
            items={submitted}
            selected={selRight}
            onSelect={setSelRight}
          />
        </div>

        <div className="mt-5 border-t border-edge-soft pt-4">
          <Field label="Others" htmlFor="others">
            <TextInput
              id="others"
              value={others}
              onChange={(e) => setOthers(e.target.value)}
              placeholder="Any other document submitted"
            />
          </Field>
        </div>
      </SectionCard>

      <div className="mt-5 flex items-center gap-3 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
        <button
          type="button"
          onClick={() => onOk({ submitted, others })}
          className="rounded-lg bg-primary px-6 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong"
        >
          OK
        </button>
        <button
          type="button"
          onClick={onExit}
          className="rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
        >
          Exit
        </button>
      </div>
    </main>
  )
}
