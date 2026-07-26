VERSION 5.00
Begin VB.Form frmJuristicMain 
   BackColor       =   &H00BFD87E&
   Caption         =   "Customer Details"
   ClientHeight    =   8760
   ClientLeft      =   1605
   ClientTop       =   165
   ClientWidth     =   12015
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8760
   ScaleWidth      =   12015
   Begin VB.Frame frameApproverInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   525
      Left            =   75
      TabIndex        =   183
      Top             =   2040
      Width           =   11805
      Begin VB.TextBox txtAppExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   11040
         MaxLength       =   4
         TabIndex        =   36
         Tag             =   "11895"
         Top             =   105
         Width           =   600
      End
      Begin VB.TextBox txtAppIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8190
         MaxLength       =   4
         TabIndex        =   33
         Tag             =   "11895"
         Top             =   105
         Width           =   555
      End
      Begin VB.ComboBox cmbAppIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7590
         TabIndex        =   32
         Tag             =   "11895"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.ComboBox cmbAppIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6990
         TabIndex        =   31
         Tag             =   "11895"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.ComboBox cmbAppExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9825
         TabIndex        =   34
         Tag             =   "11895"
         Text            =   "01"
         Top             =   105
         Width           =   615
      End
      Begin VB.ComboBox cmbAppExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10410
         TabIndex        =   35
         Tag             =   "11895"
         Text            =   "01"
         Top             =   105
         Width           =   615
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
         TabIndex        =   28
         Tag             =   "11895"
         Top             =   120
         Width           =   1935
      End
      Begin VB.Frame FrameApprDateType 
         BackColor       =   &H00BFD87E&
         Height          =   480
         Left            =   4170
         TabIndex        =   184
         Tag             =   "11895"
         Top             =   0
         Width           =   1755
         Begin VB.OptionButton optAppDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   195
            Left            =   720
            TabIndex        =   30
            Tag             =   "1755"
            ToolTipText     =   "Gregorian"
            Top             =   180
            Width           =   990
         End
         Begin VB.OptionButton optAppDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   135
            TabIndex        =   29
            Tag             =   "1755"
            ToolTipText     =   "Hijri"
            Top             =   165
            Value           =   -1  'True
            Width           =   615
         End
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
         TabIndex        =   188
         Tag             =   "11895"
         Top             =   150
         Width           =   1155
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
         TabIndex        =   187
         Tag             =   "11895"
         Top             =   150
         Width           =   900
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
         TabIndex        =   186
         Tag             =   "11895"
         Top             =   150
         Width           =   1215
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
         TabIndex        =   185
         Tag             =   "11895"
         Top             =   150
         Width           =   1140
      End
   End
   Begin VB.TextBox txtApproverName 
      Height          =   285
      Left            =   1470
      MaxLength       =   30
      TabIndex        =   37
      Top             =   2640
      Width           =   2850
   End
   Begin VB.Frame frameSamaAppInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   105
      TabIndex        =   163
      Top             =   1545
      Width           =   11775
      Begin VB.Frame FrameSamaAuthDateType 
         BackColor       =   &H00BFD87E&
         Height          =   450
         Left            =   4155
         TabIndex        =   164
         Tag             =   "11775"
         Top             =   0
         Width           =   1740
         Begin VB.OptionButton optSamaAuthDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   195
            Left            =   720
            TabIndex        =   21
            Tag             =   "1740"
            ToolTipText     =   "Gregorian"
            Top             =   180
            Width           =   990
         End
         Begin VB.OptionButton optSamaAuthDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   195
            Left            =   120
            TabIndex        =   20
            Tag             =   "1740"
            ToolTipText     =   "Hijri"
            Top             =   180
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbSamaAuthExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9795
         TabIndex        =   25
         Tag             =   "11775"
         Text            =   "01"
         Top             =   150
         Width           =   615
      End
      Begin VB.ComboBox cmbSamaAuthExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10395
         TabIndex        =   26
         Tag             =   "11775"
         Text            =   "01"
         Top             =   150
         Width           =   615
      End
      Begin VB.TextBox txtSamaAuthExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   10995
         MaxLength       =   4
         TabIndex        =   27
         Tag             =   "11775"
         Top             =   150
         Width           =   570
      End
      Begin VB.TextBox txtSamaAuthNo 
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
         MaxLength       =   15
         TabIndex        =   19
         Tag             =   "11775"
         Top             =   150
         Width           =   1935
      End
      Begin VB.TextBox txtSamaAuthIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8160
         MaxLength       =   4
         TabIndex        =   24
         Tag             =   "11775"
         Top             =   150
         Width           =   540
      End
      Begin VB.ComboBox cmbSamaAuthIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7545
         TabIndex        =   23
         Tag             =   "11775"
         Text            =   "01"
         Top             =   150
         Width           =   615
      End
      Begin VB.ComboBox cmbSamaAuthIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6945
         TabIndex        =   22
         Tag             =   "11775"
         Text            =   "01"
         Top             =   150
         Width           =   615
      End
      Begin VB.Label lblSamaDateType 
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
         Left            =   3225
         TabIndex        =   168
         Tag             =   "11775"
         Top             =   210
         Width           =   900
      End
      Begin VB.Label lblSamaAuthExpiryDate 
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
         Left            =   8760
         TabIndex        =   167
         Tag             =   "11775"
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label lblSamaAuthNo 
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
         Left            =   0
         TabIndex        =   166
         Tag             =   "11775"
         Top             =   30
         Width           =   1140
         WordWrap        =   -1  'True
      End
      Begin VB.Label lblSamaAuthIssueDate 
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
         Left            =   5925
         TabIndex        =   165
         Tag             =   "11775"
         Top             =   210
         Width           =   1050
      End
   End
   Begin VB.CommandButton cmdAcctInfo 
      Caption         =   "Account"
      Height          =   405
      Left            =   2745
      TabIndex        =   161
      ToolTipText     =   "Account Info"
      Top             =   7980
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
      Left            =   105
      TabIndex        =   138
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
         TabIndex        =   150
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
         TabIndex        =   149
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
         TabIndex        =   148
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
         TabIndex        =   147
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
         TabIndex        =   146
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
         TabIndex        =   145
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
         TabIndex        =   144
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
         TabIndex        =   143
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
         TabIndex        =   142
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
         TabIndex        =   141
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
         TabIndex        =   140
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
         TabIndex        =   139
         Tag             =   "11820"
         Top             =   240
         Width           =   540
      End
      Begin VB.Line Line3 
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
         TabIndex        =   160
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
         TabIndex        =   159
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
         TabIndex        =   158
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
         TabIndex        =   157
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
         TabIndex        =   156
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
         TabIndex        =   155
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
         TabIndex        =   154
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
         TabIndex        =   153
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
         TabIndex        =   152
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
         TabIndex        =   151
         Tag             =   "11820"
         Top             =   645
         Width           =   1275
      End
   End
   Begin VB.Frame frameDoeDateType 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1425
      TabIndex        =   133
      Top             =   4710
      Width           =   1875
      Begin VB.OptionButton optDOEHijri 
         BackColor       =   &H00BFD87E&
         Caption         =   "Hijri"
         Height          =   255
         Left            =   120
         TabIndex        =   52
         Tag             =   "1875"
         ToolTipText     =   "Hijri"
         Top             =   165
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optDOEGreg 
         BackColor       =   &H00BFD87E&
         Caption         =   "Gregorian"
         Height          =   195
         Left            =   720
         TabIndex        =   53
         Tag             =   "1875"
         ToolTipText     =   "Gregorian"
         Top             =   180
         Width           =   1050
      End
   End
   Begin VB.ComboBox cmbDoeDate 
      Height          =   315
      Left            =   4890
      TabIndex        =   54
      Text            =   "01"
      Top             =   4830
      Width           =   615
   End
   Begin VB.ComboBox cmbDoeMonth 
      Height          =   315
      Left            =   5490
      TabIndex        =   55
      Text            =   "01"
      Top             =   4830
      Width           =   615
   End
   Begin VB.TextBox txtDoeYear 
      Height          =   300
      Left            =   6090
      MaxLength       =   4
      TabIndex        =   56
      Top             =   4830
      Width           =   735
   End
   Begin VB.ComboBox cmbBusinessType 
      Height          =   315
      Left            =   8985
      TabIndex        =   57
      Tag             =   "11775"
      Text            =   "cmbBusinessType"
      Top             =   4830
      Width           =   2625
   End
   Begin VB.TextBox txtGovtShareholding 
      Height          =   285
      Left            =   5865
      MaxLength       =   3
      TabIndex        =   49
      Tag             =   "11775"
      Top             =   4350
      Width           =   495
   End
   Begin VB.TextBox txtSaudiShareholding 
      Height          =   285
      Left            =   8625
      MaxLength       =   3
      TabIndex        =   50
      Tag             =   "11775"
      Top             =   4365
      Width           =   495
   End
   Begin VB.TextBox txtForeignShareholding 
      Height          =   285
      Left            =   11145
      MaxLength       =   3
      TabIndex        =   51
      Tag             =   "11775"
      Top             =   4350
      Width           =   495
   End
   Begin VB.Frame FrameCrLicInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   870
      Left            =   105
      TabIndex        =   117
      Top             =   690
      Width           =   11895
      Begin VB.Frame FrameCrDateType 
         BackColor       =   &H00BFD87E&
         Height          =   420
         Left            =   5625
         TabIndex        =   178
         Tag             =   "11895"
         Top             =   -30
         Width           =   1125
         Begin VB.OptionButton optCrDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "G"
            Height          =   150
            Left            =   615
            TabIndex        =   180
            Tag             =   "1125"
            ToolTipText     =   "Gregorian"
            Top             =   180
            Width           =   465
         End
         Begin VB.OptionButton optCrDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "H"
            Height          =   150
            Left            =   120
            TabIndex        =   179
            Tag             =   "1125"
            ToolTipText     =   "Hijri"
            Top             =   165
            Value           =   -1  'True
            Width           =   480
         End
      End
      Begin VB.TextBox txtCrExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   11055
         MaxLength       =   4
         TabIndex        =   9
         Tag             =   "11895"
         Top             =   90
         Width           =   645
      End
      Begin VB.ComboBox cmbCrExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10440
         TabIndex        =   8
         Tag             =   "11895"
         Text            =   "01"
         Top             =   75
         Width           =   615
      End
      Begin VB.TextBox txtLicExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10995
         MaxLength       =   4
         TabIndex        =   18
         Tag             =   "11895"
         Top             =   465
         Width           =   600
      End
      Begin VB.TextBox txtLicIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8145
         MaxLength       =   4
         TabIndex        =   15
         Tag             =   "11895"
         Top             =   465
         Width           =   555
      End
      Begin VB.ComboBox cmbLicIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7545
         TabIndex        =   14
         Tag             =   "11895"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.ComboBox cmbLicIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   6945
         TabIndex        =   13
         Tag             =   "11895"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.ComboBox cmbLicExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9780
         TabIndex        =   16
         Tag             =   "11895"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.ComboBox cmbLicExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   10380
         TabIndex        =   17
         Tag             =   "11895"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.TextBox txtLicNo 
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
         TabIndex        =   10
         Tag             =   "11895"
         Top             =   480
         Width           =   1935
      End
      Begin VB.TextBox txtCrNo 
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
         Left            =   1215
         MaxLength       =   15
         TabIndex        =   2
         Tag             =   "11895"
         Top             =   0
         Width           =   1170
      End
      Begin VB.ComboBox cmbCrIssuedAt 
         Height          =   315
         Left            =   3285
         TabIndex        =   3
         Tag             =   "11895"
         Text            =   "Riyadh"
         Top             =   15
         Width           =   1305
      End
      Begin VB.ComboBox cmbCrIssuedate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7350
         TabIndex        =   4
         Tag             =   "11895"
         Text            =   "01"
         Top             =   60
         Width           =   615
      End
      Begin VB.ComboBox cmbCrIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7965
         TabIndex        =   5
         Tag             =   "11895"
         Text            =   "01"
         Top             =   60
         Width           =   615
      End
      Begin VB.TextBox txtCrIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   8580
         MaxLength       =   4
         TabIndex        =   6
         Tag             =   "11895"
         Top             =   75
         Width           =   510
      End
      Begin VB.ComboBox cmbCrExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9840
         TabIndex        =   7
         Tag             =   "11895"
         Text            =   "01"
         Top             =   75
         Width           =   615
      End
      Begin VB.Frame FrameLicDateType 
         BackColor       =   &H00BFD87E&
         Height          =   435
         Left            =   4125
         TabIndex        =   118
         Tag             =   "11895"
         Top             =   360
         Width           =   1755
         Begin VB.OptionButton optLicDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   210
            Left            =   135
            TabIndex        =   11
            Tag             =   "1755"
            ToolTipText     =   "Hijri"
            Top             =   165
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optLicDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   195
            Left            =   720
            TabIndex        =   12
            Tag             =   "1755"
            ToolTipText     =   "Gregorian"
            Top             =   180
            Width           =   990
         End
      End
      Begin VB.Label lblCrDateType 
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
         Left            =   4665
         TabIndex        =   181
         Tag             =   "11895"
         Top             =   75
         Width           =   900
      End
      Begin VB.Label lblLicIssueDate 
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
         Left            =   5940
         TabIndex        =   126
         Tag             =   "11895"
         Top             =   525
         Width           =   1155
      End
      Begin VB.Label lblLicDateType 
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
         Left            =   3210
         TabIndex        =   125
         Tag             =   "11895"
         Top             =   510
         Width           =   900
      End
      Begin VB.Label lblLicExpiryDate 
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
         Left            =   8760
         TabIndex        =   124
         Tag             =   "11895"
         Top             =   525
         Width           =   1215
      End
      Begin VB.Label lblLicNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Lic Number"
         BeginProperty Font 
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
         TabIndex        =   123
         Tag             =   "11895"
         Top             =   510
         Width           =   1215
      End
      Begin VB.Label lblCrNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "C.R Number"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   122
         Tag             =   "11895"
         Top             =   0
         Width           =   1335
      End
      Begin VB.Label lblCrIssueDate 
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
         Left            =   6825
         TabIndex        =   121
         Tag             =   "11895"
         Top             =   105
         Width           =   555
      End
      Begin VB.Label lblCrExpiryDate 
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
         Left            =   9225
         TabIndex        =   120
         Tag             =   "11895"
         Top             =   135
         Width           =   525
      End
      Begin VB.Label lblCrIssueAt 
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
         Left            =   2430
         TabIndex        =   119
         Tag             =   "11895"
         Top             =   45
         Width           =   960
      End
   End
   Begin VB.CommandButton cmdNextPage 
      Caption         =   "&Next Page"
      Height          =   405
      Left            =   6495
      TabIndex        =   82
      ToolTipText     =   "Next Page"
      Top             =   7980
      Width           =   1305
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor Comments"
      Height          =   405
      Left            =   4320
      TabIndex        =   116
      ToolTipText     =   "Supervisor Comments"
      Top             =   7980
      Width           =   2175
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1680
      Left            =   105
      TabIndex        =   104
      Top             =   5190
      Width           =   11925
      Begin VB.TextBox txtSaudiPostAdditionalNo 
         Height          =   285
         Left            =   7200
         MaxLength       =   4
         TabIndex        =   67
         Tag             =   "11925"
         Top             =   570
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostGPSNo 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   58
         Tag             =   "11925"
         Top             =   255
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtSaudiPostZipCode 
         Height          =   285
         Left            =   6000
         MaxLength       =   5
         TabIndex        =   66
         Tag             =   "11925"
         Top             =   570
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostUnit 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   63
         Tag             =   "11925"
         Top             =   585
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostStreetName 
         Height          =   285
         Left            =   3810
         MaxLength       =   24
         TabIndex        =   60
         Tag             =   "11925"
         Top             =   255
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   1350
         TabIndex        =   169
         Tag             =   "11925"
         Top             =   0
         Width           =   2670
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
            TabIndex        =   177
            Tag             =   "2670"
            ToolTipText     =   "Saudi Post"
            Top             =   30
            Width           =   1515
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
            TabIndex        =   176
            Tag             =   "2670"
            ToolTipText     =   "PO Box"
            Top             =   30
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   10
         TabIndex        =   80
         Tag             =   "11925"
         Top             =   1320
         Width           =   1695
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4920
         MaxLength       =   4
         TabIndex        =   72
         Tag             =   "11925"
         Text            =   "01"
         Top             =   960
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8280
         MaxLength       =   4
         TabIndex        =   75
         Tag             =   "11925"
         Text            =   "01"
         Top             =   960
         Width           =   375
      End
      Begin VB.TextBox txtMobileAreaCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1200
         MaxLength       =   2
         TabIndex        =   78
         TabStop         =   0   'False
         Tag             =   "11925"
         Text            =   "05"
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1200
         MaxLength       =   4
         TabIndex        =   69
         Tag             =   "11925"
         Text            =   "01"
         Top             =   945
         Width           =   375
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8280
         MaxLength       =   30
         TabIndex        =   81
         Tag             =   "11925"
         Top             =   1320
         Width           =   3255
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   77
         Tag             =   "11925"
         Top             =   960
         Width           =   495
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8640
         MaxLength       =   10
         TabIndex        =   76
         Tag             =   "11925"
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6720
         MaxLength       =   4
         TabIndex        =   74
         Tag             =   "11925"
         Text            =   " "
         Top             =   960
         Width           =   615
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3015
         MaxLength       =   4
         TabIndex        =   71
         Tag             =   "11925"
         Top             =   960
         Width           =   495
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1665
         MaxLength       =   8
         TabIndex        =   79
         Tag             =   "11925"
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   73
         Tag             =   "11925"
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   70
         Tag             =   "11925"
         Top             =   960
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8280
         TabIndex        =   68
         Tag             =   "11925"
         Text            =   "cmbCountry"
         Top             =   570
         Width           =   3255
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6120
         MaxLength       =   10
         TabIndex        =   65
         Tag             =   "11925"
         Top             =   570
         Width           =   1215
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   3015
         TabIndex        =   64
         Tag             =   "11925"
         Text            =   "Riyadh"
         Top             =   585
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
         Left            =   1200
         MaxLength       =   10
         TabIndex        =   62
         Tag             =   "11925"
         Top             =   570
         Width           =   975
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   4455
         MaxLength       =   30
         TabIndex        =   61
         Tag             =   "11925"
         Top             =   255
         Width           =   2880
      End
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   1200
         MaxLength       =   30
         TabIndex        =   59
         Tag             =   "11925"
         Top             =   240
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
         Left            =   7080
         TabIndex        =   175
         Tag             =   "11925"
         Top             =   540
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
         TabIndex        =   174
         Tag             =   "11925"
         Top             =   285
         Width           =   1575
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
         Left            =   5175
         TabIndex        =   173
         Tag             =   "11925"
         Top             =   630
         Visible         =   0   'False
         Width           =   975
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
         TabIndex        =   172
         Tag             =   "11925"
         Top             =   585
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
         Left            =   15
         TabIndex        =   171
         Tag             =   "11925"
         Top             =   300
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
         TabIndex        =   170
         Tag             =   "11925"
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
         Left            =   3720
         TabIndex        =   115
         Tag             =   "11925"
         Top             =   1320
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
         Left            =   6960
         TabIndex        =   114
         Tag             =   "11925"
         Top             =   1320
         Width           =   1260
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
         TabIndex        =   113
         Tag             =   "11925"
         Top             =   960
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
         TabIndex        =   112
         Tag             =   "11925"
         Top             =   1305
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
         TabIndex        =   111
         Tag             =   "11925"
         Top             =   960
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
         TabIndex        =   110
         Tag             =   "11925"
         Top             =   960
         Width           =   1215
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
         TabIndex        =   109
         Tag             =   "11925"
         Top             =   585
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
         Left            =   5175
         TabIndex        =   108
         Tag             =   "11925"
         Top             =   600
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
         Left            =   2460
         TabIndex        =   107
         Tag             =   "11925"
         Top             =   585
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
         TabIndex        =   106
         Tag             =   "11925"
         Top             =   585
         Width           =   1215
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
         TabIndex        =   105
         Tag             =   "11925"
         Top             =   285
         Width           =   1095
      End
   End
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   9330
      TabIndex        =   101
      Top             =   2505
      Width           =   1875
      Begin VB.OptionButton optLangArabic 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic"
         Height          =   255
         Left            =   60
         TabIndex        =   39
         Tag             =   "1875"
         ToolTipText     =   "Arabic"
         Top             =   150
         Value           =   -1  'True
         Width           =   795
      End
      Begin VB.OptionButton optLangEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "English"
         Height          =   255
         Left            =   840
         TabIndex        =   40
         TabStop         =   0   'False
         Tag             =   "1875"
         ToolTipText     =   "Arabic"
         Top             =   150
         Width           =   975
      End
   End
   Begin VB.ComboBox cmbNationality 
      Height          =   315
      Left            =   5565
      TabIndex        =   38
      Text            =   "cmbNationality"
      Top             =   2625
      Width           =   2775
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   405
      Left            =   7800
      TabIndex        =   83
      ToolTipText     =   "Cancel"
      Top             =   7980
      Width           =   1335
   End
   Begin VB.TextBox txtPurposeOfAccount 
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
      Left            =   1065
      MaxLength       =   50
      TabIndex        =   48
      Tag             =   "11775"
      Top             =   4350
      Width           =   3015
   End
   Begin VB.Frame frameCompanyName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1275
      Left            =   105
      TabIndex        =   93
      Top             =   3030
      Width           =   11640
      Begin VB.TextBox txtOrgAlphaSearch 
         Height          =   285
         Left            =   1200
         MaxLength       =   6
         TabIndex        =   47
         Tag             =   "11640"
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox txtArab2ndName 
         Height          =   315
         Left            =   4440
         MaxLength       =   30
         TabIndex        =   42
         Tag             =   "11640"
         Top             =   240
         Width           =   2895
      End
      Begin VB.TextBox txtArabFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   30
         TabIndex        =   41
         Tag             =   "11640"
         Top             =   240
         Width           =   3015
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   7920
         MaxLength       =   30
         TabIndex        =   46
         Tag             =   "11640"
         Top             =   600
         Width           =   3615
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   4440
         MaxLength       =   30
         TabIndex        =   45
         Tag             =   "11640"
         Top             =   600
         Width           =   2895
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1185
         MaxLength       =   30
         TabIndex        =   44
         Tag             =   "11640"
         Top             =   600
         Width           =   3015
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   7920
         MaxLength       =   30
         TabIndex        =   43
         Tag             =   "11640"
         Top             =   240
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
         TabIndex        =   162
         Tag             =   "11640"
         Top             =   960
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
         TabIndex        =   98
         Tag             =   "11640"
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
         TabIndex        =   97
         Tag             =   "11640"
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
         TabIndex        =   96
         Tag             =   "11640"
         Top             =   240
         Width           =   1215
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
         TabIndex        =   95
         Tag             =   "11640"
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
         Left            =   1185
         TabIndex        =   94
         Tag             =   "11640"
         Top             =   0
         Width           =   1815
      End
   End
   Begin VB.ComboBox cmbBranchCode 
      Enabled         =   0   'False
      Height          =   315
      Left            =   4065
      TabIndex        =   0
      Top             =   360
      Width           =   1710
   End
   Begin VB.ComboBox cmbAltBrCode 
      Height          =   315
      Left            =   7830
      TabIndex        =   1
      Top             =   345
      Width           =   1815
   End
   Begin VB.TextBox txtCustomerNo 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   285
      Left            =   1950
      MaxLength       =   7
      TabIndex        =   85
      Top             =   360
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
      TabIndex        =   84
      Top             =   300
      Width           =   1335
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
      Left            =   75
      TabIndex        =   182
      Top             =   2685
      Width           =   1320
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   12000
      Y1              =   240
      Y2              =   240
   End
   Begin VB.Label lblPercSign3 
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
      Height          =   240
      Left            =   11640
      TabIndex        =   137
      Tag             =   "11775"
      Top             =   4350
      Width           =   150
   End
   Begin VB.Label lblDateOfEsta 
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
      Left            =   3825
      TabIndex        =   136
      Top             =   4830
      Width           =   975
   End
   Begin VB.Label lblDOEDateType 
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
      TabIndex        =   135
      Tag             =   "11775"
      Top             =   4830
      Width           =   1095
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
      Left            =   7560
      TabIndex        =   134
      Tag             =   "11775"
      Top             =   4920
      Width           =   1245
   End
   Begin VB.Label lblGovtShareholding 
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
      Left            =   4185
      TabIndex        =   132
      Top             =   4395
      Width           =   1755
   End
   Begin VB.Label lblPercSign1 
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
      Height          =   270
      Left            =   6360
      TabIndex        =   131
      Tag             =   "11775"
      Top             =   4380
      Width           =   150
   End
   Begin VB.Label lblSaudiShareholding 
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
      Left            =   6585
      TabIndex        =   130
      Top             =   4395
      Width           =   2175
   End
   Begin VB.Label lblPercSign2 
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
      Left            =   9105
      TabIndex        =   129
      Tag             =   "11775"
      Top             =   4365
      Width           =   150
   End
   Begin VB.Label lblForeignShareholding 
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
      Left            =   9345
      TabIndex        =   128
      Top             =   4395
      Width           =   1800
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
      Left            =   225
      TabIndex        =   127
      Top             =   8025
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
      Left            =   4395
      TabIndex        =   103
      Top             =   2685
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
      Left            =   8415
      TabIndex        =   102
      Top             =   2655
      Width           =   855
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
      Height          =   255
      Left            =   8280
      TabIndex        =   100
      Top             =   0
      Width           =   3525
   End
   Begin VB.Label lblPurposeOfAccount 
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
      Height          =   405
      Left            =   105
      TabIndex        =   99
      Tag             =   "11775"
      Top             =   4290
      Width           =   1335
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
      Height          =   255
      Left            =   5280
      TabIndex        =   92
      Top             =   0
      Width           =   2925
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   4440
      TabIndex        =   91
      Top             =   0
      Width           =   780
   End
   Begin VB.Label lblResidentJuristicCustDetails 
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
      Left            =   195
      TabIndex        =   90
      Top             =   -30
      Width           =   4155
   End
   Begin VB.Shape Shape1 
      Height          =   555
      Left            =   120
      Top             =   7905
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
      TabIndex        =   89
      Top             =   360
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
      TabIndex        =   88
      Top             =   360
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
      TabIndex        =   87
      Top             =   360
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
      TabIndex        =   86
      Top             =   360
      Width           =   495
   End
