VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmReturnMailPendingList 
   BackColor       =   &H00BFD87E&
   Caption         =   "Pending Return mails list"
   ClientHeight    =   3195
   ClientLeft      =   2580
   ClientTop       =   1920
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdCheckPendingMails 
      Caption         =   "Check pending Returned mail"
      Default         =   -1  'True
      Height          =   375
      Left            =   5280
      TabIndex        =   7
      ToolTipText     =   "Check pending List"
      Top             =   840
      Width           =   2295
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   285
      Left            =   3480
      MaxLength       =   7
      TabIndex        =   5
      Top             =   840
      Width           =   1575
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   1560
      TabIndex        =   4
      ToolTipText     =   "More"
      Top             =   7440
      Width           =   1575
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   495
      Left            =   3120
      TabIndex        =   3
      ToolTipText     =   "Verify Selected Record"
      Top             =   7440
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5160
      TabIndex        =   2
      ToolTipText     =   "Cancel"
      Top             =   7440
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid returnMailPendingGrid 
      Height          =   5535
      Left            =   720
      TabIndex        =   1
      Top             =   1440
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   9763
      _Version        =   393216
      Rows            =   26
      Cols            =   7
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblCustomerNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Number"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   840
      TabIndex        =   6
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label lblPendingReturnMails 
      BackColor       =   &H00BFD87E&
      Caption         =   "List of Pending Returned mails-Mandate Branch"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   2880
      TabIndex        =   0
      Top             =   240
      Width           =   6735
   End
End
Attribute VB_Name = "frmReturnMailPendingList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCheckPendingMails_Click()
   Dim tCustNo As String
   If Len(Trim(txtCustomerNo)) = 0 Then
      MsgBox errSpaceCustomerNo(UserLang)
      txtCustomerNo.SetFocus
      Exit Sub
   End If
   tCustNo = Format(txtCustomerNo, "0000000")
   readRetMailPendingList "00000", frmReturnMailPendingList.tag, tCustNo
   fillRetMailPendingListForm
End Sub

