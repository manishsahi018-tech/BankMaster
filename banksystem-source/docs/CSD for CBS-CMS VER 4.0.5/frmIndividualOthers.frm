VERSION 5.00
Begin VB.Form frmIndividualOthers 
   BackColor       =   &H00BFD87E&
   Caption         =   "Individual Customer Details - Others"
   ClientHeight    =   8025
   ClientLeft      =   90
   ClientTop       =   420
   ClientWidth     =   11730
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8025
   ScaleWidth      =   11730
   WindowState     =   2  'Maximized
   Begin VB.Frame frameVisaInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame2"
      Height          =   375
      Left            =   45
      TabIndex        =   186
      Top             =   2040
      Width           =   11760
      Begin VB.TextBox txtVisaNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1215
         MaxLength       =   15
         TabIndex        =   20
         Tag             =   "11760"
         Top             =   30
         Width           =   1185
      End
      Begin VB.ComboBox cmbVisaExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9870
         TabIndex        =   27
         Tag             =   "11760"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.ComboBox cmbVisaExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10470
         TabIndex        =   28
         Tag             =   "11760"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.TextBox txtVisaExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   11100
         MaxLength       =   4
         TabIndex        =   29
         Tag             =   "11760"
         Top             =   45
         Width           =   585
      End
      Begin VB.TextBox txtVisaIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8760
         MaxLength       =   4
         TabIndex        =   26
         Tag             =   "11760"
         Top             =   60
         Width           =   495
      End
      Begin VB.ComboBox cmbVisaIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8160
         TabIndex        =   25
         Tag             =   "11760"
         Text            =   "01"
         Top             =   60
         Width           =   615
      End
      Begin VB.ComboBox cmbVisaIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7560
         TabIndex        =   24
         Tag             =   "11760"
         Text            =   "01"
         Top             =   60
         Width           =   615
      End
      Begin VB.Frame Frame3 
         BackColor       =   &H00BFD87E&
         Height          =   390
         Left            =   5805
         TabIndex        =   187
         Tag             =   "11760"
         Top             =   -75
         Width           =   1170
         Begin VB.OptionButton optVisaDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   195
            Left            =   60
            TabIndex        =   22
            Tag             =   "1170"
            ToolTipText     =   "Hijri"
            Top             =   150
            Value           =   -1  'True
            Width           =   450
         End
         Begin VB.OptionButton optVisaDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   210
            Left            =   630
            TabIndex        =   23
            TabStop         =   0   'False
            Tag             =   "1170"
            ToolTipText     =   "Gregorian"
            Top             =   150
            Width           =   465
         End
      End
      Begin VB.ComboBox cmbVisaIssuedAt 
         Height          =   315
         Left            =   3375
         TabIndex        =   21
         Tag             =   "11760"
         Text            =   "Riyadh"
         Top             =   15
         Width           =   1410
      End
      Begin VB.Label lblVisaNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Visa Number"
         BeginProperty Font 
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
         Left            =   0
         TabIndex        =   192
         Tag             =   "11760"
         Top             =   45
         Width           =   1215
      End
      Begin VB.Label lblVisaExpiryDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Expiry"
         BeginProperty Font 
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
         Left            =   9270
         TabIndex        =   191
         Tag             =   "11760"
         Top             =   75
         Width           =   675
      End
      Begin VB.Label lblVisaDateType 
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
         Left            =   4845
         TabIndex        =   190
         Tag             =   "11760"
         Top             =   60
         Width           =   1065
      End
      Begin VB.Label lblVisaIssuedAt 
         BackColor       =   &H00BFD87E&
         Caption         =   "Issued At"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2460
         TabIndex        =   189
         Tag             =   "11760"
         Top             =   60
         Width           =   960
      End
      Begin VB.Label lblVisaIssueDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Issue"
         BeginProperty Font 
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
         Left            =   7005
         TabIndex        =   188
         Tag             =   "11760"
         Top             =   75
         Width           =   690
      End
   End
   Begin VB.CommandButton cmdCardInfo 
      Caption         =   "ATM Card"
      Height          =   405
      Left            =   4800
      TabIndex        =   174
      ToolTipText     =   "ATM Card Info"
      Top             =   7995
      Width           =   1575
   End
   Begin VB.CommandButton cmdAcctInfo 
      Caption         =   "Account"
      Height          =   405
      Left            =   3240
      TabIndex        =   173
      ToolTipText     =   "Account Info"
      Top             =   7995
      Width           =   1575
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next Page"
      Height          =   405
      Left            =   8580
      TabIndex        =   172
      Top             =   7995
      Width           =   1305
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   405
      Left            =   9870
      TabIndex        =   171
      Top             =   7995
      Width           =   1305
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor comments"
      Height          =   405
      Left            =   6390
      TabIndex        =   170
      ToolTipText     =   "Supervisor Comments"
      Top             =   7995
      Width           =   2175
   End
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Height          =   465
      Left            =   1200
      TabIndex        =   162
      Top             =   2505
      Width           =   2055
      Begin VB.OptionButton optLangArabic 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic"
         Height          =   255
         Left            =   60
         TabIndex        =   30
         Tag             =   "2055"
         ToolTipText     =   "Arabic"
         Top             =   120
         Value           =   -1  'True
         Width           =   795
      End
      Begin VB.OptionButton optLangEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "English"
         Height          =   255
         Left            =   960
         TabIndex        =   31
         TabStop         =   0   'False
         Tag             =   "2055"
         ToolTipText     =   "English"
         Top             =   150
         Width           =   945
      End
   End
   Begin VB.ComboBox cmbNationality 
      Height          =   315
      Left            =   4560
      TabIndex        =   32
      Text            =   "cmbNationality"
      Top             =   2595
      Width           =   2775
   End
   Begin VB.ComboBox cmbTitle 
      Height          =   315
      Left            =   8640
      TabIndex        =   33
      Text            =   "cmbTitle"
      Top             =   2595
      Width           =   2970
   End
   Begin VB.Frame frameCustomerName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   75
      TabIndex        =   153
      Top             =   3075
      Width           =   11775
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   41
         Tag             =   "11775"
         Top             =   600
         Width           =   1575
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   36
         Tag             =   "11775"
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   600
         Width           =   2910
      End
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   42
         Tag             =   "11775"
         Top             =   600
         Width           =   1695
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   40
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   39
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   240
         Width           =   2925
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   37
         Tag             =   "11775"
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
      End
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   34
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
         TabIndex        =   160
         Tag             =   "11775"
         Top             =   0
         Width           =   1575
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
         Left            =   8640
         TabIndex        =   159
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
         TabIndex        =   158
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
         TabIndex        =   157
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
         TabIndex        =   156
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
         TabIndex        =   155
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
         TabIndex        =   154
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
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
      Left            =   60
      TabIndex        =   130
      Top             =   6915
      Width           =   11820
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
         TabIndex        =   142
         Tag             =   "11820"
         Top             =   240
         Width           =   540
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
         TabIndex        =   141
         Tag             =   "11820"
         Text            =   "01"
         Top             =   225
         Width           =   615
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
         TabIndex        =   140
         Tag             =   "11820"
         Text            =   "01"
         Top             =   240
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
         TabIndex        =   139
         Tag             =   "11820"
         Top             =   600
         Width           =   540
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
         TabIndex        =   138
         Tag             =   "11820"
         Text            =   "01"
         Top             =   585
         Width           =   615
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
         TabIndex        =   137
         Tag             =   "11820"
         Text            =   "01"
         Top             =   585
         Width           =   615
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
         TabIndex        =   136
         Tag             =   "11820"
         Top             =   240
         Width           =   975
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
         TabIndex        =   135
         Tag             =   "11820"
         Top             =   615
         Width           =   975
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
         TabIndex        =   134
         Tag             =   "11820"
         Top             =   240
         Width           =   1215
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
         TabIndex        =   133
         Tag             =   "11820"
         Top             =   600
         Width           =   1215
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
         TabIndex        =   132
         Tag             =   "11820"
         Top             =   195
         Width           =   1095
      End
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
         TabIndex        =   131
         Tag             =   "11820"
         Top             =   600
         Width           =   1095
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
         Left            =   30
         TabIndex        =   152
         Tag             =   "11820"
         Top             =   645
         Width           =   1275
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
         Left            =   30
         TabIndex        =   151
         Tag             =   "11820"
         Top             =   300
         Width           =   1365
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
         TabIndex        =   150
         Tag             =   "11820"
         Top             =   300
         Width           =   1185
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
         TabIndex        =   149
         Tag             =   "11820"
         Top             =   660
         Width           =   1515
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
         TabIndex        =   148
         Tag             =   "11820"
         Top             =   255
         Width           =   735
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
         TabIndex        =   147
         Tag             =   "11820"
         Top             =   630
         Width           =   735
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
         TabIndex        =   146
         Tag             =   "11820"
         Top             =   240
         Width           =   795
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
         TabIndex        =   145
         Tag             =   "11820"
         Top             =   615
         Width           =   795
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
         TabIndex        =   144
         Tag             =   "11820"
         Top             =   240
         Width           =   1170
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
         TabIndex        =   143
         Tag             =   "11820"
         Top             =   600
         Width           =   1170
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00C0C0C0&
         BorderStyle     =   3  'Dot
         DrawMode        =   4  'Mask Not Pen
         Tag             =   "11820"
         X1              =   30
         X2              =   11505
         Y1              =   555
         Y2              =   555
      End
   End
   Begin VB.ComboBox cmbBranchCode 
      Enabled         =   0   'False
      Height          =   315
      Left            =   4080
      TabIndex        =   0
      Top             =   420
      Width           =   1710
   End
   Begin VB.Frame FramePassportInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame2"
      Height          =   435
      Left            =   60
      TabIndex        =   123
      Top             =   1560
      Width           =   11760
      Begin VB.ComboBox cmbPpIssuedAt 
         Height          =   315
         Left            =   3375
         TabIndex        =   11
         Tag             =   "11760"
         Text            =   "Riyadh"
         Top             =   15
         Width           =   1410
      End
      Begin VB.Frame framePpDateType 
         BackColor       =   &H00BFD87E&
         Height          =   405
         Left            =   5805
         TabIndex        =   126
         Tag             =   "11760"
         Top             =   -45
         Width           =   1170
         Begin VB.OptionButton optPpDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   210
            Left            =   630
            TabIndex        =   13
            TabStop         =   0   'False
            Tag             =   "1170"
            ToolTipText     =   "Gregorian"
            Top             =   150
            Width           =   465
         End
         Begin VB.OptionButton optPpDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   195
            Left            =   75
            TabIndex        =   12
            Tag             =   "1170"
            ToolTipText     =   "Hijri"
            Top             =   150
            Value           =   -1  'True
            Width           =   450
         End
      End
      Begin VB.ComboBox cmbPpIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7560
         TabIndex        =   14
         Tag             =   "11760"
         Text            =   "01"
         Top             =   60
         Width           =   615
      End
      Begin VB.ComboBox cmbPpIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8160
         TabIndex        =   15
         Tag             =   "11760"
         Text            =   "01"
         Top             =   60
         Width           =   615
      End
      Begin VB.TextBox txtPpIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8760
         MaxLength       =   4
         TabIndex        =   16
         Tag             =   "11760"
         Top             =   60
         Width           =   495
      End
      Begin VB.TextBox txtPpExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   11100
         MaxLength       =   4
         TabIndex        =   19
         Tag             =   "11760"
         Top             =   45
         Width           =   585
      End
      Begin VB.ComboBox cmbPpExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10470
         TabIndex        =   18
         Tag             =   "11760"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.ComboBox cmbPpExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9870
         TabIndex        =   17
         Tag             =   "11760"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.TextBox txtPpNumber 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1215
         MaxLength       =   15
         TabIndex        =   10
         Tag             =   "11760"
         Top             =   30
         Width           =   1185
      End
      Begin VB.Label lblPpIssueDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Issue"
         BeginProperty Font 
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
         Left            =   7005
         TabIndex        =   129
         Tag             =   "11760"
         Top             =   90
         Width           =   705
      End
      Begin VB.Label lblPpIssueAt 
         BackColor       =   &H00BFD87E&
         Caption         =   "Issued At"
         BeginProperty Font 
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
         TabIndex        =   128
         Tag             =   "11760"
         Top             =   60
         Width           =   975
      End
      Begin VB.Label lblPpDateType 
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
         Left            =   4845
         TabIndex        =   127
         Tag             =   "11760"
         Top             =   60
         Width           =   1125
      End
      Begin VB.Label lblPpExpiryDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Expiry"
         BeginProperty Font 
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
         Left            =   9270
         TabIndex        =   125
         Tag             =   "11760"
         Top             =   75
         Width           =   750
      End
      Begin VB.Label lblPpNumber 
         BackColor       =   &H00BFD87E&
         Caption         =   "PP Number"
         BeginProperty Font 
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
         TabIndex        =   124
         Tag             =   "11760"
         Top             =   60
         Width           =   1215
      End
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1815
      Left            =   60
      TabIndex        =   111
      Top             =   5100
      Width           =   11775
      Begin VB.TextBox txtSaudiPostAdditionalNo 
         Height          =   285
         Left            =   7080
         MaxLength       =   4
         TabIndex        =   71
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostGPSNo 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   62
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtSaudiPostZipCode 
         Height          =   285
         Left            =   5880
         MaxLength       =   5
         TabIndex        =   69
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostUnit 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   66
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostStreetName 
         Height          =   285
         Left            =   3840
         MaxLength       =   24
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   3255
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   1230
         TabIndex        =   175
         Tag             =   "11775"
         Top             =   -120
         Width           =   2550
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
            TabIndex        =   60
            Tag             =   "2550"
            ToolTipText     =   "PO Box"
            Top             =   150
            Value           =   -1  'True
            Width           =   975
         End
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
            TabIndex        =   61
            Tag             =   "2550"
            ToolTipText     =   "Saudi Post"
            Top             =   180
            Width           =   1395
         End
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4905
         MaxLength       =   10
         TabIndex        =   84
         Tag             =   "11775"
         Top             =   1440
         Width           =   1335
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4905
         MaxLength       =   4
         TabIndex        =   76
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8295
         MaxLength       =   4
         TabIndex        =   79
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtMobileAreaCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1185
         MaxLength       =   2
         TabIndex        =   82
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   1440
         Width           =   375
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1185
         MaxLength       =   4
         TabIndex        =   73
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8265
         MaxLength       =   30
         TabIndex        =   85
         Tag             =   "11775"
         Top             =   1440
         Width           =   3255
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   81
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8655
         MaxLength       =   10
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6810
         MaxLength       =   4
         TabIndex        =   78
         Tag             =   "11775"
         Text            =   " "
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   2985
         MaxLength       =   4
         TabIndex        =   75
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1665
         MaxLength       =   8
         TabIndex        =   83
         Tag             =   "11775"
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5385
         MaxLength       =   10
         TabIndex        =   77
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1665
         MaxLength       =   10
         TabIndex        =   74
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8310
         TabIndex        =   72
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   720
         Width           =   2145
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6240
         MaxLength       =   10
         TabIndex        =   70
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2880
         TabIndex        =   68
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   720
         Width           =   2055
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
         Left            =   1185
         MaxLength       =   10
         TabIndex        =   67
         Tag             =   "11775"
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   4425
         MaxLength       =   30
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   360
         Width           =   3015
      End
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   1185
         MaxLength       =   30
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   360
         Width           =   3015
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
         Left            =   6960
         TabIndex        =   181
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   255
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
         TabIndex        =   180
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
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
         TabIndex        =   179
         Tag             =   "11775"
         Top             =   360
         Width           =   1575
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
         TabIndex        =   178
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   1215
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
         TabIndex        =   177
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   1455
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
         TabIndex        =   176
         Tag             =   "11775"
         Top             =   0
         Width           =   1335
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
         Left            =   3705
         TabIndex        =   122
         Tag             =   "11775"
         Top             =   1440
         Width           =   495
      End
      Begin VB.Label lblEmail 
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
         Height          =   255
         Left            =   6960
         TabIndex        =   121
         Tag             =   "11775"
         Top             =   1440
         Width           =   1215
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
         Left            =   7485
         TabIndex        =   120
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
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
         TabIndex        =   119
         Tag             =   "11775"
         Top             =   1440
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
         Left            =   3705
         TabIndex        =   118
         Tag             =   "11775"
         Top             =   1080
         Width           =   1095
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
         TabIndex        =   117
         Tag             =   "11775"
         Top             =   1080
         Width           =   975
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
         Left            =   7485
         TabIndex        =   116
         Tag             =   "11775"
         Top             =   720
         Width           =   735
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
         Left            =   5025
         TabIndex        =   115
         Tag             =   "11775"
         Top             =   720
         Width           =   1095
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
         Left            =   2265
         TabIndex        =   114
         Tag             =   "11775"
         Top             =   720
         Width           =   615
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
         Left            =   0
         TabIndex        =   113
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label lblAddress1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Address"
         BeginProperty Font 
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
         TabIndex        =   112
         Tag             =   "11775"
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame frameVIP 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   10095
      TabIndex        =   103
      Top             =   4020
      Visible         =   0   'False
      Width           =   1575
      Begin VB.OptionButton optVipNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   52
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   165
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optVipYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   255
         Left            =   135
         TabIndex        =   51
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   180
         Width           =   615
      End
   End
   Begin VB.ComboBox cmbBusinessType 
      Height          =   315
      Left            =   9960
      TabIndex        =   59
      Tag             =   "11775"
      Text            =   "cmbBusinessType"
      Top             =   4635
      Width           =   1695
   End
   Begin VB.Frame frameSex 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   7320
      TabIndex        =   102
      Top             =   4035
      Width           =   2055
      Begin VB.OptionButton optGenderFemale 
         BackColor       =   &H00BFD87E&
         Caption         =   "Female"
         Height          =   255
         Left            =   960
         TabIndex        =   50
         Tag             =   "2055"
         ToolTipText     =   "Female"
         Top             =   165
         Width           =   975
      End
      Begin VB.OptionButton optGenderMale 
         BackColor       =   &H00BFD87E&
         Caption         =   "Male"
         Height          =   255
         Left            =   120
         TabIndex        =   49
         Tag             =   "2055"
         ToolTipText     =   "Male"
         Top             =   180
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.Frame frameMaritalStatus 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1320
      TabIndex        =   101
      Tag             =   "11775"
      Top             =   4515
      Width           =   2655
      Begin VB.OptionButton optSingle 
         BackColor       =   &H00BFD87E&
         Caption         =   "Single"
         Height          =   255
         Left            =   960
         TabIndex        =   54
         TabStop         =   0   'False
         Tag             =   "2655"
         ToolTipText     =   "Single"
         Top             =   165
         Width           =   735
      End
      Begin VB.OptionButton optMarried 
         BackColor       =   &H00BFD87E&
         Caption         =   "Married"
         Height          =   255
         Left            =   60
         TabIndex        =   53
         Tag             =   "2655"
         ToolTipText     =   "Married"
         Top             =   165
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton optOthers 
         BackColor       =   &H00BFD87E&
         Caption         =   "Others"
         Height          =   255
         Left            =   1680
         TabIndex        =   55
         Tag             =   "2655"
         ToolTipText     =   "Others"
         Top             =   165
         Width           =   855
      End
   End
   Begin VB.TextBox txtDependents 
      Height          =   285
      Left            =   5160
      MaxLength       =   2
      TabIndex        =   56
      Tag             =   "11775"
      Top             =   4695
      Width           =   495
   End
   Begin VB.Frame frameDobDateType 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1275
      TabIndex        =   100
      Top             =   4035
      Width           =   1710
      Begin VB.OptionButton optDOBGreg 
         BackColor       =   &H00BFD87E&
         Caption         =   "Gregorian"
         Height          =   195
         Left            =   645
         TabIndex        =   45
         Tag             =   "1710"
         ToolTipText     =   "Gregorian"
         Top             =   180
         Width           =   1035
      End
      Begin VB.OptionButton optDOBHijri 
         BackColor       =   &H00BFD87E&
         Caption         =   "Hijri"
         Height          =   255
         Left            =   60
         TabIndex        =   44
         Tag             =   "1710"
         ToolTipText     =   "Hijri"
         Top             =   150
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.ComboBox cmbDobDate 
      Height          =   315
      Left            =   4800
      TabIndex        =   46
      Text            =   "01"
      Top             =   4155
      Width           =   615
   End
   Begin VB.ComboBox cmbDobMonth 
      Height          =   315
      Left            =   5415
      TabIndex        =   47
      Text            =   "01"
      Top             =   4155
      Width           =   615
   End
   Begin VB.TextBox txtDobYear 
      Height          =   285
      Left            =   6000
      MaxLength       =   4
      TabIndex        =   48
      Top             =   4155
      Width           =   495
   End
   Begin VB.Frame frameIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   765
      Left            =   75
      TabIndex        =   95
      Top             =   795
      Width           =   11775
      Begin VB.Frame frameIqamaType 
         BackColor       =   &H00BFD87E&
         Height          =   375
         Left            =   1170
         TabIndex        =   193
         Tag             =   "11775"
         Top             =   300
         Width           =   2010
         Begin VB.OptionButton optBook 
            BackColor       =   &H00BFD87E&
            Caption         =   "Book"
            Height          =   165
            Left            =   120
            TabIndex        =   195
            Tag             =   "2010"
            ToolTipText     =   "Hijri"
            Top             =   150
            Value           =   -1  'True
            Width           =   825
         End
         Begin VB.OptionButton optPlastic 
            BackColor       =   &H00BFD87E&
            Caption         =   "Plastic"
            Height          =   165
            Left            =   1005
            TabIndex        =   194
            TabStop         =   0   'False
            Tag             =   "2010"
            ToolTipText     =   "Gregorian"
            Top             =   165
            Width           =   900
         End
      End
      Begin VB.Frame frameIqamaDateType 
         BackColor       =   &H00BFD87E&
         Height          =   390
         Left            =   5790
         TabIndex        =   182
         Tag             =   "11775"
         Top             =   -45
         Width           =   1170
         Begin VB.OptionButton optIqamaDateGregorian 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   165
            Left            =   645
            TabIndex        =   184
            TabStop         =   0   'False
            Tag             =   "1170"
            ToolTipText     =   "Gregorian"
            Top             =   165
            Width           =   420
         End
         Begin VB.OptionButton optIqamaDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   195
            Left            =   120
            TabIndex        =   183
            Tag             =   "1170"
            ToolTipText     =   "Hijri"
            Top             =   150
            Value           =   -1  'True
            Width           =   465
         End
      End
      Begin VB.TextBox txtIqamaExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   11100
         MaxLength       =   4
         TabIndex        =   9
         Tag             =   "11775"
         Top             =   45
         Width           =   555
      End
      Begin VB.ComboBox cmbIqamaExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10500
         TabIndex        =   8
         Tag             =   "11775"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.ComboBox cmbIqamaExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9900
         TabIndex        =   7
         Tag             =   "11775"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.TextBox txtIqamaIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8715
         MaxLength       =   4
         TabIndex        =   6
         Tag             =   "11775"
         Top             =   15
         Width           =   525
      End
      Begin VB.ComboBox cmbIqamaIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8115
         TabIndex        =   5
         Tag             =   "11775"
         Text            =   "01"
         Top             =   15
         Width           =   615
      End
      Begin VB.ComboBox cmbIqamaIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7515
         TabIndex        =   4
         Tag             =   "11775"
         Text            =   "01"
         Top             =   15
         Width           =   615
      End
      Begin VB.ComboBox cmbIqamaIssuedAt 
         Height          =   315
         Left            =   3360
         TabIndex        =   3
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1425
      End
      Begin VB.TextBox txtIqamaNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   2
         Tag             =   "11775"
         Top             =   15
         Width           =   1185
      End
      Begin VB.Label lblIqamaType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Iqama Type"
         BeginProperty Font 
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
         TabIndex        =   196
         Tag             =   "11775"
         Top             =   405
         Width           =   1170
      End
      Begin VB.Label lblIqamaDateType 
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
         Left            =   4860
         TabIndex        =   185
         Tag             =   "11775"
         Top             =   60
         Width           =   1170
      End
      Begin VB.Label lblIqamaIssuedAt 
         BackColor       =   &H00BFD87E&
         Caption         =   "Issued At"
         BeginProperty Font 
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
         Left            =   2445
         TabIndex        =   99
         Tag             =   "11775"
         Top             =   45
         Width           =   960
      End
      Begin VB.Label lblIqamaExpiryDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Expiry"
         BeginProperty Font 
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
         Left            =   9285
         TabIndex        =   98
         Tag             =   "11775"
         Top             =   75
         Width           =   750
      End
      Begin VB.Label lblIqamaIssueDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Issue"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6990
         TabIndex        =   97
         Tag             =   "11775"
         Top             =   75
         Width           =   720
      End
      Begin VB.Label lblIqamaNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Iqama Number"
         BeginProperty Font 
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
         TabIndex        =   96
         Tag             =   "11775"
         Top             =   45
         Width           =   1455
      End
   End
   Begin VB.TextBox Terms 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   465
      Left            =   120
      TabIndex        =   93
      Text            =   "Terms and Conditions Here "
      Top             =   12435
      Width           =   12180
   End
   Begin VB.ComboBox cmbAltBrCode 
      Height          =   315
      Left            =   7770
      TabIndex        =   1
      Top             =   405
      Width           =   1815
   End
   Begin VB.TextBox txtCustomerNo 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   285
      Left            =   2025
      MaxLength       =   7
      TabIndex        =   88
      Top             =   420
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
      Left            =   10290
      TabIndex        =   87
      Top             =   360
      Width           =   1335
   End
   Begin VB.Frame frameResidentStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "      Resident/NonResident"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   5760
      TabIndex        =   86
      Tag             =   "11775"
      Top             =   4530
      Width           =   2775
      Begin VB.OptionButton optResident 
         BackColor       =   &H00BFD87E&
         Caption         =   "Resident"
         Height          =   195
         Left            =   120
         TabIndex        =   57
         Tag             =   "2775"
         ToolTipText     =   "Resident"
         Top             =   225
         Value           =   -1  'True
         Width           =   990
      End
      Begin VB.OptionButton optNonResident 
         BackColor       =   &H00BFD87E&
         Caption         =   "Non Resident"
         Height          =   195
         Left            =   1200
         TabIndex        =   58
         Tag             =   "2775"
         ToolTipText     =   "Non Resident"
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   255
      Left            =   4560
      TabIndex        =   169
      Top             =   75
      Width           =   1020
   End
   Begin VB.Label lblOtherIndividualDetails1 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Individual Customer Details-Page 1"
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
      TabIndex        =   168
      Top             =   0
      Width           =   4230
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
      Left            =   8040
      TabIndex        =   167
      Top             =   75
      Width           =   3405
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
      TabIndex        =   166
      Top             =   8115
      Visible         =   0   'False
      Width           =   615
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
      Left            =   3285
      TabIndex        =   165
      Top             =   2625
      Width           =   1215
   End
   Begin VB.Label lblLangPref 
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
      Left            =   0
      TabIndex        =   164
      Top             =   2625
      Width           =   855
   End
   Begin VB.Label lblTitleCode 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Title Code"
      BeginProperty Font 
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
      Left            =   7575
      TabIndex        =   163
      Top             =   2655
      Width           =   885
   End
   Begin VB.Shape Shape2 
      Height          =   375
      Left            =   120
      Top             =   0
      Width           =   11850
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
      Left            =   6000
      TabIndex        =   161
      Top             =   75
      Width           =   1845
   End
   Begin VB.Shape Shape1 
      Height          =   480
      Left            =   45
      Top             =   7965
      Width           =   11580
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   45
      X2              =   11565
      Y1              =   6615
      Y2              =   6615
   End
   Begin VB.Label lblVip 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
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
      Height          =   195
      Left            =   9495
      TabIndex        =   110
      Tag             =   "11775"
      Top             =   4200
      Visible         =   0   'False
      Width           =   315
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
      Left            =   8640
      TabIndex        =   109
      Tag             =   "11775"
      Top             =   4695
      Width           =   1245
   End
   Begin VB.Label lblMaritalStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "Marital Status"
      BeginProperty Font 
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
      Left            =   45
      TabIndex        =   108
      Tag             =   "11775"
      Top             =   4680
      Width           =   1320
   End
   Begin VB.Label lblDependents 
      BackColor       =   &H00BFD87E&
      Caption         =   "Dependents"
      BeginProperty Font 
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
      TabIndex        =   107
      Tag             =   "11775"
      Top             =   4710
      Width           =   1440
   End
   Begin VB.Label lblGender 
      BackColor       =   &H00BFD87E&
      Caption         =   "Gender"
      BeginProperty Font 
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
      Left            =   6615
      TabIndex        =   106
      Tag             =   "11775"
      Top             =   4185
      Width           =   615
   End
   Begin VB.Label lblDateOfBirth 
      BackColor       =   &H00BFD87E&
      Caption         =   "Date of Birth"
      BeginProperty Font 
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
      Left            =   3255
      TabIndex        =   105
      Top             =   4185
      Width           =   1455
   End
   Begin VB.Label lblDOBDateType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Date of birth"
      BeginProperty Font 
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
      Left            =   45
      TabIndex        =   104
      Tag             =   "11775"
      Top             =   4185
      Width           =   1215
   End
   Begin VB.Line Line6 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   60
      X2              =   11580
      Y1              =   765
      Y2              =   765
   End
   Begin VB.Label Label8 
      BackColor       =   &H00BFD87E&
      Caption         =   "Terms and Conditions:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   240
      Left            =   600
      TabIndex        =   94
      Top             =   27300
      Width           =   2565
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
      Left            =   5850
      TabIndex        =   92
      Top             =   420
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
      Left            =   75
      TabIndex        =   91
      Top             =   420
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
      Left            =   3330
      TabIndex        =   90
      Top             =   420
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
      Left            =   9690
      TabIndex        =   89
      Top             =   420
      Width           =   495
   End
   Begin VB.Line Line4 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   150
      X2              =   11670
      Y1              =   12120
      Y2              =   12120
   End
