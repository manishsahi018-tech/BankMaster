VERSION 5.00
Begin VB.Form frmAccount 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account Maintenance"
   ClientHeight    =   7650
   ClientLeft      =   60
   ClientTop       =   510
   ClientWidth     =   11880
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7650
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdTimeDeposit 
      Caption         =   "Time Deposit Info"
      Height          =   375
      Left            =   6720
      TabIndex        =   95
      ToolTipText     =   "Time Deposit Info"
      Top             =   480
      Width           =   1695
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "Approve"
      Height          =   495
      Left            =   4335
      TabIndex        =   81
      ToolTipText     =   "Approve"
      Top             =   7320
      Width           =   1815
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   495
      Left            =   6165
      TabIndex        =   80
      ToolTipText     =   "Reject"
      Top             =   7320
      Width           =   1815
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   7980
      TabIndex        =   79
      ToolTipText     =   "Cancel"
      Top             =   7815
      Width           =   1695
   End
   Begin VB.CommandButton cmdHistory 
      Caption         =   "A/C Status History"
      Height          =   495
      Left            =   4350
      TabIndex        =   78
      ToolTipText     =   "A/C Status History"
      Top             =   7815
      Width           =   1815
   End
   Begin VB.CommandButton cmdSamaStatusHistory 
      Caption         =   "SAMA Status History"
      Height          =   495
      Left            =   6165
      TabIndex        =   77
      ToolTipText     =   "SAMA Status History"
      Top             =   7815
      Width           =   1815
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor Comments"
      Height          =   495
      Left            =   720
      TabIndex        =   76
      ToolTipText     =   "Supervisor Comments"
      Top             =   7320
      Width           =   1815
   End
   Begin VB.CommandButton cmdCardInfo 
      Caption         =   "ATM Card"
      Height          =   495
      Left            =   720
      TabIndex        =   75
      ToolTipText     =   "ATM Card"
      Top             =   7815
      Width           =   1815
   End
   Begin VB.CommandButton cmdCustInfo 
      Caption         =   "Customer Info"
      Height          =   495
      Left            =   2535
      TabIndex        =   74
      ToolTipText     =   "Customer Info"
      Top             =   7815
      Width           =   1815
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Create"
      Height          =   495
      Left            =   2520
      TabIndex        =   73
      ToolTipText     =   "Create"
      Top             =   7320
      Width           =   1815
   End
   Begin VB.CommandButton cmdSignatory 
      Caption         =   "Signatory"
      Height          =   495
      Left            =   7980
      TabIndex        =   72
      ToolTipText     =   "Signatory"
      Top             =   7320
      Width           =   1695
   End
   Begin VB.Frame frameAccount 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   6975
      Left            =   240
      TabIndex        =   29
      Top             =   240
      WhatsThisHelpID =   16777215
      Width           =   11535
      Begin VB.TextBox txtIbanAccNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6855
         MaxLength       =   30
         TabIndex        =   96
         Tag             =   "11535"
         Top             =   1095
         Width           =   2970
      End
      Begin VB.ComboBox cmbLastUpdCsdMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7920
         TabIndex        =   92
         Tag             =   "11535"
         Top             =   6240
         Width           =   615
      End
      Begin VB.TextBox txtLastUpdCsdYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8520
         MaxLength       =   4
         TabIndex        =   91
         Tag             =   "11535"
         Top             =   6240
         Width           =   615
      End
      Begin VB.ComboBox cmbLastUpdCsdDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7320
         TabIndex        =   90
         Tag             =   "11535"
         Top             =   6240
         Width           =   615
      End
      Begin VB.ComboBox cmbLastTransMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3000
         TabIndex        =   88
         Tag             =   "11535"
         Top             =   5760
         Width           =   615
      End
      Begin VB.TextBox txtLastTransYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3600
         MaxLength       =   4
         TabIndex        =   87
         Tag             =   "11535"
         Top             =   5760
         Width           =   615
      End
      Begin VB.ComboBox cmbLastTransDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2400
         TabIndex        =   86
         Tag             =   "11535"
         Top             =   5760
         Width           =   615
      End
      Begin VB.ComboBox cmbSupAppMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7920
         TabIndex        =   84
         Tag             =   "11535"
         Top             =   6600
         Width           =   615
      End
      Begin VB.TextBox txtSupAppYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8520
         MaxLength       =   4
         TabIndex        =   83
         Tag             =   "11535"
         Top             =   6600
         Width           =   615
      End
      Begin VB.ComboBox cmbSupAppDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7320
         TabIndex        =   82
         Tag             =   "11535"
         Top             =   6600
         Width           =   615
      End
      Begin VB.TextBox txtOtherReason 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6840
         TabIndex        =   70
         Tag             =   "11535"
         Top             =   2520
         Width           =   3975
      End
      Begin VB.ComboBox cmbReason 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2400
         TabIndex        =   68
         Tag             =   "11535"
         Text            =   "cmbReason"
         Top             =   2520
         Width           =   2295
      End
      Begin VB.ComboBox cmbSamaAccStatus 
         Enabled         =   0   'False
         Height          =   315
         Left            =   6840
         TabIndex        =   66
         Tag             =   "11535"
         Text            =   "cmbSamaAccStatus"
         Top             =   2880
         Width           =   2295
      End
      Begin VB.TextBox txtIntLastRun 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7320
         TabIndex        =   65
         Tag             =   "11535"
         Top             =   3600
         Width           =   1695
      End
      Begin VB.TextBox txtCreditLimit 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         TabIndex        =   62
         Tag             =   "11535"
         Top             =   3600
         Width           =   1815
      End
      Begin VB.Frame frameDormantFlag 
         Enabled         =   0   'False
         Height          =   405
         Left            =   6840
         TabIndex        =   58
         Tag             =   "11535"
         Top             =   1485
         Width           =   1935
         Begin VB.OptionButton optDormantNo 
            Caption         =   "No"
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
            Height          =   180
            Left            =   960
            TabIndex        =   60
            Tag             =   "1935"
            Top             =   165
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.OptionButton optDormantYes 
            Caption         =   "Yes"
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
            Height          =   180
            Left            =   120
            TabIndex        =   59
            Tag             =   "1935"
            Top             =   165
            Width           =   855
         End
      End
      Begin VB.Frame frameStmtDay 
         Height          =   450
         Left            =   6840
         TabIndex        =   57
         Tag             =   "11535"
         Top             =   1950
         Width           =   3615
         Begin VB.OptionButton opt3112 
            Caption         =   "Month End"
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
            Height          =   225
            Left            =   2040
            TabIndex        =   7
            Tag             =   "3615"
            Top             =   165
            Width           =   1455
         End
         Begin VB.OptionButton opt0131 
            Caption         =   "Br.Stmt.Day"
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
            TabIndex        =   6
            Tag             =   "3615"
            Top             =   150
            Value           =   -1  'True
            Width           =   1935
         End
      End
      Begin VB.ComboBox cmbBranchCode 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7320
         TabIndex        =   20
         Tag             =   "11535"
         Text            =   "cmbBranchCode"
         Top             =   5040
         Width           =   2295
      End
      Begin VB.TextBox txtUniqueSub 
         Height          =   285
         Left            =   7320
         MaxLength       =   2
         TabIndex        =   10
         Tag             =   "11535"
         Top             =   3240
         Width           =   735
      End
      Begin VB.ComboBox cmbLastAmendDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7320
         TabIndex        =   24
         Tag             =   "11535"
         Top             =   5760
         Width           =   615
      End
      Begin VB.TextBox txtCrIntRate 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7320
         MaxLength       =   10
         TabIndex        =   18
         Tag             =   "11535"
         Top             =   4680
         Width           =   855
      End
      Begin VB.TextBox txtMemoNote2 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7320
         TabIndex        =   22
         Tag             =   "11535"
         Top             =   5400
         Width           =   2295
      End
      Begin VB.TextBox txtIntApplDay 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7320
         TabIndex        =   16
         Tag             =   "11535"
         Top             =   4320
         Width           =   855
      End
      Begin VB.TextBox txtIntFreqCode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         TabIndex        =   15
         Tag             =   "11535"
         Top             =   4320
         Width           =   855
      End
      Begin VB.TextBox txtSupervisorId 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         TabIndex        =   23
         Tag             =   "11535"
         Top             =   6600
         Width           =   1335
      End
      Begin VB.TextBox txtLastUpdateUser 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         TabIndex        =   27
         Tag             =   "11535"
         Top             =   6240
         Width           =   1335
      End
      Begin VB.TextBox txtMemoNote1 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         TabIndex        =   21
         Tag             =   "11535"
         Top             =   5400
         Width           =   2415
      End
      Begin VB.TextBox txtCollateral 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         TabIndex        =   19
         Tag             =   "11535"
         Top             =   5040
         Width           =   2415
      End
      Begin VB.TextBox txtCurrencyName 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3480
         TabIndex        =   46
         Tag             =   "11535"
         Top             =   0
         Width           =   2895
      End
      Begin VB.TextBox txtSubAcc 
         Height          =   285
         Left            =   2400
         MaxLength       =   2
         TabIndex        =   3
         Tag             =   "11535"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtCustNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         TabIndex        =   45
         Tag             =   "11535"
         Top             =   720
         Width           =   855
      End
      Begin VB.TextBox txtMemoNo 
         Height          =   285
         Left            =   2400
         MaxLength       =   3
         TabIndex        =   1
         Tag             =   "11535"
         Top             =   360
         Width           =   495
      End
      Begin VB.TextBox txtLastAmendYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8520
         MaxLength       =   4
         TabIndex        =   26
         Tag             =   "11535"
         Top             =   5760
         Width           =   615
      End
      Begin VB.ComboBox cmbLastAmendMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7920
         TabIndex        =   25
         Tag             =   "11535"
         Top             =   5760
         Width           =   615
      End
      Begin VB.TextBox txtAccOpenYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8520
         MaxLength       =   4
         TabIndex        =   14
         Tag             =   "11535"
         Top             =   3960
         Width           =   615
      End
      Begin VB.ComboBox cmbAccOpenMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7920
         TabIndex        =   13
         Tag             =   "11535"
         Top             =   3960
         Width           =   615
      End
      Begin VB.ComboBox cmbAccOpenDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7320
         TabIndex        =   12
         Tag             =   "11535"
         Top             =   3960
         Width           =   615
      End
      Begin VB.TextBox txtUniqueNo 
         Height          =   285
         Left            =   2400
         MaxLength       =   5
         TabIndex        =   9
         Tag             =   "11535"
         Top             =   3240
         Width           =   975
      End
      Begin VB.TextBox txtPayAcctNo 
         Height          =   285
         Left            =   2400
         MaxLength       =   14
         TabIndex        =   11
         Tag             =   "11535"
         Top             =   3960
         Width           =   1815
      End
      Begin VB.TextBox txtDrIntRate 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2400
         MaxLength       =   10
         TabIndex        =   17
         Tag             =   "11535"
         Top             =   4680
         Width           =   735
      End
      Begin VB.ComboBox cmbIntApplication 
         Height          =   315
         Left            =   2400
         TabIndex        =   4
         Tag             =   "11535"
         Top             =   1440
         Width           =   2295
      End
      Begin VB.TextBox txtCustomerName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3480
         TabIndex        =   28
         Tag             =   "11535"
         Top             =   750
         Width           =   3855
      End
      Begin VB.TextBox txtCurrencyNo 
         Height          =   285
         Left            =   2400
         MaxLength       =   2
         TabIndex        =   0
         Tag             =   "11535"
         Top             =   0
         Width           =   375
      End
      Begin VB.TextBox txtAcctDesc 
         Height          =   285
         Left            =   3480
         MaxLength       =   30
         TabIndex        =   2
         Tag             =   "11535"
         Top             =   360
         Width           =   2895
      End
      Begin VB.ComboBox cmbAcctStatus 
         Height          =   315
         Left            =   2400
         TabIndex        =   8
         Tag             =   "11535"
         Text            =   "cmbAcctStatus"
         Top             =   2160
         Width           =   2295
      End
      Begin VB.ComboBox cmbStmtFreq 
         Height          =   315
         Left            =   2400
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Tag             =   "11535"
         Top             =   1800
         Width           =   2295
      End
      Begin VB.Label lblIbanAccNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "IBAN"
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
         Left            =   5895
         TabIndex        =   97
         Tag             =   "11535"
         Top             =   1095
         Width           =   1155
      End
      Begin VB.Label lblLastAmendStDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Last Amend CSD Date"
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
         TabIndex        =   93
         Tag             =   "11535"
         Top             =   6240
         Width           =   2295
      End
      Begin VB.Label lblLastTransDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Last Trans Date"
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
         Left            =   360
         TabIndex        =   89
         Tag             =   "11535"
         Top             =   5760
         Width           =   1815
      End
      Begin VB.Label lblSupAppDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Supervisor App. Date"
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
         Left            =   4620
         TabIndex        =   85
         Tag             =   "11535"
         Top             =   6600
         Width           =   2595
      End
      Begin VB.Label lblOtherReason 
         BackColor       =   &H00BFD87E&
         Caption         =   "Other Reason"
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
         Left            =   5280
         TabIndex        =   71
         Tag             =   "11535"
         Top             =   2520
         Width           =   1575
      End
      Begin VB.Label lblReason 
         BackColor       =   &H00BFD87E&
         Caption         =   "A/c status upd reason"
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
         Height          =   495
         Left            =   360
         TabIndex        =   69
         Tag             =   "11535"
         Top             =   2520
         Width           =   1935
         WordWrap        =   -1  'True
      End
      Begin VB.Line Line1 
         Tag             =   "11535"
         X1              =   0
         X2              =   11520
         Y1              =   6120
         Y2              =   6120
      End
      Begin VB.Label lblSamaAccStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "SAMA Status"
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
         Left            =   5280
         TabIndex        =   67
         Tag             =   "11535"
         Top             =   2880
         Width           =   1575
      End
      Begin VB.Label lblIntLastRun 
         BackColor       =   &H00BFD87E&
         Caption         =   "Int Last Run"
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
         Left            =   5280
         TabIndex        =   64
         Tag             =   "11535"
         Top             =   3600
         Width           =   1935
      End
      Begin VB.Label lblCrLimit 
         BackColor       =   &H00BFD87E&
         Caption         =   "Credit Limit"
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
         Left            =   360
         TabIndex        =   63
         Tag             =   "11535"
         Top             =   3600
         Width           =   1335
      End
      Begin VB.Label lblDormant 
         BackColor       =   &H00BFD87E&
         Caption         =   "Dormant "
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
         Left            =   5880
         TabIndex        =   61
         Tag             =   "11535"
         Top             =   1575
         Width           =   975
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
         Left            =   360
         TabIndex        =   56
         Tag             =   "11535"
         Top             =   6600
         Width           =   1695
      End
      Begin VB.Label lblIntFreqCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Int Freq Code"
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
         Left            =   360
         TabIndex        =   55
         Tag             =   "11535"
         Top             =   4320
         Width           =   1695
      End
      Begin VB.Label lblLastAmendUser 
         BackColor       =   &H00BFD87E&
         Caption         =   "Last Amend user"
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
         Left            =   360
         TabIndex        =   54
         Tag             =   "11535"
         Top             =   6240
         Width           =   1815
      End
      Begin VB.Label lblIntApplDay 
         BackColor       =   &H00BFD87E&
         Caption         =   "Int Appl Day"
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
         Left            =   5280
         TabIndex        =   53
         Tag             =   "11535"
         Top             =   4320
         Width           =   1575
      End
      Begin VB.Label lblMemoNote2 
         BackColor       =   &H00BFD87E&
         Caption         =   "Memo Note-2"
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
         Left            =   5280
         TabIndex        =   52
         Tag             =   "11535"
         Top             =   5400
         Width           =   1575
      End
      Begin VB.Label lblMemoNote1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Memo Note-1"
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
         Left            =   360
         TabIndex        =   51
         Tag             =   "11535"
         Top             =   5400
         Width           =   1575
      End
      Begin VB.Label lblCollateral 
         BackColor       =   &H00BFD87E&
         Caption         =   "Collateral"
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
         Left            =   360
         TabIndex        =   50
         Tag             =   "11535"
         Top             =   5040
         Width           =   1575
      End
      Begin VB.Label lblSubAc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Sub Account"
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
         Left            =   360
         TabIndex        =   49
         Tag             =   "11535"
         Top             =   1080
         Width           =   1575
      End
      Begin VB.Label lblLedger 
         BackColor       =   &H00BFD87E&
         Caption         =   "Ledger"
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
         Left            =   360
         TabIndex        =   48
         Tag             =   "11535"
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label lblCrPerc 
         BackColor       =   &H00BFD87E&
         Caption         =   "%"
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
         Left            =   8160
         TabIndex        =   47
         Tag             =   "11535"
         Top             =   4680
         Width           =   255
      End
      Begin VB.Label lblDrPerc 
         BackColor       =   &H00BFD87E&
         Caption         =   "%"
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
         Left            =   3120
         TabIndex        =   44
         Tag             =   "11535"
         Top             =   4680
         Width           =   255
      End
      Begin VB.Label lblLastAmendDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Last Amend Date"
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
         Left            =   5280
         TabIndex        =   43
         Tag             =   "11535"
         Top             =   5760
         Width           =   1815
      End
      Begin VB.Label lblAcOpenDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "A/c Open Date"
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
         Left            =   5280
         TabIndex        =   42
         Tag             =   "11535"
         Top             =   3960
         Width           =   1695
      End
      Begin VB.Label lblUniqueSub 
         BackColor       =   &H00BFD87E&
         Caption         =   "Unique Sub"
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
         Left            =   5280
         TabIndex        =   41
         Tag             =   "11535"
         Top             =   3240
         Width           =   1455
      End
      Begin VB.Label lblUniqueNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Unique No"
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
         Left            =   360
         TabIndex        =   40
         Tag             =   "11535"
         Top             =   3240
         Width           =   1215
      End
      Begin VB.Label lblStmtDay 
         BackColor       =   &H00BFD87E&
         Caption         =   "Statement Day"
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
         Left            =   5160
         TabIndex        =   39
         Tag             =   "11535"
         Top             =   2040
         Width           =   1575
      End
      Begin VB.Label lblPayAcctNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Pay Account No"
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
         Left            =   360
         TabIndex        =   38
         Tag             =   "11535"
         Top             =   3960
         Width           =   1695
      End
      Begin VB.Label lblCrIntRate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Cr Interest Rate"
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
         Left            =   5280
         TabIndex        =   37
         Tag             =   "11535"
         Top             =   4680
         Width           =   1695
      End
      Begin VB.Label lblDrIntRate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Dr Interest Rate"
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
         Left            =   360
         TabIndex        =   36
         Tag             =   "11535"
         Top             =   4680
         Width           =   1695
      End
      Begin VB.Label lblIntApplication 
         BackColor       =   &H00BFD87E&
         Caption         =   "Int. Application"
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
         Left            =   360
         TabIndex        =   35
         Tag             =   "11535"
         Top             =   1440
         Width           =   1815
      End
      Begin VB.Label lblCustomer 
         BackColor       =   &H00BFD87E&
         Caption         =   "Customer No"
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
         Left            =   360
         TabIndex        =   34
         Tag             =   "11535"
         Top             =   720
         Width           =   1695
      End
      Begin VB.Label lblAcctStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Account Status"
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
         Left            =   360
         TabIndex        =   33
         Tag             =   "11535"
         Top             =   2160
         Width           =   1575
      End
      Begin VB.Label lblStmtFreq 
         BackColor       =   &H00BFD87E&
         Caption         =   "Stmt. Frequency"
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
         Left            =   360
         TabIndex        =   32
         Tag             =   "11535"
         Top             =   1800
         Width           =   1695
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
         Left            =   5280
         TabIndex        =   31
         Tag             =   "11535"
         Top             =   5040
         Width           =   1455
      End
      Begin VB.Label lblCurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Currency"
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
         Left            =   360
         TabIndex        =   30
         Tag             =   "11535"
         Top             =   0
         Width           =   1815
      End
   End
   Begin VB.Label lblHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "History"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00400000&
      Height          =   210
      Left            =   10680
      TabIndex        =   94
      Top             =   7350
      Visible         =   0   'False
      Width           =   615
   End
