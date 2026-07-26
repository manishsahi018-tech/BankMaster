VERSION 5.00
Begin VB.Form frmSwiftFinancialInfo 
   BackColor       =   &H00BFD87E&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "SWIFT financial Information"
   ClientHeight    =   4560
   ClientLeft      =   435
   ClientTop       =   420
   ClientWidth     =   8145
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8715
   ScaleWidth      =   11970
   Begin VB.Frame frameTransDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Transaction Details"
      Enabled         =   0   'False
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
      Height          =   3105
      Left            =   195
      TabIndex        =   2
      Top             =   525
      Width           =   7710
      Begin VB.TextBox txtExchangeRate 
         Height          =   285
         Left            =   1755
         TabIndex        =   25
         Tag             =   "7710"
         Top             =   2085
         Width           =   1650
      End
      Begin VB.TextBox txtCrAccNo 
         Height          =   285
         Left            =   5055
         TabIndex        =   23
         Tag             =   "7710"
         Top             =   1620
         Width           =   2160
      End
      Begin VB.TextBox txtPaymentAmt 
         Height          =   285
         Left            =   5055
         TabIndex        =   20
         Tag             =   "7710"
         Top             =   1125
         Width           =   2535
      End
      Begin VB.TextBox txtValueYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   3150
         TabIndex        =   19
         Tag             =   "7710"
         Top             =   1125
         Width           =   765
      End
      Begin VB.ComboBox cmbValueMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   2430
         TabIndex        =   18
         Tag             =   "7710"
         Text            =   "01"
         Top             =   1125
         Width           =   630
      End
      Begin VB.ComboBox cmbValueDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   1740
         TabIndex        =   17
         Tag             =   "7710"
         Text            =   "01"
         Top             =   1125
         Width           =   615
      End
      Begin VB.TextBox txtTransAmt 
         Height          =   285
         Left            =   5055
         TabIndex        =   10
         Tag             =   "7710"
         Top             =   690
         Width           =   2535
      End
      Begin VB.TextBox txtDebitAccNo 
         Height          =   285
         Left            =   1755
         TabIndex        =   9
         Tag             =   "7710"
         Top             =   1605
         Width           =   1650
      End
      Begin VB.TextBox txtTransRefNo 
         Height          =   285
         Left            =   1965
         TabIndex        =   8
         Tag             =   "7710"
         Top             =   255
         Width           =   2535
      End
      Begin VB.ComboBox cmbTransferPurpose 
         Height          =   315
         Left            =   5040
         TabIndex        =   7
         Tag             =   "7710"
         Top             =   2100
         Width           =   2535
      End
      Begin VB.TextBox txtTransYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   3150
         TabIndex        =   6
         Tag             =   "7710"
         Top             =   690
         Width           =   765
      End
      Begin VB.ComboBox cmbTransMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   2430
         TabIndex        =   5
         Tag             =   "7710"
         Text            =   "01"
         Top             =   690
         Width           =   630
      End
      Begin VB.ComboBox cmbTransDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   1740
         TabIndex        =   4
         Tag             =   "7710"
         Text            =   "01"
         Top             =   690
         Width           =   615
      End
      Begin VB.TextBox txtBranchCode 
         Height          =   285
         Left            =   1770
         TabIndex        =   3
         Tag             =   "7710"
         Top             =   2610
         Width           =   2535
      End
      Begin VB.Label lblExchangeRate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Exchange Rate"
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
         Left            =   135
         TabIndex        =   26
         Tag             =   "7710"
         Top             =   2085
         Width           =   1320
      End
      Begin VB.Label lblCrAccNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Credit A/c No"
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
         Left            =   3765
         TabIndex        =   24
         Tag             =   "7710"
         Top             =   1650
         Width           =   1185
      End
      Begin VB.Label lblValueDate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Value Date "
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
         Left            =   150
         TabIndex        =   22
         Tag             =   "7710"
         Top             =   1185
         Width           =   1020
      End
      Begin VB.Label lblPaymentAmt 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment Amt"
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
         Left            =   3930
         TabIndex        =   21
         Tag             =   "7710"
         Top             =   1155
         Width           =   1110
      End
      Begin VB.Label lblTransDate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Transaction Date "
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
         Left            =   150
         TabIndex        =   16
         Tag             =   "7710"
         Top             =   750
         Width           =   1545
      End
      Begin VB.Label lblTransAmt 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Amount "
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
         Left            =   4125
         TabIndex        =   15
         Tag             =   "7710"
         Top             =   720
         Width           =   705
      End
      Begin VB.Label lblDrAccNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Debit A/c No"
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
         Left            =   150
         TabIndex        =   14
         Tag             =   "7710"
         Top             =   1650
         Width           =   1140
      End
      Begin VB.Label lblBpRefNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "BP Reference No "
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
         Left            =   165
         TabIndex        =   13
         Tag             =   "7710"
         Top             =   300
         Width           =   1740
      End
      Begin VB.Label lblTransferPurpose 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Transfer Purpose"
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
         Left            =   3420
         TabIndex        =   12
         Tag             =   "7710"
         Top             =   2100
         Width           =   1470
      End
      Begin VB.Label lblBranchCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Branch Code"
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
         Left            =   120
         TabIndex        =   11
         Tag             =   "7710"
         Top             =   2610
         Width           =   1110
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   3585
      TabIndex        =   0
      ToolTipText     =   "Cancel"
      Top             =   3885
      Width           =   1095
   End
   Begin VB.Label lblSwiftFinancialInfo 
      BackColor       =   &H00BFD87E&
      Caption         =   "SWIFT Financial Information"
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
      Left            =   2070
      TabIndex        =   1
      Top             =   90
      Width           =   4365
   End
End
Attribute VB_Name = "frmSwiftFinancialInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOk_Click()
    Dim tmpStr As String
    
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmSwiftFinancialInfo, 8265
       frmSwiftFinancialInfo.RightToLeft = True
       frameTransDetails.RightToLeft = True
    End If
    
    frmSwiftFinancialInfo.Caption = frmSwiftTransferFinancialInfoCaption(0, UserLang)
    lblSwiftFinancialInfo.Caption = frmSwiftTransferFinancialInfoCaption(0, UserLang)
    frameTransDetails.Caption = frmSwiftTransferFinancialInfoCaption(1, UserLang)
    lblBpRefNo.Caption = frmSwiftTransferFinancialInfoCaption(2, UserLang)
    lblTransDate.Caption = frmSwiftTransferFinancialInfoCaption(3, UserLang)
    lblTransAmt.Caption = frmSwiftTransferFinancialInfoCaption(4, UserLang)
    lblValueDate.Caption = frmSwiftTransferFinancialInfoCaption(5, UserLang)
    lblPaymentAmt.Caption = frmSwiftTransferFinancialInfoCaption(6, UserLang)
    lblDrAccNo.Caption = frmSwiftTransferFinancialInfoCaption(7, UserLang)
    lblCrAccNo.Caption = frmSwiftTransferFinancialInfoCaption(8, UserLang)
    lblExchangeRate.Caption = frmSwiftTransferFinancialInfoCaption(9, UserLang)
    lblTransferPurpose.Caption = frmSwiftTransferFinancialInfoCaption(10, UserLang)
    lblBranchCode.Caption = frmSwiftTransferFinancialInfoCaption(11, UserLang)
    cmdExit.Caption = frmSwiftTransferFinancialInfoCaption(12, UserLang)
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
