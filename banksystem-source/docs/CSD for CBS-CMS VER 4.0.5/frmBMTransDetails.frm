VERSION 5.00
Begin VB.Form frmBMTransDetails 
   BackColor       =   &H00BFD87E&
   Caption         =   "BankMaster Transaction Details"
   ClientHeight    =   7590
   ClientLeft      =   1515
   ClientTop       =   720
   ClientWidth     =   11685
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7590
   ScaleWidth      =   11685
   WindowState     =   2  'Maximized
   Begin VB.Frame frameBmTransDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   4935
      Left            =   240
      TabIndex        =   4
      Top             =   1320
      Width           =   11535
      Begin VB.TextBox txtSupervisorId 
         Height          =   285
         Left            =   6960
         TabIndex        =   32
         Tag             =   "11535"
         Top             =   2280
         Width           =   1095
      End
      Begin VB.TextBox txtUserId 
         Height          =   285
         Left            =   2520
         TabIndex        =   30
         Tag             =   "11535"
         Top             =   2280
         Width           =   1095
      End
      Begin VB.TextBox txtTransType 
         Height          =   285
         Left            =   6960
         TabIndex        =   28
         Tag             =   "11535"
         Text            =   "32-Direct Transfer"
         Top             =   1680
         Width           =   2055
      End
      Begin VB.TextBox txtNarrative3 
         Height          =   285
         Left            =   2520
         MaxLength       =   25
         TabIndex        =   26
         Tag             =   "11535"
         Top             =   4440
         Width           =   6255
      End
      Begin VB.TextBox txtNarrative2 
         Height          =   285
         Left            =   2520
         MaxLength       =   25
         TabIndex        =   24
         Tag             =   "11535"
         Top             =   3960
         Width           =   6255
      End
      Begin VB.TextBox txtNarrative1 
         Height          =   285
         Left            =   2520
         MaxLength       =   25
         TabIndex        =   22
         Tag             =   "11535"
         Top             =   3480
         Width           =   6255
      End
      Begin VB.TextBox txtStmtFlag 
         Height          =   285
         Left            =   2520
         TabIndex        =   20
         Tag             =   "11535"
         Text            =   "0-Print on statement"
         Top             =   2880
         Width           =   2055
      End
      Begin VB.TextBox txtValueYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   8160
         MaxLength       =   4
         TabIndex        =   18
         Tag             =   "11535"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbValueMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   7560
         TabIndex        =   17
         Tag             =   "11535"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbValueDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   6960
         TabIndex        =   16
         Tag             =   "11535"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtTransYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   3720
         MaxLength       =   4
         TabIndex        =   14
         Tag             =   "11535"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbTransMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   3120
         TabIndex        =   13
         Tag             =   "11535"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbTransDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   2520
         TabIndex        =   12
         Tag             =   "11535"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtCustName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6960
         TabIndex        =   11
         Tag             =   "11535"
         Top             =   120
         Width           =   3735
      End
      Begin VB.TextBox txtAcctNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2520
         TabIndex        =   5
         Tag             =   "11535"
         Top             =   120
         Width           =   2055
      End
      Begin VB.TextBox txtTransAmt 
         Height          =   285
         Left            =   2520
         TabIndex        =   2
         Tag             =   "11535"
         Top             =   1680
         Width           =   2055
      End
      Begin VB.TextBox txtTransRefNo 
         Height          =   285
         Left            =   2520
         TabIndex        =   1
         Tag             =   "11535"
         Top             =   600
         Width           =   2055
      End
      Begin VB.Label lblSupervisorId 
         BackColor       =   &H00BFD87E&
         Caption         =   "Supervisor Id"
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
         Left            =   4800
         TabIndex        =   31
         Tag             =   "11535"
         Top             =   2280
         Width           =   1935
      End
      Begin VB.Label lblTransType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Transaction Type"
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
         Left            =   4800
         TabIndex        =   29
         Tag             =   "11535"
         Top             =   1680
         Width           =   1935
      End
      Begin VB.Label lblNarrative3 
         BackColor       =   &H00BFD87E&
         Caption         =   "Narrative 3"
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
         Left            =   480
         TabIndex        =   27
         Tag             =   "11535"
         Top             =   4440
         Width           =   1935
      End
      Begin VB.Label lblNarrative2 
         BackColor       =   &H00BFD87E&
         Caption         =   "Narrative 2"
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
         Left            =   480
         TabIndex        =   25
         Tag             =   "11535"
         Top             =   3960
         Width           =   1935
      End
      Begin VB.Label lblNarrative1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Narrative 1"
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
         Left            =   480
         TabIndex        =   23
         Tag             =   "11535"
         Top             =   3480
         Width           =   1935
      End
      Begin VB.Label lblStmtFlag 
         BackColor       =   &H00BFD87E&
         Caption         =   "Statement Flag"
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
         Left            =   480
         TabIndex        =   21
         Tag             =   "11535"
         Top             =   2880
         Width           =   1815
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
         Left            =   480
         TabIndex        =   19
         Tag             =   "11535"
         Top             =   2280
         Width           =   1935
      End
      Begin VB.Label lblValueDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Value Date"
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
         Left            =   4800
         TabIndex        =   15
         Tag             =   "11535"
         Top             =   1080
         Width           =   1815
      End
      Begin VB.Label lblCustName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Customer Name :"
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
         Height          =   375
         Left            =   4800
         TabIndex        =   10
         Tag             =   "11535"
         Top             =   120
         Width           =   1815
      End
      Begin VB.Label lblAcctNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Account Number"
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
         Left            =   480
         TabIndex        =   9
         Tag             =   "11535"
         Top             =   120
         Width           =   1935
      End
      Begin VB.Label lblTransDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Trans Date"
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
         Left            =   480
         TabIndex        =   8
         Tag             =   "11535"
         Top             =   1080
         Width           =   1935
      End
      Begin VB.Label lblTransAmt 
         BackColor       =   &H00BFD87E&
         Caption         =   "Trans Amount"
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
         Left            =   480
         TabIndex        =   7
         Tag             =   "11535"
         Top             =   1680
         Width           =   1815
      End
      Begin VB.Label lblTransRefNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Reference No."
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
         Left            =   480
         TabIndex        =   6
         Tag             =   "11535"
         Top             =   600
         Width           =   1815
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   5160
      TabIndex        =   3
      ToolTipText     =   "Exit"
      Top             =   6960
      Width           =   1335
   End
   Begin VB.Label lblBmTransDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "BankMaster Transaction Details"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   3000
      TabIndex        =   0
      Top             =   120
      Width           =   5655
   End
