VERSION 5.00
Begin VB.Form frmJuristicDiplomats 
   BackColor       =   &H00BFD87E&
   Caption         =   "Resident Juristic Customer Details"
   ClientHeight    =   8760
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12015
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8760
   ScaleWidth      =   12015
   Begin VB.CommandButton cmdAcctInfo 
      Caption         =   "Account"
      Height          =   405
      Left            =   4200
      TabIndex        =   141
      ToolTipText     =   "Account Info"
      Top             =   8010
      Width           =   1575
   End
   Begin VB.Frame frameOpenUpdateDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Open Update Details"
      Enabled         =   0   'False
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
      Left            =   120
      TabIndex        =   118
      Top             =   6810
      Width           =   11580
      Begin VB.TextBox txtUpdateSupervisorId 
         BackColor       =   &H00C0C0C0&
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
         Height          =   285
         Left            =   10320
         TabIndex        =   130
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox txtOpenSupervisorId 
         BackColor       =   &H00C0C0C0&
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
         Height          =   285
         Left            =   10320
         TabIndex        =   129
         Top             =   195
         Width           =   1095
      End
      Begin VB.TextBox txtUpdateMakerId 
         BackColor       =   &H00C0C0C0&
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
         Height          =   285
         Left            =   7680
         TabIndex        =   128
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txtOpenMakerId 
         BackColor       =   &H00C0C0C0&
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
         Height          =   285
         Left            =   7680
         TabIndex        =   127
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtUpdateBranch 
         BackColor       =   &H00C0C0C0&
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
         Height          =   285
         Left            =   5535
         TabIndex        =   126
         Top             =   615
         Width           =   975
      End
      Begin VB.TextBox txtOpenBranch 
         BackColor       =   &H00C0C0C0&
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
         Height          =   285
         Left            =   5535
         TabIndex        =   125
         Top             =   240
         Width           =   975
      End
      Begin VB.ComboBox cmbUpdateDate 
         BackColor       =   &H00C0C0C0&
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
         Height          =   315
         Left            =   3000
         TabIndex        =   124
         Tag             =   "11775"
         Text            =   "01"
         Top             =   585
         Width           =   615
      End
      Begin VB.ComboBox cmbUpdateMonth 
         BackColor       =   &H00C0C0C0&
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
         Height          =   315
         Left            =   3615
         TabIndex        =   123
         Tag             =   "11775"
         Text            =   "01"
         Top             =   585
         Width           =   615
      End
      Begin VB.TextBox txtUpdateYear 
         BackColor       =   &H00C0C0C0&
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
         Height          =   285
         Left            =   4215
         MaxLength       =   4
         TabIndex        =   122
         Tag             =   "11775"
         Top             =   600
         Width           =   540
      End
      Begin VB.ComboBox cmbOpenDate 
         BackColor       =   &H00C0C0C0&
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
         Height          =   315
         Left            =   3015
         TabIndex        =   121
         Tag             =   "11775"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbOpenMonth 
         BackColor       =   &H00C0C0C0&
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
         Height          =   315
         Left            =   3615
         TabIndex        =   120
         Tag             =   "11775"
         Text            =   "01"
         Top             =   225
         Width           =   615
      End
      Begin VB.TextBox txtOpenYear 
         BackColor       =   &H00C0C0C0&
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
         Height          =   285
         Left            =   4215
         MaxLength       =   4
         TabIndex        =   119
         Tag             =   "11775"
         Top             =   240
         Width           =   540
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00C0C0C0&
         BorderStyle     =   3  'Dot
         DrawMode        =   4  'Mask Not Pen
         X1              =   30
         X2              =   11505
         Y1              =   555
         Y2              =   555
      End
      Begin VB.Label lblUpdateSupervisorId 
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
         Left            =   9000
         TabIndex        =   140
         Top             =   600
         Width           =   1170
      End
      Begin VB.Label lblOpenSupervisorId 
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
         Left            =   9000
         TabIndex        =   139
         Top             =   240
         Width           =   1170
      End
      Begin VB.Label lblUpdateMakerId 
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
         Left            =   6720
         TabIndex        =   138
         Top             =   615
         Width           =   795
      End
      Begin VB.Label lblOpenMakerId 
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
         Left            =   6720
         TabIndex        =   137
         Top             =   240
         Width           =   795
      End
      Begin VB.Label lblUpdateBranch 
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
         TabIndex        =   136
         Top             =   630
         Width           =   735
      End
      Begin VB.Label lblOpenBranch 
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
         TabIndex        =   135
         Top             =   255
         Width           =   735
      End
      Begin VB.Label lblUpdateDate 
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
         TabIndex        =   134
         Tag             =   "11775"
         Top             =   660
         Width           =   1515
      End
      Begin VB.Label lblOpeningDate 
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
         TabIndex        =   133
         Tag             =   "11775"
         Top             =   300
         Width           =   1185
      End
      Begin VB.Label lblOpeningDetails 
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
         Left            =   240
         TabIndex        =   132
         Tag             =   "11775"
         Top             =   300
         Width           =   1365
      End
      Begin VB.Label lblUpdateDetails 
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
         Left            =   240
         TabIndex        =   131
         Tag             =   "11775"
         Top             =   645
         Width           =   1275
      End
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor Comments"
      Height          =   405
      Left            =   5760
      TabIndex        =   116
      ToolTipText     =   "Supervisor Comments"
      Top             =   8010
      Width           =   2175
   End
   Begin VB.CommandButton cmdNextPage 
      Caption         =   "&Next Page"
      Height          =   405
      Left            =   7920
      TabIndex        =   115
      ToolTipText     =   "Next Page"
      Top             =   8010
      Width           =   1305
   End
   Begin VB.Frame frameIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   2430
      Left            =   120
      TabIndex        =   94
      Top             =   960
      Width           =   11805
      Begin VB.TextBox txtApproverName 
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
         Left            =   1335
         MaxLength       =   15
         TabIndex        =   164
         Tag             =   "11820"
         Top             =   1785
         Width           =   2625
      End
      Begin VB.Frame FrameAppDateType 
         BackColor       =   &H00BFD87E&
         Height          =   480
         Left            =   4080
         TabIndex        =   157
         Tag             =   "11820"
         Top             =   1335
         Width           =   1515
         Begin VB.OptionButton optAppDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Greg"
            Height          =   195
            Left            =   720
            TabIndex        =   159
            Tag             =   "1515"
            ToolTipText     =   "Gregorian"
            Top             =   165
            Width           =   735
         End
         Begin VB.OptionButton optAppDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   135
            TabIndex        =   158
            Tag             =   "1515"
            ToolTipText     =   "Hijri"
            Top             =   165
            Value           =   -1  'True
            Width           =   615
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
         Left            =   1155
         MaxLength       =   15
         TabIndex        =   156
         Tag             =   "11820"
         Top             =   1455
         Width           =   1860
      End
      Begin VB.ComboBox cmbAppExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10410
         TabIndex        =   155
         Tag             =   "11820"
         Text            =   "01"
         Top             =   1410
         Width           =   615
      End
      Begin VB.ComboBox cmbAppExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9810
         TabIndex        =   154
         Tag             =   "11820"
         Text            =   "01"
         Top             =   1410
         Width           =   615
      End
      Begin VB.ComboBox cmbAppIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6915
         TabIndex        =   153
         Tag             =   "11820"
         Text            =   "01"
         Top             =   1410
         Width           =   615
      End
      Begin VB.ComboBox cmbAppIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7515
         TabIndex        =   152
         Tag             =   "11820"
         Text            =   "01"
         Top             =   1410
         Width           =   615
      End
      Begin VB.TextBox txtAppIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8115
         MaxLength       =   4
         TabIndex        =   151
         Tag             =   "11820"
         Top             =   1410
         Width           =   570
      End
      Begin VB.TextBox txtAppExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   11010
         MaxLength       =   4
         TabIndex        =   150
         Tag             =   "11820"
         Top             =   1410
         Width           =   600
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H00BFD87E&
         Height          =   435
         Left            =   4080
         TabIndex        =   98
         Tag             =   "11805"
         Top             =   870
         Width           =   1530
         Begin VB.OptionButton optVisaDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Greg"
            Height          =   195
            Left            =   720
            TabIndex        =   24
            Tag             =   "1530"
            ToolTipText     =   "Gregorian"
            Top             =   150
            Width           =   765
         End
         Begin VB.OptionButton optVisaDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   210
            Left            =   120
            TabIndex        =   23
            Tag             =   "1530"
            ToolTipText     =   "Hijri"
            Top             =   165
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame frameDiplomaticCardDateType 
         BackColor       =   &H00BFD87E&
         Height          =   420
         Left            =   4065
         TabIndex        =   97
         Tag             =   "11805"
         Top             =   435
         Width           =   1545
         Begin VB.OptionButton optDCDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   225
            Left            =   120
            TabIndex        =   13
            Tag             =   "1545"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optDCDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Greg"
            Height          =   195
            Left            =   720
            TabIndex        =   14
            Tag             =   "1545"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   765
         End
      End
      Begin VB.ComboBox cmbDCExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9840
         TabIndex        =   19
         Tag             =   "11805"
         Text            =   "01"
         Top             =   570
         Width           =   615
      End
      Begin VB.ComboBox cmbDCExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10440
         TabIndex        =   20
         Tag             =   "11805"
         Text            =   "01"
         Top             =   570
         Width           =   615
      End
      Begin VB.TextBox txtDCExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   11040
         MaxLength       =   4
         TabIndex        =   21
         Tag             =   "11805"
         Top             =   600
         Width           =   555
      End
      Begin VB.TextBox txtDiplomaticCardNo 
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
         MaxLength       =   15
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   570
         Width           =   1770
      End
      Begin VB.TextBox txtPPNo 
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
         MaxLength       =   15
         TabIndex        =   3
         Tag             =   "11805"
         Top             =   135
         Width           =   1770
      End
      Begin VB.TextBox txtPPExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   11040
         MaxLength       =   4
         TabIndex        =   11
         Tag             =   "11805"
         Top             =   150
         Width           =   555
      End
      Begin VB.ComboBox cmbPPExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10440
         TabIndex        =   10
         Tag             =   "11805"
         Text            =   "01"
         Top             =   120
         Width           =   615
      End
      Begin VB.ComboBox cmbPPExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9840
         TabIndex        =   9
         Tag             =   "11805"
         Text            =   "01"
         Top             =   135
         Width           =   615
      End
      Begin VB.Frame framePpDateType 
         BackColor       =   &H00BFD87E&
         Height          =   435
         Left            =   4065
         TabIndex        =   96
         Tag             =   "11805"
         Top             =   15
         Width           =   1545
         Begin VB.OptionButton optPPDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Greg"
            Height          =   195
            Left            =   720
            TabIndex        =   5
            Tag             =   "1545"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   765
         End
         Begin VB.OptionButton optPPDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   4
            Tag             =   "1545"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame frameLang 
         BackColor       =   &H00BFD87E&
         Height          =   450
         Left            =   1215
         TabIndex        =   95
         Tag             =   "11805"
         Top             =   1995
         Width           =   1935
         Begin VB.OptionButton optLangEnglish 
            BackColor       =   &H00BFD87E&
            Caption         =   "English"
            Height          =   255
            Left            =   960
            TabIndex        =   32
            TabStop         =   0   'False
            Tag             =   "1935"
            ToolTipText     =   "English"
            Top             =   165
            Width           =   855
         End
         Begin VB.OptionButton optLangArabic 
            BackColor       =   &H00BFD87E&
            Caption         =   "Arabic"
            Height          =   255
            Left            =   120
            TabIndex        =   31
            Tag             =   "1935"
            ToolTipText     =   "Arabic"
            Top             =   165
            Value           =   -1  'True
            Width           =   855
         End
      End
      Begin VB.ComboBox cmbNationality 
         Height          =   315
         Left            =   5370
         TabIndex        =   33
         Tag             =   "11805"
         Text            =   "cmbNationality"
         Top             =   2100
         Width           =   2805
      End
      Begin VB.TextBox txtVisaExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   11040
         MaxLength       =   4
         TabIndex        =   30
         Tag             =   "11805"
         Top             =   990
         Width           =   540
      End
      Begin VB.ComboBox cmbVisaExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10440
         TabIndex        =   29
         Tag             =   "11805"
         Text            =   "01"
         Top             =   975
         Width           =   600
      End
      Begin VB.ComboBox cmbVisaExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9825
         TabIndex        =   28
         Tag             =   "11805"
         Text            =   "01"
         Top             =   975
         Width           =   615
      End
      Begin VB.ComboBox cmbPPIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6930
         TabIndex        =   6
         Tag             =   "11805"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.ComboBox cmbPPIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7530
         TabIndex        =   7
         Tag             =   "11805"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.TextBox txtPPIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8145
         MaxLength       =   4
         TabIndex        =   8
         Tag             =   "11805"
         Top             =   120
         Width           =   555
      End
      Begin VB.TextBox txtDCIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8130
         MaxLength       =   4
         TabIndex        =   18
         Tag             =   "11805"
         Top             =   555
         Width           =   555
      End
      Begin VB.ComboBox cmbDCIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7530
         TabIndex        =   17
         Tag             =   "11805"
         Text            =   "01"
         Top             =   540
         Width           =   615
      End
      Begin VB.ComboBox cmbDCIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6930
         TabIndex        =   15
         Tag             =   "11805"
         Text            =   "01"
         Top             =   540
         Width           =   615
      End
      Begin VB.TextBox txtVisaIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8145
         MaxLength       =   4
         TabIndex        =   27
         Tag             =   "11805"
         Top             =   945
         Width           =   555
      End
      Begin VB.ComboBox cmbVisaIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7530
         TabIndex        =   26
         Tag             =   "11805"
         Text            =   "01"
         Top             =   945
         Width           =   615
      End
      Begin VB.ComboBox cmbVisaIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6930
         TabIndex        =   25
         Tag             =   "11805"
         Text            =   "01"
         Top             =   945
         Width           =   615
      End
      Begin VB.ComboBox cmbBusinessType 
         Height          =   315
         Left            =   9810
         TabIndex        =   34
         Tag             =   "11805"
         Text            =   "cmbBusinessType"
         Top             =   2100
         Width           =   1785
      End
      Begin VB.TextBox txtVisaNo 
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
         MaxLength       =   15
         TabIndex        =   22
         Tag             =   "11805"
         Top             =   1005
         Width           =   1770
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
         Left            =   0
         TabIndex        =   165
         Tag             =   "11820"
         Top             =   1800
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
         Left            =   30
         TabIndex        =   163
         Tag             =   "11820"
         Top             =   1455
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
         Left            =   8730
         TabIndex        =   162
         Tag             =   "11820"
         Top             =   1455
         Width           =   990
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
         Left            =   3060
         TabIndex        =   161
         Tag             =   "11820"
         Top             =   1500
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
         Left            =   5640
         TabIndex        =   160
         Tag             =   "11820"
         Top             =   1455
         Width           =   1050
      End
      Begin VB.Label lblDcDateType 
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
         Left            =   3045
         TabIndex        =   113
         Tag             =   "11805"
         Top             =   630
         Width           =   1020
      End
      Begin VB.Label lblDcExpiryDate 
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
         Left            =   8730
         TabIndex        =   112
         Tag             =   "11805"
         Top             =   630
         Width           =   1230
      End
      Begin VB.Label lblDcNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Diplomatic  Card Number"
         BeginProperty Font 
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
         Left            =   0
         TabIndex        =   111
         Tag             =   "11805"
         Top             =   525
         Width           =   1200
      End
      Begin VB.Label lblPpNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Passport Number"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   420
         Left            =   15
         TabIndex        =   110
         Tag             =   "11805"
         Top             =   75
         Width           =   1185
      End
      Begin VB.Label lblPpExpiryDate 
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
         Left            =   8730
         TabIndex        =   109
         Tag             =   "11805"
         Top             =   195
         Width           =   1230
      End
      Begin VB.Label lblPpDateType 
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
         Left            =   3045
         TabIndex        =   108
         Tag             =   "11775"
         Top             =   195
         Width           =   1020
      End
      Begin VB.Label lblLangPreferred 
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
         Left            =   30
         TabIndex        =   107
         Tag             =   "11805"
         Top             =   2145
         Width           =   1200
      End
      Begin VB.Label lblNationality 
         BackColor       =   &H00BFD87E&
         Caption         =   "Nationality"
         BeginProperty Font 
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
         Left            =   4095
         TabIndex        =   106
         Tag             =   "11805"
         Top             =   2130
         Width           =   1215
      End
      Begin VB.Label lblVisaExpiryDate 
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
         Height          =   225
         Left            =   8760
         TabIndex        =   105
         Tag             =   "11805"
         Top             =   960
         Width           =   1275
      End
      Begin VB.Label lblVisaDateType 
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
         Left            =   3030
         TabIndex        =   104
         Tag             =   "11805"
         Top             =   1080
         Width           =   1020
      End
      Begin VB.Label lblPpIssueDate 
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
         Left            =   5640
         TabIndex        =   103
         Tag             =   "11805"
         Top             =   195
         Width           =   1290
      End
      Begin VB.Label lblDcIssueDate 
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
         Left            =   5640
         TabIndex        =   102
         Tag             =   "11805"
         Top             =   615
         Width           =   1290
      End
      Begin VB.Label lblVisaIssueDate 
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
         Height          =   270
         Left            =   5640
         TabIndex        =   101
         Tag             =   "11805"
         Top             =   1005
         Width           =   1290
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
         Left            =   8505
         TabIndex        =   100
         Tag             =   "11805"
         Top             =   2145
         Width           =   1245
      End
      Begin VB.Label lblVisaNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "VISA Number"
         BeginProperty Font 
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
         TabIndex        =   99
         Tag             =   "11805"
         Top             =   1080
         Width           =   1140
      End
   End
   Begin VB.Frame frameCustomerName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1380
      Left            =   165
      TabIndex        =   88
      Top             =   3495
      Width           =   11640
      Begin VB.TextBox txtOrgAlphaSearch 
         Height          =   285
         Left            =   1200
         MaxLength       =   6
         TabIndex        =   41
         Tag             =   "11640"
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox txtArab2ndName 
         Height          =   315
         Left            =   4440
         MaxLength       =   15
         TabIndex        =   36
         Tag             =   "11775"
         Top             =   240
         Width           =   2895
      End
      Begin VB.TextBox txtArabFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   240
         Width           =   2775
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   7920
         MaxLength       =   30
         TabIndex        =   37
         Tag             =   "11775"
         Top             =   240
         Width           =   3615
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1185
         MaxLength       =   15
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   600
         Width           =   2775
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   4440
         MaxLength       =   15
         TabIndex        =   39
         Tag             =   "11775"
         Top             =   600
         Width           =   2895
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   7905
         MaxLength       =   30
         TabIndex        =   40
         Tag             =   "11775"
         Top             =   600
         Width           =   3615
      End
      Begin VB.Label lblOrgAlphaSearch 
         BackColor       =   &H00BFD87E&
         Caption         =   "Alpha Search"
         BeginProperty Font 
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
         TabIndex        =   142
         Tag             =   "11640"
         Top             =   960
         Width           =   1695
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
         Left            =   1185
         TabIndex        =   93
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
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
         Left            =   4440
         TabIndex        =   92
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
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
         Left            =   120
         TabIndex        =   91
         Tag             =   "11775"
         Top             =   240
         Width           =   1215
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
         Left            =   120
         TabIndex        =   90
         Tag             =   "11775"
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label lblShortName 
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
         Left            =   7920
         TabIndex        =   89
         Tag             =   "11775"
         Top             =   0
         Width           =   2895
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   405
      Left            =   9240
      TabIndex        =   67
      ToolTipText     =   "Cancel"
      Top             =   8010
      Width           =   1335
   End
   Begin VB.ComboBox cmbBranchCode 
      Enabled         =   0   'False
      Height          =   315
      Left            =   4125
      TabIndex        =   0
      Top             =   540
      Width           =   1710
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1785
      Left            =   120
      TabIndex        =   69
      Top             =   4995
      Width           =   11775
      Begin VB.TextBox txtSaudiPostStreetName 
         Height          =   285
         Left            =   3840
         MaxLength       =   24
         TabIndex        =   46
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.TextBox txtSaudiPostUnit 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   49
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostZipCode 
         Height          =   285
         Left            =   5880
         MaxLength       =   5
         TabIndex        =   51
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostGPSNo 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   44
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtSaudiPostAdditionalNo 
         Height          =   285
         Left            =   7080
         MaxLength       =   4
         TabIndex        =   53
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   1230
         TabIndex        =   143
         Tag             =   "11775"
         Top             =   -120
         Width           =   2550
         Begin VB.OptionButton optSaudiPost 
            BackColor       =   &H00BFD87E&
            Caption         =   "Saudi Post"
            BeginProperty Font 
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
            Left            =   1080
            TabIndex        =   43
            Tag             =   "2550"
            ToolTipText     =   "Saudi Post"
            Top             =   180
            Width           =   1275
         End
         Begin VB.OptionButton optPoBox 
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
            Height          =   255
            Left            =   60
            TabIndex        =   42
            Tag             =   "2550"
            ToolTipText     =   "PO Box"
            Top             =   150
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   1200
         MaxLength       =   30
         TabIndex        =   45
         Tag             =   "11775"
         Top             =   360
         Width           =   2775
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   4455
         MaxLength       =   30
         TabIndex        =   47
         Tag             =   "11775"
         Top             =   360
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
         TabIndex        =   48
         Tag             =   "11775"
         Top             =   720
         Width           =   975
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   3015
         TabIndex        =   50
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   720
         Width           =   1920
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6120
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8280
         TabIndex        =   54
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   720
         Width           =   3255
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   56
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   8
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3015
         MaxLength       =   4
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6720
         MaxLength       =   4
         TabIndex        =   60
         Tag             =   "11775"
         Text            =   " "
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8640
         MaxLength       =   10
         TabIndex        =   62
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8280
         MaxLength       =   30
         TabIndex        =   66
         Tag             =   "11775"
         Top             =   1440
         Width           =   3255
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1200
         MaxLength       =   4
         TabIndex        =   55
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtMobileAreaCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1200
         MaxLength       =   2
         TabIndex        =   1
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   1440
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8280
         MaxLength       =   4
         TabIndex        =   61
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4920
         MaxLength       =   4
         TabIndex        =   58
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   10
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label lblSaudiPostAdditionalNo 
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
         Left            =   6840
         TabIndex        =   149
         Tag             =   "11655"
         Top             =   720
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.Label lblSaudiPostStreetName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Street Name"
         BeginProperty Font 
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
         Left            =   2280
         TabIndex        =   148
         Tag             =   "11655"
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label lblSaudiPostGPSNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "GPS Number"
         BeginProperty Font 
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
         TabIndex        =   147
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.Label lblSaudiPostUnit 
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
         TabIndex        =   146
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.Label lblSaudiPostZipCode 
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
         Left            =   5040
         TabIndex        =   145
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.Label lblAddrType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Address Type"
         BeginProperty Font 
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
         Tag             =   "11775"
         Top             =   0
         Width           =   1335
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
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   360
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
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   720
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
         Left            =   2280
         TabIndex        =   78
         Tag             =   "11775"
         Top             =   720
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
         TabIndex        =   77
         Tag             =   "11775"
         Top             =   750
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
         Left            =   7560
         TabIndex        =   76
         Tag             =   "11775"
         Top             =   720
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
         TabIndex        =   75
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
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
         TabIndex        =   74
         Tag             =   "11775"
         Top             =   1080
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
         TabIndex        =   73
         Tag             =   "11775"
         Top             =   1440
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
         TabIndex        =   72
         Tag             =   "11775"
         Top             =   1080
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
         Left            =   7080
         TabIndex        =   71
         Tag             =   "11775"
         Top             =   1440
         Width           =   1140
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
         TabIndex        =   70
         Tag             =   "11775"
         Top             =   1440
         Width           =   495
      End
   End
   Begin VB.ComboBox cmbAltBrCode 
      Height          =   315
      Left            =   7830
      TabIndex        =   2
      Top             =   540
      Width           =   1815
   End
   Begin VB.TextBox txtCustomerNo 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   285
      Left            =   1950
      MaxLength       =   7
      TabIndex        =   68
      Top             =   555
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
      TabIndex        =   16
      Top             =   495
      Width           =   1335
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
      Left            =   240
      TabIndex        =   117
      Top             =   8130
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Line Line4 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   12000
      Y1              =   3450
      Y2              =   3450
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   12000
      Y1              =   4890
      Y2              =   4890
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Resident Juristic"
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
      Left            =   8160
      TabIndex        =   114
      Top             =   120
      Width           =   3645
   End
   Begin VB.Label lblMainCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Resident Juristic"
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
      Left            =   5280
      TabIndex        =   87
      Top             =   120
      Width           =   2805
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   4440
      TabIndex        =   86
      Tag             =   "Ca"
      Top             =   120
      Width           =   780
   End
   Begin VB.Label lblJuristicDiplomatsDetails 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Resident Juristic Customer Details"
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
      Left            =   240
      TabIndex        =   85
      Top             =   120
      Width           =   4155
   End
   Begin VB.Shape Shape2 
      Height          =   375
      Left            =   135
      Top             =   75
      Width           =   11790
   End
   Begin VB.Shape Shape1 
      Height          =   555
      Left            =   135
      Top             =   7920
      Width           =   11580
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
      TabIndex        =   84
      Top             =   555
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
      Left            =   165
      TabIndex        =   83
      Top             =   555
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
      TabIndex        =   82
      Top             =   555
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
      TabIndex        =   81
      Top             =   660
      Width           =   495
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   150
      X2              =   11670
      Y1              =   915
      Y2              =   915
   End
