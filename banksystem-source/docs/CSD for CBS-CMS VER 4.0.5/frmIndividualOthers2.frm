VERSION 5.00
Begin VB.Form frmIndividualOthers2 
   BackColor       =   &H00BFD87E&
   Caption         =   "Customers Maintenance Page 2 - For Other Individuals"
   ClientHeight    =   7590
   ClientLeft      =   90
   ClientTop       =   360
   ClientWidth     =   12045
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   7590
   ScaleWidth      =   12045
   WindowState     =   2  'Maximized
   Begin VB.Frame framePkgStmtOverride 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   375
      Left            =   6585
      TabIndex        =   143
      Top             =   2130
      Width           =   1575
      Begin VB.OptionButton optSegmentStmtOverrideYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   210
         Left            =   135
         TabIndex        =   145
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
      Begin VB.OptionButton optSegmentStmtOverrideNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   195
         Left            =   855
         TabIndex        =   144
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   540
      End
   End
   Begin VB.Frame frameApproverInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   90
      TabIndex        =   136
      Top             =   6630
      Width           =   11805
      Begin VB.TextBox txtApproverName 
         Height          =   285
         Left            =   1440
         MaxLength       =   30
         TabIndex        =   69
         Top             =   615
         Width           =   2850
      End
      Begin VB.Frame FrameApprDateType 
         BackColor       =   &H00BFD87E&
         Height          =   480
         Left            =   4170
         TabIndex        =   137
         Tag             =   "11895"
         Top             =   0
         Width           =   1755
         Begin VB.OptionButton optAppDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   135
            TabIndex        =   61
            Tag             =   "1755"
            ToolTipText     =   "Hijri"
            Top             =   165
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optAppDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   195
            Left            =   720
            TabIndex        =   62
            Tag             =   "1755"
            ToolTipText     =   "Gregorian"
            Top             =   180
            Width           =   990
         End
      End
      Begin VB.TextBox txtApproverNo 
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
         Left            =   1245
         MaxLength       =   15
         TabIndex        =   70
         Tag             =   "11895"
         Top             =   120
         Width           =   1935
      End
      Begin VB.ComboBox cmbAppExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10410
         TabIndex        =   67
         Tag             =   "11895"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.ComboBox cmbAppExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9825
         TabIndex        =   66
         Tag             =   "11895"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.ComboBox cmbAppIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6990
         TabIndex        =   63
         Tag             =   "11895"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.ComboBox cmbAppIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7590
         TabIndex        =   64
         Tag             =   "11895"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.TextBox txtAppIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8190
         MaxLength       =   4
         TabIndex        =   65
         Tag             =   "11895"
         Top             =   105
         Width           =   555
      End
      Begin VB.TextBox txtAppExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   11040
         MaxLength       =   4
         TabIndex        =   68
         Tag             =   "11895"
         Top             =   105
         Width           =   600
      End
      Begin VB.Label lblApproverName 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Approver Name"
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
         Left            =   45
         TabIndex        =   142
         Top             =   660
         Width           =   1320
      End
      Begin VB.Label lblApproverNumber 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Approver No."
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
         Left            =   45
         TabIndex        =   141
         Tag             =   "11895"
         Top             =   150
         Width           =   1140
      End
      Begin VB.Label lblAppExpiryDate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Expiry Date"
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
         Left            =   8805
         TabIndex        =   140
         Tag             =   "11895"
         Top             =   150
         Width           =   1215
      End
      Begin VB.Label lblAppDateType 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Date Type"
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
         Left            =   3255
         TabIndex        =   139
         Tag             =   "11895"
         Top             =   150
         Width           =   900
      End
      Begin VB.Label lblAppIssueDate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Issue Date"
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
         Left            =   5985
         TabIndex        =   138
         Tag             =   "11895"
         Top             =   150
         Width           =   1155
      End
   End
   Begin VB.TextBox txtFreezingGracePeriod 
      BackColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   2220
      MaxLength       =   3
      TabIndex        =   133
      Top             =   5460
      Width           =   615
   End
   Begin VB.Frame FrameAtmFees 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   375
      Left            =   2790
      TabIndex        =   127
      Top             =   2505
      Width           =   1575
      Begin VB.OptionButton optAtmFeeNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   210
         Left            =   855
         TabIndex        =   129
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   135
         Value           =   -1  'True
         Width           =   540
      End
      Begin VB.OptionButton optAtmFeeYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   210
         Left            =   135
         TabIndex        =   128
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   135
         Width           =   615
      End
   End
   Begin VB.Frame frameMinBalFees 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   450
      Left            =   6600
      TabIndex        =   124
      Top             =   2460
      Width           =   1455
      Begin VB.OptionButton optMinBalFeeYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   255
         Left            =   135
         TabIndex        =   126
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   135
         Width           =   615
      End
      Begin VB.OptionButton optMinBalFeeNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   855
         TabIndex        =   125
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   135
         Value           =   -1  'True
         Width           =   540
      End
   End
   Begin VB.TextBox txtRelationshipManager 
      Enabled         =   0   'False
      Height          =   285
      Left            =   4620
      MaxLength       =   30
      TabIndex        =   23
      Tag             =   "11775"
      Top             =   2955
      Width           =   2655
   End
   Begin VB.TextBox txtGeneralMemo 
      Height          =   285
      Left            =   8685
      MaxLength       =   30
      TabIndex        =   24
      Tag             =   "11775"
      Top             =   2985
      Width           =   2970
   End
   Begin VB.Frame FrameUpdateForSama 
      BackColor       =   &H00BFD87E&
      Height          =   405
      Left            =   1440
      TabIndex        =   118
      Top             =   2895
      Width           =   1455
      Begin VB.OptionButton optSamaUpdYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   165
         Left            =   120
         TabIndex        =   21
         Tag             =   "1455"
         ToolTipText     =   "Yes"
         Top             =   165
         Width           =   615
      End
      Begin VB.OptionButton optSamaUpdNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   225
         Left            =   720
         TabIndex        =   22
         Tag             =   "1455"
         ToolTipText     =   "No"
         Top             =   150
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   420
      Left            =   7140
      TabIndex        =   73
      ToolTipText     =   "Cancel"
      Top             =   7830
      Width           =   1500
   End
   Begin VB.CommandButton cmdPrevPage 
      Caption         =   "&Previous Page"
      Height          =   420
      Left            =   4185
      TabIndex        =   71
      ToolTipText     =   "Previous Page"
      Top             =   7830
      Width           =   1500
   End
   Begin VB.CommandButton cmdNextPage 
      Caption         =   "&Next Page"
      Height          =   420
      Left            =   5625
      TabIndex        =   72
      ToolTipText     =   "Next Page"
      Top             =   7830
      Width           =   1500
   End
   Begin VB.Frame framePackagedAcc 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame4"
      Enabled         =   0   'False
      Height          =   435
      Left            =   45
      TabIndex        =   114
      Top             =   2070
      Width           =   3930
      Begin VB.ComboBox cmbPackageAcc 
         Height          =   315
         Left            =   1440
         TabIndex        =   20
         Tag             =   "3930"
         Top             =   75
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
         Left            =   120
         TabIndex        =   115
         Tag             =   "3930"
         Top             =   105
         Width           =   1140
      End
   End
   Begin VB.Frame frameSamaAuthDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   405
      Left            =   30
      TabIndex        =   106
      Top             =   6240
      Width           =   11835
      Begin VB.Frame frameSamaDateType 
         BackColor       =   &H00BFD87E&
         Height          =   420
         Left            =   5355
         TabIndex        =   109
         Tag             =   "11835"
         Top             =   -75
         Width           =   2175
         Begin VB.OptionButton optSamaDateGregorian 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   255
            Left            =   960
            TabIndex        =   57
            TabStop         =   0   'False
            Tag             =   "2175"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   1095
         End
         Begin VB.OptionButton optSamaDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   56
            Tag             =   "2175"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbSamaApproveDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9765
         TabIndex        =   58
         Tag             =   "11835"
         Text            =   "01"
         Top             =   30
         Width           =   615
      End
      Begin VB.ComboBox cmbSamaApproveMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10365
         TabIndex        =   59
         Tag             =   "11835"
         Text            =   "01"
         Top             =   30
         Width           =   615
      End
      Begin VB.TextBox txtSamaApproveYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   10965
         MaxLength       =   4
         TabIndex        =   60
         Tag             =   "11835"
         Top             =   30
         Width           =   630
      End
      Begin VB.TextBox txtSamaApprovalNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   2235
         MaxLength       =   15
         TabIndex        =   55
         Tag             =   "11835"
         Top             =   75
         Width           =   1695
      End
      Begin VB.Label lblSamaDateType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Date Type"
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
         Left            =   4320
         TabIndex        =   110
         Tag             =   "11835"
         Top             =   60
         Width           =   1215
      End
      Begin VB.Label lblSamaApprovalNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "SAMA Approval No."
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
         Left            =   75
         TabIndex        =   108
         Tag             =   "11835"
         Top             =   120
         Width           =   1680
      End
      Begin VB.Label lblSamaApproveDate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "SAMA Approval Date"
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
         Left            =   7800
         TabIndex        =   107
         Tag             =   "11835"
         Top             =   90
         Width           =   1800
      End
   End
   Begin VB.Frame frameInterGroupDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   375
      Left            =   30
      TabIndex        =   103
      Top             =   5760
      Width           =   9975
      Begin VB.TextBox txtSpecialRefNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   6885
         MaxLength       =   15
         TabIndex        =   54
         Tag             =   "9975"
         Top             =   60
         Width           =   1695
      End
      Begin VB.TextBox txtInterGroupNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   2220
         MaxLength       =   14
         TabIndex        =   53
         Tag             =   "9975"
         Top             =   90
         Width           =   1695
      End
      Begin VB.Label lblSpecialRefNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Special Reference No."
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
         Left            =   4815
         TabIndex        =   105
         Tag             =   "9975"
         Top             =   90
         Width           =   1950
      End
      Begin VB.Label lblInterGroupNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Inter-Group Acc. No."
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
         Left            =   75
         TabIndex        =   104
         Tag             =   "9975"
         Top             =   120
         Width           =   1785
      End
   End
   Begin VB.Frame FrameCustomerDetail2 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   75
      TabIndex        =   0
      Top             =   645
      Width           =   11790
      Begin VB.Frame frameCustomerAdvice 
         BackColor       =   &H00BFD87E&
         Height          =   375
         Left            =   9975
         TabIndex        =   122
         Tag             =   "11895"
         Top             =   300
         Width           =   1455
         Begin VB.OptionButton optCustAdviceYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   195
            Left            =   120
            TabIndex        =   7
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
         Begin VB.OptionButton optCustAdviceNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   195
            Left            =   735
            TabIndex        =   8
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   135
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.TextBox txtMarketingMemo 
         Height          =   285
         Left            =   5040
         MaxLength       =   25
         TabIndex        =   6
         Tag             =   "11895"
         Top             =   360
         Width           =   2970
      End
      Begin VB.ComboBox cmbSegmentation 
         Height          =   315
         Left            =   1320
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Tag             =   "11895"
         Top             =   360
         Width           =   1935
      End
      Begin VB.TextBox txtEmployerZipcode 
         Height          =   285
         Left            =   10560
         MaxLength       =   10
         TabIndex        =   19
         Tag             =   "11895"
         Top             =   1080
         Width           =   975
      End
      Begin VB.ComboBox cmbMonthlyIncome 
         Height          =   315
         Left            =   9960
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Tag             =   "11895"
         Top             =   0
         Width           =   1575
      End
      Begin VB.ComboBox cmbEducation 
         Height          =   315
         Left            =   1320
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Tag             =   "11895"
         Top             =   0
         Width           =   1935
      End
      Begin VB.ComboBox cmbProfession 
         Height          =   315
         Left            =   4560
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
         Left            =   1320
         TabIndex        =   9
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
         Left            =   2880
         TabIndex        =   10
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
         Left            =   4320
         TabIndex        =   11
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
         Left            =   6480
         TabIndex        =   12
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
         Left            =   8160
         TabIndex        =   13
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
         Left            =   9690
         TabIndex        =   14
         Tag             =   "11895"
         ToolTipText     =   "Company Transport"
         Top             =   720
         Width           =   2055
      End
      Begin VB.TextBox txtEmployerName 
         Height          =   285
         Left            =   1440
         MaxLength       =   30
         TabIndex        =   15
         Tag             =   "11895"
         Top             =   1080
         Width           =   2655
      End
      Begin VB.TextBox txtDepartment 
         Height          =   285
         Left            =   4800
         MaxLength       =   20
         TabIndex        =   16
         Tag             =   "11895"
         Top             =   1080
         Width           =   1575
      End
      Begin VB.TextBox txtEmployerPOBox 
         Height          =   285
         Left            =   6840
         MaxLength       =   10
         TabIndex        =   17
         Tag             =   "11895"
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox txtEmployerCity 
         Height          =   285
         Left            =   8400
         MaxLength       =   20
         TabIndex        =   18
         Tag             =   "11895"
         Top             =   1080
         Width           =   1095
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
         Left            =   8400
         TabIndex        =   123
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
         Left            =   3360
         TabIndex        =   121
         Tag             =   "11895"
         Top             =   375
         Width           =   1410
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
         TabIndex        =   101
         Tag             =   "11895"
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label lblEmployerZipCode 
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
         TabIndex        =   100
         Tag             =   "11895"
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Line Line5 
         Tag             =   "11775"
         X1              =   0
         X2              =   11640
         Y1              =   2160
         Y2              =   2160
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
         Left            =   0
         TabIndex        =   99
         Tag             =   "11895"
         Top             =   0
         Width           =   1335
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
         Left            =   3360
         TabIndex        =   98
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
         Left            =   6120
         TabIndex        =   97
         Tag             =   "11895"
         Top             =   0
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
         TabIndex        =   96
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
         Left            =   120
         TabIndex        =   95
         Tag             =   "11895"
         Top             =   720
         Width           =   1170
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
         Left            =   105
         TabIndex        =   94
         Tag             =   "11895"
         Top             =   1080
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
         TabIndex        =   93
         Tag             =   "11895"
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label lblEmployerPo 
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
         TabIndex        =   92
         Tag             =   "11895"
         Top             =   1095
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
         TabIndex        =   91
         Tag             =   "11895"
         Top             =   1080
         Width           =   735
      End
   End
   Begin VB.Frame frameHomeCountryDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1995
      Left            =   135
      TabIndex        =   116
      Top             =   3315
      Width           =   11775
      Begin VB.Frame frameIdDateType 
         BackColor       =   &H00BFD87E&
         Height          =   420
         Left            =   3840
         TabIndex        =   120
         Tag             =   "11775"
         Top             =   -45
         Width           =   1815
         Begin VB.OptionButton optHomeCountryDateGregorian 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   255
            Left            =   765
            TabIndex        =   27
            TabStop         =   0   'False
            Tag             =   "1815"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   1005
         End
         Begin VB.OptionButton optHomeCountryIdDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   26
            Tag             =   "1815"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbHomeCountry 
         Height          =   315
         Left            =   8760
         TabIndex        =   39
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   900
         Width           =   2235
      End
      Begin VB.TextBox txtHomeOffPhoneNo 
         Height          =   285
         Left            =   1755
         MaxLength       =   10
         TabIndex        =   41
         Tag             =   "11775"
         Top             =   1275
         Width           =   1215
      End
      Begin VB.TextBox txtHomeResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   44
         Tag             =   "11775"
         Top             =   1260
         Width           =   1215
      End
      Begin VB.TextBox txtHomeMobileNo 
         Height          =   285
         Left            =   1755
         MaxLength       =   8
         TabIndex        =   50
         Tag             =   "11775"
         Top             =   1635
         Width           =   1215
      End
      Begin VB.TextBox txtHomeOffPhoneExt 
         Height          =   285
         Left            =   3075
         MaxLength       =   4
         TabIndex        =   42
         Tag             =   "11775"
         Top             =   1260
         Width           =   495
      End
      Begin VB.TextBox txtHomePhoneResExt 
         Height          =   285
         Left            =   6810
         MaxLength       =   4
         TabIndex        =   45
         Tag             =   "11775"
         Text            =   " "
         Top             =   1275
         Width           =   615
      End
      Begin VB.TextBox txtHomeFaxNo 
         Height          =   285
         Left            =   9240
         MaxLength       =   10
         TabIndex        =   47
         Tag             =   "11775"
         Top             =   1260
         Width           =   1215
      End
      Begin VB.TextBox txtHomeFaxExt 
         Height          =   285
         Left            =   10560
         MaxLength       =   4
         TabIndex        =   48
         Tag             =   "11775"
         Top             =   1260
         Width           =   555
      End
      Begin VB.TextBox txtHomeEmailAddress 
         Height          =   285
         Left            =   8235
         MaxLength       =   30
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   1635
         Width           =   3315
      End
      Begin VB.TextBox txtHomeOffPhoneAreaCode 
         Height          =   285
         Left            =   1320
         MaxLength       =   4
         TabIndex        =   40
         Tag             =   "11775"
         Top             =   1275
         Width           =   375
      End
      Begin VB.TextBox txtHomeMobileCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1320
         MaxLength       =   2
         TabIndex        =   49
         TabStop         =   0   'False
         Tag             =   "11775"
         Top             =   1620
         Width           =   375
      End
      Begin VB.TextBox txtHomeFaxAreaCode 
         Height          =   285
         Left            =   8760
         MaxLength       =   4
         TabIndex        =   46
         Tag             =   "11775"
         Top             =   1260
         Width           =   375
      End
      Begin VB.TextBox txtHomePhoneResAreaCode 
         Height          =   285
         Left            =   4875
         MaxLength       =   4
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   1260
         Width           =   375
      End
      Begin VB.TextBox txtHomePagerNo 
         Height          =   285
         Left            =   4875
         MaxLength       =   10
         TabIndex        =   51
         Tag             =   "11775"
         Top             =   1620
         Width           =   1695
      End
      Begin VB.TextBox txtHomeZipCode 
         Height          =   285
         Left            =   6240
         MaxLength       =   10
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   915
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
         Left            =   1320
         MaxLength       =   10
         TabIndex        =   36
         Tag             =   "11775"
         Top             =   900
         Width           =   1215
      End
      Begin VB.TextBox txtHomeAddress2 
         Height          =   285
         Left            =   4875
         MaxLength       =   30
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   510
         Width           =   3675
      End
      Begin VB.TextBox txtHomeAddress1 
         Height          =   285
         Left            =   1320
         MaxLength       =   30
         TabIndex        =   34
         Tag             =   "11775"
         Top             =   525
         Width           =   2865
      End
      Begin VB.TextBox txtHomeCountryId 
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
         Left            =   1320
         MaxLength       =   15
         TabIndex        =   25
         Tag             =   "11775"
         Top             =   60
         Width           =   1335
      End
      Begin VB.TextBox txtHomeExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   10920
         MaxLength       =   4
         TabIndex        =   33
         Tag             =   "11775"
         Top             =   75
         Width           =   615
      End
      Begin VB.ComboBox cmbHomeExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10320
         TabIndex        =   32
         Tag             =   "11775"
         Text            =   "01"
         Top             =   75
         Width           =   615
      End
      Begin VB.ComboBox cmbHomeExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9705
         TabIndex        =   31
         Tag             =   "11775"
         Text            =   "01"
         Top             =   75
         Width           =   615
      End
      Begin VB.TextBox txtHomeIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   7920
         MaxLength       =   4
         TabIndex        =   30
         Tag             =   "11775"
         Top             =   75
         Width           =   615
      End
      Begin VB.ComboBox cmbHomeIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7320
         TabIndex        =   29
         Tag             =   "11775"
         Text            =   "01"
         Top             =   75
         Width           =   615
      End
      Begin VB.ComboBox cmbHomeIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6720
         TabIndex        =   28
         Tag             =   "11775"
         Text            =   "01"
         Top             =   75
         Width           =   615
      End
      Begin VB.ComboBox cmbHomeCityName 
         Height          =   315
         Left            =   3240
         TabIndex        =   37
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   900
         Width           =   1575
      End
      Begin VB.Label lblHomeIdDateType 
         BackColor       =   &H00BFD87E&
         Caption         =   "ID Date Type"
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
         TabIndex        =   119
         Tag             =   "11775"
         Top             =   75
         Width           =   1215
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
         TabIndex        =   74
         Tag             =   "11775"
         Top             =   1635
         Width           =   495
      End
      Begin VB.Label lblHomeEmailAddress 
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
         Left            =   6840
         TabIndex        =   75
         Tag             =   "11775"
         Top             =   1695
         Width           =   1260
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
         Left            =   7500
         TabIndex        =   76
         Tag             =   "11775"
         Top             =   1305
         Width           =   1335
      End
      Begin VB.Label lblHomeMobile 
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
         TabIndex        =   77
         Tag             =   "11775"
         Top             =   1635
         Width           =   1215
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
         TabIndex        =   78
         Tag             =   "11775"
         Top             =   1275
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
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   1275
         Width           =   1215
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
         Left            =   7500
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   915
         Width           =   1245
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
         Left            =   5280
         TabIndex        =   81
         Tag             =   "11775"
         Top             =   915
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
         TabIndex        =   82
         Tag             =   "11775"
         Top             =   915
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
         TabIndex        =   83
         Tag             =   "11775"
         Top             =   975
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
         TabIndex        =   84
         Tag             =   "11775"
         Top             =   510
         Width           =   1275
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblHomeExpiryDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Expiry Date"
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
         TabIndex        =   85
         Tag             =   "11775"
         Top             =   75
         Width           =   1095
      End
      Begin VB.Label lblHomeIssueDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Issue Date"
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
         Left            =   5670
         TabIndex        =   86
         Tag             =   "11775"
         Top             =   75
         Width           =   1215
      End
      Begin VB.Label lblHomeCountryId 
         BackColor       =   &H00BFD87E&
         Caption         =   "Home Country ID"
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
         Left            =   0
         TabIndex        =   87
         Tag             =   "11775"
         Top             =   75
         Width           =   1215
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
      Left            =   4020
      TabIndex        =   146
      Top             =   2220
      Width           =   2580
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
      Left            =   2910
      TabIndex        =   135
      Top             =   5490
      Width           =   435
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
      Left            =   75
      TabIndex        =   134
      Top             =   5490
      Width           =   1860
   End
   Begin VB.Label lblExcludeFrom 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Exclude from"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   285
      Left            =   60
      TabIndex        =   132
      Top             =   2565
      Width           =   1515
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
      Left            =   1665
      TabIndex        =   131
      Top             =   2595
      Width           =   1035
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
      Left            =   4530
      TabIndex        =   130
      Top             =   2595
      Width           =   2070
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
      Left            =   345
      TabIndex        =   117
      Top             =   7950
      Visible         =   0   'False
      Width           =   615
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
      Left            =   7365
      TabIndex        =   88
      Tag             =   "11775"
      Top             =   3000
      Width           =   1215
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
      Left            =   3000
      TabIndex        =   89
      Tag             =   "11775"
      Top             =   2985
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
      Height          =   405
      Left            =   120
      TabIndex        =   90
      Tag             =   "11775"
      Top             =   2895
      Width           =   1335
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11805
      Y1              =   5400
      Y2              =   5400
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "-Depends-"
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
      Left            =   8280
      TabIndex        =   113
      Top             =   120
      Width           =   3285
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
      Left            =   5640
      TabIndex        =   112
      Top             =   120
      Width           =   2325
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   4440
      TabIndex        =   111
      Top             =   120
      Width           =   900
   End
   Begin VB.Shape Shape2 
      Height          =   375
      Left            =   60
      Top             =   90
      Width           =   11610
   End
   Begin VB.Label lblIndividualCust2 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Individual Customer Details-Page 2"
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
      Height          =   300
      Left            =   60
      TabIndex        =   102
      Top             =   105
      Width           =   4215
   End
   Begin VB.Shape Shape1 
      Height          =   675
      Left            =   105
      Top             =   7710
      Width           =   11820
   End