End
Attribute VB_Name = "frmBMTransDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub Form_Load()
            
    If UserLang = ARABIC Then
       ChangePositions frmBMTransDetails, 11805
       frmBMTransDetails.RightToLeft = True
    End If
    
    frmBMTransDetails.Caption = frmBmTransDetailCaption(0, UserLang)
    frmBMTransDetails.lblBmTransDetails.Caption = frmBmTransDetailCaption(0, UserLang)
    frmBMTransDetails.lblAcctNo.Caption = frmBmTransDetailCaption(1, UserLang)
    frmBMTransDetails.lblCustName.Caption = frmBmTransDetailCaption(2, UserLang)
    frmBMTransDetails.lblTransRefNo.Caption = frmBmTransDetailCaption(3, UserLang)
    frmBMTransDetails.lblTransDate.Caption = frmBmTransDetailCaption(4, UserLang)
    frmBMTransDetails.lblValueDate.Caption = frmBmTransDetailCaption(5, UserLang)
    frmBMTransDetails.lblTransAmt.Caption = frmBmTransDetailCaption(6, UserLang)
    
    frmBMTransDetails.lblTransType.Caption = frmBmTransDetailCaption(7, UserLang)
    frmBMTransDetails.lblUserId.Caption = frmBmTransDetailCaption(8, UserLang)
    frmBMTransDetails.lblSupervisorId.Caption = frmBmTransDetailCaption(9, UserLang)
    frmBMTransDetails.lblStmtFlag.Caption = frmBmTransDetailCaption(10, UserLang)
    frmBMTransDetails.lblNarrative1.Caption = frmBmTransDetailCaption(11, UserLang)
    frmBMTransDetails.lblNarrative2.Caption = frmBmTransDetailCaption(12, UserLang)
    frmBMTransDetails.lblNarrative3.Caption = frmBmTransDetailCaption(13, UserLang)
    frmBMTransDetails.cmdExit.Caption = frmBmTransDetailCaption(14, UserLang)

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub frameBmTransDetails_DragDrop(Source As Control, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub txtNarrative1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub txtNarrative2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub txtNarrative3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub
