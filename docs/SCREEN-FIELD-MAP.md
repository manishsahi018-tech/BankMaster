# Screen → Table → Fields

Field-level companion to [SCREEN-TABLE-MAP.md](SCREEN-TABLE-MAP.md). For each
screen: which table, which columns are selected from it, and what the read is
keyed on.

Two things are true of every read and are not repeated below:

- every archival table is filtered on `BankingDate` (the restore snapshot);
- code columns (`accStatus`, `idType`, `nationality`, …) are turned into labels
  from the `/api/codes` payload — see the last section — not by the screen query.

---

## 1. Login

| Table | Fields | Keyed on |
|---|---|---|
| `stuser` | userId, firstName, secondName, thirdName, lastName, branchCode, authorityLevel, authorityLevel2, langPreferred, liveStatus | userId |
| `stctltabBD` | nameSearchAllowed | branchCode |
| `stusrbrn` | noOfBranchesDefined, Branchcode1…Branchcode5 | userId |

## 2. CustomerStaticData

| Table | Fields | Keyed on |
|---|---|---|
| `stcusttab` | custNo, idType, idNo, telHomeNo, telHomeExt, aFirstName, a2ndName, aLastName, eFirstName, e2ndName, eLastName, aShortName, eShortName, aOrgShortName, eOrgShortName, custType, preferredLang, branchCode, samaMainCategory, samaSubCategory | one of: custNo / idNo / lastName prefix / category pair |
| `stidtab` | same row shape, reached through the ID-number search | idType + idNo |
| `stcustlog` | same row shape, for the history search | custNo |
| `stcardtab` | custNo (or `SUBSTR(bmAccNo, 6, 7)`) — resolves a card number to its customer, then the search runs as above | cardNo |

## 3. EnquirySelect

No query of its own — it renders the rows screen 2 returned.

## 4. IndividualSaudi · 6. IndividualOthers  (Customer Profile)

| Table | Fields | Keyed on |
|---|---|---|
| `stcusttab` | custNo, custType, samaMainCategory, samaSubCategory, branchCode, nationality, preferredLang, idType, idNo, idIssuedAt, idIssueDateH/G, idExpiryDateH/G, aFirstName, a2ndName, a3rdName, aLastName, aShortName, eFirstName, e2ndName, e3rdName, eLastName, eShortName, aOrgName1, aOrgName2, aOrgShortName, eOrgName1, eOrgName2, eOrgShortName, orgAlphaSearchCode, crNo, crIssuedAt, crIssueDateH/G, crIssueDateType, dobDateH/G, dobDateType, sexCode, marritalStatus, businessType, address1, address2, poBox, cityName, zipCode, country, addressType, unitNo, gprsNo, telHomeNo, telHomeAreaCode, telHomeExt, telOffNo, telOffAreaCode, telOffExt, mobileNo, faxNo, faxAreaCode, faxExt, pagerNo, eMail, custOpenDate, relationshipManager, altBranchCode, titleCode, certificateOfBirthNo, referenceReqdFor, idDateType, noOfDependents, residentStatus, passportNo, hafizaNo, samaAuthNo, familyRegnNo, succDeedNo, visaNo, vipCode, purposeOfAccount, govtShareHoldingPerc, saudiShareHoldingPerc, foreignShareHoldingPerc, licenseNo, approvalRefNo, contractNo, diplomaticCardNo, lastUpdateUser, lastUpdateDateTime | custNo |
| `stidtab` | idType, idNo, idIssuedAt, idDateType, iqamaType, idIssueDateH/G, idExpiryDateH/G, idRefName — the five ID rows | custNo + idCategory `'C'` |
| `stcustlog` | branchCode, userId, lastUpdateUser — read twice (earliest = open maker/branch, latest = update maker/branch) | custNo |

**History mode** replaces the three reads above with:

| Table | Fields | Keyed on |
|---|---|---|
| `stcustlog` | same column list as `stcusttab` above, except `custBranchCode AS branchCode` and `maritalStatus AS marritalStatus` | custNo + datetime |
| `stidlog` | idType, idNo, idIssuedAt, idIssueDateH/G, idExpiryDateH/G | branchCode + userId + datetime + idCategory `'C'` |
| `staddrlog` | address1, address2, poBox, cityName, zipCode, country, telHomeNo, telOffNo, mobileNo, eMail | branchCode + userId + datetime + addressType `'00'` |

