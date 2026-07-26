VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmIndividualJoint 
   BackColor       =   &H00BFD87E&
   Caption         =   "Joint Account details"
   ClientHeight    =   8730
   ClientLeft      =   105
   ClientTop       =   375
   ClientWidth     =   11835
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8730
   ScaleWidth      =   11835
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Update"
      Height          =   375
      Left            =   4845
      TabIndex        =   146
      ToolTipText     =   "Update"
      Top             =   7755
      Width           =   1335
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "&Add"
      Height          =   375
      Left            =   3480
      TabIndex        =   145
      ToolTipText     =   "Add"
      Top             =   7755
      Width           =   1335
   End
   Begin MSFlexGridLib.MSFlexGrid jointInfoGrid 
      Height          =   1065
      Left            =   45
      TabIndex        =   141
      Top             =   435
      Width           =   11700
      _ExtentX        =   20638
      _ExtentY        =   1879
      _Version        =   393216
      Rows            =   100
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
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Exit"
      Height          =   375
      Left            =   6180
      TabIndex        =   140
      ToolTipText     =   "Cancel"
      Top             =   7755
      Width           =   1335
   End
   Begin VB.Frame framejointcustomerinfo2 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   0
      TabIndex        =   126
      Top             =   6240
      Width           =   11775
      Begin VB.ComboBox cmbEducation 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   66
         Tag             =   "11775"
         Top             =   120
         Width           =   1935
      End
      Begin VB.ComboBox cmbProfession 
         Height          =   315
         Left            =   4440
         Style           =   2  'Dropdown List
         TabIndex        =   67
         Tag             =   "11775"
         Top             =   120
         Width           =   1455
      End
      Begin VB.ComboBox cmbPosition 
         Height          =   315
         Left            =   7080
         Style           =   2  'Dropdown List
         TabIndex        =   68
         Tag             =   "11775"
         Top             =   120
         Width           =   1335
      End
      Begin VB.CheckBox chkRentHome 
         BackColor       =   &H00BFD87E&
         Caption         =   "Rented Home"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   70
         Tag             =   "11775"
         Top             =   465
         Width           =   1575
      End
      Begin VB.CheckBox chkOwnHouse 
         BackColor       =   &H00BFD87E&
         Caption         =   "Own House"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   71
         Tag             =   "11775"
         Top             =   465
         Width           =   1335
      End
      Begin VB.CheckBox chkCompanyAccomodation 
         BackColor       =   &H00BFD87E&
         Caption         =   "Com. Accomodation"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4320
         TabIndex        =   72
         Tag             =   "11775"
         Top             =   465
         Width           =   2295
      End
      Begin VB.CheckBox chkRentCar 
         BackColor       =   &H00BFD87E&
         Caption         =   "Rented Car"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   73
         Tag             =   "11775"
         Top             =   465
         Width           =   1575
      End
      Begin VB.CheckBox chkOwnCar 
         BackColor       =   &H00BFD87E&
         Caption         =   "Own Car"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   8280
         TabIndex        =   74
         Tag             =   "11775"
         Top             =   465
         Width           =   1335
      End
      Begin VB.CheckBox chkCompanyTrans 
         BackColor       =   &H00BFD87E&
         Caption         =   "Company Transport"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   9600
         TabIndex        =   75
         Tag             =   "11775"
         Top             =   465
         Width           =   2055
      End
      Begin VB.TextBox txtEmployerName 
         Height          =   285
         Left            =   1185
         MaxLength       =   30
         TabIndex        =   76
         Tag             =   "11775"
         Top             =   750
         Width           =   2895
      End
      Begin VB.TextBox txtDepartment 
         Height          =   285
         Left            =   5520
         MaxLength       =   20
         TabIndex        =   77
         Tag             =   "11775"
         Top             =   735
         Width           =   1335
      End
      Begin VB.TextBox txtEmployerPoBox 
         Height          =   285
         Left            =   7560
         MaxLength       =   10
         TabIndex        =   78
         Tag             =   "11775"
         Top             =   735
         Width           =   735
      End
      Begin VB.TextBox txtEmployerCity 
         Height          =   285
         Left            =   8880
         MaxLength       =   20
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   735
         Width           =   1095
      End
      Begin VB.ComboBox cmbMonthlyIncome 
         Height          =   315
         Left            =   10080
         Style           =   2  'Dropdown List
         TabIndex        =   69
         Tag             =   "11775"
         Top             =   120
         Width           =   1575
      End
      Begin VB.TextBox txtEmployerZipCode 
         Height          =   285
         Left            =   10560
         MaxLength       =   10
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   735
         Width           =   975
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00BFD87E&
         Height          =   420
         Left            =   1200
         TabIndex        =   143
         Tag             =   "11775"
         Top             =   990
         Width           =   1755
         Begin VB.OptionButton optValid 
            BackColor       =   &H00BFD87E&
            Caption         =   "Valid"
            Height          =   210
            Left            =   75
            TabIndex        =   81
            Tag             =   "1755"
            Top             =   165
            Value           =   -1  'True
            Width           =   780
         End
         Begin VB.OptionButton optInvalid 
            BackColor       =   &H00BFD87E&
            Caption         =   "Invalid"
            Height          =   210
            Left            =   840
            TabIndex        =   82
            Tag             =   "1755"
            Top             =   165
            Width           =   840
         End
      End
      Begin VB.Label lblActiveStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Active Status"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   144
         Tag             =   "11775"
         Top             =   1080
         Width           =   1170
      End
      Begin VB.Label lblEducation 
         BackColor       =   &H00BFD87E&
         Caption         =   "Education"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   136
         Tag             =   "11775"
         Top             =   120
         Width           =   1215
      End
      Begin VB.Label lblProfession 
         BackColor       =   &H00BFD87E&
         Caption         =   "Profession"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   135
         Tag             =   "11775"
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label lblPosition 
         BackColor       =   &H00BFD87E&
         Caption         =   "Position"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   134
         Tag             =   "11775"
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label lblMonthlyIncome 
         BackColor       =   &H00BFD87E&
         Caption         =   "Monthly Income"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   8520
         TabIndex        =   133
         Tag             =   "11775"
         Top             =   120
         Width           =   1575
      End
      Begin VB.Label lblOwnership 
         BackColor       =   &H00BFD87E&
         Caption         =   "Owner Ship"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Top             =   465
         Width           =   1095
      End
      Begin VB.Label lblEmployerName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Employer Name"
         BeginProperty Font 
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
         TabIndex        =   131
         Tag             =   "11775"
         Top             =   690
         Width           =   1065
      End
      Begin VB.Label lblDepartment 
         BackColor       =   &H00BFD87E&
         Caption         =   "Department"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4320
         TabIndex        =   130
         Tag             =   "11775"
         Top             =   735
         Width           =   1215
      End
      Begin VB.Label lblEmployerPoBox 
         BackColor       =   &H00BFD87E&
         Caption         =   "P.O."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   129
         Tag             =   "11775"
         Top             =   735
         Width           =   495
      End
      Begin VB.Label lblEmployerCity 
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
         Left            =   8280
         TabIndex        =   128
         Tag             =   "11775"
         Top             =   735
         Width           =   615
      End
      Begin VB.Label lblEmployerZipCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Zip"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   10080
         TabIndex        =   127
         Tag             =   "11775"
         Top             =   735
         Width           =   375
      End
   End
   Begin VB.Frame frameJointCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   0
      TabIndex        =   114
      Top             =   4710
      Width           =   11775
      Begin VB.Frame Frame1 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   375
         Left            =   1200
         TabIndex        =   147
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
            TabIndex        =   41
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
            TabIndex        =   42
            Tag             =   "2310"
            ToolTipText     =   "Saudi Post"
            Top             =   180
            Width           =   1035
         End
      End
      Begin VB.TextBox txtSaudiPostGPSNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   5
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.TextBox txtSaudiPostStreetName 
         Height          =   285
         Left            =   7800
         MaxLength       =   24
         TabIndex        =   45
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
         Width           =   2775
      End
      Begin VB.TextBox txtSaudiPostAdditionalNo 
         Height          =   285
         Left            =   7200
         MaxLength       =   4
         TabIndex        =   51
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostZipCode 
         Height          =   285
         Left            =   5880
         MaxLength       =   5
         TabIndex        =   50
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtSaudiPostUnit 
         Height          =   285
         Left            =   1185
         MaxLength       =   5
         TabIndex        =   47
         Tag             =   "11775"
         Top             =   360
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   10
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   1080
         Width           =   1335
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4920
         MaxLength       =   2
         TabIndex        =   57
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8280
         MaxLength       =   2
         TabIndex        =   60
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
         TabIndex        =   115
         TabStop         =   0   'False
         Tag             =   "11775"
         Text            =   "05"
         Top             =   1080
         Width           =   375
      End
      Begin VB.TextBox txtOffPhoneCityCode 
         Height          =   285
         Left            =   1200
         MaxLength       =   2
         TabIndex        =   54
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8280
         MaxLength       =   30
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   1080
         Width           =   3375
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   62
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8640
         MaxLength       =   10
         TabIndex        =   61
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6720
         MaxLength       =   4
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3000
         MaxLength       =   4
         TabIndex        =   56
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   8
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   58
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   55
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8280
         TabIndex        =   53
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   360
         Width           =   1695
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6240
         MaxLength       =   10
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2880
         TabIndex        =   49
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   360
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
         TabIndex        =   48
         Tag             =   "11775"
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   8520
         MaxLength       =   30
         TabIndex        =   46
         Tag             =   "11775"
         Top             =   0
         Width           =   3015
      End
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   4920
         MaxLength       =   30
         TabIndex        =   44
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
         TabIndex        =   154
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
         Left            =   6240
         TabIndex        =   153
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
         Left            =   3600
         TabIndex        =   152
         Tag             =   "11775"
         Top             =   0
         Visible         =   0   'False
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
         Left            =   3600
         TabIndex        =   151
         Tag             =   "11775"
         Top             =   0
         Width           =   1215
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
         TabIndex        =   150
         Tag             =   "11775"
         Top             =   0
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
         TabIndex        =   149
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
         TabIndex        =   148
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
         TabIndex        =   125
         Tag             =   "11775"
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label lblEmailAddress 
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
         Left            =   6840
         TabIndex        =   124
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
         Left            =   7560
         TabIndex        =   123
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.Label lblMobileNo 
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
         TabIndex        =   122
         Tag             =   "11775"
         Top             =   1080
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
         TabIndex        =   121
         Tag             =   "11775"
         Top             =   720
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
         TabIndex        =   120
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
         Left            =   7560
         TabIndex        =   119
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
         TabIndex        =   118
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
         TabIndex        =   117
         Tag             =   "11775"
         Top             =   360
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
         TabIndex        =   116
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame FrameJointAcctInfo1 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   2940
      Left            =   15
      TabIndex        =   83
      Top             =   1680
      Width           =   11865
      Begin VB.TextBox txtDOBYear 
         Height          =   285
         Left            =   5520
         MaxLength       =   4
         TabIndex        =   29
         Tag             =   "11865"
         Top             =   2100
         Width           =   495
      End
      Begin VB.ComboBox cmbDOBMonth 
         Height          =   315
         Left            =   4920
         TabIndex        =   28
         Tag             =   "11865"
         Text            =   "01"
         Top             =   2100
         Width           =   615
      End
      Begin VB.ComboBox cmbDOBDate 
         Height          =   315
         Left            =   4320
         TabIndex        =   27
         Tag             =   "11865"
         Text            =   "01"
         Top             =   2100
         Width           =   615
      End
      Begin VB.TextBox txtIdExpiryYear 
         Height          =   285
         Left            =   8640
         MaxLength       =   4
         TabIndex        =   10
         Tag             =   "11865"
         Top             =   405
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         Height          =   315
         Left            =   8040
         TabIndex        =   9
         Tag             =   "11865"
         Text            =   "01"
         Top             =   405
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         Height          =   315
         Left            =   7440
         TabIndex        =   8
         Tag             =   "11865"
         Text            =   "01"
         Top             =   405
         Width           =   615
      End
      Begin VB.TextBox txtIdIssueYear 
         Height          =   285
         Left            =   5640
         MaxLength       =   4
         TabIndex        =   7
         Tag             =   "11865"
         Top             =   405
         Width           =   495
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         Height          =   315
         Left            =   5040
         TabIndex        =   6
         Tag             =   "11865"
         Text            =   "01"
         Top             =   405
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueDate 
         Height          =   315
         Left            =   4440
         TabIndex        =   5
         Tag             =   "11865"
         Text            =   "01"
         Top             =   405
         Width           =   615
      End
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5160
         MaxLength       =   15
         TabIndex        =   22
         Tag             =   "11865"
         Top             =   1680
         Width           =   1575
      End
      Begin VB.ComboBox cmbTitleCode 
         Height          =   315
         Left            =   8640
         TabIndex        =   14
         Tag             =   "11865"
         Text            =   "cmbTitleCode"
         Top             =   765
         Width           =   2655
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   7440
         TabIndex        =   2
         Tag             =   "11865"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1575
      End
      Begin VB.ComboBox cmbIdType 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Tag             =   "11865"
         Top             =   0
         Width           =   1815
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5160
         MaxLength       =   15
         TabIndex        =   17
         Tag             =   "11865"
         Top             =   1320
         Width           =   1575
      End
      Begin VB.TextBox txtIdNumber 
         Height          =   285
         Left            =   4440
         TabIndex        =   1
         Tag             =   "11865"
         Top             =   0
         Width           =   1695
      End
      Begin VB.ComboBox cmbNationality 
         Height          =   315
         Left            =   4440
         TabIndex        =   13
         Tag             =   "11865"
         Text            =   "cmbNationality"
         Top             =   765
         Width           =   2775
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8895
         MaxLength       =   30
         TabIndex        =   24
         Tag             =   "11865"
         Top             =   1680
         Width           =   2805
      End
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6840
         MaxLength       =   15
         TabIndex        =   23
         Tag             =   "11865"
         Text            =   " "
         Top             =   1680
         Width           =   1935
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3240
         MaxLength       =   15
         TabIndex        =   21
         Tag             =   "11865"
         Top             =   1680
         Width           =   1815
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   20
         Tag             =   "11865"
         Top             =   1680
         Width           =   1935
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8895
         MaxLength       =   30
         TabIndex        =   19
         Tag             =   "11865"
         Top             =   1320
         Width           =   2820
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6840
         MaxLength       =   15
         TabIndex        =   18
         Tag             =   "11865"
         Top             =   1320
         Width           =   1935
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3240
         MaxLength       =   15
         TabIndex        =   16
         Tag             =   "11865"
         Top             =   1320
         Width           =   1815
      End
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   15
         Tag             =   "11865"
         Top             =   1320
         Width           =   1935
      End
      Begin VB.Frame frameGender 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   435
         Left            =   7080
         TabIndex        =   88
         Tag             =   "11865"
         Top             =   1980
         Width           =   2055
         Begin VB.OptionButton optGenderFemale 
            BackColor       =   &H00BFD87E&
            Caption         =   "Female"
            Height          =   255
            Left            =   960
            TabIndex        =   31
            Tag             =   "2055"
            Top             =   120
            Width           =   975
         End
         Begin VB.OptionButton optGenderMale 
            BackColor       =   &H00BFD87E&
            Caption         =   "Male"
            Height          =   255
            Left            =   120
            TabIndex        =   30
            Tag             =   "2055"
            Top             =   120
            Value           =   -1  'True
            Width           =   855
         End
      End
      Begin VB.Frame Frame7 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   495
         Left            =   1185
         TabIndex        =   87
         Tag             =   "11865"
         Top             =   2430
         Width           =   2610
         Begin VB.OptionButton optSingle 
            BackColor       =   &H00BFD87E&
            Caption         =   "Single"
            Height          =   255
            Left            =   915
            TabIndex        =   35
            TabStop         =   0   'False
            Tag             =   "2535"
            Top             =   180
            Width           =   735
         End
         Begin VB.OptionButton optMarried 
            BackColor       =   &H00BFD87E&
            Caption         =   "Married"
            Height          =   255
            Left            =   75
            TabIndex        =   34
            Tag             =   "2535"
            Top             =   180
            Value           =   -1  'True
            Width           =   855
         End
         Begin VB.OptionButton optOthers 
            BackColor       =   &H00BFD87E&
            Caption         =   "Others"
            Height          =   255
            Left            =   1680
            TabIndex        =   36
            Tag             =   "2535"
            Top             =   180
            Width           =   825
         End
      End
      Begin VB.TextBox txtDependents 
         Height          =   285
         Left            =   5040
         MaxLength       =   2
         TabIndex        =   37
         Tag             =   "11865"
         Top             =   2565
         Width           =   495
      End
      Begin VB.ComboBox cmbBusinessType 
         Height          =   315
         Left            =   9990
         TabIndex        =   40
         Tag             =   "11865"
         Text            =   "cmbBusinessType"
         Top             =   2565
         Width           =   1695
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
         Left            =   5880
         TabIndex        =   86
         Tag             =   "11865"
         Top             =   2445
         Width           =   2775
         Begin VB.OptionButton optNonResident 
            BackColor       =   &H00BFD87E&
            Caption         =   "Non Resident"
            Height          =   195
            Left            =   1200
            TabIndex        =   39
            Tag             =   "2775"
            Top             =   240
            Width           =   1455
         End
         Begin VB.OptionButton optResident 
            BackColor       =   &H00BFD87E&
            Caption         =   "Resident"
            Height          =   195
            Left            =   120
            TabIndex        =   38
            Tag             =   "2775"
            Top             =   240
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin VB.Frame frameVip 
         BackColor       =   &H00BFD87E&
         Height          =   465
         Left            =   10005
         TabIndex        =   84
         Tag             =   "11865"
         Top             =   1965
         Visible         =   0   'False
         Width           =   1680
         Begin VB.OptionButton optVipNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   255
            Left            =   840
            TabIndex        =   33
            Tag             =   "1575"
            Top             =   150
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optVipYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   32
            Tag             =   "1575"
            Top             =   165
            Width           =   615
         End
      End
      Begin VB.Frame Frame5 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   450
         Left            =   1200
         TabIndex        =   90
         Tag             =   "11865"
         Top             =   1980
         Width           =   1815
         Begin VB.OptionButton optDOBGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   165
            Left            =   705
            TabIndex        =   26
            Tag             =   "1935"
            Top             =   180
            Width           =   990
         End
         Begin VB.OptionButton optDOBHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   210
            Left            =   135
            TabIndex        =   25
            Tag             =   "1935"
            Top             =   180
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame Frame3 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   405
         Left            =   1200
         TabIndex        =   85
         Tag             =   "11865"
         Top             =   630
         Width           =   1935
         Begin VB.OptionButton optLangEnglish 
            BackColor       =   &H00BFD87E&
            Caption         =   "English"
            Height          =   255
            Left            =   960
            TabIndex        =   12
            TabStop         =   0   'False
            Tag             =   "1935"
            Top             =   120
            Width           =   855
         End
         Begin VB.OptionButton optLangArabic 
            BackColor       =   &H00BFD87E&
            Caption         =   "Arabic"
            Height          =   255
            Left            =   120
            TabIndex        =   11
            Tag             =   "1935"
            Top             =   120
            Value           =   -1  'True
            Width           =   855
         End
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   390
         Left            =   1200
         TabIndex        =   89
         Tag             =   "11865"
         Top             =   240
         Width           =   1935
         Begin VB.OptionButton optIdDateGregorian 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   210
            Left            =   750
            TabIndex        =   4
            TabStop         =   0   'False
            Tag             =   "1935"
            Top             =   135
            Width           =   1095
         End
         Begin VB.OptionButton optIdDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   195
            Left            =   120
            TabIndex        =   3
            Tag             =   "1935"
            Top             =   150
            Value           =   -1  'True
            Width           =   615
         End
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
         Left            =   6120
         TabIndex        =   113
         Tag             =   "11865"
         Top             =   2100
         Width           =   975
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
         Left            =   3120
         TabIndex        =   112
         Tag             =   "11865"
         Top             =   2100
         Width           =   1335
      End
      Begin VB.Label lblDOBDateType 
         BackColor       =   &H00BFD87E&
         Caption         =   "DOB date Type"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Tag             =   "11865"
         Top             =   2100
         Width           =   1335
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
         Left            =   7560
         TabIndex        =   110
         Tag             =   "11865"
         Top             =   810
         Width           =   975
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
         TabIndex        =   109
         Tag             =   "11865"
         Top             =   405
         Width           =   1215
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
         TabIndex        =   108
         Tag             =   "11865"
         Top             =   0
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
         Left            =   6240
         TabIndex        =   107
         Tag             =   "11865"
         Top             =   0
         Width           =   1215
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
         Left            =   5160
         TabIndex        =   106
         Tag             =   "11865"
         Top             =   1080
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
         Left            =   6240
         TabIndex        =   105
         Tag             =   "11865"
         Top             =   405
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
         TabIndex        =   104
         Tag             =   "11865"
         Top             =   405
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
         Left            =   3240
         TabIndex        =   103
         Tag             =   "11865"
         Top             =   0
         Width           =   1215
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
         TabIndex        =   102
         Tag             =   "11865"
         Top             =   765
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
         Left            =   8880
         TabIndex        =   101
         Tag             =   "11865"
         Top             =   1080
         Width           =   1935
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
         TabIndex        =   100
         Tag             =   "11865"
         Top             =   1680
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
         TabIndex        =   99
         Tag             =   "11865"
         Top             =   1320
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
         Left            =   6960
         TabIndex        =   98
         Tag             =   "11865"
         Top             =   1080
         Width           =   1335
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
         Left            =   3240
         TabIndex        =   97
         Tag             =   "11865"
         Top             =   1080
         Width           =   1455
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
         TabIndex        =   96
         Tag             =   "11865"
         Top             =   1080
         Width           =   1455
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
         TabIndex        =   95
         Tag             =   "11865"
         Top             =   2565
         Width           =   1095
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
         TabIndex        =   94
         Tag             =   "11865"
         Top             =   2565
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
         Left            =   8655
         TabIndex        =   93
         Tag             =   "11865"
         Top             =   2580
         Width           =   1335
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
         TabIndex        =   92
         Tag             =   "11865"
         Top             =   765
         Width           =   975
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
         Left            =   9360
         TabIndex        =   91
         Tag             =   "11865"
         Top             =   2100
         Visible         =   0   'False
         Width           =   495
      End
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
      TabIndex        =   155
      Top             =   7800
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblJointAccountDetails 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Joint Account Details"
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
      TabIndex        =   142
      Top             =   60
      Width           =   2580
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00800000&
      X1              =   0
      X2              =   11640
      Y1              =   1545
      Y2              =   1545
   End
   Begin VB.Shape Shape1 
      Height          =   510
      Left            =   0
      Top             =   7695
      Width           =   11640
   End
   Begin VB.Shape Shape2 
      Height          =   330
      Left            =   0
      Top             =   45
      Width           =   11775
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
      Left            =   7560
      TabIndex        =   139
      Top             =   75
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
      Left            =   4320
      TabIndex        =   138
      Top             =   75
      Width           =   2925
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   255
      Left            =   3120
      TabIndex        =   137
      Top             =   75
      Width           =   1020
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11880
      Y1              =   6180
      Y2              =   6180
   End
   Begin VB.Line Line4 
      X1              =   0
      X2              =   11640
      Y1              =   4635
      Y2              =   4635
   End