End
Attribute VB_Name = "frmIndividualOthers2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmbAppExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbAppExpiryDate.text)) <> 0 Then
         If Len(cmbAppExpiryDate.text) = 2 Then
            If cmbAppExpiryDate < 1 Or _
               cmbAppExpiryDate > IIf(optAppDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbAppExpiryDate.text = ""
               cmbAppExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbAppExpiryMonth.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbAppExpiryDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbAppExpiryMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbAppExpiryMonth.text)) <> 0 Then
         If Len(cmbAppExpiryMonth.text) = 2 Then
            If cmbAppExpiryMonth < 1 Or cmbAppExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbAppExpiryMonth.text = ""
               cmbAppExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtAppExpiryYear.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbAppExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
Private Sub cmbAppIssueDate_Change()
    If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbAppIssueDate.text)) <> 0 Then
         If Len(cmbAppIssueDate.text) = 2 Then
            If cmbAppIssueDate < 1 Or _
               cmbAppIssueDate > IIf(optAppDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbAppIssueDate.text = ""
               cmbAppIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbAppIssueMonth.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbAppIssueDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbAppIssueMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Len(RTrim(cmbAppIssueMonth.text)) <> 0 Then
        If Len(cmbAppIssueMonth.text) = 2 Then
           If cmbAppIssueMonth < 1 Or cmbAppIssueMonth > 12 Then
              MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
              cmbAppIssueMonth.text = ""
              cmbAppIssueMonth.SetFocus
           Else
              On Error Resume Next
              txtAppIssueYear.SetFocus
              On Error GoTo 0
           End If
        End If
     End If
  End If
End Sub

Private Sub cmbAppIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbHomeCountry_LostFocus()
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbHomeCountry.text)) <> 0 Then
         tCode = Mid$(cmbHomeCountry.text, 1, 3)
         For i = 0 To cmbHomeCountry.ListCount
             If Mid$(cmbHomeCountry.List(i), 1, 3) = tCode Then
                cmbHomeCountry.ListIndex = i
                Exit For
             End If
         Next i
      End If
      If i > cmbHomeCountry.ListCount Then
         MsgBox errInvalidCountry(UserLang)
         cmbHomeCountry.SetFocus
      End If
   End If
   On Error GoTo 0
