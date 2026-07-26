Attribute VB_Name = "globalFunctions"
Option Explicit
Public Sub formatRequest(recType As String, recValue As String, service As String, action As String)
Dim strmsglen As String
If action = "A" Or action = "U" Then
   SendMsg = "000255" & service & gBranchCode & recType & recValue & action & arabicName & englishName & OtherDetails
Else
   SendMsg = "000015" & service & gBranchCode & recType & recValue & action
End If
strmsglen = Format(Len(SendMsg), "000000")
Mid$(SendMsg, 1, 6) = strmsglen
End Sub
Public Sub FormatLoginRequest(userId As String, password As String, branchCode As String, NoOfTries As String, idleTimeLogin As Boolean)
Dim strmsglen As String
Dim service As String
Dim idleTimeLoginFlag As String
service = "00"  ' 00 for Logon Request
userId = Format(userId, "!@@@@@@@@@@")
password = Format(password, "!@@@@@@@@@@@@@@@@@@@@")
If idleTimeLogin = True Then
   idleTimeLoginFlag = "1"
Else
   idleTimeLoginFlag = "0"
End If
SendMsg = "000000" & service & gBranchCode & userId & password & branchCode & NoOfTries & "VER3" & App.Major & "." & App.Minor & "." & App.Revision & idleTimeLoginFlag
strmsglen = Format(Len(SendMsg), "000000")
Mid$(SendMsg, 1, 6) = strmsglen
End Sub

Public Sub FormatChangePasswordRequest(userId As String, OldPassword As String, NewPassword As String, NoOfTries As String)
Dim strmsglen As String
Dim service As String
service = "01"  ' 01 for Password Change Request
userId = Format(userId, "!@@@@@@@@@@")
OldPassword = Format(OldPassword, "!@@@@@@@@@@@@@@@@@@@@")
NewPassword = Format(NewPassword, "!@@@@@@@@@@@@@@@@@@@@")
SendMsg = "000069" & service & gBranchCode & userId & OldPassword & NewPassword & NoOfTries
strmsglen = Format(Len(SendMsg), "000000")
Mid$(SendMsg, 1, 6) = strmsglen
End Sub
Public Function ParseLoginMessage() As String
recvLoginMsg.status = Mid$(RecvStr, 1, 3)
recvLoginMsg.service = Mid$(RecvStr, 4, 2)
recvLoginMsg.langPref = Mid$(RecvStr, 6, 1)
recvLoginMsg.lastPasswordChangeDate = Mid$(RecvStr, 7, 8)
recvLoginMsg.branchCode = Mid$(RecvStr, 15, 4)
recvLoginMsg.authorityLevel = Mid$(RecvStr, 19, 20)
recvLoginMsg.globalUpdatePriv = Mid$(RecvStr, 39, 1)
recvLoginMsg.aRemarks = Mid$(RecvStr, 40, 50)
recvLoginMsg.eRemarks = Mid$(RecvStr, 90, 50)
recvLoginMsg.bankingDate = Mid$(RecvStr, 140, 8)
recvLoginMsg.cardPrdnAtBranch = Mid$(RecvStr, 148, 1)
recvLoginMsg.pinSelectAtBranch = Mid$(RecvStr, 149, 1)
recvLoginMsg.passwdChngAlertFlag = Mid$(RecvStr, 150, 1)
recvLoginMsg.mainBrEditAllowed = Mid$(RecvStr, 151, 1)
recvLoginMsg.currentDateH = Mid$(RecvStr, 152, 8)
recvLoginMsg.currentDateG = Mid$(RecvStr, 160, 8)
recvLoginMsg.tpinSelectAtBranch = Mid$(RecvStr, 168, 1)
recvLoginMsg.dormantActivationFlag = Mid$(RecvStr, 169, 1)
recvLoginMsg.tpinMandatoryAtBranch = Mid$(RecvStr, 170, 1)
recvLoginMsg.idleTimeOutPeriod = Mid$(RecvStr, 171, 4)
recvLoginMsg.nameSearchAllowed = Mid$(RecvStr, 175, 1)
recvLoginMsg.stdOrdReqAllowed = Mid$(RecvStr, 176, 1)
recvLoginMsg.custNameUpdAllowed = Mid$(RecvStr, 177, 1)
recvLoginMsg.enableChipCard = Mid$(RecvStr, 178, 1)
recvLoginMsg.mailCentreBranch = Mid$(RecvStr, 179, 1)
recvLoginMsg.mandateBranch = Mid$(RecvStr, 180, 1)
recvLoginMsg.callCentreBranch = Mid$(RecvStr, 181, 1)
recvLoginMsg.internalCustOpenAllowed = Mid$(RecvStr, 182, 1)
recvLoginMsg.enableLocalChipCard = Mid$(RecvStr, 183, 1)
recvLoginMsg.generalCustOpenAllowed = Mid$(RecvStr, 184, 1)
recvLoginMsg.pensionCustOpenAllowed = Mid$(RecvStr, 185, 1) 'added by Mohit on 28-Nov-2006
recvLoginMsg.feeExclusionUpdAllowed = Mid$(RecvStr, 186, 1)
recvLoginMsg.enableSadadProfile = Mid$(RecvStr, 187, 1)
recvLoginMsg.maxAgeLimit = Mid$(RecvStr, 188, 3)
recvLoginMsg.filler = Mid$(RecvStr, 191, 124)
recvLoginMsg.authorityLevel2 = Mid$(RecvStr, 315, 60)
recvLoginMsg.generalSamaUpdAllowed = Mid$(RecvStr, 375, 1)
recvLoginMsg.swiftCentreBranchFlag = Mid$(RecvStr, 376, 1)
recvLoginMsg.bpUserId = Mid$(RecvStr, 377, 3)
recvLoginMsg.payrollBranch = Mid$(RecvStr, 380, 1)
recvLoginMsg.accOpenCardPrintAllowed = Mid$(RecvStr, 381, 1)
ParseLoginMessage = recvLoginMsg.status
End Function
Public Function formatDate(tDate As String) As String

       formatDate = Mid$(tDate, 7, 2) & "/" & Mid$(tDate, 5, 2) & "/" & Mid$(tDate, 1, 4)

End Function
Public Function formatTime(tTime As String) As String
    
    If Len(RTrim(tTime)) > 0 Then
       formatTime = Mid$(tTime, 1, 2) & ":" & Mid$(tTime, 3, 2) & ":" & Mid$(tTime, 5, 2)
    Else
       formatTime = "           "
    End If

End Function

Public Function ParseMessage() As String
Dim pos As Integer
If Mid$(SendMsg, 7, 2) = "10" Or _
   Mid$(SendMsg, 7, 2) = "15" Or _
   Mid$(SendMsg, 7, 2) = "14" Or _
   Mid$(SendMsg, 7, 2) = "27" Or _
   Mid$(SendMsg, 7, 2) = "28" Or _
   Mid$(SendMsg, 7, 2) = "30" Or _
   Mid$(SendMsg, 7, 2) = "33" Or _
   Mid$(SendMsg, 7, 2) = "31" Or _
   Mid$(SendMsg, 7, 2) = "35" Or _
   Mid$(SendMsg, 7, 2) = "37" Or _
   Mid$(SendMsg, 7, 2) = "39" Or _
   Mid$(SendMsg, 7, 2) = "43" Or _
   Mid$(SendMsg, 7, 2) = "44" Or _
   Mid$(SendMsg, 7, 2) = "47" Or _
   Mid$(SendMsg, 7, 2) = "60" Or _
   Mid$(SendMsg, 7, 2) = "62" Or _
   Mid$(SendMsg, 7, 2) = "64" Or Mid$(SendMsg, 7, 2) = "BE" Or _
   Mid$(SendMsg, 7, 2) = "49" Or Mid$(SendMsg, 7, 2) = "BD" Or _
   Mid$(SendMsg, 7, 2) = "71" Or Mid$(SendMsg, 7, 2) = "75" Or _
   Mid$(SendMsg, 7, 2) = "78" Or Mid$(SendMsg, 7, 2) = "88" Or _
   Mid$(SendMsg, 7, 2) = "92" Or Mid$(SendMsg, 7, 2) = "79" Or _
   Mid$(SendMsg, 7, 2) = "AD" Or Mid$(SendMsg, 7, 2) = "AH" Or _
   Mid$(SendMsg, 7, 2) = "AM" Or Mid$(SendMsg, 7, 2) = "AO" Or _
   Mid$(SendMsg, 7, 2) = "AQ" Or Mid$(SendMsg, 7, 2) = "AV" Or _
   Mid$(SendMsg, 7, 2) = "AW" Or Mid$(SendMsg, 7, 2) = "BA" Then
   recvCustomerMsg.status = Mid$(RecvStr, 1, 3)
   recvCustomerMsg.service = Mid$(RecvStr, 4, 2)
   recvCustomerMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvCustomerMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvCustomerMsg.custNo = Mid$(RecvStr, 106, 7)
   ParseMessage = recvCustomerMsg.status
ElseIf Mid$(SendMsg, 7, 2) = "20" Or _
       Mid$(SendMsg, 7, 2) = "29" Then
   recvCardMsg.status = Mid$(RecvStr, 1, 3)
   recvCardMsg.service = Mid$(RecvStr, 4, 2)
   recvCardMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvCardMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvCardMsg.cardNo = Mid$(RecvStr, 106, 19)
   recvCardMsg.dateTime = Mid$(RecvStr, 125, 14)
ElseIf Mid$(SendMsg, 7, 2) = "11" Then   ' Supervisor Action
   recvSuperActionMsg.status = Mid$(RecvStr, 1, 3)
   recvSuperActionMsg.service = Mid$(RecvStr, 4, 2)
   recvSuperActionMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvSuperActionMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvSuperActionMsg.customerNo = Mid$(RecvStr, 106, 7)
   recvSuperActionMsg.supervisorId = Mid$(RecvStr, 113, 20)
   recvSuperActionMsg.custBranchCode = Mid$(RecvStr, 133, 4)
   recvSuperActionMsg.idNo = RTrim(Mid$(RecvStr, 137, 15))
   recvSuperActionMsg.idType = Mid$(RecvStr, 152, 1)
   recvSuperActionMsg.idIssuedAt = RTrim(Mid$(RecvStr, 153, 20))
   recvSuperActionMsg.idDateType = Mid$(RecvStr, 173, 1)
   recvSuperActionMsg.idIssueDateH = RTrim(Mid$(RecvStr, 174, 8))
   recvSuperActionMsg.idIssueDateG = RTrim(Mid$(RecvStr, 182, 8))
   recvSuperActionMsg.idExpiryDateH = RTrim(Mid$(RecvStr, 190, 8))
   recvSuperActionMsg.idExpiryDateG = RTrim(Mid$(RecvStr, 198, 8))
   recvSuperActionMsg.preferredLang = Mid$(RecvStr, 206, 1)
   recvSuperActionMsg.nationality = Mid$(RecvStr, 207, 20)
   recvSuperActionMsg.titleCode = Mid$(RecvStr, 227, 2)
   recvSuperActionMsg.dobDateType = Mid$(RecvStr, 229, 1)
   recvSuperActionMsg.dobDateH = RTrim(Mid$(RecvStr, 230, 8))
   recvSuperActionMsg.dobDateG = RTrim(Mid$(RecvStr, 238, 8))
   recvSuperActionMsg.sexCode = Mid$(RecvStr, 246, 1)
   recvSuperActionMsg.vipCode = Mid$(RecvStr, 247, 1)
   recvSuperActionMsg.maritalStatus = Mid$(RecvStr, 248, 1)
   recvSuperActionMsg.noOfDependents = RTrim(Mid$(RecvStr, 249, 2))
   recvSuperActionMsg.residentStatus = Mid$(RecvStr, 251, 1)
   recvSuperActionMsg.businessType = RTrim(Mid$(RecvStr, 252, 4))
   recvSuperActionMsg.crNo = RTrim(Mid$(RecvStr, 256, 15))
   recvSuperActionMsg.crIssuedAt = RTrim(Mid$(RecvStr, 271, 20))
   recvSuperActionMsg.crIssuedDateType = Mid$(RecvStr, 291, 1)
   recvSuperActionMsg.crIssueDateH = RTrim(Mid$(RecvStr, 292, 8))
   recvSuperActionMsg.crIssueDateG = RTrim(Mid$(RecvStr, 300, 8))
   recvSuperActionMsg.aOrgName1 = RTrim(Mid$(RecvStr, 308, 30))
   recvSuperActionMsg.aOrgName2 = RTrim(Mid$(RecvStr, 338, 30))
   recvSuperActionMsg.aOrgShortName = RTrim(Mid$(RecvStr, 368, 30))
   recvSuperActionMsg.eOrgName1 = RTrim(Mid$(RecvStr, 398, 30))
   recvSuperActionMsg.eOrgName2 = RTrim(Mid$(RecvStr, 428, 30))
   recvSuperActionMsg.eOrgShortName = RTrim(Mid$(RecvStr, 458, 30))
   recvSuperActionMsg.aFirstName = RTrim(Mid$(RecvStr, 488, 15))
   recvSuperActionMsg.a2ndName = RTrim(Mid$(RecvStr, 503, 15))
   recvSuperActionMsg.a3rdName = RTrim(Mid$(RecvStr, 518, 15))
   recvSuperActionMsg.aLastName = RTrim(Mid$(RecvStr, 533, 15))
   recvSuperActionMsg.aShortName = RTrim(Mid$(RecvStr, 548, 30))
   recvSuperActionMsg.eFirstName = RTrim(Mid$(RecvStr, 578, 15))
   recvSuperActionMsg.e2ndName = RTrim(Mid$(RecvStr, 593, 15))
   recvSuperActionMsg.e3rdName = RTrim(Mid$(RecvStr, 608, 15))
   recvSuperActionMsg.eLastName = RTrim(Mid$(RecvStr, 623, 15))
   recvSuperActionMsg.eShortName = RTrim(Mid$(RecvStr, 638, 30))
   recvSuperActionMsg.address1 = RTrim(Mid$(RecvStr, 668, 30))
   recvSuperActionMsg.address2 = RTrim(Mid$(RecvStr, 698, 30))
   recvSuperActionMsg.poBox = RTrim(Mid$(RecvStr, 728, 10))
   recvSuperActionMsg.cityName = RTrim(Mid$(RecvStr, 738, 20))
   recvSuperActionMsg.zipCode = RTrim(Mid$(RecvStr, 758, 10))
   recvSuperActionMsg.country = RTrim(Mid$(RecvStr, 768, 20))
   recvSuperActionMsg.telOffAreaCode = RTrim(Mid$(RecvStr, 788, 4))
   recvSuperActionMsg.telOffNo = RTrim(Mid$(RecvStr, 792, 10))
   recvSuperActionMsg.telOffExt = RTrim(Mid$(RecvStr, 802, 4))
   recvSuperActionMsg.telHomeAreaCode = RTrim(Mid$(RecvStr, 806, 4))
   recvSuperActionMsg.telHomeNo = RTrim(Mid$(RecvStr, 810, 10))
   recvSuperActionMsg.telHomeExt = RTrim(Mid$(RecvStr, 820, 4))
   recvSuperActionMsg.faxAreaCode = RTrim(Mid$(RecvStr, 824, 4))
   recvSuperActionMsg.faxNo = RTrim(Mid$(RecvStr, 828, 10))
   recvSuperActionMsg.faxExt = RTrim(Mid$(RecvStr, 838, 4))
   recvSuperActionMsg.mobileNo = RTrim(Mid$(RecvStr, 842, 10))
   recvSuperActionMsg.pagerNo = RTrim(Mid$(RecvStr, 852, 10))
   recvSuperActionMsg.eMail = RTrim(Mid$(RecvStr, 862, 30))
   recvSuperActionMsg.educationCode = Mid$(RecvStr, 892, 2)
   recvSuperActionMsg.professionCode = Mid$(RecvStr, 894, 2)
   recvSuperActionMsg.positionCode = Mid$(RecvStr, 896, 2)
   recvSuperActionMsg.monthlyIncome = Mid$(RecvStr, 898, 2)
   recvSuperActionMsg.ownerShip = Mid$(RecvStr, 900, 10)
   recvSuperActionMsg.segmentation = Mid$(RecvStr, 910, 1)
   recvSuperActionMsg.employerName = RTrim(Mid$(RecvStr, 911, 30))
   recvSuperActionMsg.department = RTrim(Mid$(RecvStr, 941, 20))
   recvSuperActionMsg.employerPoBox = RTrim(Mid$(RecvStr, 961, 10))
   recvSuperActionMsg.employerCity = RTrim(Mid$(RecvStr, 971, 20))
   recvSuperActionMsg.employerZipCode = RTrim(Mid$(RecvStr, 991, 10))
   recvSuperActionMsg.documents = Mid$(RecvStr, 1001, 15)
   recvSuperActionMsg.documentOther = RTrim(Mid$(RecvStr, 1016, 50))
   recvSuperActionMsg.singleJointAcc = Mid$(RecvStr, 1066, 1)
   recvSuperActionMsg.packagedAcc = Mid$(RecvStr, 1067, 1)
   recvSuperActionMsg.noOfJointAcc = Mid$(RecvStr, 1068, 2)
   recvSuperActionMsg.jointAccNameOnCheck = RTrim(Mid$(RecvStr, 1070, 60))
   recvSuperActionMsg.jointAccNameOnReports = RTrim(Mid$(RecvStr, 1130, 30))
   recvSuperActionMsg.signatureNature = Mid$(RecvStr, 1160, 1)
   recvSuperActionMsg.electronCardRequired = Mid$(RecvStr, 1161, 1)
   recvSuperActionMsg.electronCardName = RTrim(Mid$(RecvStr, 1162, 26))
   recvSuperActionMsg.elctronSuppRequired = Mid$(RecvStr, 1188, 1)
   recvSuperActionMsg.electronSuppName = RTrim(Mid$(RecvStr, 1189, 26))
   recvSuperActionMsg.electronIntlRequired = Mid$(RecvStr, 1215, 1)
   recvSuperActionMsg.electronIntlName = RTrim(Mid$(RecvStr, 1216, 26))
   recvSuperActionMsg.electronIntlSuppRequired = Mid$(RecvStr, 1242, 1)
   recvSuperActionMsg.electronIntlSuppName = RTrim(Mid$(RecvStr, 1243, 26))
   recvSuperActionMsg.deliveryToBranchOrPO = Mid$(RecvStr, 1269, 1)
   recvSuperActionMsg.deliveryAddress1 = RTrim(Mid$(RecvStr, 1270, 30))
   recvSuperActionMsg.deliveryAddress2 = RTrim(Mid$(RecvStr, 1300, 30))
   recvSuperActionMsg.deliveryPoBox = RTrim(Mid$(RecvStr, 1330, 10))
   recvSuperActionMsg.deliveryCity = RTrim(Mid$(RecvStr, 1340, 20))
   recvSuperActionMsg.deliveryZip = RTrim(Mid$(RecvStr, 1360, 10))
   recvSuperActionMsg.supervisorComments = RTrim(Mid$(RecvStr, 1370, 200))
   recvSuperActionMsg.custType = Mid$(RecvStr, 1570, 1)
   recvSuperActionMsg.currentAccInfo = Mid$(RecvStr, 1571, 11)
   recvSuperActionMsg.savingsAccInfo = Mid$(RecvStr, 1582, 11)
   recvSuperActionMsg.otherAccInfo = Mid$(RecvStr, 1593, 11)
   recvSuperActionMsg.foundInAList = Mid$(RecvStr, 1604, 1)
   recvSuperActionMsg.foundInBList = Mid$(RecvStr, 1605, 1)
   recvSuperActionMsg.foundInCList = Mid$(RecvStr, 1606, 1)
   recvSuperActionMsg.reportedBank = Mid$(RecvStr, 1607, 4)
   recvSuperActionMsg.nameInABCList = Mid$(RecvStr, 1611, 30)
   recvSuperActionMsg.exisingCustomer = Mid$(RecvStr, 1641, 1)
   recvSuperActionMsg.existCustNo = Mid$(RecvStr, 1642, 7)
   recvSuperActionMsg.existCustName = Mid$(RecvStr, 1649, 30)
   recvSuperActionMsg.newOrUpdate = Mid$(RecvStr, 1679, 1)
   recvSuperActionMsg.internetBankAcc = Mid$(RecvStr, 1680, 1)
   recvSuperActionMsg.custAdviceFlag = Mid$(RecvStr, 1681, 1)
   recvSuperActionMsg.altBranchCode = Mid$(RecvStr, 1682, 4)
   recvSuperActionMsg.orgAlphaSearchCode = RTrim(Mid$(RecvStr, 1686, 6))
   recvSuperActionMsg.restrictedBranchFlag = Mid$(RecvStr, 1692, 1) ' added after giving the source to MISYS
   recvSuperActionMsg.updatedForSama = Mid$(RecvStr, 1693, 1)       ' added after giving the source to MISYS
   recvSuperActionMsg.relationshipManager = Mid$(RecvStr, 1694, 25)
   recvSuperActionMsg.generalMemo = Mid$(RecvStr, 1719, 25)
   ParseMessage = recvSuperActionMsg.status
ElseIf Mid$(SendMsg, 7, 2) = "18" Then   ' Joint account info
   pos = 1
   recvJointInfo.status = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvJointInfo.service = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvJointInfo.aRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvJointInfo.eRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvJointInfo.custNo = Mid$(RecvStr, pos, 7)
   pos = pos + 7
   recvJointInfo.jointCustomerNo = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   pos = pos + 7
   ' in between one filler1 is there of length 7
   recvJointInfo.newOrUpdate = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.supervisorId = Mid$(RecvStr, pos, 20)
   pos = pos + 20
   recvJointInfo.idNo = Mid$(RecvStr, pos, 15)
   pos = pos + 15
   recvJointInfo.idType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.idIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
   pos = pos + 20
   recvJointInfo.idDateType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.idIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvJointInfo.idIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvJointInfo.idExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvJointInfo.idExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvJointInfo.preferredLang = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.nationality = Mid$(RecvStr, pos, 20)
   pos = pos + 20
   recvJointInfo.titleCode = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvJointInfo.dobDateType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.dobDateH = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvJointInfo.dobDateG = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvJointInfo.sexCode = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.vipCode = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.maritalStatus = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.noOfDependents = RTrim(Mid$(RecvStr, pos, 2))
   pos = pos + 2
   recvJointInfo.residentStatus = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.businessType = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvJointInfo.aFirstName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvJointInfo.a2ndName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvJointInfo.a3rdName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvJointInfo.aLastName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvJointInfo.aShortName = RTrim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   recvJointInfo.eFirstName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvJointInfo.e2ndName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvJointInfo.e3rdName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvJointInfo.eLastName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvJointInfo.eShortName = RTrim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   recvJointInfo.address1 = RTrim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   recvJointInfo.address2 = RTrim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   recvJointInfo.poBox = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.cityName = RTrim(Mid$(RecvStr, pos, 20))
   pos = pos + 20
   recvJointInfo.zipCode = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.country = Mid$(RecvStr, pos, 20)
   pos = pos + 20
   recvJointInfo.telOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
   pos = pos + 4
   recvJointInfo.telOffNo = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.telOffExt = RTrim(Mid$(RecvStr, pos, 4))
   pos = pos + 4
   recvJointInfo.telHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
   pos = pos + 4
   recvJointInfo.telHomeNo = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.telHomeExt = RTrim(Mid$(RecvStr, pos, 4))
   pos = pos + 4
   recvJointInfo.faxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
   pos = pos + 4
   recvJointInfo.faxNo = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.faxExt = RTrim(Mid$(RecvStr, pos, 4))
   pos = pos + 4
   recvJointInfo.mobileNo = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.pagerNo = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.eMail = RTrim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   recvJointInfo.educationCode = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvJointInfo.professionCode = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvJointInfo.positionCode = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvJointInfo.monthlyIncome = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvJointInfo.ownerShip = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvJointInfo.segmentation = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.employerName = RTrim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   recvJointInfo.department = RTrim(Mid$(RecvStr, pos, 20))
   pos = pos + 20
   recvJointInfo.employerPoBox = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.employerCity = RTrim(Mid$(RecvStr, pos, 20))
   pos = pos + 20
   recvJointInfo.employerZipCode = RTrim(Mid$(RecvStr, pos, 10))
   pos = pos + 10
   recvJointInfo.activeStatus = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.addressType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvJointInfo.custOpenSource = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   ParseMessage = recvJointInfo.status
ElseIf Mid$(SendMsg, 7, 2) = "19" Then
   recvSuperDecisionMsg.status = Mid$(RecvStr, 1, 3)
   recvSuperDecisionMsg.service = Mid$(RecvStr, 4, 2)
   recvSuperDecisionMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvSuperDecisionMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvSuperDecisionMsg.appRejectFlag = Mid$(RecvStr, 106, 1)
   recvSuperDecisionMsg.custNo = Mid$(RecvStr, 107, 7)
   recvSuperDecisionMsg.nameChanged = Mid$(RecvStr, 114, 1)
   recvSuperDecisionMsg.addressChanged = Mid$(RecvStr, 115, 1)
   recvSuperDecisionMsg.tpinSelected = Mid$(RecvStr, 116, 1)
   recvSuperDecisionMsg.filler = Mid$(RecvStr, 117, 9)
   recvSuperDecisionMsg.primaryCard.cardNo = Mid$(RecvStr, 126, 19)
   recvSuperDecisionMsg.primaryCard.nameOnTheCard = Mid$(RecvStr, 145, 26)
   recvSuperDecisionMsg.primaryCard.custBranchCode = Mid$(RecvStr, 171, 4)
   recvSuperDecisionMsg.primaryCard.cardExpiryDate = Mid$(RecvStr, 175, 6)
   recvSuperDecisionMsg.primaryCard.trk1 = Mid$(RecvStr, 181, 75)
   recvSuperDecisionMsg.primaryCard.trk2 = Mid$(RecvStr, 256, 37)
   recvSuperDecisionMsg.primaryCard.branchPinSelect = Mid$(RecvStr, 293, 1)
   
   recvSuperDecisionMsg.suppCard.cardNo = Mid$(RecvStr, 294, 19)
   recvSuperDecisionMsg.suppCard.nameOnTheCard = Mid$(RecvStr, 313, 26)
   recvSuperDecisionMsg.suppCard.custBranchCode = Mid$(RecvStr, 339, 4)
   recvSuperDecisionMsg.suppCard.cardExpiryDate = Mid$(RecvStr, 343, 6)
   recvSuperDecisionMsg.suppCard.trk1 = Mid$(RecvStr, 349, 75)
   recvSuperDecisionMsg.suppCard.trk2 = Mid$(RecvStr, 424, 37)
   recvSuperDecisionMsg.suppCard.branchPinSelect = Mid$(RecvStr, 461, 1)
   recvSuperDecisionMsg.ibanAccNo = Mid$(RecvStr, 462, 24)
   ParseMessage = recvSuperDecisionMsg.status
ElseIf Mid$(SendMsg, 7, 2) = "32" Then
   recvCardApprovalMsg.status = Mid$(RecvStr, 1, 3)
   recvCardApprovalMsg.service = Mid$(RecvStr, 4, 2)
   recvCardApprovalMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvCardApprovalMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvCardApprovalMsg.appRejectFlag = Mid$(RecvStr, 106, 1)
   recvCardApprovalMsg.custNo = Mid$(RecvStr, 107, 7)
   recvCardApprovalMsg.cardNo = Mid$(RecvStr, 114, 19)
   recvCardApprovalMsg.nameOnTheCard = Mid$(RecvStr, 133, 26)
   recvCardApprovalMsg.cardExpiryDate = Mid$(RecvStr, 159, 6)
   recvCardApprovalMsg.custBranchCode = Mid$(RecvStr, 165, 4)
   recvCardApprovalMsg.pinOffSet = Mid$(RecvStr, 169, 4)
   recvCardApprovalMsg.track1 = Mid$(RecvStr, 173, 75)
   recvCardApprovalMsg.track2 = Mid$(RecvStr, 248, 37)
   recvCardApprovalMsg.branchPinSelect = Mid$(RecvStr, 285, 1)
   recvCardApprovalMsg.branchCardPrdn = Mid$(RecvStr, 286, 1)
   ParseMessage = recvCardApprovalMsg.status
ElseIf Mid$(SendMsg, 7, 2) = "34" Then
   recvAccApprovalMsg.status = Mid$(RecvStr, 1, 3)
   recvAccApprovalMsg.service = Mid$(RecvStr, 4, 2)
   recvAccApprovalMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvAccApprovalMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvAccApprovalMsg.appRejectFlag = Mid$(RecvStr, 106, 1)
   recvAccApprovalMsg.accNo = Mid$(RecvStr, 107, 14) ' account number is 19 digit in the response message packet
   recvAccApprovalMsg.ibanAccNo = Mid$(RecvStr, 126, 24)
   ParseMessage = recvAccApprovalMsg.status
ElseIf Mid$(SendMsg, 7, 2) = "52" Then
   recvStdOrdApprovalMsg.status = Mid$(RecvStr, 1, 3)
   recvStdOrdApprovalMsg.service = Mid$(RecvStr, 4, 2)
   recvStdOrdApprovalMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvStdOrdApprovalMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvStdOrdApprovalMsg.appRejectFlag = Mid$(RecvStr, 106, 1)
   recvStdOrdApprovalMsg.sodNo = Mid$(RecvStr, 107, 6)
   ParseMessage = recvStdOrdApprovalMsg.status
ElseIf Mid$(SendMsg, 7, 2) = "54" Then
   recvStopChqApprovalMsg.status = Mid$(RecvStr, 1, 3)
   recvStopChqApprovalMsg.service = Mid$(RecvStr, 4, 2)
   recvStopChqApprovalMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvStopChqApprovalMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvStopChqApprovalMsg.appRejectFlag = Mid$(RecvStr, 106, 1)
   recvStopChqApprovalMsg.chequeNo = Mid$(RecvStr, 107, 10)
   ParseMessage = recvStopChqApprovalMsg.status
ElseIf Mid$(SendMsg, 7, 2) = "65" Then
   ParseMessage = "000"  ' success
ElseIf Mid$(SendMsg, 7, 2) = "  " Then
   recvMsg.status = Mid$(RecvStr, 1, 3)
   recvMsg.remarks = Mid$(RecvStr, 4, 30)
   ParseMessage = recvMsg.status
Else
   recvMsg.status = Mid$(RecvStr, 1, 3)
   recvMsg.remarks = Mid$(RecvStr, 4, 30)
   recvMsg.bmStatus = Mid$(RecvStr, 34, 1)
   recvMsg.service = Mid$(RecvStr, 35, 2)
   recvMsg.keyValue = Mid$(RecvStr, 37, 6)
   recvMsg.action = Mid$(RecvStr, 43, 1)
   recvMsg.arabicName = Mid$(RecvStr, 44, 30)
   recvMsg.englishName = Mid$(RecvStr, 74, 30)
   recvMsg.OtherDetails = Mid$(RecvStr, 104)
   ParseMessage = recvMsg.status
End If
End Function

Public Sub formatNewCustomerRequest()

    Dim mQry As String
    Dim tmpStr As String
 
    custInfo.msgLen = Space(6) ' to be calculated
    custInfo.service = "10"  ' 10 is for New customer creation
    custInfo.userId = gUserId
    
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       custInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       custInfo.creationOrUpdate = "U"
       custInfo.supervisorComments = recvSuperActionMsg.supervisorComments
       custInfo.supervisorId = Left(recvSuperActionMsg.supervisorId, 10)
    Else
       custInfo.dateTime = gDateTime
       custInfo.creationOrUpdate = "C"
       custInfo.supervisorId = Space(10)
       custInfo.supervisorComments = Space(200)
    End If
    If updateAction Or _
       (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
       custInfo.NewOrUpdateFlag = "U"
    Else
       custInfo.NewOrUpdateFlag = "N"
    End If
    
    custInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
    custInfo.branchCode = gBranchCode
    custInfo.customerNo = frmCustomer.txtCustomerNo
    'custInfo.custBranchCode = frmCustomer.txtBranchCode
    custInfo.custBranchCode = Mid$(frmCustomer.cmbBranchCode, 1, 4)
    If Len(RTrim(Mid$(frmCustomer.cmbAltBrCode, 1, 4))) = 0 Then
       custInfo.altBranchCode = "0000"
    Else
       custInfo.altBranchCode = Mid$(frmCustomer.cmbAltBrCode, 1, 4)
    End If
    custInfo.custType = Mid$(frmCustomer.cmbCustomerType, 1, 1)
    custInfo.idNo = frmCustomer.txtId
    custInfo.idType = frmCustomer.cmbIdType.text
    If frmCustomer.optIdDateHijri Then
       custInfo.idDateType = "0"
       custInfo.idExpiryDateH = frmCustomer.txtIdExpiryYear + frmCustomer.cmbIdExpiryMonth + frmCustomer.cmbIdExpiryDate
       custInfo.idIssueDateH = frmCustomer.txtIdIssueYear + frmCustomer.cmbIdIssueMonth.text + frmCustomer.cmbIdIssueDate
       custInfo.idIssueDateG = Space(8)
       custInfo.idExpiryDateG = Space(8)
    Else
       custInfo.idDateType = "1"
       custInfo.idExpiryDateG = frmCustomer.txtIdExpiryYear + frmCustomer.cmbIdExpiryMonth + frmCustomer.cmbIdExpiryDate
       custInfo.idIssueDateG = frmCustomer.txtIdIssueYear + frmCustomer.cmbIdIssueMonth.text + frmCustomer.cmbIdIssueDate
       custInfo.idIssueDateH = Space(8)
       custInfo.idExpiryDateH = Space(8)
    End If
    custInfo.idIssuedAt = frmCustomer.cmbIdIssuedAt.text
    If frmCustomer.optLangArabic Then
       custInfo.langPref = "0"
    Else
       custInfo.langPref = "1"
    End If
    custInfo.nationality = Left$(frmCustomer.cmbNationality, 3) + Space(17)
    custInfo.titleCode = Left$(frmCustomer.cmbTitle.text, 2)
    custInfo.aFirstName = frmCustomer.txtArabFirstName
    custInfo.a2ndName = frmCustomer.txtArabic2ndName
    custInfo.a3rdName = frmCustomer.txtArabic3rdName
    custInfo.aLastName = frmCustomer.txtArabLastName
    custInfo.aShortName = frmCustomer.txtArabShortName
    custInfo.eFirstName = frmCustomer.txtEngFirstName
    custInfo.e2ndName = frmCustomer.txtEnglish2ndName
    custInfo.e3rdName = frmCustomer.txtEnglish3rdName
    custInfo.eLastName = frmCustomer.txtEngLastName
    custInfo.eShortName = frmCustomer.txtEngShortName
    If frmCustomer.optDOBGreg Then
       custInfo.dobDateG = frmCustomer.txtDobYear + frmCustomer.cmbDobMonth + frmCustomer.cmbDobDate
       custInfo.dobDateType = "1"
       custInfo.dobDateH = Space(8)
    Else
       custInfo.dobDateH = frmCustomer.txtDobYear + frmCustomer.cmbDobMonth + frmCustomer.cmbDobDate
       custInfo.dobDateType = "0"
       custInfo.dobDateG = Space(8)
    End If
    If frmCustomer.optGenderMale Then
       custInfo.sexCode = "0"
    Else
       custInfo.sexCode = "1"
    End If
    If frmCustomer.optVipYes Then
        custInfo.vipCode = "1"
    Else
        custInfo.vipCode = "0"
    End If
    If frmCustomer.optMarried Then
       custInfo.maritalStatus = "0"    ' Married
    ElseIf frmCustomer.OptSingle Then
       custInfo.maritalStatus = "1"    ' Single
    Else
       custInfo.maritalStatus = "2"    ' Others
    End If
    custInfo.noOfDependents = frmCustomer.txtDependents
    If frmCustomer.optResident Then
       custInfo.residentStatus = "0"
    Else
       custInfo.residentStatus = "1"
    End If
    custInfo.businessType = Mid$(frmCustomer.cmbBusinessType.text, 1, 3)
    custInfo.crNo = frmCustomer.txtCRnumber
    custInfo.crIssuedAt = frmCustomer.cmbCRIssuedCity.text
    If frmCustomer.optCRIssueDateGreg = True Then
       custInfo.crIssueDateG = frmCustomer.txtCrIssueYear + frmCustomer.cmbCrIssueMonth + frmCustomer.cmbCrIssuedate
       custInfo.crIssuedDateType = "1"
       custInfo.crIssueDateH = Space(8)
    Else
       custInfo.crIssueDateH = frmCustomer.txtCrIssueYear + frmCustomer.cmbCrIssueMonth + frmCustomer.cmbCrIssuedate
       custInfo.crIssuedDateType = "0"
       custInfo.crIssueDateG = Space(8)
    End If
    custInfo.aOrgName1 = frmCustomer.txtOrgName1Arabic
    custInfo.aOrgName2 = frmCustomer.txtOrgName2Arabic
    custInfo.aOrgShortName = frmCustomer.txtOrgArabicShortName
    custInfo.eOrgName1 = frmCustomer.txtOrgName1English
    custInfo.eOrgName2 = frmCustomer.txtOrgName2English
    custInfo.eOrgShortName = frmCustomer.txtOrgEnglishShortName
    custInfo.address1 = frmCustomer.txtAddress1
    custInfo.address2 = frmCustomer.txtAddress2
    custInfo.poBox = frmCustomer.txtPOBox
    If UserLang = ENGLISH And _
       custInfo.langPref = "0" Then ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" + _
                             frmCustomer.cmbCity.text + "'")
       If rs.recordCount > 0 Then
          custInfo.cityName = rs(0)
       Else
          custInfo.cityName = frmCustomer.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       custInfo.langPref = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" + _
                            frmCustomer.cmbCity.text + "'")
       If rs.recordCount > 0 Then
          custInfo.cityName = rs(0)
       Else
          custInfo.cityName = frmCustomer.cmbCity.text
       End If
    Else
        custInfo.cityName = frmCustomer.cmbCity.text
    End If
    custInfo.zipCode = frmCustomer.txtPinCode
    custInfo.country = Left$(frmCustomer.cmbCountry.text, 3) + Space(17)
    custInfo.telOffAreaCode = frmCustomer.txtOffPhoneCityCode
    custInfo.telOffNo = frmCustomer.txtOffPhoneNo
    custInfo.telOffExt = frmCustomer.txtOffPhoneExt
    custInfo.telHomeAreaCode = frmCustomer.txtResPhoneCityCode
    custInfo.telHomeNo = frmCustomer.txtResPhoneNo
    custInfo.telHomeExt = frmCustomer.txtResPhoneExt
    custInfo.faxAreaCode = frmCustomer.txtFaxCityCode
    custInfo.faxNo = frmCustomer.txtFaxNo
    custInfo.faxExt = frmCustomer.txtFaxExt
    If Len(RTrim(frmCustomer.txtMobileNo)) <> 0 Then
       custInfo.mobileNo = frmCustomer.txtMobileAreaCode + frmCustomer.txtMobileNo
    Else
       custInfo.mobileNo = Space(10)
    End If
    custInfo.pagerNo = frmCustomer.txtPagerNo
    custInfo.eMail = frmCustomer.txtEmailAddress
    custInfo.educationCode = Mid$(frmCustomer2.cmbEducation.text, 3, 2)
    custInfo.professionCode = Mid$(frmCustomer2.cmbProfession.text, 3, 2)
    custInfo.positionCode = Mid$(frmCustomer2.cmbPosition.text, 3, 2)
    custInfo.monthlyIncome = Mid$(frmCustomer2.cmbMonthlyIncome.text, 3, 2)
    custInfo.segmentation = Mid$(frmCustomer2.cmbSegmentation, 1, 1)
    custInfo.ownerShip = "0000000000"
    If frmCustomer2.chkRentedHouse.Value = 1 Then
       Mid$(custInfo.ownerShip, 1, 1) = "1"
    End If
    If frmCustomer2.chkOwnHouse.Value = 1 Then
       Mid$(custInfo.ownerShip, 2, 1) = "1"
    End If
    If frmCustomer2.chkCompanyAcc.Value = 1 Then
       Mid$(custInfo.ownerShip, 3, 1) = "1"
    End If
    If frmCustomer2.chkRentedCar.Value = 1 Then
       Mid$(custInfo.ownerShip, 4, 1) = "1"
    End If
    If frmCustomer2.chkOwnCar.Value = 1 Then
       Mid$(custInfo.ownerShip, 5, 1) = "1"
    End If
    If frmCustomer2.chkCompanyTransport.Value = 1 Then
       Mid$(custInfo.ownerShip, 6, 1) = "1"
    End If
     
    custInfo.employerName = frmCustomer2.txtEmployerName
    custInfo.department = frmCustomer2.txtDepartment
    custInfo.employerPoBox = frmCustomer2.txtEmployerPOBox
    custInfo.employerCity = frmCustomer2.txtEmployerCity
    custInfo.employerZipCode = frmCustomer2.txtEmployerZipcode
    custInfo.documents = "000000000000000"
    If frmCustomer2.chkDocSignature.Value = 1 Then
       Mid$(custInfo.documents, 1, 1) = "1"
    End If
    If frmCustomer2.chkdocIqamacopy.Value = 1 Then
       Mid$(custInfo.documents, 2, 1) = "1"
    End If
    If frmCustomer2.chkDocregistrationCert.Value = 1 Then
       Mid$(custInfo.documents, 3, 1) = "1"
    End If
    If frmCustomer2.chkEstablishContract.Value = 1 Then
       Mid$(custInfo.documents, 4, 1) = "1"
    End If
    If frmCustomer2.chkDocPowerOfAttorney.Value = 1 Then
       Mid$(custInfo.documents, 5, 1) = "1"
    End If
    If frmCustomer2.chkSalaryTransfer.Value = 1 Then
       Mid$(custInfo.documents, 6, 1) = "1"
    End If
    If frmCustomer2.chkJointAcAgreement.Value = 1 Then
       Mid$(custInfo.documents, 7, 1) = "1"
    End If
    
    custInfo.documentOther = frmCustomer2.txtDocOthers
'    If frmCustomer2.optNone Then
'       custInfo.packagedAcc = "0"
'    ElseIf frmCustomer2.optPackageAc Then
'       custInfo.packagedAcc = "1"
'    ElseIf frmCustomer2.optGold Then
'       custInfo.packagedAcc = "2"
'    ElseIf frmCustomer2.optPlatinum Then
'       custInfo.packagedAcc = "3"
'    End If

    custInfo.packagedAcc = Mid$(frmCustomer2.cmbPackageAcc.text, 1, 1)
    If Len(RTrim(custInfo.packagedAcc)) = 0 Then
       custInfo.packagedAcc = "0"
    End If
    
    If frmCustomer2.optInternetYes Then
       custInfo.internetBankAcc = "1"
    Else
       custInfo.internetBankAcc = "0"
    End If
    
    If frmCustomer2.optCustAdviceYes Then
       custInfo.custAdviceFlag = "1"
    Else
       custInfo.custAdviceFlag = "0"
    End If
    
    If frmCustomer2.OptSingle Then
       custInfo.singleJointAcc = "0"
    Else
       custInfo.singleJointAcc = "1"
    End If
    If frmCustomer2.optSignSingle Then
       custInfo.signatureNature = "0"
    Else
       custInfo.signatureNature = "1"
    End If
    If tellerAction Then
       custInfo.noOfJointAcc = recvSuperActionMsg.noOfJointAcc
    Else
       custInfo.noOfJointAcc = Format(noOfJoint, "00")
    End If
    custInfo.jointAccNameOnCheck = Format(frmJointAccName.txtJointAccNameOnCheck, "!" + String(30, "@")) + Format(frmJointAccName.txtJointAccNameOnCheck1, "!" + String(30, "@"))
    custInfo.jointAccNameOnReports = Format(frmJointAccName.txtJointAccNameOnReports, "!" + String(30, "@"))
    
'    If frmCustomer2.optPrimaryElectronCardYes Then
'       custInfo.electronCardRequired = "1"
'    Else
'       custInfo.electronCardRequired = "0"
'    End If
'    custInfo.electronCardName = frmCustomer2.txtPrimaryElectronCardName
'    If frmCustomer2.optSecondaryElectronCardYes Then
'       custInfo.elctronSuppRequired = "1"
'    Else
'       custInfo.elctronSuppRequired = "0"
'    End If
'    custInfo.electronSuppName = frmCustomer2.txtSecondaryElectronCardName

    custInfo.electronCardRequired = "0"
    custInfo.electronCardName = Space(26)
    custInfo.elctronSuppRequired = "0"
    custInfo.electronSuppName = Space(26)
    
    If frmCustomer2.optPrimaryElectronIntlCardYes Then
       custInfo.electronIntlRequired = "1"
    Else
       custInfo.electronIntlRequired = "0"
    End If
    custInfo.electronIntlName = frmCustomer2.txtPrimaryElectronIntlCardName
    If frmCustomer2.optSecondaryElectronIntlCardYes Then
       custInfo.electronIntlSuppRequired = "1"
    Else
       custInfo.electronIntlSuppRequired = "0"
    End If
    custInfo.electronIntlSuppName = frmCustomer2.txtSecondaryElectronIntlCardName
    If frmCustomer2.optCardDeliveredToBranch Then
       custInfo.deliveryToBranchOrPO = "C"
    ElseIf frmCustomer2.optCardDeliveredToReqBranch Then
       custInfo.deliveryToBranchOrPO = "R"
    Else
       custInfo.deliveryToBranchOrPO = "P"
    End If
    If custInfo.updateCardAddressReqd <> "1" Then
        custInfo.deliveryAddress1 = frmCustomer2.txtDeliveryAddr1
        If frmCustomer2.optCurrentAcYes.Value Then
           custInfo.deliveryAddress2 = frmCustomer2.txtDeliveryAddr2
        Else
            custInfo.deliveryAddress2 = Space(30)
        End If
        custInfo.deliveryPoBox = frmCustomer2.txtDeliveryPOBox
        custInfo.deliveryCity = frmCustomer2.cmbDeliveryCity.text
        custInfo.deliveryZip = frmCustomer2.txtDeliveryZipcode
    End If
    If custInfo.NewOrUpdateFlag = "N" Then
       custInfo.updateCardAddressReqd = "0"
    End If
    custInfo.phaseFlag = "2"
    If custInfo.custType <> "0" Then
       custInfo.orgAlphaSearch = frmCustomer.txtOrgAlphaSearch
    Else
       custInfo.orgAlphaSearch = Space(6)
    End If
    If frmCustomer2.optSamaUpdYes = True Then
       custInfo.updatedForSama = "1"
    Else
       custInfo.updatedForSama = "0"
    End If
    If Len(RTrim(frmCustomer2.txtRelationshipManager)) = 0 Then
       custInfo.relationshipManager = Space(25)
    Else
       custInfo.relationshipManager = frmCustomer2.txtRelationshipManager
    End If
    If Len(RTrim(frmCustomer2.txtGeneralMemo)) = 0 Then
       custInfo.generalMemo = Space(25)
    Else
       custInfo.generalMemo = frmCustomer2.txtGeneralMemo
    End If
    
End Sub
Public Sub formatAcctInfo(accType As String, accCurrency As String, accStatus As String, stmtFreq As String, chequeBook As String, droppedAcc As String, custNo As String)
    acctInfo.msgLen = Space(6)
    acctInfo.service = "14"
    acctInfo.branchCode = gBranchCode
    acctInfo.userId = gUserId
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       acctInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       acctInfo.supervisorId = Left(recvSuperActionMsg.supervisorId, 10)
    Else
       acctInfo.dateTime = gDateTime
       acctInfo.supervisorId = Space(10)
    End If
    acctInfo.newOrUpdate = "N"
    acctInfo.acctNo = accCurrency + accType + Format(custNo, "!@@@@@@@") + "00"
    acctInfo.accStatus = accStatus
    acctInfo.statementFreq = stmtFreq
    acctInfo.chequeBook = chequeBook
    acctInfo.droppedAcc = droppedAcc
End Sub
Public Sub formatJointAccInfo()
    
    jointInfo.msgLen = Space(6) 'to be calculated
    jointInfo.service = "15"
    If phoneCustOpenAction Then
       If screenSetNo = "1" Or screenSetNo = "A" Then
          jointInfo.branchCode = Left(frmIndividualSaudi.cmbBranchCode, 4)
       ElseIf screenSetNo = "2" Then
          jointInfo.branchCode = Left(frmIndividualOthers.cmbBranchCode, 4)
       End If
    Else
       jointInfo.branchCode = gBranchCode
    End If
    
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 0
       jointInfo.userId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       jointInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       jointInfo.creationOrUpdate = "U"
       If screenSetNo = "1" Or screenSetNo = "A" Then
          jointInfo.supervisorId = Left(recvSaudiIndividualMsg.supervisorId, 10)
       ElseIf screenSetNo = "2" Then
          jointInfo.supervisorId = Left(recvOtherIndividualMsg.supervisorId, 10)
       End If
       'ointInfo.jointCustomerNo = Format(recvJointInfo.jointCustomerNo, "00")
    Else
       jointInfo.userId = gUserId
       jointInfo.dateTime = gDateTime
       jointInfo.creationOrUpdate = "C"
       jointInfo.supervisorId = Space(10)
       'ointInfo.jointCustomerNo = Format(noOfJoint, "00")
    End If
    If screenSetNo = "1" Or screenSetNo = "A" Then  ' individual saudi info
       jointInfo.customerNo = Format(frmIndividualSaudi.txtCustomerNo, "0000000")
    ElseIf screenSetNo = "2" Then ' individual others info
       jointInfo.customerNo = Format(frmIndividualOthers.txtCustomerNo, "0000000")
    End If
    If updateAction Or _
       (tellerAction And recvJointInfo.newOrUpdate = "U") Then
       jointInfo.newOrUpdate = "U"
       'ointInfo.jointCustomerNo = Format(recvJointInfo.jointCustomerNo, "00")
    Else
       jointInfo.newOrUpdate = "N"
    End If
    
    If phoneCustOpenAction Then
       jointInfo.custOpenSource = "P"  ' customer opened through phone
    Else
       jointInfo.custOpenSource = "B"  ' customer opened through Branch
       'If tellerAction And recvJointInfo.custOpenSource = "P" Then
       If tellerAction And activityFlag = "P" Then
          jointInfo.branchCSOId = gUserId
          jointInfo.branchActionDateTime = branchActionDateTime
       Else
          jointInfo.branchCSOId = Space(10)
          jointInfo.branchActionDateTime = Space(14)
       End If
    End If
    
    If jointAddAction Then
       noOfJoint = noOfJoint + 1
       jointInfo.creationOrUpdate = "C"
       If updateAction Then
          jointInfo.newOrUpdate = "N"
       End If
    ElseIf jointUpdateAction Then
       jointInfo.jointCustomerNo = recvJointInfo.jointCustomerNo
       If updateAction Then
          jointInfo.creationOrUpdate = "C"
       Else
          jointInfo.creationOrUpdate = "U"
       End If
    End If
    
    If Not jointUpdateAction Then
       jointInfo.jointCustomerNo = Format(noOfJoint, "00")
    End If
        
    jointInfo.idNo = frmIndividualJoint.txtIdNumber
    jointInfo.idType = Left$(frmIndividualJoint.cmbIdType, 1)
    jointInfo.idIssuedAt = frmIndividualJoint.cmbIdIssuedAt.text
    If frmIndividualJoint.optIdDateHijri Then
        jointInfo.idDateType = "0"
        jointInfo.idExpiryDateH = Format(frmIndividualJoint.txtIdExpiryYear, "0000") & Format(frmIndividualJoint.cmbIdExpiryMonth.text, "00") & Format(frmIndividualJoint.cmbIdExpiryDate.text, "00")
        jointInfo.idExpiryDateG = Space(8)
        jointInfo.idIssueDateH = Format(frmIndividualJoint.txtIdIssueYear, "0000") & Format(frmIndividualJoint.cmbIdIssueMonth.text, "00") & Format(frmIndividualJoint.cmbIdIssueDate.text, "00")
        jointInfo.idIssueDateG = Space(8)
    Else
        jointInfo.idDateType = "1"
        jointInfo.idExpiryDateG = Format(frmIndividualJoint.txtIdExpiryYear, "0000") & Format(frmIndividualJoint.cmbIdExpiryMonth.text, "00") & Format(frmIndividualJoint.cmbIdExpiryDate.text, "00")
        jointInfo.idExpiryDateH = Space(8)
        jointInfo.idIssueDateG = Format(frmIndividualJoint.txtIdIssueYear, "0000") & Format(frmIndividualJoint.cmbIdIssueMonth.text, "00") & Format(frmIndividualJoint.cmbIdIssueDate.text, "00")
        jointInfo.idIssueDateH = Space(8)
    End If
    If frmIndividualJoint.optLangArabic Then
       jointInfo.preferredLang = "0"
    Else
       jointInfo.preferredLang = "1"
    End If
    jointInfo.nationality = Left$(frmIndividualJoint.cmbNationality.text, 3) & Space(17)
    jointInfo.titleCode = Left$(frmIndividualJoint.cmbTitleCode, 2)
    If frmIndividualJoint.optDOBGreg Then
       jointInfo.dobDateType = "1"
       jointInfo.dobDateG = Format(frmIndividualJoint.txtDobYear, "0000") & Format(frmIndividualJoint.cmbDobMonth.text, "00") & Format(frmIndividualJoint.cmbDobDate.text, "00")
       jointInfo.dobDateH = Space(8)
    Else
       jointInfo.dobDateType = "0"
       jointInfo.dobDateH = Format(frmIndividualJoint.txtDobYear, "0000") & Format(frmIndividualJoint.cmbDobMonth.text, "00") & Format(frmIndividualJoint.cmbDobDate.text, "00")
       jointInfo.dobDateG = Space(8)
    End If
    If frmIndividualJoint.optGenderMale Then
       jointInfo.sexCode = "0"
    Else
       jointInfo.sexCode = "1"
    End If
    If frmIndividualJoint.optVipYes Then
       jointInfo.vipCode = "1"
    Else
       jointInfo.vipCode = "0"
    End If
    If frmIndividualJoint.optMarried Then
       jointInfo.maritalStatus = "0"
    ElseIf frmIndividualJoint.OptSingle Then
       jointInfo.maritalStatus = "1"
    Else
       jointInfo.maritalStatus = "2"
    End If
    jointInfo.noOfDependents = frmIndividualJoint.txtDependents
    If frmIndividualJoint.optResident Then
       jointInfo.residentStatus = "0"
    Else
       jointInfo.residentStatus = "1"
    End If
    jointInfo.businessType = Left$(frmIndividualJoint.cmbBusinessType, 3)
    jointInfo.aFirstName = frmIndividualJoint.txtArabFirstName
    jointInfo.a2ndName = frmIndividualJoint.txtArabic2ndName
    jointInfo.a3rdName = frmIndividualJoint.txtArabic3rdName
    jointInfo.aLastName = frmIndividualJoint.txtArabLastName
    jointInfo.aShortName = frmIndividualJoint.txtArabShortName
    jointInfo.eFirstName = frmIndividualJoint.txtEngFirstName
    jointInfo.e2ndName = frmIndividualJoint.txtEnglish2ndName
    jointInfo.e3rdName = frmIndividualJoint.txtEnglish3rdName
    jointInfo.eLastName = frmIndividualJoint.txtEngLastName
    jointInfo.eShortName = frmIndividualJoint.txtEngShortName
     
    If frmIndividualJoint.optSaudiPost = True Then
       jointInfo.addressType = "1"
       jointInfo.address1 = Format(frmIndividualJoint.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
                            frmIndividualJoint.txtSaudiPostStreetName
       jointInfo.poBox = frmIndividualJoint.txtSaudiPostUnit
       jointInfo.zipCode = Format(frmIndividualJoint.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                           frmIndividualJoint.txtSaudiPostAdditionalNo
       jointInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       jointInfo.addressType = "0"
       jointInfo.address1 = frmIndividualJoint.txtAddress1
       jointInfo.address2 = frmIndividualJoint.txtAddress2
       jointInfo.poBox = frmIndividualJoint.txtPOBox
       jointInfo.zipCode = frmIndividualJoint.txtPinCode
       jointInfo.country = Left(frmIndividualJoint.cmbCountry.text, 3)
    End If
    
    If UserLang = ENGLISH And _
       jointInfo.preferredLang = "0" Then  ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                            frmIndividualJoint.cmbCity.text & "'")
       
       If rs.recordCount > 0 Then
          jointInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          jointInfo.cityName = frmIndividualJoint.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       jointInfo.preferredLang = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmIndividualJoint.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          jointInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          jointInfo.cityName = frmIndividualJoint.cmbCity.text
       End If
    Else
        jointInfo.cityName = frmIndividualJoint.cmbCity.text
    End If
    jointInfo.telOffAreaCode = frmIndividualJoint.txtOffPhoneCityCode
    jointInfo.telOffNo = frmIndividualJoint.txtOffPhoneNo
    jointInfo.telOffExt = frmIndividualJoint.txtOffPhoneExt
    jointInfo.telHomeAreaCode = frmIndividualJoint.txtResPhoneCityCode
    jointInfo.telHomeNo = frmIndividualJoint.txtResPhoneNo
    jointInfo.telHomeExt = frmIndividualJoint.txtResPhoneExt
    jointInfo.faxAreaCode = frmIndividualJoint.txtFaxCityCode
    jointInfo.faxNo = frmIndividualJoint.txtFaxNo
    jointInfo.faxExt = frmIndividualJoint.txtFaxExt
    If Len(RTrim(frmIndividualJoint.txtMobileNo)) <> 0 Then
       jointInfo.mobileNo = frmIndividualJoint.txtMobileAreaCode & frmIndividualJoint.txtMobileNo
    Else
       jointInfo.mobileNo = Space(10)
    End If
    jointInfo.pagerNo = frmIndividualJoint.txtPagerNo
    jointInfo.eMail = frmIndividualJoint.txtEmailAddress
    jointInfo.educationCode = Mid$(frmIndividualJoint.cmbEducation.text, 3, 2)
    jointInfo.professionCode = Mid$(frmIndividualJoint.cmbProfession.text, 3, 2)
    jointInfo.positionCode = Mid$(frmIndividualJoint.cmbPosition.text, 3, 2)
    jointInfo.monthlyIncome = Mid$(frmIndividualJoint.cmbMonthlyIncome.text, 3, 2)
    'jointInfo.segmentation = Mid$(frmCustomer3.cmbSegmentation, 1, 1)
    jointInfo.segmentation = " "  ' hardcoded to space because this field has been removed from the screen
    jointInfo.ownerShip = "0000000000"
    If frmIndividualJoint.chkRentHome.Value = 1 Then
       Mid$(jointInfo.ownerShip, 1, 1) = "1"
    End If
    If frmIndividualJoint.chkOwnHouse.Value = 1 Then
       Mid$(jointInfo.ownerShip, 2, 1) = "1"
    End If
    If frmIndividualJoint.chkCompanyAccomodation.Value = 1 Then
       Mid$(jointInfo.ownerShip, 3, 1) = "1"
    End If
    If frmIndividualJoint.chkRentCar.Value = 1 Then
       Mid$(jointInfo.ownerShip, 4, 1) = "1"
    End If
    If frmIndividualJoint.chkOwnCar.Value = 1 Then
       Mid$(jointInfo.ownerShip, 5, 1) = "1"
    End If
    If frmIndividualJoint.chkCompanyTrans.Value = 1 Then
       Mid$(jointInfo.ownerShip, 6, 1) = "1"
    End If
    
    jointInfo.employerName = frmIndividualJoint.txtEmployerName
    jointInfo.department = frmIndividualJoint.txtDepartment
    jointInfo.employerPoBox = frmIndividualJoint.txtEmployerPOBox
    jointInfo.employerCity = frmIndividualJoint.txtEmployerCity
    jointInfo.employerZipCode = frmIndividualJoint.txtEmployerZipcode
    
    If frmIndividualJoint.optValid Then
       jointInfo.activeStatus = "1"
    Else
       jointInfo.activeStatus = "0"
    End If
    
    If activityFlag = "P" Then
       jointInfo.activityFlag = "P"
    Else
       jointInfo.activityFlag = Space(1)
    End If
       
End Sub
Public Sub formatCardRequest()
    Dim strmsglen As String
        
'    gDateTime = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + Format(CStr(Day(Date)), "00") + _
'                   Format(CStr(Hour(Time)), "00") + Format(CStr(Minute(Time)), "00") + Format(CStr(Second(Time)), "00")
    gDateTime = Space(14)
       
    cardInfo.msgLen = "000050"
    cardInfo.service = "20"
    cardInfo.homeBranch = gBranchCode
    cardInfo.userId = Format(gUserId, "!@@@@@@@@@@")
    cardInfo.branchCode = gBranchCode
    If cardTellerAction Or cbsCardCreationAction Then
       frmCardPendingList.cardPendingGrid.Col = 1
       cardInfo.dateTime = Format(frmCardPendingList.cardPendingGrid.text, "!@@@@@@@@@@@@@@")
       If cbsCardCreationAction Then
          frmCardPendingList.cardPendingGrid.Col = 0
          cardInfo.userId = Format(frmCardPendingList.cardPendingGrid.text, "!@@@@@@@@@@")
          cardInfo.creationOrUpdate = "F"
       Else
          cardInfo.creationOrUpdate = "U"
       End If
       cardInfo.supervisorId = recvCardPendingDetail.supervisorId
       cardInfo.supervisorComments = Format(recvCardPendingDetail.supervisorComments, "!" & String(200, "@"))
       cardInfo.regionCode = Mid$(frmCardDetails.txtBranchCode, 2, 1)
       cardInfo.customerBranch = frmCardDetails.txtBranchCode
    Else
       cardInfo.dateTime = gDateTime
       cardInfo.creationOrUpdate = "C"
       cardInfo.supervisorId = Space(10)
       cardInfo.supervisorComments = Space(200)
       cardInfo.regionCode = Mid$(recvCardSearchMsg.custBranchCode, 2, 1)
       cardInfo.customerBranch = recvCardSearchMsg.custBranchCode
    End If
    If cardTellerAction And recvCardPendingDetail.newOrUpdate = "U" Then
       cardInfo.newOrUpdate = "U"
    Else
       cardInfo.newOrUpdate = "N"
    End If
    
    cardInfo.custNo = Format(frmCardDetails.txtCustNo, "00000000")
    cardInfo.cardNo = Format(frmCardDetails.txtFullCardNo, "###################")
    If frmCardDetails.optElectron.Value = True Then
       cardInfo.cardType = "R"
    ElseIf frmCardDetails.optElectronIntl.Value = True Then
       cardInfo.cardType = "I"
    ElseIf frmCardDetails.optIntlChip.Value = True Then
       cardInfo.cardType = "S"
    ElseIf frmCardDetails.optLocalChip.Value = True Then
       cardInfo.cardType = "L"
    ElseIf frmCardDetails.optPayroll.Value = True Then
       cardInfo.cardType = "C"
    Else
       cardInfo.cardType = "I" ' defaulted to International card to avoid problems
    End If
    cardInfo.newOrReplacement = "N"
    If frmCardDetails.optPrimary.Value = True Then
       cardInfo.primaryOrSupplementary = "P"
    Else
       cardInfo.primaryOrSupplementary = "S"
    End If
    cardInfo.cardStatus = "0" ' Requested
    
    If frmCardDetails.optArabic Then
       cardInfo.languageCode = "0"
    ElseIf frmCardDetails.optEnglish Then
       cardInfo.languageCode = "1"
    Else
       cardInfo.languageCode = "2"
    End If
    
    cardInfo.nameOnTheCard = UCase(frmCardDetails.txtNameOnCard)
    cardInfo.subAcc = frmCardDetails.txtSubAcc
    If frmCardDetails.optBranch.Value = True Then
       cardInfo.deliveryToBranchOrPO = "C"
    ElseIf frmCardDetails.optReqBranch.Value = True Then
       cardInfo.deliveryToBranchOrPO = "R"
    ElseIf frmCardDetails.optPoBox.Value = True Then
       cardInfo.deliveryToBranchOrPO = "P"
    Else ' GPS
       cardInfo.deliveryToBranchOrPO = "G"
    End If
    cardInfo.address2 = frmCardDetails.txtDeliveryAddr2
    cardInfo.cityName = frmCardDetails.cmbDeliveryCity
    If cardInfo.deliveryToBranchOrPO <> "G" Then
       cardInfo.address1 = frmCardDetails.txtDeliveryAddr1
       cardInfo.poBox = Format(frmCardDetails.txtDeliveryPOBox, "!@@@@@@@@@@")
       cardInfo.zipCode = Format(frmCardDetails.txtDeliveryZipcode, "!@@@@@@@@@@")
    Else ' GPS address is selected
       cardInfo.address1 = Format(frmCardDetails.txtGPSNo, "!@@@@@") & "-" & frmCardDetails.txtGPSStreetName
       cardInfo.poBox = Format(frmCardDetails.txtGPSUnit, "!@@@@@@@@@@")
       cardInfo.zipCode = Format(frmCardDetails.txtGPSZipCode, "!@@@@@") & "-" & frmCardDetails.txtGPSAdditionalNo
    End If
    cardInfo.firstIssueDate = Format(frmCardDetails.txtIssueYear, "!@@@@") & frmCardDetails.cmbIssueMonth & frmCardDetails.cmbIssuedate
    cardInfo.expiryDate = Format(frmCardDetails.txtExpiryYear, "!@@@@") & frmCardDetails.cmbExpiryMonth & frmCardDetails.cmbExpiryDate
    If frmCardDetails.optPayroll = True Then
       cardInfo.idNo = Format(ratibiIdNo, "!@@@@@@@@@@")
    Else
       If cbsCardCreationAction Or cardTellerAction Then
          cardInfo.idNo = recvCardPendingDetail.idNo
       Else
          cardInfo.idNo = Format(recvCardSearchMsg.idNo, "!@@@@@@@@@@")
       End If
    End If
    cardInfo.coreAccNo = Format(frmCardDetails.txtCurrency, "!@@") & Format(Mid$(frmCardDetails.cmbLedger, 1, 2), "!@@") & _
                         Format(frmCardDetails.txtCustomerNo, "!@@@@@@@@") & Format(frmCardDetails.txtSubAcc, "!@@@@")
End Sub
Public Sub formatAdminCardRequest()
    Dim strmsglen, tCode, branchName As String
        
'    gDateTime = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + Format(CStr(Day(Date)), "00") + _
'                   Format(CStr(Hour(Time)), "00") + Format(CStr(Minute(Time)), "00") + Format(CStr(Second(Time)), "00")
    
    gDateTime = Space(14)
       
    cardInfo.msgLen = "000050"
    cardInfo.service = "20"
    cardInfo.homeBranch = gBranchCode
    cardInfo.userId = Format(gUserId, "!@@@@@@@@@@")
    cardInfo.branchCode = gBranchCode
    If cardTellerAction Then
       frmCardPendingList.cardPendingGrid.Col = 1
       cardInfo.dateTime = Format(frmCardPendingList.cardPendingGrid.text, "!@@@@@@@@@@@@@@")
       cardInfo.creationOrUpdate = "U"
       cardInfo.supervisorId = recvCardPendingDetail.supervisorId
       cardInfo.supervisorComments = Format(recvCardPendingDetail.supervisorComments, "!" & String(200, "@"))
       cardInfo.regionCode = Mid$(frmCardDetails.txtBranchCode, 2, 1)
       cardInfo.customerBranch = frmCardDetails.txtBranchCode
       cardInfo.cardNo = Format(frmCardDetails.txtFullCardNo, "###################")
       cardInfo.custNo = Format(frmCardDetails.txtCustNo, "00000000")
    Else
       cardInfo.dateTime = gDateTime
       cardInfo.creationOrUpdate = "C"
       cardInfo.supervisorId = Space(10)
       cardInfo.supervisorComments = Space(200)
       cardInfo.regionCode = Mid$(recvCardSearchMsg.custBranchCode, 2, 1)
       cardInfo.customerBranch = recvCardSearchMsg.custBranchCode
       cardInfo.cardNo = String(19, " ")
       cardInfo.custNo = Format(recvCardSearchMsg.custNo, "00000000")
    End If
    If cardTellerAction And recvCardPendingDetail.newOrUpdate = "U" Then
       cardInfo.newOrUpdate = "U"
    Else
       cardInfo.newOrUpdate = "N"
    End If
    
    cardInfo.cardType = "A"  ' Admin Card
    cardInfo.newOrReplacement = "N"
    cardInfo.primaryOrSupplementary = "P"
    cardInfo.cardStatus = "0"
    cardInfo.languageCode = "2"
    cardInfo.subAcc = "0001"
    cardInfo.deliveryToBranchOrPO = "C"
    
    tCode = cardInfo.customerBranch

    Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
                " where branchcode = '" & tCode & "'")
  
    If rs.recordCount > 0 Then
       branchName = rs(0)
       cardInfo.address1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, " ", rs(0))
       cardInfo.address2 = "(*)" & "   " & "   " & _
                          "BR.CODE:" & Right$(tCode, 3)
       cardInfo.poBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, " ", rs(2))
       cardInfo.zipCode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, " ", rs(3))
          
       tCode = rs(1)
       Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                  " where citycode = '" & tCode & "'")
                        
       If rs.recordCount > 0 Then
          cardInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, " ", rs(0))
       Else
          cardInfo.cityName = " "
       End If
    Else
       branchName = tCode ' Check whether it is correct
    End If
    cardInfo.nameOnTheCard = "ADMIN  " & branchName
    cardInfo.nameOnTheCard = UCase(cardInfo.nameOnTheCard)
    cardInfo.firstIssueDate = "00000000"
    cardInfo.expiryDate = "00000000"
End Sub
Public Sub formatStdOrdRequest()

    Dim tCcy As String, tDecimalPlace As String
    Dim amtDenom As Integer
'    On Error Resume Next
''    gDateTime = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + Format(CStr(Day(Date)), "00") + _
''                   Format(CStr(Hour(Time)), "00") + Format(CStr(Minute(Time)), "00") + Format(CStr(Second(Time)), "00")
'
'    gDateTime = Space(14)
'
'    stdOrdInfo.msgLen = "000000"
'    stdOrdInfo.service = "44"
'    stdOrdInfo.homeBranch = gBranchCode
'    stdOrdInfo.userId = Format(gUserId, "!@@@@@@@@@@")
'    If stdOrdTellerAction Then
'       frmStdOrdPendingList.stdOrdPendingGrid.Col = 1
'       stdOrdInfo.dateTime = Format(frmStdOrdPendingList.stdOrdPendingGrid.text, "!@@@@@@@@@@@@@@")
'       stdOrdInfo.creationOrUpdate = "U"
'       stdOrdInfo.supervisorComments = recvStdOrdDetail.supervisorComments
'    Else
'       stdOrdInfo.dateTime = gDateTime
'       stdOrdInfo.creationOrUpdate = "C"
'       stdOrdInfo.supervisorComments = Space(200)
'    End If
'
'    If stdOrdUpdateAction Or (stdOrdTellerAction And recvStdOrdDetail.newOrUpdate = "U") Then
'       stdOrdInfo.newOrUpdate = "U"
'    Else
'       stdOrdInfo.newOrUpdate = "N"
'    End If
'
'    stdOrdInfo.accNo = frmStandingOrderDetail.txtAcctNo
'    stdOrdInfo.sodNo = Format(frmStandingOrderDetail.txtSoNo, "000000")
'    stdOrdInfo.orderType = Mid$(frmStandingOrderDetail.cmbSoType, 1, 1)
'    stdOrdInfo.paymentType = Mid$(frmStandingOrderDetail.cmbPayType, 1, 1)
'    stdOrdInfo.paymentMode = Mid$(frmStandingOrderDetail.cmbPayMode, 1, 1)
'    stdOrdInfo.paymentFrequency = Mid$(frmStandingOrderDetail.cmbPayFreq, 1, 1)
'    stdOrdInfo.firstPaymentDate = frmStandingOrderDetail.txtFirstPayYear & _
'                                  frmStandingOrderDetail.cmbFirstPayMonth & _
'                                  frmStandingOrderDetail.cmbFirstPayDate
'    stdOrdInfo.nextPaymentDate = frmStandingOrderDetail.txtNextPayYear & _
'                                 frmStandingOrderDetail.cmbNextPayMonth & _
'                                 frmStandingOrderDetail.cmbNextPayDate
'    stdOrdInfo.finalPaymentDate = frmStandingOrderDetail.txtFinalPayYear & _
'                                  frmStandingOrderDetail.cmbFinalPayMonth & _
'                                  frmStandingOrderDetail.cmbFinalPayDate
'    stdOrdInfo.lastProcessedDate = frmStandingOrderDetail.txtLastProcessYear & _
'                                   frmStandingOrderDetail.cmbLastProcessMonth & _
'                                   frmStandingOrderDetail.cmbLastProcessDate
'    stdOrdInfo.paymentsToBeMade = frmStandingOrderDetail.txtNoOfPayments
'    stdOrdInfo.paymentsMade = frmStandingOrderDetail.txtNoOfPaymentsMade
'    If frmStandingOrderDetail.optCommYes Then
'       stdOrdInfo.commissionFlag = "1"
'    Else
'       stdOrdInfo.commissionFlag = "0"
'    End If
'    If frmStandingOrderDetail.optProcessNextDay Then
'       stdOrdInfo.processNextDayFlag = "1"
'    Else
'       stdOrdInfo.processNextDayFlag = "0"
'    End If
'    tCcy = Mid$(stdOrdInfo.accNo, 1, 2)
'    Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
'                              "where currencycode = '" & tCcy & "'")
'
'    If rs.recordCount > 0 Then
'       tDecimalPlace = rs(0)
'    Else
'       tDecimalPlace = "2"
'    End If
'
'    If tDecimalPlace = "3" Then
'       amtDenom = 1000
'    ElseIf tDecimalPlace = "2" Then
'       amtDenom = 100
'    ElseIf tDecimalPlace = "1" Then
'       amtDenom = 10
'    Else
'       amtDenom = 1
'    End If
'    'stdOrdInfo.thresholdAmt = Format(frmStandingOrderDetail.txtThreshold, "0000000000")
'    stdOrdInfo.thresholdAmt = Format(Val(frmStandingOrderDetail.txtThreshold) * amtDenom, "0000000000")
'    stdOrdInfo.paymentAmt = Format(Val(frmStandingOrderDetail.txtPayAmt) * amtDenom, "00000000000000")
'    stdOrdInfo.totalPaidToDate = Format(Val(frmStandingOrderDetail.txtAmtPaidToDate) * amtDenom, "00000000000000")
'    If Len(RTrim(frmStandingOrderDetail.txtTotalAmtToPay)) = 0 Then
'       stdOrdInfo.totalToPay = Format((Val(frmStandingOrderDetail.txtPayAmt) * Val(frmStandingOrderDetail.txtNoOfPayments)) * amtDenom, "00000000000000")
'    Else
'       stdOrdInfo.totalToPay = Format(Val(frmStandingOrderDetail.txtTotalAmtToPay) * amtDenom, "00000000000000")
'    End If
'    frmStandingOrderDetail.txtTotalAmtToPay = Val(stdOrdInfo.totalToPay) / amtDenom
'    stdOrdInfo.payAccNo = frmStandingOrderDetail.txtPayeeAcc
'    stdOrdInfo.drNarrative1 = frmStandingOrderDetail.txtDrNarrative1
'    stdOrdInfo.drNarrative2 = frmStandingOrderDetail.txtDrNarrative2
'    stdOrdInfo.crNarrative1 = frmStandingOrderDetail.txtCrNarrative1
'    stdOrdInfo.crNarrative2 = frmStandingOrderDetail.txtCrNarrative2
'    stdOrdInfo.branchCode = Mid$(frmStandingOrderDetail.cmbBranchcode, 1, 4)
'    stdOrdInfo.remarks = frmStandingOrderDetail.txtRemarks
End Sub
Public Sub formatNewStopChqRequest()


'   gDateTime = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + Format(CStr(Day(Date)), "00") + _
'               Format(CStr(Hour(Time)), "00") + Format(CStr(Minute(Time)), "00") + Format(CStr(Second(Time)), "00")

'    gDateTime = Space(14)
'
'    stopChqInfo.msgLen = "000000"
'    stopChqInfo.service = "47"
'    stopChqInfo.homeBranch = gBranchCode
'    stopChqInfo.userId = Format(gUserId, "!@@@@@@@@@@")
'
'    If stopChqTellerAction Then
'       frmStopChqPendingList.stopChqPendingGrid.Col = 1
'       stopChqInfo.dateTime = Format(frmStopChqPendingList.stopChqPendingGrid.text, "!@@@@@@@@@@@@@@")
'       stopChqInfo.creationOrUpdate = "U"
'       stopChqInfo.supervisorComments = recvStopChqDetail.supervisorComments
'    Else
'       stopChqInfo.dateTime = gDateTime
'       stopChqInfo.creationOrUpdate = "C"
'       stopChqInfo.supervisorComments = Space(200)
'    End If
'
'    If stopChqUpdateAction Then
'       stopChqInfo.newOrUpdate = "U"
'    Else
'       stopChqInfo.newOrUpdate = "N"
'    End If
'
'    If stopChqTellerAction And recvStopChqDetail.newOrUpdate = "U" Then
'       stopChqInfo.newOrUpdate = "U"
'    Else
'       stopChqInfo.newOrUpdate = "N"
'    End If
'
'    stopChqInfo.accNo = frmStopChqDetails.txtAcctNo
'    stopChqInfo.chequeNo = frmStopChqDetails.txtChequeNo
'    stopChqInfo.amount = Format(Val(frmStopChqDetails.txtChqAmt) * 100, "00000000000000")
'    stopChqInfo.chequeFrom = frmStopChqDetails.txtFromCheque
'    stopChqInfo.dateStop = frmStopChqDetails.txtStopYear & frmStopChqDetails.cmbStopMonth & frmStopChqDetails.cmbStopDate
'    stopChqInfo.payeeName = frmStopChqDetails.txtDetails
   
End Sub

Public Sub commercialEnable()
    frmCustomer.frameCompanyInfo.Enabled = True
    frmCustomer.txtCRnumber.BackColor = &HFFFFFF
    frmCustomer.txtCrIssueYear.BackColor = &HFFFFFF
    frmCustomer.txtOrgArabicShortName.BackColor = &HFFFFFF
    frmCustomer.txtOrgEnglishShortName.BackColor = &HFFFFFF
    frmCustomer.txtOrgName1Arabic.BackColor = &HFFFFFF
    frmCustomer.txtOrgName2Arabic.BackColor = &HFFFFFF
    frmCustomer.txtOrgName1English.BackColor = &HFFFFFF
    frmCustomer.txtOrgName2English.BackColor = &HFFFFFF
    frmCustomer.txtOrgAlphaSearch.Enabled = True
    frmCustomer.txtOrgAlphaSearch.BackColor = &HFFFFFF
    frmCustomer.txtCRnumber.Enabled = True
    frmCustomer.txtCrIssueYear.Enabled = True
    frmCustomer.txtOrgArabicShortName.Enabled = True
    frmCustomer.txtOrgEnglishShortName.Enabled = True
    frmCustomer.txtOrgName1Arabic.Enabled = True
    frmCustomer.txtOrgName1English.Enabled = True
    frmCustomer.txtOrgName2Arabic.Enabled = True
    frmCustomer.txtOrgName2English.Enabled = True
    frmCustomer.optCRIssueDateGreg.Enabled = True
    frmCustomer.optCRIssueDateHijri.Enabled = True
    frmCustomer.cmbCrIssuedate.Enabled = True
    frmCustomer.cmbCrIssueMonth.Enabled = True
    frmCustomer.cmbCRIssuedCity.Enabled = True
    
    frmCustomer.cmbIdType.Enabled = False
    frmCustomer.cmbIdIssuedAt.Enabled = False
    frmCustomer.optIdDateGregorian.Enabled = False
    frmCustomer.optIdDateHijri.Enabled = False
    frmCustomer.cmbIdIssueDate.Enabled = False
    frmCustomer.cmbIdIssueMonth.Enabled = False
    frmCustomer.cmbIdExpiryDate.Enabled = False
    frmCustomer.cmbIdExpiryMonth.Enabled = False
    frmCustomer.txtId.Enabled = False
    frmCustomer.txtIdIssueYear.Enabled = False
    frmCustomer.txtIdExpiryYear.Enabled = False
    frmCustomer.txtId.BackColor = &HC0C0C0
    frmCustomer.txtIdIssueYear.BackColor = &HC0C0C0
    frmCustomer.txtIdExpiryYear.BackColor = &HC0C0C0
     
    frmCustomer.frameIdInfo.Enabled = False
    frmCustomer.optGenderFemale.Enabled = False
    frmCustomer.optGenderMale.Enabled = False
    frmCustomer.frameSex.Enabled = False
    frmCustomer.OptSingle.Enabled = False
    frmCustomer.optMarried.Enabled = False
    frmCustomer.optOthers.Enabled = False
    frmCustomer.frameMaritalStatus.Enabled = False
    frmCustomer.txtDependents.Enabled = False
    frmCustomer.txtDependents.BackColor = &HC0C0C0
End Sub
Public Sub consumerEnable()
    frmCustomer.frameCompanyInfo.Enabled = False
    frmCustomer.txtCRnumber.Enabled = False
    frmCustomer.txtCRnumber.BackColor = &HC0C0C0
    frmCustomer.txtCrIssueYear.BackColor = &HC0C0C0
    frmCustomer.txtOrgArabicShortName.BackColor = &HC0C0C0
    frmCustomer.txtOrgEnglishShortName.BackColor = &HC0C0C0
    frmCustomer.txtOrgName1Arabic.BackColor = &HC0C0C0
    frmCustomer.txtOrgName2Arabic.BackColor = &HC0C0C0
    frmCustomer.txtOrgName1English.BackColor = &HC0C0C0
    frmCustomer.txtOrgName2English.BackColor = &HC0C0C0
    frmCustomer.txtOrgAlphaSearch.BackColor = &HC0C0C0
    frmCustomer.txtOrgAlphaSearch.Enabled = False
    frmCustomer.txtCrIssueYear.Enabled = False
    frmCustomer.txtOrgArabicShortName.Enabled = False
    frmCustomer.txtOrgEnglishShortName.Enabled = False
    frmCustomer.txtOrgName1Arabic.Enabled = False
    frmCustomer.txtOrgName1English.Enabled = False
    frmCustomer.txtOrgName2Arabic.Enabled = False
    frmCustomer.txtOrgName2English.Enabled = False
    frmCustomer.optCRIssueDateGreg.Enabled = False
    frmCustomer.optCRIssueDateHijri.Enabled = False
    frmCustomer.cmbCrIssuedate.Enabled = False
    frmCustomer.cmbCrIssueMonth.Enabled = False
    frmCustomer.cmbCRIssuedCity.Enabled = False
    
    frmCustomer.cmbIdType.Enabled = True
    frmCustomer.cmbIdIssuedAt.Enabled = True
    frmCustomer.optIdDateGregorian.Enabled = True
    frmCustomer.optIdDateHijri.Enabled = True
    frmCustomer.cmbIdIssueDate.Enabled = True
    frmCustomer.cmbIdIssueMonth.Enabled = True
    frmCustomer.cmbIdExpiryDate.Enabled = True
    frmCustomer.cmbIdExpiryMonth.Enabled = True
    frmCustomer.txtId.Enabled = True
    frmCustomer.txtIdIssueYear.Enabled = True
    frmCustomer.txtIdExpiryYear.Enabled = True
    frmCustomer.frameIdInfo.Enabled = True
    frmCustomer.txtId.BackColor = &HFFFFFF
    frmCustomer.txtIdIssueYear.BackColor = &HFFFFFF
    frmCustomer.txtIdExpiryYear.BackColor = &HFFFFFF
        
    frmCustomer.optGenderFemale.Enabled = True
    frmCustomer.optGenderMale.Enabled = True
    frmCustomer.frameSex.Enabled = True
    frmCustomer.OptSingle.Enabled = True
    frmCustomer.optMarried.Enabled = True
    frmCustomer.optOthers.Enabled = True
    frmCustomer.frameMaritalStatus.Enabled = True
    frmCustomer.txtDependents.Enabled = True
    frmCustomer.txtDependents.BackColor = &HFFFFFF
End Sub
Public Sub fillFrmQuickCustOpen()
    Dim tCode As String, i As Integer, mQry As String
   
'    If recvQuickCustMsg.internalCustomer = "1" Then
'       frmQuickCustOpen.frameAccountDetails.Visible = False
'       frmQuickCustOpen.FrameCardDetails.Visible = False
'    Else
'       frmQuickCustOpen.frameAccountDetails.Visible = True
'       frmQuickCustOpen.FrameCardDetails.Visible = True
'    End If
    frmQuickCustOpen.txtCustomerNo = recvQuickCustMsg.customerNo
    'frmquickcustopen.txtBranchCode = recvquickcustmsg.custBranchCode
    
    tCode = recvQuickCustMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmQuickCustOpen.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmQuickCustOpen.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmQuickCustOpen.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvQuickCustMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmQuickCustOpen.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmQuickCustOpen.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmQuickCustOpen.cmbAltBrCode.text = "0000-NONE"
    End If
    
    tCode = recvQuickCustMsg.idType
    If tCode <> "" Then
        For i = 0 To frmQuickCustOpen.cmbIdType.ListCount
            If Mid(frmQuickCustOpen.cmbIdType.List(i), 1, 1) = tCode Then
               frmQuickCustOpen.cmbIdType.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmQuickCustOpen.cmbIdType.ListIndex = -1
    End If
    If i > frmQuickCustOpen.cmbIdType.ListCount Then
       frmQuickCustOpen.cmbIdType.ListIndex = -1
'       frmquickcustopen.cmbIdType.AddItem tCode & "-Not defined in local"
'       frmquickcustopen.cmbIdType.ListIndex = frmquickcustopen.cmbIdType.ListCount - 1
    End If
    frmQuickCustOpen.txtIdNo = recvQuickCustMsg.idNo
    frmQuickCustOpen.cmbIdIssuedAt.text = recvQuickCustMsg.idIssuedAt
    If recvQuickCustMsg.idDateType = "0" Or _
       recvQuickCustMsg.idDateType = " " Then
       frmQuickCustOpen.optIdDateHijri.Value = True
       frmQuickCustOpen.txtIdIssueYear = Mid$(recvQuickCustMsg.idIssueDateH, 1, 4)
       frmQuickCustOpen.cmbIdIssueDate.text = Right$(recvQuickCustMsg.idIssueDateH, 2)
       frmQuickCustOpen.cmbIdIssueMonth.text = Mid$(recvQuickCustMsg.idIssueDateH, 5, 2)
       frmQuickCustOpen.txtIdExpiryYear = Mid$(recvQuickCustMsg.idExpiryDateH, 1, 4)
       frmQuickCustOpen.cmbIdExpiryDate.text = Right$(recvQuickCustMsg.idExpiryDateH, 2)
       frmQuickCustOpen.cmbIdExpiryMonth.text = Mid$(recvQuickCustMsg.idExpiryDateH, 5, 2)
    Else
       frmQuickCustOpen.optIdDateGregorian.Value = True
       frmQuickCustOpen.txtIdIssueYear = Mid$(recvQuickCustMsg.idIssueDateG, 1, 4)
       frmQuickCustOpen.cmbIdIssueDate.text = Right$(recvQuickCustMsg.idIssueDateG, 2)
       frmQuickCustOpen.cmbIdIssueMonth.text = Mid$(recvQuickCustMsg.idIssueDateG, 5, 2)
       frmQuickCustOpen.txtIdExpiryYear = Mid$(recvQuickCustMsg.idExpiryDateG, 1, 4)
       frmQuickCustOpen.cmbIdExpiryDate.text = Right$(recvQuickCustMsg.idExpiryDateG, 2)
       frmQuickCustOpen.cmbIdExpiryMonth.text = Mid$(recvQuickCustMsg.idExpiryDateG, 5, 2)
    End If
    
    If recvQuickCustMsg.preferredLang = "0" Or _
       recvQuickCustMsg.preferredLang = " " Then
       frmQuickCustOpen.optLangArabic.Value = True
    Else
       frmQuickCustOpen.optLangEnglish.Value = True
    End If
         
    tCode = Mid$(recvQuickCustMsg.nationality, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmQuickCustOpen.cmbNationality.ListCount
            If Mid(frmQuickCustOpen.cmbNationality.List(i), 1, 3) = tCode Then
               frmQuickCustOpen.cmbNationality.ListIndex = i  ' RTrim(frmquickcustopen.cmbNationality.List(i))
               Exit For
            End If
        Next i
    Else
        frmQuickCustOpen.cmbNationality.ListIndex = -1
    End If
    If i > frmQuickCustOpen.cmbNationality.ListCount Then
       frmQuickCustOpen.cmbNationality.ListIndex = -1
       'frmquickcustopen.cmbNationality.Text = tCode & "-Not defined in local"
    End If
    
    tCode = Mid$(recvQuickCustMsg.titleCode, 1, 2)
    If tCode <> "" Then
        For i = 0 To frmQuickCustOpen.cmbTitle.ListCount
            If Mid$(frmQuickCustOpen.cmbTitle.List(i), 1, 2) = tCode Then
               frmQuickCustOpen.cmbTitle.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmQuickCustOpen.cmbTitle.ListIndex = -1
    End If
    If i > frmQuickCustOpen.cmbTitle.ListCount Then
       frmQuickCustOpen.cmbTitle.ListIndex = -1
       'frmquickcustopen.cmbTitle.Text = tCode & "-Not defined in local"
    End If
    frmQuickCustOpen.txtArabFirstName = RTrim(recvQuickCustMsg.aFirstName)
    frmQuickCustOpen.txtArabic2ndName = RTrim(recvQuickCustMsg.a2ndName)
    frmQuickCustOpen.txtArabic3rdName = RTrim(recvQuickCustMsg.a3rdName)
    frmQuickCustOpen.txtArabLastName = RTrim(recvQuickCustMsg.aLastName)
    frmQuickCustOpen.txtArabShortName = RTrim(recvQuickCustMsg.aShortName)
    frmQuickCustOpen.txtEngFirstName = RTrim(recvQuickCustMsg.eFirstName)
    frmQuickCustOpen.txtEnglish2ndName = RTrim(recvQuickCustMsg.e2ndName)
    frmQuickCustOpen.txtEnglish3rdName = RTrim(recvQuickCustMsg.e3rdName)
    frmQuickCustOpen.txtEngLastName = RTrim(recvQuickCustMsg.eLastName)
    frmQuickCustOpen.txtEngShortName = RTrim(recvQuickCustMsg.eShortName)
    
    If recvQuickCustMsg.sexCode = "0" Or _
       recvQuickCustMsg.sexCode = " " Then
       frmQuickCustOpen.optGenderMale.Value = True
    Else
       frmQuickCustOpen.optGenderFemale.Value = True
    End If
    
    If recvQuickCustMsg.dobDateType = "0" Then   ' Hijri
       frmQuickCustOpen.optDOBHijri.Value = True
       frmQuickCustOpen.txtDobYear = Mid$(recvQuickCustMsg.dobDateH, 1, 4)
       frmQuickCustOpen.cmbDobDate.text = Right$(recvQuickCustMsg.dobDateH, 2)
       frmQuickCustOpen.cmbDobMonth.text = Mid$(recvQuickCustMsg.dobDateH, 5, 2)
    Else ' Gregorian
       frmQuickCustOpen.optDOBGreg.Value = True
       frmQuickCustOpen.txtDobYear = Mid$(recvQuickCustMsg.dobDateG, 1, 4)
       frmQuickCustOpen.cmbDobDate.text = Right$(recvQuickCustMsg.dobDateG, 2)
       frmQuickCustOpen.cmbDobMonth.text = Mid$(recvQuickCustMsg.dobDateG, 5, 2)
    End If
    
    tCode = Mid$(recvQuickCustMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmQuickCustOpen.cmbBusinessType.ListCount
            If Mid(frmQuickCustOpen.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmQuickCustOpen.cmbBusinessType.ListIndex = i ' RTrim(frmquickcustopen.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmQuickCustOpen.cmbBusinessType.ListIndex = -1
    End If
    If i > frmQuickCustOpen.cmbBusinessType.ListCount Then
       frmQuickCustOpen.cmbBusinessType.ListIndex = -1
      'frmCustomer.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    
    If recvQuickCustMsg.addressType = "1" Then
       frmQuickCustOpen.optSaudiPost.Value = True
       frmQuickCustOpen.txtSaudiPostGPSNo = RTrim(Mid$(recvQuickCustMsg.address1, 1, 5))
       frmQuickCustOpen.txtSaudiPostStreetName = RTrim(Mid$(recvQuickCustMsg.address1, 7))
       frmQuickCustOpen.txtSaudiPostUnit = RTrim(recvQuickCustMsg.poBox)
       frmQuickCustOpen.txtSaudiPostZipCode = RTrim(Mid$(recvQuickCustMsg.zipCode, 1, 5))
       frmQuickCustOpen.txtSaudiPostAdditionalNo = RTrim(Mid$(recvQuickCustMsg.zipCode, 7))
    Else
       frmQuickCustOpen.optPoBox.Value = True
       frmQuickCustOpen.txtAddress1 = RTrim(recvQuickCustMsg.address1)
       frmQuickCustOpen.txtAddress2 = RTrim(recvQuickCustMsg.address2)
       frmQuickCustOpen.txtPOBox = RTrim(recvQuickCustMsg.poBox)
       frmQuickCustOpen.txtPinCode = RTrim(recvQuickCustMsg.zipCode)
       tCode = Mid$(recvQuickCustMsg.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmQuickCustOpen.cmbCountry.ListCount
              If Mid(frmQuickCustOpen.cmbCountry.List(i), 1, 3) = tCode Then
                 frmQuickCustOpen.cmbCountry.ListIndex = i 'RTrim(frmCustomer.cmbCountry.List(i))
                 Exit For
              End If
          Next i
       Else
          frmQuickCustOpen.cmbCountry.ListIndex = -1
       End If
       If i > frmQuickCustOpen.cmbCountry.ListCount Then
          frmQuickCustOpen.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    
    frmQuickCustOpen.cmbCity.text = RTrim(recvQuickCustMsg.cityName)

    If Len(RTrim(recvQuickCustMsg.currentAccInfo)) <> 0 Then
       If Mid$(recvQuickCustMsg.currentAccInfo, 11, 1) <> "1" Then
          frmQuickCustOpen.optCurrentAcYes.Value = True
          tCode = Mid$(recvQuickCustMsg.currentAccInfo, 1, 2)
          If Len(RTrim(tCode)) <> 0 Then
             For i = 0 To frmQuickCustOpen.cmbCurrentAcCurrency.ListCount
                 If Mid(frmQuickCustOpen.cmbCurrentAcCurrency.List(i), 1, 2) = tCode Then
                    frmQuickCustOpen.cmbCurrentAcCurrency.ListIndex = i
                    Exit For
                 End If
             Next i
          Else
             frmQuickCustOpen.cmbCurrentAcCurrency.ListIndex = -1
          End If
           If i > frmQuickCustOpen.cmbCurrentAcCurrency.ListCount Then
              frmQuickCustOpen.cmbCurrentAcCurrency.AddItem tCode & "-Not defined in local"
              frmQuickCustOpen.cmbCurrentAcCurrency.ListIndex = frmQuickCustOpen.cmbCurrentAcCurrency.ListCount - 1
           End If
           tCode = Mid$(recvQuickCustMsg.currentAccInfo, 6, 2)
           If Len(RTrim(tCode)) <> 0 Then
              For i = 0 To frmQuickCustOpen.cmbCurrentAcStatus.ListCount
                 If Mid(frmQuickCustOpen.cmbCurrentAcStatus.List(i), 1, 2) = tCode Then
                    frmQuickCustOpen.cmbCurrentAcStatus.ListIndex = i
                    Exit For
                 End If
              Next i
           Else
              frmQuickCustOpen.cmbCurrentAcStatus.ListIndex = -1
           End If
           If i > frmQuickCustOpen.cmbCurrentAcStatus.ListCount Then
              frmQuickCustOpen.cmbCurrentAcStatus.AddItem tCode & "-Not defined in local"
              frmQuickCustOpen.cmbCurrentAcStatus.ListIndex = frmQuickCustOpen.cmbCurrentAcStatus.ListCount - 1
           End If
        
           tCode = Mid$(recvQuickCustMsg.currentAccInfo, 8, 2)
           If Len(RTrim(tCode)) <> 0 Then
              For i = 0 To frmQuickCustOpen.cmbCurrentAcStmtFreq.ListCount
                  If Mid(frmQuickCustOpen.cmbCurrentAcStmtFreq.List(i), 1, 2) = tCode Then
                     frmQuickCustOpen.cmbCurrentAcStmtFreq.ListIndex = i
                     Exit For
                  End If
              Next i
           Else
              frmQuickCustOpen.cmbCurrentAcStmtFreq.ListIndex = -1
           End If
           If i > frmQuickCustOpen.cmbCurrentAcStmtFreq.ListCount Then
              frmQuickCustOpen.cmbCurrentAcStmtFreq.AddItem tCode & "-Not defined in local"
              frmQuickCustOpen.cmbCurrentAcStmtFreq.ListIndex = frmQuickCustOpen.cmbCurrentAcStmtFreq.ListCount - 1
           End If
           If Mid$(recvQuickCustMsg.currentAccInfo, 10, 1) = "1" Then
              frmQuickCustOpen.optCurrentAcCheckBookYes.Value = True
           Else
              frmQuickCustOpen.optCurrentAcCheckBookNo.Value = True
           End If
    End If
  Else
     frmQuickCustOpen.optCurrentAcNo.Value = True
  End If
  
  If recvQuickCustMsg.cardType = "S" Then
     frmQuickCustOpen.optChipCard.Value = True
  Else
     frmQuickCustOpen.optIntlCard.Value = True
  End If
  
  If recvQuickCustMsg.electronIntlRequired = "1" Then
     frmQuickCustOpen.optPrimaryElectronIntlCardYes.Value = True
  Else
     frmQuickCustOpen.optPrimaryElectronIntlCardNo.Value = True
  End If
  frmQuickCustOpen.txtPrimaryElectronIntlCardName = _
            UCase(recvQuickCustMsg.electronIntlName)
    
  frmQuickCustOpen.cmbOpenDate = Mid$(recvQuickCustMsg.custOpenDate, 7, 2)
  frmQuickCustOpen.cmbOpenMonth = Mid$(recvQuickCustMsg.custOpenDate, 5, 2)
  frmQuickCustOpen.txtOpenYear = Mid$(recvQuickCustMsg.custOpenDate, 1, 4)
    
  frmQuickCustOpen.txtOpenBranch = recvQuickCustMsg.branchOpened
  frmQuickCustOpen.txtOpenMakerId = recvQuickCustMsg.openMakerId
  frmQuickCustOpen.txtOpenSupervisorId = recvQuickCustMsg.openSupervisorId
    
  frmQuickCustOpen.cmbUpdateDate = Mid$(recvQuickCustMsg.lastUpdateDate, 7, 2)
  frmQuickCustOpen.cmbUpdateMonth = Mid$(recvQuickCustMsg.lastUpdateDate, 5, 2)
  frmQuickCustOpen.txtUpdateYear = Mid$(recvQuickCustMsg.lastUpdateDate, 1, 4)
  frmQuickCustOpen.txtUpdateBranch = recvQuickCustMsg.lastUpdateBranch
  frmQuickCustOpen.txtUpdateMakerId = recvQuickCustMsg.lastUpdateMakerId
  frmQuickCustOpen.txtUpdateSupervisorId = recvQuickCustMsg.lastUpdateSupervisorId

End Sub
Public Sub fillFrmInternalCustOpen()
    Dim tCode As String, i As Integer, mQry As String
   
    frmInternalCustOpen.txtCustomerNo = recvQuickCustMsg.customerNo
    'frminternalcustopen.txtBranchCode = recvquickcustmsg.custBranchCode
    
    tCode = recvQuickCustMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " + _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmInternalCustOpen.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmInternalCustOpen.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmInternalCustOpen.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvQuickCustMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmInternalCustOpen.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmInternalCustOpen.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmInternalCustOpen.cmbAltBrCode.text = "0000-NONE"
    End If
    
    tCode = recvQuickCustMsg.idType
    If tCode <> "" Then
        For i = 0 To frmInternalCustOpen.cmbIdType.ListCount
            If Mid(frmInternalCustOpen.cmbIdType.List(i), 1, 1) = tCode Then
               frmInternalCustOpen.cmbIdType.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmInternalCustOpen.cmbIdType.ListIndex = -1
    End If
    If i > frmInternalCustOpen.cmbIdType.ListCount Then
       frmInternalCustOpen.cmbIdType.ListIndex = -1
'       frminternalcustopen.cmbIdType.AddItem tCode & "-Not defined in local"
'       frminternalcustopen.cmbIdType.ListIndex = frminternalcustopen.cmbIdType.ListCount - 1
    End If
    frmInternalCustOpen.txtIdNo = recvQuickCustMsg.idNo
    frmInternalCustOpen.cmbIdIssuedAt.text = recvQuickCustMsg.idIssuedAt
    If recvQuickCustMsg.idDateType = "0" Or _
       recvQuickCustMsg.idDateType = " " Then
       frmInternalCustOpen.optIdDateHijri.Value = True
       frmInternalCustOpen.txtIdIssueYear = Mid$(recvQuickCustMsg.idIssueDateH, 1, 4)
       frmInternalCustOpen.cmbIdIssueDate.text = Right$(recvQuickCustMsg.idIssueDateH, 2)
       frmInternalCustOpen.cmbIdIssueMonth.text = Mid$(recvQuickCustMsg.idIssueDateH, 5, 2)
       frmInternalCustOpen.txtIdExpiryYear = Mid$(recvQuickCustMsg.idExpiryDateH, 1, 4)
       frmInternalCustOpen.cmbIdExpiryDate.text = Right$(recvQuickCustMsg.idExpiryDateH, 2)
       frmInternalCustOpen.cmbIdExpiryMonth.text = Mid$(recvQuickCustMsg.idExpiryDateH, 5, 2)
    Else
       frmInternalCustOpen.optIdDateGregorian.Value = True
       frmInternalCustOpen.txtIdIssueYear = Mid$(recvQuickCustMsg.idIssueDateG, 1, 4)
       frmInternalCustOpen.cmbIdIssueDate.text = Right$(recvQuickCustMsg.idIssueDateG, 2)
       frmInternalCustOpen.cmbIdIssueMonth.text = Mid$(recvQuickCustMsg.idIssueDateG, 5, 2)
       frmInternalCustOpen.txtIdExpiryYear = Mid$(recvQuickCustMsg.idExpiryDateG, 1, 4)
       frmInternalCustOpen.cmbIdExpiryDate.text = Right$(recvQuickCustMsg.idExpiryDateG, 2)
       frmInternalCustOpen.cmbIdExpiryMonth.text = Mid$(recvQuickCustMsg.idExpiryDateG, 5, 2)
    End If
    
    If recvQuickCustMsg.preferredLang = "0" Or _
       recvQuickCustMsg.preferredLang = " " Then
       frmInternalCustOpen.optLangArabic.Value = True
    Else
       frmInternalCustOpen.optLangEnglish.Value = True
    End If
         
    tCode = Mid$(recvQuickCustMsg.nationality, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmInternalCustOpen.cmbNationality.ListCount
            If Mid(frmInternalCustOpen.cmbNationality.List(i), 1, 3) = tCode Then
               frmInternalCustOpen.cmbNationality.ListIndex = i  ' RTrim(frminternalcustopen.cmbNationality.List(i))
               Exit For
            End If
        Next i
    Else
        frmInternalCustOpen.cmbNationality.ListIndex = -1
    End If
    If i > frmInternalCustOpen.cmbNationality.ListCount Then
       frmInternalCustOpen.cmbNationality.ListIndex = -1
       'frminternalcustopen.cmbNationality.Text = tCode & "-Not defined in local"
    End If
    
    tCode = Mid$(recvQuickCustMsg.titleCode, 1, 2)
    If tCode <> "" Then
        For i = 0 To frmInternalCustOpen.cmbTitle.ListCount
            If Mid$(frmInternalCustOpen.cmbTitle.List(i), 1, 2) = tCode Then
               frmInternalCustOpen.cmbTitle.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmInternalCustOpen.cmbTitle.ListIndex = -1
    End If
    If i > frmInternalCustOpen.cmbTitle.ListCount Then
       frmInternalCustOpen.cmbTitle.ListIndex = -1
       'frminternalcustopen.cmbTitle.Text = tCode & "-Not defined in local"
    End If
    frmInternalCustOpen.txtArabFirstName = recvQuickCustMsg.aFirstName
    frmInternalCustOpen.txtArabic2ndName = recvQuickCustMsg.a2ndName
    frmInternalCustOpen.txtArabic3rdName = recvQuickCustMsg.a3rdName
    frmInternalCustOpen.txtArabLastName = recvQuickCustMsg.aLastName
    frmInternalCustOpen.txtArabShortName = recvQuickCustMsg.aShortName
    frmInternalCustOpen.txtEngFirstName = recvQuickCustMsg.eFirstName
    frmInternalCustOpen.txtEnglish2ndName = recvQuickCustMsg.e2ndName
    frmInternalCustOpen.txtEnglish3rdName = recvQuickCustMsg.e3rdName
    frmInternalCustOpen.txtEngLastName = recvQuickCustMsg.eLastName
    frmInternalCustOpen.txtEngShortName = recvQuickCustMsg.eShortName
    
    If recvQuickCustMsg.sexCode = "0" Or _
       recvQuickCustMsg.sexCode = " " Then
       frmInternalCustOpen.optGenderMale.Value = True
    Else
       frmInternalCustOpen.optGenderFemale.Value = True
    End If
    
    If recvQuickCustMsg.dobDateType = "0" Then   ' Hijri
       frmInternalCustOpen.optDOBHijri.Value = True
       frmInternalCustOpen.txtDobYear = Mid$(recvQuickCustMsg.dobDateH, 1, 4)
       frmInternalCustOpen.cmbDobDate.text = Right$(recvQuickCustMsg.dobDateH, 2)
       frmInternalCustOpen.cmbDobMonth.text = Mid$(recvQuickCustMsg.dobDateH, 5, 2)
    Else ' Gregorian
       frmInternalCustOpen.optDOBGreg.Value = True
       frmInternalCustOpen.txtDobYear = Mid$(recvQuickCustMsg.dobDateG, 1, 4)
       frmInternalCustOpen.cmbDobDate.text = Right$(recvQuickCustMsg.dobDateG, 2)
       frmInternalCustOpen.cmbDobMonth.text = Mid$(recvQuickCustMsg.dobDateG, 5, 2)
    End If
    
    tCode = Mid$(recvQuickCustMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmInternalCustOpen.cmbBusinessType.ListCount
            If Mid(frmInternalCustOpen.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmInternalCustOpen.cmbBusinessType.ListIndex = i ' RTrim(frminternalcustopen.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmInternalCustOpen.cmbBusinessType.ListIndex = -1
    End If
    If i > frmInternalCustOpen.cmbBusinessType.ListCount Then
       frmInternalCustOpen.cmbBusinessType.ListIndex = -1
      'frmCustomer.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    
    If recvQuickCustMsg.addressType = "1" Then
       frmInternalCustOpen.optSaudiPost.Value = True
       frmInternalCustOpen.txtSaudiPostGPSNo = RTrim(Mid$(recvQuickCustMsg.address1, 1, 5))
       frmInternalCustOpen.txtSaudiPostStreetName = RTrim(Mid$(recvQuickCustMsg.address1, 7))
       frmInternalCustOpen.txtSaudiPostUnit = RTrim(recvQuickCustMsg.poBox)
       frmInternalCustOpen.txtSaudiPostZipCode = RTrim(Mid$(recvQuickCustMsg.zipCode, 1, 5))
       frmInternalCustOpen.txtSaudiPostAdditionalNo = RTrim(Mid$(recvQuickCustMsg.zipCode, 7))
    Else
       frmInternalCustOpen.optPoBox.Value = True
       frmInternalCustOpen.txtAddress1 = RTrim(recvQuickCustMsg.address1)
       frmInternalCustOpen.txtAddress2 = RTrim(recvQuickCustMsg.address2)
       frmInternalCustOpen.txtPOBox = RTrim(recvQuickCustMsg.poBox)
       frmInternalCustOpen.txtPinCode = RTrim(recvQuickCustMsg.zipCode)
       tCode = Mid$(recvQuickCustMsg.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmInternalCustOpen.cmbCountry.ListCount
              If Mid(frmInternalCustOpen.cmbCountry.List(i), 1, 3) = tCode Then
                 frmInternalCustOpen.cmbCountry.ListIndex = i 'RTrim(frmCustomer.cmbCountry.List(i))
                 Exit For
              End If
          Next i
       Else
          frmInternalCustOpen.cmbCountry.ListIndex = -1
       End If
       If i > frmInternalCustOpen.cmbCountry.ListCount Then
          frmInternalCustOpen.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    
    frmInternalCustOpen.cmbCity.text = RTrim(recvQuickCustMsg.cityName)

  frmInternalCustOpen.cmbOpenDate = Mid$(recvQuickCustMsg.custOpenDate, 7, 2)
  frmInternalCustOpen.cmbOpenMonth = Mid$(recvQuickCustMsg.custOpenDate, 5, 2)
  frmInternalCustOpen.txtOpenYear = Mid$(recvQuickCustMsg.custOpenDate, 1, 4)
    
  frmInternalCustOpen.txtOpenBranch = recvQuickCustMsg.branchOpened
  frmInternalCustOpen.txtOpenMakerId = recvQuickCustMsg.openMakerId
  frmInternalCustOpen.txtOpenSupervisorId = recvQuickCustMsg.openSupervisorId
    
  frmInternalCustOpen.cmbUpdateDate = Mid$(recvQuickCustMsg.lastUpdateDate, 7, 2)
  frmInternalCustOpen.cmbUpdateMonth = Mid$(recvQuickCustMsg.lastUpdateDate, 5, 2)
  frmInternalCustOpen.txtUpdateYear = Mid$(recvQuickCustMsg.lastUpdateDate, 1, 4)
  frmInternalCustOpen.txtUpdateBranch = recvQuickCustMsg.lastUpdateBranch
  frmInternalCustOpen.txtUpdateMakerId = recvQuickCustMsg.lastUpdateMakerId
  frmInternalCustOpen.txtUpdateSupervisorId = recvQuickCustMsg.lastUpdateSupervisorId

End Sub
''Added by Mohit on 12-Dec-2006 under Quick Pension Customer opening
Public Sub fillFrmQuickPenCustOpen()
    Dim tCode As String, i As Integer, mQry As String
   
    frmQuickPenCustOpen.txtCustomerNo = recvQuickCustMsg.customerNo
    'frminternalcustopen.txtBranchCode = recvquickcustmsg.custBranchCode
    
    tCode = recvQuickCustMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " + _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmQuickPenCustOpen.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmQuickPenCustOpen.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmQuickPenCustOpen.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvQuickCustMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmQuickPenCustOpen.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmQuickPenCustOpen.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmQuickPenCustOpen.cmbAltBrCode.text = "0000-NONE"
    End If
    
    tCode = recvQuickCustMsg.idType
    If tCode <> "" Then
        For i = 0 To frmQuickPenCustOpen.cmbIdType.ListCount
            If Mid(frmQuickPenCustOpen.cmbIdType.List(i), 1, 1) = tCode Then
               frmQuickPenCustOpen.cmbIdType.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmQuickPenCustOpen.cmbIdType.ListIndex = -1
    End If
    If i > frmQuickPenCustOpen.cmbIdType.ListCount Then
       frmQuickPenCustOpen.cmbIdType.ListIndex = -1
'       frminternalcustopen.cmbIdType.AddItem tCode & "-Not defined in local"
'       frminternalcustopen.cmbIdType.ListIndex = frminternalcustopen.cmbIdType.ListCount - 1
    End If
    frmQuickPenCustOpen.txtIdNo = recvQuickCustMsg.idNo
    
    If recvQuickCustMsg.preferredLang = "0" Or _
       recvQuickCustMsg.preferredLang = " " Then
       frmQuickPenCustOpen.optLangArabic.Value = True
    Else
       frmQuickPenCustOpen.optLangEnglish.Value = True
    End If
         
    tCode = Mid$(recvQuickCustMsg.nationality, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmQuickPenCustOpen.cmbNationality.ListCount
            If Mid(frmQuickPenCustOpen.cmbNationality.List(i), 1, 3) = tCode Then
               frmQuickPenCustOpen.cmbNationality.ListIndex = i  ' RTrim(frmQuickPenCustOpen.cmbNationality.List(i))
               Exit For
            End If
        Next i
    Else
        frmQuickPenCustOpen.cmbNationality.ListIndex = -1
    End If
    If i > frmQuickPenCustOpen.cmbNationality.ListCount Then
       frmQuickPenCustOpen.cmbNationality.ListIndex = -1
       'frmQuickPenCustOpen.cmbNationality.Text = tCode & "-Not defined in local"
    End If
    
    tCode = Mid$(recvQuickCustMsg.titleCode, 1, 2)
    If tCode <> "" Then
        For i = 0 To frmQuickPenCustOpen.cmbTitle.ListCount
            If Mid$(frmQuickPenCustOpen.cmbTitle.List(i), 1, 2) = tCode Then
               frmQuickPenCustOpen.cmbTitle.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmQuickPenCustOpen.cmbTitle.ListIndex = -1
    End If
    If i > frmQuickPenCustOpen.cmbTitle.ListCount Then
       frmQuickPenCustOpen.cmbTitle.ListIndex = -1
       'frmQuickPenCustOpen.cmbTitle.Text = tCode & "-Not defined in local"
    End If
    frmQuickPenCustOpen.txtArabFirstName = recvQuickCustMsg.aFirstName
    frmQuickPenCustOpen.txtArabic2ndName = recvQuickCustMsg.a2ndName
    frmQuickPenCustOpen.txtArabic3rdName = recvQuickCustMsg.a3rdName
    frmQuickPenCustOpen.txtArabLastName = recvQuickCustMsg.aLastName
    frmQuickPenCustOpen.txtArabShortName = recvQuickCustMsg.aShortName
    
    If recvQuickCustMsg.sexCode = "0" Or _
       recvQuickCustMsg.sexCode = " " Then
       frmQuickPenCustOpen.optGenderMale.Value = True
    Else
       frmQuickPenCustOpen.optGenderFemale.Value = True
    End If
    
    tCode = Mid$(recvQuickCustMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmQuickPenCustOpen.cmbBusinessType.ListCount
            If Mid(frmQuickPenCustOpen.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmQuickPenCustOpen.cmbBusinessType.ListIndex = i ' RTrim(frmQuickPenCustOpen.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmQuickPenCustOpen.cmbBusinessType.ListIndex = -1
    End If
    If i > frmQuickPenCustOpen.cmbBusinessType.ListCount Then
       frmQuickPenCustOpen.cmbBusinessType.ListIndex = -1
      'frmCustomer.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    
  frmQuickPenCustOpen.cmbOpenDate = Mid$(recvQuickCustMsg.custOpenDate, 7, 2)
  frmQuickPenCustOpen.cmbOpenMonth = Mid$(recvQuickCustMsg.custOpenDate, 5, 2)
  frmQuickPenCustOpen.txtOpenYear = Mid$(recvQuickCustMsg.custOpenDate, 1, 4)
    
  frmQuickPenCustOpen.txtOpenBranch = recvQuickCustMsg.branchOpened
  frmQuickPenCustOpen.txtOpenMakerId = recvQuickCustMsg.openMakerId
  frmQuickPenCustOpen.txtOpenSupervisorId = recvQuickCustMsg.openSupervisorId
    
  frmQuickPenCustOpen.cmbUpdateDate = Mid$(recvQuickCustMsg.lastUpdateDate, 7, 2)
  frmQuickPenCustOpen.cmbUpdateMonth = Mid$(recvQuickCustMsg.lastUpdateDate, 5, 2)
  frmQuickPenCustOpen.txtUpdateYear = Mid$(recvQuickCustMsg.lastUpdateDate, 1, 4)
  frmQuickPenCustOpen.txtUpdateBranch = recvQuickCustMsg.lastUpdateBranch
  frmQuickPenCustOpen.txtUpdateMakerId = recvQuickCustMsg.lastUpdateMakerId
  frmQuickPenCustOpen.txtUpdateSupervisorId = recvQuickCustMsg.lastUpdateSupervisorId

End Sub

Public Sub fillFrmCustomer()

    Dim tCode As String, i As Integer, mQry As String
   
    frmCustomer.txtCustomerNo = recvSuperActionMsg.customerNo
    'frmCustomer.txtBranchCode = recvSuperActionMsg.custBranchCode
    
    tCode = recvSuperActionMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " + _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmCustomer.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmCustomer.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmCustomer.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvSuperActionMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmCustomer.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmCustomer.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmCustomer.cmbAltBrCode.text = "0000-NONE"
    End If
    If recvSuperActionMsg.custType = "0" Then
       frmCustomer.cmbCustomerType.ListIndex = 0
    ElseIf recvSuperActionMsg.custType = "1" Then
       frmCustomer.cmbCustomerType.ListIndex = 1
    ElseIf recvSuperActionMsg.custType = "2" Then
       frmCustomer.cmbCustomerType.ListIndex = 2
    Else
       frmCustomer.cmbCustomerType.ListIndex = -1
'       frmCustomer.cmbCustomerType.AddItem recvSuperActionMsg.custType & "-Not defined in local"
'       frmCustomer.cmbCustomerType.ListIndex = frmCustomer.cmbCustomerType.ListCount - 1
    End If
    If Len(RTrim(frmCustomer.cmbCustomerType.text)) <> 0 Then
       If Mid$(frmCustomer.cmbCustomerType.text, 1, 1) = "0" Then
          frmCustomer.lblDOBDateType.Caption = frmCustomerCaption(26, UserLang)
          frmCustomer.lblDateOfBirth.Caption = frmCustomerCaption(29, UserLang)
       Else
          frmCustomer.lblDOBDateType.Caption = frmCustomerCaption(71, UserLang)
          frmCustomer.lblDateOfBirth.Caption = frmCustomerCaption(72, UserLang)
       End If
    Else
       frmCustomer.lblDOBDateType.Caption = frmCustomerCaption(26, UserLang)
       frmCustomer.lblDateOfBirth.Caption = frmCustomerCaption(29, UserLang)
    End If
    tCode = recvSuperActionMsg.idType
    If tCode <> "" Then
        For i = 0 To frmCustomer.cmbIdType.ListCount
            If Mid(frmCustomer.cmbIdType.List(i), 1, 1) = tCode Then
               frmCustomer.cmbIdType.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmCustomer.cmbIdType.ListIndex = -1
    End If
    If i > frmCustomer.cmbIdType.ListCount Then
       frmCustomer.cmbIdType.ListIndex = -1
'       frmCustomer.cmbIdType.AddItem tCode & "-Not defined in local"
'       frmCustomer.cmbIdType.ListIndex = frmCustomer.cmbIdType.ListCount - 1
    End If
    frmCustomer.txtId = recvSuperActionMsg.idNo
    frmCustomer.cmbIdIssuedAt.text = recvSuperActionMsg.idIssuedAt
    If recvSuperActionMsg.idDateType = "0" Or _
       recvSuperActionMsg.idDateType = " " Then
       frmCustomer.optIdDateHijri.Value = True
       frmCustomer.txtIdIssueYear = Mid$(recvSuperActionMsg.idIssueDateH, 1, 4)
       frmCustomer.cmbIdIssueDate.text = Right$(recvSuperActionMsg.idIssueDateH, 2)
       frmCustomer.cmbIdIssueMonth.text = Mid$(recvSuperActionMsg.idIssueDateH, 5, 2)
       frmCustomer.txtIdExpiryYear = Mid$(recvSuperActionMsg.idExpiryDateH, 1, 4)
       frmCustomer.cmbIdExpiryDate.text = Right$(recvSuperActionMsg.idExpiryDateH, 2)
       frmCustomer.cmbIdExpiryMonth.text = Mid$(recvSuperActionMsg.idExpiryDateH, 5, 2)
    Else
       frmCustomer.optIdDateGregorian.Value = True
       frmCustomer.txtIdIssueYear = Mid$(recvSuperActionMsg.idIssueDateG, 1, 4)
       frmCustomer.cmbIdIssueDate.text = Right$(recvSuperActionMsg.idIssueDateG, 2)
       frmCustomer.cmbIdIssueMonth.text = Mid$(recvSuperActionMsg.idIssueDateG, 5, 2)
       frmCustomer.txtIdExpiryYear = Mid$(recvSuperActionMsg.idExpiryDateG, 1, 4)
       frmCustomer.cmbIdExpiryDate.text = Right$(recvSuperActionMsg.idExpiryDateG, 2)
       frmCustomer.cmbIdExpiryMonth.text = Mid$(recvSuperActionMsg.idExpiryDateG, 5, 2)
    End If
    
    If recvSuperActionMsg.preferredLang = "0" Or _
       recvSuperActionMsg.preferredLang = " " Then
       frmCustomer.optLangArabic.Value = True
    Else
       frmCustomer.optLangEnglish.Value = True
    End If
         
    tCode = Mid$(recvSuperActionMsg.nationality, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmCustomer.cmbNationality.ListCount
            If Mid(frmCustomer.cmbNationality.List(i), 1, 3) = tCode Then
               frmCustomer.cmbNationality.ListIndex = i  ' RTrim(frmCustomer.cmbNationality.List(i))
               Exit For
            End If
        Next i
    Else
        frmCustomer.cmbNationality.ListIndex = -1
    End If
    If i > frmCustomer.cmbNationality.ListCount Then
       frmCustomer.cmbNationality.ListIndex = -1
       'frmCustomer.cmbNationality.Text = tCode & "-Not defined in local"
    End If
    
    tCode = Mid$(recvSuperActionMsg.titleCode, 1, 2)
    If tCode <> "" Then
        For i = 0 To frmCustomer.cmbTitle.ListCount
            If Mid$(frmCustomer.cmbTitle.List(i), 1, 2) = tCode Then
               frmCustomer.cmbTitle.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmCustomer.cmbTitle.ListIndex = -1
    End If
    If i > frmCustomer.cmbTitle.ListCount Then
       frmCustomer.cmbTitle.ListIndex = -1
       'frmCustomer.cmbTitle.Text = tCode & "-Not defined in local"
    End If
    frmCustomer.txtArabFirstName = recvSuperActionMsg.aFirstName
    frmCustomer.txtArabic2ndName = recvSuperActionMsg.a2ndName
    frmCustomer.txtArabic3rdName = recvSuperActionMsg.a3rdName
    frmCustomer.txtArabLastName = recvSuperActionMsg.aLastName
    frmCustomer.txtArabShortName = recvSuperActionMsg.aShortName
    frmCustomer.txtEngFirstName = recvSuperActionMsg.eFirstName
    frmCustomer.txtEnglish2ndName = recvSuperActionMsg.e2ndName
    frmCustomer.txtEnglish3rdName = recvSuperActionMsg.e3rdName
    frmCustomer.txtEngLastName = recvSuperActionMsg.eLastName
    frmCustomer.txtEngShortName = recvSuperActionMsg.eShortName
    
    If recvSuperActionMsg.dobDateType = "0" Or _
       recvSuperActionMsg.dobDateType = " " Then
       frmCustomer.optDOBHijri.Value = True
       frmCustomer.txtDobYear = Mid$(recvSuperActionMsg.dobDateH, 1, 4)
       frmCustomer.cmbDobDate.text = Mid$(recvSuperActionMsg.dobDateH, 7, 2)
       frmCustomer.cmbDobMonth.text = Mid$(recvSuperActionMsg.dobDateH, 5, 2)
    Else
       frmCustomer.optDOBGreg.Value = True
       frmCustomer.txtDobYear = Mid$(recvSuperActionMsg.dobDateG, 1, 4)
       frmCustomer.cmbDobDate.text = Mid$(recvSuperActionMsg.dobDateG, 7, 2)
       frmCustomer.cmbDobMonth.text = Mid$(recvSuperActionMsg.dobDateG, 5, 2)
    End If
    
    If recvSuperActionMsg.sexCode = "0" Or _
       recvSuperActionMsg.sexCode = " " Then
       frmCustomer.optGenderMale.Value = True
    Else
       frmCustomer.optGenderFemale.Value = True
    End If
    
    If recvSuperActionMsg.vipCode = "1" Then
       frmCustomer.optVipYes.Value = True
    Else
       frmCustomer.optVipNo.Value = True
    End If
    
    If recvSuperActionMsg.maritalStatus = "0" Or _
       recvSuperActionMsg.maritalStatus = " " Then
       frmCustomer.optMarried.Value = True
    ElseIf recvSuperActionMsg.maritalStatus = "1" Then
       frmCustomer.OptSingle.Value = True
    Else
       frmCustomer.optOthers.Value = True
    End If
    
    frmCustomer.txtDependents = recvSuperActionMsg.noOfDependents
    If recvSuperActionMsg.residentStatus = "0" Or _
       recvSuperActionMsg.residentStatus = " " Then
       frmCustomer.optResident.Value = True
    Else
       frmCustomer.optNonResident.Value = True
    End If
    
    tCode = Mid$(recvSuperActionMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmCustomer.cmbBusinessType.ListCount
            If Mid(frmCustomer.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmCustomer.cmbBusinessType.ListIndex = i ' RTrim(frmCustomer.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmCustomer.cmbBusinessType.ListIndex = -1
    End If
    If i > frmCustomer.cmbBusinessType.ListCount Then
       frmCustomer.cmbBusinessType.ListIndex = -1
      'frmCustomer.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    frmCustomer.txtCRnumber = recvSuperActionMsg.crNo
    frmCustomer.cmbCRIssuedCity.text = recvSuperActionMsg.crIssuedAt
    If recvSuperActionMsg.crIssuedDateType = "0" Then
       frmCustomer.optCRIssueDateHijri.Value = True
       frmCustomer.txtCrIssueYear = Mid$(recvSuperActionMsg.crIssueDateH, 1, 4)
       frmCustomer.cmbCrIssueMonth = Mid$(recvSuperActionMsg.crIssueDateH, 5, 2)
       frmCustomer.cmbCrIssuedate = Mid$(recvSuperActionMsg.crIssueDateH, 7, 2)
    Else
       frmCustomer.optCRIssueDateGreg.Value = True
       frmCustomer.txtCrIssueYear = Mid$(recvSuperActionMsg.crIssueDateG, 1, 4)
       frmCustomer.cmbCrIssueMonth = Mid$(recvSuperActionMsg.crIssueDateG, 5, 2)
       frmCustomer.cmbCrIssuedate = Mid$(recvSuperActionMsg.crIssueDateG, 7, 2)
    End If
    frmCustomer.txtOrgName1Arabic = recvSuperActionMsg.aOrgName1
    frmCustomer.txtOrgName2Arabic = recvSuperActionMsg.aOrgName2
    frmCustomer.txtOrgArabicShortName = recvSuperActionMsg.aOrgShortName
    frmCustomer.txtOrgName1English = recvSuperActionMsg.eOrgName1
    frmCustomer.txtOrgName2English = recvSuperActionMsg.eOrgName2
    frmCustomer.txtOrgEnglishShortName = recvSuperActionMsg.eOrgShortName
    frmCustomer.txtOrgAlphaSearch = recvSuperActionMsg.orgAlphaSearchCode
    frmCustomer.txtAddress1 = recvSuperActionMsg.address1
    frmCustomer.txtAddress2 = recvSuperActionMsg.address2
    frmCustomer.txtPOBox = recvSuperActionMsg.poBox
    frmCustomer.cmbCity.text = recvSuperActionMsg.cityName
    frmCustomer.txtPinCode = recvSuperActionMsg.zipCode
    
    tCode = Mid$(recvSuperActionMsg.country, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmCustomer.cmbCountry.ListCount
            If Mid(frmCustomer.cmbCountry.List(i), 1, 3) = tCode Then
               frmCustomer.cmbCountry.ListIndex = i 'RTrim(frmCustomer.cmbCountry.List(i))
               Exit For
            End If
        Next i
    Else
        frmCustomer.cmbCountry.ListIndex = -1
    End If
    If i > frmCustomer.cmbCountry.ListCount Then
        frmCustomer.cmbCountry.text = tCode & "- Not defined in local"
    End If
    If Len(RTrim(recvSuperActionMsg.telOffAreaCode)) <> 0 Or _
       Not updateAction Then
       frmCustomer.txtOffPhoneCityCode = recvSuperActionMsg.telOffAreaCode
    End If
    frmCustomer.txtOffPhoneNo = recvSuperActionMsg.telOffNo
    frmCustomer.txtOffPhoneExt = recvSuperActionMsg.telOffExt
    If Len(RTrim(recvSuperActionMsg.telHomeAreaCode)) <> 0 Or _
       Not updateAction Then
       frmCustomer.txtResPhoneCityCode = recvSuperActionMsg.telHomeAreaCode
    End If
    frmCustomer.txtResPhoneNo = recvSuperActionMsg.telHomeNo
    frmCustomer.txtResPhoneExt = recvSuperActionMsg.telHomeExt
    If Len(RTrim(recvSuperActionMsg.faxAreaCode)) <> 0 Or _
       Not updateAction Then
       frmCustomer.txtFaxCityCode = recvSuperActionMsg.faxAreaCode
    End If
    frmCustomer.txtFaxNo = recvSuperActionMsg.faxNo
    frmCustomer.txtFaxExt = recvSuperActionMsg.faxExt
    frmCustomer.txtMobileAreaCode = Mid$(recvSuperActionMsg.mobileNo, 1, 2)
    frmCustomer.txtMobileNo = Mid$(recvSuperActionMsg.mobileNo, 3)
    frmCustomer.txtPagerNo = recvSuperActionMsg.pagerNo
    frmCustomer.txtEmailAddress = recvSuperActionMsg.eMail
End Sub

Public Sub fillFrmCustomer2()
  Dim tCode As String
  Dim i As Integer
      
  tCode = recvSuperActionMsg.educationCode
  If tCode <> "" Then
      For i = 0 To frmCustomer2.cmbEducation.ListCount
          If Mid(frmCustomer2.cmbEducation.List(i), 3, 2) = tCode Then
             frmCustomer2.cmbEducation.ListIndex = i
             Exit For
          End If
      Next i
  Else
      frmCustomer2.cmbEducation.ListIndex = -1
  End If
  If i > frmCustomer2.cmbEducation.ListCount Then
     frmCustomer2.cmbEducation.ListIndex = -1
'      frmCustomer2.cmbEducation.AddItem tCode & "- Not defined in local"
'      frmCustomer2.cmbEducation.ListIndex = frmCustomer2.cmbEducation.ListCount - 1
  End If
  
  tCode = recvSuperActionMsg.professionCode
  If tCode <> "" Then
    For i = 0 To frmCustomer2.cmbProfession.ListCount
        If Mid(frmCustomer2.cmbProfession.List(i), 3, 2) = tCode Then
           frmCustomer2.cmbProfession.ListIndex = i
           Exit For
        End If
    Next i
  Else
    frmCustomer2.cmbProfession.ListIndex = -1
  End If
  If i > frmCustomer2.cmbProfession.ListCount Then
     frmCustomer2.cmbProfession.ListIndex = -1
'     frmCustomer2.cmbProfession.AddItem tCode & "- Not defined in local"
'     frmCustomer2.cmbProfession.ListIndex = frmCustomer2.cmbProfession.ListCount - 1
  End If
  
  tCode = recvSuperActionMsg.positionCode
  If tCode <> "" Then
     For i = 0 To frmCustomer2.cmbPosition.ListCount
         If Mid(frmCustomer2.cmbPosition.List(i), 3, 2) = tCode Then
            frmCustomer2.cmbPosition.ListIndex = i
            Exit For
         End If
     Next i
  Else
     frmCustomer2.cmbPosition.ListIndex = -1
  End If
  If i > frmCustomer2.cmbPosition.ListCount Then
     frmCustomer2.cmbPosition.ListIndex = -1
'     frmCustomer2.cmbPosition.AddItem tCode & "- Not defined in local"
'     frmCustomer2.cmbPosition.ListIndex = frmCustomer2.cmbPosition.ListCount - 1
  End If
  
  tCode = recvSuperActionMsg.monthlyIncome
  If tCode <> "" Then
     For i = 0 To frmCustomer2.cmbMonthlyIncome.ListCount
         If Mid(frmCustomer2.cmbMonthlyIncome.List(i), 3, 2) = tCode Then
            frmCustomer2.cmbMonthlyIncome.ListIndex = i
            Exit For
         End If
     Next i
  Else
     frmCustomer2.cmbMonthlyIncome.ListIndex = -1
  End If
  If i > frmCustomer2.cmbMonthlyIncome.ListCount Then
     frmCustomer2.cmbMonthlyIncome.ListIndex = -1
'     frmCustomer2.cmbMonthlyIncome.AddItem tCode & "- Not defined in local"
'     frmCustomer2.cmbMonthlyIncome.ListIndex = frmCustomer2.cmbMonthlyIncome.ListCount - 1
  End If
  
  tCode = recvSuperActionMsg.segmentation
  If Len(Trim(tCode)) = 0 Then
     tCode = "0"
  End If
  
  For i = 0 To frmCustomer2.cmbSegmentation.ListCount
      If Mid(frmCustomer2.cmbSegmentation.List(i), 1, 1) = tCode Then
         frmCustomer2.cmbSegmentation.ListIndex = i
         Exit For
      End If
  Next i
  If i > frmCustomer2.cmbSegmentation.ListCount Then
     frmCustomer2.cmbSegmentation.AddItem tCode & "- Not defined in local"
     frmCustomer2.cmbSegmentation.ListIndex = frmCustomer2.cmbSegmentation.ListCount - 1
  End If
  
  tCode = recvSuperActionMsg.ownerShip
  If Mid$(tCode, 1, 1) = "1" Then
     frmCustomer2.chkRentedHouse.Value = 1
  Else
     frmCustomer2.chkRentedHouse.Value = 0
  End If
  If Mid$(tCode, 2, 1) = "1" Then
     frmCustomer2.chkOwnHouse.Value = 1
  Else
     frmCustomer2.chkOwnHouse.Value = 0
  End If
  If Mid$(tCode, 3, 1) = "1" Then
     frmCustomer2.chkCompanyAcc.Value = 1
  Else
     frmCustomer2.chkCompanyAcc.Value = 0
  End If
  If Mid$(tCode, 4, 1) = "1" Then
     frmCustomer2.chkRentedCar.Value = 1
  Else
     frmCustomer2.chkRentedCar.Value = 0
  End If
  If Mid$(tCode, 5, 1) = "1" Then
     frmCustomer2.chkOwnCar.Value = 1
  Else
     frmCustomer2.chkOwnCar.Value = 0
  End If
  If Mid$(tCode, 6, 1) = "1" Then
     frmCustomer2.chkCompanyTransport.Value = 1
  Else
     frmCustomer2.chkCompanyTransport.Value = 0
  End If
  
  frmCustomer2.txtEmployerName = recvSuperActionMsg.employerName
  frmCustomer2.txtDepartment = recvSuperActionMsg.department
  frmCustomer2.txtEmployerPOBox = recvSuperActionMsg.employerPoBox
  frmCustomer2.txtEmployerCity = recvSuperActionMsg.employerCity
  frmCustomer2.txtEmployerZipcode = recvSuperActionMsg.employerZipCode
  
  tCode = recvSuperActionMsg.documents
  If Mid$(tCode, 1, 1) = "1" Then
     frmCustomer2.chkDocSignature.Value = 1
  Else
     frmCustomer2.chkDocSignature.Value = 0
  End If
  If Mid$(tCode, 2, 1) = "1" Then
     frmCustomer2.chkdocIqamacopy.Value = 1
  Else
     frmCustomer2.chkdocIqamacopy.Value = 0
  End If
  If Mid$(tCode, 3, 1) = "1" Then
     frmCustomer2.chkDocregistrationCert.Value = 1
  Else
     frmCustomer2.chkDocregistrationCert.Value = 0
  End If
  If Mid$(tCode, 4, 1) = "1" Then
     frmCustomer2.chkEstablishContract.Value = 1
  Else
     frmCustomer2.chkEstablishContract.Value = 0
  End If
  If Mid$(tCode, 5, 1) = "1" Then
     frmCustomer2.chkDocPowerOfAttorney.Value = 1
  Else
     frmCustomer2.chkDocPowerOfAttorney.Value = 0
  End If
  If Mid$(tCode, 6, 1) = "1" Then
     'frmCustomer2.chkDocNonResidentAcAgreement.Value = 1
     frmCustomer2.chkSalaryTransfer.Value = 1
  Else
     'frmCustomer2.chkDocNonResidentAcAgreement.Value = 0
     frmCustomer2.chkSalaryTransfer.Value = 0
  End If
  If Mid$(tCode, 7, 1) = "1" Then
     frmCustomer2.chkJointAcAgreement.Value = 1
  Else
     frmCustomer2.chkJointAcAgreement.Value = 0
  End If
  
  frmCustomer2.txtDocOthers = recvSuperActionMsg.documentOther
   
  tCode = recvSuperActionMsg.packagedAcc
  If Len(Trim(tCode)) = 0 Then
     tCode = "0"
  End If
  For i = 0 To frmCustomer2.cmbPackageAcc.ListCount
      If Mid(frmCustomer2.cmbPackageAcc.List(i), 1, 1) = tCode Then
         frmCustomer2.cmbPackageAcc.ListIndex = i
         Exit For
      End If
  Next i
  If i > frmCustomer2.cmbPackageAcc.ListCount Then
     frmCustomer2.cmbPackageAcc.text = tCode & "- Not defined in local"
  End If

  If recvSuperActionMsg.internetBankAcc = "1" Then
     frmCustomer2.optInternetYes.Value = True
  Else
     frmCustomer2.optInternetNo.Value = True
  End If
  
  If recvSuperActionMsg.custAdviceFlag = "1" Then
     frmCustomer2.optCustAdviceYes.Value = True
  Else
     frmCustomer2.optCustAdviceNo.Value = True
  End If
    
  If recvSuperActionMsg.singleJointAcc = "0" Or _
     recvSuperActionMsg.singleJointAcc = " " Then
     frmCustomer2.OptSingle.Value = True
     frmCustomer2.cmdJointAcc.Enabled = False
  Else
     frmCustomer2.optJoint.Value = True
     frmCustomer2.cmdJointAcc.Enabled = True
  End If
  
  If recvSuperActionMsg.signatureNature = "0" Or _
     recvSuperActionMsg.signatureNature = " " Then
     frmCustomer2.optSignSingle.Value = True
  Else
     frmCustomer2.optSignJoint.Value = True
  End If
  
'  If searchAction Or updateAction Or _
'     recvSuperActionMsg.newOrUpdate = "U" Then
'     Exit Sub
'  End If
  
  ' Current acc Info
  If Len(RTrim(recvSuperActionMsg.currentAccInfo)) <> 0 Then
     If Mid$(recvSuperActionMsg.currentAccInfo, 11, 1) <> "1" Then
        frmCustomer2.optCurrentAcYes.Value = True
        tCode = Mid$(recvSuperActionMsg.currentAccInfo, 1, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmCustomer2.cmbCurrentAcCurrency.ListCount
               If Mid(frmCustomer2.cmbCurrentAcCurrency.List(i), 1, 2) = tCode Then
                  frmCustomer2.cmbCurrentAcCurrency.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           frmCustomer2.cmbCurrentAcCurrency.ListIndex = -1
        End If
        If i > frmCustomer2.cmbCurrentAcCurrency.ListCount Then
           frmCustomer2.cmbCurrentAcCurrency.AddItem tCode & "-Not defined in local"
           frmCustomer2.cmbCurrentAcCurrency.ListIndex = frmCustomer2.cmbCurrentAcCurrency.ListCount - 1
        End If
        tCode = Mid$(recvSuperActionMsg.currentAccInfo, 6, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmCustomer2.cmbCurrentAcStatus.ListCount
              If Mid(frmCustomer2.cmbCurrentAcStatus.List(i), 1, 2) = tCode Then
                 frmCustomer2.cmbCurrentAcStatus.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmCustomer2.cmbCurrentAcStatus.ListIndex = -1
        End If
        If i > frmCustomer2.cmbCurrentAcStatus.ListCount Then
           frmCustomer2.cmbCurrentAcStatus.AddItem tCode & "-Not defined in local"
           frmCustomer2.cmbCurrentAcStatus.ListIndex = frmCustomer2.cmbCurrentAcStatus.ListCount - 1
        End If
     
        tCode = Mid$(recvSuperActionMsg.currentAccInfo, 8, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmCustomer2.cmbCurrentAcStmtFreq.ListCount
               If Mid(frmCustomer2.cmbCurrentAcStmtFreq.List(i), 1, 2) = tCode Then
                  frmCustomer2.cmbCurrentAcStmtFreq.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           frmCustomer2.cmbCurrentAcStmtFreq.ListIndex = -1
        End If
        If i > frmCustomer2.cmbCurrentAcStmtFreq.ListCount Then
           frmCustomer2.cmbCurrentAcStmtFreq.AddItem tCode & "-Not defined in local"
           frmCustomer2.cmbCurrentAcStmtFreq.ListIndex = frmCustomer2.cmbCurrentAcStmtFreq.ListCount - 1
        End If
        If Mid$(recvSuperActionMsg.currentAccInfo, 10, 1) = "1" Then
           frmCustomer2.optCurrentAcCheckBookYes.Value = True
        Else
           frmCustomer2.optCurrentAcCheckBookNo.Value = True
        End If
    End If
  Else
     frmCustomer2.optCurrentAcNo.Value = True
  End If
     

  ' Savings Acc info
  If Len(RTrim(recvSuperActionMsg.savingsAccInfo)) <> 0 Then
     If Mid$(recvSuperActionMsg.savingsAccInfo, 11, 1) <> "1" Then
        frmCustomer2.optSavingAcYes.Value = True
        tCode = Mid$(recvSuperActionMsg.savingsAccInfo, 1, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmCustomer2.cmbSavingAcCurrency.ListCount
              If Mid(frmCustomer2.cmbSavingAcCurrency.List(i), 1, 2) = tCode Then
                 frmCustomer2.cmbSavingAcCurrency.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmCustomer2.cmbSavingAcCurrency.ListIndex = -1
        End If
        If i > frmCustomer2.cmbSavingAcCurrency.ListCount Then
           frmCustomer2.cmbSavingAcCurrency.AddItem tCode & "-Not defined in local"
           frmCustomer2.cmbSavingAcCurrency.ListIndex = frmCustomer2.cmbSavingAcCurrency.ListCount - 1
        End If
        
        tCode = Mid$(recvSuperActionMsg.savingsAccInfo, 6, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmCustomer2.cmbSavingAcStatus.ListCount
              If Mid(frmCustomer2.cmbSavingAcStatus.List(i), 1, 2) = tCode Then
                 frmCustomer2.cmbSavingAcStatus.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmCustomer2.cmbSavingAcStatus.ListIndex = -1
        End If
        If i > frmCustomer2.cmbSavingAcStatus.ListCount Then
           frmCustomer2.cmbSavingAcStatus.AddItem tCode & "-Not defined in local"
           frmCustomer2.cmbSavingAcStatus.ListIndex = frmCustomer2.cmbSavingAcStatus.ListCount - 1
        End If
        
        tCode = Mid$(recvSuperActionMsg.savingsAccInfo, 8, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmCustomer2.cmbSavingAcStmtFreq.ListCount
              If Mid(frmCustomer2.cmbSavingAcStmtFreq.List(i), 1, 2) = tCode Then
                 frmCustomer2.cmbSavingAcStmtFreq.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmCustomer2.cmbSavingAcStmtFreq.ListIndex = -1
        End If
        If i > frmCustomer2.cmbSavingAcStmtFreq.ListCount Then
            frmCustomer2.cmbSavingAcStmtFreq.AddItem tCode & "-Not defined in local"
            frmCustomer2.cmbSavingAcStmtFreq.ListIndex = frmCustomer2.cmbSavingAcStmtFreq.ListCount - 1
        End If
    End If
  Else
     frmCustomer2.optSavingAcNo.Value = True
  End If

  ' Other Acc Info
  If Len(RTrim(recvSuperActionMsg.otherAccInfo)) <> 0 Then
     If Mid$(recvSuperActionMsg.otherAccInfo, 11, 1) <> "1" Then
         tCode = Mid$(recvSuperActionMsg.otherAccInfo, 3, 3)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmCustomer2.cmbOtherAccount.ListCount
               If Mid(frmCustomer2.cmbOtherAccount.List(i), 1, 3) = tCode Then
                  frmCustomer2.cmbOtherAccount.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmCustomer2.cmbOtherAccount.ListIndex = -1
         End If
         If i > frmCustomer2.cmbOtherAccount.ListCount Then
            frmCustomer2.cmbOtherAccount.AddItem tCode & "-Not defined in local"
            frmCustomer2.cmbOtherAccount.ListIndex = frmCustomer2.cmbOtherAccount.ListCount - 1
         End If
         
         tCode = Mid$(recvSuperActionMsg.otherAccInfo, 1, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmCustomer2.cmbOtherAcCurrency.ListCount
               If Mid(frmCustomer2.cmbOtherAcCurrency.List(i), 1, 2) = tCode Then
                  frmCustomer2.cmbOtherAcCurrency.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmCustomer2.cmbOtherAcCurrency.ListIndex = -1
         End If
         If i > frmCustomer2.cmbOtherAcCurrency.ListCount Then
            frmCustomer2.cmbOtherAcCurrency.AddItem tCode & "-Not defined in local"
            frmCustomer2.cmbOtherAcCurrency.ListIndex = frmCustomer2.cmbOtherAcCurrency.ListCount - 1
         End If
         
         tCode = Mid$(recvSuperActionMsg.otherAccInfo, 6, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmCustomer2.cmbOtherAcStatus.ListCount
               If Mid(frmCustomer2.cmbOtherAcStatus.List(i), 1, 2) = tCode Then
                  frmCustomer2.cmbOtherAcStatus.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmCustomer2.cmbOtherAcStatus.ListIndex = -1
         End If
         If i > frmCustomer2.cmbOtherAcStatus.ListCount Then
            frmCustomer2.cmbOtherAcStatus.AddItem tCode & "-Not defined in local"
            frmCustomer2.cmbOtherAcStatus.ListIndex = frmCustomer2.cmbOtherAcStatus.ListCount - 1
         End If
         
         tCode = Mid$(recvSuperActionMsg.otherAccInfo, 8, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmCustomer2.cmbOtherAcStmtFreq.ListCount
               If Mid(frmCustomer2.cmbOtherAcStmtFreq.List(i), 1, 2) = tCode Then
                  frmCustomer2.cmbOtherAcStmtFreq.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmCustomer2.cmbOtherAcStmtFreq.ListIndex = -1
         End If
         If i > frmCustomer2.cmbOtherAcStmtFreq.ListCount Then
            frmCustomer2.cmbOtherAcStmtFreq.AddItem tCode & "-Not defined in local"
            frmCustomer2.cmbOtherAcStmtFreq.ListIndex = frmCustomer2.cmbOtherAcStmtFreq.ListCount - 1
         End If
         If Mid$(recvSuperActionMsg.otherAccInfo, 10, 1) = "1" Then
            frmCustomer2.optOtherAcCheckBookYes.Value = True
         Else
            frmCustomer2.optOtherAcCheckBookNo.Value = True
         End If
    End If
  End If
    
'  If recvSuperActionMsg.electronCardRequired = "1" Then
'     frmCustomer2.optPrimaryElectronCardYes.Value = True
'  Else
'     frmCustomer2.optPrimaryElectronCardNo.Value = True
'  End If
'
'  frmCustomer2.txtPrimaryElectronCardName = _
'           UCase(recvSuperActionMsg.electronCardName)
'
'  If recvSuperActionMsg.elctronSuppRequired = "1" Then
'     frmCustomer2.optSecondaryElectronCardYes.Value = True
'  Else
'     frmCustomer2.optSecondaryElectronCardNo.Value = True
'  End If
'
'  frmCustomer2.txtSecondaryElectronCardName = _
'         UCase(recvSuperActionMsg.electronSuppName)
 
   If recvSuperActionMsg.updatedForSama = "1" Then
      frmCustomer2.optSamaUpdYes.Value = True
   Else
      frmCustomer2.optSamaUpdNo.Value = True
   End If
   
   frmCustomer2.txtRelationshipManager = recvSuperActionMsg.relationshipManager
   frmCustomer2.txtGeneralMemo = recvSuperActionMsg.generalMemo
            
  If recvSuperActionMsg.electronIntlRequired = "1" Then
     frmCustomer2.optPrimaryElectronIntlCardYes.Value = True
  Else
     frmCustomer2.optPrimaryElectronIntlCardNo.Value = True
  End If
  frmCustomer2.txtPrimaryElectronIntlCardName = _
            UCase(recvSuperActionMsg.electronIntlName)
    
  If recvSuperActionMsg.electronIntlSuppRequired = "1" Then
     frmCustomer2.optSecondaryElectronIntlCardYes.Value = True
  Else
     frmCustomer2.optSecondaryElectronIntlCardNo.Value = True
  End If
   
  frmCustomer2.txtSecondaryElectronIntlCardName = _
             UCase(recvSuperActionMsg.electronIntlSuppName)
   
  If recvSuperActionMsg.deliveryToBranchOrPO = "C" Or _
     recvSuperActionMsg.deliveryToBranchOrPO = "B" Then
     frmCustomer2.optCardDeliveredToBranch.Value = True
  ElseIf recvSuperActionMsg.deliveryToBranchOrPO = "R" Then
     frmCustomer2.optCardDeliveredToReqBranch.Value = True
  Else
     frmCustomer2.optCardDeliveredToPOBox.Value = True
  End If
  frmCustomer2.txtDeliveryAddr1 = recvSuperActionMsg.deliveryAddress1
  frmCustomer2.txtDeliveryAddr2 = recvSuperActionMsg.deliveryAddress2
  frmCustomer2.txtDeliveryPOBox = recvSuperActionMsg.deliveryPoBox
  frmCustomer2.cmbDeliveryCity.text = recvSuperActionMsg.deliveryCity
  frmCustomer2.txtDeliveryZipcode = recvSuperActionMsg.deliveryZip
End Sub
Public Function isleap(tYear As Integer) As Boolean
   If tYear Mod 4 = 0 And tYear Mod 100 > 0 Or tYear Mod 400 = 0 Then
      isleap = True
   Else
      isleap = False
   End If
End Function
Public Function validDate(tDate As String) As Boolean
   ' tDate should be in the format YYYYMMDD
   Dim mthArray(13) As Integer
   Dim s As String
   On Error GoTo err_handler
   mthArray(1) = 31
   mthArray(2) = 28
   mthArray(3) = 31
   mthArray(4) = 30
   mthArray(5) = 31
   mthArray(6) = 30
   mthArray(7) = 31
   mthArray(8) = 31
   mthArray(9) = 30
   mthArray(10) = 31
   mthArray(11) = 30
   mthArray(12) = 31
   
   If (Mid$(tDate, 5, 2) < 1 Or Mid$(tDate, 5, 2) > 13) Or _
      (Mid$(tDate, 7, 2) < 1 Or Mid$(tDate, 7, 2) > 31) Then
      validDate = False
      Exit Function
   End If
   s = "1"
   If isleap(CInt(Mid$(tDate, 1, 4))) Then
      mthArray(2) = 29
   Else
      mthArray(2) = 28
   End If
   s = "2"
   If CInt(Mid$(tDate, 7, 2)) > mthArray(CInt(Mid$(tDate, 5, 2))) Then
      validDate = False
   Else
      validDate = True
   End If
   Exit Function
err_handler:
   LogData "Unexpected error  " + str(Err.Number) + "  " + Err.Description + "  occured in line " + s + " [validDate()]"
   Resume Next
End Function
Public Function validatefrmCustomer() As Integer
     Dim tIssueDate As String, tDob As String, tCrDate As String
     Dim tExpiryDate As String
     Dim tCode As String
     Dim tmpCode As String
     Dim mQry As String
     Dim i As Integer
     
     validatefrmCustomer = 0
     If Len(RTrim(frmCustomer.cmbCustomerType.text)) = 0 Then
        MsgBox errSpaceCustomerType(UserLang)
        frmCustomer.cmbCustomerType.SetFocus
        validatefrmCustomer = 1
        Exit Function
     Else
        validatefrmCustomer = 0
     End If
     
     If Len(RTrim(Mid$(frmCustomer.cmbBranchCode, 1, 4))) = 0 Then
        MsgBox errSpaceBranchCode(UserLang)
        validatefrmCustomer = 1
        Exit Function
     Else
        validatefrmCustomer = 0
     End If
     
     mQry = "select realorpseudo from branchinfo where branchcode = '" & Mid$(frmCustomer.cmbBranchCode, 1, 4) & "'"
     Set rs = db.OpenRecordset(mQry)
     If rs.recordCount > 0 Then
        tmpCode = rs(0)
     Else
        tmpCode = "1" 'if error occured in executing the query, then move as real branch
     End If
                
     tCode = Mid$(frmCustomer.cmbAltBrCode, 1, 4)
     If tmpCode = "0" Or tmpCode = "2" Then
        If tCode = "0000" Then
           MsgBox errInvalidAltBrCode(UserLang)
           frmCustomer.cmbAltBrCode.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
     End If
             
     For i = 0 To frmCustomer.cmbAltBrCode.ListCount
         If Mid$(frmCustomer.cmbAltBrCode.List(i), 1, 4) = tCode Then
            frmCustomer.cmbAltBrCode.ListIndex = i
            Exit For
         End If
     Next i
     
     If i > frmCustomer.cmbAltBrCode.ListCount Then
         MsgBox errInvalidAltBrCode(UserLang) '"Alternative Branch Code should be a real branch...Please re-enter.."
         frmCustomer.cmbAltBrCode.SetFocus
         validatefrmCustomer = 1
         Exit Function
      Else
         validatefrmCustomer = 0
      End If
          
     If Mid$(frmCustomer.cmbCustomerType.text, 1, 1) = "0" Then
        If Len(RTrim(frmCustomer.cmbIdType.text)) = 0 Then
           MsgBox errSpaceIdType(UserLang)
           frmCustomer.cmbIdType.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        
        If Len(RTrim(frmCustomer.txtId)) = 0 Then
           MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
           frmCustomer.txtId.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        
        If Mid$(frmCustomer.cmbIdType.text, 1, 1) = "I" Or _
           Mid$(frmCustomer.cmbIdType.text, 1, 1) = "Q" Then
           If Len(Trim(frmCustomer.txtId)) <> 10 Then
              MsgBox errInvalidId(UserLang)
              frmCustomer.txtId.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
        End If
        
        If frmCustomer.optLangArabic.Value = True Then
           If Len(RTrim(frmCustomer.txtArabFirstName)) = 0 And _
              Len(RTrim(frmCustomer.txtArabic2ndName)) = 0 And _
              Len(RTrim(frmCustomer.txtArabic3rdName)) = 0 And _
              Len(RTrim(frmCustomer.txtArabLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 frmCustomer.txtArabFirstName.SetFocus
                 validatefrmCustomer = 1
                 Exit Function
           Else
                 validatefrmCustomer = 0
           End If
           
           If Len(RTrim(frmCustomer.txtArabShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmCustomer.txtArabShortName.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
        Else
           If Len(RTrim(frmCustomer.txtEngFirstName)) = 0 And _
              Len(RTrim(frmCustomer.txtEnglish2ndName)) = 0 And _
              Len(RTrim(frmCustomer.txtEnglish3rdName)) = 0 And _
              Len(RTrim(frmCustomer.txtEngLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 frmCustomer.txtEngFirstName.SetFocus
                 validatefrmCustomer = 1
                 Exit Function
           Else
                 validatefrmCustomer = 0
           End If
           
           If Len(RTrim(frmCustomer.txtEngShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmCustomer.txtEngShortName.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
        End If
        
        If Len(RTrim(frmCustomer.cmbIdIssueDate.text)) = 0 Or _
           Len(RTrim(frmCustomer.cmbIdIssueMonth.text)) = 0 Or _
           Len(RTrim(frmCustomer.txtIdIssueYear)) = 0 Then
           MsgBox errSpaceIssueDate(UserLang)
           frmCustomer.cmbIdIssueDate.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        
        If Len(RTrim(frmCustomer.cmbIdExpiryDate.text)) = 0 Or _
           Len(RTrim(frmCustomer.cmbIdExpiryMonth.text)) = 0 Or _
           Len(RTrim(frmCustomer.txtIdExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           frmCustomer.cmbIdExpiryDate.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        
        tIssueDate = CStr(frmCustomer.txtIdIssueYear) & _
                     CStr(frmCustomer.cmbIdIssueMonth.text) & _
                     CStr(frmCustomer.cmbIdIssueDate.text)
        tExpiryDate = CStr(frmCustomer.txtIdExpiryYear) & _
                      CStr(frmCustomer.cmbIdExpiryMonth.text) & _
                      CStr(frmCustomer.cmbIdExpiryDate.text)
                      
        If frmCustomer.optIdDateGregorian.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              frmCustomer.cmbIdIssueDate.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
           
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              frmCustomer.cmbIdExpiryDate.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
        End If
                     
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           frmCustomer.txtIdExpiryYear.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        
        If Len(RTrim(frmCustomer.cmbIdIssuedAt.text)) = 0 Then
           MsgBox errSpaceIdIssuedAt(UserLang)
           frmCustomer.cmbIdIssuedAt.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        
        If Mid$(frmCustomer.cmbNationality, 1, 3) = "001" Then
           If Mid$(frmCustomer.cmbIdType, 1, 1) = "Q" Or _
              Mid$(frmCustomer.cmbIdType, 1, 1) = "O" Then
              MsgBox errInvalidNationality(UserLang)
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
        Else
           If Mid$(frmCustomer.cmbIdType, 1, 1) = "I" Or _
              Mid$(frmCustomer.cmbIdType, 1, 1) = "H" Then
              MsgBox errInvalidNationality(UserLang)
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
        End If
        
    Else  ' customer type is corporate or commercial
        If Len(RTrim(frmCustomer.txtCRnumber)) = 0 Then
           MsgBox errSpaceCR(UserLang) ' "CR Number cannot be spaces...Please enter..."
           frmCustomer.txtCRnumber.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        
        If Len(RTrim(frmCustomer.cmbCRIssuedCity.text)) = 0 Then
           MsgBox errSpaceIdIssuedAt(UserLang)
           frmCustomer.cmbCRIssuedCity.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        
        If Len(RTrim(frmCustomer.cmbCrIssuedate.text)) = 0 Or _
           Len(RTrim(frmCustomer.cmbCrIssueMonth.text)) = 0 Or _
           Len(RTrim(frmCustomer.txtCrIssueYear.text)) = 0 Then
           MsgBox errSpaceCrIssueDate(UserLang)
           frmCustomer.cmbCrIssuedate.SetFocus
           validatefrmCustomer = 1
           Exit Function
        Else
           validatefrmCustomer = 0
        End If
        tCrDate = CStr(frmCustomer.txtCrIssueYear) + _
                  CStr(frmCustomer.cmbCrIssueMonth.text) + _
                  CStr(frmCustomer.cmbCrIssuedate.text)
                  
        If frmCustomer.optCRIssueDateGreg.Value = True Then
           If Not validDate(tCrDate) Then
              MsgBox errInvalidDate(UserLang)
              frmCustomer.cmbCrIssuedate.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
        End If
       
        If frmCustomer.optLangArabic.Value = True Then
           If Len(RTrim(frmCustomer.txtOrgName1Arabic)) = 0 And _
              Len(RTrim(frmCustomer.txtOrgName2Arabic)) = 0 Then
              MsgBox errSpaceNames(UserLang)
              frmCustomer.txtOrgName1Arabic.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
           
           If Len(RTrim(frmCustomer.txtOrgArabicShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmCustomer.txtOrgArabicShortName.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
       Else
           If Len(RTrim(frmCustomer.txtOrgName1English)) = 0 And _
              Len(RTrim(frmCustomer.txtOrgName2English)) = 0 Then
              MsgBox errSpaceNames(UserLang)
              frmCustomer.txtOrgName1English.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
           
           If Len(RTrim(frmCustomer.txtOrgEnglishShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmCustomer.txtOrgEnglishShortName.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
           
           If Len(RTrim(frmCustomer.txtOrgAlphaSearch)) = 0 Then
              MsgBox errSpaceOrgAlphaSearch(UserLang)
              frmCustomer.txtOrgAlphaSearch.SetFocus
              validatefrmCustomer = 1
              Exit Function
           Else
              validatefrmCustomer = 0
           End If
       End If
    End If  ' customer type is consumer
    
    If frmCustomer.optLangArabic.Value = True Then
       If Len(RTrim(frmCustomer.txtAddress1)) <> 0 Then
          If englishCharFound(frmCustomer.txtAddress1) Then
             MsgBox errNoEnglishAddress(UserLang)
             frmCustomer.txtAddress1.SetFocus
             validatefrmCustomer = 1
             Exit Function
          Else
             validatefrmCustomer = 0
          End If
       End If
       If Len(RTrim(frmCustomer.txtAddress2)) <> 0 Then
          If englishCharFound(frmCustomer.txtAddress2) Then
             MsgBox errNoEnglishAddress(UserLang)
             frmCustomer.txtAddress2.SetFocus
             validatefrmCustomer = 1
             Exit Function
          Else
             validatefrmCustomer = 0
          End If
       End If
         
       If englishCharFound(frmCustomer.cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" + _
                              frmCustomer.cmbCity.text + "'")
          If rs.recordCount > 0 Then
             frmCustomer.cmbCity.text = rs(0)
          Else
             MsgBox errLangNotmatching(UserLang)
             frmCustomer.cmbCity.SetFocus
             validatefrmCustomer = 1
             Exit Function
          End If
      End If
    Else
       If Len(RTrim(frmCustomer.txtAddress1)) <> 0 Then
          If arabicCharFound(frmCustomer.txtAddress1) Then
             MsgBox errNoArabicAddress(UserLang)
             frmCustomer.txtAddress1.SetFocus
             validatefrmCustomer = 1
             Exit Function
          Else
             validatefrmCustomer = 0
          End If
       End If
         
       If Len(RTrim(frmCustomer.txtAddress2)) <> 0 Then
          If arabicCharFound(frmCustomer.txtAddress2) Then
             MsgBox errNoArabicAddress(UserLang)
             frmCustomer.txtAddress2.SetFocus
             validatefrmCustomer = 1
             Exit Function
          Else
             validatefrmCustomer = 0
          End If
       End If
       If arabicCharFound(frmCustomer.cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" + _
                             frmCustomer.cmbCity.text + "'")
          If rs.recordCount > 0 Then
             frmCustomer.cmbCity.text = rs(0)
          Else
             MsgBox errLangNotmatching(UserLang)
             frmCustomer.cmbCity.SetFocus
             validatefrmCustomer = 1
             Exit Function
          End If
      End If
    End If
    
    If Len(RTrim(frmCustomer.cmbTitle.text)) = 0 Then
       MsgBox errSpaceTitle(UserLang)
       frmCustomer.cmbTitle.SetFocus
       validatefrmCustomer = 1
       Exit Function
    Else
       validatefrmCustomer = 0
    End If
    
    If Len(RTrim(frmCustomer.cmbNationality.text)) = 0 Then
       MsgBox errSpaceNationality(UserLang)
       frmCustomer.cmbNationality.SetFocus
       validatefrmCustomer = 1
       Exit Function
    Else
       validatefrmCustomer = 0
    End If
      
    If Len(RTrim(frmCustomer.cmbDobDate.text)) = 0 Or _
       Len(RTrim(frmCustomer.cmbDobMonth.text)) = 0 Or _
       Len(RTrim(frmCustomer.txtDobYear.text)) = 0 Then
       If Mid$(frmCustomer.cmbCustomerType.text, 1, 1) = "0" Then
          MsgBox errSpaceDob(UserLang) '"Date of Birth Should be entered...Please enter "
       Else
          MsgBox errSpaceDoe(UserLang)
       End If
       frmCustomer.cmbDobDate.SetFocus
       validatefrmCustomer = 1
       Exit Function
    Else
       validatefrmCustomer = 0
    End If
    tDob = CStr(frmCustomer.txtDobYear) & _
           CStr(frmCustomer.cmbDobMonth.text) & _
           CStr(frmCustomer.cmbDobDate.text)
           
    If frmCustomer.optDOBGreg.Value = True Then
       If Not validDate(tDob) Then
          MsgBox errInvalidDate(UserLang)
          frmCustomer.cmbDobDate.SetFocus
          validatefrmCustomer = 1
          Exit Function
       Else
          validatefrmCustomer = 0
       End If
    End If
        
    If Len(RTrim(frmCustomer.cmbBusinessType.text)) = 0 Then
       MsgBox errSpaceBusType(UserLang)
       frmCustomer.cmbBusinessType.SetFocus
       validatefrmCustomer = 1
       Exit Function
    Else
       validatefrmCustomer = 0
    End If
    
    If Len(RTrim(frmCustomer.txtAddress1)) = 0 Or _
       Len(RTrim(frmCustomer.txtPOBox)) = 0 Or _
       Len(RTrim(frmCustomer.txtPinCode)) = 0 Or _
       Len(RTrim(frmCustomer.cmbCity.text)) = 0 Then
          
       MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
       frmCustomer.txtAddress1.SetFocus
       validatefrmCustomer = 1
       Exit Function
    Else
       validatefrmCustomer = 0
    End If
    
    If Len(RTrim(frmCustomer.txtResPhoneNo)) = 0 And _
       Len(RTrim(frmCustomer.txtOffPhoneNo)) = 0 And _
       Len(RTrim(frmCustomer.txtFaxNo)) = 0 And _
       Len(RTrim(frmCustomer.txtMobileNo)) = 0 Then
       
       MsgBox errSpacePhone(UserLang) ' "Atleast one Phone number should be entered..."
       frmCustomer.txtOffPhoneNo.SetFocus
       validatefrmCustomer = 1
       Exit Function
    Else
       validatefrmCustomer = 0
    End If
End Function

Public Function validatefrmCustomer2() As Integer
    Dim tmpVar As Integer
    Dim tCode As String
    Dim packCode As String
    
    validatefrmCustomer2 = 0
    
    If Mid$(frmCustomer.cmbCustomerType.text, 1, 1) = "0" Then
       If Len(RTrim(frmCustomer2.cmbEducation.text)) = 0 Then
          MsgBox errSpaceEducation(UserLang) '"Education code should be selected...Please select from the list"
          frmCustomer2.cmbEducation.SetFocus
          validatefrmCustomer2 = 1
          Exit Function
       Else
          validatefrmCustomer2 = 0
       End If
    
       If Len(RTrim(frmCustomer2.cmbProfession.text)) = 0 Then
          MsgBox errSpaceProfession(UserLang) '"Profession Code should be selected...Please select from the list"
          frmCustomer2.cmbProfession.SetFocus
          validatefrmCustomer2 = 1
          Exit Function
       Else
          validatefrmCustomer2 = 0
       End If
     
       If Len(RTrim(frmCustomer2.cmbPosition.text)) = 0 Then
          MsgBox errSpacePosition(UserLang) '"Position Code should be selected...Please select from the list"
          frmCustomer2.cmbPosition.SetFocus
          validatefrmCustomer2 = 1
          Exit Function
       Else
          validatefrmCustomer2 = 0
       End If
       
       If Len(RTrim(frmCustomer2.cmbMonthlyIncome.text)) = 0 Then
          MsgBox errSpaceIncome(UserLang) '"Monthly income code should be selected...Please select from the list"
          frmCustomer2.cmbMonthlyIncome.SetFocus
          validatefrmCustomer2 = 1
          Exit Function
       Else
          validatefrmCustomer2 = 0
       End If
       
       If frmCustomer2.chkRentedHouse.Value = 0 And _
          frmCustomer2.chkOwnHouse.Value = 0 And _
          frmCustomer2.chkCompanyAcc.Value = 0 And _
          frmCustomer2.chkRentedCar.Value = 0 And _
          frmCustomer2.chkOwnCar.Value = 0 And _
          frmCustomer2.chkCompanyTransport.Value = 0 Then
          
          MsgBox errSpaceOwnership(UserLang) '"Please select any one in ownership...."
          frmCustomer2.chkRentedHouse.SetFocus
          validatefrmCustomer2 = 1
          Exit Function
       Else
          validatefrmCustomer2 = 0
       End If

    End If ' consumer type
    
    If InStr(recvLoginMsg.authorityLevel, "~7") > 0 Then 'And updateAction Or _
                                (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
      tCode = Mid$(frmCustomer2.cmbPackageAcc.text, 1, 1)
      If tCode = "0" Then
         If updateAction Or (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
            If recvSuperActionMsg.packagedAcc > "0" Then
               packCode = "~7" & recvSuperActionMsg.packagedAcc
               If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
                  MsgBox errNotAuthorisedToFlag(UserLang)
                  frmCustomer2.bringOldFlag
                  validatefrmCustomer2 = 1
                  Exit Function
               Else
                  validatefrmCustomer2 = 0
               End If
            End If
         End If
      Else
         If updateAction Or (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
            If tCode <> recvSuperActionMsg.packagedAcc Then
               packCode = "~7" & tCode
               If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
                  MsgBox errNotAuthorisedToFlag(UserLang)
                  frmCustomer2.bringOldFlag
                  validatefrmCustomer2 = 1
                  Exit Function
               Else
                  validatefrmCustomer2 = 0
               End If
            End If
        Else
           packCode = "~7" & tCode
           If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
              MsgBox errNotAuthorisedToFlag(UserLang)
              frmCustomer2.bringOldFlag
              validatefrmCustomer2 = 1
              Exit Function
           Else
              validatefrmCustomer2 = 0
           End If
        End If
      End If
    End If
    
    If Mid$(frmCustomer2.cmbPackageAcc.text, 1, 1) = "1" Or Mid$(frmCustomer2.cmbPackageAcc.text, 1, 1) = "4" Then
       If Mid$(frmCustomer2.cmbMonthlyIncome.text, 4, 1) < "2" Or _
          frmCustomer2.chkSalaryTransfer.Value = vbUnchecked Then
          MsgBox errNotPackageAcc(UserLang)
          validatefrmCustomer2 = 1
          Exit Function
       Else
          validatefrmCustomer2 = 0
       End If
    End If
    
    tmpVar = frmCustomer2.chkDocSignature.Value + _
             frmCustomer2.chkdocIqamacopy.Value + _
             frmCustomer2.chkDocregistrationCert.Value + _
             frmCustomer2.chkEstablishContract.Value + _
             frmCustomer2.chkDocPowerOfAttorney.Value + _
             frmCustomer2.chkSalaryTransfer.Value + _
             frmCustomer2.chkJointAcAgreement.Value
                
    If tmpVar < 2 Then
       MsgBox errSpaceDocuments(UserLang) '"Atleast two documents should be selected..Please select  "
       frmCustomer2.chkDocSignature.SetFocus
       validatefrmCustomer2 = 1
       Exit Function
    Else
       validatefrmCustomer2 = 0
    End If
    
    If updateAction Then
       validatefrmCustomer2 = 0
       Exit Function
    End If
    
    If tellerAction And _
       recvSuperActionMsg.newOrUpdate = "U" Then
       validatefrmCustomer2 = 0
       Exit Function
    End If
     
    If Mid$(frmCustomer.cmbCustomerType, 1, 1) = "0" Then
'        If frmCustomer2.optPrimaryElectronCardYes.Value = True Then
'           If Len(RTrim(frmCustomer2.txtPrimaryElectronCardName)) = 0 Then
'              MsgBox errSpacePrimaryCardName(UserLang)
'              frmCustomer2.txtPrimaryElectronCardName.SetFocus
'              validatefrmCustomer2 = 1
'              Exit Function
'           Else
'              validatefrmCustomer2 = 0
'           End If
'
'           If checkForSpecialChars(Trim(frmCustomer2.txtPrimaryElectronCardName)) = False Then
'              MsgBox errInvalidChar(UserLang)
'              frmCustomer2.txtPrimaryElectronCardName.SetFocus
'              validatefrmCustomer2 = 1
'              Exit Function
'           Else
'              validatefrmCustomer2 = 0
'           End If
'        End If
'
'        If frmCustomer2.optSecondaryElectronCardYes.Value = True Then
'           If Len(RTrim(frmCustomer2.txtSecondaryElectronCardName)) = 0 Then
'              MsgBox errSpaceSecondaryCardName(UserLang)
'              frmCustomer2.txtSecondaryElectronCardName.SetFocus
'              validatefrmCustomer2 = 1
'              Exit Function
'           Else
'              validatefrmCustomer2 = 0
'           End If
'
'           If checkForSpecialChars(Trim(frmCustomer2.txtSecondaryElectronCardName)) = False Then
'              MsgBox errInvalidChar(UserLang)
'              frmCustomer2.txtSecondaryElectronCardName.SetFocus
'              validatefrmCustomer2 = 1
'              Exit Function
'           Else
'              validatefrmCustomer2 = 0
'           End If
'        End If
        
        If frmCustomer2.optPrimaryElectronIntlCardYes.Value = True Then
           If Len(RTrim(frmCustomer2.txtPrimaryElectronIntlCardName)) = 0 Then
              MsgBox errSpacePrimaryIntlCardName(UserLang)
              frmCustomer2.txtPrimaryElectronIntlCardName.SetFocus
              validatefrmCustomer2 = 1
              Exit Function
           Else
              validatefrmCustomer2 = 0
           End If
    
           If checkForSpecialChars(Trim(frmCustomer2.txtPrimaryElectronIntlCardName)) = False Then
              MsgBox errInvalidChar(UserLang)
              frmCustomer2.txtPrimaryElectronIntlCardName.SetFocus
              validatefrmCustomer2 = 1
              Exit Function
           Else
              validatefrmCustomer2 = 0
           End If
        End If
         
        If frmCustomer2.optSecondaryElectronIntlCardYes.Value = True Then
           If Len(RTrim(frmCustomer2.txtSecondaryElectronIntlCardName)) = 0 Then
              MsgBox errSpaceSecondaryIntlCardName(UserLang)
              frmCustomer2.txtSecondaryElectronIntlCardName.SetFocus
              validatefrmCustomer2 = 1
              Exit Function
           Else
              validatefrmCustomer2 = 0
           End If
           
           If checkForSpecialChars(Trim(frmCustomer2.txtSecondaryElectronIntlCardName)) = False Then
              MsgBox errInvalidChar(UserLang)
              frmCustomer2.txtSecondaryElectronIntlCardName.SetFocus
              validatefrmCustomer2 = 1
              Exit Function
           Else
              validatefrmCustomer2 = 0
           End If
        End If
        
        If frmCustomer2.optCardDeliveredToPOBox.Value = True Then
           If Len(RTrim(frmCustomer2.txtDeliveryAddr1)) = 0 Or _
              Len(RTrim(frmCustomer2.txtDeliveryPOBox)) = 0 Or _
              Len(RTrim(frmCustomer2.txtDeliveryZipcode)) = 0 Or _
              Len(RTrim(frmCustomer2.cmbDeliveryCity.text)) = 0 Then
            
              MsgBox errSpaceDeliveryAddress(UserLang)
              frmCustomer2.txtDeliveryAddr1.SetFocus
              validatefrmCustomer2 = 1
              Exit Function
           Else
              validatefrmCustomer2 = 0
           End If
           If arabicCharFound(frmCustomer2.txtDeliveryAddr1) = True Then
              MsgBox errNoArabicAddress(UserLang)
              frmCustomer2.txtDeliveryAddr1.SetFocus
              validatefrmCustomer2 = 1
           Else
              validatefrmCustomer2 = 0
           End If
           
           If arabicCharFound(frmCustomer2.cmbDeliveryCity) = True Then
              MsgBox errNoArabicAddress(UserLang)
              frmCustomer2.cmbDeliveryCity.SetFocus
              validatefrmCustomer2 = 1
           Else
              validatefrmCustomer2 = 0
           End If
        End If
    End If ' customertype =  "0"
   
End Function


Public Function validatefrmCustomer3() As Integer
     Dim tDob As String, tIssueDate As String, tExpiryDate As String

     ' Validate the ID Number
     validatefrmCustomer3 = 0
     If Len(RTrim(frmIndividualJoint.cmbIdType.text)) = 0 Then
        MsgBox errSpaceIdType(UserLang)
        frmIndividualJoint.cmbIdType.SetFocus
        validatefrmCustomer3 = 1
        Exit Function
     Else
        validatefrmCustomer3 = 0
     End If
     
     If Mid$(frmIndividualJoint.cmbIdType, 1, 1) <> "I" And _
        Mid$(frmIndividualJoint.cmbIdType, 1, 1) <> "Q" And _
        Mid$(frmIndividualJoint.cmbIdType, 1, 1) <> "P" And _
        Mid$(frmIndividualJoint.cmbIdType, 1, 1) <> "F" And _
        Mid$(frmIndividualJoint.cmbIdType, 1, 1) <> "H" Then
        MsgBox errInvalidIdType(UserLang)
        frmIndividualJoint.cmbIdType.SetFocus
        validatefrmCustomer3 = 1
        Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
     
     If Len(RTrim(frmIndividualJoint.txtIdNumber)) = 0 Then
        MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
        frmIndividualJoint.txtIdNumber.SetFocus
        validatefrmCustomer3 = 1
        Exit Function
     Else
        validatefrmCustomer3 = 0
     End If
     
     If Mid$(frmIndividualJoint.cmbIdType.text, 1, 1) = "I" Or _
        Mid$(frmIndividualJoint.cmbIdType.text, 1, 1) = "Q" Then
        If Len(Trim(frmIndividualJoint.txtIdNumber)) <> 10 Then
           MsgBox errInvalidId(UserLang)
           frmIndividualJoint.txtIdNumber.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
        
        If Mid$(frmIndividualJoint.cmbIdType.text, 1, 1) = "I" Then
           If Mid$(frmIndividualJoint.txtIdNumber, 1, 1) <> "1" Then
              MsgBox errInvalidIdCategory(UserLang)
              frmIndividualJoint.txtIdNumber.SetFocus
              validatefrmCustomer3 = 1
              Exit Function
           Else
              validatefrmCustomer3 = 0
           End If
        ElseIf Mid$(frmIndividualJoint.cmbIdType.text, 1, 1) = "Q" Then
           If Mid$(frmIndividualJoint.txtIdNumber, 1, 1) <> "2" And _
              Mid$(frmIndividualJoint.txtIdNumber, 1, 1) <> "3" And _
              Mid$(frmIndividualJoint.txtIdNumber, 1, 1) <> "5" Then
              MsgBox errInvalidIdCategory(UserLang)
              frmIndividualJoint.txtIdNumber.SetFocus
              validatefrmCustomer3 = 1
              Exit Function
           Else
              validatefrmCustomer3 = 0
           End If
        End If
        
        If validIdNumber(Trim(frmIndividualJoint.txtIdNumber)) = False Then
           MsgBox errInvalidIdNo(UserLang)
           frmIndividualJoint.txtIdNumber.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
     
     If Len(RTrim(frmIndividualJoint.cmbTitleCode.text)) = 0 Then
        MsgBox errSpaceTitle(UserLang)
        frmIndividualJoint.cmbTitleCode.SetFocus
        validatefrmCustomer3 = 1
        Exit Function
     Else
        validatefrmCustomer3 = 0
     End If
        
     If frmIndividualJoint.optLangArabic.Value = True Then
        If Len(RTrim(frmIndividualJoint.txtArabFirstName)) = 0 And _
           Len(RTrim(frmIndividualJoint.txtArabic2ndName)) = 0 And _
           Len(RTrim(frmIndividualJoint.txtArabic3rdName)) = 0 And _
           Len(RTrim(frmIndividualJoint.txtArabLastName)) = 0 Then
            
           MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
           frmIndividualJoint.txtArabFirstName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
        
        If Len(RTrim(frmIndividualJoint.txtArabShortName)) = 0 Then
           MsgBox errSpaceShortName(UserLang)
           frmIndividualJoint.txtArabShortName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     Else
        If Len(RTrim(frmIndividualJoint.txtEngFirstName)) = 0 And _
           Len(RTrim(frmIndividualJoint.txtEnglish2ndName)) = 0 And _
           Len(RTrim(frmIndividualJoint.txtEnglish3rdName)) = 0 And _
           Len(RTrim(frmIndividualJoint.txtEngLastName)) = 0 Then
           MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
           frmIndividualJoint.txtEngFirstName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
        
        If Len(RTrim(frmIndividualJoint.txtEngShortName)) = 0 Then
           MsgBox errSpaceShortName(UserLang)
           frmIndividualJoint.txtEngShortName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
     
     If Len(RTrim(frmIndividualJoint.txtArabFirstName)) > 0 Then
        If englishCharFound(frmIndividualJoint.txtArabFirstName) = True Then
           MsgBox errNoEnglishCharacters(UserLang)
           frmIndividualJoint.txtArabFirstName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
         Else
           validatefrmCustomer3 = 0
         End If
     End If
    
     If Len(RTrim(frmIndividualJoint.txtArabic2ndName)) > 0 Then
        If englishCharFound(frmIndividualJoint.txtArabic2ndName) = True Then
           MsgBox errNoEnglishCharacters(UserLang)
           frmIndividualJoint.txtArabic2ndName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
    
     If Len(RTrim(frmIndividualJoint.txtArabic3rdName)) > 0 Then
        If englishCharFound(frmIndividualJoint.txtArabic3rdName) = True Then
           MsgBox errNoEnglishCharacters(UserLang)
           frmIndividualJoint.txtArabic3rdName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
     
     If Len(RTrim(frmIndividualJoint.txtArabLastName)) > 0 Then
        If englishCharFound(frmIndividualJoint.txtArabLastName) = True Then
           MsgBox errNoEnglishCharacters(UserLang)
           frmIndividualJoint.txtArabLastName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
    
     If Len(RTrim(frmIndividualJoint.txtArabShortName)) > 0 Then
        If englishCharFound(frmIndividualJoint.txtArabShortName) = True Then
           MsgBox errNoEnglishCharacters(UserLang)
           frmIndividualJoint.txtArabShortName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
     
     If Len(RTrim(frmIndividualJoint.txtEngFirstName)) > 0 Then
        If arabicCharFound(frmIndividualJoint.txtEngFirstName) = True Then
           MsgBox errNoArabicCharacters(UserLang)
           frmIndividualJoint.txtEngFirstName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
     
     If Len(RTrim(frmIndividualJoint.txtEnglish2ndName)) > 0 Then
        If arabicCharFound(frmIndividualJoint.txtEnglish2ndName) = True Then
           MsgBox errNoArabicCharacters(UserLang)
           frmIndividualJoint.txtEnglish2ndName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
     
     If Len(RTrim(frmIndividualJoint.txtEnglish3rdName)) > 0 Then
        If arabicCharFound(frmIndividualJoint.txtEnglish3rdName) = True Then
           MsgBox errNoArabicCharacters(UserLang)
           frmIndividualJoint.txtEnglish3rdName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
     
     If Len(RTrim(frmIndividualJoint.txtEngLastName)) > 0 Then
        If arabicCharFound(frmIndividualJoint.txtEngLastName) = True Then
           MsgBox errNoArabicCharacters(UserLang)
           frmIndividualJoint.txtEngLastName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
     
     If Len(RTrim(frmIndividualJoint.txtEngShortName)) > 0 Then
        If arabicCharFound(frmIndividualJoint.txtEngShortName) = True Then
           MsgBox errNoArabicCharacters(UserLang)
           frmIndividualJoint.txtEngShortName.SetFocus
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
     End If
       
    If Len(RTrim(frmIndividualJoint.cmbIdIssueDate.text)) = 0 Or _
       Len(RTrim(frmIndividualJoint.cmbIdIssueMonth.text)) = 0 Or _
       Len(RTrim(frmIndividualJoint.txtIdIssueYear)) = 0 Then
        
       MsgBox errSpaceIssueDate(UserLang)
       frmIndividualJoint.cmbIdIssueDate.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
       
    If Len(RTrim(frmIndividualJoint.cmbIdExpiryDate.text)) = 0 Or _
       Len(RTrim(frmIndividualJoint.cmbIdExpiryMonth.text)) = 0 Or _
       Len(RTrim(frmIndividualJoint.txtIdExpiryYear)) = 0 Then
       
       MsgBox errSpaceExpiryDate(UserLang)
       frmIndividualJoint.cmbIdExpiryDate.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    tIssueDate = CStr(frmIndividualJoint.txtIdIssueYear) & _
                 CStr(frmIndividualJoint.cmbIdIssueMonth.text) & _
                 CStr(frmIndividualJoint.cmbIdIssueDate.text)
                 
    tExpiryDate = CStr(frmIndividualJoint.txtIdExpiryYear) & _
                  CStr(frmIndividualJoint.cmbIdExpiryMonth.text) & _
                  CStr(frmIndividualJoint.cmbIdExpiryDate.text)
                  
    If frmIndividualJoint.optIdDateGregorian.Value = True Then
       If Not validDate(tIssueDate) Then
          MsgBox errInvalidDate(UserLang)
          frmIndividualJoint.cmbIdIssueDate.SetFocus
          validatefrmCustomer3 = 1
          Exit Function
       Else
          validatefrmCustomer3 = 0
       End If
       If Not validDate(tExpiryDate) Then
          MsgBox errInvalidDate(UserLang)
          frmIndividualJoint.cmbIdExpiryDate.SetFocus
          validatefrmCustomer3 = 1
          Exit Function
       Else
          validatefrmCustomer3 = 0
       End If
    End If
                     
    If tExpiryDate < tIssueDate Then
       MsgBox errGreaterExpiryYear(UserLang)
       frmIndividualJoint.txtIdExpiryYear.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    If frmIndividualJoint.optIdDateHijri.Value = True Then
       If tExpiryDate < currentHijriDate Then
          MsgBox errExpiryDateLessThanToday(UserLang)
          frmIndividualJoint.txtIdExpiryYear.SetFocus
          validatefrmCustomer3 = 1
          Exit Function
       Else
          validatefrmCustomer3 = 0
       End If
    Else
       If tExpiryDate < currentGregDate Then
          MsgBox errExpiryDateLessThanToday(UserLang)
          frmIndividualJoint.txtIdExpiryYear.SetFocus
          validatefrmCustomer3 = 1
          Exit Function
       Else
          validatefrmCustomer3 = 0
       End If
    End If
      
    If Len(RTrim(frmIndividualJoint.cmbDobDate.text)) = 0 Or _
       Len(RTrim(frmIndividualJoint.cmbDobMonth.text)) = 0 Or _
       Len(RTrim(frmIndividualJoint.txtDobYear.text)) = 0 Then
       
       MsgBox errSpaceDob(UserLang) '"Date of Birth Should be entered...Please enter "
       frmIndividualJoint.cmbDobDate.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    tIssueDate = CStr(frmIndividualJoint.txtIdIssueYear) & _
                 CStr(frmIndividualJoint.cmbIdIssueMonth.text) & _
                 CStr(frmIndividualJoint.cmbIdIssueDate.text)
    tDob = CStr(frmIndividualJoint.txtDobYear) & _
           CStr(frmIndividualJoint.cmbDobMonth.text) & _
           CStr(frmIndividualJoint.cmbDobDate.text)
           
    If frmIndividualJoint.optDOBGreg.Value = True Then
       If Not validDate(tDob) Then
          MsgBox errInvalidDate(UserLang)
          frmIndividualJoint.cmbDobDate.SetFocus
          validatefrmCustomer3 = 1
          Exit Function
       Else
          validatefrmCustomer3 = 0
       End If
    End If
    
    If frmIndividualJoint.optDOBHijri = True Then
      If tDob > currentHijriDate Then
         MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
         frmIndividualJoint.txtDobYear.SetFocus
         validatefrmCustomer3 = 1
         Exit Function
      Else
         validatefrmCustomer3 = 0
      End If
   Else
      If tDob > currentGregDate Then
         MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
         frmIndividualJoint.txtDobYear.SetFocus
         validatefrmCustomer3 = 1
         Exit Function
      Else
         validatefrmCustomer3 = 0
      End If
  End If
    
'    If tDob > tIssueDate Then
'       MsgBox errInvalidDob(UserLang)
'       frmCustomer3.cmbDOBDate.SetFocus
'       validatefrmCustomer3 = 1
'       Exit Function
'    Else
'       validatefrmCustomer3 = 0
'    End If
      
    If Len(RTrim(frmIndividualJoint.cmbNationality.text)) = 0 Then
       MsgBox errSpaceNationality(UserLang)
       frmIndividualJoint.cmbNationality.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
        
     If Mid$(frmIndividualJoint.cmbNationality, 1, 3) = "001" Then
        If Mid$(frmIndividualJoint.cmbIdType, 1, 1) = "Q" Or _
           Mid$(frmIndividualJoint.cmbIdType, 1, 1) = "O" Then
           MsgBox errInvalidNationality(UserLang)
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
    Else
        If Mid$(frmIndividualJoint.cmbIdType, 1, 1) = "I" Or _
           Mid$(frmIndividualJoint.cmbIdType, 1, 1) = "H" Then
           MsgBox errInvalidNationality(UserLang)
           validatefrmCustomer3 = 1
           Exit Function
        Else
           validatefrmCustomer3 = 0
        End If
    End If
    
    If Len(RTrim(frmIndividualJoint.cmbBusinessType.text)) = 0 Then
       MsgBox errSpaceBusType(UserLang)
       frmIndividualJoint.cmbBusinessType.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
        
    If frmIndividualJoint.optPoBox = True Then
       If Len(RTrim(frmIndividualJoint.txtAddress1)) = 0 Or _
          Len(RTrim(frmIndividualJoint.txtPOBox)) = 0 Or _
          Len(RTrim(frmIndividualJoint.txtPinCode)) = 0 Or _
          Len(RTrim(frmIndividualJoint.cmbCity.text)) = 0 Then
                    
          MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
          frmIndividualJoint.txtAddress1.SetFocus
          validatefrmCustomer3 = 1
          Exit Function
       Else
          validatefrmCustomer3 = 0
       End If
    Else ' saudi post office
      If Len(RTrim(frmIndividualJoint.txtSaudiPostGPSNo)) = 0 Or _
         Len(RTrim(frmIndividualJoint.txtSaudiPostStreetName)) = 0 Or _
         Len(RTrim(frmIndividualJoint.txtSaudiPostUnit)) = 0 Or _
         Len(RTrim(frmIndividualJoint.cmbCity.text)) = 0 Or _
         Len(RTrim(frmIndividualJoint.txtSaudiPostZipCode)) = 0 Or _
         Len(RTrim(frmIndividualJoint.txtSaudiPostAdditionalNo)) = 0 Then
         MsgBox errSpaceSaudiAddress(UserLang) '"Saudi Postal address should be entered.. Please enter"
         frmIndividualJoint.txtSaudiPostGPSNo.SetFocus
         validatefrmCustomer3 = 1
         Exit Function
      Else
         validatefrmCustomer3 = 0
      End If
   End If
    
    If Len(RTrim(frmIndividualJoint.txtResPhoneNo)) = 0 And _
       Len(RTrim(frmIndividualJoint.txtOffPhoneNo)) = 0 And _
       Len(RTrim(frmIndividualJoint.txtFaxNo)) = 0 And _
       Len(RTrim(frmIndividualJoint.txtMobileNo)) = 0 Then
       
       MsgBox errSpacePhone(UserLang) '"Atleast one Phone number should be entered..."
       frmIndividualJoint.txtOffPhoneNo.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    If Len(RTrim(frmIndividualJoint.cmbEducation.text)) = 0 Then
       MsgBox errSpaceEducation(UserLang)
       frmIndividualJoint.cmbEducation.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    If Len(RTrim(frmIndividualJoint.cmbProfession.text)) = 0 Then
       MsgBox errSpaceProfession(UserLang)
       frmIndividualJoint.cmbProfession.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    If Len(RTrim(frmIndividualJoint.cmbPosition.text)) = 0 Then
       MsgBox errSpacePosition(UserLang)
       frmIndividualJoint.cmbPosition.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    If Len(RTrim(frmIndividualJoint.cmbMonthlyIncome.text)) = 0 Then
       MsgBox errSpaceIncome(UserLang)
       frmIndividualJoint.cmbMonthlyIncome.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    If frmIndividualJoint.chkRentHome.Value = 0 And _
       frmIndividualJoint.chkOwnHouse.Value = 0 And _
       frmIndividualJoint.chkCompanyAccomodation.Value = 0 And _
       frmIndividualJoint.chkRentCar.Value = 0 And _
       frmIndividualJoint.chkOwnCar.Value = 0 And _
       frmIndividualJoint.chkCompanyTrans.Value = 0 Then
          
       MsgBox errSpaceOwnership(UserLang) '"Please select any one in ownership...."
       frmIndividualJoint.chkRentHome.SetFocus
       validatefrmCustomer3 = 1
       Exit Function
    Else
       validatefrmCustomer3 = 0
    End If
    
    
End Function

Public Sub loadEnquiryForm()
    Dim wrkJet As Workspace
    Dim tDate As String
    Dim mQry As String
    Dim fileInd As String
    
    On Error GoTo err_handler
    fileInd = "1"
    Set db = OpenDatabase(dbPath)
    fileInd = "2"
    Set transDb = OpenDatabase(transDbPath)
    fileInd = "3"
    mQry = "select realorpseudo from branchinfo where branchcode = '" & gBranchCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       realOrPseudo = rs(0)
    Else
       realOrPseudo = "1" 'if error occured in executing the query, then move as real branch
    End If
        
    bankingDate = recvLoginMsg.bankingDate
    currentHijriDate = recvLoginMsg.currentDateH
    currentGregDate = recvLoginMsg.currentDateG
    If recvLoginMsg.cardPrdnAtBranch = "1" Then
       cardProductionAtBranch = True
    Else
       cardProductionAtBranch = False
    End If
    
    If recvLoginMsg.pinSelectAtBranch = "1" Then
       pinSelectAtBranch = True
    Else
       pinSelectAtBranch = False
    End If
    
    If recvLoginMsg.tpinSelectAtBranch = "1" Then
       tpinSelectAtBranch = True
    Else
       tpinSelectAtBranch = False
    End If
    
    If recvLoginMsg.tpinMandatoryAtBranch = "1" Then
       tpinMandatoryAtBranch = True
    Else
       tpinMandatoryAtBranch = False
    End If
    
    If recvLoginMsg.dormantActivationFlag = "1" Then
       dormantActivationAllowed = True
    Else
       dormantActivationAllowed = False
    End If
    
    If recvLoginMsg.nameSearchAllowed = "1" Then
       nameSearchAllowedAtBranch = True
    Else
       nameSearchAllowedAtBranch = False
    End If
    
    If recvLoginMsg.enableChipCard = "1" Then
       smartCardEnabled = True
    Else
       smartCardEnabled = False
    End If
    
    If recvLoginMsg.internalCustOpenAllowed = "1" Then
       enableInternalCustOpen = True
    Else
       enableInternalCustOpen = False
    End If
    
    If recvLoginMsg.enableLocalChipCard = "1" Then
       localChipCardEnable = True
    Else
       localChipCardEnable = False
    End If
    
    If recvLoginMsg.generalCustOpenAllowed = "1" Then
       enableGeneralCustOpen = True
    Else
       enableGeneralCustOpen = False
    End If
    
    If recvLoginMsg.pensionCustOpenAllowed = "1" Then     'added by Mohit on 28-Nov-2006
       enablePensionCustOpen = True
    Else
       enablePensionCustOpen = False
    End If
    
    If recvLoginMsg.feeExclusionUpdAllowed = "1" Then
       enableFeeExclusionUpd = True
    Else
       enableFeeExclusionUpd = False
    End If
    
    If recvLoginMsg.generalSamaUpdAllowed = "1" Then
       enableGeneralSamaUpd = True
    Else
       enableGeneralSamaUpd = False
    End If
    
    If recvLoginMsg.enableSadadProfile = "1" Then
       enableSadadProfile = True
    Else
       enableSadadProfile = False
    End If
    
    If recvLoginMsg.swiftCentreBranchFlag = "1" Then
       swiftCentreBranch = True
    Else
       swiftCentreBranch = False
    End If
    
    If recvLoginMsg.payrollBranch = "1" Then
       payrollBranch = True
    Else
       payrollBranch = False
    End If
    
    If recvLoginMsg.accOpenCardPrintAllowed = "1" Then
       accOpenCardPrintAllowed = True
    Else
       accOpenCardPrintAllowed = False
    End If
       
    gInactiveTime = CInt(recvLoginMsg.idleTimeOutPeriod) / 60
    userLoggedIn = True
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
    
    tDate = CStr(Year(Date)) & _
            Format(CStr(Month(Date)), "00") & _
            Format(CStr(Day(Date)), "00")
            
    Set rs = db.OpenRecordset("select lastRefreshDate from controlinfo")

    If tDate <> rs(0) Then
       doRefresh ("0") ' partial refresh
       On Error Resume Next
       db.Execute ("update controlinfo set lastrefreshDate = '" & tDate & "' where lastrefreshdate = '" & rs(0) & "'")
       frmLogin.MousePointer = vbDefault
       frmLogin.cmdOk.Enabled = True
       frmLogin.cmdExit.Enabled = True
    End If
    
    frmLogin.txtPassword = ""
            
    If UserLang = ARABIC Then
       ChangePositions frmEnquiry, 11800
       frmEnquiry.RightToLeft = True
    End If
    frmEnquiry.Show
        
    mQry = "select maincategorycode,arabicname,englishname from samamaincategoryinfo"
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       frmEnquiry.cmbMainCategory.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
              frmEnquiry.cmbMainCategory.AddItem rs(0) & "-" & rs(2)
           Else
              frmEnquiry.cmbMainCategory.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If
    
    mQry = "select subcategorycode,arabicname,englishname from samasubcategoryinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       frmEnquiry.cmbSubCategory.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
              frmEnquiry.cmbSubCategory.AddItem rs(0) & "-" & rs(2)
           Else
              frmEnquiry.cmbSubCategory.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If
    
    mQry = "select branchcode,arabicname,englishname from branchinfo"
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       frmEnquiry.cmbBranch.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
              frmEnquiry.cmbBranch.AddItem rs(0) & "-" & rs(2)
           Else
              frmEnquiry.cmbBranch.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If

    frmEnquiry.Caption = frmEnquiryCaption(0, UserLang)
    frmEnquiry.mnuCSO.Caption = mnuCustomerCaption(1, UserLang)
    frmEnquiry.mnuCardPendingActionCso.Caption = mnuCustomerCaption(3, UserLang)
    frmEnquiry.mnuAtmCardFromFinacle.Caption = mnuCustomerCaption(15, UserLang)
    
    frmEnquiry.mnuChangePassword.Caption = mnuCustomerCaption(7, UserLang)
    frmEnquiry.mnuChangeScreenLangCso.Caption = mnuSupervisorCaption(13, UserLang)
     
    frmEnquiry.mnuSupervisor.Caption = mnuSupervisorCaption(1, UserLang)
    frmEnquiry.mnuCardPendingActivitySup.Caption = mnuSupervisorCaption(3, UserLang)
    frmEnquiry.mnuSupChangePassword.Caption = mnuSupervisorCaption(5, UserLang)
    frmEnquiry.mnuRefreshLocalDB.Caption = mnuSupervisorCaption(9, UserLang)
    frmEnquiry.mnuPartialRefresh.Caption = mnuSupervisorCaption(10, UserLang)
    frmEnquiry.mnuFullRefresh.Caption = mnuSupervisorCaption(11, UserLang)
    frmEnquiry.mnuChangeScreenLangSupervisor.Caption = mnuSupervisorCaption(13, UserLang)
    frmEnquiry.mnuCompactLocalDB.Caption = mnuSupervisorCaption(14, UserLang)
    frmEnquiry.mnuAccOpeningCardPrint.Caption = mnuSupervisorCaption(19, UserLang)
    
    frmEnquiry.mnuReport.Caption = mnuAccountCaption(0, UserLang)
    frmEnquiry.mnuCardActivityReport.Caption = mnuAccountCaption(4, UserLang)
    frmEnquiry.mnuAtmPinReport.Caption = mnuAccountCaption(5, UserLang)
        
    frmEnquiry.mnuAbout.Caption = mnuAboutCaption(0, UserLang)
    frmEnquiry.mnuAboutCSD.Caption = mnuAboutCaption(1, UserLang)
    
    frmEnquiry.mnuCardProdn.Caption = mnuCardProductionCaption(0, UserLang)
    frmEnquiry.mnuUpdateStatus.Caption = mnuCardProductionCaption(2, UserLang)
      
    frmEnquiry.lblEnquiryHead.Caption = frmEnquiryCaption(1, UserLang)
    frmEnquiry.lblCustomerNumber.Caption = frmEnquiryCaption(2, UserLang)
    frmEnquiry.lblAccNumber.Caption = frmEnquiryCaption(3, UserLang)
    frmEnquiry.lblCardNumber.Caption = frmEnquiryCaption(4, UserLang)
    frmEnquiry.lblEnquiryIdNo.Caption = frmEnquiryCaption(5, UserLang)
    frmEnquiry.lblPhone.Caption = frmEnquiryCaption(6, UserLang)
    frmEnquiry.lblExtn.Caption = frmEnquiryCaption(7, UserLang)
    frmEnquiry.lblFirstName = frmEnquiryCaption(8, UserLang)
    frmEnquiry.lblLastName.Caption = frmEnquiryCaption(9, UserLang)
    'frmEnquiry.cmdNewCustomer.Caption = frmEnquiryCaption(10, UserLang)
    'frmEnquiry.cmdEnquiry.Caption = frmEnquiryCaption(11, UserLang)
    frmEnquiry.cmdCancel.Caption = frmEnquiryCaption(12, UserLang)
    'frmEnquiry.cmdUpdate.Caption = frmEnquiryCaption(13, UserLang)
    frmEnquiry.cmdAcctInfo.Caption = frmEnquiryCaption(14, UserLang)
    frmEnquiry.cmdAtmCard.Caption = frmEnquiryCaption(15, UserLang)
    frmEnquiry.cmdPenEnquiry.Caption = frmEnquiryCaption(16, UserLang)
    frmEnquiry.cmdMerchant.Caption = frmEnquiryCaption(17, UserLang)
    frmEnquiry.cmdCustomer.Caption = frmEnquiryCaption(10, UserLang)
    frmEnquiry.lblCompanyRegnNo.Caption = frmEnquiryCaption(18, UserLang)
    frmEnquiry.lblMainCategory.Caption = frmEnquiryCaption(19, UserLang)
    frmEnquiry.lblSubCategory.Caption = frmEnquiryCaption(20, UserLang)
    frmEnquiry.lblBranch.Caption = frmEnquiryCaption(21, UserLang)
    frmEnquiry.lblSecondName.Caption = frmEnquiryCaption(22, UserLang)
    frmEnquiry.cmdBillEnq.Caption = frmEnquiryCaption(23, UserLang)
    frmEnquiry.cmdNameSearch.Caption = frmEnquiryCaption(24, UserLang)
    frmEnquiry.cmdHistoricalStmt.Caption = frmEnquiryCaption(25, UserLang)
    frmEnquiry.cmdReturnMail.Caption = frmEnquiryCaption(26, UserLang)
    frmEnquiry.lblMobileNo.Caption = frmEnquiryCaption(27, UserLang)
    frmEnquiry.cmdGeneralCustomerStatus.Caption = frmEnquiryCaption(28, UserLang)
       
    frmEnquiry.cmdCustomer.Enabled = True
    frmEnquiry.cmdReturnMail.Enabled = True
    frmEnquiry.cmdGeneralCustomerStatus.Enabled = True
    
    If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
       frmEnquiry.mnuAtmPinReport.Enabled = True
       frmEnquiry.mnuCardActivityReport.Enabled = True
    Else
       frmEnquiry.mnuAtmPinReport.Enabled = False
       frmEnquiry.mnuCardActivityReport.Enabled = False
    End If
    
    If InStr(recvLoginMsg.authorityLevel, "~99") > 0 Then
       frmEnquiry.cmdCustomer.Enabled = False
       frmEnquiry.mnuChangePassword.Enabled = False
       frmEnquiry.cmdBillEnq.Enabled = False
       frmEnquiry.cmdReturnMail.Enabled = False
       frmEnquiry.cmdGeneralCustomerStatus.Enabled = False
    End If
        
    If InStr(recvLoginMsg.authorityLevel, "~87") > 0 Then
       frmEnquiry.cmdHistoricalStmt.Enabled = True
       frmEnquiry.cmdHistoricalStmt.Visible = True
       frmEnquiry.cmdHistoricalStmt.Refresh
    Else
       frmEnquiry.cmdHistoricalStmt.Enabled = False
       frmEnquiry.cmdHistoricalStmt.Visible = False
    End If
    
    If InStr(recvLoginMsg.authorityLevel, "~42") > 0 Then
       frmEnquiry.mnuSupervisor.Enabled = True
       frmEnquiry.mnuCardPendingActivitySup.Enabled = True
       frmEnquiry.mnuCSO.Enabled = False
       frmEnquiry.mnuRefreshLocalDB.Enabled = True
       If accOpenCardPrintAllowed = True Then
          frmEnquiry.mnuAccOpeningCardPrint.Enabled = True
       Else
          frmEnquiry.mnuAccOpeningCardPrint.Enabled = False
       End If
       frmEnquiry.mnuAtmPinReport.Enabled = True
       frmEnquiry.mnuCardActivityReport.Enabled = True
    Else
       frmEnquiry.mnuSupervisor.Enabled = False
       frmEnquiry.mnuCardPendingActivitySup.Enabled = False
       frmEnquiry.mnuAccOpeningCardPrint.Enabled = False
       frmEnquiry.mnuRefreshLocalDB.Enabled = False
    End If
     
     If InStr(recvLoginMsg.authorityLevel, "~43") <> 0 Then
       frmEnquiry.mnuCardProdn.Enabled = True
     Else
       frmEnquiry.mnuCardProdn.Enabled = False
     End If
     
     If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
        frmEnquiry.mnuCSO.Enabled = True
        frmEnquiry.mnuCardPendingActionCso.Enabled = True
        frmEnquiry.mnuAtmCardFromFinacle.Enabled = True
     Else
        frmEnquiry.mnuCardPendingActionCso.Enabled = False
        frmEnquiry.mnuAtmCardFromFinacle.Enabled = False
     End If
     
     If InStr(recvLoginMsg.authorityLevel, "~81") > 0 Then
        frmEnquiry.cmdMerchant.Enabled = True
        If Trim(recvLoginMsg.authorityLevel) = "~81~" Then
           frmEnquiry.cmdCustomer.Enabled = False
        End If
     Else
        frmEnquiry.cmdMerchant.Enabled = False
     End If
     
     If nameSearchAllowedAtBranch = True Then
        frmEnquiry.cmdNameSearch.Enabled = True
     Else
        frmEnquiry.cmdNameSearch.Enabled = False
     End If
              
     CSD_mdiForm.staticStatus.Panels(3).text = errSelectCriteria(UserLang)
     CSD_mdiForm.staticStatus.Panels(4).text = hostName
     Exit Sub
     
err_handler:
    LogData "Error " & Err.Number & " (" & Err.Description & ") occured while loading enquiry form"
    
    If Err.Number = 3024 Or Err.Number = 3051 Or Err.Number = 3044 Then
       If fileInd = "1" Then
          MsgBox "The local database  " & dbPath & "  does not exist... Please check..."
       ElseIf fileInd = "2" Then
          MsgBox "The local transaction database  " & transDbPath & "  does not exist... Please check..."
       Else
          MsgBox "Error  " & Err.Number & "  " & Err.Description & "  occured ; Please check "
       End If
       End
    Else
      Resume Next
    End If

End Sub

Public Function checkForSpecialChars(cardName As String) As Boolean
       Dim validChars As String
       Dim nameLength As Integer
       Dim tmpChar As String
       Dim i As Integer
             
       validChars = " !#%&'()*+,-./0123456789:;<=>@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_!#$&'()*+,"
       
       nameLength = Len(cardName)
       checkForSpecialChars = False
       For i = 1 To nameLength
           tmpChar = Mid$(cardName, i, 1)
           If InStr(validChars, tmpChar) = 0 Then
              If InStr(cardName, Chr$(34)) = 0 Then  '  chr(34) = "
                 checkForSpecialChars = False
                 Exit For
              End If
           End If
        Next
        If i > nameLength Then
           checkForSpecialChars = True
        End If
        
End Function
Public Sub parseStopChqDetail()
    recvStopChqDetail.status = Mid$(RecvStr, 1, 3)
    recvStopChqDetail.service = Mid$(RecvStr, 4, 2)
    recvStopChqDetail.aRemarks = Mid$(RecvStr, 6, 50)
    recvStopChqDetail.eRemarks = Mid$(RecvStr, 56, 50)
    recvStopChqDetail.accNo = Mid$(RecvStr, 106, 14)
    recvStopChqDetail.filler1 = Mid$(RecvStr, 120, 7)
    recvStopChqDetail.chequeNo = Mid$(RecvStr, 127, 10)
    recvStopChqDetail.amount = Mid$(RecvStr, 137, 14)
    recvStopChqDetail.dateStop = Mid$(RecvStr, 151, 8)
    recvStopChqDetail.payeeName = Mid$(RecvStr, 159, 25)
    recvStopChqDetail.chequeFrom = Mid$(RecvStr, 184, 8)
    recvStopChqDetail.newOrUpdate = Mid$(RecvStr, 192, 1)
    recvStopChqDetail.supervisorComments = Mid$(RecvStr, 193, 200)
    recvStopChqDetail.stopChqUserId = Mid$(RecvStr, 393, 10)
End Sub

Public Sub fillFrmStopChqDetail()
    
    frmStopChqDetails.txtAcctNo = recvStopChqDetail.accNo
    frmStopChqDetails.txtChequeNo = Val(recvStopChqDetail.chequeNo)
    frmStopChqDetails.txtChqAmt = Format(Val(recvStopChqDetail.amount) / 100, "###########0.00")
    frmStopChqDetails.txtFromCheque = Val(recvStopChqDetail.chequeFrom)
    frmStopChqDetails.txtDetails = recvStopChqDetail.payeeName
    frmStopChqDetails.cmbStopDate = Mid$(recvStopChqDetail.dateStop, 7, 2)
    frmStopChqDetails.cmbStopMonth = Mid$(recvStopChqDetail.dateStop, 5, 2)
    frmStopChqDetails.txtStopYear = Mid$(recvStopChqDetail.dateStop, 1, 4)
    frmStopChqDetails.txtUserStopped = recvStopChqDetail.stopChqUserId
End Sub


Public Sub delay(period As Integer)

    Dim PauseTime, Start, Finish, TotalTime
    PauseTime = period   ' Set duration.
    Start = timer        ' Set start time.
    Do While timer < Start + PauseTime
       DoEvents   ' Yield to other processes.
    Loop
    Finish = timer   ' Set end time.
    TotalTime = Finish - Start   ' Calculate total time.

End Sub

Public Function bmAmtToDbl(amount As String) As String

'    double bmAmtToDbl(bmAmt, length)
'char *bmAmt;
' int length;
'{
'    char tmpStr[50];
'
'    sprintf(tmpStr, "%.*s", length, bmAmt);
'    if ( tmpStr[length-1] >= 'P' )
'    {
'        tmpStr[length-1] = tmpStr[length-1] - 'P' + '0';
'        return -atof(tmpStr);
'    }
'    Else
'        return atof(tmpStr);
'}
    Dim tmpStr As String
    
    If Len(RTrim(amount)) = 0 Then
       bmAmtToDbl = amount
       Exit Function
    End If
    
    If Asc(Right(amount, 1)) >= Asc("p") Then
       Mid$(amount, Len(amount), 1) = Chr(Asc(Right(amount, 1)) - Asc("p") + Asc("0"))
    ElseIf Asc(Right(amount, 1)) >= Asc("P") Then
       Mid$(amount, Len(amount), 1) = Chr(Asc(Right(amount, 1)) - Asc("P") + Asc("0"))
    End If
    
    bmAmtToDbl = amount
End Function
Public Function dblToBmAmt(amount As String) As String
Dim tmpStr As String

'char *dblToBmAmt(bmAmt, length)
'double bmAmt;
'int length;
'{
'    extern char bmAmtStr[25];  /* to be declared in original program */
'
'    if ( bmAmt == 0 )
'        sprintf(bmAmtStr, "%0*.0f", length, 0.0);
'    else if ( bmAmt < 0 )
'    {
'        sprintf(bmAmtStr, "%0*.0f", length, -bmAmt);
'        bmAmtStr[length-1] = bmAmtStr[length-1] -'0' + 'P';
'        if ( bmAmtStr[0] == '-' )
'            bmAmtStr[0] = '0';
'    }
'    Else
'        sprintf(bmAmtStr, "%0*.0f", length, bmAmt);
'    return bmAmtStr;
'}

If Val(amount) = 0 Then
   dblToBmAmt = String(Len(amount), "0")
ElseIf Val(amount) < 0 Then
   tmpStr = Format(Val(amount) * -1, String(Len(amount), "0"))
   Mid$(tmpStr, Len(amount), 1) = Chr(Asc(Right(amount, 1)) - Asc("0") + Asc("p"))
   If Mid$(tmpStr, 1, 1) = "-" Then
      Mid$(tmpStr, 1, 1) = "0"
   End If
   dblToBmAmt = tmpStr
Else
   dblToBmAmt = Format(Val(amount), String(Len(amount), "0"))
End If
  
End Function


Public Function getUnixDateTime() As String
    Dim strmsglen As String
    Dim retStatus As String
    Dim tDateTime As String
    
    SendMsg = "000069" & "65" & gBranchCode & Format(gUserId, "!@@@@@@@@@@")
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       getUnixDateTime = "ERROR"
       Exit Function
    End If
    
    retStatus = Mid$(RecvStr, 15, 3)
    
    If retStatus <> "000" Then
       getUnixDateTime = "ERROR"
    Else
       getUnixDateTime = RecvStr
    End If
End Function

Public Sub formatAuthLevel()
    Dim tmpStr As String
    Dim i As Integer
    Dim strLen As Integer
    
    strLen = Len(RTrim(recvLoginMsg.authorityLevel))
    tmpStr = "~"
    For i = 1 To strLen Step 2
        tmpStr = tmpStr & Mid$(recvLoginMsg.authorityLevel, i, 2) & "~"
    Next
    
    ' Now , add the new authority level which is added to expand user's role
    ' and add it together in recvloginmsg.authoritylevel
    strLen = Len(RTrim(recvLoginMsg.authorityLevel2))
    For i = 1 To strLen Step 2
        tmpStr = tmpStr & Mid$(recvLoginMsg.authorityLevel2, i, 2) & "~"
    Next
    
    recvLoginMsg.authorityLevel = tmpStr
    
End Sub
Public Function lastDay(tDate As String) As String
   ' tDate should be in the format YYYYMM
   Dim mthArray(13) As Integer
   Dim s As String
   On Error GoTo err_handler
   mthArray(1) = 31
   mthArray(2) = 28
   mthArray(3) = 31
   mthArray(4) = 30
   mthArray(5) = 31
   mthArray(6) = 30
   mthArray(7) = 31
   mthArray(8) = 31
   mthArray(9) = 30
   mthArray(10) = 31
   mthArray(11) = 30
   mthArray(12) = 31
   
   s = "1"
   If isleap(CInt(Mid$(tDate, 1, 4))) Then
      mthArray(2) = 29
   Else
      mthArray(2) = 28
   End If
   s = "2"
   lastDay = CStr(mthArray(CInt(Mid$(tDate, 5, 2))))
   Exit Function
err_handler:
   LogData "Unexpected error  " + str(Err.Number) + "  " + Err.Description + "  occured in line " + s + " [lastDay()]"
   Resume Next
End Function

Public Function validIdNumber(idNo As String) As Boolean
    Dim i As Integer
    Dim recdChkDgt As Integer
    Dim oddDgtSum As Integer
    Dim evenDgtSum As Integer
    Dim intNum As Integer
    Dim tmpInt As Integer
    Dim calcChkDgt As Integer
    
    
    If Len(RTrim(idNo)) <> 10 Then
       validIdNumber = False
       Exit Function
    End If
    idNo = Trim(idNo)
    
    recdChkDgt = Val(Right(idNo, 1))
    oddDgtSum = 0
    evenDgtSum = 0
    For i = 1 To 9
        intNum = Val(Mid$(idNo, i, 1))
        If i Mod 2 <> 0 Then
           tmpInt = intNum * 2
           oddDgtSum = oddDgtSum + Fix(tmpInt / 10) + tmpInt Mod 10
        Else
           evenDgtSum = evenDgtSum + intNum
        End If
    Next
    
    tmpInt = ((oddDgtSum + evenDgtSum) Mod 10)
    
    If tmpInt > 0 Then
       calcChkDgt = 10 - tmpInt
    Else
       calcChkDgt = tmpInt
    End If
    
    If calcChkDgt = recdChkDgt Then
       validIdNumber = True
    Else
       validIdNumber = False
    End If
End Function

Public Function getScreenSetNo() As String

    If mainCategoryCode = "01" Then    ' Individual
       If subCategoryCode = "01" Or _
          subCategoryCode = "02" Or _
          subCategoryCode = "59" Or _
          subCategoryCode = "69" Or _
          subCategoryCode = "73" Then   ' 01 - Individual Saudi National
                                        ' 02 - Individual saudi with special circumstance
                                        ' 59 - Tribesmen of Rabi Alkhali
                                        ' 69 - Saudi individual exempted from presenting
                                        '      personal photo
                                        ' 73 - Non-resident saudi resident outside kingdom
          getScreenSetNo = "1"
       ElseIf subCategoryCode = "03" Or _
              subCategoryCode = "04" Or _
              subCategoryCode = "05" Or _
              subCategoryCode = "06" Or _
              subCategoryCode = "07" Or _
              subCategoryCode = "08" Or _
              subCategoryCode = "09" Or _
              subCategoryCode = "60" Or _
              subCategoryCode = "61" Or _
              subCategoryCode = "62" Or _
              subCategoryCode = "63" Or _
              subCategoryCode = "70" Or _
              subCategoryCode = "71" Or _
              subCategoryCode = "72" Or _
              subCategoryCode = "74" Or _
              subCategoryCode = "84" Then
                                            ' 03 - Individual GCC citizen
                                            ' 04 - Expatriate with valid Iqama
                                            ' 05 - Tribal Individual _
                                            ' 06 - Employee Iqama in passport [visit visa]
                                            ' 07 - Resident foreigners investing in local
                                            '      share mutual fund only
                                            ' 08 - Non-Resident foreigners investing in local _
                                            '      share mutual fund only _
                                            ' 09 - Other Non-resident individuals
                                            ' 60 - Expats with other dependents
                                            ' 61 - Expats (The Burmese)
                                            ' 62 - Expats(The beluchis and turkistanians
                                            ' 63 - Minor Expats under expats' iqama
                                            ' 70 - Expats exempted from working with sponsors
                                            ' 71 - Expats working in the kingdom without IQAMA
                                            ' 72 - Expats saudi stewards
                                            ' 74 - GCC national residing in kingdom
                                            ' 84 - Juveniles Distinguished Person
           getScreenSetNo = "2"
        ElseIf subCategoryCode = "65" Then
           getScreenSetNo = "A"
        Else
           getScreenSetNo = "-1"
        End If
    ElseIf mainCategoryCode = "00" Then ' Undefined
        If subCategoryCode = "00" Then
           getScreenSetNo = "7"   ' Quick customer opening
        ElseIf subCategoryCode = "56" Then
           getScreenSetNo = "8"   ' Internal customer opening
        ElseIf subCategoryCode = "99" Then  'LUCKY
           getScreenSetNo = "9"   ' Quick Pension customer opening
        Else
           getScreenSetNo = "-1"
        End If
    ElseIf (subCategoryCode >= "10" And _
           subCategoryCode <= "38") Or _
           subCategoryCode = "57" Or _
           subCategoryCode = "58" Or _
           subCategoryCode = "64" Or _
           subCategoryCode = "75" Or _
           subCategoryCode = "81" Or _
           subCategoryCode = "83" Or _
           subCategoryCode = "87" Then
           getScreenSetNo = "3"
    ElseIf subCategoryCode >= "45" And _
           subCategoryCode <= "52" Or _
           subCategoryCode = "66" Then
           getScreenSetNo = "6"
    ElseIf subCategoryCode = "41" Or _
           subCategoryCode = "42" Or _
           subCategoryCode = "43" Or _
           subCategoryCode = "44" Or _
           subCategoryCode = "53" Or _
           subCategoryCode = "54" Or _
           subCategoryCode = "55" Or _
           subCategoryCode = "67" Or _
           subCategoryCode = "76" Or _
           subCategoryCode = "77" Or _
           subCategoryCode = "78" Or _
           subCategoryCode = "79" Or _
           subCategoryCode = "80" Or _
           subCategoryCode = "82" Or _
           subCategoryCode = "85" Or _
           subCategoryCode = "86" Or _
           subCategoryCode = "88" Then
           getScreenSetNo = "4"
    ElseIf subCategoryCode = "39" Or _
           subCategoryCode = "40" Then
           getScreenSetNo = "5"
    ElseIf mainCategoryCode = "ES" And subCategoryCode = "ES" Then
           getScreenSetNo = "E"
    Else
           getScreenSetNo = "-1"
    End If
End Function
Public Sub parseQuickCustomerDetail()
    Dim pos As Integer
    
    pos = pos + 1
    
   recvQuickCustMsg.status = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvQuickCustMsg.service = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvQuickCustMsg.aRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvQuickCustMsg.eRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvQuickCustMsg.customerNo = Mid$(RecvStr, pos, 7)
   pos = pos + 7
   recvQuickCustMsg.supervisorId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvQuickCustMsg.custBranchCode = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvQuickCustMsg.samaMainCategory = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvQuickCustMsg.samaSubCategory = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvQuickCustMsg.idNo = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.idType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.idIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
   pos = pos + 20
   recvQuickCustMsg.idDateType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.idIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvQuickCustMsg.idIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvQuickCustMsg.idExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvQuickCustMsg.idExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
   pos = pos + 8
   recvQuickCustMsg.preferredLang = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.nationality = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvQuickCustMsg.titleCode = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvQuickCustMsg.sexCode = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.businessType = RTrim(Mid$(RecvStr, pos, 3))
   pos = pos + 3
   recvQuickCustMsg.aFirstName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.a2ndName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.a3rdName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.aLastName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.aShortName = RTrim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   recvQuickCustMsg.eFirstName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.e2ndName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.e3rdName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.eLastName = RTrim(Mid$(RecvStr, pos, 15))
   pos = pos + 15
   recvQuickCustMsg.eShortName = RTrim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   recvQuickCustMsg.address1 = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvQuickCustMsg.address2 = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvQuickCustMsg.poBox = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvQuickCustMsg.cityName = Mid$(RecvStr, pos, 20)
   pos = pos + 20
   recvQuickCustMsg.zipCode = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvQuickCustMsg.country = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvQuickCustMsg.currentAccInfo = Mid$(RecvStr, pos, 11)
   pos = pos + 11
   recvQuickCustMsg.cardType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.electronIntlRequired = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.electronIntlName = Mid$(RecvStr, pos, 26)
   pos = pos + 26
   recvQuickCustMsg.supervisorComments = RTrim(Mid$(RecvStr, pos, 200))
   pos = pos + 200
   recvQuickCustMsg.foundInAList = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.foundInBList = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.foundInCList = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.reportedBank = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvQuickCustMsg.nameInABCList = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvQuickCustMsg.exisingCustomer = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.existCustNo = Mid$(RecvStr, pos, 7)
   pos = pos + 7
   recvQuickCustMsg.existCustName = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvQuickCustMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.altBranchCode = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvQuickCustMsg.restrictedBranchFlag = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.custOpenDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvQuickCustMsg.branchOpened = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvQuickCustMsg.openMakerId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvQuickCustMsg.openSupervisorId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvQuickCustMsg.lastUpdateDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvQuickCustMsg.lastUpdateBranch = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvQuickCustMsg.lastUpdateMakerId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvQuickCustMsg.lastUpdateSupervisorId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvQuickCustMsg.keyDateTime = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   recvQuickCustMsg.foundInTlist = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.noOfRecs = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvQuickCustMsg.dobDateType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.dobDateH = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvQuickCustMsg.dobDateG = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvQuickCustMsg.addressType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.internalCustomer = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvQuickCustMsg.displayWarningMsgOnDuplicateId = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   pos = pos + 30 ' for the filler
   receiveSearchEngineDetails Val(recvQuickCustMsg.noOfRecs), pos

End Sub

Public Sub parseSaudiIndividualDetail()

    Dim pos As Integer
    pos = 1

    recvSaudiIndividualMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSaudiIndividualMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSaudiIndividualMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSaudiIndividualMsg.customerNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvSaudiIndividualMsg.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvSaudiIndividualMsg.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvSaudiIndividualMsg.samaMainCategory = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.samaSubCategory = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.idNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.idIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSaudiIndividualMsg.idDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.idIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.idIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.idExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.idExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    
    recvSaudiIndividualMsg.ppNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.ppIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSaudiIndividualMsg.ppDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.ppIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.ppIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.ppExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.ppExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
     
    recvSaudiIndividualMsg.hafizaNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.hafIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSaudiIndividualMsg.hafDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.hafIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.hafIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.hafExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.hafExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    
    recvSaudiIndividualMsg.familyRegnNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.frIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSaudiIndividualMsg.frDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.frIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.frIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.frExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.frExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.certBirthNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    
    recvSaudiIndividualMsg.langPref = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.nationality = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvSaudiIndividualMsg.titleCode = RTrim(Mid$(RecvStr, pos, 2))
    pos = pos + 2
    recvSaudiIndividualMsg.dobDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.dobDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.dobDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSaudiIndividualMsg.sexCode = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.vipCode = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.maritalStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.noOfDependents = RTrim(Mid$(RecvStr, pos, 2))
    pos = pos + 2
    recvSaudiIndividualMsg.residentStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.businessType = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSaudiIndividualMsg.aFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.a2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.a3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.aLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.aShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSaudiIndividualMsg.eFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.e2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.e3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.eLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSaudiIndividualMsg.eShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSaudiIndividualMsg.address1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSaudiIndividualMsg.address2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSaudiIndividualMsg.poBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.cityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSaudiIndividualMsg.zipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.country = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvSaudiIndividualMsg.telOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvSaudiIndividualMsg.telOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.telOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvSaudiIndividualMsg.telHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvSaudiIndividualMsg.telHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.telHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvSaudiIndividualMsg.faxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvSaudiIndividualMsg.faxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.faxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvSaudiIndividualMsg.mobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.pagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.eMail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    
    recvSaudiIndividualMsg.educationCode = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.professionCode = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.positionCode = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.monthlyIncome = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.ownerShip = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvSaudiIndividualMsg.segmentation = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.employerName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSaudiIndividualMsg.department = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSaudiIndividualMsg.employerPoBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.employerCity = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSaudiIndividualMsg.employerZipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.documents = Mid$(RecvStr, pos, 60)
    documentsSelected = recvSaudiIndividualMsg.documents
    pos = pos + 60
    recvSaudiIndividualMsg.documentOther = RTrim(Mid$(RecvStr, pos, 50))
    otherDocumentsEntered = recvSaudiIndividualMsg.documentOther
    pos = pos + 50
    recvSaudiIndividualMsg.singleJointAcc = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.packagedAcc = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.noOfJointAcc = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.jointAccNameOnCheck = RTrim(Mid$(RecvStr, pos, 60))
    pos = pos + 60
    recvSaudiIndividualMsg.jointAccNameOnReports = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSaudiIndividualMsg.signatureNature = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.electronIntlRequired = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.electronIntlName = RTrim(Mid$(RecvStr, pos, 26))
    pos = pos + 26
    recvSaudiIndividualMsg.electronIntlSuppRequired = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.electronIntlSuppName = RTrim(Mid$(RecvStr, pos, 26))
    pos = pos + 26
    recvSaudiIndividualMsg.deliveryToBranchOrPO = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.deliveryAddress1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSaudiIndividualMsg.deliveryAddress2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSaudiIndividualMsg.deliveryPoBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.deliveryCity = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSaudiIndividualMsg.deliveryZip = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvSaudiIndividualMsg.internetBankAcc = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.custAdviceFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.altBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvSaudiIndividualMsg.restrictedBranchFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.updatedForSama = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.relationshipManager = RTrim(Mid$(RecvStr, pos, 25))
    pos = pos + 25
    recvSaudiIndividualMsg.generalMemo = RTrim(Mid$(RecvStr, pos, 25))
    pos = pos + 25
    recvSaudiIndividualMsg.referenceReqdFor = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvSaudiIndividualMsg.supervisorComments = RTrim(Mid$(RecvStr, pos, 200))
    pos = pos + 200
    recvSaudiIndividualMsg.currentAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvSaudiIndividualMsg.savingsAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvSaudiIndividualMsg.otherAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvSaudiIndividualMsg.foundInAList = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.foundInBList = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.foundInCList = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.reportedBank = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvSaudiIndividualMsg.nameInABCList = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvSaudiIndividualMsg.exisingCustomer = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.existCustNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvSaudiIndividualMsg.existCustName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvSaudiIndividualMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.custOpenDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvSaudiIndividualMsg.branchOpened = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvSaudiIndividualMsg.openMakerId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvSaudiIndividualMsg.openSupervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvSaudiIndividualMsg.lastUpdateDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvSaudiIndividualMsg.lastUpdateBranch = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvSaudiIndividualMsg.lastUpdateMakerId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvSaudiIndividualMsg.lastUpdateSupervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvSaudiIndividualMsg.keyDateTime = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvSaudiIndividualMsg.foundInTlist = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSaudiIndividualMsg.cardType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.marketingMemo = Mid$(RecvStr, pos, 25)
    pos = pos + 25
    recvSaudiIndividualMsg.addressType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.custOpenSource = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.bmUpdateStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.excludeFromAtmFees = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.excludeFromMinBalFees = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.accFreezingGracePeriod = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSaudiIndividualMsg.samaAuthNo = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvSaudiIndividualMsg.samaAuthIssuedAt = Mid$(RecvStr, pos, 20)
    pos = pos + 20
    recvSaudiIndividualMsg.samaAuthDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.samaAuthIssueDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvSaudiIndividualMsg.samaAuthIssueDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvSaudiIndividualMsg.samaAuthExpiryDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvSaudiIndividualMsg.samaAuthExpiryDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvSaudiIndividualMsg.pkgStmtFreqOverride = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.displayWarningMsgOnDuplicateId = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSaudiIndividualMsg.mainBrCodeUpdAllowed = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    pos = pos + 97 ' for the filler
    'pos = pos + 16 ' for the filler
    receiveSearchEngineDetails Val(recvSaudiIndividualMsg.noOfRecs), pos

End Sub

Public Sub parseIndividualOthersDetail()
    Dim pos As Integer
    pos = 1

    recvOtherIndividualMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvOtherIndividualMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvOtherIndividualMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvOtherIndividualMsg.customerNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvOtherIndividualMsg.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvOtherIndividualMsg.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvOtherIndividualMsg.samaMainCategory = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.samaSubCategory = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.iqamaNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.iqamaIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOtherIndividualMsg.iqamaDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.iqamaIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.iqamaIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.iqamaExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.iqamaExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.ppNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.ppIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOtherIndividualMsg.ppDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.ppIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.ppIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.ppExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.ppExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.langPref = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.nationality = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvOtherIndividualMsg.titleCode = RTrim(Mid$(RecvStr, pos, 2))
    pos = pos + 2
    recvOtherIndividualMsg.dobDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.dobDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.dobDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.sexCode = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.vipCode = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.maritalStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.noOfDependents = RTrim(Mid$(RecvStr, pos, 2))
    pos = pos + 2
    recvOtherIndividualMsg.residentStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.businessType = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvOtherIndividualMsg.aFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.a2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.a3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.aLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.aShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.eFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.e2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.e3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.eLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.eShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.address1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.address2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.poBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.cityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOtherIndividualMsg.zipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.country = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvOtherIndividualMsg.telOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.telOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.telOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.telHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.telHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.telHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.faxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.faxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.faxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.mobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.pagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.eMail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    
    recvOtherIndividualMsg.homeCountryId = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.homeCountryIdDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.homeCountryIdIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.homeCountryIdIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.homeCountryIdExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.homeCountryIdExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.homeAddress1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.homeAddress2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.homePoBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.homeCityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOtherIndividualMsg.homeZipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.homeCountry = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvOtherIndividualMsg.homeTelOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.homeTelOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.homeTelOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.homeTelHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.homeTelHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.homeTelHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.homeFaxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.homeFaxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.homeFaxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOtherIndividualMsg.homeMobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.homePagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.homeEmail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    
    recvOtherIndividualMsg.educationCode = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.professionCode = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.positionCode = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.monthlyIncome = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.ownerShip = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvOtherIndividualMsg.segmentation = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.employerName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.department = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOtherIndividualMsg.employerPoBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.employerCity = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOtherIndividualMsg.employerZipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.documents = Mid$(RecvStr, pos, 60)
    pos = pos + 60
    documentsSelected = recvOtherIndividualMsg.documents
    recvOtherIndividualMsg.documentOther = RTrim(Mid$(RecvStr, pos, 50))
    pos = pos + 50
    otherDocumentsEntered = recvOtherIndividualMsg.documentOther
    recvOtherIndividualMsg.singleJointAcc = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    
    recvOtherIndividualMsg.packagedAcc = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.noOfJointAcc = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.jointAccNameOnCheck = RTrim(Mid$(RecvStr, pos, 60))
    pos = pos + 60
    recvOtherIndividualMsg.jointAccNameOnReports = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.signatureNature = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.electronIntlRequired = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.electronIntlName = RTrim(Mid$(RecvStr, pos, 26))
    pos = pos + 26
    recvOtherIndividualMsg.electronIntlSuppRequired = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.electronIntlSuppName = RTrim(Mid$(RecvStr, pos, 26))
    pos = pos + 26
    recvOtherIndividualMsg.deliveryToBranchOrPO = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.deliveryAddress1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.deliveryAddress2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOtherIndividualMsg.deliveryPoBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.deliveryCity = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOtherIndividualMsg.deliveryZip = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOtherIndividualMsg.internetBankAcc = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.custAdviceFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.altBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvOtherIndividualMsg.restrictedBranchFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.updatedForSama = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.relationshipManager = RTrim(Mid$(RecvStr, pos, 25))
    pos = pos + 25
    recvOtherIndividualMsg.generalMemo = RTrim(Mid$(RecvStr, pos, 25))
    pos = pos + 25
    recvOtherIndividualMsg.interGroupAccNo = RTrim(Mid$(RecvStr, pos, 14))
    pos = pos + 14
    recvOtherIndividualMsg.specialRefNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.samaAuthNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOtherIndividualMsg.samaAuthDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.samaAuthDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.samaAuthDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOtherIndividualMsg.supervisorComments = RTrim(Mid$(RecvStr, pos, 200))
    pos = pos + 200
    recvOtherIndividualMsg.currentAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvOtherIndividualMsg.savingsAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvOtherIndividualMsg.otherAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvOtherIndividualMsg.foundInAList = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.foundInBList = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.foundInCList = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.reportedBank = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvOtherIndividualMsg.nameInABCList = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvOtherIndividualMsg.exisingCustomer = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.existCustNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvOtherIndividualMsg.existCustName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvOtherIndividualMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.overrideForNoSamaAuth = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.custOpenDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.branchOpened = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvOtherIndividualMsg.openMakerId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvOtherIndividualMsg.openSupervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvOtherIndividualMsg.lastUpdateDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.lastUpdateBranch = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvOtherIndividualMsg.lastUpdateMakerId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvOtherIndividualMsg.lastUpdateSupervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvOtherIndividualMsg.keyDateTime = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvOtherIndividualMsg.foundInTlist = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOtherIndividualMsg.cardType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.marketingMemo = Mid$(RecvStr, pos, 25)
    pos = pos + 25
    recvOtherIndividualMsg.addressType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.custOpenSource = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.bmUpdateStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.excludeFromAtmFees = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.excludeFromMinBalFees = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.accFreezingGracePeriod = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvOtherIndividualMsg.visaNo = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvOtherIndividualMsg.visaIssuedAt = Mid$(RecvStr, pos, 20)
    pos = pos + 20
    recvOtherIndividualMsg.visaDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.visaIssueDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.visaIssueDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.visaExpiryDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.visaExpiryDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.approvalRefNo = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvOtherIndividualMsg.appDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.appIssueDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.appIssueDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.appExpiryDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.appExpiryDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvOtherIndividualMsg.appRefName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvOtherIndividualMsg.pkgStmtFreqOverride = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.displayWarningMsgOnDuplicateId = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.iqamaType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOtherIndividualMsg.mainBrCodeUpdAllowed = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    pos = pos + 96 ' for the filler
    'pos = pos + 19 ' for the filler
    receiveSearchEngineDetails Val(recvOtherIndividualMsg.noOfRecs), pos
End Sub
Public Sub parseJuristicDetail()
    Dim pos As Integer
    pos = 1
    recvJuristicMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvJuristicMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvJuristicMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvJuristicMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvJuristicMsg.customerNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvJuristicMsg.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvJuristicMsg.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvJuristicMsg.samaMainCategory = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvJuristicMsg.samaSubCategory = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvJuristicMsg.crNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvJuristicMsg.crIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvJuristicMsg.crDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.crIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.crIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.crExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.crExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.licNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvJuristicMsg.licDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.licIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.licIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.licExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.licExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.samaAuthNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvJuristicMsg.samaAuthDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.samaAuthIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.samaAuthIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.samaAuthExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.samaAuthExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.ppNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvJuristicMsg.ppDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.ppIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.ppIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.ppExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.ppExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.dcNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvJuristicMsg.dcDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.dcIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.dcIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.dcExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.dcExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.visaNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvJuristicMsg.visaDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.visaIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.visaIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.visaExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.visaExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.contractNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvJuristicMsg.contractDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.contractIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.contractIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.contractExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.contractExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.langPref = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.nationality = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvJuristicMsg.purposeOfAccount = RTrim(Mid$(RecvStr, pos, 50))
    pos = pos + 50
    recvJuristicMsg.govtShareHoldingPerc = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvJuristicMsg.saudiShareHoldingPerc = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvJuristicMsg.foreignShareHoldingPerc = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvJuristicMsg.doeDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.doeDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.doeDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvJuristicMsg.businessType = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvJuristicMsg.aOrgFirstName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.aOrg2ndName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.aOrgShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.eOrgFirstName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.eOrg2ndName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.eOrgShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.orgAlphaSearch = RTrim(Mid$(RecvStr, pos, 6))
    pos = pos + 6
    recvJuristicMsg.address1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.address2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.poBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.cityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvJuristicMsg.zipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.country = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvJuristicMsg.telOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.telOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.telOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.telHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.telHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.telHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.faxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.faxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.faxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.mobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.pagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.eMail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    
    recvJuristicMsg.homeAddress1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.homeAddress2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvJuristicMsg.homePoBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.homeCityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvJuristicMsg.homeZipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.homeCountry = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvJuristicMsg.homeTelOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.homeTelOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.homeTelOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.homeTelHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.homeTelHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.homeTelHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.homeFaxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.homeFaxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.homeFaxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvJuristicMsg.homeMobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.homePagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvJuristicMsg.homeEmail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    
    recvJuristicMsg.documents = Mid$(RecvStr, pos, 60)
    pos = pos + 60
    recvJuristicMsg.documentOther = RTrim(Mid$(RecvStr, pos, 50))
    pos = pos + 50
    recvJuristicMsg.signatureNature = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.internetBankAcc = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.custAdviceFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.altBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvJuristicMsg.restrictedBranchFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.updatedForSama = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.relationshipManager = RTrim(Mid$(RecvStr, pos, 25))
    pos = pos + 25
    recvJuristicMsg.generalMemo = RTrim(Mid$(RecvStr, pos, 25))
    pos = pos + 25
    recvJuristicMsg.supervisorComments = RTrim(Mid$(RecvStr, pos, 200))
    pos = pos + 200
    recvJuristicMsg.currentAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvJuristicMsg.savingsAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvJuristicMsg.otherAccInfo = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvJuristicMsg.exisingCustomer = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.existCustNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvJuristicMsg.existCustName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvJuristicMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.overrideForNoSamaAuth = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.overrideForNonSaudi = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.custOpenDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvJuristicMsg.branchOpened = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvJuristicMsg.openMakerId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvJuristicMsg.openSupervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvJuristicMsg.lastUpdateDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvJuristicMsg.lastUpdateBranch = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvJuristicMsg.lastUpdateMakerId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvJuristicMsg.lastUpdateSupervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvJuristicMsg.keyDateTime = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvJuristicMsg.foundInTlist = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvJuristicMsg.marketingMemo = Mid$(RecvStr, pos, 25)
    pos = pos + 25
    recvJuristicMsg.addressType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    'The following fields were added during SAR-II and search engine layout
    'got changed; Search engine while juristic customer opening will work only
    'with this version(2.7.2) or above
    recvJuristicMsg.accFreezingGracePeriod = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvJuristicMsg.approvalRefNo = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvJuristicMsg.appDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.appIssueDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvJuristicMsg.appIssueDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvJuristicMsg.appExpiryDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvJuristicMsg.appExpiryDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvJuristicMsg.appRefName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvJuristicMsg.signatoryForOthers = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.displayWarningMsgOnDuplicateId = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvJuristicMsg.mainBrCodeUpdAllowed = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    pos = pos + 98 ' for the filler
    'till here
    'pos = pos + 24 ' for the filler
    receiveSearchEngineDetails Val(recvJuristicMsg.noOfRecs), pos
       
End Sub

Public Sub fillFrmIndividualOthers()
    Dim tCode As String, i As Integer, mQry As String

     frmIndividualOthers.txtCustomerNo = recvOtherIndividualMsg.customerNo
    
    tCode = recvOtherIndividualMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmIndividualOthers.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmIndividualOthers.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmIndividualOthers.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvOtherIndividualMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmIndividualOthers.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmIndividualOthers.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmIndividualOthers.cmbAltBrCode.text = "0000-NONE"
    End If
    
    frmIndividualOthers.txtIqamaNo = recvOtherIndividualMsg.iqamaNo
    frmIndividualOthers.cmbIqamaIssuedAt.text = recvOtherIndividualMsg.iqamaIssuedAt
    If recvOtherIndividualMsg.iqamaDateType = "0" Or _
       recvOtherIndividualMsg.iqamaDateType = " " Then
       frmIndividualOthers.optIqamaDateHijri.Value = True
       frmIndividualOthers.txtIqamaIssueYear = Mid$(recvOtherIndividualMsg.iqamaIssueDateH, 1, 4)
       frmIndividualOthers.cmbIqamaIssueDate.text = Right$(recvOtherIndividualMsg.iqamaIssueDateH, 2)
       frmIndividualOthers.cmbIqamaIssueMonth.text = Mid$(recvOtherIndividualMsg.iqamaIssueDateH, 5, 2)
       frmIndividualOthers.txtIqamaExpiryYear = Mid$(recvOtherIndividualMsg.iqamaExpiryDateH, 1, 4)
       frmIndividualOthers.cmbIqamaExpiryDate.text = Right$(recvOtherIndividualMsg.iqamaExpiryDateH, 2)
       frmIndividualOthers.cmbIqamaExpiryMonth.text = Mid$(recvOtherIndividualMsg.iqamaExpiryDateH, 5, 2)
    Else
       frmIndividualOthers.optIqamaDateGregorian.Value = True
       frmIndividualOthers.txtIqamaIssueYear = Mid$(recvOtherIndividualMsg.iqamaIssueDateG, 1, 4)
       frmIndividualOthers.cmbIqamaIssueDate.text = Right$(recvOtherIndividualMsg.iqamaIssueDateG, 2)
       frmIndividualOthers.cmbIqamaIssueMonth.text = Mid$(recvOtherIndividualMsg.iqamaIssueDateG, 5, 2)
       frmIndividualOthers.txtIqamaExpiryYear = Mid$(recvOtherIndividualMsg.iqamaExpiryDateG, 1, 4)
       frmIndividualOthers.cmbIqamaExpiryDate.text = Right$(recvOtherIndividualMsg.iqamaExpiryDateG, 2)
       frmIndividualOthers.cmbIqamaExpiryMonth.text = Mid$(recvOtherIndividualMsg.iqamaExpiryDateG, 5, 2)
    End If
    If recvOtherIndividualMsg.iqamaType = "1" Then
       frmIndividualOthers.optPlastic.Value = True
    Else
       frmIndividualOthers.optBook.Value = True
    End If
    
    frmIndividualOthers.txtPPNumber = recvOtherIndividualMsg.ppNo
    frmIndividualOthers.cmbPPIssuedAt.text = recvOtherIndividualMsg.ppIssuedAt
    If recvOtherIndividualMsg.ppDateType = "0" Or _
       recvOtherIndividualMsg.ppDateType = " " Then
       frmIndividualOthers.optPPDateHijri.Value = True
       frmIndividualOthers.txtPPIssueYear = Mid$(recvOtherIndividualMsg.ppIssueDateH, 1, 4)
       frmIndividualOthers.cmbPPIssueDate.text = Right$(recvOtherIndividualMsg.ppIssueDateH, 2)
       frmIndividualOthers.cmbPPIssueMonth.text = Mid$(recvOtherIndividualMsg.ppIssueDateH, 5, 2)
       frmIndividualOthers.txtPPExpiryYear = Mid$(recvOtherIndividualMsg.ppExpiryDateH, 1, 4)
       frmIndividualOthers.cmbPPExpiryDate.text = Right$(recvOtherIndividualMsg.ppExpiryDateH, 2)
       frmIndividualOthers.cmbPPExpiryMonth.text = Mid$(recvOtherIndividualMsg.ppExpiryDateH, 5, 2)
    Else
       frmIndividualOthers.optPPDateGreg.Value = True
       frmIndividualOthers.txtPPIssueYear = Mid$(recvOtherIndividualMsg.ppIssueDateG, 1, 4)
       frmIndividualOthers.cmbPPIssueDate.text = Right$(recvOtherIndividualMsg.ppIssueDateG, 2)
       frmIndividualOthers.cmbPPIssueMonth.text = Mid$(recvOtherIndividualMsg.ppIssueDateG, 5, 2)
       frmIndividualOthers.txtPPExpiryYear = Mid$(recvOtherIndividualMsg.ppExpiryDateG, 1, 4)
       frmIndividualOthers.cmbPPExpiryDate.text = Right$(recvOtherIndividualMsg.ppExpiryDateG, 2)
       frmIndividualOthers.cmbPPExpiryMonth.text = Mid$(recvOtherIndividualMsg.ppExpiryDateG, 5, 2)
    End If
    
    frmIndividualOthers.txtVisaNo = recvOtherIndividualMsg.visaNo
    frmIndividualOthers.cmbVisaIssuedAt.text = recvOtherIndividualMsg.visaIssuedAt
    If recvOtherIndividualMsg.visaDateType = "0" Or _
       recvOtherIndividualMsg.visaDateType = " " Then
       frmIndividualOthers.optVisaDateHijri.Value = True
       frmIndividualOthers.txtVisaIssueYear = Mid$(recvOtherIndividualMsg.visaIssueDateH, 1, 4)
       frmIndividualOthers.cmbVisaIssueDate.text = Right$(recvOtherIndividualMsg.visaIssueDateH, 2)
       frmIndividualOthers.cmbVisaIssueMonth.text = Mid$(recvOtherIndividualMsg.visaIssueDateH, 5, 2)
       frmIndividualOthers.txtVisaExpiryYear = Mid$(recvOtherIndividualMsg.visaExpiryDateH, 1, 4)
       frmIndividualOthers.cmbVisaExpiryDate.text = Right$(recvOtherIndividualMsg.visaExpiryDateH, 2)
       frmIndividualOthers.cmbVisaExpiryMonth.text = Mid$(recvOtherIndividualMsg.visaExpiryDateH, 5, 2)
    Else
       frmIndividualOthers.optVisaDateGreg.Value = True
       frmIndividualOthers.txtVisaIssueYear = Mid$(recvOtherIndividualMsg.visaIssueDateG, 1, 4)
       frmIndividualOthers.cmbVisaIssueDate.text = Right$(recvOtherIndividualMsg.visaIssueDateG, 2)
       frmIndividualOthers.cmbVisaIssueMonth.text = Mid$(recvOtherIndividualMsg.visaIssueDateG, 5, 2)
       frmIndividualOthers.txtVisaExpiryYear = Mid$(recvOtherIndividualMsg.visaExpiryDateG, 1, 4)
       frmIndividualOthers.cmbVisaExpiryDate.text = Right$(recvOtherIndividualMsg.visaExpiryDateG, 2)
       frmIndividualOthers.cmbVisaExpiryMonth.text = Mid$(recvOtherIndividualMsg.visaExpiryDateG, 5, 2)
    End If
    
    If recvOtherIndividualMsg.langPref = "0" Or _
       recvOtherIndividualMsg.langPref = " " Then
       frmIndividualOthers.optLangArabic.Value = True
    Else
       frmIndividualOthers.optLangEnglish.Value = True
    End If
         
    tCode = Mid$(recvOtherIndividualMsg.nationality, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmIndividualOthers.cmbNationality.ListCount
            If Mid(frmIndividualOthers.cmbNationality.List(i), 1, 3) = tCode Then
               frmIndividualOthers.cmbNationality.ListIndex = i  ' RTrim(frmindividualOthers.cmbNationality.List(i))
               Exit For
            End If
        Next i
    Else
        frmIndividualOthers.cmbNationality.ListIndex = -1
    End If
    If i > frmIndividualOthers.cmbNationality.ListCount Then
       frmIndividualOthers.cmbNationality.ListIndex = -1
       'frmindividualOthers.cmbNationality.Text = tCode & "-Not defined in local"
    End If
    
    tCode = Mid$(recvOtherIndividualMsg.titleCode, 1, 2)
    If tCode <> "" Then
        For i = 0 To frmIndividualOthers.cmbTitle.ListCount
            If Mid$(frmIndividualOthers.cmbTitle.List(i), 1, 2) = tCode Then
               frmIndividualOthers.cmbTitle.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmIndividualOthers.cmbTitle.ListIndex = -1
    End If
    If i > frmIndividualOthers.cmbTitle.ListCount Then
       frmIndividualOthers.cmbTitle.ListIndex = -1
       'frmindividualOthers.cmbTitle.Text = tCode & "-Not defined in local"
    End If
    frmIndividualOthers.txtArabFirstName = recvOtherIndividualMsg.aFirstName
    frmIndividualOthers.txtArabic2ndName = recvOtherIndividualMsg.a2ndName
    frmIndividualOthers.txtArabic3rdName = recvOtherIndividualMsg.a3rdName
    frmIndividualOthers.txtArabLastName = recvOtherIndividualMsg.aLastName
    frmIndividualOthers.txtArabShortName = recvOtherIndividualMsg.aShortName
    frmIndividualOthers.txtEngFirstName = recvOtherIndividualMsg.eFirstName
    frmIndividualOthers.txtEnglish2ndName = recvOtherIndividualMsg.e2ndName
    frmIndividualOthers.txtEnglish3rdName = recvOtherIndividualMsg.e3rdName
    frmIndividualOthers.txtEngLastName = recvOtherIndividualMsg.eLastName
    frmIndividualOthers.txtEngShortName = recvOtherIndividualMsg.eShortName
    
    If recvOtherIndividualMsg.dobDateType = "0" Or _
       recvOtherIndividualMsg.dobDateType = " " Then
       frmIndividualOthers.optDOBHijri.Value = True
       frmIndividualOthers.txtDobYear = Mid$(recvOtherIndividualMsg.dobDateH, 1, 4)
       frmIndividualOthers.cmbDobDate.text = Mid$(recvOtherIndividualMsg.dobDateH, 7, 2)
       frmIndividualOthers.cmbDobMonth.text = Mid$(recvOtherIndividualMsg.dobDateH, 5, 2)
    Else
       frmIndividualOthers.optDOBGreg.Value = True
       frmIndividualOthers.txtDobYear = Mid$(recvOtherIndividualMsg.dobDateG, 1, 4)
       frmIndividualOthers.cmbDobDate.text = Mid$(recvOtherIndividualMsg.dobDateG, 7, 2)
       frmIndividualOthers.cmbDobMonth.text = Mid$(recvOtherIndividualMsg.dobDateG, 5, 2)
    End If
    
    If recvOtherIndividualMsg.sexCode = "0" Or _
       recvOtherIndividualMsg.sexCode = " " Then
       frmIndividualOthers.optGenderMale.Value = True
    Else
       frmIndividualOthers.optGenderFemale.Value = True
    End If
    
    If recvOtherIndividualMsg.vipCode = "1" Then
       frmIndividualOthers.optVipYes.Value = True
    Else
       frmIndividualOthers.optVipNo.Value = True
    End If
    
    If recvOtherIndividualMsg.maritalStatus = "0" Or _
       recvOtherIndividualMsg.maritalStatus = " " Then
       frmIndividualOthers.optMarried.Value = True
    ElseIf recvOtherIndividualMsg.maritalStatus = "1" Then
       frmIndividualOthers.OptSingle.Value = True
    Else
       frmIndividualOthers.optOthers.Value = True
    End If
    
    frmIndividualOthers.txtDependents = recvOtherIndividualMsg.noOfDependents
    If recvOtherIndividualMsg.residentStatus = "0" Or _
       recvOtherIndividualMsg.residentStatus = " " Then
       frmIndividualOthers.optResident.Value = True
    Else
       frmIndividualOthers.optNonResident.Value = True
    End If
    
    tCode = Mid$(recvOtherIndividualMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmIndividualOthers.cmbBusinessType.ListCount
            If Mid(frmIndividualOthers.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmIndividualOthers.cmbBusinessType.ListIndex = i ' RTrim(frmindividualOthers.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmIndividualOthers.cmbBusinessType.ListIndex = -1
    End If
    If i > frmIndividualOthers.cmbBusinessType.ListCount Then
       frmIndividualOthers.cmbBusinessType.ListIndex = -1
      'frmindividualOthers.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    If recvOtherIndividualMsg.addressType = "1" Then
       frmIndividualOthers.optSaudiPost.Value = True
       frmIndividualOthers.txtSaudiPostGPSNo = Mid$(recvOtherIndividualMsg.address1, 1, 5)
       frmIndividualOthers.txtSaudiPostStreetName = Mid$(recvOtherIndividualMsg.address1, 7)
       frmIndividualOthers.txtSaudiPostUnit = recvOtherIndividualMsg.poBox
       frmIndividualOthers.txtSaudiPostZipCode = Mid$(recvOtherIndividualMsg.zipCode, 1, 5)
       frmIndividualOthers.txtSaudiPostAdditionalNo = Mid$(recvOtherIndividualMsg.zipCode, 7)
    Else
       frmIndividualOthers.optPoBox.Value = True
       frmIndividualOthers.txtAddress1 = recvOtherIndividualMsg.address1
       frmIndividualOthers.txtAddress2 = recvOtherIndividualMsg.address2
       frmIndividualOthers.txtPOBox = recvOtherIndividualMsg.poBox
       frmIndividualOthers.txtPinCode = recvOtherIndividualMsg.zipCode
       tCode = Mid$(recvOtherIndividualMsg.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmIndividualOthers.cmbCountry.ListCount
              If Mid(frmIndividualOthers.cmbCountry.List(i), 1, 3) = tCode Then
                 frmIndividualOthers.cmbCountry.ListIndex = i 'RTrim(frmindividualOthers.cmbCountry.List(i))
                 Exit For
              End If
          Next i
       Else
          frmIndividualOthers.cmbCountry.ListIndex = -1
       End If
       If i > frmIndividualOthers.cmbCountry.ListCount Then
          frmIndividualOthers.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    frmIndividualOthers.cmbCity.text = recvOtherIndividualMsg.cityName
    
    If Len(RTrim(recvOtherIndividualMsg.telOffAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualOthers.txtOffPhoneCityCode = recvOtherIndividualMsg.telOffAreaCode
    End If
    frmIndividualOthers.txtOffPhoneNo = recvOtherIndividualMsg.telOffNo
    frmIndividualOthers.txtOffPhoneExt = recvOtherIndividualMsg.telOffExt
    If Len(RTrim(recvOtherIndividualMsg.telHomeAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualOthers.txtResPhoneCityCode = recvOtherIndividualMsg.telHomeAreaCode
    End If
    frmIndividualOthers.txtResPhoneNo = recvOtherIndividualMsg.telHomeNo
    frmIndividualOthers.txtResPhoneExt = recvOtherIndividualMsg.telHomeExt
    If Len(RTrim(recvOtherIndividualMsg.faxAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualOthers.txtFaxCityCode = recvOtherIndividualMsg.faxAreaCode
    End If
    frmIndividualOthers.txtFaxNo = recvOtherIndividualMsg.faxNo
    frmIndividualOthers.txtFaxExt = recvOtherIndividualMsg.faxExt
    frmIndividualOthers.txtMobileAreaCode = Mid$(recvOtherIndividualMsg.mobileNo, 1, 2)
    frmIndividualOthers.txtMobileNo = Mid$(recvOtherIndividualMsg.mobileNo, 3)
    frmIndividualOthers.txtPagerNo = recvOtherIndividualMsg.pagerNo
    frmIndividualOthers.txtEmailAddress = recvOtherIndividualMsg.eMail
    
    frmIndividualOthers.cmbOpenDate = Mid$(recvOtherIndividualMsg.custOpenDate, 7, 2)
    frmIndividualOthers.cmbOpenMonth = Mid$(recvOtherIndividualMsg.custOpenDate, 5, 2)
    frmIndividualOthers.txtOpenYear = Mid$(recvOtherIndividualMsg.custOpenDate, 1, 4)
    
    frmIndividualOthers.txtOpenBranch = recvOtherIndividualMsg.branchOpened
    frmIndividualOthers.txtOpenMakerId = recvOtherIndividualMsg.openMakerId
    frmIndividualOthers.txtOpenSupervisorId = recvOtherIndividualMsg.openSupervisorId
    
    frmIndividualOthers.cmbUpdateDate = Mid$(recvOtherIndividualMsg.lastUpdateDate, 7, 2)
    frmIndividualOthers.cmbUpdateMonth = Mid$(recvOtherIndividualMsg.lastUpdateDate, 5, 2)
    frmIndividualOthers.txtUpdateYear = Mid$(recvOtherIndividualMsg.lastUpdateDate, 1, 4)
    frmIndividualOthers.txtUpdateBranch = recvOtherIndividualMsg.lastUpdateBranch
    frmIndividualOthers.txtUpdateMakerId = recvOtherIndividualMsg.lastUpdateMakerId
    frmIndividualOthers.txtUpdateSupervisorId = recvOtherIndividualMsg.lastUpdateSupervisorId
End Sub

Public Sub fillFrmIndividualOthers2()

    Dim tCode As String
    Dim i As Integer
      
  tCode = recvOtherIndividualMsg.educationCode
  If tCode <> "" Then
      For i = 0 To frmIndividualOthers2.cmbEducation.ListCount
          If Mid(frmIndividualOthers2.cmbEducation.List(i), 3, 2) = tCode Then
             frmIndividualOthers2.cmbEducation.ListIndex = i
             Exit For
          End If
      Next i
  Else
      frmIndividualOthers2.cmbEducation.ListIndex = -1
  End If
  If i > frmIndividualOthers2.cmbEducation.ListCount Then
     frmIndividualOthers2.cmbEducation.ListIndex = -1
'      frmCustomer2.cmbEducation.AddItem tCode & "- Not defined in local"
'      frmCustomer2.cmbEducation.ListIndex = frmCustomer2.cmbEducation.ListCount - 1
  End If
  
  tCode = recvOtherIndividualMsg.professionCode
  If tCode <> "" Then
    For i = 0 To frmIndividualOthers2.cmbProfession.ListCount
        If Mid(frmIndividualOthers2.cmbProfession.List(i), 3, 2) = tCode Then
           frmIndividualOthers2.cmbProfession.ListIndex = i
           Exit For
        End If
    Next i
  Else
    frmIndividualOthers2.cmbProfession.ListIndex = -1
  End If
  If i > frmIndividualOthers2.cmbProfession.ListCount Then
     frmIndividualOthers2.cmbProfession.ListIndex = -1
'     frmCustomer2.cmbProfession.AddItem tCode & "- Not defined in local"
'     frmCustomer2.cmbProfession.ListIndex = frmCustomer2.cmbProfession.ListCount - 1
  End If
  
  tCode = recvOtherIndividualMsg.positionCode
  If tCode <> "" Then
     For i = 0 To frmIndividualOthers2.cmbPosition.ListCount
         If Mid(frmIndividualOthers2.cmbPosition.List(i), 3, 2) = tCode Then
            frmIndividualOthers2.cmbPosition.ListIndex = i
            Exit For
         End If
     Next i
  Else
     frmIndividualOthers2.cmbPosition.ListIndex = -1
  End If
  If i > frmIndividualOthers2.cmbPosition.ListCount Then
     frmIndividualOthers2.cmbPosition.ListIndex = -1
'     frmIndividualOthers2.cmbPosition.AddItem tCode & "- Not defined in local"
'     frmIndividualOthers2.cmbPosition.ListIndex = frmCustomer2.cmbPosition.ListCount - 1
  End If
  
  tCode = recvOtherIndividualMsg.monthlyIncome
  If tCode <> "" Then
     For i = 0 To frmIndividualOthers2.cmbMonthlyIncome.ListCount
         If Mid(frmIndividualOthers2.cmbMonthlyIncome.List(i), 3, 2) = tCode Then
            frmIndividualOthers2.cmbMonthlyIncome.ListIndex = i
            Exit For
         End If
     Next i
  Else
     frmIndividualOthers2.cmbMonthlyIncome.ListIndex = -1
  End If
  If i > frmIndividualOthers2.cmbMonthlyIncome.ListCount Then
     frmIndividualOthers2.cmbMonthlyIncome.ListIndex = -1
'     frmCustomer2.cmbMonthlyIncome.AddItem tCode & "- Not defined in local"
'     frmCustomer2.cmbMonthlyIncome.ListIndex = frmCustomer2.cmbMonthlyIncome.ListCount - 1
  End If
  
  tCode = recvOtherIndividualMsg.segmentation
  If Len(Trim(tCode)) = 0 Then
     tCode = "0"
  End If
  
  For i = 0 To frmIndividualOthers2.cmbSegmentation.ListCount
      If Mid(frmIndividualOthers2.cmbSegmentation.List(i), 1, 1) = tCode Then
         frmIndividualOthers2.cmbSegmentation.ListIndex = i
         Exit For
      End If
  Next i
  If i > frmIndividualOthers2.cmbSegmentation.ListCount Then
     frmIndividualOthers2.cmbSegmentation.AddItem tCode & "- Not defined in local"
     frmIndividualOthers2.cmbSegmentation.ListIndex = frmIndividualOthers2.cmbSegmentation.ListCount - 1
  End If
  
  frmIndividualOthers2.txtMarketingMemo = Trim(recvOtherIndividualMsg.marketingMemo)
  
  tCode = recvOtherIndividualMsg.ownerShip
  If Mid$(tCode, 1, 1) = "1" Then
     frmIndividualOthers2.chkRentedHouse.Value = 1
  Else
     frmIndividualOthers2.chkRentedHouse.Value = 0
  End If
  If Mid$(tCode, 2, 1) = "1" Then
     frmIndividualOthers2.chkOwnHouse.Value = 1
  Else
     frmIndividualOthers2.chkOwnHouse.Value = 0
  End If
  If Mid$(tCode, 3, 1) = "1" Then
     frmIndividualOthers2.chkCompanyAcc.Value = 1
  Else
     frmIndividualOthers2.chkCompanyAcc.Value = 0
  End If
  If Mid$(tCode, 4, 1) = "1" Then
     frmIndividualOthers2.chkRentedCar.Value = 1
  Else
     frmIndividualOthers2.chkRentedCar.Value = 0
  End If
  If Mid$(tCode, 5, 1) = "1" Then
     frmIndividualOthers2.chkOwnCar.Value = 1
  Else
     frmIndividualOthers2.chkOwnCar.Value = 0
  End If
  If Mid$(tCode, 6, 1) = "1" Then
     frmIndividualOthers2.chkCompanyTransport.Value = 1
  Else
     frmIndividualOthers2.chkCompanyTransport.Value = 0
  End If
  
  frmIndividualOthers2.txtEmployerName = recvOtherIndividualMsg.employerName
  frmIndividualOthers2.txtDepartment = recvOtherIndividualMsg.department
  frmIndividualOthers2.txtEmployerPOBox = recvOtherIndividualMsg.employerPoBox
  frmIndividualOthers2.txtEmployerCity = recvOtherIndividualMsg.employerCity
  frmIndividualOthers2.txtEmployerZipcode = recvOtherIndividualMsg.employerZipCode
  
  tCode = recvOtherIndividualMsg.packagedAcc
  If Len(Trim(tCode)) = 0 Then
     tCode = "0"
  End If
  For i = 0 To frmIndividualOthers2.cmbPackageAcc.ListCount
      If Mid(frmIndividualOthers2.cmbPackageAcc.List(i), 1, 1) = tCode Then
         frmIndividualOthers2.cmbPackageAcc.ListIndex = i
         Exit For
      End If
  Next i
  If i > frmIndividualOthers2.cmbPackageAcc.ListCount Then
     frmIndividualOthers2.cmbPackageAcc.text = tCode & "- Not defined in local"
  End If

'  If recvOtherIndividualMsg.internetBankAcc = "1" Then
'     frmIndividualOthers2.optInternetYes.Value = True
'  Else
'     frmIndividualOthers2.optInternetNo.Value = True
'  End If

  If recvOtherIndividualMsg.excludeFromAtmFees = "1" Then
     frmIndividualOthers2.optAtmFeeYes.Value = True
  Else
     frmIndividualOthers2.optAtmFeeNo.Value = True
  End If
 
  If recvOtherIndividualMsg.excludeFromMinBalFees = "1" Then
     frmIndividualOthers2.optMinBalFeeYes.Value = True
  Else
     frmIndividualOthers2.optMinBalFeeNo.Value = True
  End If
  
  If recvOtherIndividualMsg.pkgStmtFreqOverride = "1" Then
     frmIndividualOthers2.optSegmentStmtOverrideYes = True
  Else
     frmIndividualOthers2.optSegmentStmtOverrideNo = True
  End If
 
  If recvOtherIndividualMsg.custAdviceFlag = "1" Then
     frmIndividualOthers2.optCustAdviceYes.Value = True
  Else
     frmIndividualOthers2.optCustAdviceNo.Value = True
  End If
    
  If recvOtherIndividualMsg.updatedForSama = "1" Then
     frmIndividualOthers2.optSamaUpdYes.Value = True
  Else
     frmIndividualOthers2.optSamaUpdNo.Value = True
  End If
   
  frmIndividualOthers2.txtRelationshipManager = recvOtherIndividualMsg.relationshipManager
  frmIndividualOthers2.txtGeneralMemo = recvOtherIndividualMsg.generalMemo
  frmIndividualOthers2.txtFreezingGracePeriod = Val(recvOtherIndividualMsg.accFreezingGracePeriod)
  
  frmIndividualOthers2.txtHomeCountryId = recvOtherIndividualMsg.homeCountryId
  If recvOtherIndividualMsg.homeCountryIdDateType = "0" Then
     frmIndividualOthers2.optHomeCountryIdDateHijri.Value = True
     frmIndividualOthers2.txtHomeIssueYear = Mid$(recvOtherIndividualMsg.homeCountryIdIssueDateH, 1, 4)
     frmIndividualOthers2.cmbHomeIssueDate.text = Mid$(recvOtherIndividualMsg.homeCountryIdIssueDateH, 7, 2)
     frmIndividualOthers2.cmbHomeIssueMonth.text = Mid$(recvOtherIndividualMsg.homeCountryIdIssueDateH, 5, 2)
     frmIndividualOthers2.txtHomeExpiryYear = Mid$(recvOtherIndividualMsg.homeCountryIdExpiryDateH, 1, 4)
     frmIndividualOthers2.cmbHomeExpiryDate.text = Mid$(recvOtherIndividualMsg.homeCountryIdExpiryDateH, 7, 2)
     frmIndividualOthers2.cmbHomeExpiryMonth.text = Mid$(recvOtherIndividualMsg.homeCountryIdExpiryDateH, 5, 2)
  Else
     frmIndividualOthers2.optHomeCountryDateGregorian.Value = True
     frmIndividualOthers2.txtHomeIssueYear = Mid$(recvOtherIndividualMsg.homeCountryIdIssueDateG, 1, 4)
     frmIndividualOthers2.cmbHomeIssueDate.text = Mid$(recvOtherIndividualMsg.homeCountryIdIssueDateG, 7, 2)
     frmIndividualOthers2.cmbHomeIssueMonth.text = Mid$(recvOtherIndividualMsg.homeCountryIdIssueDateG, 5, 2)
     frmIndividualOthers2.txtHomeExpiryYear = Mid$(recvOtherIndividualMsg.homeCountryIdExpiryDateG, 1, 4)
     frmIndividualOthers2.cmbHomeExpiryDate.text = Mid$(recvOtherIndividualMsg.homeCountryIdExpiryDateG, 7, 2)
     frmIndividualOthers2.cmbHomeExpiryMonth.text = Mid$(recvOtherIndividualMsg.homeCountryIdExpiryDateG, 5, 2)
  End If
  
  frmIndividualOthers2.txtHomeAddress1 = recvOtherIndividualMsg.homeAddress1
  frmIndividualOthers2.txtHomeAddress2 = recvOtherIndividualMsg.homeAddress2
  frmIndividualOthers2.cmbHomeCityName = recvOtherIndividualMsg.homeCityName
  frmIndividualOthers2.txtHomePoBox = recvOtherIndividualMsg.homePoBox
  frmIndividualOthers2.txtHomeZipCode = recvOtherIndividualMsg.homeZipCode
  tCode = Mid$(recvOtherIndividualMsg.homeCountry, 1, 3)
  If tCode <> "" Then
     For i = 0 To frmIndividualOthers2.cmbHomeCountry.ListCount
         If Mid(frmIndividualOthers2.cmbHomeCountry.List(i), 1, 3) = tCode Then
            frmIndividualOthers2.cmbHomeCountry.ListIndex = i 'RTrim(frmindividualOthers.cmbCountry.List(i))
            Exit For
         End If
     Next i
  Else
     frmIndividualOthers2.cmbHomeCountry.ListIndex = -1
  End If
  If i > frmIndividualOthers2.cmbHomeCountry.ListCount Then
     frmIndividualOthers2.cmbHomeCountry.text = tCode & "- Not defined in local"
  End If
  If Len(RTrim(recvOtherIndividualMsg.homeTelOffAreaCode)) <> 0 Or _
     Not updateAction Then
     frmIndividualOthers2.txtHomeOffPhoneAreaCode = recvOtherIndividualMsg.homeTelOffAreaCode
  End If
frmIndividualOthers2.txtHomeOffPhoneNo = recvOtherIndividualMsg.homeTelOffNo
frmIndividualOthers2.txtHomeOffPhoneExt = recvOtherIndividualMsg.homeTelOffExt
If Len(RTrim(recvOtherIndividualMsg.homeTelHomeAreaCode)) <> 0 Or _
   Not updateAction Then
   frmIndividualOthers2.txtHomePhoneResAreaCode = recvOtherIndividualMsg.homeTelHomeAreaCode
End If
frmIndividualOthers2.txtHomeResPhoneNo = recvOtherIndividualMsg.homeTelHomeNo
frmIndividualOthers2.txtHomePhoneResExt = recvOtherIndividualMsg.homeTelHomeExt
If Len(RTrim(recvOtherIndividualMsg.homeFaxAreaCode)) <> 0 Or _
   Not updateAction Then
   frmIndividualOthers2.txtHomeFaxAreaCode = recvOtherIndividualMsg.homeFaxAreaCode
End If
frmIndividualOthers2.txtHomeFaxNo = recvOtherIndividualMsg.homeFaxNo
frmIndividualOthers2.txtHomeFaxExt = recvOtherIndividualMsg.homeFaxExt
frmIndividualOthers2.txtHomeMobileCode = Mid$(recvOtherIndividualMsg.homeMobileNo, 1, 2)
frmIndividualOthers2.txtHomeMobileNo = Mid$(recvOtherIndividualMsg.homeMobileNo, 3)
frmIndividualOthers2.txtHomePagerNo = recvOtherIndividualMsg.homePagerNo
frmIndividualOthers2.txtHomeEmailAddress = recvOtherIndividualMsg.homeEmail

frmIndividualOthers2.txtInterGroupNo = recvOtherIndividualMsg.interGroupAccNo
frmIndividualOthers2.txtSpecialRefNo = recvOtherIndividualMsg.specialRefNo
frmIndividualOthers2.txtSamaApprovalNo = recvOtherIndividualMsg.samaAuthNo
If recvOtherIndividualMsg.samaAuthDateType = "0" Then
   frmIndividualOthers2.optSamaDateHijri.Value = True
   frmIndividualOthers2.txtSamaApproveYear = Mid$(recvOtherIndividualMsg.samaAuthDateH, 1, 4)
   frmIndividualOthers2.cmbSamaApproveDate.text = Mid$(recvOtherIndividualMsg.samaAuthDateH, 7, 2)
   frmIndividualOthers2.cmbSamaApproveMonth.text = Mid$(recvOtherIndividualMsg.samaAuthDateH, 5, 2)
Else
   frmIndividualOthers2.optSamaDateGregorian.Value = True
   frmIndividualOthers2.txtSamaApproveYear = Mid$(recvOtherIndividualMsg.samaAuthDateG, 1, 4)
   frmIndividualOthers2.cmbSamaApproveDate.text = Mid$(recvOtherIndividualMsg.samaAuthDateG, 7, 2)
   frmIndividualOthers2.cmbSamaApproveMonth.text = Mid$(recvOtherIndividualMsg.samaAuthDateG, 5, 2)
End If

frmIndividualOthers2.txtApproverNo = recvOtherIndividualMsg.approvalRefNo
If recvOtherIndividualMsg.appDateType = "0" Or _
   recvOtherIndividualMsg.appDateType = " " Then
   frmIndividualOthers2.optAppDateHijri.Value = True
   frmIndividualOthers2.txtAppIssueYear = Mid$(recvOtherIndividualMsg.appIssueDateH, 1, 4)
   frmIndividualOthers2.cmbAppIssueDate.text = Right$(recvOtherIndividualMsg.appIssueDateH, 2)
   frmIndividualOthers2.cmbAppIssueMonth.text = Mid$(recvOtherIndividualMsg.appIssueDateH, 5, 2)
   frmIndividualOthers2.txtAppExpiryYear = Mid$(recvOtherIndividualMsg.appExpiryDateH, 1, 4)
   frmIndividualOthers2.cmbAppExpiryDate.text = Right$(recvOtherIndividualMsg.appExpiryDateH, 2)
   frmIndividualOthers2.cmbAppExpiryMonth.text = Mid$(recvOtherIndividualMsg.appExpiryDateH, 5, 2)
 Else
   frmIndividualOthers2.optAppDateGreg.Value = True
   frmIndividualOthers2.txtAppIssueYear = Mid$(recvOtherIndividualMsg.appIssueDateG, 1, 4)
   frmIndividualOthers2.cmbAppIssueDate.text = Right$(recvOtherIndividualMsg.appIssueDateG, 2)
   frmIndividualOthers2.cmbAppIssueMonth.text = Mid$(recvOtherIndividualMsg.appIssueDateG, 5, 2)
   frmIndividualOthers2.txtAppExpiryYear = Mid$(recvOtherIndividualMsg.appExpiryDateG, 1, 4)
   frmIndividualOthers2.cmbAppExpiryDate.text = Right$(recvOtherIndividualMsg.appExpiryDateG, 2)
   frmIndividualOthers2.cmbAppExpiryMonth.text = Mid$(recvOtherIndividualMsg.appExpiryDateG, 5, 2)
 End If
 frmIndividualOthers2.txtApproverName = recvOtherIndividualMsg.appRefName


End Sub

Public Sub fillFrmIndividualOthers3()
  Dim tCode As String
  Dim tmpStr As String
  Dim i As Integer

  ' Current acc Info
  If Len(RTrim(recvOtherIndividualMsg.currentAccInfo)) <> 0 Then
     If Mid$(recvOtherIndividualMsg.currentAccInfo, 11, 1) <> "1" Then
        frmIndividualOthersAcctInfo.optCurrentAcYes.Value = True
        tCode = Mid$(recvOtherIndividualMsg.currentAccInfo, 1, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualOthersAcctInfo.cmbCurrentAcCurrency.ListCount
               If Mid(frmIndividualOthersAcctInfo.cmbCurrentAcCurrency.List(i), 1, 2) = tCode Then
                  frmIndividualOthersAcctInfo.cmbCurrentAcCurrency.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           frmIndividualOthersAcctInfo.cmbCurrentAcCurrency.ListIndex = -1
        End If
        If i > frmIndividualOthersAcctInfo.cmbCurrentAcCurrency.ListCount Then
           frmIndividualOthersAcctInfo.cmbCurrentAcCurrency.AddItem tCode & "-Not defined in local"
           frmIndividualOthersAcctInfo.cmbCurrentAcCurrency.ListIndex = frmCustomer2.cmbCurrentAcCurrency.ListCount - 1
        End If
        tCode = Mid$(recvOtherIndividualMsg.currentAccInfo, 6, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualOthersAcctInfo.cmbCurrentAcStatus.ListCount
              If Mid(frmIndividualOthersAcctInfo.cmbCurrentAcStatus.List(i), 1, 2) = tCode Then
                 frmIndividualOthersAcctInfo.cmbCurrentAcStatus.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmIndividualOthersAcctInfo.cmbCurrentAcStatus.ListIndex = -1
        End If
        If i > frmIndividualOthersAcctInfo.cmbCurrentAcStatus.ListCount Then
           frmIndividualOthersAcctInfo.cmbCurrentAcStatus.AddItem tCode & "-Not defined in local"
           frmIndividualOthersAcctInfo.cmbCurrentAcStatus.ListIndex = frmCustomer2.cmbCurrentAcStatus.ListCount - 1
        End If
     
        tCode = Mid$(recvOtherIndividualMsg.currentAccInfo, 8, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq.ListCount
               If Mid(frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq.List(i), 1, 2) = tCode Then
                  frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq.ListIndex = -1
        End If
        If i > frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq.ListCount Then
           frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq.AddItem tCode & "-Not defined in local"
           frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq.ListIndex = frmCustomer2.cmbCurrentAcStmtFreq.ListCount - 1
        End If
        If Mid$(recvOtherIndividualMsg.currentAccInfo, 10, 1) = "1" Then
           frmIndividualOthersAcctInfo.optCurrentAcCheckBookYes.Value = True
        Else
           frmIndividualOthersAcctInfo.optCurrentAcCheckBookNo.Value = True
        End If
    End If
  Else
     frmIndividualOthersAcctInfo.optCurrentAcNo.Value = True
  End If
     

  ' Savings Acc info
  If Len(RTrim(recvOtherIndividualMsg.savingsAccInfo)) <> 0 Then
     If Mid$(recvOtherIndividualMsg.savingsAccInfo, 11, 1) <> "1" Then
        frmIndividualOthersAcctInfo.optSavingAcYes.Value = True
        tCode = Mid$(recvOtherIndividualMsg.savingsAccInfo, 1, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualOthersAcctInfo.cmbSavingAcCurrency.ListCount
              If Mid(frmIndividualOthersAcctInfo.cmbSavingAcCurrency.List(i), 1, 2) = tCode Then
                 frmIndividualOthersAcctInfo.cmbSavingAcCurrency.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmIndividualOthersAcctInfo.cmbSavingAcCurrency.ListIndex = -1
        End If
        If i > frmIndividualOthersAcctInfo.cmbSavingAcCurrency.ListCount Then
           frmIndividualOthersAcctInfo.cmbSavingAcCurrency.AddItem tCode & "-Not defined in local"
           frmIndividualOthersAcctInfo.cmbSavingAcCurrency.ListIndex = frmCustomer2.cmbSavingAcCurrency.ListCount - 1
        End If
        
        tCode = Mid$(recvOtherIndividualMsg.savingsAccInfo, 6, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualOthersAcctInfo.cmbSavingAcStatus.ListCount
              If Mid(frmIndividualOthersAcctInfo.cmbSavingAcStatus.List(i), 1, 2) = tCode Then
                 frmIndividualOthersAcctInfo.cmbSavingAcStatus.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmIndividualOthersAcctInfo.cmbSavingAcStatus.ListIndex = -1
        End If
        If i > frmIndividualOthersAcctInfo.cmbSavingAcStatus.ListCount Then
           frmIndividualOthersAcctInfo.cmbSavingAcStatus.AddItem tCode & "-Not defined in local"
           frmIndividualOthersAcctInfo.cmbSavingAcStatus.ListIndex = frmIndividualOthersAcctInfo.cmbSavingAcStatus.ListCount - 1
        End If
        
        tCode = Mid$(recvOtherIndividualMsg.savingsAccInfo, 8, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.ListCount
              If Mid(frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.List(i), 1, 2) = tCode Then
                 frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.ListIndex = -1
        End If
        If i > frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.ListCount Then
            frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.AddItem tCode & "-Not defined in local"
            frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.ListIndex = frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.ListCount - 1
        End If
    End If
  Else
     frmIndividualOthersAcctInfo.optSavingAcNo.Value = True
  End If

  ' Other Acc Info
  If Len(RTrim(recvOtherIndividualMsg.otherAccInfo)) <> 0 Then
     If Mid$(recvOtherIndividualMsg.otherAccInfo, 11, 1) <> "1" Then
         tCode = Mid$(recvOtherIndividualMsg.otherAccInfo, 3, 3)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmIndividualOthersAcctInfo.cmbOtherAccount.ListCount
               If Mid(frmIndividualOthersAcctInfo.cmbOtherAccount.List(i), 1, 3) = tCode Then
                  frmIndividualOthersAcctInfo.cmbOtherAccount.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmIndividualOthersAcctInfo.cmbOtherAccount.ListIndex = -1
         End If
         If i > frmIndividualOthersAcctInfo.cmbOtherAccount.ListCount Then
            frmIndividualOthersAcctInfo.cmbOtherAccount.AddItem tCode & "-Not defined in local"
            frmIndividualOthersAcctInfo.cmbOtherAccount.ListIndex = frmIndividualOthersAcctInfo.cmbOtherAccount.ListCount - 1
         End If
         
         tCode = Mid$(recvOtherIndividualMsg.otherAccInfo, 1, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmIndividualOthersAcctInfo.cmbOtherAcCurrency.ListCount
               If Mid(frmIndividualOthersAcctInfo.cmbOtherAcCurrency.List(i), 1, 2) = tCode Then
                  frmIndividualOthersAcctInfo.cmbOtherAcCurrency.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmIndividualOthersAcctInfo.cmbOtherAcCurrency.ListIndex = -1
         End If
         If i > frmIndividualOthersAcctInfo.cmbOtherAcCurrency.ListCount Then
            frmIndividualOthersAcctInfo.cmbOtherAcCurrency.AddItem tCode & "-Not defined in local"
            frmIndividualOthersAcctInfo.cmbOtherAcCurrency.ListIndex = frmIndividualOthersAcctInfo.cmbOtherAcCurrency.ListCount - 1
         End If
         
         tCode = Mid$(recvOtherIndividualMsg.otherAccInfo, 6, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmIndividualOthersAcctInfo.cmbOtherAcStatus.ListCount
               If Mid(frmIndividualOthersAcctInfo.cmbOtherAcStatus.List(i), 1, 2) = tCode Then
                  frmIndividualOthersAcctInfo.cmbOtherAcStatus.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmIndividualOthersAcctInfo.cmbOtherAcStatus.ListIndex = -1
         End If
         If i > frmIndividualOthersAcctInfo.cmbOtherAcStatus.ListCount Then
            frmIndividualOthersAcctInfo.cmbOtherAcStatus.AddItem tCode & "-Not defined in local"
            frmIndividualOthersAcctInfo.cmbOtherAcStatus.ListIndex = frmIndividualOthersAcctInfo.cmbOtherAcStatus.ListCount - 1
         End If
         
         tCode = Mid$(recvOtherIndividualMsg.otherAccInfo, 8, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.ListCount
               If Mid(frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.List(i), 1, 2) = tCode Then
                  frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.ListIndex = -1
         End If
         If i > frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.ListCount Then
            frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.AddItem tCode & "-Not defined in local"
            frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.ListIndex = frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.ListCount - 1
         End If
         If Mid$(recvOtherIndividualMsg.otherAccInfo, 10, 1) = "1" Then
            frmIndividualOthersAcctInfo.optOtherAcCheckBookYes.Value = True
         Else
            frmIndividualOthersAcctInfo.optOtherAcCheckBookNo.Value = True
         End If
    End If
  End If
  
  If recvOtherIndividualMsg.singleJointAcc = "0" Or _
     recvOtherIndividualMsg.singleJointAcc = " " Then
     frmIndividualOthersAcctInfo.OptSingle.Value = True
     frmIndividualOthersAcctInfo.cmdJointAcc.Enabled = False
  ElseIf recvOtherIndividualMsg.singleJointAcc = "1" Then  ' joint
     frmIndividualOthersAcctInfo.optJoint.Value = True
     frmIndividualOthersAcctInfo.cmdJointAcc.Enabled = True
  ElseIf recvOtherIndividualMsg.singleJointAcc = "2" Then  ' unidentified
     frmIndividualOthersAcctInfo.optUnidentified.Value = True
     If updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
        frmIndividualOthersAcctInfo.frameAcSingleJoint.Enabled = True
     Else
        frmIndividualOthersAcctInfo.frameAcSingleJoint.Enabled = False
     End If
  End If
  
  If recvOtherIndividualMsg.signatureNature = "1" Or _
     recvOtherIndividualMsg.signatureNature = " " Then
     frmIndividualOthersAcctInfo.optSignJoint.Value = True
  Else
     frmIndividualOthersAcctInfo.optSignSingle.Value = True
  End If
  
  If recvOtherIndividualMsg.cardType = "S" Then
     frmIndividualOthersAcctInfo.optChipCard.Value = True
  Else
     frmIndividualOthersAcctInfo.optIntlCard.Value = True
  End If

  If recvOtherIndividualMsg.electronIntlRequired = "1" Then
     frmIndividualOthersAcctInfo.optPrimaryElectronIntlCardYes.Value = True
  Else
     frmIndividualOthersAcctInfo.optPrimaryElectronIntlCardNo.Value = True
  End If
  frmIndividualOthersAcctInfo.txtPrimaryElectronIntlCardName = _
            UCase(recvOtherIndividualMsg.electronIntlName)
    
  If recvOtherIndividualMsg.electronIntlSuppRequired = "1" Then
     frmIndividualOthersAcctInfo.optSecondaryElectronIntlCardYes.Value = True
  Else
     frmIndividualOthersAcctInfo.optSecondaryElectronIntlCardNo.Value = True
  End If
   
  frmIndividualOthersAcctInfo.txtSecondaryElectronIntlCardName = _
             UCase(recvOtherIndividualMsg.electronIntlSuppName)
   
  If recvOtherIndividualMsg.deliveryToBranchOrPO = "C" Or _
     recvOtherIndividualMsg.deliveryToBranchOrPO = "B" Then
     frmIndividualOthersAcctInfo.optCardDeliveredToBranch.Value = True
  ElseIf recvOtherIndividualMsg.deliveryToBranchOrPO = "R" Then
     frmIndividualOthersAcctInfo.optCardDeliveredToReqBranch.Value = True
  ElseIf recvOtherIndividualMsg.deliveryToBranchOrPO = "P" Then
     frmIndividualOthersAcctInfo.optCardDeliveredToPOBox.Value = True
  Else 'GPS
     frmIndividualOthersAcctInfo.optCardDeliveredToGPS.Value = True
  End If
  frmIndividualOthersAcctInfo.txtDeliveryAddr2 = recvOtherIndividualMsg.deliveryAddress2
  frmIndividualOthersAcctInfo.cmbDeliveryCity.text = recvOtherIndividualMsg.deliveryCity
  If recvOtherIndividualMsg.deliveryToBranchOrPO <> "G" Then
     frmIndividualOthersAcctInfo.txtDeliveryAddr1 = recvOtherIndividualMsg.deliveryAddress1
     frmIndividualOthersAcctInfo.txtDeliveryPOBox = recvOtherIndividualMsg.deliveryPoBox
     frmIndividualOthersAcctInfo.txtDeliveryZipcode = recvOtherIndividualMsg.deliveryZip
  Else  ' GPS
     frmIndividualOthersAcctInfo.txtGPSNo = Mid$(recvOtherIndividualMsg.deliveryAddress1, 1, 5)
     frmIndividualOthersAcctInfo.txtGPSStreetName = Mid$(recvOtherIndividualMsg.deliveryAddress1, 7)
     frmIndividualOthersAcctInfo.txtGPSUnit = recvOtherIndividualMsg.deliveryPoBox
     frmIndividualOthersAcctInfo.txtGPSZipCode = Mid$(recvOtherIndividualMsg.deliveryZip, 1, 5)
     frmIndividualOthersAcctInfo.txtGPSAdditionalNo = Mid$(recvOtherIndividualMsg.deliveryZip, 7)
  End If
End Sub
Public Sub fillFrmIndividualSaudi()
    Dim tCode As String, mQry As String
    Dim i As Integer

    frmIndividualSaudi.txtCustomerNo = recvSaudiIndividualMsg.customerNo
    
    tCode = recvSaudiIndividualMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmIndividualSaudi.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmIndividualSaudi.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmIndividualSaudi.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvSaudiIndividualMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmIndividualSaudi.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmIndividualSaudi.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmIndividualSaudi.cmbAltBrCode.text = "0000-NONE"
    End If
    
    tCode = recvSaudiIndividualMsg.referenceReqdFor
    If Mid$(tCode, 1, 1) = "1" Then
       frmIndividualSaudi.chkBlind.Value = vbChecked
    End If
    If Mid$(tCode, 2, 1) = "1" Then
       frmIndividualSaudi.chkVeiled.Value = vbChecked
    End If
    If Mid$(tCode, 3, 1) = "1" Then
       frmIndividualSaudi.chkIncptPerson.Value = vbChecked
    End If
    If Mid$(tCode, 4, 1) = "1" Then
       frmIndividualSaudi.chkMinor.Value = vbChecked
    End If
    If Mid$(tCode, 5, 1) = "1" Then
       frmIndividualSaudi.chkMinorSpl.Value = vbChecked
    End If
    If Mid$(tCode, 6, 1) = "1" Then
       frmIndividualSaudi.chkMentDisabled.Value = vbChecked
    End If
    
    frmIndividualSaudi.txtIdNo = recvSaudiIndividualMsg.idNo
    frmIndividualSaudi.cmbIdIssuedAt.text = recvSaudiIndividualMsg.idIssuedAt
    If recvSaudiIndividualMsg.idDateType = "0" Or _
       recvSaudiIndividualMsg.idDateType = " " Then
       frmIndividualSaudi.optIdDateHijri.Value = True
       frmIndividualSaudi.txtIdIssueYear = Mid$(recvSaudiIndividualMsg.idIssueDateH, 1, 4)
       frmIndividualSaudi.cmbIdIssueDate.text = Right$(recvSaudiIndividualMsg.idIssueDateH, 2)
       frmIndividualSaudi.cmbIdIssueMonth.text = Mid$(recvSaudiIndividualMsg.idIssueDateH, 5, 2)
       frmIndividualSaudi.txtIdExpiryYear = Mid$(recvSaudiIndividualMsg.idExpiryDateH, 1, 4)
       frmIndividualSaudi.cmbIdExpiryDate.text = Right$(recvSaudiIndividualMsg.idExpiryDateH, 2)
       frmIndividualSaudi.cmbIdExpiryMonth.text = Mid$(recvSaudiIndividualMsg.idExpiryDateH, 5, 2)
    Else
       frmIndividualSaudi.optIdDateGreg.Value = True
       frmIndividualSaudi.txtIdIssueYear = Mid$(recvSaudiIndividualMsg.idIssueDateG, 1, 4)
       frmIndividualSaudi.cmbIdIssueDate.text = Right$(recvSaudiIndividualMsg.idIssueDateG, 2)
       frmIndividualSaudi.cmbIdIssueMonth.text = Mid$(recvSaudiIndividualMsg.idIssueDateG, 5, 2)
       frmIndividualSaudi.txtIdExpiryYear = Mid$(recvSaudiIndividualMsg.idExpiryDateG, 1, 4)
       frmIndividualSaudi.cmbIdExpiryDate.text = Right$(recvSaudiIndividualMsg.idExpiryDateG, 2)
       frmIndividualSaudi.cmbIdExpiryMonth.text = Mid$(recvSaudiIndividualMsg.idExpiryDateG, 5, 2)
    End If
    
    frmIndividualSaudi.txtPPNumber = recvSaudiIndividualMsg.ppNo
    frmIndividualSaudi.cmbPPIssuedAt.text = recvSaudiIndividualMsg.ppIssuedAt
    If recvSaudiIndividualMsg.ppDateType = "0" Or _
       recvSaudiIndividualMsg.ppDateType = " " Then
       frmIndividualSaudi.optPPDateHijri.Value = True
       frmIndividualSaudi.txtPPIssueYear = Mid$(recvSaudiIndividualMsg.ppIssueDateH, 1, 4)
       frmIndividualSaudi.cmbPPIssueDate.text = Right$(recvSaudiIndividualMsg.ppIssueDateH, 2)
       frmIndividualSaudi.cmbPPIssueMonth.text = Mid$(recvSaudiIndividualMsg.ppIssueDateH, 5, 2)
       frmIndividualSaudi.txtPPExpiryYear = Mid$(recvSaudiIndividualMsg.ppExpiryDateH, 1, 4)
       frmIndividualSaudi.cmbPPExpiryDate.text = Right$(recvSaudiIndividualMsg.ppExpiryDateH, 2)
       frmIndividualSaudi.cmbPPExpiryMonth.text = Mid$(recvSaudiIndividualMsg.ppExpiryDateH, 5, 2)
    Else
       frmIndividualSaudi.optPPDateGreg.Value = True
       frmIndividualSaudi.txtPPIssueYear = Mid$(recvSaudiIndividualMsg.ppIssueDateG, 1, 4)
       frmIndividualSaudi.cmbPPIssueDate.text = Right$(recvSaudiIndividualMsg.ppIssueDateG, 2)
       frmIndividualSaudi.cmbPPIssueMonth.text = Mid$(recvSaudiIndividualMsg.ppIssueDateG, 5, 2)
       frmIndividualSaudi.txtPPExpiryYear = Mid$(recvSaudiIndividualMsg.ppExpiryDateG, 1, 4)
       frmIndividualSaudi.cmbPPExpiryDate.text = Right$(recvSaudiIndividualMsg.ppExpiryDateG, 2)
       frmIndividualSaudi.cmbPPExpiryMonth.text = Mid$(recvSaudiIndividualMsg.ppExpiryDateG, 5, 2)
    End If
    
    frmIndividualSaudi.txtHafNo = recvSaudiIndividualMsg.hafizaNo
    frmIndividualSaudi.cmbHafIssuedAt.text = recvSaudiIndividualMsg.hafIssuedAt
    If recvSaudiIndividualMsg.hafDateType = "0" Or _
       recvSaudiIndividualMsg.hafDateType = " " Then
       frmIndividualSaudi.optHafDateHijri.Value = True
       frmIndividualSaudi.txtHafIssueYear = Mid$(recvSaudiIndividualMsg.hafIssueDateH, 1, 4)
       frmIndividualSaudi.cmbHafIssueDate.text = Right$(recvSaudiIndividualMsg.hafIssueDateH, 2)
       frmIndividualSaudi.cmbHafIssueMonth.text = Mid$(recvSaudiIndividualMsg.hafIssueDateH, 5, 2)
       frmIndividualSaudi.txtHafExpiryYear = Mid$(recvSaudiIndividualMsg.hafExpiryDateH, 1, 4)
       frmIndividualSaudi.cmbHafExpiryDate.text = Right$(recvSaudiIndividualMsg.hafExpiryDateH, 2)
       frmIndividualSaudi.cmbHafExpiryMonth.text = Mid$(recvSaudiIndividualMsg.hafExpiryDateH, 5, 2)
    Else
       frmIndividualSaudi.optHafDateGreg.Value = True
       frmIndividualSaudi.txtHafIssueYear = Mid$(recvSaudiIndividualMsg.hafIssueDateG, 1, 4)
       frmIndividualSaudi.cmbHafIssueDate.text = Right$(recvSaudiIndividualMsg.hafIssueDateG, 2)
       frmIndividualSaudi.cmbHafIssueMonth.text = Mid$(recvSaudiIndividualMsg.hafIssueDateG, 5, 2)
       frmIndividualSaudi.txtHafExpiryYear = Mid$(recvSaudiIndividualMsg.hafExpiryDateG, 1, 4)
       frmIndividualSaudi.cmbHafExpiryDate.text = Right$(recvSaudiIndividualMsg.hafExpiryDateG, 2)
       frmIndividualSaudi.cmbHafExpiryMonth.text = Mid$(recvSaudiIndividualMsg.hafExpiryDateG, 5, 2)
    End If
    
    frmIndividualSaudi.txtFRNo = recvSaudiIndividualMsg.familyRegnNo
    frmIndividualSaudi.cmbFRIssuedAt.text = recvSaudiIndividualMsg.frIssuedAt
    If recvSaudiIndividualMsg.frDateType = "0" Or _
       recvSaudiIndividualMsg.frDateType = " " Then
       frmIndividualSaudi.optFRDateHijri.Value = True
       frmIndividualSaudi.txtFRIssueYear = Mid$(recvSaudiIndividualMsg.frIssueDateH, 1, 4)
       frmIndividualSaudi.cmbFRIssueDate.text = Right$(recvSaudiIndividualMsg.frIssueDateH, 2)
       frmIndividualSaudi.cmbFRIssueMonth.text = Mid$(recvSaudiIndividualMsg.frIssueDateH, 5, 2)
       frmIndividualSaudi.txtFRExpiryYear = Mid$(recvSaudiIndividualMsg.frExpiryDateH, 1, 4)
       frmIndividualSaudi.cmbFRExpiryDate.text = Right$(recvSaudiIndividualMsg.frExpiryDateH, 2)
       frmIndividualSaudi.cmbFRExpiryMonth.text = Mid$(recvSaudiIndividualMsg.frExpiryDateH, 5, 2)
    Else
       frmIndividualSaudi.optFRDateGreg.Value = True
       frmIndividualSaudi.txtFRIssueYear = Mid$(recvSaudiIndividualMsg.frIssueDateG, 1, 4)
       frmIndividualSaudi.cmbFRIssueDate.text = Right$(recvSaudiIndividualMsg.frIssueDateG, 2)
       frmIndividualSaudi.cmbFRIssueMonth.text = Mid$(recvSaudiIndividualMsg.frIssueDateG, 5, 2)
       frmIndividualSaudi.txtFRExpiryYear = Mid$(recvSaudiIndividualMsg.frExpiryDateG, 1, 4)
       frmIndividualSaudi.cmbFRExpiryDate.text = Right$(recvSaudiIndividualMsg.frExpiryDateG, 2)
       frmIndividualSaudi.cmbFRExpiryMonth.text = Mid$(recvSaudiIndividualMsg.frExpiryDateG, 5, 2)
    End If
    
    frmIndividualSaudi.txtSamaAuthNo = recvSaudiIndividualMsg.samaAuthNo
    frmIndividualSaudi.cmbSamaAuthIssuedAt.text = recvSaudiIndividualMsg.samaAuthIssuedAt
    If recvSaudiIndividualMsg.samaAuthDateType = "0" Or _
       recvSaudiIndividualMsg.samaAuthDateType = " " Then
       frmIndividualSaudi.optSamaAuthDateHijri.Value = True
       frmIndividualSaudi.txtSamaAuthIssueYear = Mid$(recvSaudiIndividualMsg.samaAuthIssueDateH, 1, 4)
       frmIndividualSaudi.cmbSamaAuthIssueDate.text = Right$(recvSaudiIndividualMsg.samaAuthIssueDateH, 2)
       frmIndividualSaudi.cmbSamaAuthIssueMonth.text = Mid$(recvSaudiIndividualMsg.samaAuthIssueDateH, 5, 2)
       frmIndividualSaudi.txtSamaAuthExpiryYear = Mid$(recvSaudiIndividualMsg.samaAuthExpiryDateH, 1, 4)
       frmIndividualSaudi.cmbSamaAuthExpiryDate.text = Right$(recvSaudiIndividualMsg.samaAuthExpiryDateH, 2)
       frmIndividualSaudi.cmbSamaAuthExpiryMonth.text = Mid$(recvSaudiIndividualMsg.samaAuthExpiryDateH, 5, 2)
    Else
       frmIndividualSaudi.optSamaAuthDateGreg.Value = True
       frmIndividualSaudi.txtSamaAuthIssueYear = Mid$(recvSaudiIndividualMsg.samaAuthIssueDateG, 1, 4)
       frmIndividualSaudi.cmbSamaAuthIssueDate.text = Right$(recvSaudiIndividualMsg.samaAuthIssueDateG, 2)
       frmIndividualSaudi.cmbSamaAuthIssueMonth.text = Mid$(recvSaudiIndividualMsg.samaAuthIssueDateG, 5, 2)
       frmIndividualSaudi.txtSamaAuthExpiryYear = Mid$(recvSaudiIndividualMsg.samaAuthExpiryDateG, 1, 4)
       frmIndividualSaudi.cmbSamaAuthExpiryDate.text = Right$(recvSaudiIndividualMsg.samaAuthExpiryDateG, 2)
       frmIndividualSaudi.cmbSamaAuthExpiryMonth.text = Mid$(recvSaudiIndividualMsg.samaAuthExpiryDateG, 5, 2)
    End If
    
    If recvSaudiIndividualMsg.langPref = "0" Or _
       recvSaudiIndividualMsg.langPref = " " Then
       frmIndividualSaudi.optLangArabic.Value = True
    Else
       frmIndividualSaudi.optLangEnglish.Value = True
    End If
         
'    tCode = Mid$(recvSaudiIndividualMsg.nationality, 1, 3)
'    If tCode <> "" Then
'        For i = 0 To frmIndividualSaudi.cmbNationality.ListCount
'            If Mid(frmIndividualSaudi.cmbNationality.List(i), 1, 3) = tCode Then
'               frmIndividualSaudi.cmbNationality.ListIndex = i  ' RTrim(frmIndividualsaudi.cmbNationality.List(i))
'               Exit For
'            End If
'        Next i
'    Else
'        frmIndividualSaudi.cmbNationality.ListIndex = -1
'    End If
'    If i > frmIndividualSaudi.cmbNationality.ListCount Then
'       frmIndividualSaudi.cmbNationality.ListIndex = -1
'       'frmIndividualsaudi.cmbNationality.Text = tCode & "-Not defined in local"
'    End If
    
    tCode = Mid$(recvSaudiIndividualMsg.titleCode, 1, 2)
    If tCode <> "" Then
        For i = 0 To frmIndividualSaudi.cmbTitle.ListCount
            If Mid$(frmIndividualSaudi.cmbTitle.List(i), 1, 2) = tCode Then
               frmIndividualSaudi.cmbTitle.ListIndex = i
               Exit For
            End If
        Next i
    Else
        frmIndividualSaudi.cmbTitle.ListIndex = -1
    End If
    If i > frmIndividualSaudi.cmbTitle.ListCount Then
       frmIndividualSaudi.cmbTitle.ListIndex = -1
       'frmIndividualsaudi.cmbTitle.Text = tCode & "-Not defined in local"
    End If
    frmIndividualSaudi.txtCOBNo = recvSaudiIndividualMsg.certBirthNo
    frmIndividualSaudi.txtArabFirstName = recvSaudiIndividualMsg.aFirstName
    frmIndividualSaudi.txtArabic2ndName = recvSaudiIndividualMsg.a2ndName
    frmIndividualSaudi.txtArabic3rdName = recvSaudiIndividualMsg.a3rdName
    frmIndividualSaudi.txtArabLastName = recvSaudiIndividualMsg.aLastName
    frmIndividualSaudi.txtArabShortName = recvSaudiIndividualMsg.aShortName
    frmIndividualSaudi.txtEngFirstName = recvSaudiIndividualMsg.eFirstName
    frmIndividualSaudi.txtEnglish2ndName = recvSaudiIndividualMsg.e2ndName
    frmIndividualSaudi.txtEnglish3rdName = recvSaudiIndividualMsg.e3rdName
    frmIndividualSaudi.txtEngLastName = recvSaudiIndividualMsg.eLastName
    frmIndividualSaudi.txtEngShortName = recvSaudiIndividualMsg.eShortName
    
    If recvSaudiIndividualMsg.dobDateType = "0" Or _
       recvSaudiIndividualMsg.dobDateType = " " Then
       frmIndividualSaudi.optDOBHijri.Value = True
       frmIndividualSaudi.txtDobYear = Mid$(recvSaudiIndividualMsg.dobDateH, 1, 4)
       frmIndividualSaudi.cmbDobDate.text = Mid$(recvSaudiIndividualMsg.dobDateH, 7, 2)
       frmIndividualSaudi.cmbDobMonth.text = Mid$(recvSaudiIndividualMsg.dobDateH, 5, 2)
    Else
       frmIndividualSaudi.optDOBGreg.Value = True
       frmIndividualSaudi.txtDobYear = Mid$(recvSaudiIndividualMsg.dobDateG, 1, 4)
       frmIndividualSaudi.cmbDobDate.text = Mid$(recvSaudiIndividualMsg.dobDateG, 7, 2)
       frmIndividualSaudi.cmbDobMonth.text = Mid$(recvSaudiIndividualMsg.dobDateG, 5, 2)
    End If
    
    If recvSaudiIndividualMsg.sexCode = "0" Or _
       recvSaudiIndividualMsg.sexCode = " " Then
       frmIndividualSaudi.optGenderMale.Value = True
    Else
       frmIndividualSaudi.optGenderFemale.Value = True
    End If
    
    If recvSaudiIndividualMsg.vipCode = "1" Then
       frmIndividualSaudi.optVipYes.Value = True
    Else
       frmIndividualSaudi.optVipNo.Value = True
    End If
    
    If recvSaudiIndividualMsg.maritalStatus = "0" Or _
       recvSaudiIndividualMsg.maritalStatus = " " Then
       frmIndividualSaudi.optMarried.Value = True
    ElseIf recvSaudiIndividualMsg.maritalStatus = "1" Then
       frmIndividualSaudi.OptSingle.Value = True
    Else
       frmIndividualSaudi.optOthers.Value = True
    End If
    
    frmIndividualSaudi.txtDependents = recvSaudiIndividualMsg.noOfDependents
    If recvSaudiIndividualMsg.residentStatus = "0" Or _
       recvSaudiIndividualMsg.residentStatus = " " Then
       frmIndividualSaudi.optResident.Value = True
    Else
       frmIndividualSaudi.optNonResident.Value = True
    End If
    
    tCode = Mid$(recvSaudiIndividualMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmIndividualSaudi.cmbBusinessType.ListCount
            If Mid(frmIndividualSaudi.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmIndividualSaudi.cmbBusinessType.ListIndex = i ' RTrim(frmIndividualsaudi.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmIndividualSaudi.cmbBusinessType.ListIndex = -1
    End If
    If i > frmIndividualSaudi.cmbBusinessType.ListCount Then
       frmIndividualSaudi.cmbBusinessType.ListIndex = -1
      'frmIndividualsaudi.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    If recvSaudiIndividualMsg.addressType = "1" Then
       frmIndividualSaudi.optSaudiPost.Value = True
       frmIndividualSaudi.txtSaudiPostGPSNo = Mid$(recvSaudiIndividualMsg.address1, 1, 5)
       frmIndividualSaudi.txtSaudiPostStreetName = Mid$(recvSaudiIndividualMsg.address1, 7)
       frmIndividualSaudi.txtSaudiPostUnit = recvSaudiIndividualMsg.poBox
       frmIndividualSaudi.txtSaudiPostZipCode = Mid$(recvSaudiIndividualMsg.zipCode, 1, 5)
       frmIndividualSaudi.txtSaudiPostAdditionalNo = Mid$(recvSaudiIndividualMsg.zipCode, 7)
    Else
       frmIndividualSaudi.optPoBox.Value = True
       frmIndividualSaudi.txtAddress1 = recvSaudiIndividualMsg.address1
       frmIndividualSaudi.txtAddress2 = recvSaudiIndividualMsg.address2
       frmIndividualSaudi.txtPOBox = recvSaudiIndividualMsg.poBox
       frmIndividualSaudi.txtPinCode = recvSaudiIndividualMsg.zipCode
       tCode = Mid$(recvSaudiIndividualMsg.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmIndividualSaudi.cmbCountry.ListCount
              If Mid(frmIndividualSaudi.cmbCountry.List(i), 1, 3) = tCode Then
                 frmIndividualSaudi.cmbCountry.ListIndex = i 'RTrim(frmIndividualsaudi.cmbCountry.List(i))
                 Exit For
              End If
          Next i
       Else
          frmIndividualSaudi.cmbCountry.ListIndex = -1
       End If
       If i > frmIndividualSaudi.cmbCountry.ListCount Then
          frmIndividualSaudi.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    
    frmIndividualSaudi.cmbCity.text = recvSaudiIndividualMsg.cityName
    
    If Len(RTrim(recvSaudiIndividualMsg.telOffAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualSaudi.txtOffPhoneCityCode = recvSaudiIndividualMsg.telOffAreaCode
    End If
    frmIndividualSaudi.txtOffPhoneNo = recvSaudiIndividualMsg.telOffNo
    frmIndividualSaudi.txtOffPhoneExt = recvSaudiIndividualMsg.telOffExt
    If Len(RTrim(recvSaudiIndividualMsg.telHomeAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualSaudi.txtResPhoneCityCode = recvSaudiIndividualMsg.telHomeAreaCode
    End If
    frmIndividualSaudi.txtResPhoneNo = recvSaudiIndividualMsg.telHomeNo
    frmIndividualSaudi.txtResPhoneExt = recvSaudiIndividualMsg.telHomeExt
    If Len(RTrim(recvSaudiIndividualMsg.faxAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualSaudi.txtFaxCityCode = recvSaudiIndividualMsg.faxAreaCode
    End If
    frmIndividualSaudi.txtFaxNo = recvSaudiIndividualMsg.faxNo
    frmIndividualSaudi.txtFaxExt = recvSaudiIndividualMsg.faxExt
    frmIndividualSaudi.txtMobileAreaCode = Mid$(recvSaudiIndividualMsg.mobileNo, 1, 2)
    frmIndividualSaudi.txtMobileNo = Mid$(recvSaudiIndividualMsg.mobileNo, 3)
    frmIndividualSaudi.txtPagerNo = recvSaudiIndividualMsg.pagerNo
    frmIndividualSaudi.txtEmailAddress = recvSaudiIndividualMsg.eMail
    
    frmIndividualSaudi.cmbOpenDate = Mid$(recvSaudiIndividualMsg.custOpenDate, 7, 2)
    frmIndividualSaudi.cmbOpenMonth = Mid$(recvSaudiIndividualMsg.custOpenDate, 5, 2)
    frmIndividualSaudi.txtOpenYear = Mid$(recvSaudiIndividualMsg.custOpenDate, 1, 4)
    
    frmIndividualSaudi.txtOpenBranch = recvSaudiIndividualMsg.branchOpened
    frmIndividualSaudi.txtOpenMakerId = recvSaudiIndividualMsg.openMakerId
    frmIndividualSaudi.txtOpenSupervisorId = recvSaudiIndividualMsg.openSupervisorId
    
    frmIndividualSaudi.cmbUpdateDate = Mid$(recvSaudiIndividualMsg.lastUpdateDate, 7, 2)
    frmIndividualSaudi.cmbUpdateMonth = Mid$(recvSaudiIndividualMsg.lastUpdateDate, 5, 2)
    frmIndividualSaudi.txtUpdateYear = Mid$(recvSaudiIndividualMsg.lastUpdateDate, 1, 4)
    frmIndividualSaudi.txtUpdateBranch = recvSaudiIndividualMsg.lastUpdateBranch
    frmIndividualSaudi.txtUpdateMakerId = recvSaudiIndividualMsg.lastUpdateMakerId
    frmIndividualSaudi.txtUpdateSupervisorId = recvSaudiIndividualMsg.lastUpdateSupervisorId
End Sub

Public Sub fillFrmIndividualSaudiAcctInfo()
  Dim tCode As String
  Dim i As Integer
      
  tCode = recvSaudiIndividualMsg.educationCode
  If tCode <> "" Then
      For i = 0 To frmIndividualSaudiAcctInfo.cmbEducation.ListCount
          If Mid(frmIndividualSaudiAcctInfo.cmbEducation.List(i), 3, 2) = tCode Then
             frmIndividualSaudiAcctInfo.cmbEducation.ListIndex = i
             Exit For
          End If
      Next i
  Else
      frmIndividualSaudiAcctInfo.cmbEducation.ListIndex = -1
  End If
  If i > frmIndividualSaudiAcctInfo.cmbEducation.ListCount Then
     frmIndividualSaudiAcctInfo.cmbEducation.ListIndex = -1
'      frmIndividualSaudiAcctInfo.cmbEducation.AddItem tCode & "- Not defined in local"
'      frmIndividualSaudiAcctInfo.cmbEducation.ListIndex = frmIndividualSaudiAcctInfo.cmbEducation.ListCount - 1
  End If
  
  tCode = recvSaudiIndividualMsg.professionCode
  If tCode <> "" Then
    For i = 0 To frmIndividualSaudiAcctInfo.cmbProfession.ListCount
        If Mid(frmIndividualSaudiAcctInfo.cmbProfession.List(i), 3, 2) = tCode Then
           frmIndividualSaudiAcctInfo.cmbProfession.ListIndex = i
           Exit For
        End If
    Next i
  Else
    frmIndividualSaudiAcctInfo.cmbProfession.ListIndex = -1
  End If
  If i > frmIndividualSaudiAcctInfo.cmbProfession.ListCount Then
     frmIndividualSaudiAcctInfo.cmbProfession.ListIndex = -1
'     frmIndividualSaudiAcctInfo.cmbProfession.AddItem tCode & "- Not defined in local"
'     frmIndividualSaudiAcctInfo.cmbProfession.ListIndex = frmIndividualSaudiAcctInfo.cmbProfession.ListCount - 1
  End If
  
  tCode = recvSaudiIndividualMsg.positionCode
  If tCode <> "" Then
     For i = 0 To frmIndividualSaudiAcctInfo.cmbPosition.ListCount
         If Mid(frmIndividualSaudiAcctInfo.cmbPosition.List(i), 3, 2) = tCode Then
            frmIndividualSaudiAcctInfo.cmbPosition.ListIndex = i
            Exit For
         End If
     Next i
  Else
     frmIndividualSaudiAcctInfo.cmbPosition.ListIndex = -1
  End If
  If i > frmIndividualSaudiAcctInfo.cmbPosition.ListCount Then
     frmIndividualSaudiAcctInfo.cmbPosition.ListIndex = -1
'     frmIndividualSaudiAcctInfo.cmbPosition.AddItem tCode & "- Not defined in local"
'     frmIndividualSaudiAcctInfo.cmbPosition.ListIndex = frmIndividualSaudiAcctInfo.cmbPosition.ListCount - 1
  End If
  
  tCode = recvSaudiIndividualMsg.monthlyIncome
  If tCode <> "" Then
     For i = 0 To frmIndividualSaudiAcctInfo.cmbMonthlyIncome.ListCount
         If Mid(frmIndividualSaudiAcctInfo.cmbMonthlyIncome.List(i), 3, 2) = tCode Then
            frmIndividualSaudiAcctInfo.cmbMonthlyIncome.ListIndex = i
            Exit For
         End If
     Next i
  Else
     frmIndividualSaudiAcctInfo.cmbMonthlyIncome.ListIndex = -1
  End If
  If i > frmIndividualSaudiAcctInfo.cmbMonthlyIncome.ListCount Then
     frmIndividualSaudiAcctInfo.cmbMonthlyIncome.ListIndex = -1
'     frmIndividualSaudiAcctInfo.cmbMonthlyIncome.AddItem tCode & "- Not defined in local"
'     frmIndividualSaudiAcctInfo.cmbMonthlyIncome.ListIndex = frmIndividualSaudiAcctInfo.cmbMonthlyIncome.ListCount - 1
  End If
  
  tCode = recvSaudiIndividualMsg.segmentation
  If Len(Trim(tCode)) = 0 Then
     tCode = "0"
  End If
  
  For i = 0 To frmIndividualSaudiAcctInfo.cmbSegmentation.ListCount
      If Mid(frmIndividualSaudiAcctInfo.cmbSegmentation.List(i), 1, 1) = tCode Then
         frmIndividualSaudiAcctInfo.cmbSegmentation.ListIndex = i
         Exit For
      End If
  Next i
  If i > frmIndividualSaudiAcctInfo.cmbSegmentation.ListCount Then
     frmIndividualSaudiAcctInfo.cmbSegmentation.AddItem tCode & "- Not defined in local"
     frmIndividualSaudiAcctInfo.cmbSegmentation.ListIndex = frmIndividualSaudiAcctInfo.cmbSegmentation.ListCount - 1
  End If
  
  frmIndividualSaudiAcctInfo.txtMarketingMemo = Trim(recvSaudiIndividualMsg.marketingMemo)
  
  tCode = recvSaudiIndividualMsg.ownerShip
  If Mid$(tCode, 1, 1) = "1" Then
     frmIndividualSaudiAcctInfo.chkRentedHouse.Value = 1
  Else
     frmIndividualSaudiAcctInfo.chkRentedHouse.Value = 0
  End If
  If Mid$(tCode, 2, 1) = "1" Then
     frmIndividualSaudiAcctInfo.chkOwnHouse.Value = 1
  Else
     frmIndividualSaudiAcctInfo.chkOwnHouse.Value = 0
  End If
  If Mid$(tCode, 3, 1) = "1" Then
     frmIndividualSaudiAcctInfo.chkCompanyAcc.Value = 1
  Else
     frmIndividualSaudiAcctInfo.chkCompanyAcc.Value = 0
  End If
  If Mid$(tCode, 4, 1) = "1" Then
     frmIndividualSaudiAcctInfo.chkRentedCar.Value = 1
  Else
     frmIndividualSaudiAcctInfo.chkRentedCar.Value = 0
  End If
  If Mid$(tCode, 5, 1) = "1" Then
     frmIndividualSaudiAcctInfo.chkOwnCar.Value = 1
  Else
     frmIndividualSaudiAcctInfo.chkOwnCar.Value = 0
  End If
  If Mid$(tCode, 6, 1) = "1" Then
     frmIndividualSaudiAcctInfo.chkCompanyTransport.Value = 1
  Else
     frmIndividualSaudiAcctInfo.chkCompanyTransport.Value = 0
  End If
  
  frmIndividualSaudiAcctInfo.txtEmployerName = recvSaudiIndividualMsg.employerName
  frmIndividualSaudiAcctInfo.txtDepartment = recvSaudiIndividualMsg.department
  frmIndividualSaudiAcctInfo.txtEmployerPOBox = recvSaudiIndividualMsg.employerPoBox
  frmIndividualSaudiAcctInfo.txtEmployerCity = recvSaudiIndividualMsg.employerCity
  frmIndividualSaudiAcctInfo.txtEmployerZipcode = recvSaudiIndividualMsg.employerZipCode
  
  documentsSelected = recvSaudiIndividualMsg.documents
  otherDocumentsEntered = recvSaudiIndividualMsg.documentOther
     
  tCode = recvSaudiIndividualMsg.packagedAcc
  If Len(Trim(tCode)) = 0 Then
     tCode = "0"
  End If
  For i = 0 To frmIndividualSaudiAcctInfo.cmbPackageAcc.ListCount
      If Mid(frmIndividualSaudiAcctInfo.cmbPackageAcc.List(i), 1, 1) = tCode Then
         frmIndividualSaudiAcctInfo.cmbPackageAcc.ListIndex = i
         Exit For
      End If
  Next i
  If i > frmIndividualSaudiAcctInfo.cmbPackageAcc.ListCount Then
     frmIndividualSaudiAcctInfo.cmbPackageAcc.text = tCode & "- Not defined in local"
  End If

'  If recvSaudiIndividualMsg.internetBankAcc = "1" Then
'     frmIndividualSaudiAcctInfo.optInternetYes.Value = True
'  Else
'     frmIndividualSaudiAcctInfo.optInternetNo.Value = True
'  End If

  If recvSaudiIndividualMsg.excludeFromAtmFees = "1" Then
     frmIndividualSaudiAcctInfo.optAtmFeeYes.Value = True
  Else
     frmIndividualSaudiAcctInfo.optAtmFeeNo.Value = True
  End If
  
  If recvSaudiIndividualMsg.excludeFromMinBalFees = "1" Then
     frmIndividualSaudiAcctInfo.optMinBalFeeYes.Value = True
  Else
     frmIndividualSaudiAcctInfo.optMinBalFeeNo.Value = True
  End If
  
  If recvSaudiIndividualMsg.pkgStmtFreqOverride = "1" Then
     frmIndividualSaudiAcctInfo.optSegmentStmtOverrideYes = True
  Else
     frmIndividualSaudiAcctInfo.optSegmentStmtOverrideNo = True
  End If
  
  If recvSaudiIndividualMsg.custAdviceFlag = "1" Then
     frmIndividualSaudiAcctInfo.optCustAdviceYes.Value = True
  Else
     frmIndividualSaudiAcctInfo.optCustAdviceNo.Value = True
  End If
    
  If recvSaudiIndividualMsg.singleJointAcc = "0" Or _
     recvSaudiIndividualMsg.singleJointAcc = " " Then
     frmIndividualSaudiAcctInfo.OptSingle.Value = True
     frmIndividualSaudiAcctInfo.cmdJointAcc.Enabled = False
  ElseIf recvSaudiIndividualMsg.singleJointAcc = "1" Then
     frmIndividualSaudiAcctInfo.optJoint.Value = True
     frmIndividualSaudiAcctInfo.cmdJointAcc.Enabled = True
  ElseIf recvSaudiIndividualMsg.singleJointAcc = "2" Then
     frmIndividualSaudiAcctInfo.optUnidentified.Value = True
     If updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
        frmIndividualSaudiAcctInfo.frameAcSingleJoint.Enabled = True
     Else
        frmIndividualSaudiAcctInfo.frameAcSingleJoint.Enabled = False
     End If
  End If
  
  If recvSaudiIndividualMsg.signatureNature = "0" Or _
     recvSaudiIndividualMsg.signatureNature = " " Then
     frmIndividualSaudiAcctInfo.optSignSingle.Value = True
  Else
     frmIndividualSaudiAcctInfo.optSignJoint.Value = True
  End If
  
  ' Current acc Info
  If Len(RTrim(recvSaudiIndividualMsg.currentAccInfo)) <> 0 Then
     If Mid$(recvSaudiIndividualMsg.currentAccInfo, 11, 1) <> "1" Then
        frmIndividualSaudiAcctInfo.optCurrentAcYes.Value = True
        tCode = Mid$(recvSaudiIndividualMsg.currentAccInfo, 1, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.ListCount
               If Mid(frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.List(i), 1, 2) = tCode Then
                  frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.ListIndex = -1
        End If
        If i > frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.ListCount Then
           frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.AddItem tCode & "-Not defined in local"
           frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.ListIndex = frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.ListCount - 1
        End If
        tCode = Mid$(recvSaudiIndividualMsg.currentAccInfo, 6, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.ListCount
              If Mid(frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.List(i), 1, 2) = tCode Then
                 frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.ListIndex = -1
        End If
        If i > frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.ListCount Then
           frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.AddItem tCode & "-Not defined in local"
           frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.ListIndex = frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.ListCount - 1
        End If
     
        tCode = Mid$(recvSaudiIndividualMsg.currentAccInfo, 8, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.ListCount
               If Mid(frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.List(i), 1, 2) = tCode Then
                  frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.ListIndex = -1
        End If
        If i > frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.ListCount Then
           frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.AddItem tCode & "-Not defined in local"
           frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.ListIndex = frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.ListCount - 1
        End If
        If Mid$(recvSaudiIndividualMsg.currentAccInfo, 10, 1) = "1" Then
           frmIndividualSaudiAcctInfo.optCurrentAcCheckBookYes.Value = True
        Else
           frmIndividualSaudiAcctInfo.optCurrentAcCheckBookNo.Value = True
        End If
    End If
  Else
     frmIndividualSaudiAcctInfo.optCurrentAcNo.Value = True
  End If
     

  ' Savings Acc info
  If Len(RTrim(recvSaudiIndividualMsg.savingsAccInfo)) <> 0 Then
     If Mid$(recvSaudiIndividualMsg.savingsAccInfo, 11, 1) <> "1" Then
        frmIndividualSaudiAcctInfo.optSavingAcYes.Value = True
        tCode = Mid$(recvSaudiIndividualMsg.savingsAccInfo, 1, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.ListCount
              If Mid(frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.List(i), 1, 2) = tCode Then
                 frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.ListIndex = -1
        End If
        If i > frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.ListCount Then
           frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.AddItem tCode & "-Not defined in local"
           frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.ListIndex = frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.ListCount - 1
        End If
        
        tCode = Mid$(recvSaudiIndividualMsg.savingsAccInfo, 6, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualSaudiAcctInfo.cmbSavingAcStatus.ListCount
              If Mid(frmIndividualSaudiAcctInfo.cmbSavingAcStatus.List(i), 1, 2) = tCode Then
                 frmIndividualSaudiAcctInfo.cmbSavingAcStatus.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmIndividualSaudiAcctInfo.cmbSavingAcStatus.ListIndex = -1
        End If
        If i > frmIndividualSaudiAcctInfo.cmbSavingAcStatus.ListCount Then
           frmIndividualSaudiAcctInfo.cmbSavingAcStatus.AddItem tCode & "-Not defined in local"
           frmIndividualSaudiAcctInfo.cmbSavingAcStatus.ListIndex = frmIndividualSaudiAcctInfo.cmbSavingAcStatus.ListCount - 1
        End If
        
        tCode = Mid$(recvSaudiIndividualMsg.savingsAccInfo, 8, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.ListCount
              If Mid(frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.List(i), 1, 2) = tCode Then
                 frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.ListIndex = -1
        End If
        If i > frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.ListCount Then
            frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.AddItem tCode & "-Not defined in local"
            frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.ListIndex = frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.ListCount - 1
        End If
    End If
  Else
     frmIndividualSaudiAcctInfo.optSavingAcNo.Value = True
  End If

  ' Other Acc Info
  If Len(RTrim(recvSaudiIndividualMsg.otherAccInfo)) <> 0 Then
     If Mid$(recvSaudiIndividualMsg.otherAccInfo, 11, 1) <> "1" Then
         tCode = Mid$(recvSaudiIndividualMsg.otherAccInfo, 3, 3)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmIndividualSaudiAcctInfo.cmbOtherAccount.ListCount
               If Mid(frmIndividualSaudiAcctInfo.cmbOtherAccount.List(i), 1, 3) = tCode Then
                  frmIndividualSaudiAcctInfo.cmbOtherAccount.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmIndividualSaudiAcctInfo.cmbOtherAccount.ListIndex = -1
         End If
         If i > frmIndividualSaudiAcctInfo.cmbOtherAccount.ListCount Then
            frmIndividualSaudiAcctInfo.cmbOtherAccount.AddItem tCode & "-Not defined in local"
            frmIndividualSaudiAcctInfo.cmbOtherAccount.ListIndex = frmIndividualSaudiAcctInfo.cmbOtherAccount.ListCount - 1
         End If
         
         tCode = Mid$(recvSaudiIndividualMsg.otherAccInfo, 1, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.ListCount
               If Mid(frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.List(i), 1, 2) = tCode Then
                  frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.ListIndex = -1
         End If
         If i > frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.ListCount Then
            frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.AddItem tCode & "-Not defined in local"
            frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.ListIndex = frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.ListCount - 1
         End If
         
         tCode = Mid$(recvSaudiIndividualMsg.otherAccInfo, 6, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmIndividualSaudiAcctInfo.cmbOtherAcStatus.ListCount
               If Mid(frmIndividualSaudiAcctInfo.cmbOtherAcStatus.List(i), 1, 2) = tCode Then
                  frmIndividualSaudiAcctInfo.cmbOtherAcStatus.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmIndividualSaudiAcctInfo.cmbOtherAcStatus.ListIndex = -1
         End If
         If i > frmIndividualSaudiAcctInfo.cmbOtherAcStatus.ListCount Then
            frmIndividualSaudiAcctInfo.cmbOtherAcStatus.AddItem tCode & "-Not defined in local"
            frmIndividualSaudiAcctInfo.cmbOtherAcStatus.ListIndex = frmIndividualSaudiAcctInfo.cmbOtherAcStatus.ListCount - 1
         End If
         
         tCode = Mid$(recvSaudiIndividualMsg.otherAccInfo, 8, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.ListCount
               If Mid(frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.List(i), 1, 2) = tCode Then
                  frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.ListIndex = -1
         End If
         If i > frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.ListCount Then
            frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.AddItem tCode & "-Not defined in local"
            frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.ListIndex = frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.ListCount - 1
         End If
         If Mid$(recvSaudiIndividualMsg.otherAccInfo, 10, 1) = "1" Then
            frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes.Value = True
         Else
            frmIndividualSaudiAcctInfo.optOtherAcCheckBookNo.Value = True
         End If
    End If
  End If
    
  If recvSaudiIndividualMsg.updatedForSama = "1" Then
     frmIndividualSaudiAcctInfo.optSamaUpdYes.Value = True
  Else
     frmIndividualSaudiAcctInfo.optSamaUpdNo.Value = True
  End If
   
  frmIndividualSaudiAcctInfo.txtRelationshipManager = recvSaudiIndividualMsg.relationshipManager
  frmIndividualSaudiAcctInfo.txtGeneralMemo = recvSaudiIndividualMsg.generalMemo
  frmIndividualSaudiAcctInfo.txtFreezingGracePeriod = Val(recvSaudiIndividualMsg.accFreezingGracePeriod)
  
  If recvSaudiIndividualMsg.cardType = "S" Then
     frmIndividualSaudiAcctInfo.optChipCard.Value = True
  Else
     frmIndividualSaudiAcctInfo.optIntlCard.Value = True
  End If
            
  If recvSaudiIndividualMsg.electronIntlRequired = "1" Then
     frmIndividualSaudiAcctInfo.optPrimaryElectronIntlCardYes.Value = True
  Else
     frmIndividualSaudiAcctInfo.optPrimaryElectronIntlCardNo.Value = True
  End If
  frmIndividualSaudiAcctInfo.txtPrimaryElectronIntlCardName = _
            UCase(recvSaudiIndividualMsg.electronIntlName)
    
  If recvSaudiIndividualMsg.electronIntlSuppRequired = "1" Then
     frmIndividualSaudiAcctInfo.optSecondaryElectronIntlCardYes.Value = True
  Else
     frmIndividualSaudiAcctInfo.optSecondaryElectronIntlCardNo.Value = True
  End If
   
  frmIndividualSaudiAcctInfo.txtSecondaryElectronIntlCardName = _
             UCase(recvSaudiIndividualMsg.electronIntlSuppName)
   
  If recvSaudiIndividualMsg.deliveryToBranchOrPO = "C" Or _
     recvSaudiIndividualMsg.deliveryToBranchOrPO = "B" Then
     frmIndividualSaudiAcctInfo.optCardDeliveredToBranch.Value = True
  ElseIf recvSaudiIndividualMsg.deliveryToBranchOrPO = "R" Then
     frmIndividualSaudiAcctInfo.optCardDeliveredToReqBranch.Value = True
  ElseIf recvSaudiIndividualMsg.deliveryToBranchOrPO = "P" Then
     frmIndividualSaudiAcctInfo.optCardDeliveredToPOBox.Value = True
  Else 'GPS
     frmIndividualSaudiAcctInfo.optCardDeliveredToGPS.Value = True
  End If
  frmIndividualSaudiAcctInfo.txtDeliveryAddr2 = recvSaudiIndividualMsg.deliveryAddress2
  frmIndividualSaudiAcctInfo.cmbDeliveryCity.text = recvSaudiIndividualMsg.deliveryCity
  If recvSaudiIndividualMsg.deliveryToBranchOrPO <> "G" Then
     frmIndividualSaudiAcctInfo.txtDeliveryAddr1 = recvSaudiIndividualMsg.deliveryAddress1
     frmIndividualSaudiAcctInfo.txtDeliveryPOBox = recvSaudiIndividualMsg.deliveryPoBox
     frmIndividualSaudiAcctInfo.txtDeliveryZipcode = recvSaudiIndividualMsg.deliveryZip
  Else ' GPS address is selected
     frmIndividualSaudiAcctInfo.txtGPSNo = Mid$(recvSaudiIndividualMsg.deliveryAddress1, 1, 5)
     frmIndividualSaudiAcctInfo.txtGPSStreetName = Mid$(recvSaudiIndividualMsg.deliveryAddress1, 7)
     frmIndividualSaudiAcctInfo.txtGPSUnit = recvSaudiIndividualMsg.deliveryPoBox
     frmIndividualSaudiAcctInfo.txtGPSZipCode = Mid$(recvSaudiIndividualMsg.deliveryZip, 1, 5)
     frmIndividualSaudiAcctInfo.txtGPSAdditionalNo = Mid$(recvSaudiIndividualMsg.deliveryZip, 7)
  End If
End Sub

Public Sub fillfrmJuristicNonresident()
   Dim tCode As String, i As Integer, mQry As String

    frmJuristicNonResident.txtCustomerNo = recvJuristicMsg.customerNo
    
    tCode = recvJuristicMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmJuristicNonResident.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmJuristicNonResident.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmJuristicNonResident.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvJuristicMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmJuristicNonResident.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmJuristicNonResident.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmJuristicNonResident.cmbAltBrCode.text = "0000-NONE"
    End If
    
    frmJuristicNonResident.txtContractNo = recvJuristicMsg.contractNo
    If recvJuristicMsg.contractDateType = "0" Or _
       recvJuristicMsg.contractDateType = " " Then
       frmJuristicNonResident.optContractDateHijri.Value = True
       frmJuristicNonResident.txtContractIssueYear = Mid$(recvJuristicMsg.contractIssueDateH, 1, 4)
       frmJuristicNonResident.cmbContractIssueDate.text = Right$(recvJuristicMsg.contractIssueDateH, 2)
       frmJuristicNonResident.cmbContractIssueMonth.text = Mid$(recvJuristicMsg.contractIssueDateH, 5, 2)
       frmJuristicNonResident.txtContractExpiryYear = Mid$(recvJuristicMsg.contractExpiryDateH, 1, 4)
       frmJuristicNonResident.cmbContractExpiryDate.text = Right$(recvJuristicMsg.contractExpiryDateH, 2)
       frmJuristicNonResident.cmbContractExpiryMonth.text = Mid$(recvJuristicMsg.contractExpiryDateH, 5, 2)
    Else
       frmJuristicNonResident.optContractDateGreg.Value = True
       frmJuristicNonResident.txtContractIssueYear = Mid$(recvJuristicMsg.contractIssueDateG, 1, 4)
       frmJuristicNonResident.cmbContractIssueDate.text = Right$(recvJuristicMsg.contractIssueDateG, 2)
       frmJuristicNonResident.cmbContractIssueMonth.text = Mid$(recvJuristicMsg.contractIssueDateG, 5, 2)
       frmJuristicNonResident.txtContractExpiryYear = Mid$(recvJuristicMsg.contractExpiryDateG, 1, 4)
       frmJuristicNonResident.cmbContractExpiryDate.text = Right$(recvJuristicMsg.contractExpiryDateG, 2)
       frmJuristicNonResident.cmbContractExpiryMonth.text = Mid$(recvJuristicMsg.contractExpiryDateG, 5, 2)
    End If
    
    frmJuristicNonResident.txtSamaAuthNo = recvJuristicMsg.samaAuthNo
    If recvJuristicMsg.samaAuthDateType = "0" Or _
       recvJuristicMsg.samaAuthDateType = " " Then
       frmJuristicNonResident.optSamaAuthDateHijri.Value = True
       frmJuristicNonResident.txtSamaAuthIssueYear = Mid$(recvJuristicMsg.samaAuthIssueDateH, 1, 4)
       frmJuristicNonResident.cmbSamaAuthIssueDate.text = Right$(recvJuristicMsg.samaAuthIssueDateH, 2)
       frmJuristicNonResident.cmbSamaAuthIssueMonth.text = Mid$(recvJuristicMsg.samaAuthIssueDateH, 5, 2)
       frmJuristicNonResident.txtSamaAuthExpiryYear = Mid$(recvJuristicMsg.samaAuthExpiryDateH, 1, 4)
       frmJuristicNonResident.cmbSamaAuthExpiryDate.text = Right$(recvJuristicMsg.samaAuthExpiryDateH, 2)
       frmJuristicNonResident.cmbSamaAuthExpiryMonth.text = Mid$(recvJuristicMsg.samaAuthExpiryDateH, 5, 2)
    Else
       frmJuristicNonResident.optSamaAuthDateGreg.Value = True
       frmJuristicNonResident.txtSamaAuthIssueYear = Mid$(recvJuristicMsg.samaAuthIssueDateG, 1, 4)
       frmJuristicNonResident.cmbSamaAuthIssueDate.text = Right$(recvJuristicMsg.samaAuthIssueDateG, 2)
       frmJuristicNonResident.cmbSamaAuthIssueMonth.text = Mid$(recvJuristicMsg.samaAuthIssueDateG, 5, 2)
       frmJuristicNonResident.txtSamaAuthExpiryYear = Mid$(recvJuristicMsg.samaAuthExpiryDateG, 1, 4)
       frmJuristicNonResident.cmbSamaAuthExpiryDate.text = Right$(recvJuristicMsg.samaAuthExpiryDateG, 2)
       frmJuristicNonResident.cmbSamaAuthExpiryMonth.text = Mid$(recvJuristicMsg.samaAuthExpiryDateG, 5, 2)
    End If
    
    frmJuristicNonResident.txtLicNo = recvJuristicMsg.licNo
    If recvJuristicMsg.licDateType = "0" Or _
       recvJuristicMsg.licDateType = " " Then
       frmJuristicNonResident.optLicDateHijri.Value = True
       frmJuristicNonResident.txtLicIssueYear = Mid$(recvJuristicMsg.licIssueDateH, 1, 4)
       frmJuristicNonResident.cmbLicIssueDate.text = Right$(recvJuristicMsg.licIssueDateH, 2)
       frmJuristicNonResident.cmbLicIssueMonth.text = Mid$(recvJuristicMsg.licIssueDateH, 5, 2)
       frmJuristicNonResident.txtLicExpiryYear = Mid$(recvJuristicMsg.licExpiryDateH, 1, 4)
       frmJuristicNonResident.cmbLicExpiryDate.text = Right$(recvJuristicMsg.licExpiryDateH, 2)
       frmJuristicNonResident.cmbLicExpiryMonth.text = Mid$(recvJuristicMsg.licExpiryDateH, 5, 2)
    Else
       frmJuristicNonResident.optLicDateGreg.Value = True
       frmJuristicNonResident.txtLicIssueYear = Mid$(recvJuristicMsg.licIssueDateG, 1, 4)
       frmJuristicNonResident.cmbLicIssueDate.text = Right$(recvJuristicMsg.licIssueDateG, 2)
       frmJuristicNonResident.cmbLicIssueMonth.text = Mid$(recvJuristicMsg.licIssueDateG, 5, 2)
       frmJuristicNonResident.txtLicExpiryYear = Mid$(recvJuristicMsg.licExpiryDateG, 1, 4)
       frmJuristicNonResident.cmbLicExpiryDate.text = Right$(recvJuristicMsg.licExpiryDateG, 2)
       frmJuristicNonResident.cmbLicExpiryMonth.text = Mid$(recvJuristicMsg.licExpiryDateG, 5, 2)
    End If
    
    frmJuristicNonResident.txtApproverNo = recvJuristicMsg.approvalRefNo
    If recvJuristicMsg.appDateType = "0" Or _
       recvJuristicMsg.appDateType = " " Then
       frmJuristicNonResident.optAppDateHijri.Value = True
       frmJuristicNonResident.txtAppIssueYear = Mid$(recvJuristicMsg.appIssueDateH, 1, 4)
       frmJuristicNonResident.cmbAppIssueDate.text = Right$(recvJuristicMsg.appIssueDateH, 2)
       frmJuristicNonResident.cmbAppIssueMonth.text = Mid$(recvJuristicMsg.appIssueDateH, 5, 2)
       frmJuristicNonResident.txtAppExpiryYear = Mid$(recvJuristicMsg.appExpiryDateH, 1, 4)
       frmJuristicNonResident.cmbAppExpiryDate.text = Right$(recvJuristicMsg.appExpiryDateH, 2)
       frmJuristicNonResident.cmbAppExpiryMonth.text = Mid$(recvJuristicMsg.appExpiryDateH, 5, 2)
    Else
       frmJuristicNonResident.optAppDateGreg.Value = True
       frmJuristicNonResident.txtAppIssueYear = Mid$(recvJuristicMsg.appIssueDateG, 1, 4)
       frmJuristicNonResident.cmbAppIssueDate.text = Right$(recvJuristicMsg.appIssueDateG, 2)
       frmJuristicNonResident.cmbAppIssueMonth.text = Mid$(recvJuristicMsg.appIssueDateG, 5, 2)
       frmJuristicNonResident.txtAppExpiryYear = Mid$(recvJuristicMsg.appExpiryDateG, 1, 4)
       frmJuristicNonResident.cmbAppExpiryDate.text = Right$(recvJuristicMsg.appExpiryDateG, 2)
       frmJuristicNonResident.cmbAppExpiryMonth.text = Mid$(recvJuristicMsg.appExpiryDateG, 5, 2)
    End If
    frmJuristicNonResident.txtApproverName = recvJuristicMsg.appRefName
    
    If recvJuristicMsg.langPref = "0" Or _
       recvJuristicMsg.langPref = " " Then
       frmJuristicNonResident.optLangArabic.Value = True
    Else
       frmJuristicNonResident.optLangEnglish.Value = True
    End If
         
    tCode = Mid$(recvJuristicMsg.nationality, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmJuristicNonResident.cmbNationality.ListCount
            If Mid(frmJuristicNonResident.cmbNationality.List(i), 1, 3) = tCode Then
               frmJuristicNonResident.cmbNationality.ListIndex = i  ' RTrim(frmJuristicNonresident.cmbNationality.List(i))
               Exit For
            End If
        Next i
    Else
        frmJuristicNonResident.cmbNationality.ListIndex = -1
    End If
    If i > frmJuristicNonResident.cmbNationality.ListCount Then
       frmJuristicNonResident.cmbNationality.ListIndex = -1
       'frmJuristicNonresident.cmbNationality.Text = tCode & "-Not defined in local"
    End If
    
    frmJuristicNonResident.txtArabFirstName = recvJuristicMsg.aOrgFirstName
    frmJuristicNonResident.txtArab2ndName = recvJuristicMsg.aOrg2ndName
    frmJuristicNonResident.txtArabShortName = recvJuristicMsg.aOrgShortName
    frmJuristicNonResident.txtEngFirstName = recvJuristicMsg.eOrgFirstName
    frmJuristicNonResident.txtEnglish2ndName = recvJuristicMsg.eOrg2ndName
    frmJuristicNonResident.txtEngShortName = recvJuristicMsg.eOrgShortName
    frmJuristicNonResident.txtOrgAlphaSearch = recvJuristicMsg.orgAlphaSearch
    
    tCode = Mid$(recvJuristicMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmJuristicNonResident.cmbBusinessType.ListCount
            If Mid(frmJuristicNonResident.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmJuristicNonResident.cmbBusinessType.ListIndex = i ' RTrim(frmJuristicNonresident.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmJuristicNonResident.cmbBusinessType.ListIndex = -1
    End If
    If i > frmJuristicNonResident.cmbBusinessType.ListCount Then
       frmJuristicNonResident.cmbBusinessType.ListIndex = -1
      'frmJuristicNonresident.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    frmJuristicNonResident.txtPurposeOfAccount = recvJuristicMsg.purposeOfAccount
    If recvJuristicMsg.addressType = "1" Then
       frmJuristicNonResident.optSaudiPost.Value = True
       frmJuristicNonResident.txtSaudiPostGPSNo = Mid$(recvJuristicMsg.address1, 1, 5)
       frmJuristicNonResident.txtSaudiPostStreetName = Mid$(recvJuristicMsg.address1, 7)
       frmJuristicNonResident.txtSaudiPostUnit = recvJuristicMsg.poBox
       frmJuristicNonResident.txtSaudiPostZipCode = Mid$(recvJuristicMsg.zipCode, 1, 5)
       frmJuristicNonResident.txtSaudiPostAdditionalNo = Mid$(recvJuristicMsg.zipCode, 7)
    Else
       frmJuristicNonResident.optPoBox.Value = True
       frmJuristicNonResident.txtAddress1 = recvJuristicMsg.address1
       frmJuristicNonResident.txtAddress2 = recvJuristicMsg.address2
       frmJuristicNonResident.txtPOBox = recvJuristicMsg.poBox
       frmJuristicNonResident.txtPinCode = recvJuristicMsg.zipCode
    
       tCode = Mid$(recvJuristicMsg.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmJuristicNonResident.cmbCountry.ListCount
              If Mid(frmJuristicNonResident.cmbCountry.List(i), 1, 3) = tCode Then
                 frmJuristicNonResident.cmbCountry.ListIndex = i 'RTrim(frmJuristicNonresident.cmbCountry.List(i))
                 Exit For
              End If
          Next i
       Else
          frmJuristicNonResident.cmbCountry.ListIndex = -1
       End If
       If i > frmJuristicNonResident.cmbCountry.ListCount Then
          frmJuristicNonResident.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    frmJuristicNonResident.cmbCity.text = recvJuristicMsg.cityName
    If Len(RTrim(recvJuristicMsg.telOffAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicNonResident.txtOffPhoneCityCode = recvJuristicMsg.telOffAreaCode
    End If
    frmJuristicNonResident.txtOffPhoneNo = recvJuristicMsg.telOffNo
    frmJuristicNonResident.txtOffPhoneExt = recvJuristicMsg.telOffExt
    If Len(RTrim(recvJuristicMsg.telHomeAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicNonResident.txtResPhoneCityCode = recvJuristicMsg.telHomeAreaCode
    End If
    frmJuristicNonResident.txtResPhoneNo = recvJuristicMsg.telHomeNo
    frmJuristicNonResident.txtResPhoneExt = recvJuristicMsg.telHomeExt
    If Len(RTrim(recvJuristicMsg.faxAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicNonResident.txtFaxCityCode = recvJuristicMsg.faxAreaCode
    End If
    frmJuristicNonResident.txtFaxNo = recvJuristicMsg.faxNo
    frmJuristicNonResident.txtFaxExt = recvJuristicMsg.faxExt
    frmJuristicNonResident.txtMobileAreaCode = Mid$(recvJuristicMsg.mobileNo, 1, 2)
    frmJuristicNonResident.txtMobileNo = Mid$(recvJuristicMsg.mobileNo, 3)
    frmJuristicNonResident.txtPagerNo = recvJuristicMsg.pagerNo
    frmJuristicNonResident.txtEmailAddress = recvJuristicMsg.eMail
    
    frmJuristicNonResident.cmbOpenDate = Mid$(recvJuristicMsg.custOpenDate, 7, 2)
    frmJuristicNonResident.cmbOpenMonth = Mid$(recvJuristicMsg.custOpenDate, 5, 2)
    frmJuristicNonResident.txtOpenYear = Mid$(recvJuristicMsg.custOpenDate, 1, 4)
    
    frmJuristicNonResident.txtOpenBranch = recvJuristicMsg.branchOpened
    frmJuristicNonResident.txtOpenMakerId = recvJuristicMsg.openMakerId
    frmJuristicNonResident.txtOpenSupervisorId = recvJuristicMsg.openSupervisorId
    
    frmJuristicNonResident.cmbUpdateDate = Mid$(recvJuristicMsg.lastUpdateDate, 7, 2)
    frmJuristicNonResident.cmbUpdateMonth = Mid$(recvJuristicMsg.lastUpdateDate, 5, 2)
    frmJuristicNonResident.txtUpdateYear = Mid$(recvJuristicMsg.lastUpdateDate, 1, 4)
    frmJuristicNonResident.txtUpdateBranch = recvJuristicMsg.lastUpdateBranch
    frmJuristicNonResident.txtUpdateMakerId = recvJuristicMsg.lastUpdateMakerId
    frmJuristicNonResident.txtUpdateSupervisorId = recvJuristicMsg.lastUpdateSupervisorId


End Sub

Public Sub fillFrmJuristicDiplomats()
    Dim tCode As String, i As Integer, mQry As String

    frmJuristicDiplomats.txtCustomerNo = recvJuristicMsg.customerNo
    
    tCode = recvJuristicMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmJuristicDiplomats.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmJuristicDiplomats.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmJuristicDiplomats.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvJuristicMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmJuristicDiplomats.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmJuristicDiplomats.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmJuristicDiplomats.cmbAltBrCode.text = "0000-NONE"
    End If
    
    frmJuristicDiplomats.txtPPNo = recvJuristicMsg.ppNo
    If recvJuristicMsg.ppDateType = "0" Or _
       recvJuristicMsg.ppDateType = " " Then
       frmJuristicDiplomats.optPPDateHijri.Value = True
       frmJuristicDiplomats.txtPPIssueYear = Mid$(recvJuristicMsg.ppIssueDateH, 1, 4)
       frmJuristicDiplomats.cmbPPIssueDate.text = Right$(recvJuristicMsg.ppIssueDateH, 2)
       frmJuristicDiplomats.cmbPPIssueMonth.text = Mid$(recvJuristicMsg.ppIssueDateH, 5, 2)
       frmJuristicDiplomats.txtPPExpiryYear = Mid$(recvJuristicMsg.ppExpiryDateH, 1, 4)
       frmJuristicDiplomats.cmbPPExpiryDate.text = Right$(recvJuristicMsg.ppExpiryDateH, 2)
       frmJuristicDiplomats.cmbPPExpiryMonth.text = Mid$(recvJuristicMsg.ppExpiryDateH, 5, 2)
    Else
       frmJuristicDiplomats.optPPDateGreg.Value = True
       frmJuristicDiplomats.txtPPIssueYear = Mid$(recvJuristicMsg.ppIssueDateG, 1, 4)
       frmJuristicDiplomats.cmbPPIssueDate.text = Right$(recvJuristicMsg.ppIssueDateG, 2)
       frmJuristicDiplomats.cmbPPIssueMonth.text = Mid$(recvJuristicMsg.ppIssueDateG, 5, 2)
       frmJuristicDiplomats.txtPPExpiryYear = Mid$(recvJuristicMsg.ppExpiryDateG, 1, 4)
       frmJuristicDiplomats.cmbPPExpiryDate.text = Right$(recvJuristicMsg.ppExpiryDateG, 2)
       frmJuristicDiplomats.cmbPPExpiryMonth.text = Mid$(recvJuristicMsg.ppExpiryDateG, 5, 2)
    End If
    
    frmJuristicDiplomats.txtDiplomaticCardNo = recvJuristicMsg.dcNo
    If recvJuristicMsg.dcDateType = "0" Or _
       recvJuristicMsg.dcDateType = " " Then
       frmJuristicDiplomats.optDCDateHijri.Value = True
       frmJuristicDiplomats.txtDCIssueYear = Mid$(recvJuristicMsg.dcIssueDateH, 1, 4)
       frmJuristicDiplomats.cmbDCIssueDate.text = Right$(recvJuristicMsg.dcIssueDateH, 2)
       frmJuristicDiplomats.cmbDCIssueMonth.text = Mid$(recvJuristicMsg.dcIssueDateH, 5, 2)
       frmJuristicDiplomats.txtDCExpiryYear = Mid$(recvJuristicMsg.dcExpiryDateH, 1, 4)
       frmJuristicDiplomats.cmbDCExpiryDate.text = Right$(recvJuristicMsg.dcExpiryDateH, 2)
       frmJuristicDiplomats.cmbDCExpiryMonth.text = Mid$(recvJuristicMsg.dcExpiryDateH, 5, 2)
    Else
       frmJuristicDiplomats.optDCDateGreg.Value = True
       frmJuristicDiplomats.txtDCIssueYear = Mid$(recvJuristicMsg.dcIssueDateG, 1, 4)
       frmJuristicDiplomats.cmbDCIssueDate.text = Right$(recvJuristicMsg.dcIssueDateG, 2)
       frmJuristicDiplomats.cmbDCIssueMonth.text = Mid$(recvJuristicMsg.dcIssueDateG, 5, 2)
       frmJuristicDiplomats.txtDCExpiryYear = Mid$(recvJuristicMsg.dcExpiryDateG, 1, 4)
       frmJuristicDiplomats.cmbDCExpiryDate.text = Right$(recvJuristicMsg.dcExpiryDateG, 2)
       frmJuristicDiplomats.cmbDCExpiryMonth.text = Mid$(recvJuristicMsg.dcExpiryDateG, 5, 2)
    End If
    
    frmJuristicDiplomats.txtVisaNo = recvJuristicMsg.visaNo
    If recvJuristicMsg.visaDateType = "0" Or _
       recvJuristicMsg.visaDateType = " " Then
       frmJuristicDiplomats.optVisaDateHijri.Value = True
       frmJuristicDiplomats.txtVisaIssueYear = Mid$(recvJuristicMsg.visaIssueDateH, 1, 4)
       frmJuristicDiplomats.cmbVisaIssueDate.text = Right$(recvJuristicMsg.visaIssueDateH, 2)
       frmJuristicDiplomats.cmbVisaIssueMonth.text = Mid$(recvJuristicMsg.visaIssueDateH, 5, 2)
       frmJuristicDiplomats.txtVisaExpiryYear = Mid$(recvJuristicMsg.visaExpiryDateH, 1, 4)
       frmJuristicDiplomats.cmbVisaExpiryDate.text = Right$(recvJuristicMsg.visaExpiryDateH, 2)
       frmJuristicDiplomats.cmbVisaExpiryMonth.text = Mid$(recvJuristicMsg.visaExpiryDateH, 5, 2)
    Else
       frmJuristicDiplomats.optVisaDateGreg.Value = True
       frmJuristicDiplomats.txtVisaIssueYear = Mid$(recvJuristicMsg.visaIssueDateG, 1, 4)
       frmJuristicDiplomats.cmbVisaIssueDate.text = Right$(recvJuristicMsg.visaIssueDateG, 2)
       frmJuristicDiplomats.cmbVisaIssueMonth.text = Mid$(recvJuristicMsg.visaIssueDateG, 5, 2)
       frmJuristicDiplomats.txtVisaExpiryYear = Mid$(recvJuristicMsg.visaExpiryDateG, 1, 4)
       frmJuristicDiplomats.cmbVisaExpiryDate.text = Right$(recvJuristicMsg.visaExpiryDateG, 2)
       frmJuristicDiplomats.cmbVisaExpiryMonth.text = Mid$(recvJuristicMsg.visaExpiryDateG, 5, 2)
    End If
    
    frmJuristicDiplomats.txtApproverNo = recvJuristicMsg.approvalRefNo
    If recvJuristicMsg.appDateType = "0" Or _
       recvJuristicMsg.appDateType = " " Then
       frmJuristicDiplomats.optAppDateHijri.Value = True
       frmJuristicDiplomats.txtAppIssueYear = Mid$(recvJuristicMsg.appIssueDateH, 1, 4)
       frmJuristicDiplomats.cmbAppIssueDate.text = Right$(recvJuristicMsg.appIssueDateH, 2)
       frmJuristicDiplomats.cmbAppIssueMonth.text = Mid$(recvJuristicMsg.appIssueDateH, 5, 2)
       frmJuristicDiplomats.txtAppExpiryYear = Mid$(recvJuristicMsg.appExpiryDateH, 1, 4)
       frmJuristicDiplomats.cmbAppExpiryDate.text = Right$(recvJuristicMsg.appExpiryDateH, 2)
       frmJuristicDiplomats.cmbAppExpiryMonth.text = Mid$(recvJuristicMsg.appExpiryDateH, 5, 2)
    Else
       frmJuristicDiplomats.optAppDateGreg.Value = True
       frmJuristicDiplomats.txtAppIssueYear = Mid$(recvJuristicMsg.appIssueDateG, 1, 4)
       frmJuristicDiplomats.cmbAppIssueDate.text = Right$(recvJuristicMsg.appIssueDateG, 2)
       frmJuristicDiplomats.cmbAppIssueMonth.text = Mid$(recvJuristicMsg.appIssueDateG, 5, 2)
       frmJuristicDiplomats.txtAppExpiryYear = Mid$(recvJuristicMsg.appExpiryDateG, 1, 4)
       frmJuristicDiplomats.cmbAppExpiryDate.text = Right$(recvJuristicMsg.appExpiryDateG, 2)
       frmJuristicDiplomats.cmbAppExpiryMonth.text = Mid$(recvJuristicMsg.appExpiryDateG, 5, 2)
    End If
    frmJuristicDiplomats.txtApproverName = recvJuristicMsg.appRefName
    
    If recvJuristicMsg.langPref = "0" Or _
       recvJuristicMsg.langPref = " " Then
       frmJuristicDiplomats.optLangArabic.Value = True
    Else
       frmJuristicDiplomats.optLangEnglish.Value = True
    End If
         
    tCode = Mid$(recvJuristicMsg.nationality, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmJuristicDiplomats.cmbNationality.ListCount
            If Mid(frmJuristicDiplomats.cmbNationality.List(i), 1, 3) = tCode Then
               frmJuristicDiplomats.cmbNationality.ListIndex = i  ' RTrim(frmjuristicdiplomats.cmbNationality.List(i))
               Exit For
            End If
        Next i
    Else
        frmJuristicDiplomats.cmbNationality.ListIndex = -1
    End If
    If i > frmJuristicDiplomats.cmbNationality.ListCount Then
       frmJuristicDiplomats.cmbNationality.ListIndex = -1
       'frmjuristicdiplomats.cmbNationality.Text = tCode & "-Not defined in local"
    End If
    
    frmJuristicDiplomats.txtArabFirstName = recvJuristicMsg.aOrgFirstName
    frmJuristicDiplomats.txtArab2ndName = recvJuristicMsg.aOrg2ndName
    frmJuristicDiplomats.txtArabShortName = recvJuristicMsg.aOrgShortName
    frmJuristicDiplomats.txtEngFirstName = recvJuristicMsg.eOrgFirstName
    frmJuristicDiplomats.txtEnglish2ndName = recvJuristicMsg.eOrg2ndName
    frmJuristicDiplomats.txtEngShortName = recvJuristicMsg.eOrgShortName
    frmJuristicDiplomats.txtOrgAlphaSearch = recvJuristicMsg.orgAlphaSearch
    
    tCode = Mid$(recvJuristicMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmJuristicDiplomats.cmbBusinessType.ListCount
            If Mid(frmJuristicDiplomats.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmJuristicDiplomats.cmbBusinessType.ListIndex = i ' RTrim(frmjuristicdiplomats.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmJuristicDiplomats.cmbBusinessType.ListIndex = -1
    End If
    If i > frmJuristicDiplomats.cmbBusinessType.ListCount Then
       frmJuristicDiplomats.cmbBusinessType.ListIndex = -1
      'frmjuristicdiplomats.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    If recvJuristicMsg.addressType = "1" Then
       frmJuristicDiplomats.optSaudiPost.Value = True
       frmJuristicDiplomats.txtSaudiPostGPSNo = Mid$(recvJuristicMsg.address1, 1, 5)
       frmJuristicDiplomats.txtSaudiPostStreetName = Mid$(recvJuristicMsg.address1, 7)
       frmJuristicDiplomats.txtSaudiPostUnit = recvJuristicMsg.poBox
       frmJuristicDiplomats.txtSaudiPostZipCode = Mid$(recvJuristicMsg.zipCode, 1, 5)
       frmJuristicDiplomats.txtSaudiPostAdditionalNo = Mid$(recvJuristicMsg.zipCode, 7)
    Else
       frmJuristicDiplomats.optPoBox.Value = True
       frmJuristicDiplomats.txtAddress1 = recvJuristicMsg.address1
       frmJuristicDiplomats.txtAddress2 = recvJuristicMsg.address2
       frmJuristicDiplomats.txtPOBox = recvJuristicMsg.poBox
       frmJuristicDiplomats.txtPinCode = recvJuristicMsg.zipCode
    
       tCode = Mid$(recvJuristicMsg.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmJuristicDiplomats.cmbCountry.ListCount
              If Mid(frmJuristicDiplomats.cmbCountry.List(i), 1, 3) = tCode Then
                 frmJuristicDiplomats.cmbCountry.ListIndex = i 'RTrim(frmjuristicdiplomats.cmbCountry.List(i))
                 Exit For
              End If
          Next i
       Else
          frmJuristicDiplomats.cmbCountry.ListIndex = -1
       End If
       If i > frmJuristicDiplomats.cmbCountry.ListCount Then
          frmJuristicDiplomats.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    frmJuristicDiplomats.cmbCity.text = recvJuristicMsg.cityName
    If Len(RTrim(recvJuristicMsg.telOffAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicDiplomats.txtOffPhoneCityCode = recvJuristicMsg.telOffAreaCode
    End If
    frmJuristicDiplomats.txtOffPhoneNo = recvJuristicMsg.telOffNo
    frmJuristicDiplomats.txtOffPhoneExt = recvJuristicMsg.telOffExt
    If Len(RTrim(recvJuristicMsg.telHomeAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicDiplomats.txtResPhoneCityCode = recvJuristicMsg.telHomeAreaCode
    End If
    frmJuristicDiplomats.txtResPhoneNo = recvJuristicMsg.telHomeNo
    frmJuristicDiplomats.txtResPhoneExt = recvJuristicMsg.telHomeExt
    If Len(RTrim(recvJuristicMsg.faxAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicDiplomats.txtFaxCityCode = recvJuristicMsg.faxAreaCode
    End If
    frmJuristicDiplomats.txtFaxNo = recvJuristicMsg.faxNo
    frmJuristicDiplomats.txtFaxExt = recvJuristicMsg.faxExt
    frmJuristicDiplomats.txtMobileAreaCode = Mid$(recvJuristicMsg.mobileNo, 1, 2)
    frmJuristicDiplomats.txtMobileNo = Mid$(recvJuristicMsg.mobileNo, 3)
    frmJuristicDiplomats.txtPagerNo = recvJuristicMsg.pagerNo
    frmJuristicDiplomats.txtEmailAddress = recvJuristicMsg.eMail
    
    frmJuristicDiplomats.cmbOpenDate = Mid$(recvJuristicMsg.custOpenDate, 7, 2)
    frmJuristicDiplomats.cmbOpenMonth = Mid$(recvJuristicMsg.custOpenDate, 5, 2)
    frmJuristicDiplomats.txtOpenYear = Mid$(recvJuristicMsg.custOpenDate, 1, 4)
    
    frmJuristicDiplomats.txtOpenBranch = recvJuristicMsg.branchOpened
    frmJuristicDiplomats.txtOpenMakerId = recvJuristicMsg.openMakerId
    frmJuristicDiplomats.txtOpenSupervisorId = recvJuristicMsg.openSupervisorId
    
    frmJuristicDiplomats.cmbUpdateDate = Mid$(recvJuristicMsg.lastUpdateDate, 7, 2)
    frmJuristicDiplomats.cmbUpdateMonth = Mid$(recvJuristicMsg.lastUpdateDate, 5, 2)
    frmJuristicDiplomats.txtUpdateYear = Mid$(recvJuristicMsg.lastUpdateDate, 1, 4)
    frmJuristicDiplomats.txtUpdateBranch = recvJuristicMsg.lastUpdateBranch
    frmJuristicDiplomats.txtUpdateMakerId = recvJuristicMsg.lastUpdateMakerId
    frmJuristicDiplomats.txtUpdateSupervisorId = recvJuristicMsg.lastUpdateSupervisorId

End Sub
Public Sub fillFrmJuristicMain()
    
    Dim tCode As String, i As Integer, mQry As String

    frmJuristicMain.txtCustomerNo = recvJuristicMsg.customerNo
    
    tCode = recvJuristicMsg.custBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmJuristicMain.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmJuristicMain.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmJuristicMain.cmbBranchCode.text = tCode & "Not defined in local"
    End If
       
    tCode = recvJuristicMsg.altBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmJuristicMain.cmbAltBrCode = tCode & "-" & rs(0)
       Else
          frmJuristicMain.cmbAltBrCode = tCode & "-" & rs(1)
       End If
    Else
       frmJuristicMain.cmbAltBrCode.text = "0000-NONE"
    End If
    
    frmJuristicMain.txtCrNo = recvJuristicMsg.crNo
    frmJuristicMain.cmbCrIssuedAt.text = recvJuristicMsg.crIssuedAt
    If recvJuristicMsg.crDateType = "0" Or _
       recvJuristicMsg.crDateType = " " Then
       frmJuristicMain.optCrDateHijri.Value = True
       frmJuristicMain.txtCrIssueYear = Mid$(recvJuristicMsg.crIssueDateH, 1, 4)
       frmJuristicMain.cmbCrIssuedate.text = Right$(recvJuristicMsg.crIssueDateH, 2)
       frmJuristicMain.cmbCrIssueMonth.text = Mid$(recvJuristicMsg.crIssueDateH, 5, 2)
       frmJuristicMain.txtCrExpiryYear = Mid$(recvJuristicMsg.crExpiryDateH, 1, 4)
       frmJuristicMain.cmbCrExpiryDate.text = Right$(recvJuristicMsg.crExpiryDateH, 2)
       frmJuristicMain.cmbCrExpiryMonth.text = Mid$(recvJuristicMsg.crExpiryDateH, 5, 2)
    Else
       frmJuristicMain.optCrDateGreg.Value = True
       frmJuristicMain.txtCrIssueYear = Mid$(recvJuristicMsg.crIssueDateG, 1, 4)
       frmJuristicMain.cmbCrIssuedate.text = Right$(recvJuristicMsg.crIssueDateG, 2)
       frmJuristicMain.cmbCrIssueMonth.text = Mid$(recvJuristicMsg.crIssueDateG, 5, 2)
       frmJuristicMain.txtCrExpiryYear = Mid$(recvJuristicMsg.crExpiryDateG, 1, 4)
       frmJuristicMain.cmbCrExpiryDate.text = Right$(recvJuristicMsg.crExpiryDateG, 2)
       frmJuristicMain.cmbCrExpiryMonth.text = Mid$(recvJuristicMsg.crExpiryDateG, 5, 2)
    End If
    
    frmJuristicMain.txtLicNo = recvJuristicMsg.licNo
    If recvJuristicMsg.licDateType = "0" Or _
       recvJuristicMsg.licDateType = " " Then
       frmJuristicMain.optLicDateHijri.Value = True
       frmJuristicMain.txtLicIssueYear = Mid$(recvJuristicMsg.licIssueDateH, 1, 4)
       frmJuristicMain.cmbLicIssueDate.text = Right$(recvJuristicMsg.licIssueDateH, 2)
       frmJuristicMain.cmbLicIssueMonth.text = Mid$(recvJuristicMsg.licIssueDateH, 5, 2)
       frmJuristicMain.txtLicExpiryYear = Mid$(recvJuristicMsg.licExpiryDateH, 1, 4)
       frmJuristicMain.cmbLicExpiryDate.text = Right$(recvJuristicMsg.licExpiryDateH, 2)
       frmJuristicMain.cmbLicExpiryMonth.text = Mid$(recvJuristicMsg.licExpiryDateH, 5, 2)
    Else
       frmJuristicMain.optLicDateGreg.Value = True
       frmJuristicMain.txtLicIssueYear = Mid$(recvJuristicMsg.licIssueDateG, 1, 4)
       frmJuristicMain.cmbLicIssueDate.text = Right$(recvJuristicMsg.licIssueDateG, 2)
       frmJuristicMain.cmbLicIssueMonth.text = Mid$(recvJuristicMsg.licIssueDateG, 5, 2)
       frmJuristicMain.txtLicExpiryYear = Mid$(recvJuristicMsg.licExpiryDateG, 1, 4)
       frmJuristicMain.cmbLicExpiryDate.text = Right$(recvJuristicMsg.licExpiryDateG, 2)
       frmJuristicMain.cmbLicExpiryMonth.text = Mid$(recvJuristicMsg.licExpiryDateG, 5, 2)
    End If
    
    frmJuristicMain.txtSamaAuthNo = recvJuristicMsg.samaAuthNo
    If recvJuristicMsg.samaAuthDateType = "0" Or _
       recvJuristicMsg.samaAuthDateType = " " Then
       frmJuristicMain.optSamaAuthDateHijri.Value = True
       frmJuristicMain.txtSamaAuthIssueYear = Mid$(recvJuristicMsg.samaAuthIssueDateH, 1, 4)
       frmJuristicMain.cmbSamaAuthIssueDate.text = Right$(recvJuristicMsg.samaAuthIssueDateH, 2)
       frmJuristicMain.cmbSamaAuthIssueMonth.text = Mid$(recvJuristicMsg.samaAuthIssueDateH, 5, 2)
       frmJuristicMain.txtSamaAuthExpiryYear = Mid$(recvJuristicMsg.samaAuthExpiryDateH, 1, 4)
       frmJuristicMain.cmbSamaAuthExpiryDate.text = Right$(recvJuristicMsg.samaAuthExpiryDateH, 2)
       frmJuristicMain.cmbSamaAuthExpiryMonth.text = Mid$(recvJuristicMsg.samaAuthExpiryDateH, 5, 2)
    Else
       frmJuristicMain.optSamaAuthDateGreg.Value = True
       frmJuristicMain.txtSamaAuthIssueYear = Mid$(recvJuristicMsg.samaAuthIssueDateG, 1, 4)
       frmJuristicMain.cmbSamaAuthIssueDate.text = Right$(recvJuristicMsg.samaAuthIssueDateG, 2)
       frmJuristicMain.cmbSamaAuthIssueMonth.text = Mid$(recvJuristicMsg.samaAuthIssueDateG, 5, 2)
       frmJuristicMain.txtSamaAuthExpiryYear = Mid$(recvJuristicMsg.samaAuthExpiryDateG, 1, 4)
       frmJuristicMain.cmbSamaAuthExpiryDate.text = Right$(recvJuristicMsg.samaAuthExpiryDateG, 2)
       frmJuristicMain.cmbSamaAuthExpiryMonth.text = Mid$(recvJuristicMsg.samaAuthExpiryDateG, 5, 2)
    End If
    
    frmJuristicMain.txtApproverNo = recvJuristicMsg.approvalRefNo
    If recvJuristicMsg.appDateType = "0" Or _
       recvJuristicMsg.appDateType = " " Then
       frmJuristicMain.optAppDateHijri.Value = True
       frmJuristicMain.txtAppIssueYear = Mid$(recvJuristicMsg.appIssueDateH, 1, 4)
       frmJuristicMain.cmbAppIssueDate.text = Right$(recvJuristicMsg.appIssueDateH, 2)
       frmJuristicMain.cmbAppIssueMonth.text = Mid$(recvJuristicMsg.appIssueDateH, 5, 2)
       frmJuristicMain.txtAppExpiryYear = Mid$(recvJuristicMsg.appExpiryDateH, 1, 4)
       frmJuristicMain.cmbAppExpiryDate.text = Right$(recvJuristicMsg.appExpiryDateH, 2)
       frmJuristicMain.cmbAppExpiryMonth.text = Mid$(recvJuristicMsg.appExpiryDateH, 5, 2)
    Else
       frmJuristicMain.optAppDateGreg.Value = True
       frmJuristicMain.txtAppIssueYear = Mid$(recvJuristicMsg.appIssueDateG, 1, 4)
       frmJuristicMain.cmbAppIssueDate.text = Right$(recvJuristicMsg.appIssueDateG, 2)
       frmJuristicMain.cmbAppIssueMonth.text = Mid$(recvJuristicMsg.appIssueDateG, 5, 2)
       frmJuristicMain.txtAppExpiryYear = Mid$(recvJuristicMsg.appExpiryDateG, 1, 4)
       frmJuristicMain.cmbAppExpiryDate.text = Right$(recvJuristicMsg.appExpiryDateG, 2)
       frmJuristicMain.cmbAppExpiryMonth.text = Mid$(recvJuristicMsg.appExpiryDateG, 5, 2)
    End If
    frmJuristicMain.txtApproverName = recvJuristicMsg.appRefName
    
    If recvJuristicMsg.langPref = "0" Or _
       recvJuristicMsg.langPref = " " Then
       frmJuristicMain.optLangArabic.Value = True
    Else
       frmJuristicMain.optLangEnglish.Value = True
    End If
         
    tCode = Mid$(recvJuristicMsg.nationality, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmJuristicMain.cmbNationality.ListCount
            If Mid(frmJuristicMain.cmbNationality.List(i), 1, 3) = tCode Then
               frmJuristicMain.cmbNationality.ListIndex = i  ' RTrim(frmjuristicmain.cmbNationality.List(i))
               Exit For
            End If
        Next i
    Else
        frmJuristicMain.cmbNationality.ListIndex = -1
    End If
    If i > frmJuristicMain.cmbNationality.ListCount Then
       frmJuristicMain.cmbNationality.ListIndex = -1
       'frmjuristicmain.cmbNationality.Text = tCode & "-Not defined in local"
    End If
    
    frmJuristicMain.txtArabFirstName = recvJuristicMsg.aOrgFirstName
    frmJuristicMain.txtArab2ndName = recvJuristicMsg.aOrg2ndName
    frmJuristicMain.txtArabShortName = recvJuristicMsg.aOrgShortName
    frmJuristicMain.txtEngFirstName = recvJuristicMsg.eOrgFirstName
    frmJuristicMain.txtEnglish2ndName = recvJuristicMsg.eOrg2ndName
    frmJuristicMain.txtEngShortName = recvJuristicMsg.eOrgShortName
    frmJuristicMain.txtOrgAlphaSearch = recvJuristicMsg.orgAlphaSearch
    
    If recvJuristicMsg.doeDateType = "0" Or _
       recvJuristicMsg.doeDateType = " " Then
       frmJuristicMain.optDOEHijri.Value = True
       frmJuristicMain.txtDoeYear = Mid$(recvJuristicMsg.doeDateH, 1, 4)
       frmJuristicMain.cmbDoeDate.text = Mid$(recvJuristicMsg.doeDateH, 7, 2)
       frmJuristicMain.cmbDoeMonth.text = Mid$(recvJuristicMsg.doeDateH, 5, 2)
    Else
       frmJuristicMain.optDOEGreg.Value = True
       frmJuristicMain.txtDoeYear = Mid$(recvJuristicMsg.doeDateG, 1, 4)
       frmJuristicMain.cmbDoeDate.text = Mid$(recvJuristicMsg.doeDateG, 7, 2)
       frmJuristicMain.cmbDoeMonth.text = Mid$(recvJuristicMsg.doeDateG, 5, 2)
    End If
    
    frmJuristicMain.txtPurposeOfAccount = recvJuristicMsg.purposeOfAccount
    frmJuristicMain.txtGovtShareholding = recvJuristicMsg.govtShareHoldingPerc
    frmJuristicMain.txtSaudiShareholding = recvJuristicMsg.saudiShareHoldingPerc
    frmJuristicMain.txtForeignShareholding = recvJuristicMsg.foreignShareHoldingPerc
    
    tCode = Mid$(recvJuristicMsg.businessType, 1, 3)
    If tCode <> "" Then
        For i = 0 To frmJuristicMain.cmbBusinessType.ListCount
            If Mid(frmJuristicMain.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmJuristicMain.cmbBusinessType.ListIndex = i ' RTrim(frmjuristicmain.cmbBusinessType.List(i))
               Exit For
            End If
        Next i
    Else
        frmJuristicMain.cmbBusinessType.ListIndex = -1
    End If
    If i > frmJuristicMain.cmbBusinessType.ListCount Then
       frmJuristicMain.cmbBusinessType.ListIndex = -1
      'frmjuristicmain.cmbBusinessType.Text = tCode & "- Not defined in local"
    End If
    If recvJuristicMsg.addressType = "1" Then
       frmJuristicMain.optSaudiPost.Value = True
       frmJuristicMain.txtSaudiPostGPSNo = Mid$(recvJuristicMsg.address1, 1, 5)
       frmJuristicMain.txtSaudiPostStreetName = Mid$(recvJuristicMsg.address1, 7)
       frmJuristicMain.txtSaudiPostUnit = recvJuristicMsg.poBox
       frmJuristicMain.txtSaudiPostZipCode = Mid$(recvJuristicMsg.zipCode, 1, 5)
       frmJuristicMain.txtSaudiPostAdditionalNo = Mid$(recvJuristicMsg.zipCode, 7)
    Else
       frmJuristicMain.optPoBox.Value = True
       frmJuristicMain.txtAddress1 = recvJuristicMsg.address1
       frmJuristicMain.txtAddress2 = recvJuristicMsg.address2
       frmJuristicMain.txtPOBox = recvJuristicMsg.poBox
       frmJuristicMain.txtPinCode = recvJuristicMsg.zipCode
    
       tCode = Mid$(recvJuristicMsg.country, 1, 3)
       If tCode <> "" Then
           For i = 0 To frmJuristicMain.cmbCountry.ListCount
               If Mid(frmJuristicMain.cmbCountry.List(i), 1, 3) = tCode Then
                  frmJuristicMain.cmbCountry.ListIndex = i 'RTrim(frmjuristicmain.cmbCountry.List(i))
                  Exit For
               End If
           Next i
       Else
           frmJuristicMain.cmbCountry.ListIndex = -1
       End If
       If i > frmJuristicMain.cmbCountry.ListCount Then
          frmJuristicMain.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    frmJuristicMain.cmbCity.text = recvJuristicMsg.cityName
    If Len(RTrim(recvJuristicMsg.telOffAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicMain.txtOffPhoneCityCode = recvJuristicMsg.telOffAreaCode
    End If
    frmJuristicMain.txtOffPhoneNo = recvJuristicMsg.telOffNo
    frmJuristicMain.txtOffPhoneExt = recvJuristicMsg.telOffExt
    If Len(RTrim(recvJuristicMsg.telHomeAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicMain.txtResPhoneCityCode = recvJuristicMsg.telHomeAreaCode
    End If
    frmJuristicMain.txtResPhoneNo = recvJuristicMsg.telHomeNo
    frmJuristicMain.txtResPhoneExt = recvJuristicMsg.telHomeExt
    If Len(RTrim(recvJuristicMsg.faxAreaCode)) <> 0 Or _
       Not updateAction Then
       frmJuristicMain.txtFaxCityCode = recvJuristicMsg.faxAreaCode
    End If
    frmJuristicMain.txtFaxNo = recvJuristicMsg.faxNo
    frmJuristicMain.txtFaxExt = recvJuristicMsg.faxExt
    frmJuristicMain.txtMobileAreaCode = Mid$(recvJuristicMsg.mobileNo, 1, 2)
    frmJuristicMain.txtMobileNo = Mid$(recvJuristicMsg.mobileNo, 3)
    frmJuristicMain.txtPagerNo = recvJuristicMsg.pagerNo
    frmJuristicMain.txtEmailAddress = recvJuristicMsg.eMail
    
    frmJuristicMain.cmbOpenDate = Mid$(recvJuristicMsg.custOpenDate, 7, 2)
    frmJuristicMain.cmbOpenMonth = Mid$(recvJuristicMsg.custOpenDate, 5, 2)
    frmJuristicMain.txtOpenYear = Mid$(recvJuristicMsg.custOpenDate, 1, 4)
    
    frmJuristicMain.txtOpenBranch = recvJuristicMsg.branchOpened
    frmJuristicMain.txtOpenMakerId = recvJuristicMsg.openMakerId
    frmJuristicMain.txtOpenSupervisorId = recvJuristicMsg.openSupervisorId
    
    frmJuristicMain.cmbUpdateDate = Mid$(recvJuristicMsg.lastUpdateDate, 7, 2)
    frmJuristicMain.cmbUpdateMonth = Mid$(recvJuristicMsg.lastUpdateDate, 5, 2)
    frmJuristicMain.txtUpdateYear = Mid$(recvJuristicMsg.lastUpdateDate, 1, 4)
    frmJuristicMain.txtUpdateBranch = recvJuristicMsg.lastUpdateBranch
    frmJuristicMain.txtUpdateMakerId = recvJuristicMsg.lastUpdateMakerId
    frmJuristicMain.txtUpdateSupervisorId = recvJuristicMsg.lastUpdateSupervisorId

End Sub

Public Sub fillFrmJuristicAcctInfo()
  Dim tCode As String
  Dim i As Integer
       
  frmJuristicAccountInfo.txtHomeAddress1 = recvJuristicMsg.homeAddress1
  frmJuristicAccountInfo.txtHomeAddress2 = recvJuristicMsg.homeAddress2
  frmJuristicAccountInfo.cmbHomeCity = recvJuristicMsg.homeCityName
  frmJuristicAccountInfo.txtHomePoBox = recvJuristicMsg.homePoBox
  frmJuristicAccountInfo.txtHomeZipCode = recvJuristicMsg.homeZipCode
  tCode = Mid$(recvJuristicMsg.homeCountry, 1, 3)
  If tCode <> "" Then
     For i = 0 To frmJuristicAccountInfo.cmbHomeCountry.ListCount
         If Mid(frmJuristicAccountInfo.cmbHomeCountry.List(i), 1, 3) = tCode Then
            frmJuristicAccountInfo.cmbHomeCountry.ListIndex = i 'RTrim(frmindividualOthers.cmbCountry.List(i))
            Exit For
         End If
     Next i
  Else
     frmJuristicAccountInfo.cmbHomeCountry.ListIndex = -1
  End If
  If i > frmJuristicAccountInfo.cmbHomeCountry.ListCount Then
     frmJuristicAccountInfo.cmbHomeCountry.text = tCode & "- Not defined in local"
  End If
  If Len(RTrim(recvJuristicMsg.homeTelOffAreaCode)) <> 0 Or _
     Not updateAction Then
     frmJuristicAccountInfo.txtHomeResPhoneCityCode = recvJuristicMsg.homeTelOffAreaCode
  End If
  frmJuristicAccountInfo.txtHomeOffPhoneNo = recvJuristicMsg.homeTelOffNo
  frmJuristicAccountInfo.txtHomeOffPhoneExt = recvJuristicMsg.homeTelOffExt
  If Len(RTrim(recvJuristicMsg.homeTelHomeAreaCode)) <> 0 Or _
     Not updateAction Then
     frmJuristicAccountInfo.txtHomeResPhoneCityCode = recvJuristicMsg.homeTelHomeAreaCode
  End If
  frmJuristicAccountInfo.txtHomeResPhoneNo = recvJuristicMsg.homeTelHomeNo
  frmJuristicAccountInfo.txtHomeResPhoneExt = recvJuristicMsg.homeTelHomeExt
  If Len(RTrim(recvJuristicMsg.homeFaxAreaCode)) <> 0 Or _
     Not updateAction Then
     frmJuristicAccountInfo.txtHomeFaxAreaCode = recvJuristicMsg.homeFaxAreaCode
  End If
  frmJuristicAccountInfo.txtHomeFaxNo = recvJuristicMsg.homeFaxNo
  frmJuristicAccountInfo.txtHomeFaxExt = recvJuristicMsg.homeFaxExt
  frmJuristicAccountInfo.txtHomeMobileAreaCode = Mid$(recvJuristicMsg.homeMobileNo, 1, 2)
  frmJuristicAccountInfo.txtHomeMobileNo = Mid$(recvJuristicMsg.homeMobileNo, 3)
  frmJuristicAccountInfo.txtHomePager = recvJuristicMsg.homePagerNo
  frmJuristicAccountInfo.txtHomeEmail = recvJuristicMsg.homeEmail
  
  documentsSelected = recvJuristicMsg.documents
  otherDocumentsEntered = recvJuristicMsg.documentOther
     
  If recvJuristicMsg.internetBankAcc = "1" Then
     frmJuristicAccountInfo.optInternetYes.Value = True
  Else
     frmJuristicAccountInfo.optInternetNo.Value = True
  End If
  
  If recvJuristicMsg.custAdviceFlag = "1" Then
     frmJuristicAccountInfo.optCustAdviceYes.Value = True
  Else
     frmJuristicAccountInfo.optCustAdviceNo.Value = True
  End If
    
  If recvJuristicMsg.signatureNature = "0" Or _
     recvJuristicMsg.signatureNature = " " Then
     frmJuristicAccountInfo.optSignSingle.Value = True
  Else
     frmJuristicAccountInfo.optSignJoint.Value = True
  End If
  
  frmJuristicAccountInfo.txtFreezingGracePeriod = Val(recvJuristicMsg.accFreezingGracePeriod)
  
  ' Current acc Info
  If Len(RTrim(recvJuristicMsg.currentAccInfo)) <> 0 Then
     If Mid$(recvJuristicMsg.currentAccInfo, 11, 1) <> "1" Then
        frmJuristicAccountInfo.optCurrentAcYes.Value = True
        tCode = Mid$(recvJuristicMsg.currentAccInfo, 1, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmJuristicAccountInfo.cmbCurrentAcCurrency.ListCount
               If Mid(frmJuristicAccountInfo.cmbCurrentAcCurrency.List(i), 1, 2) = tCode Then
                  frmJuristicAccountInfo.cmbCurrentAcCurrency.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           frmJuristicAccountInfo.cmbCurrentAcCurrency.ListIndex = -1
        End If
        If i > frmJuristicAccountInfo.cmbCurrentAcCurrency.ListCount Then
           frmJuristicAccountInfo.cmbCurrentAcCurrency.AddItem tCode & "-Not defined in local"
           frmJuristicAccountInfo.cmbCurrentAcCurrency.ListIndex = frmJuristicAccountInfo.cmbCurrentAcCurrency.ListCount - 1
        End If
        tCode = Mid$(recvJuristicMsg.currentAccInfo, 6, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmJuristicAccountInfo.cmbCurrentAcStatus.ListCount
              If Mid(frmJuristicAccountInfo.cmbCurrentAcStatus.List(i), 1, 2) = tCode Then
                 frmJuristicAccountInfo.cmbCurrentAcStatus.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmJuristicAccountInfo.cmbCurrentAcStatus.ListIndex = -1
        End If
        If i > frmJuristicAccountInfo.cmbCurrentAcStatus.ListCount Then
           frmJuristicAccountInfo.cmbCurrentAcStatus.AddItem tCode & "-Not defined in local"
           frmJuristicAccountInfo.cmbCurrentAcStatus.ListIndex = frmJuristicAccountInfo.cmbCurrentAcStatus.ListCount - 1
        End If
     
        tCode = Mid$(recvJuristicMsg.currentAccInfo, 8, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmJuristicAccountInfo.cmbCurrentAcStmtFreq.ListCount
               If Mid(frmJuristicAccountInfo.cmbCurrentAcStmtFreq.List(i), 1, 2) = tCode Then
                  frmJuristicAccountInfo.cmbCurrentAcStmtFreq.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           frmJuristicAccountInfo.cmbCurrentAcStmtFreq.ListIndex = -1
        End If
        If i > frmJuristicAccountInfo.cmbCurrentAcStmtFreq.ListCount Then
           frmJuristicAccountInfo.cmbCurrentAcStmtFreq.AddItem tCode & "-Not defined in local"
           frmJuristicAccountInfo.cmbCurrentAcStmtFreq.ListIndex = frmJuristicAccountInfo.cmbCurrentAcStmtFreq.ListCount - 1
        End If
        If Mid$(recvJuristicMsg.currentAccInfo, 10, 1) = "1" Then
           frmJuristicAccountInfo.optCurrentAcCheckBookYes.Value = True
        Else
           frmJuristicAccountInfo.optCurrentAcCheckBookNo.Value = True
        End If
    End If
  Else
     frmJuristicAccountInfo.optCurrentAcNo.Value = True
  End If
     

  ' Savings Acc info
  If Len(RTrim(recvJuristicMsg.savingsAccInfo)) <> 0 Then
     If Mid$(recvJuristicMsg.savingsAccInfo, 11, 1) <> "1" Then
        frmJuristicAccountInfo.optSavingAcYes.Value = True
        tCode = Mid$(recvJuristicMsg.savingsAccInfo, 1, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmJuristicAccountInfo.cmbSavingAcCurrency.ListCount
              If Mid(frmJuristicAccountInfo.cmbSavingAcCurrency.List(i), 1, 2) = tCode Then
                 frmJuristicAccountInfo.cmbSavingAcCurrency.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmJuristicAccountInfo.cmbSavingAcCurrency.ListIndex = -1
        End If
        If i > frmJuristicAccountInfo.cmbSavingAcCurrency.ListCount Then
           frmJuristicAccountInfo.cmbSavingAcCurrency.AddItem tCode & "-Not defined in local"
           frmJuristicAccountInfo.cmbSavingAcCurrency.ListIndex = frmJuristicAccountInfo.cmbSavingAcCurrency.ListCount - 1
        End If
        
        tCode = Mid$(recvJuristicMsg.savingsAccInfo, 6, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmJuristicAccountInfo.cmbSavingAcStatus.ListCount
              If Mid(frmJuristicAccountInfo.cmbSavingAcStatus.List(i), 1, 2) = tCode Then
                 frmJuristicAccountInfo.cmbSavingAcStatus.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmJuristicAccountInfo.cmbSavingAcStatus.ListIndex = -1
        End If
        If i > frmJuristicAccountInfo.cmbSavingAcStatus.ListCount Then
           frmJuristicAccountInfo.cmbSavingAcStatus.AddItem tCode & "-Not defined in local"
           frmJuristicAccountInfo.cmbSavingAcStatus.ListIndex = frmJuristicAccountInfo.cmbSavingAcStatus.ListCount - 1
        End If
        
        tCode = Mid$(recvJuristicMsg.savingsAccInfo, 8, 2)
        If Len(RTrim(tCode)) <> 0 Then
           For i = 0 To frmJuristicAccountInfo.cmbSavingAcStmtFreq.ListCount
              If Mid(frmJuristicAccountInfo.cmbSavingAcStmtFreq.List(i), 1, 2) = tCode Then
                 frmJuristicAccountInfo.cmbSavingAcStmtFreq.ListIndex = i
                 Exit For
              End If
           Next i
        Else
           frmJuristicAccountInfo.cmbSavingAcStmtFreq.ListIndex = -1
        End If
        If i > frmJuristicAccountInfo.cmbSavingAcStmtFreq.ListCount Then
            frmJuristicAccountInfo.cmbSavingAcStmtFreq.AddItem tCode & "-Not defined in local"
            frmJuristicAccountInfo.cmbSavingAcStmtFreq.ListIndex = frmJuristicAccountInfo.cmbSavingAcStmtFreq.ListCount - 1
        End If
    End If
  Else
     frmJuristicAccountInfo.optSavingAcNo.Value = True
  End If

  ' Other Acc Info
  If Len(RTrim(recvJuristicMsg.otherAccInfo)) <> 0 Then
     If Mid$(recvJuristicMsg.otherAccInfo, 11, 1) <> "1" Then
         tCode = Mid$(recvJuristicMsg.otherAccInfo, 3, 3)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmJuristicAccountInfo.cmbOtherAccount.ListCount
               If Mid(frmJuristicAccountInfo.cmbOtherAccount.List(i), 1, 3) = tCode Then
                  frmJuristicAccountInfo.cmbOtherAccount.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmJuristicAccountInfo.cmbOtherAccount.ListIndex = -1
         End If
         If i > frmJuristicAccountInfo.cmbOtherAccount.ListCount Then
            frmJuristicAccountInfo.cmbOtherAccount.AddItem tCode & "-Not defined in local"
            frmJuristicAccountInfo.cmbOtherAccount.ListIndex = frmJuristicAccountInfo.cmbOtherAccount.ListCount - 1
         End If
         
         tCode = Mid$(recvJuristicMsg.otherAccInfo, 1, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmJuristicAccountInfo.cmbOtherAcCurrency.ListCount
               If Mid(frmJuristicAccountInfo.cmbOtherAcCurrency.List(i), 1, 2) = tCode Then
                  frmJuristicAccountInfo.cmbOtherAcCurrency.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmJuristicAccountInfo.cmbOtherAcCurrency.ListIndex = -1
         End If
         If i > frmJuristicAccountInfo.cmbOtherAcCurrency.ListCount Then
            frmJuristicAccountInfo.cmbOtherAcCurrency.AddItem tCode & "-Not defined in local"
            frmJuristicAccountInfo.cmbOtherAcCurrency.ListIndex = frmJuristicAccountInfo.cmbOtherAcCurrency.ListCount - 1
         End If
         
         tCode = Mid$(recvJuristicMsg.otherAccInfo, 6, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmJuristicAccountInfo.cmbOtherAcStatus.ListCount
               If Mid(frmJuristicAccountInfo.cmbOtherAcStatus.List(i), 1, 2) = tCode Then
                  frmJuristicAccountInfo.cmbOtherAcStatus.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmJuristicAccountInfo.cmbOtherAcStatus.ListIndex = -1
         End If
         If i > frmJuristicAccountInfo.cmbOtherAcStatus.ListCount Then
            frmJuristicAccountInfo.cmbOtherAcStatus.AddItem tCode & "-Not defined in local"
            frmJuristicAccountInfo.cmbOtherAcStatus.ListIndex = frmJuristicAccountInfo.cmbOtherAcStatus.ListCount - 1
         End If
         
         tCode = Mid$(recvJuristicMsg.otherAccInfo, 8, 2)
         If Len(RTrim(tCode)) <> 0 Then
            For i = 0 To frmJuristicAccountInfo.cmbOtherAcStmtFreq.ListCount
               If Mid(frmJuristicAccountInfo.cmbOtherAcStmtFreq.List(i), 1, 2) = tCode Then
                  frmJuristicAccountInfo.cmbOtherAcStmtFreq.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            frmJuristicAccountInfo.cmbOtherAcStmtFreq.ListIndex = -1
         End If
         If i > frmJuristicAccountInfo.cmbOtherAcStmtFreq.ListCount Then
            frmJuristicAccountInfo.cmbOtherAcStmtFreq.AddItem tCode & "-Not defined in local"
            frmJuristicAccountInfo.cmbOtherAcStmtFreq.ListIndex = frmJuristicAccountInfo.cmbOtherAcStmtFreq.ListCount - 1
         End If
         If Mid$(recvJuristicMsg.otherAccInfo, 10, 1) = "1" Then
            frmJuristicAccountInfo.optOtherAcCheckBookYes.Value = True
         Else
            frmJuristicAccountInfo.optOtherAcCheckBookNo.Value = True
         End If
    End If
  End If
    
  If recvJuristicMsg.updatedForSama = "1" Then
     frmJuristicAccountInfo.optSamaUpdYes.Value = True
  Else
     frmJuristicAccountInfo.optSamaUpdNo.Value = True
  End If
   
  frmJuristicAccountInfo.txtRelationshipManager = recvJuristicMsg.relationshipManager
  frmJuristicAccountInfo.txtGeneralMemo = recvJuristicMsg.generalMemo
  frmJuristicAccountInfo.txtMarketingMemo = Trim(recvJuristicMsg.marketingMemo)
            
End Sub

Public Sub fillFrmBMTransDetails()

    Dim tCode As String
    Dim mQry As String
    Dim tranAmt As Double
    Dim amtToPrint As Double
    Dim tmpStr As String
    
    frmBMTransDetails.txtAcctNo = recvBmTransDetail.accNo
    frmBMTransDetails.txtCustName = recvBmTransDetail.custName
    frmBMTransDetails.txtTransRefNo = recvBmTransDetail.transRefNo
    frmBMTransDetails.cmbTransDate = Mid$(recvBmTransDetail.postDate, 7, 2)
    frmBMTransDetails.cmbTransMonth = Mid$(recvBmTransDetail.postDate, 5, 2)
    frmBMTransDetails.txtTransYear = Mid$(recvBmTransDetail.postDate, 1, 4)
    frmBMTransDetails.cmbValueDate = Mid$(recvBmTransDetail.valueDate, 7, 2)
    frmBMTransDetails.cmbValueMonth = Mid$(recvBmTransDetail.valueDate, 5, 2)
    frmBMTransDetails.txtValueYear = Mid$(recvBmTransDetail.valueDate, 1, 4)
    
    If Not IsNumeric(Right(Trim(recvBmTransDetail.transAmt), 1)) Then
       tmpStr = "-" & bmAmtToDbl(recvBmTransDetail.transAmt)
       tranAmt = CDbl(tmpStr)
    Else
       tranAmt = CDbl(recvBmTransDetail.transAmt)
    End If
    amtToPrint = tranAmt / 100
    frmBMTransDetails.txtTransAmt = Format(Format(amtToPrint, "##,###,###,###,##0.00"), _
                                                "!@@@@@@@@@@@@@@@@@")
    frmBMTransDetails.txtUserId = recvBmTransDetail.userId
    frmBMTransDetails.txtSupervisorId = recvBmTransDetail.supervisorId
    tCode = recvBmTransDetail.transType
    mQry = "select arabicname, englishname from transtypeInfo where  " & _
           "transtypeCode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          tmpStr = tCode & "-" & rs(0)
       Else
          tmpStr = tCode & "-" & rs(1)
       End If
    Else
       tmpStr = tCode & "-" & "Not defined in local"
    End If
    frmBMTransDetails.txtTransType = tmpStr
    tCode = recvBmTransDetail.stmtFlag
    mQry = "select arabicname, englishname from stmtflagInfo where  " & _
           "stmtflagCode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          tmpStr = tCode & "-" & rs(0)
       Else
          tmpStr = tCode & "-" & rs(1)
       End If
    Else
       tmpStr = tCode & "-" & "Not defined in local"
    End If
    frmBMTransDetails.txtStmtFlag = tmpStr
    frmBMTransDetails.txtNarrative1 = recvBmTransDetail.narrative1
    frmBMTransDetails.txtNarrative2 = recvBmTransDetail.narrative2
    frmBMTransDetails.txtNarrative3 = recvBmTransDetail.narrative3

End Sub

Public Sub parseBmTransDetails()
    Dim pos As Integer
    
    pos = 1
    recvBmTransDetail.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBmTransDetail.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBmTransDetail.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBmTransDetail.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBmTransDetail.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvBmTransDetail.transRefNo = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvBmTransDetail.custName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvBmTransDetail.postDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvBmTransDetail.valueDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvBmTransDetail.transAmt = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvBmTransDetail.transType = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBmTransDetail.userId = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBmTransDetail.supervisorId = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBmTransDetail.stmtFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvBmTransDetail.narrative1 = Mid$(RecvStr, pos, 25)
    pos = pos + 25
    recvBmTransDetail.narrative2 = Mid$(RecvStr, pos, 25)
    pos = pos + 25
    recvBmTransDetail.narrative3 = Mid$(RecvStr, pos, 25)
    pos = pos + 25
End Sub

Public Sub parseTpinStatusDetails()
    recvTpinStatusMsg.status = Mid$(RecvStr, 1, 3)
    recvTpinStatusMsg.service = Mid$(RecvStr, 4, 2)
    recvTpinStatusMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvTpinStatusMsg.eRemarks = Mid$(RecvStr, 56, 50)
    recvTpinStatusMsg.custNo = Mid$(RecvStr, 106, 7)
    recvTpinStatusMsg.tpinExistFlag = Mid$(RecvStr, 113, 1)
    recvTpinStatusMsg.tpinStatus = Mid$(RecvStr, 114, 1)
End Sub

Public Sub parseAcctDetailMsg()
   Dim s As String
   Dim pos As Integer
   pos = 1
    
   On Error GoTo err_handler
   s = "1"
   recvAccPendingDetail.status = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   s = "2"
   recvAccPendingDetail.service = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "3"
   recvAccPendingDetail.aRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   s = "4"
   recvAccPendingDetail.eRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   s = "5"
   recvAccPendingDetail.supervisorId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   s = "6"
   recvAccPendingDetail.newOrUpdate = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   s = "7"
   recvAccPendingDetail.accNo = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   s = "8"
   recvAccPendingDetail.accStatus = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "9"
   recvAccPendingDetail.stmtFreq = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "10"
   recvAccPendingDetail.branchCode = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   s = "11"
   recvAccPendingDetail.custName = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   s = "12"
   recvAccPendingDetail.intApplication = Trim(Mid$(RecvStr, pos, 1))
   pos = pos + 1
   s = "13"
   If Len(Trim(Mid$(RecvStr, pos, 9))) <> 0 Then
      recvAccPendingDetail.crIntRate = CLng(Trim(Mid$(RecvStr, pos, 9))) / 1000000
   End If
   pos = pos + 9
   s = "14"
   If Len(Trim(Mid$(RecvStr, pos, 9))) <> 0 Then
      recvAccPendingDetail.drIntRate = CLng(Trim(Mid$(RecvStr, pos, 9))) / 1000000
   End If
   pos = pos + 9
   s = "15"
   recvAccPendingDetail.payAccNo = Trim(Mid$(RecvStr, pos, 14))
   pos = pos + 14
   s = "16"
   recvAccPendingDetail.uniqueNo = Trim(Mid$(RecvStr, pos, 5))
   pos = pos + 5
   s = "17"
   recvAccPendingDetail.uniqueSub = Trim(Mid$(RecvStr, pos, 2))
   pos = pos + 2
   s = "18"
   recvAccPendingDetail.statementDay = Trim(Mid$(RecvStr, pos, 1))
   pos = pos + 1
   s = "19"
   recvAccPendingDetail.accOpenDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   s = "20"
   recvAccPendingDetail.lastAmendDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   s = "21"
   recvAccPendingDetail.supervisorComments = Mid$(RecvStr, pos, 200)
   pos = pos + 200
   s = "22"
   recvAccPendingDetail.intApplicationDay = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "23"
   recvAccPendingDetail.intApplicationFreq = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   s = "24"
   recvAccPendingDetail.collateral = Mid$(RecvStr, pos, 15)
   pos = pos + 15
   s = "25"
   recvAccPendingDetail.memoNote1 = Mid$(RecvStr, pos, 20)
   pos = pos + 20
   s = "26"
   recvAccPendingDetail.memoNote2 = Mid$(RecvStr, pos, 20)
   pos = pos + 20
   s = "27"
   recvAccPendingDetail.lastUpdateUser = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   s = "28"
   recvAccPendingDetail.acctDesc = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   s = "29"
   recvAccPendingDetail.initialStatus = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "30"
   recvAccPendingDetail.creditLimit = Mid$(RecvStr, pos, 12)
   pos = pos + 12
   s = "31"
   recvAccPendingDetail.dormantFlag = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   s = "32"
   recvAccPendingDetail.intLastRun = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   s = "33"
   recvAccPendingDetail.restrictedFlag = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   s = "34"
   recvAccPendingDetail.samaStatus = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "35"
   recvAccPendingDetail.accStatusChangeReason = Trim(Mid$(RecvStr, pos, 30))
   pos = pos + 30
   s = "36"
   recvAccPendingDetail.initialSamaStatus = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "37"
   recvAccPendingDetail.samaStatusChanged = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   s = "38"
   recvAccPendingDetail.keyDateTime = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   s = "39"
   recvAccPendingDetail.domantActivationUpd = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   s = "39"
   recvAccPendingDetail.lastTransDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   s = "40"
   recvAccPendingDetail.lastUpdateStDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   s = "41"
   recvAccPendingDetail.lastUpdateAppDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   s = "42"
   recvAccPendingDetail.foundInTlist = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   s = "43"
   recvAccPendingDetail.noOfRecs = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "44"
   recvAccPendingDetail.signatoryForOthers = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   s = "45"
   recvAccPendingDetail.ibanAccNo = Mid$(RecvStr, pos, 24)
   pos = pos + 24
   s = "46"
   'pos = pos + 9 ' for the filler
   pos = pos + 50 ' for the filler
   receiveSearchEngineDetails Val(recvAccPendingDetail.noOfRecs), pos
   Exit Sub
err_handler:
   LogData "Unexpected error  " & Err.Number & "  " & Err.Description & "  occured in line no : " & s & " [parseAcctDetailMsg] "
   Resume Next
End Sub

Public Sub fillAccountDetailsForm()
   Dim tCode As String, mQry As String
   Dim tCcy As String
   Dim tDecimalPlace As String
   Dim amtDenom As Integer, i As Integer
   
   frmAccount.txtCurrencyNo = Mid$(recvAccPendingDetail.accNo, 1, 2)
   frmAccount.txtMemoNo = Mid$(recvAccPendingDetail.accNo, 3, 3)
   frmAccount.txtCustNo = Mid$(recvAccPendingDetail.accNo, 6, 7)
   frmAccount.txtSubAcc = Mid$(recvAccPendingDetail.accNo, 13, 2)
   
   tCode = recvAccPendingDetail.ibanAccNo
   If Len(Trim(tCode)) > 0 And Mid$(tCode, 1, 6) <> "000000" Then
      frmAccount.txtIbanAccNo = Mid$(tCode, 1, 4) & " " & Mid$(tCode, 5, 4) & " " & _
                                Mid$(tCode, 9, 4) & " " & Mid$(tCode, 13, 4) & " " & _
                                Mid$(tCode, 17, 4) & " " & Mid$(tCode, 21, 4)
   End If
      
   frmAccount.cmdTimeDeposit.Enabled = False
   frmAccount.cmdTimeDeposit.Visible = False
   ''Modified by Mohit on 22-Feb-2007 as its not showing Time Deposit button
   ''if user wan't to see Account details & Time deposit details from Account History details option.
   ''If accSearchAction Then
   If accSearchAction Or accHistoryAction Then
      mQry = "select * from bmledgerinfo " & _
             "where ledgercode = '" & Mid$(recvAccPendingDetail.accNo, 3, 3) & _
             "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If rs("timeDepositMemo") = "1" Then
            frmAccount.cmdTimeDeposit.Enabled = True
            frmAccount.cmdTimeDeposit.Visible = True
            frmAccount.cmdTimeDeposit.Refresh
         End If
      End If
   End If
   
   frmAccount.txtAcctDesc = recvAccPendingDetail.acctDesc
   tCode = frmAccount.txtCurrencyNo
   Set rs = db.OpenRecordset("select arabicname,englishname from currencyinfo " & _
                             "where currencycode = '" & tCode & "'")

   If rs.recordCount > 0 Then
      If UserLang = ENGLISH Then
         frmAccount.txtCurrencyName = rs(1)
      Else
         frmAccount.txtCurrencyName = rs(0)
      End If
   End If
   
   tCode = recvAccPendingDetail.accStatus
   If tCode <> "" Then
      For i = 0 To frmAccount.cmbAcctStatus.ListCount
          If Mid(frmAccount.cmbAcctStatus.List(i), 1, 2) = tCode Then
             frmAccount.cmbAcctStatus.ListIndex = i
             Exit For
          End If
      Next i
   Else
     frmAccount.cmbAcctStatus.ListIndex = -1
   End If
    
   If i > frmAccount.cmbAcctStatus.ListCount Then
      frmAccount.cmbAcctStatus.AddItem tCode & "-Not defined"
      frmAccount.cmbAcctStatus.text = tCode & "-Not defined"
   End If
   
   tCode = recvAccPendingDetail.samaStatus
   If tCode <> "" Then
      For i = 0 To frmAccount.cmbSamaAccStatus.ListCount
          If Mid(frmAccount.cmbSamaAccStatus.List(i), 1, 2) = tCode Then
             frmAccount.cmbSamaAccStatus.ListIndex = i
             Exit For
          End If
      Next i
   Else
     frmAccount.cmbSamaAccStatus.ListIndex = -1
   End If
    
   If i > frmAccount.cmbSamaAccStatus.ListCount Then
      frmAccount.cmbSamaAccStatus.AddItem tCode & "-Not defined"
      frmAccount.cmbSamaAccStatus.text = tCode & "-Not defined"
   End If
   
   If Mid$(recvAccPendingDetail.accStatusChangeReason, 1, 1) <> "0" Then
      frmAccount.txtOtherReason = recvAccPendingDetail.accStatusChangeReason
      frmAccount.cmbReason.ListIndex = -1
   Else
      frmAccount.cmbReason = recvAccPendingDetail.accStatusChangeReason
   End If

   tCode = recvAccPendingDetail.stmtFreq
   If tCode <> "" Then
      For i = 0 To frmAccount.cmbStmtFreq.ListCount
          If Mid(frmAccount.cmbStmtFreq.List(i), 1, 2) = tCode Then
             frmAccount.cmbStmtFreq.ListIndex = i
             Exit For
          End If
      Next i
   Else
      frmAccount.cmbStmtFreq.ListIndex = -1
   End If
   If i > frmAccount.cmbStmtFreq.ListCount Then
      'frmAccount.cmbStmtFreq.ListIndex = -1
      frmAccount.cmbStmtFreq.AddItem tCode & "-Not defined in local"
      frmAccount.cmbStmtFreq.ListIndex = frmAccount.cmbStmtFreq.ListCount - 1
   End If
  
   tCode = recvAccPendingDetail.branchCode
   If tCode <> "" Then
      For i = 0 To frmAccount.cmbBranchCode.ListCount
          If Mid(frmAccount.cmbBranchCode.List(i), 1, 4) = tCode Then
             frmAccount.cmbBranchCode.ListIndex = i
             Exit For
          End If
      Next i
   Else
      frmAccount.cmbBranchCode.ListIndex = -1
   End If
   If i > frmAccount.cmbBranchCode.ListCount Then
      'frmAccount.cmbBranchCode.ListIndex = -1
      frmAccount.cmbBranchCode.AddItem recvAccPendingDetail.branchCode & "-not defined"
      frmAccount.cmbBranchCode.text = recvAccPendingDetail.branchCode & "-not defined"
   End If
   
   frmAccount.txtCustomerName = recvAccPendingDetail.custName
   
   frmAccount.cmbIntApplication = recvAccPendingDetail.intApplication
   mQry = "select arabicname,englishname from intappinfo " & _
          "where intappcode = '" & recvAccPendingDetail.intApplication & _
          "'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      If UserLang = ARABIC Then
         frmAccount.cmbIntApplication.text = recvAccPendingDetail.intApplication & "-" & _
                                             rs(0)
      Else
         frmAccount.cmbIntApplication.text = recvAccPendingDetail.intApplication & "-" & _
                                      rs(1)
      End If
   Else
      frmAccount.cmbIntApplication.text = recvAccPendingDetail.intApplication & "-Not defined in local"
   End If
   frmAccount.txtIntApplDay = recvAccPendingDetail.intApplicationDay
   frmAccount.txtIntFreqCode = recvAccPendingDetail.intApplicationFreq
   frmAccount.txtCrIntRate = recvAccPendingDetail.crIntRate
   frmAccount.txtDrIntRate = recvAccPendingDetail.drIntRate
   If recvAccPendingDetail.statementDay = "0" Then
      frmAccount.opt0131.Value = True
   Else
      frmAccount.opt3112.Value = True
   End If
   
   tCcy = Mid$(recvAccPendingDetail.accNo, 1, 2)
   Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                           "where currencycode = '" & tCcy & "'")

   If rs.recordCount > 0 Then
      tDecimalPlace = rs(0)
   Else
      tDecimalPlace = "2"
   End If

   If tDecimalPlace = "3" Then
      amtDenom = 1000
   ElseIf tDecimalPlace = "2" Then
      amtDenom = 100
   ElseIf tDecimalPlace = "1" Then
      amtDenom = 10
   Else
      amtDenom = 1
   End If
   If Not IsNumeric(Right(recvAccPendingDetail.intLastRun, 1)) Then
      recvAccPendingDetail.intLastRun = "-" & bmAmtToDbl(recvAccPendingDetail.intLastRun)
   End If
   
   frmAccount.txtIntLastRun = Format(Val(recvAccPendingDetail.intLastRun) / amtDenom, "##########0" + IIf(CInt(tDecimalPlace) <> 0, "." + String(CInt(tDecimalPlace), "0"), ""))

   If Not IsNumeric(Right(recvAccPendingDetail.creditLimit, 1)) Then
      recvAccPendingDetail.creditLimit = "-" & bmAmtToDbl(recvAccPendingDetail.creditLimit)
   End If
   
   frmAccount.txtCreditLimit = Val(recvAccPendingDetail.creditLimit)
   If recvAccPendingDetail.dormantFlag = "1" Then
      frmAccount.optDormantYes.Value = True
   Else
      frmAccount.optDormantNo.Value = True
   End If
   frmAccount.txtPayAcctNo = Trim(recvAccPendingDetail.payAccNo)
   frmAccount.txtUniqueNo = Trim(recvAccPendingDetail.uniqueNo)
   frmAccount.txtUniqueSub = Trim(recvAccPendingDetail.uniqueSub)
   
   frmAccount.txtCollateral = Trim(recvAccPendingDetail.collateral)
   If dormantFlag = "1" Then
      frmAccount.txtMemoNote1 = "                        "
   Else
      frmAccount.txtMemoNote1 = recvAccPendingDetail.memoNote1
   End If
   frmAccount.txtMemoNote2 = recvAccPendingDetail.memoNote2

   frmAccount.txtLastUpdateUser = recvAccPendingDetail.lastUpdateUser
   frmAccount.txtSupervisorId = recvAccPendingDetail.supervisorId
   
   frmAccount.cmbAccOpenDate = Mid$(recvAccPendingDetail.accOpenDate, 7, 2)
   frmAccount.cmbAccOpenMonth = Mid$(recvAccPendingDetail.accOpenDate, 5, 2)
   frmAccount.txtAccOpenYear = Mid$(recvAccPendingDetail.accOpenDate, 1, 4)
   
   frmAccount.cmbLastAmendDate = Mid$(recvAccPendingDetail.lastAmendDate, 7, 2)
   frmAccount.cmbLastAmendMonth = Mid$(recvAccPendingDetail.lastAmendDate, 5, 2)
   frmAccount.txtLastAmendYear = Mid$(recvAccPendingDetail.lastAmendDate, 1, 4)
   
   frmAccount.cmbLastTransDate = Mid$(recvAccPendingDetail.lastTransDate, 7, 2)
   frmAccount.cmbLastTransMonth = Mid$(recvAccPendingDetail.lastTransDate, 5, 2)
   frmAccount.txtLastTransYear = Mid$(recvAccPendingDetail.lastTransDate, 1, 4)
   
   frmAccount.cmbLastUpdCsdDate = Mid$(recvAccPendingDetail.lastUpdateStDate, 7, 2)
   frmAccount.cmbLastUpdCsdMonth = Mid$(recvAccPendingDetail.lastUpdateStDate, 5, 2)
   frmAccount.txtLastUpdCsdYear = Mid$(recvAccPendingDetail.lastUpdateStDate, 1, 4)
   
   frmAccount.cmbSupAppDate = Mid$(recvAccPendingDetail.lastUpdateAppDate, 7, 2)
   frmAccount.cmbSupAppMonth = Mid$(recvAccPendingDetail.lastUpdateAppDate, 5, 2)
   frmAccount.txtSupAppYear = Mid$(recvAccPendingDetail.lastUpdateAppDate, 1, 4)
   
End Sub
Public Sub fillAccDormantForm()
   Dim tCode As String, mQry As String
   Dim tCcy As String
   Dim tDecimalPlace As String
   Dim amtDenom As Integer
   Dim i As Integer
   
   frmAccDormant.txtCurrencyNo = Mid$(recvAccPendingDetail.accNo, 1, 2)
   frmAccDormant.txtMemoNo = Mid$(recvAccPendingDetail.accNo, 3, 3)
   frmAccDormant.txtCustNo = Mid$(recvAccPendingDetail.accNo, 6, 7)
   frmAccDormant.txtSubAcc = Mid$(recvAccPendingDetail.accNo, 13, 2)
      
   mQry = "select arabicname,englishname from bmledgerinfo " + _
          "where ledgercode = '" + Mid$(recvAccPendingDetail.accNo, 3, 3) + _
          "'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      If UserLang = ARABIC Then
         frmAccDormant.txtAcctDesc = rs(0)
      Else
         frmAccDormant.txtAcctDesc = rs(1)
      End If
   End If

   'frmAccDormant.txtAcctDesc = recvAccPendingDetail.acctDesc
   tCode = frmAccDormant.txtCurrencyNo
   Set rs = db.OpenRecordset("select arabicname,englishname from currencyinfo " + _
                             "where currencycode = '" + tCode + "'")

   If rs.recordCount > 0 Then
      If UserLang = ENGLISH Then
         frmAccDormant.txtCurrencyName = rs(1)
      Else
         frmAccDormant.txtCurrencyName = rs(0)
      End If
   End If
   
   tCode = recvAccPendingDetail.accStatus
   If tCode <> "" Then
      For i = 0 To frmAccDormant.cmbAcctStatus.ListCount
          If Mid(frmAccDormant.cmbAcctStatus.List(i), 1, 2) = tCode Then
             frmAccDormant.cmbAcctStatus.ListIndex = i
             Exit For
          End If
      Next i
   Else
     frmAccDormant.cmbAcctStatus.ListIndex = -1
   End If
    
   If i > frmAccDormant.cmbAcctStatus.ListCount Then
      frmAccDormant.cmbAcctStatus.AddItem tCode & "-Not defined"
      frmAccDormant.cmbAcctStatus.text = tCode & "-Not defined"
   End If
   
   tCode = recvAccPendingDetail.initialStatus
   If tCode <> "" Then
      For i = 0 To frmAccDormant.cmbPrevAccStatus.ListCount
          If Mid(frmAccDormant.cmbPrevAccStatus.List(i), 1, 2) = tCode Then
             frmAccDormant.cmbPrevAccStatus.ListIndex = i
             Exit For
          End If
      Next i
   Else
     frmAccDormant.cmbPrevAccStatus.ListIndex = -1
   End If
    
   If i > frmAccDormant.cmbPrevAccStatus.ListCount Then
      frmAccDormant.cmbPrevAccStatus.AddItem tCode & "-Not defined"
      frmAccDormant.cmbPrevAccStatus.text = tCode & "-Not defined"
   End If
   
   tCode = recvAccPendingDetail.branchCode
   If tCode <> "" Then
      For i = 0 To frmAccDormant.cmbBranchCode.ListCount
          If Mid(frmAccDormant.cmbBranchCode.List(i), 1, 4) = tCode Then
             frmAccDormant.cmbBranchCode.ListIndex = i
             Exit For
          End If
      Next i
   Else
      frmAccDormant.cmbBranchCode.ListIndex = -1
   End If
   If i > frmAccDormant.cmbBranchCode.ListCount Then
      frmAccDormant.cmbBranchCode.AddItem recvAccPendingDetail.branchCode & "-not defined"
      frmAccDormant.cmbBranchCode.text = recvAccPendingDetail.branchCode & "-not defined"
   End If
   
   frmAccDormant.txtCustomerName = recvAccPendingDetail.custName
   
End Sub

Public Sub parseBlockBreakupDetails()
 Dim i As Integer, pos As Integer
     
 pos = 1
 recvBlockBreakupMsg.status = Mid$(RecvStr, pos, 3)
 pos = pos + 3
 recvBlockBreakupMsg.service = Mid$(RecvStr, pos, 2)
 pos = pos + 2
 recvBlockBreakupMsg.aRemarks = Mid$(RecvStr, pos, 50)
 pos = pos + 50
 recvBlockBreakupMsg.eRemarks = Mid$(RecvStr, pos, 50)
 pos = pos + 50
 recvBlockBreakupMsg.noOfRecs = Mid$(RecvStr, pos, 2)
 pos = pos + 2
 recvBlockBreakupMsg.accNo = Mid$(RecvStr, pos, 14)
 pos = pos + 14
 recvBlockBreakupMsg.blockedBal = Mid$(RecvStr, pos, 14)
 pos = pos + 14
' recvBlockBreakupMsg.clearedBal = Mid$(RecvStr, pos, 14)
' pos = pos + 14
 pos = pos + 50 ' there is a filler for 50 characters after account number
 For i = 1 To Val(recvBlockBreakupMsg.noOfRecs)
     recvBlockBreakupMsg.details(i).productType = Mid$(RecvStr, pos, 1)
     pos = pos + 1
     recvBlockBreakupMsg.details(i).productNo = Mid$(RecvStr, pos, 20)
     pos = pos + 20
     recvBlockBreakupMsg.details(i).blockedAmt = Mid$(RecvStr, pos, 14)
     pos = pos + 14
     recvBlockBreakupMsg.details(i).userId = Mid$(RecvStr, pos, 10)
     pos = pos + 10
     pos = pos + 10 ' for the filler
Next i
End Sub

Public Sub parseSearchEngineResponse()
   Dim pos As Integer
     
   pos = 1
   recvSearchEngineMsg.status = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvSearchEngineMsg.service = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvSearchEngineMsg.aRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvSearchEngineMsg.eRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvSearchEngineMsg.foundInTlist = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvSearchEngineMsg.noOfRecs = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   pos = pos + 50 ' there is a filler for 50 characters after account number
   receiveSearchEngineDetails Val(recvSearchEngineMsg.noOfRecs), pos
End Sub

Public Sub parseCheckCustResponse()
   Dim pos As Integer

   pos = 1
   recvCheckCustMsg.status = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvCheckCustMsg.service = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvCheckCustMsg.aRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvCheckCustMsg.eRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvCheckCustMsg.foundInAList = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCheckCustMsg.foundInBList = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCheckCustMsg.foundInCList = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCheckCustMsg.reportedBank = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvCheckCustMsg.nameInABCList = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvCheckCustMsg.existingCustomer = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCheckCustMsg.existCustNo = Mid$(RecvStr, pos, 7)
   pos = pos + 7
   recvCheckCustMsg.existCustName = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvCheckCustMsg.foundInTlist = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCheckCustMsg.noOfRecs = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvCheckCustMsg.displayWarningMsg = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   pos = pos + 49 ' for the filler
   receiveSearchEngineDetails Val(recvCheckCustMsg.noOfRecs), pos
End Sub

Public Sub receiveSearchEngineDetails(noOfRecs As Integer, pos As Integer)
    Dim i As Integer
    
    For i = 1 To noOfRecs
       searchEngineDetailMsg(i).englishName = Mid$(RecvStr, pos, 35)
       pos = pos + 35
       searchEngineDetailMsg(i).arabicName = Mid$(RecvStr, pos, 35)
       pos = pos + 35
       searchEngineDetailMsg(i).idNo = Mid$(RecvStr, pos, 15)
       pos = pos + 15
       searchEngineDetailMsg(i).dobDetails = Mid$(RecvStr, pos, 20)
       pos = pos + 20
       searchEngineDetailMsg(i).placeOfBirth = Mid$(RecvStr, pos, 20)
       pos = pos + 20
       searchEngineDetailMsg(i).position = Mid$(RecvStr, pos, 20)
       pos = pos + 20
       searchEngineDetailMsg(i).miscInfo = Mid$(RecvStr, pos, 50)
       pos = pos + 50
       searchEngineDetailMsg(i).extractFlag = Mid$(RecvStr, pos, 1)
       pos = pos + 1
       searchEngineDetailMsg(i).sourceName = Mid$(RecvStr, pos, 4)
       pos = pos + 4
    Next i

End Sub

Public Sub fillSearchEngineForm(noOfRecs As Integer)

  Dim i As Integer
  For i = 1 To noOfRecs
      frmSearchEngine.searchEngineGrid.Row = i
      frmSearchEngine.searchEngineGrid.Col = 0
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignLeftCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).sourceName
      frmSearchEngine.searchEngineGrid.Col = 1
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignLeftCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).englishName
      frmSearchEngine.searchEngineGrid.Col = 2
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignRightCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).arabicName
      frmSearchEngine.searchEngineGrid.Col = 3
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignLeftCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).idNo
      frmSearchEngine.searchEngineGrid.Col = 4
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignLeftCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).dobDetails
      frmSearchEngine.searchEngineGrid.Col = 5
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignLeftCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).placeOfBirth
      frmSearchEngine.searchEngineGrid.Col = 6
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignLeftCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).position
      frmSearchEngine.searchEngineGrid.Col = 7
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignLeftCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).miscInfo
      frmSearchEngine.searchEngineGrid.Col = 8
      frmSearchEngine.searchEngineGrid.CellAlignment = flexAlignLeftCenter
      frmSearchEngine.searchEngineGrid.text = searchEngineDetailMsg(i).extractFlag
   Next i
   frmSearchEngine.searchEngineGrid.Row = 1

End Sub

Public Function checkCustomerExistance(Frm_name As Form, idType As String, idNo As String, newOrUpdate As String, custNo As String, custName As String) As Integer
     Dim strmsglen As String, tmpStr As String, abcStr As String
     Dim response
          
     tmpStr = Format(custName, "!" & String(60, "@"))
     
     SendMsg = "000000" & "48" & gBranchCode & idType & idNo & newOrUpdate & custNo & tmpStr & Space(50)
     strmsglen = Format(Len(SendMsg), "000000")
     Mid$(SendMsg, 1, 6) = strmsglen
     DataReceivedFlag = False
     
     Frm_name.MousePointer = vbHourglass
     
     ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
     If ReturnStatus = LocalCommsError Then
        LoadError = True
        Frm_name.MousePointer = vbNormal
        checkCustomerExistance = 1
        Exit Function
     End If
     Frm_name.MousePointer = vbNormal
     parseCheckCustResponse
     
     If recvCheckCustMsg.status <> "000" Then
        If UserLang = ARABIC Then
           MsgBox recvCheckCustMsg.aRemarks
        Else
           MsgBox recvCheckCustMsg.eRemarks
        End If
        checkCustomerExistance = 1
        Exit Function
     End If
     
     ' The following if statement added after giving the source to MISYS
     
     If Not updateAction And _
        Not (tellerAction And newOrUpdate = "U") Then
        If recvCheckCustMsg.foundInAList = "1" Then
           MsgBox errAListCustomer(UserLang) & recvCheckCustMsg.reportedBank & errNameAList(UserLang) & recvCheckCustMsg.nameInABCList & errOperationNotPossible(UserLang), vbCritical
           checkCustomerExistance = 1
           Exit Function
        End If
     End If
     
     If recvCheckCustMsg.foundInAList = "1" Or _
        recvCheckCustMsg.foundInBList = "1" Or _
        recvCheckCustMsg.foundInCList = "1" Then
        If UserLang = ARABIC Then
           abcStr = "«·⁄„Ì· „œ—Ã ⁄·Ï «·ﬁ«∆„… «·”Êœ«¡"
        Else
           abcStr = "Customer is found as BlackList on "
        End If
        If updateAction Or _
           (tellerAction And newOrUpdate = "U") Then
           If recvCheckCustMsg.foundInAList = "1" Then
              abcStr = abcStr & "A "
           End If
        End If
        If recvCheckCustMsg.foundInBList = "1" Then
           abcStr = abcStr & " B "
        End If
        If recvCheckCustMsg.foundInCList = "1" Then
           abcStr = abcStr & " C "
        End If
        If UserLang = ARABIC Then
           abcStr = abcStr & "„‰ ﬁ»· :" & recvCheckCustMsg.reportedBank & _
                     " «”„ «·⁄„Ì· :" & recvCheckCustMsg.nameInABCList
        Else
           abcStr = abcStr & "reported by : " & recvCheckCustMsg.reportedBank & _
                     " in the name :" & recvCheckCustMsg.nameInABCList
        End If
        MsgBox abcStr
     End If
    
     If recvCheckCustMsg.existingCustomer = "1" Then
        If UserLang = ARABIC Then
           tmpStr = "—ﬁ„ «·ÂÊÌ… „œŒ· «’·« ··⁄„Ì· :" & _
                 recvCheckCustMsg.existCustNo & "  Ê " & _
                 "«”„ «·⁄„Ì·:" & recvCheckCustMsg.existCustName
        Else
           tmpStr = "This Id number already exists for the customer #:" & _
                  recvCheckCustMsg.existCustNo & "  and " & _
                  "Customer Name :" & recvCheckCustMsg.existCustName
        End If
        If recvCheckCustMsg.displayWarningMsg = "1" Then
           MsgBox tmpStr
        Else
           MsgBox tmpStr & errOperationNotPossible(UserLang), vbCritical
           checkCustomerExistance = 1
           Exit Function
        End If
     End If
     
     If recvCheckCustMsg.foundInTlist = "1" Then
        response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
        If response = vbYes Then
           fillSearchEngineForm Val(recvCheckCustMsg.noOfRecs)
           frmSearchEngine.Show vbModal
        End If
     End If
    
     checkCustomerExistance = 0

End Function

Public Sub fillSadadDetailFrm(billRecNo As Integer)
    Dim tCode As String, tmpStr As String
    Dim mQry As String
    Dim i As Integer
    
    frmSadadDetail.txtRecordPosition = billRecNo & "/" & Val(recvBillEnqMsg.recordCount)
    
    tCode = Format(recvBillEnqMsg.billInfo(billRecNo).companyId, "!@@@@")
    If Len(RTrim(tCode)) <> 0 Then
       For i = 0 To frmSadadDetail.cmbCompanyId.ListCount
           If Mid(frmSadadDetail.cmbCompanyId.List(i), 1, 4) = tCode Then
              frmSadadDetail.cmbCompanyId.ListIndex = i
              Exit For
           End If
       Next i
    Else
       frmSadadDetail.cmbCompanyId.ListIndex = -1
    End If
    If i > frmSadadDetail.cmbCompanyId.ListCount Then
       frmSadadDetail.cmbCompanyId.ListIndex = -1
    End If

    frmSadadDetail.txtSubscriptionNo = recvBillEnqMsg.billInfo(billRecNo).billingAcct
    
    frmSadadDetail.txtBillCategory = recvBillEnqMsg.billInfo(billRecNo).billCategory
    frmSadadDetail.txtBillCycle = recvBillEnqMsg.billInfo(billRecNo).billCycle
    tCode = recvBillEnqMsg.billInfo(billRecNo).serviceType
    mQry = "select * from sadadservicetypeinfo where servicetypecode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          tmpStr = tCode & "-" & rs("arabicdescription")
       Else
          tmpStr = tCode & "-" & rs("englishdescription")
       End If
    Else
       tmpStr = tCode & "-" & "Not defined in local DB"
    End If
    
    frmSadadDetail.txtServiceType = tmpStr
    frmSadadDetail.txtBillNumber = recvBillEnqMsg.billInfo(billRecNo).billNumber
    frmSadadDetail.txtRefNo = recvBillEnqMsg.billInfo(billRecNo).billRefInfo
    frmSadadDetail.txtBillStatusCode = recvBillEnqMsg.billInfo(billRecNo).billStatusCode
    
    frmSadadDetail.txtBillAmuntDue = Format(Val(recvBillEnqMsg.billInfo(billRecNo).amountDue), "#" & _
                                            "#################0.00")
    frmSadadDetail.cmbDueDate = Mid$(recvBillEnqMsg.billInfo(billRecNo).billDueDate, 9, 2)
    frmSadadDetail.cmbDueMonth = Mid$(recvBillEnqMsg.billInfo(billRecNo).billDueDate, 6, 2)
    frmSadadDetail.txtDueYear = Mid$(recvBillEnqMsg.billInfo(billRecNo).billDueDate, 1, 4) & _
                                " " & Mid$(recvBillEnqMsg.billInfo(billRecNo).billDueDate, 11, 9)
    
    frmSadadDetail.cmbExpiryDate = Mid$(recvBillEnqMsg.billInfo(billRecNo).billExpiryDate, 9, 2)
    frmSadadDetail.cmbExpiryMonth = Mid$(recvBillEnqMsg.billInfo(billRecNo).billExpiryDate, 6, 2)
    frmSadadDetail.txtExpiryYear = Mid$(recvBillEnqMsg.billInfo(billRecNo).billExpiryDate, 1, 4) & _
                                " " & Mid$(recvBillEnqMsg.billInfo(billRecNo).billExpiryDate, 11, 9)

    If Trim(UCase(recvBillEnqMsg.billInfo(billRecNo).exactPaymentReqd)) = "TRUE" Then
       frmSadadDetail.optExactPaymentYes.Value = True
    Else
       frmSadadDetail.optExactPaymentNo.Value = True
    End If
    
    frmSadadDetail.cmbBillOpenDate = Mid$(recvBillEnqMsg.billInfo(billRecNo).billOpenDate, 9, 2)
    frmSadadDetail.cmbBillOpenMonth = Mid$(recvBillEnqMsg.billInfo(billRecNo).billOpenDate, 6, 2)
    frmSadadDetail.txtBillOpenYear = Mid$(recvBillEnqMsg.billInfo(billRecNo).billOpenDate, 1, 4) & _
                                " " & Mid$(recvBillEnqMsg.billInfo(billRecNo).billOpenDate, 11, 9)
    
    
    frmSadadDetail.cmbBillCloseDate = Mid$(recvBillEnqMsg.billInfo(billRecNo).billCloseDate, 9, 2)
    frmSadadDetail.cmbBillCloseMonth = Mid$(recvBillEnqMsg.billInfo(billRecNo).billCloseDate, 6, 2)
    frmSadadDetail.txtBillCloseYear = Mid$(recvBillEnqMsg.billInfo(billRecNo).billCloseDate, 1, 4) & _
                                " " & Mid$(recvBillEnqMsg.billInfo(billRecNo).billCloseDate, 11, 9)
    
    frmSadadDetail.txtBillCheckDigit = recvBillEnqMsg.billInfo(billRecNo).billCheckDigit
    
    frmSadadDetail.txtBillAmountPaid = Format(Val(recvBillEnqMsg.billInfo(billRecNo).currentAmount) / 100, "#" & _
                                              "#################0.00")
    
    frmSadadDetail.txtBillPaymentStatus = recvBillEnqMsg.billInfo(billRecNo).paymentStatusCode
    
    frmSadadDetail.cmbEffectiveDate = Mid$(recvBillEnqMsg.billInfo(billRecNo).effectiveDate, 9, 2)
    frmSadadDetail.cmbEffectiveMonth = Mid$(recvBillEnqMsg.billInfo(billRecNo).effectiveDate, 6, 2)
    frmSadadDetail.txtEffectiveYear = Mid$(recvBillEnqMsg.billInfo(billRecNo).effectiveDate, 1, 4) & _
                                " " & Mid$(recvBillEnqMsg.billInfo(billRecNo).effectiveDate, 11, 9)

    frmSadadDetail.txtAnbTransRefNo = recvBillEnqMsg.billInfo(billRecNo).bankPaymentId
    frmSadadDetail.txtSadadTransId = recvBillEnqMsg.billInfo(billRecNo).sadadPaymentId
    frmSadadDetail.txtMsgTxt = recvBillEnqMsg.billInfo(billRecNo).messageText
    
    frmSadadDetail.txtGeneralInfo = recvBillEnqMsg.text
    
End Sub

Public Sub parseSadadProfileEnqMsg()
    Dim pos As Long
    Dim i As Integer
    Dim recCount As Integer
    
    pos = 1
    recvSadadProfileEnqMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSadadProfileEnqMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSadadProfileEnqMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSadadProfileEnqMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSadadProfileEnqMsg.langInd = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvSadadProfileEnqMsg.queryStatusCode = Mid$(RecvStr, pos, 6)
    pos = pos + 6
    recvSadadProfileEnqMsg.customerId = Mid$(RecvStr, pos, 32)
    pos = pos + 32
    recvSadadProfileEnqMsg.customerType = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSadadProfileEnqMsg.recordCount = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    
    recCount = Val(recvSadadProfileEnqMsg.recordCount)
    If recCount > 100 Then 'max.of record is defined as 100; more than 100 will result in
                           'Run time error
       recCount = 100
    End If
    For i = 1 To recCount
        recvSadadProfileEnqMsg.details(i).isInProfile = Mid$(RecvStr, pos, 5)
        pos = pos + 5
        recvSadadProfileEnqMsg.details(i).billingAcct = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvSadadProfileEnqMsg.details(i).billerId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
    Next
End Sub

Public Sub parseSadadProfileUpdMsg()
    Dim pos As Long
    Dim i As Integer
    Dim recCount As Integer
    
    pos = 1
    recvSadadProfileUpdMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSadadProfileUpdMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSadadProfileUpdMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSadadProfileUpdMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSadadProfileUpdMsg.langInd = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvSadadProfileUpdMsg.msgStatusCode = Mid$(RecvStr, pos, 6)
    pos = pos + 6
    recvSadadProfileUpdMsg.customerId = Mid$(RecvStr, pos, 32)
    pos = pos + 32
    recvSadadProfileUpdMsg.customerType = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSadadProfileUpdMsg.recordCount = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    
    recCount = Val(recvSadadProfileUpdMsg.recordCount)
    If recCount > 100 Then 'max.of record is defined as 100; more than 100 will result in
                           'Run time error
       recCount = 100
    End If
    For i = 1 To recCount
        recvSadadProfileUpdMsg.details(i).updStatusCode = Mid$(RecvStr, pos, 6)
        pos = pos + 6
        recvSadadProfileUpdMsg.details(i).isInProfile = Mid$(RecvStr, pos, 5)
        pos = pos + 5
        recvSadadProfileUpdMsg.details(i).billingAcct = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvSadadProfileUpdMsg.details(i).billerId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
    Next
End Sub
Public Sub parseCardPendingDetail()
   Dim pos As Integer
   
   pos = 1
   
   recvCardPendingDetail.status = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvCardPendingDetail.service = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvCardPendingDetail.aRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvCardPendingDetail.eRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   recvCardPendingDetail.supervisorId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.cardNo = Mid$(RecvStr, pos, 19)
   pos = pos + 19
   recvCardPendingDetail.requestStatus = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.cardType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.newOrReplacement = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.primaryOrSupplementary = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.cardStatus = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.regionCode = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.coreAccNo = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   recvCardPendingDetail.languageCode = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.customerBranch = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvCardPendingDetail.nameOnTheCard = Mid$(RecvStr, pos, 26)
   pos = pos + 26
   recvCardPendingDetail.address1 = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvCardPendingDetail.address2 = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvCardPendingDetail.poBox = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.cityName = Mid$(RecvStr, pos, 20)
   pos = pos + 20
   recvCardPendingDetail.zipCode = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.issueDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.renewalDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.expireDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.rejectedDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.rejectedUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.rejectedReason = Mid$(RecvStr, pos, 20)
   pos = pos + 20
   recvCardPendingDetail.deactivationDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.deactivationUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.titleCode = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvCardPendingDetail.idNo = Mid$(RecvStr, pos, 15)
   pos = pos + 15
   recvCardPendingDetail.deliveryToBranchOrPO = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.pinOffSet = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvCardPendingDetail.encryptedPin = Mid$(RecvStr, pos, 5)
   pos = pos + 5
   recvCardPendingDetail.cvv = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvCardPendingDetail.pvv = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvCardPendingDetail.requestType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.pinRequestStatus = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.cardGeneratedDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.cardGeneratedUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.cBranchReceiptDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.cBranchReceiptUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.cCustIssueDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.cCustIssueUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.pinGeneratedDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.pinGeneratedUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.pBranchReceiptDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.pBranchReceiptUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.pCustIssueDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.pCustIssueUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
   recvCardPendingDetail.custNo = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvCardPendingDetail.newOrUpdate = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.supervisorComments = Mid$(RecvStr, pos, 200)
   pos = pos + 200
   recvCardPendingDetail.custName = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   recvCardPendingDetail.custCategory = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   recvCardPendingDetail.deliveryBranchCode = Mid$(RecvStr, pos, 4)
   pos = pos + 4
   recvCardPendingDetail.coreAccNo = Mid$(RecvStr, pos, 16)
   pos = pos + 16
   recvCardPendingDetail.sequenceNo = Mid$(RecvStr, pos, 10)
   pos = pos + 10
End Sub

Public Sub fillCardDetailsForm()
    Dim mQry As String, tCode As String, tmpStr As String
    Dim i As Integer

    frmCardDetails.txtCardNo = maskCardNo(recvCardPendingDetail.cardNo)
    frmCardDetails.txtFullCardNo = recvCardPendingDetail.cardNo
    frmCardDetails.txtBranchCode = recvCardPendingDetail.customerBranch
    
    frmCardDetails.txtCustNo = recvCardPendingDetail.custNo
    frmCardDetails.txtCustomerName = recvCardPendingDetail.custName
    
    If recvCardPendingDetail.primaryOrSupplementary = "P" Then
       frmCardDetails.optPrimary.Value = True
    Else
       frmCardDetails.optSupp.Value = True
    End If
    
    If recvCardPendingDetail.cardType = "R" Then
       frmCardDetails.optElectron.Value = True
    ElseIf recvCardPendingDetail.cardType = "I" Or _
           recvCardPendingDetail.cardType = "V" Then
       frmCardDetails.optElectronIntl.Value = True
    ElseIf recvCardPendingDetail.cardType = "S" Then
       frmCardDetails.optIntlChip.Value = True
    ElseIf recvCardPendingDetail.cardType = "L" Then
       frmCardDetails.optLocalChip.Value = True
    ElseIf recvCardPendingDetail.cardType = "C" Then
       frmCardDetails.optPayroll.Value = True
    Else
       frmCardDetails.optAdmin.Value = True
    End If
    
'    If recvCardPendingDetail.cardType = "C" Then
'       If Mid$(recvCardPendingDetail.cardNo, 1, 6) = "455036" Then
'          frmCardDetails.optElectronIntl.Value = True
'       Else
'          frmCardDetails.optElectron.Value = True
'       End If
'    End If
    If recvCardPendingDetail.newOrReplacement = "R" Then
       frmCardDetails.optReplacement.Value = True
    Else
       frmCardDetails.optNew.Value = True
    End If
    
    If recvCardPendingDetail.custCategory = "V" Then
       frmCardDetails.optVip.Value = True
    ElseIf recvCardPendingDetail.custCategory = "P" Then
       frmCardDetails.optPension.Value = True
    ElseIf recvCardPendingDetail.custCategory = "K" Then
       frmCardDetails.optPackage.Value = True
    ElseIf recvCardPendingDetail.custCategory = "C" Then
    ElseIf recvCardPendingDetail.custCategory = "C" Then
       frmCardDetails.optCPS.Value = True
    End If
    
    frmCardDetails.txtNameOnCard = _
                recvCardPendingDetail.nameOnTheCard
    frmCardDetails.txtCurrency = Mid$(recvCardPendingDetail.coreAccNo, 1, 2)
    tCode = Mid$(recvCardPendingDetail.coreAccNo, 3, 2)
    mQry = "select arabicname, englishname from cbsLedgerInfo " & _
           "where ledgerCode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          tmpStr = tCode & " - " & rs(0)
       Else
          tmpStr = tCode & " - " & rs(1)
       End If
    Else
       tmpStr = tCode & "-Not defined in local   "
    End If
    
    frmCardDetails.cmbLedger = tmpStr
    frmCardDetails.txtCustomerNo = Mid$(recvCardPendingDetail.coreAccNo, 5, 8)
    'frmCardDetails.txtAcctNo = Mid$(recvCardPendingDetail.bmAccNo, 1, 12)
    frmCardDetails.txtSubAcc = RTrim(Mid$(recvCardPendingDetail.coreAccNo, 13, 4))
    If recvCardPendingDetail.languageCode = "0" Then
        frmCardDetails.optArabic.Value = True
    ElseIf recvCardPendingDetail.languageCode = "1" Then
        frmCardDetails.optEnglish.Value = True
    Else
        frmCardDetails.optEngArabic.Value = True
    End If
    
    If recvCardPendingDetail.deliveryToBranchOrPO = "C" Then
       frmCardDetails.optBranch.Value = True
    ElseIf recvCardPendingDetail.deliveryToBranchOrPO = "R" Or _
           recvCardPendingDetail.deliveryToBranchOrPO = "B" Then
        frmCardDetails.optReqBranch.Value = True
    ElseIf recvCardPendingDetail.deliveryToBranchOrPO = "P" Then
        frmCardDetails.optPoBox.Value = True
    Else
        frmCardDetails.optGPS.Value = True
    End If
    frmCardDetails.txtDeliveryAddr2 = _
                         recvCardPendingDetail.address2
    frmCardDetails.cmbDeliveryCity = _
                         recvCardPendingDetail.cityName
    If recvCardPendingDetail.deliveryToBranchOrPO <> "G" Then
       frmCardDetails.txtDeliveryAddr1 = _
                         recvCardPendingDetail.address1
       frmCardDetails.txtDeliveryPOBox = _
                         recvCardPendingDetail.poBox
       frmCardDetails.txtDeliveryZipcode = _
                     recvCardPendingDetail.zipCode
    Else
       frmCardDetails.txtGPSNo = _
                         Mid$(recvCardPendingDetail.address1, 1, 5)
       frmCardDetails.txtGPSStreetName = _
                         Mid$(recvCardPendingDetail.address1, 7)
       frmCardDetails.txtGPSUnit = _
                         recvCardPendingDetail.poBox
       frmCardDetails.txtGPSZipCode = _
                     Mid$(recvCardPendingDetail.zipCode, 1, 5)
       frmCardDetails.txtGPSAdditionalNo = _
                     Mid$(recvCardPendingDetail.zipCode, 7)
   End If
    
    tCode = recvCardPendingDetail.requestStatus
    mQry = "select arabicname, englishname from requeststatusinfo " & _
           "where requeststatus = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          tmpStr = tCode & " - " & rs(0)
       Else
          tmpStr = tCode & " - " & rs(1)
       End If
    Else
       tmpStr = tCode & "-Not defined in local   "
    End If
    
    frmCardDetails.txtCardGenerationStatus = tmpStr
    
    tCode = recvCardPendingDetail.pinRequestStatus
    mQry = "select arabicname, englishname from pinrequeststatusinfo " & _
           "where pinrequeststatus = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          tmpStr = tCode & " - " & rs(0)
       Else
          tmpStr = tCode & " - " & rs(1)
       End If
    Else
       tmpStr = tCode & "-Not defined in local   "
    End If
    
    frmCardDetails.txtPinGenerationStatus = tmpStr
    
    tCode = recvCardPendingDetail.cardStatus
    mQry = "select arabicname, englishname from cardstatusinfo " & _
           "where cardstatus = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          tmpStr = tCode & " - " & rs(0)
       Else
          tmpStr = tCode & " - " & rs(1)
       End If
    Else
       tmpStr = tCode & "-Not defined in local    "
    End If

    frmCardDetails.cmbCardStatus.text = tmpStr
    
    frmCardDetails.cmbIssuedate = _
                Mid$(recvCardPendingDetail.issueDate, 7, 2)
    frmCardDetails.cmbIssueMonth = _
                Mid$(recvCardPendingDetail.issueDate, 5, 2)
    frmCardDetails.txtIssueYear = Mid$(recvCardPendingDetail.issueDate, 1, 4)
    
    frmCardDetails.cmbExpiryDate = _
                Mid$(recvCardPendingDetail.expireDate, 7, 2)
    frmCardDetails.cmbExpiryMonth = _
                Mid$(recvCardPendingDetail.expireDate, 5, 2)
    frmCardDetails.txtExpiryYear = Mid$(recvCardPendingDetail.expireDate, 1, 4)
    
    If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4" Then
       frmCardDetails.cmdActivate.Caption = frmCardDetailsCaption(30, UserLang)   '"Deactivate"
    Else
       frmCardDetails.cmdActivate.Caption = frmCardDetailsCaption(31, UserLang)   '"Activate"
    End If
    
    If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "5" Then
       frmCardDetails.cmdRestrict.Caption = frmCardDetailsCaption(46, UserLang) ' Restrict
    Else
       frmCardDetails.cmdRestrict.Caption = frmCardDetailsCaption(47, UserLang) ' Unrestrict
    End If
End Sub

Public Sub parseCardUpdateHistoryDetails()
Dim i As Integer, pos As Integer
     pos = 1
     
     recvCardUpdateHistMsg.status = Mid$(RecvStr, pos, 3)
     pos = pos + 3
     recvCardUpdateHistMsg.service = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvCardUpdateHistMsg.aRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     recvCardUpdateHistMsg.eRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     recvCardUpdateHistMsg.lastRecCount = Mid$(RecvStr, pos, 5)
     pos = pos + 5
     recvCardUpdateHistMsg.noOfRecs = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvCardUpdateHistMsg.cardNo = Mid$(RecvStr, pos, 19)
     pos = pos + 19
     recvCardUpdateHistMsg.filler = Mid$(RecvStr, pos, 10)
     pos = pos + 10
     For i = 1 To Val(recvCardUpdateHistMsg.noOfRecs)
         recvCardUpdateHistMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
         pos = pos + 4
         recvCardUpdateHistMsg.details(i).userId = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvCardUpdateHistMsg.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvCardUpdateHistMsg.details(i).pendingStatus = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvCardUpdateHistMsg.details(i).supervisorId = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvCardUpdateHistMsg.details(i).approvedDateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvCardUpdateHistMsg.details(i).requestType = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         pos = pos + 10  ' for the filler
    Next i
End Sub

Public Sub formatSadadProfileMsg(idType As String, idNo As String, action As String)

    sadadProfileMsg.msgLen = "000000"
    sadadProfileMsg.service = "95"
    sadadProfileMsg.homeBranch = gBranchCode
    sadadProfileMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    sadadProfileMsg.langInd = "en-gb"
    If UserLang = ARABIC Then
       sadadProfileMsg.langInd = "ar-sa"
    Else
       sadadProfileMsg.langInd = "en-gb"
    End If
    sadadProfileMsg.idType = idType
    'sadadProfileMsg.idNo = Format(txtIdNumber, "!@@@@@@@@@@@@@@@")
    sadadProfileMsg.idNo = idNo
    sadadProfileMsg.action = action
    sadadProfileMsg.recordCount = "000"

End Sub

Public Sub parseMailDetailResponse()
 Dim pos As Integer
     
 pos = 1
 recvMailDetailMsg.status = Mid$(RecvStr, pos, 3)
 pos = pos + 3
 recvMailDetailMsg.service = Mid$(RecvStr, pos, 2)
 pos = pos + 2
 recvMailDetailMsg.aRemarks = Mid$(RecvStr, pos, 50)
 pos = pos + 50
 recvMailDetailMsg.eRemarks = Mid$(RecvStr, pos, 50)
 pos = pos + 50
 recvMailDetailMsg.refNo = Mid$(RecvStr, pos, 16)
 pos = pos + 16
 recvMailDetailMsg.custNo = Mid$(RecvStr, pos, 7)
 pos = pos + 7
 recvMailDetailMsg.productId = Mid$(RecvStr, pos, 20)
 pos = pos + 20
 recvMailDetailMsg.custName = Mid$(RecvStr, pos, 30)
 pos = pos + 30
 recvMailDetailMsg.custSegmentFlag = Mid$(RecvStr, pos, 1)
 pos = pos + 1
 recvMailDetailMsg.address1 = Mid$(RecvStr, pos, 30)
 pos = pos + 30
 recvMailDetailMsg.poBox = Mid$(RecvStr, pos, 10)
 pos = pos + 10
 recvMailDetailMsg.cityName = Mid$(RecvStr, pos, 20)
 pos = pos + 20
 recvMailDetailMsg.zipCode = Mid$(RecvStr, pos, 10)
 pos = pos + 10
 recvMailDetailMsg.offTelNo = Mid$(RecvStr, pos, 20)
 pos = pos + 20
 recvMailDetailMsg.homeTelNo = Mid$(RecvStr, pos, 20)
 pos = pos + 20
 recvMailDetailMsg.faxNo = Mid$(RecvStr, pos, 20)
 pos = pos + 20
 recvMailDetailMsg.mobileNo = Mid$(RecvStr, pos, 10)
 pos = pos + 10
 recvMailDetailMsg.emailAddr = Mid$(RecvStr, pos, 30)
 pos = pos + 30
 recvMailDetailMsg.dateGenerated = Mid$(RecvStr, pos, 8)
 pos = pos + 8
 recvMailDetailMsg.branchCode = Mid$(RecvStr, pos, 4)
 pos = pos + 4
 recvMailDetailMsg.returnedDate = Mid$(RecvStr, pos, 8)
 pos = pos + 8
 recvMailDetailMsg.registeredUser = Mid$(RecvStr, pos, 10)
 pos = pos + 10
 recvMailDetailMsg.registeredBranch = Mid$(RecvStr, pos, 4)
 pos = pos + 4
 recvMailDetailMsg.returnedReason = Mid$(RecvStr, pos, 1)
 pos = pos + 1
 recvMailDetailMsg.verificationActionDate = Mid$(RecvStr, pos, 8)
 pos = pos + 8
 recvMailDetailMsg.verificationActionUser = Mid$(RecvStr, pos, 10)
 pos = pos + 10
 recvMailDetailMsg.verificationActionBranch = Mid$(RecvStr, pos, 4)
 pos = pos + 4
 recvMailDetailMsg.verificationActionTaken = Mid$(RecvStr, pos, 1)
 pos = pos + 1
 recvMailDetailMsg.verificationUserRemarks = Mid$(RecvStr, pos, 75)
 pos = pos + 75
 recvMailDetailMsg.callCentreActionDate = Mid$(RecvStr, pos, 8)
 pos = pos + 8
 recvMailDetailMsg.callCentreActionUser = Mid$(RecvStr, pos, 10)
 pos = pos + 10
 recvMailDetailMsg.callCentreActionBranch = Mid$(RecvStr, pos, 4)
 pos = pos + 4
 recvMailDetailMsg.callCentreActionTaken = Mid$(RecvStr, pos, 1)
 pos = pos + 1
 recvMailDetailMsg.callCentreUserRemarks = Mid$(RecvStr, pos, 75)
 pos = pos + 75
 recvMailDetailMsg.deliveryDate = Mid$(RecvStr, pos, 8)
 pos = pos + 8
 recvMailDetailMsg.deliveryUser = Mid$(RecvStr, pos, 10)
 pos = pos + 10
 recvMailDetailMsg.deliveryBranch = Mid$(RecvStr, pos, 4)
 pos = pos + 4
 recvMailDetailMsg.deliveryActionTaken = Mid$(RecvStr, pos, 1)
 pos = pos + 1
 recvMailDetailMsg.deliveredToCustomer = Mid$(RecvStr, pos, 1)
 pos = pos + 1
 recvMailDetailMsg.deliveryUserRemarks = Mid$(RecvStr, pos, 75)
 pos = pos + 75
 recvMailDetailMsg.prevOccur = Mid$(RecvStr, pos, 3)
 pos = pos + 3
End Sub

Public Sub fillMailDetailForm()
    Dim tCode As String
    Dim i As Integer
    Dim mQry As String, tmpStr As String

    frmMailDetail.txtRefNo = Trim(recvMailDetailMsg.refNo)
    frmMailDetail.txtProductId = Trim(recvMailDetailMsg.productId)
    frmMailDetail.txtCustNo = Trim(recvMailDetailMsg.custNo)
    frmMailDetail.txtCustomerName = Trim(recvMailDetailMsg.custName)
    tCode = recvMailDetailMsg.custSegmentFlag
    If Len(Trim(tCode)) = 0 Then
       tCode = "0"
    End If
    For i = 0 To frmMailDetail.cmbSegmentType.ListCount
        If Mid(frmMailDetail.cmbSegmentType.List(i), 1, 1) = tCode Then
           frmMailDetail.cmbSegmentType.ListIndex = i
           Exit For
        End If
    Next i
    If i > frmMailDetail.cmbSegmentType.ListCount Then
       frmMailDetail.cmbSegmentType.text = tCode & "- Not defined in local"
    End If
    tCode = Mid$(recvMailDetailMsg.refNo, 9, 1)
    mQry = "select arabicname, englishname from lettertypeinfo " & _
           "where lettertypecode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          tmpStr = tCode & " - " & rs(0)
       Else
          tmpStr = tCode & " - " & rs(1)
       End If
    Else
       tmpStr = tCode & "-Not defined in local   "
    End If
    frmMailDetail.txtMailType = tmpStr
    
    'frmMailDetail.txtMailType = recvMailDetailMsg.letterTypeDesc
    
    frmMailDetail.txtAddress1 = Trim(recvMailDetailMsg.address1)
    frmMailDetail.txtPOBox = Trim(recvMailDetailMsg.poBox)
    frmMailDetail.cmbCity = Trim(recvMailDetailMsg.cityName)
    frmMailDetail.txtZipCode = Trim(recvMailDetailMsg.zipCode)
    frmMailDetail.cmbDespatchDate = Mid$(recvMailDetailMsg.dateGenerated, 7, 2)
    frmMailDetail.cmbDespathMonth = Mid$(recvMailDetailMsg.dateGenerated, 5, 2)
    frmMailDetail.txtDespatchYear = Mid$(recvMailDetailMsg.dateGenerated, 1, 4)
    frmMailDetail.txtBranchCode = recvMailDetailMsg.branchCode
    frmMailDetail.txtPrevOcc = Format(recvMailDetailMsg.prevOccur, "###")
    
    frmMailDetail.txtOfficeTelNo = recvMailDetailMsg.offTelNo
    frmMailDetail.txtHomeTelNo = recvMailDetailMsg.homeTelNo
    frmMailDetail.txtFaxNo = recvMailDetailMsg.faxNo
    frmMailDetail.txtMobileNo = recvMailDetailMsg.mobileNo
    frmMailDetail.txtEmailAddr = recvMailDetailMsg.emailAddr
    
    frmMailDetail.cmbReturnDate = Mid$(recvMailDetailMsg.returnedDate, 7, 2)
    frmMailDetail.cmbReturnMonth = Mid$(recvMailDetailMsg.returnedDate, 5, 2)
    frmMailDetail.txtReturnYear = Mid$(recvMailDetailMsg.returnedDate, 1, 4)
    
    frmMailDetail.txtRegisteredUser = Trim(recvMailDetailMsg.registeredUser)
    frmMailDetail.txtRegisteredBranch = Trim(recvMailDetailMsg.registeredBranch)
    frmMailDetail.cmbReturnedReason.text = " "
    tCode = recvMailDetailMsg.returnedReason
    If Len(Trim(tCode)) <> 0 Then
       For i = 0 To frmMailDetail.cmbReturnedReason.ListCount
           If Mid(frmMailDetail.cmbReturnedReason.List(i), 1, 1) = tCode Then
              frmMailDetail.cmbReturnedReason.ListIndex = i
              Exit For
           End If
       Next i
       If i > frmMailDetail.cmbReturnedReason.ListCount Then
          frmMailDetail.cmbReturnedReason.text = tCode & "- Not defined in local"
       End If
    End If
        
    frmMailDetail.cmbMandateActionDate = Mid$(recvMailDetailMsg.verificationActionDate, 7, 2)
    frmMailDetail.cmbMandateActionMonth = Mid$(recvMailDetailMsg.verificationActionDate, 5, 2)
    frmMailDetail.txtMandateActionYear = Mid$(recvMailDetailMsg.verificationActionDate, 1, 4)
    
    frmMailDetail.txtMandateUser = Trim(recvMailDetailMsg.verificationActionUser)
    frmMailDetail.txtMandateBrCode = Trim(recvMailDetailMsg.verificationActionBranch)
    frmMailDetail.cmbMandateStatus = " "
    frmMailDetail.cmbCallCentreStatus = " "
    frmMailDetail.cmbBranchStatus = " "
    tCode = recvMailDetailMsg.verificationActionTaken
    If Len(RTrim(tCode)) <> 0 Then
       If tCode = "0" Then
          frmMailDetail.cmbMandateStatus = tCode & "-" & errPending(UserLang)  '"Pending"
       ElseIf tCode = "1" Then
          frmMailDetail.cmbMandateStatus = tCode & "-" & errAddrUpd(UserLang) '"Address Updated"
       ElseIf tCode = "2" Then
          frmMailDetail.cmbMandateStatus = tCode & "-" & errAddrNotUpd(UserLang) '"Address not updated"
       Else
          frmMailDetail.cmbMandateStatus = tCode & "-" & errUnknown(UserLang) '"Unknown"
       End If
    End If
    frmMailDetail.txtAddrVerifyRemarks = Trim(recvMailDetailMsg.verificationUserRemarks)
    
    frmMailDetail.cmbCallCentreActionDate = Mid$(recvMailDetailMsg.callCentreActionDate, 7, 2)
    frmMailDetail.cmbCallCentreActionMonth = Mid$(recvMailDetailMsg.callCentreActionDate, 5, 2)
    frmMailDetail.txtCallCentreActionYear = Mid$(recvMailDetailMsg.callCentreActionDate, 1, 4)
    
    frmMailDetail.txtCallCentreActionUser = Trim(recvMailDetailMsg.callCentreActionUser)
    frmMailDetail.txtCallCentreBrCode = Trim(recvMailDetailMsg.callCentreActionBranch)
    tCode = recvMailDetailMsg.callCentreActionTaken
    If Len(RTrim(tCode)) <> 0 Then
       If tCode = "0" Then
          frmMailDetail.cmbCallCentreStatus = tCode & "-" & errPending(UserLang) '"Pending"
       ElseIf tCode = "1" Then
          frmMailDetail.cmbCallCentreStatus = tCode & "-" & errAddrUpd(UserLang) '"Address Updated"
       ElseIf tCode = "9" Then
          frmMailDetail.cmbCallCentreStatus = tCode & "-" & errAddrNotUpd(UserLang) '"Address not Updated"
       ElseIf tCode = "3" Then
          frmMailDetail.cmbCallCentreStatus = tCode & "-" & errCustNoReachable(UserLang) '"Customer not reachable"
       Else
          frmMailDetail.cmbCallCentreStatus = tCode & "-" & errUnknown(UserLang) '"Unknown"
       End If
    End If
    frmMailDetail.txtCallCentreRemarks = Trim(recvMailDetailMsg.callCentreUserRemarks)
    
    frmMailDetail.cmbBranchActionDate = Mid$(recvMailDetailMsg.deliveryDate, 7, 2)
    frmMailDetail.cmbBranchActionMonth = Mid$(recvMailDetailMsg.deliveryDate, 5, 2)
    frmMailDetail.txtBranchActionYear = Mid$(recvMailDetailMsg.deliveryDate, 1, 4)
    
    frmMailDetail.txtBranchActionUser = Trim(recvMailDetailMsg.deliveryUser)
    frmMailDetail.txtBranchBrCode = Trim(recvMailDetailMsg.deliveryBranch)
    tCode = recvMailDetailMsg.deliveryActionTaken
    If Len(RTrim(tCode)) <> 0 Then
       If tCode = "0" Then
          frmMailDetail.cmbBranchStatus = tCode & "-" & errPending(UserLang) '"Pending"
       ElseIf tCode = "1" Then
          frmMailDetail.cmbBranchStatus = tCode & "-" & errAddrUpd(UserLang) '"Address updated"
       ElseIf tCode = "9" Then
          frmMailDetail.cmbBranchStatus = tCode & "-" & errAddrNotUpd(UserLang) '"Address not updated"
       ElseIf tCode = "3" Then
          frmMailDetail.cmbBranchStatus = tCode & "-" & errStmtDisabled(UserLang) '"Statement disabled"
       Else
          frmMailDetail.cmbBranchStatus = tCode & "-" & errUnknown(UserLang) '"Unknown"
       End If
    End If
    If recvMailDetailMsg.deliveredToCustomer = "1" Then
       frmMailDetail.optDeliveredToCustYES = True
    Else
       frmMailDetail.optDeliveredToCustNO = True
    End If
    
    frmMailDetail.txtBranchRemarks = Trim(recvMailDetailMsg.deliveryUserRemarks)
    
End Sub

Public Sub printIndividualApplnForm()
    Dim i As Integer
    Dim applnFile As String
    Dim applnLang As Integer
    Dim strmsglen As String
    Dim tmpStr As String
    Dim tCode As String
    Dim response
    Dim fso As FileSystemObject
    Dim page As Integer
    Dim lines As Integer
    Dim textStream As Object
    Dim fsys As Object
    Dim langChar As String
    Dim aFirstName As String, a2ndName As String, a3rdName, aLastName As String
    Dim eFirstName As String, e2ndName As String, e3rdName, eLastName As String
    Dim idNumber As String, passportNo As String
    Dim issueDate As String, issuedAt As String, expiryDate As String
    Dim tmpStr1 As String, tmpStr2 As String, tmpStr3 As String, tmpStr4 As String
    Dim tmpStr5 As String, tmpStr6 As String, tmpStr7 As String, tmpStr8 As String
    Dim tmpStr9 As String, tmpStr10 As String
    
    Set fsys = CreateObject("scripting.filesystemobject")
'
    Set fso = CreateObject("Scripting.FileSystemObject")
'    If (Not fso.FolderExists("c:\csdApplicationForms")) Then
'       fso.CreateFolder ("c:\csdApplicationForms")
'    End If
'
'    applnFile = "c:\csdApplicationForms\appln." & frmIndividualSaudi.txtCustomerNo
'
'    Set textStream = fsys.CreateTextFile(applnFile, True)
    If screenSetNo = "1" Or screenSetNo = "A" Then
       If frmIndividualSaudi.optLangArabic Then
          applnLang = 0 ' Arabic
       Else
          applnLang = 1 ' for english
       End If
    ElseIf screenSetNo = "2" Then
       If frmIndividualOthers.optLangArabic Then
          applnLang = 0 ' Arabic
       Else
          applnLang = 1 ' for english
       End If
    End If
    
    If applnLang = 0 Then
       langChar = Chr$(254) ' for arabic
       Printer.RightToLeft = True ' for arabic
    Else
       langChar = Chr$(253) ' for english
       Printer.RightToLeft = False ' for english
    End If
           
    'Printer.Orientation = vbPRORLandscape   ' for landscape
    Printer.Orientation = vbPRORPortrait
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 10
'    Printer.PaperSize = vbPRPSA4   'for A4
    Printer.CurrentX = 0
    Printer.CurrentY = 0
    
'    ' RAJESH TEST BEGINS

'       Printer.PaintPicture frmLogin.anbLogo, 2500, 150
'   For i = 1 To 4
'       'Printer.Print vbCrLf
'       Printer.Print
'   Next
'   lines = 4
'   Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
'
'   Printer.FontBold = True
'   Printer.Print appCurrentAccTerms(applnLang)
'   Printer.FontBold = False
'   Printer.Print String(80, "-")
'   Printer.Print
'   Printer.FontSize = 10
'   On Error GoTo err_handler
'   If applnLang = ENGLISH Then
'      tmpStr10 = App.Path & "\Current_Acc_eng.txt"
'   Else
'      tmpStr10 = App.Path & "\Current_Acc_arb.txt"
'   End If
'   tCode = "0"
'   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)
'
'   tmpStr = ""
'   If tCode = "0" Then
'      While textStream.AtEndOfStream = False
'          tmpStr = textStream.ReadLine
'          Printer.Print tmpStr & langChar
'      Wend
'      textStream.Close
'   End If
'   Printer.Print
'   Printer.Print
'
'   Printer.Print String(80, "-")
'   Printer.FontBold = True
'   Printer.Print appSavingAccTerms(applnLang)
'   Printer.FontBold = False
'   Printer.Print String(80, "-")
'   Printer.Print
'   Printer.FontSize = 10
'   On Error GoTo err_handler
'   If applnLang = ENGLISH Then
'      tmpStr10 = App.Path & "\saving_Acc_eng.txt"
'   Else
'      tmpStr10 = App.Path & "\saving_Acc_arb.txt"
'   End If
'   tCode = "0"
'   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)
'
'   tmpStr = ""
'   If tCode = "0" Then
'      While textStream.AtEndOfStream = False
'          tmpStr = textStream.ReadLine
'          Printer.Print tmpStr & langChar
'      Wend
'      textStream.Close
'   End If
'   Printer.Print
'   Printer.Print
'
'    Printer.FontBold = True
'   Printer.Print appAtmCardTerms(applnLang)
'   Printer.FontBold = False
'   Printer.Print String(80, "-")
'   Printer.Print
'   Printer.FontSize = 10
'   On Error GoTo err_handler
'   If applnLang = ENGLISH Then
'      tmpStr10 = App.Path & "\cardTerms_eng.txt"
'   Else
'      tmpStr10 = App.Path & "\cardTerms_arb.txt"
'   End If
'   tCode = "0"
'   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)
'
'   tmpStr = ""
'   If tCode = "0" Then
'      While textStream.AtEndOfStream = False
'          tmpStr = textStream.ReadLine
'          Printer.Print tmpStr & langChar
'      Wend
'      textStream.Close
'   End If
'   Printer.Print
'   Printer.Print
'   Printer.NewPage
'   page = page + 1
'   Printer.PaintPicture frmLogin.anbLogo, 2500, 150
'   For i = 1 To 4
'       'Printer.Print vbCrLf
'       Printer.Print
'   Next
'   lines = 4
'   Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
'
'   Printer.FontBold = True
'   Printer.Print appHatifAlArabiTerms(applnLang)
'   Printer.FontBold = False
'   Printer.Print String(80, "-")
'   Printer.Print
'   Printer.FontSize = 10
'   On Error GoTo err_handler
'   If applnLang = ENGLISH Then
'      tmpStr10 = App.Path & "\phone_terms_eng.txt"
'   Else
'      tmpStr10 = App.Path & "\phone_terms_arb.txt"
'   End If
'   tCode = "0"
'   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)
'
'   tmpStr = ""
'   If tCode = "0" Then
'      While textStream.AtEndOfStream = False
'          tmpStr = textStream.ReadLine
'          Printer.Print tmpStr & langChar
'      Wend
'      textStream.Close
'   End If
'   Printer.Print
'   Printer.EndDoc
'   Exit Sub

'    ' RAJESH TEST END

    'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
    Printer.PaintPicture frmLogin.anbLogo1, 50, 200
    For i = 1 To 4
        'Printer.Print vbCrLf
        Printer.Print
    Next
    lines = 4
    page = 1
    Printer.FontBold = True
    Printer.FontSize = 20
    Printer.Print Space(10) & appAccOpeningAppln(applnLang) & langChar & Space(15)
    Printer.FontBold = False
    Printer.FontSize = 10
    Printer.Print
    Printer.Print
    Printer.Print
    lines = lines + 1
    Printer.Print appDate(applnLang) & langChar & Space(5) & ":" & Format(Date$, "dd/mm/yyyy") & Space(30) & appPage(applnLang) & langChar & Space(3) & ":" & page
    lines = lines + 1
    If screenSetNo = "1" Or screenSetNo = "A" Then
       tCode = Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4)
    ElseIf screenSetNo = "2" Then
       tCode = Mid$(frmIndividualOthers.cmbBranchCode, 1, 4)
    End If
    Set rs = db.OpenRecordset("select * from branchinfo where branchcode='" & tCode & "'")
    If rs.recordCount > 0 Then
       If applnLang = ENGLISH Then
          tmpStr = rs("branchcode") & " - " & rs("englishname")
       Else
          tmpStr = rs("branchcode") & " - " & rs("arabicname")
       End If
    Else
       tmpStr = tCode & "-" & appUnknown(applnLang)
    End If
    Printer.Print appBranch(applnLang) & langChar & Space(5) & ":" & tmpStr
    lines = lines + 1
    Printer.Print
    Printer.Print
    Printer.Print
    Printer.FontBold = True
    Printer.FontSize = 15
    Printer.Print appPlsOpenAnAcc(applnLang) & langChar
    Printer.FontBold = False
    Printer.FontSize = 10
    Printer.Print String(80, "-")
    lines = lines + 1
    Printer.FontBold = True
    Printer.Print appPersonalDetails(applnLang) & langChar
    Printer.FontBold = False
    Printer.Print String(80, "-")
    lines = lines + 1
    'Changed by Mohit on 25-Nov-2006 as Arul requested.
    'Old code
    'Printer.Print appLastName(applnLang) & Space(10) & langChar & appThirdName(applnLang) & Space(10) & langChar & appMiddleName(applnLang) & Space(10) & langChar & appFirstName(applnLang) & langChar
    'New code
    Printer.Print appFirstName(applnLang) & Space(10) & langChar & appMiddleName(applnLang) & Space(10) & langChar & appThirdName(applnLang) & Space(10) & langChar & appLastName(applnLang) & langChar
    
    Printer.Print String(80, "-")
    lines = lines + 1
    
    
    If screenSetNo = "1" Or screenSetNo = "A" Then
       aFirstName = frmIndividualSaudi.txtArabFirstName
       a2ndName = frmIndividualSaudi.txtArabic2ndName
       a3rdName = frmIndividualSaudi.txtArabic3rdName
       aLastName = frmIndividualSaudi.txtArabLastName
       eFirstName = frmIndividualSaudi.txtEngFirstName
       e2ndName = frmIndividualSaudi.txtEnglish2ndName
       e3rdName = frmIndividualSaudi.txtEnglish3rdName
       eLastName = frmIndividualSaudi.txtEngLastName
    ElseIf screenSetNo = "2" Then
       aFirstName = frmIndividualOthers.txtArabFirstName
       a2ndName = frmIndividualOthers.txtArabic2ndName
       a3rdName = frmIndividualOthers.txtArabic3rdName
       aLastName = frmIndividualOthers.txtArabLastName
       eFirstName = frmIndividualOthers.txtEngFirstName
       e2ndName = frmIndividualOthers.txtEnglish2ndName
       e3rdName = frmIndividualOthers.txtEnglish3rdName
       eLastName = frmIndividualOthers.txtEngLastName
    End If
    
    'Below set of name sequence has been changed by Mohit on 25-Nov-2006 as Arul requested.
    If applnLang = ARABIC Then
       'Before
       'Printer.Print Format(aLastName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
       '              Format(a3rdName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
       '              Format(a2ndName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
       '              Format(aFirstName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar
       'Printer.Print Format(eLastName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
       '              Format(e3rdName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
       '              Format(e2ndName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
       '              Format(eFirstName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar
       
       'After
       Printer.Print Format(aFirstName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(a2ndName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(a3rdName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(aLastName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar
       Printer.Print Format(eFirstName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(e2ndName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(e3rdName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(eLastName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar
   Else
'       Before
'       Printer.Print Format(eLastName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
'                     Format(e3rdName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
'                     Format(e2ndName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
'                     Format(eFirstName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar
'       Printer.Print Format(aLastName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
'                     Format(a3rdName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
'                     Format(a2ndName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
'                     Format(aFirstName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar

'After
       Printer.Print Format(eFirstName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(e2ndName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(e3rdName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(eLastName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar
       Printer.Print Format(aFirstName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(a2ndName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(a3rdName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar & _
                     Format(aLastName, "!@@@@@@@@@@@@@@@") & Space(5) & langChar
                     
   End If
   Printer.Print
   Printer.Print
   Printer.Print appPrefLang(applnLang) & Space(5) & langChar & ":" & IIf(applnLang = ARABIC, appArabic(applnLang), appEnglish(applnLang))
   Printer.Print String(80, "-")
   If screenSetNo = "1" Or screenSetNo = "A" Then
      Printer.Print appNationality(applnLang) & Space(5) & langChar & ":" & appSaudi(applnLang)
   ElseIf screenSetNo = "2" Then
      tCode = Mid$(frmIndividualOthers.cmbNationality, 1, 3)
      Set rs = db.OpenRecordset("select * from countryinfo where countrycode='" & tCode & "'")
      If rs.recordCount > 0 Then
         If applnLang = ENGLISH Then
            tmpStr = rs("countrycode") & " - " & rs("englishname")
         Else
            tmpStr = rs("countrycode") & " - " & rs("arabicname")
         End If
      Else
         tmpStr = tCode & "-" & appUnknown(applnLang)
      End If
      Printer.Print appNationality(applnLang) & Space(5) & langChar & ":" & tmpStr
   End If
   If screenSetNo = "1" Or screenSetNo = "A" Then
      tmpStr = IIf(frmIndividualSaudi.optGenderMale, appMale(applnLang), appFemale(applnLang))
   ElseIf screenSetNo = "2" Then
      tmpStr = IIf(frmIndividualOthers.optGenderMale, appMale(applnLang), appFemale(applnLang))
   End If
   Printer.Print appGender(applnLang) & Space(5) & langChar & ":" & tmpStr
   If screenSetNo = "1" Or screenSetNo = "A" Then
      tmpStr = frmIndividualSaudi.cmbDobDate & "/" & _
               frmIndividualSaudi.cmbDobMonth & "/" & _
               frmIndividualSaudi.txtDobYear
   ElseIf screenSetNo = "2" Then
      tmpStr = frmIndividualOthers.cmbDobDate & "/" & _
               frmIndividualOthers.cmbDobMonth & "/" & _
               frmIndividualOthers.txtDobYear
   End If
   Printer.Print appDob(applnLang) & Space(5) & langChar & ":" & tmpStr & langChar
   Printer.Print String(80, "-")
   Printer.FontBold = True
   Printer.Print appAccountType(applnLang) & Space(10) & langChar & appConsumer(applnLang)
   Printer.FontBold = False
   Printer.Print String(80, "-")
   Printer.Print
   If screenSetNo = "1" Or screenSetNo = "A" Then
      tmpStr = appSaudiIdNo(applnLang)
      idNumber = frmIndividualSaudi.txtIdNo
      issuedAt = frmIndividualSaudi.cmbIdIssuedAt
      issueDate = frmIndividualSaudi.cmbIdIssueDate & "/" & _
                  frmIndividualSaudi.cmbIdIssueMonth & "/" & _
                  frmIndividualSaudi.txtIdIssueYear
      expiryDate = frmIndividualSaudi.cmbIdExpiryDate & "/" & _
                   frmIndividualSaudi.cmbIdExpiryMonth & "/" & _
                   frmIndividualSaudi.txtIdExpiryYear
   ElseIf screenSetNo = "2" Then
      tmpStr = appIqamaNo(applnLang)
      idNumber = frmIndividualOthers.txtIqamaNo
      issuedAt = frmIndividualOthers.cmbIqamaIssuedAt
      issueDate = frmIndividualOthers.cmbIqamaIssueDate & "/" & _
                  frmIndividualOthers.cmbIqamaIssueMonth & "/" & _
                  frmIndividualOthers.txtIqamaIssueYear
      expiryDate = frmIndividualOthers.cmbIqamaExpiryDate & "/" & _
                   frmIndividualOthers.cmbIqamaExpiryMonth & "/" & _
                   frmIndividualOthers.txtIqamaExpiryYear
   End If
   
   Printer.Print tmpStr & Space(5) & langChar & ":" & idNumber
   Printer.Print
   Printer.Print appIssuedAt(applnLang) & Space(5) & langChar & ":" & issuedAt
   Printer.Print appIssueDate(applnLang) & Space(5) & langChar & ":" & issueDate
   Printer.Print appExpiryDate(applnLang) & Space(5) & langChar & ":" & expiryDate
   Printer.Print
   
   passportNo = Space(15)
   issuedAt = Space(20)
   issueDate = Space(15)
   expiryDate = Space(15)
   
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If Len(RTrim(frmIndividualSaudi.txtPPNumber)) > 0 Then
         passportNo = frmIndividualSaudi.txtPPNumber
         issuedAt = frmIndividualSaudi.cmbPPIssuedAt
         issueDate = frmIndividualSaudi.cmbPPIssueDate & "/" & _
                     frmIndividualSaudi.cmbPPIssueMonth & "/" & _
                     frmIndividualSaudi.txtPPIssueYear
         expiryDate = frmIndividualSaudi.cmbPPExpiryDate & "/" & _
                      frmIndividualSaudi.cmbPPExpiryMonth & "/" & _
                      frmIndividualSaudi.txtPPExpiryYear
      End If
   ElseIf screenSetNo = "2" Then
      If Len(RTrim(frmIndividualOthers.txtPPNumber)) > 0 Then
         passportNo = frmIndividualOthers.txtPPNumber
         issuedAt = frmIndividualOthers.cmbPPIssuedAt
         issueDate = frmIndividualOthers.cmbPPIssueDate & "/" & _
                     frmIndividualOthers.cmbPPIssueMonth & "/" & _
                     frmIndividualOthers.txtPPIssueYear
         expiryDate = frmIndividualOthers.cmbPPExpiryDate & "/" & _
                      frmIndividualOthers.cmbPPExpiryMonth & "/" & _
                      frmIndividualOthers.txtPPExpiryYear
      End If
   End If
   
   If Len(RTrim(passportNo)) > 0 Then
      Printer.Print appPassportNo(applnLang) & Space(5) & langChar & ":" & passportNo
      Printer.Print
      Printer.Print appIssuedAt(applnLang) & Space(5) & langChar & ":" & issuedAt
      Printer.Print appIssueDate(applnLang) & Space(5) & langChar & ":" & issueDate
      Printer.Print appExpiryDate(applnLang) & Space(5) & langChar & ":" & expiryDate
      Printer.Print
   End If
  
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If Len(RTrim(frmIndividualSaudi.txtHafNo)) > 0 Then
         Printer.Print appHafizaNo(applnLang) & Space(5) & langChar & ":" & frmIndividualSaudi.txtHafNo
         Printer.Print
         Printer.Print appIssuedAt(applnLang) & Space(5) & langChar & ":" & frmIndividualSaudi.cmbHafIssuedAt
         Printer.Print appIssueDate(applnLang) & Space(5) & langChar & ":" & frmIndividualSaudi.cmbHafIssueDate & "/" & _
                                                                             frmIndividualSaudi.cmbHafIssueMonth & "/" & _
                                                                             frmIndividualSaudi.txtHafIssueYear
         Printer.Print appExpiryDate(applnLang) & Space(5) & langChar & ":" & frmIndividualSaudi.cmbHafExpiryDate & "/" & _
                                                                              frmIndividualSaudi.cmbHafExpiryMonth & "/" & _
                                                                              frmIndividualSaudi.txtHafExpiryYear
      End If
   End If
    
   Printer.Print String(80, "-")
   Printer.Print appNoOfDependents(applnLang) & Space(5) & langChar & ":" & IIf(screenSetNo = "1" Or screenSetNo = "A", frmIndividualSaudi.txtDependents, frmIndividualOthers.txtDependents)
   tmpStr = Space(10)
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudi.optMarried Then
         tmpStr = appMarried(applnLang)
      ElseIf frmIndividualSaudi.OptSingle Then
         tmpStr = appSingle(applnLang)
      Else
         tmpStr = appOther(applnLang)
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthers.optMarried Then
         tmpStr = appMarried(applnLang)
      ElseIf frmIndividualOthers.OptSingle Then
         tmpStr = appSingle(applnLang)
      Else
         tmpStr = appOther(applnLang)
      End If
   End If
   
   Printer.Print appMaritalStatus(applnLang) & Space(5) & langChar & ":" & tmpStr & langChar
   Printer.Print String(80, "-")
   Printer.NewPage
   page = page + 1
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   For i = 1 To 4
       'Printer.Print vbCrLf
       Printer.Print
   Next
   lines = 4
   Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
   Printer.FontBold = True
   Printer.Print appSaudiMailingAddr(applnLang) & langChar
   Printer.FontBold = False
   Printer.Print String(80, "-")
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudi.optSaudiPost Then
         tCode = "G"
         tmpStr1 = Format(frmIndividualSaudi.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
                   Format(frmIndividualSaudi.txtSaudiPostStreetName, "!@@@@@@@@@@@@@@@@@@@@@@@@")
         tmpStr2 = Space(30)
         tmpStr3 = frmIndividualSaudi.txtSaudiPostUnit
         tmpStr5 = Format(frmIndividualSaudi.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                   Format(frmIndividualSaudi.txtSaudiPostAdditionalNo, "!@@@@")
      Else
         tCode = "P"
         tmpStr1 = frmIndividualSaudi.txtAddress1
         tmpStr2 = frmIndividualSaudi.txtAddress2
         tmpStr3 = frmIndividualSaudi.txtPOBox
         tmpStr5 = frmIndividualSaudi.txtPinCode
      End If
      tmpStr4 = frmIndividualSaudi.cmbCity
      tmpStr6 = frmIndividualSaudi.txtFaxCityCode & "-" & _
                frmIndividualSaudi.txtFaxNo & "-" & _
                frmIndividualSaudi.txtFaxExt
      tmpStr7 = frmIndividualSaudi.txtOffPhoneCityCode & "-" & _
                frmIndividualSaudi.txtOffPhoneNo & "-" & _
                frmIndividualSaudi.txtOffPhoneExt
      tmpStr8 = frmIndividualSaudi.txtResPhoneCityCode & "-" & _
                frmIndividualSaudi.txtResPhoneNo & "-" & _
                frmIndividualSaudi.txtResPhoneExt
      tmpStr9 = frmIndividualSaudi.txtEmailAddress
      tmpStr10 = frmIndividualSaudi.txtMobileAreaCode & _
                 frmIndividualSaudi.txtMobileNo
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthers.optSaudiPost Then
         tCode = "G"
         tmpStr1 = Format(frmIndividualOthers.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
                   Format(frmIndividualOthers.txtSaudiPostStreetName, "!@@@@@@@@@@@@@@@@@@@@@@@@")
         tmpStr2 = Space(30)
         tmpStr3 = frmIndividualOthers.txtSaudiPostUnit
         tmpStr5 = Format(frmIndividualOthers.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                   Format(frmIndividualOthers.txtSaudiPostAdditionalNo, "!@@@@")
      Else
         tCode = "P"
         tmpStr1 = frmIndividualOthers.txtAddress1
         tmpStr2 = frmIndividualOthers.txtAddress2
         tmpStr3 = frmIndividualOthers.txtPOBox
         tmpStr5 = frmIndividualOthers.txtPinCode
      End If
      tmpStr4 = frmIndividualOthers.cmbCity
      tmpStr6 = frmIndividualOthers.txtFaxCityCode & "-" & _
                frmIndividualOthers.txtFaxNo & "-" & _
                frmIndividualOthers.txtFaxExt
      tmpStr7 = frmIndividualOthers.txtOffPhoneCityCode & "-" & _
                frmIndividualOthers.txtOffPhoneNo & "-" & _
                frmIndividualOthers.txtOffPhoneExt
      tmpStr8 = frmIndividualOthers.txtResPhoneCityCode & "-" & _
                frmIndividualOthers.txtResPhoneNo & "-" & _
                frmIndividualOthers.txtResPhoneExt
      tmpStr9 = frmIndividualOthers.txtEmailAddress
      tmpStr10 = frmIndividualOthers.txtMobileAreaCode & _
                 frmIndividualOthers.txtMobileNo
   End If
   
   Printer.Print IIf(tCode = "G", appGpsStreetName(applnLang), appAddress1(applnLang)) & langChar & Space(5) & ":" & tmpStr1
   If tCode = "P" Then
      Printer.Print appAddress2(applnLang) & langChar & Space(5) & ":" & tmpStr2
   End If
   
   Printer.Print IIf(tCode = "G", appUnit(applnLang), appPoBox(applnLang)) & langChar & Space(2) & ":" & tmpStr3 & Space(5) & _
                 appCity(applnLang) & langChar & Space(2) & ":" & tmpStr4 & Space(5) & _
                 appZipcode(applnLang) & langChar & Space(2) & ":" & tmpStr5
   Printer.Print appFax(applnLang) & langChar & Space(2) & ":" & tmpStr6
   Printer.Print appOffPhone(applnLang) & langChar & Space(2) & ":" & tmpStr7
   Printer.Print appResPhone(applnLang) & langChar & Space(2) & ":" & tmpStr8
   Printer.Print appEmailAddr(applnLang) & langChar & Space(2) & ":" & tmpStr9 & Space(5) & langChar & _
                 appMobile(applnLang) & langChar & Space(2) & ":" & tmpStr10
                                                                    
   Printer.Print String(80, "-")
   Printer.FontBold = True
   Printer.Print appPersonalDetails(applnLang) & langChar
   Printer.FontBold = False
   Printer.Print String(80, "-")
   tmpStr1 = Space(10)
   tmpStr2 = Space(10)
   tmpStr3 = Space(10)
   tmpStr4 = Space(10)
   tmpStr5 = Space(10)
   tmpStr6 = Space(10)
   tmpStr7 = Space(10)
   tmpStr8 = Space(10)
   tmpStr9 = Space(10)
   tmpStr10 = Space(10)
   
   If screenSetNo = "1" Or screenSetNo = "A" Then
      tmpStr1 = Mid$(frmIndividualSaudiAcctInfo.cmbEducation, 1, 4)
      tmpStr2 = Mid$(frmIndividualSaudiAcctInfo.cmbProfession, 1, 4)
      tmpStr3 = Mid$(frmIndividualSaudiAcctInfo.cmbPosition, 1, 4)
      tmpStr4 = Mid$(frmIndividualSaudiAcctInfo.cmbMonthlyIncome, 1, 4)
   ElseIf screenSetNo = "2" Then
      tmpStr1 = Mid$(frmIndividualOthers2.cmbEducation, 1, 4)
      tmpStr2 = Mid$(frmIndividualOthers2.cmbProfession, 1, 4)
      tmpStr3 = Mid$(frmIndividualOthers2.cmbPosition, 1, 4)
      tmpStr4 = Mid$(frmIndividualOthers2.cmbMonthlyIncome, 1, 4)
   End If
   Set rs = db.OpenRecordset("select * from educationinfo where educationcode='" & tmpStr1 & "'")
   If rs.recordCount > 0 Then
      If applnLang = ENGLISH Then
         tmpStr1 = rs("educationcode") & " - " & rs("englishname")
      Else
         tmpStr1 = rs("educationcode") & " - " & rs("arabicname")
      End If
   Else
      tmpStr1 = tmpStr1 & "-" & appUnknown(applnLang)
   End If
   Set rs = db.OpenRecordset("select * from professioninfo where professioncode ='" & tmpStr2 & "'")
   If rs.recordCount > 0 Then
      If applnLang = ENGLISH Then
         tmpStr2 = rs("professioncode") & " - " & rs("englishname")
      Else
         tmpStr2 = rs("professioncode") & " - " & rs("arabicname")
      End If
   Else
      tmpStr2 = tmpStr2 & "-" & appUnknown(applnLang)
   End If
   Set rs = db.OpenRecordset("select * from Positioninfo where Positioncode ='" & tmpStr3 & "'")
   If rs.recordCount > 0 Then
      If applnLang = ENGLISH Then
         tmpStr3 = rs("Positioncode") & " - " & rs("englishname")
      Else
         tmpStr3 = rs("Positioncode") & " - " & rs("arabicname")
      End If
   Else
      tmpStr3 = tmpStr3 & "-" & appUnknown(applnLang)
   End If
   Set rs = db.OpenRecordset("select * from monthlyincomeinfo where incomecode ='" & tmpStr4 & "'")
   If rs.recordCount > 0 Then
      If applnLang = ENGLISH Then
         tmpStr4 = rs("incomecode") & " - " & rs("englishname")
      Else
         tmpStr4 = rs("incomecode") & " - " & rs("arabicname")
      End If
   Else
      tmpStr4 = tmpStr4 & "-" & appUnknown(applnLang)
   End If
         
   Printer.Print appEducation(applnLang) & langChar & Space(10) & tmpStr1 & langChar
   Printer.Print appProfession(applnLang) & langChar & Space(10) & tmpStr2 & langChar
   Printer.Print appPosition(applnLang) & langChar & Space(10) & tmpStr3 & langChar
   Printer.Print appMonthlyIncome(applnLang) & langChar & Space(10) & tmpStr4 & langChar
   Printer.Print String(80, "-")
   tmpStr = ""
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudiAcctInfo.chkCompanyAcc.Value = vbChecked Then
         tmpStr = appCompAccom(applnLang) & langChar
      End If
      If frmIndividualSaudiAcctInfo.chkOwnHouse.Value = vbChecked Then
         tmpStr = tmpStr & Space(10) & appOwnHouse(applnLang) & langChar
      End If
      If frmIndividualSaudiAcctInfo.chkRentedHouse.Value = vbChecked Then
         tmpStr = tmpStr & Space(10) & appRentedHouse(applnLang) & langChar
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthers2.chkCompanyAcc.Value = vbChecked Then
         tmpStr = appCompAccom(applnLang) & langChar
      End If
      If frmIndividualOthers2.chkOwnHouse.Value = vbChecked Then
         tmpStr = tmpStr & Space(10) & appOwnHouse(applnLang) & langChar
      End If
      If frmIndividualOthers2.chkRentedHouse.Value = vbChecked Then
         tmpStr = tmpStr & Space(10) & appRentedHouse(applnLang) & langChar
      End If
   End If
   Printer.Print appProperty(applnLang) & Space(10) & langChar & tmpStr
   tmpStr = ""
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudiAcctInfo.chkCompanyTransport.Value = vbChecked Then
         tmpStr = appCompTrans(applnLang) & langChar
      End If
      If frmIndividualSaudiAcctInfo.chkOwnCar.Value = vbChecked Then
         tmpStr = tmpStr & Space(10) & appOwnCar(applnLang) & langChar
      End If
      If frmIndividualSaudiAcctInfo.chkRentedCar.Value = vbChecked Then
         tmpStr = tmpStr & Space(10) & appRentedCar(applnLang) & langChar
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthers2.chkCompanyTransport.Value = vbChecked Then
         tmpStr = appCompTrans(applnLang) & langChar
      End If
      If frmIndividualOthers2.chkOwnCar.Value = vbChecked Then
         tmpStr = tmpStr & Space(10) & appOwnCar(applnLang) & langChar
      End If
      If frmIndividualOthers2.chkRentedCar.Value = vbChecked Then
         tmpStr = tmpStr & Space(10) & appRentedCar(applnLang) & langChar
      End If
   End If
   Printer.Print appCar(applnLang) & Space(10) & langChar & tmpStr
   Printer.Print String(80, "-")
   tmpStr = ""
   Printer.FontBold = True
   Printer.Print appJobInfo(applnLang)
   Printer.FontBold = False
   Printer.Print String(80, "-")
   tmpStr1 = Space(10)
   tmpStr2 = Space(10)
   tmpStr3 = Space(10)
   tmpStr4 = Space(10)
   tmpStr5 = Space(10)
   tmpStr6 = Space(10)
   If screenSetNo = "1" Or screenSetNo = "A" Then
      tmpStr1 = frmIndividualSaudiAcctInfo.txtEmployerName
      tmpStr2 = frmIndividualSaudiAcctInfo.txtDepartment
      tmpStr3 = frmIndividualSaudiAcctInfo.txtEmployerPOBox
      tmpStr4 = frmIndividualSaudiAcctInfo.txtEmployerCity
      tmpStr5 = frmIndividualSaudiAcctInfo.txtEmployerZipcode
   ElseIf screenSetNo = "2" Then
      tmpStr1 = frmIndividualOthers2.txtEmployerName
      tmpStr2 = frmIndividualOthers2.txtDepartment
      tmpStr3 = frmIndividualOthers2.txtEmployerPOBox
      tmpStr4 = frmIndividualOthers2.txtEmployerCity
      tmpStr5 = frmIndividualOthers2.txtEmployerZipcode
   End If
   Printer.Print appEmployerName(applnLang) & langChar & Space(5) & tmpStr1 & langChar
   Printer.Print appDeptName(applnLang) & langChar & Space(5) & tmpStr2 & langChar
   Printer.Print appPoBox(applnLang) & langChar & Space(10) & ":" & Space(5) & tmpStr3 & langChar
   Printer.Print appCity(applnLang) & langChar & Space(13) & ":" & Space(5) & tmpStr4 & langChar
   Printer.Print appZipcode(applnLang) & langChar & Space(9) & ":" & Space(5) & tmpStr5 & langChar
   Printer.Print String(80, "-")
   Printer.Print
   
   If screenSetNo = "2" Then
      Printer.Print
      Printer.Print String(80, "-")
      Printer.FontBold = True
      Printer.Print appHomeCountryAddr(applnLang)
      Printer.FontBold = False
      Printer.Print String(80, "-")
      tmpStr1 = Space(10)
      tmpStr2 = Space(10)
      tmpStr3 = Space(10)
      tmpStr4 = Space(10)
      tmpStr5 = Space(10)
      tmpStr6 = Space(10)
      tmpStr7 = Space(10)
      tmpStr8 = Space(10)
      tmpStr9 = Space(10)
      tmpStr10 = Space(10)
      tmpStr1 = frmIndividualOthers2.txtHomeAddress1
      tmpStr2 = frmIndividualOthers2.txtHomeAddress2
      tmpStr3 = frmIndividualOthers2.txtHomePoBox
      tmpStr4 = frmIndividualOthers2.cmbHomeCityName
      tmpStr5 = frmIndividualOthers2.txtHomeZipCode
      tmpStr6 = frmIndividualOthers2.txtHomeFaxAreaCode & "-" & _
                frmIndividualOthers2.txtHomeFaxNo & "-" & _
                frmIndividualOthers2.txtHomeFaxExt
      tmpStr7 = frmIndividualOthers2.txtHomeOffPhoneAreaCode & "-" & _
                frmIndividualOthers2.txtHomeOffPhoneNo & "-" & _
                frmIndividualOthers2.txtHomeOffPhoneExt
      tmpStr8 = frmIndividualOthers2.txtHomePhoneResAreaCode & "-" & _
                frmIndividualOthers2.txtHomeResPhoneNo & "-" & _
                frmIndividualOthers2.txtHomePhoneResExt
      tmpStr9 = frmIndividualOthers2.txtHomeEmailAddress
      tmpStr10 = frmIndividualOthers2.txtHomeMobileCode & _
                 frmIndividualOthers2.txtHomeMobileNo
      Printer.Print appAddress1(applnLang) & langChar & Space(5) & ":" & tmpStr1
      Printer.Print appAddress2(applnLang) & langChar & Space(5) & ":" & tmpStr2
      Printer.Print appPoBox(applnLang) & langChar & Space(2) & ":" & tmpStr3 & Space(5) & _
                    appCity(applnLang) & langChar & Space(2) & ":" & tmpStr4 & Space(5) & _
                    appZipcode(applnLang) & langChar & Space(2) & ":" & tmpStr5
      Printer.Print appFax(applnLang) & langChar & Space(2) & ":" & tmpStr6
      Printer.Print appOffPhone(applnLang) & langChar & Space(2) & ":" & tmpStr7
      Printer.Print appResPhone(applnLang) & langChar & Space(2) & ":" & tmpStr8
      Printer.Print appEmailAddr(applnLang) & langChar & Space(2) & ":" & tmpStr9 & Space(5) & langChar & _
                    appMobile(applnLang) & langChar & Space(2) & ":" & tmpStr10
      Printer.Print
      Printer.Print
   End If
   Printer.FontBold = True
   Printer.Print appEnclDoc(applnLang)
   Printer.FontBold = False
   Printer.Print String(80, "-")
   
   tmpStr10 = ""
   
   For i = 1 To Len(RTrim(documentsSelected)) Step 3
       tmpStr10 = Mid(documentsSelected, i, 3)
       If Len(Trim(tmpStr10)) = 0 Then
           Exit For
       End If
       Set rs = db.OpenRecordset("select * from documentinfo where " & _
                                   " documentcode = '" & tmpStr10 & "'")
       If rs.recordCount > 0 Then
          If applnLang = ARABIC Then
             tmpStr = tmpStr10 & "-" & rs("arabicname")
          Else
             tmpStr = tmpStr10 & "-" & rs("englishname")
          End If
       Else
          tmpStr = tCode & "-" & appUnknown(applnLang)
       End If
       Printer.Print tmpStr & langChar
   Next
   tmpStr9 = otherDocumentsEntered
   
'   Printer.Print appAuthSignDoc(applnLang)
'   Printer.Print appIdIqamaCopy(applnLang)
   Printer.Print
   Printer.Print appOtherDocuments(applnLang) & langChar & tmpStr9 & langChar
   Printer.NewPage
   page = page + 1
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   For i = 1 To 4
       'Printer.Print vbCrLf
       Printer.Print
   Next
   lines = 4
   Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
   
   Printer.FontBold = True
   Printer.Print appAccount(applnLang)
   Printer.FontBold = False
   Printer.Print String(80, "-")
   tmpStr = ""
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudiAcctInfo.optCurrentAcYes = True Then
         tmpStr = appCurrentAcc(applnLang) & langChar
      End If
      If frmIndividualSaudiAcctInfo.optSavingAcYes = True Then
         tmpStr = tmpStr & Space(10) & appSavingAcc(applnLang) & langChar
      End If
   
      If Len(RTrim(Mid$(frmIndividualSaudiAcctInfo.cmbOtherAccount, 1, 3))) > 0 Then
         tmpStr = tmpStr & Space(10) & appOther(applnLang) & Space(5) & Mid$(frmIndividualSaudiAcctInfo.cmbOtherAccount, 1, 3)
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthersAcctInfo.optCurrentAcYes = True Then
         tmpStr = appCurrentAcc(applnLang) & langChar
      End If
      If frmIndividualOthersAcctInfo.optSavingAcYes = True Then
         tmpStr = tmpStr & Space(10) & appSavingAcc(applnLang) & langChar
      End If
   
      If Len(RTrim(Mid$(frmIndividualOthersAcctInfo.cmbOtherAccount, 1, 3))) > 0 Then
         tmpStr = tmpStr & Space(10) & appOther(applnLang) & Space(5) & Mid$(frmIndividualOthersAcctInfo.cmbOtherAccount, 1, 3)
      End If
   End If
   Printer.Print appAccountType(applnLang) & langChar & Space(10) & tmpStr
   Printer.Print String(80, "-")
   tmpStr1 = ""
   If screenSetNo = "1" Or screenSetNo = "A" Then
      tmpStr = IIf(frmIndividualSaudiAcctInfo.optCurrentAcCheckBookYes, appYes(applnLang), appNo(applnLang))
      If Len(RTrim(Mid$(frmIndividualSaudiAcctInfo.cmbOtherAccount, 1, 3))) > 0 Then
         tmpStr1 = IIf(frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes, appYes(applnLang), appNo(applnLang))
      End If
   ElseIf screenSetNo = "2" Then
      tmpStr = IIf(frmIndividualOthersAcctInfo.optCurrentAcCheckBookYes, appYes(applnLang), appNo(applnLang))
      If Len(RTrim(Mid$(frmIndividualOthersAcctInfo.cmbOtherAccount, 1, 3))) > 0 Then
         tmpStr1 = IIf(frmIndividualOthersAcctInfo.optOtherAcCheckBookYes, appYes(applnLang), appNo(applnLang))
      End If
   End If
   
   Printer.Print appChequeBook(applnLang) & langChar & Space(10) & tmpStr & Space(10) & Space(5) & Space(10) & tmpStr1
   Printer.Print String(80, "-")
   tmpStr1 = ""
   tmpStr2 = ""
   tmpStr3 = ""
   tmpStr4 = ""
   If screenSetNo = "1" Or screenSetNo = "A" Then
      tmpStr1 = Mid$(frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency, 1, 2)
      tmpStr2 = Mid$(frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq, 1, 2)
      tmpStr3 = IIf(frmIndividualSaudiAcctInfo.optSignSingle, appSingle(applnLang), appJoint(applnLang))
   ElseIf screenSetNo = "2" Then
      tmpStr1 = Mid$(frmIndividualOthersAcctInfo.cmbCurrentAcCurrency, 1, 2)
      tmpStr2 = Mid$(frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq, 1, 2)
      tmpStr3 = IIf(frmIndividualOthersAcctInfo.optSignSingle, appSingle(applnLang), appJoint(applnLang))
   End If
   Set rs = db.OpenRecordset("select * from currencyinfo where currencycode='" & tmpStr1 & "'")
   If rs.recordCount > 0 Then
      If applnLang = ENGLISH Then
         tmpStr1 = rs("currencycode") & " - " & rs("englishname")
      Else
         tmpStr1 = rs("currencycode") & " - " & rs("arabicname")
      End If
   Else
      tmpStr1 = tmpStr1 & "-" & appUnknown(applnLang)
   End If
   
   Set rs = db.OpenRecordset("select * from statementFrequencyinfo where frequencycode='" & tmpStr2 & "'")
   If rs.recordCount > 0 Then
      If applnLang = ENGLISH Then
         tmpStr2 = rs("frequencycode") & " - " & rs("englishname")
      Else
         tmpStr2 = rs("frequencycode") & " - " & rs("arabicname")
      End If
   Else
      tmpStr2 = tmpStr2 & "-" & appUnknown(applnLang)
   End If
   Printer.Print appAccCurr(applnLang) & langChar & Space(10) & tmpStr1 & langChar
   Printer.Print appAccStmtFreq(applnLang) & langChar & Space(10) & tmpStr2 & langChar
   Printer.Print appSignInstruction(applnLang) & langChar & Space(10) & tmpStr3
      
   Printer.Print String(80, "-")
   Printer.FontBold = True
   Printer.Print appIssueATMCard(applnLang)
   Printer.FontBold = False
   Printer.Print
   Printer.Print
   tmpStr1 = ""
   tmpStr2 = ""
   tmpStr3 = ""
   tmpStr4 = ""
   tmpStr5 = ""
   tmpStr6 = ""
   tmpStr7 = ""
   tmpStr8 = ""
   tmpStr9 = ""
   tmpStr10 = ""
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudiAcctInfo.optChipCard = True Then
         tmpStr1 = appSmartCard(applnLang)
      Else
         tmpStr1 = appElectronIntl(applnLang)
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthersAcctInfo.optChipCard = True Then
         tmpStr1 = appSmartCard(applnLang)
      Else
         tmpStr1 = appElectronIntl(applnLang)
      End If
   End If
   Printer.Print appCardType(applnLang) & langChar & tmpStr1 & langChar
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudiAcctInfo.optPrimaryElectronIntlCardYes Then
         Printer.Print appPrimaryAtmCard(applnLang) & langChar
         Printer.Print String(30, "-")
         Printer.Print appNameOnTheCard(applnLang) & langChar & Space(10) & _
                       frmIndividualSaudiAcctInfo.txtPrimaryElectronIntlCardName
         Printer.Print
      End If
      If frmIndividualSaudiAcctInfo.optSecondaryElectronIntlCardYes Then
         Printer.Print appSecondaryAtm(applnLang) & langChar
         Printer.Print String(30, "-")
         Printer.Print appNameOnTheCard(applnLang) & langChar & Space(10) & _
                       frmIndividualSaudiAcctInfo.txtSecondaryElectronIntlCardName
         Printer.Print
      End If
      If frmIndividualSaudiAcctInfo.optCardDeliveredToBranch Or _
         frmIndividualSaudiAcctInfo.optCardDeliveredToReqBranch Then
         tmpStr2 = appBranchDelivery(applnLang)
      Else
         tmpStr2 = appMailDelivery(applnLang)
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthersAcctInfo.optPrimaryElectronIntlCardYes Then
         Printer.Print appPrimaryAtmCard(applnLang) & langChar
         Printer.Print String(30, "-")
         Printer.Print appNameOnTheCard(applnLang) & langChar & Space(10) & _
                       frmIndividualOthersAcctInfo.txtPrimaryElectronIntlCardName
         Printer.Print
      End If
      If frmIndividualOthersAcctInfo.optSecondaryElectronIntlCardYes Then
         Printer.Print appSecondaryAtm(applnLang) & langChar
         Printer.Print String(30, "-")
         Printer.Print appNameOnTheCard(applnLang) & langChar & Space(10) & _
                       frmIndividualOthersAcctInfo.txtSecondaryElectronIntlCardName
         Printer.Print
      End If
      If frmIndividualOthersAcctInfo.optCardDeliveredToBranch Or _
         frmIndividualOthersAcctInfo.optCardDeliveredToReqBranch Then
         tmpStr2 = appBranchDelivery(applnLang)
      Else
         tmpStr2 = appMailDelivery(applnLang)
      End If
   End If
   Printer.Print appCardDeliveryChannel(applnLang) & langChar & Space(10) & tmpStr2
   Printer.Print String(80, "-")
   Printer.Print
   If screenSetNo = "1" Or screenSetNo = "A" Then
      tmpStr3 = frmIndividualSaudi.txtCustomerNo
   Else
      tmpStr3 = frmIndividualOthers.txtCustomerNo
   End If
   Printer.FontBold = True
   Printer.Print appCustNoAssigned(applnLang) & Space(10) & tmpStr3
   Printer.FontBold = False
   Printer.Print
   Printer.Print
   Printer.Print String(80, "-")
   Printer.FontBold = True
   Printer.FontSize = 20
   Printer.Print appDeclaration(applnLang) & langChar
   Printer.FontBold = False
   Printer.FontSize = 10
   Printer.Print String(80, "-")
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\declaration_eng.txt"
   Else
      tmpStr10 = App.Path & "\declaration_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
      Wend
      textStream.Close
   End If
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.FontBold = True
   Printer.Print appName(applnLang) & langChar & Space(10)
   Printer.Print
   Printer.Print
   Printer.Print appSignature(applnLang) & langChar
   Printer.FontBold = False
   
   Printer.NewPage
   page = page + 1
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   For i = 1 To 4
       'Printer.Print vbCrLf
       Printer.Print
   Next
   lines = 4
   Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
   lines = lines + 1
   
   Printer.FontBold = True
   Printer.Print appAllAccountTerms(applnLang)
   lines = lines + 1
   Printer.FontBold = False
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.Print
   Printer.FontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\allAccountsTerms_eng.txt"
   Else
      tmpStr10 = App.Path & "\allAccountsTerms_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
          lines = lines + 1
          If lines > 70 Then
             Printer.Print Space(40) & appContd(applnLang) & langChar
             Printer.NewPage
             page = page + 1
             'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
             Printer.PaintPicture frmLogin.anbLogo1, 50, 200
             For i = 1 To 4
                 'Printer.Print vbCrLf
                 Printer.Print
             Next
             lines = 4
             Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
             lines = lines + 1
             Printer.Print
             Printer.Print
             lines = lines + 2
          End If
      Wend
      textStream.Close
   End If
   Printer.Print
      
   Printer.NewPage
   page = page + 1
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   For i = 1 To 4
       'Printer.Print vbCrLf
       Printer.Print
   Next
   lines = 5
   Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
   lines = lines + 1
   
   Printer.FontBold = True
   Printer.Print appCurrentAccTerms(applnLang)
   lines = lines + 1
   Printer.FontBold = False
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.Print
   lines = lines + 1
   Printer.FontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\Current_Acc_eng.txt"
   Else
      tmpStr10 = App.Path & "\Current_Acc_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
          lines = lines + 1
      Wend
      textStream.Close
   End If
   Printer.Print
   Printer.Print
   lines = lines + 2
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.FontBold = True
   Printer.Print appSavingAccTerms(applnLang)
   lines = lines + 1
   Printer.FontBold = False
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.Print
   lines = lines + 1
   Printer.FontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\saving_Acc_eng.txt"
   Else
      tmpStr10 = App.Path & "\saving_Acc_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
          lines = lines + 1
      Wend
      textStream.Close
   End If
   Printer.Print
   Printer.Print
   lines = lines + 2
   
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.FontBold = True
   Printer.Print appAtmCardTerms(applnLang)
   lines = lines + 1
   Printer.FontBold = False
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.Print
   lines = lines + 1
   Printer.FontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\cardTerms_eng.txt"
   Else
      tmpStr10 = App.Path & "\cardTerms_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
          lines = lines + 1
          If lines > 70 Then
             Printer.Print Space(40) & appContd(applnLang) & langChar
             Printer.NewPage
             page = page + 1
             'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
             Printer.PaintPicture frmLogin.anbLogo1, 50, 200
             For i = 1 To 4
                 'Printer.Print vbCrLf
                 Printer.Print
             Next
             lines = 4
             Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
             lines = lines + 1
             Printer.Print
             Printer.Print
             lines = lines + 2
          End If
      Wend
      textStream.Close
   End If
   Printer.Print
   lines = lines + 1
      
   Printer.NewPage
   page = page + 1
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   For i = 1 To 4
       'Printer.Print vbCrLf
       Printer.Print
   Next
   lines = 4
   Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
   lines = lines + 1
   
   Printer.FontBold = True
   Printer.Print appHatifAlArabiTerms(applnLang)
   lines = lines + 1
   Printer.FontBold = False
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.Print
   lines = lines + 1
   Printer.FontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\phone_terms_eng.txt"
   Else
      tmpStr10 = App.Path & "\phone_terms_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
          lines = lines + 1
          If lines > 70 Then
             Printer.Print Space(40) & appContd(applnLang) & langChar
             Printer.NewPage
             page = page + 1
             'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
             Printer.PaintPicture frmLogin.anbLogo1, 50, 200
             For i = 1 To 4
                 'Printer.Print vbCrLf
                 Printer.Print
             Next
             lines = 4
             Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
             lines = lines + 1
             Printer.Print
             Printer.Print
          End If
      Wend
      textStream.Close
   End If
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print Space(40) & appEndOfTerms(applnLang) & langChar
   
   
'    response = MsgBox("Do you want to print the application?", vbYesNo)
'    If response = vbYes Then
   Printer.EndDoc
'    Else
'       Printer.KillDoc
'    End If
On Error GoTo 0
Exit Sub

err_handler:

If Err.Number = 53 Or Err.Number = 76 Then
   If UserLang = ARABIC Then
      tmpStr = tmpStr10 & "„·› «·≈ﬁ—«—/«·‘—Êÿ Ê«·√Õﬂ«„ €Ì— „ÊÃÊœ ; «·≈ﬁ—«—/«·‘—Êÿ Ê«·√Õﬂ«„ ·‰  ÿ»⁄.."
   Else
      tmpStr = "Declaration/Terms&conditions  file (" & tmpStr10 & ") does not exist ; Declaration/Terms&conditions will not be printed.."
   End If
   MsgBox tmpStr
   tCode = "1"
   Resume Next
Else
   Resume Next
End If

End Sub

Public Function getCustHistory(lastRecCount As String, custNo As String, msgType As String) As Integer
          ' msgType =  0  (customer update history)
          ' msgType =  1  (Telephone pin select history)
    Dim strmsglen As String * 6
    Dim userId As String * 10
    
    userId = Format(gUserId, "!@@@@@@@@@@")

    SendMsg = "000090" & "67" & gBranchCode & userId & lastRecCount & custNo & msgType & Space(10)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       getCustHistory = -1
       Exit Function
    End If
    parseCustHistoryDetails
    getCustHistory = 0
End Function

Public Sub parseCustHistoryDetails()
     Dim i As Integer, pos As Integer
     pos = 1
     
     recvCustHistoryMsg.status = Mid$(RecvStr, pos, 3)
     pos = pos + 3
     recvCustHistoryMsg.service = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvCustHistoryMsg.aRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     recvCustHistoryMsg.eRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     recvCustHistoryMsg.lastRecCount = Mid$(RecvStr, pos, 5)
     pos = pos + 5
     recvCustHistoryMsg.noOfRecs = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvCustHistoryMsg.custNo = Mid$(RecvStr, pos, 7)
     pos = pos + 7
     recvCustHistoryMsg.custName = Mid$(RecvStr, pos, 30)
     pos = pos + 30
     recvCustHistoryMsg.custBranchCode = Mid$(RecvStr, pos, 4)
     pos = pos + 4
     recvCustHistoryMsg.filler = Mid$(RecvStr, pos, 10)
     pos = pos + 10
     For i = 1 To Val(recvCustHistoryMsg.noOfRecs)
         recvCustHistoryMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
         pos = pos + 4
         recvCustHistoryMsg.details(i).userId = Mid$(RecvStr, pos, 20)
         pos = pos + 20
         recvCustHistoryMsg.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvCustHistoryMsg.details(i).pendingStatus = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvCustHistoryMsg.details(i).supervisorId = Mid$(RecvStr, pos, 20)
         pos = pos + 20
         recvCustHistoryMsg.details(i).approvedDateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvCustHistoryMsg.details(i).mainCategoryCode = Mid$(RecvStr, pos, 2)
         pos = pos + 2
         recvCustHistoryMsg.details(i).subCategoryCode = Mid$(RecvStr, pos, 2)
         pos = pos + 2
    Next i
End Sub

Public Sub parseTimeDepositDetail()
    Dim pos As Integer
    pos = 1

    recvTimeDepositDetailMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTimeDepositDetailMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTimeDepositDetailMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTimeDepositDetailMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTimeDepositDetailMsg.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTimeDepositDetailMsg.custNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvTimeDepositDetailMsg.custName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvTimeDepositDetailMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTimeDepositDetailMsg.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvTimeDepositDetailMsg.tdCurrency = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTimeDepositDetailMsg.tdLedger = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTimeDepositDetailMsg.tenorType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTimeDepositDetailMsg.tenor = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTimeDepositDetailMsg.depositAmt = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTimeDepositDetailMsg.debitAccNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTimeDepositDetailMsg.fundIntRate = Mid$(RecvStr, pos, 9)
    pos = pos + 9
    recvTimeDepositDetailMsg.exRate = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTimeDepositDetailMsg.maturityAmt = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTimeDepositDetailMsg.maturityDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    ''The next 2 line are added by Mohit on 20-Feb-2007 as change reported by Arul
    recvTimeDepositDetailMsg.valueDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvTimeDepositDetailMsg.overrideExRate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTimeDepositDetailMsg.overrideIntRate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    ''The next 2 line are added by Mohit on 20-Feb-2007 as change reported by Arul
    recvTimeDepositDetailMsg.overrideValueDate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTimeDepositDetailMsg.orgFundIntRate = Mid$(RecvStr, pos, 9)
    pos = pos + 9
    recvTimeDepositDetailMsg.orgExRate = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTimeDepositDetailMsg.autoRenewFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTimeDepositDetailMsg.crBaseDays = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTimeDepositDetailMsg.diffDays = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTimeDepositDetailMsg.intAppln = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTimeDepositDetailMsg.payAccNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    ''The next 2 line are added by Mohit on 20-Feb-2007 as change reported by Arul
    recvTimeDepositDetailMsg.debitAmt = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTimeDepositDetailMsg.supervisorComments = RTrim(Mid$(RecvStr, pos, 200))
    pos = pos + 200
    ' code Added by arshad on 26th feb
    recvTimeDepositDetailMsg.PayAccCustName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    ' change of code ends here
End Sub

Public Sub fillFrmTimeDepositOpen()
    Dim tCode As String, tmpStr As String
    Dim mQry As String
    Dim tCcy As String
    Dim tDecimalPlace As String
    Dim amtDenom As Integer, i As Integer
    Dim exRate As Double
    Dim drDecimalPlace As String, drAmtDenom As Integer   ''Added by Mohit on 20-Feb-2007 as change reported by Arul
   
    frmTimeDepositOpen.txtCustNo = recvTimeDepositDetailMsg.custNo
    frmTimeDepositOpen.txtCustName = recvTimeDepositDetailMsg.custName
    
    frmTimeDepositOpen.txtDepositAccNo = recvTimeDepositDetailMsg.accNo
    frmTimeDepositOpen.TxtPayAccCustName = recvTimeDepositDetailMsg.PayAccCustName
    
    tCode = Format(recvTimeDepositDetailMsg.tdLedger, "!@@@")
    If Len(RTrim(tCode)) <> 0 Then
       For i = 0 To frmTimeDepositOpen.cmbTDLedger.ListCount
           If Mid(frmTimeDepositOpen.cmbTDLedger.List(i), 1, 3) = tCode Then
              frmTimeDepositOpen.cmbTDLedger.ListIndex = i
              Exit For
           End If
       Next i
    Else
       frmTimeDepositOpen.cmbTDLedger.ListIndex = -1
    End If
    If i > frmTimeDepositOpen.cmbTDLedger.ListCount Then
       frmTimeDepositOpen.cmbTDLedger.ListIndex = -1
    End If
    
    tCode = Format(recvTimeDepositDetailMsg.tdCurrency, "!@@")
    If Len(RTrim(tCode)) <> 0 Then
       For i = 0 To frmTimeDepositOpen.cmbTDCurrency.ListCount
           If Mid(frmTimeDepositOpen.cmbTDCurrency.List(i), 1, 2) = tCode Then
              frmTimeDepositOpen.cmbTDCurrency.ListIndex = i
              Exit For
           End If
       Next i
    Else
       frmTimeDepositOpen.cmbTDCurrency.ListIndex = -1
    End If
    If i > frmTimeDepositOpen.cmbTDCurrency.ListCount Then
       frmTimeDepositOpen.cmbTDCurrency.ListIndex = -1
    End If
    
    Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                              "where currencycode = '" & tCode & "'")

    If rs.recordCount > 0 Then
       tDecimalPlace = rs(0)
    Else
       tDecimalPlace = "2"
    End If

    If tDecimalPlace = "3" Then
       amtDenom = 1000
    ElseIf tDecimalPlace = "2" Then
       amtDenom = 100
    ElseIf tDecimalPlace = "1" Then
       amtDenom = 10
    Else
       amtDenom = 1
    End If
    If Not IsNumeric(Right(recvTimeDepositDetailMsg.depositAmt, 1)) Then
       recvTimeDepositDetailMsg.depositAmt = "-" & bmAmtToDbl(recvTimeDepositDetailMsg.depositAmt)
    End If
    
    tCode = recvTimeDepositDetailMsg.tenorType
    If Len(RTrim(tCode)) <> 0 Then
       For i = 0 To frmTimeDepositOpen.cmbTenorType.ListCount
           If Mid(frmTimeDepositOpen.cmbTenorType.List(i), 1, 1) = tCode Then
              frmTimeDepositOpen.cmbTenorType.ListIndex = i
              Exit For
           End If
       Next i
    Else
       frmTimeDepositOpen.cmbTenorType.ListIndex = -1
    End If
    If i > frmTimeDepositOpen.cmbTenorType.ListCount Then
       frmTimeDepositOpen.cmbTenorType.ListIndex = -1
    End If
    frmTimeDepositOpen.txtTenor = Format(Val(recvTimeDepositDetailMsg.tenor), "##0")
    
    frmTimeDepositOpen.txtTDAmount = Format(Val(recvTimeDepositDetailMsg.depositAmt) / amtDenom, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
    If Not IsNumeric(Right(recvTimeDepositDetailMsg.maturityAmt, 1)) Then
       recvTimeDepositDetailMsg.maturityAmt = "-" & bmAmtToDbl(recvTimeDepositDetailMsg.maturityAmt)
    End If
    
    frmTimeDepositOpen.txtMaturityAmt = Format(Val(recvTimeDepositDetailMsg.maturityAmt) / amtDenom, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))

    frmTimeDepositOpen.txtCurrencyNo = Mid$(recvTimeDepositDetailMsg.debitAccNo, 1, 2)
    tCode = Mid$(recvTimeDepositDetailMsg.debitAccNo, 3, 3)
    If Len(RTrim(tCode)) <> 0 Then
       For i = 0 To frmTimeDepositOpen.cmbTdDebitMemo.ListCount
           If Mid(frmTimeDepositOpen.cmbTdDebitMemo.List(i), 1, 3) = tCode Then
              frmTimeDepositOpen.cmbTdDebitMemo.ListIndex = i
              Exit For
           End If
       Next i
    Else
       frmTimeDepositOpen.cmbTdDebitMemo.ListIndex = -1
    End If
    If i > frmTimeDepositOpen.cmbTdDebitMemo.ListCount Then
       frmTimeDepositOpen.cmbTdDebitMemo.ListIndex = -1
    End If
    frmTimeDepositOpen.txtCustomerNo = Mid$(recvTimeDepositDetailMsg.debitAccNo, 6, 7)
    frmTimeDepositOpen.txtSubAcc = Mid$(recvTimeDepositDetailMsg.debitAccNo, 13, 2)

    frmTimeDepositOpen.txtPayCurr = Mid$(recvTimeDepositDetailMsg.payAccNo, 1, 2)
    tCode = Mid$(recvTimeDepositDetailMsg.payAccNo, 3, 3)
    If Len(RTrim(tCode)) <> 0 Then
       For i = 0 To frmTimeDepositOpen.cmbPayLedger.ListCount
           If Mid(frmTimeDepositOpen.cmbPayLedger.List(i), 1, 3) = tCode Then
              frmTimeDepositOpen.cmbPayLedger.ListIndex = i
              Exit For
           End If
       Next i
    Else
       frmTimeDepositOpen.cmbPayLedger.ListIndex = -1
    End If
    If i > frmTimeDepositOpen.cmbPayLedger.ListCount Then
       frmTimeDepositOpen.cmbPayLedger.ListIndex = -1
    End If
    frmTimeDepositOpen.txtPayCustNo = Mid$(recvTimeDepositDetailMsg.payAccNo, 6, 7)
    frmTimeDepositOpen.txtPaySubAcc = Mid$(recvTimeDepositDetailMsg.payAccNo, 13, 2)
    
   
    frmTimeDepositOpen.txtFundingIntRate = Format(Val(recvTimeDepositDetailMsg.fundIntRate) / 1000000, "##0.000000")
    frmTimeDepositOpen.txtExRate = Format(Val(recvTimeDepositDetailMsg.exRate) / 100000000, "#####0.000000")
    
    ''Commented & Added by Mohit on 20-Feb-2007 as change reported by Arul
    ''exRate = Val(recvTimeDepositDetailMsg.exRate) / 100000000
    ''frmTimeDepositOpen.txtDebitAmt = Format(Val(frmTimeDepositOpen.txtTDAmount) * exRate, "##########0" & IIf(CInt(tDecimalPlace) <> 0, "." & String(CInt(tDecimalPlace), "0"), ""))
    tCode = Format(Mid$(recvTimeDepositDetailMsg.debitAccNo, 1, 2), "!@@")
    Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                              "where currencycode = '" & tCode & "'")

    If rs.recordCount > 0 Then
       drDecimalPlace = rs(0)
    Else
       drDecimalPlace = "2"
    End If

    If drDecimalPlace = "3" Then
       drAmtDenom = 1000
    ElseIf drDecimalPlace = "2" Then
       drAmtDenom = 100
    ElseIf drDecimalPlace = "1" Then
       drAmtDenom = 10
    Else
       drAmtDenom = 1
    End If
    
    If Not IsNumeric(Right(recvTimeDepositDetailMsg.debitAmt, 1)) Then
       recvTimeDepositDetailMsg.debitAmt = "-" & bmAmtToDbl(recvTimeDepositDetailMsg.debitAmt)
    End If
    frmTimeDepositOpen.txtDebitAmt = Format(Val(recvTimeDepositDetailMsg.debitAmt) / drAmtDenom, "##########0" & IIf(Val(drDecimalPlace) <> 0, "." & String(Val(drDecimalPlace), "0"), ""))
    ''till here
    
    If recvTimeDepositDetailMsg.newOrUpdate <> "U" Then
       If tdTellerAction Then
          If Mid$(frmTimeDepositOpen.cmbTDCurrency, 1, 2) <> "01" And frmTimeDepositOpen.txtCurrencyNo = "01" Then
             frmTimeDepositOpen.txtExRate.Enabled = True
          Else
             frmTimeDepositOpen.txtExRate.Enabled = False
          End If
        End If
    End If

    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    frmTimeDepositOpen.cmbValueDay = Mid$(recvTimeDepositDetailMsg.valueDate, 7, 2)
    frmTimeDepositOpen.cmbValueMonth = Mid$(recvTimeDepositDetailMsg.valueDate, 5, 2)
    frmTimeDepositOpen.txtValueYear = Mid$(recvTimeDepositDetailMsg.valueDate, 1, 4)
    ''till here
    
    frmTimeDepositOpen.cmbMaturityDate = Mid$(recvTimeDepositDetailMsg.maturityDate, 7, 2)
    frmTimeDepositOpen.cmbMaturityMonth = Mid$(recvTimeDepositDetailMsg.maturityDate, 5, 2)
    frmTimeDepositOpen.txtMaturityYear = Mid$(recvTimeDepositDetailMsg.maturityDate, 1, 4)
    
    If recvTimeDepositDetailMsg.autoRenewFlag = "1" Then
       frmTimeDepositOpen.optAutoRenew.Value = True
    Else
       frmTimeDepositOpen.optManualRenew.Value = True
    End If
    
    If recvTimeDepositDetailMsg.intAppln = "1" Then
       frmTimeDepositOpen.optPayAcc.Value = True
    Else
       frmTimeDepositOpen.optFixedDeposit.Value = True
    End If
    
End Sub

Public Function getCustomerAge(dobDate As String, dateType As String) As Integer
    Dim todayYear As Integer, dobYear As Integer
    Dim customerAge As Integer
    Dim todayMonth As Integer, dobMonth As Integer
    
    If dateType = "0" Then  ' HIJRI Date
       todayYear = Val(Mid$(currentHijriDate, 1, 4))
       todayMonth = Val(Mid$(currentHijriDate, 5, 2))
    Else
       todayYear = Val(Mid$(currentGregDate, 1, 4))
       todayMonth = Val(Mid$(currentGregDate, 5, 2))
    End If
    
    dobYear = Val(Mid$(dobDate, 1, 4))
    dobMonth = Val(Mid$(dobDate, 5, 2))
    customerAge = todayYear - dobYear
    If todayMonth < dobMonth Then
       customerAge = customerAge - 1
    End If
    
    getCustomerAge = customerAge

End Function
Public Sub formatBranchSwiftTransferEnqRequest(lastRecCount As String, reqdDate As String, branchCode As String)
    Dim strmsglen As String
    
    brSwiftTransferEnqMsg.msgLen = "000000"
    brSwiftTransferEnqMsg.service = "AN"
    brSwiftTransferEnqMsg.homeBranch = Format(gBranchCode, "!@@@@")
    brSwiftTransferEnqMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    brSwiftTransferEnqMsg.reqdDate = reqdDate
    brSwiftTransferEnqMsg.branchCode = Format(branchCode, "!@@@@")
    brSwiftTransferEnqMsg.lastRecCount = lastRecCount
    
    SendMsg = brSwiftTransferEnqMsg.msgLen & brSwiftTransferEnqMsg.service & brSwiftTransferEnqMsg.homeBranch & _
              brSwiftTransferEnqMsg.userId & brSwiftTransferEnqMsg.reqdDate & brSwiftTransferEnqMsg.branchCode & _
              brSwiftTransferEnqMsg.lastRecCount
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
End Sub
Public Sub parseBranchSwiftTransferDetails()
    Dim pos As Integer, i As Integer
    pos = 1
    recvBrSwiftTranferMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBrSwiftTranferMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBrSwiftTranferMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBrSwiftTranferMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBrSwiftTranferMsg.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvBrSwiftTranferMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    pos = pos + 50 ' for the filler
    For i = 1 To Val(recvBrSwiftTranferMsg.noOfRecs)
        recvBrSwiftTranferMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvBrSwiftTranferMsg.details(i).transRefNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvBrSwiftTranferMsg.details(i).transDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvBrSwiftTranferMsg.details(i).valueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvBrSwiftTranferMsg.details(i).drAccNo = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvBrSwiftTranferMsg.details(i).crAccNo = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvBrSwiftTranferMsg.details(i).transCurr = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvBrSwiftTranferMsg.details(i).transAmt = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvBrSwiftTranferMsg.details(i).senderName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvBrSwiftTranferMsg.details(i).recordStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        pos = pos + 50 ' for filler
    Next i
End Sub
Public Sub parseSarieTransferDetail()
    
    Dim pos As Integer
    
    pos = 1
    recvTransferDetail.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTransferDetail.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTransferDetail.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTransferDetail.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTransferDetail.transRefNo = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvTransferDetail.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTransferDetail.custName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvTransferDetail.drAccNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTransferDetail.issueDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvTransferDetail.valueDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvTransferDetail.transCurrCode = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTransferDetail.transAmt = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTransferDetail.paymentCurrCode = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTransferDetail.paymentAmt = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTransferDetail.transType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTransferDetail.paymentStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTransferDetail.applicantName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvTransferDetail.benefName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvTransferDetail.benefAddr1 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.benefAddr2 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.benefBank = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.correspondentBank = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.branchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvTransferDetail.message1 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.message2 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.message3 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.message4 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    
    ' The following fields are for SWIFT centralisation project
    recvTransferDetail.transferPurpose = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTransferDetail.applicantAddr1 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.applicantAddr2 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.applicantIdNo = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvTransferDetail.applicantAddr3 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.applicantCountryCode = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTransferDetail.ibanOrAccNo = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTransferDetail.benefAccNo = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.benefNationality = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTransferDetail.benefAddr3 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.benefBankAddr1 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.benefBankAddr2 = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.benefBankBICcode = Mid$(RecvStr, pos, 11)
    pos = pos + 11
    recvTransferDetail.exchangeRate = Mid$(RecvStr, pos, 12)
    pos = pos + 12
    recvTransferDetail.bankSortCode = Mid$(RecvStr, pos, 35)
    pos = pos + 35
    recvTransferDetail.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvTransferDetail.supervisorComments = Mid$(RecvStr, pos, 200)
    pos = pos + 200
    
End Sub
Public Sub fillFrmSwiftTransferDetail()

    Dim tCode As String
    Dim tDecimalPlace As String
    Dim tmpStr As String
    Dim coinDenomination As Integer
    Dim coinPrecision As Integer
    Dim amtToPrint As Double
    Dim tranAmt As Double
    
    frmSwiftTransferDetail.txtTransRefNo = recvTransferDetail.transRefNo
    frmSwiftTransferDetail.cmbTransDate = Mid$(recvTransferDetail.issueDate, 7, 2)
    frmSwiftTransferDetail.cmbTransMonth = Mid$(recvTransferDetail.issueDate, 5, 2)
    frmSwiftTransferDetail.txtTransYear = Mid$(recvTransferDetail.issueDate, 1, 4)
    
    tCode = recvTransferDetail.transCurrCode
    Set rs = db.OpenRecordset("select arabicname, englishname,decimalplace from currencyinfo " & _
                              "where isocurrcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       tDecimalPlace = rs(2)
    Else
       tDecimalPlace = "2"
    End If
    If tDecimalPlace = "3" Then
       coinPrecision = 3
       coinDenomination = 1000
    ElseIf tDecimalPlace = "2" Then
       coinPrecision = 2
       coinDenomination = 100
    ElseIf tDecimalPlace = "1" Then
       coinPrecision = 1
       coinDenomination = 10
    Else
       coinPrecision = 0
       coinDenomination = 1
    End If
    
    If Len(Trim(recvTransferDetail.transAmt)) = 0 Then
       recvTransferDetail.transAmt = "0"
    End If
   
    If Not IsNumeric(Right(Trim(recvTransferDetail.transAmt), 1)) Then
       tmpStr = "-" & bmAmtToDbl(recvTransferDetail.transAmt)
       tranAmt = CDbl(tmpStr)
    Else
       tranAmt = CDbl(recvTransferDetail.transAmt)
    End If
        
    amtToPrint = tranAmt / coinDenomination
    frmSwiftTransferDetail.txtTransAmt = recvTransferDetail.transCurrCode & "  " & _
                                         Format(Format(amtToPrint, "##,###,###,###,##0" & _
                                         IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
        
    frmSwiftTransferDetail.txtDebitAccNo = recvTransferDetail.accNo
    tCode = recvTransferDetail.transferPurpose
    Set rs = db.OpenRecordset("select arabicname, englishname from transferPurposeInfo " & _
                              "where purposecode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSwiftTransferDetail.cmbTransferPurpose = tCode & "-" & rs(0)
       Else
          frmSwiftTransferDetail.cmbTransferPurpose = tCode & "-" & rs(1)
       End If
    Else
       frmSwiftTransferDetail.cmbTransferPurpose = tCode & "-Not defined in Local"
    End If
    'frmSwiftTransferDetail.txtCustName = recvTransferDetail.custName
    
    frmSwiftTransferDetail.txtApplicantAccNo = recvTransferDetail.drAccNo
    
    frmSwiftTransferDetail.txtApplicantName = Trim(recvTransferDetail.applicantName)
    
    frmSwiftTransferDetail.txtApplicantAddr1 = Trim(recvTransferDetail.applicantAddr1)
    frmSwiftTransferDetail.txtApplicantAddr2 = Trim(recvTransferDetail.applicantAddr2)
    frmSwiftTransferDetail.txtApplicantAddr3 = Trim(recvTransferDetail.applicantAddr3)
    tCode = recvTransferDetail.applicantCountryCode
    Set rs = db.OpenRecordset("select arabicname, englishname from countryinfo " & _
                              "where countrycode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSwiftTransferDetail.cmbApplicantNationality = tCode & "-" & rs(0)
       Else
          frmSwiftTransferDetail.cmbApplicantNationality = tCode & "-" & rs(1)
       End If
    Else
       frmSwiftTransferDetail.cmbApplicantNationality = tCode & "-Not defined in Local"
    End If
    frmSwiftTransferDetail.txtApplicantIdNo = Trim(recvTransferDetail.applicantIdNo)
    frmSwiftTransferDetail.txtBenefName = Trim(recvTransferDetail.benefName)
    If recvTransferDetail.ibanOrAccNo = "I" Then
       frmSwiftTransferDetail.optIban.Value = True
    Else
       frmSwiftTransferDetail.optAccNo.Value = True
    End If
    
    frmSwiftTransferDetail.txtBenefAccNo = Trim(recvTransferDetail.benefAccNo)
    frmSwiftTransferDetail.txtBankName = Trim(recvTransferDetail.correspondentBank)
    frmSwiftTransferDetail.txtBenefAddr1 = Trim(recvTransferDetail.benefAddr1)
    frmSwiftTransferDetail.txtBenefAddr2 = Trim(recvTransferDetail.benefAddr2)
    frmSwiftTransferDetail.txtBenefAddr3 = Trim(recvTransferDetail.benefAddr3)
    tCode = recvTransferDetail.benefNationality
    Set rs = db.OpenRecordset("select englishname from swiftcountryinfo " & _
                              "where countrycode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       frmSwiftTransferDetail.cmbNationality = tCode & "-" & rs(0)
    Else
       frmSwiftTransferDetail.cmbNationality = tCode & "-Not defined in Local"
    End If
    
    'frmSwiftTransferDetail.txtBenefIdNo = Trim(recvTransferDetail.benefIdNo)
    frmSwiftTransferDetail.txtBenefBankAddr1 = Trim(recvTransferDetail.benefBankAddr1)
    frmSwiftTransferDetail.txtBenefBankAddr2 = Trim(recvTransferDetail.benefBankAddr2)
    frmSwiftTransferDetail.txtBankSortCode = Trim(recvTransferDetail.bankSortCode)
    frmSwiftTransferDetail.txtBankBICcode = Trim(recvTransferDetail.benefBankBICcode)
'    tCode = recvTransferDetail.benefBankCountryCode
'    Set rs = db.OpenRecordset("select englishname from swiftcountryinfo " & _
'                              "where countrycode = '" & tCode & "'")
'    If rs.recordCount > 0 Then
'       frmSwiftTransferDetail.cmbBankCountryCode = tCode & "-" & rs(0)
'    Else
'       frmSwiftTransferDetail.cmbBankCountryCode = tCode & "-Not defined in Local"
'    End If
    
   
    
'    tCode = recvTransferDetail.transtype
'    Set rs = db.OpenRecordset("select arabicname, englishname from transfertypeinfo " & _
'                              "where transfertypecode = '" & tCode & "'")
'    If rs.recordCount > 0 Then
'       If UserLang = ARABIC Then
'          frmSwiftTransferDetail.txtTransferType = tCode & "-" & rs(0)
'       Else
'          frmSwiftTransferDetail.txtTransferType = tCode & "-" & rs(1)
'       End If
'    Else
'       frmSwiftTransferDetail.txtTransferType = tCode & "-Not defined in Local"
'    End If
    
    tCode = recvTransferDetail.branchCode
    Set rs = db.OpenRecordset("select arabicname, englishname from branchinfo " & _
                              "where branchcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSwiftTransferDetail.txtBranchCode = tCode & "-" & rs(0)
       Else
          frmSwiftTransferDetail.txtBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmSwiftTransferDetail.txtBranchCode = tCode & "-Not defined in Local"
    End If
    
'    frmSwiftTransferDetail.txtMessage1 = recvTransferDetail.message1
'    frmSwiftTransferDetail.txtMessage2 = recvTransferDetail.message2
'    frmSwiftTransferDetail.txtMessage3 = recvTransferDetail.message3
'    frmSwiftTransferDetail.txtMessage4 = recvTransferDetail.message4
End Sub

Public Sub formatSwiftTransferPendingListRequest(activityFlag As String, lastRecCount As String, transRefNo As String)
    Dim strmsglen As String
    
    swiftTransferPendingList.msgLen = "000000"
    swiftTransferPendingList.service = "AP"
    swiftTransferPendingList.homeBranch = Format(gBranchCode, "!@@@@")
    swiftTransferPendingList.userId = Format(gUserId, "!@@@@@@@@@@")
    swiftTransferPendingList.activityFlag = activityFlag
    swiftTransferPendingList.transRefNo = transRefNo
    swiftTransferPendingList.lastRecCount = lastRecCount
    
    SendMsg = swiftTransferPendingList.msgLen & swiftTransferPendingList.service & swiftTransferPendingList.homeBranch & _
              swiftTransferPendingList.userId & swiftTransferPendingList.lastRecCount & swiftTransferPendingList.activityFlag & _
              swiftTransferPendingList.transRefNo & Space(50)
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
End Sub
Public Sub parseSwiftTransferPendingListDetails()
    Dim pos As Integer, i As Integer
    pos = 1
    recvSwiftTransferPendingList.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSwiftTransferPendingList.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSwiftTransferPendingList.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSwiftTransferPendingList.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSwiftTransferPendingList.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvSwiftTransferPendingList.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    pos = pos + 50 ' for the filler
    For i = 1 To Val(recvSwiftTransferPendingList.noOfRecs)
        recvSwiftTransferPendingList.details(i).userId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvSwiftTransferPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvSwiftTransferPendingList.details(i).transRefNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvSwiftTransferPendingList.details(i).issueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvSwiftTransferPendingList.details(i).applicantName = Mid$(RecvStr, pos, 35)
        pos = pos + 35
        recvSwiftTransferPendingList.details(i).benefName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvSwiftTransferPendingList.details(i).branchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        pos = pos + 50 ' for filler
    Next i
End Sub

Public Function validateIBAN(IBAN_code As String, returnStr As String) As Boolean
    Dim tCode As String
    Dim bbanAccNo As String
    Dim tmpInt As Integer
    Dim tmpStr As String
    Dim i As Integer
    Dim sFirstHalf As String, sSecondHalf As String
    Dim iRemainder As Integer
    
    IBAN_code = Trim(IBAN_code)
        
    IBAN_code = UCase(IBAN_code)
    
    For i = 1 To Len(IBAN_code)
        If (Mid$(IBAN_code, i, 1) >= "A" And Mid$(IBAN_code, i, 1) <= "Z") Or _
           (Mid$(IBAN_code, i, 1) >= "0" And Mid$(IBAN_code, i, 1) <= "9") Then
        Else
           returnStr = errInvalidCharAtIban(UserLang)  '"IBAN should contain only alphanumeric values.. No special characters allowed..."
           validateIBAN = False
           Exit Function
        End If
    Next
    
    tmpStr = Mid$(IBAN_code, 1, 2)
    For i = 1 To Len(tmpStr)
        tCode = Mid$(tmpStr, i, 1)
        If Not (tCode >= "A" And tCode <= "Z") Then
           returnStr = errInvalidFirstTwoCharsInIban(UserLang)  '"The First two characters in an IBAN should a valid country code..Please check"
           validateIBAN = False
           Exit Function
        End If
    Next
    
    tmpStr = Mid$(IBAN_code, 3, 2)
    For i = 1 To Len(tmpStr)
        tCode = Mid$(tmpStr, i, 1)
        If Not (tCode >= "0" And tCode <= "9") Then
           returnStr = errInvalid3rd4thCharsInIban(UserLang) '"The third and fourth character of IBAN should be numeric character.. Please check"
           validateIBAN = False
           Exit Function
        End If
    Next
    
    bbanAccNo = Mid$(IBAN_code, 5)
    
'    Set rs = db.OpenRecordset("select ibanLength from swiftCountryInfo where countryCode='" & _
'                                    Mid$(IBAN_code, 1, 2) & "'")
    
    IBAN_code = Mid$(IBAN_code, 5) & Mid$(IBAN_code, 1, 4)
    tmpStr = ""
    For i = 1 To Len(IBAN_code)
        tCode = Mid$(IBAN_code, i, 1)
        If tCode >= "A" And tCode <= "Z" Then
           tmpInt = Asc(tCode) - 55
           tmpStr = tmpStr & Trim(str(tmpInt))
        Else
           tmpStr = tmpStr & tCode
        End If
    Next

    sSecondHalf = tmpStr
    Do While True
        If Len(sSecondHalf) > 9 Then
           sFirstHalf = Mid$(sSecondHalf, 1, 9)
           sSecondHalf = Mid$(sSecondHalf, 10)
           iRemainder = CLng(sFirstHalf) Mod 97
           sSecondHalf = Trim(str(iRemainder)) & sSecondHalf
        Else
           iRemainder = CLng(sSecondHalf) Mod 97
           Exit Do
        End If
    Loop
    
    If iRemainder = 1 Then
       returnStr = "Valid IBAN Number"
       validateIBAN = True
    Else
       returnStr = errInvalidIbanAcc(UserLang)
       validateIBAN = False
    End If
End Function

Public Sub formatSwiftTransferEnqRequest(lastRecCount As String, reqdDate As String, branchCode As String, requestType As String)
    Dim strmsglen As String
    
    swiftTransferEnqMsg.msgLen = "000000"
    swiftTransferEnqMsg.service = "AS"
    swiftTransferEnqMsg.homeBranch = Format(gBranchCode, "!@@@@")
    swiftTransferEnqMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    swiftTransferEnqMsg.reqdDate = reqdDate
    swiftTransferEnqMsg.branchCode = Format(branchCode, "!@@@@")
    swiftTransferEnqMsg.lastRecCount = lastRecCount
    swiftTransferEnqMsg.requestType = requestType
    
    SendMsg = swiftTransferEnqMsg.msgLen & swiftTransferEnqMsg.service & _
              swiftTransferEnqMsg.homeBranch & swiftTransferEnqMsg.userId & _
              swiftTransferEnqMsg.lastRecCount & swiftTransferEnqMsg.reqdDate & _
              swiftTransferEnqMsg.branchCode & swiftTransferEnqMsg.requestType & _
              Space(50)

             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
End Sub
Public Sub parseSwiftTransferEnquiryDetails()
    Dim pos As Integer, i As Integer
    pos = 1
    recvSwiftTranferEnqMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSwiftTranferEnqMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSwiftTranferEnqMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSwiftTranferEnqMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSwiftTranferEnqMsg.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvSwiftTranferEnqMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSwiftTranferEnqMsg.reqdDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvSwiftTranferEnqMsg.requestType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    pos = pos + 50 ' for the filler
    For i = 1 To Val(recvSwiftTranferEnqMsg.noOfRecs)
        recvSwiftTranferEnqMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvSwiftTranferEnqMsg.details(i).transRefNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvSwiftTranferEnqMsg.details(i).transDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvSwiftTranferEnqMsg.details(i).valueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvSwiftTranferEnqMsg.details(i).transCurr = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvSwiftTranferEnqMsg.details(i).transAmt = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvSwiftTranferEnqMsg.details(i).pendingStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvSwiftTranferEnqMsg.details(i).drAccNo = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvSwiftTranferEnqMsg.details(i).senderName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvSwiftTranferEnqMsg.details(i).homeBranch = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvSwiftTranferEnqMsg.details(i).csoUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvSwiftTranferEnqMsg.details(i).csoActionDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvSwiftTranferEnqMsg.details(i).supervisorId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvSwiftTranferEnqMsg.details(i).approvedDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        pos = pos + 50 ' for filler
    Next i
End Sub
Public Sub parseBillRequestMsg()
    Dim pos As Long
    Dim i As Integer
    Dim noOfRecs As Integer
    
    pos = 1
    recvBillEnqMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBillEnqMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBillEnqMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBillEnqMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBillEnqMsg.langInd = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvBillEnqMsg.statusCode = Mid$(RecvStr, pos, 6)
    pos = pos + 6
    recvBillEnqMsg.errorCode = Mid$(RecvStr, pos, 6)
    pos = pos + 6
    recvBillEnqMsg.text = Mid$(RecvStr, pos, 100)
    pos = pos + 100
    recvBillEnqMsg.recordCount = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    noOfRecs = Val(recvBillEnqMsg.recordCount)
    If noOfRecs > 100 Then ' to avoid overflow error
       noOfRecs = 100
    End If
    For i = 1 To noOfRecs
        recvBillEnqMsg.billInfo(i).billStatusCode = Mid$(RecvStr, pos, 15)
        pos = pos + 15
        recvBillEnqMsg.billInfo(i).bankPaymentId = Mid$(RecvStr, pos, 32)
        pos = pos + 32
        recvBillEnqMsg.billInfo(i).sadadPaymentId = Mid$(RecvStr, pos, 32)
        pos = pos + 32
        recvBillEnqMsg.billInfo(i).paymentStatusCode = Mid$(RecvStr, pos, 15)
        pos = pos + 15
        recvBillEnqMsg.billInfo(i).currentAmount = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).effectiveDate = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).exactPaymentReqd = Mid$(RecvStr, pos, 5)
        pos = pos + 5
        recvBillEnqMsg.billInfo(i).customerId = Mid$(RecvStr, pos, 32)
        pos = pos + 32
        recvBillEnqMsg.billInfo(i).customerType = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvBillEnqMsg.billInfo(i).messageText = Mid$(RecvStr, pos, 20)
        pos = pos + 20
        recvBillEnqMsg.billInfo(i).billCategory = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvBillEnqMsg.billInfo(i).serviceType = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvBillEnqMsg.billInfo(i).billCycle = Mid$(RecvStr, pos, 16)
        pos = pos + 16
        recvBillEnqMsg.billInfo(i).billNumber = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).billingAcct = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).companyId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvBillEnqMsg.billInfo(i).amountDue = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).billDueDate = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).billOpenDate = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).billCloseDate = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).billExpiryDate = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvBillEnqMsg.billInfo(i).billCheckDigit = Mid$(RecvStr, pos, 2)
        pos = pos + 2
        recvBillEnqMsg.billInfo(i).billRefInfo = Mid$(RecvStr, pos, 20)
        pos = pos + 20
    Next
End Sub

Public Sub parseBillPaymentMsg()
    Dim pos As Long
    pos = 1
    recvBillPaymentMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBillPaymentMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBillPaymentMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBillPaymentMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBillPaymentMsg.transRefNo = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvBillPaymentMsg.contraAccNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvBillPaymentMsg.aNarrative1 = Mid$(RecvStr, pos, 25)
    pos = pos + 25
    recvBillPaymentMsg.eNarrative1 = Mid$(RecvStr, pos, 25)
    pos = pos + 25
    recvBillPaymentMsg.custName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvBillPaymentMsg.customerBranch = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvBillPaymentMsg.contraCustName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvBillPaymentMsg.transDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvBillPaymentMsg.valueDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvBillPaymentMsg.narrative3 = Mid$(RecvStr, pos, 25)
    pos = pos + 25
    recvBillPaymentMsg.msgStatusCode = Mid$(RecvStr, pos, 6)
    pos = pos + 6
    recvBillPaymentMsg.paymentStatusCode = Mid$(RecvStr, pos, 6)
    pos = pos + 6
End Sub

Public Sub parseBillReversalMsg()
    Dim pos As Long
    pos = 1
    recvBillReversalMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBillReversalMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBillReversalMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBillReversalMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBillReversalMsg.userId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvBillReversalMsg.tellerId = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBillReversalMsg.companyId = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvBillReversalMsg.subscriptionNo = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillReversalMsg.billNo = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillReversalMsg.langInd = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvBillReversalMsg.paymentType = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvBillReversalMsg.drAccNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvBillReversalMsg.billAmt = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillReversalMsg.transRefNo = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvBillReversalMsg.cashOrAcc = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvBillReversalMsg.preOrPostpaid = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvBillReversalMsg.custName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
End Sub

Public Sub formatSadadReversalPendingListRequest(lastRecCount As String, pendingFlag As String, transRefNo As String)
    Dim strmsglen As String
    
    sadadReversalPendingList.msgLen = "000000"
    sadadReversalPendingList.service = "AX"
    sadadReversalPendingList.homeBranch = Format(gBranchCode, "!@@@@")
    sadadReversalPendingList.userId = Format(gUserId, "!@@@@@@@@@@")
    sadadReversalPendingList.lastRecCount = lastRecCount
    sadadReversalPendingList.pendingFlag = pendingFlag
    sadadReversalPendingList.transRefNo = transRefNo
        
    SendMsg = sadadReversalPendingList.msgLen & sadadReversalPendingList.service & sadadReversalPendingList.homeBranch & _
              sadadReversalPendingList.userId & sadadReversalPendingList.lastRecCount & _
              sadadReversalPendingList.pendingFlag & sadadReversalPendingList.transRefNo & Space(50)
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
End Sub
Public Sub parseSadadReversalPendingListDetails()
    Dim pos As Integer, i As Integer
    pos = 1
    recvSadadReversalPendingList.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSadadReversalPendingList.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSadadReversalPendingList.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSadadReversalPendingList.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSadadReversalPendingList.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvSadadReversalPendingList.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    pos = pos + 50 ' for the filler
    For i = 1 To Val(recvSadadReversalPendingList.noOfRecs)
        recvSadadReversalPendingList.details(i).userId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvSadadReversalPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvSadadReversalPendingList.details(i).tellerId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvSadadReversalPendingList.details(i).transRefNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvSadadReversalPendingList.details(i).billerId = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvSadadReversalPendingList.details(i).subsNo = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvSadadReversalPendingList.details(i).billAmt = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        pos = pos + 50 ' for filler
    Next i
End Sub

Public Function displayIban(ibanStr As String) As String

    If Len(Trim(ibanStr)) > 0 And Mid$(ibanStr, 1, 6) <> "000000" Then
      displayIban = Mid$(ibanStr, 1, 4) & " " & Mid$(ibanStr, 5, 4) & " " & _
                    Mid$(ibanStr, 9, 4) & " " & Mid$(ibanStr, 13, 4) & " " & _
                    Mid$(ibanStr, 17, 4) & " " & Mid$(ibanStr, 21, 4)
    Else
       displayIban = Space(24)
    End If
End Function

Public Sub parseEstmtStatusMsg()
    Dim pos As Integer
    pos = 1
    recvEstmtStatusMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvEstmtStatusMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvEstmtStatusMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvEstmtStatusMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvEstmtStatusMsg.custNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvEstmtStatusMsg.custName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvEstmtStatusMsg.branchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvEstmtStatusMsg.emailAddress = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvEstmtStatusMsg.stmtDeliveryMode = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvEstmtStatusMsg.supervisorComments = Mid$(RecvStr, pos, 200)
    pos = pos + 200
End Sub

Public Sub fillFrmEstmtRegn()
    Dim tCode As String, mQry As String

    frmEstmtRegn.txtCustNo = recvEstmtStatusMsg.custNo
    frmEstmtRegn.txtCustName = recvEstmtStatusMsg.custName
    
    tCode = recvEstmtStatusMsg.branchCode
    
    mQry = "select arabicname, englishname from branchinfo " & _
           "where branchcode = '" & tCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmEstmtRegn.cmbBranchCode = tCode & "-" & rs(0)
       Else
          frmEstmtRegn.cmbBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmEstmtRegn.cmbBranchCode.text = tCode & "Not defined in local"
    End If
    
    frmEstmtRegn.txtEmailAddr = Trim(recvEstmtStatusMsg.emailAddress)
    
    If recvEstmtStatusMsg.stmtDeliveryMode = "1" Then
       frmEstmtRegn.optEnabled.Value = True
    Else
       frmEstmtRegn.optDisabled.Value = True
    End If
    
End Sub
Public Function maskCardNo(cardNo As String) As String
    Dim cardLength As Integer
    
    cardLength = Len(Trim(cardNo))
    If cardLength > 0 Then
       If cardLength = 16 Then
          maskCardNo = Mid$(cardNo, 1, 6) & "XXXXXX" & Mid$(cardNo, 13, 4)
       ElseIf cardLength = 19 Then
          maskCardNo = Mid$(cardNo, 1, 6) & "XXXXXXXXX" & Mid$(cardNo, 16, 4)
       End If
    Else
       maskCardNo = Space(19)
    End If
End Function


