Attribute VB_Name = "search"
Option Explicit

Public Function doSearch(lastRecCount As String) As String
    Dim strmsglen As String * 6
    Dim userId As String * 10
    Dim custNo As String * 7
    Dim idType As String * 1
    Dim idNo As String * 15
    Dim phoneNo As String * 10
    Dim phoneExt As String * 4
    Dim firstName As String * 15
    Dim secondName As String * 15
    Dim lastName As String * 15
    Dim tmpMainCategory As String * 2
    Dim tmpSubCategory As String * 2
    Dim crNo As String * 15
    Dim branchCode As String * 4
    Dim cardNo As String * 19
    Dim mobileNo As String * 10
    Dim status As String * 3
    Dim recvLastRecCount As String * 5
    Dim currentPosition As Integer
    Dim tmpStr As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    If Len(RTrim(frmEnquiry.txtAccountNumber)) > 0 Then
       custNo = Format(Mid$(frmEnquiry.txtAccountNumber, 6, 7), "0000000")
    Else
       custNo = Format(frmEnquiry.txtCustomerNo, "0000000")
    End If
    idType = " "
'    If frmEnquiry.cmbIdType.ListIndex = 0 Then
'        idType = "I"
'    ElseIf frmEnquiry.cmbIdType.ListIndex = 1 Then
'        idType = "Q"
'    ElseIf frmEnquiry.cmbIdType.ListIndex = 2 Then
'        idType = "P"
'    ElseIf frmEnquiry.cmbIdType.ListIndex = 3 Then
'        idType = "H"
'    ElseIf frmEnquiry.cmbIdType.ListIndex = 4 Then
'        idType = "O"
'    End If
    idNo = Format(frmEnquiry.txtIdNo, "!@@@@@@@@@@@@@@@")
    phoneNo = Format(frmEnquiry.txtPhone, "!@@@@@@@@@@")
    phoneExt = Format(frmEnquiry.txtPhoneExt, "!@@@@")
    firstName = Format(frmEnquiry.txtFirstName, "!@@@@@@@@@@@@@@@")
    secondName = Format(frmEnquiry.txtSecondName, "!@@@@@@@@@@@@@@@")
    lastName = Format(frmEnquiry.txtLastName, "!@@@@@@@@@@@@@@@")
    crNo = Format(frmEnquiry.txtCrNo, "!@@@@@@@@@@@@@@@")
    tmpMainCategory = Mid$(frmEnquiry.cmbMainCategory, 1, 2)
    tmpSubCategory = Mid$(frmEnquiry.cmbSubCategory, 1, 2)
    branchCode = Mid$(frmEnquiry.cmbBranch, 1, 4)
    cardNo = Format(frmEnquiry.txtCardNumber, "!@@@@@@@@@@@@@@@@@@@")
    mobileNo = Format(frmEnquiry.txtMobileNo, "!@@@@@@@@@@")
    CSD_mdiForm.staticStatus.Panels(3).text = errSearchInProgress(UserLang)
    SendMsg = "000090" & "16" & gBranchCode & userId & lastRecCount & custNo & idType & _
               idNo & phoneNo & phoneExt & firstName & secondName & _
               lastName & crNo & tmpMainCategory & tmpSubCategory & branchCode & cardNo & mobileNo & _
               Space(10)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    frmEnquiry.cmdAcctInfo.Enabled = False
    frmEnquiry.cmdAtmCard.Enabled = False
    frmEnquiry.cmdPenEnquiry.Enabled = False
    frmEnquiry.cmdMerchant.Enabled = False
    frmEnquiry.cmdBillEnq.Enabled = False
    frmEnquiry.cmdNameSearch.Enabled = False
    recvSearchMsg.status = "    "
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       If InStr(recvLoginMsg.authorityLevel, "~0") > 0 Then
          frmEnquiry.cmdCustomer.Enabled = True
       End If
       If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
          frmEnquiry.cmdAtmCard.Enabled = True
       End If
       frmEnquiry.cmdBillEnq.Enabled = True
       If InStr(recvLoginMsg.authorityLevel, "~6") > 0 Then
          frmEnquiry.cmdAcctInfo.Enabled = True
          'frmEnquiry.cmdPenEnquiry.Enabled = True
       End If
       If InStr(recvLoginMsg.authorityLevel, "~81") > 0 Then
          frmEnquiry.cmdMerchant.Enabled = True
       End If
       If nameSearchAllowedAtBranch = True Then
          frmEnquiry.cmdNameSearch.Enabled = True
       Else
          frmEnquiry.cmdNameSearch.Enabled = False
       End If
       
       CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
       Exit Function
    End If
    parseSearchMsg
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    If InStr(recvLoginMsg.authorityLevel, "~0") > 0 Then
       frmEnquiry.cmdCustomer.Enabled = True
    End If
    If InStr(recvLoginMsg.authorityLevel, "~4") <> 0 Then
       frmEnquiry.cmdAtmCard.Enabled = True
    End If
    If InStr(recvLoginMsg.authorityLevel, "~6") <> 0 Then
       frmEnquiry.cmdAcctInfo.Enabled = True
       'frmEnquiry.cmdPenEnquiry.Enabled = True
    End If
    If InStr(recvLoginMsg.authorityLevel, "~81") <> 0 Then
       frmEnquiry.cmdMerchant.Enabled = True
    End If
    If nameSearchAllowedAtBranch = True Then
       frmEnquiry.cmdNameSearch.Enabled = True
    Else
       frmEnquiry.cmdNameSearch.Enabled = False
    End If
    frmEnquiry.cmdBillEnq.Enabled = True
    status = Mid$(RecvStr, 1, 3)
    If status <> Success Then
        If UserLang = ARABIC Then
            MsgBox Mid$(RecvStr, 6, 50)
        Else
            MsgBox Mid$(RecvStr, 56, 50)
        End If
        CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
        doSearch = "-0001"
        Exit Function
    End If
    If recvSearchMsg.incompleteFlag = "1" Then
       MsgBox errSearchNotCompleted(UserLang)
    End If
    recvLastRecCount = Mid$(RecvStr, 106, 5)
        
    currentPosition = 0
    
    CSD_mdiForm.staticStatus.Panels(3).text = ""
    doSearch = recvLastRecCount
