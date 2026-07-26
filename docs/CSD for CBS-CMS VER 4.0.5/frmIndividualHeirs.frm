VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmIndividualHeirs 
   BackColor       =   &H00BFD87E&
   Caption         =   "Heirs/Proxy Details"
   ClientHeight    =   8190
   ClientLeft      =   1215
   ClientTop       =   1125
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
   Begin VB.Frame frameProxyNo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   120
      TabIndex        =   97
      Top             =   6840
      Width           =   9495
      Begin VB.TextBox txtProxyNo 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1350
         MaxLength       =   15
         TabIndex        =   104
         Tag             =   "9495"
         Top             =   45
         Width           =   1695
      End
      Begin VB.Frame frameProxyDateType 
         BackColor       =   &H00BFD87E&
         Height          =   405
         Left            =   4320
         TabIndex        =   101
         Tag             =   "9495"
         Top             =   -45
         Width           =   1635
         Begin VB.OptionButton optProxyDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Greg"
            Height          =   255
            Left            =   840
            TabIndex        =   103
            TabStop         =   0   'False
            Tag             =   "1635"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   750
         End
         Begin VB.OptionButton optProxyDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   102
            Tag             =   "1635"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   735
         End
      End
      Begin VB.ComboBox cmbProxyIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7410
         TabIndex        =   100
         Tag             =   "9495"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.ComboBox cmbProxyIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8010
         TabIndex        =   99
         Tag             =   "9495"
         Text            =   "01"
         Top             =   45
         Width           =   615
      End
      Begin VB.TextBox txtProxyIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   8625
         MaxLength       =   4
         TabIndex        =   98
         Tag             =   "9495"
         Top             =   60
         Width           =   600
      End
      Begin VB.Label lblProxyNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Proxy Number"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   107
         Tag             =   "9495"
         Top             =   90
         Width           =   1215
      End
      Begin VB.Label lblProxyIssueDate 
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
         Left            =   6135
         TabIndex        =   106
         Tag             =   "9495"
         Top             =   75
         Width           =   1215
      End
      Begin VB.Label lblProxyDateType 
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
         Left            =   3150
         TabIndex        =   105
         Tag             =   "9495"
         Top             =   75
         Width           =   1035
      End
   End
   Begin VB.Frame frameHeirType 
      BackColor       =   &H00BFD87E&
      Height          =   435
      Left            =   1305
      TabIndex        =   93
      Top             =   6240
      Width           =   2055
      Begin VB.OptionButton optProxy 
         BackColor       =   &H00BFD87E&
         Caption         =   "Proxy"
         Height          =   195
         Left            =   1080
         TabIndex        =   95
         Tag             =   "2055"
         ToolTipText     =   "Proxy"
         Top             =   150
         Width           =   840
      End
      Begin VB.OptionButton optHeir 
         BackColor       =   &H00BFD87E&
         Caption         =   "Heir"
         Height          =   240
         Left            =   150
         TabIndex        =   94
         Tag             =   "2055"
         ToolTipText     =   "Heir"
         Top             =   135
         Value           =   -1  'True
         Width           =   810
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   420
      Left            =   8490
      TabIndex        =   85
      ToolTipText     =   "Next Page"
      Top             =   7470
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Frame frameCustNameDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   120
      TabIndex        =   76
      Top             =   2190
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
         TabIndex        =   83
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
         TabIndex        =   82
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
         TabIndex        =   81
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
         TabIndex        =   80
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
         TabIndex        =   79
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
         TabIndex        =   78
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
         TabIndex        =   77
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Update"
      Height          =   420
      Left            =   4485
      TabIndex        =   49
      ToolTipText     =   "Update"
      Top             =   7470
      Width           =   1335
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "&Add"
      Height          =   420
      Left            =   3135
      TabIndex        =   48
      ToolTipText     =   "Add"
      Top             =   7470
      Width           =   1350
   End
   Begin VB.CommandButton cmdPrevPage 
      Caption         =   "&Previous Page"
      Height          =   420
      Left            =   5820
      TabIndex        =   50
      ToolTipText     =   "Previous Page"
      Top             =   7470
      Width           =   1335
   End
   Begin VB.CommandButton cmdNextPage 
      Caption         =   "&Next Page"
      Height          =   420
      Left            =   7155
      TabIndex        =   51
      ToolTipText     =   "Next Page"
      Top             =   7470
      Width           =   1335
   End
   Begin VB.Frame frameIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   855
      Left            =   120
      TabIndex        =   64
      Top             =   3195
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
         TabIndex        =   65
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
            Tag             =   "2055"
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
            Tag             =   "2055"
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
         TabIndex        =   71
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
         TabIndex        =   70
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
         TabIndex        =   69
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
         TabIndex        =   68
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
         TabIndex        =   67
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
         TabIndex        =   66
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
      Top             =   4155
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
         TabIndex        =   86
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
         TabIndex        =   52
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
         TabIndex        =   92
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
         TabIndex        =   91
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
         TabIndex        =   90
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
         TabIndex        =   89
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
         TabIndex        =   88
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
         TabIndex        =   87
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
         TabIndex        =   63
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
         TabIndex        =   62
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
         TabIndex        =   61
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
         TabIndex        =   60
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
         TabIndex        =   59
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
         TabIndex        =   58
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
         TabIndex        =   57
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
         TabIndex        =   56
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
         TabIndex        =   55
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
         TabIndex        =   54
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
         TabIndex        =   53
         Tag             =   "11775"
         Top             =   1560
         Width           =   495
      End
   End
   Begin MSFlexGridLib.MSFlexGrid heirInfoGrid 
      Height          =   1380
      Left            =   330
      TabIndex        =   0
      Top             =   555
      Width           =   9480
      _ExtentX        =   16722
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
   Begin VB.Label lblHeirType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Heir Type"
      BeginProperty Font 
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
      Left            =   165
      TabIndex        =   96
      Tag             =   "11775"
      Top             =   6390
      Width           =   1020
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
      Left            =   375
      TabIndex        =   84
      Top             =   7635
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblHeirDetails 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Heir Details"
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
      TabIndex        =   75
      Top             =   120
      Width           =   1425
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
      TabIndex        =   74
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
      TabIndex        =   73
      Top             =   120
      Width           =   2925
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   2640
      TabIndex        =   72
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
      Left            =   195
      Top             =   7410
      Width           =   11580
   End
End
Attribute VB_Name = "frmIndividualHeirs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public heirAddAction As Boolean
Public heirUpdateAction As Boolean
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
  Unload frmIndividualHeirs
  Unload frmSupervisorApproval
  frmEnquiry.readPendingList "00000", "S", tCustNo
  frmSupervisorApproval.Show
End Sub

Private Sub cmbProxyIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbProxyIssueDate.text)) <> 0 Then
         If Len(cmbProxyIssueDate.text) = 2 Then
            If cmbProxyIssueDate < 1 Or _
               cmbProxyIssueDate > IIf(optProxyDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbProxyIssueDate.text = ""
               cmbProxyIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbProxyIssueMonth.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbProxyIssueDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbProxyIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbProxyIssueMonth.text)) <> 0 Then
         If Len(cmbProxyIssueMonth.text) = 2 Then
            If cmbProxyIssueMonth < 1 Or cmbProxyIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbProxyIssueMonth.text = ""
               cmbProxyIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtProxyIssueYear.SetFocus
            End If
         End If
      End If
   End If
