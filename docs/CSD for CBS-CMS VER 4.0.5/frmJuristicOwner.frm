VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmJuristicOwner 
   BackColor       =   &H00BFD87E&
   Caption         =   "Owner/ Management Details"
   ClientHeight    =   8760
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12060
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8760
   ScaleWidth      =   12060
   Begin VB.Frame FrameIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame7"
      Height          =   855
      Left            =   120
      TabIndex        =   120
      Top             =   2280
      Width           =   11775
      Begin VB.TextBox txtIdExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   8760
         MaxLength       =   4
         TabIndex        =   15
         Tag             =   "11775"
         Top             =   465
         Width           =   585
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8085
         TabIndex        =   14
         Tag             =   "11775"
         Text            =   "01"
         Top             =   450
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   7485
         TabIndex        =   13
         Tag             =   "11775"
         Text            =   "01"
         Top             =   450
         Width           =   615
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H00BFD87E&
         Height          =   420
         Left            =   1215
         TabIndex        =   121
         Tag             =   "11775"
         Top             =   390
         Width           =   1830
         Begin VB.OptionButton optIdDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   195
            Left            =   720
            TabIndex        =   9
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   120
            Width           =   1065
         End
         Begin VB.OptionButton optIdDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   8
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbIdIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4320
         TabIndex        =   10
         Tag             =   "11775"
         Text            =   "01"
         Top             =   465
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4920
         TabIndex        =   11
         Tag             =   "11775"
         Text            =   "01"
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txtIdIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   5520
         MaxLength       =   4
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   480
         Width           =   585
      End
      Begin VB.ComboBox cmbIdType 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.TextBox txtIdNo 
         Height          =   315
         Left            =   4320
         MaxLength       =   15
         TabIndex        =   6
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   7440
         TabIndex        =   7
         Tag             =   "11775"
         Top             =   60
         Width           =   2055
      End
      Begin VB.Label lblIdNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "ID No."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   3135
         TabIndex        =   127
         Tag             =   "11775"
         Top             =   60
         Width           =   1215
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
         Left            =   6240
         TabIndex        =   126
         Tag             =   "11775"
         Top             =   510
         Width           =   1215
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
         Left            =   0
         TabIndex        =   125
         Tag             =   "11775"
         Top             =   480
         Width           =   900
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
         Left            =   3120
         TabIndex        =   124
         Tag             =   "11775"
         Top             =   495
         Width           =   930
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
         TabIndex        =   123
         Tag             =   "11775"
         Top             =   45
         Width           =   1020
      End
      Begin VB.Label lblIdIssuedAt 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Issued at"
         BeginProperty Font 
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
         Left            =   6420
         TabIndex        =   122
         Tag             =   "11775"
         Top             =   60
         Width           =   795
      End
   End
   Begin VB.TextBox txtParentCompanyName 
      Height          =   285
      Left            =   1440
      MaxLength       =   30
      TabIndex        =   16
      Tag             =   "11775"
      Top             =   3360
      Width           =   3255
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Exit"
      Height          =   420
      Left            =   8760
      TabIndex        =   75
      ToolTipText     =   "Done"
      Top             =   7920
      Width           =   1320
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "&Add"
      Height          =   420
      Left            =   6120
      TabIndex        =   73
      ToolTipText     =   "Add"
      Top             =   7920
      Width           =   1320
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Update"
      Height          =   420
      Left            =   7440
      TabIndex        =   74
      ToolTipText     =   "Update"
      Top             =   7920
      Width           =   1320
   End
   Begin VB.Frame FrameOwnerType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Owner Type"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   585
      Left            =   135
      TabIndex        =   117
      Top             =   1620
      Width           =   6615
      Begin VB.OptionButton optManager 
         BackColor       =   &H00BFD87E&
         Caption         =   "Manager"
         BeginProperty Font 
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
         Left            =   270
         TabIndex        =   1
         Tag             =   "6615"
         Top             =   240
         Width           =   1065
      End
      Begin VB.OptionButton optTrustee 
         BackColor       =   &H00BFD87E&
         Caption         =   "Trustee"
         BeginProperty Font 
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
         Left            =   1980
         TabIndex        =   2
         Tag             =   "6615"
         Top             =   240
         Width           =   1065
      End
      Begin VB.OptionButton optCashier 
         BackColor       =   &H00BFD87E&
         Caption         =   "Cashier"
         BeginProperty Font 
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
         Left            =   3705
         TabIndex        =   3
         Tag             =   "6615"
         Top             =   240
         Width           =   1425
      End
      Begin VB.OptionButton optOwners 
         BackColor       =   &H00BFD87E&
         Caption         =   "Owners"
         BeginProperty Font 
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
         Left            =   5415
         TabIndex        =   4
         Tag             =   "6615"
         Top             =   240
         Value           =   -1  'True
         Width           =   1065
      End
   End
   Begin VB.Frame FrameHomeAddressInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   120
      TabIndex        =   105
      Top             =   6360
      Width           =   11850
      Begin VB.ComboBox cmbHomeCity 
         Height          =   315
         Left            =   3000
         TabIndex        =   57
         Tag             =   "11850"
         Top             =   360
         Width           =   2055
      End
      Begin VB.TextBox txtHomePagerNo 
         Height          =   285
         Left            =   4875
         MaxLength       =   10
         TabIndex        =   71
         Tag             =   "11850"
         Top             =   1080
         Width           =   1335
      End
      Begin VB.TextBox txtHomeResPhoneCityCode 
         Height          =   285
         Left            =   4875
         MaxLength       =   4
         TabIndex        =   63
         Tag             =   "11850"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtHomeFaxCityCode 
         Height          =   285
         Left            =   8235
         MaxLength       =   4
         TabIndex        =   66
         Tag             =   "11850"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtHomeMobileAreaCode 
         BackColor       =   &H80000004&
         Height          =   285
         Left            =   1155
         MaxLength       =   2
         TabIndex        =   70
         TabStop         =   0   'False
         Tag             =   "11850"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtHomeOffPhoneCityCode 
         Height          =   285
         Left            =   1155
         MaxLength       =   4
         TabIndex        =   60
         Tag             =   "11850"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtHomeEmailAddress 
         Height          =   285
         Left            =   8235
         MaxLength       =   30
         TabIndex        =   72
         Tag             =   "11850"
         Top             =   1080
         Width           =   3405
      End
      Begin VB.TextBox txtHomeFaxExt 
         Height          =   285
         Left            =   9915
         MaxLength       =   4
         TabIndex        =   68
         Tag             =   "11850"
         Top             =   720
         Width           =   645
      End
      Begin VB.TextBox txtHomeFaxNo 
         Height          =   285
         Left            =   8595
         MaxLength       =   10
         TabIndex        =   67
         Tag             =   "11850"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtHomeResPhoneExt 
         Height          =   285
         Left            =   6720
         MaxLength       =   4
         TabIndex        =   65
         Tag             =   "11850"
         Text            =   " "
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtHomeOffPhoneExt 
         Height          =   285
         Left            =   3015
         MaxLength       =   4
         TabIndex        =   62
         Tag             =   "11850"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtHomeMobileNo 
         Height          =   285
         Left            =   1635
         MaxLength       =   10
         TabIndex        =   69
         Tag             =   "11850"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtHomeResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   64
         Tag             =   "11850"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtHomeOffPhoneNo 
         Height          =   285
         Left            =   1635
         MaxLength       =   10
         TabIndex        =   61
         Tag             =   "11850"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbHomeCountry 
         Height          =   315
         Left            =   8280
         TabIndex        =   59
         Tag             =   "11850"
         Text            =   "cmbCountry"
         Top             =   360
         Width           =   2325
      End
      Begin VB.TextBox txtHomeZipCode 
         Height          =   285
         Left            =   6210
         MaxLength       =   10
         TabIndex        =   58
         Tag             =   "11850"
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox txtHomePoBox 
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
         MaxLength       =   10
         TabIndex        =   56
         Tag             =   "11850"
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox txtHomeAddress2 
         Height          =   285
         Left            =   4470
         MaxLength       =   30
         TabIndex        =   55
         Tag             =   "11850"
         Top             =   0
         Width           =   3825
      End
      Begin VB.TextBox txtHomeAddress1 
         Height          =   285
         Left            =   1155
         MaxLength       =   30
         TabIndex        =   54
         Tag             =   "11850"
         Top             =   0
         Width           =   2865
      End
      Begin VB.Label lblHomePager 
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
         Left            =   3675
         TabIndex        =   116
         Tag             =   "11850"
         Top             =   1080
         Width           =   495
      End
      Begin VB.Label lblHomeEmail 
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
         TabIndex        =   115
         Tag             =   "11850"
         Top             =   1080
         Width           =   1140
      End
      Begin VB.Label lblHomeFax 
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
         Left            =   7500
         TabIndex        =   114
         Tag             =   "11850"
         Top             =   750
         Width           =   495
      End
      Begin VB.Label lblHomeMobile 
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
         TabIndex        =   113
         Tag             =   "11850"
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label lblHomePhoneRes 
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
         Left            =   3675
         TabIndex        =   112
         Tag             =   "11850"
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label lblHomePhoneOff 
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
         TabIndex        =   111
         Tag             =   "11850"
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label lblHomeCountry 
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
         Left            =   7500
         TabIndex        =   110
         Tag             =   "11850"
         Top             =   360
         Width           =   885
      End
      Begin VB.Label lblHomeZipCode 
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
         TabIndex        =   109
         Tag             =   "11850"
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label lblHomeCity 
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
         TabIndex        =   108
         Tag             =   "11850"
         Top             =   360
         Width           =   615
      End
      Begin VB.Label lblHomePoBox 
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
         TabIndex        =   107
         Tag             =   "11850"
         Top             =   420
         Width           =   1215
      End
      Begin VB.Label lblHomeAddress 
         BackColor       =   &H00BFD87E&
         Caption         =   "Home Country Address"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   390
         Left            =   15
         TabIndex        =   106
         Tag             =   "11850"
         Top             =   -15
         Width           =   1275
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Frame FrameOwnerEnabled 
      BackColor       =   &H00BFD87E&
      Caption         =   "Owner Enabled"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   525
      Left            =   8760
      TabIndex        =   101
      Top             =   3255
      Width           =   1560
      Begin VB.OptionButton optOwnerEnableNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   225
         Left            =   840
         TabIndex        =   103
         Tag             =   "1560"
         Top             =   240
         Width           =   675
      End
      Begin VB.OptionButton optOwnerEnableYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   225
         Left            =   45
         TabIndex        =   102
         Tag             =   "1560"
         Top             =   225
         Value           =   -1  'True
         Width           =   705
      End
   End
   Begin VB.TextBox txtShareHoldingPerc 
      Height          =   285
      Left            =   6120
      MaxLength       =   3
      TabIndex        =   17
      Tag             =   "11775"
      Top             =   3345
      Width           =   615
   End
   Begin VB.Frame FrameNameInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   120
      TabIndex        =   87
      Top             =   3840
      Width           =   11775
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   18
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
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
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   23
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   24
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
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
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   27
         Tag             =   "11775"
         Top             =   600
         Width           =   3015
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
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   25
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
         TabIndex        =   94
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
         TabIndex        =   93
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
         TabIndex        =   92
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
         Left            =   15
         TabIndex        =   91
         Tag             =   "11775"
         Top             =   255
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
         Left            =   8640
         TabIndex        =   89
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
         TabIndex        =   88
         Tag             =   "11775"
         Top             =   0
         Width           =   1575
      End
   End
   Begin VB.Frame FrameLocalAddressInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   105
      TabIndex        =   0
      Top             =   4845
      Width           =   11775
      Begin VB.Frame Frame1 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   1200
         TabIndex        =   128
         Tag             =   "11775"
         Top             =   -120
         Width           =   2310
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
            TabIndex        =   28
            Tag             =   "2310"
            ToolTipText     =   "PO Box"
            Top             =   150
            Value           =   -1  'True
            Width           =   975
         End
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
            TabIndex        =   29
            Tag             =   "2310"
            ToolTipText     =   "Saudi Post"
            Top             =   180
            Width           =   1155
         End
      End
      Begin VB.TextBox txtSaudiPostGPSNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   5
         TabIndex        =   30
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtSaudiPostStreetName 
         Height          =   285
         Left            =   7560
         MaxLength       =   24
         TabIndex        =   32
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.TextBox txtSaudiPostAdditionalNo 
         Height          =   285
         Left            =   7080
         MaxLength       =   4
         TabIndex        =   39
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostZipCode 
         Height          =   285
         Left            =   5880
         MaxLength       =   5
         TabIndex        =   38
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostUnit 
         Height          =   285
         Left            =   1185
         MaxLength       =   5
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   10
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   1080
         Width           =   1335
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4920
         MaxLength       =   4
         TabIndex        =   44
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8280
         MaxLength       =   4
         TabIndex        =   47
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
         TabIndex        =   50
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1200
         MaxLength       =   4
         TabIndex        =   41
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8280
         MaxLength       =   30
         TabIndex        =   53
         Tag             =   "11775"
         Top             =   1080
         Width           =   3405
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   49
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8640
         MaxLength       =   10
         TabIndex        =   48
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6720
         MaxLength       =   4
         TabIndex        =   46
         Tag             =   "11775"
         Text            =   " "
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3000
         MaxLength       =   4
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   8
         TabIndex        =   51
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   45
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtOffphoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   42
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8280
         TabIndex        =   40
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   360
         Width           =   3450
      End
      Begin VB.TextBox txtZipCode 
         Height          =   285
         Left            =   6120
         TabIndex        =   37
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2880
         TabIndex        =   36
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   360
         Width           =   2055
      End
      Begin VB.TextBox txtPoBox 
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
         TabIndex        =   34
         Tag             =   "11775"
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   8280
         MaxLength       =   30
         TabIndex        =   33
         Tag             =   "11775"
         Top             =   0
         Width           =   3360
      End
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   5040
         MaxLength       =   30
         TabIndex        =   31
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
         Left            =   6840
         TabIndex        =   134
         Tag             =   "11775"
         Top             =   360
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
         Left            =   6000
         TabIndex        =   133
         Tag             =   "11775"
         Top             =   0
         Width           =   1575
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
         TabIndex        =   132
         Tag             =   "11775"
         Top             =   0
         Width           =   1335
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
         TabIndex        =   131
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
         Width           =   1335
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
         TabIndex        =   130
         Tag             =   "11775"
         Top             =   360
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
         TabIndex        =   129
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   1215
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
         TabIndex        =   86
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
         TabIndex        =   85
         Tag             =   "11775"
         Top             =   1080
         Width           =   1095
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
         TabIndex        =   84
         Tag             =   "11775"
         Top             =   720
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
         TabIndex        =   83
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
         Left            =   3720
         TabIndex        =   82
         Tag             =   "11775"
         Top             =   720
         Width           =   1095
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
         TabIndex        =   81
         Tag             =   "11775"
         Top             =   720
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
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   360
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
         Left            =   5040
         TabIndex        =   79
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
         Left            =   2280
         TabIndex        =   78
         Tag             =   "11775"
         Top             =   360
         Width           =   615
      End
      Begin VB.Label lblPoBox 
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
         TabIndex        =   77
         Tag             =   "11775"
         Top             =   360
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
         Left            =   3840
         TabIndex        =   76
         Tag             =   "11775"
         Top             =   -15
         Width           =   1095
      End
   End
   Begin MSFlexGridLib.MSFlexGrid ownerInfoGrid 
      Height          =   1065
      Left            =   120
      TabIndex        =   104
      Top             =   525
      Width           =   11700
      _ExtentX        =   20638
      _ExtentY        =   1879
      _Version        =   393216
      Rows            =   75
      Cols            =   5
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      BackColorBkg    =   12572798
      AllowUserResizing=   1
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
      TabIndex        =   119
      Top             =   8160
      Visible         =   0   'False
      Width           =   615
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
      Left            =   7800
      TabIndex        =   118
      Top             =   240
      Width           =   3765
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
      Left            =   4920
      TabIndex        =   100
      Top             =   240
      Width           =   2565
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   3960
      TabIndex        =   99
      Top             =   240
      Width           =   780
   End
   Begin VB.Label Label4 
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
      Left            =   6780
      TabIndex        =   98
      Top             =   3360
      Width           =   255
   End
   Begin VB.Label lblShareholdingPerc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Shareholding Percentage"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   390
      Left            =   4830
      TabIndex        =   97
      Tag             =   "11775"
      Top             =   3345
      Width           =   1290
   End
   Begin VB.Label lblOwnerDetails 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Owner / Management Details"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   360
      Left            =   240
      TabIndex        =   96
      Top             =   120
      Width           =   3645
   End
   Begin VB.Shape Shape2 
      Height          =   540
      Left            =   120
      Top             =   0
      Width           =   11640
   End
   Begin VB.Line Line5 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   135
      X2              =   11655
      Y1              =   3240
      Y2              =   3240
   End
   Begin VB.Label lblParentCompanyName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Parent Company Name"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   570
      Left            =   120
      TabIndex        =   95
      Tag             =   "11775"
      Top             =   3270
      Width           =   1290
   End
   Begin VB.Line Line6 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   150
      X2              =   11670
      Y1              =   3840
      Y2              =   3840
   End
   Begin VB.Line Line7 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   120
      X2              =   11640
      Y1              =   4770
      Y2              =   4770
   End
   Begin VB.Line Line11 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   135
      X2              =   11655
      Y1              =   6330
      Y2              =   6330
   End
