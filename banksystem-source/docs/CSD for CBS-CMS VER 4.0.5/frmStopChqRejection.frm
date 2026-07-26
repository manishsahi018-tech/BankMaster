VERSION 5.00
Begin VB.Form frmStopChqRejection 
   BackColor       =   &H00BFD87E&
   Caption         =   "Stop Cheque Rejection "
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
   ScaleWidth      =   8460
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
Attribute VB_Name = "frmStopChqRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdForward_Click()
    stopChqReject ("F")
End Sub

Private Sub cmdReject_Click()
   stopChqReject ("R")
End Sub

Private Sub stopChqReject(actionFlag As String)
   Dim tuserId As String, tDateTime As String, tBranchCode As String, tSupervisorId As String
   Dim tCustNo As String
   
   frmStopChqPendingList.stopChqPendingGrid.Col = 0
   tuserId = Format(frmStopChqPendingList.stopChqPendingGrid.text, "!@@@@@@@@@@")
   frmStopChqPendingList.stopChqPendingGrid.Col = 1
   tDateTime = Format(frmStopChqPendingList.stopChqPendingGrid.text, "00000000000000")
      
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   
   If Len(Trim(txtSupervisorComments)) = 0 Then
      tComments = Space(200)
   Else
      tComments = Format(txtSupervisorComments, "!" & String(200, "@"))
   End If
       
   SendMsg = "000268" & "54" & gBranchCode & actionFlag & tuserId & tDateTime & _
             frmStopChqDetails.txtAcctNo & _
             tSupervisorId & tComments & recvStopChqDetail.newOrUpdate & Space(50)
    
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
   
   If recvStopChqApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvStopChqApprovalMsg.aRemarks
      Else
         MsgBox recvStopChqApprovalMsg.eRemarks
      End If
   End If
   If Len(Trim(frmStopChqPendingList.txtCustomerNo)) = 0 Then
      tCustNo = Space(7)
   Else
      tCustNo = Format(frmStopChqPendingList.txtCustomerNo, "0000000")
   End If
   Unload Me
   Unload frmStopChqDetails
   Unload frmStopChqPendingList
   frmEnquiry.readStopChqPendingList "00000", "S", tCustNo
   If UserLang = ARABIC Then
      ChangePositions frmStopChqPendingList, 11800
      frmStopChqPendingList.RightToLeft = True
   End If
   frmStopChqPendingList.Show

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmStopChqRejection, 8550
       frmStopChqRejection.RightToLeft = True
    End If
    
    frmStopChqRejection.Caption = frmStopChqRejectionCaption(0, UserLang)
    frmStopChqRejection.lblComments.Caption = frmStopChqRejectionCaption(1, UserLang)
    frmStopChqRejection.cmdReject.Caption = frmStopChqRejectionCaption(2, UserLang)
    frmStopChqRejection.cmdForward.Caption = frmStopChqRejectionCaption(3, UserLang)
    frmStopChqRejection.cmdCancel.Caption = frmStopChqRejectionCaption(4, UserLang)
    
    If recvStopChqDetail.newOrUpdate = "U" Then
       cmdForward.Enabled = False
    Else
       cmdForward.Enabled = True
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