End
Attribute VB_Name = "frmIndividualJoint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmbBusinessType_LostFocus()
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
   Else
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
End If
End Sub

Private Sub cmbCountry_LostFocus()
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
   Else
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
End If
End Sub

Private Sub cmbTitleCode_Click()
   If Mid$(cmbTitleCode.text, 1, 2) = "02" Or _
      Mid$(cmbTitleCode.text, 1, 2) = "03" Or _
      Mid$(cmbTitleCode.text, 1, 2) = "06" Or _
      Mid$(cmbTitleCode.text, 1, 2) = "12" Or _
      Mid$(cmbTitleCode.text, 1, 2) = "13" Then
      optGenderFemale.Value = True
   Else
      optGenderMale.Value = True
   End If
End Sub

Private Sub cmbTitleCode_LostFocus()
Dim i As Integer
Dim tCode As String

If Not supervisorAction And Not searchAction And Not custHistoryAction Then
   If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
   Else
      If Len(RTrim(cmbTitleCode.text)) <> 0 Then
         tCode = Mid$(cmbTitleCode.text, 1, 2)
         For i = 0 To cmbTitleCode.ListCount
             If Mid$(cmbTitleCode.List(i), 1, 2) = tCode Then
                cmbTitleCode.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceTitle(UserLang)
         cmbTitleCode.SetFocus
         Exit Sub
      End If
    
      If i > cmbTitleCode.ListCount Then
         MsgBox errIncorrectTitle(UserLang)
         cmbTitleCode.SetFocus
      End If
    End If
