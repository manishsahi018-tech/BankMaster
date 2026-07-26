VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCardGrid 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card Management"
   ClientHeight    =   8160
   ClientLeft      =   600
   ClientTop       =   555
   ClientWidth     =   11010
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8160
   ScaleWidth      =   11010
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdCardUpdHistory 
      Caption         =   "Card Update History"
      Height          =   495
      Left            =   6360
      TabIndex        =   16
      ToolTipText     =   "Card Update History"
      Top             =   6960
      Width           =   1815
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
      Height          =   375
      Left            =   2160
      TabIndex        =   13
      Top             =   840
      Width           =   1215
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
      Height          =   375
      Left            =   5520
      TabIndex        =   12
      Top             =   840
      Width           =   5175
   End
   Begin VB.CommandButton cmdAdminCard 
      Caption         =   "Admin Card Request"
      Enabled         =   0   'False
      Height          =   495
      Left            =   7080
      TabIndex        =   11
      ToolTipText     =   "Admin Card Request"
      Top             =   7680
      Width           =   1695
   End
   Begin VB.CommandButton cmdPinMailerIssuedToCustomer 
      Caption         =   "Pin-mailer Issued to Customer"
      Height          =   495
      Left            =   5520
      TabIndex        =   10
      ToolTipText     =   "Pin-mailer Issued to customer"
      Top             =   7680
      Width           =   1575
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update"
      Height          =   495
      Left            =   3720
      TabIndex        =   9
      ToolTipText     =   "Update"
      Top             =   6960
      Width           =   1335
   End
   Begin VB.CommandButton cmdPinMailerRecdByBranch 
      Caption         =   "Pin-mailer Received by Branch"
      Height          =   495
      Left            =   3960
      TabIndex        =   8
      ToolTipText     =   "pin-mailer received by branch"
      Top             =   7680
      Width           =   1575
   End
   Begin VB.CommandButton cmdCardIssuedToCust 
      Caption         =   "Card issued to     Customer"
      Height          =   495
      Left            =   2640
      TabIndex        =   7
      ToolTipText     =   "Card Issued to Customer"
      Top             =   7680
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   8175
      TabIndex        =   6
      ToolTipText     =   "Exit"
      Top             =   6960
      Width           =   1335
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   5040
      TabIndex        =   5
      ToolTipText     =   "More"
      Top             =   6960
      Width           =   1335
   End
   Begin VB.CommandButton cmdEnquiry 
      Caption         =   "Enquiry"
      Height          =   495
      Left            =   2520
      TabIndex        =   4
      ToolTipText     =   "Enquiry"
      Top             =   6960
      Width           =   1215
   End
   Begin VB.CommandButton cmdCardRecdByBranch 
      Caption         =   "Card Received by           Branch"
      Height          =   495
      Left            =   1200
      TabIndex        =   3
      ToolTipText     =   "Card Received by Branch"
      Top             =   7680
      Width           =   1455
   End
   Begin VB.CommandButton cmdNewCard 
      Caption         =   "New Card"
      Height          =   495
      Left            =   1200
      TabIndex        =   2
      ToolTipText     =   "New Card"
      Top             =   6975
      Width           =   1335
   End
   Begin MSFlexGridLib.MSFlexGrid cardGrid 
      Height          =   5415
      Left            =   120
      TabIndex        =   0
      Top             =   1320
      Width           =   11580
      _ExtentX        =   20426
      _ExtentY        =   9551
      _Version        =   393216
      Rows            =   22
      Cols            =   8
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   1
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
      Height          =   375
      Left            =   360
      TabIndex        =   15
      Top             =   840
      Width           =   1575
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
      Height          =   375
      Left            =   3480
      TabIndex        =   14
      Top             =   840
      Width           =   1815
   End
   Begin VB.Label lblCardInfo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Information"
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
      Left            =   3480
      TabIndex        =   1
      Top             =   120
      Width           =   5895
   End
End
Attribute VB_Name = "frmCardGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cardGrid_DblClick()
   cmdEnquiry_Click
End Sub

