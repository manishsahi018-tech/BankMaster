VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmIndividualSaudi2 
   BackColor       =   &H00BFD87E&
   Caption         =   " Reference/ Legal Representative Details"
   ClientHeight    =   8190
   ClientLeft      =   195
   ClientTop       =   1695
   ClientWidth     =   11775
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8190
   ScaleWidth      =   11775
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   420
      Left            =   8355
      TabIndex        =   95
      ToolTipText     =   "Next Page"
      Top             =   7395
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Frame frameRefFor 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   405
      Left            =   120
      TabIndex        =   87
      Top             =   2160
      Width           =   11775
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
         TabIndex        =   93
         Tag             =   "11775"
         ToolTipText     =   "Minor"
         Top             =   120
         Width           =   825
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
         TabIndex        =   92
         Tag             =   "11775"
         ToolTipText     =   "Incompetent person"
         Top             =   120
         Width           =   2055
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
         TabIndex        =   91
         Tag             =   "11775"
         ToolTipText     =   "Veiled woman"
         Top             =   120
         Width           =   1590
      End
      Begin VB.CheckBox chkBlind 
         BackColor       =   &H00BFD87E&
         Caption         =   "Blind Person"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   90
         Tag             =   "11775"
         ToolTipText     =   "Blind person"
         Top             =   120
         Width           =   1455
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
         TabIndex        =   89
         Tag             =   "11775"
         ToolTipText     =   "Minor with special circumstances"
         Top             =   120
         Width           =   3255
      End
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
         TabIndex        =   88
         Tag             =   "11775"
         ToolTipText     =   "Mentally Disabled"
         Top             =   120
         Width           =   1905
      End
   End
   Begin VB.Frame frameCustNameDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   120
      TabIndex        =   78
      Top             =   2835
      Width           =   11775
      Begin VB.TextBox txtArabFirstName 
         Height          =   315
         Left            =   1215
         MaxLength       =   15
         TabIndex        =   2
         Tag             =   "11775"
         Top             =   210
         Width           =   1815
      End
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   9
         Tag             =   "11775"
         Top             =   600
         Width           =   1575
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   4
         Tag             =   "11775"
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   11
         Tag             =   "11775"
         Top             =   600
         Width           =   3015
      End
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   10
         Tag             =   "11775"
         Top             =   600
         Width           =   1695
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3135
         MaxLength       =   15
         TabIndex        =   8
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   7
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8655
         MaxLength       =   30
         TabIndex        =   6
         Tag             =   "11775"
         Top             =   225
         Width           =   3015
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   5
         Tag             =   "11775"
         Top             =   225
         Width           =   1695
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3135
         MaxLength       =   15
         TabIndex        =   3
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
         TabIndex        =   85
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
         TabIndex        =   84
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
         TabIndex        =   83
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
         TabIndex        =   82
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
         TabIndex        =   81
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
         TabIndex        =   80
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
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Update"
      Height          =   420
      Left            =   4350
      TabIndex        =   50
      ToolTipText     =   "Update"
      Top             =   7395
      Width           =   1335
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "&Add"
      Height          =   420
      Left            =   3000
      TabIndex        =   49
      ToolTipText     =   "Add"
      Top             =   7395
      Width           =   1350
   End
   Begin VB.ComboBox cmbRefType 
      Height          =   315
      Left            =   1320
      TabIndex        =   48
      Top             =   6840
      Width           =   3105
   End
   Begin VB.CommandButton cmdPrevPage 
      Caption         =   "&Previous Page"
      Height          =   420
      Left            =   5685
      TabIndex        =   51
      ToolTipText     =   "Previous Page"
      Top             =   7395
      Width           =   1335
   End
   Begin VB.CommandButton cmdNextPage 
      Caption         =   "&Next Page"
      Height          =   420
      Left            =   7020
      TabIndex        =   52
      ToolTipText     =   "Next Page"
      Top             =   7395
      Width           =   1335
   End
   Begin VB.Frame frameIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   855
      Left            =   120
      TabIndex        =   65
      Top             =   3840
      Width           =   11775
      Begin VB.TextBox txtIdNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   4530
         MaxLength       =   15
         TabIndex        =   13
         Tag             =   "11775"
         Top             =   -15
         Width           =   1695
      End
      Begin VB.ComboBox cmbIdType 
         Height          =   315
         Left            =   1170
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   -15
         Width           =   1815
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   7920
         TabIndex        =   14
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   -15
         Width           =   1815
      End
      Begin VB.Frame frameIdDateType 
         BackColor       =   &H00BFD87E&
         Height          =   405
         Left            =   1170
         TabIndex        =   66
         Tag             =   "11775"
         Top             =   390
         Width           =   2055
         Begin VB.OptionButton optIdDateGregorian 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   255
            Left            =   840
            TabIndex        =   16
            TabStop         =   0   'False
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   1095
         End
         Begin VB.OptionButton optIdDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   15
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   735
         End
      End
      Begin VB.ComboBox cmbIdIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4560
         TabIndex        =   17
         Tag             =   "11775"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5160
         TabIndex        =   18
         Tag             =   "11775"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.TextBox txtIdIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   5775
         MaxLength       =   4
         TabIndex        =   19
         Tag             =   "11775"
         Top             =   480
         Width           =   600
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7920
         TabIndex        =   20
         Tag             =   "11775"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8520
         TabIndex        =   21
         Tag             =   "11775"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.TextBox txtIdExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9120
         MaxLength       =   4
         TabIndex        =   22
         Tag             =   "11775"
         Top             =   465
         Width           =   615
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
         Left            =   3240
         TabIndex        =   72
         Tag             =   "11775"
         Top             =   30
         Width           =   1215
      End
      Begin VB.Label lblIssueDate 
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
         TabIndex        =   71
         Tag             =   "11775"
         Top             =   525
         Width           =   1215
      End
      Begin VB.Label lblExpiryDate 
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
         Left            =   6465
         TabIndex        =   70
         Tag             =   "11775"
         Top             =   510
         Width           =   1095
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
         Left            =   6480
         TabIndex        =   69
         Tag             =   "11775"
         Top             =   30
         Width           =   1095
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
         TabIndex        =   68
         Tag             =   "11775"
         Top             =   0
         Width           =   1215
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
         TabIndex        =   67
         Tag             =   "11775"
         Top             =   510
         Width           =   1215
      End
   End
   Begin VB.Frame frameCustomerContactInfo 
      Appearance      =   0  'Flat
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   120
      TabIndex        =   1
      Top             =   4920
      Width           =   11775
      Begin VB.TextBox txtSaudiPostStreetName 
         Height          =   285
         Left            =   3840
         MaxLength       =   24
         TabIndex        =   27
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.TextBox txtSaudiPostUnit 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   30
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostZipCode 
         Height          =   285
         Left            =   5880
         MaxLength       =   5
         TabIndex        =   33
         Tag             =   "11775"
         Top             =   720
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostGPSNo 
         Height          =   285
         Left            =   1200
         MaxLength       =   5
         TabIndex        =   26
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtSaudiPostAdditionalNo 
         Height          =   285
         Left            =   7080
         MaxLength       =   4
         TabIndex        =   34
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
         TabIndex        =   96
         Tag             =   "11775"
         Top             =   -120
         Width           =   2430
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
            TabIndex        =   24
            Tag             =   "2430"
            ToolTipText     =   "Saudi Post"
            Top             =   180
            Width           =   1155
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
            TabIndex        =   23
            Tag             =   "2430"
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
         TabIndex        =   25
         Tag             =   "11775"
         Top             =   360
         Width           =   3015
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   4425
         MaxLength       =   30
         TabIndex        =   28
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
         TabIndex        =   29
         Tag             =   "11775"
         Top             =   720
         Width           =   975
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2865
         TabIndex        =   31
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   720
         Width           =   2055
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6210
         TabIndex        =   32
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8250
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   705
         Width           =   2235
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   37
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5385
         MaxLength       =   10
         TabIndex        =   40
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   8
         TabIndex        =   45
         Tag             =   "11775"
         Top             =   1560
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3000
         MaxLength       =   4
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6810
         MaxLength       =   4
         TabIndex        =   41
         Tag             =   "11775"
         Text            =   " "
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8655
         MaxLength       =   10
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9975
         MaxLength       =   4
         TabIndex        =   44
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8235
         MaxLength       =   30
         TabIndex        =   47
         Tag             =   "11775"
         Top             =   1560
         Width           =   3420
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1185
         MaxLength       =   4
         TabIndex        =   36
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
         TabIndex        =   53
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   1560
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8250
         MaxLength       =   4
         TabIndex        =   42
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4905
         MaxLength       =   4
         TabIndex        =   39
         Tag             =   "11775"
         Text            =   "01"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4905
         MaxLength       =   10
         TabIndex        =   46
         Tag             =   "11775"
         Top             =   1560
         Width           =   1335
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
         TabIndex        =   102
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
         TabIndex        =   101
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
         TabIndex        =   100
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
         TabIndex        =   99
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
         TabIndex        =   98
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
         TabIndex        =   97
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
         Left            =   15
         TabIndex        =   64
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
         TabIndex        =   63
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
         TabIndex        =   62
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
         TabIndex        =   61
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
         TabIndex        =   60
         Tag             =   "11775"
         Top             =   720
         Width           =   735
      End
      Begin VB.Label lblPhoneOff 
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
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label lblPhoneRes 
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
         TabIndex        =   58
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
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   1545
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
         Left            =   7485
         TabIndex        =   56
         Tag             =   "11775"
         Top             =   1080
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
         TabIndex        =   55
         Tag             =   "11775"
         Top             =   1560
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
         TabIndex        =   54
         Tag             =   "11775"
         Top             =   1560
         Width           =   495
      End
   End
   Begin MSFlexGridLib.MSFlexGrid referenceInfoGrid 
      Height          =   1380
      Left            =   45
      TabIndex        =   0
      Top             =   555
      Width           =   11700
      _ExtentX        =   20638
      _ExtentY        =   2434
      _Version        =   393216
      Rows            =   50
      Cols            =   5
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      BackColorBkg    =   12572798
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblReferenceFor 
      BackColor       =   &H00BFD87E&
      Caption         =   "Reference For"
      BeginProperty Font 
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
      TabIndex        =   94
      Tag             =   "11775"
      Top             =   1920
      Width           =   1575
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
      TabIndex        =   86
      Top             =   7560
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblRefType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Reference Type"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   435
      Left            =   120
      TabIndex        =   77
      Tag             =   "11775"
      Top             =   6825
      Width           =   975
   End
   Begin VB.Label lblRefDetails 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Reference Details"
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
      Left            =   90
      TabIndex        =   76
      Top             =   120
      Width           =   2175
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      Index           =   2
      X1              =   60
      X2              =   11580
      Y1              =   6210
      Y2              =   6210
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Saudi"
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
      Left            =   7080
      TabIndex        =   75
      Top             =   120
      Width           =   3885
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
      Left            =   3720
      TabIndex        =   74
      Top             =   120
      Width           =   2925
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   2640
      TabIndex        =   73
      Top             =   120
      Width           =   780
   End
   Begin VB.Shape Shape2 
      Height          =   345
      Left            =   60
      Top             =   90
      Width           =   11610
   End
   Begin VB.Shape Shape1 
      Height          =   555
      Left            =   60
      Top             =   7335
      Width           =   11580
   End