End If

End Sub

Private Sub cmdAdd_Click()
   Dim i As Integer
   Dim totalJoint As String
   Dim tmpJointNo As String
   Dim custNo As String
   Dim recdIdNo As String, recdIdType As String
   Dim tmpRow As Integer
   Dim tmpIdType As String, tmpIdNo As String
    
    If Not supervisorAction And Not searchAction And Not custHistoryAction Then
       If validatefrmCustomer3 = 1 Then
          Exit Sub
       End If
       recdIdType = Mid$(cmbIdType.text, 1, 1)
       recdIdNo = Format(txtIdNumber, "!@@@@@@@@@@@@@@@")
       
       tmpRow = 1
       Do While True
          jointInfoGrid.Row = tmpRow
          jointInfoGrid.Col = 0
          custNo = jointInfoGrid.text
          jointInfoGrid.Col = 1
          tmpJointNo = jointInfoGrid.text
          If Len(RTrim(tmpJointNo)) = 0 Then
             Exit Do
          End If
          jointInfoGrid.Col = 4
          tmpIdType = Mid$(jointInfoGrid.text, 1, 1)
          tmpIdNo = Mid$(jointInfoGrid.text, 3)
       
          If recdIdType = tmpIdType And Trim(recdIdNo) = Trim(tmpIdNo) Then
             MsgBox errIdAlreadySelected(UserLang) & tmpJointNo & errCannotSelectAgain(UserLang)
             Exit Sub
          End If
          tmpRow = tmpRow + 1
       Loop

       frmIndividualJoint.MousePointer = vbHourglass
       jointAddAction = True
       jointUpdateAction = False
       createJointAccount
       If recvCustomerMsg.status <> "000" Then
          noOfJoint = noOfJoint - 1
       End If
    End If
   
End Sub

Private Sub cmdCancel_Click()
    If supervisorAction Or searchAction Or custHistoryAction Then
       Unload Me
       frmJointAccName.Caption = frmJointAccNameCaption(0, UserLang)
       frmJointAccName.lblJointAccNameOnCheck.Caption = frmJointAccNameCaption(1, UserLang)
       frmJointAccName.lblLine2.Caption = frmJointAccNameCaption(2, UserLang)
       frmJointAccName.lblJointAccNameOnReports.Caption = frmJointAccNameCaption(3, UserLang)
       frmJointAccName.cmdOk.Caption = frmJointAccNameCaption(4, UserLang)
       If screenSetNo = 1 Then
          frmJointAccName.txtJointAccNameOnCheck = Mid$(recvSaudiIndividualMsg.jointAccNameOnCheck, 1, 30)
          frmJointAccName.txtJointAccNameOnCheck1 = Mid$(recvSaudiIndividualMsg.jointAccNameOnCheck, 31, 30)
          frmJointAccName.txtJointAccNameOnReports = recvSaudiIndividualMsg.jointAccNameOnReports
       ElseIf screenSetNo = 2 Then
          frmJointAccName.txtJointAccNameOnCheck = Mid$(recvOtherIndividualMsg.jointAccNameOnCheck, 1, 30)
          frmJointAccName.txtJointAccNameOnCheck1 = Mid$(recvOtherIndividualMsg.jointAccNameOnCheck, 31, 30)
          frmJointAccName.txtJointAccNameOnReports = recvOtherIndividualMsg.jointAccNameOnReports
       Else
          frmJointAccName.txtJointAccNameOnCheck = Mid$(recvSuperActionMsg.jointAccNameOnCheck, 1, 30)
          frmJointAccName.txtJointAccNameOnCheck1 = Mid$(recvSuperActionMsg.jointAccNameOnCheck, 31, 30)
          frmJointAccName.txtJointAccNameOnReports = recvSuperActionMsg.jointAccNameOnReports
       End If
       frmJointAccName.txtJointAccNameOnCheck.Enabled = False
       frmJointAccName.txtJointAccNameOnCheck1.Enabled = False
       frmJointAccName.txtJointAccNameOnReports.Enabled = False
'       If UserLang = ARABIC Then
'          ChangePositions frmJointAccName, 9885
'          frmJointAccName.RightToLeft = True
'       End If
       frmJointAccName.Show vbModal
       Exit Sub
    End If

    Me.Hide
End Sub

