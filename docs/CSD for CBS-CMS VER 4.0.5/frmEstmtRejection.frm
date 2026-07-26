VERSION 5.00
Begin VB.Form frmEstmtRejection 
   BackColor       =   &H00BFD87E&
   Caption         =   "E-Statement Rejection "
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
Attribute VB_Name = "frmEstmtRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdForward_Click()
   Dim tComments As String
   If Len(Trim(txtSuperVisorComments)) = 0 Then
      MsgBox errSpaceComments(UserLang)    ' "Comments should be entered...Please enter it.."
      Exit Sub
   Else
      tComments = Format(txtSuperVisorComments, "!" & String(200, "@"))
   End If
   frmEstmtRegn.eStmtSupervisorDecision "F", tComments
    
End Sub

Private Sub cmdReject_Click()
   Dim tComments As String
   If Len(Trim(txtSuperVisorComments)) = 0 Then
      MsgBox errSpaceComments(UserLang)    ' "Comments should be entered...Please enter it.."
      Exit Sub
   Else
      tComments = Format(txtSuperVisorComments, "!" & String(200, "@"))
   End If
   frmEstmtRegn.eStmtSupervisorDecision "F", tComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmEstmtRejection, 8550
       frmEstmtRejection.RightToLeft = True
    End If
    
    frmEstmtRejection.Caption = frmEstmtRejectionCaption(0, UserLang)
    lblComments = frmStdOrdRejectionCaption(1, UserLang)
    cmdReject.Caption = frmStdOrdRejectionCaption(2, UserLang)
    cmdForward.Caption = frmStdOrdRejectionCaption(3, UserLang)
    cmdCancel.Caption = frmStdOrdRejectionCaption(4, UserLang)
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtSuperVisorComments_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