End
Attribute VB_Name = "frmAccount"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmbAcctStatus_Click()
      If accUpdateAction Or _
         (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
         If Mid$(cmbAcctStatus, 1, 2) <> recvAccPendingDetail.accStatus Then
            cmbReason.Enabled = True
         Else
            cmbReason.Enabled = False
        End If
      End If
End Sub

Private Sub cmbAcctStatus_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbAcctStatus.text)) <> 0 Then
         tCode = Mid$(cmbAcctStatus.text, 1, 2)
         For i = 0 To cmbAcctStatus.ListCount
             If Mid$(cmbAcctStatus.List(i), 1, 2) = tCode Then
                cmbAcctStatus.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceAccStatus(UserLang)
         cmbAcctStatus.SetFocus
         Exit Sub
      End If
        
      If i > cmbAcctStatus.ListCount Then
         MsgBox errInvalidAcctStatus(UserLang)
         cmbAcctStatus.SetFocus
      End If
      If accUpdateAction Then
         If Mid$(cmbAcctStatus, 1, 2) <> recvAccPendingDetail.accStatus Then
            cmbReason.Enabled = True
         Else
            cmbReason.Enabled = False
        End If
      End If
   End If
End Sub

Private Sub cmbIntApplication_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbIntApplication.text)) <> 0 Then
         tCode = Mid$(cmbIntApplication.text, 1, 1)
         For i = 0 To cmbIntApplication.ListCount
             If Mid$(cmbIntApplication.List(i), 1, 1) = tCode Then
                cmbIntApplication.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceIntAppl(UserLang)
         cmbIntApplication.SetFocus
         Exit Sub
      End If
        
      If i > cmbIntApplication.ListCount Then
         MsgBox errInvalidIntAppl(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbIntApplication.SetFocus
      End If
   End If

End Sub

Private Sub cmbReason_Click()
    If Mid$(cmbReason, 1, 2) = "00" Then
       txtOtherReason.Enabled = True
    Else
       txtOtherReason.Enabled = False
    End If
End Sub

Private Sub cmbReason_LostFocus()
    If Mid$(cmbReason, 1, 2) = "00" Then
       txtOtherReason.Enabled = True
    Else
       txtOtherReason.Enabled = False
    End If
End Sub

Private Sub cmdApprove_Click()
   Dim tUserid As String, tDateTime As String, tBranchCode As String, tSupervisorId As String
   Dim tAccNo As String
   Dim strmsglen As String
  
'   If realOrPseudo = "1" Then
'      If updateBp = 1 Then
'         unloadAcctForms
'         Exit Sub
'      End If
'   End If
   
'   frmAcctPendingList.accPendingGrid.Col = 0
'   tuserId = Format(frmAcctPendingList.accPendingGrid.text, "!@@@@@@@@@@")
'   frmAcctPendingList.accPendingGrid.Col = 1
'   tDateTime = Format(frmAcctPendingList.accPendingGrid.text, "00000000000000")
'   tBranchCode = gBranchCode
'
'   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
'
'   SendMsg = "000268" & "34" & gBranchCode & "A" & tuserId & tDateTime & _
'             tSupervisorId & Space(200) & recvAccPendingDetail.newOrUpdate & Space(50)
'
'   strmsglen = Format(Len(SendMsg), "000000")
'   Mid$(SendMsg, 1, 6) = strmsglen
'   DataReceivedFlag = False
'   frmAccount.MousePointer = vbHourglass
'
'   frmAccount.cmdApprove.Enabled = False
'   frmAccount.cmdCancel.Enabled = False
'   frmAccount.cmdCreate.Enabled = False
'   frmAccount.cmdReject.Enabled = False
'
'   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
'   If ReturnStatus = LocalCommsError Then
'      LoadError = True
'      frmAccount.MousePointer = vbDefault
'      frmAccount.cmdApprove.Enabled = True
'      frmAccount.cmdCancel.Enabled = True
'      frmAccount.cmdCreate.Enabled = False
'      frmAccount.cmdReject.Enabled = True
'      Exit Sub
'   End If
'
'   frmAccount.MousePointer = vbDefault
'   frmAccount.cmdApprove.Enabled = True
'   frmAccount.cmdCancel.Enabled = True
'   frmAccount.cmdCreate.Enabled = False
'   frmAccount.cmdReject.Enabled = True
'
'   If recvAccApprovalMsg.status = "000" Then
'      MsgBox errSuccessful(UserLang)
'      If recvAccPendingDetail.newOrUpdate = "N" Then
'         MsgBox errAccNoIs(UserLang) & ":" & recvAccApprovalMsg.accNo & Chr$(13) & _
'         Mid$(recvAccApprovalMsg.ibanAccNo, 1, 2) & errIban(UserLang) & ":" & Mid$(recvAccApprovalMsg.ibanAccNo, 3)
'      End If
'   Else
'      If UserLang = ARABIC Then
'         MsgBox recvAccApprovalMsg.aRemarks
'      Else
'         MsgBox recvAccApprovalMsg.eRemarks
'      End If
'      unloadAcctForms
'      Exit Sub
'   End If
'   If realOrPseudo = "1" Then
'      updateBp
'   End If
'
'   unloadAcctForms
End Sub

Public Function updateBp() As Integer
   Dim updateReqd As Integer

   If openAcctFile = 1 Then
      updateBp = 1
      Exit Function
   End If
   
   updateReqd = 1
   
   AccBuf.recType = "02"
   AccBuf.accNo = Format(recvAccPendingDetail.accNo, "!@@@@@@@@@@@@@@@@@@@@")
   If recvAccPendingDetail.newOrUpdate = "U" Then
      If readAccount(recvAccPendingDetail.accNo) = 1 Then
'         closeAcct
'         updateBp = 1
'         Exit Function
         updateReqd = 0
      End If
   End If
   
   If updateReqd = 0 Then
      ' form the acctinfo to insert into BranchPower DB
      AccBuf.ledgerSubLedg = Space(4)
      Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " + _
                                "'" & Mid$(AccBuf.accNo, 1, 2) & "'")
      If rs.recordCount > 0 Then
         AccBuf.currency = rs(0)
      Else
         AccBuf.currency = "SAR"
      End If
      AccBuf.accType = Space(4)
      If txtMemoNo = "008" Then
         AccBuf.Description = Format("Current A/C", "!" & String(30, "@"))
      ElseIf txtMemoNo = "009" Then
         AccBuf.Description = Format("Saving A/C", "!" & String(30, "@"))
      Else
         AccBuf.Description = Format("Other A/C", "!" & String(30, "@"))
      End If
      AccBuf.stopBlock = Space(1)
      AccBuf.drLimit = String(18, "0")
      AccBuf.drLimitExp = String(8, "0")
      AccBuf.clearTrans = String(18, "0")
      AccBuf.bookTrans = String(18, "0")
      AccBuf.filler = Space(3)
      AccBuf.clearedBal = String(18, "0")
      AccBuf.bookBal = String(18, "0")
      AccBuf.garnHold = String(18, "0")
      AccBuf.lienHold = String(18, "0")
      AccBuf.plgeHold = String(18, "0")
      AccBuf.secRatg = "00"
      AccBuf.lastDate = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + Format(CStr(Day(Date)), "00")
      AccBuf.altAccNo = Space(20)
      AccBuf.filler1 = Space(65)
   End If
   
   AccBuf.clientNo = Format(Mid$(recvAccPendingDetail.accNo, 6, 7), "!@@@@@@@@@")
   AccBuf.pwProtected = Mid$(frmAccount.cmbAcctStatus, 2, 1)
      
   'If recvAccPendingDetail.newOrUpdate = "U" Then
   If updateReqd = 1 Then
      If updateAccount = 1 Then
         closeAcct
         updateBp = 1
         Exit Function
      End If
   Else
      If insertAccount = 1 Then
         closeAcct
         updateBp = 1
         Exit Function
      End If
   End If
   
   closeAcct
   updateBp = 0