Private Sub cmdDone_Click()
        
    If supervisorAction Or searchAction Then
       Me.Hide
       frmJointAccName.Caption = frmJointAccNameCaption(0, UserLang)
       frmJointAccName.lblJointAccNameOnCheck.Caption = frmJointAccNameCaption(1, UserLang)
       frmJointAccName.lblLine2.Caption = frmJointAccNameCaption(2, UserLang)
       frmJointAccName.lblJointAccNameOnReports.Caption = frmJointAccNameCaption(3, UserLang)
       frmJointAccName.cmdOk.Caption = frmJointAccNameCaption(4, UserLang)
       frmJointAccName.txtJointAccNameOnCheck = Mid$(recvSuperActionMsg.jointAccNameOnCheck, 1, 30)
       frmJointAccName.txtJointAccNameOnCheck1 = Mid$(recvSuperActionMsg.jointAccNameOnCheck, 31, 30)
       frmJointAccName.txtJointAccNameOnReports = recvSuperActionMsg.jointAccNameOnReports
       frmJointAccName.txtJointAccNameOnCheck.Enabled = False
       frmJointAccName.txtJointAccNameOnCheck1.Enabled = False
       frmJointAccName.txtJointAccNameOnReports.Enabled = False
       If UserLang = ARABIC Then
          ChangePositions frmJointAccName, 9885
          frmJointAccName.RightToLeft = True
       End If
       frmJointAccName.Show vbModal
'       frmCustomer2.Show
'       frmCustomer2.WindowState = 2
'       frmJointAccName.CmdOk.SetFocus
       Exit Sub
    End If
       
    If searchAction Then
       Unload Me
       Exit Sub
    End If
    
    If tellerAction Or updateAction Then
       Unload Me
'       frmCustomer2.Show
'       frmCustomer2.WindowState = 2
       frmCustomer2.cmdCreate.SetFocus
       Exit Sub
    End If

    If Len(RTrim(txtIdNumber)) = 0 Then
       If optLangArabic Then
          If Len(RTrim(txtArabFirstName)) = 0 And _
             Len(RTrim(txtArabic2ndName)) = 0 And _
             Len(RTrim(txtArabic3rdName)) = 0 And _
             Len(RTrim(txtArabLastName)) = 0 And _
             Len(RTrim(txtArabShortName)) = 0 Then
               Unload Me
'               frmCustomer2.Show
               frmCustomer2.cmdCreate.SetFocus
               Exit Sub
          End If
       Else
          If Len(RTrim(txtEngFirstName)) = 0 And _
             Len(RTrim(txtEnglish2ndName)) = 0 And _
             Len(RTrim(txtEnglish3rdName)) = 0 And _
             Len(RTrim(txtEngLastName)) = 0 And _
             Len(RTrim(txtEngShortName)) = 0 Then
               Unload Me
'               frmCustomer2.Show
               frmCustomer2.cmdCreate.SetFocus
               Exit Sub
          End If
       End If
   End If
         
   If validatefrmCustomer3 = 1 Then
      Exit Sub
   End If
   noOfJoint = noOfJoint + 1
   createJointAccount
    
   Unload Me
'   frmCustomer2.Show
'   frmCustomer2.WindowState = 2
   frmCustomer2.cmdCreate.SetFocus

End Sub

Private Sub cmdUpdate_Click()
    
    If Not supervisorAction And Not searchAction And Not custHistoryAction Then
       If validatefrmCustomer3 = 1 Then
          Exit Sub
       End If
'       If Not tellerAction Then
'          noOfJoint = noOfJoint + 1
'       End If
       frmIndividualJoint.MousePointer = vbHourglass
       jointAddAction = False
       jointUpdateAction = True
       createJointAccount
    End If

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim mQry As String, rowTitle(8) As String
   Dim tListIndex As Integer
   Dim tWidth As Integer, colwidth(8) As Integer
    
   If UserLang = ARABIC Then
      ChangePositions frmIndividualJoint, 11800
      frmIndividualJoint.Hide
      frmIndividualJoint.RightToLeft = True
   End If
    lblMainCategoryDesc = mainCategoryDesc
    lblSubCategoryDesc = subCategoryDesc
     
   frmIndividualJoint.Caption = frmCustomer3Caption(0, UserLang)
   frmIndividualJoint.lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
   frmIndividualJoint.lblJointAccountDetails.Caption = frmCustomer3Caption(0, UserLang)
   frmIndividualJoint.lblidType.Caption = frmCustomer3Caption(1, UserLang)
   frmIndividualJoint.lblIdNumber.Caption = frmCustomer3Caption(2, UserLang)
   frmIndividualJoint.lblIdIssuedAt.Caption = frmCustomer3Caption(3, UserLang)
   frmIndividualJoint.lblIdDateType.Caption = frmCustomer3Caption(4, UserLang)
   frmIndividualJoint.optIdDateHijri.Caption = frmCustomer3Caption(5, UserLang)
   frmIndividualJoint.optIdDateGregorian.Caption = frmCustomer3Caption(6, UserLang)
   frmIndividualJoint.lblIdIssueDate.Caption = frmCustomer3Caption(7, UserLang)
   frmIndividualJoint.lblIdExpiryDate.Caption = frmCustomer3Caption(8, UserLang)
   frmIndividualJoint.lblLangPref.Caption = frmCustomer3Caption(9, UserLang)
   frmIndividualJoint.optLangArabic.Caption = frmCustomer3Caption(10, UserLang)
   frmIndividualJoint.optLangEnglish.Caption = frmCustomer3Caption(11, UserLang)
   frmIndividualJoint.lblNationality.Caption = frmCustomer3Caption(12, UserLang)
   frmIndividualJoint.lblTitleCode.Caption = frmCustomer3Caption(13, UserLang)
   frmIndividualJoint.lblFirstName.Caption = frmCustomer3Caption(14, UserLang)
   frmIndividualJoint.lbl2ndName.Caption = frmCustomer3Caption(15, UserLang)
   frmIndividualJoint.lbl3rdName.Caption = frmCustomer3Caption(16, UserLang)
   frmIndividualJoint.lblLastName.Caption = frmCustomer3Caption(17, UserLang)
   frmIndividualJoint.lblArabicName.Caption = frmCustomer3Caption(18, UserLang)
   frmIndividualJoint.lblArabicShortName.Caption = frmCustomer3Caption(19, UserLang)
   frmIndividualJoint.lblEnglishName.Caption = frmCustomer3Caption(20, UserLang)
   frmIndividualJoint.lblDOBDateType.Caption = frmCustomer3Caption(22, UserLang)
   frmIndividualJoint.optDOBHijri.Caption = frmCustomer3Caption(5, UserLang)
   frmIndividualJoint.optDOBGreg.Caption = frmCustomer3Caption(6, UserLang)
   frmIndividualJoint.lblDateOfBirth.Caption = frmCustomer3Caption(23, UserLang)
   frmIndividualJoint.lblGender.Caption = frmCustomer3Caption(24, UserLang)
   frmIndividualJoint.optGenderMale.Caption = frmCustomer3Caption(25, UserLang)
   frmIndividualJoint.optGenderFemale.Caption = frmCustomer3Caption(26, UserLang)
   frmIndividualJoint.lblMaritalStatus.Caption = frmCustomer3Caption(27, UserLang)
   frmIndividualJoint.optMarried.Caption = frmCustomer3Caption(28, UserLang)
   frmIndividualJoint.optSingle.Caption = frmCustomer3Caption(29, UserLang)
   frmIndividualJoint.optOthers.Caption = frmCustomer3Caption(30, UserLang)
   frmIndividualJoint.lblDependents.Caption = frmCustomer3Caption(31, UserLang)
   frmIndividualJoint.frameResidentStatus.Caption = frmCustomer3Caption(32, UserLang)
   frmIndividualJoint.optResident.Caption = frmCustomer3Caption(33, UserLang)
   frmIndividualJoint.optNonResident.Caption = frmCustomer3Caption(34, UserLang)
   frmIndividualJoint.lblBusinessType.Caption = frmCustomer3Caption(35, UserLang)
   frmIndividualJoint.lblAddress1.Caption = frmCustomer3Caption(36, UserLang)
