VERSION 5.00
Begin VB.Form frmIndividualSaudi 
   BackColor       =   &H00BFD87E&
   Caption         =   "Individual Saudi Customer Details"
   ClientHeight    =   8370
   ClientLeft      =   15
   ClientTop       =   6975
   ClientWidth     =   11805
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8370
   ScaleWidth      =   11805
   Begin VB.CommandButton cmdAcctInfo 
      Caption         =   "Account"
      Height          =   405
      Left            =   3120
      TabIndex        =   198
      ToolTipText     =   "Account Info"
      Top             =   7920
      Width           =   1575
   End
   Begin VB.CommandButton cmdCardInfo 
      Caption         =   "ATM Card"
      Height          =   405
      Left            =   4680
      TabIndex        =   197
      ToolTipText     =   "ATM Card Info"
      Top             =   7920
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
      Height          =   900
      Left            =   0
      TabIndex        =   174
      Top             =   6960
      Width           =   11820
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
         TabIndex        =   186
         Tag             =   "11820"
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
         TabIndex        =   185
         Tag             =   "11820"
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
         TabIndex        =   184
         Tag             =   "11820"
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
         TabIndex        =   183
         Tag             =   "11820"
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
         TabIndex        =   182
         Tag             =   "11820"
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
         TabIndex        =   181
         Tag             =   "11820"
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
         TabIndex        =   180
         Tag             =   "11820"
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
         TabIndex        =   179
         Tag             =   "11820"
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
         TabIndex        =   178
         Tag             =   "11820"
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
         TabIndex        =   177
         Tag             =   "11820"
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
         TabIndex        =   176
         Tag             =   "11820"
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
         TabIndex        =   175
         Tag             =   "11820"
         Top             =   240
         Width           =   540
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
         TabIndex        =   196
         Tag             =   "11820"
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
         TabIndex        =   195
         Tag             =   "11820"
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
         TabIndex        =   194
         Tag             =   "11820"
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
         TabIndex        =   193
         Tag             =   "11820"
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
         TabIndex        =   192
         Tag             =   "11820"
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
         TabIndex        =   191
         Tag             =   "11820"
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
         TabIndex        =   190
         Tag             =   "11820"
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
         TabIndex        =   189
         Tag             =   "11820"
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
         Left            =   30
         TabIndex        =   188
         Tag             =   "11820"
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
         Left            =   30
         TabIndex        =   187
         Tag             =   "11820"
         Top             =   645
         Width           =   1275
      End
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor Comments"
      Height          =   405
      Left            =   6270
      TabIndex        =   173
      ToolTipText     =   "Supervisor Comments"
      Top             =   7920
      Width           =   2175
   End
   Begin VB.Frame frameResidentStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "Resident/NonResident"
      BeginProperty Font 
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
      Left            =   5790
      TabIndex        =   98
      Top             =   5055
      Width           =   2775
      Begin VB.OptionButton optResident 
         BackColor       =   &H00BFD87E&
         Caption         =   "Resident"
         Height          =   180
         Left            =   120
         TabIndex        =   75
         Tag             =   "2775"
         ToolTipText     =   "Resident"
         Top             =   210
         Value           =   -1  'True
         Width           =   990
      End
      Begin VB.OptionButton optNonResident 
         BackColor       =   &H00BFD87E&
         Caption         =   "Non Resident"
         Height          =   180
         Left            =   1200
         TabIndex        =   76
         Tag             =   "2775"
         ToolTipText     =   "Non Resident"
         Top             =   210
         Width           =   1455
      End
   End
   Begin VB.Frame frameCustomerName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   825
      Left            =   45
      TabIndex        =   155
      Top             =   3855
      Width           =   11715
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   60
         Tag             =   "11715"
         Top             =   510
         Width           =   1710
      End
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   59
         Tag             =   "11715"
         Top             =   525
         Width           =   1575
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5025
         MaxLength       =   15
         TabIndex        =   54
         Tag             =   "11715"
         Top             =   195
         Width           =   1575
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   61
         Tag             =   "11715"
         Top             =   525
         Width           =   3015
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   58
         Tag             =   "11715"
         Top             =   510
         Width           =   1815
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   57
         Tag             =   "11715"
         Top             =   495
         Width           =   1815
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   56
         Tag             =   "11715"
         Top             =   195
         Width           =   3015
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   55
         Tag             =   "11715"
         Top             =   195
         Width           =   1695
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   53
         Tag             =   "11715"
         Top             =   180
         Width           =   1815
      End
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   52
         Tag             =   "11715"
         Top             =   180
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
         Left            =   5055
         TabIndex        =   162
         Tag             =   "11715"
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
         TabIndex        =   161
         Tag             =   "11715"
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
         Left            =   -15
         TabIndex        =   160
         Tag             =   "11715"
         Top             =   525
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
         TabIndex        =   159
         Tag             =   "11715"
         Top             =   195
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
         TabIndex        =   158
         Tag             =   "11715"
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
         TabIndex        =   157
         Tag             =   "11715"
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
         TabIndex        =   156
         Tag             =   "11715"
         Top             =   0
         Width           =   1815
      End
   End
   Begin VB.TextBox txtCOBNo 
      BackColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   1260
      MaxLength       =   15
      TabIndex        =   48
      Tag             =   "11775"
      Top             =   3525
      Width           =   1935
   End
   Begin VB.Frame framePassportInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   720
      Left            =   75
      TabIndex        =   148
      Top             =   1440
      Width           =   9675
      Begin VB.TextBox txtPPNumber 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1230
         MaxLength       =   15
         TabIndex        =   18
         Tag             =   "9675"
         Top             =   15
         Width           =   1935
      End
      Begin VB.ComboBox cmbPPIssuedAt 
         Height          =   315
         Left            =   4560
         TabIndex        =   19
         Tag             =   "9675"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1815
      End
      Begin VB.Frame framePPDateType 
         BackColor       =   &H00BFD87E&
         Height          =   390
         Left            =   1215
         TabIndex        =   149
         Tag             =   "9675"
         Top             =   270
         Width           =   1935
         Begin VB.OptionButton optPPDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   180
            Left            =   720
            TabIndex        =   21
            TabStop         =   0   'False
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   150
            Width           =   1095
         End
         Begin VB.OptionButton optPPDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   195
            Left            =   120
            TabIndex        =   20
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   135
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbPPIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4560
         TabIndex        =   22
         Tag             =   "9675"
         Text            =   "01"
         Top             =   345
         Width           =   615
      End
      Begin VB.ComboBox cmbPPIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5160
         TabIndex        =   23
         Tag             =   "9675"
         Text            =   "01"
         Top             =   345
         Width           =   615
      End
      Begin VB.TextBox txtPPIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5760
         MaxLength       =   4
         TabIndex        =   24
         Tag             =   "9675"
         Top             =   345
         Width           =   600
      End
      Begin VB.ComboBox cmbPPExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7710
         TabIndex        =   25
         Tag             =   "9675"
         Text            =   "01"
         Top             =   375
         Width           =   615
      End
      Begin VB.ComboBox cmbPPExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8280
         TabIndex        =   26
         Tag             =   "9675"
         Text            =   "01"
         Top             =   375
         Width           =   615
      End
      Begin VB.TextBox txtPPExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8895
         MaxLength       =   4
         TabIndex        =   27
         Tag             =   "9675"
         Top             =   375
         Width           =   615
      End
      Begin VB.Label lblPpNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Passport No"
         BeginProperty Font 
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
         TabIndex        =   154
         Tag             =   "9675"
         Top             =   15
         Width           =   1215
      End
      Begin VB.Label lblPpIssDate 
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
         Left            =   3240
         TabIndex        =   153
         Tag             =   "9675"
         Top             =   375
         Width           =   1215
      End
      Begin VB.Label lblPpExpiryDate 
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
         Left            =   6480
         TabIndex        =   152
         Tag             =   "9675"
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label lblPpIssAt 
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
         Left            =   3240
         TabIndex        =   151
         Tag             =   "9675"
         Top             =   30
         Width           =   1095
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
         Left            =   0
         TabIndex        =   150
         Tag             =   "9675"
         Top             =   300
         Width           =   885
      End
   End
   Begin VB.ComboBox cmbBranchCode 
      Enabled         =   0   'False
      Height          =   315
      Left            =   4005
      TabIndex        =   0
      Top             =   45
      Width           =   1710
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   405
      Left            =   9750
      TabIndex        =   97
      ToolTipText     =   "Cancel"
      Top             =   7920
      Width           =   1305
   End
   Begin VB.Frame FrameHafizaInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   " "
      Height          =   630
      Left            =   60
      TabIndex        =   141
      Top             =   2145
      Width           =   9660
      Begin VB.TextBox txtHafNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1230
         MaxLength       =   15
         TabIndex        =   28
         Tag             =   "9660"
         Top             =   0
         Width           =   1935
      End
      Begin VB.ComboBox cmbHafIssuedAt 
         Height          =   315
         Left            =   4575
         TabIndex        =   29
         Tag             =   "9660"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1815
      End
      Begin VB.Frame frameHafDateType 
         BackColor       =   &H00BFD87E&
         Height          =   405
         Left            =   1215
         TabIndex        =   142
         Tag             =   "9660"
         Top             =   225
         Width           =   1935
         Begin VB.OptionButton optHafDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   180
            Left            =   720
            TabIndex        =   31
            TabStop         =   0   'False
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   150
            Width           =   1095
         End
         Begin VB.OptionButton optHafDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   180
            Left            =   105
            TabIndex        =   30
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   135
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbHafIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4575
         TabIndex        =   32
         Tag             =   "9660"
         Text            =   "01"
         Top             =   315
         Width           =   615
      End
      Begin VB.ComboBox cmbHafIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5190
         TabIndex        =   33
         Tag             =   "9660"
         Text            =   "01"
         Top             =   315
         Width           =   615
      End
      Begin VB.TextBox txtHafIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   5790
         MaxLength       =   4
         TabIndex        =   34
         Tag             =   "9660"
         Top             =   330
         Width           =   600
      End
      Begin VB.ComboBox cmbHafExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7710
         TabIndex        =   35
         Tag             =   "9660"
         Text            =   "01"
         Top             =   315
         Width           =   615
      End
      Begin VB.ComboBox cmbHafExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8310
         TabIndex        =   36
         Tag             =   "9660"
         Text            =   "01"
         Top             =   315
         Width           =   615
      End
      Begin VB.TextBox txtHafExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   330
         Left            =   8925
         MaxLength       =   4
         TabIndex        =   37
         Tag             =   "9660"
         Top             =   300
         Width           =   615
      End
      Begin VB.Label lblHafNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Hafiza No"
         BeginProperty Font 
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
         TabIndex        =   147
         Tag             =   "9660"
         Top             =   30
         Width           =   840
      End
      Begin VB.Label lblHafIssDate 
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
         Left            =   3255
         TabIndex        =   146
         Tag             =   "9660"
         Top             =   300
         Width           =   1215
      End
      Begin VB.Label lblHafExpiryDate 
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
         Left            =   6510
         TabIndex        =   145
         Tag             =   "9660"
         Top             =   345
         Width           =   1095
      End
      Begin VB.Label lblHafIssAt 
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
         Left            =   3255
         TabIndex        =   144
         Tag             =   "9660"
         Top             =   15
         Width           =   1095
      End
      Begin VB.Label lblHafDateType 
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
         Left            =   0
         TabIndex        =   143
         Tag             =   "9660"
         Top             =   360
         Width           =   885
      End
   End
   Begin VB.CommandButton cmdNextPage 
      Caption         =   "&Next Page"
      Height          =   405
      Left            =   8445
      TabIndex        =   96
      ToolTipText     =   "Next Page"
      Top             =   7920
      Width           =   1305
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1530
      Left            =   45
      TabIndex        =   128
      Top             =   5445
      Width           =   11775
      Begin VB.Frame Frame1 
         BackColor       =   &H00BFD87E&
         Height          =   405
         Left            =   1200
         TabIndex        =   199
         Top             =   0
         Width           =   2055
         Begin VB.OptionButton Option2 
            BackColor       =   &H00BFD87E&
            Caption         =   "Male"
            Height          =   225
            Left            =   120
            TabIndex        =   201
            Tag             =   "2055"
            ToolTipText     =   "Male"
            Top             =   135
            Value           =   -1  'True
            Width           =   855
         End
         Begin VB.OptionButton Option1 
            BackColor       =   &H00BFD87E&
            Caption         =   "Female"
            Height          =   225
            Left            =   945
            TabIndex        =   200
            Tag             =   "2055"
            ToolTipText     =   "Female"
            Top             =   135
            Width           =   975
         End
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4770
         MaxLength       =   10
         TabIndex        =   94
         Tag             =   "11775"
         Top             =   1215
         Width           =   1335
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4785
         TabIndex        =   87
         Tag             =   "11775"
         Text            =   "01"
         Top             =   885
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8295
         TabIndex        =   90
         Tag             =   "11775"
         Text            =   "01"
         Top             =   885
         Width           =   375
      End
      Begin VB.TextBox txtMobileAreaCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1185
         MaxLength       =   2
         TabIndex        =   129
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   1215
         Width           =   375
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1185
         TabIndex        =   84
         Tag             =   "11775"
         Text            =   "01"
         Top             =   885
         Width           =   375
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8295
         MaxLength       =   30
         TabIndex        =   95
         Tag             =   "11775"
         Top             =   1200
         Width           =   3300
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   92
         Tag             =   "11775"
         Top             =   900
         Width           =   615
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8670
         MaxLength       =   10
         TabIndex        =   91
         Tag             =   "11775"
         Top             =   885
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6735
         MaxLength       =   4
         TabIndex        =   89
         Tag             =   "11775"
         Text            =   " "
         Top             =   885
         Width           =   690
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3000
         MaxLength       =   4
         TabIndex        =   86
         Tag             =   "11775"
         Top             =   885
         Width           =   630
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1665
         MaxLength       =   10
         TabIndex        =   93
         Tag             =   "11775"
         Top             =   1215
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5265
         MaxLength       =   10
         TabIndex        =   88
         Tag             =   "11775"
         Top             =   885
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   85
         Tag             =   "11775"
         Top             =   870
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8295
         TabIndex        =   83
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   570
         Width           =   2280
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6210
         TabIndex        =   82
         Tag             =   "11775"
         Top             =   570
         Width           =   1215
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2865
         TabIndex        =   81
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   570
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
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   555
         Width           =   975
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   8250
         MaxLength       =   30
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   255
         Width           =   3015
      End
      Begin VB.TextBox txtAddress1 
         Height          =   270
         Left            =   4890
         MaxLength       =   30
         TabIndex        =   78
         Tag             =   "11775"
         Top             =   270
         Width           =   3015
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
         TabIndex        =   140
         Tag             =   "11775"
         Top             =   1215
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
         Left            =   6840
         TabIndex        =   139
         Tag             =   "11775"
         Top             =   1200
         Width           =   1335
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
         TabIndex        =   138
         Tag             =   "11775"
         Top             =   885
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
         TabIndex        =   137
         Tag             =   "11775"
         Top             =   1215
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
         TabIndex        =   136
         Tag             =   "11775"
         Top             =   885
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
         TabIndex        =   135
         Tag             =   "11775"
         Top             =   885
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
         TabIndex        =   134
         Tag             =   "11775"
         Top             =   570
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
         TabIndex        =   133
         Tag             =   "11775"
         Top             =   570
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
         TabIndex        =   132
         Tag             =   "11775"
         Top             =   570
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
         Left            =   -15
         TabIndex        =   131
         Tag             =   "11775"
         Top             =   585
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
         Left            =   3720
         TabIndex        =   130
         Tag             =   "11775"
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.ComboBox cmbTitle 
      Height          =   315
      Left            =   8700
      TabIndex        =   51
      Text            =   "cmbTitle"
      Top             =   3525
      Width           =   3030
   End
   Begin VB.ComboBox cmbBusinessType 
      Height          =   315
      Left            =   9975
      TabIndex        =   77
      Tag             =   "11775"
      Text            =   "cmbBusinessType"
      Top             =   5160
      Width           =   1695
   End
   Begin VB.Frame frameMaritalStatus 
      BackColor       =   &H00BFD87E&
      Height          =   375
      Left            =   1245
      TabIndex        =   116
      Top             =   5070
      Width           =   2655
      Begin VB.OptionButton optSingle 
         BackColor       =   &H00BFD87E&
         Caption         =   "Single"
         Height          =   210
         Left            =   975
         TabIndex        =   72
         TabStop         =   0   'False
         Tag             =   "2655"
         ToolTipText     =   "Single"
         Top             =   135
         Width           =   735
      End
      Begin VB.OptionButton optMarried 
         BackColor       =   &H00BFD87E&
         Caption         =   "Married"
         Height          =   195
         Left            =   135
         TabIndex        =   71
         Tag             =   "2655"
         ToolTipText     =   "Married"
         Top             =   120
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton optOthers 
         BackColor       =   &H00BFD87E&
         Caption         =   "Others"
         Height          =   195
         Left            =   1725
         TabIndex        =   73
         Tag             =   "2655"
         ToolTipText     =   "Others"
         Top             =   135
         Width           =   855
      End
   End
   Begin VB.TextBox txtDependents 
      Height          =   285
      Left            =   5160
      MaxLength       =   2
      TabIndex        =   74
      Tag             =   "11775"
      Top             =   5175
      Width           =   495
   End
   Begin VB.ComboBox cmbDobDate 
      Height          =   315
      Left            =   4785
      TabIndex        =   64
      Text            =   "01"
      Top             =   4725
      Width           =   615
   End
   Begin VB.ComboBox cmbDobMonth 
      Height          =   315
      Left            =   5385
      TabIndex        =   65
      Text            =   "01"
      Top             =   4725
      Width           =   615
   End
   Begin VB.TextBox txtDobYear 
      Height          =   300
      Left            =   5985
      MaxLength       =   4
      TabIndex        =   66
      Top             =   4725
      Width           =   615
   End
   Begin VB.TextBox Terms 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   465
      Left            =   120
      TabIndex        =   106
      Text            =   "Terms and Conditions Here "
      Top             =   12435
      Width           =   12180
   End
   Begin VB.ComboBox cmbAltBrCode 
      Height          =   315
      Left            =   7755
      TabIndex        =   1
      Top             =   45
      Width           =   1815
   End
   Begin VB.TextBox txtCustomerNo 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   285
      Left            =   1890
      MaxLength       =   7
      TabIndex        =   100
      Top             =   75
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
      Left            =   10320
      TabIndex        =   99
      Top             =   30
      Width           =   1335
   End
   Begin VB.Frame FrameFamilyRegnInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   675
      Left            =   75
      TabIndex        =   163
      Top             =   2775
      Width           =   9615
      Begin VB.ComboBox cmbFRIssuedAt 
         Height          =   315
         Left            =   4560
         TabIndex        =   39
         Tag             =   "9615"
         Text            =   "Riyadh"
         Top             =   30
         Width           =   1830
      End
      Begin VB.TextBox txtFRNo 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   1185
         MaxLength       =   15
         TabIndex        =   38
         Tag             =   "9615"
         Top             =   15
         Width           =   1935
      End
      Begin VB.TextBox txtFRExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   8925
         MaxLength       =   4
         TabIndex        =   47
         Tag             =   "9615"
         Top             =   360
         Width           =   600
      End
      Begin VB.ComboBox cmbFRExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8310
         TabIndex        =   46
         Tag             =   "9615"
         Text            =   "01"
         Top             =   360
         Width           =   615
      End
      Begin VB.ComboBox cmbFRExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7710
         TabIndex        =   45
         Tag             =   "9615"
         Text            =   "01"
         Top             =   360
         Width           =   615
      End
      Begin VB.TextBox txtFRIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   5760
         MaxLength       =   4
         TabIndex        =   44
         Tag             =   "9615"
         Top             =   360
         Width           =   615
      End
      Begin VB.ComboBox cmbFRIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5145
         TabIndex        =   43
         Tag             =   "9615"
         Text            =   "01"
         Top             =   360
         Width           =   615
      End
      Begin VB.ComboBox cmbFRIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4545
         TabIndex        =   42
         Tag             =   "9615"
         Text            =   "01"
         Top             =   360
         Width           =   615
      End
      Begin VB.Frame frameFRDateType 
         BackColor       =   &H00BFD87E&
         Height          =   375
         Left            =   1185
         TabIndex        =   164
         Tag             =   "9615"
         Top             =   270
         Width           =   1920
         Begin VB.OptionButton optFRDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   180
            Left            =   120
            TabIndex        =   40
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optFRDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   180
            Left            =   750
            TabIndex        =   41
            TabStop         =   0   'False
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   1095
         End
      End
      Begin VB.Label lblFRIssAt 
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
         Left            =   3240
         TabIndex        =   169
         Tag             =   "9615"
         Top             =   45
         Width           =   1095
      End
      Begin VB.Label lblFRNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Family Regn. Number"
         BeginProperty Font 
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
         Left            =   -15
         TabIndex        =   168
         Tag             =   "9615"
         Top             =   30
         Width           =   1470
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblFRDateType 
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
         Left            =   0
         TabIndex        =   167
         Tag             =   "9615"
         Top             =   435
         Width           =   885
      End
      Begin VB.Label lblFRExpiryDate 
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
         Left            =   6495
         TabIndex        =   166
         Tag             =   "9615"
         Top             =   405
         Width           =   975
      End
      Begin VB.Label lblFRIssDate 
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
         Left            =   3225
         TabIndex        =   165
         Tag             =   "9615"
         Top             =   420
         Width           =   915
      End
   End
   Begin VB.Frame frameRefFor 
      BackColor       =   &H00BFD87E&
      Height          =   405
      Left            =   0
      TabIndex        =   171
      Top             =   330
      Width           =   11775
      Begin VB.CheckBox chkMentDisabled 
         BackColor       =   &H00BFD87E&
         Caption         =   "Mentally Disabled"
         BeginProperty Font 
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
         Left            =   9675
         TabIndex        =   7
         Tag             =   "11775"
         ToolTipText     =   "Mentally disabled"
         Top             =   120
         Width           =   1905
      End
      Begin VB.CheckBox chkMinorSpl 
         BackColor       =   &H00BFD87E&
         Caption         =   "Minor with special Circumstances"
         BeginProperty Font 
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
         Left            =   6375
         TabIndex        =   6
         Tag             =   "11775"
         ToolTipText     =   "Minor with special circumstances"
         Top             =   120
         Width           =   3255
      End
      Begin VB.CheckBox chkBlind 
         BackColor       =   &H00BFD87E&
         Caption         =   "Blind/Iliterat"
         BeginProperty Font 
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
         TabIndex        =   2
         Tag             =   "11775"
         ToolTipText     =   "Blind Person"
         Top             =   120
         Width           =   1455
      End
      Begin VB.CheckBox chkVeiled 
         BackColor       =   &H00BFD87E&
         Caption         =   "Veiled Woman"
         BeginProperty Font 
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
         Left            =   1620
         TabIndex        =   3
         Tag             =   "11775"
         ToolTipText     =   "Veiled woman"
         Top             =   120
         Width           =   1590
      End
      Begin VB.CheckBox chkIncptPerson 
         BackColor       =   &H00BFD87E&
         Caption         =   "Incompetent Person"
         BeginProperty Font 
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
         Left            =   3270
         TabIndex        =   4
         Tag             =   "11775"
         ToolTipText     =   "Incompetent Person"
         Top             =   120
         Width           =   2055
      End
      Begin VB.CheckBox chkMinor 
         BackColor       =   &H00BFD87E&
         Caption         =   "Minor"
         BeginProperty Font 
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
         Left            =   5385
         TabIndex        =   5
         Tag             =   "11775"
         ToolTipText     =   "Minor"
         Top             =   120
         Width           =   825
      End
   End
   Begin VB.Frame frameIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   660
      Left            =   75
      TabIndex        =   108
      Top             =   765
      Width           =   9630
      Begin VB.TextBox txtIdNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1215
         MaxLength       =   15
         TabIndex        =   8
         Tag             =   "9630"
         Top             =   0
         Width           =   1935
      End
      Begin VB.TextBox txtIdExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8910
         MaxLength       =   4
         TabIndex        =   17
         Tag             =   "9630"
         Top             =   360
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8295
         TabIndex        =   16
         Tag             =   "9630"
         Text            =   "01"
         Top             =   345
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7725
         TabIndex        =   15
         Tag             =   "9630"
         Text            =   "01"
         Top             =   345
         Width           =   615
      End
      Begin VB.TextBox txtIdIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5760
         MaxLength       =   4
         TabIndex        =   14
         Tag             =   "9630"
         Top             =   345
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5160
         TabIndex        =   13
         Tag             =   "9630"
         Text            =   "01"
         Top             =   345
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4560
         TabIndex        =   12
         Tag             =   "9630"
         Text            =   "01"
         Top             =   345
         Width           =   615
      End
      Begin VB.Frame frameIdDateType 
         BackColor       =   &H00BFD87E&
         Height          =   390
         Left            =   1215
         TabIndex        =   109
         Tag             =   "9630"
         Top             =   255
         Width           =   1935
         Begin VB.OptionButton optIdDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   210
            Left            =   120
            TabIndex        =   10
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   135
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optIdDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   195
            Left            =   765
            TabIndex        =   11
            TabStop         =   0   'False
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   135
            Width           =   1035
         End
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   4560
         TabIndex        =   9
         Tag             =   "9630"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1830
      End
      Begin VB.Label lblIdDateType 
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
         Left            =   15
         TabIndex        =   114
         Tag             =   "9630"
         Top             =   390
         Width           =   885
      End
      Begin VB.Label lblIdIssueAt 
         AutoSize        =   -1  'True
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
         Height          =   195
         Left            =   3255
         TabIndex        =   113
         Tag             =   "9630"
         Top             =   75
         Width           =   795
      End
      Begin VB.Label lblIdExpiryDate 
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
         Left            =   6465
         TabIndex        =   112
         Tag             =   "9630"
         Top             =   405
         Width           =   975
      End
      Begin VB.Label lblIdIssueDate 
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
         Left            =   3240
         TabIndex        =   111
         Tag             =   "9630"
         Top             =   375
         Width           =   915
      End
      Begin VB.Label lblIdNumber 
         BackColor       =   &H00BFD87E&
         Caption         =   "ID Number"
         BeginProperty Font 
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
         Tag             =   "9630"
         Top             =   30
         Width           =   1215
      End
   End
   Begin VB.Frame frameDobDateType 
      BackColor       =   &H00BFD87E&
      Height          =   435
      Left            =   1260
      TabIndex        =   115
      Top             =   4635
      Width           =   1935
      Begin VB.OptionButton optDOBGreg 
         BackColor       =   &H00BFD87E&
         Caption         =   "Gregorian"
         Height          =   195
         Left            =   735
         TabIndex        =   63
         Tag             =   "1935"
         ToolTipText     =   "Gregorian"
         Top             =   165
         Width           =   1095
      End
      Begin VB.OptionButton optDOBHijri 
         BackColor       =   &H00BFD87E&
         Caption         =   "Hijri"
         Height          =   255
         Left            =   120
         TabIndex        =   62
         Tag             =   "1935"
         ToolTipText     =   "Hijri"
         Top             =   150
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.Frame frameVIP 
      BackColor       =   &H00BFD87E&
      Height          =   405
      Left            =   10095
      TabIndex        =   118
      Top             =   4620
      Width           =   1575
      Begin VB.OptionButton optVipNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   70
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optVipYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   225
         Left            =   135
         TabIndex        =   69
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   135
         Width           =   615
      End
   End
   Begin VB.Frame frameSex 
      BackColor       =   &H00BFD87E&
      Height          =   405
      Left            =   7320
      TabIndex        =   117
      Top             =   4635
      Width           =   2055
      Begin VB.OptionButton optGenderFemale 
         BackColor       =   &H00BFD87E&
         Caption         =   "Female"
         Height          =   225
         Left            =   945
         TabIndex        =   68
         Tag             =   "2055"
         ToolTipText     =   "Female"
         Top             =   135
         Width           =   975
      End
      Begin VB.OptionButton optGenderMale 
         BackColor       =   &H00BFD87E&
         Caption         =   "Male"
         Height          =   225
         Left            =   120
         TabIndex        =   67
         Tag             =   "2055"
         ToolTipText     =   "Male"
         Top             =   135
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Height          =   390
      Left            =   4605
      TabIndex        =   101
      Top             =   3480
      Width           =   1935
      Begin VB.OptionButton optLangEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "English"
         Height          =   225
         Left            =   945
         TabIndex        =   50
         TabStop         =   0   'False
         Tag             =   "1935"
         ToolTipText     =   "English"
         Top             =   135
         Width           =   855
      End
      Begin VB.OptionButton optLangArabic 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic"
         Height          =   225
         Left            =   105
         TabIndex        =   49
         Tag             =   "1935"
         ToolTipText     =   "Arabic"
         Top             =   135
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.Line Line6 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   75
      X2              =   11670
      Y1              =   3465
      Y2              =   3465
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
      TabIndex        =   172
      Top             =   8040
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblCobNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cert. of Birth Number"
      BeginProperty Font 
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
      TabIndex        =   170
      Tag             =   "11775"
      Top             =   3480
      Width           =   1200
   End
   Begin VB.Shape Shape1 
      Height          =   465
      Left            =   45
      Top             =   7920
      Width           =   11610
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
      Left            =   7365
      TabIndex        =   127
      Top             =   3600
      Width           =   885
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
      Left            =   3300
      TabIndex        =   126
      Top             =   3585
      Width           =   855
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
      TabIndex        =   125
      Tag             =   "11775"
      Top             =   4770
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
      TabIndex        =   124
      Tag             =   "11775"
      Top             =   5205
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
      Height          =   225
      Left            =   45
      TabIndex        =   123
      Tag             =   "11775"
      Top             =   5220
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
      Left            =   3975
      TabIndex        =   122
      Tag             =   "11775"
      Top             =   5220
      Width           =   1215
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
      TabIndex        =   121
      Tag             =   "11775"
      Top             =   4755
      Width           =   615
   End
   Begin VB.Label lblDateOfBirth 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "DOB Date Type"
      BeginProperty Font 
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
      Left            =   3375
      TabIndex        =   120
      Top             =   4785
      Width           =   1335
   End
   Begin VB.Label lblDOBDateType 
      AutoSize        =   -1  'True
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
      Height          =   195
      Left            =   60
      TabIndex        =   119
      Tag             =   "11775"
      Top             =   4815
      Width           =   1080
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
      Left            =   120
      TabIndex        =   107
      Top             =   12180
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
      Left            =   5805
      TabIndex        =   105
      Top             =   90
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
      Left            =   60
      TabIndex        =   104
      Top             =   75
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
      Left            =   3315
      TabIndex        =   103
      Top             =   75
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
      Left            =   9675
      TabIndex        =   102
      Top             =   75
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
Attribute VB_Name = "frmIndividualSaudi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public Function validateIndividualSaudi() As Integer

     Dim tIssueDate As String, tDob As String
     Dim tExpiryDate As String
     Dim tCode As String
     Dim tmpCode As String
     Dim mQry As String
     Dim i As Integer
     
     validateIndividualSaudi = 0
          
    ' below if by nad
    If frmIndividualSaudi.chkBlind.Value = 1 Or _
       frmIndividualSaudi.chkIncptPerson.Value = 1 Or _
       frmIndividualSaudi.chkVeiled.Value = 1 Or _
       frmIndividualSaudi.chkMinor.Value = 1 Or _
       frmIndividualSaudi.chkMinorSpl.Value = 1 Or _
       frmIndividualSaudi.chkMentDisabled.Value = 1 Then
       
       forReference = 0 'selected
    Else
       forReference = 1 'not selected
    End If
    
     If subCategoryCode = "02" Then
         If frmIndividualSaudi.chkBlind.Value = vbUnchecked And _
            frmIndividualSaudi.chkIncptPerson = vbUnchecked And _
            frmIndividualSaudi.chkVeiled = vbUnchecked And _
            frmIndividualSaudi.chkMinor = vbUnchecked And _
            frmIndividualSaudi.chkMinorSpl = vbUnchecked And _
            frmIndividualSaudi.chkMentDisabled = vbUnchecked Then
        
            MsgBox errOneReferenceReqd(UserLang)
            validateIndividualSaudi = 1
            Exit Function
         Else
            validateInvidualsaudi = 0
         End If
     End If
    
     If Len(RTrim(Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4))) = 0 Then
        MsgBox errSpaceBranchCode(UserLang)
        validateIndividualSaudi = 1
        Exit Function
     Else
        validateIndividualSaudi = 0
     End If
     
     mQry = "select realorpseudo from branchinfo where branchcode = '" & Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4) & "'"
     Set rs = db.OpenRecordset(mQry)
     If rs.recordCount > 0 Then
        tmpCode = rs(0)
     Else
        tmpCode = "1" 'if error occured in executing the query, then move as real branch
     End If
                
     tCode = Mid$(frmIndividualSaudi.cmbAltBrCode, 1, 4)
     If tmpCode = "0" Then
        If tCode = "0000" Then
           MsgBox errInvalidAltBrCode(UserLang)
           frmIndividualSaudi.cmbAltBrCode.SetFocus
           validateIndividualSaudi = 1
           Exit Function
        Else
           validateIndividualSaudi = 0
        End If
     End If
             
     For i = 0 To frmIndividualSaudi.cmbAltBrCode.ListCount
         If Mid$(frmIndividualSaudi.cmbAltBrCode.List(i), 1, 4) = tCode Then
            frmIndividualSaudi.cmbAltBrCode.ListIndex = i
            Exit For
         End If
     Next i

     If i > frmIndividualSaudi.cmbAltBrCode.ListCount Then
         MsgBox errInvalidAltBrCode(UserLang) '"Alternative Branch Code should be a real branch...Please re-enter.."
         frmIndividualSaudi.cmbAltBrCode.SetFocus
         validateIndividualSaudi = 1
         Exit Function
     Else
        validateIndividualSaudi = 0
     End If
     
     If subCategoryCode = "01" Then   ' individual saudi national
        If frmIndividualSaudi.chkMinor.Value = vbUnchecked And frmIndividualSaudi.optGenderMale Then
           If Len(RTrim(frmIndividualSaudi.txtIdNo)) = 0 Then
              MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
              frmIndividualSaudi.txtIdNo.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           If Len(Trim(frmIndividualSaudi.txtIdNo)) <> 10 Then
              MsgBox errInvalidId(UserLang)
              frmIndividualSaudi.txtIdNo.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        
           If Mid$(frmIndividualSaudi.txtIdNo, 1, 1) <> "1" Then
              MsgBox errInvalidIdCategory(UserLang)
              txtIdNo.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
           If validIdNumber(frmIndividualSaudi.txtIdNo) = False Then
              MsgBox errInvalidIdNo(UserLang)
              txtIdNo.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi.cmbIdIssueDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbIdIssueMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtIdIssueYear)) = 0 Then
              MsgBox errSpaceIssueDate(UserLang)
              frmIndividualSaudi.cmbIdIssueDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi.cmbIdExpiryDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbIdExpiryMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtIdExpiryYear)) = 0 Then
              MsgBox errSpaceExpiryDate(UserLang)
              frmIndividualSaudi.cmbIdExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           tIssueDate = CStr(frmIndividualSaudi.txtIdIssueYear) + _
                        CStr(frmIndividualSaudi.cmbIdIssueMonth.text) + _
                        CStr(frmIndividualSaudi.cmbIdIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtIdExpiryYear) + _
                         CStr(frmIndividualSaudi.cmbIdExpiryMonth.text) + _
                         CStr(frmIndividualSaudi.cmbIdExpiryDate.text)
                           
           If frmIndividualSaudi.optIdDateGreg.Value = True Then
              If Not validDate(CStr(tIssueDate)) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbIdIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbIdExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtIdExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
          If optIdDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtIdExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtIdExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbIdIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbIdIssuedAt.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If  ' if not minor and male
       
       If Len(RTrim(txtPPNumber)) = 0 And _
          Len(RTrim(txtHafNo)) = 0 And _
          Len(RTrim(txtFRNo)) = 0 And _
          Len(RTrim(txtIdNo)) = 0 Then
          MsgBox errAtleastOneIdReqd(UserLang)
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
             
       If Len(RTrim(frmIndividualSaudi.txtPPNumber)) <> 0 Then
          If Len(RTrim(frmIndividualSaudi.cmbPPIssueDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbPPIssueMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtPPIssueYear)) = 0 Then
              MsgBox errSpaceIssueDate(UserLang)
              frmIndividualSaudi.cmbPPIssueDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi.cmbPPExpiryDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbPPExpiryMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtPPExpiryYear)) = 0 Then
              MsgBox errSpaceExpiryDate(UserLang)
              frmIndividualSaudi.cmbPPExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           tIssueDate = CStr(frmIndividualSaudi.txtPPIssueYear) + _
                        CStr(frmIndividualSaudi.cmbPPIssueMonth.text) + _
                        CStr(frmIndividualSaudi.cmbPPIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtPPExpiryYear) + _
                         CStr(frmIndividualSaudi.cmbPPExpiryMonth.text) + _
                         CStr(frmIndividualSaudi.cmbPPExpiryDate.text)
                           
           If frmIndividualSaudi.optPPDateGreg.Value = True Then
              If Not validDate(CStr(tIssueDate)) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbPPIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbPPExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtPPExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
          If optPPDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtPPExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtPPExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbPPIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbPPIssuedAt.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If ' if len(ppno)> 0
       
       If Len(RTrim(frmIndividualSaudi.txtHafNo)) <> 0 Then
          If Len(RTrim(frmIndividualSaudi.cmbHafIssueDate.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.cmbHafIssueMonth.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.txtHafIssueYear)) = 0 Then
             MsgBox errSpaceIssueDate(UserLang)
             frmIndividualSaudi.cmbHafIssueDate.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbHafExpiryDate.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.cmbHafExpiryMonth.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.txtHafExpiryYear)) = 0 Then
             MsgBox errSpaceExpiryDate(UserLang)
             frmIndividualSaudi.cmbHafExpiryDate.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If

           tIssueDate = CStr(frmIndividualSaudi.txtHafIssueYear) + _
                        CStr(frmIndividualSaudi.cmbHafIssueMonth.text) + _
                        CStr(frmIndividualSaudi.cmbHafIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtHafExpiryYear) + _
                         CStr(frmIndividualSaudi.cmbHafExpiryMonth.text) + _
                         CStr(frmIndividualSaudi.cmbHafExpiryDate.text)
                           
           If frmIndividualSaudi.optHafDateGreg.Value = True Then
              If Not validDate(CStr(tIssueDate)) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbHafIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbHafExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtHafExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
          If optHafDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtHafExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtHafExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbHafIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbPPIssuedAt.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If ' if len(hafno) <> 0
       
       If Len(RTrim(frmIndividualSaudi.txtFRNo)) <> 0 Then
          If Len(RTrim(frmIndividualSaudi.cmbFRIssueDate.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.cmbFRIssueMonth.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.txtFRIssueYear)) = 0 Then
             MsgBox errSpaceIssueDate(UserLang)
             frmIndividualSaudi.cmbFRIssueDate.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
           If Len(RTrim(frmIndividualSaudi.cmbFRExpiryDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbFRExpiryMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtFRExpiryYear)) = 0 Then
              MsgBox errSpaceExpiryDate(UserLang)
              frmIndividualSaudi.cmbFRExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           tIssueDate = CStr(frmIndividualSaudi.txtFRIssueYear) + _
                        CStr(frmIndividualSaudi.cmbFRIssueMonth.text) + _
                        CStr(frmIndividualSaudi.cmbFRIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtFRExpiryYear) + _
                         CStr(frmIndividualSaudi.cmbFRExpiryMonth.text) + _
                         CStr(frmIndividualSaudi.cmbFRExpiryDate.text)
                           
           If frmIndividualSaudi.optFRDateGreg.Value = True Then
              If Not validDate(CStr(tIssueDate)) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbFRIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbFRExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtFRExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
          If optFRDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtFRExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtFRExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbFRIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbFRIssuedAt.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If ' if len(familyRegnNo) <> 0
    End If  ' end if subcategory = "01" individual Saudi
    
   ' CHECKING FOR SAUDI UNDER SPECIAL CIRCUMSTANCES STARTS HERE
   
    If subCategoryCode = "02" Then
       If Len(RTrim(txtIdNo)) <> 0 Then
          If Len(Trim(frmIndividualSaudi.txtIdNo)) <> 10 Then
              MsgBox errInvalidId(UserLang)
              frmIndividualSaudi.txtIdNo.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        
           If Mid$(frmIndividualSaudi.txtIdNo, 1, 1) <> "1" Then
              MsgBox errInvalidIdCategory(UserLang)
              txtIdNo.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualOthers = 0
           End If
           If validIdNumber(frmIndividualSaudi.txtIdNo) = False Then
              MsgBox errInvalidIdNo(UserLang)
              txtIdNo.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi.cmbIdIssueDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbIdIssueMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtIdIssueYear)) = 0 Then
              MsgBox errSpaceIssueDate(UserLang)
              frmIndividualSaudi.cmbIdIssueDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi.cmbIdExpiryDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbIdExpiryMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtIdExpiryYear)) = 0 Then
              MsgBox errSpaceExpiryDate(UserLang)
              frmIndividualSaudi.cmbIdExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           tIssueDate = CStr(frmIndividualSaudi.txtIdIssueYear) + _
                        CStr(frmIndividualSaudi.cmbIdIssueMonth.text) + _
                        CStr(frmIndividualSaudi.cmbIdIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtIdExpiryYear) + _
                         CStr(frmIndividualSaudi.cmbIdExpiryMonth.text) + _
                         CStr(frmIndividualSaudi.cmbIdExpiryDate.text)
                           
           If frmIndividualSaudi.optIdDateGreg.Value = True Then
              If Not validDate(CStr(tIssueDate)) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbIdIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbIdExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtIdExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
          If optIdDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtIdExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtIdExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbIdIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbIdIssuedAt.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
      End If
       
       If Len(RTrim(txtPPNumber)) = 0 And _
          Len(RTrim(txtHafNo)) = 0 And _
          Len(RTrim(txtFRNo)) = 0 And _
          Len(RTrim(txtIdNo)) = 0 Then
          If Len(RTrim(txtCOBNo)) = 0 Then
             MsgBox errSpaceCertOfBirthNo(UserLang)
             txtCOBNo.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
      End If
       If Len(RTrim(txtPPNumber)) = 0 And _
          Len(RTrim(txtHafNo)) = 0 And _
          Len(RTrim(txtFRNo)) = 0 And _
          Len(RTrim(txtIdNo)) = 0 Then
          MsgBox errAtleastOneIdReqd(UserLang)
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
             
       If Len(RTrim(frmIndividualSaudi.txtPPNumber)) <> 0 Then
          If Len(RTrim(frmIndividualSaudi.cmbPPIssueDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbPPIssueMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtPPIssueYear)) = 0 Then
              MsgBox errSpaceIssueDate(UserLang)
              frmIndividualSaudi.cmbPPIssueDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi.cmbPPExpiryDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbPPExpiryMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtPPExpiryYear)) = 0 Then
              MsgBox errSpaceExpiryDate(UserLang)
              frmIndividualSaudi.cmbPPExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           tIssueDate = CStr(frmIndividualSaudi.txtPPIssueYear) & _
                        CStr(frmIndividualSaudi.cmbPPIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbPPIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtPPExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbPPExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbPPExpiryDate.text)
                           
           If frmIndividualSaudi.optPPDateGreg.Value = True Then
              If Not validDate(CStr(tIssueDate)) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbPPIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbPPExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtPPExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
          If optPPDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtPPExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtPPExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbPPIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbPPIssuedAt.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If ' if len(ppno)> 0
       
       If Len(RTrim(frmIndividualSaudi.txtHafNo)) <> 0 Then
          If Len(RTrim(frmIndividualSaudi.cmbHafIssueDate.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.cmbHafIssueMonth.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.txtHafIssueYear)) = 0 Then
             MsgBox errSpaceIssueDate(UserLang)
             frmIndividualSaudi.cmbHafIssueDate.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbHafExpiryDate.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.cmbHafExpiryMonth.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.txtHafExpiryYear)) = 0 Then
             MsgBox errSpaceExpiryDate(UserLang)
             frmIndividualSaudi.cmbHafExpiryDate.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If

           tIssueDate = CStr(frmIndividualSaudi.txtHafIssueYear) + _
                        CStr(frmIndividualSaudi.cmbHafIssueMonth.text) + _
                        CStr(frmIndividualSaudi.cmbHafIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtHafExpiryYear) + _
                         CStr(frmIndividualSaudi.cmbHafExpiryMonth.text) + _
                         CStr(frmIndividualSaudi.cmbHafExpiryDate.text)
                           
           If frmIndividualSaudi.optHafDateGreg.Value = True Then
              If Not validDate(CStr(tIssueDate)) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbHafIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbHafExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtHafExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
          If optHafDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtHafExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtHafExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbHafIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbPPIssuedAt.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If ' if len(hafno) <> 0
       
       If Len(RTrim(frmIndividualSaudi.txtFRNo)) <> 0 Then
          If Len(RTrim(frmIndividualSaudi.cmbFRIssueDate.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.cmbFRIssueMonth.text)) = 0 Or _
             Len(RTrim(frmIndividualSaudi.txtFRIssueYear)) = 0 Then
             MsgBox errSpaceIssueDate(UserLang)
             frmIndividualSaudi.cmbFRIssueDate.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
           If Len(RTrim(frmIndividualSaudi.cmbFRExpiryDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbFRExpiryMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtFRExpiryYear)) = 0 Then
              MsgBox errSpaceExpiryDate(UserLang)
              frmIndividualSaudi.cmbFRExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           tIssueDate = CStr(frmIndividualSaudi.txtFRIssueYear) + _
                        CStr(frmIndividualSaudi.cmbFRIssueMonth.text) + _
                        CStr(frmIndividualSaudi.cmbFRIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtFRExpiryYear) + _
                         CStr(frmIndividualSaudi.cmbFRExpiryMonth.text) + _
                         CStr(frmIndividualSaudi.cmbFRExpiryDate.text)
                           
           If frmIndividualSaudi.optFRDateGreg.Value = True Then
              If Not validDate(CStr(tIssueDate)) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbFRIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbFRExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtFRExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
          If optFRDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtFRExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtFRExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbFRIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbFRIssuedAt.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If ' if len(familyRegnNo) <> 0
      
    End If ' subcateogy = "02" ' saudi child with special circumstances
        
    '  OTHER VALIDATION COMMON FOR SAUDI STARTS HERE
    If (updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U")) And _
        recvLoginMsg.custNameUpdAllowed <> "1" Then
        ' this empty condition is required to ignore customer name validation
        ' during update & branch is not allowed to update the customer name
    ElseIf frmIndividualSaudi.optLangArabic.Value = True Then
       If Len(RTrim(frmIndividualSaudi.txtArabFirstName)) = 0 Or _
          Len(RTrim(frmIndividualSaudi.txtArabic2ndName)) = 0 Or _
          Len(RTrim(frmIndividualSaudi.txtArabic3rdName)) = 0 Or _
          Len(RTrim(frmIndividualSaudi.txtArabLastName)) = 0 Then
          MsgBox errAllFourNameReqd(UserLang)
          frmIndividualSaudi.txtArabFirstName.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
           
       If Len(RTrim(frmIndividualSaudi.txtArabShortName)) = 0 Then
          MsgBox errSpaceShortName(UserLang)
          frmIndividualSaudi.txtArabShortName.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
    Else
       If Len(RTrim(frmIndividualSaudi.txtEngFirstName)) = 0 Or _
          Len(RTrim(frmIndividualSaudi.txtEnglish2ndName)) = 0 Or _
          Len(RTrim(frmIndividualSaudi.txtEnglish3rdName)) = 0 Or _
          Len(RTrim(frmIndividualSaudi.txtEngLastName)) = 0 Then
          MsgBox errAllFourNameReqd(UserLang)
          frmIndividualSaudi.txtEngFirstName.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
           
       If Len(RTrim(frmIndividualSaudi.txtEngShortName)) = 0 Then
          MsgBox errSpaceShortName(UserLang)
          frmIndividualSaudi.txtEngShortName.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
    End If
        
    If frmIndividualSaudi.optLangArabic.Value = True Then
       If Len(RTrim(frmIndividualSaudi.txtAddress1)) <> 0 Then
          If englishCharFound(frmIndividualSaudi.txtAddress1) Then
             MsgBox errNoEnglishAddress(UserLang)
             frmIndividualSaudi.txtAddress1.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If
       If Len(RTrim(frmIndividualSaudi.txtAddress2)) <> 0 Then
          If englishCharFound(frmIndividualSaudi.txtAddress2) Then
             MsgBox errNoEnglishAddress(UserLang)
             frmIndividualSaudi.txtAddress2.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If
         
       If englishCharFound(frmIndividualSaudi.cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" + _
                              frmIndividualSaudi.cmbCity.text + "'")
          If rs.recordCount > 0 Then
             frmIndividualSaudi.cmbCity.text = rs(0)
          Else
             MsgBox errLangNotmatching(UserLang)
             frmIndividualSaudi.cmbCity.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          End If
      End If
    Else    ' if the language is english
       If Len(RTrim(frmIndividualSaudi.txtAddress1)) <> 0 Then
          If arabicCharFound(frmIndividualSaudi.txtAddress1) Then
             MsgBox errNoArabicAddress(UserLang)
             frmIndividualSaudi.txtAddress1.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If
         
       If Len(RTrim(frmIndividualSaudi.txtAddress2)) <> 0 Then
          If arabicCharFound(frmIndividualSaudi.txtAddress2) Then
             MsgBox errNoArabicAddress(UserLang)
             frmIndividualSaudi.txtAddress2.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If
       If arabicCharFound(frmIndividualSaudi.cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                             frmIndividualSaudi.cmbCity.text & "'")
          If rs.recordCount > 0 Then
             frmIndividualSaudi.cmbCity.text = rs(0)
          Else
             MsgBox errLangNotmatching(UserLang)
             frmIndividualSaudi.cmbCity.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          End If
      End If
    End If
    
    If Len(RTrim(frmIndividualSaudi.cmbTitle.text)) = 0 Then
       MsgBox errSpaceTitle(UserLang)
       frmIndividualSaudi.cmbTitle.SetFocus
       validateIndividualSaudi = 1
       Exit Function
    Else
       validateIndividualSaudi = 0
    End If
    
         
    If Len(RTrim(frmIndividualSaudi.cmbDobDate.text)) = 0 Or _
       Len(RTrim(frmIndividualSaudi.cmbDobMonth.text)) = 0 Or _
       Len(RTrim(frmIndividualSaudi.txtDobYear.text)) = 0 Then
       MsgBox errSpaceDob(UserLang) '"Date of Birth Should be entered...Please enter "
       frmIndividualSaudi.cmbDobDate.SetFocus
       validateIndividualSaudi = 1
       Exit Function
    Else
       validateIndividualSaudi = 0
    End If
    tDob = CStr(frmIndividualSaudi.txtDobYear) + _
           CStr(frmIndividualSaudi.cmbDobMonth.text) + _
           CStr(frmIndividualSaudi.cmbDobDate.text)
           
    If frmIndividualSaudi.optDOBGreg.Value = True Then
       If Not validDate(CStr(tDob)) Then
          MsgBox errInvalidDate(UserLang)
          frmIndividualSaudi.cmbDobDate.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
    End If
        
    If Len(RTrim(frmIndividualSaudi.cmbBusinessType.text)) = 0 Then
       MsgBox errSpaceBusType(UserLang)
       frmIndividualSaudi.cmbBusinessType.SetFocus
       validateIndividualSaudi = 1
       Exit Function
    Else
       validateIndividualSaudi = 0
    End If
    If Len(RTrim(frmIndividualSaudi.txtAddress1)) = 0 Or _
       Len(RTrim(frmIndividualSaudi.txtPOBox)) = 0 Or _
       Len(RTrim(frmIndividualSaudi.txtPinCode)) = 0 Or _
       Len(RTrim(frmIndividualSaudi.cmbCity.text)) = 0 Then
          
       MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
       frmIndividualSaudi.txtAddress1.SetFocus
       validateIndividualSaudi = 1
       Exit Function
    Else
       validateIndividualSaudi = 0
    End If
    
    If Len(RTrim(frmIndividualSaudi.txtResPhoneNo)) = 0 And _
       Len(RTrim(frmIndividualSaudi.txtOffPhoneNo)) = 0 And _
       Len(RTrim(frmIndividualSaudi.txtFaxNo)) = 0 And _
       Len(RTrim(frmIndividualSaudi.txtMobileNo)) = 0 Then
       
       MsgBox errSpacePhone(UserLang) ' "Atleast one Phone number should be entered..."
       frmIndividualSaudi.txtOffPhoneNo.SetFocus
       validateIndividualSaudi = 1
       Exit Function
    Else
       validateIndividualSaudi = 0
    End If
    
    
End Function

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
                frmIndividualSaudi.cmbCountry.ListIndex = i
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
                frmIndividualSaudi.cmbCountry.ListIndex = i
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
             cmbDobDate > IIf(frmIndividualSaudi.optDOBGreg.Value = True, 31, 30) Then
             MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
             cmbDobDate.text = ""
             cmbDobDate.SetFocus
          Else
             On Error Resume Next
             cmbDobMonth.SetFocus
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

Private Sub cmbFRExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbFRExpiryDate.text)) <> 0 Then
         If Len(cmbFRExpiryDate) = 2 Then
            If cmbFRExpiryDate < 1 Or _
               cmbFRExpiryDate > IIf(optIdDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbFRExpiryDate.text = ""
               cmbFRExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbFRExpiryMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbFRExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbFRExpiryMonth.text)) <> 0 Then
         If Len(cmbFRExpiryMonth.text) = 2 Then
            If cmbFRExpiryMonth < 1 Or cmbFRExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbFRExpiryMonth.text = ""
               cmbFRExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtFRExpiryYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbFRIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbFRIssueDate.text)) <> 0 Then
         If Len(cmbFRIssueDate.text) = 2 Then
            If cmbFRIssueDate < 1 Or _
               cmbFRIssueDate > IIf(optFRDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbFRIssueDate.text = ""
               cmbFRIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbFRIssueMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbFRIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbFRIssueMonth.text)) <> 0 Then
         If Len(cmbFRIssueMonth.text) = 2 Then
            If cmbFRIssueMonth < 1 Or cmbFRIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbFRIssueMonth.text = ""
               cmbFRIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtFRIssueYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbHafExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbHafExpiryDate.text)) <> 0 Then
         If Len(cmbHafExpiryDate) = 2 Then
            If cmbHafExpiryDate < 1 Or _
               cmbHafExpiryDate > IIf(optHafDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbHafExpiryDate.text = ""
               cmbHafExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbHafExpiryMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbHafExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbHafExpiryMonth.text)) <> 0 Then
         If Len(cmbHafExpiryMonth.text) = 2 Then
            If cmbHafExpiryMonth < 1 Or cmbHafExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbHafExpiryMonth.text = ""
               cmbHafExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtHafExpiryYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbHafIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbHafIssueDate.text)) <> 0 Then
         If Len(cmbHafIssueDate.text) = 2 Then
            If cmbHafIssueDate < 1 Or _
               cmbHafIssueDate > IIf(optHafDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbHafIssueDate.text = ""
               cmbHafIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbHafIssueMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbHafIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbHafIssueMonth.text)) <> 0 Then
         If Len(cmbHafIssueMonth.text) = 2 Then
            If cmbHafIssueMonth < 1 Or cmbHafIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbHafIssueMonth.text = ""
               cmbHafIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtHafIssueYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdExpiryDate.text)) <> 0 Then
         If Len(cmbIdExpiryDate) = 2 Then
            If cmbIdExpiryDate < 1 Or _
               cmbIdExpiryDate > IIf(optIdDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIdExpiryDate.text = ""
               cmbIdExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbIdExpiryMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdExpiryDate_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errOnlyNumeralsAllowed(UserLang))
        Exit Sub
    End If