End Function
Private Sub unloadAcctForms()
   Dim tCustNo As String
'   If Len(Trim(frmAcctPendingList.txtCustomerNo)) = 0 Then
'      tCustNo = Space(7)
'   Else
'      tCustNo = Format(frmAcctPendingList.txtCustomerNo, "0000000")
'   End If
   Unload Me
   Unload frmJuristicSignatory
   'Unload frmAcctPendingList
   frmEnquiry.readAccPendingList "00000", "S", tCustNo
'   If UserLang = ARABIC Then
'      ChangePositions frmAcctPendingList, 12000
'      frmAcctPendingList.RightToLeft = True
'   End If
'   frmAcctPendingList.Show
End Sub

Private Sub cmdCancel_Click()
   If signatoryUpdatedByCSO = True Then
      MsgBox errPressCreateToCompleteSignatoryUpd(UserLang) '"Please press create button to complete the signatory update..."
      Exit Sub
   End If
   Unload Me
   Unload frmJuristicSignatory
End Sub

Private Sub cmdCardInfo_Click()
   Dim retStr As String
   Dim tAccNo As String
   
   If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
      tAccNo = txtCurrencyNo + txtMemoNo + txtCustNo + txtSubAcc
      If Len(RTrim(tAccNo)) = 0 Then
         MsgBox errInvalidSearchCriteria(UserLang)
         Exit Sub
      End If
      
      retStr = searchCard1("00000", "0" & txtCustNo, Space(16))
      If retStr <> "-0001" Then
         cardSearchAction = True
         cardUpdateAction = False
         cardTellerAction = False
         cardSupervisorAction = False
         If UserLang = ARABIC Then
            ChangePositions frmCardGrid, 11800
            frmCardGrid.RightToLeft = True
         End If
         frmCardGrid.Show
      End If
   Else
      MsgBox errNotAuthorised(UserLang)
   End If

