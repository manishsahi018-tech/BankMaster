VERSION 5.00
Begin VB.Form frmSarieTransDetails 
   BackColor       =   &H00BFD87E&
   Caption         =   "Transfer Details"
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
   Begin VB.Frame frameTransferDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   6495
      Left            =   120
      TabIndex        =   6
      Top             =   840
      Width           =   11535
      Begin VB.TextBox txtBenefBank 
         Height          =   285
         Left            =   2520
         TabIndex        =   50
         Tag             =   "11535"
         Top             =   3480
         Width           =   2775
      End
      Begin VB.TextBox txtCorresBank 
         Height          =   285
         Left            =   7680
         TabIndex        =   49
         Tag             =   "11535"
         Top             =   3480
         Width           =   3015
      End
      Begin VB.TextBox txtMessage4 
         Height          =   285
         Left            =   7800
         MaxLength       =   25
         TabIndex        =   47
         Tag             =   "11535"
         Top             =   5760
         Width           =   3495
      End
      Begin VB.TextBox txtMessage3 
         Height          =   285
         Left            =   2520
         MaxLength       =   25
         TabIndex        =   45
         Tag             =   "11535"
         Top             =   5760
         Width           =   3135
      End
      Begin VB.TextBox txtMessage2 
         Height          =   285
         Left            =   7800
         MaxLength       =   25
         TabIndex        =   43
         Tag             =   "11535"
         Top             =   5160
         Width           =   3495
      End
      Begin VB.TextBox txtMessage1 
         Height          =   285
         Left            =   2520
         MaxLength       =   25
         TabIndex        =   41
         Tag             =   "11535"
         Top             =   5160
         Width           =   3135
      End
      Begin VB.TextBox txtPaymentStatus 
         Height          =   285
         Left            =   7680
         TabIndex        =   39
         Tag             =   "11535"
         Text            =   "C-Confirmed"
         Top             =   3960
         Width           =   2055
      End
      Begin VB.TextBox txtDrAccNo 
         Height          =   285
         Left            =   7680
         TabIndex        =   37
         Tag             =   "11535"
         Top             =   600
         Width           =   2055
      End
      Begin VB.TextBox txtTransferType 
         Height          =   285
         Left            =   2520
         TabIndex        =   35
         Tag             =   "11535"
         Text            =   "2-SWIFT/Telex"
         Top             =   3960
         Width           =   2055
      End
      Begin VB.TextBox txtBenefAddr2 
         Height          =   285
         Left            =   7680
         TabIndex        =   33
         Tag             =   "11535"
         Top             =   3000
         Width           =   3015
      End
      Begin VB.TextBox txtBenefAddr1 
         Height          =   285
         Left            =   2520
         TabIndex        =   31
         Tag             =   "11535"
         Top             =   3000
         Width           =   2775
      End
      Begin VB.TextBox txtBenefName 
         Height          =   285
         Left            =   7680
         TabIndex        =   29
         Tag             =   "11535"
         Top             =   2520
         Width           =   3015
      End
      Begin VB.TextBox txtPaymentAmt 
         Height          =   285
         Left            =   7680
         TabIndex        =   27
         Tag             =   "11535"
         Top             =   2040
         Width           =   2055
      End
      Begin VB.TextBox txtPaymentCurrency 
         Height          =   285
         Left            =   7680
         TabIndex        =   25
         Tag             =   "11535"
         Text            =   "01-Saudi Riyal"
         Top             =   1560
         Width           =   2055
      End
      Begin VB.TextBox txtValueYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   8880
         TabIndex        =   23
         Tag             =   "11535"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbValueMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   8280
         TabIndex        =   22
         Tag             =   "11535"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbValueDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   7680
         TabIndex        =   21
         Tag             =   "11535"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtIssueYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   3720
         TabIndex        =   19
         Tag             =   "11535"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbIssueMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   3120
         TabIndex        =   18
         Tag             =   "11535"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbIssueDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   2520
         TabIndex        =   17
         Tag             =   "11535"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtCustName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7680
         TabIndex        =   16
         Tag             =   "11535"
         Top             =   120
         Width           =   3735
      End
      Begin VB.TextBox txtBranchCode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2520
         TabIndex        =   14
         Tag             =   "11535"
         Text            =   "0499-MIDDLE PROVINCE BOC "
         Top             =   4440
         Width           =   2535
      End
      Begin VB.TextBox txtAcctNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2520
         TabIndex        =   7
         Tag             =   "11535"
         Top             =   120
         Width           =   2055
      End
      Begin VB.TextBox txtTransCurrency 
         Height          =   285
         Left            =   2520
         TabIndex        =   3
         Tag             =   "11535"
         Text            =   "01-Saudi Riyal"
         Top             =   1560
         Width           =   2055
      End
      Begin VB.TextBox txtTransAmt 
         Height          =   285
         Left            =   2520
         TabIndex        =   2
         Tag             =   "11535"
         Top             =   2040
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
      Begin VB.TextBox txtApplicantName 
         Height          =   285
         Left            =   2520
         TabIndex        =   4
         Tag             =   "11535"
         Top             =   2520
         Width           =   2055
      End
      Begin VB.Label lblBenefBank 
         BackColor       =   &H00BFD87E&
         Caption         =   "Beneficiary Bank"
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
         TabIndex        =   52
         Tag             =   "11535"
         Top             =   3480
         Width           =   2055
      End
      Begin VB.Label lblCorrespondentBank 
         BackColor       =   &H00BFD87E&
         Caption         =   "Correpondent Bank"
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
         Left            =   5520
         TabIndex        =   51
         Tag             =   "11535"
         Top             =   3480
         Width           =   2175
      End
      Begin VB.Line Line1 
         Tag             =   "11535"
         X1              =   0
         X2              =   11520
         Y1              =   5040
         Y2              =   5040
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
         Left            =   5760
         TabIndex        =   48
         Tag             =   "11535"
         Top             =   5760
         Width           =   1935
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
         Left            =   480
         TabIndex        =   46
         Tag             =   "11535"
         Top             =   5760
         Width           =   1935
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
         Left            =   5760
         TabIndex        =   44
         Tag             =   "11535"
         Top             =   5160
         Width           =   1935
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
         Left            =   480
         TabIndex        =   42
         Tag             =   "11535"
         Top             =   5160
         Width           =   1935
      End
      Begin VB.Label lblPaymentStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment Status"
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
         Left            =   5520
         TabIndex        =   40
         Tag             =   "11535"
         Top             =   3960
         Width           =   1935
      End
      Begin VB.Label lblDrAccNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Dr A/c Number"
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
         Left            =   5520
         TabIndex        =   38
         Tag             =   "11535"
         Top             =   600
         Width           =   1815
      End
      Begin VB.Label lblTransferType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Transfer Type"
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
         TabIndex        =   36
         Tag             =   "11535"
         Top             =   3960
         Width           =   1935
      End
      Begin VB.Label lblBeneficiaryAddr2 
         BackColor       =   &H00BFD87E&
         Caption         =   "Beneficiary Addr-2"
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
         Left            =   5520
         TabIndex        =   34
         Tag             =   "11535"
         Top             =   3000
         Width           =   1935
      End
      Begin VB.Label lblBeneficiaryAddr1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Beneficiary Addr-1"
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
         TabIndex        =   32
         Tag             =   "11535"
         Top             =   3000
         Width           =   2055
      End
      Begin VB.Label lblBeneficiaryName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Beneficiary Name"
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
         Left            =   5520
         TabIndex        =   30
         Tag             =   "11535"
         Top             =   2520
         Width           =   1935
      End
      Begin VB.Label lblPaymentAmt 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment Amount"
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
         Left            =   5520
         TabIndex        =   28
         Tag             =   "11535"
         Top             =   2040
         Width           =   1815
      End
      Begin VB.Label lblPaymentCurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment Currency"
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
         Left            =   5520
         TabIndex        =   26
         Tag             =   "11535"
         Top             =   1560
         Width           =   1935
      End
      Begin VB.Label lblTransCurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Trans. Currency"
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
         TabIndex        =   24
         Tag             =   "11535"
         Top             =   1560
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
         Left            =   5520
         TabIndex        =   20
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
         Left            =   5520
         TabIndex        =   15
         Tag             =   "11535"
         Top             =   120
         Width           =   1815
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
         Left            =   480
         TabIndex        =   13
         Tag             =   "11535"
         Top             =   4440
         Width           =   1575
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
         TabIndex        =   12
         Tag             =   "11535"
         Top             =   120
         Width           =   1935
      End
      Begin VB.Label lblIssueDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Issue Date"
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
         TabIndex        =   11
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
         TabIndex        =   10
         Tag             =   "11535"
         Top             =   2040
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
         TabIndex        =   9
         Tag             =   "11535"
         Top             =   600
         Width           =   1815
      End
      Begin VB.Label lblApplicantName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Applicant Name"
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
         Top             =   2520
         Width           =   1935
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   5040
      TabIndex        =   5
      ToolTipText     =   "Exit"
      Top             =   7800
      Width           =   1335
   End
   Begin VB.Label lblSarieTransDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Transfer Details"
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
      Left            =   3240
      TabIndex        =   0
      Top             =   120
      Width           =   4815
   End