End
Attribute VB_Name = "frmIndividualSaudi2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public referenceAddAction As Boolean
Public referenceUpdateAction As Boolean
Public customerLang As String
Private Sub cmbDeliveryCity_KeyPress(KeyAscii As Integer)
  If KeyAscii > 128 Then
     KeyAscii = 0
     MsgBox (errNoArabicCharacters(UserLang))
     Exit Sub
  End If
End Sub

Public Sub unloadSupForms()
  Dim tCustNo As String
  If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
     tCustNo = Space(7)
  Else
     tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
  End If
  Unload Me
  Unload frmIndividualSaudi
  Unload frmIndividualSaudi2
  Unload frmSupervisorApproval
  frmEnquiry.readPendingList "00000", "S", tCustNo
  frmSupervisorApproval.Show
End Sub

Private Sub cmdCancel_Click()
   Unload Me
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

Private Sub cmdAdd_Click()
    Dim tmpReferenceNo As String
    Dim custNo As String
    Dim recdIdNo As String, recdIdType As String
    Dim tmpRow As Integer
    Dim tmpIdType As String, tmpIdNo As String
    
    If Not supervisorAction And Not searchAction And Not custHistoryAction Then
       If validateIndividualReference = 1 Then
          Exit Sub
       End If
       
       recdIdType = Mid$(cmbIdType.text, 1, 1)
       recdIdNo = Format(txtIdNo, "!@@@@@@@@@@@@@@@")
       
       tmpRow = 1
       Do While True
          referenceInfoGrid.Row = tmpRow
          referenceInfoGrid.Col = 0
          custNo = referenceInfoGrid.text
          referenceInfoGrid.Col = 1
          tmpReferenceNo = referenceInfoGrid.text
          If Len(RTrim(tmpReferenceNo)) = 0 Then
             Exit Do
          End If
          referenceInfoGrid.Col = 4
          tmpIdType = Mid$(referenceInfoGrid.text, 1, 1)
          tmpIdNo = Mid$(referenceInfoGrid.text, 3)
       
          If recdIdType = tmpIdType And Trim(recdIdNo) = Trim(tmpIdNo) Then
             MsgBox errIdAlreadySelected(UserLang) & tmpReferenceNo & errCannotSelectAgain(UserLang)
             Exit Sub
          End If
          tmpRow = tmpRow + 1
        Loop
       
       If Len(RTrim(gDateTime)) = 0 Then
          gDateTime = getUnixDateTime
          If Trim(gDateTime) = "ERROR" Then
             gDateTime = Space(14)
             Exit Sub
          End If
       End If
       If activityFlag = "P" And Len(RTrim(branchActionDateTime)) = 0 Then
          branchActionDateTime = getUnixDateTime
          If Trim(branchActionDateTime) = "ERROR" Then
             branchActionDateTime = Space(14)
             Exit Sub
          End If
       End If
       
       referenceAddAction = True
       referenceUpdateAction = False
       createReference
       If recvCustomerMsg.status <> "000" Then
          'arul note - arithmetic expression using strings
          noOfReference = noOfReference - 1
       End If
    End If
   
 End Sub

Private Sub cmdNextPage_Click()
'  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
'    If validateIndividualReference = 1 Then
'       Exit Sub
'    End If
'  End If
  If screenSetNo = "1" Then
    frmIndividualSaudiAcctInfo.Show
  ElseIf screenSetNo = "2" Then
    frmIndividualOthers2.Show
  End If
End Sub

Private Sub cmdPrevPage_Click()
    Me.Hide
End Sub

