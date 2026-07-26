VERSION 5.00
Begin VB.Form frmIndividualSaudi 
   BackColor       =   &H00BFD87E&
   Caption         =   "Individual Saudi Customer Details"
   ClientHeight    =   8370
   ClientLeft      =   60
   ClientTop       =   3570
   ClientWidth     =   11805
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8370
   ScaleWidth      =   11805
   Begin VB.Frame frameSamaAuthInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   " "
      Height          =   495
      Left            =   30
      TabIndex        =   221
      Top             =   2325
      Width           =   11805
      Begin VB.TextBox txtSamaAuthExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   11220
         MaxLength       =   4
         TabIndex        =   47
         Tag             =   "11805"
         Top             =   60
         Width           =   570
      End
      Begin VB.ComboBox cmbSamaAuthExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10665
         TabIndex        =   46
         Tag             =   "11805"
         Text            =   "01"
         Top             =   45
         Width           =   555
      End
      Begin VB.ComboBox cmbSamaAuthExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10065
         TabIndex        =   45
         Tag             =   "11805"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.TextBox txtSamaAuthIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   8895
         MaxLength       =   4
         TabIndex        =   44
         Tag             =   "11805"
         Top             =   60
         Width           =   540
      End
      Begin VB.ComboBox cmbSamaAuthIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8310
         TabIndex        =   43
         Tag             =   "11805"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.ComboBox cmbSamaAuthIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7695
         TabIndex        =   42
         Tag             =   "11805"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00BFD87E&
         Height          =   405
         Left            =   5985
         TabIndex        =   222
         Tag             =   "11805"
         Top             =   -45
         Width           =   1140
         Begin VB.OptionButton optSamaAuthDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   180
            Left            =   90
            TabIndex        =   40
            Tag             =   "1140"
            ToolTipText     =   "Hijri"
            Top             =   135
            Value           =   -1  'True
            Width           =   465
         End
         Begin VB.OptionButton optSamaAuthDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   180
            Left            =   585
            TabIndex        =   41
            TabStop         =   0   'False
            Tag             =   "1140"
            ToolTipText     =   "Gregorian"
            Top             =   150
            Width           =   435
         End
      End
      Begin VB.ComboBox cmbSamaAuthIssuedAt 
         Height          =   315
         Left            =   3450
         TabIndex        =   39
         Tag             =   "11805"
         Text            =   "Riyadh"
         Top             =   60
         Width           =   1560
      End
      Begin VB.TextBox txtSamaAuthNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1275
         MaxLength       =   15
         TabIndex        =   38
         Tag             =   "11805"
         Top             =   60
         Width           =   1320
      End
      Begin VB.Label lblSamaAuthDateType 
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
         Left            =   5025
         TabIndex        =   227
         Tag             =   "11805"
         Top             =   90
         Width           =   885
      End
      Begin VB.Label lblSamaAuthIssuedAt 
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
         Left            =   2625
         TabIndex        =   226
         Tag             =   "11805"
         Top             =   75
         Width           =   855
      End
      Begin VB.Label lblSamaAuthExpiryDate 
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
         Height          =   210
         Left            =   9495
         TabIndex        =   225
         Tag             =   "11805"
         Top             =   75
         Width           =   615
      End
      Begin VB.Label lblSamaAuthIssueDate 
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
         Height          =   255
         Left            =   7140
         TabIndex        =   224
         Tag             =   "11805"
         Top             =   75
         Width           =   585
      End
      Begin VB.Label lblSamaAuthNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Sama Auth No"
         BeginProperty Font 
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
         TabIndex        =   223
         Tag             =   "11805"
         Top             =   75
         Width           =   1245
         WordWrap        =   -1  'True
      End
   End
   Begin VB.CommandButton cmdAcctInfo 
      Caption         =   "Account"
      Height          =   405
      Left            =   3120
      TabIndex        =   213
      ToolTipText     =   "Account Info"
      Top             =   7860
      Width           =   1575
   End
   Begin VB.CommandButton cmdCardInfo 
      Caption         =   "ATM Card"
      Height          =   405
      Left            =   4680
      TabIndex        =   212
      ToolTipText     =   "ATM Card Info"
      Top             =   7860
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
      Left            =   0
      TabIndex        =   189
      Top             =   6780
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
         TabIndex        =   201
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
         TabIndex        =   200
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
         TabIndex        =   199
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
         TabIndex        =   198
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
         TabIndex        =   197
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
         TabIndex        =   196
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
         TabIndex        =   195
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
         TabIndex        =   194
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
         TabIndex        =   193
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
         TabIndex        =   192
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
         TabIndex        =   191
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
         TabIndex        =   190
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
         TabIndex        =   211
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
         TabIndex        =   210
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
         TabIndex        =   209
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
         TabIndex        =   208
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
         TabIndex        =   207
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
         TabIndex        =   206
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
         TabIndex        =   205
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
         TabIndex        =   204
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
         TabIndex        =   203
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
         TabIndex        =   202
         Tag             =   "11820"
         Top             =   645
         Width           =   1275
      End
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor Comments"
      Height          =   405
      Left            =   6270
      TabIndex        =   188
      ToolTipText     =   "Supervisor Comments"
      Top             =   7860
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
      TabIndex        =   115
      Top             =   4995
      Width           =   2775
      Begin VB.OptionButton optResident 
         BackColor       =   &H00BFD87E&
         Caption         =   "Resident"
         Height          =   180
         Left            =   120
         TabIndex        =   85
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
         TabIndex        =   86
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
      TabIndex        =   170
      Top             =   3795
      Width           =   11715
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   70
         Tag             =   "11715"
         Top             =   510
         Width           =   1710
      End
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   69
         Tag             =   "11715"
         Top             =   525
         Width           =   1575
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5025
         MaxLength       =   15
         TabIndex        =   64
         Tag             =   "11715"
         Top             =   195
         Width           =   1575
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   71
         Tag             =   "11715"
         Top             =   525
         Width           =   3015
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   68
         Tag             =   "11715"
         Top             =   510
         Width           =   1815
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   67
         Tag             =   "11715"
         Top             =   495
         Width           =   1815
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   66
         Tag             =   "11715"
         Top             =   195
         Width           =   3015
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   65
         Tag             =   "11715"
         Top             =   195
         Width           =   1695
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   63
         Tag             =   "11715"
         Top             =   180
         Width           =   1815
      End
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   62
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
         TabIndex        =   177
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
         TabIndex        =   176
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
         TabIndex        =   175
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
         TabIndex        =   174
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
         TabIndex        =   173
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
         TabIndex        =   172
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
         TabIndex        =   171
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
      TabIndex        =   58
      Tag             =   "11775"
      Top             =   3465
      Width           =   1935
   End
   Begin VB.Frame framePassportInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   375
      Left            =   60
      TabIndex        =   164
      Top             =   1260
      Width           =   11820
      Begin VB.Frame framePPDateType 
         BackColor       =   &H00BFD87E&
         Height          =   390
         Left            =   5910
         TabIndex        =   229
         Tag             =   "11790"
         Top             =   -90
         Width           =   1215
         Begin VB.OptionButton optPPDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   195
            Left            =   630
            TabIndex        =   21
            TabStop         =   0   'False
            Tag             =   "1215"
            ToolTipText     =   "Gregorian"
            Top             =   135
            Width           =   465
         End
         Begin VB.OptionButton optPPDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   210
            Left            =   90
            TabIndex        =   20
            Tag             =   "1215"
            ToolTipText     =   "Hijri"
            Top             =   135
            Value           =   -1  'True
            Width           =   450
         End
      End
      Begin VB.TextBox txtPPNumber 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1215
         MaxLength       =   15
         TabIndex        =   18
         Tag             =   "11820"
         Top             =   15
         Width           =   1335
      End
      Begin VB.ComboBox cmbPPIssuedAt 
         Height          =   315
         Left            =   3420
         TabIndex        =   19
         Tag             =   "11820"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1530
      End
      Begin VB.ComboBox cmbPPIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7695
         TabIndex        =   22
         Tag             =   "11820"
         Text            =   "01"
         Top             =   0
         Width           =   615
      End
      Begin VB.ComboBox cmbPPIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8295
         TabIndex        =   23
         Tag             =   "11820"
         Text            =   "01"
         Top             =   0
         Width           =   615
      End
      Begin VB.TextBox txtPPIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8895
         MaxLength       =   4
         TabIndex        =   24
         Tag             =   "11820"
         Top             =   0
         Width           =   525
      End
      Begin VB.ComboBox cmbPPExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10050
         TabIndex        =   25
         Tag             =   "11820"
         Text            =   "01"
         Top             =   0
         Width           =   615
      End
      Begin VB.ComboBox cmbPPExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10620
         TabIndex        =   26
         Tag             =   "11820"
         Text            =   "01"
         Top             =   0
         Width           =   615
      End
      Begin VB.TextBox txtPPExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   11235
         MaxLength       =   4
         TabIndex        =   27
         Tag             =   "11820"
         Top             =   0
         Width           =   495
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
         Left            =   -15
         TabIndex        =   169
         Tag             =   "11820"
         Top             =   15
         Width           =   1215
      End
      Begin VB.Label lblPpIssDate 
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
         Height          =   255
         Left            =   7125
         TabIndex        =   168
         Tag             =   "11820"
         Top             =   45
         Width           =   600
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
         Left            =   9480
         TabIndex        =   167
         Tag             =   "11820"
         Top             =   30
         Width           =   600
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
         Left            =   2595
         TabIndex        =   166
         Tag             =   "11820"
         Top             =   30
         Width           =   885
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
         Left            =   4995
         TabIndex        =   165
         Tag             =   "11820"
         Top             =   30
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
      TabIndex        =   114
      ToolTipText     =   "Cancel"
      Top             =   7860
      Width           =   1305
   End
   Begin VB.Frame FrameHafizaInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   " "
      Height          =   390
      Left            =   45
      TabIndex        =   157
      Top             =   1785
      Width           =   11805
      Begin VB.TextBox txtHafNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1230
         MaxLength       =   15
         TabIndex        =   28
         Tag             =   "11805"
         Top             =   60
         Width           =   1320
      End
      Begin VB.ComboBox cmbHafIssuedAt 
         Height          =   315
         Left            =   3420
         TabIndex        =   29
         Tag             =   "11805"
         Text            =   "Riyadh"
         Top             =   60
         Width           =   1545
      End
      Begin VB.Frame frameHafDateType 
         BackColor       =   &H00BFD87E&
         Height          =   405
         Left            =   5985
         TabIndex        =   158
         Tag             =   "11805"
         Top             =   -45
         Width           =   1110
         Begin VB.OptionButton optHafDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   180
            Left            =   600
            TabIndex        =   31
            TabStop         =   0   'False
            Tag             =   "1110"
            ToolTipText     =   "Gregorian"
            Top             =   150
            Width           =   435
         End
         Begin VB.OptionButton optHafDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   180
            Left            =   75
            TabIndex        =   30
            Tag             =   "1110"
            ToolTipText     =   "Hijri"
            Top             =   135
            Value           =   -1  'True
            Width           =   465
         End
      End
      Begin VB.ComboBox cmbHafIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7695
         TabIndex        =   32
         Tag             =   "11805"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.ComboBox cmbHafIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8310
         TabIndex        =   33
         Tag             =   "11805"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.TextBox txtHafIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   8910
         MaxLength       =   4
         TabIndex        =   34
         Tag             =   "11805"
         Top             =   60
         Width           =   540
      End
      Begin VB.ComboBox cmbHafExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10065
         TabIndex        =   35
         Tag             =   "11805"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.ComboBox cmbHafExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10665
         TabIndex        =   36
         Tag             =   "11805"
         Text            =   "01"
         Top             =   45
         Width           =   555
      End
      Begin VB.TextBox txtHafExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   11220
         MaxLength       =   4
         TabIndex        =   37
         Tag             =   "11805"
         Top             =   60
         Width           =   570
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
         TabIndex        =   163
         Tag             =   "11805"
         Top             =   90
         Width           =   840
      End
      Begin VB.Label lblHafIssDate 
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
         Height          =   255
         Left            =   7140
         TabIndex        =   162
         Tag             =   "11805"
         Top             =   75
         Width           =   585
      End
      Begin VB.Label lblHafExpiryDate 
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
         Height          =   210
         Left            =   9495
         TabIndex        =   161
         Tag             =   "11805"
         Top             =   75
         Width           =   615
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
         Left            =   2595
         TabIndex        =   160
         Tag             =   "11805"
         Top             =   75
         Width           =   915
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
         Left            =   5025
         TabIndex        =   159
         Tag             =   "11805"
         Top             =   90
         Width           =   885
      End
   End
   Begin VB.CommandButton cmdNextPage 
      Caption         =   "&Next Page"
      Height          =   405
      Left            =   8445
      TabIndex        =   113
      ToolTipText     =   "Next Page"
      Top             =   7860
      Width           =   1305
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1290
      Left            =   45
      TabIndex        =   144
      Top             =   5505
      Width           =   11775
      Begin VB.TextBox txtSaudiPostUnit 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   94
         Tag             =   "11775"
         Top             =   315
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostZipCode 
         Height          =   285
         Left            =   5880
         MaxLength       =   5
         TabIndex        =   98
         Tag             =   "11775"
         Top             =   330
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostAdditionalNo 
         Height          =   285
         Left            =   7080
         MaxLength       =   4
         TabIndex        =   99
         Tag             =   "11775"
         Top             =   330
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostStreetName 
         Height          =   285
         Left            =   7560
         MaxLength       =   24
         TabIndex        =   92
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.TextBox txtSaudiPostGPSNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   5
         TabIndex        =   91
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.Frame frameAddressType 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   1200
         TabIndex        =   214
         Tag             =   "11775"
         Top             =   -120
         Width           =   2310
         Begin VB.OptionButton optSaudiPost 
            BackColor       =   &H00BFD87E&
            Caption         =   "GPS"
            BeginProperty Font 
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
            TabIndex        =   89
            Tag             =   "2310"
            ToolTipText     =   "Saudi Post"
            Top             =   180
            Width           =   915
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
            TabIndex        =   88
            Tag             =   "2310"
            ToolTipText     =   "PO Box"
            Top             =   150
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4770
         MaxLength       =   10
         TabIndex        =   111
         Tag             =   "11775"
         Top             =   975
         Width           =   1335
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4785
         MaxLength       =   4
         TabIndex        =   104
         Tag             =   "11775"
         Text            =   "01"
         Top             =   645
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8295
         MaxLength       =   4
         TabIndex        =   107
         Tag             =   "11775"
         Text            =   "01"
         Top             =   645
         Width           =   375
      End
      Begin VB.TextBox txtMobileAreaCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1185
         MaxLength       =   2
         TabIndex        =   145
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   975
         Width           =   375
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1185
         MaxLength       =   4
         TabIndex        =   101
         Tag             =   "11775"
         Text            =   "01"
         Top             =   645
         Width           =   375
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8295
         MaxLength       =   30
         TabIndex        =   112
         Tag             =   "11775"
         Top             =   960
         Width           =   3300
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   109
         Tag             =   "11775"
         Top             =   660
         Width           =   615
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8670
         MaxLength       =   10
         TabIndex        =   108
         Tag             =   "11775"
         Top             =   645
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6735
         MaxLength       =   4
         TabIndex        =   106
         Tag             =   "11775"
         Text            =   " "
         Top             =   645
         Width           =   690
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3000
         MaxLength       =   4
         TabIndex        =   103
         Tag             =   "11775"
         Top             =   645
         Width           =   630
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1665
         MaxLength       =   8
         TabIndex        =   110
         Tag             =   "11775"
         Top             =   975
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5265
         MaxLength       =   10
         TabIndex        =   105
         Tag             =   "11775"
         Top             =   645
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   102
         Tag             =   "11775"
         Top             =   630
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8295
         TabIndex        =   100
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   330
         Width           =   2280
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6210
         MaxLength       =   10
         TabIndex        =   97
         Tag             =   "11775"
         Top             =   330
         Width           =   1215
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2865
         TabIndex        =   96
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   330
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
         TabIndex        =   95
         Tag             =   "11775"
         Top             =   315
         Width           =   975
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   8295
         MaxLength       =   30
         TabIndex        =   93
         Tag             =   "11775"
         Top             =   0
         Width           =   3015
      End
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   4890
         MaxLength       =   30
         TabIndex        =   90
         Tag             =   "11775"
         Top             =   0
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
         TabIndex        =   220
         Tag             =   "11775"
         Top             =   330
         Visible         =   0   'False
         Width           =   255
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
         TabIndex        =   219
         Tag             =   "11775"
         Top             =   360
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
         Left            =   4920
         TabIndex        =   218
         Tag             =   "11655"
         Top             =   360
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
         Left            =   6000
         TabIndex        =   217
         Tag             =   "11775"
         Top             =   0
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
         Left            =   3720
         TabIndex        =   216
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
         Width           =   1335
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
         TabIndex        =   215
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
         TabIndex        =   156
         Tag             =   "11775"
         Top             =   975
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
         TabIndex        =   155
         Tag             =   "11775"
         Top             =   960
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
         TabIndex        =   154
         Tag             =   "11775"
         Top             =   645
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
         TabIndex        =   153
         Tag             =   "11775"
         Top             =   975
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
         TabIndex        =   152
         Tag             =   "11775"
         Top             =   645
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
         TabIndex        =   151
         Tag             =   "11775"
         Top             =   645
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
         TabIndex        =   150
         Tag             =   "11775"
         Top             =   330
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
         TabIndex        =   149
         Tag             =   "11775"
         Top             =   360
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
         TabIndex        =   148
         Tag             =   "11775"
         Top             =   330
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
         TabIndex        =   147
         Tag             =   "11775"
         Top             =   345
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
         TabIndex        =   146
         Tag             =   "11775"
         Top             =   0
         Width           =   975
      End
   End
   Begin VB.ComboBox cmbTitle 
      Height          =   315
      Left            =   8700
      TabIndex        =   61
      Text            =   "cmbTitle"
      Top             =   3465
      Width           =   3030
   End
   Begin VB.ComboBox cmbBusinessType 
      Height          =   315
      Left            =   9975
      TabIndex        =   87
      Tag             =   "11775"
      Text            =   "cmbBusinessType"
      Top             =   5100
      Width           =   1695
   End
   Begin VB.Frame frameMaritalStatus 
      BackColor       =   &H00BFD87E&
      Height          =   375
      Left            =   1245
      TabIndex        =   132
      Top             =   5010
      Width           =   2655
      Begin VB.OptionButton optSingle 
         BackColor       =   &H00BFD87E&
         Caption         =   "Single"
         Height          =   210
         Left            =   975
         TabIndex        =   82
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
         TabIndex        =   81
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
         TabIndex        =   83
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
      TabIndex        =   84
      Tag             =   "11775"
      Top             =   5115
      Width           =   495
   End
   Begin VB.ComboBox cmbDobDate 
      Height          =   315
      Left            =   4785
      TabIndex        =   74
      Text            =   "01"
      Top             =   4665
      Width           =   615
   End
   Begin VB.ComboBox cmbDobMonth 
      Height          =   315
      Left            =   5385
      TabIndex        =   75
      Text            =   "01"
      Top             =   4665
      Width           =   615
   End
   Begin VB.TextBox txtDobYear 
      Height          =   300
      Left            =   5985
      MaxLength       =   4
      TabIndex        =   76
      Top             =   4665
      Width           =   615
   End
   Begin VB.TextBox Terms 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   465
      Left            =   120
      TabIndex        =   123
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
      TabIndex        =   117
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
      TabIndex        =   116
      Top             =   30
      Width           =   1335
   End
   Begin VB.Frame FrameFamilyRegnInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   510
      Left            =   75
      TabIndex        =   178
      Top             =   2775
      Width           =   11775
      Begin VB.ComboBox cmbFRIssuedAt 
         Height          =   315
         Left            =   3390
         TabIndex        =   49
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   105
         Width           =   1545
      End
      Begin VB.TextBox txtFRNo 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   1185
         MaxLength       =   15
         TabIndex        =   48
         Tag             =   "11775"
         Top             =   90
         Width           =   1320
      End
      Begin VB.TextBox txtFRExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   11235
         MaxLength       =   4
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   135
         Width           =   525
      End
      Begin VB.ComboBox cmbFRExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10620
         TabIndex        =   56
         Tag             =   "11775"
         Text            =   "01"
         Top             =   135
         Width           =   615
      End
      Begin VB.ComboBox cmbFRExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10020
         TabIndex        =   55
         Tag             =   "11775"
         Text            =   "01"
         Top             =   135
         Width           =   615
      End
      Begin VB.TextBox txtFRIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   8910
         MaxLength       =   4
         TabIndex        =   54
         Tag             =   "11775"
         Top             =   105
         Width           =   510
      End
      Begin VB.ComboBox cmbFRIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8295
         TabIndex        =   53
         Tag             =   "11775"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.ComboBox cmbFRIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7695
         TabIndex        =   52
         Tag             =   "11775"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.Frame frameFRDateType 
         BackColor       =   &H00BFD87E&
         Height          =   420
         Left            =   5940
         TabIndex        =   179
         Tag             =   "11775"
         Top             =   45
         Width           =   1185
         Begin VB.OptionButton optFRDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   165
            Left            =   90
            TabIndex        =   50
            Tag             =   "1185"
            ToolTipText     =   "Hijri"
            Top             =   165
            Value           =   -1  'True
            Width           =   540
         End
         Begin VB.OptionButton optFRDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   165
            Left            =   615
            TabIndex        =   51
            TabStop         =   0   'False
            Tag             =   "1185"
            ToolTipText     =   "Gregorian"
            Top             =   165
            Width           =   450
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
         Left            =   2535
         TabIndex        =   184
         Tag             =   "11775"
         Top             =   150
         Width           =   885
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
         TabIndex        =   183
         Tag             =   "11775"
         Top             =   90
         Width           =   1485
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
         Left            =   4965
         TabIndex        =   182
         Tag             =   "11775"
         Top             =   165
         Width           =   885
      End
      Begin VB.Label lblFRExpiryDate 
         AutoSize        =   -1  'True
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
         Height          =   195
         Left            =   9450
         TabIndex        =   181
         Tag             =   "11775"
         Top             =   180
         Width           =   525
      End
      Begin VB.Label lblFRIssDate 
         AutoSize        =   -1  'True
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
         Left            =   7140
         TabIndex        =   180
         Tag             =   "11775"
         Top             =   165
         Width           =   465
      End
   End
   Begin VB.Frame frameRefFor 
      BackColor       =   &H00BFD87E&
      Height          =   405
      Left            =   0
      TabIndex        =   186
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
      Height          =   375
      Left            =   75
      TabIndex        =   124
      Top             =   765
      Width           =   11790
      Begin VB.TextBox txtIdNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1215
         MaxLength       =   15
         TabIndex        =   8
         Tag             =   "11790"
         Top             =   0
         Width           =   1320
      End
      Begin VB.TextBox txtIdExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   11190
         MaxLength       =   4
         TabIndex        =   17
         Tag             =   "11790"
         Top             =   15
         Width           =   540
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10575
         TabIndex        =   16
         Tag             =   "11790"
         Text            =   "01"
         Top             =   0
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10005
         TabIndex        =   15
         Tag             =   "11790"
         Text            =   "01"
         Top             =   0
         Width           =   615
      End
      Begin VB.TextBox txtIdIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8880
         MaxLength       =   4
         TabIndex        =   14
         Tag             =   "11790"
         Top             =   0
         Width           =   525
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8280
         TabIndex        =   13
         Tag             =   "11790"
         Text            =   "01"
         Top             =   0
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7680
         TabIndex        =   12
         Tag             =   "11790"
         Text            =   "01"
         Top             =   0
         Width           =   615
      End
      Begin VB.Frame frameIdDateType 
         BackColor       =   &H00BFD87E&
         Height          =   390
         Left            =   5895
         TabIndex        =   125
         Tag             =   "11790"
         Top             =   -75
         Width           =   1215
         Begin VB.OptionButton optIdDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   210
            Left            =   90
            TabIndex        =   10
            Tag             =   "1215"
            ToolTipText     =   "Hijri"
            Top             =   135
            Value           =   -1  'True
            Width           =   450
         End
         Begin VB.OptionButton optIdDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   195
            Left            =   630
            TabIndex        =   11
            TabStop         =   0   'False
            Tag             =   "1215"
            ToolTipText     =   "Gregorian"
            Top             =   135
            Width           =   465
         End
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   3435
         TabIndex        =   9
         Tag             =   "11790"
         Text            =   "Riyadh"
         Top             =   15
         Width           =   1470
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
         Left            =   4950
         TabIndex        =   130
         Tag             =   "11790"
         Top             =   45
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
         Left            =   2595
         TabIndex        =   129
         Tag             =   "11790"
         Top             =   45
         Width           =   795
      End
      Begin VB.Label lblIdExpiryDate 
         AutoSize        =   -1  'True
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
         Height          =   195
         Left            =   9435
         TabIndex        =   128
         Tag             =   "11790"
         Top             =   60
         Width           =   525
      End
      Begin VB.Label lblIdIssueDate 
         AutoSize        =   -1  'True
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
         Left            =   7110
         TabIndex        =   127
         Tag             =   "11790"
         Top             =   30
         Width           =   540
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
         TabIndex        =   126
         Tag             =   "11790"
         Top             =   30
         Width           =   1215
      End
   End
   Begin VB.Frame frameDobDateType 
      BackColor       =   &H00BFD87E&
      Height          =   435
      Left            =   1260
      TabIndex        =   131
      Top             =   4575
      Width           =   1935
      Begin VB.OptionButton optDOBGreg 
         BackColor       =   &H00BFD87E&
         Caption         =   "Gregorian"
         Height          =   195
         Left            =   735
         TabIndex        =   73
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
         TabIndex        =   72
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
      TabIndex        =   134
      Top             =   4560
      Visible         =   0   'False
      Width           =   1575
      Begin VB.OptionButton optVipNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   80
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
         TabIndex        =   79
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
      TabIndex        =   133
      Top             =   4575
      Width           =   2055
      Begin VB.OptionButton optGenderFemale 
         BackColor       =   &H00BFD87E&
         Caption         =   "Female"
         Height          =   225
         Left            =   945
         TabIndex        =   78
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
         TabIndex        =   77
         Tag             =   "2055"
         ToolTipText     =   "Male"
         Top             =   135
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Height          =   405
      Left            =   4605
      TabIndex        =   118
      Top             =   3390
      Width           =   1935
      Begin VB.OptionButton optLangEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "English"
         Height          =   225
         Left            =   945
         TabIndex        =   60
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
         TabIndex        =   59
         Tag             =   "1935"
         ToolTipText     =   "Arabic"
         Top             =   135
         Value           =   -1  'True
         Width           =   855
      End
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
      TabIndex        =   228
      Top             =   15225
      Width           =   2565
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
      TabIndex        =   187
      Top             =   7980
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Line Line6 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   75
      X2              =   11670
      Y1              =   3375
      Y2              =   3375
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
      TabIndex        =   185
      Tag             =   "11775"
      Top             =   3420
      Width           =   1200
   End
   Begin VB.Shape Shape1 
      Height          =   465
      Left            =   45
      Top             =   7860
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
      TabIndex        =   143
      Top             =   3540
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
      TabIndex        =   142
      Top             =   3495
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
      TabIndex        =   141
      Tag             =   "11775"
      Top             =   4710
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
      TabIndex        =   140
      Tag             =   "11775"
      Top             =   5145
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
      TabIndex        =   139
      Tag             =   "11775"
      Top             =   5160
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
      TabIndex        =   138
      Tag             =   "11775"
      Top             =   5160
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
      TabIndex        =   137
      Tag             =   "11775"
      Top             =   4695
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
      TabIndex        =   136
      Top             =   4725
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
      TabIndex        =   135
      Tag             =   "11775"
      Top             =   4755
      Width           =   1080
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
      TabIndex        =   122
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
      TabIndex        =   121
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
      TabIndex        =   120
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
      TabIndex        =   119
      Top             =   75
      Width           =   495
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   45
      X2              =   11565
      Y1              =   5460
      Y2              =   5460
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
     Dim customerAge As Integer
     
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
     
     If phoneCustOpenAction Then
        If Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4) = gBranchCode Then
           MsgBox errBranchCodeShouldBeDifferent(UserLang)
           validateIndividualSaudi = 1
           Exit Function
        Else
           validateIndividualSaudi = 0
        End If
     End If
     
     mQry = "select realorpseudo from branchinfo where branchcode = '" & Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4) & "'"
     Set rs = db.OpenRecordset(mQry)
     If rs.recordCount > 0 Then
        tmpCode = rs(0)
     Else
        tmpCode = "1" 'if error occured in executing the query, then move as real branch
     End If
                
     tCode = Mid$(frmIndividualSaudi.cmbAltBrCode, 1, 4)
     If tmpCode = "0" Or tmpCode = "2" Then
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

           tIssueDate = CStr(frmIndividualSaudi.txtIdIssueYear) & _
                        CStr(frmIndividualSaudi.cmbIdIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbIdIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtIdExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbIdExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbIdExpiryDate.text)
                           
           If frmIndividualSaudi.optIdDateGreg.Value = True Then
              If Not validDate(tIssueDate) Then
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
       
       If Len(RTrim(txtPpNumber)) = 0 And _
          Len(RTrim(txtHafNo)) = 0 And _
          Len(RTrim(txtFRNo)) = 0 And _
          Len(RTrim(txtIdNo)) = 0 And _
          Len(RTrim(txtSamaAuthNo)) = 0 Then
          MsgBox errAtleastOneIdReqd(UserLang)
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
       
       If Len(RTrim(frmIndividualSaudi.txtPpNumber)) <> 0 Then
          If Len(RTrim(frmIndividualSaudi.cmbPpIssueDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbPpIssueMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtPpIssueYear)) = 0 Then
              MsgBox errSpaceIssueDate(UserLang)
              frmIndividualSaudi.cmbPpIssueDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi.cmbPpExpiryDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbPpExpiryMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtPpExpiryYear)) = 0 Then
              MsgBox errSpaceExpiryDate(UserLang)
              frmIndividualSaudi.cmbPpExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           tIssueDate = CStr(frmIndividualSaudi.txtPpIssueYear) & _
                        CStr(frmIndividualSaudi.cmbPpIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbPpIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtPpExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbPpExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbPpExpiryDate.text)
                           
           If frmIndividualSaudi.optPpDateGreg.Value = True Then
              If Not validDate(tIssueDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbPpIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbPpExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtPpExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
          If optPpDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtPpExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtPpExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbPpIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbPpIssuedAt.SetFocus
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

           tIssueDate = CStr(frmIndividualSaudi.txtHafIssueYear) & _
                        CStr(frmIndividualSaudi.cmbHafIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbHafIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtHafExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbHafExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbHafExpiryDate.text)
                           
           If frmIndividualSaudi.optHafDateGreg.Value = True Then
              If Not validDate(tIssueDate) Then
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
             frmIndividualSaudi.cmbPpIssuedAt.SetFocus
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

           tIssueDate = CStr(frmIndividualSaudi.txtFRIssueYear) & _
                        CStr(frmIndividualSaudi.cmbFRIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbFRIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtFRExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbFRExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbFRExpiryDate.text)
                           
           If frmIndividualSaudi.optFRDateGreg.Value = True Then
              If Not validDate(tIssueDate) Then
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
    
    If subCategoryCode = "69" Or subCategoryCode = "65" Then
       If Len(RTrim(frmIndividualSaudi.txtSamaAuthNo)) = 0 Then
          If subCategoryCode = "65" Then
             MsgBox errSpaceSuccDeedNo(UserLang)
          Else
             MsgBox errSpaceSamaApproval(UserLang)
          End If
          frmIndividualSaudi.txtSamaAuthNo.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
    End If
    
             
    If Len(RTrim(frmIndividualSaudi.txtSamaAuthNo)) <> 0 Then
       If Len(RTrim(frmIndividualSaudi.cmbSamaAuthIssueDate.text)) = 0 Or _
           Len(RTrim(frmIndividualSaudi.cmbSamaAuthIssueMonth.text)) = 0 Or _
           Len(RTrim(frmIndividualSaudi.txtSamaAuthIssueYear)) = 0 Then
           MsgBox errSpaceIssueDate(UserLang)
           frmIndividualSaudi.cmbSamaAuthIssueDate.SetFocus
           validateIndividualSaudi = 1
           Exit Function
        Else
           validateIndividualSaudi = 0
        End If
        
        If Len(RTrim(frmIndividualSaudi.cmbSamaAuthExpiryDate.text)) = 0 Or _
           Len(RTrim(frmIndividualSaudi.cmbSamaAuthExpiryMonth.text)) = 0 Or _
           Len(RTrim(frmIndividualSaudi.txtSamaAuthExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           frmIndividualSaudi.cmbSamaAuthExpiryDate.SetFocus
           validateIndividualSaudi = 1
           Exit Function
        Else
           validateIndividualSaudi = 0
        End If

        tIssueDate = CStr(frmIndividualSaudi.txtSamaAuthIssueYear) & _
                     CStr(frmIndividualSaudi.cmbSamaAuthIssueMonth.text) & _
                     CStr(frmIndividualSaudi.cmbSamaAuthIssueDate.text)
        tExpiryDate = CStr(frmIndividualSaudi.txtSamaAuthExpiryYear) & _
                      CStr(frmIndividualSaudi.cmbSamaAuthExpiryMonth.text) & _
                      CStr(frmIndividualSaudi.cmbSamaAuthExpiryDate.text)
                        
        If frmIndividualSaudi.optSamaAuthDateGreg.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualSaudi.cmbSamaAuthIssueDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
            
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualSaudi.cmbSamaAuthExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
       End If
                      
       If tExpiryDate < tIssueDate Then
          MsgBox errGreaterExpiryYear(UserLang)
          frmIndividualSaudi.txtSamaAuthExpiryYear.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
        
       If optSamaAuthDateHijri = True Then
          If tExpiryDate < currentHijriDate Then
             MsgBox errExpiryDateLessThanToday(UserLang)
             txtSamaAuthExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       Else
          If tExpiryDate < currentGregDate Then
             MsgBox errExpiryDateLessThanToday(UserLang)
             txtSamaAuthExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
       End If
       
       If Len(RTrim(frmIndividualSaudi.cmbSamaAuthIssuedAt.text)) = 0 Then
          MsgBox errSpaceIdIssuedAt(UserLang)
          frmIndividualSaudi.cmbSamaAuthIssuedAt.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
    End If ' if len(samaauthno)> 0
    
    ' CHECKING FOR SAUDI UNDER TRIBESMEN OF RABI ALKHALI STARTS HERE
    
    If subCategoryCode = "59" Or subCategoryCode = "73" Then
       If Len(RTrim(frmIndividualSaudi.txtPpNumber)) = 0 Then
          MsgBox errSpacePpNo(UserLang)  '"Passport number cannot be spaces...Please enter.."
          frmIndividualSaudi.txtPpNumber.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
    End If ' end if subcategory = "59" or 73
    
   ' CHECKING FOR SAUDI UNDER SPECIAL CIRCUMSTANCES STARTS HERE
   
    If subCategoryCode = "02" Or subCategoryCode = "59" Or _
       subCategoryCode = "73" Or subCategoryCode = "69" Or _
       subCategoryCode = "65" Then
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
              validateIndividualSaudi = 0
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

           tIssueDate = CStr(frmIndividualSaudi.txtIdIssueYear) & _
                        CStr(frmIndividualSaudi.cmbIdIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbIdIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtIdExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbIdExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbIdExpiryDate.text)
                           
           If frmIndividualSaudi.optIdDateGreg.Value = True Then
              If Not validDate(tIssueDate) Then
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
      End If ' if len(idno) > 0
       
       If Len(RTrim(txtPpNumber)) = 0 And _
          Len(RTrim(txtHafNo)) = 0 And _
          Len(RTrim(txtFRNo)) = 0 And _
          Len(RTrim(txtIdNo)) = 0 And _
          Len(RTrim(txtSamaAuthNo)) = 0 Then
          If Len(RTrim(txtCOBNo)) = 0 Then
             MsgBox errSpaceCertOfBirthNo(UserLang)
             txtCOBNo.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
      End If
       If Len(RTrim(txtPpNumber)) = 0 And _
          Len(RTrim(txtHafNo)) = 0 And _
          Len(RTrim(txtFRNo)) = 0 And _
          Len(RTrim(txtIdNo)) = 0 And _
          Len(RTrim(txtSamaAuthNo)) = 0 Then
          MsgBox errAtleastOneIdReqd(UserLang)
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
             
       If Len(RTrim(frmIndividualSaudi.txtPpNumber)) <> 0 Then
          If Len(RTrim(frmIndividualSaudi.cmbPpIssueDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbPpIssueMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtPpIssueYear)) = 0 Then
              MsgBox errSpaceIssueDate(UserLang)
              frmIndividualSaudi.cmbPpIssueDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi.cmbPpExpiryDate.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.cmbPpExpiryMonth.text)) = 0 Or _
              Len(RTrim(frmIndividualSaudi.txtPpExpiryYear)) = 0 Then
              MsgBox errSpaceExpiryDate(UserLang)
              frmIndividualSaudi.cmbPpExpiryDate.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If

           tIssueDate = CStr(frmIndividualSaudi.txtPpIssueYear) & _
                        CStr(frmIndividualSaudi.cmbPpIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbPpIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtPpExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbPpExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbPpExpiryDate.text)
                           
           If frmIndividualSaudi.optPpDateGreg.Value = True Then
              If Not validDate(tIssueDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbPpIssueDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
               
              If Not validDate(tExpiryDate) Then
                 MsgBox errInvalidDate(UserLang)
                 frmIndividualSaudi.cmbPpExpiryDate.SetFocus
                 validateIndividualSaudi = 1
                 Exit Function
              Else
                 validateIndividualSaudi = 0
              End If
          End If
                         
          If tExpiryDate < tIssueDate Then
             MsgBox errGreaterExpiryYear(UserLang)
             frmIndividualSaudi.txtPpExpiryYear.SetFocus
             validateIndividualSaudi = 1
             Exit Function
          Else
             validateIndividualSaudi = 0
          End If
           
          If optPpDateHijri = True Then
             If tExpiryDate < currentHijriDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtPpExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          Else
             If tExpiryDate < currentGregDate Then
                MsgBox errExpiryDateLessThanToday(UserLang)
                txtPpExpiryYear.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi.cmbPpIssuedAt.text)) = 0 Then
             MsgBox errSpaceIdIssuedAt(UserLang)
             frmIndividualSaudi.cmbPpIssuedAt.SetFocus
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

           tIssueDate = CStr(frmIndividualSaudi.txtHafIssueYear) & _
                        CStr(frmIndividualSaudi.cmbHafIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbHafIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtHafExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbHafExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbHafExpiryDate.text)
                           
           If frmIndividualSaudi.optHafDateGreg.Value = True Then
              If Not validDate(tIssueDate) Then
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
             frmIndividualSaudi.cmbPpIssuedAt.SetFocus
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

           tIssueDate = CStr(frmIndividualSaudi.txtFRIssueYear) & _
                        CStr(frmIndividualSaudi.cmbFRIssueMonth.text) & _
                        CStr(frmIndividualSaudi.cmbFRIssueDate.text)
           tExpiryDate = CStr(frmIndividualSaudi.txtFRExpiryYear) & _
                         CStr(frmIndividualSaudi.cmbFRExpiryMonth.text) & _
                         CStr(frmIndividualSaudi.cmbFRExpiryDate.text)
                           
           If frmIndividualSaudi.optFRDateGreg.Value = True Then
              If Not validDate(tIssueDate) Then
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
    End If ' subcateogy = "02" or subcategory = "59" ' saudi child with special circumstances
                                                     ' or tribesmen of Rabi AlKhali
        
    '  OTHER VALIDATION COMMON FOR SAUDI STARTS HERE
    If (updateAction Or (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U")) And _
        recvLoginMsg.custNameUpdAllowed <> "1" Then
        ' this empty condition is required to ignore customer name validation
        ' during update & branch is not allowed to update the customer name
    Else
       If frmIndividualSaudi.optLangArabic.Value = True Then
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
        End If ' customers' preferred lang is english
        
        If Len(RTrim(txtArabFirstName)) > 0 Then
           If englishCharFound(txtArabFirstName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabFirstName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtArabic2ndName)) > 0 Then
           If englishCharFound(txtArabic2ndName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabic2ndName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtArabic3rdName)) > 0 Then
           If englishCharFound(txtArabic3rdName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabic3rdName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtArabLastName)) > 0 Then
           If englishCharFound(txtArabLastName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabLastName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtArabShortName)) > 0 Then
           If englishCharFound(txtArabShortName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabShortName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtEngFirstName)) > 0 Then
           If arabicCharFound(txtEngFirstName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngFirstName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtEnglish2ndName)) > 0 Then
           If arabicCharFound(txtEnglish2ndName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEnglish2ndName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtEnglish3rdName)) > 0 Then
           If arabicCharFound(txtEnglish3rdName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEnglish3rdName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtEngLastName)) > 0 Then
           If arabicCharFound(txtEngLastName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngLastName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    
        If Len(RTrim(txtEngShortName)) > 0 Then
           If arabicCharFound(txtEngShortName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngShortName.SetFocus
              validateIndividualSaudi = 1
              Exit Function
           Else
              validateIndividualSaudi = 0
           End If
        End If
    End If ' user is having access to change the customers' name
        
    If frmIndividualSaudi.optLangArabic.Value = True Then
       If frmIndividualSaudi.optPoBox = True Then
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
      Else ' saudi post
          If Len(RTrim(frmIndividualSaudi.txtSaudiPostStreetName)) <> 0 Then
             If englishCharFound(frmIndividualSaudi.txtSaudiPostStreetName) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualSaudi.txtSaudiPostStreetName.SetFocus
                validateIndividualSaudi = 1
                Exit Function
             Else
                validateIndividualSaudi = 0
             End If
          End If
      End If
         
       If englishCharFound(frmIndividualSaudi.cmbCity.text) Then
          On Error Resume Next
          Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" + _
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
    Else    ' if the language is english
       If frmIndividualSaudi.optPoBox = True Then
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
      Else  ' saudi post address
         If Len(RTrim(frmIndividualSaudi.txtSaudiPostStreetName)) <> 0 Then
            If arabicCharFound(frmIndividualSaudi.txtSaudiPostStreetName) Then
               MsgBox errNoArabicAddress(UserLang)
               frmIndividualSaudi.txtSaudiPostStreetName.SetFocus
               validateIndividualSaudi = 1
               Exit Function
            Else
               validateIndividualSaudi = 0
            End If
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
    tDob = CStr(frmIndividualSaudi.txtDobYear) & _
           CStr(frmIndividualSaudi.cmbDobMonth.text) & _
           CStr(frmIndividualSaudi.cmbDobDate.text)
           
    If frmIndividualSaudi.optDOBGreg.Value = True Then
       If Not validDate(tDob) Then
          MsgBox errInvalidDate(UserLang)
          frmIndividualSaudi.cmbDobDate.SetFocus
          validateIndividualSaudi = 1
          Exit Function
       Else
          validateIndividualSaudi = 0
       End If
    End If
    
    If optDOBHijri = True Then
      If tDob > currentHijriDate Then
         MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
         txtDobYear.SetFocus
         validateIndividualSaudi = 1
         Exit Function
      Else
         validateIndividualSaudi = 0
      End If
   Else
      If tDob > currentGregDate Then
         MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
         txtDobYear.SetFocus
         validateIndividualSaudi = 1
         Exit Function
      Else
         validateIndividualSaudi = 0
      End If
   End If
   
   customerAge = getCustomerAge(tDob, IIf(optDOBGreg, "1", "0"))
   
   If customerAge > Val(recvLoginMsg.maxAgeLimit) Then
      MsgBox errCustAgeExceedLimit(UserLang) & recvLoginMsg.maxAgeLimit & "  " & errYears(UserLang)
      validateIndividualSaudi = 1
      Exit Function
   Else
      validateIndividualSaudi = 0
   End If
    
   If Len(RTrim(frmIndividualSaudi.cmbBusinessType.text)) = 0 Then
      MsgBox errSpaceBusType(UserLang)
      frmIndividualSaudi.cmbBusinessType.SetFocus
      validateIndividualSaudi = 1
      Exit Function
   Else
      validateIndividualSaudi = 0
   End If
    
   If frmIndividualSaudi.optPoBox = True Then
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
      
      If Trim(txtPOBox) = "0" Or _
         Trim(txtPinCode) = "0" Then
         MsgBox errPoOrZipCannotBeZero(UserLang)
         txtPOBox.SetFocus
         validateIndividualSaudi = 1
         Exit Function
      Else
         validateIndividualSaudi = 0
      End If
  Else ' saudi post office
     If Len(RTrim(frmIndividualSaudi.txtSaudiPostGPSNo)) = 0 Or _
        Len(RTrim(frmIndividualSaudi.txtSaudiPostStreetName)) = 0 Or _
        Len(RTrim(frmIndividualSaudi.txtSaudiPostUnit)) = 0 Or _
        Len(RTrim(frmIndividualSaudi.cmbCity.text)) = 0 Or _
        Len(RTrim(frmIndividualSaudi.txtSaudiPostZipCode)) = 0 Or _
        Len(RTrim(frmIndividualSaudi.txtSaudiPostAdditionalNo)) = 0 Then
        MsgBox errSpaceSaudiAddress(UserLang) '"Saudi Postal address should be entered.. Please enter"
        frmIndividualSaudi.txtSaudiPostGPSNo.SetFocus
        validateIndividualSaudi = 1
        Exit Function
     Else
        validateIndividualSaudi = 0
     End If
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

Private Sub cmbFRExpiryDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub cmbFRExpiryMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub cmbFRIssueDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub cmbFRIssueMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub cmbHafExpiryDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub cmbHafExpiryMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub cmbHafIssueDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub cmbHafIssueMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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
      If Len(RTrim(cmbPpExpiryDate.text)) <> 0 Then
         If Len(cmbPpExpiryDate) = 2 Then
            If cmbPpExpiryDate < 1 Or _
               cmbPpExpiryDate > IIf(optPpDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbPpExpiryDate.text = ""
               cmbPpExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbPpExpiryMonth.SetFocus
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

Private Sub cmbSamaAuthExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbSamaAuthExpiryDate.text)) <> 0 Then
         If Len(cmbSamaAuthExpiryDate) = 2 Then
            If cmbSamaAuthExpiryDate < 1 Or _
               cmbSamaAuthExpiryDate > IIf(optSamaAuthDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbSamaAuthExpiryDate.text = ""
               cmbSamaAuthExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbSamaAuthExpiryMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbSamaAuthExpiryDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbSamaAuthExpiryMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbSamaAuthExpiryMonth.text)) <> 0 Then
         If Len(cmbSamaAuthExpiryMonth.text) = 2 Then
            If cmbSamaAuthExpiryMonth < 1 Or cmbSamaAuthExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbSamaAuthExpiryMonth.text = ""
               cmbSamaAuthExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtSamaAuthExpiryYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbSamaAuthExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbSamaAuthIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbSamaAuthIssueDate.text)) <> 0 Then
         If Len(cmbSamaAuthIssueDate.text) = 2 Then
            If cmbSamaAuthIssueDate < 1 Or _
               cmbSamaAuthIssueDate > IIf(optSamaAuthDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbSamaAuthIssueDate.text = ""
               cmbSamaAuthIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbSamaAuthIssueMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbSamaAuthIssueDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbSamaAuthIssueMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbSamaAuthIssueMonth.text)) <> 0 Then
         If Len(cmbSamaAuthIssueMonth.text) = 2 Then
            If cmbSamaAuthIssueMonth < 1 Or cmbSamaAuthIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbSamaAuthIssueMonth.text = ""
               cmbSamaAuthIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtSamaAuthIssueYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbSamaAuthIssueMonth_KeyPress(KeyAscii As Integer)
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

