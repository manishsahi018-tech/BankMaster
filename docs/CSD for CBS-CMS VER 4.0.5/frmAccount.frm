VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmAccountGrid 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account"
   ClientHeight    =   8355
   ClientLeft      =   1035
   ClientTop       =   390
   ClientWidth     =   11385
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8355
   ScaleWidth      =   11385
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdRenewTd 
      Caption         =   "Renew Time Deposit"
      Enabled         =   0   'False
      Height          =   495
      Left            =   5085
      TabIndex        =   27
      ToolTipText     =   "Renew Time Deposit"
      Top             =   8340
      Visible         =   0   'False
      Width           =   1635
   End
   Begin VB.CommandButton cmdNewTimeDeposit 
      Caption         =   "New Time Deposit A/c"
      Enabled         =   0   'False
      Height          =   495
      Left            =   3450
      TabIndex        =   26
      ToolTipText     =   "New Time Deposit A/c"
      Top             =   8340
      Visible         =   0   'False
      Width           =   1635
   End
   Begin VB.CommandButton cmdDiary 
      Caption         =   "Diary Information"
      Enabled         =   0   'False
      Height          =   495
      Left            =   2910
      TabIndex        =   25
      ToolTipText     =   "Diary Information"
      Top             =   8340
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.CommandButton cmdHistory 
      Caption         =   "A/C Update History"
      Height          =   495
      Left            =   8925
      TabIndex        =   24
      ToolTipText     =   "A/C Update History"
      Top             =   7140
      Width           =   1800
   End
   Begin VB.CommandButton cmdBlockBreakup 
      Caption         =   "Blocked amount Breakup"
      Height          =   495
      Left            =   6990
      TabIndex        =   23
      ToolTipText     =   "Blocked Amount breakup"
      Top             =   7140
      Width           =   1935
   End
   Begin VB.CommandButton cmdTransEnq 
      Caption         =   "Transaction Type Enquiry"
      Height          =   495
      Left            =   3120
      TabIndex        =   22
      ToolTipText     =   "BM Transaction Enquiry"
      Top             =   7140
      Width           =   1935
   End
   Begin VB.CommandButton cmdTransferEnq 
      Caption         =   "SARIE Transfer Enquiry"
      Height          =   495
      Left            =   5070
      TabIndex        =   21
      ToolTipText     =   "Transfer Enquiry"
      Top             =   7140
      Width           =   1935
   End
   Begin VB.CommandButton cmdDestroyCheque 
      Caption         =   "Destroy Cheque"
      Height          =   495
      Left            =   330
      TabIndex        =   20
      ToolTipText     =   "Destroy Cheque"
      Top             =   7140
      Width           =   1455
   End
   Begin VB.CommandButton cmdStopCheque 
      Caption         =   "Stop Cheque"
      Height          =   495
      Left            =   8610
      TabIndex        =   19
      ToolTipText     =   "Stop Cheque"
      Top             =   6525
      Width           =   1455
   End
   Begin VB.CommandButton cmdActivateDormant 
      Caption         =   "Activate Dormant A/c"
      Enabled         =   0   'False
      Height          =   495
      Left            =   9210
      TabIndex        =   18
      ToolTipText     =   "Activate Dormant A/c"
      Top             =   8220
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CommandButton cmdHistStmt 
      Caption         =   "Historical Statement"
      Height          =   495
      Left            =   1785
      TabIndex        =   17
      ToolTipText     =   "Historical Statement"
      Top             =   7140
      Width           =   1335
   End
   Begin VB.TextBox txtCustName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
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
      Left            =   6240
      TabIndex        =   16
      Top             =   720
      Width           =   5175
   End
   Begin VB.TextBox txtCustNo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
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
      Left            =   2760
      TabIndex        =   14
      Top             =   720
      Width           =   1215
   End
   Begin VB.CommandButton cmdStdOrd 
      Caption         =   "Standing Order"
      Height          =   495
      Left            =   7155
      TabIndex        =   11
      ToolTipText     =   "Standing Order"
      Top             =   6540
      Width           =   1455
   End
   Begin VB.CommandButton cmdChqBkRecdByBranch 
      Caption         =   "Cheque Book Received by Branch"
      Enabled         =   0   'False
      Height          =   495
      Left            =   -870
      TabIndex        =   9
      ToolTipText     =   "Cheque Book Received by branch"
      Top             =   8505
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.CommandButton cmdChqBkIssuedToCust 
      Caption         =   "Cheque Book issued to  Customer"
      Enabled         =   0   'False
      Height          =   495
      Left            =   1215
      TabIndex        =   10
      ToolTipText     =   "Cheque Book issue to customer"
      Top             =   8295
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.CommandButton cmdChequeBook 
      Caption         =   "Cheque Book Request"
      Height          =   495
      Left            =   5310
      TabIndex        =   7
      ToolTipText     =   "Cheque Book Request"
      Top             =   6540
      Width           =   1830
   End
   Begin VB.CommandButton cmdTransaction 
      Caption         =   "Transaction Inquiry"
      Height          =   495
      Left            =   4095
      TabIndex        =   6
      ToolTipText     =   "Transaction Inquiry"
      Top             =   6540
      Width           =   1215
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   10080
      TabIndex        =   8
      ToolTipText     =   "Exit"
      Top             =   6525
      Width           =   1455
   End
   Begin MSFlexGridLib.MSFlexGrid accountGrid 
      Height          =   5295
      Left            =   360
      TabIndex        =   12
      Top             =   1200
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   9340
      _Version        =   393216
      Rows            =   22
      Cols            =   10
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      BackColorSel    =   8388608
      GridColorFixed  =   8388608
      FocusRect       =   2
      HighLight       =   2
      SelectionMode   =   1
      AllowUserResizing=   1
   End
   Begin VB.CommandButton cmdStatement 
      Caption         =   "On Demand  Statement"
      Height          =   495
      Left            =   2760
      TabIndex        =   5
      ToolTipText     =   "On Demand Statement"
      Top             =   6540
      Width           =   1335
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   1545
      TabIndex        =   4
      ToolTipText     =   "More"
      Top             =   6540
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnquiry 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Enquiry"
      Height          =   495
      Left            =   330
      TabIndex        =   3
      ToolTipText     =   "Enquiry"
      Top             =   6540
      Width           =   1215
   End
   Begin VB.CommandButton cmdUpdateAc 
      Caption         =   "Update A/C"
      Enabled         =   0   'False
      Height          =   495
      Left            =   7965
      TabIndex        =   2
      ToolTipText     =   "Update A/c"
      Top             =   8325
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdNewAcct 
      Caption         =   "New A/C"
      Enabled         =   0   'False
      Height          =   495
      Left            =   6750
      TabIndex        =   1
      ToolTipText     =   "New A/c"
      Top             =   8325
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name :"
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
      Left            =   4080
      TabIndex        =   15
      Top             =   720
      Width           =   2055
   End
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer # :"
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
      Left            =   960
      TabIndex        =   13
      Top             =   720
      Width           =   1575
   End
   Begin VB.Label lblAccount 
      BackColor       =   &H00BFD87E&
      Caption         =   "      Account Information"
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
      Height          =   495
      Left            =   4080
      TabIndex        =   0
      Top             =   120
      Width           =   4335
   End
End
Attribute VB_Name = "frmAccountGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub accountGrid_Click()
'  Dim blockedAmt As String
'
'  accountGrid.Col = 3
'  blockedAmt = Format(accountGrid.Text, "!@@@@@@@@@@@@@@")
'
'  If blockedAmt <> 0 Then
'     cmdBlockBreakup.Enabled = True
'  Else
'     cmdBlockBreakup.Enabled = False
'  End If
End Sub

Private Sub accountGrid_DblClick()
   accSearchAction = True
   accUpdateAction = False
   accTellerAction = False
   accSupervisorAction = False
   accHistoryAction = False
   getAccDetails
End Sub

