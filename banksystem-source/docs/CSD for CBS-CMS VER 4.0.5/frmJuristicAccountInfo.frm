VERSION 5.00
Begin VB.Form frmJuristicAccountInfo 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account Details"
   ClientHeight    =   8745
   ClientLeft      =   -105
   ClientTop       =   330
   ClientWidth     =   12060
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8745
   ScaleWidth      =   12060
   Begin VB.TextBox txtFreezingGracePeriod 
      BackColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   6690
      MaxLength       =   3
      TabIndex        =   103
      Tag             =   "9975"
      Top             =   3615
      Width           =   615
   End
   Begin VB.TextBox txtMarketingMemo 
      Height          =   285
      Left            =   1680
      MaxLength       =   25
      TabIndex        =   29
      Tag             =   "11775"
      Top             =   3600
      Width           =   2970
   End
   Begin VB.CommandButton cmdReject 
      BackColor       =   &H00BFD87E&
      Caption         =   "Reject"
      Height          =   435
      Left            =   4650
      MaskColor       =   &H00BFD87E&
      TabIndex        =   46
      ToolTipText     =   "Reject"
      Top             =   6240
      Width           =   1620
   End
   Begin VB.CommandButton cmdApprove 
      BackColor       =   &H00BFD87E&
      Caption         =   "Approve"
      Height          =   435
      Left            =   3030
      MaskColor       =   &H00BFD87E&
      TabIndex        =   45
      ToolTipText     =   "Approve"
      Top             =   6240
      Width           =   1620
   End
   Begin VB.CommandButton cmdPrevPage 
      Caption         =   "&Previous Page"
      Height          =   435
      Left            =   480
      TabIndex        =   100
      ToolTipText     =   "Previous Page"
      Top             =   6240
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   435
      Left            =   10320
      TabIndex        =   50
      ToolTipText     =   "Cancel"
      Top             =   6240
      Width           =   1215
   End
   Begin VB.CommandButton cmdSignatory 
      Caption         =   "&Signatory Details"
      Height          =   435
      Left            =   8940
      TabIndex        =   49
      ToolTipText     =   "Signatory Details"
      Top             =   6240
      Width           =   1380
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "&Create"
      Height          =   435
      Left            =   1680
      TabIndex        =   44
      ToolTipText     =   "Create"
      Top             =   6240
      Width           =   1335
   End
   Begin VB.CommandButton cmdOwner 
      Caption         =   "&Owner Details"
      Height          =   435
      Left            =   6270
      TabIndex        =   47
      ToolTipText     =   "Owner Details"
      Top             =   6240
      Width           =   1335
   End
   Begin VB.CommandButton cmdDocuments 
      Caption         =   "&Documents"
      Height          =   435
      Left            =   7605
      TabIndex        =   48
      ToolTipText     =   "Documents"
      Top             =   6240
      Width           =   1335
   End
   Begin VB.Frame FrameUpdateForSama 
      BackColor       =   &H00BFD87E&
      Height          =   450
      Left            =   1440
      TabIndex        =   98
      Top             =   2520
      Width           =   1575
      Begin VB.OptionButton optSamaUpdYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   195
         Left            =   120
         TabIndex        =   19
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   165
         Width           =   735
      End
      Begin VB.OptionButton optSamaUpdNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   20
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   150
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.Frame FrameInternetFlag 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1440
      TabIndex        =   97
      Top             =   3000
      Width           =   1575
      Begin VB.OptionButton optInternetNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   24
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   165
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optInternetYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   23
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   135
         Width           =   735
      End
   End
   Begin VB.TextBox txtGeneralMemo 
      Height          =   285
      Left            =   8805
      MaxLength       =   30
      TabIndex        =   22
      Top             =   2640
      Width           =   2970
   End
   Begin VB.TextBox txtRelationshipManager 
      Enabled         =   0   'False
      Height          =   285
      Left            =   4800
      MaxLength       =   30
      TabIndex        =   21
      Top             =   2655
      Width           =   2655
   End
   Begin VB.Frame frameCustomerAdvice 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   4680
      TabIndex        =   91
      Top             =   3000
      Width           =   1680
      Begin VB.OptionButton optCustAdviceYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   25
         Tag             =   "1680"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   855
      End
      Begin VB.OptionButton optCustAdviceNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   960
         TabIndex        =   26
         Tag             =   "1680"
         ToolTipText     =   "No"
         Top             =   165
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.Frame frameSignSingleJoint 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   8685
      TabIndex        =   89
      Top             =   3000
      Width           =   2295
      Begin VB.OptionButton optSignSingle 
         BackColor       =   &H00BFD87E&
         Caption         =   "Single"
         Height          =   255
         Left            =   120
         TabIndex        =   27
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
         TabIndex        =   28
         Tag             =   "2295"
         ToolTipText     =   "Joint"
         Top             =   165
         Width           =   855
      End
   End
   Begin VB.Frame FrameHomeCountryAddress 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   120
      TabIndex        =   77
      Top             =   720
      Width           =   11775
      Begin VB.ComboBox cmbHomeCity 
         Height          =   315
         Left            =   3120
         TabIndex        =   3
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   360
         Width           =   2055
      End
      Begin VB.TextBox txtHomePager 
         Height          =   285
         Left            =   4875
         MaxLength       =   10
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   1080
         Width           =   1335
      End
      Begin VB.TextBox txtHomeResPhoneCityCode 
         Height          =   285
         Left            =   4920
         MaxLength       =   4
         TabIndex        =   9
         Tag             =   "11775"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtHomeFaxAreaCode 
         Height          =   285
         Left            =   9450
         MaxLength       =   4
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtHomeMobileAreaCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1275
         MaxLength       =   2
         TabIndex        =   15
         TabStop         =   0   'False
         Tag             =   "11775"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtHomeOffPhoneCityCode 
         Height          =   285
         Left            =   1275
         MaxLength       =   4
         TabIndex        =   6
         Tag             =   "11775"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtHomeEmail 
         Height          =   285
         Left            =   8370
         MaxLength       =   30
         TabIndex        =   18
         Tag             =   "11775"
         Top             =   1080
         Width           =   3255
      End
      Begin VB.TextBox txtHomeFaxExt 
         Height          =   285
         Left            =   11130
         MaxLength       =   4
         TabIndex        =   14
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtHomeFaxNo 
         Height          =   285
         Left            =   9810
         MaxLength       =   10
         TabIndex        =   13
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtHomeResPhoneExt 
         Height          =   285
         Left            =   6810
         MaxLength       =   4
         TabIndex        =   11
         Tag             =   "11775"
         Text            =   " "
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtHomeOffPhoneExt 
         Height          =   285
         Left            =   3075
         MaxLength       =   4
         TabIndex        =   8
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtHomeMobileNo 
         Height          =   285
         Left            =   1755
         MaxLength       =   10
         TabIndex        =   16
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtHomeResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   10
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtHomeOffPhoneNo 
         Height          =   285
         Left            =   1755
         MaxLength       =   10
         TabIndex        =   7
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbHomeCountry 
         Height          =   315
         Left            =   9465
         TabIndex        =   5
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   360
         Width           =   2175
      End
      Begin VB.TextBox txtHomeZipCode 
         Height          =   285
         Left            =   6210
         MaxLength       =   10
         TabIndex        =   4
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox txtHomePoBox 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Height          =   285
         Left            =   1275
         MaxLength       =   10
         TabIndex        =   2
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox txtHomeAddress2 
         Height          =   285
         Left            =   4725
         MaxLength       =   30
         TabIndex        =   1
         Tag             =   "11775"
         Top             =   0
         Width           =   3675
      End
      Begin VB.TextBox txtHomeAddress1 
         Height          =   285
         Left            =   1275
         MaxLength       =   30
         TabIndex        =   0
         Tag             =   "11775"
         Top             =   0
         Width           =   2865
      End
      Begin VB.Label lblHomePager 
         BackColor       =   &H00BFD87E&
         Caption         =   "Pager"
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
         Left            =   3675
         TabIndex        =   88
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
      Begin VB.Label lblHomeEmail 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "E-Mail"
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
         Left            =   7200
         TabIndex        =   87
         Tag             =   "11775"
         Top             =   1140
         Width           =   1140
      End
      Begin VB.Label lblHomeFax 
         BackColor       =   &H00BFD87E&
         Caption         =   "Fax"
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
         Left            =   7635
         TabIndex        =   86
         Tag             =   "11775"
         Top             =   750
         Width           =   495
      End
      Begin VB.Label lblHomeMobileNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Mobile"
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
         Tag             =   "11775"
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label lblHomePhoneRes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Phone(Res.)"
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
         Left            =   3675
         TabIndex        =   84
         Tag             =   "11775"
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label lblHomePhoneOff 
         BackColor       =   &H00BFD87E&
         Caption         =   "Phone(Off)"
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
         TabIndex        =   83
         Tag             =   "11775"
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label lblHomeCountry 
         BackColor       =   &H00BFD87E&
         Caption         =   "Country"
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
         Left            =   7635
         TabIndex        =   82
         Tag             =   "11775"
         Top             =   360
         Width           =   1125
      End
      Begin VB.Label lblHomeZipCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Zip Code"
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
         Left            =   5160
         TabIndex        =   81
         Tag             =   "11775"
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label lblHomeCity 
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
         Left            =   2520
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   360
         Width           =   615
      End
      Begin VB.Label lblHomePoBox 
         BackColor       =   &H00BFD87E&
         Caption         =   "P.O. Box"
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
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   420
         Width           =   1215
      End
      Begin VB.Label lblHomeCountryAddress 
         BackColor       =   &H00BFD87E&
         Caption         =   "Home Country Address"
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
         Height          =   390
         Left            =   0
         TabIndex        =   78
         Tag             =   "11775"
         Top             =   -15
         Width           =   1275
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Frame frameAccountDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1455
      Left            =   120
      TabIndex        =   52
      Top             =   4155
      Width           =   11775
      Begin VB.Frame frameCurrentAcc 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1200
         TabIndex        =   60
         Tag             =   "11775"
         Top             =   0
         Width           =   1455
         Begin VB.OptionButton optCurrentAcNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   31
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
            TabIndex        =   30
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
         TabIndex        =   32
         Tag             =   "11775"
         Top             =   120
         Width           =   1455
      End
      Begin VB.ComboBox cmbCurrentAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   34
         Top             =   120
         Width           =   975
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00BFD87E&
         Height          =   435
         Left            =   10215
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   0
         Width           =   1395
         Begin VB.OptionButton optCurrentAcCheckBookNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   36
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
            TabIndex        =   35
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   150
            Width           =   615
         End
      End
      Begin VB.Frame frameSavingAcc 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1200
         TabIndex        =   58
         Tag             =   "11775"
         Top             =   480
         Width           =   1455
         Begin VB.OptionButton optSavingAcNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   38
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
            TabIndex        =   37
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
         TabIndex        =   39
         Tag             =   "11775"
         Top             =   600
         Width           =   1455
      End
      Begin VB.ComboBox cmbSavingAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   600
         Width           =   975
      End
      Begin VB.ComboBox cmbOtherAccount 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   56
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.ComboBox cmbOtherAcCurrency 
         Height          =   315
         Left            =   3360
         Style           =   2  'Dropdown List
         TabIndex        =   55
         Tag             =   "11775"
         Top             =   1080
         Width           =   1455
      End
      Begin VB.ComboBox cmbOtherAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   41
         Tag             =   "11775"
         Top             =   1080
         Width           =   975
      End
      Begin VB.Frame frameOtherAccCheckBook 
         BackColor       =   &H00BFD87E&
         Height          =   435
         Left            =   10215
         TabIndex        =   54
         Tag             =   "11775"
         Top             =   945
         Width           =   1365
         Begin VB.OptionButton optOtherAcCheckBookNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   43
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   135
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optOtherAcCheckBookYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   42
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   135
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbCurrentAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   33
         Tag             =   "11775"
         Top             =   120
         Width           =   1335
      End
      Begin VB.ComboBox cmbSavingAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   53
         Tag             =   "11775"
         Top             =   600
         Width           =   1335
      End
      Begin VB.ComboBox cmbOtherAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   40
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
         TabIndex        =   74
         Tag             =   "11775"
         Top             =   180
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
         TabIndex        =   73
         Tag             =   "11775"
         Top             =   180
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
         TabIndex        =   72
         Tag             =   "11775"
         Top             =   180
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
         TabIndex        =   71
         Tag             =   "11775"
         Top             =   660
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
         TabIndex        =   70
         Tag             =   "11775"
         Top             =   165
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
         Left            =   2775
         TabIndex        =   69
         Tag             =   "11775"
         Top             =   660
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
         TabIndex        =   68
         Tag             =   "11775"
         Top             =   1110
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
         TabIndex        =   67
         Tag             =   "11775"
         Top             =   1125
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
         TabIndex        =   66
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
         TabIndex        =   65
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
         Left            =   4845
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   180
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
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   660
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
         TabIndex        =   62
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
         Left            =   7200
         TabIndex        =   61
         Tag             =   "11775"
         Top             =   660
         Width           =   1095
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
      Left            =   4740
      TabIndex        =   105
      Tag             =   "9975"
      Top             =   3645
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
      Left            =   7395
      TabIndex        =   104
      Tag             =   "9975"
      Top             =   3645
      Width           =   435
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
      Left            =   120
      TabIndex        =   102
      Tag             =   "11775"
      Top             =   3615
      Width           =   1410
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
      Left            =   480
      TabIndex        =   101
      Top             =   6840
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Juristic"
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
      Height          =   270
      Left            =   7320
      TabIndex        =   99
      Top             =   240
      Width           =   4365
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
      Height          =   450
      Left            =   120
      TabIndex        =   96
      Top             =   2535
      Width           =   1335
   End
   Begin VB.Label lblReleationshipManager 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Relationship Mgr."
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
      Left            =   3120
      TabIndex        =   95
      Top             =   2640
      Width           =   1725
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
      Left            =   7485
      TabIndex        =   94
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label lblInternetBank 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Internet Bank "
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
      TabIndex        =   93
      Top             =   3165
      Width           =   1335
   End
   Begin VB.Label lblCustomerAdvice 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cust.Advice Flag"
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
      Left            =   3120
      TabIndex        =   92
      Top             =   3120
      Width           =   1575
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   5700
      Y2              =   5700
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
      Left            =   6840
      TabIndex        =   90
      Top             =   3240
      Width           =   1770
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   4110
      Y2              =   4110
   End
   Begin VB.Label lblMainCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Juristic"
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
      Height          =   270
      Left            =   3600
      TabIndex        =   76
      Top             =   240
      Width           =   3285
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   2760
      TabIndex        =   75
      Top             =   240
      Width           =   780
   End
   Begin VB.Shape Shape1 
      Height          =   540
      Left            =   45
      Top             =   6195
      Width           =   11640
   End
   Begin VB.Label lblAccountDetails 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Details"
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
      TabIndex        =   51
      Top             =   180
      Width           =   1950
   End
   Begin VB.Shape Shape2 
      Height          =   450
      Left            =   135
      Top             =   105
      Width           =   11640
   End
   Begin VB.Line Line11 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   2415
      Y2              =   2415
   End
End
Attribute VB_Name = "frmJuristicAccountInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmbOtherAccount_Click()
   If Mid$(cmbOtherAccount.text, 1, 3) = "160" And _
      Mid$(cmbOtherAcCurrency.text, 1, 2) = "01" Then
      optOtherAcCheckBookYes.Enabled = True
   Else
      optOtherAcCheckBookNo.Value = True
      optOtherAcCheckBookYes.Enabled = False
   End If
End Sub

