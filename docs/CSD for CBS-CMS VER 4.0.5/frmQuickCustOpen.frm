VERSION 5.00
Begin VB.Form frmQuickCustOpen 
   BackColor       =   &H00BFD87E&
   Caption         =   "Quick Customer Open Details"
   ClientHeight    =   8745
   ClientLeft      =   945
   ClientTop       =   330
   ClientWidth     =   12015
   ControlBox      =   0   'False
   FillColor       =   &H00BFD87E&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8745
   ScaleWidth      =   12015
   WindowState     =   2  'Maximized
   Begin VB.Frame frameDobDateType 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1080
      TabIndex        =   142
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
   Begin VB.Frame frameAccountDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   495
      Left            =   0
      TabIndex        =   133
      Top             =   4920
      Width           =   11895
      Begin VB.Frame Frame13 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1200
         TabIndex        =   135
         Tag             =   "11895"
         Top             =   0
         Width           =   1455
         Begin VB.OptionButton optCurrentAcNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   50
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
            TabIndex        =   49
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   195
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbCurrentAcCurrency 
         Height          =   315
         Left            =   3240
         Style           =   2  'Dropdown List
         TabIndex        =   51
         Tag             =   "11895"
         Top             =   120
         Width           =   1455
      End
      Begin VB.ComboBox cmbCurrentAcStmtFreq 
         Height          =   315
         Left            =   8145
         Style           =   2  'Dropdown List
         TabIndex        =   53
         Tag             =   "11895"
         Top             =   120
         Width           =   975
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   10215
         TabIndex        =   134
         Tag             =   "11895"
         Top             =   0
         Width           =   1455
         Begin VB.OptionButton optCurrentAcCheckBookNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   55
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
            TabIndex        =   54
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   150
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbCurrentAcStatus 
         Height          =   315
         Left            =   5760
         Style           =   2  'Dropdown List
         TabIndex        =   52
         Tag             =   "11895"
         Top             =   120
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
         TabIndex        =   140
         Tag             =   "11895"
         Top             =   120
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
         TabIndex        =   139
         Tag             =   "11895"
         Top             =   120
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
         Left            =   7080
         TabIndex        =   138
         Tag             =   "11895"
         Top             =   165
         Width           =   1095
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
         TabIndex        =   137
         Tag             =   "11895"
         Top             =   180
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
         Left            =   4680
         TabIndex        =   136
         Tag             =   "11895"
         Top             =   165
         Width           =   1095
      End
   End
   Begin VB.Frame FrameCardDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   855
      Left            =   0
      TabIndex        =   127
      Top             =   5520
      Width           =   11895
      Begin VB.Frame frameCardType 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   2190
         TabIndex        =   129
         Tag             =   "11895"
         Top             =   -120
         Width           =   2325
         Begin VB.OptionButton optChipCard 
            BackColor       =   &H00BFD87E&
            Caption         =   "E.I. Chip"
            Height          =   255
            Left            =   1200
            TabIndex        =   57
            Tag             =   "2325"
            ToolTipText     =   "Electron Int'l Chip Card"
            Top             =   165
            Width           =   1035
         End
         Begin VB.OptionButton optIntlCard 
            BackColor       =   &H00BFD87E&
            Caption         =   "Elec.Int'l"
            Height          =   255
            Left            =   120
            TabIndex        =   56
            Tag             =   "2325"
            ToolTipText     =   "Electron International"
            Top             =   165
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin VB.TextBox txtPrimaryElectronIntlCardName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6030
         MaxLength       =   26
         TabIndex        =   60
         Tag             =   "11895"
         Top             =   540
         Width           =   3495
      End
      Begin VB.Frame framePrimaryIntlCard 
         BackColor       =   &H00BFD87E&
         Height          =   435
         Left            =   2190
         TabIndex        =   128
         Tag             =   "11895"
         Top             =   405
         Width           =   1575
         Begin VB.OptionButton optPrimaryElectronIntlCardNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   180
            Left            =   840
            TabIndex        =   59
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   150
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optPrimaryElectronIntlCardYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   225
            Left            =   105
            TabIndex        =   58
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
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
         TabIndex        =   132
         Tag             =   "11895"
         Top             =   0
         Width           =   1695
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
         TabIndex        =   131
         Tag             =   "11895"
         Top             =   540
         Width           =   1695
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
         TabIndex        =   130
         Tag             =   "11895"
         Top             =   555
         Width           =   2175
      End
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   120
      TabIndex        =   121
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
         TabIndex        =   144
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
         TabIndex        =   150
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
         TabIndex        =   149
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
         TabIndex        =   148
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
         TabIndex        =   147
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
         TabIndex        =   146
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
         TabIndex        =   145
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
         TabIndex        =   126
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
         TabIndex        =   125
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
         TabIndex        =   124
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
         TabIndex        =   123
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
         TabIndex        =   122
         Tag             =   "11775"
         Top             =   720
         Width           =   735
      End
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor comments"
      Height          =   405
      Left            =   4170
      TabIndex        =   119
      ToolTipText     =   "Supervisor Comments"
      Top             =   7710
      Width           =   2175
   End
   Begin VB.CommandButton cmdAcctInfo 
      Caption         =   "Account"
      Height          =   405
      Left            =   1020
      TabIndex        =   118
      ToolTipText     =   "Account Info"
      Top             =   7710
      Width           =   1575
   End
   Begin VB.CommandButton cmdCardInfo 
      Caption         =   "ATM Card"
      Height          =   405
      Left            =   2595
      TabIndex        =   117
      ToolTipText     =   "ATM Card Info"
      Top             =   7710
      Width           =   1575
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
      TabIndex        =   94
      Top             =   6525
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
         TabIndex        =   106
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
         TabIndex        =   105
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
         TabIndex        =   104
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
         TabIndex        =   103
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
         TabIndex        =   102
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
         TabIndex        =   101
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
         TabIndex        =   100
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
         TabIndex        =   99
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
         TabIndex        =   98
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
         TabIndex        =   97
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
         TabIndex        =   96
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
         TabIndex        =   95
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
         TabIndex        =   116
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
         TabIndex        =   115
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
         TabIndex        =   114
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
         TabIndex        =   113
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
         TabIndex        =   112
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
         TabIndex        =   111
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
         TabIndex        =   110
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
         TabIndex        =   109
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
         TabIndex        =   108
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
         TabIndex        =   107
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
      Left            =   8955
      TabIndex        =   63
      ToolTipText     =   "Reject"
      Top             =   7695
      Width           =   1305
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "&Approve"
      Height          =   405
      Left            =   7650
      TabIndex        =   62
      ToolTipText     =   "Approve"
      Top             =   7695
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
      TabIndex        =   84
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
         TabIndex        =   91
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
         TabIndex        =   90
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
         TabIndex        =   89
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
         TabIndex        =   88
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
         TabIndex        =   87
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
         TabIndex        =   86
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
         TabIndex        =   85
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
      Left            =   10260
      TabIndex        =   64
      ToolTipText     =   "Cancel"
      Top             =   7695
      Width           =   1305
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "&Create"
      Height          =   405
      Left            =   6345
      TabIndex        =   61
      ToolTipText     =   "Create"
      Top             =   7710
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
      TabIndex        =   79
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
      TabIndex        =   72
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
         TabIndex        =   73
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
         TabIndex        =   93
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
         TabIndex        =   78
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
         TabIndex        =   77
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
         TabIndex        =   76
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
         TabIndex        =   75
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
         TabIndex        =   74
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
      TabIndex        =   71
      Text            =   "Terms and Conditions Here "
      Top             =   12435
      Width           =   12180
   End
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Height          =   495
      Left            =   1230
      TabIndex        =   66
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
      BackColor       =   &H00C0C0C0&
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
      TabIndex        =   65
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
      TabIndex        =   143
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
      TabIndex        =   141
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
      TabIndex        =   120
      Top             =   7800
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
      TabIndex        =   92
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
      Top             =   7605
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
      TabIndex        =   83
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
      TabIndex        =   82
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
      TabIndex        =   81
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
      TabIndex        =   80
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
      TabIndex        =   70
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
      TabIndex        =   69
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
      TabIndex        =   68
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
      TabIndex        =   67
      Top             =   225
      Width           =   495
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   6480
      Y2              =   6480
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
Attribute VB_Name = "frmQuickCustOpen"
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

