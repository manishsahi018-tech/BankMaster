VERSION 5.00
Begin VB.Form frmCardDetails 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card Maintenance"
   ClientHeight    =   8475
   ClientLeft      =   150
   ClientTop       =   405
   ClientWidth     =   11700
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8475
   ScaleWidth      =   11700
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtFullCardNo 
      Enabled         =   0   'False
      Height          =   255
      Left            =   45
      TabIndex        =   97
      Top             =   8460
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.CommandButton cmdPinApplnPrint 
      Caption         =   "Print Pin Application"
      Enabled         =   0   'False
      Height          =   375
      Left            =   9210
      TabIndex        =   91
      ToolTipText     =   "Print Pin Application"
      Top             =   6495
      Width           =   1935
   End
   Begin VB.CommandButton cmdCardApplnPrint 
      Caption         =   "Print Card Application"
      Enabled         =   0   'False
      Height          =   375
      Left            =   7110
      TabIndex        =   90
      ToolTipText     =   "Print Card Application"
      Top             =   6480
      Width           =   1935
   End
   Begin VB.Frame Frame1 
      Enabled         =   0   'False
      Height          =   495
      Left            =   7920
      TabIndex        =   74
      Top             =   5520
      Width           =   2895
      Begin VB.OptionButton optReplacement 
         Caption         =   "Replacement"
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
         Left            =   1200
         TabIndex        =   76
         Tag             =   "2895"
         ToolTipText     =   "Stolen"
         Top             =   120
         Width           =   1575
      End
      Begin VB.OptionButton optNew 
         Caption         =   "New"
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
         Left            =   120
         TabIndex        =   75
         Tag             =   "2895"
         ToolTipText     =   "Damaged"
         Top             =   120
         Value           =   -1  'True
         Width           =   975
      End
   End
   Begin VB.CommandButton cmdRestrict 
      Caption         =   "Restrict"
      Height          =   375
      Left            =   960
      TabIndex        =   72
      ToolTipText     =   "Restrict/Remove restrict"
      Top             =   6480
      Width           =   1575
   End
   Begin VB.TextBox txtBranchCode 
      Enabled         =   0   'False
      Height          =   255
      Left            =   7320
      TabIndex        =   71
      Top             =   120
      Width           =   975
   End
   Begin VB.CommandButton cmdAddresschange 
      Caption         =   "Change Address"
      Enabled         =   0   'False
      Height          =   495
      Left            =   9495
      TabIndex        =   68
      ToolTipText     =   "Change Address"
      Top             =   6960
      Width           =   1695
   End
   Begin VB.CommandButton cmdHistory 
      Caption         =   "History"
      Height          =   375
      Left            =   9495
      TabIndex        =   67
      ToolTipText     =   "History"
      Top             =   7560
      Width           =   1695
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor Comments"
      Height          =   375
      Left            =   975
      TabIndex        =   66
      ToolTipText     =   "Supervisor Comments"
      Top             =   7560
      Width           =   2055
   End
   Begin VB.Frame frameCardDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   3735
      Left            =   0
      TabIndex        =   51
      Top             =   1200
      Width           =   11775
      Begin VB.TextBox txtSubAcc 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   5235
         MaxLength       =   4
         TabIndex        =   96
         Top             =   1395
         Width           =   555
      End
      Begin VB.ComboBox cmbLedger 
         Height          =   315
         Left            =   2895
         TabIndex        =   95
         Tag             =   "11775"
         Text            =   "cmbLedger"
         Top             =   1395
         Width           =   1275
      End
      Begin VB.TextBox txtCurrency 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2490
         MaxLength       =   2
         TabIndex        =   94
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1395
         Width           =   375
      End
      Begin VB.TextBox txtCustomerNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   4200
         MaxLength       =   8
         TabIndex        =   93
         Tag             =   "11775"
         Top             =   1395
         Width           =   945
      End
      Begin VB.TextBox txtGPSUnit 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2760
         MaxLength       =   5
         TabIndex        =   18
         Tag             =   "11655"
         Top             =   3360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtGPSZipCode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8520
         MaxLength       =   5
         TabIndex        =   20
         Tag             =   "11655"
         Top             =   3360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtGPSAdditionalNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   9720
         MaxLength       =   4
         TabIndex        =   21
         Tag             =   "11655"
         Top             =   3360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtGPSStreetName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3600
         MaxLength       =   24
         TabIndex        =   14
         Tag             =   "11655"
         Top             =   2760
         Visible         =   0   'False
         Width           =   2535
      End
      Begin VB.TextBox txtGPSNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2760
         MaxLength       =   5
         TabIndex        =   13
         Tag             =   "11655"
         Top             =   2760
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.Frame FrameCustType 
         Enabled         =   0   'False
         Height          =   495
         Left            =   7440
         TabIndex        =   78
         Top             =   1320
         Width           =   4215
         Begin VB.OptionButton optPension 
            Caption         =   "Pension"
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
            Left            =   3000
            TabIndex        =   82
            Tag             =   "4215"
            Top             =   120
            Width           =   1095
         End
         Begin VB.OptionButton optCPS 
            Caption         =   "CPS"
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
            Left            =   2160
            TabIndex        =   81
            Tag             =   "4215"
            Top             =   120
            Width           =   735
         End
         Begin VB.OptionButton optPackage 
            Caption         =   "Package"
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
            Left            =   840
            TabIndex        =   80
            Tag             =   "4215"
            Top             =   120
            Width           =   1335
         End
         Begin VB.OptionButton optVip 
            Caption         =   "VIP"
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
            Left            =   120
            TabIndex        =   79
            Tag             =   "4215"
            Top             =   120
            Width           =   735
         End
      End
      Begin VB.Frame framePrimaryOrSupp 
         Height          =   495
         Left            =   2520
         TabIndex        =   55
         Tag             =   "11775"
         Top             =   120
         Width           =   3375
         Begin VB.OptionButton optPrimary 
            Caption         =   "Primary"
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
            TabIndex        =   1
            Tag             =   "3255"
            ToolTipText     =   "Primary"
            Top             =   120
            Value           =   -1  'True
            Width           =   1215
         End
         Begin VB.OptionButton optSupp 
            Caption         =   "Supplimentary"
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
            Left            =   1320
            TabIndex        =   2
            Tag             =   "3255"
            ToolTipText     =   "Supplementary"
            Top             =   120
            Width           =   1935
         End
      End
      Begin VB.Frame FrameCardType 
         Height          =   855
         Left            =   7425
         TabIndex        =   54
         Tag             =   "11775"
         Top             =   0
         Width           =   4065
         Begin VB.OptionButton optPayroll 
            Caption         =   "CPS"
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
            Left            =   2280
            TabIndex        =   92
            Tag             =   "4335"
            Top             =   510
            Width           =   975
         End
         Begin VB.OptionButton optLocalChip 
            Caption         =   "Local Chip"
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
            Left            =   2640
            TabIndex        =   89
            Tag             =   "4335"
            ToolTipText     =   "Local Chip"
            Top             =   120
            Width           =   1395
         End
         Begin VB.OptionButton optElectron 
            Caption         =   "Electron"
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
            Height          =   255
            Left            =   120
            TabIndex        =   88
            Tag             =   "4335"
            ToolTipText     =   "Electron"
            Top             =   480
            Width           =   1095
         End
         Begin VB.OptionButton optAdmin 
            Caption         =   "Admin"
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
            Height          =   195
            Left            =   1320
            TabIndex        =   87
            Tag             =   "4335"
            Top             =   510
            Width           =   975
         End
         Begin VB.OptionButton optElectronIntl 
            Caption         =   "Elec.Intl"
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
            Left            =   120
            TabIndex        =   3
            Tag             =   "4335"
            ToolTipText     =   "Electron International"
            Top             =   120
            Value           =   -1  'True
            Width           =   1095
         End
         Begin VB.OptionButton optIntlChip 
            Caption         =   "Intl.Chip"
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
            Left            =   1200
            TabIndex        =   4
            Tag             =   "4335"
            ToolTipText     =   "Internation chip"
            Top             =   120
            Width           =   1455
         End
      End
      Begin VB.TextBox txtNameOnCard 
         Height          =   345
         Left            =   2520
         MaxLength       =   26
         TabIndex        =   5
         Tag             =   "11775"
         Top             =   840
         Width           =   3255
      End
      Begin VB.Frame frameDeliveryLocations 
         Height          =   495
         Left            =   2760
         TabIndex        =   53
         Tag             =   "11775"
         Top             =   2040
         Width           =   7095
         Begin VB.OptionButton optGPS 
            Caption         =   "GPS"
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
            TabIndex        =   12
            Tag             =   "7095"
            ToolTipText     =   "Mail"
            Top             =   120
            Width           =   1095
         End
         Begin VB.OptionButton optReqBranch 
            Caption         =   "Request Branch"
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
            Height          =   315
            Left            =   1920
            TabIndex        =   10
            Tag             =   "7095"
            ToolTipText     =   "Request Branch"
            Top             =   120
            Width           =   2415
         End
         Begin VB.OptionButton optBranch 
            Caption         =   "Cust Branch"
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
            Left            =   240
            TabIndex        =   9
            Tag             =   "7095"
            ToolTipText     =   "Customer Branch"
            Top             =   120
            Value           =   -1  'True
            Width           =   1575
         End
         Begin VB.OptionButton optPoBox 
            Caption         =   "P.O.Box"
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
            Left            =   4440
            TabIndex        =   11
            Tag             =   "7095"
            ToolTipText     =   "Mail"
            Top             =   120
            Width           =   1455
         End
      End
      Begin VB.TextBox txtDeliveryAddr1 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2760
         MaxLength       =   30
         TabIndex        =   15
         Tag             =   "11775"
         Top             =   2760
         Width           =   3255
      End
      Begin VB.TextBox txtDeliveryPOBox 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2760
         MaxLength       =   10
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   3360
         Width           =   1455
      End
      Begin VB.ComboBox cmbDeliveryCity 
         Enabled         =   0   'False
         Height          =   315
         Left            =   5520
         TabIndex        =   19
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   3360
         Width           =   1575
      End
      Begin VB.TextBox txtDeliveryZipcode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8520
         MaxLength       =   10
         TabIndex        =   22
         Tag             =   "11775"
         Top             =   3360
         Width           =   1335
      End
      Begin VB.TextBox txtDeliveryAddr2 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7800
         MaxLength       =   30
         TabIndex        =   16
         Tag             =   "11775"
         Top             =   2760
         Width           =   3495
      End
      Begin VB.Frame FrameLang 
         Height          =   495
         Left            =   7440
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   840
         Width           =   4095
         Begin VB.OptionButton optArabic 
            Caption         =   "Arabic"
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
            Left            =   120
            TabIndex        =   6
            Tag             =   "4095"
            ToolTipText     =   "Arabic"
            Top             =   120
            Width           =   975
         End
         Begin VB.OptionButton optEnglish 
            Caption         =   "English"
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
            Left            =   1080
            TabIndex        =   7
            Tag             =   "4095"
            ToolTipText     =   "English"
            Top             =   120
            Width           =   1215
         End
         Begin VB.OptionButton optEngArabic 
            Caption         =   "Arabic/English"
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
            Left            =   2400
            TabIndex        =   8
            Tag             =   "4095"
            ToolTipText     =   "Arabic/English"
            Top             =   120
            Value           =   -1  'True
            Width           =   1575
         End
      End
      Begin VB.Label lblGPSAdditionalNo 
         Appearance      =   0  'Flat
         BackColor       =   &H00BFD87E&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00400000&
         Height          =   255
         Left            =   9480
         TabIndex        =   86
         Tag             =   "11655"
         Top             =   3360
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.Label lblGPSUnit 
         BackColor       =   &H00BFD87E&
         Caption         =   "Unit"
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
         Left            =   240
         TabIndex        =   85
         Tag             =   "11775"
         Top             =   3360
         Width           =   975
      End
      Begin VB.Label lblGPSAddress1 
         BackColor       =   &H00BFD87E&
         Caption         =   "GPS #-Street/Area Name"
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
         TabIndex        =   84
         Tag             =   "11775"
         Top             =   2760
         Width           =   2655
      End
      Begin VB.Label lblCustType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Customer Type"
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
         Left            =   5835
         TabIndex        =   77
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label lblAcctNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Attached Account #"
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
         Left            =   240
         TabIndex        =   69
         Top             =   1380
         Width           =   2055
      End
      Begin VB.Label lblPrimaryOrSupp 
         BackColor       =   &H00BFD87E&
         Caption         =   "Primary/Supplimentary"
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
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   240
         Width           =   2535
      End
      Begin VB.Label lblCardType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Type of Card"
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
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   240
         Width           =   1455
      End
      Begin VB.Label lblNameOnCard 
         BackColor       =   &H00BFD87E&
         Caption         =   "Name On the Card"
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
         Left            =   240
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   840
         Width           =   2055
      End
      Begin VB.Label lblDeliveryLocation 
         BackColor       =   &H00BFD87E&
         Caption         =   "Delivery Location"
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
         Left            =   240
         TabIndex        =   62
         Tag             =   "11775"
         Top             =   2160
         Width           =   1935
      End
      Begin VB.Label lblDeliveryAddress1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Delivery Address1"
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
         Left            =   240
         TabIndex        =   61
         Tag             =   "11775"
         Top             =   2760
         Width           =   1935
      End
      Begin VB.Label lblDeliveryPOBox 
         BackColor       =   &H00BFD87E&
         Caption         =   "PO Box"
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
         Left            =   240
         TabIndex        =   60
         Tag             =   "11775"
         Top             =   3360
         Width           =   1695
      End
      Begin VB.Label lblDeliveryCity 
         BackColor       =   &H00BFD87E&
         Caption         =   "City"
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
         Left            =   4560
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   3360
         Width           =   855
      End
      Begin VB.Label lblDeliveryZipCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Zip code"
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
         Left            =   7200
         TabIndex        =   58
         Tag             =   "11775"
         Top             =   3360
         Width           =   1335
      End
      Begin VB.Label lblDeliveryAddress2 
         BackColor       =   &H00BFD87E&
         Caption         =   "Address2"
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
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   2760
         Width           =   1455
      End
      Begin VB.Line Line1 
         Tag             =   "11775"
         X1              =   120
         X2              =   11880
         Y1              =   1920
         Y2              =   1920
      End
      Begin VB.Label lblLangPref 
         BackColor       =   &H00BFD87E&
         Caption         =   "Lang.Pref"
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
         TabIndex        =   56
         Tag             =   "11775"
         Top             =   840
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdForcePIN 
      Caption         =   "Force PIN Generation"
      Enabled         =   0   'False
      Height          =   495
      Left            =   7815
      TabIndex        =   50
      ToolTipText     =   "Force PIN Generation"
      Top             =   6960
      Width           =   1695
   End
   Begin VB.CommandButton cmdForceCard 
      Caption         =   "Force Card Generation"
      Enabled         =   0   'False
      Height          =   495
      Left            =   6135
      TabIndex        =   49
      ToolTipText     =   "Force Card Generation"
      Top             =   6960
      Width           =   1695
   End
   Begin VB.CommandButton cmdPIN 
      Caption         =   "Pin Recd. by Branch"
      Enabled         =   0   'False
      Height          =   495
      Left            =   4335
      TabIndex        =   48
      ToolTipText     =   "Pin Recd by Branch/Customer"
      Top             =   6960
      Width           =   1815
   End
   Begin VB.CommandButton cmdCard 
      Caption         =   "Card Recd. by Branch"
      Enabled         =   0   'False
      Height          =   495
      Left            =   2535
      TabIndex        =   47
      ToolTipText     =   "Card Receipt by Branch/Customer"
      Top             =   6960
      Width           =   1815
   End
   Begin VB.CommandButton cmdActivate 
      Caption         =   "Activate"
      Height          =   495
      Left            =   975
      TabIndex        =   46
      ToolTipText     =   "Activate/Deactivate"
      Top             =   6960
      Width           =   1575
   End
   Begin VB.TextBox txtPinGenerationStatus 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7920
      TabIndex        =   45
      Top             =   5160
      Width           =   3375
   End
   Begin VB.TextBox txtCardNo 
      Enabled         =   0   'False
      Height          =   255
      Left            =   2760
      TabIndex        =   43
      Top             =   120
      Width           =   2535
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   7935
      TabIndex        =   41
      ToolTipText     =   "Cancel"
      Top             =   7560
      Width           =   1575
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   375
      Left            =   6375
      TabIndex        =   40
      ToolTipText     =   "Reject"
      Top             =   7560
      Width           =   1575
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "Approve"
      Height          =   375
      Left            =   4695
      TabIndex        =   39
      ToolTipText     =   "Approve"
      Top             =   7560
      Width           =   1695
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Create"
      Height          =   375
      Left            =   3015
      TabIndex        =   38
      ToolTipText     =   "Create"
      Top             =   7560
      Width           =   1695
   End
   Begin VB.TextBox txtExpiryYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   8640
      MaxLength       =   4
      TabIndex        =   31
      Tag             =   "11775"
      Top             =   6120
      Width           =   615
   End
   Begin VB.ComboBox cmbExpiryMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   8040
      TabIndex        =   30
      Tag             =   "11775"
      Top             =   6120
      Width           =   615
   End
   Begin VB.ComboBox cmbExpiryDate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   7440
      TabIndex        =   29
      Tag             =   "11775"
      Top             =   6120
      Width           =   615
   End
   Begin VB.TextBox txtIssueYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   3960
      MaxLength       =   4
      TabIndex        =   28
      Tag             =   "11775"
      Top             =   6120
      Width           =   615
   End
   Begin VB.ComboBox cmbIssueMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   3360
      TabIndex        =   27
      Tag             =   "11775"
      Top             =   6120
      Width           =   615
   End
   Begin VB.ComboBox cmbIssuedate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   2760
      TabIndex        =   26
      Tag             =   "11775"
      Top             =   6120
      Width           =   615
   End
   Begin VB.ComboBox cmbCardStatus 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2760
      TabIndex        =   25
      Top             =   5640
      Width           =   2415
   End
   Begin VB.TextBox txtCardGenerationStatus 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2760
      TabIndex        =   24
      Top             =   5160
      Width           =   2415
   End
   Begin VB.TextBox txtCustomerName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6240
      TabIndex        =   33
      Top             =   600
      Width           =   3255
   End
   Begin VB.TextBox txtCustNo 
      Enabled         =   0   'False
      Height          =   255
      Left            =   2760
      TabIndex        =   23
      Top             =   600
      Width           =   1455
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
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   120
      TabIndex        =   83
      Top             =   8040
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblNewOrRepl 
      BackColor       =   &H00BFD87E&
      Caption         =   "New or Replacement"
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
      Left            =   5400
      TabIndex        =   73
      Top             =   5640
      Width           =   2295
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code : "
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
      TabIndex        =   70
      Top             =   120
      Width           =   1695
   End
   Begin VB.Line Line4 
      X1              =   0
      X2              =   11880
      Y1              =   5040
      Y2              =   5040
   End
   Begin VB.Line Line3 
      X1              =   0
      X2              =   11760
      Y1              =   1080
      Y2              =   1080
   End
   Begin VB.Label lblPinGenerationStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "PIN Generation Status"
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
      Left            =   5400
      TabIndex        =   44
      Top             =   5160
      Width           =   2415
   End
   Begin VB.Label lblCardNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Number"
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
      TabIndex        =   42
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label lblCardExpiryDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Expiry Date"
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
      Left            =   5400
      TabIndex        =   37
      Top             =   6120
      Width           =   1935
   End
   Begin VB.Label lblCardIssueDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Issue Date"
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
      TabIndex        =   36
      Top             =   6120
      Width           =   2055
   End
   Begin VB.Label lblCardStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Status"
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
      TabIndex        =   35
      Top             =   5640
      Width           =   2295
   End
   Begin VB.Label lblCardGenerationStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Generation Status"
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
      TabIndex        =   34
      Top             =   5160
      Width           =   2415
   End
   Begin VB.Label lblCustomerName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name"
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
      TabIndex        =   32
      Top             =   600
      Width           =   1815
   End
   Begin VB.Label lblCustomerNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Number"
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
      TabIndex        =   0
      Top             =   600
      Width           =   2055
   End