End Function

Public Function parseSearchMsg() As String
     Dim i, pos As Integer
     
     recvSearchMsg.status = Mid$(RecvStr, 1, 3)
     recvSearchMsg.service = Mid$(RecvStr, 4, 2)
     recvSearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
     recvSearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
     recvSearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
     recvSearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
     recvSearchMsg.incompleteFlag = Mid$(RecvStr, 113, 1)
     recvSearchMsg.filler = Mid$(RecvStr, 114, 10)
     pos = 124
     For i = 1 To Val(recvSearchMsg.noOfRecs)
         recvSearchMsg.details(i).custNo = Mid$(RecvStr, pos, 7)
         pos = pos + 7
         recvSearchMsg.details(i).idType = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvSearchMsg.details(i).idNo = Mid$(RecvStr, pos, 15)
         pos = pos + 15
         recvSearchMsg.details(i).telNo = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvSearchMsg.details(i).telExt = Mid$(RecvStr, pos, 4)
         pos = pos + 4
         recvSearchMsg.details(i).lastName = Mid$(RecvStr, pos, 15)
         pos = pos + 15
         recvSearchMsg.details(i).secondName = Mid$(RecvStr, pos, 15)
         pos = pos + 15
         recvSearchMsg.details(i).firstName = Mid$(RecvStr, pos, 15)
         pos = pos + 15
         recvSearchMsg.details(i).shortName = RTrim(Mid$(RecvStr, pos, 30))
         pos = pos + 30
         recvSearchMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
         pos = pos + 4
         recvSearchMsg.details(i).mainCategoryCode = Mid$(RecvStr, pos, 2)
         pos = pos + 2
         recvSearchMsg.details(i).subCategoryCode = Mid$(RecvStr, pos, 2)
         pos = pos + 2
    Next i
    parseSearchMsg = Success
End Function

Private Sub writeResultInLocalDb()

    Dim mQry As String
    Dim i, startingRecNo
    
    Set rs = db.OpenRecordset("select max(recNo) from searchDetails")
    i = 1
    If rs(0) <> 0 Then
       startingRecNo = rs(0) + 1
    Else
       startingRecNo = 1
    End If
    
    For i = 1 To 10
      If recvSearchMsg.details(i).custNo = Space(7) Then
         Exit For
      End If
      mQry = _
      "insert into searchdetails values (" + CStr(startingRecNo) + _
      "," + "'" + recvSearchMsg.details(i).custNo + "'" + _
      "," + "'" + recvSearchMsg.details(i).idType + "'" + "," + "'" + recvSearchMsg.details(i).idNo + "'" + _
      "," + "'" + recvSearchMsg.details(i).telNo + "'" + "," + "'" + recvSearchMsg.details(i).telExt + "'" + _
      "," + "'" + recvSearchMsg.details(i).lastName + "'" + "," + "'" + recvSearchMsg.details(i).firstName + "'" + _
      "," + "'" + recvSearchMsg.details(i).shortName + "'" + "," + "'" + recvSearchMsg.details(i).poBox + "'" + _
      "," + "'" + recvSearchMsg.details(i).city + "'" + ")"
        
      db.Execute (mQry)
      
      ' error handling needs to be done  - Rajesh
      startingRecNo = startingRecNo + 1
    Next
    
End Sub

