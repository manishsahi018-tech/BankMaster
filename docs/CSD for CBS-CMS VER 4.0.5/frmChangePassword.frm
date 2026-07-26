VERSION 5.00
Begin VB.Form frmChangePassword 
   BackColor       =   &H00BFD87E&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Change Password"
   ClientHeight    =   3315
   ClientLeft      =   2940
   ClientTop       =   2040
   ClientWidth     =   6285
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
   ScaleWidth      =   6285
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      BackColor       =   &H00BFD87E&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6255
      Begin VB.TextBox txtOldPassword 
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
         Left            =   3000
         MaxLength       =   16
         PasswordChar    =   "*"
         TabIndex        =   1
         Tag             =   "6255"
         Top             =   1080
         Width           =   1815
      End
      Begin VB.TextBox txtNewPassword 
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
         Left            =   3000
         MaxLength       =   16
         PasswordChar    =   "*"
         TabIndex        =   2
         Tag             =   "6255"
         Top             =   1560
         Width           =   1815
      End
      Begin VB.TextBox txtConfirmPassword 
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
         Left            =   3000
         MaxLength       =   16
         PasswordChar    =   "*"
         TabIndex        =   3
         Tag             =   "6255"
         Top             =   2040
         Width           =   1815
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
         Left            =   2760
         TabIndex        =   4
         Tag             =   "6255"
         ToolTipText     =   "Ok"
         Top             =   2640
         Width           =   855
      End
      Begin VB.CommandButton cmdCancel 
         BackColor       =   &H0080FFFF&
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
         Left            =   3600
         TabIndex        =   5
         Tag             =   "6255"
         ToolTipText     =   "Cancel"
         Top             =   2640
         Width           =   1335
      End
      Begin VB.Label lblOldPassword 
         BackColor       =   &H00BFD87E&
         Caption         =   "Old Password"
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
         Left            =   600
         TabIndex        =   8
         Tag             =   "6255"
         Top             =   1080
         Width           =   2175
      End
      Begin VB.Label lblNewPassword 
         BackColor       =   &H00BFD87E&
         Caption         =   "New Password"
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
         Left            =   600
         TabIndex        =   7
         Tag             =   "6255"
         Top             =   1560
         Width           =   2175
      End
      Begin VB.Label lblConfirmPassword 
         BackColor       =   &H00BFD87E&
         Caption         =   "Confirm Password"
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
         Left            =   600
         TabIndex        =   6
         Tag             =   "6255"
         Top             =   2040
         Width           =   2295
      End
   End
End
Attribute VB_Name = "frmChangePassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOk_Click()
  Static NoOfTries As String
  Dim tOldPassword As String * 20
  Dim tNewPassword As String * 20
  Dim retStatus As String
  
  If NoOfTries < "1" Then
     NoOfTries = "1"
  End If
  If Len(RTrim(txtNewPassword)) = 0 Then
     MsgBox errSpacePassword(UserLang)
     txtNewPassword.text = ""
     txtConfirmPassword.text = ""
     txtNewPassword.SetFocus
     Exit Sub
  End If
  If Trim(txtNewPassword.text) <> Trim(txtConfirmPassword.text) Then
     MsgBox errPasswordNoMatch(UserLang) '"Passwords does not match...Please re-enter again"
     txtNewPassword.text = ""
     txtConfirmPassword.text = ""
     NoOfTries = NoOfTries + 1
     cmdOk.Default = False
     txtNewPassword.SetFocus
     Exit Sub
  End If
  tOldPassword = Encrypt(txtOldPassword)
  tNewPassword = Encrypt(txtNewPassword)
  frmChangePassword.MousePointer = vbHourglass
  frmChangePassword.cmdOk.Enabled = False
  frmChangePassword.cmdCancel.Enabled = False
  FormatChangePasswordRequest gUserId, tOldPassword, tNewPassword, NoOfTries
  DataReceivedFlag = False
  retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  frmChangePassword.MousePointer = vbDefault
  frmChangePassword.cmdOk.Enabled = True
  frmChangePassword.cmdCancel.Enabled = True
  If retStatus = LocalCommsError Then
     LoadError = True
     cmdOk.Default = False
     Exit Sub
  End If
  formatAuthLevel
  If recvLoginMsg.status = "000" Then
     LogData "Password successfully changed"
     MsgBox errPasswordChanged(UserLang) '"Password Successfully Changed."
     Unload Me
     If Not passwordChange Then
        loadEnquiryForm
     End If
  ElseIf recvLoginMsg.status = "103" Then
     LogData errInvalidPassword(1)
     MsgBox errInvalidPassword(UserLang) '"Invalid Password.. Check your Old Password"
     txtOldPassword = ""
     cmdOk.Default = False
     txtOldPassword.SetFocus
  ElseIf recvLoginMsg.status = "106" Then
     LogData errUsedPassword(1)
     MsgBox errUsedPassword(UserLang) '"Password previously used ...Please Use a different password"
     txtNewPassword = ""
     txtConfirmPassword = ""
     cmdOk.Default = False
     txtNewPassword.SetFocus
  Else
     LogData "Internal problem occurrd during password change  " & recvLoginMsg.status
     MsgBox errInternalProb(UserLang) '"Some internal problem occured..Password not changed"
     cmdOk.Default = False
  End If
  
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   cmdOk.Default = False
   If UserLang = ARABIC Then
      ChangePositions frmChangePassword, 6375
      frmChangePassword.RightToLeft = True
   End If
   
   frmChangePassword.Caption = frmChangePasswordCaption(0, UserLang)
   lblOldPassword.Caption = frmChangePasswordCaption(1, UserLang)
   lblNewPassword.Caption = frmChangePasswordCaption(2, UserLang)
   lblConfirmPassword.Caption = frmChangePasswordCaption(3, UserLang)
   cmdOk.Caption = frmChangePasswordCaption(4, UserLang)
   cmdCancel.Caption = frmChangePasswordCaption(5, UserLang)
   If passwordChange = False Then
      frmChangePassword.txtOldPassword = frmLogin.txtPassword
