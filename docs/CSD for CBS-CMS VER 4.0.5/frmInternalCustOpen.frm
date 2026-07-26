VERSION 5.00
Begin VB.Form frmInternalCustOpen 
   BackColor       =   &H00BFD87E&
   Caption         =   "Internal  Customer Open Details"
   ClientHeight    =   8760
   ClientLeft      =   930
   ClientTop       =   315
   ClientWidth     =   12030
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8760
   ScaleWidth      =   12030
   WindowState     =   2  'Maximized
   Begin VB.Frame frameDobDateType 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1080
      TabIndex        =   114
      Top             =   3120
      Width           =   1710
      Begin VB.OptionButton optDOBHijri 
         BackColor       =   &H00BFD87E&
         Caption         =   "Hijri"
         Height          =   255
         Left            =   60
         TabIndex        =   28
         Tag             =   "1710"
         ToolTipText     =   "Hijri"
         Top             =   150
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optDOBGreg 
         BackColor       =   &H00BFD87E&
         Caption         =   "Gregorian"
         Height          =   195
         Left            =   645
         TabIndex        =   29
         Tag             =   "1710"
         ToolTipText     =   "Gregorian"
         Top             =   180
         Width           =   1035
      End
   End
   Begin VB.TextBox txtDobYear 
      Height          =   285
      Left            =   5265
      MaxLength       =   4
      TabIndex        =   32
      Top             =   3240
      Width           =   495
   End
   Begin VB.ComboBox cmbDobMonth 
      Height          =   315
      Left            =   4680
      TabIndex        =   31
      Text            =   "01"
      Top             =   3240
      Width           =   615
   End
   Begin VB.ComboBox cmbDobDate 
      Height          =   315
      Left            =   4080
      TabIndex        =   30
      Text            =   "01"
      Top             =   3240
      Width           =   615
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   120
      TabIndex        =   107
      Top             =   3720
      Width           =   11775
      Begin VB.TextBox txtSaudiPostStreetName 
         Height          =   285
         Left            =   3840
         MaxLength       =   24
         TabIndex        =   40
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   3255
      End
      Begin VB.TextBox txtSaudiPostUnit 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostZipCode 
         Height          =   285
         Left            =   5880
         MaxLength       =   5
         TabIndex        =   45
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostGPSNo 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtSaudiPostAdditionalNo 
         Height          =   285
         Left            =   7080
         MaxLength       =   4
         TabIndex        =   47
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
         TabIndex        =   116
         Tag             =   "11775"
         Top             =   -120
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
            TabIndex        =   37
            Tag             =   "2670"
            ToolTipText     =   "Saudi Post"
            Top             =   180
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
            TabIndex        =   36
            Tag             =   "2670"
            ToolTipText     =   "PO Box"
            Top             =   150
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   1185
         MaxLength       =   30
         TabIndex        =   39
         Tag             =   "11775"
         Top             =   360
         Width           =   3015
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   4425
         MaxLength       =   30
         TabIndex        =   41
         Tag             =   "11775"
         Top             =   360
         Width           =   3015
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
         TabIndex        =   42
         Tag             =   "11775"
         Top             =   720
         Width           =   975
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2880
         TabIndex        =   44
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   720
         Width           =   2055
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6240
         MaxLength       =   10
         TabIndex        =   46
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8310
         TabIndex        =   48
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   720
         Width           =   2145
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
         TabIndex        =   122
         Tag             =   "11775"
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
         Left            =   2160
         TabIndex        =   121
         Tag             =   "11775"
         Top             =   360
         Width           =   1695
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
         TabIndex        =   120
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
         TabIndex        =   119
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
         TabIndex        =   118
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
         TabIndex        =   117
         Tag             =   "11775"
         Top             =   0
         Width           =   1335
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
         TabIndex        =   111
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
         Left            =   2265
         TabIndex        =   110
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
         Left            =   5025
         TabIndex        =   109
         Tag             =   "11775"
         Top             =   720
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
         Left            =   7485
         TabIndex        =   108
         Tag             =   "11775"
         Top             =   720
         Width           =   735
      End
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor comments"
      Height          =   405
      Left            =   3360
      TabIndex        =   105
      ToolTipText     =   "Supervisor Comments"
      Top             =   6270
      Width           =   2175
   End
   Begin VB.Frame frameOpenUpdateDetails 
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
      Left            =   75
      TabIndex        =   82
      Top             =   5085
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
         TabIndex        =   94
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
         TabIndex        =   93
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
         TabIndex        =   92
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
         TabIndex        =   91
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
         TabIndex        =   90
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
         TabIndex        =   89
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
         TabIndex        =   88
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
         TabIndex        =   87
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
         TabIndex        =   86
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
         TabIndex        =   85
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
         TabIndex        =   84
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
         TabIndex        =   83
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
         TabIndex        =   104
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
         TabIndex        =   103
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
         TabIndex        =   102
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
         TabIndex        =   101
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
         TabIndex        =   100
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
         TabIndex        =   99
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
         TabIndex        =   98
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
         TabIndex        =   97
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
         TabIndex        =   96
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
         TabIndex        =   95
         Tag             =   "11820"
         Top             =   600
         Width           =   1170
      End
      Begin VB.Line Line5 
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
   Begin VB.CommandButton cmdReject 
      Caption         =   "&Reject"
      Height          =   405
      Left            =   8190
      TabIndex        =   51
      ToolTipText     =   "Reject"
      Top             =   6255
      Width           =   1305
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "&Approve"
      Height          =   405
      Left            =   6885
      TabIndex        =   50
      ToolTipText     =   "Approve"
      Top             =   6255
      Width           =   1305
   End
   Begin VB.ComboBox cmbNationality 
      Height          =   315
      Left            =   4620
      TabIndex        =   16
      Text            =   "cmbNationality"
      Top             =   1620
      Width           =   2775
   End
   Begin VB.Frame frameCustomerName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   45
      TabIndex        =   72
      Top             =   2160
      Width           =   11775
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5055
         MaxLength       =   15
         TabIndex        =   25
         Tag             =   "11775"
         Top             =   600
         Width           =   1575
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   20
         Tag             =   "11775"
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8655
         MaxLength       =   30
         TabIndex        =   27
         Tag             =   "11775"
         Top             =   600
         Width           =   3015
      End
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   26
         Tag             =   "11775"
         Top             =   600
         Width           =   1695
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3150
         MaxLength       =   15
         TabIndex        =   24
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   23
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   22
         Tag             =   "11775"
         Top             =   240
         Width           =   3015
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   21
         Tag             =   "11775"
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   19
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
      End
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   18
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
         Left            =   5025
         TabIndex        =   79
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
         TabIndex        =   78
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
         TabIndex        =   77
         Tag             =   "11775"
         Top             =   600
         Width           =   1335
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
         TabIndex        =   76
         Tag             =   "11775"
         Top             =   240
         Width           =   1455
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
         TabIndex        =   75
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
         TabIndex        =   74
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
         TabIndex        =   73
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
   End
   Begin VB.ComboBox cmbBranchCode 
      Enabled         =   0   'False
      Height          =   315
      Left            =   4005
      TabIndex        =   1
      Top             =   165
      Width           =   1710
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   405
      Left            =   9495
      TabIndex        =   52
      ToolTipText     =   "Cancel"
      Top             =   6255
      Width           =   1305
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "&Create"
      Height          =   405
      Left            =   5550
      TabIndex        =   49
      ToolTipText     =   "Create"
      Top             =   6270
      Width           =   1305
   End
   Begin VB.ComboBox cmbTitle 
      Height          =   315
      Left            =   8520
      TabIndex        =   17
      Text            =   "cmbTitle"
      Top             =   1605
      Width           =   2985
   End
   Begin VB.ComboBox cmbBusinessType 
      Height          =   315
      Left            =   9960
      TabIndex        =   35
      Text            =   "cmbBusinessType"
      Top             =   3300
      Width           =   1800
   End
   Begin VB.Frame frameSex 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   6540
      TabIndex        =   67
      Top             =   3180
      Width           =   2055
      Begin VB.OptionButton optGenderFemale 
         BackColor       =   &H00BFD87E&
         Caption         =   "Female"
         Height          =   255
         Left            =   960
         TabIndex        =   34
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
         TabIndex        =   33
         Tag             =   "2055"
         ToolTipText     =   "Male"
         Top             =   180
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.Frame frameIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   840
      Left            =   75
      TabIndex        =   60
      Top             =   645
      Width           =   11775
      Begin VB.ComboBox cmbIdType 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.TextBox txtIdExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8880
         MaxLength       =   4
         TabIndex        =   13
         Tag             =   "11775"
         Top             =   420
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8280
         TabIndex        =   12
         Tag             =   "11775"
         Text            =   "01"
         Top             =   420
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7680
         TabIndex        =   11
         Tag             =   "11775"
         Text            =   "01"
         Top             =   420
         Width           =   615
      End
      Begin VB.TextBox txtIdIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   5775
         MaxLength       =   4
         TabIndex        =   10
         Tag             =   "11775"
         Top             =   405
         Width           =   570
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5175
         TabIndex        =   9
         Tag             =   "11775"
         Text            =   "01"
         Top             =   420
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4560
         TabIndex        =   8
         Tag             =   "11775"
         Text            =   "01"
         Top             =   420
         Width           =   615
      End
      Begin VB.Frame frameIdDateType 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1200
         TabIndex        =   61
         Tag             =   "11775"
         Top             =   300
         Width           =   1935
         Begin VB.OptionButton optIdDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   6
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.OptionButton optIdDateGregorian 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   255
            Left            =   840
            TabIndex        =   7
            TabStop         =   0   'False
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   1080
         End
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   7680
         TabIndex        =   5
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   45
         Width           =   1815
      End
      Begin VB.TextBox txtIdNo 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   4545
         MaxLength       =   15
         TabIndex        =   4
         Tag             =   "11775"
         Top             =   60
         Width           =   1800
      End
      Begin VB.Label lblIdType 
         BackColor       =   &H00BFD87E&
         Caption         =   "ID Type"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   81
         Tag             =   "11775"
         Top             =   45
         Width           =   1020
      End
      Begin VB.Label lblIdDateType 
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
         Left            =   0
         TabIndex        =   66
         Tag             =   "11775"
         Top             =   450
         Width           =   1335
      End
      Begin VB.Label lblIdIssuedAt 
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
         Left            =   6540
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   75
         Width           =   1095
      End
      Begin VB.Label lblIdExpiryDate 
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
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   420
         Width           =   1095
      End
      Begin VB.Label lblIdIssueDate 
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
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   420
         Width           =   1215
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
         Left            =   3255
         TabIndex        =   62
         Tag             =   "11775"
         Top             =   60
         Width           =   1215
      End
   End
   Begin VB.TextBox Terms 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   465
      Left            =   120
      TabIndex        =   59
      Text            =   "Terms and Conditions Here "
      Top             =   12435
      Width           =   12180
   End
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1230
      TabIndex        =   54
      Top             =   1500
      Width           =   1935
      Begin VB.OptionButton optLangEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "English"
         Height          =   255
         Left            =   960
         TabIndex        =   15
         TabStop         =   0   'False
         Tag             =   "1935"
         ToolTipText     =   "English"
         Top             =   150
         Width           =   855
      End
      Begin VB.OptionButton optLangArabic 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Tag             =   "1935"
         ToolTipText     =   "Arabic"
         Top             =   150
         Value           =   -1  'True
         Width           =   855
      End
   End
   Begin VB.ComboBox cmbAltBrCode 
      Height          =   315
      Left            =   7800
      TabIndex        =   2
      Top             =   165
      Width           =   1815
   End
   Begin VB.TextBox txtCustomerNo 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   1890
      MaxLength       =   7
      TabIndex        =   0
      Top             =   210
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
      Left            =   10305
      TabIndex        =   53
      Top             =   165
      Width           =   1335
   End
   Begin VB.Label lblDOBDateType 
      BackColor       =   &H00BFD87E&
      Caption         =   "DOB Type"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      Top             =   3240
      Width           =   1095
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
      Left            =   2880
      TabIndex        =   113
      Top             =   3360
      Width           =   1095
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
      TabIndex        =   106
      Top             =   6360
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
      Left            =   3300
      TabIndex        =   80
      Top             =   1665
      Width           =   1215
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   60
      X2              =   11580
      Y1              =   585
      Y2              =   585
   End
   Begin VB.Shape Shape1 
      Height          =   540
      Left            =   75
      Top             =   6165
      Width           =   11685
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   45
      X2              =   11565
      Y1              =   2100
      Y2              =   2100
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
      Left            =   7530
      TabIndex        =   71
      Top             =   1665
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
      Left            =   30
      TabIndex        =   70
      Top             =   1635
      Width           =   1215
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
      TabIndex        =   69
      Top             =   3360
      Width           =   1245
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
      Left            =   5760
      TabIndex        =   68
      Top             =   3330
      Width           =   735
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
      Left            =   5835
      TabIndex        =   58
      Top             =   225
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
      TabIndex        =   57
      Top             =   225
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
      TabIndex        =   56
      Top             =   225
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
      TabIndex        =   55
      Top             =   225
      Width           =   495
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   5040
      Y2              =   5040
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
Attribute VB_Name = "frmInternalCustOpen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
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
         If Len(RTrim(cmbBranchcode.text)) <> 0 Then
            tCode = Mid$(cmbBranchcode.text, 1, 4)
            For i = 0 To cmbBranchcode.ListCount
                If Mid$(cmbBranchcode.List(i), 1, 4) = tCode Then
                   cmbBranchcode.ListIndex = i
                   Exit For
                End If
            Next i
         Else
            MsgBox errSpaceBranchCode(UserLang)   '"Branch Code Cannot be spaces.. Please enter.."
            cmbBranchcode.SetFocus
            Cancel = True
            Exit Sub
         End If
             
         If i > cmbBranchcode.ListCount Then
            MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
            cmbBranchcode.SetFocus
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