End
Attribute VB_Name = "frmIndividualOthers"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmbAltBrCode1_LostFocus()
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

Private Sub cmbAltBrCode_Validate(Cancel As Boolean)
   Dim i As Integer
   Dim tCode As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
        Cancel = False
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
              Cancel = True
              Exit Sub
           End If
             
           If i > cmbAltBrCode.ListCount Then
              MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
              cmbAltBrCode.SetFocus
              Cancel = True
           End If
        End If
        On Error GoTo 0
   End If
End Sub

Private Sub cmbBranchCode_LostFocus1()
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

Private Sub cmbBusinessType_LostFocus1()
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

Private Sub cmbBranchCode_Validate(Cancel As Boolean)
   Dim i As Integer
   Dim tCode As String
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      Cancel = False
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
            Cancel = True
            Exit Sub
         End If
             
         If i > cmbBranchCode.ListCount Then
            MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
            cmbBranchCode.SetFocus
            Cancel = True
         End If
      End If
      On Error GoTo 0
   End If
End Sub

Private Sub cmbBusinessType_Validate(Cancel As Boolean)
  Dim i As Integer
  Dim tCode As String

  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     Cancel = False
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
            Cancel = True
            Exit Sub
         End If
         If i > cmbBusinessType.ListCount Then
            MsgBox errInvalidBusinessType(UserLang)
            cmbBusinessType.SetFocus
            Cancel = True
         End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub cmbCountry_LostFocus1()
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
                cmbCountry.ListIndex = i
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

