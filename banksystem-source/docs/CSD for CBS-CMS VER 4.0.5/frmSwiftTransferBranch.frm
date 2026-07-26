VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSwiftTransferBranchActivity 
   BackColor       =   &H00BFD87E&
   Caption         =   "Swift Transfer Branch Activity"
   ClientHeight    =   8115
   ClientLeft      =   75
   ClientTop       =   345
   ClientWidth     =   12045
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8115
   ScaleWidth      =   12045
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdFetchData 
      Caption         =   "Fetch Data"
      Height          =   315
      Left            =   4710
      TabIndex        =   7
      ToolTipText     =   "Fetch Data"
      Top             =   825
      Width           =   1335
   End
   Begin VB.ComboBox cmbBranchcode 
      Height          =   315
      Left            =   2475
      TabIndex        =   6
      Top             =   810
      Width           =   1980
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00BFD87E&
      Height          =   690
      Left            =   375
      TabIndex        =   1
      Top             =   6915
      Width           =   10890
      Begin VB.CommandButton cmdMore 
         Caption         =   "More"
         Height          =   375
         Left            =   3495
         TabIndex        =   4
         ToolTipText     =   "More"
         Top             =   180
         Width           =   1695
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Left            =   1455
         TabIndex        =   3
         ToolTipText     =   "Update"
         Top             =   180
         Width           =   1815
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   5340
         TabIndex        =   2
         ToolTipText     =   "Exit"
         Top             =   195
         Width           =   1695
      End
   End
   Begin MSFlexGridLib.MSFlexGrid swiftTransferGrid 
      Height          =   5415
      Left            =   1155
      TabIndex        =   5
      Top             =   1425
      Width           =   9015
      _ExtentX        =   15901
      _ExtentY        =   9551
      _Version        =   393216
      Rows            =   26
      Cols            =   5
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label LblBranchCode 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   195
      Left            =   1245
      TabIndex        =   8
      Top             =   840
      Width           =   1095
   End
   Begin VB.Label lblSwiftTransferFromBranch 
      BackColor       =   &H00BFD87E&
      Caption         =   "Swift transfers from Branch"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   465
      Left            =   3600
      TabIndex        =   0
      Top             =   105
      Width           =   5055
   End
End
Attribute VB_Name = "frmSwiftTransferBranchActivity"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public coinDenomination As Integer
Public coinPrecision As Integer
Public amtToPrint As Double
Public tranAmt As Double
Public reqdDate As String
Public reqdBranch As String

Private Sub cmbBranchcode_GotFocus()
    cmdFetchData.Default = True
End Sub

Private Sub cmbBranchcode_LostFocus()
    cmdFetchData.Default = False
End Sub

Private Sub cmbBranchCode_Validate(Cancel As Boolean)
   Dim i As Integer
   Dim tCode As String
   
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbBranchcode.text)) <> 0 Then
         tCode = Mid$(cmbBranchcode.text, 1, 4)
         For i = 0 To cmbBranchcode.ListCount
             If Mid$(cmbBranchcode.List(i), 1, 4) = tCode Then
                cmbBranchcode.ListIndex = i
                Exit For
             End If
         Next i
      End If
             
      If i > cmbBranchcode.ListCount Then
         MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbBranchcode.SetFocus
         Cancel = True
      End If
   End If
   On Error GoTo 0
End Sub


Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdFetchData_Click()
   
   reqdDate = Space(8)
  
   reqdBranch = Space(4)
   If Len(RTrim(cmbBranchcode)) <> 0 Then
      reqdBranch = Mid$(cmbBranchcode, 1, 4)
   End If
   
   formatBranchSwiftTransferEnqRequest "00000", reqdDate, reqdBranch
   
   frmSwiftTransferBranchActivity.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmSwiftTransferBranchActivity.MousePointer = vbNormal
      Exit Sub
   End If
   
   parseBranchSwiftTransferDetails
   frmSwiftTransferBranchActivity.MousePointer = vbDefault
   If recvBrSwiftTranferMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvBrSwiftTranferMsg.aRemarks
      Else
         MsgBox recvBrSwiftTranferMsg.eRemarks
      End If
      Exit Sub
   End If
   
   displayResponseInGrid
   
End Sub

Private Sub cmdMore_Click()
    
   If recvBrSwiftTranferMsg.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
      
   reqdDate = Space(8)
   
   reqdBranch = Space(4)
   If Len(RTrim(cmbBranchcode)) <> 0 Then
      reqdBranch = Mid$(cmbBranchcode, 1, 4)
   End If
   
   formatBranchSwiftTransferEnqRequest recvBrSwiftTranferMsg.lastRecCount, reqdDate, reqdBranch
   
   frmSwiftTransferBranchActivity.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmSwiftTransferBranchActivity.MousePointer = vbNormal
      Exit Sub
   End If
   frmSwiftTransferBranchActivity.MousePointer = vbDefault
   
   parseBranchSwiftTransferDetails
   
   If recvBrSwiftTranferMsg.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
   End If
   
   displayResponseInGrid
End Sub