Private Sub cmdApprove_Click()
   Dim tuserId As String, tSupervisorId As String, tDateTime As String
   Dim tBranchCode As String, tPrimaryAcc As String
   Dim tCustNo As String
   Dim mQry As String
   Dim tmpStr As String

   frmSupervisorApproval.MSFlexGrid1.Col = 0
   tuserId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
   frmSupervisorApproval.MSFlexGrid1.Col = 1
   tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
   tBranchCode = gBranchCode
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   
   If recvJuristicMsg.newOrUpdate = "N" Then
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
   If screenSetNo = "3" Or screenSetNo = "4" Then
      tCustNo = Format(frmJuristicMain.txtCustomerNo, "!@@@@@@@")
   ElseIf screenSetNo = "5" Then
      tCustNo = Format(frmJuristicDiplomats.txtCustomerNo, "!@@@@@@@")
   ElseIf screenSetNo = "6" Then
      tCustNo = Format(frmJuristicNonResident.txtCustomerNo, "!@@@@@@@")
   Else
      tCustNo = Space(7)
   End If
   
   SendMsg = "000268" & "19" & gBranchCode & "A" & tBranchCode & tuserId & tDateTime & _
             tSupervisorId & Space(200) & recvJuristicMsg.newOrUpdate & tPrimaryAcc & tCustNo & _
             screenSetNo & Space(50)
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   
   frmJuristicAccountInfo.MousePointer = vbHourglass
   frmJuristicAccountInfo.cmdApprove.Enabled = False
   frmJuristicAccountInfo.cmdReject.Enabled = False
   frmJuristicAccountInfo.cmdCancel.Enabled = False
   frmJuristicAccountInfo.cmdPrevPage.Enabled = False
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmJuristicAccountInfo.MousePointer = vbDefault
      frmJuristicAccountInfo.cmdApprove.Enabled = True
      frmJuristicAccountInfo.cmdReject.Enabled = True
      frmJuristicAccountInfo.cmdCancel.Enabled = True
      frmJuristicAccountInfo.cmdPrevPage.Enabled = True
      unloadSupForms
      Exit Sub
   End If

   If recvSuperDecisionMsg.status = "000" Then
      frmJuristicAccountInfo.MousePointer = vbDefault
      MsgBox errSuccessful(UserLang) '"transaction successfully completed..."
      If recvJuristicMsg.newOrUpdate = "N" Then
'         If UserLang = ARABIC Then
'            tmpStr = "—ﬁ„ «·⁄„Ì·" & recvSuperDecisionMsg.custNo
'         Else
'            tmpStr = "Customer Number Alloted is " & recvSuperDecisionMsg.custNo
'         End If
'         MsgBox tmpStr
         MsgBox errCustNoAlloted(UserLang) & recvSuperDecisionMsg.custNo & "    " & Chr$(13) & _
                IIf(Len(Trim(recvSuperDecisionMsg.ibanAccNo)) = 0, "", Mid$(recvSuperDecisionMsg.ibanAccNo, 1, 2) & errIban(UserLang) & ":" & Mid$(recvSuperDecisionMsg.ibanAccNo, 3))
         If realOrPseudo = "1" Then
            updateBranchPower
         Else
            unloadSupForms
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
      frmJuristicAccountInfo.MousePointer = vbDefault
      unloadSupForms
      Exit Sub
   End If
   
End Sub
   