End Sub

Private Sub cmbIdExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdExpiryMonth.text)) <> 0 Then
         If Len(cmbIdExpiryMonth.text) = 2 Then
            If cmbIdExpiryMonth < 1 Or cmbIdExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIdExpiryMonth.text = ""
               cmbIdExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtIdExpiryYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdIssueDate.text)) <> 0 Then
         If Len(cmbIdIssueDate.text) = 2 Then
            If cmbIdIssueDate < 1 Or _
               cmbIdIssueDate > IIf(optIdDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIdIssueDate.text = ""
               cmbIdIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbIdIssueMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdIssueDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIdIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdIssueMonth.text)) <> 0 Then
         If Len(cmbIdIssueMonth.text) = 2 Then
            If cmbIdIssueMonth < 1 Or cmbIdIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIdIssueMonth.text = ""
               cmbIdIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtIdIssueYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIdIssueYear)) <> 0 Then
        If Len(txtIdIssueYear) = 4 Then
           cmbIdExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub cmbIdIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub cmbIdIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       On Error Resume Next
       If Len(RTrim(txtIdIssueYear)) <> 0 Then
          If optIdDateHijri.Value = True Then
             If txtIdIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdIssueYear.Enabled = True Then
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtIdIssueYear.Enabled = True
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                End If
             End If
          Else
             If txtIdIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdIssueYear.Enabled = True Then
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                Else
                   txtIdIssueYear.Enabled = True
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                End If
             End If
          End If
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