Public Function doAccSearch(lastRecCount As String) As String
   Dim userId As String * 10
   Dim custNo As String * 7
   Dim accNo As String * 14
   Dim cardNo As String * 19
   Dim strmsglen As String
   
   userId = Format(gUserId, "!@@@@@@@@@@")
   custNo = Format(frmEnquiry.txtCustomerNo, "0000000")
   accNo = Format(frmEnquiry.txtAccountNumber, "!@@@@@@@@@@@@@@")
   cardNo = Format(frmEnquiry.txtCardNumber, "!@@@@@@@@@@@@@@@@@@@")
   SendMsg = "000090" & "21" & gBranchCode & userId & lastRecCount & custNo & accNo & cardNo
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmEnquiry.MousePointer = vbHourglass
   frmEnquiry.cmdAcctInfo.Enabled = False
   frmEnquiry.cmdPenEnquiry.Enabled = False
   frmEnquiry.cmdCustomer.Enabled = False
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdAtmCard.Enabled = False
   frmEnquiry.cmdMerchant.Enabled = False
   frmEnquiry.cmdBillEnq.Enabled = False
    
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmEnquiry.MousePointer = vbDefault
      frmEnquiry.cmdAcctInfo.Enabled = True
      'frmEnquiry.cmdPenEnquiry.Enabled = True
      If InStr(recvLoginMsg.authorityLevel, "~0") > 0 Then
         frmEnquiry.cmdCustomer.Enabled = True
      End If
      frmEnquiry.cmdCancel.Enabled = True
      frmEnquiry.cmdBillEnq.Enabled = True
      If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
         frmEnquiry.cmdAtmCard.Enabled = True
      End If
      If InStr(recvLoginMsg.authorityLevel, "~81") <> 0 Then
         frmEnquiry.cmdMerchant.Enabled = True
      End If
      If nameSearchAllowedAtBranch = True Then
         frmEnquiry.cmdNameSearch.Enabled = True
      Else
         frmEnquiry.cmdNameSearch.Enabled = False
      End If
      doAccSearch = "-0001"
      Exit Function
   End If
   parseAccSearchMsg
   
   If recvAccSearchMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvAccSearchMsg.aRemarks
      Else
         MsgBox recvAccSearchMsg.eRemarks
      End If
      doAccSearch = "-0001"
      frmEnquiry.MousePointer = vbDefault
      frmEnquiry.cmdAcctInfo.Enabled = True
      'frmEnquiry.cmdPenEnquiry.Enabled = True
      If InStr(recvLoginMsg.authorityLevel, "~0") > 0 Then
         frmEnquiry.cmdCustomer.Enabled = True
      End If
      frmEnquiry.cmdCancel.Enabled = True
      frmEnquiry.cmdBillEnq.Enabled = True
      If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
         frmEnquiry.cmdAtmCard.Enabled = True
      End If
      If InStr(recvLoginMsg.authorityLevel, "~81") <> 0 Then
         frmEnquiry.cmdMerchant.Enabled = True
      End If
      If nameSearchAllowedAtBranch = True Then
         frmEnquiry.cmdNameSearch.Enabled = True
      Else
         frmEnquiry.cmdNameSearch.Enabled = False
      End If
      Exit Function
   End If
   frmEnquiry.MousePointer = vbDefault
   frmEnquiry.cmdAcctInfo.Enabled = True
   'frmEnquiry.cmdPenEnquiry.Enabled = True
   If InStr(recvLoginMsg.authorityLevel, "~0") > 0 Then
      frmEnquiry.cmdCustomer.Enabled = True
   End If
   frmEnquiry.cmdCancel.Enabled = True
   frmEnquiry.cmdBillEnq.Enabled = True
   If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
      frmEnquiry.cmdAtmCard.Enabled = True
   End If
   If InStr(recvLoginMsg.authorityLevel, "~81") <> 0 Then
      frmEnquiry.cmdMerchant.Enabled = True
   End If
   If nameSearchAllowedAtBranch = True Then
      frmEnquiry.cmdNameSearch.Enabled = True
   Else
     frmEnquiry.cmdNameSearch.Enabled = False
   End If

   doAccSearch = recvAccSearchMsg.lastRecCount
End Function

Public Function parseAccSearchMsg() As String
     Dim i, pos As Integer
     pos = 1
     
     recvAccSearchMsg.status = Mid$(RecvStr, pos, 3)
     pos = pos + 3
     recvAccSearchMsg.service = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvAccSearchMsg.aRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     recvAccSearchMsg.eRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     recvAccSearchMsg.lastRecCount = Mid$(RecvStr, pos, 5)
     pos = pos + 5
     recvAccSearchMsg.noOfRecs = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvAccSearchMsg.custBranchCode = Mid$(RecvStr, pos, 4)
     pos = pos + 4
     recvAccSearchMsg.custNo = Mid$(RecvStr, pos, 7)
     pos = pos + 7
     recvAccSearchMsg.aShortName = Mid$(RecvStr, pos, 30)
     pos = pos + 30
     recvAccSearchMsg.eShortName = Mid$(RecvStr, pos, 30)
     pos = pos + 30
     recvAccSearchMsg.staffFlag = Mid$(RecvStr, pos, 1)
     pos = pos + 1
     recvAccSearchMsg.restrictedFlag = Mid$(RecvStr, pos, 1)
     pos = pos + 1
     recvAccSearchMsg.foundInAList = Mid$(RecvStr, pos, 1)
     pos = pos + 1
     recvAccSearchMsg.samaMainCategory = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvAccSearchMsg.samaSubCategory = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvAccSearchMsg.customerLang = Mid$(RecvStr, pos, 1)
     pos = pos + 1
     recvAccSearchMsg.filler = Mid$(RecvStr, pos, 9)
     pos = pos + 9
     For i = 1 To 20
         recvAccSearchMsg.details(i).accNo = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvAccSearchMsg.details(i).bookBal = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvAccSearchMsg.details(i).clearedBal = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvAccSearchMsg.details(i).blockedBal = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvAccSearchMsg.details(i).accStatus = Mid$(RecvStr, pos, 2)
         pos = pos + 2
         recvAccSearchMsg.details(i).creditLimit = Mid$(RecvStr, pos, 12)
         pos = pos + 12
         recvAccSearchMsg.details(i).transCount = Mid$(RecvStr, pos, 5)
         pos = pos + 5
    Next i
    For i = 1 To 20
        recvAccSearchMsg.details(i).inactiveFlag = Mid$(RecvStr, pos, 1)
        pos = pos + 1
    Next i
    
    For i = 1 To 20
        recvAccSearchMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
    Next i
    For i = 1 To 20
        recvAccSearchMsg.details(i).enqRestrictedFlag = Mid$(RecvStr, pos, 1)
        pos = pos + 1
    Next i
    parseAccSearchMsg = Success