Private Sub cmbCurrentAcCurrency_Change()
   If Len(RTrim(cmbCurrentAcCurrency.text)) <> 0 Then
      If Mid$(cmbCurrentAcCurrency.text, 1, 2) <> "01" Then
         optCurrentAcCheckBookNo.Value = True
         optCurrentAcCheckBookYes.Enabled = False
      Else
         optCurrentAcCheckBookYes.Enabled = True
      End If
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
     Mid$(cmbTitle.text, 1, 2) = "06" Or _
     Mid$(cmbTitle.text, 1, 2) = "12" Or _
     Mid$(cmbTitle.text, 1, 2) = "13" Then
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
   Dim shortName As String, acctNo As String, custBranchCode As String, customerLang As Integer

   frmSupervisorApproval.MSFlexGrid1.Col = 0
   tuserId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
   frmSupervisorApproval.MSFlexGrid1.Col = 1
   tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
   tBranchCode = gBranchCode
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   tpinUserId = tuserId  ' used for tpin approval
   tpinDateTime = tDateTime   ' used for tpin approval
   tpinSupervisorId = tSupervisorId    ' used for tpin approval
   
   If recvQuickCustMsg.newOrUpdate = "N" Then
      If optCurrentAcYes.Value = True Then
         tPrimaryAcc = Mid$(cmbCurrentAcCurrency, 1, 2) & "008"
      Else
         tPrimaryAcc = Space(5)
      End If
   Else
      tPrimaryAcc = Space(5)
   End If
   
   SendMsg = "000268" & "19" & gBranchCode & "A" & tBranchCode & tuserId & tDateTime & _
             tSupervisorId & Space(200) & recvQuickCustMsg.newOrUpdate & tPrimaryAcc & _
             txtCustomerNo & "7" & Space(1) & Space(10) & Space(14) & Space(50) 'screen set no = 7
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   
   frmQuickCustOpen.MousePointer = vbHourglass
   frmQuickCustOpen.cmdApprove.Enabled = False
   frmQuickCustOpen.cmdReject.Enabled = False
   frmQuickCustOpen.cmdCancel.Enabled = False
   
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmQuickCustOpen.MousePointer = vbDefault
      frmQuickCustOpen.cmdApprove.Enabled = True
      frmQuickCustOpen.cmdReject.Enabled = True
      frmQuickCustOpen.cmdCancel.Enabled = True
      unloadSupForms
      Exit Sub
   End If

   If recvSuperDecisionMsg.status = "000" Then
      frmQuickCustOpen.MousePointer = vbDefault
      MsgBox errSuccessful(UserLang) '"transaction successfully completed..."
      If recvQuickCustMsg.newOrUpdate = "N" Then
'         MsgBox errCustNoAlloted(UserLang) & recvSuperDecisionMsg.custNo & "    " & Chr$(13) & _
'               IIf(Len(Trim(recvSuperDecisionMsg.ibanAccNo)) = 0, "", Mid$(recvSuperDecisionMsg.ibanAccNo, 1, 2) & errIban(UserLang) & ":" & Mid$(recvSuperDecisionMsg.ibanAccNo, 3))
          MsgBox errCustNoAlloted(UserLang) & recvSuperDecisionMsg.custNo & "    " & Chr$(13) & _
                IIf(Len(Trim(recvSuperDecisionMsg.ibanAccNo)) = 0, "", IIf(UserLang = ARABIC, Mid$(recvSuperDecisionMsg.ibanAccNo, 1, 2) & errIban(UserLang) & ":" & Mid$(recvSuperDecisionMsg.ibanAccNo, 3), errIban(UserLang) & ":" & recvSuperDecisionMsg.ibanAccNo))
      End If
      
      If cardProductionAtBranch = True Or pinSelectAtBranch = True Then
         If Len(RTrim(recvSuperDecisionMsg.primaryCard.cardNo)) > 0 Then
            If recvSuperDecisionMsg.primaryCard.branchPinSelect = "Y" Then
               updateCardPrdn "P"
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
      frmQuickCustOpen.MousePointer = vbDefault
      unloadSupForms
      Exit Sub
   End If