End
Attribute VB_Name = "frmJuristicDiplomats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmbAltBrCode_LostFocus()
   Dim i As Integer
   Dim tCode As String
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
        If Screen.ActiveControl.Name = "cmdCancel" Then
           DoEvents
        Else
           On Error Resume Next
           If Len(RTrim(cmbAltBrCode.text)) <> 0 Then
              tCode = Mid$(cmbAltBrCode.text, 1, 4)
              For i = 0 To cmbAltBrCode.ListCount
                  If Mid$(cmbAltBrCode.List(i), 1, 4) = tCode Then
                     cmbAltBrCode.ListIndex = i
                     Exit For
                  End If
              Next i
           Else
              MsgBox errSpaceBranchCode(UserLang)   '"Branch Code Cannot be spaces.. Please enter.."
              cmbAltBrCode.SetFocus
              Exit Sub
           End If
             
           If i > cmbAltBrCode.ListCount Then
              MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
              cmbAltBrCode.SetFocus
           End If
        End If
        On Error GoTo 0
   End If

End Sub

Private Sub cmbAppExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbAppExpiryDate.text)) <> 0 Then
         If Len(cmbAppExpiryDate) = 2 Then
            If cmbAppExpiryDate < 1 Or _
               cmbAppExpiryDate > IIf(optAppDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbAppExpiryDate.text = ""
               cmbAppExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbAppExpiryMonth.SetFocus
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

Private Sub cmbBranchcode_LostFocus()
   Dim i As Integer
   Dim tCode As String
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
        If Screen.ActiveControl.Name = "cmdCancel" Then
           DoEvents
        Else
           On Error Resume Next
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
        On Error GoTo 0
   End If

End Sub

Private Sub cmbBusinessType_LostFocus()
Dim i As Integer
Dim tCode As String

  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
        On Error Resume Next
        If Len(RTrim(cmbBusinessType.text)) <> 0 Then
           tCode = Mid$(cmbBusinessType.text, 1, 3)
           For i = 0 To cmbBusinessType.ListCount
               If Mid$(cmbBusinessType.List(i), 1, 3) = tCode Then
                  cmbBusinessType.ListIndex = i
                  Exit For
               End If
            Next i
         Else
            MsgBox errSpaceBusType(UserLang)
            cmbBusinessType.SetFocus
            Exit Sub
         End If
         If i > cmbBusinessType.ListCount Then
            MsgBox errInvalidBusinessType(UserLang)
            cmbBusinessType.SetFocus
         End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub cmbCountry_LostFocus()
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbCountry.text)) <> 0 Then
         tCode = Mid$(cmbCountry.text, 1, 3)
         For i = 0 To cmbCountry.ListCount
             If Mid$(cmbCountry.List(i), 1, 3) = tCode Then
                cmbCountry.ListIndex = i  ' RTrim(frmCustomer.cmbNationality.List(i))
                Exit For
             End If
         Next i
      End If
      If i > cmbCountry.ListCount Then
         MsgBox errInvalidCountry(UserLang)
         cmbCountry.SetFocus
      End If
   End If
   On Error GoTo 0
