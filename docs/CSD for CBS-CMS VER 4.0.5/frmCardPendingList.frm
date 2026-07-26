VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCardPendingList 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card Pending List"
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
   Begin VB.TextBox txtCustomerNo 
      Height          =   285
      Left            =   2535
      MaxLength       =   8
      TabIndex        =   6
      Top             =   645
      Width           =   1575
   End
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4335
      TabIndex        =   5
      ToolTipText     =   "Check pending List"
      Top             =   615
      Width           =   2295
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   2040
      TabIndex        =   4
      ToolTipText     =   "More"
      Top             =   7560
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5640
      TabIndex        =   3
      ToolTipText     =   "Cancel"
      Top             =   7560
      Width           =   1335
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      ToolTipText     =   "Verify Selected Record"
      Top             =   7560
      Width           =   2295
   End
   Begin MSFlexGridLib.MSFlexGrid cardPendingGrid 
      Height          =   6255
      Left            =   480
      TabIndex        =   1
      Top             =   1080
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   11033
      _Version        =   393216
      Rows            =   26
      Cols            =   7
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      ForeColorFixed  =   8388608
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
      Left            =   525
      TabIndex        =   7
      Top             =   645
      Width           =   1935
   End
   Begin VB.Label lblPendingActivities 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Pending Activities for Supervisor"
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
      Height          =   330
      Left            =   2880
      TabIndex        =   0
      Top             =   105
      Width           =   5655
   End