End
Attribute VB_Name = "frmCardDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public bAddress1 As String
Public bPoBox As String
Public bCityName As String
Public bZipCode As String

Private Sub cmbDeliveryCity_KeyPress(KeyAscii As Integer)
'  If KeyAscii > 128 Then
'     KeyAscii = 0
'     MsgBox (errNoArabicCharacters(UserLang))
'     Exit Sub
'  End If
End Sub

Private Sub cmbLedger_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbLedger.text)) <> 0 Then
         tCode = Mid$(cmbLedger.text, 1, 3)
         For i = 0 To cmbLedger.ListCount
             If Mid$(cmbLedger.List(i), 1, 3) = tCode Then
                cmbLedger.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceLedger(UserLang)
         cmbLedger.SetFocus
         Exit Sub
      End If
        
      If i > cmbLedger.ListCount Then
         MsgBox errInvalidLedger(UserLang)
         cmbLedger.SetFocus
         Exit Sub
      End If
   End If
End Sub

Private Sub cmdActivate_Click()
   Dim strmsglen As String
   Dim tUserid, tCardNo As String
   Dim deactivationType As String
   
   If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4" Or _
      recvCardPendingDetail.cardStatus = "5" Then
      LogData "Deactivation selected for the card no :" & txtCardNo & " Name : " & txtNameOnCard
      frmCardDeactivation.Show 1