End If

End Sub

Private Sub cmbHomeExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbHomeExpiryDate.text)) <> 0 Then
         If Len(cmbHomeExpiryDate.text) = 2 Then
            If cmbHomeExpiryDate < 1 Or _
               cmbHomeExpiryDate > IIf(optHomeCountryDateGregorian.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbHomeExpiryDate.text = ""
               cmbHomeExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbHomeExpiryMonth.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbHomeExpiryDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbHomeExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbHomeExpiryMonth.text)) <> 0 Then
         If Len(cmbHomeExpiryMonth.text) = 2 Then
            If cmbHomeExpiryMonth < 1 Or cmbHomeExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbHomeExpiryMonth.text = ""
               cmbHomeExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtHomeExpiryYear.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbHomeExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbHomeIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbHomeIssueDate.text)) <> 0 Then
         If Len(cmbHomeIssueDate.text) = 2 Then
            If cmbHomeIssueDate < 1 Or _
               cmbHomeIssueDate > IIf(optHomeCountryDateGregorian.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbHomeIssueDate.text = ""
               cmbHomeIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbHomeIssueMonth.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbHomeIssueDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbHomeIssueMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Len(RTrim(cmbHomeIssueMonth.text)) <> 0 Then
        If Len(cmbHomeIssueMonth.text) = 2 Then
           If cmbHomeIssueMonth < 1 Or cmbHomeIssueMonth > 12 Then
              MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
              cmbHomeIssueMonth.text = ""
              cmbHomeIssueMonth.SetFocus
           Else
              On Error Resume Next
              txtHomeIssueYear.SetFocus
              On Error GoTo 0
           End If
        End If
     End If
  End If
End Sub

Private Sub cmbHomeIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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
       For i = 0 To cmbPackageAcc.ListCount
           If Mid(cmbPackageAcc.List(i), 1, 1) = tCode Then
              cmbPackageAcc.ListIndex = i
              Exit For
            End If
        Next i
    Else
        cmbPackageAcc.ListIndex = -1
    End If
    If i > cmbPackageAcc.ListCount Then
        cmbPackageAcc.text = tCode & "-Not defined in local"
    End If
End Sub


Private Sub cmbSamaApproveDate_Change()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbSamaApproveDate.text)) <> 0 Then
         If Len(cmbSamaApproveDate.text) = 2 Then
            If cmbSamaApproveDate < 1 Or _
               cmbSamaApproveDate > IIf(optSamaDateGregorian.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbSamaApproveDate.text = ""
               cmbSamaApproveDate.SetFocus
            Else
               On Error Resume Next
               cmbSamaApproveMonth.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbSamaApproveDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub cmbSamaApproveMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbSamaApproveMonth.text)) <> 0 Then
         If Len(cmbSamaApproveMonth.text) = 2 Then
            If cmbSamaApproveMonth < 1 Or cmbSamaApproveMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbSamaApproveMonth.text = ""
               cmbSamaApproveMonth.SetFocus
            Else
               On Error Resume Next
               txtSamaApproveYear.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbSamaApproveMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdNextPage_Click()
   Dim mQry As String
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If validateFrmindividualOthers2 = 1 Then
         Exit Sub
      End If
      
      If Len(RTrim(txtSamaApprovalNo)) = 0 Then
         mQry = "select samaapprovalreqd from categoryconfiginfo " & _
                "where samamaincategory = '" & mainCategoryCode & "' " & _
                "  and samasubcategory = '" & subCategoryCode & "'"
         
         Set rs = db.OpenRecordset(mQry)
         If rs.recordCount > 0 Then
            If rs(0) = "1" Then
               MsgBox errNoSamaAuthEntered(UserLang)
            End If
         End If
      End If
   End If
   frmIndividualOthersAcctInfo.Show
