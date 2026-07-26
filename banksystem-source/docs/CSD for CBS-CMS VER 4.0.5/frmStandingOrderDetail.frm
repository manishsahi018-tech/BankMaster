VERSION 5.00
Begin VB.Form frmStandingOrderDetail 
   BackColor       =   &H00BFD87E&
   Caption         =   "Standing Order Detail"
   ClientHeight    =   3210
   ClientLeft      =   945
   ClientTop       =   1515
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3210
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor Comments"
      Height          =   375
      Left            =   960
      TabIndex        =   67
      ToolTipText     =   "Supervisor Comments"
      Top             =   7920
      Width           =   1935
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   375
      Left            =   2880
      TabIndex        =   66
      ToolTipText     =   "Reject"
      Top             =   7920
      Width           =   1695
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "Approve"
      Height          =   375
      Left            =   4560
      TabIndex        =   65
      ToolTipText     =   "Approve"
      Top             =   7920
      Width           =   1695
   End
   Begin VB.Frame frameStdOrdDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   6975
      Left            =   120
      TabIndex        =   37
      Top             =   840
      Width           =   11775
      Begin VB.ComboBox cmbCustBranchCode 
         Enabled         =   0   'False
         Height          =   315
         Left            =   8640
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   5760
         Width           =   1935
      End
      Begin VB.TextBox txtRemarks 
         Height          =   285
         Left            =   2280
         MaxLength       =   25
         TabIndex        =   26
         Tag             =   "11775"
         Top             =   5760
         Width           =   3735
      End
      Begin VB.TextBox txtCustName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   5760
         TabIndex        =   76
         Tag             =   "11775"
         Top             =   0
         Width           =   2295
      End
      Begin VB.TextBox txtLastUpdateYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   10680
         TabIndex        =   75
         Top             =   6480
         Width           =   735
      End
      Begin VB.ComboBox cmbLastUpdateMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   10080
         TabIndex        =   74
         Top             =   6480
         Width           =   615
      End
      Begin VB.ComboBox cmbLastUpdateDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   9480
         TabIndex        =   73
         Top             =   6480
         Width           =   615
      End
      Begin VB.TextBox txtLastUpdateUser 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6360
         TabIndex        =   71
         Top             =   6480
         Width           =   1455
      End
      Begin VB.TextBox txtPayeeName 
         Height          =   285
         Left            =   7080
         TabIndex        =   69
         Top             =   4200
         Width           =   2895
      End
      Begin VB.TextBox txtAcctNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   1800
         MaxLength       =   14
         TabIndex        =   40
         Tag             =   "11775"
         Top             =   0
         Width           =   2175
      End
      Begin VB.TextBox txtSoNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   9720
         MaxLength       =   6
         TabIndex        =   1
         Tag             =   "11775"
         Top             =   0
         Width           =   1335
      End
      Begin VB.ComboBox cmbSoType 
         Height          =   315
         Left            =   1800
         TabIndex        =   2
         Tag             =   "11775"
         Top             =   480
         Width           =   2175
      End
      Begin VB.ComboBox cmbPayType 
         Height          =   315
         Left            =   5760
         TabIndex        =   3
         Tag             =   "11775"
         Top             =   480
         Width           =   2295
      End
      Begin VB.ComboBox cmbPayFreq 
         Height          =   315
         Left            =   1800
         TabIndex        =   5
         Top             =   1080
         Width           =   2175
      End
      Begin VB.ComboBox cmbFirstPayDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9360
         TabIndex        =   7
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbFirstPayMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9960
         TabIndex        =   8
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtFirstPayYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   10560
         MaxLength       =   4
         TabIndex        =   9
         Tag             =   "11775"
         Top             =   1080
         Width           =   615
      End
      Begin VB.ComboBox cmbNextPayDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   9360
         TabIndex        =   28
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1680
         Width           =   615
      End
      Begin VB.ComboBox cmbNextPayMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   9960
         TabIndex        =   29
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1680
         Width           =   615
      End
      Begin VB.TextBox txtNextPayYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   10560
         MaxLength       =   4
         TabIndex        =   30
         Tag             =   "11775"
         Top             =   1680
         Width           =   615
      End
      Begin VB.ComboBox cmbFinalPayDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   2040
         TabIndex        =   10
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1680
         Width           =   615
      End
      Begin VB.ComboBox cmbFinalPayMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   2640
         TabIndex        =   11
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1680
         Width           =   615
      End
      Begin VB.TextBox txtFinalPayYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   3240
         MaxLength       =   4
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   1680
         Width           =   615
      End
      Begin VB.ComboBox cmbLastProcessDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   5760
         TabIndex        =   31
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1680
         Width           =   615
      End
      Begin VB.ComboBox cmbLastProcessMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   6360
         TabIndex        =   32
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1680
         Width           =   615
      End
      Begin VB.TextBox txtLastProcessYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   6960
         MaxLength       =   4
         TabIndex        =   33
         Tag             =   "11775"
         Top             =   1680
         Width           =   615
      End
      Begin VB.TextBox txtNoOfPayments 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   6960
         MaxLength       =   3
         TabIndex        =   6
         Tag             =   "11775"
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtNoOfPaymentsMade 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2880
         MaxLength       =   3
         TabIndex        =   34
         Tag             =   "11775"
         Top             =   2160
         Width           =   615
      End
      Begin VB.Frame frameCommission 
         Height          =   495
         Left            =   5760
         TabIndex        =   39
         Tag             =   "11775"
         Top             =   2040
         Width           =   1455
         Begin VB.OptionButton optCommYes 
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   13
            Tag             =   "1455"
            Top             =   120
            Width           =   615
         End
         Begin VB.OptionButton optCommNo 
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   14
            Tag             =   "1455"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame frameNextDay 
         Height          =   495
         Left            =   2040
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   2640
         Width           =   3735
         Begin VB.OptionButton optProcessSameDay 
            Caption         =   "Process Same Day"
            Height          =   315
            Left            =   120
            TabIndex        =   15
            Tag             =   "3735"
            Top             =   120
            Value           =   -1  'True
            Width           =   1695
         End
         Begin VB.OptionButton optProcessNextDay 
            Caption         =   "Process Next Day"
            Height          =   255
            Left            =   1920
            TabIndex        =   16
            Tag             =   "3735"
            Top             =   120
            Width           =   1695
         End
      End
      Begin VB.TextBox txtPayAmt 
         Height          =   285
         Left            =   2280
         TabIndex        =   18
         Tag             =   "11775"
         Top             =   3360
         Width           =   2175
      End
      Begin VB.TextBox txtAmtPaidToDate 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7080
         TabIndex        =   19
         Top             =   3360
         Width           =   2175
      End
      Begin VB.TextBox txtTotalAmtToPay 
         Height          =   285
         Left            =   2280
         TabIndex        =   20
         Tag             =   "11775"
         Top             =   3840
         Width           =   2175
      End
      Begin VB.TextBox txtPayeeAcc 
         Height          =   285
         Left            =   7080
         MaxLength       =   14
         TabIndex        =   21
         Top             =   3840
         Width           =   2175
      End
      Begin VB.TextBox txtDrNarrative1 
         Height          =   285
         Left            =   2280
         TabIndex        =   22
         Tag             =   "11775"
         Top             =   4680
         Width           =   3735
      End
      Begin VB.TextBox txtDrNarrative2 
         Height          =   285
         Left            =   6600
         TabIndex        =   23
         Tag             =   "11775"
         Top             =   4680
         Width           =   3735
      End
      Begin VB.TextBox txtCrNarrative1 
         Height          =   285
         Left            =   2280
         TabIndex        =   24
         Tag             =   "11775"
         Top             =   5160
         Width           =   3735
      End
      Begin VB.TextBox txtCrNarrative2 
         Height          =   285
         Left            =   6600
         TabIndex        =   25
         Tag             =   "11775"
         Top             =   5160
         Width           =   3735
      End
      Begin VB.ComboBox cmbBranchCode 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2280
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   6480
         Width           =   1935
      End
      Begin VB.TextBox txtThreshold 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7440
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   2760
         Width           =   2175
      End
      Begin VB.ComboBox cmbPayMode 
         Height          =   315
         Left            =   9360
         TabIndex        =   4
         Tag             =   "11775"
         Top             =   480
         Width           =   2175
      End
      Begin VB.Label lblCustBranchCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Customer Branch Code"
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
         Left            =   6120
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   5760
         Width           =   2535
      End
      Begin VB.Line Line4 
         Tag             =   "11775"
         X1              =   0
         X2              =   11760
         Y1              =   6240
         Y2              =   6240
      End
      Begin VB.Label lblRemarks 
         BackColor       =   &H00BFD87E&
         Caption         =   "Remarks"
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
         TabIndex        =   78
         Tag             =   "11775"
         Top             =   5760
         Width           =   1815
      End
      Begin VB.Label lblCustName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Name "
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
         Left            =   4200
         TabIndex        =   77
         Tag             =   "11775"
         Top             =   0
         Width           =   1575
      End
      Begin VB.Label lblUpdateDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Update Date"
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
         Left            =   7920
         TabIndex        =   72
         Top             =   6480
         Width           =   1455
      End
      Begin VB.Label lblLastUpdateUserId 
         BackColor       =   &H00BFD87E&
         Caption         =   "Last update user"
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
         Left            =   4320
         TabIndex        =   70
         Top             =   6480
         Width           =   1935
      End
      Begin VB.Label lblPayeeName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payee Name"
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
         Left            =   4680
         TabIndex        =   68
         Top             =   4200
         Width           =   2295
      End
      Begin VB.Label lblAccountNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Account No"
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
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   0
         Width           =   1335
      End
      Begin VB.Label lblSoNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "S/O Number"
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
         Left            =   8160
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   0
         Width           =   1455
      End
      Begin VB.Label lblSoType 
         BackColor       =   &H00BFD87E&
         Caption         =   "S/O Type"
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
         TabIndex        =   62
         Tag             =   "11775"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label lblPayType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Pay Type"
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
         Left            =   4200
         TabIndex        =   61
         Tag             =   "11775"
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label lblPayMode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Pay Mode"
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
         Left            =   8160
         TabIndex        =   60
         Tag             =   "11775"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label lblPayFreq 
         BackColor       =   &H00BFD87E&
         Caption         =   "Pay Freq."
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
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.Label lblFirstPayDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "First Pay Date"
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
         Left            =   7680
         TabIndex        =   58
         Tag             =   "11775"
         Top             =   1080
         Width           =   1575
      End
      Begin VB.Label lblNextPayDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Next Pay Date"
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
         Left            =   7680
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   1680
         Width           =   1575
      End
      Begin VB.Label lblFinalPayDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Final Pay Date"
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
         Tag             =   "11775"
         Top             =   1680
         Width           =   1575
      End
      Begin VB.Label lblLastProcessDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Last Process Dt"
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
         Left            =   3960
         TabIndex        =   55
         Top             =   1680
         Width           =   1695
      End
      Begin VB.Label lblNoOfPayments 
         BackColor       =   &H00BFD87E&
         Caption         =   "No of Payments to Make"
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
         Left            =   4200
         TabIndex        =   54
         Tag             =   "11775"
         Top             =   1080
         Width           =   2535
      End
      Begin VB.Label lblNoOfPaymentsMade 
         BackColor       =   &H00BFD87E&
         Caption         =   "No of Payments Made"
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
         TabIndex        =   53
         Tag             =   "11775"
         Top             =   2160
         Width           =   2415
      End
      Begin VB.Label lblCommFlag 
         BackColor       =   &H00BFD87E&
         Caption         =   "Commission Flag"
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
         Left            =   3840
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   2160
         Width           =   1935
      End
      Begin VB.Label lblNextDayFlag 
         BackColor       =   &H00BFD87E&
         Caption         =   "Next Day Flag"
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
         Tag             =   "11775"
         Top             =   2760
         Width           =   1575
      End
      Begin VB.Label lblPaymentAmount 
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
         Left            =   360
         TabIndex        =   50
         Tag             =   "11775"
         Top             =   3360
         Width           =   1815
      End
      Begin VB.Label lblAmtPaidToDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Amt Paid To Date"
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
         Left            =   4680
         TabIndex        =   49
         Tag             =   "11775"
         Top             =   3360
         Width           =   2055
      End
      Begin VB.Label lblTotalAmtToPay 
         BackColor       =   &H00BFD87E&
         Caption         =   "Total Amt to pay"
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
         Tag             =   "11775"
         Top             =   3840
         Width           =   1815
      End
      Begin VB.Label lblPayeeAcNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payee Account"
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
         Left            =   4680
         TabIndex        =   47
         Tag             =   "11775"
         Top             =   3840
         Width           =   2175
      End
      Begin VB.Label lblDrNarrative1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Dr Narrative  1"
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
         TabIndex        =   46
         Tag             =   "11775"
         Top             =   4680
         Width           =   1815
      End
      Begin VB.Line Line1 
         Tag             =   "11775"
         X1              =   0
         X2              =   11760
         Y1              =   3240
         Y2              =   3240
      End
      Begin VB.Line Line2 
         Tag             =   "11775"
         X1              =   0
         X2              =   11760
         Y1              =   4560
         Y2              =   4560
      End
      Begin VB.Label lblDrNarrative2 
         BackColor       =   &H00BFD87E&
         Caption         =   "  2"
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
         Left            =   6360
         TabIndex        =   45
         Tag             =   "11775"
         Top             =   4680
         Width           =   375
      End
      Begin VB.Label lblCrNarrative1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Cr Narrative  1"
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
         TabIndex        =   44
         Tag             =   "11775"
         Top             =   5160
         Width           =   1815
      End
      Begin VB.Label lblCrNarrative2 
         BackColor       =   &H00BFD87E&
         Caption         =   "  2"
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
         Left            =   6360
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   5160
         Width           =   375
      End
      Begin VB.Line Line3 
         Tag             =   "11775"
         X1              =   0
         X2              =   11760
         Y1              =   5520
         Y2              =   5520
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
         Left            =   360
         TabIndex        =   42
         Tag             =   "11775"
         Top             =   6480
         Width           =   1575
      End
      Begin VB.Label lblThreshold 
         BackColor       =   &H00BFD87E&
         Caption         =   "Threshold"
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
         Left            =   6000
         TabIndex        =   41
         Tag             =   "11775"
         Top             =   2760
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   7920
      TabIndex        =   36
      ToolTipText     =   "Cancel"
      Top             =   7920
      Width           =   1695
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Create/Update"
      Height          =   375
      Left            =   6240
      TabIndex        =   27
      ToolTipText     =   "Create/Update"
      Top             =   7920
      Width           =   1695
   End
   Begin VB.Label lblStandingDetail 
      BackColor       =   &H00BFD87E&
      Caption         =   "Standing Order Detail"
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
      Left            =   4080
      TabIndex        =   0
      Top             =   120
      Width           =   4695
   End