Private Sub cmbTitle_Click()
   If Mid$(cmbTitle.text, 1, 2) = "02" Or _
      Mid$(cmbTitle.text, 1, 2) = "03" Or _
      Mid$(cmbTitle.text, 1, 2) = "06" Then  ' MISYS
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

Private Sub cmdCancel_Click()
    Unload Me
    Unload frmIndividualSaudi2
    Unload frmIndividualJoint
    Unload frmIndividualSaudiAcctInfo
    If supervisorAction Or tellerAction Then
       Unload frmSupervisorApproval
    End If
End Sub

Private Sub cmdAcctInfo_Click()
    Dim retStr As String
    
    If InStr(recvLoginMsg.AuthorityLevel, "~6") > 0 Then
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
    If InStr(recvLoginMsg.AuthorityLevel, "~4") > 0 Then
        If Len(RTrim(txtCustomerNo)) = 0 Then
           MsgBox errInvalidSearchCriteria(UserLang)
           Exit Sub
        End If
        retStr = searchCard1("00000", txtCustomerNo, "              ")
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

Private Sub cmdNextPage_Click()

  Dim tCode As String
  Dim newOrUpdate As String
  Dim tCustNo As String
  Dim custName As String
  Dim tIdType As String, tIdNo As String

  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
         
     If validateIndividualSaudi = 1 Then
        Exit Sub
     End If
     
     If updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
        newOrUpdate = "U"
        tCustNo = Format(txtCustomerNo, "!@@@@@@@")
     Else
        newOrUpdate = "N"
        tCustNo = Space(7)
     End If
     tIdType = Space(1)
     tIdNo = Space(15)
     If Len(RTrim(frmIndividualSaudi.txtIdNo)) > 0 Then
        tIdType = "I"
        tIdNo = Format(frmIndividualSaudi.txtIdNo, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmIndividualSaudi.txtPPNumber)) > 0 Then
        tIdType = "P"
        tIdNo = Format(frmIndividualSaudi.txtPPNumber, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmIndividualSaudi.txtHafNo)) > 0 Then
        tIdType = "H"
        tIdNo = Format(frmIndividualSaudi.txtHafNo, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmIndividualSaudi.txtFRNo)) > 0 Then
        tIdType = "F"
        tIdNo = Format(frmIndividualSaudi.txtFRNo, "!@@@@@@@@@@@@@@@")
     End If
     
     If optLangArabic = True Then
        custName = txtArabFirstName & " " & txtArabic2ndName & " " & _
                   txtArabic3rdName & " " & txtArabLastName
     Else
        custName = txtEngFirstName & " " & txtEnglish2ndName & " " & _
                   txtEnglish3rdName & " " & txtEngLastName
     End If
    
     If checkCustomerExistance(tIdType, tIdNo, newOrUpdate, tCustNo, custName) = 1 Then
        Exit Sub
     End If
     
     CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
      'MsgBox forReference
      
      If forReference = 1 Then 'not selected
         frmIndividualSaudiAcctInfo.Show
         CSD_mdiForm.staticStatus.Panels(3).text = "     "
      Else
         frmIndividualSaudi2.chkBlind.Value = chkBlind.Value
         frmIndividualSaudi2.chkIncptPerson.Value = chkIncptPerson.Value
         frmIndividualSaudi2.chkMentDisabled.Value = chkMentDisabled.Value
         frmIndividualSaudi2.chkMinor.Value = chkMinor.Value
         frmIndividualSaudi2.chkMinorSpl.Value = chkMinorSpl.Value
         frmIndividualSaudi2.chkVeiled.Value = chkVeiled.Value
         frmIndividualSaudi2.Show
         CSD_mdiForm.staticStatus.Panels(3).text = "     "
      End If
   End If
      
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      If subCategoryCode = "02" Then 'added by nad on Dec 1 03
        
     ' If InStr(recvSaudiIndividualMsg.referenceReqdFor, "1") > 0 Then ' commented by arul on 01 Dec 03
          'MsgBox recvSaudiIndividualMsg.referenceReqdFor '"where am i?"
          frmIndividualSaudi.MousePointer = vbHourglass
          CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
          frmIndividualSaudi2.Hide
          doReferenceSearch "00000", frmIndividualSaudi.txtCustomerNo, Space(4)
          frmIndividualSaudi.MousePointer = vbDefault
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
          frmIndividualSaudi2.chkBlind.Value = chkBlind.Value
          frmIndividualSaudi2.chkIncptPerson.Value = chkIncptPerson.Value
          frmIndividualSaudi2.chkMentDisabled.Value = chkMentDisabled.Value
          frmIndividualSaudi2.chkMinor.Value = chkMinor.Value
          frmIndividualSaudi2.chkMinorSpl.Value = chkMinorSpl.Value
          frmIndividualSaudi2.chkVeiled.Value = chkVeiled.Value
          frmIndividualSaudi2.Show
      Else
        frmIndividualSaudiAcctInfo.Show
      End If
   End If
    