End Sub
Public Sub printAccOpeningCard()
  Dim custName As String, accountNo As String, custBranchCode As String, customerLang As Integer
  Dim tmpStr As String
  
  frmPrintAccOpeningCard.txtCustNo = txtCustomerNo
  If optLangArabic Then
     custName = txtArabFirstName & " " & txtArabic2ndName & " " & txtArabLastName
     frmPrintAccOpeningCard.optLangArabic = True
     customerLang = 0
     frmPrintAccOpeningCard.assignNameToGlobalVar txtArabFirstName, txtArabic2ndName, txtArabLastName
  Else
     custName = txtEngFirstName & " " & txtEnglish2ndName & " " & txtEngLastName
     frmPrintAccOpeningCard.optLangEnglish = True
     customerLang = 1
     frmPrintAccOpeningCard.assignNameToGlobalVar txtEngFirstName, txtEnglish2ndName, txtEngLastName
  End If
  frmPrintAccOpeningCard.txtCustName = custName
  
  If optCurrentAcYes Then
     accountNo = Right(recvSuperDecisionMsg.ibanAccNo, 14)
  Else
     accountNo = recvSuperDecisionMsg.custNo
  End If
  custBranchCode = Mid$(cmbBranchcode, 1, 4)
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
  frmPrintAccOpeningCard.cmbBranchcode = tmpStr
  
    
  frmPrintAccOpeningCard.txtAccNo = accountNo
  
  frmPrintAccOpeningCard.txtIban = displayIban(recvSuperDecisionMsg.ibanAccNo)
  frmPrintAccOpeningCard.frameAccountInput.Enabled = False
  frmPrintAccOpeningCard.frameAccountInput.Visible = False
  frmPrintAccOpeningCard.cmdFetchDetails.Enabled = False
  frmPrintAccOpeningCard.cmdFetchDetails.Visible = False
  frmPrintAccOpeningCard.cmdOk.Enabled = True
  
  frmPrintAccOpeningCard.Show vbModal
End Sub


Public Sub printAccOpeningCard_OLD(shortName As String, accountNo As String, branchCode As String, customerLang As String)
  Dim currentPrinter As Printer, PRNTR As Printer
  Dim tmpPrinter As String
  Dim tmpStr As String, tCode As String
  Dim cardPrinterDefaulted As Boolean
  Dim langChar As String
  
  Dim accName(2) As String
  Dim accAcNo(2) As String
  Dim accIban(2) As String
  Dim accAccOpenDate(2) As String
  Dim accBranch(2) As String
  
  
  accName(0) = "«·«”„"
  accName(1) = "Name"
  accAcNo(0) = "—ﬁ„ «·Õ”«»"
  accAcNo(1) = "A/C No."
  accIban(0) = "IBAN"
  accIban(1) = "IBAN"
  accAccOpenDate(0) = " «—ÌŒ › Õ «·Õ”«»"
  accAccOpenDate(1) = "A/C Opening Date"
  
  
'  cardPrinterDefaulted = False
'  If Len(Trim(cardPrinterName)) = 0 Or cardPrinterName = "" Then
'     cardPrinterName = "Smart Driver"
'  End If
'  If Printer.DeviceName <> cardPrinterName Then
'     tmpPrinter = Printer.DeviceName
'     For Each PRNTR In Printers
'         If PRNTR.DeviceName = cardPrinterName Then
'            Set Printer = PRNTR
'            cardPrinterDefaulted = True
'            Exit For
'         End If
'     Next
'
'     If cardPrinterDefaulted = False Then
'        MsgBox errCardPrinterNotFound(UserLang)
'        Exit Sub
'     End If
'  End If
    
  Printer.Orientation = vbPRORLandscape
  Printer.Font = "Arial"
  Printer.FontBold = False
  Printer.CurrentX = 0
  Printer.CurrentY = 0
  Printer.Print
  Printer.Print
  Printer.fontSize = 8
  Printer.Print Space(3) & "Name            :" & Format(shortName, "!" & String(30, "@")) & Space(10) & ":          «·«”„ "
  Printer.Print
  Printer.Print
  Printer.Print Space(3) & "A/C No.         :" & Format(accountNo, "!" & String(14, "@")) & Space(26) & ":      —ﬁ„ «·Õ”«»"
  Printer.Print
  Printer.Print
  Printer.Print Space(3) & "IBAN            :" & Format(recvSuperDecisionMsg.ibanAccNo, "!" & String(24, "@")) & Space(16) & ":           IBAN"
  Printer.Print
  Printer.Print
  Printer.Print Space(3) & "A/C Opening Date:" & Format(formatDate(recvLoginMsg.bankingDate), "!" & String(10, "@")) & Space(30) & ": «—ÌŒ › Õ «·Õ”«»"
  Printer.Print
  Printer.Print
  
  Set rs = db.OpenRecordset("select arabicname, englishName from branchinfo where branchcode = '" & branchCode & "'")
   
  If rs.recordCount > 0 Then
     If customerLang = "0" Then
        tmpStr = branchCode & "-" & rs(0)
     Else
        tmpStr = branchCode & "-" & rs(1)
     End If
  Else
     tmpStr = branchCode & "-Not found in Local"
  End If
  Printer.Print Space(3) & "Branch          :" & Format(tmpStr, "!" & String(35, "@")) & Space(5) & ":          «·›—⁄"
  
  Printer.EndDoc
  'printStatus = 1
    
  'delay (10)
  
'  If cardPrinterDefaulted = True Then
'     For Each PRNTR In Printers
'        If PRNTR.DeviceName = tmpPrinter Then
'           Set Printer = PRNTR
'           Exit For
'        End If
'     Next
'  End If
End Sub