## 5. IndividualSaudiAcctInfo · 7. IndividualOthersPage2 · 8. IndividualOthersAcctInfo

All three are served by one call (`/api/customers/{custNo}/acct-info`):

| Table | Fields | Keyed on |
|---|---|---|
| `stcusttab` | educationCode, professionCode, positionCode, monthlyIncome, segmentation, employerName, employerPoBox, employerCity, employerZipCode, department, ownerShip, packageAcc, signatureNature, custAdviceFlag, updatedForSama, relationshipManager, generalMemo, marketingMemo, accFreezingGracePeriod, singleJointAcc, excludeFromAtmFees, excludeFromMinBalFees, pkgStmtFreqOverride, interGroupAccNo, specialRefNo, jointAccNameOnCheck, jointAccNameOnReports, branchCode, createdUserId, createdDateTime | custNo |
| `staddrtab` | address1, address2, poBox, cityName, zipCode, country, telOffAreaCode/No/Ext, telHomeAreaCode/No/Ext, faxAreaCode/No/Ext, mobileNo, pagerNo, eMail — the home-country block | custNo + addressType `'01'` + addressNo `'0000'` |
| `stidtab` | idType, idNo, idDateType, idIssueDateH/G, idExpiryDateH/G, idRefName | custNo + idCategory `'C'` + idType in (`M`, `S`, `A`) |
| `stacclog` *(history mode only)* | accNo, accStatus, statementFreq, checkBook, droppedAcc — the accounts-to-open rows | branchCode + userId + datetime |

## 9. JuristicMain

Same three reads as screen 4 (`stcusttab`, `stidtab`, `stcustlog`); the juristic
variants use the org-name and CR/licence columns of that same list.

## 10. JuristicAccountInfo

| Table | Fields | Keyed on |
|---|---|---|
| `stcusttab` | custNo, branchCode, createdUserId, createdDateTime, signatureNature, internetBankAcc, custAdviceFlag, updatedForSama, relationshipManager, generalMemo, marketingMemo, accFreezingGracePeriod | custNo |
| `staddrtab` | address1, address2, poBox, zipCode, cityName, country, telOffNo, telHomeNo, faxNo, mobileNo, pagerNo, eMail | custNo + addressType `'01'` + addressNo `'0000'` |
| `stacclog` | accNo, accStatus, statementFreq, checkBook, droppedAcc | branchCode + userId + datetime |

## 11. CustomerGeneric  (Customer Maintenance)

The general customer form, opened when the category pair is blank. Reads exactly
what screens 4 and 6 read — `stcusttab` for the profile, `stidtab` for the ID
row, `staddrtab` for the address — and renders the union of the personal and
company fields, since no category says which kind of customer this is.

---

## 12. CustUpdateHistory

| Table | Fields | Keyed on |
|---|---|---|
| `stcustlog` | branchCode, userId, dateTime (`datetime_bigdata`), bmUpdateStatus, supervisorId, lastUpdateDateTime, samaMainCategory, samaSubCategory | custNo |

## 13. EssentialDocuments

| Table | Fields | Keyed on |
|---|---|---|
| `stcusttab` | samaMainCategory, samaSubCategory, documentsSupplied, documentOther | custNo |
| `stcustlog` | same four, for the as-of view | custNo + datetime |
| `stctltabDC` | documnetNo1 … documnetNo20 — the required-document list for the category | samaMainCategory + samaSubCategory |

## 14. profilePageFields

Shared field blocks reused by screens 4–10. No query of its own.

---

## 15. JointHolders

| Table | Fields | Keyed on |
|---|---|---|
| `stjointtab` | jointCustNo, aShortName, eShortName, preferredLang, idType, idNo, nationality, mobileNo, jointOpenDate, activeStatus, branchCode | custNo |

## 16. JointHolderDetail