End
Attribute VB_Name = "frmJuristicMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmbAltBrCode_LostFocus1()
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

Private Sub cmbCrExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbCrExpiryDate.text)) <> 0 Then
         If Len(cmbCrExpiryDate) = 2 Then
            If cmbCrExpiryDate < 1 Or _
               cmbCrExpiryDate > IIf(optCrDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbCrExpiryDate.text = ""
               cmbCrExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbCrExpiryMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbCrExpiryDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbCrExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbCrExpiryMonth.text)) <> 0 Then
         If Len(cmbCrExpiryMonth.text) = 2 Then
            If cmbCrExpiryMonth < 1 Or cmbCrExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbCrExpiryMonth.text = ""
               cmbCrExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtCrExpiryYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbCrExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbCrIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbCrIssuedate.text)) <> 0 Then
         If Len(cmbCrIssuedate.text) = 2 Then
            If cmbCrIssuedate < 1 Or _
               cmbCrIssuedate > IIf(optCrDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbCrIssuedate.text = ""
               cmbCrIssuedate.SetFocus
            Else
               On Error Resume Next
               cmbCrIssueMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbCrIssuedate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbCrIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbCrIssueMonth.text)) <> 0 Then
         If Len(cmbCrIssueMonth.text) = 2 Then
            If cmbCrIssueMonth < 1 Or cmbCrIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbCrIssueMonth.text = ""
               cmbCrIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtCrIssueYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbCrIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbDoeDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbDoeDate.text)) <> 0 Then
         If Len(cmbDoeDate.text) = 2 Then
            If cmbDoeDate < 1 Or _
               cmbDoeDate > IIf(optDOEGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbDoeDate.text = ""
               cmbDoeDate.SetFocus
            Else
               On Error Resume Next
               cmbDoeMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbDoeDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbDoeMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbDoeMonth.text)) <> 0 Then
         If Len(cmbDoeMonth.text) = 2 Then
            If cmbDoeMonth < 1 Or cmbDoeMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbDoeMonth.text = ""
               cmbDoeMonth.SetFocus
            Else
               On Error Resume Next
               txtDoeYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbDoeMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbLicExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbLicExpiryDate.text)) <> 0 Then
         If Len(cmbLicExpiryDate) = 2 Then
            If cmbLicExpiryDate < 1 Or _
               cmbLicExpiryDate > IIf(optLicDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbLicExpiryDate.text = ""
               cmbLicExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbLicExpiryMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbLicExpiryDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbLicExpiryMonth_Change()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbLicExpiryMonth.text)) <> 0 Then
         If Len(cmbLicExpiryMonth.text) = 2 Then
            If cmbLicExpiryMonth < 1 Or cmbLicExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbLicExpiryMonth.text = ""
               cmbLicExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtLicExpiryYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbLicExpiryMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbLicIssueDate_Change()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbLicIssueDate.text)) <> 0 Then
         If Len(cmbLicIssueDate.text) = 2 Then
            If cmbLicIssueDate < 1 Or _
               cmbLicIssueDate > IIf(optLicDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbLicIssueDate.text = ""
               cmbLicIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbLicIssueMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbLicIssueDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbLicIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbLicIssueMonth.text)) <> 0 Then
         If Len(cmbLicIssueMonth.text) = 2 Then
            If cmbLicIssueMonth < 1 Or cmbLicIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbLicIssueMonth.text = ""
               cmbLicIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtLicIssueYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbLicIssueMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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
  Dim mQry As String
  Dim newOrUpdate As String, tCustNo As String
  Dim tIdType As String, tIdNo As String, custName As String
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If validateFrmJuristicMain = 1 Then
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
     If Len(RTrim(frmJuristicMain.txtCrNo)) > 0 Then
        tIdType = "C"
        tIdNo = Format(frmJuristicMain.txtCrNo, "!@@@@@@@@@@@@@@@")
     ElseIf Len(RTrim(frmJuristicMain.txtLicNo)) > 0 Then
        tIdType = "L"
        tIdNo = Format(frmJuristicMain.txtLicNo, "!@@@@@@@@@@@@@@@")
     End If
     
     If optLangArabic = True Then
        custName = txtArabFirstName & " " & txtArabic2ndName
     Else
        custName = txtEngFirstName & " " & txtEnglish2ndName
     End If
     
     cmdNextPage.Enabled = False
     If checkCustomerExistance(frmJuristicMain, tIdType, tIdNo, newOrUpdate, tCustNo, custName) = 1 Then
        cmdNextPage.Enabled = True
        Exit Sub
     End If
     cmdNextPage.Enabled = True

     If Len(RTrim(txtSamaAuthNo)) = 0 Then
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
 
   frmJuristicAccountInfo.Show
