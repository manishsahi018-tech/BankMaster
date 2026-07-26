VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSwiftTransferEnq 
   BackColor       =   &H00BFD87E&
   Caption         =   "Swift Transfer Enquiry"
   ClientHeight    =   8115
   ClientLeft      =   75
   ClientTop       =   345
   ClientWidth     =   11880
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8115
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdFetchData 
      Caption         =   "Fetch Data"
      Height          =   315
      Left            =   9825
      TabIndex        =   18
      Top             =   1470
      Width           =   1335
   End
   Begin VB.Frame FrameRecordStatus 
      Height          =   615
      Left            =   1905
      TabIndex        =   13
      Top             =   1335
      Width           =   7815
      Begin VB.OptionButton optInitiatedFromBranch 
         Caption         =   "Pending for update"
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
         Height          =   315
         Left            =   75
         TabIndex        =   17
         Tag             =   "7815"
         Top             =   195
         Value           =   -1  'True
         Width           =   2205
      End
      Begin VB.OptionButton optPendingWithBranch 
         Caption         =   "Pending with central unit"
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
         Height          =   300
         Left            =   4890
         TabIndex        =   16
         Tag             =   "7815"
         Top             =   210
         Width           =   2790
      End
      Begin VB.OptionButton optCompleted 
         Caption         =   "Completed"
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
         Height          =   255
         Left            =   2370
         TabIndex        =   15
         Tag             =   "7815"
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton optRejected 
         Caption         =   "Rejected"
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
         Height          =   255
         Left            =   3735
         TabIndex        =   14
         Tag             =   "7815"
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00BFD87E&
      Height          =   690
      Left            =   390
      TabIndex        =   6
      Top             =   7515
      Width           =   10890
      Begin VB.CommandButton cmdMore 
         Caption         =   "More"
         Height          =   375
         Left            =   3495
         TabIndex        =   11
         Top             =   180
         Width           =   1695
      End
      Begin VB.CommandButton cmdDetails 
         Caption         =   "Details"
         Height          =   375
         Left            =   1455
         TabIndex        =   9
         Top             =   180
         Width           =   1815
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   5340
         TabIndex        =   8
         Top             =   195
         Width           =   1695
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00BFD87E&
      Height          =   645
      Left            =   60
      TabIndex        =   5
      Top             =   570
      Width           =   11115
      Begin VB.TextBox txtReqdYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4020
         MaxLength       =   4
         TabIndex        =   3
         Tag             =   "11535"
         Top             =   240
         Width           =   735
      End
      Begin VB.ComboBox cmbBranchcode 
         Height          =   315
         Left            =   6120
         TabIndex        =   4
         Tag             =   "11535"
         Top             =   240
         Width           =   1980
      End
      Begin VB.ComboBox cmbReqdDate 
         Height          =   315
         Left            =   2400
         TabIndex        =   1
         Tag             =   "11535"
         Top             =   240
         Width           =   735
      End
      Begin VB.ComboBox cmbReqdMonth 
         Height          =   315
         Left            =   3240
         TabIndex        =   2
         Tag             =   "11535"
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblBranchCode 
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
         Left            =   4875
         TabIndex        =   10
         Tag             =   "11535"
         Top             =   270
         Width           =   1095
      End
      Begin VB.Label lblReqdDate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Required Date :"
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
         Height          =   240
         Left            =   525
         TabIndex        =   7
         Tag             =   "11535"
         Top             =   240
         Width           =   1650
      End
   End
   Begin MSFlexGridLib.MSFlexGrid swiftTransferEnqGrid 
      Height          =   5295
      Left            =   210
      TabIndex        =   12
      Top             =   2025
      Width           =   10950
      _ExtentX        =   19315
      _ExtentY        =   9340
      _Version        =   393216
      Rows            =   26
      Cols            =   13
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
   Begin VB.Label lblRecordStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "Record Status"
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
      Height          =   255
      Left            =   450
      TabIndex        =   19
      Top             =   1530
      Width           =   1455
   End
   Begin VB.Label lblSwiftTransferEnq 
      BackColor       =   &H00BFD87E&
      Caption         =   "Swift transfers Enquiry"
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
      Height          =   435
      Left            =   3600
      TabIndex        =   0
      Top             =   60
      Width           =   5055
   End