End Function
Public Function searchCard(lastRecCount As String) As String
   Dim userId As String * 10
   Dim custNo As String * 8
   Dim accNo As String * 16
   Dim idNo As String * 15
   Dim cardNo As String * 19
   Dim strmsglen As String
      
   userId = Format(gUserId, "!@@@@@@@@@@")
   custNo = Format(frmEnquiry.txtCustomerNo, "00000000")
   accNo = Format(frmEnquiry.txtAccountNumber, "!@@@@@@@@@@@@@@@@")
   cardNo = Format(frmEnquiry.txtCardNumber, "!@@@@@@@@@@@@@@@@@@@")
   idNo = Format(frmEnquiry.txtIdNo, "!@@@@@@@@@@@@@@@")
   LogData "Card Search Operation is selected"
   LogData "---------------------------------"
   SendMsg = "000090" & "24" & gBranchCode & userId & lastRecCount & custNo & accNo & _
             cardNo & idNo & Space(50)
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmEnquiry.MousePointer = vbHourglass
   frmEnquiry.cmdCustomer.Enabled = False
   frmEnquiry.cmdAcctInfo.Enabled = False
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdAtmCard.Enabled = False
   frmEnquiry.cmdMerchant.Enabled = False
   frmEnquiry.cmdPenEnquiry.Enabled = False
   frmEnquiry.cmdBillEnq.Enabled = False
          
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmEnquiry.MousePointer = vbDefault
      If InStr(recvLoginMsg.authorityLevel, "~0") > 0 Then
         frmEnquiry.cmdCustomer.Enabled = True
      End If
      If InStr(recvLoginMsg.authorityLevel, "~6") > 0 Then
         frmEnquiry.cmdAcctInfo.Enabled = True
         'frmEnquiry.cmdPenEnquiry.Enabled = True
      End If
      If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
         frmEnquiry.cmdAtmCard.Enabled = True
      End If
      If InStr(recvLoginMsg.authorityLevel, "~81") > 0 Then
         frmEnquiry.cmdMerchant.Enabled = True
      End If
      If nameSearchAllowedAtBranch = True Then
         frmEnquiry.cmdNameSearch.Enabled = True
      Else
         frmEnquiry.cmdNameSearch.Enabled = False
      End If
      'frmEnquiry.cmdBillEnq.Enabled = True
      frmEnquiry.cmdCancel.Enabled = True
      searchCard = "-0001"
      Exit Function
   End If
   frmEnquiry.MousePointer = vbDefault
   If InStr(recvLoginMsg.authorityLevel, "~0") > 0 Then
      frmEnquiry.cmdCustomer.Enabled = True
   End If
   If InStr(recvLoginMsg.authorityLevel, "~6") > 0 Then
      frmEnquiry.cmdAcctInfo.Enabled = True
      'frmEnquiry.cmdPenEnquiry.Enabled = True
   End If
   If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
      frmEnquiry.cmdAtmCard.Enabled = True
   End If
   If InStr(recvLoginMsg.authorityLevel, "~81") > 0 Then
      frmEnquiry.cmdMerchant.Enabled = True
   End If
   If nameSearchAllowedAtBranch = True Then
      frmEnquiry.cmdNameSearch.Enabled = True
   Else
      frmEnquiry.cmdNameSearch.Enabled = False
   End If
   'frmEnquiry.cmdBillEnq.Enabled = True
   frmEnquiry.cmdCancel.Enabled = True

   parseCardSearchMsg
   
   If recvCardSearchMsg.status <> "000" Then
      LogData "Error code received from server " & recvCardSearchMsg.status & _
              " and error message receive is " & recvCardSearchMsg.eRemarks
      If recvCardSearchMsg.status = "009" Then
         LogData errInvalidCustNo(1)
         MsgBox errInvalidCustNo(UserLang)
      ElseIf UserLang = ARABIC Then
         MsgBox recvCardSearchMsg.aRemarks
      Else
         MsgBox recvCardSearchMsg.eRemarks
      End If
      searchCard = "-0001"
      Exit Function
   End If
   
   searchCard = recvCardSearchMsg.lastRecCount
End Function