Private Sub accountGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdAccBlocking_Click()
Dim tAccNo As String * 14
  Dim blockedAmt As String
  Dim strmsglen As String
  
  frmAccountGrid.tag = "A"
  accountGrid.Col = 0
  tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
  If Len(RTrim(tAccNo)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
  
  If Mid$(tAccNo, 3, 3) <> "008" And _
     Mid$(tAccNo, 3, 3) <> "009" And _
     Mid$(tAccNo, 3, 3) <> "160" Then
     
     MsgBox errManualBlockNotAllowed(UserLang)
     Exit Sub
  End If
  
  LogData "Sending Request message for getting blocked amount breakup for the account # : " & tAccNo
  SendMsg = "000000" & "86" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tAccNo
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmAccountGrid.MousePointer = vbHourglass
    
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     Exit Sub
  End If
  frmAccountGrid.MousePointer = vbDefault
    
  parseBlockBreakupDetails
  If recvBlockBreakupMsg.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvBlockBreakupMsg.aRemarks
     Else
        MsgBox recvBlockBreakupMsg.eRemarks
     End If
     Exit Sub
  End If

  frmBlockedAmtBreakup.Show
  frmBlockedAmtBreakup.tag = "A" ' account level manual blocking
  frmBlockedAmtBreakup.txtAccNo = tAccNo

End Sub

Private Sub cmdActivateDormant_Click()
  Dim tUserid As String, tAccNo As String, strmsglen As String
  Dim updateFlag As String
    
  dormantFlag = "0"
  tUserid = Format(gUserId, "!@@@@@@@@@@")
  accountGrid.Col = 0
  tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
  
  If Len(RTrim(tAccNo)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
   
  accountGrid.Col = 6
  dormantFlag = accountGrid.text
  If dormantFlag = "1" Then
     If dormantActivationAllowed = False Then
        MsgBox errDormantAcc(UserLang)
        Exit Sub
     End If
  Else
     MsgBox errNotDormantAcc(UserLang)
     Exit Sub
  End If
  
  updateFlag = "0"
  
  SendMsg = "000000" & "33" & gBranchCode & "03" & tUserid & _
            tAccNo & updateFlag

  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  
  cmdEnquiry.Enabled = False
  cmdNewAcct.Enabled = False
  cmdUpdateAc.Enabled = False
  cmdMore.Enabled = False
  cmdStatement.Enabled = False
  cmdTransaction.Enabled = False
  cmdStdOrd.Enabled = False
  cmdStopCheque.Enabled = False
  cmdChequeBook.Enabled = False
  cmdChqBkRecdByBranch.Enabled = False
  cmdChqBkIssuedToCust.Enabled = False
  cmdHistStmt.Enabled = False
  cmdExit.Enabled = False
  frmAccountGrid.MousePointer = vbHourglass
      
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     cmdEnquiry.Enabled = True
     If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
        cmdNewAcct.Enabled = True
        cmdUpdateAc.Enabled = True
        cmdChqBkRecdByBranch.Enabled = True
        cmdChqBkIssuedToCust.Enabled = True
     End If
     cmdChequeBook.Enabled = True
     cmdHistStmt.Enabled = True
     cmdMore.Enabled = True
     cmdStatement.Enabled = True
     cmdTransaction.Enabled = True
     cmdStdOrd.Enabled = True
     cmdStopCheque.Enabled = True
     cmdExit.Enabled = True
     Exit Sub
  End If
  
  frmAccountGrid.MousePointer = vbDefault
  cmdEnquiry.Enabled = True
  If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
     cmdNewAcct.Enabled = True
     cmdUpdateAc.Enabled = True
     cmdChqBkRecdByBranch.Enabled = True
     cmdChqBkIssuedToCust.Enabled = True
  End If
  cmdChequeBook.Enabled = True
  cmdMore.Enabled = True
  cmdHistStmt.Enabled = True
  cmdStatement.Enabled = True
  cmdTransaction.Enabled = True
  cmdStdOrd.Enabled = True
  cmdStopCheque.Enabled = True
  cmdExit.Enabled = True
  
  If recvCustomerMsg.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvCustomerMsg.aRemarks
     Else
        MsgBox recvCustomerMsg.eRemarks
     End If
     Exit Sub
  Else
     MsgBox errSuccessful(UserLang)
  End If

End Sub

Private Sub cmdBlockBreakup_Click()
  Dim tAccNo As String * 14
  Dim blockedAmt As String
  Dim strmsglen As String
  
  frmAccountGrid.tag = "C"
  accountGrid.Col = 0
  tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
  If Len(RTrim(tAccNo)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
  
  LogData "Sending Request message for getting blocked amount breakup for the account # : " & tAccNo
  SendMsg = "000000" & "86" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tAccNo
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmAccountGrid.MousePointer = vbHourglass
    
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     Exit Sub
  End If
  frmAccountGrid.MousePointer = vbDefault
    
  parseBlockBreakupDetails
  If recvBlockBreakupMsg.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvBlockBreakupMsg.aRemarks
     Else
        MsgBox recvBlockBreakupMsg.eRemarks
     End If
     Exit Sub
  End If

  frmBlockedAmtBreakup.Show
  frmBlockedAmtBreakup.tag = "C" ' credit card manual blocking
  frmBlockedAmtBreakup.txtAccNo = tAccNo

End Sub

Private Sub cmdChequeBook_Click()
    Dim tAccNo As String * 14
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    accountGrid.Col = 6
    dormantFlag = accountGrid.text
    
    searchChequeBook ("00000")
    If UserLang = ARABIC Then
       ChangePositions frmChequeBookGrid, 12000
       frmChequeBookGrid.RightToLeft = True
       frmChequeBookGrid.txtCustNo.RightToLeft = True
       frmChequeBookGrid.txtCustName.RightToLeft = True
       frmChequeBookGrid.txtCustName.Alignment = 1
       frmChequeBookGrid.txtCustNo.Alignment = 1
    End If
    frmChequeBookGrid.Show
End Sub

Private Sub cmdChqBkIssuedToCust_Click()
  readChqBkStatusList "00000", "3"
'  If UserLang = ARABIC Then
'     ChangePositions frmChqReceipt, 11800
'     frmChqReceipt.RightToLeft = True
'     frmChqReceipt.Hide
'  End If
'  frmChqReceipt.Show
'  frmChqReceipt.Caption = frmChqReceiptCaption(1, UserLang)
'  frmChqReceipt.lblChequeReceipt = frmChqReceiptCaption(1, UserLang)
'  frmChqReceipt.lblOK = frmChqReceiptCaption(12, UserLang)
'  frmChqReceipt.tag = "3"
End Sub

Private Sub cmdChqBkRecdByBranch_Click()
   readChqBkStatusList "00000", "2"
'   If UserLang = ARABIC Then
'      ChangePositions frmChqReceipt, 11800
'      frmChqReceipt.RightToLeft = True
'      frmChqReceipt.Hide
'   End If
'   frmChqReceipt.Show
'   frmChqReceipt.Caption = frmChqReceiptCaption(0, UserLang)
'   frmChqReceipt.lblChequeReceipt = frmChqReceiptCaption(0, UserLang)
'   frmChqReceipt.lblOK = frmChqReceiptCaption(13, UserLang)
'   frmChqReceipt.tag = "2"
End Sub

Private Sub cmdDestroyCheque_Click()
    Dim tAccNo As String * 14
    
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    accountGrid.Col = 6
    dormantFlag = accountGrid.text
    frmAccountGrid.tag = "1"
    stopChqSearchAction = True
    stopChqSupervisorAction = False
    stopChqTellerAction = False
    searchStopChq "00000", "1"
    If UserLang = ARABIC Then
       ChangePositions frmStopChequeGrid, 11800
       frmStopChequeGrid.RightToLeft = True
       frmStopChequeGrid.lblCustNo.RightToLeft = True
       frmStopChequeGrid.lblCustName.RightToLeft = True
       frmStopChequeGrid.lblStopChqInfo.RightToLeft = True
       frmStopChequeGrid.lblStopChqInfo.Alignment = 1
       frmStopChequeGrid.txtAcctNo.RightToLeft = True
       frmStopChequeGrid.txtAcctNo.Alignment = 1
       frmStopChequeGrid.txtCustNo.RightToLeft = True
       frmStopChequeGrid.txtCustName.RightToLeft = True
       frmStopChequeGrid.txtCustName.Alignment = 1
       frmStopChequeGrid.txtCustNo.Alignment = 1
    End If
    frmStopChequeGrid.txtAcctNo = tAccNo
    frmStopChequeGrid.Show
End Sub

Private Sub cmdDiary_Click()
  Dim tAccNo As String * 14
  Dim blockedAmt As String
  Dim strmsglen As String
  
  frmAccountGrid.tag = accountGrid.Row
  accountGrid.Col = 0
  tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
  If Len(RTrim(tAccNo)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
  
  LogData "Sending Request message for getting diary record information for the account # : " & tAccNo
  SendMsg = "000000" & "93" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tAccNo
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmAccountGrid.MousePointer = vbHourglass
    
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     Exit Sub
  End If
  frmAccountGrid.MousePointer = vbDefault
    
  'parseDiaryDetail
'  If recvDiaryDetailMsg.status <> "000" Then
'     If UserLang = ARABIC Then
'        MsgBox recvDiaryDetailMsg.aRemarks
'     Else
'        MsgBox recvDiaryDetailMsg.eRemarks
'     End If
'     Exit Sub
'  End If
'
'  frmDiaryEnq.Show
'  frmDiaryEnq.txtAccNo = tAccNo

End Sub

Private Sub cmdEnquiry_Click()
  accSearchAction = True
  accUpdateAction = False
  accSupervisorAction = False
  accTellerAction = False
  accHistoryAction = False
  getAccDetails
End Sub

Private Sub cmdExit_Click()
   Unload Me
End Sub

Private Sub cmdHistory_Click()
    Dim dormantFlag As String
    Dim tCode As String, tAccNo As String, tNoOfTrans As String
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    If getAcctHistory("00000", tAccNo) = -1 Then
       Exit Sub
    End If
    
    If UserLang = ARABIC Then
       ChangePositions frmAcctUpdateHistory, 11800
       frmAcctUpdateHistory.RightToLeft = True
    End If
    
    frmAcctUpdateHistory.Show
    frmAcctUpdateHistory.txtAccNo = tAccNo
     
End Sub

Public Function getAcctHistory(lastRecCount As String, accNo As String) As Integer
    Dim strmsglen As String * 6
    Dim userId As String * 10
    
    userId = Format(gUserId, "!@@@@@@@@@@")

    SendMsg = "000000" & "57" & gBranchCode & accNo & "2" & lastRecCount & Space(10) ' 0 is to denote account status history ;
                                                                                     ' 1 to denote sama account status history
                                                                                     ' 2 to denote account update history

    'SendMsg = "000090" & "87" & gBranchCode & userId & lastRecCount & accNo & Space(10)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmAccountGrid.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmAccountGrid.MousePointer = vbNormal
       getAcctHistory = -1
       Exit Function
    End If
    parseAcctHistoryDetails
    frmAccountGrid.MousePointer = vbNormal
    getAcctHistory = 0
End Function

Public Sub parseAcctHistoryDetails()
     Dim i As Integer, pos As Integer
     pos = 1
     
     recvAcctHistoryMsg.status = Mid$(RecvStr, pos, 3)
     pos = pos + 3
     recvAcctHistoryMsg.service = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvAcctHistoryMsg.aRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     recvAcctHistoryMsg.eRemarks = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     recvAcctHistoryMsg.lastRecCount = Mid$(RecvStr, pos, 5)
     pos = pos + 5
     recvAcctHistoryMsg.noOfRecs = Mid$(RecvStr, pos, 2)
     pos = pos + 2
     recvAcctHistoryMsg.accNo = Mid$(RecvStr, pos, 14)
     pos = pos + 14
     recvAcctHistoryMsg.filler = Mid$(RecvStr, pos, 50)
     pos = pos + 50
     For i = 1 To Val(recvAcctHistoryMsg.noOfRecs)
         recvAcctHistoryMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
         pos = pos + 4
         recvAcctHistoryMsg.details(i).userId = Mid$(RecvStr, pos, 20)
         pos = pos + 20
         recvAcctHistoryMsg.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvAcctHistoryMsg.details(i).pendingStatus = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvAcctHistoryMsg.details(i).supervisorId = Mid$(RecvStr, pos, 20)
         pos = pos + 20
         recvAcctHistoryMsg.details(i).approvedDateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         pos = pos + 10
    Next i
End Sub

Private Sub cmdHistStmt_Click()
    Dim tAccNo As String
    Dim mQry As String
    Dim tCode As String
    Dim passwdFlag As String
    Dim glBranchCode As String
    Dim dormantFlag As String
    Dim enqRestrictedFlag As String
    
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
    
    accountGrid.Col = 8
    glBranchCode = Format(accountGrid.text, "!@@@@")
    
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    
    accountGrid.Col = 6
    dormantFlag = accountGrid.text
    
    'If dormantFlag = "1" And dormantActivationAllowed = False Then ' Mohit did on 27-Dec-2006
    If (dormantFlag = "1" And dormantActivationAllowed = False) And (InStr(recvLoginMsg.authorityLevel, "~87") = 0) Then
       MsgBox errDormantAcc(UserLang)
       Exit Sub
    End If
    
    accountGrid.Col = 9
    enqRestrictedFlag = accountGrid.text
   
    If enqRestrictedFlag = "1" Then
       MsgBox errPBAccRestricted(UserLang)
       Exit Sub
    End If
    
    accountGrid.Col = 4
    passwdFlag = Mid$(accountGrid.text, 2, 1)
   
    If passwdFlag = "8" And glBranchCode <> gBranchCode Then
       MsgBox errEnqRestrictedAcc(UserLang)
       Exit Sub
    End If

    frmHistStmt.Show
    frmHistStmt.tag = "N" 'Normal historical statement route
    frmHistStmt.txtBranchCode = Trim(glBranchCode)
    frmHistStmt.txtAccNo = tAccNo
    
   tCode = Mid$(frmHistStmt.txtAccNo, 1, 2)
   mQry = "select arabicname, englishname from currencyinfo where currencycode = '" & _
                                                tCode & "'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      If UserLang = ARABIC Then
         frmHistStmt.txtCurrDesc = tCode & "-" & rs(0)
      Else
         frmHistStmt.txtCurrDesc = tCode & "-" & rs(1)
      End If
   End If

   tCode = Mid$(frmHistStmt.txtAccNo, 3, 3)
   mQry = "select arabicname, englishname from bmledgerinfo where ledgercode = '" & _
                                                tCode & "'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      If UserLang = ARABIC Then
         frmHistStmt.txtAcctDesc = tCode & "-" & rs(0)
      Else
         frmHistStmt.txtAcctDesc = tCode & "-" & rs(1)
      End If
   End If
 
    frmHistStmt.txtFromYear.SetFocus
    
End Sub

Private Sub cmdMore_Click()
  If recvAccSearchMsg.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   doAccSearch (recvAccSearchMsg.lastRecCount)
    
   If recvAccSearchMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   
   Form_Load
End Sub

Private Sub cmdNewAcct_Click()
   Dim tCode As String
   Dim strmsglen As String
   Dim tmpStr As String
   Dim tName As String
   Dim response

   accTellerAction = False
   accSupervisorAction = False
   accUpdateAction = False
   accSearchAction = False
   accHistoryAction = False

   If recvAccSearchMsg.custBranchCode <> gBranchCode And recvLoginMsg.globalUpdatePriv = "0" Then
      MsgBox errDifferentBranchCode(UserLang)  '"Branch code is different...Cannot open account "
      Exit Sub
   End If
   
   ' The following two if statements added after giving the source to MISYS
   If recvLoginMsg.globalUpdatePriv = "2" Then
      If recvAccSearchMsg.custBranchCode <> gBranchCode Then
         If recvAccSearchMsg.restrictedFlag = "1" Then
            MsgBox errAccOpeningRestricted(UserLang), vbCritical '"Account opening is prohibited since the branch is a restricted branch"
            Exit Sub
         End If
      End If
   End If
   
   If recvAccSearchMsg.foundInAList = "1" Then
      MsgBox errAListAcc(UserLang), vbCritical '"Customer is Blacklisted in A-List; Account opening cannot proceed .."
      Exit Sub
   End If
   
   If recvAccSearchMsg.customerLang = "0" Then 'arabic
      If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
         tName = Format(recvAccSearchMsg.aShortName, "!" & String(60, "@"))
      Else
         tName = Format(recvAccSearchMsg.eShortName, "!" & String(60, "@"))
      End If
   Else
      If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
         tName = Format(recvAccSearchMsg.eShortName, "!" & String(60, "@"))
      Else
         tName = Format(recvAccSearchMsg.aShortName, "!" & String(60, "@"))
      End If
   End If
   
   SendMsg = "000090" & "80" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tName & recvAccSearchMsg.custNo & Space(1)
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmAccountGrid.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      frmAccountGrid.MousePointer = vbNormal
      LoadError = True
      Exit Sub
   End If
   frmAccountGrid.MousePointer = vbNormal
   parseSearchEngineResponse
   If recvSearchEngineMsg.foundInTlist = "1" Then
      response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
      If response = vbYes Then
         fillSearchEngineForm Val(recvSearchEngineMsg.noOfRecs)
         frmSearchEngine.Show vbModal
      End If
   End If
   gDateTime = Space(14)
   
   frmAccount.Show
   frmAccount.cmbBranchCode = recvAccSearchMsg.custBranchCode
   frmAccount.txtCustNo = recvAccSearchMsg.custNo
   tCode = recvAccSearchMsg.custBranchCode
      
   Set rs = db.OpenRecordset("select arabicname,englishname from branchInfo  " & _
                             "where branchcode = '" & tCode & "'")

   If rs.recordCount > 0 Then
      If UserLang = ARABIC Then
         frmAccount.cmbBranchCode.text = tCode & "-" & rs(0)
      Else
         frmAccount.cmbBranchCode.text = tCode & "-" & rs(1)
      End If
   Else
      frmAccount.cmbBranchCode.text = tCode & "Invalid Branch Code "
   End If
   If UserLang = ARABIC Then
      frmAccount.txtCustomerName = recvAccSearchMsg.aShortName
   Else
      frmAccount.txtCustomerName = recvAccSearchMsg.eShortName
   End If
'   frmAccount.cmbBranchCode.Enabled = False
   frmAccount.cmdApprove.Enabled = False
   frmAccount.cmdReject.Enabled = False
End Sub

Private Sub cmdNewTimeDeposit_Click()
    Dim tCode As String, tAccNo As String
    Dim passwdFlag As String
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
'    If Len(RTrim(tAccNo)) = 0 Then
'       MsgBox errEmptyRowSelected(UserLang)
'       Exit Sub
'    End If
   tdTellerAction = False
   tdSearchAction = False
   tdUpdateAction = False
   tdSupervisorAction = False
   frmTimeDepositOpen.txtCustNo = txtCustNo
   frmTimeDepositOpen.txtCustName = txtCustName
   frmTimeDepositOpen.txtCustomerNo = txtCustNo
   frmTimeDepositOpen.txtPayCustNo = txtCustNo
   frmTimeDepositOpen.Show
End Sub

Private Sub cmdRenewTd_Click()
    Dim tUserid As String * 10
    Dim tAccNo As String * 14
    Dim strmsglen As String
    Dim mQry As String
    Dim tCode As String
    Dim tmpStr As String
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
  
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    
    mQry = "select * from bmledgerinfo " & _
             "where ledgercode = '" & Mid$(tAccNo, 3, 3) & _
             "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       tCode = IIf(rs("timeDepositMemo") = "" Or IsNull(rs("timeDepositMemo")) = True, " ", rs("timeDepositMemo"))
       If tCode <> "1" Then
          If UserLang = ARABIC Then
             tmpStr = "—ﬁ„  «·Õ”«» «·„Œ «— —ﬁ„ ÊœÌ⁄… Œ«ÿÏ¡...Õ«Ê· ·«Õﬁ« " & tAccNo
          Else
             tmpStr = "Selected account  " & tAccNo & "  is not a valid Time Deposit account... Please try again..."
          End If
          MsgBox tmpStr
          Exit Sub
       End If
       
       ''Added by Mohit on 22-Feb-2007 as change reported by Arul
       tCode = IIf(rs("tdRenewAllowed") = "" Or IsNull(rs("tdRenewAllowed")) = True, " ", rs("tdRenewAllowed"))
       If tCode <> "1" Then
          If UserLang = ARABIC Then
             tmpStr = " —ﬁ„ Õ”«» «·ÊœÌ⁄… «·„Œ «— €Ì— ﬁ«»· ·· ⁄œÌ·" & tAccNo
          Else
             tmpStr = "Selected Time Deposit account  " & tAccNo & "  is not allowed for update."
          End If
          MsgBox tmpStr
          Exit Sub
       End If
        ''till here
    End If

    SendMsg = "000000" & "AJ" & gBranchCode & "02" & tUserid & tAccNo & Space(7) & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
     
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
    parseTimeDepositDetail
    
    If recvTimeDepositDetailMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTimeDepositDetailMsg.aRemarks
       Else
          MsgBox recvTimeDepositDetailMsg.eRemarks
       End If
       Exit Sub
    End If
    tdSupervisorAction = False
    tdTellerAction = False
    tdSearchAction = False
    tdUpdateAction = True
    fillFrmTimeDepositOpen
    frmTimeDepositOpen.Show
End Sub

Private Sub cmdStatement_Click()
   Dim tAccNo As String
   Dim tCode, mQry As String
   Dim dormantFlag As String
   Dim passwdFlag As String
   Dim glBranchCode As String
   Dim enqRestrictedFlag As String
   Dim strmsglen As String
   
   accountGrid.Col = 0
   tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
   If Len(RTrim(tAccNo)) = 0 Then
      MsgBox errEmptyRowSelected(UserLang)
      Exit Sub
   End If
   
   accountGrid.Col = 6
   dormantFlag = accountGrid.text
   If dormantFlag = "1" And dormantActivationAllowed = False Then
      MsgBox errDormantAcc(UserLang)
      Exit Sub
   End If
   
   accountGrid.Col = 9
   enqRestrictedFlag = accountGrid.text
   
   If enqRestrictedFlag = "1" Then
      MsgBox errPBAccRestricted(UserLang)
      Exit Sub
   End If
   
   accountGrid.Col = 4
   passwdFlag = Mid$(accountGrid.text, 2, 1)
   accountGrid.Col = 8
   glBranchCode = Format(accountGrid.text, "!@@@@")
   
   If passwdFlag = "8" And glBranchCode <> gBranchCode Then
      MsgBox errEnqRestrictedAcc(UserLang)
      Exit Sub
   End If
   
   SendMsg = "000000" & "BB" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tAccNo & Space(50)

  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     Exit Sub
  End If
  
  frmAccountGrid.MousePointer = vbDefault
  
  parseFetchIBANMsg
  
  If recvFetchAccDetail.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvFetchAccDetail.aRemarks
     Else
        MsgBox recvFetchAccDetail.eRemarks
     End If
     Exit Sub
  End If
      
   frmAccountGrid.MousePointer = vbHourglass
   frmInputform.Show  ' this will call form_load of frmInputForm which will connect online gateway
   frmAccountGrid.MousePointer = vbNormal
   frmInputform.txtAccNo = tAccNo
   frmInputform.txtIban = recvFetchAccDetail.iban
   If UserLang = ENGLISH Then
      If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
         frmInputform.txtAccName = recvAccSearchMsg.aShortName
      Else
         frmInputform.txtAccName = recvAccSearchMsg.eShortName
      End If
  Else
     If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
         frmInputform.txtAccName = recvAccSearchMsg.eShortName
      Else
         frmInputform.txtAccName = recvAccSearchMsg.aShortName
      End If
  End If
  
   tCode = Mid$(frmInputform.txtAccNo, 3, 3)
   mQry = "select arabicname,englishname from bmledgerinfo " & _
          "where ledgercode = '" & tCode & "'"

   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      If UserLang = ARABIC Then
         frmInputform.txtAccountType = tCode & "-" & rs(0)
      Else
         frmInputform.txtAccountType = tCode & "-" & rs(1)
      End If
   End If
   
   tCode = Mid$(frmInputform.txtAccNo, 1, 2)
   mQry = "select arabicname,englishname from currencyinfo" & _
          " where currencycode = '" & tCode & "'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      If UserLang = ARABIC Then
         frmInputform.txtCurrency = tCode & "-" & rs(0)
      Else
         frmInputform.txtCurrency = tCode & "-" & rs(1)
      End If
   End If
End Sub

Private Sub cmdStdOrd_Click()
   Dim tAccNo As String * 14
   
   accountGrid.Col = 0
   tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
   If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
   End If
   
   accountGrid.Col = 6
   dormantFlag = accountGrid.text

   searchStdOrd ("00000")
   If UserLang = ARABIC Then
      ChangePositions frmStdOrdGrid, 12000
      frmStdOrdGrid.RightToLeft = True
      frmStdOrdGrid.lblCustNo.RightToLeft = True
      frmStdOrdGrid.lblCustName.RightToLeft = True
      frmStdOrdGrid.lblStdOrd.RightToLeft = True
      frmStdOrdGrid.lblStdOrd.Alignment = 1
      frmStdOrdGrid.txtAcctNo.RightToLeft = True
      frmStdOrdGrid.txtAcctNo.Alignment = 1
      frmStdOrdGrid.txtCustNo.RightToLeft = True
      frmStdOrdGrid.txtCustName.RightToLeft = True
      frmStdOrdGrid.txtCustName.Alignment = 1
      frmStdOrdGrid.txtCustNo.Alignment = 1
   End If
   
  frmStdOrdGrid.Show
  frmStdOrdGrid.txtAcctNo = tAccNo
End Sub

Private Sub cmdStopCheque_Click()
    Dim tAccNo As String * 14
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    accountGrid.Col = 6
    dormantFlag = accountGrid.text
    stopChqSearchAction = True
    stopChqSupervisorAction = False
    stopChqTellerAction = False
    searchStopChq "00000", "0"
    If UserLang = ARABIC Then
       ChangePositions frmStopChequeGrid, 11800
       frmStopChequeGrid.RightToLeft = True
       frmStopChequeGrid.lblCustNo.RightToLeft = True
       frmStopChequeGrid.lblCustName.RightToLeft = True
       frmStopChequeGrid.lblStopChqInfo.RightToLeft = True
       frmStopChequeGrid.lblStopChqInfo.Alignment = 1
       frmStopChequeGrid.txtAcctNo.RightToLeft = True
       frmStopChequeGrid.txtAcctNo.Alignment = 1
       frmStopChequeGrid.txtCustNo.RightToLeft = True
       frmStopChequeGrid.txtCustName.RightToLeft = True
       frmStopChequeGrid.txtCustName.Alignment = 1
       frmStopChequeGrid.txtCustNo.Alignment = 1
    End If
    frmStopChequeGrid.txtAcctNo = tAccNo
    frmStopChequeGrid.Show
End Sub

Private Sub cmdTransaction_Click()
    Dim dormantFlag As String, enqRestrictedFlag As String
    Dim tCode As String, tAccNo As String, tNoOfTrans As String
    Dim passwdFlag As String
    Dim glBranchCode As String
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
   
    accountGrid.Col = 6
    dormantFlag = accountGrid.text
    If dormantFlag = "1" And dormantActivationAllowed = False Then
       MsgBox errDormantAcc(UserLang)
       Exit Sub
    End If
    accountGrid.Col = 9
    enqRestrictedFlag = accountGrid.text
   
    If enqRestrictedFlag = "1" Then
       MsgBox errPBAccRestricted(UserLang)
       Exit Sub
    End If
    accountGrid.Col = 4
    passwdFlag = Mid$(accountGrid.text, 2, 1)
    accountGrid.Col = 8
    glBranchCode = Format(accountGrid.text, "!@@@@")
   
    If passwdFlag = "8" And glBranchCode <> gBranchCode Then
       MsgBox errEnqRestrictedAcc(UserLang)
       Exit Sub
    End If
    
    accountGrid.Col = 7
    tNoOfTrans = accountGrid.text
    If UserLang = ARABIC Then
       ChangePositions frmTransaction, 11800
       frmTransaction.RightToLeft = True
    End If
    frmTransaction.Show
    frmTransaction.txtAcctNo = tAccNo
    If UserLang = ARABIC Then
       If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
          frmTransaction.txtName = recvAccSearchMsg.aShortName
       Else
          frmTransaction.txtName = recvAccSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
          frmTransaction.txtName = recvAccSearchMsg.eShortName
       Else
          frmTransaction.txtName = recvAccSearchMsg.aShortName
       End If
    End If
'    tCode = Mid$(tAccNo, 3, 3)
'    mQry = "select arabicname,englishname from bmledgerinfo " + _
'          "where ledgercode = '" + tCode + "'"
'
'    Set db = OpenDatabase(dbPath)
'    Set rs = db.OpenRecordset(mQry)
'    If rs.RecordCount > 0 Then
'       If UserLang = ARABIC Then
'          frmTransaction.txtName = tCode + "-" + rs(0)
'       Else
'          frmTransaction.txtName = tCode + "-" + rs(1)
'       End If
'    End If
    frmTransaction.txtNoOfTrans = tNoOfTrans
    
End Sub

Private Sub cmdTransEnq_Click()
    Dim tAccNo As String * 14
    Dim i As Integer, num As String
    Dim mQry As String, custBranchCode As String, dormantFlag As String, enqRestrictedFlag As String
    Dim passwdFlag As String
    Dim glBranchCode As String
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    
    accountGrid.Col = 6
    dormantFlag = accountGrid.text
    If dormantFlag = "1" And dormantActivationAllowed = False Then
       MsgBox errDormantAcc(UserLang)
       Exit Sub
    End If
    accountGrid.Col = 8
    custBranchCode = accountGrid.text
    If custBranchCode = "0175" And gBranchCode <> "0175" Then
       MsgBox errNotAuthorizedToViewStaffAcc(UserLang)  '"You are not authorised to view STAFF ACCOUNT'S Statement "
       Exit Sub
    End If
    accountGrid.Col = 9
    enqRestrictedFlag = accountGrid.text
    If enqRestrictedFlag = "1" Then
       MsgBox errPBAccRestricted(UserLang)  ' You are not auhorised to view PRIVATE banking accounts
       Exit Sub
    End If
    
    accountGrid.Col = 4
    passwdFlag = Mid$(accountGrid.text, 2, 1)
    accountGrid.Col = 8
    glBranchCode = Format(accountGrid.text, "!@@@@")
   
    If passwdFlag = "8" And glBranchCode <> gBranchCode Then
       MsgBox errEnqRestrictedAcc(UserLang)
       Exit Sub
    End If

    If UserLang = ARABIC Then
       ChangePositions frmTransEnq, 11800
       frmTransEnq.RightToLeft = True
    End If
 
    frmTransEnq.Show
    frmTransEnq.txtAcctNo = tAccNo
     For i = 1 To 31
        If i < 10 Then
           num = "0" + CStr(i)
        Else
           num = CStr(i)
        End If
        frmTransEnq.cmbStartDate.AddItem num
        frmTransEnq.cmbEndDate.AddItem num
        If i < 13 Then
           frmTransEnq.cmbStartMonth.AddItem num
           frmTransEnq.cmbEndMonth.AddItem num
        End If
    Next
    
    frmTransEnq.txtStartYear = CStr(Year(Date))
    frmTransEnq.cmbStartMonth = Format(CStr(Month(Date)), "00")
    frmTransEnq.cmbStartDate = Format(CStr(Day(Date)), "00")
    
    frmTransEnq.txtEndYear = CStr(Year(Date))
    frmTransEnq.cmbEndMonth = Format(CStr(Month(Date)), "00")
    frmTransEnq.cmbEndDate = Format(CStr(Day(Date)), "00")
    
    mQry = "select transtypecode,arabicname,englishname from transtypeInfo "
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       frmTransEnq.cmbTransType.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
             frmTransEnq.cmbTransType.AddItem rs(0) & "-" & rs(2)
           Else
             frmTransEnq.cmbTransType.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If
    
    If i > frmTransEnq.cmbTransType.ListCount Then
       frmTransEnq.cmbTransType.ListIndex = -1
    End If

    
End Sub

Private Sub cmdTransferEnq_Click()
    Dim tAccNo As String * 14
    Dim i As Integer, num As String
    Dim mQry As String
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
    If Len(RTrim(tAccNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    If UserLang = ARABIC Then
       ChangePositions frmSarieTransferEnq, 11800
       frmSarieTransferEnq.RightToLeft = True
    End If
    frmSarieTransferEnq.Show
    frmSarieTransferEnq.txtAcctNo = tAccNo
    For i = 1 To 31
        If i < 10 Then
           num = "0" + CStr(i)
        Else
           num = CStr(i)
        End If
        frmSarieTransferEnq.cmbStartDate.AddItem num
        frmSarieTransferEnq.cmbEndDate.AddItem num
        If i < 13 Then
           frmSarieTransferEnq.cmbStartMonth.AddItem num
           frmSarieTransferEnq.cmbEndMonth.AddItem num
        End If
    Next
    
    frmSarieTransferEnq.txtStartYear = CStr(Year(Date))
    frmSarieTransferEnq.cmbStartMonth = Format(CStr(Month(Date)), "00")
    frmSarieTransferEnq.cmbStartDate = Format(CStr(Day(Date)), "00")
    
    frmSarieTransferEnq.txtEndYear = CStr(Year(Date))
    frmSarieTransferEnq.cmbEndMonth = Format(CStr(Month(Date)), "00")
    frmSarieTransferEnq.cmbEndDate = Format(CStr(Day(Date)), "00")
    
    mQry = "select transferStatuscode,arabicname,englishname from transferStatusInfo "
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       frmSarieTransferEnq.cmbTransferStatus.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
             frmSarieTransferEnq.cmbTransferStatus.AddItem rs(0) & "-" & rs(2)
           Else
             frmSarieTransferEnq.cmbTransferStatus.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If
    
    For i = 0 To frmSarieTransferEnq.cmbTransferStatus.ListCount
        If Mid$(frmSarieTransferEnq.cmbTransferStatus.List(i), 1, 1) = "A" Then
           frmSarieTransferEnq.cmbTransferStatus.ListIndex = i
           Exit For
        End If
    Next i
    If i > frmSarieTransferEnq.cmbTransferStatus.ListCount Then
       frmSarieTransferEnq.cmbTransferStatus.ListIndex = -1
    End If

End Sub

Private Sub cmdUpdateAc_Click()
   Dim strmsglen As String
   Dim tName As String
   Dim response
  
   If recvAccSearchMsg.customerLang = "0" Then 'arabic
      If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
         tName = Format(recvAccSearchMsg.aShortName, "!" & String(60, "@"))
      Else
         tName = Format(recvAccSearchMsg.eShortName, "!" & String(60, "@"))
      End If
   Else
      If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
         tName = Format(recvAccSearchMsg.eShortName, "!" & String(60, "@"))
      Else
         tName = Format(recvAccSearchMsg.aShortName, "!" & String(60, "@"))
      End If
   End If
   
   SendMsg = "000090" & "80" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tName & recvAccSearchMsg.custNo & Space(1)
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmAccountGrid.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      frmAccountGrid.MousePointer = vbNormal
      LoadError = True
      Exit Sub
   End If
   frmAccountGrid.MousePointer = vbNormal
   parseSearchEngineResponse
   If recvSearchEngineMsg.foundInTlist = "1" Then
      response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
      If response = vbYes Then
         fillSearchEngineForm Val(recvSearchEngineMsg.noOfRecs)
         frmSearchEngine.Show vbModal
      End If
   End If
   
   accUpdateAction = True
   accSearchAction = False
   accTellerAction = False
   accSupervisorAction = False
   accHistoryAction = False
   gDateTime = Space(14)
   getAccDetails
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As Integer, tWidth As Integer, amtDenom As Integer, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim mQry As String, accStatus As String
    Dim tCcy As String, tDecimalPlace As String
    Dim tmpStr As String
    Dim tCode As String
    Dim tmpBlockBal As String
    Static lastRecRead As String * 3
    Dim dormantAccFound As Boolean, privateBankingAccFound As Boolean
    Dim passwd8AccFound As Boolean, accAlreadyZeroedForStaff As Boolean
    Dim i As Integer
    
'    If UserLang = ARABIC Then
'       ChangePositions frmAccountGrid, 11800
'       frmAccountGrid.RightToLeft = True
'    End If
    
    colwidth(0) = 1800
    colwidth(1) = 1500
    colwidth(2) = 1700
    colwidth(3) = 1700
    colwidth(4) = 1700
    colwidth(5) = 1200
    colwidth(6) = 1200
    colwidth(7) = 1200
    
    frmAccountGrid.Caption = frmAccountGridCaption(0, UserLang)
    frmAccountGrid.lblAccount.Caption = frmAccountGridCaption(1, UserLang)
    frmAccountGrid.cmdNewAcct.Caption = frmAccountGridCaption(10, UserLang)
    frmAccountGrid.cmdUpdateAc.Caption = frmAccountGridCaption(11, UserLang)
    frmAccountGrid.cmdEnquiry.Caption = frmAccountGridCaption(12, UserLang)
    frmAccountGrid.cmdMore.Caption = frmAccountGridCaption(13, UserLang)
    frmAccountGrid.cmdStatement.Caption = frmAccountGridCaption(14, UserLang)
    frmAccountGrid.cmdTransaction.Caption = frmAccountGridCaption(15, UserLang)
    frmAccountGrid.cmdChequeBook.Caption = frmAccountGridCaption(16, UserLang)
    frmAccountGrid.cmdExit.Caption = frmAccountGridCaption(17, UserLang)
    frmAccountGrid.cmdChqBkRecdByBranch.Caption = frmAccountGridCaption(18, UserLang)
    frmAccountGrid.cmdChqBkIssuedToCust.Caption = frmAccountGridCaption(19, UserLang)
    frmAccountGrid.cmdStdOrd.Caption = frmAccountGridCaption(20, UserLang)
    frmAccountGrid.cmdStopCheque.Caption = frmAccountGridCaption(21, UserLang)
    frmAccountGrid.lblCustNo.Caption = frmAccountGridCaption(22, UserLang)
    frmAccountGrid.lblCustName.Caption = frmAccountGridCaption(23, UserLang)
    frmAccountGrid.cmdHistStmt.Caption = frmAccountGridCaption(24, UserLang)
    frmAccountGrid.cmdActivateDormant.Caption = frmAccountGridCaption(25, UserLang)
    frmAccountGrid.cmdTransferEnq.Caption = frmAccountGridCaption(26, UserLang)
    frmAccountGrid.cmdTransEnq.Caption = frmAccountGridCaption(27, UserLang)
    frmAccountGrid.cmdDestroyCheque.Caption = frmAccountGridCaption(28, UserLang)
    frmAccountGrid.cmdBlockBreakup.Caption = frmAccountGridCaption(30, UserLang)
    frmAccountGrid.cmdHistory.Caption = frmAccountGridCaption(31, UserLang)
    frmAccountGrid.cmdNewTimeDeposit.Caption = frmAccountGridCaption(33, UserLang)
    frmAccountGrid.cmdRenewTd.Caption = frmAccountGridCaption(34, UserLang)
       
'    rowTitle(0) = "Account Number"
'    rowTitle(1) = "Book Balance"
'    rowTitle(2) = "Cleared Balance"
'    rowTitle(3) = "Blocked Balance"
'    rowTitle(4) = "Account Status"
'    rowTitle(5) = "# Transaction"
        
    frmAccountGrid.txtCustNo = recvAccSearchMsg.custNo
    
    If UserLang = ARABIC Then
       If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
          frmAccountGrid.txtCustName = recvAccSearchMsg.aShortName
       Else
          frmAccountGrid.txtCustName = recvAccSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
          frmAccountGrid.txtCustName = recvAccSearchMsg.eShortName
       Else
          frmAccountGrid.txtCustName = recvAccSearchMsg.aShortName
       End If
    End If
        
    accountGrid.Clear
    accountGrid.Row = 0
    accountGrid.Font.Bold = True
    
    If recvAccSearchMsg.staffFlag = "1" And gBranchCode <> "0175" Then
       MsgBox errStaffAcc(UserLang)
    End If
     
    tWidth = 0
    For i = 0 To 7
      accountGrid.Col = i
      If UserLang = ARABIC Then
         accountGrid.CellAlignment = flexAlignRightCenter
      Else
         accountGrid.CellAlignment = flexAlignLeftCenter
      End If
      accountGrid.text = frmAccountGridCaption(i + 2, UserLang)
      accountGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    accountGrid.Col = 8
    If UserLang = ARABIC Then
       accountGrid.CellAlignment = flexAlignRightCenter
    Else
      accountGrid.CellAlignment = flexAlignLeftCenter
    End If
    accountGrid.text = frmAccountGridCaption(29, UserLang) ' GL Branch Code
    accountGrid.colwidth(8) = 1000
    
    accountGrid.Col = 9
    If UserLang = ARABIC Then
       accountGrid.CellAlignment = flexAlignRightCenter
    Else
      accountGrid.CellAlignment = flexAlignLeftCenter
    End If
    accountGrid.text = frmAccountGridCaption(32, UserLang) 'Enquiry restricted flag
    accountGrid.colwidth(8) = 1000

    tWidth = tWidth + 1000
    
'    If UserLang = ENGLISH Then
'       accountGrid.Width = tWidth + 100
'    End If
    dormantAccFound = False
    privateBankingAccFound = False
    passwd8AccFound = False
    For i = 1 To Val(recvAccSearchMsg.noOfRecs)
      accAlreadyZeroedForStaff = False
      accountGrid.Row = i
      accountGrid.Col = 0
      accountGrid.CellAlignment = flexAlignLeftCenter
      accountGrid.text = recvAccSearchMsg.details(i).accNo
      accountGrid.Col = 1
      tCcy = Mid$(recvAccSearchMsg.details(i).accNo, 1, 2)
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
      tmpBlockBal = recvAccSearchMsg.details(i).blockedBal  ' this variable will be used
                                                            ' in blocked balance dispay only
      If recvAccSearchMsg.staffFlag = "1" And gBranchCode <> "0175" Then
         If Mid$(recvAccSearchMsg.details(i).accNo, 1, 5) = "01008" And _
            Mid$(recvAccSearchMsg.details(i).accNo, 13, 2) = "00" Then
            accAlreadyZeroedForStaff = True
            recvAccSearchMsg.details(i).bookBal = 0
            recvAccSearchMsg.details(i).blockedBal = 0
            recvAccSearchMsg.details(i).clearedBal = 0
            recvAccSearchMsg.details(i).creditLimit = 0
         End If
      End If
      If recvAccSearchMsg.details(i).inactiveFlag = "1" And _
         dormantActivationAllowed = False Then
         If Mid$(recvAccSearchMsg.details(i).accNo, 3, 3) = "008" Or _
            Mid$(recvAccSearchMsg.details(i).accNo, 3, 3) = "009" Or _
            Mid$(recvAccSearchMsg.details(i).accNo, 3, 3) = "160" Then
            dormantAccFound = True
            recvAccSearchMsg.details(i).bookBal = 0
            recvAccSearchMsg.details(i).blockedBal = 0
            recvAccSearchMsg.details(i).clearedBal = 0
            recvAccSearchMsg.details(i).creditLimit = 0
         End If
      End If
      
      If recvAccSearchMsg.details(i).enqRestrictedFlag = "1" Then
         privateBankingAccFound = True
         recvAccSearchMsg.details(i).bookBal = 0
         recvAccSearchMsg.details(i).blockedBal = 0
         recvAccSearchMsg.details(i).clearedBal = 0
         recvAccSearchMsg.details(i).creditLimit = 0
      End If
      
      If recvAccSearchMsg.details(i).accStatus = "08" Then 'if the passwd flag is 8
         If recvAccSearchMsg.details(i).branchCode <> gBranchCode And _
            accAlreadyZeroedForStaff = False Then
            passwd8AccFound = True
            recvAccSearchMsg.details(i).bookBal = 0
            recvAccSearchMsg.details(i).blockedBal = 0
            recvAccSearchMsg.details(i).clearedBal = 0
            recvAccSearchMsg.details(i).creditLimit = 0
         End If
      End If
      
      accountGrid.CellAlignment = flexAlignRightCenter
      If Not IsNumeric(Right(recvAccSearchMsg.details(i).bookBal, 1)) Then
         recvAccSearchMsg.details(i).bookBal = "-" & bmAmtToDbl(recvAccSearchMsg.details(i).bookBal)
      End If
     
      accountGrid.text = Format(Val(recvAccSearchMsg.details(i).bookBal) / amtDenom, "##########0" & _
                                IIf(CInt(tDecimalPlace) <> 0, "." & String(CInt(tDecimalPlace), "0"), ""))
      
      accountGrid.Col = 2
      accountGrid.CellAlignment = flexAlignRightCenter
      If Not IsNumeric(Right(recvAccSearchMsg.details(i).clearedBal, 1)) Then
         recvAccSearchMsg.details(i).clearedBal = "-" & bmAmtToDbl(recvAccSearchMsg.details(i).clearedBal)
      End If
      
      If Not IsNumeric(Right(recvAccSearchMsg.details(i).blockedBal, 1)) Then
         recvAccSearchMsg.details(i).blockedBal = "-" & bmAmtToDbl(recvAccSearchMsg.details(i).blockedBal)
      End If

      accountGrid.text = Format((Val(recvAccSearchMsg.details(i).clearedBal) - _
                         Val(recvAccSearchMsg.details(i).blockedBal)) / amtDenom, "##########0" + IIf(CInt(tDecimalPlace) <> 0, "." + String(CInt(tDecimalPlace), "0"), ""))
      accountGrid.Col = 3
      accountGrid.CellAlignment = flexAlignRightCenter
      If Not IsNumeric(Right(tmpBlockBal, 1)) Then
         tmpBlockBal = "-" & bmAmtToDbl(tmpBlockBal)
       End If
      accountGrid.text = Format(Val(tmpBlockBal) / amtDenom, "##########0" & IIf(CInt(tDecimalPlace) <> 0, "." & String(CInt(tDecimalPlace), "0"), ""))
      accountGrid.Col = 4
      tCode = recvAccSearchMsg.details(i).accStatus
      Set rs = db.OpenRecordset("select arabicname,englishname from accountstatusinfo " & _
                             "where statuscode = '" & _
                              tCode & "'")
                             
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            accStatus = tCode & "-" & rs(0)
         Else
            accStatus = tCode & "-" & rs(1)
         End If
      Else
         accStatus = tCode & "-" & "Not in local DB"
      End If
     
      accountGrid.CellAlignment = flexAlignLeftCenter
      accountGrid.text = accStatus
      accountGrid.Col = 5
      accountGrid.CellAlignment = flexAlignRightCenter
      If Not IsNumeric(Right(recvAccSearchMsg.details(i).creditLimit, 1)) Then
         recvAccSearchMsg.details(i).creditLimit = "-" & bmAmtToDbl(recvAccSearchMsg.details(i).creditLimit)
      End If
      accountGrid.text = Val(recvAccSearchMsg.details(i).creditLimit)
      accountGrid.Col = 6
      accountGrid.CellAlignment = flexAlignLeftCenter
      accountGrid.text = recvAccSearchMsg.details(i).inactiveFlag
      accountGrid.Col = 7
      accountGrid.CellAlignment = flexAlignLeftCenter
      accountGrid.text = recvAccSearchMsg.details(i).transCount
      accountGrid.Col = 8
      accountGrid.CellAlignment = flexAlignLeftCenter
      accountGrid.text = recvAccSearchMsg.details(i).branchCode
      accountGrid.Col = 9
      accountGrid.CellAlignment = flexAlignLeftCenter
      accountGrid.text = recvAccSearchMsg.details(i).enqRestrictedFlag
   Next i
   If dormantAccFound = True Then
      If dormantActivationAllowed = False Then
         MsgBox dormantAccBalanceZero(UserLang)
      End If
   End If
   
   If privateBankingAccFound = True Then
      MsgBox errPrivateBankingAcc(UserLang)
   End If
   
   'If passwd8AccFound = True And recvAccSearchMsg.staffFlag <> "1" Then
   If passwd8AccFound = True Then
      MsgBox errPasswd8AccBalanceZero(UserLang)
   End If
   
   If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
'      cmdNewAcct.Enabled = True
'      cmdUpdateAc.Enabled = True
      cmdStatement.Enabled = True
      cmdTransaction.Enabled = True
      cmdChequeBook.Enabled = True
'      cmdChqBkRecdByBranch.Enabled = True
'      cmdChqBkIssuedToCust.Enabled = True
      cmdHistStmt.Enabled = True
      cmdDestroyCheque.Enabled = True
'      If dormantActivationAllowed = True Then
'         cmdActivateDormant.Enabled = True
'      Else
'         cmdActivateDormant.Enabled = False
'      End If
'      cmdNewTimeDeposit.Enabled = True
'      cmdRenewTd.Enabled = True
   ElseIf InStr(recvLoginMsg.authorityLevel, "~62") > 0 Then
'      cmdChqBkRecdByBranch.Enabled = True
'      cmdChqBkIssuedToCust.Enabled = True
      cmdStatement.Enabled = True
      cmdTransaction.Enabled = True
      cmdStdOrd.Enabled = True
      cmdStopCheque.Enabled = True
      cmdDestroyCheque.Enabled = True
      cmdNewAcct.Enabled = False
      cmdUpdateAc.Enabled = False
      cmdChequeBook.Enabled = True
      cmdHistStmt.Enabled = True
      cmdActivateDormant.Enabled = False
      cmdNewTimeDeposit.Enabled = False
      cmdRenewTd.Enabled = False
   ElseIf InStr(recvLoginMsg.authorityLevel, "~60") > 0 Then
      cmdNewAcct.Enabled = False
      cmdUpdateAc.Enabled = False
      cmdChequeBook.Enabled = True
      cmdChqBkRecdByBranch.Enabled = False
      cmdChqBkIssuedToCust.Enabled = False
      cmdStatement.Enabled = True
      cmdTransaction.Enabled = True
      cmdHistStmt.Enabled = True
      cmdActivateDormant.Enabled = False
      cmdNewTimeDeposit.Enabled = False
      cmdRenewTd.Enabled = False
   Else
      cmdNewAcct.Enabled = False
      cmdUpdateAc.Enabled = False
      'cmdStatement.Enabled = False
      'cmdTransaction.Enabled = False
      'cmdChequeBook.Enabled = False
      cmdChqBkRecdByBranch.Enabled = False
      cmdChqBkIssuedToCust.Enabled = False
      'cmdHistStmt.Enabled = False
      cmdActivateDormant.Enabled = False
      cmdNewTimeDeposit.Enabled = False
      cmdRenewTd.Enabled = False
  End If
  
  accountGrid.Row = 1

End Sub

Public Sub getAccDetails()
  Dim tUserid As String, tAccNo As String, strmsglen As String
  Dim updateFlag As String
    
  dormantFlag = "0"
  tUserid = Format(gUserId, "!@@@@@@@@@@")
  accountGrid.Col = 0
  tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
  
  If Len(RTrim(tAccNo)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
   
  If accUpdateAction Or (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
     accountGrid.Col = 6
     dormantFlag = accountGrid.text
     If dormantFlag = "1" And dormantActivationAllowed = False Then
        MsgBox errDormantAcc(UserLang)
        Exit Sub
     End If
  End If
  
  If accUpdateAction Then
     updateFlag = "1"
  Else
     updateFlag = "0"
  End If
  
  SendMsg = "000000" & "33" & gBranchCode & "02" & tUserid & _
            tAccNo & updateFlag & Space(50)

  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  
  cmdEnquiry.Enabled = False
  cmdNewAcct.Enabled = False
  cmdUpdateAc.Enabled = False
  cmdMore.Enabled = False
  cmdStatement.Enabled = False
  cmdTransaction.Enabled = False
  cmdStdOrd.Enabled = False
  cmdStopCheque.Enabled = False
  cmdChequeBook.Enabled = False
  cmdChqBkRecdByBranch.Enabled = False
  cmdChqBkIssuedToCust.Enabled = False
  cmdHistStmt.Enabled = False
  cmdExit.Enabled = False
  frmAccountGrid.MousePointer = vbHourglass
      
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     cmdEnquiry.Enabled = True
     If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
        cmdNewAcct.Enabled = True
        cmdUpdateAc.Enabled = True
        cmdChqBkRecdByBranch.Enabled = True
        cmdChqBkIssuedToCust.Enabled = True
     End If
     cmdChequeBook.Enabled = True
     cmdHistStmt.Enabled = True
     cmdMore.Enabled = True
     cmdStatement.Enabled = True
     cmdTransaction.Enabled = True
     cmdStdOrd.Enabled = True
     cmdStopCheque.Enabled = True
     cmdExit.Enabled = True
     Exit Sub
  End If
  
  frmAccountGrid.MousePointer = vbDefault
  cmdEnquiry.Enabled = True
  If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
     cmdNewAcct.Enabled = True
     cmdUpdateAc.Enabled = True
     cmdChqBkRecdByBranch.Enabled = True
     cmdChqBkIssuedToCust.Enabled = True
  End If
  cmdChequeBook.Enabled = True
  cmdMore.Enabled = True
  cmdHistStmt.Enabled = True
  cmdStatement.Enabled = True
  cmdTransaction.Enabled = True
  cmdStdOrd.Enabled = True
  cmdStopCheque.Enabled = True
  cmdExit.Enabled = True
  
  parseAcctDetailMsg
  
  If recvAccPendingDetail.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvAccPendingDetail.aRemarks
     Else
        MsgBox recvAccPendingDetail.eRemarks
     End If
     Exit Sub
  End If
  
  If accUpdateAction Then
     gDateTime = recvAccPendingDetail.keyDateTime
  End If
  
  If accUpdateAction And _
     recvLoginMsg.globalUpdatePriv = "0" Then
     If gBranchCode <> recvAccPendingDetail.branchCode Then
        MsgBox errUpdateNotAllowed(UserLang)
        Exit Sub
     End If
  End If
  
  ' The following two if statements were added after giving the source code to MISYS
  If accUpdateAction Or (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
     If recvLoginMsg.globalUpdatePriv = "2" Then
        If gBranchCode <> recvAccPendingDetail.branchCode Then
           If recvAccPendingDetail.restrictedFlag = "1" Then
              MsgBox errAccOpeningRestricted(UserLang), vbCritical  '"Account Update is prohibited since the branch is a restricted branch"
              Exit Sub
           End If
        End If
     End If
  End If
  
  If accUpdateAction Or (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
     If recvAccSearchMsg.foundInAList = "1" Then
        MsgBox errAListCustomer1(UserLang) '"Customer is Blacklisted in A-List.. "
     End If
  End If
  
  frmAccount.Show
  
  fillAccountDetailsForm

End Sub

Public Sub readChqBkStatusList(lastRecRead As String, status As String)
   Dim strmsglen As String
   Dim tUserid As String
   
   tUserid = Format(gUserId, "!@@@@@@@@@@")
      
   SendMsg = "000090" & "38" & gBranchCode & tUserid & lastRecRead & status & Space(10)
   
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmAccountGrid.MousePointer = vbHourglass
     
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmAccountGrid.MousePointer = vbDefault
      Exit Sub
   End If
   
   frmAccountGrid.MousePointer = vbDefault
         
   parseChqBkListMsg
   
   If recvChqBkStatusListMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvChqBkStatusListMsg.aRemarks
      Else
         MsgBox recvChqBkStatusListMsg.eRemarks
      End If
      Exit Sub
   End If

End Sub

Public Sub parseStatusListMsg()
 Dim i As Integer, pos As Integer
     
 recvStatusListMsg.status = Mid$(RecvStr, 1, 3)
 recvStatusListMsg.service = Mid$(RecvStr, 4, 2)
 recvStatusListMsg.aRemarks = Mid$(RecvStr, 6, 50)
 recvStatusListMsg.eRemarks = Mid$(RecvStr, 56, 50)
 recvStatusListMsg.lastRecCount = Mid$(RecvStr, 106, 5)
 recvStatusListMsg.noOfRecs = Mid$(RecvStr, 111, 2)
 pos = 113
 For i = 1 To Val(recvStatusListMsg.noOfRecs)
     recvStatusListMsg.details(i).cardNo = Mid$(RecvStr, pos, 19)
     pos = pos + 19
     recvStatusListMsg.details(i).nameOnTheCard = Mid$(RecvStr, pos, 26)
     pos = pos + 26
     recvStatusListMsg.details(i).cardGeneratedDate = Mid$(RecvStr, pos, 8)
     pos = pos + 8
     recvStatusListMsg.details(i).issueDate = Mid$(RecvStr, pos, 8)
     pos = pos + 8
     recvStatusListMsg.details(i).expiryDate = Mid$(RecvStr, pos, 8)
     pos = pos + 8
Next i

End Sub

Public Sub parseChqBkListMsg()

Dim i, pos As Integer

recvChqBkStatusListMsg.status = Mid$(RecvStr, 1, 3)
recvChqBkStatusListMsg.service = Mid$(RecvStr, 4, 2)
recvChqBkStatusListMsg.aRemarks = Mid$(RecvStr, 6, 50)
recvChqBkStatusListMsg.eRemarks = Mid$(RecvStr, 56, 50)
recvChqBkStatusListMsg.lastRecCount = Mid$(RecvStr, 106, 5)
recvChqBkStatusListMsg.noOfRecs = Mid$(RecvStr, 111, 2)
recvChqBkStatusListMsg.filler = Mid$(RecvStr, 113, 10)
pos = 123
'For i = 1 To Val(recvChqBkStatusListMsg.noOfRecs)
For i = 1 To 20
    recvChqBkStatusListMsg.details(i).accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvChqBkStatusListMsg.details(i).chequeType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvChqBkStatusListMsg.details(i).requestedDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvChqBkStatusListMsg.details(i).producedDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvChqBkStatusListMsg.details(i).booksRequested = Mid$(RecvStr, pos, 2)
    pos = pos + 2
Next i

For i = 1 To 20
   recvChqBkStatusListMsg.details(i).requestUserId = Mid$(RecvStr, pos, 10)
   pos = pos + 10
Next

For i = 1 To 20
   recvChqBkStatusListMsg.details(i).custName = Mid$(RecvStr, pos, 30)
   pos = pos + 30
Next

End Sub

Public Sub searchStdOrd(lastRecCount As String)
    Dim tAccNo As String * 14
    Dim tUserid As String * 10
    Dim strmsglen As String
    
    accountGrid.Col = 0
    tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
        
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000000" + "42" + gBranchCode + tUserid + lastRecCount + tAccNo
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    cmdEnquiry.Enabled = False
    cmdNewAcct.Enabled = False
    cmdUpdateAc.Enabled = False
    cmdMore.Enabled = False
    cmdStatement.Enabled = False
    cmdTransaction.Enabled = False
    cmdChequeBook.Enabled = False
    cmdChqBkRecdByBranch.Enabled = False
    cmdChqBkIssuedToCust.Enabled = False
    cmdStdOrd.Enabled = False
    cmdStopCheque.Enabled = False
    cmdHistStmt.Enabled = False
    frmAccountGrid.MousePointer = vbHourglass
  
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     cmdEnquiry.Enabled = True
     If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
        cmdNewAcct.Enabled = True
        cmdUpdateAc.Enabled = True
        cmdChqBkRecdByBranch.Enabled = True
        cmdChqBkIssuedToCust.Enabled = True
     End If
     cmdChequeBook.Enabled = True
     cmdStdOrd.Enabled = True
     cmdStopCheque.Enabled = True
     cmdMore.Enabled = True
     cmdHistStmt.Enabled = True
     cmdStatement.Enabled = True
     cmdTransaction.Enabled = True
     Exit Sub
  End If
  
  frmAccountGrid.MousePointer = vbDefault
  cmdEnquiry.Enabled = True
  If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
     cmdNewAcct.Enabled = True
     cmdUpdateAc.Enabled = True
     cmdChqBkRecdByBranch.Enabled = True
     cmdChqBkIssuedToCust.Enabled = True
  End If
  cmdChequeBook.Enabled = True
  cmdMore.Enabled = True
  cmdStdOrd.Enabled = True
  cmdStopCheque.Enabled = True
  cmdStatement.Enabled = True
  cmdTransaction.Enabled = True
  cmdHistStmt.Enabled = True

  parseStdOrdSearchMsg
  
'  If UserLang = ARABIC Then
'     ChangePositions frmStdOrdGrid, 12000
'     frmStdOrdGrid.RightToLeft = True
'     frmStdOrdGrid.lblCustNo.RightToLeft = True
'     frmStdOrdGrid.lblCustName.RightToLeft = True
'     frmStdOrdGrid.lblStdOrd.RightToLeft = True
'     frmStdOrdGrid.lblStdOrd.Alignment = 1
'     frmStdOrdGrid.txtAcctNo.RightToLeft = True
'     frmStdOrdGrid.txtAcctNo.Alignment = 1
'     frmStdOrdGrid.txtCustNo.RightToLeft = True
'     frmStdOrdGrid.txtCustName.RightToLeft = True
'     frmStdOrdGrid.txtCustName.Alignment = 1
'     frmStdOrdGrid.txtCustNo.Alignment = 1
'  End If
'
'  frmStdOrdGrid.Show
'  frmStdOrdGrid.txtAcctNo = tAccNo
  
End Sub

Public Sub parseStdOrdSearchMsg()
    Dim i As Integer, pos As Integer
    
    recvStdOrdSearchMsg.status = Mid$(RecvStr, 1, 3)
    recvStdOrdSearchMsg.service = Mid$(RecvStr, 4, 2)
    recvStdOrdSearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvStdOrdSearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
    recvStdOrdSearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
    recvStdOrdSearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
    recvStdOrdSearchMsg.filler = Mid$(RecvStr, 113, 10)
    pos = 123
    For i = 1 To Val(recvStdOrdSearchMsg.noOfRecs)
        recvStdOrdSearchMsg.details(i).sodNo = Mid$(RecvStr, pos, 6)
        pos = pos + 6
        recvStdOrdSearchMsg.details(i).paymentType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvStdOrdSearchMsg.details(i).paymentAmt = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvStdOrdSearchMsg.details(i).payAccNo = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvStdOrdSearchMsg.details(i).orderType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvStdOrdSearchMsg.details(i).paymentFrequency = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvStdOrdSearchMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
    Next i
End Sub


Public Sub searchStopChq(lastRecCount As String, destroyChequeFlag As String)
  Dim tAccNo As String * 14
  Dim tUserid As String * 10
  Dim strmsglen As String
    
  accountGrid.Col = 0
  tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
      
  tUserid = Format(gUserId, "!@@@@@@@@@@")
    
  SendMsg = "000000" & "45" & gBranchCode & tUserid & lastRecCount & tAccNo & destroyChequeFlag
    
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  cmdEnquiry.Enabled = False
  cmdNewAcct.Enabled = False
  cmdUpdateAc.Enabled = False
  cmdMore.Enabled = False
  cmdStatement.Enabled = False
  cmdTransaction.Enabled = False
  cmdChequeBook.Enabled = False
  cmdChqBkRecdByBranch.Enabled = False
  cmdChqBkIssuedToCust.Enabled = False
  cmdStdOrd.Enabled = False
  cmdStopCheque.Enabled = False
  cmdHistStmt.Enabled = False
  frmAccountGrid.MousePointer = vbHourglass
  
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     cmdEnquiry.Enabled = True
     If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
        cmdNewAcct.Enabled = True
        cmdUpdateAc.Enabled = True
        cmdChqBkRecdByBranch.Enabled = True
        cmdChqBkIssuedToCust.Enabled = True
     End If
     cmdChequeBook.Enabled = True
     cmdMore.Enabled = True
     cmdStdOrd.Enabled = True
     cmdStopCheque.Enabled = True
     cmdStatement.Enabled = True
     cmdTransaction.Enabled = True
     cmdHistStmt.Enabled = True
     Exit Sub
  End If
  
  frmAccountGrid.MousePointer = vbDefault
  cmdEnquiry.Enabled = True
  If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
     cmdNewAcct.Enabled = True
     cmdUpdateAc.Enabled = True
     cmdChequeBook.Enabled = True
     cmdChqBkRecdByBranch.Enabled = True
     cmdChqBkIssuedToCust.Enabled = True
  End If
  cmdChequeBook.Enabled = True
  cmdStdOrd.Enabled = True
  cmdStopCheque.Enabled = True
  cmdMore.Enabled = True
  cmdStatement.Enabled = True
  cmdTransaction.Enabled = True
  cmdHistStmt.Enabled = True
  
  parseStopChqSearchMsg
  
'  If UserLang = ARABIC Then
'     ChangePositions frmStopChequeGrid, 11800
'     frmStopChequeGrid.RightToLeft = True
'     frmStopChequeGrid.lblCustNo.RightToLeft = True
'     frmStopChequeGrid.lblCustName.RightToLeft = True
'     frmStopChequeGrid.lblStopChqInfo.RightToLeft = True
'     frmStopChequeGrid.lblStopChqInfo.Alignment = 1
'     frmStopChequeGrid.txtAcctNo.RightToLeft = True
'     frmStopChequeGrid.txtAcctNo.Alignment = 1
'     frmStopChequeGrid.txtCustNo.RightToLeft = True
'     frmStopChequeGrid.txtCustName.RightToLeft = True
'     frmStopChequeGrid.txtCustName.Alignment = 1
'     frmStopChequeGrid.txtCustNo.Alignment = 1
'  End If
'  frmStopChequeGrid.txtAcctNo = tAccNo
'  frmStopChequeGrid.Show
End Sub

Public Sub parseStopChqSearchMsg()
    Dim i As Integer, pos As Integer
    
    recvStopChqSearchMsg.status = Mid$(RecvStr, 1, 3)
    recvStopChqSearchMsg.service = Mid$(RecvStr, 4, 2)
    recvStopChqSearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvStopChqSearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
    recvStopChqSearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
    recvStopChqSearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
    recvStopChqSearchMsg.filler = Mid$(RecvStr, 113, 10)
    pos = 123
    'For i = 1 To Val(recvStopChqSearchMsg.noOfRecs)
    For i = 1 To 20
        recvStopChqSearchMsg.details(i).chequeNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvStopChqSearchMsg.details(i).amount = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvStopChqSearchMsg.details(i).dateStop = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvStopChqSearchMsg.details(i).details = Mid$(RecvStr, pos, 25)
        pos = pos + 25
    Next i
    For i = 1 To Val(recvStopChqSearchMsg.noOfRecs)
       recvStopChqSearchMsg.details(i).fromChequeNo = Mid$(RecvStr, pos, 8)
       pos = pos + 8
    Next i
End Sub
Public Sub parseFetchIBANMsg()
    Dim i As Integer, pos As Integer
    
    pos = 1
    
    recvFetchAccDetail.status = Mid$(RecvStr, 1, 3)
    pos = pos + 3
    recvFetchAccDetail.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvFetchAccDetail.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvFetchAccDetail.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvFetchAccDetail.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvFetchAccDetail.iban = Mid$(RecvStr, pos, 24)
    pos = pos + 24
    
End Sub

Public Sub searchChequeBook(lastRecCount As String)
  Dim tAccNo As String * 14
  Dim tUserid As String * 10
  Dim strmsglen As String
    
  accountGrid.Col = 0
  tAccNo = Format(accountGrid.text, "!@@@@@@@@@@@@@@")
  If Len(RTrim(tAccNo)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
    
  tUserid = Format(gUserId, "!@@@@@@@@@@")
    
  SendMsg = "000000" & "55" & gBranchCode & tUserid & lastRecCount & tAccNo & Space(10)
    
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  cmdEnquiry.Enabled = False
  cmdNewAcct.Enabled = False
  cmdUpdateAc.Enabled = False
  cmdMore.Enabled = False
  cmdStatement.Enabled = False
  cmdTransaction.Enabled = False
  cmdChequeBook.Enabled = False
  cmdChqBkRecdByBranch.Enabled = False
  cmdChqBkIssuedToCust.Enabled = False
  cmdStdOrd.Enabled = False
  cmdStopCheque.Enabled = False
  cmdHistStmt.Enabled = False
  frmAccountGrid.MousePointer = vbHourglass
  
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmAccountGrid.MousePointer = vbDefault
     cmdEnquiry.Enabled = True
     If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
        cmdNewAcct.Enabled = True
        cmdUpdateAc.Enabled = True
        cmdChqBkRecdByBranch.Enabled = True
        cmdChqBkIssuedToCust.Enabled = True
     End If
     cmdChequeBook.Enabled = True
     cmdStdOrd.Enabled = True
     cmdStopCheque.Enabled = True
     cmdMore.Enabled = True
     cmdStatement.Enabled = True
     cmdTransaction.Enabled = True
     cmdHistStmt.Enabled = True
     Exit Sub
  End If
  
  frmAccountGrid.MousePointer = vbDefault
  cmdEnquiry.Enabled = True
  If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
     cmdNewAcct.Enabled = True
     cmdUpdateAc.Enabled = True
     cmdChqBkRecdByBranch.Enabled = True
     cmdChqBkIssuedToCust.Enabled = True
  End If
  cmdChequeBook.Enabled = True
  cmdStdOrd.Enabled = True
  cmdStopCheque.Enabled = True
  cmdMore.Enabled = True
  cmdStatement.Enabled = True
  cmdTransaction.Enabled = True
  cmdHistStmt.Enabled = True

  parseChequeBookSearchMsg
  
  frmChequeBookGrid.Show
  frmChequeBookGrid.txtAcctNo = tAccNo
End Sub

Public Function parseChequeBookSearchMsg()

  Dim i As Integer, pos As Integer
    
  recvChequeBookSearchMsg.status = Mid$(RecvStr, 1, 3)
  recvChequeBookSearchMsg.service = Mid$(RecvStr, 4, 2)
  recvChequeBookSearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
  recvChequeBookSearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
  recvChequeBookSearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
  recvChequeBookSearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
  recvChequeBookSearchMsg.accNo = Mid$(RecvStr, 113, 14)
  recvChequeBookSearchMsg.alternativeBranchCode = Mid$(RecvStr, 127, 4)
  recvChequeBookSearchMsg.filler = Mid$(RecvStr, 131, 6)
  pos = 137
  'For i = 1 To Val(recvChequeBookSearchMsg.noOfRecs)
  For i = 1 To 20
      recvChequeBookSearchMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
      pos = pos + 4
      recvChequeBookSearchMsg.details(i).chequeType = Mid$(RecvStr, pos, 1)
      pos = pos + 1
      recvChequeBookSearchMsg.details(i).booksRequested = Mid$(RecvStr, pos, 2)
      pos = pos + 2
      recvChequeBookSearchMsg.details(i).requestDate = Mid$(RecvStr, pos, 8)
      pos = pos + 8
      recvChequeBookSearchMsg.details(i).requestStatus = Mid$(RecvStr, pos, 1)
      pos = pos + 1
      recvChequeBookSearchMsg.details(i).chequeNoFrom = Mid$(RecvStr, pos, 8)
      pos = pos + 8
      recvChequeBookSearchMsg.details(i).chequeNoTo = Mid$(RecvStr, pos, 8)
      pos = pos + 8
  Next i
  
  For i = 1 To 20
     recvChequeBookSearchMsg.details(i).requestUserId = Mid$(RecvStr, pos, 10)
     pos = pos + 10
  Next i
  

End Function

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
End Sub