Public Function updateBranchPower()

   frmQuickCustOpen.MousePointer = vbHourglass
   frmQuickCustOpen.txtCustomerNo = recvSuperDecisionMsg.custNo
   formatNewQuickCustomerRequest
   
   'now form the customer buffer to insert into BranchPower
   If openCustFile = 1 Then
      frmQuickCustOpen.MousePointer = vbDefault
      frmQuickCustOpen.cmdApprove.Enabled = True
      frmQuickCustOpen.cmdReject.Enabled = True
      frmQuickCustOpen.cmdCancel.Enabled = True
      unloadSupForms
      updateBranchPower = 1
      Exit Function
   End If
   
   If recvQuickCustMsg.newOrUpdate = "U" Then
      If readClient = 1 Then
         frmQuickCustOpen.MousePointer = vbDefault
         frmQuickCustOpen.cmdApprove.Enabled = True
         frmQuickCustOpen.cmdReject.Enabled = True
         frmQuickCustOpen.cmdCancel.Enabled = True
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
         frmQuickCustOpen.MousePointer = vbDefault
         frmQuickCustOpen.cmdApprove.Enabled = True
         frmQuickCustOpen.cmdReject.Enabled = True
         frmQuickCustOpen.cmdCancel.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   Else
      If updateClient = 1 Then
         frmQuickCustOpen.MousePointer = vbDefault
         frmQuickCustOpen.cmdApprove.Enabled = True
         frmQuickCustOpen.cmdReject.Enabled = True
         frmQuickCustOpen.cmdCancel.Enabled = True
         closeClient
         unloadSupForms
         updateBranchPower = 1
         Exit Function
      End If
   End If
   
   closeClient
   
   If recvQuickCustMsg.newOrUpdate = "U" Then
      frmQuickCustOpen.MousePointer = vbDefault
      frmQuickCustOpen.cmdApprove.Enabled = True
      frmQuickCustOpen.cmdReject.Enabled = True
      frmQuickCustOpen.cmdCancel.Enabled = True
      unloadSupForms
      updateBranchPower = 0
      Exit Function
   End If
  
   If openAcctFile = 1 Then
      frmQuickCustOpen.MousePointer = vbDefault
      frmQuickCustOpen.cmdApprove.Enabled = True
      frmQuickCustOpen.cmdReject.Enabled = True
      frmQuickCustOpen.cmdCancel.Enabled = True
      unloadSupForms
      updateBranchPower = 1
      Exit Function
   End If
         
   If frmQuickCustOpen.optCurrentAcYes.Value = True Then
      formatAcctInfo "008", Left$(frmQuickCustOpen.cmbCurrentAcCurrency.text, 2), _
                     Left$(frmQuickCustOpen.cmbCurrentAcStatus.text, 2), _
                     Left$(frmQuickCustOpen.cmbCurrentAcStmtFreq.text, 2), _
                     IIf(frmQuickCustOpen.optCurrentAcCheckBookYes, "0", "1"), "0", _
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
          frmQuickCustOpen.MousePointer = vbDefault
          frmQuickCustOpen.cmdApprove.Enabled = True
          frmQuickCustOpen.cmdReject.Enabled = True
          frmQuickCustOpen.cmdCancel.Enabled = True
          unloadSupForms
          updateBranchPower = 1
          Exit Function
       End If
    End If
  
  
  closeAcct
  updateBranchPower = 0
    
   frmQuickCustOpen.MousePointer = vbDefault
   frmQuickCustOpen.cmdApprove.Enabled = True
   frmQuickCustOpen.cmdReject.Enabled = True
   frmQuickCustOpen.cmdCancel.Enabled = True
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
    
    If validateFrmQuickCustOpen = 1 Then
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
     
     cmdCreate.Enabled = False
     If checkCustomerExistance(frmQuickCustOpen, tIdType, tIdNo, newOrUpdate, tCustNo, custName) = 1 Then
        cmdCreate.Enabled = True
        Exit Sub
     End If
     cmdCreate.Enabled = True
       
    If Len(RTrim(gDateTime)) = 0 Then
       gDateTime = getUnixDateTime
       If Trim(gDateTime) = "ERROR" Then
          gDateTime = Space(14)
          Exit Sub
       End If
    End If
    
    formatNewQuickCustomerRequest
    
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
    frmQuickCustOpen.MousePointer = vbHourglass
    frmQuickCustOpen.cmdCreate.Enabled = False
    frmQuickCustOpen.cmdCancel.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmQuickCustOpen.cmdCreate.Enabled = True
       frmQuickCustOpen.cmdCancel.Enabled = True
       frmQuickCustOpen.MousePointer = vbDefault
       Exit Sub
    End If
    frmQuickCustOpen.MousePointer = vbDefault
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
       frmQuickCustOpen.cmdCancel.Enabled = True
       If quickCustInfo.NewOrUpdateFlag = "N" And quickCustInfo.creationOrUpdate = "C" Then
          gCustNo = recvCustomerMsg.custNo
          txtCustomerNo = recvCustomerMsg.custNo
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
       unloadForms
       Exit Sub
    End If
    
    If quickCustInfo.NewOrUpdateFlag = "N" And quickCustInfo.creationOrUpdate = "C" Then
       If pinSelectAtBranch = True Then
          atmPin = Space(4)
          atmPin2 = Space(4)
          If frmQuickCustOpen.optPrimaryElectronIntlCardYes = True Then
             frmAcceptPin.tag = "P" ' primary card
             frmAcceptPin.txtCardType = "Primary"
             frmAcceptPin.txtNameOnTheCard = frmQuickCustOpen.txtPrimaryElectronIntlCardName
             frmAcceptPin.Show vbModal
          Else
             unloadForms
          End If
       Else
          unloadForms
       End If
    Else
       unloadForms
    End If
    
End Sub

