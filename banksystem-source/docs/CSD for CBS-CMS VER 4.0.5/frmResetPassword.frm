VERSION 5.00
Begin VB.Form frmResetPassword 
   BackColor       =   &H00BFD87E&
   Caption         =   "Reset Password for Branch User"
   ClientHeight    =   3195
   ClientLeft      =   3840
   ClientTop       =   4395
   ClientWidth     =   6225
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6225
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2760
      TabIndex        =   3
      ToolTipText     =   "Cancel"
      Top             =   2160
      Width           =   1335
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset Pasword"
      Height          =   375
      Left            =   1440
      TabIndex        =   2
      ToolTipText     =   "Reset Password"
      Top             =   2160
      Width           =   1335
   End
   Begin VB.TextBox txtUserId 
      Height          =   285
      Left            =   2040
      TabIndex        =   1
      Top             =   1320
      Width           =   2175
   End
   Begin VB.Label lblResetPassword 
      BackColor       =   &H00BFD87E&
      Caption         =   "Reset Password for the branch users"
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
      Left            =   720
      TabIndex        =   4
      Top             =   240
      Width           =   4935
   End
   Begin VB.Label lblUserId 
      BackColor       =   &H00BFD87E&
      Caption         =   "User Id"
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
      Left            =   600
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "frmResetPassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdReset_Click()
  Dim strmsglen As String, tUserid As String
  
  If Len(RTrim(txtUserId)) = 0 Then
     MsgBox errSpaceUserId(UserLang)
     Exit Sub
  End If
  
  tUserid = Format(gUserId, "!@@@@@@@@@@")
   
  SendMsg = "000000" & "35" & gBranchCode & tUserid & Format(txtUserId, "!@@@@@@@@@@@@@@@@@@@@")
  
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmResetPassword.MousePointer = vbHourglass
  frmResetPassword.cmdReset.Enabled = False
  frmResetPassword.cmdCancel.Enabled = False
  
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmResetPassword.MousePointer = vbDefault
     frmResetPassword.cmdReset.Enabled = True
     frmResetPassword.cmdCancel.Enabled = True
     Exit Sub
  End If
   
  frmResetPassword.MousePointer = vbDefault
  frmResetPassword.cmdReset.Enabled = True
  frmResetPassword.cmdCancel.Enabled = True
  
  If recvCustomerMsg.status = "000" Then
     MsgBox errSuccessful(UserLang)
  Else
     If UserLang = ENGLISH Then
        MsgBox recvCustomerMsg.eRemarks
     Else
        MsgBox recvCustomerMsg.aRemarks
     End If
     Exit Sub
  End If
  
  Unload Me
End Sub

Private Sub Form_Load()
   
    If UserLang = ARABIC Then
       ChangePositions frmResetPassword, 6345
       frmResetPassword.RightToLeft = True
    End If
    
    frmResetPassword.Caption = frmResetPasswordCaption(0, UserLang)
    frmResetPassword.lblResetPassword = frmResetPasswordCaption(1, UserLang)
    frmResetPassword.lblUserId = frmResetPasswordCaption(2, UserLang)
    frmResetPassword.cmdReset.Caption = frmResetPasswordCaption(3, UserLang)
    frmResetPassword.cmdCancel.Caption = frmResetPasswordCaption(4, UserLang)
    
End Sub
