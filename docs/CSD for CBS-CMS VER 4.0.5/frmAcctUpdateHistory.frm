VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmAcctUpdateHistory 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account Update History"
   ClientHeight    =   5325
   ClientLeft      =   3720
   ClientTop       =   1020
   ClientWidth     =   6585
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5325
   ScaleWidth      =   6585
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtCustName 
      Enabled         =   0   'False
      Height          =   315
      Left            =   7080
      TabIndex        =   7
      Top             =   960
      Width           =   2895
   End
   Begin VB.TextBox txtAccNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2880
      TabIndex        =   5
      Top             =   960
      Width           =   2055
   End
   Begin VB.CommandButton cmdViewDetail 
      Caption         =   "View Detail"
      Default         =   -1  'True
      Height          =   495
      Left            =   2640
      TabIndex        =   2
      ToolTipText     =   "View Detail"
      Top             =   7560
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   4680
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   7560
      Width           =   1695
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   960
      TabIndex        =   0
      ToolTipText     =   "More"
      Top             =   7560
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid acctHistoryGrid 
      Height          =   5655
      Left            =   480
      TabIndex        =   3
      Top             =   1560
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   9975
      _Version        =   393216
      Rows            =   26
      Cols            =   7
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblAcctUpdateHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Update History"
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
      Left            =   3720
      TabIndex        =   8
      Top             =   120
      Width           =   4575
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name"
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
      TabIndex        =   6
      Top             =   960
      Width           =   1815
   End
   Begin VB.Label lblAccNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account number"
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
      TabIndex        =   4
      Top             =   960
      Width           =   1815
   End
End
Attribute VB_Name = "frmAcctUpdateHistory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub acctHistoryGrid_DblClick()
    getAcctDetails
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdMore_Click()
    If recvAcctHistoryMsg.noOfRecs <> 20 Then
       MsgBox errNoMatchFound(UserLang) '"No more match found..."
       Exit Sub
    End If
    If frmAccountGrid.getAcctHistory(recvAcctHistoryMsg.lastRecCount, recvAcctHistoryMsg.accNo) = -1 Then
       Exit Sub
    End If
       
    If recvAcctHistoryMsg.noOfRecs = "00" Then
       MsgBox errNoMatchFound(UserLang)
       Exit Sub
    End If
    Form_Load
End Sub

Private Sub cmdViewDetail_Click()
    getAcctDetails
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow, flexCol, tWidth As Integer
    Static lastRecRead As String * 3
    Dim tmpStr As String
    Dim tCode As String
    Dim i As Integer
    Dim rowTitle(7) As String
   
   Dim colwidth(9) As Integer
   colwidth(0) = 500
   colwidth(1) = 1000
   colwidth(2) = 2200
   colwidth(3) = 1800
   colwidth(4) = 1600
   colwidth(5) = 2600
   
   frmAcctUpdateHistory.Caption = frmAcctUpdateHistoryCaption(0, UserLang)
   frmAcctUpdateHistory.lblAcctUpdateHistory.Caption = frmAcctUpdateHistoryCaption(0, UserLang)
   frmAcctUpdateHistory.lblAccNo.Caption = frmAcctUpdateHistoryCaption(1, UserLang)
   frmAcctUpdateHistory.lblCustName.Caption = frmAcctUpdateHistoryCaption(2, UserLang)
   frmAcctUpdateHistory.cmdMore.Caption = frmAcctUpdateHistoryCaption(9, UserLang)
   frmAcctUpdateHistory.cmdViewDetail.Caption = frmAcctUpdateHistoryCaption(10, UserLang)
   frmAcctUpdateHistory.cmdCancel.Caption = frmAcctUpdateHistoryCaption(11, UserLang)
     