'      frmCardDeactivation.txtCardNo = txtCardNo
'      frmCardDeactivation.txtNameOnCard = txtNameOnCard
'      frmCardDeactivation.cmbIssuedate = cmbIssuedate
'      frmCardDeactivation.cmbIssueMonth = cmbIssueMonth
'      frmCardDeactivation.txtIssueYear = txtIssueYear
'      frmCardDeactivation.cmbExpiryDate = cmbExpiryDate
'      frmCardDeactivation.cmbExpiryMonth = cmbExpiryMonth
'      frmCardDeactivation.txtExpiryYear = txtExpiryYear
   Else
      tCardNo = Format(txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
      tUserid = Format(gUserId, "!@@@@@@@@@@")
      LogData "Msg sent for Activation for the card No : " & txtCardNo
      SendMsg = "000268" & "28" & gBranchCode & tUserid & tCardNo & "A" & " "
     
      strmsglen = Format(Len(SendMsg), "000000")
      Mid$(SendMsg, 1, 6) = strmsglen
      DataReceivedFlag = False
      frmCardDetails.MousePointer = vbHourglass
      frmCardDetails.cmdActivate.Enabled = False
          
      ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
      If ReturnStatus = LocalCommsError Then
         LoadError = True
         frmCardDetails.MousePointer = vbDefault
         frmCardDetails.cmdActivate.Enabled = True
         Exit Sub
      End If
     
      frmCardDetails.MousePointer = vbDefault
      frmCardDetails.cmdActivate.Enabled = True
     
      If recvCustomerMsg.status = "000" Then
         MsgBox errSuccessful(UserLang)
      Else
         If UserLang = ARABIC Then
            MsgBox recvCustomerMsg.aRemarks
         Else
            MsgBox recvCustomerMsg.eRemarks
         End If
      End If
      Unload Me
   End If
End Sub

Private Sub cmdAddresschange_Click()
    Dim tUserid As String, tCardNo As String
    Dim tCode As String
    Dim address1 As String, poBox As String, zipCode As String
    Dim strmsglen As String

    If optPoBox.Value = True Then
       If Len(RTrim(txtDeliveryAddr1)) = 0 Or _
          Len(RTrim(txtDeliveryPOBox)) = 0 Or _
          Len(RTrim(txtDeliveryZipcode)) = 0 Or _
          Len(RTrim(cmbDeliveryCity.text)) = 0 Then
          MsgBox errSpaceDeliveryAddress(UserLang)
          txtDeliveryAddr1.SetFocus
          Exit Sub
       End If
       
       address1 = txtDeliveryAddr1
       poBox = txtDeliveryPOBox
       zipCode = txtDeliveryZipcode
    ElseIf optGPS.Value = True Then
       If Len(RTrim(txtGPSNo)) = 0 Or _
          Len(RTrim(txtGPSStreetName)) = 0 Or _
          Len(RTrim(txtGPSUnit)) = 0 Or _
          Len(RTrim(txtGPSZipCode)) = 0 Or _
          Len(RTrim(txtGPSAdditionalNo)) = 0 Or _
          Len(RTrim(cmbDeliveryCity)) = 0 Then
                  
          MsgBox errSpaceDeliveryGPSAddress(UserLang)
          txtGPSNo.SetFocus
          Exit Sub
       End If
       address1 = txtGPSNo & "-" & txtGPSStreetName
       poBox = txtGPSUnit
       zipCode = txtGPSZipCode & "-" & txtGPSAdditionalNo
    End If
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    tCardNo = Format(txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
    
    If optBranch Then
       tCode = "C"
    ElseIf optReqBranch Then
       tCode = "R"
    ElseIf optPoBox Then
       tCode = "P"
    Else ' GPS
       tCode = "G"
    End If
    LogData "Message sent to change the address for the card no  :" & txtCardNo
    SendMsg = "000000" & "49" & gBranchCode & tUserid & tCardNo & _
              tCode & Format(address1, "!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@") & _
              Format(txtDeliveryAddr2, "!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@") & _
              Format(poBox, "!@@@@@@@@@@") & _
              Format(cmbDeliveryCity, "!@@@@@@@@@@@@@@@@@@@@") & _
              Format(zipCode, "!@@@@@@@@@@") & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardDetails.MousePointer = vbHourglass
         
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardDetails.MousePointer = vbDefault
       Exit Sub
    End If
   
    frmCardDetails.MousePointer = vbDefault
      
    If recvCustomerMsg.status = "000" Then
       MsgBox errSuccessful(UserLang)
    Else
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
    End If
   
    Unload Me
    
End Sub

Private Sub cmdApprove_Click()
   Dim tUserid As String
   Dim tDateTime As String
   Dim tBranchCode As String
   Dim tSupervisorId As String
   Dim tCardNo As String
   Dim tRow As Integer
   Dim strmsglen As String
   
   tRow = frmCardPendingList.cardPendingGrid.Row
   frmCardPendingList.cardPendingGrid.Col = 0
   tUserid = Format(frmCardPendingList.cardPendingGrid.text, "!@@@@@@@@@@")
   frmCardPendingList.cardPendingGrid.Col = 1
   tDateTime = Format(frmCardPendingList.cardPendingGrid.text, "00000000000000")
   frmCardPendingList.cardPendingGrid.Col = 2
   'tCardNo = Format(frmCardPendingList.cardPendingGrid.text, "!@@@@@@@@@@@@@@@@@@@")
   tCardNo = Format(recvCardPendingList.details(tRow).cardNo, "!@@@@@@@@@@@@@@@@@@@")
   
   tBranchCode = gBranchCode

   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   LogData "Message sent for approving card no :" & txtCardNo & "  and NewOrUpdate flag : [" & recvCardPendingDetail.newOrUpdate & "]"
   SendMsg = "000268" & "32" & gBranchCode & "A" & tUserid & tDateTime & _
             tCardNo & tSupervisorId & Space(200) & recvCardPendingDetail.newOrUpdate & Space(5)
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmCardDetails.MousePointer = vbHourglass
   frmCardDetails.cmdApprove.Enabled = False
   frmCardDetails.cmdReject.Enabled = False
   frmCardDetails.cmdCancel.Enabled = False
   frmCardDetails.cmdSupervisorComments.Enabled = False
      
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmCardDetails.MousePointer = vbDefault
      frmCardDetails.cmdApprove.Enabled = True
      frmCardDetails.cmdReject.Enabled = True
      frmCardDetails.cmdCancel.Enabled = True
      frmCardDetails.cmdSupervisorComments.Enabled = True
      Exit Sub
   End If
   
   frmCardDetails.MousePointer = vbDefault
   frmCardDetails.cmdApprove.Enabled = True
   frmCardDetails.cmdReject.Enabled = True
   frmCardDetails.cmdCancel.Enabled = True
   frmCardDetails.cmdSupervisorComments.Enabled = True
   
   If recvCardApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
      If recvCardPendingDetail.newOrUpdate = "N" Then
         MsgBox errCardNoAlloted(UserLang) & maskCardNo(recvCardApprovalMsg.cardNo)
         txtFullCardNo = recvCardApprovalMsg.cardNo
      End If
   Else
      If UserLang = ARABIC Then
         MsgBox recvCardApprovalMsg.aRemarks
      Else
         MsgBox recvCardApprovalMsg.eRemarks
      End If
      unloadCardForms
      Exit Sub
   End If
   
    If cardProductionAtBranch Or pinSelectAtBranch Then
       frmPrintingCard.txtCardNo = recvCardApprovalMsg.cardNo
       frmPrintingCard.txtNameOnCard = recvCardApprovalMsg.nameOnTheCard
       If frmCardDetails.optPrimary = True Then
          frmPrintingCard.txtCardType = "PRIMARY"
       Else
          frmPrintingCard.txtCardType = "SUPPLEMENTARY"
       End If
       If recvCardPendingDetail.newOrUpdate = "N" Then
          If recvCardApprovalMsg.branchPinSelect = "Y" Then
             If cardProductionAtBranch = True And _
                optIntlChip.Value = False And _
                optLocalChip.Value = False Then
                frmPrintingCard.frameCardApproval.Enabled = True
                frmPrintingCard.optCardPrdnYes.Value = True
             Else
                frmPrintingCard.frameCardApproval.Enabled = False
                frmPrintingCard.optCardPrdnNo.Value = True
             End If
             If pinSelectAtBranch = True Then
                frmPrintingCard.framePinApproval.Enabled = True
                frmPrintingCard.optPinSelectYes.Value = True
             Else
                frmPrintingCard.framePinApproval.Enabled = False
                frmPrintingCard.optCardPrdnNo.Value = True
             End If
             frmPrintingCard.Show vbModal
             Exit Sub
          End If
      End If
    End If
    If recvCardPendingDetail.requestType = "3" Then 'force pin
       If pinSelectAtBranch = True And recvCardApprovalMsg.branchPinSelect = "Y" Then
          frmPrintingCard.optCardPrdnNo.Value = True
          frmPrintingCard.frameCardApproval.Enabled = False
          frmPrintingCard.framePinApproval.Enabled = True
          frmPrintingCard.optPinSelectYes.Value = True
          frmPrintingCard.Show vbModal
       Else
          unloadCardForms
       End If
    ElseIf recvCardPendingDetail.requestType = "2" Then 'force card
       If cardProductionAtBranch = True And recvCardApprovalMsg.branchCardPrdn = "Y" And _
          optIntlChip.Value = False And _
          optLocalChip.Value = False Then
          frmPrintingCard.frameCardApproval.Enabled = True
          frmPrintingCard.optCardPrdnYes.Value = True
          frmPrintingCard.optPinSelectNo.Value = True
          frmPrintingCard.framePinApproval.Enabled = False
          frmPrintingCard.Show vbModal
       Else
          unloadCardForms
       End If
    Else
       unloadCardForms
    End If
    
End Sub
Public Sub unloadCardTellerForms()
   Dim tCustNo As String
   If Len(Trim(frmCardPendingList.txtCustomerNo)) = 0 Then
      tCustNo = Space(8)
   Else
      tCustNo = Format(frmCardPendingList.txtCustomerNo, "00000000")
   End If
   Unload Me
   Unload frmCardPendingList
   If cardTellerAction Then
      frmEnquiry.readCardPendingList "00000", "T", tCustNo
   Else
      frmEnquiry.readCardPendingList "00000", "C", tCustNo
   End If
   If UserLang = ARABIC Then
      ChangePositions frmCardPendingList, 11800
      frmCardPendingList.RightToLeft = True
      frmCardPendingList.Hide
   End If
   frmCardPendingList.Show
End Sub
   
Public Sub unloadCardForms()
   Dim tCustNo As String
   If Len(Trim(frmCardPendingList.txtCustomerNo)) = 0 Then
      tCustNo = Space(8)
   Else
      tCustNo = Format(frmCardPendingList.txtCustomerNo, "00000000")
   End If

   Unload Me
   Unload frmCardGrid
   Unload frmCardPendingList
   frmEnquiry.readCardPendingList "00000", "S", tCustNo
   If UserLang = ARABIC Then
      ChangePositions frmCardPendingList, 11800
      frmCardPendingList.RightToLeft = True
      frmCardPendingList.Hide
   End If
   frmCardPendingList.Show
End Sub

Private Sub cmdCancel_Click()
  If cbsCardCreationAction = True Then
     unloadCardTellerForms
  Else
     Unload Me
  End If
End Sub

Private Sub cmdCard_Click()
  Dim strmsglen As String
    
  statusUpdateMsg.msgLen = "000000"
  statusUpdateMsg.service = "27"
  statusUpdateMsg.homeBranch = gBranchCode
  statusUpdateMsg.userId = Format(gUserId, "!@@@@@@@@@@")
  statusUpdateMsg.cardOrPin = "C"
  statusUpdateMsg.requestStatus = cmdCard.tag
  statusUpdateMsg.noOfRecs = "01"
  statusUpdateMsg.cardNo(1) = Format(txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
  
  SendMsg = statusUpdateMsg.msgLen & statusUpdateMsg.service & _
            statusUpdateMsg.homeBranch & statusUpdateMsg.userId & _
            statusUpdateMsg.noOfRecs & statusUpdateMsg.cardOrPin & _
            statusUpdateMsg.requestStatus & Space(10) & statusUpdateMsg.cardNo(1)
            
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmCardDetails.MousePointer = vbHourglass
   frmCardDetails.cmdCard.Enabled = False
   frmCardDetails.cmdPIN.Enabled = False
   frmCardDetails.cmdCreate.Enabled = False
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmCardDetails.MousePointer = vbDefault
      frmCardDetails.cmdCard.Enabled = True
      If recvCardPendingDetail.pinRequestStatus = "3" Or _
         recvCardPendingDetail.pinRequestStatus = "4" Then
         frmCardDetails.cmdPIN.Enabled = True
      End If
      Exit Sub
   End If
   
   frmCardDetails.MousePointer = vbDefault
   frmCardDetails.cmdCard.Enabled = True
   If recvCardPendingDetail.pinRequestStatus = "3" Or _
      recvCardPendingDetail.pinRequestStatus = "4" Then
      frmCardDetails.cmdPIN.Enabled = True
   End If
    
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ENGLISH Then
         MsgBox recvCustomerMsg.eRemarks
      Else
         MsgBox recvCustomerMsg.aRemarks
      End If
   End If
   
   Unload Me

End Sub

Private Sub cmdCardApplnPrint_Click()
    
    Dim i As Integer
    Dim applnFile As String
    Dim applnLang As Integer
    Dim strmsglen As String
    Dim tmpStr As String
    Dim tCode As String
    Dim response
    Dim fso As FileSystemObject
    Dim page As Integer
    Dim lines As Integer
    Dim textStream As Object
    Dim fsys As Object
    Dim langChar As String
    Dim idNumber As String
    Dim tmpStr1 As String, tmpStr2 As String, tmpStr3 As String, tmpStr4 As String
    Dim tmpStr5 As String, tmpStr6 As String, tmpStr7 As String, tmpStr8 As String
    Dim tmpStr9 As String, tmpStr10 As String
    
    
    If Len(RTrim(txtNameOnCard)) = 0 Then
       MsgBox errSpaceNameOnCard(UserLang)   '"Name cannot be spaces...Please enter.."
       txtNameOnCard.SetFocus
       Exit Sub
    End If

    If arabicCharFound(txtNameOnCard) Then
       MsgBox errNoArabicCharacters(UserLang)
       txtNameOnCard.SetFocus
       Exit Sub
    End If

    If checkForSpecialChars(Trim(txtNameOnCard)) = False Then
       MsgBox errInvalidChar(UserLang) ' "Invalid characters found in the name..Please check and remove"
       txtNameOnCard.SetFocus
       Exit Sub
    End If

    If Len(Trim(txtSubAcc)) = 0 Then
       MsgBox errSpaceSubAcc(UserLang)
       txtSubAcc.SetFocus
       Exit Sub
    End If

    If optPoBox.Value = True Then
       If Len(RTrim(txtDeliveryAddr1)) = 0 Or _
          Len(RTrim(txtDeliveryPOBox)) = 0 Or _
          Len(RTrim(txtDeliveryZipcode)) = 0 Or _
          Len(RTrim(cmbDeliveryCity.text)) = 0 Then
          MsgBox errSpaceDeliveryAddress(UserLang)
          txtDeliveryAddr1.SetFocus
          Exit Sub
       End If
    ElseIf optGPS.Value = True Then
       If Len(RTrim(txtGPSNo)) = 0 Or _
          Len(RTrim(txtGPSStreetName)) = 0 Or _
          Len(RTrim(txtGPSUnit)) = 0 Or _
          Len(RTrim(txtGPSZipCode)) = 0 Or _
          Len(RTrim(txtGPSAdditionalNo)) = 0 Or _
          Len(RTrim(cmbDeliveryCity.text)) = 0 Then
          MsgBox errSpaceDeliveryGPSAddress(UserLang)
          txtGPSNo.SetFocus
          Exit Sub
       End If
    End If

    Set fsys = CreateObject("scripting.filesystemobject")

    Set fso = CreateObject("Scripting.FileSystemObject")
    If recvCardSearchMsg.customerLang = "0" Then
       applnLang = 0 ' Arabic
    Else
       applnLang = 1 ' for english
    End If
    
    If applnLang = 0 Then
       langChar = Chr$(254) ' for arabic
       Printer.RightToLeft = True ' for arabic
    Else
       langChar = Chr$(253) ' for english
       Printer.RightToLeft = False ' for english
    End If
           
    Printer.Orientation = vbPRORPortrait
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 10
    Printer.CurrentX = 0
    Printer.CurrentY = 0
    
    'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
    Printer.PaintPicture frmLogin.anbLogo1, 50, 200
    For i = 1 To 6
        Printer.Print
    Next
    lines = 4
    page = 1
    Printer.FontBold = True
    Printer.FontSize = 20
    Printer.Print Space(10) & appAtmCardAppln(applnLang) & langChar & Space(15)
    Printer.FontBold = False
    Printer.FontSize = 10
    Printer.Print Space(65) & appPage(applnLang) & ":" & Space(3) & page '60 to 65
    Printer.Print
    Printer.Print
    Printer.FontBold = True
    Printer.Print appTheManagerAnb(applnLang)
    Printer.FontBold = False
    Printer.Print
    Printer.Print appDate(applnLang) & langChar & ":" & Space(5) & Format(Date$, "dd/mm/yyyy") & langChar
    tCode = gBranchCode
    Set rs = db.OpenRecordset("select * from branchinfo where branchcode='" & tCode & "'")
    If rs.recordCount > 0 Then
       If applnLang = ENGLISH Then
          tmpStr = rs("branchcode") & " - " & rs("englishname")
       Else
          tmpStr = rs("branchcode") & " - " & rs("arabicname")
       End If
    Else
       tmpStr = tCode & "-" & appUnknown(applnLang)
    End If
    Printer.Print appBranch(applnLang) & langChar & ":" & Space(5) & tmpStr & langChar
    lines = lines + 1
    Printer.Print
    Printer.Print appPleaseIssueAtmCard(applnLang)
    Printer.Print appAsPerFollowing(applnLang)
    Printer.Print String(80, "-")
    Printer.Print
    
    If cbsCardCreationAction = True Then
       recvCardSearchMsg.eShortName = recvCardPendingDetail.custName
       recvCardSearchMsg.aShortName = recvCardPendingDetail.custName
    End If
    
    If applnLang = ENGLISH Then
       If Len(RTrim(recvCardSearchMsg.eShortName)) = 0 Then
          tmpStr = recvCardSearchMsg.aShortName
       Else
          tmpStr = recvCardSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvCardSearchMsg.aShortName)) = 0 Then
          tmpStr = recvCardSearchMsg.eShortName
       Else
          tmpStr = recvCardSearchMsg.aShortName
       End If
    End If
    Printer.Print Space(5) & appAccHoldersName(applnLang) & langChar & Space(16) & tmpStr & langChar '10 to 16
    Printer.Print
    
    If optPoBox Then
       tCode = "P"
    ElseIf optGPS Then
       tCode = "G"
    Else
       tCode = "B"
    End If
    
   If tCode = "B" Then
      tmpStr2 = appBranchDelivery(applnLang)
   Else
      tmpStr2 = appMailDelivery(applnLang)
   End If
   Printer.Print Space(5) & appCardDeliveryChannel(applnLang) & langChar & Space(15) & tmpStr2 & langChar '10 to 15
   Printer.Print
   Printer.Print Space(5) & appMailingAddress(applnLang) & langChar
   Printer.Print Space(5) & String(20, "-")
   Printer.Print
 
   If tCode = "G" Then
      tmpStr1 = Format(frmCardDetails.txtGPSNo, "!@@@@@") & "-" & _
                Format(frmCardDetails.txtGPSStreetName, "!@@@@@@@@@@@@@@@@@@@@@@@@")
      tmpStr2 = Space(30)
      tmpStr3 = frmCardDetails.txtGPSUnit
      tmpStr5 = Format(frmCardDetails.txtGPSZipCode, "!@@@@@") & "-" & _
                Format(frmCardDetails.txtGPSAdditionalNo, "!@@@@")
   Else
      tmpStr1 = frmCardDetails.txtDeliveryAddr1
      tmpStr2 = frmCardDetails.txtDeliveryAddr2
      tmpStr3 = frmCardDetails.txtDeliveryPOBox
      tmpStr5 = frmCardDetails.txtDeliveryZipcode
   End If
   tmpStr4 = frmCardDetails.cmbDeliveryCity
    
   Printer.Print Space(5) & IIf(tCode = "G", appGpsStreetName(applnLang), appAddress1(applnLang)) & langChar & Space(5) & ":" & tmpStr1
   If tCode <> "G" Then
      Printer.Print Space(5) & appAddress2(applnLang) & langChar & Space(5) & ":" & tmpStr2
   End If
   
   Printer.Print Space(5) & IIf(tCode = "G", appUnit(applnLang), appPoBox(applnLang)) & langChar & Space(2) & ":" & tmpStr3 & Space(5) & _
                 appCity(applnLang) & langChar & Space(2) & ":" & tmpStr4 & Space(5) & _
                 appZipcode(applnLang) & langChar & Space(2) & ":" & tmpStr5
   Printer.Print
   Printer.Print Space(5) & appHomePhone(applnLang) & Space(10) & recvCardSearchMsg.homeTelNo & langChar '15 to 10
   Printer.Print
   Printer.Print Space(5) & appOffPhone(applnLang) & Space(10) & recvCardSearchMsg.offTelNo & langChar '15 to 10
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print Space(5) & appNameOnTheCard(applnLang) & Space(15) & Format(txtNameOnCard, "!@@@@@@@@@@@@@@@@@@@@@@@@@@") & langChar
   Printer.Print
   If optArabic Then
      tmpStr = appArabic(applnLang)
   ElseIf optEnglish Then
      tmpStr = appEnglish(applnLang)
   Else
      tmpStr = appBilingual(applnLang)
   End If
   Printer.Print Space(5) & appAtmScreenLang(applnLang) & Space(5) & tmpStr & langChar
   Printer.Print
   Printer.FontBold = True
   Printer.FontSize = 13
   'Printer.Print Space(4) & appCurrentAcct(applnLang) & Space(11) & frmCardDetails.txtAcctNo & frmCardDetails.txtSubAcc & langChar '5 to 4 and 15 to 11
   Printer.Print Space(4) & appCurrentAcct(applnLang) & Space(11) & frmCardDetails.txtCurrency & Mid$(frmCardDetails.cmbLedger, 1, 2) & frmCardDetails.txtCustomerNo & frmCardDetails.txtSubAcc & langChar '5 to 4 and 15 to 11
   Printer.Print Space(4) & appForCashWithdrawal(applnLang) & langChar '5 to 4
   Printer.FontBold = False
   Printer.FontSize = 10
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.FontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\ATMCardReq_eng.txt"
   Else
      tmpStr10 = App.Path & "\ATMCardReq_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
      Wend
      textStream.Close
   End If
   Printer.Print
   Printer.Print
   'Added by Mohit on 03-Dec-2006 as per Mohammed A. Tanenah's mail on 02-Dec-2006
   'Printer.Print
   'Printer.Print
   If cardProductionAtBranch Then
        Printer.FontBold = True
        If applnLang = ENGLISH Then
           Printer.Print appAtmNo(applnLang) & Space(1) & frmCardDetails.txtFullCardNo & Space(1) & appCardNoWasRecv(applnLang) & langChar
        Else
           Printer.Print appCardNoWasRecv(applnLang) & Space(1) & frmCardDetails.txtFullCardNo & langChar
        End If
        Printer.FontBold = False
        Printer.Print
        Printer.Print appDate(applnLang) & Space(6) & ":" & Space(1) & langChar & Format(Date$, "dd/mm/yyyy") & langChar
        If applnLang = ENGLISH Then
            If Len(RTrim(recvCardSearchMsg.eShortName)) = 0 Then
               tmpStr = recvCardSearchMsg.aShortName
            Else
               tmpStr = recvCardSearchMsg.eShortName
            End If
         Else
            If Len(RTrim(recvCardSearchMsg.aShortName)) = 0 Then
               tmpStr = recvCardSearchMsg.eShortName
            Else
               tmpStr = recvCardSearchMsg.aShortName
            End If
         End If
        Printer.Print appCustName(applnLang) & ":" & Space(1) & langChar & tmpStr & langChar
        Printer.Print
        Printer.Print appSignature(applnLang) & langChar
        Printer.Print
'        Printer.Print
'        Printer.Print
'        Printer.FontBold = True
'        Printer.Print Space(25) & appCustSignVerif(applnLang) & langChar & Space(24)
'        Printer.Print
'        Printer.Print
'        Printer.Print
'        Printer.Print
'        Printer.FontBold = False
'        Printer.Print appCustSrvRepNameSign(applnLang) & langChar & Space(16) & appCustSrvSuprNameSign(applnLang) & langChar
   Else
        Printer.FontBold = True
        Printer.Print appAtmNo(applnLang) & Space(5) & ":" & frmCardDetails.txtFullCardNo & langChar
        Printer.FontBold = False
        Printer.Print
        Printer.Print
        Printer.Print
        Printer.Print Space(5) & appAccHoldersSign(applnLang) & langChar
        Printer.FontSize = 8
        Printer.Print Space(5) & appPlsSignAsAccSign(applnLang) & langChar
        Printer.FontSize = 10
        Printer.Print
        Printer.Print
        Printer.Print Space(25) & appDate(applnLang) & ":" & langChar
   End If
   'till here...Mohit
   'Added by Rajesh on 8th April 2007 as per mail from Tanenah on 24 Mar 2007 to
   'include customer signature verification information on all application forms
   Printer.Print
   Printer.Print
   Printer.FontBold = True
   Printer.Print Space(25) & appCustSignVerif(applnLang) & langChar & Space(24)
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.FontBold = False
   Printer.Print appCustSrvRepNameSign(applnLang) & langChar & Space(16) & appCustSrvSuprNameSign(applnLang) & langChar
   
   Printer.Print
   Printer.Print
   
'   Printer.Print String(80, "-")
'   Printer.FontBold = True
'   Printer.Print appBankUseOnly(applnLang)
'   Printer.FontBold = False
'   Printer.Print String(80, "-")
'   Printer.Print

   Printer.NewPage
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   For i = 1 To 6
       Printer.Print
   Next
   lines = 5
   page = page + 1
   Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
   lines = lines + 1
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.FontBold = True
   Printer.Print appAtmCardTerms(applnLang)
   lines = lines + 1
   Printer.FontBold = False
   Printer.Print String(80, "-")
   lines = lines + 1
   Printer.Print
   Printer.FontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\cardTerms_eng.txt"
   Else
      tmpStr10 = App.Path & "\cardTerms_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
          lines = lines + 1
          If lines > 70 Then
             Printer.Print Space(40) & appContd(applnLang) & langChar
             Printer.NewPage
             page = page + 1
             'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
             Printer.PaintPicture frmLogin.anbLogo1, 50, 200
             For i = 1 To 6
                 Printer.Print
             Next
             lines = 4
             Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
             lines = lines + 1
             Printer.Print
             Printer.Print
          End If
      Wend
      textStream.Close
   End If
   Printer.Print
   
   Printer.EndDoc
   On Error GoTo 0
   Exit Sub

err_handler:

If Err.Number = 53 Or Err.Number = 76 Then
   If UserLang = ARABIC Then
      tmpStr = tmpStr10 & "„·› «·≈ﬁ—«—/«·‘—Êÿ Ê«·√Õﬂ«„ €Ì— „ÊÃÊœ ; «·≈ﬁ—«—/«·‘—Êÿ Ê«·√Õﬂ«„ ·‰  ÿ»⁄.."
   Else
      tmpStr = "Declaration/Terms&conditions  file (" & tmpStr10 & ") does not exist ; Declaration/Terms&conditions will not be printed.."
   End If
   MsgBox tmpStr
   tCode = "1"
   Resume Next
Else
   Resume Next
End If

   
End Sub

Private Sub cmdCreate_Click()
Dim strmsglen As String
Dim customerPin As String
Dim tAccNo As String

If Len(RTrim(txtNameOnCard)) = 0 Then
   MsgBox errSpaceNameOnCard(UserLang)   '"Name cannot be spaces...Please enter.."
   txtNameOnCard.SetFocus
   Exit Sub
End If

If arabicCharFound(txtNameOnCard) Then
   MsgBox errNoArabicCharacters(UserLang)
   txtNameOnCard.SetFocus
   Exit Sub
End If

If checkForSpecialChars(Trim(txtNameOnCard)) = False Then
   MsgBox errInvalidChar(UserLang) ' "Invalid characters found in the name..Please check and remove"
   txtNameOnCard.SetFocus
   Exit Sub
End If

tAccNo = Format(txtCurrency, "!@@") & Format(Mid$(cmbLedger, 1, 2), "!@@") & _
         Format(txtCustomerNo, "!@@@@@@@@") & Format(txtSubAcc, "!@@@@")

If Len(Trim(txtSubAcc)) <> 4 Then
   MsgBox errInvalidSubAcc(UserLang)
   txtSubAcc.SetFocus
   Exit Sub
End If

If optPoBox.Value = True Then
   If Len(RTrim(txtDeliveryAddr1)) = 0 Or _
      Len(RTrim(txtDeliveryPOBox)) = 0 Or _
      Len(RTrim(txtDeliveryZipcode)) = 0 Or _
      Len(RTrim(cmbDeliveryCity.text)) = 0 Then
      MsgBox errSpaceDeliveryAddress(UserLang)
      txtDeliveryAddr1.SetFocus
      Exit Sub
   End If
  
'  If arabicCharFound(txtDeliveryAddr1) Then
'      MsgBox errNoArabicAddress(UserLang)
'      txtDeliveryAddr1.SetFocus
'      Exit Sub
'  End If
'
'  If arabicCharFound(cmbDeliveryCity) Then
'     MsgBox errNoArabicAddress(UserLang)
'     txtDeliveryAddr1.SetFocus
'     Exit Sub
'  End If
   If Trim(txtDeliveryPOBox) = "0" Or _
      Trim(txtDeliveryZipcode) = "0" Then
      MsgBox errPoOrZipCannotBeZero(UserLang)
      txtDeliveryPOBox.SetFocus
      Exit Sub
   End If
ElseIf optGPS.Value = True Then
   If Len(RTrim(txtGPSNo)) = 0 Or _
      Len(RTrim(txtGPSStreetName)) = 0 Or _
      Len(RTrim(txtGPSUnit)) = 0 Or _
      Len(RTrim(txtGPSZipCode)) = 0 Or _
      Len(RTrim(txtGPSAdditionalNo)) = 0 Or _
      Len(RTrim(cmbDeliveryCity.text)) = 0 Then
      MsgBox errSpaceDeliveryGPSAddress(UserLang)
      txtGPSNo.SetFocus
      Exit Sub
   End If
End If

atmPin = Space(4)
formatCardRequest
createCardRequest

End Sub
Public Sub createCardRequest()
Dim strmsglen As String

If cardInfo.creationOrUpdate = "C" Then
   LogData "Message sent for New card for customer no : " & cardInfo.custNo
Else
   LogData "Message sent for CSO Pending action for the cust no : " & cardInfo.custNo
End If
SendMsg = cardInfo.msgLen & cardInfo.service & cardInfo.homeBranch & _
          cardInfo.userId & cardInfo.branchCode & cardInfo.dateTime & _
          cardInfo.creationOrUpdate & cardInfo.newOrUpdate & cardInfo.supervisorId & _
          cardInfo.custNo & cardInfo.cardNo & cardInfo.cardType & cardInfo.newOrReplacement & _
          cardInfo.primaryOrSupplementary & cardInfo.cardStatus & _
          cardInfo.regionCode & cardInfo.languageCode & cardInfo.customerBranch & _
          cardInfo.nameOnTheCard & cardInfo.subAcc & cardInfo.deliveryToBranchOrPO & _
          cardInfo.address1 & cardInfo.address2 & cardInfo.poBox & _
          cardInfo.cityName & cardInfo.zipCode & cardInfo.firstIssueDate & _
          cardInfo.expiryDate & cardInfo.supervisorComments & Space(1) & _
          cardInfo.idNo & cardInfo.coreAccNo & Space(10)

strmsglen = Format(Len(SendMsg), "000000")
Mid$(SendMsg, 1, 6) = strmsglen
DataReceivedFlag = False

frmCardDetails.MousePointer = vbHourglass
frmCardDetails.cmdCreate.Enabled = False
         
If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
   LoadError = True
   frmCardDetails.MousePointer = vbDefault
   frmCardDetails.cmdCreate.Enabled = True
   Exit Sub
End If

If recvCardMsg.status = "000" Then
   MsgBox errSuccessful(UserLang)
   If cardInfo.newOrUpdate = "N" And cardInfo.creationOrUpdate = "C" Then
      MsgBox errCardNoAlloted(UserLang) & maskCardNo(recvCardMsg.cardNo)
      frmCardDetails.txtCardNo = maskCardNo(recvCardMsg.cardNo)
      frmCardDetails.txtFullCardNo = recvCardMsg.cardNo
   End If
   cardInfo.dateTime = recvCardMsg.dateTime
Else
   If UserLang = ENGLISH Then
      MsgBox recvCardMsg.eRemarks
   Else
      MsgBox recvCardMsg.aRemarks
   End If
   frmCardDetails.MousePointer = vbDefault
   frmCardDetails.cmdCreate.Enabled = True
   If cardTellerAction Then
      unloadCardTellerForms
      Exit Sub
   Else
      Exit Sub
   End If
End If

frmCardDetails.MousePointer = vbDefault
frmCardDetails.cmdCreate.Enabled = True

If cardInfo.newOrUpdate = "N" Or recvCardPendingDetail.requestType = "3" Then
   cmdCardApplnPrint.Enabled = True 'Added by Mohit on 03-12-2006 as Card & Pin application
                                    'printing is to be allowed once new card is got generated. Arul requested

   If pinSelectAtBranch = True And cardInfo.creationOrUpdate <> "U" Then
      atmPin = Space(4)
      frmAcceptPin.tag = "I" ' Initiated from CMS
      If cardInfo.primaryOrSupplementary = "P" Then
         frmAcceptPin.txtCardType = "Primary"
      Else
         frmAcceptPin.txtCardType = "Supplementary"
      End If
      cmdPinApplnPrint.Enabled = True  'Added by Mohit on 03-12-2006 as Card & Pin application
                                       'printing is to be allowed once new card is got generated. Arul requested
      frmAcceptPin.txtNameOnTheCard = cardInfo.nameOnTheCard
      frmAcceptPin.Show vbModal
   Else
      If cardTellerAction Then
         unloadCardTellerForms
      Else
         If recvCardMsg.status = "000" Then
            'Unload Me 'Commented by Mohit on 04-12-2006 as frmCardDetails form should not be
                       'unloaded so as user can get an option to print Card or Pin application. Arul requested
            Exit Sub
         End If
      End If
   End If
Else
   If cardTellerAction Then
      unloadCardTellerForms
   Else
      If recvCardMsg.status = "000" Then
         Unload Me
         Exit Sub
      End If
   End If
End If

End Sub
Private Sub cmdForceCard_Click()
    atmPin = Space(4)
    forceCardGenerate "C", atmPin
End Sub

Private Sub cmdForcePIN_Click()
   atmPin = Space(4)
   forceCardGenerate "P", atmPin
End Sub

Private Sub cmdHistory_Click()
    Dim strmsglen
    Dim tCardNo As String
    
    tCardNo = Format(txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
    LogData "Sending Request message for getting History details for the card # : " & txtCardNo
    SendMsg = "000000" & "36" & gBranchCode & tCardNo & "0" & Space(15)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardDetails.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardDetails.MousePointer = vbDefault
       Exit Sub
    End If
    frmCardDetails.MousePointer = vbDefault
    
    parseCardHistoryDetails
    LogData "Return status received from server for history request message  :  " & recvCardHistory.status
    If recvCardHistory.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCardHistory.aRemarks
       Else
          MsgBox recvCardHistory.eRemarks
       End If
       Exit Sub
    End If
 
    frmCardHistory.Show
    frmCardHistory.txtCardNo = txtCardNo
    frmCardHistory.txtNameOnCard = txtNameOnCard
End Sub

Private Sub cmdPIN_Click()
  Dim strmsglen As String
  
  statusUpdateMsg.msgLen = "000000"
  statusUpdateMsg.service = "27"
  statusUpdateMsg.homeBranch = gBranchCode
  statusUpdateMsg.userId = Format(gUserId, "!@@@@@@@@@@")
  statusUpdateMsg.cardOrPin = "P"
  statusUpdateMsg.requestStatus = cmdPIN.tag
  statusUpdateMsg.noOfRecs = "01"
  statusUpdateMsg.cardNo(1) = Format(txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
  
  SendMsg = statusUpdateMsg.msgLen & statusUpdateMsg.service & _
            statusUpdateMsg.homeBranch & statusUpdateMsg.userId & _
            statusUpdateMsg.noOfRecs & statusUpdateMsg.cardOrPin & _
            statusUpdateMsg.requestStatus & Space(10) & statusUpdateMsg.cardNo(1)
            
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmCardDetails.MousePointer = vbHourglass
   frmCardDetails.cmdPIN.Enabled = False
   frmCardDetails.cmdCard.Enabled = False
   frmCardDetails.cmdCreate.Enabled = False
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmCardDetails.MousePointer = vbDefault
      frmCardDetails.cmdPIN.Enabled = True
      If recvCardPendingDetail.requestStatus = "3" Or _
         recvCardPendingDetail.requestStatus = "4" Then
         frmCardDetails.cmdCard.Enabled = True
      End If
      frmCardDetails.cmdCreate.Enabled = True
      Exit Sub
   End If
   frmCardDetails.MousePointer = vbDefault
   frmCardDetails.cmdPIN.Enabled = True
   If recvCardPendingDetail.requestStatus = "3" Or _
      recvCardPendingDetail.requestStatus = "4" Then
      frmCardDetails.cmdCard.Enabled = True
   End If
   frmCardDetails.cmdCreate.Enabled = True
   
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ENGLISH Then
         MsgBox recvCustomerMsg.eRemarks
      Else
         MsgBox recvCustomerMsg.aRemarks
      End If
   End If
   
   Unload Me
End Sub

Private Sub cmdPinApplnPrint_Click()
    Dim i As Integer
    Dim applnFile As String
    Dim applnLang As Integer
    Dim strmsglen As String
    Dim tmpStr As String
    Dim cityName As String
    Dim tCode As String
    Dim response
    Dim fso As FileSystemObject
    Dim page As Integer
    Dim lines As Integer
    Dim textStream As Object
    Dim fsys As Object
    Dim langChar As String
    Dim idNumber As String
    Dim tmpStr1 As String, tmpStr2 As String, tmpStr3 As String, tmpStr4 As String
    Dim tmpStr5 As String, tmpStr6 As String, tmpStr7 As String, tmpStr8 As String
    Dim tmpStr9 As String, tmpStr10 As String
    
    Set fsys = CreateObject("scripting.filesystemobject")

    Set fso = CreateObject("Scripting.FileSystemObject")
    If recvCardSearchMsg.customerLang = "0" Then
       applnLang = 0 ' Arabic
    Else
       applnLang = 1 ' for english
    End If
    
    If applnLang = 0 Then
       langChar = Chr$(254) ' for arabic
       Printer.RightToLeft = True ' for arabic
    Else
       langChar = Chr$(253) ' for english
       Printer.RightToLeft = False ' for english
    End If
           
    Printer.Orientation = vbPRORPortrait
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 10
    Printer.CurrentX = 0
    Printer.CurrentY = 0
    
    'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
    Printer.PaintPicture frmLogin.anbLogo1, 50, 200
    For i = 1 To 6
        Printer.Print
    Next
    lines = 4
    page = 1
    Printer.FontBold = True
    Printer.FontSize = 20
    Printer.Print Space(5) & appAtmPinTerms(applnLang) & langChar
    Printer.FontBold = False
    Printer.FontSize = 10
    Printer.Print Space(60) & appPage(applnLang) & ":" & Space(3) & ":" & page
    Printer.Print
    Printer.Print
    Printer.Print appDate(applnLang) & langChar & ":" & Space(5) & Format(Date$, "dd/mm/yyyy") & langChar
    tCode = gBranchCode
    Set rs = db.OpenRecordset("select * from branchinfo where branchcode='" & tCode & "'")
    If rs.recordCount > 0 Then
       If applnLang = ENGLISH Then
          tmpStr = rs("branchcode") & " - " & rs("englishname")
       Else
          tmpStr = rs("branchcode") & " - " & rs("arabicname")
       End If
       tCode = rs("citycode")
      Set rs = db.OpenRecordset("select arabicname, englishname from cityinfo " & _
                  " where citycode = '" & tCode & "'")
                        
      If rs.recordCount > 0 Then
         If applnLang = ARABIC Then
            cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         Else
            cityName = IIf(rs(1) = "" Or IsNull(rs(1)) = True, "   ", rs(1))
         End If
      Else
         cityName = Space(20)
      End If
    Else
       tmpStr = tCode & "-" & appUnknown(applnLang)
       cityName = Space(20)
    End If
    Printer.Print appBranch(applnLang) & langChar & ":" & Space(5) & tmpStr & langChar
    lines = lines + 1
    Printer.Print
    
    If cbsCardCreationAction = True Then
       recvCardSearchMsg.eShortName = recvCardPendingDetail.custName
       recvCardSearchMsg.aShortName = recvCardPendingDetail.custName
    End If

    If applnLang = ENGLISH Then
       If Len(RTrim(recvCardSearchMsg.eShortName)) = 0 Then
          tmpStr = recvCardSearchMsg.aShortName
       Else
          tmpStr = recvCardSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvCardSearchMsg.aShortName)) = 0 Then
          tmpStr = recvCardSearchMsg.eShortName
       Else
          tmpStr = recvCardSearchMsg.aShortName
       End If
    End If
    Printer.Print appAccHoldersName(applnLang) & Space(10) & tmpStr & langChar
    Printer.Print
    Printer.Print
     
   Printer.Print
   Printer.FontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\pinTerms_eng.txt"
   Else
      tmpStr10 = App.Path & "\pinTerms_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
          lines = lines + 1
          If lines > 70 Then
             Printer.Print Space(40) & appContd(applnLang) & langChar
             Printer.NewPage
             page = page + 1
             'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
             Printer.PaintPicture frmLogin.anbLogo1, 50, 200
             For i = 1 To 6
                 'Printer.Print vbCrLf
                 Printer.Print
             Next
             lines = 4
             'Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
             'lines = lines + 1
          End If
      Wend
      textStream.Close
   End If
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print Space(10) & appAcctNo(applnLang) & Space(5) & langChar & txtCurrency & Mid$(cmbLedger, 1, 2) & txtCustomerNo & txtSubAcc
   Printer.Print
   Printer.Print Space(10) & appAtmNo(applnLang) & Space(4) & langChar & txtFullCardNo
   
   Printer.Print
   Printer.Print
   Printer.Print appSignature(applnLang) & langChar
   Printer.Print
   Printer.Print
   Printer.Print appTelNo(applnLang) & ":" & langChar
   Printer.Print
   Printer.Print
   Printer.Print appIdNumber(applnLang) & Space(4) & ":" & recvCardSearchMsg.idNo & langChar
   Printer.Print
   Printer.Print
   Printer.Print appDatePlaceOfIssue(applnLang) & ":" & Format(Date, "dd/mm/yyyy") & langChar & Space(5) & cityName & langChar
   Printer.Print
   Printer.Print
   ' commented by rajesh as it is reported by Tanenah as repeative - 23/04/2007
'   Printer.Print appCustServiceSupervisor(applnLang) & ":" & langChar
   Printer.Print
   Printer.Print
   'Added by Rajesh on 8th April 2007 as per mail from Tanenah on 24 Mar 2007 to
   'include customer signature verification information on all application forms
   Printer.Print
   Printer.Print
   Printer.FontBold = True
   Printer.Print Space(25) & appCustSignVerif(applnLang) & langChar & Space(24)
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.FontBold = False
   Printer.Print appCustSrvRepNameSign(applnLang) & langChar & Space(16) & appCustSrvSuprNameSign(applnLang) & langChar
   '
   Printer.EndDoc
   On Error GoTo 0
   Exit Sub

err_handler:

If Err.Number = 53 Or Err.Number = 76 Then
   If UserLang = ARABIC Then
      tmpStr = tmpStr10 & "„·› «·≈ﬁ—«—/«·‘—Êÿ Ê«·√Õﬂ«„ €Ì— „ÊÃÊœ ; «·≈ﬁ—«—/«·‘—Êÿ Ê«·√Õﬂ«„ ·‰  ÿ»⁄.."
   Else
      tmpStr = "Declaration/Terms&conditions  file (" & tmpStr10 & ") does not exist ; Declaration/Terms&conditions will not be printed.."
   End If
   MsgBox tmpStr
   tCode = "1"
   Resume Next
Else
   Resume Next
End If
   

End Sub

Private Sub cmdReject_Click()
   cmdApprove.Enabled = False
   cmdReject.Enabled = False
   frmCardRejection.Show 1
End Sub

Private Sub cmdRestrict_Click()
    Dim tUserid As String
    Dim tCardNo As String
    Dim reqType As String
    Dim strmsglen As String
    
    tCardNo = Format(txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    If recvCardPendingDetail.cardStatus = "4" Then
       LogData "Msg sent for removing restriction for the card No : " & txtCardNo
       reqType = "U"
    Else
       LogData "Msg sent for restriction for the card No : " & txtCardNo
       reqType = "R"
    End If
    
    SendMsg = "000268" & "62" & gBranchCode & tUserid & tCardNo & reqType
     
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardDetails.MousePointer = vbHourglass
    frmCardDetails.cmdActivate.Enabled = False
          
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardDetails.MousePointer = vbDefault
       frmCardDetails.cmdActivate.Enabled = True
       Exit Sub
    End If
     
    frmCardDetails.MousePointer = vbDefault
    frmCardDetails.cmdActivate.Enabled = True
     
    If recvCustomerMsg.status = "000" Then
       MsgBox errSuccessful(UserLang)
    Else
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
    End If
    Unload Me
End Sub

Private Sub cmdSupervisorComments_Click()
   MsgBox RTrim(recvCardPendingDetail.supervisorComments)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim mQry As String, tCode As String
   Dim defaultMemoIndex As Integer
   
   If UserLang = ARABIC Then
      ChangePositions frmCardDetails, 11800
      frmCardDetails.RightToLeft = True
      frmCardDetails.Hide
      frmCardDetails.txtCustomerName.Alignment = 1
   End If
   
   txtCardNo = Space(19)
   
   frmCardDetails.Caption = frmCardDetailsCaption(0, UserLang)
   frmCardDetails.lblCardNo.Caption = frmCardDetailsCaption(1, UserLang)
   frmCardDetails.lblBranchCode.Caption = frmCardDetailsCaption(45, UserLang)
   frmCardDetails.lblCustomerNo.Caption = frmCardDetailsCaption(2, UserLang)
   frmCardDetails.lblCustomerName.Caption = frmCardDetailsCaption(3, UserLang)
   frmCardDetails.lblPrimaryOrSupp.Caption = frmCardDetailsCaption(4, UserLang)
   frmCardDetails.optPrimary.Caption = frmCardDetailsCaption(5, UserLang)
   frmCardDetails.optSupp.Caption = frmCardDetailsCaption(6, UserLang)
   frmCardDetails.lblCardType.Caption = frmCardDetailsCaption(7, UserLang)
   frmCardDetails.optElectron.Caption = frmCardDetailsCaption(8, UserLang)
   frmCardDetails.optElectronIntl.Caption = frmCardDetailsCaption(9, UserLang)
   frmCardDetails.optIntlChip.Caption = frmCardDetailsCaption(10, UserLang)
   frmCardDetails.optLocalChip.Caption = frmCardDetailsCaption(56, UserLang)
   frmCardDetails.optAdmin.Caption = frmCardDetailsCaption(11, UserLang)
   frmCardDetails.lblNameOnCard.Caption = frmCardDetailsCaption(12, UserLang)
   frmCardDetails.lblLangPref.Caption = frmCardDetailsCaption(13, UserLang)
   frmCardDetails.optArabic.Caption = frmCardDetailsCaption(14, UserLang)
   frmCardDetails.optEnglish.Caption = frmCardDetailsCaption(15, UserLang)
   frmCardDetails.optEngArabic.Caption = frmCardDetailsCaption(16, UserLang)
   frmCardDetails.lblDeliveryLocation.Caption = frmCardDetailsCaption(17, UserLang)
   frmCardDetails.optBranch.Caption = frmCardDetailsCaption(18, UserLang)
   frmCardDetails.optReqBranch.Caption = frmCardDetailsCaption(40, UserLang)
   frmCardDetails.optPoBox.Caption = frmCardDetailsCaption(19, UserLang)
   frmCardDetails.lblDeliveryAddress1.Caption = frmCardDetailsCaption(20, UserLang)
   frmCardDetails.lblDeliveryAddress2.Caption = frmCardDetailsCaption(21, UserLang)
   frmCardDetails.lblDeliveryPOBox.Caption = frmCardDetailsCaption(22, UserLang)
   frmCardDetails.lblDeliveryCity.Caption = frmCardDetailsCaption(23, UserLang)
   frmCardDetails.lblDeliveryZipCode.Caption = frmCardDetailsCaption(24, UserLang)
   frmCardDetails.lblCardGenerationStatus.Caption = frmCardDetailsCaption(25, UserLang)
   frmCardDetails.lblPinGenerationStatus.Caption = frmCardDetailsCaption(26, UserLang)
   frmCardDetails.lblCardStatus.Caption = frmCardDetailsCaption(27, UserLang)
   frmCardDetails.lblCardIssueDate.Caption = frmCardDetailsCaption(28, UserLang)
   frmCardDetails.lblCardExpiryDate.Caption = frmCardDetailsCaption(29, UserLang)
   frmCardDetails.cmdActivate.Caption = frmCardDetailsCaption(30, UserLang)
   frmCardDetails.cmdRestrict.Caption = frmCardDetailsCaption(46, UserLang)
   frmCardDetails.cmdForceCard.Caption = frmCardDetailsCaption(32, UserLang)
   frmCardDetails.cmdForcePIN.Caption = frmCardDetailsCaption(33, UserLang)
   frmCardDetails.cmdSupervisorComments.Caption = frmCardDetailsCaption(34, UserLang)
   frmCardDetails.cmdCreate.Caption = frmCardDetailsCaption(35, UserLang)
   frmCardDetails.cmdApprove.Caption = frmCardDetailsCaption(36, UserLang)
   frmCardDetails.cmdReject.Caption = frmCardDetailsCaption(37, UserLang)
   frmCardDetails.cmdCancel.Caption = frmCardDetailsCaption(38, UserLang)
   frmCardDetails.cmdHistory.Caption = frmCardDetailsCaption(39, UserLang)
   frmCardDetails.cmdAddresschange.Caption = frmCardDetailsCaption(44, UserLang)
   cmdCard.Caption = frmCardGridCaption(15, UserLang)
   cmdPIN.Caption = frmCardGridCaption(17, UserLang)
   lblAcctNo.Caption = frmCardDetailsCaption(41, UserLang)
   frmCardDetails.lblCustType.Caption = frmCardDetailsCaption(48, UserLang)
   frmCardDetails.optVip.Caption = frmCardDetailsCaption(49, UserLang)
   frmCardDetails.optCPS.Caption = frmCardDetailsCaption(50, UserLang)
   frmCardDetails.optPension.Caption = frmCardDetailsCaption(51, UserLang)
   frmCardDetails.optPackage.Caption = frmCardDetailsCaption(52, UserLang)
   frmCardDetails.lblNewOrRepl.Caption = frmCardDetailsCaption(53, UserLang)
   frmCardDetails.optNew.Caption = frmCardDetailsCaption(54, UserLang)
   frmCardDetails.optReplacement.Caption = frmCardDetailsCaption(55, UserLang)
   frmCardDetails.cmdCardApplnPrint.Caption = frmCardDetailsCaption(57, UserLang)
   frmCardDetails.cmdPinApplnPrint.Caption = frmCardDetailsCaption(58, UserLang)
   
   frmCardDetails.optGPS.Caption = gpsCardDeliveryAddressCaption(0, UserLang)
   frmCardDetails.lblGPSAddress1.Caption = gpsCardDeliveryAddressCaption(1, UserLang)
   frmCardDetails.lblGPSUnit.Caption = gpsCardDeliveryAddressCaption(2, UserLang)
      
   poBoxEnableControls
   
   defaultMemoIndex = 0
   Set rs = db.OpenRecordset("select * from cbsledgerinfo where atmCardToBeIssued = '1'")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbLedger.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbLedger.AddItem rs("ledgercode") & "-" & rs("arabicname")
         Else
            cmbLedger.AddItem rs("ledgercode") & "-" & rs("englishname")
         End If
         If Mid$(rs("ledgercode"), 1, 2) = "08" Then
            defaultMemoIndex = cmbLedger.ListCount - 1
         End If
         rs.MoveNext
      Loop
      cmbLedger.ListIndex = defaultMemoIndex
   End If
   
   mQry = "select * from cityinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbDeliveryCity.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbDeliveryCity.AddItem rs("englishname")
           Else
              cmbDeliveryCity.AddItem rs("englishname")
           End If
           rs.MoveNext
        Loop
    End If
'    cmbDeliveryCity.Text = "RIYADH"

    If smartCardEnabled = True Then
       optIntlChip.Enabled = True
    Else
       optIntlChip.Enabled = False
    End If
    
    lblHistory.Visible = False
    If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
       cmdCreate.Enabled = True
       cmdActivate.Enabled = True
       cmdForceCard.Enabled = True
       cmdForcePIN.Enabled = True
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdRestrict.Enabled = True
       If smartCardEnabled = True Then
          optIntlChip.Enabled = True
       Else
          optIntlChip.Enabled = False
       End If
       If cbsCardCreationAction = True Then
          'framePrimaryOrSupp.Enabled = False
          frameCardType.Enabled = False
       End If
       'If recvLoginMsg.enableLocalChipCard = "1" Then
       If localChipCardEnable = True Then
          optLocalChip.Enabled = True
       Else
          optLocalChip.Enabled = False
       End If
    ElseIf InStr(recvLoginMsg.authorityLevel, "~42") > 0 Then
       cmdCreate.Enabled = False
       cmdActivate.Enabled = False
       cmdForceCard.Enabled = False
       cmdForcePIN.Enabled = False
       cmdRestrict.Enabled = False
       cmdApprove.Enabled = True
       cmdReject.Enabled = True
    Else
       cmdCreate.Enabled = False
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdActivate.Enabled = False
       cmdRestrict.Enabled = False
       cmdForceCard.Enabled = False
       cmdForcePIN.Enabled = False
    End If
    
    tCode = recvCardSearchMsg.custBranchCode
    Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
                " where branchcode = '" & tCode & "'")
   
    If rs.recordCount > 0 Then
       txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       txtDeliveryAddr2 = "(*)" & "   " & "   " & _
                           "BR.CODE:" & Right$(tCode, 3)
       txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "   ", rs(2))
       txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "   ", rs(3))
                
       tCode = rs(1)
       Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                   " where citycode = '" & tCode & "'")
                        
       If rs.recordCount > 0 Then
          cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          cmbDeliveryCity.text = " "
       End If
   End If
   
   If cardSearchAction Or cardSupervisorAction Then
      FrameCardDetails.Enabled = False
      cmdActivate.Enabled = False
      cmdForceCard.Enabled = False
      cmdRestrict.Enabled = False
      cmdForcePIN.Enabled = False
      cmdCreate.Enabled = False
      If cardSearchAction Then
         cmdApprove.Enabled = False
         cmdReject.Enabled = False
      Else
         cmdApprove.Enabled = True
         cmdReject.Enabled = True
      End If
   ElseIf cardUpdateAction Then
      FrameCardDetails.Enabled = False
      If recvCardPendingDetail.cardStatus = "0" Then
         cmdActivate.Enabled = False
      End If
      If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4" Then
         cmdForcePIN.Enabled = True
         cmdForceCard.Enabled = True
         cmdAddresschange.Enabled = True
         cmdCardApplnPrint.Enabled = True 'Enabled by Mohit on 02-12-2006 as per Arul
         cmdPinApplnPrint.Enabled = True  'Enabled by Mohit on 02-12-2006 as per Arul