End If

End Sub

Private Sub cmbNationality_LostFocus()
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbNationality.text)) <> 0 Then
         tCode = Mid$(cmbNationality.text, 1, 3)
         For i = 0 To cmbNationality.ListCount
             If Mid$(cmbNationality.List(i), 1, 3) = tCode Then
                cmbNationality.ListIndex = i  ' RTrim(frmCustomer.cmbNationality.List(i))
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceNationality(UserLang)
         cmbNationality.SetFocus
         Exit Sub
      End If
    
      If i > cmbNationality.ListCount Then
         MsgBox errIncorrectNationality(UserLang)
         cmbNationality.SetFocus
      End If
    End If
    On Error GoTo 0
End If

End Sub

Private Sub cmbppExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbPPExpiryDate.text)) <> 0 Then
         If Len(cmbPPExpiryDate) = 2 Then
            If cmbPPExpiryDate < 1 Or _
               cmbPPExpiryDate > IIf(optPPDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbPPExpiryDate.text = ""
               cmbPPExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbPPExpiryMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbppExpiryDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbppExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbPPExpiryMonth.text)) <> 0 Then
         If Len(cmbPPExpiryMonth.text) = 2 Then
            If cmbPPExpiryMonth < 1 Or cmbPPExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbPPExpiryMonth.text = ""
               cmbPPExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtPPExpiryYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbppExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbppIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbPPIssueDate.text)) <> 0 Then
         If Len(cmbPPIssueDate.text) = 2 Then
            If cmbPPIssueDate < 1 Or _
               cmbPPIssueDate > IIf(optPPDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbPPIssueDate.text = ""
               cmbPPIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbPPIssueMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbppIssuedate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbppIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbPPIssueMonth.text)) <> 0 Then
         If Len(cmbPPIssueMonth.text) = 2 Then
            If cmbPPIssueMonth < 1 Or cmbPPIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbPPIssueMonth.text = ""
               cmbPPIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtPPIssueYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbppIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
'-----passport checking over

Private Sub cmbdcExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbDCExpiryDate.text)) <> 0 Then
         If Len(cmbDCExpiryDate) = 2 Then
            If cmbDCExpiryDate < 1 Or _
               cmbDCExpiryDate > IIf(optDCDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbDCExpiryDate.text = ""
               cmbDCExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbDCExpiryMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbdcExpiryDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbdcExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbDCExpiryMonth.text)) <> 0 Then
         If Len(cmbDCExpiryMonth.text) = 2 Then
            If cmbDCExpiryMonth < 1 Or cmbDCExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbDCExpiryMonth.text = ""
               cmbDCExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtDCExpiryYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbdcExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbdcIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbDCIssueDate.text)) <> 0 Then
         If Len(cmbDCIssueDate.text) = 2 Then
            If cmbDCIssueDate < 1 Or _
               cmbDCIssueDate > IIf(optDCDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbDCIssueDate.text = ""
               cmbDCIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbDCIssueMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbdcIssuedate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbdcIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbDCIssueMonth.text)) <> 0 Then
         If Len(cmbDCIssueMonth.text) = 2 Then
            If cmbDCIssueMonth < 1 Or cmbDCIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbDCIssueMonth.text = ""
               cmbDCIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtDCIssueYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbdcIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
