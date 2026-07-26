VERSION 5.00
Begin VB.Form frmJuristicPublic_CorpSector 
   BackColor       =   &H00BFD87E&
   Caption         =   "Resident Juristic Customer Details"
   ClientHeight    =   8775
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12060
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8775
   ScaleWidth      =   12060
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   405
      Left            =   7425
      TabIndex        =   134
      Top             =   7785
      Width           =   1335
   End
   Begin VB.Frame frameCustomerName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   135
      TabIndex        =   116
      Top             =   1245
      Width           =   11775
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   126
         Tag             =   "11775"
         Top             =   600
         Width           =   1575
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   125
         Tag             =   "11775"
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   124
         Tag             =   "11775"
         Top             =   600
         Width           =   2880
      End
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   123
         Tag             =   "11775"
         Top             =   600
         Width           =   1695
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   122
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   121
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   120
         Tag             =   "11775"
         Top             =   240
         Width           =   2880
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   119
         Tag             =   "11775"
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   118
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
      End
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   117
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label lbl3rdName 
         BackColor       =   &H00BFD87E&
         Caption         =   "3rd Name"
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
         Left            =   5040
         TabIndex        =   133
         Tag             =   "11775"
         Top             =   0
         Width           =   1575
      End
      Begin VB.Label lblArabicShortName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Short Name"
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
         Left            =   8640
         TabIndex        =   132
         Tag             =   "11775"
         Top             =   0
         Width           =   2895
      End
      Begin VB.Label lblEnglishName 
         BackColor       =   &H00BFD87E&
         Caption         =   "English Name"
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
         TabIndex        =   131
         Tag             =   "11775"
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label lblArabicName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic Name"
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
         Tag             =   "11775"
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label lblLastName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Last Name"
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
         Left            =   6720
         TabIndex        =   129
         Tag             =   "11775"
         Top             =   0
         Width           =   1695
      End
      Begin VB.Label lbl2ndName 
         BackColor       =   &H00BFD87E&
         Caption         =   "2nd Name"
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
         TabIndex        =   128
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.Label lblFirstName 
         BackColor       =   &H00BFD87E&
         Caption         =   "First Name"
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
         TabIndex        =   127
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
   End
   Begin VB.ComboBox cmbBranchCode 
      Height          =   315
      Left            =   4125
      TabIndex        =   115
      Top             =   810
      Width           =   1710
   End
   Begin VB.ComboBox cmbBusinessType 
      Height          =   315
      Left            =   9525
      TabIndex        =   113
      Tag             =   "11775"
      Text            =   "cmbBusinessType"
      Top             =   5520
      Width           =   2175
   End
   Begin VB.Frame Frame4 
      BackColor       =   &H00BFD87E&
      Caption         =   "Open Update Details"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1020
      Left            =   150
      TabIndex        =   90
      Top             =   6450
      Width           =   11535
      Begin VB.TextBox Text9 
         BackColor       =   &H00C0C0C0&
         Height          =   285
         Left            =   4215
         MaxLength       =   4
         TabIndex        =   102
         Tag             =   "11775"
         Top             =   240
         Width           =   540
      End
      Begin VB.ComboBox Combo13 
         BackColor       =   &H00C0C0C0&
         Height          =   315
         Left            =   3615
         TabIndex        =   101
         Tag             =   "11775"
         Text            =   "01"
         Top             =   225
         Width           =   615
      End
      Begin VB.ComboBox Combo14 
         BackColor       =   &H00C0C0C0&
         Height          =   315
         Left            =   3015
         TabIndex        =   100
         Tag             =   "11775"
         Text            =   "01"
         Top             =   225
         Width           =   615
      End
      Begin VB.TextBox Text10 
         BackColor       =   &H00C0C0C0&
         Height          =   285
         Left            =   4215
         MaxLength       =   4
         TabIndex        =   99
         Tag             =   "11775"
         Top             =   600
         Width           =   540
      End
      Begin VB.ComboBox Combo15 
         BackColor       =   &H00C0C0C0&
         Height          =   315
         Left            =   3615
         TabIndex        =   98
         Tag             =   "11775"
         Text            =   "01"
         Top             =   585
         Width           =   615
      End
      Begin VB.ComboBox Combo16 
         BackColor       =   &H00C0C0C0&
         Height          =   315
         Left            =   3015
         TabIndex        =   97
         Tag             =   "11775"
         Text            =   "01"
         Top             =   585
         Width           =   615
      End
      Begin VB.TextBox Text11 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   285
         Left            =   5535
         TabIndex        =   96
         Top             =   225
         Width           =   975
      End
      Begin VB.TextBox Text12 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   285
         Left            =   5535
         TabIndex        =   95
         Top             =   615
         Width           =   975
      End
      Begin VB.TextBox Text13 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   285
         Left            =   8085
         TabIndex        =   94
         Top             =   210
         Width           =   975
      End
      Begin VB.TextBox Text14 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   285
         Left            =   8085
         TabIndex        =   93
         Top             =   600
         Width           =   975
      End
      Begin VB.TextBox Text15 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   285
         Left            =   10425
         TabIndex        =   92
         Top             =   210
         Width           =   975
      End
      Begin VB.TextBox Text16 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   285
         Left            =   10425
         TabIndex        =   91
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label26 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Update Details"
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
         Height          =   195
         Left            =   30
         TabIndex        =   112
         Tag             =   "11775"
         Top             =   645
         Width           =   1275
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Opening Details"
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
         Height          =   195
         Left            =   30
         TabIndex        =   111
         Tag             =   "11775"
         Top             =   300
         Width           =   1365
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Opening Date"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   1785
         TabIndex        =   110
         Tag             =   "11775"
         Top             =   300
         Width           =   1185
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Last Update Date"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   1470
         TabIndex        =   109
         Tag             =   "11775"
         Top             =   660
         Width           =   1515
      End
      Begin VB.Label Label19 
         BackColor       =   &H00BFD87E&
         Caption         =   "Branch"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   4815
         TabIndex        =   108
         Top             =   255
         Width           =   735
      End
      Begin VB.Label Label20 
         BackColor       =   &H00BFD87E&
         Caption         =   "Branch"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   4815
         TabIndex        =   107
         Top             =   630
         Width           =   735
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Maker ID"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   6885
         TabIndex        =   106
         Top             =   255
         Width           =   795
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Maker ID"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   6885
         TabIndex        =   105
         Top             =   615
         Width           =   795
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Supervisor ID"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   9210
         TabIndex        =   104
         Top             =   240
         Width           =   1170
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Supervisor ID"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Left            =   9210
         TabIndex        =   103
         Top             =   600
         Width           =   1170
      End
      Begin VB.Line Line9 
         BorderColor     =   &H00C0C0C0&
         BorderStyle     =   3  'Dot
         DrawMode        =   4  'Mask Not Pen
         X1              =   30
         X2              =   11505
         Y1              =   555
         Y2              =   555
      End
   End
   Begin VB.CommandButton Command3 
      Caption         =   "&Account Details"
      Height          =   405
      Left            =   4755
      TabIndex        =   89
      Top             =   7785
      Width           =   1335
   End
   Begin VB.CommandButton Command4 
      Caption         =   "&Documents"
      Height          =   405
      Left            =   6090
      TabIndex        =   88
      Top             =   7785
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Create/Update"
      Height          =   405
      Left            =   3420
      TabIndex        =   87
      Top             =   7785
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   4260
      TabIndex        =   80
      Top             =   4350
      Width           =   1740
      Begin VB.OptionButton Option4 
         BackColor       =   &H00BFD87E&
         Caption         =   "Hijri"
         Height          =   255
         Left            =   135
         TabIndex        =   82
         Tag             =   "1935"
         ToolTipText     =   "Hijri"
         Top             =   165
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton Option3 
         BackColor       =   &H00BFD87E&
         Caption         =   "Gregorian"
         Height          =   195
         Left            =   720
         TabIndex        =   81
         Tag             =   "1935"
         ToolTipText     =   "Gregorian"
         Top             =   180
         Width           =   990
      End
   End
   Begin VB.ComboBox Combo2 
      BackColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   9915
      TabIndex        =   79
      Tag             =   "11775"
      Text            =   "01"
      Top             =   4485
      Width           =   615
   End
   Begin VB.ComboBox Combo1 
      BackColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   10515
      TabIndex        =   78
      Tag             =   "11775"
      Text            =   "01"
      Top             =   4485
      Width           =   615
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   11115
      MaxLength       =   4
      TabIndex        =   77
      Tag             =   "11775"
      Top             =   4485
      Width           =   570
   End
   Begin VB.TextBox Text2 
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
      TabIndex        =   76
      Tag             =   "11775"
      Top             =   4560
      Width           =   1935
   End
   Begin VB.TextBox Text8 
      BackColor       =   &H00FFFFFF&
      Height          =   285
      Left            =   8280
      MaxLength       =   4
      TabIndex        =   75
      Tag             =   "11775"
      Top             =   4485
      Width           =   540
   End
   Begin VB.ComboBox Combo7 
      BackColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   7665
      TabIndex        =   74
      Tag             =   "11775"
      Text            =   "01"
      Top             =   4485
      Width           =   615
   End
   Begin VB.ComboBox Combo8 
      BackColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   7065
      TabIndex        =   73
      Tag             =   "11775"
      Text            =   "01"
      Top             =   4485
      Width           =   615
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   8415
      MaxLength       =   4
      TabIndex        =   67
      Tag             =   "11775"
      Top             =   3915
      Width           =   495
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   5040
      MaxLength       =   4
      TabIndex        =   64
      Tag             =   "11775"
      Top             =   3930
      Width           =   495
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1815
      MaxLength       =   4
      TabIndex        =   61
      Tag             =   "11775"
      Top             =   3945
      Width           =   495
   End
   Begin VB.TextBox Text6 
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
      Left            =   1305
      TabIndex        =   59
      Tag             =   "11775"
      Top             =   5520
      Width           =   6135
   End
   Begin VB.Frame frameCustomerAdvice 
      BackColor       =   &H00BFD87E&
      Height          =   450
      Left            =   5955
      TabIndex        =   54
      Top             =   5895
      Width           =   1470
      Begin VB.OptionButton optCustAdviceNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   750
         TabIndex        =   56
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   165
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optCustAdviceYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   255
         Left            =   120
         TabIndex        =   55
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   165
         Width           =   615
      End
   End
   Begin VB.Frame FrameInternetFlag 
      BackColor       =   &H00BFD87E&
      Height          =   465
      Left            =   1305
      TabIndex        =   51
      Top             =   5895
      Width           =   1575
      Begin VB.OptionButton optInternetNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   53
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   165
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optInternetYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   270
         Left            =   120
         TabIndex        =   52
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   165
         Width           =   615
      End
   End
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   9915
      TabIndex        =   40
      Top             =   4935
      Width           =   1755
      Begin VB.OptionButton optLangEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "English"
         Height          =   255
         Left            =   855
         TabIndex        =   42
         TabStop         =   0   'False
         Tag             =   "1935"
         ToolTipText     =   "English"
         Top             =   165
         Width           =   810
      End
      Begin VB.OptionButton optLangArabic 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic"
         Height          =   255
         Left            =   60
         TabIndex        =   41
         Tag             =   "1935"
         ToolTipText     =   "Arabic"
         Top             =   165
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   135
      TabIndex        =   9
      Top             =   2310
      Width           =   11595
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   1200
         MaxLength       =   30
         TabIndex        =   28
         Tag             =   "11775"
         Top             =   0
         Width           =   3015
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   4455
         MaxLength       =   30
         TabIndex        =   27
         Tag             =   "11775"
         Top             =   0
         Width           =   2880
      End
      Begin VB.TextBox txtPOBox 
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
         Left            =   1200
         TabIndex        =   26
         Tag             =   "11775"
         Top             =   360
         Width           =   975
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   3015
         TabIndex        =   25
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   360
         Width           =   2055
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6120
         TabIndex        =   24
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8280
         TabIndex        =   23
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   360
         Width           =   3255
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   22
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   21
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   20
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3015
         MaxLength       =   4
         TabIndex        =   19
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6720
         MaxLength       =   4
         TabIndex        =   18
         Tag             =   "11775"
         Text            =   " "
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8640
         MaxLength       =   10
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   16
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8280
         MaxLength       =   30
         TabIndex        =   15
         Tag             =   "11775"
         Top             =   1080
         Width           =   3255
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1200
         TabIndex        =   14
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtMobileAreaCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1200
         MaxLength       =   2
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8280
         TabIndex        =   12
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4920
         TabIndex        =   11
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   10
         TabIndex        =   10
         Tag             =   "11775"
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label lblAddress1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Off. Address"
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
         TabIndex        =   39
         Tag             =   "11775"
         Top             =   0
         Width           =   1095
      End
      Begin VB.Label lblPOBox 
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
         Left            =   -15
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label lblCity 
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
         Left            =   2460
         TabIndex        =   37
         Tag             =   "11775"
         Top             =   360
         Width           =   615
      End
      Begin VB.Label lblZipCode 
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
         Left            =   5175
         TabIndex        =   36
         Tag             =   "11775"
         Top             =   390
         Width           =   1095
      End
      Begin VB.Label lblCountry 
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
         Left            =   7440
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lblOffPhone 
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
         TabIndex        =   34
         Tag             =   "11775"
         Top             =   720
         Width           =   975
      End
      Begin VB.Label lblResPhone 
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
         Left            =   3720
         TabIndex        =   33
         Tag             =   "11775"
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label lblMobile 
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
         TabIndex        =   32
         Tag             =   "11775"
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label lblFax 
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
         Left            =   7440
         TabIndex        =   31
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.Label lblEmail 
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
         Left            =   7440
         TabIndex        =   30
         Tag             =   "11775"
         Top             =   1080
         Width           =   540
      End
      Begin VB.Label lblPager 
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
         Left            =   3720
         TabIndex        =   29
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
   End
   Begin VB.ComboBox cmbAltBrCode 
      Height          =   315
      Left            =   7830
      TabIndex        =   8
      Top             =   810
      Width           =   1815
   End
   Begin VB.TextBox txtCustomerNo 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   285
      Left            =   1950
      MaxLength       =   7
      TabIndex        =   7
      Top             =   825
      Width           =   1095
   End
   Begin VB.TextBox txtSysDate 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   10350
      TabIndex        =   6
      Top             =   765
      Width           =   1335
   End
   Begin VB.TextBox txtDobYear 
      Height          =   285
      Left            =   6720
      MaxLength       =   4
      TabIndex        =   5
      Top             =   5055
      Width           =   735
   End
   Begin VB.ComboBox cmbDobMonth 
      Height          =   315
      Left            =   6090
      TabIndex        =   4
      Text            =   "01"
      Top             =   5055
      Width           =   615
   End
   Begin VB.ComboBox cmbDobDate 
      Height          =   315
      Left            =   5490
      TabIndex        =   3
      Text            =   "01"
      Top             =   5055
      Width           =   615
   End
   Begin VB.Frame frameDobDateType 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1320
      TabIndex        =   0
      Top             =   4935
      Width           =   1935
      Begin VB.OptionButton optDOBGreg 
         BackColor       =   &H00BFD87E&
         Caption         =   "Gregorian"
         Height          =   195
         Left            =   720
         TabIndex        =   2
         Tag             =   "1935"
         ToolTipText     =   "Gregorian"
         Top             =   180
         Width           =   1095
      End
      Begin VB.OptionButton optDOBHijri 
         BackColor       =   &H00BFD87E&
         Caption         =   "Hijri"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Tag             =   "1935"
         ToolTipText     =   "Hijri"
         Top             =   165
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Resident Juristic"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   8640
      TabIndex        =   135
      Top             =   240
      Width           =   2685
   End
   Begin VB.Label lblBusinessType 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Business Type"
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
      Left            =   8190
      TabIndex        =   114
      Tag             =   "11775"
      Top             =   5565
      Width           =   1245
   End
   Begin VB.Label Label8 
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
      Left            =   3345
      TabIndex        =   86
      Tag             =   "11775"
      Top             =   4545
      Width           =   900
   End
   Begin VB.Label Label6 
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
      Left            =   8910
      TabIndex        =   85
      Tag             =   "11775"
      Top             =   4545
      Width           =   990
   End
   Begin VB.Label Label3 
      BackColor       =   &H00BFD87E&
      Caption         =   "SAMA Auth.Number"
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
      Left            =   135
      TabIndex        =   84
      Top             =   4440
      Width           =   1380
   End
   Begin VB.Label Label1 
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
      Left            =   6045
      TabIndex        =   83
      Tag             =   "11775"
      Top             =   4545
      Width           =   930
   End
   Begin VB.Label lblMainCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Resident Juristic"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   5760
      TabIndex        =   72
      Top             =   240
      Width           =   1725
   End
   Begin VB.Label lblSubCategory 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Sub Category:"
      Height          =   195
      Left            =   7560
      TabIndex        =   71
      Tag             =   "Ca"
      Top             =   240
      Width           =   1005
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   4560
      TabIndex        =   70
      Tag             =   "Ca"
      Top             =   240
      Width           =   1020
   End
   Begin VB.Line Line4 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   135
      X2              =   11655
      Y1              =   4320
      Y2              =   4320
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
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
      Height          =   300
      Left            =   8940
      TabIndex        =   69
      Tag             =   "11775"
      Top             =   3930
      Width           =   150
   End
   Begin VB.Label Label13 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Foreign Shareholding"
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
      Left            =   6420
      TabIndex        =   68
      Top             =   3960
      Width           =   1800
   End
   Begin VB.Label Label11 
      AutoSize        =   -1  'True
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
      Height          =   300
      Left            =   5565
      TabIndex        =   66
      Tag             =   "11775"
      Top             =   3945
      Width           =   150
   End
   Begin VB.Label Label10 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Saudi. Shareholding"
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
      Left            =   3225
      TabIndex        =   65
      Top             =   3975
      Width           =   1710
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
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
      Height          =   300
      Left            =   2340
      TabIndex        =   63
      Tag             =   "11775"
      Top             =   3960
      Width           =   150
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Govt. Shareholding"
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
      TabIndex        =   62
      Top             =   3960
      Width           =   1635
   End
   Begin VB.Label Label4 
      BackColor       =   &H00BFD87E&
      Caption         =   "Purpose of Account"
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
      Left            =   120
      TabIndex        =   60
      Tag             =   "11775"
      Top             =   5475
      Width           =   1110
   End
   Begin VB.Line Line8 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   5880
      Y2              =   5880
   End
   Begin VB.Line Line7 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   150
      X2              =   11670
      Y1              =   2310
      Y2              =   2310
   End
   Begin VB.Line Line6 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   6420
      Y2              =   6420
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
      Left            =   3960
      TabIndex        =   58
      Top             =   6045
      Width           =   1575
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
      Left            =   135
      TabIndex        =   57
      Top             =   6075
      Width           =   1230
   End
   Begin VB.Line Line5 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   0
      X2              =   11520
      Y1              =   3840
      Y2              =   3840
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Resident Juristic Customer Details"
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
      Left            =   180
      TabIndex        =   50
      Top             =   135
      Width           =   4230
   End
   Begin VB.Shape Shape2 
      Height          =   540
      Left            =   135
      Top             =   75
      Width           =   11550
   End
   Begin VB.Shape Shape1 
      Height          =   555
      Left            =   180
      Top             =   7710
      Width           =   11505
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Language"
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
      Left            =   8880
      TabIndex        =   49
      Top             =   5085
      Width           =   855
   End
   Begin VB.Label lblAltBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Alternative Br.Code"
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
      Left            =   5910
      TabIndex        =   48
      Top             =   825
      Width           =   1815
   End
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Number"
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
      Left            =   150
      TabIndex        =   47
      Top             =   840
      Width           =   1815
   End
   Begin VB.Label lblBranch 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch"
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
      Left            =   3390
      TabIndex        =   46
      Top             =   825
      Width           =   735
   End
   Begin VB.Label lblSysDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Date"
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
      Left            =   9750
      TabIndex        =   45
      Top             =   825
      Width           =   495
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   165
      X2              =   11685
      Y1              =   1185
      Y2              =   1185
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   135
      X2              =   11655
      Y1              =   4920
      Y2              =   4920
   End
   Begin VB.Label lblDOBDateType 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Date of Est"
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
      Left            =   105
      TabIndex        =   44
      Tag             =   "11775"
      Top             =   5130
      Width           =   975
   End
   Begin VB.Label lblDateOfBirth 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Date of Est"
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
      Left            =   4425
      TabIndex        =   43
      Top             =   5100
      Width           =   975
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   150
      X2              =   11670
      Y1              =   5460
      Y2              =   5460
   End
End
Attribute VB_Name = "frmJuristicPublic_CorpSector"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
frmJuristicOwner.Show
End Sub

Private Sub Command2_Click()
frmJuristicSignatory.Show
End Sub

Private Sub Command3_Click()
frmJuristicAccountInfo.Show
End Sub

Private Sub Command4_Click()
frmJuristicDocuments.Show
End Sub

