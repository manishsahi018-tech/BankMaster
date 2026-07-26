Attribute VB_Name = "globalVariables2"
Public Type reqMsgSadadReversalPendingList
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    lastRecCount As String * 5
    pendingFlag As String * 1
    transRefNo As String * 10
End Type

Public Type sadadReversalPendingListDetails
    userId As String
    dateTime As String
    tellerId As String
    transRefNo As String
    billerId As String
    subsNo As String
    billAmt As String
    filler As String
End Type

Public Type resMsgSadadReversalPendingList
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks  As String
    lastRecCount As String
    noOfRecs As String
    filler As String
    details(20) As sadadReversalPendingListDetails
End Type

Public Type reqMsgSadadTransEnq
    msgLen As String * 6
    service As String * 2
    homeBranch As String * 4
    userId As String * 10
    tellerId As String * 3
    companyId As String * 4
    transDate As String * 8
    enqTellerId As String * 3
    subscriptionNo As String * 19
    lastRecCount As String * 5
End Type

Public Type sadadTransInfo
    transDate As String
    branchCode As String
    tellerId As String
    companyId As String
    subsNo As String
    drAccNo As String
    billAmt As String
    transRefNo As String
    valueDate As String
    paymentType As String
    preOrPostpaid As String
    transType As String
    postingStatus As String
    cashOrAcc As String
    supervisorId As String
End Type

Public Type resMsgSadadTransEnq
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    totalTrans As String
    lastRecCount As String
    noOfRecs As String
    companyId As String
    transDate As String
    enqTellerId As String
    subscriptionNo As String
    completionFlag As String
    details(20) As sadadTransInfo
End Type

Public Type resMsgAccOpeningCard
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    custNo As String
    accNo As String
    iban As String
    customerLang As String
    aShortName As String
    eShortName As String
    custOpenDate As String
    custBranchCode As String
    accOpenDate As String
    firstName As String
    secondName As String
    thirdName As String
    lastName As String
End Type

Public Type resMsgFetchAccDetail
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    accNo As String
    iban  As String
End Type

Public Type resMsgFetchEstmtStatus
    msgLen As String
    status As String
    service As String
    aRemarks As String
    eRemarks As String
    custNo As String
    custName As String
    branchCode As String
    emailAddress As String
    stmtDeliveryMode As String
    supervisorComments As String
End Type

Public sadadSupervisorAction As Boolean
Public sadadTellerAction As Boolean
Public ratibiIdNo As String
Public ratibiAccNo As String
Public ratibiCardName As String
Public payrollBranch As Boolean
Public accOpenCardPrintAllowed As Boolean

Public recvAccPendingDetail As resMsgAccPendingDetail
Public recvFetchAccDetail As resMsgFetchAccDetail
Public sadadReversalPendingList As reqMsgSadadReversalPendingList
Public recvSadadReversalPendingList As resMsgSadadReversalPendingList
Public sadadTransEnqMsg As reqMsgSadadTransEnq
Public recvSadadTransEnqMsg As resMsgSadadTransEnq
Public recvAccOpeningCardMsg As resMsgAccOpeningCard

Public recvEstmtStatusMsg As resMsgFetchEstmtStatus

Public mnuTellerCaption(10, 2) As String
Public mnuChiefTellerCaption(10, 2) As String
Public frmTellerFacilitiesCaption(10, 2) As String
Public frmSadadPaymentCaption(35, 2) As String
Public frmSadadReversalPendingListCaption(20, 2) As String
Public frmSadadTransEnqCaption(25, 2) As String
Public frmPrintAccOpeningCardCaption(25, 2) As String
Public frmEstmtRegnCaption(15, 2) As String
Public frmEstmtRejectionCaption(5, 2) As String

Public errEnterRefNoForReversal(2) As String
Public errInvalidTxnSelected(2) As String
Public errReversalPendingWithChiefTeller(2) As String
Public errReversalApproved(2) As String
Public errReversalRejected(2) As String
Public errBillerIdNotDefined(2) As String
Public errPrepaymentNotAllowed(2) As String
Public errBillAlreadyPaid(2) As String
Public errSpaceDrAccNo(2) As String
Public errInvalidSubsNo(2) As String
Public errReceiptPrinterNotFound(2) As String
Public errWannaPrintReceiptAgain(2) As String
Public errSigcapRetrieveNotStarted(2) As String
Public errCashAccNotDefined(2)  As String
Public errReversalFailedBillNotPaid(2) As String
Public errTellerCashPositionNotOpen(2) As String
Public errBillPaid(2)  As String
Public errBillReversed(2) As String
Public errBillTerminated(2) As String
Public errCash(2) As String
Public errOnlyLocalBrnTxn(2) As String
Public errInvalidCompanyId(2) As String
Public errTxnDoneByAnotherTeller(2) As String
Public errYes(2) As String
Public errNo(2) As String
Public errOnlySarDrAcc(2) As String
Public errAmtGreaterThanZero(2) As String
Public errRatibiCardNotSelected(2) As String
Public errIban(2) As String
Public errCustNoAlloted(2) As String
Public errSpaceEmailAddress(2) As String
Public errInvalidTenorPeriod(2) As String
Public errChequeBookNotAllowedForThisMemo(2) As String
Public errBmNotice(2) As String   '"The information being fetched from BANKMASTER as on Cut-over Date; NOT FROM FINACLE "