Public Function validateIndividualReference() As Integer
     Dim tIssueDate As String, tDob As String, tCrDate As String
     Dim tExpiryDate As String
     Dim tCode As String
     Dim tmpCode As String
     Dim mQry As String
     Dim i As Integer
     
     validateIndividualReference = 0
     
        If Len(RTrim(frmIndividualSaudi2.cmbIdType.text)) = 0 Then
           MsgBox errSpaceIdType(UserLang)
           frmIndividualSaudi2.cmbIdType.SetFocus
           validateIndividualReference = 1
           Exit Function
        Else
           validateIndividualReference = 0
        End If
        
        If Len(RTrim(frmIndividualSaudi2.txtIdNo)) = 0 Then
           MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
           frmIndividualSaudi2.txtIdNo.SetFocus
           validateIndividualReference = 1
           Exit Function
        Else
           validateIndividualReference = 0
        End If
        
        If Mid$(frmIndividualSaudi2.cmbIdType.text, 1, 1) = "I" Or _
           Mid$(frmIndividualSaudi2.cmbIdType.text, 1, 1) = "Q" Then
           If Len(Trim(frmIndividualSaudi2.txtIdNo)) <> 10 Then
              MsgBox errInvalidId(UserLang)
              frmIndividualSaudi2.txtIdNo.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
           
           If Mid$(cmbIdType.text, 1, 1) = "I" Then
              If Mid$(txtIdNo, 1, 1) <> "1" Then
                 MsgBox errInvalidIdCategory(UserLang)
                 txtIdNo.SetFocus
                 validateIndividualReference = 1
                 Exit Function
              Else
                 validateIndividualReference = 0
              End If
           ElseIf Mid$(cmbIdType.text, 1, 1) = "Q" Then
              If Mid$(txtIdNo, 1, 1) <> "2" And _
                 Mid$(txtIdNo, 1, 1) <> "3" And _
                 Mid$(txtIdNo, 1, 1) <> "5" Then
                 MsgBox errInvalidIdCategory(UserLang)
                 txtIdNo.SetFocus
                 validateIndividualReference = 1
                 Exit Function
              Else
                 validateIndividualReference = 0
              End If
           End If
           
           If validIdNumber(Trim(frmIndividualSaudi2.txtIdNo)) = False Then
              MsgBox errInvalidIdNo(UserLang)
              frmIndividualSaudi2.txtIdNo.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
        
        If customerLang = "0" Then ' ARABIC
           If Len(RTrim(frmIndividualSaudi2.txtArabFirstName)) = 0 And _
              Len(RTrim(frmIndividualSaudi2.txtArabic2ndName)) = 0 And _
              Len(RTrim(frmIndividualSaudi2.txtArabic3rdName)) = 0 And _
              Len(RTrim(frmIndividualSaudi2.txtArabLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 frmIndividualSaudi2.txtArabFirstName.SetFocus
                 validateIndividualReference = 1
                 Exit Function
           Else
                 validateIndividualReference = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi2.txtArabShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmIndividualSaudi2.txtArabShortName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        Else
           If Len(RTrim(frmIndividualSaudi2.txtEngFirstName)) = 0 And _
              Len(RTrim(frmIndividualSaudi2.txtEnglish2ndName)) = 0 And _
              Len(RTrim(frmIndividualSaudi2.txtEnglish3rdName)) = 0 And _
              Len(RTrim(frmIndividualSaudi2.txtEngLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 frmIndividualSaudi2.txtEngFirstName.SetFocus
                 validateIndividualReference = 1
                 Exit Function
           Else
                 validateIndividualReference = 0
           End If
           
           If Len(RTrim(frmIndividualSaudi2.txtEngShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmIndividualSaudi2.txtEngShortName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
        
        If Len(RTrim(txtArabFirstName)) > 0 Then
           If englishCharFound(txtArabFirstName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabFirstName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtArabic2ndName)) > 0 Then
           If englishCharFound(txtArabic2ndName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabic2ndName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtArabic3rdName)) > 0 Then
           If englishCharFound(txtArabic3rdName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabic3rdName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtArabLastName)) > 0 Then
           If englishCharFound(txtArabLastName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabLastName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtArabShortName)) > 0 Then
           If englishCharFound(txtArabShortName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabShortName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtEngFirstName)) > 0 Then
           If arabicCharFound(txtEngFirstName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngFirstName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtEnglish2ndName)) > 0 Then
           If arabicCharFound(txtEnglish2ndName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEnglish2ndName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtEnglish3rdName)) > 0 Then
           If arabicCharFound(txtEnglish3rdName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEnglish3rdName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtEngLastName)) > 0 Then
           If arabicCharFound(txtEngLastName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngLastName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
    
        If Len(RTrim(txtEngShortName)) > 0 Then
           If arabicCharFound(txtEngShortName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngShortName.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
        
        If Len(RTrim(frmIndividualSaudi2.cmbIdIssueDate.text)) = 0 Or _
           Len(RTrim(frmIndividualSaudi2.cmbIdIssueMonth.text)) = 0 Or _
           Len(RTrim(frmIndividualSaudi2.txtIdIssueYear)) = 0 Then
           MsgBox errSpaceIssueDate(UserLang)
           frmIndividualSaudi2.cmbIdIssueDate.SetFocus
           validateIndividualReference = 1
           Exit Function
        Else
           validateIndividualReference = 0
        End If
        
        If Len(RTrim(frmIndividualSaudi2.cmbIdExpiryDate.text)) = 0 Or _
           Len(RTrim(frmIndividualSaudi2.cmbIdExpiryMonth.text)) = 0 Or _
           Len(RTrim(frmIndividualSaudi2.txtIdExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           frmIndividualSaudi2.cmbIdExpiryDate.SetFocus
           validateIndividualReference = 1
           Exit Function
        Else
           validateIndividualReference = 0
        End If
        
        tIssueDate = CStr(frmIndividualSaudi2.txtIdIssueYear) & _
                     CStr(frmIndividualSaudi2.cmbIdIssueMonth.text) & _
                     CStr(frmIndividualSaudi2.cmbIdIssueDate.text)
        tExpiryDate = CStr(frmIndividualSaudi2.txtIdExpiryYear) & _
                      CStr(frmIndividualSaudi2.cmbIdExpiryMonth.text) & _
                      CStr(frmIndividualSaudi2.cmbIdExpiryDate.text)
                      
        If frmIndividualSaudi2.optIdDateGregorian.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualSaudi2.cmbIdIssueDate.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
           
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualSaudi2.cmbIdExpiryDate.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        End If
                     
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           frmIndividualSaudi2.txtIdExpiryYear.SetFocus
           validateIndividualReference = 1
           Exit Function
        Else
           validateIndividualReference = 0
        End If
        
        If optIdDateHijri = True Then
           If tExpiryDate < currentHijriDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              frmIndividualSaudi2.txtIdExpiryYear.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
              validateIndividualReference = 0
           End If
        Else
           If tExpiryDate < currentGregDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              frmIndividualSaudi2.txtIdExpiryYear.SetFocus
              validateIndividualReference = 1
              Exit Function
           Else
             validateIndividualReference = 0
           End If
        End If
        
        If Len(RTrim(frmIndividualSaudi2.cmbIdIssuedAt.text)) = 0 Then
           MsgBox errSpaceIdIssuedAt(UserLang)
           frmIndividualSaudi2.cmbIdIssuedAt.SetFocus
           validateIndividualReference = 1
           Exit Function
        Else
           validateIndividualReference = 0
        End If
        
    If customerLang = "0" Then  ' ARABIC
       If frmIndividualSaudi2.optPoBox = True Then
          If Len(RTrim(frmIndividualSaudi2.txtAddress1)) <> 0 Then
             If englishCharFound(frmIndividualSaudi2.txtAddress1) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualSaudi2.txtAddress1.SetFocus
                validateIndividualReference = 1
                Exit Function
             Else
                validateIndividualReference = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualSaudi2.txtAddress2)) <> 0 Then
             If englishCharFound(frmIndividualSaudi2.txtAddress2) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualSaudi2.txtAddress2.SetFocus
                validateIndividualReference = 1
                Exit Function
             Else
                validateIndividualReference = 0
             End If
          End If
      Else ' saudi post
         If Len(RTrim(frmIndividualSaudi2.txtSaudiPostStreetName)) <> 0 Then
             If englishCharFound(frmIndividualSaudi2.txtSaudiPostStreetName) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualSaudi2.txtSaudiPostStreetName.SetFocus
                validateIndividualReference = 1
                Exit Function
             Else
                validateIndividualReference = 0
             End If
          End If
      End If
         
      If englishCharFound(frmIndividualSaudi2.cmbCity.text) Then
         On Error Resume Next
         Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" + _
                              frmIndividualSaudi2.cmbCity.text & "'")
         If rs.recordCount > 0 Then
            frmIndividualSaudi2.cmbCity.text = rs(0)
         Else
            MsgBox errLangNotmatching(UserLang)
            frmIndividualSaudi2.cmbCity.SetFocus
            validateIndividualReference = 1
            Exit Function
         End If
      End If
    Else ' language is english
       If frmIndividualSaudi2.optPoBox = True Then
          If Len(RTrim(frmIndividualSaudi2.txtAddress1)) <> 0 Then
             If arabicCharFound(frmIndividualSaudi2.txtAddress1) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualSaudi2.txtAddress1.SetFocus
                validateIndividualReference = 1
                Exit Function
             Else
                validateIndividualReference = 0
             End If
          End If
         
          If Len(RTrim(frmIndividualSaudi2.txtAddress2)) <> 0 Then
             If arabicCharFound(frmIndividualSaudi2.txtAddress2) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualSaudi2.txtAddress2.SetFocus
                validateIndividualReference = 1
                Exit Function
             Else
                validateIndividualReference = 0
             End If
          End If
     Else ' saudi post address
         If Len(RTrim(frmIndividualSaudi2.txtSaudiPostStreetName)) <> 0 Then
             If arabicCharFound(frmIndividualSaudi2.txtSaudiPostStreetName) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualSaudi2.txtSaudiPostStreetName.SetFocus
                validateIndividualReference = 1
                Exit Function
             Else
                validateIndividualReference = 0
             End If
          End If
      End If
      If arabicCharFound(frmIndividualSaudi2.cmbCity.text) Then
         On Error Resume Next
         Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" + _
                            frmIndividualSaudi2.cmbCity.text & "'")
         If rs.recordCount > 0 Then
            frmIndividualSaudi2.cmbCity.text = rs(0)
         Else
            MsgBox errLangNotmatching(UserLang)
            frmIndividualSaudi2.cmbCity.SetFocus
            validateIndividualReference = 1
            Exit Function
         End If
     End If
   End If
    
   If frmIndividualSaudi2.optPoBox = True Then
      If Len(RTrim(frmIndividualSaudi2.txtAddress1)) = 0 Or _
         Len(RTrim(frmIndividualSaudi2.txtPOBox)) = 0 Or _
         Len(RTrim(frmIndividualSaudi2.txtPinCode)) = 0 Or _
         Len(RTrim(frmIndividualSaudi2.cmbCity.text)) = 0 Then
          
         MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
         frmIndividualSaudi2.txtAddress1.SetFocus
         validateIndividualReference = 1
         Exit Function
      Else
         validateIndividualReference = 0
      End If
   Else ' saudi post address
      If Len(RTrim(frmIndividualSaudi2.txtSaudiPostGPSNo)) = 0 Or _
         Len(RTrim(frmIndividualSaudi2.txtSaudiPostStreetName)) = 0 Or _
         Len(RTrim(frmIndividualSaudi2.txtSaudiPostUnit)) = 0 Or _
         Len(RTrim(frmIndividualSaudi2.cmbCity.text)) = 0 Or _
         Len(RTrim(frmIndividualSaudi2.txtSaudiPostZipCode)) = 0 Or _
         Len(RTrim(frmIndividualSaudi2.txtSaudiPostAdditionalNo)) = 0 Then
         MsgBox errSpaceSaudiAddress(UserLang) '"Saudi Postal address should be entered.. Please enter"
         frmIndividualSaudi2.txtSaudiPostGPSNo.SetFocus
         validateIndividualReference = 1
         Exit Function
      Else
         validateIndividualReference = 0
      End If
   End If
    
    If Len(RTrim(frmIndividualSaudi2.txtResPhoneNo)) = 0 And _
       Len(RTrim(frmIndividualSaudi2.txtOffPhoneNo)) = 0 And _
       Len(RTrim(frmIndividualSaudi2.txtFaxNo)) = 0 And _
       Len(RTrim(frmIndividualSaudi2.txtMobileNo)) = 0 Then
       
       MsgBox errSpacePhone(UserLang) ' "Atleast one Phone number should be entered..."
       frmIndividualSaudi2.txtOffPhoneNo.SetFocus
       validateIndividualReference = 1
       Exit Function
    Else
       validateIndividualReference = 0
    End If