Private Sub cmdCancel_Click()
    Unload Me
    Unload frmIndividualSaudi2
    Unload frmIndividualHeirs
    Unload frmIndividualJoint
    Unload frmIndividualSaudiAcctInfo
    Unload frmCustUpdateHistory
    Unload frmSupervisorApproval
    If supervisorAction Or tellerAction Then
       Unload frmSupervisorApproval
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
     ElseIf Len(RTrim(frmIndividualSaudi.txtPpNumber)) > 0 Then
        tIdType = "P"
        tIdNo = Format(frmIndividualSaudi.txtPpNumber, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmIndividualSaudi.txtHafNo)) > 0 Then
        tIdType = "H"
        tIdNo = Format(frmIndividualSaudi.txtHafNo, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmIndividualSaudi.txtFRNo)) > 0 Then
        tIdType = "F"
        tIdNo = Format(frmIndividualSaudi.txtFRNo, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmIndividualSaudi.txtSamaAuthNo)) > 0 Then
        tIdType = "S"
        tIdNo = Format(frmIndividualSaudi.txtSamaAuthNo, "!@@@@@@@@@@@@@@@")
     End If
     
     If subCategoryCode = "65" Then
        If Len(RTrim(frmIndividualSaudi.txtSamaAuthNo)) > 0 Then
           tIdType = "E"
           tIdNo = Format(frmIndividualSaudi.txtSamaAuthNo, "!@@@@@@@@@@@@@@@")
        End If
     End If
     
     If optLangArabic = True Then
        custName = txtArabFirstName & " " & txtArabic2ndName & " " & _
                   txtArabic3rdName & " " & txtArabLastName
     Else
        custName = txtEngFirstName & " " & txtEnglish2ndName & " " & _
                   txtEnglish3rdName & " " & txtEngLastName
     End If
    
     cmdNextPage.Enabled = False
     If checkCustomerExistance(frmIndividualSaudi, tIdType, tIdNo, newOrUpdate, tCustNo, custName) = 1 Then
        cmdNextPage.Enabled = True
        Exit Sub
     End If
     cmdNextPage.Enabled = True
     
     
     CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
      'MsgBox forReference
     
     If subCategoryCode = "65" Then
        frmIndividualHeirs.Show
     Else
        If forReference = 1 Then 'not selected
           frmIndividualSaudiAcctInfo.Show
        Else
           frmIndividualSaudi2.chkBlind.Value = chkBlind.Value
           frmIndividualSaudi2.chkIncptPerson.Value = chkIncptPerson.Value
           frmIndividualSaudi2.chkMentDisabled.Value = chkMentDisabled.Value
           frmIndividualSaudi2.chkMinor.Value = chkMinor.Value
           frmIndividualSaudi2.chkMinorSpl.Value = chkMinorSpl.Value
           frmIndividualSaudi2.chkVeiled.Value = chkVeiled.Value
           frmIndividualSaudi2.Show
        End If
     End If
     CSD_mdiForm.staticStatus.Panels(3).text = "     "
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
      ElseIf subCategoryCode = "65" Then
          frmIndividualSaudi.MousePointer = vbHourglass
          CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
          frmIndividualHeirs.Hide
          doHeirSearch "00000", frmIndividualSaudi.txtCustomerNo, Space(4)
          frmIndividualSaudi.MousePointer = vbDefault
          CSD_mdiForm.staticStatus.Panels(3).text = " "
          noOfHeir = recvReferenceSearchMsg.noOfRecs   ' same responseMsg is used for
                                                       ' both reference & heirs; thats why
                                                       ' same recvreferencesearchmsg is repeated
          If noOfHeir = spaces Then
             noOfHeir = "0"
          End If
          For i = 1 To Val(recvReferenceSearchMsg.noOfRecs)
              frmIndividualHeirs.heirInfoGrid.Row = i
              frmIndividualHeirs.heirInfoGrid.Col = 0
              frmIndividualHeirs.heirInfoGrid.CellAlignment = flexAlignLeftCenter
              frmIndividualHeirs.heirInfoGrid.text = recvReferenceSearchMsg.details(i).custNo
              frmIndividualHeirs.heirInfoGrid.Col = 1
              frmIndividualHeirs.heirInfoGrid.CellAlignment = flexAlignLeftCenter
              frmIndividualHeirs.heirInfoGrid.text = recvReferenceSearchMsg.details(i).referenceNo
              frmIndividualHeirs.heirInfoGrid.Col = 2
              frmIndividualHeirs.heirInfoGrid.CellAlignment = flexAlignLeftCenter
              frmIndividualHeirs.heirInfoGrid.text = recvReferenceSearchMsg.details(i).custShortName
              frmIndividualHeirs.heirInfoGrid.Col = 3
              frmIndividualHeirs.heirInfoGrid.CellAlignment = flexAlignLeftCenter
              frmIndividualHeirs.heirInfoGrid.text = recvReferenceSearchMsg.details(i).custBranchCode
              frmIndividualHeirs.heirInfoGrid.Col = 4
              frmIndividualHeirs.heirInfoGrid.CellAlignment = flexAlignLeftCenter
              frmIndividualHeirs.heirInfoGrid.text = recvReferenceSearchMsg.details(i).idType & "-" & recvReferenceSearchMsg.details(i).idNo
          Next i
          frmIndividualHeirs.heirInfoGrid.Row = 1
          frmIndividualHeirs.Show
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
    
    If activityFlag = "P" And Len(RTrim(branchActionDateTime)) = 0 Then
       branchActionDateTime = Space(14)
    End If
    
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
    frmIndividualSaudi.optSingle.Caption = frmIndividualSaudiCaption(38, UserLang)
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
    frmIndividualSaudi.optPpDateHijri.Caption = frmIndividualSaudiCaption(9, UserLang)
    frmIndividualSaudi.optPpDateGreg.Caption = frmIndividualSaudiCaption(10, UserLang)
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
    If screenSetNo = "A" Then
       frmIndividualSaudi.lblSamaAuthNo.Caption = frmIndividualSaudiCaption(105, UserLang)
    Else
       frmIndividualSaudi.lblSamaAuthNo.Caption = frmIndividualSaudiCaption(104, UserLang)
    End If
    frmIndividualSaudi.lblSamaAuthIssuedAt.Caption = frmIndividualSaudiCaption(7, UserLang)
    frmIndividualSaudi.lblSamaAuthDateType.Caption = frmIndividualSaudiCaption(8, UserLang)
    frmIndividualSaudi.optSamaAuthDateHijri.Caption = frmIndividualSaudiCaption(9, UserLang)
    frmIndividualSaudi.optSamaAuthDateGreg.Caption = frmIndividualSaudiCaption(10, UserLang)
    frmIndividualSaudi.lblSamaAuthIssueDate.Caption = frmIndividualSaudiCaption(11, UserLang)
    frmIndividualSaudi.lblSamaAuthExpiryDate.Caption = frmIndividualSaudiCaption(12, UserLang)
    
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
       tCode = Mid$(frmIndividualSaudi.cmbAltBrCode, 1, 4)
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
        cmbIdIssuedAt.Clear
        cmbPpIssuedAt.Clear
        cmbHafIssuedAt.Clear
        cmbFRIssuedAt.Clear
        cmbCity.Clear
        cmbSamaAuthIssuedAt.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbIdIssuedAt.AddItem rs("englishname")
              cmbPpIssuedAt.AddItem rs("englishname")
              cmbHafIssuedAt.AddItem rs("englishname")
              cmbFRIssuedAt.AddItem rs("englishname")
              cmbSamaAuthIssuedAt.AddItem rs("englishname")
              cmbCity.AddItem rs("englishname")
           Else
              cmbIdIssuedAt.AddItem rs("arabicname")
              cmbPpIssuedAt.AddItem rs("arabicname")
              cmbHafIssuedAt.AddItem rs("arabicname")
              cmbFRIssuedAt.AddItem rs("arabicname")
              cmbSamaAuthIssuedAt.AddItem rs("arabicname")
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
                cmbPpIssuedAt.text = rs(0)
                cmbHafIssuedAt.text = rs(0) 'nad
                cmbFRIssuedAt.text = rs(0) 'nad
                cmbSamaAuthIssuedAt.text = rs(0)
                cmbCity.text = rs(0)
             Else
                cmbIdIssuedAt.text = rs(1)
                cmbPpIssuedAt.text = rs(1)
                cmbHafIssuedAt.text = rs(1) 'nad
                cmbFRIssuedAt.text = rs(1) 'nad
                cmbSamaAuthIssuedAt.text = rs(1)
                cmbCity.text = rs(1)
             End If
         Else
            txtOffPhoneCityCode = "01"
            txtResPhoneCityCode = "01"
            txtFaxCityCode = "01"
            cmbIdIssuedAt.text = ""
            cmbPpIssuedAt.text = ""
            cmbHafIssuedAt.text = "" 'nad
            cmbFRIssuedAt.text = "" 'nad
            cmbSamaAuthIssuedAt.text = ""
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
    cmbPpIssueDate.Clear
    cmbPpIssueMonth.Clear
    cmbPpExpiryDate.Clear
    cmbPpExpiryMonth.Clear
    cmbHafIssueDate.Clear
    cmbHafIssueMonth.Clear
    cmbHafExpiryDate.Clear
    cmbHafExpiryMonth.Clear
    cmbFRIssueDate.Clear
    cmbFRIssueMonth.Clear
    cmbFRExpiryDate.Clear
    cmbFRExpiryMonth.Clear
    cmbSamaAuthIssueDate.Clear
    cmbSamaAuthIssueMonth.Clear
    cmbSamaAuthExpiryDate.Clear
    cmbSamaAuthExpiryMonth.Clear
    For i = 1 To 30
        If i < 10 Then
           num = "0" & CStr(i)
        Else
           num = CStr(i)
        End If
        cmbIdIssueDate.AddItem num
        cmbPpIssueDate.AddItem num 'nad
        cmbHafIssueDate.AddItem num 'nad
        cmbFRIssueDate.AddItem num 'nad
        cmbDobDate.AddItem num
        cmbIdExpiryDate.AddItem num
        cmbPpExpiryDate.AddItem num 'nad
        cmbHafExpiryDate.AddItem num 'nad
        cmbFRExpiryDate.AddItem num 'nad
        cmbSamaAuthIssueDate.AddItem num
        cmbSamaAuthExpiryDate.AddItem num
        If i < 13 Then
           cmbIdIssueMonth.AddItem num
           cmbPpIssueMonth.AddItem num 'nad
           cmbHafIssueMonth.AddItem num 'nad
           cmbFRIssueMonth.AddItem num 'nad
           cmbDobMonth.AddItem num
           cmbIdExpiryMonth.AddItem num
           cmbPpExpiryMonth.AddItem num 'nad
           cmbHafExpiryMonth.AddItem num 'nad
           cmbFRExpiryMonth.AddItem num 'nad
           cmbSamaAuthIssueMonth.AddItem num
           cmbSamaAuthExpiryMonth.AddItem num
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
      FramePassportInfo.Enabled = False
      FrameHafizaInfo.Enabled = False
      FrameFamilyRegnInfo.Enabled = False
      frameSamaAuthInfo.Enabled = False
      frameRefFor.Enabled = False
      txtCOBNo.Enabled = False
      frameLang.Enabled = False
      'cmbNationality.Enabled = False
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
         If Len(RTrim(recvSaudiIndividualMsg.supervisorComments)) > 0 Then
            cmdSupervisorComments.Enabled = True
         End If
      Else
         lblHistory.Visible = False
      End If
   Else
      cmbAltBrCode.Enabled = True
      frameCustomerName.Enabled = True
      frameIdInfo.Enabled = True
      FramePassportInfo.Enabled = True
      FrameHafizaInfo.Enabled = True
      FrameFamilyRegnInfo.Enabled = True
      frameSamaAuthInfo.Enabled = True
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
         If recvLoginMsg.globalUpdatePriv = "1" Or recvLoginMsg.mainBrEditAllowed = "1" Then
            cmbBranchCode.Enabled = True
         Else
            cmbBranchCode.Enabled = False
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
         If recvLoginMsg.mainBrEditAllowed = "1" And recvSaudiIndividualMsg.mainBrCodeUpdAllowed = "1" Then
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
      ElseIf tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U" Then
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
      If phoneCustOpenAction Then
         cmbBranchCode.Enabled = True
      End If
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