End
Attribute VB_Name = "frmCardPendingList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cardPendingGrid_DblClick()
    Dim tUserid As String * 10
    Dim tDateTime As String * 14
    Dim tBranchCode As String * 4
    Dim tCardNo As String * 19
    Dim strmsglen As String
    Dim tCode As String
    Dim tmpStr As String
        
    cardPendingGrid.Col = 0
    tUserid = Format(cardPendingGrid.text, "!@@@@@@@@@@")
    cardPendingGrid.Col = 1
    tDateTime = Format(cardPendingGrid.text, "00000000000000")
    cardPendingGrid.Col = 2
    'tCardNo = Format(cardPendingGrid.text, "!@@@@@@@@@@@@@@@@@@@")
    tCardNo = Format(recvCardPendingList.details(cardPendingGrid.Row).cardNo, "!@@@@@@@@@@@@@@@@@@@")
    tBranchCode = gBranchCode
    
    If Len(RTrim(tUserid)) = 0 And _
       Len(RTrim(tDateTime)) = 0 And Len(RTrim(tCardNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
          
    SendMsg = "000048" & "25" & gBranchCode & "01" & tUserid & tDateTime & tCardNo & Space(100)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardPendingList.MousePointer = vbHourglass
    frmCardPendingList.cmdCancel.Enabled = False
    frmCardPendingList.cmdVerify.Enabled = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardPendingList.MousePointer = vbDefault
       frmCardPendingList.cmdCancel.Enabled = True
       frmCardPendingList.cmdVerify.Enabled = True
       Exit Sub
    End If
    frmCardPendingList.MousePointer = vbDefault
    frmCardPendingList.cmdCancel.Enabled = True
    frmCardPendingList.cmdVerify.Enabled = True
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
    If cardSupervisorAction Then
       frmCardDetails.FrameCardDetails.Enabled = False
    Else
       If recvCardPendingDetail.newOrUpdate = "N" Then
          frmCardDetails.FrameCardDetails.Enabled = True
       Else
          frmCardDetails.FrameCardDetails.Enabled = False
       End If
    End If
End Sub

Private Sub cardPendingGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdCancel_Click()
   Unload frmCardGrid
   Unload Me
End Sub

Private Sub cmdCheckPendingList_Click()
  Dim tCustNo As String
  If Len(Trim(txtCustomerNo)) = 0 Then
     MsgBox errSpaceCustomerNo(UserLang)
     txtCustomerNo.SetFocus
     Exit Sub
  End If
  If cardSupervisorAction = True Then
     frmEnquiry.readCardPendingList "00000", "S", Format(txtCustomerNo, "00000000")
  ElseIf cardTellerAction = True Then
     frmEnquiry.readCardPendingList "00000", "T", Format(txtCustomerNo, "00000000")
  Else
     frmEnquiry.readCardPendingList "00000", "C", Format(txtCustomerNo, "00000000")
  End If
    
  If recvCardPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdMore_Click()
  If recvCardPendingList.noOfRecs <> 20 Then
     MsgBox errNoMatchFound(UserLang) '"No more match found..."
     Exit Sub
  End If
   If cardSupervisorAction = True Then
      frmEnquiry.readCardPendingList recvCardPendingList.lastRecCount, "S", Format(txtCustomerNo, "0000000")
   ElseIf cardTellerAction = True Then
      frmEnquiry.readCardPendingList recvCardPendingList.lastRecCount, "T", Format(txtCustomerNo, "0000000")
   Else
      frmEnquiry.readCardPendingList recvCardPendingList.lastRecCount, "C", Format(txtCustomerNo, "00000000")
   End If
    
  If recvCardPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdVerify_Click()
   cardPendingGrid_DblClick
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As Integer
    Dim tWidth As Integer
    Dim amtDenom As Integer
    Dim colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim tmpStr As String
    Dim mQry As String, accStatus As String
    Dim tCcy As String, tDecimalPlace As String
    Dim tCode As String
    Dim i As Integer
    Static lastRecRead As String * 3
    
    colwidth(0) = 1300
    colwidth(1) = 1600
    colwidth(2) = 1800
    colwidth(3) = 2100
    colwidth(4) = 1500
    colwidth(5) = 1500
    colwidth(6) = 1500
    
    If cardTellerAction Then
       frmCardPendingList.Caption = frmCardPendingListCaption(1, UserLang)
       frmCardPendingList.lblPendingActivities = frmCardPendingListCaption(3, UserLang)
    ElseIf cardSupervisorAction Then
       frmCardPendingList.Caption = frmCardPendingListCaption(0, UserLang)
       frmCardPendingList.lblPendingActivities = frmCardPendingListCaption(2, UserLang)
    Else
       frmCardPendingList.Caption = frmCardPendingListCaption(14, UserLang) '"Cards Pending from Finacle"
       frmCardPendingList.lblPendingActivities = frmCardPendingListCaption(14, UserLang) '"Cards Pending from Finacle"
    End If
    
    frmCardPendingList.cmdVerify.Caption = frmCardPendingListCaption(11, UserLang)
    frmCardPendingList.cmdCancel.Caption = frmCardPendingListCaption(12, UserLang)
    frmCardPendingList.cmdMore.Caption = frmCardPendingListCaption(13, UserLang)
    lblCustomerNo.Caption = errCustomerNo(UserLang)
    cmdCheckPendingList.Caption = errCheckPendingList(UserLang)
    
'    rowTitle(0) = "User Id"
'    rowTitle(1) = "Date&Time"
'    rowTitle(2) = "Card Number"
'    rowTitle(3) = "Name on the card"
'    rowTitle(4) = "Card Type"
'    rowTitle(5) = "Nature of Card"
'    rowTitle(6) = "Pending Type"
    
    cardPendingGrid.Clear
    cardPendingGrid.Row = 0
    cardPendingGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 6
      cardPendingGrid.Col = i
      If UserLang = ARABIC Then
         cardPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         cardPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      cardPendingGrid.text = frmCardPendingListCaption(i + 4, UserLang)
      cardPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    
    If UserLang = ENGLISH Then
       cardPendingGrid.Width = tWidth + 100
    End If

    For i = 1 To Val(recvCardPendingList.noOfRecs)
      cardPendingGrid.Row = i
      cardPendingGrid.Col = 0
      cardPendingGrid.CellAlignment = flexAlignLeftCenter
      cardPendingGrid.text = recvCardPendingList.details(i).userId
      cardPendingGrid.Col = 1
      cardPendingGrid.CellAlignment = flexAlignLeftCenter
      cardPendingGrid.text = recvCardPendingList.details(i).dateTime
      cardPendingGrid.Col = 2
      cardPendingGrid.CellAlignment = flexAlignLeftCenter
      cardPendingGrid.text = maskCardNo(recvCardPendingList.details(i).cardNo)
      cardPendingGrid.Col = 3
      cardPendingGrid.CellAlignment = flexAlignLeftCenter
      cardPendingGrid.text = recvCardPendingList.details(i).nameOnTheCard
      cardPendingGrid.Col = 4
      cardPendingGrid.CellAlignment = flexAlignLeftCenter
      tCode = recvCardPendingList.details(i).cardType
      If tCode = "R" Then
         tmpStr = "Regular"
      ElseIf tCode = "I" Then
         tmpStr = "International"
      ElseIf tCode = "V" Then
         tmpStr = "VIP"
      ElseIf tCode = "A" Then
         tmpStr = "Administrative"
      ElseIf tCode = "D" Then
         tmpStr = "Deposit"
      ElseIf tCode = "C" Then
         tmpStr = "CPS"
      ElseIf tCode = "S" Then
         tmpStr = "Smart(Chip) Card"
      ElseIf tCode = "L" Then
         tmpStr = "Local Chip Card"
      Else
         tmpStr = "Invalid card type  " & tCode
      End If
      cardPendingGrid.text = tmpStr
      cardPendingGrid.Col = 5
      cardPendingGrid.CellAlignment = flexAlignLeftCenter
      tCode = recvCardPendingList.details(i).natureOfCard
      If tCode = "P" Then
         tmpStr = "Primary"
      ElseIf tCode = "S" Then
         tmpStr = "Supplementary"
      Else
         tmpStr = "Invalid code " & tCode
      End If
      cardPendingGrid.text = tmpStr
      cardPendingGrid.Col = 6
      cardPendingGrid.CellAlignment = flexAlignLeftCenter
      cardPendingGrid.text = recvCardPendingList.details(i).pendingType
   Next i
   cardPendingGrid.Row = 1
   
   CSD_mdiForm.staticStatus.Panels(3).text = " "
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