End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox recvJuristicMsg.supervisorComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mainBrCode As String, mainBrArbName As String, mainBrEngName As String
    Dim mQry As String, i As Integer, num, tListIndex
    
    If UserLang = ARABIC Then
       ChangePositions frmJuristicMain, 11800
       frmJuristicMain.RightToLeft = True
       frameOpenUpdateDetails.RightToLeft = True
    End If

   lblMainCategoryDesc = mainCategoryDesc
   lblSubCategoryDesc = subCategoryDesc
   
   frmJuristicMain.Caption = frmJuristicMainCaption(0, UserLang)
   lblResidentJuristicCustDetails.Caption = frmJuristicMainCaption(0, UserLang)
   lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
   lblCustNo.Caption = frmIndividualOthers1Caption(4, UserLang)
   lblBranch.Caption = frmIndividualOthers1Caption(5, UserLang)
   lblAltBranchCode.Caption = frmIndividualOthers1Caption(60, UserLang)
   lblSysDate.Caption = frmIndividualOthers1Caption(6, UserLang)
   lblCrNo.Caption = frmJuristicMainCaption(1, UserLang)
   lblCrIssueAt.Caption = frmJuristicMainCaption(2, UserLang)
   lblCrDateType.Caption = frmJuristicMainCaption(3, UserLang)
   optCrDateHijri.Caption = frmJuristicMainCaption(4, UserLang)
   optCrDateGreg.Caption = frmJuristicMainCaption(5, UserLang)
   lblCrIssueDate.Caption = frmJuristicMainCaption(6, UserLang)
   lblCrExpiryDate.Caption = frmJuristicMainCaption(7, UserLang)
   lblLicNo.Caption = frmJuristicMainCaption(8, UserLang)
   lblLicDateType.Caption = frmJuristicMainCaption(3, UserLang)
   optLicDateHijri.Caption = frmJuristicMainCaption(4, UserLang)
   optLicDateGreg.Caption = frmJuristicMainCaption(5, UserLang)
   lblLicIssueDate.Caption = frmJuristicMainCaption(9, UserLang)
   lblLicExpiryDate.Caption = frmJuristicMainCaption(10, UserLang)
   lblSamaAuthNo.Caption = frmJuristicMainCaption(11, UserLang)
   lblSamaDateType.Caption = frmJuristicMainCaption(3, UserLang)
   optSamaAuthDateHijri.Caption = frmJuristicMainCaption(4, UserLang)
   optSamaAuthDateGreg.Caption = frmJuristicMainCaption(5, UserLang)
   lblSamaAuthIssueDate.Caption = frmJuristicMainCaption(9, UserLang)
   lblSamaAuthExpiryDate.Caption = frmJuristicMainCaption(10, UserLang)
   lblNationality.Caption = frmJuristicMainCaption(12, UserLang)
   lblLangPref.Caption = frmJuristicMainCaption(13, UserLang)
   optLangArabic.Caption = frmJuristicMainCaption(14, UserLang)
   optLangEnglish.Caption = frmJuristicMainCaption(15, UserLang)
   lblFirstName.Caption = frmJuristicMainCaption(16, UserLang)
   lbl2ndName.Caption = frmJuristicMainCaption(17, UserLang)
   lblShortName.Caption = frmJuristicMainCaption(18, UserLang)
   lblArabicName.Caption = frmJuristicMainCaption(19, UserLang)
   lblEnglishName.Caption = frmJuristicMainCaption(20, UserLang)
   lblOrgAlphaSearch.Caption = frmJuristicMainCaption(42, UserLang)
   lblPurposeOfAccount.Caption = frmJuristicMainCaption(21, UserLang)
   lblGovtShareholding.Caption = frmJuristicMainCaption(22, UserLang)
   lblSaudiShareholding.Caption = frmJuristicMainCaption(23, UserLang)
   lblForeignShareholding.Caption = frmJuristicMainCaption(24, UserLang)
   lblDOEDateType.Caption = frmJuristicMainCaption(25, UserLang)
   optDOEHijri.Caption = frmJuristicMainCaption(4, UserLang)
   optDOEGreg.Caption = frmJuristicMainCaption(5, UserLang)
   lblDateOfEsta.Caption = frmJuristicMainCaption(25, UserLang)
   lblBusinessType.Caption = frmJuristicMainCaption(26, UserLang)
   lblAddress1.Caption = frmJuristicMainCaption(27, UserLang)
   lblPOBox.Caption = frmJuristicMainCaption(28, UserLang)
   lblCity.Caption = frmJuristicMainCaption(29, UserLang)
   lblZipCode.Caption = frmJuristicMainCaption(30, UserLang)
   lblCountry.Caption = frmJuristicMainCaption(31, UserLang)
   lblOffPhone.Caption = frmJuristicMainCaption(32, UserLang)
   lblResPhone.Caption = frmJuristicMainCaption(33, UserLang)
   lblFax.Caption = frmJuristicMainCaption(34, UserLang)
   lblMobile.Caption = frmJuristicMainCaption(35, UserLang)
   lblPager.Caption = frmJuristicMainCaption(36, UserLang)
   lblEmail.Caption = frmJuristicMainCaption(37, UserLang)
   cmdAcctInfo.Caption = frmJuristicMainCaption(38, UserLang)
   cmdSupervisorComments.Caption = frmJuristicMainCaption(39, UserLang)
   cmdNextPage.Caption = frmJuristicMainCaption(40, UserLang)
   cmdCancel.Caption = frmJuristicMainCaption(41, UserLang)
   
   lblApproverNumber.Caption = frmJuristicMainCaption(43, UserLang)
   lblApproverName.Caption = frmJuristicMainCaption(44, UserLang)
   lblAppDateType.Caption = frmJuristicMainCaption(3, UserLang)
   optAppDateHijri.Caption = frmJuristicMainCaption(4, UserLang)
   optAppDateGreg.Caption = frmJuristicMainCaption(5, UserLang)
   lblAppIssueDate.Caption = frmJuristicMainCaption(9, UserLang)
   lblAppExpiryDate.Caption = frmJuristicMainCaption(10, UserLang)

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
       
   If Len(Trim(gDateTime)) = 0 Then
      gDateTime = Space(14)   'Date Time to be used for global
   End If
       
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
       tCode = Mid$(frmJuristicMain.cmbAltBrCode, 1, 4)
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
        cmbCrIssuedAt.Clear
        cmbCity.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbCrIssuedAt.AddItem rs("englishname")
              cmbCity.AddItem rs("englishname")
           Else
              cmbCrIssuedAt.AddItem rs("arabicname")
              cmbCity.AddItem rs("arabicname")
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
                cmbCrIssuedAt.text = rs(0)
                cmbCity.text = rs(0)
             Else  ' the following part should be arabized later
                cmbCrIssuedAt.text = rs(1)
                cmbCity.text = rs(1)
             End If
         Else
            txtOffPhoneCityCode = "01"
            txtResPhoneCityCode = "01"
            txtFaxCityCode = "01"
            cmbCrIssuedAt.text = ""
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
    
    cmbDoeDate.Clear
    cmbDoeMonth.Clear
    cmbCrIssuedate.Clear
    cmbCrIssueMonth.Clear
    cmbCrExpiryDate.Clear
    cmbCrExpiryMonth.Clear
    cmbLicIssueDate.Clear
    cmbLicIssueMonth.Clear
    cmbLicExpiryDate.Clear
    cmbLicExpiryMonth.Clear
    cmbSamaAuthIssueDate.Clear
    cmbSamaAuthIssueMonth.Clear
    cmbSamaAuthExpiryDate.Clear
    cmbSamaAuthExpiryMonth.Clear
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
       cmbDoeDate.AddItem num
       cmbCrIssuedate.AddItem num
       cmbLicIssueDate.AddItem num
       cmbSamaAuthIssueDate.AddItem num
       cmbCrExpiryDate.AddItem num
       cmbLicExpiryDate.AddItem num
       cmbSamaAuthExpiryDate.AddItem num
       cmbAppIssueDate.AddItem num
       cmbAppExpiryDate.AddItem num
       
       If i < 13 Then
          cmbDoeMonth.AddItem num
          cmbCrIssueMonth.AddItem num
          cmbLicIssueMonth.AddItem num
          cmbSamaAuthIssueMonth.AddItem num
          cmbCrExpiryMonth.AddItem num
          cmbLicExpiryMonth.AddItem num
          cmbSamaAuthExpiryMonth.AddItem num
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
      frameCompanyName.Enabled = False
      FrameCrLicInfo.Enabled = False
      frameSamaAppInfo.Enabled = False
      frameApproverInfo.Enabled = False
      txtApproverName.Enabled = False
      frameLang.Enabled = False
      cmbNationality.Enabled = False
      txtPurposeOfAccount.Enabled = False
      txtGovtShareholding.Enabled = False
      txtSaudiShareholding.Enabled = False
      txtForeignShareholding.Enabled = False
      frameDoeDateType.Enabled = False
      cmbDoeDate.Enabled = False
      cmbDoeMonth.Enabled = False
      txtDoeYear.Enabled = False
      cmbBusinessType.Enabled = False
      frameCustomerContactInfo.Enabled = False
      If custHistoryAction Then
         lblHistory.Visible = True
         lblHistory.Refresh
      Else
         lblHistory.Visible = False
      End If
   Else
      frameCompanyName.Enabled = True
      If subCategoryCode = "53" Or subCategoryCode = "54" Or subCategoryCode = "67" Or _
         subCategoryCode = "80" Then
         FrameCrLicInfo.Enabled = False
      Else
         FrameCrLicInfo.Enabled = True
      End If
     
      frameSamaAppInfo.Enabled = True
      frameApproverInfo.Enabled = True
      txtApproverName.Enabled = True
      frameLang.Enabled = True
      cmbNationality.Enabled = True
      frameDoeDateType.Enabled = True
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
            frameCompanyName.Enabled = True
            frameLang.Enabled = True
         Else
            frameCompanyName.Enabled = False
            frameLang.Enabled = False
         End If
         If recvLoginMsg.mainBrEditAllowed = "1" And recvJuristicMsg.mainBrCodeUpdAllowed = "1" Then
            cmbBranchCode.Enabled = True
         Else
            cmbBranchCode.Enabled = False
         End If
      End If
      
      txtPurposeOfAccount.Enabled = True
      If subCategoryCode = "36" Then
         txtGovtShareholding.Enabled = True
         txtSaudiShareholding.Enabled = True
         txtForeignShareholding.Enabled = True
      Else
         txtGovtShareholding.Enabled = False
         txtSaudiShareholding.Enabled = False
         txtForeignShareholding.Enabled = False
      End If
      cmbDoeDate.Enabled = True
      cmbDoeMonth.Enabled = True
      txtDoeYear.Enabled = True
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

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameCompanyName_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameCrLicInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameCustomerContactInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameOpenUpdateDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameSamaAppInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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