Private Sub frameSamaAuthInfo_DragDrop(Source As Control, X As Single, Y As Single)
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

Private Sub optFRDateGreg_Click()
   If cmbFRIssueDate.ListCount = 30 Then
      cmbFRIssueDate.AddItem 31
      cmbFRExpiryDate.AddItem 31
   End If
   cmbFRIssueDate = ""
   cmbFRIssueMonth = ""
   txtFRIssueYear = ""
   cmbFRExpiryDate = ""
   cmbFRExpiryMonth = ""
   txtFRExpiryYear = ""
End Sub

Private Sub optFRDateHijri_Click()
   If cmbFRIssueDate.ListCount = 31 Then
      cmbFRIssueDate.RemoveItem 30
      cmbFRExpiryDate.RemoveItem 30
   End If
   cmbFRIssueDate = ""
   cmbFRIssueMonth = ""
   txtFRIssueYear = ""
   cmbFRExpiryDate = ""
   cmbFRExpiryMonth = ""
   txtFRExpiryYear = ""
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

Private Sub optHafDateGreg_Click()
   If cmbHafIssueDate.ListCount = 30 Then
      cmbHafIssueDate.AddItem 31
      cmbHafExpiryDate.AddItem 31
   End If
   cmbHafIssueDate = ""
   cmbHafIssueMonth = ""
   txtHafIssueYear = ""
   cmbHafExpiryDate = ""
   cmbHafExpiryMonth = ""
   txtHafExpiryYear = ""
