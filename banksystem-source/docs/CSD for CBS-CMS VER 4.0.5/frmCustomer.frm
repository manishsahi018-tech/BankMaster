VERSION 5.00
Begin VB.Form frmCustomer 
   BackColor       =   &H00BFD87E&
   Caption         =   "Customer Maintenance"
   ClientHeight    =   8310
   ClientLeft      =   270
   ClientTop       =   480
   ClientWidth     =   11670
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8310
   ScaleWidth      =   11670
   WindowState     =   2  'Maximized
   Begin VB.ComboBox cmbBranchCode 
      Enabled         =   0   'False
      Height          =   315
      Left            =   4080
      TabIndex        =   144
      Top             =   120
      Width           =   1695
   End
   Begin VB.CommandButton cmdAcctInfo 
      Caption         =   "Account"
      Height          =   375
      Left            =   2880
      TabIndex        =   142
      ToolTipText     =   "Account Info"
      Top             =   7680
      Width           =   1575
   End
   Begin VB.CommandButton cmdCardInfo 
      Caption         =   "ATM Card"
      Height          =   375
      Left            =   4440
      TabIndex        =   141
      ToolTipText     =   "ATM Card Info"
      Top             =   7680
      Width           =   1575
   End
   Begin VB.ComboBox cmbAltBrCode 
      Height          =   315
      Left            =   7800
      TabIndex        =   140
      Top             =   120
      Width           =   1815
   End
   Begin VB.TextBox txtDobYear 
      Height          =   285
      Left            =   6000
      MaxLength       =   4
      TabIndex        =   30
      Top             =   3360
      Width           =   495
   End
   Begin VB.ComboBox cmbDobMonth 
      Height          =   315
      Left            =   5400
      TabIndex        =   29
      Text            =   "01"
      Top             =   3360
      Width           =   615
   End
   Begin VB.ComboBox cmbDobDate 
      Height          =   315
      Left            =   4800
      TabIndex        =   28
      Text            =   "01"
      Top             =   3360
      Width           =   615
   End
   Begin VB.Frame frameCustomerName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   0
      TabIndex        =   131
      Top             =   2280
      Width           =   11775
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   16
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   19
         Tag             =   "11775"
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   20
         Tag             =   "11775"
         Top             =   240
         Width           =   3015
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   21
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   22
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   24
         Tag             =   "11775"
         Top             =   600
         Width           =   1695
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   25
         Tag             =   "11775"
         Top             =   600
         Width           =   3015
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   18
         Tag             =   "11775"
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   23
         Tag             =   "11775"
         Top             =   600
         Width           =   1575
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
         TabIndex        =   138
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
         Left            =   3120
         TabIndex        =   137
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
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
         TabIndex        =   136
         Tag             =   "11775"
         Top             =   0
         Width           =   1695
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
         TabIndex        =   135
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
         Left            =   0
         TabIndex        =   134
         Tag             =   "11775"
         Top             =   600
         Width           =   1215
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
         TabIndex        =   133
         Tag             =   "11775"
         Top             =   0
         Width           =   2895
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
         TabIndex        =   132
         Tag             =   "11775"
         Top             =   0
         Width           =   1575
      End
   End
   Begin VB.Frame frameIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   855
      Left            =   0
      TabIndex        =   124
      Top             =   840
      Width           =   11775
      Begin VB.TextBox txtId 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   4560
         MaxLength       =   15
         TabIndex        =   2
         Tag             =   "11775"
         Top             =   -15
         Width           =   1695
      End
      Begin VB.ComboBox cmbIdType 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   7680
         TabIndex        =   3
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1815
      End
      Begin VB.Frame frameIdDateType 
         Height          =   495
         Left            =   1200
         TabIndex        =   125
         Tag             =   "11775"
         Top             =   360
         Width           =   1935
         Begin VB.OptionButton optIdDateGregorian 
            Caption         =   "Gregorian"
            Height          =   255
            Left            =   720
            TabIndex        =   5
            TabStop         =   0   'False
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   1095
         End
         Begin VB.OptionButton optIdDateHijri 
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   4
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbIdIssuedate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4560
         TabIndex        =   6
         Tag             =   "11775"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5160
         TabIndex        =   7
         Tag             =   "11775"
         Text            =   "01"
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txtIdIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   5760
         MaxLength       =   4
         TabIndex        =   8
         Tag             =   "11775"
         Top             =   480
         Width           =   495
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7680
         TabIndex        =   9
         Tag             =   "11775"
         Text            =   "01"
         Top             =   480
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8280
         TabIndex        =   10
         Tag             =   "11775"
         Text            =   "01"
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txtIdExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8880
         MaxLength       =   4
         TabIndex        =   11
         Tag             =   "11775"
         Top             =   480
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
         TabIndex        =   130
         Tag             =   "11775"
         Top             =   0
         Width           =   1215
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
         TabIndex        =   129
         Tag             =   "11775"
         Top             =   480
         Width           =   1215
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
         TabIndex        =   128
         Tag             =   "11775"
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label lblIdIssueAt 
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
         TabIndex        =   127
         Tag             =   "11775"
         Top             =   0
         Width           =   1095
      End
      Begin VB.Label lblidType 
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
         TabIndex        =   42
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
         TabIndex        =   126
         Tag             =   "11775"
         Top             =   480
         Width           =   1215
      End
   End
   Begin VB.ComboBox cmbNationality 
      Height          =   315
      Left            =   4560
      TabIndex        =   14
      Text            =   "cmbNationality"
      Top             =   1920
      Width           =   2775
   End
   Begin VB.Frame frameLang 
      Height          =   495
      Left            =   1200
      TabIndex        =   113
      Top             =   1800
      Width           =   1935
      Begin VB.OptionButton optLangArabic 
         Caption         =   "Arabic"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Tag             =   "1935"
         ToolTipText     =   "Arabic"
         Top             =   120
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton optLangEnglish 
         Caption         =   "English"
         Height          =   255
         Left            =   960
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   "1935"
         ToolTipText     =   "English"
         Top             =   120
         Width           =   855
      End
   End
   Begin VB.ComboBox cmbTitle 
      Height          =   315
      Left            =   8400
      TabIndex        =   15
      Text            =   "cmbTitle"
      Top             =   1920
      Width           =   3255
   End
   Begin VB.Frame frameDobDateType 
      Height          =   495
      Left            =   1200
      TabIndex        =   112
      Top             =   3240
      Width           =   1935
      Begin VB.OptionButton optDOBHijri 
         Caption         =   "Hijri"
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Tag             =   "1935"
         ToolTipText     =   "Hijri"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optDOBGreg 
         Caption         =   "Gregorian"
         Height          =   195
         Left            =   720
         TabIndex        =   27
         Tag             =   "1935"
         ToolTipText     =   "Gregorian"
         Top             =   120
         Width           =   1095
      End
   End
   Begin VB.TextBox txtDependents 
      Height          =   285
      Left            =   5280
      MaxLength       =   2
      TabIndex        =   38
      Tag             =   "11775"
      Top             =   3960
      Width           =   495
   End
   Begin VB.Frame frameMaritalStatus 
      Height          =   495
      Left            =   1200
      TabIndex        =   111
      Tag             =   "11775"
      Top             =   3840
      Width           =   2655
      Begin VB.OptionButton optOthers 
         Caption         =   "Others"
         Height          =   255
         Left            =   1680
         TabIndex        =   37
         Tag             =   "2655"
         ToolTipText     =   "Others"
         Top             =   120
         Width           =   855
      End
      Begin VB.OptionButton optMarried 
         Caption         =   "Married"
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Tag             =   "2655"
         ToolTipText     =   "Married"
         Top             =   120
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton optSingle 
         Caption         =   "Single"
         Height          =   255
         Left            =   960
         TabIndex        =   36
         TabStop         =   0   'False
         Tag             =   "2655"
         ToolTipText     =   "Single"
         Top             =   120
         Width           =   735
      End
   End
   Begin VB.Frame frameSex 
      Height          =   495
      Left            =   7320
      TabIndex        =   110
      Tag             =   "11775"
      Top             =   3240
      Width           =   2055
      Begin VB.OptionButton optGenderMale 
         Caption         =   "Male"
         Height          =   255
         Left            =   120
         TabIndex        =   31
         Tag             =   "2055"
         ToolTipText     =   "Male"
         Top             =   120
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton optGenderFemale 
         Caption         =   "Female"
         Height          =   255
         Left            =   960
         TabIndex        =   32
         Tag             =   "2055"
         ToolTipText     =   "Female"
         Top             =   120
         Width           =   975
      End
   End
   Begin VB.ComboBox cmbBusinessType 
      Height          =   315
      Left            =   9960
      TabIndex        =   41
      Tag             =   "11775"
      Text            =   "cmbBusinessType"
      Top             =   3945
      Width           =   1695
   End
   Begin VB.Frame frameResidentStatus 
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
      TabIndex        =   109
      Tag             =   "11775"
      Top             =   3840
      Width           =   2775
      Begin VB.OptionButton optResident 
         Caption         =   "Resident"
         Height          =   195
         Left            =   120
         TabIndex        =   39
         Tag             =   "2775"
         ToolTipText     =   "Resident"
         Top             =   240
         Value           =   -1  'True
         Width           =   975
      End
      Begin VB.OptionButton optNonResident 
         Caption         =   "Non Resident"
         Height          =   195
         Left            =   1200
         TabIndex        =   40
         Tag             =   "2775"
         ToolTipText     =   "Non Resident"
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.Frame frameVIP 
      Height          =   495
      Left            =   10080
      TabIndex        =   108
      Tag             =   "11775"
      Top             =   3240
      Visible         =   0   'False
      Width           =   1575
      Begin VB.OptionButton optVipYes 
         Caption         =   "Yes"
         Height          =   255
         Left            =   120
         TabIndex        =   33
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
      Begin VB.OptionButton optVipNo 
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   34
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.Frame frameCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   0
      TabIndex        =   96
      Top             =   6120
      Width           =   11775
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   1200
         MaxLength       =   30
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   0
         Width           =   3015
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   4440
         MaxLength       =   30
         TabIndex        =   58
         Tag             =   "11775"
         Top             =   0
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
         Left            =   1200
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   360
         Width           =   975
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2880
         TabIndex        =   60
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   360
         Width           =   2055
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6120
         TabIndex        =   61
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8280
         TabIndex        =   62
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   360
         Width           =   1695
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   67
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   73
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3000
         MaxLength       =   4
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6720
         MaxLength       =   4
         TabIndex        =   68
         Tag             =   "11775"
         Text            =   " "
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8640
         MaxLength       =   10
         TabIndex        =   70
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   71
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8280
         MaxLength       =   30
         TabIndex        =   75
         Tag             =   "11775"
         Top             =   1080
         Width           =   3255
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1200
         MaxLength       =   4
         TabIndex        =   63
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
         TabIndex        =   72
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8280
         MaxLength       =   4
         TabIndex        =   69
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4920
         MaxLength       =   4
         TabIndex        =   66
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   10
         TabIndex        =   74
         Tag             =   "11775"
         Top             =   1080
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
         TabIndex        =   107
         Tag             =   "11775"
         Top             =   0
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
         TabIndex        =   106
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
         Left            =   2280
         TabIndex        =   105
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
         Left            =   5040
         TabIndex        =   104
         Tag             =   "11775"
         Top             =   360
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
         TabIndex        =   103
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
         TabIndex        =   102
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
         TabIndex        =   101
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
         TabIndex        =   100
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
         TabIndex        =   99
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.Label lblEmail 
         BackColor       =   &H00BFD87E&
         Caption         =   "E_Mail"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   98
         Tag             =   "11775"
         Top             =   1080
         Width           =   1095
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
         TabIndex        =   97
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
      End
   End
   Begin VB.CommandButton cmdSupervisorComments 
      Caption         =   "Supervisor Comments"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6000
      TabIndex        =   76
      ToolTipText     =   "Supervisor Comments"
      Top             =   7680
      Width           =   2175
   End
   Begin VB.Frame frameCompanyInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1335
      Left            =   0
      TabIndex        =   86
      Top             =   4560
      Width           =   11775
      Begin VB.TextBox txtOrgAlphaSearch 
         Height          =   285
         Left            =   1680
         MaxLength       =   6
         TabIndex        =   56
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtOrgName1English 
         Height          =   285
         Left            =   1320
         MaxLength       =   30
         TabIndex        =   53
         Tag             =   "11775"
         Top             =   720
         Width           =   2895
      End
      Begin VB.TextBox txtOrgName2English 
         Height          =   285
         Left            =   4320
         MaxLength       =   30
         TabIndex        =   54
         Tag             =   "11775"
         Top             =   720
         Width           =   3255
      End
      Begin VB.TextBox txtOrgArabicShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   9120
         MaxLength       =   30
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   360
         Width           =   2535
      End
      Begin VB.TextBox txtOrgEnglishShortName 
         Height          =   285
         Left            =   9120
         MaxLength       =   30
         TabIndex        =   55
         Tag             =   "11775"
         Top             =   720
         Width           =   2535
      End
      Begin VB.TextBox txtOrgName2Arabic 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   4320
         MaxLength       =   30
         TabIndex        =   51
         Tag             =   "11775"
         Top             =   360
         Width           =   3255
      End
      Begin VB.TextBox txtOrgName1Arabic 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1320
         MaxLength       =   30
         TabIndex        =   50
         Tag             =   "11775"
         Top             =   360
         Width           =   2895
      End
      Begin VB.TextBox txtCrIssueYear 
         Height          =   285
         Left            =   11160
         MaxLength       =   4
         TabIndex        =   49
         Tag             =   "11775"
         Top             =   0
         Width           =   495
      End
      Begin VB.ComboBox cmbCrIssueMonth 
         Height          =   315
         Left            =   10560
         TabIndex        =   48
         Tag             =   "11775"
         Text            =   "01"
         Top             =   -15
         Width           =   615
      End
      Begin VB.ComboBox cmbCrIssueDate 
         Height          =   315
         Left            =   9960
         TabIndex        =   47
         Tag             =   "11775"
         Text            =   "01"
         Top             =   -15
         Width           =   615
      End
      Begin VB.Frame Frame9 
         Height          =   450
         Left            =   6960
         TabIndex        =   87
         Tag             =   "11775"
         Top             =   -120
         Width           =   1815
         Begin VB.OptionButton optCRIssueDateHijri 
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   45
            Tag             =   "2055"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optCRIssueDateGreg 
            Caption         =   "Gregorian"
            Height          =   255
            Left            =   720
            TabIndex        =   46
            TabStop         =   0   'False
            Tag             =   "2055"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   1095
         End
      End
      Begin VB.ComboBox cmbCRIssuedCity 
         Height          =   315
         Left            =   4320
         TabIndex        =   44
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1575
      End
      Begin VB.TextBox txtCRnumber 
         Height          =   285
         Left            =   1320
         MaxLength       =   15
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.Label lblOrgAlphaSearch 
         BackColor       =   &H00BFD87E&
         Caption         =   "Org Alpha Search"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label lblOrgNameEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "EnglishName"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   95
         Tag             =   "11775"
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label lblOrgArabicShortName 
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
         Left            =   7680
         TabIndex        =   94
         Tag             =   "11775"
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label lblOrgEnglishShortName 
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
         Left            =   7680
         TabIndex        =   93
         Tag             =   "11775"
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label lblOrgNameArabic 
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
         TabIndex        =   92
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label lblCRIssueDateType 
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
         Left            =   5880
         TabIndex        =   91
         Tag             =   "11775"
         Top             =   -15
         Width           =   975
      End
      Begin VB.Label lblCRNumber 
         BackColor       =   &H00BFD87E&
         Caption         =   "C.R.Number"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Top             =   0
         Width           =   1215
      End
      Begin VB.Label lblCRIssueDate 
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
         Left            =   8760
         TabIndex        =   89
         Tag             =   "11775"
         Top             =   0
         Width           =   1335
      End
      Begin VB.Label lblCRIssuedAt 
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
         Left            =   3360
         TabIndex        =   88
         Tag             =   "11775"
         Top             =   -15
         Width           =   855
      End
   End
   Begin VB.TextBox txtCustomerNo 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   285
      Left            =   1920
      MaxLength       =   7
      TabIndex        =   85
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox txtBranchCode1 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   285
      Left            =   4080
      TabIndex        =   83
      Top             =   480
      Visible         =   0   'False
      Width           =   1455
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
      Height          =   285
      Left            =   10320
      TabIndex        =   81
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   9960
      TabIndex        =   78
      ToolTipText     =   "Cancel"
      Top             =   7680
      Width           =   1335
   End
   Begin VB.CommandButton cmdNextPage 
      Caption         =   "&Next Page"
      Default         =   -1  'True
      Height          =   375
      Left            =   8280
      TabIndex        =   77
      ToolTipText     =   "Next Page"
      Top             =   7680
      Width           =   1575
   End
   Begin VB.ComboBox cmbCustomerType 
      Height          =   315
      Left            =   1200
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   480
      Width           =   1815
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
      TabIndex        =   145
      Top             =   7920
      Visible         =   0   'False
      Width           =   615
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
      Left            =   5880
      TabIndex        =   139
      Top             =   120
      Width           =   1815
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
      Left            =   3240
      TabIndex        =   123
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label lblLangPref 
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
      Height          =   255
      Left            =   0
      TabIndex        =   122
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label lblTitleCode 
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
      Height          =   255
      Left            =   7440
      TabIndex        =   121
      Top             =   1920
      Width           =   975
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
      Height          =   375
      Left            =   0
      TabIndex        =   120
      Tag             =   "11775"
      Top             =   3360
      Width           =   1215
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
      Left            =   3240
      TabIndex        =   119
      Top             =   3360
      Width           =   1455
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
      Left            =   6600
      TabIndex        =   118
      Tag             =   "11775"
      Top             =   3360
      Width           =   615
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
      TabIndex        =   117
      Tag             =   "11775"
      Top             =   3960
      Width           =   1215
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
      Left            =   0
      TabIndex        =   116
      Tag             =   "11775"
      Top             =   3960
      Width           =   1095
   End
   Begin VB.Label lblBusinessType 
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
      Height          =   255
      Left            =   8640
      TabIndex        =   115
      Tag             =   "11775"
      Top             =   3960
      Width           =   1695
   End
   Begin VB.Label lblVip 
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
      Height          =   375
      Left            =   9480
      TabIndex        =   114
      Tag             =   "11775"
      Top             =   3360
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11640
      Y1              =   6000
      Y2              =   6000
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
      Left            =   0
      TabIndex        =   84
      Top             =   120
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
      Left            =   3240
      TabIndex        =   82
      Top             =   120
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
      Left            =   9720
      TabIndex        =   80
      Top             =   120
      Width           =   495
   End
   Begin VB.Line Line6 
      X1              =   0
      X2              =   11640
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Line Line4 
      X1              =   -120
      X2              =   11520
      Y1              =   6120
      Y2              =   6120
   End
   Begin VB.Line Line2 
      X1              =   0
      X2              =   11640
      Y1              =   4440
      Y2              =   4440
   End
   Begin VB.Label lblCustType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cust. Type"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   79
      Top             =   480
      Width           =   1215
   End
