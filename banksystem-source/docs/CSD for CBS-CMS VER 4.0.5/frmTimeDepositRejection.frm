VERSION 5.00
Begin VB.Form frmTimeDepositRejection 
   BackColor       =   &H00BFD87E&
   Caption         =   "Time Deposit Rejection "
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
   Begin VB.TextBox txtSupervisorComments 
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
Attribute VB_Name = "frmTimeDepositRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdForward_Click()
    timeDepositReject ("F")
End Sub

Private Sub cmdReject_Click()
   timeDepositReject ("R")
End Sub

Private Sub timeDepositReject(actionFlag As String)
   Dim tuserId As String, tDateTime As String, tBranchCode As String, tSupervisorId As String
   Dim tComments As String
   Dim tCustNo As String
   
   frmTimeDepositPendingList.tdPendingGrid.Col = 0
   tuserId = Format(frmTimeDepositPendingList.tdPendingGrid.text, "!@@@@@@@@@@")
   frmTimeDepositPendingList.tdPendingGrid.Col = 1
   tDateTime = Format(frmTimeDepositPendingList.tdPendingGrid.text, "00000000000000")
      
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   
   If Len(Trim(txtSupervisorComments)) = 0 Then
      tComments = Space(200)
   Else
      tComments = Format(txtSupervisorComments, "!" + String(200, "@"))
   End If
   
   SendMsg = "000268" & "AK" & gBranchCode & actionFlag & tuserId & tDateTime & _
             Space(14) & frmTimeDepositOpen.txtCustNo & _
             tSupervisorId & tComments & recvTimeDepositDetailMsg.newOrUpdate & Space(50)
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmTimeDepositRejection.MousePointer = vbHourglass
   frmTimeDepositRejection.cmdCancel.Enabled = False
   frmTimeDepositRejection.cmdForward.Enabled = False
   frmTimeDepositRejection.cmdReject.Enabled = False

   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmTimeDepositRejection.MousePointer = vbNormal
      frmTimeDepositRejection.cmdCancel.Enabled = True
      If recvTimeDepositDetailMsg.newOrUpdate = "N" Then
         frmTimeDepositRejection.cmdForward.Enabled = True
      Else
         frmTimeDepositRejection.cmdForward.Enabled = False
      End If
      frmTimeDepositRejection.cmdReject.Enabled = True
      Exit Sub
   End If
   frmTimeDepositRejection.MousePointer = vbNormal
   frmTimeDepositRejection.cmdCancel.Enabled = True
   If recvTimeDepositDetailMsg.newOrUpdate = "N" Then
      frmTimeDepositRejection.cmdForward.Enabled = True
   Else
      frmTimeDepositRejection.cmdForward.Enabled = False
   End If
   frmTimeDepositRejection.cmdReject.Enabled = True
   frmTimeDepositOpen.parseTimeDepositApprovalMsg
   
   If recvTimeDepositApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvTimeDepositApprovalMsg.aRemarks
      Else
         MsgBox recvTimeDepositApprovalMsg.eRemarks
      End If
   End If
   If Len(Trim(frmTimeDepositPendingList.txtCustomerNo)) = 0 Then
      tCustNo = Space(7)
   Else
      tCustNo = Format(frmTimeDepositPendingList.txtCustomerNo, "0000000")
   End If
   
   Unload Me
   Unload frmTimeDepositOpen
   Unload frmTimeDepositPendingList
   frmEnquiry.readTimeDepositPendingList "00000", "S", tCustNo
   If UserLang = ARABIC Then
      ChangePositions frmTimeDepositPendingList, 11800
      frmTimeDepositPendingList.RightToLeft = True
   End If
   frmTimeDepositPendingList.Show

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmTimeDepositRejection, 8550
       frmTimeDepositRejection.RightToLeft = True
    End If
    
    frmTimeDepositRejection.Caption = frmTimeDepositRejectionCaption(0, UserLang)
    frmTimeDepositRejection.lblComments = frmTimeDepositRejectionCaption(1, UserLang)
    frmTimeDepositRejection.cmdReject.Caption = frmTimeDepositRejectionCaption(2, UserLang)
    frmTimeDepositRejection.cmdForward.Caption = frmTimeDepositRejectionCaption(3, UserLang)
    frmTimeDepositRejection.cmdCancel.Caption = frmTimeDepositRejectionCaption(4, UserLang)
    
    If recvTimeDepositDetailMsg.newOrUpdate = "U" Then
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