Private Sub cmbCountry_Validate(Cancel As Boolean)
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbCountry.text)) <> 0 Then
         tCode = Mid$(cmbCountry.text, 1, 3)
         For i = 0 To cmbCountry.ListCount
             If Mid$(cmbCountry.List(i), 1, 3) = tCode Then
                cmbCountry.ListIndex = i
                Exit For
             End If
         Next i
      End If
      If i > cmbCountry.ListCount Then
         MsgBox errInvalidCountry(UserLang)
         cmbCountry.SetFocus
         Cancel = True
      End If
   End If
   On Error GoTo 0
End If

End Sub

Private Sub cmbDobDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbDobDate.text)) <> 0 Then
         If Len(cmbDobDate.text) = 2 Then
            If cmbDobDate < 1 Or _
               cmbDobDate > IIf(optDOBGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbDobDate.text = ""
               cmbDobDate.SetFocus
            Else
               On Error Resume Next
               cmbDobMonth.SetFocus
               On Error GoTo 0
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbDobDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbDobMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbDobMonth.text)) <> 0 Then
         If Len(cmbDobMonth.text) = 2 Then
            If cmbDobMonth < 1 Or cmbDobMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbDobMonth.text = ""
               cmbDobMonth.SetFocus
            Else
               On Error Resume Next
               txtDobYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbDOBMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIqamaExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIqamaExpiryDate.text)) <> 0 Then
         If Len(cmbIqamaExpiryDate) = 2 Then
            If cmbIqamaExpiryDate < 1 Or _
               cmbIqamaExpiryDate > IIf(optIqamaDateGregorian.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIqamaExpiryDate.text = ""
               cmbIqamaExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbIqamaExpiryMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbIqamaExpiryDate_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errOnlyNumeralsAllowed(UserLang))
        Exit Sub
    End If
End Sub

Private Sub cmbIqamaExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIqamaExpiryMonth.text)) <> 0 Then
         If Len(cmbIqamaExpiryMonth.text) = 2 Then
            If cmbIqamaExpiryMonth < 1 Or cmbIqamaExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIqamaExpiryMonth.text = ""
               cmbIqamaExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtIqamaExpiryYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbIdExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIqamaExpiryMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIqamaIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIqamaIssueDate.text)) <> 0 Then
         If Len(cmbIqamaIssueDate.text) = 2 Then
            If cmbIqamaIssueDate < 1 Or _
               cmbIqamaIssueDate > IIf(optIqamaDateGregorian.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIqamaIssueDate.text = ""
               cmbIqamaIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbIqamaIssueMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbIqamaIssueDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIqamaIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIqamaIssueMonth.text)) <> 0 Then
         If Len(cmbIqamaIssueMonth.text) = 2 Then
            If cmbIqamaIssueMonth < 1 Or cmbIqamaIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIqamaIssueMonth.text = ""
               cmbIqamaIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtIqamaIssueYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbIqamaIssueMonth_KeyPress(KeyAscii As Integer)
   If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If
End Sub

Private Sub cmbNationality_LostFocus1()
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
                cmbNationality.ListIndex = i
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

Private Sub cmbNationality_Validate(Cancel As Boolean)
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbNationality.text)) <> 0 Then
         tCode = Mid$(cmbNationality.text, 1, 3)
         For i = 0 To cmbNationality.ListCount
             If Mid$(cmbNationality.List(i), 1, 3) = tCode Then
                cmbNationality.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceNationality(UserLang)
         cmbNationality.SetFocus
         Cancel = True
         Exit Sub
      End If
    
      If i > cmbNationality.ListCount Then
         MsgBox errIncorrectNationality(UserLang)
         cmbNationality.SetFocus
         Cancel = True
      End If
    End If
    On Error GoTo 0
End If

End Sub

Private Sub cmbppExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbPpExpiryDate.text)) <> 0 Then
         If Len(cmbPpExpiryDate.text) = 2 Then
            If cmbPpExpiryDate < 1 Or _
               cmbPpExpiryDate > IIf(optPpDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbPpExpiryDate.text = ""
               cmbPpExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbPpExpiryMonth.SetFocus
               On Error GoTo 0
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
      If Len(RTrim(cmbPpExpiryMonth.text)) <> 0 Then
         If Len(cmbPpExpiryMonth.text) = 2 Then
            If cmbPpExpiryMonth < 1 Or cmbPpExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbPpExpiryMonth.text = ""
               cmbPpExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtPpExpiryYear.SetFocus
               On Error GoTo 0
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
      If Len(RTrim(cmbPpIssueDate.text)) <> 0 Then
         If Len(cmbPpIssueDate.text) = 2 Then
            If cmbPpIssueDate < 1 Or _
               cmbPpIssueDate > IIf(optPpDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbPpIssueDate.text = ""
               cmbPpIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbPpIssueMonth.SetFocus
               On Error GoTo 0
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
      If Len(RTrim(cmbPpIssueMonth.text)) <> 0 Then
         If Len(cmbPpIssueMonth.text) = 2 Then
            If cmbPpIssueMonth < 1 Or cmbPpIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbPpIssueMonth.text = ""
               cmbPpIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtPpIssueYear.SetFocus
               On Error GoTo 0
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

Private Sub cmbTitle_Click()
   If Mid$(cmbTitle.text, 1, 2) = "02" Or _
      Mid$(cmbTitle.text, 1, 2) = "03" Or _
      Mid$(cmbTitle.text, 1, 2) = "06" Or _
      Mid$(cmbTitle.text, 1, 2) = "12" Or _
      Mid$(cmbTitle.text, 1, 2) = "13" Then
      optGenderFemale.Value = True
   Else
      optGenderMale.Value = True
   End If
End Sub

Private Sub cmbTitle_LostFocus1()
Dim tCode As String
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbTitle.text)) <> 0 Then
         tCode = Mid$(cmbTitle.text, 1, 2)
         For i = 0 To cmbTitle.ListCount
             If Mid$(cmbTitle.List(i), 1, 2) = tCode Then
                cmbTitle.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceTitle(UserLang)
         cmbTitle.SetFocus
         Exit Sub
      End If

      If i > cmbTitle.ListCount Then
         MsgBox errIncorrectTitle(UserLang)
         cmbTitle.SetFocus
      End If
   End If
   On Error GoTo 0