Private Sub cardGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdAdminCard_Click()
   Dim strmsglen, tCode As String
   
   tCode = Right$(recvCardSearchMsg.custNo, 4)
   If recvLoginMsg.globalUpdatePriv = "0" Then
      If gBranchCode <> tCode Then
         LogData errCannotRequestAdminCard(1)
         LogData "Local Branch Code " + gBranchCode
         LogData "Admin card Requested branch " + tCode
         MsgBox errCannotRequestAdminCard(UserLang)
         Exit Sub
      End If
   End If
   atmPin = Space(4)
   formatAdminCardRequest
   frmCardDetails.Hide
   frmCardDetails.createCardRequest
   
End Sub

Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdCardIssuedToCust_Click()
   readStatusList "00000", "C", "4"
   If UserLang = ARABIC Then
      ChangePositions frmCardReceipt, 11800
      frmCardReceipt.RightToLeft = True
      frmCardReceipt.Hide
   End If
   frmCardReceipt.Show
   frmCardReceipt.Caption = frmCardReceiptCaption(1, UserLang)  '"Card Issued to customer"
   frmCardReceipt.lblCardReceipt = frmCardReceiptCaption(1, UserLang)  '"Card Issued to customer"
   frmCardReceipt.lblOK = frmCardReceiptCaption(5, UserLang)   '"Issued"
   frmCardReceipt.tag = "4"
   frmCardReceipt.cmdUpdate.tag = "C"
End Sub

Private Sub cmdCardRecdByBranch_Click()
   readStatusList "00000", "C", "3"
   If UserLang = ARABIC Then
      ChangePositions frmCardReceipt, 11800
      frmCardReceipt.RightToLeft = True
      frmCardReceipt.Hide
   End If
   frmCardReceipt.Show
   frmCardReceipt.Caption = frmCardReceiptCaption(0, UserLang)  '"Card Received By Branch"
   frmCardReceipt.lblCardReceipt = frmCardReceiptCaption(0, UserLang)  '"Card Received By Branch"
   frmCardReceipt.lblOK = frmCardReceiptCaption(4, UserLang)    ' "Received"
   frmCardReceipt.tag = "3"
   frmCardReceipt.cmdUpdate.tag = "C"
End Sub

