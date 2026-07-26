VERSION 5.00
Begin VB.Form frmAccDormant 
   BackColor       =   &H00BFD87E&
   Caption         =   "Dormant Account Activation"
   ClientHeight    =   7650
   ClientLeft      =   60
   ClientTop       =   510
   ClientWidth     =   11880
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7650
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdApprove 
      Caption         =   "Approve"
      Height          =   495
      Left            =   2535
      TabIndex        =   21
      ToolTipText     =   "Approve"
      Top             =   5760
      Width           =   1815
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   495
      Left            =   4320
      TabIndex        =   20
      ToolTipText     =   "Reject"
      Top             =   5760
      Width           =   1815
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   6135
      TabIndex        =   19
      ToolTipText     =   "Cancel"
      Top             =   5760
      Width           =   1695
   End
   Begin VB.Frame frameAccDormant 
      BackColor       =   &H00BFD87E&
      Height          =   3855
      Left            =   600
      TabIndex        =   7
      Top             =   1560
      WhatsThisHelpID =   16777215
      Width           =   10215
      Begin VB.ComboBox cmbPrevAccStatus 
         Height          =   315
         Left            =   7440
         TabIndex        =   24
         Tag             =   "10215"
         Top             =   2520
         Width           =   2295
      End
      Begin VB.ComboBox cmbBranchCode 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2520
         TabIndex        =   22
         Tag             =   "10215"
         Top             =   3120
         Width           =   2295
      End
      Begin VB.TextBox txtDateTime 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7440
         TabIndex        =   17
         Tag             =   "10215"
         Top             =   1920
         Width           =   2295
      End
      Begin VB.TextBox txtCurrencyName 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3600
         TabIndex        =   14
         Tag             =   "10215"
         Top             =   240
         Width           =   2895
      End
      Begin VB.TextBox txtSubAcc 
         Height          =   285
         Left            =   2520
         MaxLength       =   2
         TabIndex        =   3
         Tag             =   "10215"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox txtCustNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2520
         TabIndex        =   13
         Tag             =   "10215"
         Top             =   960
         Width           =   855
      End
      Begin VB.TextBox txtMemoNo 
         Height          =   285
         Left            =   2520
         MaxLength       =   3
         TabIndex        =   1
         Tag             =   "10215"
         Top             =   600
         Width           =   495
      End
      Begin VB.TextBox txtCsoUserId 
         Height          =   285
         Left            =   2520
         MaxLength       =   5
         TabIndex        =   5
         Tag             =   "10215"
         Top             =   1920
         Width           =   975
      End
      Begin VB.TextBox txtCustomerName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3600
         TabIndex        =   6
         Tag             =   "10215"
         Top             =   990
         Width           =   3855
      End
      Begin VB.TextBox txtCurrencyNo 
         Height          =   285
         Left            =   2520
         MaxLength       =   2
         TabIndex        =   0
         Tag             =   "10215"
         Top             =   240
         Width           =   375
      End
      Begin VB.TextBox txtAcctDesc 
         Height          =   285
         Left            =   3600
         MaxLength       =   30
         TabIndex        =   2
         Tag             =   "10215"
         Top             =   600
         Width           =   2895
      End
      Begin VB.ComboBox cmbAcctStatus 
         Height          =   315
         Left            =   2520
         TabIndex        =   4
         Tag             =   "10215"
         Top             =   2520
         Width           =   2295
      End
      Begin VB.Label lblPrevAccStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Previous A/c Status"
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
         Left            =   5040
         TabIndex        =   25
         Tag             =   "10215"
         Top             =   2520
         Width           =   2175
      End
      Begin VB.Label lblBranchCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Branch Code"
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
         Left            =   480
         TabIndex        =   23
         Tag             =   "10215"
         Top             =   3120
         Width           =   1455
      End
      Begin VB.Label lblDateTime 
         BackColor       =   &H00BFD87E&
         Caption         =   "Date and Time"
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
         Left            =   5040
         TabIndex        =   18
         Tag             =   "10215"
         Top             =   1920
         Width           =   1575
      End
      Begin VB.Label lblSubAc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Sub Account"
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
         Left            =   480
         TabIndex        =   16
         Tag             =   "10215"
         Top             =   1320
         Width           =   1575
      End
      Begin VB.Label lblLedger 
         BackColor       =   &H00BFD87E&
         Caption         =   "Ledger"
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
         Left            =   480
         TabIndex        =   15
         Tag             =   "10215"
         Top             =   600
         Width           =   1335
      End
      Begin VB.Label lblCsoUserId 
         BackColor       =   &H00BFD87E&
         Caption         =   "CSO UserId"
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
         Left            =   480
         TabIndex        =   12
         Tag             =   "10215"
         Top             =   1920
         Width           =   1215
      End
      Begin VB.Label lblCustomer 
         BackColor       =   &H00BFD87E&
         Caption         =   "Customer No"
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
         Left            =   480
         TabIndex        =   11
         Tag             =   "10215"
         Top             =   960
         Width           =   1695
      End
      Begin VB.Label lblAcctStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Account Status"
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
         Left            =   480
         TabIndex        =   10
         Tag             =   "10215"
         Top             =   2520
         Width           =   1575
      End
      Begin VB.Label lblCurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Currency"
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
         Left            =   480
         TabIndex        =   9
         Tag             =   "10215"
         Top             =   240
         Width           =   1815
      End
   End
   Begin VB.Label lblDormantAccActivation 
      BackColor       =   &H00BFD87E&
      Caption         =   "Dormant Account Activation"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   3600
      TabIndex        =   8
      Top             =   240
      Width           =   4815
   End
