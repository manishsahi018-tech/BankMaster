VERSION 5.00
Begin VB.Form frmChangeScreenLang 
   BackColor       =   &H00BFD87E&
   Caption         =   "Change screen language"
   ClientHeight    =   3195
   ClientLeft      =   3735
   ClientTop       =   2445
   ClientWidth     =   6225
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6225
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   2160
      TabIndex        =   5
      Top             =   1440
      Width           =   2175
      Begin VB.OptionButton optLangEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "English"
         Height          =   255
         Left            =   960
         TabIndex        =   7
         TabStop         =   0   'False
         Tag             =   "2175"
         ToolTipText     =   "English"
         Top             =   120
         Width           =   1065
      End
      Begin VB.OptionButton optLangArabic 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Tag             =   "2175"
         ToolTipText     =   "Arabic"
         Top             =   120
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3720
      TabIndex        =   3
      ToolTipText     =   "Cancel"
      Top             =   2160
      Width           =   1335
   End
   Begin VB.CommandButton cmdChangeLang 
      Caption         =   "Change Language"
      Height          =   375
      Left            =   1080
      TabIndex        =   2
      ToolTipText     =   "Change Screen Language"
      Top             =   2160
      Width           =   2655
   End
   Begin VB.TextBox txtUserId 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2160
      TabIndex        =   1
      Top             =   960
      Width           =   2175
   End
   Begin VB.Label lblLangPref 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Language"
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
      Height          =   195
      Left            =   720
      TabIndex        =   8
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label lblChangeScreenLang 
      BackColor       =   &H00BFD87E&
      Caption         =   "Change the screen language"
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
      Left            =   360
      TabIndex        =   4
      Top             =   240
      Width           =   5535
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
      Left            =   720
      TabIndex        =   0
      Top             =   960
      Width           =   1215
   End
End
Attribute VB_Name = "frmChangeScreenLang"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdReset_Click()
  Dim strmsglen, tuserId As String
  
  If Len(RTrim(txtUserId)) = 0 Then
     MsgBox errSpaceUserId(UserLang)
     Exit Sub
  End If
  
  tuserId = Format(gUserId, "!@@@@@@@@@@")
   
  SendMsg = "000000" + "35" + gBranchCode + tuserId + Format(txtUserId, "!@@@@@@@@@@@@@@@@@@@@")
  
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmResetPassword.MousePointer = vbHourglass
  frmResetPassword.cmdReset.Enabled = False
  frmResetPassword.cmdCancel.Enabled = False
  
  If HandleMsgTraffic(frmEnquiry.tcpclient, frmEnquiry.Timer1) = LocalCommsError Then
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

Private Sub cmdChangeLang_Click()
  Dim strmsglen, tuserId As String
  Dim requiredLang As String
  
  If Len(RTrim(txtUserId)) = 0 Then
     MsgBox errSpaceUserId(UserLang)
     Exit Sub
  End If
  
  tuserId = Format(gUserId, "!@@@@@@@@@@")
  
  If optLangArabic Then
     requiredLang = "0"
  Else
     requiredLang = "1"
  End If
  
  If UserLang = Val(requiredLang) Then
     MsgBox errAlreadySameLanguage(UserLang)
     Exit Sub
  End If
   
  SendMsg = "000000" + "79" + gBranchCode + tuserId + requiredLang
  
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmChangeScreenLang.MousePointer = vbHourglass
  frmChangeScreenLang.cmdChangeLang.Enabled = False
  frmChangeScreenLang.cmdCancel.Enabled = False
  
  If HandleMsgTraffic(frmEnquiry.tcpclient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmChangeScreenLang.MousePointer = vbDefault
     frmChangeScreenLang.cmdChangeLang.Enabled = True
     frmChangeScreenLang.cmdCancel.Enabled = True
     Exit Sub
  End If
   
  frmChangeScreenLang.MousePointer = vbDefault
  frmChangeScreenLang.cmdChangeLang.Enabled = True
  frmChangeScreenLang.cmdCancel.Enabled = True
  
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
  
  MsgBox errLogoffForChangeLang(UserLang)
  
  Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub Form_Load()
   
    If UserLang = ARABIC Then
       ChangePositions frmChangeScreenLang, 6345
       frmChangeScreenLang.RightToLeft = True
    End If
    frmChangeScreenLang.Left = (Screen.Width - Width) / 2    ' Center form horizontally.
    frmChangeScreenLang.Top = (Screen.Height - Height) / 2   ' Center form vertically.
    
    frmChangeScreenLang.Caption = frmChangeScreenLangCaption(0, UserLang)
    frmChangeScreenLang.lblChangeScreenLang = frmChangeScreenLangCaption(0, UserLang)
    frmChangeScreenLang.lblUserId = frmChangeScreenLangCaption(1, UserLang)
    lblLangPref.Caption = frmChangeScreenLangCaption(2, UserLang)
    optLangArabic.Caption = frmChangeScreenLangCaption(3, 0)
    optLangEnglish.Caption = frmChangeScreenLangCaption(4, 1)
    
    cmdChangeLang.Caption = frmChangeScreenLangCaption(5, UserLang)
    cmdCancel.Caption = frmChangeScreenLangCaption(6, UserLang)
    
    frmChangeScreenLang.txtUserId = gUserId
    If UserLang = ARABIC Then
       frmChangeScreenLang.optLangArabic.Value = True
    Else
       frmChangeScreenLang.optLangEnglish.Value = True
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub
