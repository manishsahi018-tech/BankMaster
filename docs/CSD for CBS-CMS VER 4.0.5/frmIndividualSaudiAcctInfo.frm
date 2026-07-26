VERSION 5.00
Begin VB.Form frmIndividualSaudiAcctInfo 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account Details"
   ClientHeight    =   8235
   ClientLeft      =   1740
   ClientTop       =   315
   ClientWidth     =   11880
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8235
   ScaleWidth      =   11880
   Begin VB.Frame framePkgStmtOverride 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   375
      Left            =   6600
      TabIndex        =   160
      Top             =   2430
      Width           =   1575
      Begin VB.OptionButton optSegmentStmtOverrideNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   195
         Left            =   855
         TabIndex        =   162
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   540
      End
      Begin VB.OptionButton optSegmentStmtOverrideYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   210
         Left            =   135
         TabIndex        =   161
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
   End
   Begin VB.Frame frameMinBalFees 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   375
      Left            =   6615
      TabIndex        =   152
      Top             =   2790
      Width           =   1455
      Begin VB.OptionButton optMinBalFeeNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   195
         Left            =   855
         TabIndex        =   154
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   135
         Value           =   -1  'True
         Width           =   540
      End
      Begin VB.OptionButton optMinBalFeeYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   195
         Left            =   135
         TabIndex        =   153
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   135
         Width           =   615
      End
   End
   Begin VB.CommandButton cmdPrintAppln 
      BackColor       =   &H00BFD87E&
      Caption         =   "Print Application"
      Enabled         =   0   'False
      Height          =   420
      Left            =   3105
      MaskColor       =   &H00BFD87E&
      TabIndex        =   146
      ToolTipText     =   "Print application"
      Top             =   7845
      Width           =   1860
   End
   Begin VB.Frame FrameCardDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   2460
      Left            =   150
      TabIndex        =   124
      Top             =   5220
      Width           =   11655
      Begin VB.TextBox txtGPSStreetName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3240
         MaxLength       =   24
         TabIndex        =   61
         Tag             =   "11655"
         Top             =   1755
         Visible         =   0   'False
         Width           =   3255
      End
      Begin VB.TextBox txtGPSUnit 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2160
         MaxLength       =   5
         TabIndex        =   63
         Tag             =   "11655"
         Top             =   2055
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtGPSZipCode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6960
         MaxLength       =   5
         TabIndex        =   66
         Tag             =   "11655"
         Top             =   2055
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtGPSNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2160
         MaxLength       =   5
         TabIndex        =   59
         Tag             =   "11655"
         Top             =   1755
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtGPSAdditionalNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8160
         MaxLength       =   4
         TabIndex        =   68
         Tag             =   "11655"
         Top             =   2055
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Frame framePrimaryIntlCard 
         BackColor       =   &H00BFD87E&
         Height          =   390
         Left            =   2190
         TabIndex        =   128
         Tag             =   "11655"
         Top             =   420
         Width           =   1575
         Begin VB.OptionButton optPrimaryElectronIntlCardYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   195
            Left            =   105
            TabIndex        =   49
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   150
            Width           =   615
         End
         Begin VB.OptionButton optPrimaryElectronIntlCardNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   195
            Left            =   840
            TabIndex        =   50
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   150
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame frameSuppIntlCard 
         BackColor       =   &H00BFD87E&
         Height          =   435
         Left            =   2190
         TabIndex        =   127
         Tag             =   "11655"
         Top             =   795
         Width           =   1575
         Begin VB.OptionButton optSecondaryElectronIntlCardYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   52
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   135
            Width           =   615
         End
         Begin VB.OptionButton optSecondaryElectronIntlCardNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   855
            TabIndex        =   53
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   135
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.TextBox txtPrimaryElectronIntlCardName 
         Height          =   285
         Left            =   6030
         MaxLength       =   26
         TabIndex        =   51
         Tag             =   "11655"
         Top             =   495
         Width           =   3495
      End
      Begin VB.TextBox txtSecondaryElectronIntlCardName 
         Height          =   285
         Left            =   6030
         MaxLength       =   26
         TabIndex        =   54
         Tag             =   "11655"
         Top             =   855
         Width           =   3495
      End
      Begin VB.TextBox txtDeliveryAddr1 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2190
         MaxLength       =   30
         TabIndex        =   60
         Tag             =   "11655"
         Top             =   1755
         Width           =   3690
      End
      Begin VB.TextBox txtDeliveryPOBox 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2175
         TabIndex        =   64
         Tag             =   "11655"
         Top             =   2055
         Width           =   1455
      End
      Begin VB.ComboBox cmbDeliveryCity 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4305
         TabIndex        =   65
         Tag             =   "11655"
         Text            =   "Riyadh"
         Top             =   2070
         Width           =   1575
      End
      Begin VB.TextBox txtDeliveryZipcode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8070
         TabIndex        =   67
         Tag             =   "11655"
         Top             =   2055
         Width           =   1095
      End
      Begin VB.TextBox txtDeliveryAddr2 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8070
         MaxLength       =   30
         TabIndex        =   62
         Tag             =   "11655"
         Top             =   1710
         Width           =   3495
      End
      Begin VB.Frame Frame10 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   2190
         TabIndex        =   126
         Tag             =   "11655"
         Top             =   1215
         Width           =   5685
         Begin VB.OptionButton optCardDeliveredToGPS 
            BackColor       =   &H00BFD87E&
            Caption         =   "GPS"
            Height          =   255
            Left            =   4680
            TabIndex        =   58
            Tag             =   "5685"
            ToolTipText     =   "Mail"
            Top             =   165
            Width           =   885
         End
         Begin VB.OptionButton optCardDeliveredToPOBox 
            BackColor       =   &H00BFD87E&
            Caption         =   "Mail"
            Height          =   255
            Left            =   3600
            TabIndex        =   57
            Tag             =   "5685"
            ToolTipText     =   "Mail"
            Top             =   165
            Width           =   885
         End
         Begin VB.OptionButton optCardDeliveredToReqBranch 
            BackColor       =   &H00BFD87E&
            Caption         =   "Request Branch"
            Height          =   255
            Left            =   1905
            TabIndex        =   56
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
            TabIndex        =   55
            Tag             =   "5685"
            ToolTipText     =   "Customer Branch"
            Top             =   165
            Value           =   -1  'True
            Width           =   1635
         End
      End
      Begin VB.Frame frameCardType 
         BackColor       =   &H00BFD87E&
         Height          =   480
         Left            =   2190
         TabIndex        =   125
         Tag             =   "11655"
         Top             =   -60
         Width           =   2325
         Begin VB.OptionButton optIntlCard 
            BackColor       =   &H00BFD87E&
            Caption         =   "Elec.Int'l"
            Height          =   210
            Left            =   120
            TabIndex        =   47
            Tag             =   "2325"
            ToolTipText     =   "Electron International"
            Top             =   150
            Value           =   -1  'True
            Width           =   975
         End
         Begin VB.OptionButton optChipCard 
            BackColor       =   &H00BFD87E&
            Caption         =   "E.I. Chip"
            Height          =   225
            Left            =   1200
            TabIndex        =   48
            Tag             =   "2325"
            ToolTipText     =   "Electron Int'l Chip Card"
            Top             =   150
            Width           =   1035
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
         Left            =   7950
         TabIndex        =   145
         Tag             =   "11655"
         Top             =   2010
         Visible         =   0   'False
         Width           =   255
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
         TabIndex        =   144
         Tag             =   "11655"
         Top             =   1755
         Visible         =   0   'False
         Width           =   2535
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
         TabIndex        =   143
         Tag             =   "11655"
         Top             =   2100
         Visible         =   0   'False
         Width           =   1215
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
         TabIndex        =   142
         Tag             =   "11655"
         Top             =   2055
         Visible         =   0   'False
         Width           =   975
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
         TabIndex        =   139
         Tag             =   "11655"
         Top             =   510
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
         TabIndex        =   138
         Tag             =   "11655"
         Top             =   885
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
         TabIndex        =   137
         Tag             =   "11655"
         Top             =   495
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
         TabIndex        =   136
         Tag             =   "11655"
         Top             =   855
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
         TabIndex        =   135
         Tag             =   "11655"
         Top             =   1800
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
         TabIndex        =   134
         Tag             =   "11655"
         Top             =   2160
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
         TabIndex        =   133
         Tag             =   "11655"
         Top             =   2100
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
         TabIndex        =   132
         Tag             =   "11655"
         Top             =   2100
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
         TabIndex        =   131
         Tag             =   "11655"
         Top             =   1710
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
         TabIndex        =   130
         Tag             =   "11655"
         Top             =   1335
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
         TabIndex        =   129
         Tag             =   "11655"
         Top             =   90
         Width           =   1695
      End
   End
   Begin VB.CommandButton cmdJointAcc 
      Caption         =   "&Joint Account"
      Height          =   420
      Left            =   7845
      TabIndex        =   73
      ToolTipText     =   "Joint Account Details"
      Top             =   7845
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrevPage 
      Caption         =   "&Previous Page"
      Height          =   420
      Left            =   765
      TabIndex        =   69
      ToolTipText     =   "Previous Page"
      Top             =   7845
      Width           =   1215
   End
   Begin VB.CommandButton cmdApprove 
      BackColor       =   &H00BFD87E&
      Caption         =   "Approve"
      Height          =   420
      Left            =   4980
      MaskColor       =   &H00BFD87E&
      TabIndex        =   71
      ToolTipText     =   "Approve"
      Top             =   7845
      Width           =   1260
   End
   Begin VB.CommandButton cmdDocuments 
      Caption         =   "&Documents"
      Height          =   420
      Left            =   9060
      TabIndex        =   74
      ToolTipText     =   "Documents"
      Top             =   7845
      Width           =   1500
   End
   Begin VB.CommandButton cmdReject 
      BackColor       =   &H00BFD87E&
      Caption         =   "Reject"
      Height          =   420
      Left            =   6225
      MaskColor       =   &H00BFD87E&
      TabIndex        =   72
      ToolTipText     =   "Reject"
      Top             =   7845
      Width           =   1620
   End
   Begin VB.CommandButton cmdCreate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Create"
      Height          =   420
      Left            =   1965
      MaskColor       =   &H00BFD87E&
      TabIndex        =   70
      ToolTipText     =   "Create"
      Top             =   7845
      Width           =   1140
   End
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00BFD87E&
      Caption         =   "Exit"
      Height          =   420
      Left            =   10560
      MaskColor       =   &H00BFD87E&
      TabIndex        =   75
      ToolTipText     =   "Exit"
      Top             =   7845
      Width           =   1020
   End
   Begin VB.Frame FrameCustomerDetail2 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1770
      Left            =   120
      TabIndex        =   109
      Top             =   705
      Width           =   11895
      Begin VB.Frame frameCustomerAdvice 
         BackColor       =   &H00BFD87E&
         Height          =   375
         Left            =   9945
         TabIndex        =   147
         Tag             =   "11895"
         Top             =   300
         Width           =   1455
         Begin VB.OptionButton optCustAdviceNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   195
            Left            =   735
            TabIndex        =   149
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optCustAdviceYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   195
            Left            =   120
            TabIndex        =   148
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
      End
      Begin VB.TextBox txtMarketingMemo 
         Height          =   285
         Left            =   4800
         MaxLength       =   25
         TabIndex        =   6
         Tag             =   "11895"
         Top             =   360
         Width           =   2970
      End
      Begin VB.TextBox txtGeneralMemo 
         Height          =   285
         Left            =   9045
         TabIndex        =   21
         Tag             =   "11895"
         Top             =   1410
         Width           =   2595
      End
      Begin VB.TextBox txtRelationshipManager 
         Enabled         =   0   'False
         Height          =   285
         Left            =   4965
         TabIndex        =   20
         Tag             =   "11895"
         Top             =   1425
         Width           =   2505
      End
      Begin VB.TextBox txtEmployerZipcode 
         Height          =   285
         Left            =   10680
         MaxLength       =   10
         TabIndex        =   17
         Tag             =   "11895"
         Top             =   1005
         Width           =   975
      End
      Begin VB.ComboBox cmbMonthlyIncome 
         Height          =   315
         Left            =   9930
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Tag             =   "11895"
         Top             =   0
         Width           =   1575
      End
      Begin VB.ComboBox cmbEducation 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Tag             =   "11895"
         Top             =   0
         Width           =   1935
      End
      Begin VB.ComboBox cmbProfession 
         Height          =   315
         Left            =   4800
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   "11895"
         Top             =   0
         Width           =   1500
      End
      Begin VB.ComboBox cmbPosition 
         Height          =   315
         Left            =   7080
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Tag             =   "11895"
         Top             =   0
         Width           =   1335
      End
      Begin VB.CheckBox chkRentedHouse 
         BackColor       =   &H00BFD87E&
         Caption         =   "Rented Home"
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
         TabIndex        =   7
         Tag             =   "11895"
         ToolTipText     =   "Rented Home"
         Top             =   720
         Width           =   1575
      End
      Begin VB.CheckBox chkOwnHouse 
         BackColor       =   &H00BFD87E&
         Caption         =   "Own House"
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
         TabIndex        =   8
         Tag             =   "11895"
         ToolTipText     =   "Own House"
         Top             =   720
         Width           =   1335
      End
      Begin VB.CheckBox chkCompanyAcc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Com. Accomodation"
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
         Left            =   4200
         TabIndex        =   9
         Tag             =   "11895"
         ToolTipText     =   "Company Accomodation"
         Top             =   720
         Width           =   2055
      End
      Begin VB.CheckBox chkRentedCar 
         BackColor       =   &H00BFD87E&
         Caption         =   "Rented Car"
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
         Left            =   6360
         TabIndex        =   10
         Tag             =   "11895"
         ToolTipText     =   "Rented Car"
         Top             =   720
         Width           =   1695
      End
      Begin VB.CheckBox chkOwnCar 
         BackColor       =   &H00BFD87E&
         Caption         =   "Own Car"
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
         Left            =   8040
         TabIndex        =   11
         Tag             =   "11895"
         ToolTipText     =   "Own Car"
         Top             =   720
         Width           =   1455
      End
      Begin VB.CheckBox chkCompanyTransport 
         BackColor       =   &H00BFD87E&
         Caption         =   "Company Transport"
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
         Left            =   9600
         TabIndex        =   12
         Tag             =   "11895"
         ToolTipText     =   "Company Transport"
         Top             =   720
         Width           =   2055
      End
      Begin VB.TextBox txtEmployerName 
         Height          =   285
         Left            =   1440
         MaxLength       =   30
         TabIndex        =   13
         Tag             =   "11895"
         Top             =   1005
         Width           =   2655
      End
      Begin VB.TextBox txtDepartment 
         Height          =   285
         Left            =   4800
         MaxLength       =   20
         TabIndex        =   14
         Tag             =   "11895"
         Top             =   1005
         Width           =   1575
      End
      Begin VB.TextBox txtEmployerPOBox 
         Height          =   285
         Left            =   6840
         MaxLength       =   10
         TabIndex        =   15
         Tag             =   "11895"
         Top             =   1005
         Width           =   735
      End
      Begin VB.TextBox txtEmployerCity 
         Height          =   285
         Left            =   8415
         MaxLength       =   20
         TabIndex        =   16
         Tag             =   "11895"
         Top             =   1005
         Width           =   1095
      End
      Begin VB.ComboBox cmbSegmentation 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Tag             =   "11895"
         Top             =   360
         Width           =   1935
      End
      Begin VB.Frame FrameUpdateForSama 
         BackColor       =   &H00BFD87E&
         Height          =   405
         Left            =   1245
         TabIndex        =   77
         Tag             =   "11895"
         Top             =   1350
         Width           =   1575
         Begin VB.OptionButton optSamaUpdYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   240
            Left            =   120
            TabIndex        =   18
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   135
            Width           =   615
         End
         Begin VB.OptionButton optSamaUpdNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   210
            Left            =   840
            TabIndex        =   19
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   150
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Label lblCustomerAdvice 
         BackColor       =   &H00BFD87E&
         Caption         =   "Cust Advise Flag"
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
         Left            =   8370
         TabIndex        =   150
         Tag             =   "11895"
         Top             =   420
         Width           =   1575
      End
      Begin VB.Label lblMarketingMemo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Marketing Memo"
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
         Left            =   3240
         TabIndex        =   141
         Tag             =   "11895"
         Top             =   375
         Width           =   1410
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000003&
         BorderStyle     =   6  'Inside Solid
         DrawMode        =   4  'Mask Not Pen
         Tag             =   "11895"
         X1              =   -15
         X2              =   11700
         Y1              =   1335
         Y2              =   1335
      End
      Begin VB.Label lblGeneralMemo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "General Memo"
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
         Left            =   7695
         TabIndex        =   122
         Tag             =   "11895"
         Top             =   1440
         Width           =   1215
      End
      Begin VB.Label lblRelationshipManager 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Relationship Manager"
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
         Left            =   3060
         TabIndex        =   121
         Tag             =   "11895"
         Top             =   1455
         Width           =   1845
      End
      Begin VB.Label lblUpdatedForSama 
         BackColor       =   &H00BFD87E&
         Caption         =   "Updated for SAMA"
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
         Height          =   360
         Left            =   0
         TabIndex        =   120
         Tag             =   "11895"
         Top             =   1395
         Width           =   1200
      End
      Begin VB.Label lblEmployerZip 
         BackColor       =   &H00BFD87E&
         Caption         =   "Zip"
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
         Left            =   9600
         TabIndex        =   119
         Tag             =   "11895"
         Top             =   1005
         Width           =   1095
      End
      Begin VB.Label lblEducation 
         BackColor       =   &H00BFD87E&
         Caption         =   "Education"
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
         Left            =   30
         TabIndex        =   0
         Tag             =   "11895"
         Top             =   30
         Width           =   975
      End
      Begin VB.Label lblProfession 
         BackColor       =   &H00BFD87E&
         Caption         =   "Profession"
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
         TabIndex        =   118
         Tag             =   "11895"
         Top             =   0
         Width           =   1215
      End
      Begin VB.Label lblPosition 
         BackColor       =   &H00BFD87E&
         Caption         =   "Position"
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
         Left            =   6360
         TabIndex        =   117
         Tag             =   "11895"
         Top             =   45
         Width           =   975
      End
      Begin VB.Label lblMonthlyIncome 
         BackColor       =   &H00BFD87E&
         Caption         =   "Monthly Income"
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
         Left            =   8520
         TabIndex        =   116
         Tag             =   "11895"
         Top             =   0
         Width           =   1575
      End
      Begin VB.Label lblOwnership 
         BackColor       =   &H00BFD87E&
         Caption         =   "Owner Ship"
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
         TabIndex        =   115
         Tag             =   "11895"
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label lblEmployerName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Employer Name"
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
         TabIndex        =   114
         Tag             =   "11895"
         Top             =   1005
         Width           =   1695
      End
      Begin VB.Label lblDepartment 
         BackColor       =   &H00BFD87E&
         Caption         =   "Dept."
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
         Left            =   4200
         TabIndex        =   113
         Tag             =   "11895"
         Top             =   1005
         Width           =   615
      End
      Begin VB.Label lblEmployerPO 
         BackColor       =   &H00BFD87E&
         Caption         =   "P.O."
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
         Left            =   6405
         TabIndex        =   112
         Tag             =   "11895"
         Top             =   1020
         Width           =   495
      End
      Begin VB.Label lblEmployerCity 
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
         Height          =   255
         Left            =   7680
         TabIndex        =   111
         Tag             =   "11895"
         Top             =   1005
         Width           =   735
      End
      Begin VB.Label lblSegmentation 
         BackColor       =   &H00BFD87E&
         Caption         =   "Segmentation"
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
         TabIndex        =   110
         Tag             =   "11895"
         Top             =   390
         Width           =   1215
      End
   End
   Begin VB.Frame FrameAtmFees 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   375
      Left            =   2940
      TabIndex        =   78
      Top             =   2790
      Width           =   1575
      Begin VB.OptionButton optAtmFeeYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   165
         Left            =   135
         TabIndex        =   23
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   135
         Width           =   615
      End
      Begin VB.OptionButton optAtmFeeNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   180
         Left            =   855
         TabIndex        =   24
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   135
         Value           =   -1  'True
         Width           =   540
      End
   End
   Begin VB.Frame framePackagedAcc 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame4"
      Height          =   390
      Left            =   120
      TabIndex        =   103
      Top             =   2430
      Width           =   3705
      Begin VB.ComboBox cmbPackageAcc 
         Height          =   315
         Left            =   1215
         TabIndex        =   22
         Tag             =   "3705"
         Top             =   60
         Width           =   2415
      End
      Begin VB.Label lblPackagedAccount 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Package A/c"
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
         TabIndex        =   104
         Tag             =   "3705"
         Top             =   105
         Width           =   1500
      End
   End
   Begin VB.Frame frameSingleJoint 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame4"
      Height          =   495
      Left            =   120
      TabIndex        =   98
      Top             =   4680
      Width           =   11775
      Begin VB.TextBox txtFreezingGracePeriod 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   10455
         MaxLength       =   3
         TabIndex        =   156
         Tag             =   "11775"
         Top             =   75
         Width           =   615
      End
      Begin VB.Frame frameAcSingleJoint 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1455
         TabIndex        =   100
         Tag             =   "11775"
         Top             =   -45
         Width           =   3120
         Begin VB.OptionButton optUnidentified 
            BackColor       =   &H00BFD87E&
            Caption         =   "Unidentified"
            Enabled         =   0   'False
            Height          =   255
            Left            =   1920
            TabIndex        =   123
            Tag             =   "3120"
            ToolTipText     =   "Joint"
            Top             =   165
            Width           =   1155
         End
         Begin VB.OptionButton OptSingle 
            BackColor       =   &H00BFD87E&
            Caption         =   "Single"
            Height          =   255
            Left            =   120
            TabIndex        =   43
            Tag             =   "3120"
            ToolTipText     =   "Single"
            Top             =   165
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.OptionButton optJoint 
            BackColor       =   &H00BFD87E&
            Caption         =   "Joint"
            Height          =   255
            Left            =   1080
            TabIndex        =   44
            Tag             =   "3120"
            ToolTipText     =   "Joint"
            Top             =   165
            Width           =   855
         End
      End
      Begin VB.Frame frameSignSingleJoint 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   6420
         TabIndex        =   99
         Tag             =   "11775"
         Top             =   -45
         Width           =   2040
         Begin VB.OptionButton optSignJoint 
            BackColor       =   &H00BFD87E&
            Caption         =   "Joint"
            Height          =   255
            Left            =   1200
            TabIndex        =   46
            Tag             =   "2040"
            ToolTipText     =   "Joint"
            Top             =   165
            Width           =   750
         End
         Begin VB.OptionButton optSignSingle 
            BackColor       =   &H00BFD87E&
            Caption         =   "Single"
            Height          =   255
            Left            =   120
            TabIndex        =   45
            Tag             =   "2040"
            ToolTipText     =   "Single"
            Top             =   165
            Value           =   -1  'True
            Width           =   735
         End
      End
      Begin VB.Label lblFreezingGracePeriod 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Freezing grace period"
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
         Left            =   8490
         TabIndex        =   158
         Tag             =   "11775"
         Top             =   120
         Width           =   1860
      End
      Begin VB.Label lblDays 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Days"
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
         Left            =   11145
         TabIndex        =   157
         Tag             =   "11775"
         Top             =   105
         Width           =   435
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
         TabIndex        =   102
         Tag             =   "11775"
         Top             =   120
         Width           =   1410
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
         Left            =   4650
         TabIndex        =   101
         Tag             =   "11775"
         Top             =   120
         Width           =   1650
      End
   End
   Begin VB.Frame frameAccountDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1365
      Left            =   120
      TabIndex        =   80
      Top             =   3240
      Width           =   11775
      Begin VB.Frame Frame13 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1200
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   -75
         Width           =   1455
         Begin VB.OptionButton optCurrentAcNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   26
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
            TabIndex        =   25
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   195
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbCurrentAcCurrency 
         Height          =   315
         Left            =   3360
         Style           =   2  'Dropdown List
         TabIndex        =   27
         Tag             =   "11775"
         Top             =   45
         Width           =   1455
      End
      Begin VB.ComboBox cmbCurrentAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   29
         Tag             =   "11775"
         Top             =   45
         Width           =   975
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   10215
         TabIndex        =   83
         Tag             =   "11775"
         Top             =   -90
         Width           =   1455
         Begin VB.OptionButton optCurrentAcCheckBookNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   31
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   135
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optCurrentAcCheckBookYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   30
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
         TabIndex        =   82
         Tag             =   "11775"
         Top             =   405
         Width           =   1455
         Begin VB.OptionButton optSavingAcNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   33
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
            TabIndex        =   32
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   180
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbSavingAcCurrency 
         Height          =   315
         Left            =   3360
         Style           =   2  'Dropdown List
         TabIndex        =   34
         Tag             =   "11775"
         Top             =   525
         Width           =   1455
      End
      Begin VB.ComboBox cmbSavingAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   36
         Tag             =   "11775"
         Top             =   525
         Width           =   975
      End
      Begin VB.ComboBox cmbOtherAccount 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   37
         Tag             =   "11775"
         Top             =   1005
         Width           =   1215
      End
      Begin VB.ComboBox cmbOtherAcCurrency 
         Height          =   315
         Left            =   3360
         Style           =   2  'Dropdown List
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   1005
         Width           =   1455
      End
      Begin VB.ComboBox cmbOtherAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   40
         Tag             =   "11775"
         Top             =   1005
         Width           =   975
      End
      Begin VB.Frame frameOtherAccCheckBook 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   10215
         TabIndex        =   81
         Tag             =   "11775"
         Top             =   870
         Width           =   1455
         Begin VB.OptionButton optOtherAcCheckBookNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   42
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
            TabIndex        =   41
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   165
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbCurrentAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   28
         Tag             =   "11775"
         Top             =   45
         Width           =   1335
      End
      Begin VB.ComboBox cmbSavingAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   525
         Width           =   1335
      End
      Begin VB.ComboBox cmbOtherAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   39
         Tag             =   "11775"
         Top             =   1005
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
         TabIndex        =   97
         Tag             =   "11775"
         Top             =   45
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
         TabIndex        =   96
         Tag             =   "11775"
         Top             =   45
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
         Left            =   7200
         TabIndex        =   95
         Tag             =   "11775"
         Top             =   90
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
         TabIndex        =   94
         Tag             =   "11775"
         Top             =   525
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
         TabIndex        =   93
         Tag             =   "11775"
         Top             =   105
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
         TabIndex        =   92
         Tag             =   "11775"
         Top             =   525
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
         TabIndex        =   91
         Tag             =   "11775"
         Top             =   1005
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
         TabIndex        =   90
         Tag             =   "11775"
         Top             =   1005
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
         Left            =   7200
         TabIndex        =   89
         Tag             =   "11775"
         Top             =   1050
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
         TabIndex        =   88
         Tag             =   "11775"
         Top             =   1050
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
         Left            =   4845
         TabIndex        =   87
         Tag             =   "11775"
         Top             =   90
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
         Left            =   4845
         TabIndex        =   86
         Tag             =   "11775"
         Top             =   570
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
         Left            =   4845
         TabIndex        =   85
         Tag             =   "11775"
         Top             =   1050
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
         Left            =   7200
         TabIndex        =   84
         Tag             =   "11775"
         Top             =   570
         Width           =   1095
      End
   End
   Begin VB.Label lblSegmentStmtOverride 
      BackColor       =   &H00BFD87E&
      Caption         =   "Segment Statement override"
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
      Height          =   210
      Left            =   3900
      TabIndex        =   159
      Top             =   2535
      Width           =   2580
   End
   Begin VB.Label lblMinBalFees 
      BackColor       =   &H00BFD87E&
      Caption         =   "Minimum Balance fees"
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
      Height          =   210
      Left            =   4545
      TabIndex        =   155
      Top             =   2910
      Width           =   2055
   End
   Begin VB.Label lblAtmFees 
      BackColor       =   &H00BFD87E&
      Caption         =   "ATM fees"
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
      Height          =   210
      Left            =   1860
      TabIndex        =   151
      Top             =   2895
      Width           =   1020
   End
   Begin VB.Shape Shape1 
      Height          =   555
      Left            =   120
      Top             =   7770
      Width           =   11610
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
      Left            =   165
      TabIndex        =   140
      Top             =   7920
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Line Line11 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   135
      X2              =   11820
      Y1              =   4635
      Y2              =   4635
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   5640
      TabIndex        =   108
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
      TabIndex        =   107
      Top             =   240
      Width           =   1725
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Saudi"
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
      Left            =   8520
      TabIndex        =   106
      Top             =   240
      Width           =   3045
   End
   Begin VB.Label lblExcludeFrom 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Exclude from"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   285
      Left            =   90
      TabIndex        =   105
      Top             =   2850
      Width           =   1500
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11835
      Y1              =   3225
      Y2              =   3225
   End
   Begin VB.Label lblSaudiAccDetails 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Individual Saudi Customer Account Details "
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
      Left            =   195
      TabIndex        =   76
      Top             =   180
      Width           =   5370
   End
   Begin VB.Shape Shape2 
      Height          =   540
      Left            =   105
      Top             =   105
      Width           =   11640
   End