End
Attribute VB_Name = "frmJuristicOwner"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public ownerAddAction As Boolean
Public ownerUpdateAction As Boolean
Public gTelAreaCode As String
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

Private Sub cmbHomeCountry_LostFocus()
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbHomeCountry.text)) <> 0 Then
         tCode = Mid$(cmbHomeCountry.text, 1, 3)
         For i = 0 To cmbHomeCountry.ListCount
             If Mid$(cmbHomeCountry.List(i), 1, 3) = tCode Then
                cmbHomeCountry.ListIndex = i
                Exit For
             End If
         Next i
      End If
      If i > cmbHomeCountry.ListCount Then
         MsgBox errInvalidCountry(UserLang)
         cmbHomeCountry.SetFocus
      End If
   End If
   On Error GoTo 0
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

Private Sub cmbIdIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmdAdd_Click()
    Dim tmpOwnerNo As String
    Dim custNo As String
    Dim recdIdNo As String, recdIdType As String
    Dim tmpRow As Integer
    Dim tmpIdType As String, tmpIdNo As String
    
    If validateFrmJuristicOwner = 1 Then
       Exit Sub
    End If
    
    recdIdType = Mid$(cmbIdType.text, 1, 1)
    recdIdNo = Format(txtIdNo, "!@@@@@@@@@@@@@@@")
    tmpRow = 1
    Do While True
       ownerInfoGrid.Row = tmpRow
       ownerInfoGrid.Col = 0
       custNo = ownerInfoGrid.text
       ownerInfoGrid.Col = 1
       tmpOwnerNo = ownerInfoGrid.text
       If Len(RTrim(tmpOwnerNo)) = 0 Then
          Exit Do
       End If
       ownerInfoGrid.Col = 4
       tmpIdType = Mid$(ownerInfoGrid.text, 1, 1)
       tmpIdNo = Mid$(ownerInfoGrid.text, 3)
       
       If recdIdType = tmpIdType And Trim(recdIdNo) = Trim(tmpIdNo) Then
          MsgBox errIdAlreadySelected(UserLang) & tmpOwnerNo & errCannotSelectAgain(UserLang)
          Exit Sub
       End If
       tmpRow = tmpRow + 1
    Loop

    ownerAddAction = True
    ownerUpdateAction = False
    createOwner
    If recvCustomerMsg.status <> "000" Then
       noOfOwners = noOfOwners - 1
    End If