| Table | Fields | Keyed on |
|---|---|---|
| `stjointtab` | jointCustNo, branchCode, activeStatus, jointOpenDate, aFirstName, a2ndName, a3rdName, aLastName, aShortName, eFirstName, e2ndName, e3rdName, eLastName, eShortName, idType, idNo, idIssuedAt, idDateType, idIssueDateH/G, idExpiryDateH/G, preferredLang, nationality, titleCode, dobDateType, dobDateH/G, sexCode, vipCode, marritalStatus, noOfDependents, residentStatus, businessType, address1, address2, poBox, cityName, zipCode, country, addressType, gprsNo, unitNo, telOffAreaCode/No/Ext, telHomeAreaCode/No/Ext, faxAreaCode/No/Ext, mobileNo, pagerNo, eMail, educationCode, professionCode, positionCode, monthlyIncome, ownerShip, segmenation, employerName, department, employerPoBox, employerCity, employerZipCode | custNo + jointCustNo |

## 17. Owners

| Table | Fields | Keyed on |
|---|---|---|
| `stowntab` | ownerNo, ownerType, idType, idNo, parentCompanyName, shareHoldingPerc, ownerEnabled, branchCode, shortName (`aShortName` else `eShortName`) | custNo |

## 18. OwnerDetail

| Table | Fields | Keyed on |
|---|---|---|
| `stowntab` | ownerNo, ownerType, ownerEnabled, branchCode, idType, idNo, shareHoldingPerc, parentCompanyName, aFirstName, aSecondName, aThirdName, aLastName, aShortName, eFirstName, eSecondName, eThirdName, eLastName, eShortName | custNo + ownerNo |
| `stidtab` | idIssuedAt, idDateType, idIssueDateH/G, idExpiryDateH/G | custNo + idCategory + idType + idNo |
| `staddrtab` | addressType, address1, address2, poBox, cityName, zipCode, country, addrType, unitNo, telOffAreaCode/No/Ext, telHomeAreaCode/No/Ext, faxAreaCode/No/Ext, mobileNo, pagerNo, eMail | custNo + addressNo = ownerNo |

## 19. References

| Table | Fields | Keyed on |
|---|---|---|
| `stcreftab` | referenceNo, referenceType, referenceReqdFor, idType, idNo, activeStatus, branchCode, shortName (`aShortName` else `eShortName`) | custNo |

## 20. HeirsProxy

| Table | Fields | Keyed on |
|---|---|---|
| `stheirtab` | heirNo, heirType, idType, idNo, proxyNo, proxyIssueDateH/G, activeStatus, branchCode, shortName (`aShortName` else `eShortName`) | custNo |

## 21. PartyDetail  (Heir Details / Reference Details)

| Table | Fields | Keyed on |
|---|---|---|
| `stheirtab` *(heir)* | heirNo, heirType, activeStatus, disabledDate, branchCode, idType, idNo, aFirstName, aSecondName, aThirdName, aLastName, aShortName, eFirstName, eSecondName, eThirdName, eLastName, eShortName, proxyNo, proxyDateType, proxyIssueDateH/G | custNo + heirNo |
| `stcreftab` *(reference)* | referenceNo, referenceType, referenceReqdFor, activeStatus, disabledDate, branchCode, idType, idNo, and the same eight name columns *(proxy columns come back blank)* | custNo + referenceNo |
| `stidtab` | idIssuedAt, idDateType, idIssueDateH/G, idExpiryDateH/G | custNo + idCategory + idType + idNo |
| `staddrtab` | as screen 18 | custNo + addressNo = the party number |

## 22. SignatoryGrid

| Table | Fields | Keyed on |
|---|---|---|
| `stsigntab` | accNo, signatoryNo, idType, idNo, branchCode, signatoryShortName (`aShortName` else `eShortName`) | `SUBSTR(accNo,6,7)` = custNo, or accNo |

## 23. SignatoryDetail

| Table | Fields | Keyed on |
|---|---|---|
| `stsigntab` | accNo, signatoryNo, branchCode, idType, idNo, aFirstName, aSecondName, aThirdName, aLastName, aShortName, eFirstName, eSecondName, eThirdName, eLastName, eShortName, activeStatus, reason, signatureActionDate, diplomaticPpNo | accNo + signatoryNo |
| `stidtab` *(inner join — mandatory)* | idDateType, idIssuedAt, idIssueDateH/G, idExpiryDateH/G | custNo + idType + idNo + idCategory `'S'` |

---

## 24. AccountInfo