End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox recvSaudiIndividualMsg.supervisorComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mainBrCode As String, mainBrArbName As String, mainBrEngName As String
    Dim mQry, i, num, tListIndex
    
    If UserLang = ARABIC Then
       ChangePositions frmIndividualSaudi, 11800
       frmIndividualSaudi.RightToLeft = True
       frameOpenUpdateDetails.RightToLeft = True
    End If
    If Len(RTrim(gDateTime)) = 0 Then
       gDateTime = Space(14)   'Date Time to be used for global
    End If
    txtSysDate.text = Date
    
    frmIndividualSaudi.Caption = mainCategoryDesc & "  " & subCategoryDesc
    frmIndividualSaudi.lblCustNo.Caption = frmIndividualSaudiCaption(1, UserLang)
    frmIndividualSaudi.lblBranch.Caption = frmIndividualSaudiCaption(2, UserLang)
    frmIndividualSaudi.lblSysDate.Caption = frmIndividualSaudiCaption(3, UserLang)
    frmIndividualSaudi.lblIdNumber.Caption = frmIndividualSaudiCaption(6, UserLang)
    frmIndividualSaudi.lblIdIssueAt.Caption = frmIndividualSaudiCaption(7, UserLang)
    frmIndividualSaudi.lblIdDateType.Caption = frmIndividualSaudiCaption(8, UserLang)
    frmIndividualSaudi.optIdDateHijri.Caption = frmIndividualSaudiCaption(9, UserLang)
    frmIndividualSaudi.optIdDateGreg.Caption = frmIndividualSaudiCaption(10, UserLang)
    frmIndividualSaudi.lblIdIssueDate.Caption = frmIndividualSaudiCaption(11, UserLang)
    frmIndividualSaudi.lblIdExpiryDate.Caption = frmIndividualSaudiCaption(12, UserLang)
    frmIndividualSaudi.lblLangPref.Caption = frmIndividualSaudiCaption(13, UserLang)
    frmIndividualSaudi.optLangArabic.Caption = frmIndividualSaudiCaption(14, UserLang)
    frmIndividualSaudi.optLangEnglish.Caption = frmIndividualSaudiCaption(15, UserLang)
    frmIndividualSaudi.lblTitleCode.Caption = frmIndividualSaudiCaption(17, UserLang)
    frmIndividualSaudi.lblFirstName.Caption = frmIndividualSaudiCaption(18, UserLang)
    frmIndividualSaudi.lbl2ndName.Caption = frmIndividualSaudiCaption(19, UserLang)
    frmIndividualSaudi.lbl3rdName.Caption = frmIndividualSaudiCaption(20, UserLang)
    frmIndividualSaudi.lblLastName.Caption = frmIndividualSaudiCaption(21, UserLang)
    frmIndividualSaudi.lblArabicName.Caption = frmIndividualSaudiCaption(22, UserLang)
    frmIndividualSaudi.lblArabicShortName.Caption = frmIndividualSaudiCaption(23, UserLang)
    frmIndividualSaudi.lblEnglishName.Caption = frmIndividualSaudiCaption(24, UserLang)