'         cmdCardApplnPrint.Enabled = False
'         cmdPinApplnPrint.Enabled = False
      Else
         cmdForcePIN.Enabled = False
         cmdForceCard.Enabled = False
         cmdAddresschange.Enabled = False
         cmdCardApplnPrint.Enabled = False
         cmdPinApplnPrint.Enabled = False
      End If
      cmdCreate.Enabled = False
      If (gBranchCode = recvCardSearchMsg.custBranchCode) Then
         cmdPIN.Enabled = True
      Else
         cmdPIN.Enabled = False
      End If
      If gBranchCode = recvCardPendingDetail.deliveryBranchCode Then
         cmdCard.Enabled = True
      Else
         cmdCard.Enabled = False
      End If
      If InStr(recvLoginMsg.authorityLevel, "~45") > 0 Then
         cmdForceCard.Enabled = False
         cmdForcePIN.Enabled = False
         cmdCard.Enabled = False
         cmdPIN.Enabled = False
         cmdAddresschange.Enabled = False
         If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4" Then
            cmdActivate.Enabled = True
         Else
            cmdActivate.Enabled = False
         End If
      End If
      If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
         If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4" Then
            cmdForcePIN.Enabled = True
            cmdForceCard.Enabled = True
            cmdAddresschange.Enabled = True
         End If