Private Sub cmbIdExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdExpiryDate.text)) <> 0 Then
         If Len(cmbIdExpiryDate) = 2 Then
            If cmbIdExpiryDate < 1 Or _
               cmbIdExpiryDate > IIf(optIdDateGregorian.Value = True, 31, 30) Then
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

Private Sub cmbIdExpiryDate_Click()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdExpiryDate.text)) <> 0 Then
         If Len(cmbIdExpiryDate) = 2 Then
            cmbIdExpiryMonth.SetFocus
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

Private Sub cmbIdExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIdIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdIssueDate.text)) <> 0 Then
         If Len(cmbIdIssueDate.text) = 2 Then
            If cmbIdIssueDate < 1 Or _
               cmbIdIssueDate > IIf(optIdDateGregorian.Value = True, 31, 30) Then
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

Private Sub cmbIdIssueMonth_KeyPress(KeyAscii As Integer)
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
                cmbNationality.ListIndex = i  ' RTrim(cmbNationality.List(i))
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

Private Sub cmbTitle_Click()
  If Mid$(cmbTitle.text, 1, 2) = "02" Or _
     Mid$(cmbTitle.text, 1, 2) = "03" Or _
     Mid$(cmbTitle.text, 1, 2) = "06" Then  ' MISYS
     optGenderFemale.Value = True
  Else
     optGenderMale.Value = True
  End If
