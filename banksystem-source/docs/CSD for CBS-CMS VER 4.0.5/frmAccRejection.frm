VERSION 5.00
Begin VB.Form frmAccRejection 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account Rejection "
   ClientHeight    =   3195
   ClientLeft      =   2460
   ClientTop       =   2010
   ClientWidth     =   8430
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleMode       =   0  'User
   ScaleWidth      =   8430
   Begin VB.TextBox txtSuperVisorComments 
      Height          =   495
      Left            =   1920
      TabIndex        =   3
      Text            =   " "
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
Attribute VB_Name = "frmAccRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdForward_Click()
    reject ("F")
End Sub

Private Sub cmdReject_Click()
   reject ("R")
End Sub

Private Sub reject(actionFlag As String)
   Dim tuserId As String
   Dim tDateTime As String
   Dim tBranchCode As String
   Dim tSupervisorId As String, tComments As String
   Dim tCustNo As String
   Dim strmsglen As String
   
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
    
   SendMsg = "000268" & "34" & gBranchCode & actionFlag & tuserId & tDateTime & _
             tSupervisorId & tComments & recvAccPendingDetail.newOrUpdate & Space(50)

   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmAccRejection.MousePointer = vbHourglass
   cmdForward.Enabled = False
   cmdReject.Enabled = False
   cmdCancel.Enabled = False
   
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmAccRejection.MousePointer = vbNormal
      cmdForward.Enabled = True
      cmdReject.Enabled = True
      cmdCancel.Enabled = True
      Exit Sub
   End If
   
   frmAccRejection.MousePointer = vbNormal
   cmdForward.Enabled = True
   cmdReject.Enabled = True
   cmdCancel.Enabled = True
   
   If recvAccApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvAccApprovalMsg.aRemarks
      Else
         MsgBox recvAccApprovalMsg.eRemarks
      End If
   End If
   
   If Len(Trim(frmAcctPendingList.txtCustomerNo)) = 0 Then
      tCustNo = Space(7)
   Else
      tCustNo = Format(frmAcctPendingList.txtCustomerNo, "0000000")
   End If
   
   Unload Me
   Unload frmAccount
   Unload frmJuristicSignatory
   Unload frmAcctPendingList
   frmEnquiry.readAccPendingList "00000", "S", tCustNo
   If UserLang = ARABIC Then
      ChangePositions frmAcctPendingList, 12000
      frmAcctPendingList.RightToLeft = True
   End If
   frmAcctPendingList.Show

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmAccRejection, 8550
       frmAccRejection.RightToLeft = True
    End If
    
    frmAccRejection.Caption = frmAccRejectionCaption(0, UserLang)
    frmAccRejection.lblComments.Caption = frmAccRejectionCaption(1, UserLang)
    frmAccRejection.cmdReject.Caption = frmAccRejectionCaption(2, UserLang)
    frmAccRejection.cmdForward.Caption = frmAccRejectionCaption(3, UserLang)
    frmAccRejection.cmdCancel.Caption = frmAccRejectionCaption(4, UserLang)
    
    If recvAccPendingDetail.domantActivationUpd = "1" Then
       cmdForward.Enabled = False
    Else
       cmdForward.Enabled = True
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtSuperVisorComments_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
