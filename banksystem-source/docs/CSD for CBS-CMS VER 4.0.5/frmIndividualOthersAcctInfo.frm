VERSION 5.00
Begin VB.Form frmIndividualOthersAcctInfo 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account Details-Other Individuals"
   ClientHeight    =   8745
   ClientLeft      =   -60
   ClientTop       =   765
   ClientWidth     =   12060
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8745
   ScaleWidth      =   12060
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdPrintAppln 
      BackColor       =   &H00BFD87E&
      Caption         =   "Print Application"
      Enabled         =   0   'False
      Height          =   420
      Left            =   2850
      MaskColor       =   &H00BFD87E&
      TabIndex        =   101
      ToolTipText     =   "Print application"
      Top             =   6075
      Width           =   1860
   End
   Begin VB.Frame FrameCardDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   2970
      Left            =   120
      TabIndex        =   80
      Top             =   2880
      Width           =   11655
      Begin VB.TextBox txtGPSAdditionalNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8160
         MaxLength       =   4
         TabIndex        =   47
         Tag             =   "11655"
         Top             =   2475
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtGPSNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2160
         MaxLength       =   5
         TabIndex        =   38
         Tag             =   "11655"
         Top             =   2115
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtGPSZipCode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6960
         MaxLength       =   5
         TabIndex        =   45
         Tag             =   "11655"
         Top             =   2475
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtGPSUnit 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2160
         MaxLength       =   5
         TabIndex        =   42
         Tag             =   "11655"
         Top             =   2475
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtGPSStreetName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3240
         MaxLength       =   24
         TabIndex        =   40
         Tag             =   "11655"
         Top             =   2115
         Visible         =   0   'False
         Width           =   3255
      End
      Begin VB.Frame framePrimaryIntlCard 
         BackColor       =   &H00BFD87E&
         Height          =   400
         Left            =   2190
         TabIndex        =   84
         Tag             =   "11655"
         Top             =   645
         Width           =   1575
         Begin VB.OptionButton optPrimaryElectronIntlCardYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   27
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
         Begin VB.OptionButton optPrimaryElectronIntlCardNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   840
            TabIndex        =   28
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame frameSuppIntlCard 
         BackColor       =   &H00BFD87E&
         Height          =   435
         Left            =   2190
         TabIndex        =   83
         Tag             =   "11655"
         Top             =   1050
         Width           =   1575
         Begin VB.OptionButton optSecondaryElectronIntlCardYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   30
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   135
            Width           =   615
         End
         Begin VB.OptionButton optSecondaryElectronIntlCardNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   840
            TabIndex        =   31
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   135
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.TextBox txtDeliveryAddr1 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2160
         MaxLength       =   30
         TabIndex        =   39
         Tag             =   "11655"
         Top             =   2115
         Width           =   3690
      End
      Begin VB.TextBox txtDeliveryPOBox 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2160
         TabIndex        =   43
         Tag             =   "11655"
         Top             =   2475
         Width           =   1455
      End
      Begin VB.ComboBox cmbDeliveryCity 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4305
         TabIndex        =   44
         Tag             =   "11655"
         Text            =   "Riyadh"
         Top             =   2520
         Width           =   1575
      End
      Begin VB.TextBox txtDeliveryZipcode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8070
         TabIndex        =   46
         Tag             =   "11655"
         Top             =   2475
         Width           =   1095
      End
      Begin VB.TextBox txtDeliveryAddr2 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8070
         MaxLength       =   30
         TabIndex        =   41
         Tag             =   "11655"
         Top             =   2115
         Width           =   3495
      End
      Begin VB.Frame Frame10 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   2190
         TabIndex        =   82
         Tag             =   "11655"
         Top             =   1500
         Width           =   5685
         Begin VB.OptionButton optCardDeliveredToGPS 
            BackColor       =   &H00BFD87E&
            Caption         =   "GPS"
            Height          =   255
            Left            =   4680
            TabIndex        =   37
            Tag             =   "5685"
            ToolTipText     =   "Mail"
            Top             =   165
            Width           =   885
         End
         Begin VB.OptionButton optCardDeliveredToReqBranch 
            BackColor       =   &H00BFD87E&
            Caption         =   "Request Branch"
            Height          =   255
            Left            =   1920
            TabIndex        =   35
            Tag             =   "5685"
            ToolTipText     =   "Request Branch"
            Top             =   165
            Width           =   1605
         End
         Begin VB.OptionButton optCardDeliveredToBranch 
            BackColor       =   &H00BFD87E&
            Caption         =   "Customer Branch"
            Height          =   255
            Left            =   120
            TabIndex        =   33
            Tag             =   "5685"
            ToolTipText     =   "Customer Branch"
            Top             =   165
            Value           =   -1  'True
            Width           =   1635
         End
         Begin VB.OptionButton optCardDeliveredToPOBox 
            BackColor       =   &H00BFD87E&
            Caption         =   "Mail"
            Height          =   255
            Left            =   3600
            TabIndex        =   36
            Tag             =   "5685"
            ToolTipText     =   "Mail"
            Top             =   165
            Width           =   885
         End
      End
      Begin VB.TextBox txtSecondaryElectronIntlCardName 
         Height          =   285
         Left            =   5880
         MaxLength       =   26
         TabIndex        =   32
         Tag             =   "11655"
         Top             =   1140
         Width           =   3495
      End
      Begin VB.TextBox txtPrimaryElectronIntlCardName 
         Height          =   285
         Left            =   5880
         MaxLength       =   26
         TabIndex        =   29
         Tag             =   "11655"
         Top             =   780
         Width           =   3495
      End
      Begin VB.Frame frameCardType 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   2190
         TabIndex        =   81
         Tag             =   "11655"
         Top             =   120
         Width           =   2325
         Begin VB.OptionButton optChipCard 
            BackColor       =   &H00BFD87E&
            Caption         =   "E.I.Chip"
            Height          =   255
            Left            =   1200
            TabIndex        =   26
            Tag             =   "2325"
            ToolTipText     =   "Electron Int'l Chip card"
            Top             =   165
            Width           =   1035
         End
         Begin VB.OptionButton optIntlCard 
            BackColor       =   &H00BFD87E&
            Caption         =   "Elec.Int'l"
            Height          =   255
            Left            =   120
            TabIndex        =   25
            Tag             =   "2325"
            ToolTipText     =   "Electron International"
            Top             =   165
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin VB.Label lblGPSZipCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Zip code"
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
         Left            =   6120
         TabIndex        =   100
         Tag             =   "11655"
         Top             =   2475
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Label lblGPSUnit 
         BackColor       =   &H00BFD87E&
         Caption         =   "Unit"
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
         Left            =   0
         TabIndex        =   99
         Tag             =   "11655"
         Top             =   2520
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.Label lblGPSAddress1 
         BackColor       =   &H00BFD87E&
         Caption         =   "GPS #-Street/Area Name"
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
         Left            =   0
         TabIndex        =   98
         Tag             =   "11655"
         Top             =   2115
         Visible         =   0   'False
         Width           =   2535
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
         Left            =   7920
         TabIndex        =   97
         Tag             =   "11655"
         Top             =   2475
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.Label lblPrimaryElectronIntlCard 
         BackColor       =   &H00BFD87E&
         Caption         =   "Primary Int'l card"
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
         Left            =   0
         TabIndex        =   95
         Tag             =   "11655"
         Top             =   795
         Width           =   2175
      End
      Begin VB.Label lblSecondaryElectronIntlCard 
         BackColor       =   &H00BFD87E&
         Caption         =   "Secondary Int'l card"
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
         Left            =   -15
         TabIndex        =   94
         Tag             =   "11655"
         Top             =   1170
         Width           =   2295
      End
      Begin VB.Label lblPrimaryElectronIntlCardName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Name on the card"
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
         Left            =   4230
         TabIndex        =   93
         Tag             =   "11655"
         Top             =   780
         Width           =   1695
      End
      Begin VB.Label lblSecondaryElectronIntlCardName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Name on the card"
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
         Left            =   4230
         TabIndex        =   92
         Tag             =   "11655"
         Top             =   1140
         Width           =   1695
      End
      Begin VB.Label lblDeliveryAddress1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Delivery Address1"
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
         Left            =   0
         TabIndex        =   91
         Tag             =   "11655"
         Top             =   2115
         Width           =   1935
      End
      Begin VB.Label lblDeliveryPOBox 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "PO Box"
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
         Left            =   0
         TabIndex        =   90
         Tag             =   "11655"
         Top             =   2490
         Width           =   645
      End
      Begin VB.Label lblDeliveryCity 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "City"
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
         Left            =   3720
         TabIndex        =   89
         Tag             =   "11655"
         Top             =   2520
         Width           =   570
      End
      Begin VB.Label lblDeliveryZipCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Zip code"
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
         Left            =   6750
         TabIndex        =   88
         Tag             =   "11655"
         Top             =   2475
         Width           =   1335
      End
      Begin VB.Label lblDeliveryAddress2 
         BackColor       =   &H00BFD87E&
         Caption         =   "Address2"
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
         Left            =   6750
         TabIndex        =   87
         Tag             =   "11655"
         Top             =   2115
         Width           =   1455
      End
      Begin VB.Label lblCardDeliveredTo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Card delivered to"
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
         Left            =   0
         TabIndex        =   86
         Tag             =   "11655"
         Top             =   1635
         Width           =   1695
      End
      Begin VB.Label lblCardType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Card Type"
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
         Left            =   0
         TabIndex        =   85
         Tag             =   "11655"
         Top             =   240
         Width           =   1695
      End
   End
   Begin VB.CommandButton cmdCreate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Create"
      Height          =   420
      Left            =   1710
      MaskColor       =   &H00BFD87E&
      TabIndex        =   49
      ToolTipText     =   "Create"
      Top             =   6075
      Width           =   1140
   End
   Begin VB.CommandButton cmdReject 
      BackColor       =   &H00BFD87E&
      Caption         =   "Reject"
      Height          =   420
      Left            =   5955
      MaskColor       =   &H00BFD87E&
      TabIndex        =   51
      ToolTipText     =   "Reject"
      Top             =   6075
      Width           =   1260
   End
   Begin VB.CommandButton cmdDoc 
      Caption         =   "&Documents"
      Height          =   420
      Left            =   8925
      TabIndex        =   53
      ToolTipText     =   "Documents"
      Top             =   6075
      Width           =   1500
   End
   Begin VB.CommandButton cmdApprove 
      BackColor       =   &H00BFD87E&
      Caption         =   "Approve"
      Height          =   420
      Left            =   4710
      MaskColor       =   &H00BFD87E&
      TabIndex        =   50
      ToolTipText     =   "Approve"
      Top             =   6075
      Width           =   1245
   End
   Begin VB.CommandButton cmdPrevPage 
      Caption         =   "&Previous Page"
      Height          =   420
      Left            =   495
      TabIndex        =   48
      ToolTipText     =   "Previous Page"
      Top             =   6075
      Width           =   1215
   End
   Begin VB.CommandButton cmdJointAcc 
      Caption         =   "&Joint Account Details"
      Height          =   420
      Left            =   7215
      TabIndex        =   52
      ToolTipText     =   "Joint Account Details"
      Top             =   6075
      Width           =   1710
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Exit"
      Height          =   420
      Left            =   10425
      TabIndex        =   54
      ToolTipText     =   "Exit"
      Top             =   6075
      Width           =   1140
   End
   Begin VB.Frame frameSingleJoint 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame4"
      Height          =   495
      Left            =   120
      TabIndex        =   75
      Top             =   2280
      Width           =   10830
      Begin VB.Frame frameSignSingleJoint 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   8160
         TabIndex        =   77
         Tag             =   "10830"
         Top             =   15
         Width           =   2295
         Begin VB.OptionButton optSignSingle 
            BackColor       =   &H00BFD87E&
            Caption         =   "Single"
            Height          =   255
            Left            =   120
            TabIndex        =   23
            Tag             =   "2295"
            ToolTipText     =   "Single"
            Top             =   165
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.OptionButton optSignJoint 
            BackColor       =   &H00BFD87E&
            Caption         =   "Joint"
            Height          =   255
            Left            =   1200
            TabIndex        =   24
            Tag             =   "2295"
            ToolTipText     =   "Joint"
            Top             =   165
            Width           =   855
         End
      End
      Begin VB.Frame frameAcSingleJoint 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1470
         TabIndex        =   76
         Tag             =   "10830"
         Top             =   -15
         Width           =   3360
         Begin VB.OptionButton optJoint 
            BackColor       =   &H00BFD87E&
            Caption         =   "Joint"
            Height          =   255
            Left            =   1200
            TabIndex        =   34
            Tag             =   "3360"
            ToolTipText     =   "Joint"
            Top             =   165
            Width           =   780
         End
         Begin VB.OptionButton OptSingle 
            BackColor       =   &H00BFD87E&
            Caption         =   "Single"
            Height          =   255
            Left            =   120
            TabIndex        =   21
            Tag             =   "3360"
            ToolTipText     =   "Single"
            Top             =   165
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.OptionButton optUnidentified 
            BackColor       =   &H00BFD87E&
            Caption         =   "Unidentified"
            Enabled         =   0   'False
            Height          =   255
            Left            =   2040
            TabIndex        =   22
            Tag             =   "3360"
            ToolTipText     =   "Joint"
            Top             =   165
            Width           =   1170
         End
      End
      Begin VB.Label lblNatureOfSign 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Nature of signature"
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
         Left            =   6375
         TabIndex        =   79
         Tag             =   "10830"
         Top             =   195
         Width           =   1650
      End
      Begin VB.Label lblSingleOrJointAcc 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Single/Joint A/c"
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
         Left            =   0
         TabIndex        =   78
         Tag             =   "10830"
         Top             =   165
         Width           =   1410
      End
   End
   Begin VB.Frame frameAccountDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1455
      Left            =   120
      TabIndex        =   1
      Top             =   615
      Width           =   11775
      Begin VB.Frame Frame13 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1200
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   0
         Width           =   1455
         Begin VB.OptionButton optCurrentAcNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   3
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   180
            Width           =   615
         End
         Begin VB.OptionButton optCurrentAcYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   195
            Left            =   120
            TabIndex        =   2
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   195
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbCurrentAcCurrency 
         Height          =   315
         Left            =   3240
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Tag             =   "11775"
         Top             =   120
         Width           =   1455
      End
      Begin VB.ComboBox cmbCurrentAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Tag             =   "11775"
         Top             =   120
         Width           =   975
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   10215
         TabIndex        =   56
         Tag             =   "11775"
         Top             =   0
         Width           =   1455
         Begin VB.OptionButton optCurrentAcCheckBookNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   8
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   150
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optCurrentAcCheckBookYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   7
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   150
            Width           =   615
         End
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1200
         TabIndex        =   55
         Tag             =   "11775"
         Top             =   480
         Width           =   1455
         Begin VB.OptionButton optSavingAcNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   10
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   180
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optSavingAcYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   9
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   180
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbSavingAcCurrency 
         Height          =   315
         Left            =   3240
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Tag             =   "11775"
         Top             =   600
         Width           =   1455
      End
      Begin VB.ComboBox cmbSavingAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Tag             =   "11775"
         Top             =   600
         Width           =   975
      End
      Begin VB.ComboBox cmbOtherAccount 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.ComboBox cmbOtherAcCurrency 
         Height          =   315
         Left            =   3240
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Tag             =   "11775"
         Top             =   1080
         Width           =   1455
      End
      Begin VB.ComboBox cmbOtherAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   18
         Tag             =   "11775"
         Top             =   1080
         Width           =   975
      End
      Begin VB.Frame frameOtherAccCheckBook 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   10215
         TabIndex        =   16
         Tag             =   "11775"
         Top             =   960
         Width           =   1455
         Begin VB.OptionButton optOtherAcCheckBookNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   20
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   165
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optOtherAcCheckBookYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   19
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   165
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbCurrentAcStatus 
         Height          =   315
         Left            =   5760
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Tag             =   "11775"
         Top             =   120
         Width           =   1335
      End
      Begin VB.ComboBox cmbSavingAcStatus 
         Height          =   315
         Left            =   5760
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   600
         Width           =   1335
      End
      Begin VB.ComboBox cmbOtherAcStatus 
         Height          =   315
         Left            =   5760
         Style           =   2  'Dropdown List
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   1080
         Width           =   1335
      End
      Begin VB.Label lblCurrentAccount 
         BackColor       =   &H00BFD87E&
         Caption         =   "Current A/c"
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
         Left            =   0
         TabIndex        =   71
         Tag             =   "11775"
         Top             =   120
         Width           =   1335
      End
      Begin VB.Label lblCurrentAcCurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Curr."
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
         Left            =   2760
         TabIndex        =   70
         Tag             =   "11775"
         Top             =   120
         Width           =   495
      End
      Begin VB.Label lblCurrentAcStmtFreq 
         BackColor       =   &H00BFD87E&
         Caption         =   "Stmt.Freq."
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
         Left            =   7080
         TabIndex        =   69
         Tag             =   "11775"
         Top             =   165
         Width           =   1095
      End
      Begin VB.Label lblSavingAcc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Saving A/c"
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
         Left            =   0
         TabIndex        =   68
         Tag             =   "11775"
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label lblCurrentAcCheckBook 
         BackColor       =   &H00BFD87E&
         Caption         =   "Check Book"
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
         Left            =   9135
         TabIndex        =   67
         Tag             =   "11775"
         Top             =   180
         Width           =   1095
      End
      Begin VB.Label lblSavingAcCurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Curr."
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
         Left            =   2760
         TabIndex        =   66
         Tag             =   "11775"
         Top             =   600
         Width           =   495
      End
      Begin VB.Label lblOtherAccount 
         BackColor       =   &H00BFD87E&
         Caption         =   "Other A/c"
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
         Left            =   0
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label lblOtherAccurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Curr."
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
         Left            =   2760
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
      Begin VB.Label lblOtherAcStmtFreq 
         BackColor       =   &H00BFD87E&
         Caption         =   "Stmt.Freq."
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
         Left            =   7080
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   1125
         Width           =   1095
      End
      Begin VB.Label lblOtherAccheckBook 
         BackColor       =   &H00BFD87E&
         Caption         =   "Check Book"
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
         Left            =   9135
         TabIndex        =   62
         Tag             =   "11775"
         Top             =   1125
         Width           =   1095
      End
      Begin VB.Label lblCurrentAcStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "A/c Status"
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
         Left            =   4680
         TabIndex        =   61
         Tag             =   "11775"
         Top             =   165
         Width           =   1095
      End
      Begin VB.Label lblSavingAcStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "A/c Status"
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
         Left            =   4680
         TabIndex        =   60
         Tag             =   "11775"
         Top             =   645
         Width           =   1095
      End
      Begin VB.Label lblOtherAcStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "A/c Status"
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
         Left            =   4680
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   1125
         Width           =   1095
      End
      Begin VB.Label lblSavingAcStmtFreq 
         BackColor       =   &H00BFD87E&
         Caption         =   "Stmt.Freq."
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
         Left            =   7080
         TabIndex        =   58
         Tag             =   "11775"
         Top             =   645
         Width           =   1095
      End
   End
   Begin VB.Shape Shape1 
      Height          =   555
      Left            =   135
      Top             =   6045
      Width           =   11640
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
      Left            =   615
      TabIndex        =   96
      Top             =   6795
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   5520
      TabIndex        =   74
      Top             =   240
      Width           =   780
   End
   Begin VB.Label lblMainCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Individual"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Left            =   6480
      TabIndex        =   73
      Top             =   240
      Width           =   1845
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Other Individuals"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Left            =   8640
      TabIndex        =   72
      Top             =   240
      Width           =   2805
   End
   Begin VB.Label lblIndividualOthers3 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Individual Other Customer Details - Page 3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   360
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   5280
   End
   Begin VB.Shape Shape2 
      Height          =   450
      Left            =   0
      Top             =   105
      Width           =   11640
   End
   Begin VB.Line Line11 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   135
      X2              =   11820
      Y1              =   2235
      Y2              =   2235
   End