| Table | Fields | Keyed on |
|---|---|---|
| `gld0data` | accNo, bookBal, clearedBal, blockedAmt, accStatusCode (`'0'` + accStatus), accLimit, anbDormantFlag, branchCode | `SUBSTR(accNo,6,7)` = custNo, or accNo |
| `stctltabBD` | balEnqRestrictedFlag | branchCode |
| `stusrbrn` | noOfBranchesDefined, Branchcode1…Branchcode5 | userId |

## 25. AccountMaintenance

| Table | Fields | Keyed on |
|---|---|---|
| `gld0data` | ledgerCode, accDesc, iban, branchCode, accStatus, samaAccStatus, inactiveAccFlag, statementFrequency, statementDay, intApplication, intApplicationFreq, intApplicationDay, crIntRate, drIntRate, payAccNo, accLimit, uniqueNo, uniqueSubNo1, intLastRun, custNo, memorandumField1, memorandumField2, accOpenDate, lastTransDate, lastAmendmentDate — plus currencyCode / subAccount derived from `SUBSTR(accNo,…)` | accNo |
| `stcusttab` | customerName (`eShortName` else `aShortName`) | custNo |
| `stctltabMM` | ledgerName | ledgerCode |
| `stctltabXC` | currencyName | currCode |
| `stacclog` | userId, supervisorId, dateTime, lastUpdateDateTime, accStatusChangeReason — the amendment-audit block | accNo + bmUpdateStatus `'9'` |

**As-of (history) mode** reads the whole screen from `stacclog` instead:
accStatus, samaAccStatus, accStatusChangeReason, statementFreq, statementDay,
inactiveAccFlag, intApplication, crIntRate, drIntRate, payAccNo, uniqueNo,
uniqueSub, creditLimit, intLastRun, intFreqCode, intApplDay, custBranchCode,
supervisorComments, acctDesc, userId, supervisorId, dateTime,
lastUpdateDateTime, bmUpdateStatus — keyed on accNo + datetime, with the same
`stcusttab` / `stctltabXC` / `stctltabMM` name lookups.

## 26. AcctUpdateHistory

| Table | Fields | Keyed on |
|---|---|---|
| `stacclog` | branchCode, userId, dateTime (`datetime_bigdata`), bmUpdateStatus, supervisorId, lastUpdateDateTime | accNo |

## 27. AcctStatusHistory

| Table | Fields | Keyed on |
|---|---|---|
| `stacclog` | dateTime, userId, supervisorId, lastUpdateDateTime, branchCode, fromStatus, toStatus, accStatusChangeReason | accNo + statusChanged `'1'` + bmUpdateStatus `'9'` |

## 28. SamaStatusHistory

| Table | Fields | Keyed on |
|---|---|---|
| `stacclog` | dateTime, userId, supervisorId, lastUpdateDateTime, branchCode, fromSamaAccStatus, toSamaAccStatus *(no reason column on this type)* | accNo + samaAccStatusChanged `'1'` + bmUpdateStatus `'9'` |

## 29. BlockedAmountBreakup

| Table | Fields | Keyed on |
|---|---|---|
| `gld0data` | blockedAmt — the account's own total | accNo |
| `gld0data` | productNo (`accNo`), matchingLoan, blockedAmt (`blockedArrear2`) — loan arrears | same customer + settlementAccNo |
| `aad0data` | productNo (`FinoneAlcoAccNo`), blockedAmt (`loanBlockBal`) | settlementAccNo |
| `bkd0data` | productNo (`refNo`), blockedAmt, userId | accNo + recType `'1'` |
| `ccarrblk` | productNo (`cardNo`), blockedAmt, autoManualFlag, lastBlockedUserId, requestBranch | bmAccNo |
| `staccblk` | productNo (`bmAccNo`), blockedAmt, lastBlockedUserId, requestBranch | bmAccNo |

---

## 30. ChequeBookGrid

| Table | Fields | Keyed on |
|---|---|---|
| `stchqtab` | deliveryBranchCode, custBranchCode, requestUserId, branchCode, chequeType, booksRequested, requestDateTime, requestStatus, chequeNoFrom, chequeNoTo | accNo |

## 31. ChequeBookHistory

| Table | Fields | Keyed on |
|---|---|---|
| `stchqtab` | requestUserId, requestDateTime, producedDate/Time/UserId, recdByBranchDate/Time/UserId, issuedToCustDate/Time/UserId, rejectedDate/Time/UserId, rejectedReason, branchCode | accNo + request date |