End Sub

Private Sub cmbProxyIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
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
    Dim tmpHeirNo As String
    Dim custNo As String
    Dim recdIdNo As String, recdIdType As String
    Dim tmpRow As Integer
    Dim tmpIdType As String, tmpIdNo As String
    
    If Not supervisorAction And Not searchAction And Not custHistoryAction Then
       If validateIndividualHeir = 1 Then
          Exit Sub
       End If
       
       recdIdType = Mid$(cmbIdType.text, 1, 1)
       recdIdNo = Format(txtIdNo, "!@@@@@@@@@@@@@@@")
       
       tmpRow = 1
       Do While True
          heirInfoGrid.Row = tmpRow
          heirInfoGrid.Col = 0
          custNo = heirInfoGrid.text
          heirInfoGrid.Col = 1
          tmpHeirNo = heirInfoGrid.text
          If Len(RTrim(tmpHeirNo)) = 0 Then
             Exit Do
          End If
          heirInfoGrid.Col = 4
          tmpIdType = Mid$(heirInfoGrid.text, 1, 1)
          tmpIdNo = Mid$(heirInfoGrid.text, 3)
       
          If recdIdType = tmpIdType And Trim(recdIdNo) = Trim(tmpIdNo) Then
             MsgBox errIdAlreadySelected(UserLang) & tmpHeirNo & errCannotSelectAgain(UserLang)
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
       
       heirAddAction = True
       heirUpdateAction = False
       createHeir
       If recvCustomerMsg.status <> "000" Then
          'arul note - arithmetic expression using strings
          noOfHeir = noOfHeir - 1
       End If
    End If
   
 End Sub

Private Sub cmdNextPage_Click()
'  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
'    If validateIndividualheir = 1 Then
'       Exit Sub
'    End If
'  End If
  frmIndividualSaudiAcctInfo.Show
End Sub

Private Sub cmdPrevPage_Click()
    Me.Hide
End Sub