End
Attribute VB_Name = "frmAccDormant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdApprove_Click()
   Dim strmsglen As String
   Dim tuserId As String
   Dim tDateTime As String, tBranchCode As String, tSupervisorId As String
   Dim tAccNo As String
  
'   frmAcctPendingList.accPendingGrid.Col = 0
'   tuserId = Format(frmAcctPendingList.accPendingGrid.text, "!@@@@@@@@@@")
'   frmAcctPendingList.accPendingGrid.Col = 1
'   tDateTime = Format(frmAcctPendingList.accPendingGrid.text, "00000000000000")
'   tBranchCode = gBranchCode
'
'   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
'
'   SendMsg = "000268" & "34" & gBranchCode & "A" & tuserId & tDateTime & _
'             tSupervisorId & Space(200) & recvAccPendingDetail.newOrUpdate & Space(50)
'
'   strmsglen = Format(Len(SendMsg), "000000")
'   Mid$(SendMsg, 1, 6) = strmsglen
'   DataReceivedFlag = False
'   frmAccDormant.MousePointer = vbHourglass
'
'   frmAccDormant.cmdApprove.Enabled = False
'   frmAccDormant.cmdCancel.Enabled = False
'   frmAccDormant.cmdReject.Enabled = False
'
'   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
'   If ReturnStatus = LocalCommsError Then
'      LoadError = True
'      frmAccDormant.MousePointer = vbDefault
'      frmAccDormant.cmdApprove.Enabled = True
'      frmAccDormant.cmdCancel.Enabled = True
'      frmAccDormant.cmdReject.Enabled = True
'      Exit Sub
'   End If
'
'   frmAccDormant.MousePointer = vbDefault
'   frmAccDormant.cmdApprove.Enabled = True
'   frmAccDormant.cmdCancel.Enabled = True
'   frmAccDormant.cmdReject.Enabled = True
'
'   If recvAccApprovalMsg.status = "000" Then
'      MsgBox errSuccessful(UserLang)
'      If recvAccPendingDetail.newOrUpdate = "N" Then
'         MsgBox errAccNoIs(UserLang) & recvAccApprovalMsg.accNo
'      End If
'   Else
'      If recvAccApprovalMsg.status = "114" Then 'while BOC activates dormant, If the ZERO amt
'                                                'transaction failed, CSD will return status
'                                                'as 114
'         MsgBox errZeroAmtTxnFailed(UserLang)
'      ElseIf UserLang = ARABIC Then
'         MsgBox recvAccApprovalMsg.aRemarks
'      Else
'         MsgBox recvAccApprovalMsg.eRemarks
'      End If
'      unloadAccDormantForms
'      Exit Sub
'   End If
'   If realOrPseudo = "1" Then
'      updateBp
'   End If
'
'   unloadAccDormantForms
End Sub

