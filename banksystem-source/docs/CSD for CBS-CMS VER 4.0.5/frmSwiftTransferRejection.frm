VERSION 5.00
Begin VB.Form frmSwiftTransferRejection 
   BackColor       =   &H00BFD87E&
   Caption         =   "Swift Transfer Rejection "
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
   ScaleWidth      =   8430
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   495
      Left            =   1800
      TabIndex        =   4
      ToolTipText     =   "Reject"
      Top             =   2280
      Width           =   1575
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5640
      TabIndex        =   3
      ToolTipText     =   "Cancel"
      Top             =   2280
      Width           =   1455
   End
   Begin VB.CommandButton cmdForward 
      Caption         =   "Forward to CSO"
      Height          =   495
      Left            =   3360
      TabIndex        =   2
      ToolTipText     =   "Forward to CSO"
      Top             =   2280
      Width           =   2295
   End
   Begin VB.TextBox txtSuperVisorComments 
      Height          =   495
      Left            =   1920
      TabIndex        =   0
      Text            =   " "
      Top             =   1200
      Width           =   5415
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
      TabIndex        =   1
      Top             =   1200
      Width           =   1695
   End
End
Attribute VB_Name = "frmSwiftTransferRejection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdForward_Click()
   Dim tComments As String
   If Len(Trim(txtSupervisorComments)) = 0 Then
      MsgBox errSpaceComments(UserLang)    ' "Comments should be entered...Please enter it.."
      Exit Sub
   Else
      tComments = Format(txtSupervisorComments, "!" & String(200, "@"))
   End If
   frmSwiftTransferDetail.swiftTransferSupervisorDecision "F", tComments
End Sub

Private Sub cmdReject_Click()
   Dim tComments As String
   If Len(Trim(txtSupervisorComments)) = 0 Then
      MsgBox errSpaceComments(UserLang)    ' "Comments should be entered...Please enter it.."
      Exit Sub
   Else
      tComments = Format(txtSupervisorComments, "!" & String(200, "@"))
   End If
   frmSwiftTransferDetail.swiftTransferSupervisorDecision "R", tComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmSwiftTransferRejection, 8550
       frmSwiftTransferRejection.RightToLeft = True
    End If
    
    frmSwiftTransferRejection.Caption = frmSwiftTransferRejectionCaption(0, UserLang)
    frmSwiftTransferRejection.lblComments.Caption = frmSwiftTransferRejectionCaption(1, UserLang)
    frmSwiftTransferRejection.cmdReject.Caption = frmSwiftTransferRejectionCaption(2, UserLang)
    frmSwiftTransferRejection.cmdForward.Caption = frmSwiftTransferRejectionCaption(3, UserLang)
    frmSwiftTransferRejection.cmdCancel.Caption = frmSwiftTransferRejectionCaption(4, UserLang)
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtSuperVisorComments_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