## 32. StopChequeGrid

| Table | Fields | Keyed on |
|---|---|---|
| `pyd0data` | chequeNo, amount, dateStop, payeeName, chequeFrom | accNo + recType `'CH'` |

## 33. StopChequeDetail

| Table | Fields | Keyed on |
|---|---|---|
| `pyd0data` | chequeNo, amount, dateStop, payeeName, chequeFrom | accNo + chequeNo + recType `'CH'` |
| `ststchqlog` | stopChqUserId (`userId` of the latest `lastUpdateBmDate`) | accNo + first 8 of chequeNo |

## 34. StandingOrderGrid

| Table | Fields | Keyed on |
|---|---|---|
| `sod0data` | sodNo, paymentType, paymentAmt, payAccNo, orderType, paymentFrequency | accNo |

## 35. StandingOrderDetail

| Table | Fields | Keyed on |
|---|---|---|
| `sod0data` | sodNo, orderType, paymentType, paymentMode, paymentFrequency, firstPaymentDate, nextPaymentDate, finalPaymentDate, lastProcessedDate, paymentsToBeMade, paymentsMade, limitInExcessFlag, commissionFlag, processNextDayFlag, thresholdAmt, paymentAmt, totalPaidToDate, totalToPay, payAccNo, drNarrative1, drNarrative2, crNarrative1, crNarrative2, transactionDateFlag, branchCode, remarks | accNo + sodNo |
| `gld0data` | custBranchCode (`MAX(branchCode)`) | accNo |
| `stsodlog` | lastUpdateDate, lastUpdateUserId, and a pending-update probe (bmUpdateStatus `1`/`2`) | accNo + sodNo |
| `stcusttab` | payeeCustName — org short name when custType ≠ `'0'`, else the personal short name | custNo of the payee account |

---

## 36. CardGrid

| Table | Fields | Keyed on |
|---|---|---|
| `stcardtab` | cardNo, nameOnTheCard, firstIssueDate, expireDate, cardStatus, requestStatus, pinRequestStatus, coreAccNo, custNo | custNo / accNo / cardNo |
| `stcusttab` | custNo, shortName, address1, poBox, cityName, zipCode, branchCode, custType, preferredLang — the header band | custNo |

## 37. CardDetail

| Table | Fields | Keyed on |
|---|---|---|
| `stcardtab` | cardNo, custNo, requestStatus, deliveryBranchCode, cardType, nameOnTheCard, bmAccNo, coreAccNo, sequenceNo, requestType | cardNo |
| `stcusttab` | custName (`aShortName` else `eShortName`), packageAcc | custNo |
| `stcardlog` *(as-of mode)* | cardNo, custNo, requestStatus, customerBranch, cardType, nameOnTheCard, bmAccNo, coreAccNo, newOrUpdate | cardNo + branchCode + userId + datetime |

## 38. CardUpdateHistory

| Table | Fields | Keyed on |
|---|---|---|
| `stcardlog` | branchCode, userId, dateTime, bmUpdateStatus, supervisorId, lastUpdateDateTime, requestType | cardNo |

## 39. CardHistory  (Card / Pin History)

| Table | Fields | Keyed on |
|---|---|---|
| `stcardlog` | branchCode, requestType, userId, dateTime, cardGeneratedDate/Time/UserId, cBranchReceiptDate/Time/UserId, cCustIssueDate/Time/UserId, pinGeneratedDate/Time/UserId, pBranchReceiptDate/Time/UserId, pCustIssueDate/Time/UserId, supervisorId, lastUpdateDateTime, processDateTime, rejectedUserId, rejectedDate/Time, rejectedReason | cardNo + bmUpdateStatus `'9'` |

---

## 40. TransferEnquiry

| Table | Fields | Keyed on |
|---|---|---|
| `rid0data` | transRef, issueDate, valueDate, drAccNo, transCurrCode, netAmt, payCurrCode, payAmt, statusFlag | crAccNo + issueDate between from/to |

## 41. TransferDetail