End If

End Sub

Private Sub cmbTitle_Validate(Cancel As Boolean)
Dim tCode As String
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbTitle.text)) <> 0 Then
         tCode = Mid$(cmbTitle.text, 1, 2)
         For i = 0 To cmbTitle.ListCount
             If Mid$(cmbTitle.List(i), 1, 2) = tCode Then
                cmbTitle.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceTitle(UserLang)
         cmbTitle.SetFocus
         Cancel = True
         Exit Sub
      End If

      If i > cmbTitle.ListCount Then
         MsgBox errIncorrectTitle(UserLang)
         cmbTitle.SetFocus
         Cancel = True
      End If
   End If
   On Error GoTo 0
End If

End Sub

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

Private Sub cmdCardInfo_Click()
    Dim retStr As String
    If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
        If Len(RTrim(txtCustomerNo)) = 0 Then
           MsgBox errInvalidSearchCriteria(UserLang)
           Exit Sub
        End If
        retStr = searchCard1("00000", "0" & txtCustomerNo, "              ")
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
Private Sub cmdCancel_Click()
    Unload Me
    Unload frmIndividualSaudi2
    Unload frmIndividualOthers2
    Unload frmIndividualOthersAcctInfo
    Unload frmIndividualJoint
    Unload frmCustUpdateHistory
    If supervisorAction Or tellerAction Then
       Unload frmSupervisorApproval
    End If
End Sub

Private Sub cmdNext_Click()
   Dim tCode As String
   Dim tIdType As String, tIdNo As String
   Dim tCustNo As String, custName As String
   Dim newOrUpdate As String

  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If validateIndividualOthers = 1 Then
        Exit Sub
     End If
     
     If updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
        newOrUpdate = "U"
        tCustNo = Format(txtCustomerNo, "!@@@@@@@")
     Else
        newOrUpdate = "N"
        tCustNo = Space(7)
     End If
     tIdType = Space(1)
     tIdNo = Space(15)
     
     If subCategoryCode = "60" Then ' subcategory 60- expat with other dependents;
                                    ' accounts to be validated against passport
        If Len(RTrim(txtPpNumber)) > 0 Then
           tIdType = "P"
           tIdNo = Format(txtPpNumber, "!@@@@@@@@@@@@@@@")
        End If
     ElseIf Len(RTrim(txtIqamaNo)) > 0 Then
        tIdType = "Q"
        tIdNo = Format(txtIqamaNo, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(txtPpNumber)) > 0 Then
        tIdType = "P"
        tIdNo = Format(txtPpNumber, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(txtVisaNo)) > 0 Then
        tIdType = "V"
        tIdNo = Format(txtVisaNo, "!@@@@@@@@@@@@@@@")
     End If
     
     If optLangArabic = True Then
        custName = txtArabFirstName & " " & txtArabic2ndName & " " & _
                   txtArabic3rdName & " " & txtArabLastName
     Else
        custName = txtEngFirstName & " " & txtEnglish2ndName & " " & _
                   txtEnglish3rdName & " " & txtEngLastName
     End If

     cmdNext.Enabled = False
     If checkCustomerExistance(frmIndividualOthers, tIdType, tIdNo, newOrUpdate, tCustNo, custName) = 1 Then
        cmdNext.Enabled = True
        Exit Sub
     End If
     cmdNext.Enabled = True
    
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    
    If subCategoryCode = "63" Then
       frmIndividualSaudi2.Show
    Else
       frmIndividualOthers2.FrameCustomerDetail2.Enabled = True
       frmIndividualOthers2.cmbEducation.Enabled = True
       frmIndividualOthers2.cmbProfession.Enabled = True
       frmIndividualOthers2.cmbPosition.Enabled = True
       frmIndividualOthers2.cmbMonthlyIncome.Enabled = True
       frmIndividualOthers2.cmbSegmentation.Enabled = True
       frmIndividualOthers2.chkCompanyAcc.Enabled = True
       frmIndividualOthers2.chkCompanyTransport.Enabled = True
       frmIndividualOthers2.chkOwnCar.Enabled = True
       frmIndividualOthers2.chkOwnHouse.Enabled = True
       frmIndividualOthers2.chkRentedCar.Enabled = True
       frmIndividualOthers2.chkRentedHouse.Enabled = True
       frmIndividualOthers2.txtEmployerName.Enabled = True
       frmIndividualOthers2.txtEmployerPoBox.Enabled = True
       frmIndividualOthers2.txtEmployerCity.Enabled = True
       frmIndividualOthers2.txtEmployerZipCode.Enabled = True
       frmIndividualOthers2.txtDepartment.Enabled = True
    
       frmIndividualOthers2.txtEmployerName.BackColor = &HFFFFFF
       frmIndividualOthers2.txtEmployerPoBox.BackColor = &HFFFFFF
       frmIndividualOthers2.txtEmployerCity.BackColor = &HFFFFFF
       frmIndividualOthers2.txtEmployerZipCode.BackColor = &HFFFFFF
       frmIndividualOthers2.txtDepartment.BackColor = &HFFFFFF
       frmIndividualOthers2.Show
    End If
End If
CSD_mdiForm.staticStatus.Panels(3).text = " "

If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
   If subCategoryCode = "63" Then
      frmIndividualOthers.MousePointer = vbHourglass
      CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
      frmIndividualSaudi2.Hide
      doReferenceSearch "00000", frmIndividualOthers.txtCustomerNo, Space(4)
      frmIndividualOthers.MousePointer = vbDefault
      CSD_mdiForm.staticStatus.Panels(3).text = " "
      noOfReference = recvReferenceSearchMsg.noOfRecs
      If noOfReference = spaces Then
         noOfReference = "0"
      End If
      For i = 1 To Val(recvReferenceSearchMsg.noOfRecs)
          frmIndividualSaudi2.referenceInfoGrid.Row = i
          frmIndividualSaudi2.referenceInfoGrid.Col = 0
          frmIndividualSaudi2.referenceInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualSaudi2.referenceInfoGrid.text = recvReferenceSearchMsg.details(i).custNo
          frmIndividualSaudi2.referenceInfoGrid.Col = 1
          frmIndividualSaudi2.referenceInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualSaudi2.referenceInfoGrid.text = recvReferenceSearchMsg.details(i).referenceNo
          frmIndividualSaudi2.referenceInfoGrid.Col = 2
          frmIndividualSaudi2.referenceInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualSaudi2.referenceInfoGrid.text = recvReferenceSearchMsg.details(i).custShortName
          frmIndividualSaudi2.referenceInfoGrid.Col = 3
          frmIndividualSaudi2.referenceInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualSaudi2.referenceInfoGrid.text = recvReferenceSearchMsg.details(i).custBranchCode
          frmIndividualSaudi2.referenceInfoGrid.Col = 4
          frmIndividualSaudi2.referenceInfoGrid.CellAlignment = flexAlignLeftCenter
          frmIndividualSaudi2.referenceInfoGrid.text = recvReferenceSearchMsg.details(i).idType & "-" & recvReferenceSearchMsg.details(i).idNo
      Next i
      frmIndividualSaudi2.referenceInfoGrid.Row = 1
      frmIndividualSaudi2.Show
   Else
      frmIndividualOthers2.Show
   End If
 End If
   
End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox recvOtherIndividualMsg.supervisorComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmIndividualOthers, 11800
       frmIndividualOthers.RightToLeft = True
       frameOpenUpdateDetails.RightToLeft = True
    End If
    
    txtSysDate.text = Date
    If Len(RTrim(gDateTime)) = 0 Then
       gDateTime = Space(14)   'Date Time to be used for global
    End If
    
    If activityFlag = "P" And Len(RTrim(branchActionDateTime)) = 0 Then
       branchActionDateTime = Space(14)
    End If
    
    frmIndividualOthers.Caption = frmIndividualOthers1Caption(0, UserLang)
    lblOtherIndividualDetails1.Caption = frmIndividualOthers1Caption(1, UserLang)
    lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
    lblMainCategoryDesc = mainCategoryDesc
    lblSubCategoryDesc = subCategoryDesc