'   rowTitle(0) = "Branch code"
'   rowTitle(1) = "User Id"
'   rowTitle(2) = "Date Time"
'   rowTitle(3) = "Pending Status"
'   rowTitle(4) = "Supervisor Id"
'   rowTitle(5) = "Approved Date Time"
   
   acctHistoryGrid.Clear
   acctHistoryGrid.Row = 0
   acctHistoryGrid.Font.Bold = True
   tWidth = 0
   For i = 0 To 5
      acctHistoryGrid.Col = i
      acctHistoryGrid.text = frmAcctUpdateHistoryCaption(i + 3, UserLang)
      acctHistoryGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
      acctHistoryGrid.CellAlignment = flexAlignLeftCenter
   Next
    
   acctHistoryGrid.Width = tWidth + 100
   
   txtAccNo = recvAcctHistoryMsg.accNo
   
   txtCustName = frmAccountGrid.txtCustName
   For i = 1 To Val(recvAcctHistoryMsg.noOfRecs)
       acctHistoryGrid.Row = i
       acctHistoryGrid.Col = 0
       acctHistoryGrid.CellAlignment = flexAlignLeftCenter
       acctHistoryGrid.text = recvAcctHistoryMsg.details(i).branchCode
       acctHistoryGrid.Col = 1
       acctHistoryGrid.CellAlignment = flexAlignLeftCenter
       acctHistoryGrid.text = Left(recvAcctHistoryMsg.details(i).userId, 10)
       acctHistoryGrid.Col = 2
       acctHistoryGrid.CellAlignment = flexAlignLeftCenter
       'custHistoryGrid.Text = recvCustHistoryMsg.details(i).dateTime
       acctHistoryGrid.text = formatDate(Mid$(recvAcctHistoryMsg.details(i).dateTime, 1, 8)) & " " & _
                              formatTime(Mid$(recvAcctHistoryMsg.details(i).dateTime, 9, 6))
       acctHistoryGrid.Col = 3
       acctHistoryGrid.CellAlignment = flexAlignLeftCenter
       tCode = recvAcctHistoryMsg.details(i).pendingStatus
       If tCode = "1" Then
          acctHistoryGrid.text = tCode & "-Pending with Supervisor"
       ElseIf tCode = "2" Then
          acctHistoryGrid.text = tCode & "-Pending with CSO"
       ElseIf tCode = "3" Then
          acctHistoryGrid.text = tCode & "-Rejected by supervisor"
       ElseIf tCode = "9" Then
          acctHistoryGrid.text = tCode & "-Update successful"
       Else
          acctHistoryGrid.text = tCode & "-Invalid status  "
       End If
       
       acctHistoryGrid.Col = 4
       acctHistoryGrid.CellAlignment = flexAlignLeftCenter
       acctHistoryGrid.text = recvAcctHistoryMsg.details(i).supervisorId
       acctHistoryGrid.Col = 5
       acctHistoryGrid.CellAlignment = flexAlignLeftCenter
       acctHistoryGrid.text = formatDate(Mid$(recvAcctHistoryMsg.details(i).approvedDateTime, 1, 8)) & " " & _
                              formatTime(Mid$(recvAcctHistoryMsg.details(i).approvedDateTime, 9, 6))
       
   Next i
   acctHistoryGrid.Row = 1
   
End Sub

Public Sub getAcctDetails()
    Dim tuserId As String * 10
    Dim tSupervisorId As String * 10
    Dim tDateTime As String * 14
    Dim tApprovedDateTime As String
    Dim tBranchCode As String * 4
    Dim strmsglen
    Dim tCode As String
    Dim abcStr As String
    Dim tmpStr As String
    
    accSearchAction = False
    accUpdateAction = False
    accSupervisorAction = False
    accTellerAction = False
    accHistoryAction = True

    acctHistoryGrid.Col = 0
    tBranchCode = Format(acctHistoryGrid.text, "!@@@@")
    acctHistoryGrid.Col = 1
    tuserId = Format(acctHistoryGrid.text, "!@@@@@@@@@@")
    acctHistoryGrid.Col = 2
    tmpStr = acctHistoryGrid.text
    tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
    tDateTime = Format(tDateTime, "00000000000000")
    acctHistoryGrid.Col = 4
    tSupervisorId = Format(acctHistoryGrid.text, "@@@@@@@@@@")
    acctHistoryGrid.Col = 5 ' this userid is used to display in the account detail screen
    tApprovedDateTime = Mid$(acctHistoryGrid.text, 1, 10) ' this date is used to display in the account detail screen
    
    If Len(RTrim(tuserId)) = 0 And Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
       
    SendMsg = "000048" & "33" & tBranchCode & "01" & tuserId & tDateTime & "0"
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmAcctUpdateHistory.MousePointer = vbHourglass
    frmAcctUpdateHistory.cmdCancel.Enabled = False
    'frmCustUpdateHistory.cmdVerify.Enabled = False
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
       
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmAcctUpdateHistory.MousePointer = vbDefault
       frmAcctUpdateHistory.cmdCancel.Enabled = True
       Exit Sub
    End If
    frmAcctUpdateHistory.MousePointer = vbDefault
    frmAcctUpdateHistory.cmdCancel.Enabled = True
    parseAcctDetailMsg
  
    If recvAccPendingDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvAccPendingDetail.aRemarks
       Else
          MsgBox recvAccPendingDetail.eRemarks
       End If
       Exit Sub
    End If
  
    frmAccount.Show
    fillAccountDetailsForm
    
    frmAccount.txtLastUpdateUser = tuserId
    frmAccount.txtSupervisorId = tSupervisorId
    frmAccount.cmbLastUpdCsdDate = Mid$(tDateTime, 7, 2)
    frmAccount.cmbLastUpdCsdMonth = Mid$(tDateTime, 5, 2)
    frmAccount.txtLastUpdCsdYear = Mid$(tDateTime, 1, 4)
    frmAccount.cmbSupAppDate = Mid$(tApprovedDateTime, 1, 2)
    frmAccount.cmbSupAppMonth = Mid$(tApprovedDateTime, 4, 2)
    frmAccount.txtSupAppYear = Mid$(tApprovedDateTime, 7, 4)
    
End Sub


Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

