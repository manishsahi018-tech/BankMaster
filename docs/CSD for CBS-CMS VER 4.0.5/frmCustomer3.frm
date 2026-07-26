VERSION 5.00
Begin VB.Form frmCustomer3 
   BackColor       =   &H00BFD87E&
   Caption         =   "Joint-Account Information"
   ClientHeight    =   8610
   ClientLeft      =   60
   ClientTop       =   330
   ClientWidth     =   11880
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8610
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.Frame framejointcustomerinfo2 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1695
      Left            =   0
      TabIndex        =   122
      Top             =   5640
      Width           =   11775
      Begin VB.ComboBox cmbEducation 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   59
         Tag             =   "11775"
         Top             =   120
         Width           =   1935
      End
      Begin VB.ComboBox cmbProfession 
         Height          =   315
         Left            =   4440
         Style           =   2  'Dropdown List
         TabIndex        =   60
         Tag             =   "11775"
         Top             =   120
         Width           =   1455
      End
      Begin VB.ComboBox cmbPosition 
         Height          =   315
         Left            =   7080
         Style           =   2  'Dropdown List
         TabIndex        =   61
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
         TabIndex        =   64
         Tag             =   "11775"
         Top             =   840
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
         TabIndex        =   65
         Tag             =   "11775"
         Top             =   840
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
         TabIndex        =   66
         Tag             =   "11775"
         Top             =   840
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
         TabIndex        =   67
         Tag             =   "11775"
         Top             =   840
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
         TabIndex        =   68
         Tag             =   "11775"
         Top             =   840
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
         TabIndex        =   69
         Tag             =   "11775"
         Top             =   840
         Width           =   2055
      End
      Begin VB.TextBox txtEmployerName 
         Height          =   285
         Left            =   1320
         MaxLength       =   30
         TabIndex        =   70
         Tag             =   "11775"
         Top             =   1200
         Width           =   2895
      End
      Begin VB.TextBox txtDepartment 
         Height          =   285
         Left            =   5520
         MaxLength       =   20
         TabIndex        =   71
         Tag             =   "11775"
         Top             =   1200
         Width           =   1335
      End
      Begin VB.TextBox txtEmployerPoBox 
         Height          =   285
         Left            =   7560
         MaxLength       =   10
         TabIndex        =   72
         Tag             =   "11775"
         Top             =   1200
         Width           =   735
      End
      Begin VB.TextBox txtEmployerCity 
         Height          =   285
         Left            =   8880
         MaxLength       =   20
         TabIndex        =   73
         Tag             =   "11775"
         Top             =   1200
         Width           =   1095
      End
      Begin VB.ComboBox cmbMonthlyIncome 
         Height          =   315
         Left            =   10080
         Style           =   2  'Dropdown List
         TabIndex        =   62
         Tag             =   "11775"
         Top             =   120
         Width           =   1575
      End
      Begin VB.TextBox txtEmployerZipCode 
         Height          =   285
         Left            =   10560
         MaxLength       =   10
         TabIndex        =   74
         Tag             =   "11775"
         Top             =   1200
         Width           =   975
      End
      Begin VB.ComboBox cmbSegmentation 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   63
         Tag             =   "11775"
         Top             =   480
         Width           =   1935
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
         TabIndex        =   133
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
         TabIndex        =   132
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
         TabIndex        =   131
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
         TabIndex        =   130
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
         TabIndex        =   129
         Tag             =   "11775"
         Top             =   840
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
         Height          =   255
         Left            =   0
         TabIndex        =   128
         Tag             =   "11775"
         Top             =   1200
         Width           =   1335
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
         TabIndex        =   127
         Tag             =   "11775"
         Top             =   1200
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
         TabIndex        =   126
         Tag             =   "11775"
         Top             =   1200
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
         Left            =   8400
         TabIndex        =   125
         Tag             =   "11775"
         Top             =   1200
         Width           =   375
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
         TabIndex        =   124
         Tag             =   "11775"
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label lblSegmentation 
         BackColor       =   &H00BFD87E&
         Caption         =   "Segmentation"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Top             =   480
         Width           =   1215
      End
   End
   Begin VB.Frame frameJointCustomerContactInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   0
      TabIndex        =   109
      Top             =   3840
      Width           =   11775
      Begin VB.TextBox txtPagerNo 
         Height          =   285
         Left            =   4920
         MaxLength       =   10
         TabIndex        =   57
         Tag             =   "11775"
         Top             =   1080
         Width           =   1335
      End
      Begin VB.TextBox txtResPhoneCityCode 
         Height          =   285
         Left            =   4920
         MaxLength       =   2
         TabIndex        =   50
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtFaxCityCode 
         Height          =   285
         Left            =   8280
         MaxLength       =   2
         TabIndex        =   53
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
         TabIndex        =   110
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
         TabIndex        =   47
         Tag             =   "11775"
         Text            =   "01"
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox txtEmailAddress 
         Height          =   285
         Left            =   8280
         MaxLength       =   30
         TabIndex        =   58
         Tag             =   "11775"
         Top             =   1080
         Width           =   3375
      End
      Begin VB.TextBox txtFaxExt 
         Height          =   285
         Left            =   9960
         MaxLength       =   4
         TabIndex        =   55
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   8640
         MaxLength       =   10
         TabIndex        =   54
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneExt 
         Height          =   285
         Left            =   6720
         MaxLength       =   4
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtOffPhoneExt 
         Height          =   285
         Left            =   3000
         MaxLength       =   4
         TabIndex        =   49
         Tag             =   "11775"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   56
         Tag             =   "11775"
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtResPhoneNo 
         Height          =   285
         Left            =   5400
         MaxLength       =   10
         TabIndex        =   51
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtOffPhoneNo 
         Height          =   285
         Left            =   1680
         MaxLength       =   10
         TabIndex        =   48
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
      End
      Begin VB.ComboBox cmbCountry 
         Height          =   315
         Left            =   8280
         TabIndex        =   46
         Tag             =   "11775"
         Text            =   "cmbCountry"
         Top             =   360
         Width           =   1695
      End
      Begin VB.TextBox txtPinCode 
         Height          =   285
         Left            =   6240
         MaxLength       =   10
         TabIndex        =   45
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.ComboBox cmbCity 
         Height          =   315
         Left            =   2880
         TabIndex        =   44
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
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox txtAddress2 
         Height          =   285
         Left            =   4920
         MaxLength       =   30
         TabIndex        =   42
         Tag             =   "11775"
         Top             =   0
         Width           =   3015
      End
      Begin VB.TextBox txtAddress1 
         Height          =   285
         Left            =   1200
         MaxLength       =   30
         TabIndex        =   41
         Tag             =   "11775"
         Top             =   0
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
         Left            =   3720
         TabIndex        =   121
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
         TabIndex        =   120
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
         TabIndex        =   119
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
         TabIndex        =   118
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
         TabIndex        =   117
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
         TabIndex        =   116
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
         TabIndex        =   115
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
         TabIndex        =   114
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
         TabIndex        =   113
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
         TabIndex        =   112
         Tag             =   "11775"
         Top             =   360
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
         Left            =   0
         TabIndex        =   111
         Tag             =   "11775"
         Top             =   0
         Width           =   1215
      End
   End
   Begin VB.Frame FrameJointAcctInfo1 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   3375
      Left            =   0
      TabIndex        =   78
      Top             =   240
      Width           =   11775
      Begin VB.TextBox txtDOBYear 
         Height          =   285
         Left            =   5520
         MaxLength       =   4
         TabIndex        =   29
         Tag             =   "11775"
         Top             =   2280
         Width           =   495
      End
      Begin VB.ComboBox cmbDOBMonth 
         Height          =   315
         Left            =   4920
         TabIndex        =   28
         Tag             =   "11775"
         Text            =   "01"
         Top             =   2280
         Width           =   615
      End
      Begin VB.ComboBox cmbDOBDate 
         Height          =   315
         Left            =   4320
         TabIndex        =   27
         Tag             =   "11775"
         Text            =   "01"
         Top             =   2280
         Width           =   615
      End
      Begin VB.TextBox txtIdExpiryYear 
         Height          =   285
         Left            =   8640
         MaxLength       =   4
         TabIndex        =   10
         Tag             =   "11775"
         Top             =   480
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         Height          =   315
         Left            =   8040
         TabIndex        =   9
         Tag             =   "11775"
         Text            =   "01"
         Top             =   480
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         Height          =   315
         Left            =   7440
         TabIndex        =   8
         Tag             =   "11775"
         Text            =   "01"
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txtIdIssueYear 
         Height          =   285
         Left            =   5640
         MaxLength       =   4
         TabIndex        =   7
         Tag             =   "11775"
         Top             =   480
         Width           =   495
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         Height          =   315
         Left            =   5040
         TabIndex        =   6
         Tag             =   "11775"
         Text            =   "01"
         Top             =   480
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueDate 
         Height          =   315
         Left            =   4440
         TabIndex        =   5
         Tag             =   "11775"
         Text            =   "01"
         Top             =   480
         Width           =   615
      End
      Begin VB.Frame Frame5 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   495
         Left            =   1200
         TabIndex        =   85
         Tag             =   "11775"
         Top             =   2160
         Width           =   1815
         Begin VB.OptionButton optDOBGreg 
            Caption         =   "Gregorian"
            Height          =   195
            Left            =   720
            TabIndex        =   26
            Tag             =   "1935"
            Top             =   120
            Width           =   1095
         End
         Begin VB.OptionButton optDOBHijri 
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   25
            Tag             =   "1935"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5160
         MaxLength       =   15
         TabIndex        =   22
         Tag             =   "11775"
         Top             =   1800
         Width           =   1575
      End
      Begin VB.ComboBox cmbTitleCode 
         Height          =   315
         Left            =   8640
         TabIndex        =   14
         Tag             =   "11775"
         Text            =   "cmbTitleCode"
         Top             =   840
         Width           =   2655
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   495
         Left            =   1200
         TabIndex        =   84
         Tag             =   "11775"
         Top             =   360
         Width           =   1935
         Begin VB.OptionButton optIdDateGregorian 
            Caption         =   "Gregorian"
            Height          =   255
            Left            =   720
            TabIndex        =   4
            TabStop         =   0   'False
            Tag             =   "1935"
            Top             =   120
            Width           =   1095
         End
         Begin VB.OptionButton optIdDateHijri 
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   3
            Tag             =   "1935"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   7440
         TabIndex        =   2
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   0
         Width           =   1575
      End
      Begin VB.ComboBox cmbIdType 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5160
         MaxLength       =   15
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   1440
         Width           =   1575
      End
      Begin VB.TextBox txtIdNumber 
         Height          =   285
         Left            =   4440
         TabIndex        =   1
         Tag             =   "11775"
         Top             =   0
         Width           =   1695
      End
      Begin VB.ComboBox cmbNationality 
         Height          =   315
         Left            =   4440
         TabIndex        =   13
         Tag             =   "11775"
         Text            =   "cmbNationality"
         Top             =   840
         Width           =   2775
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8880
         MaxLength       =   30
         TabIndex        =   24
         Tag             =   "11775"
         Top             =   1800
         Width           =   2895
      End
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6840
         MaxLength       =   15
         TabIndex        =   23
         Tag             =   "11775"
         Text            =   " "
         Top             =   1800
         Width           =   1935
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3240
         MaxLength       =   15
         TabIndex        =   21
         Tag             =   "11775"
         Top             =   1800
         Width           =   1815
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   20
         Tag             =   "11775"
         Top             =   1800
         Width           =   1935
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8880
         MaxLength       =   30
         TabIndex        =   19
         Tag             =   "11775"
         Top             =   1440
         Width           =   2895
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6840
         MaxLength       =   15
         TabIndex        =   18
         Tag             =   "11775"
         Top             =   1440
         Width           =   1935
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3240
         MaxLength       =   15
         TabIndex        =   16
         Tag             =   "11775"
         Top             =   1440
         Width           =   1815
      End
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   15
         Tag             =   "11775"
         Top             =   1440
         Width           =   1935
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   495
         Left            =   7080
         TabIndex        =   83
         Tag             =   "11775"
         Top             =   2160
         Width           =   2055
         Begin VB.OptionButton optGenderFemale 
            BackColor       =   &H8000000A&
            Caption         =   "Female"
            Height          =   255
            Left            =   960
            TabIndex        =   31
            Tag             =   "2055"
            Top             =   120
            Width           =   975
         End
         Begin VB.OptionButton optGenderMale 
            BackColor       =   &H8000000A&
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
         Left            =   1200
         TabIndex        =   82
         Tag             =   "11775"
         Top             =   2760
         Width           =   2535
         Begin VB.OptionButton optSingle 
            Caption         =   "Single"
            Height          =   255
            Left            =   960
            TabIndex        =   35
            TabStop         =   0   'False
            Tag             =   "2535"
            Top             =   120
            Width           =   735
         End
         Begin VB.OptionButton optMarried 
            Caption         =   "Married"
            Height          =   255
            Left            =   120
            TabIndex        =   34
            Tag             =   "2535"
            Top             =   120
            Value           =   -1  'True
            Width           =   855
         End
         Begin VB.OptionButton optOthers 
            Caption         =   "Others"
            Height          =   255
            Left            =   1680
            TabIndex        =   36
            Tag             =   "2535"
            Top             =   120
            Width           =   900
         End
      End
      Begin VB.TextBox txtDependents 
         Height          =   285
         Left            =   5040
         MaxLength       =   2
         TabIndex        =   37
         Tag             =   "11775"
         Top             =   2880
         Width           =   495
      End
      Begin VB.ComboBox cmbBusinessType 
         Height          =   315
         Left            =   10080
         TabIndex        =   40
         Tag             =   "11775"
         Text            =   "cmbBusinessType"
         Top             =   2880
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
         TabIndex        =   81
         Tag             =   "11775"
         Top             =   2760
         Width           =   2775
         Begin VB.OptionButton optNonResident 
            Caption         =   "Non Resident"
            Height          =   195
            Left            =   1200
            TabIndex        =   39
            Tag             =   "2775"
            Top             =   240
            Width           =   1455
         End
         Begin VB.OptionButton optResident 
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
      Begin VB.Frame Frame3 
         BackColor       =   &H00BFD87E&
         ForeColor       =   &H00800000&
         Height          =   495
         Left            =   1200
         TabIndex        =   80
         Tag             =   "11775"
         Top             =   720
         Width           =   1935
         Begin VB.OptionButton optLangEnglish 
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
      Begin VB.Frame frameVip 
         Height          =   495
         Left            =   10080
         TabIndex        =   79
         Tag             =   "11775"
         Top             =   2160
         Width           =   1575
         Begin VB.OptionButton optVipNo 
            Caption         =   "No"
            Height          =   255
            Left            =   840
            TabIndex        =   33
            Tag             =   "1575"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optVipYes 
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   32
            Tag             =   "1575"
            Top             =   120
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
         TabIndex        =   108
         Tag             =   "11775"
         Top             =   2280
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
         TabIndex        =   107
         Tag             =   "11775"
         Top             =   2280
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
         TabIndex        =   106
         Tag             =   "11775"
         Top             =   2280
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
         TabIndex        =   105
         Tag             =   "11775"
         Top             =   840
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
         TabIndex        =   104
         Tag             =   "11775"
         Top             =   480
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
         TabIndex        =   103
         Tag             =   "11775"
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
         TabIndex        =   102
         Tag             =   "11775"
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
         TabIndex        =   101
         Tag             =   "11775"
         Top             =   1200
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
         TabIndex        =   100
         Tag             =   "11775"
         Top             =   480
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
         TabIndex        =   99
         Tag             =   "11775"
         Top             =   480
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
         TabIndex        =   98
         Tag             =   "11775"
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
         TabIndex        =   97
         Tag             =   "11775"
         Top             =   840
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
         TabIndex        =   96
         Tag             =   "11775"
         Top             =   1200
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
         TabIndex        =   95
         Tag             =   "11775"
         Top             =   1800
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
         TabIndex        =   94
         Tag             =   "11775"
         Top             =   1440
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
         TabIndex        =   93
         Tag             =   "11775"
         Top             =   1200
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
         TabIndex        =   92
         Tag             =   "11775"
         Top             =   1200
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
         TabIndex        =   91
         Tag             =   "11775"
         Top             =   1200
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
         TabIndex        =   90
         Tag             =   "11775"
         Top             =   2880
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
         TabIndex        =   89
         Tag             =   "11775"
         Top             =   2880
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
         Left            =   8760
         TabIndex        =   88
         Tag             =   "11775"
         Top             =   2880
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
         TabIndex        =   87
         Tag             =   "11775"
         Top             =   840
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
         TabIndex        =   86
         Tag             =   "11775"
         Top             =   2280
         Width           =   495
      End
   End
   Begin VB.CommandButton cmdDone 
      Caption         =   "Done"
      Height          =   375
      Left            =   8640
      TabIndex        =   76
      ToolTipText     =   "Done"
      Top             =   7320
      Width           =   1335
   End
   Begin VB.CommandButton cmdNextJoint 
      Caption         =   "Next Joint Cutomer"
      Default         =   -1  'True
      Height          =   375
      Left            =   6480
      TabIndex        =   75
      ToolTipText     =   "Next Joint customer"
      Top             =   7320
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   10200
      TabIndex        =   77
      ToolTipText     =   "Cancel"
      Top             =   7320
      Width           =   1335
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
      Left            =   360
      TabIndex        =   134
      Top             =   7680
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11880
      Y1              =   5400
      Y2              =   5400
   End
   Begin VB.Line Line4 
      X1              =   0
      X2              =   11640
      Y1              =   3720
      Y2              =   3720
   End
