// Domain shapes shared across screens — mirror the legacy message payloads
// (recvSearchMsg / account enquiry response), not the archival tables.

export type Customer = {
  custNo: string
  idType?: string
  idNo?: string
  telNo?: string
  telExt?: string
  firstName?: string
  secondName?: string
  lastName?: string
  shortName?: string
  branchCode?: string
  mainCategoryCode?: string
  subCategoryCode?: string
  /** display name, derived in App from shortName */
  name?: string
}

export type Account = {
  /** optional per-account overrides for the maintenance screen mock */
  maintenance?: Record<string, string>
  accountNumber: string
  bookBalance: string
  clearedBalance: string
  blockedBalance: string
  accountStatus: string
  creditLimit: string
  dormantFlag: string
}

export type SearchCriteria = {
  /** display label for the results screen, e.g. "Customer No" */
  label: string
  /** display value (card numbers arrive masked) */
  value: string
  /** query params for /api/customers — mirrors legacy reqMsgSearch fields */
  params: Record<string, string>
}