End Sub

Private Sub cmdCancel_Click()
    Me.Hide
End Sub

Private Sub cmdUpdate_Click()
    If validateFrmJuristicOwner = 1 Then
       Exit Sub
    End If
    ownerAddAction = False
    ownerUpdateAction = True
    createOwner
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim num As String
   Dim tListIndex As Integer
   Dim mQry As String, rowTitle(8) As String
   Dim tWidth As Integer, colwidth(8) As Integer
    
   If UserLang = ARABIC Then
      ChangePositions frmJuristicOwner, 11800
      frmJuristicOwner.Hide
      frmJuristicOwner.RightToLeft = True
   End If
    
    lblMainCategoryDesc = mainCategoryDesc
    lblSubCategoryDesc = subCategoryDesc
    
    frmJuristicOwner.Caption = frmJuristicOwnerCaption(0, UserLang)
    lblOwnerDetails.Caption = frmJuristicOwnerCaption(0, UserLang)
    lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
    FrameOwnerType.Caption = frmJuristicOwnerCaption(1, UserLang)
    optManager.Caption = frmJuristicOwnerCaption(2, UserLang)
    optTrustee.Caption = frmJuristicOwnerCaption(3, UserLang)
    optCashier.Caption = frmJuristicOwnerCaption(4, UserLang)
    optOwners.Caption = frmJuristicOwnerCaption(5, UserLang)
    lblIdType.Caption = frmJuristicOwnerCaption(6, UserLang)
    lblIdNo.Caption = frmJuristicOwnerCaption(7, UserLang)
    lblIdIssuedAt.Caption = frmJuristicOwnerCaption(8, UserLang)
    lblIdDateType.Caption = frmJuristicOwnerCaption(9, UserLang)
    optIdDateHijri.Caption = frmJuristicOwnerCaption(10, UserLang)
    optIdDateGreg.Caption = frmJuristicOwnerCaption(11, UserLang)
    lblIdIssueDate.Caption = frmJuristicOwnerCaption(12, UserLang)
    lblIdExpiryDate.Caption = frmJuristicOwnerCaption(13, UserLang)
    lblParentCompanyName.Caption = frmJuristicOwnerCaption(14, UserLang)
    lblShareholdingPerc.Caption = frmJuristicOwnerCaption(15, UserLang)
    FrameOwnerEnabled.Caption = frmJuristicOwnerCaption(16, UserLang)
    optOwnerEnableYes.Caption = frmJuristicOwnerCaption(17, UserLang)
    optOwnerEnableNo.Caption = frmJuristicOwnerCaption(18, UserLang)
    lblFirstName.Caption = frmJuristicOwnerCaption(19, UserLang)
    lbl2ndName.Caption = frmJuristicOwnerCaption(20, UserLang)
    lbl3rdName.Caption = frmJuristicOwnerCaption(21, UserLang)
    lblLastName.Caption = frmJuristicOwnerCaption(22, UserLang)
    lblShortName.Caption = frmJuristicOwnerCaption(24, UserLang)
    lblArabicName.Caption = frmJuristicOwnerCaption(23, UserLang)
    lblEnglishName.Caption = frmJuristicOwnerCaption(25, UserLang)
    lblAddress1.Caption = frmJuristicOwnerCaption(26, UserLang)
    lblPOBox.Caption = frmJuristicOwnerCaption(27, UserLang)
    lblCity.Caption = frmJuristicOwnerCaption(28, UserLang)
    lblZipCode.Caption = frmJuristicOwnerCaption(29, UserLang)
    lblCountry.Caption = frmJuristicOwnerCaption(30, UserLang)
    lblPhoneOff.Caption = frmJuristicOwnerCaption(31, UserLang)
    lblPhoneRes.Caption = frmJuristicOwnerCaption(32, UserLang)
    lblFax.Caption = frmJuristicOwnerCaption(33, UserLang)
    lblMobile.Caption = frmJuristicOwnerCaption(34, UserLang)
    lblPager.Caption = frmJuristicOwnerCaption(35, UserLang)
    lblEmail.Caption = frmJuristicOwnerCaption(36, UserLang)
    lblHomeAddress = frmJuristicOwnerCaption(37, UserLang)
    lblHomePoBox.Caption = frmJuristicOwnerCaption(38, UserLang)
    lblHomeCity.Caption = frmJuristicOwnerCaption(39, UserLang)
    lblHomeZipCode.Caption = frmJuristicOwnerCaption(40, UserLang)
    lblHomeCountry.Caption = frmJuristicOwnerCaption(41, UserLang)
    lblHomePhoneOff.Caption = frmJuristicOwnerCaption(42, UserLang)
    lblHomePhoneRes.Caption = frmJuristicOwnerCaption(43, UserLang)
    lblHomeFax.Caption = frmJuristicOwnerCaption(44, UserLang)
    lblHomeMobile.Caption = frmJuristicOwnerCaption(45, UserLang)
    lblHomePager.Caption = frmJuristicOwnerCaption(46, UserLang)
    lblHomeEmail.Caption = frmJuristicOwnerCaption(47, UserLang)
    cmdAdd.Caption = frmJuristicOwnerCaption(48, UserLang)
    cmdUpdate.Caption = frmJuristicOwnerCaption(49, UserLang)
    cmdCancel.Caption = frmJuristicOwnerCaption(50, UserLang)
    
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
'    rowTitle(1) = "Owner #"
'    rowTitle(2) = "Owner short Name"
'    rowTitle(3) = "Customer branch code"
'    rowTitle(4) = "IdType-id Number"
      
    ownerInfoGrid.Clear
    ownerInfoGrid.Row = 0
    ownerInfoGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 4
      ownerInfoGrid.Col = i
      If UserLang = ARABIC Then
         ownerInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         ownerInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      ownerInfoGrid.text = frmJuristicOwnerCaption(i + 51, UserLang)
      ownerInfoGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    ownerInfoGrid.Width = tWidth + 100
 
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
           
    mQry = "select * from cityinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbIdIssuedAt.Clear
        cmbCity.Clear
        cmbHomeCity.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbIdIssuedAt.AddItem rs("englishname")
              cmbCity.AddItem rs("englishname")
              cmbHomeCity.AddItem rs("englishname")
           Else
              cmbIdIssuedAt.AddItem rs("arabicname")
              cmbCity.AddItem rs("arabicname")
              cmbHomeCity.AddItem rs("arabicname")
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
             gTelAreaCode = rs(2)
             If UserLang = ENGLISH Then
                cmbIdIssuedAt.text = rs(0)
                cmbCity.text = rs(0)
             Else
                cmbIdIssuedAt.text = rs(1)
                cmbCity.text = rs(1)
             End If
         Else
            txtOffPhoneCityCode = "01"
            txtResPhoneCityCode = "01"
            txtFaxCityCode = "01"
            gTelAreaCode = "01"
            cmbIdIssuedAt.text = ""
            cmbCity.text = ""
         End If
    End If
    
    Set rs = db.OpenRecordset("select * from countryinfo")
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbCountry.Clear
        cmbHomeCountry.Clear
        Do While Not rs.EOF
           If UserLang = ARABIC Then
              cmbCountry.AddItem rs("countrycode") & " - " & rs("arabicname")
              cmbHomeCountry.AddItem rs("countrycode") & " - " & rs("arabicname")
            Else
              cmbCountry.AddItem rs("countrycode") & " - " & rs("englishname")
              cmbHomeCountry.AddItem rs("countrycode") & " - " & rs("englishname")
            End If
           rs.MoveNext
        Loop
        cmbCountry.ListIndex = 0
        cmbHomeCountry.ListIndex = -1
    End If
    
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
    
    If custHistoryAction Then
       lblHistory.Visible = True
       lblHistory.Refresh
    Else
       lblHistory.Visible = False
    End If

   If supervisorAction Or searchAction Or custHistoryAction Then
      cmdAdd.Enabled = False
      cmdUpdate.Enabled = False
      frameIdInfo.Enabled = False
      FrameNameInfo.Enabled = False
      FrameOwnerEnabled.Enabled = False
      FrameLocalAddressInfo.Enabled = False
      FrameHomeAddressInfo.Enabled = False
      txtParentCompanyName.Enabled = False
      txtShareHoldingPerc.Enabled = False
      FrameOwnerEnabled.Enabled = False
      FrameOwnerType.Enabled = False
   Else
      cmdAdd.Enabled = True
      cmdUpdate.Enabled = True
      frameIdInfo.Enabled = True
      FrameNameInfo.Enabled = True
      FrameOwnerEnabled.Enabled = True
      FrameLocalAddressInfo.Enabled = True
      If subCategoryCode = "19" Or subCategoryCode = "20" Or _
         subCategoryCode = "21" Or subCategoryCode = "22" Or _
         subCategoryCode = "23" Or subCategoryCode = "65" Then
         FrameHomeAddressInfo.Enabled = True
      Else
         FrameHomeAddressInfo.Enabled = False
      End If
      txtParentCompanyName.Enabled = True
      txtShareHoldingPerc.Enabled = True
      FrameOwnerEnabled.Enabled = True
      FrameOwnerType.Enabled = True
   End If
   
   cmdUpdate.Enabled = False ' modified by rajesh on 9 dec 2003 to avoid duplicates
                             ' during supervisor approval
   