End
Attribute VB_Name = "frmCustomer3"
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
      On Error Resume Next
      If Len(RTrim(cmbBusinessType.Text)) <> 0 Then
         tCode = Mid$(cmbBusinessType.Text, 1, 3)
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
      If Len(RTrim(cmbCountry.Text)) <> 0 Then
         tCode = Mid$(cmbCountry.Text, 1, 3)
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

Private Sub cmbDOBDate_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Len(RTrim(cmbDobDate.Text)) <> 0 Then
       If Len(cmbDobDate.Text) = 2 Then
          If cmbDobDate < 1 Or _
             cmbDobDate > IIf(frmCustomer3.optDOBGreg.Value = True, 31, 30) Then
             MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
             cmbDobDate.Text = ""
             cmbDobDate.SetFocus
           Else
             On Error Resume Next
             cmbDobMonth.SetFocus
           End If
       End If
    End If
 End If
End Sub

Private Sub cmbDOBDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbDOBMonth_Change()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Len(RTrim(cmbDobMonth.Text)) <> 0 Then
       If Len(cmbDobMonth.Text) = 2 Then
          If cmbDobMonth < 1 Or cmbDobMonth > 12 Then
             MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
             cmbDobMonth.Text = ""
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
      If Len(RTrim(cmbIdExpiryDate.Text)) <> 0 Then
         If Len(cmbIdExpiryDate) = 2 Then
            If cmbIdExpiryDate < 1 Or _
               cmbIdExpiryDate > IIf(frmCustomer3.optIdDateGregorian.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIdExpiryDate.Text = ""
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
      If Len(RTrim(cmbIdExpiryMonth.Text)) <> 0 Then
         If Len(cmbIdExpiryMonth.Text) = 2 Then
            If cmbIdExpiryMonth < 1 Or cmbIdExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIdExpiryMonth.Text = ""
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

Private Sub cmbIdIssuedAt_KeyPress(KeyAscii As Integer)
'   If optLangArabic.Value = True Then
'      If ((KeyAscii > 64 And KeyAscii < 91) Or _
'         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
'          KeyAscii = 0
'          MsgBox (errNoEnglishCharacters(UserLang))
'          Exit Sub
'      End If
'      If KeyAscii = 220 Then
'         MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
'         KeyAscii = 0
'         Exit Sub
'      End If
'   Else
'      If KeyAscii > 128 Then
'         KeyAscii = 0
'         MsgBox (errNoArabicCharacters(UserLang))
'         Exit Sub
'      End If
'   End If
End Sub

Private Sub cmbIdIssueDate_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Len(RTrim(cmbIdIssuedate.Text)) <> 0 Then
        If Len(cmbIdIssuedate.Text) = 2 Then
           If cmbIdIssuedate < 1 Or _
              cmbIdIssuedate > IIf(frmCustomer3.optIdDateGregorian.Value = True, 31, 30) Then
              MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
              cmbIdIssuedate.Text = ""
              cmbIdIssuedate.SetFocus
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
      If Len(RTrim(cmbIdIssueMonth.Text)) <> 0 Then
         If Len(cmbIdIssueMonth.Text) = 2 Then
            If cmbIdIssueMonth < 1 Or cmbIdIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIdIssueMonth.Text = ""
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
      If Len(RTrim(cmbNationality.Text)) <> 0 Then
         tCode = Mid$(cmbNationality.Text, 1, 3)
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

Private Sub cmbTitleCode_Click()
  If Mid$(cmbTitleCode.Text, 1, 2) = "02" Or _
     Mid$(cmbTitleCode.Text, 1, 2) = "03" Then
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
      On Error Resume Next
      If Len(RTrim(cmbTitleCode.Text)) <> 0 Then
         tCode = Mid$(cmbTitleCode.Text, 1, 2)
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
      On Error GoTo 0
    End If
End If

End Sub

Private Sub cmdCancel_Click()
    Unload Me
'    frmCustomer2.Show
End Sub

Private Sub cmdDone_Click()
        
    If supervisorAction Or searchAction Or custHistoryAction Then
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
       
    If searchAction Or custHistoryAction Then
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

Private Sub cmdNextJoint_Click()
    Dim i, totalJoint
    
    If Not supervisorAction And Not searchAction And Not custHistoryAction Then
       If validatefrmCustomer3 = 1 Then
          Exit Sub
       End If
       If Not tellerAction Then
          noOfJoint = noOfJoint + 1
       End If
       frmCustomer3.MousePointer = vbHourglass
       createJointAccount
    End If
    
    If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
       totalJoint = recvSuperActionMsg.noOfJointAcc
       If totalJoint = recvJointInfo.jointCustomerNo Then
          MsgBox errNoMoreJointAccount(UserLang) ' "No More Joint Info Exists...  "
       Else
          fetchNextJointInfo (recvJointInfo.jointCustomerNo)
       End If
       Exit Sub
    End If
    
    'this is for clearing the form
    For i = 0 To Screen.ActiveForm.Controls.Count - 1
        If TypeOf Screen.ActiveForm.Controls(i) Is TextBox Then
           Screen.ActiveForm.Controls(i).Text = ""
        End If
        If TypeOf Screen.ActiveForm.Controls(i) Is CheckBox Then
           Screen.ActiveForm.Controls(i).Value = 0
        End If
    Next
    frmCustomer3.txtAddress1 = frmCustomer.txtAddress1
    frmCustomer3.txtAddress2 = frmCustomer.txtAddress2
    frmCustomer3.txtPOBox = frmCustomer.txtPOBox
    frmCustomer3.cmbCity = frmCustomer.cmbCity
    frmCustomer3.txtPinCode = frmCustomer.txtPinCode
    frmCustomer3.txtOffPhoneCityCode = frmCustomer.txtOffPhoneCityCode
    frmCustomer3.txtOffPhoneNo = frmCustomer.txtOffPhoneNo
    frmCustomer3.txtOffPhoneExt = frmCustomer.txtOffPhoneExt
    frmCustomer3.txtResPhoneCityCode = frmCustomer.txtResPhoneCityCode
    frmCustomer3.txtResPhoneNo = frmCustomer.txtResPhoneNo
    frmCustomer3.txtResPhoneExt = frmCustomer.txtResPhoneExt
    frmCustomer3.txtFaxCityCode = frmCustomer.txtFaxCityCode
    frmCustomer3.txtFaxNo = frmCustomer.txtFaxNo
    frmCustomer3.txtFaxExt = frmCustomer.txtFaxExt
    frmCustomer3.txtMobileNo = frmCustomer.txtMobileNo
     
    frmCustomer3.cmbIdIssuedate.Text = ""
    frmCustomer3.cmbIdIssueMonth.Text = ""
    frmCustomer3.cmbIdExpiryDate.Text = ""
    frmCustomer3.cmbIdExpiryMonth.Text = ""
    frmCustomer3.cmbDobDate.Text = ""
    frmCustomer3.cmbDobMonth.Text = ""
    frmCustomer3.txtMobileAreaCode = "05"
    frmCustomer3.cmbIdType.SetFocus
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim mQry As String
       
   If UserLang = ARABIC Then
      ChangePositions frmCustomer3, 11800
      frmCustomer3.Hide
      frmCustomer3.RightToLeft = True
   End If
   
   mQry = "select * from idinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.RecordCount > 0 Then
      frmCustomer3.cmbIdType.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            frmCustomer3.cmbIdType.AddItem rs("idcode") & "-" & rs("englishname")
         Else
            frmCustomer3.cmbIdType.AddItem rs("idcode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   If cmbIdType.ListCount > 2 Then
      frmCustomer3.cmbIdType.ListIndex = 2
   End If
            
   mQry = "select * from cityinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.RecordCount > 0 Then
      rs.MoveFirst
      frmCustomer3.cmbCity.Clear
      frmCustomer3.cmbIdIssuedAt.Clear
      Do While Not rs.EOF
           If UserLang = ENGLISH Then
              frmCustomer3.cmbCity.AddItem rs("englishname")
              frmCustomer3.cmbIdIssuedAt.AddItem rs("englishname")
           Else
              frmCustomer3.cmbCity.AddItem rs("arabicname")
              frmCustomer3.cmbIdIssuedAt.AddItem rs("arabicname")
           End If
           rs.MoveNext
        Loop
    End If
        
    Set rs = db.OpenRecordset("select citycode from branchinfo " & _
               " where branchcode = '" & gBranchCode & "'")
    If rs.RecordCount > 0 Then
         tCode = rs(0)
         Set rs = db.OpenRecordset("select englishname,arabicname,telareacode from cityinfo " + _
                       " where citycode = '" & tCode & "'")
         If rs.RecordCount > 0 Then
             frmCustomer3.txtOffPhoneCityCode = rs(2)
             frmCustomer3.txtResPhoneCityCode = rs(2)
             frmCustomer3.txtFaxCityCode = rs(2)
             If UserLang = ENGLISH Then
                frmCustomer3.cmbCity.Text = rs(0)
                frmCustomer3.cmbIdIssuedAt.Text = rs(0)
             Else  ' the following part should be arabized later
                frmCustomer3.cmbCity.Text = rs(1)
                frmCustomer3.cmbIdIssuedAt.Text = rs(1)
             End If
         Else
            frmCustomer3.txtOffPhoneCityCode = "01"
            frmCustomer3.txtResPhoneCityCode = "01"
            frmCustomer3.txtFaxCityCode = "01"
            frmCustomer3.cmbCity.ListIndex = -1
            frmCustomer3.cmbIdIssuedAt.ListIndex = -1
         End If
    End If
    
    Set rs = db.OpenRecordset("select * from businesstypeinfo")
    If rs.RecordCount > 0 Then
        rs.MoveFirst
        cmbBusinessType.Clear
        Do While Not rs.EOF
           If UserLang = ARABIC Then
              frmCustomer3.cmbBusinessType.AddItem rs("businesstypecode") & "-" & rs("arabicname")
           Else
              frmCustomer3.cmbBusinessType.AddItem rs("businesstypecode") & "-" & rs("englishname")
           End If
           rs.MoveNext
        Loop
'        frmCustomer3.cmbBusinessType.ListIndex = 0
    End If
    
    Set rs = db.OpenRecordset("select * from countryinfo")
    If rs.RecordCount > 0 Then
        rs.MoveFirst
        frmCustomer3.cmbCountry.Clear
        frmCustomer3.cmbNationality.Clear
        Do While Not rs.EOF
           If UserLang = ARABIC Then
              frmCustomer3.cmbNationality.AddItem rs("countrycode") & " - " & rs("arabicname")
              frmCustomer3.cmbCountry.AddItem rs("countrycode") & " - " & rs("arabicname")
            Else
              frmCustomer3.cmbNationality.AddItem rs("countrycode") & " - " & rs("englishname")
              frmCustomer3.cmbCountry.AddItem rs("countrycode") & " - " & rs("englishname")
            End If
           rs.MoveNext
        Loop
        frmCustomer3.cmbNationality.ListIndex = 0
        frmCustomer3.cmbCountry.ListIndex = 0
    End If
    
    frmCustomer3.cmbIdExpiryDate.Clear
    frmCustomer3.cmbIdExpiryMonth.Clear
    frmCustomer3.cmbDobDate.Clear
    frmCustomer3.cmbDobMonth.Clear
    frmCustomer3.cmbIdIssuedate.Clear
    frmCustomer3.cmbIdIssueMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" + CStr(i)
       Else
          num = CStr(i)
       End If
       frmCustomer3.cmbIdIssuedate.AddItem num
       frmCustomer3.cmbDobDate.AddItem num
       frmCustomer3.cmbIdExpiryDate.AddItem num
       If i < 13 Then
          frmCustomer3.cmbIdExpiryMonth.AddItem num
          frmCustomer3.cmbIdIssueMonth.AddItem num
          frmCustomer3.cmbDobMonth.AddItem num
       End If
    Next
 
   frmCustomer3.cmbTitleCode.Clear
   Set rs = db.OpenRecordset("select * from titleinfo")
   If rs.RecordCount > 0 Then
      rs.MoveFirst
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
           frmCustomer3.cmbTitleCode.AddItem rs("titlecode") & "-" & rs("englishname")
         Else
           frmCustomer3.cmbTitleCode.AddItem rs("titlecode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
     Loop
   End If
   If cmbTitleCode.ListCount > 1 Then
      frmCustomer3.cmbTitleCode.ListIndex = 1
   End If
   
  Set rs = db.OpenRecordset("select * from segmentationinfo")
  If rs.RecordCount > 0 Then
      rs.MoveFirst
      frmCustomer3.cmbSegmentation.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            frmCustomer3.cmbSegmentation.AddItem Right(rs("segmentationcode"), 1) & "-" & rs("englishname")
         Else
            frmCustomer3.cmbSegmentation.AddItem Right(rs("segmentationcode"), 1) & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
'   If rs.RecordCount > 1 Then
'      frmCustomer3.cmbSegmentation.ListIndex = 1
'   End If
   
   Set rs = db.OpenRecordset("select * from educationinfo")
  
   rs.MoveFirst
   frmCustomer3.cmbEducation.Clear
   Do While Not rs.EOF
      If UserLang = ENGLISH Then
         frmCustomer3.cmbEducation.AddItem rs("educationcode") & "-" & rs("englishname")
      Else
         frmCustomer3.cmbEducation.AddItem rs("educationcode") & "-" & rs("arabicname")
      End If
      rs.MoveNext
   Loop
'   If rs.RecordCount > 3 Then
'      frmCustomer3.cmbEducation.ListIndex = 3
'   End If
   
   Set rs = db.OpenRecordset("select * from positioninfo")
   If rs.RecordCount > 0 Then
      rs.MoveFirst
      frmCustomer3.cmbPosition.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            frmCustomer3.cmbPosition.AddItem rs("positioncode") & "-" & rs("englishname")
         Else
            frmCustomer3.cmbPosition.AddItem rs("positioncode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
'      frmCustomer3.cmbPosition.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from professioninfo")
   If rs.RecordCount > 0 Then
      rs.MoveFirst
      frmCustomer3.cmbProfession.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            frmCustomer3.cmbProfession.AddItem rs("professioncode") & "-" & rs("englishname")
         Else
            frmCustomer3.cmbProfession.AddItem rs("professioncode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
'      frmCustomer3.cmbProfession.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from monthlyincomeinfo")
   If rs.RecordCount > 0 Then
      rs.MoveFirst
      frmCustomer3.cmbMonthlyIncome.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            frmCustomer3.cmbMonthlyIncome.AddItem rs("incomecode") & "-" & rs("englishname")
         Else
            frmCustomer3.cmbMonthlyIncome.AddItem rs("incomecode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
'      frmCustomer3.cmbMonthlyIncome.ListIndex = 0
   End If
   
   If supervisorAction Or searchAction Or custHistoryAction Then
      frmCustomer3.FrameJointAcctInfo1.Enabled = False
      frmCustomer3.framejointcustomerinfo2.Enabled = False
      frmCustomer3.frameJointCustomerContactInfo.Enabled = False
      If custHistoryAction Then
         frmCustomer3.lblHistory.Visible = True
         frmCustomer3.lblHistory.Refresh
      Else
         frmCustomer3.lblHistory.Visible = False
      End If
   Else
      frmCustomer3.FrameJointAcctInfo1.Enabled = True
      frmCustomer3.framejointcustomerinfo2.Enabled = True
      frmCustomer3.frameJointCustomerContactInfo.Enabled = True
      If gBranchCode = "0499" Then
         frameVIP.Enabled = True
      Else
         frameVIP.Enabled = False
      End If
   End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub FrameJointAcctInfo1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub frameJointCustomerContactInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub framejointcustomerinfo2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub optGenderFemale_Click()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Mid$(cmbTitleCode.Text, 1, 2) <> "02" And _
        Mid$(cmbTitleCode.Text, 1, 2) <> "03" Then
      
        MsgBox errInvalidTitle(UserLang)
        optGenderMale.Value = True
     End If
  End If
End Sub

Private Sub optGenderMale_Click()
 If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Mid$(cmbTitleCode.Text, 1, 2) = "02" Or _
       Mid$(cmbTitleCode.Text, 1, 2) = "03" Then
      
       MsgBox errInvalidTitle(UserLang)
       optGenderFemale.Value = True
    End If
 End If
End Sub

Private Sub txtAddress1_KeyPress(KeyAscii As Integer)
   If frmCustomer3.optLangArabic Then
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
   If frmCustomer3.optLangArabic Then
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
   txtArabShortName = txtArabLastName + " " + txtArabFirstName
   If Len(txtArabShortName) + Len(txtArabic2ndName) < 30 Then
       txtArabShortName = txtArabShortName + " " + txtArabic2ndName
       If Len(txtArabShortName) + Len(txtArabic3rdName) < 30 Then
           txtArabShortName = txtArabShortName + " " + txtArabic3rdName
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

Private Sub txtDOBYear_LostFocus()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     If Screen.ActiveControl.Name = "cmdCancel" Then
        DoEvents
     Else
        On Error Resume Next
        If Len(RTrim(txtDobYear)) <> 0 Then
           If optDOBHijri.Value = True Then
              If txtDobYear > 1600 Then
                 MsgBox errEnterValidYear(UserLang) ' "Enter a valid Year"
                 txtDobYear.Text = ""
                 txtDobYear.SetFocus
              End If
            Else
              If txtDobYear < 1600 Then
                 MsgBox errEnterValidYear(UserLang) ' "Enter a valid Year"
                 txtDobYear.Text = ""
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
   txtEngShortName = txtEngLastName + " " + txtEngFirstName
   If Len(txtEngShortName) + Len(txtEnglish2ndName) < 30 Then
       txtEngShortName = txtEngShortName + " " + txtEnglish2ndName
       If Len(txtEngShortName) + Len(txtEnglish3rdName) < 30 Then
           txtEngShortName = txtEngShortName + " " + txtEnglish3rdName
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
             MsgBox errInvalidFaxNo(UserLang) '"Fax Number should contain atleast 7 digits..Please RE-try"
             txtFaxNo.SetFocus
          End If
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
       If Len(RTrim(txtIdExpiryYear)) <> 0 Then
          If optIdDateHijri.Value = True Then
             If txtIdExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                txtIdExpiryYear.Text = ""
                txtIdExpiryYear.SetFocus
             End If
          Else
             If txtIdExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                txtIdExpiryYear.Text = ""
                txtIdExpiryYear.SetFocus
             End If
           End If
        End If
     End If
     On Error GoTo 0
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
 
Public Sub fetchNextJointInfo(jointCustNo As String)

    Dim strmsglen As String, tCode As String, tuserId As String, tDateTime As String, tBranchCode As String
    Dim recType As String * 2
   
    If searchAction Or updateAction Then
       recType = "02"
       tuserId = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    ElseIf custHistoryAction Then
       recType = "01"
       frmCustUpdateHistory.custHistoryGrid.Col = 0
       tBranchCode = Format(frmCustUpdateHistory.custHistoryGrid.Text, "0000")
       frmCustUpdateHistory.custHistoryGrid.Col = 1
       tuserId = Format(frmCustUpdateHistory.custHistoryGrid.Text, "!@@@@@@@@@@")
       frmCustUpdateHistory.custHistoryGrid.Col = 2
       tmpStr = frmCustUpdateHistory.custHistoryGrid.Text
       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
       tDateTime = Format(tDateTime, "00000000000000")
    Else
        recType = "01"
        frmSupervisorApproval.MSFlexGrid1.Col = 0
        tuserId = Format(frmSupervisorApproval.MSFlexGrid1.Text, "!@@@@@@@@@@")
        frmSupervisorApproval.MSFlexGrid1.Col = 1
        tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.Text, "00000000000000")
        tBranchCode = gBranchCode
    End If
        
    SendMsg = "000057" + "18" + gBranchCode + recType + tBranchCode + tuserId + tDateTime + recvSuperActionMsg.customerNo + jointCustNo
    frmCustomer3.MousePointer = vbHourglass
    frmCustomer3.cmdCancel.Enabled = False
    frmCustomer3.cmdDone.Enabled = False
    frmCustomer3.cmdNextJoint.Enabled = False
    CSD_mdiForm.staticStatus.Panels(3).Text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpclient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).Text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCustomer3.MousePointer = vbDefault
       frmCustomer3.cmdCancel.Enabled = True
       frmCustomer3.cmdDone.Enabled = True
       frmCustomer3.cmdNextJoint.Enabled = True
       Exit Sub
    End If
    frmCustomer3.MousePointer = vbDefault
    frmCustomer3.cmdCancel.Enabled = True
    frmCustomer3.cmdDone.Enabled = True
    frmCustomer3.cmdNextJoint.Enabled = True
    If recvJointInfo.status = "000" Then
       tCode = recvJointInfo.idType
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbIdType.ListCount
              If Mid(frmCustomer3.cmbIdType.List(i), 1, 1) = tCode Then
                 frmCustomer3.cmbIdType.ListIndex = i
                 Exit For
              End If
          Next i
        Else
          frmCustomer3.cmbIdType.ListIndex = -1
        End If
        If i > frmCustomer3.cmbIdType.ListCount Then
          frmCustomer3.cmbIdType.ListIndex = -1
'          frmCustomer3.cmbIdType.AddItem tCode & "-Not defined in local"
'          frmCustomer3.cmbIdType.ListIndex = frmCustomer3.cmbIdType.ListCount - 1
        End If
       
       frmCustomer3.txtIdNumber = recvJointInfo.idNo
       frmCustomer3.cmbIdIssuedAt.Text = recvJointInfo.idIssuedAt
       
       If recvJointInfo.idDateType = "0" Or _
          recvJointInfo.idDateType = " " Then
          frmCustomer3.optIdDateHijri.Value = True
          frmCustomer3.cmbIdIssuedate.Text = _
                  Right$(recvJointInfo.idIssueDateH, 2)
          frmCustomer3.cmbIdIssueMonth.Text = _
                  Mid$(recvJointInfo.idIssueDateH, 5, 2)
          frmCustomer3.txtIdIssueYear = Mid$(recvJointInfo.idIssueDateH, 1, 4)
          frmCustomer3.cmbIdExpiryDate.Text = _
                  Right$(recvJointInfo.idExpiryDateH, 2)
          frmCustomer3.cmbIdExpiryMonth.Text = _
                  Mid$(recvJointInfo.idExpiryDateH, 5, 2)
          frmCustomer3.txtIdExpiryYear = Mid$(recvJointInfo.idExpiryDateH, 1, 4)
       Else
          frmCustomer3.optIdDateGregorian.Value = True
          frmCustomer3.cmbIdIssuedate.Text = _
                  Right$(recvJointInfo.idIssueDateG, 2)
          frmCustomer3.cmbIdIssueMonth.Text = _
                  Mid$(recvJointInfo.idIssueDateG, 5, 2)
          frmCustomer3.txtIdIssueYear = Mid$(recvJointInfo.idIssueDateG, 1, 4)
          frmCustomer3.cmbIdExpiryDate.Text = _
                  Right$(recvJointInfo.idExpiryDateG, 2)
          frmCustomer3.cmbIdExpiryMonth.Text = _
                  Mid$(recvJointInfo.idExpiryDateG, 5, 2)
          frmCustomer3.txtIdExpiryYear = Mid$(recvJointInfo.idExpiryDateG, 1, 4)
       End If
         
       If recvJointInfo.preferredLang = "0" Or _
          recvJointInfo.preferredLang = " " Then
          frmCustomer3.optLangArabic.Value = True
       Else
          frmCustomer3.optLangEnglish.Value = True
       End If
         
       tCode = Mid$(recvJointInfo.nationality, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbNationality.ListCount
              If Mid(frmCustomer3.cmbNationality.List(i), 1, 3) = tCode Then
                 frmCustomer3.cmbNationality.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmCustomer3.cmbNationality.ListIndex = -1
       End If
       If i > frmCustomer3.cmbNationality.ListCount Then
          frmCustomer3.cmbNationality.ListIndex = -1
          'frmCustomer3.cmbNationality.Text = tCode & "-Not defined in local"
       End If
         
       tCode = recvJointInfo.titleCode
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbTitleCode.ListCount
              If Mid(frmCustomer3.cmbTitleCode.List(i), 1, 2) = tCode Then
                 frmCustomer3.cmbTitleCode.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmCustomer3.cmbTitleCode.ListIndex = -1
       End If
       If i > frmCustomer3.cmbTitleCode.ListCount Then
          frmCustomer3.cmbTitleCode.ListIndex = -1
          'frmCustomer3.cmbTitleCode.Text = tCode & "-Not defined in local"
       End If
       
       frmCustomer3.txtArabFirstName = _
             recvJointInfo.aFirstName
       frmCustomer3.txtArabic2ndName = _
             recvJointInfo.a2ndName
       frmCustomer3.txtArabic3rdName = _
             recvJointInfo.a3rdName
       frmCustomer3.txtArabLastName = _
             recvJointInfo.aLastName
       frmCustomer3.txtArabShortName = _
             recvJointInfo.aShortName
         
       frmCustomer3.txtEngFirstName = _
             recvJointInfo.eFirstName
       frmCustomer3.txtEnglish2ndName = _
             recvJointInfo.e2ndName
       frmCustomer3.txtEnglish3rdName = _
             recvJointInfo.e3rdName
       frmCustomer3.txtEngLastName = _
             recvJointInfo.eLastName
       frmCustomer3.txtEngShortName = _
             recvJointInfo.eShortName
       
       If recvJointInfo.dobDateType = "0" Or _
          recvJointInfo.dobDateType = " " Then
          frmCustomer3.optDOBHijri.Value = True
          frmCustomer3.cmbDobDate.Text = _
                Right$(recvJointInfo.dobDateH, 2)
          frmCustomer3.cmbDobMonth.Text = _
                Mid$(recvJointInfo.dobDateH, 5, 2)
          frmCustomer3.txtDobYear = Mid$(recvJointInfo.dobDateH, 1, 4)
       Else
          frmCustomer3.optDOBGreg.Value = True
          frmCustomer3.cmbDobDate.Text = _
               Right$(recvJointInfo.dobDateG, 2)
          frmCustomer3.cmbDobMonth.Text = _
               Mid$(recvJointInfo.dobDateG, 5, 2)
          frmCustomer3.txtDobYear = Mid$(recvJointInfo.dobDateG, 1, 4)
       End If
       If recvJointInfo.sexCode = "0" Or _
          recvJointInfo.sexCode = " " Then
          frmCustomer3.optGenderMale.Value = True
       Else
          frmCustomer3.optGenderFemale.Value = True
       End If
        
       If recvJointInfo.vipCode = "1" Then
          frmCustomer3.optVipYes.Value = True
       Else
          frmCustomer3.optVipNo.Value = True
       End If
        
       If recvJointInfo.maritalStatus = "0" Or _
          recvJointInfo.maritalStatus = " " Then
          frmCustomer3.optMarried.Value = True
       ElseIf recvJointInfo.maritalStatus = "1" Then
          frmCustomer3.OptSingle.Value = True
       Else
          frmCustomer3.optOthers.Value = True
       End If
         
       frmCustomer3.txtDependents = recvJointInfo.noOfDependents
       If recvJointInfo.residentStatus = "0" Or _
          recvJointInfo.residentStatus = " " Then
          frmCustomer3.optResident.Value = True
       Else
          frmCustomer3.optNonResident.Value = True
       End If
         
       tCode = Mid$(recvJointInfo.businessType, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbBusinessType.ListCount
            If Mid(frmCustomer3.cmbBusinessType.List(i), 1, 3) = tCode Then
               frmCustomer3.cmbBusinessType.ListIndex = i
               Exit For
            End If
          Next i
       Else
          frmCustomer3.cmbBusinessType.ListIndex = -1
       End If
       
       If i > frmCustomer3.cmbBusinessType.ListCount Then
          frmCustomer3.cmbBusinessType.ListIndex = -1
          'frmCustomer3.cmbBusinessType.Text = tCode & "-Not defined in local"
       End If
                
       frmCustomer3.txtAddress1 = recvJointInfo.address1
       frmCustomer3.txtAddress2 = recvJointInfo.address2
       frmCustomer3.txtPOBox = recvJointInfo.poBox
       frmCustomer3.cmbCity.Text = recvJointInfo.cityName
       frmCustomer3.txtPinCode = recvJointInfo.zipCode
       
       tCode = Mid$(recvJointInfo.country, 1, 3)
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbCountry.ListCount
              If Mid$(frmCustomer3.cmbCountry.List(i), 1, 3) = tCode Then
                 frmCustomer3.cmbCountry.ListIndex = i
                 Exit For
              End If
           Next i
       Else
           frmCustomer3.cmbCountry.ListIndex = -1
       End If
       
       If i > frmCustomer3.cmbCountry.ListCount Then
          frmCustomer3.cmbCountry.Text = tCode & "-Not defined in local"
       End If
       If Len(RTrim(recvJointInfo.telOffAreaCode)) <> 0 Or _
          Not updateAction Then
          frmCustomer3.txtOffPhoneCityCode = recvJointInfo.telOffAreaCode
       End If
       frmCustomer3.txtOffPhoneNo = recvJointInfo.telOffNo
       frmCustomer3.txtOffPhoneExt = recvJointInfo.telOffExt
       If Len(RTrim(recvJointInfo.telHomeAreaCode)) <> 0 Or _
          Not updateAction Then
          frmCustomer3.txtResPhoneCityCode = recvJointInfo.telHomeAreaCode
       End If
       frmCustomer3.txtResPhoneNo = recvJointInfo.telHomeNo
       frmCustomer3.txtResPhoneExt = recvJointInfo.telHomeExt
       If Len(RTrim(recvJointInfo.faxAreaCode)) <> 0 Or _
          Not updateAction Then
          frmCustomer3.txtFaxCityCode = recvJointInfo.faxAreaCode
       End If
       frmCustomer3.txtFaxNo = recvJointInfo.faxNo
       frmCustomer3.txtFaxExt = recvJointInfo.faxExt
         
       frmCustomer3.txtMobileAreaCode = Mid$(recvJointInfo.mobileNo, 1, 2)
       frmCustomer3.txtMobileNo = Mid$(recvJointInfo.mobileNo, 3)
       frmCustomer3.txtPagerNo = recvJointInfo.pagerNo
       frmCustomer3.txtEmailAddress = recvJointInfo.eMail
         
       tCode = recvJointInfo.educationCode
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbEducation.ListCount
              If Mid$(frmCustomer3.cmbEducation.List(i), 3, 2) = tCode Then
                 frmCustomer3.cmbEducation.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmCustomer3.cmbEducation.ListIndex = -1
       End If
       
       If i > frmCustomer3.cmbEducation.ListCount Then
          frmCustomer3.cmbEducation.ListIndex = -1
'          frmCustomer3.cmbEducation.AddItem tCode & "-Not defined in local"
'          frmCustomer3.cmbEducation.ListIndex = frmCustomer3.cmbEducation.ListCount - 1
       End If
         
       tCode = recvJointInfo.professionCode
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbProfession.ListCount
              If Mid$(frmCustomer3.cmbProfession.List(i), 3, 2) = tCode Then
                 frmCustomer3.cmbProfession.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmCustomer3.cmbProfession.ListIndex = -1
       End If
       
       If i > frmCustomer3.cmbProfession.ListCount Then
          frmCustomer3.cmbProfession.ListIndex = -1
'          frmCustomer3.cmbProfession.AddItem tCode & "- Not defined in local"
'          frmCustomer3.cmbProfession.ListIndex = frmCustomer3.cmbProfession.ListCount - 1
       End If
       
       tCode = recvJointInfo.positionCode
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbPosition.ListCount
             If Mid$(frmCustomer3.cmbPosition.List(i), 3, 2) = tCode Then
                frmCustomer3.cmbPosition.ListIndex = i
                Exit For
             End If
          Next i
        Else
           frmCustomer3.cmbPosition.ListIndex = -1
        End If
        
        If i > frmCustomer3.cmbPosition.ListCount Then
           frmCustomer3.cmbPosition.ListIndex = -1
'           frmCustomer3.cmbPosition.AddItem tCode & "-Not defined in local"
'           frmCustomer3.cmbPosition.ListIndex = frmCustomer3.cmbPosition.ListCount - 1
        End If
        
       tCode = recvJointInfo.monthlyIncome
       If tCode <> "" Then
          For i = 0 To frmCustomer3.cmbMonthlyIncome.ListCount
              If Mid$(frmCustomer3.cmbMonthlyIncome.List(i), 3, 2) = tCode Then
                 frmCustomer3.cmbMonthlyIncome.ListIndex = i
                 Exit For
              End If
          Next i
       Else
          frmCustomer3.cmbMonthlyIncome.ListIndex = -1
       End If
       
       If i > frmCustomer3.cmbMonthlyIncome.ListCount Then
          frmCustomer3.cmbMonthlyIncome.ListIndex = -1
'          frmCustomer3.cmbMonthlyIncome.AddItem tCode & "-Not defined in local"
'          frmCustomer3.cmbMonthlyIncome.ListIndex = frmCustomer3.cmbMonthlyIncome.ListCount - 1
       End If
       
       tCode = recvJointInfo.segmentation
       If Len(Trim(tCode)) = 0 Then
          tCode = "0"
       End If
       For i = 0 To frmCustomer3.cmbSegmentation.ListCount
           If Mid$(frmCustomer3.cmbSegmentation.List(i), 1, 1) = tCode Then
              frmCustomer3.cmbSegmentation.ListIndex = i
              Exit For
           End If
       Next i
       
       If i > frmCustomer3.cmbSegmentation.ListCount Then
          frmCustomer3.cmbSegmentation.AddItem tCode & "-Not defined in local"
          frmCustomer3.cmbSegmentation.ListIndex = frmCustomer3.cmbMonthlyIncome.ListCount - 1
       End If
       
       tCode = recvJointInfo.ownerShip
       If Mid$(tCode, 1, 1) = "1" Then
          frmCustomer3.chkRentHome.Value = 1
       Else
          frmCustomer3.chkRentHome.Value = 0
       End If
       If Mid$(tCode, 2, 1) = "1" Then
          frmCustomer3.chkOwnHouse.Value = 1
       Else
          frmCustomer3.chkOwnHouse.Value = 0
       End If
       If Mid$(tCode, 3, 1) = "1" Then
          frmCustomer3.chkCompanyAccomodation.Value = 1
       Else
          frmCustomer3.chkCompanyAccomodation.Value = 0
       End If
       If Mid$(tCode, 4, 1) = "1" Then
          frmCustomer3.chkRentCar.Value = 1
       Else
          frmCustomer3.chkRentCar.Value = 0
       End If
       If Mid$(tCode, 5, 1) = "1" Then
          frmCustomer3.chkOwnCar.Value = 1
       Else
          frmCustomer3.chkOwnCar.Value = 0
       End If
       If Mid$(tCode, 6, 1) = "1" Then
          frmCustomer3.chkCompanyTrans.Value = 1
       Else
          frmCustomer3.chkCompanyTrans.Value = 0
       End If
       
       frmCustomer3.txtEmployerName = recvJointInfo.employerName
       frmCustomer3.txtDepartment = recvJointInfo.department
       frmCustomer3.txtEmployerPOBox = recvJointInfo.employerPoBox
       frmCustomer3.txtEmployerCity = recvJointInfo.employerCity
       frmCustomer3.txtEmployerZipcode = recvJointInfo.employerZipCode
    Else
         MsgBox errNoMoreJoint(UserLang)  ' "No More joint account exists..."
         CSD_mdiForm.staticStatus.Panels(3).Text = "  "
         Exit Sub
    End If  ' recvjointinfo.status = "000"
    
    CSD_mdiForm.staticStatus.Panels(3).Text = "   "
    
End Sub


Private Sub createJointAccount()
    Dim i, strmsglen
        
    formatJointAccInfo
    SendMsg = jointInfo.msgLen + jointInfo.service + gBranchCode + jointInfo.branchCode + _
             jointInfo.userId + jointInfo.dateTime + jointInfo.creationOrUpdate + frmCustomer.txtCustomerNo + _
             jointInfo.jointCustomerNo + jointInfo.newOrUpdate + jointInfo.supervisorId + jointInfo.idNo + _
             jointInfo.idType + jointInfo.idIssuedAt + jointInfo.idDateType + _
             jointInfo.idIssueDateH + jointInfo.idIssueDateG + jointInfo.idExpiryDateH + _
             jointInfo.idExpiryDateG + jointInfo.preferredLang + jointInfo.nationality + _
             jointInfo.titleCode + jointInfo.dobDateType + jointInfo.dobDateH + _
             jointInfo.dobDateG + jointInfo.sexCode + jointInfo.vipCode + jointInfo.maritalStatus + _
             jointInfo.noOfDependents + jointInfo.residentStatus + jointInfo.businessType + _
             jointInfo.aFirstName + jointInfo.a2ndName + jointInfo.a3rdName + _
             jointInfo.aLastName + jointInfo.aShortName + jointInfo.eFirstName + _
             jointInfo.e2ndName + jointInfo.e3rdName + jointInfo.eLastName + _
             jointInfo.eShortName + jointInfo.address1 + jointInfo.address2 + _
             jointInfo.poBox + jointInfo.cityName + jointInfo.zipCode + jointInfo.country + _
             jointInfo.telOffAreaCode + jointInfo.telOffNo + jointInfo.telOffExt + _
             jointInfo.telHomeAreaCode + jointInfo.telHomeNo + jointInfo.telHomeExt + _
             jointInfo.faxAreaCode + jointInfo.faxNo + jointInfo.faxExt + _
             jointInfo.mobileNo + jointInfo.pagerNo + jointInfo.eMail + jointInfo.educationCode + _
             jointInfo.professionCode + jointInfo.positionCode + jointInfo.monthlyIncome + _
             jointInfo.ownerShip + jointInfo.segmentation + jointInfo.employerName + jointInfo.department + jointInfo.employerPoBox + _
             jointInfo.employerCity + jointInfo.employerZipCode

    frmCustomer3.MousePointer = vbHourglass
    frmCustomer3.cmdCancel.Enabled = False
    frmCustomer3.cmdNextJoint.Enabled = False
    frmCustomer3.cmdDone.Enabled = False
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpclient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmCustomer3.MousePointer = vbDefault
       frmCustomer3.cmdCancel.Enabled = True
       frmCustomer3.cmdNextJoint.Enabled = True
       frmCustomer3.cmdDone.Enabled = True
       Exit Sub
    End If
    
    frmCustomer3.MousePointer = vbDefault
    frmCustomer3.cmdCancel.Enabled = True
    frmCustomer3.cmdNextJoint.Enabled = True
    frmCustomer3.cmdDone.Enabled = True
       
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).Text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).Text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) ' "Transaction Successfully completed...."
    Else
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
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
     On Error Resume Next
     If Len(RTrim(txtIdIssueYear)) <> 0 Then
        If optIdDateHijri.Value = True Then
           If txtIdIssueYear > 1600 Then
              MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
              txtIdIssueYear.Text = ""
              txtIdIssueYear.SetFocus
           End If
        Else
           If txtIdIssueYear < 1600 Then
              MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
              txtIdIssueYear.Text = ""
              txtIdIssueYear.SetFocus
           End If
        End If
     End If
     On Error GoTo 0
  End If
End Sub


Private Sub txtIdNumber_KeyPress(KeyAscii As Integer)
   If Mid$(cmbIdType.Text, 1, 1) = "Q" Or _
      Mid$(cmbIdType.Text, 1, 1) = "I" Then
      If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errOnlyNumeralsAllowed(UserLang))
          Exit Sub
      End If
   End If
End Sub

Private Sub txtIdNumber_LostFocus()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
         DoEvents
    Else
      On Error Resume Next
      If Mid$(cmbIdType.Text, 1, 1) = "I" Or _
         Mid$(cmbIdType.Text, 1, 1) = "Q" Then
         If Len(Trim(txtIdNumber)) <> 10 Then
            MsgBox errInvalidId(UserLang)
            txtIdNumber.SetFocus
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