End
Attribute VB_Name = "frmIndividualSaudiAcctInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdCreate_Click()
    
    If Len(RTrim(documentsSelected)) = 0 And Len(RTrim(otherDocumentsEntered)) = 0 Then
       MsgBox errNoDocumentsSelected(UserLang)
       Exit Sub
    End If
    
    If validateFrmIndividualSaudiAcctInfo = 1 Then
       Exit Sub
    End If
    
    If frmIndividualSaudiAcctInfo.optJoint.Value = True Then
       If Not updateAction And _
          Not (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
          If CInt(noOfJoint) = 0 Then
             MsgBox errAtleastOneJointNeeded(UserLang)
             Exit Sub
          End If
       End If
    End If
    
    If subCategoryCode = "65" Then
       If Val(noOfHeir) = 0 Then
          MsgBox errAtleaseOnHeirNeeded(UserLang)
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
    
    If frmIndividualSaudiAcctInfo.optJoint.Value = True Then
       frmJointAccName.Caption = frmJointAccNameCaption(0, UserLang)
       frmJointAccName.lblJointAccNameOnCheck.Caption = frmJointAccNameCaption(1, UserLang)
       frmJointAccName.lblLine2.Caption = frmJointAccNameCaption(2, UserLang)
       frmJointAccName.lblJointAccNameOnReports.Caption = frmJointAccNameCaption(3, UserLang)
       frmJointAccName.cmdOk.Caption = frmJointAccNameCaption(4, UserLang)
       frmJointAccName.txtJointAccNameOnCheck.Enabled = True
       frmJointAccName.txtJointAccNameOnCheck1.Enabled = True
       frmJointAccName.txtJointAccNameOnReports.Enabled = True
       If tellerAction Or updateAction Then
          frmJointAccName.txtJointAccNameOnCheck = Mid$(recvSaudiIndividualMsg.jointAccNameOnCheck, 1, 30)
          frmJointAccName.txtJointAccNameOnCheck1 = Mid$(recvSaudiIndividualMsg.jointAccNameOnCheck, 31, 30)
          frmJointAccName.txtJointAccNameOnReports = recvSaudiIndividualMsg.jointAccNameOnReports
       Else
          If frmIndividualSaudi.optLangEnglish.Value = True Then
             frmJointAccName.txtJointAccNameOnCheck.Alignment = 0
             frmJointAccName.txtJointAccNameOnCheck1.Alignment = 0
             frmJointAccName.txtJointAccNameOnReports.Alignment = 0
             frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualSaudi.txtEngFirstName & _
                                " " & frmIndividualSaudi.txtEnglish2ndName & _
                                " " & frmIndividualSaudi.txtEnglish3rdName & _
                                " " & frmIndividualSaudi.txtEngLastName
             If Len(frmJointAccName.txtJointAccNameOnCheck) > 27 Then
                frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualSaudi.txtEngFirstName & _
                                " " & frmIndividualSaudi.txtEnglish2ndName & _
                                " " & frmIndividualSaudi.txtEnglish3rdName
                If Len(frmJointAccName.txtJointAccNameOnCheck) > 28 Then
                   frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualSaudi.txtEngFirstName & _
                                " " & frmIndividualSaudi.txtEnglish2ndName
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmIndividualSaudi.txtEnglish3rdName & _
                                " " & frmIndividualSaudi.txtEngLastName
                Else
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmIndividualSaudi.txtEngLastName
                End If
            End If
            frmJointAccName.txtJointAccNameOnReports = frmIndividualSaudi.txtEngFirstName & " " & frmIndividualSaudi.txtEngLastName
        Else
            frmJointAccName.txtJointAccNameOnCheck.Alignment = 1
            frmJointAccName.txtJointAccNameOnCheck1.Alignment = 1
            frmJointAccName.txtJointAccNameOnReports.Alignment = 1
            frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualSaudi.txtArabFirstName & _
                                " " & frmIndividualSaudi.txtArabic2ndName & _
                                " " & frmIndividualSaudi.txtArabic3rdName & _
                                " " & frmIndividualSaudi.txtArabLastName
             If Len(frmJointAccName.txtJointAccNameOnCheck) > 27 Then
                frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualSaudi.txtArabFirstName & _
                                " " & frmIndividualSaudi.txtArabic2ndName & _
                                " " & frmIndividualSaudi.txtArabic3rdName
                If Len(frmJointAccName.txtJointAccNameOnCheck) > 28 Then
                   frmJointAccName.txtJointAccNameOnCheck = _
                                frmIndividualSaudi.txtArabFirstName & _
                                " " & frmIndividualSaudi.txtArabic2ndName
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmIndividualSaudi.txtArabic3rdName & _
                                " " & frmIndividualSaudi.txtArabLastName
                Else
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmIndividualSaudi.txtArabLastName
                End If
             End If
             frmJointAccName.txtJointAccNameOnReports = frmIndividualSaudi.txtArabFirstName & " " & frmIndividualSaudi.txtArabLastName
         End If
      End If
      frmJointAccName.Show vbModal
    Else
       frmJointAccName.txtJointAccNameOnCheck = Space(30)
       frmJointAccName.txtJointAccNameOnCheck1 = Space(30)
       frmJointAccName.txtJointAccNameOnReports = Space(30)
       If updateAction = True Or _
          (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
          'If checkSaudiIndividualAddressChange = True Then ' ver 2.5.3
'             frmCardAddress.Show
'             If frmIndividualSaudi.optPoBox = True Then
'                frmCardAddress.tag = "0"
'                frmCardAddress.poBoxEnableControls
'                frmCardAddress.txtDeliveryAddr1 = frmIndividualSaudi.txtAddress1
'                frmCardAddress.txtDeliveryPOBox = frmIndividualSaudi.txtPOBox
'                frmCardAddress.txtDeliveryZipcode = frmIndividualSaudi.txtPinCode
'             Else
'                frmCardAddress.tag = "1"
'                frmCardAddress.GPSEnableControls
'                frmCardAddress.txtGPSNo = frmIndividualSaudi.txtSaudiPostGPSNo
'                frmCardAddress.txtGPSStreetName = frmIndividualSaudi.txtSaudiPostStreetName
'                frmCardAddress.txtGPSUnit = frmIndividualSaudi.txtSaudiPostUnit
'                frmCardAddress.txtGPSZipCode = frmIndividualSaudi.txtSaudiPostZipCode
'                frmCardAddress.txtGPSAdditionalNo = frmIndividualSaudi.txtSaudiPostAdditionalNo
'             End If
'             frmCardAddress.cmbDeliveryCity = frmIndividualSaudi.cmbCity.text
'          Else ' ver 2.5.3
'             individualSaudiInfo.updateCardAddressReqd = "0" ' ver 2.5.3
'             createSaudiCustomer ' ver 2.5.3
'          End If ' ver 2.5.3
       Else
           createSaudiCustomer
       End If
    End If
End Sub
Public Function validateFrmIndividualSaudiAcctInfo() As Integer
    Dim tmpVar As Integer
    Dim tCode As String
    Dim packCode As String
    
    validateFrmIndividualSaudiAcctInfo = 0
    
'    If Len(RTrim(documentsSelected)) = 0 And Len(RTrim(otherDocumentsEntered)) = 0 Then
'       MsgBox errNoDocumentsSelected(UserLang)
'       validateFrmIndividualSaudiAcctInfo = 1
'       Exit Function
'    Else
'       validateFrmIndividualSaudiAcctInfo = 0
'    End If
    
  'commented on nov 29 2003 by nad for resolving the reference.
  
  '  If Not updateAction Then
       If subCategoryCode = "02" Then
          If CInt(noOfReference) = 0 Then
        '     MsgBox noOfReference
             MsgBox errAtleasetOneReferenceReqd(UserLang)
             validateFrmIndividualSaudiAcctInfo = 1
             Exit Function
          Else
             validateFrmIndividualSaudiAcctInfo = 0
          End If
       End If
 '   End If
    
    
       If Len(RTrim(frmIndividualSaudiAcctInfo.cmbEducation.text)) = 0 Then
          MsgBox errSpaceEducation(UserLang) '"Education code should be selected...Please select from the list"
          frmIndividualSaudiAcctInfo.cmbEducation.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
    
       If Len(RTrim(frmIndividualSaudiAcctInfo.cmbProfession.text)) = 0 Then
          MsgBox errSpaceProfession(UserLang) '"Profession Code should be selected...Please select from the list"
          frmIndividualSaudiAcctInfo.cmbProfession.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
     
       If Len(RTrim(frmIndividualSaudiAcctInfo.cmbPosition.text)) = 0 Then
          MsgBox errSpacePosition(UserLang) '"Position Code should be selected...Please select from the list"
          frmIndividualSaudiAcctInfo.cmbPosition.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
       
       If Len(RTrim(frmIndividualSaudiAcctInfo.cmbMonthlyIncome.text)) = 0 Then
          MsgBox errSpaceIncome(UserLang) '"Monthly income code should be selected...Please select from the list"
          frmIndividualSaudiAcctInfo.cmbMonthlyIncome.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
       
       If frmIndividualSaudiAcctInfo.chkRentedHouse.Value = 0 And _
          frmIndividualSaudiAcctInfo.chkOwnHouse.Value = 0 And _
          frmIndividualSaudiAcctInfo.chkCompanyAcc.Value = 0 And _
          frmIndividualSaudiAcctInfo.chkRentedCar.Value = 0 And _
          frmIndividualSaudiAcctInfo.chkOwnCar.Value = 0 And _
          frmIndividualSaudiAcctInfo.chkCompanyTransport.Value = 0 Then
          
          MsgBox errSpaceOwnership(UserLang) '"Please select any one in ownership...."
          frmIndividualSaudiAcctInfo.chkRentedHouse.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
       
    If frmIndividualSaudi.optGenderFemale And _
       Mid$(frmIndividualSaudi.cmbBusinessType, 1, 3) = "272" Then
       If Len(RTrim(txtEmployerName)) = 0 Or _
          Len(RTrim(txtEmployerPOBox)) = 0 Or _
          Len(RTrim(txtEmployerZipcode)) = 0 Or _
          Len(RTrim(txtEmployerCity)) = 0 Then
          MsgBox errSpaceEmployerInfo(UserLang)
          frmIndividualSaudiAcctInfo.txtEmployerName.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
    End If
    
    If InStr(recvLoginMsg.authorityLevel, "~7") > 0 Then 'And updateAction Or _
                                (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
      tCode = Mid$(frmIndividualSaudiAcctInfo.cmbPackageAcc.text, 1, 1)
      If tCode = "0" Then
         If updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
            If recvSaudiIndividualMsg.packagedAcc > "0" Then
               packCode = "~7" & recvSaudiIndividualMsg.packagedAcc
               If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
                  MsgBox errNotAuthorisedToFlag(UserLang)
                  frmIndividualSaudiAcctInfo.bringOldFlag
                  validateFrmIndividualSaudiAcctInfo = 1
                  Exit Function
               Else
                  validateFrmIndividualSaudiAcctInfo = 0
               End If
            End If
         End If
      Else
         If updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
            If tCode <> recvSaudiIndividualMsg.packagedAcc Then
               packCode = "~7" & tCode
               If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
                  MsgBox errNotAuthorisedToFlag(UserLang)
                  frmIndividualSaudiAcctInfo.bringOldFlag
                  validateFrmIndividualSaudiAcctInfo = 1
                  Exit Function
               Else
                  validateFrmIndividualSaudiAcctInfo = 0
               End If
            End If
        Else
           packCode = "~7" & tCode
           If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
              MsgBox errNotAuthorisedToFlag(UserLang)
              frmIndividualSaudiAcctInfo.bringOldFlag
              validateFrmIndividualSaudiAcctInfo = 1
              Exit Function
           Else
              validateFrmIndividualSaudiAcctInfo = 0
           End If
        End If
      End If
    End If
    
    If updateAction Then
       validateFrmIndividualSaudiAcctInfo = 0
       Exit Function
    End If
    
    If tellerAction And _
       recvSaudiIndividualMsg.newOrUpdate = "U" Then
       validateFrmIndividualSaudiAcctInfo = 0
       Exit Function
    End If
     
    If frmIndividualSaudiAcctInfo.optPrimaryElectronIntlCardYes.Value = True Then
       If Len(RTrim(frmIndividualSaudiAcctInfo.txtPrimaryElectronIntlCardName)) = 0 Then
          MsgBox errSpacePrimaryIntlCardName(UserLang)
          frmIndividualSaudiAcctInfo.txtPrimaryElectronIntlCardName.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If

       If checkForSpecialChars(Trim(frmIndividualSaudiAcctInfo.txtPrimaryElectronIntlCardName)) = False Then
          MsgBox errInvalidChar(UserLang)
          frmIndividualSaudiAcctInfo.txtPrimaryElectronIntlCardName.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
    End If
         
    If frmIndividualSaudiAcctInfo.optSecondaryElectronIntlCardYes.Value = True Then
       If Len(RTrim(frmIndividualSaudiAcctInfo.txtSecondaryElectronIntlCardName)) = 0 Then
          MsgBox errSpaceSecondaryIntlCardName(UserLang)
          frmIndividualSaudiAcctInfo.txtSecondaryElectronIntlCardName.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
           
       If checkForSpecialChars(Trim(frmIndividualSaudiAcctInfo.txtSecondaryElectronIntlCardName)) = False Then
          MsgBox errInvalidChar(UserLang)
          frmIndividualSaudiAcctInfo.txtSecondaryElectronIntlCardName.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
    End If
        
    If frmIndividualSaudiAcctInfo.optCardDeliveredToPOBox.Value = True Then
       If Len(RTrim(frmIndividualSaudiAcctInfo.txtDeliveryAddr1)) = 0 Or _
          Len(RTrim(frmIndividualSaudiAcctInfo.txtDeliveryPOBox)) = 0 Or _
          Len(RTrim(frmIndividualSaudiAcctInfo.txtDeliveryZipcode)) = 0 Or _
          Len(RTrim(frmIndividualSaudiAcctInfo.cmbDeliveryCity.text)) = 0 Then
        
          MsgBox errSpaceDeliveryAddress(UserLang)
          frmIndividualSaudiAcctInfo.txtDeliveryAddr1.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
       If Trim(txtDeliveryPOBox) = "0" Or _
          Trim(txtDeliveryZipcode) = "0" Then
          MsgBox errPoOrZipCannotBeZero(UserLang)
          txtDeliveryPOBox.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
    ElseIf frmIndividualSaudiAcctInfo.optCardDeliveredToGPS = True Then
       If Len(RTrim(frmIndividualSaudiAcctInfo.txtGPSNo)) = 0 Or _
          Len(RTrim(frmIndividualSaudiAcctInfo.txtGPSStreetName)) = 0 Or _
          Len(RTrim(frmIndividualSaudiAcctInfo.txtGPSUnit)) = 0 Or _
          Len(RTrim(frmIndividualSaudiAcctInfo.txtGPSZipCode)) = 0 Or _
          Len(RTrim(frmIndividualSaudiAcctInfo.txtGPSAdditionalNo)) = 0 Or _
          Len(RTrim(frmIndividualSaudiAcctInfo.cmbDeliveryCity.text)) = 0 Then
        
          MsgBox errSpaceDeliveryGPSAddress(UserLang)
          frmIndividualSaudiAcctInfo.txtGPSNo.SetFocus
          validateFrmIndividualSaudiAcctInfo = 1
          Exit Function
       Else
          validateFrmIndividualSaudiAcctInfo = 0
       End If
    End If
   
End Function

Public Sub createSaudiCustomer()
    Dim strmsglen As String
    Dim retStatus As String
    Dim tmpStr As String
   
    formatNewSaudiCustomerRequest
    
    currentAccInfo = Space(12)
    savingAccInfo = Space(12)
    otherAccInfo = Space(12)
    If frmIndividualSaudiAcctInfo.optCurrentAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvSaudiIndividualMsg.currentAccInfo)) = 0 Then
             formatCurrentAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatCurrentAcc "0", "U"
          End If
       Else
          formatCurrentAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvSaudiIndividualMsg.currentAccInfo)) <> 0 Then
          formatCurrentAcc "1", "U"
       End If
    End If
    
    If frmIndividualSaudiAcctInfo.optSavingAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvSaudiIndividualMsg.savingsAccInfo)) = 0 Then
             formatSavingAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatSavingAcc "0", "U"
          End If
       Else
          formatSavingAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvSaudiIndividualMsg.savingsAccInfo)) <> 0 Then
          formatSavingAcc "1", "U"
       End If
    End If
    
    If frmIndividualSaudiAcctInfo.cmbOtherAccount.ListIndex >= 0 And _
       Mid$(frmIndividualSaudiAcctInfo.cmbOtherAccount.text, 1, 3) <> "000" Then
       If tellerAction Then
          If Len(RTrim(recvSaudiIndividualMsg.otherAccInfo)) = 0 Then
             formatOtherAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatOtherAcc "0", "U"
          End If
       Else
          formatOtherAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvSaudiIndividualMsg.otherAccInfo)) <> 0 Then
          formatOtherAcc "1", "U"
       End If
    End If

    SendMsg = individualSaudiInfo.msgLen & individualSaudiInfo.service & gBranchCode & individualSaudiInfo.userId & individualSaudiInfo.branchCode & individualSaudiInfo.dateTime & _
              individualSaudiInfo.creationOrUpdate & individualSaudiInfo.NewOrUpdateFlag & _
              individualSaudiInfo.bmUpdateStatus & individualSaudiInfo.customerNo & individualSaudiInfo.supervisorId & individualSaudiInfo.custBranchCode & individualSaudiInfo.samaMainCategory & individualSaudiInfo.samaSubCategory & individualSaudiInfo.screenSetNo & individualSaudiInfo.idNo & _
              individualSaudiInfo.idIssuedAt & individualSaudiInfo.idDateType & individualSaudiInfo.idIssueDateH & individualSaudiInfo.idIssueDateG & individualSaudiInfo.idExpiryDateH & individualSaudiInfo.idExpiryDateG & _
              individualSaudiInfo.ppNo & individualSaudiInfo.ppIssuedAt & individualSaudiInfo.ppDateType & individualSaudiInfo.ppIssueDateH & individualSaudiInfo.ppIssueDateG & individualSaudiInfo.ppExpiryDateH & individualSaudiInfo.ppExpiryDateG & _
              individualSaudiInfo.hafNo & individualSaudiInfo.hafIssuedAt & individualSaudiInfo.hafDateType & individualSaudiInfo.hafIssueDateH & individualSaudiInfo.hafIssueDateG & individualSaudiInfo.hafExpiryDateH & individualSaudiInfo.hafExpiryDateG

    SendMsg = SendMsg & individualSaudiInfo.frNo & individualSaudiInfo.frIssuedAt & individualSaudiInfo.frDateType & individualSaudiInfo.frIssueDateH & individualSaudiInfo.frIssueDateG & individualSaudiInfo.frExpiryDateH & individualSaudiInfo.frExpiryDateG & _
              individualSaudiInfo.certBirthNo & individualSaudiInfo.langPref & individualSaudiInfo.nationality & Mid$(individualSaudiInfo.titleCode, 1, 2) & individualSaudiInfo.dobDateType & individualSaudiInfo.dobDateH & individualSaudiInfo.dobDateG & _
              individualSaudiInfo.sexCode & individualSaudiInfo.vipCode & individualSaudiInfo.maritalStatus & individualSaudiInfo.noOfDependents & individualSaudiInfo.residentStatus & individualSaudiInfo.businessType & _
              individualSaudiInfo.aFirstName & individualSaudiInfo.a2ndName & individualSaudiInfo.a3rdName & individualSaudiInfo.aLastName & _
              individualSaudiInfo.aShortName & individualSaudiInfo.eFirstName & individualSaudiInfo.e2ndName & individualSaudiInfo.e3rdName & individualSaudiInfo.eLastName & individualSaudiInfo.eShortName & individualSaudiInfo.address1 & individualSaudiInfo.address2 & _
              individualSaudiInfo.poBox & individualSaudiInfo.cityName & individualSaudiInfo.zipCode & individualSaudiInfo.country & individualSaudiInfo.telOffAreaCode & individualSaudiInfo.telOffNo & individualSaudiInfo.telOffExt & _
              individualSaudiInfo.telHomeAreaCode & individualSaudiInfo.telHomeNo & individualSaudiInfo.telHomeExt & individualSaudiInfo.faxAreaCode & individualSaudiInfo.faxNo & individualSaudiInfo.faxExt & individualSaudiInfo.mobileNo & individualSaudiInfo.pagerNo & individualSaudiInfo.eMail & _
              individualSaudiInfo.educationCode & individualSaudiInfo.professionCode & individualSaudiInfo.positionCode & individualSaudiInfo.monthlyIncome & individualSaudiInfo.segmentation & individualSaudiInfo.ownerShip & individualSaudiInfo.employerName & individualSaudiInfo.department & _
              individualSaudiInfo.employerPoBox & individualSaudiInfo.employerCity & individualSaudiInfo.employerZipCode & individualSaudiInfo.documents & individualSaudiInfo.documentOther & individualSaudiInfo.singleJointAcc & individualSaudiInfo.packagedAcc & individualSaudiInfo.noOfJointAcc & _
              individualSaudiInfo.jointAccNameOnCheck & individualSaudiInfo.jointAccNameOnReports & individualSaudiInfo.signatureNature & individualSaudiInfo.electronIntlRequired & individualSaudiInfo.electronIntlName & individualSaudiInfo.electronIntlSuppRequired & _
              individualSaudiInfo.electronIntlSuppName & individualSaudiInfo.deliveryToBranchOrPO & individualSaudiInfo.deliveryAddress1 & individualSaudiInfo.deliveryAddress2 & individualSaudiInfo.deliveryPoBox & individualSaudiInfo.deliveryCity & _
              individualSaudiInfo.deliveryZip & individualSaudiInfo.supervisorComments & individualSaudiInfo.updateCardAddressReqd & individualSaudiInfo.internetBankAcc & individualSaudiInfo.custAdviceFlag & individualSaudiInfo.altBranchCode & _
              currentAccInfo & savingAccInfo & otherAccInfo & individualSaudiInfo.updatedForSama & individualSaudiInfo.relationshipManager & individualSaudiInfo.generalMemo & individualSaudiInfo.referenceReqdFor & individualSaudiInfo.cardType & individualSaudiInfo.marketingMemo & _
              individualSaudiInfo.addressType & individualSaudiInfo.custOpenSource & individualSaudiInfo.branchCSOId & _
              individualSaudiInfo.branchActionDateTime & individualSaudiInfo.activityFlag & individualSaudiInfo.excludeFromAtmFees & individualSaudiInfo.excludeFromMinBalFees & _
              individualSaudiInfo.accFreezingGracePeriod & individualSaudiInfo.samaAuthNo & _
              individualSaudiInfo.samaAuthIssuedAt & individualSaudiInfo.samaAuthDateType & _
              individualSaudiInfo.samaAuthIssueDateH & individualSaudiInfo.samaAuthIssueDateG & _
              individualSaudiInfo.samaAuthExpiryDateH & individualSaudiInfo.samaAuthExpiryDateG & individualSaudiInfo.pkgStmtFreqOverride & _
              Space(50)
           
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmIndividualSaudiAcctInfo.MousePointer = vbHourglass
    frmIndividualSaudiAcctInfo.cmdCreate.Enabled = False
    frmIndividualSaudiAcctInfo.cmdJointAcc.Enabled = False
    'frmIndividualSaudiAcctInfo.cmdCancel.Enabled = False
    frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmIndividualSaudiAcctInfo.cmdCreate.Enabled = True
       'frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
       If frmIndividualSaudiAcctInfo.optJoint = True Then
          frmIndividualSaudiAcctInfo.cmdJointAcc.Enabled = True
       End If
       frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
       frmIndividualSaudiAcctInfo.MousePointer = vbDefault
       Exit Sub
    End If
    frmIndividualSaudiAcctInfo.MousePointer = vbDefault
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
       gCustNo = recvCustomerMsg.custNo
       If activityFlag = "P" Then
          individualSaudiInfo.dateTime = individualSaudiInfo.branchActionDateTime
       End If
       If individualSaudiInfo.NewOrUpdateFlag = "N" And individualSaudiInfo.creationOrUpdate = "C" Then
          frmIndividualSaudi.txtCustomerNo = recvCustomerMsg.custNo
          If UserLang = ARABIC Then
             tmpStr = "ÑÞã ÇáÚãíá" & recvCustomerMsg.custNo
          Else
             tmpStr = "Customer Number Alloted is " & recvCustomerMsg.custNo
          End If
          MsgBox tmpStr
       End If
    Else
       If recvCustomerMsg.status = "007" Then
          MsgBox errPersonalReferenceNotFound(UserLang)
          cmdCreate.Enabled = True
          cmdPrevPage.Enabled = True
       ElseIf recvCustomerMsg.status = "008" Then
          MsgBox errLegalRepNotFound(UserLang)
          cmdCreate.Enabled = True
          cmdPrevPage.Enabled = True
       ElseIf recvCustomerMsg.status = "010" Then
          MsgBox errGuardianNotFound(UserLang)
          cmdCreate.Enabled = True
          cmdPrevPage.Enabled = True
       ElseIf recvCustomerMsg.status = "011" Then
          MsgBox errFosterParentNotFound(UserLang)
          cmdCreate.Enabled = True
          cmdPrevPage.Enabled = True
       Else
          If UserLang = ARABIC Then
             MsgBox recvCustomerMsg.aRemarks
          Else
             MsgBox recvCustomerMsg.eRemarks
          End If
          unloadForms
       End If
       Exit Sub
    End If
    
    If updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
       unloadForms
       Exit Sub
    End If
    
    frmIndividualSaudiAcctInfo.MousePointer = vbHourglass
    
   If phoneCustOpenAction = False Then
       If individualSaudiInfo.NewOrUpdateFlag = "N" And (individualSaudiInfo.creationOrUpdate = "C" Or _
         (tellerAction And activityFlag = "P")) Then
          If pinSelectAtBranch = True Then
             atmPin = Space(4)
             If frmIndividualSaudiAcctInfo.optPrimaryElectronIntlCardYes = True Then
                frmAcceptPin.tag = "P" ' primary card
                frmAcceptPin.txtCardType = "Primary"
                frmAcceptPin.txtNameOnTheCard = frmIndividualSaudiAcctInfo.txtPrimaryElectronIntlCardName
                frmAcceptPin.Show vbModal
             End If
          End If
       End If
   End If
    
   unloadForms