Public Function updateBp() As Integer

   If openAcctFile = 1 Then
      updateBp = 1
      Exit Function
   End If
   
   If recvAccPendingDetail.newOrUpdate = "U" Then
      If readAccount(recvAccPendingDetail.accNo) = 1 Then
         closeAcct
         updateBp = 1
         Exit Function
      End If
   End If
        
    ' form the acctinfo to insert into BranchPower DB
    AccBuf.recType = "02"
    AccBuf.accNo = Format(recvAccPendingDetail.accNo, "!@@@@@@@@@@@@@@@@@@@@")
    AccBuf.ledgerSubLedg = Space(4)
    Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " + _
                               "'" + Mid$(AccBuf.accNo, 1, 2) + "'")
    If rs.recordCount > 0 Then
       AccBuf.currency = rs(0)
    Else
       AccBuf.currency = "SAR"
    End If
    AccBuf.accType = Space(4)
    If txtMemoNo = "008" Then
       AccBuf.Description = Format("Current A/C", "!" & String(30, "@"))
    ElseIf txtMemoNo = "009" Then
       AccBuf.Description = Format("Saving A/C", "!" & String(30, "@"))
    Else
       AccBuf.Description = Format("Other A/C", "!" & String(30, "@"))
    End If
    AccBuf.clientNo = Format(Mid$(recvAccPendingDetail.accNo, 6, 7), "!@@@@@@@@@")
    AccBuf.stopBlock = Space(1)
    AccBuf.drLimit = String(18, "0")
    AccBuf.drLimitExp = String(8, "0")
    AccBuf.clearTrans = String(18, "0")
    AccBuf.bookTrans = String(18, "0")
    AccBuf.filler = Space(3)
    AccBuf.clearedBal = String(18, "0")
    AccBuf.bookBal = String(18, "0")
    AccBuf.garnHold = String(18, "0")
    AccBuf.lienHold = String(18, "0")
    AccBuf.plgeHold = String(18, "0")
    AccBuf.secRatg = "00"
    AccBuf.lastDate = CStr(Year(Date)) & Format(CStr(Month(Date)), "00") & Format(CStr(Day(Date)), "00")
    AccBuf.altAccNo = Space(20)
    AccBuf.pwProtected = Mid$(frmAccount.cmbAcctStatus, 2, 1)
    AccBuf.filler1 = Space(65)
    
    If recvAccPendingDetail.newOrUpdate = "U" Then
       If updateAccount = 1 Then
          closeAcct
          updateBp = 1
          Exit Function
       End If
    Else
       If insertAccount = 1 Then
          closeAcct
          updateBp = 1
          Exit Function
       End If
    End If
    
    closeAcct
    updateBp = 0

End Function
Private Sub unloadAccDormantForms()
   Dim tCustNo As String
'   If Len(Trim(frmAcctPendingList.txtCustomerNo)) = 0 Then
'      tCustNo = Space(7)
'   Else
'      tCustNo = Format(frmAcctPendingList.txtCustomerNo, "0000000")
'   End If
'   Unload Me
'   Unload frmAcctPendingList
'   frmEnquiry.readAccPendingList "00000", "S", tCustNo
'   frmAcctPendingList.Show
End Sub

Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdReject_Click()
   Dim strmsglen As String
   Dim tuserId As String, tDateTime As String
   Dim tBranchCode As String, tSupervisorId As String, tComments As String
   