'    frmIndividualSaudi.lblEnglishShortName.Caption = frmIndividualSaudiCaption(25, UserLang)
    frmIndividualSaudi.lblDOBDateType.Caption = frmIndividualSaudiCaption(26, UserLang)
    frmIndividualSaudi.lblDateOfBirth.Caption = frmIndividualSaudiCaption(29, UserLang)
    frmIndividualSaudi.optDOBHijri.Caption = frmIndividualSaudiCaption(27, UserLang)
    frmIndividualSaudi.optDOBGreg.Caption = frmIndividualSaudiCaption(28, UserLang)
    frmIndividualSaudi.lblGender.Caption = frmIndividualSaudiCaption(30, UserLang)
    frmIndividualSaudi.optGenderMale.Caption = frmIndividualSaudiCaption(31, UserLang)
    frmIndividualSaudi.optGenderFemale.Caption = frmIndividualSaudiCaption(32, UserLang)
    frmIndividualSaudi.lblVip.Caption = frmIndividualSaudiCaption(33, UserLang)
    frmIndividualSaudi.optVipYes.Caption = frmIndividualSaudiCaption(34, UserLang)
    frmIndividualSaudi.optVipNo.Caption = frmIndividualSaudiCaption(35, UserLang)
    frmIndividualSaudi.lblMaritalStatus.Caption = frmIndividualSaudiCaption(36, UserLang)
    frmIndividualSaudi.optMarried.Caption = frmIndividualSaudiCaption(37, UserLang)
    frmIndividualSaudi.OptSingle.Caption = frmIndividualSaudiCaption(38, UserLang)
    frmIndividualSaudi.optOthers.Caption = frmIndividualSaudiCaption(39, UserLang)
    frmIndividualSaudi.lblDependents.Caption = frmIndividualSaudiCaption(40, UserLang)
    frmIndividualSaudi.frameResidentStatus.Caption = frmIndividualSaudiCaption(41, UserLang)
    frmIndividualSaudi.optResident.Caption = frmIndividualSaudiCaption(42, UserLang)
    frmIndividualSaudi.optNonResident.Caption = frmIndividualSaudiCaption(43, UserLang)
    frmIndividualSaudi.lblBusinessType.Caption = frmIndividualSaudiCaption(44, UserLang)
    frmIndividualSaudi.lblAddress1.Caption = frmIndividualSaudiCaption(55, UserLang)
    frmIndividualSaudi.lblPOBox.Caption = frmIndividualSaudiCaption(57, UserLang)
    frmIndividualSaudi.lblCity.Caption = frmIndividualSaudiCaption(58, UserLang)
    frmIndividualSaudi.lblZipCode.Caption = frmIndividualSaudiCaption(59, UserLang)
    frmIndividualSaudi.lblCountry.Caption = frmIndividualSaudiCaption(60, UserLang)
    frmIndividualSaudi.lblOffPhone.Caption = frmIndividualSaudiCaption(61, UserLang)
    frmIndividualSaudi.lblResPhone.Caption = frmIndividualSaudiCaption(62, UserLang)
    frmIndividualSaudi.lblFax.Caption = frmIndividualSaudiCaption(63, UserLang)
    frmIndividualSaudi.lblMobile.Caption = frmIndividualSaudiCaption(64, UserLang)
    frmIndividualSaudi.lblPager.Caption = frmIndividualSaudiCaption(65, UserLang)
    frmIndividualSaudi.lblEmail.Caption = frmIndividualSaudiCaption(66, UserLang)
    frmIndividualSaudi.cmdNextPage.Caption = frmIndividualSaudiCaption(67, UserLang)
    frmIndividualSaudi.cmdCancel.Caption = frmIndividualSaudiCaption(68, UserLang)
    frmIndividualSaudi.lblAltBranchCode.Caption = frmIndividualSaudiCaption(73, UserLang)
   
    frmIndividualSaudi.chkBlind.Caption = frmIndividualSaudiCaption(76, UserLang)
    frmIndividualSaudi.chkVeiled.Caption = frmIndividualSaudiCaption(77, UserLang)
    frmIndividualSaudi.chkIncptPerson.Caption = frmIndividualSaudiCaption(78, UserLang)
    frmIndividualSaudi.chkMinor.Caption = frmIndividualSaudiCaption(79, UserLang)
    frmIndividualSaudi.chkMinorSpl.Caption = frmIndividualSaudiCaption(80, UserLang)
    frmIndividualSaudi.chkMentDisabled.Caption = frmIndividualSaudiCaption(81, UserLang)
    
    frmIndividualSaudi.lblCobNo.Caption = frmIndividualSaudiCaption(25, UserLang)

    frmIndividualSaudi.lblPpNo.Caption = frmIndividualSaudiCaption(82, UserLang)
    frmIndividualSaudi.lblPpIssAt.Caption = frmIndividualSaudiCaption(83, UserLang)
    frmIndividualSaudi.lblPpDateType.Caption = frmIndividualSaudiCaption(84, UserLang)
    frmIndividualSaudi.optPPDateHijri.Caption = frmIndividualSaudiCaption(9, UserLang)
    frmIndividualSaudi.optPPDateGreg.Caption = frmIndividualSaudiCaption(10, UserLang)
    frmIndividualSaudi.lblPpIssDate.Caption = frmIndividualSaudiCaption(87, UserLang)
    frmIndividualSaudi.lblPpExpiryDate.Caption = frmIndividualSaudiCaption(88, UserLang)
    
    frmIndividualSaudi.lblHafNo.Caption = frmIndividualSaudiCaption(89, UserLang)
    frmIndividualSaudi.lblHafIssAt.Caption = frmIndividualSaudiCaption(90, UserLang)
    frmIndividualSaudi.lblHafDateType.Caption = frmIndividualSaudiCaption(91, UserLang)
    frmIndividualSaudi.optHafDateHijri.Caption = frmIndividualSaudiCaption(9, UserLang)
    frmIndividualSaudi.optHafDateGreg.Caption = frmIndividualSaudiCaption(10, UserLang)
    frmIndividualSaudi.lblHafIssDate.Caption = frmIndividualSaudiCaption(94, UserLang)
    frmIndividualSaudi.lblHafExpiryDate.Caption = frmIndividualSaudiCaption(95, UserLang)
    
    frmIndividualSaudi.lblFRNo.Caption = frmIndividualSaudiCaption(96, UserLang)
    frmIndividualSaudi.lblFRIssAt.Caption = frmIndividualSaudiCaption(97, UserLang)
    frmIndividualSaudi.lblFRDateType.Caption = frmIndividualSaudiCaption(98, UserLang)
    frmIndividualSaudi.optFRDateHijri.Caption = frmIndividualSaudiCaption(9, UserLang)
    frmIndividualSaudi.optFRDateGreg.Caption = frmIndividualSaudiCaption(10, UserLang)
    frmIndividualSaudi.lblFRIssDate.Caption = frmIndividualSaudiCaption(101, UserLang)
    frmIndividualSaudi.lblFRExpiryDate.Caption = frmIndividualSaudiCaption(102, UserLang)
    
    frmIndividualSaudi.cmdNextPage.Caption = frmIndividualSaudiCaption(67, UserLang)
    frmIndividualSaudi.cmdCancel.Caption = frmIndividualSaudiCaption(68, UserLang)
    frmIndividualSaudi.cmdAcctInfo.Caption = frmIndividualSaudiCaption(103, UserLang)
    frmIndividualSaudi.cmdSupervisorComments.Caption = frmIndividualSaudiCaption(69, UserLang)
    frmIndividualSaudi.cmdCardInfo.Caption = frmIndividualSaudiCaption(74, UserLang)
    
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
       tCode = Mid$(frmIndividualSaudi.cmbAltBrCode, 1, 4)
       If realOrPseudo = "0" Then  ' if the local branch is pseudo branch, then default the
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
        cmbIdIssuedAt.Clear
        cmbPPIssuedAt.Clear
        cmbHafIssuedAt.Clear
        cmbFRIssuedAt.Clear
        cmbCity.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbIdIssuedAt.AddItem rs("englishname")
              cmbPPIssuedAt.AddItem rs("englishname")
              cmbHafIssuedAt.AddItem rs("englishname")
              cmbFRIssuedAt.AddItem rs("englishname")
              cmbCity.AddItem rs("englishname")
           Else
              cmbIdIssuedAt.AddItem rs("arabicname")
              cmbPPIssuedAt.AddItem rs("arabicname")
              cmbHafIssuedAt.AddItem rs("arabicname")
              cmbFRIssuedAt.AddItem rs("arabicname")
              cmbCity.AddItem rs("arabicname")
           End If
           rs.MoveNext
        Loop
    End If
    
    Set rs = db.OpenRecordset("select citycode from branchinfo " + _
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
                cmbIdIssuedAt.text = rs(0)
                cmbPPIssuedAt.text = rs(0)
                cmbHafIssuedAt.text = rs(0) 'nad
                cmbFRIssuedAt.text = rs(0) 'nad
                cmbCity.text = rs(0)
             Else
                cmbIdIssuedAt.text = rs(1)
                cmbPPIssuedAt.text = rs(1)
                cmbHafIssuedAt.text = rs(1) 'nad
                cmbFRIssuedAt.text = rs(1) 'nad
                cmbCity.text = rs(1)
             End If
         Else
            txtOffPhoneCityCode = "01"
            txtResPhoneCityCode = "01"
            txtFaxCityCode = "01"
            cmbIdIssuedAt.text = ""
            cmbPPIssuedAt.text = ""
            cmbHafIssuedAt.text = "" 'nad
            cmbFRIssuedAt.text = "" 'nad
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
        Do While Not rs.EOF
           If UserLang = ARABIC Then
              cmbCountry.AddItem rs("countrycode") & " - " & rs("arabicname")
            Else
              cmbCountry.AddItem rs("countrycode") & " - " & rs("englishname")
            End If
           rs.MoveNext
        Loop
        cmbCountry.ListIndex = 0
    End If
    
    cmbIdIssueDate.Clear
    cmbIdIssueMonth.Clear
    cmbDobDate.Clear
    cmbDobMonth.Clear
    cmbIdExpiryDate.Clear
    cmbIdExpiryMonth.Clear
    cmbPPIssueDate.Clear
    cmbPPIssueMonth.Clear
    cmbPPExpiryDate.Clear
    cmbPPExpiryMonth.Clear
    cmbHafIssueDate.Clear
    cmbHafIssueMonth.Clear
    cmbHafExpiryDate.Clear
    cmbHafExpiryMonth.Clear
    cmbFRIssueDate.Clear
    cmbFRIssueMonth.Clear
    cmbFRExpiryDate.Clear
    cmbFRExpiryMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" + CStr(i)
       Else
          num = CStr(i)
       End If
       cmbIdIssueDate.AddItem num
       cmbPPIssueDate.AddItem num 'nad
       cmbHafIssueDate.AddItem num 'nad
       cmbFRIssueDate.AddItem num 'nad
       cmbDobDate.AddItem num
       cmbIdExpiryDate.AddItem num
       cmbPPExpiryDate.AddItem num 'nad
       cmbHafExpiryDate.AddItem num 'nad
       cmbFRExpiryDate.AddItem num 'nad
       If i < 13 Then
          cmbIdIssueMonth.AddItem num
          cmbPPIssueMonth.AddItem num 'nad
          cmbHafIssueMonth.AddItem num 'nad
          cmbFRIssueMonth.AddItem num 'nad
          cmbDobMonth.AddItem num
          cmbIdExpiryMonth.AddItem num
          cmbPPExpiryMonth.AddItem num 'nad
          cmbHafExpiryMonth.AddItem num 'nad
          cmbFRExpiryMonth.AddItem num 'nad
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
   frmIndividualSaudi.txtCustomerNo = Space(7)
   
   If supervisorAction Or tellerAction Then
      If Len(RTrim(recvSaudiIndividualMsg.supervisorComments)) > 0 Then
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
      framePassportInfo.Enabled = False
      FrameHafizaInfo.Enabled = False
      FrameFamilyRegnInfo.Enabled = False
      frameRefFor.Enabled = False
      txtCOBNo.Enabled = False
      frameLang.Enabled = False
      'cmbNationality.Enabled = False
      cmbTitle.Enabled = False
      frameDobDateType.Enabled = False
      frameVip.Enabled = False
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
      Else
         lblHistory.Visible = False
      End If
   Else
      cmbAltBrCode.Enabled = True
      frameCustomerName.Enabled = True
      frameIdInfo.Enabled = True
      framePassportInfo.Enabled = True
      FrameHafizaInfo.Enabled = True
      FrameFamilyRegnInfo.Enabled = True
      If subCategoryCode = "02" Then
         frameRefFor.Enabled = True
      Else
         frameRefFor.Enabled = False
      End If
      txtCOBNo.Enabled = True
      frameLang.Enabled = True
      'cmbNationality.Enabled = True
      cmbTitle.Enabled = True
      frameDobDateType.Enabled = True
      If Not (updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U")) Then
         If recvLoginMsg.globalUpdatePriv = "1" Then   ' MISYS
            cmbBranchCode.Enabled = True
         Else
            cmbBranchCode.Enabled = False
         End If
           
         If recvLoginMsg.globalUpdatePriv = "2" Then   ' MISYS
            If recvLoginMsg.mainBrEditAllowed = "1" Then
               cmbBranchCode.Enabled = True
            Else
               cmbBranchCode.Enabled = False
            End If
         End If
         cmdAcctInfo.Enabled = False
         cmdCardInfo.Enabled = False
      End If
      
      If updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
         If recvLoginMsg.custNameUpdAllowed = "1" Then
            frameCustomerName.Enabled = True
            frameLang.Enabled = True
         Else
            frameCustomerName.Enabled = False
            frameLang.Enabled = False
         End If
      End If
      
      If updateAction Then
         If gBranchCode = "0499" Then
            frameVip.Enabled = True
         Else
            frameVip.Enabled = False
         End If
      ElseIf tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U" Then
         If gBranchCode = "0499" Then
            frameVip.Enabled = True
         End If
      Else
         frameVip.Enabled = False
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

Private Sub FrameFamilyRegnInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameHafizaInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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

Private Sub frameRefFor_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optDOBGreg_Click()
   If cmbDobDate.ListCount = 30 Then
      cmbDobDate.AddItem 31
   End If
End Sub

Private Sub optDOBHijri_Click()
   If cmbDobDate.ListCount = 31 Then
      cmbDobDate.RemoveItem 30
    End If
End Sub

Private Sub optFRDateGreg_Click()
   If cmbFRIssueDate.ListCount = 30 Then
      cmbFRIssueDate.AddItem 31
      cmbFRExpiryDate.AddItem 31
   End If
End Sub

Private Sub optFRDateHijri_Click()
   If cmbFRIssueDate.ListCount = 31 Then
      cmbFRIssueDate.RemoveItem 30
      cmbFRExpiryDate.RemoveItem 30
    End If
End Sub

Private Sub optGenderFemale_Click()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Mid$(cmbTitle.text, 1, 2) <> "02" And _
       Mid$(cmbTitle.text, 1, 2) <> "03" And _
       Mid$(cmbTitle.text, 1, 2) <> "06" Then  'MISYS
       MsgBox errInvalidTitle(UserLang)
       optGenderMale.Value = True
    End If
End If

End Sub

Private Sub optGenderMale_Click()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Mid$(cmbTitle.text, 1, 2) = "02" Or _
       Mid$(cmbTitle.text, 1, 2) = "03" Then
      
       MsgBox errInvalidTitle(UserLang)
       optGenderFemale.Value = True
    End If
 End If

End Sub

Private Sub optHafDateGreg_Click()
   If cmbHafIssueDate.ListCount = 30 Then
      cmbHafIssueDate.AddItem 31
      cmbHafExpiryDate.AddItem 31
   End If
End Sub

Private Sub optHafDateHijri_Click()
   If cmbHafIssueDate.ListCount = 31 Then
      cmbHafIssueDate.RemoveItem 30
      cmbHafExpiryDate.RemoveItem 30
    End If

End Sub

Private Sub optIdDateGreg_Click()
   If cmbIdIssueDate.ListCount = 30 Then
      cmbIdIssueDate.AddItem 31
      cmbIdExpiryDate.AddItem 31
   End If

End Sub

Private Sub optIdDateHijri_Click()
   If cmbIdIssueDate.ListCount = 31 Then
      cmbIdIssueDate.RemoveItem 30
      cmbIdExpiryDate.RemoveItem 30
    End If
End Sub

Private Sub optppDateGreg_Click()
   If cmbPPIssueDate.ListCount = 30 Then
      cmbPPIssueDate.AddItem 31
      cmbPPExpiryDate.AddItem 31
   End If
End Sub

Private Sub optppDateHijri_Click()
   If cmbPPIssueDate.ListCount = 31 Then
      cmbPPIssueDate.RemoveItem 30
      cmbPPExpiryDate.RemoveItem 30
    End If

End Sub

Private Sub txtAddress1_KeyPress(KeyAscii As Integer)
   If frmIndividualSaudi.optLangArabic Then
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
   If frmIndividualSaudi.optLangArabic Then
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
Private Sub txtCOBNo_KeyPress(KeyAscii As Integer)
 If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
     KeyAscii = 0
     MsgBox (errOnlyNumeralsAllowed(UserLang))
     Exit Sub
 End If
End Sub
Private Sub txtDependents_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
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
        If Len(RTrim(cmbDobDate)) > 0 And Len(RTrim(cmbDobMonth)) > 0 Then
           If Len(RTrim(txtDobYear)) <> 4 Then
              MsgBox errEnterValidYear(UserLang)
              txtDobYear.text = ""
              txtDobYear.SetFocus
              Exit Sub
           End If
        End If
        On Error Resume Next
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

Private Sub txtFRExpiryMonth_LostFocus()
     If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
       On Error Resume Next
       If optFRDateHijri.Value = True Then
          If Len(RTrim(txtFRExpiryYear)) <> 0 Then
             If txtFRExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                frameFRInfo.Enabled = True
                If txtFRExpiryYear.Enabled = True Then
                   txtFRExpiryYear.text = ""
                   txtFRExpiryYear.SetFocus
                Else
                   frameFRInfo.Enabled = True
                   txtFRExpiryYear.Enabled = True
                   txtFRExpiryYear.text = ""
                   txtFRExpiryYear.SetFocus
                End If
             End If
          End If
       Else
          If Len(RTrim(txtFRExpiryYear)) <> 0 Then
             If txtFRExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtFRExpiryYear.Enabled = True Then
                   txtFRExpiryYear.text = ""
                   txtFRExpiryYear.SetFocus
                Else
                   frameFRInfo.Enabled = True
                   txtFRExpiryYear.Enabled = True
                   txtFRExpiryYear.text = ""
                   txtFRExpiryYear.SetFocus
                End If
             End If
          End If
       End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtFRExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtFRExpiryYear)) <> 0 Then
        If Len(txtFRExpiryYear) = 4 Then
           txtCOBNo.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtFRExpiryYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
       On Error Resume Next
       If Len(RTrim(cmbFRExpiryDate)) > 0 And Len(RTrim(cmbFRExpiryMonth)) > 0 Then
          If Len(RTrim(txtFRExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtFRExpiryYear.text = ""
             txtFRExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       If optFRDateHijri.Value = True Then
          If Len(RTrim(txtFRExpiryYear)) <> 0 Then
             If txtFRExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                frameIdInfo.Enabled = True
                If txtFRExpiryYear.Enabled = True Then
                   txtFRExpiryYear.text = ""
                   txtFRExpiryYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtFRExpiryYear.Enabled = True
                   txtFRExpiryYear.text = ""
                   txtFRExpiryYear.SetFocus
                End If
             End If
          End If
       Else
          If Len(RTrim(txtFRExpiryYear)) <> 0 Then
             If txtFRExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtFRExpiryYear.Enabled = True Then
                   txtFRExpiryYear.text = ""
                   txtFRExpiryYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtFRExpiryYear.Enabled = True
                   txtFRExpiryYear.text = ""
                   txtFRExpiryYear.SetFocus
                End If
             End If
          End If
       End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtFRIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtFRIssueYear)) <> 0 Then
        If Len(txtFRIssueYear) = 4 Then
           cmbFRExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtFRIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       On Error Resume Next
       If Len(RTrim(cmbFRIssueDate)) > 0 And Len(RTrim(cmbFRIssueMonth)) > 0 Then
          If Len(RTrim(txtFRIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtFRIssueYear.text = ""
             txtFRIssueYear.SetFocus
             Exit Sub
          End If
       End If
       If Len(RTrim(txtFRIssueYear)) <> 0 Then
          If optFRDateHijri.Value = True Then
             If txtFRIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtFRIssueYear.Enabled = True Then
                   txtFRIssueYear.text = ""
                   txtFRIssueYear.SetFocus
                Else
                   frameFRInfo.Enabled = True
                   txtFRIssueYear.Enabled = True
                   txtFRIssueYear.text = ""
                   txtFRIssueYear.SetFocus
                End If
             End If
          Else
             If txtFRIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtFRIssueYear.Enabled = True Then
                   txtFRIssueYear.text = ""
                   txtFRIssueYear.SetFocus
                Else
                   txtFRIssueYear.Enabled = True
                   txtFRIssueYear.text = ""
                   txtFRIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If
End Sub

Private Sub txtHafExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtHafExpiryYear)) <> 0 Then
        If Len(txtHafExpiryYear) = 4 Then
           txtFRNo.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtHafExpiryYear_KeyPress(KeyAscii As Integer)
   If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHafExpiryYear_LostFocus()
     If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
       On Error Resume Next
       If Len(RTrim(cmbHafExpiryDate)) > 0 And Len(RTrim(cmbHafExpiryMonth)) > 0 Then
          If Len(RTrim(txtHafExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtHafExpiryYear.text = ""
             txtHafExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       If optHafDateHijri.Value = True Then
          If Len(RTrim(txtHafExpiryYear)) <> 0 Then
             If txtHafExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                framehafInfo.Enabled = True
                If txtHafExpiryYear.Enabled = True Then
                   txtHafExpiryYear.text = ""
                   txtHafExpiryYear.SetFocus
                Else
                   framehafInfo.Enabled = True
                   txtHafExpiryYear.Enabled = True
                   txtHafExpiryYear.text = ""
                   txtHafExpiryYear.SetFocus
                End If
             End If
          End If
       Else
          If Len(RTrim(txtHafExpiryYear)) <> 0 Then
             If txtHafExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtHafExpiryYear.Enabled = True Then
                   txtHafExpiryYear.text = ""
                   txtHafExpiryYear.SetFocus
                Else
                   framehafInfo.Enabled = True
                   txtHafExpiryYear.Enabled = True
                   txtHafExpiryYear.text = ""
                   txtHafExpiryYear.SetFocus
                End If
             End If
          End If
       End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtHafIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtHafIssueYear)) <> 0 Then
        If Len(txtHafIssueYear) = 4 Then
           cmbHafExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtHafIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbHafIssueDate)) > 0 And Len(RTrim(cmbHafIssueMonth)) > 0 Then
          If Len(RTrim(txtHafIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtHafIssueYear.text = ""
             txtHafIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtHafIssueYear)) <> 0 Then
          If optHafDateHijri.Value = True Then
             If txtHafIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtHafIssueYear.Enabled = True Then
                   txtHafIssueYear.text = ""
                   txtHafIssueYear.SetFocus
                Else
                   framehafInfo.Enabled = True
                   txtHafIssueYear.Enabled = True
                   txtHafIssueYear.text = ""
                   txtHafIssueYear.SetFocus
                End If
             End If
          Else
             If txtHafIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtHafIssueYear.Enabled = True Then
                   txtHafIssueYear.text = ""
                   txtHafIssueYear.SetFocus
                Else
                   txtHafIssueYear.Enabled = True
                   txtHafIssueYear.text = ""
                   txtHafIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If