End Sub

Private Sub optHafDateHijri_Click()
   If cmbHafIssueDate.ListCount = 31 Then
      cmbHafIssueDate.RemoveItem 30
      cmbHafExpiryDate.RemoveItem 30
   End If
   cmbHafIssueDate = ""
   cmbHafIssueMonth = ""
   txtHafIssueYear = ""
   cmbHafExpiryDate = ""
   cmbHafExpiryMonth = ""
   txtHafExpiryYear = ""
End Sub

Private Sub optIdDateGreg_Click()
   If cmbIdIssueDate.ListCount = 30 Then
      cmbIdIssueDate.AddItem 31
      cmbIdExpiryDate.AddItem 31
   End If
   cmbIdIssueDate = ""
   cmbIdIssueMonth = ""
   txtIdIssueYear = ""
   cmbIdExpiryDate = ""
   cmbIdExpiryMonth = ""
   txtIdExpiryYear = ""
End Sub

Private Sub optIdDateHijri_Click()
   If cmbIdIssueDate.ListCount = 31 Then
      cmbIdIssueDate.RemoveItem 30
      cmbIdExpiryDate.RemoveItem 30
    End If
    cmbIdIssueDate = ""
    cmbIdIssueMonth = ""
    txtIdIssueYear = ""
    cmbIdExpiryDate = ""
    cmbIdExpiryMonth = ""
    txtIdExpiryYear = ""
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