''Commented and changed by Mohit on 27-Dec-2006, as requested by Anwar Alfaraj & Mohd. Tenena on 26-Dec-2006
''         If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4" Or _
''            recvCardPendingDetail.cardStatus = "5" Or _
''            recvCardPendingDetail.cardStatus = "2" Or recvCardPendingDetail.cardStatus = "3" Then
         If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4" Or _
            recvCardPendingDetail.cardStatus = "5" Then
            cmdActivate.Enabled = True
         Else
            cmdActivate.Enabled = False
         End If
         
         If recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "5" Or _
            recvCardPendingDetail.cardStatus = "4" Then
            cmdRestrict.Enabled = True
         Else
            cmdRestrict.Enabled = False
         End If
            
'         If (gBranchCode = recvCardSearchMsg.custBranchCode) Then
'            cmdCard.Enabled = True
'            cmdPIN.Enabled = True
'         ElseIf recvCardPendingDetail.deliveryToBranchOrPo = "R" Then
'            cmdCard.Enabled = True
'            cmdPIN.Enabled = True
'         End If
      End If
      If recvCardPendingDetail.cardType = "R" Or recvCardPendingDetail.cardType = "D" Or _
         Mid$(recvCardPendingDetail.cardNo, 1, 6) = "588848" Then
         cmdForceCard.Enabled = False
      End If
      If recvCardPendingDetail.requestStatus = "3" Then
         cmdCard.Caption = frmCardGridCaption(15, UserLang) ' "Card Received by Branch"
         cmdCard.tag = "4"
      ElseIf recvCardPendingDetail.requestStatus = "4" Then
         cmdCard.Caption = frmCardGridCaption(16, UserLang)   '"Card Issued to customer"
         cmdCard.tag = "5"
      Else
         cmdCard.Caption = frmCardGridCaption(15, UserLang)
         cmdCard.Enabled = False
      End If
      If recvCardPendingDetail.pinRequestStatus = "3" Then
         cmdPIN.Caption = frmCardGridCaption(17, UserLang)    '"Pin Received by Branch"
         cmdPIN.tag = "4"
      ElseIf recvCardPendingDetail.pinRequestStatus = "4" Then
         cmdPIN.Caption = frmCardGridCaption(18, UserLang)  '"Pin Issued to customer"
         cmdPIN.tag = "5"
      Else
         cmdPIN.Caption = frmCardGridCaption(17, UserLang)
         cmdPIN.Enabled = False
      End If
      
