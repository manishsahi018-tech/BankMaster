VERSION 5.00
Begin VB.Form frmSupervisorRejection 
   BackColor       =   &H00BFD87E&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Supervisor Rejection"
   ClientHeight    =   3195
   ClientLeft      =   2445
   ClientTop       =   1995
   ClientWidth     =   8460
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   8460
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   495
      Left            =   2040
      TabIndex        =   1
      ToolTipText     =   "Reject "
      Top             =   2160
      Width           =   1575
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5880
      TabIndex        =   3
      ToolTipText     =   "Cancel"
      Top             =   2160
      Width           =   1455
   End
   Begin VB.CommandButton cmdForward 
      Caption         =   "Forward to CSO"
      Height          =   495
      Left            =   3600
      TabIndex        =   2
      ToolTipText     =   "Forward to CSO"
      Top             =   2160
      Width           =   2295
   End
   Begin VB.TextBox txtSuperVisorComments 
      Height          =   615
      Left            =   2040
      TabIndex        =   4
      Text            =   " "
      Top             =   960
      Width           =   5295
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
      Left            =   240
      TabIndex        =   0
      Top             =   1080
      Width           =   1695
   End
End
Attribute VB_Name = "frmSupervisorRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdForward_Click()
   reject ("F")
End Sub

Private Sub cmdReject_Click()
 If activityFlag = "P" And Len(RTrim(branchActionDateTime)) = 0 Then
    branchActionDateTime = getUnixDateTime
    If Trim(branchActionDateTime) = "ERROR" Then
       branchActionDateTime = Space(14)
       Exit Sub
    End If
 End If
 reject ("R")
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   If UserLang = ARABIC Then
      ChangePositions frmSupervisorRejection, 8550
      frmSupervisorRejection.RightToLeft = True
   End If
   
   If tellerAction And activityFlag = "P" Then
      cmdForward.Enabled = False
   End If
   
   frmSupervisorRejection.Caption = frmSupervisorRejectionCaption(0, UserLang)
   frmSupervisorRejection.lblComments.Caption = frmSupervisorRejectionCaption(1, UserLang)
   frmSupervisorRejection.cmdReject.Caption = frmSupervisorRejectionCaption(2, UserLang)
   frmSupervisorRejection.cmdForward.Caption = frmSupervisorRejectionCaption(3, UserLang)
   frmSupervisorRejection.cmdCancel.Caption = frmSupervisorRejectionCaption(4, UserLang)

End Sub

