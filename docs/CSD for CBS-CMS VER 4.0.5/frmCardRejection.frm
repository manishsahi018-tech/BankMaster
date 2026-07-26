VERSION 5.00
Begin VB.Form frmCardRejection 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card Rejection "
   ClientHeight    =   3195
   ClientLeft      =   1350
   ClientTop       =   2910
   ClientWidth     =   8430
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleMode       =   0  'User
   ScaleWidth      =   8460
   Begin VB.TextBox txtSuperVisorComments 
      Height          =   495
      Left            =   1920
      TabIndex        =   3
      Text            =   "  "
      Top             =   1200
      Width           =   5415
   End
   Begin VB.CommandButton cmdForward 
      Caption         =   "Forward to CSO"
      Height          =   495
      Left            =   3480
      TabIndex        =   1
      ToolTipText     =   "Forward to CSO"
      Top             =   2280
      Width           =   2295
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5760
      TabIndex        =   2
      ToolTipText     =   "Cancel"
      Top             =   2280
      Width           =   1455
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   495
      Left            =   1920
      TabIndex        =   0
      ToolTipText     =   "Reject"
      Top             =   2280
      Width           =   1575
   End
   Begin VB.Label lblComments 
      BackColor       =   &H00BFD87E&
      Caption         =   "Comments"
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
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   1695
   End
End
Attribute VB_Name = "frmCardRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdCancel_Click()
  Unload Me
'  frmCardDetails.Show
  frmCardDetails.cmdApprove.Enabled = True
  frmCardDetails.cmdReject.Enabled = True
End Sub

Private Sub cmdForward_Click()
  rejectCard ("F")
End Sub

Private Sub cmdReject_Click()
   rejectCard ("R")
End Sub

Private Sub rejectCard(actionType As String)
   Dim tUserid As String
   Dim tDateTime As String
   Dim tBranchCode As String
   Dim tSupervisorId As String
   Dim tComments As String
   Dim tCardNo As String
   Dim strmsglen As String
   Dim tCustNo As String
   
   frmCardPendingList.cardPendingGrid.Col = 0
   tUserid = Format(frmCardPendingList.cardPendingGrid.text, "!@@@@@@@@@@")
   frmCardPendingList.cardPendingGrid.Col = 1
   tDateTime = Format(frmCardPendingList.cardPendingGrid.text, "00000000000000")
   frmCardPendingList.cardPendingGrid.Col = 2
   'tCardNo = Format(frmCardPendingList.cardPendingGrid.text, "!@@@@@@@@@@@@@@@@@@@")
   tCardNo = Format(recvCardPendingList.details(frmCardPendingList.cardPendingGrid.Row).cardNo, "!@@@@@@@@@@@@@@@@@@@")
   tBranchCode = gBranchCode
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   If Len(Trim(frmCardRejection.txtSuperVisorComments)) = 0 Then
      tComments = Space(200)
   Else
      tComments = Format(frmCardRejection.txtSuperVisorComments, "!" + String(200, "@"))
   End If
   
   If actionType = "R" Then
      LogData "Rejected completely for the card no [" & maskCardNo(tCardNo) & "]" & "neworupdate flag [" & recvCardPendingDetail.newOrUpdate & "]"
   Else
      LogData "Forwarded to CSO for the card no [" & maskCardNo(tCardNo) & "]" & "neworupdate flag [" & recvCardPendingDetail.newOrUpdate & "]"
   End If
    
   SendMsg = "000268" & "32" & gBranchCode & actionType & tUserid & tDateTime & _
             tCardNo & tSupervisorId & tComments & recvCardPendingDetail.newOrUpdate & Space(50)
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   
   frmCardRejection.MousePointer = vbHourglass
   frmCardRejection.cmdForward.Enabled = False
   frmCardRejection.cmdReject.Enabled = False
   frmCardRejection.cmdCancel.Enabled = False
   
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmCardRejection.MousePointer = vbDefault
      frmCardRejection.cmdForward.Enabled = True
      frmCardRejection.cmdReject.Enabled = True
      frmCardRejection.cmdCancel.Enabled = True
      Exit Sub
   End If
   
   frmCardRejection.MousePointer = vbDefault
   frmCardRejection.cmdForward.Enabled = True
   frmCardRejection.cmdReject.Enabled = True
   frmCardRejection.cmdCancel.Enabled = True
   
   If recvCardApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvCardApprovalMsg.aRemarks
      Else
         MsgBox recvCardApprovalMsg.eRemarks
      End If
      Exit Sub
   End If
   If Len(Trim(frmCardPendingList.txtCustomerNo)) = 0 Then
      tCustNo = Space(7)
   Else
      tCustNo = Format(frmCardPendingList.txtCustomerNo, "0000000")
   End If
   
   Unload Me
   Unload frmCardDetails
   Unload frmCardPendingList
   frmEnquiry.readCardPendingList "00000", "S", tCustNo
   If UserLang = ARABIC Then
      ChangePositions frmCardPendingList, 11800
      frmCardPendingList.RightToLeft = True
      frmCardPendingList.Hide
   End If
   frmCardPendingList.Show
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  secsUserInactive = 0
  CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   
    If UserLang = ARABIC Then
       ChangePositions frmCardRejection, 7335
       frmCardRejection.RightToLeft = True
    End If
    If recvCardPendingDetail.cardType = "A" Or recvCardPendingDetail.newOrUpdate = "U" Then
       cmdForward.Enabled = False
    Else
       cmdForward.Enabled = True
    End If
       
    frmCardRejection.Caption = frmCardRejectionCaption(0, UserLang)
    frmCardRejection.lblComments = frmCardRejectionCaption(1, UserLang)
    frmCardRejection.cmdReject.Caption = frmCardRejectionCaption(2, UserLang)
    frmCardRejection.cmdForward.Caption = frmCardRejectionCaption(3, UserLang)
    frmCardRejection.cmdCancel.Caption = frmCardRejectionCaption(4, UserLang)
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
  frmCardDetails.cmdApprove.Enabled = True
  frmCardDetails.cmdReject.Enabled = True
End Sub

Private Sub txtSuperVisorComments_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