End
Attribute VB_Name = "frmStandingOrderDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmbBranchcode_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbBranchCode.text)) <> 0 Then
         tCode = Mid$(cmbBranchCode.text, 1, 4)
         For i = 0 To cmbBranchCode.ListCount
             If Mid$(cmbBranchCode.List(i), 1, 4) = tCode Then
                cmbBranchCode.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceBranchCode(UserLang)   '"Branch Code Cannot be spaces.. Please enter.."
         cmbBranchCode.SetFocus
         Exit Sub
      End If
        
      If i > cmbBranchCode.ListCount Then
         MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbBranchCode.SetFocus
      End If
   End If
End Sub

Private Sub cmbFinalPayDate_Change()
    If Not stdOrdSearchAction Then
       If Len(RTrim(cmbFinalPayDate.text)) <> 0 Then
          If Len(cmbFinalPayDate.text) = 2 Then
             If cmbFinalPayDate < 1 Or _
                cmbFinalPayDate > 31 Then
                MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
                cmbFinalPayDate.text = ""
                cmbFinalPayDate.SetFocus
             Else
                On Error Resume Next
                cmbFinalPayMonth.SetFocus
             End If
         End If
       End If
    End If
End Sub

Private Sub cmbFinalPayMonth_Change()
     If Not stdOrdSearchAction Then
       If Len(RTrim(cmbFinalPayMonth.text)) <> 0 Then
          If Len(cmbFinalPayMonth.text) = 2 Then
             If cmbFinalPayMonth < 1 Or _
                cmbFinalPayMonth > 12 Then
                MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
                cmbFinalPayMonth.text = ""
                cmbFinalPayMonth.SetFocus
             Else
                On Error Resume Next
                txtFinalPayYear.SetFocus
             End If
         End If
       End If
    End If