Public Sub unloadForms()
   Dim tCustNo As String
   frmQuickCustOpen.MousePointer = vbDefault
   frmQuickCustOpen.cmdCreate.Enabled = True
   frmQuickCustOpen.cmdCancel.Enabled = True
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
       ChangePositions frmQuickCustOpen, 11800
       frmQuickCustOpen.RightToLeft = True
       frameOpenUpdateDetails.RightToLeft = True
    End If
    
    txtSysDate.text = Date
    gDateTime = Space(14)   'Date Time to be used for global
    
    frmQuickCustOpen.Caption = frmQuickCustOpenCaption(0, UserLang)
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
    lblCurrentAccount.Caption = frmQuickCustOpenCaption(30, UserLang)
    lblCurrentAcCurrency.Caption = frmQuickCustOpenCaption(31, UserLang)
    lblCurrentAcStatus.Caption = frmQuickCustOpenCaption(32, UserLang)
    lblCurrentAcStmtFreq.Caption = frmQuickCustOpenCaption(33, UserLang)
    lblCurrentAcCheckBook.Caption = frmQuickCustOpenCaption(34, UserLang)
    optCurrentAcCheckBookYes.Caption = frmQuickCustOpenCaption(35, UserLang)
    optCurrentAcCheckBookNo.Caption = frmQuickCustOpenCaption(36, UserLang)
    optCurrentAcYes.Caption = frmQuickCustOpenCaption(35, UserLang)
    optCurrentAcNo.Caption = frmQuickCustOpenCaption(36, UserLang)
    
    lblCardType.Caption = frmQuickCustOpenCaption(37, UserLang)
    optIntlCard.Caption = frmQuickCustOpenCaption(38, UserLang)
    optChipCard.Caption = frmQuickCustOpenCaption(39, UserLang)
    lblPrimaryElectronIntlCard.Caption = frmQuickCustOpenCaption(40, UserLang)
    optPrimaryElectronIntlCardYes.Caption = frmQuickCustOpenCaption(35, UserLang)
    optPrimaryElectronIntlCardNo.Caption = frmQuickCustOpenCaption(36, UserLang)
    lblPrimaryElectronIntlCardName.Caption = frmQuickCustOpenCaption(41, UserLang)
    
    cmdCardInfo.Caption = frmQuickCustOpenCaption(42, UserLang)
    cmdAcctInfo.Caption = frmQuickCustOpenCaption(43, UserLang)
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
         If rs("idcode") = "I" Then
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
    
   Set rs = db.OpenRecordset("select * from currencyinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcCurrency.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbCurrentAcCurrency.AddItem rs("currencycode") & " - " & rs("arabicname")
         Else
            cmbCurrentAcCurrency.AddItem rs("currencycode") & " - " & rs("englishname")
         End If
         rs.MoveNext
      Loop
      cmbCurrentAcCurrency.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from accountstatusinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcStatus.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbCurrentAcStatus.AddItem rs("statuscode") & " - " & rs("englishname")
         Else
            cmbCurrentAcStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbCurrentAcStatus.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from statementfrequencyinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcStmtFreq.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbCurrentAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("englishname")
         Else
            cmbCurrentAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
     Loop
   End If
   If rs.recordCount > 3 Then
      cmbCurrentAcStmtFreq.ListIndex = 3
   End If
   
   txtCustomerNo = Space(7)
   
   If InStr(recvLoginMsg.authorityLevel, "~02") > 0 And _
      supervisorAction Then
      If recvQuickCustMsg.displayWarningMsgOnDuplicateId = "0" Then   ' Stop the process
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
      cmbBranchcode.Enabled = False
      txtCustomerNo.Enabled = False
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
      frameAccountDetails.Enabled = False
      FrameCardDetails.Enabled = False
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
      frameCustomerContactInfo.Enabled = True
      If smartCardEnabled = True Then
         optChipCard.Enabled = True
      Else
         optChipCard.Enabled = False
         optIntlCard.Value = True
      End If
      If Not (updateAction Or (tellerAction And recvQuickCustMsg.newOrUpdate = "U")) Then
         If recvLoginMsg.globalUpdatePriv = "1" Or recvLoginMsg.mainBrEditAllowed = "1" Then   ' Global update privilege
            cmbBranchcode.Enabled = True
         Else
            cmbBranchcode.Enabled = False
         End If
         
         frameAccountDetails.Enabled = True
         If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
            FrameCardDetails.Enabled = True
            frameCardType.Enabled = True
            framePrimaryIntlCard.Enabled = True
         Else
            FrameCardDetails.Enabled = False
            frameCardType.Enabled = False
            framePrimaryIntlCard.Enabled = False
         End If
         cmdAcctInfo.Enabled = False
         cmdCardInfo.Enabled = False
      End If
      If updateAction Then
         frameAccountDetails.Enabled = False
         FrameCardDetails.Enabled = False
      Else
         If tellerAction And _
            recvQuickCustMsg.newOrUpdate = "U" Then
            frameAccountDetails.Enabled = False
            FrameCardDetails.Enabled = False
         Else
            frameAccountDetails.Enabled = True
            FrameCardDetails.Enabled = True
         End If
         If tellerAction And recvQuickCustMsg.newOrUpdate = "N" Then
            FrameCardDetails.Enabled = True
            frameCardType.Enabled = False
            framePrimaryIntlCard.Enabled = False
         End If
      End If
      cmbBusinessType.Enabled = True
      frameSex.Enabled = True
'      If frmCustCategorize.tag = "I" Then ' opening internal customers
'         frmQuickCustOpen.tag = "I"
'         txtCustomerNo.Enabled = True
'         cmbBranchCode.Enabled = True
'         optCurrentAcYes.Value = False
'         frameAccountDetails.Visible = False
'         FrameCardDetails.Visible = False
'      Else
'         frmQuickCustOpen.tag = ""
'         txtCustomerNo.Enabled = False
'         cmbBranchCode.Enabled = False
'         txtCustomerNo = Space(7)
'         optCurrentAcYes.Value = True
'         frameAccountDetails.Visible = True
'         frameAccountDetails.Refresh
'         FrameCardDetails.Visible = True
'         FrameCardDetails.Refresh
'      End If
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

Private Sub optCurrentAcNo_Click()
    optPrimaryElectronIntlCardNo.Value = True
    txtPrimaryElectronIntlCardName = ""
    FrameCardDetails.Enabled = False
End Sub

Private Sub optCurrentAcYes_Click()
    If InStr(recvLoginMsg.authorityLevel, "~41") > 0 Then
       FrameCardDetails.Enabled = True
    End If
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

Private Sub optPrimaryElectronIntlCardNo_Click()
    txtPrimaryElectronIntlCardName = ""
    txtPrimaryElectronIntlCardName.Enabled = False
End Sub

Private Sub optPrimaryElectronIntlCardYes_Click()
   txtPrimaryElectronIntlCardName.Enabled = True
   txtPrimaryElectronIntlCardName = UCase(txtEngFirstName) & " " & UCase(txtEnglish2ndName) & " " & UCase(txtEngLastName)
   If Len(txtPrimaryElectronIntlCardName) > 26 Then
      txtPrimaryElectronIntlCardName = UCase(txtEngFirstName)
   End If
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

Public Function validateFrmQuickCustOpen() As Integer
     Dim tIssueDate As String
     Dim tExpiryDate As String
     Dim tCode As String
     Dim tmpCode As String
     Dim mQry As String, tDob As String
     Dim i As Integer
     
     validateFrmQuickCustOpen = 0
     
     If Len(RTrim(Mid$(cmbBranchcode, 1, 4))) = 0 Then
        MsgBox errSpaceBranchCode(UserLang)
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
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
           validateFrmQuickCustOpen = 1
           Exit Function
        Else
           validateFrmQuickCustOpen = 0
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
         validateFrmQuickCustOpen = 1
         Exit Function
     Else
         validateFrmQuickCustOpen = 0
     End If
          
     If Len(RTrim(cmbIdType.text)) = 0 Then
        MsgBox errSpaceIdType(UserLang)
        cmbIdType.SetFocus
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
     End If
        
     If Len(RTrim(txtIdNo)) = 0 Then
         MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
         txtIdNo.SetFocus
         validateFrmQuickCustOpen = 1
         Exit Function
     Else
         validateFrmQuickCustOpen = 0
     End If
        
     If Mid$(cmbIdType.text, 1, 1) = "I" Or _
        Mid$(cmbIdType.text, 1, 1) = "Q" Then
        If Len(Trim(txtIdNo)) <> 10 Then
           MsgBox errInvalidId(UserLang)
           txtIdNo.SetFocus
           validateFrmQuickCustOpen = 1
           Exit Function
        Else
           validateFrmQuickCustOpen = 0
        End If
         
        If Mid$(cmbIdType.text, 1, 1) = "I" Then
           If Mid$(txtIdNo, 1, 1) <> "1" Then
              MsgBox errInvalidIdCategory(UserLang)
              txtIdNo.SetFocus
              validateFrmQuickCustOpen = 1
              Exit Function
           Else
              validateFrmQuickCustOpen = 0
           End If
        ElseIf Mid$(cmbIdType.text, 1, 1) = "Q" Then
            If Mid$(txtIdNo, 1, 1) <> "2" And _
               Mid$(txtIdNo, 1, 1) <> "3" And _
               Mid$(txtIdNo, 1, 1) <> "5" Then
               MsgBox errInvalidIdCategory(UserLang)
               txtIdNo.SetFocus
               validateFrmQuickCustOpen = 1
               Exit Function
            Else
               validateFrmQuickCustOpen = 0
            End If
       End If
           
       If validIdNumber(Trim(txtIdNo)) = False Then
          MsgBox errInvalidIdNo(UserLang)
          txtIdNo.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
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
                 validateFrmQuickCustOpen = 1
                 Exit Function
            Else
                 validateFrmQuickCustOpen = 0
            End If
        Else
           If Len(RTrim(txtArabFirstName)) = 0 Or _
              Len(RTrim(txtArabic2ndName)) = 0 Or _
              Len(RTrim(txtArabic3rdName)) = 0 Or _
              Len(RTrim(txtArabLastName)) = 0 Then
                 MsgBox errAllFourNameReqd(UserLang)
                 txtArabFirstName.SetFocus
                 validateFrmQuickCustOpen = 1
                 Exit Function
            Else
                 validateFrmQuickCustOpen = 0
            End If
        End If
           
           
        If Len(RTrim(txtArabShortName)) = 0 Then
           MsgBox errSpaceShortName(UserLang)
           txtArabShortName.SetFocus
           validateFrmQuickCustOpen = 1
           Exit Function
        Else
           validateFrmQuickCustOpen = 0
        End If
     Else  ' customer language is english
        If Mid$(cmbIdType, 1, 1) = "Q" Then
           If Len(RTrim(txtEngFirstName)) = 0 And _
              Len(RTrim(txtEnglish2ndName)) = 0 And _
              Len(RTrim(txtEnglish3rdName)) = 0 And _
              Len(RTrim(txtEngLastName)) = 0 Then
              MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
              txtEngFirstName.SetFocus
              validateFrmQuickCustOpen = 1
              Exit Function
           Else
              validateFrmQuickCustOpen = 0
           End If
        Else
           If Len(RTrim(txtEngFirstName)) = 0 Or _
              Len(RTrim(txtEnglish2ndName)) = 0 Or _
              Len(RTrim(txtEnglish3rdName)) = 0 Or _
              Len(RTrim(txtEngLastName)) = 0 Then
              MsgBox errAllFourNameReqd(UserLang)
              txtEngFirstName.SetFocus
              validateFrmQuickCustOpen = 1
              Exit Function
           Else
              validateFrmQuickCustOpen = 0
           End If
       End If
           
        If Len(RTrim(txtEngShortName)) = 0 Then
           MsgBox errSpaceShortName(UserLang)
           txtEngShortName.SetFocus
           validateFrmQuickCustOpen = 1
           Exit Function
        Else
           validateFrmQuickCustOpen = 0
        End If
    End If
    
    If Len(RTrim(txtArabFirstName)) > 0 Then
       If englishCharFound(txtArabFirstName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabFirstName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtArabic2ndName)) > 0 Then
       If englishCharFound(txtArabic2ndName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabic2ndName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtArabic3rdName)) > 0 Then
       If englishCharFound(txtArabic3rdName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabic3rdName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtArabLastName)) > 0 Then
       If englishCharFound(txtArabLastName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabLastName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtArabShortName)) > 0 Then
       If englishCharFound(txtArabShortName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabShortName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEngFirstName)) > 0 Then
       If arabicCharFound(txtEngFirstName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngFirstName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEnglish2ndName)) > 0 Then
       If arabicCharFound(txtEnglish2ndName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEnglish2ndName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEnglish3rdName)) > 0 Then
       If arabicCharFound(txtEnglish3rdName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEnglish3rdName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEngLastName)) > 0 Then
       If arabicCharFound(txtEngLastName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngLastName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
    
    If Len(RTrim(txtEngShortName)) > 0 Then
       If arabicCharFound(txtEngShortName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngShortName.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
    End If
        
    If Len(RTrim(cmbIdIssueDate.text)) = 0 Or _
       Len(RTrim(cmbIdIssueMonth.text)) = 0 Or _
       Len(RTrim(txtIdIssueYear)) = 0 Then
       MsgBox errSpaceIssueDate(UserLang)
       cmbIdIssueDate.SetFocus
       validateFrmQuickCustOpen = 1
       Exit Function
    Else
       validateFrmQuickCustOpen = 0
    End If
        
    If Len(RTrim(cmbIdExpiryDate.text)) = 0 Or _
       Len(RTrim(cmbIdExpiryMonth.text)) = 0 Or _
       Len(RTrim(txtIdExpiryYear)) = 0 Then
       MsgBox errSpaceExpiryDate(UserLang)
       cmbIdExpiryDate.SetFocus
       validateFrmQuickCustOpen = 1
       Exit Function
    Else
       validateFrmQuickCustOpen = 0
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
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
          
       If Not validDate(tExpiryDate) Then
          MsgBox errInvalidDate(UserLang)
          cmbIdExpiryDate.SetFocus
          validateFrmQuickCustOpen = 1
          Exit Function
       Else
          validateFrmQuickCustOpen = 0
       End If
   End If
                     
   If tExpiryDate < tIssueDate Then
      MsgBox errGreaterExpiryYear(UserLang)
      txtIdExpiryYear.SetFocus
      validateFrmQuickCustOpen = 1
      Exit Function
   Else
      validateFrmQuickCustOpen = 0
   End If
        
   If optIdDateHijri = True Then
      If tExpiryDate < currentHijriDate Then
         MsgBox errExpiryDateLessThanToday(UserLang)
         txtIdExpiryYear.SetFocus
         validateFrmQuickCustOpen = 1
         Exit Function
      Else
         validateFrmQuickCustOpen = 0
      End If
   Else
      If tExpiryDate < currentGregDate Then
         MsgBox errExpiryDateLessThanToday(UserLang)
         txtIdExpiryYear.SetFocus
         validateFrmQuickCustOpen = 1
         Exit Function
      Else
         validateFrmQuickCustOpen = 0
      End If
   End If

   If Len(RTrim(cmbIdIssuedAt.text)) = 0 Then
      MsgBox errSpaceIdIssuedAt(UserLang)
      cmbIdIssuedAt.SetFocus
      validateFrmQuickCustOpen = 1
      Exit Function
  Else
      validateFrmQuickCustOpen = 0
  End If
        
  If Mid$(cmbNationality, 1, 3) = "001" Then
     If Mid$(cmbIdType, 1, 1) = "Q" Or _
        Mid$(cmbIdType, 1, 1) = "O" Then
        MsgBox errInvalidNationality(UserLang)
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
     End If
  Else
     If Mid$(cmbIdType, 1, 1) = "I" Or _
        Mid$(cmbIdType, 1, 1) = "H" Then
        MsgBox errInvalidNationality(UserLang)
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
         validateFrmQuickCustOpen = 0
     End If
  End If
        
  If Len(RTrim(cmbTitle.text)) = 0 Then
     MsgBox errSpaceTitle(UserLang)
     cmbTitle.SetFocus
     validateFrmQuickCustOpen = 1
     Exit Function
  Else
     validateFrmQuickCustOpen = 0
  End If
    
  If Len(RTrim(cmbNationality.text)) = 0 Then
     MsgBox errSpaceNationality(UserLang)
     cmbNationality.SetFocus
     validateFrmQuickCustOpen = 1
     Exit Function
  Else
     validateFrmQuickCustOpen = 0
  End If
  
  If Len(RTrim(cmbDobDate.text)) = 0 Or _
     Len(RTrim(cmbDobMonth.text)) = 0 Or _
     Len(RTrim(txtDobYear.text)) = 0 Then
     MsgBox errSpaceDob(UserLang) '"Date of Birth Should be entered...Please enter "
     cmbDobDate.SetFocus
     validateFrmQuickCustOpen = 1
     Exit Function
  Else
    validateFrmQuickCustOpen = 0
  End If
  tDob = CStr(txtDobYear) & _
         CStr(cmbDobMonth.text) & _
         CStr(cmbDobDate.text)
           
  If optDOBGreg.Value = True Then
     If Not validDate(tDob) Then
        MsgBox errInvalidDate(UserLang)
        cmbDobDate.SetFocus
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
     End If
  End If
  
  If optDOBHijri = True Then
      If tDob > currentHijriDate Then
         MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
         txtDobYear.SetFocus
         validateFrmQuickCustOpen = 1
         Exit Function
      Else
         validateFrmQuickCustOpen = 0
      End If
   Else
      If tDob > currentGregDate Then
         MsgBox errDobGreaterThanToday(UserLang) '"Date of birth cannot be greater than today "
         txtDobYear.SetFocus
         validateFrmQuickCustOpen = 1
         Exit Function
      Else
         validateFrmQuickCustOpen = 0
      End If
   End If
      
  If Len(RTrim(cmbBusinessType.text)) = 0 Then
     MsgBox errSpaceBusType(UserLang)
     cmbBusinessType.SetFocus
     validateFrmQuickCustOpen = 1
     Exit Function
  Else
     validateFrmQuickCustOpen = 0
  End If
   
  If optPoBox = True Then
     If Len(RTrim(txtAddress1)) = 0 Or _
        Len(RTrim(txtPOBox)) = 0 Or _
        Len(RTrim(txtPinCode)) = 0 Or _
        Len(RTrim(cmbCity.text)) = 0 Then
        MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
        txtAddress1.SetFocus
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
     End If
     If Trim(txtPOBox) = "0" Or _
        Trim(txtPinCode) = "0" Then
        MsgBox errPoOrZipCannotBeZero(UserLang)
        txtPOBox.SetFocus
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
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
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
     End If
  End If
        
  If optLangArabic.Value = True Then
     If optPoBox = True Then
        If Len(RTrim(txtAddress1)) <> 0 Then
           If englishCharFound(txtAddress1) Then
              MsgBox errNoEnglishAddress(UserLang)
              txtAddress1.SetFocus
              validateFrmQuickCustOpen = 1
              Exit Function
           Else
              validateFrmQuickCustOpen = 0
           End If
        End If
        
        If Len(RTrim(txtAddress2)) <> 0 Then
           If englishCharFound(txtAddress2) Then
              MsgBox errNoEnglishAddress(UserLang)
              txtAddress2.SetFocus
              validateFrmQuickCustOpen = 1
              Exit Function
           Else
              validateFrmQuickCustOpen = 0
           End If
        End If
    Else ' saudi post address
       If Len(RTrim(txtSaudiPostStreetName)) <> 0 Then
          If englishCharFound(txtSaudiPostStreetName) Then
             MsgBox errNoEnglishAddress(UserLang)
             txtSaudiPostStreetName.SetFocus
             validateFrmQuickCustOpen = 1
             Exit Function
          Else
             validateFrmQuickCustOpen = 0
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
           validateFrmQuickCustOpen = 1
           Exit Function
        End If
     End If
  Else    ' if the language is english
     If optPoBox = True Then
        If Len(RTrim(txtAddress1)) <> 0 Then
           If arabicCharFound(txtAddress1) Then
              MsgBox errNoArabicAddress(UserLang)
              txtAddress1.SetFocus
              validateFrmQuickCustOpen = 1
              Exit Function
           Else
              validateFrmQuickCustOpen = 0
           End If
        End If
         
        If Len(RTrim(txtAddress2)) <> 0 Then
           If arabicCharFound(txtAddress2) Then
              MsgBox errNoArabicAddress(UserLang)
              txtAddress2.SetFocus
              validateFrmQuickCustOpen = 1
              Exit Function
           Else
              validateFrmQuickCustOpen = 0
           End If
        End If
    Else ' saudi post address
       If Len(RTrim(txtSaudiPostStreetName)) <> 0 Then
          If arabicCharFound(txtSaudiPostStreetName) Then
             MsgBox errNoArabicAddress(UserLang)
             txtSaudiPostStreetName.SetFocus
             validateFrmQuickCustOpen = 1
             Exit Function
          Else
             validateFrmQuickCustOpen = 0
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
           validateFrmQuickCustOpen = 1
           Exit Function
        End If
    End If
 End If
    
 If optPrimaryElectronIntlCardYes.Value = True Then
     If Len(RTrim(txtPrimaryElectronIntlCardName)) = 0 Then
        MsgBox errSpacePrimaryIntlCardName(UserLang)
        txtPrimaryElectronIntlCardName.SetFocus
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
     End If

     If checkForSpecialChars(Trim(txtPrimaryElectronIntlCardName)) = False Then
        MsgBox errInvalidChar(UserLang)
        txtPrimaryElectronIntlCardName.SetFocus
        validateFrmQuickCustOpen = 1
        Exit Function
     Else
        validateFrmQuickCustOpen = 0
     End If
 End If
End Function

Public Sub formatNewQuickCustomerRequest()
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
    quickCustInfo.samaSubCategory = "00"
    quickCustInfo.screenSetNo = "7" ' for quick customer

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
       'quickCustInfo.address1 = Format(txtSaudiPostGPSNo, "!@@@@@") & "-" & txtSaudiPostStreetName
       quickCustInfo.address1 = Format(txtSaudiPostGPSNo, "!@@@@@") & " " & txtSaudiPostStreetName
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
    
    currentAccInfo = Space(12)
    If optCurrentAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvQuickCustMsg.currentAccInfo)) = 0 Then
             formatQuickCurrentAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatQuickCurrentAcc "0", "U"
          End If
       Else
          formatQuickCurrentAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvQuickCustMsg.currentAccInfo)) <> 0 Then
          formatQuickCurrentAcc "1", "U"
       End If
    End If
       
   If optChipCard = True Then
      quickCustInfo.cardType = "S"
   Else
      quickCustInfo.cardType = "I"
   End If
   If optPrimaryElectronIntlCardYes Then
      quickCustInfo.electronIntlRequired = "1"
   Else
      quickCustInfo.electronIntlRequired = "0"
   End If
   quickCustInfo.electronIntlName = txtPrimaryElectronIntlCardName
   quickCustInfo.internalCustomer = "0"

