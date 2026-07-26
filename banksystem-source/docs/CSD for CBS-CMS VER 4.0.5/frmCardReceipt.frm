VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCardReceipt 
   BackColor       =   &H00BFD87E&
   Caption         =   "PIN-mailer received by branch"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.CheckBox chkSelectAll 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10200
      TabIndex        =   26
      Top             =   600
      Width           =   255
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   1560
      TabIndex        =   24
      ToolTipText     =   "More"
      Top             =   7440
      Width           =   1335
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update Status"
      Height          =   375
      Left            =   2880
      TabIndex        =   23
      ToolTipText     =   "Update Status"
      Top             =   7440
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4200
      TabIndex        =   22
      ToolTipText     =   "Cancel"
      Top             =   7440
      Width           =   1335
   End
   Begin VB.CheckBox chk20 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   21
      Top             =   6120
      Width           =   255
   End
   Begin VB.CheckBox chk17 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   20
      Top             =   5400
      Width           =   255
   End
   Begin VB.CheckBox chk19 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   19
      Top             =   5880
      Width           =   255
   End
   Begin VB.CheckBox chk16 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   18
      Top             =   5160
      Width           =   255
   End
   Begin VB.CheckBox chk18 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   17
      Top             =   5640
      Width           =   255
   End
   Begin VB.CheckBox chk7 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   15
      Top             =   3000
      Width           =   255
   End
   Begin VB.CheckBox chk4 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   14
      Top             =   2280
      Width           =   255
   End
   Begin VB.CheckBox chk5 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   13
      Top             =   2520
      Width           =   255
   End
   Begin VB.CheckBox chk10 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   12
      Top             =   3720
      Width           =   255
   End
   Begin VB.CheckBox chk8 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   11
      Top             =   3240
      Width           =   255
   End
   Begin VB.CheckBox chk14 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   10
      Top             =   4680
      Width           =   255
   End
   Begin VB.CheckBox chk6 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   9
      Top             =   2760
      Width           =   255
   End
   Begin VB.CheckBox chk9 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   8
      Top             =   3480
      Width           =   255
   End
   Begin VB.CheckBox chk3 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   7
      Top             =   2040
      Width           =   255
   End
   Begin VB.CheckBox chk11 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   6
      Top             =   3960
      Width           =   255
   End
   Begin VB.CheckBox chk13 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   5
      Top             =   4440
      Width           =   255
   End
   Begin VB.CheckBox chk12 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   4
      Top             =   4200
      Width           =   255
   End
   Begin VB.CheckBox chk15 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   3
      Top             =   4920
      Width           =   255
   End
   Begin VB.CheckBox chk2 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   2
      Top             =   1800
      Width           =   255
   End
   Begin VB.CheckBox chk1 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10680
      TabIndex        =   1
      Top             =   1560
      Width           =   255
   End
   Begin MSFlexGridLib.MSFlexGrid cardInfoGrid 
      Height          =   5535
      Left            =   240
      TabIndex        =   0
      Top             =   1320
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   9763
      _Version        =   393216
      Rows            =   26
      Cols            =   6
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label Label1 
      BackColor       =   &H00BFD87E&
      Caption         =   "Select all"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   10560
      TabIndex        =   27
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label lblOK 
      BackColor       =   &H00BFD87E&
      Caption         =   "Received"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   10560
      TabIndex        =   25
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label lblCardReceipt 
      BackColor       =   &H00BFD87E&
      Caption         =   "PIN-mailer received by branch"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   615
      Left            =   2160
      TabIndex        =   16
      Top             =   480
      Width           =   7455
   End