End
Attribute VB_Name = "frmCustomer"
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
                cmbBusinessType.ListIndex = i ' RTrim(frmCustomer.cmbBusinessType.List(i))
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
                frmCustomer.cmbCountry.ListIndex = i  ' RTrim(frmCustomer.cmbNationality.List(i))
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

Private Sub cmbCrIssueDate_Change()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Len(RTrim(cmbCrIssuedate.text)) <> 0 Then
       If Len(cmbCrIssuedate.text) = 2 Then
          If cmbCrIssuedate < 1 Or _
             cmbCrIssuedate > IIf(frmCustomer.optCRIssueDateGreg.Value = True, 31, 30) Then
             MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
             cmbCrIssuedate.text = ""
             On Error Resume Next
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
             On Error Resume Next
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

Private Sub cmbCustomerType_Click()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Mid$(cmbCustomerType.text, 1, 1) <> "0" Then
      commercialEnable
'      frameCompanyInfo.Enabled = True
'      frameIdInfo.Enabled = False
'      frameSex.Enabled = False
'      frameMaritalStatus.Enabled = False
'      txtDependents.Enabled = False
      lblDOBDateType.Caption = frmCustomerCaption(71, UserLang)
      lblDateOfBirth.Caption = frmCustomerCaption(72, UserLang)
   Else
       consumerEnable