Public Function validateIndividualHeir() As Integer
     Dim tIssueDate As String, tDob As String, tCrDate As String
     Dim tExpiryDate As String
     Dim tCode As String
     Dim tmpCode As String
     Dim mQry As String
     Dim i As Integer
     
     validateIndividualHeir = 0
     
        If Len(RTrim(frmIndividualHeirs.cmbIdType.text)) = 0 Then
           MsgBox errSpaceIdType(UserLang)
           frmIndividualHeirs.cmbIdType.SetFocus
           validateIndividualHeir = 1
           Exit Function
        Else
           validateIndividualHeir = 0
        End If
        
        If Len(RTrim(frmIndividualHeirs.txtIdNo)) = 0 Then
           MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
           frmIndividualHeirs.txtIdNo.SetFocus
           validateIndividualHeir = 1
           Exit Function
        Else
           validateIndividualHeir = 0
        End If
        
        If Mid$(frmIndividualHeirs.cmbIdType.text, 1, 1) = "I" Or _
           Mid$(frmIndividualHeirs.cmbIdType.text, 1, 1) = "Q" Then
           If Len(Trim(frmIndividualHeirs.txtIdNo)) <> 10 Then
              MsgBox errInvalidId(UserLang)
              frmIndividualHeirs.txtIdNo.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
           
           If Mid$(cmbIdType.text, 1, 1) = "I" Then
              If Mid$(txtIdNo, 1, 1) <> "1" Then
                 MsgBox errInvalidIdCategory(UserLang)
                 txtIdNo.SetFocus
                 validateIndividualHeir = 1
                 Exit Function
              Else
                 validateIndividualHeir = 0
              End If
           ElseIf Mid$(cmbIdType.text, 1, 1) = "Q" Then
              If Mid$(txtIdNo, 1, 1) <> "2" And _
                 Mid$(txtIdNo, 1, 1) <> "3" And _
                 Mid$(txtIdNo, 1, 1) <> "5" Then
                 MsgBox errInvalidIdCategory(UserLang)
                 txtIdNo.SetFocus
                 validateIndividualHeir = 1
                 Exit Function
              Else
                 validateIndividualHeir = 0
              End If
           End If
           
           If validIdNumber(Trim(frmIndividualHeirs.txtIdNo)) = False Then
              MsgBox errInvalidIdNo(UserLang)
              frmIndividualHeirs.txtIdNo.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
        
        If frmIndividualSaudi.optLangArabic.Value = True Then
           If Len(RTrim(frmIndividualHeirs.txtArabFirstName)) = 0 And _
              Len(RTrim(frmIndividualHeirs.txtArabic2ndName)) = 0 And _
              Len(RTrim(frmIndividualHeirs.txtArabic3rdName)) = 0 And _
              Len(RTrim(frmIndividualHeirs.txtArabLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 frmIndividualHeirs.txtArabFirstName.SetFocus
                 validateIndividualHeir = 1
                 Exit Function
           Else
                 validateIndividualHeir = 0
           End If
           
           If Len(RTrim(frmIndividualHeirs.txtArabShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmIndividualHeirs.txtArabShortName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        Else
           If Len(RTrim(frmIndividualHeirs.txtEngFirstName)) = 0 And _
              Len(RTrim(frmIndividualHeirs.txtEnglish2ndName)) = 0 And _
              Len(RTrim(frmIndividualHeirs.txtEnglish3rdName)) = 0 And _
              Len(RTrim(frmIndividualHeirs.txtEngLastName)) = 0 Then
                 MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
                 frmIndividualHeirs.txtEngFirstName.SetFocus
                 validateIndividualHeir = 1
                 Exit Function
           Else
                 validateIndividualHeir = 0
           End If
           
           If Len(RTrim(frmIndividualHeirs.txtEngShortName)) = 0 Then
              MsgBox errSpaceShortName(UserLang)
              frmIndividualHeirs.txtEngShortName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
        
        If Len(RTrim(txtArabFirstName)) > 0 Then
           If englishCharFound(txtArabFirstName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabFirstName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtArabic2ndName)) > 0 Then
           If englishCharFound(txtArabic2ndName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabic2ndName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtArabic3rdName)) > 0 Then
           If englishCharFound(txtArabic3rdName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabic3rdName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtArabLastName)) > 0 Then
           If englishCharFound(txtArabLastName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabLastName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtArabShortName)) > 0 Then
           If englishCharFound(txtArabShortName) = True Then
              MsgBox errNoEnglishCharacters(UserLang)
              txtArabShortName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtEngFirstName)) > 0 Then
           If arabicCharFound(txtEngFirstName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngFirstName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtEnglish2ndName)) > 0 Then
           If arabicCharFound(txtEnglish2ndName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEnglish2ndName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtEnglish3rdName)) > 0 Then
           If arabicCharFound(txtEnglish3rdName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEnglish3rdName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtEngLastName)) > 0 Then
           If arabicCharFound(txtEngLastName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngLastName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
    
        If Len(RTrim(txtEngShortName)) > 0 Then
           If arabicCharFound(txtEngShortName) = True Then
              MsgBox errNoArabicCharacters(UserLang)
              txtEngShortName.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
        
        If Len(RTrim(frmIndividualHeirs.cmbIdIssueDate.text)) = 0 Or _
           Len(RTrim(frmIndividualHeirs.cmbIdIssueMonth.text)) = 0 Or _
           Len(RTrim(frmIndividualHeirs.txtIdIssueYear)) = 0 Then
           MsgBox errSpaceIssueDate(UserLang)
           frmIndividualHeirs.cmbIdIssueDate.SetFocus
           validateIndividualHeir = 1
           Exit Function
        Else
           validateIndividualHeir = 0
        End If
        
        If Len(RTrim(frmIndividualHeirs.cmbIdExpiryDate.text)) = 0 Or _
           Len(RTrim(frmIndividualHeirs.cmbIdExpiryMonth.text)) = 0 Or _
           Len(RTrim(frmIndividualHeirs.txtIdExpiryYear)) = 0 Then
           MsgBox errSpaceExpiryDate(UserLang)
           frmIndividualHeirs.cmbIdExpiryDate.SetFocus
           validateIndividualHeir = 1
           Exit Function
        Else
           validateIndividualHeir = 0
        End If
        
        tIssueDate = CStr(frmIndividualHeirs.txtIdIssueYear) & _
                     CStr(frmIndividualHeirs.cmbIdIssueMonth.text) & _
                     CStr(frmIndividualHeirs.cmbIdIssueDate.text)
        tExpiryDate = CStr(frmIndividualHeirs.txtIdExpiryYear) & _
                      CStr(frmIndividualHeirs.cmbIdExpiryMonth.text) & _
                      CStr(frmIndividualHeirs.cmbIdExpiryDate.text)
                      
        If frmIndividualHeirs.optIdDateGregorian.Value = True Then
           If Not validDate(tIssueDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualHeirs.cmbIdIssueDate.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
           
           If Not validDate(tExpiryDate) Then
              MsgBox errInvalidDate(UserLang)
              frmIndividualHeirs.cmbIdExpiryDate.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        End If
                     
        If tExpiryDate < tIssueDate Then
           MsgBox errGreaterExpiryYear(UserLang)
           frmIndividualHeirs.txtIdExpiryYear.SetFocus
           validateIndividualHeir = 1
           Exit Function
        Else
           validateIndividualHeir = 0
        End If
        
        If optIdDateHijri = True Then
           If tExpiryDate < currentHijriDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              frmIndividualHeirs.txtIdExpiryYear.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
              validateIndividualHeir = 0
           End If
        Else
           If tExpiryDate < currentGregDate Then
              MsgBox errExpiryDateLessThanToday(UserLang)
              frmIndividualHeirs.txtIdExpiryYear.SetFocus
              validateIndividualHeir = 1
              Exit Function
           Else
             validateIndividualHeir = 0
           End If
        End If
        
        If Len(RTrim(frmIndividualHeirs.cmbIdIssuedAt.text)) = 0 Then
           MsgBox errSpaceIdIssuedAt(UserLang)
           frmIndividualHeirs.cmbIdIssuedAt.SetFocus
           validateIndividualHeir = 1
           Exit Function
        Else
           validateIndividualHeir = 0
        End If
        
    If frmIndividualSaudi.optLangArabic.Value = True Then
       If frmIndividualHeirs.optPoBox = True Then
          If Len(RTrim(frmIndividualHeirs.txtAddress1)) <> 0 Then
             If englishCharFound(frmIndividualHeirs.txtAddress1) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualHeirs.txtAddress1.SetFocus
                validateIndividualHeir = 1
                Exit Function
             Else
                validateIndividualHeir = 0
             End If
          End If
          
          If Len(RTrim(frmIndividualHeirs.txtAddress2)) <> 0 Then
             If englishCharFound(frmIndividualHeirs.txtAddress2) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualHeirs.txtAddress2.SetFocus
                validateIndividualHeir = 1
                Exit Function
             Else
                validateIndividualHeir = 0
             End If
          End If
      Else ' saudi post
         If Len(RTrim(frmIndividualHeirs.txtSaudiPostStreetName)) <> 0 Then
             If englishCharFound(frmIndividualHeirs.txtSaudiPostStreetName) Then
                MsgBox errNoEnglishAddress(UserLang)
                frmIndividualHeirs.txtSaudiPostStreetName.SetFocus
                validateIndividualHeir = 1
                Exit Function
             Else
                validateIndividualHeir = 0
             End If
          End If
      End If
         
      If englishCharFound(frmIndividualHeirs.cmbCity.text) Then
         On Error Resume Next
         Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" + _
                              frmIndividualHeirs.cmbCity.text & "'")
         If rs.recordCount > 0 Then
            frmIndividualHeirs.cmbCity.text = rs(0)
         Else
            MsgBox errLangNotmatching(UserLang)
            frmIndividualHeirs.cmbCity.SetFocus
            validateIndividualHeir = 1
            Exit Function
         End If
      End If
    Else ' language is english
       If frmIndividualHeirs.optPoBox = True Then
          If Len(RTrim(frmIndividualHeirs.txtAddress1)) <> 0 Then
             If arabicCharFound(frmIndividualHeirs.txtAddress1) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualHeirs.txtAddress1.SetFocus
                validateIndividualHeir = 1
                Exit Function
             Else
                validateIndividualHeir = 0
             End If
          End If
         
          If Len(RTrim(frmIndividualHeirs.txtAddress2)) <> 0 Then
             If arabicCharFound(frmIndividualHeirs.txtAddress2) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualHeirs.txtAddress2.SetFocus
                validateIndividualHeir = 1
                Exit Function
             Else
                validateIndividualHeir = 0
             End If
          End If
     Else ' saudi post address
         If Len(RTrim(frmIndividualHeirs.txtSaudiPostStreetName)) <> 0 Then
             If arabicCharFound(frmIndividualHeirs.txtSaudiPostStreetName) Then
                MsgBox errNoArabicAddress(UserLang)
                frmIndividualHeirs.txtSaudiPostStreetName.SetFocus
                validateIndividualHeir = 1
                Exit Function
             Else
                validateIndividualHeir = 0
             End If
          End If
      End If
      If arabicCharFound(frmIndividualHeirs.cmbCity.text) Then
         On Error Resume Next
         Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" + _
                            frmIndividualHeirs.cmbCity.text & "'")
         If rs.recordCount > 0 Then
            frmIndividualHeirs.cmbCity.text = rs(0)
         Else
            MsgBox errLangNotmatching(UserLang)
            frmIndividualHeirs.cmbCity.SetFocus
            validateIndividualHeir = 1
            Exit Function
         End If
     End If
   End If
    
   If frmIndividualHeirs.optPoBox = True Then
      If Len(RTrim(frmIndividualHeirs.txtAddress1)) = 0 Or _
         Len(RTrim(frmIndividualHeirs.txtPOBox)) = 0 Or _
         Len(RTrim(frmIndividualHeirs.txtPinCode)) = 0 Or _
         Len(RTrim(frmIndividualHeirs.cmbCity.text)) = 0 Then
          
         MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
         frmIndividualHeirs.txtAddress1.SetFocus
         validateIndividualHeir = 1
         Exit Function
      Else
         validateIndividualHeir = 0
      End If
   Else ' saudi post address
      If Len(RTrim(frmIndividualHeirs.txtSaudiPostGPSNo)) = 0 Or _
         Len(RTrim(frmIndividualHeirs.txtSaudiPostStreetName)) = 0 Or _
         Len(RTrim(frmIndividualHeirs.txtSaudiPostUnit)) = 0 Or _
         Len(RTrim(frmIndividualHeirs.cmbCity.text)) = 0 Or _
         Len(RTrim(frmIndividualHeirs.txtSaudiPostZipCode)) = 0 Or _
         Len(RTrim(frmIndividualHeirs.txtSaudiPostAdditionalNo)) = 0 Then
         MsgBox errSpaceSaudiAddress(UserLang) '"Saudi Postal address should be entered.. Please enter"
         frmIndividualHeirs.txtSaudiPostGPSNo.SetFocus
         validateIndividualHeir = 1
         Exit Function
      Else
         validateIndividualHeir = 0
      End If
   End If
    
    If Len(RTrim(frmIndividualHeirs.txtResPhoneNo)) = 0 And _
       Len(RTrim(frmIndividualHeirs.txtOffPhoneNo)) = 0 And _
       Len(RTrim(frmIndividualHeirs.txtFaxNo)) = 0 And _
       Len(RTrim(frmIndividualHeirs.txtMobileNo)) = 0 Then
       
       MsgBox errSpacePhone(UserLang) ' "Atleast one Phone number should be entered..."
       frmIndividualHeirs.txtOffPhoneNo.SetFocus
       validateIndividualHeir = 1
       Exit Function
    Else
       validateIndividualHeir = 0
    End If
    
    If Len(RTrim(txtProxyNo)) > 0 Then
       If Len(RTrim(frmIndividualHeirs.cmbProxyIssueDate.text)) = 0 Or _
          Len(RTrim(frmIndividualHeirs.cmbProxyIssueMonth.text)) = 0 Or _
          Len(RTrim(frmIndividualHeirs.txtProxyIssueYear)) = 0 Then
          MsgBox errSpaceIssueDate(UserLang)
          frmIndividualHeirs.cmbProxyIssueDate.SetFocus
          validateIndividualHeir = 1
          Exit Function
       Else
          validateIndividualHeir = 0
       End If
       
       tIssueDate = CStr(frmIndividualHeirs.txtProxyIssueYear) & _
                    CStr(frmIndividualHeirs.cmbProxyIssueMonth.text) & _
                    CStr(frmIndividualHeirs.cmbProxyIssueDate.text)
                      
       If frmIndividualHeirs.optProxyDateGreg.Value = True Then
          If Not validDate(tIssueDate) Then
             MsgBox errInvalidDate(UserLang)
             frmIndividualHeirs.cmbProxyIssueDate.SetFocus
             validateIndividualHeir = 1
             Exit Function
          Else
             validateIndividualHeir = 0
          End If
       End If
       
       If optProxyDateHijri = True Then
          If tIssueDate > currentHijriDate Then
             MsgBox errIssueDateGreaterThanToday(UserLang)
             frmIndividualHeirs.txtIdIssueYear.SetFocus
             validateIndividualHeir = 1
             Exit Function
          Else
             validateIndividualHeir = 0
          End If
       Else
          If tIssueDate > currentGregDate Then
             MsgBox errIssueDateGreaterThanToday(UserLang)
             frmIndividualHeirs.txtProxyIssueYear.SetFocus
             validateIndividualHeir = 1
             Exit Function
          Else
            validateIndividualHeir = 0
          End If
       End If
    End If