End Sub

Private Sub cmdPrevPage_Click()
    Me.Hide
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim tCode As String, mQry As String
   
   If UserLang = ARABIC Then
      ChangePositions frmIndividualOthers2, 11800
      frmIndividualOthers2.Hide
      frmIndividualOthers2.RightToLeft = True
   End If
   
   lblMainCategoryDesc = mainCategoryDesc
   lblSubCategoryDesc = subCategoryDesc
   
   frmIndividualOthers2.Caption = frmIndividualOthers2Caption(0, UserLang)
   lblIndividualCust2.Caption = frmIndividualOthers2Caption(1, UserLang)
   lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
   'lblSubCategory.Caption = frmIndividualOthers1Caption(3, UserLang)
   lblEducation.Caption = frmIndividualOthers2Caption(2, UserLang)
   lblProfession.Caption = frmIndividualOthers2Caption(3, UserLang)
   lblPosition.Caption = frmIndividualOthers2Caption(4, UserLang)
   lblMonthlyIncome.Caption = frmIndividualOthers2Caption(5, UserLang)
   lblSegmentation.Caption = frmIndividualOthers2Caption(6, UserLang)
   lblOwnership.Caption = frmIndividualOthers2Caption(7, UserLang)
   chkRentedHouse.Caption = frmIndividualOthers2Caption(8, UserLang)
   chkOwnHouse.Caption = frmIndividualOthers2Caption(9, UserLang)
   chkCompanyAcc.Caption = frmIndividualOthers2Caption(10, UserLang)
   chkRentedCar.Caption = frmIndividualOthers2Caption(11, UserLang)
   chkOwnCar.Caption = frmIndividualOthers2Caption(12, UserLang)
   chkCompanyTransport.Caption = frmIndividualOthers2Caption(13, UserLang)
   lblEmployerName.Caption = frmIndividualOthers2Caption(14, UserLang)
   lblDepartment.Caption = frmIndividualOthers2Caption(15, UserLang)
   lblEmployerPo.Caption = frmIndividualOthers2Caption(16, UserLang)
   lblEmployerCity.Caption = frmIndividualOthers2Caption(17, UserLang)
   lblEmployerZipCode.Caption = frmIndividualOthers2Caption(18, UserLang)
   lblPackagedAccount.Caption = frmIndividualOthers2Caption(19, UserLang)
   lblExcludeFrom.Caption = frmIndividualOthers2Caption(53, UserLang)
   lblAtmFees.Caption = frmIndividualOthers2Caption(54, UserLang)
   lblMinBalFees.Caption = frmIndividualOthers2Caption(55, UserLang)
   optAtmFeeYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optAtmFeeNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   optMinBalFeeYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optMinBalFeeNo.Caption = frmIndividualOthers2Caption(26, UserLang)