Private Sub optCrDateGreg_Click()
   If cmbCrIssuedate.ListCount = 30 Then
      cmbCrIssuedate.AddItem 31
      cmbCrExpiryDate.AddItem 31
   End If
   cmbCrExpiryDate = ""
   cmbCrExpiryMonth = ""
   txtCrExpiryYear = ""
   cmbCrIssuedate = ""
   cmbCrIssueMonth = ""
   txtCrIssueYear = ""
End Sub

Private Sub optCrDateHijri_Click()
    If cmbCrIssuedate.ListCount = 31 Then
       cmbCrIssuedate.RemoveItem 30
       cmbCrExpiryDate.RemoveItem 30
    End If
    cmbCrExpiryDate = ""
    cmbCrExpiryMonth = ""
    txtCrExpiryYear = ""
    cmbCrIssuedate = ""
    cmbCrIssueMonth = ""
    txtCrIssueYear = ""
End Sub

Private Sub optDOEGreg_Click()
   If cmbDoeDate.ListCount = 30 Then
      cmbDoeDate.AddItem 31
   End If
   cmbDoeDate = ""
   cmbDoeMonth = ""
   txtDoeYear = ""
End Sub

Private Sub optDOEHijri_Click()
    If cmbDoeDate.ListCount = 31 Then
       cmbDoeDate.RemoveItem 30
    End If
    cmbDoeDate = ""
    cmbDoeMonth = ""
    txtDoeYear = ""