End
Attribute VB_Name = "frmIndividualOthersAcctInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmbCurrentAcCurrency_Click()
   If Len(RTrim(cmbCurrentAcCurrency.text)) <> 0 Then
      If Mid$(cmbCurrentAcCurrency.text, 1, 2) <> "01" Then
         optCurrentAcCheckBookNo.Value = True
         optCurrentAcCheckBookYes.Enabled = False
      Else
         optCurrentAcCheckBookYes.Enabled = True
      End If
   End If

End Sub

Private Sub cmbOtherAccount_Click()
   If Mid$(cmbOtherAccount.text, 1, 3) = "160" And _
      Mid$(cmbOtherAcCurrency.text, 1, 2) = "01" Then
      optOtherAcCheckBookYes.Enabled = True
   Else
      optOtherAcCheckBookNo.Value = True
      optOtherAcCheckBookYes.Enabled = False
   End If
End Sub

Private Sub cmbOtherAcCurrency_Click()
   If Len(RTrim(cmbOtherAccount.text)) <> 0 Then
      If Mid$(cmbOtherAccount.text, 1, 3) = "160" Then
         If Len(RTrim(cmbOtherAcCurrency.text)) <> 0 Then
            If Mid$(cmbOtherAcCurrency.text, 1, 2) <> "01" Then
               optOtherAcCheckBookNo.Value = True
               optOtherAcCheckBookYes.Enabled = False
            Else
               optOtherAcCheckBookYes.Enabled = True
            End If
         End If
      End If
   End If
End Sub
Public Sub unloadOtherIndividualSupForms()
  Dim tCustNo As String
  If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
     tCustNo = Space(7)
  Else
     tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
  End If
  If recvOtherIndividualMsg.newOrUpdate = "N" And _
     recvSuperDecisionMsg.status = "000" Then
     If accOpenCardPrintAllowed = True Then
        If optCurrentAcYes Or optSavingAcYes Or Mid$(cmbOtherAccount, 1, 3) > "000" Then
           printAccOpeningCard
        End If
     End If
  End If
  Unload Me
  Unload frmIndividualSaudi2
  Unload frmIndividualOthers2
  Unload frmIndividualOthers
  Unload frmIndividualJoint
  Unload frmSupervisorApproval
  frmEnquiry.readPendingList "00000", "S", tCustNo
  If UserLang = ARABIC Then
     ChangePositions frmSupervisorApproval, 11800
     frmSupervisorApproval.RightToLeft = True
     frmSupervisorApproval.Hide
  End If
  frmSupervisorApproval.Show
End Sub

Public Sub bringOldFlag()
    If updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
       If Len(RTrim(recvOtherIndividualMsg.packagedAcc)) = 0 Then
          tCode = "0"
       Else
          tCode = recvOtherIndividualMsg.packagedAcc
       End If
    Else
       tCode = "0"
    End If
    If tCode <> "" Then
       For i = 0 To frmIndividualOthers2.cmbPackageAcc.ListCount
           If Mid(frmIndividualOthers2.cmbPackageAcc.List(i), 1, 1) = tCode Then
              frmIndividualOthers2.cmbPackageAcc.ListIndex = i
              Exit For
            End If
        Next i
    Else
        frmIndividualOthers2.cmbPackageAcc.ListIndex = -1
    End If
    If i > frmIndividualOthers2.cmbPackageAcc.ListCount Then
        frmIndividualOthers2.cmbPackageAcc.text = tCode & "-Not defined in local"
    End If
End Sub

Public Sub updateCardPrdn(primaryOrSupplementary As String)

      If primaryOrSupplementary = "P" Then
         frmPrintingCard.txtCardNo = recvSuperDecisionMsg.primaryCard.cardNo
         frmPrintingCard.txtNameOnCard = recvSuperDecisionMsg.primaryCard.nameOnTheCard
      Else
         frmPrintingCard.txtCardNo = recvSuperDecisionMsg.suppCard.cardNo
         frmPrintingCard.txtNameOnCard = recvSuperDecisionMsg.suppCard.nameOnTheCard
      End If
         
      If primaryOrSupplementary = "P" Then
         frmPrintingCard.txtCardType = "PRIMARY"
      Else
         frmPrintingCard.txtCardType = "SUPPLEMENTARY"
      End If
      
     If cardProductionAtBranch = True And optChipCard.Value = False Then
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
     frmPrintingCard.tag = primaryOrSupplementary
     frmPrintingCard.Show vbModal
    
End Sub


Private Sub cmdApprove_Click()
   Dim tuserId, tSupervisorId, tDateTime, tBranchCode, tPrimaryAcc As String
   Dim mQry As String
   Dim tmpStr As String

   frmSupervisorApproval.MSFlexGrid1.Col = 0
   tuserId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
   frmSupervisorApproval.MSFlexGrid1.Col = 1
   tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
   tBranchCode = gBranchCode
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   tpinUserId = tuserId  ' used for tpin approval
   tpinDateTime = tDateTime   ' used for tpin approval
   tpinSupervisorId = tSupervisorId    ' used for tpin approval
   
   If recvOtherIndividualMsg.newOrUpdate = "N" Then
      If optCurrentAcYes.Value = True Then
         tPrimaryAcc = Mid$(cmbCurrentAcCurrency, 1, 2) & "008"
      ElseIf Mid$(cmbOtherAccount.text, 1, 3) = "160" Then
         tPrimaryAcc = Mid$(cmbOtherAcCurrency.text, 1, 2) & "160"
      ElseIf optSavingAcYes.Value = True Then
         tPrimaryAcc = Mid$(cmbSavingAcCurrency.text, 1, 2) & "009"
      Else
         tPrimaryAcc = Space(5)
      End If
   Else
      tPrimaryAcc = Space(5)
   End If
   
   SendMsg = "000268" & "19" & gBranchCode & "A" & tBranchCode & tuserId & tDateTime & _
             tSupervisorId & Space(200) & recvOtherIndividualMsg.newOrUpdate & tPrimaryAcc & _
             frmIndividualOthers.txtCustomerNo & "2" & activityFlag & Space(10) & Space(14) & Space(50) 'screen set no = 2
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   
   frmIndividualOthersAcctInfo.MousePointer = vbHourglass
   frmIndividualOthersAcctInfo.cmdApprove.Enabled = False
   frmIndividualOthersAcctInfo.cmdReject.Enabled = False
   frmIndividualOthersAcctInfo.cmdCancel.Enabled = False
   frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = False
   frmIndividualOthersAcctInfo.cmdDoc.Enabled = False
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmIndividualOthersAcctInfo.MousePointer = vbDefault
      frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
      frmIndividualOthersAcctInfo.cmdReject.Enabled = True
      frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
      frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
      frmIndividualOthersAcctInfo.cmdDoc.Enabled = True
      unloadOtherIndividualSupForms
      Exit Sub
   End If

   If recvSuperDecisionMsg.status = "000" Then
      frmIndividualOthersAcctInfo.MousePointer = vbDefault
      MsgBox errSuccessful(UserLang) '"transaction successfully completed..."
      If recvOtherIndividualMsg.newOrUpdate = "N" Then
         MsgBox errCustNoAlloted(UserLang) & recvSuperDecisionMsg.custNo & "    " & Chr$(13) & _
                IIf(Len(Trim(recvSuperDecisionMsg.ibanAccNo)) = 0, "", IIf(UserLang = ARABIC, Mid$(recvSuperDecisionMsg.ibanAccNo, 1, 2) & errIban(UserLang) & ":" & Mid$(recvSuperDecisionMsg.ibanAccNo, 3), errIban(UserLang) & ":" & recvSuperDecisionMsg.ibanAccNo))
                
         If cardProductionAtBranch = True Or pinSelectAtBranch = True Then
            If Len(RTrim(recvSuperDecisionMsg.primaryCard.cardNo)) > 0 Then
               If recvSuperDecisionMsg.primaryCard.branchPinSelect = "Y" Then
                  updateCardPrdn "P"
               ElseIf Len(RTrim(recvSuperDecisionMsg.suppCard.cardNo)) > 0 And _
                       recvSuperDecisionMsg.suppCard.branchPinSelect = "Y" Then
                   updateCardPrdn "S"
               Else
                  If realOrPseudo = "1" Then
                     updateBranchPower
                  Else
                     unloadOtherIndividualSupForms
                  End If
               End If
            Else
               If realOrPseudo = "1" Then
                  updateBranchPower
               Else
                  unloadOtherIndividualSupForms
               End If
            End If
         Else
            If realOrPseudo = "1" Then
               updateBranchPower
            Else
               unloadOtherIndividualSupForms
            End If
         End If
      Else
         If realOrPseudo = "1" Then
            updateBranchPower
         Else
            unloadOtherIndividualSupForms
         End If
      End If
   Else
      If UserLang = ARABIC Then
         MsgBox recvSuperDecisionMsg.aRemarks
      Else
         MsgBox recvSuperDecisionMsg.eRemarks
      End If
      frmIndividualOthersAcctInfo.MousePointer = vbDefault
      unloadOtherIndividualSupForms
      Exit Sub
   End If
End Sub
   