'   lblInternetBank.Caption = frmIndividualOthers2Caption(20, UserLang)
'   optInternetYes.Caption = frmIndividualOthers2Caption(25, UserLang)
'   optInternetNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblCustomerAdvice.Caption = frmIndividualOthers2Caption(21, UserLang)
   optCustAdviceYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optCustAdviceNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblUpdatedForSama.Caption = frmIndividualOthers2Caption(22, UserLang)
   optSamaUpdYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optSamaUpdNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   lblReleationshipManager.Caption = frmIndividualOthers2Caption(23, UserLang)
   lblGeneralMemo.Caption = frmIndividualOthers2Caption(24, UserLang)
   lblHomeCountryId.Caption = frmIndividualOthers2Caption(27, UserLang)
   lblHomeIdDateType.Caption = frmIndividualOthers2Caption(28, UserLang)
   optHomeCountryIdDateHijri.Caption = frmIndividualOthers2Caption(29, UserLang)
   optHomeCountryDateGregorian.Caption = frmIndividualOthers2Caption(30, UserLang)
   lblHomeIssueDate.Caption = frmIndividualOthers2Caption(31, UserLang)
   lblHomeExpiryDate.Caption = frmIndividualOthers2Caption(32, UserLang)
   lblHomeCountryAddress.Caption = frmIndividualOthers2Caption(33, UserLang)
   lblHomePoBox.Caption = frmIndividualOthers2Caption(34, UserLang)
   lblHomeCity.Caption = frmIndividualOthers2Caption(35, UserLang)
   lblHomeZipCode.Caption = frmIndividualOthers2Caption(36, UserLang)
   lblHomeCountry.Caption = frmIndividualOthers2Caption(37, UserLang)
   lblHomePhoneOff.Caption = frmIndividualOthers2Caption(38, UserLang)
   lblHomePhoneRes.Caption = frmIndividualOthers2Caption(39, UserLang)
   lblHomeFax.Caption = frmIndividualOthers2Caption(40, UserLang)
   lblHomeMobile.Caption = frmIndividualOthers2Caption(41, UserLang)
   lblHomePager.Caption = frmIndividualOthers2Caption(42, UserLang)
   lblHomeEmailAddress.Caption = frmIndividualOthers2Caption(43, UserLang)
   lblInterGroupNo.Caption = frmIndividualOthers2Caption(44, UserLang)
   lblSpecialRefNo.Caption = frmIndividualOthers2Caption(45, UserLang)
   lblSamaApprovalNo.Caption = frmIndividualOthers2Caption(46, UserLang)
   lblSamaDateType.Caption = frmIndividualOthers2Caption(47, UserLang)
   optSamaDateHijri.Caption = frmIndividualOthers2Caption(29, UserLang)
   optSamaDateGregorian.Caption = frmIndividualOthers2Caption(30, UserLang)
   lblSamaApproveDate.Caption = frmIndividualOthers2Caption(48, UserLang)
   cmdPrevPage.Caption = frmIndividualOthers2Caption(49, UserLang)
   cmdNextPage.Caption = frmIndividualOthers2Caption(50, UserLang)
   cmdCancel.Caption = frmIndividualOthers2Caption(51, UserLang)
   lblMarketingMemo.Caption = frmIndividualOthers2Caption(52, UserLang)
   lblFreezingGracePeriod.Caption = frmIndividualOthers2Caption(56, UserLang)
   lblDays.Caption = errDays(UserLang)
   lblSegmentStmtOverride.Caption = frmIndividualOthers2Caption(57, UserLang)
   optSegmentStmtOverrideYes.Caption = frmIndividualOthers2Caption(25, UserLang)
   optSegmentStmtOverrideNo.Caption = frmIndividualOthers2Caption(26, UserLang)
   
   
   lblApproverNumber.Caption = frmJuristicMainCaption(43, UserLang)
   lblApproverName.Caption = frmJuristicMainCaption(44, UserLang)
   lblAppDateType.Caption = frmJuristicMainCaption(3, UserLang)
   optAppDateHijri.Caption = frmJuristicMainCaption(4, UserLang)
   optAppDateGreg.Caption = frmJuristicMainCaption(5, UserLang)
   lblAppIssueDate.Caption = frmJuristicMainCaption(9, UserLang)
   lblAppExpiryDate.Caption = frmJuristicMainCaption(10, UserLang)
   
   If custHistoryAction Then
      lblHistory.Visible = True
      lblHistory.Refresh
   Else
      lblHistory.Visible = False
   End If
   
   If supervisorAction Or searchAction Or custHistoryAction Then
      framePackagedAcc.Enabled = False
      FrameAtmFees.Enabled = False
      frameMinBalFees.Enabled = False
      frameCustomerAdvice.Enabled = False
      FrameCustomerDetail2.Enabled = False
      FrameUpdateForSama.Enabled = False
      txtRelationshipManager.Enabled = False
      txtGeneralMemo.Enabled = False
      framePkgStmtOverride.Enabled = False
      txtFreezingGracePeriod.Enabled = False
      frameHomeCountryDetails.Enabled = False
      frameSamaAuthDetails.Enabled = False
      frameInterGroupDetails.Enabled = False
      frameApproverInfo.Enabled = False
   Else
      FrameCustomerDetail2.Enabled = True
      If enableFeeExclusionUpd = True Then
         FrameAtmFees.Enabled = True
         frameMinBalFees.Enabled = True
      Else
         FrameAtmFees.Enabled = False
         frameMinBalFees.Enabled = False
      End If
      If enableGeneralSamaUpd = True Then
         txtFreezingGracePeriod.Enabled = True
      Else
         txtFreezingGracePeriod.Enabled = False
      End If
      frameCustomerAdvice.Enabled = True
      framePkgStmtOverride.Enabled = True
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
      frameHomeCountryDetails.Enabled = True
      If subCategoryCode = "08" Or subCategoryCode = "09" Then  ' Non/res investing in local shares
                                                              ' other non-res individual
         txtHomeCountryId.Enabled = True
         cmbHomeExpiryDate.Enabled = True
         cmbHomeExpiryMonth.Enabled = True
         cmbHomeIssueDate.Enabled = True
         cmbHomeIssueMonth.Enabled = True
         txtHomeIssueYear.Enabled = True
         txtHomeExpiryYear.Enabled = True
      Else
         txtHomeCountryId.Enabled = False
         cmbHomeExpiryDate.Enabled = False
         cmbHomeExpiryMonth.Enabled = False
         cmbHomeIssueDate.Enabled = False
         cmbHomeIssueMonth.Enabled = False
         txtHomeIssueYear.Enabled = False
         txtHomeExpiryYear.Enabled = False
      End If

      frameSamaAuthDetails.Enabled = True
      frameInterGroupDetails.Enabled = True
      frameApproverInfo.Enabled = True
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
   
   mQry = "select * from cityinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbHomeCityName.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbHomeCityName.AddItem rs("englishname")
          Else
             cmbHomeCityName.AddItem rs("arabicname")
          End If
          rs.MoveNext
       Loop
       cmbHomeCityName.ListIndex = -1
   End If
   
   
   Set rs = db.OpenRecordset("select * from countryinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbHomeCountry.Clear
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
   
'   Set rs = db.OpenRecordset("select citycode from branchinfo " & _
'               " where branchcode = '" & gBranchCode & "'")
'    If rs.RecordCount > 0 Then
'         tCode = rs(0)
'         Set rs = db.OpenRecordset("select englishname, arabicname, telareacode from cityinfo " & _
'                       " where citycode = '" & tCode & "'")
'         If rs.RecordCount > 0 Then
'             txtHomeOffPhoneAreaCode = rs(2)
'             txtHomePhoneResAreaCode = rs(2)
'             txtHomeFaxAreaCode = rs(2)
'             If UserLang = ENGLISH Then
'                cmbHomeCityName.Text = rs(0)
'             Else
'                cmbHomeCityName.Text = rs(1)
'             End If
'         Else
'            txtHomeOffPhoneAreaCode = "01"
'            txtHomePhoneResAreaCode = "01"
'            txtHomeFaxAreaCode = "01"
'            cmbHomeCityName = "RIYADH"
'         End If
'    End If
      
    cmbSamaApproveDate.Clear
    cmbSamaApproveMonth.Clear
    cmbHomeIssueDate.Clear
    cmbHomeIssueMonth.Clear
    cmbHomeExpiryDate.Clear
    cmbHomeExpiryMonth.Clear
    cmbAppIssueDate.Clear
    cmbAppIssueMonth.Clear
    cmbAppExpiryDate.Clear
    cmbAppExpiryMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbSamaApproveDate.AddItem num
       cmbHomeIssueDate.AddItem num
       cmbHomeExpiryDate.AddItem num
       cmbAppIssueDate.AddItem num
       cmbAppExpiryDate.AddItem num
       If i < 13 Then
          cmbSamaApproveMonth.AddItem num
          cmbHomeIssueMonth.AddItem num
          cmbHomeExpiryMonth.AddItem num
          cmbAppIssueMonth.AddItem num
          cmbAppExpiryMonth.AddItem num
       End If
    Next

   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      fillFrmIndividualOthers2
   End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameApproverInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameCustomerDetail2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameHomeCountryDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameInterGroupDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub framePackagedAcc_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameSamaAuthDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optAppDateGreg_Click()
  If cmbAppIssueDate.ListCount = 30 Then
     cmbAppIssueDate.AddItem 31
     cmbAppExpiryDate.AddItem 31
  End If
  cmbAppIssueDate = ""
  cmbAppIssueMonth = ""
  txtAppIssueYear = ""
  cmbAppExpiryDate = ""
  cmbAppExpiryMonth = ""
  txtAppExpiryYear = ""
End Sub

Private Sub optAppDateHijri_Click()
  If cmbAppIssueDate.ListCount = 31 Then
     cmbAppIssueDate.RemoveItem 30
     cmbAppExpiryDate.RemoveItem 30
  End If
  cmbAppIssueDate = ""
  cmbAppIssueMonth = ""
  txtAppIssueYear = ""
  cmbAppExpiryDate = ""
  cmbAppExpiryMonth = ""
  txtAppExpiryYear = ""
End Sub

Private Sub optHomeCountryDateGregorian_Click()
  If cmbHomeIssueDate.ListCount = 30 Then
     cmbHomeIssueDate.AddItem 31
     cmbHomeExpiryDate.AddItem 31
  End If
  cmbHomeIssueDate = ""
  cmbHomeIssueMonth = ""
  txtHomeIssueYear = ""
  cmbHomeExpiryDate = ""
  cmbHomeExpiryMonth = ""
  txtHomeExpiryYear = ""
End Sub

Private Sub optHomeCountryIdDateHijri_Click()
  If cmbHomeIssueDate.ListCount = 31 Then
     cmbHomeIssueDate.RemoveItem 30
     cmbHomeExpiryDate.RemoveItem 30
  End If
  cmbHomeIssueDate = ""
  cmbHomeIssueMonth = ""
  txtHomeIssueYear = ""
  cmbHomeExpiryDate = ""
  cmbHomeExpiryMonth = ""
  txtHomeExpiryYear = ""
End Sub

Private Sub optSamaDateGregorian_Click()
  If cmbSamaApproveDate.ListCount = 30 Then
     cmbSamaApproveDate.AddItem 31
  End If
  cmbSamaApproveDate = ""
  cmbSamaApproveMonth = ""
  txtSamaApproveYear = ""
End Sub

Private Sub optSamaDateHijri_Click()
  If cmbSamaApproveDate.ListCount = 31 Then
     cmbSamaApproveDate.RemoveItem 30
  End If
  cmbSamaApproveDate = ""
  cmbSamaApproveMonth = ""
  txtSamaApproveYear = ""
End Sub
Private Sub txtAppExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtAppExpiryYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbAppExpiryDate)) > 0 And Len(RTrim(cmbAppExpiryMonth)) > 0 Then
          If Len(RTrim(txtAppExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtAppExpiryYear.text = ""
             txtAppExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtAppExpiryYear)) <> 0 Then
          If optAppDateHijri.Value = True Then
             If txtAppExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtAppExpiryYear.Enabled = True Then
                   txtAppExpiryYear.text = ""
                   txtAppExpiryYear.SetFocus
                Else
                   'framecrInfo.Enabled = True
                   txtAppExpiryYear.Enabled = True
                   txtAppExpiryYear.text = ""
                   txtAppExpiryYear.SetFocus
                End If
             End If
          Else
             If txtAppExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtAppExpiryYear.Enabled = True Then
                   txtAppExpiryYear.text = ""
                   txtAppExpiryYear.SetFocus
                Else
                   txtAppExpiryYear.Enabled = True
                   txtAppExpiryYear.text = ""
                   txtAppExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtAppIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtAppIssueYear)) <> 0 Then
        If Len(txtAppIssueYear) = 4 Then
           cmbAppExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtAppIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtAppIssueYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbAppIssueDate)) > 0 And Len(RTrim(cmbAppIssueMonth)) > 0 Then
          If Len(RTrim(txtAppIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtAppIssueYear.text = ""
             txtAppIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtAppIssueYear)) <> 0 Then
          If optAppDateHijri.Value = True Then
             If txtAppIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtAppIssueYear.Enabled = True Then
                   txtAppIssueYear.text = ""
                   txtAppIssueYear.SetFocus
                Else
                   'framecrInfo.Enabled = True
                   txtAppIssueYear.Enabled = True
                   txtAppIssueYear.text = ""
                   txtAppIssueYear.SetFocus
                End If
             End If
          Else
             If txtAppIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtAppIssueYear.Enabled = True Then
                   txtAppIssueYear.text = ""
                   txtAppIssueYear.SetFocus
                Else
                   txtAppIssueYear.Enabled = True
                   txtAppIssueYear.text = ""
                   txtAppIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtFreezingGracePeriod_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtHomeCountryId_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtHomeEmailAddress_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
   End If