End Sub

Private Sub cmbTitle_LostFocus()
Dim i As Integer
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

Private Sub cmdApprove_Click()
   Dim tuserId As String, tSupervisorId As String, tDateTime As String, tBranchCode As String, tPrimaryAcc As String
   Dim mQry As String
   Dim tmpStr As String
   Dim strmsglen As String

   frmSupervisorApproval.MSFlexGrid1.Col = 0
   tuserId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
   frmSupervisorApproval.MSFlexGrid1.Col = 1
   tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
   tBranchCode = gBranchCode
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   tpinUserId = tuserId  ' used for tpin approval
   tpinDateTime = tDateTime   ' used for tpin approval
   tpinSupervisorId = tSupervisorId    ' used for tpin approval
   
   tPrimaryAcc = Space(5)
     
   SendMsg = "000268" & "19" & gBranchCode & "A" & tBranchCode & tuserId & tDateTime & _
             tSupervisorId & Space(200) & recvQuickCustMsg.newOrUpdate & tPrimaryAcc & txtCustomerNo & "7" 'screen set no = 7
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   
   frmInternalCustOpen.MousePointer = vbHourglass
   frmInternalCustOpen.cmdApprove.Enabled = False
   frmInternalCustOpen.cmdReject.Enabled = False
   frmInternalCustOpen.cmdCancel.Enabled = False
   
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmInternalCustOpen.MousePointer = vbDefault
      frmInternalCustOpen.cmdApprove.Enabled = True
      frmInternalCustOpen.cmdReject.Enabled = True
      frmInternalCustOpen.cmdCancel.Enabled = True
      unloadSupForms
      Exit Sub
   End If

   If recvSuperDecisionMsg.status = "000" Then
      frmInternalCustOpen.MousePointer = vbDefault
      MsgBox errSuccessful(UserLang) '"transaction successfully completed..."
      If recvQuickCustMsg.newOrUpdate = "N" Then
         If UserLang = ARABIC Then
            tmpStr = "ÑÞã ÇáÚãíá" & recvSuperDecisionMsg.custNo
         Else
            tmpStr = "Customer Number Alloted is " & recvSuperDecisionMsg.custNo
         End If
         MsgBox tmpStr
      End If
      
      If realOrPseudo = "1" Then
         updateBranchPower
      Else
         unloadSupForms
      End If
   Else
      If UserLang = ARABIC Then
         MsgBox recvSuperDecisionMsg.aRemarks
      Else
         MsgBox recvSuperDecisionMsg.eRemarks
      End If
      frmInternalCustOpen.MousePointer = vbDefault
      unloadSupForms
      Exit Sub
   End If
End Sub
   
