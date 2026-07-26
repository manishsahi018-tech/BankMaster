VERSION 5.00
Begin VB.Form frmSwiftMessages 
   BackColor       =   &H00BFD87E&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "SWIFT messages"
   ClientHeight    =   3690
   ClientLeft      =   1785
   ClientTop       =   1935
   ClientWidth     =   6135
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3690
   ScaleWidth      =   6135
   Begin VB.TextBox txtMessage1 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1455
      MaxLength       =   35
      TabIndex        =   0
      Top             =   855
      Width           =   4335
   End
   Begin VB.TextBox txtMessage2 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1455
      MaxLength       =   35
      TabIndex        =   1
      Top             =   1335
      Width           =   4335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3270
      TabIndex        =   5
      ToolTipText     =   "Cancel"
      Top             =   2895
      Width           =   1095
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   1995
      TabIndex        =   4
      ToolTipText     =   "Ok"
      Top             =   2910
      Width           =   1095
   End
   Begin VB.TextBox txtMessage4 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1470
      MaxLength       =   35
      TabIndex        =   3
      Top             =   2295
      Width           =   4320
   End
   Begin VB.TextBox txtMessage3 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1470
      MaxLength       =   35
      TabIndex        =   2
      Top             =   1815
      Width           =   4320
   End
   Begin VB.Label lblSwiftMessages 
      BackColor       =   &H00BFD87E&
      Caption         =   "SWIFT Transfer messages"
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
      Left            =   1320
      TabIndex        =   10
      Top             =   120
      Width           =   3870
   End
   Begin VB.Label lblMessage1 
      BackColor       =   &H00BFD87E&
      Caption         =   "Message 1"
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
      TabIndex        =   9
      Top             =   855
      Width           =   1275
   End
   Begin VB.Label lblMessage2 
      BackColor       =   &H00BFD87E&
      Caption         =   "Message 2"
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
      Left            =   135
      TabIndex        =   8
      Top             =   1335
      Width           =   1245
   End
   Begin VB.Label lblMessage4 
      BackColor       =   &H00BFD87E&
      Caption         =   "Message 4"
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
      Left            =   165
      TabIndex        =   7
      Top             =   2295
      Width           =   1290
   End
   Begin VB.Label lblMessage3 
      BackColor       =   &H00BFD87E&
      Caption         =   "Message 3"
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
      Left            =   165
      TabIndex        =   6
      Top             =   1815
      Width           =   1260
   End
End
Attribute VB_Name = "frmSwiftMessages"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOk_Click()
    Dim tmpStr As String
    
    recvTransferDetail.message1 = frmSwiftMessages.txtMessage1
    recvTransferDetail.message2 = frmSwiftMessages.txtMessage2
    recvTransferDetail.message3 = frmSwiftMessages.txtMessage3
    recvTransferDetail.message4 = frmSwiftMessages.txtMessage4
    Unload Me
    
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmSwiftMessages, 6240
       frmSwiftMessages.RightToLeft = True
    End If
    
    frmSwiftMessages.Caption = frmSwiftTransferMessageCaption(0, UserLang)
    lblSwiftMessages.Caption = frmSwiftTransferMessageCaption(0, UserLang)
    lblMessage1.Caption = frmSwiftTransferMessageCaption(1, UserLang)
    lblMessage2.Caption = frmSwiftTransferMessageCaption(2, UserLang)
    lblMessage3.Caption = frmSwiftTransferMessageCaption(3, UserLang)
    lblMessage4.Caption = frmSwiftTransferMessageCaption(4, UserLang)
    cmdOk.Caption = frmSwiftTransferMessageCaption(5, UserLang)
    cmdCancel.Caption = frmSwiftTransferMessageCaption(6, UserLang)
    
    If swiftSupervisorAction Or swiftEnquiryAction Then
       cmdOk.Enabled = False
       txtMessage1.Enabled = False
       txtMessage2.Enabled = False
       txtMessage3.Enabled = False
       txtMessage4.Enabled = False
    Else
       cmdOk.Enabled = True
       txtMessage1.Enabled = True
       txtMessage2.Enabled = True
       txtMessage3.Enabled = True
       txtMessage4.Enabled = True
    End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