End Sub

Private Sub txthomeEmailAddress_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
      On Error Resume Next
      If Len(RTrim(txtHomeEmailAddress)) <> 0 Then
         If InStr(txtHomeEmailAddress, "@") = 0 Then
            MsgBox errInvalidMailAddress(UserLang) '"E-mail address should contain @ character...Please Re-try"
            txtHomeEmailAddress.SetFocus
         End If
      End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtHomeExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtHomeExpiryYear)) <> 0 Then
        If Len(txtHomeExpiryYear) = 4 Then
           txtHomeAddress1.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtHomeExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtHomeExpiryYear_LostFocus()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
       On Error Resume Next
       If Len(RTrim(cmbHomeExpiryDate)) > 0 And Len(RTrim(cmbHomeExpiryMonth)) > 0 Then
          If Len(RTrim(txtHomeExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtHomeExpiryYear.text = ""
             txtHomeExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       If optHomeCountryIdDateHijri.Value = True Then
          If Len(RTrim(txtHomeExpiryYear)) <> 0 Then
             If txtHomeExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtHomeExpiryYear.Enabled = True Then
                   txtHomeExpiryYear.text = ""
                   txtHomeExpiryYear.SetFocus
                Else
                   txtHomeExpiryYear.Enabled = True
                   txtHomeExpiryYear.text = ""
                   txtHomeExpiryYear.SetFocus
                End If
             End If
          End If
       Else
          If Len(RTrim(txtHomeExpiryYear)) <> 0 Then
             If txtHomeExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtHomeExpiryYear.Enabled = True Then
                   txtHomeExpiryYear.text = ""
                   txtHomeExpiryYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtHomeExpiryYear.Enabled = True
                   txtHomeExpiryYear.text = ""
                   txtHomeExpiryYear.SetFocus
                End If
             End If
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

Private Sub txtHomeIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtHomeIssueYear)) <> 0 Then
        If Len(txtHomeIssueYear) = 4 Then
           cmbHomeExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtHomeIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtHomeIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbHomeIssueDate)) > 0 And Len(RTrim(cmbHomeIssueMonth)) > 0 Then
          If Len(RTrim(txtHomeIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtHomeIssueYear.text = ""
             txtHomeIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtHomeIssueYear)) <> 0 Then
          If optHomeCountryIdDateHijri.Value = True Then
             If txtHomeIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtHomeIssueYear.Enabled = True Then
                   txtHomeIssueYear.text = ""
                   txtHomeIssueYear.SetFocus
                Else
                   'frameIdInfo.Enabled = True
                   txtHomeIssueYear.Enabled = True
                   txtHomeIssueYear.text = ""
                   txtHomeIssueYear.SetFocus
                End If
                Exit Sub
             End If
          Else
             If txtHomeIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtHomeIssueYear.Enabled = True Then
                   txtHomeIssueYear.text = ""
                   txtHomeIssueYear.SetFocus
                Else
                   txtHomeIssueYear.Enabled = True
                   txtHomeIssueYear.text = ""
                   txtHomeIssueYear.SetFocus
                End If
                Exit Sub
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtHomeMobileCode_KeyPress(KeyAscii As Integer)
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