End Sub

Private Sub optLicDateGreg_Click()
   If cmbLicIssueDate.ListCount = 30 Then
      cmbLicIssueDate.AddItem 31
      cmbLicExpiryDate.AddItem 31
   End If
   cmbLicExpiryDate = ""
   cmbLicExpiryMonth = ""
   txtLicExpiryYear = ""
   cmbLicIssueDate = ""
   cmbLicIssueMonth = ""
   txtLicIssueYear = ""
End Sub

Private Sub optLicDateHijri_Click()
    If cmbLicIssueDate.ListCount = 31 Then
       cmbLicIssueDate.RemoveItem 30
       cmbLicExpiryDate.RemoveItem 30
    End If
    cmbLicExpiryDate = ""
    cmbLicExpiryMonth = ""
    txtLicExpiryYear = ""
    cmbLicIssueDate = ""
    cmbLicIssueMonth = ""
    txtLicIssueYear = ""
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

Private Sub optSamaAuthDateGreg_Click()
   If cmbSamaAuthIssueDate.ListCount = 30 Then
      cmbSamaAuthIssueDate.AddItem 31
      cmbSamaAuthExpiryDate.AddItem 31
   End If
   cmbSamaAuthExpiryDate = ""
   cmbSamaAuthExpiryMonth = ""
   txtSamaAuthExpiryYear = ""
   cmbSamaAuthIssueDate = ""
   cmbSamaAuthIssueMonth = ""
   txtSamaAuthIssueYear = ""
End Sub

Private Sub optSamaAuthDateHijri_Click()
   If cmbSamaAuthIssueDate.ListCount = 31 Then
      cmbSamaAuthIssueDate.RemoveItem 30
      cmbSamaAuthExpiryDate.RemoveItem 30
   End If
   cmbSamaAuthExpiryDate = ""
   cmbSamaAuthExpiryMonth = ""
   txtSamaAuthExpiryYear = ""
   cmbSamaAuthIssueDate = ""
   cmbSamaAuthIssueMonth = ""
   txtSamaAuthIssueYear = ""
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

Private Sub txtCrExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtCrExpiryYear)) <> 0 Then
        If Len(txtCrExpiryYear) = 4 Then
           txtLicNo.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtCrExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtCrExpiryYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbCrExpiryDate)) > 0 And Len(RTrim(cmbCrExpiryMonth)) > 0 Then
          If Len(RTrim(txtCrExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtCrExpiryYear.text = ""
             txtCrExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtCrExpiryYear)) <> 0 Then
          If optCrDateHijri.Value = True Then
             If txtCrExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtCrExpiryYear.Enabled = True Then
                   txtCrExpiryYear.text = ""
                   txtCrExpiryYear.SetFocus
                Else
                   'framecrInfo.Enabled = True
                   txtCrExpiryYear.Enabled = True
                   txtCrExpiryYear.text = ""
                   txtCrExpiryYear.SetFocus
                End If
             End If
          Else
             If txtCrExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtCrExpiryYear.Enabled = True Then
                   txtCrExpiryYear.text = ""
                   txtCrExpiryYear.SetFocus
                Else
                   txtCrExpiryYear.Enabled = True
                   txtCrExpiryYear.text = ""
                   txtCrExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If
End Sub

Private Sub txtCrIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtCrIssueYear)) <> 0 Then
        If Len(txtCrIssueYear) = 4 Then
           cmbCrExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtCrIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtCrIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbCrIssuedate)) > 0 And Len(RTrim(cmbCrIssueMonth)) > 0 Then
          If Len(RTrim(txtCrIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtCrIssueYear.text = ""
             txtCrIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtCrIssueYear)) <> 0 Then
          If optCrDateHijri.Value = True Then
             If txtCrIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtCrIssueYear.Enabled = True Then
                   txtCrIssueYear.text = ""
                   txtCrIssueYear.SetFocus
                Else
                   'framecrInfo.Enabled = True
                   txtCrIssueYear.Enabled = True
                   txtCrIssueYear.text = ""
                   txtCrIssueYear.SetFocus
                End If
             End If
          Else
             If txtCrIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtCrIssueYear.Enabled = True Then
                   txtCrIssueYear.text = ""
                   txtCrIssueYear.SetFocus
                Else
                   txtCrIssueYear.Enabled = True
                   txtCrIssueYear.text = ""
                   txtCrIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If
End Sub

Private Sub txtDoeYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtDoeYear)) <> 0 Then
        If Len(RTrim(txtDoeYear)) = 4 Then
           cmbBusinessType.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtDoeYear_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtDoeYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbDoeDate)) > 0 And Len(RTrim(cmbDoeMonth)) > 0 Then
          If Len(RTrim(txtDoeYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtDoeYear.text = ""
             txtDoeYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtDoeYear)) <> 0 Then
          If optDOEHijri.Value = True Then
             If txtDoeYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtDoeYear.Enabled = True Then
                   txtDoeYear.text = ""
                   txtDoeYear.SetFocus
                Else
                   txtDoeYear.Enabled = True
                   txtDoeYear.text = ""
                   txtDoeYear.SetFocus
                End If
             End If
          Else
             If txtDoeYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtDoeYear.Enabled = True Then
                   txtDoeYear.text = ""
                   txtDoeYear.SetFocus
                Else
                   txtDoeYear.Enabled = True
                   txtDoeYear.text = ""
                   txtDoeYear.SetFocus
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
     txtEngShortName = txtEngFirstName & " " & txtEnglish2ndName
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

Private Sub txtForeignShareholding_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtGovtShareholding_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub

Private Sub txtLicExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtLicExpiryYear)) <> 0 Then
        If Len(txtLicExpiryYear) = 4 Then
           txtSamaAuthNo.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtLicExpiryYear_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtLicExpiryYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbLicExpiryDate)) > 0 And Len(RTrim(cmbLicExpiryMonth)) > 0 Then
          If Len(RTrim(txtLicExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtLicExpiryYear.text = ""
             txtLicExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtLicExpiryYear)) <> 0 Then
          If optLicDateHijri.Value = True Then
             If txtLicExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtLicExpiryYear.Enabled = True Then
                   txtLicExpiryYear.text = ""
                   txtLicExpiryYear.SetFocus
                Else
                   'framecrInfo.Enabled = True
                   txtLicExpiryYear.Enabled = True
                   txtLicExpiryYear.text = ""
                   txtLicExpiryYear.SetFocus
                End If
             End If
          Else
             If txtLicExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtLicExpiryYear.Enabled = True Then
                   txtLicExpiryYear.text = ""
                   txtLicExpiryYear.SetFocus
                Else
                   txtLicExpiryYear.Enabled = True
                   txtLicExpiryYear.text = ""
                   txtLicExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtLicIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtLicIssueYear)) <> 0 Then
        If Len(txtLicIssueYear) = 4 Then
           cmbLicExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtLicIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtLicIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbLicIssueDate)) > 0 And Len(RTrim(cmbLicIssueMonth)) > 0 Then
          If Len(RTrim(txtLicIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtLicIssueYear.text = ""
             txtLicIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtLicIssueYear)) <> 0 Then
          If optLicDateHijri.Value = True Then
             If txtLicIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtLicIssueYear.Enabled = True Then
                   txtLicIssueYear.text = ""
                   txtLicIssueYear.SetFocus
                Else
                   'framecrInfo.Enabled = True
                   txtLicIssueYear.Enabled = True
                   txtLicIssueYear.text = ""
                   txtLicIssueYear.SetFocus
                End If
             End If
          Else
             If txtLicIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtLicIssueYear.Enabled = True Then
                   txtLicIssueYear.text = ""
                   txtLicIssueYear.SetFocus
                Else
                   txtLicIssueYear.Enabled = True
                   txtLicIssueYear.text = ""
                   txtLicIssueYear.SetFocus
                End If
             End If
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

