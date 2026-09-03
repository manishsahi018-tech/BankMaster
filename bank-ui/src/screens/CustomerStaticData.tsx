import { useState, type ChangeEvent, type FormEvent } from 'react'
import { Field, TextInput, Select, SectionCard } from '../components/fields.tsx'
import { useToast } from '../components/Toast.tsx'
import { ENQUIRY_RESTRICTIONS_ENABLED, hasAuthority, isMerchantOnly, session } from '../session.ts'
import { stcusttab, staccopencard, stcardtab } from '../schema/index.ts'
import { maskCardNo, maxLen } from '../schema/helpers.ts'
import type { SearchCriteria } from '../types.ts'
import { codeOptions } from '../codes.ts'

import { t } from '../i18n/index.ts'
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

// These five buttons exist on the legacy form but are Visible=0 at design time
// and no code path ever shows them — dormant features in VER 4.0.5. Kept behind
// this flag so they can be resurrected if a later version enables them.
const SHOW_DORMANT_FACILITIES = false

// The "Enquiries & Services" section. Historical Statement — Deleted A/c is
// wired (legacy cmdHistoricalStmt, frmCustomerSearch.frm:1177) and still shows
// only for ~87; PDP Statements sits beside it with no authority gate of its own
// (the endpoint still enforces ~60/~61/~62 on Generate), which is why the
// SECTION is no longer gated — a ~87 gate there would hide PDP from everyone
// who cannot do deleted-account statements. The dormant facilities beside them
// remain behind SHOW_DORMANT_FACILITIES.
const SHOW_ENQUIRIES_SERVICES = true

// Merchant Statement is off the search screen. The button is the ONLY way into
// frmMerchantStmt's port — App.tsx routes 'merchant' from nowhere else — so
// this takes the screen out of reach rather than just tidying the row. Kept as
// a flag rather than deleted for that reason: the screen, its ~81 gate and its
// validation are all still there and working, and flipping this to true is the
// whole of putting it back.
const SHOW_MERCHANT_STATEMENT = false

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

/**
 * What each field KEEPS when you type in it; everything else is blanked.
 *
 * Transcribed from the legacy _Change handlers in frmCustomerSearch.frm — the
 * rule is "one criterion at a time", with deliberate exceptions that mirror the
 * combinations processSearchRequest actually supports:
 *
 *   txtPhone keeps txtPhoneExt          -> the phone branch seeds both (:1615)
 *   cmbMainCategory <-> cmbSubCategory  -> the category branch seeds all 4 bytes
 *   txtFirstName keeps txtSecondName    -> the first-name branch continue-filters on it
 *   txtSecondName keeps txtLastName     -> ditto for the second-name branch
 *   txtLastName keeps txtSecondName
 *
 * Two legacy asymmetries are preserved rather than tidied, because they change
 * which branch runs: txtFirstName does NOT clear txtCrNo, and cmbBranch does not
 * either — so CR + name and CR + branch can coexist, and the server picks CR
 * (position 3 beats 5 and 9). txtPhoneExt has no _Change handler at all, so
 * typing an extension clears nothing.
 */
const KEEPS_ON_CHANGE: Record<string, string[]> = {
  customerNo: [],
  accountNo: [],
  cardNumber: [],
  idNumber: [],
  companyRegnNo: [],
  mobile: [],
  homePhone: ['extn'],
  extn: Object.keys(initialForm), // no txtPhoneExt_Change: clears nothing
  firstName: ['secondName', 'companyRegnNo'],
  secondName: ['lastName'],
  lastName: ['secondName'],
  mainCategory: ['subCategory'],
  subCategory: ['mainCategory'],
  branchCode: ['companyRegnNo'],
}