Public Function updateBranchPower()

   frmIndividualOthersAcctInfo.MousePointer = vbHourglass
   frmIndividualOthers.txtCustomerNo = recvSuperDecisionMsg.custNo
   formatIndividualOtherCustRequest
   
   'now form the customer buffer to insert into BranchPower
   If openCustFile = 1 Then
      frmIndividualOthersAcctInfo.MousePointer = vbDefault
      frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
      frmIndividualOthersAcctInfo.cmdReject.Enabled = True
      frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
      frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
      unloadOtherIndividualSupForms
      updateBranchPower = 1
      Exit Function
   End If
   
   If recvOtherIndividualMsg.newOrUpdate = "U" Then
      If readClient = 1 Then
         frmIndividualOthersAcctInfo.MousePointer = vbDefault
         frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
         frmIndividualOthersAcctInfo.cmdReject.Enabled = True
         frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
         frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadOtherIndividualSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   CustBuf.recType = "02"
   CustBuf.clientNo = Format(recvSuperDecisionMsg.custNo, "!@@@@@@@@@")
   If recvOtherIndividualMsg.newOrUpdate = "N" Then
      If individualOthersInfo.langPref = "0" Then
         If branchPowerEnv = "DOS" Then
            CustBuf.shortName1 = windowToAsmo(individualOthersInfo.aShortName)
            CustBuf.alphacode = windowToAsmo(Format(Mid$(individualOthersInfo.aLastName, 1, 3) & Mid$(individualOthersInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
         Else
            CustBuf.shortName1 = individualOthersInfo.aShortName
            CustBuf.alphacode = Format(Mid$(individualOthersInfo.aLastName, 1, 3) & Mid$(individualOthersInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "0"
      Else
         If branchPowerEnv = "DOS" Then
            CustBuf.shortName1 = windowToAsmo(individualOthersInfo.eShortName)
            CustBuf.alphacode = windowToAsmo(Format(Mid$(individualOthersInfo.eLastName, 1, 3) & Mid$(individualOthersInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
         Else
            CustBuf.shortName1 = individualOthersInfo.eShortName
            CustBuf.alphacode = Format(Mid$(individualOthersInfo.eLastName, 1, 3) & Mid$(individualOthersInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "1"
      End If
      If branchPowerEnv = "DOS" Then
         CustBuf.address1 = windowToAsmo(Format(individualOthersInfo.address1, "!" & String(45, "@")))
         CustBuf.address2 = windowToAsmo(Format(Mid$(individualOthersInfo.poBox, 1, 10) & Mid$(individualOthersInfo.cityName, 1, 20) & Mid$(individualOthersInfo.zipCode, 7), "!" & String(45, "@")))
         CustBuf.address3 = windowToAsmo(Format("Q" & individualOthersInfo.iqamaNo, "!" & String(45, "@")))
      Else
         CustBuf.address1 = Format(individualOthersInfo.address1, "!" & String(45, "@"))
         CustBuf.address2 = Format(Mid$(individualOthersInfo.poBox, 1, 10) & Mid$(individualOthersInfo.cityName, 1, 20) & Mid$(individualOthersInfo.zipCode, 7), "!" & String(45, "@"))
         CustBuf.address3 = Format("Q" & individualOthersInfo.iqamaNo, "!" & String(45, "@"))
      End If
   Else
      If recvSuperDecisionMsg.nameChanged = "1" Then
         If individualOthersInfo.langPref = "0" Then
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(individualOthersInfo.aShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(individualOthersInfo.aLastName, 1, 3) & Mid$(individualOthersInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = individualOthersInfo.aShortName
               CustBuf.alphacode = Format(Mid$(individualOthersInfo.aLastName, 1, 3) & Mid$(individualOthersInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "0"
         Else
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(individualOthersInfo.eShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(individualOthersInfo.eLastName, 1, 3) & Mid$(individualOthersInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = individualOthersInfo.eShortName
               CustBuf.alphacode = Format(Mid$(individualOthersInfo.eLastName, 1, 3) & Mid$(individualOthersInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "1"
         End If
      End If
      If recvSuperDecisionMsg.addressChanged = "1" Then
         If branchPowerEnv = "DOS" Then
            CustBuf.address1 = windowToAsmo(Format(individualOthersInfo.address1, "!" & String(45, "@")))
            CustBuf.address2 = windowToAsmo(Format(Mid$(individualOthersInfo.poBox, 1, 10) & Mid$(individualOthersInfo.cityName, 1, 20) & Mid$(individualOthersInfo.zipCode, 7), "!" & String(45, "@")))
            CustBuf.address3 = windowToAsmo(Format("Q" & individualOthersInfo.iqamaNo, "!" & String(45, "@")))
        Else
            CustBuf.address1 = Format(individualOthersInfo.address1, "!" & String(45, "@"))
            CustBuf.address2 = Format(Mid$(individualOthersInfo.poBox, 1, 10) & Mid$(individualOthersInfo.cityName, 1, 20) & Mid$(individualOthersInfo.zipCode, 7), "!" & String(45, "@"))
            CustBuf.address3 = Format("Q" & individualOthersInfo.iqamaNo, "!" & String(45, "@"))
        End If
      End If
   End If
   CustBuf.location = Space(30)
   CustBuf.mainCurr = "SAR"
   CustBuf.secRatg = "00"
   CustBuf.closedInd = Space(1)
   CustBuf.garnOrder = String(18, "0")
   CustBuf.address4 = Space(45)
   CustBuf.address5 = Space(45)
   CustBuf.address6 = Space(45)
   CustBuf.address7 = Space(45)
   CustBuf.dispData = Space(60)
   CustBuf.filler = Space(100)
   
   If recvOtherIndividualMsg.newOrUpdate = "N" Then
      If insertClient = 1 Then
         frmIndividualOthersAcctInfo.MousePointer = vbDefault
         frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
         frmIndividualOthersAcctInfo.cmdReject.Enabled = True
         frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
         frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadOtherIndividualSupForms
         updateBranchPower = 1
         Exit Function
      End If
   Else
      If updateClient = 1 Then
         frmIndividualOthersAcctInfo.MousePointer = vbDefault
         frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
         frmIndividualOthersAcctInfo.cmdReject.Enabled = True
         frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
         frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadOtherIndividualSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   closeClient
   
   If recvOtherIndividualMsg.newOrUpdate = "U" Then
      frmIndividualOthersAcctInfo.MousePointer = vbDefault
      frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
      frmIndividualOthersAcctInfo.cmdReject.Enabled = True
      frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
      frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
      unloadOtherIndividualSupForms
      updateBranchPower = 0
      Exit Function
   End If
  
   If openAcctFile = 1 Then
      frmIndividualOthersAcctInfo.MousePointer = vbDefault
      frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
      frmIndividualOthersAcctInfo.cmdReject.Enabled = True
      frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
      frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
      unloadOtherIndividualSupForms
      updateBranchPower = 1
      Exit Function
   End If
         
   If frmIndividualOthersAcctInfo.optCurrentAcYes.Value = True Then
      formatAcctInfo "008", Left$(frmIndividualOthersAcctInfo.cmbCurrentAcCurrency.text, 2), _
                     Left$(frmIndividualOthersAcctInfo.cmbCurrentAcStatus.text, 2), _
                     Left$(frmIndividualOthersAcctInfo.cmbCurrentAcStmtFreq.text, 2), _
                     IIf(frmIndividualOthersAcctInfo.optCurrentAcCheckBookYes, "0", "1"), "0", recvSuperDecisionMsg.custNo
                     
       ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " & _
                                  "'" & Mid$(AccBuf.accNo, 1, 2) & "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = rs(0)
       Else
          AccBuf.currency = "SAR"
       End If
       AccBuf.accType = Space(4)
       AccBuf.Description = Format("Current A/C", "!" & String(30, "@"))
       AccBuf.clientNo = Format(Mid$(acctInfo.acctNo, 6, 7), "!@@@@@@@@@")
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
       AccBuf.lastDate = CStr(Year(Date)) & Format(CStr(Month(Date)), "00") & Format(CStr(Day(Date)), "00")
       AccBuf.altAccNo = Space(20)
       AccBuf.pwProtected = "0"
       AccBuf.filler1 = Space(65)
 
       If insertAccount = 1 Then
          frmIndividualOthersAcctInfo.MousePointer = vbDefault
          frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
          frmIndividualOthersAcctInfo.cmdReject.Enabled = True
          frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
          frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadOtherIndividualSupForms
          updateBranchPower = 1
          Exit Function
       End If
    End If
    
    If frmIndividualOthersAcctInfo.optSavingAcYes.Value = True Then
       formatAcctInfo "009", Left$(frmIndividualOthersAcctInfo.cmbSavingAcCurrency.text, 2), _
                      Left$(frmIndividualOthersAcctInfo.cmbSavingAcStatus.text, 2), _
                      Left$(frmIndividualOthersAcctInfo.cmbSavingAcStmtFreq.text, 2), _
                      Space(1), "0", recvSuperDecisionMsg.custNo
                     
       ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " & _
                                  "'" & Mid$(AccBuf.accNo, 1, 2) & "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = rs(0)
       Else
          AccBuf.currency = "SAR"
       End If
       AccBuf.accType = Space(4)
       AccBuf.Description = Format("Savings A/C", "!" & String(30, "@"))
       AccBuf.clientNo = Format(Mid$(acctInfo.acctNo, 6, 7), "!@@@@@@@@@")
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
       AccBuf.lastDate = CStr(Year(Date)) & Format(CStr(Month(Date)), "00") & Format(CStr(Day(Date)), "00")
       AccBuf.altAccNo = Space(20)
       AccBuf.pwProtected = "0"
       AccBuf.filler1 = Space(100)
 
       If insertAccount = 1 Then
          frmIndividualOthersAcctInfo.MousePointer = vbDefault
          frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
          frmIndividualOthersAcctInfo.cmdReject.Enabled = True
          frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
          frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadOtherIndividualSupForms
          updateBranchPower = 1
          Exit Function
       End If
    End If
    
    If frmIndividualOthersAcctInfo.cmbOtherAccount.ListIndex >= 0 And _
       Mid$(frmIndividualOthersAcctInfo.cmbOtherAccount.text, 1, 3) <> "000" Then
       formatAcctInfo Left$(frmIndividualOthersAcctInfo.cmbOtherAccount.text, 3), _
                      Left$(frmIndividualOthersAcctInfo.cmbOtherAcCurrency.text, 2), _
                      Left$(frmIndividualOthersAcctInfo.cmbOtherAcStatus.text, 2), _
                      Left$(frmIndividualOthersAcctInfo.cmbOtherAcStmtFreq.text, 2), _
                      IIf(Left$(frmIndividualOthersAcctInfo.cmbOtherAccount.text, 3) = "160", _
                      IIf(frmIndividualOthersAcctInfo.optOtherAcCheckBookYes, "0", "1"), _
                      Space(1)), "0", recvSuperDecisionMsg.custNo
                              
        ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " & _
                                  "'" & Mid$(AccBuf.accNo, 1, 2) & "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = rs(0)
       Else
          AccBuf.currency = "SAR"
       End If
       AccBuf.accType = Space(4)
       AccBuf.Description = Format("Other A/C", "!" & String(30, "@"))
       AccBuf.clientNo = Format(Mid$(acctInfo.acctNo, 6, 7), "!@@@@@@@@@")
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
       AccBuf.lastDate = CStr(Year(Date)) & Format(CStr(Month(Date)), "00") & Format(CStr(Day(Date)), "00")
       AccBuf.altAccNo = Space(20)
       AccBuf.pwProtected = "0"
       AccBuf.filler1 = Space(65)
 
       If insertAccount = 1 Then
          frmIndividualOthersAcctInfo.MousePointer = vbDefault
          frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
          frmIndividualOthersAcctInfo.cmdReject.Enabled = True
          frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
          frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadOtherIndividualSupForms
          updateBranchPower = 1
          Exit Function
       End If
  End If
  
  closeAcct
  updateBranchPower = 0
    
  frmIndividualOthersAcctInfo.MousePointer = vbDefault
  frmIndividualOthersAcctInfo.cmdApprove.Enabled = True
  frmIndividualOthersAcctInfo.cmdReject.Enabled = True
  frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
  frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True

  unloadOtherIndividualSupForms
End Function
Public Sub approveTpinSelect()
   frmAcceptTPin.txtCustNo = recvSuperDecisionMsg.custNo
   
   If individualOthersInfo.langPref = "0" Then
      frmAcceptTPin.txtCustName = frmIndividualOthers.txtArabShortName
   Else
      frmAcceptTPin.txtCustName = frmIndividualOthers.txtEngShortName
   End If
   If tpinMandatoryAtBranch = False Then
      frmAcceptTPin.cmdCancel.Enabled = True
   Else
      frmAcceptTPin.cmdCancel.Enabled = False
   End If
   frmAcceptTPin.optTPinSelectedYes.Value = True
   frmAcceptTPin.tag = "A"   '  Approve Tpin
   frmAcceptTPin.Show vbModal
End Sub
Private Sub cmdCancel_Click()
    Unload Me
End Sub
Public Function checkOtherIndividualAddressChange() As Boolean
    formatIndividualOtherCustRequest
    If Trim(individualOthersInfo.address1) <> Trim(recvOtherIndividualMsg.address1) Or _
       Trim(individualOthersInfo.address2) <> Trim(recvOtherIndividualMsg.address2) Or _
       Trim(individualOthersInfo.poBox) <> Trim(recvOtherIndividualMsg.poBox) Or _
       Trim(individualOthersInfo.cityName) <> Trim(recvOtherIndividualMsg.cityName) Or _
       Trim(individualOthersInfo.zipCode) <> Trim(recvOtherIndividualMsg.zipCode) Then
       checkOtherIndividualAddressChange = True
    Else
        checkOtherIndividualAddressChange = False
    End If

End Function

Private Sub cmdCreate_Click()
   
    If validateFrmIndividualsOthers3 = 1 Then
       Exit Sub
    End If
    
    If frmIndividualOthersAcctInfo.optJoint.Value = True Then
       If Not updateAction And _
          Not (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
          If Val(noOfJoint) = 0 Then
             MsgBox errAtleastOneJointNeeded(UserLang)
             Exit Sub
          End If
       End If
    End If
    
    If subCategoryCode = "63" Then
       If Val(noOfReference) = 0 Then
          MsgBox errAtleasetOneReferenceReqd(UserLang)
          Exit Sub
       End If
    End If
    
    If Len(RTrim(gDateTime)) = 0 Then
       gDateTime = getUnixDateTime
       If Trim(gDateTime) = "ERROR" Then
          gDateTime = Space(14)
          Exit Sub
       End If
    End If
    
    If activityFlag = "P" And Len(RTrim(branchActionDateTime)) = 0 Then
       branchActionDateTime = getUnixDateTime
       If Trim(branchActionDateTime) = "ERROR" Then
          branchActionDateTime = Space(14)
          Exit Sub
       End If
    End If
    
    If frmIndividualOthersAcctInfo.optJoint.Value = True Then
       frmJointAccName.Caption = frmJointAccNameCaption(0, UserLang)
       frmJointAccName.lblJointAccNameOnCheck.Caption = frmJointAccNameCaption(1, UserLang)
       frmJointAccName.lblLine2.Caption = frmJointAccNameCaption(2, UserLang)
       frmJointAccName.lblJointAccNameOnReports.Caption = frmJointAccNameCaption(3, UserLang)
       frmJointAccName.cmdOk.Caption = frmJointAccNameCaption(4, UserLang)
       frmJointAccName.txtJointAccNameOnCheck.Enabled = True
       frmJointAccName.txtJointAccNameOnCheck1.Enabled = True
       frmJointAccName.txtJointAccNameOnReports.Enabled = True
       If tellerAction Or updateAction Then
          frmJointAccName.txtJointAccNameOnCheck = Mid$(recvOtherIndividualMsg.jointAccNameOnCheck, 1, 30)
          frmJointAccName.txtJointAccNameOnCheck1 = Mid$(recvOtherIndividualMsg.jointAccNameOnCheck, 31, 30)
          frmJointAccName.txtJointAccNameOnReports = recvOtherIndividualMsg.jointAccNameOnReports
       Else
          If frmIndividualOthers.optLangEnglish.Value = True Then
             frmJointAccName.txtJointAccNameOnCheck.Alignment = 0
             frmJointAccName.txtJointAccNameOnCheck1.Alignment = 0
             frmJointAccName.txtJointAccNameOnReports.Alignment = 0
             frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualOthers.txtEngFirstName & _
                                " " & frmIndividualOthers.txtEnglish2ndName & _
                                " " & frmIndividualOthers.txtEnglish3rdName & _
                                " " & frmIndividualOthers.txtEngLastName
             If Len(frmJointAccName.txtJointAccNameOnCheck) > 27 Then
                frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualOthers.txtEngFirstName & _
                                " " & frmIndividualOthers.txtEnglish2ndName & _
                                " " & frmIndividualOthers.txtEnglish3rdName
                If Len(frmJointAccName.txtJointAccNameOnCheck) > 28 Then
                   frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualOthers.txtEngFirstName & _
                                " " & frmIndividualOthers.txtEnglish2ndName
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmIndividualOthers.txtEnglish3rdName & _
                                " " & frmIndividualOthers.txtEngLastName
                Else
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmIndividualOthers.txtEngLastName
                End If
            End If
            frmJointAccName.txtJointAccNameOnReports = frmIndividualOthers.txtEngFirstName & " " & frmIndividualOthers.txtEngLastName
        Else
            frmJointAccName.txtJointAccNameOnCheck.Alignment = 1
            frmJointAccName.txtJointAccNameOnCheck1.Alignment = 1
            frmJointAccName.txtJointAccNameOnReports.Alignment = 1
            frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualOthers.txtArabFirstName & _
                                " " & frmIndividualOthers.txtArabic2ndName & _
                                " " & frmIndividualOthers.txtArabic3rdName & _
                                " " & frmIndividualOthers.txtArabLastName
             If Len(frmJointAccName.txtJointAccNameOnCheck) > 27 Then
                frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualOthers.txtArabFirstName & _
                                " " & frmIndividualOthers.txtArabic2ndName & _
                                " " & frmIndividualOthers.txtArabic3rdName
                If Len(frmJointAccName.txtJointAccNameOnCheck) > 28 Then
                   frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualOthers.txtArabFirstName & _
                                " " & frmIndividualOthers.txtArabic2ndName
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmIndividualOthers.txtArabic3rdName & _
                                " " & frmIndividualOthers.txtArabLastName
                Else
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmIndividualOthers.txtArabLastName
                End If
             End If
             frmJointAccName.txtJointAccNameOnReports = frmIndividualOthers.txtArabFirstName & " " & frmIndividualOthers.txtArabLastName
         End If
      End If
      frmJointAccName.Show vbModal
    Else
       frmJointAccName.txtJointAccNameOnCheck = Space(30)
       frmJointAccName.txtJointAccNameOnCheck1 = Space(30)
       frmJointAccName.txtJointAccNameOnReports = Space(30)
       If updateAction = True Or _
          (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
          'If checkOtherIndividualAddressChange = True Then 'Ver 2.5.3
              frmCardAddress.Show
              frmCardAddress.txtDeliveryAddr2 = "(*)" & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                                               IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                                               "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
              If frmIndividualOthers.optPoBox = True Then
                 frmCardAddress.tag = "0"
                 frmCardAddress.poBoxEnableControls
                 frmCardAddress.txtDeliveryAddr1 = frmIndividualOthers.txtAddress1
                 frmCardAddress.txtDeliveryPOBox = frmIndividualOthers.txtPOBox
                 frmCardAddress.txtDeliveryZipcode = frmIndividualOthers.txtPinCode
              Else
                 frmCardAddress.tag = "1"
                 frmCardAddress.GPSEnableControls
                 frmCardAddress.txtGPSNo = frmIndividualOthers.txtSaudiPostGPSNo
                 frmCardAddress.txtGPSStreetName = frmIndividualOthers.txtSaudiPostStreetName
                 frmCardAddress.txtGPSUnit = frmIndividualOthers.txtSaudiPostUnit
                 frmCardAddress.txtGPSZipCode = frmIndividualOthers.txtSaudiPostZipCode
                 frmCardAddress.txtGPSAdditionalNo = frmIndividualOthers.txtSaudiPostAdditionalNo
              End If
              frmCardAddress.cmbDeliveryCity = frmIndividualOthers.cmbCity.text
'          Else ' ver 2.5.3
'             individualOthersInfo.updateCardAddressReqd = "0"  ' ver 2.5.3
'             createOtherIndividualCustomer ' ver 2.5.3
'          End If ' ver 2.5.3
       Else
           createOtherIndividualCustomer
       End If
    End If
   
End Sub
Public Sub createOtherIndividualCustomer()

    Dim strmsglen As String
    
    formatIndividualOtherCustRequest
     
    currentAccInfo = Space(12)
    savingAccInfo = Space(12)
    otherAccInfo = Space(12)
    If optCurrentAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvOtherIndividualMsg.currentAccInfo)) = 0 Then
             formatOtherCurrentAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatOtherCurrentAcc "0", "U"
          End If
       Else
          formatOtherCurrentAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvOtherIndividualMsg.currentAccInfo)) <> 0 Then
          formatOtherCurrentAcc "1", "U"
       End If
    End If
    
    If optSavingAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvOtherIndividualMsg.savingsAccInfo)) = 0 Then
             formatOtherSavingAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatOtherSavingAcc "0", "U"
          End If
       Else
          formatOtherSavingAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvOtherIndividualMsg.savingsAccInfo)) <> 0 Then
          formatOtherSavingAcc "1", "U"
       End If
    End If
    
    If cmbOtherAccount.ListIndex >= 0 And _
       Mid$(cmbOtherAccount.text, 1, 3) <> "000" Then
       If tellerAction Then
          If Len(RTrim(recvOtherIndividualMsg.otherAccInfo)) = 0 Then
             formatOtherOtherAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatOtherOtherAcc "0", "U"
          End If
       Else
          formatOtherOtherAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvOtherIndividualMsg.otherAccInfo)) <> 0 Then
          formatOtherOtherAcc "1", "U"
       End If
    End If

    SendMsg = individualOthersInfo.msgLen & individualOthersInfo.service & gBranchCode & individualOthersInfo.userId & individualOthersInfo.branchCode & individualOthersInfo.dateTime & _
              individualOthersInfo.creationOrUpdate & individualOthersInfo.NewOrUpdateFlag & _
              individualOthersInfo.bmUpdateStatus & individualOthersInfo.customerNo & individualOthersInfo.supervisorId & individualOthersInfo.custBranchCode & individualOthersInfo.samaMainCategory & individualOthersInfo.samaSubCategory & individualOthersInfo.screenSetNo & _
              individualOthersInfo.iqamaNo & individualOthersInfo.iqamaIssuedAt & individualOthersInfo.iqamaDateType & individualOthersInfo.iqamaIssueDateH & individualOthersInfo.iqamaIssueDateG & individualOthersInfo.iqamaExpiryDateH & individualOthersInfo.iqamaExpiryDateG & _
              individualOthersInfo.ppNo & individualOthersInfo.ppIssuedAt & individualOthersInfo.ppDateType & _
              individualOthersInfo.ppIssueDateH & individualOthersInfo.ppIssueDateG & individualOthersInfo.ppExpiryDateH & individualOthersInfo.ppExpiryDateG & _
              individualOthersInfo.langPref & individualOthersInfo.nationality & Mid$(individualOthersInfo.titleCode, 1, 2) & individualOthersInfo.dobDateType & individualOthersInfo.dobDateH & individualOthersInfo.dobDateG & _
              individualOthersInfo.sexCode & individualOthersInfo.vipCode & individualOthersInfo.maritalStatus & individualOthersInfo.noOfDependents & individualOthersInfo.residentStatus & Mid$(individualOthersInfo.businessType, 1, 3) & _
              individualOthersInfo.aFirstName & individualOthersInfo.a2ndName & individualOthersInfo.a3rdName & individualOthersInfo.aLastName & individualOthersInfo.aShortName & individualOthersInfo.eFirstName & individualOthersInfo.e2ndName & individualOthersInfo.e3rdName & individualOthersInfo.eLastName & individualOthersInfo.eShortName & _
              individualOthersInfo.address1 & individualOthersInfo.address2 & individualOthersInfo.poBox & individualOthersInfo.cityName & individualOthersInfo.zipCode & individualOthersInfo.country & individualOthersInfo.telOffAreaCode & individualOthersInfo.telOffNo & individualOthersInfo.telOffExt & _
              individualOthersInfo.telHomeAreaCode & individualOthersInfo.telHomeNo & individualOthersInfo.telHomeExt & individualOthersInfo.faxAreaCode & individualOthersInfo.faxNo & individualOthersInfo.faxExt & individualOthersInfo.mobileNo & individualOthersInfo.pagerNo & individualOthersInfo.eMail & _
              individualOthersInfo.homeCountryId & individualOthersInfo.homeCountryIdDateType & individualOthersInfo.homeCountryIdIssueDateH & individualOthersInfo.homeCountryIdIssueDateG & individualOthersInfo.homeCountryIdExpiryDateH & individualOthersInfo.homeCountryIdExpiryDateG & individualOthersInfo.homeAddress1 & individualOthersInfo.homeAddress2 & individualOthersInfo.homePoBox & _
              individualOthersInfo.homeCityName & individualOthersInfo.homeZipCode & individualOthersInfo.homeCountry & individualOthersInfo.homeTelOffAreaCode & individualOthersInfo.homeTelOffNo & individualOthersInfo.homeTelOffExt & individualOthersInfo.homeTelHomeAreaCode & individualOthersInfo.homeTelHomeNo & individualOthersInfo.homeTelHomeExt & individualOthersInfo.homeFaxAreaCode & individualOthersInfo.homeFaxNo & individualOthersInfo.homeFaxExt & _
              individualOthersInfo.homeMobileNo & individualOthersInfo.homePagerNo & individualOthersInfo.homeEmail
              
              ' Since there a limitation on using the continuaion ; sendmsg is splitted into 2 lin
    SendMsg = SendMsg & individualOthersInfo.educationCode & individualOthersInfo.professionCode & individualOthersInfo.positionCode & individualOthersInfo.monthlyIncome & individualOthersInfo.segmentation & individualOthersInfo.ownerShip & individualOthersInfo.employerName & individualOthersInfo.department & _
              individualOthersInfo.employerPoBox & individualOthersInfo.employerCity & individualOthersInfo.employerZipCode & individualOthersInfo.documents & individualOthersInfo.documentOther & individualOthersInfo.singleJointAcc & individualOthersInfo.packagedAcc & individualOthersInfo.noOfJointAcc & _
              individualOthersInfo.jointAccNameOnCheck & individualOthersInfo.jointAccNameOnReports & individualOthersInfo.signatureNature & individualOthersInfo.electronIntlRequired & individualOthersInfo.electronIntlName & individualOthersInfo.electronIntlSuppRequired & individualOthersInfo.electronIntlSuppName & individualOthersInfo.deliveryToBranchOrPO & individualOthersInfo.deliveryAddress1 & individualOthersInfo.deliveryAddress2 & individualOthersInfo.deliveryPoBox & individualOthersInfo.deliveryCity & _
              individualOthersInfo.deliveryZip & individualOthersInfo.supervisorComments & individualOthersInfo.updateCardAddressReqd & individualOthersInfo.internetBankAcc & individualOthersInfo.custAdviceFlag & individualOthersInfo.altBranchCode & _
              currentAccInfo & savingAccInfo & otherAccInfo & individualOthersInfo.updatedForSama & _
              individualOthersInfo.relationshipManager & individualOthersInfo.generalMemo & _
              individualOthersInfo.interGroupAccNo & individualOthersInfo.specialRefNo & individualOthersInfo.samaAuthNo & _
              individualOthersInfo.samaAuthDateType & individualOthersInfo.samaAuthDateH & individualOthersInfo.samaAuthDateG & _
              individualOthersInfo.cardType & individualOthersInfo.marketingMemo & individualOthersInfo.addressType & _
              individualOthersInfo.custOpenSource & individualOthersInfo.branchCSOId & _
              individualOthersInfo.branchActionDateTime & individualOthersInfo.activityFlag & individualOthersInfo.excludeFromAtmFees & _
              individualOthersInfo.excludeFromMinBalFees & individualOthersInfo.accFreezingGracePeriod & _
              individualOthersInfo.visaNo & individualOthersInfo.visaIssuedAt & individualOthersInfo.visaDateType & _
              individualOthersInfo.visaIssueDateH & individualOthersInfo.visaIssueDateG & individualOthersInfo.visaExpiryDateH & _
              individualOthersInfo.visaExpiryDateG & individualOthersInfo.appRefNo & individualOthersInfo.appDateType & individualOthersInfo.appIssueDateH & _
              individualOthersInfo.appIssueDateG & individualOthersInfo.appExpiryDateH & individualOthersInfo.appExpiryDateG & _
              individualOthersInfo.appRefName & individualOthersInfo.pkgStmtFreqOverride & individualOthersInfo.iqamaType & Space(50)
           
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    
    frmIndividualOthersAcctInfo.MousePointer = vbHourglass
    frmIndividualOthersAcctInfo.cmdCreate.Enabled = False
    frmIndividualOthersAcctInfo.cmdJointAcc.Enabled = False
    frmIndividualOthersAcctInfo.cmdCancel.Enabled = False
    frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmIndividualOthersAcctInfo.cmdCreate.Enabled = True
       frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
       If frmIndividualOthersAcctInfo.optJoint = True Then
          frmIndividualOthersAcctInfo.cmdJointAcc.Enabled = True
       End If
       frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
       frmIndividualOthersAcctInfo.MousePointer = vbDefault
       Exit Sub
    End If
    frmIndividualOthersAcctInfo.MousePointer = vbDefault
    frmIndividualOthersAcctInfo.cmdCreate.Enabled = True
    If frmIndividualOthersAcctInfo.optJoint = True Then
       frmIndividualOthersAcctInfo.cmdJointAcc.Enabled = True
    End If
    frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
    frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
       gCustNo = recvCustomerMsg.custNo
       If activityFlag = "P" Then
          individualOthersInfo.dateTime = individualOthersInfo.branchActionDateTime
       End If
       If individualOthersInfo.NewOrUpdateFlag = "N" And individualOthersInfo.creationOrUpdate = "C" Then
          frmIndividualOthers.txtCustomerNo = recvCustomerMsg.custNo
          If UserLang = ARABIC Then
             tmpStr = "ÑÞã ÇáÚãíá" & recvCustomerMsg.custNo
          Else
             tmpStr = "Customer Number Alloted is " & recvCustomerMsg.custNo
          End If
          MsgBox tmpStr
       End If
    Else
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
       unloadOtherIndividualForms
       Exit Sub
    End If
    
    If updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
       unloadOtherIndividualForms
       Exit Sub
    End If
    
    frmIndividualOthersAcctInfo.MousePointer = vbHourglass
    
    If phoneCustOpenAction = False Then
       If individualOthersInfo.NewOrUpdateFlag = "N" And (individualOthersInfo.creationOrUpdate = "C" Or _
         (tellerAction And activityFlag = "P")) Then
         If pinSelectAtBranch = True Then
            atmPin = Space(4)
            atmPin2 = Space(4)
            If frmIndividualOthersAcctInfo.optPrimaryElectronIntlCardYes = True Then
               frmAcceptPin.tag = "P" ' primary card
               frmAcceptPin.txtCardType = "Primary"
               frmAcceptPin.txtNameOnTheCard = frmIndividualOthersAcctInfo.txtPrimaryElectronIntlCardName
               frmAcceptPin.Show vbModal
            End If
          End If
        End If
    End If
    
    unloadOtherIndividualForms
    
End Sub
Public Sub acceptTpin()
   frmAcceptTPin.txtCustNo = gCustNo
   
   If individualOthersInfo.langPref = "0" Then
      frmAcceptTPin.txtCustName = frmIndividualOthers.txtArabShortName
   Else
      frmAcceptTPin.txtCustName = frmIndividualOthers.txtEngShortName
   End If
   frmAcceptTPin.tag = "C"
   If tpinMandatoryAtBranch = False Then
      frmAcceptTPin.cmdCancel.Enabled = True
   Else
      frmAcceptTPin.cmdCancel.Enabled = False
   End If
   frmAcceptTPin.Show vbModal
End Sub


Private Sub cmdDoc_Click()

    If supervisorAction Or searchAction Or tellerAction Or updateAction Or custHistoryAction Then
       documentsSelected = recvOtherIndividualMsg.documents
       otherDocumentsEntered = recvOtherIndividualMsg.documentOther
    End If
    frmDocuments.Show
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdJointAcc_Click()
   Dim tCode, tuserId, tDateTime, tBranchCode As String
     
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If validateFrmIndividualsOthers3 = 1 Then
         Exit Sub
      End If
      If Len(RTrim(gDateTime)) = 0 Then
         gDateTime = getUnixDateTime
         If Trim(gDateTime) = "ERROR" Then
            gDateTime = Space(14)
            Exit Sub
         End If
      End If
      If acitivityflag = "P" And Len(RTrim(branchActionDateTime)) = 0 Then
         branchActionDateTime = getUnixDateTime
         If Trim(branchActionDateTime) = "ERROR" Then
            branchActionDateTime = Space(14)
            Exit Sub
         End If
      End If
      If frmIndividualOthersAcctInfo.OptSingle.Value = True Then
         MsgBox errNotAJointAccount(UserLang) ' "This account is not a joint account..."
         Exit Sub
      End If
      If Not tellerAction And Not updateAction Then
         If frmIndividualOthers.optPoBox = True Then
            frmIndividualJoint.txtAddress1 = frmIndividualOthers.txtAddress1
            frmIndividualJoint.txtAddress2 = frmIndividualOthers.txtAddress2
            frmIndividualJoint.txtPOBox = frmIndividualOthers.txtPOBox
            frmIndividualJoint.txtPinCode = frmIndividualOthers.txtPinCode
         Else  ' GPS address is selected
            frmIndividualJoint.txtSaudiPostGPSNo = frmIndividualOthers.txtSaudiPostGPSNo
            frmIndividualJoint.txtSaudiPostStreetName = frmIndividualOthers.txtSaudiPostStreetName
            frmIndividualJoint.txtSaudiPostUnit = frmIndividualOthers.txtSaudiPostUnit
            frmIndividualJoint.txtSaudiPostZipCode = frmIndividualOthers.txtSaudiPostZipCode
            frmIndividualJoint.txtSaudiPostAdditionalNo = frmIndividualOthers.txtSaudiPostAdditionalNo
         End If
         frmIndividualJoint.cmbCity = frmIndividualOthers.cmbCity
         frmIndividualJoint.txtOffPhoneCityCode = frmIndividualOthers.txtOffPhoneCityCode
         frmIndividualJoint.txtOffPhoneNo = frmIndividualOthers.txtOffPhoneNo
         frmIndividualJoint.txtOffPhoneExt = frmIndividualOthers.txtOffPhoneExt
         frmIndividualJoint.txtResPhoneCityCode = frmIndividualOthers.txtResPhoneCityCode
         frmIndividualJoint.txtResPhoneNo = frmIndividualOthers.txtResPhoneNo
         frmIndividualJoint.txtResPhoneExt = frmIndividualOthers.txtResPhoneExt
         frmIndividualJoint.txtFaxCityCode = frmIndividualOthers.txtFaxCityCode
         frmIndividualJoint.txtFaxNo = frmIndividualOthers.txtFaxNo
         frmIndividualJoint.txtFaxExt = frmIndividualOthers.txtFaxExt
         frmIndividualJoint.txtMobileNo = frmIndividualOthers.txtMobileNo
      End If
   End If
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      frmIndividualOthersAcctInfo.MousePointer = vbHourglass
      CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
      frmIndividualJoint.Hide
      doJointSearch "00000", frmIndividualOthers.txtCustomerNo, Space(2)
      'frmIndividualJoint.fetchNextJointInfo Space(2)
      frmIndividualOthersAcctInfo.MousePointer = vbDefault
      CSD_mdiForm.staticStatus.Panels(3).text = " "
      noOfJoint = recvJointSearchMsg.noOfRecs
      For i = 1 To Val(recvJointSearchMsg.noOfRecs)
          frmIndividualJoint.jointInfoGrid.Row = i
          frmIndividualJoint.jointInfoGrid.Col = 0
          frmIndividualJoint.jointInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualJoint.jointInfoGrid.text = recvJointSearchMsg.details(i).custNo
          frmIndividualJoint.jointInfoGrid.Col = 1
          frmIndividualJoint.jointInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualJoint.jointInfoGrid.text = recvJointSearchMsg.details(i).jointCustNo
          frmIndividualJoint.jointInfoGrid.Col = 2
          frmIndividualJoint.jointInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualJoint.jointInfoGrid.text = recvJointSearchMsg.details(i).custShortName
          frmIndividualJoint.jointInfoGrid.Col = 3
          frmIndividualJoint.jointInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualJoint.jointInfoGrid.text = recvJointSearchMsg.details(i).custBranchCode
          frmIndividualJoint.jointInfoGrid.Col = 4
          frmIndividualJoint.jointInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualJoint.jointInfoGrid.text = recvJointSearchMsg.details(i).idType & "-" & recvJointSearchMsg.details(i).idNo
'          frmIndividualJoint.jointInfoGrid.Col = 4
'          frmIndividualJoint.jointInfoGrid.CellAlignment = flexAlignLeftCenter
'          frmIndividualJoint.jointInfoGrid.Text = recvJointSearchMsg.details(i)
'          frmIndividualJoint.jointInfoGrid.Col = 4
'          frmIndividualJoint.jointInfoGrid.CellAlignment = flexAlignLeftCenter
'          frmIndividualJoint.jointInfoGrid.Text = recvJointSearchMsg.details(i)
'          frmIndividualJoint.jointInfoGrid.Col = 4
'          frmIndividualJoint.jointInfoGrid.CellAlignment = flexAlignLeftCenter
'          frmIndividualJoint.jointInfoGrid.Text = recvJointSearchMsg.details(i)
      Next i
      frmIndividualJoint.jointInfoGrid.Row = 1
   End If
    
   frmIndividualJoint.Show
End Sub

Private Sub cmdPrevPage_Click()
    Me.Hide
End Sub

Private Sub cmdPrintAppln_Click()
   If Len(RTrim(documentsSelected)) = 0 Then
      MsgBox errNoDocumentsSelected(UserLang)
      Exit Sub
   End If
    
   If validateFrmIndividualSaudiAcctInfo = 1 Then
      Exit Sub
   End If
   printIndividualApplnForm
End Sub

Private Sub cmdReject_Click()
    frmSupervisorRejection.Show vbModal
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim mQry As String
   
   If UserLang = ARABIC Then
      ChangePositions frmIndividualOthersAcctInfo, 11800
      frmIndividualOthersAcctInfo.RightToLeft = True
   End If
   
   lblMainCategoryDesc = mainCategoryDesc
   lblSubCategoryDesc = subCategoryDesc
   
   frmIndividualOthersAcctInfo.Caption = frmIndividualOthers3Caption(0, UserLang)
   lblIndividualOthers3.Caption = frmIndividualOthers3Caption(1, UserLang)
   lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)

   lblCurrentAccount.Caption = frmIndividualOthers3Caption(2, UserLang)
   optCurrentAcYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optCurrentAcNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblCurrentAcCurrency.Caption = frmIndividualOthers3Caption(3, UserLang)
   lblCurrentAcStatus.Caption = frmIndividualOthers3Caption(4, UserLang)
   lblCurrentAcStmtFreq.Caption = frmIndividualOthers3Caption(5, UserLang)
   lblCurrentAcCheckBook.Caption = frmIndividualOthers3Caption(6, UserLang)
   optCurrentAcCheckBookYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optCurrentAcCheckBookNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblSavingAcc.Caption = frmIndividualOthers3Caption(7, UserLang)
   optSavingAcYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optSavingAcNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblSavingAcCurrency.Caption = frmIndividualOthers3Caption(3, UserLang)
   lblSavingAcStatus.Caption = frmIndividualOthers3Caption(4, UserLang)
   lblSavingAcStmtFreq.Caption = frmIndividualOthers3Caption(5, UserLang)
   lblOtherAccount.Caption = frmIndividualOthers3Caption(8, UserLang)
   lblOtherAccurrency.Caption = frmIndividualOthers3Caption(3, UserLang)
   lblOtherAcStatus.Caption = frmIndividualOthers3Caption(4, UserLang)
   lblOtherAcStmtFreq.Caption = frmIndividualOthers3Caption(5, UserLang)
   lblOtherAccheckBook.Caption = frmIndividualOthers3Caption(6, UserLang)
   optOtherAcCheckBookYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optOtherAcCheckBookNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblSingleOrJointAcc.Caption = frmIndividualOthers3Caption(9, UserLang)
   OptSingle.Caption = frmIndividualOthers3Caption(10, UserLang)
   optJoint.Caption = frmIndividualOthers3Caption(11, UserLang)
   optUnidentified.Caption = frmIndividualOthers3Caption(32, UserLang)
   lblNatureOfSign.Caption = frmIndividualOthers3Caption(12, UserLang)
   optSignSingle.Caption = frmIndividualOthers3Caption(10, UserLang)
   optSignJoint.Caption = frmIndividualOthers3Caption(11, UserLang)
   lblPrimaryElectronIntlCard.Caption = frmIndividualOthers3Caption(13, UserLang)
   optPrimaryElectronIntlCardYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optPrimaryElectronIntlCardNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblPrimaryElectronIntlCardName.Caption = frmIndividualOthers3Caption(33, UserLang)
   lblSecondaryElectronIntlCard.Caption = frmIndividualOthers3Caption(14, UserLang)
   optSecondaryElectronIntlCardYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optSecondaryElectronIntlCardNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblSecondaryElectronIntlCardName.Caption = frmIndividualOthers3Caption(33, UserLang)
   lblCardDeliveredTo.Caption = frmIndividualOthers3Caption(15, UserLang)
   optCardDeliveredToBranch.Caption = frmIndividualOthers3Caption(16, UserLang)
   optCardDeliveredToReqBranch.Caption = frmIndividualOthers3Caption(17, UserLang)
   optCardDeliveredToPOBox.Caption = frmIndividualOthers3Caption(18, UserLang)
   lblDeliveryAddress1.Caption = frmIndividualOthers3Caption(19, UserLang)
   lblDeliveryAddress2.Caption = frmIndividualOthers3Caption(20, UserLang)
   lblDeliveryPOBox.Caption = frmIndividualOthers3Caption(21, UserLang)
   lblDeliveryCity.Caption = frmIndividualOthers3Caption(22, UserLang)
   lblDeliveryZipCode.Caption = frmIndividualOthers3Caption(23, UserLang)
   cmdPrevPage.Caption = frmIndividualOthers3Caption(24, UserLang)
   If tellerAction Then
      cmdCreate.Caption = frmIndividualOthers3Caption(30, UserLang)
   Else
      cmdCreate.Caption = frmIndividualOthers3Caption(25, UserLang)
   End If
   cmdApprove.Caption = frmIndividualOthers3Caption(28, UserLang)
   cmdReject.Caption = frmIndividualOthers3Caption(29, UserLang)
   cmdJointAcc.Caption = frmIndividualOthers3Caption(26, UserLang)
   cmdDoc.Caption = frmIndividualOthers3Caption(31, UserLang)
   cmdCancel.Caption = frmIndividualOthers3Caption(27, UserLang)
   lblCardType.Caption = frmIndividualOthers3Caption(34, UserLang)
   optIntlCard.Caption = frmIndividualOthers3Caption(35, UserLang)
   optChipCard.Caption = frmIndividualOthers3Caption(36, UserLang)
   cmdPrintAppln.Caption = frmIndividualOthers3Caption(37, UserLang)
   
   optCardDeliveredToGPS.Caption = gpsCardDeliveryAddressCaption(0, UserLang)
   lblGPSAddress1.Caption = gpsCardDeliveryAddressCaption(1, UserLang)
   lblGPSUnit.Caption = gpsCardDeliveryAddressCaption(2, UserLang)
   lblGPSZipCode.Caption = gpsCardDeliveryAddressCaption(3, UserLang)
   
   mQry = "select * from cityinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbDeliveryCity.Clear
       Do While Not rs.EOF
          cmbDeliveryCity.AddItem rs("englishname")
          rs.MoveNext
       Loop
       cmbDeliveryCity.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from currencyinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcCurrency.Clear
      cmbSavingAcCurrency.Clear
      cmbOtherAcCurrency.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbCurrentAcCurrency.AddItem rs("currencycode") & " - " & rs("arabicname")
            cmbSavingAcCurrency.AddItem rs("currencycode") & " - " & rs("arabicname")
            cmbOtherAcCurrency.AddItem rs("currencycode") & " - " & rs("arabicname")
         Else
            cmbCurrentAcCurrency.AddItem rs("currencycode") & " - " & rs("englishname")
            cmbSavingAcCurrency.AddItem rs("currencycode") & " - " & rs("englishname")
            cmbOtherAcCurrency.AddItem rs("currencycode") & " - " & rs("englishname")
         End If
         rs.MoveNext
      Loop
      cmbCurrentAcCurrency.ListIndex = 0
      cmbSavingAcCurrency.ListIndex = 0
      cmbOtherAcCurrency.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from accountstatusinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcStatus.Clear
      cmbSavingAcStatus.Clear
      cmbOtherAcStatus.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbCurrentAcStatus.AddItem rs("statuscode") & " - " & rs("englishname")
            cmbSavingAcStatus.AddItem rs("statuscode") & " - " & rs("englishname")
            cmbOtherAcStatus.AddItem rs("statuscode") & " - " & rs("englishname")
         Else
            cmbCurrentAcStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
            cmbSavingAcStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
            cmbOtherAcStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbCurrentAcStatus.ListIndex = 0
      cmbSavingAcStatus.ListIndex = 0
      cmbOtherAcStatus.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from statementfrequencyinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcStmtFreq.Clear
      cmbSavingAcStmtFreq.Clear
      cmbOtherAcStmtFreq.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbCurrentAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("englishname")
            cmbSavingAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("englishname")
            cmbOtherAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("englishname")
         Else
            cmbCurrentAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("arabicname")
            cmbSavingAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("arabicname")
            cmbOtherAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
     Loop
   End If
   If rs.recordCount > 3 Then
      cmbCurrentAcStmtFreq.ListIndex = 3
      cmbSavingAcStmtFreq.ListIndex = 3
      cmbOtherAcStmtFreq.ListIndex = 3
   End If
   
   Set rs = db.OpenRecordset("select * from bmledgerinfo where accCreationAllowed = '1'")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbOtherAccount.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbOtherAccount.AddItem rs("ledgercode") & "-" & rs("arabicname")
         Else
            cmbOtherAccount.AddItem rs("ledgercode") & "-" & rs("englishname")
         End If
         rs.MoveNext
      Loop
   End If
  
   If InStr(recvLoginMsg.authorityLevel, "~02") > 0 And _
      supervisorAction Then
      If recvOtherIndividualMsg.displayWarningMsgOnDuplicateId = "0" Then   ' Stop the process
         cmdApprove.Enabled = False
      Else
         cmdApprove.Enabled = True
      End If
      cmdReject.Enabled = True
      cmdCreate.Enabled = False
   Else
      cmdApprove.Enabled = False
      cmdReject.Enabled = False
   End If
   If InStr(recvLoginMsg.authorityLevel, "~01") <> 0 Then
      cmdCreate.Enabled = True
   Else
      cmdCreate.Enabled = False
   End If

   If custHistoryAction Then
      lblHistory.Visible = True
      lblHistory.Refresh
   Else
      lblHistory.Visible = False
   End If

   If supervisorAction Or searchAction Or custHistoryAction Then
      cmdCreate.Enabled = False
      frameAccountDetails.Enabled = False
      frameSingleJoint.Enabled = False
      frameCardDetails.Enabled = False
      If optJoint.Value = True Then
         cmdJointAcc.Enabled = True
      Else
         cmdJointAcc.Enabled = False
      End If
   Else
      frameSingleJoint.Enabled = True
      If phoneCustOpenAction Then
         frameAcSingleJoint.Enabled = False
      Else
         frameAcSingleJoint.Enabled = True
      End If
      If optJoint.Value = True Then
         cmdJointAcc.Enabled = True
      Else
         cmdJointAcc.Enabled = False
      End If
      If smartCardEnabled = True Then
         optChipCard.Enabled = True
      Else
         optChipCard.Enabled = False
         optIntlCard.Value = True
      End If
      If updateAction Then
         frameAccountDetails.Enabled = False
         frameCardDetails.Enabled = False
         frameAcSingleJoint.Enabled = False
      Else
         If tellerAction And _
            recvOtherIndividualMsg.newOrUpdate = "U" Then
            frameAccountDetails.Enabled = False
            frameCardDetails.Enabled = False
            frameAcSingleJoint.Enabled = False
         Else
            frameAccountDetails.Enabled = True
            mQry = "select checkbookallowed, atmcardallowed from categoryconfiginfo " & _
                   "where samamaincategory = '" & mainCategoryCode & "' " & _
                   "  and samasubcategory = '" & subCategoryCode & "'"
         
            Set rs = db.OpenRecordset(mQry)
            If rs.recordCount > 0 Then
               If rs(0) = "1" Then
                  optCurrentAcCheckBookYes.Enabled = True
                  optOtherAcCheckBookYes.Enabled = True
               Else
                  optCurrentAcCheckBookNo.Value = True
                  optCurrentAcCheckBookYes.Enabled = False
                  optOtherAcCheckBookNo.Value = True
                  optOtherAcCheckBookYes.Enabled = False
               End If
               If rs(1) = "1" And InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
                  frameCardDetails.Enabled = True
               Else
                  frameCardDetails.Enabled = False
               End If
            End If
         End If
         If tellerAction And recvOtherIndividualMsg.newOrUpdate = "N" Then
            'FrameCardDetails.Enabled = True
            FrameCardType.Enabled = False
            framePrimaryIntlCard.Enabled = False
            frameSuppIntlCard.Enabled = False
            If activityFlag = "P" Then
               cmdPrintAppln.Enabled = True
               cmdReject.Enabled = True
            Else
               cmdPrintAppln.Enabled = False
               cmdReject.Enabled = False
            End If
         End If
      End If
   End If
   
   Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmIndividualOthers.cmbBranchCode, 1, 4) & "'")

   If optCardDeliveredToBranch = True Then
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                             IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                             "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
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
   End If
   
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      fillFrmIndividualOthers3
   End If

End Sub

Public Sub formatIndividualOtherCustRequest()
    Dim mQry As String
    Dim tmpStr As String
     
    individualOthersInfo.msgLen = Space(6) ' to be calculated
    individualOthersInfo.service = "10"  ' 10 is for New customer creation
    'individualOthersInfo.userId = gUserId
    
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 0
       individualOthersInfo.userId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       individualOthersInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       individualOthersInfo.creationOrUpdate = "U"
       individualOthersInfo.supervisorComments = recvOtherIndividualMsg.supervisorComments
       individualOthersInfo.supervisorId = Left(recvOtherIndividualMsg.supervisorId, 10)
    Else
       individualOthersInfo.userId = gUserId
       individualOthersInfo.dateTime = gDateTime
       individualOthersInfo.creationOrUpdate = "C"
       individualOthersInfo.supervisorId = Space(10)
       individualOthersInfo.supervisorComments = Space(200)
    End If
    If updateAction Or _
       (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
       individualOthersInfo.NewOrUpdateFlag = "U"
    Else
       individualOthersInfo.NewOrUpdateFlag = "N"
    End If
    
    If phoneCustOpenAction Then
       individualOthersInfo.bmUpdateStatus = "4"  ' 4 for "Entered through phone"
       individualOthersInfo.custOpenSource = "P"  ' customer opened through phone
    Else
       individualOthersInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
       individualOthersInfo.custOpenSource = "B"  ' customer opened through Branch
       'If tellerAction And recvOtherIndividualMsg.custOpenSource = "P" Then
       If tellerAction And activityFlag = "P" Then
          individualOthersInfo.branchCSOId = gUserId
          individualOthersInfo.branchActionDateTime = branchActionDateTime
       Else
          individualOthersInfo.branchCSOId = Space(10)
          individualOthersInfo.branchActionDateTime = Space(14)
       End If
    End If
    individualOthersInfo.branchCode = gBranchCode
    individualOthersInfo.customerNo = frmIndividualOthers.txtCustomerNo
    individualOthersInfo.custBranchCode = Mid$(frmIndividualOthers.cmbBranchCode, 1, 4)
    If Len(RTrim(Mid$(frmIndividualOthers.cmbAltBrCode, 1, 4))) = 0 Then
       individualOthersInfo.altBranchCode = "0000"
    Else
       individualOthersInfo.altBranchCode = Mid$(frmIndividualOthers.cmbAltBrCode, 1, 4)
    End If
    individualOthersInfo.samaMainCategory = mainCategoryCode
    individualOthersInfo.samaSubCategory = subCategoryCode
    individualOthersInfo.screenSetNo = "2" ' for other individual
    individualOthersInfo.iqamaNo = frmIndividualOthers.txtIqamaNo
    'individualOthersInfo.idType = "Q"
    If frmIndividualOthers.optIqamaDateHijri Then
       individualOthersInfo.iqamaDateType = "0"
       individualOthersInfo.iqamaExpiryDateH = Format(frmIndividualOthers.txtIqamaExpiryYear, "0000") & Format(frmIndividualOthers.cmbIqamaExpiryMonth, "00") & Format(frmIndividualOthers.cmbIqamaExpiryDate, "00")
       individualOthersInfo.iqamaIssueDateH = Format(frmIndividualOthers.txtIqamaIssueYear, "0000") & Format(frmIndividualOthers.cmbIqamaIssueMonth.text, "00") & Format(frmIndividualOthers.cmbIqamaIssueDate, "00")
       individualOthersInfo.iqamaIssueDateG = Space(8)
       individualOthersInfo.iqamaExpiryDateG = Space(8)
    Else
       individualOthersInfo.iqamaDateType = "1"
       individualOthersInfo.iqamaExpiryDateG = Format(frmIndividualOthers.txtIqamaExpiryYear, "0000") & Format(frmIndividualOthers.cmbIqamaExpiryMonth, "00") & Format(frmIndividualOthers.cmbIqamaExpiryDate, "00")
       individualOthersInfo.iqamaIssueDateG = Format(frmIndividualOthers.txtIqamaIssueYear, "0000") & Format(frmIndividualOthers.cmbIqamaIssueMonth.text, "00") & Format(frmIndividualOthers.cmbIqamaIssueDate, "00")
       individualOthersInfo.iqamaIssueDateH = Space(8)
       individualOthersInfo.iqamaExpiryDateH = Space(8)
    End If
    individualOthersInfo.iqamaIssuedAt = frmIndividualOthers.cmbIqamaIssuedAt.text
    
    individualOthersInfo.ppNo = frmIndividualOthers.txtPPNumber
    If frmIndividualOthers.optPPDateHijri Then
       individualOthersInfo.ppDateType = "0"
       individualOthersInfo.ppExpiryDateH = Format(frmIndividualOthers.txtPPExpiryYear, "0000") & Format(frmIndividualOthers.cmbPPExpiryMonth, "00") & Format(frmIndividualOthers.cmbPPExpiryDate, "00")
       individualOthersInfo.ppIssueDateH = Format(frmIndividualOthers.txtPPIssueYear, "0000") & Format(frmIndividualOthers.cmbPPIssueMonth.text, "00") & Format(frmIndividualOthers.cmbPPIssueDate, "00")
       individualOthersInfo.ppIssueDateG = Space(8)
       individualOthersInfo.ppExpiryDateG = Space(8)
    Else
       individualOthersInfo.ppDateType = "1"
       individualOthersInfo.ppExpiryDateG = Format(frmIndividualOthers.txtPPExpiryYear, "0000") & Format(frmIndividualOthers.cmbPPExpiryMonth, "00") & Format(frmIndividualOthers.cmbPPExpiryDate, "00")
       individualOthersInfo.ppIssueDateG = Format(frmIndividualOthers.txtPPIssueYear, "0000") & Format(frmIndividualOthers.cmbPPIssueMonth.text, "00") & Format(frmIndividualOthers.cmbPPIssueDate, "00")
       individualOthersInfo.ppIssueDateH = Space(8)
       individualOthersInfo.ppExpiryDateH = Space(8)
    End If
    individualOthersInfo.ppIssuedAt = frmIndividualOthers.cmbPPIssuedAt.text
    
    individualOthersInfo.visaNo = frmIndividualOthers.txtVisaNo
    If frmIndividualOthers.optVisaDateHijri Then
       individualOthersInfo.visaDateType = "0"
       individualOthersInfo.visaExpiryDateH = Format(frmIndividualOthers.txtVisaExpiryYear, "0000") & Format(frmIndividualOthers.cmbVisaExpiryMonth, "00") & Format(frmIndividualOthers.cmbVisaExpiryDate, "00")
       individualOthersInfo.visaIssueDateH = Format(frmIndividualOthers.txtVisaIssueYear, "0000") & Format(frmIndividualOthers.cmbVisaIssueMonth.text, "00") & Format(frmIndividualOthers.cmbVisaIssueDate, "00")
       individualOthersInfo.visaIssueDateG = Space(8)
       individualOthersInfo.visaExpiryDateG = Space(8)
    Else
       individualOthersInfo.visaDateType = "1"
       individualOthersInfo.visaExpiryDateG = Format(frmIndividualOthers.txtVisaExpiryYear, "0000") & Format(frmIndividualOthers.cmbVisaExpiryMonth, "00") & Format(frmIndividualOthers.cmbVisaExpiryDate, "00")
       individualOthersInfo.visaIssueDateG = Format(frmIndividualOthers.txtVisaIssueYear, "0000") & Format(frmIndividualOthers.cmbVisaIssueMonth.text, "00") & Format(frmIndividualOthers.cmbVisaIssueDate, "00")
       individualOthersInfo.visaIssueDateH = Space(8)
       individualOthersInfo.visaExpiryDateH = Space(8)
    End If
    individualOthersInfo.visaIssuedAt = frmIndividualOthers.cmbVisaIssuedAt.text
    
    If frmIndividualOthers.optLangArabic Then
       individualOthersInfo.langPref = "0"
    Else
       individualOthersInfo.langPref = "1"
    End If
    individualOthersInfo.nationality = Left$(frmIndividualOthers.cmbNationality, 3)
    individualOthersInfo.titleCode = Left$(frmIndividualOthers.cmbTitle.text, 2)
    individualOthersInfo.aFirstName = frmIndividualOthers.txtArabFirstName
    individualOthersInfo.a2ndName = frmIndividualOthers.txtArabic2ndName
    individualOthersInfo.a3rdName = frmIndividualOthers.txtArabic3rdName
    individualOthersInfo.aLastName = frmIndividualOthers.txtArabLastName
    individualOthersInfo.aShortName = frmIndividualOthers.txtArabShortName
    individualOthersInfo.eFirstName = frmIndividualOthers.txtEngFirstName
    individualOthersInfo.e2ndName = frmIndividualOthers.txtEnglish2ndName
    individualOthersInfo.e3rdName = frmIndividualOthers.txtEnglish3rdName
    individualOthersInfo.eLastName = frmIndividualOthers.txtEngLastName
    individualOthersInfo.eShortName = frmIndividualOthers.txtEngShortName
    If frmIndividualOthers.optDOBGreg Then
       individualOthersInfo.dobDateG = Format(frmIndividualOthers.txtDobYear, "0000") & Format(frmIndividualOthers.cmbDobMonth, "00") & Format(frmIndividualOthers.cmbDobDate, "00")
       individualOthersInfo.dobDateType = "1"
       individualOthersInfo.dobDateH = Space(8)
    Else
       individualOthersInfo.dobDateH = Format(frmIndividualOthers.txtDobYear, "0000") & Format(frmIndividualOthers.cmbDobMonth, "00") & Format(frmIndividualOthers.cmbDobDate, "00")
       individualOthersInfo.dobDateType = "0"
       individualOthersInfo.dobDateG = Space(8)
    End If
    If frmIndividualOthers.optGenderMale Then
       individualOthersInfo.sexCode = "0"
    Else
       individualOthersInfo.sexCode = "1"
    End If
    If frmIndividualOthers.optVipYes Then
        individualOthersInfo.vipCode = "1"
    Else
        individualOthersInfo.vipCode = "0"
    End If
    If frmIndividualOthers.optMarried Then
       individualOthersInfo.maritalStatus = "0"    ' Married
    ElseIf frmIndividualOthers.OptSingle Then
       individualOthersInfo.maritalStatus = "1"    ' Single
    Else
       individualOthersInfo.maritalStatus = "2"    ' Others
    End If
    individualOthersInfo.noOfDependents = frmIndividualOthers.txtDependents
    If frmIndividualOthers.optResident Then
       individualOthersInfo.residentStatus = "0"
    Else
       individualOthersInfo.residentStatus = "1"
    End If
    individualOthersInfo.businessType = Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3)
    If frmIndividualOthers.optSaudiPost = True Then
       individualOthersInfo.addressType = "1"
       'individualOthersInfo.address1 = Format(frmIndividualOthers.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
       '                                frmIndividualOthers.txtSaudiPostStreetName
       individualOthersInfo.address1 = Format(frmIndividualOthers.txtSaudiPostGPSNo, "!@@@@@") & " " & _
                                       frmIndividualOthers.txtSaudiPostStreetName
       individualOthersInfo.poBox = frmIndividualOthers.txtSaudiPostUnit
       individualOthersInfo.zipCode = Format(frmIndividualOthers.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                                      frmIndividualOthers.txtSaudiPostAdditionalNo
       individualOthersInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       individualOthersInfo.addressType = "0"
       individualOthersInfo.address1 = frmIndividualOthers.txtAddress1
       individualOthersInfo.address2 = frmIndividualOthers.txtAddress2
       individualOthersInfo.poBox = frmIndividualOthers.txtPOBox
       individualOthersInfo.zipCode = frmIndividualOthers.txtPinCode
       individualOthersInfo.country = Left$(frmIndividualOthers.cmbCountry.text, 3)
    End If
    If UserLang = ENGLISH And _
       individualOthersInfo.langPref = "0" Then ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                             frmIndividualOthers.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          individualOthersInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          individualOthersInfo.cityName = frmIndividualOthers.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       individualOthersInfo.langPref = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmIndividualOthers.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          individualOthersInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          individualOthersInfo.cityName = frmIndividualOthers.cmbCity.text
       End If
    Else
        individualOthersInfo.cityName = frmIndividualOthers.cmbCity.text
    End If
    
    individualOthersInfo.telOffAreaCode = frmIndividualOthers.txtOffPhoneCityCode
    individualOthersInfo.telOffNo = frmIndividualOthers.txtOffPhoneNo
    individualOthersInfo.telOffExt = frmIndividualOthers.txtOffPhoneExt
    individualOthersInfo.telHomeAreaCode = frmIndividualOthers.txtResPhoneCityCode
    individualOthersInfo.telHomeNo = frmIndividualOthers.txtResPhoneNo
    individualOthersInfo.telHomeExt = frmIndividualOthers.txtResPhoneExt
    individualOthersInfo.faxAreaCode = frmIndividualOthers.txtFaxCityCode
    individualOthersInfo.faxNo = frmIndividualOthers.txtFaxNo
    individualOthersInfo.faxExt = frmIndividualOthers.txtFaxExt
    If Len(RTrim(frmIndividualOthers.txtMobileNo)) <> 0 Then
       individualOthersInfo.mobileNo = frmIndividualOthers.txtMobileAreaCode & frmIndividualOthers.txtMobileNo
    Else
       individualOthersInfo.mobileNo = Space(10)
    End If
    individualOthersInfo.pagerNo = frmIndividualOthers.txtPagerNo
    individualOthersInfo.eMail = frmIndividualOthers.txtEmailAddress
    
    individualOthersInfo.educationCode = Mid$(frmIndividualOthers2.cmbEducation.text, 3, 2)
    individualOthersInfo.professionCode = Mid$(frmIndividualOthers2.cmbProfession.text, 3, 2)
    individualOthersInfo.positionCode = Mid$(frmIndividualOthers2.cmbPosition.text, 3, 2)
    individualOthersInfo.monthlyIncome = Mid$(frmIndividualOthers2.cmbMonthlyIncome.text, 3, 2)
    individualOthersInfo.segmentation = Mid$(frmIndividualOthers2.cmbSegmentation, 1, 1)
    individualOthersInfo.ownerShip = "0000000000"
    If frmIndividualOthers2.chkRentedHouse.Value = 1 Then
       Mid$(individualOthersInfo.ownerShip, 1, 1) = "1"
    End If
    If frmIndividualOthers2.chkOwnHouse.Value = 1 Then
       Mid$(individualOthersInfo.ownerShip, 2, 1) = "1"
    End If
    If frmIndividualOthers2.chkCompanyAcc.Value = 1 Then
       Mid$(individualOthersInfo.ownerShip, 3, 1) = "1"
    End If
    If frmIndividualOthers2.chkRentedCar.Value = 1 Then
       Mid$(individualOthersInfo.ownerShip, 4, 1) = "1"
    End If
    If frmIndividualOthers2.chkOwnCar.Value = 1 Then
       Mid$(individualOthersInfo.ownerShip, 5, 1) = "1"
    End If
    If frmIndividualOthers2.chkCompanyTransport.Value = 1 Then
       Mid$(individualOthersInfo.ownerShip, 6, 1) = "1"
    End If
     
    individualOthersInfo.employerName = frmIndividualOthers2.txtEmployerName
    individualOthersInfo.department = frmIndividualOthers2.txtDepartment
    individualOthersInfo.employerPoBox = frmIndividualOthers2.txtEmployerPOBox
    individualOthersInfo.employerCity = frmIndividualOthers2.txtEmployerCity
    individualOthersInfo.employerZipCode = frmIndividualOthers2.txtEmployerZipcode
    
    individualOthersInfo.documents = Format(documentsSelected, "!" & String(60, "@"))
    individualOthersInfo.documentOther = Format(otherDocumentsEntered, "!" & String(50, "@"))

    individualOthersInfo.packagedAcc = Mid$(frmIndividualOthers2.cmbPackageAcc.text, 1, 1)
    If Len(RTrim(individualOthersInfo.packagedAcc)) = 0 Then
       individualOthersInfo.packagedAcc = "0"
    End If
    
    individualOthersInfo.internetBankAcc = "0"
    
'    If frmIndividualOthers2.optInternetYes Then
'       individualOthersInfo.internetBankAcc = "1"
'    Else
'       individualOthersInfo.internetBankAcc = "0"
'    End If
    
    If frmIndividualOthers2.optAtmFeeYes Then
       individualOthersInfo.excludeFromAtmFees = "1"
    Else
       individualOthersInfo.excludeFromAtmFees = "0"
    End If
    
    If frmIndividualOthers2.optMinBalFeeYes Then
       individualOthersInfo.excludeFromMinBalFees = "1"
    Else
       individualOthersInfo.excludeFromMinBalFees = "0"
    End If
    
    If frmIndividualOthers2.optCustAdviceYes Then
       individualOthersInfo.custAdviceFlag = "1"
    Else
       individualOthersInfo.custAdviceFlag = "0"
    End If
    
    individualOthersInfo.accFreezingGracePeriod = Format(frmIndividualOthers2.txtFreezingGracePeriod, "000")
    
    '--Approval document reference number--
    
    If Len(RTrim(frmIndividualOthers2.txtApproverNo)) <> 0 Then
        individualOthersInfo.appRefNo = frmIndividualOthers2.txtApproverNo
    Else
        individualOthersInfo.appRefNo = Space(15)
    End If
    
    If frmIndividualOthers2.optAppDateHijri Then
       individualOthersInfo.appDateType = "0"
       individualOthersInfo.appExpiryDateH = Format(frmIndividualOthers2.txtAppExpiryYear, "0000") & Format(frmIndividualOthers2.cmbAppExpiryMonth, "00") & Format(frmIndividualOthers2.cmbAppExpiryDate, "00")
       individualOthersInfo.appIssueDateH = Format(frmIndividualOthers2.txtAppIssueYear, "0000") & Format(frmIndividualOthers2.cmbAppIssueMonth.text, "00") & Format(frmIndividualOthers2.cmbAppIssueDate, "00")
       individualOthersInfo.appIssueDateG = Space(8)
       individualOthersInfo.appExpiryDateG = Space(8)
    Else
       individualOthersInfo.appDateType = "1"
       individualOthersInfo.appExpiryDateG = Format(frmIndividualOthers2.txtAppExpiryYear, "0000") & Format(frmIndividualOthers2.cmbAppExpiryMonth, "00") & Format(frmIndividualOthers2.cmbAppExpiryDate, "00")
       individualOthersInfo.appIssueDateG = Format(frmIndividualOthers2.txtAppIssueYear, "0000") & Format(frmIndividualOthers2.cmbAppIssueMonth.text, "00") & Format(frmIndividualOthers2.cmbAppIssueDate, "00")
       individualOthersInfo.appIssueDateH = Space(8)
       individualOthersInfo.appExpiryDateH = Space(8)
    End If
    individualOthersInfo.appRefName = frmIndividualOthers2.txtApproverName

    
    If frmIndividualOthersAcctInfo.OptSingle Then
       individualOthersInfo.singleJointAcc = "0" 'single
    ElseIf frmIndividualOthersAcctInfo.optJoint Then
       individualOthersInfo.singleJointAcc = "1" 'joint
    Else
       individualOthersInfo.singleJointAcc = "2" 'unindentified
    End If
    
    If frmIndividualOthersAcctInfo.optSignSingle Then
       individualOthersInfo.signatureNature = "0"
    Else
       individualOthersInfo.signatureNature = "1"
    End If
    If tellerAction And activityFlag <> "P" Then
       individualOthersInfo.noOfJointAcc = recvOtherIndividualMsg.noOfJointAcc
    Else
       individualOthersInfo.noOfJointAcc = Format(noOfJoint, "00")
    End If
    individualOthersInfo.jointAccNameOnCheck = Format(frmJointAccName.txtJointAccNameOnCheck, "!" & String(30, "@")) & Format(frmJointAccName.txtJointAccNameOnCheck1, "!" & String(30, "@"))
    individualOthersInfo.jointAccNameOnReports = Format(frmJointAccName.txtJointAccNameOnReports, "!" & String(30, "@"))
    
    If frmIndividualOthersAcctInfo.optChipCard = True Then
       individualOthersInfo.cardType = "S"
    Else
       individualOthersInfo.cardType = "I"
    End If
    If frmIndividualOthersAcctInfo.optPrimaryElectronIntlCardYes Then
       individualOthersInfo.electronIntlRequired = "1"
    Else
       individualOthersInfo.electronIntlRequired = "0"
    End If
    individualOthersInfo.electronIntlName = frmIndividualOthersAcctInfo.txtPrimaryElectronIntlCardName
    If frmIndividualOthersAcctInfo.optSecondaryElectronIntlCardYes Then
       individualOthersInfo.electronIntlSuppRequired = "1"
    Else
       individualOthersInfo.electronIntlSuppRequired = "0"
    End If
    individualOthersInfo.electronIntlSuppName = frmIndividualOthersAcctInfo.txtSecondaryElectronIntlCardName
    If frmIndividualOthersAcctInfo.optCardDeliveredToBranch Then
       individualOthersInfo.deliveryToBranchOrPO = "C"
    ElseIf frmIndividualOthersAcctInfo.optCardDeliveredToReqBranch Then
       individualOthersInfo.deliveryToBranchOrPO = "R"
    ElseIf frmIndividualOthersAcctInfo.optCardDeliveredToPOBox Then
       individualOthersInfo.deliveryToBranchOrPO = "P"
    Else ' GPS
       individualOthersInfo.deliveryToBranchOrPO = "G"
    End If
    If individualOthersInfo.NewOrUpdateFlag = "N" Then
       individualOthersInfo.updateCardAddressReqd = "0"
    End If
    If individualOthersInfo.updateCardAddressReqd <> "1" Then
       If frmIndividualOthersAcctInfo.optCurrentAcYes.Value Then
          individualOthersInfo.deliveryAddress2 = frmIndividualOthersAcctInfo.txtDeliveryAddr2
       Else
          individualOthersInfo.deliveryAddress2 = Space(30)
       End If
       individualOthersInfo.deliveryCity = frmIndividualOthersAcctInfo.cmbDeliveryCity.text
       If frmIndividualOthersAcctInfo.optCardDeliveredToGPS = False Then
          individualOthersInfo.deliveryAddress1 = frmIndividualOthersAcctInfo.txtDeliveryAddr1
          individualOthersInfo.deliveryPoBox = frmIndividualOthersAcctInfo.txtDeliveryPOBox
          individualOthersInfo.deliveryZip = frmIndividualOthersAcctInfo.txtDeliveryZipcode
       Else ' GPS address is selected
'          individualOthersInfo.deliveryAddress1 = Format(frmIndividualOthersAcctInfo.txtGPSNo, "!@@@@@") & "-" & _
'                                                  frmIndividualOthersAcctInfo.txtGPSStreetName
          individualOthersInfo.deliveryAddress1 = Format(frmIndividualOthersAcctInfo.txtGPSNo, "!@@@@@") & " " & _
                                                  frmIndividualOthersAcctInfo.txtGPSStreetName
          individualOthersInfo.deliveryPoBox = frmIndividualOthersAcctInfo.txtGPSUnit
          individualOthersInfo.deliveryZip = Format(frmIndividualOthersAcctInfo.txtGPSZipCode, "!@@@@@") & "-" & _
                                             frmIndividualOthersAcctInfo.txtGPSAdditionalNo
       End If
    End If
    If frmIndividualOthers2.optSamaUpdYes = True Then
       individualOthersInfo.updatedForSama = "1"
    Else
       individualOthersInfo.updatedForSama = "0"
    End If
    If Len(RTrim(frmIndividualOthers2.txtRelationshipManager)) = 0 Then
       individualOthersInfo.relationshipManager = Space(25)
    Else
       individualOthersInfo.relationshipManager = frmIndividualOthers2.txtRelationshipManager
    End If
    If Len(RTrim(frmIndividualOthers2.txtGeneralMemo)) = 0 Then
       individualOthersInfo.generalMemo = Space(25)
    Else
       individualOthersInfo.generalMemo = frmIndividualOthers2.txtGeneralMemo
    End If
    
    individualOthersInfo.homeCountryId = frmIndividualOthers2.txtHomeCountryId
          
    If frmIndividualOthers2.optHomeCountryIdDateHijri Then
       individualOthersInfo.homeCountryIdDateType = "0"
       individualOthersInfo.homeCountryIdExpiryDateH = Format(frmIndividualOthers2.txtHomeExpiryYear, "0000") & Format(frmIndividualOthers2.cmbHomeExpiryMonth, "00") & Format(frmIndividualOthers2.cmbHomeExpiryDate, "00")
       individualOthersInfo.homeCountryIdIssueDateH = Format(frmIndividualOthers2.txtHomeIssueYear, "0000") & Format(frmIndividualOthers2.cmbHomeIssueMonth.text, "00") & Format(frmIndividualOthers2.cmbHomeIssueDate, "00")
       individualOthersInfo.homeCountryIdIssueDateG = Space(8)
       individualOthersInfo.homeCountryIdExpiryDateG = Space(8)
    Else
       individualOthersInfo.homeCountryIdDateType = "1"
       individualOthersInfo.homeCountryIdExpiryDateG = Format(frmIndividualOthers2.txtHomeExpiryYear, "0000") & Format(frmIndividualOthers2.cmbHomeExpiryMonth, "00") & Format(frmIndividualOthers2.cmbHomeExpiryDate, "00")
       individualOthersInfo.homeCountryIdIssueDateG = Format(frmIndividualOthers2.txtHomeIssueYear, "0000") & Format(frmIndividualOthers2.cmbHomeIssueMonth.text, "00") & Format(frmIndividualOthers2.cmbHomeIssueDate, "00")
       individualOthersInfo.homeCountryIdIssueDateH = Space(8)
       individualOthersInfo.homeCountryIdExpiryDateH = Space(8)
    End If
        
    individualOthersInfo.homeAddress1 = frmIndividualOthers2.txtHomeAddress1
    individualOthersInfo.homeAddress2 = frmIndividualOthers2.txtHomeAddress2
    individualOthersInfo.homePoBox = frmIndividualOthers2.txtHomePoBox
    
    If UserLang = ENGLISH And _
       individualOthersInfo.langPref = "0" Then ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                             frmIndividualOthers2.cmbHomeCityName.text & "'")
       If rs.recordCount > 0 Then
          individualOthersInfo.homeCityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          individualOthersInfo.homeCityName = frmIndividualOthers2.cmbHomeCityName.text
       End If
    ElseIf UserLang = ARABIC And _
       individualOthersInfo.langPref = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmIndividualOthers2.cmbHomeCityName.text & "'")
       If rs.recordCount > 0 Then
          individualOthersInfo.homeCityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          individualOthersInfo.homeCityName = frmIndividualOthers2.cmbHomeCityName.text
       End If
    Else
        individualOthersInfo.homeCityName = frmIndividualOthers2.cmbHomeCityName.text
    End If
    individualOthersInfo.homeZipCode = frmIndividualOthers2.txtHomeZipCode
    individualOthersInfo.homeCountry = Left$(frmIndividualOthers2.cmbHomeCountry.text, 3)
    individualOthersInfo.homeTelOffAreaCode = frmIndividualOthers2.txtHomeOffPhoneAreaCode
    individualOthersInfo.homeTelOffNo = frmIndividualOthers2.txtHomeOffPhoneNo
    individualOthersInfo.homeTelOffExt = frmIndividualOthers2.txtHomePhoneResExt
    individualOthersInfo.homeTelHomeAreaCode = frmIndividualOthers2.txtHomePhoneResAreaCode
    individualOthersInfo.homeTelHomeNo = frmIndividualOthers2.txtHomeResPhoneNo
    individualOthersInfo.homeTelHomeExt = frmIndividualOthers2.txtHomePhoneResExt
    individualOthersInfo.homeFaxAreaCode = frmIndividualOthers2.txtHomeFaxAreaCode
    individualOthersInfo.homeFaxNo = frmIndividualOthers2.txtHomeFaxNo
    individualOthersInfo.homeFaxExt = frmIndividualOthers2.txtHomeFaxExt
    If Len(RTrim(frmIndividualOthers2.txtHomeMobileNo)) <> 0 Then
       individualOthersInfo.homeMobileNo = frmIndividualOthers2.txtHomeMobileCode & frmIndividualOthers2.txtHomeMobileNo
    Else
       individualOthersInfo.homeMobileNo = Space(10)
    End If
    individualOthersInfo.homePagerNo = frmIndividualOthers2.txtHomePagerNo
    individualOthersInfo.homeEmail = frmIndividualOthers2.txtHomeEmailAddress
    
    individualOthersInfo.interGroupAccNo = frmIndividualOthers2.txtInterGroupNo
    individualOthersInfo.specialRefNo = frmIndividualOthers2.txtSpecialRefNo
    individualOthersInfo.samaAuthNo = frmIndividualOthers2.txtSamaApprovalNo
    If frmIndividualOthers2.optSamaDateHijri Then
       individualOthersInfo.samaAuthDateType = "0"
       individualOthersInfo.samaAuthDateH = Format(frmIndividualOthers2.txtSamaApproveYear, "0000") & Format(frmIndividualOthers2.cmbSamaApproveMonth, "00") & Format(frmIndividualOthers2.cmbSamaApproveDate, "00")
       individualOthersInfo.samaAuthDateG = Space(8)
    Else
       individualOthersInfo.samaAuthDateType = "1"
       individualOthersInfo.samaAuthDateG = Format(frmIndividualOthers2.txtSamaApproveYear, "0000") & Format(frmIndividualOthers2.cmbSamaApproveMonth, "00") & Format(frmIndividualOthers2.cmbSamaApproveDate, "00")
       individualOthersInfo.samaAuthDateH = Space(8)
    End If
    If Len(RTrim(frmIndividualOthers2.txtMarketingMemo)) = 0 Then
       individualOthersInfo.marketingMemo = Space(25)
    Else
       individualOthersInfo.marketingMemo = Format(frmIndividualOthers2.txtMarketingMemo, "!" & String(25, "@"))
    End If
    If activityFlag = "P" Then
       individualOthersInfo.activityFlag = "P"
    Else
       individualOthersInfo.activityFlag = Space(1)
    End If
    If frmIndividualOthers2.optSegmentStmtOverrideYes = True Then
       individualOthersInfo.pkgStmtFreqOverride = "1"
    Else
       individualOthersInfo.pkgStmtFreqOverride = "1"
    End If
    
    If frmIndividualOthers.optPlastic = True Then
       individualOthersInfo.iqamaType = "1"
    Else
       individualOthersInfo.iqamaType = "0"
    End If
        
End Sub

Public Sub formatOtherCurrentAcc(droppedFlag As String, creationOrUpdate As String)

currentAccInfo = "008" & Left$(cmbCurrentAcCurrency.text, 2) & _
                      Left$(cmbCurrentAcStatus.text, 2) & _
                      Left$(cmbCurrentAcStmtFreq.text, 2) & _
                      IIf(optCurrentAcCheckBookYes, "1", "0") & droppedFlag & _
                      creationOrUpdate

End Sub
Public Sub formatOtherSavingAcc(droppedFlag As String, creationOrUpdate As String)

savingAccInfo = "009" & Left$(cmbSavingAcCurrency.text, 2) & _
                      Left$(cmbSavingAcStatus.text, 2) & _
                      Left$(cmbSavingAcStmtFreq.text, 2) & _
                      " " & droppedFlag & creationOrUpdate

End Sub
Public Sub formatOtherOtherAcc(droppedFlag As String, creationOrUpdate As String)
   Dim otherAcc As String

If droppedFlag = "1" Then
   otherAcc = Mid$(recvOtherIndividualMsg.otherAccInfo, 3, 3)
Else
   otherAcc = Left$(cmbOtherAccount.text, 3)
End If
   
otherAccInfo = otherAcc & Left$(cmbOtherAcCurrency.text, 2) & _
               Left$(cmbOtherAcStatus.text, 2) & _
               Left$(cmbOtherAcStmtFreq.text, 2) & _
               IIf(Left$(cmbOtherAccount.text, 3) = "160", _
               IIf(optOtherAcCheckBookYes, "1", "0"), Space(1)) & _
               droppedFlag & creationOrUpdate
End Sub
Public Sub unloadOtherIndividualForms()
   Dim tCustNo As String
   frmIndividualOthersAcctInfo.MousePointer = vbDefault
   frmIndividualOthersAcctInfo.cmdCreate.Enabled = True
   If frmIndividualOthersAcctInfo.optJoint = True Then
      frmIndividualOthersAcctInfo.cmdJointAcc.Enabled = True
   End If
   frmIndividualOthersAcctInfo.cmdCancel.Enabled = True
   frmIndividualOthersAcctInfo.cmdPrevPage.Enabled = True
   Unload Me
   Unload frmIndividualJoint
   Unload frmIndividualSaudi2
   Unload frmIndividualOthers2
   Unload frmIndividualOthers
   Unload frmCardAddress
   If tellerAction = True Then
      If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
         tCustNo = Space(7)
      Else
         tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
      End If
      Unload frmSupervisorApproval
      frmEnquiry.readPendingList "00000", activityFlag, tCustNo
      If UserLang = ARABIC Then
         ChangePositions frmSupervisorApproval, 11800
         frmSupervisorApproval.RightToLeft = True
         frmSupervisorApproval.Hide
      End If
      frmSupervisorApproval.Show
   Else
      Unload frmEnquirySelect
   End If
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameAccountDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameCardDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameSingleJoint_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optCardDeliveredToBranch_Click()
   Dim tCode As String
   
   poBoxEnableControls
   
   txtDeliveryAddr1.Enabled = False
   txtDeliveryPOBox.Enabled = False
   cmbDeliveryCity.Enabled = False
   txtDeliveryZipcode.Enabled = False
   
   If Not updateAction And Not supervisorAction And _
          optCardDeliveredToBranch.Value = True Then
      frameCardDetails.Enabled = True
      
      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmIndividualOthers.cmbBranchCode, 1, 4) & "'")
   
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
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
   End If
End Sub

Private Sub optCardDeliveredToGPS_Click()
'   If frmIndividualOthers.optPoBox = True Then
'      MsgBox "GPS Address cannot be selected;POBOX is selected"
'      optCardDeliveredToPOBox.Value = True
'      Exit Sub
'   End If
   GPSEnableControls
   
   txtGPSNo.Enabled = True
   txtGPSStreetName.Enabled = True
   cmbDeliveryCity.Enabled = True
   txtGPSUnit.Enabled = True
   txtGPSZipCode.Enabled = True
   txtGPSAdditionalNo.Enabled = True
   txtDeliveryAddr2 = "   " & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
   If frmIndividualOthers.optSaudiPost = True Then
      txtGPSNo = frmIndividualOthers.txtSaudiPostGPSNo
      txtGPSUnit = frmIndividualOthers.txtSaudiPostUnit
      txtGPSZipCode = frmIndividualOthers.txtSaudiPostZipCode
      txtGPSAdditionalNo = frmIndividualOthers.txtSaudiPostAdditionalNo
      txtGPSStreetName = frmIndividualOthers.txtSaudiPostStreetName
   Else
      txtGPSNo = ""
      txtGPSUnit = ""
      txtGPSZipCode = ""
      txtGPSAdditionalNo = ""
      txtGPSStreetName = ""
   End If
   cmbDeliveryCity.text = frmIndividualOthers.cmbCity.text

End Sub

Private Sub optCardDeliveredToPOBox_Click()
   
   poBoxEnableControls
     
   txtDeliveryAddr1.Enabled = True
   txtDeliveryPOBox.Enabled = True
   cmbDeliveryCity.Enabled = True
   txtDeliveryZipcode.Enabled = True
   txtDeliveryAddr2 = "   " & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
   If frmIndividualOthers.optPoBox = True Then
      txtDeliveryPOBox = frmIndividualOthers.txtPOBox
      txtDeliveryZipcode = frmIndividualOthers.txtPinCode
      txtDeliveryAddr1 = frmIndividualOthers.txtAddress1
   Else
      txtDeliveryPOBox = ""
      txtDeliveryZipcode = ""
      txtDeliveryAddr1 = ""
   End If
   cmbDeliveryCity.text = frmIndividualOthers.cmbCity.text

   'If frmIndividualOthers.optLangEnglish.Value = True Then
      'txtDeliveryAddr1 = frmIndividualOthers.txtAddress1
'      If arabicCharFound(frmIndividualOthers.cmbCity) Then
'         Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
'                             frmIndividualOthers.cmbCity.text & "'")
'         If rs.recordCount > 0 Then
'            cmbDeliveryCity.text = rs(0)
'         Else
'            cmbDeliveryCity.text = " "
'         End If
'      Else
      'cmbDeliveryCity.text = frmIndividualOthers.cmbCity.text
    '  End If
'   Else
'      txtDeliveryAddr1 = " "
'      cmbDeliveryCity.text = " "
'   End If

End Sub

Private Sub optCardDeliveredToReqBranch_Click()
    Dim tCode As String
    
    poBoxEnableControls
   
   txtDeliveryAddr1.Enabled = False
   txtDeliveryPOBox.Enabled = False
   cmbDeliveryCity.Enabled = False
   txtDeliveryZipcode.Enabled = False
   
   If Not updateAction And Not supervisorAction And _
          optCardDeliveredToReqBranch.Value = True Then
      frameCardDetails.Enabled = True
      
      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & gBranchCode & "'")
   
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(gBranchCode, 2, 3)
         txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "   ", rs(2))
         txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "   ", rs(3))
      
         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                       " where citycode = '" & tCode & "'")
                        
         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         Else
            cmbDeliveryCity.text = "  "
         End If
       End If
   End If

