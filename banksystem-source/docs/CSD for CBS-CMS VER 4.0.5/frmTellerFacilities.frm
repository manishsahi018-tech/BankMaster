VERSION 5.00
Begin VB.Form frmTellerFacilities 
   BackColor       =   &H00BFD87E&
   Caption         =   "Teller Facilities"
   ClientHeight    =   8595
   ClientLeft      =   3735
   ClientTop       =   450
   ClientWidth     =   11685
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8595
   ScaleWidth      =   11685
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4215
      TabIndex        =   5
      Top             =   6540
      Width           =   1260
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go"
      Default         =   -1  'True
      Height          =   375
      Left            =   6255
      TabIndex        =   4
      Top             =   1200
      Width           =   930
   End
   Begin VB.ListBox lstAllTellerTxns 
      Height          =   4350
      ItemData        =   "frmTellerFacilities.frx":0000
      Left            =   1965
      List            =   "frmTellerFacilities.frx":0002
      TabIndex        =   3
      Top             =   1845
      Width           =   4590
   End
   Begin VB.TextBox txtSelectedTxn 
      Height          =   285
      Left            =   3255
      MaxLength       =   30
      TabIndex        =   0
      Text            =   " "
      Top             =   1275
      Width           =   2565
   End
   Begin VB.Label lblSelectedTxn 
      BackColor       =   &H00BFD87E&
      Caption         =   "Select desired transaction"
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
      Left            =   390
      TabIndex        =   2
      Top             =   1305
      Width           =   2805
   End
   Begin VB.Label lblTellerFacilities 
      BackColor       =   &H00BFD87E&
      Caption         =   "Teller Facilities"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   315
      Left            =   3315
      TabIndex        =   1
      Top             =   270
      Width           =   2115
   End
End
Attribute VB_Name = "frmTellerFacilities"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdGo_Click()
    Dim txnCode As String
    Dim refNoForReversal As String
    Dim strmsglen As String
    Dim actualRefNo As String
    
    If Len(RTrim(txtSelectedTxn)) = 0 Then
       MsgBox errSelectTxn(UserLang)  ' "Select a transaction to execute..."
       Exit Sub
    End If
    txnCode = Mid$(txtSelectedTxn, 1, 3)
    If txnCode = "001" Then
       frmSadadPayment.tag = "N"
       frmSadadPayment.lblUtilityBillPayment.Caption = frmSadadPaymentCaption(0, UserLang) '"Utility Bill Payment through SADAD"
       frmSadadPayment.Caption = frmSadadPaymentCaption(0, UserLang) '"Utility Bill Payment through SADAD"
       frmSadadPayment.cmdPayBill.Caption = frmSadadPaymentCaption(30, UserLang) ' "POST"
       frmSadadPayment.Show
    ElseIf txnCode = "002" Then
       refNoForReversal = InputBox(errEnterRefNoForReversal(UserLang))
       If refNoForReversal = "" Then
          Exit Sub
       End If
       refNoForReversal = UCase(refNoForReversal)
       If Mid$(refNoForReversal, 1, 3) <> recvLoginMsg.bpUserId Then
          MsgBox errTxnDoneByAnotherTeller(UserLang)  '"This transaction is performed by different teller...Reversal not allowed"
          Exit Sub
       End If
       'actualRefNo = Mid$(refNoForReversal, 5, 3) & Mid$(refNoForReversal, 9, 7)
       
       SendMsg = "000000" & "AU" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & recvLoginMsg.bpUserId & _
                 Format(refNoForReversal, "!@@@@@@@@@@") & recvLoginMsg.bankingDate & Space(50)
       strmsglen = Format(Len(SendMsg), "000000")
       Mid$(SendMsg, 1, 6) = strmsglen
       DataReceivedFlag = False
       frmTellerFacilities.MousePointer = vbHourglass
  
       If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
          LoadError = True
          frmTellerFacilities.MousePointer = vbNormal
          Exit Sub
       End If
   
       frmTellerFacilities.MousePointer = vbNormal
       
       parseBillReversalMsg

       If recvBillReversalMsg.status <> "000" Then
          If UserLang = ENGLISH Then
             MsgBox recvBillReversalMsg.eRemarks
          Else
             MsgBox recvBillReversalMsg.aRemarks
          End If
          Exit Sub
       Else
          frmSadadPayment.tag = "S"    ' Send to supervisor
          fillSadadPaymentForm
          frmSadadPayment.frameEnquiryDetails.Enabled = False
          frmSadadPayment.framePaymentDetails.Enabled = True
          frmSadadPayment.txtPaymentAmt.Enabled = False
          frmSadadPayment.txtDebitAccNo.Enabled = False
          frmSadadPayment.cmbPaymentType.Enabled = False
          frmSadadPayment.cmdSigCap.Enabled = False
          frmSadadPayment.frameCashOrAcc.Enabled = False
          frmSadadPayment.lblUtilityBillPayment.Caption = frmSadadPaymentCaption(1, UserLang) '"Utility Bill Reversal in SADAD"
          frmSadadPayment.Caption = frmSadadPaymentCaption(1, UserLang) '"Utility Bill Reversal in SADAD"
          frmSadadPayment.cmdPayBill.Caption = frmSadadPaymentCaption(33, UserLang) '"Send it to supervisor"
          frmSadadPayment.Show
       End If
    Else
       MsgBox errInvalidTxnSelected(UserLang) '"Invalid transaction selected...Please check"
    End If
       
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    
    Dim tlrFacilityTitle(10) As String
    Dim i As Integer
    
'    tlrFacilityTitle(1) = "001-SADAD payment"
'    tlrFacilityTitle(2) = "002-SADAD payment-Reversal"

    If UserLang = ARABIC Then
       ChangePositions frmTellerFacilities, 11800
       frmTellerFacilities.RightToLeft = True
    End If
    
    frmTellerFacilities.Caption = frmTellerFacilitiesCaption(0, UserLang)
    lblTellerFacilities.Caption = frmTellerFacilitiesCaption(0, UserLang)
    lblSelectedTxn.Caption = frmTellerFacilitiesCaption(1, UserLang)
    cmdGo.Caption = frmTellerFacilitiesCaption(2, UserLang)
    cmdCancel.Caption = frmTellerFacilitiesCaption(3, UserLang)
    
    For i = 0 To 1
       'lstAllTellerTxns.AddItem tlrFacilityTitle(i)
       lstAllTellerTxns.AddItem frmTellerFacilitiesCaption(i + 4, UserLang)
    Next

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Terminate()
    Unload Me
End Sub

Private Sub lstAllTellerTxns_Click()
   Dim i As Integer
   If lstAllTellerTxns.ListIndex >= 0 Then
      txtSelectedTxn = lstAllTellerTxns.List(lstAllTellerTxns.ListIndex)
   Else
      MsgBox errSelectTxn(UserLang) '("Select an transaction to execute")
      Exit Sub
   End If
End Sub

Private Sub lstAllTellerTxns_DblClick()
   Dim i As Integer
   If lstAllTellerTxns.ListIndex >= 0 Then
      txtSelectedTxn = lstAllTellerTxns.List(lstAllTellerTxns.ListIndex)
   Else
      MsgBox errSelectTxn(UserLang) '("Select an transaction to execute")
   End If
   cmdGo_Click
End Sub

Private Sub lstAllTellerTxns_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtSelectedTxn_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtSelectedTxn_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
