// Types for the generated archival-dictionary modules in ./tables/.

/** Normalized workbook datatype; unrecognized raw values stay as plain strings. */
export type SchemaFieldType = 'string' | 'date' | 'timestamp' | 'numeric' | (string & {})

export interface SchemaField {
  /** camelCase column name, as used in archival records */
  name: string
  /** display name from the workbook (ALL CAPS); a few rows omit it */
  label?: string
  type?: SchemaFieldType
  /** field length; the odd workbook row has a non-numeric size note */
  size?: number | string
  /** e.g. "YYYYMMDD", "YYYYMMDDHH24MISS", "16,3" */
  format?: string
  /** composite-key membership: key name → 1-based position */
  keys?: Partial<Record<'k1' | 'k2' | 'k3', number>>
  description?: string
  /** change note from the workbook's trailing columns */
  note?: string
}

export interface SchemaTable {
  name: string
  description?: string
  /** MasterSheet change status, e.g. "Table modified" */
  status?: string
  fields: SchemaField[]
}