End Sub
Public Sub formatCurrentAcc(droppedFlag As String, creationOrUpdate As String)

currentAccInfo = "008" & Left$(frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.text, 2) & _
                      Left$(frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.text, 2) & _
                      Left$(frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.text, 2) & _
                      IIf(frmIndividualSaudiAcctInfo.optCurrentAcCheckBookYes, "1", "0") & droppedFlag & _
                      creationOrUpdate

End Sub
Public Sub formatSavingAcc(droppedFlag As String, creationOrUpdate As String)

savingAccInfo = "009" & Left$(frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.text, 2) & _
                      Left$(frmIndividualSaudiAcctInfo.cmbSavingAcStatus.text, 2) & _
                      Left$(frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.text, 2) & _
                      " " & droppedFlag & creationOrUpdate

End Sub
Public Sub formatOtherAcc(droppedFlag As String, creationOrUpdate As String)
Dim otherAcc As String

If droppedFlag = "1" Then
   otherAcc = Mid$(recvSaudiIndividualMsg.otherAccInfo, 3, 3)
Else
   otherAcc = Left$(frmIndividualSaudiAcctInfo.cmbOtherAccount.text, 3)
End If

otherAccInfo = otherAcc & Left$(frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.text, 2) & _
               Left$(frmIndividualSaudiAcctInfo.cmbOtherAcStatus.text, 2) & _
               Left$(frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.text, 2) & _
               IIf(Left$(frmIndividualSaudiAcctInfo.cmbOtherAccount.text, 3) = "160", _
               IIf(frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes, "1", "0"), Space(1)) & _
               droppedFlag & creationOrUpdate