Public Function parseCardSearchMsg() As String
     Dim i As Integer, pos As Integer
     pos = 1
     
     recvCardSearchMsg.status = Mid$(RecvStr, pos, 3)
     pos = pos + 3
     recvCardSearchMsg.service = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvCardSearchMsg.aRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     If recvCardSearchMsg.status <> "000" Then
        recvCardSearchMsg.eRemarks = Mid$(RecvStr, pos, 50)
        pos = pos + 50
     Else
        recvCardSearchMsg.idNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardSearchMsg.homeTelNo = Mid$(RecvStr, pos, 20)
        pos = pos + 20
        recvCardSearchMsg.offTelNo = Mid$(RecvStr, pos, 20)
        pos = pos + 20
     End If
     recvCardSearchMsg.lastRecCount = Mid$(RecvStr, pos, 5)
     pos = pos + 5
     recvCardSearchMsg.noOfRecs = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvCardSearchMsg.custNo = Mid$(RecvStr, pos, 8)
     pos = pos + 8
     recvCardSearchMsg.aShortName = Mid$(RecvStr, pos, 30)
     pos = pos + 30
     recvCardSearchMsg.eShortName = Mid$(RecvStr, pos, 30)
     pos = pos + 30
     recvCardSearchMsg.address1 = Mid$(RecvStr, pos, 30)
     pos = pos + 30
     recvCardSearchMsg.poBox = Mid$(RecvStr, pos, 10)
     pos = pos + 10
     recvCardSearchMsg.cityName = Mid$(RecvStr, pos, 20)
     pos = pos + 20
     recvCardSearchMsg.zipCode = Mid$(RecvStr, pos, 10)
     pos = pos + 10
     recvCardSearchMsg.custBranchCode = Mid$(RecvStr, pos, 4)
     pos = pos + 4
     recvCardSearchMsg.custType = Mid(RecvStr, pos, 1)
     pos = pos + 1
     recvCardSearchMsg.addressType = Mid$(RecvStr, pos, 1)
     pos = pos + 1
     recvCardSearchMsg.customerLang = Mid$(RecvStr, pos, 1)
     pos = pos + 1
     recvCardSearchMsg.filler = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     For i = 1 To Val(recvCardSearchMsg.noOfRecs)
         recvCardSearchMsg.details(i).cardNo = Mid$(RecvStr, pos, 19)
         pos = pos + 19
         recvCardSearchMsg.details(i).nameOnTheCard = Mid$(RecvStr, pos, 26)
         pos = pos + 26
         recvCardSearchMsg.details(i).issueDate = Mid$(RecvStr, pos, 8)
         pos = pos + 8
         recvCardSearchMsg.details(i).expiryDate = Mid$(RecvStr, pos, 8)
         pos = pos + 8
         recvCardSearchMsg.details(i).cardStatus = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvCardSearchMsg.details(i).requestStatus = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvCardSearchMsg.details(i).pinRequestStatus = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvCardSearchMsg.details(i).bmAccNo = Mid$(RecvStr, pos, 16)
         pos = pos + 16
         pos = pos + 50 ' for the filler
    Next i
    parseCardSearchMsg = Success
End Function

Public Function searchCard1(lastRecCount As String, custNo As String, accNo As String) As String
   Dim userId As String * 10
   Dim idNo As String * 15
   Dim cardNo As String * 19
   Dim strmsglen As String
      
   userId = Format(gUserId, "!@@@@@@@@@@")
   cardNo = String(19, " ")
   idNo = String(15, " ")
   SendMsg = "000090" & "24" & gBranchCode & userId & lastRecCount & custNo & accNo & _
             cardNo & idNo & Space(50)

   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
       
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      searchCard1 = "-0001"
      Exit Function
   End If
   
   parseCardSearchMsg
   If recvCardSearchMsg.status <> "000" Then
      If recvCardSearchMsg.status = "009" Then
         MsgBox errInvalidCustNo(UserLang)
      ElseIf UserLang = ARABIC Then
         MsgBox recvCardSearchMsg.aRemarks
      Else
         MsgBox recvCardSearchMsg.eRemarks
      End If
      searchCard1 = "-0001"
      Exit Function
   End If
   
   searchCard1 = recvCardSearchMsg.lastRecCount
End Function

Public Function doSearch1(lastRecCount As String, custNo As String) As String
    Dim strmsglen As String * 6
    Dim userId As String * 10
    Dim idType As String * 1
    Dim idNo As String * 15
    Dim phoneNo As String * 10
    Dim phoneExt As String * 4
    Dim firstName As String * 15
    Dim secondName As String * 15
    Dim lastName As String * 15
    Dim tmpMainCategory As String * 2
    Dim tmpSubCategory As String * 2
    Dim crNo As String * 15
    Dim branchCode As String * 4
    Dim cardNo As String * 19
    Dim mobileNo As String * 10
    Dim status As String * 3
    Dim recvLastRecCount As String * 5
    Dim currentPosition As Integer
    Dim tmpStr As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    idType = " "
    idNo = Space(15)
    phoneNo = Space(10)
    phoneExt = Space(4)
    firstName = Space(15)
    secondName = Space(15)
    lastName = Space(15)
    crNo = Space(15)
    tmpMainCategory = Space(2)
    tmpSubCategory = Space(2)
    branchCode = Space(4)
    cardNo = Space(19)
    mobileNo = Space(10)
    CSD_mdiForm.staticStatus.Panels(3).text = errSearchInProgress(UserLang)
    'SendMsg = "000090" + "16" + gBranchCode + userId + lastRecCount + custNo + idType + idNo + phoneNo + phoneExt + firstName + lastName + crNo + tmpMainCategory + tmpSubCategory + branchCode
    SendMsg = "000090" & "16" & gBranchCode & userId & lastRecCount & custNo & idType & _
               idNo & phoneNo & phoneExt & firstName & secondName & _
               lastName & crNo & tmpMainCategory & tmpSubCategory & branchCode & cardNo & mobileNo & _
               Space(10)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       doSearch1 = "-0001"
       Exit Function
    End If
    parseSearchMsg
    
    status = Mid$(RecvStr, 1, 3)
    If status <> Success Then
        If UserLang = ARABIC Then
            MsgBox Mid$(RecvStr, 6, 50)
        Else
            MsgBox Mid$(RecvStr, 56, 50)
        End If
        doSearch1 = "-0001"
        Exit Function
    End If
    recvLastRecCount = Mid$(RecvStr, 106, 5)
        
    currentPosition = 0
    doSearch1 = recvLastRecCount