Private Sub cmdCardUpdHistory_Click()
    Dim tCardNo As String * 19
    Dim cardName As String
    Dim strmsglen As String
    Dim tCode As String
    Dim tmpStr As String
    
    cardGrid.Col = 0
    'tCardNo = Format(cardGrid.text, "!@@@@@@@@@@@@@@@@@@@")
    tCardNo = Format(recvCardSearchMsg.details(cardGrid.Row).cardNo, "!@@@@@@@@@@@@@@@@@@@")
    cardGrid.Col = 1
    cardName = cardGrid.text
    
    If Len(RTrim(tCardNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    If getCardUpdateHistory(tCardNo, "00000") <> 0 Then
       Exit Sub
    End If
    
    If UserLang = ARABIC Then
       ChangePositions frmCardUpdateHistory, 11800
       frmCardUpdateHistory.RightToLeft = True
    End If
    
    frmCardUpdateHistory.Show
    frmCardUpdateHistory.txtCardName = cardName
    
End Sub
Public Function getCardUpdateHistory(cardNo As String, lastRecCount As String) As Integer
    Dim strmsglen As String
    
    LogData "Sending Request message for getting Card update History details for the card # : " & maskCardNo(cardNo)
    SendMsg = "000000" & "36" & gBranchCode & cardNo & "1" & lastRecCount & Space(10)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardGrid.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardGrid.MousePointer = vbDefault
       getCardUpdateHistory = 1
       Exit Function
    End If
    frmCardGrid.MousePointer = vbDefault
    
    parseCardUpdateHistoryDetails
    getCardUpdateHistory = 0
    
End Function

Private Sub cmdEnquiry_Click()
   cardSearchAction = True
   cardUpdateAction = False
   cardTellerAction = False
   cardSupervisorAction = False
   cardHistoryAction = False
   cbsCardCreationAction = False
   LogData "Card Search operation selected"
   getCardDetails
End Sub

Private Sub cmdMore_Click()
   
   If recvCardSearchMsg.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   searchCard (recvCardSearchMsg.lastRecCount)
    
   If recvCardSearchMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   frmCardGrid.Hide
   Form_Load
End Sub

Private Sub cmdNewCard_Click()
   Dim tBmAccNo As String, tCardNo As String
   Dim tCardName As String
   Dim tCode As String
   Dim tmpStr As String
    
   cardGrid.Col = 0
   'tCardNo = Format(cardGrid.text, "!@@@@@@@@@@@@@@@@@@@")
   tCardNo = Format(recvCardSearchMsg.details(cardGrid.Row).cardNo, "!@@@@@@@@@@@@@@@@@@@")
   cardGrid.Col = 7
   tBmAccNo = cardGrid.text
   
   ratibiIdNo = Space(10)
   ratibiAccNo = Space(16)
   ratibiCardName = Space(26)
   If Mid$(tCardNo, 1, 6) = "200030" Then
      ratibiIdNo = Mid$(tCardNo, 7, 10)
      ratibiAccNo = tBmAccNo
      cardGrid.Col = 1
      ratibiCardName = Format(cardGrid.text, "!@@@@@@@@@@@@@@@@@@@@@@@@@@")
   Else
      tCustNo = Mid$(tBmAccNo, 5, 8)
   End If
   
   If Len(RTrim(tCustNo)) = 0 Then
      tCustNo = recvCardSearchMsg.custNo
   End If
   
   If Len(RTrim(tCustNo)) = 0 Then
      MsgBox errInvalidCardNo(UserLang)   '"Invalid Card Number...Please Enquire again"
      Unload Me
      Exit Sub
   End If
   
   If Mid$(tCardNo, 1, 6) = "200030" And payrollBranch = True Then
   Else
      If recvCardSearchMsg.custType <> "0" Then
         If recvCardSearchMsg.custType = "1" Then
            MsgBox errCardNotAllowed(UserLang)
         Else
            MsgBox errCardNotAllowedForThisCategory(UserLang)
         End If
         Unload Me
         Exit Sub
      End If
   End If
   
   LogData "New card request button is selected for the cust # " & tCustNo
   
   cardSearchAction = False
   cardTellerAction = False
   cardUpdateAction = False
   cardSupervisorAction = False
   cardHistoryAction = False
   cbsCardCreationAction = False
   
   If Mid$(tCardNo, 1, 6) = "200030" And payrollBranch Then
      frmCardDetails.optElectronIntl.Enabled = False
      frmCardDetails.optIntlChip.Enabled = False
      frmCardDetails.optLocalChip.Enabled = False
      frmCardDetails.optPayroll.Value = True
   End If
    
   frmCardDetails.txtCustNo = tCustNo
   If Len(Trim(tBmAccNo)) = 0 Then
      frmCardDetails.txtCustomerNo = tCustNo
   Else
      frmCardDetails.txtCustomerNo = Mid$(tBmAccNo, 5, 8)
   End If
   If UserLang = ARABIC Then
      If Len(RTrim(recvCardSearchMsg.aShortName)) <> 0 Then
         frmCardDetails.txtCustomerName = recvCardSearchMsg.aShortName
      Else
         frmCardDetails.txtCustomerName = recvCardSearchMsg.eShortName
      End If
   Else
      If Len(RTrim(recvCardSearchMsg.eShortName)) <> 0 Then
         frmCardDetails.txtCustomerName = recvCardSearchMsg.eShortName
      Else
         frmCardDetails.txtCustomerName = recvCardSearchMsg.aShortName
      End If
   End If
   If Mid$(tCardNo, 1, 6) = "200030" And payrollBranch = True Then
   Else
      If Len(RTrim(recvCardSearchMsg.eShortName)) <> 0 Then
         If arabicCharFound(recvCardSearchMsg.eShortName) = False Then
            frmCardDetails.txtNameOnCard = Trim(UCase(recvCardSearchMsg.eShortName))
         End If
      End If
   End If
   frmCardDetails.txtBranchCode = recvCardSearchMsg.custBranchCode
   'frmCardDetails.optPayroll.Enabled = False  'disable new CPS card creation
   If payrollBranch = True Then
      frmCardDetails.optPayroll.Enabled = True  'enable new CPS card creation as per PIR from RATIBI dept.
   Else
      frmCardDetails.optPayroll.Enabled = False
   End If
   frmCardDetails.cmdApprove.Enabled = False
   frmCardDetails.cmdReject.Enabled = False
   frmCardDetails.cmdActivate.Enabled = False
   frmCardDetails.cmdForceCard.Enabled = False
   frmCardDetails.cmdForcePIN.Enabled = False
   frmCardDetails.cmdHistory.Enabled = False
   frmCardDetails.Show
End Sub

Private Sub cmdPinMailerIssuedToCustomer_Click()
   LogData "Pin Mailer Issued to customer command button is selected"
   readStatusList "00000", "P", "4"
   If UserLang = ARABIC Then
      ChangePositions frmCardReceipt, 11800
      frmCardReceipt.RightToLeft = True
      frmCardReceipt.Hide
   End If
   frmCardReceipt.Show
   frmCardReceipt.Caption = frmCardReceiptCaption(3, UserLang)    '"Pin-mailer issued to customer"
   frmCardReceipt.lblCardReceipt = frmCardReceiptCaption(3, UserLang)    '"Pin-mailer issued to customer"
   frmCardReceipt.lblOK = frmCardReceiptCaption(5, UserLang)  '"Issued"
   frmCardReceipt.tag = "4"
   frmCardReceipt.cmdUpdate.tag = "P"
End Sub

Private Sub cmdPinMailerRecdByBranch_Click()
   LogData "Pin Mailer Received by branch command button is selected"
   readStatusList "00000", "P", "3"
   If UserLang = ARABIC Then
      ChangePositions frmCardReceipt, 11800
      frmCardReceipt.RightToLeft = True
      frmCardReceipt.Hide
   End If
   frmCardReceipt.Show
   frmCardReceipt.Caption = frmCardReceiptCaption(2, UserLang)  '"Pin-mailer Received By Branch"
   frmCardReceipt.lblCardReceipt = frmCardReceiptCaption(2, UserLang)  '"Pin-mailer Received By Branch"
   frmCardReceipt.lblOK = frmCardReceiptCaption(4, UserLang) '"Received"
   frmCardReceipt.tag = "3"
   frmCardReceipt.cmdUpdate.tag = "P"
End Sub

Private Sub cmdPrintCard_Click()

End Sub

Private Sub cmdUpdate_Click()
    cardUpdateAction = True
    cardSearchAction = False
    cardTellerAction = False
    cardSupervisorAction = False
    cardHistoryAction = False
    cbsCardCreationAction = False
    LogData "Card Update option selected"
    getCardDetails
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As Integer
    Dim tWidth As Integer
    Dim colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim i As Integer
    Dim tmpStr As String, tCode As String, mQry As String
    Static lastRecRead As String * 3
    
'    If UserLang = ARABIC Then
'       ChangePositions frmCardGrid, 12000
'       frmCardGrid.RightToLeft = True
'    End If
    
    colwidth(0) = 2100
    colwidth(1) = 2500
    colwidth(2) = 1200
    colwidth(3) = 1200
    colwidth(4) = 1200
    colwidth(5) = 1300
    colwidth(6) = 1300
    colwidth(7) = 1700
        
    frmCardGrid.Caption = frmCardGridCaption(0, UserLang)
    frmCardGrid.lblCardInfo.Caption = frmCardGridCaption(1, UserLang)
    frmCardGrid.cmdNewCard.Caption = frmCardGridCaption(10, UserLang)
    frmCardGrid.cmdEnquiry.Caption = frmCardGridCaption(11, UserLang)
    frmCardGrid.cmdUpdate.Caption = frmCardGridCaption(12, UserLang)
    frmCardGrid.cmdMore.Caption = frmCardGridCaption(13, UserLang)
    frmCardGrid.cmdCancel.Caption = frmCardGridCaption(14, UserLang)
    frmCardGrid.cmdCardRecdByBranch.Caption = frmCardGridCaption(15, UserLang)
    frmCardGrid.cmdCardIssuedToCust.Caption = frmCardGridCaption(16, UserLang)
    frmCardGrid.cmdPinMailerRecdByBranch.Caption = frmCardGridCaption(17, UserLang)
    frmCardGrid.cmdPinMailerIssuedToCustomer.Caption = frmCardGridCaption(18, UserLang)
    frmCardGrid.cmdAdminCard.Caption = frmCardGridCaption(19, UserLang)
    frmCardGrid.cmdCardUpdHistory.Caption = frmCardGridCaption(20, UserLang)
    frmCardGrid.lblCustNo.Caption = frmAccountGridCaption(22, UserLang)
    frmCardGrid.lblCustName.Caption = frmAccountGridCaption(23, UserLang)

'    rowTitle(0) = "Card Number"
'    rowTitle(1) = "Name on the Card"
'    rowTitle(2) = "Issue Date"
'    rowTitle(3) = "Expiry Date"
'    rowTitle(4) = "Card Status"
'    rowTitle(5) = "Request Status"
'    rowTitle(6) = "Pin-Mailer Status"
'    rowTitle(7) = "BM Acc.No"

    txtCustNo = recvCardSearchMsg.custNo
    
    If UserLang = ARABIC Then
       If Len(RTrim(recvCardSearchMsg.aShortName)) <> 0 Then
          txtCustName = recvCardSearchMsg.aShortName
       Else
          txtCustName = recvCardSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvCardSearchMsg.eShortName)) <> 0 Then
          txtCustName = recvCardSearchMsg.eShortName
       Else
          txtCustName = recvCardSearchMsg.aShortName
       End If
    End If
    
    cardGrid.Clear
    cardGrid.Row = 0
    cardGrid.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 7
      cardGrid.Col = i
      If UserLang = ARABIC Then
         cardGrid.CellAlignment = flexAlignRightCenter
      Else
         cardGrid.CellAlignment = flexAlignLeftCenter
      End If
      cardGrid.text = frmCardGridCaption(i + 2, UserLang)
      cardGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i

    'cardGrid.Width = tWidth + 100
    For i = 1 To Val(recvCardSearchMsg.noOfRecs)
      cardGrid.Row = i
      cardGrid.Col = 0
      cardGrid.CellAlignment = flexAlignLeftCenter
      'cardGrid.text = recvCardSearchMsg.details(i).cardNo
      If recvLoginMsg.callCentreBranch = "1" Then
         cardGrid.text = recvCardSearchMsg.details(i).cardNo
      Else
         cardGrid.text = maskCardNo(recvCardSearchMsg.details(i).cardNo)
      End If
      cardGrid.Col = 1
      cardGrid.CellAlignment = flexAlignLeftCenter
      cardGrid.text = recvCardSearchMsg.details(i).nameOnTheCard
      cardGrid.Col = 2
      cardGrid.CellAlignment = flexAlignLeftCenter
      tmpStr = recvCardSearchMsg.details(i).issueDate
      cardGrid.text = Mid$(tmpStr, 7, 2) & "/" & Mid$(tmpStr, 5, 2) & "/" & Mid$(tmpStr, 1, 4)
      cardGrid.Col = 3
      cardGrid.CellAlignment = flexAlignLeftCenter
      tmpStr = recvCardSearchMsg.details(i).expiryDate
      cardGrid.text = Mid$(tmpStr, 7, 2) & "/" & Mid$(tmpStr, 5, 2) & "/" & Mid$(tmpStr, 1, 4)
      cardGrid.Col = 4
      cardGrid.CellAlignment = flexAlignLeftCenter
      tCode = recvCardSearchMsg.details(i).cardStatus
      mQry = "select arabicname, englishname from cardstatusinfo " & _
            "where cardstatus = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            tmpStr = rs(0)
         Else
            tmpStr = rs(1)
         End If
      Else
         tmpStr = "Invalid Status    " & tCode
      End If
      cardGrid.text = tmpStr
      cardGrid.Col = 5
      cardGrid.CellAlignment = flexAlignLeftCenter
      tCode = recvCardSearchMsg.details(i).requestStatus
      mQry = "select arabicname, englishname from requeststatusinfo " & _
             "where requeststatus = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            tmpStr = rs(0)
         Else
            tmpStr = rs(1)
         End If
      Else
         tmpStr = "Invalid Status   " & tCode
      End If
      cardGrid.text = tmpStr
      cardGrid.Col = 6
      cardGrid.CellAlignment = flexAlignLeftCenter
      tCode = recvCardSearchMsg.details(i).pinRequestStatus
      mQry = "select arabicname, englishname from pinrequeststatusinfo " & _
             "where pinrequeststatus = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            tmpStr = rs(0)
         Else
            tmpStr = rs(1)
         End If
      Else
         tmpStr = "Invalid Status   " & tCode
      End If
      cardGrid.text = tmpStr
      cardGrid.Col = 7
      cardGrid.CellAlignment = flexAlignLeftCenter
      cardGrid.text = recvCardSearchMsg.details(i).bmAccNo
   Next i

   cardGrid.Row = 1
   tCustNo = Format(recvCardSearchMsg.custNo, "!@@@@@@@@")

   If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
      If recvCardSearchMsg.noOfRecs = "00" Then
         cmdUpdate.Enabled = False
      Else
         cmdUpdate.Enabled = True
      End If
      cmdNewCard.Enabled = True
      If Len(RTrim(tCustNo)) <> 0 Then
         If Val(tCustNo) < 600 Then
            cmdAdminCard.Enabled = True
            cmdNewCard.Enabled = False
         Else
            cmdAdminCard.Enabled = False
            cmdNewCard.Enabled = True
         End If
      End If
   ElseIf InStr(recvLoginMsg.authorityLevel, "~45") > 0 Then
      cmdUpdate.Enabled = True
      cmdNewCard.Enabled = False
      frmCardGrid.cmdCardRecdByBranch.Enabled = False
      frmCardGrid.cmdCardIssuedToCust.Enabled = False
      frmCardGrid.cmdPinMailerIssuedToCustomer.Enabled = False
      frmCardGrid.cmdPinMailerRecdByBranch.Enabled = False
   ElseIf InStr(recvLoginMsg.authorityLevel, "~42") > 0 Then
      cmdUpdate.Enabled = False
      cmdNewCard.Enabled = False
      frmCardGrid.cmdCardRecdByBranch.Enabled = True
      frmCardGrid.cmdCardIssuedToCust.Enabled = True
      frmCardGrid.cmdPinMailerIssuedToCustomer.Enabled = True
      frmCardGrid.cmdPinMailerRecdByBranch.Enabled = True
   Else
      cmdUpdate.Enabled = False
      cmdNewCard.Enabled = False
      frmCardGrid.cmdCardRecdByBranch.Enabled = False
      frmCardGrid.cmdCardIssuedToCust.Enabled = False
      frmCardGrid.cmdPinMailerIssuedToCustomer.Enabled = False
      frmCardGrid.cmdPinMailerRecdByBranch.Enabled = False
   End If
   frmCardGrid.Show
   