'      If recvCardPendingDetail.requestStatus = "5" And _
         recvCardPendingDetail.pinRequestStatus = "5" And _
         recvCardPendingDetail.cardStatus = "1" And _
         InStr(recvLoginMsg.AuthorityLevel, "45") = 0 Then
      If (recvCardPendingDetail.cardStatus = "1" Or recvCardPendingDetail.cardStatus = "4") _
         And InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
         cmdAddresschange.Enabled = True
         FrameCardDetails.Enabled = True
         frameLang.Enabled = False
         frameCardType.Enabled = False
         framePrimaryOrSupp.Enabled = False
         txtNameOnCard.Enabled = False
         txtSubAcc.Enabled = False
         cmbLedger.Enabled = False
      Else
         cmdAddresschange.Enabled = False
         FrameCardDetails.Enabled = False
      End If
   ElseIf cardTellerAction Or cbsCardCreationAction Then
      If recvCardPendingDetail.newOrUpdate = "N" Then
         FrameCardDetails.Enabled = True
      Else
         FrameCardDetails.Enabled = False
      End If
      cmdActivate.Enabled = False
      cmdForceCard.Enabled = False
      cmdForcePIN.Enabled = False
      cmdRestrict.Enabled = False
      cmdCreate.Enabled = True
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      If recvCardPendingDetail.cardType = "C" Then
         cmbLedger.Enabled = False
         txtNameOnCard.Enabled = False
         txtSubAcc.Enabled = False
         optSupp.Enabled = False
         frameCardType.Enabled = False
      End If
   ElseIf cardHistoryAction Then
      FrameCardDetails.Enabled = False
      cmdActivate.Enabled = False
      cmdForceCard.Enabled = False
      cmdForcePIN.Enabled = False
      cmdRestrict.Enabled = False
      cmdCreate.Enabled = False
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
      lblHistory.Visible = True
      lblHistory.Refresh
   Else ' New Card Creation
      FrameCardDetails.Enabled = True
      cmdCreate.Enabled = True
      'cmdCardApplnPrint.Enabled = True 'Comment by Mohit on 02-12-2006 as it has to remain disabled
                                        'because once new card is generated than only it can be enabled. Arul requested
      'cmdCardApplnPrint.Enabled = False
      cmdPinApplnPrint.Enabled = False
      cmdRestrict.Enabled = False
      lblHistory.Visible = False
   End If
   
   If cardTellerAction Or cardSupervisorAction Then
      cmdSupervisorComments.Enabled = True
   Else
      cmdSupervisorComments.Enabled = False
   End If
   