Public Function updateBranchPower()

   frmInternalCustOpen.MousePointer = vbHourglass
   frmInternalCustOpen.txtCustomerNo = recvSuperDecisionMsg.custNo
   formatNewInternalCustomerRequest
   
   'now form the customer buffer to insert into BranchPower
   If openCustFile = 1 Then
      frmInternalCustOpen.MousePointer = vbDefault
      frmInternalCustOpen.cmdApprove.Enabled = True
      frmInternalCustOpen.cmdReject.Enabled = True
      frmInternalCustOpen.cmdCancel.Enabled = True
      unloadSupForms
      updateBranchPower = 1
      Exit Function
   End If
   
   If recvQuickCustMsg.newOrUpdate = "U" Then
      If readClient = 1 Then
         frmInternalCustOpen.MousePointer = vbDefault
         frmInternalCustOpen.cmdApprove.Enabled = True
         frmInternalCustOpen.cmdReject.Enabled = True
         frmInternalCustOpen.cmdCancel.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   CustBuf.recType = "02"
   CustBuf.clientNo = Format(recvSuperDecisionMsg.custNo, "!@@@@@@@@@")
   If recvQuickCustMsg.newOrUpdate = "N" Then
      If quickCustInfo.langPref = "0" Then
         If branchPowerEnv = "DOS" Then
            CustBuf.shortName1 = windowToAsmo(quickCustInfo.aShortName)
            CustBuf.alphacode = windowToAsmo(Format(Mid$(quickCustInfo.aLastName, 1, 3) + Mid$(quickCustInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
         Else
            CustBuf.shortName1 = quickCustInfo.aShortName
            CustBuf.alphacode = Format(Mid$(quickCustInfo.aLastName, 1, 3) + Mid$(quickCustInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "0"
      Else
         If branchPowerEnv = "DOS" Then
            CustBuf.shortName1 = windowToAsmo(quickCustInfo.eShortName)
            CustBuf.alphacode = windowToAsmo(Format(Mid$(quickCustInfo.eLastName, 1, 3) + Mid$(custInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
         Else
            CustBuf.shortName1 = quickCustInfo.eShortName
            CustBuf.alphacode = Format(Mid$(quickCustInfo.eLastName, 1, 3) + Mid$(quickCustInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "1"
      End If
      CustBuf.address1 = Space(30)
      CustBuf.address2 = Space(30)
      CustBuf.address3 = Space(30)
   Else
      If recvSuperDecisionMsg.nameChanged = "1" Then
         If quickCustInfo.langPref = "0" Then
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(quickCustInfo.aShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(quickCustInfo.aLastName, 1, 3) + Mid$(quickCustInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = quickCustInfo.aShortName
               CustBuf.alphacode = Format(Mid$(quickCustInfo.aLastName, 1, 3) + Mid$(quickCustInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "0"
         Else
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(quickCustInfo.eShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(quickCustInfo.eLastName, 1, 3) + Mid$(quickCustInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = quickCustInfo.eShortName
               CustBuf.alphacode = Format(Mid$(quickCustInfo.eLastName, 1, 3) + Mid$(quickCustInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "1"
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
   
   If recvQuickCustMsg.newOrUpdate = "N" Then
      If insertClient = 1 Then
         frmInternalCustOpen.MousePointer = vbDefault
         frmInternalCustOpen.cmdApprove.Enabled = True
         frmInternalCustOpen.cmdReject.Enabled = True
         frmInternalCustOpen.cmdCancel.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   Else
      If updateClient = 1 Then
         frmInternalCustOpen.MousePointer = vbDefault
         frmInternalCustOpen.cmdApprove.Enabled = True
         frmInternalCustOpen.cmdReject.Enabled = True
         frmInternalCustOpen.cmdCancel.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   closeClient
   updateBranchPower = 0
   
   frmInternalCustOpen.MousePointer = vbDefault
   frmInternalCustOpen.cmdApprove.Enabled = True
   frmInternalCustOpen.cmdReject.Enabled = True
   frmInternalCustOpen.cmdCancel.Enabled = True
   unloadSupForms
   
End Function
Private Sub cmdCancel_Click()
    Unload Me
    Unload frmCustUpdateHistory
    Unload frmSupervisorApproval
End Sub

Private Sub cmdCardInfo_Click()
    Dim retStr As String
    If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
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

Private Sub cmdCreate_Click()
    Dim newOrUpdate As String, custName As String
    Dim tIdType As String, tIdNo As String, tCustNo As String
    Dim strmsglen As String, tmpStr As String
    Dim retStatus
    Dim i As Integer
    
    If validateFrmInternalCustOpen = 1 Then
       Exit Sub
    End If
    
    If updateAction Or (tellerAction And recvQuickCustMsg.newOrUpdate = "U") Then
        newOrUpdate = "U"
        tCustNo = Format(txtCustomerNo, "!@@@@@@@")
     Else
        newOrUpdate = "N"
        tCustNo = Space(7)
     End If
     tIdType = Space(1)
     tIdNo = Space(15)
      
     tIdType = Mid$(cmbIdType, 1, 1)
     
     If Len(RTrim(txtIdNo)) > 0 Then
        tIdNo = Format(txtIdNo, "!@@@@@@@@@@@@@@@")
     End If
     
     If optLangArabic = True Then
        custName = txtArabFirstName & " " & txtArabic2ndName & " " & _
                   txtArabic3rdName & " " & txtArabLastName
     Else
        custName = txtEngFirstName & " " & txtEnglish2ndName & " " & _
                   txtEnglish3rdName & " " & txtEngLastName
     End If
     
'     If frmInternalCustOpen.tag <> "I" Then ' opening of internal customer;
'                                       ' so, it does not require any validations
'        If checkCustomerExistance(tIdType, tIdNo, newOrUpdate, tCustNo, custName) = 1 Then
'           Exit Sub
'        End If
'     End If
      
    If Len(RTrim(gDateTime)) = 0 Then
       gDateTime = getUnixDateTime
       If Trim(gDateTime) = "ERROR" Then
          gDateTime = Space(14)
          Exit Sub
       End If
    End If
    
    formatNewInternalCustomerRequest
    
    SendMsg = quickCustInfo.msgLen & quickCustInfo.service & gBranchCode & _
              quickCustInfo.userId & quickCustInfo.branchCode & quickCustInfo.dateTime & _
              quickCustInfo.creationOrUpdate & quickCustInfo.NewOrUpdateFlag & _
              quickCustInfo.bmUpdateStatus & quickCustInfo.customerNo & quickCustInfo.supervisorId & _
              quickCustInfo.custBranchCode & quickCustInfo.samaMainCategory & quickCustInfo.samaSubCategory & _
              quickCustInfo.screenSetNo & quickCustInfo.idNo & quickCustInfo.idType & _
              quickCustInfo.idIssuedAt & quickCustInfo.idDateType & _
              quickCustInfo.idIssueDateH & quickCustInfo.idIssueDateG & _
              quickCustInfo.idExpiryDateH & quickCustInfo.idExpiryDateG & _
              quickCustInfo.langPref & quickCustInfo.nationality & quickCustInfo.titleCode & _
              quickCustInfo.sexCode & quickCustInfo.businessType & _
              quickCustInfo.aFirstName & quickCustInfo.a2ndName & quickCustInfo.a3rdName & _
              quickCustInfo.aLastName & quickCustInfo.aShortName & quickCustInfo.eFirstName & _
              quickCustInfo.e2ndName & quickCustInfo.e3rdName & quickCustInfo.eLastName & _
              quickCustInfo.eShortName & quickCustInfo.altBranchCode & _
              quickCustInfo.address1 & quickCustInfo.address2 & quickCustInfo.poBox & quickCustInfo.cityName & _
              quickCustInfo.zipCode & quickCustInfo.country & currentAccInfo & quickCustInfo.cardType & _
              quickCustInfo.electronIntlRequired & quickCustInfo.electronIntlName & _
              quickCustInfo.supervisorComments & quickCustInfo.dobDateType & quickCustInfo.dobDateH & _
              quickCustInfo.dobDateG & quickCustInfo.addressType & quickCustInfo.internalCustomer & Space(50)
               
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmInternalCustOpen.MousePointer = vbHourglass
    frmInternalCustOpen.cmdCreate.Enabled = False
    frmInternalCustOpen.cmdCancel.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmInternalCustOpen.cmdCreate.Enabled = True
       frmInternalCustOpen.cmdCancel.Enabled = True
       frmInternalCustOpen.MousePointer = vbDefault
       Exit Sub
    End If
    frmInternalCustOpen.MousePointer = vbDefault
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
       frmInternalCustOpen.cmdCancel.Enabled = True
       If quickCustInfo.NewOrUpdateFlag = "N" And quickCustInfo.creationOrUpdate = "C" Then
          gCustNo = recvCustomerMsg.custNo
          txtCustomerNo = recvCustomerMsg.custNo
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
       cmdCreate.Enabled = True
       cmdCancel.Enabled = True
       Exit Sub
    End If
    
    unloadForms

End Sub

Public Sub unloadForms()
   Dim tCustNo As String
   frmInternalCustOpen.MousePointer = vbDefault
   frmInternalCustOpen.cmdCreate.Enabled = True
   frmInternalCustOpen.cmdCancel.Enabled = True
   Unload Me
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


Private Sub cmdSupervisorComments_Click()
    MsgBox recvQuickCustMsg.supervisorComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mainBrCode As String, mainBrArbName As String, mainBrEngName As String
    Dim mQry As String
    Dim i As Integer, num As String, tCode As String
    Dim tListIndex As Integer
    
    If UserLang = ARABIC Then
       ChangePositions frmInternalCustOpen, 11800
       frmInternalCustOpen.RightToLeft = True
       frameOpenUpdateDetails.RightToLeft = True
    End If
    
    txtSysDate.text = Date
    gDateTime = Space(14)   'Date Time to be used for global
    
    frmInternalCustOpen.Caption = frmQuickCustOpenCaption(53, UserLang)
    lblCustNo.Caption = frmIndividualOthers1Caption(4, UserLang)
    lblBranch.Caption = frmIndividualOthers1Caption(5, UserLang)
    lblAltBranchCode.Caption = frmIndividualOthers1Caption(60, UserLang)
    lblSysDate.Caption = frmIndividualOthers1Caption(6, UserLang)
    lblidType.Caption = frmQuickCustOpenCaption(1, UserLang)
    lblIdNumber.Caption = frmQuickCustOpenCaption(2, UserLang)
    lblIdIssuedAt.Caption = frmQuickCustOpenCaption(3, UserLang)
    lblIdDateType.Caption = frmQuickCustOpenCaption(4, UserLang)
    optIdDateHijri.Caption = frmQuickCustOpenCaption(5, UserLang)
    optIdDateGregorian.Caption = frmQuickCustOpenCaption(6, UserLang)
    lblIdIssueDate.Caption = frmQuickCustOpenCaption(7, UserLang)
    lblIdExpiryDate.Caption = frmQuickCustOpenCaption(8, UserLang)
    lblFirstName.Caption = frmQuickCustOpenCaption(9, UserLang)
    lbl2ndName.Caption = frmQuickCustOpenCaption(10, UserLang)
    lbl3rdName.Caption = frmQuickCustOpenCaption(11, UserLang)
    lblLastName.Caption = frmQuickCustOpenCaption(12, UserLang)
    lblShortName.Caption = frmQuickCustOpenCaption(13, UserLang)
    lblArabicName.Caption = frmQuickCustOpenCaption(14, UserLang)
    lblEnglishName.Caption = frmQuickCustOpenCaption(15, UserLang)
    lblLangPref.Caption = frmQuickCustOpenCaption(16, UserLang)
    optLangArabic.Caption = frmQuickCustOpenCaption(17, UserLang)
    optLangEnglish.Caption = frmQuickCustOpenCaption(18, UserLang)
    lblTitleCode.Caption = frmQuickCustOpenCaption(19, UserLang)
    lblGender.Caption = frmQuickCustOpenCaption(20, UserLang)
    optGenderMale.Caption = frmQuickCustOpenCaption(21, UserLang)
    optGenderFemale.Caption = frmQuickCustOpenCaption(22, UserLang)
    lblBusinessType.Caption = frmQuickCustOpenCaption(23, UserLang)
    lblNationality.Caption = frmQuickCustOpenCaption(24, UserLang)
    
    lblAddress1.Caption = frmQuickCustOpenCaption(25, UserLang)
    lblPOBox.Caption = frmQuickCustOpenCaption(26, UserLang)
    lblCity.Caption = frmQuickCustOpenCaption(27, UserLang)
    lblZipCode.Caption = frmQuickCustOpenCaption(28, UserLang)
    lblCountry.Caption = frmQuickCustOpenCaption(29, UserLang)
    
    cmdSupervisorComments.Caption = frmQuickCustOpenCaption(44, UserLang)
    If updateAction Or tellerAction Then
       cmdCreate.Caption = frmQuickCustOpenCaption(54, UserLang)
    Else
       cmdCreate.Caption = frmQuickCustOpenCaption(45, UserLang)
    End If
    cmdApprove.Caption = frmQuickCustOpenCaption(46, UserLang)
    cmdReject.Caption = frmQuickCustOpenCaption(47, UserLang)
    cmdCancel.Caption = frmQuickCustOpenCaption(48, UserLang)
    lblDOBDateType.Caption = frmQuickCustOpenCaption(49, UserLang)
    optDOBHijri.Caption = frmQuickCustOpenCaption(50, UserLang)
    optDOBGreg.Caption = frmQuickCustOpenCaption(51, UserLang)
    lblDateOfBirth.Caption = frmQuickCustOpenCaption(52, UserLang)
    
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
       cmbBranchcode.Clear
       cmbAltBrCode.AddItem "0000-NONE"
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
             cmbAltBrCode.AddItem rs(0) & "-" & rs(2)
             cmbBranchcode.AddItem rs(0) & "-" & rs(2)
           Else
             cmbAltBrCode.AddItem rs(0) & "-" & rs(1)
             cmbBranchcode.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
       cmbAltBrCode.text = "0000-NONE"
    End If
    
    mQry = "select branchcode,arabicname,englishname from branchinfo"
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       cmbBranchcode.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbBranchcode.AddItem rs(0) & "-" & rs(2)
           Else
              cmbBranchcode.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If
    
    For i = 0 To cmbBranchcode.ListCount - 1
        If Mid(cmbBranchcode.List(i), 1, 4) = gBranchCode Then
           cmbBranchcode.ListIndex = i
           Exit For
         End If
    Next i
   
    If i > cmbBranchcode.ListCount Then
       cmbBranchcode.text = gBranchCode & "-" & "Not defined in local"
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
      
    For i = 0 To cmbAltBrCode.ListCount - 1
        If Mid(cmbAltBrCode.List(i), 1, 4) = mainBrCode Then
           cmbAltBrCode.ListIndex = i
           Exit For
         End If
    Next i
   
    If i > cmbAltBrCode.ListCount Then
       cmbAltBrCode.text = "0000-NONE"
    End If
   
   mQry = "select * from idinfo where displayForQuickScreen = '1'"
   Set rs = db.OpenRecordset(mQry)
   tListIndex = 0
   If rs.recordCount > 0 Then
      cmbIdType.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbIdType.AddItem rs("idcode") & "-" & rs("englishname")
         Else
            cmbIdType.AddItem rs("idcode") & "-" & rs("arabicname")
         End If
         If rs("idcode") = "O" Then
            tListIndex = cmbIdType.ListCount
         End If
         rs.MoveNext
      Loop
   End If
   cmbIdType.ListIndex = tListIndex - 1
            
   mQry = "select * from cityinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbIdIssuedAt.Clear
      cmbCity.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbIdIssuedAt.AddItem rs("englishname")
            cmbCity.AddItem rs("englishname")
         Else
            cmbIdIssuedAt.AddItem rs("arabicname")
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
            If UserLang = ENGLISH Then
                cmbIdIssuedAt.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
                cmbCity.text = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
             Else
                cmbIdIssuedAt.text = IIf(rs(1) = "" Or IsNull(rs(1)) = True, "    ", rs(1))
                cmbCity.text = IIf(rs(1) = "" Or IsNull(rs(1)) = True, "    ", rs(1))
             End If
         Else
            cmbIdIssuedAt.ListIndex = -1
            cmbCity.ListIndex = -1
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
    End If
    
    Set rs = db.OpenRecordset("select * from countryinfo")
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbNationality.Clear
        cmbCountry.Clear
        Do While Not rs.EOF
           If UserLang = ARABIC Then
              cmbNationality.AddItem rs("countrycode") & " - " & rs("arabicname")
              cmbCountry.AddItem rs("countrycode") & " - " & rs("arabicname")
            Else
              cmbNationality.AddItem rs("countrycode") & " - " & rs("englishname")
              cmbCountry.AddItem rs("countrycode") & " - " & rs("englishname")
            End If
           rs.MoveNext
        Loop
        cmbNationality.ListIndex = 0
        cmbCountry.ListIndex = 0
    End If
    
    cmbIdExpiryDate.Clear
    cmbIdExpiryMonth.Clear
    cmbIdIssueDate.Clear
    cmbIdIssueMonth.Clear
    cmbDobDate.Clear
    cmbDobMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbIdIssueDate.AddItem num
       cmbIdExpiryDate.AddItem num
       cmbDobDate.AddItem num
       If i < 13 Then
          cmbIdExpiryMonth.AddItem num
          cmbIdIssueMonth.AddItem num
          cmbDobMonth.AddItem num
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
   
   If supervisorAction Or tellerAction Then
       If Len(RTrim(recvQuickCustMsg.supervisorComments)) > 0 Then
          cmdSupervisorComments.Enabled = True
       Else
         cmdSupervisorComments.Enabled = False
       End If
    Else
       cmdSupervisorComments.Enabled = False
    End If


   If supervisorAction Or searchAction Or custHistoryAction Then
      cmdCreate.Enabled = False
      cmbAltBrCode.Enabled = False
      txtCustomerNo.Enabled = False
      cmbBranchcode.Enabled = False
      frameCustomerName.Enabled = False
      frameIdInfo.Enabled = False
      frameLang.Enabled = False
      cmbNationality.Enabled = False
      cmbTitle.Enabled = False
      frameDobDateType.Enabled = False
      cmbDobDate.Enabled = False
      cmbDobMonth.Enabled = False
      txtDobYear.Enabled = False
      cmbBusinessType.Enabled = False
      frameSex.Enabled = False
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
      frameLang.Enabled = True
      cmbNationality.Enabled = True
      frameDobDateType.Enabled = True
      cmbDobDate.Enabled = True
      cmbDobMonth.Enabled = True
      txtDobYear.Enabled = True
      cmbTitle.Enabled = True
      txtCustomerNo.Enabled = False
      frameCustomerContactInfo.Enabled = True
      If Not (updateAction Or (tellerAction And recvQuickCustMsg.newOrUpdate = "U")) Then
         If recvLoginMsg.globalUpdatePriv = "1" Or recvLoginMsg.mainBrEditAllowed = "1" Then   ' Global update privilege
            cmbBranchcode.Enabled = True
         Else
            cmbBranchcode.Enabled = False
         End If
         
         txtCustomerNo.Enabled = True
      End If
      frmInternalCustOpen.tag = "I"
      cmbBranchcode.Enabled = True
      cmbBusinessType.Enabled = True
      frameSex.Enabled = True
   End If
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame13_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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

Private Sub lblDOB_Click()

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
       Mid$(cmbTitle.text, 1, 2) = "03" Or _
       Mid$(cmbTitle.text, 1, 2) = "06" Then
      
       MsgBox errInvalidTitle(UserLang)
       optGenderFemale.Value = True
    End If
 End If

End Sub

Private Sub optIdDateGregorian_Click()
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



Private Sub txtCustomerNo_KeyPress(KeyAscii As Integer)
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

Private Sub txtEngFirstName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
'    If (KeyAscii > 48 And KeyAscii < 57) And KeyAscii <> 8 Then
'        KeyAscii = 0
'        MsgBox (errNumeralsNotAllowed(UserLang))
'        Exit Sub
'    End If
    
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

Private Sub txtIdNo_KeyPress(KeyAscii As Integer)
   If Mid$(cmbIdType.text, 1, 1) = "Q" Or _
      Mid$(cmbIdType.text, 1, 1) = "I" Then
      If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errOnlyNumeralsAllowed(UserLang))
          Exit Sub
      End If
   End If
End Sub

Private Sub txtIdNo_LostFocus()
  
  If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
  Else
    On Error Resume Next
    If Mid$(cmbIdType.text, 1, 1) = "I" Or _
       Mid$(cmbIdType.text, 1, 1) = "Q" Then
       If Len(Trim(txtIdNo)) <> 10 Then
          MsgBox errInvalidId(UserLang)
          txtIdNo.SetFocus
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
       On Error Resume Next
       If Len(RTrim(cmbIdIssueDate)) > 0 And Len(RTrim(cmbIdIssueMonth)) > 0 Then
          If Len(RTrim(txtIdIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtIdIssueYear = ""
             txtIdIssueYear.SetFocus
             Exit Sub
          End If
       End If
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

Public Function validateFrmInternalCustOpen() As Integer
     Dim tIssueDate As String
     Dim tExpiryDate As String
     Dim tCode As String
     Dim tmpCode As String
     Dim mQry As String, tDob As String
     Dim i As Integer
     
     validateFrmInternalCustOpen = 0
     
     If Not (updateAction Or (tellerAction And recvQuickCustMsg.newOrUpdate = "U")) Then
        If Len(RTrim(txtCustomerNo)) = 0 Then
           MsgBox errSpaceCustomerNo(UserLang)
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
'        If Len(RTrim(txtCustomerNo)) < 6 Then
'           MsgBox errInvalidCustNo(UserLang)
'           validateFrmInternalCustOpen = 1
'           Exit Function
'        Else
'           validateFrmInternalCustOpen = 0
'        End If
       
        For i = 1 To Len(Trim(txtCustomerNo))
           If Mid$(txtCustomerNo, i, 1) >= "0" And Mid$(txtCustomerNo, 1, 1) <= "9" Then
              validateFrmInternalCustOpen = 0
           Else
              MsgBox errInvalidCustNo(UserLang)
              validateFrmInternalCustOpen = 1
              Exit Function
           End If
        Next
    End If
     
     If Len(RTrim(Mid$(cmbBranchcode, 1, 4))) = 0 Then
        MsgBox errSpaceBranchCode(UserLang)
        validateFrmInternalCustOpen = 1
        Exit Function
     Else
        validateFrmInternalCustOpen = 0
     End If
     
     mQry = "select realorpseudo from branchinfo where branchcode = '" & Mid$(cmbBranchcode, 1, 4) & "'"
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
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
     End If
             
     For i = 0 To cmbAltBrCode.ListCount - 1
         If Mid$(cmbAltBrCode.List(i), 1, 4) = tCode Then
            cmbAltBrCode.ListIndex = i
            Exit For
         End If
     Next i
     
     If i > cmbAltBrCode.ListCount Then
         MsgBox errInvalidAltBrCode(UserLang) '"Alternative Branch Code should be a real branch...Please re-enter.."
         cmbAltBrCode.SetFocus
         validateFrmInternalCustOpen = 1
         Exit Function
     Else
         validateFrmInternalCustOpen = 0
     End If
          
'     If Len(RTrim(cmbIdType.text)) = 0 Then
'        MsgBox errSpaceIdType(UserLang)
'        cmbIdType.SetFocus
'        validateFrmInternalCustOpen = 1
'        Exit Function
'     Else
'        validateFrmInternalCustOpen = 0
'     End If
'
'     If Len(RTrim(txtIdNo)) = 0 Then
'         MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
'         txtIdNo.SetFocus
'         validateFrmInternalCustOpen = 1
'         Exit Function
'     Else
'         validateFrmInternalCustOpen = 0
'     End If
        
     If Mid$(cmbIdType.text, 1, 1) = "I" Or _
        Mid$(cmbIdType.text, 1, 1) = "Q" Then
        If Len(Trim(txtIdNo)) <> 10 Then
           MsgBox errInvalidId(UserLang)
           txtIdNo.SetFocus
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
         
        If Mid$(cmbIdType.text, 1, 1) = "I" Then
           If Mid$(txtIdNo, 1, 1) <> "1" Then
              MsgBox errInvalidIdCategory(UserLang)
              txtIdNo.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
        ElseIf Mid$(cmbIdType.text, 1, 1) = "Q" Then
            If Mid$(txtIdNo, 1, 1) <> "2" And _
               Mid$(txtIdNo, 1, 1) <> "3" And _
               Mid$(txtIdNo, 1, 1) <> "5" Then
               MsgBox errInvalidIdCategory(UserLang)
               txtIdNo.SetFocus
               validateFrmInternalCustOpen = 1
               Exit Function
            Else
               validateFrmInternalCustOpen = 0
            End If
       End If
           
       If validIdNumber(Trim(txtIdNo)) = False Then
          MsgBox errInvalidIdNo(UserLang)
          txtIdNo.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
     End If ' idtype = "I" or "Q"
        
     If optLangArabic.Value = True Then
        If Mid$(cmbIdType, 1, 1) = "Q" Then
           If Len(RTrim(txtArabFirstName)) = 0 And _
              Len(RTrim(txtArabic2ndName)) = 0 And _
              Len(RTrim(txtArabic3rdName)) = 0 And _
              Len(RTrim(txtArabLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 txtArabFirstName.SetFocus
                 validateFrmInternalCustOpen = 1
                 Exit Function
            Else
                 validateFrmInternalCustOpen = 0
            End If
        Else
           If Len(RTrim(txtArabFirstName)) = 0 Or _
              Len(RTrim(txtArabic2ndName)) = 0 Or _
              Len(RTrim(txtArabic3rdName)) = 0 Or _
              Len(RTrim(txtArabLastName)) = 0 Then
                 MsgBox errAllFourNameReqd(UserLang)
                 txtArabFirstName.SetFocus
                 validateFrmInternalCustOpen = 1
                 Exit Function
            Else
                 validateFrmInternalCustOpen = 0
            End If
        End If
           
           
        If Len(RTrim(txtArabShortName)) = 0 Then
           MsgBox errSpaceShortName(UserLang)
           txtArabShortName.SetFocus
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
     Else  ' customer language is english
        If Mid$(cmbIdType, 1, 1) = "Q" Then
           If Len(RTrim(txtEngFirstName)) = 0 And _
              Len(RTrim(txtEnglish2ndName)) = 0 And _
              Len(RTrim(txtEnglish3rdName)) = 0 And _
              Len(RTrim(txtEngLastName)) = 0 Then
              MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
              txtEngFirstName.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
        Else
           If Len(RTrim(txtEngFirstName)) = 0 Or _
              Len(RTrim(txtEnglish2ndName)) = 0 Or _
              Len(RTrim(txtEnglish3rdName)) = 0 Or _
              Len(RTrim(txtEngLastName)) = 0 Then
              MsgBox errAllFourNameReqd(UserLang)
              txtEngFirstName.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
       End If
           
        If Len(RTrim(txtEngShortName)) = 0 Then
           MsgBox errSpaceShortName(UserLang)
           txtEngShortName.SetFocus
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
    End If
    
    If Len(RTrim(txtArabFirstName)) > 0 Then
       If englishCharFound(txtArabFirstName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabFirstName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtArabic2ndName)) > 0 Then
       If englishCharFound(txtArabic2ndName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabic2ndName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtArabic3rdName)) > 0 Then
       If englishCharFound(txtArabic3rdName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabic3rdName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtArabLastName)) > 0 Then
       If englishCharFound(txtArabLastName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabLastName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtArabShortName)) > 0 Then
       If englishCharFound(txtArabShortName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabShortName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEngFirstName)) > 0 Then
       If arabicCharFound(txtEngFirstName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngFirstName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEnglish2ndName)) > 0 Then
       If arabicCharFound(txtEnglish2ndName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEnglish2ndName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEnglish3rdName)) > 0 Then
       If arabicCharFound(txtEnglish3rdName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEnglish3rdName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEngLastName)) > 0 Then
       If arabicCharFound(txtEngLastName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngLastName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEngShortName)) > 0 Then
       If arabicCharFound(txtEngShortName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngShortName.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
    End If
        
    If Len(RTrim(txtIdNo)) > 0 Then
        If Len(RTrim(cmbIdIssueDate.text)) = 0 Or _
           Len(RTrim(cmbIdIssueMonth.text)) = 0 Or _
           Len(RTrim(txtIdIssueYear)) = 0 Then
           MsgBox errSpaceIssueDate(UserLang)
           cmbIdIssueDate.SetFocus
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
            
        If Len(RTrim(cmbIdExpiryDate.text)) = 0 Or _
           Len(RTrim(cmbIdExpiryMonth.text)) = 0 Or _
           Len(RTrim(txtIdExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           cmbIdExpiryDate.SetFocus
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
            
        tIssueDate = CStr(txtIdIssueYear) & _
                     CStr(cmbIdIssueMonth.text) & _
                     CStr(cmbIdIssueDate.text)
        tExpiryDate = CStr(txtIdExpiryYear) & _
                      CStr(cmbIdExpiryMonth.text) & _
                      CStr(cmbIdExpiryDate.text)
                          
        If optIdDateGregorian.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              cmbIdIssueDate.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
              
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              cmbIdExpiryDate.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
       End If
                         
       If tExpiryDate < tIssueDate Then
          MsgBox errGreaterExpiryYear(UserLang)
          txtIdExpiryYear.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
       Else
          validateFrmInternalCustOpen = 0
       End If
            
       If optIdDateHijri = True Then
          If tExpiryDate < currentHijriDate Then
             MsgBox errExpiryDateLessThanToday(UserLang)
             txtIdExpiryYear.SetFocus
             validateFrmInternalCustOpen = 1
             Exit Function
          Else
             validateFrmInternalCustOpen = 0
          End If
       Else
          If tExpiryDate < currentGregDate Then
             MsgBox errExpiryDateLessThanToday(UserLang)
             txtIdExpiryYear.SetFocus
             validateFrmInternalCustOpen = 1
             Exit Function
          Else
             validateFrmInternalCustOpen = 0
          End If
       End If
    
       If Len(RTrim(cmbIdIssuedAt.text)) = 0 Then
          MsgBox errSpaceIdIssuedAt(UserLang)
          cmbIdIssuedAt.SetFocus
          validateFrmInternalCustOpen = 1
          Exit Function
      Else
          validateFrmInternalCustOpen = 0
      End If
  End If
        
  If Mid$(cmbNationality, 1, 3) = "001" Then
     If Mid$(cmbIdType, 1, 1) = "Q" Or _
        Mid$(cmbIdType, 1, 1) = "O" Then
        MsgBox errInvalidNationality(UserLang)
        validateFrmInternalCustOpen = 1
        Exit Function
     Else
        validateFrmInternalCustOpen = 0
     End If
  Else
     If Mid$(cmbIdType, 1, 1) = "I" Or _
        Mid$(cmbIdType, 1, 1) = "H" Then
        MsgBox errInvalidNationality(UserLang)
        validateFrmInternalCustOpen = 1
        Exit Function
     Else
         validateFrmInternalCustOpen = 0
     End If
  End If
        
  If Len(RTrim(cmbTitle.text)) = 0 Then
     MsgBox errSpaceTitle(UserLang)
     cmbTitle.SetFocus
     validateFrmInternalCustOpen = 1
     Exit Function
  Else
     validateFrmInternalCustOpen = 0
  End If
    
  If Len(RTrim(cmbNationality.text)) = 0 Then
     MsgBox errSpaceNationality(UserLang)
     cmbNationality.SetFocus
     validateFrmInternalCustOpen = 1
     Exit Function
  Else
     validateFrmInternalCustOpen = 0
  End If
  
'  If Len(RTrim(cmbDobDate.text)) = 0 Or _
'     Len(RTrim(cmbDobMonth.text)) = 0 Or _
'     Len(RTrim(txtDobYear.text)) = 0 Then
'     MsgBox errSpaceDob(UserLang) '"Date of Birth Should be entered...Please enter "
'     cmbDobDate.SetFocus
'     validateFrmInternalCustOpen = 1
'     Exit Function
'  Else
'    validateFrmInternalCustOpen = 0
'  End If
  tDob = CStr(txtDobYear) & _
         CStr(cmbDobMonth.text) & _
         CStr(cmbDobDate.text)
  If Len(RTrim(tDob)) > 0 Then
     If optDOBGreg.Value = True Then
        If Not validDate(tDob) Then
           MsgBox errInvalidDate(UserLang)
           cmbDobDate.SetFocus
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
     End If
  
     If optDOBHijri = True Then
        If tDob > currentHijriDate Then
           MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
           txtDobYear.SetFocus
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
     Else
        If tDob > currentGregDate Then
           MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
           txtDobYear.SetFocus
           validateFrmInternalCustOpen = 1
           Exit Function
        Else
           validateFrmInternalCustOpen = 0
        End If
      End If
   End If
      
  If Len(RTrim(cmbBusinessType.text)) = 0 Then
     MsgBox errSpaceBusType(UserLang)
     cmbBusinessType.SetFocus
     validateFrmInternalCustOpen = 1
     Exit Function
  Else
     validateFrmInternalCustOpen = 0
  End If
   
  If optPoBox = True Then
     If Len(RTrim(txtAddress1)) = 0 Or _
        Len(RTrim(txtPOBox)) = 0 Or _
        Len(RTrim(txtPinCode)) = 0 Or _
        Len(RTrim(cmbCity.text)) = 0 Then
        MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
        txtAddress1.SetFocus
        validateFrmInternalCustOpen = 1
        Exit Function
     Else
        validateFrmInternalCustOpen = 0
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
        validateFrmInternalCustOpen = 1
        Exit Function
     Else
        validateFrmInternalCustOpen = 0
     End If
  End If
        
  If optLangArabic.Value = True Then
     If optPoBox = True Then
        If Len(RTrim(txtAddress1)) <> 0 Then
           If englishCharFound(txtAddress1) Then
              MsgBox errNoEnglishAddress(UserLang)
              txtAddress1.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
        End If
        
        If Len(RTrim(txtAddress2)) <> 0 Then
           If englishCharFound(txtAddress2) Then
              MsgBox errNoEnglishAddress(UserLang)
              txtAddress2.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
        End If
    Else ' saudi post address
       If Len(RTrim(txtSaudiPostStreetName)) <> 0 Then
          If englishCharFound(txtSaudiPostStreetName) Then
             MsgBox errNoEnglishAddress(UserLang)
             txtSaudiPostStreetName.SetFocus
             validateFrmInternalCustOpen = 1
             Exit Function
          Else
             validateFrmInternalCustOpen = 0
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
           validateFrmInternalCustOpen = 1
           Exit Function
        End If
     End If
  Else    ' if the language is english
     If optPoBox = True Then
        If Len(RTrim(txtAddress1)) <> 0 Then
           If arabicCharFound(txtAddress1) Then
              MsgBox errNoArabicAddress(UserLang)
              txtAddress1.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
        End If
         
        If Len(RTrim(txtAddress2)) <> 0 Then
           If arabicCharFound(txtAddress2) Then
              MsgBox errNoArabicAddress(UserLang)
              txtAddress2.SetFocus
              validateFrmInternalCustOpen = 1
              Exit Function
           Else
              validateFrmInternalCustOpen = 0
           End If
        End If
    Else ' saudi post address
       If Len(RTrim(txtSaudiPostStreetName)) <> 0 Then
          If arabicCharFound(txtSaudiPostStreetName) Then
             MsgBox errNoArabicAddress(UserLang)
             txtSaudiPostStreetName.SetFocus
             validateFrmInternalCustOpen = 1
             Exit Function
          Else
             validateFrmInternalCustOpen = 0
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
           validateFrmInternalCustOpen = 1
           Exit Function
        End If
    End If
 End If
    
End Function

Public Sub formatNewInternalCustomerRequest()
    Dim mQry As String
    Dim tmpStr As String
 
    quickCustInfo.msgLen = Space(6) ' to be calculated
    quickCustInfo.service = "10"  ' 10 is for New customer creation
    quickCustInfo.userId = gUserId
    
    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       quickCustInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       quickCustInfo.creationOrUpdate = "U"
       quickCustInfo.supervisorComments = recvQuickCustMsg.supervisorComments
       quickCustInfo.supervisorId = Left(recvQuickCustMsg.supervisorId, 10)
    Else
       quickCustInfo.dateTime = gDateTime
       quickCustInfo.creationOrUpdate = "C"
       quickCustInfo.supervisorId = Space(10)
       quickCustInfo.supervisorComments = Space(200)
    End If
    If updateAction Or _
       (tellerAction And recvQuickCustMsg.newOrUpdate = "U") Then
       quickCustInfo.NewOrUpdateFlag = "U"
    Else
       quickCustInfo.NewOrUpdateFlag = "N"
    End If
    
    quickCustInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
    quickCustInfo.branchCode = gBranchCode
    quickCustInfo.customerNo = Format(txtCustomerNo, "0000000")
    quickCustInfo.custBranchCode = Mid$(cmbBranchcode, 1, 4)
    If Len(RTrim(Mid$(cmbAltBrCode, 1, 4))) = 0 Then
       quickCustInfo.altBranchCode = "0000"
    Else
       quickCustInfo.altBranchCode = Mid$(cmbAltBrCode, 1, 4)
    End If
    quickCustInfo.samaMainCategory = "00"
    quickCustInfo.samaSubCategory = "56"  ' Internal customer
    quickCustInfo.screenSetNo = "8" ' for internal customer
    
    quickCustInfo.idNo = txtIdNo
    quickCustInfo.idType = cmbIdType.text
    If optIdDateHijri Then
       quickCustInfo.idDateType = "0"
       quickCustInfo.idExpiryDateH = txtIdExpiryYear & cmbIdExpiryMonth & cmbIdExpiryDate
       quickCustInfo.idIssueDateH = txtIdIssueYear & cmbIdIssueMonth.text & cmbIdIssueDate
       quickCustInfo.idIssueDateG = Space(8)
       quickCustInfo.idExpiryDateG = Space(8)
    Else
       quickCustInfo.idDateType = "1"
       quickCustInfo.idExpiryDateG = txtIdExpiryYear & cmbIdExpiryMonth & cmbIdExpiryDate
       quickCustInfo.idIssueDateG = txtIdIssueYear & cmbIdIssueMonth.text & cmbIdIssueDate
       quickCustInfo.idIssueDateH = Space(8)
       quickCustInfo.idExpiryDateH = Space(8)
    End If
    quickCustInfo.idIssuedAt = cmbIdIssuedAt.text
    If optLangArabic Then
       quickCustInfo.langPref = "0"
    Else
       quickCustInfo.langPref = "1"
    End If
    quickCustInfo.nationality = Left$(cmbNationality, 3)
    quickCustInfo.titleCode = Left$(cmbTitle.text, 2)
    quickCustInfo.aFirstName = txtArabFirstName
    quickCustInfo.a2ndName = txtArabic2ndName
    quickCustInfo.a3rdName = txtArabic3rdName
    quickCustInfo.aLastName = txtArabLastName
    quickCustInfo.aShortName = txtArabShortName
    quickCustInfo.eFirstName = txtEngFirstName
    quickCustInfo.e2ndName = txtEnglish2ndName
    quickCustInfo.e3rdName = txtEnglish3rdName
    quickCustInfo.eLastName = txtEngLastName
    quickCustInfo.eShortName = txtEngShortName
    If optGenderMale Then
       quickCustInfo.sexCode = "0"
    Else
       quickCustInfo.sexCode = "1"
    End If
    
    If optDOBGreg Then
       quickCustInfo.dobDateG = Format(txtDobYear, "0000") & Format(cmbDobMonth, "00") & Format(cmbDobDate, "00")
       quickCustInfo.dobDateType = "1"
       quickCustInfo.dobDateH = Space(8)
    Else
       quickCustInfo.dobDateH = Format(txtDobYear, "0000") & Format(cmbDobMonth, "00") & Format(cmbDobDate, "00")
       quickCustInfo.dobDateType = "0"
       quickCustInfo.dobDateG = Space(8)
    End If
    
    quickCustInfo.businessType = Mid$(cmbBusinessType.text, 1, 3)
    If optSaudiPost = True Then
       quickCustInfo.addressType = "1"
       quickCustInfo.address1 = Format(txtSaudiPostGPSNo, "!@@@@@") & "-" & txtSaudiPostStreetName
       quickCustInfo.poBox = txtSaudiPostUnit
       quickCustInfo.zipCode = Format(txtSaudiPostZipCode, "!@@@@@") & "-" & txtSaudiPostAdditionalNo
       quickCustInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       quickCustInfo.addressType = "0"
       quickCustInfo.address1 = txtAddress1
       quickCustInfo.address2 = txtAddress2
       quickCustInfo.poBox = txtPOBox
       quickCustInfo.zipCode = txtPinCode
       quickCustInfo.country = Mid$(cmbCountry, 1, 3)
    End If
    
    If UserLang = ENGLISH And _
       quickCustInfo.langPref = "0" Then ' 0 is for ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                                                                      cmbCity.text & "'")
       If rs.recordCount > 0 Then
          quickCustInfo.cityName = rs(0)
       Else
          quickCustInfo.cityName = cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       quickCustInfo.langPref = "1" Then ' 1 is for ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                                                                       cmbCity.text & "'")
       If rs.recordCount > 0 Then
          quickCustInfo.cityName = rs(0)
       Else
          quickCustInfo.cityName = cmbCity.text
       End If
    Else
        quickCustInfo.cityName = cmbCity.text
    End If
    quickCustInfo.internalCustomer = "1"
    
    currentAccInfo = Space(12)
    quickCustInfo.cardType = " "
    quickCustInfo.electronIntlRequired = "0"
    quickCustInfo.electronIntlName = Space(26)


End Sub

Public Sub unloadSupForms()
  Dim tCustNo As String
  If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
     tCustNo = Space(7)
  Else
     tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
  End If
  Unload Me
  Unload frmSupervisorApproval
  frmEnquiry.readPendingList "00000", "S", tCustNo
  If UserLang = ARABIC Then
     ChangePositions frmSupervisorApproval, 11800
     frmSupervisorApproval.RightToLeft = True
     frmSupervisorApproval.Hide
  End If
  frmSupervisorApproval.Show
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