End Sub

Public Function validateFrmJuristicOwner() As Integer
    Dim tIssueDate As String, tExpiryDate As String
    Dim langCode As String
    
    validateFrmJuristicOwner = 0
    If Len(RTrim(cmbIdType.text)) = 0 Then
        MsgBox errSpaceIdType(UserLang)
        cmbIdType.SetFocus
        validateFrmJuristicOwner = 1
        Exit Function
     Else
        validateFrmJuristicOwner = 0
     End If
     
     If subCategoryCode = "24" Or subCategoryCode = "57" Then   ' cooperative societies or
                                                                ' cooperative fund
        If optCashier.Value = False And optManager.Value = False Then
           MsgBox errOnlyManagerCashier(UserLang)
           validateFrmJuristicOwner = 1
           Exit Function
        Else
           validateFrmJuristicOwner = 0
        End If
     End If ' if subcategorycode = "24"
     
     If Len(RTrim(txtIdNo)) = 0 Then
        MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
        txtIdNo.SetFocus
        validateFrmJuristicOwner = 1
        Exit Function
     Else
        validateFrmJuristicOwner = 0
     End If
     
     If Mid$(cmbIdType.text, 1, 1) = "I" Or _
        Mid$(cmbIdType.text, 1, 1) = "Q" Then
        If Len(Trim(txtIdNo)) <> 10 Then
           MsgBox errInvalidId(UserLang)
           txtIdNo.SetFocus
           validateFrmJuristicOwner = 1
           Exit Function
        Else
           validateFrmJuristicOwner = 0
        End If
        
        If Mid$(cmbIdType.text, 1, 1) = "I" Then
           If Mid$(txtIdNo, 1, 1) <> "1" Then
              MsgBox errInvalidIdCategory(UserLang)
              txtIdNo.SetFocus
              validateFrmJuristicOwner = 1
              Exit Function
           Else
              validateFrmJuristicOwner = 0
           End If
        ElseIf Mid$(cmbIdType.text, 1, 1) = "Q" Then
           If Mid$(txtIdNo, 1, 1) <> "2" And _
              Mid$(txtIdNo, 1, 1) <> "3" And _
              Mid$(txtIdNo, 1, 1) <> "5" Then
              MsgBox errInvalidIdCategory(UserLang)
              txtIdNo.SetFocus
              validateFrmJuristicOwner = 1
              Exit Function
           Else
              validateFrmJuristicOwner = 0
           End If
        End If
        
        If validIdNumber(Trim(txtIdNo)) = False Then
           MsgBox errInvalidIdNo(UserLang)
           txtIdNo.SetFocus
           validateFrmJuristicOwner = 1
           Exit Function
        Else
           validateFrmJuristicOwner = 0
        End If
     End If
     
     If Len(RTrim(cmbIdIssuedAt)) = 0 Then
        MsgBox errSpaceIdIssuedAt(UserLang)
        cmbIdIssuedAt.SetFocus
        validateFrmJuristicOwner = 1
        Exit Function
     Else
        validateFrmJuristicOwner = 0
     End If
     
     If Len(RTrim(cmbIdIssueDate.text)) = 0 Or _
        Len(RTrim(cmbIdIssueMonth.text)) = 0 Or _
        Len(RTrim(txtIdIssueYear)) = 0 Then
        MsgBox errSpaceIssueDate(UserLang)
        cmbIdIssueDate.SetFocus
        validateFrmJuristicOwner = 1
        Exit Function
     Else
        validateFrmJuristicOwner = 0
     End If

     tIssueDate = CStr(txtIdIssueYear) + _
                  CStr(cmbIdIssueMonth.text) + _
                  CStr(cmbIdIssueDate.text)
     tExpiryDate = CStr(txtIdExpiryYear) + _
                   CStr(cmbIdExpiryMonth.text) + _
                   CStr(cmbIdExpiryDate.text)
                   
    If optIdDateGreg.Value = True Then
        If Not validDate(tIssueDate) Then
           MsgBox errInvalidDate(UserLang)
           cmbIdIssueDate.SetFocus
           validateFrmJuristicOwner = 1
           Exit Function
        Else
           validateFrmJuristicOwner = 0
        End If
               
        If Not validDate(tExpiryDate) Then
           MsgBox errInvalidDate(UserLang)
           cmbIdExpiryDate.SetFocus
           validateFrmJuristicOwner = 1
           Exit Function
        Else
           validateFrmJuristicOwner = 0
        End If
     End If
                         
     If tExpiryDate < tIssueDate Then
        MsgBox errGreaterExpiryYear(UserLang)
        txtIdExpiryYear.SetFocus
        validateFrmJuristicOwner = 1
        Exit Function
     Else
        validateFrmJuristicOwner = 0
     End If
     
     If optIdDateHijri.Value = True Then
        If tExpiryDate < currentHijriDate Then
           MsgBox errExpiryDateLessThanToday(UserLang)
           txtIdExpiryYear.SetFocus
           validateFrmJuristicOwner = 1
           Exit Function
        Else
           validateFrmJuristicOwner = 0
        End If
     Else
        If tExpiryDate < currentGregDate Then
           MsgBox errExpiryDateLessThanToday(UserLang)
           txtIdExpiryYear.SetFocus
           validateFrmJuristicOwner = 1
           Exit Function
        Else
           validateFrmJuristicOwner = 0
        End If
     End If

     If screenSetNo = "3" Or screenSetNo = "4" Then
        If frmJuristicMain.optLangArabic Then
           langCode = "0"
        Else
           langCode = "1"
        End If
      ElseIf screenSetNo = "5" Then
        If frmJuristicDiplomats.optLangArabic Then
           langCode = "0"
        Else
           langCode = "1"
        End If
      ElseIf screenSetNo = "6" Then
         If frmJuristicNonResident.optLangArabic Then
           langCode = "0"
         Else
           langCode = "1"
         End If
      End If
     
    If langCode = "0" Then
       If Len(RTrim(txtArabFirstName)) = 0 And _
          Len(RTrim(txtArabic2ndName)) = 0 And _
          Len(RTrim(txtArabic3rdName)) = 0 And _
          Len(RTrim(txtArabLastName)) = 0 Then
          MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
          txtArabFirstName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
           
       If Len(RTrim(txtArabShortName)) = 0 Then
          MsgBox errSpaceShortName(UserLang)
          txtArabShortName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    Else
       If Len(RTrim(txtEngFirstName)) = 0 And _
          Len(RTrim(txtEnglish2ndName)) = 0 And _
          Len(RTrim(txtEnglish3rdName)) = 0 And _
          Len(RTrim(txtEngLastName)) = 0 Then
          MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
          txtEngFirstName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
           
       If Len(RTrim(txtEngShortName)) = 0 Then
          MsgBox errSpaceShortName(UserLang)
          txtEngShortName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtArabFirstName)) > 0 Then
       If englishCharFound(txtArabFirstName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabFirstName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtArabic2ndName)) > 0 Then
       If englishCharFound(txtArabic2ndName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabic2ndName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtArabic3rdName)) > 0 Then
       If englishCharFound(txtArabic3rdName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabic3rdName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtArabLastName)) > 0 Then
       If englishCharFound(txtArabLastName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabLastName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtArabShortName)) > 0 Then
       If englishCharFound(txtArabShortName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabShortName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtEngFirstName)) > 0 Then
       If arabicCharFound(txtEngFirstName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngFirstName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtEnglish2ndName)) > 0 Then
       If arabicCharFound(txtEnglish2ndName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEnglish2ndName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtEnglish3rdName)) > 0 Then
       If arabicCharFound(txtEnglish3rdName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEnglish3rdName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtEngLastName)) > 0 Then
       If arabicCharFound(txtEngLastName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngLastName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
    
    If Len(RTrim(txtEngShortName)) > 0 Then
       If arabicCharFound(txtEngShortName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngShortName.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    End If
     
    If optPoBox = True Then
       If Len(RTrim(txtAddress1)) = 0 Or _
          Len(RTrim(txtPOBox)) = 0 Or _
          Len(RTrim(txtZipCode)) = 0 Or _
          Len(RTrim(cmbCity.text)) = 0 Then
          
          MsgBox errSpaceAddress(UserLang) '"Either PoBox or Address line should be entered...Please enter"
          txtAddress1.SetFocus
          validateFrmJuristicOwner = 1
          Exit Function
       Else
          validateFrmJuristicOwner = 0
       End If
    Else ' saudi post office
      If Len(RTrim(txtSaudiPostGPSNo)) = 0 Or _
         Len(RTrim(txtSaudiPostStreetName)) = 0 Or _
         Len(RTrim(txtSaudiPostUnit)) = 0 Or _
         Len(RTrim(cmbCity.text)) = 0 Or _
         Len(RTrim(txtSaudiPostZipCode)) = 0 Or _
         Len(RTrim(txtSaudiPostAdditionalNo)) = 0 Then
         MsgBox errSpaceSaudiAddress(UserLang) '"Saudi Postal address should be entered.. Please enter"
         txtSaudiPostGPSNo.SetFocus
         validateFrmJuristicOwner = 1
         Exit Function
      Else
         validateFrmJuristicOwner = 0
      End If
   End If
    
    If Len(RTrim(txtResPhoneNo)) = 0 And _
       Len(RTrim(txtOffPhoneNo)) = 0 And _
       Len(RTrim(txtFaxNo)) = 0 And _
       Len(RTrim(txtMobileNo)) = 0 Then
       
       MsgBox errSpacePhone(UserLang) ' "Atleast one Phone number should be entered..."
       txtOffPhoneNo.SetFocus
       validateFrmJuristicOwner = 1
       Exit Function
    Else
       validateFrmJuristicOwner = 0
    End If
    
End Function

Public Sub createOwner()
    Dim strmsglen As String
    Dim tmpAccNo As String
    
    formatNewOwnerRequest
   
    SendMsg = ownerInfo.msgLen & ownerInfo.service & gBranchCode & ownerInfo.userId & ownerInfo.dateTime & _
              ownerInfo.creationOrUpdate & ownerInfo.NewOrUpdateFlag & _
              ownerInfo.bmUpdateStatus & ownerInfo.custNo & ownerInfo.ownerNo & ownerInfo.ownerType & _
              ownerInfo.supervisorId & ownerInfo.custBranchCode & ownerInfo.idType & ownerInfo.idNo & _
              ownerInfo.idIssuedAt & ownerInfo.idDateType & ownerInfo.idIssueDateH & ownerInfo.idIssueDateG & _
              ownerInfo.idExpiryDateH & ownerInfo.idExpiryDateG & ownerInfo.parentCompanyName & ownerInfo.shareHoldingPerc & _
              ownerInfo.aFirstName & ownerInfo.a2ndName & ownerInfo.a3rdName & ownerInfo.aLastName & _
              ownerInfo.aShortName & ownerInfo.eFirstName & ownerInfo.e2ndName & ownerInfo.e3rdName & _
              ownerInfo.eLastName & ownerInfo.eShortName & ownerInfo.address1 & ownerInfo.address2 & _
              ownerInfo.poBox & ownerInfo.cityName & ownerInfo.zipCode & ownerInfo.country & _
              ownerInfo.telOffAreaCode & ownerInfo.telOffNo & ownerInfo.telOffExt & _
              ownerInfo.telHomeAreaCode & ownerInfo.telHomeNo & ownerInfo.telHomeExt & _
              ownerInfo.faxAreaCode & ownerInfo.faxNo & ownerInfo.faxExt & ownerInfo.mobileNo & _
              ownerInfo.pagerNo & ownerInfo.eMail & ownerInfo.homeAddress1 & ownerInfo.homeAddress2 & _
              ownerInfo.homePoBox & ownerInfo.homeCityName & ownerInfo.homeZipCode & ownerInfo.homeCountry & _
              ownerInfo.homeTelOffAreaCode & ownerInfo.homeTelOffNo & ownerInfo.homeTelOffExt & ownerInfo.homeTelHomeAreaCode & _
              ownerInfo.homeTelHomeNo & ownerInfo.homeTelHomeExt & ownerInfo.homeFaxAreaCode & _
              ownerInfo.homeFaxNo & ownerInfo.homeFaxExt & ownerInfo.homeMobileNo & ownerInfo.homePagerNo & _
              ownerInfo.homeEmail & ownerInfo.activeStatus & ownerInfo.addressType & Space(50)
           
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmJuristicOwner.MousePointer = vbHourglass
    frmJuristicOwner.cmdAdd.Enabled = False
    frmJuristicOwner.cmdUpdate.Enabled = False
    frmJuristicOwner.cmdCancel.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    
    If retStatus = LocalCommsError Then
       LoadError = True
       frmJuristicOwner.cmdAdd.Enabled = True
       frmJuristicOwner.cmdUpdate.Enabled = True
       frmJuristicOwner.cmdCancel.Enabled = True
       frmJuristicOwner.MousePointer = vbDefault
       Exit Sub
    End If
    
    frmJuristicOwner.cmdAdd.Enabled = True
    'frmJuristicOwner.cmdUpdate.Enabled = True  commented by rajesh on 9 dec 2003 to avoid
                                                ' duplicates during supervisor approval
    frmJuristicOwner.cmdCancel.Enabled = True
    frmJuristicOwner.MousePointer = vbDefault
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
    
    txtOffPhoneCityCode = gTelAreaCode
    txtResPhoneCityCode = gTelAreaCode
    txtFaxCityCode = gTelAreaCode
    txtMobileAreaCode = "05"
         
    ownerKeyUserId = ownerInfo.userId
    ownerKeyBranch = gBranchCode
    ownerKeyDateTime = ownerInfo.dateTime
    
    ' Now adding the new Owner information to the grid
    
    ownerInfoGrid.Row = Val(ownerInfo.ownerNo)
    ownerInfoGrid.Col = 0
    ownerInfoGrid.CellAlignment = flexAlignLeftCenter
    ownerInfoGrid.text = ownerInfo.custNo
    ownerInfoGrid.Col = 1
    ownerInfoGrid.CellAlignment = flexAlignLeftCenter
    ownerInfoGrid.text = ownerInfo.ownerNo
    ownerInfoGrid.Col = 2
    ownerInfoGrid.CellAlignment = flexAlignLeftCenter
    If Len(Trim(ownerInfo.aShortName)) <> 0 Then
       ownerInfoGrid.text = ownerInfo.aShortName
    Else
       ownerInfoGrid.text = ownerInfo.eShortName
    End If
    ownerInfoGrid.Col = 3
    ownerInfoGrid.CellAlignment = flexAlignLeftCenter
    ownerInfoGrid.text = ownerInfo.custBranchCode
    ownerInfoGrid.Col = 4
    ownerInfoGrid.CellAlignment = flexAlignLeftCenter
    ownerInfoGrid.text = ownerInfo.idType & "-" & ownerInfo.idNo
    
End Sub

Public Sub formatNewOwnerRequest()
    Dim mQry As String
    Dim tmpStr As String
 
    ownerInfo.msgLen = Space(6) ' to be calculated
    ownerInfo.service = "78"  ' 78 is for New Owner creation
    ownerInfo.userId = gUserId

    If tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       ownerInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       ownerInfo.supervisorId = Left(recvOwnerDetailMsg.supervisorId, 10)
       ownerInfo.creationOrUpdate = "U"
    Else
       ownerInfo.dateTime = gDateTime
       ownerInfo.creationOrUpdate = "C"
       ownerInfo.supervisorId = Space(10)
    End If
    
    If updateAction Or _
       (tellerAction And recvOwnerDetailMsg.newOrUpdate = "U") Then
       ownerInfo.NewOrUpdateFlag = "U"
    Else
       ownerInfo.NewOrUpdateFlag = "N"
    End If
    
    ownerInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
    If screenSetNo = "3" Or screenSetNo = "4" Then
       If ownerInfo.NewOrUpdateFlag = "N" Then
          ownerInfo.custNo = Space(7)
       Else
          ownerInfo.custNo = frmJuristicMain.txtCustomerNo
       End If
    ElseIf screenSetNo = "5" Then
       If ownerInfo.NewOrUpdateFlag = "N" Then
          ownerInfo.custNo = Space(7)
       Else
          ownerInfo.custNo = frmJuristicDiplomats.txtCustomerNo
       End If
    ElseIf screenSetNo = "6" Then
       If ownerInfo.NewOrUpdateFlag = "N" Then
          ownerInfo.custNo = Space(7)
       Else
          ownerInfo.custNo = frmJuristicNonResident.txtCustomerNo
       End If
    End If
    
    ownerInfo.homeBranch = gBranchCode
    
    If screenSetNo = "3" Or screenSetNo = "4" Then
       ownerInfo.custBranchCode = frmJuristicMain.cmbBranchCode
    ElseIf scrensetno = "5" Then
       ownerInfo.custBranchCode = frmJuristicDiplomats.cmbBranchCode
    ElseIf screenSetNo = "6" Then
       ownerInfo.custBranchCode = frmJuristicNonResident.cmbBranchCode
    End If
    
    If ownerAddAction Then
       noOfOwners = noOfOwners + 1
       ownerInfo.creationOrUpdate = "C"
       If updateAction Then
          ownerInfo.NewOrUpdateFlag = "N"
       End If
    ElseIf ownerUpdateAction Then
       ownerInfo.ownerNo = recvOwnerDetailMsg.ownerNo
       If updateAction Then
          ownerInfo.creationOrUpdate = "C"
       Else
          ownerInfo.creationOrUpdate = "U"
       End If
    End If
     
'    If updateAction Then
'       noOfOwners = recvOwnerDetailMsg.ownerNo
'    ElseIf Not tellerAction Then
'       noOfOwners = noOfOwners + 1
'    Else
'       noOfOwners = recvOwnerDetailMsg.ownerNo
'    End If
    
    If Not ownerUpdateAction Then
       ownerInfo.ownerNo = Format(noOfOwners, "0000")
    End If
    
    If optManager Then
       ownerInfo.ownerType = "M"
    ElseIf optCashier Then
       ownerInfo.ownerType = "C"
    ElseIf optTrustee Then
       ownerInfo.ownerType = "T"
    ElseIf optOwners Then
       ownerInfo.ownerType = "W"
    End If
    
    ownerInfo.idNo = Format(txtIdNo, "!@@@@@@@@@@@@@@@")
    ownerInfo.idType = cmbIdType.text
    
    If optIdDateHijri Then
       ownerInfo.idDateType = "0"
       ownerInfo.idExpiryDateH = Format(txtIdExpiryYear, "0000") & Format(cmbIdExpiryMonth, "00") & Format(cmbIdExpiryDate, "00")
       ownerInfo.idIssueDateH = Format(txtIdIssueYear, "0000") & Format(cmbIdIssueMonth.text, "00") & Format(cmbIdIssueDate, "00")
       ownerInfo.idIssueDateG = Space(8)
       ownerInfo.idExpiryDateG = Space(8)
    Else
       ownerInfo.idDateType = "1"
       ownerInfo.idExpiryDateG = Format(txtIdExpiryYear, "0000") & Format(cmbIdExpiryMonth, "00") & Format(cmbIdExpiryDate, "00")
       ownerInfo.idIssueDateG = Format(txtIdIssueYear, "0000") & Format(cmbIdIssueMonth.text, "00") & Format(cmbIdIssueDate, "00")
       ownerInfo.idIssueDateH = Space(8)
       ownerInfo.idExpiryDateH = Space(8)
    End If
    
    ownerInfo.idIssuedAt = cmbIdIssuedAt.text
    
    ownerInfo.aFirstName = txtArabFirstName
    ownerInfo.a2ndName = txtArabic2ndName
    ownerInfo.a3rdName = txtArabic3rdName
    ownerInfo.aLastName = txtArabLastName
    ownerInfo.aShortName = txtArabShortName
    ownerInfo.eFirstName = txtEngFirstName
    ownerInfo.e2ndName = txtEnglish2ndName
    ownerInfo.e3rdName = txtEnglish3rdName
    ownerInfo.eLastName = txtEngLastName
    ownerInfo.eShortName = txtEngShortName
    
    ownerInfo.parentCompanyName = Format(txtParentCompanyName, "!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    ownerInfo.shareHoldingPerc = txtShareHoldingPerc
    
    If optSaudiPost = True Then
       ownerInfo.addressType = "1"
       'ownerInfo.address1 = Format(txtSaudiPostGPSNo, "!@@@@@") & "-" & txtSaudiPostStreetName
       ownerInfo.address1 = Format(txtSaudiPostGPSNo, "!@@@@@") & " " & txtSaudiPostStreetName
       ownerInfo.poBox = txtSaudiPostUnit
       ownerInfo.zipCode = Format(txtSaudiPostZipCode, "!@@@@@") & "-" & txtSaudiPostAdditionalNo
       ownerInfo.country = "001" ' defaulted to 001-saudi arabia for SAUDI postal
                                            ' address
    Else
       ownerInfo.addressType = "0"
       ownerInfo.address1 = frmJuristicOwner.txtAddress1
       ownerInfo.address2 = frmJuristicOwner.txtAddress2
       ownerInfo.poBox = frmJuristicOwner.txtPOBox
       ownerInfo.zipCode = frmJuristicOwner.txtZipCode
       ownerInfo.country = Left$(frmJuristicOwner.cmbCountry.text, 3)
    End If
    ownerInfo.cityName = frmJuristicOwner.cmbCity.text
    ownerInfo.telOffAreaCode = frmJuristicOwner.txtOffPhoneCityCode
    ownerInfo.telOffNo = frmJuristicOwner.txtOffPhoneNo
    ownerInfo.telOffExt = frmJuristicOwner.txtOffPhoneExt
    ownerInfo.telHomeAreaCode = frmJuristicOwner.txtResPhoneCityCode
    ownerInfo.telHomeNo = frmJuristicOwner.txtResPhoneNo
    ownerInfo.telHomeExt = frmJuristicOwner.txtResPhoneExt
    ownerInfo.faxAreaCode = frmJuristicOwner.txtFaxCityCode
    ownerInfo.faxNo = frmJuristicOwner.txtFaxNo
    ownerInfo.faxExt = frmJuristicOwner.txtFaxExt
    If Len(RTrim(frmJuristicOwner.txtMobileNo)) <> 0 Then
       ownerInfo.mobileNo = frmJuristicOwner.txtMobileAreaCode & frmJuristicOwner.txtMobileNo
    Else
       ownerInfo.mobileNo = Space(10)
    End If
    ownerInfo.pagerNo = frmJuristicOwner.txtPagerNo
    ownerInfo.eMail = frmJuristicOwner.txtEmailAddress

    ownerInfo.homeAddress1 = frmJuristicOwner.txtHomeAddress1
    ownerInfo.homeAddress2 = frmJuristicOwner.txtHomeAddress2
    ownerInfo.homePoBox = frmJuristicOwner.txtHomePoBox
    
    ownerInfo.homeCityName = frmJuristicOwner.cmbHomeCity.text
    ownerInfo.homeZipCode = frmJuristicOwner.txtHomeZipCode
    ownerInfo.homeCountry = Left$(frmJuristicOwner.cmbHomeCountry.text, 3)
    ownerInfo.homeTelOffAreaCode = frmJuristicOwner.txtHomeOffPhoneCityCode
    ownerInfo.homeTelOffNo = frmJuristicOwner.txtHomeOffPhoneNo
    ownerInfo.homeTelOffExt = frmJuristicOwner.txtHomeResPhoneExt
    ownerInfo.homeTelHomeAreaCode = frmJuristicOwner.txtHomeResPhoneCityCode
    ownerInfo.homeTelHomeNo = frmJuristicOwner.txtHomeResPhoneNo
    ownerInfo.homeTelHomeExt = frmJuristicOwner.txtHomeResPhoneExt
    ownerInfo.homeFaxAreaCode = frmJuristicOwner.txtHomeFaxCityCode
    ownerInfo.homeFaxNo = frmJuristicOwner.txtHomeFaxNo
    ownerInfo.homeFaxExt = frmJuristicOwner.txtHomeFaxExt
    If Len(RTrim(frmJuristicOwner.txtHomeMobileNo)) <> 0 Then
       ownerInfo.homeMobileNo = frmJuristicOwner.txtHomeMobileAreaCode & frmJuristicOwner.txtHomeMobileNo
    Else
       ownerInfo.homeMobileNo = Space(10)
    End If
    ownerInfo.homePagerNo = frmJuristicOwner.txtHomePagerNo
    ownerInfo.homeEmail = frmJuristicOwner.txtHomeEmailAddress
    
    
    If optOwnerEnableYes = True Then
       ownerInfo.activeStatus = "1"
    Else
       ownerInfo.activeStatus = "0"
    End If

End Sub

Public Sub fetchOwnerInfo(custNo As String, ownerNo As String)
    Dim strmsglen As String, tCode As String, tuserId As String, tDateTime As String, tBranchCode As String
    Dim recType As String * 2
   
    'If searchAction Or updateAction Then
    If searchAction Then
       recType = "04"
       tuserId = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    Else
       recType = "03"
       tuserId = ownerKeyUserId
       tBranchCode = ownerKeyBranch
       tDateTime = ownerKeyDateTime
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
        
    SendMsg = "000057" & "77" & gBranchCode & recType & tBranchCode & tuserId & tDateTime & Format(custNo, "!@@@@@@@@@@@@@@") & ownerNo
    frmJuristicOwner.MousePointer = vbHourglass
    frmJuristicOwner.cmdCancel.Enabled = False
    'frmJuristicOwner.cmdAdd.Enabled = False
    'frmJuristicOwner.cmdUpdate.Enabled = False
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmJuristicOwner.MousePointer = vbDefault
       frmJuristicOwner.cmdCancel.Enabled = True
       Exit Sub
    End If
    frmJuristicOwner.MousePointer = vbDefault
    frmJuristicOwner.cmdCancel.Enabled = True
'    frmjuristicOwner.cmdDone.Enabled = True
'    frmjuristicOwner.cmdNextJoint.Enabled = True
    parseOwnerDetailResponse
    If recvOwnerDetailMsg.status = "000" Then
       tCode = recvOwnerDetailMsg.idType
       If tCode <> "" Then
          For i = 0 To frmJuristicOwner.cmbIdType.ListCount
              If Mid(frmJuristicOwner.cmbIdType.List(i), 1, 1) = tCode Then
                 frmJuristicOwner.cmbIdType.ListIndex = i
                 Exit For
              End If
          Next i
        Else
          frmJuristicOwner.cmbIdType.ListIndex = -1
        End If
        If i > frmJuristicOwner.cmbIdType.ListCount Then
          frmJuristicOwner.cmbIdType.ListIndex = -1
'          frmCustomer3.cmbIdType.AddItem tCode & "-Not defined in local"
'          frmCustomer3.cmbIdType.ListIndex = frmCustomer3.cmbIdType.ListCount - 1
        End If
       
       frmJuristicOwner.txtIdNo = recvOwnerDetailMsg.idNo
       frmJuristicOwner.cmbIdIssuedAt.text = recvOwnerDetailMsg.idIssuedAt
       
       If recvOwnerDetailMsg.idDateType = "0" Or _
          recvOwnerDetailMsg.idDateType = " " Then
          frmJuristicOwner.optIdDateHijri.Value = True
          frmJuristicOwner.cmbIdIssueDate.text = _
                  Right$(recvOwnerDetailMsg.idIssueDateH, 2)
          frmJuristicOwner.cmbIdIssueMonth.text = _
                  Mid$(recvOwnerDetailMsg.idIssueDateH, 5, 2)
          frmJuristicOwner.txtIdIssueYear = Mid$(recvOwnerDetailMsg.idIssueDateH, 1, 4)
          frmJuristicOwner.cmbIdExpiryDate.text = _
                  Right$(recvOwnerDetailMsg.idExpiryDateH, 2)
          frmJuristicOwner.cmbIdExpiryMonth.text = _
                  Mid$(recvOwnerDetailMsg.idExpiryDateH, 5, 2)
          frmJuristicOwner.txtIdExpiryYear = Mid$(recvOwnerDetailMsg.idExpiryDateH, 1, 4)
       Else
          frmJuristicOwner.optIdDateGreg.Value = True
          frmJuristicOwner.cmbIdIssueDate.text = _
                  Right$(recvOwnerDetailMsg.idIssueDateG, 2)
          frmJuristicOwner.cmbIdIssueMonth.text = _
                  Mid$(recvOwnerDetailMsg.idIssueDateG, 5, 2)
          frmJuristicOwner.txtIdIssueYear = Mid$(recvOwnerDetailMsg.idIssueDateG, 1, 4)
          frmJuristicOwner.cmbIdExpiryDate.text = _
                  Right$(recvOwnerDetailMsg.idExpiryDateG, 2)
          frmJuristicOwner.cmbIdExpiryMonth.text = _
                  Mid$(recvOwnerDetailMsg.idExpiryDateG, 5, 2)
          frmJuristicOwner.txtIdExpiryYear = Mid$(recvOwnerDetailMsg.idExpiryDateG, 1, 4)
       End If
       frmJuristicOwner.txtParentCompanyName = recvOwnerDetailMsg.parentCompanyName
       frmJuristicOwner.txtShareHoldingPerc = recvOwnerDetailMsg.shareHoldingPerc
         
       frmJuristicOwner.txtArabFirstName = _
             recvOwnerDetailMsg.aFirstName
       frmJuristicOwner.txtArabic2ndName = _
             recvOwnerDetailMsg.a2ndName
       frmJuristicOwner.txtArabic3rdName = _
             recvOwnerDetailMsg.a3rdName
       frmJuristicOwner.txtArabLastName = _
             recvOwnerDetailMsg.aLastName
       frmJuristicOwner.txtArabShortName = _
             recvOwnerDetailMsg.aShortName
         
       frmJuristicOwner.txtEngFirstName = _
             recvOwnerDetailMsg.eFirstName
       frmJuristicOwner.txtEnglish2ndName = _
             recvOwnerDetailMsg.e2ndName
       frmJuristicOwner.txtEnglish3rdName = _
             recvOwnerDetailMsg.e3rdName
       frmJuristicOwner.txtEngLastName = _
             recvOwnerDetailMsg.eLastName
       frmJuristicOwner.txtEngShortName = _
             recvOwnerDetailMsg.eShortName
             
       If recvOwnerDetailMsg.addressType = "1" Then
          frmJuristicOwner.optSaudiPost.Value = True
          frmJuristicOwner.txtSaudiPostGPSNo = Mid$(recvOwnerDetailMsg.address1, 1, 5)
          frmJuristicOwner.txtSaudiPostStreetName = Mid$(recvOwnerDetailMsg.address1, 7)
          frmJuristicOwner.txtSaudiPostUnit = recvOwnerDetailMsg.poBox
          frmJuristicOwner.txtSaudiPostZipCode = Mid$(recvOwnerDetailMsg.zipCode, 1, 5)
          frmJuristicOwner.txtSaudiPostAdditionalNo = Mid$(recvOwnerDetailMsg.zipCode, 7)
       Else ' PO Box
          frmJuristicOwner.optPoBox.Value = True
          frmJuristicOwner.txtAddress1 = recvOwnerDetailMsg.address1
          frmJuristicOwner.txtAddress2 = recvOwnerDetailMsg.address2
          frmJuristicOwner.txtPOBox = recvOwnerDetailMsg.poBox
          frmJuristicOwner.cmbCity.text = recvOwnerDetailMsg.cityName
          frmJuristicOwner.txtZipCode = recvOwnerDetailMsg.zipCode
       
          tCode = Mid$(recvOwnerDetailMsg.country, 1, 3)
          If tCode <> "" Then
             For i = 0 To frmJuristicOwner.cmbCountry.ListCount
                 If Mid(frmJuristicOwner.cmbCountry.List(i), 1, 3) = tCode Then
                    frmJuristicOwner.cmbCountry.ListIndex = i 'RTrim(frmjuristicowner.cmbCountry.List(i))
                    Exit For
                 End If
             Next i
          Else
             frmJuristicOwner.cmbCountry.ListIndex = -1
          End If
          If i > frmJuristicOwner.cmbCountry.ListCount Then
             frmJuristicOwner.cmbCountry.text = tCode & "- Not defined in local"
          End If
      End If
      If Len(RTrim(recvOwnerDetailMsg.telOffAreaCode)) <> 0 Or _
         Not updateAction Then
         frmJuristicOwner.txtOffPhoneCityCode = recvOwnerDetailMsg.telOffAreaCode
      End If
      frmJuristicOwner.txtOffPhoneNo = recvOwnerDetailMsg.telOffNo
      frmJuristicOwner.txtOffPhoneExt = recvOwnerDetailMsg.telOffExt
      If Len(RTrim(recvOwnerDetailMsg.telHomeAreaCode)) <> 0 Or _
         Not updateAction Then
         frmJuristicOwner.txtResPhoneCityCode = recvOwnerDetailMsg.telHomeAreaCode
      End If
      frmJuristicOwner.txtResPhoneNo = recvOwnerDetailMsg.telHomeNo
      frmJuristicOwner.txtResPhoneExt = recvOwnerDetailMsg.telHomeExt
      If Len(RTrim(recvOwnerDetailMsg.faxAreaCode)) <> 0 Or _
         Not updateAction Then
         frmJuristicOwner.txtFaxCityCode = recvOwnerDetailMsg.faxAreaCode
      End If
      frmJuristicOwner.txtFaxNo = recvOwnerDetailMsg.faxNo
      frmJuristicOwner.txtFaxExt = recvOwnerDetailMsg.faxExt
      frmJuristicOwner.txtMobileAreaCode = Mid$(recvOwnerDetailMsg.mobileNo, 1, 2)
      frmJuristicOwner.txtMobileNo = Mid$(recvOwnerDetailMsg.mobileNo, 3)
      frmJuristicOwner.txtPagerNo = recvOwnerDetailMsg.pagerNo
      frmJuristicOwner.txtEmailAddress = recvOwnerDetailMsg.eMail
  
          
      frmJuristicOwner.txtHomeAddress1 = recvOwnerDetailMsg.homeAddress1
      frmJuristicOwner.txtHomeAddress2 = recvOwnerDetailMsg.homeAddress2
      frmJuristicOwner.cmbHomeCity = recvOwnerDetailMsg.homeCityName
      frmJuristicOwner.txtHomePoBox = recvOwnerDetailMsg.homePoBox
      frmJuristicOwner.txtHomeZipCode = recvOwnerDetailMsg.homeZipCode
      tCode = Mid$(recvOwnerDetailMsg.homeCountry, 1, 3)
      If tCode <> "" Then
         For i = 0 To frmJuristicOwner.cmbHomeCountry.ListCount
             If Mid(frmJuristicOwner.cmbHomeCountry.List(i), 1, 3) = tCode Then
                frmJuristicOwner.cmbHomeCountry.ListIndex = i 'RTrim(frmindividualOthers.cmbCountry.List(i))
                Exit For
             End If
         Next i
      Else
         frmJuristicOwner.cmbHomeCountry.ListIndex = -1
      End If
      If i > frmJuristicOwner.cmbHomeCountry.ListCount Then
         frmJuristicOwner.cmbHomeCountry.text = tCode & "- Not defined in local"
      End If
      If Len(RTrim(recvOwnerDetailMsg.homeTelOffAreaCode)) <> 0 Or _
         Not updateAction Then
         frmJuristicOwner.txtHomeOffPhoneCityCode = recvOwnerDetailMsg.homeTelOffAreaCode
      End If
      frmJuristicOwner.txtHomeOffPhoneNo = recvOwnerDetailMsg.homeTelOffNo
      frmJuristicOwner.txtHomeOffPhoneExt = recvOwnerDetailMsg.homeTelOffExt
      If Len(RTrim(recvOwnerDetailMsg.homeTelHomeAreaCode)) <> 0 Or _
         Not updateAction Then
         frmJuristicOwner.txtHomeResPhoneCityCode = recvOwnerDetailMsg.homeTelHomeAreaCode
      End If
      frmJuristicOwner.txtHomeResPhoneNo = recvOwnerDetailMsg.homeTelHomeNo
      frmJuristicOwner.txtHomeResPhoneExt = recvOwnerDetailMsg.homeTelHomeExt
      If Len(RTrim(recvOwnerDetailMsg.homeFaxAreaCode)) <> 0 Or _
         Not updateAction Then
         frmJuristicOwner.txtHomeFaxCityCode = recvOwnerDetailMsg.homeFaxAreaCode
      End If
      frmJuristicOwner.txtHomeFaxNo = recvOwnerDetailMsg.homeFaxNo
      frmJuristicOwner.txtHomeFaxExt = recvOwnerDetailMsg.homeFaxExt
      frmJuristicOwner.txtHomeMobileAreaCode = Mid$(recvOwnerDetailMsg.homeMobileNo, 1, 2)
      frmJuristicOwner.txtHomeMobileNo = Mid$(recvOwnerDetailMsg.homeMobileNo, 3)
      frmJuristicOwner.txtHomePagerNo = recvOwnerDetailMsg.homePagerNo
      frmJuristicOwner.txtHomeEmailAddress = recvOwnerDetailMsg.homeEmail
       
      If recvOwnerDetailMsg.activeStatus = "1" Then
         frmJuristicOwner.optOwnerEnableYes.Value = True
      Else
         frmJuristicOwner.optOwnerEnableNo.Value = True
      End If
      If recvOwnerDetailMsg.ownerType = "M" Then
         optManager.Value = True
      ElseIf recvOwnerDetailMsg.ownerType = "C" Then
         optCashier.Value = True
      ElseIf recvOwnerDetailMsg.ownerType = "T" Then
         optTrustee.Value = True
      ElseIf recvOwnerDetailMsg.ownerType = "W" Then
         optOwners.Value = True
      End If
      
      If Not supervisorAction And Not searchAction And Not custHistoryAction Then  ' modified by rajesh on 9 dec 03
         cmdUpdate.Enabled = True
      End If
    Else
       If UserLang = ARABIC Then
          MsgBox recvOwnerDetailMsg.aRemarks
       Else
          MsgBox recvOwnerDetailMsg.eRemarks
       End If
       CSD_mdiForm.staticStatus.Panels(3).text = "  "
       Exit Sub
    End If  ' recvOwnerDetailmsg.status = "000"
    
    CSD_mdiForm.staticStatus.Panels(3).text = "   "

End Sub

Public Sub parseOwnerDetailResponse()
    Dim pos As Integer
    
    pos = 1
    
    recvOwnerDetailMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvOwnerDetailMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvOwnerDetailMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvOwnerDetailMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvOwnerDetailMsg.custNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvOwnerDetailMsg.ownerNo = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvOwnerDetailMsg.ownerType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOwnerDetailMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOwnerDetailMsg.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvOwnerDetailMsg.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvOwnerDetailMsg.idType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOwnerDetailMsg.idNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.idIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOwnerDetailMsg.idDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOwnerDetailMsg.idIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOwnerDetailMsg.idIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOwnerDetailMsg.idExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOwnerDetailMsg.idExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvOwnerDetailMsg.parentCompanyName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOwnerDetailMsg.shareHoldingPerc = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvOwnerDetailMsg.aFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.a2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.a3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.aLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.aShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOwnerDetailMsg.eFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.e2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.e3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.eLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvOwnerDetailMsg.eShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOwnerDetailMsg.address1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOwnerDetailMsg.address2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOwnerDetailMsg.poBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.cityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOwnerDetailMsg.zipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.country = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvOwnerDetailMsg.telOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.telOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.telOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.telHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.telHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.telHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.faxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.faxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.faxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.mobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.pagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.eMail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    
    recvOwnerDetailMsg.homeAddress1 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOwnerDetailMsg.homeAddress2 = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOwnerDetailMsg.homePoBox = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.homeCityName = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvOwnerDetailMsg.homeZipCode = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.homeCountry = RTrim(Mid$(RecvStr, pos, 3))
    pos = pos + 3
    recvOwnerDetailMsg.homeTelOffAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.homeTelOffNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.homeTelOffExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.homeTelHomeAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.homeTelHomeNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.homeTelHomeExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.homeFaxAreaCode = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.homeFaxNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.homeFaxExt = RTrim(Mid$(RecvStr, pos, 4))
    pos = pos + 4
    recvOwnerDetailMsg.homeMobileNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.homePagerNo = RTrim(Mid$(RecvStr, pos, 10))
    pos = pos + 10
    recvOwnerDetailMsg.homeEmail = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvOwnerDetailMsg.activeStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvOwnerDetailMsg.addressType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameHomeAddressInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameIdInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameLocalAddressInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameNameInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
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
   
   txtZipCode.Visible = True
   txtZipCode.Refresh
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
   
   txtZipCode.Visible = False
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

Private Sub ownerInfoGrid_DblClick()
    Dim ownerNo As String
    Dim custNo As String
    ownerInfoGrid.Col = 0
    custNo = ownerInfoGrid.text
    ownerInfoGrid.Col = 1
    ownerNo = ownerInfoGrid.text
    If Len(RTrim(ownerNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    fetchOwnerInfo custNo, ownerNo
End Sub

Private Sub ownerInfoGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
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

Private Sub txtHomeEmailAddress_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txthomeEmailAddress_LostFocus()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
      On Error Resume Next
      If Len(RTrim(txtHomeEmailAddress)) <> 0 Then
         If InStr(txtHomeEmailAddress, "@") = 0 Then
            MsgBox errInvalidMailAddress(UserLang) '"E-mail address should contain @ character...Please Re-try"
            txtHomeEmailAddress.SetFocus
         End If
      End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtHomeFaxCityCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeFaxExt_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeFaxNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeMobileAreaCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeMobileNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeOffPhoneCityCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeOffPhoneExt_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeOffPhoneNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomePagerNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomePoBox_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeResPhoneCityCode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeResPhoneExt_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeResPhoneNo_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If

End Sub

Private Sub txtHomeZipCode_KeyPress(KeyAscii As Integer)
   If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If
End Sub

Private Sub txtIdExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIdExpiryYear)) <> 0 Then
        If Len(txtIdExpiryYear) = 4 Then
           txtParentCompanyName.SetFocus
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
       If Len(RTrim(cmbIdExpiryDate)) > 0 And Len(RTrim(cmbIdExpiryMonth)) > 0 Then
          If Len(RTrim(txtIdExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtIdExpiryYear.text = ""
             txtIdExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtIdExpiryYear)) <> 0 Then
          If optIdDateHijri.Value = True Then
             If txtIdExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdExpiryYear.Enabled = True Then
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                Else
                   txtIdExpiryYear.Enabled = True
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                End If
             End If
          Else
             If txtIdExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdExpiryYear.Enabled = True Then
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                Else
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
 If Mid$(cmbIdType, 1, 1) = "I" Or _
    Mid$(cmbIdType, 1, 1) = "Q" Then
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errOnlyNumeralsAllowed(UserLang))
        Exit Sub
    End If
 End If
End Sub

Private Sub txtIdNo_LostFocus()
'  If Screen.ActiveControl.Name = "cmdCancel" Then
'       DoEvents
'  Else
'    On Error Resume Next
'    If Mid$(cmbIdType, 1, 1) = "I" Or _
'       Mid$(cmbIdType, 1, 1) = "Q" Then
'       If Len(Trim(txtIdNo)) <> 10 Then
'          MsgBox errInvalidId(UserLang)
'          txtIdNo.SetFocus
'          Exit Sub
'       End If
'    End If
'    On Error GoTo 0
'  End If
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

Private Sub txtZipCode_KeyPress(KeyAscii As Integer)
   If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If
End Sub