End Sub

Private Sub optCurrentAcNo_Click()
   If optSavingAcNo = True Then
      optPrimaryElectronIntlCardNo.Value = True
      txtPrimaryElectronIntlCardName = ""
      optSecondaryElectronIntlCardNo.Value = True
      txtSecondaryElectronIntlCardName = ""
      txtDeliveryAddr1 = ""
      txtDeliveryAddr2 = ""
      txtDeliveryPOBox = ""
      txtDeliveryZipcode = ""
      frameCardDetails.Enabled = False
   End If
End Sub

Private Sub optCurrentAcYes_Click()
   Dim tCode As String
   
   If Not updateAction And Not supervisorAction And _
          optCardDeliveredToBranch.Value = True Then
      If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
         frameCardDetails.Enabled = True
      End If

      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmIndividualOthers.cmbBranchCode, 1, 4) & "'")


      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
         txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "   ", rs(2))
         txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "   ", rs(3))

         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                       " where citycode = '" & tCode & "'")

         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         Else
            cmbDeliveryCity.text = "  "
         End If
       End If
   End If

End Sub

Private Sub optJoint_Click()
  If optJoint.Value = True Then
     cmdJointAcc.Enabled = True
  End If
End Sub

Private Sub optPrimaryElectronIntlCardNo_Click()
   txtPrimaryElectronIntlCardName = ""
   If optSecondaryElectronIntlCardYes.Value = True Then
      optSecondaryElectronIntlCardNo.Value = True
      txtSecondaryElectronIntlCardName = ""
  End If