' dc checking over
Private Sub cmbvisaExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbVisaExpiryDate.text)) <> 0 Then
         If Len(cmbVisaExpiryDate) = 2 Then
            If cmbVisaExpiryDate < 1 Or _
               cmbVisaExpiryDate > IIf(optVisaDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbVisaExpiryDate.text = ""
               cmbVisaExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbVisaExpiryMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbvisaExpiryDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbvisaExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbVisaExpiryMonth.text)) <> 0 Then
         If Len(cmbVisaExpiryMonth.text) = 2 Then
            If cmbVisaExpiryMonth < 1 Or cmbVisaExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbVisaExpiryMonth.text = ""
               cmbVisaExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtVisaExpiryYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbvisaExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbVisaIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbVisaIssueDate.text)) <> 0 Then
         If Len(cmbVisaIssueDate.text) = 2 Then
            If cmbVisaIssueDate < 1 Or _
               cmbVisaIssueDate > IIf(optVisaDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbVisaIssueDate.text = ""
               cmbVisaIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbVisaIssueMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbvisaIssuedate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbvisaIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbVisaIssueMonth.text)) <> 0 Then
         If Len(cmbVisaIssueMonth.text) = 2 Then
            If cmbVisaIssueMonth < 1 Or cmbVisaIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbVisaIssueMonth.text = ""
               cmbVisaIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtVisaIssueYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbvisaIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmdAcctInfo_Click()
    Dim retStr As String
    
    If InStr(recvLoginMsg.authorityLevel, "~6") > 0 Then
       If Len(RTrim(txtCustomerNo)) = 0 Then
          MsgBox errInvalidSearchCriteria(UserLang)
          Exit Sub
       End If
       retStr = doAccSearch1("00000", txtCustomerNo)
       If retStr <> "-0001" Then
           accSearchAction = True
           accUpdateAction = False
           accTellerAction = False
           accSupervisorAction = False
           If UserLang = ARABIC Then
              ChangePositions frmAccountGrid, 11800
              frmAccountGrid.RightToLeft = True
           End If
           frmAccountGrid.Show
        End If
    Else
        MsgBox errNotAuthorised(UserLang)
    End If

End Sub

Private Sub cmdCancel_Click()
    Unload Me
    Unload frmJuristicSignatory
    Unload frmJuristicOwner
    Unload frmCustUpdateHistory
    If supervisorAction Or tellerAction Then
       Unload frmSupervisorApproval
    End If
End Sub

Private Sub cmdNextPage_Click()
  Dim newOrUpdate As String, tCustNo As String
  Dim tIdType As String, tIdNo As String
  Dim custName As String
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If validateFrmJuristicDiplomats = 1 Then
        Exit Sub
     End If
     If updateAction Or (tellerAction And recvJuristicMsg.newOrUpdate = "U") Then
        newOrUpdate = "U"
        tCustNo = Format(txtCustomerNo, "!@@@@@@@")
     Else
        newOrUpdate = "N"
        tCustNo = Space(7)
     End If
     tIdType = Space(1)
     tIdNo = Space(15)
     If Len(RTrim(frmJuristicDiplomats.txtPPNo)) > 0 Then
        tIdType = "P"
        tIdNo = Format(frmJuristicDiplomats.txtPPNo, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmJuristicDiplomats.txtDiplomaticCardNo)) > 0 Then
        tIdType = "D"
        tIdNo = Format(frmJuristicDiplomats.txtDiplomaticCardNo, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmJuristicDiplomats.txtVisaNo)) > 0 Then
        tIdType = "V"
        tIdNo = Format(frmJuristicDiplomats.txtVisaNo, "!@@@@@@@@@@@@@@@")
     End If
     
     If optLangArabic = True Then
        custName = txtArabFirstName & " " & txtArabic2ndName
     Else
        custName = txtEngFirstName & " " & txtEnglish2ndName
     End If
     
     cmdNextPage.Enabled = False
     If checkCustomerExistance(frmJuristicDiplomats, tIdType, tIdNo, newOrUpdate, tCustNo, custName) = 1 Then
        cmdNextPage.Enabled = True
        Exit Sub
     End If
     cmdNextPage.Enabled = True

  End If
 
   frmJuristicAccountInfo.Show

End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox recvJuristicMsg.supervisorComments
End Sub

