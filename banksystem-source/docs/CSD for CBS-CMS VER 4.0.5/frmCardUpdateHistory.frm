VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCardUpdateHistory 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card Update History"
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
   Begin VB.TextBox txtFullCardNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2910
      TabIndex        =   9
      Top             =   660
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.TextBox txtCardName 
      Enabled         =   0   'False
      Height          =   315
      Left            =   7080
      TabIndex        =   7
      Top             =   960
      Width           =   2895
   End
   Begin VB.TextBox txtCardNo 
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
      Left            =   4680
      TabIndex        =   2
      ToolTipText     =   "View Detail"
      Top             =   7560
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   6720
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   7560
      Width           =   1695
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   3000
      TabIndex        =   0
      ToolTipText     =   "More"
      Top             =   7560
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid cardUpdHistoryGrid 
      Height          =   5415
      Left            =   720
      TabIndex        =   3
      Top             =   1560
      Width           =   9855
      _ExtentX        =   17383
      _ExtentY        =   9551
      _Version        =   393216
      Rows            =   26
      Cols            =   7
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblCardUpdateHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Update History"
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
   Begin VB.Label lblNameOnTheCard 
      BackColor       =   &H00BFD87E&
      Caption         =   "Name on the card"
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
   Begin VB.Label lblCardNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Number"
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
Attribute VB_Name = "frmCardUpdateHistory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cardUpdHistoryGrid_DblClick()
    getCardDetails
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdMore_Click()
    If recvCardUpdateHistMsg.noOfRecs <> 20 Then
       MsgBox errNoMatchFound(UserLang) '"No more match found..."
       Exit Sub
    End If
    If frmCardGrid.getCardUpdateHistory(recvCardUpdateHistMsg.cardNo, recvCardUpdateHistMsg.lastRecCount) <> 0 Then
       Exit Sub
    End If
       
    If recvCardUpdateHistMsg.noOfRecs = "00" Then
       MsgBox errNoMatchFound(UserLang)
       Exit Sub
    End If
    Form_Load
End Sub

Private Sub cmdViewDetail_Click()
    getCardDetails
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
   colwidth(2) = 2000
   colwidth(3) = 1800
   colwidth(4) = 1000
   colwidth(5) = 2000
   colwidth(6) = 2000
   
   frmCardUpdateHistory.Caption = frmCardUpdateHistoryCaption(0, UserLang)
   frmCardUpdateHistory.lblCardUpdateHistory.Caption = frmCardUpdateHistoryCaption(0, UserLang)
   frmCardUpdateHistory.lblCardNo.Caption = frmCardUpdateHistoryCaption(1, UserLang)
   frmCardUpdateHistory.lblNameOnTheCard.Caption = frmCardUpdateHistoryCaption(2, UserLang)
   frmCardUpdateHistory.cmdMore.Caption = frmCardUpdateHistoryCaption(10, UserLang)
   frmCardUpdateHistory.cmdViewDetail.Caption = frmCardUpdateHistoryCaption(11, UserLang)
   frmCardUpdateHistory.cmdCancel.Caption = frmCardUpdateHistoryCaption(12, UserLang)
     
