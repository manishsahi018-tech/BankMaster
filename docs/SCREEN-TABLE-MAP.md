## Sign-on & search

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 1 | Login | Static Data Maintenance — Logon Window | `stuser`, `stusrbrn`, `stctltabBD`, `stctltab` |
| 2 | CustomerStaticData | Customer Static Data Maintenance | `stcusttab`, `stidtab`, `stcustlog`, `stcardtab` |
| 3 | EnquirySelect | Search Results | *(none — renders the rows the search already returned)* |

## Customer profile

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 4 | IndividualSaudi | Customer Profile | `stcusttab`, `stidtab`, `staddrtab` — history mode: `stcustlog`, `stidlog`, `staddrlog` |
| 5 | IndividualSaudiAcctInfo | Account Details | `stcusttab`, `staddrtab`, `stidtab` — history mode adds `stacclog` |
| 6 | IndividualOthers | Customer Profile | `stcusttab`, `stidtab`, `staddrtab` — history mode: `stcustlog`, `stidlog`, `staddrlog` |
| 7 | IndividualOthersPage2 | Customer Details | `stcusttab`, `staddrtab`, `stidtab` |
| 8 | IndividualOthersAcctInfo | Account Details | `stcusttab`, `staddrtab`, `stidtab` — history mode adds `stacclog` |
| 9 | JuristicMain | Customer Profile / Resident Juristic Customer / Non-Resident Juristic Customer *(3 variants, one file)* | `stcusttab`, `stidtab`, `staddrtab` |
| 10 | JuristicAccountInfo | Account Details | `stcusttab`, `staddrtab`, `stacclog`, `stidtab` |
| 11 | CustomerGeneric | Customer Maintenance | `stcusttab`, `stidtab`, `staddrtab` — history mode: `stcustlog`, `stidlog`, `staddrlog` |
| 12 | CustUpdateHistory | Customer Update History | `stcustlog` |
| 13 | EssentialDocuments | Documents for Sub Category | `stctltabDC`, `stcusttab`, `stcustlog` |
| 14 | profilePageFields | *(no title — shared field blocks reused by rows 4–10)* | *(none of its own)* |

## Related parties

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 15 | JointHolders | Joint Account Holders | `stjointtab` |
| 16 | JointHolderDetail | Joint Holder Details | `stjointtab`, `stidtab`, `staddrtab` |
| 17 | Owners | Owner / Management Details | `stowntab` |
| 18 | OwnerDetail | Owner Details | `stowntab`, `stidtab`, `staddrtab` |
| 19 | References | Reference / Legal Representative Details | `stcreftab` |
| 20 | HeirsProxy | Heirs / Proxy Details | `stheirtab` |
| 21 | PartyDetail | Heir Details / Reference Details | `stheirtab` or `stcreftab`, plus `stidtab`, `staddrtab` |
| 22 | SignatoryGrid | Signatory Details | `stsigntab` |
| 23 | SignatoryDetail | Signatory Details | `stsigntab`, `stidtab` |

## Accounts

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 24 | AccountInfo | Account Information | `gld0data` — plus `stctltabBD`, `stusrbrn` for the balance-enquiry restriction |
| 25 | AccountMaintenance | Account Maintenance | `gld0data`, `stacclog`, `stcusttab`, `stctltabMM`, `stctltabXC` |
| 26 | AcctUpdateHistory | Account Update History | `stacclog` |
| 27 | AcctStatusHistory | Account Status History | `stacclog` |
| 28 | SamaStatusHistory | SAMA Account Status History | `stacclog` *(the SAMA columns of it, not `stsamaacc`)* |
| 29 | BlockedAmountBreakup | Breakup of Blocked Amount | `gld0data`, `aad0data`, `bkd0data`, `ccarrblk`, `staccblk` |

## Cheques & standing orders

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 30 | ChequeBookGrid | Cheque Book Requests | `stchqtab` |
| 31 | ChequeBookHistory | Cheque Book History | `stchqtab` |
| 32 | StopChequeGrid | Stop Cheque Information | `pyd0data` |
| 33 | StopChequeDetail | Stop Cheque Details | `pyd0data`, `ststchqlog` |
| 34 | StandingOrderGrid | Standing Orders | `sod0data` |
| 35 | StandingOrderDetail | Standing Order Detail | `sod0data`, `stsodlog`, `gld0data`, `crd0data`, `stcusttab` |

## Cards

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 36 | CardGrid | Card Management | `stcardtab`, `stcusttab` |
| 37 | CardDetail | Card Maintenance | `stcardtab`, `stcusttab`, `stcardlog` |
| 38 | CardUpdateHistory | Card Update History | `stcardlog` |
| 39 | CardHistory | Card / Pin History | `stcardlog` |

## Transactions & transfers

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 40 | TransferEnquiry | Transfer Enquiry | `rid0data` |
| 41 | TransferDetail | Transfer Details | `rid0data`, `stcusttab` *(name, `crd0data` as fallback)*, `stswiftlog` |
| 42 | TransactionEnquiry | BM Transaction Enquiry | `thd0data` |
| 43 | TransactionDetail | Bankmaster Transaction Detail | `thd0data`, `stcusttab` *(name, `crd0data` as fallback)* |
| 44 | TransactionInquiry | Transaction Enquiry *(online / gateway)* | `crd0data`, `gld0data`, `thd0data`, `stctltabXC`, `stctltabBD` |

## Statements

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 45 | OnDemandStatement | OnLine Statement Printing | `crd0data`, `gld0data`, `thd0data`, `stctltabXC` |
| 46 | HistoricalStatement | Historical Statement Printing | `BM_TMT_HEADER`, `BM_STMT_TXN` *(statement DB)* |
| 47 | PdpStatement | Historical Statement Printing — PDP | `PDP_STMT_HEADER`, `PDP_STMT_TXN` *(statement DB)* |

## Shared lookups

Loaded once at sign-on through `/api/codes` and used by every dropdown and code
label on the screens above:

`stctltab`, `stctltabNA`, `stctltabSS`, `stctltabBD`, `stctltabXC`, `stctltabMM`,
`stctltabDC`, `rid0data`, `brcode`