End Sub

Private Sub cmbFirstPayDate_Change()
    If Not stdOrdSearchAction Then
       If Len(RTrim(cmbFirstPayDate.text)) <> 0 Then
          If Len(cmbFirstPayDate.text) = 2 Then
             If cmbFirstPayDate < 1 Or _
                cmbFirstPayDate > 31 Then
                MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
                cmbFirstPayDate.text = ""
                cmbFirstPayDate.SetFocus
             Else
                On Error Resume Next
                cmbFirstPayMonth.SetFocus
             End If
         End If
       End If
    End If
End Sub

Private Sub cmbFirstPayMonth_Change()
    If Not stdOrdSearchAction Then
       If Len(RTrim(cmbFirstPayMonth.text)) <> 0 Then
          If Len(cmbFirstPayMonth.text) = 2 Then
             If cmbFirstPayMonth < 1 Or _
                cmbFirstPayMonth > 12 Then
                MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
                cmbFirstPayMonth.text = ""
                cmbFirstPayMonth.SetFocus
             Else
                On Error Resume Next
                txtFirstPayYear.SetFocus
             End If
         End If
       End If
    End If
End Sub

Private Sub cmbPayFreq_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbPayFreq.text)) <> 0 Then
         tCode = Mid$(cmbPayFreq.text, 1, 1)
         For i = 0 To cmbPayFreq.ListCount
             If Mid$(cmbPayFreq.List(i), 1, 1) = tCode Then
                cmbPayFreq.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpacePayFreq(UserLang)
         cmbPayFreq.SetFocus
         Exit Sub
      End If
        
      If i > cmbPayFreq.ListCount Then
         MsgBox errInvalidPayFreq(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbPayFreq.SetFocus
      End If
   End If
End Sub

Private Sub cmbPayMode_LostFocus()
Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbPayMode.text)) <> 0 Then
         tCode = Mid$(cmbPayMode.text, 1, 1)
         For i = 0 To cmbPayMode.ListCount
             If Mid$(cmbPayMode.List(i), 1, 1) = tCode Then
                cmbPayMode.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpacePayMode(UserLang)
         cmbPayMode.SetFocus
         Exit Sub
      End If
        
      If i > cmbPayMode.ListCount Then
         MsgBox errInvalidPayMode(UserLang)
         cmbPayMode.SetFocus
      End If
   End If