'      frmChangePassword.txtNewPassword.SetFocus
   Else
'      frmChangePassword.txtOldPassword.SetFocus
   End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtConfirmPassword_GotFocus()
   cmdOk.Default = True
End Sub

Private Sub txtConfirmPassword_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
    cmdOk.Default = True
End Sub

Private Sub txtNewPassword_GotFocus()
   cmdOk.Default = False
End Sub

Private Sub txtNewPassword_KeyPress(KeyAscii As Integer)
     If KeyAscii = 13 Then
        txtConfirmPassword.SetFocus
     End If
End Sub

Private Sub txtNewPassword_LostFocus()
   Dim PasswordOk As Boolean
   Dim Charfound As Boolean
   Dim Numberfound As Boolean
   Dim tempChar As String * 1
   Dim i As Integer
   If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
   Else
     If arabicCharFound(txtNewPassword) Then
        MsgBox errNoArabicCharacters(UserLang)
        txtNewPassword = ""
        txtNewPassword.SetFocus
        Exit Sub
     End If
     Charfound = False
     Numberfound = False
     If Len(txtNewPassword) < 8 Then
        MsgBox errShortPassword(UserLang) '"Password Should have minimum of 8 characters...RE-enter "
        txtNewPassword = ""
        txtNewPassword.SetFocus
        Exit Sub
     End If
     If txtNewPassword = txtOldPassword Then
        MsgBox errSamePassword(UserLang) '"New Password Cannot be equal to Old password..Please give a different Password.."
        txtNewPassword = ""
        txtNewPassword.SetFocus
        Exit Sub
     End If
     For i = 1 To Len(txtNewPassword)
        tempChar = Mid$(txtNewPassword, i, 1)
        If ((tempChar >= "A" And tempChar <= "Z") Or _
          (tempChar >= "a" And tempChar <= "z")) And _
          (Not Charfound) Then
             Charfound = True
       ElseIf (tempChar >= "0" And tempChar <= "9") And _
             (Not Numberfound) Then
             Numberfound = True
       End If
       If Charfound And Numberfound Then
          PasswordOk = True
          Exit For
       End If
    Next
    If Not PasswordOk Then
       MsgBox errAlphaNumericPassword(UserLang) '"Password should have atleast one alphabet and one number.. Please re-enter"
       txtNewPassword = ""
       txtNewPassword.SetFocus
    End If
 End If
End Sub

Private Sub txtOldPassword_GotFocus()
   cmdOk.Default = False
End Sub

Private Sub txtOldPassword_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
    If KeyAscii = 13 Then
       txtNewPassword.SetFocus
    End If
End Sub