Private Sub cmVisaIssueMonth_Change()

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mainBrCode As String, mainBrArbName As String, mainBrEngName As String
    Dim mQry As String, i As Integer, num, tListIndex
    
    If UserLang = ARABIC Then
       ChangePositions frmJuristicDiplomats, 11800
       frmJuristicDiplomats.RightToLeft = True
       frameOpenUpdateDetails.RightToLeft = True
    End If

   lblMainCategoryDesc = mainCategoryDesc
   lblSubCategoryDesc = subCategoryDesc
      
   frmJuristicDiplomats.Caption = frmJuristicDiplomatsCaption(0, UserLang)
   lblJuristicDiplomatsDetails.Caption = frmJuristicDiplomatsCaption(0, UserLang)
   lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
   lblCustNo.Caption = frmIndividualOthers1Caption(4, UserLang)
   lblBranch.Caption = frmIndividualOthers1Caption(5, UserLang)
   lblAltBranchCode.Caption = frmIndividualOthers1Caption(60, UserLang)
   lblSysDate.Caption = frmIndividualOthers1Caption(6, UserLang)
   lblPpNo.Caption = frmJuristicDiplomatsCaption(1, UserLang)
   lblPpDateType.Caption = frmJuristicDiplomatsCaption(2, UserLang)
   optPPDateHijri.Caption = frmJuristicDiplomatsCaption(3, UserLang)
   optPPDateGreg.Caption = frmJuristicDiplomatsCaption(4, UserLang)
   lblPpIssueDate.Caption = frmJuristicDiplomatsCaption(5, UserLang)
   lblPpExpiryDate.Caption = frmJuristicDiplomatsCaption(6, UserLang)
   lblDcNo.Caption = frmJuristicDiplomatsCaption(7, UserLang)
   lblDcDateType.Caption = frmJuristicDiplomatsCaption(2, UserLang)
   optDCDateHijri.Caption = frmJuristicDiplomatsCaption(3, UserLang)
   optDCDateGreg.Caption = frmJuristicDiplomatsCaption(4, UserLang)
   lblDcIssueDate.Caption = frmJuristicDiplomatsCaption(5, UserLang)
   lblDcExpiryDate.Caption = frmJuristicDiplomatsCaption(6, UserLang)
   lblVisaNo.Caption = frmJuristicDiplomatsCaption(8, UserLang)
   lblVisaDateType.Caption = frmJuristicDiplomatsCaption(2, UserLang)
   optVisaDateHijri.Caption = frmJuristicDiplomatsCaption(3, UserLang)
   optVisaDateGreg.Caption = frmJuristicDiplomatsCaption(4, UserLang)
   lblVisaIssueDate.Caption = frmJuristicDiplomatsCaption(5, UserLang)
   lblVisaExpiryDate.Caption = frmJuristicDiplomatsCaption(6, UserLang)
   lblLangPreferred.Caption = frmJuristicDiplomatsCaption(9, UserLang)
   optLangArabic.Caption = frmJuristicDiplomatsCaption(10, UserLang)
   optLangEnglish.Caption = frmJuristicDiplomatsCaption(11, UserLang)
   lblNationality.Caption = frmJuristicDiplomatsCaption(12, UserLang)
   lblBusinessType.Caption = frmJuristicDiplomatsCaption(13, UserLang)
   lblFirstName.Caption = frmJuristicDiplomatsCaption(14, UserLang)
   lbl2ndName.Caption = frmJuristicDiplomatsCaption(15, UserLang)
   lblShortName.Caption = frmJuristicDiplomatsCaption(16, UserLang)
   lblArabicName.Caption = frmJuristicDiplomatsCaption(17, UserLang)
   lblEnglishName.Caption = frmJuristicDiplomatsCaption(18, UserLang)
   lblOrgAlphaSearch.Caption = frmJuristicDiplomatsCaption(34, UserLang)
   lblAddress1.Caption = frmJuristicDiplomatsCaption(19, UserLang)
   lblPOBox.Caption = frmJuristicDiplomatsCaption(20, UserLang)
   lblCity.Caption = frmJuristicDiplomatsCaption(21, UserLang)
   lblZipCode.Caption = frmJuristicDiplomatsCaption(22, UserLang)
   lblCountry.Caption = frmJuristicDiplomatsCaption(23, UserLang)
   lblOffPhone.Caption = frmJuristicDiplomatsCaption(24, UserLang)
   lblResPhone.Caption = frmJuristicDiplomatsCaption(25, UserLang)
   lblFax.Caption = frmJuristicDiplomatsCaption(26, UserLang)
   lblMobile.Caption = frmJuristicDiplomatsCaption(27, UserLang)
   lblPager.Caption = frmJuristicDiplomatsCaption(28, UserLang)
   lblEmail.Caption = frmJuristicDiplomatsCaption(29, UserLang)
   cmdAcctInfo.Caption = frmJuristicDiplomatsCaption(30, UserLang)
   cmdSupervisorComments.Caption = frmJuristicDiplomatsCaption(31, UserLang)
   cmdNextPage.Caption = frmJuristicDiplomatsCaption(32, UserLang)
   cmdCancel.Caption = frmJuristicDiplomatsCaption(33, UserLang)
   
   lblApproverNumber.Caption = frmJuristicDiplomatsCaption(35, UserLang)
   lblApproverName.Caption = frmJuristicDiplomatsCaption(36, UserLang)
   lblAppDateType.Caption = frmJuristicDiplomatsCaption(2, UserLang)
   optAppDateHijri.Caption = frmJuristicDiplomatsCaption(3, UserLang)
   optAppDateGreg.Caption = frmJuristicDiplomatsCaption(4, UserLang)
   lblAppIssueDate.Caption = frmJuristicDiplomatsCaption(5, UserLang)
   lblAppExpiryDate.Caption = frmJuristicDiplomatsCaption(6, UserLang)
  
   frameOpenUpdateDetails.Caption = openUpdateDetailsCaption(0, UserLang)
   lblOpeningDetails.Caption = openUpdateDetailsCaption(1, UserLang)
   lblOpeningDate.Caption = openUpdateDetailsCaption(2, UserLang)
   lblOpenBranch.Caption = openUpdateDetailsCaption(3, UserLang)
   lblOpenMakerId.Caption = openUpdateDetailsCaption(4, UserLang)
   lblOpenSupervisorId.Caption = openUpdateDetailsCaption(5, UserLang)
   lblUpdateDetails.Caption = openUpdateDetailsCaption(6, UserLang)
   lblUpdateDate.Caption = openUpdateDetailsCaption(7, UserLang)
   lblUpdateBranch.Caption = openUpdateDetailsCaption(3, UserLang)
   lblUpdateMakerId.Caption = openUpdateDetailsCaption(4, UserLang)
   lblUpdateSupervisorId.Caption = openUpdateDetailsCaption(5, UserLang)
   
   lblAddrType.Caption = saudiPostAddressCaption(0, UserLang)
   optPoBox.Caption = saudiPostAddressCaption(1, UserLang)
   optSaudiPost.Caption = saudiPostAddressCaption(2, UserLang)
   lblSaudiPostGPSNo.Caption = saudiPostAddressCaption(3, UserLang)
   lblSaudiPostStreetName.Caption = saudiPostAddressCaption(4, UserLang)
   lblSaudiPostUnit.Caption = saudiPostAddressCaption(5, UserLang)
   lblSaudiPostZipCode.Caption = saudiPostAddressCaption(6, UserLang)
   
   
   
   txtSysDate.text = Date
    
   gDateTime = Space(14)   'Date Time to be used for global
       
    'On Error GoTo err_handler
    mQry = "select branchcode,arabicname,englishname, mainbrcode from branchinfo where realorpseudo  = '1'"
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       cmbAltBrCode.Clear
       cmbBranchCode.Clear
       cmbAltBrCode.AddItem "0000-NONE"
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
             cmbAltBrCode.AddItem rs(0) & "-" & rs(2)
             cmbBranchCode.AddItem rs(0) & "-" & rs(2)
           Else
             cmbAltBrCode.AddItem rs(0) & "-" & rs(1)
             cmbBranchCode.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
       cmbAltBrCode.text = "0000-NONE"
    End If
    
    mQry = "select branchcode,arabicname,englishname from branchinfo"
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       cmbBranchCode.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbBranchCode.AddItem rs(0) & "-" & rs(2)
           Else
              cmbBranchCode.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If
    
    For i = 0 To cmbBranchCode.ListCount
        If Mid(cmbBranchCode.List(i), 1, 4) = gBranchCode Then
           cmbBranchCode.ListIndex = i
           Exit For
         End If
    Next i
   
    If i > cmbBranchCode.ListCount Then
       cmbBranchCode.text = gBranchCode & "-" & "Not defined in local"
    End If

    
    mQry = "select mainbrcode from branchinfo where branchcode = '" & gBranchCode & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       tCode = Mid$(cmbAltBrCode, 1, 4)
       If realOrPseudo = "0" Or realOrPseudo = "2" Then  ' if the local branch is pseudo branch, then default the
                                                         ' alt.br code to the corresponding mainbranch code ,
                                                         ' otherwise 0000
          mainBrCode = rs(0)
       Else
          mainBrCode = "0000"
       End If
    Else
       mainBrCode = "0000"
    End If
      
    For i = 0 To cmbAltBrCode.ListCount
        If Mid(cmbAltBrCode.List(i), 1, 4) = mainBrCode Then
           cmbAltBrCode.ListIndex = i
           Exit For
         End If
    Next i
   
    If i > cmbAltBrCode.ListCount Then
       cmbAltBrCode.text = "0000-NONE"
    End If
    
    mQry = "select * from cityinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbCity.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbCity.AddItem rs("englishname")
           Else
              cmbCity.AddItem rs("arabicname")
           End If
           rs.MoveNext
        Loop
    End If
    
    Set rs = db.OpenRecordset("select citycode from branchinfo " & _
               " where branchcode = '" & gBranchCode & "'")
    If rs.recordCount > 0 Then
         tCode = rs(0)
         Set rs = db.OpenRecordset("select englishname,arabicname,telareacode from cityinfo " + _
                       " where citycode = '" & tCode & "'")
         If rs.recordCount > 0 Then
             txtOffPhoneCityCode = rs(2)
             txtResPhoneCityCode = rs(2)
             txtFaxCityCode = rs(2)
             If UserLang = ENGLISH Then
                cmbCity.text = rs(0)
             Else
                cmbCity.text = rs(1)
             End If
         Else
            txtOffPhoneCityCode = "01"
            txtResPhoneCityCode = "01"
            txtFaxCityCode = "01"
            cmbCity.text = ""
         End If
    End If
    
    Set rs = db.OpenRecordset("select * from businesstypeinfo")
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbBusinessType.Clear
        Do While Not rs.EOF
           If UserLang = ARABIC Then
              cmbBusinessType.AddItem rs("businesstypecode") & "-" & rs("arabicname")
           Else
              cmbBusinessType.AddItem rs("businesstypecode") & "-" & rs("englishname")
           End If
           rs.MoveNext
        Loop
        cmbBusinessType.ListIndex = -1 ' defaulted to spaces... refer..Andrew's mail dt.06/08/2001
    End If
    
    Set rs = db.OpenRecordset("select * from countryinfo")
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbCountry.Clear
        cmbNationality.Clear
        Do While Not rs.EOF
           If UserLang = ARABIC Then
              cmbCountry.AddItem rs("countrycode") & " - " & rs("arabicname")
              cmbNationality.AddItem rs("countrycode") & " - " & rs("arabicname")
            Else
              cmbCountry.AddItem rs("countrycode") & " - " & rs("englishname")
              cmbNationality.AddItem rs("countrycode") & " - " & rs("englishname")
            End If
           rs.MoveNext
        Loop
        cmbCountry.ListIndex = 0
        cmbNationality.ListIndex = 0
    End If
    
    cmbPPIssueDate.Clear
    cmbPPIssueMonth.Clear
    cmbPPExpiryDate.Clear
    cmbPPExpiryMonth.Clear
    cmbDCIssueDate.Clear
    cmbDCIssueMonth.Clear
    cmbDCExpiryDate.Clear
    cmbDCExpiryMonth.Clear
    cmbVisaIssueDate.Clear
    cmbVisaIssueMonth.Clear
    cmbVisaExpiryDate.Clear
    cmbVisaExpiryMonth.Clear
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
       cmbPPIssueDate.AddItem num
       cmbDCIssueDate.AddItem num
       cmbVisaIssueDate.AddItem num
       cmbPPExpiryDate.AddItem num
       cmbDCExpiryDate.AddItem num
       cmbVisaExpiryDate.AddItem num
       cmbAppIssueDate.AddItem num
       cmbAppExpiryDate.AddItem num
       
       If i < 13 Then
          cmbPPIssueMonth.AddItem num
          cmbDCIssueMonth.AddItem num
          cmbVisaIssueMonth.AddItem num
          cmbPPExpiryMonth.AddItem num
          cmbDCExpiryMonth.AddItem num
          cmbVisaExpiryMonth.AddItem num
          cmbAppIssueMonth.AddItem num
          cmbAppExpiryMonth.AddItem num
       End If
    Next
   
    txtCustomerNo = Space(7)
    If supervisorAction Or tellerAction Or custHistoryAction Then
       If Len(RTrim(recvJuristicMsg.supervisorComments)) > 0 Then
          cmdSupervisorComments.Enabled = True
       Else
         cmdSupervisorComments.Enabled = False
       End If
    Else
       cmdSupervisorComments.Enabled = False
    End If
    
   If supervisorAction Or searchAction Or custHistoryAction Then
      cmbAltBrCode.Enabled = False
      cmbBranchCode.Enabled = False
      frameCustomerName.Enabled = False
      frameIdInfo.Enabled = False
      frameLang.Enabled = False
      cmbNationality.Enabled = False
      cmbBusinessType.Enabled = False
      frameCustomerContactInfo.Enabled = False
      If custHistoryAction Then
         lblHistory.Visible = True
         lblHistory.Refresh
      Else
         lblHistory.Visible = False
      End If
   Else
      frameCustomerName.Enabled = True
      frameIdInfo.Enabled = True
      frameLang.Enabled = True
      cmbNationality.Enabled = True
 
      If Not (updateAction Or (tellerAction And recvJuristicMsg.newOrUpdate = "U")) Then
         If recvLoginMsg.globalUpdatePriv = "1" Or recvLoginMsg.mainBrEditAllowed = "1" Then
            cmbBranchCode.Enabled = True
         Else
            cmbBranchCode.Enabled = False
         End If

         cmdAcctInfo.Enabled = False
      End If
      
      If updateAction Or (tellerAction And recvJuristicMsg.newOrUpdate = "U") Then
         If recvLoginMsg.custNameUpdAllowed = "1" Then
            frameCustomerName.Enabled = True
            frameLang.Enabled = True
         Else
            frameCustomerName.Enabled = False
            frameLang.Enabled = False
         End If
         If recvLoginMsg.mainBrEditAllowed = "1" And recvJuristicMsg.mainBrCodeUpdAllowed = "1" Then
            cmbBranchCode.Enabled = True
         Else
            cmbBranchCode.Enabled = False
         End If
      End If
      cmbBusinessType.Enabled = True
      frameCustomerContactInfo.Enabled = True
   End If
   
   If supervisorAction Or tellerAction Or updateAction Then
      cmdAcctInfo.Enabled = False
   End If
   Exit Sub
err_handler:
    If Err.Number = 3061 Or Err.Number = 91 Then
       MsgBox "Error  " & Err.Number & " " & Err.Description & " occured; may be new controldb file is not copied;"
       End
    End If
    MsgBox "Error  " & Err.Number & " " & Err.Description & " occured "
    End
End Sub