End Function

Public Function doAccSearch1(lastRecCount As String, custNo As String) As String
   Dim userId As String * 10
   Dim accNo As String * 14
   Dim cardNo As String * 19
   Dim strmsglen As String
   
   userId = Format(gUserId, "!@@@@@@@@@@")
   accNo = "              "
   cardNo = "                    "
   SendMsg = "000090" + "21" + gBranchCode + userId + lastRecCount + custNo + accNo + cardNo
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
    
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      doAccSearch1 = "-0001"
      Exit Function
   End If
   parseAccSearchMsg
'   searchAction = False
'   updateAction = False
'   supervisorAction = False
'   tellerAction = False
   
   If recvAccSearchMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvAccSearchMsg.aRemarks
      Else
         MsgBox recvAccSearchMsg.eRemarks
      End If
      doAccSearch1 = "-0001"
      Exit Function
   End If
   
   doAccSearch1 = recvAccSearchMsg.lastRecCount
End Function

Public Function doJointSearch(lastRecRead As String, custNo As String, jointCustNo As String) As String
    Dim strmsglen As String, tCode As String, tUserid As String, tDateTime As String, tBranchCode As String
    Dim tmpStr As String
    Dim recType As String * 2
   
    If searchAction Then
       recType = "02"
       tUserid = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    ElseIf updateAction Then
       recType = "01"
       tUserid = Format(gUserId, "!@@@@@@@@@@")
       tDateTime = gDateTime
       tBranchCode = gBranchCode
    ElseIf custHistoryAction Then
       recType = "01"
       frmCustUpdateHistory.custHistoryGrid.Col = 0
       tBranchCode = Format(frmCustUpdateHistory.custHistoryGrid.text, "0000")
       frmCustUpdateHistory.custHistoryGrid.Col = 1
       tUserid = Format(frmCustUpdateHistory.custHistoryGrid.text, "!@@@@@@@@@@")
       frmCustUpdateHistory.custHistoryGrid.Col = 2
       tmpStr = frmCustUpdateHistory.custHistoryGrid.text
       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
       tDateTime = Format(tDateTime, "00000000000000")
    Else
        recType = "01"
        frmSupervisorApproval.MSFlexGrid1.Col = 0
        tUserid = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
        frmSupervisorApproval.MSFlexGrid1.Col = 1
        tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
        tBranchCode = gBranchCode
    End If
    
    jointKeyBranch = tBranchCode
    jointKeyUserId = tUserid
    jointKeyDateTime = tDateTime
    
    SendMsg = "000057" & "72" & gBranchCode & recType & tBranchCode & tUserid & tDateTime & custNo & jointCustNo & lastRecRead
    
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       doJointSearch = "-0001"
       Exit Function
    End If
    parseJointInfoSearch
    If recvJointSearchMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvJointSearchMsg.aRemarks
       Else
          MsgBox recvJointSearchMsg.eRemarks
       End If
       doJointSearch = "-0001"
       Exit Function
    End If
    
    doJointSearch = recvJointSearchMsg.lastRecCount
End Function

Public Sub parseJointInfoSearch()
    Dim i As Integer, pos As Integer

    
    recvJointSearchMsg.status = Mid$(RecvStr, 1, 3)
    recvJointSearchMsg.service = Mid$(RecvStr, 4, 2)
    recvJointSearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvJointSearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
    recvJointSearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
    recvJointSearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
    ' next 10 characters filler
    pos = 123
    For i = 1 To Val(recvJointSearchMsg.noOfRecs)
        recvJointSearchMsg.details(i).custNo = Mid$(RecvStr, pos, 7)
        pos = pos + 7
        recvJointSearchMsg.details(i).jointCustNo = Mid$(RecvStr, pos, 2)
        pos = pos + 2
        recvJointSearchMsg.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvJointSearchMsg.details(i).custShortName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvJointSearchMsg.details(i).idType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvJointSearchMsg.details(i).idNo = Mid$(RecvStr, pos, 15)
        pos = pos + 15
    Next i