End Function


Private Sub cmdUpdate_Click()
    If Not supervisorAction And Not searchAction And Not custHistoryAction Then
       If validateIndividualHeir = 1 Then
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
       heirAddAction = False
       heirUpdateAction = True
       createHeir
       If recvCustomerMsg.status <> "000" Then
          'arul note - arithmetic expression using strings
          noOfHeir = noOfHeir - 1
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
      ChangePositions frmIndividualHeirs, 11800
      frmIndividualHeirs.Hide
      frmIndividualHeirs.RightToLeft = True
   End If
   
   lblMainCategoryDesc = mainCategoryDesc
   lblSubCategoryDesc = subCategoryDesc
   
   frmIndividualHeirs.Caption = frmIndividualSaudi2Caption(50, UserLang)
   lblHeirDetails.Caption = frmIndividualSaudi2Caption(51, UserLang)
   lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
'   lblSubCategory.Caption = frmIndividualOthers1Caption(42, UserLang)
   'lblheirFor.Caption = frmIndividualSaudi2Caption(42, UserLang)
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
   
   lblHeirType.Caption = frmIndividualSaudi2Caption(52, UserLang)
   optHeir.Caption = frmIndividualSaudi2Caption(53, UserLang)
   optProxy.Caption = frmIndividualSaudi2Caption(54, UserLang)
   lblProxyNo.Caption = frmIndividualSaudi2Caption(55, UserLang)
   lblProxyDateType.Caption = frmIndividualSaudi2Caption(56, UserLang)
   optProxyDateHijri.Caption = frmIndividualSaudi2Caption(57, UserLang)
   optProxyDateGreg.Caption = frmIndividualSaudi2Caption(58, UserLang)
   lblProxyIssueDate.Caption = frmIndividualSaudi2Caption(59, UserLang)
   
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
'    rowTitle(1) = "heir #"
'    rowTitle(2) = "heir name"
'    rowTitle(3) = "Customer branch code"
'    rowTitle(4) = "IdType-id Number"
          
    heirInfoGrid.Clear
    heirInfoGrid.Row = 0
    heirInfoGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 4
      heirInfoGrid.Col = i
      If UserLang = ARABIC Then
         heirInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         heirInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      heirInfoGrid.text = frmIndividualSaudi2Caption(i + 37, UserLang)
      heirInfoGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    heirInfoGrid.Width = tWidth + 100
   
   If InStr(recvLoginMsg.authorityLevel, "~01") <> 0 Then
      frmIndividualHeirs.cmdAdd.Enabled = True
   Else
      frmIndividualHeirs.cmdAdd.Enabled = False
   End If
   
   If supervisorAction Or searchAction Or custHistoryAction Then
      frmIndividualHeirs.cmdAdd.Enabled = False
      frmIndividualHeirs.cmdUpdate.Enabled = False
      frmIndividualHeirs.frameHeirType.Enabled = False
      frmIndividualHeirs.frameCustNameDetails.Enabled = False
      frmIndividualHeirs.frameCustomerContactInfo.Enabled = False
      frmIndividualHeirs.frameProxyNo.Enabled = False
      'frmIndividualHeirs.cmbRefType.Enabled = False
      frmIndividualHeirs.frameIdInfo.Enabled = False
      If custHistoryAction Then
         lblHistory.Visible = True
         lblHistory.Refresh
      Else
         lblHistory.Visible = False
      End If
   Else
      frmIndividualHeirs.cmdAdd.Enabled = True
      frmIndividualHeirs.cmdUpdate.Enabled = True
      frmIndividualHeirs.frameHeirType.Enabled = True
      'frmIndividualHeirs.cmbRefType.Enabled = True
      frmIndividualHeirs.frameCustNameDetails.Enabled = True
      frmIndividualHeirs.frameIdInfo.Enabled = True
      frmIndividualHeirs.frameCustomerContactInfo.Enabled = True
      frmIndividualHeirs.frameProxyNo.Enabled = True
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
    cmbProxyIssueDate.Clear
    cmbProxyIssueMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" + CStr(i)
       Else
          num = CStr(i)
       End If
       cmbIdIssueDate.AddItem num
       cmbIdExpiryDate.AddItem num
       cmbProxyIssueDate.AddItem num
       If i < 13 Then
          cmbIdIssueMonth.AddItem num
          cmbIdExpiryMonth.AddItem num
          cmbProxyIssueMonth.AddItem num
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
         frmIndividualHeirs.cmbCity.text = ""
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
   
   cmdUpdate.Enabled = False ' added by rajesh on 9 dec 2003 to avoid duplicate error
                             ' while supervisor approval
    

