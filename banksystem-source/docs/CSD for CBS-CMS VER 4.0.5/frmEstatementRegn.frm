VERSION 5.00
Begin VB.Form frmEstmtRegn 
   BackColor       =   &H00BFD87E&
   Caption         =   "E-Statement Registration"
   ClientHeight    =   3690
   ClientLeft      =   840
   ClientTop       =   1530
   ClientWidth     =   9945
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3690
   ScaleWidth      =   9945
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor comments"
      Height          =   375
      Left            =   1545
      TabIndex        =   16
      ToolTipText     =   "Supervisor Comments"
      Top             =   3075
      Width           =   2175
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update"
      Default         =   -1  'True
      Height          =   375
      Left            =   3720
      TabIndex        =   15
      ToolTipText     =   "Create"
      Top             =   3075
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Exit"
      Height          =   375
      Left            =   7005
      TabIndex        =   14
      ToolTipText     =   "Cancel"
      Top             =   3060
      Width           =   1095
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "&Reject"
      Height          =   375
      Left            =   5910
      TabIndex        =   13
      ToolTipText     =   "Reject"
      Top             =   3075
      Width           =   1095
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "&Approve"
      Height          =   375
      Left            =   4815
      TabIndex        =   12
      ToolTipText     =   "Approve"
      Top             =   3075
      Width           =   1095
   End
   Begin VB.Frame frameStmtDelivery 
      BackColor       =   &H00BFD87E&
      Height          =   480
      Left            =   2040
      TabIndex        =   8
      Top             =   2085
      Width           =   2445
      Begin VB.OptionButton optDisabled 
         BackColor       =   &H00BFD87E&
         Caption         =   "Disabled"
         Height          =   195
         Left            =   135
         TabIndex        =   10
         Tag             =   "2445"
         ToolTipText     =   "Married"
         Top             =   180
         Value           =   -1  'True
         Width           =   975
      End
      Begin VB.OptionButton optEnabled 
         BackColor       =   &H00BFD87E&
         Caption         =   "Enabled"
         Height          =   210
         Left            =   1335
         TabIndex        =   9
         TabStop         =   0   'False
         Tag             =   "2445"
         ToolTipText     =   "Single"
         Top             =   180
         Width           =   975
      End
   End
   Begin VB.TextBox txtEmailAddr 
      Enabled         =   0   'False
      Height          =   345
      Left            =   2025
      MaxLength       =   48
      TabIndex        =   6
      Top             =   1455
      Width           =   3450
   End
   Begin VB.TextBox txtCustNo 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2010
      MaxLength       =   7
      TabIndex        =   4
      Top             =   300
      Width           =   1575
   End
   Begin VB.ComboBox cmbBranchCode 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2010
      TabIndex        =   2
      Top             =   900
      Width           =   2535
   End
   Begin VB.TextBox txtCustName 
      Enabled         =   0   'False
      Height          =   345
      Left            =   5955
      MaxLength       =   48
      TabIndex        =   0
      Top             =   270
      Width           =   3450
   End
   Begin VB.Label lblHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "History"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   300
      TabIndex        =   17
      Top             =   3105
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblStmtDelivery 
      BackColor       =   &H00BFD87E&
      Caption         =   "e-Statement Registration"
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
      Height          =   510
      Left            =   105
      TabIndex        =   11
      Top             =   2130
      Width           =   1815
   End
   Begin VB.Label lblEmailAddress 
      BackColor       =   &H00BFD87E&
      Caption         =   "Email address"
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
      Left            =   120
      TabIndex        =   7
      Top             =   1500
      Width           =   1770
   End
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer No"
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
      Left            =   270
      TabIndex        =   5
      Top             =   345
      Width           =   1455
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code"
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
      Left            =   240
      TabIndex        =   3
      Top             =   930
      Width           =   1575
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name"
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
      Left            =   3930
      TabIndex        =   1
      Top             =   345
      Width           =   1770
   End
End
Attribute VB_Name = "frmEstmtRegn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim firstName As String
Dim secondName As String
Dim lastName As String
Private Sub cmdCancel_Click()
    Unload Me
End Sub
Private Sub cmdSupervisorComments_Click()
    MsgBox recvEstmtStatusMsg.supervisorComments
