VERSION 5.00
Begin VB.Form frmTimeDepositOpen 
   BackColor       =   &H00BFD87E&
   Caption         =   "Time Deposit Maintenance"
   ClientHeight    =   3195
   ClientLeft      =   2505
   ClientTop       =   480
   ClientWidth     =   4680
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdClear 
      BackColor       =   &H00000000&
      Caption         =   "Clear Above details"
      Height          =   405
      Left            =   7680
      TabIndex        =   19
      ToolTipText     =   "Clear above details"
      Top             =   3855
      Width           =   1935
   End
   Begin VB.Frame frameTdMainDetails 
      BackColor       =   &H00BFD87E&
      Height          =   2670
      Left            =   0
      TabIndex        =   48
      Top             =   1080
      Width           =   11550
      Begin VB.TextBox TxtPayAccCustName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6960
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   1320
         Width           =   3855
      End
      Begin VB.TextBox txtValueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10230
         TabIndex        =   14
         Tag             =   "11775"
         Top             =   1725
         Width           =   645
      End
      Begin VB.ComboBox cmbValueDay 
         Height          =   315
         Left            =   8880
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   1725
         Width           =   630
      End
      Begin VB.ComboBox cmbValueMonth 
         Height          =   315
         Left            =   9555
         TabIndex        =   13
         Tag             =   "11775"
         Top             =   1725
         Width           =   630
      End
      Begin VB.ComboBox cmbPayLedger 
         Height          =   315
         Left            =   7620
         TabIndex        =   7
         Tag             =   "11775"
         Top             =   840
         Width           =   1635
      End
      Begin VB.TextBox txtPayCurr 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6960
         MaxLength       =   2
         TabIndex        =   6
         Tag             =   "11775"
         Top             =   840
         Width           =   375
      End
      Begin VB.TextBox txtPayCustNo 
         Height          =   285
         Left            =   9360
         MaxLength       =   7
         TabIndex        =   8
         Tag             =   "11775"
         Top             =   840
         Width           =   855
      End
      Begin VB.TextBox txtPaySubAcc 
         Height          =   285
         Left            =   10500
         MaxLength       =   2
         TabIndex        =   9
         Tag             =   "11775"
         Top             =   840
         Width           =   375
      End
      Begin VB.TextBox txtTenor 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9960
         MaxLength       =   3
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   2220
         Width           =   660
      End
      Begin VB.ComboBox cmbTenorType 
         Height          =   315
         Left            =   8880
         TabIndex        =   16
         Tag             =   "11775"
         Top             =   2220
         Width           =   1005
      End
      Begin VB.TextBox txtTDAmount 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   2415
         MaxLength       =   14
         TabIndex        =   15
         Tag             =   "11775"
         Top             =   2220
         Width           =   2400
      End
      Begin VB.ComboBox cmbTDLedger 
         Height          =   315
         Left            =   2565
         TabIndex        =   1
         Tag             =   "11775"
         Top             =   375
         Width           =   1635
      End
      Begin VB.ComboBox cmbTDCurrency 
         Height          =   315
         Left            =   2565
         TabIndex        =   5
         Tag             =   "11775"
         Top             =   885
         Width           =   1635
      End
      Begin VB.TextBox txtSubAcc 
         Height          =   285
         Left            =   10500
         MaxLength       =   2
         TabIndex        =   4
         Tag             =   "11775"
         Top             =   360
         Width           =   375
      End
      Begin VB.TextBox txtCustomerNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   9360
         TabIndex        =   50
         Tag             =   "11775"
         Top             =   360
         Width           =   855
      End
      Begin VB.TextBox txtCurrencyNo 
         Height          =   285
         Left            =   6960
         MaxLength       =   2
         TabIndex        =   2
         Tag             =   "11775"
         Top             =   360
         Width           =   375
      End
      Begin VB.ComboBox cmbTdDebitMemo 
         Height          =   315
         Left            =   7620
         TabIndex        =   3
         Tag             =   "11775"
         Top             =   360
         Width           =   1635
      End
      Begin VB.Frame FrameIntAppln 
         Height          =   495
         Left            =   2445
         TabIndex        =   49
         Tag             =   "11775"
         Top             =   1560
         Width           =   3135
         Begin VB.OptionButton optPayAcc 
            Caption         =   "Payee a/c"
            Height          =   255
            Left            =   1680
            TabIndex        =   11
            Tag             =   "3135"
            Top             =   120
            Width           =   1335
         End
         Begin VB.OptionButton optFixedDeposit 
            Caption         =   "Fixed Deposit"
            Height          =   315
            Left            =   120
            TabIndex        =   10
            Tag             =   "3135"
            Top             =   120
            Value           =   -1  'True
            Width           =   1575
         End
      End
      Begin VB.Label LblPayAccCustName 
         BackColor       =   &H00BFD87E&
         Caption         =   "PayAccCustName"
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
         Height          =   255
         Left            =   4800
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   1320
         Width           =   2055
      End
      Begin VB.Label lblValueDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Value Date"
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
         Height          =   255
         Left            =   7170
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   1785
         Width           =   1560
      End
      Begin VB.Label lblTDTenor 
         BackColor       =   &H00BFD87E&
         Caption         =   "Tenor"
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
         Height          =   255
         Left            =   8160
         TabIndex        =   61
         Tag             =   "11775"
         Top             =   2280
         Width           =   660
      End
      Begin VB.Label lblTDAmount 
         BackColor       =   &H00BFD87E&
         Caption         =   "Deposit Amount"
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
         Height          =   255
         Left            =   900
         TabIndex        =   60
         Tag             =   "11775"
         Top             =   2280
         Width           =   1500
      End
      Begin VB.Label lblPayAccNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payee  Account Number"
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
         Height          =   255
         Left            =   4800
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   885
         Width           =   2055
      End
      Begin VB.Label lblTDLedger 
         BackColor       =   &H00BFD87E&
         Caption         =   "TD Ledger"
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
         Height          =   255
         Left            =   630
         TabIndex        =   58
         Tag             =   "11775"
         Top             =   405
         Width           =   1320
      End
      Begin VB.Label lblDepositCurr 
         BackColor       =   &H00BFD87E&
         Caption         =   "Deposit Currency"
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
         Height          =   255
         Left            =   660
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   945
         Width           =   1500
      End
      Begin VB.Label lblDebitAccNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Debit  Account Number"
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
         Height          =   255
         Left            =   4860
         TabIndex        =   56
         Tag             =   "11775"
         Top             =   360
         Width           =   1980
      End
      Begin VB.Label lblCurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Currency"
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
         Height          =   255
         Left            =   6780
         TabIndex        =   55
         Tag             =   "11775"
         Top             =   120
         Width           =   780
      End
      Begin VB.Label lblLedger 
         BackColor       =   &H00BFD87E&
         Caption         =   "Ledger"
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
         Height          =   255
         Left            =   8100
         TabIndex        =   54
         Tag             =   "11775"
         Top             =   120
         Width           =   660
      End
      Begin VB.Label lblCustomerNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Customer No."
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
         Height          =   255
         Left            =   9300
         TabIndex        =   53
         Tag             =   "11775"
         Top             =   120
         Width           =   1185
      End
      Begin VB.Label lblSubAcc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Sub A/c"
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
         Height          =   255
         Left            =   10500
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   120
         Width           =   855
      End
      Begin VB.Label lblIntAppln 
         BackColor       =   &H00BFD87E&
         Caption         =   "Interest Applied to "
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
         Height          =   255
         Left            =   765
         TabIndex        =   51
         Tag             =   "11775"
         Top             =   1680
         Width           =   1620
      End
   End
   Begin VB.TextBox txtDepositAccNo 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   330
      Left            =   2220
      MaxLength       =   14
      TabIndex        =   47
      Top             =   3855
      Width           =   1995
   End
   Begin VB.CommandButton cmdFetchRate 
      BackColor       =   &H00000000&
      Caption         =   "Fetch Time Deposit Rates"
      Height          =   405
      Left            =   4320
      TabIndex        =   18
      ToolTipText     =   "Fetch Time Deposit Rates"
      Top             =   3855
      Width           =   3255
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00BFD87E&
      Height          =   720
      Left            =   60
      TabIndex        =   44
      Top             =   7575
      Width           =   11520
      Begin VB.CommandButton cmdSupervisorComments 
         BackColor       =   &H00000000&
         Caption         =   "Supervisor comments"
         Height          =   405
         Left            =   600
         TabIndex        =   28
         Tag             =   "11520"
         ToolTipText     =   "Supervisor Comments"
         Top             =   240
         Width           =   1890
      End
      Begin VB.CommandButton cmdReject 
         BackColor       =   &H00000000&
         Caption         =   "&Reject"
         Enabled         =   0   'False
         Height          =   405
         Left            =   6840
         TabIndex        =   27
         Tag             =   "11520"
         ToolTipText     =   "Reject"
         Top             =   240
         Width           =   1890
      End
      Begin VB.CommandButton cmdApprove 
         BackColor       =   &H00000000&
         Caption         =   "&Approve"
         Enabled         =   0   'False
         Height          =   405
         Left            =   4800
         TabIndex        =   26
         Tag             =   "11520"
         ToolTipText     =   "Approve"
         Top             =   240
         Width           =   1890
      End
      Begin VB.CommandButton cmdCancel 
         BackColor       =   &H00000000&
         Caption         =   "&Cancel"
         Height          =   405
         Left            =   8880
         TabIndex        =   25
         Tag             =   "11520"
         ToolTipText     =   "Exit"
         Top             =   240
         Width           =   1890
      End
      Begin VB.CommandButton cmdCreate 
         BackColor       =   &H00000000&
         Caption         =   "&Create"
         Enabled         =   0   'False
         Height          =   405
         Left            =   2760
         TabIndex        =   24
         Tag             =   "11520"
         ToolTipText     =   "Create"
         Top             =   240
         Width           =   1890
      End
   End
   Begin VB.Frame frameTDDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Time Deposit Details"
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
      Height          =   3195
      Left            =   1800
      TabIndex        =   38
      Top             =   4395
      Width           =   7740
      Begin VB.Frame frameRenewInstr 
         Height          =   495
         Left            =   3840
         TabIndex        =   45
         Tag             =   "7740"
         Top             =   2640
         Width           =   3495
         Begin VB.OptionButton optManualRenew 
            Caption         =   "Don't Auto renew"
            Height          =   255
            Left            =   1680
            TabIndex        =   23
            Tag             =   "3495"
            Top             =   120
            Width           =   1695
         End
         Begin VB.OptionButton optAutoRenew 
            Caption         =   "Auto Renew"
            Height          =   255
            Left            =   120
            TabIndex        =   22
            Tag             =   "3495"
            Top             =   120
            Value           =   -1  'True
            Width           =   1335
         End
      End
      Begin VB.ComboBox cmbMaturityMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4935
         TabIndex        =   33
         Tag             =   "7740"
         Top             =   2265
         Width           =   630
      End
      Begin VB.ComboBox cmbMaturityDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4260
         TabIndex        =   32
         Tag             =   "7740"
         Top             =   2265
         Width           =   630
      End
      Begin VB.TextBox txtExRate 
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4260
         TabIndex        =   21
         Tag             =   "7740"
         Top             =   750
         Width           =   1995
      End
      Begin VB.TextBox txtFundingIntRate 
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   4260
         TabIndex        =   20
         Tag             =   "7740"
         Top             =   270
         Width           =   1995
      End
      Begin VB.TextBox txtMaturityYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   5610
         TabIndex        =   34
         Tag             =   "7740"
         Top             =   2265
         Width           =   645
      End
      Begin VB.TextBox txtMaturityAmt 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   330
         Left            =   4260
         TabIndex        =   31
         Tag             =   "7740"
         Top             =   1770
         Width           =   1995
      End
      Begin VB.TextBox txtDebitAmt 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   330
         Left            =   4260
         TabIndex        =   30
         Tag             =   "7740"
         Top             =   1260
         Width           =   1995
      End
      Begin VB.Label lblMaturityDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Maturity Date"
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
         Height          =   255
         Left            =   1575
         TabIndex        =   62
         Tag             =   "7740"
         Top             =   2280
         Width           =   2325
      End
      Begin VB.Label lblRenewalInstruction 
         BackColor       =   &H00BFD87E&
         Caption         =   "Renewal Instructions"
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
         Height          =   255
         Left            =   1575
         TabIndex        =   43
         Tag             =   "7740"
         Top             =   2835
         Width           =   1860
      End
      Begin VB.Label lblDebitAmount 
         BackColor       =   &H00BFD87E&
         Caption         =   "Debit Amount"
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
         Height          =   255
         Left            =   1575
         TabIndex        =   42
         Tag             =   "7740"
         Top             =   1320
         Width           =   1245
      End
      Begin VB.Label lblMaturityAmount 
         BackColor       =   &H00BFD87E&
         Caption         =   "Maturity Amount"
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
         Height          =   255
         Left            =   1575
         TabIndex        =   41
         Tag             =   "7740"
         Top             =   1830
         Width           =   1470
      End
      Begin VB.Label lblExchangeRate 
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
         Height          =   255
         Left            =   1575
         TabIndex        =   40
         Tag             =   "7740"
         Top             =   810
         Width           =   1530
      End
      Begin VB.Label lblFundingIntRate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Funding Interest Rate"
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
         Height          =   255
         Left            =   1560
         TabIndex        =   39
         Tag             =   "7740"
         Top             =   315
         Width           =   2520
      End
   End
   Begin VB.TextBox txtCustNo 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1890
      TabIndex        =   37
      Top             =   675
      Width           =   1335
   End
   Begin VB.TextBox txtCustName 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   4890
      TabIndex        =   36
      Top             =   690
      Width           =   4050
   End
   Begin VB.Label lblDepositAccNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Deposit Account Number"
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
      Height          =   375
      Left            =   720
      TabIndex        =   46
      Top             =   3900
      Width           =   1575
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11760
      Y1              =   1080
      Y2              =   1080
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   4350
      Y2              =   4350
   End
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer No."
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
      Height          =   255
      Left            =   690
      TabIndex        =   35
      Top             =   720
      Width           =   1245
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name"
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
      Height          =   255
      Left            =   3480
      TabIndex        =   29
      Top             =   735
      Width           =   1455
   End
   Begin VB.Line Line6 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      BorderWidth     =   2
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11700
      Y1              =   600
      Y2              =   600
   End
   Begin VB.Label lblTimeDepositHead 
      Alignment       =   2  'Center
      BackColor       =   &H00BFD87E&
      Caption         =   "Time Deposit A/c Opening"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   450
      Left            =   3960
      TabIndex        =   0
      Top             =   120
      Width           =   6015
   End