Public Function validateFrmJuristicDiplomats() As Integer
    
    Dim tIssueDate As String, tExpiryDate As String
    Dim mQry As String, tCode As String
    Dim tmpCode As String
    
    validateFrmJuristicDiplomats = 0
    
    If Len(RTrim(Mid$(cmbBranchCode, 1, 4))) = 0 Then
       MsgBox errSpaceBranchCode(UserLang)
       validateFrmJuristicDiplomats = 1
       Exit Function
    Else
       validateFrmJuristicDiplomats = 0
    End If
    
    mQry = "select realorpseudo from branchinfo where branchcode = '" & Mid$(cmbBranchCode, 1, 4) & "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       tmpCode = rs(0)
    Else
       tmpCode = "1" 'if error occured in executing the query, then move as real branch
    End If
                
    tCode = Mid$(cmbAltBrCode, 1, 4)
    If tmpCode = "0" Or tmpCode = "2" Then
       If tCode = "0000" Then
          MsgBox errInvalidAltBrCode(UserLang)
          cmbAltBrCode.SetFocus
          validateFrmJuristicDiplomats = 1
          Exit Function
       Else
          validateFrmJuristicDiplomats = 0
       End If
    End If
             
    For i = 0 To cmbAltBrCode.ListCount
        If Mid$(cmbAltBrCode.List(i), 1, 4) = tCode Then
           cmbAltBrCode.ListIndex = i
           Exit For
        End If
    Next i
    If i > cmbAltBrCode.ListCount Then
       MsgBox errInvalidAltBrCode(UserLang) '"Alternative Branch Code should be a real branch...Please re-enter.."
       cmbAltBrCode.SetFocus
       validateFrmJuristicDiplomats = 1
       Exit Function
    Else
       validateFrmJuristicDiplomats = 0
    End If
   
    If Len(RTrim(txtPPNo)) <> 0 Then  ' passport number is entered...
       If Len(RTrim(cmbPPIssueDate.text)) = 0 Or _
          Len(RTrim(cmbPPIssueMonth.text)) = 0 Or _
          Len(RTrim(txtPPIssueYear.text)) = 0 Then
          MsgBox errSpaceIssueDate(UserLang)
          cmbPPIssueDate.SetFocus
          validateFrmJuristicDiplomats = 1
          Exit Function
       Else
           validateFrmJuristicDiplomats = 0
       End If
       If Len(RTrim(cmbPPExpiryDate.text)) = 0 Or _
          Len(RTrim(cmbPPExpiryMonth.text)) = 0 Or _
          Len(RTrim(txtPPExpiryYear)) = 0 Then
          MsgBox errSpaceExpiryDate(UserLang)
          cmbPPExpiryDate.SetFocus
          validateFrmJuristicDiplomats = 1
          Exit Function
       Else
          validateFrmJuristicDiplomats = 0
       End If
    
       tIssueDate = CStr(txtPPIssueYear) + _
                    CStr(cmbPPIssueMonth.text) + _
                    CStr(cmbPPIssueDate.text)
            
       tExpiryDate = CStr(txtPPExpiryYear) + _
                     CStr(cmbPPExpiryMonth.text) + _
                     CStr(cmbPPExpiryDate.text)
                              
        If optPPDateGreg.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              cmbPPIssueDate.SetFocus
              validateFrmJuristicDiplomats = 1
              Exit Function
           Else
              validateFrmJuristicDiplomats = 0
           End If
                   
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              cmbPPExpiryDate.SetFocus
              validateFrmJuristicDiplomats = 1
              Exit Function
           Else
              validateFrmJuristicDiplomats = 0
           End If
        End If
                              
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           txtPPExpiryYear.SetFocus
           validateFrmJuristicDiplomats = 1
           Exit Function
        Else
           validateFrmJuristicDiplomats = 0
        End If
        
        If optPPDateHijri = True Then
           If tExpiryDate < currentHijriDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtPPExpiryYear.SetFocus
              validateFrmJuristicDiplomats = 1
              Exit Function
           Else
              validateFrmJuristicDiplomats = 0
           End If
        Else
           If tExpiryDate < currentGregDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtPPExpiryYear.SetFocus
              validateFrmJuristicDiplomats = 1
              Exit Function
           Else
              validateFrmJuristicDiplomats = 0
           End If
        End If
     End If  ' len(passportno) <> 0
     
     If Len(RTrim(txtPPNo)) = 0 Then
        If Len(RTrim(txtDiplomaticCardNo)) = 0 Then
           MsgBox errSpaceDC(UserLang) ' "DC Number cannot be spaces...Please enter..."
           txtDiplomaticCardNo.SetFocus
           validateFrmJuristicDiplomats = 1
           Exit Function
        Else
           validateFrmJuristicDiplomats = 0
        End If
        
        If Len(RTrim(cmbDCIssueDate.text)) = 0 Or _
           Len(RTrim(cmbDCIssueMonth.text)) = 0 Or _
           Len(RTrim(txtDCIssueYear.text)) = 0 Then
           MsgBox errSpaceIssueDate(UserLang)
           cmbDCIssueDate.SetFocus
           validateFrmJuristicDiplomats = 1
           Exit Function
        Else
           validateFrmJuristicDiplomats = 0
        End If
        If Len(RTrim(cmbDCExpiryDate.text)) = 0 Or _
           Len(RTrim(cmbDCExpiryMonth.text)) = 0 Or _
           Len(RTrim(txtDCExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           cmbDCExpiryDate.SetFocus
           validateFrmJuristicDiplomats = 1
           Exit Function
        Else
           validateFrmJuristicDiplomats = 0
        End If
    
       tIssueDate = CStr(txtDCIssueYear) + _
                    CStr(cmbDCIssueMonth.text) + _
                    CStr(cmbDCIssueDate.text)
            
       tExpiryDate = CStr(txtDCExpiryYear) + _
                     CStr(cmbDCExpiryMonth.text) + _
                     CStr(cmbDCExpiryDate.text)
                              
        If optDCDateGreg.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              cmbDCIssueDate.SetFocus
              validateFrmJuristicDiplomats = 1
              Exit Function
           Else
              validateFrmJuristicDiplomats = 0
           End If
                   
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              cmbDCExpiryDate.SetFocus
              validateFrmJuristicDiplomats = 1
              Exit Function
           Else
              validateFrmJuristicDiplomats = 0
           End If
        End If
                              
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           txtDCExpiryYear.SetFocus
           validateFrmJuristicDiplomats = 1
           Exit Function
        Else
           validateFrmJuristicDiplomats = 0
        End If
        
        If optDCDateHijri = True Then
           If tExpiryDate < currentHijriDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtDCExpiryYear.SetFocus
              validateFrmJuristicDiplomats = 1
              Exit Function
           Else
              validateFrmJuristicDiplomats = 0
           End If
        Else
           If tExpiryDate < currentGregDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtDCExpiryYear.SetFocus
              validateFrmJuristicDiplomats = 1
              Exit Function
           Else
              validateFrmJuristicDiplomats = 0
           End If
        End If
        
    End If ' len(passportno) = 0
    
    If Len(RTrim(txtApproverNo)) > 0 Then
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
                validateFrmJuristicDiplomats = 1
                Exit Function
             Else
                validateFrmJuristicDiplomats = 0
             End If
         End If
          
         If Len(RTrim(tExpiryDate)) <> 0 Then
            If Not validDate(tExpiryDate) Then
               MsgBox errInvalidDate(UserLang)
               cmbAppExpiryDate.SetFocus
               validateFrmJuristicDiplomats = 1
               Exit Function
            Else
               validateFrmJuristicDiplomats = 0
            End If
         End If
      End If
                              
      If Len(RTrim(tExpiryDate)) <> 0 Then
         If tExpiryDate < tIssueDate Then
            MsgBox errGreaterExpiryYear(UserLang)
            txtAppExpiryYear.SetFocus
            validateFrmJuristicDiplomats = 1
            Exit Function
         Else
            validateFrmJuristicDiplomats = 0
         End If
             
         If optAppDateHijri = True Then
            If tExpiryDate < currentHijriDate Then
               MsgBox errExpiryDateLessThanToday(UserLang)
               txtAppExpiryYear.SetFocus
               validateFrmJuristicDiplomats = 1
               Exit Function
            Else
               validateFrmJuristicDiplomats = 0
            End If
         Else
            If tExpiryDate < currentGregDate Then
               MsgBox errExpiryDateLessThanToday(UserLang)
               txtAppExpiryYear.SetFocus
               validateFrmJuristicDiplomats = 1
               Exit Function
            Else
               validateFrmJuristicDiplomats = 0
            End If
        End If
     End If
  End If 'if len(txtapproverno) > 0

    If (updateAction Or (tellerAction And recvJuristicMsg.newOrUpdate = "U")) And _
        recvLoginMsg.custNameUpdAllowed <> "1" Then
        ' this empty condition is required to ignore customer name validation
        ' during update & branch is not allowed to update the customer name
    Else
       If optLangArabic.Value = True Then
          If Len(RTrim(txtArabFirstName)) = 0 And _
             Len(RTrim(txtArab2ndName)) = 0 Then
             MsgBox errSpaceNames(UserLang)
             txtArabFirstName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
           
          If Len(RTrim(txtArabShortName)) = 0 Then
             MsgBox errSpaceShortName(UserLang)
             txtArabShortName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
       Else
          If Len(RTrim(txtEngFirstName)) = 0 And _
             Len(RTrim(txtEnglish2ndName)) = 0 Then
             MsgBox errSpaceNames(UserLang)
             txtEngShortName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
           
          If Len(RTrim(txtEngShortName)) = 0 Then
             MsgBox errSpaceShortName(UserLang)
             txtEngShortName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
       End If
       
       If Len(RTrim(txtArabFirstName)) > 0 Then
          If englishCharFound(txtArabFirstName) = True Then
             MsgBox errNoEnglishCharacters(UserLang)
             txtArabFirstName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
       End If
       
       If Len(RTrim(txtArab2ndName)) > 0 Then
          If englishCharFound(txtArab2ndName) = True Then
             MsgBox errNoEnglishCharacters(UserLang)
             txtArab2ndName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
       End If
       
       If Len(RTrim(txtArabShortName)) > 0 Then
          If englishCharFound(txtArabShortName) = True Then
             MsgBox errNoEnglishCharacters(UserLang)
             txtArabShortName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
       End If
    
       If Len(RTrim(txtEngFirstName)) > 0 Then
          If arabicCharFound(txtEngFirstName) = True Then
             MsgBox errNoArabicCharacters(UserLang)
             txtEngFirstName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
       End If
       
       If Len(RTrim(txtEnglish2ndName)) > 0 Then
          If arabicCharFound(txtEnglish2ndName) = True Then
             MsgBox errNoArabicCharacters(UserLang)
             txtEnglish2ndName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
       End If
       
       If Len(RTrim(txtEngShortName)) > 0 Then
          If arabicCharFound(txtEngShortName) = True Then
             MsgBox errNoArabicCharacters(UserLang)
             txtEngShortName.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          Else
             validateFrmJuristicDiplomats = 0
          End If
       End If
    End If
   
   If (updateAction Or (tellerAction And recvJuristicMsg.newOrUpdate = "U")) And _
        recvLoginMsg.custNameUpdAllowed <> "1" Then
        ' this empty condition is required to ignore customer name validation
        ' during update & branch is not allowed to update the customer name
   ElseIf Len(RTrim(txtOrgAlphaSearch)) = 0 Then
      MsgBox errSpaceOrgAlphaSearch(UserLang)
      txtOrgAlphaSearch.SetFocus
      validateFrmJuristicDiplomats = 1
      Exit Function
   Else
      validateFrmJuristicDiplomats = 0
   End If
   
   If Len(RTrim(cmbNationality.text)) = 0 Then
      MsgBox errSpaceNationality(UserLang)
      cmbNationality.SetFocus
      validateFrmJuristicDiplomats = 1
      Exit Function
   Else
      validateFrmJuristicDiplomats = 0
   End If
      
    If Len(RTrim(cmbBusinessType.text)) = 0 Then
       MsgBox errSpaceBusType(UserLang)
       cmbBusinessType.SetFocus
       validateFrmJuristicDiplomats = 1
       Exit Function
    Else
       validateFrmJuristicDiplomats = 0
    End If
    If optPoBox = True Then
       If Len(RTrim(txtAddress1)) = 0 Or _
          Len(RTrim(txtPOBox)) = 0 Or _
          Len(RTrim(txtPinCode)) = 0 Or _
          Len(RTrim(cmbCity.text)) = 0 Then
          
           MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
          txtAddress1.SetFocus
          validateFrmJuristicDiplomats = 1
          Exit Function
       Else
          validateFrmJuristicDiplomats = 0
       End If
       
       If Trim(txtPOBox) = "0" Or _
          Trim(txtPinCode) = "0" Then
          MsgBox errPoOrZipCannotBeZero(UserLang)
          txtPOBox.SetFocus
          validateFrmJuristicDiplomats = 1
          Exit Function
       Else
          validateFrmJuristicDiplomats = 0
       End If
    Else ' saudi post address
       If Len(RTrim(txtSaudiPostGPSNo)) = 0 Or _
          Len(RTrim(txtSaudiPostStreetName)) = 0 Or _
          Len(RTrim(txtSaudiPostUnit)) = 0 Or _
          Len(RTrim(cmbCity.text)) = 0 Or _
          Len(RTrim(txtSaudiPostZipCode)) = 0 Or _
          Len(RTrim(txtSaudiPostAdditionalNo)) = 0 Then
          MsgBox errSpaceSaudiAddress(UserLang) '"Saudi Postal address should be entered.. Please enter"
          txtSaudiPostGPSNo.SetFocus
          validateFrmJuristicDiplomats = 1
          Exit Function
        Else
          validateFrmJuristicDiplomats = 0
        End If
    End If
    
    If optLangArabic.Value = True Then
       If optPoBox = True Then
          If Len(RTrim(txtAddress1)) <> 0 Then
             If englishCharFound(txtAddress1) Then
                MsgBox errNoEnglishAddress(UserLang)
                txtAddress1.SetFocus
                validateFrmJuristicDiplomats = 1
                Exit Function
             Else
                validateFrmJuristicDiplomats = 0
             End If
          End If
          If Len(RTrim(txtAddress2)) <> 0 Then
             If englishCharFound(txtAddress2) Then
                MsgBox errNoEnglishAddress(UserLang)
                txtAddress2.SetFocus
                validateFrmJuristicDiplomats = 1
                Exit Function
             Else
                validateFrmJuristicDiplomats = 0
             End If
          End If
       Else
          If Len(RTrim(txtSaudiPostStreetName)) <> 0 Then
             If englishCharFound(txtSaudiPostStreetName) Then
                MsgBox errNoEnglishAddress(UserLang)
                txtSaudiPostStreetName.SetFocus
                validateFrmJuristicDiplomats = 1
                Exit Function
             Else
                validateFrmJuristicDiplomats = 0
             End If
          End If
       End If
         
       If englishCharFound(cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                              cmbCity.text & "'")
          If rs.recordCount > 0 Then
             cmbCity.text = rs(0)
          Else
             MsgBox errLangNotmatching(UserLang)
             cmbCity.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          End If
      End If
    Else    ' if the language is english
       If optPoBox = True Then
          If Len(RTrim(txtAddress1)) <> 0 Then
             If arabicCharFound(txtAddress1) Then
                MsgBox errNoArabicAddress(UserLang)
                txtAddress1.SetFocus
                validateFrmJuristicDiplomats = 1
                Exit Function
             Else
                validateFrmJuristicDiplomats = 0
             End If
          End If
         
          If Len(RTrim(txtAddress2)) <> 0 Then
             If arabicCharFound(txtAddress2) Then
                MsgBox errNoArabicAddress(UserLang)
                txtAddress2.SetFocus
                validateFrmJuristicDiplomats = 1
                Exit Function
             Else
                validateFrmJuristicDiplomats = 0
             End If
          End If
      Else ' saudi post address
      End If
       If arabicCharFound(cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                             cmbCity.text & "'")
          If rs.recordCount > 0 Then
             cmbCity.text = rs(0)
          Else
             MsgBox errLangNotmatching(UserLang)
             cmbCity.SetFocus
             validateFrmJuristicDiplomats = 1
             Exit Function
          End If
      End If
    End If
    
    If Len(RTrim(txtResPhoneNo)) = 0 And _
       Len(RTrim(txtOffPhoneNo)) = 0 And _
       Len(RTrim(txtFaxNo)) = 0 And _
       Len(RTrim(txtMobileNo)) = 0 Then
       
       MsgBox errSpacePhone(UserLang) ' "Atleast one Phone number should be entered..."
       txtOffPhoneNo.SetFocus
       validateFrmJuristicDiplomats = 1
       Exit Function
    Else
       validateFrmJuristicDiplomats = 0
    End If
    
End Function

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameCustomerContactInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameCustomerName_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameIdInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameOpenUpdateDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optAppDateGreg_Click()
   If cmbAppIssueDate.ListCount = 30 Then
      cmbAppIssueDate.AddItem 31
      cmbAppExpiryDate.AddItem 31
   End If
   cmbAppExpiryDate = ""
   cmbAppExpiryMonth = ""
   txtAppExpiryYear = ""
   cmbAppIssueDate = ""
   cmbAppIssueMonth = ""
   txtAppExpiryYear = ""
End Sub

Private Sub optAppDateHijri_Click()
   If cmbAppIssueDate.ListCount = 31 Then
      cmbAppIssueDate.RemoveItem 30
      cmbAppExpiryDate.RemoveItem 30
   End If
   cmbAppExpiryDate = ""
   cmbAppExpiryMonth = ""
   txtAppExpiryYear = ""
   cmbAppIssueDate = ""
   cmbAppIssueMonth = ""
   txtAppExpiryYear = ""
End Sub

Private Sub optdcDateGreg_Click()
   If cmbDCIssueDate.ListCount = 30 Then
      cmbDCIssueDate.AddItem 31
      cmbDCExpiryDate.AddItem 31
   End If
   cmbDCIssueDate = ""
   cmbDCIssueMonth = ""
   txtDCIssueYear = ""
   cmbDCExpiryDate = ""
   cmbDCExpiryMonth = ""
   txtDCExpiryYear = ""
End Sub

Private Sub optdcDateHijri_Click()
   If cmbDCIssueDate.ListCount = 31 Then
      cmbDCIssueDate.RemoveItem 30
      cmbDCExpiryDate.RemoveItem 30
   End If
   cmbDCIssueDate = ""
   cmbDCIssueMonth = ""
   txtDCIssueYear = ""
   cmbDCExpiryDate = ""
   cmbDCExpiryMonth = ""
   txtDCExpiryYear = ""
End Sub

Private Sub optPoBox_Click()
   txtAddress1.Visible = True
   txtAddress1.Refresh
   txtAddress2.Visible = True
   txtAddress2.Refresh
   txtPOBox.Visible = True
   txtPOBox.Refresh
   cmbCountry.Visible = True
   cmbCountry.Refresh
   
   txtPinCode.Visible = True
   txtPinCode.Refresh
   lblAddress1.Visible = True
   lblAddress1.Refresh
   lblPOBox.Visible = True
   lblPOBox.Refresh
   lblZipCode.Visible = True
   lblZipCode.Refresh
   lblCountry.Visible = True
   lblCountry.Refresh

   lblSaudiPostGPSNo.Visible = False
   lblSaudiPostStreetName.Visible = False
   lblSaudiPostUnit.Visible = False
   lblSaudiPostZipCode.Visible = False
   lblSaudiPostAdditionalNo.Visible = False
   txtSaudiPostGPSNo.Visible = False
   txtSaudiPostStreetName.Visible = False
   txtSaudiPostUnit.Visible = False
   txtSaudiPostZipCode.Visible = False
   txtSaudiPostAdditionalNo.Visible = False
End Sub

Private Sub optppDateGreg_Click()
   If cmbPPIssueDate.ListCount = 30 Then
      cmbPPIssueDate.AddItem 31
      cmbPPExpiryDate.AddItem 31
   End If
   cmbPPIssueDate = ""
   cmbPPIssueMonth = ""
   txtPPIssueYear = ""
   cmbPPExpiryDate = ""
   cmbPPExpiryMonth = ""
   txtPPExpiryYear = ""
End Sub

Private Sub optppDateHijri_Click()
   If cmbPPIssueDate.ListCount = 31 Then
      cmbPPIssueDate.RemoveItem 30
      cmbPPExpiryDate.RemoveItem 30
   End If
   cmbPPIssueDate = ""
   cmbPPIssueMonth = ""
   txtPPIssueYear = ""
   cmbPPExpiryDate = ""
   cmbPPExpiryMonth = ""
   txtPPExpiryYear = ""
End Sub

Private Sub optSaudiPost_Click()
   txtAddress1.Visible = False
   txtAddress2.Visible = False
   txtPOBox.Visible = False
   cmbCountry.Visible = False
   
   'cmbCity.Enabled = False
   txtPinCode.Visible = False
   lblAddress1.Visible = False
   lblPOBox.Visible = False
   lblZipCode.Visible = False
   lblCountry.Visible = False
   
   lblSaudiPostGPSNo.Visible = True
   lblSaudiPostGPSNo.Refresh
   lblSaudiPostStreetName.Visible = True
   lblSaudiPostStreetName.Refresh
   
   lblSaudiPostUnit.Visible = True
   lblSaudiPostUnit.Refresh
   lblSaudiPostZipCode.Visible = True
   lblSaudiPostZipCode.Refresh
   lblSaudiPostAdditionalNo.Visible = True
   lblSaudiPostAdditionalNo.Refresh
   txtSaudiPostGPSNo.Visible = True
   txtSaudiPostGPSNo.Refresh
   txtSaudiPostStreetName.Visible = True
   txtSaudiPostStreetName.Refresh
   txtSaudiPostUnit.Visible = True
   txtSaudiPostUnit.Refresh
   txtSaudiPostZipCode.Visible = True
   txtSaudiPostZipCode.Refresh
   txtSaudiPostAdditionalNo.Visible = True
   txtSaudiPostAdditionalNo.Refresh
End Sub

Private Sub optvisaDateGreg_Click()
   If cmbVisaIssueDate.ListCount = 30 Then
      cmbVisaIssueDate.AddItem 31
      cmbVisaExpiryDate.AddItem 31
   End If
   cmbVisaIssueDate = ""
   cmbVisaIssueMonth = ""
   txtVisaIssueYear = ""
   cmbVisaExpiryDate = ""
   cmbVisaExpiryMonth = ""
   txtVisaExpiryYear = ""
End Sub

Private Sub optvisaDateHijri_Click()
   If cmbVisaIssueDate.ListCount = 31 Then
      cmbVisaIssueDate.RemoveItem 30
      cmbVisaExpiryDate.RemoveItem 30
   End If
   cmbVisaIssueDate = ""
   cmbVisaIssueMonth = ""
   txtVisaIssueYear = ""
   cmbVisaExpiryDate = ""
   cmbVisaExpiryMonth = ""
   txtVisaExpiryYear = ""
End Sub

Private Sub txtAddress1_KeyPress(KeyAscii As Integer)
If optLangArabic Then
      txtAddress1.Alignment = 1
      If ((KeyAscii > 64 And KeyAscii < 91) Or _
         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errNoEnglishCharacters(UserLang))
          Exit Sub
      End If
      If KeyAscii = 220 Then
         MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
         KeyAscii = 0
         Exit Sub
      End If
    Else
      txtAddress1.Alignment = 0
      If KeyAscii > 128 Then
         KeyAscii = 0
         MsgBox (errNoArabicCharacters(UserLang))
         Exit Sub
      End If
    End If

End Sub

Private Sub txtAddress2_KeyPress(KeyAscii As Integer)
   If optLangArabic Then
      txtAddress2.Alignment = 1 ' right justified
      If ((KeyAscii > 64 And KeyAscii < 91) Or _
         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errNoEnglishCharacters(UserLang))
          Exit Sub
      End If
      If KeyAscii = 220 Then
         MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
         KeyAscii = 0
         Exit Sub
      End If
   Else
      txtAddress2.Alignment = 0 'left justified
      If KeyAscii > 128 Then
         KeyAscii = 0
         MsgBox (errNoArabicCharacters(UserLang))
         Exit Sub
      End If
   End If
End Sub

Private Sub txtArabic2ndName_Change()


End Sub

Private Sub txtAppExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtAppExpiryYear)) <> 0 Then
        If Len(txtAppExpiryYear) = 4 Then
           txtApproverName.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
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