End Sub
Private Sub cmdUpdate_Click()
    Dim strmsglen As String
    Dim dateTime As String
    Dim tCustNo As String
    Dim creationOrUpdate As String
    Dim emailAddress As String * 30
    Dim stmtDeliveryMode As String
    
    If Len(Trim(txtEmailAddr)) = 0 Then
       MsgBox errSpaceEmailAddress(UserLang)
       txtEmailAddr.SetFocus
       Exit Sub
    End If
    
    If InStr(txtEmailAddr, "@") = 0 Then
       MsgBox errInvalidMailAddress(UserLang) '"E-mail address should contain @ character...Please Re-try"
       txtEmailAddr.SetFocus
       Exit Sub
    End If
    
    emailAddress = txtEmailAddr
    If optEnabled Then
       stmtDeliveryMode = "1"
    Else
       stmtDeliveryMode = "0"
    End If
    
    If tellerAction = True Then
       creationOrUpdate = "U"
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
    Else
       creationOrUpdate = "C"
       dateTime = Space(14)
    End If
    
    SendMsg = "000090" & "BD" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & dateTime & creationOrUpdate & Format(txtCustNo, "!@@@@@@@") & emailAddress & stmtDeliveryMode & Space(100)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEstmtRegn.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmEstmtRegn.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    frmEstmtRegn.MousePointer = vbNormal
    cmdCancel.Enabled = True
    
    If recvCustomerMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
       Exit Sub
    Else
       MsgBox errSuccessful(UserLang)
    End If
    
    Unload Me
    If tellerAction Then
       Unload frmSupervisorApproval
       frmEnquiry.readPendingList "00000", activityFlag, tCustNo
       If UserLang = ARABIC Then
          ChangePositions frmSupervisorApproval, 11800
          frmSupervisorApproval.RightToLeft = True
          frmSupervisorApproval.Hide
       End If
       frmSupervisorApproval.Show
    End If
   
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmEstmtRegn, 10065
       frmEstmtRegn.RightToLeft = True
    End If
    
    frmEstmtRegn.Caption = frmEstmtRegnCaption(0, UserLang)
    lblCustNo.Caption = frmEstmtRegnCaption(1, UserLang)
    lblCustName.Caption = frmEstmtRegnCaption(2, UserLang)
    lblBranchCode.Caption = frmEstmtRegnCaption(3, UserLang)
    lblEmailAddress.Caption = frmEstmtRegnCaption(4, UserLang)
    lblStmtDelivery.Caption = frmEstmtRegnCaption(5, UserLang)
    optDisabled.Caption = frmEstmtRegnCaption(6, UserLang)
    optEnabled.Caption = frmEstmtRegnCaption(7, UserLang)
    cmdSupervisorComments.Caption = frmEstmtRegnCaption(8, UserLang)
    cmdUpdate.Caption = frmEstmtRegnCaption(9, UserLang)
    cmdApprove.Caption = frmEstmtRegnCaption(10, UserLang)
    cmdReject.Caption = frmEstmtRegnCaption(11, UserLang)
    cmdCancel.Caption = frmEstmtRegnCaption(12, UserLang)

    If supervisorAction Or tellerAction Then
       If Len(RTrim(recvEstmtStatusMsg.supervisorComments)) > 0 Then
          cmdSupervisorComments.Enabled = True
       Else
         cmdSupervisorComments.Enabled = False
       End If
    Else
       cmdSupervisorComments.Enabled = False
    End If
    
    If supervisorAction Or custHistoryAction Then
       cmdUpdate.Enabled = False
       If supervisorAction Then
          cmdApprove.Enabled = True
          cmdReject.Enabled = True
       Else
          cmdApprove.Enabled = False
          cmdReject.Enabled = False
       End If
       txtEmailAddr.Enabled = False
       frameStmtDelivery.Enabled = False
       If custHistoryAction Then
         lblHistory.Visible = True
         lblHistory.Refresh
      Else
         lblHistory.Visible = False
      End If
    ElseIf InStr(recvLoginMsg.authorityLevel, "~01") <> 0 Then
       cmdUpdate.Enabled = True
       txtEmailAddr.Enabled = True
       frameStmtDelivery.Enabled = True
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
    Else
       cmdUpdate.Enabled = False
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       txtEmailAddr.Enabled = False
       frameStmtDelivery.Enabled = False
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Public Function eStmtSupervisorDecision(appRejectFlag As String, supervisorComments As String) As Integer
   Dim tuserId As String
   Dim tDateTime As String
   Dim tBranchCode As String
   Dim tSupervisorId As String
   Dim strmsglen As String
  
   frmSupervisorApproval.MSFlexGrid1.Col = 0
   tuserId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
   frmSupervisorApproval.MSFlexGrid1.Col = 1
   tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
   tBranchCode = gBranchCode
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   
   SendMsg = "000268" & "BE" & gBranchCode & appRejectFlag & tBranchCode & tuserId & tDateTime & _
             tSupervisorId & supervisorComments & frmEstmtRegn.txtCustNo & Space(50)
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmEstmtRegn.MousePointer = vbHourglass
   
   cmdApprove.Enabled = False
   cmdCancel.Enabled = False
   cmdReject.Enabled = False
   
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmEstmtRegn.MousePointer = vbDefault
      cmdApprove.Enabled = True
      cmdCancel.Enabled = True
      cmdReject.Enabled = True
      Exit Function
   End If
   
   frmEstmtRegn.MousePointer = vbDefault
   cmdApprove.Enabled = True
   cmdCancel.Enabled = True
   cmdReject.Enabled = True
   
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvCustomerMsg.aRemarks
      Else
         MsgBox recvCustomerMsg.eRemarks
      End If
      Exit Function
   End If
   If appRejectFlag = "R" Or appRejectFlag = "F" Then
      'Unload frmEstmtRejection
      unloadForms
   Else
      unloadForms
   End If
End Function

Public Sub unloadForms()
  Dim tCustNo As String
   
  If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
     tCustNo = Space(7)
  Else
     tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
  End If
  Unload Me
  Unload frmSupervisorApproval
  frmEnquiry.readPendingList "00000", "S", tCustNo
  If UserLang = ARABIC Then
     ChangePositions frmSupervisorApproval, 11800
     frmSupervisorApproval.RightToLeft = True
     frmSupervisorApproval.Hide
  End If
  frmSupervisorApproval.Show
    
End Sub

Private Sub txtEmailAddr_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEmailAddr_LostFocus()
If Not supervisorAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
      On Error Resume Next
      If Len(RTrim(txtEmailAddr)) <> 0 Then
         If InStr(txtEmailAddr, "@") = 0 Then
            MsgBox errInvalidMailAddress(UserLang) '"E-mail address should contain @ character...Please Re-try"
            txtEmailAddr.SetFocus
         End If
      End If
    End If
    On Error GoTo 0
 End If

End Sub