export default function CustomerStaticData({
  onSearch,
  onAccounts,
  onCards,
  onMerchant,
  onSadadTransactions,
  onDeletedAcctStatement,
  onPdpStatement,
}: {
  onSearch?: (criteria: SearchCriteria) => void
  onAccounts?: (custNo: string | null, accNo?: string, cardNo?: string) => void
  onCards?: (params: Record<string, string>) => void
  onMerchant?: () => void
  onSadadTransactions?: () => void
  onDeletedAcctStatement?: () => void
  onPdpStatement?: () => void
}) {
  const [form, setForm] = useState(initialForm)
  // Validation messages now surface as the shared top-center toast. The shim
  // keeps the existing setError('…') call sites working; setError('') is a no-op.
  const toast = useToast()
  const setError = (msg: string) => {
    if (msg) toast.warn(msg)
  }
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
  // With ENQUIRY_RESTRICTIONS_ENABLED off, customer search is open to every
  // logged-in operator. The legacy gate — which shut the Search button for a
  // ~99 installation user and for a merchant-only (~81 alone) operator — is
  // kept on the right so turning the switch back on restores it.
  const canSearchCustomer =
    !ENQUIRY_RESTRICTIONS_ENABLED || (!enquiryOnlyUser && !isMerchantOnly())

  // Digits-only fields. The legacy rejects non-numerics on keypress with
  // errOnlyNumeralsAllowed — txtCustomerNo, txtCardNumber, txtMobileNo,
  // txtPhone and txtPhoneExt only. txtAccountNumber, txtIdNo, txtCrNo and the
  // three name boxes are deliberately NOT restricted (an ID or CR number can
  // carry letters), so this list is exactly those five and no more.
  const NUMERIC_FIELDS: (keyof typeof initialForm)[] = [
    'customerNo',
    'cardNumber',
    'mobile',
    'homePhone',
    'extn',
  ]

  const set = (key: keyof typeof initialForm) => (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    // The C swallows the keystroke; filtering the value is the same net effect
    // without a dialog on every stray character.
    const value = NUMERIC_FIELDS.includes(key)
      ? e.target.value.replace(/\D/g, '')
      : e.target.value
    setError('')
    setForm((f) => {
      if (value.trim() === '') {
        return { ...f, [key]: value }   // the _Change handlers only fire on input
      }
      const keeps = KEEPS_ON_CHANGE[key] ?? []
      const next = { ...initialForm }
      for (const k of keeps) {
        next[k as keyof typeof initialForm] = f[k as keyof typeof initialForm]
      }
      // last, so a field that "keeps" itself (extn, which has no _Change
      // handler) still takes the new value rather than the previous one
      next[key] = value
      return next
    })
  }

  /**
   * The criterion the search actually runs on.
   *
   * This mirrors processSearchRequest's if/else-if chain (cbbranch.c:1555-1726)
   * — the SERVER's decision — not cmdCustomer_Click's caption chain
   * (frmCustomerSearch.frm:1083-1140), which only ever labelled the results
   * screen and never agreed with the server it was captioning. First non-blank
   * criterion wins, in this order:
   *
   *   1 custNo (:1555)   2 cardNo (:1562)   3 idNo-or-crNo (:1596)
   *   4 telNo  (:1610)   5 firstName (:1618)  6 secondName (:1654)
   *   7 lastName (:1683) 8 mainCategory (:1705)  9 branchCode (:1713)
   *  10 mobileNo (:1720)
   *
   * The account number is not a server criterion at all: doSearch folds it into
   * custNo before the request is built, and it OVERRIDES a typed customer
   * number (search.bas:27-31):
   *
   *   If Len(RTrim(txtAccountNumber)) > 0 Then
   *      custNo = Format(Mid$(txtAccountNumber, 6, 7), "0000000")
   *   Else
   *      custNo = Format(txtCustomerNo, "0000000")
   */
  const deriveCriteria = (): SearchCriteria | null => {
    const f = Object.fromEntries(Object.entries(form).map(([k, v]) => [k, v.trim()]))

    // 1. custNo — the account number wins over the customer number when both
    //    are filled (search.bas:27-31). Mid$ is 1-based: Mid$(acc, 6, 7) is
    //    the same seven characters as slice(5, 12).
    if (f.accountNo) {
      const embedded = f.accountNo.slice(5, 12)
      // A too-short account leaves this blank. The legacy sends the blanks on
      // and the server rejects them; zero-padding here would invent customer
      // "0000000" and quietly return someone else's records.
      if (embedded) {
        return {
          label: 'Account Number',
          value: f.accountNo,
          params: { custNo: embedded.padStart(7, '0') },
        }
      }
    }
    if (f.customerNo)
      return {
        label: 'Customer No',
        value: f.customerNo,
        params: { custNo: f.customerNo.padStart(7, '0') },
      }

    // 2. cardNo (:1562) — resolves to a customer server-side.
    if (f.cardNumber)
      return {
        label: 'Card Number',
        value: maskCardNo(f.cardNumber),
        params: { cardNo: f.cardNumber },
      }

    // 3. idNo, else crNo — ONE branch (:1596-:1607): the C takes idNo when
    //    non-blank and falls back to crNo, both against the same idNo column.
    if (f.idNumber) return { label: 'Id Number', value: f.idNumber, params: { idNo: f.idNumber } }
    if (f.companyRegnNo)
      return {
        label: 'Company Regn No',
        value: f.companyRegnNo,
        params: { crNo: f.companyRegnNo },
      }

    // 4. telNo (+ extn, which the C seeds but never re-checks -> ext >= given)
    if (f.homePhone)
      return {
        label: 'Tel Number',
        value: f.extn ? `${f.homePhone}-${f.extn}` : f.homePhone,
        params: f.extn ? { telNo: f.homePhone, telExt: f.extn } : { telNo: f.homePhone },
      }

    // 5-7. names — each name has its own branch, but the C carries the other
    //      two along as continue-filters, so one params group covers all three.
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

    // 8. mainCategory + subCategory (:1705) — BEFORE branch code.
    if (f.mainCategory)
      return {
        label: 'Main Category+Sub Category',
        value: `${f.mainCategory.slice(0, 2)}+${f.subCategory.slice(0, 2)}`,
        params: {
          mainCategoryCode: f.mainCategory.slice(0, 2),
          ...(f.subCategory && { subCategoryCode: f.subCategory.slice(0, 2) }),
        },
      }

    // 9. branchCode (:1713)
    if (f.branchCode)
      return {
        label: 'Branch Code',
        value: f.branchCode.slice(0, 4),
        params: { branchCode: f.branchCode.slice(0, 4) },
      }

    // 10. mobileNo (:1720) — the LAST branch, not the sixth.
    if (f.mobile) return { label: 'Mobile Number', value: f.mobile, params: { mobileNo: f.mobile } }

    return null
  }

  // cmdCustomer_Click: at least one search criterion must be supplied.
  const handleSearch = (e: FormEvent) => {
    e.preventDefault()
    // cmbSubCategory_Change (frmCustomerSearch.frm): a sub-category on its own
    // is refused outright — "Main Category should be selected first before
    // selecting sub category" — and the box is cleared.
    if (form.subCategory.trim() && !form.mainCategory.trim()) {
      setError('Main Category should be selected first before selecting sub category')
      setForm((s) => ({ ...s, subCategory: '' }))
      return
    }
    const criteria = deriveCriteria()
    if (!criteria) {
      // Nothing typed -> "enter a criterion". Something typed that the server
      // has no branch for (an extension with no phone, a too-short account
      // number) -> the legacy's errInvalidSearchCriteria: doSearch never sends
      // txtPhoneExt alone, so the C falls off the end of the chain.
      setError(
        Object.values(form).some((v) => v.trim() !== '')
          ? 'Invalid Search Criteria..Please review'
          : 'Please enter at least one search criterion before searching.',
      )
      return
    }
    setError('')
    onSearch?.(criteria)
  }

  // cmdAcctInfo_Click: account search (opcode 21) by customer / account /
  // card number, then the account grid. The customer number is either given
  // directly or embedded in account digits 6-12; a card number resolves to
  // the customer on the server (mock falls back to the sample customer).
  // cmdAcctInfo_Click -> legacy service 21 (processAccSearchRequest,
  // cbbranch2.c:5626-5723). The three branches are distinct and are NOT
  // interchangeable:
  //   custNo  -> index-3 range scan, every account of that customer
  //   accNo   -> index-1 isRead(ISEQUAL), THAT account only (:5720-5723, :5823)
  //   cardNo  -> resolve the card to its customer, then the custNo branch
  // Passing the account number through as an account number matters: slicing a
  // customer out of it turned an exact read into a whole-customer listing.
  const handleAccounts = () => {
    const custNo = form.customerNo.trim() ? form.customerNo.trim().padStart(7, '0') : null
    const accNo = custNo ? undefined : form.accountNo.trim() || undefined
    const cardNo = custNo || accNo ? undefined : form.cardNumber.trim() || undefined
    onAccounts?.(custNo, accNo, cardNo)
  }

  // cmdAtmCard_Click: card grid by customer / account / card number.
  const handleCards = () => {
    const f = Object.fromEntries(Object.entries(form).map(([k, v]) => [k, v.trim()]))
    if (f.customerNo) onCards?.({ custNo: f.customerNo.padStart(7, '0') })
    else if (f.accountNo) onCards?.({ accNo: f.accountNo })
    else if (f.cardNumber) onCards?.({ cardNo: f.cardNumber })
  }

  // cmdBillEnq_Click only proceeds with a customer no or account no — but the
  // form it opens (frmBillEnquiry, "Get Bill Details") asks the SADAD network
  // for a bill's LIVE status over Tuxedo (UTBLENQ/SADBILLENQ). No archival view
  // carries that, so the enquiry cannot run here and saying so beats a button
  // that validates its input and then does nothing.
  const handleBillEnquiry = () => {
    if (form.customerNo.trim() === '' && form.accountNo.trim() === '') {
      setError('Utility Bill Enquiry needs a customer number or account number.')
      return
    }
    setError(
      'Live bill status comes from the SADAD network, which this archival enquiry has no '
        + 'connection to. Use SADAD Transactions for payments the branch has already made.',
    )
  }

  return (
    <main className="mx-auto max-w-6xl px-4 py-8 sm:px-6">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-4">
        <div>
          <p className="text-xs font-medium uppercase tracking-wider text-primary-ink">
            {t('Customer Service')}
          </p>
          <h1 className="mt-1 text-2xl font-semibold tracking-tight text-ink">
            {t('Customer Static Data Maintenance')}
          </h1>
          <p className="mt-1 text-sm text-muted">
            {t('Look up a customer and maintain their static profile information.')}
          </p>
        </div>
      </div>

      <form className="grid gap-5" onSubmit={handleSearch}>

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
                  className="pointer-events-none absolute start-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-soft"
                >
                  <path
                    fillRule="evenodd"
                    d="M9 3.5a5.5 5.5 0 1 0 0 11 5.5 5.5 0 0 0 0-11ZM2 9a7 7 0 1 1 12.452 4.391l3.328 3.329a.75.75 0 1 1-1.06 1.06l-3.329-3.328A7 7 0 0 1 2 9Z"
                    clipRule="evenodd"
                  />
                </svg>
                <TextInput
                  id="customerNo"
                dir="ltr"
                  maxLength={MAX_LEN.customerNo}
                  className="ps-9"
                  placeholder={t('e.g. {example}', { example: '100245' })}
                  value={form.customerNo}
                  onChange={set('customerNo')}
                  autoFocus
                />
              </div>
            </Field>
            <Field label="Account No" htmlFor="accountNo">
              <TextInput
                id="accountNo"
                dir="ltr"
                maxLength={MAX_LEN.accountNo}
                placeholder={t('Account number')}
                value={form.accountNo}
                onChange={set('accountNo')}
              />
            </Field>
            <Field label="Card Number" htmlFor="cardNumber">
              <TextInput
                id="cardNumber"
                dir="ltr"
                maxLength={MAX_LEN.cardNumber}
                placeholder="•••• •••• •••• ••••"
                value={form.cardNumber}
                onChange={set('cardNumber')}
              />
            </Field>
            <Field label="ID Number" htmlFor="idNumber">
              <TextInput
                id="idNumber"
                dir="ltr"
                maxLength={MAX_LEN.idNumber}
                placeholder={t('National ID / Passport')}
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
                  dir="ltr"
                  placeholder={t('Home phone')}
                  value={form.homePhone}
                  onChange={set('homePhone')}
                />
              </Field>
              <Field label="Extn" htmlFor="extn">
                <TextInput id="extn" dir="ltr" placeholder={t('Ext.')} value={form.extn} onChange={set('extn')} />
              </Field>
              <Field label="Mobile Number" htmlFor="mobile" className="sm:col-span-3">
                <TextInput
                  id="mobile"
                dir="ltr"
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
                  dir="auto"
                  maxLength={MAX_LEN.firstName}
                  placeholder={t('First name')}
                  value={form.firstName}
                  onChange={set('firstName')}
                />
              </Field>
              <Field label="Second Name" htmlFor="secondName">
                <TextInput
                  id="secondName"
                  dir="auto"
                  maxLength={MAX_LEN.secondName}
                  placeholder={t('Second name')}
                  value={form.secondName}
                  onChange={set('secondName')}
                />
              </Field>
              <Field label="Last Name" htmlFor="lastName">
                <TextInput
                  id="lastName"
                  dir="auto"
                  maxLength={MAX_LEN.lastName}
                  placeholder={t('Last name')}
                  value={form.lastName}
                  onChange={set('lastName')}
                />
              </Field>
              <Field label="Company Regn No" htmlFor="companyRegnNo">
                <TextInput
                  id="companyRegnNo"
                dir="ltr"
                  maxLength={MAX_LEN.companyRegnNo}
                  placeholder={t('For corporate customers')}
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
              {t('Search')}
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
                {t('Customer')}
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
                {t('Account')}
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
                {t('ATM Cards')}
              </button>

              <button
                type="button"
                onClick={() => {
                  setForm(initialForm)
                  setError('')
                }}
                className="ms-auto rounded-lg border border-edge-strong bg-surface px-4 py-2.5 text-sm font-medium text-ink-soft shadow-xs transition-colors hover:bg-surface-muted"
              >
                {t('Reset')}
              </button>
            </div>
          </div>

          {SHOW_ENQUIRIES_SERVICES && (
            <div className="border-t border-edge-soft pt-4">
              <p className="mb-2.5 text-xs font-semibold uppercase tracking-wider text-muted-soft">
                {t('Enquiries & Services')}
              </p>
              <div className="flex flex-wrap items-center gap-3">
                {/* cmdHistoricalStmt: opens frmHistStmt with tag = "D" and
                    enables its account-number box, which the legacy does only
                    for ~87 — so the button itself is shown only for ~87 too. */}
                {hasAuthority('~87') && (
                  <button
                    type="button"
                    onClick={onDeletedAcctStatement}
                    title={t('Historical statement for deleted accounts')}
                    className={secondaryBtn}
                  >
                    {t('Historical Statement — Deleted A/c')}
                  </button>
                )}
                {SHOW_DORMANT_FACILITIES && (
                  <>
                    <button
                      type="button"
                      disabled={session.nameSearchAllowed !== '1'}
                      title={t('Free-text customer name search')}
                      className={secondaryBtn}
                    >
                      {t('Name Search')}
                    </button>
                    <button
                      type="button"
                      disabled={enquiryOnlyUser}
                      onClick={handleBillEnquiry}
                      title={t('Needs a customer number or account number')}
                      className={secondaryBtn}
                    >
                      {t('Utility Bill Enquiry')}
                    </button>
                    {/* Deliberately DORMANT, like the button above it: the
                        legacy reaches frmSadadMain — and through it the SADAD
                        transaction enquiry — from cmdBillEnq_Click
                        (frmCustomerSearch.frm:971), and that button is
                        Visible=0 in VER 4.0.5. The screen behind this one is
                        built and its stsadadlog source is real, so flipping
                        SHOW_DORMANT_FACILITIES turns it on; it stays off while
                        the legacy keeps it off. */}
                    <button
                      type="button"
                      onClick={() => onSadadTransactions?.()}
                      title="Payments the branch has made through SADAD"
                      className={secondaryBtn}
                    >
                      {t('SADAD Transactions')}
                    </button>
                    <button
                      type="button"
                      title={t('Pension enquiry — prefills from ID / account number')}
                      className={secondaryBtn}
                    >
                      {t('Pension Enquiry')}
                    </button>
                    <button
                      type="button"
                      disabled={enquiryOnlyUser}
                      title={t('Returned mail handling')}
                      className={secondaryBtn}
                    >
                      {t('Returned Mail Handling')}
                    </button>
                    <button
                      type="button"
                      disabled={enquiryOnlyUser}
                      title={t('Status of customers opened through phone')}
                      className={secondaryBtn}
                    >
                      {t('Customer Opened Through Phone')}
                    </button>
                  </>
                )}
                {/* The second archive DB #3 holds, which the Historical screen
                    deliberately does not read. No legacy button to mirror — the
                    legacy had no PDP screen — so this one sits last, after
                    everything that does. It needs no customer context: branch,
                    customer and account are keyed on the form itself, like the
                    Merchant Statement button beside it.

                    Named to match its neighbour rather than after the table
                    pair, because to the operator it is the same errand: an
                    archived statement, from the other archive. */}
                <button
                  type="button"
                  onClick={() => onPdpStatement?.()}
                  title={t('Archived PDP statements by customer or account number')}
                  className={secondaryBtn}
                >
                  {t('Historical Statement — PDP')}
                </button>

                {/* cmdMerchant — gated on ~81 alone (search.bas:89/257/432,
                    globalFunctions.bas:4511). It sat among the search actions,
                    which is where the legacy put it, but it searches nothing:
                    like the two statement buttons beside it, it needs no
                    customer context — the merchant number is keyed on the
                    statement form itself — so it belongs with the errands, not
                    with Customer / Account / ATM Cards. */}
                {SHOW_MERCHANT_STATEMENT && (
                  <button
                    type="button"
                    disabled={!hasAuthority('~81')}
                    onClick={() => onMerchant?.()}
                    title={
                      hasAuthority('~81')
                        ? 'Merchant statement facilities'
                        : 'Requires merchant statement authority (~81)'
                    }
                    className={secondaryBtn}
                  >
                    {t('Merchant Statement')}
                  </button>
                )}
              </div>
            </div>
          )}
        </div>
      </form>
    </main>
  )
}