'   frmAcctPendingList.accPendingGrid.Col = 0
'   tuserId = Format(frmAcctPendingList.accPendingGrid.text, "!@@@@@@@@@@")
'   frmAcctPendingList.accPendingGrid.Col = 1
'   tDateTime = Format(frmAcctPendingList.accPendingGrid.text, "00000000000000")
'   tBranchCode = gBranchCode
'
'   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
'
'   tComments = Space(200)
'
'   SendMsg = "000268" & "34" & gBranchCode & "R" & tuserId & tDateTime & _
'             tSupervisorId & tComments & recvAccPendingDetail.newOrUpdate & Space(50)
'
'   strmsglen = Format(Len(SendMsg), "000000")
'   Mid$(SendMsg, 1, 6) = strmsglen
'   DataReceivedFlag = False
'   frmAccDormant.MousePointer = vbHourglass
'   cmdApprove.Enabled = False
'   cmdReject.Enabled = False
'   cmdCancel.Enabled = False
'
'   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
'   If ReturnStatus = LocalCommsError Then
'      LoadError = True
'      frmAccDormant.MousePointer = vbNormal
'      cmdApprove.Enabled = True
'      cmdReject.Enabled = True
'      cmdCancel.Enabled = True
'      Exit Sub
'   End If
'
'   frmAccDormant.MousePointer = vbNormal
'   cmdApprove.Enabled = True
'   cmdReject.Enabled = True
'   cmdCancel.Enabled = True
'
'   If recvAccApprovalMsg.status = "000" Then
'      MsgBox errSuccessful(UserLang)
'   Else
'      If UserLang = ARABIC Then
'         MsgBox recvAccApprovalMsg.aRemarks
'      Else
'         MsgBox recvAccApprovalMsg.eRemarks
'      End If
'   End If
'
'   unloadAccDormantForms

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
  
  If UserLang = ARABIC Then
     ChangePositions frmAccDormant, 11800
     frmAccDormant.RightToLeft = True
     frmAccDormant.txtCustomerName.RightToLeft = True
     frmAccDormant.txtCustomerName.Alignment = 1
     frmAccDormant.txtAcctDesc.Alignment = 1
     frmAccDormant.txtCurrencyName.Alignment = 1
  End If
  
  frmAccDormant.Caption = frmAccDormantCaption(0, UserLang)
  frmAccDormant.lblDormantAccActivation.Caption = frmAccDormantCaption(0, UserLang)
  frmAccDormant.lblCurrency.Caption = frmAccDormantCaption(1, UserLang)
  frmAccDormant.lblLedger.Caption = frmAccDormantCaption(2, UserLang)
  frmAccDormant.lblCustomer.Caption = frmAccDormantCaption(3, UserLang)
  frmAccDormant.lblSubAc.Caption = frmAccDormantCaption(4, UserLang)
  frmAccDormant.lblCsoUserId.Caption = frmAccDormantCaption(5, UserLang)
  frmAccDormant.lblDateTime.Caption = frmAccDormantCaption(6, UserLang)
  frmAccDormant.lblAcctStatus.Caption = frmAccDormantCaption(7, UserLang)
  frmAccDormant.lblPrevAccStatus.Caption = frmAccDormantCaption(8, UserLang)
  
  frmAccDormant.lblBranchCode.Caption = frmAccDormantCaption(9, UserLang)
  frmAccDormant.cmdApprove.Caption = frmAccDormantCaption(10, UserLang)
  frmAccDormant.cmdReject.Caption = frmAccDormantCaption(11, UserLang)
  frmAccDormant.cmdCancel.Caption = frmAccDormantCaption(12, UserLang)
 
  Set rs = db.OpenRecordset("select * from accountstatusinfo")
  If rs.recordCount > 0 Then
     rs.MoveFirst
     cmbAcctStatus.Clear
     cmbPrevAccStatus.Clear
     Do While Not rs.EOF
        If UserLang = ENGLISH Then
           cmbAcctStatus.AddItem rs("statuscode") & " - " & rs("englishname")
           cmbPrevAccStatus.AddItem rs("statuscode") & " - " & rs("englishname")
        Else
           cmbAcctStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
           cmbPrevAccStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
        End If
        rs.MoveNext
     Loop
     cmbAcctStatus.ListIndex = 0
     cmbPrevAccStatus.ListIndex = 0
  End If
  
  Set rs = db.OpenRecordset("select * from branchinfo")
  If rs.recordCount > 0 Then
     rs.MoveFirst
     cmbBranchcode.Clear
     Do While Not rs.EOF
        If UserLang = ENGLISH Then
           cmbBranchcode.AddItem rs("branchcode") & " - " & rs("englishname")
         Else
           cmbBranchcode.AddItem rs("branchcode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
     Loop
   End If
   If rs.recordCount > 1 Then
      cmbBranchcode.ListIndex = 1
   End If
   
   frameAccDormant.Enabled = False
  
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameAccDormant_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