End Sub
Public Sub acceptTpin()
   frmAcceptTPin.txtCustNo = gCustNo
   
   If individualSaudiInfo.langPref = "0" Then
      frmAcceptTPin.txtCustName = frmIndividualSaudi.txtArabShortName
   Else
      frmAcceptTPin.txtCustName = frmIndividualSaudi.txtEngShortName
   End If
   frmAcceptTPin.tag = "C"
   If tpinMandatoryAtBranch = False Then
      frmAcceptTPin.cmdCancel.Enabled = True
   Else
      frmAcceptTPin.cmdCancel.Enabled = False
   End If
   frmAcceptTPin.Show vbModal
End Sub
Public Sub unloadForms()
   Dim tCustNo As String
   frmIndividualSaudiAcctInfo.MousePointer = vbDefault
   frmIndividualSaudiAcctInfo.cmdCreate.Enabled = True
   If frmIndividualSaudiAcctInfo.optJoint = True Then
      frmIndividualSaudiAcctInfo.cmdJointAcc.Enabled = True
   End If
   frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
   frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
   Unload Me
   Unload frmIndividualJoint
   Unload frmIndividualSaudi
   Unload frmIndividualSaudi2
   Unload frmIndividualHeirs
   'Unload frmCardAddress
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
Private Sub cmdDocuments_Click()
   
   If supervisorAction Or searchAction Or tellerAction Or updateAction Or custHistoryAction Then
      documentsSelected = recvSaudiIndividualMsg.documents
      otherDocumentsEntered = recvSaudiIndividualMsg.documentOther
   End If
   frmDocuments.Show
End Sub

Private Sub cmdJointAcc_Click()
   Dim tCode As String, tuserId As String, tDateTime As String, tBranchCode As String
   Dim i As Integer
     
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If validateFrmIndividualSaudiAcctInfo = 1 Then
         Exit Sub
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
      If frmIndividualSaudiAcctInfo.OptSingle.Value = True Then
         MsgBox errNotAJointAccount(UserLang) ' "This account is not a joint account..."
         Exit Sub
      End If
      If Not tellerAction And Not updateAction Then
         If frmIndividualSaudi.optPoBox = True Then
            frmIndividualJoint.txtAddress1 = frmIndividualSaudi.txtAddress1
            frmIndividualJoint.txtAddress2 = frmIndividualSaudi.txtAddress2
            frmIndividualJoint.txtPOBox = frmIndividualSaudi.txtPOBox
            frmIndividualJoint.txtPinCode = frmIndividualSaudi.txtPinCode
         Else ' GPS address is selected
            frmIndividualJoint.txtSaudiPostGPSNo = frmIndividualSaudi.txtSaudiPostGPSNo
            frmIndividualJoint.txtSaudiPostStreetName = frmIndividualSaudi.txtSaudiPostStreetName
            frmIndividualJoint.txtSaudiPostUnit = frmIndividualSaudi.txtSaudiPostUnit
            frmIndividualJoint.txtSaudiPostZipCode = frmIndividualSaudi.txtSaudiPostZipCode
            frmIndividualJoint.txtSaudiPostAdditionalNo = frmIndividualSaudi.txtSaudiPostAdditionalNo
         End If
         frmIndividualJoint.cmbCity = frmIndividualSaudi.cmbCity
         frmIndividualJoint.txtOffPhoneCityCode = frmIndividualSaudi.txtOffPhoneCityCode
         frmIndividualJoint.txtOffPhoneNo = frmIndividualSaudi.txtOffPhoneNo
         frmIndividualJoint.txtOffPhoneExt = frmIndividualSaudi.txtOffPhoneExt
         frmIndividualJoint.txtResPhoneCityCode = frmIndividualSaudi.txtResPhoneCityCode
         frmIndividualJoint.txtResPhoneNo = frmIndividualSaudi.txtResPhoneNo
         frmIndividualJoint.txtResPhoneExt = frmIndividualSaudi.txtResPhoneExt
         frmIndividualJoint.txtFaxCityCode = frmIndividualSaudi.txtFaxCityCode
         frmIndividualJoint.txtFaxNo = frmIndividualSaudi.txtFaxNo
         frmIndividualJoint.txtFaxExt = frmIndividualSaudi.txtFaxExt
         frmIndividualJoint.txtMobileNo = frmIndividualSaudi.txtMobileNo
      End If
   End If
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      frmIndividualSaudiAcctInfo.MousePointer = vbHourglass
      CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
      frmIndividualJoint.Hide
      doJointSearch "00000", frmIndividualSaudi.txtCustomerNo, Space(2)
      frmIndividualSaudiAcctInfo.MousePointer = vbDefault
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

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
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

Private Sub FrameCustomerDetail2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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
      FrameCardDetails.Enabled = True
      
      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4) & "'")
   
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "  ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualSaudi.cmbBranchCode, 2, 3)
         txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "  ", rs(2))
         txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "  ", rs(3))
      
         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                       " where citycode = '" & tCode & "'")
                        
         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "  ", rs(0))
         Else
            cmbDeliveryCity.text = " "
         End If
       End If
   End If
End Sub

Private Sub optCardDeliveredToGPS_Click()
'   If frmIndividualSaudi.optPoBox = True Then
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
   txtDeliveryAddr2 = "   " & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualSaudi.cmbBranchCode, 2, 3)
   If frmIndividualSaudi.optSaudiPost = True Then
      txtGPSNo = frmIndividualSaudi.txtSaudiPostGPSNo
      txtGPSUnit = frmIndividualSaudi.txtSaudiPostUnit
      txtGPSZipCode = frmIndividualSaudi.txtSaudiPostZipCode
      txtGPSAdditionalNo = frmIndividualSaudi.txtSaudiPostAdditionalNo
      txtGPSStreetName = frmIndividualSaudi.txtSaudiPostStreetName
   Else
      txtGPSNo = ""
      txtGPSUnit = ""
      txtGPSZipCode = ""
      txtGPSAdditionalNo = ""
      txtGPSStreetName = ""
   End If
   cmbDeliveryCity.text = frmIndividualSaudi.cmbCity.text

End Sub

Private Sub optCardDeliveredToPOBox_Click()
   
'   If frmIndividualSaudi.optPoBox = False Then
'      MsgBox "POBOX Address cannot be selected;select GPS address"
'      optCardDeliveredToGPS.Value = True
'      Exit Sub
'   End If

   poBoxEnableControls
   
   txtDeliveryAddr1.Enabled = True
   txtDeliveryPOBox.Enabled = True
   cmbDeliveryCity.Enabled = True
   txtDeliveryZipcode.Enabled = True
   txtDeliveryAddr2 = "   " & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualSaudi.cmbBranchCode, 2, 3)
   If frmIndividualSaudi.optPoBox = True Then
      txtDeliveryPOBox = frmIndividualSaudi.txtPOBox
      txtDeliveryZipcode = frmIndividualSaudi.txtPinCode
      txtDeliveryAddr1 = frmIndividualSaudi.txtAddress1
   Else
      txtDeliveryPOBox = ""
      txtDeliveryZipcode = ""
      txtDeliveryAddr1 = ""
   End If
   cmbDeliveryCity.text = frmIndividualSaudi.cmbCity.text

'   If frmIndividualSaudi.optLangEnglish.Value = True Then
'      txtDeliveryAddr1 = frmIndividualSaudi.txtAddress1
'      If arabicCharFound(frmIndividualSaudi.cmbCity) Then
'         Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" + _
'                             frmIndividualSaudi.cmbCity.text + "'")
'         If rs.recordCount > 0 Then
'            cmbDeliveryCity.text = rs(0)
'         Else
'            cmbDeliveryCity.text = " "
'         End If
'      Else
'         cmbDeliveryCity.text = frmIndividualSaudi.cmbCity.text
'      End If
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
      FrameCardDetails.Enabled = True
      
      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & gBranchCode & "'")
   
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "  ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(gBranchCode, 2, 3)
         txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "  ", rs(2))
         txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "  ", rs(3))
      
         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " + _
                       " where citycode = '" & tCode & "'")
                        
         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "  ", rs(0))
         Else
            cmbDeliveryCity.text = " "
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
      FrameCardDetails.Enabled = False
   End If
End Sub

Private Sub optCurrentAcYes_Click()
  Dim tCode As String
   
  If Not updateAction And Not supervisorAction And _
          optCardDeliveredToBranch.Value = True Then
      If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
         FrameCardDetails.Enabled = True
      End If

      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " + _
               " where branchcode = '" & Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4) & "'")


      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "  ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualSaudi.cmbBranchCode, 2, 3)
         txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "  ", rs(2))
         txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "  ", rs(3))

         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " + _
                       " where citycode = '" & tCode & "'")

         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "  ", rs(0))
         Else
            cmbDeliveryCity.text = " "
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
   txtPrimaryElectronIntlCardName = UCase(frmIndividualSaudi.txtEngFirstName + " " + frmIndividualSaudi.txtEnglish2ndName + " " + frmIndividualSaudi.txtEngLastName)
   If Len(txtPrimaryElectronIntlCardName) > 26 Then
      txtPrimaryElectronIntlCardName = UCase(frmIndividualSaudi.txtEngFirstName)
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
       FrameCardDetails.Enabled = False
   End If
End Sub

Private Sub optSavingAcYes_Click()
    Dim tCode As String
   
  If Not updateAction And Not supervisorAction And Not searchAction And Not custHistoryAction And _
          optCardDeliveredToBranch.Value = True Then
      If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
         FrameCardDetails.Enabled = True
      End If

      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " + _
               " where branchcode = '" & Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4) & "'")


      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "  ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmIndividualSaudi.cmbBranchCode, 2, 3)
         txtDeliveryPOBox = IIf(rs(2) = "" Or IsNull(rs(2)) = True, "  ", rs(2))
         txtDeliveryZipcode = IIf(rs(3) = "" Or IsNull(rs(3)) = True, "  ", rs(3))

         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                       " where citycode = '" & tCode & "'")

         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "  ", rs(0))
         Else
            cmbDeliveryCity.text = " "
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

Private Sub txtEmployerPOBox_KeyPress(KeyAscii As Integer)
 If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
     KeyAscii = 0
     MsgBox (errOnlyNumeralsAllowed(UserLang))
     Exit Sub
 End If