End Sub

Private Sub cmbPayType_Click()
tCode = Mid$(cmbPayType.text, 1, 1)
If tCode = "3" Then
   txtNoOfPayments.Enabled = True
   txtNoOfPayments = ""
Else
   txtNoOfPayments.Enabled = False
   If Len(RTrim(txtNoOfPayments)) <> 0 Then
      txtNoOfPayments.text = "  "
   End If
End If
End Sub

Private Sub cmbPayType_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbPayType.text)) <> 0 Then
         tCode = Mid$(cmbPayType.text, 1, 1)
         For i = 0 To cmbPayType.ListCount
             If Mid$(cmbPayType.List(i), 1, 1) = tCode Then
                cmbPayType.ListIndex = i
                If tCode = "3" Then
                   txtNoOfPayments.Enabled = True
                Else
                   txtNoOfPayments.Enabled = False
                   'txtNoOfPayments.Text = "  "
                End If
                Exit For
             End If
         Next i
      Else
         MsgBox errSpacePayType(UserLang)
         cmbPayType.SetFocus
         Exit Sub
      End If
        
      If i > cmbPayType.ListCount Then
         MsgBox errInvalidPayType(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbPayType.SetFocus
      End If
   End If

End Sub

Private Sub cmbSoType_Click()
Dim tCode As String
Dim tmpPayFreq As String
tCode = Mid$(cmbSoType.text, 1, 1)
If tCode = "1" Then
   txtThreshold.Enabled = True
Else
   txtThreshold.Enabled = False
   If Len(RTrim(txtThreshold)) <> 0 Then
      txtThreshold = "   "
   End If
End If
If tCode <> "0" Then
   tmpPayFreq = "D"
   For i = 0 To cmbPayFreq.ListCount
       If Mid$(cmbPayFreq.List(i), 1, 1) = tmpPayFreq Then
          cmbPayFreq.ListIndex = i
          Exit For
       End If
   Next i
   cmbPayFreq.Enabled = False
Else
   cmbPayFreq.Enabled = True
End If
End Sub

Private Sub cmbSoType_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbSoType.text)) <> 0 Then
         tCode = Mid$(cmbSoType.text, 1, 1)
         For i = 0 To cmbSoType.ListCount
             If Mid$(cmbSoType.List(i), 1, 1) = tCode Then
                cmbSoType.ListIndex = i
                If tCode = "1" Then
                   txtThreshold.Enabled = True
                Else
                   txtThreshold.Enabled = False
                   txtThreshold.text = "     "
                End If
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceSoType(UserLang)
         cmbSoType.SetFocus
         Exit Sub
      End If
        
      If i > cmbSoType.ListCount Then
         MsgBox errInvalidSoType(UserLang)
         cmbSoType.SetFocus
      End If
   End If

