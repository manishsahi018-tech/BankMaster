Attribute VB_Name = "globalVariables1"
Option Explicit

Public Type newQuickCustomerInfo
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
    idType As String * 1
    idIssuedAt As String * 20
    idDateType As String * 1
    idIssueDateH As String * 8
    idIssueDateG As String * 8
    idExpiryDateH As String * 8
    idExpiryDateG As String * 8
    langPref As String * 1
    nationality As String * 3
    titleCode As String * 2
    sexCode As String * 1
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
    altBranchCode As String * 4
    address1 As String * 30
    address2 As String * 30
    poBox As String * 10
    cityName As String * 20
    zipCode As String * 10
    country As String * 3
    currentAccInfo As String * 12
    electronIntlRequired As String * 1
    electronIntlName As String * 26
    cardType As String * 1
    supervisorComments As String * 200
    dobDateType As String * 1
    dobDateH As String * 8
    dobDateG As String * 8
    addressType As String * 1
    internalCustomer As String * 1
End Type


Public Type blockPendingListDetails
    userId As String
    dateTime As String
    cardNo As String
    bmAccNo As String
    action As String
    oldAmt  As String
    blockAmt As String
    supervisorComments As String
End Type

Public Type resMsgBlockPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As blockPendingListDetails
End Type

Public Type searchEngineDetails
    englishName As String
    arabicName As String
    idNo As String
    dobDetails As String
    placeOfBirth As String
    position As String
    miscInfo As String
    extractFlag As String
    sourceName As String
End Type

Public Type resMsgSearchEngine
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    foundInTlist As String
    noOfRecs As String
End Type

Public Type resMsgCheckCust
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
    existingCustomer As String
    existCustNo As String
    existCustName As String
    foundInTlist As String
    noOfRecs As String
    displayWarningMsg As String
End Type

Public Type reqMsgBillEnq
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    langInd As String * 1
    custNo As String * 7
    idType As String * 1
    idNo As String * 15
    subscriptionNo As String * 19
    companyId As String * 4
    newLangId As String * 5
    billNo As String * 19
    startDate As String * 8
    endDate As String * 8
    inclPayments As String * 1
    inclPaidBills As String * 1
End Type

Public Type resMsgSadadReversal
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    userId As String
    tellerId As String
    companyId As String
    subscriptionNo As String
    billNo As String
    langInd As String
    paymentType As String
    drAccNo As String
    billAmt As String
    transRefNo As String
    cashOrAcc As String
    preOrPostpaid As String
    custName As String
End Type

Public Type reqMsgSadadPayment
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    tellerId As String * 3
    custNo As String * 7
    idType As String * 1
    idNo As String * 15
    companyId As String * 4
    subscriptionNo As String * 19
    billNo As String * 19
    langId As String * 5
    paymentType As String * 4
    drAccNo As String * 14
    billAmt As String * 19
    transRefNo As String * 10
    cashOrAcc As String * 1
    preOrPostpaid As String * 1
    reversalFlag As String * 1
    appRejectFlag As String * 1
End Type


Public Type billStatusInfo
    billStatusCode As String
    bankPaymentId As String
    sadadPaymentId As String
    paymentStatusCode As String
    currentAmount As String
    effectiveDate As String
    exactPaymentReqd As String
    customerId As String
    customerType As String
    messageText As String
    billCategory As String
    serviceType As String
    billCycle As String
    billNumber As String
    billingAcct As String
    companyId As String
    amountDue As String
    billDueDate As String
    billOpenDate As String
    billCloseDate As String
    billExpiryDate As String
    billCheckDigit As String
    billRefInfo As String
End Type

Public Type resMsgBillEnq
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    langInd As String
    statusCode As String
    errorCode As String
    text As String
    recordCount As String
    billInfo(100) As billStatusInfo
End Type

Public Type billerInfo
    billerAcct As String * 19
    billerId As String * 3
    filler As String * 20
End Type

Public Type resMsgSadadPayment
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    transRefNo As String
    contraAccNo As String
    aNarrative1 As String
    eNarrative1 As String
    custName As String
    customerBranch As String
    contraCustName As String
    transDate As String
    valueDate As String
    narrative3 As String
    msgStatusCode As String
    paymentStatusCode As String
End Type

Public Type reqMsgSadadProfile
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    langInd As String * 5
    idNo As String * 15
    idType As String * 1
    action As String * 1
    recordCount As String * 3
    details(100) As billerInfo
End Type

Public Type profileEnq
    isInProfile As String
    billingAcct As String
    billerId As String
    filler As String
End Type

Public Type resMsgSadadProfileEnq
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    langInd As String
    queryStatusCode As String
    customerId As String
    customerType As String
    recordCount As String
    details(100) As profileEnq
End Type

Public Type profileUpd
    updStatusCode As String
    isInProfile As String
    billingAcct As String
    billerId As String
    filler As String
End Type

Public Type resMsgSadadProfileUpd
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    langInd As String
    msgStatusCode As String
    customerId As String
    customerType As String
    recordCount As String
    details(100) As profileUpd
End Type

Public Type cardUpdateHistoryDetails
    branchCode As String
    userId As String
    dateTime As String
    pendingStatus As String
    supervisorId As String
    approvedDateTime As String
    requestType As String
End Type

Public Type resMsgCardUpdateHistory
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    cardNo As String
    filler As String
    details(20) As cardUpdateHistoryDetails
End Type

Public Type reqMsgBillEnqOld
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    langInd As String * 1
    custNo As String * 7
    idType As String * 1
    idNo As String * 15
    subscriptionNo As String * 19
    companyId As String * 4
End Type

Public Type billStatusInfoOld
    billRefInfo As String
    billStatusCode As String
    billAmountDue As String
    billExpiryDate As String
    paymentDueDate As String
    exactPaymentOnly As String
    billAmountPaid As String
    billPaymentStatus As String
    paymentDate As String
    bankTransactionId As String
    sadadTransactionId As String
    errorCode As String
End Type

Public Type resMsgBillEnqOld
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    subscriptionNo As String
    companyId As String
    billQueryStatusCode As String
    normalBillInfo As billStatusInfoOld
    highTollBillInfo As billStatusInfoOld
End Type

Public Type resMsgReturnMail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    refNo As String
    custNo As String
    productId As String
    custName As String
    custSegmentFlag As String
    address1 As String
    poBox As String
    cityName As String
    zipCode As String
    offTelNo As String
    homeTelNo As String
    faxNo As String
    mobileNo As String
    emailAddr As String
    dateGenerated As String
    branchCode As String
    returnedDate As String
    registeredUser As String
    registeredBranch As String
    returnedReason As String
    verificationActionDate As String
    verificationActionUser As String
    verificationActionBranch As String
    verificationActionTaken As String
    verificationUserRemarks As String
    callCentreActionDate As String
    callCentreActionUser As String
    callCentreActionBranch As String
    callCentreActionTaken As String
    callCentreUserRemarks As String
    deliveryDate As String
    deliveryUser As String
    deliveryBranch As String
    deliveryActionTaken As String
    deliveredToCustomer As String
    deliveryUserRemarks As String
    prevOccur As String
End Type

Public Type reqMsgReturnedMailPendingList
    msgLen As String * 6
    service As String * 2    ' AC is for returned mail pending list
    homeBranch As String * 4
    userId As String * 10
    lastRecCount As String * 5
    msgType As String * 1
    custNo As String * 7
    filler As String * 50
End Type


Public Type retMailPendingListDetails
    refNo As String
    custNo As String
    productId As String
    address1 As String
    poBox As String
    cityName  As String
    zipCode As String
    filler As String
End Type

Public Type resMsgRetMailPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As retMailPendingListDetails
End Type

Public Type retMailReportDetails
    refNo As String
    branchCode As String
    letterTypeDesc As String
    custNo As String
    custName As String
    productId As String
    filler As String
End Type

Public Type resMsgRetMailReport
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    reportDate As String
    branchCode As String
    filler As String
    details(20) As retMailReportDetails
End Type

Public Type newCustomerDetails
    custNo As String
    custBranchCode As String
    custName As String
    createdThroQuickScreen As String
    filler As String
End Type

Public Type resMsgNewCustomerReport
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    reportDate As String
    filler As String
    details(50) As newCustomerDetails
End Type

Public Type cardActivityDetails
    coreAccNo As String
    cardNo As String
    requestType As String
    requestStatus As String
    issueDate As String
    expireDate As String
    requestBranch As String
    requestUser As String
    nameOnProduct As String
    deliveryToBranchOrPO As String
    pendingStatus As String
    supervisorId As String
    filler As String
End Type

Public Type resMsgCardActivityReport
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    reportDate As String
    reportType As String
    filler As String
    details(50) As cardActivityDetails
End Type

Public Type pinActivityDetails
    coreAccNo As String
    cardNo As String
    requestType As String
    requestStatus As String
    issueDate As String
    expireDate As String
    customerBranch As String
    requestUser As String
    nameOnProduct As String
    deliveryToBranchOrPO As String
    pendingStatus As String
    supervisorId As String
    filler As String
End Type

Public Type resMsgPinActivityReport
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    reportDate As String
    reportType As String
    filler As String
    details(50) As pinActivityDetails
End Type

Public Type tpinActivityDetails
    userId As String
    dateTime As String
    newOrUpdate As String
    custNo As String
    supervisorId As String
    custBranchCode As String
    pendingStatus As String
    lastUpdateDateTime As String
    custName As String
    filler As String
End Type

Public Type resMsgTpinActivityReport
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    reportDate As String
    reportType As String
    filler As String
    details(50) As tpinActivityDetails
End Type

Public Type resMsgTimeDepositIntRateEnq
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    tdLedger As String
    tdCurrency As String
    tenorType As String
    tenor As String
    depositAmt As String
    debitAccNo As String
    intRate As String
    exRate As String
    maturityDate As String
    crBaseDays As String
    diffDays As String
    fxTolerance As String
    minIntRate As String
    maxIntRate As String
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    buyingRate As String
    sellingRate As String
    costRate As String
    valueDate As String
    toleranceValueDate As String
    PayAccCustName As String
End Type

Public Type newTimeDepositInfo
    msgLen As String * 6
    service As String * 2
    branchCode As String * 4
    userId   As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    newOrUpdate As String * 1
    acctNo As String * 14
    supervisorId As String * 10
    custNo As String * 7
    tdLedger As String * 3
    tdCurrency As String * 2
    debitAccNo As String * 14
    depositAmt As String * 14
    tenorType As String * 1
    tenorPeriod As String * 3
    fundIntRate As String * 9
    exRate As String * 14
    bmFundIntRate As String * 9
    bmExRate As String * 14
    maturityAmt As String * 14
    maturityDate As String * 8
    valueDate As String * 8             ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    overrideIntRate As String * 1
    overrideExRate As String * 1
    overrideValueDate As String * 1     ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    autoRenewFlag As String * 1
    diffDays As String * 3
    intAppln As String * 1
    payAccNo As String * 14
    debitAmt As String * 14             '' Added by Mohit on 20-Feb-2007 as change reported by Arul
    supervisorComments As String * 200
End Type

Public Type timeDepositPendingListDetails
    userId As String
    dateTime As String
    custNo As String
    accNo As String
    custName As String
    tdCurrency As String
    tdLedger As String
    newOrUpdate As String
    filler As String
End Type

Public Type resMsgTimeDepositPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As timeDepositPendingListDetails
End Type

Public Type resMsgTimeDepositDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    accNo As String
    custNo As String
    custName As String
    newOrUpdate As String
    supervisorId As String
    tdCurrency As String
    tdLedger As String
    tenorType As String
    tenor As String
    depositAmt As String
    debitAccNo As String
    fundIntRate As String
    exRate As String
    maturityAmt As String
    maturityDate As String
    valueDate As String '' Added by Mohit on 20-Feb-2007 as change reported by Arul
    overrideValueDate As String '' Added by Mohit on 20-Feb-2007 as change reported by Arul
    overrideExRate As String
    overrideIntRate As String
    orgFundIntRate As String
    orgExRate As String
    autoRenewFlag As String
    crBaseDays As String
    diffDays As String
    intAppln As String
    payAccNo As String
    debitAmt As String  '' Added by Mohit on 20-Feb-2007 as change reported by Arul
    supervisorComments As String
    PayAccCustName As String ' Added by arshad on 26th feb
End Type

Public Type resMsgTimeDepositApproval
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    appRejectFlag As String
    tdAccNo As String
    intRate As String
End Type

Public Type reqMsgSwiftTransferEnq
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    reqdDate As String * 8
    branchCode As String * 4
    lastRecCount As String * 5
    requestType As String * 1
End Type

Public Type reqMsgBranchSwiftTransfers
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    reqdDate As String * 8
    branchCode As String * 4
    lastRecCount As String * 5
End Type

Public Type reqMsgSwiftTransferPendingList
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    lastRecCount As String * 5
    activityFlag As String * 1
    transRefNo As String * 10
End Type

Public Type swiftTransferPendingListDetails
    userId As String
    dateTime As String
    transRefNo As String
    issueDate As String
    applicantName As String
    benefName As String
    branchCode As String
    filler As String
End Type

Public Type resMsgSwiftTransferPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As swiftTransferPendingListDetails
End Type

Public Type branchSwiftInfo
    branchCode As String
    transRefNo As String
    transDate As String
    valueDate As String
    drAccNo As String
    crAccNo As String
    transCurr As String
    transAmt As String
    senderName As String
    recordStatus As String
End Type

Public Type resMsgBranchSwiftTransfers
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As branchSwiftInfo
End Type

Public Type swiftTransferEnqInfo
    branchCode As String
    transRefNo As String
    transDate As String
    valueDate As String
    drAccNo As String
    transCurr As String
    transAmt As String
    senderName As String
    pendingStatus As String
    homeBranch As String
    csoUserId As String
    csoActionDateTime As String
    supervisorId As String
    approvedDateTime As String
End Type


Public Type resMsgSwiftTransferEnq
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    lastRecCount As String
    noOfRecs As String
    reqdDate As String
    requestType As String
    filler As String
    details(20) As swiftTransferEnqInfo
End Type

Public Type resMsgTransferDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    transRefNo As String
    accNo As String
    custName As String
    drAccNo As String
    issueDate As String
    valueDate As String
    transCurrCode As String
    transAmt As String
    paymentCurrCode As String
    paymentAmt As String
    transType As String
    paymentStatus As String
    applicantName As String
    benefName As String
    benefAddr1 As String
    benefAddr2 As String
    benefBank As String
    correspondentBank As String
    branchCode As String
    message1 As String
    message2 As String
    message3 As String
    message4 As String
    transferPurpose As String
    applicantAddr1 As String
    applicantAddr2 As String
    applicantAddr3 As String
    applicantCountryCode As String
    applicantIdNo As String
    ibanOrAccNo As String
    benefAccNo As String
    benefNationality As String
    benefIdNo As String
    benefAddr3 As String
    benefBankAddr1 As String
    benefBankAddr2 As String
    benefBankBICcode As String
    benefBankCountryCode As String
    exchangeRate As String
    bankSortCode As String
    supervisorComments As String
    supervisorId As String
End Type

Public Type newSwiftTransferInfo
    msgLen As String * 6
    service As String * 2
    branchCode As String * 4
    userId As String * 10
    dateTime As String * 14
    creationOrUpdate As String * 1
    bmUpdateStatus As String * 1
    transRefNo As String * 10
    issueDate As String * 8
    supervisorId As String * 10
    transferPurpose As String * 2
    applicantName As String * 35
    applicantAddr1 As String * 35
    applicantAddr2 As String * 35
    applicantIdNo As String * 15
    applicantAddr3 As String * 35
    applicantNationality As String * 3
    issueBranchCode As String * 4
    issueCountryCode As String * 3
    benefName As String * 30
    ibanOrAccNo As String * 1
    benefAccNo As String * 35
    benefBankName As String * 35
    benefAddr1 As String * 35
    benefAddr2 As String * 35
    benefAddr3 As String * 35
    benefCountryCode As String * 2
    benefBankAddr1 As String * 35
    benefBankAddr2 As String * 35
    bankSortCode As String * 35
    benefBankBIC As String * 11
    message1 As String * 35
    message2 As String * 35
    message3 As String * 35
    message4 As String * 35
    supervisorComments As String * 200
End Type

Public Type branchTransferDetails
    branchCode As String
    transRefNo As String
    transDate As String
    valueDate As String
    drAccNo As String
    crAccNo As String
    transCurr As String
    transAmt As String
    senderName As String
    filler As String
End Type

Public Type centralUnitDetails
    branchCode As String
    transRefNo As String
    transDate As String
    drAccNo As String
    crAccNo As String
    transCurr As String
    transAmt As String
    senderName As String
    supervisorId As String
    userId As String
    dateTime As String
    lastUpdateDateTime As String
    filler As String
End Type

Public Type resMsgSwitTransferReport
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    reportDate As String
    reportType As String
    filler As String
    branchDetails(50) As branchTransferDetails
    centreDetails(50) As centralUnitDetails
End Type

Public noOfHeir As String * 4
Public heirKeyBranch As String
Public heirKeyUserId As String
Public heirKeyDateTime As String
Public smartCardEnabled As Boolean
Public localChipCardEnable As Boolean
Public enableInternalCustOpen As Boolean
Public enableGeneralCustOpen As Boolean
Public enablePensionCustOpen As Boolean 'added by Mohit on 28-Nov-2006
Public enableFeeExclusionUpd As Boolean
Public enableGeneralSamaUpd As Boolean
Public swiftCentreBranch As Boolean
Public enableSadadProfile As Boolean
Public branchActionDateTime As String
Public tdTellerAction As Boolean
Public tdUpdateAction As Boolean
Public tdSupervisorAction As Boolean
Public tdSearchAction As Boolean
Public recvBlockPendingList As resMsgBlockPendingList
Public recvTimeDepositPendingList As resMsgTimeDepositPendingList
Public recvSearchEngineMsg As resMsgSearchEngine
Public recvCheckCustMsg As resMsgCheckCust
Public billEnquiryMsgOld As reqMsgBillEnqOld
Public recvBillEnqMsgOld As resMsgBillEnqOld
Public billEnquiryMsg As reqMsgBillEnq
Public billPaymentMsg As reqMsgSadadPayment
Public recvBillReversalMsg As resMsgSadadReversal
Public recvBillEnqMsg As resMsgBillEnq
Public recvBillPaymentMsg As resMsgSadadPayment
Public sadadProfileMsg As reqMsgSadadProfile
Public generalCustStatusEnqMsg As reqMsgGeneralCustStatusEnq
Public recvGeneralCustStatusEnqMsg As resMsgGeneralCustStatusEnq
Public heirsInfo As IndividualHeirInfo
Public heirInfo As IndividualSaudiReferenceInfo
Public brSwiftTransferEnqMsg As reqMsgBranchSwiftTransfers
Public swiftTransferEnqMsg As reqMsgSwiftTransferEnq
Public recvSwiftTranferEnqMsg As resMsgSwiftTransferEnq
Public recvBrSwiftTranferMsg As resMsgBranchSwiftTransfers
Public recvTransferDetail As resMsgTransferDetail
Public swiftTransferInfo As newSwiftTransferInfo
Public swiftTransferPendingList As reqMsgSwiftTransferPendingList
Public recvSwiftTransferPendingList As resMsgSwiftTransferPendingList
Public recvSwiftTransferBranchReport As resMsgSwitTransferReport
Public recvSwiftTransferCentreReport As resMsgSwitTransferReport

Public recvTimeDepositIntRateEnqMsg As resMsgTimeDepositIntRateEnq
Public timeDepositInfo As newTimeDepositInfo
Public recvTimeDepositDetailMsg As resMsgTimeDepositDetail
Public recvTimeDepositApprovalMsg As resMsgTimeDepositApproval
Public quickCustInfo As newQuickCustomerInfo

Public recvSadadProfileEnqMsg As resMsgSadadProfileEnq
Public recvSadadProfileUpdMsg As resMsgSadadProfileUpd
Public recvCardUpdateHistMsg As resMsgCardUpdateHistory
Public retMailPendingListMsg As reqMsgReturnedMailPendingList
Public recvRetMailPendingList As resMsgRetMailPendingList
Public recvRetMailReport As resMsgRetMailReport
Public recvNewCustomerReport As resMsgNewCustomerReport
Public recvCardActivityReport As resMsgCardActivityReport
Public recvPinActivityReport As resMsgPinActivityReport
Public recvTpinActivityReport As resMsgTpinActivityReport
Public searchEngineDetailMsg(50) As searchEngineDetails
Public recvMailDetailMsg As resMsgReturnMail
Public profileEnqAction As Boolean
Public profileAddAction As Boolean
Public profileDelAction As Boolean
Public frmStdOrdDetailCaption(40, 2) As String
Public frmStdOrdGridCaption(15, 2) As String
Public frmStdOrdPendingListCaption(10, 2) As String
Public frmStdOrdRejectionCaption(4, 2) As String
Public frmSadadMainCaption(15, 2) As String
Public frmSadadEnqCaption(20, 2) As String
Public frmSadadDetailCaption(35, 2) As String
Public frmSadadProfileEnqCaption(20, 2) As String
Public frmSadadProfileUpdCaption(20, 2) As String
Public frmCardUpdateHistoryCaption(15, 2) As String
Public frmGeneralCustStatusCaption(30, 2) As String

Public frmIndividualOthers1Caption(70, 2) As String
Public frmIndividualOthers2Caption(65, 2) As String
Public frmIndividualOthers3Caption(50, 2) As String
Public openUpdateDetailsCaption(15, 2) As String

Public frmIndividualSaudiCaption(110, 2) As String
Public frmIndividualSaudi2Caption(60, 2) As String
Public frmIndividualSaudiAcctInfoCaption(70, 2) As String
Public frmDocumentsCaption(15, 2) As String

Public frmJuristicMainCaption(60, 2) As String
Public frmJuristicDiplomatsCaption(40, 2) As String
Public frmJuristicNonResidentCaption(40, 2) As String
Public frmJuristicOwnerCaption(60, 2) As String
Public frmJuristicSignatoryCaption(35, 2) As String
Public frmJuristicAccountInfoCaption(45, 2) As String
Public frmQuickCustOpenCaption(60, 2) As String
Public frmQuickPenCustOpenCaption(60, 2) As String ' added by Mohit on 27-Nov-2006
Public frmBillEnquiryCaption(50, 2) As String
Public frmIdleTimePasswordCaption(15, 2) As String
Public frmTransferEnquiryCaption(30, 2) As String
Public frmTransferDetailCaption(30, 2) As String
Public frmBmTransEnqCaption(25, 2) As String
Public frmBmTransDetailCaption(25, 2) As String
Public frmBlockedAmtBreakupCaption(15, 2) As String
Public frmManualBlockCaption(15, 2) As String
Public frmBlockPendingListCaption(15, 2) As String
Public frmBlockRejectionCaption(10, 2) As String
Public frmSearchEngineCaption(15, 2) As String

Public frmMailDetailCaption(50, 2) As String
Public frmReturnedMailCaption(42, 2) As String
Public frmReturnedMailPendingListCaption(18, 2) As String
Public frmReturnedMailReportCaption(5, 2) As String
Public frmTimeDepositOpenCaption(35, 2) As String   ''Changed from 32 to 35 by Mohit on 20-Feb-2007 as change reported by Arul
Public frmTimeDepositPendingListCaption(20, 2) As String
Public frmTimeDepositRejectionCaption(10, 2) As String

Public frmSwiftTransferBranchActivityCaption(15, 2) As String
Public frmSwiftTransferDetailCaption(40, 2) As String
Public frmSwiftTransferEnqCaption(35, 2) As String
Public frmSwiftTransferPendingListCaption(25, 2) As String
Public frmSwiftTransferReportCaption(12, 2) As String
Public frmSwiftTransferMessageCaption(10, 2) As String
Public frmSwiftTransferFinancialInfoCaption(15, 2) As String
Public frmSwiftTransferRejectionCaption(10, 2) As String

Public appAccOpeningAppln(2) As String
Public appDate(2) As String
Public appBranch(2) As String
Public appPlsOpenAnAcc(2) As String
Public appPersonalDetails(2) As String
Public appLastName(2) As String
Public appThirdName(2) As String
Public appMiddleName(2) As String
Public appFirstName(2) As String
Public appPrefLang(2) As String
Public appEnglish(2) As String
Public appArabic(2) As String
Public appNationality(2) As String
Public appSaudi(2) As String
Public appGender(2) As String
Public appMale(2) As String
Public appFemale(2) As String
Public appDob(2) As String
Public appAccountType(2) As String
Public appConsumer(2) As String
Public appCommercial(2) As String
Public appSaudiIdNo(2) As String
Public appIqamaNo(2) As String
Public appIssuedAt(2) As String
Public appIssueDate(2) As String
Public appExpiryDate(2) As String
Public appPassportNo(2) As String
Public appHafizaNo(2) As String
Public appNoOfDependents(2) As String
Public appMaritalStatus(2) As String
Public appSingle(2) As String
Public appMarried(2) As String
Public appOther(2) As String
Public appSaudiMailingAddr(2) As String
Public appAddress1(2) As String
Public appAddress2(2) As String
Public appPoBox(2) As String
Public appCity(2) As String
Public appZipcode(2) As String
Public appFax(2) As String
Public appOffPhone(2) As String
Public appResPhone(2) As String
Public appEmailAddr(2) As String
Public appMobile(2) As String
Public appHouseNo(2) As String
Public appStreet(2) As String
Public appArea(2) As String
Public appHomeCountryAddr(2) As String
Public appPersonalProfile(2) As String
   
Public appEducation(2) As String
Public appOthers(2) As String
Public appDoctoral(2) As String
Public appMaster(2) As String
Public appBachelor(2) As String
Public appDiploma(2) As String
Public appHighSchool(2) As String
Public appProfession(2) As String
Public appBusinessMan(2) As String
Public appPrivateSector(2) As String
Public appGovtSector(2) As String
Public appPensioner(2) As String
   
Public appPosition(2) As String
Public appStudent(2) As String
Public appStaffClerk(2) As String
Public appSupervisor(2) As String
Public appManger(2) As String
Public appMonthlyIncome(2) As String
Public app500110000(2) As String
Public app25015000(2) As String
Public appUpto2500(2) As String
Public app1000115000(2) As String
Public app1500120000(2) As String
Public app20001Plus(2) As String
Public appProperty(2) As String
Public appCompAccom(2) As String
Public appOwnHouse(2) As String
Public appRentedHouse(2) As String
Public appCar(2) As String
Public appCompTrans(2) As String
Public appOwnCar(2) As String
Public appRentedCar(2) As String
Public appJobInfo(2) As String
Public appDeptName(2) As String
Public appEmployerName(2) As String
Public appExtn(2) As String
Public appEnclDoc(2) As String
Public appAuthSignDoc(2) As String
Public appIdIqamaCopy(2) As String
Public appCcRegnCopy(2) As String
Public appMemoArticleAssoc(2) As String
Public appPowerOfAttorney(2) As String
Public appBankAuth(2) As String
Public appSalaryTransferCert(2) As String
Public appJointAccountAgreement(2) As String
Public appOtherDocuments(2) As String
Public appAccount(2) As String
Public appSavingAcc(2) As String
Public appCurrentAcc(2) As String
Public appPleaseSpecify(2) As String
Public appChequeBook(2) As String
Public appYes(2) As String
Public appNo(2) As String
Public appAccCurr(2) As String
Public appGBP(2) As String
Public appUSD(2) As String
Public appSAR(2) As String
Public appAccStmtFreq(2) As String
Public appMonthly(2) As String
Public appWeekly(2) As String
Public appDaily(2) As String
Public appSignInstruction(2) As String
Public appJoint(2) As String
Public appIndividual(2) As String
Public appIssueATMCard(2) As String
Public appCardType(2) As String
Public appElectronIntl(2) As String
Public appSmartCard(2) As String
Public appPrimaryAtmCard(2) As String
Public appNameOnTheCard(2) As String
Public appMaxCharsInAtm(2) As String
Public appSecondaryAtm(2) As String
Public appName(2) As String
Public appCardDeliveryChannel(2) As String
Public appBranchDelivery(2) As String
Public appMailDelivery(2) As String
Public appSignature(2) As String
Public appCustNoAssigned(2) As String
Public appGpsStreetName(2) As String
Public appUnit(2) As String
Public appPage(2) As String
Public appDeclaration(2) As String
Public appUnknown(2) As String
Public appAllAccountTerms(2) As String
Public appCurrentAccTerms(2) As String
Public appSavingAccTerms(2) As String
Public appAtmCardTerms(2) As String
Public appHatifAlArabiTerms(2) As String
Public appContd(2) As String
Public appEndOfTerms(2) As String

Public appAtmCardAppln(2) As String
Public appTheManagerAnb(2) As String
Public appPleaseIssueAtmCard(2) As String
Public appAsPerFollowing(2) As String
Public appHomePhone(2) As String
Public appBilingual(2) As String
Public appAccHoldersSign(2) As String
Public appPlsSignAsAccSign(2) As String
Public appBankUseOnly(2) As String
Public appAccHoldersName(2) As String
Public appMailingAddress(2) As String
Public appForCashWithdrawal(2) As String
Public appAtmScreenLang(2) As String
Public appCurrentAcct(2) As String

Public appAtmPinTerms(2) As String
Public appAcctNo(2) As String
Public appAtmNo(2) As String
Public appTelNo(2) As String
Public appIdNumber(2) As String
Public appDatePlaceOfIssue(2) As String
Public appCustServiceSupervisor(2) As String

Public appChequeBookRequestAppln(2) As String
Public appPlsProvideChqBook(2) As String
Public app50chequeLeaves(2) As String
Public app25ChequeLeaves(2) As String
Public appCustomerSignature(2) As String
Public appCSRSignature(2) As String
Public appQuantity(2) As String
Public appChqReceipt(2) As String

'added by Mohit on 03-Dec-2006 as per Mohammed A. Tanenah's mail on 02-Dec-2006
Public appCardNoWasRecv(2) As String
Public appCustName(2) As String
Public appCustSignVerif(2) As String
Public appCustSrvRepNameSign(2) As String
Public appCustSrvSuprNameSign(2) As String
'till here Mohit

Public saudiPostAddressCaption(10, 2) As String
Public gpsCardDeliveryAddressCaption(10, 2) As String
Public errReady(2) As String
Public errQuitFromFtp(2) As String
Public errBranchMoreThan3Digits(2) As String
Public errEnterBranchCode(2) As String
Public errStartSendingFile(2) As String
Public errFTPfailure(2) As String
Public errKb(2) As String
Public errSodNoAssined(2) As String
Public errWannaChipCard(2) As String
Public errZeroChqNo(2) As String
Public errFromChqNoGreater(2) As String
Public errAlreadyInFirstRec(2) As String
Public errAlreadyInLastRec(2) As String
Public errBillAlreadyExists(2) As String
Public errError(2) As String
Public errRecdFromSADAD(2) As String
Public errDriveNotMapped(2) As String
Public errHistStmtNotAllowed(2) As String
Public errStartEndDate(2) As String
Public errPrivateBankingAcc(2) As String
Public errPBAccRestricted(2) As String
Public errBlockedNotAllowed(2) As String
Public errManualBlockNotAllowed(2) As String
Public errNumeralsNotAllowed(2) As String
Public errReturnMailRegisterSuccessful(2) As String
Public errSpaceRefNo(2) As String
Public errInvalidRefNo(2) As String
Public errSpaceCustomerNo(2) As String
Public errOneOptionReqd(2) As String
Public errSpaceReturnedReason(2) As String
Public errPending(2) As String
Public errAddrUpd(2) As String
Public errAddrNotUpd(2) As String
Public errCustNoReachable(2) As String
Public errStmtDisabled(2) As String
Public errUnknown(2) As String
Public errSpaceSaudiAddress(2) As String
Public errDobGreaterThanToday(2) As String
Public errDoeGreaterThanToday(2) As String
Public errCustAgeExceedLimit(2) As String
Public errYears(2)  As String
Public errSpaceDeliveryGPSAddress(2) As String
Public errPasswd8AccBalanceZero(2) As String
Public errEnqRestrictedAcc(2) As String
Public errZeroAmtTxnFailed(2) As String
Public errWannaPrintReport(2) As String
Public errOnlyIndividualCustAllowed(2) As String
Public errGeneralCustOpenNotAllowed(2) As String
Public errPendingWithSupervisor(2) As String
Public errPendingWithCso(2) As String
Public errRejected(2) As String
Public errCustomerNotYetVisted(2) As String
Public errEnteredByPBO(2) As String
Public errRejectedByBranchCso(2) As String
Public errCompleted(2) As String
Public errCardPrinterNotFound(2) As String
Public errSpaceTdLedger(2) As String
Public errInvalidTdLedger(2) As String
Public errSpaceTdDebitLedger(2) As String
Public errInvalidTdDebitLedger(2) As String
Public errSpaceTdCurrency(2) As String
Public errInvalidTdCurrency(2) As String
Public errSpaceTenorType(2) As String
Public errInvalidTenorType(2) As String
Public errTenorGreaterThanZero(2) As String
Public errSpaceTdDebitCurrency(2) As String
Public errDepositPeriodMoreThan5Years(2) As String
Public errTimeDepositAccNoAssigned(2) As String
Public errTdAlreadyAutoRenew(2) As String
Public errSpaceFundingIntRate(2) As String
Public errDepositAmtLesser(2) As String
Public errTryOnceMore(2) As String
Public errInvalidDebitAccCurr(2) As String
Public errNewTimeDeposit(2) As String
Public errRenewTimeDeposit(2) As String
Public errSpaceLedger(2) As String
Public errInvalidLedger(2) As String
Public errDebitAccCurrNotSAR(2) As String
Public errInsufficientFund(2) As String
''Added by Mohit on 20-Feb-2007 as change reported by Arul
Public errSpaceValueDate(2) As String
Public errValueDateGreaterThanToday(2) As String
Public errValueDateLessThanTolerance(2) As String
' Mohit till here
Public errPressCreateToCompleteSignatoryUpd(2) As String
Public errSpaceVisaNo(2) As String
Public errStatusChangeNotAllowed(2) As String
Public errChequeBookNotAllowed(2) As String
Public errDays(2) As String
Public errSignatoryForOthers(2) As String
Public errCardNotAllowedForThisCategory(2) As String
Public errPilgrimRoleNeeded(2) As String
Public errCustomerNo(2) As String
Public errCheckPendingList(2) As String
Public errSpaceAppRefNo(2) As String
Public errAtleaseOnHeirNeeded(2) As String
Public errIssueDateGreaterThanToday(2) As String
Public errUpdatedForSama(2) As String
Public errAlreadySignatoryForOthers(2) As String
Public errOnlySplMemoAllowed(2) As String
Public errSplMemoNotConfigured(2) As String
Public errInvalidTransferPurpose(2) As String
Public errInvalidApplicantCountryCode(2) As String
Public errInvalidBenefCountryCode(2) As String
Public errSpaceApplicantAddr1(2) As String
Public errSpaceBenefAccNo(2) As String
Public errSpaceBenefAddr1(2) As String
Public errSpaceBankName(2) As String
Public errSpaceBankAddr1(2) As String
Public errSpaceMessages(2) As String
Public errInvalidIbanAcc(2) As String
Public errInvalidCharAtIban(2) As String
Public errInvalidFirstTwoCharsInIban(2) As String
Public errInvalid3rd4thCharsInIban(2) As String
Public errPoOrZipCannotBeZero(2) As String
Public errInvalidMobileNo(2) As String
Public errSpacePaymentType(2) As String
Public errSelectTxn(2) As String
Public errReversalNotAllowed(2) As String
Public errWhileGettingCustName(2) As String

