VERSION 5.00
Begin VB.Form frmIdleTimePassword 
   BackColor       =   &H00BFD87E&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Idle Time Expired ; Please enter your password to proceed"
   ClientHeight    =   3315
   ClientLeft      =   2130
   ClientTop       =   2475
   ClientWidth     =   6255
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   12
      Charset         =   178
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3315
   ScaleWidth      =   6255
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3120
      TabIndex        =   3
      Tag             =   "6255"
      ToolTipText     =   "Cancel"
      Top             =   2640
      Width           =   1335
   End
   Begin VB.CommandButton cmdOk 
      BackColor       =   &H00808080&
      Caption         =   "OK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2280
      TabIndex        =   2
      Tag             =   "6255"
      ToolTipText     =   "Ok"
      Top             =   2640
      Width           =   855
   End
   Begin VB.TextBox txtPassword 
      BackColor       =   &H8000000A&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   3120
      MaxLength       =   16
      PasswordChar    =   "*"
      TabIndex        =   1
      Tag             =   "6255"
      Top             =   1800
      Width           =   1815
   End
   Begin VB.TextBox txtUserId 
      BackColor       =   &H8000000A&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   3120
      MaxLength       =   16
      TabIndex        =   0
      Tag             =   "6255"
      Top             =   1080
      Width           =   1815
   End
   Begin VB.Label lblIdleTime 
      BackColor       =   &H00BFD87E&
      Caption         =   "Idle Time Expired ; Please enter your password"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Tag             =   "6255"
      Top             =   360
      Width           =   5655
   End
   Begin VB.Label lblUserId 
      BackColor       =   &H00BFD87E&
      Caption         =   "User Id"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   720
      TabIndex        =   5
      Tag             =   "6255"
      Top             =   1080
      Width           =   1935
   End
   Begin VB.Label lblPassword 
      BackColor       =   &H00BFD87E&
      Caption         =   "Password"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
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
      Tag             =   "6255"
      Top             =   1800
      Width           =   1815
   End
End
Attribute VB_Name = "frmIdleTimePassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
    End
End Sub

Private Sub cmdOk_Click()
  Static NoOfTries As String
  Dim tPassword As String * 20
  
  If NoOfTries < "1" Then
     NoOfTries = "1"
  End If
  
  If Len(RTrim(txtPassword)) = 0 Then
     MsgBox errEnterPassword(UserLang)
     Exit Sub
  End If
  
  If frmEnquiry.tcpClient.State <> sckConnected Then
     If ConnectStaticServer(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
        LogData "Could not connect to static server.."
        Exit Sub
     End If
  End If
    
  tPassword = Encrypt(txtPassword)
  frmIdleTimePassword.MousePointer = vbHourglass
  frmIdleTimePassword.cmdOk.Enabled = False
  frmIdleTimePassword.cmdCancel.Enabled = False
  FormatLoginRequest gUserId, tPassword, gBranchCode, NoOfTries, True
  DataReceivedFlag = False
  retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  frmIdleTimePassword.MousePointer = vbNormal
  frmIdleTimePassword.cmdOk.Enabled = True
  frmIdleTimePassword.cmdCancel.Enabled = True
  txtPassword.text = ""
  If retStatus = LocalCommsError Then
     LoadError = True
     cmdOk.Default = False
     Exit Sub
  End If
  If recvLoginMsg.status = "000" Then
     formatAuthLevel
     CSD_mdiForm.staticStatus.Panels(3).text = " "
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
     Unload Me
  ElseIf recvLoginMsg.status = "103" Then
     If NoOfTries <= "3" Then
        If UserLang = ENGLISH Then
            MsgBox recvLoginMsg.eRemarks
        Else
            MsgBox recvLoginMsg.aRemarks
        End If
     Else
        MsgBox errMaxTries(UserLang) ' "More than 3 unsuccessful tries...Your account has been locked...Please call headoffice   "
        NoOfTries = "0"
     End If
     NoOfTries = NoOfTries + 1
     txtPassword.SetFocus
ElseIf recvLoginMsg.status = "104" Then
   MsgBox errAccountLocked(UserLang) '"User Account Locked...Call HeadOffice to activate"
   End
ElseIf recvLoginMsg.status = "105" Then
   MsgBox errAccountClosed(UserLang) '"Your Account has been closed....Please contact security Officer.."
   End
Else
   If UserLang = ARABIC Then
      MsgBox recvLoginMsg.aRemarks
   Else
      MsgBox recvLoginMsg.eRemarks
   End If
End If
  
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   cmdOk.Default = False
   If UserLang = ARABIC Then
      ChangePositions frmIdleTimePassword, 6375
      frmIdleTimePassword.RightToLeft = True
   End If
   
   frmIdleTimePassword.Caption = frmIdleTimePasswordCaption(0, UserLang)
   lblIdleTime.Caption = frmIdleTimePasswordCaption(1, UserLang)
   lblUserId.Caption = frmIdleTimePasswordCaption(2, UserLang)
   lblPassword.Caption = frmIdleTimePasswordCaption(3, UserLang)
   cmdOk.Caption = frmIdleTimePasswordCaption(4, UserLang)
   cmdCancel.Caption = frmIdleTimePasswordCaption(5, UserLang)
   txtUserId.text = gUserId
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
    cmdOk.Default = True
End Sub

Private Sub txtPassword_GotFocus()
   cmdOk.Default = False
End Sub