End
Attribute VB_Name = "frmTimeDepositOpen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public diffDays As Integer

Private Sub cmbPayLedger_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbPayLedger.text)) <> 0 Then
         tCode = Mid$(cmbPayLedger.text, 1, 3)
         For i = 0 To cmbPayLedger.ListCount
             If Mid$(cmbPayLedger.List(i), 1, 3) = tCode Then
                cmbPayLedger.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceTdLedger(UserLang)
         cmbPayLedger.SetFocus
         Exit Sub
      End If
        
      If i > cmbPayLedger.ListCount Then
         MsgBox errInvalidTdLedger(UserLang)
         cmbPayLedger.SetFocus
      End If
   End If
End Sub

Private Sub cmbTDCurrency_Change()
   If Not tdSupervisorAction And Not tdSearchAction And Not tdUpdateAction Then
      txtPayCurr = Mid$(cmbTDCurrency, 1, 2)
   End If
End Sub

Private Sub cmbTDCurrency_Click()
    If Not tdSupervisorAction And Not tdSearchAction And Not tdUpdateAction Then
       txtPayCurr = Mid$(cmbTDCurrency, 1, 2)
    End If
End Sub

Private Sub cmbTDCurrency_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbTDCurrency.text)) <> 0 Then
         tCode = Mid$(cmbTDCurrency.text, 1, 2)
         For i = 0 To cmbTDCurrency.ListCount
             If Mid$(cmbTDCurrency.List(i), 1, 2) = tCode Then
                cmbTDCurrency.ListIndex = i
                txtPayCurr = tCode
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceTdLedger(UserLang)
         cmbTDCurrency.SetFocus
         Exit Sub
      End If
        
      If i > cmbTDCurrency.ListCount Then
         MsgBox errInvalidTdCurrency(UserLang)
         cmbTDCurrency.SetFocus
      End If
   End If
End Sub

Private Sub cmbTdDebitMemo_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbTdDebitMemo.text)) <> 0 Then
         tCode = Mid$(cmbTdDebitMemo.text, 1, 3)
         For i = 0 To cmbTdDebitMemo.ListCount
             If Mid$(cmbTdDebitMemo.List(i), 1, 3) = tCode Then
                cmbTdDebitMemo.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceTdLedger(UserLang)
         cmbTdDebitMemo.SetFocus
         Exit Sub
      End If
        
      If i > cmbTdDebitMemo.ListCount Then
         MsgBox errInvalidTdLedger(UserLang)
         cmbTdDebitMemo.SetFocus
         Exit Sub
      End If
   End If
End Sub

Private Sub cmbTDLedger_LostFocus()
   Dim i As Integer
   Dim tCode As String
   Dim mQry As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbTDLedger.text)) <> 0 Then
         tCode = Mid$(cmbTDLedger.text, 1, 3)
         For i = 0 To cmbTDLedger.ListCount
             If Mid$(cmbTDLedger.List(i), 1, 3) = tCode Then
                cmbTDLedger.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceTdLedger(UserLang)
         cmbTDLedger.SetFocus
         Exit Sub
      End If
        
      If i > cmbTDLedger.ListCount Then
         MsgBox errInvalidTdLedger(UserLang)
         cmbTDLedger.SetFocus
      End If
           
           
      ''Added by Mohit on 22-Feb-2007 as change reported by Arul
      mQry = "select * from bmledgerinfo " & _
             "where ledgercode = '" & Mid$(RTrim(cmbTDLedger.text), 1, 3) & _
             "'"
     Set rs = db.OpenRecordset(mQry)
     If rs.recordCount > 0 Then
         If rs("tdRenewAllowed") <> "1" Then  'Not allowed
            optManualRenew = True
            frameRenewInstr.Enabled = False
        Else  ' Allowed
            optAutoRenew = True
            frameRenewInstr.Enabled = True
         End If
     ''till here
    End If

   End If
End Sub

Private Sub cmbTenorType_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbTenorType.text)) <> 0 Then
         tCode = Mid$(cmbTenorType.text, 1, 1)
         For i = 0 To cmbTenorType.ListCount
             If Mid$(cmbTenorType.List(i), 1, 1) = tCode Then
                cmbTenorType.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceTenorType(UserLang)
         cmbTenorType.SetFocus
         Exit Sub
      End If
        
      If i > cmbTenorType.ListCount Then
         MsgBox errInvalidTenorType(UserLang)
         cmbTenorType.SetFocus
      End If
   End If
End Sub

Private Sub cmbValueDay_Change()
   If Not tdSupervisorAction And Not tdSearchAction And Not tdUpdateAction Then
      If Len(RTrim(cmbValueDay.text)) <> 0 Then
         If Len(cmbValueDay.text) = 2 Then
            If cmbValueDay < 1 Or cmbValueDay > 31 Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbValueDay.text = ""
               cmbValueDay.SetFocus
            Else
               On Error Resume Next
               cmbValueMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbValueDay_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbValueMonth_Change()
  If Not tdSupervisorAction And Not tdSearchAction And Not tdUpdateAction Then
      If Len(RTrim(cmbValueMonth.text)) <> 0 Then
         If Len(cmbValueMonth.text) = 2 Then
            If cmbValueMonth < 1 Or cmbValueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbValueMonth.text = ""
               cmbValueMonth.SetFocus
            Else
               On Error Resume Next
               txtValueYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbValueMonth_KeyPress(KeyAscii As Integer)
   If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If