End Sub

Private Sub optPrimaryElectronIntlCardYes_Click()
   txtPrimaryElectronIntlCardName = UCase(frmIndividualOthers.txtEngFirstName & " " & frmIndividualOthers.txtEnglish2ndName & " " & frmIndividualOthers.txtEngLastName)
   If Len(txtPrimaryElectronIntlCardName) > 26 Then
      txtPrimaryElectronIntlCardName = UCase(frmIndividualOthers.txtEngFirstName)
   End If

End Sub

Private Sub optSavingAcNo_Click()
   If optCurrentAcNo = True Then
      optPrimaryElectronIntlCardNo.Value = True
      txtPrimaryElectronIntlCardName = ""
      optSecondaryElectronIntlCardNo.Value = True
      txtSecondaryElectronIntlCardName = ""
      txtDeliveryAddr1 = ""
      txtDeliveryAddr2 = ""
      txtDeliveryPOBox = ""
      txtDeliveryZipcode = ""
      frameCardDetails.Enabled = False
   End If
End Sub

Private Sub optSavingAcYes_Click()
   Dim tCode As String
   
   If Not updateAction And Not supervisorAction And Not searchAction And Not custHistoryAction And _
          optCardDeliveredToBranch.Value = True Then
      If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
         frameCardDetails.Enabled = True
      End If

      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmIndividualOthers.cmbBranchCode, 1, 4) & "'")


      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
         txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "   ", rs(2))
         txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "   ", rs(3))

         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                       " where citycode = '" & tCode & "'")

         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         Else
            cmbDeliveryCity.text = "  "
         End If
       End If
   End If
