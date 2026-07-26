// Colored pill for legacy status codes in grid cells.
import type { ReactNode } from 'react'

export type Tone = keyof typeof TONES

const TONES = {
  success: 'bg-success-soft text-success',
  danger: 'bg-danger-soft text-danger',
  warn: 'bg-warn-soft text-warn',
  neutral: 'bg-surface-muted text-muted',
}

export default function StatusBadge({ value, tone = 'neutral' }: { value: ReactNode; tone?: Tone }) {
  return (
    <span
      className={`inline-flex items-center gap-1.5 whitespace-nowrap rounded-full px-2.5 py-0.5 text-xs font-medium ${TONES[tone]}`}
    >
      <span className="h-1.5 w-1.5 rounded-full bg-current opacity-70" />
      {value}
    </span>
  )
}

// Tone from the legacy status code conventions:
// 00-Open / 9-Update successful → good; 03/04/3-Rejected → bad; 08 → caution.
export function statusTone(text: unknown): Tone {
  const t = String(text ?? '')
  if (/^(00|9-)/.test(t)) return 'success'
  if (/^(03|04|3-)/.test(t)) return 'danger'
  if (/^08/.test(t)) return 'warn'
  return 'neutral'
}