'   rowTitle(0) = "Branch code"
'   rowTitle(1) = "User Id"
'   rowTitle(2) = "Date Time"
'   rowTitle(3) = "Pending Status"
'   rowTitle(4) = "Supervisor Id"
'   rowTitle(5) = "Approved Date Time"
   
   cardUpdHistoryGrid.Clear
   cardUpdHistoryGrid.Row = 0
   cardUpdHistoryGrid.Font.Bold = True
   tWidth = 0
   For i = 0 To 6
      cardUpdHistoryGrid.Col = i
      cardUpdHistoryGrid.text = frmCardUpdateHistoryCaption(i + 3, UserLang)
      cardUpdHistoryGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
      cardUpdHistoryGrid.CellAlignment = flexAlignLeftCenter
   Next
    
   If UserLang = ENGLISH Then
      cardUpdHistoryGrid.Width = tWidth + 100
   End If
   
   txtCardNo = maskCardNo(recvCardUpdateHistMsg.cardNo)
   txtFullCardNo = recvCardUpdateHistMsg.cardNo
   
   'txtCardName = frmAccountGrid.txtCustName
   For i = 1 To Val(recvCardUpdateHistMsg.noOfRecs)
       cardUpdHistoryGrid.Row = i
       cardUpdHistoryGrid.Col = 0
       cardUpdHistoryGrid.CellAlignment = flexAlignLeftCenter
       cardUpdHistoryGrid.text = recvCardUpdateHistMsg.details(i).branchCode
       cardUpdHistoryGrid.Col = 1
       cardUpdHistoryGrid.CellAlignment = flexAlignLeftCenter
       cardUpdHistoryGrid.text = Left(recvCardUpdateHistMsg.details(i).userId, 10)
       cardUpdHistoryGrid.Col = 2
       cardUpdHistoryGrid.CellAlignment = flexAlignLeftCenter
       'custHistoryGrid.Text = recvCustHistoryMsg.details(i).dateTime
       cardUpdHistoryGrid.text = formatDate(Mid$(recvCardUpdateHistMsg.details(i).dateTime, 1, 8)) & " " & _
                              formatTime(Mid$(recvCardUpdateHistMsg.details(i).dateTime, 9, 6))
       cardUpdHistoryGrid.Col = 3
       cardUpdHistoryGrid.CellAlignment = flexAlignLeftCenter
       tCode = recvCardUpdateHistMsg.details(i).pendingStatus
       If tCode = "1" Then
          cardUpdHistoryGrid.text = tCode & "-Pending with Supervisor"
       ElseIf tCode = "2" Then
          cardUpdHistoryGrid.text = tCode & "-Pending with CSO"
       ElseIf tCode = "3" Then
          cardUpdHistoryGrid.text = tCode & "-Rejected by supervisor"
       ElseIf tCode = "9" Then
          cardUpdHistoryGrid.text = tCode & "-Update successful"
       Else
          cardUpdHistoryGrid.text = tCode & "-Invalid status  "
       End If
       
       cardUpdHistoryGrid.Col = 4
       cardUpdHistoryGrid.CellAlignment = flexAlignLeftCenter
       cardUpdHistoryGrid.text = recvCardUpdateHistMsg.details(i).supervisorId
       cardUpdHistoryGrid.Col = 5
       cardUpdHistoryGrid.CellAlignment = flexAlignLeftCenter
       cardUpdHistoryGrid.text = formatDate(Mid$(recvCardUpdateHistMsg.details(i).approvedDateTime, 1, 8)) & " " & _
                              formatTime(Mid$(recvCardUpdateHistMsg.details(i).approvedDateTime, 9, 6))
       tCode = recvCardUpdateHistMsg.details(i).requestType
       If tCode = "0" Then
          tmpStr = "Initial Card"
       ElseIf tCode = "1" Then
          tmpStr = "Renewed"
       ElseIf tCode = "2" Then
          tmpStr = "Force card"
       ElseIf tCode = "3" Then
          tmpStr = "Force pin"
       ElseIf tCode = "4" Then
          tmpStr = "Deactivation"
       ElseIf tCode = "5" Then
          tmpStr = "Activation"
       ElseIf tCode = "6" Then
          tmpStr = "Change Address"
       ElseIf tCode = "7" Then
          tmpStr = "Restriction"
       ElseIf tCode = "8" Then
          tmpStr = "Unrestriction"
       ElseIf tCode = "9" Then
          tmpStr = "Rejected"
       ElseIf tCode = "C" Then
          tmpStr = "Converted to Intl card"
       ElseIf tCode = "P" Then
          tmpStr = "New card for the pensioner"
       Else
          tmpStr = "Unknown"
       End If
       cardUpdHistoryGrid.Col = 6
       cardUpdHistoryGrid.CellAlignment = flexAlignLeftCenter
       cardUpdHistoryGrid.text = tCode & "-" & tmpStr
   Next i
   cardUpdHistoryGrid.Row = 1
   
End Sub

Public Sub getCardDetails()
    Dim tUserid As String * 10
    Dim tSupervisorId As String * 10
    Dim tDateTime As String * 14
    Dim tApprovedDateTime As String
    Dim tBranchCode As String * 4
    Dim tCardNo As String * 19
    Dim strmsglen
    Dim tCode As String
    Dim abcStr As String
    Dim tmpStr As String
    
    cardSearchAction = False
    cardUpdateAction = False
    cardSupervisorAction = False
    cardTellerAction = False
    cardHistoryAction = True

    cardUpdHistoryGrid.Col = 0
    tBranchCode = Format(cardUpdHistoryGrid.text, "!@@@@")
    cardUpdHistoryGrid.Col = 1
    tUserid = Format(cardUpdHistoryGrid.text, "!@@@@@@@@@@")
    cardUpdHistoryGrid.Col = 2
    tmpStr = cardUpdHistoryGrid.text
    tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
    tDateTime = Format(tDateTime, "00000000000000")
    cardUpdHistoryGrid.Col = 4
    tSupervisorId = Format(cardUpdHistoryGrid.text, "@@@@@@@@@@")
    cardUpdHistoryGrid.Col = 5 ' this userid is used to display in the account detail screen
    tApprovedDateTime = Mid$(cardUpdHistoryGrid.text, 1, 10) ' this date is used to display in the account detail screen
    
    tCardNo = Format(txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
    
    If Len(RTrim(tUserid)) = 0 And Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    SendMsg = "000048" & "25" & tBranchCode & "01" & tUserid & tDateTime & tCardNo
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardUpdateHistory.MousePointer = vbHourglass
    frmCardUpdateHistory.cmdCancel.Enabled = False
    frmCardUpdateHistory.cmdViewDetail.Enabled = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardUpdateHistory.MousePointer = vbDefault
       frmCardUpdateHistory.cmdCancel.Enabled = True
       frmCardUpdateHistory.cmdViewDetail.Enabled = True
       Exit Sub
    End If
    frmCardUpdateHistory.MousePointer = vbDefault
    frmCardUpdateHistory.cmdCancel.Enabled = True
    frmCardUpdateHistory.cmdViewDetail.Enabled = True
    parseCardPendingDetail
    If recvCardPendingDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCardPendingDetail.aRemarks
       Else
          MsgBox recvCardPendingDetail.eRemarks
       End If
       Exit Sub
    End If
    
    frmCardDetails.Show
    fillCardDetailsForm
    frmCardDetails.cmdHistory.Enabled = False
    
End Sub


Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