'   frmCustomer3.lblAddress2.Caption = frmCustomer3Caption(37, UserLang)
   frmIndividualJoint.lblPOBox.Caption = frmCustomer3Caption(38, UserLang)
   frmIndividualJoint.lblCity.Caption = frmCustomer3Caption(39, UserLang)
   frmIndividualJoint.lblZipCode.Caption = frmCustomer3Caption(40, UserLang)
   frmIndividualJoint.lblCountry.Caption = frmCustomer3Caption(41, UserLang)
   frmIndividualJoint.lblOffPhone.Caption = frmCustomer3Caption(42, UserLang)
   frmIndividualJoint.lblResPhone.Caption = frmCustomer3Caption(43, UserLang)
   frmIndividualJoint.lblFax.Caption = frmCustomer3Caption(44, UserLang)
   frmIndividualJoint.lblMobileNo.Caption = frmCustomer3Caption(45, UserLang)
   frmIndividualJoint.lblPager.Caption = frmCustomer3Caption(46, UserLang)
   frmIndividualJoint.lblEmailAddress.Caption = frmCustomer3Caption(47, UserLang)
   frmIndividualJoint.lblEducation.Caption = frmCustomer3Caption(48, UserLang)
   frmIndividualJoint.lblProfession.Caption = frmCustomer3Caption(49, UserLang)
   frmIndividualJoint.lblPosition.Caption = frmCustomer3Caption(50, UserLang)
   frmIndividualJoint.lblMonthlyIncome.Caption = frmCustomer3Caption(51, UserLang)
   frmIndividualJoint.lblOwnership.Caption = frmCustomer3Caption(52, UserLang)
   frmIndividualJoint.chkRentHome.Caption = frmCustomer3Caption(53, UserLang)
   frmIndividualJoint.chkOwnHouse.Caption = frmCustomer3Caption(54, UserLang)
   frmIndividualJoint.chkCompanyAccomodation.Caption = frmCustomer3Caption(55, UserLang)
   frmIndividualJoint.chkRentCar.Caption = frmCustomer3Caption(56, UserLang)
   frmIndividualJoint.chkOwnCar.Caption = frmCustomer3Caption(57, UserLang)
   frmIndividualJoint.chkCompanyTrans.Caption = frmCustomer3Caption(58, UserLang)
   frmIndividualJoint.lblEmployerName.Caption = frmCustomer3Caption(59, UserLang)
   frmIndividualJoint.lblDepartment.Caption = frmCustomer3Caption(60, UserLang)
   frmIndividualJoint.lblEmployerPoBox.Caption = frmCustomer3Caption(61, UserLang)
   frmIndividualJoint.lblEmployerCity.Caption = frmCustomer3Caption(62, UserLang)
   frmIndividualJoint.lblEmployerZipCode.Caption = frmCustomer3Caption(63, UserLang)
   frmIndividualJoint.cmdAdd.Caption = frmCustomer3Caption(70, UserLang)
   frmIndividualJoint.cmdUpdate.Caption = frmCustomer3Caption(71, UserLang)
   frmIndividualJoint.cmdCancel.Caption = frmCustomer3Caption(72, UserLang)
   frmIndividualJoint.optVipYes.Caption = frmCustomer3Caption(68, UserLang)
   frmIndividualJoint.optVipNo.Caption = frmCustomer3Caption(69, UserLang)
   frmIndividualJoint.lblActiveStatus.Caption = frmCustomer3Caption(73, UserLang)
   frmIndividualJoint.optValid.Caption = frmCustomer3Caption(68, UserLang)
   frmIndividualJoint.optInvalid.Caption = frmCustomer3Caption(69, UserLang)
   
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
'    rowTitle(1) = "Joint cust #"
'    rowTitle(2) = "Customer name"
'    rowTitle(3) = "Customer branch code"
'    rowTitle(4) = "IdType-id Number"
      
    jointInfoGrid.Clear
    jointInfoGrid.Row = 0
    jointInfoGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 4
      jointInfoGrid.Col = i
      If UserLang = ARABIC Then
         jointInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         jointInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      jointInfoGrid.text = frmCustomer3Caption(i + 74, UserLang)
      jointInfoGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    jointInfoGrid.Width = tWidth + 100
   
   mQry = "select * from idinfo"
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
      cmbCity.Clear
      cmbIdIssuedAt.Clear
      Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbCity.AddItem rs("englishname")
              cmbIdIssuedAt.AddItem rs("englishname")
           Else
              cmbCity.AddItem rs("arabicname")
              cmbIdIssuedAt.AddItem rs("arabicname")
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
                cmbCity.text = rs(0)
                cmbIdIssuedAt.text = rs(0)
             Else
                cmbCity.text = rs(1)
                cmbIdIssuedAt.text = rs(1)
             End If
         Else
            txtOffPhoneCityCode = "01"
            txtResPhoneCityCode = "01"
            txtFaxCityCode = "01"
            cmbCity.ListIndex = -1
            cmbIdIssuedAt.ListIndex = -1
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
'        frmCustomer3.cmbBusinessType.ListIndex = 0
    End If
    
    Set rs = db.OpenRecordset("select * from countryinfo")
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbCountry.Clear
        cmbNationality.Clear
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
    cmbDobDate.Clear
    cmbDobMonth.Clear
    cmbIdIssueDate.Clear
    cmbIdIssueMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbIdIssueDate.AddItem num
       cmbDobDate.AddItem num
       cmbIdExpiryDate.AddItem num
       If i < 13 Then
          cmbIdExpiryMonth.AddItem num
          cmbIdIssueMonth.AddItem num
          cmbDobMonth.AddItem num
       End If
    Next
 
   cmbTitleCode.Clear
   Set rs = db.OpenRecordset("select * from titleinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbTitleCode.AddItem rs("titlecode") & "-" & rs("englishname")
         Else
           cmbTitleCode.AddItem rs("titlecode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
     Loop
   End If
   If cmbTitleCode.ListCount > 1 Then
      cmbTitleCode.ListIndex = 1
   End If
   
   Set rs = db.OpenRecordset("select * from educationinfo")
  
   rs.MoveFirst
   cmbEducation.Clear
   Do While Not rs.EOF
      If UserLang = ENGLISH Then
         cmbEducation.AddItem rs("educationcode") & "-" & rs("englishname")
      Else
         cmbEducation.AddItem rs("educationcode") & "-" & rs("arabicname")
      End If
      rs.MoveNext
   Loop
  
   Set rs = db.OpenRecordset("select * from positioninfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbPosition.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbPosition.AddItem rs("positioncode") & "-" & rs("englishname")
         Else
            cmbPosition.AddItem rs("positioncode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   
   Set rs = db.OpenRecordset("select * from professioninfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbProfession.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbProfession.AddItem rs("professioncode") & "-" & rs("englishname")
         Else
            cmbProfession.AddItem rs("professioncode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   
   Set rs = db.OpenRecordset("select * from monthlyincomeinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbMonthlyIncome.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbMonthlyIncome.AddItem rs("incomecode") & "-" & rs("englishname")
         Else
            cmbMonthlyIncome.AddItem rs("incomecode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   
   If supervisorAction Or searchAction Or custHistoryAction Then
      FrameJointAcctInfo1.Enabled = False
      framejointcustomerinfo2.Enabled = False
      frameJointCustomerContactInfo.Enabled = False
      cmdAdd.Enabled = False
      cmdUpdate.Enabled = False
   Else
      FrameJointAcctInfo1.Enabled = True
      framejointcustomerinfo2.Enabled = True
      frameJointCustomerContactInfo.Enabled = True
      If gBranchCode = "0499" Then
         frameVIP.Enabled = True
      Else
         frameVIP.Enabled = False
      End If
      cmdAdd.Enabled = True
      cmdUpdate.Enabled = True
   End If
   If custHistoryAction Then
      lblHistory.Visible = True
      lblHistory.Refresh
   Else
      lblHistory.Visible = False
   End If
   
   cmdUpdate.Enabled = False ' commented by rajesh to avoid duplicates during
                            ' supervisor approval
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameJointAcctInfo1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameJointCustomerContactInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub framejointcustomerinfo2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub jointInfoGrid_DblClick()
    Dim jointCustNo As String
    jointInfoGrid.Col = 1
    jointCustNo = Mid$(RTrim(jointInfoGrid.text), 1, 2)
    fetchJointDetailInfo (jointCustNo)
End Sub

Private Sub jointInfoGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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
     If Mid$(cmbTitleCode.text, 1, 2) <> "02" And _
       Mid$(cmbTitleCode.text, 1, 2) <> "03" And _
       Mid$(cmbTitleCode.text, 1, 2) <> "06" And _
       Mid$(cmbTitleCode.text, 1, 2) <> "12" And _
       Mid$(cmbTitleCode.text, 1, 2) <> "13" Then
        MsgBox errInvalidTitle(UserLang)
        optGenderMale.Value = True
     End If
  End If
End Sub

Private Sub optGenderMale_Click()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Mid$(cmbTitleCode.text, 1, 2) = "02" Or _
       Mid$(cmbTitleCode.text, 1, 2) = "03" Or _
       Mid$(cmbTitleCode.text, 1, 2) = "06" Or _
       Mid$(cmbTitleCode.text, 1, 2) = "12" Or _
       Mid$(cmbTitleCode.text, 1, 2) = "13" Then
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
   If frmIndividualJoint.optLangArabic Then
      txtAddress1.Alignment = 1
      If ((KeyAscii > 64 And KeyAscii < 91) Or _
         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errNoEnglishCharacters(UserLang))
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
   If frmIndividualJoint.optLangArabic Then
      txtAddress2.Alignment = 1
      If ((KeyAscii > 64 And KeyAscii < 91) Or _
         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errNoEnglishCharacters(UserLang))
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
End Sub

Private Sub txtArabic2ndName_KeyPress(KeyAscii As Integer)
   If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
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
End Sub

Private Sub txtArabLastName_KeyPress(KeyAscii As Integer)
   If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
End Sub

Private Sub txtArabShortName_Change()
   If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
End Sub

Private Sub txtArabShortName_GotFocus()
   txtArabShortName = txtArabLastName & " " & txtArabFirstName
   If Len(txtArabShortName) & Len(txtArabic2ndName) < 30 Then
       txtArabShortName = txtArabShortName & " " & txtArabic2ndName
       If Len(txtArabShortName) & Len(txtArabic3rdName) < 30 Then
           txtArabShortName = txtArabShortName & " " & txtArabic3rdName
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
      If Len(RTrim(txtEmailAddress)) <> 0 Then
         If InStr(txtEmailAddress, "@") = 0 Then
            MsgBox errInvalidMailAddress(UserLang) '"E-mail address should contain @ character...Please Re-try"
            txtEmailAddress.SetFocus
         End If
      End If
    End If
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
   txtEngShortName = txtEngLastName & " " & txtEngFirstName
   If Len(txtEngShortName) & Len(txtEnglish2ndName) < 30 Then
       txtEngShortName = txtEngShortName & " " & txtEnglish2ndName
       If Len(txtEngShortName) & Len(txtEnglish3rdName) < 30 Then
           txtEngShortName = txtEngShortName & " " & txtEnglish3rdName
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
       If Len(RTrim(txtFaxNo)) <> 0 Then
          If Len(txtFaxNo) < 7 Then
             MsgBox errInvalidFaxNo(UserLang) '"Fax Number should contain atleast 7 digits..Please RE-try"
             txtFaxNo.SetFocus
          End If
       End If
    End If
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
 If Not supervisorAction And Not searchAction Then
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
       If Len(RTrim(txtIdExpiryYear)) <> 0 Then
          If optIdDateHijri.Value = True Then
             If txtIdExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                txtIdExpiryYear.text = ""
                txtIdExpiryYear.SetFocus
             End If
          Else
             If txtIdExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                txtIdExpiryYear.text = ""
                txtIdExpiryYear.SetFocus
             End If
           End If
        End If
     End If
 End If
End Sub

Private Sub txtIdIssueYear_Change()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Len(RTrim(txtIdIssueYear)) <> 0 Then
       If Len(txtIdIssueYear) = 4 Then
          On Error Resume Next
          cmbIdExpiryDate.SetFocus
       End If
    End If
 End If
End Sub
 
Public Sub fetchJointDetailInfo(jointCustNo As String)

    Dim strmsglen As String, tCode As String, tUserid As String, tDateTime As String, tBranchCode As String
    Dim tCustNo As String
    Dim recType As String * 2
   
    If searchAction Then
       recType = "04"
       tUserid = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    Else
       recType = "03"
       tUserid = jointKeyUserId
       tBranchCode = jointKeyBranch
       tDateTime = jointKeyDateTime
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

    If screenSetNo = "1" Or screenSetNo = "A" Then
       tCustNo = frmIndividualSaudi.txtCustomerNo
    ElseIf screenSetNo = "2" Then
       tCustNo = frmIndividualOthers.txtCustomerNo
    Else
       tCustNo = Space(7)
    End If
        
    SendMsg = "000057" & "18" & gBranchCode & recType & tBranchCode & tUserid & tDateTime & tCustNo & jointCustNo
    frmIndividualJoint.MousePointer = vbHourglass
    frmIndividualJoint.cmdCancel.Enabled = False
'    frmIndividualJoint.cmdDone.Enabled = False
'    frmIndividualJoint.cmdNextJoint.Enabled = False
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmIndividualJoint.MousePointer = vbDefault
       frmIndividualJoint.cmdCancel.Enabled = True
'       frmIndividualJoint.cmdDone.Enabled = True
'       frmIndividualJoint.cmdNextJoint.Enabled = True
       Exit Sub
    End If
    frmIndividualJoint.MousePointer = vbDefault
    frmIndividualJoint.cmdCancel.Enabled = True
'    frmIndividualJoint.cmdDone.Enabled = True
'    frmIndividualJoint.cmdNextJoint.Enabled = True
    If recvJointInfo.status = "000" Then
       tCode = recvJointInfo.idType
       If tCode <> "" Then
          For i = 0 To frmIndividualJoint.cmbIdType.ListCount
              If Mid(frmIndividualJoint.cmbIdType.List(i), 1, 1) = tCode Then
                 frmIndividualJoint.cmbIdType.ListIndex = i
                 Exit For
              End If
          Next i
        Else
          frmIndividualJoint.cmbIdType.ListIndex = -1
        End If
        If i > frmIndividualJoint.cmbIdType.ListCount Then
          frmIndividualJoint.cmbIdType.ListIndex = -1
'          frmCustomer3.cmbIdType.AddItem tCode & "-Not defined in local"
'          frmCustomer3.cmbIdType.ListIndex = frmCustomer3.cmbIdType.ListCount - 1
        End If
       
       frmIndividualJoint.txtIdNumber = Trim(recvJointInfo.idNo)
       frmIndividualJoint.cmbIdIssuedAt.text = recvJointInfo.idIssuedAt
       
       If recvJointInfo.idDateType = "0" Or _
          recvJointInfo.idDateType = " " Then
          frmIndividualJoint.optIdDateHijri.Value = True
          frmIndividualJoint.cmbIdIssueDate.text = _
                  Right$(recvJointInfo.idIssueDateH, 2)
          frmIndividualJoint.cmbIdIssueMonth.text = _
                  Mid$(recvJointInfo.idIssueDateH, 5, 2)
          frmIndividualJoint.txtIdIssueYear = Mid$(recvJointInfo.idIssueDateH, 1, 4)
          frmIndividualJoint.cmbIdExpiryDate.text = _
                  Right$(recvJointInfo.idExpiryDateH, 2)
          frmIndividualJoint.cmbIdExpiryMonth.text = _
                  Mid$(recvJointInfo.idExpiryDateH, 5, 2)
          frmIndividualJoint.txtIdExpiryYear = Mid$(recvJointInfo.idExpiryDateH, 1, 4)
       Else
          frmIndividualJoint.optIdDateGregorian.Value = True
          frmIndividualJoint.cmbIdIssueDate.text = _
                  Right$(recvJointInfo.idIssueDateG, 2)
          frmIndividualJoint.cmbIdIssueMonth.text = _
                  Mid$(recvJointInfo.idIssueDateG, 5, 2)
          frmIndividualJoint.txtIdIssueYear = Mid$(recvJointInfo.idIssueDateG, 1, 4)
          frmIndividualJoint.cmbIdExpiryDate.text = _
                  Right$(recvJointInfo.idExpiryDateG, 2)
          frmIndividualJoint.cmbIdExpiryMonth.text = _
                  Mid$(recvJointInfo.idExpiryDateG, 5, 2)
          frmIndividualJoint.txtIdExpiryYear = Mid$(recvJointInfo.idExpiryDateG, 1, 4)
       End If
         
       If recvJointInfo.preferredLang = "0" Or _
          recvJointInfo.preferredLang = " " Then
          frmIndividualJoint.optLangArabic.Value = True
       Else
          frmIndividualJoint.optLangEnglish.Value = True
       End If
         
       tCode = Mid$(recvJointInfo.nationality, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmIndividualJoint.cmbNationality.ListCount
              If Mid(frmIndividualJoint.cmbNationality.List(i), 1, 3) = tCode Then
                 frmIndividualJoint.cmbNationality.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmIndividualJoint.cmbNationality.ListIndex = -1
       End If
       If i > frmIndividualJoint.cmbNationality.ListCount Then
          frmIndividualJoint.cmbNationality.ListIndex = -1
          'frmCustomer3.cmbNationality.Text = tCode & "-Not defined in local"
       End If
         
       tCode = recvJointInfo.titleCode
       If tCode <> "" Then
          For i = 0 To frmIndividualJoint.cmbTitleCode.ListCount
              If Mid(frmIndividualJoint.cmbTitleCode.List(i), 1, 2) = tCode Then
                 frmIndividualJoint.cmbTitleCode.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmIndividualJoint.cmbTitleCode.ListIndex = -1
       End If
       If i > frmIndividualJoint.cmbTitleCode.ListCount Then
          frmIndividualJoint.cmbTitleCode.ListIndex = -1
          'frmCustomer3.cmbTitleCode.Text = tCode & "-Not defined in local"
       End If
       
       frmIndividualJoint.txtArabFirstName = _
             recvJointInfo.aFirstName
       frmIndividualJoint.txtArabic2ndName = _
             recvJointInfo.a2ndName
       frmIndividualJoint.txtArabic3rdName = _
             recvJointInfo.a3rdName
       frmIndividualJoint.txtArabLastName = _
             recvJointInfo.aLastName
       frmIndividualJoint.txtArabShortName = _
             recvJointInfo.aShortName
         
       frmIndividualJoint.txtEngFirstName = _
             recvJointInfo.eFirstName
       frmIndividualJoint.txtEnglish2ndName = _
             recvJointInfo.e2ndName
       frmIndividualJoint.txtEnglish3rdName = _
             recvJointInfo.e3rdName
       frmIndividualJoint.txtEngLastName = _
             recvJointInfo.eLastName
       frmIndividualJoint.txtEngShortName = _
             recvJointInfo.eShortName
       
       If recvJointInfo.dobDateType = "0" Or _
          recvJointInfo.dobDateType = " " Then
          frmIndividualJoint.optDOBHijri.Value = True
          frmIndividualJoint.cmbDobDate.text = _
                Right$(recvJointInfo.dobDateH, 2)
          frmIndividualJoint.cmbDobMonth.text = _
                Mid$(recvJointInfo.dobDateH, 5, 2)
          frmIndividualJoint.txtDobYear = Mid$(recvJointInfo.dobDateH, 1, 4)
       Else
          frmIndividualJoint.optDOBGreg.Value = True
          frmIndividualJoint.cmbDobDate.text = _
               Right$(recvJointInfo.dobDateG, 2)
          frmIndividualJoint.cmbDobMonth.text = _
               Mid$(recvJointInfo.dobDateG, 5, 2)
          frmIndividualJoint.txtDobYear = Mid$(recvJointInfo.dobDateG, 1, 4)
       End If
       If recvJointInfo.sexCode = "0" Or _
          recvJointInfo.sexCode = " " Then
          frmIndividualJoint.optGenderMale.Value = True
       Else
          frmIndividualJoint.optGenderFemale.Value = True
       End If
        
       If recvJointInfo.vipCode = "1" Then
          frmIndividualJoint.optVipYes.Value = True
       Else
          frmIndividualJoint.optVipNo.Value = True
       End If
        
       If recvJointInfo.maritalStatus = "0" Or _
          recvJointInfo.maritalStatus = " " Then
          frmIndividualJoint.optMarried.Value = True
       ElseIf recvJointInfo.maritalStatus = "1" Then
          frmIndividualJoint.optSingle.Value = True
       Else
          frmIndividualJoint.optOthers.Value = True
       End If
         
       frmIndividualJoint.txtDependents = recvJointInfo.noOfDependents
       If recvJointInfo.residentStatus = "0" Or _
          recvJointInfo.residentStatus = " " Then
          frmIndividualJoint.optResident.Value = True
       Else
          frmIndividualJoint.optNonResident.Value = True
       End If
         
       tCode = Mid$(recvJointInfo.businessType, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmIndividualJoint.cmbBusinessType.ListCount
            If Mid(frmIndividualJoint.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmIndividualJoint.cmbBusinessType.ListIndex = i
               Exit For
            End If
          Next i
       Else
          frmIndividualJoint.cmbBusinessType.ListIndex = -1
       End If
       
       If i > frmIndividualJoint.cmbBusinessType.ListCount Then
          frmIndividualJoint.cmbBusinessType.ListIndex = -1
          'frmindividualjoint.cmbBusinessType.Text = tCode & "-Not defined in local"
       End If
       If recvJointInfo.addressType = "1" Then
          frmIndividualJoint.optSaudiPost.Value = True
          frmIndividualJoint.txtSaudiPostGPSNo = Mid$(recvJointInfo.address1, 1, 5)
          frmIndividualJoint.txtSaudiPostStreetName = Mid$(recvJointInfo.address1, 7)
          frmIndividualJoint.txtSaudiPostUnit = recvJointInfo.poBox
          frmIndividualJoint.txtSaudiPostZipCode = Mid$(recvJointInfo.zipCode, 1, 5)
          frmIndividualJoint.txtSaudiPostAdditionalNo = Mid$(recvJointInfo.zipCode, 7)
       Else ' PO Box
          frmIndividualJoint.optPoBox.Value = True
          frmIndividualJoint.txtAddress1 = recvJointInfo.address1
          frmIndividualJoint.txtAddress2 = recvJointInfo.address2
          frmIndividualJoint.txtPOBox = recvJointInfo.poBox
          frmIndividualJoint.cmbCity.text = recvJointInfo.cityName
          frmIndividualJoint.txtPinCode = recvJointInfo.zipCode
       
          tCode = Mid$(recvJointInfo.country, 1, 3)
          If tCode <> "" Then
             For i = 0 To frmIndividualJoint.cmbCountry.ListCount
                 If Mid$(frmIndividualJoint.cmbCountry.List(i), 1, 3) = tCode Then
                    frmIndividualJoint.cmbCountry.ListIndex = i
                    Exit For
                 End If
             Next i
          Else
             frmIndividualJoint.cmbCountry.ListIndex = -1
          End If
       
          If i > frmIndividualJoint.cmbCountry.ListCount Then
             frmIndividualJoint.cmbCountry.text = tCode & "-Not defined in local"
          End If
       End If
       If Len(RTrim(recvJointInfo.telOffAreaCode)) <> 0 Or _
          Not updateAction Then
          frmIndividualJoint.txtOffPhoneCityCode = recvJointInfo.telOffAreaCode
       End If
       frmIndividualJoint.txtOffPhoneNo = recvJointInfo.telOffNo
       frmIndividualJoint.txtOffPhoneExt = recvJointInfo.telOffExt
       If Len(RTrim(recvJointInfo.telHomeAreaCode)) <> 0 Or _
          Not updateAction Then
          frmIndividualJoint.txtResPhoneCityCode = recvJointInfo.telHomeAreaCode
       End If
       frmIndividualJoint.txtResPhoneNo = recvJointInfo.telHomeNo
       frmIndividualJoint.txtResPhoneExt = recvJointInfo.telHomeExt
       If Len(RTrim(recvJointInfo.faxAreaCode)) <> 0 Or _
          Not updateAction Then
          frmIndividualJoint.txtFaxCityCode = recvJointInfo.faxAreaCode
       End If
       frmIndividualJoint.txtFaxNo = recvJointInfo.faxNo
       frmIndividualJoint.txtFaxExt = recvJointInfo.faxExt
         
       frmIndividualJoint.txtMobileAreaCode = Mid$(recvJointInfo.mobileNo, 1, 2)
       frmIndividualJoint.txtMobileNo = Mid$(recvJointInfo.mobileNo, 3)
       frmIndividualJoint.txtPagerNo = recvJointInfo.pagerNo
       frmIndividualJoint.txtEmailAddress = recvJointInfo.eMail
         
       tCode = recvJointInfo.educationCode
       If tCode <> "" Then
          For i = 0 To frmIndividualJoint.cmbEducation.ListCount
              If Mid$(frmIndividualJoint.cmbEducation.List(i), 3, 2) = tCode Then
                 frmIndividualJoint.cmbEducation.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmIndividualJoint.cmbEducation.ListIndex = -1
       End If
       
       If i > frmIndividualJoint.cmbEducation.ListCount Then
          frmIndividualJoint.cmbEducation.ListIndex = -1
'          frmCustomer3.cmbEducation.AddItem tCode & "-Not defined in local"
'          frmCustomer3.cmbEducation.ListIndex = frmCustomer3.cmbEducation.ListCount - 1
       End If
         
       tCode = recvJointInfo.professionCode
       If tCode <> "" Then
          For i = 0 To frmIndividualJoint.cmbProfession.ListCount
              If Mid$(frmIndividualJoint.cmbProfession.List(i), 3, 2) = tCode Then
                 frmIndividualJoint.cmbProfession.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmIndividualJoint.cmbProfession.ListIndex = -1
       End If
       
       If i > frmIndividualJoint.cmbProfession.ListCount Then
          frmIndividualJoint.cmbProfession.ListIndex = -1
'          frmCustomer3.cmbProfession.AddItem tCode & "- Not defined in local"
'          frmCustomer3.cmbProfession.ListIndex = frmCustomer3.cmbProfession.ListCount - 1
       End If
       
       tCode = recvJointInfo.positionCode
       If tCode <> "" Then
          For i = 0 To frmIndividualJoint.cmbPosition.ListCount
             If Mid$(frmIndividualJoint.cmbPosition.List(i), 3, 2) = tCode Then
                frmIndividualJoint.cmbPosition.ListIndex = i
                Exit For
             End If
          Next i
        Else
           frmIndividualJoint.cmbPosition.ListIndex = -1
        End If
        
        If i > frmIndividualJoint.cmbPosition.ListCount Then
           frmIndividualJoint.cmbPosition.ListIndex = -1
'           frmCustomer3.cmbPosition.AddItem tCode & "-Not defined in local"
'           frmCustomer3.cmbPosition.ListIndex = frmCustomer3.cmbPosition.ListCount - 1
        End If
        
       tCode = recvJointInfo.monthlyIncome
       If tCode <> "" Then
          For i = 0 To frmIndividualJoint.cmbMonthlyIncome.ListCount
              If Mid$(frmIndividualJoint.cmbMonthlyIncome.List(i), 3, 2) = tCode Then
                 frmIndividualJoint.cmbMonthlyIncome.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmIndividualJoint.cmbMonthlyIncome.ListIndex = -1
       End If
       
       If i > frmIndividualJoint.cmbMonthlyIncome.ListCount Then
          frmIndividualJoint.cmbMonthlyIncome.ListIndex = -1
'          frmCustomer3.cmbMonthlyIncome.AddItem tCode & "-Not defined in local"
'          frmCustomer3.cmbMonthlyIncome.ListIndex = frmCustomer3.cmbMonthlyIncome.ListCount - 1
       End If
       
       tCode = recvJointInfo.ownerShip
       If Mid$(tCode, 1, 1) = "1" Then
          frmIndividualJoint.chkRentHome.Value = 1
       Else
          frmIndividualJoint.chkRentHome.Value = 0
       End If
       If Mid$(tCode, 2, 1) = "1" Then
          frmIndividualJoint.chkOwnHouse.Value = 1
       Else
          frmIndividualJoint.chkOwnHouse.Value = 0
       End If
       If Mid$(tCode, 3, 1) = "1" Then
          frmIndividualJoint.chkCompanyAccomodation.Value = 1
       Else
          frmIndividualJoint.chkCompanyAccomodation.Value = 0
       End If
       If Mid$(tCode, 4, 1) = "1" Then
          frmIndividualJoint.chkRentCar.Value = 1
       Else
          frmIndividualJoint.chkRentCar.Value = 0
       End If
       If Mid$(tCode, 5, 1) = "1" Then
          frmIndividualJoint.chkOwnCar.Value = 1
       Else
          frmIndividualJoint.chkOwnCar.Value = 0
       End If
       If Mid$(tCode, 6, 1) = "1" Then
          frmIndividualJoint.chkCompanyTrans.Value = 1
       Else
          frmIndividualJoint.chkCompanyTrans.Value = 0
       End If
       
       frmIndividualJoint.txtEmployerName = recvJointInfo.employerName
       frmIndividualJoint.txtDepartment = recvJointInfo.department
       frmIndividualJoint.txtEmployerPoBox = recvJointInfo.employerPoBox
       frmIndividualJoint.txtEmployerCity = recvJointInfo.employerCity
       frmIndividualJoint.txtEmployerZipCode = recvJointInfo.employerZipCode
       If recvJointInfo.activeStatus = "1" Then
          frmIndividualJoint.optValid.Value = True
       Else
          frmIndividualJoint.optInvalid.Value = True
       End If
       If Not supervisorAction And Not searchAction And Not custHistoryAction Then
          cmdUpdate.Enabled = True ' added by rajesh on 9 dec 03 to avoid duplicates during
                                   ' during supervisor approval
       End If
    Else
        If UserLang = ENGLISH Then
           MsgBox recvJointInfo.eRemarks
        Else
           MsgBox recvJointInfo.aRemarks
        End If
        CSD_mdiForm.staticStatus.Panels(3).text = "  "
        Exit Sub
    End If  ' recvjointinfo.status = "000"
    
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
    
End Sub

Private Sub createJointAccount()
    Dim i As Integer, strmsglen As String
    
    If activityFlag = "P" And Len(RTrim(branchActionDateTime)) = 0 Then
       branchActionDateTime = getUnixDateTime
       If Trim(branchActionDateTime) = "ERROR" Then
          branchActionDateTime = Space(14)
          Exit Sub
       End If
    End If
        
    formatJointAccInfo
    SendMsg = jointInfo.msgLen & jointInfo.service & gBranchCode & jointInfo.branchCode & _
             jointInfo.userId & jointInfo.dateTime & jointInfo.creationOrUpdate & jointInfo.customerNo & _
             jointInfo.jointCustomerNo & jointInfo.newOrUpdate & jointInfo.supervisorId & jointInfo.idNo & _
             jointInfo.idType & jointInfo.idIssuedAt & jointInfo.idDateType & _
             jointInfo.idIssueDateH & jointInfo.idIssueDateG & jointInfo.idExpiryDateH & _
             jointInfo.idExpiryDateG & jointInfo.preferredLang & jointInfo.nationality & _
             jointInfo.titleCode & jointInfo.dobDateType & jointInfo.dobDateH & _
             jointInfo.dobDateG & jointInfo.sexCode & jointInfo.vipCode & jointInfo.maritalStatus & _
             jointInfo.noOfDependents & jointInfo.residentStatus & jointInfo.businessType & _
             jointInfo.aFirstName & jointInfo.a2ndName & jointInfo.a3rdName & _
             jointInfo.aLastName & jointInfo.aShortName & jointInfo.eFirstName & _
             jointInfo.e2ndName & jointInfo.e3rdName & jointInfo.eLastName & _
             jointInfo.eShortName & jointInfo.address1 & jointInfo.address2 & _
             jointInfo.poBox & jointInfo.cityName & jointInfo.zipCode & jointInfo.country & _
             jointInfo.telOffAreaCode & jointInfo.telOffNo & jointInfo.telOffExt & _
             jointInfo.telHomeAreaCode & jointInfo.telHomeNo & jointInfo.telHomeExt & _
             jointInfo.faxAreaCode & jointInfo.faxNo & jointInfo.faxExt & _
             jointInfo.mobileNo & jointInfo.pagerNo & jointInfo.eMail & jointInfo.educationCode & _
             jointInfo.professionCode & jointInfo.positionCode & jointInfo.monthlyIncome & _
             jointInfo.ownerShip & jointInfo.segmentation & jointInfo.employerName & jointInfo.department & jointInfo.employerPoBox & _
             jointInfo.employerCity & jointInfo.employerZipCode & jointInfo.activeStatus & jointInfo.addressType & _
             jointInfo.custOpenSource & jointInfo.branchCSOId & _
             jointInfo.branchActionDateTime & jointInfo.activityFlag & Space(10)

    frmIndividualJoint.MousePointer = vbHourglass
    frmIndividualJoint.cmdCancel.Enabled = False
    frmIndividualJoint.cmdAdd.Enabled = False
    frmIndividualJoint.cmdUpdate.Enabled = False
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmIndividualJoint.MousePointer = vbDefault
       frmIndividualJoint.cmdCancel.Enabled = True
       frmIndividualJoint.cmdAdd.Enabled = True
       'frmIndividualJoint.cmdUpdate.Enabled = True ' commented by rajesh to avoid duplcates
                                                    ' during supervisor approval
       Exit Sub
    End If
    
    frmIndividualJoint.MousePointer = vbDefault
    frmIndividualJoint.cmdCancel.Enabled = True
    frmIndividualJoint.cmdAdd.Enabled = True
    'frmIndividualJoint.cmdUpdate.Enabled = True ' commented by rajesh to avoid duplcates
                                                 ' during supervisor approval
       
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) ' "Transaction Successfully completed...."
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
    jointKeyBranch = gBranchCode
    If tellerAction And activityFlag = "P" Then
       jointKeyUserId = jointInfo.branchCSOId
       jointKeyDateTime = jointInfo.branchActionDateTime
    Else
       jointKeyUserId = jointInfo.userId
       jointKeyDateTime = jointInfo.dateTime
    End If
    
    jointInfoGrid.Row = Val(jointInfo.jointCustomerNo)
    jointInfoGrid.Col = 0
    jointInfoGrid.CellAlignment = flexAlignLeftCenter
    jointInfoGrid.text = jointInfo.customerNo
    jointInfoGrid.Col = 1
    jointInfoGrid.CellAlignment = flexAlignLeftCenter
    jointInfoGrid.text = jointInfo.jointCustomerNo
    jointInfoGrid.Col = 2
    jointInfoGrid.CellAlignment = flexAlignLeftCenter
    If jointInfo.preferredLang = "0" Then
       jointInfoGrid.text = jointInfo.aShortName
    Else
       jointInfoGrid.text = jointInfo.eShortName
    End If
    jointInfoGrid.Col = 3
    jointInfoGrid.CellAlignment = flexAlignLeftCenter
    jointInfoGrid.text = jointInfo.branchCode
    jointInfoGrid.Col = 4
    jointInfoGrid.CellAlignment = flexAlignLeftCenter
    jointInfoGrid.text = jointInfo.idType & "-" & jointInfo.idNo

    If screenSetNo = "1" Or screenSetNo = "A" Then  ' individual saudi info
       If frmIndividualSaudi.optPoBox = True Then
          txtAddress1 = frmIndividualSaudi.txtAddress1
          txtAddress2 = frmIndividualSaudi.txtAddress2
          txtPOBox = frmIndividualSaudi.txtPOBox
          txtPinCode = frmIndividualSaudi.txtPinCode
       Else ' GPS address is selected
          txtSaudiPostGPSNo = frmIndividualSaudi.txtSaudiPostGPSNo
          txtSaudiPostStreetName = frmIndividualSaudi.txtSaudiPostStreetName
          txtSaudiPostUnit = frmIndividualSaudi.txtSaudiPostUnit
          txtSaudiPostZipCode = frmIndividualSaudi.txtSaudiPostZipCode
          txtSaudiPostAdditionalNo = frmIndividualSaudi.txtSaudiPostAdditionalNo
       End If
       cmbCity = frmIndividualSaudi.cmbCity
       txtOffPhoneCityCode = frmIndividualSaudi.txtOffPhoneCityCode
       txtOffPhoneNo = frmIndividualSaudi.txtOffPhoneNo
       txtOffPhoneExt = frmIndividualSaudi.txtOffPhoneExt
       txtResPhoneCityCode = frmIndividualSaudi.txtResPhoneCityCode
       txtResPhoneNo = frmIndividualSaudi.txtResPhoneNo
       txtResPhoneExt = frmIndividualSaudi.txtResPhoneExt
       txtFaxCityCode = frmIndividualSaudi.txtFaxCityCode
       txtFaxNo = frmIndividualSaudi.txtFaxNo
       txtFaxExt = frmIndividualSaudi.txtFaxExt
       txtMobileNo = frmIndividualSaudi.txtMobileNo
    ElseIf screenSetNo = "2" Then  ' individual others info
       If frmIndividualOthers.optPoBox = True Then
          txtAddress1 = frmIndividualOthers.txtAddress1
          txtAddress2 = frmIndividualOthers.txtAddress2
          txtPOBox = frmIndividualOthers.txtPOBox
          cmbCity = frmIndividualOthers.cmbCity
          txtPinCode = frmIndividualOthers.txtPinCode
       Else  ' GPS address is selected
          txtSaudiPostGPSNo = frmIndividualOthers.txtSaudiPostGPSNo
          txtSaudiPostStreetName = frmIndividualOthers.txtSaudiPostStreetName
          txtSaudiPostUnit = frmIndividualOthers.txtSaudiPostUnit
          txtSaudiPostZipCode = frmIndividualOthers.txtSaudiPostZipCode
          txtSaudiPostAdditionalNo = frmIndividualOthers.txtSaudiPostAdditionalNo
       End If
       txtOffPhoneCityCode = frmIndividualOthers.txtOffPhoneCityCode
       txtOffPhoneNo = frmIndividualOthers.txtOffPhoneNo
       txtOffPhoneExt = frmIndividualOthers.txtOffPhoneExt
       txtResPhoneCityCode = frmIndividualOthers.txtResPhoneCityCode
       txtResPhoneNo = frmIndividualOthers.txtResPhoneNo
       txtResPhoneExt = frmIndividualOthers.txtResPhoneExt
       txtFaxCityCode = frmIndividualOthers.txtFaxCityCode
       txtFaxNo = frmIndividualOthers.txtFaxNo
       txtFaxExt = frmIndividualOthers.txtFaxExt
       txtMobileNo = frmIndividualOthers.txtMobileNo
    End If
     
    cmbIdIssueDate.text = ""
    cmbIdIssueMonth.text = ""
    cmbIdExpiryDate.text = ""
    cmbIdExpiryMonth.text = ""
    cmbDobDate.text = ""
    cmbDobMonth.text = ""
    txtMobileAreaCode = "05"
    cmbIdType.SetFocus
    
End Sub

Private Sub txtIdIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtIdIssueYear_LostFocus()
 If Not supervisorAction And Not searchAction Then
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
              txtIdIssueYear.text = ""
              txtIdIssueYear.SetFocus
           End If
        Else
           If txtIdIssueYear < 1600 Then
              MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
              txtIdIssueYear.text = ""
              txtIdIssueYear.SetFocus
           End If
        End If
     End If
  End If
End Sub


Private Sub txtIdNumber_KeyPress(KeyAscii As Integer)
   If Mid$(cmbIdType.text, 1, 1) = "Q" Or _
      Mid$(cmbIdType.text, 1, 1) = "I" Then
      If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errOnlyNumeralsAllowed(UserLang))
          Exit Sub
      End If
   End If
End Sub

Private Sub txtIdNumber_LostFocus()
  If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
  Else
    If Mid$(cmbIdType.text, 1, 1) = "I" Or _
       Mid$(cmbIdType.text, 1, 1) = "Q" Then
       If Len(Trim(txtIdNumber)) <> 10 Then
          MsgBox errInvalidId(UserLang)
          txtIdNumber.SetFocus
       End If
    End If
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
 If Not supervisorAction And Not searchAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(txtOffPhoneNo)) <> 0 Then
          If Len(txtOffPhoneNo) < 7 Then
             MsgBox errInvalidTelNo(UserLang) '"Telephone number should contain atleast 7 digits..Please RE-enter"
             txtOffPhoneNo.SetFocus
          End If
       End If
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
 If Not supervisorAction And Not searchAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(txtResPhoneNo)) <> 0 Then
          If Len(txtResPhoneNo) < 7 Then
             MsgBox errInvalidTelNo(UserLang) '"Telephone number should contain atleast 7 digits..Please RE-enter"
             txtResPhoneNo.SetFocus
          End If
       End If
    End If
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
  If frmIndividualJoint.optLangArabic Then
      txtSaudiPostStreetName.Alignment = 1
      If ((KeyAscii > 64 And KeyAscii < 91) Or _
         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errNoEnglishCharacters(UserLang))
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