'      frameCompanyInfo.Enabled = False
'      frameIdInfo.Enabled = True
'      frameSex.Enabled = True
'      frameMaritalStatus.Enabled = True
'      txtDependents.Enabled = True
      lblDOBDateType.Caption = frmCustomerCaption(26, UserLang)
      lblDateOfBirth.Caption = frmCustomerCaption(29, UserLang)
   End If
 End If
End Sub

Private Sub cmbDobDate_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Len(RTrim(cmbDobDate.text)) <> 0 Then
       If Len(cmbDobDate.text) = 2 Then
          If cmbDobDate < 1 Or _
             cmbDobDate > IIf(frmCustomer.optDOBGreg.Value = True, 31, 30) Then
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

Private Sub cmbIdExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdExpiryDate.text)) <> 0 Then
         If Len(cmbIdExpiryDate) = 2 Then
            If cmbIdExpiryDate < 1 Or _
               cmbIdExpiryDate > IIf(frmCustomer.optIdDateGregorian.Value = True, 31, 30) Then
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
               cmbIdIssueDate > IIf(frmCustomer.optIdDateGregorian.Value = True, 31, 30) Then
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
                frmCustomer.cmbNationality.ListIndex = i  ' RTrim(frmCustomer.cmbNationality.List(i))
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
   If Mid$(cmbCustomerType, 1, 1) = "0" Then
      If Mid$(cmbTitle.text, 1, 2) = "02" Or _
         Mid$(cmbTitle.text, 1, 2) = "03" Or _
         Mid$(cmbTitle.text, 1, 2) = "06" Then  ' MISYS
         optGenderFemale.Value = True
      Else
         optGenderMale.Value = True
      End If
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
                frmCustomer.cmbTitle.ListIndex = i
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
'           Me.Hide
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
  Unload frmCustomer2
  Unload frmCustomer3
  If supervisorAction Or tellerAction Then
     Load frmSupervisorApproval
     frmSupervisorApproval.Show
  End If
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
    '       Me.Hide
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

  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If validatefrmCustomer = 1 Then
        Exit Sub
     End If
    
      ' The following if block added after giving the source to MISYS
      ' Earlier, checkCustomerExistance was a subroutine and it was place
      ' before the line "CSD_mdiForm.staticStatus.Panels(3).Text = errLoadingForm(UserLang)
      ' Now, it is changed as function
      
     If checkCustomerExistance = 1 Then
        Exit Sub
     End If
     
     
     If frmCustomer2.optCurrentAcNo.Value = True Then
        frmCustomer2.FrameCardDetails.Enabled = False
     End If
     If Mid$(frmCustomer.cmbCustomerType, 1, 1) <> "0" Then
        frmCustomer2.FrameCardDetails.Enabled = False
     Else
        If Not updateAction Then
           If tellerAction And recvSuperActionMsg.newOrUpdate <> "U" Then
              frmCustomer2.FrameCardDetails.Enabled = True
           End If
        End If
     End If
     
     CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
     
     If Mid$(frmCustomer.cmbCustomerType, 1, 1) <> "0" Then
        frmCustomer2.cmdJointAcc.Enabled = False
        frmCustomer2.optJoint.Enabled = False
        frmCustomer2.FrameCustomerDetail2.Enabled = False
        frmCustomer2.cmbEducation.Enabled = False
        frmCustomer2.cmbProfession.Enabled = False
        frmCustomer2.cmbPosition.Enabled = False
        frmCustomer2.cmbMonthlyIncome.Enabled = False
        frmCustomer2.cmbSegmentation.Enabled = False
        frmCustomer2.chkCompanyAcc.Enabled = False
        frmCustomer2.chkCompanyTransport.Enabled = False
        frmCustomer2.chkOwnCar.Enabled = False
        frmCustomer2.chkOwnHouse.Enabled = False
        frmCustomer2.chkRentedCar.Enabled = False
        frmCustomer2.chkRentedHouse.Enabled = False
        frmCustomer2.txtEmployerName.Enabled = False
        frmCustomer2.txtEmployerPOBox.Enabled = False
        frmCustomer2.txtEmployerCity.Enabled = False
        frmCustomer2.txtEmployerZipcode.Enabled = False
        frmCustomer2.txtDepartment.Enabled = False
        
        frmCustomer2.txtEmployerName.BackColor = &HC0C0C0
        frmCustomer2.txtEmployerPOBox.BackColor = &HC0C0C0
        frmCustomer2.txtEmployerCity.BackColor = &HC0C0C0
        frmCustomer2.txtEmployerZipcode.BackColor = &HC0C0C0
        frmCustomer2.txtDepartment.BackColor = &HC0C0C0
     Else
        frmCustomer2.cmdJointAcc.Enabled = True
        frmCustomer2.optJoint.Enabled = True
        frmCustomer2.FrameCustomerDetail2.Enabled = True
        frmCustomer2.cmbEducation.Enabled = True
        frmCustomer2.cmbProfession.Enabled = True
        frmCustomer2.cmbPosition.Enabled = True
        frmCustomer2.cmbMonthlyIncome.Enabled = True
        frmCustomer2.cmbSegmentation.Enabled = True
        frmCustomer2.chkCompanyAcc.Enabled = True
        frmCustomer2.chkCompanyTransport.Enabled = True
        frmCustomer2.chkOwnCar.Enabled = True
        frmCustomer2.chkOwnHouse.Enabled = True
        frmCustomer2.chkRentedCar.Enabled = True
        frmCustomer2.chkRentedHouse.Enabled = True
        frmCustomer2.txtEmployerName.Enabled = True
        frmCustomer2.txtEmployerPOBox.Enabled = True
        frmCustomer2.txtEmployerCity.Enabled = True
        frmCustomer2.txtEmployerZipcode.Enabled = True
        frmCustomer2.txtDepartment.Enabled = True
        
        frmCustomer2.txtEmployerName.BackColor = &HFFFFFF
        frmCustomer2.txtEmployerPOBox.BackColor = &HFFFFFF
        frmCustomer2.txtEmployerCity.BackColor = &HFFFFFF
        frmCustomer2.txtEmployerZipcode.BackColor = &HFFFFFF
        frmCustomer2.txtDepartment.BackColor = &HFFFFFF
     End If
     
     If updateAction Or _
        (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
        frmCustomer2.optJoint.Enabled = False
     End If
     
     If frmCustomer2.optSingle.Value = True Then
        frmCustomer2.cmdJointAcc.Enabled = False
     Else
        frmCustomer2.cmdJointAcc.Enabled = True
     End If

'     If recvSuperActionMsg.newOrUpdate <> "U" Then
'        If frmCustomer2.optCardDeliveredToPOBox.Value = True Then
'           frmCustomer2.txtDeliveryAddr1.Enabled = True
'           frmCustomer2.txtDeliveryPOBox.Enabled = True
'           frmCustomer2.cmbDeliveryCity.Enabled = True
'           frmCustomer2.txtDeliveryZipcode.Enabled = True
'           frmCustomer2.txtDeliveryAddr2 = "   " & IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") & _
'                                  IIf(Mid$(frmCustomer.cmbBusinessType.Text, 1, 3) = "029", "(R)", "   ") & _
'                                  "BR.CODE:" & Right(gBranchCode, 3)
'           frmCustomer2.txtDeliveryPOBox = frmCustomer.txtPOBox
'           frmCustomer2.txtDeliveryZipcode = frmCustomer.txtPinCode
'
'           If frmCustomer.optLangEnglish.Value = True Then
'              frmCustomer2.txtDeliveryAddr1 = frmCustomer.txtAddress1
'              frmCustomer2.cmbDeliveryCity.Text = frmCustomer.cmbCity.Text
'           Else
'              frmCustomer2.txtDeliveryAddr1 = " "
'              Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
'                               frmCustomer.cmbCity.Text & "'")
'              If rs.RecordCount > 0 Then
'                 frmCustomer2.cmbDeliveryCity.Text = rs(0)
'              Else
'                 frmCustomer2.cmbDeliveryCity.Text = " "
'              End If
'           End If
'         End If
'     End If
   End If
      
'   frmCustomer2.Show
   frmCustomer2.Caption = frmCustomer2Caption(0, UserLang)
   frmCustomer2.lblEducation.Caption = frmCustomer2Caption(1, UserLang)
   frmCustomer2.lblProfession.Caption = frmCustomer2Caption(2, UserLang)
   frmCustomer2.lblPosition.Caption = frmCustomer2Caption(3, UserLang)
   frmCustomer2.lblMonthlyIncome.Caption = frmCustomer2Caption(4, UserLang)
   frmCustomer2.lblSegmentation.Caption = frmCustomer2Caption(5, UserLang)
   frmCustomer2.lblOwnership.Caption = frmCustomer2Caption(6, UserLang)
   frmCustomer2.chkRentedHouse.Caption = frmCustomer2Caption(7, UserLang)
   frmCustomer2.chkOwnHouse.Caption = frmCustomer2Caption(8, UserLang)
   frmCustomer2.chkCompanyAcc.Caption = frmCustomer2Caption(9, UserLang)
   frmCustomer2.chkRentedCar.Caption = frmCustomer2Caption(10, UserLang)
   frmCustomer2.chkOwnCar.Caption = frmCustomer2Caption(11, UserLang)
   frmCustomer2.chkCompanyTransport.Caption = frmCustomer2Caption(12, UserLang)
   frmCustomer2.lblEmployerName.Caption = frmCustomer2Caption(13, UserLang)
   frmCustomer2.lblDepartment.Caption = frmCustomer2Caption(14, UserLang)
   frmCustomer2.lblPOBox.Caption = frmCustomer2Caption(15, UserLang)
   frmCustomer2.lblCity.Caption = frmCustomer2Caption(16, UserLang)
   frmCustomer2.lblZipCode.Caption = frmCustomer2Caption(17, UserLang)
   frmCustomer2.lblDocuments.Caption = frmCustomer2Caption(18, UserLang)
   frmCustomer2.chkDocSignature.Caption = frmCustomer2Caption(19, UserLang)
   frmCustomer2.chkdocIqamacopy.Caption = frmCustomer2Caption(20, UserLang)
   frmCustomer2.chkDocregistrationCert.Caption = frmCustomer2Caption(21, UserLang)
   frmCustomer2.chkEstablishContract.Caption = frmCustomer2Caption(22, UserLang)
   frmCustomer2.chkDocPowerOfAttorney.Caption = frmCustomer2Caption(23, UserLang)
   'frmCustomer2.chkDocNonResidentAcAgreement.Caption = frmCustomer2Caption(24, UserLang)
   frmCustomer2.chkSalaryTransfer.Caption = frmCustomer2Caption(24, UserLang)
   frmCustomer2.chkJointAcAgreement.Caption = frmCustomer2Caption(25, UserLang)
   frmCustomer2.lblOthers.Caption = frmCustomer2Caption(26, UserLang)
   frmCustomer2.lblPackagedAccount.Caption = frmCustomer2Caption(27, UserLang)
'   frmCustomer2.optNone.Caption = frmCustomer2Caption(28, UserLang)
'   frmCustomer2.optGold.Caption = frmCustomer2Caption(29, UserLang)
'   frmCustomer2.optPackageAc.Caption = frmCustomer2Caption(63, UserLang)
'   frmCustomer2.optPlatinum.Caption = frmCustomer2Caption(62, UserLang)
   frmCustomer2.lblInternetBank.Caption = frmCustomer2Caption(64, UserLang)
   frmCustomer2.lblCustomerAdvice.Caption = frmCustomer2Caption(65, UserLang)
   frmCustomer2.optInternetYes.Caption = frmCustomerCaption(34, UserLang)
   frmCustomer2.optInternetNo.Caption = frmCustomerCaption(35, UserLang)
   frmCustomer2.optCustAdviceYes.Caption = frmCustomerCaption(34, UserLang)
   frmCustomer2.optCustAdviceNo.Caption = frmCustomerCaption(35, UserLang)
   frmCustomer2.lblCurrentAccount.Caption = frmCustomer2Caption(30, UserLang)
   frmCustomer2.optCurrentAcYes.Caption = frmCustomerCaption(34, UserLang)
   frmCustomer2.optCurrentAcNo.Caption = frmCustomerCaption(35, UserLang)
   frmCustomer2.lblCurrentAcCurrency.Caption = frmCustomer2Caption(31, UserLang)
   frmCustomer2.lblCurrentAcStatus.Caption = frmCustomer2Caption(32, UserLang)
   frmCustomer2.lblCurrentAcStmtFreq.Caption = frmCustomer2Caption(33, UserLang)
   frmCustomer2.lblCurrentAcCheckBook.Caption = frmCustomer2Caption(34, UserLang)
   frmCustomer2.optCurrentAcCheckBookYes.Caption = frmCustomerCaption(34, UserLang)
   frmCustomer2.optCurrentAcCheckBookNo.Caption = frmCustomerCaption(35, UserLang)
   frmCustomer2.lblSavingAcc.Caption = frmCustomer2Caption(35, UserLang)
   frmCustomer2.optSavingAcYes.Caption = frmCustomerCaption(34, UserLang)
   frmCustomer2.optSavingAcNo.Caption = frmCustomerCaption(35, UserLang)
   frmCustomer2.lblSavingAcCurrency.Caption = frmCustomer2Caption(31, UserLang)
   frmCustomer2.lblSavingAcStatus.Caption = frmCustomer2Caption(32, UserLang)
   frmCustomer2.lblSavingAcStmtFreq.Caption = frmCustomer2Caption(33, UserLang)
   frmCustomer2.lblOtherAccount.Caption = frmCustomer2Caption(36, UserLang)
   frmCustomer2.lblOtherAccurrency.Caption = frmCustomer2Caption(31, UserLang)
   frmCustomer2.lblOtherAcStatus.Caption = frmCustomer2Caption(32, UserLang)
   frmCustomer2.lblOtherAcStmtFreq.Caption = frmCustomer2Caption(33, UserLang)
   frmCustomer2.lblOtherAccheckBook.Caption = frmCustomer2Caption(34, UserLang)
   frmCustomer2.optOtherAcCheckBookYes.Caption = frmCustomerCaption(34, UserLang)
   frmCustomer2.optOtherAcCheckBookNo.Caption = frmCustomerCaption(35, UserLang)
   frmCustomer2.lblSingleOrJointAcc.Caption = frmCustomer2Caption(37, UserLang)
   frmCustomer2.optSingle.Caption = frmCustomer2Caption(38, UserLang)
   frmCustomer2.optJoint.Caption = frmCustomer2Caption(39, UserLang)
   frmCustomer2.lblNatureOfSign.Caption = frmCustomer2Caption(40, UserLang)
   frmCustomer2.optSignSingle.Caption = frmCustomer2Caption(38, UserLang)
   frmCustomer2.optSignJoint.Caption = frmCustomer2Caption(39, UserLang)
   
   frmCustomer2.lblUpdatedForSama.Caption = frmCustomer2Caption(66, UserLang)
   frmCustomer2.lblRelationshipManager.Caption = frmCustomer2Caption(67, UserLang)
   frmCustomer2.lblGeneralMemo.Caption = frmCustomer2Caption(68, UserLang)
   frmCustomer2.optSamaUpdYes.Caption = frmCustomer2Caption(69, UserLang)
   frmCustomer2.optSamaUpdNo.Caption = frmCustomer2Caption(70, UserLang)
  
'   frmCustomer2.lblPrimaryElectronCard.Caption = frmCustomer2Caption(41, UserLang)
'   frmCustomer2.optPrimaryElectronCardYes.Caption = frmCustomerCaption(34, UserLang)
'   frmCustomer2.optPrimaryElectronCardNo.Caption = frmCustomerCaption(35, UserLang)
'   frmCustomer2.lblPrimaryElectronCardName.Caption = frmCustomer2Caption(42, UserLang)
'   frmCustomer2.lblSecondaryElectronCard.Caption = frmCustomer2Caption(43, UserLang)
'   frmCustomer2.optSecondaryElectronCardYes.Caption = frmCustomerCaption(34, UserLang)
'   frmCustomer2.optSecondaryElectronCardNo.Caption = frmCustomerCaption(35, UserLang)
'   frmCustomer2.lblSecondaryElectronCardName.Caption = frmCustomer2Caption(42, UserLang)
   frmCustomer2.lblPrimaryElectronIntlCard.Caption = frmCustomer2Caption(44, UserLang)
   frmCustomer2.optPrimaryElectronIntlCardYes.Caption = frmCustomerCaption(34, UserLang)
   frmCustomer2.optPrimaryElectronIntlCardNo.Caption = frmCustomerCaption(35, UserLang)
   frmCustomer2.lblPrimaryElectronIntlCardName.Caption = frmCustomer2Caption(42, UserLang)
   frmCustomer2.lblSecondaryElectronIntlCard.Caption = frmCustomer2Caption(45, UserLang)
   frmCustomer2.optSecondaryElectronIntlCardYes.Caption = frmCustomerCaption(34, UserLang)
   frmCustomer2.optSecondaryElectronIntlCardNo.Caption = frmCustomerCaption(35, UserLang)
   frmCustomer2.lblSecondaryElectronIntlCardName.Caption = frmCustomer2Caption(42, UserLang)
   frmCustomer2.lblCardDeliveredTo.Caption = frmCustomer2Caption(46, UserLang)
   frmCustomer2.optCardDeliveredToReqBranch.Caption = frmCustomer2Caption(71, UserLang)
   frmCustomer2.optCardDeliveredToBranch.Caption = frmCustomer2Caption(47, UserLang)
   frmCustomer2.optCardDeliveredToPOBox.Caption = frmCustomer2Caption(48, UserLang)
   frmCustomer2.lblDeliveryAddress1.Caption = frmCustomer2Caption(49, UserLang)
   frmCustomer2.lblDeliveryAddress2.Caption = frmCustomer2Caption(50, UserLang)
   frmCustomer2.lblDeliveryPOBox.Caption = frmCustomer2Caption(51, UserLang)
   frmCustomer2.lblDeliveryCity.Caption = frmCustomer2Caption(52, UserLang)
   frmCustomer2.lblDeliveryZipCode.Caption = frmCustomer2Caption(53, UserLang)
   frmCustomer2.cmdPrevPage.Caption = frmCustomer2Caption(54, UserLang)
   frmCustomer2.cmdPrint.Caption = frmCustomer2Caption(55, UserLang)
   If updateAction Or tellerAction Then
      frmCustomer2.cmdCreate.Caption = frmCustomer2Caption(61, UserLang)
   Else
      frmCustomer2.cmdCreate.Caption = frmCustomer2Caption(56, UserLang)
   End If
   frmCustomer2.cmdJointAcc.Caption = frmCustomer2Caption(57, UserLang)
   frmCustomer2.cmdCancel.Caption = frmCustomer2Caption(58, UserLang)
   frmCustomer2.cmdApprove.Caption = frmCustomer2Caption(59, UserLang)
   frmCustomer2.cmdReject.Caption = frmCustomer2Caption(60, UserLang)
'   Me.Hide
   CSD_mdiForm.staticStatus.Panels(3).text = " "
   frmCustomer2.Show
 End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox recvSuperActionMsg.supervisorComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mainBrCode As String, mainBrArbName As String, mainBrEngName As String
    Dim mQry, i, num, tListIndex
    
    If UserLang = ARABIC Then
       ChangePositions frmCustomer, 11800
       frmCustomer.RightToLeft = True
    End If
    
    frmCustomer.Caption = frmCustomerCaption(0, UserLang)
    frmCustomer.lblCustNo.Caption = frmCustomerCaption(1, UserLang)
    frmCustomer.lblBranch.Caption = frmCustomerCaption(2, UserLang)
    frmCustomer.lblSysDate.Caption = frmCustomerCaption(3, UserLang)
    frmCustomer.lblCustType.Caption = frmCustomerCaption(4, UserLang)
    frmCustomer.lblIdType.Caption = frmCustomerCaption(5, UserLang)
    frmCustomer.lblIdNumber.Caption = frmCustomerCaption(6, UserLang)
    frmCustomer.lblIdIssueAt.Caption = frmCustomerCaption(7, UserLang)
    frmCustomer.lblIdDateType.Caption = frmCustomerCaption(8, UserLang)
    frmCustomer.optIdDateHijri.Caption = frmCustomerCaption(9, UserLang)
    frmCustomer.optIdDateGregorian.Caption = frmCustomerCaption(10, UserLang)
    frmCustomer.lblIdIssueDate.Caption = frmCustomerCaption(11, UserLang)
    frmCustomer.lblIdExpiryDate.Caption = frmCustomerCaption(12, UserLang)
    frmCustomer.lblLangPref.Caption = frmCustomerCaption(13, UserLang)
    frmCustomer.optLangArabic.Caption = frmCustomerCaption(14, UserLang)
    frmCustomer.optLangEnglish.Caption = frmCustomerCaption(15, UserLang)
    frmCustomer.lblNationality.Caption = frmCustomerCaption(16, UserLang)
    frmCustomer.lblTitleCode.Caption = frmCustomerCaption(17, UserLang)
    frmCustomer.lblFirstName.Caption = frmCustomerCaption(18, UserLang)
    frmCustomer.lbl2ndName.Caption = frmCustomerCaption(19, UserLang)
    frmCustomer.lbl3rdName.Caption = frmCustomerCaption(20, UserLang)
    frmCustomer.lblLastName.Caption = frmCustomerCaption(21, UserLang)
    frmCustomer.lblArabicName.Caption = frmCustomerCaption(22, UserLang)
    frmCustomer.lblArabicShortName.Caption = frmCustomerCaption(23, UserLang)
    frmCustomer.lblEnglishName.Caption = frmCustomerCaption(24, UserLang)
'    frmCustomer.lblEnglishShortName.Caption = frmCustomerCaption(25, UserLang)
    frmCustomer.lblDOBDateType.Caption = frmCustomerCaption(26, UserLang)
    frmCustomer.lblDateOfBirth.Caption = frmCustomerCaption(29, UserLang)
    frmCustomer.optDOBHijri.Caption = frmCustomerCaption(27, UserLang)
    frmCustomer.optDOBGreg.Caption = frmCustomerCaption(28, UserLang)
    frmCustomer.lblGender.Caption = frmCustomerCaption(30, UserLang)
    frmCustomer.optGenderMale.Caption = frmCustomerCaption(31, UserLang)
    frmCustomer.optGenderFemale.Caption = frmCustomerCaption(32, UserLang)
    frmCustomer.lblVip.Caption = frmCustomerCaption(33, UserLang)
    frmCustomer.optVipYes.Caption = frmCustomerCaption(34, UserLang)
    frmCustomer.optVipNo.Caption = frmCustomerCaption(35, UserLang)
    frmCustomer.lblMaritalStatus.Caption = frmCustomerCaption(36, UserLang)
    frmCustomer.optMarried.Caption = frmCustomerCaption(37, UserLang)
    frmCustomer.optSingle.Caption = frmCustomerCaption(38, UserLang)
    frmCustomer.optOthers.Caption = frmCustomerCaption(39, UserLang)
    frmCustomer.lblDependents.Caption = frmCustomerCaption(40, UserLang)
    frmCustomer.frameResidentStatus.Caption = frmCustomerCaption(41, UserLang)
    frmCustomer.optResident.Caption = frmCustomerCaption(42, UserLang)
    frmCustomer.optNonResident.Caption = frmCustomerCaption(43, UserLang)
    frmCustomer.lblBusinessType.Caption = frmCustomerCaption(44, UserLang)
    frmCustomer.lblCRNumber.Caption = frmCustomerCaption(45, UserLang)
    frmCustomer.lblCRIssuedAt.Caption = frmCustomerCaption(46, UserLang)
    frmCustomer.lblCRIssueDateType.Caption = frmCustomerCaption(47, UserLang)
    frmCustomer.optCRIssueDateHijri.Caption = frmCustomerCaption(48, UserLang)
    frmCustomer.optCRIssueDateGreg.Caption = frmCustomerCaption(49, UserLang)
    frmCustomer.lblCrIssueDate.Caption = frmCustomerCaption(50, UserLang)
    frmCustomer.lblOrgNameArabic.Caption = frmCustomerCaption(51, UserLang)
    frmCustomer.lblOrgArabicShortName.Caption = frmCustomerCaption(52, UserLang)
    frmCustomer.lblOrgNameEnglish.Caption = frmCustomerCaption(53, UserLang)
    frmCustomer.lblOrgEnglishShortName.Caption = frmCustomerCaption(54, UserLang)
    frmCustomer.lblAddress1.Caption = frmCustomerCaption(55, UserLang)
'    frmCustomer.lblAddress2.Caption = frmCustomerCaption(56, UserLang)
    frmCustomer.lblPOBox.Caption = frmCustomerCaption(57, UserLang)
    frmCustomer.lblCity.Caption = frmCustomerCaption(58, UserLang)
    frmCustomer.lblZipCode.Caption = frmCustomerCaption(59, UserLang)
    frmCustomer.lblCountry.Caption = frmCustomerCaption(60, UserLang)
    frmCustomer.lblOffPhone.Caption = frmCustomerCaption(61, UserLang)
    frmCustomer.lblResPhone.Caption = frmCustomerCaption(62, UserLang)
    frmCustomer.lblFax.Caption = frmCustomerCaption(63, UserLang)
    frmCustomer.lblMobile.Caption = frmCustomerCaption(64, UserLang)
    frmCustomer.lblPager.Caption = frmCustomerCaption(65, UserLang)
    frmCustomer.lblEmail.Caption = frmCustomerCaption(66, UserLang)
    frmCustomer.cmdNextPage.Caption = frmCustomerCaption(67, UserLang)
    frmCustomer.cmdCancel.Caption = frmCustomerCaption(68, UserLang)
    frmCustomer.cmdSupervisorComments.Caption = frmCustomerCaption(69, UserLang)
    frmCustomer.cmdAcctInfo.Caption = frmCardDetailsCaption(43, UserLang)
    frmCustomer.cmdCardInfo.Caption = frmCustomerCaption(74, UserLang)
    frmCustomer.lblAltBranchCode.Caption = frmCustomerCaption(73, UserLang)
    frmCustomer.lblOrgAlphaSearch.Caption = frmCustomerCaption(75, UserLang)
    
    txtSysDate.text = Date
    
    If Mid$(cmbCustomerType.text, 1, 1) = "2" Or _
       Mid$(cmbCustomerType.text, 1, 1) = "3" Then
       frameCompanyInfo.Enabled = True 'check the customertype before moving
    Else
       frameCompanyInfo.Enabled = False
    End If
        
    gDateTime = Space(14)   'Date Time to be used for global
       
    On Error GoTo err_handler
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
       tCode = Mid$(frmCustomer.cmbAltBrCode, 1, 4)
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
    
    mQry = "select * from customertypeinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbCustomerType.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbCustomerType.AddItem Right(rs("customertypecode"), 1) & "-" & rs("englishname")
          Else
             cmbCustomerType.AddItem Right(rs("customertypecode"), 1) & "-" & rs("arabicname")
          End If
          rs.MoveNext
       Loop
       cmbCustomerType.ListIndex = 0
    End If
    
    mQry = "select * from idinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbIdType.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbIdType.AddItem rs("idcode") & "-" & rs("englishname")
          Else
             cmbIdType.AddItem rs("idcode") & "-" & rs("arabicname")
          End If
          rs.MoveNext
       Loop
    End If
    If cmbIdType.ListCount > 2 Then
       cmbIdType.ListIndex = 2
    End If
            
    mQry = "select * from cityinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbIdIssuedAt.Clear
        cmbCRIssuedCity.Clear
        cmbCity.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbIdIssuedAt.AddItem rs("englishname")
              cmbCRIssuedCity.AddItem rs("englishname")
              cmbCity.AddItem rs("englishname")
           Else
              cmbIdIssuedAt.AddItem rs("arabicname")
              cmbCRIssuedCity.AddItem rs("arabicname")
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
                cmbIdIssuedAt.text = rs(0)
                cmbCRIssuedCity.text = rs(0)
                cmbCity.text = rs(0)
             Else  ' the following part should be arabized later
                cmbIdIssuedAt.text = rs(1)
                cmbCRIssuedCity.text = rs(1)
                cmbCity.text = rs(1)
             End If
         Else
            txtOffPhoneCityCode = "01"
            txtResPhoneCityCode = "01"
            txtFaxCityCode = "01"
            cmbIdIssuedAt.text = ""
            cmbCRIssuedCity.text = ""
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
    
    cmbIdIssueDate.Clear
    cmbIdIssueMonth.Clear
    cmbDobDate.Clear
    cmbDobMonth.Clear
    cmbCrIssuedate.Clear
    cmbCrIssueMonth.Clear
    cmbIdExpiryDate.Clear
    cmbIdExpiryMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbIdIssueDate.AddItem num
       cmbDobDate.AddItem num
       cmbCrIssuedate.AddItem num
       cmbIdExpiryDate.AddItem num
       If i < 13 Then
          cmbIdIssueMonth.AddItem num
          cmbDobMonth.AddItem num
          cmbCrIssueMonth.AddItem num
          cmbIdExpiryMonth.AddItem num
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
   frmCustomer.txtCustomerNo = Space(7)

   If supervisorAction Or searchAction Or custHistoryAction Then
      frmCustomer.cmbCustomerType.Enabled = False
      frmCustomer.cmbAltBrCode.Enabled = False
      frmCustomer.cmbBranchCode.Enabled = False
      frameCustomerName.Enabled = False
      frameIdInfo.Enabled = False
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
      frmCustomer.frameCompanyInfo.Enabled = False
      If custHistoryAction Then
         frmCustomer.lblHistory.Visible = True
         frmCustomer.lblHistory.Refresh
      Else
         frmCustomer.lblHistory.Visible = False
      End If
   Else
      frmCustomer.cmbCustomerType.Enabled = True
      frmCustomer.cmbAltBrCode.Enabled = True
'      If recvLoginMsg.globalUpdatePriv = "0" Or recvLoginMsg.globalUpdatePriv = " " Then
'         frmCustomer.cmbBranchCode.Enabled = False
'      Else
'         frmCustomer.cmbBranchCode.Enabled = True
'      End If
      frameCustomerName.Enabled = True
      frameIdInfo.Enabled = True
      frameLang.Enabled = True
      cmbNationality.Enabled = True
      cmbTitle.Enabled = True
      frameDobDateType.Enabled = True
      If tellerAction And recvSuperActionMsg.newOrUpdate = "N" Then
         If recvLoginMsg.globalUpdatePriv = "1" Then   ' MISYS
            frmCustomer.cmbBranchCode.Enabled = True
         Else
            frmCustomer.cmbBranchCode.Enabled = False
         End If
           
         If recvLoginMsg.globalUpdatePriv = "2" Then   ' MISYS
            If recvLoginMsg.mainBrEditAllowed = "1" Then
               frmCustomer.cmbBranchCode.Enabled = True
            Else
               frmCustomer.cmbBranchCode.Enabled = False
            End If
         End If
      End If
      
      If updateAction Then
         If gBranchCode = "0499" Then
            frameVIP.Enabled = True
         Else
            frameVIP.Enabled = False
         End If
      ElseIf tellerAction And recvSuperActionMsg.newOrUpdate = "U" Then
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

Private Sub frameCompanyInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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

Private Sub optCRIssueDateGreg_Click()
  If cmbCrIssuedate.ListCount = 30 Then
     cmbCrIssuedate.AddItem 31
  End If
End Sub

Private Sub optCRIssueDateHijri_Click()
   If cmbCrIssuedate.ListCount = 31 Then
      cmbCrIssuedate.RemoveItem 30
    End If
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

Private Sub optIdDateGregorian_Click()
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

Private Sub txtAddress1_KeyPress(KeyAscii As Integer)
   If frmCustomer.optLangArabic Then
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
   If frmCustomer.optLangArabic Then
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
     txtArabShortName = txtArabLastName & " " & txtArabFirstName
     If Len(txtArabShortName) & Len(txtArabic2ndName) < 30 Then
        txtArabShortName = txtArabShortName & " " & txtArabic2ndName
        If Len(txtArabShortName) & Len(txtArabic3rdName) < 30 Then
           txtArabShortName = txtArabShortName & " " & txtArabic3rdName
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

Private Sub txtCrIssueYear_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtCrIssueYear)) <> 0 Then
         If Len(txtCrIssueYear.text) = 4 Then
            On Error Resume Next
            txtOrgName1Arabic.SetFocus
         End If
      End If
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
        On Error Resume Next
        If Len(RTrim(txtCrIssueYear)) <> 0 Then
           If optCRIssueDateHijri.Value = True Then
              If txtCrIssueYear > 1600 Then
                 MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                 txtCrIssueYear.text = ""
                 txtCrIssueYear.SetFocus
              End If
           Else
              If txtCrIssueYear < 1600 Then
                 MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                 txtCrIssueYear.text = ""
                 txtCrIssueYear.SetFocus
              End If
           End If
        End If
     End If
     On Error GoTo 0
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
        On Error Resume Next
        If Len(RTrim(txtDobYear)) <> 0 Then
           If optDOBHijri.Value = True Then
              If txtDobYear > 1600 Then
                 MsgBox errEnterValidYear(UserLang) ' "Enter a valid Year"
                 txtDobYear.text = ""
                 txtDobYear.SetFocus
              End If
           Else
              If txtDobYear < 1600 Then
                 MsgBox errEnterValidYear(UserLang) ' "Enter a valid Year"
                 txtDobYear.text = ""
                 txtDobYear.SetFocus
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
   txtEngShortName = txtEngLastName & " " & txtEngFirstName
   If Len(txtEngShortName) & Len(txtEnglish2ndName) < 30 Then
       txtEngShortName = txtEngShortName & " " & txtEnglish2ndName
       If Len(txtEngShortName) & Len(txtEnglish3rdName) < 30 Then
           txtEngShortName = txtEngShortName & " " & txtEnglish3rdName
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