End Function

Private Sub cmdUpdate_Click()
    If Not supervisorAction And Not searchAction And Not custHistoryAction Then
       If validateIndividualReference = 1 Then
          Exit Sub
       End If
       
       If Len(RTrim(gDateTime)) = 0 Then
          gDateTime = getUnixDateTime
          If Trim(gDateTime) = "ERROR" Then
             gDateTime = Space(14)
             Exit Sub
          End If
       End If
       If activityFlag = "P" And Len(RTrim(branchActionDateTime)) = 0 Then
          branchActionDateTime = getUnixDateTime
          If Trim(branchActionDateTime) = "ERROR" Then
             branchActionDateTime = Space(14)
             Exit Sub
          End If
       End If
       referenceAddAction = False
       referenceUpdateAction = True
       createReference
       If recvCustomerMsg.status <> "000" Then
          'arul note - arithmetic expression using strings
          noOfReference = noOfReference - 1
       End If
    End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim tCode As String
   Dim mQry As String, rowTitle(8) As String
   Dim tListIndex As Integer
   Dim tWidth As Integer, colwidth(8) As Integer
   
   If UserLang = ARABIC Then
      ChangePositions frmIndividualSaudi2, 11800
      frmIndividualSaudi2.Hide
      frmIndividualSaudi2.RightToLeft = True
   End If
   
   lblMainCategoryDesc = mainCategoryDesc
   lblSubCategoryDesc = subCategoryDesc
   
   If screenSetNo = "1" Then
      If frmIndividualSaudi.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
      frmIndividualSaudi2.Caption = frmIndividualSaudi2Caption(1, UserLang)
      lblRefDetails.Caption = frmIndividualSaudi2Caption(0, UserLang)
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthers.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
      frmIndividualSaudi2.Caption = frmIndividualSaudi2Caption(60, UserLang)
      lblRefDetails.Caption = frmIndividualSaudi2Caption(60, UserLang)
   End If
   
   
   lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
'   lblSubCategory.Caption = frmIndividualOthers1Caption(42, UserLang)
   lblReferenceFor.Caption = frmIndividualSaudi2Caption(42, UserLang)
   chkBlind.Caption = frmIndividualSaudi2Caption(31, UserLang)
   chkVeiled.Caption = frmIndividualSaudi2Caption(32, UserLang)
   chkIncptPerson.Caption = frmIndividualSaudi2Caption(33, UserLang)
   chkMinor.Caption = frmIndividualSaudi2Caption(34, UserLang)
   chkMinorSpl.Caption = frmIndividualSaudi2Caption(35, UserLang)
   chkMentDisabled.Caption = frmIndividualSaudi2Caption(36, UserLang)
   lblIdType.Caption = frmIndividualSaudi2Caption(12, UserLang)
   lblIdNumber.Caption = frmIndividualSaudi2Caption(2, UserLang)
   lblIdIssuedAt.Caption = frmIndividualSaudi2Caption(3, UserLang)
   lblIdDateType.Caption = frmIndividualSaudi2Caption(4, UserLang)
   optIdDateHijri.Caption = frmIndividualSaudi2Caption(5, UserLang)
   optIdDateGregorian.Caption = frmIndividualSaudi2Caption(6, UserLang)
   lblIssueDate.Caption = frmIndividualSaudi2Caption(7, UserLang)
   lblExpiryDate.Caption = frmIndividualSaudi2Caption(8, UserLang)
   
   lblFirstName.Caption = frmIndividualSaudiCaption(18, UserLang)
   lbl2ndName.Caption = frmIndividualSaudiCaption(19, UserLang)
   lbl3rdName.Caption = frmIndividualSaudiCaption(20, UserLang)
   lblLastName.Caption = frmIndividualSaudiCaption(21, UserLang)
   
   lblArabicName.Caption = frmIndividualSaudi2Caption(9, UserLang)
   lblShortName.Caption = frmIndividualSaudi2Caption(10, UserLang)
   lblEnglishName.Caption = frmIndividualSaudi2Caption(11, UserLang)
   
   lblAddress1.Caption = frmIndividualSaudi2Caption(13, UserLang)
   lblPOBox.Caption = frmIndividualSaudi2Caption(15, UserLang)
   lblCity.Caption = frmIndividualSaudi2Caption(16, UserLang)
   lblZipCode.Caption = frmIndividualSaudi2Caption(17, UserLang)
   lblCountry.Caption = frmIndividualSaudi2Caption(18, UserLang)
   lblPhoneOff.Caption = frmIndividualSaudi2Caption(19, UserLang)
   lblPhoneRes.Caption = frmIndividualSaudi2Caption(20, UserLang)
   lblFax.Caption = frmIndividualSaudi2Caption(21, UserLang)
   lblMobile.Caption = frmIndividualSaudi2Caption(22, UserLang)
   lblPager.Caption = frmIndividualSaudi2Caption(23, UserLang)
   lblEmail.Caption = frmIndividualSaudi2Caption(24, UserLang)
   lblRefType.Caption = frmIndividualSaudi2Caption(27, UserLang)
   
   cmdAdd.Caption = frmIndividualSaudi2Caption(28, UserLang)
   cmdUpdate.Caption = frmIndividualSaudi2Caption(29, UserLang)
   cmdPrevPage.Caption = frmIndividualSaudi2Caption(30, UserLang)
   cmdNextPage.Caption = frmIndividualSaudi2Caption(43, UserLang)
   
   lblAddrType.Caption = saudiPostAddressCaption(0, UserLang)
   optPoBox.Caption = saudiPostAddressCaption(1, UserLang)
   optSaudiPost.Caption = saudiPostAddressCaption(2, UserLang)
   lblSaudiPostGPSNo.Caption = saudiPostAddressCaption(3, UserLang)
   lblSaudiPostStreetName.Caption = saudiPostAddressCaption(4, UserLang)
   lblSaudiPostUnit.Caption = saudiPostAddressCaption(5, UserLang)
   lblSaudiPostZipCode.Caption = saudiPostAddressCaption(6, UserLang)

   
    colwidth(0) = 1200
    colwidth(1) = 500
    colwidth(2) = 3500
    colwidth(3) = 1500
    colwidth(4) = 2500

    
'    rowTitle(0) = "Customer #"
'    rowTitle(1) = "Reference #"
'    rowTitle(2) = "Reference name"
'    rowTitle(3) = "Customer branch code"
'    rowTitle(4) = "IdType-id Number"
          
    referenceInfoGrid.Clear
    referenceInfoGrid.Row = 0
    referenceInfoGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 4
      referenceInfoGrid.Col = i
      If UserLang = ARABIC Then
         referenceInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         referenceInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      referenceInfoGrid.text = frmIndividualSaudi2Caption(i + 37, UserLang)
      referenceInfoGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    referenceInfoGrid.Width = tWidth + 100
   
   If InStr(recvLoginMsg.authorityLevel, "~01") <> 0 Then
      frmIndividualSaudi2.cmdAdd.Enabled = True
   Else
      frmIndividualSaudi2.cmdAdd.Enabled = False
   End If
   
   If supervisorAction Or searchAction Or custHistoryAction Then
      frmIndividualSaudi2.cmdAdd.Enabled = False
      frmIndividualSaudi2.cmdUpdate.Enabled = False
      frmIndividualSaudi2.frameRefFor.Enabled = False
      frmIndividualSaudi2.frameCustNameDetails.Enabled = False
      frmIndividualSaudi2.frameCustomerContactInfo.Enabled = False
      frmIndividualSaudi2.cmbRefType.Enabled = False
      frmIndividualSaudi2.frameIdInfo.Enabled = False
      If custHistoryAction Then
         lblHistory.Visible = True
         lblHistory.Refresh
      Else
         lblHistory.Visible = False
      End If
   Else
      frmIndividualSaudi2.cmdAdd.Enabled = True
      frmIndividualSaudi2.cmdUpdate.Enabled = True
      'frmIndividualSaudi2.frameRefFor.Enabled = True
      frmIndividualSaudi2.cmbRefType.Enabled = True
      frmIndividualSaudi2.frameCustNameDetails.Enabled = True
      frmIndividualSaudi2.frameIdInfo.Enabled = True
      frmIndividualSaudi2.frameCustomerContactInfo.Enabled = True
   End If
  
    mQry = "select * from idinfo"
    Set rs = db.OpenRecordset(mQry)
    tListIndex = 0
    If rs.recordCount > 0 Then
       rs.MoveFirst
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

    cmbIdIssueDate.Clear
    cmbIdIssueMonth.Clear
    cmbIdExpiryDate.Clear
    cmbIdExpiryMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbIdIssueDate.AddItem num
       cmbIdExpiryDate.AddItem num
       If i < 13 Then
          cmbIdIssueMonth.AddItem num
          cmbIdExpiryMonth.AddItem num
       End If
    Next

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
      Set rs = db.OpenRecordset("select englishname,arabicname,telareacode from cityinfo " & _
                    " where citycode = '" & tCode & "'")
      If rs.recordCount > 0 Then
         If UserLang = ENGLISH Then
            cmbIdIssuedAt.text = rs(0)
            cmbCity.text = rs(0)
         Else
            cmbIdIssuedAt.text = rs(1)
            cmbCity.text = rs(1)
         End If
      Else
         cmbIdIssuedAt.text = ""
         frmIndividualSaudi2.cmbCity.text = ""
      End If
  End If
  
  Set rs = db.OpenRecordset("select * from countryinfo") 'Nad Removed nationality from here
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
   
   mQry = "select * from referencetypeinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbRefType.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbRefType.AddItem rs("referencetype") & "-" & rs("englishname")
           Else
              cmbRefType.AddItem rs("referencetype") & "-" & rs("arabicname")
           End If
           rs.MoveNext
        Loop
        cmbRefType.ListIndex = 0
    End If
    
   cmdUpdate.Enabled = False ' added by rajesh on 9 dec 2003 to avoid duplicate error
                             ' while supervisor approval
    