Private Sub returnMailPendingGrid_DblClick()
    Dim tRefNo As String
    Dim tCustNo As String
    Dim tBranchCode As String * 4
    Dim strmsglen
    Dim response
    Dim abcStr As String
    Dim tmpStr As String
    
    returnMailPendingGrid.Col = 0
    tRefNo = Format(returnMailPendingGrid.text, "!@@@@@@@@@@@@@@@@")
    returnMailPendingGrid.Col = 1
    tCustNo = Format(returnMailPendingGrid.text, "!@@@@@@@")
    tBranchCode = gBranchCode
    If Len(RTrim(tRefNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    SendMsg = "000090" & "AB" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tRefNo & "0" & Space(7) & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmReturnMailPendingList.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmReturnMailPendingList.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    frmReturnMailPendingList.MousePointer = vbNormal
    parseMailDetailResponse
    
    If recvMailDetailMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvMailDetailMsg.aRemarks
       Else
          MsgBox recvMailDetailMsg.eRemarks
       End If
       Exit Sub
    End If
    
    If frmReturnMailPendingList.tag = "S" Then
       Unload frmMailDetail
       fillMailDetailForm
    Else
       fillRetMailActionForm
    End If
    
End Sub

Private Sub returnmailpendinggrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdMore_Click()
     
  If recvRetMailPendingList.noOfRecs <> 20 Then
     MsgBox errNoMatchFound(UserLang) '"No more match found..."
     Exit Sub
  End If
      
  readRetMailPendingList recvRetMailPendingList.lastRecCount, retMailPendingListMsg.msgType, retMailPendingListMsg.custNo
  If recvRetMailPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  fillRetMailPendingListForm

End Sub

Private Sub cmdVerify_Click()
    returnMailPendingGrid_DblClick
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim flexRow, tWidth As Integer, colwidth(8) As Integer
   Dim rowTitle(8) As String
   Dim i As Integer
   Static lastRecRead As String * 3
   Dim tCode, tmpStr As String
    
   If UserLang = ARABIC Then
      ChangePositions frmReturnMailPendingList, 12000
      frmReturnMailPendingList.RightToLeft = True
   End If
    
   frmReturnMailPendingList.lblCustomerNo.Caption = frmReturnedMailPendingListCaption(5, UserLang)
   frmReturnMailPendingList.cmdCheckPendingMails.Caption = frmReturnedMailPendingListCaption(6, UserLang)
   frmReturnMailPendingList.cmdMore.Caption = frmReturnedMailPendingListCaption(7, UserLang)
   frmReturnMailPendingList.cmdVerify.Caption = frmReturnedMailPendingListCaption(8, UserLang)
   frmReturnMailPendingList.cmdCancel.Caption = frmReturnedMailPendingListCaption(9, UserLang)
  
   CSD_mdiForm.staticStatus.Panels(3).text = errSelectOneMatch(UserLang)
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Public Sub readRetMailPendingList(lastRecRead As String, activityFlag, custNo As String)
    Dim tUserid As String * 10
    Dim tCustNo As String * 10
    Dim strmsglen As String
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    retMailPendingListMsg.msgLen = "000000"
    retMailPendingListMsg.service = "AC"
    retMailPendingListMsg.homeBranch = gBranchCode
    retMailPendingListMsg.userId = tUserid
    retMailPendingListMsg.lastRecCount = lastRecRead
    retMailPendingListMsg.msgType = activityFlag
    retMailPendingListMsg.custNo = custNo
    retMailPendingListMsg.filler = Space(50)
    
    'SendMsg = "000038" & "AC" & gBranchCode & tUserid & lastRecRead & activityFlag & custNo & Space(50)
    SendMsg = retMailPendingListMsg.msgLen & retMailPendingListMsg.service & retMailPendingListMsg.homeBranch & _
              retMailPendingListMsg.userId & retMailPendingListMsg.lastRecCount & retMailPendingListMsg.msgType & _
              retMailPendingListMsg.custNo & retMailPendingListMsg.filler
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmReturnMailPendingList.MousePointer = vbHourglass
    frmReturnMailPendingList.cmdCancel.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmReturnMailPendingList.MousePointer = vbDefault
       frmReturnMailPendingList.cmdCancel.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = "  "
       Exit Sub
    End If
    parseRetMailPendingList
    frmReturnMailPendingList.MousePointer = vbDefault
    frmReturnMailPendingList.cmdCancel.Enabled = True
    If recvRetMailPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvRetMailPendingList.aRemarks
       Else
          MsgBox recvRetMailPendingList.eRemarks
       End If
    End If
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
End Sub
Public Sub parseRetMailPendingList()
     Dim i, pos As Integer
     
     recvRetMailPendingList.status = Mid$(RecvStr, 1, 3)
     recvRetMailPendingList.service = Mid$(RecvStr, 4, 2)
     recvRetMailPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvRetMailPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvRetMailPendingList.lastRecCount = Mid$(RecvStr, 106, 5)
     recvRetMailPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvRetMailPendingList.filler = Mid$(RecvStr, 113, 50)
     pos = 163
     For i = 1 To Val(recvRetMailPendingList.noOfRecs)
         recvRetMailPendingList.details(i).refNo = Mid$(RecvStr, pos, 16)
         pos = pos + 16
         recvRetMailPendingList.details(i).custNo = Mid$(RecvStr, pos, 7)
         pos = pos + 7
         recvRetMailPendingList.details(i).productId = Mid$(RecvStr, pos, 20)
         pos = pos + 20
         recvRetMailPendingList.details(i).address1 = Mid$(RecvStr, pos, 30)
         pos = pos + 30
         recvRetMailPendingList.details(i).poBox = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvRetMailPendingList.details(i).cityName = Mid$(RecvStr, pos, 20)
         pos = pos + 20
         recvRetMailPendingList.details(i).zipCode = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvRetMailPendingList.details(i).filler = Mid$(RecvStr, pos, 50)
         pos = pos + 50
    Next i
End Sub

Public Sub fillRetMailPendingListForm()
    Dim i As Integer
    Dim tmpStr As String
    Dim tCode As String
    
    fillRetMailPendingListGridHeading
    
    For i = 1 To Val(recvRetMailPendingList.noOfRecs)
      returnMailPendingGrid.Row = i
      returnMailPendingGrid.Col = 0
      returnMailPendingGrid.CellAlignment = flexAlignLeftCenter
      returnMailPendingGrid.text = recvRetMailPendingList.details(i).refNo
      returnMailPendingGrid.Col = 1
      returnMailPendingGrid.CellAlignment = flexAlignLeftCenter
      returnMailPendingGrid.text = recvRetMailPendingList.details(i).custNo
      returnMailPendingGrid.Col = 2
      returnMailPendingGrid.CellAlignment = flexAlignLeftCenter
      returnMailPendingGrid.text = recvRetMailPendingList.details(i).productId
      returnMailPendingGrid.Col = 3
      returnMailPendingGrid.CellAlignment = flexAlignLeftCenter
      returnMailPendingGrid.text = recvRetMailPendingList.details(i).address1
      returnMailPendingGrid.Col = 4
      returnMailPendingGrid.CellAlignment = flexAlignLeftCenter
      returnMailPendingGrid.text = recvRetMailPendingList.details(i).poBox
      returnMailPendingGrid.Col = 5
      returnMailPendingGrid.CellAlignment = flexAlignLeftCenter
      returnMailPendingGrid.text = recvRetMailPendingList.details(i).cityName
      returnMailPendingGrid.Col = 6
      returnMailPendingGrid.CellAlignment = flexAlignLeftCenter
      returnMailPendingGrid.text = recvRetMailPendingList.details(i).zipCode
   Next i
   returnMailPendingGrid.Row = 1

End Sub
Public Sub fillRetMailActionForm()
    Dim tCode As String
    Dim tmpStr As String
    Dim i As Integer
    
    frmReturnMail.txtRefNo = recvMailDetailMsg.refNo
    frmReturnMail.txtCustNo = recvMailDetailMsg.custNo
    frmReturnMail.txtCustName = recvMailDetailMsg.custName
    
    tCode = recvMailDetailMsg.custSegmentFlag
    If Len(Trim(tCode)) = 0 Then
       tCode = "0"
    End If
    For i = 0 To frmReturnMail.cmbSegmentType.ListCount
        If Mid(frmReturnMail.cmbSegmentType.List(i), 1, 1) = tCode Then
           frmReturnMail.cmbSegmentType.ListIndex = i
           Exit For
        End If
    Next i
    If i > frmReturnMail.cmbSegmentType.ListCount Then
       frmReturnMail.cmbSegmentType.text = tCode & "- Not defined in local"
    End If
    
    frmReturnMail.cmbDespatchDate = Mid$(recvMailDetailMsg.dateGenerated, 7, 2)
    frmReturnMail.cmbDespathMonth = Mid$(recvMailDetailMsg.dateGenerated, 5, 2)
    frmReturnMail.txtDespatchYear = Mid$(recvMailDetailMsg.dateGenerated, 1, 4)
    frmReturnMail.txtBranchCode = recvMailDetailMsg.branchCode
   
    frmReturnMail.txtAddress1 = recvMailDetailMsg.address1
    frmReturnMail.txtPOBox = recvMailDetailMsg.poBox
    frmReturnMail.cmbCity = recvMailDetailMsg.cityName
    frmReturnMail.txtZipCode = recvMailDetailMsg.zipCode
    frmReturnMail.txtProductNo = recvMailDetailMsg.productId
    
    frmReturnMail.cmbReturnDate = Mid$(recvMailDetailMsg.returnedDate, 7, 2)
    frmReturnMail.cmbReturnMonth = Mid$(recvMailDetailMsg.returnedDate, 5, 2)
    frmReturnMail.txtReturnYear = Mid$(recvMailDetailMsg.returnedDate, 1, 4)
    
    frmReturnMail.txtRegisteredUser = Trim(recvMailDetailMsg.registeredUser)
    frmReturnMail.txtRegisteredBranch = Trim(recvMailDetailMsg.registeredBranch)
    tCode = recvMailDetailMsg.returnedReason
    If Len(Trim(tCode)) <> 0 Then
       For i = 0 To frmReturnMail.cmbReturnedReason.ListCount
           If Mid(frmReturnMail.cmbReturnedReason.List(i), 1, 1) = tCode Then
              frmReturnMail.cmbReturnedReason.ListIndex = i
              Exit For
           End If
       Next i
       If i > frmReturnMail.cmbReturnedReason.ListCount Then
          frmReturnMail.cmbReturnedReason.text = tCode & "- Not defined in local"
       End If
    End If

    frmReturnMail.txtOffTelNo = recvMailDetailMsg.offTelNo
    frmReturnMail.txtHomeTelNo = recvMailDetailMsg.homeTelNo
    frmReturnMail.txtFaxNo = recvMailDetailMsg.faxNo
    frmReturnMail.txtMobileNo = recvMailDetailMsg.mobileNo
    frmReturnMail.txtEmailAddr = recvMailDetailMsg.emailAddr
    
    frmReturnMail.txtMandateRemarks = Trim(recvMailDetailMsg.verificationUserRemarks)
    frmReturnMail.optMandateAddrUpd = False
    frmReturnMail.optMandateAddrNotUpd = False
    If recvMailDetailMsg.verificationActionTaken = "1" Then
       frmReturnMail.optMandateAddrUpd = True
    ElseIf recvMailDetailMsg.verificationActionTaken = "2" Then
       frmReturnMail.optMandateAddrNotUpd = True
    End If
    
    frmReturnMail.txtCallCentreRemarks = Trim(recvMailDetailMsg.callCentreUserRemarks)
    frmReturnMail.optCallCentreAddrNotUpd = False
    frmReturnMail.optCallCentreAddrUpd = False
    frmReturnMail.optCallCentreCustNotReach = False
    If recvMailDetailMsg.callCentreActionTaken = "1" Then
       frmReturnMail.optCallCentreAddrUpd = True
    ElseIf recvMailDetailMsg.callCentreActionTaken = "9" Then
       frmReturnMail.optCallCentreAddrNotUpd = True
    ElseIf recvMailDetailMsg.callCentreActionTaken = "3" Then
       frmReturnMail.optCallCentreCustNotReach = True
    End If
    
    frmReturnMail.txtBranchRemarks = Trim(recvMailDetailMsg.deliveryUserRemarks)
    frmReturnMail.optBranchAddrUpd = False
    frmReturnMail.optBranchAddrNotUpd = False
    frmReturnMail.optBranchStmtDisabled = False
    If recvMailDetailMsg.deliveryActionTaken = "1" Then
       frmReturnMail.optBranchAddrUpd = True
    ElseIf recvMailDetailMsg.deliveryActionTaken = "9" Then
       frmReturnMail.optBranchAddrNotUpd = True
    ElseIf recvMailDetailMsg.deliveryActionTaken = "3" Then
       frmReturnMail.optBranchStmtDisabled = True
    End If
    
    If recvMailDetailMsg.deliveredToCustomer = "1" Then
       frmReturnMail.optDeliveredToCustYES = True
    Else
       frmReturnMail.optDeliveredToCustNO = True
    End If
    frmReturnMail.frameMandateActions.Enabled = False
    frmReturnMail.frameCallCentreActions.Enabled = False
    frmReturnMail.frameBranchActions.Enabled = False
        
    If frmReturnMailPendingList.tag = "M" Then  'Mandate pending list
       frmReturnMail.lblReturnMailActions = frmReturnedMailCaption(38, UserLang) '"Returned mail Actions - Mandate Branch"
       frmReturnMail.frameMandateActions.Enabled = True
       frmReturnMail.frameCallCentreActions.Enabled = False
       frmReturnMail.frameBranchActions.Enabled = False
    ElseIf frmReturnMailPendingList.tag = "C" Then ' Call centre
       frmReturnMail.lblReturnMailActions = frmReturnedMailCaption(39, UserLang) '"Returned mail Actions - Call centre"
       frmReturnMail.frameMandateActions.Enabled = False
       frmReturnMail.frameCallCentreActions.Enabled = True
       frmReturnMail.frameBranchActions.Enabled = False
    ElseIf frmReturnMailPendingList.tag = "B" Then ' Branches
       frmReturnMail.lblReturnMailActions = frmReturnedMailCaption(40, UserLang) '"Returned mail Actions - Branch"
       frmReturnMail.frameMandateActions.Enabled = False
       frmReturnMail.frameCallCentreActions.Enabled = False
       frmReturnMail.frameBranchActions.Enabled = True
    End If
    frmReturnMail.tag = frmReturnMailPendingList.tag
    frmReturnMail.Show

End Sub

Public Sub fillRetMailPendingListGridHeading()
    Dim tWidth As Integer, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim i As Integer
    Dim tCode As String, tmpStr As String
    
    colwidth(0) = 1900
    colwidth(1) = 1200
    colwidth(2) = 1800
    colwidth(3) = 1500
    colwidth(4) = 1200
    colwidth(5) = 1300
    colwidth(6) = 1200
             
'    rowTitle(0) = "Reference Number"
'    rowTitle(1) = "Customer No."
'    rowTitle(2) = "Product Id"
'    rowTitle(3) = "Address-1"
'    rowTitle(4) = "P.O. Box"
'    rowTitle(5) = "City Name"
'    rowTitle(6) = "Zip Code"
    
    returnMailPendingGrid.Clear
    returnMailPendingGrid.Row = 0
    returnMailPendingGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 6
      returnMailPendingGrid.Col = i
      If UserLang = ARABIC Then
         returnMailPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         returnMailPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      returnMailPendingGrid.text = frmReturnedMailPendingListCaption(i + 10, UserLang)
      'returnMailPendingGrid.text = rowTitle(i)
      returnMailPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    returnMailPendingGrid.Width = tWidth + 500

End Sub