Public Function updateBranchPower()

   frmJuristicAccountInfo.MousePointer = vbHourglass
   If screenSetNo = "3" Or screenSetNo = "4" Then
      frmJuristicMain.txtCustomerNo = recvSuperDecisionMsg.custNo
      formatNewJuristicCustomerRequest
   ElseIf screenSetNo = "5" Then
      frmJuristicDiplomats.txtCustomerNo = recvSuperDecisionMsg.custNo
      formatNewJuristicDiplomatsRequest
   ElseIf screenSetNo = "6" Then
      frmJuristicNonResident.txtCustomerNo = recvSuperDecisionMsg.custNo
      formatNewJuristicNonResidentRequest
   End If
   
   'now form the customer buffer to insert into BranchPower
   If openCustFile = 1 Then
      frmJuristicAccountInfo.MousePointer = vbDefault
      frmJuristicAccountInfo.cmdApprove.Enabled = True
      frmJuristicAccountInfo.cmdReject.Enabled = True
      frmJuristicAccountInfo.cmdCancel.Enabled = True
      frmJuristicAccountInfo.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchPower = 1
      Exit Function
   End If
   
   If recvJuristicMsg.newOrUpdate = "U" Then
      If readClient = 1 Then
         frmJuristicAccountInfo.MousePointer = vbDefault
         frmJuristicAccountInfo.cmdApprove.Enabled = True
         frmJuristicAccountInfo.cmdReject.Enabled = True
         frmJuristicAccountInfo.cmdCancel.Enabled = True
         frmJuristicAccountInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   CustBuf.recType = "02"
   CustBuf.clientNo = Format(recvSuperDecisionMsg.custNo, "!@@@@@@@@@")
   If recvJuristicMsg.newOrUpdate = "N" Then
      If juristicCustInfo.langPref = "0" Then
         If branchPowerEnv = "DOS" Then
            CustBuf.shortName1 = windowToAsmo(juristicCustInfo.aOrgShortName)
            CustBuf.alphacode = windowToAsmo(Format(Mid$(juristicCustInfo.aOrg2ndName, 1, 3) + Mid$(juristicCustInfo.aOrgFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
         Else
            CustBuf.shortName1 = juristicCustInfo.aOrgShortName
            CustBuf.alphacode = Format(Mid$(juristicCustInfo.aOrg2ndName, 1, 3) + Mid$(juristicCustInfo.aOrgFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "0"
      Else
         If branchPowerEnv = "DOS" Then
            CustBuf.shortName1 = windowToAsmo(juristicCustInfo.eOrgShortName)
            CustBuf.alphacode = windowToAsmo(Format(Mid$(juristicCustInfo.eOrg2ndName, 1, 3) & Mid$(juristicCustInfo.eOrgFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
         Else
            CustBuf.shortName1 = juristicCustInfo.eOrgShortName
            CustBuf.alphacode = Format(Mid$(juristicCustInfo.eOrg2ndName, 1, 3) & Mid$(juristicCustInfo.eOrgFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "1"
      End If
      If branchPowerEnv = "DOS" Then
         CustBuf.address1 = windowToAsmo(Format(juristicCustInfo.address1, "!" & String(45, "@")))
         CustBuf.address2 = windowToAsmo(Format(Mid$(juristicCustInfo.poBox, 1, 10) & Mid$(juristicCustInfo.cityName, 1, 20) + Mid$(juristicCustInfo.zipCode, 7), "!" + String(45, "@")))
         If screenSetNo = "3" Or screenSetNo = "4" Then
            CustBuf.address3 = windowToAsmo(Format("C" & juristicCustInfo.crNo, "!" & String(45, "@")))
         ElseIf screenSetNo = "5" Then
            If Len(RTrim(juristicCustInfo.ppNo)) <> 0 Then
               CustBuf.address3 = windowToAsmo(Format("P" & juristicCustInfo.ppNo, "!" & String(45, "@")))
            Else
               CustBuf.address3 = windowToAsmo(Format("D" & juristicCustInfo.dcNo, "!" & String(45, "@")))
            End If
         ElseIf screenSetNo = "6" Then
            CustBuf.address3 = windowToAsmo(Format("T" & juristicCustInfo.contractNo, "!" & String(45, "@")))
         End If
      Else
         CustBuf.address1 = Format(juristicCustInfo.address1, "!" & String(45, "@"))
         CustBuf.address2 = Format(Mid$(juristicCustInfo.poBox, 1, 10) & Mid$(juristicCustInfo.cityName, 1, 20) & Mid$(juristicCustInfo.zipCode, 7), "!" & String(45, "@"))
         If screenSetNo = "3" Or screenSetNo = "4" Then
            CustBuf.address3 = Format("C" & juristicCustInfo.crNo, "!" & String(45, "@"))
         ElseIf screenSetNo = "5" Then
            If Len(RTrim(juristicCustInfo.ppNo)) <> 0 Then
               CustBuf.address3 = Format("P" & juristicCustInfo.ppNo, "!" & String(45, "@"))
            Else
               CustBuf.address3 = Format("D" & juristicCustInfo.dcNo, "!" & String(45, "@"))
            End If
         ElseIf screenSetNo = "6" Then
            CustBuf.address3 = Format("T" & juristicCustInfo.contractNo, "!" & String(45, "@"))
         End If
      End If
   Else
      If recvSuperDecisionMsg.nameChanged = "1" Then
         If juristicCustInfo.langPref = "0" Then
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(juristicCustInfo.aOrgShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(juristicCustInfo.aOrg2ndName, 1, 3) & Mid$(juristicCustInfo.aOrgFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = juristicCustInfo.aOrgShortName
               CustBuf.alphacode = Format(Mid$(juristicCustInfo.aOrg2ndName, 1, 3) & Mid$(juristicCustInfo.aOrgFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "0"
         Else
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(juristicCustInfo.eOrgShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(juristicCustInfo.eOrg2ndName, 1, 3) & Mid$(juristicCustInfo.eOrgFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = juristicCustInfo.eOrgShortName
               CustBuf.alphacode = Format(Mid$(juristicCustInfo.eOrg2ndName, 1, 3) & Mid$(juristicCustInfo.eOrgFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "1"
         End If
      End If
      If recvSuperDecisionMsg.addressChanged = "1" Then
         If branchPowerEnv = "DOS" Then
            CustBuf.address1 = windowToAsmo(Format(juristicCustInfo.address1, "!" & String(45, "@")))
            CustBuf.address2 = windowToAsmo(Format(Mid$(juristicCustInfo.poBox, 1, 10) & Mid$(juristicCustInfo.cityName, 1, 20) & Mid$(juristicCustInfo.zipCode, 7), "!" & String(45, "@")))
            If screenSetNo = "3" Or screenSetNo = "4" Then
               CustBuf.address3 = windowToAsmo(Format("C" & juristicCustInfo.crNo, "!" & String(45, "@")))
            ElseIf screenSetNo = "5" Then
               If Len(RTrim(juristicCustInfo.ppNo)) <> 0 Then
                  CustBuf.address3 = windowToAsmo(Format("P" & juristicCustInfo.ppNo, "!" & String(45, "@")))
               Else
                  CustBuf.address3 = windowToAsmo(Format("D" & juristicCustInfo.dcNo, "!" & String(45, "@")))
               End If
            ElseIf screenSetNo = "6" Then
               CustBuf.address3 = windowToAsmo(Format("T" & juristicCustInfo.contractNo, "!" & String(45, "@")))
            End If
        Else
            CustBuf.address1 = Format(juristicCustInfo.address1, "!" & String(45, "@"))
            CustBuf.address2 = Format(Mid$(juristicCustInfo.poBox, 1, 10) & Mid$(juristicCustInfo.cityName, 1, 20) & Mid$(juristicCustInfo.zipCode, 7), "!" & String(45, "@"))
            If screenSetNo = "3" Or screenSetNo = "4" Then
               CustBuf.address3 = Format("C" & juristicCustInfo.crNo, "!" & String(45, "@"))
            ElseIf screenSetNo = "5" Then
               If Len(RTrim(juristicCustInfo.ppNo)) <> 0 Then
                  CustBuf.address3 = Format("P" & juristicCustInfo.ppNo, "!" & String(45, "@"))
               Else
                  CustBuf.address3 = Format("D" & juristicCustInfo.dcNo, "!" & String(45, "@"))
               End If
            ElseIf screenSetNo = "6" Then
               CustBuf.address3 = Format("T" & juristicCustInfo.contractNo, "!" & String(45, "@"))
            End If
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
   
   If recvJuristicMsg.newOrUpdate = "N" Then
      If insertClient = 1 Then
         frmJuristicAccountInfo.MousePointer = vbDefault
         frmJuristicAccountInfo.cmdApprove.Enabled = True
         frmJuristicAccountInfo.cmdReject.Enabled = True
         frmJuristicAccountInfo.cmdCancel.Enabled = True
         frmJuristicAccountInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   Else
      If updateClient = 1 Then
         frmJuristicAccountInfo.MousePointer = vbDefault
         frmJuristicAccountInfo.cmdApprove.Enabled = True
         frmJuristicAccountInfo.cmdReject.Enabled = True
         frmJuristicAccountInfo.cmdCancel.Enabled = True
         frmJuristicAccountInfo.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   closeClient
   
   If recvJuristicMsg.newOrUpdate = "U" Then
      frmJuristicAccountInfo.MousePointer = vbDefault
      frmJuristicAccountInfo.cmdApprove.Enabled = True
      frmJuristicAccountInfo.cmdReject.Enabled = True
      frmJuristicAccountInfo.cmdCancel.Enabled = True
      frmJuristicAccountInfo.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchPower = 0
      Exit Function
   End If
  
   If openAcctFile = 1 Then
      frmJuristicAccountInfo.MousePointer = vbDefault
      frmJuristicAccountInfo.cmdApprove.Enabled = True
      frmJuristicAccountInfo.cmdReject.Enabled = True
      frmJuristicAccountInfo.cmdCancel.Enabled = True
      frmJuristicAccountInfo.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchPower = 1
      Exit Function
   End If
         
   If frmJuristicAccountInfo.optCurrentAcYes.Value = True Then
      formatAcctInfo "008", Left$(frmJuristicAccountInfo.cmbCurrentAcCurrency.text, 2), _
                     Left$(frmJuristicAccountInfo.cmbCurrentAcStatus.text, 2), _
                     Left$(frmJuristicAccountInfo.cmbCurrentAcStmtFreq.text, 2), _
                     IIf(frmJuristicAccountInfo.optCurrentAcCheckBookYes, "0", "1"), "0", _
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
          frmJuristicAccountInfo.MousePointer = vbDefault
          frmJuristicAccountInfo.cmdApprove.Enabled = True
          frmJuristicAccountInfo.cmdReject.Enabled = True
          frmJuristicAccountInfo.cmdCancel.Enabled = True
          frmJuristicAccountInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchPower = 1
          Exit Function
       End If
    End If
    
    If frmJuristicAccountInfo.optSavingAcYes.Value = True Then
       formatAcctInfo "009", Left$(frmJuristicAccountInfo.cmbSavingAcCurrency.text, 2), _
                      Left$(frmJuristicAccountInfo.cmbSavingAcStatus.text, 2), _
                      Left$(frmJuristicAccountInfo.cmbSavingAcStmtFreq.text, 2), _
                      Space(1), "0", recvSuperDecisionMsg.custNo
                     
       ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " + _
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
          frmJuristicAccountInfo.MousePointer = vbDefault
          frmJuristicAccountInfo.cmdApprove.Enabled = True
          frmJuristicAccountInfo.cmdReject.Enabled = True
          frmJuristicAccountInfo.cmdCancel.Enabled = True
          frmJuristicAccountInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchPower = 1
          Exit Function
       End If
    End If
    
    If frmJuristicAccountInfo.cmbOtherAccount.ListIndex >= 0 And _
       Mid$(frmJuristicAccountInfo.cmbOtherAccount.text, 1, 3) <> "000" Then
       formatAcctInfo Left$(frmJuristicAccountInfo.cmbOtherAccount.text, 3), _
                      Left$(frmJuristicAccountInfo.cmbOtherAcCurrency.text, 2), _
                      Left$(frmJuristicAccountInfo.cmbOtherAcStatus.text, 2), _
                      Left$(frmJuristicAccountInfo.cmbOtherAcStmtFreq.text, 2), _
                      IIf(Left$(frmJuristicAccountInfo.cmbOtherAccount.text, 3) = "160", _
                      IIf(frmJuristicAccountInfo.optOtherAcCheckBookYes, "0", "1"), _
                      Space(1)), "0", recvSuperDecisionMsg.custNo
                              
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
          frmJuristicAccountInfo.MousePointer = vbDefault
          frmJuristicAccountInfo.cmdApprove.Enabled = True
          frmJuristicAccountInfo.cmdReject.Enabled = True
          frmJuristicAccountInfo.cmdCancel.Enabled = True
          frmJuristicAccountInfo.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchPower = 1
          Exit Function
       End If
  End If
  
  closeAcct
  updateBranchPower = 0
    
  frmJuristicAccountInfo.MousePointer = vbDefault
  frmJuristicAccountInfo.cmdApprove.Enabled = True
  frmJuristicAccountInfo.cmdReject.Enabled = True
  frmJuristicAccountInfo.cmdCancel.Enabled = True
  frmJuristicAccountInfo.cmdPrevPage.Enabled = True

  unloadSupForms
End Function

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdCreate_Click()
   
   If Len(RTrim(documentsSelected)) = 0 And Len(RTrim(otherDocumentsEntered)) = 0 Then
      MsgBox errNoDocumentsSelected(UserLang)
      Exit Sub
   End If
   
   If validateFrmJuristicAcctInfo = 1 Then
      Exit Sub
   End If
   
   If Not updateAction And Not (tellerAction And recvJuristicMsg.newOrUpdate = "U") Then
      If subCategoryCode <> "39" And _
         subCategoryCode <> "40" And subCategoryCode <> "49" And _
         subCategoryCode <> "50" And subCategoryCode <> "51" Then
         If Val(noOfSignatory) = 0 Then
            MsgBox errAtleastOneSignatoryNeeded(UserLang)
            Exit Sub
         End If
      End If
    End If
      
   If subCategoryCode = "10" Or subCategoryCode = "11" Or subCategoryCode = "12" Or _
      subCategoryCode = "13" Or subCategoryCode = "14" Or subCategoryCode = "16" Or _
      subCategoryCode = "18" Or subCategoryCode = "19" Or subCategoryCode = "20" Or _
      subCategoryCode = "21" Or subCategoryCode = "22" Or subCategoryCode = "23" Then
        
      If Val(noOfOwners) = 0 Then
         MsgBox errOwnerRecordNotFound(UserLang)
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
   
   If screenSetNo = "3" Or screenSetNo = "4" Then
      formatNewJuristicCustomerRequest
   ElseIf screenSetNo = "5" Then
      formatNewJuristicDiplomatsRequest
   ElseIf screenSetNo = "6" Then
      formatNewJuristicNonResidentRequest
   End If
   
   juristicCustInfo.accFreezingGracePeriod = Format(txtFreezingGracePeriod, "000")
    
    currentAccInfo = Space(12)
    savingAccInfo = Space(12)
    otherAccInfo = Space(12)
    If optCurrentAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvJuristicMsg.currentAccInfo)) = 0 Then
             formatCurrentAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatCurrentAcc "0", "U"
          End If
       Else
          formatCurrentAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvJuristicMsg.currentAccInfo)) <> 0 Then
          formatCurrentAcc "1", "U"
       End If
    End If
    
    If optSavingAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvJuristicMsg.savingsAccInfo)) = 0 Then
             formatSavingAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatSavingAcc "0", "U"
          End If
       Else
          formatSavingAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvJuristicMsg.savingsAccInfo)) <> 0 Then
          formatSavingAcc "1", "U"
       End If
    End If
    
    If cmbOtherAccount.ListIndex >= 0 And _
       Mid$(cmbOtherAccount.text, 1, 3) <> "000" Then
       If tellerAction Then
          If Len(RTrim(recvJuristicMsg.otherAccInfo)) = 0 Then
             formatOtherAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatOtherAcc "0", "U"
          End If
       Else
          formatOtherAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvJuristicMsg.otherAccInfo)) <> 0 Then
          formatOtherAcc "1", "U"
       End If
    End If
    
    SendMsg = juristicCustInfo.msgLen & juristicCustInfo.service & gBranchCode & juristicCustInfo.userId & juristicCustInfo.branchCode & juristicCustInfo.dateTime & _
              juristicCustInfo.creationOrUpdate & juristicCustInfo.NewOrUpdateFlag & _
              juristicCustInfo.bmUpdateStatus & juristicCustInfo.customerNo & juristicCustInfo.supervisorId & juristicCustInfo.custBranchCode & juristicCustInfo.samaMainCategory & juristicCustInfo.samaSubCategory & juristicCustInfo.screenSetNo & juristicCustInfo.crNo & _
              juristicCustInfo.crIssuedAt & juristicCustInfo.crDateType & juristicCustInfo.crIssueDateH & juristicCustInfo.crIssueDateG & juristicCustInfo.crExpiryDateH & juristicCustInfo.crExpiryDateG & _
              juristicCustInfo.licNo & juristicCustInfo.licDateType & juristicCustInfo.licIssueDateH & juristicCustInfo.licIssueDateG & juristicCustInfo.licExpiryDateH & juristicCustInfo.licExpiryDateG & _
              juristicCustInfo.samaAuthNo & juristicCustInfo.samaAuthDateType & juristicCustInfo.samaAuthIssueDateH & juristicCustInfo.samaAuthIssueDateG & juristicCustInfo.samaAuthExpiryDateH & juristicCustInfo.samaAuthExpiryDateG & _
              juristicCustInfo.ppNo & juristicCustInfo.ppDateType & juristicCustInfo.ppIssueDateH & juristicCustInfo.ppIssueDateG & juristicCustInfo.ppExpiryDateH & juristicCustInfo.ppExpiryDateG & _
              juristicCustInfo.dcNo & juristicCustInfo.dcDateType & juristicCustInfo.dcIssueDateH & juristicCustInfo.dcIssueDateG & juristicCustInfo.dcExpiryDateH & juristicCustInfo.dcExpiryDateG & _
              juristicCustInfo.visaNo & juristicCustInfo.visaDateType & juristicCustInfo.visaIssueDateH & juristicCustInfo.visaIssueDateG & juristicCustInfo.visaExpiryDateH & juristicCustInfo.visaExpiryDateG & _
              juristicCustInfo.contractNo & juristicCustInfo.contractDateType & juristicCustInfo.contractIssueDateH & juristicCustInfo.contractIssueDateG & juristicCustInfo.contractExpiryDateH & juristicCustInfo.contractExpiryDateG

    SendMsg = SendMsg & juristicCustInfo.langPref & juristicCustInfo.nationality & juristicCustInfo.purposeOfAccount & _
              juristicCustInfo.govtShareHoldingPerc & juristicCustInfo.saudiShareHoldingPerc & juristicCustInfo.foreignShareHoldingPerc & _
              juristicCustInfo.doeDateType & juristicCustInfo.doeDateH & juristicCustInfo.doeDateG & _
              juristicCustInfo.residentStatus & juristicCustInfo.businessType & _
              juristicCustInfo.aOrgFirstName & juristicCustInfo.aOrg2ndName & _
              juristicCustInfo.aOrgShortName & juristicCustInfo.eOrgFirstName & juristicCustInfo.eOrg2ndName & juristicCustInfo.eOrgShortName & juristicCustInfo.alphaSearchCode & juristicCustInfo.address1 & juristicCustInfo.address2 & _
              juristicCustInfo.poBox & juristicCustInfo.cityName & juristicCustInfo.zipCode & juristicCustInfo.country & juristicCustInfo.telOffAreaCode & juristicCustInfo.telOffNo & juristicCustInfo.telOffExt & _
              juristicCustInfo.telHomeAreaCode & juristicCustInfo.telHomeNo & juristicCustInfo.telHomeExt & juristicCustInfo.faxAreaCode & juristicCustInfo.faxNo & juristicCustInfo.faxExt & juristicCustInfo.mobileNo & juristicCustInfo.pagerNo & juristicCustInfo.eMail & _
              juristicCustInfo.homeAddress1 & juristicCustInfo.homeAddress2 & juristicCustInfo.homePoBox & juristicCustInfo.homeCityName & juristicCustInfo.homeZipCode & juristicCustInfo.homeCountry & juristicCustInfo.homeTelOffAreaCode & juristicCustInfo.homeTelOffNo & _
              juristicCustInfo.homeTelOffExt & juristicCustInfo.homeTelHomeAreaCode & juristicCustInfo.homeTelHomeNo & juristicCustInfo.homeTelHomeExt & juristicCustInfo.homeFaxAreaCode & _
              juristicCustInfo.homeFaxNo & juristicCustInfo.homeFaxExt & juristicCustInfo.homeMobileNo & juristicCustInfo.homePagerNo & juristicCustInfo.homeEmail & juristicCustInfo.documents & juristicCustInfo.documentOther & _
              juristicCustInfo.signatureNature & juristicCustInfo.supervisorComments & juristicCustInfo.internetBankAcc & juristicCustInfo.custAdviceFlag & juristicCustInfo.altBranchCode & _
              currentAccInfo & savingAccInfo & otherAccInfo & juristicCustInfo.updatedForSama & juristicCustInfo.relationshipManager & juristicCustInfo.generalMemo & _
              juristicCustInfo.marketingMemo & juristicCustInfo.addressType & juristicCustInfo.accFreezingGracePeriod & _
              juristicCustInfo.appRefNo & juristicCustInfo.appDateType & juristicCustInfo.appIssueDateH & _
              juristicCustInfo.appIssueDateG & juristicCustInfo.appExpiryDateH & juristicCustInfo.appExpiryDateG & _
              juristicCustInfo.appRefName & Space(50)
          
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmJuristicAccountInfo.MousePointer = vbHourglass
    frmJuristicAccountInfo.cmdCreate.Enabled = False
    frmJuristicAccountInfo.cmdCancel.Enabled = False
    frmJuristicAccountInfo.cmdPrevPage.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmJuristicAccountInfo.cmdCreate.Enabled = True
       frmJuristicAccountInfo.cmdCancel.Enabled = True
       frmJuristicAccountInfo.cmdPrevPage.Enabled = True
       frmJuristicAccountInfo.MousePointer = vbDefault
       Exit Sub
    End If
    frmJuristicAccountInfo.cmdCreate.Enabled = True
    frmJuristicAccountInfo.cmdCancel.Enabled = True
    frmJuristicAccountInfo.cmdPrevPage.Enabled = True
    frmJuristicAccountInfo.MousePointer = vbDefault

    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
       If juristicCustInfo.NewOrUpdateFlag = "N" And juristicCustInfo.creationOrUpdate = "C" Then
          gCustNo = recvCustomerMsg.custNo
          If screenSetNo = "3" Or screenSetNo = "4" Then
             frmJuristicMain.txtCustomerNo = recvCustomerMsg.custNo
          ElseIf screenSetNo = "5" Then
             frmJuristicDiplomats.txtCustomerNo = recvCustomerMsg.custNo
          ElseIf screenSetNo = "6" Then
             frmJuristicNonResident.txtCustomerNo = recvCustomerMsg.custNo
          End If
          If UserLang = ARABIC Then
             tmpStr = "—ﬁ„ «·⁄„Ì·" & recvCustomerMsg.custNo
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
       unloadJuristicForms
       Exit Sub
    End If
    
   unloadJuristicForms
   
End Sub

Private Sub cmdDocuments_Click()
   If supervisorAction Or searchAction Or tellerAction Or updateAction Or custHistoryAction Then
      documentsSelected = recvJuristicMsg.documents
      otherDocumentsEntered = recvJuristicMsg.documentOther
   End If
   frmDocuments.Show
End Sub

Private Sub cmdOwner_Click()
   Dim tCustNo As String

   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If validateFrmJuristicAcctInfo = 1 Then
         Exit Sub
      End If
      If Len(RTrim(gDateTime)) = 0 Then
         gDateTime = getUnixDateTime
         If Trim(gDateTime) = "ERROR" Then
            gDateTime = Space(14)
            Exit Sub
         End If
      End If
      frmJuristicOwner.Show
   End If
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      frmJuristicOwner.MousePointer = vbHourglass
      CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
      frmJuristicOwner.Hide
      If screenSetNo = "3" Or screenSetNo = "4" Then
         tCustNo = frmJuristicMain.txtCustomerNo
      ElseIf screenSetNo = "5" Then
         tCustNo = frmJuristicDiplomats.txtCustomerNo
      ElseIf screenSetNo = "6" Then
         tCustNo = frmJuristicNonResident.txtCustomerNo
      End If
      doOwnerSearch "00000", tCustNo, Space(4)
      frmJuristicOwner.MousePointer = vbDefault
      CSD_mdiForm.staticStatus.Panels(3).text = " "
      noOfOwners = recvOwnerSearchMsg.noOfRecs
      For i = 1 To Val(recvOwnerSearchMsg.noOfRecs)
          frmJuristicOwner.ownerInfoGrid.Row = i
          frmJuristicOwner.ownerInfoGrid.Col = 0
          frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
          frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).custNo
          frmJuristicOwner.ownerInfoGrid.Col = 1
          frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
          frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).ownerNo
          frmJuristicOwner.ownerInfoGrid.Col = 2
          frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
          frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).custShortName
          frmJuristicOwner.ownerInfoGrid.Col = 3
          frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
          frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).custBranchCode
          frmJuristicOwner.ownerInfoGrid.Col = 4
          frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
          frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).idType & "-" & recvOwnerSearchMsg.details(i).idNo
      Next i
      Do While True
          If recvOwnerSearchMsg.noOfRecs = "20" Then
             doOwnerSearch recvOwnerSearchMsg.lastRecCount, tCustNo, Space(4)
             frmJuristicOwner.MousePointer = vbDefault
             CSD_mdiForm.staticStatus.Panels(3).text = " "
             noOfOwners = Format(Val(recvOwnerSearchMsg.lastRecCount), "0000")
             For i = 1 To Val(recvOwnerSearchMsg.noOfRecs)
                 frmJuristicOwner.ownerInfoGrid.Row = Val(recvOwnerSearchMsg.lastRecCount) - _
                                                              Val(recvOwnerSearchMsg.noOfRecs) + i
                 frmJuristicOwner.ownerInfoGrid.Col = 0
                 frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
                 frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).custNo
                 frmJuristicOwner.ownerInfoGrid.Col = 1
                 frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
                 frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).ownerNo
                 frmJuristicOwner.ownerInfoGrid.Col = 2
                 frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
                 frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).custShortName
                 frmJuristicOwner.ownerInfoGrid.Col = 3
                 frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
                 frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).custBranchCode
                 frmJuristicOwner.ownerInfoGrid.Col = 4
                 frmJuristicOwner.ownerInfoGrid.CellAlignment = flexAlignLeftCenter
                 frmJuristicOwner.ownerInfoGrid.text = recvOwnerSearchMsg.details(i).idType & "-" & recvOwnerSearchMsg.details(i).idNo
             Next i
          Else
             Exit Do
          End If
      Loop
      frmJuristicOwner.ownerInfoGrid.Row = 1
      frmJuristicOwner.Show
   End If
End Sub

Private Sub cmdPrevPage_Click()
    Me.Hide
End Sub

Private Sub cmdReject_Click()
    frmSupervisorRejection.Show vbModal
End Sub