End
Attribute VB_Name = "frmSwiftTransferEnq"
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
Public requestType As String

Private Sub cmbBranchCode_Validate(Cancel As Boolean)
   Dim i As Integer
   Dim tCode As String
   
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbBranchCode.text)) <> 0 Then
         tCode = Mid$(cmbBranchCode.text, 1, 4)
         For i = 0 To cmbBranchCode.ListCount
             If Mid$(cmbBranchCode.List(i), 1, 4) = tCode Then
                cmbBranchCode.ListIndex = i
                Exit For
             End If
         Next i
      End If
             
      If i > cmbBranchCode.ListCount Then
         MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbBranchCode.SetFocus
         Cancel = True
      End If
   End If
   On Error GoTo 0
End Sub

Private Sub cmbReqdDate_Change()
    If Len(RTrim(cmbReqdDate.text)) <> 0 Then
         If Len(cmbReqdDate.text) = 2 Then
            If cmbReqdDate < 1 Or _
               cmbReqdDate > 31 Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbReqdDate.text = ""
               cmbReqdDate.SetFocus
            Else
               On Error Resume Next
               cmbReqdMonth.SetFocus
            End If
         End If
      End If
End Sub

Private Sub cmbReqdDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbReqdMonth_Change()
    If Len(RTrim(cmbReqdMonth.text)) <> 0 Then
         If Len(cmbReqdMonth.text) = 2 Then
            If cmbReqdMonth < 1 Or cmbReqdMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbReqdMonth.text = ""
               cmbReqdMonth.SetFocus
            Else
               On Error Resume Next
               txtReqdYear.SetFocus
            End If
         End If
      End If
End Sub

Private Sub cmbReqdMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdDetails_Click()
    getSwiftTransDetails
End Sub

Private Sub cmdFetchData_Click()
      
   reqdDate = Format(txtReqdYear, "!@@@@") & Format(cmbReqdMonth, "!@@") & Format(cmbReqdDate, "!@@")
      
   If Len(RTrim(reqdDate)) <> 0 Then
      If validDate(reqdDate) = False Then
         MsgBox errInvalidDate(UserLang)
         cmbReqdDate.SetFocus
         Exit Sub
      End If
   Else
      reqdDate = Space(8)
   End If
   
   reqdBranch = Space(4)
   If Len(RTrim(cmbBranchCode)) <> 0 Then
      reqdBranch = Mid$(cmbBranchCode, 1, 4)
   End If
   
   If optInitiatedFromBranch = True Then
      requestType = "0"
   ElseIf optCompleted = True Then
      requestType = "1"
   ElseIf optRejected = True Then
      requestType = "2"
   Else
      requestType = "3"
   End If
   
   formatSwiftTransferEnqRequest "00000", reqdDate, reqdBranch, requestType
   
   frmSwiftTransferEnq.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmSwiftTransferEnq.MousePointer = vbNormal
      Exit Sub
   End If
   frmSwiftTransferEnq.MousePointer = vbDefault
   parseSwiftTransferEnquiryDetails
   
   If recvSwiftTranferEnqMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvSwiftTranferEnqMsg.aRemarks
      Else
         MsgBox recvSwiftTranferEnqMsg.eRemarks
      End If
      Exit Sub
   End If
   
   displayResponseInGrid
   
End Sub