Private Sub txtFRExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub txtFRIssueYear_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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
           txtSamaAuthNo.SetFocus
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

Private Sub txtHafIssueYear_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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
           txtPpNumber.SetFocus
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
     If Len(RTrim(txtPpExpiryYear)) <> 0 Then
        If Len(txtPpExpiryYear) = 4 Then
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
       If Len(RTrim(cmbPpExpiryDate)) > 0 And Len(RTrim(cmbPpExpiryMonth)) > 0 Then
          If Len(RTrim(txtPpExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtPpExpiryYear.text = ""
             txtPpExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       If optPpDateHijri.Value = True Then
          If Len(RTrim(txtPpExpiryYear)) <> 0 Then
             If txtPpExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                frameIdInfo.Enabled = True
                If txtPpExpiryYear.Enabled = True Then
                   txtPpExpiryYear.text = ""
                   txtPpExpiryYear.SetFocus
                Else
                   framePPInfo.Enabled = True
                   txtPpExpiryYear.Enabled = True
                   txtPpExpiryYear.text = ""
                   txtPpExpiryYear.SetFocus
                End If
             End If
          End If
       Else
          If Len(RTrim(txtPpExpiryYear)) <> 0 Then
             If txtPpExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtPpExpiryYear.Enabled = True Then
                   txtPpExpiryYear.text = ""
                   txtPpExpiryYear.SetFocus
                Else
                   framePPInfo.Enabled = True
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
                   framePPInfo.Enabled = True
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

Private Sub txtSamaAuthExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtSamaAuthExpiryYear)) <> 0 Then
        If Len(txtSamaAuthExpiryYear) = 4 Then
           txtFRNo.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtSamaAuthExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtSamaAuthIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtSamaAuthIssueYear)) <> 0 Then
        If Len(txtSamaAuthIssueYear) = 4 Then
           cmbSamaAuthExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtSamaAuthIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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
   If frmIndividualSaudi.optLangArabic Then
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