End Sub
Public Function doHeirSearch(lastRecRead As String, custNo As String, heirNo As String) As String
    Dim strmsglen As String, tCode As String, tUserid As String
    Dim tDateTime As String, tBranchCode As String
    Dim tmpStr As String
    Dim recType As String * 2
   
    If searchAction Then
       recType = "04"
       tUserid = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    ElseIf updateAction Then
       recType = "03"
       tUserid = Format(gUserId, "!@@@@@@@@@@")
       tDateTime = gDateTime
       tBranchCode = gBranchCode
    ElseIf custHistoryAction Then
       recType = "03"
       frmCustUpdateHistory.custHistoryGrid.Col = 0
       tBranchCode = Format(frmCustUpdateHistory.custHistoryGrid.text, "0000")
       frmCustUpdateHistory.custHistoryGrid.Col = 1
       tUserid = Format(frmCustUpdateHistory.custHistoryGrid.text, "!@@@@@@@@@@")
       frmCustUpdateHistory.custHistoryGrid.Col = 2
       tmpStr = frmCustUpdateHistory.custHistoryGrid.text
       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
       tDateTime = Format(tDateTime, "00000000000000")
    Else
        recType = "03"
        frmSupervisorApproval.MSFlexGrid1.Col = 0
        tUserid = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
        frmSupervisorApproval.MSFlexGrid1.Col = 1
        tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
        tBranchCode = gBranchCode
    End If
    
    heirKeyBranch = tBranchCode
    heirKeyUserId = tUserid
    heirKeyDateTime = tDateTime
    
    SendMsg = "000057" & "73" & gBranchCode & recType & tBranchCode & tUserid & tDateTime & custNo & heirNo & lastRecRead
    
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       doHeirSearch = "-0001"
       Exit Function
    End If
    parseReferenceInfoSearch
    If recvReferenceSearchMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvReferenceSearchMsg.aRemarks
       Else
          MsgBox recvReferenceSearchMsg.eRemarks
       End If
       doHeirSearch = "-0001"
       Exit Function
    End If
    
    doHeirSearch = recvReferenceSearchMsg.lastRecCount
End Function

Public Function doReferenceSearch(lastRecRead As String, custNo As String, referenceNo As String) As String
    Dim strmsglen As String, tCode As String, tUserid As String, tDateTime As String, tBranchCode As String
    Dim tmpStr As String
    Dim recType As String * 2
   
    If searchAction Then
       recType = "02"
       tUserid = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    ElseIf updateAction Then
       recType = "01"
       tUserid = Format(gUserId, "!@@@@@@@@@@")
       tDateTime = gDateTime
       tBranchCode = gBranchCode
    ElseIf custHistoryAction Then
       recType = "01"
       frmCustUpdateHistory.custHistoryGrid.Col = 0
       tBranchCode = Format(frmCustUpdateHistory.custHistoryGrid.text, "0000")
       frmCustUpdateHistory.custHistoryGrid.Col = 1
       tUserid = Format(frmCustUpdateHistory.custHistoryGrid.text, "!@@@@@@@@@@")
       frmCustUpdateHistory.custHistoryGrid.Col = 2
       tmpStr = frmCustUpdateHistory.custHistoryGrid.text
       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
       tDateTime = Format(tDateTime, "00000000000000")
    Else
        recType = "01"
        frmSupervisorApproval.MSFlexGrid1.Col = 0
        tUserid = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
        frmSupervisorApproval.MSFlexGrid1.Col = 1
        tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
        tBranchCode = gBranchCode
    End If
    
    referenceKeyBranch = tBranchCode
    referenceKeyUserId = tUserid
    referenceKeyDateTime = tDateTime
    
    SendMsg = "000057" & "73" & gBranchCode & recType & tBranchCode & tUserid & tDateTime & custNo & referenceNo & lastRecRead
    
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       doReferenceSearch = "-0001"
       Exit Function
    End If
    parseReferenceInfoSearch
    If recvReferenceSearchMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvReferenceSearchMsg.aRemarks
       Else
          MsgBox recvReferenceSearchMsg.eRemarks
       End If
       doReferenceSearch = "-0001"
       Exit Function
    End If
    
    doReferenceSearch = recvReferenceSearchMsg.lastRecCount
End Function

Public Sub parseReferenceInfoSearch()
    Dim i As Integer, pos As Integer

    recvReferenceSearchMsg.status = Mid$(RecvStr, 1, 3)
    recvReferenceSearchMsg.service = Mid$(RecvStr, 4, 2)
    recvReferenceSearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvReferenceSearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
    recvReferenceSearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
    recvReferenceSearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
    ' next 10 characters filler
    pos = 123
    For i = 1 To Val(recvReferenceSearchMsg.noOfRecs)
        recvReferenceSearchMsg.details(i).custNo = Mid$(RecvStr, pos, 7)
        pos = pos + 7
        recvReferenceSearchMsg.details(i).referenceNo = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvReferenceSearchMsg.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvReferenceSearchMsg.details(i).custShortName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvReferenceSearchMsg.details(i).idType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvReferenceSearchMsg.details(i).idNo = Mid$(RecvStr, pos, 15)
        pos = pos + 15
    Next i