Private Sub txtId_KeyPress(KeyAscii As Integer)
   If Mid$(cmbIdType.text, 1, 1) = "Q" Or _
      Mid$(cmbIdType.text, 1, 1) = "I" Then
      If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errOnlyNumeralsAllowed(UserLang))
          Exit Sub
      End If
   End If
End Sub

Private Sub txtId_LostFocus()
  
  If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
  Else
    On Error Resume Next
    If Mid$(frmCustomer.cmbIdType.text, 1, 1) = "I" Or _
       Mid$(frmCustomer.cmbIdType.text, 1, 1) = "Q" Then
       If Len(Trim(frmCustomer.txtId)) <> 10 Then
          MsgBox errInvalidId(UserLang)
          txtId.SetFocus
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

Private Sub txtMobileNo_KeyPress(KeyAscii As Integer)
 If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
     KeyAscii = 0
     MsgBox (errOnlyNumeralsAllowed(UserLang))
     Exit Sub
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

Private Sub txtOrgArabicShortName_GotFocus()
    txtOrgArabicShortName = txtOrgName1Arabic & " " & txtOrgName2Arabic
    If Len(txtOrgArabicShortName) > 29 Then
       txtOrgArabicShortName = txtOrgName1Arabic
    End If
End Sub

Private Sub txtOrgArabicShortName_KeyPress(KeyAscii As Integer)
   If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
   End If