End Sub

Public Function readStatusList(lastRecCount As String, cardOrPin As String, requestStatus As String) As String
   Dim strmsglen As String
   Dim tUserid As String
   
   LogData "ReadStatusList() Module Entered"
   LogData "-------------------------------"
   LogData "Last Rec count  " & lastRecCount
   LogData "Card or Pin     " & cardOrPin
   LogData "Request Status  " & requestStatus
   
   tUserid = Format(gUserId, "!@@@@@@@@@@")
      
   SendMsg = "000090" & "26" & gBranchCode & tUserid & lastRecCount & requestStatus & cardOrPin
   
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmCardGrid.MousePointer = vbHourglass
   frmCardGrid.cmdCardRecdByBranch.Enabled = False
   frmCardGrid.cmdCardIssuedToCust.Enabled = False
   frmCardGrid.cmdAdminCard.Enabled = False
   frmCardGrid.cmdUpdate.Enabled = False
   frmCardGrid.cmdPinMailerIssuedToCustomer.Enabled = False
   frmCardGrid.cmdPinMailerRecdByBranch.Enabled = False
   frmCardGrid.cmdEnquiry.Enabled = False
   frmCardGrid.cmdNewCard.Enabled = False
     
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmCardGrid.MousePointer = vbDefault
      frmCardGrid.cmdCardRecdByBranch.Enabled = True
      frmCardGrid.cmdCardIssuedToCust.Enabled = True
      frmCardGrid.cmdPinMailerIssuedToCustomer.Enabled = True
      frmCardGrid.cmdPinMailerRecdByBranch.Enabled = True
      frmCardGrid.cmdEnquiry.Enabled = True
      If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
         frmCardGrid.cmdNewCard.Enabled = True
         If recvCardSearchMsg.noOfRecs = "00" Then
            frmCardGrid.cmdUpdate.Enabled = False
         Else
            frmCardGrid.cmdUpdate.Enabled = True
         End If
      Else
         frmCardGrid.cmdNewCard.Enabled = False
         frmCardGrid.cmdUpdate.Enabled = False
      End If
      Exit Function
   End If
   
   frmCardGrid.MousePointer = vbDefault
   frmCardGrid.cmdCardRecdByBranch.Enabled = True
   frmCardGrid.cmdCardIssuedToCust.Enabled = True
   frmCardGrid.cmdPinMailerIssuedToCustomer.Enabled = True
   frmCardGrid.cmdPinMailerRecdByBranch.Enabled = True
   frmCardGrid.cmdEnquiry.Enabled = True
   If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
      frmCardGrid.cmdNewCard.Enabled = True
      If recvCardSearchMsg.noOfRecs = "00" Then
         frmCardGrid.cmdUpdate.Enabled = False
      Else
         frmCardGrid.cmdUpdate.Enabled = True
      End If
   Else
      frmCardGrid.cmdNewCard.Enabled = False
      frmCardGrid.cmdUpdate.Enabled = False
   End If
      
   parseStatusListMsg
   
   If recvStatusListMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvStatusListMsg.aRemarks
      Else
         MsgBox recvStatusListMsg.eRemarks
      End If
      readStatusList = "-0001"
      Exit Function
   End If
   
   readStatusList = recvStatusListMsg.lastRecCount
   