Private Sub cmdSignatory_Click()
   Dim tCustNo As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If validateFrmJuristicAcctInfo = 1 Then
         Exit Sub
      End If
      If Len(RTrim(gDateTime)) = 0 Then
         gDateTime = getUnixDateTime
         If Trim(gDateTime) = "ERROR" Then
            gDateTime = Space(14)
            Exit Sub
         End If
      End If
      accSupervisorAction = False
      accSearchAction = False
      frmJuristicSignatory.tag = " "
      frmJuristicSignatory.Show
   End If
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      frmJuristicAccountInfo.MousePointer = vbHourglass
      CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
      accSupervisorAction = False
      accSearchAction = False
      frmJuristicSignatory.Hide
      If screenSetNo = "3" Or screenSetNo = "4" Then
         tCustNo = frmJuristicMain.txtCustomerNo
      ElseIf screenSetNo = "6" Then
         tCustNo = frmJuristicNonResident.txtCustomerNo
      ElseIf screenSetNo = "5" Then
         tCustNo = frmJuristicDiplomats.txtCustomerNo
      End If
      doSignatorySearch "00000", tCustNo, Space(4)
      frmJuristicAccountInfo.MousePointer = vbDefault
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
             doSignatorySearch recvSignatorySearchMsg.lastRecCount, tCustNo, Space(4)
             frmJuristicAccountInfo.MousePointer = vbDefault
             CSD_mdiForm.staticStatus.Panels(3).text = " "
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
      frmJuristicSignatory.tag = " "
      frmJuristicSignatory.Show
   End If
   
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim mQry As String
   If UserLang = ARABIC Then
       ChangePositions frmJuristicAccountInfo, 11800
       frmJuristicAccountInfo.RightToLeft = True
    End If

   lblMainCategoryDesc = mainCategoryDesc
   lblSubCategoryDesc = subCategoryDesc
   
   frmJuristicAccountInfo.Caption = frmJuristicAccountInfoCaption(0, UserLang)
   lblAccountDetails.Caption = frmJuristicAccountInfoCaption(0, UserLang)
   lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
   lblHomeCountryAddress.Caption = frmJuristicAccountInfoCaption(1, UserLang)
   lblHomePoBox.Caption = frmJuristicAccountInfoCaption(2, UserLang)
   lblHomeCity.Caption = frmJuristicAccountInfoCaption(3, UserLang)
   lblHomeZipCode.Caption = frmJuristicAccountInfoCaption(4, UserLang)
   lblHomeCountry.Caption = frmJuristicAccountInfoCaption(5, UserLang)
   lblHomePhoneOff.Caption = frmJuristicAccountInfoCaption(6, UserLang)
   lblHomePhoneRes.Caption = frmJuristicAccountInfoCaption(7, UserLang)
   lblHomeFax.Caption = frmJuristicAccountInfoCaption(8, UserLang)
   lblHomeMobileNo.Caption = frmJuristicAccountInfoCaption(9, UserLang)
   lblHomePager.Caption = frmJuristicAccountInfoCaption(10, UserLang)
   lblHomeEmail.Caption = frmJuristicAccountInfoCaption(11, UserLang)
   lblUpdatedForSama.Caption = frmJuristicAccountInfoCaption(12, UserLang)
   optSamaUpdYes.Caption = frmJuristicAccountInfoCaption(17, UserLang)
   optSamaUpdNo.Caption = frmJuristicAccountInfoCaption(18, UserLang)
   lblReleationshipManager.Caption = frmJuristicAccountInfoCaption(13, UserLang)
   lblGeneralMemo.Caption = frmJuristicAccountInfoCaption(14, UserLang)
   lblInternetBank.Caption = frmJuristicAccountInfoCaption(15, UserLang)
   lblCustomerAdvice.Caption = frmJuristicAccountInfoCaption(16, UserLang)
   optInternetYes.Caption = frmJuristicAccountInfoCaption(17, UserLang)
   optInternetNo.Caption = frmJuristicAccountInfoCaption(18, UserLang)
   optCustAdviceYes.Caption = frmJuristicAccountInfoCaption(17, UserLang)
   optCustAdviceNo.Caption = frmJuristicAccountInfoCaption(18, UserLang)
   
   lblCurrentAccount.Caption = frmJuristicAccountInfoCaption(19, UserLang)
   optCurrentAcYes.Caption = frmJuristicAccountInfoCaption(17, UserLang)
   optCurrentAcNo.Caption = frmJuristicAccountInfoCaption(18, UserLang)
   lblCurrentAcCurrency.Caption = frmJuristicAccountInfoCaption(20, UserLang)
   lblCurrentAcStatus.Caption = frmJuristicAccountInfoCaption(21, UserLang)
   lblCurrentAcStmtFreq.Caption = frmJuristicAccountInfoCaption(22, UserLang)
   lblCurrentAcCheckBook.Caption = frmJuristicAccountInfoCaption(23, UserLang)
   optCurrentAcCheckBookYes.Caption = frmJuristicAccountInfoCaption(17, UserLang)
   optCurrentAcCheckBookNo.Caption = frmJuristicAccountInfoCaption(18, UserLang)
   
   lblSavingAcc.Caption = frmJuristicAccountInfoCaption(24, UserLang)
   optSavingAcYes.Caption = frmJuristicAccountInfoCaption(17, UserLang)
   optSavingAcNo.Caption = frmJuristicAccountInfoCaption(18, UserLang)
   lblSavingAcCurrency.Caption = frmJuristicAccountInfoCaption(20, UserLang)
   lblSavingAcStatus.Caption = frmJuristicAccountInfoCaption(21, UserLang)
   lblSavingAcStmtFreq.Caption = frmJuristicAccountInfoCaption(22, UserLang)
   
   lblOtherAccount.Caption = frmJuristicAccountInfoCaption(25, UserLang)
   lblOtherAccurrency.Caption = frmJuristicAccountInfoCaption(20, UserLang)
   lblOtherAcStatus.Caption = frmJuristicAccountInfoCaption(21, UserLang)
   lblOtherAcStmtFreq.Caption = frmJuristicAccountInfoCaption(22, UserLang)
   lblOtherAccheckBook.Caption = frmJuristicAccountInfoCaption(23, UserLang)
   optOtherAcCheckBookYes.Caption = frmJuristicAccountInfoCaption(17, UserLang)
   optOtherAcCheckBookNo.Caption = frmJuristicAccountInfoCaption(18, UserLang)
   
   lblNatureOfSign.Caption = frmJuristicAccountInfoCaption(28, UserLang)
   optSignSingle.Caption = frmJuristicAccountInfoCaption(26, UserLang)
   optSignJoint.Caption = frmJuristicAccountInfoCaption(27, UserLang)
   
   cmdPrevPage.Caption = frmJuristicAccountInfoCaption(29, UserLang)
   cmdCreate.Caption = frmJuristicAccountInfoCaption(30, UserLang)
   cmdCancel.Caption = frmJuristicAccountInfoCaption(31, UserLang)
   cmdApprove.Caption = frmJuristicAccountInfoCaption(32, UserLang)
   cmdReject.Caption = frmJuristicAccountInfoCaption(33, UserLang)
   cmdOwner.Caption = frmJuristicAccountInfoCaption(37, UserLang)
   cmdDocuments.Caption = frmJuristicAccountInfoCaption(35, UserLang)
   cmdSignatory.Caption = frmJuristicAccountInfoCaption(36, UserLang)
   lblMarketingMemo.Caption = frmJuristicAccountInfoCaption(38, UserLang)
   lblFreezingGracePeriod.Caption = frmJuristicAccountInfoCaption(39, UserLang)
   lblDays.Caption = errDays(UserLang)
   
   Set rs = db.OpenRecordset("select * from countryinfo")
    If rs.recordCount > 0 Then
        rs.MoveFirst
        Do While Not rs.EOF
           If UserLang = ARABIC Then
              cmbHomeCountry.AddItem rs("countrycode") & " - " & rs("arabicname")
            Else
              cmbHomeCountry.AddItem rs("countrycode") & " - " & rs("englishname")
            End If
           rs.MoveNext
        Loop
        cmbHomeCountry.ListIndex = -1
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
      cmdApprove.Enabled = True
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
      If screenSetNo = "5" Then
         cmdSignatory.Enabled = False
         cmdOwner.Enabled = False
      Else
         cmdSignatory.Enabled = True
         cmdOwner.Enabled = True
      End If
      If recvJuristicMsg.newOrUpdate = "U" Then
         cmdSignatory.Enabled = False
      Else
         cmdSignatory.Enabled = True
      End If
      FrameHomeCountryAddress.Enabled = False
      FrameInternetFlag.Enabled = False
      frameCustomerAdvice.Enabled = False
      FrameUpdateForSama.Enabled = False
      txtRelationshipManager.Enabled = False
      txtGeneralMemo.Enabled = False
      txtMarketingMemo.Enabled = False
      frameAccountDetails.Enabled = False
      frameSignSingleJoint.Enabled = False
      txtFreezingGracePeriod.Enabled = False
   Else
      FrameHomeCountryAddress.Enabled = True
      FrameInternetFlag.Enabled = True
      frameCustomerAdvice.Enabled = True
      'txtRelationshipManager.Enabled = True
      txtGeneralMemo.Enabled = True
      If InStr(recvLoginMsg.authorityLevel, "~7") > 0 Then
         txtMarketingMemo.Enabled = True
      Else
         txtMarketingMemo.Enabled = False
      End If
      frameSignSingleJoint.Enabled = True
      If enableGeneralSamaUpd = True Then
         txtFreezingGracePeriod.Enabled = True
      Else
         txtFreezingGracePeriod.Enabled = False
      End If
      If screenSetNo = "5" Then
         cmdSignatory.Enabled = False
         cmdOwner.Enabled = False
      Else
         cmdSignatory.Enabled = True
         cmdOwner.Enabled = True
      End If
      If subCategoryCode <> "25" And subCategoryCode <> "28" And _
         subCategoryCode <> "44" And subCategoryCode <> "45" And _
         subCategoryCode <> "46" And subCategoryCode <> "47" And _
         subCategoryCode <> "48" And subCategoryCode <> "49" And _
         subCategoryCode <> "50" And subCategoryCode <> "51" And _
         subCategoryCode <> "66" And subCategoryCode <> "76" And _
         subCategoryCode <> "77" And subCategoryCode <> "78" And _
         subCategoryCode <> "79" And subCategoryCode <> "39" Then
         FrameHomeCountryAddress.Enabled = False
      End If
      'cmdOwner.Enabled = False
      If updateAction Then
         frameAccountDetails.Enabled = False
         cmdSignatory.Enabled = False
      Else
         If tellerAction And _
            recvJuristicMsg.newOrUpdate = "U" Then
            frameAccountDetails.Enabled = False
            cmdSignatory.Enabled = False
         Else
            frameAccountDetails.Enabled = True
            frameCurrentAcc.Enabled = True
            frameSavingAcc.Enabled = True
            mQry = "select checkbookallowed from categoryconfiginfo " & _
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
            End If
            If subCategoryCode = "75" Then
               optCurrentAcNo.Value = True
               optSavingAcNo.Value = True
               frameCurrentAcc.Enabled = False
               frameSavingAcc.Enabled = False
               cmbOtherAccount.Clear
               Set rs = db.OpenRecordset("select splMemoCode from samaSubCategoryInfo where subcategorycode = '75'")
               If rs.recordCount > 0 Then
                  tCode = rs(0)
                  If tCode <> "" Then
                     Set rs = db.OpenRecordset("select * from bmledgerinfo where ledgercode = '" & tCode & "'")
                     If rs.recordCount > 0 Then
                        If UserLang = ARABIC Then
                           cmbOtherAccount.AddItem tCode & "-" & rs("arabicname")
                        Else
                           cmbOtherAccount.AddItem tCode & "-" & rs("englishname")
                        End If
                     Else
                        cmbOtherAccount.AddItem tCode & "-Not defined in local"
                     End If
                   End If
               End If
               tCode = "04"
               For i = 0 To cmbOtherAcStatus.ListCount
                   If Mid$(cmbOtherAcStatus.List(i), 1, 2) = "04" Then
                      cmbOtherAcStatus.ListIndex = i
                      Exit For
                   End If
               Next i
               If i > cmbOtherAcStatus.ListCount Then
                  cmbOtherAcStatus.AddItem "04-Not defined in local"
                  cmbOtherAcStatus.ListIndex = cmbOtherAcStatus.ListCount - 1
               End If
               cmbOtherAcStatus.Enabled = False
            End If  ' if subcategorycode = "75"
            cmdSignatory.Enabled = True
         End If
      End If
   End If
  
    mQry = "select * from cityinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbHomeCity.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbHomeCity.AddItem rs("englishname")
          Else
             cmbHomeCity.AddItem rs("arabicname")
          End If
          rs.MoveNext
       Loop
    End If
    
'    Set rs = db.OpenRecordset("select citycode from branchinfo " + _
'               " where branchcode = '" + gBranchCode + "'")
'    If rs.RecordCount > 0 Then
'         tCode = rs(0)
'         Set rs = db.OpenRecordset("select englishname,arabicname,telareacode from cityinfo " + _
'                       " where citycode = '" + tCode + "'")
'         If rs.RecordCount > 0 Then
'             txtHomeOffPhoneCityCode = rs(2)
'             txtHomeResPhoneCityCode = rs(2)
'             txthomeFaxtxtHomeFaxAreaCode = rs(2)
'             If UserLang = ENGLISH Then
'                cmbHomeCity.Text = rs(0)
'             Else
'                cmbHomeCity.Text = rs(1)
'             End If
'         Else
'            txtHomeOffPhoneCityCode = "01"
'            txtHomeResPhoneCityCode = "01"
'            txtHomeFaxAreaCode = "01"
'            cmbHomeCity.Text = ""
'         End If
'    End If
    
    If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
       fillFrmJuristicAcctInfo
    End If

End Sub

Public Function validateFrmJuristicAcctInfo() As Integer
   
    validateFrmJuristicAcctInfo = 0
     
'    If Len(RTrim(documentsSelected)) = 0 And Len(RTrim(otherDocumentsEntered)) = 0 Then
'       MsgBox errNoDocumentsSelected(UserLang)
'       validateFrmJuristicAcctInfo = 1
'       Exit Function
'    Else
'       validateFrmJuristicAcctInfo = 0
'    End If
    
    If subCategoryCode = "25" Or subCategoryCode = "28" Or _
       subCategoryCode = "44" Or subCategoryCode = "45" Or _
       subCategoryCode = "46" Or subCategoryCode = "47" Or _
       subCategoryCode = "48" Or subCategoryCode = "49" Or _
       subCategoryCode = "50" Or subCategoryCode = "51" Or _
       subCategoryCode = "66" Or subCategoryCode = "76" Or _
       subCategoryCode = "77" Or subCategoryCode = "78" Or _
       subCategoryCode = "79" Then
        If Len(RTrim(txtHomeAddress1)) = 0 Or _
           Len(RTrim(txtHomePoBox)) = 0 Or _
           Len(RTrim(txtHomeZipCode)) = 0 Or _
           Len(RTrim(cmbHomeCity.text)) = 0 Then
          
           MsgBox errSpaceHomeAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
           txtHomeAddress1.SetFocus
           validateFrmJuristicAcctInfo = 1
           Exit Function
        Else
           validateFrmJuristicAcctInfo = 0
        End If
    End If  ' if subCategoryCode = "28"
    
    If updateAction Then
       validateFrmJuristicAcctInfo = 0
       Exit Function
    End If
    
    If tellerAction And _
       recvJuristicMsg.newOrUpdate = "U" Then
       validateFrmJuristicAcctInfo = 0
       Exit Function
    End If
    
    If subCategoryCode = "26" Or subCategoryCode = "27" Or _
       subCategoryCode = "28" Or subCategoryCode = "29" Or _
       subCategoryCode = "30" Or subCategoryCode = "31" Or _
       subCategoryCode = "34" Or subCategoryCode = "35" Or _
       subCategoryCode = "24" Or subCategoryCode = "32" Or _
       subCategoryCode = "33" Or subCategoryCode = "25" Or _
       subCategoryCode = "24" Or subCategoryCode = "51" Or _
       subCategoryCode = "57" Or subCategoryCode = "58" Then
       If optCurrentAcYes.Value = True Then
          If Mid$(cmbCurrentAcCurrency, 1, 2) <> "01" Then ' Other than SAR account
             MsgBox errOnlySarAcAllowed(UserLang)
             cmbCurrentAcCurrency.SetFocus
             validateFrmJuristicAcctInfo = 1
          Else
             validateFrmJuristicAcctInfo = 0
          End If
       End If
       If optSavingAcYes.Value = True Then
          If Mid$(cmbSavingAcCurrency, 1, 2) <> "01" Then ' Other than SAR account
             MsgBox errOnlySarAcAllowed(UserLang)
             cmbSavingAcCurrency.SetFocus
             validateFrmJuristicAcctInfo = 1
             Exit Function
          Else
             validateFrmJuristicAcctInfo = 0
          End If
       End If
       If cmbOtherAccount.ListIndex >= 0 And _
          Mid$(cmbOtherAccount.text, 1, 3) <> "000" Then
          If Mid$(cmbOtherAcCurrency, 1, 2) <> "01" Then  ' Other than SAR account
             MsgBox errOnlySarAcAllowed(UserLang)
             cmbOtherAcCurrency.SetFocus
             validateFrmJuristicAcctInfo = 1
             Exit Function
          Else
             validateFrmJuristicAcctInfo = 0
          End If
       End If
    End If
    