Private Sub txtArab2ndName_KeyPress(KeyAscii As Integer)
   If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If

End Sub

Private Sub txtArabFirstName_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If

End Sub

Private Sub txtArabic2ndName_KeyPress(KeyAscii As Integer)
    If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If
End Sub

Private Sub txtArabShortName_GotFocus()
  If Not searchAction And Not custHistoryAction Then
     txtArabShortName = txtArabFirstName & " " & txtArab2ndName
     If Len(txtArabShortName) > 30 Then
        txtArabShortName = txtArabFirstName
     End If
  End If

End Sub

Private Sub txtArabShortName_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If

End Sub

Private Sub txtDCExpiryYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbDCExpiryDate)) > 0 And Len(RTrim(cmbDCExpiryMonth)) > 0 Then
          If Len(RTrim(txtDCExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtDCExpiryYear.text = ""
             txtDCExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtDCExpiryYear)) <> 0 Then
          If optDCDateHijri.Value = True Then
             If txtDCExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtDCExpiryYear.Enabled = True Then
                   txtDCExpiryYear.text = ""
                   txtDCExpiryYear.SetFocus
                Else
                   txtDCExpiryYear.Enabled = True
                   txtDCExpiryYear.text = ""
                   txtDCExpiryYear.SetFocus
                End If
             End If
          Else
             If txtDCExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtDCExpiryYear.Enabled = True Then
                   txtDCExpiryYear.text = ""
                   txtDCExpiryYear.SetFocus
                Else
                   txtDCExpiryYear.Enabled = True
                   txtDCExpiryYear.text = ""
                   txtDCExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtDCIssueYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbDCIssueDate)) > 0 And Len(RTrim(cmbDCIssueMonth)) > 0 Then
          If Len(RTrim(txtDCIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtDCIssueYear.text = ""
             txtDCIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtDCIssueYear)) <> 0 Then
          If optDCDateHijri.Value = True Then
             If txtDCIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtDCIssueYear.Enabled = True Then
                   txtDCIssueYear.text = ""
                   txtDCIssueYear.SetFocus
                Else
                   txtDCIssueYear.Enabled = True
                   txtDCIssueYear.text = ""
                   txtDCIssueYear.SetFocus
                End If
             End If
          Else
             If txtDCIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtDCIssueYear.Enabled = True Then
                   txtDCIssueYear.text = ""
                   txtDCIssueYear.SetFocus
                Else
                   txtDCIssueYear.Enabled = True
                   txtDCIssueYear.text = ""
                   txtDCIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtEmailAddress_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEmailAddress_LostFocus()

 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
      On Error Resume Next
      If Len(RTrim(txtEmailAddress)) <> 0 Then
         If InStr(txtEmailAddress, "@") = 0 Then
            MsgBox errInvalidMailAddress(UserLang) '"E-mail address should contain @ character...Please Re-try"
            txtEmailAddress.SetFocus
         End If
      End If
    End If
    On Error GoTo 0
 End If