End Sub

Private Sub txtIdExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIdExpiryYear)) <> 0 Then
        If Len(txtIdExpiryYear) = 4 Then
           txtPPNumber.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtIdExpiryYear_KeyPress(KeyAscii As Integer)
   If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtIdExpiryYear_LostFocus()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
       On Error Resume Next
       If Len(RTrim(cmbIdExpiryDate)) > 0 And Len(RTrim(cmbIdExpiryMonth)) > 0 Then
          If Len(RTrim(txtIdExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtIdExpiryYear.text = ""
             txtIdExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       If optIdDateHijri.Value = True Then
          If Len(RTrim(txtIdExpiryYear)) <> 0 Then
             If txtIdExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                frameIdInfo.Enabled = True
                If txtIdExpiryYear.Enabled = True Then
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtIdExpiryYear.Enabled = True
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                End If
             End If
          End If
       Else
          If Len(RTrim(txtIdExpiryYear)) <> 0 Then
             If txtIdExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdExpiryYear.Enabled = True Then
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtIdExpiryYear.Enabled = True
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                End If
             End If
          End If
       End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtIdIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIdIssueYear)) <> 0 Then
        If Len(txtIdIssueYear) = 4 Then
           cmbIdExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtIdIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtIdIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbIdIssueDate)) > 0 And Len(RTrim(cmbIdIssueMonth)) > 0 Then
          If Len(RTrim(txtIdIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtIdIssueYear.text = ""
             txtIdIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtIdIssueYear)) <> 0 Then
          If optIdDateHijri.Value = True Then
             If txtIdIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdIssueYear.Enabled = True Then
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                Else
                   frameIdInfo.Enabled = True
                   txtIdIssueYear.Enabled = True
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                End If
             End If
          Else
             If txtIdIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdIssueYear.Enabled = True Then
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                Else
                   txtIdIssueYear.Enabled = True
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If
End Sub