End Sub

Public Sub createReference()
    Dim strmsglen As String
   
    formatNewReferenceRequest
       
    SendMsg = IndividualSaudiRefInfo.msgLen & IndividualSaudiRefInfo.service & gBranchCode & IndividualSaudiRefInfo.userId & IndividualSaudiRefInfo.dateTime & _
              IndividualSaudiRefInfo.creationOrUpdate & IndividualSaudiRefInfo.NewOrUpdateFlag & _
              IndividualSaudiRefInfo.bmUpdateStatus & IndividualSaudiRefInfo.customerNo & IndividualSaudiRefInfo.refNo & IndividualSaudiRefInfo.referenceReqdFor & IndividualSaudiRefInfo.referenceType & IndividualSaudiRefInfo.supervisorId & IndividualSaudiRefInfo.custBranchCode & IndividualSaudiRefInfo.idType & IndividualSaudiRefInfo.idNo & _
              IndividualSaudiRefInfo.idIssuedAt & IndividualSaudiRefInfo.idDateType & IndividualSaudiRefInfo.idIssueDateH & IndividualSaudiRefInfo.idIssueDateG & IndividualSaudiRefInfo.idExpiryDateH & IndividualSaudiRefInfo.idExpiryDateG & _
              IndividualSaudiRefInfo.aFirstName & IndividualSaudiRefInfo.a2ndName & IndividualSaudiRefInfo.a3rdName & IndividualSaudiRefInfo.aLastName & _
              IndividualSaudiRefInfo.aShortName & IndividualSaudiRefInfo.eFirstName & IndividualSaudiRefInfo.e2ndName & IndividualSaudiRefInfo.e3rdName & IndividualSaudiRefInfo.eLastName & IndividualSaudiRefInfo.eShortName & IndividualSaudiRefInfo.address1 & IndividualSaudiRefInfo.address2 & _
              IndividualSaudiRefInfo.poBox & IndividualSaudiRefInfo.cityName & IndividualSaudiRefInfo.zipCode & IndividualSaudiRefInfo.country & IndividualSaudiRefInfo.telOffAreaCode & IndividualSaudiRefInfo.telOffNo & IndividualSaudiRefInfo.telOffExt & _
              IndividualSaudiRefInfo.telHomeAreaCode & IndividualSaudiRefInfo.telHomeNo & IndividualSaudiRefInfo.telHomeExt & IndividualSaudiRefInfo.faxAreaCode & IndividualSaudiRefInfo.faxNo & IndividualSaudiRefInfo.faxExt & IndividualSaudiRefInfo.mobileNo & IndividualSaudiRefInfo.pagerNo & _
              IndividualSaudiRefInfo.eMail & IndividualSaudiRefInfo.addressType & _
              IndividualSaudiRefInfo.custOpenSource & IndividualSaudiRefInfo.branchCSOId & _
              IndividualSaudiRefInfo.branchActionDateTime & IndividualSaudiRefInfo.activityFlag & Space(50)
           
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmIndividualSaudi2.MousePointer = vbHourglass
    frmIndividualSaudi2.cmdAdd.Enabled = False
    frmIndividualSaudi2.cmdUpdate.Enabled = False
    frmIndividualSaudi2.cmdPrevPage.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    
    If retStatus = LocalCommsError Then
       LoadError = True
       frmIndividualSaudi2.cmdAdd.Enabled = True
       'frmIndividualSaudi2.cmdUpdate.Enabled = True commented by rajesh to avoid duplicates
                                                  ' during supervisor approval
       frmIndividualSaudi2.cmdPrevPage.Enabled = True
       frmIndividualSaudi2.MousePointer = vbDefault
       Exit Sub
    End If
    
    frmIndividualSaudi2.cmdAdd.Enabled = True
    'frmIndividualSaudi2.cmdUpdate.Enabled = True commented by rajesh to avoid duplicates
                                                  ' during supervisor approval
    frmIndividualSaudi2.cmdPrevPage.Enabled = True
    frmIndividualSaudi2.cmdNextPage.Enabled = True
    frmIndividualSaudi2.MousePointer = vbDefault
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
    Else
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
       Exit Sub
    End If
    
    'this is for clearing the form
    For i = 0 To Screen.ActiveForm.Controls.Count - 1
        If TypeOf Screen.ActiveForm.Controls(i) Is TextBox Then
           Screen.ActiveForm.Controls(i).text = ""
        End If
        If TypeOf Screen.ActiveForm.Controls(i) Is CheckBox Then
           Screen.ActiveForm.Controls(i).Value = 0
        End If
    Next
    If screenSetNo = "1" Then
       txtOffPhoneCityCode = frmIndividualSaudi.txtOffPhoneCityCode
       txtResPhoneCityCode = frmIndividualSaudi.txtResPhoneCityCode
       txtFaxCityCode = frmIndividualSaudi.txtFaxCityCode
       
       chkBlind.Value = frmIndividualSaudi.chkBlind.Value
       chkIncptPerson.Value = frmIndividualSaudi.chkIncptPerson.Value
       chkMentDisabled.Value = frmIndividualSaudi.chkMentDisabled.Value
       chkMinor.Value = frmIndividualSaudi.chkMinor.Value
       chkMinorSpl.Value = frmIndividualSaudi.chkMinorSpl.Value
       chkVeiled.Value = frmIndividualSaudi.chkVeiled.Value
    ElseIf screenSetNo = "2" Then
       txtOffPhoneCityCode = frmIndividualOthers.txtOffPhoneCityCode
       txtResPhoneCityCode = frmIndividualOthers.txtResPhoneCityCode
       txtFaxCityCode = frmIndividualOthers.txtFaxCityCode
       chkMinor.Value = vbChecked
    End If
    
    referenceKeyUserId = IndividualSaudiRefInfo.userId
    referenceKeyBranch = gBranchCode
    referenceKeyDateTime = IndividualSaudiRefInfo.dateTime
    
    referenceInfoGrid.Row = Val(IndividualSaudiRefInfo.refNo)
    referenceInfoGrid.Col = 0
    referenceInfoGrid.CellAlignment = flexAlignLeftCenter
    referenceInfoGrid.text = IndividualSaudiRefInfo.customerNo
    referenceInfoGrid.Col = 1
    referenceInfoGrid.CellAlignment = flexAlignLeftCenter
    referenceInfoGrid.text = IndividualSaudiRefInfo.refNo
    referenceInfoGrid.Col = 2
    referenceInfoGrid.CellAlignment = flexAlignLeftCenter
    If Len(Trim(IndividualSaudiRefInfo.aShortName)) <> 0 Then
       referenceInfoGrid.text = IndividualSaudiRefInfo.aShortName
    Else
       referenceInfoGrid.text = IndividualSaudiRefInfo.eShortName
    End If
    referenceInfoGrid.Col = 3
    referenceInfoGrid.CellAlignment = flexAlignLeftCenter
    referenceInfoGrid.text = IndividualSaudiRefInfo.custBranchCode
    referenceInfoGrid.Col = 4
    referenceInfoGrid.CellAlignment = flexAlignLeftCenter
    referenceInfoGrid.text = IndividualSaudiRefInfo.idType & "-" & IndividualSaudiRefInfo.idNo
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameCustNameDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameCustomerContactInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameIdInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
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
   
   'cmbCity.Enabled = False
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