End Sub

Private Sub cmdCreate_Click()
   Dim tCode As String
   Dim tAccNo As String
   Dim tCustNo As String
   Dim s As String
   Dim tDecimalPlace As String
   Dim amtDenom As Integer
   Dim strmsglen As String
   Dim retStatus As String
   On Error GoTo err_handler
      
   If Len(RTrim(txtCurrencyNo)) = 0 Or _
      Len(RTrim(txtMemoNo)) = 0 Then
      MsgBox errSpaceAccNo(UserLang)  ' "Account number cannot be spaces..Please enter.."
      txtCurrencyNo.SetFocus
      Exit Sub
   End If
   
   'to avoid null characters to be populated in gld
   If Len(RTrim(txtSubAcc)) = 0 Then
      txtSubAcc = Space(2)
   End If
      
   tCode = txtMemoNo
'   Set rs = db.OpenRecordset("select arabicname,englishname from bmledgerinfo " + _
'                             "where ledgercode = '" + tCode + "'")
'   If rs.RecordCount > 0 Then
'      If UserLang = ENGLISH Then
'         txtAcctDesc = rs(1)
'      Else
'         txtAcctDesc = rs(0)
'      End If
'   End If
   
   If accUpdateAction Or (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
      If Mid$(cmbSamaAccStatus, 2, 1) = "2" And Mid$(recvAccPendingDetail.accStatus, 2, 1) = "4" Then
         If Mid$(cmbAcctStatus, 2, 1) <> Mid(recvAccPendingDetail.accStatus, 2, 1) Then
            If InStr(recvLoginMsg.authorityLevel, "~63") = 0 Then
               MsgBox errSpecialRoleNeeded(UserLang)
               cmbAcctStatus = recvAccPendingDetail.accStatus
               Exit Sub
            Else
               cmbSamaAccStatus = "00"
            End If
         End If
      End If
   End If
   
   tCode = txtCurrencyNo
   Set rs = db.OpenRecordset("select arabicname,englishname,decimalplace from currencyinfo " & _
                             "where currencycode = '" & tCode & "'")
   If rs.recordCount > 0 Then
      If UserLang = ENGLISH Then
         txtCurrencyName = rs(1)
      Else
         txtCurrencyName = rs(0)
      End If
      tDecimalPlace = rs(2)
   Else
      tDecimalPlace = "2"
   End If
   
   If tDecimalPlace = "3" Then
      amtDenom = 1000
   ElseIf tDecimalPlace = "2" Then
      amtDenom = 100
   ElseIf tDecimalPlace = "1" Then
      amtDenom = 10
   Else
      amtDenom = 1
   End If
   
   If Len(RTrim(gDateTime)) = 0 Then
      gDateTime = getUnixDateTime
      If Trim(gDateTime) = "ERROR" Then
         gDateTime = Space(14)
         Exit Sub
      End If
   End If
   
   If accUpdateAction Or (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
      If Mid$(frmAccount.cmbAcctStatus, 1, 2) <> recvAccPendingDetail.accStatus Then
         If Len(RTrim(cmbReason)) <> 0 Then
            If Mid(cmbReason, 1, 2) = "00" Then
               If Len(RTrim(txtOtherReason)) = 0 Then
                  MsgBox errSpaceReason(UserLang)
                  cmbReason.SetFocus
                  Exit Sub
               End If
            End If
         Else
            MsgBox errSpaceReason(UserLang)
            cmbReason.SetFocus
            Exit Sub
         End If
         If recvAccSearchMsg.samaSubCategory = "26" Then ' pilgrimage accounts
            If (Mid$(cmbAcctStatus, 2, 1) = "0" Or Mid$(cmbAcctStatus, 2, 1) = "8") And _
                Mid$(recvAccPendingDetail.accStatus, 2, 1) = "4" Then
               If InStr(recvLoginMsg.authorityLevel, "~64") = 0 Then
                  MsgBox errPilgrimRoleNeeded(UserLang)
                  cmbAcctStatus = recvAccPendingDetail.accStatus
                  Exit Sub
               End If
            End If
         End If
         If recvAccSearchMsg.samaSubCategory = "75" Then ' Companies under formation
            MsgBox errStatusChangeNotAllowed(UserLang)
            Exit Sub
         End If
      End If
'     If Len(Trim(txtPayAcctNo)) <> 0 Then
'        MsgBox errSpacePayeeAccount(UserLang)
'        txtPayAcctNo.SetFocus
'        Exit Sub
'     End If
  End If
   
   If Not accUpdateAction And Not (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
      If validateFrmAccount = 1 Then
         Exit Sub
      End If
   End If

   acctInfo.msgLen = "000000"
   acctInfo.service = "14"
   acctInfo.userId = Format(gUserId, "!@@@@@@@@@@")
'   If accTellerAction Then
'      acctInfo.creationOrUpdate = "U"
'      frmAcctPendingList.accPendingGrid.Col = 1
'      acctInfo.dateTime = Format(frmAcctPendingList.accPendingGrid.text, "!@@@@@@@@@@@@@@")
'      acctInfo.supervisorId = recvAccPendingDetail.supervisorId
'   Else
'      acctInfo.dateTime = gDateTime
'      acctInfo.creationOrUpdate = "C"
'      acctInfo.supervisorId = Space(20)
'   End If
   If accUpdateAction Or _
      (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
      acctInfo.newOrUpdate = "U"
   Else
      acctInfo.newOrUpdate = "N"
   End If
   
   If Len(RTrim(frmAccount.txtDrIntRate)) = 0 Then
      frmAccount.txtDrIntRate = "0"
   End If
   If Len(RTrim(frmAccount.txtCrIntRate)) = 0 Then
      frmAccount.txtCrIntRate = "0"
   End If
   
   tAccNo = Format(txtCurrencyNo, "!@@") & Format(txtMemoNo, "!@@@") & Format(txtCustNo, "!@@@@@@@") & Format(txtSubAcc, "!@@")
   
   On Error GoTo err_handler
  
   s = "1"
   acctInfo.acctNo = Format(tAccNo, "!@@@@@@@@@@@@@@")
   s = "2"
   acctInfo.accStatus = Mid$(frmAccount.cmbAcctStatus, 1, 2)
   s = "3"
   acctInfo.statementFreq = Mid$(frmAccount.cmbStmtFreq, 1, 2)
   s = "4"
   acctInfo.chequeBook = "0"
   s = "5"
   If frmAccount.opt0131 = True Then
      acctInfo.statementDay = "0"
   Else
      acctInfo.statementDay = "1"
   End If
   s = "6"
   acctInfo.droppedAcc = "0"
   s = "7"
   acctInfo.intApplication = Mid$(frmAccount.cmbIntApplication, 1, 1)
   s = "7"
   acctInfo.drIntRate = Format(Val(frmAccount.txtDrIntRate) * 1000000, "000000000")
   'acctInfo.drIntRate = Space(9)
   s = "8"
   acctInfo.crIntRate = Format(Val(frmAccount.txtCrIntRate) * 1000000, "000000000")
   'acctInfo.crIntRate = Space(9)
   s = "9"
   acctInfo.payAccNo = Format(frmAccount.txtPayAcctNo, "!@@@@@@@@@@@@@@")
   s = "10"
   acctInfo.uniqueNo = Format(frmAccount.txtUniqueNo, "!@@@@@")
   s = "11"
   acctInfo.uniqueSub = Format(frmAccount.txtUniqueSub, "!@@")
   s = "12"
   acctInfo.branchCode = Mid$(frmAccount.cmbBranchcode, 1, 4)
   s = "13"
   acctInfo.phaseFlag = "3"
   s = "14"
   acctInfo.samaAccStatus = Mid$(cmbSamaAccStatus, 1, 2)
   s = "15"
   If accUpdateAction Then
      acctInfo.initialStatus = recvAccPendingDetail.accStatus
      If recvAccPendingDetail.accStatus <> acctInfo.accStatus Then
         acctInfo.statusChanged = "1"
         acctInfo.fromStatus = recvAccPendingDetail.accStatus
         acctInfo.toStatus = acctInfo.accStatus
      Else
         acctInfo.statusChanged = "0"
         acctInfo.fromStatus = Space(2)
         acctInfo.toStatus = Space(2)
      End If
      acctInfo.initialSamaStatus = recvAccPendingDetail.samaStatus
      If recvAccPendingDetail.samaStatus <> acctInfo.samaAccStatus Then
         acctInfo.samaStatusChaged = "1"
         acctInfo.fromSamaStatus = recvAccPendingDetail.samaStatus
         acctInfo.toSamaStatus = acctInfo.samaAccStatus
      Else
         acctInfo.samaStatusChaged = "0"
         acctInfo.fromSamaStatus = Space(2)
         acctInfo.toSamaStatus = Space(2)
      End If
   Else
      If accTellerAction And recvAccPendingDetail.newOrUpdate = "U" Then
         If recvAccPendingDetail.initialStatus <> acctInfo.accStatus Then
            acctInfo.statusChanged = "1"
            acctInfo.fromStatus = recvAccPendingDetail.initialStatus
            acctInfo.toStatus = acctInfo.accStatus
         Else
            acctInfo.statusChanged = "0"
            acctInfo.fromStatus = Space(2)
            acctInfo.toStatus = Space(2)
         End If
         If recvAccPendingDetail.initialSamaStatus <> acctInfo.samaAccStatus Then
            acctInfo.samaStatusChaged = "1"
            acctInfo.fromSamaStatus = recvAccPendingDetail.initialSamaStatus
            acctInfo.toSamaStatus = acctInfo.samaAccStatus
         Else
            acctInfo.samaStatusChaged = "0"
            acctInfo.fromSamaStatus = Space(2)
            acctInfo.toSamaStatus = Space(2)
         End If
      Else
         acctInfo.statusChanged = "0"
         acctInfo.fromStatus = Space(2)
         acctInfo.toStatus = Space(2)
         acctInfo.samaStatusChaged = "0"
         acctInfo.fromSamaStatus = Space(2)
         acctInfo.toSamaStatus = Space(2)
      End If
   End If
   s = "16"
   If accTellerAction Then
      acctInfo.supervisorComments = recvAccPendingDetail.supervisorComments
   Else
      acctInfo.supervisorComments = Space(200)
   End If
   s = "17"
   acctInfo.acctDesc = txtAcctDesc
   s = "18"
   If Mid$(cmbReason.text, 1, 2) <> "00" Then
      acctInfo.accStatusChangeReason = cmbReason.text
   Else
      acctInfo.accStatusChangeReason = txtOtherReason.text
   End If
   acctInfo.creditLimt = Format(Val(frmAccount.txtCreditLimit), "000000000000")
   acctInfo.intLastRun = Format(Val(frmAccount.txtIntLastRun) * amtDenom, "00000000000000")
   acctInfo.intApplDay = Format(txtIntApplDay, "!@@")
   acctInfo.intFreqCode = Format(txtIntFreqCode, "!@@@")
   If optDormantYes Then
      acctInfo.dormantFlag = "1"
   Else
      acctInfo.dormantFlag = "0"
   End If
   
   SendMsg = acctInfo.msgLen & acctInfo.service & gBranchCode & acctInfo.branchCode & _
             acctInfo.userId & acctInfo.dateTime & acctInfo.creationOrUpdate & _
             acctInfo.acctNo & acctInfo.newOrUpdate & acctInfo.supervisorId & _
             acctInfo.accStatus & acctInfo.statementFreq & acctInfo.chequeBook & _
             acctInfo.droppedAcc & acctInfo.statementDay & acctInfo.intApplication & _
             acctInfo.crIntRate & acctInfo.drIntRate & acctInfo.payAccNo & _
             acctInfo.uniqueNo & acctInfo.uniqueSub & acctInfo.phaseFlag & acctInfo.statusChanged & _
             acctInfo.fromStatus & acctInfo.toStatus & acctInfo.supervisorComments & _
             acctInfo.acctDesc & acctInfo.initialStatus & acctInfo.samaAccStatus & acctInfo.samaStatusChaged & _
             acctInfo.fromSamaStatus & acctInfo.toSamaStatus & acctInfo.initialSamaStatus & _
             acctInfo.accStatusChangeReason & acctInfo.creditLimt & acctInfo.intLastRun & _
             acctInfo.intFreqCode & acctInfo.intApplDay & acctInfo.dormantFlag & Space(50)

   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmAccount.MousePointer = vbHourglass
   
   frmAccount.cmdApprove.Enabled = False
   frmAccount.cmdCancel.Enabled = False
   frmAccount.cmdCreate.Enabled = False
   frmAccount.cmdReject.Enabled = False
   
   retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If retStatus = LocalCommsError Then
      LoadError = True
      frmAccount.MousePointer = vbDefault
      If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
         frmAccount.cmdCreate.Enabled = True
      End If
      frmAccount.cmdApprove.Enabled = False
      frmAccount.cmdReject.Enabled = False
      frmAccount.cmdCancel.Enabled = True
      Exit Sub
   End If
   frmAccount.MousePointer = vbDefault
   If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
      frmAccount.cmdCreate.Enabled = True
   End If
   frmAccount.cmdApprove.Enabled = False
   frmAccount.cmdReject.Enabled = False
   frmAccount.cmdCancel.Enabled = True
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
      gDateTime = Space(14) ' To avoid duplicate record in stacclog file
   ElseIf recvCustomerMsg.status = "113" Then 'Pay account number not found in GL
      MsgBox errInvalidPayAccNo(UserLang)
      If accUpdateAction Or (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
         txtPayAcctNo.SetFocus
      End If
      Exit Sub
   ElseIf recvCustomerMsg.status = "123" Then 'Updated for SAMA...
      MsgBox errUpdatedForSama(UserLang)
      Exit Sub
   Else
      If UserLang = ARABIC Then
         MsgBox recvCustomerMsg.aRemarks
      Else
         MsgBox recvCustomerMsg.eRemarks
      End If
      signatoryUpdatedByCSO = False
      Exit Sub
   End If
   Unload Me
   Unload frmJuristicSignatory
   
   If accTellerAction Then
'      If Len(Trim(frmAcctPendingList.txtCustomerNo)) = 0 Then
'         tCustNo = Space(7)
'      Else
'         tCustNo = Format(frmAcctPendingList.txtCustomerNo, "0000000")
'      End If
'      Unload frmAcctPendingList
'      frmEnquiry.readAccPendingList "00000", "T", tCustNo
'      If UserLang = ARABIC Then
'         ChangePositions frmAcctPendingList, 12000
'         frmAcctPendingList.RightToLeft = True
'      End If
'      frmAcctPendingList.Show
   End If
   Exit Sub
err_handler:
    LogData "Unexpected error  " & str(Err.Number) & "  " & Err.Description & "occured in line no : " & s & "  [cmdCreate(frmAccount)] "
    Resume Next
End Sub

Private Sub cmdCustInfo_Click()
   Dim retStr As String
      
   If InStr(recvLoginMsg.authorityLevel, "~0") > 0 Then
      If Len(RTrim(txtCustNo)) = 0 Then
         MsgBox errInvalidSearchCriteria(UserLang)
         Exit Sub
      End If
      
      retStr = doSearch1("00000", txtCustNo)
      If retStr <> "-0001" Then
'         Me.Hide
         searchAction = True
         updateAction = False
         tellerAction = False
         supervisorAction = False
         custHistoryAction = False
         If UserLang = ARABIC Then
            ChangePositions frmEnquirySelect, 11800
            frmEnquirySelect.RightToLeft = True
         End If
         frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(2, UserLang)
         frmEnquirySelect.txtSearchCriteria.text = Trim(txtCustNo)
         frmEnquirySelect.Show
      End If
   Else
      MsgBox errNotAuthorised(UserLang)
   End If
End Sub

Private Sub cmdHistory_Click()
  Dim tAccNo As String
  Dim strmsglen As String
  Dim tReqDate As String, tmpStr As String
  
  tAccNo = txtCurrencyNo & txtMemoNo & txtCustNo & txtSubAcc
  
  LogData "Sending Request message for getting acct status History details for the account # : " + tAccNo
  SendMsg = "000000" & "57" & gBranchCode & tAccNo & "0" ' 0 is to denote account status history ;
                                                         ' 1 to denote sama account status history
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmAccount.MousePointer = vbHourglass
    
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmAccount.MousePointer = vbDefault
     Exit Sub
  End If
  frmAccount.MousePointer = vbDefault
    
  parseAcctStatusHistoryDetails
  If recvAcctStatusHistory.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvAcctStatusHistory.aRemarks
     Else
        MsgBox recvAcctStatusHistory.eRemarks
     End If
     Exit Sub
  End If

  frmAccount.tag = "0"
  frmAcctStatusHistory.Show
  frmAcctStatusHistory.txtAccNo = tAccNo
End Sub

Private Sub cmdSamaStatusHistory_Click()
  Dim tAccNo As String
  Dim tReqDate As String, tmpStr As String
  Dim strmsglen As String
  
  tAccNo = txtCurrencyNo & txtMemoNo & txtCustNo & txtSubAcc
  
  LogData "Sending Request message for getting acct status History details for the account # : " + tAccNo
  SendMsg = "000000" & "57" & gBranchCode & tAccNo & "1" ' 0 is to denote account status history ;
                                                         ' 1 to denote sama account status history
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmAccount.MousePointer = vbHourglass
    
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmAccount.MousePointer = vbDefault
     Exit Sub
  End If
  frmAccount.MousePointer = vbDefault
    
  parseAcctStatusHistoryDetails
  If recvAcctStatusHistory.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvAcctStatusHistory.aRemarks
     Else
        MsgBox recvAcctStatusHistory.eRemarks
     End If
     Exit Sub
  End If

  frmAccount.tag = "1"
  frmAcctStatusHistory.Show
  frmAcctStatusHistory.txtAccNo = tAccNo
End Sub

Private Sub cmdSignatory_Click()
    Dim recType As String
    Dim tmpStr As String
    Dim tUserid As String
    Dim tDateTime As String
    Dim tBranchCode As String
    Dim tCustNo As String
    Dim strmsglen As String
    Dim tSignatoryNo As String
    Dim lastRecRead As String
    Dim tAccNo As String
    Dim i As Integer
    
    tAccNo = txtCurrencyNo & txtMemoNo & txtCustNo & txtSubAcc
    If Len(RTrim(tAccNo)) = 0 Then
         MsgBox errInvalidSearchCriteria(UserLang)
         Exit Sub
    End If
    
    If Len(RTrim(gDateTime)) = 0 Then
       gDateTime = getUnixDateTime
       If Trim(gDateTime) = "ERROR" Then
          gDateTime = Space(14)
          Exit Sub
       End If
   End If
    
    mainCategoryCode = recvAccSearchMsg.samaMainCategory
    subCategoryCode = recvAccSearchMsg.samaSubCategory
    screenSetNo = "0"
    
    If Len(RTrim(mainCategoryCode)) > 0 And Len(RTrim(subCategoryCode)) > 0 Then
       Set rs = db.OpenRecordset("select arabicname, englishname from samamaincategoryinfo where maincategorycode = '" & mainCategoryCode & "'")
       If rs.recordCount > 0 Then
          If UserLang = ENGLISH Then
             mainCategoryDesc = IIf(rs(1) = "" Or IsNull(rs(1)) = True, "    ", rs(1))
          Else
             mainCategoryDesc = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
          End If
       End If
       Set rs = db.OpenRecordset("select arabicname, englishname from samasubcategoryinfo where subcategorycode = '" & subCategoryCode & "'")
       If rs.recordCount > 0 Then
          If UserLang = ENGLISH Then
             subCategoryDesc = IIf(rs(1) = "" Or IsNull(rs(1)) = True, "    ", rs(1))
          Else
             subCategoryDesc = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
          End If
       End If
    Else
       mainCategoryDesc = Space(30)
       subCategoryDesc = Space(30)
    End If
   
    frmJuristicSignatory.tag = "A"
    frmJuristicSignatory.Hide
    If accSupervisorAction Or accSearchAction Or accHistoryAction Then
       frmJuristicSignatory.cmdAdd.Enabled = False
       frmJuristicSignatory.cmdUpdate.Enabled = False
       frmJuristicSignatory.frameSignatoryIdInfo.Enabled = False
       frmJuristicSignatory.FrameSignatoryNameInfo.Enabled = False
       frmJuristicSignatory.FrameSignEnable.Enabled = False
       frmJuristicSignatory.cmbDisableReason.Enabled = False
       frmJuristicSignatory.txtDiplomaticPpNo.Enabled = False
    Else
       frmJuristicSignatory.cmdAdd.Enabled = True
       frmJuristicSignatory.cmdUpdate.Enabled = False
       frmJuristicSignatory.frameSignatoryIdInfo.Enabled = True
       frmJuristicSignatory.FrameSignatoryNameInfo.Enabled = True
       frmJuristicSignatory.FrameSignEnable.Enabled = True
       'frmJuristicSignatory.cmbDisableReason.Enabled = True
       frmJuristicSignatory.txtDiplomaticPpNo.Enabled = True
    End If
    'If Not accSupervisorAction And Not accTellerAction Then
    If accSearchAction Then
       recType = "00"
       tUserid = Space(10)
       tDateTime = Format(tAccNo, "!@@@@@@@@@@@@@@")
       tBranchCode = gBranchCode
    ElseIf accUpdateAction Then
       recType = "01"
       tUserid = Format(gUserId, "!@@@@@@@@@@")
       tDateTime = gDateTime
       tBranchCode = gBranchCode
    ElseIf accSupervisorAction Or accTellerAction Then
'       recType = "01"
'       frmAcctPendingList.accPendingGrid.Col = 0
'       tuserId = Format(frmAcctPendingList.accPendingGrid.text, "!@@@@@@@@@@")
'       frmAcctPendingList.accPendingGrid.Col = 1
'       tDateTime = Format(frmAcctPendingList.accPendingGrid.text, "00000000000000")
'       tBranchCode = gBranchCode
    ElseIf accHistoryAction Then
       recType = "01"
       frmAcctUpdateHistory.acctHistoryGrid.Col = 0
       tBranchCode = Format(frmAcctUpdateHistory.acctHistoryGrid.text, "!@@@@")
       frmAcctUpdateHistory.acctHistoryGrid.Col = 1
       tUserid = Format(frmAcctUpdateHistory.acctHistoryGrid.text, "!@@@@@@@@@@")
       frmAcctUpdateHistory.acctHistoryGrid.Col = 2
       tmpStr = frmAcctUpdateHistory.acctHistoryGrid.text
       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
       tDateTime = Format(tDateTime, "00000000000000")
    Else
       recType = "01"
       tUserid = Format(gUserId, "!@@@@@@@@@@")
       tDateTime = gDateTime
       tBranchCode = gBranchCode
    End If
    signatoryKeyUserId = tUserid
    signatoryKeyDateTime = tDateTime
    signatoryKeyBranch = tBranchCode
    
    tCustNo = Space(7)
    tSignatoryNo = "0000"
    lastRecRead = "00000"
    
    SendMsg = "000057" & "76" & gBranchCode & recType & tBranchCode & tUserid & tDateTime & tCustNo & tSignatoryNo & lastRecRead
    
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
    parseSignatoryInfoSearch
    If recvSignatorySearchMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvSignatorySearchMsg.aRemarks
       Else
          MsgBox recvSignatorySearchMsg.eRemarks
       End If
       Exit Sub
    End If

    frmAccount.MousePointer = vbDefault
    CSD_mdiForm.staticStatus.Panels(3).text = " "
    noOfSignatory = recvSignatorySearchMsg.noOfRecs
    For i = 1 To Val(recvSignatorySearchMsg.noOfRecs)
        frmJuristicSignatory.signatoryInfoGrid.Row = i
        frmJuristicSignatory.signatoryInfoGrid.Col = 0
        frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
        frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).accNo
        frmJuristicSignatory.signatoryInfoGrid.Col = 1
        frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
        frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).signatoryNo
        frmJuristicSignatory.signatoryInfoGrid.Col = 2
        frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
        frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).custShortName
        frmJuristicSignatory.signatoryInfoGrid.Col = 3
        frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
        frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).custBranchCode
        frmJuristicSignatory.signatoryInfoGrid.Col = 4
        frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
        frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).idType & "-" & recvSignatorySearchMsg.details(i).idNo
    Next i
    Do While True
        If recvSignatorySearchMsg.noOfRecs = "20" Then
           lastRecRead = recvSignatorySearchMsg.lastRecCount
           SendMsg = "000057" & "76" & gBranchCode & recType & tBranchCode & tUserid & tDateTime & tCustNo & tSignatoryNo & lastRecRead
           CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
           strmsglen = Format(Len(SendMsg), "000000")
           Mid$(SendMsg, 1, 6) = strmsglen
           DataReceivedFlag = False
           ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
           CSD_mdiForm.staticStatus.Panels(3).text = "  "
           If ReturnStatus = LocalCommsError Then
              LoadError = True
              Exit Do
           End If
           parseSignatoryInfoSearch
           If recvSignatorySearchMsg.status <> "000" Then
              If UserLang = ARABIC Then
                 MsgBox recvSignatorySearchMsg.aRemarks
              Else
                 MsgBox recvSignatorySearchMsg.eRemarks
              End If
              Exit Do
           End If
           noOfSignatory = Format(Val(recvSignatorySearchMsg.lastRecCount), "0000")
           For i = 1 To Val(recvSignatorySearchMsg.noOfRecs)
               frmJuristicSignatory.signatoryInfoGrid.Row = Val(recvSignatorySearchMsg.lastRecCount) - _
                                                            Val(recvSignatorySearchMsg.noOfRecs) + i
               frmJuristicSignatory.signatoryInfoGrid.Col = 0
               frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
               frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).accNo
               frmJuristicSignatory.signatoryInfoGrid.Col = 1
               frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
               frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).signatoryNo
               frmJuristicSignatory.signatoryInfoGrid.Col = 2
               frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
               frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).custShortName
               frmJuristicSignatory.signatoryInfoGrid.Col = 3
               frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
               frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).custBranchCode
               frmJuristicSignatory.signatoryInfoGrid.Col = 4
               frmJuristicSignatory.signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
               frmJuristicSignatory.signatoryInfoGrid.text = recvSignatorySearchMsg.details(i).idType & "-" & recvSignatorySearchMsg.details(i).idNo
           Next i
        Else
           Exit Do
        End If
     Loop
     frmJuristicSignatory.signatoryInfoGrid.Row = 1
     frmJuristicSignatory.Show
