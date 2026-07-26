VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSadadReversalPendingList 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00BFD87E&
   Caption         =   "Pending Request from Teller"
   ClientHeight    =   7095
   ClientLeft      =   1890
   ClientTop       =   330
   ClientWidth     =   12060
   ControlBox      =   0   'False
   LinkTopic       =   "Form3"
   MDIChild        =   -1  'True
   ScaleHeight     =   7095
   ScaleWidth      =   12060
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Height          =   375
      Left            =   7665
      TabIndex        =   8
      ToolTipText     =   "Refresh"
      Top             =   735
      Width           =   1695
   End
   Begin VB.TextBox txtTransRefNo 
      Height          =   375
      Left            =   2415
      TabIndex        =   7
      Top             =   705
      Visible         =   0   'False
      Width           =   1830
   End
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4665
      TabIndex        =   5
      ToolTipText     =   "Check pending List"
      Top             =   750
      Visible         =   0   'False
      Width           =   2295
   End
   Begin VB.CommandButton cmdGetDetails 
      Caption         =   "Get Details"
      Height          =   375
      Left            =   3420
      TabIndex        =   4
      Top             =   7275
      Width           =   1815
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   5355
      TabIndex        =   3
      Top             =   7275
      Width           =   1695
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   1620
      TabIndex        =   2
      Top             =   7275
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid sadadReversalPendingGrid 
      Height          =   5640
      Left            =   810
      TabIndex        =   1
      Top             =   1290
      Width           =   10035
      _ExtentX        =   17701
      _ExtentY        =   9948
      _Version        =   393216
      Rows            =   26
      Cols            =   7
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
   Begin VB.Label lblTransRefNo 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Trans. Ref. No."
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
      Left            =   990
      TabIndex        =   6
      Top             =   780
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label lblSadadReversalPendingActivity 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Pending Request from Teller"
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
      Left            =   2985
      TabIndex        =   0
      Top             =   120
      Width           =   4920
   End
End
Attribute VB_Name = "frmSadadReversalPendingList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCheckPendingList_Click()
  Dim tCustNo As String
'  If Len(Trim(Mid$(cmbBranchcode, 1, 4))) = 0 Then
'     cmbBranchcode = Space(4)
'  End If
'  If swiftSupervisorAction = True Then
'     frmEnquiry.readSwiftTransferPendingList "00000", "S", Mid$(cmbBranchcode, 1, 4)
'  Else
'     frmEnquiry.readSwiftTransferPendingList "00000", "T", Mid$(cmbBranchcode, 1, 4)
'  End If
'  CSD_mdiForm.staticStatus.Panels(3).text = "   "
'  displayResponseInGrid
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdGetDetails_Click()
    getSadadReversalPendingDetails
End Sub

Private Sub cmdMore_Click()
   Dim reqdTransRefNo As String
   Dim pendingFlag As String
   
   If recvSadadReversalPendingList.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
      
   If Len(RTrim(txtTransRefNo)) <> 0 Then
      reqdTransRefNo = Format(txtTransRefNo, "!@@@@@@@@@@")
   Else
      reqdTransRefNo = Space(10)
   End If
   
   If sadadSupervisorAction Then
      pendingFlag = "S"
   Else
      pendingFlag = "T"
   End If
   
   frmEnquiry.readSadadReversalPendingList recvSadadReversalPendingList.lastRecCount, pendingFlag, reqdTransRefNo
   
   If recvSadadReversalPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
   End If
      
   displayResponseInGrid
End Sub

Private Sub cmdRefresh_Click()
   Dim reqdTransRefNo As String
   Dim pendingFlag As String
   
   If Len(RTrim(txtTransRefNo)) <> 0 Then
      reqdTransRefNo = Format(txtTransRefNo, "!@@@@@@@@@@")
   Else
      reqdTransRefNo = Space(10)
   End If
   
   If sadadSupervisorAction Then
      pendingFlag = "S"
   Else
      pendingFlag = "T"
   End If
   
   frmEnquiry.readSadadReversalPendingList "00000", pendingFlag, reqdTransRefNo
   
   displayResponseInGrid

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

'    lblBranchCode.Caption = frmSwiftTransferPendingListCaption(2, UserLang)
'    cmdCheckPendingList.Caption = frmSwiftTransferPendingListCaption(3, UserLang)

    If sadadSupervisorAction = True Then
       lblSadadReversalPendingActivity.Caption = frmSadadReversalPendingListCaption(0, UserLang)
       frmSadadReversalPendingList.Caption = frmSadadReversalPendingListCaption(0, UserLang)
    ElseIf sadadTellerAction = True Then
       lblSadadReversalPendingActivity.Caption = frmSadadReversalPendingListCaption(1, UserLang)
       frmSadadReversalPendingList.Caption = frmSadadReversalPendingListCaption(1, UserLang)
    End If
    cmdRefresh.Caption = frmSadadReversalPendingListCaption(2, UserLang)
    cmdMore.Caption = frmSadadReversalPendingListCaption(3, UserLang)
    cmdGetDetails.Caption = frmSadadReversalPendingListCaption(4, UserLang)
    cmdExit.Caption = frmSadadReversalPendingListCaption(5, UserLang)
    
    displayResponseInGrid
End Sub

