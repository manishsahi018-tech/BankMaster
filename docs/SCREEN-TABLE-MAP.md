# Screen → Title → Source Tables

One row for every file in `bank-ui/src/screens` (46). "Title" is the heading the
screen shows; "Tables" are the archival views the API reads to fill it. Code /
lookup tables used only for dropdown labels are listed once at the bottom rather
than repeated on every row.

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
| 11 | CustUpdateHistory | Customer Update History | `stcustlog` |
| 12 | EssentialDocuments | Documents for Sub Category | `stctltabDC`, `stcusttab`, `stcustlog` |
| 13 | profilePageFields | *(no title — shared field blocks reused by rows 4–10)* | *(none of its own)* |

## Related parties

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 14 | JointHolders | Joint Account Holders | `stjointtab` |
| 15 | JointHolderDetail | Joint Holder Details | `stjointtab`, `stidtab`, `staddrtab` |
| 16 | Owners | Owner / Management Details | `stowntab` |
| 17 | OwnerDetail | Owner Details | `stowntab`, `stidtab`, `staddrtab` |
| 18 | References | Reference / Legal Representative Details | `stcreftab` |
| 19 | HeirsProxy | Heirs / Proxy Details | `stheirtab` |
| 20 | PartyDetail | Heir Details / Reference Details | `stheirtab` or `stcreftab`, plus `stidtab`, `staddrtab` |
| 21 | SignatoryGrid | Signatory Details | `stsigntab` |
| 22 | SignatoryDetail | Signatory Details | `stsigntab`, `stidtab` |

## Accounts

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 23 | AccountInfo | Account Information | `gld0data` — plus `stctltabBD`, `stusrbrn` for the balance-enquiry restriction |
| 24 | AccountMaintenance | Account Maintenance | `gld0data`, `stacclog`, `stcusttab`, `stctltabMM`, `stctltabXC` |
| 25 | AcctUpdateHistory | Account Update History | `stacclog` |
| 26 | AcctStatusHistory | Account Status History | `stacclog` |
| 27 | SamaStatusHistory | SAMA Account Status History | `stacclog` *(the SAMA columns of it, not `stsamaacc`)* |
| 28 | BlockedAmountBreakup | Breakup of Blocked Amount | `gld0data`, `aad0data`, `bkd0data`, `ccarrblk`, `staccblk` |

## Cheques & standing orders

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 29 | ChequeBookGrid | Cheque Book Requests | `stchqtab` |
| 30 | ChequeBookHistory | Cheque Book History | `stchqtab` |
| 31 | StopChequeGrid | Stop Cheque Information | `pyd0data` |
| 32 | StopChequeDetail | Stop Cheque Details | `pyd0data`, `ststchqlog` |
| 33 | StandingOrderGrid | Standing Orders | `sod0data` |
| 34 | StandingOrderDetail | Standing Order Detail | `sod0data`, `stsodlog`, `gld0data`, `crd0data`, `stcusttab` |

## Cards

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 35 | CardGrid | Card Management | `stcardtab`, `stcusttab` |
| 36 | CardDetail | Card Maintenance | `stcardtab`, `stcusttab`, `stcardlog` |
| 37 | CardUpdateHistory | Card Update History | `stcardlog` |
| 38 | CardHistory | Card / Pin History | `stcardlog` |

## Transactions & transfers

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 39 | TransferEnquiry | Transfer Enquiry | `rid0data` |
| 40 | TransferDetail | Transfer Details | `rid0data`, `stcusttab` *(name, `crd0data` as fallback)*, `stswiftlog` |
| 41 | TransactionEnquiry | BM Transaction Enquiry | `thd0data` |
| 42 | TransactionDetail | Bankmaster Transaction Detail | `thd0data`, `stcusttab` *(name, `crd0data` as fallback)* |
| 43 | TransactionInquiry | Transaction Enquiry *(online / gateway)* | `crd0data`, `gld0data`, `thd0data`, `stctltabXC`, `stctltabBD` |

## Statements

| # | Screen | Title on screen | Tables |
|---|---|---|---|
| 44 | OnDemandStatement | OnLine Statement Printing | `crd0data`, `gld0data`, `thd0data`, `stctltabXC` |
| 45 | HistoricalStatement | Historical Statement Printing | `STMT_HDR`, `STMT_TXN` *(statement DB)* |
| 46 | PdpStatement | Historical Statement Printing — PDP | `PDP_STMT_HDR`, `PDP_STMT_TXN` *(statement DB)* |

## Shared lookups

Loaded once at sign-on through `/api/codes` and used by every dropdown and code
label on the screens above:

`stctltab`, `stctltabNA`, `stctltabSS`, `stctltabBD`, `stctltabXC`, `stctltabMM`,
`stctltabDC`, `rid0data`, `brcode`

Branch access control — which branches a user may enquire on — reads `stusrbrn`
and `stctltabBD`.