Private Sub txtHomeOffPhoneAreaCode_KeyPress(KeyAscii As Integer)
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

Private Sub txtHomePagerNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomePhoneResAreaCode_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtHomePhoneResExt_KeyPress(KeyAscii As Integer)
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

Private Sub txtSamaApproveYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtSamaApproveYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
       On Error Resume Next
       If Len(RTrim(cmbSamaApproveDate)) > 0 And Len(RTrim(cmbSamaApproveMonth)) > 0 Then
          If Len(RTrim(txtSamaApproveYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtSamaApproveYear.text = ""
             txtSamaApproveYear.SetFocus
             Exit Sub
          End If
       End If
       If optSamaDateHijri.Value = True Then
          If Len(RTrim(txtSamaApproveYear)) <> 0 Then
             If txtSamaApproveYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                frameIdInfo.Enabled = True
                txtSamaApproveYear.text = ""
                txtSamaApproveYear.SetFocus
                Exit Sub
             End If
          End If
       Else
          If Len(RTrim(txtSamaApproveYear)) <> 0 Then
             If txtSamaApproveYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                txtSamaApproveYear.text = ""
                txtSamaApproveYear.SetFocus
                Exit Sub
             End If
          End If
       End If
     End If
     On Error GoTo 0
  End If

End Sub

Public Function validateFrmindividualOthers2() As Integer
    Dim tmpVar As Integer
    Dim tCode As String
    Dim packCode As String
    Dim tIssueDate As String
    Dim tExpiryDate As String
    Dim tmpStr As String
    
    validateFrmindividualOthers2 = 0
    
    If Len(RTrim(cmbEducation.text)) = 0 Then
       MsgBox errSpaceEducation(UserLang) '"Education code should be selected...Please select from the list"
       cmbEducation.SetFocus
       validateFrmindividualOthers2 = 1
       Exit Function
    Else
       validateFrmindividualOthers2 = 0
    End If
    
    If Len(RTrim(cmbProfession.text)) = 0 Then
       MsgBox errSpaceProfession(UserLang) '"Profession Code should be selected...Please select from the list"
       cmbProfession.SetFocus
       validateFrmindividualOthers2 = 1
       Exit Function
    Else
       validateFrmindividualOthers2 = 0
    End If
     
    If Len(RTrim(cmbPosition.text)) = 0 Then
       MsgBox errSpacePosition(UserLang) '"Position Code should be selected...Please select from the list"
       cmbPosition.SetFocus
       validateFrmindividualOthers2 = 1
       Exit Function
    Else
       validateFrmindividualOthers2 = 0
    End If
       
    If Len(RTrim(cmbMonthlyIncome.text)) = 0 Then
       MsgBox errSpaceIncome(UserLang) '"Monthly income code should be selected...Please select from the list"
       cmbMonthlyIncome.SetFocus
       validateFrmindividualOthers2 = 1
       Exit Function
    Else
       validateFrmindividualOthers2 = 0
    End If
       
    If chkRentedHouse.Value = 0 And _
       chkOwnHouse.Value = 0 And _
       chkCompanyAcc.Value = 0 And _
       chkRentedCar.Value = 0 And _
       chkOwnCar.Value = 0 And _
       chkCompanyTransport.Value = 0 Then
       
       MsgBox errSpaceOwnership(UserLang) '"Please select any one in ownership...."
       chkRentedHouse.SetFocus
       validateFrmindividualOthers2 = 1
       Exit Function
    Else
       validateFrmindividualOthers2 = 0
    End If

    If InStr(recvLoginMsg.authorityLevel, "~7") > 0 Then
      tCode = Mid$(cmbPackageAcc.text, 1, 1)
      If tCode = "0" Then
         If updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
            If recvOtherIndividualMsg.packagedAcc > "0" Then
               packCode = "~7" & recvOtherIndividualMsg.packagedAcc
               If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
                  MsgBox errNotAuthorisedToFlag(UserLang)
                  bringOldFlag
                  validateFrmindividualOthers2 = 1
                  Exit Function
               Else
                  validateFrmindividualOthers2 = 0
               End If
            End If
         End If
      Else
         If updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
            If tCode <> recvOtherIndividualMsg.packagedAcc Then
               packCode = "~7" & tCode
               If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
                  MsgBox errNotAuthorisedToFlag(UserLang)
                  bringOldFlag
                  validateFrmindividualOthers2 = 1
                  Exit Function
               Else
                  validateFrmindividualOthers2 = 0
               End If
            End If
        Else
           packCode = "~7" & tCode
           If InStr(recvLoginMsg.authorityLevel, packCode) = 0 Then
              MsgBox errNotAuthorisedToFlag(UserLang)
              bringOldFlag
              validateFrmindividualOthers2 = 1
              Exit Function
           Else
              validateFrmindividualOthers2 = 0
           End If
        End If
      End If
    End If
    
    If Mid$(cmbPackageAcc.text, 1, 1) = "1" Or Mid$(cmbPackageAcc.text, 1, 1) = "4" Then
       If Mid$(cmbMonthlyIncome.text, 4, 1) < "2" Then 'Or _
                                                        'chkSalaryTransfer.Value = vbUnchecked Then
          MsgBox errNotPackageAcc(UserLang)
          validateFrmindividualOthers2 = 1
          Exit Function
       Else
          validateFrmindividualOthers2 = 0
       End If
    End If
    
    If subCategoryCode = "03" Or subCategoryCode = "04" Or subCategoryCode = "07" Or _
       subCategoryCode = "08" Or subCategoryCode = "09" Or subCategoryCode = "60" Or _
       subCategoryCode = "61" Or subCategoryCode = "62" Or subCategoryCode = "70" Or _
       subCategoryCode = "71" Or subCategoryCode = "72" Or subCategoryCode = "74" Or _
       subCategoryCode = "63" Then
    
        If Len(RTrim(txtHomeAddress1)) = 0 Or _
           Len(RTrim(txtHomePoBox)) = 0 Or _
           Len(RTrim(txtHomeZipCode)) = 0 Or _
           Len(RTrim(cmbHomeCityName.text)) = 0 Then
          
           MsgBox errSpaceHomeAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
           txtHomeAddress1.SetFocus
           validateFrmindividualOthers2 = 1
           Exit Function
        Else
           validateFrmindividualOthers2 = 0
        End If
        
    End If  ' if subCategoryCode = "03" Or subCategoryCode = "04" Or subCategoryCode = "07" Or subCategoryCode = "08" Or subCategoryCode = "09"
    
    If subCategoryCode = "07" Or subCategoryCode = "08" Then  ' resident/Non-res investing in local share
       If Len(RTrim(txtInterGroupNo)) = 0 Then
          MsgBox errSpaceInterGroupAccNo(UserLang)
          txtInterGroupNo.SetFocus
          validateFrmindividualOthers2 = 1
          Exit Function
       Else
          validateFrmindividualOthers2 = 0
       End If
       
       If Len(RTrim(txtSpecialRefNo)) = 0 Then
          MsgBox errSpaceSpecialRefNo(UserLang)
          txtSpecialRefNo.SetFocus
          validateFrmindividualOthers2 = 1
          Exit Function
       Else
          validateFrmindividualOthers2 = 0
       End If
    End If  ' if subCategoryCode = "07" Or subCategoryCode = "08"
    
    If subCategoryCode = "08" Or subCategoryCode = "09" Then  ' Non/res investing in local shares
                                                              ' other non-res individual
       If Len(RTrim(txtHomeCountryId)) = 0 Then
          MsgBox errSpaceHomeCountryId(UserLang)
          txtHomeCountryId.SetFocus
          validateFrmindividualOthers2 = 1
          Exit Function
       Else
          validateFrmindividualOthers2 = 0
       End If
      
      If Len(RTrim(cmbHomeIssueDate.text)) = 0 Or _
         Len(RTrim(cmbHomeIssueMonth.text)) = 0 Or _
         Len(RTrim(txtHomeIssueYear)) = 0 Then
         MsgBox errSpaceIssueDate(UserLang)
         cmbHomeIssueDate.SetFocus
         validateFrmindividualOthers2 = 1
         Exit Function
      Else
         validateFrmindividualOthers2 = 0
      End If
        
      If Len(RTrim(cmbHomeExpiryDate.text)) = 0 Or _
         Len(RTrim(cmbHomeExpiryMonth.text)) = 0 Or _
         Len(RTrim(txtHomeExpiryYear)) = 0 Then
         MsgBox errSpaceExpiryDate(UserLang)
         cmbHomeExpiryDate.SetFocus
         validateFrmindividualOthers2 = 1
         Exit Function
      Else
         validateFrmindividualOthers2 = 0
      End If
            
      tIssueDate = CStr(txtHomeIssueYear) & _
                   CStr(cmbHomeIssueMonth.text) & _
                   CStr(cmbHomeIssueDate.text)
                   
      tExpiryDate = CStr(txtHomeExpiryYear) & _
                    CStr(cmbHomeExpiryMonth.text) & _
                    CStr(cmbHomeExpiryDate.text)
                          
      If optHomeCountryDateGregorian.Value = True Then
         If Not validDate(tIssueDate) Then
            MsgBox errInvalidDate(UserLang)
            cmbHomeIssueDate.SetFocus
            validateFrmindividualOthers2 = 1
            Exit Function
         Else
            validateFrmindividualOthers2 = 0
         End If
               
         If Not validDate(tExpiryDate) Then
            MsgBox errInvalidDate(UserLang)
            cmbHomeExpiryDate.SetFocus
            validateFrmindividualOthers2 = 1
            Exit Function
         Else
            validateFrmindividualOthers2 = 0
         End If
     End If
                         
     If tExpiryDate < tIssueDate Then
        MsgBox errGreaterExpiryYear(UserLang)
        txtHomeExpiryYear.SetFocus
        validateFrmindividualOthers2 = 1
        Exit Function
     Else
        validateFrmindividualOthers2 = 0
     End If
        
     If optHomeCountryIdDateHijri = True Then
        If tExpiryDate < currentHijriDate Then
           MsgBox errExpiryDateLessThanToday(UserLang)
           txtHomeExpiryYear.SetFocus
           validateFrmindividualOthers2 = 1
           Exit Function
        Else
           validateFrmindividualOthers2 = 0
        End If
     Else
        If tExpiryDate < currentGregDate Then
           MsgBox errExpiryDateLessThanToday(UserLang)
           txtHomeExpiryYear.SetFocus
           validateFrmindividualOthers2 = 1
           Exit Function
        Else
           validateFrmindividualOthers2 = 0
        End If
    End If
  End If 'subCategoryCode = "08" Or subCategoryCode = "09"
    
  If subCategoryCode = "09" Or subCategoryCode = "71" Then   ' Other Non-resident individuals
     If Len(RTrim(txtSamaApprovalNo)) = 0 Then
        MsgBox errSpaceSamaApproval(UserLang)
        txtSamaApprovalNo.SetFocus
        validateFrmindividualOthers2 = 1
        Exit Function
     Else
        validateFrmindividualOthers2 = 0
     End If
  End If ' subcategorycode = "09" Other Non-resident individuals
       
  If Len(RTrim(txtSamaApprovalNo)) > 0 Then
     If Len(RTrim(cmbSamaApproveDate.text)) = 0 Or _
        Len(RTrim(cmbSamaApproveMonth.text)) = 0 Or _
        Len(RTrim(txtSamaApproveYear)) = 0 Then
        MsgBox errSpaceIssueDate(UserLang)
        cmbSamaApproveDate.SetFocus
        validateFrmindividualOthers2 = 1
        Exit Function
     Else
        validateFrmindividualOthers2 = 0
     End If
     
     If optSamaDateGregorian.Value = True Then
        tmpStr = txtSamaApproveYear & cmbSamaApproveMonth & cmbSamaApproveDate
        If validDate(tmpStr) = False Then
           MsgBox errInvalidDate(UserLang)
           cmbSamaApproveDate.SetFocus
           validateFrmindividualOthers2 = 1
           Exit Function
        Else
           validateFrmindividualOthers2 = 0
        End If
     End If
  End If 'Len(RTrim(txtSamaApprovalNo)) > 0
  
  If subCategoryCode = "61" Or subCategoryCode = "62" Then   ' Burmese & Beluchis and turkistanians
     If Len(RTrim(txtApproverNo)) = 0 Then
        MsgBox errSpaceAppRefNo(UserLang) '"Approver reference number cannot be spaces..please enter.."
        txtApproverNo.SetFocus
        validateFrmindividualOthers2 = 1
        Exit Function
     Else
        validateFrmindividualOthers2 = 0
     End If
  End If ' subcategorycode = "61" or "62"
  
  If Len(RTrim(txtApproverNo)) > 0 Then
     If Len(RTrim(cmbAppIssueDate.text)) = 0 Or _
        Len(RTrim(cmbAppIssueMonth.text)) = 0 Or _
        Len(RTrim(txtAppIssueYear)) = 0 Then
        MsgBox errSpaceIssueDate(UserLang)
        cmbAppIssueDate.SetFocus
        validateFrmindividualOthers2 = 1
        Exit Function
     Else
        validateFrmindividualOthers2 = 0
     End If
        
     If Len(RTrim(cmbAppExpiryDate.text)) = 0 Or _
        Len(RTrim(cmbAppExpiryMonth.text)) = 0 Or _
        Len(RTrim(txtAppExpiryYear)) = 0 Then
        MsgBox errSpaceExpiryDate(UserLang)
        cmbAppExpiryDate.SetFocus
        validateFrmindividualOthers2 = 1
        Exit Function
     Else
        validateFrmindividualOthers2 = 0
     End If
      
     tIssueDate = CStr(txtAppIssueYear) & _
                  CStr(cmbAppIssueMonth) & _
                  CStr(cmbAppIssueDate)
            
     tExpiryDate = CStr(txtAppExpiryYear) & _
                   CStr(cmbAppExpiryMonth) & _
                   CStr(cmbAppExpiryDate)
                      
     If optAppDateGreg.Value = True Then
        If Len(RTrim(tIssueDate)) > 0 Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              cmbAppIssueDate.SetFocus
              validateFrmindividualOthers2 = 1
              Exit Function
           Else
              validateFrmindividualOthers2 = 0
           End If
       End If
         
       If Len(RTrim(tExpiryDate)) <> 0 Then
          If Not validDate(tExpiryDate) Then
             MsgBox errInvalidDate(UserLang)
             cmbAppExpiryDate.SetFocus
             validateFrmindividualOthers2 = 1
             Exit Function
          Else
             validateFrmindividualOthers2 = 0
          End If
       End If
     End If
                              
     If Len(RTrim(tExpiryDate)) <> 0 Then
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           txtAppExpiryYear.SetFocus
           validateFrmindividualOthers2 = 1
           Exit Function
        Else
           validateFrmindividualOthers2 = 0
        End If
            
        If optAppDateHijri = True Then
           If tExpiryDate < currentHijriDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtAppExpiryYear.SetFocus
              validateFrmindividualOthers2 = 1
              Exit Function
           Else
              validateFrmindividualOthers2 = 0
           End If
        Else
           If tExpiryDate < currentGregDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtAppExpiryYear.SetFocus
              validateFrmindividualOthers2 = 1
              Exit Function
           Else
              validateFrmindividualOthers2 = 0
           End If
       End If
    End If
  End If 'if len(txtapproverno) > 0
  
End Function