Public Sub displayResponseInGrid()

  printGridHeading
  For i = 1 To Val(recvSadadReversalPendingList.noOfRecs)
      sadadReversalPendingGrid.Row = i
      sadadReversalPendingGrid.Col = 0
      sadadReversalPendingGrid.text = recvSadadReversalPendingList.details(i).userId
      sadadReversalPendingGrid.Col = 1
      sadadReversalPendingGrid.text = recvSadadReversalPendingList.details(i).dateTime
      sadadReversalPendingGrid.Col = 2
      sadadReversalPendingGrid.CellAlignment = flexAlignLeftCenter
      sadadReversalPendingGrid.text = recvSadadReversalPendingList.details(i).tellerId
      sadadReversalPendingGrid.Col = 3
      sadadReversalPendingGrid.CellAlignment = flexAlignLeftCenter
      sadadReversalPendingGrid.text = recvSadadReversalPendingList.details(i).transRefNo
      sadadReversalPendingGrid.Col = 4
      sadadReversalPendingGrid.CellAlignment = flexAlignLeftCenter
      sadadReversalPendingGrid.text = recvSadadReversalPendingList.details(i).billerId
      sadadReversalPendingGrid.Col = 5
      sadadReversalPendingGrid.CellAlignment = flexAlignLeftCenter
      sadadReversalPendingGrid.text = recvSadadReversalPendingList.details(i).subsNo
      sadadReversalPendingGrid.Col = 6
      sadadReversalPendingGrid.CellAlignment = flexAlignLeftCenter
      sadadReversalPendingGrid.text = Format(Format(Val(recvSadadReversalPendingList.details(i).billAmt) / 100, "##,###,###,###,##0.00"), "!@@@@@@@@@@@@@@@@@")
   Next i
   sadadReversalPendingGrid.Row = 1
End Sub

Public Sub printGridHeading()
   Dim tWidth As Integer
   Dim colwidth(8) As Integer
   Dim rowTitle(8) As String
   
   colwidth(0) = 1000
   colwidth(1) = 1500
   colwidth(2) = 1000
   colwidth(3) = 1500
   colwidth(4) = 1000
   colwidth(5) = 2000
   colwidth(6) = 1500
      

   rowTitle(0) = "User Id"
   rowTitle(1) = "Date & Time"
   rowTitle(2) = "Teller Id"
   rowTitle(3) = "Trans Ref.No."
   rowTitle(4) = "Biller Id"
   rowTitle(5) = "Subscription Number"
   rowTitle(6) = "Bill Amount"
   
   tWidth = 0
   sadadReversalPendingGrid.Clear
   sadadReversalPendingGrid.Row = 0
   For i = 0 To 6
      sadadReversalPendingGrid.Col = i
      If UserLang = ARABIC Then
         sadadReversalPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         sadadReversalPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      sadadReversalPendingGrid.text = frmSadadReversalPendingListCaption(i + 6, UserLang)
      'sadadReversalPendingGrid.text = rowTitle(i)
      sadadReversalPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
   Next i
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub sadadReversalPendingGrid_DblClick()
    getSadadReversalPendingDetails
End Sub

Public Sub getSadadReversalPendingDetails()

    Dim tTransRefNo As String
    Dim tTellerId As String
    Dim strmsglen As String
    Dim tCode As String
    Dim tUserid As String
    
    sadadReversalPendingGrid.Col = 0
    tUserid = Format(sadadReversalPendingGrid.text, "!@@@@@@@@@@")
    sadadReversalPendingGrid.Col = 2
    tTellerId = Format(sadadReversalPendingGrid.text, "!@@@")
    sadadReversalPendingGrid.Col = 3
    tTransRefNo = sadadReversalPendingGrid.text
       
    If Len(RTrim(tUserid)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    SendMsg = "000048" & "AU" & gBranchCode & tUserid & tTellerId & tTransRefNo & recvLoginMsg.bankingDate & Space(50)
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSadadReversalPendingList.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmSadadReversalPendingList.MousePointer = vbDefault
       Exit Sub
    End If
    frmSadadReversalPendingList.MousePointer = vbDefault
    
    parseBillReversalMsg

    If recvBillReversalMsg.status <> "000" Then
       If UserLang = ENGLISH Then
          MsgBox recvBillReversalMsg.eRemarks
       Else
          MsgBox recvBillReversalMsg.aRemarks
       End If
       Exit Sub
    Else
       If sadadTellerAction = True Then
          frmSadadPayment.tag = "R"    ' Reversal
          frmSadadPayment.cmdPayBill.Caption = frmSadadPaymentCaption(31, UserLang) '"REVERSE"
       Else
          frmSadadPayment.tag = "A"    ' Supervisor Approval
          frmSadadPayment.cmdPayBill.Caption = frmSadadPaymentCaption(34, UserLang)  '"Approve"
          frmSadadPayment.cmdReject.Visible = True
          frmSadadPayment.cmdReject.Refresh
          frmSadadPayment.cmdReject.Enabled = True
          frmSadadPayment.cmdReject.Caption = frmSadadPaymentCaption(32, UserLang) '"Reject the reversal"
       End If
       fillSadadPaymentForm
       frmSadadPayment.frameEnquiryDetails.Enabled = False
       frmSadadPayment.framePaymentDetails.Enabled = True
       frmSadadPayment.frameBillDetails.Enabled = False
       frmSadadPayment.txtPaymentAmt.Enabled = False
       frmSadadPayment.txtDebitAccNo.Enabled = False
       frmSadadPayment.cmbPaymentType.Enabled = False
       frmSadadPayment.cmdSigCap.Enabled = False
       frmSadadPayment.frameCashOrAcc.Enabled = False
       frmSadadPayment.lblUtilityBillPayment.Caption = frmSadadPaymentCaption(1, UserLang) '"Utility Bill Reversal in SADAD"
       frmSadadPayment.Caption = frmSadadPaymentCaption(1, UserLang) '"Utility Bill Reversal in SADAD"
       frmSadadPayment.Show
    End If
End Sub

Private Sub sadadReversalPendingGrid_KeyDown(KeyCode As Integer, Shift As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub sadadReversalPendingGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
