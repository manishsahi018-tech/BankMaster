import { useState, type ChangeEvent, type FormEvent } from 'react'
import { Field, TextInput, Select, SectionCard } from '../components/fields.tsx'
import { hasAuthority, isMerchantOnly, session } from '../session.ts'
import { stcusttab, staccopencard, stcardtab } from '../schema/index.ts'
import { maskCardNo, maxLen } from '../schema/helpers.ts'
import type { SearchCriteria } from '../types.ts'
import { codeOptions } from '../codes.ts'

// Mirrors legacy frmCustomerSearch.frm (frmEnquiry) from CSD for CBS-CMS VER 4.0.5.
// Combo values come from /api/codes (legacy samamaincategoryinfo /
// samasubcategoryinfo / branchinfo tables) as "<code>-<name>"; the literals
// are only the API-down fallback. Resolved inside the component so the
// lookup happens after initCodes() (module scope would run too early).

// MaxLength values from the archival data dictionary field sizes. Note the
// legacy form allowed 8/16 for customer/account no, but the dictionary caps
// custNo at 7 and accNo at 14 — the dictionary wins.
const MAX_LEN = {
  customerNo: maxLen(stcusttab, 'custNo'), // 7
  accountNo: maxLen(staccopencard, 'accNo'), // 14
  cardNumber: maxLen(stcardtab, 'cardNo'), // 19
  idNumber: maxLen(stcusttab, 'idNo'), // 15
  mobile: maxLen(stcusttab, 'mobileNo'), // 10
  firstName: maxLen(stcusttab, 'eFirstName'), // 15
  secondName: maxLen(stcusttab, 'e2ndName'), // 15
  lastName: maxLen(stcusttab, 'eLastName'), // 15
  companyRegnNo: maxLen(stcusttab, 'crNo'), // 15
}

// Legacy txt<Identifier>_Change handlers blank out every other criterion,
// so a search always runs on exactly one identifier.
const IDENTIFIER_FIELDS = ['customerNo', 'accountNo', 'cardNumber', 'idNumber']

// These five buttons exist on the legacy form but are Visible=0 at design time
// and no code path ever shows them — dormant features in VER 4.0.5. Kept behind
// this flag so they can be resurrected if a later version enables them.
const SHOW_DORMANT_FACILITIES = false

const secondaryBtn =
  'rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft ' +
  'shadow-xs transition-colors hover:bg-surface-muted ' +
  'disabled:cursor-not-allowed disabled:border-edge disabled:bg-surface-muted disabled:text-muted-soft'

const initialForm = {
  customerNo: '',
  accountNo: '',
  cardNumber: '',
  idNumber: '',
  homePhone: '',
  extn: '',
  mobile: '',
  firstName: '',
  secondName: '',
  lastName: '',
  companyRegnNo: '',
  mainCategory: '',
  subCategory: '',
  branchCode: '',
}