| Table | Fields | Keyed on |
|---|---|---|
| `rid0data` | transRef, issueDate, valueDate, crAccNo, drAccNo, transCurrCode, payCurrCode, netAmt, payAmt, applicantName, penProxyName, pensionerName, benefAddress2, benefBank1, paymentStatus, statusFlag, branchCode, transferPurpose, exchangeRate, message1 | transRef (+ issueDate when given) |
| `stcusttab` | custName — org short name when custType ≠ `'0'`, else personal | `SUBSTR(crAccNo,6,7)` |
| `crd0data` | shortName — fallback when the customer is not in `stcusttab` | custNo |
| `stswiftlog` | pending-update probe (bmUpdateStatus `1`/`2`) | transRefNo + issueDate |

## 42. TransactionEnquiry  (BM)

| Table | Fields | Keyed on |
|---|---|---|
| `thd0data` | transRef, postDate, valueDate, userId, transAmt, transCounter, transType | accNo + postDate between from/to |

## 43. TransactionDetail

| Table | Fields | Keyed on |
|---|---|---|
| `thd0data` | accNo, transRef, postDate, valueDate, transAmt, transType, userId, supervisorId, statmentFlag, narrative1, narrative2, narrative3 | accNo + transRef |
| `stcusttab` / `crd0data` | custName, as screen 41 | `SUBSTR(accNo,6,7)` |

## 44. TransactionInquiry  (online / gateway)

| Table | Fields | Keyed on |
|---|---|---|
| `crd0data` | shortName, address1, address2, language | custNo |
| `gld0data` | bookBal, branchCode | accNo |
| `stctltabBD` | branchName | branchCode |
| `stctltabXC` | decimalPlace | currCode |
| `thd0data` | userId, postDate, valueDate, transType, transAmt, narrative1, narrative2, narrative3, transRef, supervisorId, transCounter, statmentFlag | accNo + transCounter > pointer |

## 45. OnDemandStatement

Same reads as screen 44 (`crd0data`, `gld0data`, `stctltabBD`, `stctltabXC`,
`thd0data`) — the statement is the transaction list plus the customer and
balance header.

## 46. HistoricalStatement  (BM archive, statement DB)

| Table | Fields | Keyed on |
|---|---|---|
| `STMT_HDR` | ACCT_NUM, STMT_DATE, BRANCH_CODE, BRANCH_NAME, ACCT_TYPE, CUST_ADR1…CUST_ADR4, CRNCY, LANG_CODE, FILE_NAME, STMT_NUM, CUST_NAME, IBAN, REF_NUM | ACCT_NUM + STMT_DATE in range |
| `STMT_TXN` | ACCT_NUM, STMT_DATE, STMT_NUM, TXN_ORDER, TXN_BRANCH_CODE, TXN_DATE, VALUE_DATE, NARRATIVE1…NARRATIVE4, CR_AMT, DR_AMT, RUN_BAL, RUN_BAL_TYPE | ACCT_NUM + STMT_DATE in range |

## 47. PdpStatement

| Table | Fields | Keyed on |
|---|---|---|
| `PDP_STMT_HDR` | the same common header columns, but the identity block is CUST_NUM, TITLE, FIRST_NAME, SECOND_NAME, PAGE_NUM, BRANCH_DATA | CUST_NUM and/or ACCT_NUM + STMT_DATE in range |
| `PDP_STMT_TXN` | ACCT_NUM, STMT_DATE, TXN_ORDER, TXN_BRANCH_CODE, TXN_DATE, VALUE_DATE, NARRATIVE1…NARRATIVE4, CR_AMT, DR_AMT, RUN_BAL, RUN_BAL_TYPE *(no STMT_NUM)* | ACCT_NUM taken from the header query |

---

## Reference data (`/api/codes`)

Loaded once at sign-on and used for every code label on every screen above.

| Table | Fields | Notes |
|---|---|---|
| `stctltab` | ctlCode, description | keyed on RecordType — one code list per type |
| `stctltabNA` | countryCode, description | nationality / country |
| `stctltabSS` | samaSubCategoryCode, description | SAMA sub category |
| `stctltabBD` | branchCode, description | branch names |
| `stctltabXC` | currCode, isoCurrCode, description | currency, both the BM code and the ISO alpha |
| `stctltabMM` | ledgerCode, description | ledger / product |

The description column is the Arabic or English name depending on
`Accept-Language`.