End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox recvAccPendingDetail.supervisorComments
End Sub

Private Sub cmdTimeDeposit_Click()
    Dim tUserid As String * 10
    Dim tAccNo As String * 14
    Dim tBranchCode As String * 4
    Dim tDateTime As String * 14    ''Added by Mohit on 22-Feb-2007 as change reported by Arul
    Dim strmsglen As String
    Dim tCode As String
    Dim tmpStr As String
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    If Len(RTrim(txtSubAcc)) = 0 Then
       txtSubAcc = Space(2)
    End If
    tAccNo = Format(txtCurrencyNo, "!@@") & Format(txtMemoNo, "!@@@") & Format(txtCustNo, "!@@@@@@@") & Format(txtSubAcc, "!@@")

    ''Modified by Mohit on 22-Feb-2007 as change reported by Arul
    If accHistoryAction Then
        frmAcctUpdateHistory.acctHistoryGrid.Col = 0
        tBranchCode = frmAcctUpdateHistory.acctHistoryGrid.text
        frmAcctUpdateHistory.acctHistoryGrid.Col = 1
        tUserid = frmAcctUpdateHistory.acctHistoryGrid.text
        frmAcctUpdateHistory.acctHistoryGrid.Col = 2
        tmpStr = frmAcctUpdateHistory.acctHistoryGrid.text
        tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                    Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
        tDateTime = Format(tDateTime, "00000000000000")
        SendMsg = "000000" & "AJ" & tBranchCode & "01" & tUserid & tDateTime & Space(7) & Space(50)
    Else
        SendMsg = "000000" & "AJ" & gBranchCode & "02" & tUserid & tAccNo & Space(7) & Space(50)
    End If
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
     
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
    parseTimeDepositDetail
    
    If recvTimeDepositDetailMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTimeDepositDetailMsg.aRemarks
       Else
          MsgBox recvTimeDepositDetailMsg.eRemarks
       End If
       Exit Sub
    End If
    tdSupervisorAction = False
    tdTellerAction = False
    tdSearchAction = True
    tdUpdateAction = False
    fillFrmTimeDepositOpen
    frmTimeDepositOpen.Show
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
  
  If UserLang = ARABIC Then
     ChangePositions frmAccount, 11800
     frmAccount.RightToLeft = True
     frmAccount.txtCustomerName.RightToLeft = True
     frmAccount.txtCustomerName.Alignment = 1
     frmAccount.txtAcctDesc.Alignment = 1
     frmAccount.txtCurrencyName.Alignment = 1
  End If
  
  frmAccount.Caption = frmAccountCaption(0, UserLang)
  'frmAccount.lblAcctInformation.Caption = frmAccountCaption(1, UserLang)
  frmAccount.lblCurrency.Caption = frmAccountCaption(2, UserLang)
  frmAccount.lblLedger.Caption = frmAccountCaption(3, UserLang)
  frmAccount.lblCustomer.Caption = frmAccountCaption(4, UserLang)
  frmAccount.lblSubAc.Caption = frmAccountCaption(5, UserLang)
  frmAccount.lblIntApplication.Caption = frmAccountCaption(6, UserLang)
  frmAccount.lblAcctStatus.Caption = frmAccountCaption(7, UserLang)
  frmAccount.lblDrIntRate.Caption = frmAccountCaption(8, UserLang)
  frmAccount.lblCrIntRate.Caption = frmAccountCaption(9, UserLang)
  frmAccount.lblStmtFreq.Caption = frmAccountCaption(10, UserLang)
  frmAccount.lblStmtDay.Caption = frmAccountCaption(11, UserLang)
  frmAccount.lblPayAcctNo.Caption = frmAccountCaption(12, UserLang)
  frmAccount.lblUniqueNo.Caption = frmAccountCaption(13, UserLang)
  frmAccount.lblBranchCode.Caption = frmAccountCaption(14, UserLang)
  frmAccount.lblUniqueSub.Caption = frmAccountCaption(15, UserLang)
  frmAccount.lblAcOpenDate.Caption = frmAccountCaption(16, UserLang)
  frmAccount.lblLastAmendDate.Caption = frmAccountCaption(17, UserLang)
  frmAccount.cmdSupervisorComments.Caption = frmAccountCaption(18, UserLang)
  frmAccount.cmdCreate.Caption = frmAccountCaption(19, UserLang)
  frmAccount.cmdApprove.Caption = frmAccountCaption(20, UserLang)
  frmAccount.cmdReject.Caption = frmAccountCaption(21, UserLang)
  frmAccount.cmdCancel.Caption = frmAccountCaption(22, UserLang)
  frmAccount.cmdCardInfo.Caption = frmAccountCaption(23, UserLang)
  frmAccount.cmdCustInfo.Caption = frmAccountCaption(24, UserLang)
  frmAccount.cmdHistory.Caption = frmAccountCaption(25, UserLang)
  frmAccount.lblIntApplDay.Caption = frmAccountCaption(26, UserLang)
  frmAccount.lblIntFreqCode.Caption = frmAccountCaption(27, UserLang)
  frmAccount.lblCollateral.Caption = frmAccountCaption(28, UserLang)
  frmAccount.lblMemoNote1.Caption = frmAccountCaption(29, UserLang)
  frmAccount.lblMemoNote2.Caption = frmAccountCaption(30, UserLang)
  frmAccount.lblLastAmendUser.Caption = frmAccountCaption(31, UserLang)
  frmAccount.lblSupervisorId.Caption = frmAccountCaption(32, UserLang)
  frmAccount.opt0131.Caption = frmAccountCaption(33, UserLang)
  frmAccount.opt3112.Caption = frmAccountCaption(34, UserLang)
  frmAccount.lblDormant.Caption = frmAccountCaption(35, UserLang)
  frmAccount.lblCrLimit.Caption = frmAccountCaption(36, UserLang)
  frmAccount.optDormantYes.Caption = frmAccountCaption(37, UserLang)
  frmAccount.optDormantNo.Caption = frmAccountCaption(38, UserLang)
  frmAccount.lblIntLastRun.Caption = frmAccountCaption(39, UserLang)
  frmAccount.lblReason.Caption = frmAccountCaption(40, UserLang)
  frmAccount.lblOtherReason.Caption = frmAccountCaption(41, UserLang)
  frmAccount.lblSamaAccStatus.Caption = frmAccountCaption(42, UserLang)
  frmAccount.cmdSignatory.Caption = frmAccountCaption(43, UserLang)
  frmAccount.cmdSamaStatusHistory.Caption = frmAccountCaption(44, UserLang)
  frmAccount.lblLastAmendStDate.Caption = frmAccountCaption(45, UserLang)
  frmAccount.lblSupAppDate.Caption = frmAccountCaption(46, UserLang)
  frmAccount.lblLastTransDate.Caption = frmAccountCaption(47, UserLang)
  frmAccount.cmdTimeDeposit.Caption = frmAccountCaption(48, UserLang)
  frmAccount.lblIbanAccNo.Caption = frmAccountCaption(49, UserLang)
  
  If accHistoryAction Then
      lblHistory.Visible = True
      lblHistory.Refresh
   Else
      lblHistory.Visible = False
   End If
      
  Set rs = db.OpenRecordset("select * from accountstatusinfo")
  If rs.recordCount > 0 Then
     rs.MoveFirst
     cmbAcctStatus.Clear
     Do While Not rs.EOF
        If UserLang = ENGLISH Then
           cmbAcctStatus.AddItem rs("statuscode") & " - " & rs("englishname")
        Else
           cmbAcctStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
        End If
        rs.MoveNext
     Loop
     cmbAcctStatus.ListIndex = 0
  End If
  
  Set rs = db.OpenRecordset("select * from samaacctstatusinfo")
  If rs.recordCount > 0 Then
     rs.MoveFirst
     cmbSamaAccStatus.Clear
     Do While Not rs.EOF
        If UserLang = ENGLISH Then
           cmbSamaAccStatus.AddItem rs("samastatuscode") & " - " & rs("englishname")
        Else
           cmbSamaAccStatus.AddItem rs("samastatuscode") & " - " & rs("arabicname")
        End If
        rs.MoveNext
     Loop
     cmbSamaAccStatus.ListIndex = 0
  End If

  
  Set rs = db.OpenRecordset("select * from reasoncodeinfo")
  If rs.recordCount > 0 Then
     rs.MoveFirst
     cmbReason.Clear
     Do While Not rs.EOF
        If UserLang = ENGLISH Then
           cmbReason.AddItem rs("reasoncode") & " - " & rs("englishname")
        Else
           cmbReason.AddItem rs("reasoncode") & " - " & rs("arabicname")
        End If
        rs.MoveNext
     Loop
     cmbReason.ListIndex = -1
  End If
  
  Set rs = db.OpenRecordset("select * from statementfrequencyinfo")
  If rs.recordCount > 0 Then
     rs.MoveFirst
     cmbStmtFreq.Clear
     Do While Not rs.EOF
        If UserLang = ENGLISH Then
           cmbStmtFreq.AddItem rs("frequencycode") & " - " & rs("englishname")
        Else
           cmbStmtFreq.AddItem rs("frequencycode") & " - " & rs("arabicname")
        End If
        rs.MoveNext
    Loop
  End If
  If rs.recordCount > 3 Then
     cmbStmtFreq.ListIndex = 3
  End If
   
  Set rs = db.OpenRecordset("select * from branchinfo")
  If rs.recordCount > 0 Then
     rs.MoveFirst
     cmbBranchcode.Clear
     Do While Not rs.EOF
        If UserLang = ENGLISH Then
           cmbBranchcode.AddItem rs("branchcode") & " - " & rs("englishname")
         Else
           cmbBranchcode.AddItem rs("branchcode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
     Loop
   End If
   If rs.recordCount > 1 Then
      cmbBranchcode.ListIndex = 1
   End If

   Set rs = db.OpenRecordset("select * from intappinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbIntApplication.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbIntApplication.AddItem rs("intappcode") & " - " & rs("englishname")
         Else
            cmbIntApplication.AddItem rs("intappcode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbIntApplication.ListIndex = 0
   End If
   
   frmAccount.cmdTimeDeposit.Enabled = False
   frmAccount.cmdTimeDeposit.Visible = False
   
   signatoryUpdatedByCSO = False
   If accTellerAction Then
      cmdCreate.Enabled = True
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      cmdCustInfo.Enabled = False
      cmdCardInfo.Enabled = False
      cmdSupervisorComments.Enabled = True
      frameAccount.Enabled = True
      txtPayAcctNo.Enabled = False
      If recvAccPendingDetail.newOrUpdate = "U" Then
         txtCurrencyNo.Enabled = False
         txtMemoNo.Enabled = False
         txtSubAcc.Enabled = False
      End If
      cmdTimeDeposit.Enabled = False
      cmdTimeDeposit.Visible = False
      cmdHistory.Enabled = False
      cmdSamaStatusHistory.Enabled = False
   ElseIf accSupervisorAction Then
      cmdCreate.Enabled = False
      cmdApprove.Enabled = True
      cmdReject.Enabled = True
      cmdCustInfo.Enabled = False
      cmdCardInfo.Enabled = False
      cmdSupervisorComments.Enabled = True
      frameAccount.Enabled = False
      cmdTimeDeposit.Enabled = False
      cmdTimeDeposit.Visible = False
      cmdHistory.Enabled = False
      cmdSamaStatusHistory.Enabled = False
   ElseIf accUpdateAction Then
      cmdCreate.Enabled = True
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      cmdCustInfo.Enabled = False
      cmdCardInfo.Enabled = False
      cmdSupervisorComments.Enabled = False
      frameAccount.Enabled = True
      txtCurrencyNo.Enabled = False
      txtMemoNo.Enabled = False
      txtSubAcc.Enabled = False
      txtPayAcctNo.Enabled = True
      cmdHistory.Enabled = False
      cmdSamaStatusHistory.Enabled = False
      cmdTimeDeposit.Enabled = True
      cmdTimeDeposit.Visible = True
      cmdTimeDeposit.Refresh
   ElseIf accSearchAction Or accHistoryAction Then
      cmdCreate.Enabled = False
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      frameAccount.Enabled = False
      cmdCustInfo.Enabled = True
      cmdCardInfo.Enabled = True
      If Len(RTrim(recvAccPendingDetail.supervisorComments)) > 0 Then
         cmdSupervisorComments.Enabled = True
      Else
         cmdSupervisorComments.Enabled = False
      End If
      cmdHistory.Enabled = True
      cmdSamaStatusHistory.Enabled = True
      cmdTimeDeposit.Enabled = True
      cmdTimeDeposit.Visible = True
      cmdTimeDeposit.Refresh
   Else
      cmdCreate.Enabled = True
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      cmdSupervisorComments.Enabled = False
      cmdHistory.Enabled = False
      cmdSamaStatusHistory.Enabled = False
      frameAccount.Enabled = True
      txtPayAcctNo.Enabled = False
      cmdTimeDeposit.Enabled = False
      cmdTimeDeposit.Visible = False
   End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub

Private Sub frameAccount_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtCurrencyNo_Change()
  If Not accSupervisorAction And Not accSearchAction And Not accUpdateAction And Not accTellerAction And Not accHistoryAction Then
     If Len(RTrim(txtCurrencyNo)) = 2 Then
        txtMemoNo.SetFocus
     End If
  End If
End Sub

Private Sub txtMemoNo_Change()
  If Not accSupervisorAction And Not accSearchAction And Not accUpdateAction And Not accTellerAction And Not accHistoryAction Then
     If Len(RTrim(txtMemoNo)) = 3 Then
        txtSubAcc.SetFocus
     End If
  End If
End Sub

Private Sub txtMemoNo_LostFocus()
   Dim tCode As String
   On Error Resume Next
   tCode = txtMemoNo
   Set rs = db.OpenRecordset("select arabicname,englishname from bmledgerinfo " & _
                             "where ledgercode = '" & tCode & "'")
   If rs.recordCount > 0 Then
      If UserLang = ENGLISH Then
         txtAcctDesc = IIf(rs(1) = "" Or IsNull(rs(1)) = True, "    ", rs(1))
      Else
         txtAcctDesc = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
      End If
   End If

End Sub

Private Sub txtSubAcc_Change()
  If Not accSupervisorAction And Not accSearchAction And Not accUpdateAction And Not accHistoryAction Then
     If Len(RTrim(txtSubAcc)) = 2 Then
        cmbIntApplication.SetFocus
     End If
 End If
End Sub

Public Sub parseAcctStatusHistoryDetails()
    Dim i, pos As Integer
    Dim noOfRecs As Integer
    
    recvAcctStatusHistory.status = Mid$(RecvStr, 1, 3)
    recvAcctStatusHistory.service = Mid$(RecvStr, 4, 2)
    recvAcctStatusHistory.aRemarks = Mid$(RecvStr, 6, 50)
    recvAcctStatusHistory.eRemarks = Mid$(RecvStr, 56, 50)
    recvAcctStatusHistory.noOfRecs = Mid$(RecvStr, 106, 2)
    recvAcctStatusHistory.filler = Mid$(RecvStr, 108, 10)
    pos = 118
    noOfRecs = Val(recvAcctStatusHistory.noOfRecs)
    For i = 1 To noOfRecs
        recvAcctStatusHistory.details(i).changeDate = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvAcctStatusHistory.details(i).userId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvAcctStatusHistory.details(i).supervisorId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvAcctStatusHistory.details(i).fromStatus = Mid$(RecvStr, pos, 2)
        pos = pos + 2
        recvAcctStatusHistory.details(i).toStatus = Mid$(RecvStr, pos, 2)
        pos = pos + 2
        recvAcctStatusHistory.details(i).lastUpdateDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvAcctStatusHistory.details(i).accStatusChangeReason = Mid$(RecvStr, pos, 30)
        pos = pos + 30
    Next i

End Sub

Public Function validateFrmAccount() As Integer
    Dim tCode As String

    validateFrmAccount = 0
    
    mainCategoryCode = recvAccSearchMsg.samaMainCategory
    subCategoryCode = recvAccSearchMsg.samaSubCategory
    
    If subCategoryCode = "05" Or subCategoryCode = "26" Or _
       subCategoryCode = "27" Or subCategoryCode = "28" Or _
       subCategoryCode = "29" Or subCategoryCode = "30" Or _
       subCategoryCode = "31" Or subCategoryCode = "34" Or _
       subCategoryCode = "35" Or subCategoryCode = "24" Or _
       subCategoryCode = "32" Or subCategoryCode = "33" Or _
       subCategoryCode = "25" Then
       If Mid$(txtCurrencyNo, 1, 2) <> "01" Then  ' Other than SAR account
          MsgBox errOnlySarAcAllowed(UserLang)
          txtCurrencyNo.SetFocus
          validateFrmAccount = 1
          Exit Function
       Else
          validateFrmAccount = 0
       End If
    End If 'subCategoryCode = "03" (GCC)  Or subcategory = "05"(Tribal individuals)
    
    If subCategoryCode = "07" Or subCategoryCode = "08" Then
       If txtMemoNo = "008" Or txtMemoNo = "009" Or txtMemoNo = "160" Then
           MsgBox errOnlyInternalAccAllowed(UserLang)
           validateFrmAccount = 1
           Exit Function
       Else
           validateFrmAccount = 0
       End If
    End If 'subcategorycode = 07 or 08
    
    If subCategoryCode = "75" Then
       Set rs = db.OpenRecordset("select splMemoCode from samaSubCategoryInfo where subcategorycode = '75'")
       If rs.recordCount > 0 Then
          tCode = rs(0)
          If tCode <> "" Then
             If tCode <> txtMemoNo Then
                MsgBox errOnlySplMemoAllowed(UserLang) & "[" & tCode
                validateFrmAccount = 1
                Exit Function
             Else
                validateFrmAccount = 0
                cmbAcctStatus = "04"
             End If
          End If
       Else
          MsgBox errSplMemoNotConfigured(UserLang)
          validateFrmAccount = 1
       End If
    End If
    
End Function