export default function CustomerStaticData({
  onSearch,
  onAccounts,
  onCards,
}: {
  onSearch?: (criteria: SearchCriteria) => void
  onAccounts?: (custNo: string | null, cardNo?: string) => void
  onCards?: (params: Record<string, string>) => void
}) {
  const [form, setForm] = useState(initialForm)
  const [error, setError] = useState('')
  const MAIN_CATEGORIES = codeOptions('samaMainCategory', ['01-Individual', '02-Corporate'])
  const SUB_CATEGORIES = codeOptions('samaSubCategory', ['01-Savings', '02-Current'])
  const BRANCH_CODES = codeOptions('branch', ['0001-Head Office'])

  // cmdAcctInfo/cmdAtmCard need a customer no, account no or card number,
  // combined with the operator's authority level from the login response.
  const hasLookupIdentifier =
    form.customerNo.trim() !== '' || form.accountNo.trim() !== '' || form.cardNumber.trim() !== ''
  const canOpenAccounts = hasLookupIdentifier && (hasAuthority('~6') || hasAuthority('~32'))
  const canOpenAtmCards = hasLookupIdentifier && hasAuthority('~4')
  const enquiryOnlyUser = hasAuthority('~99')
  const canSearchCustomer = !enquiryOnlyUser && !isMerchantOnly()

  const set = (key: keyof typeof initialForm) => (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const value = e.target.value
    setError('')
    setForm((f) => {
      if (IDENTIFIER_FIELDS.includes(key) && value.trim() !== '') {
        return { ...initialForm, [key]: value }
      }
      return { ...f, [key]: value }
    })
  }

  // cmdCustomer_Click derives the criterion shown on the results screen in
  // this exact priority order.
  // The params object mirrors the legacy reqMsgSearch (service 16) fields
  // sent to /api/customers. An account-number search derives the customer
  // number from account digits 6-12 (Mid$(accountNumber, 6, 7)), as the
  // legacy client did — reqMsgSearch has no account-number field.
  const deriveCriteria = (): SearchCriteria | null => {
    const f = Object.fromEntries(Object.entries(form).map(([k, v]) => [k, v.trim()]))
    if (f.customerNo)
      return {
        label: 'Customer No',
        value: f.customerNo,
        params: { custNo: f.customerNo.padStart(7, '0') },
      }
    if (f.accountNo)
      return {
        label: 'Account Number',
        value: f.accountNo,
        params: { custNo: f.accountNo.slice(5, 12).padStart(7, '0') },
      }
    if (f.cardNumber)
      return {
        label: 'Card Number',
        value: maskCardNo(f.cardNumber),
        params: { cardNo: f.cardNumber },
      }
    if (f.idNumber) return { label: 'Id Number', value: f.idNumber, params: { idNo: f.idNumber } }
    if (f.homePhone)
      return {
        label: 'Tel Number',
        value: f.extn ? `${f.homePhone}-${f.extn}` : f.homePhone,
        params: f.extn ? { telNo: f.homePhone, telExt: f.extn } : { telNo: f.homePhone },
      }
    if (f.mobile) return { label: 'Mobile Number', value: f.mobile, params: { mobileNo: f.mobile } }
    if (f.firstName || f.secondName || f.lastName) {
      const parts = [
        f.firstName && ['First Name', f.firstName],
        f.secondName && ['Second Name', f.secondName],
        f.lastName && ['Last Name', f.lastName],
      ].filter(Boolean) as [string, string][]
      return {
        label: parts.map(([l]) => l).join('+'),
        value: parts.map(([, v]) => v).join('+'),
        params: {
          ...(f.firstName && { firstName: f.firstName }),
          ...(f.secondName && { secondName: f.secondName }),
          ...(f.lastName && { lastName: f.lastName }),
        },
      }
    }
    if (f.companyRegnNo)
      return {
        label: 'Company Regn No',
        value: f.companyRegnNo,
        params: { crNo: f.companyRegnNo },
      }
    if (f.branchCode)
      return {
        label: 'Branch Code',
        value: f.branchCode.slice(0, 4),
        params: { branchCode: f.branchCode.slice(0, 4) },
      }
    if (f.mainCategory)
      return {
        label: 'Main Category+Sub Category',
        value: `${f.mainCategory.slice(0, 2)}+${f.subCategory.slice(0, 2)}`,
        params: {
          mainCategoryCode: f.mainCategory.slice(0, 2),
          ...(f.subCategory && { subCategoryCode: f.subCategory.slice(0, 2) }),
        },
      }
    return null
  }

  // cmdCustomer_Click: at least one search criterion must be supplied.
  const handleSearch = (e: FormEvent) => {
    e.preventDefault()
    const criteria = deriveCriteria()
    if (!criteria && !Object.values(form).some((v) => v.trim() !== '')) {
      setError('Please enter at least one search criterion before searching.')
      return
    }
    setError('')
    if (criteria) onSearch?.(criteria)
  }

  // cmdAcctInfo_Click: account search (opcode 21) by customer / account /
  // card number, then the account grid. The customer number is either given
  // directly or embedded in account digits 6-12; a card number resolves to
  // the customer on the server (mock falls back to the sample customer).
  const handleAccounts = () => {
    const custNo = form.customerNo.trim()
      ? form.customerNo.trim().padStart(7, '0')
      : form.accountNo.trim()
        ? form.accountNo.trim().slice(5, 12).padStart(7, '0')
        : null
    onAccounts?.(custNo, custNo ? undefined : form.cardNumber.trim() || undefined)
  }

  // cmdAtmCard_Click: card grid by customer / account / card number.
  const handleCards = () => {
    const f = Object.fromEntries(Object.entries(form).map(([k, v]) => [k, v.trim()]))
    if (f.customerNo) onCards?.({ custNo: f.customerNo.padStart(7, '0') })
    else if (f.accountNo) onCards?.({ accNo: f.accountNo })
    else if (f.cardNumber) onCards?.({ cardNo: f.cardNumber })
  }

  // cmdBillEnq_Click only proceeds with a customer no or account no.
  const handleBillEnquiry = () => {
    if (form.customerNo.trim() === '' && form.accountNo.trim() === '') {
      setError('Utility Bill Enquiry needs a customer number or account number.')
      return
    }
    setError('')
  }

  return (
    <main className="mx-auto max-w-6xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            Customer Service
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            Customer Static Data Maintenance
          </h1>
          <p className="mt-1 text-sm text-muted">
            Look up a customer and maintain their static profile information.
          </p>
        </div>
        <span className="rounded-full bg-surface-muted px-3 py-1.5 text-xs font-medium text-muted">
          Signed in as {session.userName} · Branch {session.branchCode}
        </span>
      </div>

      <form className="grid gap-5" onSubmit={handleSearch}>
        {error && (
          <div className="flex items-center gap-2.5 rounded-xl border border-warn/40 bg-warn-soft px-4 py-3 text-sm text-warn">
            <svg viewBox="0 0 20 20" fill="currentColor" className="h-5 w-5 shrink-0 text-warn">
              <path
                fillRule="evenodd"
                d="M8.485 2.495c.673-1.167 2.357-1.167 3.03 0l6.28 10.875c.673 1.167-.17 2.625-1.516 2.625H3.72c-1.347 0-2.189-1.458-1.515-2.625L8.485 2.495ZM10 5a.75.75 0 0 1 .75.75v3.5a.75.75 0 0 1-1.5 0v-3.5A.75.75 0 0 1 10 5Zm0 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"
                clipRule="evenodd"
              />
            </svg>
            {error}
          </div>
        )}

        <SectionCard
          title="Customer Lookup"
          description="Search by one identifier — entering an identifier clears the other criteria, as in the legacy system."
        >
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <Field label="Customer No" htmlFor="customerNo">
              <div className="relative">
                <svg
                  viewBox="0 0 20 20"
                  fill="currentColor"
                  className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-soft"
                >
                  <path
                    fillRule="evenodd"
                    d="M9 3.5a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11ZM2 9a7 7 0 1 1 12.452 4.391l3.328 3.329a.75.75 0 1 1-1.06 1.06l-3.329-3.328A7 7 0 0 1 2 9Z"
                    clipRule="evenodd"
                  />
                </svg>
                <TextInput
                  id="customerNo"
                  maxLength={MAX_LEN.customerNo}
                  className="pl-9"
                  placeholder="e.g. 100245"
                  value={form.customerNo}
                  onChange={set('customerNo')}
                  autoFocus
                />
              </div>
            </Field>
            <Field label="Account No" htmlFor="accountNo">
              <TextInput
                id="accountNo"
                maxLength={MAX_LEN.accountNo}
                placeholder="Account number"
                value={form.accountNo}
                onChange={set('accountNo')}
              />
            </Field>
            <Field label="Card Number" htmlFor="cardNumber">
              <TextInput
                id="cardNumber"
                maxLength={MAX_LEN.cardNumber}
                placeholder="•••• •••• •••• ••••"
                value={form.cardNumber}
                onChange={set('cardNumber')}
              />
            </Field>
            <Field label="ID Number" htmlFor="idNumber">
              <TextInput
                id="idNumber"
                maxLength={MAX_LEN.idNumber}
                placeholder="National ID / Passport"
                value={form.idNumber}
                onChange={set('idNumber')}
              />
            </Field>
          </div>
        </SectionCard>

        <div className="grid gap-5 lg:grid-cols-2">
          <SectionCard title="Contact Details">
            <div className="grid gap-4 sm:grid-cols-3">
              <Field label="Home Phone No" htmlFor="homePhone" className="sm:col-span-2">
                <TextInput
                  id="homePhone"
                  placeholder="Home phone"
                  value={form.homePhone}
                  onChange={set('homePhone')}
                />
              </Field>
              <Field label="Extn" htmlFor="extn">
                <TextInput id="extn" placeholder="Ext." value={form.extn} onChange={set('extn')} />
              </Field>
              <Field label="Mobile Number" htmlFor="mobile" className="sm:col-span-3">
                <TextInput
                  id="mobile"
                  maxLength={MAX_LEN.mobile}
                  placeholder="+254 7XX XXX XXX"
                  value={form.mobile}
                  onChange={set('mobile')}
                />
              </Field>
            </div>
          </SectionCard>

          <SectionCard title="Customer Names">
            <div className="grid gap-4 sm:grid-cols-2">
              <Field label="First Name" htmlFor="firstName">
                <TextInput
                  id="firstName"
                  maxLength={MAX_LEN.firstName}
                  placeholder="First name"
                  value={form.firstName}
                  onChange={set('firstName')}
                />
              </Field>
              <Field label="Second Name" htmlFor="secondName">
                <TextInput
                  id="secondName"
                  maxLength={MAX_LEN.secondName}
                  placeholder="Second name"
                  value={form.secondName}
                  onChange={set('secondName')}
                />
              </Field>
              <Field label="Last Name" htmlFor="lastName">
                <TextInput
                  id="lastName"
                  maxLength={MAX_LEN.lastName}
                  placeholder="Last name"
                  value={form.lastName}
                  onChange={set('lastName')}
                />
              </Field>
              <Field label="Company Regn No" htmlFor="companyRegnNo">
                <TextInput
                  id="companyRegnNo"
                  maxLength={MAX_LEN.companyRegnNo}
                  placeholder="For corporate customers"
                  value={form.companyRegnNo}
                  onChange={set('companyRegnNo')}
                />
              </Field>
            </div>
          </SectionCard>
        </div>

        <SectionCard
          title="Classification"
          description="Categorisation used for reporting and branch assignment."
        >
          <div className="grid gap-4 sm:grid-cols-3">
            <Field label="Main Category" htmlFor="mainCategory">
              <Select
                id="mainCategory"
                placeholder="Select main category"
                options={MAIN_CATEGORIES}
                value={form.mainCategory}
                onChange={set('mainCategory')}
              />
            </Field>
            <Field label="Sub Category" htmlFor="subCategory">
              <Select
                id="subCategory"
                placeholder="Select sub category"
                options={SUB_CATEGORIES}
                value={form.subCategory}
                onChange={set('subCategory')}
              />
            </Field>
            <Field label="Branch Code" htmlFor="branchCode">
              <Select
                id="branchCode"
                placeholder="Select branch"
                options={BRANCH_CODES}
                value={form.branchCode}
                onChange={set('branchCode')}
              />
            </Field>
          </div>
        </SectionCard>

        <div className="grid gap-5 rounded-2xl border border-edge bg-surface p-4 shadow-sm sm:p-5">
          <div>
            <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
              Search
            </p>
            <div className="flex flex-wrap items-center gap-3">
              <button
                type="submit"
                disabled={!canSearchCustomer}
                className="inline-flex items-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-strong focus:outline-none focus-visible:ring-2 focus-visible:ring-primary/50 disabled:cursor-not-allowed disabled:bg-faint"
              >
                <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4">
                  <path d="M10 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM3.465 14.493a1.23 1.23 0 0 0 .41 1.412A9.957 9.957 0 0 0 10 18c2.31 0 4.438-.784 6.131-2.1.43-.333.604-.903.408-1.41a7.002 7.002 0 0 0-13.074.003Z" />
                </svg>
                Customer
              </button>

              <button
                type="button"
                disabled={!canOpenAccounts}
                onClick={handleAccounts}
                title={
                  canOpenAccounts
                    ? 'Opens the account grid'
                    : 'Enter a customer no, account no or card number first'
                }
                className={secondaryBtn}
              >
                Account
              </button>

              <button
                type="button"
                disabled={!canOpenAtmCards}
                onClick={handleCards}
                title={
                  canOpenAtmCards
                    ? 'Opens the card grid'
                    : 'Enter a customer no, account no or card number first'
                }
                className={secondaryBtn}
              >
                ATM Cards
              </button>

              <button
                type="button"
                disabled={!hasAuthority('~81')}
                title="Merchant statement facilities"
                className={secondaryBtn}
              >
                Merchant
              </button>

              <button
                type="button"
                onClick={() => {
                  setForm(initialForm)
                  setError('')
                }}
                className="ml-auto rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
              >
                Cancel
              </button>
              <button
                type="button"
                className="rounded-lg border border-danger/30 bg-surface px-4 py-2.5 text-sm font-medium text-danger shadow-xs transition-colors hover:bg-danger-soft"
              >
                Exit
              </button>
            </div>
          </div>

          {(hasAuthority('~87') || SHOW_DORMANT_FACILITIES) && (
            <div className="border-t border-edge-soft pt-4">
              <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
                Enquiries &amp; Services
              </p>
              <div className="flex flex-wrap items-center gap-3">
                {hasAuthority('~87') && (
                  <button
                    type="button"
                    title="Historical statement for deleted accounts"
                    className={secondaryBtn}
                  >
                    Historical Statement — Deleted A/c
                  </button>
                )}
                {SHOW_DORMANT_FACILITIES && (
                  <>
                    <button
                      type="button"
                      disabled={session.nameSearchAllowed !== '1'}
                      title="Free-text customer name search"
                      className={secondaryBtn}
                    >
                      Name Search
                    </button>
                    <button
                      type="button"
                      disabled={enquiryOnlyUser}
                      onClick={handleBillEnquiry}
                      title="Needs a customer number or account number"
                      className={secondaryBtn}
                    >
                      Utility Bill Enquiry
                    </button>
                    <button
                      type="button"
                      title="Pension enquiry — prefills from ID / account number"
                      className={secondaryBtn}
                    >
                      Pension Enquiry
                    </button>
                    <button
                      type="button"
                      disabled={enquiryOnlyUser}
                      title="Returned mail handling"
                      className={secondaryBtn}
                    >
                      Returned Mail Handling
                    </button>
                    <button
                      type="button"
                      disabled={enquiryOnlyUser}
                      title="Status of customers opened through phone"
                      className={secondaryBtn}
                    >
                      Customer Opened Through Phone
                    </button>
                  </>
                )}
              </div>
            </div>
          )}
        </div>
      </form>
    </main>
  )
}