Private Sub cmdMore_Click()
    
   If recvSwiftTranferEnqMsg.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
      
   reqdDate = Format(txtReqdYear, "!@@@@") & Format(cmbReqdMonth, "!@@") & Format(cmbReqdDate, "!@@")
      
   If Len(RTrim(reqdDate)) <> 0 Then
      If validDate(reqdDate) = False Then
         MsgBox errInvalidDate(UserLang)
         cmbReqdDate.SetFocus
         Exit Sub
      End If
   Else
      reqdDate = Space(8)
   End If
   
   reqdBranch = Space(4)
   If Len(RTrim(cmbBranchCode)) <> 0 Then
      reqdBranch = Mid$(cmbBranchCode, 1, 4)
   End If
   
   formatSwiftTransferEnqRequest recvSwiftTranferEnqMsg.lastRecCount, reqdDate, reqdBranch, requestType
   
   frmSwiftTransferEnq.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmSwiftTransferEnq.MousePointer = vbNormal
      Exit Sub
   End If
   frmSwiftTransferEnq.MousePointer = vbDefault
   
   parseSwiftTransferEnquiryDetails
   
   If recvSwiftTranferEnqMsg.noOfRecs = "00" Then
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
      ChangePositions frmSwiftTransferEnq, 11800
      frmSwiftTransferEnq.RightToLeft = True
   End If
   
   frmSwiftTransferEnq.Caption = frmSwiftTransferEnqCaption(0, UserLang)
   lblSwiftTransferEnq.Caption = frmSwiftTransferEnqCaption(0, UserLang)
   lblReqdDate.Caption = frmSwiftTransferEnqCaption(1, UserLang)
   lblBranchCode.Caption = frmSwiftTransferEnqCaption(2, UserLang)
   lblRecordStatus.Caption = frmSwiftTransferEnqCaption(3, UserLang)
   optInitiatedFromBranch.Caption = frmSwiftTransferEnqCaption(4, UserLang)
   optCompleted.Caption = frmSwiftTransferEnqCaption(5, UserLang)
   optRejected.Caption = frmSwiftTransferEnqCaption(6, UserLang)
   optPendingWithBranch.Caption = frmSwiftTransferEnqCaption(7, UserLang)
   cmdFetchData.Caption = frmSwiftTransferEnqCaption(8, UserLang)
   cmdDetails.Caption = frmSwiftTransferEnqCaption(9, UserLang)
   cmdMore.Caption = frmSwiftTransferEnqCaption(10, UserLang)
   cmdCancel.Caption = frmSwiftTransferEnqCaption(11, UserLang)
      
   cmbReqdDate.Clear
   cmbReqdMonth.Clear
   For i = 1 To 31
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbReqdDate.AddItem num
       If i < 13 Then
          cmbReqdMonth.AddItem num
       End If
   Next

   mQry = "select branchcode,arabicname,englishname from branchinfo"
   Set rs = db.OpenRecordset(mQry)

   cmbBranchCode.AddItem "ALL - All branch"
   If rs.recordCount > 0 Then
      cmbBranchCode.Clear
      rs.MoveFirst
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbBranchCode.AddItem rs(0) & "-" & rs(2)
         Else
            cmbBranchCode.AddItem rs(0) & "-" & rs(1)
         End If
         rs.MoveNext
      Loop
   End If
   
   printGridHeading
   