End
Attribute VB_Name = "frmCardReceipt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cardInfoGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub chkSelectAll_Click()
    If chkSelectAll.Value = "1" Then
       chk1.Value = "1"
       chk2.Value = "1"
       chk3.Value = "1"
       chk4.Value = "1"
       chk5.Value = "1"
       chk6.Value = "1"
       chk7.Value = "1"
       chk8.Value = "1"
       chk9.Value = "1"
       chk10.Value = "1"
       chk11.Value = "1"
       chk12.Value = "1"
       chk13.Value = "1"
       chk14.Value = "1"
       chk15.Value = "1"
       chk16.Value = "1"
       chk17.Value = "1"
       chk18.Value = "1"
       chk19.Value = "1"
       chk20.Value = "1"
    Else
       chk1.Value = "0"
       chk2.Value = "0"
       chk3.Value = "0"
       chk4.Value = "0"
       chk5.Value = "0"
       chk6.Value = "0"
       chk7.Value = "0"
       chk8.Value = "0"
       chk9.Value = "0"
       chk10.Value = "0"
       chk11.Value = "0"
       chk12.Value = "0"
       chk13.Value = "0"
       chk14.Value = "0"
       chk15.Value = "0"
       chk16.Value = "0"
       chk17.Value = "0"
       chk18.Value = "0"
       chk19.Value = "0"
       chk20.Value = "0"
    End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdMore_Click()
   If recvStatusListMsg.noOfRecs <> "20" Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   
   frmCardGrid.readStatusList recvStatusListMsg.lastRecCount, cmdUpdate.tag, frmCardReceipt.tag
   If recvStatusListMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   
   Form_Load
End Sub

Private Sub cmdUpdate_Click()
  Dim i As Integer, noOfRecs As Integer
  Dim chkVar As String, tCardNo As String
  Dim strmsglen As String
  
  statusUpdateMsg.msgLen = "000000"
  statusUpdateMsg.service = "27"
  statusUpdateMsg.homeBranch = gBranchCode
  statusUpdateMsg.userId = Format(gUserId, "!@@@@@@@@@@")
  statusUpdateMsg.cardOrPin = cmdUpdate.tag
  If frmCardReceipt.tag = "3" Then
     statusUpdateMsg.requestStatus = "4"
  Else
     statusUpdateMsg.requestStatus = "5"
  End If
  statusUpdateMsg.noOfRecs = "00"
  
  noOfRecs = 0
  For i = 1 To Val(recvStatusListMsg.noOfRecs)
      cardInfoGrid.Row = i
      cardInfoGrid.Col = 0
      'tCardNo = Format(cardInfoGrid.text, "!@@@@@@@@@@@@@@@@@@@")
      tCardNo = Format(recvStatusListMsg.details(i).cardNo, "!@@@@@@@@@@@@@@@@@@@")
      If Len(RTrim(tCardNo)) = 0 Then
         Exit For
      End If
      If i = 1 Then
         If chk1.Value = 1 Then
            noOfRecs = noOfRecs + 1
            statusUpdateMsg.cardNo(noOfRecs) = tCardNo
         End If
      ElseIf i = 2 And chk2.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 3 And chk3.Value = 1 Then
        noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 4 And chk4.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 5 And chk5.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 6 And chk6.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 7 And chk7.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 8 And chk8.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 9 And chk9.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 10 And chk10.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 11 And chk11.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 12 And chk12.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 13 And chk13.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 14 And chk14.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 15 And chk15.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 16 And chk16.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 17 And chk17.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 18 And chk18.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 19 And chk19.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      ElseIf i = 20 And chk20.Value = 1 Then
         noOfRecs = noOfRecs + 1
         statusUpdateMsg.cardNo(noOfRecs) = tCardNo
      End If
  Next
  
  statusUpdateMsg.noOfRecs = Format(str(noOfRecs), "00")
  
  If noOfRecs = 0 Then
     MsgBox errNoRowSelectedForUpdate(UserLang)    '"No row selected for update..Please select and click update"
     Exit Sub
  End If

  SendMsg = statusUpdateMsg.msgLen & statusUpdateMsg.service & _
            statusUpdateMsg.homeBranch & statusUpdateMsg.userId & _
            statusUpdateMsg.noOfRecs & statusUpdateMsg.cardOrPin & _
            statusUpdateMsg.requestStatus & Space(10)
            
   For i = 1 To Val(statusUpdateMsg.noOfRecs)
       SendMsg = SendMsg + statusUpdateMsg.cardNo(i)
   Next
   
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
     
   frmCardReceipt.MousePointer = vbHourglass
   frmCardReceipt.cmdCancel.Enabled = False
   frmCardReceipt.cmdUpdate.Enabled = False
   frmCardReceipt.cmdMore.Enabled = False
   frmCardReceipt.cardInfoGrid.Enabled = False
   
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmCardReceipt.MousePointer = vbDefault
      frmCardReceipt.cmdCancel.Enabled = True
      frmCardReceipt.cmdUpdate.Enabled = True
      frmCardReceipt.cmdMore.Enabled = True
      frmCardReceipt.cardInfoGrid.Enabled = True
      Exit Sub
   End If
   
   frmCardReceipt.MousePointer = vbDefault
   frmCardReceipt.cmdCancel.Enabled = True
   frmCardReceipt.cmdUpdate.Enabled = True
   frmCardReceipt.cmdMore.Enabled = True
   frmCardReceipt.cardInfoGrid.Enabled = True
   
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ENGLISH Then
         MsgBox recvCustomerMsg.eRemarks
      Else
         MsgBox recvCustomerMsg.aRemarks
      End If
      Unload Me
      Exit Sub
   End If
   
   cmdUpdate.tag = ""
   frmCardReceipt.tag = ""
   Unload Me
  
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As String, tWidth As String, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim tmpStr As String, tCode As String
    Dim i As Integer
    Static lastRecRead As String * 3
    
    colwidth(0) = 2100
    colwidth(1) = 2700
    colwidth(2) = 1400
    colwidth(3) = 1400
    colwidth(4) = 1400
    