End Sub

Public Sub createHeir()
    Dim strmsglen As String
   
    formatNewHeirRequest
       
    SendMsg = heirInfo.msgLen & heirInfo.service & gBranchCode & heirInfo.userId & heirInfo.dateTime & _
              heirInfo.creationOrUpdate & heirInfo.NewOrUpdateFlag & _
              heirInfo.bmUpdateStatus & heirInfo.customerNo & heirInfo.refNo & heirInfo.referenceType & heirInfo.supervisorId & heirInfo.custBranchCode & heirInfo.idType & heirInfo.idNo & _
              heirInfo.idIssuedAt & heirInfo.idDateType & heirInfo.idIssueDateH & heirInfo.idIssueDateG & heirInfo.idExpiryDateH & heirInfo.idExpiryDateG & _
              heirInfo.aFirstName & heirInfo.a2ndName & heirInfo.a3rdName & heirInfo.aLastName & _
              heirInfo.aShortName & heirInfo.eFirstName & heirInfo.e2ndName & heirInfo.e3rdName & heirInfo.eLastName & heirInfo.eShortName & heirInfo.address1 & heirInfo.address2 & _
              heirInfo.poBox & heirInfo.cityName & heirInfo.zipCode & heirInfo.country & heirInfo.telOffAreaCode & heirInfo.telOffNo & heirInfo.telOffExt & _
              heirInfo.telHomeAreaCode & heirInfo.telHomeNo & heirInfo.telHomeExt & heirInfo.faxAreaCode & heirInfo.faxNo & heirInfo.faxExt & heirInfo.mobileNo & heirInfo.pagerNo & _
              heirInfo.eMail & heirInfo.addressType & _
              heirInfo.custOpenSource & heirInfo.branchCSOId & _
              heirInfo.branchActionDateTime & heirInfo.activityFlag & heirInfo.proxyNo & heirInfo.proxyDateType & _
              heirInfo.proxyIssueDateH & heirInfo.proxyIssueDateG & Space(50)
           
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmIndividualHeirs.MousePointer = vbHourglass
    frmIndividualHeirs.cmdAdd.Enabled = False
    frmIndividualHeirs.cmdUpdate.Enabled = False
    frmIndividualHeirs.cmdPrevPage.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    
    If retStatus = LocalCommsError Then
       LoadError = True
       frmIndividualHeirs.cmdAdd.Enabled = True
       'frmIndividualHeirs.cmdUpdate.Enabled = True commented by rajesh to avoid duplicates
                                                  ' during supervisor approval
       frmIndividualHeirs.cmdPrevPage.Enabled = True
       frmIndividualHeirs.MousePointer = vbDefault
       Exit Sub
    End If
    
    frmIndividualHeirs.cmdAdd.Enabled = True
    'frmIndividualHeirs.cmdUpdate.Enabled = True commented by rajesh to avoid duplicates
                                                  ' during supervisor approval
    frmIndividualHeirs.cmdPrevPage.Enabled = True
    frmIndividualHeirs.cmdNextPage.Enabled = True
    frmIndividualHeirs.MousePointer = vbDefault
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
    txtOffPhoneCityCode = frmIndividualSaudi.txtOffPhoneCityCode
    txtResPhoneCityCode = frmIndividualSaudi.txtResPhoneCityCode
    txtFaxCityCode = frmIndividualSaudi.txtFaxCityCode
       
    heirKeyUserId = heirInfo.userId
    heirKeyBranch = gBranchCode
    heirKeyDateTime = heirInfo.dateTime
    
    heirInfoGrid.Row = Val(heirInfo.refNo)
    heirInfoGrid.Col = 0
    heirInfoGrid.CellAlignment = flexAlignLeftCenter
    heirInfoGrid.text = heirInfo.customerNo
    heirInfoGrid.Col = 1
    heirInfoGrid.CellAlignment = flexAlignLeftCenter
    heirInfoGrid.text = heirInfo.refNo
    heirInfoGrid.Col = 2
    heirInfoGrid.CellAlignment = flexAlignLeftCenter
    If Len(Trim(heirInfo.aShortName)) <> 0 Then
       heirInfoGrid.text = heirInfo.aShortName
    Else
       heirInfoGrid.text = heirInfo.eShortName
    End If
    heirInfoGrid.Col = 3
    heirInfoGrid.CellAlignment = flexAlignLeftCenter
    heirInfoGrid.text = heirInfo.custBranchCode
    heirInfoGrid.Col = 4
    heirInfoGrid.CellAlignment = flexAlignLeftCenter
    heirInfoGrid.text = heirInfo.idType & "-" & heirInfo.idNo
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

Private Sub optProxyDateGreg_Click()
   If cmbProxyIssueDate.ListCount = 30 Then
      cmbProxyIssueDate.AddItem 31
   End If
   cmbProxyIssueDate = ""
   cmbProxyIssueMonth = ""
   txtProxyIssueYear = ""
End Sub

Private Sub optProxyDateHijri_Click()
   If cmbProxyIssueDate.ListCount = 31 Then
      cmbProxyIssueDate.RemoveItem 30
    End If
    cmbProxyIssueDate = ""
    cmbProxyIssueMonth = ""
    txtProxyIssueYear = ""
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