End Sub

Private Sub txtEngFirstName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEngFirstName_LostFocus()
   
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEngFirstName)) > 0 Then
         tmpStr = Trim(txtEngFirstName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngFirstName = tmpStr
      End If
   End If
End Sub

Private Sub txtEnglish2ndName_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEnglish2ndName_LostFocus()
   
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEnglish2ndName)) > 0 Then
         tmpStr = Trim(txtEnglish2ndName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEnglish2ndName = tmpStr
      End If
   End If
End Sub

Private Sub txtEngShortName_GotFocus()
  If Not searchAction And Not custHistoryAction Then
     txtEngShortName = txtEngFirstName + " " + txtEnglish2ndName
     If Len(txtEngShortName) > 30 Then
        txtEngShortName = txtEngFirstName
     End If
  End If
End Sub

Private Sub txtEngShortName_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtFaxCityCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtFaxExt_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtFaxNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtFaxNo_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
     On Error Resume Next
     If Len(RTrim(txtFaxNo)) <> 0 Then
        If Len(txtFaxNo) < 7 Then
           MsgBox errInvalidTelNo(UserLang) '"Telephone number should contain atleast 7 digits..Please RE-enter"
           txtFaxNo.SetFocus
        End If
     End If
   End If
   On Error GoTo 0
End If

End Sub

Private Sub txtMobileAreaCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtMobileNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtMobileNo_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
     On Error Resume Next
     If Len(RTrim(txtMobileNo)) <> 0 Then
        If Len(txtMobileNo) < 8 Then
           MsgBox errInvalidMobileNo(UserLang) '"Mobile number should contain atleast 8 digits..Please RE-enter"
           txtMobileNo.SetFocus
        End If
     End If
   End If
   On Error GoTo 0
End If

End Sub

Private Sub txtOffPhoneCityCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtOffPhoneExt_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtOffphoneNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtOffphoneNo_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
     On Error Resume Next
     If Len(RTrim(txtOffPhoneNo)) <> 0 Then
        If Len(txtOffPhoneNo) < 7 Then
           MsgBox errInvalidTelNo(UserLang) '"Telephone number should contain atleast 7 digits..Please RE-enter"
           txtOffPhoneNo.SetFocus
        End If
     End If
   End If
   On Error GoTo 0
End If
End Sub

Private Sub txtPagerNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtPinCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtPoBox_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtPPExpiryYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbPPExpiryDate)) > 0 And Len(RTrim(cmbPPExpiryMonth)) > 0 Then
          If Len(RTrim(txtPPExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtPPExpiryYear.text = ""
             txtPPExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtPPExpiryYear)) <> 0 Then
          If optPPDateHijri.Value = True Then
             If txtPPExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPPExpiryYear.Enabled = True Then
                   txtPPExpiryYear.text = ""
                   txtPPExpiryYear.SetFocus
                Else
                   txtPPExpiryYear.Enabled = True
                   txtPPExpiryYear.text = ""
                   txtPPExpiryYear.SetFocus
                End If
             End If
          Else
             If txtPPExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPPExpiryYear.Enabled = True Then
                   txtPPExpiryYear.text = ""
                   txtPPExpiryYear.SetFocus
                Else
                   txtPPExpiryYear.Enabled = True
                   txtPPExpiryYear.text = ""
                   txtPPExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtPPIssueYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbPPIssueDate)) > 0 And Len(RTrim(cmbPPIssueMonth)) > 0 Then
          If Len(RTrim(txtPPIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtPPIssueYear.text = ""
             txtPPIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtPPIssueYear)) <> 0 Then
          If optPPDateHijri.Value = True Then
             If txtPPIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPPIssueYear.Enabled = True Then
                   txtPPIssueYear.text = ""
                   txtPPIssueYear.SetFocus
                Else
                   txtPPIssueYear.Enabled = True
                   txtPPIssueYear.text = ""
                   txtPPIssueYear.SetFocus
                End If
             End If
          Else
             If txtPPIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPPIssueYear.Enabled = True Then
                   txtPPIssueYear.text = ""
                   txtPPIssueYear.SetFocus
                Else
                   txtPPIssueYear.Enabled = True
                   txtPPIssueYear.text = ""
                   txtPPIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtResPhoneCityCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtResPhoneExt_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtResPhoneNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtResPhoneNo_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
     On Error Resume Next
     If Len(RTrim(txtResPhoneNo)) <> 0 Then
        If Len(txtResPhoneNo) < 7 Then
           MsgBox errInvalidTelNo(UserLang) '"Telephone number should contain atleast 7 digits..Please RE-enter"
           txtResPhoneNo.SetFocus
        End If
     End If
   End If
   On Error GoTo 0
End If

End Sub

Private Sub txtppExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtPPExpiryYear)) <> 0 Then
        If Len(txtPPExpiryYear) = 4 Then
           txtDiplomaticCardNo.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtppExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtppIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtPPIssueYear)) <> 0 Then
        If Len(txtPPIssueYear) = 4 Then
           cmbPPExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtppIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
' passport checking is over

Private Sub txtdcExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtDCExpiryYear)) <> 0 Then
        If Len(txtDCExpiryYear) = 4 Then
           txtVisaNo.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtdcExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtdcIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtDCIssueYear)) <> 0 Then
        If Len(txtDCIssueYear) = 4 Then
           cmbDCExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtdcIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
' dc checking over


Private Sub txtSaudiPostAdditionalNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtSaudiPostGPSNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtSaudiPostUnit_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtSaudiPostZipCode_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtvisaExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtVisaExpiryYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbVisaExpiryDate)) > 0 And Len(RTrim(cmbVisaExpiryMonth)) > 0 Then
          If Len(RTrim(txtVisaExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtVisaExpiryYear.text = ""
             txtVisaExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtVisaExpiryYear)) <> 0 Then
          If optVisaDateHijri.Value = True Then
             If txtVisaExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtVisaExpiryYear.Enabled = True Then
                   txtVisaExpiryYear.text = ""
                   txtVisaExpiryYear.SetFocus
                Else
                   txtVisaExpiryYear.Enabled = True
                   txtVisaExpiryYear.text = ""
                   txtVisaExpiryYear.SetFocus
                End If
             End If
          Else
             If txtVisaExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtVisaExpiryYear.Enabled = True Then
                   txtVisaExpiryYear.text = ""
                   txtVisaExpiryYear.SetFocus
                Else
                   txtVisaExpiryYear.Enabled = True
                   txtVisaExpiryYear.text = ""
                   txtVisaExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtvisaIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtVisaIssueYear)) <> 0 Then
        If Len(txtVisaIssueYear) = 4 Then
           cmbVisaExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtvisaIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtVisaIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbVisaIssueDate)) > 0 And Len(RTrim(cmbVisaIssueMonth)) > 0 Then
          If Len(RTrim(txtVisaIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtVisaIssueYear.text = ""
             txtVisaIssueYear.SetFocus
             Exit Sub
           End If
       End If
       On Error Resume Next
       If Len(RTrim(txtVisaIssueYear)) <> 0 Then
          If optVisaDateHijri.Value = True Then
             If txtVisaIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtVisaIssueYear.Enabled = True Then
                   txtVisaIssueYear.text = ""
                   txtVisaIssueYear.SetFocus
                Else
                   txtVisaIssueYear.Enabled = True
                   txtVisaIssueYear.text = ""
                   txtVisaIssueYear.SetFocus
                End If
             End If
          Else
             If txtVisaIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtVisaIssueYear.Enabled = True Then
                   txtVisaIssueYear.text = ""
                   txtVisaIssueYear.SetFocus
                Else
                   txtVisaIssueYear.Enabled = True
                   txtVisaIssueYear.text = ""
                   txtVisaIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If
 
End Sub