End Sub

Private Sub cmdApprove_Click()
   Dim tuserId As String, tDateTime As String, tBranchCode As String, tSupervisorId As String
   Dim tCustNo As String
   
   frmStdOrdPendingList.stdOrdPendingGrid.Col = 0
   tuserId = Format(frmStdOrdPendingList.stdOrdPendingGrid.text, "!@@@@@@@@@@")
   frmStdOrdPendingList.stdOrdPendingGrid.Col = 1
   tDateTime = Format(frmStdOrdPendingList.stdOrdPendingGrid.text, "00000000000000")
      
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
    
   SendMsg = "000268" & "52" & gBranchCode & "A" & tuserId & tDateTime & _
             frmStandingOrderDetail.txtAcctNo & frmStandingOrderDetail.txtSoNo & _
             tSupervisorId & Space(200) & recvStdOrdDetail.newOrUpdate & Space(50)
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmStandingOrderDetail.MousePointer = vbHourglass
   
   cmdApprove.Enabled = False
   cmdCancel.Enabled = False
   cmdCreate.Enabled = False
   cmdReject.Enabled = False
   
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmStandingOrderDetail.MousePointer = vbDefault
      cmdApprove.Enabled = True
      cmdCancel.Enabled = True
      cmdCreate.Enabled = False
      cmdReject.Enabled = True
      Exit Sub
   End If
   
   frmStandingOrderDetail.MousePointer = vbDefault
   cmdApprove.Enabled = True
   cmdCancel.Enabled = True
   cmdCreate.Enabled = False
   cmdReject.Enabled = True
   
   If recvStdOrdApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
      If recvStdOrdDetail.newOrUpdate = "N" Then
         MsgBox errSodNoAssined(UserLang) & recvStdOrdApprovalMsg.sodNo
      End If
   Else
      If UserLang = ARABIC Then
         MsgBox recvStdOrdApprovalMsg.aRemarks
      Else
         MsgBox recvStdOrdApprovalMsg.eRemarks
      End If
   End If
   If Len(Trim(frmStdOrdPendingList.txtCustomerNo)) = 0 Then
      tCustNo = Space(7)
   Else
      tCustNo = Format(frmStdOrdPendingList.txtCustomerNo, "0000000")
   End If
   
   Unload Me
   Unload frmStdOrdPendingList
   frmEnquiry.readSodPendingList "00000", "S", tCustNo
'   If UserLang = ARABIC Then
'      ChangePositions frmStdOrdPendingList, 11800
'      frmStdOrdPendingList.RightToLeft = True
'   End If
'   frmStdOrdPendingList.Show

End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdCreate_Click()
    Dim tDate As String
    Dim tCustNo As String
    
    If recvStdOrdDetail.newOrUpdate <> "U" And stdOrdUpdateAction = False Then
       If validateFrmStdOrd = 1 Then
          Exit Sub
       End If
    End If
    
    formatStdOrdRequest
    SendMsg = stdOrdInfo.msgLen & stdOrdInfo.service & stdOrdInfo.homeBranch & _
              stdOrdInfo.userId & stdOrdInfo.dateTime & stdOrdInfo.creationOrUpdate & stdOrdInfo.newOrUpdate & _
              stdOrdInfo.accNo & stdOrdInfo.sodNo & stdOrdInfo.orderType & stdOrdInfo.paymentType & _
              stdOrdInfo.paymentMode & stdOrdInfo.paymentFrequency & stdOrdInfo.firstPaymentDate & _
              stdOrdInfo.nextPaymentDate & stdOrdInfo.finalPaymentDate & _
              stdOrdInfo.lastProcessedDate & stdOrdInfo.paymentsToBeMade & _
              stdOrdInfo.paymentsMade & stdOrdInfo.limitInExcessFlag & _
              stdOrdInfo.commissionFlag & stdOrdInfo.processNextDayFlag & _
              stdOrdInfo.thresholdAmt & stdOrdInfo.paymentAmt & stdOrdInfo.totalPaidToDate & _
              stdOrdInfo.totalToPay & stdOrdInfo.payAccNo & stdOrdInfo.drNarrative1 & stdOrdInfo.drNarrative2 & _
              stdOrdInfo.crNarrative1 & stdOrdInfo.crNarrative2 & stdOrdInfo.transactionDateFlag & _
              stdOrdInfo.branchCode & stdOrdInfo.remarks
              
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False

    frmStandingOrderDetail.MousePointer = vbHourglass
             
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmStandingOrderDetail.MousePointer = vbDefault
       Exit Sub
    End If
    
    If recvCustomerMsg.status = "000" Then
       MsgBox errSuccessful(UserLang)