Private Sub heirInfoGrid_DblClick()
    Dim heirNo As String
    Dim custNo As String
    heirInfoGrid.Col = 0
    custNo = heirInfoGrid.text
    heirInfoGrid.Col = 1
    heirNo = heirInfoGrid.text
    If Len(RTrim(heirNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    fetchHeirInfo custNo, heirNo
End Sub

Private Sub heirInfoGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
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

Public Sub formatNewHeirRequest()
    Dim mQry As String
    Dim tmpStr As String
 
    heirInfo.msgLen = Space(6) ' to be calculated
    heirInfo.service = "AM"  ' AM is for New Heir creation
    'heirinfo.userId = gUserId

    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 0
       heirInfo.userId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       heirInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       heirInfo.supervisorId = Left(recvSaudiIndividualMsg.supervisorId, 10)
       heirInfo.creationOrUpdate = "U"
    Else
       heirInfo.userId = gUserId
       heirInfo.dateTime = gDateTime
       heirInfo.creationOrUpdate = "C"
       heirInfo.supervisorId = Space(10)
    End If
    If updateAction Or _
       (tellerAction And recvSaudiIndividualMsg.newOrUpdate = "U") Then
       heirInfo.NewOrUpdateFlag = "U"
    Else
       heirInfo.NewOrUpdateFlag = "N"
    End If
    
    If phoneCustOpenAction Then
       heirInfo.bmUpdateStatus = "4"  ' 4 for "Entered through phone"
       heirInfo.custOpenSource = "P"  ' customer opened through phone
    Else
       heirInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
       heirInfo.custOpenSource = "B"  ' customer opened through Branch
       'If tellerAction And recvSaudiIndividualMsg.custOpenSource = "P" Then
       If tellerAction And activityFlag = "P" Then
          heirInfo.branchCSOId = gUserId
          heirInfo.branchActionDateTime = branchActionDateTime
       Else
          heirInfo.branchCSOId = Space(10)
          heirInfo.branchActionDateTime = Space(14)
       End If
    End If
    
    If heirInfo.NewOrUpdateFlag = "N" Then
       heirInfo.customerNo = Space(7)
    Else
       heirInfo.customerNo = frmIndividualSaudi.txtCustomerNo
    End If
    heirInfo.homeBranch = gBranchCode
    
    heirInfo.custBranchCode = Mid$(frmIndividualSaudi.cmbBranchCode, 1, 4)
    If heirAddAction Then
          'arul note - arithmetic expression using strings
       noOfHeir = noOfHeir + 1
       heirInfo.creationOrUpdate = "C"
       If updateAction Then
          heirInfo.NewOrUpdateFlag = "N"
       End If
    ElseIf heirUpdateAction Then
       heirInfo.refNo = recvHeirDetailMsg.referenceNo
       If updateAction Then
          heirInfo.creationOrUpdate = "C"
       Else
          heirInfo.creationOrUpdate = "U"
       End If
    End If
    
    
'    If updateAction Then
'       noOfheir = recvheirDetailMsg.heirNo
'    ElseIf Not tellerAction Then
'       noOfheir = noOfheir + 1
'    ElseIf heirAddAction Then
'       noOfheir = noOfheir + 1
'       individualSaudiInfo.creationOrUpdate = "C"
'    End If
    
    If Not heirUpdateAction Then
       heirInfo.refNo = Format(noOfHeir, "0000")
    End If
    
    If optHeir Then
       heirInfo.referenceType = "0"
    Else
       heirInfo.referenceType = "1"
    End If
    
    heirInfo.idNo = frmIndividualHeirs.txtIdNo
    heirInfo.idType = frmIndividualHeirs.cmbIdType.text
    
    If frmIndividualHeirs.optIdDateHijri Then
       heirInfo.idDateType = "0"
       heirInfo.idExpiryDateH = Format(frmIndividualHeirs.txtIdExpiryYear, "0000") + Format(frmIndividualHeirs.cmbIdExpiryMonth, "00") + Format(frmIndividualHeirs.cmbIdExpiryDate, "00")
       heirInfo.idIssueDateH = Format(frmIndividualHeirs.txtIdIssueYear, "0000") + Format(frmIndividualHeirs.cmbIdIssueMonth.text, "00") + Format(frmIndividualHeirs.cmbIdIssueDate, "00")
       heirInfo.idIssueDateG = Space(8)
       heirInfo.idExpiryDateG = Space(8)
    Else
       heirInfo.idDateType = "1"
       heirInfo.idExpiryDateG = Format(frmIndividualHeirs.txtIdExpiryYear, "0000") + Format(frmIndividualHeirs.cmbIdExpiryMonth, "00") + Format(frmIndividualHeirs.cmbIdExpiryDate, "00")
       heirInfo.idIssueDateG = Format(frmIndividualHeirs.txtIdIssueYear, "0000") + Format(frmIndividualHeirs.cmbIdIssueMonth.text, "00") + Format(frmIndividualHeirs.cmbIdIssueDate, "00")
       heirInfo.idIssueDateH = Space(8)
       heirInfo.idExpiryDateH = Space(8)
    End If
    
    heirInfo.idIssuedAt = frmIndividualHeirs.cmbIdIssuedAt.text
    
    'If frmIndividualSaudi.optLangArabic Then
    '   heirinfo.langPref = "0"
    'Else
    '   heirinfo.langPref = "1"
    'End If
'    If Len(RTrim(frmIndividualHeirs.txtArabFirstName)) <> 0 Then
'        heirinfo.aFirstName = frmIndividualHeirs.txtArabFirstName
'    Else
'        heirinfo.aFirstName = Space(15)
'    End If
    
    heirInfo.aFirstName = frmIndividualHeirs.txtArabFirstName
    heirInfo.a2ndName = frmIndividualHeirs.txtArabic2ndName
    heirInfo.a3rdName = frmIndividualHeirs.txtArabic3rdName
    heirInfo.aLastName = frmIndividualHeirs.txtArabLastName
    heirInfo.aShortName = frmIndividualHeirs.txtArabShortName
    heirInfo.eFirstName = frmIndividualHeirs.txtEngFirstName
    heirInfo.e2ndName = frmIndividualHeirs.txtEnglish2ndName
    heirInfo.e3rdName = frmIndividualHeirs.txtEnglish3rdName
    heirInfo.eLastName = frmIndividualHeirs.txtEngLastName
    heirInfo.eShortName = frmIndividualHeirs.txtEngShortName
    
    If frmIndividualHeirs.optSaudiPost = True Then
       heirInfo.addressType = "1"
       heirInfo.address1 = Format(frmIndividualHeirs.txtSaudiPostGPSNo, "!@@@@@") & "-" & _
                                         frmIndividualHeirs.txtSaudiPostStreetName
       heirInfo.poBox = frmIndividualHeirs.txtSaudiPostUnit
       heirInfo.zipCode = Format(frmIndividualHeirs.txtSaudiPostZipCode, "!@@@@@") & "-" & _
                                     frmIndividualHeirs.txtSaudiPostAdditionalNo
       heirInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       heirInfo.addressType = "0"
       heirInfo.address1 = frmIndividualHeirs.txtAddress1
       heirInfo.address2 = frmIndividualHeirs.txtAddress2
       heirInfo.poBox = frmIndividualHeirs.txtPOBox
       heirInfo.zipCode = frmIndividualHeirs.txtPinCode
       heirInfo.country = Left$(frmIndividualHeirs.cmbCountry.text, 3)
    End If
    
    If UserLang = ENGLISH And _
       frmIndividualSaudi.optLangArabic = True Then ' ARABIC
       On Error Resume Next
       Set rs = db.OpenRecordset("select arabicname from cityinfo where englishname = '" & _
                             frmIndividualHeirs.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          heirInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
       Else
          heirInfo.cityName = frmIndividualHeirs.cmbCity.text
       End If
    ElseIf UserLang = ARABIC And _
       frmIndividualSaudi.optLangEnglish = True Then ' ENGLISH
       On Error Resume Next
       Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                            frmIndividualHeirs.cmbCity.text & "'")
       If rs.recordCount > 0 Then
          heirInfo.cityName = IIf(rs(0) = "" Or IsNull(rs(0)) = True, "    ", rs(0))
       Else
          heirInfo.cityName = frmIndividualHeirs.cmbCity.text
       End If
    Else
        heirInfo.cityName = frmIndividualHeirs.cmbCity.text
    End If
    
    heirInfo.telOffAreaCode = frmIndividualHeirs.txtOffPhoneCityCode
    heirInfo.telOffNo = frmIndividualHeirs.txtOffPhoneNo
    heirInfo.telOffExt = frmIndividualHeirs.txtOffPhoneExt
    heirInfo.telHomeAreaCode = frmIndividualHeirs.txtResPhoneCityCode
    heirInfo.telHomeNo = frmIndividualHeirs.txtResPhoneNo
    heirInfo.telHomeExt = frmIndividualHeirs.txtResPhoneExt
    heirInfo.faxAreaCode = frmIndividualHeirs.txtFaxCityCode
    heirInfo.faxNo = frmIndividualHeirs.txtFaxNo
    heirInfo.faxExt = frmIndividualHeirs.txtFaxExt
    If Len(RTrim(frmIndividualHeirs.txtMobileNo)) <> 0 Then
       heirInfo.mobileNo = frmIndividualHeirs.txtMobileAreaCode & frmIndividualHeirs.txtMobileNo
    Else
       heirInfo.mobileNo = Space(10)
    End If
    heirInfo.pagerNo = frmIndividualHeirs.txtPagerNo
    heirInfo.eMail = frmIndividualHeirs.txtEmailAddress
    
    If activityFlag = "P" Then
       heirInfo.activityFlag = "P"
    Else
       heirInfo.activityFlag = Space(1)
    End If
    heirInfo.proxyNo = frmIndividualHeirs.txtProxyNo
    
    If frmIndividualHeirs.optProxyDateHijri Then
       heirInfo.proxyDateType = "0"
       heirInfo.proxyIssueDateH = Format(frmIndividualHeirs.txtProxyIssueYear, "0000") & Format(frmIndividualHeirs.cmbProxyIssueMonth.text, "00") & Format(frmIndividualHeirs.cmbProxyIssueDate, "00")
       heirInfo.proxyIssueDateG = Space(8)
    Else
       heirInfo.proxyDateType = "1"
       heirInfo.proxyIssueDateG = Format(frmIndividualHeirs.txtProxyIssueYear, "0000") & Format(frmIndividualHeirs.cmbProxyIssueMonth.text, "00") & Format(frmIndividualHeirs.cmbProxyIssueDate, "00")
       heirInfo.proxyIssueDateH = Space(8)
    End If

End Sub

Public Sub fetchHeirInfo(custNo As String, heirNo As String)
    Dim strmsglen As String, tCode As String, tuserId As String, tDateTime As String, tBranchCode As String
    Dim recType As String * 2
   
    If searchAction Then
       recType = "08"
       tuserId = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    Else
       recType = "07"
       tuserId = heirKeyUserId
       tBranchCode = heirKeyBranch
       tDateTime = heirKeyDateTime
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
        
    SendMsg = "000057" & "77" & gBranchCode & recType & tBranchCode & tuserId & tDateTime & Format(custNo, "!@@@@@@@@@@@@@@") & heirNo & Space(50)
    frmIndividualHeirs.MousePointer = vbHourglass
    'frmIndividualHeirs.cmdAdd.Enabled = False
    'frmIndividualHeirs.cmdUpdate.Enabled = False
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmIndividualHeirs.MousePointer = vbDefault
'       frmIndividualHeirs.cmdDone.Enabled = True
'       frmIndividualHeirs.cmdNextJoint.Enabled = True
       Exit Sub
    End If
    frmIndividualHeirs.MousePointer = vbDefault
'    frmIndividualHeirs.cmdDone.Enabled = True
'    frmIndividualHeirs.cmdNextJoint.Enabled = True
    parseHeirDetailResponse
    If recvHeirDetailMsg.status = "000" Then
       fillHeirForm
       If Not supervisorAction And Not searchAction And Not custHistoryAction Then
          cmdUpdate.Enabled = True
       End If
    Else
       If UserLang = ARABIC Then
          MsgBox recvHeirDetailMsg.aRemarks
       Else
          MsgBox recvHeirDetailMsg.eRemarks
       End If
       CSD_mdiForm.staticStatus.Panels(3).text = "  "
       Exit Sub
    End If  ' recvheirdetailmsg.status = "000"
    
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Public Sub parseHeirDetailResponse()
    Dim pos As Integer
    
    pos = 1
    recvHeirDetailMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvHeirDetailMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvHeirDetailMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvHeirDetailMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvHeirDetailMsg.custNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvHeirDetailMsg.referenceNo = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvHeirDetailMsg.referenceReqdFor = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvHeirDetailMsg.referenceType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvHeirDetailMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvHeirDetailMsg.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvHeirDetailMsg.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvHeirDetailMsg.idType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvHeirDetailMsg.idNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.idIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvHeirDetailMsg.idDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvHeirDetailMsg.idIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvHeirDetailMsg.idIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvHeirDetailMsg.idExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvHeirDetailMsg.idExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvHeirDetailMsg.aFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.a2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.a3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.aLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.aShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvHeirDetailMsg.eFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.e2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.e3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.eLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvHeirDetailMsg.eShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvHeirDetailMsg.address1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvHeirDetailMsg.address2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvHeirDetailMsg.poBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvHeirDetailMsg.cityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvHeirDetailMsg.zipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvHeirDetailMsg.country = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvHeirDetailMsg.telOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvHeirDetailMsg.telOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvHeirDetailMsg.telOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvHeirDetailMsg.telHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvHeirDetailMsg.telHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvHeirDetailMsg.telHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvHeirDetailMsg.faxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvHeirDetailMsg.faxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvHeirDetailMsg.faxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvHeirDetailMsg.mobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvHeirDetailMsg.pagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvHeirDetailMsg.eMail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvHeirDetailMsg.addressType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvHeirDetailMsg.custOpenSource = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvHeirDetailMsg.proxyNo = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvHeirDetailMsg.proxyDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvHeirDetailMsg.proxyIssueDateH = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvHeirDetailMsg.proxyIssueDateG = Mid$(RecvStr, pos, 8)
    pos = pos + 8

End Sub

Private Sub txtProxyIssueYear_KeyPress(KeyAscii As Integer)
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

Public Sub fillHeirForm()
    Dim tCode As String
    Dim tmpStr As String
    Dim i As Integer

    tCode = recvHeirDetailMsg.idType
    If tCode <> "" Then
       For i = 0 To frmIndividualHeirs.cmbIdType.ListCount
           If Mid(frmIndividualHeirs.cmbIdType.List(i), 1, 1) = tCode Then
              frmIndividualHeirs.cmbIdType.ListIndex = i
              Exit For
           End If
       Next i
     Else
       frmIndividualHeirs.cmbIdType.ListIndex = -1
     End If
     If i > frmIndividualHeirs.cmbIdType.ListCount Then
       frmIndividualHeirs.cmbIdType.ListIndex = -1
     End If
    
    frmIndividualHeirs.txtIdNo = recvHeirDetailMsg.idNo
    frmIndividualHeirs.cmbIdIssuedAt.text = recvHeirDetailMsg.idIssuedAt
    
    If recvHeirDetailMsg.idDateType = "0" Or _
       recvHeirDetailMsg.idDateType = " " Then
       frmIndividualHeirs.optIdDateHijri.Value = True
       frmIndividualHeirs.cmbIdIssueDate.text = _
               Right$(recvHeirDetailMsg.idIssueDateH, 2)
       frmIndividualHeirs.cmbIdIssueMonth.text = _
               Mid$(recvHeirDetailMsg.idIssueDateH, 5, 2)
       frmIndividualHeirs.txtIdIssueYear = Mid$(recvHeirDetailMsg.idIssueDateH, 1, 4)
       frmIndividualHeirs.cmbIdExpiryDate.text = _
               Right$(recvHeirDetailMsg.idExpiryDateH, 2)
       frmIndividualHeirs.cmbIdExpiryMonth.text = _
               Mid$(recvHeirDetailMsg.idExpiryDateH, 5, 2)
       frmIndividualHeirs.txtIdExpiryYear = Mid$(recvHeirDetailMsg.idExpiryDateH, 1, 4)
    Else
       frmIndividualHeirs.optIdDateGregorian.Value = True
       frmIndividualHeirs.cmbIdIssueDate.text = _
               Right$(recvHeirDetailMsg.idIssueDateG, 2)
       frmIndividualHeirs.cmbIdIssueMonth.text = _
               Mid$(recvHeirDetailMsg.idIssueDateG, 5, 2)
       frmIndividualHeirs.txtIdIssueYear = Mid$(recvHeirDetailMsg.idIssueDateG, 1, 4)
       frmIndividualHeirs.cmbIdExpiryDate.text = _
               Right$(recvHeirDetailMsg.idExpiryDateG, 2)
       frmIndividualHeirs.cmbIdExpiryMonth.text = _
               Mid$(recvHeirDetailMsg.idExpiryDateG, 5, 2)
       frmIndividualHeirs.txtIdExpiryYear = Mid$(recvHeirDetailMsg.idExpiryDateG, 1, 4)
    End If
      
    frmIndividualHeirs.txtArabFirstName = _
          recvHeirDetailMsg.aFirstName
    frmIndividualHeirs.txtArabic2ndName = _
          recvHeirDetailMsg.a2ndName
    frmIndividualHeirs.txtArabic3rdName = _
          recvHeirDetailMsg.a3rdName
    frmIndividualHeirs.txtArabLastName = _
          recvHeirDetailMsg.aLastName
    frmIndividualHeirs.txtArabShortName = _
          recvHeirDetailMsg.aShortName
      
    frmIndividualHeirs.txtEngFirstName = _
          recvHeirDetailMsg.eFirstName
    frmIndividualHeirs.txtEnglish2ndName = _
          recvHeirDetailMsg.e2ndName
    frmIndividualHeirs.txtEnglish3rdName = _
          recvHeirDetailMsg.e3rdName
    frmIndividualHeirs.txtEngLastName = _
          recvHeirDetailMsg.eLastName
    frmIndividualHeirs.txtEngShortName = _
          recvHeirDetailMsg.eShortName
             
   If recvHeirDetailMsg.addressType = "1" Then
       frmIndividualHeirs.optSaudiPost.Value = True
       frmIndividualHeirs.txtSaudiPostGPSNo = Mid$(recvHeirDetailMsg.address1, 1, 5)
       frmIndividualHeirs.txtSaudiPostStreetName = Mid$(recvHeirDetailMsg.address1, 7)
       frmIndividualHeirs.txtSaudiPostUnit = recvHeirDetailMsg.poBox
       frmIndividualHeirs.txtSaudiPostZipCode = Mid$(recvHeirDetailMsg.zipCode, 1, 5)
       frmIndividualHeirs.txtSaudiPostAdditionalNo = Mid$(recvHeirDetailMsg.zipCode, 7)
    Else
       frmIndividualHeirs.optPoBox.Value = True
       frmIndividualHeirs.txtAddress1 = recvHeirDetailMsg.address1
       frmIndividualHeirs.txtAddress2 = recvHeirDetailMsg.address2
       frmIndividualHeirs.txtPOBox = recvHeirDetailMsg.poBox
       frmIndividualHeirs.txtPinCode = recvHeirDetailMsg.zipCode
       tCode = Mid$(recvHeirDetailMsg.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmIndividualHeirs.cmbCountry.ListCount
              If Mid(frmIndividualHeirs.cmbCountry.List(i), 1, 3) = tCode Then
                 frmIndividualHeirs.cmbCountry.ListIndex = i 'RTrim(frmIndividualHeirs.cmbCountry.List(i))
                 Exit For
              End If
          Next i
       Else
          frmIndividualHeirs.cmbCountry.ListIndex = -1
       End If
       If i > frmIndividualHeirs.cmbCountry.ListCount Then
          frmIndividualHeirs.cmbCountry.text = tCode & "- Not defined in local"
       End If
    End If
    frmIndividualHeirs.cmbCity.text = recvHeirDetailMsg.cityName
    If Len(RTrim(recvHeirDetailMsg.telOffAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualHeirs.txtOffPhoneCityCode = recvHeirDetailMsg.telOffAreaCode
    End If
    frmIndividualHeirs.txtOffPhoneNo = recvHeirDetailMsg.telOffNo
    frmIndividualHeirs.txtOffPhoneExt = recvHeirDetailMsg.telOffExt
    If Len(RTrim(recvHeirDetailMsg.telHomeAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualHeirs.txtResPhoneCityCode = recvHeirDetailMsg.telHomeAreaCode
    End If
    frmIndividualHeirs.txtResPhoneNo = recvHeirDetailMsg.telHomeNo
    frmIndividualHeirs.txtResPhoneExt = recvHeirDetailMsg.telHomeExt
    If Len(RTrim(recvHeirDetailMsg.faxAreaCode)) <> 0 Or _
       Not updateAction Then
       frmIndividualHeirs.txtFaxCityCode = recvHeirDetailMsg.faxAreaCode
    End If
    frmIndividualHeirs.txtFaxNo = recvHeirDetailMsg.faxNo
    frmIndividualHeirs.txtFaxExt = recvHeirDetailMsg.faxExt
    frmIndividualHeirs.txtMobileAreaCode = Mid$(recvHeirDetailMsg.mobileNo, 1, 2)
    frmIndividualHeirs.txtMobileNo = Mid$(recvHeirDetailMsg.mobileNo, 3)
    frmIndividualHeirs.txtPagerNo = recvHeirDetailMsg.pagerNo
    frmIndividualHeirs.txtEmailAddress = recvHeirDetailMsg.eMail
    tCode = recvHeirDetailMsg.referenceType
    If tCode = "1" Then
       frmIndividualHeirs.optProxy.Value = True
    Else
       frmIndividualHeirs.optHeir.Value = True
    End If
    
    frmIndividualHeirs.txtProxyNo = recvHeirDetailMsg.proxyNo
    
    If recvHeirDetailMsg.proxyDateType = "0" Or _
       recvHeirDetailMsg.proxyDateType = " " Then
       frmIndividualHeirs.optProxyDateHijri.Value = True
       frmIndividualHeirs.cmbProxyIssueDate.text = _
               Right$(recvHeirDetailMsg.proxyIssueDateH, 2)
       frmIndividualHeirs.cmbProxyIssueMonth.text = _
               Mid$(recvHeirDetailMsg.proxyIssueDateH, 5, 2)
       frmIndividualHeirs.txtProxyIssueYear = Mid$(recvHeirDetailMsg.proxyIssueDateH, 1, 4)
    Else
       frmIndividualHeirs.optProxyDateGreg.Value = True
       frmIndividualHeirs.cmbProxyIssueDate.text = _
               Right$(recvHeirDetailMsg.proxyIssueDateG, 2)
       frmIndividualHeirs.cmbProxyIssueMonth.text = _
               Mid$(recvHeirDetailMsg.proxyIssueDateG, 5, 2)
       frmIndividualHeirs.txtProxyIssueYear = Mid$(recvHeirDetailMsg.proxyIssueDateG, 1, 4)
    End If

End Sub