End Sub

Private Sub txtOrgEnglishShortName_GotFocus()
   txtOrgEnglishShortName = txtOrgName1English & " " & txtOrgName2English
   If Len(txtOrgEnglishShortName) > 29 Then
      txtOrgEnglishShortName = txtOrgName1English
   End If
End Sub

Private Sub txtOrgEnglishShortName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtOrgName1Arabic_KeyPress(KeyAscii As Integer)
   If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
   End If
End Sub

Private Sub txtOrgName1English_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtOrgName1English_LostFocus()
 
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtOrgName1English)) > 0 Then
         tmpStr = Trim(txtOrgName1English)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtOrgName1English = tmpStr
      End If
   End If
End Sub

Private Sub txtOrgName2Arabic_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errNoEnglishCharacters(UserLang))
       Exit Sub
  End If
End Sub

Private Sub txtOrgName2English_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtOrgName2English_LostFocus()
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtOrgName2English)) > 0 Then
         tmpStr = Trim(txtOrgName2English)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtOrgName2English = tmpStr
      End If
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

Public Function checkCustomerExistance()
     Dim strmsglen, tmpStr, abcStr As String
     Dim tCustNo As String
     Dim newOrUpdate As String
     Dim tIdNo As String
     
     
     If updateAction Or (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
        newOrUpdate = "U"
        tCustNo = Format(txtCustomerNo, "!@@@@@@@")
     Else
        newOrUpdate = "N"
        tCustNo = Space(7)
     End If
     
     If Mid$(cmbCustomerType, 1, 1) <> "0" Then
        tIdNo = Space(15)
     Else
        tIdNo = Format(frmCustomer.txtId, "!@@@@@@@@@@@@@@@")
     End If
     
     SendMsg = "000000" & "48" & gBranchCode & Mid$(cmbIdType, 1, 1) & tIdNo & newOrUpdate & tCustNo
     strmsglen = Format(Len(SendMsg), "000000")
     Mid$(SendMsg, 1, 6) = strmsglen
     DataReceivedFlag = False
     
     ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
     If ReturnStatus = LocalCommsError Then
        LoadError = True
        checkCustomerExistance = 1
        Exit Function
     End If
     
     If recvCheckCustMsg.status <> "000" Then
        If UserLang = ARABIC Then
           MsgBox recvCheckCustMsg.aRemarks
        Else
           MsgBox recvCheckCustMsg.eRemarks
        End If
        checkCustomerExistance = 1
        Exit Function
     End If
     
     ' The following if statement added after giving the source to MISYS
     
     If recvCheckCustMsg.foundInAList = "1" Then
        MsgBox errAListCustomer(UserLang) & recvCheckCustMsg.reportedBank & errNameAList(UserLang) & recvCheckCustMsg.nameInABCList & errOperationNotPossible(UserLang), vbCritical
        checkCustomerExistance = 1
        Exit Function
     End If
    
     If recvCheckCustMsg.foundInBList = "1" Or _
        recvCheckCustMsg.foundInCList = "1" Then
        If UserLang = ARABIC Then
           abcStr = "«·⁄„Ì· „œ—Ã ⁄·Ï «·ﬁ«∆„… «·”Êœ«¡"
        Else
           abcStr = "Customer is found as BlackList on "
        End If
        
'        If recvCheckCustMsg.foundInAList = "1" Then
'           abcStr = abcStr & "A "
'        End If
        If recvCheckCustMsg.foundInBList = "1" Then
           abcStr = abcStr & " B "
        End If
        If recvCheckCustMsg.foundInCList = "1" Then
           abcStr = abcStr & " C "
        End If
        If UserLang = ARABIC Then
           abcStr = abcStr & "„‰ ﬁ»· :" & recvCheckCustMsg.reportedBank & _
                     " «”„ «·⁄„Ì· :" & recvCheckCustMsg.nameInABCList
        Else
           abcStr = abcStr & "reported by : " & recvCheckCustMsg.reportedBank & _
                     " in the name :" & recvCheckCustMsg.nameInABCList
        End If
        MsgBox abcStr
     End If
    
     If recvCheckCustMsg.existingCustomer = "1" Then
        If UserLang = ARABIC Then
           tmpStr = "—ﬁ„ «·ÂÊÌ… „œŒ· «’·« ··⁄„Ì· :" & _
                 recvCheckCustMsg.existCustNo & "  Ê " & _
                 "«”„ «·⁄„Ì·:" & recvCheckCustMsg.existCustName
        Else
           tmpStr = "This Id number already exists for the customer #:" & _
                  recvCheckCustMsg.existCustNo & "  and " & _
                  "Customer Name :" & recvCheckCustMsg.existCustName
        End If
        MsgBox tmpStr
     End If
     
     checkCustomerExistance = 0

End Function