End Function

Public Sub parseStatusListMsg()
 Dim i, pos As Integer
     
 recvStatusListMsg.status = Mid$(RecvStr, 1, 3)
 recvStatusListMsg.service = Mid$(RecvStr, 4, 2)
 recvStatusListMsg.aRemarks = Mid$(RecvStr, 6, 50)
 recvStatusListMsg.eRemarks = Mid$(RecvStr, 56, 50)
 recvStatusListMsg.lastRecCount = Mid$(RecvStr, 106, 5)
 recvStatusListMsg.noOfRecs = Mid$(RecvStr, 111, 2)
 recvStatusListMsg.filler = Mid$(RecvStr, 113, 10)
 pos = 123
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

Public Sub getCardDetails()
    Dim tCardNo As String * 19
    Dim strmsglen As String
    Dim tCode As String
    Dim tmpStr As String
    
    tCardNo = Format(recvCardSearchMsg.details(cardGrid.Row).cardNo, "!@@@@@@@@@@@@@@@@@@@")
    'cardGrid.Col = 0
    'tCardNo = Format(cardGrid.text, "!@@@@@@@@@@@@@@@@@@@")
       
    cardGrid.Col = 5
    tmpStr = Trim(cardGrid.text)
    LogData "Card Number  :  " & maskCardNo(tCardNo)
    LogData "value of 5th column in the selected row   : " & tmpStr
    If cardUpdateAction Then
       If UCase(Mid$(tmpStr, 1, 7)) = "PENDING" Then
          MsgBox errPendingStatus(UserLang)  '"This Record cannot be modified since it is in pending status "
          Exit Sub
       End If
    End If
     
    If Len(RTrim(tCardNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    SendMsg = "000048" & "25" & gBranchCode & "02" & Space(24) & tCardNo & Space(50)
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardGrid.MousePointer = vbHourglass
    frmCardGrid.cmdAdminCard.Enabled = False
    frmCardGrid.cmdNewCard.Enabled = False
    frmCardGrid.cmdMore.Enabled = False
    frmCardGrid.cmdUpdate.Enabled = False
    frmCardGrid.cmdCancel.Enabled = False
    cmdCardIssuedToCust.Enabled = False
    cmdCardRecdByBranch.Enabled = False
    cmdPinMailerIssuedToCustomer.Enabled = False
    cmdPinMailerRecdByBranch.Enabled = False
    cmdCardUpdHistory.Enabled = False
    cmdEnquiry.Enabled = False
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardGrid.MousePointer = vbDefault
       If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
          If Len(RTrim(tCustNo)) <> 0 Then
             If Val(tCustNo) < 600 Then
                cmdAdminCard.Enabled = True
             Else
                cmdAdminCard.Enabled = False
             End If
          End If
          frmCardGrid.cmdNewCard.Enabled = True
          frmCardGrid.cmdUpdate.Enabled = True
       End If
       If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Or _
          InStr(recvLoginMsg.authorityLevel, "~42") > 0 Then
          cmdCardIssuedToCust.Enabled = True
          cmdCardRecdByBranch.Enabled = True
          cmdPinMailerIssuedToCustomer.Enabled = True
          cmdPinMailerRecdByBranch.Enabled = True
       End If
       frmCardGrid.cmdMore.Enabled = True
       frmCardGrid.cmdCancel.Enabled = True
       cmdCardUpdHistory.Enabled = True
       cmdEnquiry.Enabled = True
       Exit Sub
    End If
    frmCardGrid.MousePointer = vbDefault
    If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
       If Len(RTrim(tCustNo)) <> 0 Then
          If Val(tCustNo) < 600 Then
             cmdAdminCard.Enabled = True
          Else
             cmdAdminCard.Enabled = False
          End If
       End If
       frmCardGrid.cmdNewCard.Enabled = True
       frmCardGrid.cmdUpdate.Enabled = True
    End If
    If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Or _
       InStr(recvLoginMsg.authorityLevel, "~42") > 0 Then
       cmdCardIssuedToCust.Enabled = True
       cmdCardRecdByBranch.Enabled = True
       cmdPinMailerIssuedToCustomer.Enabled = True
       cmdPinMailerRecdByBranch.Enabled = True
    End If
    frmCardGrid.cmdMore.Enabled = True
    frmCardGrid.cmdCancel.Enabled = True
    cmdCardUpdHistory.Enabled = True
    cmdEnquiry.Enabled = True
    
    parseCardPendingDetail
    LogData "Return Status Received from Server : " & recvCardPendingDetail.status
    If recvCardPendingDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCardPendingDetail.aRemarks
       Else
          MsgBox recvCardPendingDetail.eRemarks
       End If
       Unload Me
       Exit Sub
    End If
   
   frmCardDetails.cmdCreate.Enabled = False
   frmCardDetails.cmdApprove.Enabled = False
   frmCardDetails.cmdReject.Enabled = False
   frmCardDetails.cmdHistory.Enabled = True
   frmCardDetails.Show
   fillCardDetailsForm
   If cardUpdateAction And _
      InStr(recvLoginMsg.authorityLevel, "~45") = 0 Then
      If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4" Then
         If recvCardPendingDetail.cardType = "D" Then
            frmCardDetails.cmdForcePIN.Enabled = False
         Else
            frmCardDetails.cmdForcePIN.Enabled = True
         End If
      Else
         frmCardDetails.cmdForcePIN.Enabled = False
      End If
   End If

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