End Sub
''Added by Mohit on 22-Feb-2007 as change reported by Arul
Private Sub txtFundingIntRate_LostFocus()
On Error Resume Next ' Code written by Arshad on 26th feb 2007
    Dim maturityAmt As Double, intAmt As Double
    Dim tDecimalPlace As String
    
    Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                              "where currencycode = '" & Mid$(cmbTDCurrency, 1, 2) & "'")
                             
    If rs.recordCount > 0 Then
       tDecimalPlace = rs(0)
    Else
       tDecimalPlace = "2"
    End If

    
    intAmt = Val(txtTDAmount) * (Val(txtFundingIntRate) / 100) * Val(recvTimeDepositIntRateEnqMsg.diffDays) _
                                        / Val(recvTimeDepositIntRateEnqMsg.crBaseDays)
    maturityAmt = Val(txtTDAmount) + intAmt
    txtMaturityAmt = Format(maturityAmt, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
End Sub

''Added by Mohit on 22-Feb-2007 as change reported by Arul
Private Sub txtPayCustNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 And KeyAscii <> 46 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
  
    'code added by arshad on 27th feb 2007
     Dim tmpStr As String
        If Val(Me.txtPayCustNo.text) > "6199999" Then
             If UserLang = ARABIC Then
                        tmpStr = "—ﬁ„ Õ”«» «·„” ›Ìœ €Ì— ’ÕÌÕ"
                    Else
                        tmpStr = "Invalid Payee Account."
                    End If
                    MsgBox tmpStr
                    Me.txtPayCustNo.SetFocus
        End If
    ' change of code ends here
End Sub

Private Sub txtPayCustNo_LostFocus()
    txtPayCustNo = Format(txtPayCustNo, "0000000")
End Sub

Private Sub txtValueYear_Change()
  If Not tdSupervisorAction And Not tdSearchAction And Not tdUpdateAction Then
     On Error Resume Next
     If Len(RTrim(txtValueYear)) <> 0 Then
        If Len(txtValueYear) = 4 Then
           txtTDAmount.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtValueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtValueYear_LostFocus()
 If Not tdSupervisorAction And Not tdSearchAction And Not tdUpdateAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       On Error Resume Next
       If Len(RTrim(cmbValueDay)) > 0 And Len(RTrim(cmbValueMonth)) > 0 Then
          If Len(RTrim(txtValueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtValueYear = ""
             txtValueYear.SetFocus
             Exit Sub
          End If
       End If
    End If
    On Error GoTo 0
 End If
End Sub

Private Sub cmdApprove_Click()
    Dim tUserid As String, tDateTime As String, tBranchCode As String, tSupervisorId As String
    Dim strmsglen As String
    Dim tCustNo As String
   
'   frmTimeDepositPendingList.tdPendingGrid.Col = 0
'   tuserId = Format(frmTimeDepositPendingList.tdPendingGrid.text, "!@@@@@@@@@@")
'   frmTimeDepositPendingList.tdPendingGrid.Col = 1
'   tDateTime = Format(frmTimeDepositPendingList.tdPendingGrid.text, "00000000000000")
'
'   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
'
'   SendMsg = "000268" & "AK" & gBranchCode & "A" & tuserId & tDateTime & _
'             Format(txtDepositAccNo, "!@@@@@@@@@@@@@@") & txtCustNo & _
'             tSupervisorId & Space(200) & recvTimeDepositDetailMsg.newOrUpdate & Space(50)
'
'   strmsglen = Format(Len(SendMsg), "000000")
'   Mid$(SendMsg, 1, 6) = strmsglen
'   DataReceivedFlag = False
'   frmTimeDepositOpen.MousePointer = vbHourglass
'
'   cmdApprove.Enabled = False
'   cmdCancel.Enabled = False
'   cmdCreate.Enabled = False
'   cmdReject.Enabled = False
'
'   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
'   If ReturnStatus = LocalCommsError Then
'      LoadError = True
'      frmTimeDepositOpen.MousePointer = vbDefault
'      cmdApprove.Enabled = True
'      cmdCancel.Enabled = True
'      cmdCreate.Enabled = False
'      cmdReject.Enabled = True
'      Exit Sub
'   End If
'   parseTimeDepositApprovalMsg
'
'   frmTimeDepositOpen.MousePointer = vbDefault
'   cmdApprove.Enabled = True
'   cmdCancel.Enabled = True
'   cmdCreate.Enabled = False
'   cmdReject.Enabled = True
'
'   If recvTimeDepositApprovalMsg.status = "000" Then
'      MsgBox errSuccessful(UserLang)
'      If recvTimeDepositDetailMsg.newOrUpdate = "N" Then
'         MsgBox errTimeDepositAccNoAssigned(UserLang) & "  " & recvTimeDepositApprovalMsg.tdAccNo
'         txtDepositAccNo = recvTimeDepositApprovalMsg.tdAccNo
'      End If
'   Else
'      If UserLang = ARABIC Then
'         MsgBox recvTimeDepositApprovalMsg.aRemarks
'      Else
'         MsgBox recvTimeDepositApprovalMsg.eRemarks
'      End If
'   End If
'   If Len(Trim(frmTimeDepositPendingList.txtCustomerNo)) = 0 Then
'      tCustNo = Space(7)
'   Else
'      tCustNo = Format(frmTimeDepositPendingList.txtCustomerNo, "0000000")
'   End If
'
'   Unload Me
'   Unload frmTimeDepositPendingList
'   frmEnquiry.readTimeDepositPendingList "00000", "S", tCustNo
'   If UserLang = ARABIC Then
'      ChangePositions frmTimeDepositPendingList, 11800
'      frmTimeDepositPendingList.RightToLeft = True
'   End If
'   frmTimeDepositPendingList.Show

End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdClear_Click()
    txtFundingIntRate = ""
    txtExRate = ""
    txtDebitAmt = ""
    txtMaturityAmt = ""
    cmbMaturityDate = ""
    cmbMaturityMonth = ""
    txtMaturityYear = ""
    txtTDAmount = ""
    txtTenor = ""
    frameTDDetails.Enabled = False
    frameTdMainDetails.Enabled = True
    cmdCreate.Enabled = False
    cmdFetchRate.Enabled = True
    cmdClear.Enabled = False
End Sub

Private Sub cmdCreate_Click()
    Dim intRate As Double
    Dim exRate As Double
    Dim bmIntRate As Double
    Dim bmExRate As Double
    Dim intAmt As Double
    Dim maturityAmt As Double
    Dim minIntRate As Double, maxIntRate As Double
    Dim intRateTolerance As Integer
    Dim toleranceIntRate As Double
    Dim exRateTolerance As Integer
    Dim toleranceExRate As Double
    Dim crBaseDays As Integer
    Dim tDecimalPlace As String
    Dim amtDenom As Integer
    Dim tmpStr As String
    Dim retStatus As String
    Dim strmsglen As String
    Dim overrideIntRate As String
    Dim overrideExRate As String
    Dim overrideValueDate As String  ''Added by Mohit on 20-Feb-2007 as change Reported by Arul
    Dim tdValueDate As String   ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    Dim buyingRate As Double, sellingRate As Double, costRate As Double
'    intRate = Val(recvTimeDepositIntRateEnqMsg.intRate) / 1000000
'    exRate = Val(recvTimeDepositIntRateEnqMsg.exRate) / 100000000
    
    intRate = Val(txtFundingIntRate) * 1000000
    
    ''Modified by Mohit on 18-Feb-2007 as change requested by Mr. Shoaib Hyder (mail on 18th Feb 2007 from Arul)
''    If Mid$(cmbTDCurrency, 1, 2) <> "01" And txtCurrencyNo = "01" Then ' Cross currency deposit
''        txtExRate = txtExRate.tag
''        exRate = Val(txtExRate) * 100000000
''        txtDebitAmt = Format(Val(txtTDAmount) * exRate / 100000000, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
''    Else
''        exRate = Val(txtExRate) * 100000000
''    End If

    exRate = Val(txtExRate) * 100000000
        
    
    diffDays = 0
    overrideIntRate = "0"
    overrideExRate = "0"
    overrideValueDate = "0"     ''Added by Mohit on 20-Feb-2007 as change Reported by Arul
    
    If Not tdUpdateAction Then
       Set rs = db.OpenRecordset("select * from currencyinfo where currencyCode = '" & _
                                                Mid$(cmbTDCurrency, 1, 2) & "'")
        If rs.recordCount > 0 Then
           tDecimalPlace = rs("decimalPlace")
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
        bmIntRate = Val(recvTimeDepositIntRateEnqMsg.intRate)
        ''Added by Mohit on 20-Feb-2007 as change reported by Arul
        If Mid$(cmbTDCurrency, 1, 2) <> txtCurrencyNo Then
            bmExRate = Val(recvTimeDepositIntRateEnqMsg.exRate)
        Else
            bmExRate = 1 * 100000000
        End If
        
        diffDays = Val(recvTimeDepositIntRateEnqMsg.diffDays)
        crBaseDays = Val(recvTimeDepositIntRateEnqMsg.crBaseDays)

        minIntRate = Val(recvTimeDepositIntRateEnqMsg.minIntRate)
        maxIntRate = Val(recvTimeDepositIntRateEnqMsg.maxIntRate)
        If intRate <> bmIntRate Then
           If intRate > maxIntRate Or intRate < minIntRate Then
              If UserLang = ARABIC Then
                 tmpStr = " «·⁄„Ê·… «·„⁄ÿ«Â   " & intRate / 1000000 & " ·Ì”  ÷„‰ «·„œÏ «·„ «Õ  " & _
                          "‰”»… «·⁄„Ê·… «·›⁄·Ì… " & bmIntRate / 1000000 & "   «·Õœ «·«œ‰Ï ··⁄„Ê·…  " & minIntRate / 1000000 & _
                          " «·Õœ «·«ﬁ’Ï ··⁄„Ê·… " & maxIntRate / 1000000 & "  ; Õ«Ê· ·«Õﬁ«"
              Else
                 tmpStr = " Given Interest.Rate  " & intRate / 1000000 & "  is beyond the tolerance limit  " & _
                          "Actual Interest Rate " & bmIntRate / 1000000 & "   minIntRate  " & minIntRate / 1000000 & _
                          " maximum interest rate " & maxIntRate / 1000000 & "  ; Please try again"
              End If
              MsgBox tmpStr
              Exit Sub
           End If
           overrideIntRate = "1"
           intRate = intRate / 1000000
    
           intAmt = Val(txtTDAmount) * intRate * diffDays _
                                           / crBaseDays
           maturityAmt = Val(txtTDAmount) + (intAmt / 100)
           txtMaturityAmt = Format(maturityAmt, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
        End If
        
        ''Added by Mohit on 18-Feb-2007 as change requested by Mr. Shoaib Hyder (mail on 18th Feb 2007 from Arul)
''        If Mid$(cmbTDCurrency, 1, 2) <> "01" And txtCurrencyNo = "01" Then ' Cross currency deposit
''            If exRate = bmExRate Then
''                If UserLang = ARABIC Then
''                   tmpStr = "«—ÃÊ „·«ÕŸ… «‰ﬂ  ” Œœ„ «·”⁄— «·„ «Õ ›Ì ‰Ÿ«„ «·»«‰ﬂ „«” —... Â·  —Ìœ «·«” „—«—ø"
''                Else
''                   tmpStr = "Please note you have opted the same exchange rate as in bankmaster; Continue...?"
''                End If
''
''                If MsgBox(tmpStr, vbYesNo, "Warrning") <> vbYes Then
''                    txtExRate.SetFocus
''                    Exit Sub
''                End If
''            End If
''        End If
        
        exRateTolerance = Val(recvTimeDepositIntRateEnqMsg.fxTolerance)
        If exRate <> bmExRate Then
           toleranceExRate = exRate * exRateTolerance / 100
           'if ( exRate < currRec[currCode].exRate - fxToleranceAmt ||
               ' exRate > currRec[currCode].exRate + fxToleranceAmt)
           If exRate < bmExRate - toleranceExRate Or _
              exRate > bmExRate + toleranceExRate Then
              If UserLang = ARABIC Then
                 tmpStr = " «·”⁄— «·„⁄ÿÏ  " & exRate / 100000000 & " ·Ì” „‰ ÷„‰ «·„œÏ «·„ «Õ  " & _
                          exRateTolerance & "%  " & toleranceExRate / 100000000 & " „‰ ‰‘—… «·«”⁄«— «·⁄«œÌ… " & _
                          bmExRate / 100000000 & "  ; «·—Ã«¡ «⁄«œ… «·„Õ«Ê·… "
              Else
                 tmpStr = " Given exchange Rate  " & exRate / 100000000 & "  is beyond the tolerance of  " & _
                          exRateTolerance & "%  " & toleranceExRate / 100000000 & " from the Normal exchange rate " & _
                          bmExRate / 100000000 & "  ; Please try again"
              End If
              MsgBox tmpStr
              Exit Sub
          End If
            ''Commented by Mohit on 20-Feb-2007 as change reported by Arul
            ''overrideExRate = "1"
            ''txtDebitAmt = Format(Val(txtTDAmount) * exRate / 100000000, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
         End If
         
         ''Added by Mohit on 20-Feb-2007 as change Reported by Arul
         buyingRate = Val(recvTimeDepositIntRateEnqMsg.buyingRate)
         sellingRate = Val(recvTimeDepositIntRateEnqMsg.sellingRate)
         costRate = Val(recvTimeDepositIntRateEnqMsg.costRate)
        
         If Mid$(cmbTDCurrency, 1, 2) = "01" And txtCurrencyNo <> "01" Then ' Buying Rate
             If exRate > costRate Then 'buying rate should always be less/equal than cost rate
                 If UserLang = ARABIC Then
                    tmpStr = " «·”⁄— «·„⁄ÿÏ  " & exRate / 100000000 & _
                             " ÌÃ» «‰ ÌﬂÊ‰ «ﬁ· «Ê Ì”«ÊÌ ”⁄— «·’—›" & _
                             costRate / 100000000 & "; «·—Ã«¡ «⁄«œ… «·„Õ«Ê·… "
                 Else
                    tmpStr = "Given exchange Rate  " & exRate / 100000000 & _
                             " should be less/equal than cost rate " & _
                             costRate / 100000000 & " ; Please try again"
                 End If
                 MsgBox tmpStr
                 Exit Sub
             End If
             
             If exRate <> buyingRate Then
                 overrideExRate = "1"
             End If
             txtDebitAmt = Format(Val(txtTDAmount) / (exRate / 100000000), "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
             timeDepositInfo.bmExRate = Format(buyingRate, "00000000000000")
         ElseIf Mid$(cmbTDCurrency, 1, 2) <> "01" And txtCurrencyNo = "01" Then ' Selling Rate
             If exRate < costRate Then 'selling rate should always be more/equal than cost rate
                 If UserLang = ARABIC Then
                    tmpStr = " «·”⁄— «·„⁄ÿÏ  " & exRate / 100000000 & _
                             " ÌÃ» «‰ ÌﬂÊ‰ «ﬂ»— «Ê Ì”«ÊÌ ”⁄— «·’—›" & _
                             costRate / 100000000 & "; «·—Ã«¡ «⁄«œ… «·„Õ«Ê·… "
                 Else
                    tmpStr = "Given exchange Rate  " & exRate / 100000000 & _
                             " should be more/equal than cost rate " & _
                             costRate / 100000000 & " ; Please try again"
                 End If
                 MsgBox tmpStr
                 Exit Sub
             End If
             
             If exRate <> sellingRate Then
                 overrideExRate = "1"
             End If
             txtDebitAmt = Format(Val(txtTDAmount) * (exRate / 100000000), "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
             timeDepositInfo.bmExRate = Format(sellingRate, "00000000000000")
         Else
             txtDebitAmt = Format(Val(txtTDAmount) * (exRate / 100000000), "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
             timeDepositInfo.bmExRate = Format(bmExRate, "00000000000000")
         End If
          
         tdValueDate = CStr(txtValueYear.text) & CStr(cmbValueMonth.text) & CStr(cmbValueDay.text)
         If tdValueDate <> bankingDate Then
            overrideValueDate = "1"
         End If
         
     End If
     
     If tdUpdateAction Then
        If optAutoRenew = True Then
           If recvTimeDepositDetailMsg.autoRenewFlag = "1" Then
              MsgBox errTdAlreadyAutoRenew(UserLang) '"Deposit already set as AUTO-RENEW ; not require an update.."
              Exit Sub
           End If
        End If
     Else
        If Len(RTrim(txtFundingIntRate)) = 0 Then
           MsgBox errSpaceFundingIntRate(UserLang) '"Funding Interest rate cannot be spaces...Please check..."
           txtFundingIntRate.SetFocus
           Exit Sub
        End If
     End If
     
'    If Not tdUpdateAction And Not (tdTellerAction And recvTdPendingDetail.newOrUpdate = "U") Then
'       If validateFrmTimeDepositOpen = 1 Then
'          Exit Sub
'       End If
'    End If

    timeDepositInfo.diffDays = Format(diffDays, "000")
    timeDepositInfo.bmFundIntRate = Format(bmIntRate, "000000000")
    ''Commented here and moved up; -by Mohit on 20-Feb-2007 as change reported by Arul
    ''timeDepositInfo.bmExRate = Format(bmExRate, "00000000000000")
    timeDepositInfo.overrideIntRate = overrideIntRate
    timeDepositInfo.overrideExRate = overrideExRate
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    timeDepositInfo.overrideValueDate = overrideValueDate
    formatTimeDepositRequest
    
    
    ''Modified by Mohit on 20-Feb-2007 as change Reported by Arul
    ''SendMsg = timeDepositInfo.msgLen & timeDepositInfo.service & gBranchCode & _
              timeDepositInfo.userId & timeDepositInfo.dateTime & timeDepositInfo.creationOrUpdate & _
              timeDepositInfo.newOrUpdate & timeDepositInfo.acctNo & timeDepositInfo.supervisorId & _
              timeDepositInfo.custNo & timeDepositInfo.tdLedger & timeDepositInfo.tdCurrency & _
              timeDepositInfo.debitAccNo & timeDepositInfo.depositAmt & timeDepositInfo.tenorType & _
              timeDepositInfo.tenorPeriod & timeDepositInfo.fundIntRate & timeDepositInfo.exRate & _
              timeDepositInfo.bmFundIntRate & timeDepositInfo.bmExRate & timeDepositInfo.maturityAmt & timeDepositInfo.maturityDate & _
              timeDepositInfo.overrideIntRate & timeDepositInfo.overrideExRate & timeDepositInfo.autoRenewFlag & _
              timeDepositInfo.diffDays & timeDepositInfo.intAppln & timeDepositInfo.payAccNo & _
              timeDepositInfo.supervisorComments & Space(50)
    SendMsg = timeDepositInfo.msgLen & timeDepositInfo.service & gBranchCode & _
              timeDepositInfo.userId & timeDepositInfo.dateTime & timeDepositInfo.creationOrUpdate & _
              timeDepositInfo.newOrUpdate & timeDepositInfo.acctNo & timeDepositInfo.supervisorId & _
              timeDepositInfo.custNo & timeDepositInfo.tdLedger & timeDepositInfo.tdCurrency & _
              timeDepositInfo.debitAccNo & timeDepositInfo.depositAmt & timeDepositInfo.tenorType & _
              timeDepositInfo.tenorPeriod & timeDepositInfo.fundIntRate & timeDepositInfo.exRate & _
              timeDepositInfo.bmFundIntRate & timeDepositInfo.bmExRate & timeDepositInfo.maturityAmt & timeDepositInfo.maturityDate & _
              timeDepositInfo.valueDate & timeDepositInfo.overrideValueDate & timeDepositInfo.overrideIntRate & timeDepositInfo.overrideExRate & timeDepositInfo.autoRenewFlag & _
              timeDepositInfo.diffDays & timeDepositInfo.intAppln & timeDepositInfo.payAccNo & _
              timeDepositInfo.debitAmt & timeDepositInfo.supervisorComments & Space(50)


   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmTimeDepositOpen.MousePointer = vbHourglass
   
   frmTimeDepositOpen.cmdApprove.Enabled = False
   frmTimeDepositOpen.cmdCancel.Enabled = False
   frmTimeDepositOpen.cmdCreate.Enabled = False
   frmTimeDepositOpen.cmdReject.Enabled = False
   
   retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If retStatus = LocalCommsError Then
      LoadError = True
      frmTimeDepositOpen.MousePointer = vbDefault
      If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
         frmTimeDepositOpen.cmdCreate.Enabled = True
      End If
      frmTimeDepositOpen.cmdApprove.Enabled = False
      frmTimeDepositOpen.cmdReject.Enabled = False
      frmTimeDepositOpen.cmdCancel.Enabled = True
      Exit Sub
   End If
   frmTimeDepositOpen.MousePointer = vbDefault
   If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
      frmTimeDepositOpen.cmdCreate.Enabled = True
   End If
   frmTimeDepositOpen.cmdApprove.Enabled = False
   frmTimeDepositOpen.cmdReject.Enabled = False
   frmTimeDepositOpen.cmdCancel.Enabled = True
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
      gDateTime = Space(14) ' To avoid duplicate record in sttdlog file
   Else
      If recvCustomerMsg.status = "116" Then
         MsgBox errInsufficientFund(UserLang)
      ElseIf UserLang = ARABIC Then
         MsgBox recvCustomerMsg.aRemarks
      Else
         MsgBox recvCustomerMsg.eRemarks
      End If
      Exit Sub
   End If
     
   Unload Me
'   If tdTellerAction Then
'      If Len(Trim(frmTimeDepositPendingList.txtCustomerNo)) = 0 Then
'         tCustNo = Space(7)
'      Else
'         tCustNo = Format(frmTimeDepositPendingList.txtCustomerNo, "0000000")
'      End If
'      Unload frmTimeDepositPendingList
'      frmEnquiry.readTimeDepositPendingList "00000", "T", tCustNo
'      If UserLang = ARABIC Then
'         ChangePositions frmTimeDepositPendingList, 11800
'         frmTimeDepositPendingList.RightToLeft = True
'      End If
'      frmTimeDepositPendingList.Show
'   End If
   
End Sub

Private Sub cmdFetchRate_Click()
    Dim tdCurrency As String, tdLedger As String
    Dim tdValueDate As String, bankDate As String, valueDate As String, toleranceValueDate As String, valueDtToleranceDays As Integer   ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    Dim depositAmtInSAR As String, fdValueDateTolerance As String  ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    Dim depositAmt As String, tenorType As String
    Dim tenorPeriod As String, debitAccNo As String
    Dim payAccNo As String
    Dim intAppln As String, tmpStr As String
    Dim tDecimalPlace As String, amtDenom As Integer
    Dim intRate As Double, exRate As Double
    Dim buyingRate As Double, sellingRate As Double, costRate As Double ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    Dim intAmt As Double, maturityAmt As Double
    Dim minimumDepositAmt As Long, maximumDepositPeriod As Integer
    Dim strmsglen As String, depositPeriod As Integer
        
    tdCurrency = Mid$(cmbTDCurrency, 1, 2)
    If Len(RTrim(tdCurrency)) = 0 Then
       MsgBox errSpaceTdCurrency(UserLang)
       cmbTDCurrency.SetFocus
       Exit Sub
    End If
    tdLedger = Mid$(cmbTDLedger, 1, 3)
    If Len(RTrim(tdLedger)) = 0 Then
       MsgBox errSpaceTdLedger(UserLang)
       cmbTDLedger.SetFocus
       Exit Sub
    End If
    
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    If Len(RTrim(cmbValueDay.text)) = 0 Or _
       Len(RTrim(cmbValueMonth.text)) = 0 Or _
       Len(RTrim(txtValueYear)) = 0 Then
       MsgBox errSpaceValueDate(UserLang)
       cmbValueDay.SetFocus
       Exit Sub
    End If
    
    tdValueDate = CStr(txtValueYear.text) & CStr(cmbValueMonth.text) & CStr(cmbValueDay.text)
    If Not validDate(tdValueDate) Then
        MsgBox errInvalidDate(UserLang)
        cmbValueDay.SetFocus
        Exit Sub
    End If
 
    If Val(tdValueDate) > Val(bankingDate) Then
       MsgBox errValueDateGreaterThanToday(UserLang)
       cmbValueDay.SetFocus
       Exit Sub
    End If
    '' till here
    
    
    If Len(RTrim(tdCurrency)) = 0 Then
       MsgBox errSpaceTdCurrency(UserLang)
       cmbTDCurrency.SetFocus
       Exit Sub
    End If
    
    
    Set rs = db.OpenRecordset("select * from bmledgerinfo where ledgerCode = '" & tdLedger & "'")
    If rs.recordCount > 0 Then
       minimumDepositAmt = IIf(IsNull(rs("minTdAmt")) = True, 0, Val(rs("minTdAmt")))
       maximumDepositPeriod = IIf(IsNull(rs("maxTdPeriod")) = True, 0, Val(rs("maxTdPeriod")))
       ''Added by Mohit on 20-Feb-2007 as change reported by Arul
       valueDtToleranceDays = IIf(IsNull(rs("fdValueDateTolerance")) = True, 0, Val(rs("fdValueDateTolerance")))
    Else
       minimumDepositAmt = 0
       maximumDepositPeriod = 0
       ''Added by Mohit on 20-Feb-2007 as change reported by Arul
       valueDtToleranceDays = 0
    End If
    
    
    
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
''    valueDate = Mid$(tdValueDate, 7, 2) & "/" & _
''                                  Mid$(tdValueDate, 5, 2) & "/" & _
''                                  Mid$(tdValueDate, 1, 4)
''    bankDate = Mid$(bankingDate, 7, 2) & "/" & _
''                                  Mid$(bankingDate, 5, 2) & "/" & _
''                                  Mid$(bankingDate, 1, 4)
''    fdValueDateTolerance = CDate(bankDate) - valueDtToleranceDays
''    'tmpStr = CDate(valueDate) - 0
''    If CDate(valueDate) < fdValueDateTolerance Then
''        If UserLang = ARABIC Then
''           tmpStr = ""
''        Else
''           tmpStr = " Given Value Date  " & valueDate & "  is beyond the tolerance of  " & _
''                          valueDtToleranceDays & " day(s)  " & fdValueDateTolerance & _
''                          " from the Banking date " & _
''                          bankDate & "  ; Please try again"""
''        End If
''        MsgBox tmpStr
''        cmbValueDay.SetFocus
''        Exit Sub
''    End If
''    ''till here
 
    
    tenorType = Mid$(cmbTenorType, 1, 1)
    If Len(RTrim(tenorType)) = 0 Then
       MsgBox errSpaceTenorType(UserLang)
       cmbTenorType.SetFocus
       Exit Sub
    End If
    tenorPeriod = Format(txtTenor, "000")
    If Len(RTrim(tenorPeriod)) = 0 Or Val(tenorPeriod) <= 0 Then
       MsgBox errTenorGreaterThanZero(UserLang)
       Exit Sub
    End If
    If tenorType = "W" Then
       'depositPeriod = Val(tenorPeriod) * 52    -Bug, by Mohit on 17-Feb-2007
       depositPeriod = Val(tenorPeriod) * 7
    ElseIf tenorType = "M" Then
       depositPeriod = Val(tenorPeriod) * 30
    ElseIf tenorType = "Y" Then
       depositPeriod = Val(tenorPeriod) * 365
    Else
       depositPeriod = Val(tenorPeriod)
    End If
    
    If tenorType = "D" Or tenorType = "W" Then
       If depositPeriod > 99 Then
          'MsgBox errInvalidTenorType(UserLang)
          MsgBox errInvalidTenorPeriod(UserLang)
          Exit Sub
       End If
    End If
    'Deposit period cannot be more than 5(configurable) years; i.e 60*30 = 1800 days
    ''If depositPeriod > maximumDepositPeriod * 12 * 30 Then   -by Mohit on 17-Feb-2007
    If depositPeriod > maximumDepositPeriod * 365 Then
       If UserLang = ARABIC Then
            MsgBox errDepositPeriodMoreThan5Years(UserLang) & maximumDepositPeriod & "  ”‰Â "   '"Deposit period cannot be more than 'n' years; Please check.."
       Else
            MsgBox errDepositPeriodMoreThan5Years(UserLang) & maximumDepositPeriod & "  Years "   '"Deposit period cannot be more than 'n' years; Please check.."
       End If
       Exit Sub
    End If
    Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                              "where currencycode = '" & tdCurrency & "'")
                             
    If rs.recordCount > 0 Then
       tDecimalPlace = rs(0)
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
    
    If Val(txtTDAmount) < 0 Then
       depositAmt = Format(Val(txtTDAmount) * amtDenom, "00000000000000")
    Else
       depositAmt = Format(Val(txtTDAmount) * amtDenom, "+00000000000000")
    End If
    'to avoid null characters
    If Len(RTrim(txtSubAcc)) = 0 Then
       txtSubAcc = Space(2)
    End If
    If Len(RTrim(txtCurrencyNo)) = 0 Then
       MsgBox errSpaceTdDebitCurrency(UserLang)
       txtCurrencyNo.SetFocus
       Exit Sub
    End If
    
    If Len(RTrim(Mid$(cmbTdDebitMemo, 1, 3))) = 0 Then
       MsgBox errSpaceTdDebitLedger(UserLang)
       cmbTdDebitMemo.SetFocus
       Exit Sub
    End If
    
    If Len(RTrim(Mid$(cmbPayLedger, 1, 3))) = 0 Then
       MsgBox errSpaceTdDebitLedger(UserLang)
       cmbPayLedger.SetFocus
       Exit Sub
    End If
    
    If tdCurrency <> "01" Then
       If txtCurrencyNo <> tdCurrency And txtCurrencyNo <> "01" Then
          MsgBox errInvalidDebitAccCurr(UserLang) & "(" & tdCurrency & ")"
          txtCurrencyNo.SetFocus
          Exit Sub
       End If
    Else
       ''Commented by Mohit on 20-Feb-2007 as change reported by Arul
       ''If txtCurrencyNo <> "01" Then
       ''   MsgBox errDebitAccCurrNotSAR(UserLang)
       ''   txtCurrencyNo.SetFocus
       ''   Exit Sub
       ''End If
    End If
    
    debitAccNo = Format(txtCurrencyNo, "!@@") & Format(Mid$(cmbTdDebitMemo, 1, 3), "!@@@") & Format(txtCustomerNo, "!@@@@@@@") & Format(txtSubAcc, "!@@")
    payAccNo = Format(txtPayCurr, "!@@") & Format(Mid$(cmbPayLedger, 1, 3), "!@@@") & Format(txtPayCustNo, "!@@@@@@@") & Format(txtPaySubAcc, "!@@")
    If optFixedDeposit = True Then
       intAppln = "0"
    Else
       intAppln = "1"
    End If
    
    ''Modified by Mohit on 20-Feb-2007 as change reported by Arul
    ''SendMsg = "000090" & "AG" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & _
              tdLedger & tdCurrency & depositAmt & tenorType & tenorPeriod & _
              debitAccNo & intAppln & Format(payAccNo, "!@@@@@@@@@@@@@@") & Space(50)
    SendMsg = "000090" & "AG" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & _
              tdLedger & tdCurrency & depositAmt & tenorType & tenorPeriod & _
              debitAccNo & intAppln & Format(payAccNo, "!@@@@@@@@@@@@@@") & tdValueDate & Space(50)
              
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmTimeDepositOpen.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmTimeDepositOpen.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    frmTimeDepositOpen.MousePointer = vbNormal
    parseTdIntRateEnqResponse
    
    If recvTimeDepositIntRateEnqMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTimeDepositIntRateEnqMsg.aRemarks
       Else
          MsgBox recvTimeDepositIntRateEnqMsg.eRemarks
       End If
       Exit Sub
    End If
     
     
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    fdValueDateTolerance = recvTimeDepositIntRateEnqMsg.toleranceValueDate
    valueDate = Mid$(tdValueDate, 7, 2) & "/" & _
                                  Mid$(tdValueDate, 5, 2) & "/" & _
                                  Mid$(tdValueDate, 1, 4)
    bankDate = Mid$(bankingDate, 7, 2) & "/" & _
                                  Mid$(bankingDate, 5, 2) & "/" & _
                                  Mid$(bankingDate, 1, 4)
    toleranceValueDate = Mid$(fdValueDateTolerance, 7, 2) & "/" & _
                                  Mid$(fdValueDateTolerance, 5, 2) & "/" & _
                                  Mid$(fdValueDateTolerance, 1, 4)

    If Val(tdValueDate) < Val(fdValueDateTolerance) Then
        If UserLang = ARABIC Then
           tmpStr = "  «—ÌŒ «·Õﬁ «·„œŒ·" & valueDate & " ·Ì” ›Ì ‰ÿ«ﬁ «·„œÏ «·„”„ÊÕ " & _
                    valueDtToleranceDays & "ÌÊ„ " & toleranceValueDate & _
                    " „‰  «—ÌŒ «·ÌÊ„" & bankDate & " «·—Ã«¡..Õ«Ê· „—… «Œ—Ï"
        Else
           tmpStr = " Given Value Date  " & valueDate & "  is beyond the tolerance of  " & _
                          valueDtToleranceDays & " day(s)  " & toleranceValueDate & _
                          " from the Banking date " & _
                          bankDate & "  ; Please try again"
        End If
        MsgBox tmpStr
        cmbValueDay.SetFocus
        Exit Sub
    End If
    ''till here
     
     
    intRate = Val(recvTimeDepositIntRateEnqMsg.intRate) / 1000000
    exRate = Val(recvTimeDepositIntRateEnqMsg.exRate) / 100000000
    
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    buyingRate = Val(recvTimeDepositIntRateEnqMsg.buyingRate) / 100000000
    sellingRate = Val(recvTimeDepositIntRateEnqMsg.sellingRate) / 100000000
    costRate = Val(recvTimeDepositIntRateEnqMsg.costRate) / 100000000
    ''till here
    
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    If Mid$(cmbTDCurrency, 1, 2) <> "01" Then
        depositAmtInSAR = Val(txtTDAmount) * exRate
        ''minimumDepositAmtInSAR = Format((minimumDepositAmt / exRate), "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
    Else
        depositAmtInSAR = txtTDAmount
        ''minimumDepositAmtInSAR = minimumDepositAmt
    End If
    
    ''Modified by Mohit on 20-Feb-2007 as change reported by Arul
    ''If Val(txtTDAmount) < minimumDepositAmt Then
    If Val(depositAmtInSAR) < minimumDepositAmt Then
       MsgBox errDepositAmtLesser(UserLang) & minimumDepositAmt & " ;" & errTryOnceMore(UserLang)
       txtTDAmount.SetFocus
       Exit Sub
    End If
    
    txtFundingIntRate = Format(intRate, "##0.0#####")
     'sprintf(tmpStr, "%.14s", cndRec.exchangeRateExt);
     'currTot[currCode].exchangeRate = atof(tmpStr)/100000000;
    
    ''Modified by Mohit on 18-Feb-2007 as change requested by Mr. Shoaib Hyder (mail on 18th Feb 2007 from Arul)
''    If Mid$(cmbTDCurrency, 1, 2) <> "01" And txtCurrencyNo = "01" Then ' Cross currency deposit
''        txtExRate = ""
''        txtExRate.tag = Format(exRate, "#####0.00000000")
''        txtDebitAmt = ""
''    Else
''        txtExRate = Format(exRate, "#####0.00000000")
''        txtDebitAmt = Format(Val(txtTDAmount) * exRate, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
''    End If
    If Mid$(cmbTDCurrency, 1, 2) = "01" And txtCurrencyNo <> "01" Then 'buying Rate
        txtExRate = Format(buyingRate, "#####0.00000000")
        txtDebitAmt = Format(Val(txtTDAmount) / buyingRate, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
    ElseIf Mid$(cmbTDCurrency, 1, 2) <> "01" And txtCurrencyNo = "01" Then 'selling Rate
        txtExRate = Format(sellingRate, "#####0.00000000")
        txtDebitAmt = Format(Val(txtTDAmount) * sellingRate, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
    Else
        txtExRate = Format(1, "#####0.00000000")
        txtDebitAmt = Format(Val(txtTDAmount), "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
    End If
    
    
    
    intAmt = Val(txtTDAmount) * (intRate / 100) * Val(recvTimeDepositIntRateEnqMsg.diffDays) _
                                        / Val(recvTimeDepositIntRateEnqMsg.crBaseDays)
    
    maturityAmt = Val(txtTDAmount) + intAmt
        
    ''Commented by Mohit on 18-Feb-2007 as change requested by Mr. Shoaib Hyder (mail on 18th Feb 2007 from Arul)
    ''txtDebitAmt = Format(Val(txtTDAmount) * exRate, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
    
    txtMaturityAmt = Format(maturityAmt, "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
    TxtPayAccCustName = recvTimeDepositIntRateEnqMsg.PayAccCustName ' written on 26th feb by arshad along with arul

    cmbMaturityDate = Mid$(recvTimeDepositIntRateEnqMsg.maturityDate, 7, 2)
    cmbMaturityMonth = Mid$(recvTimeDepositIntRateEnqMsg.maturityDate, 5, 2)
    txtMaturityYear = Mid$(recvTimeDepositIntRateEnqMsg.maturityDate, 1, 4)
    
    cmdCreate.Enabled = True
    cmdFetchRate.Enabled = False
    cmdClear.Enabled = True
    frameTdMainDetails.Enabled = False
    frameTDDetails.Enabled = True
    ''Modified by Mohit on 20-Feb-2007 as change reported by Arul
    ''If Mid$(cmbTDCurrency, 1, 2) <> "01" And txtCurrencyNo = "01" Then
    If Mid$(cmbTDCurrency, 1, 2) <> txtCurrencyNo Then
       txtExRate.Enabled = True
    Else
       txtExRate.Enabled = False
    End If

End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox recvTimeDepositDetailMsg.supervisorComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim mQry As String
   Dim num As String, i As Integer    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
      
   If UserLang = ARABIC Then
      ChangePositions frmTimeDepositOpen, 11800
      frmTimeDepositOpen.RightToLeft = True
   End If
   
   frmTimeDepositOpen.Caption = frmTimeDepositOpenCaption(0, UserLang)
   frmTimeDepositOpen.lblTimeDepositHead.Caption = frmTimeDepositOpenCaption(0, UserLang)
   frmTimeDepositOpen.lblCustNo.Caption = frmTimeDepositOpenCaption(1, UserLang)
   frmTimeDepositOpen.lblCustName.Caption = frmTimeDepositOpenCaption(2, UserLang)
   frmTimeDepositOpen.lblTDLedger.Caption = frmTimeDepositOpenCaption(3, UserLang)
   frmTimeDepositOpen.lblDebitAccNo.Caption = frmTimeDepositOpenCaption(4, UserLang)
   frmTimeDepositOpen.lblCurrency.Caption = frmTimeDepositOpenCaption(5, UserLang)
   frmTimeDepositOpen.lblLedger.Caption = frmTimeDepositOpenCaption(6, UserLang)
   frmTimeDepositOpen.lblCustomerNo.Caption = frmTimeDepositOpenCaption(7, UserLang)
   frmTimeDepositOpen.lblSubAcc.Caption = frmTimeDepositOpenCaption(8, UserLang)
   frmTimeDepositOpen.lblDepositCurr.Caption = frmTimeDepositOpenCaption(9, UserLang)
   frmTimeDepositOpen.lblTDAmount.Caption = frmTimeDepositOpenCaption(10, UserLang)
   frmTimeDepositOpen.lblTDTenor.Caption = frmTimeDepositOpenCaption(11, UserLang)
   frmTimeDepositOpen.lblDepositAccNo.Caption = frmTimeDepositOpenCaption(12, UserLang)
   frmTimeDepositOpen.cmdFetchRate.Caption = frmTimeDepositOpenCaption(13, UserLang)
   frmTimeDepositOpen.frameTDDetails.Caption = frmTimeDepositOpenCaption(14, UserLang)
   frmTimeDepositOpen.lblFundingIntRate.Caption = frmTimeDepositOpenCaption(15, UserLang)
   frmTimeDepositOpen.lblExchangeRate.Caption = frmTimeDepositOpenCaption(16, UserLang)
   frmTimeDepositOpen.lblDebitAmount.Caption = frmTimeDepositOpenCaption(17, UserLang)
   frmTimeDepositOpen.lblMaturityAmount.Caption = frmTimeDepositOpenCaption(18, UserLang)
   frmTimeDepositOpen.lblMaturityDate.Caption = frmTimeDepositOpenCaption(19, UserLang)
   frmTimeDepositOpen.lblRenewalInstruction.Caption = frmTimeDepositOpenCaption(20, UserLang)
   frmTimeDepositOpen.optAutoRenew.Caption = frmTimeDepositOpenCaption(21, UserLang)
   frmTimeDepositOpen.optManualRenew.Caption = frmTimeDepositOpenCaption(22, UserLang)
   frmTimeDepositOpen.cmdSupervisorComments.Caption = frmTimeDepositOpenCaption(23, UserLang)
   ''Changed by Mohit on 20-Feb-2007 as change reported by Arul
   If tdUpdateAction Then
        frmTimeDepositOpen.cmdCreate.Caption = frmTimeDepositOpenCaption(34, UserLang)
        frmTimeDepositOpen.cmdCreate.ToolTipText = "Update"
   Else
        frmTimeDepositOpen.cmdCreate.Caption = frmTimeDepositOpenCaption(24, UserLang)
        frmTimeDepositOpen.cmdCreate.ToolTipText = "Create"
   End If
   frmTimeDepositOpen.cmdApprove.Caption = frmTimeDepositOpenCaption(25, UserLang)
   frmTimeDepositOpen.cmdReject.Caption = frmTimeDepositOpenCaption(26, UserLang)
   frmTimeDepositOpen.cmdCancel.Caption = frmTimeDepositOpenCaption(27, UserLang)
   frmTimeDepositOpen.lblIntAppln.Caption = frmTimeDepositOpenCaption(28, UserLang)
   frmTimeDepositOpen.optFixedDeposit.Caption = frmTimeDepositOpenCaption(29, UserLang)
   frmTimeDepositOpen.optPayAcc.Caption = frmTimeDepositOpenCaption(30, UserLang)
   frmTimeDepositOpen.lblPayAccNo.Caption = frmTimeDepositOpenCaption(31, UserLang)
   frmTimeDepositOpen.cmdClear.Caption = frmTimeDepositOpenCaption(32, UserLang)
   ''Added by Mohit on 20-Feb-2007 as change reported by Arul
   frmTimeDepositOpen.lblValueDate.Caption = frmTimeDepositOpenCaption(33, UserLang)
   frmTimeDepositOpen.LblPayAccCustName.Caption = frmTimeDepositOpenCaption(35, UserLang)
   
   gDateTime = Space(14)
   Set rs = db.OpenRecordset("select * from bmledgerinfo where timeDepositMemo = '1'")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbTDLedger.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbTDLedger.AddItem rs("ledgercode") & "-" & rs("arabicname")
         Else
            cmbTDLedger.AddItem rs("ledgercode") & "-" & rs("englishname")
         End If
         rs.MoveNext
      Loop
      cmbTDLedger.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from bmledgerinfo where tdDebitMemo = '1'")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbTdDebitMemo.Clear
      cmbPayLedger.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbTdDebitMemo.AddItem rs("ledgercode") & "-" & rs("arabicname")
            cmbPayLedger.AddItem rs("ledgercode") & "-" & rs("arabicname")
         Else
            cmbTdDebitMemo.AddItem rs("ledgercode") & "-" & rs("englishname")
            cmbPayLedger.AddItem rs("ledgercode") & "-" & rs("englishname")
         End If
         rs.MoveNext
      Loop
      cmbTdDebitMemo.ListIndex = 0
      cmbPayLedger.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from currencyinfo where TimeDepositAllowed='1'")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbTDCurrency.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbTDCurrency.AddItem rs("currencycode") & " - " & rs("arabicname")
         Else
            cmbTDCurrency.AddItem rs("currencycode") & " - " & rs("englishname")
         End If
         rs.MoveNext
      Loop
      cmbTDCurrency.ListIndex = 0
      txtPayCurr = Mid$(cmbTDCurrency, 1, 2)
    End If
    
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    For i = 1 To 31
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbValueDay.AddItem num
       If i < 13 Then
          cmbValueMonth.AddItem num
       End If
    Next
    cmbValueDay.ListIndex = Val(Mid$(recvLoginMsg.bankingDate, 7, 2)) - 1
    cmbValueMonth.ListIndex = Val(Mid$(recvLoginMsg.bankingDate, 5, 2)) - 1
    txtValueYear.text = Mid$(recvLoginMsg.bankingDate, 1, 4)
    
    Set rs = db.OpenRecordset("select * from tenortypeinfo where displayForTDscreen = '1'")
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbTenorType.Clear
       Do While Not rs.EOF
          If UserLang = ARABIC Then
             cmbTenorType.AddItem rs("tenorType") & "-" & rs("arabicname")
          Else
             cmbTenorType.AddItem rs("tenorType") & "-" & rs("englishname")
          End If
          rs.MoveNext
       Loop
       cmbTDLedger.ListIndex = 0
    End If
    lblDepositAccNo.Visible = False
    txtDepositAccNo.Visible = False
    If tdSupervisorAction Or tdSearchAction Then
       frameTdMainDetails.Enabled = False
       cmdFetchRate.Enabled = False
       cmdClear.Enabled = False
       frameTDDetails.Enabled = False
       If tdSearchAction Or recvTimeDepositDetailMsg.newOrUpdate = "U" Then
          lblDepositAccNo.Visible = True
          lblDepositAccNo.Refresh
          txtDepositAccNo.Visible = True
          txtDepositAccNo.Refresh
       End If
       cmdCreate.Enabled = False
       If tdSupervisorAction Then
          cmdApprove.Enabled = True
          cmdReject.Enabled = True
          cmdSupervisorComments.Enabled = True
       Else
          cmdApprove.Enabled = False
          cmdReject.Enabled = False
          cmdSupervisorComments.Enabled = False
       End If
       
    
       
    ElseIf tdUpdateAction Then
       frameTdMainDetails.Enabled = False
       lblDepositAccNo.Visible = True
       lblDepositAccNo.Refresh
       txtDepositAccNo.Visible = True
       txtDepositAccNo.Refresh
       cmdFetchRate.Enabled = False
       cmdClear.Enabled = False
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdSupervisorComments.Enabled = False
       cmdCreate.Enabled = True
       frameTDDetails.Enabled = True
       txtMaturityAmt.Enabled = False
       txtFundingIntRate.Enabled = False
       txtExRate.Enabled = False
       txtMaturityAmt.Enabled = False
       txtDebitAmt.Enabled = False
       cmbMaturityDate.Enabled = False
       cmbMaturityMonth.Enabled = False
       txtMaturityYear.Enabled = False
       frameRenewInstr.Enabled = True
    ElseIf tdTellerAction Then
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdCreate.Enabled = False
       frameTDDetails.Enabled = False
       txtMaturityAmt.Enabled = False
       txtDebitAmt.Enabled = False
       cmbMaturityDate.Enabled = False
       cmbMaturityMonth.Enabled = False
       txtMaturityYear.Enabled = False
       frameRenewInstr.Enabled = True
       cmdClear.Enabled = False
       If recvTimeDepositDetailMsg.newOrUpdate = "U" Then
          frameTdMainDetails.Enabled = False
          cmdFetchRate.Enabled = False
          txtFundingIntRate.Enabled = False
          txtExRate.Enabled = False
          lblDepositAccNo.Visible = True
          lblDepositAccNo.Refresh
          txtDepositAccNo.Visible = True
          txtDepositAccNo.Refresh
       Else
          frameTdMainDetails.Enabled = True
          cmdFetchRate.Enabled = True
          txtFundingIntRate.Enabled = True
          txtExRate.Enabled = True
          cmdSupervisorComments.Enabled = True
       End If
    Else
       cmdFetchRate.Enabled = True
       cmdClear.Enabled = False
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdSupervisorComments.Enabled = False
       cmdCreate.Enabled = False
       frameTdMainDetails.Enabled = True
       frameTDDetails.Enabled = True
       txtFundingIntRate.Enabled = True
       txtExRate.Enabled = True
       txtMaturityAmt.Enabled = False
       txtDebitAmt.Enabled = False
       cmbMaturityDate.Enabled = False
       cmbMaturityMonth.Enabled = False
       txtMaturityYear.Enabled = False
       frameRenewInstr.Enabled = True
       
       frmAccountGrid.accountGrid.Col = 0 ' Added by Arshad on 25th feb 2007
       txtCurrencyNo.text = Left(frmAccountGrid.accountGrid.text, 2) ' Added by Arshad on 25th feb 2007
       txtSubAcc.text = Right(frmAccountGrid.accountGrid.text, 2) ' Added by Arshad on 25th feb 2007
       txtPaySubAcc.text = txtSubAcc.text ' Added by Arshad on 25th feb 2007
    End If
 
'Code Added by Arshad on 27th feb 2007
    If recvTimeDepositDetailMsg.newOrUpdate = "U" Or tdUpdateAction = True Then
        If UserLang = ARABIC Then
           frmTimeDepositOpen.lblTimeDepositHead = "  ⁄œÌ·  ⁄·Ì„«  «· ÃœÌœ"
        Else
           frmTimeDepositOpen.lblTimeDepositHead = "Renewal Instruction Change"
        End If
    ElseIf recvTimeDepositDetailMsg.newOrUpdate = "N" Or tdUpdateAction = False Then
        If UserLang = ARABIC Then
            frmTimeDepositOpen.lblTimeDepositHead = "› Õ Õ”«» ÊœÌ⁄…"
        Else
            frmTimeDepositOpen.lblTimeDepositHead = "Time Deposit A/c Opening"
        End If
    End If
' change of code ends here
End Sub
Public Sub parseTdIntRateEnqResponse()
   Dim s As String
   Dim pos As Integer
   pos = 1
    
   'On Error GoTo err_handler
   s = "1"
   recvTimeDepositIntRateEnqMsg.status = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   s = "2"
   recvTimeDepositIntRateEnqMsg.service = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "3"
   recvTimeDepositIntRateEnqMsg.aRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   s = "4"
   recvTimeDepositIntRateEnqMsg.eRemarks = Mid$(RecvStr, pos, 50)
   pos = pos + 50
   s = "5"
   recvTimeDepositIntRateEnqMsg.tdLedger = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   s = "6"
   recvTimeDepositIntRateEnqMsg.tdCurrency = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   s = "7"
   recvTimeDepositIntRateEnqMsg.tenorType = Mid$(RecvStr, pos, 1)
   pos = pos + 1
   s = "8"
   recvTimeDepositIntRateEnqMsg.tenor = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   s = "9"
   recvTimeDepositIntRateEnqMsg.depositAmt = Mid$(RecvStr, pos, 15)
   pos = pos + 15
   s = "10"
   recvTimeDepositIntRateEnqMsg.debitAccNo = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   s = "11"
   recvTimeDepositIntRateEnqMsg.intRate = Mid$(RecvStr, pos, 9)
   pos = pos + 9
   s = "12"
   recvTimeDepositIntRateEnqMsg.exRate = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   s = "13"
   recvTimeDepositIntRateEnqMsg.maturityDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   s = "14"
   recvTimeDepositIntRateEnqMsg.crBaseDays = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   s = "15"
   recvTimeDepositIntRateEnqMsg.diffDays = Mid$(RecvStr, pos, 3)
   pos = pos + 3
   recvTimeDepositIntRateEnqMsg.fxTolerance = Mid$(RecvStr, pos, 2)
   pos = pos + 2
   recvTimeDepositIntRateEnqMsg.minIntRate = Mid$(RecvStr, pos, 9)
   pos = pos + 9
   recvTimeDepositIntRateEnqMsg.maxIntRate = Mid$(RecvStr, pos, 9)
   pos = pos + 9
   ''Added by Mohit on 20-Feb-2007 as change reported by Arul
   recvTimeDepositIntRateEnqMsg.buyingRate = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   recvTimeDepositIntRateEnqMsg.sellingRate = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   recvTimeDepositIntRateEnqMsg.costRate = Mid$(RecvStr, pos, 14)
   pos = pos + 14
   recvTimeDepositIntRateEnqMsg.valueDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvTimeDepositIntRateEnqMsg.toleranceValueDate = Mid$(RecvStr, pos, 8)
   pos = pos + 8
   recvTimeDepositIntRateEnqMsg.PayAccCustName = Mid$(RecvStr, pos, 30)
   pos = pos + 30
   ''till here
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameTDDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameTdMainDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtCurrencyNo_Change()
On Error Resume Next          ' Added by Arshad on 25th feb 2007
  If Not tdSupervisorAction And Not tdSearchAction And Not tdUpdateAction And Not tdTellerAction Then
     If Len(RTrim(txtCurrencyNo)) = 2 Then
        cmbTdDebitMemo.SetFocus
     End If
  End If
End Sub

Private Sub txtCurrencyNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtExRate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 And KeyAscii <> 46 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
''Added by Mohit on 20-Feb-2007 as change reported by Arul
Private Sub txtExRate_LostFocus()
    Dim tDecimalPlace As String
    If Mid$(cmbTDCurrency, 1, 2) <> txtCurrencyNo Then ' Cross currency deposit
        Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                                  "where currencycode = '" & Mid$(txtCurrencyNo, 1, 2) & "'")
                                 
        If rs.recordCount > 0 Then
           tDecimalPlace = rs(0)
        Else
           tDecimalPlace = "2"
        End If
        
        If Mid$(cmbTDCurrency, 1, 2) = "01" And txtCurrencyNo <> "01" Then 'buying Rate
            txtDebitAmt = Format(Val(txtTDAmount) / Val(txtExRate), "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
        ElseIf Mid$(cmbTDCurrency, 1, 2) <> "01" And txtCurrencyNo = "01" Then 'selling Rate
            txtDebitAmt = Format(Val(txtTDAmount) * Val(txtExRate), "##########0" & IIf(Val(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
        End If
    End If
End Sub

Private Sub txtFundingIntRate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 And KeyAscii <> 46 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbTdDebitMemo_KeyPress(KeyAscii As Integer)
'  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
'      KeyAscii = 0
'      MsgBox (errOnlyNumeralsAllowed(UserLang))
'      Exit Sub
'  End If
End Sub

Private Sub txtTDAmount_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 And KeyAscii <> 46 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtTenor_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Sub formatTimeDepositRequest()
   Dim tCode As String
   Dim amtDenom As Integer
   Dim tDecimalPlace As String
   Dim drDecimalPlace As String, drAmtDenom As Integer  '' Added by Mohit on 20-Feb-2007 as change reported by Arul

   tCode = Mid$(cmbTDCurrency, 1, 2)
   Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                             "where currencycode = '" & tCode & "'")
   If rs.recordCount > 0 Then
      tDecimalPlace = rs(0)
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
   
   timeDepositInfo.msgLen = "000000"
   timeDepositInfo.service = "AH"
   timeDepositInfo.userId = Format(gUserId, "!@@@@@@@@@@")
'   If tdTellerAction Then
'      timeDepositInfo.creationOrUpdate = "U"
'      frmTimeDepositPendingList.tdPendingGrid.Col = 1
'      timeDepositInfo.dateTime = Format(frmTimeDepositPendingList.tdPendingGrid.text, "!@@@@@@@@@@@@@@")
'      timeDepositInfo.supervisorId = recvTimeDepositDetailMsg.supervisorId
'   Else
'      timeDepositInfo.dateTime = gDateTime
'      timeDepositInfo.creationOrUpdate = "C"
'      timeDepositInfo.supervisorId = Space(10)
'   End If
'   If tdUpdateAction Or _
'      (tdTellerAction And recvTimeDepositDetailMsg.newOrUpdate = "U") Then
'      timeDepositInfo.newOrUpdate = "U"
'   Else
'      timeDepositInfo.newOrUpdate = "N"
'   End If
'   If tdUpdateAction Or (tdTellerAction And recvTimeDepositDetailMsg.newOrUpdate = "U") Then
'      timeDepositInfo.acctNo = txtDepositAccNo
'   Else
'      timeDepositInfo.acctNo = Space(14)
'   End If
'   timeDepositInfo.custNo = txtCustNo
'   timeDepositInfo.tdLedger = Mid$(cmbTDLedger, 1, 3)
'   timeDepositInfo.tdCurrency = Mid$(cmbTDCurrency, 1, 2)
'   'to avoid null characters
'   If Len(RTrim(txtSubAcc)) = 0 Then
'      txtSubAcc = Space(2)
'   End If
'   timeDepositInfo.debitAccNo = Format(txtCurrencyNo, "!@@") & Format(Mid$(cmbTdDebitMemo, 1, 3), "!@@@") & Format(txtCustomerNo, "!@@@@@@@") & Format(txtSubAcc, "!@@")
'   timeDepositInfo.depositAmt = Format(Val(txtTDAmount) * amtDenom, "00000000000000")
'   timeDepositInfo.tenorType = Mid$(cmbTenorType, 1, 1)
'   timeDepositInfo.tenorPeriod = Format(Val(txtTenor), "000")
'   timeDepositInfo.fundIntRate = Format(Val(txtFundingIntRate) * 1000000, "000000000")
'   timeDepositInfo.exRate = Format(Val(txtExRate) * 100000000, "00000000000000")
'   timeDepositInfo.maturityAmt = Format(Val(txtMaturityAmt) * amtDenom, "00000000000000")
'   timeDepositInfo.maturityDate = txtMaturityYear & cmbMaturityMonth & cmbMaturityDate
'
'   ''Added by Mohit on 20-Feb-2007 as change reported by Arul
'   timeDepositInfo.valueDate = txtValueYear & cmbValueMonth & cmbValueDay
'
'   tCode = Mid$(txtCurrencyNo, 1, 2)
'   Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
'                             "where currencycode = '" & tCode & "'")
'   If rs.recordCount > 0 Then
'      drDecimalPlace = rs(0)
'   Else
'      drDecimalPlace = "2"
'   End If
'
'   If drDecimalPlace = "3" Then
'      drAmtDenom = 1000
'   ElseIf drDecimalPlace = "2" Then
'      drAmtDenom = 100
'   ElseIf drDecimalPlace = "1" Then
'      drAmtDenom = 10
'   Else
'      drAmtDenom = 1
'   End If
'
'   timeDepositInfo.debitAmt = Format(Val(txtDebitAmt) * drAmtDenom, "00000000000000")
'   '' till here
'
'   If optAutoRenew = True Then
'      timeDepositInfo.autoRenewFlag = "1"
'   Else
'      timeDepositInfo.autoRenewFlag = "0"
'   End If
'
'   If optFixedDeposit = True Then
'      timeDepositInfo.intAppln = "0"
'   Else
'      timeDepositInfo.intAppln = "1"
'   End If
'   timeDepositInfo.payAccNo = Format(txtPayCurr, "!@@") & Format(Mid$(cmbPayLedger, 1, 3), "!@@@") & Format(txtPayCustNo, "!@@@@@@@") & Format(txtPaySubAcc, "!@@")
'   If tdTellerAction Then
'      timeDepositInfo.supervisorComments = recvTimeDepositDetailMsg.supervisorComments
'   Else
'      timeDepositInfo.supervisorComments = Space(200)
'   End If

End Sub

Public Sub parseTimeDepositApprovalMsg()
    Dim pos As Integer
    pos = 1

    recvTimeDepositApprovalMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTimeDepositApprovalMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTimeDepositApprovalMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTimeDepositApprovalMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTimeDepositApprovalMsg.appRejectFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTimeDepositApprovalMsg.tdAccNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTimeDepositApprovalMsg.intRate = Mid$(RecvStr, pos, 9)
    pos = pos + 9

End Sub