End Sub
Public Function doSignatorySearch(lastRecRead As String, custNo As String, signatoryNo As String) As String
    Dim strmsglen As String, tCode As String, tUserid As String, tDateTime As String, tBranchCode As String
    Dim tmpStr As String
    Dim recType As String * 2
   
    If searchAction Or updateAction Then
       recType = "02"
       tUserid = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    ElseIf custHistoryAction Then
       recType = "01"
       frmCustUpdateHistory.custHistoryGrid.Col = 0
       tBranchCode = Format(frmCustUpdateHistory.custHistoryGrid.text, "0000")
       frmCustUpdateHistory.custHistoryGrid.Col = 1
       tUserid = Format(frmCustUpdateHistory.custHistoryGrid.text, "!@@@@@@@@@@")
       frmCustUpdateHistory.custHistoryGrid.Col = 2
       tmpStr = frmCustUpdateHistory.custHistoryGrid.text
       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
       tDateTime = Format(tDateTime, "00000000000000")
    Else
        recType = "01"
        frmSupervisorApproval.MSFlexGrid1.Col = 0
        tUserid = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
        frmSupervisorApproval.MSFlexGrid1.Col = 1
        tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
        tBranchCode = gBranchCode
    End If
    
    signatoryKeyBranch = tBranchCode
    signatoryKeyUserId = tUserid
    signatoryKeyDateTime = tDateTime
    
    SendMsg = "000057" + "76" + gBranchCode + recType + tBranchCode + tUserid + tDateTime + custNo + signatoryNo + lastRecRead
    
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       doSignatorySearch = "-0001"
       Exit Function
    End If
    parseSignatoryInfoSearch
    If recvSignatorySearchMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvSignatorySearchMsg.aRemarks
       Else
          MsgBox recvSignatorySearchMsg.eRemarks
       End If
       doSignatorySearch = "-0001"
       Exit Function
    End If
    
    doSignatorySearch = recvSignatorySearchMsg.lastRecCount
End Function

Public Sub parseSignatoryInfoSearch()
    Dim i As Integer, pos As Integer

    
    recvSignatorySearchMsg.status = Mid$(RecvStr, 1, 3)
    recvSignatorySearchMsg.service = Mid$(RecvStr, 4, 2)
    recvSignatorySearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvSignatorySearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
    recvSignatorySearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
    recvSignatorySearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
    ' next 10 characters filler
    pos = 123
    For i = 1 To Val(recvSignatorySearchMsg.noOfRecs)
        recvSignatorySearchMsg.details(i).accNo = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvSignatorySearchMsg.details(i).signatoryNo = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvSignatorySearchMsg.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvSignatorySearchMsg.details(i).custShortName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvSignatorySearchMsg.details(i).idType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvSignatorySearchMsg.details(i).idNo = Mid$(RecvStr, pos, 15)
        pos = pos + 15
    Next i
End Sub

Public Function doOwnerSearch(lastRecRead As String, custNo As String, ownerNo As String) As String
    Dim strmsglen As String, tCode As String, tUserid As String, tDateTime As String, tBranchCode As String
    Dim tmpStr As String
    Dim recType As String * 2
   
    'If searchAction Or updateAction Then
    If searchAction Then
       recType = "04"
       tUserid = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    ElseIf updateAction Then
       recType = "03"
       tUserid = Format(gUserId, "!@@@@@@@@@@")
       tDateTime = gDateTime
       tBranchCode = gBranchCode
    ElseIf custHistoryAction Then
       recType = "03"
       frmCustUpdateHistory.custHistoryGrid.Col = 0
       tBranchCode = Format(frmCustUpdateHistory.custHistoryGrid.text, "0000")
       frmCustUpdateHistory.custHistoryGrid.Col = 1
       tUserid = Format(frmCustUpdateHistory.custHistoryGrid.text, "!@@@@@@@@@@")
       frmCustUpdateHistory.custHistoryGrid.Col = 2
       tmpStr = frmCustUpdateHistory.custHistoryGrid.text
       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
       tDateTime = Format(tDateTime, "00000000000000")
    Else
        recType = "03"
        frmSupervisorApproval.MSFlexGrid1.Col = 0
        tUserid = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
        frmSupervisorApproval.MSFlexGrid1.Col = 1
        tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
        tBranchCode = gBranchCode
    End If
    
    ownerKeyBranch = tBranchCode
    ownerKeyUserId = tUserid
    ownerKeyDateTime = tDateTime
    
    SendMsg = "000057" + "76" + gBranchCode + recType + tBranchCode + tUserid + tDateTime + custNo + ownerNo + lastRecRead
    
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       doOwnerSearch = "-0001"
       Exit Function
    End If
    parseOwnerInfoSearch
    If recvOwnerSearchMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvOwnerSearchMsg.aRemarks
       Else
          MsgBox recvOwnerSearchMsg.eRemarks
       End If
       doOwnerSearch = "-0001"
       Exit Function
    End If
    
    doOwnerSearch = recvOwnerSearchMsg.lastRecCount
End Function

Public Sub parseOwnerInfoSearch()
    Dim i As Integer, pos As Integer

    
    recvOwnerSearchMsg.status = Mid$(RecvStr, 1, 3)
    recvOwnerSearchMsg.service = Mid$(RecvStr, 4, 2)
    recvOwnerSearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvOwnerSearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
    recvOwnerSearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
    recvOwnerSearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
    ' next 10 characters filler
    pos = 123
    For i = 1 To Val(recvOwnerSearchMsg.noOfRecs)
        recvOwnerSearchMsg.details(i).custNo = Mid$(RecvStr, pos, 7)
        pos = pos + 14    ' Since same signatory response message layout is used
        recvOwnerSearchMsg.details(i).ownerNo = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvOwnerSearchMsg.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvOwnerSearchMsg.details(i).custShortName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvOwnerSearchMsg.details(i).idType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvOwnerSearchMsg.details(i).idNo = Mid$(RecvStr, pos, 15)
        pos = pos + 15
    Next i
End Sub