End Sub
Public Sub formatQuickCurrentAcc(droppedFlag As String, creationOrUpdate As String)

currentAccInfo = "008" & Left$(cmbCurrentAcCurrency.text, 2) & _
                      Left$(cmbCurrentAcStatus.text, 2) & _
                      Left$(cmbCurrentAcStmtFreq.text, 2) & _
                      IIf(optCurrentAcCheckBookYes, "1", "0") & droppedFlag & _
                      creationOrUpdate

End Sub

Public Sub unloadSupForms()
  Dim tCustNo As String
  
  If recvQuickCustMsg.newOrUpdate = "N" And _
     recvSuperDecisionMsg.status = "000" Then
     If accOpenCardPrintAllowed = True Then
        If optCurrentAcYes Then
           printAccOpeningCard
        End If
     End If
  End If
  
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

Private Sub txtPrimaryElectronIntlCardName_GotFocus()
'   txtPrimaryElectronIntlCardName = UCase(txtEngFirstName) & " " & UCase(txtEnglish2ndName) & " " & UCase(txtEngLastName)
'   If Len(txtPrimaryElectronIntlCardName) > 26 Then
'      txtPrimaryElectronIntlCardName = UCase(txtEngFirstName)
'   End If
End Sub

Private Sub txtPrimaryElectronIntlCardName_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
      KeyAscii = 0
      MsgBox (errNoArabicCharacters(UserLang))
      Exit Sub
   End If
End Sub
Public Sub acceptTpin()
   frmAcceptTPin.txtCustNo = gCustNo
   
   If quickCustInfo.langPref = "0" Then
      frmAcceptTPin.txtCustName = frmQuickCustOpen.txtArabShortName
   Else
      frmAcceptTPin.txtCustName = frmQuickCustOpen.txtEngShortName
   End If
   frmAcceptTPin.tag = "C"
   If tpinMandatoryAtBranch = False Then
      frmAcceptTPin.cmdCancel.Enabled = True
   Else
      frmAcceptTPin.cmdCancel.Enabled = False
   End If
   frmAcceptTPin.Show vbModal
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
Public Sub approveTpinSelect()
    frmAcceptTPin.txtCustNo = recvSuperDecisionMsg.custNo
   
   If quickCustInfo.langPref = "0" Then
      frmAcceptTPin.txtCustName = frmQuickCustOpen.txtArabShortName
   Else
      frmAcceptTPin.txtCustName = frmQuickCustOpen.txtEngShortName
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

Private Sub txtPrimaryElectronIntlCardName_LostFocus()
    txtPrimaryElectronIntlCardName = UCase(txtPrimaryElectronIntlCardName)
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