End Sub

Public Sub forceCardGenerate(cardOrPin As String, pinNo As String)
    Dim strmsglen As String
    Dim tCardNo As String, tDateTime As String, tUserid As String
    Dim opt As String, cardType As String
    Dim response
    
    
    If cardOrPin = "C" Then  ' Force card
       If smartCardEnabled = True Then
           If frmCardDetails.optElectronIntl = True Then
              response = MsgBox(errWannaChipCard(UserLang), vbYesNo, errWannaChipCard(UserLang))
              If response = vbYes Then
                 cardType = "S"
              Else
                 cardType = "I"
              End If
           Else
              cardType = "S"
           End If
       Else
          cardType = "I"
       End If
    Else
       cardType = " "
    End If
            
    tCardNo = Format(txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
    'tDateTime = CStr(Year(Date)) & Format(CStr(Month(Date)), "00") & Format(CStr(Day(Date)), "00") & _
                   Format(CStr(Hour(Time)), "00") & Format(CStr(Minute(Time)), "00") & Format(CStr(Second(Time)), "00")
    tDateTime = Space(14)
                   
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    If cardOrPin = "C" Then
       LogData "Force card selected for the card # " & txtCardNo
    Else
       LogData "Force pin option selected for the card # " & txtCardNo
    End If
    SendMsg = "000268" & "29" & gBranchCode & tUserid & tDateTime & tCardNo & cardOrPin & pinNo & cardType & recvCardPendingDetail.sequenceNo & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardDetails.MousePointer = vbHourglass
    frmCardDetails.cmdForceCard.Enabled = False
    frmCardDetails.cmdForcePIN.Enabled = False
   
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardDetails.MousePointer = vbDefault
       frmCardDetails.cmdForceCard.Enabled = True
       frmCardDetails.cmdForcePIN.Enabled = True
       Exit Sub
    End If
    
    frmCardDetails.MousePointer = vbDefault
    frmCardDetails.cmdForceCard.Enabled = True
    frmCardDetails.cmdForcePIN.Enabled = True
    If recvCardMsg.status = "000" Then
       MsgBox errSuccessful(UserLang)
       tDateTime = recvCardMsg.dateTime
    Else
       If UserLang = ARABIC Then
          MsgBox recvCardMsg.aRemarks
       Else
          MsgBox recvCardMsg.eRemarks
       End If
       Unload Me
       Exit Sub
    End If
        
    If cardOrPin = "P" Then
       If pinSelectAtBranch = True Then
          atmPin = Space(4)
          frmAcceptPin.tag = "F" ' Force pin
          If frmCardDetails.optPrimary = True Then
             frmAcceptPin.txtCardType = "Primary"
          Else
             frmAcceptPin.txtCardType = "Supplementary"
          End If
          frmAcceptPin.txtNameOnTheCard = frmCardDetails.txtNameOnCard
          frmAcceptPin.Show vbModal
       Else
          Unload Me
       End If
    Else
       If cardProductionAtBranch = True Then
           atmPin = "CARD"
           If frmCardDetails.optPrimary = True Then
              opt = "P"
           Else
              opt = "S"
           End If
           SendMsg = "000000" & "60" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tDateTime & opt & atmPin
           strmsglen = Format(Len(SendMsg), "000000")
           Mid$(SendMsg, 1, 6) = strmsglen
           DataReceivedFlag = False
                   
           ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
        
           If ReturnStatus = LocalCommsError Then
              LoadError = True
              Unload Me
              Exit Sub
           End If
         
           If recvCustomerMsg.status <> "000" Then
              If UserLang = ARABIC Then
                 MsgBox recvCustomerMsg.aRemarks
              Else
                 MsgBox recvCustomerMsg.eRemarks
              End If
              Unload Me
              Exit Sub
           End If
           Unload Me
       Else
          Unload Me
       End If
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameCardDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameDeliveryLocations_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optBranch_Click()
   Dim tCode As String
   
   poBoxEnableControls
   
   txtDeliveryAddr1.Enabled = False
   txtDeliveryPOBox.Enabled = False
   cmbDeliveryCity.Enabled = False
   txtDeliveryZipcode.Enabled = False
   
   tCode = recvCardSearchMsg.custBranchCode
   Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
                " where branchcode = '" & tCode & "'")
   
   If rs.recordCount > 0 Then
      txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
      txtDeliveryAddr2 = "(*)" & "   " & "   " & _
                         "BR.CODE:" & Right$(tCode, 3)
      txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "   ", rs(2))
      txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "   ", rs(3))
          
      tCode = rs(1)
      Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                  " where citycode = '" & tCode & "'")
                        
      If rs.recordCount > 0 Then
         cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
      Else
         cmbDeliveryCity.text = " "
      End If
  End If