'    lblSubCategory.Caption = frmIndividualOthers1Caption(3, UserLang)
    lblCustNo.Caption = frmIndividualOthers1Caption(4, UserLang)
    lblBranch.Caption = frmIndividualOthers1Caption(5, UserLang)
    lblAltBranchCode.Caption = frmIndividualOthers1Caption(60, UserLang)
    lblSysDate.Caption = frmIndividualOthers1Caption(6, UserLang)
    lblIqamaNo.Caption = frmIndividualOthers1Caption(7, UserLang)
    lblIqamaIssuedAt.Caption = frmIndividualOthers1Caption(8, UserLang)
    lblIqamaDateType.Caption = frmIndividualOthers1Caption(9, UserLang)
    optIqamaDateHijri.Caption = frmIndividualOthers1Caption(10, UserLang)
    optIqamaDateGregorian.Caption = frmIndividualOthers1Caption(11, UserLang)
    lblIqamaIssueDate.Caption = frmIndividualOthers1Caption(12, UserLang)
    lblIqamaExpiryDate.Caption = frmIndividualOthers1Caption(13, UserLang)
    lblPpNumber.Caption = frmIndividualOthers1Caption(14, UserLang)
    lblPpIssueAt.Caption = frmIndividualOthers1Caption(8, UserLang)
    lblPpDateType.Caption = frmIndividualOthers1Caption(9, UserLang)
    optPpDateHijri.Caption = frmIndividualOthers1Caption(10, UserLang)
    optPpDateGreg.Caption = frmIndividualOthers1Caption(11, UserLang)
    lblPpIssueDate.Caption = frmIndividualOthers1Caption(12, UserLang)
    lblPpExpiryDate.Caption = frmIndividualOthers1Caption(13, UserLang)
    lblLangPref.Caption = frmIndividualOthers1Caption(15, UserLang)
    optLangArabic.Caption = frmIndividualOthers1Caption(16, UserLang)
    optLangEnglish.Caption = frmIndividualOthers1Caption(17, UserLang)
    lblNationality.Caption = frmIndividualOthers1Caption(18, UserLang)
    lblTitleCode.Caption = frmIndividualOthers1Caption(19, UserLang)
    lblFirstName.Caption = frmIndividualOthers1Caption(20, UserLang)
    lbl2ndName.Caption = frmIndividualOthers1Caption(21, UserLang)
    lbl3rdName.Caption = frmIndividualOthers1Caption(22, UserLang)
    lblLastName.Caption = frmIndividualOthers1Caption(23, UserLang)
    lblArabicName.Caption = frmIndividualOthers1Caption(24, UserLang)
    lblShortName.Caption = frmIndividualOthers1Caption(25, UserLang)
    lblEnglishName.Caption = frmIndividualOthers1Caption(26, UserLang)
    lblDOBDateType.Caption = frmIndividualOthers1Caption(27, UserLang)
    optDOBHijri.Caption = frmIndividualOthers1Caption(28, UserLang)
    optDOBGreg.Caption = frmIndividualOthers1Caption(29, UserLang)
    lblDateOfBirth.Caption = frmIndividualOthers1Caption(30, UserLang)
    lblGender.Caption = frmIndividualOthers1Caption(31, UserLang)
    optGenderMale.Caption = frmIndividualOthers1Caption(32, UserLang)
    optGenderFemale.Caption = frmIndividualOthers1Caption(33, UserLang)
    lblVip.Caption = frmIndividualOthers1Caption(34, UserLang)
    optVipYes.Caption = frmIndividualOthers1Caption(35, UserLang)
    optVipNo.Caption = frmIndividualOthers1Caption(36, UserLang)
    lblMaritalStatus.Caption = frmIndividualOthers1Caption(37, UserLang)
    optMarried.Caption = frmIndividualOthers1Caption(38, UserLang)
    optSingle.Caption = frmIndividualOthers1Caption(39, UserLang)
    optOthers.Caption = frmIndividualOthers1Caption(40, UserLang)
    lblDependents.Caption = frmIndividualOthers1Caption(41, UserLang)
    frameResidentStatus.Caption = frmIndividualOthers1Caption(42, UserLang)
    optResident.Caption = frmIndividualOthers1Caption(43, UserLang)
    optNonResident.Caption = frmIndividualOthers1Caption(44, UserLang)
    lblBusinessType.Caption = frmIndividualOthers1Caption(45, UserLang)
    lblAddress1.Caption = frmIndividualOthers1Caption(46, UserLang)
    lblPOBox.Caption = frmIndividualOthers1Caption(47, UserLang)
    lblCity.Caption = frmIndividualOthers1Caption(48, UserLang)
    lblZipCode.Caption = frmIndividualOthers1Caption(49, UserLang)
    lblCountry.Caption = frmIndividualOthers1Caption(50, UserLang)
    lblOffPhone.Caption = frmIndividualOthers1Caption(51, UserLang)
    lblResPhone.Caption = frmIndividualOthers1Caption(52, UserLang)
    lblFax.Caption = frmIndividualOthers1Caption(53, UserLang)
    lblMobile.Caption = frmIndividualOthers1Caption(54, UserLang)
    lblPager.Caption = frmIndividualOthers1Caption(55, UserLang)
    lblEmail.Caption = frmIndividualOthers1Caption(56, UserLang)
    cmdNext.Caption = frmIndividualOthers1Caption(57, UserLang)
    cmdCancel.Caption = frmIndividualOthers1Caption(58, UserLang)
    cmdSupervisorComments.Caption = frmIndividualOthers1Caption(59, UserLang)
    cmdCardInfo.Caption = frmIndividualOthers1Caption(61, UserLang)
    cmdAcctInfo.Caption = frmCardDetailsCaption(43, UserLang)
    
    lblVisaNo.Caption = frmIndividualOthers1Caption(62, UserLang)
    lblVisaIssuedAt.Caption = frmIndividualOthers1Caption(8, UserLang)
    lblVisaDateType.Caption = frmIndividualOthers1Caption(9, UserLang)
    optVisaDateHijri.Caption = frmIndividualOthers1Caption(10, UserLang)
    optVisaDateGreg.Caption = frmIndividualOthers1Caption(11, UserLang)
    lblVisaIssueDate.Caption = frmIndividualOthers1Caption(12, UserLang)
    lblVisaExpiryDate.Caption = frmIndividualOthers1Caption(13, UserLang)
    lblIqamaType.Caption = frmIndividualOthers1Caption(63, UserLang)
    optBook.Caption = frmIndividualOthers1Caption(64, UserLang)
    optPlastic.Caption = frmIndividualOthers1Caption(65, UserLang)
        
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
       tCode = Mid$(frmIndividualOthers.cmbAltBrCode, 1, 4)
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
        cmbIqamaIssuedAt.Clear
        cmbPpIssuedAt.Clear
        cmbVisaIssuedAt.Clear
        cmbCity.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbIqamaIssuedAt.AddItem rs("englishname")
              cmbPpIssuedAt.AddItem rs("englishname")
              cmbCity.AddItem rs("englishname")
              cmbVisaIssuedAt.AddItem rs("englishname")
           Else
              cmbIqamaIssuedAt.AddItem rs("arabicname")
              cmbPpIssuedAt.AddItem rs("arabicname")
              cmbCity.AddItem rs("arabicname")
              cmbVisaIssuedAt.AddItem rs("arabicname")
           End If
           rs.MoveNext
        Loop
    End If
    
    Set rs = db.OpenRecordset("select citycode from branchinfo " & _
               " where branchcode = '" & gBranchCode & "'")
    If rs.recordCount > 0 Then
         tCode = rs(0)
         Set rs = db.OpenRecordset("select englishname,arabicname,telareacode from cityinfo " & _
                       " where citycode = '" & tCode & "'")
         If rs.recordCount > 0 Then
             txtOffPhoneCityCode = rs(2)
             txtResPhoneCityCode = rs(2)
             txtFaxCityCode = rs(2)
             If UserLang = ENGLISH Then
                cmbIqamaIssuedAt.text = rs(0)
                cmbPpIssuedAt.text = rs(0)
                cmbCity.text = rs(0)
                cmbVisaIssuedAt.text = rs(0)
             Else
                cmbIqamaIssuedAt.text = rs(1)
                cmbPpIssuedAt.text = rs(1)
                cmbCity.text = rs(1)
                cmbVisaIssuedAt.text = rs(1)
             End If
         Else
            txtOffPhoneCityCode = "01"
            txtResPhoneCityCode = "01"
            txtFaxCityCode = "01"
            cmbIqamaIssuedAt.text = ""
            cmbPpIssuedAt.text = ""
            cmbVisaIssuedAt.text = ""
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
    
    cmbIqamaIssueDate.Clear
    cmbIqamaIssueMonth.Clear
    cmbDobDate.Clear
    cmbDobMonth.Clear
    cmbIqamaExpiryDate.Clear
    cmbIqamaExpiryMonth.Clear
    cmbPpIssueDate.Clear
    cmbPpIssueMonth.Clear
    cmbPpExpiryDate.Clear
    cmbPpExpiryMonth.Clear
    cmbVisaIssueDate.Clear
    cmbVisaIssueMonth.Clear
    cmbVisaExpiryDate.Clear
    cmbVisaExpiryMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbIqamaIssueDate.AddItem num
       cmbDobDate.AddItem num
       cmbIqamaExpiryDate.AddItem num
       cmbPpIssueDate.AddItem num
       cmbPpExpiryDate.AddItem num
       
       cmbVisaIssueDate.AddItem num
       cmbVisaExpiryDate.AddItem num
       If i < 13 Then
          cmbIqamaIssueMonth.AddItem num
          cmbDobMonth.AddItem num
          cmbIqamaExpiryMonth.AddItem num
          cmbPpIssueMonth.AddItem num
          cmbPpExpiryMonth.AddItem num
          cmbVisaIssueMonth.AddItem num
          cmbVisaExpiryMonth.AddItem num
       End If
    Next
   cmbTitle.Clear
   Set rs = db.OpenRecordset("select * from titleinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbTitle.AddItem rs("titlecode") & "-" & rs("englishname")
         Else
            cmbTitle.AddItem rs("titlecode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
     Loop
   End If
   If cmbTitle.ListCount > 1 Then
      cmbTitle.ListIndex = 1
   End If
   frmIndividualOthers.txtCustomerNo = Space(7)
   
   If supervisorAction Or tellerAction Then
       If Len(RTrim(recvOtherIndividualMsg.supervisorComments)) > 0 Then
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
      FramePassportInfo.Enabled = False
      frameVisaInfo.Enabled = False
      frameLang.Enabled = False
      cmbNationality.Enabled = False
      cmbTitle.Enabled = False
      frameDobDateType.Enabled = False
      frameVIP.Enabled = False
      cmbDobDate.Enabled = False
      cmbDobMonth.Enabled = False
      txtDobYear.Enabled = False
      frameResidentStatus.Enabled = False
      cmbBusinessType.Enabled = False
      frameSex.Enabled = False
      frameMaritalStatus.Enabled = False
      txtDependents.Enabled = False
      frameCustomerContactInfo.Enabled = False
      If custHistoryAction Then
         lblHistory.Visible = True
         lblHistory.Refresh
         If Len(RTrim(recvOtherIndividualMsg.supervisorComments)) > 0 Then
            cmdSupervisorComments.Enabled = True
         Else
            cmdSupervisorComments.Enabled = False
         End If
       Else
         lblHistory.Visible = False
       End If
   Else
      cmbAltBrCode.Enabled = True
      frameCustomerName.Enabled = True
      If subCategoryCode = "03" Or subCategoryCode = "08" Or _
         subCategoryCode = "72" Or subCategoryCode = "74" Then
         frameIdInfo.Enabled = False
      Else
         frameIdInfo.Enabled = True
      End If
      FramePassportInfo.Enabled = True
      frameVisaInfo.Enabled = True
      frameLang.Enabled = True
      cmbNationality.Enabled = True
      cmbTitle.Enabled = True
      frameDobDateType.Enabled = True
      If Not (updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U")) Then
         If recvLoginMsg.globalUpdatePriv = "1" Or recvLoginMsg.mainBrEditAllowed = "1" Then
            cmbBranchCode.Enabled = True
         Else
            cmbBranchCode.Enabled = False
         End If
             
         If phoneCustOpenAction Then
            cmbBranchCode.Enabled = True
         End If
         cmdAcctInfo.Enabled = False
         cmdCardInfo.Enabled = False
      End If
      
      If updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
         If recvLoginMsg.custNameUpdAllowed = "1" Then
            frameCustomerName.Enabled = True
            frameLang.Enabled = True
         Else
            frameCustomerName.Enabled = False
            frameLang.Enabled = False
         End If
         If recvLoginMsg.mainBrEditAllowed = "1" And recvOtherIndividualMsg.mainBrCodeUpdAllowed = "1" Then
            cmbBranchCode.Enabled = True
         Else
            cmbBranchCode.Enabled = False
         End If
      End If
      
      If updateAction Then
         If gBranchCode = "0499" Then
            frameVIP.Enabled = True
         Else
            frameVIP.Enabled = False
         End If
      ElseIf tellerAction And recvOtherIndividualMsg.newOrUpdate = "U" Then
         If gBranchCode = "0499" Then
            frameVIP.Enabled = True
         End If
      Else
         frameVIP.Enabled = False
      End If
      cmbDobDate.Enabled = True
      cmbDobMonth.Enabled = True
      txtDobYear.Enabled = True
      frameResidentStatus.Enabled = True
      cmbBusinessType.Enabled = True
      frameSex.Enabled = True
      frameMaritalStatus.Enabled = True
      txtDependents.Enabled = True
      frameCustomerContactInfo.Enabled = True
   End If
   
   If supervisorAction Or tellerAction Or updateAction Then
      cmdAcctInfo.Enabled = False
      cmdCardInfo.Enabled = False
   End If

End Sub

Public Function validateIndividualOthers() As Integer

     Dim tIssueDate As String, tDob As String, tCrDate As String
     Dim tExpiryDate As String
     Dim tCode As String
     Dim tmpCode As String
     Dim mQry As String
     Dim passportMandatory As Boolean
     Dim i As Integer
     Dim customerAge As Integer
     
     validateIndividualOthers = 0
          
     If Len(RTrim(Mid$(frmIndividualOthers.cmbBranchCode, 1, 4))) = 0 Then
        MsgBox errSpaceBranchCode(UserLang)
        validateIndividualOthers = 1
        Exit Function
     Else
        validateIndividualOthers = 0
     End If
     
     If phoneCustOpenAction Then
        If Mid$(frmIndividualOthers.cmbBranchCode, 1, 4) = gBranchCode Then
           MsgBox errBranchCodeShouldBeDifferent(UserLang)
           validateIndividualOthers = 1
           Exit Function
        Else
           validateIndividualOthers = 0
        End If
     End If
     
     mQry = "select realorpseudo from branchinfo where branchcode = '" & Mid$(frmIndividualOthers.cmbBranchCode, 1, 4) & "'"
     Set rs = db.OpenRecordset(mQry)
     If rs.recordCount > 0 Then
        tmpCode = rs(0)
     Else
        tmpCode = "1" 'if error occured in executing the query, then move as real branch
     End If
                
     tCode = Mid$(frmIndividualOthers.cmbAltBrCode, 1, 4)
     If tmpCode = "0" Or tmpCode = "2" Then
        If tCode = "0000" Then
           MsgBox errInvalidAltBrCode(UserLang)
           frmIndividualOthers.cmbAltBrCode.SetFocus
           validateIndividualOthers = 1
           Exit Function
        Else
           validateIndividualOthers = 0
        End If
     End If
             
     For i = 0 To frmIndividualOthers.cmbAltBrCode.ListCount - 1
         If Mid$(frmIndividualOthers.cmbAltBrCode.List(i), 1, 4) = tCode Then
            frmIndividualOthers.cmbAltBrCode.ListIndex = i
            Exit For
         End If
     Next i
     
     If i > frmIndividualOthers.cmbAltBrCode.ListCount Then
         MsgBox errInvalidAltBrCode(UserLang) '"Alternative Branch Code should be a real branch...Please re-enter.."
         frmIndividualOthers.cmbAltBrCode.SetFocus
         validateIndividualOthers = 1
         Exit Function
     Else
        validateIndividualOthers = 0
     End If
     
     If subCategoryCode = "04" Or subCategoryCode = "05" Or subCategoryCode = "07" Or _
        subCategoryCode = "61" Or subCategoryCode = "62" Or subCategoryCode = "70" Or _
        subCategoryCode = "60" Or subCategoryCode = "63" Then
        
        If Len(RTrim(frmIndividualOthers.txtIqamaNo)) = 0 Then
            MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
            frmIndividualOthers.txtIqamaNo.SetFocus
            validateIndividualOthers = 1
            Exit Function
         Else
            validateIndividualOthers = 0
         End If
     End If
     
     If subCategoryCode <> "03" And subCategoryCode <> "08" And _
        subCategoryCode <> "72" And subCategoryCode <> "74" Then
         If Len(RTrim(txtIqamaNo)) > 0 Then
             If Len(RTrim(frmIndividualOthers.txtIqamaNo)) <> 10 Then
                MsgBox errInvalidId(UserLang)
                txtIqamaNo.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
             
             If Mid$(frmIndividualOthers.txtIqamaNo, 1, 1) <> "2" And _
                Mid$(frmIndividualOthers.txtIqamaNo, 1, 1) <> "3" And _
                Mid$(frmIndividualOthers.txtIqamaNo, 1, 1) <> "5" Then
                MsgBox errInvalidIdCategory(UserLang)
                txtIqamaNo.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
             
             If validIdNumber(frmIndividualOthers.txtIqamaNo) = False Then
                MsgBox errInvalidIdNo(UserLang)
                txtIqamaNo.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
             
             If Len(RTrim(frmIndividualOthers.cmbIqamaIssueDate.text)) = 0 Or _
                Len(RTrim(frmIndividualOthers.cmbIqamaIssueMonth.text)) = 0 Or _
                Len(RTrim(frmIndividualOthers.txtIqamaIssueYear)) = 0 Then
                MsgBox errSpaceIssueDate(UserLang)
                frmIndividualOthers.cmbIqamaIssueDate.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
                
             If Len(RTrim(frmIndividualOthers.cmbIqamaExpiryDate.text)) = 0 Or _
                Len(RTrim(frmIndividualOthers.cmbIqamaExpiryMonth.text)) = 0 Or _
                Len(RTrim(frmIndividualOthers.txtIqamaExpiryYear)) = 0 Then
                MsgBox errSpaceExpiryDate(UserLang)
                frmIndividualOthers.cmbIqamaExpiryDate.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
                
             tIssueDate = CStr(frmIndividualOthers.txtIqamaIssueYear) & _
                          CStr(frmIndividualOthers.cmbIqamaIssueMonth.text) & _
                          CStr(frmIndividualOthers.cmbIqamaIssueDate.text)
             tExpiryDate = CStr(frmIndividualOthers.txtIqamaExpiryYear) & _
                           CStr(frmIndividualOthers.cmbIqamaExpiryMonth.text) & _
                           CStr(frmIndividualOthers.cmbIqamaExpiryDate.text)
                              
             If frmIndividualOthers.optIqamaDateGregorian.Value = True Then
                If Not validDate(tIssueDate) Then
                   MsgBox errInvalidDate(UserLang)
                   frmIndividualOthers.cmbIqamaIssueDate.SetFocus
                   validateIndividualOthers = 1
                   Exit Function
                Else
                   validateIndividualOthers = 0
                End If
                   
                If Not validDate(tExpiryDate) Then
                   MsgBox errInvalidDate(UserLang)
                   frmIndividualOthers.cmbIqamaExpiryDate.SetFocus
                   validateIndividualOthers = 1
                   Exit Function
                Else
                   validateIndividualOthers = 0
                End If
            End If
                              
            If tExpiryDate < tIssueDate Then
               MsgBox errGreaterExpiryYear(UserLang)
               frmIndividualOthers.txtIqamaExpiryYear.SetFocus
               validateIndividualOthers = 1
               Exit Function
            Else
               validateIndividualOthers = 0
            End If
            
            If optIqamaDateHijri = True Then
               If tExpiryDate < currentHijriDate Then
                  MsgBox errExpiryDateLessThanToday(UserLang)
                  txtIqamaExpiryYear.SetFocus
                  validateIndividualOthers = 1
                  Exit Function
               Else
                  validateIndividualOthers = 0
               End If
            Else
               If tExpiryDate < currentGregDate Then
                  MsgBox errExpiryDateLessThanToday(UserLang)
                  txtIqamaExpiryYear.SetFocus
                  validateIndividualOthers = 1
                  Exit Function
               Else
                  validateIndividualOthers = 0
               End If
            End If
                
            If Len(RTrim(frmIndividualOthers.cmbIqamaIssuedAt.text)) = 0 Then
               MsgBox errSpaceIdIssuedAt(UserLang)
               frmIndividualOthers.cmbIqamaIssuedAt.SetFocus
               validateIndividualOthers = 1
               Exit Function
            Else
               validateIndividualOthers = 0
            End If
        End If ' Len(RTrim(txtIqamaNo)) > 0
    End If ' subCategoryCode <> "03" And subCategoryCode <> "08" And subCategoryCode <> "72" And subCategoryCode <> "74" Then
        
    If subCategoryCode = "03" Or subCategoryCode = "04" Or subCategoryCode = "07" Or _
       subCategoryCode = "63" Or subCategoryCode = "60" Or subCategoryCode = "70" Or _
       subCategoryCode = "71" Or subCategoryCode = "74" Then  'GCC citizen/Expatriate/Resident investing in local shares
       passportMandatory = True
       If subCategoryCode = "04" Or subCategoryCode = "07" Then
          If optPlastic = True Then
             passportMandatory = False
          End If
       End If
       If passportMandatory = True Then
          If Len(RTrim(frmIndividualOthers.txtPpNumber)) = 0 Then
             MsgBox errSpacePpNo(UserLang)
             frmIndividualOthers.txtPpNumber.SetFocus
             validateIndividualOthers = 1
             Exit Function
          Else
             validateIndividualOthers = 0
          End If
       End If
    End If ' subCategoryCode = 03, "04" "07" 70 71
    
    If Len(RTrim(frmIndividualOthers.txtPpNumber)) > 0 Then
       If Len(RTrim(frmIndividualOthers.cmbPpIssueDate.text)) = 0 Or _
          Len(RTrim(frmIndividualOthers.cmbPpIssueMonth.text)) = 0 Or _
          Len(RTrim(frmIndividualOthers.txtPpIssueYear)) = 0 Then
          MsgBox errSpaceIssueDate(UserLang)
          frmIndividualOthers.cmbPpIssueDate.SetFocus
          validateIndividualOthers = 1
          Exit Function
       Else
          validateIndividualOthers = 0
       End If
        
        If Len(RTrim(frmIndividualOthers.cmbPpExpiryDate.text)) = 0 Or _
           Len(RTrim(frmIndividualOthers.cmbPpExpiryMonth.text)) = 0 Or _
           Len(RTrim(frmIndividualOthers.txtPpExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           frmIndividualOthers.cmbPpExpiryDate.SetFocus
           validateIndividualOthers = 1
           Exit Function
        Else
           validateIndividualOthers = 0
        End If
            
        tIssueDate = CStr(frmIndividualOthers.txtPpIssueYear) & _
                     CStr(frmIndividualOthers.cmbPpIssueMonth.text) & _
                     CStr(frmIndividualOthers.cmbPpIssueDate.text)
        tExpiryDate = CStr(frmIndividualOthers.txtPpExpiryYear) & _
                      CStr(frmIndividualOthers.cmbPpExpiryMonth.text) & _
                      CStr(frmIndividualOthers.cmbPpExpiryDate.text)
                          
        If frmIndividualOthers.optPpDateGreg.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualOthers.cmbPpIssueDate.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
               
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualOthers.cmbPpExpiryDate.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
                         
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           frmIndividualOthers.txtPpExpiryYear.SetFocus
           validateIndividualOthers = 1
           Exit Function
        Else
           validateIndividualOthers = 0
        End If
        
        If optPpDateHijri = True Then
           If tExpiryDate < currentHijriDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtPpExpiryYear.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        Else
           If tExpiryDate < currentGregDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtPpExpiryYear.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
            
        If Len(RTrim(frmIndividualOthers.cmbPpIssuedAt.text)) = 0 Then
           MsgBox errSpaceIdIssuedAt(UserLang)
           frmIndividualOthers.cmbPpIssuedAt.SetFocus
           validateIndividualOthers = 1
           Exit Function
        Else
           validateIndividualOthers = 0
        End If
    End If  'if len(ppNumber) > 0
    
    If subCategoryCode = "72" Then
       If Len(RTrim(frmIndividualOthers.txtVisaNo)) = 0 Then
          MsgBox errSpaceVisaNo(UserLang)
          frmIndividualOthers.txtVisaNo.SetFocus
          validateIndividualOthers = 1
          Exit Function
       Else
          validateIndividualOthers = 0
       End If
    End If
    
    If Len(RTrim(frmIndividualOthers.txtVisaNo)) > 0 Then
       If Len(RTrim(frmIndividualOthers.cmbVisaIssueDate.text)) = 0 Or _
          Len(RTrim(frmIndividualOthers.cmbVisaIssueMonth.text)) = 0 Or _
          Len(RTrim(frmIndividualOthers.txtVisaIssueYear)) = 0 Then
          MsgBox errSpaceIssueDate(UserLang)
          frmIndividualOthers.cmbVisaIssueDate.SetFocus
          validateIndividualOthers = 1
          Exit Function
       Else
          validateIndividualOthers = 0
       End If
        
        If Len(RTrim(frmIndividualOthers.cmbVisaExpiryDate.text)) = 0 Or _
           Len(RTrim(frmIndividualOthers.cmbVisaExpiryMonth.text)) = 0 Or _
           Len(RTrim(frmIndividualOthers.txtVisaExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           frmIndividualOthers.cmbVisaExpiryDate.SetFocus
           validateIndividualOthers = 1
           Exit Function
        Else
           validateIndividualOthers = 0
        End If
            
        tIssueDate = CStr(frmIndividualOthers.txtVisaIssueYear) & _
                     CStr(frmIndividualOthers.cmbVisaIssueMonth.text) & _
                     CStr(frmIndividualOthers.cmbVisaIssueDate.text)
        tExpiryDate = CStr(frmIndividualOthers.txtVisaExpiryYear) & _
                      CStr(frmIndividualOthers.cmbVisaExpiryMonth.text) & _
                      CStr(frmIndividualOthers.cmbVisaExpiryDate.text)
                          
        If frmIndividualOthers.optVisaDateGreg.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualOthers.cmbVisaIssueDate.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
               
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualOthers.cmbVisaExpiryDate.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
                         
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           frmIndividualOthers.txtVisaExpiryYear.SetFocus
           validateIndividualOthers = 1
           Exit Function
        Else
           validateIndividualOthers = 0
        End If
        
        If optVisaDateHijri = True Then
           If tExpiryDate < currentHijriDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtVisaExpiryYear.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        Else
           If tExpiryDate < currentGregDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtVisaExpiryYear.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
            
        If Len(RTrim(frmIndividualOthers.cmbVisaIssuedAt.text)) = 0 Then
           MsgBox errSpaceIdIssuedAt(UserLang)
           frmIndividualOthers.cmbVisaIssuedAt.SetFocus
           validateIndividualOthers = 1
           Exit Function
        Else
           validateIndividualOthers = 0
        End If
    End If ' if len(visanumber) > 0
   
    If (updateAction Or (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U")) And _
        recvLoginMsg.custNameUpdAllowed <> "1" Then
        ' this empty condition is required to ignore customer name validation
        ' during update & branch is not allowed to update the customer name
    Else
       If frmIndividualOthers.optLangArabic.Value = True Then
           If subCategoryCode = "03" Or subCategoryCode = "05" Or _
              subCategoryCode = "74" Then ' if GCC and Tribal
              If Len(RTrim(frmIndividualOthers.txtArabFirstName)) = 0 Or _
                 Len(RTrim(frmIndividualOthers.txtArabic2ndName)) = 0 Or _
                 Len(RTrim(frmIndividualOthers.txtArabic3rdName)) = 0 Or _
                 Len(RTrim(frmIndividualOthers.txtArabLastName)) = 0 Then
                 MsgBox errAllFourNameReqd(UserLang)
                 frmIndividualOthers.txtArabFirstName.SetFocus
                 validateIndividualOthers = 1
                 Exit Function
              Else
                 validateIndividualOthers = 0
              End If
           Else
              If Len(RTrim(frmIndividualOthers.txtArabFirstName)) = 0 And _
                 Len(RTrim(frmIndividualOthers.txtArabic2ndName)) = 0 And _
                 Len(RTrim(frmIndividualOthers.txtArabic3rdName)) = 0 And _
                 Len(RTrim(frmIndividualOthers.txtArabLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 frmIndividualOthers.txtArabFirstName.SetFocus
                 validateIndividualOthers = 1
                 Exit Function
              Else
                 validateIndividualOthers = 0
              End If
           End If ' for subcategory = 03 or 05 or 74 check
               
           If Len(RTrim(frmIndividualOthers.txtArabShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmIndividualOthers.txtArabShortName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        Else ' the customers' preferred language is english
           If subCategoryCode = "03" Or subCategoryCode = "05" Or _
              subCategoryCode = "74" Then
              If Len(RTrim(frmIndividualOthers.txtEngFirstName)) = 0 Or _
                 Len(RTrim(frmIndividualOthers.txtEnglish2ndName)) = 0 Or _
                 Len(RTrim(frmIndividualOthers.txtEnglish3rdName)) = 0 Or _
                 Len(RTrim(frmIndividualOthers.txtEngLastName)) = 0 Then
                 MsgBox errAllFourNameReqd(UserLang)
                 frmIndividualOthers.txtEngFirstName.SetFocus
                 validateIndividualOthers = 1
                 Exit Function
              Else
                 validateIndividualOthers = 0
              End If
           Else
              If Len(RTrim(frmIndividualOthers.txtEngFirstName)) = 0 And _
                 Len(RTrim(frmIndividualOthers.txtEnglish2ndName)) = 0 And _
                 Len(RTrim(frmIndividualOthers.txtEnglish3rdName)) = 0 And _
                 Len(RTrim(frmIndividualOthers.txtEngLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 frmIndividualOthers.txtEngFirstName.SetFocus
                 validateIndividualOthers = 1
                 Exit Function
              Else
                 validateIndividualOthers = 0
              End If
           End If ' for subcategory = 03 or 05 or 74 check
               
           If Len(RTrim(frmIndividualOthers.txtEngShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmIndividualOthers.txtEngShortName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If ' the customers' preferred language is english
        
        If Len(RTrim(txtArabFirstName)) > 0 Then
           If englishCharFound(txtArabFirstName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabFirstName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtArabic2ndName)) > 0 Then
           If englishCharFound(txtArabic2ndName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabic2ndName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtArabic3rdName)) > 0 Then
           If englishCharFound(txtArabic3rdName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabic3rdName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtArabLastName)) > 0 Then
           If englishCharFound(txtArabLastName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabLastName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtArabShortName)) > 0 Then
           If englishCharFound(txtArabShortName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabShortName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtEngFirstName)) > 0 Then
           If arabicCharFound(txtEngFirstName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngFirstName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtEnglish2ndName)) > 0 Then
           If arabicCharFound(txtEnglish2ndName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEnglish2ndName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtEnglish3rdName)) > 0 Then
           If arabicCharFound(txtEnglish3rdName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEnglish3rdName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtEngLastName)) > 0 Then
           If arabicCharFound(txtEngLastName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngLastName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    
        If Len(RTrim(txtEngShortName)) > 0 Then
           If arabicCharFound(txtEngShortName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngShortName.SetFocus
              validateIndividualOthers = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
        End If
    End If ' the user is having access to change the customers' name
    
    If subCategoryCode <> "05" Then
       If Mid$(frmIndividualOthers.cmbNationality, 1, 3) = "001" Then
          MsgBox errInvalidNationality(UserLang)
          frmIndividualOthers.cmbNationality.SetFocus
          validateIndividualOthers = 1
          Exit Function
       Else
          validateIndividualOthers = 0
       End If
    End If
          
    If frmIndividualOthers.optLangArabic.Value = True Then
       If frmIndividualOthers.optPoBox = True Then
          If Len(RTrim(frmIndividualOthers.txtAddress1)) <> 0 Then
             If englishCharFound(frmIndividualOthers.txtAddress1) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualOthers.txtAddress1.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
          End If
       
          If Len(RTrim(frmIndividualOthers.txtAddress2)) <> 0 Then
             If englishCharFound(frmIndividualOthers.txtAddress2) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualOthers.txtAddress2.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
          End If
       Else ' Saudi Post address
          If Len(RTrim(frmIndividualOthers.txtSaudiPostStreetName)) <> 0 Then
             If englishCharFound(frmIndividualOthers.txtSaudiPostStreetName) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualOthers.txtSaudiPostStreetName.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
          End If
       End If

       If englishCharFound(frmIndividualOthers.cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                              frmIndividualOthers.cmbCity.text & "'")
          If rs.recordCount > 0 Then
             frmIndividualOthers.cmbCity.text = rs(0)
          Else
             MsgBox errLangNotmatching(UserLang)
             frmIndividualOthers.cmbCity.SetFocus
             validateIndividualOthers = 1
             Exit Function
          End If
      End If
    Else    ' if the language is english
       If frmIndividualOthers.optPoBox = True Then
          If Len(RTrim(frmIndividualOthers.txtAddress1)) <> 0 Then
             If arabicCharFound(frmIndividualOthers.txtAddress1) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualOthers.txtAddress1.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
          End If
         
          If Len(RTrim(frmIndividualOthers.txtAddress2)) <> 0 Then
             If arabicCharFound(frmIndividualOthers.txtAddress2) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualOthers.txtAddress2.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
          End If
       Else ' Saudi Post address
          If Len(RTrim(frmIndividualOthers.txtSaudiPostStreetName)) <> 0 Then
             If arabicCharFound(frmIndividualOthers.txtSaudiPostStreetName) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualOthers.txtSaudiPostStreetName.SetFocus
                validateIndividualOthers = 1
                Exit Function
             Else
                validateIndividualOthers = 0
             End If
          End If
       End If
       If arabicCharFound(frmIndividualOthers.cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                             frmIndividualOthers.cmbCity.text & "'")
          If rs.recordCount > 0 Then
             frmIndividualOthers.cmbCity.text = rs(0)
          Else
             MsgBox errLangNotmatching(UserLang)
             frmIndividualOthers.cmbCity.SetFocus
             validateIndividualOthers = 1
             Exit Function
          End If
      End If
    End If
    
    If Len(RTrim(frmIndividualOthers.cmbTitle.text)) = 0 Then
       MsgBox errSpaceTitle(UserLang)
       frmIndividualOthers.cmbTitle.SetFocus
       validateIndividualOthers = 1
       Exit Function
    Else
       validateIndividualOthers = 0
    End If
    
    If Len(RTrim(frmIndividualOthers.cmbNationality.text)) = 0 Then
       MsgBox errSpaceNationality(UserLang)
       frmIndividualOthers.cmbNationality.SetFocus
       validateIndividualOthers = 1
       Exit Function
    Else
       validateIndividualOthers = 0
    End If
      
    If Len(RTrim(frmIndividualOthers.cmbDobDate.text)) = 0 Or _
       Len(RTrim(frmIndividualOthers.cmbDobMonth.text)) = 0 Or _
       Len(RTrim(frmIndividualOthers.txtDobYear.text)) = 0 Then
       MsgBox errSpaceDob(UserLang) '"Date of Birth Should be entered...Please enter "
       frmIndividualOthers.cmbDobDate.SetFocus
       validateIndividualOthers = 1
       Exit Function
    Else
       validateIndividualOthers = 0
    End If
    tDob = CStr(frmIndividualOthers.txtDobYear) & _
           CStr(frmIndividualOthers.cmbDobMonth.text) & _
           CStr(frmIndividualOthers.cmbDobDate.text)
           
    If frmIndividualOthers.optDOBGreg.Value = True Then
       If Not validDate(tDob) Then
          MsgBox errInvalidDate(UserLang)
          frmIndividualOthers.cmbDobDate.SetFocus
          validateIndividualOthers = 1
          Exit Function
       Else
          validateIndividualOthers = 0
       End If
    End If
    
    If optDOBHijri = True Then
      If tDob > currentHijriDate Then
         MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
         txtDobYear.SetFocus
         validateIndividualOthers = 1
         Exit Function
      Else
         validateIndividualOthers = 0
      End If
   Else
      If tDob > currentGregDate Then
         MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
         txtDobYear.SetFocus
         validateIndividualOthers = 1
         Exit Function
      Else
         validateIndividualOthers = 0
      End If
   End If
   
   customerAge = getCustomerAge(tDob, IIf(optDOBGreg, "1", "0"))
   
   If customerAge > Val(recvLoginMsg.maxAgeLimit) Then
      MsgBox errCustAgeExceedLimit(UserLang) & recvLoginMsg.maxAgeLimit & "  " & errYears(UserLang)
      validateIndividualOthers = 1
      Exit Function
   Else
      validateIndividualOthers = 0
   End If
        
   If Len(RTrim(frmIndividualOthers.cmbBusinessType.text)) = 0 Then
      MsgBox errSpaceBusType(UserLang)
      frmIndividualOthers.cmbBusinessType.SetFocus
      validateIndividualOthers = 1
      Exit Function
   Else
      validateIndividualOthers = 0
   End If
    
   If frmIndividualOthers.optPoBox = True Then
      If Len(RTrim(frmIndividualOthers.txtAddress1)) = 0 Or _
         Len(RTrim(frmIndividualOthers.txtPOBox)) = 0 Or _
         Len(RTrim(frmIndividualOthers.txtPinCode)) = 0 Or _
         Len(RTrim(frmIndividualOthers.cmbCity.text)) = 0 Then
         
         MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
         frmIndividualOthers.txtAddress1.SetFocus
         validateIndividualOthers = 1
         Exit Function
      Else
         validateIndividualOthers = 0
      End If
      
      If Trim(txtPOBox) = "0" Or _
         Trim(txtPinCode) = "0" Then
         MsgBox errPoOrZipCannotBeZero(UserLang)
         txtPOBox.SetFocus
         validateIndividualOthers = 1
         Exit Function
      Else
         validateIndividualOthers = 0
      End If
   Else ' saudi postal address
      If Len(RTrim(frmIndividualOthers.txtSaudiPostGPSNo)) = 0 Or _
         Len(RTrim(frmIndividualOthers.txtSaudiPostStreetName)) = 0 Or _
         Len(RTrim(frmIndividualOthers.txtSaudiPostUnit)) = 0 Or _
         Len(RTrim(frmIndividualOthers.cmbCity.text)) = 0 Or _
         Len(RTrim(frmIndividualOthers.txtSaudiPostZipCode)) = 0 Or _
         Len(RTrim(frmIndividualOthers.txtSaudiPostAdditionalNo)) = 0 Then
         MsgBox errSpaceSaudiAddress(UserLang) '"Saudi Postal address should be entered.. Please enter"
         frmIndividualOthers.txtSaudiPostGPSNo.SetFocus
         validateIndividualOthers = 1
         Exit Function
      Else
         validateIndividualOthers = 0
      End If
   End If
   
   If Len(RTrim(frmIndividualOthers.txtResPhoneNo)) = 0 And _
      Len(RTrim(frmIndividualOthers.txtOffPhoneNo)) = 0 And _
      Len(RTrim(frmIndividualOthers.txtFaxNo)) = 0 And _
      Len(RTrim(frmIndividualOthers.txtMobileNo)) = 0 Then
      
      MsgBox errSpacePhone(UserLang) ' "Atleast one Phone number should be entered..."
      frmIndividualOthers.txtOffPhoneNo.SetFocus
      validateIndividualOthers = 1
      Exit Function
   Else
      validateIndividualOthers = 0
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

Private Sub framePassportInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optDOBGreg_Click()
  If cmbDobDate.ListCount = 30 Then
     cmbDobDate.AddItem 31
  End If
  cmbDobDate = ""
  cmbDobMonth = ""
  txtDobYear = ""
End Sub

Private Sub optDOBHijri_Click()
  If cmbDobDate.ListCount = 31 Then
     cmbDobDate.RemoveItem 30
  End If
  cmbDobDate = ""
  cmbDobMonth = ""
  txtDobYear = ""
End Sub

Private Sub optGenderFemale_Click()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Mid$(cmbTitle.text, 1, 2) <> "02" And _
       Mid$(cmbTitle.text, 1, 2) <> "03" And _
       Mid$(cmbTitle.text, 1, 2) <> "06" And _
       Mid$(cmbTitle.text, 1, 2) <> "12" And _
       Mid$(cmbTitle.text, 1, 2) <> "13" Then
       MsgBox errInvalidTitle(UserLang)
       optGenderMale.Value = True
    End If
 End If
End Sub

Private Sub optGenderMale_Click()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Mid$(cmbTitle.text, 1, 2) = "02" Or _
       Mid$(cmbTitle.text, 1, 2) = "03" Or _
       Mid$(cmbTitle.text, 1, 2) = "06" Or _
       Mid$(cmbTitle.text, 1, 2) = "12" Or _
       Mid$(cmbTitle.text, 1, 2) = "13" Then
       MsgBox errInvalidTitle(UserLang)
       optGenderFemale.Value = True
    End If
 End If

End Sub

Private Sub optIqamaDateGregorian_Click()
   If cmbIqamaIssueDate.ListCount = 30 Then
      cmbIqamaIssueDate.AddItem 31
      cmbIqamaExpiryDate.AddItem 31
   End If
   cmbIqamaIssueDate = ""
   cmbIqamaIssueMonth = ""
   txtIqamaIssueYear = ""
   cmbIqamaExpiryDate = ""
   cmbIqamaExpiryMonth = ""
   txtIqamaExpiryYear = ""
End Sub

Private Sub optIqamaDateHijri_Click()
  If cmbIqamaIssueDate.ListCount = 31 Then
     cmbIqamaIssueDate.RemoveItem 30
     cmbIqamaExpiryDate.RemoveItem 30
  End If
  cmbIqamaIssueDate = ""
  cmbIqamaIssueMonth = ""
  txtIqamaIssueYear = ""
  cmbIqamaExpiryDate = ""
  cmbIqamaExpiryMonth = ""
  txtIqamaExpiryYear = ""
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
  If cmbPpIssueDate.ListCount = 30 Then
     cmbPpIssueDate.AddItem 31
     cmbPpExpiryDate.AddItem 31
  End If
  cmbPpIssueDate = ""
  cmbPpIssueMonth = ""
  txtPpIssueYear = ""
  cmbPpExpiryDate = ""
  cmbPpExpiryMonth = ""
  txtPpExpiryYear = ""
End Sub

Private Sub optppDateHijri_Click()
  If cmbPpIssueDate.ListCount = 31 Then
     cmbPpIssueDate.RemoveItem 30
     cmbPpExpiryDate.RemoveItem 30
  End If
  cmbPpIssueDate = ""
  cmbPpIssueMonth = ""
  txtPpIssueYear = ""
  cmbPpExpiryDate = ""
  cmbPpExpiryMonth = ""
  txtPpExpiryYear = ""
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

Private Sub txtArabic3rdName_KeyPress(KeyAscii As Integer)
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

Private Sub txtArabLastName_KeyPress(KeyAscii As Integer)
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
     txtArabShortName = txtArabLastName + " " + txtArabFirstName
     If Len(txtArabShortName) + Len(txtArabic2ndName) < 30 Then
        txtArabShortName = txtArabShortName + " " + txtArabic2ndName
        If Len(txtArabShortName) + Len(txtArabic3rdName) < 30 Then
           txtArabShortName = txtArabShortName + " " + txtArabic3rdName
        End If
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

Private Sub txtDobYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtDobYear_LostFocus()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
        On Error Resume Next
        If Len(RTrim(cmbDobDate)) > 0 And Len(RTrim(cmbDobMonth)) > 0 Then
           If Len(RTrim(txtDobYear)) <> 4 Then
              MsgBox errEnterValidYear(UserLang)
              txtDobYear.text = ""
              txtDobYear.SetFocus
              Exit Sub
           End If
        End If
        If Len(RTrim(txtDobYear)) <> 0 Then
           If optDOBHijri.Value = True Then
              If txtDobYear > 1600 Then
                 MsgBox errEnterValidYear(UserLang) ' "Enter a valid Year"
                 txtDobYear.text = ""
                 txtDobYear.SetFocus
                 Exit Sub
              End If
           Else
              If txtDobYear < 1600 Then
                 MsgBox errEnterValidYear(UserLang) ' "Enter a valid Year"
                 txtDobYear.text = ""
                 txtDobYear.SetFocus
                 Exit Sub
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


Private Sub txtEngLastName_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEngLastName_LostFocus()
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEngLastName)) > 0 Then
         tmpStr = Trim(txtEngLastName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngLastName = tmpStr
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

Private Sub txtEnglish3rdName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
        KeyAscii = 0
        MsgBox (errNoArabicCharacters(UserLang))
        Exit Sub
    End If
End Sub

Private Sub txtEnglish3rdName_LostFocus()
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEnglish3rdName)) > 0 Then
         tmpStr = Trim(txtEnglish3rdName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEnglish3rdName = tmpStr
      End If
   End If
End Sub

Private Sub txtEngShortName_GotFocus()
 If Not searchAction And Not custHistoryAction Then
   txtEngShortName = txtEngLastName + " " + txtEngFirstName
   If Len(txtEngShortName) + Len(txtEnglish2ndName) < 30 Then
       txtEngShortName = txtEngShortName + " " + txtEnglish2ndName
       If Len(txtEngShortName) + Len(txtEnglish3rdName) < 30 Then
           txtEngShortName = txtEngShortName + " " + txtEnglish3rdName
       End If
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

Private Sub txtEngshortName_LostFocus()
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEngLastName)) > 0 Then
         tmpStr = Trim(txtEngLastName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngLastName = tmpStr
      End If
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
            MsgBox errInvalidFaxNo(UserLang) '"Fax Number should contain atleast 7 digits..Please RE-try"
            txtFaxNo.SetFocus
         End If
      End If
   End If
   On Error GoTo 0
 End If

End Sub

Private Sub txtIqamaExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtIqamaExpiryYear_LostFocus()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
       On Error Resume Next
       If Len(RTrim(cmbIqamaExpiryDate)) > 0 And Len(RTrim(cmbIqamaExpiryMonth)) > 0 Then
          If Len(RTrim(txtIqamaExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtIqamaExpiryYear.text = ""
             txtIqamaExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       If optIqamaDateHijri.Value = True Then
          If Len(RTrim(txtIqamaExpiryYear)) <> 0 Then
             If txtIqamaExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                frameIdInfo.Enabled = True
                If txtIqamaExpiryYear.Enabled = True Then
                   txtIqamaExpiryYear.text = ""
                   txtIqamaExpiryYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtIqamaExpiryYear.Enabled = True
                   txtIqamaExpiryYear.text = ""
                   txtIqamaExpiryYear.SetFocus
                End If
             End If
          End If
       Else
          If Len(RTrim(txtIqamaExpiryYear)) <> 0 Then
             If txtIqamaExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIqamaExpiryYear.Enabled = True Then
                   txtIqamaExpiryYear.text = ""
                   txtIqamaExpiryYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtIqamaExpiryYear.Enabled = True
                   txtIqamaExpiryYear.text = ""
                   txtIqamaExpiryYear.SetFocus
                End If
             End If
          End If
       End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtIqamaIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIqamaIssueYear)) <> 0 Then
        If Len(txtIqamaIssueYear) = 4 Then
           cmbIqamaExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtIqamaIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtIqamaIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       On Error Resume Next
       If Len(RTrim(cmbIqamaIssueDate)) > 0 And Len(RTrim(cmbIqamaIssueMonth)) > 0 Then
          If Len(RTrim(txtIqamaIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtIqamaIssueYear.text = ""
             txtIqamaIssueYear.SetFocus
             Exit Sub
          End If
       End If
       If Len(RTrim(txtIqamaIssueYear)) <> 0 Then
          If optIqamaDateHijri.Value = True Then
             If txtIqamaIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIqamaIssueYear.Enabled = True Then
                   txtIqamaIssueYear.text = ""
                   txtIqamaIssueYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtIqamaIssueYear.Enabled = True
                   txtIqamaIssueYear.text = ""
                   txtIqamaIssueYear.SetFocus
                End If
             End If
          Else
             If txtIqamaIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIqamaIssueYear.Enabled = True Then
                   txtIqamaIssueYear.text = ""
                   txtIqamaIssueYear.SetFocus
                Else
                   txtIqamaIssueYear.Enabled = True
                   txtIqamaIssueYear.text = ""
                   txtIqamaIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If
End Sub

Private Sub txtIqamaNo_KeyPress(KeyAscii As Integer)
 If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
     KeyAscii = 0
     MsgBox (errOnlyNumeralsAllowed(UserLang))
     Exit Sub
 End If
End Sub

Private Sub txtIqamaNo_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       On Error Resume Next
       ' commented by Rajesh on 6th June 2007 as it is handled in validateFrmIndividualOthers
'       If Len(Trim(txtIqamaNo)) <> 10 Then
'          MsgBox errInvalidId(UserLang)
'          txtIqamaNo.SetFocus
'          Exit Sub
'       End If
       On Error GoTo 0
    End If
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

Private Sub txtppExpiryYear_KeyPress(KeyAscii As Integer)
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
       If Len(RTrim(cmbPpExpiryDate)) > 0 And Len(RTrim(cmbPpExpiryMonth)) > 0 Then
          If Len(RTrim(txtPpExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtPpExpiryYear.text = ""
             txtPpExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtPpExpiryYear)) <> 0 Then
          If optPpDateHijri.Value = True Then
             If txtPpExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPpExpiryYear.Enabled = True Then
                   txtPpExpiryYear.text = ""
                   txtPpExpiryYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtPpExpiryYear.Enabled = True
                   txtPpExpiryYear.text = ""
                   txtPpExpiryYear.SetFocus
                End If
             End If
          Else
             If txtPpExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPpExpiryYear.Enabled = True Then
                   txtPpIssueYear.text = ""
                   txtPpExpiryYear.SetFocus
                Else
                   txtPpExpiryYear.Enabled = True
                   txtPpExpiryYear.text = ""
                   txtPpExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtppIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtPpIssueYear)) <> 0 Then
        If Len(txtPpIssueYear) = 4 Then
           cmbPpExpiryDate.SetFocus
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

Private Sub txtPPIssueYear_LostFocus()

 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbPpIssueDate)) > 0 And Len(RTrim(cmbPpIssueMonth)) > 0 Then
          If Len(RTrim(txtPpIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtPpIssueYear.text = ""
             txtPpIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtPpIssueYear)) <> 0 Then
          If optPpDateHijri.Value = True Then
             If txtPpIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPpIssueYear.Enabled = True Then
                   txtPpIssueYear.text = ""
                   txtPpIssueYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtPpIssueYear.Enabled = True
                   txtPpIssueYear.text = ""
                   txtPpIssueYear.SetFocus
                End If
             End If
          Else
             If txtPpIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPpIssueYear.Enabled = True Then
                   txtPpIssueYear.text = ""
                   txtPpIssueYear.SetFocus
                Else
                   txtPpIssueYear.Enabled = True
                   txtPpIssueYear.text = ""
                   txtPpIssueYear.SetFocus
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

Private Sub txtSaudiPostStreetName_KeyPress(KeyAscii As Integer)
   If optLangArabic Then
      txtSaudiPostStreetName.Alignment = 1
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
      txtSaudiPostStreetName.Alignment = 0
      If KeyAscii > 128 Then
         KeyAscii = 0
         MsgBox (errNoArabicCharacters(UserLang))
         Exit Sub
      End If
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