End Sub

Private Sub txtEmployerZipcode_KeyPress(KeyAscii As Integer)
 If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
     KeyAscii = 0
     MsgBox (errOnlyNumeralsAllowed(UserLang))
     Exit Sub
 End If

End Sub

Private Sub txtFreezingGracePeriod_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtPrimaryElectronIntlCardName_GotFocus()
  If optPrimaryElectronIntlCardYes.Value = True Then
     txtPrimaryElectronIntlCardName = UCase(frmIndividualSaudi.txtEngFirstName & " " & frmIndividualSaudi.txtEnglish2ndName & " " & frmIndividualSaudi.txtEngLastName)
     If Len(txtPrimaryElectronIntlCardName) > 26 Then
        txtPrimaryElectronIntlCardName = UCase(frmIndividualSaudi.txtEngFirstName)
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

Private Sub cmbCurrentAcCurrency_Click()
   If Len(RTrim(cmbCurrentAcCurrency.text)) <> 0 Then
      If Mid$(cmbCurrentAcCurrency.text, 1, 2) <> "01" Then
         frmIndividualSaudiAcctInfo.optCurrentAcCheckBookNo.Value = True
         frmIndividualSaudiAcctInfo.optCurrentAcCheckBookYes.Enabled = False
      Else
         frmIndividualSaudiAcctInfo.optCurrentAcCheckBookYes.Enabled = True
      End If
   End If
End Sub

Private Sub cmbOtherAccount_Click()
   If Mid$(cmbOtherAccount.text, 1, 3) = "160" And _
      Mid$(cmbOtherAcCurrency.text, 1, 2) = "01" Then
      frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes.Enabled = True
   Else
      frmIndividualSaudiAcctInfo.optOtherAcCheckBookNo.Value = True
      frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes.Enabled = False
   End If
End Sub

Private Sub cmbOtherAcCurrency_Click()
   If Len(RTrim(frmIndividualSaudiAcctInfo.cmbOtherAccount.text)) <> 0 Then
      If Mid$(frmIndividualSaudiAcctInfo.cmbOtherAccount.text, 1, 3) = "160" Then
         If Len(RTrim(frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.text)) <> 0 Then
            If Mid$(frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.text, 1, 2) <> "01" Then
               frmIndividualSaudiAcctInfo.optOtherAcCheckBookNo.Value = True
               frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes.Enabled = False
            Else
               frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes.Enabled = True
            End If
         End If
      End If
   End If
End Sub
Public Sub approveTpinSelect()
   frmAcceptTPin.txtCustNo = recvSuperDecisionMsg.custNo
   
   If individualSaudiInfo.langPref = "0" Then
      frmAcceptTPin.txtCustName = frmIndividualSaudi.txtArabShortName
   Else
      frmAcceptTPin.txtCustName = frmIndividualSaudi.txtEngShortName
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
Public Sub unloadSupForms()
  Dim tCustNo As String
  If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
     tCustNo = Space(7)
  Else
     tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
  End If
  
  If recvSaudiIndividualMsg.newOrUpdate = "N" And _
     recvSuperDecisionMsg.status = "000" Then
     If accOpenCardPrintAllowed = True Then
        If optCurrentAcYes Or optSavingAcYes Or Mid$(cmbOtherAccount, 1, 3) > "000" Then
           printAccOpeningCard
        End If
     End If
  End If
  Unload Me
  Unload frmIndividualSaudi
  Unload frmIndividualSaudi2
  Unload frmIndividualHeirs
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
    Dim tCode As String
    Dim i As Integer
    If updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
       If Len(RTrim(recvSaudiIndividualMsg.packagedAcc)) = 0 Then
          tCode = "0"
       Else
          tCode = recvSaudiIndividualMsg.packagedAcc
       End If
    Else
       tCode = "0"
    End If
    If tCode <> "" Then
       For i = 0 To frmIndividualSaudiAcctInfo.cmbPackageAcc.ListCount
           If Mid(frmIndividualSaudiAcctInfo.cmbPackageAcc.List(i), 1, 1) = tCode Then
              frmIndividualSaudiAcctInfo.cmbPackageAcc.ListIndex = i
              Exit For
            End If
        Next i
    Else
        frmIndividualSaudiAcctInfo.cmbPackageAcc.ListIndex = -1
    End If
    If i > frmIndividualSaudiAcctInfo.cmbPackageAcc.ListCount Then
        frmIndividualSaudiAcctInfo.cmbPackageAcc.text = tCode & "-Not defined in local"
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
   Dim strmsglen As String
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
   
   If recvSaudiIndividualMsg.newOrUpdate = "N" Then
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
             tSupervisorId & Space(200) & recvSaudiIndividualMsg.newOrUpdate & tPrimaryAcc & _
             frmIndividualSaudi.txtCustomerNo & "1" & activityFlag & Space(10) & Space(14) & Space(50) 'screen set no = 1
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   
   frmIndividualSaudiAcctInfo.MousePointer = vbHourglass
   frmIndividualSaudiAcctInfo.cmdApprove.Enabled = False
   frmIndividualSaudiAcctInfo.cmdReject.Enabled = False
   frmIndividualSaudiAcctInfo.cmdCancel.Enabled = False
   frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = False
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmIndividualSaudiAcctInfo.MousePointer = vbDefault
      frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
      frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
      frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
      frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
      unloadSupForms
      Exit Sub
   End If

   If recvSuperDecisionMsg.status = "000" Then
      frmIndividualSaudiAcctInfo.MousePointer = vbDefault
      MsgBox errSuccessful(UserLang) '"transaction successfully completed..."
      If recvSaudiIndividualMsg.newOrUpdate = "N" Then
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
                     unloadSupForms
                  End If
               End If
            Else
               If realOrPseudo = "1" Then
                  updateBranchPower
               Else
                  unloadSupForms
               End If
            End If
         Else
            If realOrPseudo = "1" Then
               updateBranchPower
            Else
               unloadSupForms
            End If
         End If
      Else
         If realOrPseudo = "1" Then
            updateBranchPower
         Else
            unloadSupForms
         End If
      End If
   Else
      If UserLang = ARABIC Then
         MsgBox recvSuperDecisionMsg.aRemarks
      Else
         MsgBox recvSuperDecisionMsg.eRemarks
      End If
      frmIndividualSaudiAcctInfo.MousePointer = vbDefault
      unloadSupForms
      Exit Sub
   End If
End Sub
   