Public Sub populateCaptionArrays1()
    frmManualBlockCaption(0, 0) = "ÕÃ“ »ÿ«ﬁ… ≈∆ „«‰Ì… ÌœÊÌ"
    frmManualBlockCaption(0, 1) = "Credit Card Manual Blocking"
    frmManualBlockCaption(1, 0) = "ÕÃ“ ÃœÌœ"
    frmManualBlockCaption(1, 1) = "New blocking"
    frmManualBlockCaption(2, 0) = " ⁄œÌ· ÕÃ“"
    frmManualBlockCaption(2, 1) = "Amend existing blocking"
    frmManualBlockCaption(3, 0) = "≈·€«¡ ÕÃ“"
    frmManualBlockCaption(3, 1) = "Delete existing blocking"
    frmManualBlockCaption(4, 0) = "—ﬁ„ «·»ÿ«ﬁÂ"
    frmManualBlockCaption(4, 1) = "Card Number"
    frmManualBlockCaption(5, 0) = "—ﬁ„ «·Õ”«»"
    frmManualBlockCaption(5, 1) = "Account number"
    frmManualBlockCaption(6, 0) = "«·„»·€ «·„ÕÃÊ“ «·ﬁœÌ„"
    frmManualBlockCaption(6, 1) = "Old Amount"
    frmManualBlockCaption(7, 0) = "«·„»·€ «·„ÕÃÊ“"
    frmManualBlockCaption(7, 1) = "Block Amount"
    frmManualBlockCaption(8, 0) = "«·„»·€ «·„ÕÃÊ“ «·ÃœÌœ"
    frmManualBlockCaption(8, 1) = "New Block Amount"
    frmManualBlockCaption(9, 0) = "‰⁄„"
    frmManualBlockCaption(9, 1) = "Ok"
    frmManualBlockCaption(10, 0) = "„Ê«›ﬁ"
    frmManualBlockCaption(10, 1) = "Approve"
    frmManualBlockCaption(11, 0) = "„—›Ê÷"
    frmManualBlockCaption(11, 1) = "Reject"
    frmManualBlockCaption(12, 0) = "„·«ÕŸ« "
    frmManualBlockCaption(12, 1) = "Comments"
    frmManualBlockCaption(13, 0) = "Œ—ÊÃ"
    frmManualBlockCaption(13, 1) = "Exit"
    frmManualBlockCaption(14, 0) = "«· Õ›Ÿ «·ÌœÊÌ ··Õ”«»"
    frmManualBlockCaption(14, 1) = "Manual blocking for account"
    
   frmBillEnquiryCaption(0, 0) = "√” ›”«— ›Ê« Ì— «·Œœ„« "
   frmBillEnquiryCaption(0, 1) = "Utility Bill Enquiry"
   frmBillEnquiryCaption(1, 0) = " ›«’Ì· «·«” ›”«—"
   frmBillEnquiryCaption(1, 1) = "Enquiry Details"
   frmBillEnquiryCaption(2, 0) = "—ﬁ„ «·⁄„Ì·"
   frmBillEnquiryCaption(2, 1) = "Customer Number"
   frmBillEnquiryCaption(3, 0) = "√”‹„ «·⁄„Ì·"
   frmBillEnquiryCaption(3, 1) = "Customer Name"
   frmBillEnquiryCaption(4, 0) = "‰Ê⁄ «·ÂÊÌ…"
   frmBillEnquiryCaption(4, 1) = "ID Type"
   frmBillEnquiryCaption(5, 0) = "—ﬁ„ «·ÂÊÌ…"
   frmBillEnquiryCaption(5, 1) = "ID Number"
   frmBillEnquiryCaption(6, 0) = "‘‹—ﬂ… «·Œœ„« "
   frmBillEnquiryCaption(6, 1) = "Utility company Id"
   frmBillEnquiryCaption(7, 0) = "—ﬁ„ «·„‘ —ﬂ"
   frmBillEnquiryCaption(7, 1) = "Subscription Number"
   frmBillEnquiryCaption(8, 0) = "«” Œ—Ã  ›«’Ì· «·›« Ê—…"
   frmBillEnquiryCaption(8, 1) = "Get Bill Details"
   frmBillEnquiryCaption(9, 0) = " ›«’Ì· «·›Ê« Ì—(⁄«œÌ)"
   frmBillEnquiryCaption(9, 1) = "Bill Details(Normal)"
   frmBillEnquiryCaption(10, 0) = " ›«’Ì· ›Ê« Ì—(«·Õœ «·«⁄·Ï)"
   frmBillEnquiryCaption(10, 1) = "Bill Details(High Toll)"
   frmBillEnquiryCaption(11, 0) = "—ﬁ„ «·›« Ê—…"
   frmBillEnquiryCaption(11, 1) = "Reference No."
   frmBillEnquiryCaption(12, 0) = "—„“ Õ«·… «·›« Ê—…"
   frmBillEnquiryCaption(12, 1) = "Bill Status Code"
   frmBillEnquiryCaption(13, 0) = "«·„»·€ «·„” Õﬁ"
   frmBillEnquiryCaption(13, 1) = "Amount Due"
   frmBillEnquiryCaption(14, 0) = " «—ÌŒ «·«” Õﬁ«ﬁ"
   frmBillEnquiryCaption(14, 1) = "Payment Due Date"
   frmBillEnquiryCaption(15, 0) = " «—ÌŒ «‰ Â«¡ «·›« Ê—…"
   frmBillEnquiryCaption(15, 1) = "Bill Expiry Date"
   frmBillEnquiryCaption(16, 0) = "„»·€ «·›« Ê—… «·›⁄·Ì"
   frmBillEnquiryCaption(16, 1) = "Exact Payment Only"
   frmBillEnquiryCaption(17, 0) = "‰⁄„"
   frmBillEnquiryCaption(17, 1) = "Yes"
   frmBillEnquiryCaption(18, 0) = "·«"
   frmBillEnquiryCaption(18, 1) = "No"
   frmBillEnquiryCaption(19, 0) = " ›«’Ì· «·œ›⁄Â"
   frmBillEnquiryCaption(19, 1) = "Payment Details"
   frmBillEnquiryCaption(20, 0) = "„»·€ «·›« Ê—… «·„œ›Ê⁄"
   frmBillEnquiryCaption(20, 1) = "Bill Amount Paid"
   frmBillEnquiryCaption(21, 0) = "Õ«·… «·›« Ê—… «·„œ›Ê⁄Â"
   frmBillEnquiryCaption(21, 1) = "Bill Payment Status"
   frmBillEnquiryCaption(22, 0) = " «—ÌŒ «·œ›⁄"
   frmBillEnquiryCaption(22, 1) = "Payment Date"
   frmBillEnquiryCaption(23, 0) = "—ﬁ„ Õ—ﬂ… «·»‰ﬂ «·⁄—»Ì"
   frmBillEnquiryCaption(23, 1) = "ANB Transaction Ref. No."
   frmBillEnquiryCaption(24, 0) = "ÂÊÌ… Õ—ﬂ… ”œ«œ"
   frmBillEnquiryCaption(24, 1) = "SADAD Transaction Id"
   frmBillEnquiryCaption(25, 0) = "Õ«·… «·«” ›”«— ⁄‰ «·›« Ê—…"
   frmBillEnquiryCaption(25, 1) = "Bill Query Status"
   frmBillEnquiryCaption(26, 0) = "›Ê« Ì— «·Õœ «·«⁄·Ï"
   frmBillEnquiryCaption(26, 1) = "High Toll Info"
   frmBillEnquiryCaption(27, 0) = "„⁄·Ê„«  «·›Ê« Ì— «·⁄«œÌ…"
   frmBillEnquiryCaption(27, 1) = "Normal Bill Info"
   frmBillEnquiryCaption(28, 0) = "⁄ÊœÂ «·Ï ﬁ«∆„… «·⁄„·Ì« "
   frmBillEnquiryCaption(28, 1) = "Return to Main Menu"
    
    frmSadadMainCaption(0, 0) = "«·ﬁ«∆„… «·—∆Ì”Ì… ·”œ«œ"
    frmSadadMainCaption(0, 1) = "SADAD Main menu"
    frmSadadMainCaption(1, 0) = "—ﬁ‹„ «·⁄„Ì‹·"
    frmSadadMainCaption(1, 1) = "Customer Number"
    frmSadadMainCaption(2, 0) = "«”„ «·⁄„Ì·"
    frmSadadMainCaption(2, 1) = "Customer Name"
    frmSadadMainCaption(3, 0) = "‰Ê⁄ «·ÂÊÌ…"
    frmSadadMainCaption(3, 1) = "Id Type"
    frmSadadMainCaption(4, 0) = "—ﬁ„ «·ÂÊÌ…"
    frmSadadMainCaption(4, 1) = "ID Number"
    frmSadadMainCaption(5, 0) = "«” ›”«— ⁄‰ œ›⁄Â"
    frmSadadMainCaption(5, 1) = "Payment Enquiry"
    frmSadadMainCaption(6, 0) = "«” ›”«— ⁄‰ „Õ›ŸÂ"
    frmSadadMainCaption(6, 1) = "Profile Enquiry"
    frmSadadMainCaption(7, 0) = "«÷«›… ›Ê« Ì— ··„Õ›ŸÂ"
    frmSadadMainCaption(7, 1) = "Add bills to profile"
    frmSadadMainCaption(8, 0) = "«·€«¡ ›Ê« Ì— „‰ «·„Õ›ŸÂ"
    frmSadadMainCaption(8, 1) = "Delete bills from profile"
    frmSadadMainCaption(9, 0) = "Œ—ÊÃ"
    frmSadadMainCaption(9, 1) = "Exit"
    
    frmSadadEnqCaption(0, 0) = "«” ›”«— ›Ê« Ì— «·Œœ„« "
    frmSadadEnqCaption(0, 1) = "Utility Bill Enquiry"
    frmSadadEnqCaption(1, 0) = "—ﬁ„ «·⁄„Ì·"
    frmSadadEnqCaption(1, 1) = "Customer number"
    frmSadadEnqCaption(2, 0) = "«”„ «·⁄„Ì·"
    frmSadadEnqCaption(2, 1) = "Customer name"
    frmSadadEnqCaption(3, 0) = "‰Ê⁄ «·ÂÊÌÂ"
    frmSadadEnqCaption(3, 1) = "ID Type"
    frmSadadEnqCaption(4, 0) = "—ﬁ„ «·ÂÊÌÂ"
    frmSadadEnqCaption(4, 1) = "ID Number"
    frmSadadEnqCaption(5, 0) = "«”„ ‘—ﬂ… «·Œœ„« "
    frmSadadEnqCaption(5, 1) = "Utility company ID"
    frmSadadEnqCaption(6, 0) = "—ﬁ„ «·›« Ê—Â"
    frmSadadEnqCaption(6, 1) = "Bill number"
    frmSadadEnqCaption(7, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadEnqCaption(7, 1) = "Subscription number"
    frmSadadEnqCaption(8, 0) = " «—ÌŒ «·»œ«ÌÂ"
    frmSadadEnqCaption(8, 1) = "Start Date"
    frmSadadEnqCaption(9, 0) = " «—ÌŒ «·‰Â«ÌÂ"
    frmSadadEnqCaption(9, 1) = "End Date"
    frmSadadEnqCaption(10, 0) = "»„« ›ÌÂ« «·œ›⁄« "
    frmSadadEnqCaption(10, 1) = "Include payments"
    frmSadadEnqCaption(11, 0) = "»„« ›ÌÂ« «·›Ê« Ì— «·„”œœÂ"
    frmSadadEnqCaption(11, 1) = "Include paid Bills"
    frmSadadEnqCaption(12, 0) = "‰⁄„"
    frmSadadEnqCaption(12, 1) = "Yes"
    frmSadadEnqCaption(13, 0) = "·«"
    frmSadadEnqCaption(13, 1) = "No"
    frmSadadEnqCaption(14, 0) = "«” Œ—«Ã  ›«’Ì· «·›« Ê—Â"
    frmSadadEnqCaption(14, 1) = "Get Bill details"
    frmSadadEnqCaption(15, 0) = "⁄Êœ… «·Ï «·ﬁ«∆„… «·—∆Ì”Ì…"
    frmSadadEnqCaption(15, 1) = "Return to main menu"
    
    frmSadadDetailCaption(0, 0) = "«” ›”«— ⁄‰ ›« Ê—… Œœ„« "
    frmSadadDetailCaption(0, 1) = "Utility Bill Enquiry"
    frmSadadDetailCaption(1, 0) = " ›«’Ì· «·«” ›”«—"
    frmSadadDetailCaption(1, 1) = "Enquiry Details"
    frmSadadDetailCaption(2, 0) = "ÂÊÌ… ‘—ﬂ… «·Œœ„« "
    frmSadadDetailCaption(2, 1) = "Utility company Id"
    frmSadadDetailCaption(3, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadDetailCaption(3, 1) = "Subscription number"
    frmSadadDetailCaption(4, 0) = " ›«’Ì· «·›« Ê—Â"
    frmSadadDetailCaption(4, 1) = "Bill Details"
    frmSadadDetailCaption(5, 0) = " ’‰Ì› «·›« Ê—Â"
    frmSadadDetailCaption(5, 1) = "Bill Category"
    frmSadadDetailCaption(6, 0) = "œÊ—…«·›« Ê—…—ﬁ„"
    frmSadadDetailCaption(6, 1) = "Bill Cycle"
    frmSadadDetailCaption(7, 0) = "‰Ê⁄ «·Œœ„Â"
    frmSadadDetailCaption(7, 1) = "Service Type"
    frmSadadDetailCaption(8, 0) = "—ﬁ„ «·›« Ê—Â"
    frmSadadDetailCaption(8, 1) = "Bill Number"
    frmSadadDetailCaption(9, 0) = " ›«’Ì· —ﬁ„ «·⁄„·ÌÂ"
    frmSadadDetailCaption(9, 1) = "Reference Info"
    frmSadadDetailCaption(10, 0) = "—ﬁ„ Õ«·… «·›« Ê—Â"
    frmSadadDetailCaption(10, 1) = "Bill Status Code"
    frmSadadDetailCaption(11, 0) = "«·„»·€ «·„” Õﬁ"
    frmSadadDetailCaption(11, 1) = "Amount Due"
    frmSadadDetailCaption(12, 0) = " «—ÌŒ «” Õﬁ«ﬁ «·œ›⁄Â"
    frmSadadDetailCaption(12, 1) = "Payment Due Date"
    frmSadadDetailCaption(13, 0) = " «—ÌŒ «‰ Â«¡ «·›« Ê—Â"
    frmSadadDetailCaption(13, 1) = "Bill Expiry Date"
    frmSadadDetailCaption(14, 0) = "„»·€ «·œ›⁄… ›ﬁÿ"
    frmSadadDetailCaption(14, 1) = "Exact Payment Only"
    frmSadadDetailCaption(15, 0) = " «—ÌŒ «·œ›⁄… «·›⁄·Ì"
    frmSadadDetailCaption(15, 1) = "Bill Open Date"
    frmSadadDetailCaption(16, 0) = " «—ÌŒ «€·«ﬁ «·›« Ê—Â"
    frmSadadDetailCaption(16, 1) = "Bill Close Date"
    frmSadadDetailCaption(17, 0) = "—ﬁ„ √„«‰ «·›« Ê—Â"
    frmSadadDetailCaption(17, 1) = "Bill Check Digit"
    frmSadadDetailCaption(18, 0) = " ›«’Ì· «·œ›⁄Â"
    frmSadadDetailCaption(18, 1) = "Payment Details"
    frmSadadDetailCaption(19, 0) = "„»·€ «·›« Ê—Â «·„”œœ"
    frmSadadDetailCaption(19, 1) = "Bill Amount Paid"
    frmSadadDetailCaption(20, 0) = "Õ«·… «·›« Ê—… «·„œ›Ê⁄Â"
    frmSadadDetailCaption(20, 1) = "Bill Payment Status"
    frmSadadDetailCaption(21, 0) = " «—ÌŒ »œ¡ «·„›⁄Ê·"
    frmSadadDetailCaption(21, 1) = "Effective Date"
    frmSadadDetailCaption(22, 0) = " «—ÌŒ «·œ›⁄Â"
    frmSadadDetailCaption(22, 1) = "Payment Date"
    frmSadadDetailCaption(23, 0) = "—ﬁ„ ›« Ê—… «·»‰ﬂ «·⁄—»Ì"
    frmSadadDetailCaption(23, 1) = "ANB Transaction Ref.No."
    frmSadadDetailCaption(24, 0) = "ÂÊÌ… œ›⁄… «·”œ«œ"
    frmSadadDetailCaption(24, 1) = "SADAD Payment Id"
    frmSadadDetailCaption(25, 0) = "‰’ «·—”«·Â"
    frmSadadDetailCaption(25, 1) = "Message Text"
    frmSadadDetailCaption(26, 0) = "„⁄·Ê„«  ⁄«„Â"
    frmSadadDetailCaption(26, 1) = "General Information"
    frmSadadDetailCaption(27, 0) = "«·»œ«ÌÂ"
    frmSadadDetailCaption(27, 1) = "First"
    frmSadadDetailCaption(28, 0) = "«·”«»ﬁ"
    frmSadadDetailCaption(28, 1) = "Previous"
    frmSadadDetailCaption(29, 0) = "«··«Õﬁ"
    frmSadadDetailCaption(29, 1) = "Next"
    frmSadadDetailCaption(30, 0) = "«·«ŒÌ—"
    frmSadadDetailCaption(30, 1) = "Last"
    frmSadadDetailCaption(31, 0) = "⁄Êœ… ··ﬁ«∆„… «·—∆Ì”ÌÂ"
    frmSadadDetailCaption(31, 1) = "Return to Main menu"
    frmSadadDetailCaption(32, 0) = "‰⁄„"
    frmSadadDetailCaption(32, 1) = "Yes"
    frmSadadDetailCaption(33, 0) = "·«"
    frmSadadDetailCaption(33, 1) = "No"
    frmSadadDetailCaption(34, 0) = "‰Ê⁄ «·ÂÊÌÂ"
    frmSadadDetailCaption(34, 1) = "ID Type"
    frmSadadDetailCaption(35, 0) = "—ﬁ„ «·ÂÊÌÂ"
    frmSadadDetailCaption(35, 1) = "ID Number"
    
    frmSadadProfileEnqCaption(0, 0) = "«” ›”«— ⁄‰ „Õ›Ÿ… ”œ«œ"
    frmSadadProfileEnqCaption(0, 1) = "SADAD profile enquiry"
    frmSadadProfileEnqCaption(1, 0) = "‰Ê⁄ «·ÂÊÌ…"
    frmSadadProfileEnqCaption(1, 1) = "ID Type"
    frmSadadProfileEnqCaption(2, 0) = "—ﬁ„ «·ÂÊÌÂ"
    frmSadadProfileEnqCaption(2, 1) = "ID Number"
    frmSadadProfileEnqCaption(3, 0) = "«”„ «·‘—ﬂÂ"
    frmSadadProfileEnqCaption(3, 1) = "Biller Id"
    frmSadadProfileEnqCaption(4, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadProfileEnqCaption(4, 1) = "Billing Acct"
    frmSadadProfileEnqCaption(5, 0) = "Â· ÂÌ »«·„Õ›ŸÂ"
    frmSadadProfileEnqCaption(5, 1) = "Is in profile"
    frmSadadProfileEnqCaption(6, 0) = "—ﬁ„ Õ«·… «·„Õ›ŸÂ"
    frmSadadProfileEnqCaption(6, 1) = "Profile status code"
    frmSadadProfileEnqCaption(7, 0) = "«·€«¡ «·›« Ê—Â"
    frmSadadProfileEnqCaption(7, 1) = "Delete Bill"
    frmSadadProfileEnqCaption(8, 0) = "Œ—ÊÃ"
    frmSadadProfileEnqCaption(8, 1) = "Exit"
    
    frmSadadProfileUpdCaption(0, 0) = "«÷«›… ›« Ê—… ”œ«œ ·„Õ›Ÿ… ⁄„Ì·"
    frmSadadProfileUpdCaption(0, 1) = "SADAD Customer profile Addition"
    frmSadadProfileUpdCaption(1, 0) = "‰Ê⁄ «·ÂÊÌÂ"
    frmSadadProfileUpdCaption(1, 1) = "ID Type"
    frmSadadProfileUpdCaption(2, 0) = "—ﬁ„ «·ÂÊÌÂ"
    frmSadadProfileUpdCaption(2, 1) = "ID Number"
    frmSadadProfileUpdCaption(3, 0) = "«”„ ‘—ﬂ… «·Œœ„« "
    frmSadadProfileUpdCaption(3, 1) = "Utility company Id"
    frmSadadProfileUpdCaption(4, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadProfileUpdCaption(4, 1) = "Subscription number"
    frmSadadProfileUpdCaption(5, 0) = "«÷«›… ›« Ê—Â ··ﬁ«∆„Â"
    frmSadadProfileUpdCaption(5, 1) = "Add Bill to List"
    frmSadadProfileUpdCaption(6, 0) = "ÂÊÌ… ‘—ﬂ… «·Œœ„« "
    frmSadadProfileUpdCaption(6, 1) = "Biller Id"
    frmSadadProfileUpdCaption(7, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadProfileUpdCaption(7, 1) = "Billing Acct"
    frmSadadProfileUpdCaption(8, 0) = "Â· ŒÌ »«·„Õ›ŸÂ"
    frmSadadProfileUpdCaption(8, 1) = "Is in profile"
    frmSadadProfileUpdCaption(9, 0) = "—ﬁ„ Õ«·… «· ÕœÌÀ"
    frmSadadProfileUpdCaption(9, 1) = "Update status code"
    frmSadadProfileUpdCaption(10, 0) = "«÷«›… ›Ê« Ì— ··„Õ›ŸÂ"
    frmSadadProfileUpdCaption(10, 1) = "Add bills to profile"
    frmSadadProfileUpdCaption(11, 0) = "Œ—ÊÃ"
    frmSadadProfileUpdCaption(11, 1) = "Exit"
    
    frmCardUpdateHistoryCaption(0, 0) = " «—ÌŒ  ÕœÌÀ »ÿ«ﬁ… «·’—«›"
    frmCardUpdateHistoryCaption(0, 1) = "Card Update History"
    frmCardUpdateHistoryCaption(1, 0) = "—ﬁ„ «·»ÿ«ﬁÂ"
    frmCardUpdateHistoryCaption(1, 1) = "Card No."
    frmCardUpdateHistoryCaption(2, 0) = "«”„ «·»ÿ«ﬁÂ"
    frmCardUpdateHistoryCaption(2, 1) = "Name on the card"
    frmCardUpdateHistoryCaption(3, 0) = "—„“ «·›—⁄"
    frmCardUpdateHistoryCaption(3, 1) = "Branch code"
    frmCardUpdateHistoryCaption(4, 0) = "ÂÊÌ… «·„” Œœ„"
    frmCardUpdateHistoryCaption(4, 1) = "User id"
    frmCardUpdateHistoryCaption(5, 0) = "«· «—ÌŒ Ê«·Êﬁ "
    frmCardUpdateHistoryCaption(5, 1) = "Date Time"
    frmCardUpdateHistoryCaption(6, 0) = "Õ«·… «·„⁄·ﬁ"
    frmCardUpdateHistoryCaption(6, 1) = "Pending status"
    frmCardUpdateHistoryCaption(7, 0) = "ÂÊÌ… «·„‘—›"
    frmCardUpdateHistoryCaption(7, 1) = "Supervisor id"
    frmCardUpdateHistoryCaption(8, 0) = " «—ÌŒ ÊÊﬁ  «·„Ê«›ﬁÂ"
    frmCardUpdateHistoryCaption(8, 1) = "Approved Date Time"
    frmCardUpdateHistoryCaption(9, 0) = "‰Ê⁄ «·ÿ·»"
    frmCardUpdateHistoryCaption(9, 1) = "Request Type"
    frmCardUpdateHistoryCaption(10, 0) = "«· «·Ì"
    frmCardUpdateHistoryCaption(10, 1) = "More"
    frmCardUpdateHistoryCaption(11, 0) = "«· ›«’Ì·"
    frmCardUpdateHistoryCaption(11, 1) = "View details"
    frmCardUpdateHistoryCaption(12, 0) = "Œ—ÊÃ"
    frmCardUpdateHistoryCaption(12, 1) = "Exit"
    
    frmMailDetailCaption(0, 0) = "„⁄·Ê„«  ÕÊ· «·»—Ìœ"
    frmMailDetailCaption(0, 1) = "Information about mail"
    frmMailDetailCaption(1, 0) = " «—ÌŒ «·≈—”«·"
    frmMailDetailCaption(1, 1) = "Date Desp"
    frmMailDetailCaption(2, 0) = "—ﬁ„ «·›—⁄"
    frmMailDetailCaption(2, 1) = "Branch Code"
    frmMailDetailCaption(3, 0) = "—ﬁ„ «·„—Ã⁄"
    frmMailDetailCaption(3, 1) = "Reference number"
    frmMailDetailCaption(4, 0) = "Ã·» «·»Ì«‰« "
    frmMailDetailCaption(4, 1) = "Get Details"
    frmMailDetailCaption(5, 0) = "”»» «·«” —Ã«⁄"
    frmMailDetailCaption(5, 1) = "Returned reason"
    frmMailDetailCaption(6, 0) = "—ﬁ„ «·„‰ Ã"
    frmMailDetailCaption(6, 1) = "Product number"
    frmMailDetailCaption(7, 0) = "‰Ê⁄ «·»—Ìœ"
    frmMailDetailCaption(7, 1) = "Mail Type"
    frmMailDetailCaption(8, 0) = "—ﬁ„ «·⁄„Ì·"
    frmMailDetailCaption(8, 1) = "Customer No."
    frmMailDetailCaption(9, 0) = "«”„ «·⁄„Ì·"
    frmMailDetailCaption(9, 1) = "Customer Name"
    frmMailDetailCaption(10, 0) = "‰Ê⁄ «· ’‰Ì›"
    frmMailDetailCaption(10, 1) = "Segment Type"
    frmMailDetailCaption(11, 0) = "⁄‰Ê«‰"
    frmMailDetailCaption(11, 1) = "Address"
    frmMailDetailCaption(12, 0) = "’ »"
    frmMailDetailCaption(12, 1) = "P.O. Box"
    frmMailDetailCaption(13, 0) = "«·„œÌ‰…"
    frmMailDetailCaption(13, 1) = "City"
    frmMailDetailCaption(14, 0) = "—„“ «·»—Ìœ"
    frmMailDetailCaption(14, 1) = "Zip Code"
    frmMailDetailCaption(15, 0) = "⁄œœ «·„” —Ã⁄« "
    frmMailDetailCaption(15, 1) = "Prev.Occurance"
    frmMailDetailCaption(16, 0) = "„⁄·Ê„«  «·« ’«·"
    frmMailDetailCaption(16, 1) = "Contact information"
    frmMailDetailCaption(17, 0) = "«·⁄„·"
    frmMailDetailCaption(17, 1) = "Office"
    frmMailDetailCaption(18, 0) = "«·„‰“·"
    frmMailDetailCaption(18, 1) = "Home"
    frmMailDetailCaption(19, 0) = "ÃÊ«·"
    frmMailDetailCaption(19, 1) = "Mobile"
    frmMailDetailCaption(20, 0) = "›«ﬂ”"
    frmMailDetailCaption(20, 1) = "Fax"
    frmMailDetailCaption(21, 0) = "»—Ìœ «·ﬂ —Ê‰Ì"
    frmMailDetailCaption(21, 1) = "E-Mail"
    frmMailDetailCaption(22, 0) = "„⁄·Ê„«  «·„” —Ã⁄"
    frmMailDetailCaption(22, 1) = "Returned Info"
    frmMailDetailCaption(23, 0) = " «—ÌŒ"
    frmMailDetailCaption(23, 1) = "Date"
    frmMailDetailCaption(24, 0) = "”Ã· «·„” Œœ„"
    frmMailDetailCaption(24, 1) = "User Registered"
    frmMailDetailCaption(25, 0) = "—ﬁ„ «·›—⁄"
    frmMailDetailCaption(25, 1) = "Reg.Branch Code"
    frmMailDetailCaption(26, 0) = "≈Ã—«¡  «ﬂÌœ «·⁄‰Ê«‰"
    frmMailDetailCaption(26, 1) = "Address verification action"
    frmMailDetailCaption(27, 0) = "«·Õ«·…"
    frmMailDetailCaption(27, 1) = "Status"
    frmMailDetailCaption(28, 0) = " «—ÌŒ"
    frmMailDetailCaption(28, 1) = "Date"
    frmMailDetailCaption(29, 0) = "«·„ÊŸ›"
    frmMailDetailCaption(29, 1) = "User"
    frmMailDetailCaption(30, 0) = "«·›—⁄"
    frmMailDetailCaption(30, 1) = "Br.Code"
    frmMailDetailCaption(31, 0) = "„·«ÕŸ« "
    frmMailDetailCaption(31, 1) = "Remarks"
    frmMailDetailCaption(32, 0) = "«Ã—«¡ Â« › «·⁄—»Ì"
    frmMailDetailCaption(32, 1) = "Call centre actions"
    frmMailDetailCaption(33, 0) = "«Ã—«¡ «·›—⁄"
    frmMailDetailCaption(33, 1) = "Branch actions"
    frmMailDetailCaption(34, 0) = "”·„  «·⁄„Ì·"
    frmMailDetailCaption(34, 1) = "Delivered to customer"
    frmMailDetailCaption(35, 0) = "‰⁄„"
    frmMailDetailCaption(35, 1) = "Yes"
    frmMailDetailCaption(36, 0) = "·«"
    frmMailDetailCaption(36, 1) = "No"
    frmMailDetailCaption(37, 0) = " ”ÃÌ· «·»—Ìœ «·„” —Ã⁄"
    frmMailDetailCaption(37, 1) = "Register returned mail"
    frmMailDetailCaption(38, 0) = " Õ÷Ì—  ﬁ—Ì— «·»—Ìœ «·„” —Ã⁄"
    frmMailDetailCaption(38, 1) = "Generate returned mail report"
    frmMailDetailCaption(39, 0) = "⁄œœ „—«  «·«” —Ã«⁄"
    frmMailDetailCaption(39, 1) = "Enquiry on customer"
    frmMailDetailCaption(40, 0) = "«Ã—«¡ „—ﬂ“ «· ÕœÌÀ"
    frmMailDetailCaption(40, 1) = "Mandate action"
    frmMailDetailCaption(41, 0) = "«Ã—«¡ Â« › «·⁄—»Ì"
    frmMailDetailCaption(41, 1) = "Call centre action"
    frmMailDetailCaption(42, 0) = "«Ã—«¡ «·›—⁄"
    frmMailDetailCaption(42, 1) = "Branch action"
    frmMailDetailCaption(43, 0) = "Œ—ÊÃ"
    frmMailDetailCaption(43, 1) = "Exit"
    
    frmReturnedMailCaption(0, 0) = "«·»—Ìœ «·„” —Ã⁄"
    frmReturnedMailCaption(0, 1) = "Returned mail handling"
    frmReturnedMailCaption(1, 0) = "—ﬁ„ «·„—Ã⁄"
    frmReturnedMailCaption(1, 1) = "Reference number"
    frmReturnedMailCaption(2, 0) = "—ﬁ„ «·„‰ Ã"
    frmReturnedMailCaption(2, 1) = "Product number"
    frmReturnedMailCaption(3, 0) = "—ﬁ„ «·⁄„Ì·"
    frmReturnedMailCaption(3, 1) = "Customer No."
    frmReturnedMailCaption(4, 0) = "«”„ «·⁄„Ì·"
    frmReturnedMailCaption(4, 1) = "Customer Name"
    frmReturnedMailCaption(5, 0) = "‰Ê⁄ «· ’‰Ì›"
    frmReturnedMailCaption(5, 1) = "Segment Type"
    frmReturnedMailCaption(6, 0) = "«·⁄‰Ê«‰"
    frmReturnedMailCaption(6, 1) = "Address"
    frmReturnedMailCaption(7, 0) = "’ »"
    frmReturnedMailCaption(7, 1) = "P.O. Box"
    frmReturnedMailCaption(8, 0) = "«·„œÌ‰…"
    frmReturnedMailCaption(8, 1) = "City"
    frmReturnedMailCaption(9, 0) = "—„“ «·»—Ìœ"
    frmReturnedMailCaption(9, 1) = "Zip Code"
    frmReturnedMailCaption(10, 0) = "„⁄·Ê„«  «·«” —Ã«⁄"
    frmReturnedMailCaption(10, 1) = "Returned Info"
    frmReturnedMailCaption(11, 0) = " «—ÌŒ"
    frmReturnedMailCaption(11, 1) = "Date"
    frmReturnedMailCaption(12, 0) = "”Ã· «·„” Œœ„"
    frmReturnedMailCaption(12, 1) = "User registered"
    frmReturnedMailCaption(13, 0) = "—ﬁ„ «·›—⁄"
    frmReturnedMailCaption(13, 1) = "Reg.Branch code"
    frmReturnedMailCaption(14, 0) = "«·”»»"
    frmReturnedMailCaption(14, 1) = "Reason"
    frmReturnedMailCaption(15, 0) = "„⁄·Ê„«  «·« ’«·"
    frmReturnedMailCaption(15, 1) = "Contact Information"
    frmReturnedMailCaption(16, 0) = "«·⁄„·"
    frmReturnedMailCaption(16, 1) = "Office"
    frmReturnedMailCaption(17, 0) = "«·„‰“·"
    frmReturnedMailCaption(17, 1) = "Home"
    frmReturnedMailCaption(18, 0) = "ÃÊ«·"
    frmReturnedMailCaption(18, 1) = "Mobile"
    frmReturnedMailCaption(19, 0) = "›«ﬂ”"
    frmReturnedMailCaption(19, 1) = "Fax"
    frmReturnedMailCaption(20, 0) = "«·»—Ìœ «·«·ﬂ —Ê‰Ì"
    frmReturnedMailCaption(20, 1) = "E-Mail"
    frmReturnedMailCaption(21, 0) = "«Ã—«¡ „—ﬂ“ «· ÕœÌÀ"
    frmReturnedMailCaption(21, 1) = "Mandate actions"
    frmReturnedMailCaption(22, 0) = "«·Õ«·…"
    frmReturnedMailCaption(22, 1) = "Status"
    frmReturnedMailCaption(23, 0) = "«·»—Ìœ „Œ ·›.’ÕÕ"
    frmReturnedMailCaption(23, 1) = "Diff.Address;Fixed"
    frmReturnedMailCaption(24, 0) = "«·»—Ìœ ‰›”Â.«—”«· ·Â« › «·⁄—»Ì"
    frmReturnedMailCaption(24, 1) = "Addr.Same;Forwarded to call centre"
    frmReturnedMailCaption(25, 0) = "„·«ÕŸ« "
    frmReturnedMailCaption(25, 1) = "Remarks"
    frmReturnedMailCaption(26, 0) = "«Ã—«¡ Â« › «·⁄—»Ì"
    frmReturnedMailCaption(26, 1) = "Call centre actions"
    frmReturnedMailCaption(27, 0) = "«·⁄‰Ê«‰ ÕœÀ"
    frmReturnedMailCaption(27, 1) = "Address updated"
    frmReturnedMailCaption(28, 0) = "«·⁄‰Ê«‰ ·„ ÌÕœÀ"
    frmReturnedMailCaption(28, 1) = "Address not updated"
    frmReturnedMailCaption(29, 0) = "·«Ì„ﬂ‰ «·« ’«· »«·⁄„Ì·"
    frmReturnedMailCaption(29, 1) = "Customer not reachable"
    frmReturnedMailCaption(30, 0) = "«Ã—«¡ «·›—⁄"
    frmReturnedMailCaption(30, 1) = "Branch actions"
    frmReturnedMailCaption(31, 0) = "«·⁄„Ì· ·„ ÌÕ÷— ··›—⁄"
    frmReturnedMailCaption(31, 1) = "Statement disabled"
    frmReturnedMailCaption(32, 0) = "”·„  ··⁄„Ì·"
    frmReturnedMailCaption(32, 1) = "Delivered to customer"
    frmReturnedMailCaption(33, 0) = "‰⁄„"
    frmReturnedMailCaption(33, 1) = "Yes"
    frmReturnedMailCaption(34, 0) = "·«"
    frmReturnedMailCaption(34, 1) = "No"
    frmReturnedMailCaption(35, 0) = "«Ã—«¡ «· ÕœÌÀ"
    frmReturnedMailCaption(35, 1) = "Update action"
    frmReturnedMailCaption(36, 0) = "Œ—ÊÃ"
    frmReturnedMailCaption(36, 1) = "Exit"
    frmReturnedMailCaption(37, 0) = " ÕœÌÀ »Ì«‰«  «·⁄„Ì·"
    frmReturnedMailCaption(37, 1) = "Update customer"
    frmReturnedMailCaption(38, 0) = "«⁄«œÂ ·„—ﬂ“ «·»—Ìœ-„—ﬂ“  ÕœÌÀ «·»Ì«‰« "
    frmReturnedMailCaption(38, 1) = "Returned mail Actions - Mandate Branch"
    frmReturnedMailCaption(39, 0) = "«⁄«œÂ ·„—ﬂ“ «·»—Ìœ-Â« › «·⁄—»Ì"
    frmReturnedMailCaption(39, 1) = "Returned mail Actions - Call Centre"
    frmReturnedMailCaption(40, 0) = "«⁄«œÂ ·„—ﬂ“ «·»—Ìœ-«·›—⁄"
    frmReturnedMailCaption(40, 1) = "Returned mail Actions - Branch"
    frmReturnedMailCaption(41, 0) = " «—ÌŒ «·≈—”«·"
    frmReturnedMailCaption(41, 1) = "Date Desp"
    frmReturnedMailCaption(42, 0) = "—ﬁ„ «·›—⁄"
    frmReturnedMailCaption(42, 1) = "Branch Code"
    
    frmReturnedMailPendingListCaption(0, 0) = "ﬁ«∆„… »«·»—Ìœ «·„” —Ã⁄ «·„⁄·ﬁ"
    frmReturnedMailPendingListCaption(0, 1) = "Pending returned mails list"
    frmReturnedMailPendingListCaption(1, 0) = "ﬁ«∆„… »«·»—Ìœ «·„” —Ã⁄ «·„⁄·ﬁ-„—ﬂ“  ÕœÌÀ «·»Ì«‰« "
    frmReturnedMailPendingListCaption(1, 1) = "List of pending returned mails-Mandate Branch"
    frmReturnedMailPendingListCaption(2, 0) = "ﬁ«∆„… »«·»—Ìœ «·„” —Ã⁄ «·„⁄·ﬁ-Â« › «·⁄—»Ì"
    frmReturnedMailPendingListCaption(2, 1) = "List of pending returned mails-Call centre"
    frmReturnedMailPendingListCaption(3, 0) = "ﬁ«∆„… »«·»—Ìœ «·„” —Ã⁄ «·„⁄·ﬁ- «·›—⁄"
    frmReturnedMailPendingListCaption(3, 1) = "List of pending returned mails-Branch"
    frmReturnedMailPendingListCaption(4, 0) = "ﬁ«∆„… »«·»—Ìœ «·„” —Ã⁄ ··⁄„Ì·"
    frmReturnedMailPendingListCaption(4, 1) = "List of returned mails for specific customer "
    frmReturnedMailPendingListCaption(5, 0) = "—ﬁ„ «·⁄„Ì·"
    frmReturnedMailPendingListCaption(5, 1) = "Customer number"
    frmReturnedMailPendingListCaption(6, 0) = "«»ÕÀ ⁄‰ «·»—Ìœ «·„” —Ã⁄ «·„⁄·ﬁ"
    frmReturnedMailPendingListCaption(6, 1) = "Check pending returned mail"
    frmReturnedMailPendingListCaption(7, 0) = "«· «·Ì"
    frmReturnedMailPendingListCaption(7, 1) = "More"
    frmReturnedMailPendingListCaption(8, 0) = " √ﬂÌœ ﬁ»Ê· «·Õﬁ·"
    frmReturnedMailPendingListCaption(8, 1) = "Verify selected record"
    frmReturnedMailPendingListCaption(9, 0) = "Œ—ÊÃ"
    frmReturnedMailPendingListCaption(9, 1) = "Exit"
    frmReturnedMailPendingListCaption(10, 0) = "—ﬁ„ «·„—Ã⁄"
    frmReturnedMailPendingListCaption(10, 1) = "Reference number"
    frmReturnedMailPendingListCaption(11, 0) = "—ﬁ„ «·⁄„Ì·"
    frmReturnedMailPendingListCaption(11, 1) = "Customer No."
    frmReturnedMailPendingListCaption(12, 0) = "—ﬁ„ «·„‰ Ã"
    frmReturnedMailPendingListCaption(12, 1) = "Product Id"
    frmReturnedMailPendingListCaption(13, 0) = "«·⁄‰Ê«‰"
    frmReturnedMailPendingListCaption(13, 1) = "Address-1"
    frmReturnedMailPendingListCaption(14, 0) = "’ »"
    frmReturnedMailPendingListCaption(14, 1) = "P.O. Box"
    frmReturnedMailPendingListCaption(15, 0) = "«·„œÌ‰…"
    frmReturnedMailPendingListCaption(15, 1) = "City Name"
    frmReturnedMailPendingListCaption(16, 0) = "—„“ «·»—Ìœ"
    frmReturnedMailPendingListCaption(16, 1) = "Zip Code"
    
    frmReturnedMailReportCaption(0, 0) = " ﬁ—Ì— «·»—Ìœ «·„” —Ã⁄ «·„”Ã·"
    frmReturnedMailReportCaption(0, 1) = "Registered returned mail report"
    frmReturnedMailReportCaption(1, 0) = "«·›—⁄"
    frmReturnedMailReportCaption(1, 1) = "Branch"
    frmReturnedMailReportCaption(2, 0) = "«· «—ÌŒ"
    frmReturnedMailReportCaption(2, 1) = "Enter Date"
    frmReturnedMailReportCaption(3, 0) = "«‰‘«¡ «· ﬁ—Ì—"
    frmReturnedMailReportCaption(3, 1) = "Generate Report"
    frmReturnedMailReportCaption(4, 0) = "Œ—ÊÃ"
    frmReturnedMailReportCaption(4, 1) = "Exit"
    
    saudiPostAddressCaption(0, 0) = "‰Ê⁄ «·»—Ìœ"
    saudiPostAddressCaption(0, 1) = "Address Type"
    saudiPostAddressCaption(1, 0) = "’.»"
    saudiPostAddressCaption(1, 1) = "PO Box"
    saudiPostAddressCaption(2, 0) = "Ê«’·"
    saudiPostAddressCaption(2, 1) = "GPS"
    saudiPostAddressCaption(3, 0) = "—ﬁ„ Ê«’·"
    saudiPostAddressCaption(3, 1) = "GPS Number"
    saudiPostAddressCaption(4, 0) = "«”„ ‘«—⁄/„‰ÿﬁ…"
    saudiPostAddressCaption(4, 1) = "Street/Area Name"
    saudiPostAddressCaption(5, 0) = "ÊÕœ… —ﬁ„"
    saudiPostAddressCaption(5, 1) = "Unit"
    saudiPostAddressCaption(6, 0) = "—„“ «·»—Ìœ"
    saudiPostAddressCaption(6, 1) = "Zip Code"
    
    gpsCardDeliveryAddressCaption(0, 0) = "Ê«’·"
    gpsCardDeliveryAddressCaption(0, 1) = "GPS"
    gpsCardDeliveryAddressCaption(1, 0) = "Ê«’· #-«”„ ‘«—⁄/„‰ÿﬁ…"
    gpsCardDeliveryAddressCaption(1, 1) = "GPS #-Street/Area Name"
    gpsCardDeliveryAddressCaption(2, 0) = "ÊÕœ… —ﬁ„"
    gpsCardDeliveryAddressCaption(2, 1) = "Unit"
    gpsCardDeliveryAddressCaption(3, 0) = "—„“ «·»—Ìœ"
    gpsCardDeliveryAddressCaption(3, 1) = "Zip code"
    
    frmTimeDepositOpenCaption(0, 0) = "› Õ ÊœÌ⁄…    "
    frmTimeDepositOpenCaption(0, 1) = "Time Deposit A/c Opening"
    frmTimeDepositOpenCaption(1, 0) = "—ﬁ„ «·⁄„Ì·"
    frmTimeDepositOpenCaption(1, 1) = "Customer No."
    frmTimeDepositOpenCaption(2, 0) = "«”„ «·⁄„Ì·"
    frmTimeDepositOpenCaption(2, 1) = "Customer Name"
    frmTimeDepositOpenCaption(3, 0) = "«” «– «·ÊœÌ⁄…"
    frmTimeDepositOpenCaption(3, 1) = "TD Ledger"
    frmTimeDepositOpenCaption(4, 0) = "«·Õ”«» «·„œÌ‰"
    frmTimeDepositOpenCaption(4, 1) = "Debit Account Number"
    frmTimeDepositOpenCaption(5, 0) = "«·⁄„·…"
    frmTimeDepositOpenCaption(5, 1) = "Currency"
    frmTimeDepositOpenCaption(6, 0) = "«·«” «–"
    frmTimeDepositOpenCaption(6, 1) = "Ledger"
    frmTimeDepositOpenCaption(7, 0) = "—ﬁ„ «·⁄„Ì·"
    frmTimeDepositOpenCaption(7, 1) = "Customer No."
    frmTimeDepositOpenCaption(8, 0) = "«·„ ›—⁄"
    frmTimeDepositOpenCaption(8, 1) = "Sub A/c"
    frmTimeDepositOpenCaption(9, 0) = "⁄„·… «·ÊœÌ⁄…"
    frmTimeDepositOpenCaption(9, 1) = "Deposit Currency"
    frmTimeDepositOpenCaption(10, 0) = "«·„»·€ «·„—»Êÿ"
    frmTimeDepositOpenCaption(10, 1) = "Deposit Amount"
    frmTimeDepositOpenCaption(11, 0) = "«·› —Â"
    frmTimeDepositOpenCaption(11, 1) = "Tenor"
    frmTimeDepositOpenCaption(12, 0) = "—ﬁ„ «·ÊœÌ⁄…"
    frmTimeDepositOpenCaption(12, 1) = "Deposit Account Number"
    frmTimeDepositOpenCaption(13, 0) = "«” Œ—Ã  ›«’Ì· «·ÊœÌ⁄…"
    frmTimeDepositOpenCaption(13, 1) = "Fetch Time Deposit Rates"
    frmTimeDepositOpenCaption(14, 0) = " ›«’Ì· «·ÊœÌ⁄…"
    frmTimeDepositOpenCaption(14, 1) = "Time Deposit Details"
    frmTimeDepositOpenCaption(15, 0) = "‰”»… «·⁄„Ê·… ··ÊœÌ⁄…"
    frmTimeDepositOpenCaption(15, 1) = "Funding Interest Rate"
    frmTimeDepositOpenCaption(16, 0) = "”⁄— «·’—›"
    frmTimeDepositOpenCaption(16, 1) = "Exchange Rate"
    frmTimeDepositOpenCaption(17, 0) = "«·„»·€ «·„œÌ‰"
    frmTimeDepositOpenCaption(17, 1) = "Debit Amount"
    frmTimeDepositOpenCaption(18, 0) = "«·„»·€ «·„” Õﬁ"
    frmTimeDepositOpenCaption(18, 1) = "Maturity Amount"
    frmTimeDepositOpenCaption(19, 0) = " «—ÌŒ «·«” Õﬁ«ﬁ"
    frmTimeDepositOpenCaption(19, 1) = "Maturity Date"
    frmTimeDepositOpenCaption(20, 0) = " ⁄·Ì„«  «· ÃœÌœ"
    frmTimeDepositOpenCaption(20, 1) = "Renewal instructions"
    frmTimeDepositOpenCaption(21, 0) = " ÃœÌœ ¬·Ì"
    frmTimeDepositOpenCaption(21, 1) = "Auto Renew"
    frmTimeDepositOpenCaption(22, 0) = "·«  Ãœœ "
    frmTimeDepositOpenCaption(22, 1) = "Don't  Renew"
    frmTimeDepositOpenCaption(23, 0) = "„·«ÕŸ«  «·„‘—›"
    frmTimeDepositOpenCaption(23, 1) = "Supervisor comments"
    frmTimeDepositOpenCaption(24, 0) = "«‰‘Ï¡"
    frmTimeDepositOpenCaption(24, 1) = "Create"
    frmTimeDepositOpenCaption(25, 0) = "„Ê«›ﬁ"
    frmTimeDepositOpenCaption(25, 1) = "Approve"
    frmTimeDepositOpenCaption(26, 0) = "„—›Ê÷"
    frmTimeDepositOpenCaption(26, 1) = "Reject"
    frmTimeDepositOpenCaption(27, 0) = "Œ—ÊÃ"
    frmTimeDepositOpenCaption(27, 1) = "Cancel"
    frmTimeDepositOpenCaption(28, 0) = " ÕÊ· «·⁄„Ê·… «·Ï"
    frmTimeDepositOpenCaption(28, 1) = "Interest applied to "
    frmTimeDepositOpenCaption(29, 0) = "«·ÊœÌ⁄… «·„—»Êÿ…"
    frmTimeDepositOpenCaption(29, 1) = "Fixed deposit"
    frmTimeDepositOpenCaption(30, 0) = "«·Õ”«» «·„”œœ"
    frmTimeDepositOpenCaption(30, 1) = "Payee A/c"
    frmTimeDepositOpenCaption(31, 0) = "«·Õ”«» «·„ÕÊ· „‰Â/·Â"
    frmTimeDepositOpenCaption(31, 1) = "Payee Account Number"
    frmTimeDepositOpenCaption(32, 0) = "«·€«¡ «· ›«’Ì· «⁄·«Â"
    frmTimeDepositOpenCaption(32, 1) = "Clear above details"
    ''Added by Mohit on 20-Feb-2007 as change reported  by Arul
    frmTimeDepositOpenCaption(33, 0) = " «—ÌŒ «·—»ÿ"
    frmTimeDepositOpenCaption(33, 1) = "Value Date"
    frmTimeDepositOpenCaption(34, 0) = " ⁄œÌ‹·"
    frmTimeDepositOpenCaption(34, 1) = "Update"
    frmTimeDepositOpenCaption(35, 0) = "«”„ «·„” ›Ìœ "
    frmTimeDepositOpenCaption(35, 1) = "Payee Customer Name"

    
    frmTimeDepositPendingListCaption(0, 0) = "«·Êœ«∆⁄ «·„⁄·ﬁ… ··„‘—›"
    frmTimeDepositPendingListCaption(0, 1) = "Time Deposit Pending List for Supervisor"
    frmTimeDepositPendingListCaption(1, 0) = "«·Êœ«∆⁄ «·„⁄·ﬁ… »Œœ„… «·⁄„·«¡"
    frmTimeDepositPendingListCaption(1, 1) = "Time Deposit Pending List for CSO"
    frmTimeDepositPendingListCaption(2, 0) = "Time Deposit Pending Activities for Supervisor"
    frmTimeDepositPendingListCaption(2, 1) = "Time Deposit Pending Activities for Supervisor"
    frmTimeDepositPendingListCaption(3, 0) = "Time Deposit Pending Activities for CSO"
    frmTimeDepositPendingListCaption(3, 1) = "Time Deposit Pending Activities for CSO"
    frmTimeDepositPendingListCaption(4, 0) = "«· «·Ì"
    frmTimeDepositPendingListCaption(4, 1) = "More"
    frmTimeDepositPendingListCaption(5, 0) = "„‘«Âœ…  «·»ÿ«ﬁ… «·„Œ «—…"
    frmTimeDepositPendingListCaption(5, 1) = "Verify selected record"
    frmTimeDepositPendingListCaption(6, 0) = "Œ—ÊÃ"
    frmTimeDepositPendingListCaption(6, 1) = "Cancel"
    frmTimeDepositPendingListCaption(7, 0) = "«·ÂÊÌ…"
    frmTimeDepositPendingListCaption(7, 1) = "User Id"
    frmTimeDepositPendingListCaption(8, 0) = "«· «—ÌŒ Ê «·Êﬁ "
    frmTimeDepositPendingListCaption(8, 1) = "Date&Time"
    frmTimeDepositPendingListCaption(9, 0) = "—ﬁ„ «·⁄„Ì·"
    frmTimeDepositPendingListCaption(9, 1) = "Customer Number"
    frmTimeDepositPendingListCaption(10, 0) = "«”„ «·⁄„Ì·"
    frmTimeDepositPendingListCaption(10, 1) = "Customer Name"
    frmTimeDepositPendingListCaption(11, 0) = "—ﬁ„ «·Õ”«»"
    frmTimeDepositPendingListCaption(11, 1) = "Account Number"
    frmTimeDepositPendingListCaption(12, 0) = "‰Ê⁄ «· ⁄·Ìﬁ"
    frmTimeDepositPendingListCaption(12, 1) = "Pending Type"
    frmTimeDepositPendingListCaption(13, 0) = "«·⁄„·… «·„—»Êÿ…"
    frmTimeDepositPendingListCaption(13, 1) = "Deposit Currency"
    frmTimeDepositPendingListCaption(14, 0) = "«·«” «– «·„—»Êÿ"
    frmTimeDepositPendingListCaption(14, 1) = "Deposit Ledger"
    
    frmTimeDepositRejectionCaption(0, 0) = "ÊœÌ⁄… „⁄«œ…"
    frmTimeDepositRejectionCaption(0, 1) = "Time Deposit Rejection"
    frmTimeDepositRejectionCaption(1, 0) = "„·«ÕŸ« "
    frmTimeDepositRejectionCaption(1, 1) = "Comments"
    frmTimeDepositRejectionCaption(2, 0) = "„—›Ê÷…"
    frmTimeDepositRejectionCaption(2, 1) = "Reject"
    frmTimeDepositRejectionCaption(3, 0) = " ÕÊ· «·Ï Œœ„«  «·⁄„·«¡"
    frmTimeDepositRejectionCaption(3, 1) = "Forward to CSO"
    frmTimeDepositRejectionCaption(4, 0) = "Œ—ÊÃ"
    frmTimeDepositRejectionCaption(4, 1) = "Cancel"
    
'____________

    frmSwiftTransferBranchActivityCaption(0, 0) = "ÕÊ«·… ”ÊÌ›  „‰ «·›—⁄"
    frmSwiftTransferBranchActivityCaption(0, 1) = "Swift transfer from Branch"
    frmSwiftTransferBranchActivityCaption(1, 0) = "—ﬁ„ «·›—⁄"
    frmSwiftTransferBranchActivityCaption(1, 1) = "Branch code"
    frmSwiftTransferBranchActivityCaption(2, 0) = " Õ„Ì· «·»Ì«‰« "
    frmSwiftTransferBranchActivityCaption(2, 1) = "Fetch Data"
    frmSwiftTransferBranchActivityCaption(3, 0) = " ÕœÌÀ"
    frmSwiftTransferBranchActivityCaption(3, 1) = "Update"
    frmSwiftTransferBranchActivityCaption(4, 0) = "«· «·Ì"
    frmSwiftTransferBranchActivityCaption(4, 1) = "More"
    frmSwiftTransferBranchActivityCaption(5, 0) = "Œ—ÊÃ"
    frmSwiftTransferBranchActivityCaption(5, 1) = "Exit"
    frmSwiftTransferBranchActivityCaption(6, 0) = "—ﬁ„ «·›—⁄"
    frmSwiftTransferBranchActivityCaption(6, 1) = "Branch code"
    frmSwiftTransferBranchActivityCaption(7, 0) = "—ﬁ„ „—Ã⁄ »—«‰‘ »«Ê—"
    frmSwiftTransferBranchActivityCaption(7, 1) = "BP Reference number"
    frmSwiftTransferBranchActivityCaption(8, 0) = " «—ÌŒ «· ÕÊÌ·"
    frmSwiftTransferBranchActivityCaption(8, 1) = "Trans. Date"
    frmSwiftTransferBranchActivityCaption(9, 0) = "⁄„·… ÊﬁÌ„… «·ÕÊ«·…"
    frmSwiftTransferBranchActivityCaption(9, 1) = "Trans.Curr & Amount"
    frmSwiftTransferBranchActivityCaption(10, 0) = "«”„ «·„—”·"
    frmSwiftTransferBranchActivityCaption(10, 1) = "Sender Name"
    
    frmSwiftTransferDetailCaption(0, 0) = " ›«’Ì· ÕÊ«·«  ”ÊÌ› "
    frmSwiftTransferDetailCaption(0, 1) = "Swift Transfer Detail"
    frmSwiftTransferDetailCaption(1, 0) = " ›«’Ì· «·ÕÊ«·… "
    frmSwiftTransferDetailCaption(1, 1) = "Transaction Details"
    frmSwiftTransferDetailCaption(2, 0) = "—ﬁ„ „—Ã⁄ »—«‰‘ »«Ê—"
    frmSwiftTransferDetailCaption(2, 1) = "BP Reference no."
    frmSwiftTransferDetailCaption(3, 0) = " «—ÌŒ «· ÕÊÌ·"
    frmSwiftTransferDetailCaption(3, 1) = "Transaction date"
    frmSwiftTransferDetailCaption(4, 0) = "ﬁÌ„… «·ÕÊ«·…"
    frmSwiftTransferDetailCaption(4, 1) = "Transaction amount"
    frmSwiftTransferDetailCaption(5, 0) = "—ﬁ„ Õ”«» œ«∆‰"
    frmSwiftTransferDetailCaption(5, 1) = "Credit A/c no."
    frmSwiftTransferDetailCaption(6, 0) = "—ﬁ„ «·›—⁄"
    frmSwiftTransferDetailCaption(6, 1) = "Branch code"
    frmSwiftTransferDetailCaption(7, 0) = " ›«’Ì· «·„—”·"
    frmSwiftTransferDetailCaption(7, 1) = "Applicant Details"
    frmSwiftTransferDetailCaption(8, 0) = "€—÷ «· ÕÊÌ·"
    frmSwiftTransferDetailCaption(8, 1) = "Transfer purpose"
    frmSwiftTransferDetailCaption(9, 0) = "—ﬁ„ Õ”«» «·„—”·"
    frmSwiftTransferDetailCaption(9, 1) = "Applicant A/c No."
    frmSwiftTransferDetailCaption(10, 0) = "«”„ «·„—”·"
    frmSwiftTransferDetailCaption(10, 1) = "Applicant name"
    frmSwiftTransferDetailCaption(11, 0) = "⁄‰Ê«‰ «·„—”· 1"
    frmSwiftTransferDetailCaption(11, 1) = "Applicant Address 1"
    frmSwiftTransferDetailCaption(12, 0) = "⁄‰Ê«‰ «·„—”· 2"
    frmSwiftTransferDetailCaption(12, 1) = "Applicant Address 2"
    frmSwiftTransferDetailCaption(13, 0) = "⁄‰Ê«‰ «·„—”· 3"
    frmSwiftTransferDetailCaption(13, 1) = "Applicant Address 3"
    frmSwiftTransferDetailCaption(14, 0) = "»·œ «·„—”·"
    frmSwiftTransferDetailCaption(14, 1) = "Applicant Nationality"
    frmSwiftTransferDetailCaption(15, 0) = "—ﬁ„ ÂÊÌ… «·„—”·"
    frmSwiftTransferDetailCaption(15, 1) = "Applicant Id number"
    frmSwiftTransferDetailCaption(16, 0) = " ›«’Ì· «·„” ›Ìœ"
    frmSwiftTransferDetailCaption(16, 1) = "Beneficiary Details"
    frmSwiftTransferDetailCaption(17, 0) = "«”„ «·„” ›Ìœ"
    frmSwiftTransferDetailCaption(17, 1) = "Beneficiary Name"
    frmSwiftTransferDetailCaption(18, 0) = "IBAN / Acc. No."
    frmSwiftTransferDetailCaption(18, 1) = "IBAN / Acc. No."
    frmSwiftTransferDetailCaption(19, 0) = "IBAN"
    frmSwiftTransferDetailCaption(19, 1) = "IBAN"
    frmSwiftTransferDetailCaption(20, 0) = "—ﬁ„ «·Õ”«»"
    frmSwiftTransferDetailCaption(20, 1) = "A/c number"
    frmSwiftTransferDetailCaption(21, 0) = "—ﬁ„ Õ”«» «·„” ›Ìœ"
    frmSwiftTransferDetailCaption(21, 1) = "Beneficiary A/c number"
    frmSwiftTransferDetailCaption(22, 0) = "⁄‰Ê«‰ «·„” ›Ìœ 1"
    frmSwiftTransferDetailCaption(22, 1) = "Beneficiary Address 1"
    frmSwiftTransferDetailCaption(23, 0) = "⁄‰Ê«‰ «·„” ›Ìœ 2"
    frmSwiftTransferDetailCaption(23, 1) = "Beneficiary Address 2"
    frmSwiftTransferDetailCaption(24, 0) = "⁄‰Ê«‰ «·„” ›Ìœ 3"
    frmSwiftTransferDetailCaption(24, 1) = "Beneficiary Address 3"
    frmSwiftTransferDetailCaption(25, 0) = "»·œ «·„” ›Ìœ"
    frmSwiftTransferDetailCaption(25, 1) = "Beneficiary Country"
    frmSwiftTransferDetailCaption(26, 0) = " ›«’Ì· »‰ﬂ «·„” ›Ìœ"
    frmSwiftTransferDetailCaption(26, 1) = "Beneficiary Bank Details"
    frmSwiftTransferDetailCaption(27, 0) = "«”„ «·»‰ﬂ"
    frmSwiftTransferDetailCaption(27, 1) = "Bank name"
    frmSwiftTransferDetailCaption(28, 0) = "⁄‰Ê«‰ «·»‰ﬂ 1"
    frmSwiftTransferDetailCaption(28, 1) = "Bank address 1"
    frmSwiftTransferDetailCaption(29, 0) = "⁄‰Ê«‰ «·»‰ﬂ 2"
    frmSwiftTransferDetailCaption(29, 1) = "Bank address 2"
    frmSwiftTransferDetailCaption(30, 0) = "clearing code/—„“ «·„ﬁ«’… "
    frmSwiftTransferDetailCaption(30, 1) = "Country clearing code"
    frmSwiftTransferDetailCaption(31, 0) = "SWIFT code/—„“ «·»ﬂ ··»‰ﬂ "
    frmSwiftTransferDetailCaption(31, 1) = "Bank BIC code"
    
    frmSwiftTransferDetailCaption(32, 0) = "«·„⁄·Ê„«  «·„«·Ì…"
    frmSwiftTransferDetailCaption(32, 1) = "Financial info"
    frmSwiftTransferDetailCaption(33, 0) = "«·—”«∆·"
    frmSwiftTransferDetailCaption(33, 1) = "Messages"
    frmSwiftTransferDetailCaption(34, 0) = "„·«ÕŸ«  «·„‘—›"
    frmSwiftTransferDetailCaption(34, 1) = "Supervisor comments"
    frmSwiftTransferDetailCaption(35, 0) = "«‰‘«¡"
    frmSwiftTransferDetailCaption(35, 1) = "Create"
    frmSwiftTransferDetailCaption(36, 0) = "„Ê«›ﬁ"
    frmSwiftTransferDetailCaption(36, 1) = "Approve"
    frmSwiftTransferDetailCaption(37, 0) = "„—›Ê÷"
    frmSwiftTransferDetailCaption(37, 1) = "Reject"
    frmSwiftTransferDetailCaption(38, 0) = "≈·€«¡"
    frmSwiftTransferDetailCaption(38, 1) = "Cancel"
    
    frmSwiftTransferPendingListCaption(0, 0) = "ÕÊ·«  ”ÊÌ›  «·„⁄·ﬁ… ··„‘—›"
    frmSwiftTransferPendingListCaption(0, 1) = "Swift pending activity for supervisor"
    frmSwiftTransferPendingListCaption(1, 0) = "ÕÊ«·«  ”ÊÌ›  «·„⁄·ﬁ… ··„‰›–"
    frmSwiftTransferPendingListCaption(1, 1) = "Swift pending activity for CSO"
    frmSwiftTransferPendingListCaption(2, 0) = "—ﬁ„ «·›—⁄"
    frmSwiftTransferPendingListCaption(2, 1) = "Branch code"
    frmSwiftTransferPendingListCaption(3, 0) = "«»ÕÀ ⁄‰ «·„⁄·ﬁ"
    frmSwiftTransferPendingListCaption(3, 1) = "Check pending list"
    frmSwiftTransferPendingListCaption(4, 0) = "«· «·Ì"
    frmSwiftTransferPendingListCaption(4, 1) = "More"
    frmSwiftTransferPendingListCaption(5, 0) = "«Ã·» «· ›«’Ì·"
    frmSwiftTransferPendingListCaption(5, 1) = "Get Details"
    frmSwiftTransferPendingListCaption(6, 0) = "Œ—ÊÃ"
    frmSwiftTransferPendingListCaption(6, 1) = "Exit"
    frmSwiftTransferPendingListCaption(7, 0) = "ÂÊÌ  «·„” Œœ„"
    frmSwiftTransferPendingListCaption(7, 1) = "User id"
    frmSwiftTransferPendingListCaption(8, 0) = "«· «—ÌŒ Ê«·Êﬁ "
    frmSwiftTransferPendingListCaption(8, 1) = "Date & Time"
    frmSwiftTransferPendingListCaption(9, 0) = "—ﬁ„ „—Ã⁄ «·ÕÊ«·…"
    frmSwiftTransferPendingListCaption(9, 1) = "Trans.Ref.No."
    frmSwiftTransferPendingListCaption(10, 0) = " «—ÌŒ «·ÕÊ«·…"
    frmSwiftTransferPendingListCaption(10, 1) = "Trans.Date"
    frmSwiftTransferPendingListCaption(11, 0) = "—ﬁ„ «·›—⁄ «·’«œ—"
    frmSwiftTransferPendingListCaption(11, 1) = "Issue Branch code"
    frmSwiftTransferPendingListCaption(12, 0) = "«”„ «·„—”·"
    frmSwiftTransferPendingListCaption(12, 1) = "Applicant name"
    frmSwiftTransferPendingListCaption(13, 0) = "«”„ «·„” ›Ìœ"
    frmSwiftTransferPendingListCaption(13, 1) = "Beneficiary name"
    
    frmSwiftTransferEnqCaption(0, 0) = "«·«” ›”«— ⁄‰ ÕÊ«·«  «·”ÊÌ› "
    frmSwiftTransferEnqCaption(0, 1) = "Swift transfer enquiry"
    frmSwiftTransferEnqCaption(1, 0) = "«· «—ÌŒ «·„ÿ·Ê»"
    frmSwiftTransferEnqCaption(1, 1) = "Required date"
    frmSwiftTransferEnqCaption(2, 0) = "—ﬁ„ «·›—⁄"
    frmSwiftTransferEnqCaption(2, 1) = "Branch code"
    frmSwiftTransferEnqCaption(3, 0) = "Õ«·… «·”Ã·"
    frmSwiftTransferEnqCaption(3, 1) = "Record status"
    frmSwiftTransferEnqCaption(4, 0) = "„⁄«·ﬁ… ·· ÕœÌÀ"
    frmSwiftTransferEnqCaption(4, 1) = "Pending for update"
    frmSwiftTransferEnqCaption(5, 0) = "„Ê«›ﬁ…"
    frmSwiftTransferEnqCaption(5, 1) = "Completed"
    frmSwiftTransferEnqCaption(6, 0) = "„—›Ê÷…"
    frmSwiftTransferEnqCaption(6, 1) = "Rejected"
    frmSwiftTransferEnqCaption(7, 0) = "„⁄·ﬁ… „⁄ «·ÊÕœ… «·„—ﬂ“Ì…"
    frmSwiftTransferEnqCaption(7, 1) = "Pending with central unit"
    frmSwiftTransferEnqCaption(8, 0) = "Õ„· «·»Ì«‰« "
    frmSwiftTransferEnqCaption(8, 1) = "Fetch Data"
    frmSwiftTransferEnqCaption(9, 0) = "«· ›«’Ì·"
    frmSwiftTransferEnqCaption(9, 1) = "Details"
    frmSwiftTransferEnqCaption(10, 0) = "«· «·Ì"
    frmSwiftTransferEnqCaption(10, 1) = "More"
    frmSwiftTransferEnqCaption(11, 0) = "Œ—ÊÃ"
    frmSwiftTransferEnqCaption(11, 1) = "Exit"
    frmSwiftTransferEnqCaption(12, 0) = "—ﬁ„ «·›—⁄"
    frmSwiftTransferEnqCaption(12, 1) = "Branch code"
    frmSwiftTransferEnqCaption(13, 0) = "—ﬁ„ „—Ã⁄ «·»—«‰‘ »Ê—"
    frmSwiftTransferEnqCaption(13, 1) = "BP reference No."
    frmSwiftTransferEnqCaption(14, 0) = " «—ÌŒ «·ÕÊ«·…"
    frmSwiftTransferEnqCaption(14, 1) = "Trans.Date"
    frmSwiftTransferEnqCaption(15, 0) = "⁄„·… ÊﬁÌ„… «·ÕÊ«·…"
    frmSwiftTransferEnqCaption(15, 1) = "Trans.Curr & Amount"
    frmSwiftTransferEnqCaption(16, 0) = "«”„ «·„—”·"
    frmSwiftTransferEnqCaption(16, 1) = "Sender Name"
    frmSwiftTransferEnqCaption(17, 0) = "—ﬁ„ Õ”«» «·„—”·"
    frmSwiftTransferEnqCaption(17, 1) = "Applicant A/c No."
    frmSwiftTransferEnqCaption(18, 0) = " «—ÌŒ «·Õﬁ"
    frmSwiftTransferEnqCaption(18, 1) = "Value Date"
    frmSwiftTransferEnqCaption(19, 0) = "Õ«·… «· ⁄·Ìﬁ"
    frmSwiftTransferEnqCaption(19, 1) = "Pending status"
    frmSwiftTransferEnqCaption(20, 0) = "ÂÊÌ… «·„‰›–"
    frmSwiftTransferEnqCaption(20, 1) = "CSO User id"
    frmSwiftTransferEnqCaption(21, 0) = "«· «—ÌŒ Ê«·Êﬁ "
    frmSwiftTransferEnqCaption(21, 1) = "Date & Time"
    frmSwiftTransferEnqCaption(22, 0) = "ÂÊÌ… «·„‘—›"
    frmSwiftTransferEnqCaption(22, 1) = "Supervisor id"
    frmSwiftTransferEnqCaption(23, 0) = " «—ÌŒ ÊÊﬁ  «·„Ê«›ﬁ…"
    frmSwiftTransferEnqCaption(23, 1) = "Approved Date&Time"
    frmSwiftTransferEnqCaption(24, 0) = "›—⁄ «·ÊÕœ… «·„—ﬂ“Ì…"
    frmSwiftTransferEnqCaption(24, 1) = "Central unit branch"
    
    frmSwiftTransferReportCaption(0, 0) = " ﬁ—Ì— ÕÊ«·«  «·”ÊÌ› "
    frmSwiftTransferReportCaption(0, 1) = "Swift Transfer Report"
    frmSwiftTransferReportCaption(1, 0) = "‰Ê⁄ «· ﬁ—Ì—"
    frmSwiftTransferReportCaption(1, 1) = "Report Type"
    frmSwiftTransferReportCaption(2, 0) = "„⁄·ﬁ ·· ÕœÌÀ"
    frmSwiftTransferReportCaption(2, 1) = "Pending for update"
    frmSwiftTransferReportCaption(3, 0) = "„ﬁ»Ê·…"
    frmSwiftTransferReportCaption(3, 1) = "Completed"
    frmSwiftTransferReportCaption(4, 0) = "„—›Ê÷…"
    frmSwiftTransferReportCaption(4, 1) = "Rejected"
    frmSwiftTransferReportCaption(5, 0) = "„⁄·ﬁ… ·œÏ «·ÊÕœ… «·„—ﬂ“Ì…"
    frmSwiftTransferReportCaption(5, 1) = "Pending with cetral unit"
    frmSwiftTransferReportCaption(6, 0) = "„·Œ’"
    frmSwiftTransferReportCaption(6, 1) = "Summary"
    frmSwiftTransferReportCaption(7, 0) = " «—ÌŒ «·«œŒ«·"
    frmSwiftTransferReportCaption(7, 1) = "Enter Date"
    frmSwiftTransferReportCaption(8, 0) = "«‰‘«¡ «· ﬁ—Ì—"
    frmSwiftTransferReportCaption(8, 1) = "Generate Report"
    frmSwiftTransferReportCaption(9, 0) = "Œ—ÊÃ"
    frmSwiftTransferReportCaption(9, 1) = "Exit"
    
    frmSwiftTransferFinancialInfoCaption(0, 0) = "”ÊÌ›  «·„⁄·Ê„«  «·„«·Ì…"
    frmSwiftTransferFinancialInfoCaption(0, 1) = "SWIFT financial information"
    frmSwiftTransferFinancialInfoCaption(1, 0) = " ›«’Ì· «·ÕÊ«·…"
    frmSwiftTransferFinancialInfoCaption(1, 1) = "Transaction Details"
    frmSwiftTransferFinancialInfoCaption(2, 0) = "—ﬁ„ „—Ã⁄ «·»—«‰‘ »Ê—"
    frmSwiftTransferFinancialInfoCaption(2, 1) = "BP Reference No."
    frmSwiftTransferFinancialInfoCaption(3, 0) = " «—ÌŒ «·ÕÊ«·…"
    frmSwiftTransferFinancialInfoCaption(3, 1) = "Transaction Date"
    frmSwiftTransferFinancialInfoCaption(4, 0) = "«·„»·€"
    frmSwiftTransferFinancialInfoCaption(4, 1) = "Amount"
    frmSwiftTransferFinancialInfoCaption(5, 0) = " «—ÌŒ «·Õﬁ"
    frmSwiftTransferFinancialInfoCaption(5, 1) = "Value Date"
    frmSwiftTransferFinancialInfoCaption(6, 0) = "«·„»·€ «·„œ›Ê⁄"
    frmSwiftTransferFinancialInfoCaption(6, 1) = "Payment Amt"
    frmSwiftTransferFinancialInfoCaption(7, 0) = "—ﬁ„ Õ”«» „œÌ‰"
    frmSwiftTransferFinancialInfoCaption(7, 1) = "Debit A/c No."
    frmSwiftTransferFinancialInfoCaption(8, 0) = "—ﬁ„ Õ”«» œ«∆‰"
    frmSwiftTransferFinancialInfoCaption(8, 1) = "Credit A/c No."
    frmSwiftTransferFinancialInfoCaption(9, 0) = "”⁄— «·’—›"
    frmSwiftTransferFinancialInfoCaption(9, 1) = "Exchange Rate"
    frmSwiftTransferFinancialInfoCaption(10, 0) = "€—÷ «· ÕÊÌ·"
    frmSwiftTransferFinancialInfoCaption(10, 1) = "Transfer Purpose"
    frmSwiftTransferFinancialInfoCaption(11, 0) = "—ﬁ„ «·›—⁄"
    frmSwiftTransferFinancialInfoCaption(11, 1) = "Branch code"
    frmSwiftTransferFinancialInfoCaption(12, 0) = "Œ—ÊÃ"
    frmSwiftTransferFinancialInfoCaption(12, 1) = "Exit"
    
    frmSwiftTransferMessageCaption(0, 0) = "—”«∆· ”ÊÌ› "
    frmSwiftTransferMessageCaption(0, 1) = "SWIFT Messages"
    frmSwiftTransferMessageCaption(1, 0) = "—”«·… 1"
    frmSwiftTransferMessageCaption(1, 1) = "Message 1"
    frmSwiftTransferMessageCaption(2, 0) = "—”«·… 2"
    frmSwiftTransferMessageCaption(2, 1) = "Message 2"
    frmSwiftTransferMessageCaption(3, 0) = "—”«·… 3"
    frmSwiftTransferMessageCaption(3, 1) = "Message 3"
    frmSwiftTransferMessageCaption(4, 0) = "—”«·… 4"
    frmSwiftTransferMessageCaption(4, 1) = "Message 4"
    frmSwiftTransferMessageCaption(5, 0) = "„Ê«›ﬁ"
    frmSwiftTransferMessageCaption(5, 1) = "Ok"
    frmSwiftTransferMessageCaption(6, 0) = "Œ—ÊÃ"
    frmSwiftTransferMessageCaption(6, 1) = "Exit"
    
    frmSwiftTransferRejectionCaption(0, 0) = "ÕÊ«·«  ”ÊÌ›  «·„—›Ê÷…"
    frmSwiftTransferRejectionCaption(0, 1) = "Swift Transfer Rejection"
    frmSwiftTransferRejectionCaption(1, 0) = "„·«ÕŸ« "
    frmSwiftTransferRejectionCaption(1, 1) = "Comments"
    frmSwiftTransferRejectionCaption(2, 0) = "„—›Ê÷…"
    frmSwiftTransferRejectionCaption(2, 1) = "Reject"
    frmSwiftTransferRejectionCaption(3, 0) = " ÕÊ· «·Ï Œœ„«  «·⁄„·«¡"
    frmSwiftTransferRejectionCaption(3, 1) = "Forward to CSO"
    frmSwiftTransferRejectionCaption(4, 0) = "Œ—ÊÃ"
    frmSwiftTransferRejectionCaption(4, 1) = "Cancel"
    
    mnuTellerCaption(0, 0) = " ·—"
    mnuTellerCaption(0, 1) = "Teller"
    mnuTellerCaption(1, 0) = "ÊŸ«∆› «· ·—"
    mnuTellerCaption(1, 1) = "Teller facilities"
    mnuTellerCaption(2, 0) = "„Ê«›ﬁ… «·„‘—›"
    mnuTellerCaption(2, 1) = "Approval from supervisor"
    mnuTellerCaption(3, 0) = "√” ›”«— ⁄‰ ⁄„·Ì…"
    mnuTellerCaption(3, 1) = "Transaction enquiry"
    mnuTellerCaption(4, 0) = " €ÌÌ— ﬂ·„… «·”—"
    mnuTellerCaption(4, 1) = "Change password"
    mnuTellerCaption(5, 0) = " €ÌÌ— ·€… «·‘«‘…/Change screen language"
    mnuTellerCaption(5, 1) = " €ÌÌ— ·€… «·‘«‘…/Change screen language"
    
    mnuChiefTellerCaption(0, 0) = "—∆Ì” «· ·—“"
    mnuChiefTellerCaption(0, 1) = "Chief Teller"
    mnuChiefTellerCaption(1, 0) = "„Ê«›ﬁ… «· ·—"
    mnuChiefTellerCaption(1, 1) = "Approval Request from teller"
    mnuChiefTellerCaption(2, 0) = "√” ›”«— ⁄‰ ⁄„·Ì…"
    mnuChiefTellerCaption(2, 1) = "Transaction enquiry"
    mnuChiefTellerCaption(3, 0) = " €ÌÌ— ﬂ·„… «·”—"
    mnuChiefTellerCaption(3, 1) = "Change password"
    mnuChiefTellerCaption(4, 0) = " €ÌÌ— ·€… «·‘«‘…/Change screen language"
    mnuChiefTellerCaption(4, 1) = " €ÌÌ— ·€… «·‘«‘…/Change screen language"
    mnuChiefTellerCaption(5, 0) = " ÕœÌÀ «·„⁄·Ê„«  «·„Õ·ÌÂ"
    mnuChiefTellerCaption(5, 1) = "Refresh Local Database"
    
    frmTellerFacilitiesCaption(0, 0) = "ÊŸ«∆› «· ·—"
    frmTellerFacilitiesCaption(0, 1) = "Teller facilities"
    frmTellerFacilitiesCaption(1, 0) = "«Œ — «·⁄„·Ì… «·„ÿ·Ê»…"
    frmTellerFacilitiesCaption(1, 1) = "Select desired transaction"
    frmTellerFacilitiesCaption(2, 0) = "«»œ√"
    frmTellerFacilitiesCaption(2, 1) = "Go"
    frmTellerFacilitiesCaption(3, 0) = "Œ—ÊÃ"
    frmTellerFacilitiesCaption(3, 1) = "Exit"
    frmTellerFacilitiesCaption(4, 0) = "001- ”œÌœ ›Ê« Ì—"
    frmTellerFacilitiesCaption(4, 1) = "001-SADAD payment"
    frmTellerFacilitiesCaption(5, 0) = "002-⁄ﬂ” ﬁÌœ- ”œÌœ ›Ê« Ì—"
    frmTellerFacilitiesCaption(5, 1) = "002-SADAD payment-Reversal"
    
    frmSadadPaymentCaption(0, 0) = " ”œÌœ ›Ê« Ì—"
    frmSadadPaymentCaption(0, 1) = "ÚSADAD payment"
    frmSadadPaymentCaption(1, 0) = "⁄ﬂ” ﬁÌœ- ”œÌœ ›Ê« Ì—"
    frmSadadPaymentCaption(1, 1) = "ÚˆSADAD Reversal     "
    frmSadadPaymentCaption(2, 0) = "«· ›«’Ì·"
    frmSadadPaymentCaption(2, 1) = "Enquriy Details"
    frmSadadPaymentCaption(3, 0) = "«”„ «·‘—ﬂÂ"
    frmSadadPaymentCaption(3, 1) = "Utility company id"
    frmSadadPaymentCaption(4, 0) = "‰‹‹Ê⁄ «·Õ‹‹‹—ﬂÂ"
    frmSadadPaymentCaption(4, 1) = "Payment option"
    frmSadadPaymentCaption(5, 0) = " ”œÌœ"
    frmSadadPaymentCaption(5, 1) = "Post paid"
    frmSadadPaymentCaption(6, 0) = "œ›⁄Â „ﬁœ„Â"
    frmSadadPaymentCaption(6, 1) = "Pre paid"
    frmSadadPaymentCaption(7, 0) = "‰Ê⁄ «·«Œ Ì«—"
    frmSadadPaymentCaption(7, 1) = "Instrument type"
    frmSadadPaymentCaption(8, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadPaymentCaption(8, 1) = "Subscription number"
    frmSadadPaymentCaption(9, 0) = "—ﬁ„ «·›« Ê—Â"
    frmSadadPaymentCaption(9, 1) = "Bill number"
    frmSadadPaymentCaption(10, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadPaymentCaption(10, 1) = "Subscription Number"
    frmSadadPaymentCaption(11, 0) = "—ﬁ„ «·›« Ê—Â"
    frmSadadPaymentCaption(11, 1) = "Bill Number"
    frmSadadPaymentCaption(12, 0) = "≈” ›”«—"
    frmSadadPaymentCaption(12, 1) = "Get Bill Details"
    frmSadadPaymentCaption(13, 0) = "„”Õ «·»Ì«‰« "
    frmSadadPaymentCaption(13, 1) = "Clear Details"
    frmSadadPaymentCaption(14, 0) = " ›«’Ì· «·›« Ê—Â"
    frmSadadPaymentCaption(14, 1) = "Bill Details"
    frmSadadPaymentCaption(15, 0) = "„»·€ «·›« Ê—Â"
    frmSadadPaymentCaption(15, 1) = "Bill Amount"
    frmSadadPaymentCaption(16, 0) = " ’‰Ì› «·›« Ê—Â"
    frmSadadPaymentCaption(16, 1) = "Bill Category"
    frmSadadPaymentCaption(17, 0) = " «—ÌŒ «·«” Õﬁ«ﬁ"
    frmSadadPaymentCaption(17, 1) = "Payment Due"
    frmSadadPaymentCaption(18, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmSadadPaymentCaption(18, 1) = "Bill Expiry Date"
    frmSadadPaymentCaption(19, 0) = "«·„»·€ „ €Ì—"
    frmSadadPaymentCaption(19, 1) = "Amount changeable"
    frmSadadPaymentCaption(20, 0) = " ›«’Ì· «·œ›⁄Â"
    frmSadadPaymentCaption(20, 1) = "Payment Details"
    frmSadadPaymentCaption(21, 0) = "‰ﬁœ« √Ê ⁄·Ï «·Õ”«»"
    frmSadadPaymentCaption(21, 1) = "Cash or Account"
    frmSadadPaymentCaption(22, 0) = "Õ”«»"
    frmSadadPaymentCaption(22, 1) = "A/c"
    frmSadadPaymentCaption(23, 0) = "‰ﬁœ«"
    frmSadadPaymentCaption(23, 1) = "Cash"
    frmSadadPaymentCaption(24, 0) = "‰‹‹Ê⁄ «·œ›⁄Â"
    frmSadadPaymentCaption(24, 1) = "Payment Type"
    frmSadadPaymentCaption(25, 0) = "—ﬁ‹„ «·Õ”«» «·„œÌ‰"
    frmSadadPaymentCaption(25, 1) = "Debit A/c number"
    frmSadadPaymentCaption(26, 0) = "«· ÊﬁÌ⁄"
    frmSadadPaymentCaption(26, 1) = "Signature"
    frmSadadPaymentCaption(27, 0) = "„»·€ «·œ›⁄Â"
    frmSadadPaymentCaption(27, 1) = "Payment Amount"
    frmSadadPaymentCaption(28, 0) = "«”„ «·⁄„Ì·"
    frmSadadPaymentCaption(28, 1) = "Customer Name"
    frmSadadPaymentCaption(29, 0) = "—ﬁ„ «·Õ—ﬂÂ"
    frmSadadPaymentCaption(29, 1) = "Transaction Ref.No."
    frmSadadPaymentCaption(30, 0) = " ‰›Ì–"
    frmSadadPaymentCaption(30, 1) = "POST"
    frmSadadPaymentCaption(31, 0) = " ‰›Ì– «·≈·€«¡ "
    frmSadadPaymentCaption(31, 1) = "REVERSE"
    frmSadadPaymentCaption(32, 0) = "€Ì— „Ê«›ﬁ"
    frmSadadPaymentCaption(32, 1) = "Reject the reversal"
    frmSadadPaymentCaption(33, 0) = "√—”· ··„‘—›"
    frmSadadPaymentCaption(33, 1) = "Send it to supervisor"
    frmSadadPaymentCaption(34, 0) = "„Ê«›ﬁ"
    frmSadadPaymentCaption(34, 1) = "Approve"
    frmSadadPaymentCaption(35, 0) = "«·⁄Êœ… ··ﬁ«∆„… «·—∆Ì”ÌÂ"
    frmSadadPaymentCaption(35, 1) = "Return to main menu"
    
    frmSadadReversalPendingListCaption(0, 0) = "ÿ·»«  „⁄·ﬁÂ „‰ «· ·—"
    frmSadadReversalPendingListCaption(0, 1) = "Pending Request from Teller"
    frmSadadReversalPendingListCaption(1, 0) = "ÿ·»«  „⁄·ﬁÂ „‰ «·„‘—›"
    frmSadadReversalPendingListCaption(1, 1) = "Approval from supervisor"
    frmSadadReversalPendingListCaption(2, 0) = " ÕœÌÀ"
    frmSadadReversalPendingListCaption(2, 1) = "Refresh"
    frmSadadReversalPendingListCaption(3, 0) = "«· «·Ì"
    frmSadadReversalPendingListCaption(3, 1) = "More"
    frmSadadReversalPendingListCaption(4, 0) = "«” Œ—Ã «· ›«’Ì·"
    frmSadadReversalPendingListCaption(4, 1) = "Get Details"
    frmSadadReversalPendingListCaption(5, 0) = "Œ—ÊÃ"
    frmSadadReversalPendingListCaption(5, 1) = "Exit"
    frmSadadReversalPendingListCaption(6, 0) = "ÂÊÌ… «·„” Œœ„"
    frmSadadReversalPendingListCaption(6, 1) = "User Id"
    frmSadadReversalPendingListCaption(7, 0) = "«· «—ÌŒ Ê«·Êﬁ "
    frmSadadReversalPendingListCaption(7, 1) = "Date & Time"
    frmSadadReversalPendingListCaption(8, 0) = "ÂÊÌ… «· ·—"
    frmSadadReversalPendingListCaption(8, 1) = "Teller Id"
    frmSadadReversalPendingListCaption(9, 0) = "—ﬁ„ «·Õ—ﬂÂ"
    frmSadadReversalPendingListCaption(9, 1) = "Trans Ref.No."
    frmSadadReversalPendingListCaption(10, 0) = "«”„ «·‘—ﬂÂ"
    frmSadadReversalPendingListCaption(10, 1) = "Biller Id"
    frmSadadReversalPendingListCaption(11, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadReversalPendingListCaption(11, 1) = "Subscription Number"
    frmSadadReversalPendingListCaption(12, 0) = "„»·€ «·›« Ê—Â"
    frmSadadReversalPendingListCaption(12, 1) = "Bill Amount"
    
    frmSadadTransEnqCaption(0, 0) = "«” ›”«— ⁄‰ Õ—ﬂ… ”œ«œ"
    frmSadadTransEnqCaption(0, 1) = "SADAD transaction enquiry"
    frmSadadTransEnqCaption(1, 0) = "—ﬁ„ «·‘—ﬂ…"
    frmSadadTransEnqCaption(1, 1) = "Company Id"
    frmSadadTransEnqCaption(2, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadTransEnqCaption(2, 1) = "Subscription number"
    frmSadadTransEnqCaption(3, 0) = " «—ÌŒ «·Õ—ﬂÂ"
    frmSadadTransEnqCaption(3, 1) = "Transaction Date"
    frmSadadTransEnqCaption(4, 0) = "ÂÊÌ… «· ·—"
    frmSadadTransEnqCaption(4, 1) = "Teller Id"
    frmSadadTransEnqCaption(5, 0) = "«»œ"
    frmSadadTransEnqCaption(5, 1) = "Go"
    frmSadadTransEnqCaption(6, 0) = " ÕœÌÀ"
    frmSadadTransEnqCaption(6, 1) = "Refresh"
    frmSadadTransEnqCaption(7, 0) = "√»œ√"
    frmSadadTransEnqCaption(7, 1) = "First"
    frmSadadTransEnqCaption(8, 0) = "«·”«»ﬁ"
    frmSadadTransEnqCaption(8, 1) = "Previous"
    frmSadadTransEnqCaption(9, 0) = "«· «·Ì"
    frmSadadTransEnqCaption(9, 1) = "Next"
    frmSadadTransEnqCaption(10, 0) = "ÿ»«⁄…"
    frmSadadTransEnqCaption(10, 1) = "Print"
    frmSadadTransEnqCaption(11, 0) = "Œ—ÊÃ"
    frmSadadTransEnqCaption(11, 1) = "Exit"
    frmSadadTransEnqCaption(12, 0) = " «—ÌŒ «·Õ—ﬂÂ"
    frmSadadTransEnqCaption(12, 1) = "Trans.Date"
    frmSadadTransEnqCaption(13, 0) = "—ﬁ„ «·›—⁄"
    frmSadadTransEnqCaption(13, 1) = "Branch Code"
    frmSadadTransEnqCaption(14, 0) = "ÂÊÌ… «· ·—"
    frmSadadTransEnqCaption(14, 1) = "Teller Id"
    frmSadadTransEnqCaption(15, 0) = "—ﬁ„ «·‘—ﬂ…"
    frmSadadTransEnqCaption(15, 1) = "Company Id"
    frmSadadTransEnqCaption(16, 0) = "—ﬁ„ «·„‘ —ﬂ"
    frmSadadTransEnqCaption(16, 1) = "Subs.Number"
    frmSadadTransEnqCaption(17, 0) = "«·Õ”«» «·„œÌ‰"
    frmSadadTransEnqCaption(17, 1) = "Debit A/c #"
    frmSadadTransEnqCaption(18, 0) = "„»·€ «·›« Ê—Â"
    frmSadadTransEnqCaption(18, 1) = "Bill Amount"
    frmSadadTransEnqCaption(19, 0) = "—ﬁ„ «·Õ—ﬂÂ"
    frmSadadTransEnqCaption(19, 1) = "Trans.Ref.No."
    frmSadadTransEnqCaption(20, 0) = " «—ÌŒ «·Õﬁ"
    frmSadadTransEnqCaption(20, 1) = "Value Date"
    frmSadadTransEnqCaption(21, 0) = "‰Ê⁄ «· ”œÌœ"
    frmSadadTransEnqCaption(21, 1) = "Payment Type"
    frmSadadTransEnqCaption(22, 0) = "Õ«·… «·«œŒ«·"
    frmSadadTransEnqCaption(22, 1) = "Posting Status"
    frmSadadTransEnqCaption(23, 0) = "ÂÊÌ… «·„‘—›"
    frmSadadTransEnqCaption(23, 1) = "Supervisor Id"
    
    frmPrintAccOpeningCardCaption(0, 0) = "ÿ»«⁄… »ÿ«ﬁ… › Õ Õ”«»"
    frmPrintAccOpeningCardCaption(0, 1) = "Account opening card print"
    frmPrintAccOpeningCardCaption(1, 0) = "—ﬁ„ «·⁄„Ì·"
    frmPrintAccOpeningCardCaption(1, 1) = "Customer No."
    frmPrintAccOpeningCardCaption(2, 0) = "«” Œ—Ã «· ›«’Ì·"
    frmPrintAccOpeningCardCaption(2, 1) = "Fetch Details"
    frmPrintAccOpeningCardCaption(3, 0) = "—ﬁ„ «·Õ”«»"
    frmPrintAccOpeningCardCaption(3, 1) = "Account No."
    frmPrintAccOpeningCardCaption(4, 0) = "«”„ «·⁄„Ì·"
    frmPrintAccOpeningCardCaption(4, 1) = "Customer Name"
    frmPrintAccOpeningCardCaption(5, 0) = "¬Ì»«‰"
    frmPrintAccOpeningCardCaption(5, 1) = "IBAN"
    frmPrintAccOpeningCardCaption(6, 0) = " «—ÌŒ › Õ «·Õ”«»"
    frmPrintAccOpeningCardCaption(6, 1) = "A/c Open Date"
    frmPrintAccOpeningCardCaption(7, 0) = "—ﬁ„ «·›—⁄"
    frmPrintAccOpeningCardCaption(7, 1) = "Branch Code"
    frmPrintAccOpeningCardCaption(8, 0) = "·€… «·⁄„Ì·"
    frmPrintAccOpeningCardCaption(8, 1) = "Customer Language"
    frmPrintAccOpeningCardCaption(9, 0) = "⁄—»Ì"
    frmPrintAccOpeningCardCaption(9, 1) = "Arabic"
    frmPrintAccOpeningCardCaption(10, 0) = "«‰Ã·Ì“Ì"
    frmPrintAccOpeningCardCaption(10, 1) = "English"
    frmPrintAccOpeningCardCaption(11, 0) = "Â·  —€» »ÿ»«⁄… »ÿ«ﬁ… › Õ Õ”«»"
    frmPrintAccOpeningCardCaption(11, 1) = "Would you like to print A/c opening card?"
    frmPrintAccOpeningCardCaption(12, 0) = "‰⁄„"
    frmPrintAccOpeningCardCaption(12, 1) = "Ok"
    frmPrintAccOpeningCardCaption(13, 0) = "Œ—ÊÃ"
    frmPrintAccOpeningCardCaption(13, 1) = "Exit"
    frmPrintAccOpeningCardCaption(14, 0) = "«·⁄„·Â"
    frmPrintAccOpeningCardCaption(14, 1) = "Currency"
    frmPrintAccOpeningCardCaption(15, 0) = "«·«” «–"
    frmPrintAccOpeningCardCaption(15, 1) = "Ledger"
    frmPrintAccOpeningCardCaption(16, 0) = "—ﬁ„ «·⁄„Ì·"
    frmPrintAccOpeningCardCaption(16, 1) = "Customer No"
    frmPrintAccOpeningCardCaption(17, 0) = "«·„ ›—⁄"
    frmPrintAccOpeningCardCaption(17, 1) = "Sub Account"
    
    frmEstmtRegnCaption(0, 0) = "”Ã· ﬂ‘› «·Õ”«» «·«·Ìﬂ —Ê‰Ì"
    frmEstmtRegnCaption(0, 1) = "E-Statement Registration"
    frmEstmtRegnCaption(1, 0) = "—ﬁ„ «·⁄„Ì·"
    frmEstmtRegnCaption(1, 1) = "Customer no."
    frmEstmtRegnCaption(2, 0) = "«”„ «·⁄„Ì·"
    frmEstmtRegnCaption(2, 1) = "Customer name"
    frmEstmtRegnCaption(3, 0) = "—ﬁ„ «·›—⁄"
    frmEstmtRegnCaption(3, 1) = "Branch code"
    frmEstmtRegnCaption(4, 0) = "«·»—Ìœ «·«·ﬂ —Ê‰Ì"
    frmEstmtRegnCaption(4, 1) = "Email address"
    frmEstmtRegnCaption(5, 0) = "”Ã· ﬂ‘› «·Õ”«» «·«·Ìﬂ —Ê‰Ì"
    frmEstmtRegnCaption(5, 1) = "e-Statement Registration"
    frmEstmtRegnCaption(6, 0) = "€Ì— „›⁄·"
    frmEstmtRegnCaption(6, 1) = "Disabled"
    frmEstmtRegnCaption(7, 0) = "„›⁄·"
    frmEstmtRegnCaption(7, 1) = "Enabled"
    frmEstmtRegnCaption(8, 0) = "„·«ÕŸ«  «·„‘—›"
    frmEstmtRegnCaption(8, 1) = "Supervisor comments"
    frmEstmtRegnCaption(9, 0) = " ⁄œÌ‹·"
    frmEstmtRegnCaption(9, 1) = "Update"
    frmEstmtRegnCaption(10, 0) = "„ﬁ»Ê·"
    frmEstmtRegnCaption(10, 1) = "Approve"
    frmEstmtRegnCaption(11, 0) = "„—›Ê÷"
    frmEstmtRegnCaption(11, 1) = "Reject"
    frmEstmtRegnCaption(12, 0) = "Œ—ÊÃ"
    frmEstmtRegnCaption(12, 1) = "Exit"
     
    frmEstmtRejectionCaption(0, 0) = "ﬂ‘› «·Õ”«» «·«·Ìﬂ —Ê‰Ì «·„⁄«œ"
    frmEstmtRejectionCaption(0, 1) = "E-Statement Rejection"
    
   
End Sub

Public Sub populateCaptionArrayForSAR()

    frmIndividualOthers1Caption(0, 0) = " ›«’Ì· ⁄„Ì· „‰›—œ-«Œ—Ï"
    frmIndividualOthers1Caption(0, 1) = "Individual Customer Details - Others"
    frmIndividualOthers1Caption(1, 0) = " ›«’Ì· ⁄„Ì· „‰›—œ -’›Õ… 1"
    frmIndividualOthers1Caption(1, 1) = "Individual Customer Details-Page 1"
    frmIndividualOthers1Caption(2, 0) = " ’‰Ì›"
    frmIndividualOthers1Caption(2, 1) = "Category"
    frmIndividualOthers1Caption(3, 0) = " ’‰Ì› ›—⁄Ì"
    frmIndividualOthers1Caption(3, 1) = "Sub Category"
      
    frmIndividualOthers1Caption(4, 0) = "—ﬁ‹‹„ «·⁄„Ì‹‹·"
    frmIndividualOthers1Caption(4, 1) = "Customer Number"
    frmIndividualOthers1Caption(5, 0) = "›‹‹‹—⁄"
    frmIndividualOthers1Caption(5, 1) = "Branch"
    
    frmIndividualOthers1Caption(6, 0) = " «—ÌŒ"
    frmIndividualOthers1Caption(6, 1) = "Date"
    frmIndividualOthers1Caption(7, 0) = "—ﬁ„ «·«ﬁ«„…"
    frmIndividualOthers1Caption(7, 1) = "Iqama Number"
    frmIndividualOthers1Caption(8, 0) = "’«œ— „‰"
    frmIndividualOthers1Caption(8, 1) = "Issued At"
    frmIndividualOthers1Caption(9, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmIndividualOthers1Caption(9, 1) = "Date Type"
    frmIndividualOthers1Caption(10, 0) = "Â‹"
    frmIndividualOthers1Caption(10, 1) = "H"
    frmIndividualOthers1Caption(11, 0) = "„"
    frmIndividualOthers1Caption(11, 1) = "G"
    frmIndividualOthers1Caption(12, 0) = " «·«’‹œ«—"
    frmIndividualOthers1Caption(12, 1) = "Issue"
    frmIndividualOthers1Caption(13, 0) = " «·«‰ Â«¡"
    frmIndividualOthers1Caption(13, 1) = "Expiry"
    frmIndividualOthers1Caption(14, 0) = "—ﬁ„ ÃÊ«“«·”›—"
    frmIndividualOthers1Caption(14, 1) = "Passport No"
    
    frmIndividualOthers1Caption(15, 0) = "«··€‹‹‹‹‹‹‹‹‹‹‹Â"
    frmIndividualOthers1Caption(15, 1) = "Language"
    frmIndividualOthers1Caption(16, 0) = "⁄—»Ì"
    frmIndividualOthers1Caption(16, 1) = "Arabic"
    frmIndividualOthers1Caption(17, 0) = "«‰Ã·Ì“Ì"
    frmIndividualOthers1Caption(17, 1) = "English"
    frmIndividualOthers1Caption(18, 0) = "«·Ã‰”Ì‹‹‹‹‹Â"
    frmIndividualOthers1Caption(18, 1) = "Nationality"
    frmIndividualOthers1Caption(19, 0) = "«··ﬁ‹‹‹‹‹»"
    frmIndividualOthers1Caption(19, 1) = "Title Code"
    frmIndividualOthers1Caption(20, 0) = "«·«”‹‹‹‹‹„ «·√Ê·"
    frmIndividualOthers1Caption(20, 1) = "First Name"
    frmIndividualOthers1Caption(21, 0) = "«·«”‹‹‹„ «·À«‰Ì"
    frmIndividualOthers1Caption(21, 1) = "2nd Name"
    frmIndividualOthers1Caption(22, 0) = "«·«”‹‹‹„ «·À«·À"
    frmIndividualOthers1Caption(22, 1) = "3rd Name"
    frmIndividualOthers1Caption(23, 0) = "«·«”‹‹‹‹‹„ «·«ŒÌ—"
    frmIndividualOthers1Caption(23, 1) = "Last Name"
    frmIndividualOthers1Caption(24, 0) = "⁄‹‹‹‹‹‹‹‹‹‹—»Ì"
    frmIndividualOthers1Caption(24, 1) = "Arabic"
    frmIndividualOthers1Caption(25, 0) = "«·«”„ «·„Œ ’—"
    frmIndividualOthers1Caption(25, 1) = "Short Name"
    frmIndividualOthers1Caption(26, 0) = "«‰Ã·Ì‹‹‹‹‹‹‹“Ì"
    frmIndividualOthers1Caption(26, 1) = "English"
'    frmindividualothers1caption(25, 0) = "«·«”„ «·„Œ ’— »«·«‰Ã·Ì“ÌÂ"
'    frmindividualothers1caption(25, 1) = "English Short Name"
    frmIndividualOthers1Caption(27, 0) = "«· «—Ì‹‹‹‹‹‹‹Œ"
    frmIndividualOthers1Caption(27, 1) = "Date of Birth"
    frmIndividualOthers1Caption(28, 0) = "Â‹"
    frmIndividualOthers1Caption(28, 1) = "Hijri"
    frmIndividualOthers1Caption(29, 0) = "„"
    frmIndividualOthers1Caption(29, 1) = "Gregorian"
    frmIndividualOthers1Caption(30, 0) = " «—ÌŒ «·‹Ê·«œÂ"
    frmIndividualOthers1Caption(30, 1) = "Date of Birth"
    frmIndividualOthers1Caption(31, 0) = "«·Ã‰‹”"
    frmIndividualOthers1Caption(31, 1) = "Gender"
    frmIndividualOthers1Caption(32, 0) = "–ﬂ‹—"
    frmIndividualOthers1Caption(32, 1) = "Male"
    frmIndividualOthers1Caption(33, 0) = "«‰À‹‹Ï"
    frmIndividualOthers1Caption(33, 1) = "Female"
    frmIndividualOthers1Caption(34, 0) = "VIP"
    frmIndividualOthers1Caption(34, 1) = "VIP"
    frmIndividualOthers1Caption(35, 0) = "‰⁄„"
    frmIndividualOthers1Caption(35, 1) = "Yes"
    frmIndividualOthers1Caption(36, 0) = "·«"
    frmIndividualOthers1Caption(36, 1) = "No"
    frmIndividualOthers1Caption(37, 0) = "«·Õ«·‹‹‹‹‹‹‹‹… «·«Ã „«⁄Ì‹‹‹…"
    frmIndividualOthers1Caption(37, 1) = "Marital Status"
    frmIndividualOthers1Caption(38, 0) = "„ ‹‹“ÊÃ"
    frmIndividualOthers1Caption(38, 1) = "Married"
    frmIndividualOthers1Caption(39, 0) = "«⁄‹‹“»"
    frmIndividualOthers1Caption(39, 1) = "Single"
    frmIndividualOthers1Caption(40, 0) = "«Œ‹‹—Ï"
    frmIndividualOthers1Caption(40, 1) = "Others"
    frmIndividualOthers1Caption(41, 0) = "⁄ √›—«œ«·√”—…"
    frmIndividualOthers1Caption(41, 1) = "Dependents"
    frmIndividualOthers1Caption(42, 0) = "   „ﬁÌ‹‹„/€Ì— „ﬁÌ‹‹‹‹‹‹„"
    frmIndividualOthers1Caption(42, 1) = "   Resident/NonResident"
    frmIndividualOthers1Caption(43, 0) = "„ﬁÌ‹‹‹‹„"
    frmIndividualOthers1Caption(43, 1) = "Resident"
    frmIndividualOthers1Caption(44, 0) = "€Ì— „ﬁÌ‹‹‹‹‹„"
    frmIndividualOthers1Caption(44, 1) = "Non Resident"
    frmIndividualOthers1Caption(45, 0) = "‰Ê⁄ «·⁄„‹‹‹·"
    frmIndividualOthers1Caption(45, 1) = "Business Type"
    
    frmIndividualOthers1Caption(46, 0) = "«·⁄‰‹‹Ê«‰ "
    frmIndividualOthers1Caption(46, 1) = "Address "
    frmIndividualOthers1Caption(47, 0) = "’ . »"
    frmIndividualOthers1Caption(47, 1) = "P.O. Box"
    frmIndividualOthers1Caption(48, 0) = "«·„œÌ‰Â"
    frmIndividualOthers1Caption(48, 1) = "City"
    frmIndividualOthers1Caption(49, 0) = "«·—„“ «·»—ÌœÌ"
    frmIndividualOthers1Caption(49, 1) = "Zip Code"
    frmIndividualOthers1Caption(50, 0) = "«·œÊ·‹Â"
    frmIndividualOthers1Caption(50, 1) = "Country"
    frmIndividualOthers1Caption(51, 0) = " ·›Ê‰ «·⁄„·"
    frmIndividualOthers1Caption(51, 1) = "Phone(Off)"
    frmIndividualOthers1Caption(52, 0) = " ·›Ê‰ «·„‰“·"
    frmIndividualOthers1Caption(52, 1) = "Phone(Res.)"
    frmIndividualOthers1Caption(53, 0) = "›«ﬂ”"
    frmIndividualOthers1Caption(53, 1) = "Fax"
    frmIndividualOthers1Caption(54, 0) = "Ã‹‹‹‹‹‹‹‹Ê«·"
    frmIndividualOthers1Caption(54, 1) = "Mobile"
    frmIndividualOthers1Caption(55, 0) = "»ÌÃ‹—"
    frmIndividualOthers1Caption(55, 1) = "Pager"
    frmIndividualOthers1Caption(56, 0) = "»—Ìœ«·ﬂ —Ê‰Ì"
    frmIndividualOthers1Caption(56, 1) = "E_Mail"
    frmIndividualOthers1Caption(57, 0) = "«·’›Õ… «· «·ÌÂ"
    frmIndividualOthers1Caption(57, 1) = "&Next Page"
    frmIndividualOthers1Caption(58, 0) = "Œ—ÊÃ"
    frmIndividualOthers1Caption(58, 1) = "&Cancel"
    frmIndividualOthers1Caption(59, 0) = "„·«ÕŸ«  «·„‘—›"
    frmIndividualOthers1Caption(59, 1) = "Supervisor Comments"
        
    frmIndividualOthers1Caption(60, 0) = "—ﬁ„ «·›—⁄ «·À«‰Ì "
    frmIndividualOthers1Caption(60, 1) = "Alternative Br.code"
    frmIndividualOthers1Caption(61, 0) = "„⁄·Ê„«  «·»ÿ«ﬁ…"
    frmIndividualOthers1Caption(61, 1) = "Card Info"
    frmIndividualOthers1Caption(62, 0) = "—ﬁ„ «·›Ì“«"
    frmIndividualOthers1Caption(62, 1) = "Visa Number"
    frmIndividualOthers1Caption(63, 0) = "‰Ê⁄ «·«ﬁ«„…"
    frmIndividualOthers1Caption(63, 1) = "Iqama Type"
    frmIndividualOthers1Caption(64, 0) = "œ› —"
    frmIndividualOthers1Caption(64, 1) = "Book"
    frmIndividualOthers1Caption(65, 0) = "»·«” Ìﬂ"
    frmIndividualOthers1Caption(65, 1) = "Plastic"
   
    frmIndividualOthers2Caption(0, 0) = "’Ì«‰… «·⁄„Ì· ’›Œ… 2-·⁄„·«¡ „‰›—œÌ‰ √Œ—"
    frmIndividualOthers2Caption(0, 1) = "Customer Maintenance Page 2 - for other Individuals"
    frmIndividualOthers2Caption(1, 0) = " ›«’Ì· ⁄„Ì· „‰›—œ-’›Õ… 2"
    frmIndividualOthers2Caption(1, 1) = "Individual Customer Details- Page 2"
    frmIndividualOthers2Caption(2, 0) = "«·„ƒÂ‹‹‹‹·"
    frmIndividualOthers2Caption(2, 1) = "Education"
    frmIndividualOthers2Caption(3, 0) = " Œ’‹‹‹‹‹‹’"
    frmIndividualOthers2Caption(3, 1) = "Profession"
    frmIndividualOthers2Caption(4, 0) = "«·ÊŸÌ›‹Â"
    frmIndividualOthers2Caption(4, 1) = "Position"
    frmIndividualOthers2Caption(5, 0) = "«·œŒ· «·‘Â‹‹—Ì"
    frmIndividualOthers2Caption(5, 1) = "Monthly Income"
    frmIndividualOthers2Caption(6, 0) = "«· ’‰Ì‹‹‹‹‹›"
    frmIndividualOthers2Caption(6, 1) = "Segmentation"
    frmIndividualOthers2Caption(7, 0) = "„«·‹‹‹‹‹‹ﬂ"
    frmIndividualOthers2Caption(7, 1) = "Owner Ship"
    frmIndividualOthers2Caption(8, 0) = "„” √Ã‹—"
    frmIndividualOthers2Caption(8, 1) = "Rented Home"
    frmIndividualOthers2Caption(9, 0) = "„‰“· Œ‹«’"
    frmIndividualOthers2Caption(9, 1) = "Own House"
    frmIndividualOthers2Caption(10, 0) = "«”ﬂ«‰ ‘—ﬂ‹‹Â"
    frmIndividualOthers2Caption(10, 1) = "Com.Accomodation"
    frmIndividualOthers2Caption(11, 0) = "”Ì«—…„” √Ã—Â"
    frmIndividualOthers2Caption(11, 1) = "Rented Car"
    frmIndividualOthers2Caption(12, 0) = "”Ì«—…Œ«’Â"
    frmIndividualOthers2Caption(12, 1) = "Own Car"
    frmIndividualOthers2Caption(13, 0) = "‰ﬁ‹‹· ‘—ﬂ‹‹Â"
    frmIndividualOthers2Caption(13, 1) = "Company Transport"
    frmIndividualOthers2Caption(14, 0) = "’«Õ» «·⁄„·"
    frmIndividualOthers2Caption(14, 1) = "Employer Name"
    frmIndividualOthers2Caption(15, 0) = "«·œ«∆—Â"
    frmIndividualOthers2Caption(15, 1) = "Dept."
    frmIndividualOthers2Caption(16, 0) = "’ » "
    frmIndividualOthers2Caption(16, 1) = "P.O."
    frmIndividualOthers2Caption(17, 0) = "«·„œÌ‰Â"
    frmIndividualOthers2Caption(17, 1) = "City"
    frmIndividualOthers2Caption(18, 0) = "«·—„“ «·»—ÌœÌ"
    frmIndividualOthers2Caption(18, 1) = "Zip"
    frmIndividualOthers2Caption(19, 0) = "Õ”«» „„Ì“"
    frmIndividualOthers2Caption(19, 1) = "Package A/c"
    frmIndividualOthers2Caption(20, 0) = "⁄„Ì· «·⁄—»Ì ≈‰ —‰  "
    frmIndividualOthers2Caption(20, 1) = "Internet Bank"
    frmIndividualOthers2Caption(21, 0) = "≈‘⁄«— ·ﬂ· Õ—ﬂ…"
    frmIndividualOthers2Caption(21, 1) = "Cust.Advice Flag"
    frmIndividualOthers2Caption(22, 0) = " ÕœÌÀ «·»Ì«‰«  ﬂÿ·» ”«„«"
    frmIndividualOthers2Caption(22, 1) = "Cust.updated for SAMA"
    frmIndividualOthers2Caption(23, 0) = "„œÌ— «·Õ”«»/«·⁄·«ﬁ…"
    frmIndividualOthers2Caption(23, 1) = "Relationship Manager"
    frmIndividualOthers2Caption(24, 0) = "„·«ÕŸ«  ⁄«„…"
    frmIndividualOthers2Caption(24, 1) = "General Memo"
    frmIndividualOthers2Caption(25, 0) = "‰⁄„"
    frmIndividualOthers2Caption(25, 1) = "Yes"
    frmIndividualOthers2Caption(26, 0) = "·«"
    frmIndividualOthers2Caption(26, 1) = "No"
    frmIndividualOthers2Caption(27, 0) = "—ﬁ„ ÂÊÌ… «·»·œ «·«„"
    frmIndividualOthers2Caption(27, 1) = "Home Country Id"
    frmIndividualOthers2Caption(28, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmIndividualOthers2Caption(28, 1) = "Date Type"
    frmIndividualOthers2Caption(29, 0) = "Â‹"
    frmIndividualOthers2Caption(29, 1) = "Hijri"
    frmIndividualOthers2Caption(30, 0) = "„"
    frmIndividualOthers2Caption(30, 1) = "Greg"
    frmIndividualOthers2Caption(31, 0) = " «—ÌŒ «·«’œ«—"
    frmIndividualOthers2Caption(31, 1) = "Issue Date"
    frmIndividualOthers2Caption(32, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmIndividualOthers2Caption(32, 1) = "Expiry Date"
    frmIndividualOthers2Caption(33, 0) = "⁄‰Ê«‰ «·»·œ «·«„"
    frmIndividualOthers2Caption(33, 1) = "Home Address"
    frmIndividualOthers2Caption(34, 0) = "’ . » ."
    frmIndividualOthers2Caption(34, 1) = "P.O. Box"
    frmIndividualOthers2Caption(35, 0) = "«·„œÌ‰…"
    frmIndividualOthers2Caption(35, 1) = "City"
    frmIndividualOthers2Caption(36, 0) = "—„“ »—ÌœÌ"
    frmIndividualOthers2Caption(36, 1) = "Zip Code"
    frmIndividualOthers2Caption(37, 0) = "«·œÊ·…"
    frmIndividualOthers2Caption(37, 1) = "Country"
    frmIndividualOthers2Caption(38, 0) = "Â«‰› «·„ﬂ »"
    frmIndividualOthers2Caption(38, 1) = "Phone(Off)"
    frmIndividualOthers2Caption(39, 0) = "Â« › «·„‰“·"
    frmIndividualOthers2Caption(39, 1) = "Phone(Res.)"
    frmIndividualOthers2Caption(40, 0) = "›«ﬂ”"
    frmIndividualOthers2Caption(40, 1) = "Fax"
    frmIndividualOthers2Caption(41, 0) = "ÃÊ«·"
    frmIndividualOthers2Caption(41, 1) = "Mobile"
    frmIndividualOthers2Caption(42, 0) = "»ÌÃ—"
    frmIndividualOthers2Caption(42, 1) = "Pager"
    frmIndividualOthers2Caption(43, 0) = "»—Ìœ «·Ìﬂ —Ê‰Ì"
    frmIndividualOthers2Caption(43, 1) = "E-Mail"
    frmIndividualOthers2Caption(44, 0) = "«œŒ· —ﬁ„ Õ”«» «·„Ã„Ê⁄…"
    frmIndividualOthers2Caption(44, 1) = "Inter-Group Acc. No."
    frmIndividualOthers2Caption(45, 0) = "—ﬁ„ «·„—Ã⁄ «·Œ«’"
    frmIndividualOthers2Caption(45, 1) = "Special Reference No"
    frmIndividualOthers2Caption(46, 0) = "—ﬁ„ „Ê«›ﬁ… ”«„«"
    frmIndividualOthers2Caption(46, 1) = "SAMA Approval No."
    frmIndividualOthers2Caption(47, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmIndividualOthers2Caption(47, 1) = "Date Type"
    frmIndividualOthers2Caption(48, 0) = " «—ÌŒ „Ê«›ﬁ… ”«„«"
    frmIndividualOthers2Caption(48, 1) = "SAMA Approval Date"
    frmIndividualOthers2Caption(49, 0) = "«·’›Õ… «·”«»ﬁ…"
    frmIndividualOthers2Caption(49, 1) = "Previous Page"
    frmIndividualOthers2Caption(50, 0) = "«·’›Õ… «· «·Ì…"
    frmIndividualOthers2Caption(50, 1) = "Next Page"
    frmIndividualOthers2Caption(51, 0) = "Œ—ÊÃ"
    frmIndividualOthers2Caption(51, 1) = "Cancel"
    frmIndividualOthers2Caption(52, 0) = "„·«ÕŸ«  «· ”ÊÌﬁ"
    frmIndividualOthers2Caption(52, 1) = "Marketing Memo"
    frmIndividualOthers2Caption(53, 0) = "«” À‰«¡ „‰"
    frmIndividualOthers2Caption(53, 1) = "Exclude from"
    frmIndividualOthers2Caption(54, 0) = "—”Ê„ ’—«›"
    frmIndividualOthers2Caption(54, 1) = "ATM fees"
    frmIndividualOthers2Caption(55, 0) = "—”Ê„ «·Õœ «·«œ‰Ï ··—’Ìœ"
    frmIndividualOthers2Caption(55, 1) = "Minimum balance fees"
    frmIndividualOthers2Caption(56, 0) = "› —… «· Ã„Ìœ"
    frmIndividualOthers2Caption(56, 1) = "Freezing grace period"
    frmIndividualOthers2Caption(57, 0) = "—„“  ›⁄Ì· ﬂ‘› «·Õ”«»"
    frmIndividualOthers2Caption(57, 1) = "Segment Statement override"
    
        
    frmIndividualOthers3Caption(0, 0) = " ›«’Ì· «·Õ”«» Ê«·»ÿ«ﬁ…-„‰›—œÊ‰ √Œ—"
    frmIndividualOthers3Caption(0, 1) = "Account & Card Details - Other Individuals"
    frmIndividualOthers3Caption(1, 0) = " ›«’Ì· ⁄„·«¡ „‰›—œÌ‰ √Œ—-’›Õ… 3"
    frmIndividualOthers3Caption(1, 1) = "Individuals Other Customer details - Page 3"
    frmIndividualOthers3Caption(2, 0) = "Õ”‹‹«» Ã‹«—Ì"
    frmIndividualOthers3Caption(2, 1) = "Current A/c"
    frmIndividualOthers3Caption(3, 0) = "⁄„·Â"
    frmIndividualOthers3Caption(3, 1) = "Curr."
    frmIndividualOthers3Caption(4, 0) = "Ê÷⁄ «·Õ”«»"
    frmIndividualOthers3Caption(4, 1) = "Acc.Status"
    frmIndividualOthers3Caption(5, 0) = "«’œ«—«·ﬂ‘›"
    frmIndividualOthers3Caption(5, 1) = "Stmt.Freq."
    frmIndividualOthers3Caption(6, 0) = "œ› — ‘Ìﬂ« "
    frmIndividualOthers3Caption(6, 1) = "Check Book"
    frmIndividualOthers3Caption(7, 0) = "Õ”«»  Ê›Ì‹‹—"
    frmIndividualOthers3Caption(7, 1) = "Saving A/c"
    frmIndividualOthers3Caption(8, 0) = "«Œ‹‹‹‹‹‹‹‹‹‹‹—Ï"
    frmIndividualOthers3Caption(8, 1) = "Other A/c"
    frmIndividualOthers3Caption(9, 0) = "„›‹‹—œ/„‘ —ﬂ"
    frmIndividualOthers3Caption(9, 1) = "Single/JointA/c"
    frmIndividualOthers3Caption(10, 0) = "„›‹‹—œ"
    frmIndividualOthers3Caption(10, 1) = "Single"
    frmIndividualOthers3Caption(11, 0) = "„‘ ‹—ﬂ"
    frmIndividualOthers3Caption(11, 1) = "Joint"
    frmIndividualOthers3Caption(12, 0) = "ÿ»Ì⁄… «· ÊﬁÌ‹‹‹‹‹‹⁄"
    frmIndividualOthers3Caption(12, 1) = "Nature of signature"
    frmIndividualOthers3Caption(13, 0) = "»ÿ«ﬁ‹… œÊ·‹‹‹‹‹‹Ì…"
    frmIndividualOthers3Caption(13, 1) = "Primary Int'l card"
    frmIndividualOthers3Caption(14, 0) = "»ÿ«ﬁ…«÷«›‹‹‹‹‹‹Ì…"
    frmIndividualOthers3Caption(14, 1) = "Secondary card"
    frmIndividualOthers3Caption(15, 0) = " ”·„ «·»ÿ«ﬁÂ «·Ï"
    frmIndividualOthers3Caption(15, 1) = "Card Delivery"
    frmIndividualOthers3Caption(16, 0) = "›—⁄ «·⁄„Ì·"
    frmIndividualOthers3Caption(16, 1) = "Customer Branch"
    frmIndividualOthers3Caption(17, 0) = "«·›—⁄ ÿ«·» «·»ÿ«ﬁ…"
    frmIndividualOthers3Caption(17, 1) = "Req.Branch"
    frmIndividualOthers3Caption(18, 0) = "»—Ì‹œ"
    frmIndividualOthers3Caption(18, 1) = "Mail"
    frmIndividualOthers3Caption(19, 0) = "⁄‰Ê«‰ «· ”·Ì„ 1"
    frmIndividualOthers3Caption(19, 1) = "Delivery Address1"
    frmIndividualOthers3Caption(20, 0) = "«·⁄‰Ê«‰ 2"
    frmIndividualOthers3Caption(20, 1) = "Address2"
    frmIndividualOthers3Caption(21, 0) = "’ » "
    frmIndividualOthers3Caption(21, 1) = "PO Box"
    frmIndividualOthers3Caption(22, 0) = "«·„œÌ‰Â"
    frmIndividualOthers3Caption(22, 1) = "City"
    frmIndividualOthers3Caption(23, 0) = "«·—„“ «·»—ÌœÌ"
    frmIndividualOthers3Caption(23, 1) = "Zip code"
    frmIndividualOthers3Caption(24, 0) = "«·’›Õ… «·”«»ﬁ…"
    frmIndividualOthers3Caption(24, 1) = "Previous Page"
    frmIndividualOthers3Caption(25, 0) = "«÷‹‹‹«›…"
    frmIndividualOthers3Caption(25, 1) = "Create"
    frmIndividualOthers3Caption(26, 0) = "Õ”«» „‘ —ﬂ"
    frmIndividualOthers3Caption(26, 1) = "Joint Account"
    frmIndividualOthers3Caption(27, 0) = "Œ—ÊÃ"
    frmIndividualOthers3Caption(27, 1) = "Cancel"
    frmIndividualOthers3Caption(28, 0) = "„Ê«›ﬁ"
    frmIndividualOthers3Caption(28, 1) = "Approve"
    frmIndividualOthers3Caption(29, 0) = "„—›Ê÷"
    frmIndividualOthers3Caption(29, 1) = "Reject"
    frmIndividualOthers3Caption(30, 0) = " ⁄œÌ‹·"
    frmIndividualOthers3Caption(30, 1) = "Update"
    frmIndividualOthers3Caption(31, 0) = "„” ‰œ« "
    frmIndividualOthers3Caption(31, 1) = "Documents"
    frmIndividualOthers3Caption(32, 0) = "€Ì— „€—›"
    frmIndividualOthers3Caption(32, 1) = "Unidentified"
    frmIndividualOthers3Caption(33, 0) = "«·«”„ ⁄·Ï «·»ÿ«ﬁ…"
    frmIndividualOthers3Caption(33, 1) = "Name on the card"
    frmIndividualOthers3Caption(34, 0) = "‰Ê⁄ «·»ÿ«ﬁÂ"
    frmIndividualOthers3Caption(34, 1) = "Card Type"
    frmIndividualOthers3Caption(35, 0) = "œÊ·ÌÂ"
    frmIndividualOthers3Caption(35, 1) = "Elec.Intl"
    frmIndividualOthers3Caption(36, 0) = "–ﬂÌÂ"
    frmIndividualOthers3Caption(36, 1) = "EI.Chip"
    frmIndividualOthers3Caption(37, 0) = "ÿ»«⁄… «·ÿ·»"
    frmIndividualOthers3Caption(37, 1) = "Print Application"
    
        
    frmIndividualSaudiCaption(0, 0) = "’Ì«‰‹‹‹… ⁄„Ì‹‹‹‹‹‹‹·"
    frmIndividualSaudiCaption(0, 1) = "Customer Maintenance"
    frmIndividualSaudiCaption(1, 0) = "—ﬁ‹‹„ «·⁄„Ì‹‹·"
    frmIndividualSaudiCaption(1, 1) = "Customer Number"
    frmIndividualSaudiCaption(2, 0) = "›‹‹‹—⁄"
    frmIndividualSaudiCaption(2, 1) = "Branch"
    frmIndividualSaudiCaption(3, 0) = " «—ÌŒ"
    frmIndividualSaudiCaption(3, 1) = "Date"
    frmIndividualSaudiCaption(4, 0) = "‰Ê⁄ «·⁄„Ì‹‹‹·"
    'frmIndividualSaudiCaption(4, 1) = "Cust. Type"
    'frmIndividualSaudiCaption(5, 0) = "‰‹‹Ê⁄ «·»ÿ«ﬁ…"
    'frmIndividualSaudiCaption(5, 1) = "ID Type"
    frmIndividualSaudiCaption(6, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmIndividualSaudiCaption(6, 1) = "ID Number"
    frmIndividualSaudiCaption(7, 0) = "’«œ— „‰"
    frmIndividualSaudiCaption(7, 1) = "Issued At"
    frmIndividualSaudiCaption(8, 0) = "«· «—Ì‹‹Œ"
    frmIndividualSaudiCaption(8, 1) = "Date Type"
    frmIndividualSaudiCaption(9, 0) = "Â‹"
    frmIndividualSaudiCaption(9, 1) = "H"
    frmIndividualSaudiCaption(10, 0) = "„"
    frmIndividualSaudiCaption(10, 1) = "G"
    frmIndividualSaudiCaption(11, 0) = "«·«’‹œ«—"
    frmIndividualSaudiCaption(11, 1) = "Issue"
    frmIndividualSaudiCaption(12, 0) = "«·«‰ Â«¡"
    frmIndividualSaudiCaption(12, 1) = "Expiry"
    frmIndividualSaudiCaption(13, 0) = "«··€‹‹‹‹‹‹‹‹‹‹‹Â"
    frmIndividualSaudiCaption(13, 1) = "Language"
    frmIndividualSaudiCaption(14, 0) = "⁄—»Ì"
    frmIndividualSaudiCaption(14, 1) = "Arabic"
    frmIndividualSaudiCaption(15, 0) = "«‰Ã·Ì“Ì"
    frmIndividualSaudiCaption(15, 1) = "English"
    frmIndividualSaudiCaption(16, 0) = "«·Ã‰”Ì‹‹‹‹‹Â"
    frmIndividualSaudiCaption(16, 1) = "Nationality"
    frmIndividualSaudiCaption(17, 0) = "«··ﬁ‹‹‹‹‹»"
    frmIndividualSaudiCaption(17, 1) = "Title Code"
    frmIndividualSaudiCaption(18, 0) = "«·«”‹‹‹‹‹„ «·√Ê·"
    frmIndividualSaudiCaption(18, 1) = "First Name"
    frmIndividualSaudiCaption(19, 0) = "«·«”‹‹‹„ «·À«‰Ì"
    frmIndividualSaudiCaption(19, 1) = "2nd Name"
    frmIndividualSaudiCaption(20, 0) = "«·«”‹‹‹„ «·À«·À"
    frmIndividualSaudiCaption(20, 1) = "3rd Name"
    frmIndividualSaudiCaption(21, 0) = "«·«”‹‹‹‹‹„ «·«ŒÌ—"
    frmIndividualSaudiCaption(21, 1) = "Last Name"
    frmIndividualSaudiCaption(22, 0) = "⁄‹‹‹‹‹‹‹‹‹‹—»Ì"
    frmIndividualSaudiCaption(22, 1) = "Arabic"
    frmIndividualSaudiCaption(23, 0) = "«·«”„ «·„Œ ’—"
    frmIndividualSaudiCaption(23, 1) = "Short Name"
    frmIndividualSaudiCaption(24, 0) = "«‰Ã·Ì‹‹‹‹‹‹‹“Ì"
    frmIndividualSaudiCaption(24, 1) = "English"
    frmIndividualSaudiCaption(25, 0) = "—ﬁ„ ‘Â«œ… «·Ê·«œ…"
    frmIndividualSaudiCaption(25, 1) = "Cert. of Birth No"
    frmIndividualSaudiCaption(26, 0) = "«· «—Ì‹‹‹‹‹‹‹Œ"
    frmIndividualSaudiCaption(26, 1) = "Date of Birth"
    frmIndividualSaudiCaption(27, 0) = "Â‹"
    frmIndividualSaudiCaption(27, 1) = "Hijri"
    frmIndividualSaudiCaption(28, 0) = "„"
    frmIndividualSaudiCaption(28, 1) = "Gregorian"
    frmIndividualSaudiCaption(29, 0) = " «—ÌŒ «·‹Ê·«œÂ"
    frmIndividualSaudiCaption(29, 1) = "Date of Birth"
    frmIndividualSaudiCaption(30, 0) = "«·Ã‰‹”"
    frmIndividualSaudiCaption(30, 1) = "Gender"
    frmIndividualSaudiCaption(31, 0) = "–ﬂ‹—"
    frmIndividualSaudiCaption(31, 1) = "Male"
    frmIndividualSaudiCaption(32, 0) = "«‰À‹‹Ï"
    frmIndividualSaudiCaption(32, 1) = "Female"
    frmIndividualSaudiCaption(33, 0) = "VIP"
    frmIndividualSaudiCaption(33, 1) = "VIP"
    frmIndividualSaudiCaption(34, 0) = "‰⁄„"
    frmIndividualSaudiCaption(34, 1) = "Yes"
    frmIndividualSaudiCaption(35, 0) = "·«"
    frmIndividualSaudiCaption(35, 1) = "No"
    frmIndividualSaudiCaption(36, 0) = "«·Õ«·‹‹‹‹‹‹‹‹… «·«Ã „«⁄Ì‹‹‹…"
    frmIndividualSaudiCaption(36, 1) = "Marital Status"
    frmIndividualSaudiCaption(37, 0) = "„ ‹‹“ÊÃ"
    frmIndividualSaudiCaption(37, 1) = "Married"
    frmIndividualSaudiCaption(38, 0) = "«⁄‹‹“»"
    frmIndividualSaudiCaption(38, 1) = "Single"
    frmIndividualSaudiCaption(39, 0) = "«Œ‹‹—Ï"
    frmIndividualSaudiCaption(39, 1) = "Others"
    frmIndividualSaudiCaption(40, 0) = "⁄ √›—«œ«·√”—…"
    frmIndividualSaudiCaption(40, 1) = "Dependents"
    frmIndividualSaudiCaption(41, 0) = "   „ﬁÌ‹‹„/€Ì— „ﬁÌ‹‹‹‹‹‹„"
    frmIndividualSaudiCaption(41, 1) = "   Resident/NonResident"
    frmIndividualSaudiCaption(42, 0) = "„ﬁÌ‹‹‹‹„"
    frmIndividualSaudiCaption(42, 1) = "Resident"
    frmIndividualSaudiCaption(43, 0) = "€Ì— „ﬁÌ‹‹‹‹‹„"
    frmIndividualSaudiCaption(43, 1) = "Non Resident"
    frmIndividualSaudiCaption(44, 0) = "‰Ê⁄ «·⁄„‹‹‹·"
    frmIndividualSaudiCaption(44, 1) = "Business Type"
    frmIndividualSaudiCaption(45, 0) = "”Ã·  Ã‹‹«—Ì"
    frmIndividualSaudiCaption(45, 1) = "C.R.Number"
    frmIndividualSaudiCaption(46, 0) = "’«œ— ›‹‹Ì"
    frmIndividualSaudiCaption(46, 1) = "Issued At"
    frmIndividualSaudiCaption(47, 0) = "«· «—Ì‹‹‹Œ"
    frmIndividualSaudiCaption(47, 1) = "Date Type"
    frmIndividualSaudiCaption(48, 0) = "Â‹"
    frmIndividualSaudiCaption(48, 1) = "Hijri"
    frmIndividualSaudiCaption(49, 0) = "„"
    frmIndividualSaudiCaption(49, 1) = "Gregorian"
    frmIndividualSaudiCaption(50, 0) = " «—ÌŒ «·«’‹œ«—"
    frmIndividualSaudiCaption(50, 1) = "Issue Date"
    frmIndividualSaudiCaption(51, 0) = "«·«”„ »«·⁄—»ÌÂ"
    frmIndividualSaudiCaption(51, 1) = "Arabic Name"
    frmIndividualSaudiCaption(52, 0) = "«·«”„ «·„Œ ’—"
    frmIndividualSaudiCaption(52, 1) = "Short Name"
    frmIndividualSaudiCaption(53, 0) = "«·«”„ »«·«‰Ã·Ì“ÌÂ"
    frmIndividualSaudiCaption(53, 1) = "English Name"
    frmIndividualSaudiCaption(54, 0) = "«·«”„ «·„Œ ’—"
    frmIndividualSaudiCaption(54, 1) = "Short Name"
    frmIndividualSaudiCaption(55, 0) = "«·⁄‰‹‹Ê«‰ "
    frmIndividualSaudiCaption(55, 1) = "Address "
    frmIndividualSaudiCaption(56, 0) = "«·⁄‰Ê«‰ 2"
    frmIndividualSaudiCaption(56, 1) = "Address 2"
    frmIndividualSaudiCaption(57, 0) = "’ . »"
    frmIndividualSaudiCaption(57, 1) = "P.O. Box"
    frmIndividualSaudiCaption(58, 0) = "«·„œÌ‰Â"
    frmIndividualSaudiCaption(58, 1) = "City"
    frmIndividualSaudiCaption(59, 0) = "«·—„“ «·»—ÌœÌ"
    frmIndividualSaudiCaption(59, 1) = "Zip Code"
    frmIndividualSaudiCaption(60, 0) = "«·œÊ·‹Â"
    frmIndividualSaudiCaption(60, 1) = "Country"
    frmIndividualSaudiCaption(61, 0) = " ·›Ê‰ «·⁄„·"
    frmIndividualSaudiCaption(61, 1) = "Phone(Off)"
    frmIndividualSaudiCaption(62, 0) = " ·›Ê‰ «·„‰“·"
    frmIndividualSaudiCaption(62, 1) = "Phone(Res.)"
    frmIndividualSaudiCaption(63, 0) = "›«ﬂ”"
    frmIndividualSaudiCaption(63, 1) = "Fax"
    frmIndividualSaudiCaption(64, 0) = "Ã‹‹‹‹‹‹‹‹Ê«·"
    frmIndividualSaudiCaption(64, 1) = "Mobile"
    frmIndividualSaudiCaption(65, 0) = "»ÌÃ‹—"
    frmIndividualSaudiCaption(65, 1) = "Pager"
    frmIndividualSaudiCaption(66, 0) = "»—Ìœ«·ﬂ —Ê‰Ì"
    frmIndividualSaudiCaption(66, 1) = "E_Mail"
    frmIndividualSaudiCaption(67, 0) = "«·’›Õ… «· «·ÌÂ"
    frmIndividualSaudiCaption(67, 1) = "&Next Page"
    frmIndividualSaudiCaption(68, 0) = "Œ—ÊÃ"
    frmIndividualSaudiCaption(68, 1) = "&Cancel"
    frmIndividualSaudiCaption(69, 0) = "„·«ÕŸ«  «·„‘—›"
    frmIndividualSaudiCaption(69, 1) = "Supervisor Comments"
    frmIndividualSaudiCaption(70, 0) = "„·«ÕŸ«  «·⁄„Ì·"
    frmIndividualSaudiCaption(70, 1) = "Customer Remarks"
    frmIndividualSaudiCaption(71, 0) = "ÂÃ—Ì/„Ì·«œÌ"
    frmIndividualSaudiCaption(71, 1) = "DOE Type"
    frmIndividualSaudiCaption(72, 0) = " «—ÌŒ «·‘—ﬂ…"
    frmIndividualSaudiCaption(72, 1) = "Date of Esta."
    frmIndividualSaudiCaption(73, 0) = "—ﬁ„ «·›—⁄ «·À«‰Ì "
    frmIndividualSaudiCaption(73, 1) = "Alternative Br.code"
    frmIndividualSaudiCaption(74, 0) = "„⁄·Ê„«  «·»ÿ«ﬁ…"
    frmIndividualSaudiCaption(74, 1) = "Card Info"
    frmIndividualSaudiCaption(75, 0) = "«·»ÕÀ «·«»ÃœÌ"
    frmIndividualSaudiCaption(75, 1) = "Org Alpha Search"
    
    frmIndividualSaudiCaption(76, 0) = "ﬂ›Ì›/√„Ì"
    frmIndividualSaudiCaption(76, 1) = "Blind/Iliterat"
    frmIndividualSaudiCaption(77, 0) = "«„—√Â „ÕÃ»…"
    frmIndividualSaudiCaption(77, 1) = "Veiled Woman"
    frmIndividualSaudiCaption(78, 0) = "«·‘Œ’ «·„ÕÃÊ— ⁄·ÌÂ"
    frmIndividualSaudiCaption(78, 1) = "Incompetent Person"
    frmIndividualSaudiCaption(79, 0) = "ﬁ«’—"
    frmIndividualSaudiCaption(79, 1) = "Minor"
    frmIndividualSaudiCaption(80, 0) = "ﬁ«’— Ê»Ÿ—Ê› Œ«’…"
    frmIndividualSaudiCaption(80, 1) = "Minor With Special Circumstances"
    frmIndividualSaudiCaption(81, 0) = "„ Œ·› ⁄ﬁ·Ì«"
    frmIndividualSaudiCaption(81, 1) = "Mentally Disabled"
    
    frmIndividualSaudiCaption(82, 0) = "—ﬁ„ ÃÊ«“ «·”›—"
    frmIndividualSaudiCaption(82, 1) = "Passport No"
    frmIndividualSaudiCaption(83, 0) = "’œ— ›Ì"
    frmIndividualSaudiCaption(83, 1) = "Issued At"
    frmIndividualSaudiCaption(84, 0) = "«· «—Ì‹‹Œ"
    frmIndividualSaudiCaption(84, 1) = "Date Type"
    frmIndividualSaudiCaption(85, 0) = "Â‹"
    frmIndividualSaudiCaption(85, 1) = "H"
    frmIndividualSaudiCaption(86, 0) = "„"
    frmIndividualSaudiCaption(86, 1) = "Gregorian"
    
    frmIndividualSaudiCaption(87, 0) = "«·«’œ«—"
    frmIndividualSaudiCaption(87, 1) = "Issue "
    frmIndividualSaudiCaption(88, 0) = "«·«‰ Â«¡"
    frmIndividualSaudiCaption(88, 1) = "Expiry "
    
    frmIndividualSaudiCaption(89, 0) = "—ﬁ„ «·Õ›ÌŸÂ"
    frmIndividualSaudiCaption(89, 1) = "Hafiza No"
    frmIndividualSaudiCaption(90, 0) = "’œ—  ›Ì"
    frmIndividualSaudiCaption(90, 1) = "Issued At"
    frmIndividualSaudiCaption(91, 0) = "«· «—Ì‹‹Œ"
    frmIndividualSaudiCaption(91, 1) = "Date Type"
    frmIndividualSaudiCaption(92, 0) = "Â‹"
    frmIndividualSaudiCaption(92, 1) = "H"
    frmIndividualSaudiCaption(93, 0) = "„"
    frmIndividualSaudiCaption(93, 1) = "G"
    frmIndividualSaudiCaption(94, 0) = "«·«’œ«—"
    frmIndividualSaudiCaption(94, 1) = "Issue "
    frmIndividualSaudiCaption(95, 0) = "«·«‰ Â«¡"
    frmIndividualSaudiCaption(95, 1) = "Expiry "
    
    frmIndividualSaudiCaption(96, 0) = "—ﬁ„ œ. «·⁄«∆·…"
    frmIndividualSaudiCaption(96, 1) = "Family Regn. No"
    frmIndividualSaudiCaption(97, 0) = "’«œ— ›Ì"
    frmIndividualSaudiCaption(97, 1) = "Issued At"
    'frmIndividualSaudiCaption(98, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmIndividualSaudiCaption(98, 0) = "«· «—Ì‹‹Œ"
    frmIndividualSaudiCaption(98, 1) = "Date Type"
    frmIndividualSaudiCaption(99, 0) = "Â‹"
    frmIndividualSaudiCaption(99, 1) = "H"
    frmIndividualSaudiCaption(100, 0) = "„"
    frmIndividualSaudiCaption(100, 1) = "G"
    frmIndividualSaudiCaption(101, 0) = "«·’œ«—"
    frmIndividualSaudiCaption(101, 1) = "Issue "
    frmIndividualSaudiCaption(102, 0) = "«·«‰ Â«¡"
    frmIndividualSaudiCaption(102, 1) = "Expiry"
    frmIndividualSaudiCaption(103, 0) = "Õ”«»"
    frmIndividualSaudiCaption(103, 1) = "Account"
    frmIndividualSaudiCaption(104, 0) = "—ﬁ„ „Ê«›ﬁ… ”«„«"
    frmIndividualSaudiCaption(104, 1) = "Sama Auth No"
    frmIndividualSaudiCaption(105, 0) = "—ﬁ„ ’ﬂ «·≈—À"
    frmIndividualSaudiCaption(105, 1) = "Succ deed No."
        
    '**frmIndividualSaudi2 - Reference Details**
    
    frmIndividualSaudi2Caption(0, 0) = " ›«’Ì· «·„⁄—›"
    frmIndividualSaudi2Caption(0, 1) = "Reference Details"
    
    frmIndividualSaudi2Caption(1, 0) = "«·„⁄—›/ ›«’Ì· «·„„À· «·ﬁ«‰Ê‰Ì"
    frmIndividualSaudi2Caption(1, 1) = "Reference/Legal Representative Details"
    frmIndividualSaudi2Caption(2, 0) = "—ﬁ„ «·»ÿ«ﬁ…"
    frmIndividualSaudi2Caption(2, 1) = "ID Number"
    frmIndividualSaudi2Caption(3, 0) = "„ﬂ«‰ «·«’œ«—"
    frmIndividualSaudi2Caption(3, 1) = "Issued At"
    frmIndividualSaudi2Caption(4, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmIndividualSaudi2Caption(4, 1) = "ID Date Type"
    frmIndividualSaudi2Caption(5, 0) = "ÂÃ—Ì"
    frmIndividualSaudi2Caption(5, 1) = "Hijri"
    frmIndividualSaudi2Caption(6, 0) = "„Ì·«œÌ"
    frmIndividualSaudi2Caption(6, 1) = "Gregorian"
    frmIndividualSaudi2Caption(7, 0) = " «—ÌŒ «·«’‹œ«—"
    frmIndividualSaudi2Caption(7, 1) = "Issue Date"
    frmIndividualSaudi2Caption(8, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmIndividualSaudi2Caption(8, 1) = "Expiry Date"
    
    frmIndividualSaudi2Caption(9, 0) = "»«·⁄—»ÌÂ"
    frmIndividualSaudi2Caption(9, 1) = "Arabic Name"
    frmIndividualSaudi2Caption(10, 0) = "«·«”„ «·„Œ ’—"
    frmIndividualSaudi2Caption(10, 1) = "Short Name"
    frmIndividualSaudi2Caption(11, 0) = "»«·«‰Ã·Ì“ÌÂ"
    frmIndividualSaudi2Caption(11, 1) = "English Name"
    frmIndividualSaudi2Caption(12, 0) = "‰Ê⁄ «·ÂÊÌ…"
    frmIndividualSaudi2Caption(12, 1) = "Id type"
    
    frmIndividualSaudi2Caption(13, 0) = "«·⁄‰‹‹Ê«‰ "
    frmIndividualSaudi2Caption(13, 1) = "Address "
    frmIndividualSaudi2Caption(14, 0) = "«·⁄‰Ê«‰ 2"
    frmIndividualSaudi2Caption(14, 1) = "Address 2"
    frmIndividualSaudi2Caption(15, 0) = "’ . »"
    frmIndividualSaudi2Caption(15, 1) = "P.O. Box"
    frmIndividualSaudi2Caption(16, 0) = "«·„œÌ‰Â"
    frmIndividualSaudi2Caption(16, 1) = "City"
    frmIndividualSaudi2Caption(17, 0) = "«·—„“ «·»—ÌœÌ"
    frmIndividualSaudi2Caption(17, 1) = "Zip Code"
    frmIndividualSaudi2Caption(18, 0) = "«·œÊ·‹Â"
    frmIndividualSaudi2Caption(18, 1) = "Country"
    frmIndividualSaudi2Caption(19, 0) = " ·›Ê‰ «·⁄„·"
    frmIndividualSaudi2Caption(19, 1) = "Phone(Off)"
    frmIndividualSaudi2Caption(20, 0) = " ·›Ê‰ «·„‰“·"
    frmIndividualSaudi2Caption(20, 1) = "Phone(Res.)"
    frmIndividualSaudi2Caption(21, 0) = "›«ﬂ”"
    frmIndividualSaudi2Caption(21, 1) = "Fax"
    frmIndividualSaudi2Caption(22, 0) = "Ã‹‹‹‹‹‹‹‹Ê«·"
    frmIndividualSaudi2Caption(22, 1) = "Mobile"
    frmIndividualSaudi2Caption(23, 0) = "»ÌÃ‹—"
    frmIndividualSaudi2Caption(23, 1) = "Pager"
    frmIndividualSaudi2Caption(24, 0) = "»—Ìœ«·ﬂ —Ê‰Ì"
    frmIndividualSaudi2Caption(24, 1) = "E_Mail"
    frmIndividualSaudi2Caption(25, 0) = "«·’›Õ… «· «·ÌÂ"
    frmIndividualSaudi2Caption(25, 1) = "&Next Page"
    frmIndividualSaudi2Caption(26, 0) = "Œ—ÊÃ"
    frmIndividualSaudi2Caption(26, 1) = "&Cancel"

    frmIndividualSaudi2Caption(27, 0) = "‰Ê⁄ «·„⁄—›"
    frmIndividualSaudi2Caption(27, 1) = "Reference Type"
    frmIndividualSaudi2Caption(28, 0) = "«÷«›…"
    frmIndividualSaudi2Caption(28, 1) = "Add"
    frmIndividualSaudi2Caption(29, 0) = " ⁄œÌ·"
    frmIndividualSaudi2Caption(29, 1) = "Update"
    frmIndividualSaudi2Caption(30, 0) = "«·’›Õ… «·”«»ﬁ…"
    frmIndividualSaudi2Caption(30, 1) = "Previous Page"
    
    frmIndividualSaudi2Caption(31, 0) = "ﬂ›Ì›/√„Ì"
    frmIndividualSaudi2Caption(31, 1) = "Blind/Iliterat"
    frmIndividualSaudi2Caption(32, 0) = "«„—√Â „ÕÃ»…"
    frmIndividualSaudi2Caption(32, 1) = "Veiled Woman"
    frmIndividualSaudi2Caption(33, 0) = "«·‘Œ’ «·„ÕÃÊ— ⁄·Ì…"
    frmIndividualSaudi2Caption(33, 1) = "Incompetent Person"
    frmIndividualSaudi2Caption(34, 0) = "ﬁ«’—"
    frmIndividualSaudi2Caption(34, 1) = "Minor"
    frmIndividualSaudi2Caption(35, 0) = "ﬁ«’— Ê»Ÿ—Ê› Œ«’…"
    frmIndividualSaudi2Caption(35, 1) = "Minor With Special Circumstances"
    frmIndividualSaudi2Caption(36, 0) = "„ Œ·› ⁄ﬁ·Ì«"
    frmIndividualSaudi2Caption(36, 1) = "Mentally Disabled"
    frmIndividualSaudi2Caption(37, 0) = "—ﬁ„ «·⁄„Ì·"
    frmIndividualSaudi2Caption(37, 1) = "Customer #"
    frmIndividualSaudi2Caption(38, 0) = "—ﬁ„ «·„⁄—›"
    frmIndividualSaudi2Caption(38, 1) = "Reference #"
    frmIndividualSaudi2Caption(39, 0) = "«”„ «·„⁄—›"
    frmIndividualSaudi2Caption(39, 1) = "Reference Name"
    frmIndividualSaudi2Caption(40, 0) = "—„“ ›—⁄ «·⁄„Ì·"
    frmIndividualSaudi2Caption(40, 1) = "Customer branch code"
    frmIndividualSaudi2Caption(41, 0) = "‰Ê⁄ «·ÂÊÌ…-—ﬁ„ «·ÂÊÌ…"
    frmIndividualSaudi2Caption(41, 1) = "Id type-Id number"
        
    frmIndividualSaudi2Caption(42, 0) = "«·„⁄—› «·Ï"
    frmIndividualSaudi2Caption(42, 1) = "Reference for"
    frmIndividualSaudi2Caption(43, 0) = "«·’›Õ… «· «·Ì…"
    frmIndividualSaudi2Caption(43, 1) = "Next Page"
    frmIndividualSaudi2Caption(44, 0) = "Œ—ÊÃ"
    frmIndividualSaudi2Caption(44, 1) = "Cancel"
    
    frmIndividualSaudi2Caption(45, 0) = "—ﬁ„ «·⁄„Ì·"
    frmIndividualSaudi2Caption(45, 1) = "Customer #"
    frmIndividualSaudi2Caption(46, 0) = "—ﬁ„ «·Ê—ÌÀ"
    frmIndividualSaudi2Caption(46, 1) = "Heir #"
    frmIndividualSaudi2Caption(47, 0) = "«”„ «·Ê—ÌÀ"
    frmIndividualSaudi2Caption(47, 1) = "Heir Name"
    frmIndividualSaudi2Caption(48, 0) = "—„“ ›—⁄ «·⁄„Ì·"
    frmIndividualSaudi2Caption(48, 1) = "Customer branch code"
    frmIndividualSaudi2Caption(49, 0) = "‰Ê⁄ «·ÂÊÌ…-—ﬁ„ «·ÂÊÌ…"
    frmIndividualSaudi2Caption(49, 1) = "Id type-Id number"

    frmIndividualSaudi2Caption(50, 0) = "»Ì«‰«  «·Ê—ÌÀ/«·ÊﬂÌ·"
    frmIndividualSaudi2Caption(50, 1) = "Heirs/Proxy Details"
    frmIndividualSaudi2Caption(51, 0) = "»Ì«‰«  «·Ê—ÌÀ"
    frmIndividualSaudi2Caption(51, 1) = "Heir Details"
    frmIndividualSaudi2Caption(52, 0) = "‰Ê⁄"
    frmIndividualSaudi2Caption(52, 1) = "Heir Type"
    frmIndividualSaudi2Caption(53, 0) = "«·Ê—ÌÀ"
    frmIndividualSaudi2Caption(53, 1) = "Heir"
    frmIndividualSaudi2Caption(54, 0) = "«·ÊﬂÌ·"
    frmIndividualSaudi2Caption(54, 1) = "Proxy"
    frmIndividualSaudi2Caption(55, 0) = "—ﬁ„ «·Êﬂ«·…"
    frmIndividualSaudi2Caption(55, 1) = "Proxy No."
    
    frmIndividualSaudi2Caption(56, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmIndividualSaudi2Caption(56, 1) = "Date Type"
    frmIndividualSaudi2Caption(57, 0) = "Â‹"
    frmIndividualSaudi2Caption(57, 1) = "Hijri"
    frmIndividualSaudi2Caption(58, 0) = "„"
    frmIndividualSaudi2Caption(58, 1) = "Greg"
    frmIndividualSaudi2Caption(59, 0) = " «—ÌŒ «·«’œ«—"
    frmIndividualSaudi2Caption(59, 1) = "Issue Date"
    
    frmIndividualSaudi2Caption(60, 0) = " ›«’Ì· «·Ê·Ì"
    frmIndividualSaudi2Caption(60, 1) = "Parents details"
    
    
    'frmIndividualSaudiAcctInfo

    frmIndividualSaudiAcctInfoCaption(0, 0) = " ›«’Ì· «·Õ”«» «·›—œÌ ··”⁄ÊœÌ"
    frmIndividualSaudiAcctInfoCaption(0, 1) = "Individual Saudi Account Details"
    frmIndividualSaudiAcctInfoCaption(1, 0) = "«·„ƒÂ‹‹‹‹‹‹‹·"
    frmIndividualSaudiAcctInfoCaption(1, 1) = "Education"
    frmIndividualSaudiAcctInfoCaption(2, 0) = " Œ’‹‹‹‹‹‹‹’"
    frmIndividualSaudiAcctInfoCaption(2, 1) = "Profession"
    frmIndividualSaudiAcctInfoCaption(3, 0) = "«·ÊŸÌ›‹Â"
    frmIndividualSaudiAcctInfoCaption(3, 1) = "Position"
    frmIndividualSaudiAcctInfoCaption(4, 0) = "«·œŒ· «·‘Â‹‹—Ì"
    frmIndividualSaudiAcctInfoCaption(4, 1) = "Monthly Income"
    frmIndividualSaudiAcctInfoCaption(5, 0) = "«· ’‰Ì‹‹‹‹‹›"
    frmIndividualSaudiAcctInfoCaption(5, 1) = "Segmentation"
    frmIndividualSaudiAcctInfoCaption(6, 0) = "„«·‹‹‹‹‹‹‹‹‹ﬂ"
    frmIndividualSaudiAcctInfoCaption(6, 1) = "Owner Ship"
    frmIndividualSaudiAcctInfoCaption(7, 0) = "„” √Ã‹—"
    frmIndividualSaudiAcctInfoCaption(7, 1) = "Rented Home"
    frmIndividualSaudiAcctInfoCaption(8, 0) = "„‰“· Œ‹«’"
    frmIndividualSaudiAcctInfoCaption(8, 1) = "Own House"
    frmIndividualSaudiAcctInfoCaption(9, 0) = "«”ﬂ«‰ ‘—ﬂ‹‹Â"
    frmIndividualSaudiAcctInfoCaption(9, 1) = "Com.Accomodation"
    frmIndividualSaudiAcctInfoCaption(10, 0) = "”Ì«—…„” √Ã—Â"
    frmIndividualSaudiAcctInfoCaption(10, 1) = "Rented Car"
    frmIndividualSaudiAcctInfoCaption(11, 0) = "”Ì«—…Œ«’Â"
    frmIndividualSaudiAcctInfoCaption(11, 1) = "Own Car"
    frmIndividualSaudiAcctInfoCaption(12, 0) = "‰ﬁ‹‹· ‘—ﬂ‹‹Â"
    frmIndividualSaudiAcctInfoCaption(12, 1) = "Company Transport"
    frmIndividualSaudiAcctInfoCaption(13, 0) = "’«Õ» «·⁄„·"
    frmIndividualSaudiAcctInfoCaption(13, 1) = "Employer Name"
    frmIndividualSaudiAcctInfoCaption(14, 0) = "«·œ«∆—Â"
    frmIndividualSaudiAcctInfoCaption(14, 1) = "Dept."
    frmIndividualSaudiAcctInfoCaption(15, 0) = "’ » "
    frmIndividualSaudiAcctInfoCaption(15, 1) = "P.O."
    frmIndividualSaudiAcctInfoCaption(16, 0) = "«·„œÌ‰Â"
    frmIndividualSaudiAcctInfoCaption(16, 1) = "City"
    frmIndividualSaudiAcctInfoCaption(17, 0) = "«·—„“ «·»—ÌœÌ"
    frmIndividualSaudiAcctInfoCaption(17, 1) = "Zip"
    frmIndividualSaudiAcctInfoCaption(18, 0) = "⁄„Ì· „ „Ì“"
    frmIndividualSaudiAcctInfoCaption(18, 1) = "Package A/c"
    frmIndividualSaudiAcctInfoCaption(19, 0) = "·«‘Ì¡"
    frmIndividualSaudiAcctInfoCaption(19, 1) = "None"
    frmIndividualSaudiAcctInfoCaption(20, 0) = "–Â»Ì"
    frmIndividualSaudiAcctInfoCaption(20, 1) = "Gold"
    frmIndividualSaudiAcctInfoCaption(21, 0) = "Õ”‹‹«» Ã‹«—Ì"
    frmIndividualSaudiAcctInfoCaption(21, 1) = "Current A/c"
    frmIndividualSaudiAcctInfoCaption(22, 0) = "⁄„·Â"
    frmIndividualSaudiAcctInfoCaption(22, 1) = "Curr."
    frmIndividualSaudiAcctInfoCaption(23, 0) = "Ê÷⁄ «·Õ”«»"
    frmIndividualSaudiAcctInfoCaption(23, 1) = "Acc.Status"
    frmIndividualSaudiAcctInfoCaption(24, 0) = "«’œ«—«·ﬂ‘›"
    frmIndividualSaudiAcctInfoCaption(24, 1) = "Stmt.Freq."
    frmIndividualSaudiAcctInfoCaption(25, 0) = "œ› — ‘Ìﬂ« "
    frmIndividualSaudiAcctInfoCaption(25, 1) = "Check Book"
    frmIndividualSaudiAcctInfoCaption(26, 0) = "Õ”«»  Ê›Ì‹‹—"
    frmIndividualSaudiAcctInfoCaption(26, 1) = "Saving A/c"
    frmIndividualSaudiAcctInfoCaption(27, 0) = "«Œ‹‹‹‹‹‹‹‹‹‹‹—Ï"
    frmIndividualSaudiAcctInfoCaption(27, 1) = "Other A/c"
    frmIndividualSaudiAcctInfoCaption(28, 0) = "„›‹‹—œ/„‘ —ﬂ"
    frmIndividualSaudiAcctInfoCaption(28, 1) = "Single/JointA/c"
    frmIndividualSaudiAcctInfoCaption(29, 0) = "„›‹‹—œ"
    frmIndividualSaudiAcctInfoCaption(29, 1) = "Single"
    frmIndividualSaudiAcctInfoCaption(30, 0) = "„‘ ‹—ﬂ"
    frmIndividualSaudiAcctInfoCaption(30, 1) = "Joint"
    frmIndividualSaudiAcctInfoCaption(31, 0) = "ÿ»Ì⁄… «· ÊﬁÌ‹‹‹‹‹‹⁄"
    frmIndividualSaudiAcctInfoCaption(31, 1) = "Nature of signature"
    frmIndividualSaudiAcctInfoCaption(32, 0) = "«·«”„ ⁄·Ï «·»ÿ«ﬁÂ"
    frmIndividualSaudiAcctInfoCaption(32, 1) = "Name on the card"
    frmIndividualSaudiAcctInfoCaption(33, 0) = "»ÿ«ﬁ‹… œÊ·‹‹‹‹‹‹Ì…"
    frmIndividualSaudiAcctInfoCaption(33, 1) = "Primary Int'l card"
    frmIndividualSaudiAcctInfoCaption(34, 0) = "»ÿ«ﬁ…œÊ·Ì…«÷«›‹‹‹‹‹‹Ì…"
    frmIndividualSaudiAcctInfoCaption(34, 1) = "Secondary Int'l card"
    frmIndividualSaudiAcctInfoCaption(35, 0) = " ”·„ «·»ÿ«ﬁÂ «·Ï"
    frmIndividualSaudiAcctInfoCaption(35, 1) = "Card Delivered to"
    frmIndividualSaudiAcctInfoCaption(36, 0) = "›—⁄ «·⁄„Ì·"
    frmIndividualSaudiAcctInfoCaption(36, 1) = "Customer Branch"
    frmIndividualSaudiAcctInfoCaption(37, 0) = "«·›—⁄ ÿ«·» «·»ÿ«ﬁ…"
    frmIndividualSaudiAcctInfoCaption(37, 1) = "Request Branch"
    frmIndividualSaudiAcctInfoCaption(38, 0) = "»—Ì‹œ"
    frmIndividualSaudiAcctInfoCaption(38, 1) = "Mail"
    frmIndividualSaudiAcctInfoCaption(39, 0) = "⁄‰Ê«‰ «· ”·Ì„ 1"
    frmIndividualSaudiAcctInfoCaption(39, 1) = "Delivery Address1"
    frmIndividualSaudiAcctInfoCaption(40, 0) = "«·⁄‰Ê«‰ 2"
    frmIndividualSaudiAcctInfoCaption(40, 1) = "Address2"
    frmIndividualSaudiAcctInfoCaption(41, 0) = "»—Ì‹œ"
    frmIndividualSaudiAcctInfoCaption(41, 1) = "Mail"
    frmIndividualSaudiAcctInfoCaption(42, 0) = "«·„œÌ‰Â"
    frmIndividualSaudiAcctInfoCaption(42, 1) = "City"
    frmIndividualSaudiAcctInfoCaption(43, 0) = "«·—„“ «·»—ÌœÌ"
    frmIndividualSaudiAcctInfoCaption(43, 1) = "Zip code"
    frmIndividualSaudiAcctInfoCaption(44, 0) = "«·’›Õ… «·”«»ﬁ…"
    frmIndividualSaudiAcctInfoCaption(44, 1) = "Previous Page"
    frmIndividualSaudiAcctInfoCaption(45, 0) = "«÷‹‹‹«›…"
    frmIndividualSaudiAcctInfoCaption(45, 1) = "Create"
    frmIndividualSaudiAcctInfoCaption(46, 0) = "Õ”«» „‘ —ﬂ"
    frmIndividualSaudiAcctInfoCaption(46, 1) = "Joint Account"
    frmIndividualSaudiAcctInfoCaption(47, 0) = "Œ—ÊÃ"
    frmIndividualSaudiAcctInfoCaption(47, 1) = "Cancel"
    frmIndividualSaudiAcctInfoCaption(48, 0) = "„Ê«›ﬁ"
    frmIndividualSaudiAcctInfoCaption(48, 1) = "Approve"
    frmIndividualSaudiAcctInfoCaption(49, 0) = "„—›Ê÷"
    frmIndividualSaudiAcctInfoCaption(49, 1) = "Reject"
    frmIndividualSaudiAcctInfoCaption(50, 0) = " ⁄œÌ‹·"
    frmIndividualSaudiAcctInfoCaption(50, 1) = "Update"
    frmIndividualSaudiAcctInfoCaption(51, 0) = "⁄„Ì· «·⁄—»Ì ≈‰ —‰ "
    frmIndividualSaudiAcctInfoCaption(51, 1) = "Internet Bank"
    frmIndividualSaudiAcctInfoCaption(52, 0) = "≈‘⁄«— ·ﬂ· Õ—ﬂ…"
    frmIndividualSaudiAcctInfoCaption(52, 1) = "Cust.Advice Flag"
    frmIndividualSaudiAcctInfoCaption(53, 0) = " ÕœÌÀ «·»Ì«‰«  ﬂÿ·» ”«„«"
    frmIndividualSaudiAcctInfoCaption(53, 1) = "Cust.updated for SAMA"
    frmIndividualSaudiAcctInfoCaption(54, 0) = "„œÌ— «·Õ”«»/«·⁄·«ﬁ…"
    frmIndividualSaudiAcctInfoCaption(54, 1) = "Relationship Manager"
    frmIndividualSaudiAcctInfoCaption(55, 0) = "„·«ÕŸ«  ⁄«„…"
    frmIndividualSaudiAcctInfoCaption(55, 1) = "General Memo"
    frmIndividualSaudiAcctInfoCaption(56, 0) = "‰⁄„"
    frmIndividualSaudiAcctInfoCaption(56, 1) = "Yes"
    frmIndividualSaudiAcctInfoCaption(57, 0) = "·«"
    frmIndividualSaudiAcctInfoCaption(57, 1) = "No"
    frmIndividualSaudiAcctInfoCaption(58, 0) = "„” ‰œ« "
    frmIndividualSaudiAcctInfoCaption(58, 1) = "Documents"
    frmIndividualSaudiAcctInfoCaption(59, 0) = "€Ì— „€—›"
    frmIndividualSaudiAcctInfoCaption(59, 1) = "Unidentified"
    frmIndividualSaudiAcctInfoCaption(60, 0) = "‰Ê⁄ «·»ÿ«ﬁÂ"
    frmIndividualSaudiAcctInfoCaption(60, 1) = "Card Type"
    frmIndividualSaudiAcctInfoCaption(61, 0) = "œÊ·ÌÂ"
    frmIndividualSaudiAcctInfoCaption(61, 1) = "Elec.Intl"
    frmIndividualSaudiAcctInfoCaption(62, 0) = "–ﬂÌÂ"
    frmIndividualSaudiAcctInfoCaption(62, 1) = "EI.Chip"
    frmIndividualSaudiAcctInfoCaption(63, 0) = "„·«ÕŸ«  «· ”ÊÌﬁ"
    frmIndividualSaudiAcctInfoCaption(63, 1) = "Marketing Memo"
    frmIndividualSaudiAcctInfoCaption(64, 0) = "ÿ»«⁄… «·ÿ·»"
    frmIndividualSaudiAcctInfoCaption(64, 1) = "Print Application"
    frmIndividualSaudiAcctInfoCaption(65, 0) = "«” À‰«¡ „‰"
    frmIndividualSaudiAcctInfoCaption(65, 1) = "Exclude from"
    frmIndividualSaudiAcctInfoCaption(66, 0) = "—”Ê„ ’—«›"
    frmIndividualSaudiAcctInfoCaption(66, 1) = "ATM fees"
    frmIndividualSaudiAcctInfoCaption(67, 0) = "—”Ê„ «·Õœ «·«œ‰Ï ··—’Ìœ"
    frmIndividualSaudiAcctInfoCaption(67, 1) = "Minimum balance fees"
    frmIndividualSaudiAcctInfoCaption(68, 0) = "› —… «· Ã„Ìœ"
    frmIndividualSaudiAcctInfoCaption(68, 1) = "Freezing grace period"
    frmIndividualSaudiAcctInfoCaption(69, 0) = "—„“  ›⁄Ì· ﬂ‘› «·Õ”«»"
    frmIndividualSaudiAcctInfoCaption(69, 1) = "Segment Statement override"
    
    
    frmDocumentsCaption(0, 0) = "«·„” ‰œ«  «·„ÿ·Ê»…"
    frmDocumentsCaption(0, 1) = "Essential Documents"
    frmDocumentsCaption(1, 0) = "ﬁ«∆„… «·„” ‰œ«  ·· ’‰Ì› «·›—⁄Ì"
    frmDocumentsCaption(1, 1) = "Documents List for Sub Category"
    frmDocumentsCaption(2, 0) = "«·„” ‰œ«  «·„ﬁœ„…"
    frmDocumentsCaption(2, 1) = "Documents Submitted"
    frmDocumentsCaption(3, 0) = "«Œ—Ï"
    frmDocumentsCaption(3, 1) = "Others"
    frmDocumentsCaption(4, 0) = "‰⁄„"
    frmDocumentsCaption(4, 1) = "Ok"
    frmDocumentsCaption(5, 0) = "Œ—ÊÃ"
    frmDocumentsCaption(5, 1) = "Exit"
    
    
    frmJuristicMainCaption(0, 0) = " ›«’Ì· «·⁄„Ì· «·„ﬁÌ„ «·«⁄ »«—Ì"
    frmJuristicMainCaption(0, 1) = "Resident Juristic Customer Details"
    frmJuristicMainCaption(1, 0) = "”Ã·  Ã«—Ì"
    frmJuristicMainCaption(1, 1) = "C.R Number"
    frmJuristicMainCaption(2, 0) = "’«œ— „‰"
    frmJuristicMainCaption(2, 1) = "Issued At"
    frmJuristicMainCaption(3, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmJuristicMainCaption(3, 1) = "Date Type"
    frmJuristicMainCaption(4, 0) = "Â‹"
    frmJuristicMainCaption(4, 1) = "H"
    frmJuristicMainCaption(5, 0) = "„"
    frmJuristicMainCaption(5, 1) = "G"
    frmJuristicMainCaption(6, 0) = "’œÊ—"
    frmJuristicMainCaption(6, 1) = "Issue"
    frmJuristicMainCaption(7, 0) = "«‰ Â«¡"
    frmJuristicMainCaption(7, 1) = "Exp"
    frmJuristicMainCaption(8, 0) = "—ﬁ„ «·—Œ’…"
    frmJuristicMainCaption(8, 1) = "License No"
    frmJuristicMainCaption(9, 0) = " «—ÌŒ «·«’œ«—"
    frmJuristicMainCaption(9, 1) = "Issue Date"
    frmJuristicMainCaption(10, 0) = "  . «·«‰ Â«¡"
    frmJuristicMainCaption(10, 1) = "Expiry Date"
    frmJuristicMainCaption(11, 0) = "—ﬁ„ „Ê«›ﬁ… ”«„«"
    frmJuristicMainCaption(11, 1) = "SAMA Auth No"
    frmJuristicMainCaption(12, 0) = "«·Ã‰”Ì…"
    frmJuristicMainCaption(12, 1) = "Nationality"
    frmJuristicMainCaption(13, 0) = "«··€Â"
    frmJuristicMainCaption(13, 1) = "Language"
    frmJuristicMainCaption(14, 0) = "⁄—»Ì"
    frmJuristicMainCaption(14, 1) = "Arabic"
    frmJuristicMainCaption(15, 0) = "«‰Ã·Ì“Ì"
    frmJuristicMainCaption(15, 1) = "English"
    frmJuristicMainCaption(16, 0) = "«·«”„ «·«Ê·"
    frmJuristicMainCaption(16, 1) = "First Name"
    frmJuristicMainCaption(17, 0) = "«·«”„ «·À«‰Ì"
    frmJuristicMainCaption(17, 1) = "2nd Name"
    frmJuristicMainCaption(18, 0) = "«·«”„ «·„Œ ’—"
    frmJuristicMainCaption(18, 1) = "Short Name"
    frmJuristicMainCaption(19, 0) = "⁄—»Ì"
    frmJuristicMainCaption(19, 1) = "Arabic"
    frmJuristicMainCaption(20, 0) = "«‰Ã·Ì“Ì"
    frmJuristicMainCaption(20, 1) = "English"
    frmJuristicMainCaption(21, 0) = "«·€—÷ „‰ «·Õ”«»"
    frmJuristicMainCaption(21, 1) = "Purpose of Account"
    frmJuristicMainCaption(22, 0) = "‰”»… „”«Â„… «·œÊ·…"
    frmJuristicMainCaption(22, 1) = "Govt. Shareholding"
    frmJuristicMainCaption(23, 0) = "‰”»… „”«Â„… «·”⁄ÊœÌÊ‰"
    frmJuristicMainCaption(23, 1) = "Saudi Shareholding"
    frmJuristicMainCaption(24, 0) = "‰”»… „”«Â„… «·«Ã«‰»"
    frmJuristicMainCaption(24, 1) = "Foreign Shareholding"
    frmJuristicMainCaption(25, 0) = " «—ÌŒ «·«‰‘«¡"
    frmJuristicMainCaption(25, 1) = "Date of Esta"
    frmJuristicMainCaption(26, 0) = "‰Ê⁄ «·⁄„·"
    frmJuristicMainCaption(26, 1) = "Business Type"
    frmJuristicMainCaption(27, 0) = "⁄‰Ê«‰ «·„ﬂ »"
    frmJuristicMainCaption(27, 1) = "Off.Address"
    frmJuristicMainCaption(28, 0) = "’.»."
    frmJuristicMainCaption(28, 1) = "P.O. Box"
    frmJuristicMainCaption(29, 0) = "«·„œÌ‰…"
    frmJuristicMainCaption(29, 1) = "City"
    frmJuristicMainCaption(30, 0) = "—„“  »—ÌœÌ"
    frmJuristicMainCaption(30, 1) = "Zip Code"
    frmJuristicMainCaption(31, 0) = "«·œÊ·…"
    frmJuristicMainCaption(31, 1) = "Country"
    frmJuristicMainCaption(32, 0) = "Â« › «·„ﬂ »"
    frmJuristicMainCaption(32, 1) = "Phone(Off)"
    frmJuristicMainCaption(33, 0) = "Â« › «·„‰“·"
    frmJuristicMainCaption(33, 1) = "Phone(Res.)"
    frmJuristicMainCaption(34, 0) = "›«ﬂ”"
    frmJuristicMainCaption(34, 1) = "Fax"
    frmJuristicMainCaption(35, 0) = "ÃÊ«·"
    frmJuristicMainCaption(35, 1) = "Mobile"
    frmJuristicMainCaption(36, 0) = "»ÌÃ—"
    frmJuristicMainCaption(36, 1) = "Pager"
    frmJuristicMainCaption(37, 0) = "»—Ìœ «·Ìﬂ —Ê‰Ì"
    frmJuristicMainCaption(37, 1) = "E.Mail"
    frmJuristicMainCaption(38, 0) = "Õ”«»"
    frmJuristicMainCaption(38, 1) = "Account"
    frmJuristicMainCaption(39, 0) = "„·«ÕŸ«  «·„‘—›"
    frmJuristicMainCaption(39, 1) = "Supervisor comments"
    frmJuristicMainCaption(40, 0) = "«·’›Õ… «· «·Ì…"
    frmJuristicMainCaption(40, 1) = "Next Page"
    frmJuristicMainCaption(41, 0) = "Œ—ÊÃ"
    frmJuristicMainCaption(41, 1) = "Cancel"
    frmJuristicMainCaption(42, 0) = "«·»ÕÀ «·«»ÃœÌ"
    frmJuristicMainCaption(42, 1) = "Alpha Search"
    frmJuristicMainCaption(43, 0) = "—ﬁ„ «·„Ê«›ﬁ… "
    frmJuristicMainCaption(43, 1) = "Approver No."
    frmJuristicMainCaption(44, 0) = "«·ÃÂ… «·„Ê«›ﬁ… "
    frmJuristicMainCaption(44, 1) = "Approver Name"
    
    frmJuristicAccountInfoCaption(0, 0) = " ›«’Ì· «·Õ”«»"
    frmJuristicAccountInfoCaption(0, 1) = "Account Details"
    frmJuristicAccountInfoCaption(1, 0) = "«·⁄‰Ê«‰ ›Ì «·»·œ «·«„"
    frmJuristicAccountInfoCaption(1, 1) = "Home Address"
    frmJuristicAccountInfoCaption(2, 0) = "’. »."
    frmJuristicAccountInfoCaption(2, 1) = "P.O. Box"
    frmJuristicAccountInfoCaption(3, 0) = "«·„œÌ‰…"
    frmJuristicAccountInfoCaption(3, 1) = "City"
    frmJuristicAccountInfoCaption(4, 0) = "—„“ »—ÌœÌ"
    frmJuristicAccountInfoCaption(4, 1) = "Zip Code"
    frmJuristicAccountInfoCaption(5, 0) = "«·œÊ·…"
    frmJuristicAccountInfoCaption(5, 1) = "Country"
    frmJuristicAccountInfoCaption(6, 0) = "Â« › «·„ﬂ »"
    frmJuristicAccountInfoCaption(6, 1) = "Phone(Off)"
    frmJuristicAccountInfoCaption(7, 0) = "Â« › «·„‰“·"
    frmJuristicAccountInfoCaption(7, 1) = "Phone(Res.)"
    frmJuristicAccountInfoCaption(8, 0) = "›«ﬂ”"
    frmJuristicAccountInfoCaption(8, 1) = "Fax"
    frmJuristicAccountInfoCaption(9, 0) = "ÃÊ«·"
    frmJuristicAccountInfoCaption(9, 1) = "Mobile"
    frmJuristicAccountInfoCaption(10, 0) = "»ÌÃ—"
    frmJuristicAccountInfoCaption(10, 1) = "Pager"
    frmJuristicAccountInfoCaption(11, 0) = "»—Ìœ «·Ìﬂ —Ê‰Ì"
    frmJuristicAccountInfoCaption(11, 1) = "E-Mail"
    frmJuristicAccountInfoCaption(12, 0) = " ÕœÌÀ «·»Ì«‰«  ﬂÿ·» ”«„«"
    frmJuristicAccountInfoCaption(12, 1) = "Cust.updated for SAMA"
    frmJuristicAccountInfoCaption(13, 0) = "„œÌ— «·Õ”«»/«·⁄·«ﬁ…"
    frmJuristicAccountInfoCaption(13, 1) = "Relationship Manager"
    frmJuristicAccountInfoCaption(14, 0) = "„·«ÕŸ«  ⁄«„…"
    frmJuristicAccountInfoCaption(14, 1) = "General Memo"
    frmJuristicAccountInfoCaption(15, 0) = "⁄„Ì· ⁄ ≈‰ —‰ "
    frmJuristicAccountInfoCaption(15, 1) = "Internet Bank"
    frmJuristicAccountInfoCaption(16, 0) = "≈‘⁄«— ·ﬂ· Õ—ﬂ…"
    frmJuristicAccountInfoCaption(16, 1) = "Cust.Advice Flag"
    frmJuristicAccountInfoCaption(17, 0) = "‰⁄„"
    frmJuristicAccountInfoCaption(17, 1) = "Yes"
    frmJuristicAccountInfoCaption(18, 0) = "·«"
    frmJuristicAccountInfoCaption(18, 1) = "No"
    frmJuristicAccountInfoCaption(19, 0) = "Õ”‹‹«» Ã‹«—Ì"
    frmJuristicAccountInfoCaption(19, 1) = "Current A/c"
    frmJuristicAccountInfoCaption(20, 0) = "⁄„·Â"
    frmJuristicAccountInfoCaption(20, 1) = "Curr."
    frmJuristicAccountInfoCaption(21, 0) = "Ê÷⁄ «·Õ”«»"
    frmJuristicAccountInfoCaption(21, 1) = "Acc.Status"
    frmJuristicAccountInfoCaption(22, 0) = "«’œ«—«·ﬂ‘›"
    frmJuristicAccountInfoCaption(22, 1) = "Stmt.Freq."
    frmJuristicAccountInfoCaption(23, 0) = "œ› — ‘Ìﬂ« "
    frmJuristicAccountInfoCaption(23, 1) = "Check Book"
    frmJuristicAccountInfoCaption(24, 0) = "Õ”«»  Ê›Ì‹‹—"
    frmJuristicAccountInfoCaption(24, 1) = "Saving A/c"
    frmJuristicAccountInfoCaption(25, 0) = "«Œ‹‹‹‹‹‹‹‹‹‹‹—Ï"
    frmJuristicAccountInfoCaption(25, 1) = "Other A/c"
    frmJuristicAccountInfoCaption(26, 0) = "„›‹‹—œ"
    frmJuristicAccountInfoCaption(26, 1) = "Single"
    frmJuristicAccountInfoCaption(27, 0) = "„‘ ‹—ﬂ"
    frmJuristicAccountInfoCaption(27, 1) = "Joint"
    frmJuristicAccountInfoCaption(28, 0) = "ÿ»Ì⁄… «· ÊﬁÌ‹‹‹‹‹‹⁄"
    frmJuristicAccountInfoCaption(28, 1) = "Nature of signature"
    frmJuristicAccountInfoCaption(29, 0) = "«·’›Õ… «·”«»ﬁ…"
    frmJuristicAccountInfoCaption(29, 1) = "Previous Page"
    frmJuristicAccountInfoCaption(30, 0) = "«÷‹‹‹«›…"
    frmJuristicAccountInfoCaption(30, 1) = "Create"
    frmJuristicAccountInfoCaption(31, 0) = "Œ—ÊÃ"
    frmJuristicAccountInfoCaption(31, 1) = "Cancel"
    frmJuristicAccountInfoCaption(32, 0) = "„Ê«›ﬁ"
    frmJuristicAccountInfoCaption(32, 1) = "Approve"
    frmJuristicAccountInfoCaption(33, 0) = "„—›Ê÷"
    frmJuristicAccountInfoCaption(33, 1) = "Reject"
    frmJuristicAccountInfoCaption(34, 0) = " ⁄œÌ‹·"
    frmJuristicAccountInfoCaption(34, 1) = "Update"
    frmJuristicAccountInfoCaption(35, 0) = "„” ‰œ« "
    frmJuristicAccountInfoCaption(35, 1) = "Documents"
    frmJuristicAccountInfoCaption(36, 0) = " ›«’Ì· «·„›Ê÷ »«· ÊﬁÌ⁄"
    frmJuristicAccountInfoCaption(36, 1) = "Signatory details"
    frmJuristicAccountInfoCaption(37, 0) = " ›«’Ì· «·„«·ﬂ"
    frmJuristicAccountInfoCaption(37, 1) = "Owner details"
    frmJuristicAccountInfoCaption(38, 0) = "„·«ÕŸ«  «· ”ÊÌﬁ"
    frmJuristicAccountInfoCaption(38, 1) = "Marketing Memo"
    frmJuristicAccountInfoCaption(39, 0) = "› —… «· Ã„Ìœ"
    frmJuristicAccountInfoCaption(39, 1) = "Freezing Grace period"
    
    frmJuristicDiplomatsCaption(0, 0) = " ›«’Ì· «·⁄„Ì· «·œ»·Ê„«”Ì «·«⁄ »«—Ì"
    frmJuristicDiplomatsCaption(0, 1) = "Juristic Diplomats Customer Details"
    frmJuristicDiplomatsCaption(1, 0) = "—ﬁ„ «·ÃÊ«“"
    frmJuristicDiplomatsCaption(1, 1) = "Passport No"
    frmJuristicDiplomatsCaption(2, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmJuristicDiplomatsCaption(2, 1) = "Date Type"
    frmJuristicDiplomatsCaption(3, 0) = "Â‹"
    frmJuristicDiplomatsCaption(3, 1) = "Hijri"
    frmJuristicDiplomatsCaption(4, 0) = "„"
    frmJuristicDiplomatsCaption(4, 1) = "Greg"
    frmJuristicDiplomatsCaption(5, 0) = " «—ÌŒ «·«’œ«—"
    frmJuristicDiplomatsCaption(5, 1) = "Issue Date"
    frmJuristicDiplomatsCaption(6, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmJuristicDiplomatsCaption(6, 1) = "Expiry Date"
    frmJuristicDiplomatsCaption(7, 0) = "—ﬁ„ «·»ÿ«ﬁ… «·œ»·Ê„«”Ì…"
    frmJuristicDiplomatsCaption(7, 1) = "Diplomatic Card Number"
    frmJuristicDiplomatsCaption(8, 0) = "—ﬁ„ «·›Ì“«"
    frmJuristicDiplomatsCaption(8, 1) = "Visa Number"
    frmJuristicDiplomatsCaption(9, 0) = "«··€Â"
    frmJuristicDiplomatsCaption(9, 1) = "Language"
    frmJuristicDiplomatsCaption(10, 0) = "⁄—»Ì"
    frmJuristicDiplomatsCaption(10, 1) = "Arabic"
    frmJuristicDiplomatsCaption(11, 0) = "«‰Ã·Ì“Ì"
    frmJuristicDiplomatsCaption(11, 1) = "English"
    frmJuristicDiplomatsCaption(12, 0) = "«·Ã‰”Ì…"
    frmJuristicDiplomatsCaption(12, 1) = "Nationality"
    frmJuristicDiplomatsCaption(13, 0) = "‰Ê⁄ «·⁄„·"
    frmJuristicDiplomatsCaption(13, 1) = "Business Type"
    frmJuristicDiplomatsCaption(14, 0) = "«·«”„ «·«Ê·"
    frmJuristicDiplomatsCaption(14, 1) = "First Name"
    frmJuristicDiplomatsCaption(15, 0) = "«·«”„ «·À«‰Ì"
    frmJuristicDiplomatsCaption(15, 1) = "2nd Name"
    frmJuristicDiplomatsCaption(16, 0) = "«·«”„ «·„Œ ’—"
    frmJuristicDiplomatsCaption(16, 1) = "Short Name"
    frmJuristicDiplomatsCaption(17, 0) = "»«·⁄—»Ì…"
    frmJuristicDiplomatsCaption(17, 1) = "Arabic Name"
    frmJuristicDiplomatsCaption(18, 0) = "»«·«‰Ã·Ì“Ì…"
    frmJuristicDiplomatsCaption(18, 1) = "English Name"
    frmJuristicDiplomatsCaption(19, 0) = "⁄‰Ê«‰ «·„ﬂ »"
    frmJuristicDiplomatsCaption(19, 1) = "Off.Address"
    frmJuristicDiplomatsCaption(20, 0) = "’. »."
    frmJuristicDiplomatsCaption(20, 1) = "P.O. Box"
    frmJuristicDiplomatsCaption(21, 0) = "«·„œÌ‰…"
    frmJuristicDiplomatsCaption(21, 1) = "City"
    frmJuristicDiplomatsCaption(22, 0) = "—„“ »—ÌœÌ"
    frmJuristicDiplomatsCaption(22, 1) = "Zip Code"
    frmJuristicDiplomatsCaption(23, 0) = "«·œÊ·…"
    frmJuristicDiplomatsCaption(23, 1) = "Country"
    frmJuristicDiplomatsCaption(24, 0) = "Â« › «·„ﬂ »"
    frmJuristicDiplomatsCaption(24, 1) = "Phone(Off)."
    frmJuristicDiplomatsCaption(25, 0) = "Â« › «·„‰“·"
    frmJuristicDiplomatsCaption(25, 1) = "Phone(Res)."
    frmJuristicDiplomatsCaption(26, 0) = "›«ﬂ”"
    frmJuristicDiplomatsCaption(26, 1) = "Fax"
    frmJuristicDiplomatsCaption(27, 0) = "ÃÊ«·"
    frmJuristicDiplomatsCaption(27, 1) = "Mobile"
    frmJuristicDiplomatsCaption(28, 0) = "»ÌÃ—"
    frmJuristicDiplomatsCaption(28, 1) = "Pager"
    frmJuristicDiplomatsCaption(29, 0) = "»—Ìœ «·Ìﬂ —Ê‰Ì"
    frmJuristicDiplomatsCaption(29, 1) = "E-Mail"
    frmJuristicDiplomatsCaption(30, 0) = "Õ”«»"
    frmJuristicDiplomatsCaption(30, 1) = "Account"
    frmJuristicDiplomatsCaption(31, 0) = "„·«ÕŸ«  «·„‘—›"
    frmJuristicDiplomatsCaption(31, 1) = "Supervisor Comments"
    frmJuristicDiplomatsCaption(32, 0) = "«·’›Õ… «· «·Ì…"
    frmJuristicDiplomatsCaption(32, 1) = "Next Page"
    frmJuristicDiplomatsCaption(33, 0) = "Œ—ÊÃ"
    frmJuristicDiplomatsCaption(33, 1) = "Exit"
    frmJuristicDiplomatsCaption(34, 0) = "«·»ÕÀ «·«»ÃœÌ"
    frmJuristicDiplomatsCaption(34, 1) = "Alpha Search"
    frmJuristicDiplomatsCaption(35, 0) = "—ﬁ„ «·„Ê«›ﬁ… "
    frmJuristicDiplomatsCaption(35, 1) = "Approver No."
    frmJuristicDiplomatsCaption(36, 0) = "«·ÃÂ… «·„Ê«›ﬁ… "
    frmJuristicDiplomatsCaption(36, 1) = "Approver Name"
    
    frmJuristicNonResidentCaption(0, 0) = " ›«’Ì· «·⁄„·«¡ «·«⁄ »«—ÌÊ‰ «·€Ì— „ﬁÌ„Ê‰"
    frmJuristicNonResidentCaption(0, 1) = "Non-Resident Juristic Customer Details"
    frmJuristicNonResidentCaption(1, 0) = "—ﬁ„ «·⁄ﬁœ"
    frmJuristicNonResidentCaption(1, 1) = "Contract No."
    frmJuristicNonResidentCaption(2, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmJuristicNonResidentCaption(2, 1) = "Date Type"
    frmJuristicNonResidentCaption(3, 0) = "Â‹"
    frmJuristicNonResidentCaption(3, 1) = "Hijri"
    frmJuristicNonResidentCaption(4, 0) = "„"
    frmJuristicNonResidentCaption(4, 1) = "Greg"
    frmJuristicNonResidentCaption(5, 0) = " «—ÌŒ «·«’œ«—"
    frmJuristicNonResidentCaption(5, 1) = "Issue Date"
    frmJuristicNonResidentCaption(6, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmJuristicNonResidentCaption(6, 1) = "Expiry Date"
    frmJuristicNonResidentCaption(7, 0) = "«··€…"
    frmJuristicNonResidentCaption(7, 1) = "Language"
    frmJuristicNonResidentCaption(8, 0) = "⁄—»Ì"
    frmJuristicNonResidentCaption(8, 1) = "Arabic"
    frmJuristicNonResidentCaption(9, 0) = "«‰Ã·Ì“Ì"
    frmJuristicNonResidentCaption(9, 1) = "English"
    frmJuristicNonResidentCaption(10, 0) = "«·Ã‰”Ì…"
    frmJuristicNonResidentCaption(10, 1) = "Nationality"
    frmJuristicNonResidentCaption(11, 0) = "‰Ê⁄ «·⁄„·"
    frmJuristicNonResidentCaption(11, 1) = "Business Type"
    frmJuristicNonResidentCaption(12, 0) = "«·«”„  «·«Ê·"
    frmJuristicNonResidentCaption(12, 1) = "First Name"
    frmJuristicNonResidentCaption(13, 0) = "«·«”„ «·À«‰Ì"
    frmJuristicNonResidentCaption(13, 1) = "2nd Name"
    frmJuristicNonResidentCaption(14, 0) = "«·«”„ «·„Œ ’—"
    frmJuristicNonResidentCaption(14, 1) = "Short Name"
    frmJuristicNonResidentCaption(15, 0) = " »«·⁄—»Ì…"
    frmJuristicNonResidentCaption(15, 1) = "Arabic Name"
    frmJuristicNonResidentCaption(16, 0) = " »«·«‰Ã·Ì“Ì…"
    frmJuristicNonResidentCaption(16, 1) = "English Name"
    frmJuristicNonResidentCaption(17, 0) = "«·€—’ „‰ «·Õ”«»"
    frmJuristicNonResidentCaption(17, 1) = "Purpose of Account"
    frmJuristicNonResidentCaption(18, 0) = "⁄‰Ê«‰ «·„ﬂ »"
    frmJuristicNonResidentCaption(18, 1) = "Off. Address"
    frmJuristicNonResidentCaption(19, 0) = "’. »."
    frmJuristicNonResidentCaption(19, 1) = "P.O. Box"
    frmJuristicNonResidentCaption(20, 0) = "«·„œÌ‰…"
    frmJuristicNonResidentCaption(20, 1) = "City"
    frmJuristicNonResidentCaption(21, 0) = "—„“ »—ÌœÌ"
    frmJuristicNonResidentCaption(21, 1) = "Zip Code"
    frmJuristicNonResidentCaption(22, 0) = "«·œÊ·…"
    frmJuristicNonResidentCaption(22, 1) = "Country"
    frmJuristicNonResidentCaption(23, 0) = "Â« › «·„ﬂ »"
    frmJuristicNonResidentCaption(23, 1) = "Phone(Off)"
    frmJuristicNonResidentCaption(24, 0) = "Â« › «·„‰“·"
    frmJuristicNonResidentCaption(24, 1) = "Phone(Res)"
    frmJuristicNonResidentCaption(25, 0) = "›«ﬂ”"
    frmJuristicNonResidentCaption(25, 1) = "Fax"
    frmJuristicNonResidentCaption(26, 0) = "ÃÊ«·"
    frmJuristicNonResidentCaption(26, 1) = "Mobile"
    frmJuristicNonResidentCaption(27, 0) = "»ÌÃ—"
    frmJuristicNonResidentCaption(27, 1) = "Pager"
    frmJuristicNonResidentCaption(28, 0) = "»—Ìœ «·Ìﬂ —Ê‰Ì"
    frmJuristicNonResidentCaption(28, 1) = "E-Mail"
    frmJuristicNonResidentCaption(29, 0) = "Õ”«»"
    frmJuristicNonResidentCaption(29, 1) = "Account"
    frmJuristicNonResidentCaption(30, 0) = "„·«ÕŸ«  «·„‘—›"
    frmJuristicNonResidentCaption(30, 1) = "Supervisor Comments"
    frmJuristicNonResidentCaption(31, 0) = "«·’›Õ… «· «·Ì…"
    frmJuristicNonResidentCaption(31, 1) = "Next Page"
    frmJuristicNonResidentCaption(32, 0) = "Œ—ÊÃ"
    frmJuristicNonResidentCaption(32, 1) = "Exit"
    frmJuristicNonResidentCaption(33, 0) = "    —ﬁ„ „Ê«›ﬁ… ”«„«"
    frmJuristicNonResidentCaption(33, 1) = "SAMA Auth.Number"
    frmJuristicNonResidentCaption(34, 0) = "—ﬁ„ «·—Œ’…"
    frmJuristicNonResidentCaption(34, 1) = "License No."
    frmJuristicNonResidentCaption(35, 0) = "«·»ÕÀ «·«»ÃœÌ"
    frmJuristicNonResidentCaption(35, 1) = "Alpha Search"
    frmJuristicNonResidentCaption(36, 0) = "—ﬁ„ «·„Ê«›ﬁ… "
    frmJuristicNonResidentCaption(36, 1) = "Approver No."
    frmJuristicNonResidentCaption(37, 0) = "«·ÃÂ… «·„Ê«›ﬁ… "
    frmJuristicNonResidentCaption(37, 1) = "Approver Name"
   
    frmQuickCustOpenCaption(0, 0) = " ›«’Ì· «·› Õ «·”—Ì⁄ ··⁄„Ì·"
    frmQuickCustOpenCaption(0, 1) = "Quick Customer Details"
    frmQuickCustOpenCaption(1, 0) = "‰Ê⁄ «·ÂÊÌ…"
    frmQuickCustOpenCaption(1, 1) = "Id Type"
    frmQuickCustOpenCaption(2, 0) = "—ﬁ„ «·ÂÊÌ…"
    frmQuickCustOpenCaption(2, 1) = "Id Number"
    frmQuickCustOpenCaption(3, 0) = "’«œ—… „‰"
    frmQuickCustOpenCaption(3, 1) = "Issued At"
    frmQuickCustOpenCaption(4, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmQuickCustOpenCaption(4, 1) = "Id Date Type"
    frmQuickCustOpenCaption(5, 0) = "ÂÃ—Ì"
    frmQuickCustOpenCaption(5, 1) = "Hijri"
    frmQuickCustOpenCaption(6, 0) = "„Ì·«œÌ"
    frmQuickCustOpenCaption(6, 1) = "Gregorian"
    frmQuickCustOpenCaption(7, 0) = " «—ÌŒ «·«’œ«—"
    frmQuickCustOpenCaption(7, 1) = "Issue Date"
    frmQuickCustOpenCaption(8, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmQuickCustOpenCaption(8, 1) = "Expiry Date"
    frmQuickCustOpenCaption(9, 0) = "«·«”„ «·«Ê·"
    frmQuickCustOpenCaption(9, 1) = "First Name"
    frmQuickCustOpenCaption(10, 0) = "«·«”„ «·À«‰Ì"
    frmQuickCustOpenCaption(10, 1) = "2nd Name"
    frmQuickCustOpenCaption(11, 0) = "«·«”„ «·À«·À"
    frmQuickCustOpenCaption(11, 1) = "3rd Name"
    frmQuickCustOpenCaption(12, 0) = "«·«”„ «·«ŒÌ—"
    frmQuickCustOpenCaption(12, 1) = "Last Name"
    frmQuickCustOpenCaption(13, 0) = "«·«”„ «·„Œ ’—"
    frmQuickCustOpenCaption(13, 1) = "Short Name"
    frmQuickCustOpenCaption(14, 0) = " »«·⁄—»Ì…"
    frmQuickCustOpenCaption(14, 1) = "Arabic Name"
    frmQuickCustOpenCaption(15, 0) = "»«·«‰Ã·Ì“Ì…"
    frmQuickCustOpenCaption(15, 1) = "English Name"
    frmQuickCustOpenCaption(16, 0) = "«··€…"
    frmQuickCustOpenCaption(16, 1) = "Language"
    frmQuickCustOpenCaption(17, 0) = "⁄—»Ì"
    frmQuickCustOpenCaption(17, 1) = "Arabic"
    frmQuickCustOpenCaption(18, 0) = "«‰Ã·Ì“Ì"
    frmQuickCustOpenCaption(18, 1) = "English"
    frmQuickCustOpenCaption(19, 0) = "—„“ «··ﬁ»"
    frmQuickCustOpenCaption(19, 1) = "Title Code"
    frmQuickCustOpenCaption(20, 0) = "«·Ã‰”"
    frmQuickCustOpenCaption(20, 1) = "Gender"
    frmQuickCustOpenCaption(21, 0) = "–ﬂ—"
    frmQuickCustOpenCaption(21, 1) = "Male"
    frmQuickCustOpenCaption(22, 0) = "«‰ÀÏ"
    frmQuickCustOpenCaption(22, 1) = "Female"
    frmQuickCustOpenCaption(23, 0) = "‰Ê⁄ «·⁄„·"
    frmQuickCustOpenCaption(23, 1) = "Business Type"
    frmQuickCustOpenCaption(24, 0) = "«·Ã‰”Ì…"
    frmQuickCustOpenCaption(24, 1) = "Nationality"
    frmQuickCustOpenCaption(25, 0) = "«·⁄‰‹‹Ê«‰ "
    frmQuickCustOpenCaption(25, 1) = "Address "
    frmQuickCustOpenCaption(26, 0) = "’ . »"
    frmQuickCustOpenCaption(26, 1) = "P.O. Box"
    frmQuickCustOpenCaption(27, 0) = "«·„œÌ‰Â"
    frmQuickCustOpenCaption(27, 1) = "City"
    frmQuickCustOpenCaption(28, 0) = "«·—„“ «·»—ÌœÌ"
    frmQuickCustOpenCaption(28, 1) = "Zip Code"
    frmQuickCustOpenCaption(29, 0) = "«·œÊ·‹Â"
    frmQuickCustOpenCaption(29, 1) = "Country"
    frmQuickCustOpenCaption(30, 0) = "Õ”‹‹«» Ã‹«—Ì"
    frmQuickCustOpenCaption(30, 1) = "Current A/c"
    frmQuickCustOpenCaption(31, 0) = "⁄„·Â"
    frmQuickCustOpenCaption(31, 1) = "Curr."
    frmQuickCustOpenCaption(32, 0) = "Ê÷⁄ «·Õ”«»"
    frmQuickCustOpenCaption(32, 1) = "Acc.Status"
    frmQuickCustOpenCaption(33, 0) = "«’œ«—«·ﬂ‘›"
    frmQuickCustOpenCaption(33, 1) = "Stmt.Freq."
    frmQuickCustOpenCaption(34, 0) = "œ› — ‘Ìﬂ« "
    frmQuickCustOpenCaption(34, 1) = "Check Book"
    frmQuickCustOpenCaption(35, 0) = "‰⁄„"
    frmQuickCustOpenCaption(35, 1) = "Yes"
    frmQuickCustOpenCaption(36, 0) = "·«"
    frmQuickCustOpenCaption(36, 1) = "No"
    frmQuickCustOpenCaption(37, 0) = "‰Ê⁄ «·»ÿ«ﬁÂ"
    frmQuickCustOpenCaption(37, 1) = "Card Type"
    frmQuickCustOpenCaption(38, 0) = "œÊ·ÌÂ"
    frmQuickCustOpenCaption(38, 1) = "Elec.Intl"
    frmQuickCustOpenCaption(39, 0) = "–ﬂÌÂ"
    frmQuickCustOpenCaption(39, 1) = "EI.Chip"
    frmQuickCustOpenCaption(40, 0) = "»ÿ«ﬁ‹… œÊ·‹‹‹‹‹‹Ì…"
    frmQuickCustOpenCaption(40, 1) = "Primary Int'l card"
    frmQuickCustOpenCaption(41, 0) = "«·«”„ ⁄·Ï «·»ÿ«ﬁÂ"
    frmQuickCustOpenCaption(41, 1) = "Name on the card"
    frmQuickCustOpenCaption(42, 0) = "„⁄·Ê„«  »ÿ«ﬁ… «·’—«› «·«·Ì"
    frmQuickCustOpenCaption(42, 1) = "ATM CARD Info"
    frmQuickCustOpenCaption(43, 0) = "„⁄·Ê„«  «·Õ”«»"
    frmQuickCustOpenCaption(43, 1) = "Account Info"
    frmQuickCustOpenCaption(44, 0) = "„·«ÕŸ«  «·„‘—›"
    frmQuickCustOpenCaption(44, 1) = "Supervisor Comments"
    frmQuickCustOpenCaption(45, 0) = "√‰‘«¡"
    frmQuickCustOpenCaption(45, 1) = "Create"
    frmQuickCustOpenCaption(46, 0) = "„Ê«›ﬁ "
    frmQuickCustOpenCaption(46, 1) = "Approve"
    frmQuickCustOpenCaption(47, 0) = "„—›Ê÷"
    frmQuickCustOpenCaption(47, 1) = "Reject"
    frmQuickCustOpenCaption(48, 0) = "Œ—ÊÃ"
    frmQuickCustOpenCaption(48, 1) = "Cancel"
    frmQuickCustOpenCaption(49, 0) = "«· «—Ì‹‹Œ"
    frmQuickCustOpenCaption(49, 1) = "DOB type"
    frmQuickCustOpenCaption(50, 0) = "Â‹"
    frmQuickCustOpenCaption(50, 1) = "Hijri"
    frmQuickCustOpenCaption(51, 0) = "„"
    frmQuickCustOpenCaption(51, 1) = "Gregorian"
    frmQuickCustOpenCaption(52, 0) = " «—ÌŒ «·‹Ê·«œÂ"
    frmQuickCustOpenCaption(52, 1) = "Date of Birth"
    frmQuickCustOpenCaption(53, 0) = " ›«’Ì· › Õ ⁄„Ì· œ«Œ·Ì"
    frmQuickCustOpenCaption(53, 1) = "Internal Customer Details"
    frmQuickCustOpenCaption(54, 0) = " ⁄œÌ‹·"
    frmQuickCustOpenCaption(54, 1) = "Update"
    
    'added by Mohit on 27-Nov-2006
    'For Quick Pension Customer Open
    
    frmQuickPenCustOpenCaption(0, 0) = " ›«’Ì· «·› Õ «·”—Ì⁄ ··„ ﬁ«⁄œ" 'by Mohit - Pension word is to be added for arabic
    frmQuickPenCustOpenCaption(0, 1) = "Quick Pension Customer Details"
    frmQuickPenCustOpenCaption(1, 0) = "‰Ê⁄ «·ÂÊÌ…"
    frmQuickPenCustOpenCaption(1, 1) = "Id Type"
    frmQuickPenCustOpenCaption(2, 0) = "—ﬁ„ «·ÂÊÌ…"
    frmQuickPenCustOpenCaption(2, 1) = "Id Number"
'    frmQuickPenCustOpenCaption(3, 0) = "’«œ—… „‰"
'    frmQuickPenCustOpenCaption(3, 1) = "Issued At"
'    frmQuickPenCustOpenCaption(4, 0) = "‰Ê⁄ «· «—ÌŒ"
'    frmQuickPenCustOpenCaption(4, 1) = "Id Date Type"
'    frmQuickPenCustOpenCaption(5, 0) = "ÂÃ—Ì"
'    frmQuickPenCustOpenCaption(5, 1) = "Hijri"
'    frmQuickPenCustOpenCaption(6, 0) = "„Ì·«œÌ"
'    frmQuickPenCustOpenCaption(6, 1) = "Gregorian"
'    frmQuickPenCustOpenCaption(7, 0) = " «—ÌŒ «·«’œ«—"
'    frmQuickPenCustOpenCaption(7, 1) = "Issue Date"
'    frmQuickPenCustOpenCaption(8, 0) = " «—ÌŒ «·«‰ Â«¡"
'    frmQuickPenCustOpenCaption(8, 1) = "Expiry Date"
    frmQuickPenCustOpenCaption(9, 0) = "«·«”„ «·«Ê·"
    frmQuickPenCustOpenCaption(9, 1) = "First Name"
    frmQuickPenCustOpenCaption(10, 0) = "«·«”„ «·À«‰Ì"
    frmQuickPenCustOpenCaption(10, 1) = "2nd Name"
    frmQuickPenCustOpenCaption(11, 0) = "«·«”„ «·À«·À"
    frmQuickPenCustOpenCaption(11, 1) = "3rd Name"
    frmQuickPenCustOpenCaption(12, 0) = "«·«”„ «·«ŒÌ—"
    frmQuickPenCustOpenCaption(12, 1) = "Last Name"
    frmQuickPenCustOpenCaption(13, 0) = "«·«”„ «·„Œ ’—"
    frmQuickPenCustOpenCaption(13, 1) = "Short Name"
    frmQuickPenCustOpenCaption(14, 0) = " »«·⁄—»Ì…"
    frmQuickPenCustOpenCaption(14, 1) = "Arabic Name"
    frmQuickPenCustOpenCaption(15, 0) = "»«·«‰Ã·Ì“Ì…"
    frmQuickPenCustOpenCaption(15, 1) = "English Name"
    frmQuickPenCustOpenCaption(16, 0) = "«··€…"
    frmQuickPenCustOpenCaption(16, 1) = "Language"
    frmQuickPenCustOpenCaption(17, 0) = "⁄—»Ì"
    frmQuickPenCustOpenCaption(17, 1) = "Arabic"
    frmQuickPenCustOpenCaption(18, 0) = "«‰Ã·Ì“Ì"
    frmQuickPenCustOpenCaption(18, 1) = "English"
    frmQuickPenCustOpenCaption(19, 0) = "—„“ «··ﬁ»"
    frmQuickPenCustOpenCaption(19, 1) = "Title Code"
    frmQuickPenCustOpenCaption(20, 0) = "«·Ã‰”"
    frmQuickPenCustOpenCaption(20, 1) = "Gender"
    frmQuickPenCustOpenCaption(21, 0) = "–ﬂ—"
    frmQuickPenCustOpenCaption(21, 1) = "Male"
    frmQuickPenCustOpenCaption(22, 0) = "«‰ÀÏ"
    frmQuickPenCustOpenCaption(22, 1) = "Female"
    frmQuickPenCustOpenCaption(23, 0) = "‰Ê⁄ «·⁄„·"
    frmQuickPenCustOpenCaption(23, 1) = "Business Type"
    frmQuickPenCustOpenCaption(24, 0) = "«·Ã‰”Ì…"
    frmQuickPenCustOpenCaption(24, 1) = "Nationality"
'    frmQuickPenCustOpenCaption(25, 0) = "«·⁄‰‹‹Ê«‰ "
'    frmQuickPenCustOpenCaption(25, 1) = "Address "
'    frmQuickPenCustOpenCaption(26, 0) = "’ . »"
'    frmQuickPenCustOpenCaption(26, 1) = "P.O. Box"
'    frmQuickPenCustOpenCaption(27, 0) = "«·„œÌ‰Â"
'    frmQuickPenCustOpenCaption(27, 1) = "City"
'    frmQuickPenCustOpenCaption(28, 0) = "«·—„“ «·»—ÌœÌ"
'    frmQuickPenCustOpenCaption(28, 1) = "Zip Code"
'    frmQuickPenCustOpenCaption(29, 0) = "«·œÊ·‹Â"
'    frmQuickPenCustOpenCaption(29, 1) = "Country"
    frmQuickPenCustOpenCaption(30, 0) = "Õ”‹‹«» Ã‹«—Ì"
    frmQuickPenCustOpenCaption(30, 1) = "Current A/c"
    frmQuickPenCustOpenCaption(31, 0) = "⁄„·Â"
    frmQuickPenCustOpenCaption(31, 1) = "Curr."
    frmQuickPenCustOpenCaption(32, 0) = "Ê÷⁄ «·Õ”«»"
    frmQuickPenCustOpenCaption(32, 1) = "Acc.Status"
    frmQuickPenCustOpenCaption(33, 0) = "«’œ«—«·ﬂ‘›"
    frmQuickPenCustOpenCaption(33, 1) = "Stmt.Freq."
'    frmQuickPenCustOpenCaption(34, 0) = "œ› — ‘Ìﬂ« "
'    frmQuickPenCustOpenCaption(34, 1) = "Check Book"
    frmQuickPenCustOpenCaption(35, 0) = "‰⁄„"
    frmQuickPenCustOpenCaption(35, 1) = "Yes"
    frmQuickPenCustOpenCaption(36, 0) = "·«"
    frmQuickPenCustOpenCaption(36, 1) = "No"
'    frmQuickPenCustOpenCaption(37, 0) = "‰Ê⁄ «·»ÿ«ﬁÂ"
'    frmQuickPenCustOpenCaption(37, 1) = "Card Type"
'    frmQuickPenCustOpenCaption(38, 0) = "œÊ·ÌÂ"
'    frmQuickPenCustOpenCaption(38, 1) = "Elec.Intl"
'    frmQuickPenCustOpenCaption(39, 0) = "–ﬂÌÂ"
'    frmQuickPenCustOpenCaption(39, 1) = "EI.Chip"
'    frmQuickPenCustOpenCaption(40, 0) = "»ÿ«ﬁ‹… œÊ·‹‹‹‹‹‹Ì…"
'    frmQuickPenCustOpenCaption(40, 1) = "Primary Int'l card"
'    frmQuickPenCustOpenCaption(41, 0) = "«·«”„ ⁄·Ï «·»ÿ«ﬁÂ"
'    frmQuickPenCustOpenCaption(41, 1) = "Name on the card"
    frmQuickPenCustOpenCaption(42, 0) = "„⁄·Ê„«  »ÿ«ﬁ… «·’—«› «·«·Ì"
    frmQuickPenCustOpenCaption(42, 1) = "ATM CARD Info"
    frmQuickPenCustOpenCaption(43, 0) = "„⁄·Ê„«  «·Õ”«»"
    frmQuickPenCustOpenCaption(43, 1) = "Account Info"
    frmQuickPenCustOpenCaption(44, 0) = "„·«ÕŸ«  «·„‘—›"
    frmQuickPenCustOpenCaption(44, 1) = "Supervisor Comments"
    frmQuickPenCustOpenCaption(45, 0) = "√‰‘«¡"
    frmQuickPenCustOpenCaption(45, 1) = "Create"
    frmQuickPenCustOpenCaption(46, 0) = "„Ê«›ﬁ "
    frmQuickPenCustOpenCaption(46, 1) = "Approve"
    frmQuickPenCustOpenCaption(47, 0) = "„—›Ê÷"
    frmQuickPenCustOpenCaption(47, 1) = "Reject"
    frmQuickPenCustOpenCaption(48, 0) = "Œ—ÊÃ"
    frmQuickPenCustOpenCaption(48, 1) = "Cancel"
'    frmQuickPenCustOpenCaption(49, 0) = "«· «—Ì‹‹Œ"
'    frmQuickPenCustOpenCaption(49, 1) = "DOB type"
'    frmQuickPenCustOpenCaption(50, 0) = "Â‹"
'    frmQuickPenCustOpenCaption(50, 1) = "Hijri"
'    frmQuickPenCustOpenCaption(51, 0) = "„"
'    frmQuickPenCustOpenCaption(51, 1) = "Gregorian"
'    frmQuickPenCustOpenCaption(52, 0) = " «—ÌŒ «·‹Ê·«œÂ"
'    frmQuickPenCustOpenCaption(52, 1) = "Date of Birth"
    frmQuickPenCustOpenCaption(53, 0) = " ›«’Ì· › Õ ⁄„Ì· œ«Œ·Ì"
    frmQuickPenCustOpenCaption(53, 1) = "Internal Customer Details"
    frmQuickPenCustOpenCaption(54, 0) = " ⁄œÌ‹·"
    frmQuickPenCustOpenCaption(54, 1) = "Update"
    frmQuickPenCustOpenCaption(55, 0) = "› Õ „ ﬁ«⁄œ ”—Ì⁄" 'by Mohit - Pension word is to be added for arabic
    frmQuickPenCustOpenCaption(55, 1) = "Quick Pension Customer Opening"

    'till here added by Mohit
        
    frmJuristicOwnerCaption(0, 0) = " ›«’Ì· «·„«·ﬂ/Ê«·«œ«—Â"
    frmJuristicOwnerCaption(0, 1) = "Owner/Management Details"
    frmJuristicOwnerCaption(1, 0) = "‰Ê⁄ «·„«·ﬂ"
    frmJuristicOwnerCaption(1, 1) = "Owner Type"
    frmJuristicOwnerCaption(2, 0) = "„œÌ—"
    frmJuristicOwnerCaption(2, 1) = "Manager"
    frmJuristicOwnerCaption(3, 0) = "«·‰«Ÿ—"
    frmJuristicOwnerCaption(3, 1) = "Trustee"
    frmJuristicOwnerCaption(4, 0) = "«„Ì‰ «·’‰œÊﬁ"
    frmJuristicOwnerCaption(4, 1) = "Cashier"
    frmJuristicOwnerCaption(5, 0) = "«·„«·ﬂÊ‰"
    frmJuristicOwnerCaption(5, 1) = "Owners"
    frmJuristicOwnerCaption(6, 0) = "‰Ê⁄ «·ÂÊÌ…"
    frmJuristicOwnerCaption(6, 1) = "Id Type"
    frmJuristicOwnerCaption(7, 0) = "—ﬁ„ «·ÂÊÌ…"
    frmJuristicOwnerCaption(7, 1) = "ID No"
    frmJuristicOwnerCaption(8, 0) = "’«œ— ›Ì"
    frmJuristicOwnerCaption(8, 1) = "Issued at"
    frmJuristicOwnerCaption(9, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmJuristicOwnerCaption(9, 1) = "Date type"
    frmJuristicOwnerCaption(10, 0) = "Â‹"
    frmJuristicOwnerCaption(10, 1) = "Hijri"
    frmJuristicOwnerCaption(11, 0) = "„"
    frmJuristicOwnerCaption(11, 1) = "Gregorian"
    frmJuristicOwnerCaption(12, 0) = " «—ÌŒ «·«’œ«—"
    frmJuristicOwnerCaption(12, 1) = "Issue Date"
    frmJuristicOwnerCaption(13, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmJuristicOwnerCaption(13, 1) = "Expiry Date"
    frmJuristicOwnerCaption(14, 0) = "«”„ «·‘—ﬂ… «·‘ﬁÌﬁ…"
    frmJuristicOwnerCaption(14, 1) = "Parent company name"
    frmJuristicOwnerCaption(15, 0) = "‰”»… «·„”«Â„Ì‰"
    frmJuristicOwnerCaption(15, 1) = "Shareholding Percentage"
    frmJuristicOwnerCaption(16, 0) = "«·„«·ﬂ «·›⁄·Ì"
    frmJuristicOwnerCaption(16, 1) = "Owner Enabled"
    frmJuristicOwnerCaption(17, 0) = "‰⁄„"
    frmJuristicOwnerCaption(17, 1) = "Yes"
    frmJuristicOwnerCaption(18, 0) = "·«"
    frmJuristicOwnerCaption(18, 1) = "No"
    frmJuristicOwnerCaption(19, 0) = "«·«”‹‹‹‹‹„ «·√Ê·"
    frmJuristicOwnerCaption(19, 1) = "First Name"
    frmJuristicOwnerCaption(20, 0) = "«·«”‹‹‹„ «·À«‰Ì"
    frmJuristicOwnerCaption(20, 1) = "2nd Name"
    frmJuristicOwnerCaption(21, 0) = "«·«”‹‹‹„ «·À«·À"
    frmJuristicOwnerCaption(21, 1) = "3rd Name"
    frmJuristicOwnerCaption(22, 0) = "«·«”‹‹‹‹‹„ «·«ŒÌ—"
    frmJuristicOwnerCaption(22, 1) = "Last Name"
    frmJuristicOwnerCaption(23, 0) = "⁄‹‹‹‹‹‹‹‹‹‹—»Ì"
    frmJuristicOwnerCaption(23, 1) = "Arabic"
    frmJuristicOwnerCaption(24, 0) = "«·«”„ «·„Œ ’—"
    frmJuristicOwnerCaption(24, 1) = "Short Name"
    frmJuristicOwnerCaption(25, 0) = "«‰Ã·Ì‹‹‹‹‹‹‹“Ì"
    frmJuristicOwnerCaption(25, 1) = "English"
    frmJuristicOwnerCaption(26, 0) = "«·⁄‰‹‹Ê«‰ "
    frmJuristicOwnerCaption(26, 1) = "Address "
    frmJuristicOwnerCaption(27, 0) = "’ . »"
    frmJuristicOwnerCaption(27, 1) = "P.O. Box"
    frmJuristicOwnerCaption(28, 0) = "«·„œÌ‰Â"
    frmJuristicOwnerCaption(28, 1) = "City"
    frmJuristicOwnerCaption(29, 0) = "«·—„“ «·»—ÌœÌ"
    frmJuristicOwnerCaption(29, 1) = "Zip Code"
    frmJuristicOwnerCaption(30, 0) = "«·œÊ·‹Â"
    frmJuristicOwnerCaption(30, 1) = "Country"
    frmJuristicOwnerCaption(31, 0) = " ·›Ê‰ «·⁄„·"
    frmJuristicOwnerCaption(31, 1) = "Phone(Off)"
    frmJuristicOwnerCaption(32, 0) = " ·›Ê‰ «·„‰“·"
    frmJuristicOwnerCaption(32, 1) = "Phone(Res.)"
    frmJuristicOwnerCaption(33, 0) = "›«ﬂ”"
    frmJuristicOwnerCaption(33, 1) = "Fax"
    frmJuristicOwnerCaption(34, 0) = "Ã‹‹‹‹‹‹‹‹Ê«·"
    frmJuristicOwnerCaption(34, 1) = "Mobile"
    frmJuristicOwnerCaption(35, 0) = "»ÌÃ‹—"
    frmJuristicOwnerCaption(35, 1) = "Pager"
    frmJuristicOwnerCaption(36, 0) = "»—Ìœ«·ﬂ —Ê‰Ì"
    frmJuristicOwnerCaption(36, 1) = "E_Mail"
    frmJuristicOwnerCaption(37, 0) = "«·⁄‰Ê«‰ ›Ì «·»·œ«·«„"
    frmJuristicOwnerCaption(37, 1) = "Home Address"
    frmJuristicOwnerCaption(38, 0) = "’. »."
    frmJuristicOwnerCaption(38, 1) = "P.O. Box"
    frmJuristicOwnerCaption(39, 0) = "«·„œÌ‰…"
    frmJuristicOwnerCaption(39, 1) = "City"
    frmJuristicOwnerCaption(40, 0) = "«·—„“ «·»—ÌœÌ"
    frmJuristicOwnerCaption(40, 1) = "Zip Code"
    frmJuristicOwnerCaption(41, 0) = "«·œÊ·…"
    frmJuristicOwnerCaption(41, 1) = "Country"
    frmJuristicOwnerCaption(42, 0) = "Â« › «·„ﬂ »"
    frmJuristicOwnerCaption(42, 1) = "Phone(Off)"
    frmJuristicOwnerCaption(43, 0) = "Â« › «·„‰“·"
    frmJuristicOwnerCaption(43, 1) = "Phone(Res.)"
    frmJuristicOwnerCaption(44, 0) = "›«ﬂ”"
    frmJuristicOwnerCaption(44, 1) = "Fax"
    frmJuristicOwnerCaption(45, 0) = "ÃÊ«·"
    frmJuristicOwnerCaption(45, 1) = "Mobile"
    frmJuristicOwnerCaption(46, 0) = "»ÌÃ—"
    frmJuristicOwnerCaption(46, 1) = "Pager"
    frmJuristicOwnerCaption(47, 0) = "»—Ìœ«·Ìﬂ —Ê‰Ì"
    frmJuristicOwnerCaption(47, 1) = "E-Mail"
    frmJuristicOwnerCaption(48, 0) = "«÷«›…"
    frmJuristicOwnerCaption(48, 1) = "Add"
    frmJuristicOwnerCaption(49, 0) = " ⁄œÌ·"
    frmJuristicOwnerCaption(49, 1) = "Update"
    frmJuristicOwnerCaption(50, 0) = "Œ—ÊÃ"
    frmJuristicOwnerCaption(50, 1) = "Done"
    frmJuristicOwnerCaption(51, 0) = "—ﬁ„ «·⁄„Ì·"
    frmJuristicOwnerCaption(51, 1) = "Customer #"
    frmJuristicOwnerCaption(52, 0) = "—ﬁ„ «·„«·ﬂ"
    frmJuristicOwnerCaption(52, 1) = "Owner #"
    frmJuristicOwnerCaption(53, 0) = "—ﬁ„ «·„«·ﬂ «·„Œ ’—"
    frmJuristicOwnerCaption(53, 1) = "Owner short Name"
    frmJuristicOwnerCaption(54, 0) = "—„“ ›—⁄ «·⁄„Ì·"
    frmJuristicOwnerCaption(54, 1) = "Customer branch code"
    frmJuristicOwnerCaption(55, 0) = "‰Ê⁄ «·ÂÊÌ…/—ﬁ„ «·ÂÊÌ…"
    frmJuristicOwnerCaption(55, 1) = "IdType-id Number"

    
    frmJuristicSignatoryCaption(0, 0) = " ›«’Ì· «·„›Ê÷ »«· ÊﬁÌ⁄"
    frmJuristicSignatoryCaption(0, 1) = "Signatory Details"
    frmJuristicSignatoryCaption(1, 0) = "‰Ê⁄ «·ÂÊÌ…"
    frmJuristicSignatoryCaption(1, 1) = "Id type"
    frmJuristicSignatoryCaption(2, 0) = "—ﬁ„ «·ÂÊÌ…"
    frmJuristicSignatoryCaption(2, 1) = "Id No"
    frmJuristicSignatoryCaption(3, 0) = "«· «ﬂœ „‰ «·«œŒ«·"
    frmJuristicSignatoryCaption(3, 1) = "Check Existence"
    frmJuristicSignatoryCaption(4, 0) = "’«œ— ›Ì"
    frmJuristicSignatoryCaption(4, 1) = "Issued At"
    frmJuristicSignatoryCaption(5, 0) = "‰Ê⁄ «· «—ÌŒ"
    frmJuristicSignatoryCaption(5, 1) = "Date type"
    frmJuristicSignatoryCaption(6, 0) = "Â‹"
    frmJuristicSignatoryCaption(6, 1) = "Hijri"
    frmJuristicSignatoryCaption(7, 0) = "„"
    frmJuristicSignatoryCaption(7, 1) = "Gregorian"
    frmJuristicSignatoryCaption(8, 0) = " «—ÌŒ «·«’œ«—"
    frmJuristicSignatoryCaption(8, 1) = "Issue Date"
    frmJuristicSignatoryCaption(9, 0) = " «—ÌŒ «·«‰ Â«¡"
    frmJuristicSignatoryCaption(9, 1) = "Expiry Date"
    
    frmJuristicSignatoryCaption(10, 0) = "«·«”‹‹‹‹‹„ «·√Ê·"
    frmJuristicSignatoryCaption(10, 1) = "First Name"
    frmJuristicSignatoryCaption(11, 0) = "«·«”‹‹‹„ «·À«‰Ì"
    frmJuristicSignatoryCaption(11, 1) = "2nd Name"
    frmJuristicSignatoryCaption(12, 0) = "«·«”‹‹‹„ «·À«·À"
    frmJuristicSignatoryCaption(12, 1) = "3rd Name"
    frmJuristicSignatoryCaption(13, 0) = "«·«”‹‹‹‹‹„ «·«ŒÌ—"
    frmJuristicSignatoryCaption(13, 1) = "Last Name"
    frmJuristicSignatoryCaption(14, 0) = "⁄‹‹‹‹‹‹‹‹‹‹—»Ì"
    frmJuristicSignatoryCaption(14, 1) = "Arabic"
    frmJuristicSignatoryCaption(15, 0) = "«·«”„ «·„Œ ’—"
    frmJuristicSignatoryCaption(15, 1) = "Short Name"
    frmJuristicSignatoryCaption(16, 0) = "«‰Ã·Ì‹‹‹‹‹‹‹“Ì"
    frmJuristicSignatoryCaption(16, 1) = "English"
    frmJuristicSignatoryCaption(17, 0) = "—ﬁ„ «·ÃÊ«“ «·œ»·Ê„«”Ì"
    frmJuristicSignatoryCaption(17, 1) = "Diplomatic Passport No"
    frmJuristicSignatoryCaption(18, 0) = "«·„›Ê÷ »«· ÊﬁÌ⁄ „ÊÃÊœ"
    frmJuristicSignatoryCaption(18, 1) = "Signatory Enabled"
    frmJuristicSignatoryCaption(19, 0) = "‰⁄„"
    frmJuristicSignatoryCaption(19, 1) = "Yes"
    frmJuristicSignatoryCaption(20, 0) = "·«"
    frmJuristicSignatoryCaption(20, 1) = "No"
    frmJuristicSignatoryCaption(21, 0) = "”»» «·€«¡ «·„›Ê÷ »«· ÊﬁÌ⁄"
    frmJuristicSignatoryCaption(21, 1) = "Reason for Disabled signatory"
    frmJuristicSignatoryCaption(22, 0) = "«÷«›…"
    frmJuristicSignatoryCaption(22, 1) = "Add"
    frmJuristicSignatoryCaption(23, 0) = " ⁄œÌ·"
    frmJuristicSignatoryCaption(23, 1) = "Update"
    frmJuristicSignatoryCaption(24, 0) = "Œ—ÊÃ"
    frmJuristicSignatoryCaption(24, 1) = "Done"
    frmJuristicSignatoryCaption(25, 0) = "—ﬁ„ «·Õ”«»"
    frmJuristicSignatoryCaption(25, 1) = "Account #"
    frmJuristicSignatoryCaption(26, 0) = "—ﬁ„ «·„›Ê÷ »«· ÊﬁÌ⁄"
    frmJuristicSignatoryCaption(26, 1) = "Signatory #"
    frmJuristicSignatoryCaption(27, 0) = "«”„ «·„›Ê÷ »«· ÊﬁÌ⁄"
    frmJuristicSignatoryCaption(27, 1) = "Signatory Name"
    frmJuristicSignatoryCaption(28, 0) = "—ﬁ„ ›—⁄ «·⁄„Ì·"
    frmJuristicSignatoryCaption(28, 1) = "Customer branch code"
    frmJuristicSignatoryCaption(29, 0) = "‰Ê⁄/—ﬁ„ «·ÂÊÌ…"
    frmJuristicSignatoryCaption(29, 1) = "Id type-Id number"
    
    frmSearchEngineCaption(0, 0) = "T-List √” ›”«—⁄‰"
    frmSearchEngineCaption(0, 1) = "T-List Enquiry"
    frmSearchEngineCaption(1, 0) = "√”„ «·⁄„Ì·"
    frmSearchEngineCaption(1, 1) = "Customer Name"
    frmSearchEngineCaption(2, 0) = "√»ÕÀ"
    frmSearchEngineCaption(2, 1) = "Search"
    frmSearchEngineCaption(3, 0) = "Œ—ÊÃ"
    frmSearchEngineCaption(3, 1) = "Exit"
    frmSearchEngineCaption(4, 0) = "«·„’œ—"
    frmSearchEngineCaption(4, 1) = "Source"
    frmSearchEngineCaption(5, 0) = "«·«”„ »«·«‰Ã·Ì“Ì"
    frmSearchEngineCaption(5, 1) = "English Name"
    frmSearchEngineCaption(6, 0) = "«·«”„ »«·⁄—»Ì"
    frmSearchEngineCaption(6, 1) = "Arabic Name"
    frmSearchEngineCaption(7, 0) = "—ﬁ„ «·ÂÊÌ…"
    frmSearchEngineCaption(7, 1) = "Id Number"
    frmSearchEngineCaption(8, 0) = " «—ÌŒ «·„Ì·«œ"
    frmSearchEngineCaption(8, 1) = "Date of birth"
    frmSearchEngineCaption(9, 0) = "„ﬂ«‰ «·„Ì·«œ"
    frmSearchEngineCaption(9, 1) = "Place of birth"
    frmSearchEngineCaption(10, 0) = "«·„”„Ï «·ÊŸÌ›Ì"
    frmSearchEngineCaption(10, 1) = "Position"
    frmSearchEngineCaption(11, 0) = "„⁄·Ê„«  √Œ—Ï"
    frmSearchEngineCaption(11, 1) = "Additional Info"
    frmSearchEngineCaption(12, 0) = "⁄·„ √” Œ·«’ «·„⁄·Ê„« "
    frmSearchEngineCaption(12, 1) = "Extract flag"
    
    frmSendFileCaption(0, 0) = "≈—”«· ﬂ‘› «·Õ”«» ≈·Ï «·›—⁄.."
    frmSendFileCaption(0, 1) = "FTP Historical statement to Branch"
    frmSendFileCaption(1, 0) = "√œŒ· —„“ «·›—⁄"
    frmSendFileCaption(1, 1) = "Enter the branch code here"
    frmSendFileCaption(2, 0) = "√—”· «·„·›"
    frmSendFileCaption(2, 1) = "Run FTP"
    frmSendFileCaption(3, 0) = "Œ—ÊÃ"
    frmSendFileCaption(3, 1) = "Exit"
    frmSendFileCaption(4, 0) = "«·Õ«·…"
    frmSendFileCaption(4, 1) = "Status"
    
    frmGeneralCustStatusCaption(0, 0) = "”Ã· «·⁄„·«¡ «·„› ÊÕ… ⁄‰ ÿ—Ìﬁ Â« ›"
    frmGeneralCustStatusCaption(0, 1) = "Customers opened through phone"
    frmGeneralCustStatusCaption(1, 0) = " «—ÌŒ «·»œ«Ì…"
    frmGeneralCustStatusCaption(1, 1) = "Start Date"
    frmGeneralCustStatusCaption(2, 0) = " «—ÌŒ «·‰Â«Ì…"
    frmGeneralCustStatusCaption(2, 1) = "End Date"
    frmGeneralCustStatusCaption(3, 0) = "Õ«·… «·Õﬁ·"
    frmGeneralCustStatusCaption(3, 1) = "Record status"
    frmGeneralCustStatusCaption(4, 0) = "«·Ã„Ì⁄"
    frmGeneralCustStatusCaption(4, 1) = "All"
    frmGeneralCustStatusCaption(5, 0) = "«‰ Â«¡"
    frmGeneralCustStatusCaption(5, 1) = "Completed"
    frmGeneralCustStatusCaption(6, 0) = "„⁄«œ"
    frmGeneralCustStatusCaption(6, 1) = "Rejected"
    frmGeneralCustStatusCaption(7, 0) = "„⁄·ﬁ »«·›—⁄"
    frmGeneralCustStatusCaption(7, 1) = "Pending with Branch"
    frmGeneralCustStatusCaption(8, 0) = "·„ Ì „ “Ì«—… «·›—⁄ „‰ ﬁ»· «·⁄„Ì·"
    frmGeneralCustStatusCaption(8, 1) = "Customer not visited the branch"
    frmGeneralCustStatusCaption(9, 0) = "‰›–"
    frmGeneralCustStatusCaption(9, 1) = "Go"
    frmGeneralCustStatusCaption(10, 0) = "«· «·Ì"
    frmGeneralCustStatusCaption(10, 1) = "More"
    frmGeneralCustStatusCaption(11, 0) = "„⁄·Ê„«  «·⁄„Ì·"
    frmGeneralCustStatusCaption(11, 1) = "Customer Info"
    frmGeneralCustStatusCaption(12, 0) = "Œ—ÊÃ"
    frmGeneralCustStatusCaption(12, 1) = "Exit"
    frmGeneralCustStatusCaption(13, 0) = "ÿ»«⁄… «·‘«‘…"
    frmGeneralCustStatusCaption(13, 1) = "Screen Print"
    frmGeneralCustStatusCaption(14, 0) = "—ﬁ„ «·›—⁄"
    frmGeneralCustStatusCaption(14, 1) = "Branch Code"
    frmGeneralCustStatusCaption(15, 0) = "ÂÊÌ… «·„” Œœ„"
    frmGeneralCustStatusCaption(15, 1) = "User Id"
    frmGeneralCustStatusCaption(16, 0) = "«· «—ÌŒ Ê«·Êﬁ "
    frmGeneralCustStatusCaption(16, 1) = "Date & Time"
    frmGeneralCustStatusCaption(17, 0) = "—ﬁ„ «·⁄„Ì·"
    frmGeneralCustStatusCaption(17, 1) = "Customer Number"
    frmGeneralCustStatusCaption(18, 0) = "—ﬁ„ ›—⁄ «·⁄„Ì·"
    frmGeneralCustStatusCaption(18, 1) = "Customer Branch Code"
    frmGeneralCustStatusCaption(19, 0) = "Õ«·… «·„⁄·ﬁ"
    frmGeneralCustStatusCaption(19, 1) = "Pending Status"
    frmGeneralCustStatusCaption(20, 0) = "ÂÊÌ… «· ·— »«·›—⁄"
    frmGeneralCustStatusCaption(20, 1) = "Branch User Id"
    frmGeneralCustStatusCaption(21, 0) = "«·«Ã—«¡/«· «—ÌŒ Ê «·Êﬁ "
    frmGeneralCustStatusCaption(21, 1) = "Branch action Date&Time"
    frmGeneralCustStatusCaption(22, 0) = "ÂÊÌ… «·„‘—› »«·›—⁄"
    frmGeneralCustStatusCaption(22, 1) = "Branch supervisor Id"
    frmGeneralCustStatusCaption(23, 0) = "ﬁ»Ê· «· «—ÌŒ Ê «·Êﬁ "
    frmGeneralCustStatusCaption(23, 1) = "Approved Date&Time"
    frmGeneralCustStatusCaption(24, 0) = " «—ÌŒ › Õ «·⁄„Ì·"
    frmGeneralCustStatusCaption(24, 1) = "Customer Open Date"
    
End Sub

Public Sub populateApplicationCaptions()
   appAccOpeningAppln(0) = "ÿ·» › Õ Õ”«»"
   appAccOpeningAppln(1) = "ACCOUNT OPENING APPLICATION"
   appDate(0) = "«· «—ÌŒ"
   appDate(1) = "DATE   "
   appBranch(0) = "«·›—⁄  "
   appBranch(1) = "BRANCH "
   appPlsOpenAnAcc(0) = "‰√„· «‰  › ÕÊ« ·‰« Õ”«»« ·œÌﬂ„ Õ”» «·»Ì«‰«  «· «·Ì… "
   appPlsOpenAnAcc(1) = "PLEASE OPEN AN ACCOUNT AS FOLLOWS"
   appPersonalDetails(0) = " ›«’Ì· ‘Œ’Ì…"
   appPersonalDetails(1) = "PERSONAL DETAILS"
   appLastName(0) = "«”„ «·⁄«∆·…"
   appLastName(1) = "LAST NAME"
   appThirdName(0) = "«”„ «·Ãœ"
   appThirdName(1) = "THIRD NAME"
   appMiddleName(0) = "«”„ «·«»"
   appMiddleName(1) = "MIDDLE NAME"
   appFirstName(0) = "«·«”„"
   appFirstName(1) = "FIRST NAME"
   appPrefLang(0) = "«··€… «·„›÷·… ·ﬂ‘› «·Õ”«»"
   appPrefLang(1) = "PREFERRED ACCOUNT STATEMENT LANGUAGE"
   appEnglish(0) = "«‰Ã·Ì“Ì"
   appEnglish(1) = "ENGLISH"
   appArabic(0) = "⁄—»Ì"
   appArabic(1) = "ARABIC"
   
   appNationality(0) = "«·Ã‰”Ì…     "
   appNationality(1) = "NATIONALITY  "
   appSaudi(0) = "”⁄ÊœÌ"
   appSaudi(1) = "SAUDI"
   appGender(0) = "«·Ã‰”       "
   appGender(1) = "GENDER       "
   appMale(0) = "–ﬂ—"
   appMale(1) = "MALE"
   appFemale(0) = "«‰ÀÏ"
   appFemale(1) = "FEMALE"
   appDob(0) = " «—ÌŒ «·„Ì·«œ"
   appDob(1) = "DATE OF BIRTH"
               
   appAccountType(0) = "‰Ê⁄ «·Õ”«»"
   appAccountType(1) = "ACCOUNT TYPE"
   appConsumer(0) = "›—œÌ"
   appConsumer(1) = "CONSUMER"
   appCommercial(0) = " Ã«—Ì"
   appCommercial(1) = "COMMERCIAL"
   appSaudiIdNo(0) = "—ﬁ„ »ÿ«ﬁ… «·«ÕÊ«· «·„œ‰Ì…"
   appSaudiIdNo(1) = "SAUDI ID NO.  "
   appIqamaNo(0) = "—ﬁ„ «·«ﬁ«„…             "
   appIqamaNo(1) = "IQAMA NO."
   appIssuedAt(0) = "„ﬂ«‰ «·«’œ«—            "
   appIssuedAt(1) = "ISSUED AT     "
   appIssueDate(0) = " «—ÌŒ «·«’œ«—            "
   appIssueDate(1) = "ISSUANCE DATE "
   appExpiryDate(0) = " «—ÌŒ «·«‰ Â«¡           "
   appExpiryDate(1) = "EXPIRY DATE   "
   appPassportNo(0) = "—ﬁ„ ÃÊ«“ «·”›—          "
   appPassportNo(1) = "PASSPORT NO.   "
   appHafizaNo(0) = "—ﬁ„ «·Õ›ÌŸ…              "
   appHafizaNo(1) = "HAFIZAH NO.    "
   appNoOfDependents(0) = "⁄œœ «·«›—«œ «·–Ì‰  ⁄Ì·Â„"
   appNoOfDependents(1) = "NUMBER OF DEPENDENTS"
   appMaritalStatus(0) = "«·Õ«·… «·«Ã „«⁄Ì…        "
   appMaritalStatus(1) = "MARITAL STATUS      "
   appSingle(0) = "«⁄“»"
   appSingle(1) = "SINGLE"
   appMarried(0) = "„ “ÊÃ"
   appMarried(1) = "MARRIED"
   appOther(0) = "«Œ—Ï"
   appOther(1) = "OTHER"
   appSaudiMailingAddr(0) = "«·⁄‰Ê«‰ «·»—ÌœÌ œ«Œ· «·„„·ﬂ…"
   appSaudiMailingAddr(1) = "MAILING ADDRESS IN SAUDI ARABIA"
   appAddress1(0) = "⁄‰Ê«‰ 1 "
   appAddress1(1) = "ADDRESS LINE-1 "
   appAddress2(0) = "⁄‰Ê«‰ 2 "
   appAddress2(1) = "ADDRESS LINE-2 "
   
   appPoBox(0) = "’ » "
   appPoBox(1) = "P.O.BOX"
   appCity(0) = "«·„œÌ‰…"
   appCity(1) = "CITY"
   appZipcode(0) = "«·—„“ «·»—ÌœÌ"
   appZipcode(1) = "ZIP CODE"
   appFax(0) = "›«ﬂ”                  "
   appFax(1) = "FAX"
   appOffPhone(0) = "—ﬁ„  ·›Ê‰ «·„ﬂ »       "
   appOffPhone(1) = "OFFICE PHONE"
   appResPhone(0) = "—ﬁ„  ·›Ê‰ «·„‰“·       "
   appResPhone(1) = "RESIDENCE PHONE NUMBER"
   appEmailAddr(0) = "⁄‰Ê«‰ «·»—Ìœ «·«·Ìﬂ —Ê‰Ì"
   appEmailAddr(1) = "E-MAIL ADDRESS"
   appMobile(0) = "ÃÊ«·"
   appMobile(1) = "MOBILE"
   appHouseNo(0) = "—ﬁ„ «·„‰“·"
   appHouseNo(1) = "HOUSE NO."
   appStreet(0) = "‘«—⁄"
   appStreet(1) = "STREET"
   appArea(0) = "«·ÕÌ"
   appArea(1) = "AREA"
   
   appHomeCountryAddr(0) = "«·⁄‰Ê‰ «·»—ÌœÌ Œ«—Ã «·„„·ﬂ…(·€Ì— «·”⁄ÊœÌÌ‰)"
   appHomeCountryAddr(1) = "ADDRESS IN HOME COUNTRY (FOR NON SAUDI):"
   
   appPersonalProfile(0) = "«·»Ì«‰«  «·‘Œ’Ì…"
   appPersonalProfile(1) = "PERSONAL PROFILE"
   appEducation(0) = "«· ⁄·Ì„             :"
   appEducation(1) = "EDUCATION        :"
   appOthers(0) = "«Œ—Ï"
   appOthers(1) = "OTHERS"
   appDoctoral(0) = "œﬂ Ê—«Â"
   appDoctoral(1) = "DOCTORAL"
   appMaster(0) = "«·„«Ã” Ì—"
   appMaster(1) = "MASTER"
   appBachelor(0) = "»ﬂ«·Ê—ÌÊ”"
   appBachelor(1) = "BACHELOR"
   appDiploma(0) = "œ»·Ê„"
   appDiploma(1) = "DIPLOMA"
   appHighSchool(0) = "Õ Ï «·À«‰ÊÌ… «·⁄«„…"
   appHighSchool(1) = "UP TO HIGH SCHOOL"
   appProfession(0) = "«·„Â‰…               :"
                      
   appProfession(1) = "PROFESSION       :"
   appBusinessMan(0) = "—Ã· √⁄„«·"
   appBusinessMan(1) = "BUSINESS MAN"
   appPrivateSector(0) = "ﬁÿ«⁄ Œ«’"
   appPrivateSector(1) = "PRIVATE SECTOR"
   appGovtSector(0) = "ﬁÿ«⁄ ÕﬂÊ„Ì"
   appGovtSector(1) = "GOVERNMENT SECTOR"
   appPensioner(0) = "„ ﬁ«⁄œ"
   appPensioner(1) = "PENSIONER"
   appPosition(0) = "«·„‰’» «·ÊŸÌ›Ì       :"
   appPosition(1) = "POSITION         :"
   appStudent(0) = "ÿ«·»"
   appStudent(1) = "STUDENT"
   appStaffClerk(0) = "„ÊŸ› / ﬂ« »"
   appStaffClerk(1) = "STAFF/CLERK"
   appSupervisor(0) = "„‘—›"
   appSupervisor(1) = "SUPERVISOR"
   appManger(0) = "„œÌ—"
   appManger(1) = "MANAGER"
   appMonthlyIncome(0) = "«·œŒ· «·‘Â—Ì »«·—Ì«·:"
   appMonthlyIncome(1) = "MONTHLY INCOME SR:"
   app500110000(0) = "5001-10000"
   app500110000(1) = "5001-10000"
   app25015000(0) = "2501-5000"
   app25015000(1) = "2501-5000"
   appUpto2500(0) = "Up to 2500"
   appUpto2500(1) = "Õ Ï  2500"
   app1000115000(0) = "10001-15000"
   app1000115000(1) = "10001-15000"
   app1500120000(0) = "15001-20000"
   app1500120000(1) = "15001-20000"
   app20001Plus(0) = "20001 ›«ﬂÀ—"
   app20001Plus(1) = "20001 Plus"
   appProperty(0) = "⁄ﬁ«— "
   appProperty(1) = "PROPERTY"
   appCompAccom(0) = "”ﬂ‰ «·‘—ﬂ…"
   appCompAccom(1) = "COMPANY ACCOMMODATION"
   appOwnHouse(0) = "»Ì  „·ﬂ"
   appOwnHouse(1) = "OWN HOUSE"
   appRentedHouse(0) = "»Ì  „” √Ã—"
   appRentedHouse(1) = "RENTED HOME"
   appCar(0) = "”Ì«—…"
   appCar(1) = "CAR"
   appCompTrans(0) = "”Ì«—… «·‘—ﬂ…"
   appCompTrans(1) = "COMPANY TRANSPORT"
   appOwnCar(0) = "”Ì«—… „·ﬂ"
   appOwnCar(1) = "OWN CAR"
   appRentedCar(0) = "”Ì«—… „” √Ã—…"
   appRentedCar(1) = "RENTED CAR"
   appJobInfo(0) = "„⁄·Ê„«  «·ÊŸÌ›…"
   appJobInfo(1) = "JOB INFORMATION"
   appDeptName(0) = "«·ﬁ”„.      "
   appDeptName(1) = "NAME OF DEPT.    :"
   appEmployerName(0) = "ÃÂ… «·⁄„·   "
   appEmployerName(1) = "EMPLOYER'S NAME  :"
   appExtn(0) = "«· ÕÊÌ·….   "
   appExtn(1) = "EXTN."
   appEnclDoc(0) = "«·ÊÀ«∆ﬁ «·„—›ﬁ…"
   appEnclDoc(1) = "ENCLOSED DOCUMENTS"
   appAuthSignDoc(0) = "‰„«–Ã  ÊﬁÌ⁄ «·„›Ê÷Ì‰ »«· ÊﬁÌ⁄"
   appAuthSignDoc(1) = "SAMPLE OF AUTHORISED SIGNATURE(S)"
   appIdIqamaCopy(0) = "’Ê—… ⁄‰ «·ÂÊÌ… / «·«ﬁ«„…"
   appIdIqamaCopy(1) = "COPY OF I.D./IQAMA"
   appCcRegnCopy(0) = "’Ê—… «·”Ã· «· Ã«—Ì"
   appCcRegnCopy(1) = "COPY OF C.C. REGISTRATION"
   appMemoArticleAssoc(0) = "⁄ﬁœ «· √”Ì” Ê«·‰Ÿ«„ «·«”«”Ì ··‘—ﬂ…"
   appMemoArticleAssoc(1) = "COPY OF MEMORANDUM AND ARTICLES OF ASSOCIATION"
   appPowerOfAttorney(0) = "Êﬂ«·… ‘—⁄Ì…"
   appPowerOfAttorney(1) = "POWER OF ATTORNEY(GOVERNMENT)"
   appBankAuth(0) = " ›ÊÌ÷ »‰ﬂÌ"
   appBankAuth(1) = "BANK AUTHORIZATION"
   appSalaryTransferCert(0) = "‘Â«œ…  ÕÊÌ· «·—« »"
   appSalaryTransferCert(1) = "SALARY TRANSFER CERTIFICATE"
   appJointAccountAgreement(0) = "« ›«ﬁÌ… Õ”«» „‘ —ﬂ"
   appJointAccountAgreement(1) = "JOINT ACCOUNT AGREEMENT"
   appOtherDocuments(0) = "√Œ—Ï (—Ã«¡ «·«Ì÷«Õ)"
   appOtherDocuments(1) = "OTHER(PLEASE SPECIFY)"
   appAccount(0) = "«·Õ”«»"
   appAccount(1) = "ACCOUNT"
   appSavingAcc(0) = " Ê›Ì—"
   appSavingAcc(1) = "SAVING"
   appCurrentAcc(0) = "Ã«—Ì"
   appCurrentAcc(1) = "CURRENT"
   appPleaseSpecify(0) = "—Ã«¡ «·«Ì÷«Õ"
   appPleaseSpecify(1) = "PLEASE SPECIFY"
   appChequeBook(0) = "œ› — ‘Ìﬂ« "
   appChequeBook(1) = "CHEQUE BOOK"
   appYes(0) = "‰⁄„"
   appYes(1) = "YES"
   appNo(0) = "·«"
   appNo(1) = "NO"
   appAccCurr(0) = "⁄„·… «·Õ”«»     "
   appAccCurr(1) = "ACCOUNT CURRENCY"
   appGBP(0) = "Ã‰Ì…«” —·Ì‰Ì"
   appGBP(1) = "GBP"
   appUSD(0) = "œÊ·«— «„—ÌﬂÌ"
   appUSD(1) = "USD"
   appSAR(0) = "—Ì«· ”⁄ÊœÌ"
   appSAR(1) = "SAR"
   appAccStmtFreq(0) = "ﬂ‘› Õ”«»       "
   appAccStmtFreq(1) = "ACCOUNT STATEMENT"
   appMonthly(0) = "‘Â—Ì"
   appMonthly(1) = "MONTHLY"
   appWeekly(0) = "√”»Ê⁄Ì"
   appWeekly(1) = "WEEKLY"
   appDaily(0) = "ÌÊ„Ì"
   appDaily(1) = "DAILY"
   appSignInstruction(0) = " ⁄·Ì„«  «· ÊﬁÌ⁄"
   appSignInstruction(1) = "SIGNATURE INSTRUCTION"
   appJoint(0) = "„‘ —ﬂ"
   appJoint(1) = "JOINT"
   appIndividual(0) = "„‰›—œ"
   appIndividual(1) = "INDIVIDUAL"
   appIssueATMCard(0) = "‰—ÃÊ «’œ«— »ÿ«ﬁ… ’—«› ¬·Ì »«·«”„«¡ «· «·Ì…:"
   appIssueATMCard(1) = "PLEASE ISSUE THE ATM CARD(S) IN THE FOLLOWING NAME(S):"
   appCardType(0) = "‰Ê⁄ «·»ÿ«ﬁ…  : "
   appCardType(1) = "CARD TYPE  : "
   appElectronIntl(0) = "«·Ìﬂ —Ê‰ œÊ·Ì"
   appElectronIntl(1) = "ELECTRON INTERNATIONAL"
   appSmartCard(0) = "»ÿ«ﬁ… –ﬂÌ…"
   appSmartCard(1) = "SMART CARD"
   appPrimaryAtmCard(0) = "«·»ÿ«ﬁ… «·«Ê·Ï"
   appPrimaryAtmCard(1) = "PRIMARY ATM CARD"
   appNameOnTheCard(0) = "«·«”„ ⁄·Ï «·»ÿ«ﬁ… »«·«‰Ã·Ì“Ì…"
   appNameOnTheCard(1) = "NAME TO APPEAR ON CARD"
   appMaxCharsInAtm(0) = "Õ—Ê› «‰Ã·Ì“Ì… »Õœ «ﬁ’Ï 26 Õ—›« „⁄ «·›—«€« "
   appMaxCharsInAtm(1) = "CAPITAL LETTERS, MAXIMUM 26 CHARACTERS INCLUDING SPACES"
   appSecondaryAtm(0) = "«·»ÿ«ﬁ… «·À«‰Ì…"
   appSecondaryAtm(1) = "SECONDARY ATM CARD"
   appCardDeliveryChannel(0) = "ÿ—Ìﬁ…  ”·Ì„ «·»ÿ«ﬁ… "
   appCardDeliveryChannel(1) = "CARD DELIVERY CHANNEL "
   appBranchDelivery(0) = "»Ê«”ÿ… «·›—⁄"
   appBranchDelivery(1) = "THROUGH THE BRANCH"
   appMailDelivery(0) = " —”· »«·»—Ìœ"
   appMailDelivery(1) = "TO BE MAILED"
   appName(0) = "«·«”„:"
   appName(1) = "NAME:"
   appSignature(0) = "«· ÊﬁÌ⁄:"
   appSignature(1) = "SIGNATURE:"
   appCustNoAssigned(0) = "—ﬁ„ «·⁄„Ì· «·ÃœÌœ : "
   appCustNoAssigned(1) = "CUSTOMER NUMBER ASSIGNED : "
   appGpsStreetName(0) = "Ê«’· #-«”„ ‘«—⁄/„‰ÿﬁ…"
   appGpsStreetName(1) = "GPS #-Street/Area Name"
   appUnit(0) = "ÊÕœ… —ﬁ„"
   appUnit(1) = "Unit"
   appPage(0) = "’›ÕÂ "
   appPage(1) = "Page "
   appDeclaration(0) = "≈ﬁ‹‹—«—"
   appDeclaration(1) = "DECLARATION"
   appUnknown(0) = "€Ì— –·ﬂ"
   appUnknown(1) = "Unknown"
   appAllAccountTerms(0) = "«·‘—Êÿ «·⁄«„… «· Ì  Œ÷⁄ ·Â« Ã„Ì⁄ «·Õ”«»« "
   appAllAccountTerms(1) = "General Conditions Governing All Accounts"
   appCurrentAccTerms(0) = "«·‘—Êÿ «·Œ«’… »«·Õ”«» «·Ã«—Ì"
   appCurrentAccTerms(1) = "Terms And Conditions of Current Account"
   appSavingAccTerms(0) = "«·‘—Êÿ «·Œ«’… »Õ”«» «· Ê›Ì—"
   appSavingAccTerms(1) = "Terms And Conditions of Saving Account"
   appAtmCardTerms(0) = "‰’Ê’ Ê‘—Êÿ «” Œœ«„ »ÿ«ﬁ… ’—«› «·⁄—»Ì"
   appAtmCardTerms(1) = "Terms And Conditions for Using Al-Arabi Electron Card"
   appHatifAlArabiTerms(0) = "«·‘—Êÿ Ê«·√Õﬂ«„ «·Œ«’… »Â« › «·⁄—»Ì"
   appHatifAlArabiTerms(1) = "Hatif Al Arabi ('Phone Banking') Terms & Conditions"
   appContd(0) = "Ì »⁄...."
   appContd(1) = "Contd....."
   appEndOfTerms(0) = "***** ‰Â«Ì… «·‘—Êÿ Ê«·√Õﬂ«„ ******"
   appEndOfTerms(1) = "***** End of Terms & Conditions ******"
   
   appAtmCardAppln(0) = "ÿ·» ≈’œ«— »ÿ«ﬁ… ’—«›"
   appAtmCardAppln(1) = "ATM CARD APPLICATION"
   appTheManagerAnb(0) = "Õ÷—… «·”Ìœ / „œÌ— «·»‰ﬂ «·⁄—»Ì"
   appTheManagerAnb(1) = "The Manager, ARAB NATIONAL BANK"
   appPleaseIssueAtmCard(0) = "√—ÃÊ «· ﬂ—„ »≈’œ«— »ÿ«ﬁ…"
   appPleaseIssueAtmCard(1) = "PLEASE ISSUE THE AL-ARABI"
   appAsPerFollowing(0) = "Õ”» «·»Ì«‰«  «· «·Ì…: "
   appAsPerFollowing(1) = "AS PER THE FOLLOWING DETAILS :"
   appAccHoldersName(0) = "≈”„ ’«Õ» «·Õ”«» »«·ﬂ«„·"
   appAccHoldersName(1) = "Account holder's name"
   appMailingAddress(0) = "«·⁄‰Ê«‰ «·»—ÌœÌ"
   appMailingAddress(1) = "Mailing Address"
   appHomePhone(0) = "Â« › «·„‰“·"
   appHomePhone(1) = "Home Phone"
   appBilingual(0) = "⁄—»Ì/«‰Ã·Ì“Ì"
   appBilingual(1) = "ARABIC/ENGLISH"
   appAccHoldersSign(0) = " ÊﬁÌ⁄ ’«Õ» «·Õ”«»: "
   appAccHoldersSign(1) = "Account Holder's Signature :"
   appPlsSignAsAccSign(0) = "(Ì—ÃÏ «· ÊﬁÌ⁄ »‰›” «·‘ﬂ· ⁄·Ï «·Õ”«»)"
   appPlsSignAsAccSign(1) = "(Please sign as specimen signature on the account)"
   appBankUseOnly(0) = "·≈” ⁄„«· «·»‰ﬂ"
   appBankUseOnly(1) = "FOR BANK USE ONLY"
   appForCashWithdrawal(0) = "··”Õ» «·„»«‘—"
   appForCashWithdrawal(1) = "for cash withdrawal"
   appAtmScreenLang(0) = "≈Œ Ì«— «··€… ⁄·Ï ‘«‘… «·ÃÂ«“"
   appAtmScreenLang(1) = "Language selection on the screen"
   appCurrentAcct(0) = "—ﬁ„ «·Õ”«» «·Ã«—Ì  "
   appCurrentAcct(1) = "Current Account  "
   
   appAtmPinTerms(0) = "      «ﬁ—«— »«Œ Ì«— Ê«œŒ«· «·—ﬁ„ «·”—Ì"
   appAtmPinTerms(1) = "Application form for selecting ATM PIN"
   appAcctNo(0) = "—ﬁ„ «·Õ”«»      "
   appAcctNo(1) = "Account Number "
   appAtmNo(0) = "—ﬁ„ »ÿ«ﬁ… «·’—«› "
   appAtmNo(1) = "ATM card number "
   appTelNo(0) = "—ﬁ„ «·Â« ›      "
   appTelNo(1) = "Telephone No.   "
   appIdNumber(0) = "—ﬁ„ »ÿ«ﬁ… «·«ÕÊ«·/«·«ﬁ«„…    "
   appIdNumber(1) = "ID number    "
   appDatePlaceOfIssue(0) = " «—ÌŒ Ê„ﬂ«‰ «·«’œ«—"
   appDatePlaceOfIssue(1) = "Date/Place of issue"
   appCustServiceSupervisor(0) = "„‘—› Œœ„«  «·⁄„·«¡"
   appCustServiceSupervisor(1) = "Customer Services Supervisor"
   
   appChequeBookRequestAppln(0) = "      ‰„Ê–Ã/≈⁄«œ… ÿ·» œ› — «·‘Ìﬂ« "
   appChequeBookRequestAppln(1) = "Ordering/Reordering Cheque Books"
   appPlsProvideChqBook(0) = "¬„·  “ÊÌœ‰« »œ› — ‘Ìﬂ«  ÌÕ ÊÌ ⁄·Ï: "
   appPlsProvideChqBook(1) = "Please provide me/us with Cheque Books that has the following:"
   app50chequeLeaves(0) = "50 ‘Ìﬂ« (··‘—ﬂ«  Ê«·„ƒ””«  ›ﬁÿ)"
   app50chequeLeaves(1) = "50 Cheque leaves (for Corp. & Est. only)"
   app25ChequeLeaves(0) = "25 ‘Ìﬂ« (··√›—«œ)"
   app25ChequeLeaves(1) = "25 Cheque leaves (personal)"
   appQuantity(0) = "⁄œœ :"
   appQuantity(1) = "Quantity :"
   appChqReceipt(0) = "⁄·Ï √‰  ﬂÊ‰ ÿ—Ìﬁ… «· ”·Ì„ »«·›—⁄"
   appChqReceipt(1) = "Receipt of the above cheque books will be  Collected at the branch"
   appCustomerSignature(0) = " ÊﬁÌ⁄ «·⁄„Ì·"
   appCustomerSignature(1) = "Customer Signature"
   appCSRSignature(0) = "„ÊŸ› Œœ„«  «·⁄„·«¡"
   appCSRSignature(1) = "Customer Service Representative"
   
   'added by Mohit on 03-Dec-2006 as per Mohammed A. Tanenah's mail on 02-Dec-2006
   appCardNoWasRecv(0) = " „ «” ·«„ »ÿ«ﬁ… «·’—«› —ﬁ„"
   appCardNoWasRecv(1) = "was received."
   appCustName(0) = "«”„ «·⁄„Ì·"
   appCustName(1) = "Customer Name"
   appCustSignVerif(0) = " „ „ÿ«»ﬁ…  ÊﬁÌ⁄ «·⁄„Ì·"
   appCustSignVerif(1) = "Customer Signature Verification"
   appCustSrvRepNameSign(0) = "≈”„ Ê ÊﬁÌ⁄ „ÊŸ› Œœ„«  «·⁄„·«¡"
   appCustSrvRepNameSign(1) = "CS Representative Name & Signature"
   appCustSrvSuprNameSign(0) = "«”„ Ê ÊﬁÌ⁄ „‘—› Œœ„«  «·⁄„·«¡"
   appCustSrvSuprNameSign(1) = "CS Supervisor Name & Signature"
   'till here by Mohit

End Sub

    
