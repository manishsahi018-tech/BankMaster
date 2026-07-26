VERSION 5.00
Begin VB.Form frmStdOrdRejection 
   BackColor       =   &H00BFD87E&
   Caption         =   "Standing Order Rejection "
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
Attribute VB_Name = "frmStdOrdRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdForward_Click()
    stdOrdReject ("F")
End Sub

Private Sub cmdReject_Click()
   stdOrdReject ("R")
End Sub

Private Sub stdOrdReject(actionFlag As String)
   Dim tuserId, tDateTime, tBranchCode, tSupervisorId As String
   Dim tComments As String
   
   frmStdOrdPendingList.stdOrdPendingGrid.Col = 0
   tuserId = Format(frmStdOrdPendingList.stdOrdPendingGrid.text, "!@@@@@@@@@@")
   frmStdOrdPendingList.stdOrdPendingGrid.Col = 1
   tDateTime = Format(frmStdOrdPendingList.stdOrdPendingGrid.text, "00000000000000")
      
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   
   If Len(Trim(txtSuperVisorComments)) = 0 Then
      tComments = Space(200)
   Else
      tComments = Format(txtSuperVisorComments, "!" + String(200, "@"))
   End If
    
   SendMsg = "000268" & "52" & gBranchCode & actionFlag & tuserId & tDateTime & _
             frmStandingOrderDetail.txtAcctNo & frmStandingOrderDetail.txtSoNo & _
             tSupervisorId & tComments & recvStdOrdDetail.newOrUpdate & Space(50)
    
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
   
   If recvStdOrdApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvStdOrdApprovalMsg.aRemarks
      Else
         MsgBox recvStdOrdApprovalMsg.eRemarks
      End If
   End If
   
   If Len(Trim(frmStdOrdPendingList.txtCustomerNo)) = 0 Then
      tCustNo = Space(7)
   Else
      tCustNo = Format(frmStdOrdPendingList.txtCustomerNo, "0000000")
   End If
   
   Unload Me
   Unload frmStandingOrderDetail
   Unload frmStdOrdPendingList
   frmEnquiry.readSodPendingList "00000", "S", tCustNo
   If UserLang = ARABIC Then
      ChangePositions frmStdOrdPendingList, 11800
      frmStdOrdPendingList.RightToLeft = True
   End If
   frmStdOrdPendingList.Show

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmStdOrdRejection, 8550
       frmStdOrdRejection.RightToLeft = True
    End If
    
    frmStdOrdRejection.Caption = frmStdOrdRejectionCaption(0, UserLang)
    frmStdOrdRejection.lblComments = frmStdOrdRejectionCaption(1, UserLang)
    frmStdOrdRejection.cmdReject.Caption = frmStdOrdRejectionCaption(2, UserLang)
    frmStdOrdRejection.cmdForward.Caption = frmStdOrdRejectionCaption(3, UserLang)
    frmStdOrdRejection.cmdCancel.Caption = frmStdOrdRejectionCaption(4, UserLang)
    
    If recvStdOrdDetail.newOrUpdate = "U" Then
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