End Function
Public Sub formatNewJuristicNonResidentRequest()
    Dim mQry As String
    Dim tmpStr As String
    
    juristicCustInfo.msgLen = Space(6) ' to be calculated
    juristicCustInfo.service = "10"  ' 10 is for New customer creation
    juristicCustInfo.userId = gUserId
    
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       juristicCustInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       juristicCustInfo.creationOrUpdate = "U"
       juristicCustInfo.supervisorComments = recvJuristicMsg.supervisorComments
       juristicCustInfo.supervisorId = Left(recvJuristicMsg.supervisorId, 10)
    Else
       juristicCustInfo.dateTime = gDateTime
       juristicCustInfo.creationOrUpdate = "C"
       juristicCustInfo.supervisorId = Space(10)
       juristicCustInfo.supervisorComments = Space(200)
    End If
    If updateAction Or _
       (tellerAction And recvJuristicMsg.newOrUpdate = "U") Then
       juristicCustInfo.NewOrUpdateFlag = "U"
    Else
       juristicCustInfo.NewOrUpdateFlag = "N"
    End If
    
    juristicCustInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
    juristicCustInfo.branchCode = gBranchCode
    juristicCustInfo.samaMainCategory = mainCategoryCode
    juristicCustInfo.samaSubCategory = subCategoryCode
    juristicCustInfo.screenSetNo = screenSetNo
   
    juristicCustInfo.customerNo = frmJuristicNonResident.txtCustomerNo
    juristicCustInfo.custBranchCode = Mid$(frmJuristicNonResident.cmbBranchCode, 1, 4)
    If Len(RTrim(Mid$(frmJuristicNonResident.cmbAltBrCode, 1, 4))) = 0 Then
       juristicCustInfo.altBranchCode = "0000"
    Else
       juristicCustInfo.altBranchCode = Mid$(frmJuristicNonResident.cmbAltBrCode, 1, 4)
    End If
    
    juristicCustInfo.contractNo = frmJuristicNonResident.txtContractNo
    If frmJuristicNonResident.optContractDateHijri Then
        juristicCustInfo.contractDateType = "0"
        juristicCustInfo.contractExpiryDateH = Format(frmJuristicNonResident.txtContractExpiryYear, "0000") + Format(frmJuristicNonResident.cmbContractExpiryMonth, "00") + Format(frmJuristicNonResident.cmbContractExpiryDate, "00")
        juristicCustInfo.contractIssueDateH = Format(frmJuristicNonResident.txtContractIssueYear, "0000") + Format(frmJuristicNonResident.cmbContractIssueMonth.text, "00") + Format(frmJuristicNonResident.cmbContractIssueDate, "00")
        juristicCustInfo.contractIssueDateG = Space(8)
        juristicCustInfo.contractExpiryDateG = Space(8)
    Else
        juristicCustInfo.contractDateType = "1"
        juristicCustInfo.contractExpiryDateG = Format(frmJuristicNonResident.txtContractExpiryYear, "0000") + Format(frmJuristicNonResident.cmbContractExpiryMonth, "00") + Format(frmJuristicNonResident.cmbContractExpiryDate, "00")
        juristicCustInfo.contractIssueDateG = Format(frmJuristicNonResident.txtContractIssueYear, "0000") + Format(frmJuristicNonResident.cmbContractIssueMonth.text, "00") + Format(frmJuristicNonResident.cmbContractIssueDate, "00")
        juristicCustInfo.contractIssueDateH = Space(8)
        juristicCustInfo.contractExpiryDateH = Space(8)
    End If
    
    '--Sama Authority number--
    
    If Len(RTrim(frmJuristicNonResident.txtSamaAuthNo)) <> 0 Then
        juristicCustInfo.samaAuthNo = frmJuristicNonResident.txtSamaAuthNo
    Else
        juristicCustInfo.samaAuthNo = Space(15)
    End If
    
    If frmJuristicNonResident.optSamaAuthDateHijri Then
       juristicCustInfo.samaAuthDateType = "0"
       juristicCustInfo.samaAuthExpiryDateH = Format(frmJuristicNonResident.txtSamaAuthExpiryYear, "0000") + Format(frmJuristicNonResident.cmbSamaAuthExpiryMonth, "00") + Format(frmJuristicNonResident.cmbSamaAuthExpiryDate, "00")
       juristicCustInfo.samaAuthIssueDateH = Format(frmJuristicNonResident.txtSamaAuthIssueYear, "0000") + Format(frmJuristicNonResident.cmbSamaAuthIssueMonth.text, "00") + Format(frmJuristicNonResident.cmbSamaAuthIssueDate, "00")
       juristicCustInfo.samaAuthIssueDateG = Space(8)
       juristicCustInfo.samaAuthExpiryDateG = Space(8)
    Else
       juristicCustInfo.samaAuthDateType = "1"
       juristicCustInfo.samaAuthExpiryDateG = Format(frmJuristicNonResident.txtSamaAuthExpiryYear, "0000") + Format(frmJuristicNonResident.cmbSamaAuthExpiryMonth, "00") + Format(frmJuristicNonResident.cmbSamaAuthExpiryDate, "00")
       juristicCustInfo.samaAuthIssueDateG = Format(frmJuristicNonResident.txtSamaAuthIssueYear, "0000") + Format(frmJuristicNonResident.cmbSamaAuthIssueMonth.text, "00") + Format(frmJuristicNonResident.cmbSamaAuthIssueDate, "00")
       juristicCustInfo.samaAuthIssueDateH = Space(8)
       juristicCustInfo.samaAuthExpiryDateH = Space(8)
    End If
    
    '--License Number--
    
    If Len(RTrim(frmJuristicNonResident.txtLicNo)) <> 0 Then
       juristicCustInfo.licNo = frmJuristicNonResident.txtLicNo
    Else
       juristicCustInfo.licNo = Space(15)
    End If
    
    If frmJuristicNonResident.optLicDateHijri Then
       juristicCustInfo.licDateType = "0"
       juristicCustInfo.licIssueDateH = Format(frmJuristicNonResident.txtLicIssueYear, "0000") + Format(frmJuristicNonResident.cmbLicIssueMonth.text, "00") + Format(frmJuristicNonResident.cmbLicIssueDate, "00")
       juristicCustInfo.licExpiryDateH = Format(frmJuristicNonResident.txtLicExpiryYear, "0000") + Format(frmJuristicNonResident.cmbLicExpiryMonth, "00") + Format(frmJuristicNonResident.cmbLicExpiryDate, "00")
       juristicCustInfo.licIssueDateG = Space(8)
       juristicCustInfo.licExpiryDateG = Space(8)
    Else
       juristicCustInfo.licDateType = "1"
       juristicCustInfo.licIssueDateG = Format(frmJuristicNonResident.txtLicIssueYear, "0000") + Format(frmJuristicNonResident.cmbLicIssueMonth.text, "00") + Format(frmJuristicNonResident.cmbLicIssueDate, "00")
       juristicCustInfo.licExpiryDateG = Format(frmJuristicNonResident.txtLicExpiryYear, "0000") + Format(frmJuristicNonResident.cmbLicExpiryMonth, "00") + Format(frmJuristicNonResident.cmbLicExpiryDate, "00")
       juristicCustInfo.licIssueDateH = Space(8)
       juristicCustInfo.licExpiryDateH = Space(8)
    End If
    
    '--Approval document reference number--
    
    If Len(RTrim(frmJuristicNonResident.txtApproverNo)) <> 0 Then
        juristicCustInfo.appRefNo = frmJuristicNonResident.txtApproverNo
    Else
        juristicCustInfo.appRefNo = Space(15)
    End If
    
    If frmJuristicNonResident.optAppDateHijri Then
       juristicCustInfo.appDateType = "0"
       juristicCustInfo.appExpiryDateH = Format(frmJuristicNonResident.txtAppExpiryYear, "0000") & Format(frmJuristicNonResident.cmbAppExpiryMonth, "00") & Format(frmJuristicNonResident.cmbAppExpiryDate, "00")
       juristicCustInfo.appIssueDateH = Format(frmJuristicNonResident.txtAppIssueYear, "0000") & Format(frmJuristicNonResident.cmbAppIssueMonth.text, "00") & Format(frmJuristicNonResident.cmbAppIssueDate, "00")
       juristicCustInfo.appIssueDateG = Space(8)
       juristicCustInfo.appExpiryDateG = Space(8)
    Else
       juristicCustInfo.appDateType = "1"
       juristicCustInfo.appExpiryDateG = Format(frmJuristicNonResident.txtAppExpiryYear, "0000") & Format(frmJuristicNonResident.cmbAppExpiryMonth, "00") & Format(frmJuristicNonResident.cmbAppExpiryDate, "00")
       juristicCustInfo.appIssueDateG = Format(frmJuristicNonResident.txtAppIssueYear, "0000") & Format(frmJuristicNonResident.cmbAppIssueMonth.text, "00") & Format(frmJuristicNonResident.cmbAppIssueDate, "00")
       juristicCustInfo.appIssueDateH = Space(8)
       juristicCustInfo.appExpiryDateH = Space(8)
    End If
    juristicCustInfo.appRefName = frmJuristicNonResident.txtApproverName
    
    '----------
   
    juristicCustInfo.ppNo = Space(15)
    juristicCustInfo.ppDateType = Space(1)
    juristicCustInfo.ppIssueDateH = Space(8)
    juristicCustInfo.ppExpiryDateH = Space(8)
    juristicCustInfo.ppIssueDateG = Space(8)
    juristicCustInfo.ppExpiryDateG = Space(8)
    
     '--Diplomatic card number --
    
    juristicCustInfo.dcNo = Space(15)
         
    juristicCustInfo.dcDateType = Space(1)
    juristicCustInfo.dcIssueDateG = Space(8)
    juristicCustInfo.dcExpiryDateG = Space(8)
    juristicCustInfo.dcIssueDateH = Space(8)
    juristicCustInfo.dcExpiryDateH = Space(8)
    
    '--Visa number--
    
    juristicCustInfo.visaNo = Space(15)
    juristicCustInfo.visaDateType = Space(1)
    juristicCustInfo.visaIssueDateG = Space(8)
    juristicCustInfo.visaExpiryDateG = Space(8)
    juristicCustInfo.visaIssueDateH = Space(8)
    juristicCustInfo.visaExpiryDateH = Space(8)
    
    juristicCustInfo.crNo = Space(15)
    juristicCustInfo.crDateType = Space(1)
    juristicCustInfo.crIssueDateH = Space(8)
    juristicCustInfo.crExpiryDateH = Space(8)
    juristicCustInfo.crIssueDateG = Space(8)
    juristicCustInfo.crExpiryDateG = Space(8)
    
    juristicCustInfo.crIssuedAt = Space(20)
    
    If frmJuristicNonResident.optLangArabic Then
       juristicCustInfo.langPref = "0"
    Else
       juristicCustInfo.langPref = "1"
    End If
    
    juristicCustInfo.nationality = Mid$(frmJuristicNonResident.cmbNationality, 1, 3)
    juristicCustInfo.purposeOfAccount = frmJuristicNonResident.txtPurposeOfAccount
    juristicCustInfo.govtShareHoldingPerc = Space(3)
    juristicCustInfo.saudiShareHoldingPerc = Space(3)
    juristicCustInfo.foreignShareHoldingPerc = Space(3)
    
    juristicCustInfo.doeDateType = Space(1)
    juristicCustInfo.doeDateH = Space(8)
    juristicCustInfo.doeDateG = Space(8)
    
    juristicCustInfo.aOrgFirstName = frmJuristicNonResident.txtArabFirstName
    juristicCustInfo.aOrg2ndName = frmJuristicNonResident.txtArab2ndName
    juristicCustInfo.aOrgShortName = frmJuristicNonResident.txtArabShortName
    juristicCustInfo.eOrgFirstName = frmJuristicNonResident.txtEngFirstName
    juristicCustInfo.eOrg2ndName = frmJuristicNonResident.txtEnglish2ndName
    juristicCustInfo.eOrgShortName = frmJuristicNonResident.txtEngShortName
    juristicCustInfo.alphaSearchCode = frmJuristicNonResident.txtOrgAlphaSearch
    
    juristicCustInfo.residentStatus = "1"  ' Non-Resident CHECK - RAJESH
    
    juristicCustInfo.businessType = Mid$(frmJuristicNonResident.cmbBusinessType.text, 1, 3)
    
    If frmJuristicNonResident.optSaudiPost = True Then
       juristicCustInfo.addressType = "1"
       juristicCustInfo.address1 = Format(frmJuristicNonResident.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
                                       frmJuristicNonResident.txtSaudiPostStreetName
       juristicCustInfo.poBox = frmJuristicNonResident.txtSaudiPostUnit
       juristicCustInfo.zipCode = Format(frmJuristicNonResident.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                                  frmJuristicNonResident.txtSaudiPostAdditionalNo
       juristicCustInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       juristicCustInfo.addressType = "0"
       juristicCustInfo.address1 = frmJuristicNonResident.txtAddress1
       juristicCustInfo.address2 = frmJuristicNonResident.txtAddress2
       juristicCustInfo.poBox = frmJuristicNonResident.txtPOBox
       juristicCustInfo.zipCode = frmJuristicNonResident.txtPinCode
       juristicCustInfo.country = Left$(frmJuristicNonResident.cmbCountry.text, 3)
    End If
    
    If UserLang = ENGLISH And _
       juristicCustInfo.langPref = "0" Then ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                             frmJuristicNonResident.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          juristicCustInfo.cityName = rs(0)
       Else
          juristicCustInfo.cityName = frmJuristicNonResident.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       juristicCustInfo.langPref = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmJuristicNonResident.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          juristicCustInfo.cityName = rs(0)
       Else
          juristicCustInfo.cityName = frmJuristicNonResident.cmbCity.text
       End If
    Else
        juristicCustInfo.cityName = frmJuristicNonResident.cmbCity.text
    End If
    
    juristicCustInfo.telOffAreaCode = frmJuristicNonResident.txtOffPhoneCityCode
    juristicCustInfo.telOffNo = frmJuristicNonResident.txtOffPhoneNo
    juristicCustInfo.telOffExt = frmJuristicNonResident.txtOffPhoneExt
    juristicCustInfo.telHomeAreaCode = frmJuristicNonResident.txtResPhoneCityCode
    juristicCustInfo.telHomeNo = frmJuristicNonResident.txtResPhoneNo
    juristicCustInfo.telHomeExt = frmJuristicNonResident.txtResPhoneExt
    juristicCustInfo.faxAreaCode = frmJuristicNonResident.txtFaxCityCode
    juristicCustInfo.faxNo = frmJuristicNonResident.txtFaxNo
    juristicCustInfo.faxExt = frmJuristicNonResident.txtFaxExt
    If Len(RTrim(frmJuristicNonResident.txtMobileNo)) <> 0 Then
       juristicCustInfo.mobileNo = frmJuristicNonResident.txtMobileAreaCode & frmJuristicNonResident.txtMobileNo
    Else
       juristicCustInfo.mobileNo = Space(10)
    End If
    juristicCustInfo.pagerNo = frmJuristicNonResident.txtPagerNo
    juristicCustInfo.eMail = frmJuristicNonResident.txtEmailAddress
    
    juristicCustInfo.homeAddress1 = txtHomeAddress1
    juristicCustInfo.homeAddress2 = txtHomeAddress2
    juristicCustInfo.homePoBox = txtHomePoBox
    juristicCustInfo.homeCityName = cmbHomeCity
    juristicCustInfo.homeZipCode = txtHomeZipCode
    juristicCustInfo.homeCountry = Mid$(cmbHomeCountry, 1, 3)
    juristicCustInfo.homeTelOffAreaCode = txtHomeOffPhoneCityCode
    juristicCustInfo.homeTelOffNo = txtHomeOffPhoneNo
    juristicCustInfo.homeTelOffExt = txtHomeOffPhoneExt
    juristicCustInfo.homeTelHomeAreaCode = txtHomeResPhoneCityCode
    juristicCustInfo.homeTelHomeNo = txtHomeResPhoneNo
    juristicCustInfo.homeTelHomeExt = txtHomeResPhoneExt
    juristicCustInfo.homeFaxAreaCode = txtHomeFaxAreaCode
    juristicCustInfo.homeFaxNo = txtHomeFaxNo
    juristicCustInfo.homeFaxExt = txtHomeFaxExt
    If Len(RTrim(txtHomeMobileNo)) <> 0 Then
       juristicCustInfo.homeMobileNo = txtHomeMobileAreaCode & txtHomeMobileNo
    Else
       juristicCustInfo.homeMobileNo = Space(10)
    End If
    juristicCustInfo.homePagerNo = txtHomePager
    juristicCustInfo.homeEmail = txtHomeEmail
    
    juristicCustInfo.documents = Format(documentsSelected, "!" & String(60, "@"))
    juristicCustInfo.documentOther = Format(otherDocumentsEntered, "!" & String(50, "@"))
   
    If optInternetYes Then
       juristicCustInfo.internetBankAcc = "1"
    Else
       juristicCustInfo.internetBankAcc = "0"
    End If
    
    If optCustAdviceYes Then
       juristicCustInfo.custAdviceFlag = "1"
    Else
       juristicCustInfo.custAdviceFlag = "0"
    End If
    
    If optSignSingle Then
       juristicCustInfo.signatureNature = "0"
    Else
       juristicCustInfo.signatureNature = "1"
    End If
    
    If optSamaUpdYes = True Then
       juristicCustInfo.updatedForSama = "1"
    Else
       juristicCustInfo.updatedForSama = "0"
    End If
    If Len(RTrim(txtRelationshipManager)) = 0 Then
       juristicCustInfo.relationshipManager = Space(25)
    Else
       juristicCustInfo.relationshipManager = txtRelationshipManager
    End If
    If Len(RTrim(txtGeneralMemo)) = 0 Then
       juristicCustInfo.generalMemo = Space(25)
    Else
       juristicCustInfo.generalMemo = txtGeneralMemo
    End If
    If Len(RTrim(txtMarketingMemo)) = 0 Then
       juristicCustInfo.marketingMemo = Space(25)
    Else
       juristicCustInfo.marketingMemo = txtMarketingMemo
    End If

End Sub
Public Sub formatNewJuristicDiplomatsRequest()
    Dim mQry As String
    Dim tmpStr As String
         
    juristicCustInfo.msgLen = Space(6) ' to be calculated
    juristicCustInfo.service = "10"  ' 10 is for New customer creation
    juristicCustInfo.userId = gUserId
    
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       juristicCustInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       juristicCustInfo.creationOrUpdate = "U"
       juristicCustInfo.supervisorComments = recvJuristicMsg.supervisorComments
       juristicCustInfo.supervisorId = Left(recvJuristicMsg.supervisorId, 10)
    Else
       juristicCustInfo.dateTime = gDateTime
       juristicCustInfo.creationOrUpdate = "C"
       juristicCustInfo.supervisorId = Space(10)
       juristicCustInfo.supervisorComments = Space(200)
    End If
    If updateAction Or _
       (tellerAction And recvJuristicMsg.newOrUpdate = "U") Then
       juristicCustInfo.NewOrUpdateFlag = "U"
    Else
       juristicCustInfo.NewOrUpdateFlag = "N"
    End If
    
    juristicCustInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
    juristicCustInfo.branchCode = gBranchCode
    juristicCustInfo.samaMainCategory = mainCategoryCode
    juristicCustInfo.samaSubCategory = subCategoryCode
    juristicCustInfo.screenSetNo = screenSetNo
   
    juristicCustInfo.customerNo = frmJuristicDiplomats.txtCustomerNo
    juristicCustInfo.custBranchCode = Mid$(frmJuristicDiplomats.cmbBranchCode, 1, 4)
    If Len(RTrim(Mid$(frmJuristicDiplomats.cmbAltBrCode, 1, 4))) = 0 Then
       juristicCustInfo.altBranchCode = "0000"
    Else
       juristicCustInfo.altBranchCode = Mid$(frmJuristicDiplomats.cmbAltBrCode, 1, 4)
    End If
    
    juristicCustInfo.ppNo = frmJuristicDiplomats.txtPPNo
    If frmJuristicDiplomats.optPPDateHijri Then
        juristicCustInfo.ppDateType = "0"
        juristicCustInfo.ppExpiryDateH = Format(frmJuristicDiplomats.txtPPExpiryYear, "0000") & Format(frmJuristicDiplomats.cmbPPExpiryMonth, "00") & Format(frmJuristicDiplomats.cmbPPExpiryDate, "00")
        juristicCustInfo.ppIssueDateH = Format(frmJuristicDiplomats.txtPPIssueYear, "0000") & Format(frmJuristicDiplomats.cmbPPIssueMonth.text, "00") & Format(frmJuristicDiplomats.cmbPPIssueDate, "00")
        juristicCustInfo.ppIssueDateG = Space(8)
        juristicCustInfo.ppExpiryDateG = Space(8)
    Else
        juristicCustInfo.ppDateType = "1"
        juristicCustInfo.ppExpiryDateG = Format(frmJuristicDiplomats.txtPPExpiryYear, "0000") & Format(frmJuristicDiplomats.cmbPPExpiryMonth, "00") & Format(frmJuristicDiplomats.cmbPPExpiryDate, "00")
        juristicCustInfo.ppIssueDateG = Format(frmJuristicDiplomats.txtPPIssueYear, "0000") & Format(frmJuristicDiplomats.cmbPPIssueMonth.text, "00") & Format(frmJuristicDiplomats.cmbPPIssueDate, "00")
        juristicCustInfo.ppIssueDateH = Space(8)
        juristicCustInfo.ppExpiryDateH = Space(8)
    End If
    
     '--Diplomatic card number --
    
    If Len(RTrim(frmJuristicDiplomats.txtDiplomaticCardNo)) <> 0 Then
        juristicCustInfo.dcNo = frmJuristicDiplomats.txtDiplomaticCardNo
    Else
        juristicCustInfo.dcNo = Space(15)
    End If
         
    If frmJuristicDiplomats.optDCDateHijri Then
       juristicCustInfo.dcDateType = "0"
       juristicCustInfo.dcExpiryDateH = Format(frmJuristicDiplomats.txtDCExpiryYear, "0000") & Format(frmJuristicDiplomats.cmbDCExpiryMonth, "00") & Format(frmJuristicDiplomats.cmbDCExpiryDate, "00")
       juristicCustInfo.dcIssueDateH = Format(frmJuristicDiplomats.txtDCIssueYear, "0000") & Format(frmJuristicDiplomats.cmbDCIssueMonth.text, "00") & Format(frmJuristicDiplomats.cmbDCIssueDate, "00")
       juristicCustInfo.dcIssueDateG = Space(8)
       juristicCustInfo.dcExpiryDateG = Space(8)
    Else
       juristicCustInfo.dcDateType = "1"
       juristicCustInfo.dcExpiryDateG = Format(frmJuristicDiplomats.txtDCExpiryYear, "0000") & Format(frmJuristicDiplomats.cmbDCExpiryMonth, "00") & Format(frmJuristicDiplomats.cmbDCExpiryDate, "00")
       juristicCustInfo.dcIssueDateG = Format(frmJuristicDiplomats.txtDCIssueYear, "0000") & Format(frmJuristicDiplomats.cmbDCIssueMonth.text, "00") & Format(frmJuristicDiplomats.cmbDCIssueDate, "00")
       juristicCustInfo.dcIssueDateH = Space(8)
       juristicCustInfo.dcExpiryDateH = Space(8)
    End If
    
    '--Visa number--
    
    If Len(RTrim(frmJuristicDiplomats.txtVisaNo)) <> 0 Then
        juristicCustInfo.visaNo = frmJuristicDiplomats.txtVisaNo
    Else
        juristicCustInfo.visaNo = Space(15)
    End If
         
    If frmJuristicDiplomats.optVisaDateHijri Then
       juristicCustInfo.visaDateType = "0"
       juristicCustInfo.visaExpiryDateH = Format(frmJuristicDiplomats.txtVisaExpiryYear, "0000") & Format(frmJuristicDiplomats.cmbVisaExpiryMonth, "00") & Format(frmJuristicDiplomats.cmbVisaExpiryDate, "00")
       juristicCustInfo.visaIssueDateH = Format(frmJuristicDiplomats.txtVisaIssueYear, "0000") & Format(frmJuristicDiplomats.cmbVisaIssueMonth.text, "00") & Format(frmJuristicDiplomats.cmbVisaIssueDate, "00")
       juristicCustInfo.visaIssueDateG = Space(8)
       juristicCustInfo.visaExpiryDateG = Space(8)
    Else
       juristicCustInfo.visaDateType = "1"
       juristicCustInfo.visaExpiryDateG = Format(frmJuristicDiplomats.txtVisaExpiryYear, "0000") & Format(frmJuristicDiplomats.cmbVisaExpiryMonth, "00") & Format(frmJuristicDiplomats.cmbVisaExpiryDate, "00")
       juristicCustInfo.visaIssueDateG = Format(frmJuristicDiplomats.txtVisaIssueYear, "0000") & Format(frmJuristicDiplomats.cmbVisaIssueMonth.text, "00") & Format(frmJuristicDiplomats.cmbVisaIssueDate, "00")
       juristicCustInfo.visaIssueDateH = Space(8)
       juristicCustInfo.visaExpiryDateH = Space(8)
    End If
    
    '--Approval document reference number--
    
    If Len(RTrim(frmJuristicDiplomats.txtApproverNo)) <> 0 Then
        juristicCustInfo.appRefNo = frmJuristicDiplomats.txtApproverNo
    Else
        juristicCustInfo.appRefNo = Space(15)
    End If
    
    If frmJuristicDiplomats.optAppDateHijri Then
       juristicCustInfo.appDateType = "0"
       juristicCustInfo.appExpiryDateH = Format(frmJuristicDiplomats.txtAppExpiryYear, "0000") & Format(frmJuristicDiplomats.cmbAppExpiryMonth, "00") & Format(frmJuristicDiplomats.cmbAppExpiryDate, "00")
       juristicCustInfo.appIssueDateH = Format(frmJuristicDiplomats.txtAppIssueYear, "0000") & Format(frmJuristicDiplomats.cmbAppIssueMonth.text, "00") & Format(frmJuristicDiplomats.cmbAppIssueDate, "00")
       juristicCustInfo.appIssueDateG = Space(8)
       juristicCustInfo.appExpiryDateG = Space(8)
    Else
       juristicCustInfo.appDateType = "1"
       juristicCustInfo.appExpiryDateG = Format(frmJuristicDiplomats.txtAppExpiryYear, "0000") & Format(frmJuristicDiplomats.cmbAppExpiryMonth, "00") & Format(frmJuristicDiplomats.cmbAppExpiryDate, "00")
       juristicCustInfo.appIssueDateG = Format(frmJuristicDiplomats.txtAppIssueYear, "0000") & Format(frmJuristicDiplomats.cmbAppIssueMonth.text, "00") & Format(frmJuristicDiplomats.cmbAppIssueDate, "00")
       juristicCustInfo.appIssueDateH = Space(8)
       juristicCustInfo.appExpiryDateH = Space(8)
    End If
    juristicCustInfo.appRefName = frmJuristicDiplomats.txtApproverName

    '----------
    
    juristicCustInfo.crNo = Space(15)
    juristicCustInfo.crDateType = Space(1)
    juristicCustInfo.crIssueDateH = Space(8)
    juristicCustInfo.crExpiryDateH = Space(8)
    juristicCustInfo.crIssueDateG = Space(8)
    juristicCustInfo.crExpiryDateG = Space(8)
    
    juristicCustInfo.crIssuedAt = Space(20)
    
        '--License Number--
    juristicCustInfo.licNo = Space(15)
    juristicCustInfo.licDateType = Space(1)
    juristicCustInfo.licIssueDateH = Space(8)
    juristicCustInfo.licExpiryDateH = Space(8)
    juristicCustInfo.licIssueDateG = Space(8)
    juristicCustInfo.licExpiryDateG = Space(8)
   
    '--Sama Authority number--
    juristicCustInfo.samaAuthNo = Space(15)
    juristicCustInfo.samaAuthDateType = "0"
    juristicCustInfo.samaAuthIssueDateH = Space(8)
    juristicCustInfo.samaAuthExpiryDateH = Space(8)
    juristicCustInfo.samaAuthIssueDateG = Space(8)
    juristicCustInfo.samaAuthExpiryDateG = Space(8)
    
    '--contract number
    juristicCustInfo.contractNo = Space(15)
    juristicCustInfo.contractDateType = Space(1)
    juristicCustInfo.contractIssueDateG = Space(8)
    juristicCustInfo.contractExpiryDateG = Space(8)
    juristicCustInfo.contractIssueDateH = Space(8)
    juristicCustInfo.contractExpiryDateH = Space(8)
   
    juristicCustInfo.purposeOfAccount = Space(50)
    juristicCustInfo.govtShareHoldingPerc = Space(3)
    juristicCustInfo.saudiShareHoldingPerc = Space(3)
    juristicCustInfo.foreignShareHoldingPerc = Space(3)
    
    juristicCustInfo.doeDateType = Space(1)
    juristicCustInfo.doeDateH = Space(8)
    juristicCustInfo.doeDateG = Space(8)
    
  
    '-------------
    If frmJuristicDiplomats.optLangArabic Then
       juristicCustInfo.langPref = "0"
    Else
       juristicCustInfo.langPref = "1"
    End If
    
    juristicCustInfo.residentStatus = "0"  ' Resident CHECK - RAJESH
    
    juristicCustInfo.nationality = Mid$(frmJuristicDiplomats.cmbNationality, 1, 3)
        
    juristicCustInfo.aOrgFirstName = frmJuristicDiplomats.txtArabFirstName
    juristicCustInfo.aOrg2ndName = frmJuristicDiplomats.txtArab2ndName
    juristicCustInfo.aOrgShortName = frmJuristicDiplomats.txtArabShortName
    juristicCustInfo.eOrgFirstName = frmJuristicDiplomats.txtEngFirstName
    juristicCustInfo.eOrg2ndName = frmJuristicDiplomats.txtEnglish2ndName
    juristicCustInfo.eOrgShortName = frmJuristicDiplomats.txtEngShortName
    juristicCustInfo.alphaSearchCode = frmJuristicDiplomats.txtOrgAlphaSearch
    
    juristicCustInfo.businessType = Mid$(frmJuristicDiplomats.cmbBusinessType.text, 1, 3)
     
    If frmJuristicDiplomats.optSaudiPost = True Then
       juristicCustInfo.addressType = "1"
       juristicCustInfo.address1 = Format(frmJuristicDiplomats.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
                                       frmJuristicDiplomats.txtSaudiPostStreetName
       juristicCustInfo.poBox = frmJuristicDiplomats.txtSaudiPostUnit
       juristicCustInfo.zipCode = Format(frmJuristicDiplomats.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                                  frmJuristicDiplomats.txtSaudiPostAdditionalNo
       juristicCustInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       juristicCustInfo.addressType = "0"
       juristicCustInfo.address1 = frmJuristicDiplomats.txtAddress1
       juristicCustInfo.address2 = frmJuristicDiplomats.txtAddress2
       juristicCustInfo.poBox = frmJuristicDiplomats.txtPOBox
       juristicCustInfo.zipCode = frmJuristicDiplomats.txtPinCode
       juristicCustInfo.country = Left$(frmJuristicDiplomats.cmbCountry.text, 3)
    End If
    
    If UserLang = ENGLISH And _
       juristicCustInfo.langPref = "0" Then ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                             frmJuristicDiplomats.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          juristicCustInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
       Else
          juristicCustInfo.cityName = frmJuristicDiplomats.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       juristicCustInfo.langPref = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmJuristicDiplomats.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          juristicCustInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
       Else
          juristicCustInfo.cityName = frmJuristicDiplomats.cmbCity.text
       End If
    Else
        juristicCustInfo.cityName = frmJuristicDiplomats.cmbCity.text
    End If

    juristicCustInfo.telOffAreaCode = frmJuristicDiplomats.txtOffPhoneCityCode
    juristicCustInfo.telOffNo = frmJuristicDiplomats.txtOffPhoneNo
    juristicCustInfo.telOffExt = frmJuristicDiplomats.txtOffPhoneExt
    juristicCustInfo.telHomeAreaCode = frmJuristicDiplomats.txtResPhoneCityCode
    juristicCustInfo.telHomeNo = frmJuristicDiplomats.txtResPhoneNo
    juristicCustInfo.telHomeExt = frmJuristicDiplomats.txtResPhoneExt
    juristicCustInfo.faxAreaCode = frmJuristicDiplomats.txtFaxCityCode
    juristicCustInfo.faxNo = frmJuristicDiplomats.txtFaxNo
    juristicCustInfo.faxExt = frmJuristicDiplomats.txtFaxExt
    If Len(RTrim(frmJuristicDiplomats.txtMobileNo)) <> 0 Then
       juristicCustInfo.mobileNo = frmJuristicDiplomats.txtMobileAreaCode + frmJuristicDiplomats.txtMobileNo
    Else
       juristicCustInfo.mobileNo = Space(10)
    End If
    juristicCustInfo.pagerNo = frmJuristicDiplomats.txtPagerNo
    juristicCustInfo.eMail = frmJuristicDiplomats.txtEmailAddress
    
    juristicCustInfo.homeAddress1 = txtHomeAddress1
    juristicCustInfo.homeAddress2 = txtHomeAddress2
    juristicCustInfo.homePoBox = txtHomePoBox
    juristicCustInfo.homeCityName = cmbHomeCity
    juristicCustInfo.homeZipCode = txtHomeZipCode
    juristicCustInfo.homeCountry = Mid$(cmbHomeCountry, 1, 3)
    juristicCustInfo.homeTelOffAreaCode = txtHomeOffPhoneCityCode
    juristicCustInfo.homeTelOffNo = txtHomeOffPhoneNo
    juristicCustInfo.homeTelOffExt = txtHomeOffPhoneExt
    juristicCustInfo.homeTelHomeAreaCode = txtHomeResPhoneCityCode
    juristicCustInfo.homeTelHomeNo = txtHomeResPhoneNo
    juristicCustInfo.homeTelHomeExt = txtHomeResPhoneExt
    juristicCustInfo.homeFaxAreaCode = txtHomeFaxAreaCode
    juristicCustInfo.homeFaxNo = txtHomeFaxNo
    juristicCustInfo.homeFaxExt = txtHomeFaxExt
    If Len(RTrim(txtHomeMobileNo)) <> 0 Then
       juristicCustInfo.homeMobileNo = txtHomeMobileAreaCode & txtHomeMobileNo
    Else
       juristicCustInfo.homeMobileNo = Space(10)
    End If
    juristicCustInfo.homePagerNo = txtHomePager
    juristicCustInfo.homeEmail = txtHomeEmail
    
    juristicCustInfo.documents = Format(documentsSelected, "!" & String(60, "@"))
    juristicCustInfo.documentOther = Format(otherDocumentsEntered, "!" & String(50, "@"))
   
    If optInternetYes Then
       juristicCustInfo.internetBankAcc = "1"
    Else
       juristicCustInfo.internetBankAcc = "0"
    End If
    
    If optCustAdviceYes Then
       juristicCustInfo.custAdviceFlag = "1"
    Else
       juristicCustInfo.custAdviceFlag = "0"
    End If
    
    If optSignSingle Then
       juristicCustInfo.signatureNature = "0"
    Else
       juristicCustInfo.signatureNature = "1"
    End If
    
    If optSamaUpdYes = True Then
       juristicCustInfo.updatedForSama = "1"
    Else
       juristicCustInfo.updatedForSama = "0"
    End If
    If Len(RTrim(txtRelationshipManager)) = 0 Then
       juristicCustInfo.relationshipManager = Space(25)
    Else
       juristicCustInfo.relationshipManager = txtRelationshipManager
    End If
    If Len(RTrim(txtGeneralMemo)) = 0 Then
       juristicCustInfo.generalMemo = Space(25)
    Else
       juristicCustInfo.generalMemo = txtGeneralMemo
    End If
    If Len(RTrim(txtMarketingMemo)) = 0 Then
       juristicCustInfo.marketingMemo = Space(25)
    Else
       juristicCustInfo.marketingMemo = txtMarketingMemo
    End If
End Sub

Public Sub formatNewJuristicCustomerRequest()
    Dim mQry As String
    Dim tmpStr As String
    
    juristicCustInfo.msgLen = Space(6) ' to be calculated
    juristicCustInfo.service = "10"  ' 10 is for New customer creation
    juristicCustInfo.userId = gUserId
    
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       juristicCustInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       juristicCustInfo.creationOrUpdate = "U"
       juristicCustInfo.supervisorComments = recvJuristicMsg.supervisorComments
       juristicCustInfo.supervisorId = Left(recvJuristicMsg.supervisorId, 10)
    Else
       juristicCustInfo.dateTime = gDateTime
       juristicCustInfo.creationOrUpdate = "C"
       juristicCustInfo.supervisorId = Space(10)
       juristicCustInfo.supervisorComments = Space(200)
    End If
    If updateAction Or _
       (tellerAction And recvJuristicMsg.newOrUpdate = "U") Then
       juristicCustInfo.NewOrUpdateFlag = "U"
    Else
       juristicCustInfo.NewOrUpdateFlag = "N"
    End If
    
    juristicCustInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
    juristicCustInfo.branchCode = gBranchCode
    juristicCustInfo.samaMainCategory = mainCategoryCode
    juristicCustInfo.samaSubCategory = subCategoryCode
    juristicCustInfo.screenSetNo = screenSetNo
   
    juristicCustInfo.customerNo = frmJuristicMain.txtCustomerNo
    juristicCustInfo.custBranchCode = Mid$(frmJuristicMain.cmbBranchCode, 1, 4)
    If Len(RTrim(Mid$(frmJuristicMain.cmbAltBrCode, 1, 4))) = 0 Then
       juristicCustInfo.altBranchCode = "0000"
    Else
       juristicCustInfo.altBranchCode = Mid$(frmJuristicMain.cmbAltBrCode, 1, 4)
    End If
    
    juristicCustInfo.crNo = frmJuristicMain.txtCrNo
    If frmJuristicMain.optCrDateHijri Then
        juristicCustInfo.crDateType = "0"
        juristicCustInfo.crExpiryDateH = Format(frmJuristicMain.txtCrExpiryYear, "0000") & Format(frmJuristicMain.cmbCrExpiryMonth, "00") & Format(frmJuristicMain.cmbCrExpiryDate, "00")
        juristicCustInfo.crIssueDateH = Format(frmJuristicMain.txtCrIssueYear, "0000") & Format(frmJuristicMain.cmbCrIssueMonth.text, "00") & Format(frmJuristicMain.cmbCrIssuedate, "00")
        juristicCustInfo.crIssueDateG = Space(8)
        juristicCustInfo.crExpiryDateG = Space(8)
    Else
        juristicCustInfo.crDateType = "1"
        juristicCustInfo.crExpiryDateG = Format(frmJuristicMain.txtCrExpiryYear, "0000") & Format(frmJuristicMain.cmbCrExpiryMonth, "00") & Format(frmJuristicMain.cmbCrExpiryDate, "00")
        juristicCustInfo.crIssueDateG = Format(frmJuristicMain.txtCrIssueYear, "0000") & Format(frmJuristicMain.cmbCrIssueMonth.text, "00") & Format(frmJuristicMain.cmbCrIssuedate, "00")
        juristicCustInfo.crIssueDateH = Space(8)
        juristicCustInfo.crExpiryDateH = Space(8)
    End If
    
    juristicCustInfo.crIssuedAt = frmJuristicMain.cmbCrIssuedAt.text
    
        '--License Number--
    
    If Len(RTrim(frmJuristicMain.txtLicNo)) <> 0 Then
        juristicCustInfo.licNo = frmJuristicMain.txtLicNo
    Else
        juristicCustInfo.licNo = Space(15)
    End If
         
    If frmJuristicMain.optLicDateHijri Then
       juristicCustInfo.licDateType = "0"
       juristicCustInfo.licExpiryDateH = Format(frmJuristicMain.txtLicExpiryYear, "0000") & Format(frmJuristicMain.cmbLicExpiryMonth, "00") & Format(frmJuristicMain.cmbLicExpiryDate, "00")
       juristicCustInfo.licIssueDateH = Format(frmJuristicMain.txtLicIssueYear, "0000") & Format(frmJuristicMain.cmbLicIssueMonth.text, "00") & Format(frmJuristicMain.cmbLicIssueDate, "00")
       juristicCustInfo.licIssueDateG = Space(8)
       juristicCustInfo.licExpiryDateG = Space(8)
    Else
       juristicCustInfo.licDateType = "1"
       juristicCustInfo.licExpiryDateG = Format(frmJuristicMain.txtLicExpiryYear, "0000") & Format(frmJuristicMain.cmbLicExpiryMonth, "00") & Format(frmJuristicMain.cmbLicExpiryDate, "00")
       juristicCustInfo.licIssueDateG = Format(frmJuristicMain.txtLicIssueYear, "0000") & Format(frmJuristicMain.cmbLicIssueMonth.text, "00") & Format(frmJuristicMain.cmbLicIssueDate, "00")
       juristicCustInfo.licIssueDateH = Space(8)
       juristicCustInfo.licExpiryDateH = Space(8)
    End If
    
    '--Sama Authority number--
    
    If Len(RTrim(frmJuristicMain.txtSamaAuthNo)) <> 0 Then
        juristicCustInfo.samaAuthNo = frmJuristicMain.txtSamaAuthNo
    Else
        juristicCustInfo.samaAuthNo = Space(15)
    End If
    
    If frmJuristicMain.optSamaAuthDateHijri Then
       juristicCustInfo.samaAuthDateType = "0"
       juristicCustInfo.samaAuthExpiryDateH = Format(frmJuristicMain.txtSamaAuthExpiryYear, "0000") & Format(frmJuristicMain.cmbSamaAuthExpiryMonth, "00") & Format(frmJuristicMain.cmbSamaAuthExpiryDate, "00")
       juristicCustInfo.samaAuthIssueDateH = Format(frmJuristicMain.txtSamaAuthIssueYear, "0000") & Format(frmJuristicMain.cmbSamaAuthIssueMonth.text, "00") & Format(frmJuristicMain.cmbSamaAuthIssueDate, "00")
       juristicCustInfo.samaAuthIssueDateG = Space(8)
       juristicCustInfo.samaAuthExpiryDateG = Space(8)
    Else
       juristicCustInfo.samaAuthDateType = "1"
       juristicCustInfo.samaAuthExpiryDateG = Format(frmJuristicMain.txtSamaAuthExpiryYear, "0000") & Format(frmJuristicMain.cmbSamaAuthExpiryMonth, "00") & Format(frmJuristicMain.cmbSamaAuthExpiryDate, "00")
       juristicCustInfo.samaAuthIssueDateG = Format(frmJuristicMain.txtSamaAuthIssueYear, "0000") & Format(frmJuristicMain.cmbSamaAuthIssueMonth.text, "00") & Format(frmJuristicMain.cmbSamaAuthIssueDate, "00")
       juristicCustInfo.samaAuthIssueDateH = Space(8)
       juristicCustInfo.samaAuthExpiryDateH = Space(8)
    End If
    
   '--Approval document reference number--
    
    If Len(RTrim(frmJuristicMain.txtApproverNo)) <> 0 Then
        juristicCustInfo.appRefNo = frmJuristicMain.txtApproverNo
    Else
        juristicCustInfo.appRefNo = Space(15)
    End If
    
    If frmJuristicMain.optAppDateHijri Then
       juristicCustInfo.appDateType = "0"
       juristicCustInfo.appExpiryDateH = Format(frmJuristicMain.txtAppExpiryYear, "0000") & Format(frmJuristicMain.cmbAppExpiryMonth, "00") & Format(frmJuristicMain.cmbAppExpiryDate, "00")
       juristicCustInfo.appIssueDateH = Format(frmJuristicMain.txtAppIssueYear, "0000") & Format(frmJuristicMain.cmbAppIssueMonth.text, "00") & Format(frmJuristicMain.cmbAppIssueDate, "00")
       juristicCustInfo.appIssueDateG = Space(8)
       juristicCustInfo.appExpiryDateG = Space(8)
    Else
       juristicCustInfo.appDateType = "1"
       juristicCustInfo.appExpiryDateG = Format(frmJuristicMain.txtAppExpiryYear, "0000") & Format(frmJuristicMain.cmbAppExpiryMonth, "00") & Format(frmJuristicMain.cmbAppExpiryDate, "00")
       juristicCustInfo.appIssueDateG = Format(frmJuristicMain.txtAppIssueYear, "0000") & Format(frmJuristicMain.cmbAppIssueMonth.text, "00") & Format(frmJuristicMain.cmbAppIssueDate, "00")
       juristicCustInfo.appIssueDateH = Space(8)
       juristicCustInfo.appExpiryDateH = Space(8)
    End If
    juristicCustInfo.appRefName = frmJuristicMain.txtApproverName

    '----------
    
    juristicCustInfo.ppNo = Space(15)
    juristicCustInfo.ppDateType = Space(1)
    juristicCustInfo.ppIssueDateH = Space(8)
    juristicCustInfo.ppExpiryDateH = Space(8)
    juristicCustInfo.ppIssueDateG = Space(8)
    juristicCustInfo.ppExpiryDateG = Space(8)
    
     '--Diplomatic card number --
    
    juristicCustInfo.dcNo = Space(15)
         
    juristicCustInfo.dcDateType = Space(1)
    juristicCustInfo.dcIssueDateG = Space(8)
    juristicCustInfo.dcExpiryDateG = Space(8)
    juristicCustInfo.dcIssueDateH = Space(8)
    juristicCustInfo.dcExpiryDateH = Space(8)
    
    '--Visa number--
    
    juristicCustInfo.visaNo = Space(15)
    juristicCustInfo.visaDateType = Space(1)
    juristicCustInfo.visaIssueDateG = Space(8)
    juristicCustInfo.visaExpiryDateG = Space(8)
    juristicCustInfo.visaIssueDateH = Space(8)
    juristicCustInfo.visaExpiryDateH = Space(8)
    
    '--contract number
    juristicCustInfo.contractNo = Space(15)
    juristicCustInfo.contractDateType = Space(1)
    juristicCustInfo.contractIssueDateG = Space(8)
    juristicCustInfo.contractExpiryDateG = Space(8)
    juristicCustInfo.contractIssueDateH = Space(8)
    juristicCustInfo.contractExpiryDateH = Space(8)
   
    '-------------
    
    If frmJuristicMain.optLangArabic Then
       juristicCustInfo.langPref = "0"
    Else
       juristicCustInfo.langPref = "1"
    End If
    
    juristicCustInfo.nationality = Mid$(frmJuristicMain.cmbNationality, 1, 3)
    juristicCustInfo.purposeOfAccount = frmJuristicMain.txtPurposeOfAccount
    juristicCustInfo.govtShareHoldingPerc = frmJuristicMain.txtGovtShareholding
    juristicCustInfo.saudiShareHoldingPerc = frmJuristicMain.txtSaudiShareholding
    juristicCustInfo.foreignShareHoldingPerc = frmJuristicMain.txtForeignShareholding
    juristicCustInfo.aOrgFirstName = frmJuristicMain.txtArabFirstName
    juristicCustInfo.aOrg2ndName = frmJuristicMain.txtArab2ndName
    juristicCustInfo.aOrgShortName = frmJuristicMain.txtArabShortName
    juristicCustInfo.eOrgFirstName = frmJuristicMain.txtEngFirstName
    juristicCustInfo.eOrg2ndName = frmJuristicMain.txtEnglish2ndName
    juristicCustInfo.eOrgShortName = frmJuristicMain.txtEngShortName
    juristicCustInfo.alphaSearchCode = frmJuristicMain.txtOrgAlphaSearch
    If frmJuristicMain.optDOEGreg Then
       juristicCustInfo.doeDateG = Format(frmJuristicMain.txtDoeYear, "0000") & Format(frmJuristicMain.cmbDoeMonth, "00") & Format(frmJuristicMain.cmbDoeDate, "00")
       juristicCustInfo.doeDateType = "1"
       juristicCustInfo.doeDateH = Space(8)
    Else
       juristicCustInfo.doeDateH = Format(frmJuristicMain.txtDoeYear, "0000") & Format(frmJuristicMain.cmbDoeMonth, "00") & Format(frmJuristicMain.cmbDoeDate, "00")
       juristicCustInfo.doeDateType = "0"
       juristicCustInfo.doeDateG = Space(8)
    End If
    
    juristicCustInfo.residentStatus = "0"  ' Resident CHECK - RAJESH
    
    juristicCustInfo.businessType = Mid$(frmJuristicMain.cmbBusinessType.text, 1, 3)

    If frmJuristicMain.optSaudiPost = True Then
       juristicCustInfo.addressType = "1"
'       juristicCustInfo.address1 = Format(frmJuristicMain.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
'                                       frmJuristicMain.txtSaudiPostStreetName
       juristicCustInfo.address1 = Format(frmJuristicMain.txtSaudiPostGPSNo, "!@@@@@") & " " & _
                                       frmJuristicMain.txtSaudiPostStreetName
       juristicCustInfo.poBox = frmJuristicMain.txtSaudiPostUnit
       juristicCustInfo.zipCode = Format(frmJuristicMain.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                                  frmJuristicMain.txtSaudiPostAdditionalNo
       juristicCustInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       juristicCustInfo.addressType = "0"
       juristicCustInfo.address1 = frmJuristicMain.txtAddress1
       juristicCustInfo.address2 = frmJuristicMain.txtAddress2
       juristicCustInfo.poBox = frmJuristicMain.txtPOBox
       juristicCustInfo.zipCode = frmJuristicMain.txtPinCode
       juristicCustInfo.country = Left$(frmJuristicMain.cmbCountry.text, 3)
    End If
    
    If UserLang = ENGLISH And _
       juristicCustInfo.langPref = "0" Then ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                             frmJuristicMain.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          juristicCustInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          juristicCustInfo.cityName = frmJuristicMain.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       juristicCustInfo.langPref = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmJuristicMain.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          juristicCustInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "   ", rs(0))
       Else
          juristicCustInfo.cityName = frmJuristicMain.cmbCity.text
       End If
    Else
        juristicCustInfo.cityName = frmJuristicMain.cmbCity.text
    End If
    
    juristicCustInfo.telOffAreaCode = frmJuristicMain.txtOffPhoneCityCode
    juristicCustInfo.telOffNo = frmJuristicMain.txtOffPhoneNo
    juristicCustInfo.telOffExt = frmJuristicMain.txtOffPhoneExt
    juristicCustInfo.telHomeAreaCode = frmJuristicMain.txtResPhoneCityCode
    juristicCustInfo.telHomeNo = frmJuristicMain.txtResPhoneNo
    juristicCustInfo.telHomeExt = frmJuristicMain.txtResPhoneExt
    juristicCustInfo.faxAreaCode = frmJuristicMain.txtFaxCityCode
    juristicCustInfo.faxNo = frmJuristicMain.txtFaxNo
    juristicCustInfo.faxExt = frmJuristicMain.txtFaxExt
    If Len(RTrim(frmJuristicMain.txtMobileNo)) <> 0 Then
       juristicCustInfo.mobileNo = frmJuristicMain.txtMobileAreaCode & frmJuristicMain.txtMobileNo
    Else
       juristicCustInfo.mobileNo = Space(10)
    End If
    juristicCustInfo.pagerNo = frmJuristicMain.txtPagerNo
    juristicCustInfo.eMail = frmJuristicMain.txtEmailAddress
    
    juristicCustInfo.homeAddress1 = txtHomeAddress1
    juristicCustInfo.homeAddress2 = txtHomeAddress2
    juristicCustInfo.homePoBox = txtHomePoBox
    juristicCustInfo.homeCityName = cmbHomeCity
    juristicCustInfo.homeZipCode = txtHomeZipCode
    juristicCustInfo.homeCountry = Mid$(cmbHomeCountry, 1, 3)
    juristicCustInfo.homeTelOffAreaCode = txtHomeOffPhoneCityCode
    juristicCustInfo.homeTelOffNo = txtHomeOffPhoneNo
    juristicCustInfo.homeTelOffExt = txtHomeOffPhoneExt
    juristicCustInfo.homeTelHomeAreaCode = txtHomeResPhoneCityCode
    juristicCustInfo.homeTelHomeNo = txtHomeResPhoneNo
    juristicCustInfo.homeTelHomeExt = txtHomeResPhoneExt
    juristicCustInfo.homeFaxAreaCode = txtHomeFaxAreaCode
    juristicCustInfo.homeFaxNo = txtHomeFaxNo
    juristicCustInfo.homeFaxExt = txtHomeFaxExt
    If Len(RTrim(txtHomeMobileNo)) <> 0 Then
       juristicCustInfo.homeMobileNo = txtHomeMobileAreaCode & txtHomeMobileNo
    Else
       juristicCustInfo.homeMobileNo = Space(10)
    End If
    juristicCustInfo.homePagerNo = txtHomePager
    juristicCustInfo.homeEmail = txtHomeEmail
    
    juristicCustInfo.documents = Format(documentsSelected, "!" & String(60, "@"))
    juristicCustInfo.documentOther = Format(otherDocumentsEntered, "!" & String(50, "@"))
   
    If optInternetYes Then
       juristicCustInfo.internetBankAcc = "1"
    Else
       juristicCustInfo.internetBankAcc = "0"
    End If
    
    If optCustAdviceYes Then
       juristicCustInfo.custAdviceFlag = "1"
    Else
       juristicCustInfo.custAdviceFlag = "0"
    End If
    
    If optSignSingle Then
       juristicCustInfo.signatureNature = "0"
    Else
       juristicCustInfo.signatureNature = "1"
    End If
    
    If optSamaUpdYes = True Then
       juristicCustInfo.updatedForSama = "1"
    Else
       juristicCustInfo.updatedForSama = "0"
    End If
    If Len(RTrim(txtRelationshipManager)) = 0 Then
       juristicCustInfo.relationshipManager = Space(25)
    Else
       juristicCustInfo.relationshipManager = txtRelationshipManager
    End If
    If Len(RTrim(txtGeneralMemo)) = 0 Then
       juristicCustInfo.generalMemo = Space(25)
    Else
       juristicCustInfo.generalMemo = txtGeneralMemo
    End If
    If Len(RTrim(txtMarketingMemo)) = 0 Then
       juristicCustInfo.marketingMemo = Space(25)
    Else
       juristicCustInfo.marketingMemo = txtMarketingMemo
    End If

End Sub

Public Sub formatCurrentAcc(droppedFlag As String, creationOrUpdate As String)

currentAccInfo = "008" & Left$(frmJuristicAccountInfo.cmbCurrentAcCurrency.text, 2) & _
                      Left$(frmJuristicAccountInfo.cmbCurrentAcStatus.text, 2) & _
                      Left$(frmJuristicAccountInfo.cmbCurrentAcStmtFreq.text, 2) & _
                      IIf(frmJuristicAccountInfo.optCurrentAcCheckBookYes, "1", "0") & droppedFlag & _
                      creationOrUpdate

End Sub
Public Sub formatSavingAcc(droppedFlag As String, creationOrUpdate As String)

savingAccInfo = "009" & Left$(frmJuristicAccountInfo.cmbSavingAcCurrency.text, 2) & _
                      Left$(frmJuristicAccountInfo.cmbSavingAcStatus.text, 2) & _
                      Left$(frmJuristicAccountInfo.cmbSavingAcStmtFreq.text, 2) & _
                      " " & droppedFlag & creationOrUpdate

End Sub
Public Sub formatOtherAcc(droppedFlag As String, creationOrUpdate As String)
Dim otherAcc As String

If droppedFlag = "1" Then
   otherAcc = Mid$(recvJuristicMsg.otherAccInfo, 3, 3)
Else
   otherAcc = Left$(frmJuristicAccountInfo.cmbOtherAccount.text, 3)
End If

otherAccInfo = otherAcc & Left$(frmJuristicAccountInfo.cmbOtherAcCurrency.text, 2) & _
               Left$(frmJuristicAccountInfo.cmbOtherAcStatus.text, 2) & _
               Left$(frmJuristicAccountInfo.cmbOtherAcStmtFreq.text, 2) & _
               IIf(Left$(frmJuristicAccountInfo.cmbOtherAccount.text, 3) = "160", _
               IIf(frmJuristicAccountInfo.optOtherAcCheckBookYes, "1", "0"), Space(1)) & _
               droppedFlag & creationOrUpdate
End Sub

Public Sub unloadJuristicForms()
   Dim tCustNo As String
   frmJuristicAccountInfo.MousePointer = vbDefault
   frmJuristicAccountInfo.cmdCreate.Enabled = True
   frmJuristicAccountInfo.cmdCancel.Enabled = True
   frmJuristicAccountInfo.cmdPrevPage.Enabled = True
   Unload Me
   If screenSetNo = "3" Or screenSetNo = "4" Then
      Unload frmJuristicMain
   ElseIf screenSetNo = "5" Then
      Unload frmJuristicDiplomats
   ElseIf screenSetNo = "6" Then
      Unload frmJuristicNonResident
   End If
   'On Error Resume Next
   Unload frmJuristicSignatory
   Unload frmJuristicOwner
   'On Error GoTo 0
   If tellerAction = True Then
      If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
         tCustNo = Space(7)
      Else
         tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
      End If
      Unload frmSupervisorApproval
      frmEnquiry.readPendingList "00000", "T", tCustNo
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

Public Sub unloadSupForms()
  Dim tCustNo As String
  If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
     tCustNo = Space(7)
  Else
     tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
  End If
  If recvJuristicMsg.newOrUpdate = "N" And _
     recvSuperDecisionMsg.status = "000" Then
     If accOpenCardPrintAllowed = True Then
        If optCurrentAcYes Or optSavingAcYes Or Mid$(cmbOtherAccount, 1, 3) > "000" Then
           printAccOpeningCard
        End If
     End If
  End If
  Unload Me
  If screenSetNo = "3" Or screenSetNo = "4" Then
     Unload frmJuristicMain
  ElseIf screenSetNo = "5" Then
     Unload frmJuristicDiplomats
  ElseIf screenSetNo = "6" Then
     Unload frmJuristicNonResident
  End If
  
  Unload frmJuristicSignatory
  Unload frmJuristicOwner
  
  Unload frmSupervisorApproval
  frmEnquiry.readPendingList "00000", "S", tCustNo
  If UserLang = ARABIC Then
     ChangePositions frmSupervisorApproval, 11800
     frmSupervisorApproval.RightToLeft = True
     frmSupervisorApproval.Hide
  End If
  frmSupervisorApproval.Show
End Sub


Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameAccountDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameHomeCountryAddress_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Text1_Change()

End Sub

Private Sub txtFreezingGracePeriod_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtHomeEmail_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtHomeEmail_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
      On Error Resume Next
      If Len(RTrim(txtHomeEmail)) <> 0 Then
         If InStr(txtHomeEmail, "@") = 0 Then
            MsgBox errInvalidMailAddress(UserLang) '"E-mail address should contain @ character...Please Re-try"
            txtHomeEmail.SetFocus
         End If
      End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtHomeFaxAreaCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeFaxExt_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeFaxNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeMobileAreaCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeMobileNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeOffPhoneCityCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeOffPhoneExt_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtHomeOffPhoneNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomePager_Change()
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomePoBox_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeResPhoneCityCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtHomeResPhoneExt_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeResPhoneNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomeZipCode_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Sub printAccOpeningCard()
  Dim custName As String, custNo As String, accountNo As String, custBranchCode As String, customerLang As Integer
  Dim tmpStr As String
  
   If screenSetNo = "3" Or screenSetNo = "4" Then
      custNo = frmJuristicMain.txtCustomerNo
      custBranchCode = Mid$(frmJuristicMain.cmbBranchCode, 1, 4)
      If frmJuristicMain.optLangArabic Then
         custName = frmJuristicMain.txtArabFirstName & " " & _
                    frmJuristicMain.txtArab2ndName
         frmPrintAccOpeningCard.optLangArabic = True
         frmPrintAccOpeningCard.assignNameToGlobalVar frmJuristicMain.txtArabFirstName, " ", frmJuristicMain.txtArab2ndName
         customerLang = 0
      Else
         custName = frmJuristicMain.txtEngFirstName & " " & _
                    frmJuristicMain.txtEnglish2ndName
         frmPrintAccOpeningCard.optLangEnglish = True
         frmPrintAccOpeningCard.assignNameToGlobalVar frmJuristicMain.txtEngFirstName, " ", frmJuristicMain.txtEnglish2ndName
         customerLang = 1
      End If
   ElseIf screenSetNo = "5" Then
      custNo = frmJuristicDiplomats.txtCustomerNo
      custBranchCode = Mid$(frmJuristicDiplomats.cmbBranchCode, 1, 4)
      If frmJuristicDiplomats.optLangArabic Then
         custName = frmJuristicDiplomats.txtArabFirstName & " " & _
                    frmJuristicDiplomats.txtArab2ndName
         frmPrintAccOpeningCard.optLangArabic = True
         frmPrintAccOpeningCard.assignNameToGlobalVar frmJuristicDiplomats.txtArabFirstName, " ", frmJuristicDiplomats.txtArab2ndName
         customerLang = 0
      Else
         custName = frmJuristicDiplomats.txtEngFirstName & " " & _
                    frmJuristicDiplomats.txtEnglish2ndName
         frmPrintAccOpeningCard.optLangEnglish = True
         frmPrintAccOpeningCard.assignNameToGlobalVar frmJuristicDiplomats.txtEngFirstName, " ", frmJuristicDiplomats.txtEnglish2ndName
         customerLang = 1
      End If
   ElseIf screenSetNo = "6" Then
      custNo = frmJuristicNonResident.txtCustomerNo
      custBranchCode = Mid$(frmJuristicNonResident.cmbBranchCode, 1, 4)
      If frmJuristicNonResident.optLangArabic Then
         custName = frmJuristicNonResident.txtArabFirstName & " " & _
                    frmJuristicNonResident.txtArab2ndName
         frmPrintAccOpeningCard.optLangArabic = True
         frmPrintAccOpeningCard.assignNameToGlobalVar frmJuristicNonResident.txtArabFirstName, " ", frmJuristicNonResident.txtArab2ndName
         customerLang = 0
      Else
         custName = frmJuristicNonResident.txtEngFirstName & " " & _
                    frmJuristicNonResident.txtEnglish2ndName
         frmPrintAccOpeningCard.optLangEnglish = True
         frmPrintAccOpeningCard.assignNameToGlobalVar frmJuristicNonResident.txtEngFirstName, " ", frmJuristicNonResident.txtEnglish2ndName
         customerLang = 1
      End If
   End If
  
  frmPrintAccOpeningCard.txtCustNo = custNo
  frmPrintAccOpeningCard.txtCustName = custName
  
  If optCurrentAcYes Or optSavingAcYes Or Mid$(cmbOtherAccount, 1, 3) > "000" Then
     accountNo = Right(recvSuperDecisionMsg.ibanAccNo, 14)
  Else
     accountNo = recvSuperDecisionMsg.custNo
  End If
  
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