Private Sub txtIdNo_KeyPress(KeyAscii As Integer)
 If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
     KeyAscii = 0
     MsgBox (errOnlyNumeralsAllowed(UserLang))
     Exit Sub
 End If
End Sub

Private Sub txtIdNo_LostFocus1()
  If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
  Else
    On Error Resume Next
    
    'Below commented by Nad on 29th Nov 2003
    
    'If Len(Trim(txtIdNo)) <> 10 Then
    '   MsgBox errInvalidId(UserLang)
    '   txtIdNo.SetFocus
    '   Exit Sub
    'End If
    On Error GoTo 0
  End If
End Sub

Private Sub txtMobileNo_KeyPress(KeyAscii As Integer)
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

Private Sub txtppExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtPPExpiryYear)) <> 0 Then
        If Len(txtPPExpiryYear) = 4 Then
           txtHafNo.SetFocus
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

Private Sub txtPPExpiryYear_LostFocus()
     If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
       On Error Resume Next
       If Len(RTrim(cmbPPExpiryDate)) > 0 And Len(RTrim(cmbPPExpiryMonth)) > 0 Then
          If Len(RTrim(txtPPExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtPPExpiryYear.text = ""
             txtPPExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       If optPPDateHijri.Value = True Then
          If Len(RTrim(txtPPExpiryYear)) <> 0 Then
             If txtPPExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                frameIdInfo.Enabled = True
                If txtPPExpiryYear.Enabled = True Then
                   txtPPExpiryYear.text = ""
                   txtPPExpiryYear.SetFocus
                Else
                   framePPInfo.Enabled = True
                   txtPPExpiryYear.Enabled = True
                   txtPPExpiryYear.text = ""
                   txtPPExpiryYear.SetFocus
                End If
             End If
          End If
       Else
          If Len(RTrim(txtPPExpiryYear)) <> 0 Then
             If txtPPExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPPExpiryYear.Enabled = True Then
                   txtPPExpiryYear.text = ""
                   txtPPExpiryYear.SetFocus
                Else
                   framePPInfo.Enabled = True
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
                   framePPInfo.Enabled = True
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
  If Not superviorAction And Not searchAction And Not custHistoryAction Then
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