Public Function updateBranchPower()

   frmIndividualSaudiAcctInfo.MousePointer = vbHourglass
   frmIndividualSaudi.txtCustomerNo = recvSuperDecisionMsg.custNo
   formatNewSaudiCustomerRequest
   
   'now form the customer buffer to insert into BranchPower
   If openCustFile = 1 Then
      frmIndividualSaudiAcctInfo.MousePointer = vbDefault
      frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
      frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
      frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
      frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchPower = 1
      Exit Function
   End If
   
   If recvSaudiIndividualMsg.newOrUpdate = "U" Then
      If readClient = 1 Then
         frmIndividualSaudiAcctInfo.MousePointer = vbDefault
         frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
         frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
         frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
         frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   CustBuf.recType = "02"
   CustBuf.clientNo = Format(recvSuperDecisionMsg.custNo, "!@@@@@@@@@")
   If recvSaudiIndividualMsg.newOrUpdate = "N" Then
      If individualSaudiInfo.langPref = "0" Then
         If branchPowerEnv = "DOS" Then
            CustBuf.shortName1 = windowToAsmo(individualSaudiInfo.aShortName)
            CustBuf.alphacode = windowToAsmo(Format(Mid$(individualSaudiInfo.aLastName, 1, 3) & Mid$(individualSaudiInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
         Else
            CustBuf.shortName1 = individualSaudiInfo.aShortName
            CustBuf.alphacode = Format(Mid$(individualSaudiInfo.aLastName, 1, 3) & Mid$(individualSaudiInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "0"
      Else
         If branchPowerEnv = "DOS" Then
            CustBuf.shortName1 = windowToAsmo(individualSaudiInfo.eShortName)
            CustBuf.alphacode = windowToAsmo(Format(Mid$(individualSaudiInfo.eLastName, 1, 3) & Mid$(custInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
         Else
            CustBuf.shortName1 = individualSaudiInfo.eShortName
            CustBuf.alphacode = Format(Mid$(individualSaudiInfo.eLastName, 1, 3) & Mid$(individualSaudiInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "1"
      End If
      If branchPowerEnv = "DOS" Then
         CustBuf.address1 = windowToAsmo(Format(individualSaudiInfo.address1, "!" & String(45, "@")))
         CustBuf.address2 = windowToAsmo(Format(Mid$(individualSaudiInfo.poBox, 1, 10) & Mid$(individualSaudiInfo.cityName, 1, 20) & Mid$(individualSaudiInfo.zipCode, 7), "!" & String(45, "@")))
         CustBuf.address3 = windowToAsmo(Format("I" & individualSaudiInfo.idNo, "!" & String(45, "@")))
      Else
         CustBuf.address1 = Format(individualSaudiInfo.address1, "!" & String(45, "@"))
         CustBuf.address2 = Format(Mid$(individualSaudiInfo.poBox, 1, 10) & Mid$(individualSaudiInfo.cityName, 1, 20) & Mid$(individualSaudiInfo.zipCode, 7), "!" & String(45, "@"))
         CustBuf.address3 = Format("I" & individualSaudiInfo.idNo, "!" & String(45, "@"))
      End If
   Else
      If recvSuperDecisionMsg.nameChanged = "1" Then
         If individualSaudiInfo.langPref = "0" Then
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(individualSaudiInfo.aShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(individualSaudiInfo.aLastName, 1, 3) & Mid$(individualSaudiInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = individualSaudiInfo.aShortName
               CustBuf.alphacode = Format(Mid$(individualSaudiInfo.aLastName, 1, 3) & Mid$(individualSaudiInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "0"
         Else
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(individualSaudiInfo.eShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(individualSaudiInfo.eLastName, 1, 3) & Mid$(individualSaudiInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = individualSaudiInfo.eShortName
               CustBuf.alphacode = Format(Mid$(individualSaudiInfo.eLastName, 1, 3) & Mid$(individualSaudiInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "1"
         End If
      End If
      If recvSuperDecisionMsg.addressChanged = "1" Then
         If branchPowerEnv = "DOS" Then
            CustBuf.address1 = windowToAsmo(Format(individualSaudiInfo.address1, "!" & String(45, "@")))
            CustBuf.address2 = windowToAsmo(Format(Mid$(individualSaudiInfo.poBox, 1, 10) & Mid$(individualSaudiInfo.cityName, 1, 20) & Mid$(individualSaudiInfo.zipCode, 7), "!" & String(45, "@")))
            CustBuf.address3 = windowToAsmo(Format("I" & individualSaudiInfo.idNo, "!" & String(45, "@")))
        Else
            CustBuf.address1 = Format(individualSaudiInfo.address1, "!" & String(45, "@"))
            CustBuf.address2 = Format(Mid$(individualSaudiInfo.poBox, 1, 10) & Mid$(individualSaudiInfo.cityName, 1, 20) & Mid$(individualSaudiInfo.zipCode, 7), "!" & String(45, "@"))
            CustBuf.address3 = Format("I" & individualSaudiInfo.idNo, "!" & String(45, "@"))
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
   
   If recvSaudiIndividualMsg.newOrUpdate = "N" Then
      If insertClient = 1 Then
         frmIndividualSaudiAcctInfo.MousePointer = vbDefault
         frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
         frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
         frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
         frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   Else
      If updateClient = 1 Then
         frmIndividualSaudiAcctInfo.MousePointer = vbDefault
         frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
         frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
         frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
         frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   closeClient
   
   If recvSaudiIndividualMsg.newOrUpdate = "U" Then
      frmIndividualSaudiAcctInfo.MousePointer = vbDefault
      frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
      frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
      frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
      frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchPower = 0
      Exit Function
   End If
  
   If openAcctFile = 1 Then
      frmIndividualSaudiAcctInfo.MousePointer = vbDefault
      frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
      frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
      frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
      frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchPower = 1
      Exit Function
   End If
         
   If frmIndividualSaudiAcctInfo.optCurrentAcYes.Value = True Then
      formatAcctInfo "008", Left$(frmIndividualSaudiAcctInfo.cmbCurrentAcCurrency.text, 2), _
                     Left$(frmIndividualSaudiAcctInfo.cmbCurrentAcStatus.text, 2), _
                     Left$(frmIndividualSaudiAcctInfo.cmbCurrentAcStmtFreq.text, 2), _
                     IIf(frmIndividualSaudiAcctInfo.optCurrentAcCheckBookYes, "0", "1"), "0", _
                     recvSuperDecisionMsg.custNo
                     
       ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " & _
                                  "'" & Mid$(AccBuf.accNo, 1, 2) & "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
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
          frmIndividualSaudiAcctInfo.MousePointer = vbDefault
          frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
          frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
          frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
          frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchPower = 1
          Exit Function
       End If
    End If
    
    If frmIndividualSaudiAcctInfo.optSavingAcYes.Value = True Then
       formatAcctInfo "009", Left$(frmIndividualSaudiAcctInfo.cmbSavingAcCurrency.text, 2), _
                      Left$(frmIndividualSaudiAcctInfo.cmbSavingAcStatus.text, 2), _
                      Left$(frmIndividualSaudiAcctInfo.cmbSavingAcStmtFreq.text, 2), _
                      Space(1), "0", recvSuperDecisionMsg.custNo
                     
       ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " & _
                                  "'" & Mid$(AccBuf.accNo, 1, 2) & "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
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
          frmIndividualSaudiAcctInfo.MousePointer = vbDefault
          frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
          frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
          frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
          frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchPower = 1
          Exit Function
       End If
    End If
    
    If frmIndividualSaudiAcctInfo.cmbOtherAccount.ListIndex >= 0 And _
       Mid$(frmIndividualSaudiAcctInfo.cmbOtherAccount.text, 1, 3) <> "000" Then
       formatAcctInfo Left$(frmIndividualSaudiAcctInfo.cmbOtherAccount.text, 3), _
                      Left$(frmIndividualSaudiAcctInfo.cmbOtherAcCurrency.text, 2), _
                      Left$(frmIndividualSaudiAcctInfo.cmbOtherAcStatus.text, 2), _
                      Left$(frmIndividualSaudiAcctInfo.cmbOtherAcStmtFreq.text, 2), _
                      IIf(Left$(frmIndividualSaudiAcctInfo.cmbOtherAccount.text, 3) = "160", _
                      IIf(frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes, "0", "1"), _
                      Space(1)), "0", recvSuperDecisionMsg.custNo
                              
        ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " & _
                                  "'" & Mid$(AccBuf.accNo, 1, 2) & "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
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
          frmIndividualSaudiAcctInfo.MousePointer = vbDefault
          frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
          frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
          frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
          frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchPower = 1
          Exit Function
       End If
  End If
  
  closeAcct
  updateBranchPower = 0
    
  frmIndividualSaudiAcctInfo.MousePointer = vbDefault
  frmIndividualSaudiAcctInfo.cmdApprove.Enabled = True
  frmIndividualSaudiAcctInfo.cmdReject.Enabled = True
  frmIndividualSaudiAcctInfo.cmdCancel.Enabled = True
  frmIndividualSaudiAcctInfo.cmdPrevPage.Enabled = True

  unloadSupForms
End Function

Public Function checkSaudiIndividualAddressChange() As Boolean
    formatNewSaudiCustomerRequest
    If Trim(individualSaudiInfo.address1) <> Trim(recvSaudiIndividualMsg.address1) Or _
       Trim(individualSaudiInfo.address2) <> Trim(recvSaudiIndividualMsg.address2) Or _
       Trim(individualSaudiInfo.poBox) <> Trim(recvSaudiIndividualMsg.poBox) Or _
       Trim(individualSaudiInfo.cityName) <> Trim(recvSaudiIndividualMsg.cityName) Or _
       Trim(individualSaudiInfo.zipCode) <> Trim(recvSaudiIndividualMsg.zipCode) Then
       checkSaudiIndividualAddressChange = True
    Else
        checkSaudiIndividualAddressChange = False
    End If

End Function
Private Sub Form_Load()
   Dim tCode As String, mQry As String
   
   If UserLang = ARABIC Then
      ChangePositions frmIndividualSaudiAcctInfo, 11800
      frmIndividualSaudiAcctInfo.RightToLeft = True
   End If
   
   lblMainCategoryDesc = mainCategoryDesc
   lblSubCategoryDesc = subCategoryDesc
   
   If InStr(recvLoginMsg.authorityLevel, "~02") > 0 And _
      supervisorAction Then
      If recvSaudiIndividualMsg.displayWarningMsgOnDuplicateId = "0" Then   ' Stop the process
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
  
   frmIndividualSaudiAcctInfo.Caption = frmIndividualSaudiAcctInfoCaption(0, UserLang)
   frmIndividualSaudiAcctInfo.lblSaudiAccDetails.Caption = frmIndividualSaudiAcctInfoCaption(0, UserLang)
   frmIndividualSaudiAcctInfo.lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
   frmIndividualSaudiAcctInfo.lblEducation.Caption = frmIndividualSaudiAcctInfoCaption(1, UserLang)
   frmIndividualSaudiAcctInfo.lblProfession.Caption = frmIndividualSaudiAcctInfoCaption(2, UserLang)
   frmIndividualSaudiAcctInfo.lblPosition.Caption = frmIndividualSaudiAcctInfoCaption(3, UserLang)
   frmIndividualSaudiAcctInfo.lblMonthlyIncome.Caption = frmIndividualSaudiAcctInfoCaption(4, UserLang)
   frmIndividualSaudiAcctInfo.lblSegmentation.Caption = frmIndividualSaudiAcctInfoCaption(5, UserLang)
   frmIndividualSaudiAcctInfo.lblOwnership.Caption = frmIndividualSaudiAcctInfoCaption(6, UserLang)
   frmIndividualSaudiAcctInfo.chkRentedHouse.Caption = frmIndividualSaudiAcctInfoCaption(7, UserLang)
   frmIndividualSaudiAcctInfo.chkOwnHouse.Caption = frmIndividualSaudiAcctInfoCaption(8, UserLang)
   frmIndividualSaudiAcctInfo.chkCompanyAcc.Caption = frmIndividualSaudiAcctInfoCaption(9, UserLang)
   frmIndividualSaudiAcctInfo.chkRentedCar.Caption = frmIndividualSaudiAcctInfoCaption(10, UserLang)
   frmIndividualSaudiAcctInfo.chkOwnCar.Caption = frmIndividualSaudiAcctInfoCaption(11, UserLang)
   frmIndividualSaudiAcctInfo.chkCompanyTransport.Caption = frmIndividualSaudiAcctInfoCaption(12, UserLang)
   frmIndividualSaudiAcctInfo.lblEmployerName.Caption = frmIndividualSaudiAcctInfoCaption(13, UserLang)
   frmIndividualSaudiAcctInfo.lblDepartment.Caption = frmIndividualSaudiAcctInfoCaption(14, UserLang)
   frmIndividualSaudiAcctInfo.lblEmployerPO.Caption = frmIndividualSaudiAcctInfoCaption(15, UserLang)
   frmIndividualSaudiAcctInfo.lblEmployerCity.Caption = frmIndividualSaudiAcctInfoCaption(16, UserLang)
   frmIndividualSaudiAcctInfo.lblEmployerZip.Caption = frmIndividualSaudiAcctInfoCaption(17, UserLang)
   frmIndividualSaudiAcctInfo.lblPackagedAccount.Caption = frmIndividualSaudiAcctInfoCaption(18, UserLang)
   'frmIndividualSaudiAcctInfo.lblInternetBank.Caption = frmIndividualSaudiAcctInfoCaption(51, UserLang)
   frmIndividualSaudiAcctInfo.lblCustomerAdvice.Caption = frmIndividualSaudiAcctInfoCaption(52, UserLang)
   frmIndividualSaudiAcctInfo.lblExcludeFrom.Caption = frmIndividualSaudiAcctInfoCaption(65, UserLang)
   frmIndividualSaudiAcctInfo.lblAtmFees.Caption = frmIndividualSaudiAcctInfoCaption(66, UserLang)
   frmIndividualSaudiAcctInfo.lblMinBalFees.Caption = frmIndividualSaudiAcctInfoCaption(67, UserLang)
   frmIndividualSaudiAcctInfo.optAtmFeeYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optAtmFeeNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.optMinBalFeeYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optMinBalFeeNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   
'   frmIndividualSaudiAcctInfo.optInternetYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
'   frmIndividualSaudiAcctInfo.optInternetNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.optCustAdviceYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optCustAdviceNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.lblCurrentAccount.Caption = frmIndividualSaudiAcctInfoCaption(21, UserLang)
   frmIndividualSaudiAcctInfo.optCurrentAcYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optCurrentAcNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.lblCurrentAcCurrency.Caption = frmIndividualSaudiAcctInfoCaption(22, UserLang)
   frmIndividualSaudiAcctInfo.lblCurrentAcStatus.Caption = frmIndividualSaudiAcctInfoCaption(23, UserLang)
   frmIndividualSaudiAcctInfo.lblCurrentAcStmtFreq.Caption = frmIndividualSaudiAcctInfoCaption(24, UserLang)
   frmIndividualSaudiAcctInfo.lblCurrentAcCheckBook.Caption = frmIndividualSaudiAcctInfoCaption(25, UserLang)
   frmIndividualSaudiAcctInfo.optCurrentAcCheckBookYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optCurrentAcCheckBookNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.lblSavingAcc.Caption = frmIndividualSaudiAcctInfoCaption(26, UserLang)
   frmIndividualSaudiAcctInfo.optSavingAcYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optSavingAcNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.lblSavingAcCurrency.Caption = frmIndividualSaudiAcctInfoCaption(22, UserLang)
   frmIndividualSaudiAcctInfo.lblSavingAcStatus.Caption = frmIndividualSaudiAcctInfoCaption(23, UserLang)
   frmIndividualSaudiAcctInfo.lblSavingAcStmtFreq.Caption = frmIndividualSaudiAcctInfoCaption(24, UserLang)
   frmIndividualSaudiAcctInfo.lblOtherAccount.Caption = frmIndividualSaudiAcctInfoCaption(27, UserLang)
   frmIndividualSaudiAcctInfo.lblOtherAccurrency.Caption = frmIndividualSaudiAcctInfoCaption(22, UserLang)
   frmIndividualSaudiAcctInfo.lblOtherAcStatus.Caption = frmIndividualSaudiAcctInfoCaption(23, UserLang)
   frmIndividualSaudiAcctInfo.lblOtherAcStmtFreq.Caption = frmIndividualSaudiAcctInfoCaption(24, UserLang)
   frmIndividualSaudiAcctInfo.lblOtherAccheckBook.Caption = frmIndividualSaudiAcctInfoCaption(25, UserLang)
   frmIndividualSaudiAcctInfo.optOtherAcCheckBookYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optOtherAcCheckBookNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.lblSingleOrJointAcc.Caption = frmIndividualSaudiAcctInfoCaption(28, UserLang)
   frmIndividualSaudiAcctInfo.OptSingle.Caption = frmIndividualSaudiAcctInfoCaption(29, UserLang)
   frmIndividualSaudiAcctInfo.optJoint.Caption = frmIndividualSaudiAcctInfoCaption(30, UserLang)
   frmIndividualSaudiAcctInfo.optUnidentified.Caption = frmIndividualSaudiAcctInfoCaption(59, UserLang)
   frmIndividualSaudiAcctInfo.lblNatureOfSign.Caption = frmIndividualSaudiAcctInfoCaption(31, UserLang)
   frmIndividualSaudiAcctInfo.optSignSingle.Caption = frmIndividualSaudiAcctInfoCaption(29, UserLang)
   frmIndividualSaudiAcctInfo.optSignJoint.Caption = frmIndividualSaudiAcctInfoCaption(30, UserLang)
   
   frmIndividualSaudiAcctInfo.lblUpdatedForSama.Caption = frmIndividualSaudiAcctInfoCaption(53, UserLang)
   frmIndividualSaudiAcctInfo.lblRelationshipManager.Caption = frmIndividualSaudiAcctInfoCaption(54, UserLang)
   frmIndividualSaudiAcctInfo.lblGeneralMemo.Caption = frmIndividualSaudiAcctInfoCaption(55, UserLang)
   frmIndividualSaudiAcctInfo.optSamaUpdYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optSamaUpdNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
  
   frmIndividualSaudiAcctInfo.lblPrimaryElectronIntlCard.Caption = frmIndividualSaudiAcctInfoCaption(33, UserLang)
   frmIndividualSaudiAcctInfo.optPrimaryElectronIntlCardYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optPrimaryElectronIntlCardNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.lblPrimaryElectronIntlCardName.Caption = frmIndividualSaudiAcctInfoCaption(32, UserLang)
   frmIndividualSaudiAcctInfo.lblSecondaryElectronIntlCard.Caption = frmIndividualSaudiAcctInfoCaption(34, UserLang)
   frmIndividualSaudiAcctInfo.optSecondaryElectronIntlCardYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   frmIndividualSaudiAcctInfo.optSecondaryElectronIntlCardNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   frmIndividualSaudiAcctInfo.lblSecondaryElectronIntlCardName.Caption = frmIndividualSaudiAcctInfoCaption(32, UserLang)
   frmIndividualSaudiAcctInfo.lblCardDeliveredTo.Caption = frmIndividualSaudiAcctInfoCaption(35, UserLang)
   frmIndividualSaudiAcctInfo.optCardDeliveredToReqBranch.Caption = frmIndividualSaudiAcctInfoCaption(37, UserLang)
   frmIndividualSaudiAcctInfo.optCardDeliveredToBranch.Caption = frmIndividualSaudiAcctInfoCaption(36, UserLang)
   frmIndividualSaudiAcctInfo.optCardDeliveredToPOBox.Caption = frmIndividualSaudiAcctInfoCaption(41, UserLang)
   frmIndividualSaudiAcctInfo.lblDeliveryAddress1.Caption = frmIndividualSaudiAcctInfoCaption(39, UserLang)
   frmIndividualSaudiAcctInfo.lblDeliveryAddress2.Caption = frmIndividualSaudiAcctInfoCaption(40, UserLang)
   frmIndividualSaudiAcctInfo.lblDeliveryPOBox.Caption = frmIndividualSaudiAcctInfoCaption(41, UserLang)
   frmIndividualSaudiAcctInfo.lblDeliveryCity.Caption = frmIndividualSaudiAcctInfoCaption(42, UserLang)
   frmIndividualSaudiAcctInfo.lblDeliveryZipCode.Caption = frmIndividualSaudiAcctInfoCaption(43, UserLang)
   frmIndividualSaudiAcctInfo.cmdPrevPage.Caption = frmIndividualSaudiAcctInfoCaption(44, UserLang)
   If updateAction Or tellerAction Then
      frmIndividualSaudiAcctInfo.cmdCreate.Caption = frmIndividualSaudiAcctInfoCaption(50, UserLang)
   Else
      frmIndividualSaudiAcctInfo.cmdCreate.Caption = frmIndividualSaudiAcctInfoCaption(45, UserLang)
   End If
   frmIndividualSaudiAcctInfo.cmdJointAcc.Caption = frmIndividualSaudiAcctInfoCaption(46, UserLang)
   frmIndividualSaudiAcctInfo.cmdCancel.Caption = frmIndividualSaudiAcctInfoCaption(47, UserLang)
   frmIndividualSaudiAcctInfo.cmdApprove.Caption = frmIndividualSaudiAcctInfoCaption(48, UserLang)
   frmIndividualSaudiAcctInfo.cmdReject.Caption = frmIndividualSaudiAcctInfoCaption(49, UserLang)
   frmIndividualSaudiAcctInfo.cmdDocuments.Caption = frmIndividualSaudiAcctInfoCaption(58, UserLang)
   frmIndividualSaudiAcctInfo.lblCardType.Caption = frmIndividualSaudiAcctInfoCaption(60, UserLang)
   frmIndividualSaudiAcctInfo.optIntlCard.Caption = frmIndividualSaudiAcctInfoCaption(61, UserLang)
   frmIndividualSaudiAcctInfo.optChipCard.Caption = frmIndividualSaudiAcctInfoCaption(62, UserLang)
   frmIndividualSaudiAcctInfo.lblMarketingMemo.Caption = frmIndividualSaudiAcctInfoCaption(63, UserLang)
   frmIndividualSaudiAcctInfo.cmdPrintAppln.Caption = frmIndividualSaudiAcctInfoCaption(64, UserLang)
   
   frmIndividualSaudiAcctInfo.lblFreezingGracePeriod.Caption = frmIndividualSaudiAcctInfoCaption(68, UserLang)
   frmIndividualSaudiAcctInfo.lblDays.Caption = errDays(UserLang)
   lblSegmentStmtOverride.Caption = frmIndividualSaudiAcctInfoCaption(69, UserLang)
   optSegmentStmtOverrideYes.Caption = frmIndividualSaudiAcctInfoCaption(56, UserLang)
   optSegmentStmtOverrideNo.Caption = frmIndividualSaudiAcctInfoCaption(57, UserLang)
   
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
          If UserLang = ENGLISH Then
             cmbDeliveryCity.AddItem rs("englishname")
          Else
             frmIndividualSaudiAcctInfo.cmbDeliveryCity.AddItem rs("englishname")
          End If
          rs.MoveNext
       Loop
   End If
   
   Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4) & "'")

   If frmIndividualSaudiAcctInfo.optCardDeliveredToBranch = True Then
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
         txtDeliveryAddr2 = "(*)" & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                             IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                             "BR.CODE:" & Mid$(frmIndividualSaudi.cmbBranchCode, 2, 3)
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
   
  Set rs = db.OpenRecordset("select * from segmentationinfo")
  If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbSegmentation.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbSegmentation.AddItem Right(rs("segmentationcode"), 1) & "-" & rs("englishname")
         Else
            cmbSegmentation.AddItem Right(rs("segmentationcode"), 1) & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If

  Set rs = db.OpenRecordset("select * from packageaccinfo")
  If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbPackageAcc.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbPackageAcc.AddItem Right(rs("packagetypecode"), 1) & "-" & rs("englishname")
         Else
            cmbPackageAcc.AddItem Right(rs("packagetypecode"), 1) & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   
   Set rs = db.OpenRecordset("select * from educationinfo")
  
   rs.MoveFirst
   cmbEducation.Clear
   Do While Not rs.EOF
      If UserLang = ENGLISH Then
         cmbEducation.AddItem rs("educationcode") & "-" & rs("englishname")
      Else
         cmbEducation.AddItem rs("educationcode") & "-" & rs("arabicname")
      End If
      rs.MoveNext
   Loop
   
   Set rs = db.OpenRecordset("select * from positioninfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbPosition.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbPosition.AddItem rs("positioncode") & "-" & rs("englishname")
         Else
            cmbPosition.AddItem rs("positioncode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   
   Set rs = db.OpenRecordset("select * from professioninfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbProfession.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbProfession.AddItem rs("professioncode") & "-" & rs("englishname")
         Else
            cmbProfession.AddItem rs("professioncode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
'      cmbProfession.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from monthlyincomeinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbMonthlyIncome.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbMonthlyIncome.AddItem rs("incomecode") & "-" & rs("englishname")
         Else
            cmbMonthlyIncome.AddItem rs("incomecode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
'      cmbMonthlyIncome.ListIndex = 0
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
   
   If supervisorAction Or searchAction Or custHistoryAction Then
      cmdCreate.Enabled = False
      framePackagedAcc.Enabled = False
      FrameAtmFees.Enabled = False
      frameMinBalFees.Enabled = False
      frameCustomerAdvice.Enabled = False
      FrameCustomerDetail2.Enabled = False
      FrameUpdateForSama.Enabled = False
      txtRelationshipManager.Enabled = False
      txtGeneralMemo.Enabled = False
      frameAccountDetails.Enabled = False
      framePkgStmtOverride.Enabled = False
      frameSingleJoint.Enabled = False
      FrameCardDetails.Enabled = False
      If optJoint.Value = True Then
         cmdJointAcc.Enabled = True
      Else
         cmdJointAcc.Enabled = False
      End If
   Else
      FrameCustomerDetail2.Enabled = True
      framePkgStmtOverride.Enabled = True
      If enableFeeExclusionUpd = True Then
         FrameAtmFees.Enabled = True
         frameMinBalFees.Enabled = True
      Else
         FrameAtmFees.Enabled = False
         frameMinBalFees.Enabled = False
      End If
      frameCustomerAdvice.Enabled = True
      If InStr(recvLoginMsg.authorityLevel, "~7") > 0 Then
         framePackagedAcc.Enabled = True
         txtMarketingMemo.Enabled = True
      Else
         framePackagedAcc.Enabled = False
         txtMarketingMemo.Enabled = False
      End If
      FrameUpdateForSama.Enabled = True
      'txtRelationshipManager.Enabled = True
      txtGeneralMemo.Enabled = True
      frameSingleJoint.Enabled = True
      If enableGeneralSamaUpd = True Then
         txtFreezingGracePeriod.Enabled = True
      Else
         txtFreezingGracePeriod.Enabled = False
      End If
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
         FrameCardDetails.Enabled = False
         frameAcSingleJoint.Enabled = False
      Else
         If tellerAction And _
            recvSaudiIndividualMsg.newOrUpdate = "U" Then
            frameAccountDetails.Enabled = False
            FrameCardDetails.Enabled = False
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
                  optCurrentAcCheckBookYes.Enabled = False
                  optCurrentAcCheckBookNo.Value = True
                  optOtherAcCheckBookNo.Value = True
                  optOtherAcCheckBookYes.Enabled = False
               End If
               If rs(1) = "1" And InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
                  FrameCardDetails.Enabled = True
               Else
                  FrameCardDetails.Enabled = False
               End If
            End If
         End If
         If tellerAction And recvSaudiIndividualMsg.newOrUpdate = "N" Then
            'FrameCardDetails.Enabled = True
            frameCardType.Enabled = False
            framePrimaryIntlCard.Enabled = False
            frameSuppIntlCard.Enabled = False
            If activityFlag = "P" Then
               cmdPrintAppln.Enabled = True
               cmdReject.Enabled = True
            Else
               cmdPrintAppln.Enabled = False
            End If
         End If
      End If
   End If

   
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      fillFrmIndividualSaudiAcctInfo
   End If
   
End Sub

Public Sub formatNewSaudiCustomerRequest()

    Dim mQry As String
    Dim tmpStr As String
    
    individualSaudiInfo.msgLen = Space(6) ' to be calculated
    individualSaudiInfo.service = "10"  ' 10 is for New customer creation
    'individualSaudiInfo.userId = gUserId
    
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 0
       individualSaudiInfo.userId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       individualSaudiInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       individualSaudiInfo.creationOrUpdate = "U"
       individualSaudiInfo.supervisorComments = recvSaudiIndividualMsg.supervisorComments
       individualSaudiInfo.supervisorId = Left(recvSaudiIndividualMsg.supervisorId, 10)
    Else
       individualSaudiInfo.dateTime = gDateTime
       individualSaudiInfo.userId = gUserId
       individualSaudiInfo.creationOrUpdate = "C"
       individualSaudiInfo.supervisorId = Space(10)
       individualSaudiInfo.supervisorComments = Space(200)
    End If
    If updateAction Or _
       (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
       individualSaudiInfo.NewOrUpdateFlag = "U"
    Else
       individualSaudiInfo.NewOrUpdateFlag = "N"
    End If
    
    If phoneCustOpenAction Then
       individualSaudiInfo.bmUpdateStatus = "4"  ' 4 for "Entered through phone"
       individualSaudiInfo.custOpenSource = "P"  ' customer opened through phone
    Else
       individualSaudiInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
       individualSaudiInfo.custOpenSource = "B"  ' customer opened through Branch
       If tellerAction And activityFlag = "P" Then
          individualSaudiInfo.branchCSOId = gUserId
          individualSaudiInfo.branchActionDateTime = branchActionDateTime
       Else
          individualSaudiInfo.branchCSOId = Space(10)
          individualSaudiInfo.branchActionDateTime = Space(14)
       End If
    End If
    
    individualSaudiInfo.branchCode = gBranchCode
    individualSaudiInfo.customerNo = frmIndividualSaudi.txtCustomerNo
    individualSaudiInfo.custBranchCode = Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4)
    If Len(RTrim(Mid$(frmIndividualSaudi.cmbAltBrCode, 1, 4))) = 0 Then
       individualSaudiInfo.altBranchCode = "0000"
    Else
       individualSaudiInfo.altBranchCode = Mid$(frmIndividualSaudi.cmbAltBrCode, 1, 4)
    End If
    
    individualSaudiInfo.samaMainCategory = mainCategoryCode
    individualSaudiInfo.samaSubCategory = subCategoryCode
    individualSaudiInfo.screenSetNo = screenSetNo
    individualSaudiInfo.idNo = frmIndividualSaudi.txtIdNo
    
    individualSaudiInfo.referenceReqdFor = "0000000000"
    
    If frmIndividualSaudi.chkBlind.Value = 1 Then
       Mid$(individualSaudiInfo.referenceReqdFor, 1, 1) = "1"
    End If
    If frmIndividualSaudi.chkVeiled.Value = 1 Then
       Mid$(individualSaudiInfo.referenceReqdFor, 2, 1) = "1"
    End If
    If frmIndividualSaudi.chkIncptPerson.Value = 1 Then
       Mid$(individualSaudiInfo.referenceReqdFor, 3, 1) = "1"
    End If
    If frmIndividualSaudi.chkMinor.Value = 1 Then
       Mid$(individualSaudiInfo.referenceReqdFor, 4, 1) = "1"
    End If
    If frmIndividualSaudi.chkMinorSpl.Value = 1 Then
       Mid$(individualSaudiInfo.referenceReqdFor, 5, 1) = "1"
    End If
    If frmIndividualSaudi.chkMentDisabled.Value = 1 Then
       Mid$(individualSaudiInfo.referenceReqdFor, 6, 1) = "1"
    End If
    
    If frmIndividualSaudi.optIdDateHijri Then
       individualSaudiInfo.idDateType = "0"
       individualSaudiInfo.idExpiryDateH = Format(frmIndividualSaudi.txtIdExpiryYear, "0000") & Format(frmIndividualSaudi.cmbIdExpiryMonth, "00") & Format(frmIndividualSaudi.cmbIdExpiryDate, "00")
       individualSaudiInfo.idIssueDateH = Format(frmIndividualSaudi.txtIdIssueYear, "0000") & Format(frmIndividualSaudi.cmbIdIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbIdIssueDate, "00")
       individualSaudiInfo.idIssueDateG = Space(8)
       individualSaudiInfo.idExpiryDateG = Space(8)
    Else
       individualSaudiInfo.idDateType = "1"
       individualSaudiInfo.idExpiryDateG = Format(frmIndividualSaudi.txtIdExpiryYear, "0000") & Format(frmIndividualSaudi.cmbIdExpiryMonth, "00") & Format(frmIndividualSaudi.cmbIdExpiryDate, "00")
       individualSaudiInfo.idIssueDateG = Format(frmIndividualSaudi.txtIdIssueYear, "0000") & Format(frmIndividualSaudi.cmbIdIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbIdIssueDate, "00")
       individualSaudiInfo.idIssueDateH = Space(8)
       individualSaudiInfo.idExpiryDateH = Space(8)
    End If
    
    individualSaudiInfo.idIssuedAt = frmIndividualSaudi.cmbIdIssuedAt.text
    
    '--PP Number--
    
    If Len(RTrim(frmIndividualSaudi.txtPPNumber)) <> 0 Then
        individualSaudiInfo.ppNo = frmIndividualSaudi.txtPPNumber
    Else
        individualSaudiInfo.ppNo = Space(15)
    End If
    
    If frmIndividualSaudi.optPPDateHijri Then
       individualSaudiInfo.ppDateType = "0"
       individualSaudiInfo.ppExpiryDateH = Format(frmIndividualSaudi.txtPPExpiryYear, "0000") & Format(frmIndividualSaudi.cmbPPExpiryMonth, "00") & Format(frmIndividualSaudi.cmbPPExpiryDate, "00")
       individualSaudiInfo.ppIssueDateH = Format(frmIndividualSaudi.txtPPIssueYear, "0000") & Format(frmIndividualSaudi.cmbPPIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbPPIssueDate, "00")
       individualSaudiInfo.ppIssueDateG = Space(8)
       individualSaudiInfo.ppExpiryDateG = Space(8)
    Else
       individualSaudiInfo.ppDateType = "1"
       individualSaudiInfo.ppExpiryDateG = Format(frmIndividualSaudi.txtPPExpiryYear, "0000") & Format(frmIndividualSaudi.cmbPPExpiryMonth, "00") + Format(frmIndividualSaudi.cmbPPExpiryDate, "00")
       individualSaudiInfo.ppIssueDateG = Format(frmIndividualSaudi.txtPPIssueYear, "0000") & Format(frmIndividualSaudi.cmbPPIssueMonth.text, "00") + Format(frmIndividualSaudi.cmbPPIssueDate, "00")
       individualSaudiInfo.ppIssueDateH = Space(8)
       individualSaudiInfo.ppExpiryDateH = Space(8)
    End If
    
    '-------------
    
    individualSaudiInfo.ppIssuedAt = frmIndividualSaudi.cmbPPIssuedAt.text
   
    '--Hafiza--
    
    If Len(RTrim(frmIndividualSaudi.txtHafNo)) <> 0 Then
        individualSaudiInfo.hafNo = frmIndividualSaudi.txtHafNo
    Else
        individualSaudiInfo.hafNo = Space(15)
    End If
    
    individualSaudiInfo.hafIssuedAt = frmIndividualSaudi.cmbHafIssuedAt.text
    
    If frmIndividualSaudi.optHafDateHijri Then
       individualSaudiInfo.hafDateType = "0"
       individualSaudiInfo.hafExpiryDateH = Format(frmIndividualSaudi.txtHafExpiryYear, "0000") & Format(frmIndividualSaudi.cmbHafExpiryMonth, "00") & Format(frmIndividualSaudi.cmbHafExpiryDate, "00")
       individualSaudiInfo.hafIssueDateH = Format(frmIndividualSaudi.txtHafIssueYear, "0000") & Format(frmIndividualSaudi.cmbHafIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbHafIssueDate, "00")
       individualSaudiInfo.hafIssueDateG = Space(8)
       individualSaudiInfo.hafExpiryDateG = Space(8)
    Else
       individualSaudiInfo.hafDateType = "1"
       individualSaudiInfo.hafExpiryDateG = Format(frmIndividualSaudi.txtHafExpiryYear, "0000") & Format(frmIndividualSaudi.cmbHafExpiryMonth, "00") & Format(frmIndividualSaudi.cmbHafExpiryDate, "00")
       individualSaudiInfo.hafIssueDateG = Format(frmIndividualSaudi.txtHafExpiryYear, "0000") & Format(frmIndividualSaudi.cmbHafExpiryMonth, "00") & Format(frmIndividualSaudi.cmbHafExpiryDate, "00")
       individualSaudiInfo.hafIssueDateH = Space(8)
       individualSaudiInfo.hafExpiryDateH = Space(8)
    End If
    '----------
    
    '--Family Regn No--
    
    If Len(RTrim(frmIndividualSaudi.txtFRNo)) <> 0 Then
        individualSaudiInfo.frNo = frmIndividualSaudi.txtFRNo
    Else
        individualSaudiInfo.frNo = Space(15)
    End If
    
    individualSaudiInfo.frIssuedAt = frmIndividualSaudi.cmbFRIssuedAt.text
    
    If frmIndividualSaudi.optFRDateHijri Then
       individualSaudiInfo.frDateType = "0"
       individualSaudiInfo.frExpiryDateH = Format(frmIndividualSaudi.txtFRExpiryYear, "0000") & Format(frmIndividualSaudi.cmbFRExpiryMonth, "00") & Format(frmIndividualSaudi.cmbFRExpiryDate, "00")
       individualSaudiInfo.frIssueDateH = Format(frmIndividualSaudi.txtFRIssueYear, "0000") & Format(frmIndividualSaudi.cmbFRIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbFRIssueDate, "00")
       individualSaudiInfo.frIssueDateG = Space(8)
       individualSaudiInfo.frExpiryDateG = Space(8)
    Else
       individualSaudiInfo.frDateType = "1"
       individualSaudiInfo.frExpiryDateG = Format(frmIndividualSaudi.txtFRExpiryYear, "0000") & Format(frmIndividualSaudi.cmbFRExpiryMonth, "00") & Format(frmIndividualSaudi.cmbFRExpiryDate, "00")
       individualSaudiInfo.frIssueDateG = Format(frmIndividualSaudi.txtFRIssueYear, "0000") & Format(frmIndividualSaudi.cmbFRIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbFRIssueDate, "00")
       individualSaudiInfo.frIssueDateH = Space(8)
       individualSaudiInfo.frExpiryDateH = Space(8)
    End If
    
   '--Family Regn No--
    
    If Len(RTrim(frmIndividualSaudi.txtFRNo)) <> 0 Then
        individualSaudiInfo.frNo = frmIndividualSaudi.txtFRNo
    Else
        individualSaudiInfo.frNo = Space(15)
    End If
    
    individualSaudiInfo.frIssuedAt = frmIndividualSaudi.cmbFRIssuedAt.text
    
    If frmIndividualSaudi.optFRDateHijri Then
       individualSaudiInfo.frDateType = "0"
       individualSaudiInfo.frExpiryDateH = Format(frmIndividualSaudi.txtFRExpiryYear, "0000") & Format(frmIndividualSaudi.cmbFRExpiryMonth, "00") & Format(frmIndividualSaudi.cmbFRExpiryDate, "00")
       individualSaudiInfo.frIssueDateH = Format(frmIndividualSaudi.txtFRIssueYear, "0000") & Format(frmIndividualSaudi.cmbFRIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbFRIssueDate, "00")
       individualSaudiInfo.frIssueDateG = Space(8)
       individualSaudiInfo.frExpiryDateG = Space(8)
    Else
       individualSaudiInfo.frDateType = "1"
       individualSaudiInfo.frExpiryDateG = Format(frmIndividualSaudi.txtFRExpiryYear, "0000") & Format(frmIndividualSaudi.cmbFRExpiryMonth, "00") & Format(frmIndividualSaudi.cmbFRExpiryDate, "00")
       individualSaudiInfo.frIssueDateG = Format(frmIndividualSaudi.txtFRIssueYear, "0000") & Format(frmIndividualSaudi.cmbFRIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbFRIssueDate, "00")
       individualSaudiInfo.frIssueDateH = Space(8)
       individualSaudiInfo.frExpiryDateH = Space(8)
    End If
    
    '--Sama Auth No--
    
    If Len(RTrim(frmIndividualSaudi.txtSamaAuthNo)) <> 0 Then
        individualSaudiInfo.samaAuthNo = frmIndividualSaudi.txtSamaAuthNo
    Else
        individualSaudiInfo.samaAuthNo = Space(15)
    End If
    
    individualSaudiInfo.samaAuthIssuedAt = frmIndividualSaudi.cmbSamaAuthIssuedAt.text
    
    If frmIndividualSaudi.optSamaAuthDateHijri Then
       individualSaudiInfo.samaAuthDateType = "0"
       individualSaudiInfo.samaAuthExpiryDateH = Format(frmIndividualSaudi.txtSamaAuthExpiryYear, "0000") & Format(frmIndividualSaudi.cmbSamaAuthExpiryMonth, "00") & Format(frmIndividualSaudi.cmbSamaAuthExpiryDate, "00")
       individualSaudiInfo.samaAuthIssueDateH = Format(frmIndividualSaudi.txtSamaAuthIssueYear, "0000") & Format(frmIndividualSaudi.cmbSamaAuthIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbSamaAuthIssueDate, "00")
       individualSaudiInfo.samaAuthIssueDateG = Space(8)
       individualSaudiInfo.samaAuthExpiryDateG = Space(8)
    Else
       individualSaudiInfo.samaAuthDateType = "1"
       individualSaudiInfo.samaAuthExpiryDateG = Format(frmIndividualSaudi.txtSamaAuthExpiryYear, "0000") & Format(frmIndividualSaudi.cmbSamaAuthExpiryMonth, "00") & Format(frmIndividualSaudi.cmbSamaAuthExpiryDate, "00")
       individualSaudiInfo.samaAuthIssueDateG = Format(frmIndividualSaudi.txtSamaAuthIssueYear, "0000") & Format(frmIndividualSaudi.cmbSamaAuthIssueMonth.text, "00") & Format(frmIndividualSaudi.cmbSamaAuthIssueDate, "00")
       individualSaudiInfo.samaAuthIssueDateH = Space(8)
       individualSaudiInfo.samaAuthExpiryDateH = Space(8)
    End If
    '----------
    If subCategoryCode = "01" Or subCategoryCode = "69" Or subCategoryCode = "65" Then
        frmIndividualSaudi.txtCOBNo.Enabled = False
        individualSaudiInfo.certBirthNo = Space(15)
    Else
        individualSaudiInfo.certBirthNo = frmIndividualSaudi.txtCOBNo.text
    End If
    
    If frmIndividualSaudi.optLangArabic Then
       individualSaudiInfo.langPref = "0"
    Else
       individualSaudiInfo.langPref = "1"
    End If
    
    individualSaudiInfo.nationality = "001" ' Individual Saudi
    individualSaudiInfo.titleCode = Left$(frmIndividualSaudi.cmbTitle.text, 2)
    individualSaudiInfo.aFirstName = frmIndividualSaudi.txtArabFirstName
    individualSaudiInfo.a2ndName = frmIndividualSaudi.txtArabic2ndName
    individualSaudiInfo.a3rdName = frmIndividualSaudi.txtArabic3rdName
    individualSaudiInfo.aLastName = frmIndividualSaudi.txtArabLastName
    individualSaudiInfo.aShortName = frmIndividualSaudi.txtArabShortName
    individualSaudiInfo.eFirstName = frmIndividualSaudi.txtEngFirstName
    individualSaudiInfo.e2ndName = frmIndividualSaudi.txtEnglish2ndName
    individualSaudiInfo.e3rdName = frmIndividualSaudi.txtEnglish3rdName
    individualSaudiInfo.eLastName = frmIndividualSaudi.txtEngLastName
    individualSaudiInfo.eShortName = frmIndividualSaudi.txtEngShortName
    If frmIndividualSaudi.optDOBGreg Then
       individualSaudiInfo.dobDateG = Format(frmIndividualSaudi.txtDobYear, "0000") & Format(frmIndividualSaudi.cmbDobMonth, "00") & Format(frmIndividualSaudi.cmbDobDate, "00")
       individualSaudiInfo.dobDateType = "1"
       individualSaudiInfo.dobDateH = Space(8)
    Else
       individualSaudiInfo.dobDateH = Format(frmIndividualSaudi.txtDobYear, "0000") & Format(frmIndividualSaudi.cmbDobMonth, "00") & Format(frmIndividualSaudi.cmbDobDate, "00")
       individualSaudiInfo.dobDateType = "0"
       individualSaudiInfo.dobDateG = Space(8)
    End If
    If frmIndividualSaudi.optGenderMale Then
       individualSaudiInfo.sexCode = "0"
    Else
       individualSaudiInfo.sexCode = "1"
    End If
    If frmIndividualSaudi.optVipYes Then
        individualSaudiInfo.vipCode = "1"
    Else
        individualSaudiInfo.vipCode = "0"
    End If
    If frmIndividualSaudi.optMarried Then
       individualSaudiInfo.maritalStatus = "0"    ' Married
    ElseIf frmIndividualSaudi.OptSingle Then
       individualSaudiInfo.maritalStatus = "1"    ' Single
    Else
       individualSaudiInfo.maritalStatus = "2"    ' Others
    End If
    individualSaudiInfo.noOfDependents = frmIndividualSaudi.txtDependents
    If frmIndividualSaudi.optResident Then
       individualSaudiInfo.residentStatus = "0"
    Else
       individualSaudiInfo.residentStatus = "1"
    End If
    individualSaudiInfo.businessType = Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3)
    
    If frmIndividualSaudi.optSaudiPost = True Then
       individualSaudiInfo.addressType = "1"
'       individualSaudiInfo.address1 = Format(frmIndividualSaudi.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
'                                      frmIndividualSaudi.txtSaudiPostStreetName
       individualSaudiInfo.address1 = Format(frmIndividualSaudi.txtSaudiPostGPSNo, "!@@@@@") & " " & _
                                      frmIndividualSaudi.txtSaudiPostStreetName
       individualSaudiInfo.poBox = frmIndividualSaudi.txtSaudiPostUnit
       individualSaudiInfo.zipCode = Format(frmIndividualSaudi.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                                     frmIndividualSaudi.txtSaudiPostAdditionalNo
       individualSaudiInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       individualSaudiInfo.addressType = "0"
       individualSaudiInfo.address1 = frmIndividualSaudi.txtAddress1
       individualSaudiInfo.address2 = frmIndividualSaudi.txtAddress2
       individualSaudiInfo.poBox = frmIndividualSaudi.txtPOBox
       individualSaudiInfo.zipCode = frmIndividualSaudi.txtPinCode
       individualSaudiInfo.country = Left$(frmIndividualSaudi.cmbCountry.text, 3)
    End If
    
    If UserLang = ENGLISH And _
       individualSaudiInfo.langPref = "0" Then ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                             frmIndividualSaudi.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          individualSaudiInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
       Else
          individualSaudiInfo.cityName = frmIndividualSaudi.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       individualSaudiInfo.langPref = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmIndividualSaudi.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          individualSaudiInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
       Else
          individualSaudiInfo.cityName = frmIndividualSaudi.cmbCity.text
       End If
    Else
        individualSaudiInfo.cityName = frmIndividualSaudi.cmbCity.text
    End If
    
    individualSaudiInfo.telOffAreaCode = frmIndividualSaudi.txtOffPhoneCityCode
    individualSaudiInfo.telOffNo = frmIndividualSaudi.txtOffPhoneNo
    individualSaudiInfo.telOffExt = frmIndividualSaudi.txtOffPhoneExt
    individualSaudiInfo.telHomeAreaCode = frmIndividualSaudi.txtResPhoneCityCode
    individualSaudiInfo.telHomeNo = frmIndividualSaudi.txtResPhoneNo
    individualSaudiInfo.telHomeExt = frmIndividualSaudi.txtResPhoneExt
    individualSaudiInfo.faxAreaCode = frmIndividualSaudi.txtFaxCityCode
    individualSaudiInfo.faxNo = frmIndividualSaudi.txtFaxNo
    individualSaudiInfo.faxExt = frmIndividualSaudi.txtFaxExt
    If Len(RTrim(frmIndividualSaudi.txtMobileNo)) <> 0 Then
       individualSaudiInfo.mobileNo = frmIndividualSaudi.txtMobileAreaCode & frmIndividualSaudi.txtMobileNo
    Else
       individualSaudiInfo.mobileNo = Space(10)
    End If
    individualSaudiInfo.pagerNo = frmIndividualSaudi.txtPagerNo
    individualSaudiInfo.eMail = frmIndividualSaudi.txtEmailAddress
    
    individualSaudiInfo.educationCode = Mid$(frmIndividualSaudiAcctInfo.cmbEducation.text, 3, 2)
    individualSaudiInfo.professionCode = Mid$(frmIndividualSaudiAcctInfo.cmbProfession.text, 3, 2)
    individualSaudiInfo.positionCode = Mid$(frmIndividualSaudiAcctInfo.cmbPosition.text, 3, 2)
    individualSaudiInfo.monthlyIncome = Mid$(frmIndividualSaudiAcctInfo.cmbMonthlyIncome.text, 3, 2)
    individualSaudiInfo.segmentation = Mid$(frmIndividualSaudiAcctInfo.cmbSegmentation, 1, 1)
    individualSaudiInfo.ownerShip = "0000000000"
    If frmIndividualSaudiAcctInfo.chkRentedHouse.Value = 1 Then
       Mid$(individualSaudiInfo.ownerShip, 1, 1) = "1"
    End If
    If frmIndividualSaudiAcctInfo.chkOwnHouse.Value = 1 Then
       Mid$(individualSaudiInfo.ownerShip, 2, 1) = "1"
    End If
    If frmIndividualSaudiAcctInfo.chkCompanyAcc.Value = 1 Then
       Mid$(individualSaudiInfo.ownerShip, 3, 1) = "1"
    End If
    If frmIndividualSaudiAcctInfo.chkRentedCar.Value = 1 Then
       Mid$(individualSaudiInfo.ownerShip, 4, 1) = "1"
    End If
    If frmIndividualSaudiAcctInfo.chkOwnCar.Value = 1 Then
       Mid$(individualSaudiInfo.ownerShip, 5, 1) = "1"
    End If
    If frmIndividualSaudiAcctInfo.chkCompanyTransport.Value = 1 Then
       Mid$(individualSaudiInfo.ownerShip, 6, 1) = "1"
    End If
     
    individualSaudiInfo.employerName = frmIndividualSaudiAcctInfo.txtEmployerName
    individualSaudiInfo.department = frmIndividualSaudiAcctInfo.txtDepartment
    individualSaudiInfo.employerPoBox = frmIndividualSaudiAcctInfo.txtEmployerPOBox
    individualSaudiInfo.employerCity = frmIndividualSaudiAcctInfo.txtEmployerCity
    individualSaudiInfo.employerZipCode = frmIndividualSaudiAcctInfo.txtEmployerZipcode
    
    individualSaudiInfo.documents = Format(documentsSelected, "!" & String(60, "@"))
    individualSaudiInfo.documentOther = Format(otherDocumentsEntered, "!" & String(50, "@"))
   
    individualSaudiInfo.packagedAcc = Mid$(frmIndividualSaudiAcctInfo.cmbPackageAcc.text, 1, 1)
    If Len(RTrim(individualSaudiInfo.packagedAcc)) = 0 Then
       individualSaudiInfo.packagedAcc = "0"
    End If
    
    individualSaudiInfo.internetBankAcc = "0"
    
'    If frmIndividualSaudiAcctInfo.optInternetYes Then
'       individualSaudiInfo.internetBankAcc = "1"
'    Else
'       individualSaudiInfo.internetBankAcc = "0"
'    End If
    If frmIndividualSaudiAcctInfo.optAtmFeeYes Then
       individualSaudiInfo.excludeFromAtmFees = "1"
    Else
       individualSaudiInfo.excludeFromAtmFees = "0"
    End If
    
    If frmIndividualSaudiAcctInfo.optMinBalFeeYes Then
       individualSaudiInfo.excludeFromMinBalFees = "1"
    Else
       individualSaudiInfo.excludeFromMinBalFees = "0"
    End If
    
    If frmIndividualSaudiAcctInfo.optCustAdviceYes Then
       individualSaudiInfo.custAdviceFlag = "1"
    Else
       individualSaudiInfo.custAdviceFlag = "0"
    End If
    
    If frmIndividualSaudiAcctInfo.OptSingle Then
       individualSaudiInfo.singleJointAcc = "0" 'Single
    ElseIf frmIndividualSaudiAcctInfo.optJoint Then
       individualSaudiInfo.singleJointAcc = "1" 'Joint
    Else
       individualSaudiInfo.singleJointAcc = "2" 'unidentified
    End If
    If frmIndividualSaudiAcctInfo.optSignSingle Then
       individualSaudiInfo.signatureNature = "0"
    Else
       individualSaudiInfo.signatureNature = "1"
    End If
    If tellerAction And activityFlag <> "P" Then
       individualSaudiInfo.noOfJointAcc = recvSaudiIndividualMsg.noOfJointAcc
    Else
       individualSaudiInfo.noOfJointAcc = Format(noOfJoint, "00")
    End If
    individualSaudiInfo.jointAccNameOnCheck = Format(frmJointAccName.txtJointAccNameOnCheck, "!" & String(30, "@")) & Format(frmJointAccName.txtJointAccNameOnCheck1, "!" & String(30, "@"))
    individualSaudiInfo.jointAccNameOnReports = Format(frmJointAccName.txtJointAccNameOnReports, "!" & String(30, "@"))
    
    individualSaudiInfo.electronIntlRequired = "0"
    individualSaudiInfo.electronIntlName = Space(26)
    individualSaudiInfo.electronIntlSuppRequired = "0"
    individualSaudiInfo.electronIntlSuppName = Space(26)
    If frmIndividualSaudiAcctInfo.optChipCard = True Then
       individualSaudiInfo.cardType = "S"
    Else
       individualSaudiInfo.cardType = "I"
    End If
    
    If frmIndividualSaudiAcctInfo.optPrimaryElectronIntlCardYes Then
       individualSaudiInfo.electronIntlRequired = "1"
    Else
       individualSaudiInfo.electronIntlRequired = "0"
    End If
    individualSaudiInfo.electronIntlName = frmIndividualSaudiAcctInfo.txtPrimaryElectronIntlCardName
    If frmIndividualSaudiAcctInfo.optSecondaryElectronIntlCardYes Then
       individualSaudiInfo.electronIntlSuppRequired = "1"
    Else
       individualSaudiInfo.electronIntlSuppRequired = "0"
    End If
    individualSaudiInfo.electronIntlSuppName = frmIndividualSaudiAcctInfo.txtSecondaryElectronIntlCardName
    If frmIndividualSaudiAcctInfo.optCardDeliveredToBranch Then
       individualSaudiInfo.deliveryToBranchOrPO = "C"
    ElseIf frmIndividualSaudiAcctInfo.optCardDeliveredToReqBranch Then
       individualSaudiInfo.deliveryToBranchOrPO = "R"
    ElseIf frmIndividualSaudiAcctInfo.optCardDeliveredToPOBox = True Then
       individualSaudiInfo.deliveryToBranchOrPO = "P"
    Else
       individualSaudiInfo.deliveryToBranchOrPO = "G"  ' GPS
    End If
    If individualSaudiInfo.NewOrUpdateFlag = "N" Then
       individualSaudiInfo.updateCardAddressReqd = "0"
    End If
    If individualSaudiInfo.updateCardAddressReqd <> "1" Then
       If frmIndividualSaudiAcctInfo.optCurrentAcYes.Value Then
          individualSaudiInfo.deliveryAddress2 = frmIndividualSaudiAcctInfo.txtDeliveryAddr2
       Else
          individualSaudiInfo.deliveryAddress2 = Space(30)
       End If
       individualSaudiInfo.deliveryCity = frmIndividualSaudiAcctInfo.cmbDeliveryCity.text
       If frmIndividualSaudiAcctInfo.optCardDeliveredToGPS = False Then
          individualSaudiInfo.deliveryAddress1 = frmIndividualSaudiAcctInfo.txtDeliveryAddr1
          individualSaudiInfo.deliveryPoBox = frmIndividualSaudiAcctInfo.txtDeliveryPOBox
          individualSaudiInfo.deliveryZip = frmIndividualSaudiAcctInfo.txtDeliveryZipcode
       Else ' GPS address is selected
          'individualSaudiInfo.deliveryAddress1 = Format(frmIndividualSaudiAcctInfo.txtGPSNo, "!@@@@@") & "-" & _
          '                                       frmIndividualSaudiAcctInfo.txtGPSStreetName
          individualSaudiInfo.deliveryAddress1 = Format(frmIndividualSaudiAcctInfo.txtGPSNo, "!@@@@@") & " " & _
                                                 frmIndividualSaudiAcctInfo.txtGPSStreetName
          individualSaudiInfo.deliveryPoBox = frmIndividualSaudiAcctInfo.txtGPSUnit
          individualSaudiInfo.deliveryZip = Format(frmIndividualSaudiAcctInfo.txtGPSZipCode, "!@@@@@") & "-" & _
                                            frmIndividualSaudiAcctInfo.txtGPSAdditionalNo
       End If
    End If
    
    If frmIndividualSaudiAcctInfo.optSamaUpdYes = True Then
       individualSaudiInfo.updatedForSama = "1"
    Else
       individualSaudiInfo.updatedForSama = "0"
    End If
    If Len(RTrim(frmIndividualSaudiAcctInfo.txtRelationshipManager)) = 0 Then
       individualSaudiInfo.relationshipManager = Space(25)
    Else
       individualSaudiInfo.relationshipManager = frmIndividualSaudiAcctInfo.txtRelationshipManager
    End If
    If Len(RTrim(frmIndividualSaudiAcctInfo.txtGeneralMemo)) = 0 Then
       individualSaudiInfo.generalMemo = Space(25)
    Else
       individualSaudiInfo.generalMemo = frmIndividualSaudiAcctInfo.txtGeneralMemo
    End If
    
    If Len(RTrim(frmIndividualSaudiAcctInfo.txtMarketingMemo)) = 0 Then
       individualSaudiInfo.marketingMemo = Space(25)
    Else
       individualSaudiInfo.marketingMemo = frmIndividualSaudiAcctInfo.txtMarketingMemo
    End If
    
    If activityFlag = "P" Then
       individualSaudiInfo.activityFlag = "P"
    Else
       individualSaudiInfo.activityFlag = Space(1)
    End If
    
    individualSaudiInfo.accFreezingGracePeriod = Format(txtFreezingGracePeriod, "000")
    
    If frmIndividualSaudiAcctInfo.optSegmentStmtOverrideYes = True Then
       individualSaudiInfo.pkgStmtFreqOverride = "1"
    Else
       individualSaudiInfo.pkgStmtFreqOverride = "1"
    End If
    
End Sub

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
  
  frmPrintAccOpeningCard.txtCustNo = frmIndividualSaudi.txtCustomerNo
  If frmIndividualSaudi.optLangArabic Then
     custName = Trim(frmIndividualSaudi.txtArabFirstName) & " " & _
                Trim(frmIndividualSaudi.txtArabic2ndName) & " " & _
                Trim(frmIndividualSaudi.txtArabLastName)
     frmPrintAccOpeningCard.optLangArabic = True
     customerLang = 0
     frmPrintAccOpeningCard.assignNameToGlobalVar frmIndividualSaudi.txtArabFirstName, frmIndividualSaudi.txtArabic2ndName, frmIndividualSaudi.txtArabLastName
  Else
     custName = Trim(frmIndividualSaudi.txtEngFirstName) & " " & _
                Trim(frmIndividualSaudi.txtEnglish2ndName) & " " & _
                Trim(frmIndividualSaudi.txtEngLastName)
     frmPrintAccOpeningCard.optLangEnglish = True
     customerLang = 1
     frmPrintAccOpeningCard.assignNameToGlobalVar frmIndividualSaudi.txtEngFirstName, frmIndividualSaudi.txtEnglish2ndName, frmIndividualSaudi.txtEngLastName
  End If
  
  frmPrintAccOpeningCard.txtCustName = custName
  
  If optCurrentAcYes Or optSavingAcYes Or Mid$(cmbOtherAccount, 1, 3) > "000" Then
     accountNo = Right(recvSuperDecisionMsg.ibanAccNo, 14)
  Else
     accountNo = recvSuperDecisionMsg.custNo
  End If
  custBranchCode = Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4)
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
