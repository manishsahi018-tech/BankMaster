VERSION 5.00
Begin VB.Form frmTpinRejection 
   BackColor       =   &H00BFD87E&
   Caption         =   "Tpin Rejection "
   ClientHeight    =   3195
   ClientLeft      =   2460
   ClientTop       =   2010
   ClientWidth     =   8430
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleMode       =   0  'User
   ScaleWidth      =   8430
   Begin VB.TextBox txtSuperVisorComments 
      Height          =   495
      Left            =   1920
      TabIndex        =   2
      Text            =   " "
      Top             =   1200
      Width           =   5415
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   4320
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   2280
      Width           =   1455
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   495
      Left            =   2760
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
      TabIndex        =   3
      Top             =   1200
      Width           =   1695
   End
End
Attribute VB_Name = "frmTpinRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdReject_Click()
   Dim tComments As String
   If Len(Trim(frmTpinRejection.txtSupervisorComments)) = 0 Then
      MsgBox errSpaceComments(UserLang)    ' "Comments should be entered...Please enter it.."
      Exit Sub
      tComments = Space(200)
   Else
      tComments = Format(frmTpinRejection.txtSupervisorComments, "!" + String(200, "@"))
   End If
   frmAcceptTPin.supervisorDecision "R", tComments
End Sub

Private Sub reject(actionFlag As String)
   Dim tuserId, tDateTime, tBranchCode, tSupervisorId, tComments As String
   
   frmAcctPendingList.accPendingGrid.Col = 0
   tuserId = Format(frmAcctPendingList.accPendingGrid.text, "!@@@@@@@@@@")
   frmAcctPendingList.accPendingGrid.Col = 1
   tDateTime = Format(frmAcctPendingList.accPendingGrid.text, "00000000000000")
   tBranchCode = gBranchCode
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   
   If Len(Trim(frmAccRejection.txtSupervisorComments)) = 0 Then
      tComments = Space(200)
   Else
      tComments = Format(frmAccRejection.txtSupervisorComments, "!" + String(200, "@"))
   End If
    
   SendMsg = "000268" + "34" + gBranchCode + actionFlag + tuserId + tDateTime + _
             tSupervisorId + tComments + recvAccPendingDetail.newOrUpdate

   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   ' mouse pointer has to be changed
   ' command button has to be disabled - Rajesh

   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      Exit Sub
   End If
   
   ' Rajesh
   
   If recvAccApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvAccApprovalMsg.aRemarks
      Else
         MsgBox recvAccApprovalMsg.eRemarks
      End If
   End If
   
   Unload Me
   Unload frmAccount
   Unload frmAcctPendingList
   frmEnquiry.readAccPendingList "00000", "S", tCustNo
   frmAcctPendingList.Show

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmTpinRejection, 8550
       frmTpinRejection.RightToLeft = True
    End If
    
    frmTpinRejection.Caption = frmTpinRejectionCaption(0, UserLang)
    frmTpinRejection.lblComments.Caption = frmTpinRejectionCaption(1, UserLang)
    frmTpinRejection.cmdReject.Caption = frmTpinRejectionCaption(2, UserLang)
    frmTpinRejection.cmdCancel.Caption = frmTpinRejectionCaption(3, UserLang)
 
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtSuperVisorComments_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