End Sub

Private Sub optSecondaryElectronIntlCardNo_Click()
   txtSecondaryElectronIntlCardName = ""
End Sub

Private Sub optSecondaryElectronIntlCardYes_Click()
  If optPrimaryElectronIntlCardNo.Value = True Then
     MsgBox errNoPrimaryCard(UserLang)
     optSecondaryElectronIntlCardNo.Value = True
  End If
End Sub

Private Sub OptSingle_Click()
  If OptSingle.Value = True Then
     cmdJointAcc.Enabled = False
  End If

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

Private Sub txtPrimaryElectronIntlCardName_GotFocus()
  If optPrimaryElectronIntlCardYes.Value = True Then
     txtPrimaryElectronIntlCardName = UCase(frmIndividualOthers.txtEngFirstName & " " & frmIndividualOthers.txtEnglish2ndName & " " & frmIndividualOthers.txtEngLastName)
     If Len(txtPrimaryElectronIntlCardName) > 26 Then
        txtPrimaryElectronIntlCardName = UCase(frmIndividualOthers.txtEngFirstName)
     End If
  End If
End Sub

Private Sub txtPrimaryElectronIntlCardName_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
      KeyAscii = 0
      MsgBox (errNoArabicCharacters(UserLang))
      Exit Sub
   End If