Private Sub cmdUpdate_Click()
    getSwiftTransDetails
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

   If UserLang = ARABIC Then
      ChangePositions frmSwiftTransferBranchActivity, 11800
      frmSwiftTransferBranchActivity.RightToLeft = True
   End If
   
   frmSwiftTransferBranchActivity.Caption = frmSwiftTransferBranchActivityCaption(0, UserLang)
   lblSwiftTransferFromBranch.Caption = frmSwiftTransferBranchActivityCaption(0, UserLang)
   lblBranchCode.Caption = frmSwiftTransferBranchActivityCaption(1, UserLang)
   cmdFetchData.Caption = frmSwiftTransferBranchActivityCaption(2, UserLang)
   cmdUpdate.Caption = frmSwiftTransferBranchActivityCaption(3, UserLang)
   cmdMore.Caption = frmSwiftTransferBranchActivityCaption(4, UserLang)
   cmdCancel.Caption = frmSwiftTransferBranchActivityCaption(5, UserLang)
      
   mQry = "select branchcode,arabicname,englishname from branchinfo"
   Set rs = db.OpenRecordset(mQry)

   If rs.recordCount > 0 Then
      cmbBranchcode.Clear
      rs.MoveFirst
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbBranchcode.AddItem rs(0) & "-" & rs(2)
         Else
            cmbBranchcode.AddItem rs(0) & "-" & rs(1)
         End If
         rs.MoveNext
      Loop
   End If
   
   displayResponseInGrid
   
End Sub
Public Sub displayResponseInGrid()

  printGridHeading
  For i = 1 To Val(recvBrSwiftTranferMsg.noOfRecs)
      swiftTransferGrid.Row = i
      swiftTransferGrid.Col = 0
      swiftTransferGrid.text = recvBrSwiftTranferMsg.details(i).branchCode
      swiftTransferGrid.Col = 1
      swiftTransferGrid.text = recvBrSwiftTranferMsg.details(i).transRefNo
      swiftTransferGrid.Col = 2
      swiftTransferGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferGrid.text = formatDate(recvBrSwiftTranferMsg.details(i).transDate)
      swiftTransferGrid.Col = 3
      If Len(RTrim(recvBrSwiftTranferMsg.details(i).transAmt)) = 0 Then
         tranAmt = 0
      Else
         If Not IsNumeric(Right(Trim(recvBrSwiftTranferMsg.details(i).transAmt), 1)) Then
            tmpStr = "-" & bmAmtToDbl(recvBrSwiftTranferMsg.details(i).transAmt)
            tranAmt = CDbl(tmpStr)
         Else
            tranAmt = CDbl(recvBrSwiftTranferMsg.details(i).transAmt)
         End If
      End If
      mQry = "select decimalplace from currencyinfo " & _
             "where isocurrcode = '" & recvBrSwiftTranferMsg.details(i).transCurr & "'"
            
      Set rs = db.OpenRecordset(mQry)
                             
      If rs.recordCount > 0 Then
         tDecimalPlace = rs(0)
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

      amtToPrint = tranAmt / coinDenomination
      swiftTransferGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferGrid.text = recvBrSwiftTranferMsg.details(i).transCurr & " " & Format(Format(amtToPrint, "##,###,###,###,##0" + _
                               IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
      swiftTransferGrid.Col = 4
      swiftTransferGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferGrid.text = recvBrSwiftTranferMsg.details(i).senderName
   Next i
   swiftTransferGrid.Row = 1
End Sub

Public Sub printGridHeading()
   Dim tWidth As Integer
   Dim colwidth(8) As Integer
   Dim rowTitle(8) As String
   
   colwidth(0) = 700
   colwidth(1) = 1300
   colwidth(2) = 1300
   colwidth(3) = 2000
   colwidth(4) = 4500
   colwidth(5) = 1800
   colwidth(6) = 1400
   colwidth(7) = 1700
 
'   rowTitle(0) = "Branch"
'   rowTitle(1) = "BP Referrence"
'   rowTitle(2) = "Trans.Date"
'   rowTitle(3) = "Trans.Curr & Amount"
'   rowTitle(4) = "Sender Name"
   
   tWidth = 0
   swiftTransferGrid.Clear
   swiftTransferGrid.Row = 0
   For i = 0 To 4
      swiftTransferGrid.Col = i
      If UserLang = ARABIC Then
         swiftTransferGrid.CellAlignment = flexAlignRightCenter
      Else
         swiftTransferGrid.CellAlignment = flexAlignLeftCenter
      End If
      swiftTransferGrid.text = frmSwiftTransferBranchActivityCaption(i + 6, UserLang)
      'swiftTransferGrid.text = rowTitle(i)
      swiftTransferGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
   Next i
   swiftTransferGrid.Width = tWidth + 200
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub swiftTransferGrid_DblClick()
    getSwiftTransDetails
End Sub

Public Sub getSwiftTransDetails()

    Dim tTransRefNo As String
    Dim tTransDate As String
    Dim strmsglen As String
    Dim tCode As String
    Dim tUserid As String
    
    swiftTransferGrid.Col = 1
    tTransRefNo = Format(swiftTransferGrid.text, "!@@@@@@@@@@")
    swiftTransferGrid.Col = 2
    tmpStr = swiftTransferGrid.text
    tTransDate = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2)
   
    If Len(RTrim(tTransRefNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000048" & "83" & gBranchCode & tUserid & tTransRefNo & tTransDate & "01" & Space(14) & Space(50)
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSwiftTransferBranchActivity.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmSwiftTransferBranchActivity.MousePointer = vbDefault
       Exit Sub
    End If
    frmSwiftTransferBranchActivity.MousePointer = vbDefault
    
    parseSarieTransferDetail
    
    If recvTransferDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTransferDetail.aRemarks
       Else
          MsgBox recvTransferDetail.eRemarks
       End If
       Exit Sub
    End If
    swiftUpdateAction = True
    swiftEnquiryAction = False
    swiftTellerAction = False
    swiftSupervisorAction = False
    frmSwiftTransferDetail.Show
    fillFrmSwiftTransferDetail
    
End Sub

Private Sub txtReqdYear_Change()
    If Len(RTrim(txtReqdYear)) <> 0 Then
        If Len(RTrim(txtReqdYear)) = 4 Then
           cmbBranchcode.SetFocus
        End If
     End If
End Sub

Private Sub swiftTransferGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
