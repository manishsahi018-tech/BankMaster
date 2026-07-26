Attribute VB_Name = "globalVaribles"
Option Explicit
'Error codes Received from static server
Global Const Success = "000"
Global Const Duplicate = "002"
Global Const IncorrectMessage = "003"
Global Const NotFound = "009"
Global Const CommsError = "012"
Global Const timeOut = "013"
Global Const ResendLater = "050"
Global Const RecordLocked = "051"
Global Const EndOfFile = "052"
Global Const NotLogon = "097"
Global Const InternalError = "099"

Global Const Quick = "00"
Global Const Individual = "01"
Global Const ResJuristicPerson = "02"
Global Const NonResJuristicPerson = "03"
Global Const GovtAccounts = "04"
Global Const EmbassConsulateDiplomats = "05"
Global Const JurisInvestUnderForeignInvestmentAct = "06"
Global Const JurisInvestNotCoverByForeignInvestmentRegulations = "07"

Global Const ARABIC = 0
Global Const ENGLISH = 1

'Error Code pertain to the local application
Global Const LocalCommsError = "500"


Public Type incommingMessage
    msgLen As String * 6
    status As String * 3
    remarks As String * 30
    bmStatus As String * 1
    service As String * 2
    keyValue As String * 6
    action As String * 1
    arabicName As String * 30
    englishName As String * 30
    OtherDetails As String * 180
End Type

Public Type searchDetails
    custNo As String
    idType As String
    idNo   As String
    telNo  As String
    telExt As String
    lastName As String
    secondName As String
    firstName As String
    shortName As String
    poBox     As String
    city      As String
    branchCode As String
    mainCategoryCode As String
    subCategoryCode As String
End Type

Public Type resMsgsearch
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    incompleteFlag As String
    filler As String
    details(20) As searchDetails
End Type

Public Type accSearchDetails
    accNo As String
    bookBal As String
    clearedBal As String
    blockedBal As String
    accStatus As String
    creditLimit As String
    transCount As String
    inactiveFlag As String
    branchCode As String
    enqRestrictedFlag As String
End Type

Public Type resMsgAccSearch
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    custBranchCode As String
    custNo As String
    aShortName As String
    eShortName As String
    staffFlag As String
    restrictedFlag As String
    foundInAList As String
    samaMainCategory As String
    samaSubCategory As String
    customerLang As String
    filler As String
    details(20) As accSearchDetails
    foundInTlist As String
    noOfTlistRecs As String
End Type

Public Type pensionSearchDetails
    penCardNo As String
    penName As String
    penIdNo As String
    penHafNo As String
    penSalAmt As String
    netAmt As String
    paymentType As String
End Type

Public Type resMsgPensionSearch
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As pensionSearchDetails
End Type

Public Type resMsgPenCashDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    penCardNo As String
    netAmt As String
    deduction As String
    paymentStatus As String
    totAmt As String
    penProxyName As String
    pensionerName As String
    message1 As String
    message2 As String
    message3 As String
    message4 As String
End Type

Public Type nameDetails
    relation As String
    dobDate As String
    penAmt As String
    penName As String
End Type

Public Type resMsgPenInh
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    penCardNo As String
    branchCode As String
    noOfInh As String
    penSalary As String
    names(25) As nameDetails
End Type

Public Type resMsgPensionDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    penCardNo As String
    penName As String
    penHafNo As String
    penHafPlC As String
    penHafPl As String
    penBtNo As String
    reprName As String
    reprIdNo As String
    reprIdPl As String
    penAccNo As String
    penAmt As String
    penDedn As String
    penNett As String
    branchCode As String
    issuerNo As String
    issueDate As String
    cashStat As String
    inHrNo As String
    cardType As String
    cardStat As String
    paymentType As String
    notes1 As String
    notes2 As String
    notes3 As String
    notes4 As String
    notes5 As String
    notes6 As String
    notes7 As String
    notes8 As String
    notes9 As String
    notes10 As String
    notes11 As String
    notes12 As String
    notes13 As String
    notes14 As String
    notes15 As String
    subCard As String
End Type

Public Type stopChqSearchDetails
    chequeNo As String
    amount As String
    dateStop As String
    details As String
    fromChequeNo As String
End Type

Public Type resMsgStopChqSearch
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As stopChqSearchDetails
End Type

Public Type chequeBookSearchDetails
    branchCode As String
    chequeType As String
    booksRequested As String
    requestDate As String
    requestStatus As String
    chequeNoFrom As String
    chequeNoTo As String
    requestUserId As String
End Type

Public Type resMsgChequeBookSearch
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    accNo As String
    alternativeBranchCode As String
    filler As String
    details(20) As chequeBookSearchDetails
End Type

Public Type chequeBookDetails
    accNo As String
    chequeType As String
    booksRequested As String
    requestUserId As String
    requestStatus As String
    custBranchCode As String
    chequeNoFrom As String
    chequeNoTo As String
End Type

Public Type resMsgChequeBookReport
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    reportDate As String
    filler As String
    details(50) As chequeBookDetails
End Type

Public Type chequeBookHistoryDetails
    requestUserId As String
    requestDate As String
    producedDate As String
    producedUserId As String
    recdByBranchDate As String
    recdByBranchUserId As String
    issuedToCustDate As String
    issuedToCustUserId As String
    rejectedDate As String
    rejectedUserId As String
    rejectedReason As String
    requestTime As String
    producedTime As String
    recdByBranchTime As String
    issuedToCustTime As String
    rejectedTime As String
End Type

Public Type resMsgChequeBookHistory
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    noOfRecs As String
    filler As String
    details(20) As chequeBookHistoryDetails
End Type

Public Type resMsgChequeBookDetails
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    accNo As String
    requestDateTime As String
    chequeType As String
    booksRequested As String
    requestUserId As String
    requestStatus As String
    custBranchCode As String
    chequeNoFrom As String
    chequeNoTo As String
    deliveryBranchCode As String
End Type


Public Type acctStatusHistoryDetails
    changeDate As String
    userId As String
    supervisorId As String
    fromStatus As String
    toStatus As String
    lastUpdateDateTime As String
    accStatusChangeReason As String
End Type

Public Type resMsgAcctStatusHistory
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    noOfRecs As String
    filler As String
    details(50) As acctStatusHistoryDetails
End Type

Public Type resMsgStopChqDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    accNo As String
    filler1 As String
    chequeNo As String
    amount As String
    dateStop As String
    payeeName As String
    chequeFrom As String
    newOrUpdate As String
    supervisorComments As String
    stopChqUserId As String
End Type

Public Type stdOrdSearchDetails
    sodNo As String
    paymentType As String
    paymentAmt As String
    payAccNo As String
    orderType As String
    paymentFrequency As String
    branchCode As String
End Type

Public Type resMsgStdOrdSearch
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As stdOrdSearchDetails
End Type

Public Type sodPendingListDetails
    userId As String
    dateTime As String
    accNo As String
    sodNo As String
    paymentType As String
End Type

Public Type resMsgStdOrdPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As sodPendingListDetails
End Type

Public Type resMsgStdOrdDetails
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    accNo As String
    sodNo As String
    orderType As String
    paymentType As String
    paymentMode As String
    paymentFrequency As String
    firstPaymentDate As String
    nextPaymentDate As String
    finalPaymentDate As String
    lastProcessedDate As String
    paymentsToBeMade As String
    paymentsMade As String
    limitInExcessFlag As String
    commissionFlag As String
    processNextDayFlag As String
    thresholdAmt As String
    paymentAmt As String
    totalPaidToDate As String
    totalToPay As String
    payAccNo As String
    drNarrative1 As String
    drNarrative2 As String
    crNarrative1 As String
    crNarrative2 As String
    transactionDateFlag As String
    branchCode As String
    newOrUpdate As String
    supervisorComments As String
    payeeCustName As String
    lastUpdateUserId As String
    lastUpdateDate As String
    custName As String
    remarks As String
    custBranchCode As String
End Type

Public Type stopChqPendingListDetails
    userId As String
    dateTime As String
    accNo As String
    chequeNo As String
    reason As String
    pendingType As String
End Type

Public Type resMsgStopChqPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As stopChqPendingListDetails
End Type


Public Type cardSearchDetails
    cardNo As String
    nameOnTheCard As String
    issueDate As String
    expiryDate As String
    cardStatus As String
    requestStatus As String
    pinRequestStatus As String
    bmAccNo As String
End Type

Public Type resMsgCardSearch
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    idNo As String
    homeTelNo As String
    offTelNo As String
    lastRecCount As String
    noOfRecs As String
    custNo As String
    aShortName As String
    eShortName As String
    address1 As String
    poBox As String
    cityName As String
    zipCode As String
    custBranchCode As String
    custType As String
    addressType As String
    customerLang As String
    filler As String
    details(20) As cardSearchDetails
End Type

Public Type statusListDetails
    cardNo As String
    nameOnTheCard As String
    cardGeneratedDate As String
    issueDate As String
    expiryDate As String
End Type

Public Type resMsgStatusList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As statusListDetails
End Type

Public Type chqBkStatusDetails
    accNo As String
    chequeType As String
    requestedDate As String
    producedDate As String
    booksRequested As String
    requestUserId As String
    custName As String
End Type

Public Type resMsgChqBkStatusList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As chqBkStatusDetails
End Type

Public Type reqMsgStatusUpdate
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    noOfRecs As String * 2
    cardOrPin As String * 1
    requestStatus As String * 1
    cardNo(20) As String * 19
End Type

Public Type reqMsgChqBkStatusUpdate
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    noOfRecs As String * 2
    requestStatus As String * 1
    requestDate(20) As String
    accNo(20) As String * 14
End Type

Public Type cardPendingListDetails
    userId As String
    dateTime As String
    cardNo As String
    nameOnTheCard As String
    cardType As String
    natureOfCard As String
    pendingType As String
End Type

Public Type resMsgCardPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As cardPendingListDetails
End Type

Public Type resMsgCardPendingDetails
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    supervisorId As String
    cardNo As String
    requestStatus As String
    cardType As String
    newOrReplacement As String
    primaryOrSupplementary As String
    cardStatus As String
    regionCode As String
    coreAccNo As String
    languageCode As String
    customerBranch As String
    nameOnTheCard As String
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    issueDate As String
    renewalDate As String
    expireDate As String
    rejectedDate As String
    rejectedUserId As String
    rejectedReason As String
    deactivationDate As String
    deactivationUserId As String
    titleCode As String
    idNo As String
    deliveryToBranchOrPO As String
    pinOffSet As String
    encryptedPin As String
    cvv As String
    pvv As String
    requestType As String
    pinRequestStatus As String
    cardGeneratedDate As String
    cardGeneratedUserId As String
    cBranchReceiptDate As String
    cBranchReceiptUserId As String
    cCustIssueDate As String
    cCustIssueUserId As String
    pinGeneratedDate As String
    pinGeneratedUserId As String
    pBranchReceiptDate As String
    pBranchReceiptUserId As String
    pCustIssueDate As String
    pCustIssueUserId As String
    custNo As String
    newOrUpdate As String
    supervisorComments As String
    custName As String
    custCategory As String
    deliveryBranchCode As String
    sequenceNo As String
    filler As String
End Type

Public Type cardHistoryDetails
    requestType As String
    requestUserId As String
    requestDateTime As String
    cardGeneratedDateTime As String
    cardGeneratedUserId As String
    cBranchReceiptDateTime As String
    cBranchReceiptUserId As String
    cCustIssueDateTime As String
    cCustIssueUserId As String
    pinGeneratedDateTime As String
    pinGeneratedUserId As String
    pBranchReceiptDateTime As String
    pBranchReceiptUserId As String
    pCustIssueDateTime As String
    pCustIssueUserId As String
    supervisorId As String
    lastUpdateDateTime As String
    processDateTime As String
    rejectedUserId As String
    rejectedDateTime As String
    rejectedReason As String
End Type

Public Type resMsgCardHistory
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    cardNo As String
    noOfRecs As String
    filler As String
    details(50) As cardHistoryDetails
End Type

Public Type resMsgAccPendingDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    supervisorId As String
    newOrUpdate As String
    accNo As String
    accStatus As String
    stmtFreq As String
    branchCode As String
    custName As String
    intApplication As String
    crIntRate As String
    drIntRate As String
    payAccNo As String
    uniqueNo As String
    uniqueSub As String
    statementDay As String
    accOpenDate As String
    lastAmendDate As String
    supervisorComments As String
    intApplicationDay As String
    intApplicationFreq As String
    collateral As String
    memoNote1 As String
    memoNote2 As String
    lastUpdateUser As String
    acctDesc As String
    initialStatus As String
    creditLimit As String
    dormantFlag As String
    intLastRun As String
    restrictedFlag As String
    samaStatus As String
    accStatusChangeReason As String
    otherStatusChangeReason As String
    initialSamaStatus As String
    samaStatusChanged As String
    keyDateTime As String
    domantActivationUpd As String
    lastTransDate As String
    lastUpdateStDate As String
    lastUpdateAppDate As String
    foundInTlist As String
    noOfRecs As String
    signatoryForOthers As String
    ibanAccNo As String
End Type

Public Type accPendingListDetails
    userId As String
    dateTime As String
    accNo As String
    accStatus As String
    branchCode As String
End Type

Public Type resMsgAccPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    lastRecNum As String
    filler As String
    details(20) As accPendingListDetails
End Type

Public Type resMsgCustomer
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    custNo As String
End Type

Public Type resMsgTpinStatus
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    custNo As String
    tpinExistFlag As String
    tpinStatus As String
End Type

Public Type tpinPendingListDetails
    userId As String
    dateTime As String
    custNo As String
    custBranchCode As String
    custShortName As String
End Type

Public Type resMsgTpinPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As tpinPendingListDetails
End Type

Public Type resMsgCard
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    cardNo As String
    dateTime As String
End Type


Public Type resMsgCardApproval
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    appRejectFlag As String
    custNo As String
    cardNo As String
    nameOnTheCard As String
    cardExpiryDate As String
    custBranchCode As String
    pinOffSet As String
    track1 As String
    track2 As String
    branchPinSelect As String
    branchCardPrdn As String
End Type

Public Type resMsgPrintCard
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    cardNo As String
    nameOnTheCard As String
    cardExpiryDate As String
    custBranchCode As String
    pinOffSet As String
    track1 As String
    track2 As String
End Type

Public Type resMsgAccApproval
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    appRejectFlag As String
    accNo As String
    ibanAccNo As String
End Type

Public Type resMsgStdOrdApproval
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    appRejectFlag As String
    accNo As String
    sodNo As String
End Type

Public Type resMsgStopChqApproval
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    appRejectFlag As String
    chequeNo As String
End Type

Public Type custPendingDetails
   userId  As String
   dateTime As String
   customerNo As String
   shortName  As String
   idType    As String
   idNumber  As String
   mainCategoryCode As String
   subCategoryCode As String
End Type

Public Type resMsgPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecRead As String
    noOfRecs As String
    filler As String
    details(20) As custPendingDetails
End Type

Public Type SupervisorActionMsg
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    foundInAList As String
    foundInBList As String
    foundInCList As String
    reportedBank As String
    nameInABCList As String
    exisingCustomer As String
    existCustNo As String
    existCustName As String
    newOrUpdate As String
    customerNo As String
    supervisorId As String
    custBranchCode As String
    idNo As String
    idType As String
    idIssuedAt As String
    idDateType As String
    idIssueDateH As String
    idIssueDateG As String
    idExpiryDateH As String
    idExpiryDateG As String
    preferredLang As String
    nationality As String
    titleCode As String
    dobDateType As String
    dobDateH As String
    dobDateG As String
    sexCode As String
    vipCode As String
    maritalStatus As String
    noOfDependents As String
    residentStatus As String
    businessType As String
    crNo As String
    crIssuedAt As String
    crIssuedDateType As String
    crIssueDateH As String
    crIssueDateG As String
    aOrgName1 As String
    aOrgName2 As String
    aOrgShortName As String
    eOrgName1 As String
    eOrgName2 As String
    eOrgShortName As String
    aFirstName As String
    a2ndName As String
    a3rdName As String
    aLastName As String
    aShortName As String
    eFirstName As String
    e2ndName As String
    e3rdName As String
    eLastName As String
    eShortName As String
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    country As String
    telOffAreaCode As String
    telOffNo As String
    telOffExt As String
    telHomeAreaCode As String
    telHomeNo As String
    telHomeExt As String
    faxAreaCode As String
    faxNo As String
    faxExt As String
    mobileNo As String
    pagerNo As String
    eMail As String
    educationCode As String
    professionCode As String
    positionCode As String
    monthlyIncome As String
    segmentation As String
    ownerShip As String
    employerName As String
    department As String
    employerPoBox As String
    employerCity As String
    employerZipCode As String
    documents As String
    documentOther As String
    singleJointAcc As String
    packagedAcc As String
    noOfJointAcc As String
    jointAccNameOnCheck As String
    jointAccNameOnReports As String
    signatureNature As String
    electronCardRequired As String
    electronCardName As String
    elctronSuppRequired As String
    electronSuppName As String
    electronIntlRequired As String
    electronIntlName As String
    electronIntlSuppRequired As String
    electronIntlSuppName As String
    deliveryToBranchOrPO As String
    deliveryAddress1 As String
    deliveryAddress2 As String
    deliveryPoBox As String
    deliveryCity As String
    deliveryZip As String
    supervisorComments As String
    custType As String
    currentAccInfo As String
    savingsAccInfo As String
    otherAccInfo As String
    internetBankAcc As String
    custAdviceFlag As String
    altBranchCode As String
    orgAlphaSearchCode As String
    restrictedBranchFlag As String
    updatedForSama As String
    relationshipManager As String
    generalMemo As String
End Type
   
Public Type NewCustomerInfo
    msgLen As String * 6
    service As String * 2
    branchCode As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    NewOrUpdateFlag As String * 1
    bmUpdateStatus As String * 1
    customerNo As String * 7
    supervisorId As String * 10
    custBranchCode As String * 4
    idNo As String * 15
    idType As String * 1
    idIssuedAt As String * 20
    idDateType As String * 1
    idIssueDateH As String * 8
    idIssueDateG As String * 8
    idExpiryDateH As String * 8
    idExpiryDateG As String * 8
    langPref As String * 1
    nationality As String * 20
    titleCode As String * 2
    dobDateType As String * 1
    dobDateH As String * 8
    dobDateG As String * 8
    sexCode As String * 1
    vipCode As String * 1
    maritalStatus As String * 1
    noOfDependents As String * 2
    residentStatus As String * 1
    businessType As String * 4
    crNo As String * 15
    crIssuedAt As String * 20
    crIssuedDateType As String * 1
    crIssueDateH As String * 8
    crIssueDateG As String * 8
    aOrgName1 As String * 30
    aOrgName2 As String * 30
    aOrgShortName As String * 30
    eOrgName1 As String * 30
    eOrgName2 As String * 30
    eOrgShortName As String * 30
    aFirstName As String * 15
    a2ndName As String * 15
    a3rdName As String * 15
    aLastName As String * 15
    aShortName As String * 30
    eFirstName As String * 15
    e2ndName As String * 15
    e3rdName As String * 15
    eLastName As String * 15
    eShortName As String * 30
    address1 As String * 30
    address2 As String * 30
    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 20
    telOffAreaCode As String * 4
    telOffNo As String * 10
    telOffExt As String * 4
    telHomeAreaCode As String * 4
    telHomeNo As String * 10
    telHomeExt As String * 4
    faxAreaCode As String * 4
    faxNo As String * 10
    faxExt As String * 4
    mobileNo As String * 10
    pagerNo As String * 10
    eMail As String * 30
    educationCode As String * 2
    professionCode As String * 2
    positionCode As String * 2
    monthlyIncome As String * 2
    segmentation As String * 1
    ownerShip As String * 10
    employerName As String * 30
    department As String * 20
    employerPoBox As String * 10
    employerCity As String * 20
    employerZipCode As String * 10
    documents As String * 15
    documentOther As String * 50
    singleJointAcc As String * 1
    packagedAcc As String * 1
    noOfJointAcc As String * 2
    jointAccNameOnCheck As String * 60
    jointAccNameOnReports As String * 30
    signatureNature As String * 1
    electronCardRequired As String * 1
    electronCardName As String * 26
    elctronSuppRequired As String * 1
    electronSuppName As String * 26
    electronIntlRequired As String * 1
    electronIntlName As String * 26
    electronIntlSuppRequired As String * 1
    electronIntlSuppName As String * 26
    deliveryToBranchOrPO As String * 1
    deliveryAddress1 As String * 30
    deliveryAddress2 As String * 30
    deliveryPoBox As String * 10
    deliveryCity As String * 20
    deliveryZip As String * 10
    supervisorComments As String * 200
    custType As String * 1
    updateCardAddressReqd As String * 1
    internetBankAcc As String * 1
    custAdviceFlag As String * 1
    altBranchCode As String * 4
    phaseFlag As String * 1
    orgAlphaSearch As String * 6
    updatedForSama As String * 1
    relationshipManager As String * 25
    generalMemo As String * 25
End Type

Public Type NewIndividualOthersInfo
    msgLen As String * 6
    service As String * 2
    branchCode As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    NewOrUpdateFlag As String * 1
    bmUpdateStatus As String * 1
    customerNo As String * 7
    supervisorId As String * 10
    custBranchCode As String * 4
    samaMainCategory As String * 2
    samaSubCategory As String * 2
    screenSetNo As String * 1
    iqamaNo As String * 15
    iqamaIssuedAt As String * 20
    iqamaDateType As String * 1
    iqamaIssueDateH As String * 8
    iqamaIssueDateG As String * 8
    iqamaExpiryDateH As String * 8
    iqamaExpiryDateG As String * 8
    ppNo As String * 15
    ppIssuedAt As String * 20
    ppDateType As String * 1
    ppIssueDateH As String * 8
    ppIssueDateG As String * 8
    ppExpiryDateH As String * 8
    ppExpiryDateG As String * 8
    langPref As String * 1
    nationality As String * 3
    titleCode As String * 2
    dobDateType As String * 1
    dobDateH As String * 8
    dobDateG As String * 8
    sexCode As String * 1
    vipCode As String * 1
    maritalStatus As String * 1
    noOfDependents As String * 2
    residentStatus As String * 1
    businessType As String * 3
    
    aFirstName As String * 15
    a2ndName As String * 15
    a3rdName As String * 15
    aLastName As String * 15
    aShortName As String * 30
    eFirstName As String * 15
    e2ndName As String * 15
    e3rdName As String * 15
    eLastName As String * 15
    eShortName As String * 30
    address1 As String * 30
    address2 As String * 30
    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 3
    telOffAreaCode As String * 4
    telOffNo As String * 10
    telOffExt As String * 4
    telHomeAreaCode As String * 4
    telHomeNo As String * 10
    telHomeExt As String * 4
    faxAreaCode As String * 4
    faxNo As String * 10
    faxExt As String * 4
    mobileNo As String * 10
    pagerNo As String * 10
    eMail As String * 30
    
    homeCountryId As String * 15
    homeCountryIdDateType As String * 1
    homeCountryIdIssueDateH As String * 8
    homeCountryIdIssueDateG As String * 8
    homeCountryIdExpiryDateH As String * 8
    homeCountryIdExpiryDateG As String * 8
    homeAddress1 As String * 30
    homeAddress2 As String * 30
    homePoBox As String * 10
    homeCityName As String * 20
    homeZipCode As String * 10
    homeCountry As String * 3
    homeTelOffAreaCode As String * 4
    homeTelOffNo As String * 10
    homeTelOffExt As String * 4
    homeTelHomeAreaCode As String * 4
    homeTelHomeNo As String * 10
    homeTelHomeExt As String * 4
    homeFaxAreaCode As String * 4
    homeFaxNo As String * 10
    homeFaxExt As String * 4
    homeMobileNo As String * 10
    homePagerNo As String * 10
    homeEmail As String * 30
    
    educationCode As String * 2
    professionCode As String * 2
    positionCode As String * 2
    monthlyIncome As String * 2
    segmentation As String * 1
    ownerShip As String * 10
    employerName As String * 30
    department As String * 20
    employerPoBox As String * 10
    employerCity As String * 20
    employerZipCode As String * 10
    documents As String * 60
    documentOther As String * 50
    singleJointAcc As String * 1
    packagedAcc As String * 1
    noOfJointAcc As String * 2
    jointAccNameOnCheck As String * 60
    jointAccNameOnReports As String * 30
    signatureNature As String * 1
    electronIntlRequired As String * 1
    electronIntlName As String * 26
    electronIntlSuppRequired As String * 1
    electronIntlSuppName As String * 26
    deliveryToBranchOrPO As String * 1
    deliveryAddress1 As String * 30
    deliveryAddress2 As String * 30
    deliveryPoBox As String * 10
    deliveryCity As String * 20
    deliveryZip As String * 10
    supervisorComments As String * 200
    updateCardAddressReqd As String * 1
    internetBankAcc As String * 1
    custAdviceFlag As String * 1
    altBranchCode As String * 4
    updatedForSama As String * 1
    relationshipManager As String * 25
    generalMemo As String * 25
    interGroupAccNo As String * 14
    specialRefNo As String * 15
    samaAuthNo As String * 15
    samaAuthDateType As String * 1
    samaAuthDateH As String * 8
    samaAuthDateG As String * 8
    cardType As String * 1
    marketingMemo As String * 25
    addressType As String * 1
    custOpenSource As String * 1
    branchCSOId As String * 10
    branchActionDateTime As String * 14
    activityFlag As String * 1
    excludeFromAtmFees As String * 1
    excludeFromMinBalFees As String * 1
    accFreezingGracePeriod As String * 3
    visaNo As String * 15
    visaIssuedAt As String * 20
    visaDateType As String * 1
    visaIssueDateH As String * 8
    visaIssueDateG As String * 8
    visaExpiryDateH As String * 8
    visaExpiryDateG As String * 8
    appRefNo As String * 15
    appDateType As String * 1
    appIssueDateH As String * 8
    appIssueDateG As String * 8
    appExpiryDateH As String * 8
    appExpiryDateG As String * 8
    appRefName As String * 30
    pkgStmtFreqOverride As String * 1
    iqamaType As String * 1
End Type

Public Type newIndividualSaudiInfo
    msgLen As String * 6
    service As String * 2
    branchCode As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    NewOrUpdateFlag As String * 1
    bmUpdateStatus As String * 1
    customerNo As String * 7
    supervisorId As String * 10
    custBranchCode As String * 4
    samaMainCategory As String * 2
    samaSubCategory As String * 2
    screenSetNo As String * 1
    idNo As String * 15
    idIssuedAt As String * 20
    idDateType As String * 1
    idIssueDateH As String * 8
    idIssueDateG As String * 8
    idExpiryDateH As String * 8
    idExpiryDateG As String * 8
    ppNo As String * 15
    ppIssuedAt As String * 20
    ppDateType As String * 1
    ppIssueDateH As String * 8
    ppIssueDateG As String * 8
    ppExpiryDateH As String * 8
    ppExpiryDateG As String * 8
    hafNo As String * 15
    hafIssuedAt As String * 20
    hafDateType As String * 1
    hafIssueDateH As String * 8
    hafIssueDateG As String * 8
    hafExpiryDateH As String * 8
    hafExpiryDateG As String * 8
    frNo As String * 15
    frIssuedAt As String * 20
    frDateType As String * 1
    frIssueDateH As String * 8
    frIssueDateG As String * 8
    frExpiryDateH As String * 8
    frExpiryDateG As String * 8
    certBirthNo As String * 15
    langPref As String * 1
    nationality As String * 3 ' send as "001"
    titleCode As String * 2
    dobDateType As String * 1
    dobDateH As String * 8
    dobDateG As String * 8
    sexCode As String * 1
    vipCode As String * 1
    maritalStatus As String * 1
    noOfDependents As String * 2
    residentStatus As String * 1
    businessType As String * 3
    aFirstName As String * 15
    a2ndName As String * 15
    a3rdName As String * 15
    aLastName As String * 15
    aShortName As String * 30
    eFirstName As String * 15
    e2ndName As String * 15
    e3rdName As String * 15
    eLastName As String * 15
    eShortName As String * 30
    address1 As String * 30
    address2 As String * 30
    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 3
    telOffAreaCode As String * 4
    telOffNo As String * 10
    telOffExt As String * 4
    telHomeAreaCode As String * 4
    telHomeNo As String * 10
    telHomeExt As String * 4
    faxAreaCode As String * 4
    faxNo As String * 10
    faxExt As String * 4
    mobileNo As String * 10
    pagerNo As String * 10
    eMail As String * 30
    educationCode As String * 2
    professionCode As String * 2
    positionCode As String * 2
    monthlyIncome As String * 2
    segmentation As String * 1
    ownerShip As String * 10
    employerName As String * 30
    department As String * 20
    employerPoBox As String * 10
    employerCity As String * 20
    employerZipCode As String * 10
    documents As String * 60
    documentOther As String * 50
    singleJointAcc As String * 1
    packagedAcc As String * 1
    noOfJointAcc As String * 2
    jointAccNameOnCheck As String * 60
    jointAccNameOnReports As String * 30
    signatureNature As String * 1
    electronIntlRequired As String * 1
    electronIntlName As String * 26
    electronIntlSuppRequired As String * 1
    electronIntlSuppName As String * 26
    deliveryToBranchOrPO As String * 1
    deliveryAddress1 As String * 30
    deliveryAddress2 As String * 30
    deliveryPoBox As String * 10
    deliveryCity As String * 20
    deliveryZip As String * 10
    supervisorComments As String * 200
    updateCardAddressReqd As String * 1
    internetBankAcc As String * 1
    custAdviceFlag As String * 1
    altBranchCode As String * 4
    currentAccInfo As String * 12
    savingsAccInfo As String * 12
    updatedForSama As String * 1
    relationshipManager As String * 25
    generalMemo As String * 25
    referenceReqdFor As String * 10
    cardType As String * 1
    marketingMemo As String * 25
    addressType As String * 1
    custOpenSource As String * 1
    branchCSOId As String * 10
    branchActionDateTime As String * 14
    activityFlag As String * 1
    excludeFromAtmFees As String * 1
    excludeFromMinBalFees As String * 1
    accFreezingGracePeriod As String * 3
    samaAuthNo As String * 15
    samaAuthIssuedAt As String * 20
    samaAuthDateType As String * 1
    samaAuthIssueDateH As String * 8
    samaAuthIssueDateG As String * 8
    samaAuthExpiryDateH As String * 8
    samaAuthExpiryDateG As String * 8
    pkgStmtFreqOverride As String * 1
End Type

Public Type IndividualSaudiReferenceInfo
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    branchCode As String * 4
    dateTime As String * 14
    creationOrUpdate As String * 1
    NewOrUpdateFlag As String * 1
    bmUpdateStatus As String * 1
    customerNo As String * 7
    refNo As String * 4
    referenceReqdFor As String * 10 ' changed from '1'
    referenceType As String * 1
    supervisorId As String * 10
    custBranchCode As String * 4
    idType As String * 1
    idNo As String * 15
    idIssuedAt As String * 20
    idDateType As String * 1        ' 0-Hijri ; 1-Gregorian
    idIssueDateH As String * 8
    idIssueDateG As String * 8
    idExpiryDateH As String * 8
    idExpiryDateG As String * 8
    aFirstName As String * 15
    a2ndName As String * 15
    a3rdName As String * 15
    aLastName As String * 15
    aShortName As String * 30
    eFirstName As String * 15
    e2ndName As String * 15
    e3rdName As String * 15
    eLastName As String * 15
    eShortName As String * 30

    address1 As String * 30
    address2 As String * 30

    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 3
    telOffAreaCode As String * 4
    telOffNo As String * 10
    telOffExt As String * 4
    telHomeAreaCode As String * 4
    telHomeNo As String * 10
    telHomeExt As String * 4
    faxAreaCode As String * 4
    faxNo As String * 10
    faxExt As String * 4
    mobileNo As String * 10
    pagerNo As String * 10
    eMail As String * 30
    addressType As String * 1
    custOpenSource As String * 1
    branchCSOId As String * 10
    branchActionDateTime As String * 14
    activityFlag As String * 1
    proxyNo As String * 15
    proxyDateType As String * 1
    proxyIssueDateH As String * 8
    proxyIssueDateG As String * 8
End Type

Public Type IndividualHeirInfo
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    branchCode As String * 4
    dateTime As String * 14
    creationOrUpdate As String * 1
    NewOrUpdateFlag As String * 1
    bmUpdateStatus As String * 1
    customerNo As String * 7
    heirNo As String * 4
    heirType As String * 1
    supervisorId As String * 10
    custBranchCode As String * 4
    idType As String * 1
    idNo As String * 15
    idIssuedAt As String * 20
    idDateType As String * 1        ' 0-Hijri ; 1-Gregorian
    idIssueDateH As String * 8
    idIssueDateG As String * 8
    idExpiryDateH As String * 8
    idExpiryDateG As String * 8
    aFirstName As String * 15
    a2ndName As String * 15
    a3rdName As String * 15
    aLastName As String * 15
    aShortName As String * 30
    eFirstName As String * 15
    e2ndName As String * 15
    e3rdName As String * 15
    eLastName As String * 15
    eShortName As String * 30

    address1 As String * 30
    address2 As String * 30

    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 3
    telOffAreaCode As String * 4
    telOffNo As String * 10
    telOffExt As String * 4
    telHomeAreaCode As String * 4
    telHomeNo As String * 10
    telHomeExt As String * 4
    faxAreaCode As String * 4
    faxNo As String * 10
    faxExt As String * 4
    mobileNo As String * 10
    pagerNo As String * 10
    eMail As String * 30
    addressType As String * 1
    custOpenSource As String * 1
    branchCSOId As String * 10
    branchActionDateTime As String * 14
    activityFlag As String * 1
End Type


Public Type resMsgSaudiIndividualDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    foundInAList As String
    foundInBList As String
    foundInCList As String
    reportedBank As String
    nameInABCList As String
    exisingCustomer As String
    existCustNo As String
    existCustName As String
    newOrUpdate As String
    customerNo As String
    supervisorId As String
    custBranchCode As String
    
    samaMainCategory As String
    samaSubCategory As String
    idNo As String
    idIssuedAt As String
    idDateType As String
    idIssueDateH As String
    idIssueDateG As String
    idExpiryDateH As String
    idExpiryDateG As String
    
    ppNo As String
    ppIssuedAt As String
    ppDateType As String
    ppIssueDateH As String
    ppIssueDateG As String
    ppExpiryDateH As String
    ppExpiryDateG As String
    
    hafizaNo As String
    hafIssuedAt As String
    hafDateType As String
    hafIssueDateH As String
    hafIssueDateG As String
    hafExpiryDateH As String
    hafExpiryDateG As String
    
    familyRegnNo As String
    frIssuedAt As String
    frDateType As String
    frIssueDateH As String
    frIssueDateG As String
    frExpiryDateH As String
    frExpiryDateG As String
    certBirthNo As String
    
    langPref As String
    nationality As String
    titleCode As String
    dobDateType As String
    dobDateH As String
    dobDateG As String
    sexCode As String
    vipCode As String
    maritalStatus As String
    noOfDependents As String
    residentStatus As String
    businessType As String
    
    aFirstName As String
    a2ndName As String
    a3rdName As String
    aLastName As String
    aShortName As String
    eFirstName As String
    e2ndName As String
    e3rdName As String
    eLastName As String
    eShortName As String
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    country As String
    telOffAreaCode As String
    telOffNo As String
    telOffExt As String
    telHomeAreaCode As String
    telHomeNo As String
    telHomeExt As String
    faxAreaCode As String
    faxNo As String
    faxExt As String
    mobileNo As String
    pagerNo As String
    eMail As String
    
    educationCode As String
    professionCode As String
    positionCode As String
    monthlyIncome As String
    segmentation As String
    ownerShip As String
    employerName As String
    department As String
    employerPoBox As String
    employerCity As String
    employerZipCode As String
    documents As String
    documentOther As String
    singleJointAcc As String
    packagedAcc As String
    noOfJointAcc As String
    jointAccNameOnCheck As String
    jointAccNameOnReports As String
    signatureNature As String

    electronIntlRequired As String
    electronIntlName As String
    electronIntlSuppRequired As String
    electronIntlSuppName As String
    deliveryToBranchOrPO As String
    deliveryAddress1 As String
    deliveryAddress2 As String
    deliveryPoBox As String
    deliveryCity As String
    deliveryZip As String
    referenceReqdFor As String
    supervisorComments As String
    custType As String
    currentAccInfo As String
    savingsAccInfo As String
    otherAccInfo As String
    internetBankAcc As String
    custAdviceFlag As String
    altBranchCode As String
    restrictedBranchFlag As String
    updatedForSama As String
    relationshipManager As String
    generalMemo As String
    custOpenDate As String
    branchOpened As String
    openMakerId As String
    openSupervisorId As String
    lastUpdateDate As String
    lastUpdateBranch As String
    lastUpdateMakerId As String
    lastUpdateSupervisorId As String
    keyDateTime As String
    foundInTlist As String
    noOfRecs As String
    cardType As String
    marketingMemo As String
    addressType As String
    custOpenSource As String
    bmUpdateStatus As String
    excludeFromAtmFees As String
    excludeFromMinBalFees As String
    accFreezingGracePeriod As String
    samaAuthNo As String
    samaAuthIssuedAt As String
    samaAuthDateType As String
    samaAuthIssueDateH As String
    samaAuthIssueDateG As String
    samaAuthExpiryDateH As String
    samaAuthExpiryDateG As String
    pkgStmtFreqOverride As String
    displayWarningMsgOnDuplicateId As String
    mainBrCodeUpdAllowed As String
End Type

Public Type resMsgQuickCustPendingDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    foundInAList As String
    foundInBList As String
    foundInCList As String
    reportedBank As String
    nameInABCList As String
    exisingCustomer As String
    existCustNo As String
    existCustName As String
    newOrUpdate As String
    customerNo As String
    supervisorId As String
    custBranchCode As String
    
    samaMainCategory As String
    samaSubCategory As String
    screenSetNo As String
    idNo As String
    idType As String
    idIssuedAt As String
    idDateType As String
    idIssueDateH As String
    idIssueDateG As String
    idExpiryDateH As String
    idExpiryDateG As String
    preferredLang As String
    nationality As String
    titleCode As String
    sexCode As String
    businessType As String
    aFirstName As String
    a2ndName As String
    a3rdName As String
    aLastName As String
    aShortName As String
    eFirstName As String
    e2ndName As String
    e3rdName As String
    eLastName As String
    eShortName As String
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    country As String
    currentAccInfo As String
    cardType As String
    electronIntlRequired As String
    electronIntlName As String
    supervisorComments As String
    altBranchCode As String
    restrictedBranchFlag As String
    custOpenDate As String
    branchOpened As String
    openMakerId As String
    openSupervisorId As String
    lastUpdateDate As String
    lastUpdateBranch As String
    lastUpdateMakerId As String
    lastUpdateSupervisorId As String
    keyDateTime As String
    foundInTlist As String
    noOfRecs As String
    dobDateType As String
    dobDateH As String
    dobDateG As String
    addressType As String
    internalCustomer As String
    displayWarningMsgOnDuplicateId As String
    mainBrCodeUpdAllowed As String
End Type

Public Type resMsgIndividualOthersDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    foundInAList As String
    foundInBList As String
    foundInCList As String
    reportedBank As String
    nameInABCList As String
    exisingCustomer As String
    existCustNo As String
    existCustName As String
    newOrUpdate As String
    customerNo As String
    supervisorId As String
    custBranchCode As String
    
    samaMainCategory As String
    samaSubCategory As String
    screenSetNo As String
    iqamaNo As String
    iqamaIssuedAt As String
    iqamaDateType As String
    iqamaIssueDateH As String
    iqamaIssueDateG As String
    iqamaExpiryDateH As String
    iqamaExpiryDateG As String
    ppNo As String
    ppIssuedAt As String
    ppDateType As String
    ppIssueDateH As String
    ppIssueDateG As String
    ppExpiryDateH As String
    ppExpiryDateG As String
    langPref As String
    nationality As String
    titleCode As String
    dobDateType As String
    dobDateH As String
    dobDateG As String
    sexCode As String
    vipCode As String
    maritalStatus As String
    noOfDependents As String
    residentStatus As String
    businessType As String
    
    aFirstName As String
    a2ndName As String
    a3rdName As String
    aLastName As String
    aShortName As String
    eFirstName As String
    e2ndName As String
    e3rdName As String
    eLastName As String
    eShortName As String
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    country As String
    telOffAreaCode As String
    telOffNo As String
    telOffExt As String
    telHomeAreaCode As String
    telHomeNo As String
    telHomeExt As String
    faxAreaCode As String
    faxNo As String
    faxExt As String
    mobileNo As String
    pagerNo As String
    eMail As String
    
    homeCountryId As String
    homeCountryIdDateType As String
    homeCountryIdIssueDateH As String
    homeCountryIdIssueDateG As String
    homeCountryIdExpiryDateH As String
    homeCountryIdExpiryDateG As String
    homeAddress1 As String
    homeAddress2 As String
    homePoBox As String
    homeCityName As String
    homeZipCode As String
    homeCountry As String
    homeTelOffAreaCode As String
    homeTelOffNo As String
    homeTelOffExt As String
    homeTelHomeAreaCode As String
    homeTelHomeNo As String
    homeTelHomeExt As String
    homeFaxAreaCode As String
    homeFaxNo As String
    homeFaxExt As String
    homeMobileNo As String
    homePagerNo As String
    homeEmail As String
    
    educationCode As String
    professionCode As String
    positionCode As String
    monthlyIncome As String
    segmentation As String
    ownerShip As String
    employerName As String
    department As String
    employerPoBox As String
    employerCity As String
    employerZipCode As String
    documents As String
    documentOther As String
    singleJointAcc As String
    packagedAcc As String
    noOfJointAcc As String
    jointAccNameOnCheck As String
    jointAccNameOnReports As String
    signatureNature As String

    electronIntlRequired As String
    electronIntlName As String
    electronIntlSuppRequired As String
    electronIntlSuppName As String
    deliveryToBranchOrPO As String
    deliveryAddress1 As String
    deliveryAddress2 As String
    deliveryPoBox As String
    deliveryCity As String
    deliveryZip As String
    supervisorComments As String
    custType As String
    currentAccInfo As String
    savingsAccInfo As String
    otherAccInfo As String
    internetBankAcc As String
    custAdviceFlag As String
    altBranchCode As String
    orgAlphaSearchCode As String
    restrictedBranchFlag As String
    updatedForSama As String
    relationshipManager As String
    generalMemo As String
    interGroupAccNo As String
    specialRefNo As String
    samaAuthNo As String
    samaAuthDateType As String
    samaAuthDateH As String
    samaAuthDateG As String
    overrideForNoSamaAuth As String
    custOpenDate As String
    branchOpened As String
    openMakerId As String
    openSupervisorId As String
    lastUpdateDate As String
    lastUpdateBranch As String
    lastUpdateMakerId As String
    lastUpdateSupervisorId As String
    keyDateTime As String
    foundInTlist As String
    noOfRecs As String
    cardType As String
    marketingMemo As String
    addressType As String
    custOpenSource As String
    bmUpdateStatus As String
    excludeFromAtmFees As String
    excludeFromMinBalFees As String
    accFreezingGracePeriod As String
    visaNo As String
    visaIssuedAt As String
    visaDateType As String
    visaIssueDateH As String
    visaIssueDateG As String
    visaExpiryDateH As String
    visaExpiryDateG As String
    approvalRefNo As String
    appDateType As String
    appIssueDateH As String
    appIssueDateG As String
    appExpiryDateH As String
    appExpiryDateG As String
    appRefName As String
    pkgStmtFreqOverride As String
    displayWarningMsgOnDuplicateId As String
    iqamaType As String
    mainBrCodeUpdAllowed As String
End Type

Public Type jointInfoDetails
    custNo As String
    jointCustNo As String
    custBranchCode As String
    custShortName As String
    idType As String
    idNo As String
End Type

Public Type resMsgJointAccSearch
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    details(20) As jointInfoDetails
End Type

Public Type newAcctInfo
    msgLen As String * 6
    service As String * 2
    branchCode As String * 4
    userId   As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    acctNo As String * 14
    newOrUpdate As String * 1
    supervisorId As String * 10
    accStatus As String * 2
    statementFreq As String * 2
    chequeBook As String * 1
    statementDay As String * 1
    droppedAcc As String * 1
    intApplication As String * 1
    crIntRate As String * 9
    drIntRate As String * 9
    payAccNo As String * 14
    uniqueNo As String * 5
    uniqueSub As String * 2
    phaseFlag As String * 1
    initialStatus As String * 2
    statusChanged As String * 1
    fromStatus As String * 2
    toStatus As String * 2
    supervisorComments As String * 200
    acctDesc As String * 30
    samaAccStatus As String * 2
    initialSamaStatus As String * 2
    samaStatusChaged As String * 1
    fromSamaStatus As String * 2
    toSamaStatus As String * 2
    accStatusChangeReason As String * 30
    otherStatusChangeReason As String * 30
    creditLimt As String * 12
    intLastRun As String * 14
    intFreqCode As String * 3
    intApplDay As String * 2
    dormantFlag As String * 1
End Type

Public Type newJointAccInfo
    msgLen As String * 6
    service As String * 2
    branchCode As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    customerNo As String * 7
    jointCustomerNo As String * 2
    newOrUpdate As String * 1
    supervisorId As String * 10
    idNo As String * 15
    idType As String * 1
    idIssuedAt As String * 20
    idDateType As String * 1
    idIssueDateH As String * 8
    idIssueDateG As String * 8
    idExpiryDateH As String * 8
    idExpiryDateG As String * 8
    preferredLang As String * 1
    nationality As String * 20
    titleCode As String * 2
    dobDateType As String * 1
    dobDateH As String * 8
    dobDateG As String * 8
    sexCode As String * 1
    vipCode As String * 1
    maritalStatus As String * 1
    noOfDependents As String * 2
    residentStatus As String * 1
    businessType As String * 4
    aFirstName As String * 15
    a2ndName As String * 15
    a3rdName As String * 15
    aLastName As String * 15
    aShortName As String * 30
    eFirstName As String * 15
    e2ndName As String * 15
    e3rdName As String * 15
    eLastName As String * 15
    eShortName As String * 30
    address1 As String * 30
    address2 As String * 30
    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 20
    telOffAreaCode As String * 4
    telOffNo As String * 10
    telOffExt As String * 4
    telHomeAreaCode As String * 4
    telHomeNo As String * 10
    telHomeExt As String * 4
    faxAreaCode As String * 4
    faxNo As String * 10
    faxExt As String * 4
    mobileNo As String * 10
    pagerNo As String * 10
    eMail As String * 30
    educationCode As String * 2
    professionCode As String * 2
    positionCode As String * 2
    monthlyIncome As String * 2
    ownerShip As String * 10
    segmentation As String * 1
    employerName As String * 30
    department As String * 20
    employerPoBox As String * 10
    employerCity As String * 20
    employerZipCode As String * 10
    activeStatus As String * 1
    addressType As String * 1
    custOpenSource As String * 1
    branchCSOId As String * 10
    branchActionDateTime As String * 14
    activityFlag As String * 1
End Type

Public Type newCardInfo
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    branchCode As String * 4
    dateTime As String * 14
    creationOrUpdate As String * 1
    newOrUpdate As String * 1
    supervisorId As String * 10
    custNo As String * 8
    cardNo As String * 19
    cardType As String * 1
    newOrReplacement As String * 1
    primaryOrSupplementary As String * 1
    cardStatus As String * 1
    regionCode As String * 1
    languageCode As String * 1
    customerBranch As String * 4
    nameOnTheCard As String * 26
    subAcc As String * 4
    deliveryToBranchOrPO As String * 1
    address1 As String * 30
    address2 As String * 30
    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    firstIssueDate As String * 8
    expiryDate As String * 8
    supervisorComments As String * 200
    idNo As String * 10
    coreAccNo As String * 16
    oldCardNo As String * 19
    oldExpiryDate As String * 4
End Type

Public Type NewStdOrdRequest
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    newOrUpdate As String * 1
    accNo As String * 14
    sodNo As String * 6
    orderType As String * 1
    paymentType As String * 1
    paymentMode As String * 1
    paymentFrequency As String * 1
    firstPaymentDate As String * 8
    nextPaymentDate As String * 8
    finalPaymentDate As String * 8
    lastProcessedDate As String * 8
    paymentsToBeMade As String * 3
    paymentsMade As String * 3
    limitInExcessFlag As String * 1
    commissionFlag As String * 1
    processNextDayFlag As String * 1
    thresholdAmt As String * 10
    paymentAmt As String * 14
    totalPaidToDate As String * 14
    totalToPay As String * 14
    payAccNo As String * 14
    drNarrative1 As String * 20
    drNarrative2 As String * 20
    crNarrative1 As String * 20
    crNarrative2 As String * 20
    transactionDateFlag As String * 1
    branchCode As String * 4
    supervisorComments As String * 200
    remarks As String * 25
End Type

Public Type newStopCheqRequest
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    newOrUpdate As String * 1
    accNo As String * 14
    chequeNo As String * 10
    amount As String * 14
    dateStop As String * 8
    payeeName As String * 25
    chequeFrom As String * 8
    supervisorComments As String * 200
End Type

Public Type SupervisorActionMsgOnJoint
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    custNo   As String
    jointCustomerNo As String
    newOrUpdate As String
    supervisorId As String
    idNo As String
    idType As String
    idIssuedAt As String
    idDateType As String
    idIssueDateH As String
    idIssueDateG As String
    idExpiryDateH As String
    idExpiryDateG As String
    preferredLang As String
    nationality As String
    titleCode As String
    dobDateType As String
    dobDateH As String
    dobDateG As String
    sexCode As String
    vipCode As String
    maritalStatus As String
    noOfDependents As String
    residentStatus As String
    businessType As String
    aFirstName As String
    a2ndName As String
    a3rdName As String
    aLastName As String
    aShortName As String
    eFirstName As String
    e2ndName As String
    e3rdName As String
    eLastName As String
    eShortName As String
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    country As String
    telOffAreaCode As String
    telOffNo As String
    telOffExt As String
    telHomeAreaCode As String
    telHomeNo As String
    telHomeExt As String
    faxAreaCode As String
    faxNo As String
    faxExt As String
    mobileNo As String
    pagerNo As String
    eMail As String
    educationCode As String
    professionCode As String
    positionCode As String
    monthlyIncome As String
    ownerShip As String
    segmentation As String
    employerName As String
    department As String
    employerPoBox As String
    employerCity As String
    employerZipCode As String
    activeStatus As String
    addressType As String
    custOpenSource As String
End Type

Public Type cardTrkInfo
    cardNo As String
    nameOnTheCard As String
    custBranchCode As String
    cardExpiryDate As String
    trk1 As String
    trk2 As String
    branchPinSelect As String
End Type

Public Type supervisorDecision
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    appRejectFlag As String
    custNo   As String
    nameChanged As String
    addressChanged As String
    tpinSelected As String
    filler As String
    primaryCard As cardTrkInfo
    suppCard As cardTrkInfo
    ibanAccNo As String
End Type
   
Public Type loginMessage
    msgLen As String
    status As String
    service As String
    langPref As String
    lastPasswordChangeDate As String
    branchCode As String
    authorityLevel As String
    globalUpdatePriv As String
    aRemarks As String
    eRemarks As String
    bankingDate As String
    cardPrdnAtBranch As String
    pinSelectAtBranch As String
    passwdChngAlertFlag As String
    mainBrEditAllowed As String
    currentDateH As String
    currentDateG As String
    tpinSelectAtBranch As String
    dormantActivationFlag As String
    tpinMandatoryAtBranch As String
    idleTimeOutPeriod As String
    nameSearchAllowed As String
    stdOrdReqAllowed As String
    custNameUpdAllowed As String
    enableChipCard As String
    mailCentreBranch As String
    mandateBranch As String
    callCentreBranch As String
    internalCustOpenAllowed As String
    enableLocalChipCard As String
    generalCustOpenAllowed As String
    pensionCustOpenAllowed As String 'added by Mohit on 28-Nov-2006
    feeExclusionUpdAllowed As String
    enableSadadProfile As String
    maxAgeLimit As String
    filler As String
    authorityLevel2 As String
    generalSamaUpdAllowed As String
    swiftCentreBranchFlag As String
    bpUserId As String
    payrollBranch As String
    accOpenCardPrintAllowed As String
End Type

Public Type reqMsgMerchStmt
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    lastTransPtr As String * 5
    stmtType As String * 1
    merchantNo As String * 16
    fromDate As String * 8
    toDate As String * 8
End Type

Public Type resMsgMerchStmt
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    merchNo As String
    completionFlag As String
    filler As String
    transDetails(50) As String
End Type

Public Type custHistDetails
    branchCode As String
    userId As String
    dateTime As String
    pendingStatus As String
    supervisorId As String
    approvedDateTime As String
    mainCategoryCode As String
    subCategoryCode As String
End Type

Public Type resMsgCustHistory
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    custNo As String
    custName As String
    custBranchCode As String
    filler As String
    details(20) As custHistDetails
End Type

Public Type acctHistDetails
    branchCode As String
    userId As String
    dateTime As String
    pendingStatus As String
    supervisorId As String
    approvedDateTime As String
End Type

Public Type resMsgAcctHistory
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    accNo As String
    filler As String
    details(20) As acctHistDetails
End Type

Public Type resMsgCheckCategory
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    samaMainCategory As String
    samaSubCategory As String
    categoryStatus As String
    generalCustOpenAllowed As String
End Type

Public Type referenceDetails
    custNo As String
    referenceNo As String
    custBranchCode As String
    custShortName As String
    idType As String
    idNo As String
End Type

Public Type resMsgReferenceSearch
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    details(20) As referenceDetails
End Type

Public Type resMsgReferenceDetail
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    custNo As String
    referenceNo As String
    referenceReqdFor As String
    referenceType As String
    newOrUpdate As String
    supervisorId As String
    custBranchCode As String
    
    idType As String
    idNo As String
    idIssuedAt As String
    idDateType As String
    idIssueDateH As String
    idIssueDateG As String
    idExpiryDateH As String
    idExpiryDateG As String

    aFirstName As String
    a2ndName As String
    a3rdName As String
    aLastName As String
    aShortName As String
    eFirstName As String
    e2ndName As String
    e3rdName As String
    eLastName As String
    eShortName As String
    
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    country As String
    telOffAreaCode As String
    telOffNo As String
    telOffExt As String
    telHomeAreaCode As String
    telHomeNo As String
    telHomeExt As String
    faxAreaCode As String
    faxNo As String
    faxExt As String
    mobileNo As String
    pagerNo As String
    eMail As String
    addressType As String
    custOpenSource As String
    proxyNo As String
    proxyDateType As String
    proxyIssueDateH As String
    proxyIssueDateG As String
End Type

Public Type resMsgCheckId
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    idType As String
    idNo As String
    idExistFlag As String
    idIssuedAt As String
    idDateType As String
    idIssueDateH As String
    idIssueDateG As String
    idExpiryDateH As String
    idExpiryDateG As String
End Type

Public Type newJuristicCustomerInfo
    msgLen As String * 6
    service As String * 2
    branchCode As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    NewOrUpdateFlag As String * 1
    bmUpdateStatus As String * 1
    customerNo As String * 7
    supervisorId As String * 10
    custBranchCode As String * 4
    samaMainCategory As String * 2
    samaSubCategory As String * 2
    screenSetNo As String * 1
    crNo As String * 15
    crIssuedAt As String * 20
    crDateType As String * 1
    crIssueDateH As String * 8
    crIssueDateG As String * 8
    crExpiryDateH As String * 8
    crExpiryDateG As String * 8
    licNo As String * 15
    licDateType As String * 1
    licIssueDateH As String * 8
    licIssueDateG As String * 8
    licExpiryDateH As String * 8
    licExpiryDateG As String * 8
    samaAuthNo As String * 15
    samaAuthDateType As String * 1
    samaAuthIssueDateH As String * 8
    samaAuthIssueDateG As String * 8
    samaAuthExpiryDateH As String * 8
    samaAuthExpiryDateG As String * 8
    ppNo As String * 15
    ppDateType As String * 1
    ppIssueDateH As String * 8
    ppIssueDateG As String * 8
    ppExpiryDateH As String * 8
    ppExpiryDateG As String * 8
    dcNo As String * 15
    dcDateType As String * 1
    dcIssueDateH As String * 8
    dcIssueDateG As String * 8
    dcExpiryDateH As String * 8
    dcExpiryDateG As String * 8
    visaNo As String * 15
    visaDateType As String * 1
    visaIssueDateH As String * 8
    visaIssueDateG As String * 8
    visaExpiryDateH As String * 8
    visaExpiryDateG As String * 8
    contractNo As String * 15
    contractDateType As String * 1
    contractIssueDateH As String * 8
    contractIssueDateG As String * 8
    contractExpiryDateH As String * 8
    contractExpiryDateG As String * 8
    langPref As String * 1
    nationality As String * 3
    purposeOfAccount As String * 50
    govtShareHoldingPerc As String * 3
    saudiShareHoldingPerc As String * 3
    foreignShareHoldingPerc As String * 3
    doeDateType As String * 1
    doeDateH As String * 8
    doeDateG As String * 8
    residentStatus As String * 1
    businessType As String * 3
    aOrgFirstName As String * 30
    aOrg2ndName As String * 30
    aOrgShortName As String * 30
    eOrgFirstName As String * 30
    eOrg2ndName As String * 30
    eOrgShortName As String * 30
    alphaSearchCode As String * 6
    address1 As String * 30
    address2 As String * 30
    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 3
    telOffAreaCode As String * 4
    telOffNo As String * 10
    telOffExt As String * 4
    telHomeAreaCode As String * 4
    telHomeNo As String * 10
    telHomeExt As String * 4
    faxAreaCode As String * 4
    faxNo As String * 10
    faxExt As String * 4
    mobileNo As String * 10
    pagerNo As String * 10
    eMail As String * 30

    homeAddress1 As String * 30
    homeAddress2 As String * 30
    homePoBox As String * 10
    homeCityName As String * 20
    homeZipCode As String * 10
    homeCountry As String * 3
    homeTelOffAreaCode As String * 4
    homeTelOffNo As String * 10
    homeTelOffExt As String * 4
    homeTelHomeAreaCode As String * 4
    homeTelHomeNo As String * 10
    homeTelHomeExt As String * 4
    homeFaxAreaCode As String * 4
    homeFaxNo As String * 10
    homeFaxExt As String * 4
    homeMobileNo As String * 10
    homePagerNo As String * 10
    homeEmail As String * 30
    documents As String * 60
    documentOther As String * 50
    signatureNature As String * 1
    supervisorComments As String * 200
    internetBankAcc As String * 1
    custAdviceFlag As String * 1
    altBranchCode As String * 4
    updatedForSama As String * 1
    relationshipManager As String * 25
    generalMemo As String * 25
    marketingMemo As String * 25
    addressType As String * 1
    accFreezingGracePeriod As String * 3
    appRefNo As String * 15
    appDateType As String * 1
    appIssueDateH As String * 8
    appIssueDateG As String * 8
    appExpiryDateH As String * 8
    appExpiryDateG As String * 8
    appRefName As String * 30
End Type

Public Type resMsgJuristicPendingDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    exisingCustomer As String
    existCustNo As String
    existCustName As String
    newOrUpdate As String
    customerNo As String
    supervisorId As String
    custBranchCode As String
    
    samaMainCategory As String
    samaSubCategory As String
    crNo As String
    crIssuedAt As String
    crDateType As String
    crIssueDateH As String
    crIssueDateG As String
    crExpiryDateH As String
    crExpiryDateG As String
    licNo As String
    licDateType As String
    licIssueDateH As String
    licIssueDateG As String
    licExpiryDateH As String
    licExpiryDateG As String
    samaAuthNo As String
    samaAuthDateType As String
    samaAuthIssueDateH As String
    samaAuthIssueDateG As String
    samaAuthExpiryDateH As String
    samaAuthExpiryDateG As String
    ppNo As String
    ppDateType As String
    ppIssueDateH As String
    ppIssueDateG As String
    ppExpiryDateH As String
    ppExpiryDateG As String
    dcNo As String
    dcDateType As String
    dcIssueDateH As String
    dcIssueDateG As String
    dcExpiryDateH As String
    dcExpiryDateG As String
    visaNo As String
    visaDateType As String
    visaIssueDateH As String
    visaIssueDateG As String
    visaExpiryDateH As String
    visaExpiryDateG As String
    contractNo As String
    contractDateType As String
    contractIssueDateH As String
    contractIssueDateG As String
    contractExpiryDateH As String
    contractExpiryDateG As String
    langPref As String
    nationality As String
    purposeOfAccount As String
    govtShareHoldingPerc As String
    saudiShareHoldingPerc As String
    foreignShareHoldingPerc As String
    doeDateType As String
    doeDateH As String
    doeDateG As String
    businessType As String
    
    aOrgFirstName As String
    aOrg2ndName As String
    aOrgShortName As String
    eOrgFirstName As String
    eOrg2ndName As String
    eOrgShortName As String
    orgAlphaSearch As String
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    country As String
    telOffAreaCode As String
    telOffNo As String
    telOffExt As String
    telHomeAreaCode As String
    telHomeNo As String
    telHomeExt As String
    faxAreaCode As String
    faxNo As String
    faxExt As String
    mobileNo As String
    pagerNo As String
    eMail As String
    
    homeAddress1 As String
    homeAddress2 As String
    homePoBox As String
    homeCityName As String
    homeZipCode As String
    homeCountry As String
    homeTelOffAreaCode As String
    homeTelOffNo As String
    homeTelOffExt As String
    homeTelHomeAreaCode As String
    homeTelHomeNo As String
    homeTelHomeExt As String
    homeFaxAreaCode As String
    homeFaxNo As String
    homeFaxExt As String
    homeMobileNo As String
    homePagerNo As String
    homeEmail As String
    
    documents As String
    documentOther As String
    signatureNature As String

    supervisorComments As String
    custType As String
    currentAccInfo As String
    savingsAccInfo As String
    otherAccInfo As String
    internetBankAcc As String
    custAdviceFlag As String
    altBranchCode As String
    restrictedBranchFlag As String
    updatedForSama As String
    relationshipManager As String
    generalMemo As String
    overrideForNoSamaAuth As String
    overrideForNonSaudi As String
    custOpenDate As String
    branchOpened As String
    openMakerId As String
    openSupervisorId As String
    lastUpdateDate As String
    lastUpdateBranch As String
    lastUpdateMakerId As String
    lastUpdateSupervisorId As String
    keyDateTime As String
    foundInTlist As String
    noOfRecs As String
    marketingMemo As String
    addressType As String
    accFreezingGracePeriod As String
    approvalRefNo As String
    appDateType As String
    appIssueDateH As String
    appIssueDateG As String
    appExpiryDateH As String
    appExpiryDateG As String
    appRefName As String
    signatoryForOthers As String
    duplicateAccNo As String
    displayWarningMsgOnDuplicateId As String
    mainBrCodeUpdAllowed As String
End Type

Public Type newSignatoryInfo
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    NewOrUpdateFlag As String * 1
    bmUpdateStatus As String * 1
    accNo As String * 14
    signatoryNo As String * 4
    supervisorId As String * 10
    custBranchCode As String * 4
    idType As String * 1
    idNo As String * 15
    idIssuedAt As String * 20
    idDateType As String * 1        ' 0-Hijri ; 1-Gregorian
    idIssueDateH As String * 8
    idIssueDateG As String * 8
    idExpiryDateH As String * 8
    idExpiryDateG As String * 8
    aFirstName As String * 15
    a2ndName As String * 15
    a3rdName As String * 15
    aLastName As String * 15
    aShortName As String * 30
    eFirstName As String * 15
    e2ndName As String * 15
    e3rdName As String * 15
    eLastName As String * 15
    eShortName As String * 30
    
    diplomaticPpNo As String * 15
    activeStatus As String * 1
    disableReason As String * 25
End Type

Public Type signatoryDetails
    accNo As String
    signatoryNo As String
    custBranchCode As String
    custShortName As String
    idType As String
    idNo As String
End Type

Public Type resMsgSignatorySearch
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    details(20) As signatoryDetails
End Type

Public Type resMsgSignatory
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    duplicateAccNo As String
End Type

Public Type resMsgSignatoryDetail
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    accNo As String
    signatoryNo As String
    newOrUpdate As String
    supervisorId As String
    custBranchCode As String
    idType As String
    idNo As String
    idIssuedAt As String
    idDateType As String
    idIssueDateH As String
    idIssueDateG As String
    idExpiryDateH As String
    idExpiryDateG As String
    aFirstName As String
    a2ndName As String
    a3rdName As String
    aLastName As String
    aShortName As String
    eFirstName As String
    e2ndName As String
    e3rdName As String
    eLastName As String
    eShortName As String
    diplomaticPpNo As String
    activeStatus As String
    disableReason As String
End Type

Public Type ownerDetails
    custNo As String
    ownerNo As String
    custBranchCode As String
    custShortName As String
    idType As String
    idNo As String
End Type

Public Type resMsgOwnerSearch
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    details(20) As ownerDetails
End Type

Public Type newOwnerInfo
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    NewOrUpdateFlag As String * 1
    bmUpdateStatus As String * 1
    custNo As String * 14
    ownerNo As String * 4
    supervisorId As String * 10
    custBranchCode As String * 4
    idType As String * 1
    idNo As String * 15
    idIssuedAt As String * 20
    idDateType As String * 1        ' 0-Hijri ; 1-Gregorian
    idIssueDateH As String * 8
    idIssueDateG As String * 8
    idExpiryDateH As String * 8
    idExpiryDateG As String * 8
    ownerType As String * 1
    parentCompanyName As String * 30
    shareHoldingPerc As String * 3
    
    aFirstName As String * 15
    a2ndName As String * 15
    a3rdName As String * 15
    aLastName As String * 15
    aShortName As String * 30
    eFirstName As String * 15
    e2ndName As String * 15
    e3rdName As String * 15
    eLastName As String * 15
    eShortName As String * 30
    address1 As String * 30
    address2 As String * 30
    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 3
    telOffAreaCode As String * 4
    telOffNo As String * 10
    telOffExt As String * 4
    telHomeAreaCode As String * 4
    telHomeNo As String * 10
    telHomeExt As String * 4
    faxAreaCode As String * 4
    faxNo As String * 10
    faxExt As String * 4
    mobileNo As String * 10
    pagerNo As String * 10
    eMail As String * 30
    
    homeAddress1 As String * 30
    homeAddress2 As String * 30
    homePoBox As String * 10
    homeCityName As String * 20
    homeZipCode As String * 10
    homeCountry As String * 3
    homeTelOffAreaCode As String * 4
    homeTelOffNo As String * 10
    homeTelOffExt As String * 4
    homeTelHomeAreaCode As String * 4
    homeTelHomeNo As String * 10
    homeTelHomeExt As String * 4
    homeFaxAreaCode As String * 4
    homeFaxNo As String * 10
    homeFaxExt As String * 4
    homeMobileNo As String * 10
    homePagerNo As String * 10
    homeEmail As String * 30
    activeStatus As String * 1
    addressType As String * 1
End Type

Public Type resMsgOwnerDetail
    msgLen As String
    service As String
    status As String
    aRemarks As String
    eRemarks As String
    custNo As String
    ownerNo As String
    ownerType As String
    newOrUpdate As String
    supervisorId As String
    custBranchCode As String
    
    idType As String
    idNo As String
    idIssuedAt As String
    idDateType As String
    idIssueDateH As String
    idIssueDateG As String
    idExpiryDateH As String
    idExpiryDateG As String
    parentCompanyName As String
    shareHoldingPerc As String
    
    aFirstName As String
    a2ndName As String
    a3rdName As String
    aLastName As String
    aShortName As String
    eFirstName As String
    e2ndName As String
    e3rdName As String
    eLastName As String
    eShortName As String
    
    address1 As String
    address2 As String
    poBox As String
    cityName As String
    zipCode As String
    country As String
    telOffAreaCode As String
    telOffNo As String
    telOffExt As String
    telHomeAreaCode As String
    telHomeNo As String
    telHomeExt As String
    faxAreaCode As String
    faxNo As String
    faxExt As String
    mobileNo As String
    pagerNo As String
    eMail As String
    homeAddress1 As String
    homeAddress2 As String
    homePoBox As String
    homeCityName As String
    homeZipCode As String
    homeCountry As String
    homeTelOffAreaCode As String
    homeTelOffNo As String
    homeTelOffExt As String
    homeTelHomeAreaCode As String
    homeTelHomeNo As String
    homeTelHomeExt As String
    homeFaxAreaCode As String
    homeFaxNo As String
    homeFaxExt As String
    homeMobileNo As String
    homePagerNo As String
    homeEmail As String
    activeStatus As String
    addressType As String
End Type

Public Type reqMsgGeneralCustStatusEnq
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    fromDate As String * 8
    toDate As String * 8
    recordStatus As String * 1
    lastRecCount As String * 5
End Type

Public Type reqMsgTransferEnq
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    accNo As String * 14
    fromDate As String * 8
    toDate As String * 8
    bpRefNo As String * 10
    recordStatus As String * 1
    lastRecCount As String * 5
End Type

Public Type transferInfo
    transRefNo As String
    issueDate As String
    valueDate As String
    drAccNo As String
    transCurr As String
    transAmt As String
    paymentCurr As String
    paymentAmt As String
    recordStatus As String
End Type

Public Type resMsgTransferEnq
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    totNoOfTrans As String
    lastRecCount As String
    noOfRecs As String
    accNo As String
    completionFlag As String
    details(20) As transferInfo
End Type

Public Type generalCustInfo
    branchCode As String
    userId As String
    dateTime As String
    custNo As String
    custBranchCode As String
    pendingStatus As String
    branchUserId As String
    branchActionDateTime As String
    branchSupervisorId As String
    approvedDateTime As String
    custOpenDate As String
End Type

Public Type resMsgGeneralCustStatusEnq
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    recordStatus As String
    completionFlag As String
    details(20) As generalCustInfo
End Type

Public Type resMsgBmTransDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    accNo As String
    transRefNo As String
    custName As String
    postDate As String
    valueDate As String
    transAmt As String
    transType As String
    userId As String
    supervisorId As String
    stmtFlag As String
    narrative1 As String
    narrative2 As String
    narrative3 As String
End Type

Public Type reqMsgBmTransEnq
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    accNo As String * 14
    fromDate As String * 8
    toDate As String * 8
    transType As String * 2
    lastRecCount As String * 5
End Type

Public Type bmTransInfo
    transRefNo As String
    transDate As String
    valueDate As String
    userId As String
    transAmt As String
    transCtr As String
    transType As String
End Type

Public Type resMsgBmTransEnq
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    totNoOfTrans As String
    lastRecCount As String
    noOfRecs As String
    accNo As String
    completionFlag As String
    details(20) As bmTransInfo
End Type

Public Type blockInfo
    productType As String
    productNo As String
    blockedAmt As String
    userId As String
End Type

Public Type resMsgBlockBreakup
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    noOfRecs As String
    accNo As String
    blockedBal As String
    clearedBal As String
    details(35) As blockInfo
End Type


Public recvLoginMsg As loginMessage
Public recvMsg As incommingMessage
Public recvCustomerMsg As resMsgCustomer
Public recvCustHistoryMsg As resMsgCustHistory
Public recvAcctHistoryMsg As resMsgAcctHistory
Public recvCardMsg As resMsgCard
Public recvTpinStatusMsg As resMsgTpinStatus
Public recvTpinPendingList As resMsgTpinPendingList
Public recvSearchMsg As resMsgsearch
Public recvAccSearchMsg As resMsgAccSearch
Public recvCardSearchMsg As resMsgCardSearch
Public recvPensionSearchMsg As resMsgPensionSearch
Public recvPensionDetail As resMsgPensionDetail
Public recvPensionInh As resMsgPenInh
Public recvPenCashDetail As resMsgPenCashDetail
Public recvStopChqSearchMsg As resMsgStopChqSearch
Public recvChequeBookSearchMsg As resMsgChequeBookSearch
Public recvChequeBookDetail As resMsgChequeBookDetails
Public recvChequeBookHistory As resMsgChequeBookHistory
Public recvChequeBookReport As resMsgChequeBookReport
Public recvAcctStatusHistory As resMsgAcctStatusHistory
Public recvStopChqDetail  As resMsgStopChqDetail
Public recvStdOrdSearchMsg As resMsgStdOrdSearch
Public recvStdOrdPendingList As resMsgStdOrdPendingList
Public recvStdOrdDetail As resMsgStdOrdDetails
Public recvStopChqPendingList As resMsgStopChqPendingList
Public recvStatusListMsg As resMsgStatusList
Public recvChqBkStatusListMsg As resMsgChqBkStatusList
Public statusUpdateMsg As reqMsgStatusUpdate
Public chqBkStatusUpdateMsg As reqMsgChqBkStatusUpdate
Public recvAccPendingList As resMsgAccPendingList
Public recvCardPendingList As resMsgCardPendingList
Public recvCardPendingDetail As resMsgCardPendingDetails
Public recvCardHistory As resMsgCardHistory
Public recvPendingList As resMsgPendingList
Public recvSuperActionMsg As SupervisorActionMsg
Public recvQuickCustMsg As resMsgQuickCustPendingDetail
Public recvOtherIndividualMsg As resMsgIndividualOthersDetail
Public recvSaudiIndividualMsg As resMsgSaudiIndividualDetail
Public recvJuristicMsg As resMsgJuristicPendingDetail
Public recvSuperDecisionMsg As supervisorDecision
Public recvCardApprovalMsg As resMsgCardApproval
Public recvPrintCardMsg As resMsgPrintCard
Public recvAccApprovalMsg As resMsgAccApproval
Public recvStdOrdApprovalMsg As resMsgStdOrdApproval
Public recvStopChqApprovalMsg As resMsgStopChqApproval
Public recvJointInfo As SupervisorActionMsgOnJoint
Public recvMerchStmtMsg As resMsgMerchStmt
Public reqMerchMsg As reqMsgMerchStmt
Public recvCheckCategoryMsg As resMsgCheckCategory
Public recvJointSearchMsg As resMsgJointAccSearch
Public recvReferenceSearchMsg As resMsgReferenceSearch
Public recvReferenceDetailMsg As resMsgReferenceDetail
Public recvHeirDetailMsg As resMsgReferenceDetail
Public recvSignatorySearchMsg As resMsgSignatorySearch
Public recvSignatoryDetailMsg As resMsgSignatoryDetail
Public recvSignatoryMsg As resMsgSignatory
Public recvCheckIdMsg As resMsgCheckId
Public recvOwnerSearchMsg As resMsgOwnerSearch
Public recvOwnerDetailMsg As resMsgOwnerDetail
Public transferEnqMsg As reqMsgTransferEnq
Public recvTransferEnqMsg As resMsgTransferEnq
Public recvBmTransDetail As resMsgBmTransDetail
Public bmTransEnq As reqMsgBmTransEnq
Public recvBmTransEnqMsg As resMsgBmTransEnq
Public recvBlockBreakupMsg As resMsgBlockBreakup

Public custInfo As NewCustomerInfo
Public individualOthersInfo As NewIndividualOthersInfo
Public individualSaudiInfo As newIndividualSaudiInfo
Public IndividualSaudiRefInfo As IndividualSaudiReferenceInfo
Public juristicCustInfo As newJuristicCustomerInfo
Public signatoryInfo As newSignatoryInfo
Public ownerInfo As newOwnerInfo

Public acctInfo As newAcctInfo
Public jointInfo As newJointAccInfo
Public cardInfo As newCardInfo
Public stdOrdInfo As NewStdOrdRequest
Public stopChqInfo As newStopCheqRequest
Public arabicName As String * 30
Public englishName As String * 30
Public OtherDetails As String * 180
Public LoadError As Boolean
Public CityCode As String * 4
Public UserLang As Integer
Public noOfJoint As String * 2
Public noOfSignatory As String * 4
Public noOfOwners As String * 4
Public noOfReference As String * 4
Public jointInfoChanged As Boolean
Public passwordChange As Boolean
Public gBranchCode As String * 4
Public bankingDate As String * 8
Public rBranchCode As String * 4
Public gUserId As String
Public gDateTime As String * 14
Public cardProductionAtBranch As Boolean
Public pinSelectAtBranch As Boolean
Public tpinSelectAtBranch As Boolean
Public dormantActivationAllowed As Boolean
Public tpinMandatoryAtBranch As Boolean
Public nameSearchAllowedAtBranch As Boolean
Public accSearchAction As Boolean
Public accUpdateAction As Boolean
Public accSupervisorAction As Boolean
Public accTellerAction As Boolean
Public accHistoryAction As Boolean
Public stdOrdSupervisorAction As Boolean
Public stdOrdTellerAction As Boolean
Public stdOrdUpdateAction As Boolean
Public stdOrdSearchAction As Boolean
Public stopChqSearchAction As Boolean
Public stopChqCreateAction As Boolean
Public stopChqTellerAction As Boolean
Public stopChqUpdateAction As Boolean
Public stopChqSupervisorAction As Boolean
Public chequeBookCreateAction As Boolean
Public chequeBookUpdateAction As Boolean
Public cardSearchAction As Boolean
Public cardUpdateAction As Boolean
Public cardHistoryAction As Boolean
Public cardApprovalAction As Boolean
Public cardSupervisorAction As Boolean
Public cardTellerAction As Boolean
Public cbsCardCreationAction As Boolean
Public supervisorAction As Boolean
Public tellerAction As Boolean
Public searchAction As Boolean
Public custHistoryAction As Boolean
Public updateAction As Boolean
Public phoneCustOpenAction As Boolean
Public blockAddAction As Boolean
Public blockUpdAction As Boolean
Public blockDelAction As Boolean
Public blockTellerAction As Boolean
Public blockSupervisorAction As Boolean
Public jointAddAction As Boolean
Public jointUpdateAction As Boolean
Public swiftUpdateAction As Boolean
Public swiftEnquiryAction As Boolean
Public swiftTellerAction As Boolean
Public swiftSupervisorAction As Boolean
Public activityFlag As String * 1
Public tCustNo As String * 8
Public gCustNo As String
Public tpinUserId As String
Public tpinDateTime As String
Public tpinSupervisorId As String
Public gAccNo As String * 14
Public realOrPseudo As String
Public currentHijriDate As String
Public currentGregDate As String
Public atmPin As String * 4
Public atmPin1 As String * 4
Public atmPin2 As String * 4
Public jointKeyBranch As String
Public jointKeyUserId As String
Public jointKeyDateTime As String
Public referenceKeyBranch As String
Public referenceKeyUserId As String
Public referenceKeyDateTime As String
Public signatoryKeyBranch As String
Public signatoryKeyUserId As String
Public signatoryKeyDateTime As String
Public ownerKeyBranch As String
Public ownerKeyUserId As String
Public ownerKeyDateTime As String
Public currentAccInfo As String
Public savingAccInfo As String
Public otherAccInfo As String
Public userAuthLevel As String
Public stmtPath As String
Public utilPath As String
Public outPath As String
Public reqPath As String
Public histHost As String
Public histUser As String
Public db As Database
Public transDb As Database
Public rs As Recordset

Public SendMsg As String
Public RecvStr As String
Public hostName As String
Public dbPath As String
Public transDbPath As String
Public bpdbPath As String
'Public bpExePath As String
Public startupLang As String * 1
Public port As Integer
Public ConnectTimeOut As Variant
Public ReceiveTimeOut As Variant
Public DataReceivedFlag As Boolean
Public HostConnected As Boolean
Public TimeOutFlag As Boolean
Public MsgWouldBlock As Boolean
Public ReturnStatus As String
Public merchantHost As String
Public merchantPort As Integer
Public assignTextBox As Boolean
Public screenSetNo As String
Public mainCategoryCode As String
Public subCategoryCode As String
Public mainCategoryDesc As String
Public subCategoryDesc As String
Public documentsSelected As String
Public otherDocumentsEntered As String
Public forReference As Integer
Public saveRecvStr As String
Public saveMainCategory As String
Public saveSubCategory As String
Public dormantFlag As String
Public userLoggedIn As Boolean
Public gInactiveTime As Variant
Public secsUserInactive As Variant
Public histLogFile
Public stmtArabicChars As String
Public cardPrinterName As String
Public receiptPrinterName As String

Public frmEnquiryCaption(30, 2) As String
Public frmChangePasswordCaption(6, 2) As String
Public frmCustomerCaption(75, 2) As String
Public frmCustomer2Caption(75, 2) As String
Public frmCustomer3Caption(80, 2) As String

Public frmJointAccNameCaption(4, 2) As String
Public frmSupervisorApprovalCaption(15, 2) As String
Public frmSupervisorRejectionCaption(4, 2) As String
Public frmEnquirySelectCaption(27, 2) As String

Public frmResetPasswordCaption(5, 2) As String
Public frmChangeScreenLangCaption(10, 2) As String
Public frmCardGridCaption(20, 2) As String
Public frmCardDetailsCaption(58, 2) As String
Public frmCardHistoryCaption(28, 2) As String
Public frmCardPendingListCaption(14, 2) As String
Public frmCardDeactivationCaption(10, 2) As String
Public frmCardRejectionCaption(4, 2) As String
Public frmCardReceiptCaption(13, 2) As String
Public frmCardChangeAddressCaption(2, 2) As String
Public frmCardRenewalCaption(6, 2) As String

Public mnuCustomerCaption1(2, 2) As String
Public mnuCustomerCaption(15, 2) As String 'Changed from 13 to 14 by Mohit on 21 August, 2007
Public mnuSupervisorCaption(19, 2) As String
Public mnuAtmCardCaption(3, 2) As String
Public mnuAccountCaption(7, 2) As String  'Changed from 6 to 7 by Mohit on 21 August, 2007
Public mnuCardProductionCaption(3, 2) As String
Public mnuAboutCaption(2, 2) As String

Public frmAccountGridCaption(35, 2) As String
Public frmAccountCaption(50, 2) As String
Public frmAccDormantCaption(15, 2) As String
Public frmAccRejectionCaption(6, 2) As String
Public frmAcctPendingListCaption(9, 2) As String
Public frmAcctStatusHistoryCaption(15, 2) As String
Public frmChequeBookGridCaption(25, 2) As String
Public frmChequeBookHistoryCaption(7, 2) As String
Public frmChequeBookRequestCaption(11, 2) As String
Public frmChequeBookReportCaption(7, 2) As String
Public frmChqReceiptCaption(13, 2) As String
Public frmInputFormCaption(10, 2) As String
Public frmPensionDetailCaption(45, 2) As String
Public frmPensionEnquiryCaption(10, 2) As String
Public frmPensionGridCaption(12, 2) As String
Public frmStopChqGridCaption(20, 2) As String
Public frmStopChqDetailCaption(15, 2) As String
Public frmStopChqPendingListCaption(12, 2) As String
Public frmStopChqRejectionCaption(6, 2) As String
Public frmTransactionCaption(25, 2) As String
Public frmAcceptPinCaption(10, 2) As String
Public frmPenCashPaymentCaption(20, 2) As String
Public frmPrintingCardCaption(15, 2) As String
Public frmPensionInheritanceCaption(10, 2) As String
Public frmHistStmtCaption(30, 2) As String
Public frmSendFileCaption(15, 2) As String
Public frmMerchantStmtCaption(15, 2) As String
Public frmCustUpdateHistoryCaption(25, 2) As String
Public frmAcctUpdateHistoryCaption(25, 2) As String
Public frmCustCategoryCaption(15, 2) As String
Public frmAcceptTpinCaption(20, 2) As String
Public frmTpinPendingListCaption(15, 2) As String
Public frmTpinRejectionCaption(10, 2) As String

' display error message - for front-end dual language
Public errCallHeadOffice(2) As String
Public errCallHeadOffice1(2) As String
Public errCallHeadOffice2(2) As String
Public errEnterToContinue(2) As String
Public errTryAgain(2) As String
Public errConnectProblem(2) As String
Public errErrorAtServer(2) As String
Public errReceiveFromHost(2) As String
Public errOnlyNumeralsAllowed(2) As String
Public errNoArabicCharacters(2) As String
Public errNoEnglishCharacters(2) As String
Public errShouldIReconnect(2) As String
Public errUnexpectedError(2) As String
Public errConnectionRejected(2) As String
Public errSelectYourOption(2) As String
Public errLoadDetails(2) As String
Public errHostName(2) As String
Public errPortNo(2) As String
Public errMsgReceiveError(2) As String
Public errTimeOut(2) As String
Public errMsgSendError(2) As String
Public errPasswordNoMatch(2) As String
Public errPasswordChanged(2) As String
Public errInvalidPassword(2) As String
Public errUsedPassword(2) As String
Public errInternalProb(2) As String
Public errShortPassword(2) As String
Public errSamePassword(2) As String
Public errAlphaNumericPassword(2) As String
Public errInvalidMailAddress(2) As String
Public errInvalidFaxNo(2) As String
Public errInvalidTelNo(2) As String
Public errEnterValidDate(2) As String
Public errEnterValidMonth(2) As String
Public errEnterValidYear(2) As String
Public errNotAJointAccount(2) As String
Public errNoMoreJointAccount(2) As String
Public errLogon(2) As String
Public errNotAuthorised(2) As String
Public errExpiredPassword(2) As String
Public errChangePassword(2) As String
Public errInvalidUserId(2) As String
Public errMaxTries(2) As String
Public errAccountLocked(2) As String
Public errSuccessful(2) As String
Public errSpaceId(2) As String
Public errSpaceNames(2) As String
Public errSpaceDob(2) As String
Public errSpaceDoe(2) As String
Public errSpaceAddress(2) As String
Public errSpacePhone(2) As String
Public errSpaceEducation(2) As String
Public errSpaceProfession(2) As String
Public errSpacePosition(2) As String
Public errSpaceIncome(2) As String
Public errSpaceOwnership(2) As String
Public errSpaceDocuments(2) As String
Public errSpaceEmployer(2) As String
Public errSpaceCR(2) As String
Public errNoMoreJoint(2) As String
Public errEmptyRowSelected(2) As String
Public errNoMatchFound(2) As String
Public errAccountClosed(2) As String
Public errLocalDbOpenError(2) As String
Public errSpacePrimaryCardName(2) As String
Public errSpaceSecondaryCardName(2) As String
Public errSpacePrimaryIntlCardName(2) As String
Public errSpaceSecondaryIntlCardName(2) As String
Public errSpaceDeliveryAddress(2) As String
Public errSpaceIssueDate(2) As String
Public errSpaceExpiryDate(2) As String
Public errSpaceIdIssuedAt(2) As String
Public errSpaceTitle(2) As String
Public errSpaceNationality(2) As String
Public errSpaceBusType(2) As String
Public errSpaceShortName(2) As String
Public errGreaterExpiryYear(2) As String
Public errSpaceCrIssueDate(2) As String
Public errNoPrimaryCard(2) As String
Public errUpdateNotAllowed(2) As String
Public errInvalidDob(2) As String
Public errInvalidTitle(2) As String
Public errInvalidSearchCriteria(2) As String
Public errSpaceJointAccName(2) As String
Public errLoggingOn(2) As String
Public errLoadingForm(2) As String
Public errSelectCriteria(2) As String
Public errNoChequeBook(2) As String
Public errInvalidNationality(2) As String
Public errNotAuthorisedBranch(2) As String
Public errNoDecorativeChars(2) As String
Public errInvalidDate(2) As String
Public errNoEnglishAddress(2) As String
Public errNoArabicAddress(2) As String
Public errLangNotmatching(2) As String
Public errSpaceCustomerType(2) As String
Public errSpaceIdType(2) As String
Public errInvalidId(2) As String
Public errSearchInProgress(2) As String
Public errSearchIncomplete(2) As String
Public errRefreshingLocalDb(2) As String
Public errRefreshError(2) As String
Public errRefreshComplete(2) As String
Public errVerifyRecord(2) As String
Public errSelectOneMatch(2) As String
Public errInvalidBusinessType(2) As String
Public errIncorrectNationality(2) As String
Public errInvalidCountry(2) As String
Public errIncorrectTitle(2) As String

Public errPendingStatus(2) As String
Public errInvalidCardNo(2) As String
Public errCardNoAlloted(2) As String
Public errSpaceNameOnCard(2) As String
Public errSpaceBranchCode(2) As String
Public errSpaceUserId(2) As String
Public errInvalidBranchCode(2) As String
Public errInvalidCustNo(2) As String
Public errSpaceFreqDays(2) As String
Public errCannotRequestAdminCard(2) As String
Public errSpaceSubAcc(2) As String
Public errDC9000LogSuccess(2) As String

Public errSpaceAccNo(2) As String
Public errAccNoIs(2) As String
Public errChequeBookAlreadyProcessed(2) As String
Public errOnlySaudiRiyalAcc(2) As String
Public errChequeBookOnlyFor008160(2) As String
Public errNoRowSelectedForUpdate(2) As String
Public errSpaceSoNo(2) As String
Public errInvalidFirstPayDate(2) As String
Public errInvalidNextPayDate(2) As String
Public errInvalidFinalPayDate(2) As String
Public errSpacePaymentAmt(2) As String
Public errSpacePayeeAccount(2) As String
Public errStdOrdAlreadyStopped(2) As String
Public errSpaceChequeNo(2) As String
Public errSpaceChequeAmt(2) As String
Public errIncorrectMsgSent(2) As String
Public errIncorrectMainAcc(2) As String
Public errIncorrectContraAcc(2) As String
Public errRestrictedAccount(2) As String
Public errCommsError(2) As String
Public errNotAuthorizedToViewStaffAcc(2) As String
Public errErrorRecdFromOnlineGateway(2) As String
Public errWannaPrint(2) As String
Public errDifferentBranchCode(2) As String
Public errSpaceOrgAlphaSearch(2) As String
Public errNotPackageAcc(2) As String
Public errStaffAcc(2) As String
Public errSpaceIntAppl(2) As String
Public errInvalidIntAppl(2) As String
Public errSpacePayFreq(2) As String
Public errInvalidPayFreq(2) As String
Public errSpacePayMode(2) As String
Public errInvalidPayMode(2) As String
Public errSpacePayType(2) As String
Public errInvalidPayType(2) As String
Public errSpaceSoType(2) As String
Public errInvalidSoType(2) As String
Public errCardNotAllowed(2) As String
Public errInvalidChar(2) As String
Public errPinNotMatching(2) As String
Public errCardPrintedOk(2) As String
Public errAlreadyInFirst(2) As String
Public errInvalidAltBrCode(2) As String
Public errBranchCodeShouldBeDifferent(2) As String
Public errDifferentCurrency(2) As String
Public errWannaReplacementCard(2) As String
Public errNotAuthorisedToFlag(2) As String
Public errSpacePin(2) As String
Public errUnixDateError(2) As String
Public errPasswordAlert(2) As String
Public errStmtSuccess(2) As String
Public errNoMerchantStmt(2) As String
Public errInvalidMerchantNo(2) As String
Public errAListCustomer(2) As String     ' MISYS
Public errNameAList(2) As String        ' MISYS
Public errOperationNotPossible(2) As String ' MISYS
Public errRestrictedBranch(2) As String    ' MISYS
Public errAccOpeningRestricted(2) As String  ' MISYS
Public errAListAcc(2) As String               ' MISYS
Public errStmtRestrictedBranch(2) As String   ' MISYS
Public errLoggingOut(2) As String             ' MISYS
Public errSpaceDrNarrative(2) As String       ' MISYS
Public errSpaceCrNarrative(2) As String       ' MISYS
Public errPinLessThan4Chars(2) As String
Public errSpacePassword(2)  As String
Public errSelectCategory(2) As String
Public errInvalidCategory(2) As String
Public errSpacePpNo(2) As String
Public errNoDocDefined(2) As String
Public errDocAlreadySelected(2) As String
Public errNoDocumentsSelected(2) As String
Public errSpaceHomeAddress(2) As String
Public errSpaceInterGroupAccNo(2) As String
Public errSpaceSpecialRefNo(2) As String
Public errSpaceHomeCountryId(2) As String
Public errInvalidIdNo(2) As String
Public errInvalidIdCategory(2) As String
Public errSpaceSamaApproval(2) As String
Public errSpaceSuccDeedNo(2) As String
Public errOnlySarAcAllowed(2) As String
Public errGetingScreenNo(2) As String
Public errAtleastOneIdReqd(2) As String
Public errSpaceCertOfBirthNo(2) As String
Public errIdNotFound(2) As String
Public errSignatoryNotFound(2) As String
Public errOwnerNotFound(2) As String
Public errSpacePurposeOfAccount(2) As String
Public errSpaceShareHolding(2) As String
Public errSpaceDC(2) As String
Public errSpaceContract(2) As String
Public errLogoffForChangeLang(2) As String
Public errInvalidMainCategory(2) As String
Public errInvalidSubCategory(2) As String
Public errSpaceLicNo(2) As String
Public errOnlyIdIqamaAllowed(2) As String
Public errOnlyPpAllowed(2) As String
Public errOnlyManagerCashier(2) As String
Public errOnlyInternalAccAllowed(2) As String
Public errSpaceDiplomaticPpNo(2) As String
Public errSpecialRoleNeeded(2) As String
Public errSpaceAccStatus(2) As String
Public errInvalidAcctStatus(2) As String
Public errSpaceEmployerInfo(2) As String
Public errTotalPercNot100(2) As String
Public errSelectMainCategoryFirst(2) As String
Public errSpaceDisableReason(2) As String
Public errNonSaudiSignatoryFound(2) As String
Public errNoSamaAuthEntered(2) As String
Public errAlreadySameLanguage(2) As String
Public errPersonalReferenceNotFound(2) As String
Public errLegalRepNotFound(2) As String
Public errFosterParentNotFound(2) As String
Public errGuardianNotFound(2) As String
Public errInvalidIdType(2) As String
Public errOneReferenceReqd(2) As String
Public errOwnerRecordNotFound(2) As String
Public errExpiryDateLessThanToday(2) As String
Public errAtleasetOneReferenceReqd(2) As String
Public errAllFourNameReqd(2) As String
Public errEitherCrOrLicMandatory(2) As String
Public errAtleastOneSignatoryNeeded(2) As String
Public errSearchNotCompleted(2) As String
Public errAtleastOneJointNeeded(2) As String
Public errCompactControlDatabase(2) As String
Public errCompactTransDatabase(2) As String
Public errCompactSuccessful(2) As String
Public errWeakTpinEntered(2) As String
Public errATMPinSame(2) As String
Public errSpaceReason(2) As String
Public errIdAlreadySelected(2) As String
Public errCannotSelectAgain(2) As String
Public errTPinSame(2) As String
Public errAListCustomer1(2) As String
Public errSpaceSubscriptionNo(2) As String
Public errSpaceCompanyId(2) As String
Public errDormantAcc(2) As String
Public dormantAccBalanceZero(2) As String
Public errHighTollAvailable(2) As String
Public errNotDormantAcc(2) As String
Public errUserAlreadyLogged(2) As String
Public errEnterPassword(2) As String
Public errSpaceComments(2) As String
Public errUseExitButtonToExit(2) As String
Public errDeleteForManualBlockOnly(2) As String
Public errBlockOnlyForCc(2) As String
Public errSpaceCardNo(2) As String
Public errSpaceAmount(2) As String
Public errNegativeBlockAmt(2) As String
Public errNewBlockingSuccess(2) As String
Public errUpdBlockingSuccess(2) As String
Public errDelBlockingSuccess(2) As String
Public errCcAlreadyBlocked(2) As String
Public errCcSettleAccNotMatch(2) As String
Public errInvalidCcNo(2) As String
Public errCcNoLessThan16(2) As String
Public errFoundInTlist(2) As String
Public errSpaceName(2) As String
Public errIncorrectMsg(2) As String
Public errNotFoundInTlist(2) As String
Public errInvalidPayAccNo(2) As String
Public errSpaceNoOfChqBook(2) As String
Public errInvalidSubAcc(2) As String

Public errNotAuthorisedForStaffAcc(2) As String
Public errBranchCodeNot4Chars(2) As String
Public errSpaceAccountNo(2) As String
Public errInvalidFromYear(2) As String
Public errInvalidFromMonth(2) As String
Public errInvalidToYear(2) As String
Public errInvalidToMonth(2) As String
Public errClosingFile(2) As String
Public errFileOpen(2) As String
Public errNoReportFound(2) As String
Public errNoArabicPgm(2) As String
Public errNoAnalysisFile(2) As String
Public errNoHoStmtFile(2) As String
Public errNoAnalysisPgm(2) As String
Public errWaitConv(2) As String
Public errWaitAnalysis(2) As String
Public errAnalysisSuccess(2) As String
Public errFTPsuccess(2) As String
Public errFileSize(2) As String

Public glb_subCategoryCode As String 'Added by Mohit on 13-Dec-2006 under quick pension customer opening and bug fixing
Public signatoryUpdatedByCSO As Boolean

Public Sub populateCaptionArrays()
    frmEnquiryCaption(0, 0) = "’Ì«‰‹‹‹… «·„⁄·Ê„‹‹‹‹‹‹« "
    frmEnquiryCaption(0, 1) = "Static Data Maintenance"
    frmEnquiryCaption(1, 0) = "’Ì«‰‹‹‹‹‹… „⁄·Ê„‹‹‹«  «·⁄„Ì‹‹‹‹‹‹‹·"
    frmEnquiryCaption(1, 1) = "Customer Static Data Maintenance"
    frmEnquiryCaption(2, 0) = "—ﬁ‹‹‹‹‹‹„ «·⁄„Ì‹‹‹·"
    frmEnquiryCaption(2, 1) = "Customer No"
    frmEnquiryCaption(3, 0) = "—ﬁ„ «·Õ”‹‹‹‹‹‹‹«»"
    frmEnquiryCaption(3, 1) = "Account No"
    frmEnquiryCaption(4, 0) = "—ﬁ„ »ÿ«ﬁ… «·’—«›"
    frmEnquiryCaption(4, 1) = "Card Number"
    frmEnquiryCaption(5, 0) = "—ﬁ„ «·ÂÊÌ‹‹‹‹‹‹‹…"
    frmEnquiryCaption(5, 1) = "ID Number"
    frmEnquiryCaption(6, 0) = "—ﬁ„ Â« ‹‹› «·„‰“·"
    frmEnquiryCaption(6, 1) = "Home Phone No"
    frmEnquiryCaption(7, 0) = " ÕÊÌ·Â"
    frmEnquiryCaption(7, 1) = "Extn"
    frmEnquiryCaption(8, 0) = "«·«”‹‹‹‹‹‹‹‹‹‹„ «·«Ê·"
    frmEnquiryCaption(8, 1) = "First Name"
    frmEnquiryCaption(9, 0) = "«·«”‹‹‹‹‹‹‹‹‹‹„ «·«ŒÌ—"
    frmEnquiryCaption(9, 1) = "Last Name"
    frmEnquiryCaption(10, 0) = "⁄„Ì‹‹·"
    frmEnquiryCaption(10, 1) = "Customer"
    frmEnquiryCaption(11, 0) = "«” ›”«—« "
    frmEnquiryCaption(11, 1) = "&Enquiry"
    frmEnquiryCaption(12, 0) = "Œ‹‹‹—ÊÃ"
    frmEnquiryCaption(12, 1) = "ıExit"
    frmEnquiryCaption(13, 0) = " ⁄œÌ‹‹‹·"
    frmEnquiryCaption(13, 1) = "Update"
    frmEnquiryCaption(14, 0) = "Õ”«»«  «·⁄„Ì·"
    frmEnquiryCaption(14, 1) = "Accounts"
    frmEnquiryCaption(15, 0) = "»ÿ«ﬁ«  ’—«› "
    frmEnquiryCaption(15, 1) = "ATM Cards"
    frmEnquiryCaption(16, 0) = "≈” ›”«—«· ﬁ«⁄œ"
    frmEnquiryCaption(16, 1) = "Pension Enquiry"
    frmEnquiryCaption(17, 0) = "«·»«∆⁄"
    frmEnquiryCaption(17, 1) = "Merchant"
    frmEnquiryCaption(18, 0) = "—ﬁ„  ”ÃÌ· «·‘—ﬂ…"
    frmEnquiryCaption(18, 1) = "Company Regn No"
    frmEnquiryCaption(19, 0) = " ’‰Ì› —∆Ì”Ï"
    frmEnquiryCaption(19, 1) = "Main Category"
    frmEnquiryCaption(20, 0) = " ’‰Ì› ›—⁄Ì"
    frmEnquiryCaption(20, 1) = "Sub Category"
    frmEnquiryCaption(21, 0) = "—ﬁ„ «·›—⁄"
    frmEnquiryCaption(21, 1) = "Branch code"
    frmEnquiryCaption(22, 0) = "«·«”‹‹‹‹‹‹‹‹‹„ «·À«‰Ì"
    frmEnquiryCaption(22, 1) = "Second Name"
    frmEnquiryCaption(23, 0) = "›Ê« Ì— «·Œœ„« "
    frmEnquiryCaption(23, 1) = "Utility Bill Enquiry"
    frmEnquiryCaption(24, 0) = "«·»ÕÀ »«·«”„ T-List"
    frmEnquiryCaption(24, 1) = "Name Search for T-List"
    frmEnquiryCaption(25, 0) = "ˆﬂ‘› Õ”«» ﬁœÌ„/«·Õ”«»«  «·„·€ÌÂ"
    frmEnquiryCaption(25, 1) = "Historical statement - Deleted A/c"
    frmEnquiryCaption(26, 0) = "«·»—Ìœ «·„” —Ã⁄"
    frmEnquiryCaption(26, 1) = "Returned mail Handling"
    frmEnquiryCaption(27, 0) = "ÃÊ«·"
    frmEnquiryCaption(27, 1) = "Mobile Number"
    frmEnquiryCaption(28, 0) = "”Ã·«  «·⁄„·«¡ «·„› ÊÕ… ⁄‰ ÿ—Ìﬁ «·Â« ›"
    frmEnquiryCaption(28, 1) = "Customers opened through phone"
    
    frmEnquirySelectCaption(0, 0) = "‘«‘… «·«” ›”«—« "
    frmEnquirySelectCaption(0, 1) = "Enquiry Select Screen"
    frmEnquirySelectCaption(1, 0) = "  ‰ ‹‹‹‹«∆‹‹‹‹‹‹‹‹Ã «·‹‹»Õ‹‹‹‹‹‹‹‹‹‹‹À"
    frmEnquirySelectCaption(1, 1) = "Search Results"
    frmEnquirySelectCaption(2, 0) = "—ﬁ„ «·⁄„Ì·"
    frmEnquirySelectCaption(2, 1) = "Customer No"
    frmEnquirySelectCaption(3, 0) = "‰Ê⁄ «·«À»« "
    frmEnquirySelectCaption(3, 1) = "Id Type"
    frmEnquirySelectCaption(4, 0) = "—ﬁ„ «·«À»« "
    frmEnquirySelectCaption(4, 1) = "Id Number"
    frmEnquirySelectCaption(5, 0) = "—ﬁ„ «· ·›Ê‰"
    frmEnquirySelectCaption(5, 1) = "Tel Number"
    frmEnquirySelectCaption(6, 0) = " ÕÊÌ·Â"
    frmEnquirySelectCaption(6, 1) = "Tel Extn"
    frmEnquirySelectCaption(7, 0) = "«·«”„ «·«Ê·"
    frmEnquirySelectCaption(7, 1) = "First Name"
    frmEnquirySelectCaption(8, 0) = "«·«”„ «·À«‰Ì"
    frmEnquirySelectCaption(8, 1) = "Second Name"
    frmEnquirySelectCaption(9, 0) = "«·«”„ «·«ŒÌ—"
    frmEnquirySelectCaption(9, 1) = "Last Name"
    frmEnquirySelectCaption(10, 0) = "«·«”„ «·„Œ ’—"
    frmEnquirySelectCaption(10, 1) = "Short Name"
    frmEnquirySelectCaption(11, 0) = "—ﬁ„ «·›—⁄"
    frmEnquirySelectCaption(11, 1) = "Branch Code"
    frmEnquirySelectCaption(12, 0) = " ’‰Ì› —∆Ì”Ï"
    frmEnquirySelectCaption(12, 1) = "Main Category"
    frmEnquirySelectCaption(13, 0) = " ’‰Ì› ›—⁄Ï"
    frmEnquirySelectCaption(13, 1) = "Sub Category"
    frmEnquirySelectCaption(14, 0) = "«· «·Ì"
    frmEnquirySelectCaption(14, 1) = "More"
    frmEnquirySelectCaption(15, 0) = "‰⁄„"
    frmEnquirySelectCaption(15, 1) = "Ok"
    frmEnquirySelectCaption(16, 0) = "Œ—ÊÃ"
    frmEnquirySelectCaption(16, 1) = "Cancel"
    frmEnquirySelectCaption(17, 0) = "ﬁ«∆„… «· ⁄œÌ·«  ··⁄„Ì·"
    frmEnquirySelectCaption(17, 1) = "Customer Update History"
    frmEnquirySelectCaption(18, 0) = "⁄„Ì· ÃœÌœ"
    frmEnquirySelectCaption(18, 1) = "New customer"
    frmEnquirySelectCaption(19, 0) = " ⁄œÌ· ⁄„Ì·"
    frmEnquirySelectCaption(19, 1) = "Update customer"
    frmEnquirySelectCaption(20, 0) = "«Œ Ì«— «·—ﬁ„ «·”—Ì ··Â« ›"
    frmEnquirySelectCaption(20, 1) = "Telephone pin"
    frmEnquirySelectCaption(21, 0) = " «—ÌŒ «·—ﬁ„ «·”—Ì ··Â« ›"
    frmEnquirySelectCaption(21, 1) = "T-Pin History"
    frmEnquirySelectCaption(22, 0) = "«” ›”«—« "
    frmEnquirySelectCaption(22, 1) = "&Enquiry"
    frmEnquirySelectCaption(23, 0) = "Õﬁ· «·»ÕÀ"
    frmEnquirySelectCaption(23, 1) = "Search Criteria"
    frmEnquirySelectCaption(24, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmEnquirySelectCaption(24, 1) = "Card Number"
    frmEnquirySelectCaption(25, 0) = "«·ÃÊ«·"
    frmEnquirySelectCaption(25, 1) = "Mobile Number"
    frmEnquirySelectCaption(26, 0) = "—ﬁ„ «·Õ”‹‹‹‹‹‹‹«»"
    frmEnquirySelectCaption(26, 1) = "Account Number"
    frmEnquirySelectCaption(27, 0) = "”Ã· ﬂ‘› «·Õ”«» «·«·Ìﬂ —Ê‰Ì"
    frmEnquirySelectCaption(27, 1) = "E-Statement registration"
            
    frmCustCategoryCaption(0, 0) = " ’‰Ì› «·⁄„‹‹‹‹‹‹·«¡"
    frmCustCategoryCaption(0, 1) = "Customer Categorization"
    frmCustCategoryCaption(1, 0) = "—ﬁ„ «·⁄„Ì·"
    frmCustCategoryCaption(1, 1) = "Customer number"
    frmCustCategoryCaption(2, 0) = "«”„ «·⁄„Ì·"
    frmCustCategoryCaption(2, 1) = "Customer name"
    frmCustCategoryCaption(3, 0) = " ’‰Ì› —∆Ì”Ï"
    frmCustCategoryCaption(3, 1) = "Main category"
    frmCustCategoryCaption(4, 0) = " ’‰Ì› ›—⁄Ì"
    frmCustCategoryCaption(4, 1) = "Sub category"
    frmCustCategoryCaption(5, 0) = "⁄„Ì· ”—Ì⁄"
    frmCustCategoryCaption(5, 1) = "Quick customer"
    frmCustCategoryCaption(6, 0) = "⁄„Ì· ÃœÌœ"
    frmCustCategoryCaption(6, 1) = "New customer"
    frmCustCategoryCaption(7, 0) = " ⁄œÌ· ⁄„Ì·"
    frmCustCategoryCaption(7, 1) = "Update customer"
    frmCustCategoryCaption(8, 0) = "Œ—ÊÃ"
    frmCustCategoryCaption(8, 1) = "Cancel"
    frmCustCategoryCaption(9, 0) = "⁄„Ì· œ«Œ·Ì"
    frmCustCategoryCaption(9, 1) = "Internal Customer"
    frmCustCategoryCaption(10, 0) = "⁄„Ì· ÃœÌœ „‰ Œ·«· «·Â« ›"
    frmCustCategoryCaption(10, 1) = "New Customer via phone"
    frmCustCategoryCaption(11, 0) = "„ ﬁ«⁄œ ”—Ì⁄"
    frmCustCategoryCaption(11, 1) = "Quick &Pension Customer"
        
    
    frmChangePasswordCaption(0, 0) = " €ÌÌ— ﬂ·„… «·”—"
    frmChangePasswordCaption(0, 1) = "Change Password"
    frmChangePasswordCaption(1, 0) = "ﬂ·„… «·”— «·ﬁ‹œÌ‹„Â"
    frmChangePasswordCaption(1, 1) = "Old Password"
    frmChangePasswordCaption(2, 0) = "ﬂ·„… «·”— «·Ã‹œÌ‹œÂ"
    frmChangePasswordCaption(2, 1) = "New Password"
    frmChangePasswordCaption(3, 0) = "ﬂ·„… «·”— «·Ã‹œÌ‹œÂ"
    frmChangePasswordCaption(3, 1) = "Confirm Password"
    frmChangePasswordCaption(4, 0) = "‰⁄„"
    frmChangePasswordCaption(4, 1) = "Ok"
    frmChangePasswordCaption(5, 0) = "Œ—ÊÃ"
    frmChangePasswordCaption(5, 1) = "Cancel"
    
    frmCustomerCaption(0, 0) = "’Ì«‰‹‹‹… ⁄„Ì‹‹‹‹‹‹‹·"
    frmCustomerCaption(0, 1) = "Customer Maintenance"
    frmCustomerCaption(1, 0) = "—ﬁ‹‹„ «·⁄„Ì‹‹·"
    frmCustomerCaption(1, 1) = "Customer Number"
    frmCustomerCaption(2, 0) = "›‹‹‹—⁄"
    frmCustomerCaption(2, 1) = "Branch"
    frmCustomerCaption(3, 0) = " «—ÌŒ"
    frmCustomerCaption(3, 1) = "Date"
    frmCustomerCaption(4, 0) = "‰Ê⁄ «·⁄„Ì‹‹‹·"
    frmCustomerCaption(4, 1) = "Cust. Type"
    frmCustomerCaption(5, 0) = "‰‹‹Ê⁄ «·»ÿ«ﬁ…"
    frmCustomerCaption(5, 1) = "ID Type"
    frmCustomerCaption(6, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmCustomerCaption(6, 1) = "ID Number"
    frmCustomerCaption(7, 0) = "„ﬂ«‰ «·«’œ«—"
    frmCustomerCaption(7, 1) = "Issued At"
    frmCustomerCaption(8, 0) = "«· «—Ì‹‹‹‹‹‹‹‹Œ"
    frmCustomerCaption(8, 1) = "ID Date Type"
    frmCustomerCaption(9, 0) = "Â‹"
    frmCustomerCaption(9, 1) = "Hijri"
    frmCustomerCaption(10, 0) = "„"
    frmCustomerCaption(10, 1) = "Gregorian"
    frmCustomerCaption(11, 0) = " «—ÌŒ «·«’‹œ«—"
    frmCustomerCaption(11, 1) = "Issue Date"
    frmCustomerCaption(12, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmCustomerCaption(12, 1) = "Expiry Date"
    frmCustomerCaption(13, 0) = "«··€‹‹‹‹‹‹‹‹‹‹‹Â"
    frmCustomerCaption(13, 1) = "Language"
    frmCustomerCaption(14, 0) = "⁄—»Ì"
    frmCustomerCaption(14, 1) = "Arabic"
    frmCustomerCaption(15, 0) = "«‰Ã·Ì“Ì"
    frmCustomerCaption(15, 1) = "English"
    frmCustomerCaption(16, 0) = "«·Ã‰”Ì‹‹‹‹‹Â"
    frmCustomerCaption(16, 1) = "Nationality"
    frmCustomerCaption(17, 0) = "«··ﬁ‹‹‹‹‹»"
    frmCustomerCaption(17, 1) = "Title Code"
    frmCustomerCaption(18, 0) = "«·«”‹‹‹‹‹„ «·√Ê·"
    frmCustomerCaption(18, 1) = "First Name"
    frmCustomerCaption(19, 0) = "«·«”‹‹‹„ «·À«‰Ì"
    frmCustomerCaption(19, 1) = "2nd Name"
    frmCustomerCaption(20, 0) = "«·«”‹‹‹„ «·À«·À"
    frmCustomerCaption(20, 1) = "3rd Name"
    frmCustomerCaption(21, 0) = "«·«”‹‹‹‹‹„ «·«ŒÌ—"
    frmCustomerCaption(21, 1) = "Last Name"
    frmCustomerCaption(22, 0) = "⁄‹‹‹‹‹‹‹‹‹‹—»Ì"
    frmCustomerCaption(22, 1) = "Arabic"
    frmCustomerCaption(23, 0) = "«·«”„ «·„Œ ’—"
    frmCustomerCaption(23, 1) = "Short Name"
    frmCustomerCaption(24, 0) = "«‰Ã·Ì‹‹‹‹‹‹‹“Ì"
    frmCustomerCaption(24, 1) = "English"
'    frmCustomerCaption(25, 0) = "«·«”„ «·„Œ ’— »«·«‰Ã·Ì“ÌÂ"
'    frmCustomerCaption(25, 1) = "English Short Name"
    frmCustomerCaption(26, 0) = "«· «—Ì‹‹‹‹‹‹‹Œ"
    frmCustomerCaption(26, 1) = "Date of Birth"
    frmCustomerCaption(27, 0) = "Â‹"
    frmCustomerCaption(27, 1) = "Hijri"
    frmCustomerCaption(28, 0) = "„"
    frmCustomerCaption(28, 1) = "Gregorian"
    frmCustomerCaption(29, 0) = " «—ÌŒ «·‹Ê·«œÂ"
    frmCustomerCaption(29, 1) = "Date of Birth"
    frmCustomerCaption(30, 0) = "«·Ã‰‹”"
    frmCustomerCaption(30, 1) = "Gender"
    frmCustomerCaption(31, 0) = "–ﬂ‹—"
    frmCustomerCaption(31, 1) = "Male"
    frmCustomerCaption(32, 0) = "«‰À‹‹Ï"
    frmCustomerCaption(32, 1) = "Female"
    frmCustomerCaption(33, 0) = "VIP"
    frmCustomerCaption(33, 1) = "VIP"
    frmCustomerCaption(34, 0) = "‰⁄„"
    frmCustomerCaption(34, 1) = "Yes"
    frmCustomerCaption(35, 0) = "·«"
    frmCustomerCaption(35, 1) = "No"
    frmCustomerCaption(36, 0) = "«·Õ«·‹‹‹‹‹‹‹‹… «·«Ã „«⁄Ì‹‹‹…"
    frmCustomerCaption(36, 1) = "Marital Status"
    frmCustomerCaption(37, 0) = "„ ‹‹“ÊÃ"
    frmCustomerCaption(37, 1) = "Married"
    frmCustomerCaption(38, 0) = "«⁄‹‹“»"
    frmCustomerCaption(38, 1) = "Single"
    frmCustomerCaption(39, 0) = "«Œ‹‹—Ï"
    frmCustomerCaption(39, 1) = "Others"
    frmCustomerCaption(40, 0) = "⁄œœ√›—«œ«·«”—…"
    frmCustomerCaption(40, 1) = "Dependents"
    frmCustomerCaption(41, 0) = "   „ﬁÌ‹‹„/€Ì— „ﬁÌ‹‹‹‹‹‹„"
    frmCustomerCaption(41, 1) = "   Resident/NonResident"
    frmCustomerCaption(42, 0) = "„ﬁÌ‹‹‹‹„"
    frmCustomerCaption(42, 1) = "Resident"
    frmCustomerCaption(43, 0) = "€Ì— „ﬁÌ‹‹‹‹‹„"
    frmCustomerCaption(43, 1) = "Non Resident"
    frmCustomerCaption(44, 0) = "‰Ê⁄ «·⁄„‹‹‹·"
    frmCustomerCaption(44, 1) = "Business Type"
    frmCustomerCaption(45, 0) = "”Ã·  Ã‹‹«—Ì"
    frmCustomerCaption(45, 1) = "C.R.Number"
    frmCustomerCaption(46, 0) = "’«œ— ›‹‹Ì"
    frmCustomerCaption(46, 1) = "Issued At"
    frmCustomerCaption(47, 0) = "«· «—Ì‹‹‹Œ"
    frmCustomerCaption(47, 1) = "Date Type"
    frmCustomerCaption(48, 0) = "Â‹"
    frmCustomerCaption(48, 1) = "Hijri"
    frmCustomerCaption(49, 0) = "„"
    frmCustomerCaption(49, 1) = "Gregorian"
    frmCustomerCaption(50, 0) = " «—ÌŒ «·«’‹œ«—"
    frmCustomerCaption(50, 1) = "Issue Date"
    frmCustomerCaption(51, 0) = "«·«”„ »«·⁄—»ÌÂ"
    frmCustomerCaption(51, 1) = "Arabic Name"
    frmCustomerCaption(52, 0) = "«·«”„ «·„Œ ’—"
    frmCustomerCaption(52, 1) = "Short Name"
    frmCustomerCaption(53, 0) = "«·«”„ »«·«‰Ã·Ì“ÌÂ"
    frmCustomerCaption(53, 1) = "English Name"
    frmCustomerCaption(54, 0) = "«·«”„ «·„Œ ’—"
    frmCustomerCaption(54, 1) = "Short Name"
    frmCustomerCaption(55, 0) = "«·⁄‰‹‹Ê«‰ "
    frmCustomerCaption(55, 1) = "Address "
    frmCustomerCaption(56, 0) = "«·⁄‰Ê«‰ 2"
    frmCustomerCaption(56, 1) = "Address 2"
    frmCustomerCaption(57, 0) = "’ . »"
    frmCustomerCaption(57, 1) = "P.O. Box"
    frmCustomerCaption(58, 0) = "«·„œÌ‰Â"
    frmCustomerCaption(58, 1) = "City"
    frmCustomerCaption(59, 0) = "«·—„“ «·»—ÌœÌ"
    frmCustomerCaption(59, 1) = "Zip Code"
    frmCustomerCaption(60, 0) = "«·œÊ·‹Â"
    frmCustomerCaption(60, 1) = "Country"
    frmCustomerCaption(61, 0) = " ·›Ê‰ «·⁄„·"
    frmCustomerCaption(61, 1) = "Phone(Off)"
    frmCustomerCaption(62, 0) = " ·›Ê‰ «·„‰“·"
    frmCustomerCaption(62, 1) = "Phone(Res.)"
    frmCustomerCaption(63, 0) = "›«ﬂ”"
    frmCustomerCaption(63, 1) = "Fax"
    frmCustomerCaption(64, 0) = "Ã‹‹‹‹‹‹‹‹Ê«·"
    frmCustomerCaption(64, 1) = "Mobile"
    frmCustomerCaption(65, 0) = "»ÌÃ‹—"
    frmCustomerCaption(65, 1) = "Pager"
    frmCustomerCaption(66, 0) = "»—Ìœ«·ﬂ —Ê‰Ì"
    frmCustomerCaption(66, 1) = "E_Mail"
    frmCustomerCaption(67, 0) = "«·’›Õ… «· «·ÌÂ"
    frmCustomerCaption(67, 1) = "&Next Page"
    frmCustomerCaption(68, 0) = "Œ—ÊÃ"
    frmCustomerCaption(68, 1) = "&Cancel"
    frmCustomerCaption(69, 0) = "„·«ÕŸ«  «·„‘—›"
    frmCustomerCaption(69, 1) = "Supervisor Comments"
    frmCustomerCaption(70, 0) = "„·«ÕŸ«  «·⁄„Ì·"
    frmCustomerCaption(70, 1) = "Customer Remarks"
    frmCustomerCaption(71, 0) = "ÂÃ—Ì/„Ì·«œÌ"
    frmCustomerCaption(71, 1) = "DOE Type"
    frmCustomerCaption(72, 0) = " «—ÌŒ «·‘—ﬂ…"
    frmCustomerCaption(72, 1) = "Date of Esta."
    frmCustomerCaption(73, 0) = "—ﬁ„ «·›—⁄ «·À«‰Ì "
    frmCustomerCaption(73, 1) = "Alternative Br.code"
    frmCustomerCaption(74, 0) = "„⁄·Ê„«  «·»ÿ«ﬁ…"
    frmCustomerCaption(74, 1) = "Card Info"
    frmCustomerCaption(75, 0) = "«·»ÕÀ «·«»ÃœÌ"
    frmCustomerCaption(75, 1) = "Org Alpha Search"
   
    frmCustomer2Caption(0, 0) = "’Ì«‰… «·⁄„Ì· ’›Õ‹‹‹‹‹‹Â 2 "
    frmCustomer2Caption(0, 1) = "Customers Maintenance Page 2"
    frmCustomer2Caption(1, 0) = "«·„ƒÂ‹‹‹‹‹‹‹·"
    frmCustomer2Caption(1, 1) = "Education"
    frmCustomer2Caption(2, 0) = " Œ’‹‹‹‹‹‹‹’"
    frmCustomer2Caption(2, 1) = "Profession"
    frmCustomer2Caption(3, 0) = "«·ÊŸÌ›‹Â"
    frmCustomer2Caption(3, 1) = "Position"
    frmCustomer2Caption(4, 0) = "«·œŒ· «·‘Â‹‹—Ì"
    frmCustomer2Caption(4, 1) = "Monthly Income"
    frmCustomer2Caption(5, 0) = "«· ’‰Ì‹‹‹‹‹›"
    frmCustomer2Caption(5, 1) = "Segmentation"
    frmCustomer2Caption(6, 0) = "„«·‹‹‹‹‹‹‹‹‹ﬂ"
    frmCustomer2Caption(6, 1) = "Owner Ship"
    frmCustomer2Caption(7, 0) = "„” √Ã‹—"
    frmCustomer2Caption(7, 1) = "Rented Home"
    frmCustomer2Caption(8, 0) = "„‰“· Œ‹«’"
    frmCustomer2Caption(8, 1) = "Own House"
    frmCustomer2Caption(9, 0) = "«”ﬂ«‰ ‘—ﬂ‹‹Â"
    frmCustomer2Caption(9, 1) = "Com.Accomodation"
    frmCustomer2Caption(10, 0) = "”Ì«—…„” √Ã—Â"
    frmCustomer2Caption(10, 1) = "Rented Car"
    frmCustomer2Caption(11, 0) = "”Ì«—…Œ«’Â"
    frmCustomer2Caption(11, 1) = "Own Car"
    frmCustomer2Caption(12, 0) = "‰ﬁ‹‹· ‘—ﬂ‹‹Â"
    frmCustomer2Caption(12, 1) = "Company Transport"
    frmCustomer2Caption(13, 0) = "’«Õ» «·⁄„·"
    frmCustomer2Caption(13, 1) = "Employer Name"
    frmCustomer2Caption(14, 0) = "«·œ«∆—Â"
    frmCustomer2Caption(14, 1) = "Dept."
    frmCustomer2Caption(15, 0) = "’ » "
    frmCustomer2Caption(15, 1) = "P.O."
    frmCustomer2Caption(16, 0) = "«·„œÌ‰Â"
    frmCustomer2Caption(16, 1) = "City"
    frmCustomer2Caption(17, 0) = "«·—„“ «·»—ÌœÌ"
    frmCustomer2Caption(17, 1) = "Zip"
    frmCustomer2Caption(18, 0) = "«·ÊÀ«∆‹‹‹‹‹‹‹ﬁ"
    frmCustomer2Caption(18, 1) = "Documents"
    frmCustomer2Caption(19, 0) = "«· ÊﬁÌ‹‹⁄"
    frmCustomer2Caption(19, 1) = "Signature"
    frmCustomer2Caption(20, 0) = "’Ê—Â „‰ «·»ÿ«ﬁ…/«·«ﬁ«„Â"
    frmCustomer2Caption(20, 1) = "Copy of ID/Iqama"
    frmCustomer2Caption(21, 0) = "”Ã‹·  Ã‹‹«—Ì"
    frmCustomer2Caption(21, 1) = "Registration certificate"
    frmCustomer2Caption(22, 0) = "⁄ﬁœ „ƒ””‹Â"
    frmCustomer2Caption(22, 1) = "Est. Contract"
    frmCustomer2Caption(23, 0) = "«·ÊﬂÌ‹‹‹‹‹·"
    frmCustomer2Caption(23, 1) = "Power of Attorney"
    frmCustomer2Caption(24, 0) = " ÕÊÌ· —« »"
    frmCustomer2Caption(24, 1) = "Salary Transfer"
    frmCustomer2Caption(25, 0) = "„Ê«›ﬁ… ⁄·Ì Õ”«» „‘ —ﬂ"
    frmCustomer2Caption(25, 1) = "Joint A/c agreement"
    frmCustomer2Caption(26, 0) = "«Œ—Ï"
    frmCustomer2Caption(26, 1) = "Others"
    frmCustomer2Caption(27, 0) = "⁄„Ì· „ „Ì“"
    frmCustomer2Caption(27, 1) = "Package A/c"
    frmCustomer2Caption(28, 0) = "·«‘Ì¡"
    frmCustomer2Caption(28, 1) = "None"
    frmCustomer2Caption(29, 0) = "–Â»Ì"
    frmCustomer2Caption(29, 1) = "Gold"
    frmCustomer2Caption(30, 0) = "Õ”‹‹«» Ã‹«—Ì"
    frmCustomer2Caption(30, 1) = "Current A/c"
    frmCustomer2Caption(31, 0) = "⁄„·Â"
    frmCustomer2Caption(31, 1) = "Curr."
    frmCustomer2Caption(32, 0) = "Ê÷⁄ «·Õ”«»"
    frmCustomer2Caption(32, 1) = "Acc.Status"
    frmCustomer2Caption(33, 0) = "«’œ«—«·ﬂ‘›"
    frmCustomer2Caption(33, 1) = "Stmt.Freq."
    frmCustomer2Caption(34, 0) = "œ› — ‘Ìﬂ« "
    frmCustomer2Caption(34, 1) = "Check Book"
    frmCustomer2Caption(35, 0) = "Õ”«»  Ê›Ì‹‹—"
    frmCustomer2Caption(35, 1) = "Saving A/c"
    frmCustomer2Caption(36, 0) = "«Œ‹‹‹‹‹‹‹‹‹‹‹—Ï"
    frmCustomer2Caption(36, 1) = "Other A/c"
    frmCustomer2Caption(37, 0) = "„›‹‹—œ/„‘ —ﬂ"
    frmCustomer2Caption(37, 1) = "Single/JointA/c"
    frmCustomer2Caption(38, 0) = "„›‹‹—œ"
    frmCustomer2Caption(38, 1) = "Single"
    frmCustomer2Caption(39, 0) = "„‘ ‹—ﬂ"
    frmCustomer2Caption(39, 1) = "Joint"
    frmCustomer2Caption(40, 0) = "ÿ»Ì⁄… «· ÊﬁÌ‹‹‹‹‹‹⁄"
    frmCustomer2Caption(40, 1) = "Nature of signature"
    frmCustomer2Caption(41, 0) = " »ÿ«ﬁ… «·Ìﬂ —Ê‰Ì… "
    frmCustomer2Caption(41, 1) = "Primary ATM "
    frmCustomer2Caption(42, 0) = "«·«”„ ⁄·Ï «·»ÿ«ﬁÂ"
    frmCustomer2Caption(42, 1) = "Name on the card"
    frmCustomer2Caption(43, 0) = " »ÿ«ﬁ‹‹… «÷«›Ì‹‹‹…"
    frmCustomer2Caption(43, 1) = "Secondary ATM"
    frmCustomer2Caption(44, 0) = "»ÿ«ﬁ‹… œÊ·‹‹‹‹‹‹Ì…"
    frmCustomer2Caption(44, 1) = "Primary Int'l card"
    frmCustomer2Caption(45, 0) = "»ÿ«ﬁ…«÷«›‹‹‹‹‹‹Ì…"
    frmCustomer2Caption(45, 1) = "Secondary card"
    frmCustomer2Caption(46, 0) = " ”·„ «·»ÿ«ﬁÂ «·Ï"
    frmCustomer2Caption(46, 1) = "Card Delivery"
    frmCustomer2Caption(47, 0) = "›—⁄ «·⁄„Ì·"
    frmCustomer2Caption(47, 1) = "Customer Branch"
    frmCustomer2Caption(48, 0) = "»—Ì‹œ"
    frmCustomer2Caption(48, 1) = "Mail"
    frmCustomer2Caption(49, 0) = "⁄‰Ê«‰ «· ”·Ì„ 1"
    frmCustomer2Caption(49, 1) = "Delivery Address1"
    frmCustomer2Caption(50, 0) = "«·⁄‰Ê«‰ 2"
    frmCustomer2Caption(50, 1) = "Address2"
    frmCustomer2Caption(51, 0) = "’ » "
    frmCustomer2Caption(51, 1) = "PO Box"
    frmCustomer2Caption(52, 0) = "«·„œÌ‰Â"
    frmCustomer2Caption(52, 1) = "City"
    frmCustomer2Caption(53, 0) = "«·—„“ «·»—ÌœÌ"
    frmCustomer2Caption(53, 1) = "Zip code"
    frmCustomer2Caption(54, 0) = "«·’›Õ… «·”«»ﬁ…"
    frmCustomer2Caption(54, 1) = "Previous Page"
    frmCustomer2Caption(55, 0) = "ÿ»«⁄‹‹‹‹‹‹… «·ÿ·»"
    frmCustomer2Caption(55, 1) = "Print Application"
    frmCustomer2Caption(56, 0) = "«÷‹‹‹«›…"
    frmCustomer2Caption(56, 1) = "Create"
    frmCustomer2Caption(57, 0) = "Õ”«» „‘ —ﬂ"
    frmCustomer2Caption(57, 1) = "Joint Account"
    frmCustomer2Caption(58, 0) = "Œ—ÊÃ"
    frmCustomer2Caption(58, 1) = "Cancel"
    frmCustomer2Caption(59, 0) = "„Ê«›ﬁ"
    frmCustomer2Caption(59, 1) = "Approve"
    frmCustomer2Caption(60, 0) = "„⁄«œ"
    frmCustomer2Caption(60, 1) = "Reject"
    frmCustomer2Caption(61, 0) = " ⁄œÌ‹·"
    frmCustomer2Caption(61, 1) = "Update"
    frmCustomer2Caption(62, 0) = "»·« Ì‰Ì"
    frmCustomer2Caption(62, 1) = "Platinum"
    frmCustomer2Caption(63, 0) = "⁄„Ì· „ „Ì“"
    frmCustomer2Caption(63, 1) = "Package A/c"
    frmCustomer2Caption(64, 0) = "⁄„Ì· «·⁄—»Ì ≈‰ —‰  "
    frmCustomer2Caption(64, 1) = "Internet Bank"
    frmCustomer2Caption(65, 0) = "≈‘⁄«— ·ﬂ· Õ—ﬂ…"
    frmCustomer2Caption(65, 1) = "Cust.Advice Flag"
    frmCustomer2Caption(66, 0) = " ÕœÌÀ »Ì«‰«  «·⁄„·«¡ ﬂÿ·» „ƒ””…«·‰ﬁ‹‹œ"
    frmCustomer2Caption(66, 1) = "Cust.updated for SAMA"
    frmCustomer2Caption(67, 0) = "„œÌ— «·Õ”«»/«·⁄·«ﬁ…"
    frmCustomer2Caption(67, 1) = "Relationship Manager"
    frmCustomer2Caption(68, 0) = "„·«ÕŸ«  ⁄«„…"
    frmCustomer2Caption(68, 1) = "General Memo"
    frmCustomer2Caption(69, 0) = "‰⁄„"
    frmCustomer2Caption(69, 1) = "Yes"
    frmCustomer2Caption(70, 0) = "·«"
    frmCustomer2Caption(70, 1) = "No"
    frmCustomer2Caption(71, 0) = "«·›—⁄ ÿ«·» «·»ÿ«ﬁ…"
    frmCustomer2Caption(71, 1) = "Req.Branch"
            
    frmCustomer3Caption(0, 0) = "„⁄·Ê„«  «·Õ”«» «·„‘ —ﬂ"
    frmCustomer3Caption(0, 1) = "Joint-Account Information"
    frmCustomer3Caption(1, 0) = "‰Ê⁄ «·»ÿ«ﬁÂ"
    frmCustomer3Caption(1, 1) = "ID Type"
    frmCustomer3Caption(2, 0) = "—ﬁ„ «·»ÿ«ﬁÂ"
    frmCustomer3Caption(2, 1) = "ID Number"
    frmCustomer3Caption(3, 0) = "’«œ—Â ›Ì"
    frmCustomer3Caption(3, 1) = "Issued At"
    frmCustomer3Caption(4, 0) = "«· «—Ì‹‹‹‹‹‹Œ"
    frmCustomer3Caption(4, 1) = "ID Date Type"
    frmCustomer3Caption(5, 0) = "Â‹"
    frmCustomer3Caption(5, 1) = "Hijri"
    frmCustomer3Caption(6, 0) = "„"
    frmCustomer3Caption(6, 1) = "Gregorian"
    frmCustomer3Caption(7, 0) = " «—ÌŒ «·«’‹œ«—"
    frmCustomer3Caption(7, 1) = "Issue Date"
    frmCustomer3Caption(8, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmCustomer3Caption(8, 1) = "Expiry Date"
    frmCustomer3Caption(9, 0) = "«··€‹‹‹‹‹‹‹‹‹Â"
    frmCustomer3Caption(9, 1) = "Language"
    frmCustomer3Caption(10, 0) = "⁄—»Ì"
    frmCustomer3Caption(10, 1) = "Arabic"
    frmCustomer3Caption(11, 0) = "«‰Ã·Ì“Ì"
    frmCustomer3Caption(11, 1) = "English"
    frmCustomer3Caption(12, 0) = "«·Ã‰”Ì‹‹Â"
    frmCustomer3Caption(12, 1) = "Nationality"
    frmCustomer3Caption(13, 0) = "«··ﬁ»"
    frmCustomer3Caption(13, 1) = "Title Code"
    frmCustomer3Caption(14, 0) = "«·«”„ «·«Ê·"
    frmCustomer3Caption(14, 1) = "First Name"
    frmCustomer3Caption(15, 0) = "«·«”„ «·À«‰Ì"
    frmCustomer3Caption(15, 1) = "2nd Name"
    frmCustomer3Caption(16, 0) = "«·«”„ «·À«·À"
    frmCustomer3Caption(16, 1) = "3rd Name"
    frmCustomer3Caption(17, 0) = "«·«”„ «·«ŒÌ—"
    frmCustomer3Caption(17, 1) = "Last Name"
    frmCustomer3Caption(18, 0) = "⁄‹‹—»‹‹‹‹‹‹Ì"
    frmCustomer3Caption(18, 1) = "Arabic Name"
    frmCustomer3Caption(19, 0) = "«·„Œ ’— »«·⁄—»ÌÂ"
    frmCustomer3Caption(19, 1) = "Short Name"
    frmCustomer3Caption(20, 0) = "«‰Ã·Ì‹‹‹‹‹“Ì"
    frmCustomer3Caption(20, 1) = "English Name"
'    frmCustomer3Caption(21, 0) = "«·«”„ «·„Œ ’— »«·«‰Ã·Ì“ÌÂ"
'    frmCustomer3Caption(21, 1) = "English Short Name"
    frmCustomer3Caption(22, 0) = "«· «—Ì‹‹‹‹‹Œ"
    frmCustomer3Caption(22, 1) = "DOB Type"
    frmCustomer3Caption(23, 0) = " «—ÌŒ «·Ê·«œÂ"
    frmCustomer3Caption(23, 1) = "Date of Birth"
    frmCustomer3Caption(24, 0) = "«·Ã‰”"
    frmCustomer3Caption(24, 1) = "Gender"
    frmCustomer3Caption(25, 0) = "–ﬂ—"
    frmCustomer3Caption(25, 1) = "Male"
    frmCustomer3Caption(26, 0) = "«‰À‹‹Ï"
    frmCustomer3Caption(26, 1) = "Female"
    frmCustomer3Caption(27, 0) = "«·Õ«·‹‹‹‹‹‹‹‹… «·«Ã „«⁄Ì‹‹‹…"
    frmCustomer3Caption(27, 1) = "Marital Status"
    frmCustomer3Caption(28, 0) = "„ “ÊÃ"
    frmCustomer3Caption(28, 1) = "Married"
    frmCustomer3Caption(29, 0) = "√⁄“»"
    frmCustomer3Caption(29, 1) = "Single"
    frmCustomer3Caption(30, 0) = "√Œ‹‹—Ï"
    frmCustomer3Caption(30, 1) = "Others"
    frmCustomer3Caption(31, 0) = " «»‹‹‹‹‹‹⁄"
    frmCustomer3Caption(31, 1) = "Dependents"
    frmCustomer3Caption(32, 0) = "   „ﬁÌ„/€Ì— „ﬁÌ‹‹‹‹‹‹‹‹‹„"
    frmCustomer3Caption(32, 1) = "   Resident/Non-Resident"
    frmCustomer3Caption(33, 0) = "„ﬁÌ‹‹‹‹„"
    frmCustomer3Caption(33, 1) = "Resident"
    frmCustomer3Caption(34, 0) = "€Ì— „ﬁÌ‹‹‹‹‹„"
    frmCustomer3Caption(34, 1) = "Non-Resident"
    frmCustomer3Caption(35, 0) = "‰Ê⁄ «·⁄„‹‹‹‹·"
    frmCustomer3Caption(35, 1) = "Business Type"
    frmCustomer3Caption(36, 0) = "«·⁄‰‹‹‹‹‹Ê«‰ "
    frmCustomer3Caption(36, 1) = "Address"
    frmCustomer3Caption(37, 0) = "«·⁄‰Ê«‰ 2"
    frmCustomer3Caption(37, 1) = "Address2"
    frmCustomer3Caption(38, 0) = "’ . » "
    frmCustomer3Caption(38, 1) = "P.O."
    frmCustomer3Caption(39, 0) = "«·„œÌ‰Â"
    frmCustomer3Caption(39, 1) = "City"
    frmCustomer3Caption(40, 0) = "«·—„“ «·»—ÌœÌ"
    frmCustomer3Caption(40, 1) = "Zip Code"
    frmCustomer3Caption(41, 0) = "«·œÊ·‹Â"
    frmCustomer3Caption(41, 1) = "Country"
    frmCustomer3Caption(42, 0) = "Â« › «·⁄„‹‹·"
    frmCustomer3Caption(42, 1) = "Phone(Off)"
    frmCustomer3Caption(43, 0) = "Â« › «·„‰“·"
    frmCustomer3Caption(43, 1) = "Phone(Res.)"
    frmCustomer3Caption(44, 0) = "›«ﬂ”"
    frmCustomer3Caption(44, 1) = "Fax"
    frmCustomer3Caption(45, 0) = "Ã‹‹‹‹‹‹‹‹‹‹Ê«·"
    frmCustomer3Caption(45, 1) = "Mobile"
    frmCustomer3Caption(46, 0) = "»ÌÃ—"
    frmCustomer3Caption(46, 1) = "Pager"
    frmCustomer3Caption(47, 0) = "»—Ìœ«·ﬂ —Ê‰Ì"
    frmCustomer3Caption(47, 1) = "E_Mail"
    frmCustomer3Caption(48, 0) = "«·„ƒÂ‹‹‹‹‹‹‹‹·"
    frmCustomer3Caption(48, 1) = "Education"
    frmCustomer3Caption(49, 0) = "«·«Œ ’‹‹‹«’"
    frmCustomer3Caption(49, 1) = "Profession"
    frmCustomer3Caption(50, 0) = "«·ÊŸÌ›‹‹Â"
    frmCustomer3Caption(50, 1) = "Position"
    frmCustomer3Caption(51, 0) = "«·⁄«∆œ «·‘Â—Ì"
    frmCustomer3Caption(51, 1) = "Monthly Income"
    frmCustomer3Caption(52, 0) = "„«·‹‹‹‹‹‹‹‹‹‹‹ﬂ"
    frmCustomer3Caption(52, 1) = "Owner Ship"
    frmCustomer3Caption(53, 0) = "„” √Ã‹—"
    frmCustomer3Caption(53, 1) = "Rented Home"
    frmCustomer3Caption(54, 0) = "„‰“· Œ«’"
    frmCustomer3Caption(54, 1) = "Own House"
    frmCustomer3Caption(55, 0) = "«”ﬂ«‰ ‘—ﬂ‹‹Â"
    frmCustomer3Caption(55, 1) = "Com.Accomodation"
    frmCustomer3Caption(56, 0) = "”Ì«—…„” √Ã—Â"
    frmCustomer3Caption(56, 1) = "Rented Car"
    frmCustomer3Caption(57, 0) = "”Ì«—…Œ«’Â"
    frmCustomer3Caption(57, 1) = "Own Car"
    frmCustomer3Caption(58, 0) = "‰ﬁ· ‘—ﬂ‹Â"
    frmCustomer3Caption(58, 1) = "Company Transport"
    frmCustomer3Caption(59, 0) = "«”„ ’«Õ» «·⁄„·"
    frmCustomer3Caption(59, 1) = "Employer Name"
    frmCustomer3Caption(60, 0) = "«·œ«∆—Â"
    frmCustomer3Caption(60, 1) = "Department"
    frmCustomer3Caption(61, 0) = "’ » "
    frmCustomer3Caption(61, 1) = "P.O."
    frmCustomer3Caption(62, 0) = "«·„œÌ‰Â"
    frmCustomer3Caption(62, 1) = "City"
    frmCustomer3Caption(63, 0) = "«·—„“ «·»—ÌœÌ"
    frmCustomer3Caption(63, 1) = "Zip"
    frmCustomer3Caption(64, 0) = "«·⁄„Ì· «·„‘ —ﬂ «· «·Ì"
    frmCustomer3Caption(64, 1) = "Next Joint Customer"
    frmCustomer3Caption(65, 0) = "Œ—ÊÃ"
    frmCustomer3Caption(65, 1) = "Done"
    frmCustomer3Caption(66, 0) = "Œ—ÊÃ"
    frmCustomer3Caption(66, 1) = "Cancel"
    frmCustomer3Caption(67, 0) = "«· ’‰Ì‹‹‹‹‹‹›"
    frmCustomer3Caption(67, 1) = "Segmentation"
    frmCustomer3Caption(68, 0) = "‰⁄„"
    frmCustomer3Caption(68, 1) = "Yes"
    frmCustomer3Caption(69, 0) = "·«"
    frmCustomer3Caption(69, 1) = "No"
    frmCustomer3Caption(70, 0) = "«÷«›Â"
    frmCustomer3Caption(70, 1) = "Add"
    frmCustomer3Caption(71, 0) = " ⁄œÌ·"
    frmCustomer3Caption(71, 1) = "Update"
    frmCustomer3Caption(72, 0) = "Œ—ÊÃ"
    frmCustomer3Caption(72, 1) = "Done"
    frmCustomer3Caption(73, 0) = "Ê÷⁄ „ Õ—ﬂ"
    frmCustomer3Caption(73, 1) = "Active Status"
    frmCustomer3Caption(74, 0) = " —ﬁ„ «·⁄„Ì·"
    frmCustomer3Caption(74, 1) = " Customer #"
    frmCustomer3Caption(75, 0) = "—ﬁ„ ⁄„Ì· „‘ —ﬂ"
    frmCustomer3Caption(75, 1) = "Joint cust #"
    frmCustomer3Caption(76, 0) = "«”„ «·⁄„Ì· «·„Œ ’—"
    frmCustomer3Caption(76, 1) = "Customer Short Name"
    frmCustomer3Caption(77, 0) = "—ﬁ„ ›—⁄ «·⁄„Ì·"
    frmCustomer3Caption(77, 1) = "Customer branch code"
    frmCustomer3Caption(78, 0) = "‰Ê⁄ «·ÂÊÌ…-—ﬁ„ «·ÂÊÌ…"
    frmCustomer3Caption(78, 1) = "IdType-Id number"
     
    frmJointAccNameCaption(0, 0) = "«”„«¡ «·Õ”«» «·„‘ —ﬂ"
    frmJointAccNameCaption(0, 1) = "Joint Account Names"
    frmJointAccNameCaption(1, 0) = "«”„ «·Õ”«» «·„‘ —ﬂ ⁄·Ï «·‘Ìﬂ ”ÿ— - 1"
    frmJointAccNameCaption(1, 1) = "Joint Account Name on Cheque                                               Line-1"
    frmJointAccNameCaption(2, 0) = " ”ÿ— - 2"
    frmJointAccNameCaption(2, 1) = " Line-2"
    frmJointAccNameCaption(3, 0) = "«”„ «·Õ”«» «·„‘ —ﬂ ⁄·Ï «·‹‹‹‹‹‹‹‹‹ ﬁ—Ì—"
    frmJointAccNameCaption(3, 1) = "Joint Account Name on Reports"
    frmJointAccNameCaption(4, 0) = "‰⁄„"
    frmJointAccNameCaption(4, 1) = "OK"
         
    mnuCustomerCaption1(1, 0) = " ›«’Ì· «·⁄„Ì·"
    mnuCustomerCaption1(1, 1) = "Customer Details"
    mnuCustomerCaption1(2, 0) = "⁄„Ì· ÃœÌœ"
    mnuCustomerCaption1(2, 1) = "New Customer"
    
    mnuCustomerCaption(1, 0) = "Œœ„… «·⁄„·«¡"
    mnuCustomerCaption(1, 1) = "Customer Service"
    mnuCustomerCaption(2, 0) = "„·›‹‹‹«  „⁄·ﬁ‹‹‹… "
    mnuCustomerCaption(2, 1) = "Customer Entries Pending Actions"
    mnuCustomerCaption(3, 0) = "»ÿ«ﬁ«  „⁄·ﬁ… »Õ«Ã… ≈·Ï  ⁄œÌ·"
    mnuCustomerCaption(3, 1) = "Card Entries Pending Action"
    mnuCustomerCaption(4, 0) = "Õ”«»«  „⁄·ﬁ… »Õ«Ã… ≈·Ï  ⁄œÌ·"
    mnuCustomerCaption(4, 1) = "Account Entries Pending Action"
    mnuCustomerCaption(5, 0) = "√Ê«„— À«» Â „⁄·ﬁ… »Õ«Ã… «·Ï  ⁄œÌ·"
    mnuCustomerCaption(5, 1) = "Standing Order Pending Action"
    mnuCustomerCaption(6, 0) = "‘Ìﬂ«  „ÊﬁÊ›… „⁄·ﬁ… »Õ«Ã… «·Ï  ⁄œÌ·"
    mnuCustomerCaption(6, 1) = "Stop Cheque Pending Action"
    mnuCustomerCaption(7, 0) = " €ÌÌ— ﬂ·„… «·”—"
    mnuCustomerCaption(7, 1) = "Change Password"
    mnuCustomerCaption(8, 0) = "ÕÃÊ“«  »ÿ«ﬁ«  «·«∆ „«‰ «·„⁄·ﬁÂ"
    mnuCustomerCaption(8, 1) = "Credit card blocking pending action"
    mnuCustomerCaption(9, 0) = "ÕÃÊ“«  «·Õ”«»«  «·„⁄·ﬁÂ"
    mnuCustomerCaption(9, 1) = "Account blocking pending action"
    mnuCustomerCaption(10, 0) = "«—ﬁ«„ «·⁄„·«¡ «·„› ÊÕ… ⁄‰ ÿ—Ìﬁ Â« › «·⁄—»Ì"
    mnuCustomerCaption(10, 1) = "Customers opened through phone"
    mnuCustomerCaption(11, 0) = "«·«Ã—«¡«  «·„⁄·ﬁ… ··ÊœÌ⁄…"
    mnuCustomerCaption(11, 1) = "Time Deposit pending action"
    mnuCustomerCaption(12, 0) = "ÕÊ«·«  ”ÊÌ›  «·„⁄·ﬁ… „‰ «·›—⁄"
    mnuCustomerCaption(12, 1) = "Swift Transfer pending from branch"
    mnuCustomerCaption(13, 0) = "ÕÊ«·«  ”ÊÌ›  «·„⁄·ﬁ… „‰ «·„‘—›"
    mnuCustomerCaption(13, 1) = "Swift Transfer pending from supervisor"
    'Added by Mohit on 21 August, 2007
    mnuCustomerCaption(14, 0) = "«·«” ›”«— ⁄‰ ÕÊ«·«  ”ÊÌ› "
    mnuCustomerCaption(14, 1) = "Swift Transfer Enquiry"
    mnuCustomerCaption(15, 0) = "»ÿ«ﬁ«  ’—«› ¬·Ì ÿ·»  ⁄‰ ÿ—Ìﬁ ‰Ÿ«„ ›Ì‰«ﬂ·"
    mnuCustomerCaption(15, 1) = "ATM Cards requested through Finacle"
    
    mnuSupervisorCaption(1, 0) = "«·„‘—›"
    mnuSupervisorCaption(1, 1) = "Supervisor"
    mnuSupervisorCaption(2, 0) = "„·›‹‹‹‹‹«  „⁄·ﬁ‹‹‹‹‹Â"
    mnuSupervisorCaption(2, 1) = "Customer Entries Pending Approvals"
    mnuSupervisorCaption(3, 0) = "»ÿ«ﬁ«  »Õ«Ã… ≈·Ï „Ê«›ﬁ… „”ƒÊ·"
    mnuSupervisorCaption(3, 1) = "Card Entries Pending Approvals"
    mnuSupervisorCaption(4, 0) = "Õ”«»«  „⁄·ﬁ… »Õ«Ã… «·Ï „Ê«›ﬁ… „”ƒÊ·"
    mnuSupervisorCaption(4, 1) = "Account Entries Pending Approvals"
    mnuSupervisorCaption(5, 0) = " €ÌÌ— ﬂ·„… «·”‹‹‹‹‹‹‹—"
    mnuSupervisorCaption(5, 1) = "Change Password"
    mnuSupervisorCaption(6, 0) = "√Ê«„— À«» … „⁄·ﬁ… »Õ«Ã… «·Ï  ›ÊÌ÷"
    mnuSupervisorCaption(6, 1) = "Standing Order Pending Approvals"
    mnuSupervisorCaption(7, 0) = "‘Ìﬂ«  „ÊﬁÊ›… „⁄·ﬁ… »Õ«Ã… «·Ï  ›ÊÌ÷"
    mnuSupervisorCaption(7, 1) = "Stop Cheque Pending Approvals"
    mnuSupervisorCaption(8, 0) = "≈⁄«œ…  ‘€Ì· ﬂ·„… «·”— ·„ÊŸ›Ì «·›—⁄"
    mnuSupervisorCaption(8, 1) = "Reset password for branch users"
    mnuSupervisorCaption(9, 0) = " ÕœÌÀ «·„⁄·Ê„«  «·„Õ·ÌÂ"
    mnuSupervisorCaption(9, 1) = "Refresh Local Database"
    mnuSupervisorCaption(10, 0) = " ÕœÌÀ Ã“∆Ì"
    mnuSupervisorCaption(10, 1) = "Partial Refresh"
    mnuSupervisorCaption(11, 0) = " ÕœÌÀ ﬂ·Ì"
    mnuSupervisorCaption(11, 1) = "Full Refresh"
    mnuSupervisorCaption(12, 0) = "«·«—ﬁ«„ «·”—Ì… «·„⁄·ﬁ… ··Â« › "
    mnuSupervisorCaption(12, 1) = "T-Pin Pending activities"
    mnuSupervisorCaption(13, 0) = " €ÌÌ— ·€… «·‘«‘…/Change screen language"
    mnuSupervisorCaption(13, 1) = "Change screen language/ €ÌÌ— ·€… «·‘«‘…"
    mnuSupervisorCaption(14, 0) = "’Ì«‰… ﬁ«⁄œ… «·»Ì«‰«  «·„Õ·Ì…"
    mnuSupervisorCaption(14, 1) = "Compact Local Database"
    mnuSupervisorCaption(15, 0) = "ÕÃÊ“«  »ÿ«ﬁ«  «·«∆ „«‰ «·„⁄·ﬁÂ"
    mnuSupervisorCaption(15, 1) = "Credit card blocking Pending activities"
    mnuSupervisorCaption(16, 0) = "ÕÃÊ“«  «·Õ”«»«  «·„⁄·ﬁÂ"
    mnuSupervisorCaption(16, 1) = "Account blocking Pending activities"
    mnuSupervisorCaption(17, 0) = "«·«Ã—«¡«  «·„⁄·ﬁ… ··ÊœÌ⁄…"
    mnuSupervisorCaption(17, 1) = "Time Deposit pending activities"
    mnuSupervisorCaption(18, 0) = "ÕÊ«·«  ”ÊÌ›  «·„⁄·ﬁ…"
    mnuSupervisorCaption(18, 1) = "Swift transfer pending activities"
    mnuSupervisorCaption(19, 0) = "ÿ»«⁄… »ÿ«ﬁ… › Õ Õ”«»"
    mnuSupervisorCaption(19, 1) = "Print account opening card"
        
    mnuAtmCardCaption(0, 0) = "»ÿ«ﬁ«  ’—«› ¬·Ì"
    mnuAtmCardCaption(0, 1) = "ATM Cards"
    mnuAtmCardCaption(1, 0) = "»ÿ«ﬁ… ÃœÌœ…"
    mnuAtmCardCaption(1, 1) = "New Card"
    mnuAtmCardCaption(2, 0) = "»ÿ«ﬁ…  «»⁄‹… ÃœÌœ…"
    mnuAtmCardCaption(2, 1) = "New Supplementary Cards"
    
    mnuAccountCaption(0, 0) = " ﬁ«—Ì—"
    mnuAccountCaption(0, 1) = "Reports"
    mnuAccountCaption(1, 0) = " ﬁ—Ì— ÿ·»«  œ›« — «·‘Ìﬂ«  «·ÌÊ„Ì"
    mnuAccountCaption(1, 1) = "Cheque Book Daily Activity Report"
    mnuAccountCaption(2, 0) = "ﬂ‘› Õ”«»"
    mnuAccountCaption(2, 1) = "Statement"
    mnuAccountCaption(3, 0) = " ﬁ—Ì— »”Ã·«  «·⁄„·«¡ «·Ãœœ «·„› ÊÕ… » «—ÌŒ «·ÌÊ„"
    mnuAccountCaption(3, 1) = "Report on New Customer opened TODAY"
    mnuAccountCaption(4, 0) = " ﬁ—Ì— »⁄„·Ì«  »ÿ«ﬁ«  «·’—«› ·Â–« «·ÌÊ„"
    mnuAccountCaption(4, 1) = "Report on ATM card activity for TODAY"
    mnuAccountCaption(5, 0) = " ﬁ—Ì— »⁄„·Ì«  «·—ﬁ„ «·”—Ì ··’—«› «·¬·Ì ·Â–« «·ÌÊ„"
    mnuAccountCaption(5, 1) = "Report on ATM Pin select activity for TODAY"
    mnuAccountCaption(6, 0) = " ﬁ—Ì— »⁄„·Ì«  «·—ﬁ„ «·”—Ì ··Â« › ·Â–« «·ÌÊ„"
    mnuAccountCaption(6, 1) = "Report on Telephone Pin select activity for TODAY"
    'Added by Mohit on 21 August, 2007
    mnuAccountCaption(7, 0) = " ﬁ«—Ì— ÕÊ«·«  «·”ÊÌ› "
    mnuAccountCaption(7, 1) = "Swift Transfer Reports"
    
    mnuCardProductionCaption(0, 0) = "„—ﬂ“ ≈‰ «Ã «·»ÿ«ﬁ« "
    mnuCardProductionCaption(0, 1) = "Card Production Centre"
    mnuCardProductionCaption(1, 0) = " ÃœÌœ «·»ÿ«ﬁ« "
    mnuCardProductionCaption(1, 1) = "Card Renewal"
    mnuCardProductionCaption(2, 0) = " ÕœÌÀ Õ«·… «·»ÿ«ﬁ…"
    mnuCardProductionCaption(2, 1) = "Update Card Production Status"
     
    mnuAboutCaption(0, 0) = "„”«⁄œ…"
    mnuAboutCaption(0, 1) = "About"
    mnuAboutCaption(1, 0) = "«·„”«⁄œ… / Œœ„«  «·⁄„·«¡"
    mnuAboutCaption(1, 1) = "About CSD"
     
    frmSupervisorApprovalCaption(0, 0) = "ﬁ«∆„… »«·«⁄„«· «·„⁄·ﬁÂ"
    frmSupervisorApprovalCaption(0, 1) = "List of Pending Activities"
    frmSupervisorApprovalCaption(1, 0) = "«⁄„«· «·„‘—› «·„⁄·ﬁÂ"
    frmSupervisorApprovalCaption(1, 1) = "Supervisor Pending List"
    frmSupervisorApprovalCaption(2, 0) = "«⁄„«· „ÊŸ› Œœ„… «·⁄„·«¡"
    frmSupervisorApprovalCaption(2, 1) = "CSO Pending List"
    frmSupervisorApprovalCaption(3, 0) = "ÂÊÌ… «·„” Œœ„"
    frmSupervisorApprovalCaption(3, 1) = "UserId"
    frmSupervisorApprovalCaption(4, 0) = "«·ÌÊ„ Ê «· «—ÌŒ"
    frmSupervisorApprovalCaption(4, 1) = "Date & Time"
    frmSupervisorApprovalCaption(5, 0) = "—ﬁ„ «·⁄„Ì·"
    frmSupervisorApprovalCaption(5, 1) = "Customer No"
    frmSupervisorApprovalCaption(6, 0) = "«·«”„ «·„Œ ’—"
    frmSupervisorApprovalCaption(6, 1) = "Short Name"
    frmSupervisorApprovalCaption(7, 0) = "‰Ê⁄ «·ÂÊÌÂ"
    frmSupervisorApprovalCaption(7, 1) = "Id Type"
    frmSupervisorApprovalCaption(8, 0) = "—ﬁ„ «·ÂÊÌ…"
    frmSupervisorApprovalCaption(8, 1) = "Id Number"
    frmSupervisorApprovalCaption(9, 0) = " ’‰Ì› —∆Ì”Ï"
    frmSupervisorApprovalCaption(9, 1) = "Main Category"
    frmSupervisorApprovalCaption(10, 0) = " ’‰Ì› ›—⁄Ì"
    frmSupervisorApprovalCaption(10, 1) = "Sub Category"
    frmSupervisorApprovalCaption(11, 0) = "ﬁ»Ê· «·ÕﬁÊ· "
    frmSupervisorApprovalCaption(11, 1) = "Verify Selected Record"
    frmSupervisorApprovalCaption(12, 0) = "Œ—ÊÃ"
    frmSupervisorApprovalCaption(12, 1) = "Cancel"
    frmSupervisorApprovalCaption(13, 0) = "ﬁ«∆„… «·⁄„·«¡ «·„⁄·ﬁÌ‰"
    frmSupervisorApprovalCaption(13, 1) = "Customers opened via phone pending list"
    frmSupervisorApprovalCaption(14, 0) = "—ﬁ„ «·⁄„Ì·"
    frmSupervisorApprovalCaption(14, 1) = "Customer Number"
    frmSupervisorApprovalCaption(15, 0) = "«»ÕÀ ⁄‰ «·„⁄·ﬁ"
    frmSupervisorApprovalCaption(15, 1) = "Check pending list"
    
    frmSupervisorRejectionCaption(0, 0) = "„—›Ê÷«  «·„‘—›"
    frmSupervisorRejectionCaption(0, 1) = "Supervisor Rejection"
    frmSupervisorRejectionCaption(1, 0) = "„·«ÕŸ« "
    frmSupervisorRejectionCaption(1, 1) = "Comments"
    frmSupervisorRejectionCaption(2, 0) = "„—›Ê÷"
    frmSupervisorRejectionCaption(2, 1) = "Reject"
    frmSupervisorRejectionCaption(3, 0) = "ÕÊ·  ·„ÊŸ› Œœ„«  «·⁄„·«¡"
    frmSupervisorRejectionCaption(3, 1) = "Forward To CSO"
    frmSupervisorRejectionCaption(4, 0) = "Œ—ÊÃ"
    frmSupervisorRejectionCaption(4, 1) = "Cancel"
     
    frmResetPasswordCaption(0, 0) = "≈⁄«œ…  ‘€Ì· ﬂ·„… «·”— ·„ÊŸ›Ì «·›—⁄"
    frmResetPasswordCaption(0, 1) = "Reset password for branch users"
    frmResetPasswordCaption(1, 0) = "≈⁄«œ…  ‘€Ì· ﬂ·„… «·”— ·„ÊŸ›Ì «·›—⁄"
    frmResetPasswordCaption(1, 1) = "Reset password for branch users"
    frmResetPasswordCaption(2, 0) = "ÂÊÌ… «·„” Œœ„"
    frmResetPasswordCaption(2, 1) = "User Id"
    frmResetPasswordCaption(3, 0) = "≈⁄«œ…  ‘€Ì·"
    frmResetPasswordCaption(3, 1) = "Reset Password"
    frmResetPasswordCaption(4, 0) = "Œ—ÊÃ"
    frmResetPasswordCaption(4, 1) = "Cancel"
    
    frmChangeScreenLangCaption(0, 0) = " €ÌÌ— ·€… «·‘«‘… ··„” Œœ„"
    frmChangeScreenLangCaption(0, 1) = "Change Screen language for the user"
    frmChangeScreenLangCaption(1, 0) = "ÂÊÌ… «·„” Œœ„"
    frmChangeScreenLangCaption(1, 1) = "User Id"
    frmChangeScreenLangCaption(2, 0) = "«··€…"
    frmChangeScreenLangCaption(2, 1) = "Language"
    frmChangeScreenLangCaption(3, 0) = "⁄—»Ì"
    frmChangeScreenLangCaption(3, 1) = "Arabic"
    frmChangeScreenLangCaption(4, 0) = "«‰Ã·Ì“Ì"
    frmChangeScreenLangCaption(4, 1) = "English"
    frmChangeScreenLangCaption(5, 0) = " €ÌÌ— «··€Â/Change Language"
    frmChangeScreenLangCaption(5, 1) = "Change Language/ €ÌÌ— «··€Â"
    frmChangeScreenLangCaption(6, 0) = "Œ—ÊÃ"
    frmChangeScreenLangCaption(6, 1) = "Cancel"
    
    frmCardGridCaption(0, 0) = "≈œ«—… «·»ÿ«ﬁ« "
    frmCardGridCaption(0, 1) = "Card Management"
    frmCardGridCaption(1, 0) = "≈” ›”«— ⁄‰ »ÿ«ﬁ…"
    frmCardGridCaption(1, 1) = "Card Information"
    frmCardGridCaption(2, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmCardGridCaption(2, 1) = "Card Number"
    frmCardGridCaption(3, 0) = "«·≈”„ Õ”» «·»ÿ«ﬁ…"
    frmCardGridCaption(3, 1) = "Name on the card"
    frmCardGridCaption(4, 0) = " «—ÌŒ «·≈’œ«—"
    frmCardGridCaption(4, 1) = "Issue Date"
    frmCardGridCaption(5, 0) = " «—ÌŒ «·≈‰ Â«¡"
    frmCardGridCaption(5, 1) = "Expiry Date"
    frmCardGridCaption(6, 0) = "Õ«·… «·»ÿ«ﬁ…"
    frmCardGridCaption(6, 1) = "Card Status"
    frmCardGridCaption(7, 0) = "Ê÷⁄ «·»ÿ«ﬁ…"
    frmCardGridCaption(7, 1) = "Request Status"
    frmCardGridCaption(8, 0) = "Õ«·… «·—ﬁ„ «·”—Ì"
    frmCardGridCaption(8, 1) = "Pin-mailer Status"
    frmCardGridCaption(9, 0) = "—ﬁ„ Õ”«» «·⁄„Ì·"
    frmCardGridCaption(9, 1) = "CORE Acct.No"
    frmCardGridCaption(10, 0) = "»ÿ«ﬁ… ÃœÌœ…"
    frmCardGridCaption(10, 1) = "New Card"
    frmCardGridCaption(11, 0) = "«·≈” ›”«—« "
    frmCardGridCaption(11, 1) = "Enquiry"
    frmCardGridCaption(12, 0) = " ⁄œÌ·« "
    frmCardGridCaption(12, 1) = "Update"
    frmCardGridCaption(13, 0) = "«· «·Ì"
    frmCardGridCaption(13, 1) = "More"
    frmCardGridCaption(14, 0) = "Œ—ÊÃ"
    frmCardGridCaption(14, 1) = "Exit"
    frmCardGridCaption(15, 0) = "»ÿ«ﬁ… «” ·„  »«·›—⁄"
    frmCardGridCaption(15, 1) = "Card Received by branch"
    frmCardGridCaption(16, 0) = "»ÿ«ﬁ… √—”·  ··⁄„Ì·"
    frmCardGridCaption(16, 1) = "Card issued to customer"
    frmCardGridCaption(17, 0) = "«·—ﬁ„ «·”—Ì «” ·„ »«·›—⁄"
    frmCardGridCaption(17, 1) = "Pin-mailer Received by branch"
    frmCardGridCaption(18, 0) = "«·—ﬁ„ «·”—Ì √—”· ··⁄„Ì‹‹·"
    frmCardGridCaption(18, 1) = "Pin-mailer Issued to customer"
    frmCardGridCaption(19, 0) = "ÿ·» »ÿ«ﬁ… „”ƒÊ· ’—«›"
    frmCardGridCaption(19, 1) = "Admin card Request"
    frmCardGridCaption(20, 0) = "Õ—ﬂ«   ⁄œÌ· «·»ÿ«ﬁÂ"
    frmCardGridCaption(20, 1) = "Card Update History"
    
    frmCardDetailsCaption(0, 0) = "’Ì«‰‹‹… «·»ÿ«ﬁ« "
    frmCardDetailsCaption(0, 1) = "Card Maintenance"
    frmCardDetailsCaption(1, 0) = "—ﬁ„ «·»ÿ«ﬁ‹‹‹‹‹‹‹‹‹…"
    frmCardDetailsCaption(1, 1) = "Card Number"
    frmCardDetailsCaption(2, 0) = "—ﬁ„ «·⁄„Ì‹‹‹‹‹‹‹‹‹‹·"
    frmCardDetailsCaption(2, 1) = "Customer Number"
    frmCardDetailsCaption(3, 0) = "≈”„ «·⁄„Ì‹‹·"
    frmCardDetailsCaption(3, 1) = "Customer Name"
    frmCardDetailsCaption(4, 0) = " √”«”Ì /  «»⁄"
    frmCardDetailsCaption(4, 1) = "Primary/Supplementary"
    frmCardDetailsCaption(5, 0) = "√”«”Ì"
    frmCardDetailsCaption(5, 1) = "Primary"
    frmCardDetailsCaption(6, 0) = " ‹‹‹«»⁄"
    frmCardDetailsCaption(6, 1) = "Supplementary"
    frmCardDetailsCaption(7, 0) = "‰Ê⁄ «·»ÿ«ﬁ‹‹…"
    frmCardDetailsCaption(7, 1) = "Type of card"
    frmCardDetailsCaption(8, 0) = "«·ﬂ —Ê‰"
    frmCardDetailsCaption(8, 1) = "Electron"
    frmCardDetailsCaption(9, 0) = "œÊ·ÌÂ"
    frmCardDetailsCaption(9, 1) = "Elec.Intl"
    frmCardDetailsCaption(10, 0) = "«·–ﬂÌ… «·œÊ·Ì…"
    frmCardDetailsCaption(10, 1) = "Intl.Chip"
    frmCardDetailsCaption(11, 0) = "„”∆Ê·"
    frmCardDetailsCaption(11, 1) = "Admin"
    frmCardDetailsCaption(12, 0) = "«·≈”„ ⁄·Ï «·»ÿ«ﬁ‹‹…"
    frmCardDetailsCaption(12, 1) = "Name on the card"
    frmCardDetailsCaption(13, 0) = "«··‹‹€…"
    frmCardDetailsCaption(13, 1) = "Lang.Pref"
    frmCardDetailsCaption(14, 0) = "⁄—»Ì"
    frmCardDetailsCaption(14, 1) = "Arabic"
    frmCardDetailsCaption(15, 0) = "≈‰Ã·Ì“Ì"
    frmCardDetailsCaption(15, 1) = "English"
    frmCardDetailsCaption(16, 0) = "⁄—»Ì/«‰Ã·Ì“Ì"
    frmCardDetailsCaption(16, 1) = "Arabic/English"
    frmCardDetailsCaption(17, 0) = "„ﬂ‹‹‹«‰ «·≈” ·«„"
    frmCardDetailsCaption(17, 1) = "Delivery Location"
    frmCardDetailsCaption(18, 0) = "›—⁄ «·⁄„Ì·"
    frmCardDetailsCaption(18, 1) = "Cust Branch"
    frmCardDetailsCaption(19, 0) = "’‰œÊﬁ «·»—Ìœ"
    frmCardDetailsCaption(19, 1) = "Mail"
    frmCardDetailsCaption(20, 0) = "«·⁄‰‹‹‹‹‹‹Ê«‰ 1"
    frmCardDetailsCaption(20, 1) = "Delivery Address1"
    frmCardDetailsCaption(21, 0) = "«·⁄‰Ê«‰ 2"
    frmCardDetailsCaption(21, 1) = "Address2"
    frmCardDetailsCaption(22, 0) = "—ﬁ„ ’‰œÊﬁ «·»—Ìœ"
    frmCardDetailsCaption(22, 1) = "PO Box"
    frmCardDetailsCaption(23, 0) = "«·„œÌ‰…"
    frmCardDetailsCaption(23, 1) = "City"
    frmCardDetailsCaption(24, 0) = "«·—„“«·»—ÌœÌ"
    frmCardDetailsCaption(24, 1) = "Zip code"
    frmCardDetailsCaption(25, 0) = "Ê÷⁄ ≈’œ«— «·»ÿ«ﬁ…"
    frmCardDetailsCaption(25, 1) = "Card Generation Status"
    frmCardDetailsCaption(26, 0) = "Ê÷⁄ ≈’œ«— «·—ﬁ„ «·”—Ì"
    frmCardDetailsCaption(26, 1) = "Pin Generation Status"
    frmCardDetailsCaption(27, 0) = "Õ«·… «·‹»ÿ«ﬁ‹‹‹…"
    frmCardDetailsCaption(27, 1) = "Card Status"
    frmCardDetailsCaption(28, 0) = " «—ÌŒ ≈’œ«—«·»ÿ«ﬁ…"
    frmCardDetailsCaption(28, 1) = "Card Issue Date"
    frmCardDetailsCaption(29, 0) = " «—ÌŒ «·≈‰ Â«¡"
    frmCardDetailsCaption(29, 1) = "Card Expiry Date"
    frmCardDetailsCaption(30, 0) = "≈Ìﬁ«› «·»ÿ«ﬁ…"
    frmCardDetailsCaption(30, 1) = "Deactivate"
    frmCardDetailsCaption(31, 0) = " ‘€Ì· «·»ÿ«ﬁ…"
    frmCardDetailsCaption(31, 1) = "Activate"
    frmCardDetailsCaption(32, 0) = "≈⁄«œ… ≈’œ«— »ÿ«ﬁ…"
    frmCardDetailsCaption(32, 1) = "Force Card Generation"
    frmCardDetailsCaption(33, 0) = "≈⁄«œ… ≈’œ«— —ﬁ„ ”—Ì"
    frmCardDetailsCaption(33, 1) = "Force Pin Generation"
    frmCardDetailsCaption(34, 0) = "„·«ÕŸ«  «·„‘—›"
    frmCardDetailsCaption(34, 1) = "SupervisorComments"
    frmCardDetailsCaption(35, 0) = "≈’œ«—"
    frmCardDetailsCaption(35, 1) = "Create"
    frmCardDetailsCaption(36, 0) = "„Ê«›ﬁ"
    frmCardDetailsCaption(36, 1) = "Approve"
    frmCardDetailsCaption(37, 0) = "„—›Ê÷"
    frmCardDetailsCaption(37, 1) = "Reject"
    frmCardDetailsCaption(38, 0) = "Œ—ÊÃ"
    frmCardDetailsCaption(38, 1) = "Cancel"
    frmCardDetailsCaption(39, 0) = "«· «—ÌŒ"
    frmCardDetailsCaption(39, 1) = "History"
    frmCardDetailsCaption(40, 0) = "«·›—⁄ ÿ«·» «·»ÿ«ﬁ…"
    frmCardDetailsCaption(40, 1) = "Requested Branch"
    frmCardDetailsCaption(41, 0) = "—ﬁ„ Õ”«» «·»ÿ«ﬁ…"
    frmCardDetailsCaption(41, 1) = "Attached Account #"
    frmCardDetailsCaption(42, 0) = "„⁄·Ê„«  «·⁄„Ì·"
    frmCardDetailsCaption(42, 1) = "Customer Info"
    frmCardDetailsCaption(43, 0) = "„⁄·Ê„«  «·Õ”«»"
    frmCardDetailsCaption(43, 1) = "Account Info"
    frmCardDetailsCaption(44, 0) = " ⁄œÌ· «·⁄‰Ê«‰"
    frmCardDetailsCaption(44, 1) = "Change Address"
    frmCardDetailsCaption(45, 0) = "—„“ «·›—⁄"
    frmCardDetailsCaption(45, 1) = "Branch Code"
    frmCardDetailsCaption(46, 0) = "«÷«›…  Õ›Ÿ"
    frmCardDetailsCaption(46, 1) = "Restrict"
    frmCardDetailsCaption(47, 0) = "«·€«¡  Õ›Ÿ"
    frmCardDetailsCaption(47, 1) = "Unrestrict"
    frmCardDetailsCaption(48, 0) = "›∆… «·⁄„Ì·"
    frmCardDetailsCaption(48, 1) = "Cust.category"
    frmCardDetailsCaption(49, 0) = "VIP"
    frmCardDetailsCaption(49, 1) = "VIP"
    frmCardDetailsCaption(50, 0) = "CPS"
    frmCardDetailsCaption(50, 1) = "CPS"
    frmCardDetailsCaption(51, 0) = "„ ﬁ«⁄œ"
    frmCardDetailsCaption(51, 1) = "Pension"
    frmCardDetailsCaption(52, 0) = "„“«Ì« »‰ﬂÌÂ"
    frmCardDetailsCaption(52, 1) = "Package"
    frmCardDetailsCaption(53, 0) = "ÃœÌœÂ «Ê »œÌ·Â"
    frmCardDetailsCaption(53, 1) = "New or Replacement"
    frmCardDetailsCaption(54, 0) = "ÃœÌœÂ"
    frmCardDetailsCaption(54, 1) = "New"
    frmCardDetailsCaption(55, 0) = "»œÌ·Â"
    frmCardDetailsCaption(55, 1) = "Replacement"
    frmCardDetailsCaption(56, 0) = "«·–ﬂÌ… «·„Õ·Ì…"
    frmCardDetailsCaption(56, 1) = "Local Chip"
    frmCardDetailsCaption(57, 0) = "ÿ»«⁄… ÿ·» «·»ÿ«ﬁ…"
    frmCardDetailsCaption(57, 1) = "Print card application"
    frmCardDetailsCaption(58, 0) = "ÿ»«⁄… ÿ·» «·—ﬁ„ «·”—Ì"
    frmCardDetailsCaption(58, 1) = "Print Pin application"
        
    frmCardChangeAddressCaption(0, 0) = " ⁄“Ì“ ⁄‰Ê«‰ «·»ÿ«ﬁ…"
    frmCardChangeAddressCaption(0, 1) = "Card Address Confirmation"
    frmCardChangeAddressCaption(1, 0) = "Â·  —Ìœ  ⁄œÌ· «·⁄‰Ê«‰ ·Ã„Ì⁄ «·»ÿ«ﬁ« "
    frmCardChangeAddressCaption(1, 1) = "Do you want this address to be updated in all cards"
        
    frmCardHistoryCaption(0, 0) = " «—ÌŒ «·»ÿ«ﬁ… / «·—ﬁ„ «·”—Ì"
    frmCardHistoryCaption(0, 1) = "Card/Pin History"
    frmCardHistoryCaption(1, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmCardHistoryCaption(1, 1) = "Card Number"
    frmCardHistoryCaption(2, 0) = " «—ÌŒ «·»ÿ«ﬁ…"
    frmCardHistoryCaption(2, 1) = "Card History"
    frmCardHistoryCaption(3, 0) = " «—ÌŒ «·—ﬁ„ «·”—Ì"
    frmCardHistoryCaption(3, 1) = "Pin History"
    frmCardHistoryCaption(4, 0) = "«· «—ÌŒ"
    frmCardHistoryCaption(4, 1) = "Date"
    frmCardHistoryCaption(5, 0) = "«·ÕœÀ"
    frmCardHistoryCaption(5, 1) = "Action"
    frmCardHistoryCaption(6, 0) = "«·ÂÊÌ…"
    frmCardHistoryCaption(6, 1) = "User Id"
    frmCardHistoryCaption(7, 0) = "„ÿ·Ê»"
    frmCardHistoryCaption(7, 1) = "Requested"
    frmCardHistoryCaption(8, 0) = "„Ê«›ﬁ ⁄·ÌÂ"
    frmCardHistoryCaption(8, 1) = "Approved"
    frmCardHistoryCaption(9, 0) = " ÃœÌœ »ÿ«ﬁ…"
    frmCardHistoryCaption(9, 1) = "Card Renewed"
    frmCardHistoryCaption(10, 0) = "»ÿ«ﬁ…„⁄«œ≈’œ«—Â«"
    frmCardHistoryCaption(10, 1) = "Force Card"
    frmCardHistoryCaption(11, 0) = "—ﬁ„ ”—Ì „⁄«œ ≈’œ«—Â"
    frmCardHistoryCaption(11, 1) = "Force Pin"
    frmCardHistoryCaption(12, 0) = "≈Ìﬁ«›  ‘€Ì· »ÿ«ﬁ…"
    frmCardHistoryCaption(12, 1) = "Card Deactivated"
    frmCardHistoryCaption(13, 0) = " „ ÿ·» «· ‘€Ì·"
    frmCardHistoryCaption(13, 1) = "Activation Requested"
    frmCardHistoryCaption(14, 0) = " „ «·„Ê«›ﬁ… ⁄·Ï «· ‘€Ì·"
    frmCardHistoryCaption(14, 1) = "Activation Approved"
    frmCardHistoryCaption(15, 0) = "„—›Ê÷"
    frmCardHistoryCaption(15, 1) = "Rejected"
    frmCardHistoryCaption(16, 0) = "√—”·  «·»ÿ«ﬁÂ «·Ï «·«‰ «Ã"
    frmCardHistoryCaption(16, 1) = "Sent for card production"
    frmCardHistoryCaption(17, 0) = "’œ—  «·»ÿ«ﬁÂ"
    frmCardHistoryCaption(17, 1) = "Card Produced"
    frmCardHistoryCaption(18, 0) = "√” ·„  »«·›—⁄"
    frmCardHistoryCaption(18, 1) = "Received by Branch"
    frmCardHistoryCaption(19, 0) = "√—”·  ··⁄„Ì·"
    frmCardHistoryCaption(19, 1) = "Issued to customer"
    frmCardHistoryCaption(20, 0) = " „  «·ÿ»«⁄… ›Ì HSM"
    frmCardHistoryCaption(20, 1) = "Printed at HSM"
    frmCardHistoryCaption(21, 0) = "«·⁄Êœ… «·Ï  ›«’Ì· «·»ÿ«ﬁ…"
    frmCardHistoryCaption(21, 1) = "Return to card details"
    frmCardHistoryCaption(22, 0) = " ⁄œÌ· «·⁄‰Ê«‰"
    frmCardHistoryCaption(22, 1) = "Change Address"
    frmCardHistoryCaption(23, 0) = "ÌÊÃœ  Õ›Ÿ"
    frmCardHistoryCaption(23, 1) = "Restriction"
    frmCardHistoryCaption(24, 0) = "«·€«¡  Õ›Ÿ"
    frmCardHistoryCaption(24, 1) = "Unrestriction"
    frmCardHistoryCaption(25, 0) = "«·Êﬁ "
    frmCardHistoryCaption(25, 1) = "Time"
    frmCardHistoryCaption(26, 0) = " ÕÊ·  «·Ï œÊ·Ì…"
    frmCardHistoryCaption(26, 1) = "Converted to Intl"
    frmCardHistoryCaption(27, 0) = "«’œ«— »ÿ«ﬁ… „ ﬁ«⁄œ ÃœÌœÂ"
    frmCardHistoryCaption(27, 1) = "New Pens card created"
       
    frmCardPendingListCaption(0, 0) = "·«∆Õ… «·»ÿ«ﬁ«  «·„⁄·ﬁ… ·œÏ «·„‘—›"
    frmCardPendingListCaption(0, 1) = "Card Pending List for Supervisor"
    frmCardPendingListCaption(1, 0) = "·«∆Õ… «·»ÿ«ﬁ«  «·„⁄·ﬁ… ·œÏ Œœ„«  «·⁄„·«¡"
    frmCardPendingListCaption(1, 1) = "Card Pending List for CSO"
    frmCardPendingListCaption(2, 0) = "·«∆Õ… «·»ÿ«ﬁ«  «·„⁄·ﬁ… ·œÏ «·„‘—›"
    frmCardPendingListCaption(2, 1) = "Card Pending Activities for Supervisor"
    frmCardPendingListCaption(3, 0) = "·«∆Õ… «·»ÿ«ﬁ«  «·„⁄·ﬁ… ·œÏ Œœ„«  «·⁄„·«¡"
    frmCardPendingListCaption(3, 1) = "Card Pending Activities for CSO"
    frmCardPendingListCaption(4, 0) = "«·ÂÊÌ…"
    frmCardPendingListCaption(4, 1) = "User Id"
    frmCardPendingListCaption(5, 0) = " «—ÌŒ Ê «·Êﬁ "
    frmCardPendingListCaption(5, 1) = "Date&Time"
    frmCardPendingListCaption(6, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmCardPendingListCaption(6, 1) = "Card Number"
    frmCardPendingListCaption(7, 0) = "«·≈”„ Õ”» «·»ÿ«ﬁ…"
    frmCardPendingListCaption(7, 1) = "Name on the card"
    frmCardPendingListCaption(8, 0) = "‰Ê⁄ «·»ÿ«ﬁ…"
    frmCardPendingListCaption(8, 1) = "Card Type"
    frmCardPendingListCaption(9, 0) = "«”«”Ì / «»⁄"
    frmCardPendingListCaption(9, 1) = "Nature of card"
    frmCardPendingListCaption(10, 0) = "‰Ê⁄ «·„⁄·ﬁ…"
    frmCardPendingListCaption(10, 1) = "Pending Type"
    frmCardPendingListCaption(11, 0) = "„‘«Âœ…  «·»ÿ«ﬁ… «·„Œ «—…"
    frmCardPendingListCaption(11, 1) = "Verify Selected Record"
    frmCardPendingListCaption(12, 0) = "Œ—ÊÃ"
    frmCardPendingListCaption(12, 1) = "Cancel"
    frmCardPendingListCaption(13, 0) = "«· «·Ì"
    frmCardPendingListCaption(13, 1) = "More"
    frmCardPendingListCaption(14, 0) = "»ÿ«ﬁ«  ’—«› ¬·Ì „⁄·ﬁÂ „‰ ›Ì‰«ﬂ·"
    frmCardPendingListCaption(14, 1) = "Cards Pending from Finacle"
    
    frmCardDeactivationCaption(0, 0) = "Êﬁ›  ‘€Ì· »ÿ«ﬁ… "
    frmCardDeactivationCaption(0, 1) = "Deactivation of card"
    frmCardDeactivationCaption(1, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmCardDeactivationCaption(1, 1) = "Card Number"
    frmCardDeactivationCaption(2, 0) = "«·≈”„ Õ”» «·»ÿ«ﬁ…"
    frmCardDeactivationCaption(2, 1) = "Name on the card"
    frmCardDeactivationCaption(3, 0) = " «—ÌŒ «·≈’œ«—"
    frmCardDeactivationCaption(3, 1) = "Card issue date"
    frmCardDeactivationCaption(4, 0) = " «—ÌŒ «·≈‰ Â«¡"
    frmCardDeactivationCaption(4, 1) = "Card expiry date"
    frmCardDeactivationCaption(5, 0) = "”»» «·Êﬁ›"
    frmCardDeactivationCaption(5, 1) = "Deactivation Type"
    frmCardDeactivationCaption(6, 0) = " «·›…"
    frmCardDeactivationCaption(6, 1) = "Damaged"
    frmCardDeactivationCaption(7, 0) = "„”—Êﬁ…"
    frmCardDeactivationCaption(7, 1) = "Stolen"
    frmCardDeactivationCaption(8, 0) = "„›ﬁÊœ…"
    frmCardDeactivationCaption(8, 1) = "Lost"
    frmCardDeactivationCaption(9, 0) = "Êﬁ›  ‘€Ì·"
    frmCardDeactivationCaption(9, 1) = "Deactivate"
    frmCardDeactivationCaption(10, 0) = "Œ—ÊÃ"
    frmCardDeactivationCaption(10, 1) = "Cancel"
    
    frmCardRejectionCaption(0, 0) = "»ÿ«ﬁ«  „⁄«œ…"
    frmCardRejectionCaption(0, 1) = "Card Rejection"
    frmCardRejectionCaption(1, 0) = "„·«ÕŸ« "
    frmCardRejectionCaption(1, 1) = "Comments"
    frmCardRejectionCaption(2, 0) = "„—›Ê÷…"
    frmCardRejectionCaption(2, 1) = "Reject"
    frmCardRejectionCaption(3, 0) = " ÕÊ· «·Ï Œœ„«  «·⁄„·«¡"
    frmCardRejectionCaption(3, 1) = "Forward to CSO"
    frmCardRejectionCaption(4, 0) = "Œ—ÊÃ"
    frmCardRejectionCaption(4, 1) = "Cancel"
    
    frmCardReceiptCaption(0, 0) = "«·»ÿ«ﬁ«  «· Ì  „ ≈” ·«„Â« »«·›—⁄"
    frmCardReceiptCaption(0, 1) = "Card Received by branch"
    frmCardReceiptCaption(1, 0) = "«·»ÿ«ﬁ«  «·„—”·… ··⁄„·«¡"
    frmCardReceiptCaption(1, 1) = "Card Issued to customer"
    frmCardReceiptCaption(2, 0) = "«·√—ﬁ«„ «·”—Ì… «· Ì  „ ≈” ·«„Â« »«·›—⁄"
    frmCardReceiptCaption(2, 1) = "Pin-mailer Received by branch"
    frmCardReceiptCaption(3, 0) = "«·√—ﬁ«„ «·”—Ì… «·„—”·… ··⁄„·«¡"
    frmCardReceiptCaption(3, 1) = "Pin-mailer issued to customer"
    frmCardReceiptCaption(4, 0) = "«” ·„"
    frmCardReceiptCaption(4, 1) = "Received"
    frmCardReceiptCaption(5, 0) = "√’œ—"
    frmCardReceiptCaption(5, 1) = "Issued"
    frmCardReceiptCaption(6, 0) = "—ﬁ„ «·»ÿ«ﬁ… "
    frmCardReceiptCaption(6, 1) = "Card Number"
    frmCardReceiptCaption(7, 0) = "«·«”„ Õ”» «·»ÿ«ﬁ…"
    frmCardReceiptCaption(7, 1) = "Name on the card"
    frmCardReceiptCaption(8, 0) = " «—ÌŒ ÿ»«⁄… «·»ÿ«ﬁ… "
    frmCardReceiptCaption(8, 1) = "Card prod.Date"
    frmCardReceiptCaption(9, 0) = " «—ÌŒ «·«’œ«—"
    frmCardReceiptCaption(9, 1) = "Issue Date"
    frmCardReceiptCaption(10, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmCardReceiptCaption(10, 1) = "Expiry Date"
    frmCardReceiptCaption(11, 0) = "«· «·Ì"
    frmCardReceiptCaption(11, 1) = "More"
    frmCardReceiptCaption(12, 0) = " ÕœÌÀ"
    frmCardReceiptCaption(12, 1) = "Update status"
    frmCardReceiptCaption(13, 0) = "Œ—ÊÃ"
    frmCardReceiptCaption(13, 1) = "Cancel"
    
    frmCardRenewalCaption(0, 0) = " ÃœÌœ «·»ÿ«ﬁ…"
    frmCardRenewalCaption(0, 1) = "Card Renewal"
    frmCardRenewalCaption(1, 0) = " Ã‹‹œÌœ «·»ÿ‹‹‹‹«ﬁ« "
    frmCardRenewalCaption(1, 1) = "R E N E W A L  O F  C A R D S"
    frmCardRenewalCaption(2, 0) = "„œ… «·»ÿ«ﬁ…"
    frmCardRenewalCaption(2, 1) = "Frequency Days"
    frmCardRenewalCaption(3, 0) = "„‰ ›—⁄ —ﬁ„"
    frmCardRenewalCaption(3, 1) = "From Branch code"
    frmCardRenewalCaption(4, 0) = "«·Ï ›—⁄ —ﬁ„"
    frmCardRenewalCaption(4, 1) = "To Branch code"
    frmCardRenewalCaption(5, 0) = " ÃœÌœ"
    frmCardRenewalCaption(5, 1) = "Renew"
    frmCardRenewalCaption(6, 0) = "Œ—ÊÃ"
    frmCardRenewalCaption(6, 1) = "Cancel"
    
    frmAcceptPinCaption(0, 0) = "›÷·«..«œŒ· «·—ﬁ„ «·”—Ì"
    frmAcceptPinCaption(0, 1) = "Please Enter you ATM pin"
    frmAcceptPinCaption(1, 0) = "‰Ê⁄ «·»ÿ«ﬁ…"
    frmAcceptPinCaption(1, 1) = "Card Type"
    frmAcceptPinCaption(2, 0) = "«·«”„ ⁄·Ï «·»ÿ«ﬁ…"
    frmAcceptPinCaption(2, 1) = "Name on the card"
    frmAcceptPinCaption(3, 0) = "«·—ﬁ„ «·”—Ì"
    frmAcceptPinCaption(3, 1) = "Pin no"
    frmAcceptPinCaption(4, 0) = "«⁄œ «œŒ«· «·—ﬁ„ «·”—Ì"
    frmAcceptPinCaption(4, 1) = "Retype pin no"
    frmAcceptPinCaption(5, 0) = "‰⁄„"
    frmAcceptPinCaption(5, 1) = "Ok"
    frmAcceptPinCaption(6, 0) = "Œ—ÊÃ"
    frmAcceptPinCaption(6, 1) = "Cancel"
    frmAcceptPinCaption(7, 0) = "«Œ Ì«— «·—ﬁ„ «·”—Ì ··»ÿ«ﬁ… "
    frmAcceptPinCaption(7, 1) = "ATM Pin selection"
    
    frmPrintingCardCaption(0, 0) = "„Ê«›ﬁ… «‰ «Ã «·»ÿ«ﬁ« "
    frmPrintingCardCaption(0, 1) = "Card production approval"
    frmPrintingCardCaption(1, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmPrintingCardCaption(1, 1) = "Card No"
    frmPrintingCardCaption(2, 0) = "«·«”„ ⁄·Ï «·»ÿ«ﬁ…"
    frmPrintingCardCaption(2, 1) = "Name on the card"
    frmPrintingCardCaption(3, 0) = "‰Ê⁄ «·»ÿ«ﬁ…"
    frmPrintingCardCaption(3, 1) = "Card type"
    frmPrintingCardCaption(4, 0) = "Â·  —Ìœ «·„Ê«›ﬁ… ?"
    frmPrintingCardCaption(4, 1) = "Would you like to approve ?"
    frmPrintingCardCaption(5, 0) = "»ÿ«ﬁ…"
    frmPrintingCardCaption(5, 1) = "Card"
    frmPrintingCardCaption(6, 0) = "‰⁄„"
    frmPrintingCardCaption(6, 1) = "Yes"
    frmPrintingCardCaption(7, 0) = "·«"
    frmPrintingCardCaption(7, 1) = "No"
    frmPrintingCardCaption(8, 0) = "—ﬁ„ ”—Ì"
    frmPrintingCardCaption(8, 1) = "Pin"
    frmPrintingCardCaption(9, 0) = "‰⁄„"
    frmPrintingCardCaption(9, 1) = "Ok"
    frmPrintingCardCaption(10, 0) = "Œ—ÊÃ"
    frmPrintingCardCaption(10, 1) = "Cancel"
    
    frmAccountGridCaption(0, 0) = "Õ”«»"
    frmAccountGridCaption(0, 1) = "Account"
    frmAccountGridCaption(1, 0) = "„⁄·Ê„«  «·Õ”«»"
    frmAccountGridCaption(1, 1) = "Account Information"
    frmAccountGridCaption(2, 0) = "—ﬁ„ «·Õ”«»"
    frmAccountGridCaption(2, 1) = "Account Number"
    frmAccountGridCaption(3, 0) = "«·—’Ìœ «·œ› —Ì"
    frmAccountGridCaption(3, 1) = "Book Balance"
    frmAccountGridCaption(4, 0) = "«·—’Ìœ «·„ Ê›—"
    frmAccountGridCaption(4, 1) = "Cleared Balance"
    frmAccountGridCaption(5, 0) = "«·—’Ìœ «·„ÕÃÊ“"
    frmAccountGridCaption(5, 1) = "Blocked Balance"
    frmAccountGridCaption(6, 0) = "Õ«·… «·Õ”«»"
    frmAccountGridCaption(6, 1) = "Account Status"
    frmAccountGridCaption(7, 0) = "«·Õœ «·œ«∆‰"
    frmAccountGridCaption(7, 1) = "Credit Limit"
    frmAccountGridCaption(8, 0) = "€Ì— „ Õ—ﬂ"
    frmAccountGridCaption(8, 1) = "Dormant Flag"
    frmAccountGridCaption(9, 0) = "—ﬁ„ «·Õ—ﬂÂ"
    frmAccountGridCaption(9, 1) = "# Transaction"
    frmAccountGridCaption(10, 0) = "Õ”«» ÃœÌœ"
    frmAccountGridCaption(10, 1) = "New A/C"
    frmAccountGridCaption(11, 0) = " ⁄œÌ· Õ”«»"
    frmAccountGridCaption(11, 1) = "Update A/C"
    frmAccountGridCaption(12, 0) = "«” ›”«—« "
    frmAccountGridCaption(12, 1) = "Enquiry"
    frmAccountGridCaption(13, 0) = "«· «·Ì"
    frmAccountGridCaption(13, 1) = "More"
    frmAccountGridCaption(14, 0) = "ﬂ‘› Õ”«» „ƒﬁ "
    frmAccountGridCaption(14, 1) = "Ondemand Statement"
    frmAccountGridCaption(15, 0) = "«” ›”«— ⁄‰ Õ—ﬂ…"
    frmAccountGridCaption(15, 1) = "Transaction Enquiry"
    frmAccountGridCaption(16, 0) = "ÿ·» œ› — ‘Ìﬂ« "
    frmAccountGridCaption(16, 1) = "Cheque book request"
    frmAccountGridCaption(17, 0) = "Œ—ÊÃ"
    frmAccountGridCaption(17, 1) = "Exit"
    frmAccountGridCaption(18, 0) = "‘Ìﬂ«  Ê«—œ… ··›—⁄"
    frmAccountGridCaption(18, 1) = "Cheque Book received by branch"
    frmAccountGridCaption(19, 0) = "‘Ìﬂ«  ’«œ—… ··⁄„·«¡"
    frmAccountGridCaption(19, 1) = "Cheque Book issued to customer"
    frmAccountGridCaption(20, 0) = "√Ê«„— À«» Â"
    frmAccountGridCaption(20, 1) = "Standing Order"
    frmAccountGridCaption(21, 0) = "‘Ìﬂ«  „ÊﬁÊ›…"
    frmAccountGridCaption(21, 1) = "Stop Cheque"
    frmAccountGridCaption(22, 0) = "—ﬁ„ «·⁄„Ì·"
    frmAccountGridCaption(22, 1) = "Customer #"
    frmAccountGridCaption(23, 0) = "≈”„ «·⁄„Ì‹‹·"
    frmAccountGridCaption(23, 1) = "Customer Name"
    frmAccountGridCaption(24, 0) = "ˆﬂ‘› Õ”«» ﬁœÌ„"
    frmAccountGridCaption(24, 1) = "Historical statement"
    frmAccountGridCaption(25, 0) = " ‰‘Ìÿ Õ”«» €Ì— „ Õ—ﬂ"
    frmAccountGridCaption(25, 1) = "Activate Dormant A/c"
    frmAccountGridCaption(26, 0) = "«” ›”«— ⁄‰ ÕÊ«·…"
    frmAccountGridCaption(26, 1) = "Transfer Enquiry"
    frmAccountGridCaption(27, 0) = "BM √” ›”«— Õ—ﬂ…"
    frmAccountGridCaption(27, 1) = "BM Transaction Enquiry"
    frmAccountGridCaption(28, 0) = "«·‘Ìﬂ«  «· «·›…"
    frmAccountGridCaption(28, 1) = "Destroy Cheque"
    frmAccountGridCaption(29, 0) = "—ﬁ„ ›—⁄ «·Õ”«»"
    frmAccountGridCaption(29, 1) = "GL Branch Code"
    frmAccountGridCaption(30, 0) = " ›«’Ì· «·„»·€ «·„ÕÃÊ“"
    frmAccountGridCaption(30, 1) = "Blocked Amount Breakup"
    frmAccountGridCaption(31, 0) = " ›«’Ì·  ⁄œÌ· «·Õ”«»"
    frmAccountGridCaption(31, 1) = "Account update history"
    frmAccountGridCaption(32, 0) = "—„“ «· Õ›Ÿ ··«” ›”«—« "
    frmAccountGridCaption(32, 1) = "Enquiry restricted Flag"
    frmAccountGridCaption(33, 0) = "ÊœÌ⁄… ÃœÌœ…"
    frmAccountGridCaption(33, 1) = "New Time deposit A/c"
    frmAccountGridCaption(34, 0) = " ÃœÌœ ÊœÌ⁄…"
    frmAccountGridCaption(34, 1) = "Renew Time deposit"
                   
    frmAccountCaption(0, 0) = "’Ì«‰… «·Õ”«»"
    frmAccountCaption(0, 1) = "Account Maintenance"
    frmAccountCaption(1, 0) = "„⁄·Ê„«  «·Õ”«»"
    frmAccountCaption(1, 1) = "Account Information"
    frmAccountCaption(2, 0) = "«·⁄„·Â"
    frmAccountCaption(2, 1) = "Currency"
    frmAccountCaption(3, 0) = "«·«” «–"
    frmAccountCaption(3, 1) = "Ledger"
    frmAccountCaption(4, 0) = "«”„ «·⁄„Ì·"
    frmAccountCaption(4, 1) = "Customer No"
    frmAccountCaption(5, 0) = "«·„ ›—⁄"
    frmAccountCaption(5, 1) = "Sub Account"
    frmAccountCaption(6, 0) = " —’Ìœ «·›«∆œÂ"
    frmAccountCaption(6, 1) = "Int. Application"
    frmAccountCaption(7, 0) = "Õ«·… «·Õ”«»"
    frmAccountCaption(7, 1) = "Account Status"
    frmAccountCaption(8, 0) = "‰”»… «·›«∆œ… «·„œÌ‰…"
    frmAccountCaption(8, 1) = "Dr Interest Rate"
    frmAccountCaption(9, 0) = "‰”»… «·›«∆œ… «·œ«∆‰…"
    frmAccountCaption(9, 1) = "Cr Interest Rate"
    frmAccountCaption(10, 0) = "› —… «’œ«— «·ﬂ‘›"
    frmAccountCaption(10, 1) = "Stmt. Frequency"
    frmAccountCaption(11, 0) = "ÌÊ„ «’œ«— «·ﬂ‘›"
    frmAccountCaption(11, 1) = "Statement Day"
    frmAccountCaption(12, 0) = "Õ”«» «·›«∆œÂ „œÌ‰/œ«∆‰"
    frmAccountCaption(12, 1) = "Pay Account No"
    frmAccountCaption(13, 0) = "«·—ﬁ„ «·„„Ì“"
    frmAccountCaption(13, 1) = "Unique No"
    frmAccountCaption(14, 0) = "—„“ «·›—⁄"
    frmAccountCaption(14, 1) = "Branch code"
    frmAccountCaption(15, 0) = "«·„ ›—⁄ «·„„Ì“"
    frmAccountCaption(15, 1) = "Unique Sub"
    frmAccountCaption(16, 0) = " «—ÌŒ › Õ «·Õ”«»"
    frmAccountCaption(16, 1) = "A/c open Date"
    frmAccountCaption(17, 0) = " «—ÌŒ «Œ—  ⁄œÌ·"
    frmAccountCaption(17, 1) = "Last amend Date"
    frmAccountCaption(18, 0) = "„·«ÕŸ«  «·„‘—›"
    frmAccountCaption(18, 1) = "Supervisor comments"
    frmAccountCaption(19, 0) = "«÷«›…"
    frmAccountCaption(19, 1) = "Create"
    frmAccountCaption(20, 0) = "„Ê«›ﬁ"
    frmAccountCaption(20, 1) = "Approve"
    frmAccountCaption(21, 0) = "„—›Ê÷"
    frmAccountCaption(21, 1) = "Reject"
    frmAccountCaption(22, 0) = "Œ—ÊÃ"
    frmAccountCaption(22, 1) = "Cancel"
    frmAccountCaption(23, 0) = "»ÿ«ﬁ… ’—«›"
    frmAccountCaption(23, 1) = "ATM Card"
    frmAccountCaption(24, 0) = "„⁄·Ê„«  «·⁄„Ì·"
    frmAccountCaption(24, 1) = "Customer Info"
    frmAccountCaption(25, 0) = " ›«’Ì· Ê÷⁄ «·Õ”«»"
    frmAccountCaption(25, 1) = "A/C Status History"
    frmAccountCaption(26, 0) = " «—ÌŒ «· —’Ìœ"
    frmAccountCaption(26, 1) = "Int appl day"
    frmAccountCaption(27, 0) = "› —… «· —’Ìœ"
    frmAccountCaption(27, 1) = "Int freq code"
    frmAccountCaption(28, 0) = "«· «„Ì‰"
    frmAccountCaption(28, 1) = "Collateral"
    frmAccountCaption(29, 0) = "„·«ÕŸ«  - 1"
    frmAccountCaption(29, 1) = "Memo note-1"
    frmAccountCaption(30, 0) = "„·«ÕŸ«  - 2"
    frmAccountCaption(30, 1) = "Memo note-2"
    frmAccountCaption(31, 0) = "«Œ— „⁄œ·"
    frmAccountCaption(31, 1) = "Last Amend user"
    frmAccountCaption(32, 0) = "ÂÊÌ… «·„‘—›"
    frmAccountCaption(32, 1) = "Supervisor Id"
    frmAccountCaption(33, 0) = " «—ÌŒ «·ﬂ‘›"
    frmAccountCaption(33, 1) = "Br.Stmt.Day"
    frmAccountCaption(34, 0) = "‰Â«Ì… «·‘Â—"
    frmAccountCaption(34, 1) = "Month End"
    frmAccountCaption(35, 0) = "€Ì— „ Õ—ﬂ"
    frmAccountCaption(35, 1) = "Dormant "
    frmAccountCaption(36, 0) = "«·Õœ «·œ«∆‰"
    frmAccountCaption(36, 1) = "Credit Limit"
    frmAccountCaption(37, 0) = "‰⁄„"
    frmAccountCaption(37, 1) = "Yes"
    frmAccountCaption(38, 0) = "·«"
    frmAccountCaption(38, 1) = "No"
    frmAccountCaption(39, 0) = "«·›«∆œ… «·„Õ ”»Â"
    frmAccountCaption(39, 1) = "Int.Last run"
    frmAccountCaption(40, 0) = "Ê÷⁄ «·Õ”«» Ê”»» «· ⁄œÌ·"
    frmAccountCaption(40, 1) = "A/c Status upd reason"
    frmAccountCaption(41, 0) = "”»» «Œ—"
    frmAccountCaption(41, 1) = "Other reason"
    frmAccountCaption(42, 0) = "Õ«·… ”«„«"
    frmAccountCaption(42, 1) = "SAMA status"
    frmAccountCaption(43, 0) = "«·„›Ê÷ »«· ÊﬁÌ⁄"
    frmAccountCaption(43, 1) = "Signatory"
    frmAccountCaption(44, 0) = "Õ—ﬂ«  Õ«·… ”«„«"
    frmAccountCaption(44, 1) = "SAMA status history"
    frmAccountCaption(45, 0) = "CSD  «—ÌŒ «Œ—  ⁄œÌ· ›Ì"
    frmAccountCaption(45, 1) = "Last Update CSD Date"
    frmAccountCaption(46, 0) = " «—ÌŒ „Ê«›ﬁ… «·„‘—›"
    frmAccountCaption(46, 1) = "Supervisor Approved Date"
    frmAccountCaption(47, 0) = " «—ÌŒ «Œ— Õ—ﬂ…"
    frmAccountCaption(47, 1) = "Last Trans Date"
    frmAccountCaption(48, 0) = "„⁄·Ê„«  ÊœÌ⁄…"
    frmAccountCaption(48, 1) = "Time Deposit info"
    frmAccountCaption(49, 0) = "¬Ì»«‰"
    frmAccountCaption(49, 1) = "IBAN "
    
    frmAccDormantCaption(0, 0) = " ‰‘Ìÿ «·Õ”«» «·€Ì— „ Õ—ﬂ"
    frmAccDormantCaption(0, 1) = "Dormant Account Activation"
    frmAccDormantCaption(1, 0) = "«·⁄„·Â"
    frmAccDormantCaption(1, 1) = "Currency"
    frmAccDormantCaption(2, 0) = "«·«” «–"
    frmAccDormantCaption(2, 1) = "Ledger"
    frmAccDormantCaption(3, 0) = "«”„ «·⁄„Ì·"
    frmAccDormantCaption(3, 1) = "Customer No"
    frmAccDormantCaption(4, 0) = "«·„ ›—⁄"
    frmAccDormantCaption(4, 1) = "Sub Account"
    frmAccDormantCaption(5, 0) = "ÂÊÌ… „” Œœ„ Œœ„… «·⁄„·«¡"
    frmAccDormantCaption(5, 1) = "CSO UserId"
    frmAccDormantCaption(6, 0) = "«· «—ÌŒ Ê «·Êﬁ "
    frmAccDormantCaption(6, 1) = "Date and Time"
    frmAccDormantCaption(7, 0) = "Õ«·… «·Õ”«»"
    frmAccDormantCaption(7, 1) = "Account Status"
    frmAccDormantCaption(8, 0) = "«·Ê÷⁄ «·”«»ﬁ ··Õ”«»"
    frmAccDormantCaption(8, 1) = "Previous A/c status"
    frmAccDormantCaption(9, 0) = "—„“ «·›—⁄"
    frmAccDormantCaption(9, 1) = "Branch code"
    frmAccDormantCaption(10, 0) = "„Ê«›ﬁ"
    frmAccDormantCaption(10, 1) = "Approve"
    frmAccDormantCaption(11, 0) = "„—›Ê÷"
    frmAccDormantCaption(11, 1) = "Reject"
    frmAccDormantCaption(12, 0) = "Œ—ÊÃ"
    frmAccDormantCaption(12, 1) = "Cancel"
        
    frmAccRejectionCaption(0, 0) = "«⁄«œ… «·Õ”«»"
    frmAccRejectionCaption(0, 1) = "Account Rejection"
    frmAccRejectionCaption(1, 0) = "„·«ÕŸ« "
    frmAccRejectionCaption(1, 1) = "Comments"
    frmAccRejectionCaption(2, 0) = "„—›Ê÷"
    frmAccRejectionCaption(2, 1) = "Reject"
    frmAccRejectionCaption(3, 0) = "ÌÕÊ· ·Œœ„«  «·⁄„·«¡"
    frmAccRejectionCaption(3, 1) = "Forward to CSO"
    frmAccRejectionCaption(4, 0) = "Œ—ÊÃ"
    frmAccRejectionCaption(4, 1) = "Cancel"
    
    
    frmAcctPendingListCaption(0, 0) = "ﬁ«∆„… »⁄„·Ì«  «·Õ”«»«  «·„⁄·ﬁ… ··„‘—›"
    frmAcctPendingListCaption(0, 1) = "Account Pending Activities list for Supervisor"
    frmAcctPendingListCaption(1, 0) = "ﬁ«∆„… »⁄„·Ì«  «·Õ”«»«  «·„⁄·ﬁ… ·Œœ„… «·⁄„·«¡"
    frmAcctPendingListCaption(1, 1) = "Account Pending Activities list for CSO"
    frmAcctPendingListCaption(2, 0) = "ÂÊÌ… «·„” Œœ„"
    frmAcctPendingListCaption(2, 1) = "User-Id"
    frmAcctPendingListCaption(3, 0) = "«· «—ÌŒ Ê«·Êﬁ "
    frmAcctPendingListCaption(3, 1) = "Date&Time"
    frmAcctPendingListCaption(4, 0) = "—ﬁ„ «·Õ”«»"
    frmAcctPendingListCaption(4, 1) = "Account Number"
    frmAcctPendingListCaption(5, 0) = "Õ«·… «·Õ”«»"
    frmAcctPendingListCaption(5, 1) = "Account Status"
    frmAcctPendingListCaption(6, 0) = "—„“ «·›—⁄"
    frmAcctPendingListCaption(6, 1) = "Branch code"
    frmAcctPendingListCaption(7, 0) = "«· «·Ì"
    frmAcctPendingListCaption(7, 1) = "More"
    frmAcctPendingListCaption(8, 0) = "ﬁ»Ê· «·ÕﬁÊ· "
    frmAcctPendingListCaption(8, 1) = "Verify Selected Record"
    frmAcctPendingListCaption(9, 0) = "Œ—ÊÃ"
    frmAcctPendingListCaption(9, 1) = "Cancel"
        
    frmChequeBookGridCaption(0, 0) = "„⁄·Ê„«  ÿ·» œ› — «·‘Ìﬂ« "
    frmChequeBookGridCaption(0, 1) = "Cheque Book Request Information"
    frmChequeBookGridCaption(1, 0) = "œ›« — ‘Ìﬂ«  „ÿ·Ê»… ··Õ”«» —ﬁ„ "
    frmChequeBookGridCaption(1, 1) = "Cheque Book requested for account No."
    frmChequeBookGridCaption(2, 0) = "—„“ «·›—⁄ «·„” ·„"
    frmChequeBookGridCaption(2, 1) = "Delivery Branch Code"
    frmChequeBookGridCaption(3, 0) = "ÂÊÌ… «·„” Œœ„"
    frmChequeBookGridCaption(3, 1) = "Request User"
    frmChequeBookGridCaption(4, 0) = "‰Ê⁄ «·‘Ìﬂ"
    frmChequeBookGridCaption(4, 1) = "Cheque Type"
    frmChequeBookGridCaption(5, 0) = "⁄œœ «·‘Ìﬂ«  «·„ÿ·Ê»Â"
    frmChequeBookGridCaption(5, 1) = "# Books requested"
    frmChequeBookGridCaption(6, 0) = " «—ÌŒ «·ÿ·»"
    frmChequeBookGridCaption(6, 1) = "Req. Date"
    frmChequeBookGridCaption(7, 0) = "Õ«·… «·ÿ·»"
    frmChequeBookGridCaption(7, 1) = "Request Status"
    frmChequeBookGridCaption(8, 0) = "„‰ ‘Ìﬂ —ﬁ„"
    frmChequeBookGridCaption(8, 1) = "From Cheque No"
    frmChequeBookGridCaption(9, 0) = "«·Ï ‘Ìﬂ —ﬁ„"
    frmChequeBookGridCaption(9, 1) = "To Cheque No"
    frmChequeBookGridCaption(10, 0) = "ÿ·» œ› — ‘Ìﬂ«  ÃœÌœ"
    frmChequeBookGridCaption(10, 1) = "New cheque book request"
    frmChequeBookGridCaption(11, 0) = " ⁄œÌ· ÿ·» œ› — ‘Ìﬂ« "
    frmChequeBookGridCaption(11, 1) = "Amend cheque book request"
    frmChequeBookGridCaption(12, 0) = "«· «·Ì"
    frmChequeBookGridCaption(12, 1) = "More"
    frmChequeBookGridCaption(13, 0) = " ›«’Ì·"
    frmChequeBookGridCaption(13, 1) = "History"
    frmChequeBookGridCaption(14, 0) = "Œ—ÊÃ"
    frmChequeBookGridCaption(14, 1) = "Exit"
    frmChequeBookGridCaption(15, 0) = "‘Œ’Ì"
    frmChequeBookGridCaption(15, 1) = "Personal"
    frmChequeBookGridCaption(16, 0) = " Ã«—Ì"
    frmChequeBookGridCaption(16, 1) = "Coporate"
    frmChequeBookGridCaption(17, 0) = "„ÿ·Ê» √’·«"
    frmChequeBookGridCaption(17, 1) = "Requested"
    frmChequeBookGridCaption(18, 0) = " ﬁœÌ„"
    frmChequeBookGridCaption(18, 1) = "Produced"
    frmChequeBookGridCaption(19, 0) = "„” ﬁ»·… „‰ «·›—⁄"
    frmChequeBookGridCaption(19, 1) = "Received by branch"
    frmChequeBookGridCaption(20, 0) = "’«œ—Â ··⁄„Ì·"
    frmChequeBookGridCaption(20, 1) = "Issued to customer"
    frmChequeBookGridCaption(21, 0) = "„—›Ê÷"
    frmChequeBookGridCaption(21, 1) = "Rejected"
    frmChequeBookGridCaption(22, 0) = "«·€«¡ ÿ·» œ› — ‘Ìﬂ« "
    frmChequeBookGridCaption(22, 1) = "Delete chequebook request"
    
    frmAcctStatusHistoryCaption(0, 0) = "«· €Ì— ›Ì Õ«·… «·Õ”«»"
    frmAcctStatusHistoryCaption(0, 1) = "Account Status change history details"
    frmAcctStatusHistoryCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmAcctStatusHistoryCaption(1, 1) = "Account Number"
    frmAcctStatusHistoryCaption(2, 0) = "«· €Ì— ›Ì Õ«·… «·Õ”«»"
    frmAcctStatusHistoryCaption(2, 1) = "Account Status change history"
    frmAcctStatusHistoryCaption(3, 0) = " «—ÌŒ"
    frmAcctStatusHistoryCaption(3, 1) = "Date"
    frmAcctStatusHistoryCaption(4, 0) = "«·Êﬁ "
    frmAcctStatusHistoryCaption(4, 1) = "Time"
    frmAcctStatusHistoryCaption(5, 0) = "ÂÊÌ… «·„” Œœ„"
    frmAcctStatusHistoryCaption(5, 1) = "User Id"
    frmAcctStatusHistoryCaption(6, 0) = "ÂÊÌ… «·„‘—›"
    frmAcctStatusHistoryCaption(6, 1) = "Supervisor Id"
    frmAcctStatusHistoryCaption(7, 0) = "„Ê«›ﬁ ⁄·ÌÂ  «—ÌŒ"
    frmAcctStatusHistoryCaption(7, 1) = "Approved Date"
    frmAcctStatusHistoryCaption(8, 0) = "„Ê«›ﬁ ⁄·ÌÂ «·Êﬁ "
    frmAcctStatusHistoryCaption(8, 1) = "Approved Time"
    frmAcctStatusHistoryCaption(9, 0) = "„‰ Õ«·…"
    frmAcctStatusHistoryCaption(9, 1) = "From Status"
    frmAcctStatusHistoryCaption(10, 0) = "«·Ï Õ«·…"
    frmAcctStatusHistoryCaption(10, 1) = "To Status"
    frmAcctStatusHistoryCaption(11, 0) = "«·”»» ›Ì  €ÌÌ— Õ«·… «·Õ”«»"
    frmAcctStatusHistoryCaption(11, 1) = "Reason for Changing the status"
    frmAcctStatusHistoryCaption(12, 0) = "—ÃÊ⁄"
    frmAcctStatusHistoryCaption(12, 1) = "Return"
    frmAcctStatusHistoryCaption(13, 0) = " ›«’Ì·  ⁄œÌ·«  «·Õ”«» ⁄·Ì Õ«·… ”«„«"
    frmAcctStatusHistoryCaption(13, 1) = "SAMA account status history details"
    
    frmBlockedAmtBreakupCaption(0, 0) = " ›«’Ì· «·„»·€ «·„ÕÃÊ“"
    frmBlockedAmtBreakupCaption(0, 1) = "Breakup of blocked balance"
    frmBlockedAmtBreakupCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmBlockedAmtBreakupCaption(1, 1) = "Account Number"
    frmBlockedAmtBreakupCaption(2, 0) = "«·—’Ìœ «·„ÕÃÊ“"
    frmBlockedAmtBreakupCaption(2, 1) = "Blocked Balance"
    frmBlockedAmtBreakupCaption(3, 0) = "‰Ê⁄ «·„‰ Ã"
    frmBlockedAmtBreakupCaption(3, 1) = "Product Type"
    frmBlockedAmtBreakupCaption(4, 0) = "—ﬁ„ «·„‰ Ã"
    frmBlockedAmtBreakupCaption(4, 1) = "Product Number"
    frmBlockedAmtBreakupCaption(5, 0) = "«·„»·€ «·„ÕÃÊ“"
    frmBlockedAmtBreakupCaption(5, 1) = "Blocked Amount"
    frmBlockedAmtBreakupCaption(6, 0) = "ÂÊÌ… «·„” Œœ„"
    frmBlockedAmtBreakupCaption(6, 1) = "User Id "
    frmBlockedAmtBreakupCaption(7, 0) = "—ÃÊ⁄"
    frmBlockedAmtBreakupCaption(7, 1) = "Return"
    frmBlockedAmtBreakupCaption(8, 0) = "ÕÃ“ ÃœÌœ"
    frmBlockedAmtBreakupCaption(8, 1) = "New blocking"
    frmBlockedAmtBreakupCaption(9, 0) = " ⁄œÌ· ÕÃ“"
    frmBlockedAmtBreakupCaption(9, 1) = "Amend blocking"
    frmBlockedAmtBreakupCaption(10, 0) = "≈·€«¡ ÕÃ“"
    frmBlockedAmtBreakupCaption(10, 1) = "Delete blocking"
    frmBlockedAmtBreakupCaption(11, 0) = " ›«’Ì· «·„»·€ «·„ÕÃÊ“(Account)"
    frmBlockedAmtBreakupCaption(11, 1) = "Breakup of blocked balance (Account)"
    frmBlockedAmtBreakupCaption(12, 0) = "»ÿ«ﬁÂ «∆ „«‰ÌÂ"
    frmBlockedAmtBreakupCaption(12, 1) = "Credit card"
    frmBlockedAmtBreakupCaption(13, 0) = "Õ”«»"
    frmBlockedAmtBreakupCaption(13, 1) = "Account"
    
     
    frmChequeBookHistoryCaption(0, 0) = " ›«’Ì· œ› — «·‘Ìﬂ« "
    frmChequeBookHistoryCaption(0, 1) = "Cheque Book History"
    frmChequeBookHistoryCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmChequeBookHistoryCaption(1, 1) = "Account Number"
    frmChequeBookHistoryCaption(2, 0) = "«· «—ÌŒ"
    frmChequeBookHistoryCaption(2, 1) = "Date"
    frmChequeBookHistoryCaption(3, 0) = "«·Êﬁ "
    frmChequeBookHistoryCaption(3, 1) = "Time"
    frmChequeBookHistoryCaption(4, 0) = "Ê÷⁄ «·‘Ìﬂ"
    frmChequeBookHistoryCaption(4, 1) = "Action"
    frmChequeBookHistoryCaption(5, 0) = "ÂÊÌ… «·„” Œœ„"
    frmChequeBookHistoryCaption(5, 1) = "User Id"
    frmChequeBookHistoryCaption(6, 0) = "—ÃÊ⁄"
    frmChequeBookHistoryCaption(6, 1) = "Return"
        
    frmChequeBookRequestCaption(0, 0) = "ÿ·» œ› — ‘Ìﬂ« "
    frmChequeBookRequestCaption(0, 1) = "Cheque Book Request"
    frmChequeBookRequestCaption(1, 0) = "ÿ·» œ› — ‘Ìﬂ« "
    frmChequeBookRequestCaption(1, 1) = "Request for cheque book"
    frmChequeBookRequestCaption(2, 0) = "—ﬁ„ «·Õ”«»"
    frmChequeBookRequestCaption(2, 1) = "Account Number"
    frmChequeBookRequestCaption(3, 0) = "«·«”„"
    frmChequeBookRequestCaption(3, 1) = "Name"
    frmChequeBookRequestCaption(4, 0) = "‰Ê⁄ œ› — «·‘Ìﬂ« "
    frmChequeBookRequestCaption(4, 1) = "Cheque book type"
    frmChequeBookRequestCaption(5, 0) = "‘Œ’Ì "
    frmChequeBookRequestCaption(5, 1) = "Personal"
    frmChequeBookRequestCaption(6, 0) = " Ã«—Ì"
    frmChequeBookRequestCaption(6, 1) = "Corporate"
    frmChequeBookRequestCaption(7, 0) = "⁄œœ œ›« — «·‘Ìﬂ« "
    frmChequeBookRequestCaption(7, 1) = "# of cheque book"
    frmChequeBookRequestCaption(8, 0) = "«’œ«—/ ⁄œÌ·"
    frmChequeBookRequestCaption(8, 1) = "Create/Update"
    frmChequeBookRequestCaption(9, 0) = "Œ—ÊÃ"
    frmChequeBookRequestCaption(9, 1) = "Cancel"
    frmChequeBookRequestCaption(10, 0) = "—ﬁ„ «·›—⁄ «·„” ·„"
    frmChequeBookRequestCaption(10, 1) = "Delivery Branch Code"
    frmChequeBookRequestCaption(11, 0) = "ÿ»«⁄… «·ÿ·»"
    frmChequeBookRequestCaption(11, 1) = "Print Application"
    
    frmChequeBookReportCaption(0, 0) = " ﬁ—Ì— œ›« — «·‘Ìﬂ«  «·ÌÊ„Ì"
    frmChequeBookReportCaption(0, 1) = "Daily Cheque book request report"
    frmChequeBookReportCaption(1, 0) = "«·ÌÊ„"
    frmChequeBookReportCaption(1, 1) = "Today"
    frmChequeBookReportCaption(2, 0) = " «—ÌŒ ¬Œ—"
    frmChequeBookReportCaption(2, 1) = "Other Date"
    frmChequeBookReportCaption(3, 0) = "«œŒ· «· «—ÌŒ"
    frmChequeBookReportCaption(3, 1) = "Enter date"
    frmChequeBookReportCaption(4, 0) = "‰›– «· ﬁ—Ì—"
    frmChequeBookReportCaption(4, 1) = "Generate Report"
    frmChequeBookReportCaption(5, 0) = "Œ—ÊÃ"
    frmChequeBookReportCaption(5, 1) = "Cancel"
    
    frmChqReceiptCaption(0, 0) = "œ›« — «·‘Ìﬂ«  «·„” ·„… „‰ «·›—⁄"
    frmChqReceiptCaption(0, 1) = "Cheque Book Received by branch"
    frmChqReceiptCaption(1, 0) = "œ›« — «·‘Ìﬂ«  «·„—”·… ··⁄„·«¡"
    frmChqReceiptCaption(1, 1) = "Cheque Book issued to customer"
    frmChqReceiptCaption(2, 0) = "—ﬁ„ «·Õ”«»"
    frmChqReceiptCaption(2, 1) = "Account Number"
    frmChqReceiptCaption(3, 0) = "«”„ «·Õ”«»"
    frmChqReceiptCaption(3, 1) = "Account Name"
    frmChqReceiptCaption(4, 0) = "ÂÊÌ… «·„” Œœ„"
    frmChqReceiptCaption(4, 1) = "Request User"
    frmChqReceiptCaption(5, 0) = "‰Ê⁄ «·‘Ìﬂ"
    frmChqReceiptCaption(5, 1) = "Cheque Type"
    frmChqReceiptCaption(6, 0) = " «—ÌŒ «·ÿ·»"
    frmChqReceiptCaption(6, 1) = "Chq.Book req.Date"
    frmChqReceiptCaption(7, 0) = " «—ÌŒ «· ﬁœÌ„"
    frmChqReceiptCaption(7, 1) = "Chq.Book prod.Date"
    frmChqReceiptCaption(8, 0) = "⁄œœ «·‘Ìﬂ«  «·„ÿ·Ê»Â"
    frmChqReceiptCaption(8, 1) = "# Books requested"
    frmChqReceiptCaption(9, 0) = "«· «·Ì"
    frmChqReceiptCaption(9, 1) = "More"
    frmChqReceiptCaption(10, 0) = " ÕœÌ  «·Õ«·Â"
    frmChqReceiptCaption(10, 1) = "Update Status"
    frmChqReceiptCaption(11, 0) = "Œ—ÊÃ"
    frmChqReceiptCaption(11, 1) = "Cancel"
    frmChqReceiptCaption(12, 0) = "«·«’«œ—"
    frmChqReceiptCaption(12, 1) = "Issued"
    frmChqReceiptCaption(13, 0) = "«·„” ·„"
    frmChqReceiptCaption(13, 1) = "Received"
        
    frmInputFormCaption(0, 0) = "‰„Ê–Ã ÿ·» ﬂ‘› Õ”«» „ƒﬁ "
    frmInputFormCaption(0, 1) = "On demand statement input form"
    frmInputFormCaption(1, 0) = "ÿ»«⁄… ﬂ‘› Õ”«» „ƒﬁ "
    frmInputFormCaption(1, 1) = "On demand statement printing"
    frmInputFormCaption(2, 0) = "—ﬁ„ «·Õ”«»"
    frmInputFormCaption(2, 1) = "Account Number"
    frmInputFormCaption(3, 0) = "«”„ «·Õ”«»"
    frmInputFormCaption(3, 1) = "Account Name"
    frmInputFormCaption(4, 0) = "«·⁄„·Â"
    frmInputFormCaption(4, 1) = "Currency"
    frmInputFormCaption(5, 0) = "‰Ê⁄ «·Õ”«»"
    frmInputFormCaption(5, 1) = "Account Type"
    frmInputFormCaption(6, 0) = "„‰  «—ÌŒ"
    frmInputFormCaption(6, 1) = "From Date"
    frmInputFormCaption(7, 0) = "«·Ï  «—ÌŒ"
    frmInputFormCaption(7, 1) = "To Date"
    frmInputFormCaption(8, 0) = "ÿ»«⁄… ﬂ‘›"
    frmInputFormCaption(8, 1) = "Print Statement"
    frmInputFormCaption(9, 0) = "Œ—ÊÃ"
    frmInputFormCaption(9, 1) = "Exit"
     
    frmPensionDetailCaption(0, 0) = "‰„Ê–Ã «” ›”«— „ ﬁ«⁄œ"
    frmPensionDetailCaption(0, 1) = "Pension Enquiry Form"
    frmPensionDetailCaption(1, 0) = " ›«’Ì· „ ﬁ«⁄œ"
    frmPensionDetailCaption(1, 1) = "Pension Details"
    frmPensionDetailCaption(2, 0) = "—ﬁ„ »ÿ«ﬁ… «· ﬁ«⁄œ"
    frmPensionDetailCaption(2, 1) = "Pen Card No"
    frmPensionDetailCaption(3, 0) = "«·«”„"
    frmPensionDetailCaption(3, 1) = "Name"
    frmPensionDetailCaption(4, 0) = "—ﬁ„ Õ”«» «·„ ﬁ«⁄œ"
    frmPensionDetailCaption(4, 1) = "Pen Acc No"
    frmPensionDetailCaption(5, 0) = "—ﬁ„ Õ›ÌŸ… «·„ ﬁ«⁄œ"
    frmPensionDetailCaption(5, 1) = "Pen Hafiza No"
    frmPensionDetailCaption(6, 0) = "„ﬂ«‰ «’œ«— «·Õ›ÌŸ…"
    frmPensionDetailCaption(6, 1) = "Haf.Issue Source"
    frmPensionDetailCaption(7, 0) = "„ﬂ«‰ «·«’œ«—"
    frmPensionDetailCaption(7, 1) = "Issuance Source"
    frmPensionDetailCaption(8, 0) = "—ﬁ„ »ÿ«ﬁ… «·«ÕÊ«·"
    frmPensionDetailCaption(8, 1) = "Saudi Id No"
    frmPensionDetailCaption(9, 0) = "«”„ «·ÊﬂÌ·"
    frmPensionDetailCaption(9, 1) = "Proxy Name"
    frmPensionDetailCaption(10, 0) = "—ﬁ„ Õ›ÌŸ… «·ÊﬂÌ·"
    frmPensionDetailCaption(10, 1) = "Proxy Hafiza No"
    frmPensionDetailCaption(11, 0) = "„ﬂ«‰ «’œ«— Õ›ÌŸ… «·ÊﬂÌ·"
    frmPensionDetailCaption(11, 1) = "Proxy Haf Iss.Src"
    frmPensionDetailCaption(12, 0) = "„»·€ —« » «·„ ﬁ«⁄œ"
    frmPensionDetailCaption(12, 1) = "Pension Salary Amt"
    frmPensionDetailCaption(13, 0) = "«·Õ”„Ì« "
    frmPensionDetailCaption(13, 1) = "Deduction"
    frmPensionDetailCaption(14, 0) = "«·„»·€ «·’«›Ì"
    frmPensionDetailCaption(14, 1) = "Net Amount"
    frmPensionDetailCaption(15, 0) = "—ﬁ„ «·›—⁄"
    frmPensionDetailCaption(15, 1) = "Branch Code"
    frmPensionDetailCaption(16, 0) = "—ﬁ„ «·’«œ—"
    frmPensionDetailCaption(16, 1) = "ıExport Number"
    frmPensionDetailCaption(17, 0) = " «—ÌŒ «·«’œ«—"
    frmPensionDetailCaption(17, 1) = "Issue date"
    frmPensionDetailCaption(18, 0) = "Ã«Â“Ì… «·»ÿ«ﬁ… «·‰ﬁœÌÂ"
    frmPensionDetailCaption(18, 1) = "Card Position"
    frmPensionDetailCaption(19, 0) = "⁄œœ «·Ê—À…"
    frmPensionDetailCaption(19, 1) = "Card Inheritance"
    frmPensionDetailCaption(20, 0) = "‰Ê⁄ «·»ÿ«ﬁ…"
    frmPensionDetailCaption(20, 1) = "Card Type"
    frmPensionDetailCaption(21, 0) = "Õ«·… «·»ÿ«ﬁ…"
    frmPensionDetailCaption(21, 1) = "Card Status"
    frmPensionDetailCaption(22, 0) = "ﬂÌ›Ì… «·œ›⁄"
    frmPensionDetailCaption(22, 1) = "Payment Type"
    frmPensionDetailCaption(23, 0) = "„·«ÕŸ«  - 1"
    frmPensionDetailCaption(23, 1) = "Notes-1"
    frmPensionDetailCaption(24, 0) = "„·«ÕŸ«  - 2"
    frmPensionDetailCaption(24, 1) = "Notes-2"
    frmPensionDetailCaption(25, 0) = "„·«ÕŸ«  - 3"
    frmPensionDetailCaption(25, 1) = "Notes-3"
    frmPensionDetailCaption(26, 0) = "„·«ÕŸ«  - 4"
    frmPensionDetailCaption(26, 1) = "Notes-4"
    frmPensionDetailCaption(27, 0) = "„·«ÕŸ«  - 5"
    frmPensionDetailCaption(27, 1) = "Notes-5"
    frmPensionDetailCaption(28, 0) = "„·«ÕŸ«  - 6"
    frmPensionDetailCaption(28, 1) = "Notes-6"
    frmPensionDetailCaption(29, 0) = "„·«ÕŸ«  - 7"
    frmPensionDetailCaption(29, 1) = "Notes-7"
    frmPensionDetailCaption(30, 0) = "„·«ÕŸ«  - 8"
    frmPensionDetailCaption(30, 1) = "Notes-8"
    frmPensionDetailCaption(31, 0) = "„·«ÕŸ«  - 9"
    frmPensionDetailCaption(31, 1) = "Notes-9"
    frmPensionDetailCaption(32, 0) = "„·«ÕŸ«  - 10"
    frmPensionDetailCaption(32, 1) = "Notes-10"
    frmPensionDetailCaption(33, 0) = "„·«ÕŸ«  - 11"
    frmPensionDetailCaption(33, 1) = "Notes-11"
    frmPensionDetailCaption(34, 0) = "„·«ÕŸ«  - 12"
    frmPensionDetailCaption(34, 1) = "Notes-12"
    frmPensionDetailCaption(35, 0) = "„·«ÕŸ«  - 13"
    frmPensionDetailCaption(35, 1) = "Notes-13"
    frmPensionDetailCaption(36, 0) = "„·«ÕŸ«  - 14"
    frmPensionDetailCaption(36, 1) = "Notes-14"
    frmPensionDetailCaption(37, 0) = "„·«ÕŸ«  - 15"
    frmPensionDetailCaption(37, 1) = "Notes-15"
    frmPensionDetailCaption(38, 0) = "Œ—ÊÃ"
    frmPensionDetailCaption(38, 1) = "Exit"
    frmPensionDetailCaption(39, 0) = "»ÿ«ﬁÂ „ ›—⁄Â"
    frmPensionDetailCaption(39, 1) = "Sub card"
    frmPensionDetailCaption(40, 0) = "«·Ê—ÀÂ"
    frmPensionDetailCaption(40, 1) = "Inheritance"
    frmPensionDetailCaption(41, 0) = "«” ›”«— œ›⁄ ‰ﬁœ«"
    frmPensionDetailCaption(41, 1) = "Cash payment enquiry"

    
    frmPensionEnquiryCaption(0, 0) = "‰„Ê–Ã «” ›”«— ÊﬂÌ·"
    frmPensionEnquiryCaption(0, 1) = "Pension Enquiry Form"
    frmPensionEnquiryCaption(1, 0) = "«” ›”«— „ ﬁ«⁄œ"
    frmPensionEnquiryCaption(1, 1) = "Pension Enquiry Search"
    frmPensionEnquiryCaption(2, 0) = "—ﬁ„ »ÿ«ﬁ… «· ﬁ«⁄œ"
    frmPensionEnquiryCaption(2, 1) = "Card Number"
    frmPensionEnquiryCaption(3, 0) = "—ﬁ„ Õ”«» «·„ ﬁ«⁄œ"
    frmPensionEnquiryCaption(3, 1) = "Pen Acct No"
    frmPensionEnquiryCaption(4, 0) = "—ﬁ„ «·Õ›ÌŸ…"
    frmPensionEnquiryCaption(4, 1) = "Hafiza Number"
    frmPensionEnquiryCaption(5, 0) = "—ﬁ„ »ÿ«ﬁ… «·«ÕÊ«·"
    frmPensionEnquiryCaption(5, 1) = "Saudi Id No"
    frmPensionEnquiryCaption(6, 0) = "»ÕÀ"
    frmPensionEnquiryCaption(6, 1) = "General Enquiry"
    frmPensionEnquiryCaption(7, 0) = "Œ—ÊÃ"
    frmPensionEnquiryCaption(7, 1) = "Exit"
    frmPensionEnquiryCaption(8, 0) = "«” ›”«— œ›⁄ ‰ﬁœ«"
    frmPensionEnquiryCaption(8, 1) = "Cash payment enquiry"
    
    frmPenCashPaymentCaption(0, 0) = "‰„Ê–Ã —« » „ ﬁ«⁄œ ‰ﬁœ«"
    frmPenCashPaymentCaption(0, 1) = "Cash payment form for pensioners"
    frmPenCashPaymentCaption(1, 0) = "«” ›”«— ⁄‰ —« » «·„ ﬁ«⁄œ «·‰ﬁœÌ"
    frmPenCashPaymentCaption(1, 1) = "Pension cash payment enquiry"
    frmPenCashPaymentCaption(2, 0) = " ›«’Ì· «·„ ﬁ«⁄œ"
    frmPenCashPaymentCaption(2, 1) = "pensioner Details"
    frmPenCashPaymentCaption(3, 0) = "—ﬁ„ «·»ÿ«ﬁ…«·”—Ì"
    frmPenCashPaymentCaption(3, 1) = "Pen card no"
    frmPenCashPaymentCaption(4, 0) = "«·«”„"
    frmPenCashPaymentCaption(4, 1) = "Name"
    frmPenCashPaymentCaption(5, 0) = "„ ﬁ«⁄œ/ÊﬂÌ·"
    frmPenCashPaymentCaption(5, 1) = "Pensioner/proxy"
    frmPenCashPaymentCaption(6, 0) = " ›«’Ì· «·œ›⁄"
    frmPenCashPaymentCaption(6, 1) = "Payment details"
    frmPenCashPaymentCaption(7, 0) = "«·„»·€ «·«Ã„«·Ì"
    frmPenCashPaymentCaption(7, 1) = "Total Amt"
    frmPenCashPaymentCaption(8, 0) = "«·Õ”„Ì« "
    frmPenCashPaymentCaption(8, 1) = "Deduction"
    frmPenCashPaymentCaption(9, 0) = "«·„»·€ «·’«›Ì"
    frmPenCashPaymentCaption(9, 1) = "Net Amount"
    frmPenCashPaymentCaption(10, 0) = "Õ«·… «·œ›⁄"
    frmPenCashPaymentCaption(10, 1) = "Payment status"
    frmPenCashPaymentCaption(11, 0) = "„⁄·Ê„«  Â«„Â"
    frmPenCashPaymentCaption(11, 1) = "Messages"
    frmPenCashPaymentCaption(12, 0) = "„⁄·Ê„«  Â«„Â-1"
    frmPenCashPaymentCaption(12, 1) = "Message-1"
    frmPenCashPaymentCaption(13, 0) = "„⁄·Ê„«  Â«„Â-2"
    frmPenCashPaymentCaption(13, 1) = "Message-2"
    frmPenCashPaymentCaption(14, 0) = "„⁄·Ê„«  Â«„Â-3"
    frmPenCashPaymentCaption(14, 1) = "Message-3"
    frmPenCashPaymentCaption(15, 0) = "„⁄·Ê„«  Â«„Â-4"
    frmPenCashPaymentCaption(15, 1) = "Message-4"
    frmPenCashPaymentCaption(16, 0) = "«·Œ—ÊÕ «·Ï ﬁ«∆„… «· ﬁ«⁄œ"
    frmPenCashPaymentCaption(16, 1) = "Return to pension Menu"
    
    frmPensionGridCaption(0, 0) = "„⁄·Ê„«  «·„ ﬁ«⁄œ"
    frmPensionGridCaption(0, 1) = "Pension Information"
    frmPensionGridCaption(1, 0) = "—ﬁ„ »ÿ«ﬁ… «· ﬁ«⁄œ"
    frmPensionGridCaption(1, 1) = "Pen Card No"
    frmPensionGridCaption(2, 0) = "«”„ »ÿ«ﬁ… «·„ ﬁ«⁄œ"
    frmPensionGridCaption(2, 1) = "Pen Card Name"
    frmPensionGridCaption(3, 0) = "—ﬁ„ »ÿ«ﬁ… «ÕÊ«· «·„ ﬁ«⁄œ"
    frmPensionGridCaption(3, 1) = "Pen Id No"
    frmPensionGridCaption(4, 0) = "—ﬁ„ Õ›ÌŸ… «·„ ﬁ«⁄œ"
    frmPensionGridCaption(4, 1) = "Pen Hafiza No"
    frmPensionGridCaption(5, 0) = "„»·€ —« » «·„ ﬁ«⁄œ"
    frmPensionGridCaption(5, 1) = "Pen Salary Amt"
    frmPensionGridCaption(6, 0) = "«·„»·€ «·’«›Ì"
    frmPensionGridCaption(6, 1) = "Net Amount"
    frmPensionGridCaption(7, 0) = "ﬂÌ›Ì… «·œ›⁄"
    frmPensionGridCaption(7, 1) = "Payment Type"
    frmPensionGridCaption(8, 0) = "«· «·Ì"
    frmPensionGridCaption(8, 1) = "More"
    frmPensionGridCaption(9, 0) = "‰⁄„"
    frmPensionGridCaption(9, 1) = "Ok"
    frmPensionGridCaption(10, 0) = "Œ—ÊÃ"
    frmPensionGridCaption(10, 1) = "Exit"
    
    frmStdOrdDetailCaption(0, 0) = " ›«’Ì· «·«„— «·À«» "
    frmStdOrdDetailCaption(0, 1) = "Standing Order Detail"
    frmStdOrdDetailCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmStdOrdDetailCaption(1, 1) = "Account No"
    frmStdOrdDetailCaption(2, 0) = "—ﬁ„ «·«„— «·À«» "
    frmStdOrdDetailCaption(2, 1) = "S/o Number"
    frmStdOrdDetailCaption(3, 0) = "‰Ê⁄ «·«„—«·À«» "
    frmStdOrdDetailCaption(3, 1) = "S/O Type"
    frmStdOrdDetailCaption(4, 0) = "ﬂÌ›Ì… «·œ›⁄"
    frmStdOrdDetailCaption(4, 1) = "Pay Type"
    frmStdOrdDetailCaption(5, 0) = "ÿ—Ìﬁ… «·œ›⁄"
    frmStdOrdDetailCaption(5, 1) = "Pay Mode"
    frmStdOrdDetailCaption(6, 0) = "› —… «·œ›⁄"
    frmStdOrdDetailCaption(6, 1) = "Pay Freq"
    frmStdOrdDetailCaption(7, 0) = " «—ÌŒ «Ê· œ›⁄…"
    frmStdOrdDetailCaption(7, 1) = "First Pay Date"
    frmStdOrdDetailCaption(8, 0) = " «—ÌŒ «·œ›⁄…«· «·Ì…"
    frmStdOrdDetailCaption(8, 1) = "Next Pay Date"
    frmStdOrdDetailCaption(9, 0) = " «—ÌŒ «Œ— œ›⁄…"
    frmStdOrdDetailCaption(9, 1) = "Final Pay Date"
    frmStdOrdDetailCaption(10, 0) = " «—ÌŒ «Œ— √„—"
    frmStdOrdDetailCaption(10, 1) = "Last Process Dt"
    frmStdOrdDetailCaption(11, 0) = "⁄œœ«·œ›⁄«  «·„ﬁ——Â"
    frmStdOrdDetailCaption(11, 1) = "No of payments to make"
    frmStdOrdDetailCaption(12, 0) = "⁄œœ «·œ›⁄«  «·„œ›Ê⁄…"
    frmStdOrdDetailCaption(12, 1) = "No of payments made"
    frmStdOrdDetailCaption(13, 0) = "—„“ «·Õœ"
    frmStdOrdDetailCaption(13, 1) = "Limit Flag"
    frmStdOrdDetailCaption(14, 0) = "—„“ «·⁄„Ê·…"
    frmStdOrdDetailCaption(14, 1) = "Commission Flag"
    frmStdOrdDetailCaption(15, 0) = "—„“ «·ÌÊ„ «· «·Ì"
    frmStdOrdDetailCaption(15, 1) = "Next Day Flag"
    frmStdOrdDetailCaption(16, 0) = "«·„»·€ «·„” À‰Ï"
    frmStdOrdDetailCaption(16, 1) = "Threshold"
    frmStdOrdDetailCaption(17, 0) = "„»·€ «·œ›⁄…"
    frmStdOrdDetailCaption(17, 1) = "Payment Amount"
    frmStdOrdDetailCaption(18, 0) = "„Ã„Ê⁄ «·œ›⁄«  · «—ÌŒÂ"
    frmStdOrdDetailCaption(18, 1) = "Amt paid to date"
    frmStdOrdDetailCaption(19, 0) = "„Ã„Ê⁄ «·œ›⁄«  «·„ﬁ——Â"
    frmStdOrdDetailCaption(19, 1) = "Total Amt to pay"
    frmStdOrdDetailCaption(20, 0) = "Õ”‹‹‹‹‹‹«» «·„”‹‹‹‹‹ ›Ì‹œ"
    frmStdOrdDetailCaption(20, 1) = "Payee Account"
    frmStdOrdDetailCaption(21, 0) = "‘—Õ „œÌ‰ -1"
    frmStdOrdDetailCaption(21, 1) = "Dr Narrative-1"
    frmStdOrdDetailCaption(22, 0) = "‘—Õ œ«∆‰ - 1"
    frmStdOrdDetailCaption(22, 1) = "Cr Narrative-1"
    frmStdOrdDetailCaption(23, 0) = "—„“  «—ÌŒ «·œ›⁄…"
    frmStdOrdDetailCaption(23, 1) = "Trans Date Flag"
    frmStdOrdDetailCaption(24, 0) = "—„“ «·›—⁄"
    frmStdOrdDetailCaption(24, 1) = "Branch code"
    frmStdOrdDetailCaption(25, 0) = "„·«ÕŸ«  «·„‘—›"
    frmStdOrdDetailCaption(25, 1) = "Supervisor comments"
    frmStdOrdDetailCaption(26, 0) = "„—›Ê÷"
    frmStdOrdDetailCaption(26, 1) = "Reject"
    frmStdOrdDetailCaption(27, 0) = "„Ê«›ﬁ"
    frmStdOrdDetailCaption(27, 1) = "Approve"
    frmStdOrdDetailCaption(28, 0) = "«‰‘«¡/ ⁄œÌ·"
    frmStdOrdDetailCaption(28, 1) = "Create/Update"
    frmStdOrdDetailCaption(29, 0) = "Œ—ÊÃ"
    frmStdOrdDetailCaption(29, 1) = "Cancel"
    frmStdOrdDetailCaption(30, 0) = "¬Œ— „” Œœ„ „⁄œ·"
    frmStdOrdDetailCaption(30, 1) = "Last Update User"
    frmStdOrdDetailCaption(31, 0) = " «—ÌŒ «· ⁄œÌ·"
    frmStdOrdDetailCaption(31, 1) = "Update Date"
    frmStdOrdDetailCaption(32, 0) = "≈”‹‹‹‹‹‹‹‹‹‹„ «·„”‹‹‹‹‹ ›Ì‹œ"
    frmStdOrdDetailCaption(32, 1) = "Payee Name"
    frmStdOrdDetailCaption(33, 0) = "⁄„· ‰›” «·ÌÊ„"
    frmStdOrdDetailCaption(33, 1) = "Process Same Day"
    frmStdOrdDetailCaption(34, 0) = "⁄„· «·ÌÊ„ «· «·Ì"
    frmStdOrdDetailCaption(34, 1) = "Process Next Day"
    frmStdOrdDetailCaption(35, 0) = "«”„ «·⁄„Ì·"
    frmStdOrdDetailCaption(35, 1) = "Name"
    frmStdOrdDetailCaption(36, 0) = "«Ìﬁ«› «·«„— «·À«» "
    frmStdOrdDetailCaption(36, 1) = "Stop SO"
    frmStdOrdDetailCaption(37, 0) = "„·«ÕŸ« "
    frmStdOrdDetailCaption(37, 1) = "Remarks"
    frmStdOrdDetailCaption(38, 0) = "—ﬁ„ ›—⁄ «·⁄„Ì·"
    frmStdOrdDetailCaption(38, 1) = "Cust.Branch Code"
            
    frmStdOrdGridCaption(0, 0) = "„⁄·Ê„«  «·«„— «·À«» "
    frmStdOrdGridCaption(0, 1) = "Standing Order Information"
    frmStdOrdGridCaption(1, 0) = "«·«„— «·À«»  ··Õ”«» —ﬁ„:"
    frmStdOrdGridCaption(1, 1) = "Standing Order for the account number :"
    frmStdOrdGridCaption(2, 0) = "—ﬁ„ «·«„— «·À«» "
    frmStdOrdGridCaption(2, 1) = "S/O Number"
    frmStdOrdGridCaption(3, 0) = "‰Ê⁄ «·œ›⁄…"
    frmStdOrdGridCaption(3, 1) = "Payment Type"
    frmStdOrdGridCaption(4, 0) = "„»·€ «·œ›⁄…"
    frmStdOrdGridCaption(4, 1) = "Payment Amount"
    frmStdOrdGridCaption(5, 0) = "«·Õ”«» «·„ﬁ«»·"
    frmStdOrdGridCaption(5, 1) = "Pay Acc No"
    frmStdOrdGridCaption(6, 0) = "‰Ê⁄ «·«„— «·À«» "
    frmStdOrdGridCaption(6, 1) = "Order Type"
    frmStdOrdGridCaption(7, 0) = "› —… «·œ›⁄"
    frmStdOrdGridCaption(7, 1) = "Payment Freq"
    frmStdOrdGridCaption(8, 0) = "—ﬁ„ «·›—⁄"
    frmStdOrdGridCaption(8, 1) = "Branch Code"
    frmStdOrdGridCaption(9, 0) = "«„— À«»  ÃœÌœ"
    frmStdOrdGridCaption(9, 1) = "New Standing order"
    frmStdOrdGridCaption(10, 0) = "«Ìﬁ«› «„— À«» "
    frmStdOrdGridCaption(10, 1) = "Stop Standing Order"
    frmStdOrdGridCaption(11, 0) = "«” ›”«—« "
    frmStdOrdGridCaption(11, 1) = "Enquiry"
    frmStdOrdGridCaption(12, 0) = "«· «·Ì"
    frmStdOrdGridCaption(12, 1) = "More"
    frmStdOrdGridCaption(13, 0) = "Œ—ÊÃ"
    frmStdOrdGridCaption(13, 1) = "Exit"
        
    frmStdOrdPendingListCaption(0, 0) = "«·«Ê«„— «·À«» … «·„⁄·ﬁ… ··„‘—›"
    frmStdOrdPendingListCaption(0, 1) = "Standing Order Pending List for Supervisor"
    frmStdOrdPendingListCaption(1, 0) = "«·«Ê«„— «·À«» … «·„⁄·ﬁ… ·„”∆Ê· Œœ„… «·⁄„·«¡"
    frmStdOrdPendingListCaption(1, 1) = "Standing Order Pending List for CSO"
    frmStdOrdPendingListCaption(2, 0) = "ÂÊÌ… «·„” Œœ„"
    frmStdOrdPendingListCaption(2, 1) = "User Id"
    frmStdOrdPendingListCaption(3, 0) = "«· «—ÌŒ Ê «·Êﬁ "
    frmStdOrdPendingListCaption(3, 1) = "Date&Time"
    frmStdOrdPendingListCaption(4, 0) = "—ﬁ„ «·Õ”«»"
    frmStdOrdPendingListCaption(4, 1) = "Account Number"
    frmStdOrdPendingListCaption(5, 0) = "—ﬁ„ «·«„— «·À«» "
    frmStdOrdPendingListCaption(5, 1) = "Sod Number"
    frmStdOrdPendingListCaption(6, 0) = "‰Ê⁄ «·œ›⁄"
    frmStdOrdPendingListCaption(6, 1) = "Payment Type"
    frmStdOrdPendingListCaption(7, 0) = "«· «·Ì"
    frmStdOrdPendingListCaption(7, 1) = "More"
    frmStdOrdPendingListCaption(8, 0) = " «ﬂÌœ «·ÕﬁÊ·"
    frmStdOrdPendingListCaption(8, 1) = "Verify Selected Record"
    frmStdOrdPendingListCaption(9, 0) = "Œ—ÊÃ"
    frmStdOrdPendingListCaption(9, 1) = "Cancel"
        
    frmStdOrdRejectionCaption(0, 0) = "«⁄«œ… «„— À«» "
    frmStdOrdRejectionCaption(0, 1) = "Standing Order Rejection"
    frmStdOrdRejectionCaption(1, 0) = "„·«ÕŸ« "
    frmStdOrdRejectionCaption(1, 1) = "Comments"
    frmStdOrdRejectionCaption(2, 0) = "„—›Ê÷"
    frmStdOrdRejectionCaption(2, 1) = "Reject"
    frmStdOrdRejectionCaption(3, 0) = "„ÕÊ· «·Ï „”∆Ê· Œœ„… «·⁄„·«¡"
    frmStdOrdRejectionCaption(3, 1) = "Forward to CSO"
    frmStdOrdRejectionCaption(4, 0) = "Œ—ÊÃ"
    frmStdOrdRejectionCaption(4, 1) = "Cancel"
    
    frmStopChqGridCaption(0, 0) = "„⁄·Ê„«  «·‘Ìﬂ«  «·„ÊﬁÊ›…"
    frmStopChqGridCaption(0, 1) = "Stop Cheque Grid"
    frmStopChqGridCaption(1, 0) = "„⁄·Ê„«  «·‘Ìﬂ«  «·„ÊﬁÊ›… ··Õ”«» —ﬁ„:"
    frmStopChqGridCaption(1, 1) = "Stop Cheque Info for the account #"
    frmStopChqGridCaption(2, 0) = "—ﬁ„ «·‘Ìﬂ"
    frmStopChqGridCaption(2, 1) = "Cheque Number"
    frmStopChqGridCaption(3, 0) = "«·„»·€"
    frmStopChqGridCaption(3, 1) = "Amount"
    frmStopChqGridCaption(4, 0) = " «—ÌŒ «·«Ìﬁ«›"
    frmStopChqGridCaption(4, 1) = "Date Stopped"
    frmStopChqGridCaption(5, 0) = "”»» «·«⁄«œÂ"
    frmStopChqGridCaption(5, 1) = "Details"
    frmStopChqGridCaption(6, 0) = "«Ìﬁ«› ‘Ìﬂ ÃœÌœ"
    frmStopChqGridCaption(6, 1) = "New Stop Cheque"
    frmStopChqGridCaption(7, 0) = "«·€«¡ «Ìﬁ«› ‘Ìﬂ"
    frmStopChqGridCaption(7, 1) = "Cancel Stop Cheque"
    frmStopChqGridCaption(8, 0) = "«” ›”«—« "
    frmStopChqGridCaption(8, 1) = "Enquiry"
    frmStopChqGridCaption(9, 0) = "«· «·Ì"
    frmStopChqGridCaption(9, 1) = "More"
    frmStopChqGridCaption(10, 0) = "Œ—ÊÃ"
    frmStopChqGridCaption(10, 1) = "Exit"
    frmStopChqGridCaption(11, 0) = "„⁄·Ê„«  «·‘Ìﬂ«  «·„ ·›…"
    frmStopChqGridCaption(11, 1) = "Destroy Cheque Grid"
    frmStopChqGridCaption(12, 0) = "„⁄·Ê„«  «·‘Ìﬂ «·„ ·›"
    frmStopChqGridCaption(12, 1) = "Destroy Cheque Info"
    frmStopChqGridCaption(13, 0) = "« ·«› ‘Ìﬂ ÃœÌœ"
    frmStopChqGridCaption(13, 1) = "New destroy cheque"
    frmStopChqGridCaption(14, 0) = "«·€«¡ ‘Ìﬂ  «·›"
    frmStopChqGridCaption(14, 1) = "Cancel destroy cheque"
    frmStopChqGridCaption(15, 0) = "From cheque number"
    frmStopChqGridCaption(15, 1) = "From cheque number"
    
    
    frmStopChqDetailCaption(0, 0) = " ›«’Ì· ‘Ìﬂ „ÊﬁÊ›"
    frmStopChqDetailCaption(0, 1) = "Stop Cheque Details"
    frmStopChqDetailCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmStopChqDetailCaption(1, 1) = "Account Number"
    frmStopChqDetailCaption(2, 0) = "«·Ï ‘Ìﬂ —ﬁ„"
    frmStopChqDetailCaption(2, 1) = "To Cheque No"
    frmStopChqDetailCaption(3, 0) = "„»·€ «·‘Ìﬂ"
    frmStopChqDetailCaption(3, 1) = "Cheque Amount"
    frmStopChqDetailCaption(4, 0) = "„‰ ‘Ìﬂ"
    frmStopChqDetailCaption(4, 1) = "From Cheque"
    frmStopChqDetailCaption(5, 0) = " «—ÌŒ «·«Ìﬁ«›"
    frmStopChqDetailCaption(5, 1) = "Stop Date"
    frmStopChqDetailCaption(6, 0) = "”»» «·«Ìﬁ«›"
    frmStopChqDetailCaption(6, 1) = "Reason"
    frmStopChqDetailCaption(7, 0) = "„·«ÕŸ«  «·„‘—›"
    frmStopChqDetailCaption(7, 1) = "Supervisor Comments"
    frmStopChqDetailCaption(8, 0) = "„—›Ê÷"
    frmStopChqDetailCaption(8, 1) = "Reject"
    frmStopChqDetailCaption(9, 0) = "„ﬁ»Ê·"
    frmStopChqDetailCaption(9, 1) = "Approve"
    frmStopChqDetailCaption(10, 0) = "«‰‘«¡"
    frmStopChqDetailCaption(10, 1) = "Create"
    frmStopChqDetailCaption(11, 0) = "Œ—ÊÃ"
    frmStopChqDetailCaption(11, 1) = "Cancel"
    frmStopChqDetailCaption(12, 0) = "«·„” Œœ„ „Êﬁ› «·‘Ìﬂ"
    frmStopChqDetailCaption(12, 1) = "User stopped the cheque"
    frmStopChqDetailCaption(13, 0) = " ›«’Ì· «·‘Ìﬂ «· «·›"
    frmStopChqDetailCaption(13, 1) = "Destroy Cheque Details"
    
    
    frmStopChqPendingListCaption(0, 0) = "‘Ìﬂ«  „ÊﬁÊ›… „⁄·ﬁ… ··„‘—›"
    frmStopChqPendingListCaption(0, 1) = "Stop Cheque Pending List for Supervisor"
    frmStopChqPendingListCaption(1, 0) = "‘Ìﬂ«  „ÊﬁÊ›… „⁄·ﬁ… ·„”∆Ê· Œœ„… «·⁄„·«¡"
    frmStopChqPendingListCaption(1, 1) = "Stop Cheque Pending List for CSO"
    frmStopChqPendingListCaption(2, 0) = "ÂÊÌ… «·„” Œœ„"
    frmStopChqPendingListCaption(2, 1) = "User Id"
    frmStopChqPendingListCaption(3, 0) = "«· «—ÌŒ Ê «·Êﬁ "
    frmStopChqPendingListCaption(3, 1) = "Date&Time"
    frmStopChqPendingListCaption(4, 0) = "—ﬁ„ «·Õ”«»"
    frmStopChqPendingListCaption(4, 1) = "Account Number"
    frmStopChqPendingListCaption(5, 0) = "—ﬁ„ «·‘Ìﬂ"
    frmStopChqPendingListCaption(5, 1) = "Cheque Number"
    frmStopChqPendingListCaption(6, 0) = "”»» «·«Ìﬁ«›"
    frmStopChqPendingListCaption(6, 1) = "Reason"
    frmStopChqPendingListCaption(7, 0) = "‰Ê⁄ «· ⁄·Ìﬁ"
    frmStopChqPendingListCaption(7, 1) = "Pending Type"
    frmStopChqPendingListCaption(8, 0) = "«· «·Ì"
    frmStopChqPendingListCaption(8, 1) = "More"
    frmStopChqPendingListCaption(9, 0) = "ﬁ»Ê· «·Õﬁ·"
    frmStopChqPendingListCaption(9, 1) = "Verify Selected Record"
    frmStopChqPendingListCaption(10, 0) = "Œ—ÊÃ"
    frmStopChqPendingListCaption(10, 1) = "Cancel"
    
    frmStopChqRejectionCaption(0, 0) = "«⁄«œ… «·‘Ìﬂ«  «·„ÊﬁÊ›…"
    frmStopChqRejectionCaption(0, 1) = "Stop Cheque Rejection"
    frmStopChqRejectionCaption(1, 0) = "„·«ÕŸ« "
    frmStopChqRejectionCaption(1, 1) = "Comments"
    frmStopChqRejectionCaption(2, 0) = "„—›Ê÷"
    frmStopChqRejectionCaption(2, 1) = "Reject"
    frmStopChqRejectionCaption(3, 0) = "ÌÕÊ· «·Ï „”∆Ê· Œœ„… «·⁄„·«¡"
    frmStopChqRejectionCaption(3, 1) = "Forward to CSO"
    frmStopChqRejectionCaption(4, 0) = "Œ—ÊÃ"
    frmStopChqRejectionCaption(4, 1) = "Cancel"
    
    frmTransactionCaption(0, 0) = "«” ›”«— ⁄‰ Õ—ﬂ…"
    frmTransactionCaption(0, 1) = "Transaction Enquiry"
    frmTransactionCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmTransactionCaption(1, 1) = "Account No"
    frmTransactionCaption(2, 0) = "«·«”„"
    frmTransactionCaption(2, 1) = "Customer Name"
    frmTransactionCaption(3, 0) = "—ﬁ„ «·Õ—ﬂ…"
    frmTransactionCaption(3, 1) = "No. of Trans"
    frmTransactionCaption(4, 0) = "„‰ Õ—ﬂ… —ﬁ„"
    frmTransactionCaption(4, 1) = "Start Txn number"
    frmTransactionCaption(5, 0) = "„‰  «—ÌŒ"
    frmTransactionCaption(5, 1) = "Start Date"
    frmTransactionCaption(6, 0) = "ÂÊÌ… «· ·—"
    frmTransactionCaption(6, 1) = "Tlr Id"
    frmTransactionCaption(7, 0) = " «—ÌŒ «·«œŒ«·"
    frmTransactionCaption(7, 1) = "Post Date"
    frmTransactionCaption(8, 0) = " «—ÌŒ «·Õﬁ"
    frmTransactionCaption(8, 1) = "Value Date"
    frmTransactionCaption(9, 0) = "‘—Õ "
    frmTransactionCaption(9, 1) = "Narrative-1"
    frmTransactionCaption(10, 0) = "«·„»·€ «·„œÌ‰"
    frmTransactionCaption(10, 1) = "Debit Amt"
    frmTransactionCaption(11, 0) = "«·„»·€ «·œ«∆‰"
    frmTransactionCaption(11, 1) = "Credit Amt"
    frmTransactionCaption(12, 0) = "«·—’Ìœ"
    frmTransactionCaption(12, 1) = "Balance"
    frmTransactionCaption(13, 0) = "ÂÊÌ… «·„‘—›"
    frmTransactionCaption(13, 1) = "Supervisor Id"
    frmTransactionCaption(14, 0) = "⁄œ«œ «·Õ—ﬂ« "
    frmTransactionCaption(14, 1) = "Transaction counter"
    frmTransactionCaption(15, 0) = "—„“ ﬂ‘› «·Õ”«»"
    frmTransactionCaption(15, 1) = "Statement Flag"
    frmTransactionCaption(16, 0) = "‘—Õ - 2"
    frmTransactionCaption(16, 1) = "Narrative-2"
    frmTransactionCaption(17, 0) = "‘—Õ - 3"
    frmTransactionCaption(17, 1) = "Narrative-3"
    frmTransactionCaption(18, 0) = "‰›–"
    frmTransactionCaption(18, 1) = "Go"
    frmTransactionCaption(19, 0) = "«· «·Ì"
    frmTransactionCaption(19, 1) = "More"
    frmTransactionCaption(20, 0) = "«·«Ê·"
    frmTransactionCaption(20, 1) = "First"
    frmTransactionCaption(21, 0) = "«·”«»ﬁ"
    frmTransactionCaption(21, 1) = "Previous"
    frmTransactionCaption(22, 0) = "«· «·Ì"
    frmTransactionCaption(22, 1) = "Next"
    frmTransactionCaption(23, 0) = "⁄ÊœÂ «·Ï ﬁ«∆„… «·Õ”«»"
    frmTransactionCaption(23, 1) = "Return to Account Menu"
    
    frmPensionInheritanceCaption(0, 0) = "Ê—À… «·„ ﬁ«⁄œÌ‰"
    frmPensionInheritanceCaption(0, 1) = "Pension Inheritance"
    frmPensionInheritanceCaption(1, 0) = " ›«’Ì· Ê—À… «·„ ﬁ«⁄œ"
    frmPensionInheritanceCaption(1, 1) = "Pension Inheritance Details"
    frmPensionInheritanceCaption(2, 0) = "⁄œœ «·Ê—ÀÂ"
    frmPensionInheritanceCaption(2, 1) = "No. of inh"
    frmPensionInheritanceCaption(3, 0) = "—ﬁ„ «·›—⁄"
    frmPensionInheritanceCaption(3, 1) = "Branch code"
    frmPensionInheritanceCaption(4, 0) = "—« » «·„ ﬁ«⁄œ"
    frmPensionInheritanceCaption(4, 1) = "Pension salary"
    frmPensionInheritanceCaption(5, 0) = "«·«”„ "
    frmPensionInheritanceCaption(5, 1) = "Name "
    frmPensionInheritanceCaption(6, 0) = "Œ—ÊÃ"
    frmPensionInheritanceCaption(6, 1) = "Exit"
    frmPensionInheritanceCaption(7, 0) = "’·… «·ﬁ—«»Â"
    frmPensionInheritanceCaption(7, 1) = "Relation"
    frmPensionInheritanceCaption(8, 0) = " «—ÌŒ «·„Ì·«œ"
    frmPensionInheritanceCaption(8, 1) = "Date of Birth"
    frmPensionInheritanceCaption(9, 0) = "—« » «· ﬁ«⁄œ"
    frmPensionInheritanceCaption(9, 1) = "Pension Amount"
    frmPensionInheritanceCaption(10, 0) = "«·«”„ "
    frmPensionInheritanceCaption(10, 1) = "Name "
    
    
    frmHistStmtCaption(0, 0) = "ÿ»«⁄… ﬂ‘› ”«»ﬁ ··Õ”«»"
    frmHistStmtCaption(0, 1) = "Historical Statement Printing"
    frmHistStmtCaption(1, 0) = "—„“ «·›—⁄"
    frmHistStmtCaption(1, 1) = "Branch Code"
    frmHistStmtCaption(2, 0) = "—ﬁ„ «·Õ”«»"
    frmHistStmtCaption(2, 1) = "Account Number"
    frmHistStmtCaption(3, 0) = "«·⁄„·Â"
    frmHistStmtCaption(3, 1) = "Currency"
    frmHistStmtCaption(4, 0) = "‰Ê⁄ «·Õ”«»"
    frmHistStmtCaption(4, 1) = "Account Type"
    frmHistStmtCaption(5, 0) = "„‰  «—ÌŒ"
    frmHistStmtCaption(5, 1) = "From Date"
    frmHistStmtCaption(6, 0) = "«·Ï  «—ÌŒ"
    frmHistStmtCaption(6, 1) = "To Date"
    frmHistStmtCaption(7, 0) = "ﬂ·„… «·”—"
    frmHistStmtCaption(7, 1) = "Password"
    frmHistStmtCaption(8, 0) = "‰⁄„"
    frmHistStmtCaption(8, 1) = "Ok"
    frmHistStmtCaption(9, 0) = "ÿ»«⁄… ﬂ‘› Õ”«»"
    frmHistStmtCaption(9, 1) = "Print Statement"
    frmHistStmtCaption(10, 0) = " ‰›Ì– ﬂ‘› Õ”«»"
    frmHistStmtCaption(10, 1) = "Generate Stmt"
    frmHistStmtCaption(11, 0) = " Õ·Ì·"
    frmHistStmtCaption(11, 1) = "Analysis"
    frmHistStmtCaption(12, 0) = "ÿ»«⁄…  Õ·Ì·"
    frmHistStmtCaption(12, 1) = "Print Analysis"
    frmHistStmtCaption(13, 0) = "„‘«Âœ…  Õ·Ì·"
    frmHistStmtCaption(13, 1) = "View Analysis"
    frmHistStmtCaption(14, 0) = "„‘«Âœ… ﬂ‘› Õ”«»"
    frmHistStmtCaption(14, 1) = "View Statement"
    frmHistStmtCaption(15, 0) = "ÿ»«⁄… ﬂ‘› „‰ «·«œ«—…"
    frmHistStmtCaption(15, 1) = "Print HO Stmt"
    frmHistStmtCaption(16, 0) = "„‘«Âœ… ﬂ‘› „‰ «·«œ«—…"
    frmHistStmtCaption(16, 1) = "View HO Stmt"
    frmHistStmtCaption(17, 0) = " ‰›Ì– ﬂ‘›  Õ·Ì·Ì «·«œ«—…"
    frmHistStmtCaption(17, 1) = "Analyse HO Stmt"
    frmHistStmtCaption(18, 0) = "„‘«Âœ… «·ﬂ‘› «· Õ·Ì·Ì"
    frmHistStmtCaption(18, 1) = "View HO Analysis"
    frmHistStmtCaption(19, 0) = "Œ—ÊÃ"
    frmHistStmtCaption(19, 1) = "Exit"
    frmHistStmtCaption(20, 0) = "≈—”«· „·›"
    frmHistStmtCaption(20, 1) = "FTP"
    
    frmMerchantStmtCaption(0, 0) = "‰„Ê–Ã ﬂ‘› Õ”«» «·»«∆⁄"
    frmMerchantStmtCaption(0, 1) = "Merchant Statement input form"
    frmMerchantStmtCaption(1, 0) = "ÿ»«⁄… ﬂ‘› Õ”«» «·»«∆⁄"
    frmMerchantStmtCaption(1, 1) = "Merchant statement printing"
    frmMerchantStmtCaption(2, 0) = "—ﬁ„ «·»«∆⁄"
    frmMerchantStmtCaption(2, 1) = "Merchant number"
    frmMerchantStmtCaption(3, 0) = "„‰  «—ÌŒ"
    frmMerchantStmtCaption(3, 1) = "From Date"
    frmMerchantStmtCaption(4, 0) = "«·Ï  «—ÌŒ"
    frmMerchantStmtCaption(4, 1) = "To Date"
    frmMerchantStmtCaption(5, 0) = "‰Ê⁄ ﬂ‘› «·Õ”«»"
    frmMerchantStmtCaption(5, 1) = "Statement Type"
    frmMerchantStmtCaption(6, 0) = "ﬂ‘›  ›’Ì·Ì"
    frmMerchantStmtCaption(6, 1) = "Itemwise"
    frmMerchantStmtCaption(7, 0) = "ﬂ‘› ›—Ê⁄"
    frmMerchantStmtCaption(7, 1) = "Groupwise"
    frmMerchantStmtCaption(8, 0) = "„Ã„Ê⁄…"
    frmMerchantStmtCaption(8, 1) = "Chain"
    frmMerchantStmtCaption(9, 0) = "›—⁄Ì"
    frmMerchantStmtCaption(9, 1) = "Outlet"
    frmMerchantStmtCaption(10, 0) = " ‰›Ì– ﬂ‘› Õ”«»"
    frmMerchantStmtCaption(10, 1) = "Generate stmt"
    frmMerchantStmtCaption(11, 0) = "„‘«Âœ… ﬂ‘› Õ”«»"
    frmMerchantStmtCaption(11, 1) = "View statement"
    frmMerchantStmtCaption(12, 0) = "ÿ»«⁄… ﬂ‘› Õ”«»"
    frmMerchantStmtCaption(12, 1) = "Print statement"
    frmMerchantStmtCaption(13, 0) = "Œ—ÊÃ"
    frmMerchantStmtCaption(13, 1) = "Exit"
    
   frmCustUpdateHistoryCaption(0, 0) = " ⁄œÌ· «· «—ÌŒ ··⁄„Ì·"
   frmCustUpdateHistoryCaption(0, 1) = "Customer Update History"
   frmCustUpdateHistoryCaption(1, 0) = "—ﬁ„ «·⁄„Ì·"
   frmCustUpdateHistoryCaption(1, 1) = "Customer No."
   frmCustUpdateHistoryCaption(2, 0) = "«”„ «·⁄„Ì·"
   frmCustUpdateHistoryCaption(2, 1) = "Customer Name"
   frmCustUpdateHistoryCaption(3, 0) = "—„“ ›—⁄ «·⁄„Ì·"
   frmCustUpdateHistoryCaption(3, 1) = "Cust.Br.Code"
   frmCustUpdateHistoryCaption(4, 0) = "—„“ «·›—⁄"
   frmCustUpdateHistoryCaption(4, 1) = "Branch code"
   frmCustUpdateHistoryCaption(5, 0) = "ÂÊÌ… «·„” Œœ„"
   frmCustUpdateHistoryCaption(5, 1) = "User id"
   frmCustUpdateHistoryCaption(6, 0) = "«· «—ÌŒ Ê«·Êﬁ "
   frmCustUpdateHistoryCaption(6, 1) = "Date Time"
   frmCustUpdateHistoryCaption(7, 0) = "Õ«·… «·„⁄·ﬁ"
   frmCustUpdateHistoryCaption(7, 1) = "Pending status"
   frmCustUpdateHistoryCaption(8, 0) = "«·„‘—›"
   frmCustUpdateHistoryCaption(8, 1) = "Supervisor id"
   frmCustUpdateHistoryCaption(9, 0) = " «—ÌŒ ÊÊﬁ  «·„Ê«›ﬁÂ"
   frmCustUpdateHistoryCaption(9, 1) = "Approved Date Time"
   frmCustUpdateHistoryCaption(10, 0) = " ’‰Ì› —∆Ì”Ï"
   frmCustUpdateHistoryCaption(10, 1) = "Main Category"
   frmCustUpdateHistoryCaption(11, 0) = " ’‰Ì› ›—⁄Ì"
   frmCustUpdateHistoryCaption(11, 1) = "Sub Category"
   frmCustUpdateHistoryCaption(12, 0) = "«· «·Ì"
   frmCustUpdateHistoryCaption(12, 1) = "More"
   frmCustUpdateHistoryCaption(13, 0) = "«· ›«’Ì·"
   frmCustUpdateHistoryCaption(13, 1) = "View details"
   frmCustUpdateHistoryCaption(14, 0) = "Œ—ÊÃ"
   frmCustUpdateHistoryCaption(14, 1) = "Exit"
   frmCustUpdateHistoryCaption(15, 0) = " «—ÌŒ «Œ Ì«— «·—ﬁ„ «·”—Ì ··Â« › "
   frmCustUpdateHistoryCaption(15, 1) = "Telephone pin select History"
   
   frmAcctUpdateHistoryCaption(0, 0) = " ⁄œÌ· «· «—ÌŒ ··⁄„Ì·"
   frmAcctUpdateHistoryCaption(0, 1) = "Account Update History"
   frmAcctUpdateHistoryCaption(1, 0) = "—ﬁ„ «·⁄„Ì·"
   frmAcctUpdateHistoryCaption(1, 1) = "Account No."
   frmAcctUpdateHistoryCaption(2, 0) = "«”„ «·⁄„Ì·"
   frmAcctUpdateHistoryCaption(2, 1) = "Customer Name"
   frmAcctUpdateHistoryCaption(3, 0) = "—„“ «·›—⁄"
   frmAcctUpdateHistoryCaption(3, 1) = "Branch code"
   frmAcctUpdateHistoryCaption(4, 0) = "ÂÊÌ… «·„” Œœ„"
   frmAcctUpdateHistoryCaption(4, 1) = "User id"
   frmAcctUpdateHistoryCaption(5, 0) = "«· «—ÌŒ Ê«·Êﬁ "
   frmAcctUpdateHistoryCaption(5, 1) = "Date Time"
   frmAcctUpdateHistoryCaption(6, 0) = "Õ«·… «·„⁄·ﬁ"
   frmAcctUpdateHistoryCaption(6, 1) = "Pending status"
   frmAcctUpdateHistoryCaption(7, 0) = "ÂÊÌ… «·„‘—›"
   frmAcctUpdateHistoryCaption(7, 1) = "Supervisor id"
   frmAcctUpdateHistoryCaption(8, 0) = " «—ÌŒ ÊÊﬁ  «·„Ê«›ﬁÂ"
   frmAcctUpdateHistoryCaption(8, 1) = "Approved Date Time"
   frmAcctUpdateHistoryCaption(9, 0) = "«· «·Ì"
   frmAcctUpdateHistoryCaption(9, 1) = "More"
   frmAcctUpdateHistoryCaption(10, 0) = "«· ›«’Ì·"
   frmAcctUpdateHistoryCaption(10, 1) = "View details"
   frmAcctUpdateHistoryCaption(11, 0) = "Œ—ÊÃ"
   frmAcctUpdateHistoryCaption(11, 1) = "Exit"
  
   frmAcceptTpinCaption(0, 0) = "«Œ Ì«— «·—ﬁ„ «·”—Ì ··Â« ›"
   frmAcceptTpinCaption(0, 1) = "Telephone pin selection"
   frmAcceptTpinCaption(1, 0) = "—ﬁ„ «·⁄„Ì·"
   frmAcceptTpinCaption(1, 1) = "Customer number"
   frmAcceptTpinCaption(2, 0) = "≈”„ «·⁄„Ì·"
   frmAcceptTpinCaption(2, 1) = "Customer name"
   frmAcceptTpinCaption(3, 0) = "«Œ Ì«— «·—ﬁ„ «·”—Ì"
   frmAcceptTpinCaption(3, 1) = "TPin Selected"
   frmAcceptTpinCaption(4, 0) = "‰⁄„"
   frmAcceptTpinCaption(4, 1) = "Yes"
   frmAcceptTpinCaption(5, 0) = "·«"
   frmAcceptTpinCaption(5, 1) = "No"
   frmAcceptTpinCaption(6, 0) = "Õ«·… «·—ﬁ„ «·”—Ì"
   frmAcceptTpinCaption(6, 1) = "TPin status"
   frmAcceptTpinCaption(7, 0) = "‰‘ÿ"
   frmAcceptTpinCaption(7, 1) = "Active"
   frmAcceptTpinCaption(8, 0) = "€Ì— ‰‘ÿ"
   frmAcceptTpinCaption(8, 1) = "Inactive"
   frmAcceptTpinCaption(9, 0) = "«œŒ· «·—ﬁ„ «·”—Ì"
   frmAcceptTpinCaption(9, 1) = "Tpin no"
   frmAcceptTpinCaption(10, 0) = "«⁄œ «œŒ«· «·—ﬁ„ «·”—Ì"
   frmAcceptTpinCaption(10, 1) = "Retype Tpin no"
   frmAcceptTpinCaption(11, 0) = "≈‰‘«¡"
   frmAcceptTpinCaption(11, 1) = "Create"
   frmAcceptTpinCaption(12, 0) = "„ﬁ»Ê·"
   frmAcceptTpinCaption(12, 1) = "Approve"
   frmAcceptTpinCaption(13, 0) = "„—›Ê÷"
   frmAcceptTpinCaption(13, 1) = "Reject"
   frmAcceptTpinCaption(14, 0) = "Œ—ÊÃ"
   frmAcceptTpinCaption(14, 1) = "Exit"
   
   frmTpinRejectionCaption(0, 0) = "—›÷ «·—ﬁ„ «·”—Ì"
   frmTpinRejectionCaption(0, 1) = "T-Pin Rejection"
   frmTpinRejectionCaption(1, 0) = "„·«ÕŸ« "
   frmTpinRejectionCaption(1, 1) = "Comments"
   frmTpinRejectionCaption(2, 0) = "„—›Ê÷"
   frmTpinRejectionCaption(2, 1) = "Reject"
   frmTpinRejectionCaption(3, 0) = "Œ—ÊÃ"
   frmTpinRejectionCaption(3, 1) = "Cancel"
   
   frmTpinPendingListCaption(0, 0) = "«·«—ﬁ«„ «·”—Ì… «·„⁄·ﬁ… ··Â« ›"
   frmTpinPendingListCaption(0, 1) = "Telephone Pin pending list"
   frmTpinPendingListCaption(1, 0) = "—„“ «·„” Œœ„"
   frmTpinPendingListCaption(1, 1) = "Userid"
   frmTpinPendingListCaption(2, 0) = "«· «—ÌŒ Ê«·Êﬁ "
   frmTpinPendingListCaption(2, 1) = "Date&Time"
   frmTpinPendingListCaption(3, 0) = "—ﬁ„ «·⁄„Ì·"
   frmTpinPendingListCaption(3, 1) = "Customer number"
   frmTpinPendingListCaption(4, 0) = "›—⁄ «·⁄„Ì·"
   frmTpinPendingListCaption(4, 1) = "Customer Branch"
   frmTpinPendingListCaption(5, 0) = "«”„ «·⁄„Ì·"
   frmTpinPendingListCaption(5, 1) = "Customer name"
   frmTpinPendingListCaption(6, 0) = "«· «·Ì"
   frmTpinPendingListCaption(6, 1) = "More"
   frmTpinPendingListCaption(7, 0) = " √ﬂÌœ ﬁ»Ê· «·Õﬁ·"
   frmTpinPendingListCaption(7, 1) = "Verify selected list"
   frmTpinPendingListCaption(8, 0) = "Œ—ÊÃ"
   frmTpinPendingListCaption(8, 1) = "Cancel"
   
   openUpdateDetailsCaption(0, 0) = " ›«’Ì· › Õ «· ⁄œÌ·"
   openUpdateDetailsCaption(0, 1) = "Open Update Details"
   openUpdateDetailsCaption(1, 0) = " ›«’Ì· «·› Õ"
   openUpdateDetailsCaption(1, 1) = "Opening Details"
   openUpdateDetailsCaption(2, 0) = " «—ÌŒ «·› Õ"
   openUpdateDetailsCaption(2, 1) = "Opening Date"
   openUpdateDetailsCaption(3, 0) = "›—⁄"
   openUpdateDetailsCaption(3, 1) = "Branch"
   openUpdateDetailsCaption(4, 0) = "ÂÊÌ… «·„‰›–"
   openUpdateDetailsCaption(4, 1) = "Maker ID"
   openUpdateDetailsCaption(5, 0) = "ÂÊÌ… «·„‘—›"
   openUpdateDetailsCaption(5, 1) = "Supervisor ID"
   openUpdateDetailsCaption(6, 0) = " ›«’Ì· «· ⁄œÌ·"
   openUpdateDetailsCaption(6, 1) = "Update Details"
   openUpdateDetailsCaption(7, 0) = " «—ÌŒ «Œ—  ⁄œÌ·"
   openUpdateDetailsCaption(7, 1) = "Last Update Date"
   
   frmIdleTimePasswordCaption(0, 0) = "«‰ Â«¡«·Êﬁ  «·„Õœœ ·ﬂ·„… «·”— «⁄œ «œŒ«· ﬂ·„… «·”— "
   frmIdleTimePasswordCaption(0, 1) = "Idle Time Expired ; Please enter your password to proceed"
   frmIdleTimePasswordCaption(1, 0) = "«‰ Â«¡«·Êﬁ  «·„Õœœ ·ﬂ·„… «·”— «⁄œ «œŒ«· ﬂ·„… «·”— "
   frmIdleTimePasswordCaption(1, 1) = "Idle Time Expired ; Please enter your password"
   frmIdleTimePasswordCaption(2, 0) = "ÂÊÌ… «·„” Œœ„"
   frmIdleTimePasswordCaption(2, 1) = "User Id"
   frmIdleTimePasswordCaption(3, 0) = "ﬂ·„… «·”—"
   frmIdleTimePasswordCaption(3, 1) = "Password"
   frmIdleTimePasswordCaption(4, 0) = "‰⁄„"
   frmIdleTimePasswordCaption(4, 1) = "Ok"
   frmIdleTimePasswordCaption(5, 0) = "Œ—ÊÃ"
   frmIdleTimePasswordCaption(5, 1) = "Exit"
   
    frmTransferEnquiryCaption(0, 0) = "«” ›”«—«  ⁄‰ ÕÊ«·…"
    frmTransferEnquiryCaption(0, 1) = "Transfer Enquiry"
    frmTransferEnquiryCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmTransferEnquiryCaption(1, 1) = "Account number"
    frmTransferEnquiryCaption(2, 0) = " «—ÌŒ «·»œ«Ì…"
    frmTransferEnquiryCaption(2, 1) = "Start Date"
    frmTransferEnquiryCaption(3, 0) = " «—ÌŒ «·‰Â«Ì…"
    frmTransferEnquiryCaption(3, 1) = "End Date"
    frmTransferEnquiryCaption(4, 0) = "BP —ﬁ„ «·„—Ã⁄ ·"
    frmTransferEnquiryCaption(4, 1) = "BP Reference No."
    frmTransferEnquiryCaption(5, 0) = "Õ«·… «·Õ—ﬂ…"
    frmTransferEnquiryCaption(5, 1) = "Record Status"
    frmTransferEnquiryCaption(6, 0) = "‰›–"
    frmTransferEnquiryCaption(6, 1) = "Go"
    frmTransferEnquiryCaption(7, 0) = " ÕœÌÀ"
    frmTransferEnquiryCaption(7, 1) = "Refresh"
    frmTransferEnquiryCaption(8, 0) = "BM Õ—ﬂ…"
    frmTransferEnquiryCaption(8, 1) = "BM Trxn"
    frmTransferEnquiryCaption(9, 0) = "„⁄·Ê„«  «·ÕÊ«·…"
    frmTransferEnquiryCaption(9, 1) = "Transfer Info"
    frmTransferEnquiryCaption(10, 0) = "ÿ»«⁄…"
    frmTransferEnquiryCaption(10, 1) = "Print"
    frmTransferEnquiryCaption(11, 0) = "«·”«»ﬁ"
    frmTransferEnquiryCaption(11, 1) = "Previous"
    frmTransferEnquiryCaption(12, 0) = "«· «·Ì"
    frmTransferEnquiryCaption(12, 1) = "Next"
    frmTransferEnquiryCaption(13, 0) = "Œ—ÊÃ"
    frmTransferEnquiryCaption(13, 1) = "Exit"
    frmTransferEnquiryCaption(14, 0) = "«·„Ã„Ê⁄"
    frmTransferEnquiryCaption(14, 1) = "Total"
    frmTransferEnquiryCaption(15, 0) = "—ﬁ„ „—Ã⁄ «·Õ—ﬂ…"
    frmTransferEnquiryCaption(15, 1) = "Trans. Ref"
    frmTransferEnquiryCaption(16, 0) = " «—ÌŒ «·«’œ«—"
    frmTransferEnquiryCaption(16, 1) = "Issue Date"
    frmTransferEnquiryCaption(17, 0) = " «—ÌŒ «·Õﬁ "
    frmTransferEnquiryCaption(17, 1) = "Value Date"
    frmTransferEnquiryCaption(18, 0) = "«·Õ”«» «·„œÌ‰"
    frmTransferEnquiryCaption(18, 1) = "Debit A/c #"
    frmTransferEnquiryCaption(19, 0) = "⁄„·… «·ÕÊ«·…,«·„»·€"
    frmTransferEnquiryCaption(19, 1) = "Trans.Currency & Amount"
    frmTransferEnquiryCaption(20, 0) = "⁄„·… «·œ›Ê⁄ ,«·„»·€"
    frmTransferEnquiryCaption(20, 1) = "Payment Currency & Amount"
    frmTransferEnquiryCaption(21, 0) = "Õ«·… «·Õ—ﬂ…"
    frmTransferEnquiryCaption(21, 1) = "Record Status"
    
    frmTransferDetailCaption(0, 0) = " ›«’Ì· «·ÕÊ«·…"
    frmTransferDetailCaption(0, 1) = "Transfer Details"
    frmTransferDetailCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmTransferDetailCaption(1, 1) = "Account number"
    frmTransferDetailCaption(2, 0) = "√”„ «·⁄„Ì·"
    frmTransferDetailCaption(2, 1) = "Customer Name"
    frmTransferDetailCaption(3, 0) = "—ﬁ„ «·„—Ã⁄"
    frmTransferDetailCaption(3, 1) = "Reference No."
    frmTransferDetailCaption(4, 0) = "—ﬁ„ «·Õ”«» «·„œÌ‰"
    frmTransferDetailCaption(4, 1) = "Dr A/c Number"
    frmTransferDetailCaption(5, 0) = " «—ÌŒ «·«’œ«—"
    frmTransferDetailCaption(5, 1) = "Issue Date"
    frmTransferDetailCaption(6, 0) = " «—ÌŒ «·Õﬁ"
    frmTransferDetailCaption(6, 1) = "Value Date"
    frmTransferDetailCaption(7, 0) = "⁄„·… «·ÕÊ«·…"
    frmTransferDetailCaption(7, 1) = "Trans.Currency"
    frmTransferDetailCaption(8, 0) = "„»«€ «·ÕÊ«·…"
    frmTransferDetailCaption(8, 1) = "Trans.Amount"
    frmTransferDetailCaption(9, 0) = "⁄„·… «·œ›⁄"
    frmTransferDetailCaption(9, 1) = "Payment Currency"
    frmTransferDetailCaption(10, 0) = "«·„»«€ «·„œ›Ê⁄"
    frmTransferDetailCaption(10, 1) = "Payment Amount"
    frmTransferDetailCaption(11, 0) = "«”„ «·„ÕÊ·"
    frmTransferDetailCaption(11, 1) = "Applicant Name"
    frmTransferDetailCaption(12, 0) = "√”„ «·„” ›Ìœ"
    frmTransferDetailCaption(12, 1) = "Beneficiary Name"
    frmTransferDetailCaption(13, 0) = "⁄‰Ê«‰ «·„” ›Ìœ 1"
    frmTransferDetailCaption(13, 1) = "Beneficiary Addr-1"
    frmTransferDetailCaption(14, 0) = "⁄‰Ê«‰ «·„” ›Ìœ 2"
    frmTransferDetailCaption(14, 1) = "Beneficiary Addr-2"
    frmTransferDetailCaption(15, 0) = "‰Ê⁄ «·ÕÊ«·…"
    frmTransferDetailCaption(15, 1) = "Transfer Type"
    frmTransferDetailCaption(16, 0) = "Õ«·… «·ÕÊ«·…"
    frmTransferDetailCaption(16, 1) = "Payment Status"
    frmTransferDetailCaption(17, 0) = "—ﬁ„ «·›—⁄"
    frmTransferDetailCaption(17, 1) = "Branch Code"
    frmTransferDetailCaption(18, 0) = "‰Ê⁄ «·ÕÊ«·…"
    frmTransferDetailCaption(18, 1) = "Transaction Type"
    frmTransferDetailCaption(19, 0) = "—”«·… 1"
    frmTransferDetailCaption(19, 1) = "Message 1"
    frmTransferDetailCaption(20, 0) = "—”«·… 2"
    frmTransferDetailCaption(20, 1) = "Message 2"
    frmTransferDetailCaption(21, 0) = "—”«·… 3"
    frmTransferDetailCaption(21, 1) = "Message 3"
    frmTransferDetailCaption(22, 0) = "—”«·… 4"
    frmTransferDetailCaption(22, 1) = "Message 4"
    frmTransferDetailCaption(23, 0) = "Œ—ÊÃ"
    frmTransferDetailCaption(23, 1) = "Exit"
    frmTransferDetailCaption(24, 0) = "«·»‰ﬂ «·„” ›Ìœ"
    frmTransferDetailCaption(24, 1) = "Beneficiary Bank"
    frmTransferDetailCaption(25, 0) = "«·»‰ﬂ «·„—”·"
    frmTransferDetailCaption(25, 1) = "Correspondent Bank"
    
    frmBmTransEnqCaption(0, 0) = "BM √” ›”«— Õ—ﬂ… ·"
    frmBmTransEnqCaption(0, 1) = "BM Transaction Enquiry"
    frmBmTransEnqCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmBmTransEnqCaption(1, 1) = "Account number"
    frmBmTransEnqCaption(2, 0) = " «—ÌŒ «·»œ«Ì…"
    frmBmTransEnqCaption(2, 1) = "Start Date"
    frmBmTransEnqCaption(3, 0) = " «—ÌŒ «·‰Â«Ì…"
    frmBmTransEnqCaption(3, 1) = "End Date"
    frmBmTransEnqCaption(4, 0) = "‰Ê⁄ «·ÕÊ«·…"
    frmBmTransEnqCaption(4, 1) = "Trans Type"
    frmBmTransEnqCaption(5, 0) = "‰›–"
    frmBmTransEnqCaption(5, 1) = "Go"
    frmBmTransEnqCaption(6, 0) = " ÕœÌÀ"
    frmBmTransEnqCaption(6, 1) = "Refresh"
    frmBmTransEnqCaption(7, 0) = " ›«’Ì·"
    frmBmTransEnqCaption(7, 1) = "Detail"
    frmBmTransEnqCaption(8, 0) = "ÿ»«⁄…"
    frmBmTransEnqCaption(8, 1) = "Print"
    frmBmTransEnqCaption(9, 0) = "«·”«»ﬁ"
    frmBmTransEnqCaption(9, 1) = "Previous"
    frmBmTransEnqCaption(10, 0) = "«· «·Ì"
    frmBmTransEnqCaption(10, 1) = "Next"
    frmBmTransEnqCaption(11, 0) = "Œ—ÊÃ"
    frmBmTransEnqCaption(11, 1) = "Exit"
    frmBmTransEnqCaption(12, 0) = "«·„Ã„Ê⁄"
    frmBmTransEnqCaption(12, 1) = "Total"
    frmBmTransEnqCaption(13, 0) = "—ﬁ„ „—Ã⁄ «·ÕÊ«·…"
    frmBmTransEnqCaption(13, 1) = "Trans.Ref"
    frmBmTransEnqCaption(14, 0) = "ÂÊÌ… «·„” Œœ„"
    frmBmTransEnqCaption(14, 1) = "User Id"
    frmBmTransEnqCaption(15, 0) = " «—ÌŒ «·ÕÊ«·…"
    frmBmTransEnqCaption(15, 1) = "Transaction Date"
    frmBmTransEnqCaption(16, 0) = "„»·€ «·ÕÊ«·…"
    frmBmTransEnqCaption(16, 1) = "Trans.Amount"
    frmBmTransEnqCaption(17, 0) = "—ﬁ„ «·Õ—ﬂ…"
    frmBmTransEnqCaption(17, 1) = "Trans.Counter"
    frmBmTransEnqCaption(18, 0) = "‰Ê⁄ «·Õ—ﬂ…"
    frmBmTransEnqCaption(18, 1) = "Trans.Type"
    
    frmBmTransDetailCaption(0, 0) = "BM  ›«’Ì· Õ—ﬂ… ›Ì "
    frmBmTransDetailCaption(0, 1) = "Bankmaster Transaction Detail"
    frmBmTransDetailCaption(1, 0) = "—ﬁ„ «·Õ”«»"
    frmBmTransDetailCaption(1, 1) = "Account number"
    frmBmTransDetailCaption(2, 0) = "«”„ «·⁄„Ì·"
    frmBmTransDetailCaption(2, 1) = "Customer Name"
    frmBmTransDetailCaption(3, 0) = "—ﬁ„ «·„—Ã⁄ ··ÕÊ«·…"
    frmBmTransDetailCaption(3, 1) = "Reference No."
    frmBmTransDetailCaption(4, 0) = " «—ÌŒ «·ÕÊ«·…"
    frmBmTransDetailCaption(4, 1) = "Trans.Date"
    frmBmTransDetailCaption(5, 0) = " «—ÌŒ «·Õﬁ"
    frmBmTransDetailCaption(5, 1) = "Value Date"
    frmBmTransDetailCaption(6, 0) = "„»«€ «·ÕÊ«·…"
    frmBmTransDetailCaption(6, 1) = "Trans.Amount"
    frmBmTransDetailCaption(7, 0) = "‰Ê⁄ «·ÕÊ«·…"
    frmBmTransDetailCaption(7, 1) = "Transaction Type"
    frmBmTransDetailCaption(8, 0) = "ÂÊÌ… «·„” Œœ„"
    frmBmTransDetailCaption(8, 1) = "User Id"
    frmBmTransDetailCaption(9, 0) = "ÂÊÌ… «·„‘—›"
    frmBmTransDetailCaption(9, 1) = "Supervisor Id"
    frmBmTransDetailCaption(10, 0) = "—„“ ﬂ‘› «·Õ”«»"
    frmBmTransDetailCaption(10, 1) = "Statement Flag"
    frmBmTransDetailCaption(11, 0) = "«·‘—Õ 1"
    frmBmTransDetailCaption(11, 1) = "Narrative 1"
    frmBmTransDetailCaption(12, 0) = "«·‘—Õ 2"
    frmBmTransDetailCaption(12, 1) = "Narrative 2"
    frmBmTransDetailCaption(13, 0) = "«·‘—Õ 3"
    frmBmTransDetailCaption(13, 1) = "Narrative 3"
    frmBmTransDetailCaption(14, 0) = "Œ—ÊÃ"
    frmBmTransDetailCaption(14, 1) = "Exit"
    
    frmBlockPendingListCaption(0, 0) = "·«∆Õ… «·ÕÃÊ“«  «·ÌœÊÌ… «·„⁄·ﬁ… ·œÏ «·„‘—›"
    frmBlockPendingListCaption(0, 1) = "Manual Blocking Pending List for Supervisor"
    frmBlockPendingListCaption(1, 0) = "·«∆Õ… «·ÕÃÊ“«  «·ÌœÊÌ… «·„⁄·ﬁ… ·œÏ Œœ„«  «·⁄„·«¡"
    frmBlockPendingListCaption(1, 1) = "Manual Blocking Pending List for CSO"
    frmBlockPendingListCaption(2, 0) = "·«∆Õ… «·ÕÃÊ“«  «·ÌœÊÌ… «·„⁄·ﬁ… ·œÏ «·„‘—›"
    frmBlockPendingListCaption(2, 1) = "Manual Blocking Pending Activities for Supervisor"
    frmBlockPendingListCaption(3, 0) = "·«∆Õ… «·ÕÃÊ“«  «·ÌœÊÌ… «·„⁄·ﬁ… ·œÏ Œœ„«  «·⁄„·«¡"
    frmBlockPendingListCaption(3, 1) = "Manual Blocking Pending Activities for CSO"
    frmBlockPendingListCaption(4, 0) = "«·ÂÊÌ…"
    frmBlockPendingListCaption(4, 1) = "User Id"
    frmBlockPendingListCaption(5, 0) = "«· «—ÌŒ Ê «·Êﬁ "
    frmBlockPendingListCaption(5, 1) = "Date&Time"
    frmBlockPendingListCaption(6, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmBlockPendingListCaption(6, 1) = "Card Number"
    frmBlockPendingListCaption(7, 0) = "—ﬁ„ «·Õ”«»"
    frmBlockPendingListCaption(7, 1) = "BM Account number"
    frmBlockPendingListCaption(8, 0) = "‰Ê⁄ «·«Ã—«¡"
    frmBlockPendingListCaption(8, 1) = "Action"
    frmBlockPendingListCaption(9, 0) = "«·„»·€ «·ﬁœÌ„"
    frmBlockPendingListCaption(9, 1) = "Old Amount"
    frmBlockPendingListCaption(10, 0) = "«·„»·€ «·„ÕÃÊ“"
    frmBlockPendingListCaption(10, 1) = "Block Amount"
    frmBlockPendingListCaption(11, 0) = "„·«ÕŸ«  «·„‘—›"
    frmBlockPendingListCaption(11, 1) = "Supervisor Comments"
    frmBlockPendingListCaption(12, 0) = "„‘«Âœ… «·ÕﬁÊ· «·„Œ «—…"
    frmBlockPendingListCaption(12, 1) = "Verify Selected Record"
    frmBlockPendingListCaption(13, 0) = "Œ—ÊÃ"
    frmBlockPendingListCaption(13, 1) = "Cancel"
    frmBlockPendingListCaption(14, 0) = "«· «·Ì"
    frmBlockPendingListCaption(14, 1) = "More"
    
    frmBlockRejectionCaption(0, 0) = "ÕÃÊ“«  ÌœÊÌ… „⁄«œÂ"
    frmBlockRejectionCaption(0, 1) = "Manual Blocking Rejection"
    frmBlockRejectionCaption(1, 0) = "„·«ÕŸ« "
    frmBlockRejectionCaption(1, 1) = "Comments"
    frmBlockRejectionCaption(2, 0) = "„—›Ê÷…"
    frmBlockRejectionCaption(2, 1) = "Reject"
    frmBlockRejectionCaption(3, 0) = " ÕÊ· «·Ï Œœ„«  «·⁄„·«¡"
    frmBlockRejectionCaption(3, 1) = "Forward to CSO"
    frmBlockRejectionCaption(4, 0) = "Œ—ÊÃ"
    frmBlockRejectionCaption(4, 1) = "Cancel"
    
End Sub
Public Sub populateErrMsg()
 Dim tmpStr As String
 errCallHeadOffice(0) = "« ’· »«·„—ﬂ“ · ‘€Ì· «·‰Ÿ«„ —ﬁ„ 1"
 errCallHeadOffice(1) = "Call Head Office to activate static server"
 errCallHeadOffice1(0) = "« ’· »«·„—ﬂ“ · ‘€Ì· «·‰Ÿ«„ —ﬁ„ 2 "
 errCallHeadOffice1(1) = "Call Head Office to activate Online Gateway server"
 errCallHeadOffice2(0) = "« ’· »«·„—ﬂ“ · ‘€Ì· «·‰Ÿ«„ —ﬁ„ 2 "
 errCallHeadOffice2(1) = "Call Head Office to activate Merchant server"
 errEnterToContinue(0) = "«‰ﬁ— ENTER ··« ’«· »‰Ÿ«„ «·„⁄·Ê„« "
 errEnterToContinue(1) = "Press ENTER to Connect to static server"
 errTryAgain(0) = "1001-«·« ’«· ‰«ÃÕ - «⁄œ «œŒ«· «·»Ì«‰« "
 errTryAgain(1) = "1001-Connected successfully to host; try your action again"
 errConnectProblem(0) = "1002-«·« ’«· »«·‰Ÿ«„ €Ì— ‰«ÃÕ : "
 errConnectProblem(1) = "1002-Problem in Connecting to server : "
 errErrorAtServer(0) = "1003-„‘ﬂ·… « ’«·«  „⁄ «·‰Ÿ«„-”Ê› ‰Õ«Ê· «·« ’«· À«‰Ì…"
 errErrorAtServer(1) = "1003-Communication Error at static server. Will try to Estabilish connection"
 errReceiveFromHost(0) = "Ì” ﬁ»· „‰ «·‰Ÿ«„"
 errReceiveFromHost(1) = "Receiving from Host..."
 errShouldIReconnect(0) = "1004-Â· «Õ«Ê· «·« ’«· À«‰Ì… ø"
 errShouldIReconnect(1) = "1004-Should I try to reconnect?"
 errUnexpectedError(0) = "1005-Œÿ√ €Ì— „ Êﬁ⁄ «À‰«¡ „Õ«Ê·… «·« ’«· »«·„—ﬂ“"
 errUnexpectedError(1) = "1005-Unexpected error during connect to head office"
 errHostName(0) = "≈”„ «·‰Ÿ«„ :"
 errHostName(1) = "Host Name : "
 errPortNo(0) = "«Ìﬁ«› "
 errPortNo(1) = "Port "
 errMsgReceiveError(0) = "1006-MESSAGE RECEIVE ERROR :  "
 errMsgReceiveError(1) = "1006-MESSAGE RECEIVE ERROR :  "
 errTimeOut(0) = "1007-«‰ ÂÏ «·Êﬁ  :"
 errTimeOut(1) = "1007-TIMEOUT :"
 errMsgSendError(0) = "1008-MESSAGE SEND ERROR :"
 errMsgSendError(1) = "1008-MESSAGE SEND ERROR :"
 errConnectionRejected(0) = "«·« ’«· »«·„—ﬂ“ „—›Ê÷"
 errConnectionRejected(1) = "Host connection Rejected"
 errPasswordNoMatch(0) = "1009-ﬂ·„… «·”— €Ì— ’ÕÌÕÂ-Õ«Ê· „—Â √Œ—Ï"
 errPasswordNoMatch(1) = "1009-Passwords does not match...Please re-enter again"
 errPasswordChanged(0) = "1010- „  ⁄œÌ· ﬂ·„… «·”— »‰Ã«Õ."
 errPasswordChanged(1) = "1010-Password Successfully Changed."
 errInvalidPassword(0) = "1011-ﬂ·„… «·”— €Ì— ’ÕÌÕÂ ... «ﬂœ „‰ ﬂ·„… «·”— «·ﬁœÌ„Â"
 errInvalidPassword(1) = "1011-Invalid Password.. Check your Old Password"
 errUsedPassword(0) = "1012-ﬂ·„… «·”— «” Œœ„  ”«»ﬁ« ..—Ã«¡ «œŒ«· ﬂ·„… ”— «Œ—Ï"
 errUsedPassword(1) = "1012-Password previously used ...Please Use a different password"
 errInternalProb(0) = "1013-«·⁄„·Ì… ›«‘·…..Â‰«·ﬂ »⁄÷ «·„‘«ﬂ· «·œ«Œ·ÌÂ"
 errInternalProb(1) = "1013-Some internal problem occured.. Operation failed"
 errShortPassword(0) = "1014-ﬂ·„… «·”— ÌÃ» «‰ ·«  ﬁ· ⁄‰ 8 √Õ—›/«⁄œ «·«œŒ«·"
 errShortPassword(1) = "1014-Password Should have minimum of 8 characters...RE-enter "
 errSamePassword(0) = "1015-ﬂ·„… «·”— «·ÃœÌœÂ ÌÃ» «‰ ·«  ÿ«»ﬁ „⁄ «·ﬁœÌ„Â.."
 errSamePassword(1) = "1015-New Password Cannot be equal to Old password..Please give a different Password.."
 errAlphaNumericPassword(0) = "1016-ﬂ·„… «·”— ÌÃ» «‰  Õ ÊÌ ⁄·Ï Õ—› Ê«Õœ ⁄·Ï «·«ﬁ·.."
 errAlphaNumericPassword(1) = "1016-Password should have atleast one alphabet and one number.. Please re-enter"
 errLogon(0) = "1017-«œŒ· »«” Œœ«„ —ﬁ„ «·„” Œœ„ Êﬂ·„… «·”—"
 errLogon(1) = "1017-Please Logon using your Userid & password"
 errNotAuthorised(0) = "1018-€Ì— „”„ÊÕ ·ﬂ »«” Œœ«„ «·‰Ÿ«„..« ’· „⁄ „”ƒÊ· «·«„‰"
 errNotAuthorised(1) = "1018-You are not authorised to access this application..Contact Security officer"
 errExpiredPassword(0) = "1019-«‰ Â«¡ ’·«ÕÌ… ﬂ·„… «·”—..«·—Ã«¡  €ÌÌ— ﬂ·„… «·”—"
 errExpiredPassword(1) = "1019-Your Password has been expired..Please change your password"
 errChangePassword(0) = "1020-«·—Ã«¡  €ÌÌ— ﬂ·„… «·”—"
 errChangePassword(1) = "1020-Please change your password"
 errInvalidUserId(0) = "1021-—ﬁ„ «·„” Œœ„ €Ì— ’ÕÌÕ..Õ«Ê· „—Â «Œ—Ï "
 errInvalidUserId(1) = "1021-Invalid UserID.....please try again "
 errMaxTries(0) = "1023-„Õ«Ê·… œŒÊ· ›«‘·Â 3 „—« /«·Õ”«» „—›Ê÷ « ’· »«·«œ«—Â   "
 errMaxTries(1) = "1023More than 3 unsuccessful tries...Your account has been locked...Please call headoffice   "
 errAccountLocked(0) = "1024-—ﬁ„ «·„” Œœ„ „ÊﬁÊ›..« ’· »«·„—ﬂ“ ·—›⁄ «·«Ìﬁ«›"
 errAccountLocked(1) = "1024-User Account Locked...Call HeadOffice to activate"
 errOnlyNumeralsAllowed(0) = "1025-«·«—ﬁ«„ „”„ÊÕÂ ›ﬁÿ"
 errOnlyNumeralsAllowed(1) = "1025-Only numerals are allowed"
 errNoArabicCharacters(0) = "1026-«·«Õ—› «·⁄—»ÌÂ €Ì— „”„ÊÕÂ"
 errNoArabicCharacters(1) = "1026-Arabic characters are not allowed"
 errNoEnglishCharacters(0) = "1027-«·«Õ—› «·⁄—»ÌÂ „”„ÊÕÂ ›ﬁÿ"
 errNoEnglishCharacters(1) = "1027-Arabic characters only allowed"
 errSelectYourOption(0) = "1028-«Œ — «·ÊŸÌ›Â"
 errSelectYourOption(1) = "1028-Select Your Option"
 errLoadDetails(0) = "1029-«· Õ„Ì· Ì  ÿ·» „⁄·Ê„« ...."
 errLoadDetails(1) = "1029-Loading Required Details...."
 errInvalidMailAddress(0) = "1030-«·»—Ìœ «·«·ﬂ —Ê‰Ì ÌÃ» «‰ Ì ÷„‰ Õ—› @ ›÷·« Õ«Ê· „—… «Œ—Ï"
 errInvalidMailAddress(1) = "1030-E-mail address should contain @ character...Please Re-try"
 errInvalidFaxNo(0) = "1031-—ﬁ„ «·›«ﬂ” ÌÃ» «‰ ·« Ìﬁ· ⁄‰ 7 Œ«‰« ..«⁄œ «·«œŒ«·"
 errInvalidFaxNo(1) = "1031-Fax Number should contain atleast 7 digits..Please RE-try"
 errInvalidTelNo(0) = "1032-—ﬁ„ «·Â« › ÌÕÃ» «‰ ·« Ìﬁ· ⁄‰ 7 «—ﬁ«„ ..«⁄œ «·«œŒ«·"
 errInvalidTelNo(1) = "1032-Telephone number should contain atleast 7 digits..Please RE-enter"
 errEnterValidDate(0) = "1033-«· «—ÌŒ €Ì— ’ÕÌÕ"
 errEnterValidDate(1) = "1033-Enter a valid Date"
 errEnterValidMonth(0) = "1034-«·‘Â— €Ì— ’ÕÌÕ"
 errEnterValidMonth(1) = "1034-Enter a valid Month"
 errEnterValidYear(0) = "1035-«·”‰Â €Ì— ’ÕÌÕÂ"
 errEnterValidYear(1) = "1035-Enter a valid Year"
 errNotAJointAccount(0) = "1036-Â–« «·Õ”«» €Ì— „‘ —ﬂ..."
 errNotAJointAccount(1) = "1036-This account is not a joint account..."
 errNoMoreJointAccount(0) = "1037-·« ÌÊÃœ Õ”«»«  „‘ —ﬂ… «Œ—Ï"
 errNoMoreJointAccount(1) = "1037-No More joint account exists..."
 errSuccessful(0) = "1038- „  «·⁄„·ÌÂ »‰Ã«Õ"
 errSuccessful(1) = "1038-Transaction successfully completed..."
 errSpaceId(0) = "1039-—ﬁ„ «·»ÿ«ﬁÂ ÌÃ» «‰ ÌœŒ·"
 errSpaceId(1) = "1039-Id number cannot be spaces...Please enter.."
 errSpaceNames(0) = "1040-ÌÃ» «œŒ«· «”„ Ê«Õœ ⁄·Ï «·«ﬁ·...«⁄œ «·«œŒ«·"
 errSpaceNames(1) = "1040-Atleast one name should be entered...Please enter"
 errSpaceDob(0) = "1041-ÌÃ» «œŒ«·  «—ÌŒ «·Ê·«œÂ..«·—Ã«¡ «⁄œ«·«œŒ«·"
 errSpaceDob(1) = "1041-Date of Birth Should be entered...Please enter "
 errSpaceAddress(0) = "1042-ÌÃ» «œŒ«· ’ » «Ê «·⁄‰Ê«‰...›÷·« «⁄œ «·«œŒ«·"
 errSpaceAddress(1) = "1042-Address1,PoBox,City, and ZipCode should be entered...Please enter"
 errSpacePhone(0) = "1043-ÌÃ» «œŒ«· —ﬁ„ «·Â« › ⁄·Ï «·«ﬁ·"
 errSpacePhone(1) = "1043-Atleast one Phone number should be entered..."
 errSpaceEducation(0) = "1044-ÌÃ» «Œ Ì«— —„“ «· Õ’Ì· «·⁄·„Ì..«·—Ã«¡ «Œ — „‰ «·ﬁ«∆„Â"
 errSpaceEducation(1) = "1044-Education code should be selected...Please select from the list"
 errSpaceProfession(0) = "1045-ÌÃ» «Œ Ì«— —„“ «· Œ’’ .. ›÷·« «Œ — „‰ «·ﬁ«∆„Â"
 errSpaceProfession(1) = "1045-Profession Code should be selected...Please select from the list"
 errSpacePosition(0) = "1046-ÌÃ» «Œ Ì«— —„“ «·ÊŸÌ›Â..›÷·« «Œ — „‰ «·ﬁ«∆„Â"
 errSpacePosition(1) = "1046-Position Code should be selected...Please select from the list"
 errSpaceIncome(0) = "1047-ÌÃ» «œŒ«· —„“ «·œŒ· «·‘Â—Ì ..›÷·« «Œ — „‰ «·ﬁ«∆„Â"
 errSpaceIncome(1) = "1047-Monthly income code should be selected...Please select from the list"
 errSpaceOwnership(0) = "1048-›÷·« ÌÃ» «Œ Ì«— «·—„“ «·„‰«”»"
 errSpaceOwnership(1) = "1048-Please select any one in ownership...."
 errSpaceDocuments(0) = "1049-ÌÃ» «Œ Ì«— ÊÀÌﬁ Ì‰ ⁄·Ï «·«ﬁ·..›÷·« «Œ — «·„‰«”» „‰ «·ﬁ«∆„Â"
 errSpaceDocuments(1) = "1049-Atleast two documents should be selected..Please select  "
 errSpaceEmployer(0) = "1050-ÌÃ» «‰ ÌﬂÊ‰ —ﬁ„ «·„” Œœ„ ›—«€ ..›÷·« «⁄œ «·«œŒ«·"
 errSpaceEmployer(1) = "1050-Employer Name cannot be blank..Please Enter...."
 errSpaceCR(0) = "1051-ÌÃ» «‰ ·« ÌﬂÊ‰ —ﬁ„ «·”Ã· «· Ã«—Ì ›—«€ ..›÷·« «⁄œ «·«œŒ«·"
 errSpaceCR(1) = "1051-CR Number cannot be spaces...Please enter..."
 errNoMoreJoint(0) = "1052- ·« ÌÊÃœ Õ”«»«  „‘ —ﬂÂ «Œ—Ï"
 errNoMoreJoint(1) = "1052- No More joint account exists..."
 errEmptyRowSelected(0) = "1053 - «·”ÿ— «·„ÿ·Ê» ›—«€ ..›÷·« «Œ — ”ÿ— ÌÕ ÊÌ ⁄·Ï »Ì«‰« "
 errEmptyRowSelected(1) = "1053- Empty Row has been selected.. Please select a row which has a value"
 errNoMatchFound(0) = "1054- ·« ÌÊÃœ «·„ÿ·Ê»"
 errNoMatchFound(1) = "1054- No More Match Found..."
 errAccountClosed(0) = "1055- Õ”«»ﬂ „€·ﬁ..›÷·« « ’· »«·„”ƒ·"
 errAccountClosed(1) = "1055- Your Account has been closed....Please contact security Officer.."
 errLocalDbOpenError(0) = "1056-Â‰«·ﬂ Œÿ√ ⁄‰œ › Õ „⁄·Ê„«  „Õ·ÌÂ" + CStr(Err.Number) + "  " + Err.Description
 errLocalDbOpenError(1) = "1056- Error While opening local Database " + CStr(Err.Number) + "  " + Err.Description
 errSpacePrimaryCardName(0) = "1057-·« ÌÃ» «‰ ÌﬂÊ‰ «·«”„ ›—«€ ›Ì Õ«·… «’œ«— «·»ÿ«ﬁÂ"
 errSpacePrimaryCardName(1) = "1057-Primary Card Name cannot spaces when it is selected"
 errSpaceSecondaryCardName(0) = "1058-ÌÃ» «‰ ·« ÌﬂÊ‰ «·«”„ «·À«‰Ì ›—«€ ⁄‰œ «’œ«— «·»ÿ«ﬁÂ"
 errSpaceSecondaryCardName(1) = "1058-Secondary Card Name cannot spaces when it is selected"
 errSpacePrimaryIntlCardName(0) = "1059-ÌÃ» «‰ ·« ÌﬂÊ‰ «·«”„ «·«Ê·  ›—«€ ⁄‰œ «’œ«— «·»ÿ«ﬁÂ «·œÊ·ÌÂ"
 errSpacePrimaryIntlCardName(1) = "1059-Primary Intl Card Name cannot spaces when it is selected"
 errSpaceSecondaryIntlCardName(0) = "1060-ÌÃ» «‰ ·« ÌﬂÊ‰ «·«”„ «·À«‰Ì ›—«€ ⁄‰œ «’œ«— «·»ÿ«ﬁÂ «·œÊ·ÌÂ"
 errSpaceSecondaryIntlCardName(1) = "1060-Secondary Intl Card Name cannot spaces when it is selected"
 errSpaceDeliveryAddress(0) = "1061-ÌÃ» «œŒ«· ⁄‰Ê«‰ «· ”·Ì„ Ê ’ » Ê«·„œÌ‰Â Ê«·—„“ «·»—ÌœÌ ⁄‰œ ÿ·» ’ » "
 errSpaceDeliveryAddress(1) = "1061-Delivery Address1, PoBox, City, Zipcode must be entered when PoBox is selected"
 errSpaceIssueDate(0) = "1062-ÌÃ» «œŒ«·  «—ÌŒ «’œ«— «·ÂÊÌÂ..›÷·« «⁄œ «·«œŒ«·"
 errSpaceIssueDate(1) = "1062-Id Issue Date should be entered..Please enter"
 errSpaceExpiryDate(0) = "1063-ÌÃ» «œŒ«·  «—ÌŒ «‰ Â«¡ ’·«ÕÌ… «·ÂÊÌÂ..›÷·« «⁄œ «·«œŒ«·"
 errSpaceExpiryDate(1) = "1063-Id Expiry Date should be entered..Please enter"
 errSpaceIdIssuedAt(0) = "1064-ÌÃ» «œŒ«· »·œ «’œ«— «·ÂÊÌÂ..›÷·« «⁄œ «·«œŒ«·"
 errSpaceIdIssuedAt(1) = "1064-Id/CR IssuedAt City should be entered..Please enter"
 errSpaceTitle(0) = "1065-ÌÃ» «œŒ«· «··ﬁ» .. ›÷·« «⁄œ «·«œŒ«·"
 errSpaceTitle(1) = "1065-Title should be selected..Please select"
 errSpaceNationality(0) = "1066-ÌÃ» «œŒ«· «·Ã‰”ÌÂ.. ›÷·« «⁄œ «·«œŒ«·"
 errSpaceNationality(1) = "1066-Nationality should be selected..Please select"
 errSpaceBusType(0) = "1067-ÌÃ» «œŒ«· «·„Â‰Â..›÷·« «⁄œ «·«œŒ«·"
 errSpaceBusType(1) = "1067-Business Type should be selected..Please select"
 errSpaceShortName(0) = "1068-ÌÃ» «‰ ·« ÌﬂÊ‰ «·«”„ «·„Œ ’— ›—«€..›÷·« «⁄œ «·«œŒ«·"
 errSpaceShortName(1) = "1068-Short Name cannot be blank...Please enter"
 errGreaterExpiryYear(0) = "1069-ÌÃ» «‰ ·« ÌﬂÊ‰  «—ÌŒ «‰ Â«¡ «·’·«ÕÌÂ ﬁ»·  «—ÌŒ «·«’œ«— "
 errGreaterExpiryYear(1) = "1069-Expiry Date Cannot be less than the Issue Date"
 errSpaceCrIssueDate(0) = "1070-ÌÃ» «œŒ«·  «—ÌŒ «·«’œ«—..›÷·« «⁄œ «·«œŒ«·"
 errSpaceCrIssueDate(1) = "1070-CR Issue Date should be entered..Please Enter"
 errNoPrimaryCard(0) = "1071-Ì„ﬂ‰ «Œ Ì«— «·»ÿ«ﬁ… «·«÷«›Ì… ⁄‰œ «Œ Ì«— «·»ÿ«ﬁ… «·«”«”Ì…"
 errNoPrimaryCard(1) = "1071-Secondary Card Can be selected Only when Primary card is selected"
 errUpdateNotAllowed(0) = "1072-«‰  €Ì— „›Ê÷ · ÕœÌÀ „⁄·Ê„«  «·⁄„Ì· ·«Œ ·«› «·›—⁄"
 errUpdateNotAllowed(1) = "1072-You are not authorized to update this customer info because branch does not match"
 errInvalidDob(0) = "1073-ÌÃ» «‰ ·« ÌﬂÊ‰  «—ÌŒ «·Ê·«œÂ «ﬂ»— „‰  «—ÌŒ «·«’œ«—..›÷·« «⁄œ «·«œŒ«·"
 errInvalidDob(1) = "1073-Date of Birth Cannot be greater than ID Issue Date..Please re-enter"
 errInvalidTitle(0) = "1074- —„“ «··ﬁ» €Ì— „ÿ«»ﬁ „⁄ «·Ã‰” ..›÷·« «⁄œ «·«œŒ«·"
 errInvalidTitle(1) = "1074-Title code does not match with the gender you have selected..Please check.."
 errInvalidSearchCriteria(0) = "1075-Œÿ√ ›Ì ÿ»Ì⁄… «·»ÕÀ..›÷·« «⁄œ «·»ÕÀ"
 errInvalidSearchCriteria(1) = "1075-Invalid Search Criteria..Please review"
 errSpaceJointAccName(0) = "1076-ÌÃ» «œŒ«· «”„«¡ «·Õ”«» «·„‘ —ﬂ..›÷·« «⁄œ «·«œŒ«·"
 errSpaceJointAccName(1) = "1076-Joint Acc Names cannot be blank..Please enter"
 errLoggingOn(0) = "1077-›÷·« «‰ Ÿ—..."
 errLoggingOn(1) = "1077-Logging on...Please wait...."
 errLoadingForm(0) = "1078-«·⁄„·ÌÂ ﬁÌœ«· ‰›Ì–..›÷·« «‰ Ÿ—... ."
 errLoadingForm(1) = "1078-Loading form...Please wait..."
 errSelectCriteria(0) = "1079-«œŒ· «Œ «—ﬂ "
 errSelectCriteria(1) = "1079-Select any of the criteria"
 errNoChequeBook(0) = "1080-œ›« — «·‘Ìﬂ«  „”„ÊÕÂ ›ﬁÿ ·«” «– 160"
 errNoChequeBook(1) = "1080-Cheque Book is allowed only for Account 160"
 errInvalidNationality(0) = "1081-—„“ «·Ã‰”ÌÂ Œÿ√ ·Â–Â «·ÂÊÌÂ"
 errInvalidNationality(1) = "1081-Invalid Nationality code this ID Type"
 errNotAuthorisedBranch(0) = "1082-€Ì— „”„ÊÕ ·ﬂ »«·œŒÊ· ⁄·Ï Â–« «·›—⁄"
 errNotAuthorisedBranch(1) = "1082-You are not authorized to access this application in this branch"
 errNoDecorativeChars(0) = "1083-„œ «·Õ—Ê› €Ì— „”„ÊÕ"
 errNoDecorativeChars(1) = "1083-Decorative Characters are not allowed.."
 errInvalidDate(0) = "1084-«· «—ÌŒ €Ì— ’ÕÌÕ .. ›÷·« «⁄œ «·«œŒ«·"
 errInvalidDate(1) = "1084-Invalid Date..Please RE-Enter.."
 errNoEnglishAddress(0) = "1085-·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ «·⁄‰Ê«‰ »«·«‰Ã·Ì“ÌÂ.."
 errNoEnglishAddress(1) = "1085-Address cannot be in English.."
 errNoArabicAddress(0) = "1086-·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ «·⁄‰Ê«‰ »«·⁄—»ÌÂ.."
 errNoArabicAddress(1) = "1086-Address cannot be in Arabic.."
 errLangNotmatching(0) = "1087-ÌÃ» «‰  ﬂÊ‰ «·„œÌ‰Â „ Ê«›ﬁÂ „⁄ ·€… «·⁄„Ì·.."
 errLangNotmatching(1) = "1087-City does not match with the customer language"
 errSpaceCustomerType(0) = "1088-ÌÃ» «œŒ«· ‰Ê⁄ «·⁄„Ì· ..›÷·« «⁄œ «·«œŒ«·"
 errSpaceCustomerType(1) = "1088-Customer Type should be selected..Please Select"
 errSpaceIdType(0) = "1089- Ã» «œŒ«· ‰Ê⁄ «·»ÿ«ﬁÂ ..›÷·« «⁄œ «·«œŒ«·"
 errSpaceIdType(1) = "1089-Id Type should be selected..Please select"
 errInvalidId(0) = "1090-ÌÃ» «‰ ÌﬂÊ‰ —ﬁ„ «·»ÿ«ﬁ… ⁄‘— Œ«‰« "
 errInvalidId(1) = "1090-ID Number should have 10 digits.."
 errSearchInProgress(0) = "1091-«·»ÕÀ „” „—..."
 errSearchInProgress(1) = "1091-Search in progress..."
 errSearchIncomplete(0) = "1092-«·»ÕÀ ·„ Ìﬂ „·"
 errSearchIncomplete(1) = "1092-Search could not be completed."
 errRefreshingLocalDb(0) = "1093-Ì „  ÕœÌÀ «·„⁄·Ê«  «·„Õ·ÌÂ .. ›÷·« «‰ Ÿ—"
 errRefreshingLocalDb(1) = "1093-Refreshing local Database...Please wait"
 errRefreshError(0) = "1094-Â‰«·ﬂ „‘ﬂ·… «À‰«¡ «· ÕœÌÀ .. «· ÕœÌÀ ·„ Ìﬂ „·"
 errRefreshError(1) = "1094-Problem during refresh; refresh not complete"
 errRefreshComplete(0) = "1095-«ﬂ „· «· ÕœÌÀ"
 errRefreshComplete(1) = "1095-Refresh Completes"
 errVerifyRecord(0) = "1096-«Œ — «Ì Õﬁ· ··„Ê«›ﬁÂ"
 errVerifyRecord(1) = "1096-Select any record for verification"
 errSelectOneMatch(0) = "1097-√›«œ «·»ÕÀ ⁄‰ ﬂÀÌ— „‰ «·⁄„·«¡ «·„ÿ«»ﬁÌ‰ ·„« √œŒ· Â „‰ „⁄·Ê„«  ° ≈Œ «— «·⁄„Ì· «·–Ì  —Ìœ"
 errSelectOneMatch(1) = "1097-Search resulted in many matches, please select a particular one"
 errInvalidBusinessType(0) = "1098- ’‰Ì› «·⁄„· Œÿ√° «·—Ã«¡ ≈⁄«œ… «·„Õ«Ê·… „—… √Œ—Ï."
 errInvalidBusinessType(1) = "1098-Invalid Business Type..Please Re-enter.."
 errIncorrectNationality(0) = "1099-—„“ «·Ã‰”Ì… Œÿ√° «·—Ã«¡ ≈⁄«œ… «·„Õ«Ê·… „—… √Œ—Ï. "
 errIncorrectNationality(1) = "1099-Invalid Nationality code..Please Re-enter.."
 errInvalidCountry(0) = "1100-—„“ «·»·œ Œÿ√°  «·—Ã«¡ ≈⁄«œ… «·„Õ«Ê·… „—… √Œ—Ï."
 errInvalidCountry(1) = "1100-Invalid Country Code...Please Re-enter.."
 errIncorrectTitle(0) = "1101-—„“ «··ﬁ» Œÿ√° «·—Ã«¡ ≈⁄«œ… «·„Õ«Ê·… „—… √Œ—Ï."
 errIncorrectTitle(1) = "1101-Invalid Title Code..Please Re-Enter.."
 errPendingStatus(0) = "1102-·«Ì„ﬂ‰ «· ⁄œÌ·  ·«‰Â« „⁄·ﬁ‹‹‹‹‹‹‹… "
 errPendingStatus(1) = "1102-This Record cannot be modified since it is in pending status "
 errInvalidCardNo(0) = "1103-—ﬁ„ «·»ÿ«ﬁ… Œÿ«¡ Õ«Ê· √Œ—Ï"
 errInvalidCardNo(1) = "1103-Invalid Card Number...Please Enquire again"
 errCardNoAlloted(0) = " „ ≈” Õœ«À —ﬁ„ «·»ÿ«ﬁ… "
 errCardNoAlloted(1) = "Card Number Alloted is "
 errSpaceNameOnCard(0) = "1104-«·«”„ ⁄·Ï «·»ÿ«ﬁ… ·«Ì„ﬂ‰ √‰ ÌﬂÊ‰ ›«—€« ÌÃ» «·≈œŒ«· "
 errSpaceNameOnCard(1) = "1104-Name on the card Cannot be blank..Please enter"
 errSpaceBranchCode(0) = "1105-—ﬁ„ «·›—⁄ ·«Ì„ﬂ‰ √‰ Ì —ﬂ ›«—€« ÌÃ» «·≈œŒ«· "
 errSpaceBranchCode(1) = "1105-Branch Code cannot be blank.. Please enter"
 errInvalidBranchCode(0) = "1106-—ﬁ„ «·›—⁄ Œÿ«¡ √⁄œ «·≈œŒ«· "
 errInvalidBranchCode(1) = "1106-Invalid Branch code ..Please re-enter.."
 errSpaceUserId(0) = "1107-ÌÃ» ≈œŒ«· «·ÂÊÌ… "
 errSpaceUserId(1) = "1107-User Id cannot be spaces..Please enter"
 errInvalidCustNo(0) = "1108-—ﬁ„ «·⁄„Ì· Œÿ«¡ √⁄œ «·≈œŒ«· "
 errInvalidCustNo(1) = "1108-Invalid customer number...Please re-try"
 errSpaceFreqDays(0) = "1109-⁄œœ «·√Ì«„ ·«Ì„ﬂ‰ √‰ ÌﬂÊ‰ ›«—€« , ÌÃ» «·≈œŒ«·"
 errSpaceFreqDays(1) = "1109-Frequency Days Cannot be blank..Please enter"
 errCannotRequestAdminCard(0) = "1110-·«Ì„ﬂ‰ ≈’œ«— »ÿ«ﬁ… „”ƒÊ· Œ«’ »›—⁄ ¬Œ—"
 errCannotRequestAdminCard(1) = "1110-Cannot request Admin Card for other branch"
 errSpaceSubAcc(0) = "1111-«·—ﬁ„ «·„ ›—⁄ »œÊ‰ .. ÌÃ» ≈œŒ«· «·—ﬁ„ «·„ ›—⁄"
 errSpaceSubAcc(1) = "1111-Sub Account Number cannot be spaces..Please enter"
 errDC9000LogSuccess(0) = "1112-Card production Log ÕœÀ  »‰Ã«Õ"
 errDC9000LogSuccess(1) = "1112-Card production Log Successfully Updated"
 
 errSpaceAccNo(0) = "1113-—ﬁ„ «·Õ”«» ·« Ìﬁ»· ›—«€« ..ÌÃ» «·«œŒ«· "
 errSpaceAccNo(1) = "1113-Account number cannot be spaces..Please enter.."
 errAccNoIs(0) = "—ﬁ„ «·Õ”«» ÂÊ"
 errAccNoIs(1) = "Account Number is  "
 errOnlySaudiRiyalAcc(0) = "1114-œ› — «·‘Ìﬂ«  Ì’œ— ·Õ”«»«  «·—Ì«· «·”⁄ÊœÌ ›ﬁÿ"
 errOnlySaudiRiyalAcc(1) = "1114-Cheque Book can be issued only to Saudi Riyal account"
 errChequeBookOnlyFor008160(0) = "1115-œ› — «·‘Ìﬂ«  Ì’œ— ··«” «– 008 Ê 160 ›ﬁÿ"
 errChequeBookOnlyFor008160(1) = "1115-Cheque Book can be issued only to 008/160 accounts"
 errNoRowSelectedForUpdate(0) = "1116-·« ÌÊÃœ «‘«—Â ⁄·Ï «·„ÿ·Ê»..÷⁄ «·«‘«—Â Ê«÷€ÿ  ÕœÌÀ"
 errNoRowSelectedForUpdate(1) = "1116-No row selected for update..Please select and click update"
 errSpaceSoNo(0) = "1117-—ﬁ„ «·«„— «·À«»  ›—«€ ..«·—Ã«¡ «·«œŒ«·"
 errSpaceSoNo(1) = "1117-SO Number cannot be spaces...Please enter.."
 errInvalidFirstPayDate(0) = "1118-ÌÃ» «‰ ÌﬂÊ‰  «—ÌŒ «Ê· œ›⁄… «ﬂ»— „‰ «· «—ÌŒ «·Õ«·Ì..«œŒ· ÊÕœÀ"
 errInvalidFirstPayDate(1) = "1118-First Pay Date should be greater than the current date...Please Re-enter.."
 errInvalidNextPayDate(0) = "1119- «—ÌŒ «·œ›⁄… «· «·Ì… ÌÃ» «‰ ÌﬂÊ‰ «ﬂ»— „‰  «—ÌŒ «Ê· œ›⁄…"
 errInvalidNextPayDate(1) = "1119-Next pay date should be later than the first pay date"
 errInvalidFinalPayDate(0) = "1120- «—ÌŒ «Œ— œ›⁄… ÌÃ» «‰ ÌﬂÊ‰ «ﬂ»— „‰  «—ÌŒ «·œ›⁄… «· «·Ì…"
 errInvalidFinalPayDate(1) = "1120-Final pay date should be later than the next pay date"
 errSpacePaymentAmt(0) = "1121-ÌÃ» «œŒ«· „»·€ «·œ›⁄…"
 errSpacePaymentAmt(1) = "1121-Payment Amount needs to be entered...Please enter"
 errSpacePayeeAccount(0) = "1122-ÌÃ» «œŒ«· «·Õ”«» «·„ﬁ«»·"
 errSpacePayeeAccount(1) = "1122-Payee Account needs to be entered..Please enter"
 errStdOrdAlreadyStopped(0) = "1123-«·«„— «·À«»  „ÊﬁÊ› ..·« Ì„ﬂ‰ «Ìﬁ«›… À«‰Ì…"
 errStdOrdAlreadyStopped(1) = "1123-Standing order already stopped...Cannot Stop again..."
 errSpaceChequeNo(0) = "1124-Õﬁ· -«·Ï ‘Ìﬂ —ﬁ„ -·« Ìﬁ»· ›—«€"
 errSpaceChequeNo(1) = "1124-To Cheque No Cannot be spaces....Please enter.."
 errSpaceChequeAmt(0) = "1125-ÌÃ» «œŒ«· „»·€ «·‘Ìﬂ"
 errSpaceChequeAmt(1) = "1125-Cheque Amount Cannot be spaces...Please enter..."
 errIncorrectMsgSent(0) = "1126-—”«·… „—”·… Œ«ÿ∆… .. «ﬂœ —ﬁ„ «·Õ”«» Ê«· «—ÌŒ"
 errIncorrectMsgSent(1) = "1126-Incorrect Message sent..Check the Account Number and Dates"
 errIncorrectMainAcc(0) = "1127-«·Õ”«» «·—∆Ì”Ì €Ì— ’ÕÌÕ .. «ﬂœ „‰ «·—ﬁ„"
 errIncorrectMainAcc(1) = "1127-Given Main Account is incorrect...Please Check"
 errIncorrectContraAcc(0) = "1128-«·Õ”«» «·„ﬁ«»· €Ì— ’ÕÌÕ ..  «ﬂœ „‰ «·—ﬁ„"
 errIncorrectContraAcc(1) = "1128-Given contra Account is incorrect..Please Check"
 errRestrictedAccount(0) = "1129- Õ›Ÿ ⁄·Ï «·Õ”«» .. «·—Ã«¡ «· «ﬂœ"
 errRestrictedAccount(1) = "1129-Restricted Account.. Please Check.."
 errCommsError(0) = "1130-Œÿ√ ›Ì «·« ’«·« ..Õ«Ê· ·«Õﬁ«"
 errCommsError(1) = "1130-Communication Error occured..Try Again.."
 errNotAuthorizedToViewStaffAcc(0) = "1131-«‰  €Ì— „›Ê÷ ··«ÿ·«⁄ ⁄·Ï Õ—ﬂ«  Õ”«»«  «·„ÊŸ›Ì‰"
 errNotAuthorizedToViewStaffAcc(1) = "1131-You are not authorised to view STAFF ACCOUNT'S transaction "
 errErrorRecdFromOnlineGateway(0) = "1132-Œÿ√  " + transResMsg.responseStatus + " «À‰«¡ «·« ’«·"
 errErrorRecdFromOnlineGateway(1) = "1132-Error  " + transResMsg.responseStatus + "occurred during communication"
 errWannaPrint(0) = "Â·  —Ìœ ÿ»«⁄… «·ﬂ‘›  (Y/N )? : "
 errWannaPrint(1) = "Do you want to print the statement (Y/N )? : "
 errDifferentBranchCode(0) = "1133 - —ﬁ„ «·›—⁄ „Œ ·› ...·« Ì„ﬂ‰ › Õ Õ”«»"
 errDifferentBranchCode(1) = "1133 - Branch code is different...Cannot open account "
 errSpaceOrgAlphaSearch(0) = "1134 - «·»ÕÀ «·«»ÃœÌ ·« Ìﬁ»· ›—«€...«÷€ÿ ENTER"
 errSpaceOrgAlphaSearch(1) = "1134 - Org Alpha search cannot be spaces...Please enter.."
 errNotPackageAcc(0) = "1135-„“«Ì« »‰ﬂÌÂ ·« Ì‰ÿ»ﬁ ...—« » «ﬂ»— „‰ 5000 —Ì«·. —« » „ÕÊ·"
 errNotPackageAcc(1) = "1135-Package Account conditions not met.. Salary > 5000, Salary transfer "
 errStaffAcc(0) = "1136-Õ”«» «·„ÊŸ› , «·«” ›”«— „„‰Ê⁄ , «·«—’œÂ ÕÊ·  «·Ï ’›—"
 errStaffAcc(1) = "1136-Staff Account,  Balance Enquiry Restricted..Balances are made 0 (Zero)"
 errSpaceIntAppl(0) = "1137- —’Ìœ «·›«∆œÂ ÌÃ» «‰ ·« ÌﬂÊ‰ ›—«€ ..«÷€ÿ ENTER"
 errSpaceIntAppl(1) = "1137-Interest Application cannot be spaces..Please enter"
 errInvalidIntAppl(0) = "1137- —’Ìœ «·›«∆œ Œÿ√ ..«÷€ÿ ENTER „—Â «Œ—Ï"
 errInvalidIntAppl(1) = "1137-Interest Application is invalid..Please enter again"
 errSpacePayFreq(0) = "1138-› —… «·œ›⁄ ·« Ì„ﬂ‰ «‰  ﬂÊ‰ ›—«€.«÷€ÿ ENTER"
 errSpacePayFreq(1) = "1138-Payment Frequency cannot be spaces..Please enter"
 errInvalidPayFreq(0) = "1139-› —… «·œ›⁄ Œÿ√.«÷€ÿ ENTER"
 errInvalidPayFreq(1) = "1139-Invalid Payment Frequency..Please re-enter"
 errSpacePayMode(0) = "1140-ﬂÌ›Ì… «·œ›⁄ ·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ ›—«€.«÷€ÿ ENTER"
 errSpacePayMode(1) = "1140-Payment Mode cannot be space..Please enter"
 errInvalidPayMode(0) = "1141-ﬂÌ›Ì… «·œ›⁄ Œÿ√ . «÷€ÿ ENTER"
 errInvalidPayMode(1) = "1141-Invalid Payment mode..Please re-enter"
 errSpacePayType(0) = "1142-‰Ê⁄ «·œ›⁄ ·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ ›—«€ . «÷€ÿ ENTER"
 errSpacePayType(1) = "1142-Payment type cannot be spaces..Please enter"
 errInvalidPayType(0) = "1143-‰Ê⁄ «·œ›⁄ Œÿ√. «÷€ÿ ENTER"
 errInvalidPayType(1) = "1143-Invalid payment type..Please re-enter"
 errSpaceSoType(0) = "1144-‰Ê⁄ «·«„— «·À«»  ·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ ›—«€ .«÷€ÿ ENTER"
 errSpaceSoType(1) = "1144-SO type cannot be space..Please enter"
 errInvalidSoType(0) = "1145-‰Ê⁄ «·«„— «·À«»  Œÿ√ .«÷€ÿ ENTER"
 errInvalidSoType(1) = "1145-Invalid SO type..Please re-enter"
 errCardNotAllowed(0) = "1146-«’œ«— »ÿ«ﬁ«  €Ì— „”„ÊÕ ··‘—ﬂ«  Ê «· Ã«—Â"
 errCardNotAllowed(1) = "1146-ATM Card is not allowed for corporate/commercial customers"
 errInvalidChar(0) = "1147-Õﬁ· €Ì— ’ÕÌÕ „ÊÃÊœ ›Ì «·«”„..«·—Ã«¡ «· √ﬂœ À„ «· ⁄œÌ·"
 errInvalidChar(1) = "1147-Invalid characters found in the card name..Please check and remove"
 errPinNotMatching(0) = "1148-«·—ﬁ„ «·”—Ì €Ì— ’ÕÌÕ.›÷·« √⁄œ «œŒ«· «·—ﬁ„ «·”—Ì"
 errPinNotMatching(1) = "1148-Pin numbers does not match..please enter again.."
 errCardPrintedOk(0) = "1149-Â· ÿ»⁄  «·»ÿ«ﬁÂ »‰Ã«Õ ø "
 errCardPrintedOk(1) = "1149-Card Printed Successfully ? "
 errAlreadyInFirst(0) = "1150-√‰  „ÊÃÊœ «’·« ⁄·Ï «·ﬁ«∆„Â «·«Ê·Ï"
 errAlreadyInFirst(1) = "1150-Already in first list"
 errInvalidAltBrCode(0) = "1151-—„“ «·›—⁄ «·À«‰Ì ÌÃ» √‰ ÌﬂÊ‰ —„“ ›—⁄ ÕﬁÌﬁÌ ..Õ«Ê· „—… √Œ—Ï"
 errInvalidAltBrCode(1) = "1151-Alternative Branch Code should be a real branch...Please re-enter.."
 errDifferentCurrency(0) = "1152-«· ÕÊÌ· «·Ï ⁄„·… „Œ ·›Â €Ì— „„ﬂ‰ ..›÷·« «œŒ· «·⁄„·… «·’ÕÌÕÂ"
 errDifferentCurrency(1) = "1152-Standing not allowed for different currencies..Please check"
 errWannaReplacementCard(0) = "1153-Â·  —Ìœ »ÿ«ﬁÂ »œÌ·Â ?"
 errWannaReplacementCard(1) = "1153-Do you want a replacement card for this card ?"
 errSpaceDoe(0) = "1154-ÌÃ» «œŒ«·  «—ÌŒ «·‘—ﬂÂ..«·—Ã«¡ «⁄œ«·«œŒ«·"
 errSpaceDoe(1) = "1154-Date of Est. Should be entered...Please enter "
 errNotAuthorisedToFlag(0) = "1155-√‰  €Ì— „›Ê÷ »«÷«›… «Ê «·€«¡ «·„“«Ì« «·»‰ﬂÌÂ ·Â–« «·⁄„Ì·"
 errNotAuthorisedToFlag(1) = "1155-You are not authorised to flag/unflag this type of package account"
 errSpacePin(0) = "1156-«·—ﬁ„ «·”—Ì ·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ ›—«€..√÷€ÿ ENTER"
 errSpacePin(1) = "1156-Pin cannot be blank...Please enter.."
 errUnixDateError(0) = "1157-Œÿ√ « ’«· √À‰«¡  Õ÷Ì— «· «—ÌŒ Ê«·Êﬁ  "
 errUnixDateError(1) = "1157-Error occured while getting date & time from host"
 errPasswordAlert(0) = "1158-’·«ÕÌ… ﬂ·„… «·”— ”Ê›  ‰ ÂÌ ﬁ—Ì»«, Â·  —Ìœ  €Ì—Â« «·«‰ø"
 errPasswordAlert(1) = "1158-Your password will be expired soon..Do you want to change it now?"
 errNoMerchantStmt(0) = "1159-·« ÌÊÃœ  ﬁ«—Ì— ··»«∆⁄ ⁄‰ «·› —… «·„ÿ·Ê»…"
 errNoMerchantStmt(1) = "1159-No report found for this merchant for the given period"
 errInvalidMerchantNo(0) = "1160-‰Ê⁄ «·»«∆⁄ €Ì— ’ÕÌÕ «—ÃÊ «· ’Õ’Õ"
 errInvalidMerchantNo(1) = "1160-Invalid merchant no for this type.. please check and correct"
 errStmtSuccess(0) = "1161- „  ‰›Ì– ﬂ‘› «·Õ”«» »‰Ã«Õ..."
 errStmtSuccess(1) = "1161-Statement extracted Succesfully .."
 errAListCustomer(0) = "1162-«·⁄„Ì· „œ—Ã ⁄·Ï «·ﬁ«∆„…«·”Êœ«¡ (A) „‰ ﬁ»· : " ' MISYS
 errAListCustomer(1) = "1162-Customer is found as Blacklist on A List reported by : " ' MISYS
 errNameAList(0) = " »«”„ : " ' MISYS
 errNameAList(1) = " and the name : " ' MISYS
 errOperationNotPossible(0) = " ·–« ·« Ì„ﬂ‰ › Õ Õ”«».." ' MISYS
 errOperationNotPossible(1) = " So.., operation cannot proceed.." ' MISYS
 errRestrictedBranch(0) = "1163-«‰  €Ì— „›Ê÷ »«· ⁄œÌ· ⁄·Ï Â–« «·Õ”«» ..«·—Ã«¡ «· «ﬂœ" ' MISYS
 errRestrictedBranch(1) = "1163-Update is restricted for this Branch customer..Please check" ' MISYS
 errAccOpeningRestricted(0) = "1164-«·⁄„·Ì… €Ì— „”„ÊÕ… ..Õ”«» ÌŒ’ ›—⁄ ¬Œ— „„‰Ê⁄ " ' MISYS
 errAccOpeningRestricted(1) = "1164-Operation is prohibited since the branch is a restricted branch" ' MISYS
 errAListAcc(0) = "1165-«·⁄„Ì· „œ—Ã ⁄·Ï «·ﬁ«∆„…«·”Êœ«¡ √ ..·« Ì„ﬂ‰ › Õ Õ”«» " ' MISYS
 errAListAcc(1) = "1165-Customer is Blacklisted in A-List; Account operation cannot proceed .." ' MISYS
 errStmtRestrictedBranch(0) = "1166-ﬂ‘› «·Õ”«» €Ì— „„ﬂ‰ ·›—⁄ „„‰Ê⁄" ' MISYS
 errStmtRestrictedBranch(1) = "1166-Statement is restricted for this branch"  ' MISYS
 errLoggingOut(0) = "1167-Ì „ «·«” ⁄œ«œ ··Œ—ÊÃ...«‰ Ÿ—"  ' MISYS
 errLoggingOut(1) = "1167-Logging out...Please wait...." ' MISYS
 errChequeBookAlreadyProcessed(0) = "1168-œ› — «·‘Ìﬂ«   „ „⁄«·Ã Â ..·« Ì„ﬂ‰ «· ⁄œÌ· √Ê «·≈·€«¡"
 errChequeBookAlreadyProcessed(1) = "1168-Cheque Book already processed..Cannot Modify"
 errSpaceDrNarrative(0) = "1169-ÌÃ» «œŒ«· «·‘—Õ «·„œÌ‰ .. «÷€ÿ «‰ —"
 errSpaceDrNarrative(1) = "1169-Dr narrative must be entered... please enter"
 errSpaceCrNarrative(0) = "1170-ÌÃ» «œŒ«· «·‘—Õ «·œ«∆‰ ..«÷€ÿ «‰ —"
 errSpaceCrNarrative(1) = "1170-Cr narrative must be entered... please enter"
 errPinLessThan4Chars(0) = "1171-ÌÃ» «œŒ«· 4 «—ﬁ«„"
 errPinLessThan4Chars(1) = "1171-Pin No should be 4 characters.. Please enter"
 errSpacePassword(0) = "1172-ﬂ·„… «·”— «·ÃœÌœÌ… ÌÃ» «‰  ﬂÊ‰ Õ—Ê› Ê«—ﬁ«„  ... «⁄œ «·«œŒ«·"
 errSpacePassword(1) = "1172-New password should not be spaces.. please enter"
 
 errSelectCategory(0) = "1173-«·—Ã«¡ «Œ —«· ’‰Ì› «·—∆Ì”Ì Ê«·›—⁄Ì ﬁ»· «‰  › Õ ⁄„Ì· ÃœÌœ"
 errSelectCategory(1) = "1173-Please select main and sub category before creating new customer"
 errInvalidCategory(0) = "1174-„ÿ«»ﬁ… «· ’‰Ì› €Ì— ’ÕÌÕ… ° «·—Ã«¡ «· «ﬂœ"
 errInvalidCategory(1) = "1174-Category combination is invalid ; please check with SUPPORT"
 errSpacePpNo(0) = "1175-·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ ÃÊ«“ «·”›— ›—«€..«·—Ã«¡ «·«œŒ«·"
 errSpacePpNo(1) = "1175-Passport number cannot be spaces ... Please enter"
 errNoDocDefined(0) = "1176-·« ÌÊÃœ „” ‰œ«  ·Â–« «· ’‰Ì›..«·—Ã«¡  ÕœÌÀ «·»Ì«‰«  «·„Õ·Ì… «Ê ÿ·» «·„”«⁄œ…"
 errNoDocDefined(1) = "1176-No documents defined for this category; please refresh your local database or call SUPPORT"
 errDocAlreadySelected(0) = "1177-«·„” ‰œ „ÿ·Ê» «’·« .. «·—Ã«¡ «· «ﬂœ"
 errDocAlreadySelected(1) = "1177-Document already selected...Please check"
 errNoDocumentsSelected(0) = "1178-·« „” ‰œ«  „ÿ·Ê»…..«·—Ã«¡ ÿ·» «·„” ‰œ«  À„ ÿ·» «· ‰›Ì–"
 errNoDocumentsSelected(1) = "1178-No documents selected ; please Click documents to select documents and redo create"
 errSpaceHomeAddress(0) = "1179-«œŒ«· «·»·œ «·«„ «Ã»«—Ì ·Â–« «· ’‰Ì› ..·ÿ›« «÷€ÿ ENTER"
 errSpaceHomeAddress(1) = "1179-Home country address are mandatory for this category...Please enter"
 errSpaceInterGroupAccNo(0) = "1180-«œŒ«· Õ”«» «·„Ã„Ê⁄… ÌÃ» «‰ ÌœŒ· ..·ÿ›« «÷€ÿ ENTER"
 errSpaceInterGroupAccNo(1) = "1180-Inter group account no should be entered for this category..Please enter.."
 errSpaceSpecialRefNo(0) = "1181-—ﬁ„ «·„—Ã⁄ «·Œ«’ ÌÃ» «‰ ÌœŒ· .. ·ÿ›« «÷€ÿ ENTER"
 errSpaceSpecialRefNo(1) = "1181-Special reference number should be entered.. Please enter"
 errSpaceHomeCountryId(0) = "1182-ÂÊÌ… «·»·œ «·«„ ›Ì Â–« «· ’‰Ì› ÌÃ» «‰  œŒ·..·ÿ›« «÷€ÿ ENTER"
 errSpaceHomeCountryId(1) = "1182-Home country id should be entered for this category..please enter"
 errSpaceSamaApproval(0) = "1183-„Ê«›ﬁ… ”«„« «Ã»«—Ì ·Â–« «· ’‰Ì›.. «·—Ã«¡ «· «ﬂœ"
 errSpaceSamaApproval(1) = "1183-SAMA approval is mandatory for this category... Please check"
 
 errInvalidIdNo(0) = "1184-—ﬁ„ «·»ÿ«ﬁ… «·„œŒ· €Ì— ’ÕÌÕ .. «·—Ã«¡ «· «ﬂœ"
 errInvalidIdNo(1) = "1184-Id number you have entered is invalid .. please check"
 errInvalidIdCategory(0) = "1185-«·Õ—› «·«Ê· „‰ «·ÂÊÌ… €Ì— ’ÕÌÕ 2 √Ê 3 √Ê 5 ··«Ã«‰» Ê 1 ··”⁄ÊœÌÊ‰"
 errInvalidIdCategory(1) = "1185-First digit of Id is invalid ; should be 2,3 or 5 for expatriate and 1 for saudi.. Please check"
 errOnlySarAcAllowed(0) = "1186-› Õ Õ”«» »«·—Ì«· «·”⁄ÊœÌ ›ﬁÿ «·„”„ÊÕ ·Â–« «· ’‰Ì› .. «·—Ã«¡ «· «ﬂœ"
 errOnlySarAcAllowed(1) = "1186-Only Saudi Riyal account can be opened for this category....Please check"
 errGetingScreenNo(0) = "1187-Œÿ√ ›Ì «·œŒÊ· «·Ï «· ’‰Ì› «·—∆Ì”Ì " & mainCategoryCode & " «· ’‰Ì› «·›—⁄Ì   " & subCategoryCode & "  «·—Ã«¡ ÿ·» «·„”«⁄œ…"
 errGetingScreenNo(1) = "1187-Error while getting screen set no for main category " & mainCategoryCode & " sub category   " & subCategoryCode & "  Please call SUPPORT"
 errAtleastOneIdReqd(0) = "1188-ÌÃ» «œŒ«· —ﬁ„ »ÿ«ﬁ… Ê«Õœ… ⁄·Ï «·«ﬁ· .. ·ÿ›« «÷€ÿ ENTER"
 errAtleastOneIdReqd(1) = "1188-Atleast one Id should be entered..please enter.."
 errSpaceCertOfBirthNo(0) = "1189-‘Â«œ… «·Ê·«œ… ÌÃ» «‰  œŒ· ·Â–« «· ’‰Ì› .. ·ÿ›« «÷€ÿ ENTER"
 errSpaceCertOfBirthNo(1) = "1189-Certificate of Birth no should be entered for this category.. Please enter.."
 errIdNotFound(0) = "1190-»ÿ«ﬁ… «·„›Ê÷ »«· ÊﬁÌ⁄ €Ì— „œŒ·….. «·—Ã«¡ «œŒ«· „⁄·Ê„«  «·»ÿ«ﬁ…"
 errIdNotFound(1) = "1190-Signatory Id does not exist.. Please enter id information"
 errSignatoryNotFound(0) = "1191- ›«’Ì· «·„›Ê÷ »«· ÊﬁÌ⁄ €Ì— „ÊÃÊœ…..«·—Ã«¡ «· «ﬂœ"
 errSignatoryNotFound(1) = "1191-Signatory detail not found.. Please check"
 errOwnerNotFound(0) = "1192- ›«’Ì· «·„«·ﬂ €Ì— „ÊÃÊœ… .. «·—Ã«¡ «· «ﬂœ"
 errOwnerNotFound(1) = "1192-Owner detail not found.. Please check"
 errSpacePurposeOfAccount(0) = "1193-«·€—÷ „‰ › Õ «·Õ”«» ·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ ›—«€« .. ·ÿ›« «÷€ÿ ENTER"
 errSpacePurposeOfAccount(1) = "1193-Purpose of account cannot be spaces..Please enter.."
 errSpaceShareHolding(0) = "1194-‰”»… «·„”«Â„… ÌÃ» «‰  œŒ· .. ·ÿ›« «÷€ÿ ENTER"
 errSpaceShareHolding(1) = "1194-Share holding percentage should be entered.. Please enter"
 errSpaceDC(0) = "1195-ÌÃ» «œŒ«· —ﬁ„ «·ÂÊÌ… «·œ»·Ê„«”Ì… .. ·ÿ›« «÷€ÿ ENTER"
 errSpaceDC(1) = "1195-Diplomatic card number should be entered..Please enter.."
 errSpaceContract(0) = "1196-ÌÃ» «œŒ«· —ﬁ„ «·⁄ﬁœ .. ·ÿ›« «÷€ÿ ENTER"
 errSpaceContract(1) = "1196-Contract number should be entered.. Please enter.."
 errLogoffForChangeLang(0) = "1197-«·—Ã«¡ «·Œ—ÊÃ Ê«·œŒÊ· À«‰Ì… ·„‘«Âœ… «··€… «·„ÿ·Ê»…"
 errLogoffForChangeLang(1) = "1197-Please logoff and login again to get the new screen langugage"
 errInvalidMainCategory(0) = "1198-«· ’‰Ì› «·—∆Ì”Ì Œÿ√..«·—Ã«¡ «· «ﬂœ"
 errInvalidMainCategory(1) = "1198-Invalid main category .. please check ..."
 errInvalidSubCategory(0) = "1199-«· ’‰Ì› «·›—⁄Ì Œÿ√ ““ «·—Ã«¡ «· «ﬂœ"
 errInvalidSubCategory(1) = "1199-Invalid sub category .. please check ..."
 errSpaceLicNo(0) = "1200-—ﬁ„ «·—Œ’… ÌÃ» «‰ ÌœŒ· .. ·ÿ›« «÷€ÿ ENTER "
 errSpaceLicNo(1) = "1200-License number should be entered.. please enter.."
 errOnlyIdIqamaAllowed(0) = "1201-ÂÊÌ… «·„›Ê÷ »«· ÊﬁÌ⁄ ÌÃ» «‰  ﬂÊ‰ »ÿ«ﬁ… «Ê √ﬁ«„… .. «·—Ã«¡ «· «ﬂœ"
 errOnlyIdIqamaAllowed(1) = "1201-Signatory Id should only be Iqama or Saudi Id ..Please check.."
 errOnlyPpAllowed(0) = "1202-ÂÊÌ… «·„›Ê÷ »«· ÊﬁÌ⁄ ÌÃ» «‰  ﬂÊ‰ ÃÊ«“ ”›— ›ﬁÿ..«·—Ã«¡ «· «ﬂœ"
 errOnlyPpAllowed(1) = "1202-Signatory Id should only be Passport ..Please check.."
 errOnlyManagerCashier(0) = "1203-‰Ê⁄ «·„«·ﬂ ÌÃ» «‰ ÌﬂÊ‰ „œÌ— «Ê «„Ì‰ ’‰œÊﬁ ..«·—Ã«¡ «· «ﬂœ"
 errOnlyManagerCashier(1) = "1203-Owner type should be Manager or Cashier..Please check.."
 errOnlyInternalAccAllowed(0) = "1204-«·Õ”«»«  «·œ«Œ·Ì… ›ﬁÿ ÂÌ «·„”„ÊÕ… ·Â–« «· ’‰Ì›..«·—Ã«¡ «· «ﬂœ"
 errOnlyInternalAccAllowed(1) = "1204-Only internal accounts can be opened for this category..Please check.."
 errSpaceDiplomaticPpNo(0) = "1205-ÌÃ» «œŒ«· —ﬁ„ «·ÃÊ«“ «·œ»·Ê„«”Ì ·Â–« «· ’‰Ì›.. «·—Ã«¡ «· «ﬂœ"
 errSpaceDiplomaticPpNo(1) = "1205-Diplomatic passport number should be entered for this category..Please enter.."
 errSpecialRoleNeeded(0) = "1206-«·Ê÷⁄ ⁄‰œ ”«„« €Ì— „ Õ—ﬂ..·« Ì„ﬂ‰  ⁄œÌ· «·Ê÷⁄ «·« ⁄‰ ÿ—Ìﬁ «·«œ«—Â «·⁄«„…"
 errSpecialRoleNeeded(1) = "1206-Sama Status is DORMANT; Only Head office can update Account status .."
 errSpaceAccStatus(0) = "1207-Õ«·… «·Õ”«» ·« Ì„ﬂ‰ «‰  ﬂÊ‰ ›—«€«..«÷€ÿ ENTER"
 errSpaceAccStatus(1) = "1207-Account status cannot be spaces; please enter.."
 errInvalidAcctStatus(0) = "1208-Œÿ√ ›Ì Õ«·… Ê÷⁄ «·Õ”«»..«·—Ã«¡ «œŒ«· Õ«·… ’ÕÌÕ… √Ê «Œ — «·„‰«”» „‰ «·ﬁ«∆„…"
 errInvalidAcctStatus(1) = "1208-Invalid Account status; Please enter a valid account status or select from the list"
 errSpaceEmployerInfo(0) = "1209-„⁄·Ê„«  ’«Õ» «·⁄„· ÌÃ» «‰  œŒ· ·„ÊŸ›«  «·œÊ·… ..·ÿ›« «÷€ÿ ENTER"
 errSpaceEmployerInfo(1) = "1209-Employer Information should be entered for female-government staffs..Please enter"
 errTotalPercNot100(0) = "1210-‰”»… «·„”«Â„… ÌÃ» «‰  ﬂÊ‰ „∆… »«·„∆… ..«·—Ã«¡ «· «ﬂœ"
 errTotalPercNot100(1) = "1210-Total Share holding percentage should be 100...Please check.."
 errSelectMainCategoryFirst(0) = "1211-ÌÃ» «Œ Ì«— «· ’‰Ì› «·—∆Ì”Ì ﬁ»· «Œ Ì«— «· ’‰Ì› «·›—⁄Ì"
 errSelectMainCategoryFirst(1) = "1211-Main Category should be selected first before selecting sub category..."
 errSpaceDisableReason(0) = "1212-ÌÃ» «œŒ«· ”»» ⁄œ„ ’·«ÕÌ… «·„›Ê÷ »«· ÊﬁÌ⁄.. ·ÿ›« «÷€ÿ ENTER"
 errSpaceDisableReason(1) = "1212-Signatory Disable reason should be entered.. Please enter..."
 errNoSamaAuthEntered(0) = "1213-„Ê«›ﬁ… ”«„« «·«Ã»«—Ì… €Ì— „ Ê›—Â ·Â–« «·⁄„Ì·"
 errNoSamaAuthEntered(1) = "1213-Mandatory SAMA approval not found for this customer.."
 errNonSaudiSignatoryFound(0) = "1214-«·„›Ê÷ »«· ÊﬁÌ⁄ €Ì— ”⁄ÊœÌ ·‘—ﬂ… ›—œÌ… „ÊÃÊœ"
 errNonSaudiSignatoryFound(1) = "1214-Non-saudi signatory found in One man ownership company..."
 errAlreadySameLanguage(0) = "1215-«·„” Œœ„ Ì” Œœ„ ‰›” «··€… «’·« ..«·—Ã«¡ «· «ﬂœ"
 errAlreadySameLanguage(1) = "1215-User already having the same language..Please check.."
 errPersonalReferenceNotFound(0) = "1216-«·„⁄—› «·‘Œ’Ì ÌÃ» «‰ Ì÷«›..«·—Ã«¡ «·—ÃÊ⁄ «·Ï «·’›Õ… «·”«»ﬁ… ··«÷«›…"
 errPersonalReferenceNotFound(1) = "1216-Personal reference should be added..Please go to previous page and add.."
 errLegalRepNotFound(0) = "1217-«·„„À· «·ﬁ«‰Ê‰Ì ÌÃ» «‰ Ì÷«› ·Â–« «·⁄„Ì·..«·—Ã«¡ «·—ÃÊ⁄ «·Ï «·’›Õ… «·”«»ﬁ… ··«÷«›…"
 errLegalRepNotFound(1) = "1217-Legal representative should be added for this customer; please go to previous page and add.."
 errFosterParentNotFound(0) = "1218-«·ﬁ—Ì» «·Ê’Ì ÌÃ» «‰ Ì÷«› ·Â–« «·⁄„Ì· .. «·—Ã«¡ «·—ÃÊ⁄ «·Ï «·’›Õ… «·”«»ﬁ… ··«÷«›…"
 errFosterParentNotFound(1) = "1218-Foster parent should be added for this customer; please go to previous page and add.."
 errGuardianNotFound(0) = "1219-„⁄·Ê„«  «·Ê·Ì ÌÃ» «‰  ÷«› ·Â–« «·⁄„Ì· ..«·—Ã«¡ «·—ÃÊ⁄ ··’›Õ… «·”«»ﬁ… ··«÷«›…"
 errGuardianNotFound(1) = "1219-Guardian Info should be added for this customer;please go to previous page and add.."
 errInvalidIdType(0) = "1220-‰Ê⁄ «·ÂÊÌ… «·„œŒ· €Ì— ’ÕÌÕ ..«·—Ã«¡ «· «ﬂœ"
 errInvalidIdType(1) = "1220-Invalid Id Type selected.. Please check.."
 errOneReferenceReqd(0) = "1221-ÌÃ» «œŒ«· „⁄—› Ê«Õœ ⁄·Ï «·«ﬁ· ..«·—Ã«¡ «·«œŒ«·"
 errOneReferenceReqd(1) = "1221-Atleast one reference should be selected..please select"
 errOwnerRecordNotFound(0) = "1222-ÌÃ» «œŒ«· »Ì«‰«  «·„«·ﬂ ..«·—Ã«¡ «· ‰›Ì–"
 errOwnerRecordNotFound(1) = "1222-Owner Information should be entered..Please enter and try again"
 errExpiryDateLessThanToday(0) = "1223- «—ÌŒ «·«‰ Â«¡ »Ã» «‰ ÌﬂÊ‰ «ﬂ»— „‰ «· «—ÌŒ «·Õ«·Ì «⁄œ «·«œŒ«·"
 errExpiryDateLessThanToday(1) = "1223-Expiry Date should be greater than current date.. Please check .."
 errAtleasetOneReferenceReqd(0) = "1224-ÌÃ» «œŒ«· „⁄·Ê„«  «·„—Ã⁄ «·‘Œ’Ì ·Â–… «· ’‰Ì› .. √⁄œ «·«œŒ«·"
 errAtleasetOneReferenceReqd(1) = "1224-Atleast one reference information should be entered..Please enter.."
 errAllFourNameReqd(0) = "1225-«·—Ã«¡ ﬂ «»… «·«—»⁄ «”„«¡ ·Â–« «· ’‰Ì› .. √⁄œ «·«œŒ«·"
 errAllFourNameReqd(1) = "1225-All four names are mandatory for this category..please check.."
 errEitherCrOrLicMandatory(0) = "1226-ÌÃ» «œŒ«· —ﬁ„ «· —ŒÌ’ «· Ã«—Ì «Ê «·—Œ’…..«⁄œ «·«œŒ«·"
 errEitherCrOrLicMandatory(1) = "1226-Either CR No or Lic number should be mandatory for this category..Please check"
 errAtleastOneSignatoryNeeded(0) = "1227-ÌÃ» «÷«›… «Õœ «·„›Ê÷Ì‰ »«· ÊﬁÌ⁄ .. «⁄œ «·«œŒ«·"
 errAtleastOneSignatoryNeeded(1) = "1227-Atleast one signatory should be entered.. please check.."
 errSearchNotCompleted(0) = "1228-««·Êﬁ  «·„Õœœ ·⁄„·Ì… «·»ÕÀ «‰ ÂÏ ..«·»ÕÀ ·„ Ìﬂ „· "
 errSearchNotCompleted(1) = "1228-Search is not complete; Could not be searched within stipulated time.."
 errAtleastOneJointNeeded(0) = "1229-ÌÃ» «œŒ«· „⁄·Ê„«  «·Õ”«» «·„‘ —ﬂ ... «⁄œ «·«œŒ«·"
 errAtleastOneJointNeeded(1) = "1229-Atleast one joint account information should be entered for joint account..Please check"
 errCompactControlDatabase(0) = "1230-«·—Ã«¡ «·«‰ Ÿ«— Ã«—Ì œ„Ã ﬁ«⁄œ… «·»Ì«‰«  «·„Õ·Ì…"
 errCompactControlDatabase(1) = "1230-Please wait..Compacting Control Database..."
 errCompactTransDatabase(0) = "1231-«·—Ã«¡ «·«‰ Ÿ«— Ã«—Ì œ„Ã Õ—ﬂ«  ﬁ«⁄œ… «·»Ì«‰« "
 errCompactTransDatabase(1) = "1231-Please wait..Compacting Transaction Database..."
 errCompactSuccessful(0) = "1232- ‹„ »‰Ã«Õ ’Ì«‰… ﬁ«⁄œ… «·»Ì«‰«  "
 errCompactSuccessful(1) = "1232-Successfully Compacted the databases..."
 errWeakTpinEntered(0) = "1233-ÌÃ» «‰ ·« ÌﬂÊ‰ «·—ﬁ„ «·”—Ì »Â–Â «·”ÂÊ·… ...√⁄œ «·«œŒ«· "
 errWeakTpinEntered(1) = "1233-Weak T-Pin entered.. Please enter a different T-Pin..."
 errATMPinSame(0) = "1234-«·—ﬁ„ «·—”Ì ··Â« › „ÿ«»ﬁ ··—ﬁ„ «·”—Ì ·»ÿ«ﬁ… «·’—«› ..√⁄œ «·«œŒ«·"
 errATMPinSame(1) = "1234-T-Pin matches with ATM card Pin; Please enter a different T-Pin..."
 errSpaceReason(0) = "1235-ÌÃ» «œŒ«· ”»»  €Ì— Õ«·… «·Õ”«» ..√⁄œ «·«œŒ«·"
 errSpaceReason(1) = "1235-Account status update reason should be entered..Please enter..."
 errIdAlreadySelected(0) = "1236-—ﬁ„ «·ÂÊÌ… „œŒ· „”»ﬁ« "
 errIdAlreadySelected(1) = "1236-Id Number already selected for No "
 errCannotSelectAgain(0) = "; ·«Ì„ﬂ‰ «œŒ«· —ﬁ„ «·ÂÊÌ… „—… À«‰Ì…"
 errCannotSelectAgain(1) = "; Hence , it cannot be selected again"
 errTPinSame(0) = "1237-«·—ﬁ„ «·”—Ì ·»ÿ«ﬁ… «·’—«› „ÿ«»ﬁ ··—ﬁ„ «·”—Ì ··Â« ›..√⁄œ «œŒ«· —ﬁ„ „Œ ·›"
 errTPinSame(1) = "1237-ATM Pin matches with Telephone Pin; Please enter a different ATM Pin..."
 errAListCustomer1(0) = "1238-«·⁄„Ì· „œ—Ã ⁄·Ï «·ﬁ«∆„…«·”Êœ«¡ (A) "
 errAListCustomer1(1) = "1238-Customer is found as Blacklist on A List "
 errSpaceSubscriptionNo(0) = "1239-·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ —ﬁ„ «·„‘ —ﬂ ›—«€..«·—Ã«¡ «·«œŒ«·"
 errSpaceSubscriptionNo(1) = "1239-Subscription number cannot be spaces...Please enter.."
 errSpaceCompanyId(0) = "1240-·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ «”„ «·‘—ﬂ… ›—«€..«·—Ã«¡ «·«œŒ«·"
 errSpaceCompanyId(1) = "1240-Company Id cannot be spaces.. Please enter.."
 errDormantAcc(0) = "1241-«‰  €Ì— „›Ê÷ ··œŒÊ· ⁄·Ï  ›«’Ì· «·Õ”«» «·€Ì— „ Õ—ﬂ"
 errDormantAcc(1) = "1241-You are not authorized to access the dormant account details..."
 dormantAccBalanceZero(0) = "1242-·« Ì„ﬂ‰ «·«” ›”«— ⁄‰ «·Õ”«»«  «·€Ì— „ Õ—ﬂ… Ì—ÃÌ  ÊÃÌÂ «·⁄„Ì· ·«” ﬂ„«· «Ã—«¡«   ‰‘Ìÿ «·Õ”«»"
 dormantAccBalanceZero(1) = "1242-Dormant Account ; Balance Enquiry Restricted.."
 errHighTollAvailable(0) = "1243-Œœ„… «·›Ê« Ì— «·„Ã“√Â „ Ê›—Â"
 errHighTollAvailable(1) = "1243-High Toll Bill also available;"
 errNotDormantAcc(0) = "1244-«·Õ”«» „ Õ—ﬂ «’·«"
 errNotDormantAcc(1) = "1244-Account is not dormant ; Activation not possible.."
 errUserAlreadyLogged(0) = "1245-«·„” Œœ„ Ì” Œœ„ «·‰Ÿ«„ ,,,"
 errUserAlreadyLogged(1) = "1245-User Already Logged in.. Cannot login again"
 errEnterPassword(0) = "1246-«⁄œ «œŒ«· ﬂ·„… «·”— ,,,"
 errEnterPassword(1) = "1246-Please enter your password to proceed..."
 errSpaceComments(0) = "1247-ÌÃ» ﬂ «»… ”»» «·—›÷ «⁄œ «·«œŒ«·"
 errSpaceComments(1) = "1247- Rejection Comments should be entered...Please enter it.."
 errUseExitButtonToExit(0) = "1248-«·⁄„·Ì… €Ì— „”„ÊÕ »Â« ,, «·—Ã«¡ «” Œœ«„ „› «Õ «·Œ—ÊÃ"
 errUseExitButtonToExit(1) = "1248-Operation not allowed. Please Use Exit Button to Quit the Application"
 errDeleteForManualBlockOnly(0) = "1249-Ì„ﬂ‰ ≈·€«¡ «·ÕÃ“ «·ÌœÊÌ ›ﬁÿ ...«·—Ã«¡ «· √ﬂœ"
 errDeleteForManualBlockOnly(1) = "1249-Only manual blocking can be deleted...Please check"
 errBlockOnlyForCc(0) = "1250-Ì„ﬂ‰  ⁄œÌ· ÕÃ“ «·»ÿ«ﬁ«  «·≈∆ „«‰Ì… ›ﬁÿ..«·—Ã«¡ «· √ﬂœ"
 errBlockOnlyForCc(1) = "1250-Only credit card blocking can be modified; please check.."
 errSpaceCardNo(0) = "1251-·« Ì„ﬂ‰ √‰ ÌﬂÊ‰ —ﬁ„ «·»ÿ«ﬁ… ›—«€ ..«·—Ã«¡ «·«œŒ«·"
 errSpaceCardNo(1) = "1251-Card number cannot be spaces... please enter..."
 errSpaceAmount(0) = "1252-·« Ì„ﬂ‰ √‰ ÌﬂÊ‰ «·„»·€ «·„ÕÃÊ“ ›—«€..«·—Ã«¡ «·«œŒ«·"
 errSpaceAmount(1) = "1252-Amount cannot be space...please enter....."
 errNegativeBlockAmt(0) = "1253-·« Ì„ﬂ‰ √‰ ÌﬂÊ‰ «·„»·€ «·„ÕÃÊ“ „œÌ‰«.. «·—Ã«¡ «·«œŒ«·"
 errNegativeBlockAmt(1) = "1253-Amount cannot be Negative...please check...."
 errNewBlockingSuccess(0) = "1254- „ «ﬂ „«· «·ÕÃ“ «·ÃœÌœ »‰Ã«Õ"
 errNewBlockingSuccess(1) = "1254-New blocking successfully completed.."
 errUpdBlockingSuccess(0) = "1255- „ «ﬂ „«·  ⁄œÌ· «·„»·€ «·„ÕÃÊ“ »‰Ã«Õ"
 errUpdBlockingSuccess(1) = "1255-Blocking has been amended successfully.."
 errDelBlockingSuccess(0) = "1256- „ ≈·€«¡ «·„»·€ «·„ÕÃÊ“ »‰Ã«Õ"
 errDelBlockingSuccess(1) = "1256-Blocking has been deleted successfully..."
 errCcAlreadyBlocked(0) = "1257-Â–Â «·»ÿ«ﬁ… „ÕÃÊ“Â √’·« "
 errCcAlreadyBlocked(1) = "1257-This credit card is already blocked with account  "
 errCcSettleAccNotMatch(0) = "1258-—ﬁ„ «·Õ”«» €Ì— „ÿ«»ﬁ ··Õ”«» «·„”œœ ⁄·Ï «·»ÿ«ﬁ…"
 errCcSettleAccNotMatch(1) = "1258-Selected a/c number does not match with settlement a/c number for the card  "
 errInvalidCcNo(0) = "1259-—ﬁ„ «·»ÿ«ﬁ… €Ì— ’ÕÌÕ..«·—Ã«¡ «· √ﬂœ"
 errInvalidCcNo(1) = "1259-Invalid credit card number...Please check"
 errCcNoLessThan16(0) = "1260-⁄œœ √—ﬁ«„ «·»ÿ«ﬁ…«·«∆ „«‰Ì… ÌÃ» √‰ ÌﬂÊ‰ 16 Õ—›«..«·—Ã«¡ «· √ﬂœ"
 errCcNoLessThan16(1) = "1260-Credit card number should be of 16 digits...Please check"
 errFoundInTlist(0) = "1261-Â1« «·⁄„Ì· „œ—Ã ⁄·Ì ·«∆Õ… «·«—Â«»-·„‘«Âœ… «· ›«’Ì· √Ê «·„ «»⁄…ø "
 errFoundInTlist(1) = "1261-This customer is found in T-LIST; Would you like to view details " & _
                      "or proceed further(Yes/No):"
 errSpaceName(0) = "1262-ÌÃ» «œŒ«· «·«”„ .. «·—Ã«¡ «· √ﬂœ  "
 errSpaceName(1) = "1262-Name cannot be spaces...Please check"
 errIncorrectMsg(0) = "1263-Œÿ√ ›Ì ÿ»Ì⁄… «·»ÕÀ"
 errIncorrectMsg(1) = "1263-Incorrect Message received from client"
 errNotFoundInTlist(0) = "1264-«·«”„ «·„ÿ·Ê» €Ì— „ÊÃÊœ"
 errNotFoundInTlist(1) = "1264-No match found in T-List for this Name...."
 errSodNoAssined(0) = "—ﬁ„ «·√„— «·À«»  ÂÊ  "
 errSodNoAssined(1) = "SOD number assigned is "
 errWannaChipCard(0) = "1265-Â·  —Ìœ «” Œ—«Ã »ÿ«ﬁÂ –ﬂÌÂ ( ‰⁄„ / ·« )ø"
 errWannaChipCard(1) = "1265-Do you want to generate Chip card for this (Yes/No)?"
 errZeroChqNo(0) = "1266-—ﬁ„ «·‘Ìﬂ ·« Ì„ﬂ‰ √‰ ÌﬂÊ‰ ’›—«..Õ«Ê· „—… √Œ—Ï"
 errZeroChqNo(1) = "1266-Cheque number cannot be ZERO.. Please enter again..."
 errFromChqNoGreater(0) = "1267-·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ »œ«Ì… «· ”·”· «ﬂ»— „‰ «·‰Â«ÌÂ.. Õ«Ê· „—… «Œ—Ï"
 errFromChqNoGreater(1) = "1267-From cheque number is greater than the To cheque number...Please check..."
 errAlreadyInFirstRec(0) = "1268-„ÊÃÊœ «’·« ›Ì «·Õﬁ· «·«Ê·"
 errAlreadyInFirstRec(1) = "1268-Already in first record"
 errAlreadyInLastRec(0) = "1269-„ÊÃÊœ «’·« ›Ì «·Õﬁ· «·«ŒÌ—"
 errAlreadyInLastRec(1) = "1269-Already in last record"
 errBillAlreadyExists(0) = "1270-—ﬁ„ «·‘—ﬂ… Ê«·„‘ —ﬂ „œŒ·Â √’·«"
 errBillAlreadyExists(1) = "1270-Biller Id & biller account already exists....."
 errError(0) = "Œÿ√"
 errError(1) = "Error"
 errRecdFromSADAD(0) = "Ê«—œ… „‰ ”œ«œ .. Õ«Ê· ·«Õﬁ«"
 errRecdFromSADAD(1) = "received from SADAD.. Please check and try again"
 errStartEndDate(0) = "1271- «—ÌŒ «·»œ«Ì… ÌÃ» «‰ ÌﬂÊ‰ «ﬂ»— „‰  «—ÌŒ «·‰Â«ÌÂ..Õ«Ê· „—… «Œ—Ï"
 errStartEndDate(1) = "1271-Start Date should be greater than the end date...Please Re-enter.."
 errPrivateBankingAcc(0) = "1272- „  ’›Ì— √—’œ… «·Õ”«»«  ·»⁄÷ «·⁄„·«¡ «·„ Õ›Ÿ ⁄·ÌÂ«;..«·—Ã«¡ „—«Ã⁄… „œÌ— «·Õ”«»"
 errPrivateBankingAcc(1) = "1272-Balances are made zero for enquiry restricted accounts;For further details, please contact Relationship Manager"
 errPBAccRestricted(0) = "1273-√‰  €Ì— „›Ê÷ ··œŒÊ· ⁄·Ï  ›«’Ì· «·Õ”«»«  "
 errPBAccRestricted(1) = "1273-Not authorized to access the account details of enquiry restricted branches ..."
 errManualBlockNotAllowed(0) = "1274-«· Õ›Ÿ ⁄·Ï «·Õ”«»«  „”„ÊÕ ›ﬁÿ ··«” «– 008°009°160"
 errManualBlockNotAllowed(1) = "1274-Manual account blocking is allowed only for 008 or 009 or 160 accounts.."
 errBlockedNotAllowed(0) = "1275-«·—’Ìœ „ÕÃÊ“ ·’«·Õ ›—⁄ «Œ— ° ·–«.. «· ⁄œÌ· Ê«·«·€«¡ ·Â–« «·Õ”«» „„‰Ê⁄"
 errBlockedNotAllowed(1) = "1275-Account is blocked by different branch; so, amendment/delete not allowed"
 errInvalidPayAccNo(0) = "1276-—ﬁ„ «·Õ”«» «·„—’œ ⁄·ÌÂ €Ì— ’ÕÌÕ.. «·—Ã«¡ «· «ﬂœ À„ «⁄œ «·„Õ«Ê·Â"
 errInvalidPayAccNo(1) = "1276-Invalid Pay account number ; please check & try again"
 errNumeralsNotAllowed(0) = "1277-«·«—ﬁ«„ €Ì— „”„ÊÕÂ .. Õ«Ê· ·«Õﬁ«"
 errNumeralsNotAllowed(1) = "1277-Numeric values not allowed .. Please try again.."
 errReturnMailRegisterSuccessful(0) = "1278- „  ”ÃÌ· «·»—Ìœ «·„” —Ã⁄ »‰Ã«Õ"
 errReturnMailRegisterSuccessful(1) = "1278-Returned mail registered successfully..."
 errSpaceRefNo(0) = "1279-—ﬁ„ «·„—Ã⁄ ·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ ›—«€« .. «·—Ã«¡ «· «ﬂœ"
 errSpaceRefNo(1) = "1279-Reference number cannot be spaces; please check..."
 errSpaceCustomerNo(0) = "1280-—ﬁ„ «·⁄„Ì· ·«Ì„ﬂ‰ «‰ ÌﬂÊ‰ ›—«€« .. «·—Ã«¡ «· «ﬂœ"
 errSpaceCustomerNo(1) = "1280-Customer number cannot be spaces; please check..."
 errOneOptionReqd(0) = "1281-ÌÃ» «Œ Ì«— «Õœ «·«Œ Ì«—« "
 errOneOptionReqd(1) = "1281-Either one of the action should be selected; please check.. "
 errSpaceReturnedReason(0) = "1282-ÌÃ»  ÕœÌœ ”»» «·«” —Ã«⁄.. Õ«Ê· ·«Õﬁ« "
 errSpaceReturnedReason(1) = "1282-Returned reason must be entered...Please re-enter and try again ..."
 errPending(0) = "„⁄·ﬁ"
 errPending(1) = "Pending"
 errAddrUpd(0) = " „  ÕœÌÀ «·⁄‰Ê«‰"
 errAddrUpd(1) = "Address Updated"
 errAddrNotUpd(0) = "·„ Ì „  ÕœÌÀ «·⁄‰Ê«‰"
 errAddrNotUpd(1) = "Address not updated"
 errCustNoReachable(0) = "·« Ì„ﬂ‰ «·Ê’Ê· ··⁄„Ì·"
 errCustNoReachable(1) = "Customer not reachable"
 errStmtDisabled(0) = "«·⁄„Ì· ·„ ÌÕ÷— ··›—⁄"
 errStmtDisabled(1) = "Statement disabled"
 errUnknown(0) = "€Ì— –·ﬂ"
 errUnknown(1) = "Unknown"
 errSpaceSaudiAddress(0) = "1283-ÌÃ» «œŒ«· ⁄‰Ê«‰ Ê«’· »«·ﬂ«„·.. «·—Ã«¡ «·«œŒ«·"
 errSpaceSaudiAddress(1) = "1283-All parts of GPS address should be entered.. Please enter"
 errDobGreaterThanToday(0) = "1284-ÌÃ» «‰ ·« ÌﬂÊ‰  «—ÌŒ «·„Ì·«œ «ﬂ»— „‰  «—ÌŒ «·ÌÊ„.. «·—Ã«¡ «· √ﬂœ Ê«⁄«œ… «·„Õ«Ê·…"
 errDobGreaterThanToday(1) = "1284-Date of birth cannot be greater than today.. Please check and try again"
 errDoeGreaterThanToday(0) = "1285- «—ÌŒ «· √”Ì” ÌÃ» «‰ ·« ÌﬂÊ‰ «ﬂ»— „‰  «—ÌŒ «·ÌÊ„.. «·—Ã«¡ «· √ﬂœ Ê«⁄«œ… «·„Õ«Ê·…"
 errDoeGreaterThanToday(1) = "1285-Date of establishment cannot be greater than today.. Please check and try again"
 errSpaceDeliveryGPSAddress(0) = "1286-ÌÃ» «œŒ«· ⁄‰Ê«‰  ”·Ì„ Ê«’· ⁄‰œ «Œ Ì«—Â"
 errSpaceDeliveryGPSAddress(1) = "1286-All parts of GPS Delivery Address must be entered when GPS is selected"
 errInvalidRefNo(0) = "1287-—ﬁ„ «·„—Ã⁄ €Ì— ’ÕÕ° —ﬁ„ «·„—Ã⁄ ÌÃ» «‰ ÌﬂÊ‰ 16 Œ«‰…"
 errInvalidRefNo(1) = "1287-Invalid reference number; Reference number should be 16 characters..."
 errPasswd8AccBalanceZero(0) = "1288-ÕÃ»  «·„⁄·Ê„«  ·ÊÃÊœ  Õ›Ÿ «·ÕÃ» "
 errPasswd8AccBalanceZero(1) = "1288-Balance is made ZERO for the accounts whose account status is 8"
 errEnqRestrictedAcc(0) = "1273-«·«” ›”«—«  „„‰Ê⁄… ·ÊÃÊœ  Õ›Ÿ —ﬁ„ 8"
 errEnqRestrictedAcc(1) = "1273-Account status is Enquiry restricted; Not authorized to access the transaction details ..."
 errZeroAmtTxnFailed(0) = "1274-·«Ì„ﬂ‰ «· ‰›Ì– ..„ÿ·Ê»  ÕœÌÀ «·Õ”«» „‰ ﬁ»· «·›—⁄"
 errZeroAmtTxnFailed(1) = "1274-Zero amount transaction failed; Branch requires to activate this dormant account..."
 errWannaPrintReport(0) = "Â·  —Ìœ ÿ»«⁄… «·ﬂ‘›  (Y/N )? : "
 errWannaPrintReport(1) = "Do you want to print the report (Y/N )? : "
 errSpaceNoOfChqBook(0) = "1275-ÌÃ» «œŒ«· ⁄œœ «·‘Ìﬂ«  «·„ÿ·Ê»… "
 errSpaceNoOfChqBook(1) = "1275-# of cheque book should be entered.. Please enter.."
 errOnlyIndividualCustAllowed(0) = "1276-€Ì— „”„ÊÕ »› Õ Õ”«»«  ·€Ì— «·«›—«œ ⁄‰ ÿ—Ìﬁ Â« › «·⁄—»Ì...Õ«Ê· ·«Õﬁ«"
 errOnlyIndividualCustAllowed(1) = "1276-Only Individual customer can be opened throgh phone banking...please try again.."
 errGeneralCustOpenNotAllowed(0) = "1277-·« Ì„ﬂ‰ «‰‘«¡ ”Ã· ··⁄„Ì· „‰ Œ·«· «·Â« › ·Â–« «· ’‰Ì› ... Õ«Ê· ·«Õﬁ«"
 errGeneralCustOpenNotAllowed(1) = "1277-Customer opening through phone not allowed for this category ... Please check .."
 errBranchCodeShouldBeDifferent(0) = "1278-«œŒ· —„“ ›—⁄ „Œ ·› ··⁄„Ì· ⁄‰œ › Õ ”Ã· „‰ Œ·«· «·Â« › «·„’—›Ì"
 errBranchCodeShouldBeDifferent(1) = "1278-Branch code should be different for the customer opening through phone"
 errPendingWithSupervisor(0) = "„⁄·ﬁ ·œÏ „‘—› «·›—⁄"
 errPendingWithSupervisor(1) = "Pending with branch supervisor"
 errPendingWithCso(0) = "„⁄·ﬁ ·œÏ „ÊŸ› Œœ„…«·⁄„·«¡ »«·›—⁄"
 errPendingWithCso(1) = "Pending with branch CSO"
 errRejected(0) = "„—›Ê÷ „‰ ﬁ»· „‘—› «·›—⁄"
 errRejected(1) = "Rejected by the branch supervisor"
 errCustomerNotYetVisted(0) = "·„ Ìﬁ„ «·⁄„Ì· »“Ì«—… «·›—⁄"
 errCustomerNotYetVisted(1) = "Customer not yet visited the branch"
 errRejectedByBranchCso(0) = "„—›Ê÷ »Ê«”ÿ… „ÊŸ› Œœ„… «·⁄„·«¡ »«·›—⁄"
 errRejectedByBranchCso(1) = "Rejected by Branch CSO"
 errEnteredByPBO(0) = "«œŒ· »Ê«”ÿ… «·Â« › «·„’—›Ì"
 errEnteredByPBO(1) = "Entered by PBO"
 errCompleted(0) = "«‰ Â«¡"
 errCompleted(1) = "Completed"
 errCardPrinterNotFound(0) = "1279-ÿ«»⁄… »ÿ«ﬁ«  «·’—«› €Ì— „ÊÃÊœ…...«·—Ã«¡ «· √ﬂœ Ê«·„Õ«Ê·… „—… √Œ—Ï"
 errCardPrinterNotFound(1) = "1279-ATM Card printer not found...Please check and retry your action"
 errSpaceTdLedger(0) = "1280-«·—Ã«¡ «œŒ«· —ﬁ„ «” «– «·Õ”«» «·„—»Êÿ "
 errSpaceTdLedger(1) = "1280-Time Deposit ledger code cannot be spaces.. Please enter..."
 errInvalidTdLedger(0) = "1281-—ﬁ„ «” «– «·Õ”«» «·„—»Êÿ Œÿ√ ...«·—Ã«¡ «· «ﬂœ"
 errInvalidTdLedger(1) = "1281-Invalid Time deposit ledger code..please check.."
 errSpaceTdDebitLedger(0) = "1282-·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ «” «– «·Õ”«» «·„”œœ ›—«€«...«·—Ã«¡ «· «ﬂœ"
 errSpaceTdDebitLedger(1) = "1282-TD Debit ledger cannot be spaces.. Please enter..."
 errInvalidTdDebitLedger(0) = "1283-—ﬁ„ «” «– «·Õ”«» «·„”œœ Œÿ√...«·—Ã«¡ «· «ﬂœ"
 errInvalidTdDebitLedger(1) = "1283-Invalid TD debit ledger..please check..."
 errSpaceTdCurrency(0) = "1284-ÌÃ» «œŒ«· —„“ ⁄„·… «·Õ”«» «·„—»Êÿ "
 errSpaceTdCurrency(1) = "1284-Time deposit currency code cannot be spaces..please enter.."
 errInvalidTdCurrency(0) = "1285-—„“ ⁄„·… «·Õ”«» «·„—»Êÿ Œÿ√ ...«·—Ã«¡ «· «ﬂœ"
 errInvalidTdCurrency(1) = "1285-Invalid TD currency code; please check..."
 errSpaceTenorType(0) = "1286-ÌÃ» «œŒ«· › —… «·—»ÿ  "
 errSpaceTenorType(1) = "1286-Tenor type cannot be spaces.. Please enter.. "
 errInvalidTenorType(0) = "1287-‰Ê⁄ › —… —»ÿ «·Õ”«» «·„—»Êÿ Œÿ√...«·—Ã«¡ «· «ﬂœ"
 errInvalidTenorType(1) = "1287-Invalid Tenor type ; please check... "
 errTenorGreaterThanZero(0) = "1288-ÌÃ» «‰  ﬂÊ‰ › —… «·—»ÿ «ﬂ»— „‰ ’›—"
 errTenorGreaterThanZero(1) = "1288-Tenor should be greater than 0 .. please check.."
 errSpaceTdDebitCurrency(0) = "1289-·« Ì„ﬂ‰ «‰  ﬂÊ‰ ⁄„·… «·Õ”«» «·„—»Êÿ ›—«€«...«·—Ã«¡ «· «ﬂœ"
 errSpaceTdDebitCurrency(1) = "1289-TD debit currency cannot be spaces.. please enter..."
 'errDepositPeriodMoreThan5Years(0) = "1290-·« Ì„ﬂ‰ «‰  ﬂÊ‰ › —… «·—»ÿ «·ﬂ»— „‰ 5 ”‰Ê« ...«·—Ã«¡ «· «ﬂœ"
 errDepositPeriodMoreThan5Years(0) = "1290-·« Ì„ﬂ‰ «‰  ﬂÊ‰ › —… «·—»ÿ «ﬂ»— „‰ "
 errDepositPeriodMoreThan5Years(1) = "1290-Deposit period cannot be more than "
 errTimeDepositAccNoAssigned(0) = "1291-—ﬁ„ «·Õ”«» «·„—»Êÿ «·ÃœÌœ ÂÊ "
 errTimeDepositAccNoAssigned(1) = "1291-Deposit Account assiged is  "
 errTdAlreadyAutoRenew(0) = "1292- ÃœÌœ › —… «·—»ÿ „⁄—›… ¬·Ì«...·« œ«⁄Ì ·· ÕœÌÀ ."
 errTdAlreadyAutoRenew(1) = "1292-Deposit already set as AUTO-RENEW ; not require an update.."
 errSpaceFundingIntRate(0) = "1293-·« Ì„ﬂ‰ «‰  ﬂÊ‰ ‰”»… «·›«∆œ… ··Õ”«» ›—«€«...«·—Ã«¡ «· «ﬂœ"
 errSpaceFundingIntRate(1) = "1293-Funding Interest rate cannot be spaces...Please check..."
 ''Modified by Mohit on 22-Feb-2007 as change reported by Arul
 'errDepositAmtLesser(0) = "1294-Ã» «‰ ÌﬂÊ‰ «·Õœ «·«œ‰Ï ··Õ”«» «·„—»Êÿ «ﬂ»— „‰  "
 'errDepositAmtLesser(1) = "1294-Minimum deposit amount should be greater than "
 errDepositAmtLesser(0) = "1294-ÌÃ» «‰ ÌﬂÊ‰ „»·€ «·ÊœÌ⁄… Ì”«ÊÌ «Ê «ﬂ»— „‰ "
 errDepositAmtLesser(1) = "1294-Deposit amount or its equivalent should be >= SAR "
 
 errTryOnceMore(0) = "«·—Ã«¡ «⁄«œ… «·„Õ«Ê·…  "
 errTryOnceMore(1) = "  Please try again"
 errInvalidDebitAccCurr(0) = "1295-·« Ì„ﬂ‰ «· ÕÊÌ· „‰ «·⁄„·… «·«Ã‰»Ì… ·⁄„·… «Ã‰»Ì… «Œ—Ï ...ÊÌ„ﬂ‰ «· ÕÊÌ· „‰ «·—Ì«· «·”⁄ÊœÌ ··⁄„·… «·«Ã‰»Ì… Ê »«·⁄ﬂ”  "
 errInvalidDebitAccCurr(1) = "1295-For FX deposit, payee account currency should either be in SAR currency or " & _
                             " in same FX currency "
 errNewTimeDeposit(0) = "ÊœÌ⁄… ÃœÌœ…"
 errNewTimeDeposit(1) = "New Time Deposit"
 errRenewTimeDeposit(0) = " ÃœÌœ ÊœÌ⁄…"
 errRenewTimeDeposit(1) = "Renew Time Deposit"
 errSpaceLedger(0) = "1296-«·—Ã«¡ «œŒ«· —„“ «·«” «–"
 errSpaceLedger(1) = "1296-Ledger cannot be space...please enter.."
 errInvalidLedger(0) = "1297-—ﬁ„ «·«” «– «·„œŒ· Œÿ¬...Õ«Ê· „—… «Œ—Ï"
 errInvalidLedger(1) = "1297-Invalid ledger code entered...please try again..."
 errDebitAccCurrNotSAR(0) = "1298-ÌÃ» «‰ ÌﬂÊ‰ —ﬁ„ «·Õ”«» «·„œÌ‰ ··ÊœÌ⁄… »«·—Ì«· »‰›” «·⁄„·… "
 errDebitAccCurrNotSAR(1) = "1298-For SAR deposit, debit account currency should be in SAR only..Please check"
 errInsufficientFund(0) = "1299-·« ÌÊÃœ —’Ìœ ﬂ«› »«·Õ”«» «·„œÌ‰...«·—Ã«¡ «· «ﬂœ "
 errInsufficientFund(1) = "1299-Insufficient fund available in customer debit account.. please check.. "
 ''Added by Mohit on 20-Feb-2007 as changed reported by Arul
 errSpaceValueDate(0) = "1300-ÌÃ» «œŒ«·  «—ÌŒ «·Õﬁ...«·—Ã«¡ «·«œŒ«·"
 errSpaceValueDate(1) = "1300-Value Date should be entered..Please enter"
 errValueDateGreaterThanToday(0) = "1301-·« Ì„ﬂ‰ «‰ ÌﬂÊ‰  «—ÌŒ «·Õﬁ «ﬂ»— „‰  «—ÌŒ «·ÌÊ„...«·—Ã«¡ «· «ﬂœ"
 errValueDateGreaterThanToday(1) = "1301-Value Date cannot be greater than today.. Please check and try again"
 ' Mohit till here
 errPressCreateToCompleteSignatoryUpd(0) = "1302-—Ã«¡..«÷€ÿ “— «÷«›… ·≈‰Â«¡ ⁄„·Ì…  ÕœÌÀ „›Ê÷ »«· ÊﬁÌ⁄"
 errPressCreateToCompleteSignatoryUpd(1) = "1302-Please press create button to complete the signatory update..."
 errSpaceVisaNo(0) = "1303-«·—Ã«¡ «œŒ«· —ﬁ„ «· √‘Ì—…"
 errSpaceVisaNo(1) = "1303-Visa number cannot be spaces.. please enter..."
 errStatusChangeNotAllowed(0) = "1304-Õ”»  ⁄·Ì„«  ”«„«° ·«Ì„ﬂ‰  €ÌÌ— Õ«·… «·Õ”«» ·Â–« «· ’‰Ì›"
 errStatusChangeNotAllowed(1) = "1304-As per SAMA, Account Status cannot be changed for this category accounts.."
 errDays(0) = "ÌÊ„"
 errDays(1) = "Day(s)"
 errSignatoryForOthers(0) = "1305-Â–« «·⁄„Ì· ·œÌÂ  ›ÊÌ÷ ·Ê«›œ „›Ê÷ «Ì÷« ·‘—ﬂ… √Œ—Ï"
 errSignatoryForOthers(1) = "1305-This customer is having an expatriate signatory who is a signatory for other companies also.."
 errCustAgeExceedLimit(0) = "1306-«·⁄„— ·« Ì„ﬂ‰ «‰ ÌﬂÊ‰ «ﬂ»— „‰ "
 errCustAgeExceedLimit(1) = "1306-Customer age cannot be more than "
 errYears(0) = "”‰…"
 errYears(1) = "years"
 errCardNotAllowedForThisCategory(0) = "1307-»ÿ«ﬁ… «·’—«› €Ì— „”„ÊÕ »Â« ·Â–« «· ’‰Ì›"
 errCardNotAllowedForThisCategory(1) = "1307-ATM card is not allowed for this category...please check..."
 errPilgrimRoleNeeded(0) = "1308-Õ«·… Õ”«» »⁄À«  «·ÕÃ Ì„ﬂ‰  €ÌÌ—Â »Ê«”ÿ… ’·«ÕÌ… Œ«’….. « ’· »«·„”«‰œ…"
 errPilgrimRoleNeeded(1) = "1308-Pilgrim accounts' status can be changed by special role.. please contact support"
 errCustomerNo(0) = "—ﬁ„ «·⁄„Ì·"
 errCustomerNo(1) = "Customer number"
 errCheckPendingList(0) = "«»ÕÀ ›Ì «·„⁄·ﬁ"
 errCheckPendingList(1) = "Check pending list"
 errSpaceAppRefNo(0) = "1309-ÌÃ» «œŒ«· —ﬁ„ «·„Ê«›ﬁ…"
 errSpaceAppRefNo(1) = "1309-Approver number cannot be spaces..please enter.."
 errSpaceSuccDeedNo(0) = "1310-ÌÃ» «œŒ«· —ﬁ„ ’ﬂ Õ’— «·≈—À"
 errSpaceSuccDeedNo(1) = "1310-Succession deed number cannot be spaces.. please enter..."
 errAtleaseOnHeirNeeded(0) = "1311-ÌÃ» «œŒ«· Ê—ÌÀ Ê«Õœ ⁄·Ï «·√ﬁ·"
 errAtleaseOnHeirNeeded(1) = "1311-Atleast one heir information should be added .. please enter..."
 errIssueDateGreaterThanToday(0) = "1312- «—ÌŒ «·«’œ«— ÌÃ» «‰ ·« ÌﬂÊ‰ «ﬂ»— „‰  «—ÌŒ «·ÌÊ„"
 errIssueDateGreaterThanToday(1) = "1312-Issue date cannot be greater than TODAY.. please check..."
 errUpdatedForSama(0) = "1313-«·Õ”«» „ÕÃÊ“ „‰ ﬁ»· ”«„«.. €ÌÌ— Õ«·… «·Õ”«» €Ì— „”„ÊÕ…∫ „„ﬂ‰  ‰‘ÌÿÂ „‰ Œ·«·  ÕœÌÀ »Ì«‰«  ÂÊÌ… «·⁄„Ì·"
 errUpdatedForSama(1) = "1313-Account is freezed for SAMA..not allowed to update the status; activation possible only through Customer ID details update"
 errAlreadySignatoryForOthers(0) = "1314-Â–« «·Ê«›œ «·„›Ê÷ ·œÌÂ  ›ÊÌ÷ ·‘—ﬂ… √Œ—Ï"
 errAlreadySignatoryForOthers(1) = "1314-This expatriate signatory is also a signatory for other company.."
 errOnlySplMemoAllowed(0) = "Ì„ﬂ‰ › Õ Â–« «·Õ”«» »‹ «” «– Œ«’ ›ﬁÿ ..«·—Ã«¡ «· √ﬂœ"
 errOnlySplMemoAllowed(1) = "1315-Only special memo can be opened for this account..please check  "
 errSplMemoNotConfigured(0) = "1316-«” «– Œ«’ Ì Õ«Ã ≈·Ï  ⁄—Ì›Â ·Â–« «· ’‰Ì›..« ’· »«·„”«‰œ…"
 errSplMemoNotConfigured(1) = "1316-Special memo needs to be configured for this category..please inform support"
 
'_______________
 errInvalidTransferPurpose(0) = "1317-«·€—÷ „‰ «·ÕÊ«·… €Ì— ’ÕÌÕ.. «·—Ã«¡ «· √ﬂœ"
 errInvalidTransferPurpose(1) = "1317-Invalid Transfer purpose .. please check.. "
 errInvalidApplicantCountryCode(0) = "1318-—„“ »·œ «·„—”· €Ì— ’ÕÌÕ.. «·—Ã«¡ «· √ﬂœ"
 errInvalidApplicantCountryCode(1) = "1318-Invalid applicant country code.. please check.. "
 errInvalidBenefCountryCode(0) = "1319-—„“ »·œ «·„” ›Ìœ €Ì— ’ÕÌÕ.. «·—Ã«¡ «· √ﬂœ"
 errInvalidBenefCountryCode(1) = "1319-Invalid Beneficiary country code... please check..."
 errSpaceApplicantAddr1(0) = "1320-⁄‰Ê«‰ «·„—”· 1 ÌÃ»  «‰ ÌœŒ·.. «·—Ã«¡ «·«œŒ«·"
 errSpaceApplicantAddr1(1) = "1320-Applicant address1 cannot be spaces.. please enter.."
 errSpaceBenefAccNo(0) = "1321-—ﬁ„ Õ”«» «·„” ›Ìœ ÌÃ» «‰ ·« ÌﬂÊ‰ ›«—€«..«·—Ã«¡ «·«œŒ«·"
 errSpaceBenefAccNo(1) = "1321-Beneficiary account number cannot be spaces.. please enter.."
 errSpaceBenefAddr1(0) = "1322-⁄‰Ê«‰ «·„” ›Ìœ 1 ÌÃ» «‰ ·« ÌﬂÊ‰ ›«—€«.. «·—Ã«¡ «·«œŒ«·"
 errSpaceBenefAddr1(1) = "1322-Beneficiary address1 cannot be spaces.. please enter.."
 errSpaceBankName(0) = "1323-»‰ﬂ «·„” ›Ìœ ÌÃ» «‰ ·« ÌﬂÊ‰ ›«—€«.. «·—Ã«¡ «·«œŒ«·"
 errSpaceBankName(1) = "1323-Beneficiary bank name cannot be spaces.. please enter.."
 errSpaceBankAddr1(0) = "1324-⁄‰Ê«‰ »‰ﬂ «·„” ›Ìœ 1 ÌÃ» «‰ ·« ÌﬂÊ‰ ›«—€«.. «·—Ã«¡ «·«œŒ«·"
 errSpaceBankAddr1(1) = "1324-Beneficiary bank address1 cannot be spaces.. please enter.. "
 errSpaceMessages(0) = "1325-«·—”«∆· ›«—€….. Â·  Êœ «·«” „—«— ? "
 errSpaceMessages(1) = "1325-Messages are left BLANK.. Would you like to continue ? "
 errInvalidIbanAcc(0) = "1326-—ﬁ„ Õ”«» «·«Ì»«‰ «·„œŒ· €Ì— ’ÕÌÕ ..«·—Ã«¡ «· «ﬂœ"
 errInvalidIbanAcc(1) = "1326-Provided IBAN account number is invalid.. please check.."
 errInvalidCharAtIban(0) = "1327-ÌÃ‰ «‰ ÌÕ ÊÌ «·«Ì»«‰ ⁄·Ï «—ﬁ«„ ÊÕ—Ê› „ÕœœÂ..«·«—ﬁ«„ «·Œ«’… €Ì— „”„ÊÕÂ"
 errInvalidCharAtIban(1) = "1327-IBAN should contain only alphanumeric values.. No special characters allowed..."
 errInvalidFirstTwoCharsInIban(0) = "1328-«·Õ—›Ì‰ «·«Ê· Ê«·À«‰Ì ·Õ”«» «·«Ì»«‰ ·« Ì„À· «Ì œÊ·…..«·—Ã«¡ «· «ﬂœ"
 errInvalidFirstTwoCharsInIban(1) = "1328-The First two characters in an IBAN should a valid country code..Please check"
 errInvalid3rd4thCharsInIban(0) = "1329-«·Õ—› «·À«·À Ê«·—«»⁄ „‰ Õ”«» «·«Ì»«‰ ÌÃ» «‰ ÌﬂÊ‰ —ﬁ„«..«·—Ã«¡ «· «ﬂœ"
 errInvalid3rd4thCharsInIban(1) = "1329-The third and fourth character of IBAN should be numeric character.. Please check"
 errPoOrZipCannotBeZero(0) = "1330-«·’‰œÊﬁ Ê«·—„“ «·»—ÌœÌ ÌÃ» «‰ ·« ÌﬂÊ‰ ’›—.. «·—Ã«¡ «· √ﬂœ"
 errPoOrZipCannotBeZero(1) = "1330-PO box & Zip code cannot be ZERO.. Please check..."
 errInvalidMobileNo(0) = "1331-—ﬁ„ «·ÃÊ«· ÌÕÃ» «‰ ·« Ìﬁ· ⁄‰ 8 «—ﬁ«„ ..«⁄œ «·«œŒ«·"
 errInvalidMobileNo(1) = "1331-Mobile number should contain atleast 8 characters.. Please check.."
 errSpacePaymentType(0) = "1332-‰Ê⁄ «· ”œÌœ ÌÃ» «‰ ·« ÌﬂÊ‰ ›«—€«..«·—Ã«¡ «·«Œ Ì«—"
 errSpacePaymentType(1) = "1332-Payment type cannot be spaces.. please select..."
 errSelectTxn(0) = "1333-«Œ — «·Õ—ﬂ… ·· ‰›Ì–"
 errSelectTxn(1) = "1333-Select a transaction to execute..."
 errEnterRefNoForReversal(0) = "«·—Ã«¡ «œŒ«· —ﬁ„ «·„—Ã⁄ ·⁄ﬂ” «·ﬁÌœ"
 errEnterRefNoForReversal(1) = "Please enter the reference number to reverse"
 errInvalidTxnSelected(0) = "1334-Õ—ﬂ… €Ì— ’ÕÌÕ… .. «·—Ã«¡ «· √ﬂœ"
 errInvalidTxnSelected(1) = "1334-Invalid transaction selected...Please check"
 errReversalPendingWithChiefTeller(0) = "1335-ÿ·» ⁄ﬂ” «·ﬁÌœ «—”· ··„‘—› ··„Ê«›ﬁ…"
 errReversalPendingWithChiefTeller(1) = "1335-Reversal request is forwarded to supervisor for approval"
 errReversalApproved(0) = "1336- „ «·„Ê«›ﬁ… ⁄·Ï ⁄ﬂ” «·ﬁÌœ∫ «·¬‰° »≈„ﬂ«‰ «· ·— «· ‰›Ì–"
 errReversalApproved(1) = "1336-Reversal approved ; Now, teller can proceed reversal"
 errReversalRejected(0) = "1337- „ —›÷ ⁄ﬂ” «·ﬁÌœ"
 errReversalRejected(1) = "1337-Reversal successfully rejected"
 errBillerIdNotDefined(0) = "1338-—ﬁ„ «·‘—ﬂ… €Ì— „⁄—› ›Ì ﬁ«⁄œ… «·»Ì«‰«  «·„Õ·Ì… .. «·—Ã«¡ «· ÕœÌÀ Ê«·„Õ«Ê·… À«‰Ì…"
 errBillerIdNotDefined(1) = "1338-Biller id is not defined in local Database...please refresh and try again.."
 errPrepaymentNotAllowed(0) = "1339-«·œ›⁄… «·„ﬁœ„… €Ì— „”„ÊÕ »Â« ·Â–Â «·‘—ﬂ… .. «·—Ã«¡ «· √ﬂœ"
 errPrepaymentNotAllowed(1) = "1339-Prepayment is not allowed for this biller id .. please check.."
 errBillAlreadyPaid(0) = "1340-Â–Â «·›« Ê—…  „ ”œ«œÂ« „”»ﬁ«..·«Ì„ﬂ‰ «· ”œÌœ „—… À«‰Ì…"
 errBillAlreadyPaid(1) = "1340-This bill is already paid....cannot pay again.."
 errSpaceDrAccNo(0) = "1341-—ﬁ„ Õ”«» «·„œÌ‰ ÌÃ» «‰ ·« ÌﬂÊ‰ ›«—€«..«·—Ã«¡ «· √ﬂœ"
 errSpaceDrAccNo(1) = "1341-Debit account number cannot be spaces...please check..."
 errInvalidSubsNo(0) = "1342-—ﬁ„ «·«‘ —«ﬂ «·„œŒ· €Ì— ’ÕÌÕ..«·—Ã«¡ «· √ﬂœ"
 errInvalidSubsNo(1) = "1342-Invalid subscription number entered...please check.."
 errReceiptPrinterNotFound(0) = "1343-ÿ«»⁄… «·«Ì’«· €Ì— „ÊÃÊœ…..«·—Ã«¡ «· √ﬂœ"
 errReceiptPrinterNotFound(1) = "1343-Receipt printer not found.. please check "
 errWannaPrintReceiptAgain(0) = "Â·  Êœ ÿ»«⁄… «·«Ì’«· À«‰Ì…ø(Y/N)"
 errWannaPrintReceiptAgain(1) = "Do you want to print the receipt again(Y/N)"
 errSigcapRetrieveNotStarted(0) = "1344-‰Ÿ«„ «· Ê«ﬁÌ⁄ €Ì— ‰‘ÿ..«·—Ã«¡  ‘€Ì· ‰Ÿ«„ «· Ê«ﬁÌ⁄ Ê«·„Õ«Ê·… „—… «Œ—Ï"
 errSigcapRetrieveNotStarted(1) = "1344-SIGCAP application not started...please start the SIGCAP and try again to retrieve.."
 errCashAccNotDefined(0) = "1345-—ﬁ„ Õ”«» «·‰ﬁœ €Ì— „⁄—› ·Â–Â «·‘—ﬂ…..«·—Ã«¡ «· √ﬂœ"
 errCashAccNotDefined(1) = "1345-Cash account number is not configured for this biller id ..Please check.."
 errReversalFailedBillNotPaid(0) = "1346-Â–Â «·›« Ê—… ·« Ì„ﬂ‰ ”œ«œÂ« »Ê«”ÿ… ‘—ﬂ… ”œ«œ∫ «·„»·€ Œ’„ „‰ «·Õ”«»∫ ⁄ﬂ” «·ﬁÌœ ›‘· "
 errReversalFailedBillNotPaid(1) = "1346-Bill could not be paid in SADAD; money is debited from the account; reversal failed "
 errTellerCashPositionNotOpen(0) = "1347-" & recvLoginMsg.bpUserId & "„—ﬂ“ «·⁄„·«  „€·ﬁ ÌÃ» › Õ «·⁄„·… ⁄·Ï ‰Ÿ«„ »—«‰‘ »Ê—"
 errTellerCashPositionNotOpen(1) = "1347-Teller  " & recvLoginMsg.bpUserId & "'s SAR cash position is not open ; please open cash position and try again...."
 errBillPaid(0) = "›« Ê— „”œœ…"
 errBillPaid(1) = "Bill Paid"
 errBillReversed(0) = "›« Ê—… „⁄ﬂÊ”… «·ﬁÌœ"
 errBillReversed(1) = "Bill Reversed"
 errBillTerminated(0) = "«·›« Ê—… „·€«Â"
 errBillTerminated(1) = "Bill Terminated"
 errCash(0) = "‰ﬁœ"
 errCash(1) = "CASH"
 errOnlyLocalBrnTxn(0) = "1348-«·Õ—ﬂ«  «·„‰›–… „‰ ›—⁄ﬂ ”Ê› Ì „ ÿ»«⁄ Â« ›Ì «· ﬁ—Ì—"
 errOnlyLocalBrnTxn(1) = "1348-Only transaction originated from your branch will be printed on the report"
 errTxnDoneByAnotherTeller(0) = "1349-«·Õ—ﬂ…  Œ’  ·— ¬Œ— ·« Ì„ﬂ‰ﬂ «·€«ƒÂ«"
 errTxnDoneByAnotherTeller(1) = "1349-This transaction is performed by different teller...Reversal not allowed"
 errYes(0) = "‰⁄„"
 errYes(1) = "Yes"
 errNo(0) = "·«"
 errNo(1) = "No"
 errOnlySarDrAcc(0) = "1350-«·Õ”«» «·„œÌ‰ ÌÃ» √‰ ÌﬂÊ‰ »«·—Ì«· «·”⁄ÊœÌ"
 errOnlySarDrAcc(1) = "1350-Only SAR account can be used as debit account"
 errReversalNotAllowed(0) = "1351-⁄ﬂ” «·Õ—ﬂ… „„‰Ê⁄ ›Ì Â–Â «·Õ«·…"
 errReversalNotAllowed(1) = "1351-Reversal Not allowed for this Payment type"
 errAmtGreaterThanZero(0) = "1352-„»·€ «·œ›⁄Â ÌﬂÊ‰ «ﬂ»— „‰ ’›—... «·—Ã«¡ «· √ﬂœ"
 errAmtGreaterThanZero(1) = "1352-Payment amount should be greater than zero.. please check.."
 errRatibiCardNotSelected(0) = "1353-ÌÃ» «Œ Ì«— »ÿ«ﬁ… —« »Ì ·«’œ«— »ÿ«ﬁ… —« »Ì ÃœÌœÂ.. «·—Ã«¡ «· «ﬂœ"
 errRatibiCardNotSelected(1) = "1353-Ratibi card should be selected to create a new RATIBI card..Please check.."
 errCustNoAlloted(0) = "—ﬁ„ «·⁄„Ì· :"
 errCustNoAlloted(1) = "Customer Number Alloted is :"
 'errIban(0) = "¬Ì»«‰"
 errIban(0) = "¬Ì»«‰"
 errIban(1) = "IBAN "
 errChequeBookNotAllowed(0) = "1354-«·‘Ìﬂ«  €Ì— „”„ÊÕ »Â« ·Â–« «· ’‰Ì›.. «·—Ã«¡ «· √ﬂœ"
 errChequeBookNotAllowed(1) = "1354-Cheque book request not allowed for this category.. Please check ..."
 errSpaceEmailAddress(0) = "1355-ÌÃ» «œŒ«· ⁄‰Ê«‰ «·»—Ìœ «·«·Ìﬂ —Ê‰Ì"
 errSpaceEmailAddress(1) = "1355-Email address cannot be spaces.. Please check..."
 errInvalidTenorPeriod(0) = "1356-› —… «·—»ÿ ·« ÌÃ» «‰  ﬂÊ‰ «ﬂ»— „‰ 99 ÌÊ„... Ì—Ã¬  €ÌÌ— › —… «·—»ÿ Ê«·„Õ«Ê·… À«‰Ì…"
 errInvalidTenorPeriod(1) = "1356-Tenor period should not be greater than 99 days... Please change tenor type and try again .."
 errChequeBookNotAllowedForThisMemo(0) = "1357-ÿ·» œ› — «·‘Ìﬂ«  €Ì— „”„ÊÕ ·Â–« «·«” «– ..«·—Ã«¡ «· «ﬂœ"
 errChequeBookNotAllowedForThisMemo(1) = "1357-Cheque book request not allowed for this memo ... Please check..."
 errBmNotice(0) = "1358-«” Œ—Ã  Â–Â «·„⁄·Ê„«  „‰ «·»‰ﬂ „«” — ⁄‰œ «· ÕÊÌ· Ê·Ì” „‰ ‰Ÿ«„ ›Ì‰ﬂ· «·„»«‘—"
 errBmNotice(1) = "1358-The information being fetched from BANKMASTER as on Cut-over Date; NOT FROM FINACLE "
 errInvalidSubAcc(0) = "1359-«œŒ· ¬Œ— 4 «—ﬁ«„ „‰ «·Õ”«»..."
 errInvalidSubAcc(1) = "1359-Enter the last 4 digits of accounts..."
End Sub
 
Public Sub populateHistStmtErrMsg()
 errNotAuthorisedForStaffAcc(0) = "9003-€Ì— „›Ê÷ ·ÿ»«⁄… ﬂ‘› Õ”«» „ÊŸ›"
 errNotAuthorisedForStaffAcc(1) = "9003-Not authorized to print the statement for the staff branch"
 errBranchCodeNot4Chars(0) = "9012-ÌÃ» «‰ ÌﬂÊ‰ —„“ «·›—⁄ 4 Œ«‰« ..›÷·« √⁄œ «·«œŒ«·"
 errBranchCodeNot4Chars(1) = "9012-Branch Code should be 4 characters..Please enter it again"
 errSpaceAccountNo(0) = "9013-·«Ì„ﬂ‰ «‰ ÌﬂÊ‰ —ﬁ„ «·Õ”«» ›—«€..›÷·« √œŒ· «·—ﬁ„..."
 errSpaceAccountNo(1) = "9013-Account number cannot be spaces...Please enter it..."
 errInvalidFromYear(0) = "9014-·« Ì„ﬂ‰ √‰ ÌﬂÊ‰ Õﬁ·  „‰ ”‰… ›—«€..›÷·« √œŒ· „‰ ”‰… ..."
 errInvalidFromYear(1) = "9014-From year cannot be blank...please enter it .."
 errInvalidFromMonth(0) = "9015-·« Ì„ﬂ‰ √‰ ÌﬂÊ‰ Õﬁ·  „‰ ‘Â— ›—«€..›÷·« √œŒ· „‰ ‘Â—"
 errInvalidFromMonth(1) = "9015-From month cannot be blank...please enter it .."
 errInvalidToYear(0) = "9016-·« Ì„ﬂ‰ √‰ ÌﬂÊ‰ Õﬁ· «·Ï ”‰… ›—«€..›÷·« «œŒ· «·Ï ”‰…"
 errInvalidToYear(1) = "9016-To year cannot be blank...please enter it .."
 errInvalidToMonth(0) = "9017-·« Ì„ﬂ‰ √‰ ÌﬂÊ‰ Õﬁ· «·Ï ‘Â— ›—«€ ..›÷·« √œŒ· «·Ï ‘Â—"
 errInvalidToMonth(1) = "9017-To month cannot be blank...please enter it .."
' errClosingFile(0) = "9018-Œÿ√  " & status & " √À‰«¡ «€·«ﬁ «·„·› "
' errClosingFile(1) = "9018-Error  " & status & " while closing the file "
' errFileOpen(0) = "9019-„·›  " & fileName & "  ·« Ì„ﬂ‰ › ÕÂ"
' errFileOpen(1) = "9019-File  " & fileName & "  could not be opened.."
 errNoReportFound(0) = "9020-·« ÌÊÃœ ﬂ‘› ··Õ”«» «·„–ﬂÊ— ⁄‰ «·› —Â «·„ÿ·Ê»Â"
 errNoReportFound(1) = "9020-No report found for this account for a given period"
 errNoArabicPgm(0) = "9021-»—‰«„Ã «· ÕÊÌ· ··⁄—»ÌÂ €Ì— „ÊÃÊœ  " & utilPath & " ›Ì «·»«À.. «·—Ã«¡ «·« ’«· »„«·„”«‰œÂ"
 errNoArabicPgm(1) = "9021-Arabic Converion program(a2w.exe) is not available in  " & utilPath & " directory..Please call support.."
 errNoAnalysisFile(0) = "9022-„·› «· Õ·Ì· €Ì— „ÊÃÊœ ...«·—Ã«¡ «·« ’«· »«·„”«‰œÂ "
 errNoAnalysisFile(1) = "9022-Analysis file (prtall.$a!) not available.. Please call support "
 errNoHoStmtFile(0) = "9023-ﬂ‘› «·Õ”«» ⁄Ì— „ÊÃÊœ ›Ì  " & reqPath & " «·»«À .. «·—Ã«¡ «·« ’«· »«·„”«‰œÂ"
 errNoHoStmtFile(1) = "9023-Statement file (prtall.$s!) not available in " & reqPath & " directory..Please call support .."
 errNoAnalysisPgm(0) = "9024-»—‰«„Ã «· Õ·Ì· €Ì— „ÊÃÊœ " & utilPath & " ›Ì «·»«À.. «·—Ã«¡ «·« ’«· »„«·„”«‰œÂ"
 errNoAnalysisPgm(1) = "9024-Analysis program is not available in " & utilPath & " directory..Please call support.."
 errWaitConv(0) = "9025-«·—Ã«¡ «·«‰Ÿ«—..Ì „  Õ„Ì· «·«’œ«— «·⁄—»Ì"
 errWaitConv(1) = "9025-Please wait...arabic conversion is in progress...."
 errWaitAnalysis(0) = "9026-«·—Ã«¡ «·«‰ Ÿ«—..Ã«—Ì  ‰›Ì– «· Õ·Ì·"
 errWaitAnalysis(1) = "9026-Please wait...analysis is in progress...."
 errAnalysisSuccess(0) = "9027-«‰ ÂÏ «· Õ·Ì· »‰Ã«Õ.."
 errAnalysisSuccess(1) = "9027-Analysis successfully completed.."
 errFTPsuccess(0) = "9028- „ ≈—”«· «·„·› »‰Ã«Õ"
 errFTPsuccess(1) = "9028-File was transferred successfully"
 errFileSize(0) = "ÕÃ„ «·„·› : "
 errFileSize(1) = "File size : "
 errReady(0) = "Ã«Â“ ··≈—”«·"
 errReady(1) = "Ready"
 errQuitFromFtp(0) = "Œ—ÊÃ „‰ ‰«›–… «·≈—”«· ..!"
 errQuitFromFtp(1) = "Quit from the FTP program..!"
 errBranchMoreThan3Digits(0) = "9029-ÌÃ» √‰ ÌﬂÊ‰ —„“ «·›—⁄ À·«À… √—ﬁ«„ ›ﬁÿ"
 errBranchMoreThan3Digits(1) = "9029-Only 3 digits Branch Code is allowed!"
 errEnterBranchCode(0) = "√œŒ· —„“ «·›—⁄!"
 errEnterBranchCode(1) = "Enter branch code here!"
 errStartSendingFile(0) = "»œ¡ ≈—”«· «·„·› .."
 errStartSendingFile(1) = "Start sending files now.."
 errFTPfailure(0) = "9030-Œÿ√ ›Ì ≈—”«· «·„·› " & vbCrLf & "«·—Ã«¡ «·—ÃÊ⁄ ≈·Ï   " & vbCrLf & " logsfile.log ›Ì c:\logs " & vbCrLf & " √Ê «·÷€ÿ ⁄·Ï „Ê«›ﬁ" & vbCrLf & "·≈” ⁄—«÷ Õ«·… «·≈—”«· "
 errFTPfailure(1) = "9030-File Transfer ended with error." & vbCrLf & "Please see logsfile.log in c:\logs OR click OK" & vbCrLf & "to see the last FTP opertation status"
 errKb(0) = "ﬂ.»"
 errKb(1) = "Kb"
 errDriveNotMapped(0) = "€Ì— „ÊÃÊœ..«·”Ì—›— ⁄Ì— „⁄—› .. «·—Ã«¡ «· «ﬂœ À„ «⁄œ «·„Õ«Ê·Â"
 errDriveNotMapped(1) = "not found; may be the drive is not mapped; Please Check & re-try"
 errHistStmtNotAllowed(0) = "9031-—ﬁ„ «·Õ”«» „› ÊÕ √’·« ⁄·Ï «·»«‰ﬂ „«” — ° Ì„ﬂ‰ ·Â–Â «·ÊŸÌ›Â" & _
                            " Œ·ﬁ ﬂ‘› Õ”«» ﬁœÌ„ ··Õ”«»«  «·„€·ﬁÂ ° Ê·« Ì„ﬂ‰ Œ·ﬁ ﬂ‘› Õ”«» ﬁœÌ„ " & _
                            "„‰ Œ·«· Â–Â «·ÊŸÌ›Â"
 errHistStmtNotAllowed(1) = "9031-Account number exists in Bankmaster; This option is avaiable " & _
                            "to generate historical statements for deleted accounts; hence, the " & _
                            "historical statements cannot be produced through this route"
 

End Sub