End Sub

Private Sub txtPrimaryElectronIntlCardName_LostFocus()
   txtPrimaryElectronIntlCardName = UCase(txtPrimaryElectronIntlCardName)
End Sub

Private Sub txtSecondaryElectronIntlCardName_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
      KeyAscii = 0
      MsgBox (errNoArabicCharacters(UserLang))
      Exit Sub
   End If
End Sub

Private Sub txtSecondaryElectronIntlCardName_LostFocus()
   txtSecondaryElectronIntlCardName = UCase(txtSecondaryElectronIntlCardName)
End Sub

Public Function validateFrmIndividualsOthers3() As Integer

    validateFrmIndividualsOthers3 = 0
    
    If Len(RTrim(documentsSelected)) = 0 And Len(RTrim(otherDocumentsEntered)) = 0 Then
       MsgBox errNoDocumentsSelected(UserLang)
       validateFrmIndividualsOthers3 = 1
       Exit Function
    Else
       validateFrmIndividualsOthers3 = 0
    End If
    
    If updateAction Or _
       (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
       Exit Function
    End If
    
    If optPrimaryElectronIntlCardYes.Value = True Then
        If Len(RTrim(txtPrimaryElectronIntlCardName)) = 0 Then
          MsgBox errSpacePrimaryIntlCardName(UserLang)
          txtPrimaryElectronIntlCardName.SetFocus
          validateFrmIndividualsOthers3 = 1
          Exit Function
       Else
          validateFrmIndividualsOthers3 = 0
       End If

       If checkForSpecialChars(Trim(txtPrimaryElectronIntlCardName)) = False Then
          MsgBox errInvalidChar(UserLang)
          txtPrimaryElectronIntlCardName.SetFocus
          validateFrmIndividualsOthers3 = 1
          Exit Function
       Else
          validateFrmIndividualsOthers3 = 0
       End If
   End If
     
   If optSecondaryElectronIntlCardYes.Value = True Then
       If Len(RTrim(txtSecondaryElectronIntlCardName)) = 0 Then
          MsgBox errSpaceSecondaryIntlCardName(UserLang)
          txtSecondaryElectronIntlCardName.SetFocus
          validateFrmIndividualsOthers3 = 1
          Exit Function
       Else
          validateFrmIndividualsOthers3 = 0
       End If
       
       If checkForSpecialChars(Trim(txtSecondaryElectronIntlCardName)) = False Then
          MsgBox errInvalidChar(UserLang)
          txtSecondaryElectronIntlCardName.SetFocus
          validateFrmIndividualsOthers3 = 1
          Exit Function
       Else
          validateFrmIndividualsOthers3 = 0
       End If
    End If
    
    If optCardDeliveredToPOBox.Value = True Then
       If Len(RTrim(txtDeliveryAddr1)) = 0 Or _
          Len(RTrim(txtDeliveryPOBox)) = 0 Or _
          Len(RTrim(txtDeliveryZipcode)) = 0 Or _
          Len(RTrim(cmbDeliveryCity.text)) = 0 Then
        
          MsgBox errSpaceDeliveryAddress(UserLang)
          txtDeliveryAddr1.SetFocus
          validateFrmIndividualsOthers3 = 1
          Exit Function
       Else
          validateFrmIndividualsOthers3 = 0
       End If
       
       If Trim(txtDeliveryPOBox) = "0" Or _
          Trim(txtDeliveryZipcode) = "0" Then
          MsgBox errPoOrZipCannotBeZero(UserLang)
          txtDeliveryPOBox.SetFocus
          validateFrmIndividualsOthers3 = 1
          Exit Function
       Else
          validateFrmIndividualsOthers3 = 0
       End If
    ElseIf optCardDeliveredToGPS = True Then
       If Len(RTrim(txtGPSNo)) = 0 Or _
          Len(RTrim(txtGPSStreetName)) = 0 Or _
          Len(RTrim(txtGPSUnit)) = 0 Or _
          Len(RTrim(txtGPSZipCode)) = 0 Or _
          Len(RTrim(txtGPSAdditionalNo)) = 0 Or _
          Len(RTrim(cmbDeliveryCity.text)) = 0 Then
        
          MsgBox errSpaceDeliveryGPSAddress(UserLang)
          txtGPSNo.SetFocus
          validateFrmIndividualsOthers3 = 1
          Exit Function
       Else
          validateFrmIndividualsOthers3 = 0
       End If
    End If
    
    'If subCategoryCode = "03" Or subCategoryCode = "05" Then ' GCC or Tribal individuals
    If subCategoryCode = "05" Then ' Tribal individuals
       If optCurrentAcYes.Value = True Then
          If Mid$(cmbCurrentAcCurrency, 1, 2) <> "01" Then ' Other than SAR account
             MsgBox errOnlySarAcAllowed(UserLang)
             cmbCurrentAcCurrency.SetFocus
             validateFrmIndividualsOthers3 = 1
             Exit Function
          Else
             validateFrmIndividualsOthers3 = 0
          End If
       End If
       If optSavingAcYes.Value = True Then
          If Mid$(cmbSavingAcCurrency, 1, 2) <> "01" Then ' Other than SAR account
             MsgBox errOnlySarAcAllowed(UserLang)
             cmbSavingAcCurrency.SetFocus
             validateFrmIndividualsOthers3 = 1
             Exit Function
          Else
             validateFrmIndividualsOthers3 = 0
          End If
       End If
       If cmbOtherAccount.ListIndex >= 0 Then
          If Mid$(cmbOtherAccount.text, 1, 3) <> "000" Then
             If Mid$(cmbOtherAcCurrency, 1, 2) <> "01" Then  ' Other than SAR account
                MsgBox errOnlySarAcAllowed(UserLang)
                cmbOtherAcCurrency.SetFocus
                validateFrmIndividualsOthers3 = 1
                Exit Function
             End If
          Else
             validateFrmIndividualsOthers3 = 0
          End If
       Else
          validateFrmIndividualsOthers3 = 0
       End If
    End If 'subCategoryCode = "03" (GCC)  Or subcategory = "05"(Tribal individuals)
    
    If subCategoryCode = "07" Or subCategoryCode = "08" Then
       If optCurrentAcYes.Value = True Or optSavingAcYes.Value = True Then
          MsgBox errOnlyInternalAccAllowed(UserLang)
          validateFrmIndividualsOthers3 = 1
          Exit Function
       Else
          If cmbOtherAccount.ListIndex >= 0 Then
             If Mid$(cmbOtherAccount.text, 1, 3) <> "000" Then
                MsgBox errOnlyInternalAccAllowed(UserLang)
                validateFrmIndividualsOthers3 = 1
                Exit Function
             Else
                validateFrmIndividualsOthers3 = 0
             End If
          Else
             validateFrmIndividualsOthers3 = 0
          End If
       End If
    End If 'subcategorycode = 07 or 08
End Function

Public Sub poBoxEnableControls()
   lblGPSAddress1.Visible = False
   lblGPSUnit.Visible = False
   lblGPSAdditionalNo.Visible = False
   lblGPSZipCode.Visible = False
   txtGPSNo.Visible = False
   txtGPSStreetName.Visible = False
   txtGPSUnit.Visible = False
   txtGPSZipCode.Visible = False
   txtGPSAdditionalNo.Visible = False
   txtDeliveryAddr1.Visible = True
   txtDeliveryPOBox.Visible = True
   txtDeliveryZipcode.Visible = True
   lblDeliveryAddress1.Visible = True
   lblDeliveryPOBox.Visible = True
   lblDeliveryZipCode.Visible = True
   txtDeliveryAddr1.Refresh
   txtDeliveryPOBox.Refresh
   txtDeliveryZipcode.Refresh
   lblDeliveryZipCode.Refresh
   lblDeliveryAddress1.Refresh
   lblDeliveryPOBox.Refresh

End Sub

Public Sub GPSEnableControls()
   lblGPSAddress1.Visible = True
   lblGPSAddress1.Refresh
   lblGPSUnit.Visible = True
   lblGPSUnit.Refresh
   lblGPSAdditionalNo.Visible = True
   lblGPSAdditionalNo.Refresh
   lblGPSZipCode.Visible = True
   lblGPSZipCode.Refresh
   txtGPSNo.Visible = True
   txtGPSNo.Refresh
   txtGPSStreetName.Visible = True
   txtGPSStreetName.Refresh
   txtGPSUnit.Visible = True
   txtGPSUnit.Refresh
   txtGPSZipCode.Visible = True
   txtGPSZipCode.Refresh
   txtGPSAdditionalNo.Visible = True
   txtGPSAdditionalNo.Refresh
   
   txtDeliveryAddr1.Visible = False
   txtDeliveryPOBox.Visible = False
   txtDeliveryZipcode.Visible = False
   lblDeliveryAddress1.Visible = False
   lblDeliveryPOBox.Visible = False
   lblDeliveryZipCode.Visible = False

End Sub

Public Sub printAccOpeningCard()
  Dim custName As String, accountNo As String, custBranchCode As String, customerLang As Integer
  Dim tmpStr As String
  
  frmPrintAccOpeningCard.txtCustNo = frmIndividualOthers.txtCustomerNo
  If frmIndividualOthers.optLangArabic Then
     custName = Trim(frmIndividualOthers.txtArabFirstName) & " " & _
                Trim(frmIndividualOthers.txtArabic2ndName) & " " & _
                Trim(frmIndividualOthers.txtArabLastName)
     frmPrintAccOpeningCard.optLangArabic = True
     frmPrintAccOpeningCard.assignNameToGlobalVar frmIndividualOthers.txtArabFirstName, frmIndividualOthers.txtArabic2ndName, frmIndividualOthers.txtArabLastName
     customerLang = 0
  Else
     custName = Trim(frmIndividualOthers.txtEngFirstName) & " " & _
                Trim(frmIndividualOthers.txtEnglish2ndName) & " " & _
                Trim(frmIndividualOthers.txtEngLastName)
     frmPrintAccOpeningCard.optLangEnglish = True
     frmPrintAccOpeningCard.assignNameToGlobalVar frmIndividualOthers.txtEngFirstName, frmIndividualOthers.txtEnglish2ndName, frmIndividualOthers.txtEngLastName
     customerLang = 1
  End If
  frmPrintAccOpeningCard.txtCustName = custName
  
  If optCurrentAcYes Or optSavingAcYes Or Mid$(cmbOtherAccount, 1, 3) > "000" Then
     accountNo = Right(recvSuperDecisionMsg.ibanAccNo, 14)
  Else
     accountNo = recvSuperDecisionMsg.custNo
  End If
  custBranchCode = Mid$(frmIndividualOthers.cmbBranchCode, 1, 4)
  Set rs = db.OpenRecordset("select arabicname, englishName from branchinfo where branchcode = '" & custBranchCode & "'")
   
  If rs.recordCount > 0 Then
     If customerLang = 0 Then
        tmpStr = custBranchCode & "-" & rs(0)
     Else
        tmpStr = custBranchCode & "-" & rs(1)
     End If
  Else
     tmpStr = custBranchCode & "-Undefined"
  End If
  frmPrintAccOpeningCard.cmbBranchCode = tmpStr
  
  frmPrintAccOpeningCard.txtAccNo = accountNo
  
  frmPrintAccOpeningCard.txtIban = displayIban(recvSuperDecisionMsg.ibanAccNo)
  frmPrintAccOpeningCard.frameAccountInput.Enabled = False
  frmPrintAccOpeningCard.frameAccountInput.Visible = False
  frmPrintAccOpeningCard.cmdFetchDetails.Enabled = False
  frmPrintAccOpeningCard.cmdFetchDetails.Visible = False
  frmPrintAccOpeningCard.cmdOk.Enabled = True
  
  frmPrintAccOpeningCard.Show vbModal
End Sub