'    If UserLang = ARABIC Then
'       ChangePositions frmCardReceipt, 11800
'       frmCardReceipt.RightToLeft = True
'       frmCardReceipt.Hide
'    End If
    
'    rowTitle(0) = "Card Number"
'    rowTitle(1) = "Name on the Card"
'    rowTitle(2) = "Card Prod.Date"
'    rowTitle(3) = "Issue Date"
'    rowTitle(4) = "Expiry Date"
   
    frmCardReceipt.cmdMore.Caption = frmCardReceiptCaption(11, UserLang)
    frmCardReceipt.cmdUpdate.Caption = frmCardReceiptCaption(12, UserLang)
    frmCardReceipt.cmdCancel.Caption = frmCardReceiptCaption(13, UserLang)
    cardInfoGrid.Clear
    cardInfoGrid.Row = 0
    cardInfoGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 4
      cardInfoGrid.Col = i
      If UserLang = ARABIC Then
         cardInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         cardInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      cardInfoGrid.text = frmCardReceiptCaption(i + 6, UserLang)
      cardInfoGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
      
    cardInfoGrid.Width = tWidth + 100
    
    For i = 1 To Val(recvStatusListMsg.noOfRecs)
      cardInfoGrid.Row = i
      cardInfoGrid.Col = 0
      cardInfoGrid.CellAlignment = flexAlignLeftCenter
      cardInfoGrid.text = maskCardNo(recvStatusListMsg.details(i).cardNo)
      cardInfoGrid.Col = 1
      cardInfoGrid.CellAlignment = flexAlignLeftCenter
      cardInfoGrid.text = recvStatusListMsg.details(i).nameOnTheCard
      cardInfoGrid.Col = 2
      cardInfoGrid.CellAlignment = flexAlignLeftCenter
      cardInfoGrid.text = formatDate(recvStatusListMsg.details(i).cardGeneratedDate)
      cardInfoGrid.Col = 3
      cardInfoGrid.CellAlignment = flexAlignLeftCenter
      cardInfoGrid.text = formatDate(recvStatusListMsg.details(i).issueDate)
      cardInfoGrid.Col = 4
      cardInfoGrid.CellAlignment = flexAlignLeftCenter
      cardInfoGrid.text = formatDate(recvStatusListMsg.details(i).expiryDate)
   Next i
   
   cardInfoGrid.Row = 1
   
   frmCardReceipt.Show
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