'       If stdOrdInfo.creationOrUpdate = "C" Then
'          MsgBox "SOD Number assigned is " & recvCustomerMsg.custNo
'       End If
    Else
       If UserLang = ENGLISH Then
          MsgBox recvCustomerMsg.eRemarks
       Else
          MsgBox recvCustomerMsg.aRemarks
       End If
    End If
    
    frmStandingOrderDetail.MousePointer = vbDefault
    If stdOrdTellerAction Then
       Unload Me
       If Len(Trim(frmStdOrdPendingList.txtCustomerNo)) = 0 Then
          tCustNo = Space(7)
       Else
          tCustNo = Format(frmStdOrdPendingList.txtCustomerNo, "0000000")
       End If
       Unload frmStdOrdPendingList
       frmEnquiry.readSodPendingList "00000", "T", tCustNo
'       If UserLang = ARABIC Then
'          ChangePositions frmStdOrdPendingList, 11800
'          frmStdOrdPendingList.RightToLeft = True
'       End If
'       frmStdOrdPendingList.Show
    Else
       If recvCustomerMsg.status = "000" Then
          Unload Me
       End If
    End If
              
End Sub

Private Sub cmdReject_Click()
    frmStdOrdRejection.Show vbModal
End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox recvStdOrdDetail.supervisorComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim mQry As String
   
   If UserLang = ARABIC Then
      ChangePositions frmStandingOrderDetail, 11800
      frmStandingOrderDetail.RightToLeft = True
      frmStandingOrderDetail.txtPayeeName.Alignment = 1
   End If
   
   frmStandingOrderDetail.Caption = frmStdOrdDetailCaption(0, UserLang)
   frmStandingOrderDetail.lblStandingDetail.Caption = frmStdOrdDetailCaption(0, UserLang)
   frmStandingOrderDetail.lblAccountNo.Caption = frmStdOrdDetailCaption(1, UserLang)
   frmStandingOrderDetail.lblSoNo.Caption = frmStdOrdDetailCaption(2, UserLang)
   frmStandingOrderDetail.lblSoType.Caption = frmStdOrdDetailCaption(3, UserLang)
   frmStandingOrderDetail.lblPayType.Caption = frmStdOrdDetailCaption(4, UserLang)
   frmStandingOrderDetail.lblPayMode.Caption = frmStdOrdDetailCaption(5, UserLang)
   frmStandingOrderDetail.lblPayFreq.Caption = frmStdOrdDetailCaption(6, UserLang)
   frmStandingOrderDetail.lblFirstPayDate.Caption = frmStdOrdDetailCaption(7, UserLang)
   frmStandingOrderDetail.lblNextPayDate.Caption = frmStdOrdDetailCaption(8, UserLang)
   frmStandingOrderDetail.lblFinalPayDate.Caption = frmStdOrdDetailCaption(9, UserLang)
   frmStandingOrderDetail.lblLastProcessDate.Caption = frmStdOrdDetailCaption(10, UserLang)
   frmStandingOrderDetail.lblNoOfPayments.Caption = frmStdOrdDetailCaption(11, UserLang)
   frmStandingOrderDetail.lblNoOfPaymentsMade.Caption = frmStdOrdDetailCaption(12, UserLang)
   frmStandingOrderDetail.lblCommFlag.Caption = frmStdOrdDetailCaption(14, UserLang)
   frmStandingOrderDetail.optCommYes.Caption = frmCustomerCaption(34, UserLang)
   frmStandingOrderDetail.optCommNo.Caption = frmCustomerCaption(35, UserLang)
   frmStandingOrderDetail.lblNextDayFlag.Caption = frmStdOrdDetailCaption(15, UserLang)
   frmStandingOrderDetail.optProcessSameDay.Caption = frmStdOrdDetailCaption(33, UserLang)
   frmStandingOrderDetail.optProcessNextDay.Caption = frmStdOrdDetailCaption(34, UserLang)
   frmStandingOrderDetail.lblThreshold.Caption = frmStdOrdDetailCaption(16, UserLang)
   frmStandingOrderDetail.lblPaymentAmount.Caption = frmStdOrdDetailCaption(17, UserLang)
   frmStandingOrderDetail.lblAmtPaidToDate.Caption = frmStdOrdDetailCaption(18, UserLang)
   frmStandingOrderDetail.lblTotalAmtToPay.Caption = frmStdOrdDetailCaption(19, UserLang)
   frmStandingOrderDetail.lblPayeeAcNo.Caption = frmStdOrdDetailCaption(20, UserLang)
   frmStandingOrderDetail.lblDrNarrative1.Caption = frmStdOrdDetailCaption(21, UserLang)
   frmStandingOrderDetail.lblCrNarrative1.Caption = frmStdOrdDetailCaption(22, UserLang)
   frmStandingOrderDetail.lblBranchCode.Caption = frmStdOrdDetailCaption(24, UserLang)
   frmStandingOrderDetail.lblLastUpdateUserId.Caption = frmStdOrdDetailCaption(30, UserLang)
   frmStandingOrderDetail.lblUpdateDate.Caption = frmStdOrdDetailCaption(31, UserLang)
   frmStandingOrderDetail.cmdSupervisorComments.Caption = frmStdOrdDetailCaption(25, UserLang)
   frmStandingOrderDetail.cmdReject.Caption = frmStdOrdDetailCaption(26, UserLang)
   frmStandingOrderDetail.cmdApprove.Caption = frmStdOrdDetailCaption(27, UserLang)
   If stdOrdUpdateAction Then
      frmStandingOrderDetail.cmdCreate.Caption = frmStdOrdDetailCaption(36, UserLang)
   Else
      frmStandingOrderDetail.cmdCreate.Caption = frmStdOrdDetailCaption(28, UserLang)
   End If
   frmStandingOrderDetail.cmdCancel.Caption = frmStdOrdDetailCaption(29, UserLang)
   frmStandingOrderDetail.lblPayeeName.Caption = frmStdOrdDetailCaption(32, UserLang)
   frmStandingOrderDetail.lblCustName.Caption = frmStdOrdDetailCaption(35, UserLang)
   frmStandingOrderDetail.lblRemarks.Caption = frmStdOrdDetailCaption(37, UserLang)
   frmStandingOrderDetail.lblCustBranchCode.Caption = frmStdOrdDetailCaption(38, UserLang)
   
   mQry = "select * from payfreqinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbPayFreq.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbPayFreq.AddItem rs("payfreqcode") & " - " & rs("englishname")
         Else
            cmbPayFreq.AddItem rs("payfreqcode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbPayFreq.ListIndex = 0
   End If
      
   mQry = "select * from sodtypeinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbSoType.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbSoType.AddItem rs("ordertype") & " - " & rs("englishname")
         Else
            cmbSoType.AddItem rs("ordertype") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbSoType.ListIndex = 0
   End If
   
   mQry = "select * from paymenttypeinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbPayType.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbPayType.AddItem rs("paymenttype") & " - " & rs("englishname")
         Else
            cmbPayType.AddItem rs("paymenttype") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbPayType.ListIndex = 0
   End If
   
   mQry = "select * from paymodeinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbPayMode.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbPayMode.AddItem rs("paymodecode") & " - " & rs("englishname")
         Else
            cmbPayMode.AddItem rs("paymodecode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbPayMode.ListIndex = 0
   End If
   
   mQry = "select * from branchinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbBranchCode.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbBranchCode.AddItem rs("branchcode") & " - " & rs("englishname")
         Else
            cmbBranchCode.AddItem rs("branchcode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbBranchCode.ListIndex = 0
   End If
   cmbFirstPayDate.Clear
   cmbNextPayDate.Clear
   cmbFinalPayDate.Clear
   cmbLastProcessDate.Clear
   cmbFirstPayMonth.Clear
   cmbNextPayMonth.Clear
   cmbFinalPayMonth.Clear
   cmbLastProcessMonth.Clear
      
   For i = 1 To 31
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbFirstPayDate.AddItem num
       cmbNextPayDate.AddItem num
       cmbFinalPayDate.AddItem num
       cmbLastProcessDate.AddItem num
       If i < 13 Then
          cmbFirstPayMonth.AddItem num
          cmbNextPayMonth.AddItem num
          cmbFinalPayMonth.AddItem num
          cmbLastProcessMonth.AddItem num
       End If
   Next
   cmbFirstPayDate.text = "01"
   cmbFirstPayMonth.text = "01"
   cmbNextPayDate.text = "01"
   cmbNextPayMonth.text = "01"
   cmbNextPayMonth.text = "01"
   cmbFinalPayDate.text = "01"
   cmbFinalPayMonth.text = "01"
   cmbLastProcessDate.text = "01"
   cmbLastProcessMonth.text = "01"
      
   If stdOrdUpdateAction Then
      'updateDisable
      frameStdOrdDetails.Enabled = False
      cmdCreate.Enabled = True
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      cmdSupervisorComments.Enabled = False
   ElseIf stdOrdSearchAction Then
      frameStdOrdDetails.Enabled = False
      cmdCreate.Enabled = False
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      cmdSupervisorComments.Enabled = False
   ElseIf stdOrdSupervisorAction = True Then
      frameStdOrdDetails.Enabled = False
      cmdCreate.Enabled = False
      cmdApprove.Enabled = True
      cmdReject.Enabled = True
      cmdSupervisorComments.Enabled = True
   ElseIf stdOrdTellerAction = True Then
      frameStdOrdDetails.Enabled = True
      cmdCreate.Enabled = True
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      cmdSupervisorComments.Enabled = True
   Else
      frameStdOrdDetails.Enabled = True
      cmdCreate.Enabled = True
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      cmdSupervisorComments.Enabled = False
   End If
   
End Sub

Private Sub updateDisable()
    txtSoNo.Enabled = False
    cmbSoType.Enabled = False
    cmbPayType.Enabled = False
    cmbPayMode.Enabled = False
    cmbPayFreq.Enabled = False
    cmbFirstPayDate.Enabled = False
    cmbFirstPayMonth.Enabled = False
    txtFirstPayYear.Enabled = False
    cmbNextPayDate.Enabled = False
    cmbNextPayMonth.Enabled = False
    txtNextPayYear.Enabled = False
    cmbFinalPayDate.Enabled = False
    cmbFinalPayMonth.Enabled = False
    txtFinalPayYear.Enabled = False
    cmbLastProcessDate.Enabled = False
    cmbLastProcessMonth.Enabled = False
    txtLastProcessYear.Enabled = False
    txtNoOfPayments.Enabled = False
    txtNoOfPaymentsMade.Enabled = False
'    cmbLimitFlag.Enabled = False
    frameCommission.Enabled = False
    optProcessSameDay.Enabled = False
    optProcessNextDay.Enabled = False
    txtThreshold.Enabled = False
    txtPayAmt.Enabled = False
    txtAmtPaidToDate.Enabled = False
    txtTotalAmtToPay.Enabled = False
    txtPayeeAcc.Enabled = False
    txtDrNarrative1.Enabled = False
    txtDrNarrative2.Enabled = False
    txtCrNarrative1.Enabled = False
    txtCrNarrative2.Enabled = False
'    optUseRunDate.Enabled = False
'    optUseDueDate.Enabled = False
    cmbBranchCode.Enabled = False
 End Sub
 
Public Function validateFrmStdOrd() As Integer

    Dim tFirstPayDate As String
    Dim tNextPayDate As String
    Dim tFinalPayDate As String
    
    validateFrmStdOrd = 0
    
'    If Len(RTrim(txtSoNo)) = 0 Then
'       MsgBox errSpaceSoNo(UserLang)   '"SO Number cannot be spaces...Please enter.."
'       txtSoNo.SetFocus
'       validateFrmStdOrd = 1
'       Exit Function
'    Else
'       validateFrmStdOrd = 0
'    End If
    
    tFirstPayDate = txtFirstPayYear & cmbFirstPayMonth & cmbFirstPayDate
    
    If Not validDate(tFirstPayDate) Then
       MsgBox errInvalidDate(UserLang)
       cmbFirstPayDate.SetFocus
       validateFrmStdOrd = 1
       Exit Function
    Else
       validateFrmStdOrd = 0
    End If
    
    'tFirstPayDate = cmbFirstPayDate + "/" + cmbFirstPayMonth + "/" + txtFirstPayYear
'     If CDate(tFirstPayDate) < Date Then
'        MsgBox errInvalidFirstPayDate(UserLang)  ' "First Pay Date should be greater than the current date...Please Re-enter.."
'        cmbFirstPayDate.SetFocus
'        validateFrmStdOrd = 1
'        Exit Function
'     Else
'        validateFrmStdOrd = 0
'     End If
    If CLng(tFirstPayDate) < CLng(recvLoginMsg.currentDateG) Then
       MsgBox errInvalidFirstPayDate(UserLang)  ' "First Pay Date should be greater than the current date...Please Re-enter.."
       cmbFirstPayDate.SetFocus
       validateFrmStdOrd = 1
       Exit Function
    Else
       validateFrmStdOrd = 0
    End If
          
'    tFinalPayDate = txtFinalPayYear + cmbFinalPayMonth + cmbFinalPayDate
'
'    If Not validDate(tFinalPayDate) Then
'       MsgBox errInvalidDate(UserLang)
'       cmbFinalPayDate.SetFocus
'       validateFrmStdOrd = 1
'       Exit Function
'    Else
'       validateFrmStdOrd = 0
'    End If
'
'    tFinalPayDate = cmbFinalPayDate + "/" + cmbFinalPayMonth + "/" + txtFinalPayYear
'
'    If CDate(tNextPayDate) > CDate(tFinalPayDate) Then
'       MsgBox errInvalidFinalPayDate(UserLang)   '"Final pay date should later than the next pay date ...Please Re-enter"
'       cmbFinalPayDate.SetFocus
'       validateFrmStdOrd = 1
'       Exit Function
'    Else
'       validateFrmStdOrd = 0
'    End If
    
    If Mid$(frmStandingOrderDetail.cmbSoType, 1, 1) = "0" Then
       If Len(RTrim(txtPayAmt)) = 0 Then
          MsgBox errSpacePaymentAmt(UserLang)   '"Payment Amount needs to be entered...Please enter"
          txtPayAmt.SetFocus
          validateFrmStdOrd = 1
          Exit Function
        Else
          validateFrmStdOrd = 0
        End If
     End If
    
    If Len(RTrim(txtPayeeAcc)) = 0 Then
       MsgBox errSpacePayeeAccount(UserLang)  '"payee account no cannot be spaces...Please enter"
       txtPayeeAcc.SetFocus
       validateFrmStdOrd = 1
       Exit Function
    Else
       validateFrmStdOrd = 0
    End If
    
    If Mid$(txtPayeeAcc, 1, 2) <> Mid$(txtAcctNo, 1, 2) Then
       MsgBox errDifferentCurrency(UserLang)
       txtPayeeAcc.SetFocus
       validateFrmStdOrd = 1
       Exit Function
    Else
       validateFrmStdOrd = 0
    End If
    
    If Len(RTrim(txtDrNarrative1)) = 0 Then
       MsgBox errSpaceDrNarrative(UserLang)
       txtDrNarrative1.SetFocus
       validateFrmStdOrd = 1
       Exit Function
    Else
       validateFrmStdOrd = 0
    End If
    
    If Len(RTrim(txtCrNarrative1)) = 0 Then
       MsgBox errSpaceCrNarrative(UserLang)
       txtCrNarrative1.SetFocus
       validateFrmStdOrd = 1
       Exit Function
    Else
       validateFrmStdOrd = 0
    End If
    

End Function

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameStdOrdDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