End Sub

Private Sub optElectron_Click()
    cmbLedger.ListIndex = 0
    cmbLedger.Enabled = True
    txtSubAcc.Enabled = True
    optSupp.Enabled = True
    txtNameOnCard.Enabled = True
    txtNameOnCard = ""
End Sub

Private Sub optElectronIntl_Click()
    cmbLedger.ListIndex = 0
    cmbLedger.Enabled = True
    txtSubAcc.Enabled = True
    optSupp.Enabled = True
    txtNameOnCard.Enabled = True
    txtNameOnCard = ""
End Sub

Private Sub optGPS_Click()
   GPSEnableControls
   txtGPSNo.Enabled = True
   txtGPSStreetName.Enabled = True
   cmbDeliveryCity.Enabled = True
   txtGPSUnit.Enabled = True
   txtGPSZipCode.Enabled = True
   txtGPSAdditionalNo.Enabled = True
    
   If recvCardSearchMsg.addressType = "1" Then ' GPS address is selected as customer address
      txtGPSNo = Mid$(recvCardSearchMsg.address1, 1, 5)
      txtGPSStreetName = Mid$(recvCardSearchMsg.address1, 7)
      txtGPSUnit = RTrim(recvCardSearchMsg.poBox)
      txtGPSZipCode = Mid$(recvCardSearchMsg.zipCode, 1, 5)
      txtGPSAdditionalNo = Mid$(recvCardSearchMsg.zipCode, 7)
   Else
      txtGPSNo = ""
      txtGPSStreetName = ""
      txtGPSUnit = ""
      txtGPSZipCode = ""
      txtGPSAdditionalNo = ""
   End If
   cmbDeliveryCity = RTrim(recvCardSearchMsg.cityName)
      
   txtDeliveryAddr2 = "( )" & "   " & "   " & _
                         "BR.CODE:" & Right$(recvCardSearchMsg.custBranchCode, 3)
End Sub

Private Sub optIntlChip_Click()
    cmbLedger.ListIndex = 0
    cmbLedger.Enabled = True
    txtSubAcc.Enabled = True
    optSupp.Enabled = True
    txtNameOnCard.Enabled = True
    txtNameOnCard = ""
End Sub

Private Sub optLocalChip_Click()
    cmbLedger.ListIndex = 0
    cmbLedger.Enabled = True
    txtSubAcc.Enabled = True
    optSupp.Enabled = True
    txtNameOnCard.Enabled = True
    txtNameOnCard = ""
End Sub

Private Sub optPayroll_Click()
    Dim tCode As String
    Dim mQry As String
    Dim tmpStr As String
    
    If cardSearchAction = False And cardTellerAction = False And _
       cardUpdateAction = False And cardSupervisorAction = False And _
       cardHistoryAction = False Then
        
       If Len(Trim(ratibiIdNo)) = 0 Then
          MsgBox errRatibiCardNotSelected(UserLang)
          optElectronIntl.Value = True
          Exit Sub
       End If
       
       tCode = Mid$(ratibiAccNo, 3, 2)
       mQry = "select arabicname, englishname from bmLedgerInfo " & _
              "where ledgerCode = '" & tCode & "'"
       Set rs = db.OpenRecordset(mQry)
       If rs.recordCount > 0 Then
          If UserLang = ARABIC Then
             tmpStr = tCode & " - " & rs(0)
          Else
             tmpStr = tCode & " - " & rs(1)
          End If
       Else
          tmpStr = tCode & "-Not defined in local   "
       End If
       cmbLedger = tmpStr
       cmbLedger.Enabled = False
       txtNameOnCard.Enabled = False
       txtSubAcc.Enabled = False
       optSupp.Enabled = False
       txtCustomerNo = Mid$(ratibiAccNo, 5, 8)
       txtSubAcc = Mid$(ratibiAccNo, 13, 4)
       txtNameOnCard = ratibiCardName
    End If
    
End Sub

Private Sub optPoBox_Click()
   poBoxEnableControls
   txtDeliveryAddr1.Enabled = True
   txtDeliveryPOBox.Enabled = True
   cmbDeliveryCity.Enabled = True
   txtDeliveryZipcode.Enabled = True
   If recvCardSearchMsg.addressType <> "1" Then ' Not a GPS address
      txtDeliveryAddr1 = RTrim(recvCardSearchMsg.address1)
      txtDeliveryPOBox = RTrim(recvCardSearchMsg.poBox)
      txtDeliveryZipcode = RTrim(recvCardSearchMsg.zipCode)
   Else
      txtDeliveryAddr1 = ""
      txtDeliveryPOBox = ""
      txtDeliveryZipcode = ""
   End If
   cmbDeliveryCity = RTrim(recvCardSearchMsg.cityName)
      
   txtDeliveryAddr2 = "( )" & "   " & "   " & _
                         "BR.CODE:" & Right$(recvCardSearchMsg.custBranchCode, 3)
End Sub

Private Sub optPrimary_Click()
   If Not cardTellerAction Then
      If Len(RTrim(recvCardSearchMsg.eShortName)) <> 0 Then
         If arabicCharFound(recvCardSearchMsg.eShortName) = False Then
            frmCardDetails.txtNameOnCard = UCase(recvCardSearchMsg.eShortName)
         End If
      End If
   End If
End Sub

Private Sub optReqBranch_Click()

  Dim tCode As String
  poBoxEnableControls
  txtDeliveryAddr1.Enabled = False
  txtDeliveryPOBox.Enabled = False
  cmbDeliveryCity.Enabled = False
  txtDeliveryZipcode.Enabled = False

 tCode = gBranchCode
 Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
             " where branchcode = '" & tCode & "'")
  
 If rs.recordCount > 0 Then
    txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
    txtDeliveryAddr2 = "(*)" & "   " & "   " & _
                       "BR.CODE:" & Right$(tCode, 3)
    txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "   ", rs(2))
    txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "   ", rs(3))
               
    tCode = rs(1)
    Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                " where citycode = '" & tCode & "'")
                        
    If rs.recordCount > 0 Then
       cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
    Else
       cmbDeliveryCity.text = " "
    End If
 End If

End Sub

Private Sub optSupp_Click()
   If Not cardTellerAction And Not cbsCardCreationAction Then
      txtNameOnCard = ""
   End If
End Sub

Private Sub txtDeliveryAddr1_KeyPress(KeyAscii As Integer)
'  If KeyAscii > 128 Then
'     KeyAscii = 0
'     MsgBox (errNoArabicCharacters(UserLang))
'     Exit Sub
'  End If
End Sub

Private Sub txtDeliveryAddr1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtDeliveryAddr2_KeyPress(KeyAscii As Integer)
'  If KeyAscii > 128 Then
'     KeyAscii = 0
'     MsgBox (errNoArabicCharacters(UserLang))
'     Exit Sub
'  End If
End Sub

Private Sub txtDeliveryAddr2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtDeliveryPOBox_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtDeliveryZipcode_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtGPSAdditionalNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtGPSNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtGPSUnit_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtGPSZipCode_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtNameOnCard_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
      KeyAscii = 0
      MsgBox (errNoArabicCharacters(UserLang))
      Exit Sub
   End If
End Sub

Private Sub txtNameOnCard_LostFocus()
   If Len(RTrim(txtNameOnCard)) > 0 Then
      txtNameOnCard = UCase(txtNameOnCard)
   End If
End Sub

Public Sub parseCardHistoryDetails()
    Dim i As Integer, pos As Integer
    
    recvCardHistory.status = Mid$(RecvStr, 1, 3)
    recvCardHistory.service = Mid$(RecvStr, 4, 2)
    recvCardHistory.aRemarks = Mid$(RecvStr, 6, 50)
    recvCardHistory.eRemarks = Mid$(RecvStr, 56, 50)
    recvCardHistory.noOfRecs = Mid$(RecvStr, 106, 2)
    recvCardHistory.filler = Mid$(RecvStr, 108, 10)
    pos = 118
    For i = 1 To Val(recvCardHistory.noOfRecs)
        recvCardHistory.details(i).requestType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvCardHistory.details(i).requestUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).requestDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).cardGeneratedDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).cardGeneratedUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).cBranchReceiptDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).cBranchReceiptUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).cCustIssueDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).cCustIssueUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).pinGeneratedDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).pinGeneratedUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).pBranchReceiptDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).pBranchReceiptUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).pCustIssueDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).pCustIssueUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).supervisorId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).lastUpdateDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).processDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).rejectedUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardHistory.details(i).rejectedDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvCardHistory.details(i).rejectedReason = Mid$(RecvStr, pos, 20)
        pos = pos + 20
    Next i
End Sub

Public Sub poBoxEnableControls()
   lblDeliveryAddress1.Visible = True
   lblDeliveryPOBox.Visible = True
   txtDeliveryAddr1.Visible = True
   txtDeliveryPOBox.Visible = True
   txtDeliveryZipcode.Visible = True
   lblDeliveryAddress1.Refresh
   lblDeliveryPOBox.Refresh
   txtDeliveryAddr1.Refresh
   txtDeliveryPOBox.Refresh
   txtDeliveryZipcode.Refresh
   lblGPSAddress1.Visible = False
   lblGPSUnit.Visible = False
   lblGPSAdditionalNo.Visible = False
   txtGPSNo.Visible = False
   txtGPSStreetName.Visible = False
   txtGPSUnit.Visible = False
   txtGPSZipCode.Visible = False
   txtGPSAdditionalNo.Visible = False
End Sub

Public Sub GPSEnableControls()
   lblDeliveryAddress1.Visible = False
   lblDeliveryPOBox.Visible = False
   txtDeliveryAddr1.Visible = False
   txtDeliveryPOBox.Visible = False
   txtDeliveryZipcode.Visible = False
   
   lblGPSAddress1.Visible = True
   lblGPSUnit.Visible = True
   lblGPSAdditionalNo.Visible = True
   txtGPSNo.Visible = True
   txtGPSStreetName.Visible = True
   txtGPSUnit.Visible = True
   txtGPSZipCode.Visible = True
   txtGPSAdditionalNo.Visible = True
   lblGPSAddress1.Refresh
   lblGPSUnit.Refresh
   lblGPSAdditionalNo.Refresh
   txtGPSNo.Refresh
   txtGPSStreetName.Refresh
   txtGPSUnit.Refresh
   txtGPSZipCode.Refresh
   txtGPSAdditionalNo.Refresh
End Sub