End Sub
Public Sub displayResponseInGrid()

  printGridHeading
  For i = 1 To Val(recvSwiftTranferEnqMsg.noOfRecs)
      swiftTransferEnqGrid.Row = i
      swiftTransferEnqGrid.Col = 0
      swiftTransferEnqGrid.text = recvSwiftTranferEnqMsg.details(i).branchCode
      swiftTransferEnqGrid.Col = 1
      swiftTransferEnqGrid.text = recvSwiftTranferEnqMsg.details(i).transRefNo
      swiftTransferEnqGrid.Col = 2
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = formatDate(recvSwiftTranferEnqMsg.details(i).transDate)
      swiftTransferEnqGrid.Col = 3
      If Len(RTrim(recvSwiftTranferEnqMsg.details(i).transAmt)) = 0 Then
         tranAmt = 0
      Else
         If Not IsNumeric(Right(Trim(recvSwiftTranferEnqMsg.details(i).transAmt), 1)) Then
            tmpStr = "-" & bmAmtToDbl(recvSwiftTranferEnqMsg.details(i).transAmt)
            tranAmt = CDbl(tmpStr)
         Else
            tranAmt = CDbl(recvSwiftTranferEnqMsg.details(i).transAmt)
         End If
      End If
      mQry = "select decimalplace from currencyinfo " & _
             "where isocurrcode = '" & recvSwiftTranferEnqMsg.details(i).transCurr & "'"
            
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
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = recvSwiftTranferEnqMsg.details(i).transCurr & " " & Format(Format(amtToPrint, "##,###,###,###,##0" + _
                               IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
      swiftTransferEnqGrid.Col = 4
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = recvSwiftTranferEnqMsg.details(i).senderName
      swiftTransferEnqGrid.Col = 5
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = recvSwiftTranferEnqMsg.details(i).drAccNo
      swiftTransferEnqGrid.Col = 6
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = formatDate(recvSwiftTranferEnqMsg.details(i).valueDate)
      swiftTransferEnqGrid.Col = 7
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      
      tCode = recvSwiftTranferEnqMsg.details(i).pendingStatus
      If tCode = "1" Then
         tmpStr = errPendingWithSupervisor(UserLang)
      ElseIf tCode = "2" Then
         tmpStr = errPendingWithCso(UserLang)
      ElseIf tCode = "3" Then
         tmpStr = errRejected(UserLang)
      ElseIf tCode = "9" Then
         tmpStr = errCompleted(UserLang)
      Else
         tmpStr = errUnknown(UserLang)
      End If
      If Len(Trim(tCode)) > 0 Then
         swiftTransferEnqGrid.text = tCode & "-" & tmpStr
      End If
      swiftTransferEnqGrid.Col = 8
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = recvSwiftTranferEnqMsg.details(i).csoUserId
      swiftTransferEnqGrid.Col = 9
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = formatDate(Mid$(recvSwiftTranferEnqMsg.details(i).csoActionDateTime, 1, 8)) & "  " & _
                                  formatTime(Mid$(recvSwiftTranferEnqMsg.details(i).csoActionDateTime, 9, 6))
      swiftTransferEnqGrid.Col = 10
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = recvSwiftTranferEnqMsg.details(i).supervisorId
      swiftTransferEnqGrid.Col = 11
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = formatDate(Mid$(recvSwiftTranferEnqMsg.details(i).approvedDateTime, 1, 8)) & "  " & _
                                  formatTime(Mid$(recvSwiftTranferEnqMsg.details(i).approvedDateTime, 9, 6))
      swiftTransferEnqGrid.Col = 12
      swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      swiftTransferEnqGrid.text = recvSwiftTranferEnqMsg.details(i).homeBranch
   Next i
   swiftTransferEnqGrid.Row = 1
End Sub

Public Sub printGridHeading()
   Dim tWidth As Integer
   Dim colwidth(13) As Integer
   Dim rowTitle(13) As String
   
   colwidth(0) = 500
   colwidth(1) = 1200
   colwidth(2) = 1100
   colwidth(3) = 1500
   colwidth(4) = 2000
   colwidth(5) = 1200
   colwidth(6) = 1200
   colwidth(7) = 1200
   colwidth(8) = 800
   colwidth(9) = 800
   colwidth(10) = 800
   colwidth(11) = 800
   colwidth(12) = 500

   rowTitle(0) = "Branch Code"
   rowTitle(1) = "BP Reference"
   rowTitle(2) = "Trans.Date"
   rowTitle(3) = "Trans.Curr & Amount"
   rowTitle(4) = "Sender Name"
   rowTitle(5) = "Applicant A/C No."
   rowTitle(6) = "Value Date"
   rowTitle(7) = "Pending Status"
   rowTitle(8) = "CSO User Id "
   rowTitle(9) = "Date & Time"
   rowTitle(10) = "Supervisor Id"
   rowTitle(11) = "Approved Date & Time"
   rowTitle(12) = "Central Unit Branch"
   
   tWidth = 0
   swiftTransferEnqGrid.Clear
   swiftTransferEnqGrid.Row = 0
   For i = 0 To 12
      swiftTransferEnqGrid.Col = i
      If UserLang = ARABIC Then
         swiftTransferEnqGrid.CellAlignment = flexAlignRightCenter
      Else
         swiftTransferEnqGrid.CellAlignment = flexAlignLeftCenter
      End If
      swiftTransferEnqGrid.text = frmSwiftTransferEnqCaption(i + 12, UserLang)
      'swiftTransferEnqGrid.text = rowTitle(i)
      swiftTransferEnqGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
   Next i
   'swiftTransferEnqGrid.Width = tWidth
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameRecordStatus_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optCompleted_Click()
    cmbReqdDate.Enabled = True
    cmbReqdMonth.Enabled = True
    txtReqdYear.Enabled = True
    cmbReqdDate = ""
    cmbReqdMonth = ""
    txtReqdYear = ""
End Sub

Private Sub optInitiatedFromBranch_Click()
    cmbReqdDate.Enabled = True
    cmbReqdMonth.Enabled = True
    txtReqdYear.Enabled = True
    cmbReqdDate = ""
    cmbReqdMonth = ""
    txtReqdYear = ""
End Sub

Private Sub optPendingWithBranch_Click()
    cmbReqdDate = Space(2)
    cmbReqdMonth = Space(2)
    txtReqdYear = Space(4)
    cmbReqdDate.Enabled = False
    cmbReqdMonth.Enabled = False
    txtReqdYear.Enabled = False
End Sub

Private Sub optRejected_Click()
    cmbReqdDate.Enabled = True
    cmbReqdMonth.Enabled = True
    txtReqdYear.Enabled = True
    cmbReqdDate = ""
    cmbReqdMonth = ""
    txtReqdYear = ""
End Sub

Private Sub swiftTransferEnqGrid_DblClick()
    getSwiftTransDetails
End Sub

Public Sub getSwiftTransDetails()

    Dim tTransRefNo As String
    Dim tTransDate As String
    Dim tmpStr As String
    Dim tBranchCode As String
    Dim tDateTime As String
    Dim strmsglen As String
    Dim tCode As String
    Dim tuserId As String
    
    swiftTransferEnqGrid.Col = 1
    tTransRefNo = Format(swiftTransferEnqGrid.text, "!@@@@@@@@@@")
    swiftTransferEnqGrid.Col = 2
    tmpStr = swiftTransferEnqGrid.text
    tTransDate = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2)
   
    If Len(RTrim(tTransRefNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    tuserId = Format(gUserId, "!@@@@@@@@@@")
    
    If requestType = "0" Then
       SendMsg = "000048" & "83" & gBranchCode & tuserId & tTransRefNo & tTransDate & "03" & Space(14) & Space(50)
    Else
       swiftTransferEnqGrid.Col = 9
       tmpStr = swiftTransferEnqGrid.text
       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                   Mid$(tmpStr, 13, 2) & Mid$(tmpStr, 16, 2) & Mid$(tmpStr, 19, 2)
       tDateTime = Format(tDateTime, "00000000000000")
       swiftTransferEnqGrid.Col = 8
       tuserId = Format(swiftTransferEnqGrid.text, "!@@@@@@@@@@")
       swiftTransferEnqGrid.Col = 12
       tBranchCode = swiftTransferEnqGrid.text
       SendMsg = "000048" & "83" & gBranchCode & tuserId & tTransRefNo & tTransDate & "02" & tBranchCode & tDateTime & Space(50)
    End If
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSwiftTransferEnq.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmSwiftTransferEnq.MousePointer = vbDefault
       Exit Sub
    End If
    frmSwiftTransferEnq.MousePointer = vbDefault
    
    parseSarieTransferDetail
    
    If recvTransferDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTransferDetail.aRemarks
       Else
          MsgBox recvTransferDetail.eRemarks
       End If
       Exit Sub
    End If
    swiftUpdateAction = False
    swiftEnquiryAction = True
    swiftTellerAction = False
    swiftSupervisorAction = False
    frmSwiftTransferDetail.Show
    fillFrmSwiftTransferDetail
    
End Sub

Private Sub swiftTransferEnqGrid_KeyDown(KeyCode As Integer, Shift As Integer)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtReqdYear_Change()
    If Len(RTrim(txtReqdYear)) <> 0 Then
        If Len(RTrim(txtReqdYear)) = 4 Then
           cmbBranchCode.SetFocus
        End If
     End If
End Sub


Private Sub txtReqdYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