End
Attribute VB_Name = "frmSarieTransDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
            
    If UserLang = ARABIC Then
       ChangePositions frmSarieTransDetails, 11805
       frmSarieTransDetails.RightToLeft = True
    End If
    
    frmSarieTransDetails.Caption = frmTransferDetailCaption(0, UserLang)
    frmSarieTransDetails.lblSarieTransDetails.Caption = frmTransferDetailCaption(0, UserLang)
    frmSarieTransDetails.lblAcctNo.Caption = frmTransferDetailCaption(1, UserLang)
    frmSarieTransDetails.lblCustName.Caption = frmTransferDetailCaption(2, UserLang)
    frmSarieTransDetails.lblTransRefNo.Caption = frmTransferDetailCaption(3, UserLang)
    frmSarieTransDetails.lblDrAccNo.Caption = frmTransferDetailCaption(4, UserLang)
    frmSarieTransDetails.lblIssueDate.Caption = frmTransferDetailCaption(5, UserLang)
    frmSarieTransDetails.lblValueDate.Caption = frmTransferDetailCaption(6, UserLang)
    frmSarieTransDetails.lblTransCurrency.Caption = frmTransferDetailCaption(7, UserLang)
    frmSarieTransDetails.lblTransAmt.Caption = frmTransferDetailCaption(8, UserLang)
    frmSarieTransDetails.lblPaymentCurrency.Caption = frmTransferDetailCaption(9, UserLang)
    frmSarieTransDetails.lblPaymentAmt.Caption = frmTransferDetailCaption(10, UserLang)
    frmSarieTransDetails.lblApplicantName.Caption = frmTransferDetailCaption(11, UserLang)
    frmSarieTransDetails.lblBeneficiaryName.Caption = frmTransferDetailCaption(12, UserLang)
    frmSarieTransDetails.lblBeneficiaryAddr1.Caption = frmTransferDetailCaption(13, UserLang)
    frmSarieTransDetails.lblBeneficiaryAddr2.Caption = frmTransferDetailCaption(14, UserLang)
    frmSarieTransDetails.lblTransferType.Caption = frmTransferDetailCaption(15, UserLang)
    frmSarieTransDetails.lblPaymentStatus.Caption = frmTransferDetailCaption(16, UserLang)
    frmSarieTransDetails.LblBranchCode.Caption = frmTransferDetailCaption(17, UserLang)
    frmSarieTransDetails.lblBenefBank.Caption = frmTransferDetailCaption(24, UserLang)
    frmSarieTransDetails.lblCorrespondentBank.Caption = frmTransferDetailCaption(25, UserLang)
    frmSarieTransDetails.lblMessage1.Caption = frmTransferDetailCaption(19, UserLang)
    frmSarieTransDetails.lblMessage2.Caption = frmTransferDetailCaption(20, UserLang)
    frmSarieTransDetails.lblMessage3.Caption = frmTransferDetailCaption(21, UserLang)
    frmSarieTransDetails.lblMessage4.Caption = frmTransferDetailCaption(22, UserLang)
    frmSarieTransDetails.cmdExit.Caption = frmTransferDetailCaption(23, UserLang)
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Label11_Click()

End Sub

Private Sub frameTransferDetails_DragDrop(Source As Control, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