Private Sub referenceInfoGrid_DblClick()
    Dim referenceNo As String
    Dim custNo As String
    referenceInfoGrid.Col = 0
    custNo = referenceInfoGrid.text
    referenceInfoGrid.Col = 1
    referenceNo = referenceInfoGrid.text
    If Len(RTrim(referenceNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    fetchReferenceInfo custNo, referenceNo
End Sub

Private Sub referenceInfoGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtAddress1_KeyPress(KeyAscii As Integer)
   If customerLang = "0" Then
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
     
   If customerLang = "0" Then
      txtAddress2.Alignment = 1
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
      txtAddress2.Alignment = 0
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
      If Len(RTrim(txtEngShortName)) > 0 Then
         tmpStr = Trim(txtEngShortName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngShortName = tmpStr
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
           MsgBox errInvalidTelNo(UserLang) '"Telephone number should contain atleast 7 digits..Please RE-enter"
           txtFaxNo.SetFocus
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
           txtAddress1.SetFocus
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
             txtIdIssueYear.text = ""
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

Private Sub txtPoBox_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
Private Sub txtZipCode_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
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

Public Sub formatNewReferenceRequest()
    Dim mQry As String
    Dim tmpStr As String
 
    IndividualSaudiRefInfo.msgLen = Space(6) ' to be calculated
    IndividualSaudiRefInfo.service = "71"  ' 71 is for New Reference creation
    'IndividualSaudiRefInfo.userId = gUserId

    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 0
       IndividualSaudiRefInfo.userId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       IndividualSaudiRefInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       If screenSetNo = "1" Then
          IndividualSaudiRefInfo.supervisorId = Left(recvSaudiIndividualMsg.supervisorId, 10)
       Else
          IndividualSaudiRefInfo.supervisorId = Left(recvOtherIndividualMsg.supervisorId, 10)
       End If
       IndividualSaudiRefInfo.creationOrUpdate = "U"
    Else
       IndividualSaudiRefInfo.userId = gUserId
       IndividualSaudiRefInfo.dateTime = gDateTime
       IndividualSaudiRefInfo.creationOrUpdate = "C"
       IndividualSaudiRefInfo.supervisorId = Space(10)
    End If
    If screenSetNo = "1" Then
       If updateAction Or _
          (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
          IndividualSaudiRefInfo.NewOrUpdateFlag = "U"
       Else
          IndividualSaudiRefInfo.NewOrUpdateFlag = "N"
       End If
    ElseIf screenSetNo = "2" Then
       If updateAction Or _
          (tellerAction And recvOtherIndividualMsg.newOrUpdate = "U") Then
          IndividualSaudiRefInfo.NewOrUpdateFlag = "U"
       Else
          IndividualSaudiRefInfo.NewOrUpdateFlag = "N"
       End If
    End If
    If phoneCustOpenAction Then
       IndividualSaudiRefInfo.bmUpdateStatus = "4"  ' 4 for "Entered through phone"
       IndividualSaudiRefInfo.custOpenSource = "P"  ' customer opened through phone
    Else
       IndividualSaudiRefInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
       IndividualSaudiRefInfo.custOpenSource = "B"  ' customer opened through Branch
       'If tellerAction And recvSaudiIndividualMsg.custOpenSource = "P" Then
       If tellerAction And activityFlag = "P" Then
          IndividualSaudiRefInfo.branchCSOId = gUserId
          IndividualSaudiRefInfo.branchActionDateTime = branchActionDateTime
       Else
          IndividualSaudiRefInfo.branchCSOId = Space(10)
          IndividualSaudiRefInfo.branchActionDateTime = Space(14)
       End If
    End If
    
    If IndividualSaudiRefInfo.NewOrUpdateFlag = "N" Then
       IndividualSaudiRefInfo.customerNo = Space(7)
    Else
       If screenSetNo = "1" Then
          IndividualSaudiRefInfo.customerNo = frmIndividualSaudi.txtCustomerNo
       ElseIf screenSetNo = "2" Then
          IndividualSaudiRefInfo.customerNo = frmIndividualOthers.txtCustomerNo
       End If
    End If
    IndividualSaudiRefInfo.homeBranch = gBranchCode
    
    If screenSetNo = "1" Then
       IndividualSaudiRefInfo.custBranchCode = Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4)
    ElseIf screenSetNo = "2" Then
       IndividualSaudiRefInfo.custBranchCode = Mid$(frmIndividualOthers.cmbBranchCode, 1, 4)
    End If
    
    If referenceAddAction Then
          'arul note - arithmetic expression using strings
       noOfReference = noOfReference + 1
       IndividualSaudiRefInfo.creationOrUpdate = "C"
       If updateAction Then
          IndividualSaudiRefInfo.NewOrUpdateFlag = "N"
       End If
    ElseIf referenceUpdateAction Then
       IndividualSaudiRefInfo.refNo = recvReferenceDetailMsg.referenceNo
       If updateAction Then
          IndividualSaudiRefInfo.creationOrUpdate = "C"
       Else
          IndividualSaudiRefInfo.creationOrUpdate = "U"
       End If
    End If
    
    
'    If updateAction Then
'       noOfReference = recvReferenceDetailMsg.referenceNo
'    ElseIf Not tellerAction Then
'       noOfReference = noOfReference + 1
'    ElseIf referenceAddAction Then
'       noOfReference = noOfReference + 1
'       individualSaudiInfo.creationOrUpdate = "C"
'    End If
    
    If Not referenceUpdateAction Then
       IndividualSaudiRefInfo.refNo = Format(noOfReference, "0000")
    End If
    
'   0 - Blind person                     -> pers reference  - 0
'   1 - Veiled woman                     -> pers reference  - 0
'   2 - Incompetent person               -> legal rep       - 1
'   3 - Minor                            -> guardian        - 3
'   4 - Minor with special circumstances -> foster parents  - 2
'   5 - Mentally disabled                -> guardian        - 3
    
    IndividualSaudiRefInfo.referenceReqdFor = "0000000000"
    
    If frmIndividualSaudi2.chkBlind.Value = 1 Then
       Mid$(IndividualSaudiRefInfo.referenceReqdFor, 1, 1) = "1"
    End If
    If frmIndividualSaudi2.chkVeiled.Value = 1 Then
       Mid$(IndividualSaudiRefInfo.referenceReqdFor, 2, 1) = "1"
    End If
    If frmIndividualSaudi2.chkIncptPerson.Value = 1 Then
       Mid$(IndividualSaudiRefInfo.referenceReqdFor, 3, 1) = "1"
    End If
    If frmIndividualSaudi2.chkMinor.Value = 1 Then
       Mid$(IndividualSaudiRefInfo.referenceReqdFor, 4, 1) = "1"
    End If
    If frmIndividualSaudi2.chkMinorSpl.Value = 1 Then
       Mid$(IndividualSaudiRefInfo.referenceReqdFor, 5, 1) = "1"
    End If
    If frmIndividualSaudi2.chkMentDisabled.Value = 1 Then
       Mid$(IndividualSaudiRefInfo.referenceReqdFor, 6, 1) = "1"
    End If
  
'    0 - Personal reference
'    1 - Legal representative
'    2 - Foster parents
'    3 - Guardian
    
    IndividualSaudiRefInfo.referenceType = Mid$(frmIndividualSaudi2.cmbRefType, 2, 1)
    
    IndividualSaudiRefInfo.idNo = frmIndividualSaudi2.txtIdNo
    IndividualSaudiRefInfo.idType = frmIndividualSaudi2.cmbIdType.text
    
    If frmIndividualSaudi2.optIdDateHijri Then
       IndividualSaudiRefInfo.idDateType = "0"
       IndividualSaudiRefInfo.idExpiryDateH = Format(frmIndividualSaudi2.txtIdExpiryYear, "0000") + Format(frmIndividualSaudi2.cmbIdExpiryMonth, "00") + Format(frmIndividualSaudi2.cmbIdExpiryDate, "00")
       IndividualSaudiRefInfo.idIssueDateH = Format(frmIndividualSaudi2.txtIdIssueYear, "0000") + Format(frmIndividualSaudi2.cmbIdIssueMonth.text, "00") + Format(frmIndividualSaudi2.cmbIdIssueDate, "00")
       IndividualSaudiRefInfo.idIssueDateG = Space(8)
       IndividualSaudiRefInfo.idExpiryDateG = Space(8)
    Else
       IndividualSaudiRefInfo.idDateType = "1"
       IndividualSaudiRefInfo.idExpiryDateG = Format(frmIndividualSaudi2.txtIdExpiryYear, "0000") + Format(frmIndividualSaudi2.cmbIdExpiryMonth, "00") + Format(frmIndividualSaudi2.cmbIdExpiryDate, "00")
       IndividualSaudiRefInfo.idIssueDateG = Format(frmIndividualSaudi2.txtIdIssueYear, "0000") + Format(frmIndividualSaudi2.cmbIdIssueMonth.text, "00") + Format(frmIndividualSaudi2.cmbIdIssueDate, "00")
       IndividualSaudiRefInfo.idIssueDateH = Space(8)
       IndividualSaudiRefInfo.idExpiryDateH = Space(8)
    End If
    
    IndividualSaudiRefInfo.idIssuedAt = frmIndividualSaudi2.cmbIdIssuedAt.text
    
    'If frmIndividualSaudi.optLangArabic Then
    '   IndividualSaudiRefInfo.langPref = "0"
    'Else
    '   IndividualSaudiRefInfo.langPref = "1"
    'End If
'    If Len(RTrim(frmIndividualSaudi2.txtArabFirstName)) <> 0 Then
'        IndividualSaudiRefInfo.aFirstName = frmIndividualSaudi2.txtArabFirstName
'    Else
'        IndividualSaudiRefInfo.aFirstName = Space(15)
'    End If
    
    IndividualSaudiRefInfo.aFirstName = frmIndividualSaudi2.txtArabFirstName
    IndividualSaudiRefInfo.a2ndName = frmIndividualSaudi2.txtArabic2ndName
    IndividualSaudiRefInfo.a3rdName = frmIndividualSaudi2.txtArabic3rdName
    IndividualSaudiRefInfo.aLastName = frmIndividualSaudi2.txtArabLastName
    IndividualSaudiRefInfo.aShortName = frmIndividualSaudi2.txtArabShortName
    IndividualSaudiRefInfo.eFirstName = frmIndividualSaudi2.txtEngFirstName
    IndividualSaudiRefInfo.e2ndName = frmIndividualSaudi2.txtEnglish2ndName
    IndividualSaudiRefInfo.e3rdName = frmIndividualSaudi2.txtEnglish3rdName
    IndividualSaudiRefInfo.eLastName = frmIndividualSaudi2.txtEngLastName
    IndividualSaudiRefInfo.eShortName = frmIndividualSaudi2.txtEngShortName
    
    If frmIndividualSaudi2.optSaudiPost = True Then
       IndividualSaudiRefInfo.addressType = "1"
'       IndividualSaudiRefInfo.address1 = Format(frmIndividualSaudi2.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
'                                         frmIndividualSaudi2.txtSaudiPostStreetName
       IndividualSaudiRefInfo.address1 = Format(frmIndividualSaudi2.txtSaudiPostGPSNo, "!@@@@@") & " " & _
                                         frmIndividualSaudi2.txtSaudiPostStreetName
       IndividualSaudiRefInfo.poBox = frmIndividualSaudi2.txtSaudiPostUnit
       IndividualSaudiRefInfo.zipCode = Format(frmIndividualSaudi2.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                                     frmIndividualSaudi2.txtSaudiPostAdditionalNo
       IndividualSaudiRefInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       IndividualSaudiRefInfo.addressType = "0"
       IndividualSaudiRefInfo.address1 = frmIndividualSaudi2.txtAddress1
       IndividualSaudiRefInfo.address2 = frmIndividualSaudi2.txtAddress2
       IndividualSaudiRefInfo.poBox = frmIndividualSaudi2.txtPOBox
       IndividualSaudiRefInfo.zipCode = frmIndividualSaudi2.txtPinCode
       IndividualSaudiRefInfo.country = Left$(frmIndividualSaudi2.cmbCountry.text, 3)
    End If
    
    If UserLang = ENGLISH And _
       customerLang = "0" Then ' ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                             frmIndividualSaudi2.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          IndividualSaudiRefInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
       Else
          IndividualSaudiRefInfo.cityName = frmIndividualSaudi2.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       customerLang = "1" Then ' ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmIndividualSaudi2.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          IndividualSaudiRefInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
       Else
          IndividualSaudiRefInfo.cityName = frmIndividualSaudi2.cmbCity.text
       End If
    Else
        IndividualSaudiRefInfo.cityName = frmIndividualSaudi2.cmbCity.text
    End If
    
    IndividualSaudiRefInfo.telOffAreaCode = frmIndividualSaudi2.txtOffPhoneCityCode
    IndividualSaudiRefInfo.telOffNo = frmIndividualSaudi2.txtOffPhoneNo
    IndividualSaudiRefInfo.telOffExt = frmIndividualSaudi2.txtOffPhoneExt
    IndividualSaudiRefInfo.telHomeAreaCode = frmIndividualSaudi2.txtResPhoneCityCode
    IndividualSaudiRefInfo.telHomeNo = frmIndividualSaudi2.txtResPhoneNo
    IndividualSaudiRefInfo.telHomeExt = frmIndividualSaudi2.txtResPhoneExt
    IndividualSaudiRefInfo.faxAreaCode = frmIndividualSaudi2.txtFaxCityCode
    IndividualSaudiRefInfo.faxNo = frmIndividualSaudi2.txtFaxNo
    IndividualSaudiRefInfo.faxExt = frmIndividualSaudi2.txtFaxExt
    If Len(RTrim(frmIndividualSaudi2.txtMobileNo)) <> 0 Then
       IndividualSaudiRefInfo.mobileNo = frmIndividualSaudi2.txtMobileAreaCode & frmIndividualSaudi2.txtMobileNo
    Else
       IndividualSaudiRefInfo.mobileNo = Space(10)
    End If
    IndividualSaudiRefInfo.pagerNo = frmIndividualSaudi2.txtPagerNo
    IndividualSaudiRefInfo.eMail = frmIndividualSaudi2.txtEmailAddress
    
    If activityFlag = "P" Then
       IndividualSaudiRefInfo.activityFlag = "P"
    Else
       IndividualSaudiRefInfo.activityFlag = Space(1)
    End If
End Sub

Public Sub fetchReferenceInfo(custNo As String, referenceNo As String)
    Dim strmsglen As String, tCode As String, tuserId As String, tDateTime As String, tBranchCode As String
    Dim recType As String * 2
   
    If searchAction Then
       recType = "06"
       tuserId = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    Else
       recType = "05"
       tuserId = referenceKeyUserId
       tBranchCode = referenceKeyBranch
       tDateTime = referenceKeyDateTime
    End If
'    ElseIf custHistoryAction Then
'       recType = "01"
'       frmCustUpdateHistory.custHistoryGrid.Col = 0
'       tBranchCode = Format(frmCustUpdateHistory.custHistoryGrid.Text, "0000")
'       frmCustUpdateHistory.custHistoryGrid.Col = 1
'       tUserId = Format(frmCustUpdateHistory.custHistoryGrid.Text, "!@@@@@@@@@@")
'       frmCustUpdateHistory.custHistoryGrid.Col = 2
'       tmpStr = frmCustUpdateHistory.custHistoryGrid.Text
'       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
'                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
'       tDateTime = Format(tDateTime, "00000000000000")
'    Else
'        recType = "01"
'        frmSupervisorApproval.MSFlexGrid1.Col = 0
'        tUserId = Format(frmSupervisorApproval.MSFlexGrid1.Text, "!@@@@@@@@@@")
'        frmSupervisorApproval.MSFlexGrid1.Col = 1
'        tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.Text, "00000000000000")
'        tBranchCode = gBranchCode
'    End If
        
    SendMsg = "000057" & "77" & gBranchCode & recType & tBranchCode & tuserId & tDateTime & Format(custNo, "!@@@@@@@@@@@@@@") & referenceNo
    frmIndividualSaudi2.MousePointer = vbHourglass
    'frmindividualsaudi2.cmdAdd.Enabled = False
    'frmindividualsaudi2.cmdUpdate.Enabled = False
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmIndividualSaudi2.MousePointer = vbDefault
'       frmindividualsaudi2.cmdDone.Enabled = True
'       frmindividualsaudi2.cmdNextJoint.Enabled = True
       Exit Sub
    End If
    frmIndividualSaudi2.MousePointer = vbDefault
'    frmindividualsaudi2.cmdDone.Enabled = True
'    frmindividualsaudi2.cmdNextJoint.Enabled = True
    parseReferenceDetailResponse
    If recvReferenceDetailMsg.status = "000" Then
       fillReferenceForm
       If Not supervisorAction And Not searchAction And Not custHistoryAction Then
          cmdUpdate.Enabled = True
       End If
    Else
       If UserLang = ARABIC Then
          MsgBox recvReferenceDetailMsg.aRemarks
       Else
          MsgBox recvReferenceDetailMsg.eRemarks
       End If
       CSD_mdiForm.staticStatus.Panels(3).text = "  "
       Exit Sub
    End If  ' recvreferencedetailmsg.status = "000"
    
    CSD_mdiForm.staticStatus.Panels(3).text = "   "

End Sub

Public Sub parseReferenceDetailResponse()
    Dim pos As Integer
    
    pos = 1
    
    recvReferenceDetailMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvReferenceDetailMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvReferenceDetailMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvReferenceDetailMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvReferenceDetailMsg.custNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvReferenceDetailMsg.referenceNo = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvReferenceDetailMsg.referenceReqdFor = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvReferenceDetailMsg.referenceType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvReferenceDetailMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvReferenceDetailMsg.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvReferenceDetailMsg.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvReferenceDetailMsg.idType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvReferenceDetailMsg.idNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.idIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvReferenceDetailMsg.idDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvReferenceDetailMsg.idIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvReferenceDetailMsg.idIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvReferenceDetailMsg.idExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvReferenceDetailMsg.idExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvReferenceDetailMsg.aFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.a2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.a3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.aLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.aShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvReferenceDetailMsg.eFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.e2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.e3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.eLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvReferenceDetailMsg.eShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvReferenceDetailMsg.address1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvReferenceDetailMsg.address2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvReferenceDetailMsg.poBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvReferenceDetailMsg.cityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvReferenceDetailMsg.zipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvReferenceDetailMsg.country = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvReferenceDetailMsg.telOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvReferenceDetailMsg.telOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvReferenceDetailMsg.telOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvReferenceDetailMsg.telHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvReferenceDetailMsg.telHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvReferenceDetailMsg.telHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvReferenceDetailMsg.faxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvReferenceDetailMsg.faxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvReferenceDetailMsg.faxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvReferenceDetailMsg.mobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvReferenceDetailMsg.pagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvReferenceDetailMsg.eMail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvReferenceDetailMsg.addressType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvReferenceDetailMsg.custOpenSource = Mid$(RecvStr, pos, 1)
    pos = pos + 1

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
  If customerLang = "0" Then ' ARABIC
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

Public Sub fillReferenceForm()
    Dim tCode As String
    Dim tmpStr As String
    Dim i As Integer

    tCode = recvReferenceDetailMsg.idType
    If tCode <> "" Then
       For i = 0 To frmIndividualSaudi2.cmbIdType.ListCount
           If Mid(frmIndividualSaudi2.cmbIdType.List(i), 1, 1) = tCode Then
              frmIndividualSaudi2.cmbIdType.ListIndex = i
              Exit For
           End If
       Next i
     Else
       frmIndividualSaudi2.cmbIdType.ListIndex = -1
     End If
     If i > frmIndividualSaudi2.cmbIdType.ListCount Then
       frmIndividualSaudi2.cmbIdType.ListIndex = -1
     End If
    
    frmIndividualSaudi2.txtIdNo = recvReferenceDetailMsg.idNo
    frmIndividualSaudi2.cmbIdIssuedAt.text = recvReferenceDetailMsg.idIssuedAt
    tCode = recvReferenceDetailMsg.referenceReqdFor
    If Mid$(tCode, 1, 1) = "1" Then
       frmIndividualSaudi2.chkBlind.Value = vbChecked
    End If
    If Mid$(tCode, 2, 1) = "1" Then
       frmIndividualSaudi2.chkVeiled.Value = vbChecked
    End If
    If Mid$(tCode, 3, 1) = "1" Then
       frmIndividualSaudi2.chkIncptPerson.Value = vbChecked
    End If
    If Mid$(tCode, 4, 1) = "1" Then
       frmIndividualSaudi2.chkMinor.Value = vbChecked
    End If
    If Mid$(tCode, 5, 1) = "1" Then
       frmIndividualSaudi2.chkMinorSpl.Value = vbChecked
    End If
    If Mid$(tCode, 6, 1) = "1" Then
       frmIndividualSaudi2.chkMentDisabled.Value = vbChecked
    End If
    
    If recvReferenceDetailMsg.idDateType = "0" Or _
       recvReferenceDetailMsg.idDateType = " " Then
       frmIndividualSaudi2.optIdDateHijri.Value = True
       frmIndividualSaudi2.cmbIdIssueDate.text = _
               Right$(recvReferenceDetailMsg.idIssueDateH, 2)
       frmIndividualSaudi2.cmbIdIssueMonth.text = _
               Mid$(recvReferenceDetailMsg.idIssueDateH, 5, 2)
       frmIndividualSaudi2.txtIdIssueYear = Mid$(recvReferenceDetailMsg.idIssueDateH, 1, 4)
       frmIndividualSaudi2.cmbIdExpiryDate.text = _
               Right$(recvReferenceDetailMsg.idExpiryDateH, 2)
       frmIndividualSaudi2.cmbIdExpiryMonth.text = _
               Mid$(recvReferenceDetailMsg.idExpiryDateH, 5, 2)
       frmIndividualSaudi2.txtIdExpiryYear = Mid$(recvReferenceDetailMsg.idExpiryDateH, 1, 4)
    Else
       frmIndividualSaudi2.optIdDateGregorian.Value = True
       frmIndividualSaudi2.cmbIdIssueDate.text = _
               Right$(recvReferenceDetailMsg.idIssueDateG, 2)
       frmIndividualSaudi2.cmbIdIssueMonth.text = _
               Mid$(recvReferenceDetailMsg.idIssueDateG, 5, 2)
       frmIndividualSaudi2.txtIdIssueYear = Mid$(recvReferenceDetailMsg.idIssueDateG, 1, 4)
       frmIndividualSaudi2.cmbIdExpiryDate.text = _
               Right$(recvReferenceDetailMsg.idExpiryDateG, 2)
       frmIndividualSaudi2.cmbIdExpiryMonth.text = _
               Mid$(recvReferenceDetailMsg.idExpiryDateG, 5, 2)
       frmIndividualSaudi2.txtIdExpiryYear = Mid$(recvReferenceDetailMsg.idExpiryDateG, 1, 4)
    End If
      
    frmIndividualSaudi2.txtArabFirstName = _
          recvReferenceDetailMsg.aFirstName
    frmIndividualSaudi2.txtArabic2ndName = _
          recvReferenceDetailMsg.a2ndName
    frmIndividualSaudi2.txtArabic3rdName = _
          recvReferenceDetailMsg.a3rdName
    frmIndividualSaudi2.txtArabLastName = _
          recvReferenceDetailMsg.aLastName
    frmIndividualSaudi2.txtArabShortName = _
          recvReferenceDetailMsg.aShortName
      
    frmIndividualSaudi2.txtEngFirstName = _
          recvReferenceDetailMsg.eFirstName
    frmIndividualSaudi2.txtEnglish2ndName = _
          recvReferenceDetailMsg.e2ndName
    frmIndividualSaudi2.txtEnglish3rdName = _
          recvReferenceDetailMsg.e3rdName
    frmIndividualSaudi2.txtEngLastName = _
          recvReferenceDetailMsg.eLastName
    frmIndividualSaudi2.txtEngShortName = _
          recvReferenceDetailMsg.eShortName
             
   If recvReferenceDetailMsg.addressType = "1" Then
       frmIndividualSaudi2.optSaudiPost.Value = True
       frmIndividualSaudi2.txtSaudiPostGPSNo = Mid$(recvReferenceDetailMsg.address1, 1, 5)
       frmIndividualSaudi2.txtSaudiPostStreetName = Mid$(recvReferenceDetailMsg.address1, 7)
       frmIndividualSaudi2.txtSaudiPostUnit = recvReferenceDetailMsg.poBox
       frmIndividualSaudi2.txtSaudiPostZipCode = Mid$(recvReferenceDetailMsg.zipCode, 1, 5)
       frmIndividualSaudi2.txtSaudiPostAdditionalNo = Mid$(recvReferenceDetailMsg.zipCode, 7)
    Else
       frmIndividualSaudi2.optPoBox.Value = True
       frmIndividualSaudi2.txtAddress1 = recvReferenceDetailMsg.address1
       frmIndividualSaudi2.txtAddress2 = recvReferenceDetailMsg.address2
       frmIndividualSaudi2.txtPOBox = recvReferenceDetailMsg.poBox
       frmIndividualSaudi2.txtPinCode = recvReferenceDetailMsg.zipCode
       tCode = Mid$(recvReferenceDetailMsg.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmIndividualSaudi2.cmbCountry.ListCount
              If Mid(frmIndividualSaudi2.cmbCountry.List(i), 1, 3) = tCode Then
                 frmIndividualSaudi2.cmbCountry.ListIndex = i 'RTrim(frmindividualsaudi2.cmbCountry.List(i))
                 Exit For
              End If
          Next i
       Else
          frmIndividualSaudi2.cmbCountry.ListIndex = -1
       End If
       If i > frmIndividualSaudi2.cmbCountry.ListCount Then
          frmIndividualSaudi2.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    frmIndividualSaudi2.cmbCity.text = recvReferenceDetailMsg.cityName
    If Len(RTrim(recvReferenceDetailMsg.telOffAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualSaudi2.txtOffPhoneCityCode = recvReferenceDetailMsg.telOffAreaCode
    End If
    frmIndividualSaudi2.txtOffPhoneNo = recvReferenceDetailMsg.telOffNo
    frmIndividualSaudi2.txtOffPhoneExt = recvReferenceDetailMsg.telOffExt
    If Len(RTrim(recvReferenceDetailMsg.telHomeAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualSaudi2.txtResPhoneCityCode = recvReferenceDetailMsg.telHomeAreaCode
    End If
    frmIndividualSaudi2.txtResPhoneNo = recvReferenceDetailMsg.telHomeNo
    frmIndividualSaudi2.txtResPhoneExt = recvReferenceDetailMsg.telHomeExt
    If Len(RTrim(recvReferenceDetailMsg.faxAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualSaudi2.txtFaxCityCode = recvReferenceDetailMsg.faxAreaCode
    End If
    frmIndividualSaudi2.txtFaxNo = recvReferenceDetailMsg.faxNo
    frmIndividualSaudi2.txtFaxExt = recvReferenceDetailMsg.faxExt
    frmIndividualSaudi2.txtMobileAreaCode = Mid$(recvReferenceDetailMsg.mobileNo, 1, 2)
    frmIndividualSaudi2.txtMobileNo = Mid$(recvReferenceDetailMsg.mobileNo, 3)
    frmIndividualSaudi2.txtPagerNo = recvReferenceDetailMsg.pagerNo
    frmIndividualSaudi2.txtEmailAddress = recvReferenceDetailMsg.eMail
    tCode = recvReferenceDetailMsg.referenceType
    If tCode <> "" Then
       For i = 0 To frmIndividualSaudi2.cmbRefType.ListCount
           If Mid(frmIndividualSaudi2.cmbRefType.List(i), 2, 1) = tCode Then
              frmIndividualSaudi2.cmbRefType.ListIndex = i
              Exit For
           End If
           Next i
    Else
       frmIndividualSaudi2.cmbRefType.ListIndex = -1
    End If
    If i > frmIndividualSaudi2.cmbRefType.ListCount Then
       frmIndividualSaudi2.cmbRefType.text = tCode & "- Not defined in local"
    End If

End Sub