Private Sub txtSamaAuthExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtSamaAuthExpiryYear)) <> 0 Then
        If Len(txtSamaAuthExpiryYear) = 4 Then
           txtApproverNo.SetFocus
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

Private Sub txtSamaAuthExpiryYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbSamaAuthExpiryDate)) > 0 And Len(RTrim(cmbSamaAuthExpiryMonth)) > 0 Then
          If Len(RTrim(txtSamaAuthExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtSamaAuthExpiryYear.text = ""
             txtSamaAuthExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtSamaAuthExpiryYear)) <> 0 Then
          If optSamaAuthDateHijri.Value = True Then
             If txtSamaAuthExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtSamaAuthExpiryYear.Enabled = True Then
                   txtSamaAuthExpiryYear.text = ""
                   txtSamaAuthExpiryYear.SetFocus
                Else
                   'framecrInfo.Enabled = True
                   txtSamaAuthExpiryYear.Enabled = True
                   txtSamaAuthExpiryYear.text = ""
                   txtSamaAuthExpiryYear.SetFocus
                End If
             End If
          Else
             If txtSamaAuthExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtSamaAuthExpiryYear.Enabled = True Then
                   txtSamaAuthExpiryYear.text = ""
                   txtSamaAuthExpiryYear.SetFocus
                Else
                   txtSamaAuthExpiryYear.Enabled = True
                   txtSamaAuthExpiryYear.text = ""
                   txtSamaAuthExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
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
Public Function validateCrNo() As Integer
    Dim tCrIssueDate As String, tCrExpiryDate As String
    Dim tIssueDate As String, tExpiryDate As String
    
     validateCrNo = 0
     
     If Trim(txtCrNo) = String(Len(Trim(txtCrNo)), "0") Then
        MsgBox errInvalidIdNo(UserLang)
        txtCrNo.SetFocus
        validateCrNo = 1
        Exit Function
      Else
        validateCrNo = 0
      End If
            
       If Len(RTrim(cmbCrIssuedate.text)) = 0 Or _
          Len(RTrim(cmbCrIssueMonth.text)) = 0 Or _
          Len(RTrim(txtCrIssueYear.text)) = 0 Then
          MsgBox errSpaceCrIssueDate(UserLang)
          cmbCrIssuedate.SetFocus
          validateCrNo = 1
          Exit Function
        Else
            validateCrNo = 0
        End If
        If Len(RTrim(cmbCrExpiryDate.text)) = 0 Or _
           Len(RTrim(cmbCrExpiryMonth.text)) = 0 Or _
           Len(RTrim(txtCrExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           cmbCrExpiryDate.SetFocus
           validateCrNo = 1
           Exit Function
        Else
           validateCrNo = 0
        End If
    
        tIssueDate = CStr(txtCrIssueYear) & _
                     CStr(cmbCrIssueMonth.text) & _
                     CStr(cmbCrIssuedate.text)
             
        tExpiryDate = CStr(txtCrExpiryYear) & _
                      CStr(cmbCrExpiryMonth.text) & _
                      CStr(cmbCrExpiryDate.text)
                              
         If optCrDateGreg.Value = True Then
            If Not validDate(tIssueDate) Then
               MsgBox errInvalidDate(UserLang)
               cmbCrIssuedate.SetFocus
               validateCrNo = 1
               Exit Function
            Else
               validateCrNo = 0
            End If
                   
            If Not validDate(tExpiryDate) Then
               MsgBox errInvalidDate(UserLang)
               cmbCrExpiryDate.SetFocus
               validateCrNo = 1
               Exit Function
            Else
               validateCrNo = 0
            End If
        End If
                              
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           txtCrExpiryYear.SetFocus
           validateCrNo = 1
           Exit Function
        Else
           validateCrNo = 0
        End If
        
        If optCrDateHijri = True Then
           If tExpiryDate < currentHijriDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtCrExpiryYear.SetFocus
              validateCrNo = 1
              Exit Function
           Else
              validateCrNo = 0
           End If
        Else
           If tExpiryDate < currentGregDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              txtCrExpiryYear.SetFocus
              validateCrNo = 1
              Exit Function
           Else
              validateCrNo = 0
           End If
        End If
         
         If Len(RTrim(cmbCrIssuedAt.text)) = 0 Then
            MsgBox errSpaceIdIssuedAt(UserLang)
            cmbCrIssuedAt.SetFocus
            validateCrNo = 1
            Exit Function
         Else
            validateCrNo = 0
         End If
End Function
Public Function validateLicNo() As Integer
        Dim tIssueDate As String, tExpiryDate As String
        
        validateLicNo = 0
        If Trim(txtLicNo) = String(Len(Trim(txtLicNo)), "0") Then
            MsgBox errInvalidIdNo(UserLang)
            txtLicNo.SetFocus
            validateLicNo = 1
            Exit Function
         Else
            validateLicNo = 0
         End If
         
         If Len(RTrim(cmbLicIssueDate.text)) = 0 Or _
            Len(RTrim(cmbLicIssueMonth.text)) = 0 Or _
            Len(RTrim(txtLicIssueYear.text)) = 0 Then
            MsgBox errSpaceIssueDate(UserLang)
            cmbLicIssueDate.SetFocus
            validateLicNo = 1
            Exit Function
        Else
            validateLicNo = 0
        End If
        
        If subCategoryCode <> "19" And subCategoryCode <> "20" And _
           subCategoryCode <> "21" And subCategoryCode <> "22" And _
           subCategoryCode <> "23" And subCategoryCode <> "52" And _
           subCategoryCode <> "55" And subCategoryCode <> "31" Then
           If Len(RTrim(cmbLicExpiryDate.text)) = 0 Or _
               Len(RTrim(cmbLicExpiryMonth.text)) = 0 Or _
               Len(RTrim(txtLicExpiryYear)) = 0 Then
                MsgBox errSpaceExpiryDate(UserLang)
                cmbLicExpiryDate.SetFocus
                validateLicNo = 1
                Exit Function
            Else
                validateLicNo = 0
            End If
        End If
            
        tIssueDate = CStr(txtLicIssueYear) & _
                     CStr(cmbLicIssueMonth.text) & _
                     CStr(cmbLicIssueDate.text)
             
        tExpiryDate = CStr(txtLicExpiryYear) & _
                      CStr(cmbLicExpiryMonth.text) & _
                      CStr(cmbLicExpiryDate.text)
                              
         If optLicDateGreg.Value = True Then
            If Not validDate(tIssueDate) Then
               MsgBox errInvalidDate(UserLang)
               cmbLicIssueDate.SetFocus
               validateLicNo = 1
               Exit Function
            Else
               validateLicNo = 0
            End If
            If subCategoryCode <> "19" And subCategoryCode <> "20" And _
               subCategoryCode <> "21" And subCategoryCode <> "22" And _
               subCategoryCode <> "23" And subCategoryCode <> "52" And _
               subCategoryCode <> "55" And subCategoryCode <> "31" Then
               If Len(RTrim(tExpiryDate)) <> 0 Then
                  If Not validDate(tExpiryDate) Then
                     MsgBox errInvalidDate(UserLang)
                     cmbLicExpiryDate.SetFocus
                     validateLicNo = 1
                     Exit Function
                  Else
                     validateLicNo = 0
                  End If
                End If
            End If
         End If
                       
         If Len(RTrim(tExpiryDate)) > 0 Then
             If tExpiryDate < tIssueDate Then
                MsgBox errGreaterExpiryYear(UserLang)
                txtLicExpiryYear.SetFocus
                validateLicNo = 1
                Exit Function
             Else
                validateLicNo = 0
             End If
             
             If optLicDateHijri = True Then
               If tExpiryDate < currentHijriDate Then
                  MsgBox errExpiryDateLessThanToday(UserLang)
                  txtLicExpiryYear.SetFocus
                  validateLicNo = 1
                  Exit Function
               Else
                  validateLicNo = 0
               End If
             Else
               If tExpiryDate < currentGregDate Then
                  MsgBox errExpiryDateLessThanToday(UserLang)
                  txtLicExpiryYear.SetFocus
                  validateLicNo = 1
                  Exit Function
               Else
                  validateLicNo = 0
               End If
            End If
        End If

End Function
Public Function validateFrmJuristicMain() As Integer
    Dim tCrIssueDate As String, tCrExpiryDate As String
    Dim tIssueDate As String, tExpiryDate As String
    Dim tDoe As String, tmpCode As String, mQry As String
    
    validateFrmJuristicMain = 0
    
    If Len(RTrim(Mid$(cmbBranchCode, 1, 4))) = 0 Then
       MsgBox errSpaceBranchCode(UserLang)
       validateFrmJuristicMain = 1
       Exit Function
    Else
       validateFrmJuristicMain = 0
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
          validateFrmJuristicMain = 1
          Exit Function
       Else
          validateFrmJuristicMain = 0
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
       validateFrmJuristicMain = 1
       Exit Function
    Else
       validateFrmJuristicMain = 0
    End If
    
    If subCategoryCode = "10" Then
       If Len(RTrim(txtCrNo)) = 0 And Len(RTrim(txtLicNo)) = 0 Then
          MsgBox errEitherCrOrLicMandatory(UserLang)
          validateFrmJuristicMain = 1
          Exit Function
       Else
          validateFrmJuristicMain = 0
       End If
       
       If Len(RTrim(txtCrNo)) <> 0 Then
          If validateCrNo = 1 Then
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       Else
          If Len(RTrim(txtLicNo)) = 0 Then
             MsgBox errSpaceLicNo(UserLang) ' "Lic Number cannot be spaces...Please enter..."
             txtLicNo.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
          
          If validateLicNo = 1 Then
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
      End If
   End If ' if subcategory = 10

    If subCategoryCode = "11" Or subCategoryCode = "12" Or _
       subCategoryCode = "13" Or subCategoryCode = "14" Or subCategoryCode = "15" Or _
       subCategoryCode = "16" Or subCategoryCode = "17" Or subCategoryCode = "18" Or _
       subCategoryCode = "19" Or subCategoryCode = "20" Or subCategoryCode = "21" Or _
       subCategoryCode = "22" Or subCategoryCode = "23" Then
        If Len(RTrim(txtCrNo)) = 0 Then
           MsgBox errSpaceCR(UserLang) ' "CR Number cannot be spaces...Please enter..."
           txtCrNo.SetFocus
           validateFrmJuristicMain = 1
           Exit Function
         Else
           validateFrmJuristicMain = 0
         End If
         
'         If Len(RTrim(txtCrNo)) <> 10 Then
'            MsgBox errInvalidId(UserLang)
'            txtCrNo.SetFocus
'            validateFrmJuristicMain = 1
'            Exit Function
'         Else
'            validateFrmJuristicMain = 0
'         End If
'
'         If validIdNumber(txtCrNo) = False Then
'            MsgBox errInvalidIdNo(UserLang)
'            txtCrNo.SetFocus
'            validateFrmJuristicMain = 1
'            Exit Function
'         Else
'            validateFrmJuristicMain = 0
'         End If
         
         If validateCrNo = 1 Then
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
     End If  ' if subcatgorycode = "10", etc...
     
     If subCategoryCode = "24" Or _
        subCategoryCode = "29" Or subCategoryCode = "30" Or _
        subCategoryCode = "31" Or subCategoryCode = "34" Or _
        subCategoryCode = "35" Or subCategoryCode = "57" Or _
        subCategoryCode = "58" Or subCategoryCode = "64" Then
        If Len(RTrim(txtLicNo)) = 0 Then
           MsgBox errSpaceLicNo(UserLang) ' "Lic Number cannot be spaces...Please enter..."
           txtLicNo.SetFocus
           validateFrmJuristicMain = 1
           Exit Function
         Else
           validateFrmJuristicMain = 0
         End If
         
'         If Len(RTrim(txtLicNo)) <> 10 Then
'            MsgBox errInvalidId(UserLang)
'            txtLicNo.SetFocus
'            validateFrmJuristicMain = 1
'            Exit Function
'         Else
'            validateFrmJuristicMain = 0
'         End If
'
'         If validIdNumber(txtLicNo) = False Then
'            MsgBox errInvalidIdNo(UserLang)
'            txtLicNo.SetFocus
'            validateFrmJuristicMain = 1
'            Exit Function
'         Else
'            validateFrmJuristicMain = 0
'         End If
         
         If validateLicNo = 1 Then
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
     End If ' subcategorycode = "24" or "10", etc...
     
     If subCategoryCode <> "53" And subCategoryCode <> "54" And subCategoryCode <> "67" And _
        subCategoryCode <> "80" Then
        If Len(RTrim(txtCrNo)) > 0 Then
           If validateCrNo = 1 Then
              validateFrmJuristicMain = 1
              Exit Function
           Else
              validateFrmJuristicMain = 0
           End If
        End If
        
        If Len(RTrim(txtLicNo)) > 0 Then
           If validateLicNo = 1 Then
              validateFrmJuristicMain = 1
              Exit Function
           Else
              validateFrmJuristicMain = 0
           End If
        End If
    End If
     
'     If subCategorycode = "26" Or subCategorycode = "27" Or _
'        subCategorycode = "28" Or subCategorycode = "29" Or _
'        subCategorycode = "30" Or subCategorycode = "31" Or _
'        subCategorycode = "34" Or subCategorycode = "35" Or _
'        subCategorycode = "24" Or subCategorycode = "32" Or _
'        subCategorycode = "33" Or subCategorycode = "36" Or _
'        subCategorycode = "37" Then
'
'        If Len(RTrim(txtSamaAuthNo)) = 0 Then
'           MsgBox errSpaceSamaApproval(UserLang) ' "sama approval  Number cannot be spaces...Please enter..."
'           txtSamaAuthNo.SetFocus
'           validateFrmJuristicMain = 1
'           Exit Function
'         Else
'           validateFrmJuristicMain = 0
'         End If
'
'         If Len(RTrim(cmbSamaAuthIssueDate.Text)) = 0 Or _
'            Len(RTrim(cmbSamaAuthIssueMonth.Text)) = 0 Or _
'            Len(RTrim(txtSamaAuthIssueYear.Text)) = 0 Then
'            MsgBox errSpaceIssueDate(UserLang)
'            cmbSamaAuthIssueDate.SetFocus
'            validateFrmJuristicMain = 1
'            Exit Function
'        Else
'            validateFrmJuristicMain = 0
'        End If

    If subCategoryCode = "64" Then
        If Len(RTrim(txtSamaAuthNo)) = 0 Then
           MsgBox errSpaceSamaApproval(UserLang) ' "sama approval  Number cannot be spaces...Please enter..."
           txtSamaAuthNo.SetFocus
           validateFrmJuristicMain = 1
           Exit Function
         Else
           validateFrmJuristicMain = 0
         End If
    End If

    If Len(RTrim(txtSamaAuthNo)) > 0 Then
       If Len(RTrim(cmbSamaAuthIssueDate.text)) = 0 Or _
          Len(RTrim(cmbSamaAuthIssueMonth.text)) = 0 Or _
          Len(RTrim(txtSamaAuthIssueYear.text)) = 0 Then
          MsgBox errSpaceIssueDate(UserLang)
          cmbSamaAuthIssueDate.SetFocus
          validateFrmJuristicMain = 1
          Exit Function
      Else
          validateFrmJuristicMain = 0
      End If


      tIssueDate = CStr(txtSamaAuthIssueYear) & _
                   CStr(cmbSamaAuthIssueMonth.text) & _
                   CStr(cmbSamaAuthIssueDate.text)
           
      tExpiryDate = CStr(txtSamaAuthExpiryYear) & _
                    CStr(cmbSamaAuthExpiryMonth.text) & _
                    CStr(cmbSamaAuthExpiryDate.text)
       
      If optSamaAuthDateGreg.Value = True Then
         If Len(RTrim(tIssueDate)) > 0 Then
            If Not validDate(tIssueDate) Then
               MsgBox errInvalidDate(UserLang)
               cmbSamaAuthIssueDate.SetFocus
               validateFrmJuristicMain = 1
               Exit Function
             Else
                validateFrmJuristicMain = 0
             End If
         End If
         
         If Len(RTrim(tExpiryDate)) <> 0 Then
            If Not validDate(tExpiryDate) Then
               MsgBox errInvalidDate(UserLang)
               cmbSamaAuthExpiryDate.SetFocus
               validateFrmJuristicMain = 1
               Exit Function
            Else
               validateFrmJuristicMain = 0
            End If
         End If
      End If
                              
      If Len(RTrim(tExpiryDate)) <> 0 Then
         If tExpiryDate < tIssueDate Then
            MsgBox errGreaterExpiryYear(UserLang)
            txtSamaAuthExpiryYear.SetFocus
            validateFrmJuristicMain = 1
            Exit Function
         Else
            validateFrmJuristicMain = 0
         End If
            
         If optSamaAuthDateHijri = True Then
            If tExpiryDate < currentHijriDate Then
               MsgBox errExpiryDateLessThanToday(UserLang)
               txtSamaAuthExpiryYear.SetFocus
               validateFrmJuristicMain = 1
               Exit Function
            Else
               validateFrmJuristicMain = 0
            End If
         Else
            If tExpiryDate < currentGregDate Then
               MsgBox errExpiryDateLessThanToday(UserLang)
               txtSamaAuthExpiryYear.SetFocus
               validateFrmJuristicMain = 1
               Exit Function
            Else
               validateFrmJuristicMain = 0
            End If
         End If
      End If
   End If ' if len(samaauthno) > 0

'    End If ' subcategorycode "26" or 27....etc..
     
'    If subCategorycode = "36" Or subCategorycode = "53" Or _
'       subCategorycode = "54" Then  'public corporations and public sector / government
       
   If Len(RTrim(txtPurposeOfAccount)) = 0 Then
      MsgBox errSpacePurposeOfAccount(UserLang)
      txtPurposeOfAccount.SetFocus
      validateFrmJuristicMain = 1
      Exit Function
   Else
      validateFrmJuristicMain = 0
   End If
' End If 'if subcateogory code = 36 or 53 or 54
   
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
              validateFrmJuristicMain = 1
              Exit Function
           Else
              validateFrmJuristicMain = 0
           End If
       End If
         
       If Len(RTrim(tExpiryDate)) <> 0 Then
          If Not validDate(tExpiryDate) Then
             MsgBox errInvalidDate(UserLang)
             cmbAppExpiryDate.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       End If
    End If
                              
    If Len(RTrim(tExpiryDate)) <> 0 Then
       If tExpiryDate < tIssueDate Then
          MsgBox errGreaterExpiryYear(UserLang)
          txtAppExpiryYear.SetFocus
          validateFrmJuristicMain = 1
          Exit Function
       Else
          validateFrmJuristicMain = 0
       End If
           
       If optAppDateHijri = True Then
          If tExpiryDate < currentHijriDate Then
             MsgBox errExpiryDateLessThanToday(UserLang)
             txtAppExpiryYear.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       Else
          If tExpiryDate < currentGregDate Then
             MsgBox errExpiryDateLessThanToday(UserLang)
             txtAppExpiryYear.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
      End If
   End If
 End If 'if len(txtapproverno) > 0
    
 If subCategoryCode = "36" Then
    If Len(RTrim(txtGovtShareholding)) = 0 Then
       MsgBox errSpaceShareHolding(UserLang)
       txtGovtShareholding.SetFocus
       validateFrmJuristicMain = 1
       Exit Function
    Else
       validateFrmJuristicMain = 0
    End If
      
    If Len(RTrim(txtSaudiShareholding)) = 0 Then
       MsgBox errSpaceShareHolding(UserLang)
       txtSaudiShareholding.SetFocus
       validateFrmJuristicMain = 1
       Exit Function
    Else
       validateFrmJuristicMain = 0
    End If
      
    If Len(RTrim(txtForeignShareholding)) = 0 Then
       MsgBox errSpaceShareHolding(UserLang)
       txtForeignShareholding.SetFocus
       validateFrmJuristicMain = 1
       Exit Function
    Else
       validateFrmJuristicMain = 0
    End If
        
    If Val(txtGovtShareholding) + Val(txtSaudiShareholding) + Val(txtForeignShareholding) <> 100 Then
       MsgBox errTotalPercNot100(UserLang)
       txtGovtShareholding.SetFocus
       validateFrmJuristicMain = 1
       Exit Function
    Else
       validateFrmJuristicMain = 0
    End If
 End If ' subcategorycode = "36"
     
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
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
           
          If Len(RTrim(txtArabShortName)) = 0 Then
             MsgBox errSpaceShortName(UserLang)
             txtArabShortName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       Else
          If Len(RTrim(txtEngFirstName)) = 0 And _
             Len(RTrim(txtEnglish2ndName)) = 0 Then
             MsgBox errSpaceNames(UserLang)
             txtEngFirstName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
           
          If Len(RTrim(txtEngShortName)) = 0 Then
             MsgBox errSpaceShortName(UserLang)
             txtEngShortName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       End If
       If Len(RTrim(txtArabFirstName)) > 0 Then
          If englishCharFound(txtArabFirstName) = True Then
             MsgBox errNoEnglishCharacters(UserLang)
             txtArabFirstName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       End If
       
       If Len(RTrim(txtArab2ndName)) > 0 Then
          If englishCharFound(txtArab2ndName) = True Then
             MsgBox errNoEnglishCharacters(UserLang)
             txtArab2ndName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       End If
       
       If Len(RTrim(txtArabShortName)) > 0 Then
          If englishCharFound(txtArabShortName) = True Then
             MsgBox errNoEnglishCharacters(UserLang)
             txtArabShortName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       End If
    
       If Len(RTrim(txtEngFirstName)) > 0 Then
          If arabicCharFound(txtEngFirstName) = True Then
             MsgBox errNoArabicCharacters(UserLang)
             txtEngFirstName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       End If
       
       If Len(RTrim(txtEnglish2ndName)) > 0 Then
          If arabicCharFound(txtEnglish2ndName) = True Then
             MsgBox errNoArabicCharacters(UserLang)
             txtEnglish2ndName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       End If
       
       If Len(RTrim(txtEngShortName)) > 0 Then
          If arabicCharFound(txtEngShortName) = True Then
             MsgBox errNoArabicCharacters(UserLang)
             txtEngShortName.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
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
      validateFrmJuristicMain = 1
      Exit Function
   Else
      validateFrmJuristicMain = 0
   End If
   
   If Len(RTrim(cmbNationality.text)) = 0 Then
      MsgBox errSpaceNationality(UserLang)
      cmbNationality.SetFocus
      validateFrmJuristicMain = 1
      Exit Function
   Else
      validateFrmJuristicMain = 0
   End If
      
   If subCategoryCode <> "53" And subCategoryCode <> "54" And _
      subCategoryCode <> "67" And subCategoryCode <> "68" Then
      If Len(RTrim(cmbDoeDate.text)) = 0 Or _
         Len(RTrim(cmbDoeMonth.text)) = 0 Or _
         Len(RTrim(txtDoeYear.text)) = 0 Then
         MsgBox errSpaceDoe(UserLang)
         cmbDoeDate.SetFocus
         validateFrmJuristicMain = 1
         Exit Function
      Else
         validateFrmJuristicMain = 0
      End If
  End If ' if subcategorycode <> 53 and 54
  
  
  tDoe = CStr(txtDoeYear) & _
         CStr(cmbDoeMonth.text) & _
         CStr(cmbDoeDate.text)
         
  If Len(Trim(tDoe)) > 0 Then
     If optDOEGreg.Value = True Then
        If Not validDate(tDoe) Then
           MsgBox errInvalidDate(UserLang)
           cmbDoeDate.SetFocus
           validateFrmJuristicMain = 1
           Exit Function
        Else
           validateFrmJuristicMain = 0
        End If
     End If
     If optDOEHijri = True Then
        If tDoe > currentHijriDate Then
           MsgBox errDoeGreaterThanToday(UserLang) '"Date of esta cannot be greater than today "
           txtDoeYear.SetFocus
           validateFrmJuristicMain = 1
           Exit Function
        Else
           validateFrmJuristicMain = 0
        End If
     Else
        If tDob > currentGregDate Then
           MsgBox errDoeGreaterThanToday(UserLang) '"Date of esta cannot be greater than today "
           txtDoeYear.SetFocus
           validateFrmJuristicMain = 1
           Exit Function
        Else
           validateFrmJuristicMain = 0
        End If
     End If
  End If
      
  If Len(RTrim(cmbBusinessType.text)) = 0 Then
     MsgBox errSpaceBusType(UserLang)
     cmbBusinessType.SetFocus
     validateFrmJuristicMain = 1
     Exit Function
  Else
     validateFrmJuristicMain = 0
  End If
  If optPoBox = True Then
     If Len(RTrim(txtAddress1)) = 0 Or _
        Len(RTrim(txtPOBox)) = 0 Or _
        Len(RTrim(txtPinCode)) = 0 Or _
        Len(RTrim(cmbCity.text)) = 0 Then
         
        MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
        txtAddress1.SetFocus
        validateFrmJuristicMain = 1
        Exit Function
     Else
        validateFrmJuristicMain = 0
     End If
     If Trim(txtPOBox) = "0" Or _
        Trim(txtPinCode) = "0" Then
        MsgBox errPoOrZipCannotBeZero(UserLang)
        txtPOBox.SetFocus
        validateFrmJuristicMain = 1
        Exit Function
     Else
        validateFrmJuristicMain = 0
     End If
  Else
     If Len(RTrim(txtSaudiPostGPSNo)) = 0 Or _
        Len(RTrim(txtSaudiPostStreetName)) = 0 Or _
        Len(RTrim(txtSaudiPostUnit)) = 0 Or _
        Len(RTrim(cmbCity.text)) = 0 Or _
        Len(RTrim(txtSaudiPostZipCode)) = 0 Or _
        Len(RTrim(txtSaudiPostAdditionalNo)) = 0 Then
        MsgBox errSpaceSaudiAddress(UserLang) '"Saudi Postal address should be entered.. Please enter"
        txtSaudiPostGPSNo.SetFocus
        validateFrmJuristicMain = 1
        Exit Function
      Else
        validateFrmJuristicMain = 0
      End If
  End If
  
  If optLangArabic.Value = True Then
     If optPoBox = True Then
        If Len(RTrim(txtAddress1)) <> 0 Then
           If englishCharFound(txtAddress1) Then
              MsgBox errNoEnglishAddress(UserLang)
              txtAddress1.SetFocus
              validateFrmJuristicMain = 1
              Exit Function
           Else
              validateFrmJuristicMain = 0
           End If
        End If
        If Len(RTrim(txtAddress2)) <> 0 Then
           If englishCharFound(txtAddress2) Then
              MsgBox errNoEnglishAddress(UserLang)
              txtAddress2.SetFocus
              validateFrmJuristicMain = 1
              Exit Function
           Else
              validateFrmJuristicMain = 0
           End If
        End If
    Else ' saudi post address
        If Len(RTrim(txtSaudiPostStreetName)) <> 0 Then
           If englishCharFound(txtSaudiPostStreetName) Then
              MsgBox errNoEnglishAddress(UserLang)
              txtSaudiPostStreetName.SetFocus
              validateFrmJuristicMain = 1
              Exit Function
           Else
              validateFrmJuristicMain = 0
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
          validateFrmJuristicMain = 1
          Exit Function
       End If
    End If
 Else    ' if the language is english
    If optPoBox = True Then
       If Len(RTrim(txtAddress1)) <> 0 Then
          If arabicCharFound(txtAddress1) Then
             MsgBox errNoArabicAddress(UserLang)
             txtAddress1.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
          Else
             validateFrmJuristicMain = 0
          End If
       End If
       
       If Len(RTrim(txtAddress2)) <> 0 Then
          If arabicCharFound(txtAddress2) Then
             MsgBox errNoArabicAddress(UserLang)
             txtAddress2.SetFocus
             validateFrmJuristicMain = 1
             Exit Function
           Else
             validateFrmJuristicMain = 0
           End If
        End If
    Else ' saudi post address
        If Len(RTrim(txtSaudiPostStreetName)) <> 0 Then
           If arabicCharFound(txtSaudiPostStreetName) Then
              MsgBox errNoArabicAddress(UserLang)
              txtSaudiPostStreetName.SetFocus
              validateFrmJuristicMain = 1
              Exit Function
           Else
              validateFrmJuristicMain = 0
           End If
        End If
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
          validateFrmJuristicMain = 1
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
   validateFrmJuristicMain = 1
   Exit Function
Else
   validateFrmJuristicMain = 0
End If
   
End Function

Private Sub txtSamaAuthIssueYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbSamaAuthIssueDate)) > 0 And Len(RTrim(cmbSamaAuthIssueMonth)) > 0 Then
          If Len(RTrim(txtSamaAuthIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtSamaAuthIssueYear.text = ""
             txtSamaAuthIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtSamaAuthIssueYear)) <> 0 Then
          If optSamaAuthDateHijri.Value = True Then
             If txtSamaAuthIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtSamaAuthIssueYear.Enabled = True Then
                   txtSamaAuthIssueYear.text = ""
                   txtSamaAuthIssueYear.SetFocus
                Else
                   'framecrInfo.Enabled = True
                   txtSamaAuthIssueYear.Enabled = True
                   txtSamaAuthIssueYear.text = ""
                   txtSamaAuthIssueYear.SetFocus
                End If
             End If
          Else
             If txtSamaAuthIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtSamaAuthIssueYear.Enabled = True Then
                   txtSamaAuthIssueYear.text = ""
                   txtSamaAuthIssueYear.SetFocus
                Else
                   txtSamaAuthIssueYear.Enabled = True
                   txtSamaAuthIssueYear.text = ""
                   txtSamaAuthIssueYear.SetFocus
                End If
             End If
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

Private Sub txtSaudiShareholding_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If

End Sub