Public Sub reject(forwardOrRejectFlag As String)
   Dim tuserId As String, tSupervisorId As String, tDateTime As String, tBranchCode As String
   Dim tComments As String * 200
   Dim tCustNo As String
   Dim screenNo As String
   Dim branchCSOId As String * 10
   
   Dim NewOrUpdateFlag As String
   
   If Len(Trim(txtSupervisorComments)) = 0 Then
      MsgBox errSpaceComments(UserLang)    ' "Comments should be entered...Please enter it.."
      txtSupervisorComments.SetFocus
      Exit Sub
   End If
   
   frmSupervisorApproval.MSFlexGrid1.Col = 0
   tuserId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
   frmSupervisorApproval.MSFlexGrid1.Col = 1
   tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
   tBranchCode = gBranchCode
      
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   
   If screenSetNo = "2" Then
      screenNo = "2"
      tCustNo = frmIndividualOthers.txtCustomerNo
      NewOrUpdateFlag = recvOtherIndividualMsg.newOrUpdate
   ElseIf screenSetNo = "1" Or screenSetNo = "A" Then
      screenNo = screenSetNo
      tCustNo = frmIndividualSaudi.txtCustomerNo
      NewOrUpdateFlag = recvSaudiIndividualMsg.newOrUpdate
   ElseIf screenSetNo = "3" Then
      screenNo = "3"
      tCustNo = frmJuristicMain.txtCustomerNo
      NewOrUpdateFlag = recvJuristicMsg.newOrUpdate
   ElseIf screenSetNo = "4" Then
      screenNo = "4"
      tCustNo = frmJuristicMain.txtCustomerNo
      NewOrUpdateFlag = recvJuristicMsg.newOrUpdate
   ElseIf screenSetNo = "5" Then
      screenNo = "5"
      tCustNo = frmJuristicDiplomats.txtCustomerNo
      NewOrUpdateFlag = recvJuristicMsg.newOrUpdate
   ElseIf screenSetNo = "6" Then
      screenNo = "6"
      tCustNo = frmJuristicNonResident.txtCustomerNo
      NewOrUpdateFlag = recvJuristicMsg.newOrUpdate
   ElseIf screenSetNo = "7" Then
      screenNo = "7"
      tCustNo = frmQuickCustOpen.txtCustomerNo
      NewOrUpdateFlag = recvQuickCustMsg.newOrUpdate
   ElseIf screenSetNo = "8" Then
      screenNo = "8"
      tCustNo = frmInternalCustOpen.txtCustomerNo
      NewOrUpdateFlag = recvQuickCustMsg.newOrUpdate
   ElseIf screenSetNo = "9" Then  ''Added by Mohit on 12-Dec-2006 under Quick Pension customer opening
      screenNo = "9"
      tCustNo = frmQuickPenCustOpen.txtCustomerNo
      NewOrUpdateFlag = recvQuickCustMsg.newOrUpdate
   Else
      screenNo = "0"
      tCustNo = frmCustomer.txtCustomerNo
      NewOrUpdateFlag = recvSuperActionMsg.newOrUpdate
   End If
    
   tComments = Format(frmSupervisorRejection.txtSupervisorComments, "!" & String(200, "@"))
   
   If tellerAction And activityFlag = "P" Then
      branchCSOId = gUserId
      branchActionDateTime = branchActionDateTime
   Else
      branchCSOId = Space(10)
      branchActionDateTime = Space(14)
   End If
         
   SendMsg = "000268" & "19" & gBranchCode & forwardOrRejectFlag & tBranchCode & tuserId & tDateTime & _
             tSupervisorId & tComments & NewOrUpdateFlag & Space(5) & tCustNo & screenNo & activityFlag & _
             branchCSOId & branchActionDateTime & Space(50)
             
   frmSupervisorRejection.MousePointer = vbHourglass
   frmSupervisorRejection.cmdCancel.Enabled = False
   frmSupervisorRejection.cmdForward.Enabled = False
   frmSupervisorRejection.cmdReject.Enabled = False
  
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmSupervisorRejection.MousePointer = vbDefault
      frmSupervisorRejection.cmdCancel.Enabled = True
      frmSupervisorRejection.cmdForward.Enabled = True
      frmSupervisorRejection.cmdReject.Enabled = True
      Exit Sub
   End If
   frmSupervisorRejection.MousePointer = vbDefault
   frmSupervisorRejection.cmdCancel.Enabled = True
   frmSupervisorRejection.cmdForward.Enabled = True
   frmSupervisorRejection.cmdReject.Enabled = True
   If recvSuperDecisionMsg.status = "000" Then
      MsgBox errSuccessful(UserLang) '"Transaction successfully completed..."
   Else
      If UserLang = ARABIC Then
         MsgBox recvSuperDecisionMsg.aRemarks
      Else
         MsgBox recvSuperDecisionMsg.eRemarks
      End If
   End If
   
   Unload Me
   If screenSetNo = "2" Then
      Unload frmIndividualJoint
      Unload frmIndividualOthersAcctInfo
      Unload frmIndividualOthers2
      Unload frmIndividualSaudi2
      Unload frmIndividualOthers
   ElseIf screenSetNo = "1" Or screenSetNo = "A" Then
      Unload frmIndividualJoint
      Unload frmIndividualSaudiAcctInfo
      Unload frmIndividualHeirs
      Unload frmIndividualSaudi2
      Unload frmIndividualSaudi
   ElseIf screenSetNo = "3" Or screenSetNo = "4" Then
      Unload frmJuristicAccountInfo
      Unload frmJuristicMain
      Unload frmJuristicSignatory
      Unload frmJuristicOwner
   ElseIf screenSetNo = "5" Then
      Unload frmJuristicAccountInfo
      Unload frmJuristicDiplomats
      Unload frmJuristicSignatory
      Unload frmJuristicOwner
   ElseIf screenSetNo = "6" Then
      Unload frmJuristicAccountInfo
      Unload frmJuristicNonResident
      Unload frmJuristicSignatory
      Unload frmJuristicOwner
   ElseIf screenSetNo = "7" Then
      Unload frmQuickCustOpen
   ElseIf screenSetNo = "9" Then  ''Added by Mohit on 12-Dec-2006 under Quick Pension customer opening
      Unload frmQuickPenCustOpen
   Else
      Unload frmCustomer2
      Unload frmCustomer
   End If
   If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
      tCustNo = Space(7)
   Else
      tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
   End If
   Unload frmSupervisorApproval
   If tellerAction And activityFlag = "P" Then
      frmEnquiry.readPendingList "00000", "P", tCustNo
   Else
      frmEnquiry.readPendingList "00000", "S", tCustNo
   End If
   If UserLang = ARABIC Then
      ChangePositions frmSupervisorApproval, 11800
      frmSupervisorApproval.RightToLeft = True
      frmSupervisorApproval.Hide
   End If
   frmSupervisorApproval.Show
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtSuperVisorComments_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
