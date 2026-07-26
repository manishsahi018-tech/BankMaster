VERSION 5.00
Begin VB.Form frmCustomer2 
   BackColor       =   &H00BFD87E&
   Caption         =   "Customers Maintenance Page 2"
   ClientHeight    =   8595
   ClientLeft      =   -45
   ClientTop       =   450
   ClientWidth     =   11865
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8595
   ScaleWidth      =   11865
   WindowState     =   2  'Maximized
   Begin VB.Frame FrameUpdateForSama 
      Height          =   495
      Left            =   1800
      TabIndex        =   134
      Top             =   2280
      Width           =   1575
      Begin VB.OptionButton optSamaUpdNo 
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   25
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optSamaUpdYes 
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   24
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
   End
   Begin VB.TextBox txtRelationshipManager 
      Height          =   285
      Left            =   6240
      TabIndex        =   26
      Top             =   2280
      Width           =   3015
   End
   Begin VB.TextBox txtGeneralMemo 
      Height          =   285
      Left            =   6240
      TabIndex        =   27
      Top             =   2640
      Width           =   3015
   End
   Begin VB.Frame framePackagedAcc 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame4"
      Enabled         =   0   'False
      Height          =   615
      Left            =   0
      TabIndex        =   132
      Top             =   2760
      Width           =   3855
      Begin VB.ComboBox cmbPackageAcc 
         Height          =   315
         Left            =   1200
         TabIndex        =   28
         Tag             =   "3855"
         Top             =   240
         Width           =   2415
      End
      Begin VB.Label lblPackagedAccount 
         BackColor       =   &H00BFD87E&
         Caption         =   "Package A/c"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   735
         Left            =   0
         TabIndex        =   133
         Tag             =   "3855"
         Top             =   240
         Width           =   1815
      End
   End
   Begin VB.Frame frameCustomerAdvice 
      Height          =   495
      Left            =   10200
      TabIndex        =   131
      Top             =   2760
      Width           =   1575
      Begin VB.OptionButton optCustAdviceNo 
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   32
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optCustAdviceYes 
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   31
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
   End
   Begin VB.Frame FrameInternetFlag 
      Height          =   495
      Left            =   6240
      TabIndex        =   129
      Top             =   2880
      Width           =   1575
      Begin VB.OptionButton optInternetNo 
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   30
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optInternetYes 
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   29
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
   End
   Begin VB.Frame frameDocuments 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   615
      Left            =   0
      TabIndex        =   125
      Top             =   1560
      Width           =   11775
      Begin VB.TextBox txtDocOthers 
         Height          =   285
         Left            =   8160
         TabIndex        =   23
         Tag             =   "11775"
         Text            =   " "
         Top             =   240
         Width           =   3615
      End
      Begin VB.CheckBox chkJointAcAgreement 
         BackColor       =   &H00BFD87E&
         Caption         =   "Joint A/c agreement"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4560
         TabIndex        =   22
         Tag             =   "11775"
         ToolTipText     =   "Joint A/c agreement"
         Top             =   240
         Width           =   2535
      End
      Begin VB.CheckBox chkSalaryTransfer 
         BackColor       =   &H00BFD87E&
         Caption         =   "Salary Transfer"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   21
         Tag             =   "11775"
         ToolTipText     =   "Salary Transfer"
         Top             =   240
         Width           =   3255
      End
      Begin VB.CheckBox chkDocPowerOfAttorney 
         BackColor       =   &H00BFD87E&
         Caption         =   "Power of Attorney"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   9840
         TabIndex        =   20
         Tag             =   "11775"
         ToolTipText     =   "Power of Attorney"
         Top             =   0
         Width           =   1935
      End
      Begin VB.CheckBox chkEstablishContract 
         BackColor       =   &H00BFD87E&
         Caption         =   "Est. Contract"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   8160
         TabIndex        =   19
         Tag             =   "11775"
         ToolTipText     =   "Establishment contract"
         Top             =   0
         Width           =   1695
      End
      Begin VB.CheckBox chkDocregistrationCert 
         BackColor       =   &H00BFD87E&
         Caption         =   "Registration certificate"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   5520
         TabIndex        =   18
         Tag             =   "11775"
         ToolTipText     =   "Registration certificate"
         Top             =   0
         Width           =   2295
      End
      Begin VB.CheckBox chkdocIqamacopy 
         BackColor       =   &H00BFD87E&
         Caption         =   "Copy of Id/Iqama"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   2640
         TabIndex        =   17
         Tag             =   "11775"
         ToolTipText     =   "Copy of ID/Iqama"
         Top             =   0
         Value           =   1  'Checked
         Width           =   2775
      End
      Begin VB.CheckBox chkDocSignature 
         BackColor       =   &H00BFD87E&
         Caption         =   "Signature"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   16
         Tag             =   "11775"
         ToolTipText     =   "Signature"
         Top             =   0
         Value           =   1  'Checked
         Width           =   1335
      End
      Begin VB.Line Line3 
         X1              =   0
         X2              =   11880
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Label lblOthers 
         BackColor       =   &H00BFD87E&
         Caption         =   "Others"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   7200
         TabIndex        =   127
         Tag             =   "11775"
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblDocuments 
         BackColor       =   &H00BFD87E&
         Caption         =   "Documents"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Top             =   0
         Width           =   1095
      End
   End
   Begin VB.Frame FrameCustomerDetail2 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   0
      TabIndex        =   113
      Top             =   0
      Width           =   11895
      Begin VB.ComboBox cmbSegmentation 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Tag             =   "11775"
         Top             =   360
         Width           =   1935
      End
      Begin VB.TextBox txtEmployerZipcode 
         Height          =   285
         Left            =   10680
         MaxLength       =   10
         TabIndex        =   15
         Tag             =   "11775"
         Top             =   1080
         Width           =   975
      End
      Begin VB.ComboBox cmbMonthlyIncome 
         Height          =   315
         Left            =   10080
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Tag             =   "11775"
         Top             =   0
         Width           =   1575
      End
      Begin VB.ComboBox cmbEducation 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Tag             =   "11775"
         Top             =   0
         Width           =   1935
      End
      Begin VB.ComboBox cmbProfession 
         Height          =   315
         Left            =   4440
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Tag             =   "11775"
         Top             =   0
         Width           =   1500
      End
      Begin VB.ComboBox cmbPosition 
         Height          =   315
         Left            =   7080
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   "11775"
         Top             =   0
         Width           =   1335
      End
      Begin VB.CheckBox chkRentedHouse 
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
         TabIndex        =   5
         Tag             =   "11775"
         ToolTipText     =   "Rented Home"
         Top             =   720
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
         Left            =   2760
         TabIndex        =   6
         Tag             =   "11775"
         ToolTipText     =   "Own House"
         Top             =   720
         Width           =   1335
      End
      Begin VB.CheckBox chkCompanyAcc 
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
         Left            =   4200
         TabIndex        =   7
         Tag             =   "11775"
         ToolTipText     =   "Company Accomodation"
         Top             =   720
         Width           =   2055
      End
      Begin VB.CheckBox chkRentedCar 
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
         Left            =   6360
         TabIndex        =   8
         Tag             =   "11775"
         ToolTipText     =   "Rented Car"
         Top             =   720
         Width           =   1695
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
         Left            =   8040
         TabIndex        =   9
         Tag             =   "11775"
         ToolTipText     =   "Own Car"
         Top             =   720
         Width           =   1455
      End
      Begin VB.CheckBox chkCompanyTransport 
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
         TabIndex        =   10
         Tag             =   "11775"
         ToolTipText     =   "Company Transport"
         Top             =   720
         Width           =   2055
      End
      Begin VB.TextBox txtEmployerName 
         Height          =   285
         Left            =   1440
         MaxLength       =   30
         TabIndex        =   11
         Tag             =   "11775"
         Top             =   1080
         Width           =   2655
      End
      Begin VB.TextBox txtDepartment 
         Height          =   285
         Left            =   4800
         MaxLength       =   20
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   1080
         Width           =   1575
      End
      Begin VB.TextBox txtEmployerPOBox 
         Height          =   285
         Left            =   6840
         MaxLength       =   10
         TabIndex        =   13
         Tag             =   "11775"
         Top             =   1080
         Width           =   735
      End
      Begin VB.TextBox txtEmployerCity 
         Height          =   285
         Left            =   8400
         MaxLength       =   20
         TabIndex        =   14
         Tag             =   "11775"
         Top             =   1080
         Width           =   1095
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
         TabIndex        =   124
         Tag             =   "11775"
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label lblZipcode 
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
         Left            =   9600
         TabIndex        =   123
         Tag             =   "11775"
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Line Line1 
         Tag             =   "11775"
         X1              =   0
         X2              =   11640
         Y1              =   2160
         Y2              =   2160
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
         TabIndex        =   122
         Tag             =   "11775"
         Top             =   0
         Width           =   975
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
         TabIndex        =   121
         Tag             =   "11775"
         Top             =   0
         Width           =   1215
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
         TabIndex        =   120
         Tag             =   "11775"
         Top             =   0
         Width           =   975
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
         TabIndex        =   119
         Tag             =   "11775"
         Top             =   0
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
         TabIndex        =   118
         Tag             =   "11775"
         Top             =   720
         Width           =   1215
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
         TabIndex        =   117
         Tag             =   "11775"
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label lblDepartment 
         BackColor       =   &H00BFD87E&
         Caption         =   "Dept."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4200
         TabIndex        =   116
         Tag             =   "11775"
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label lblPOBox 
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
         Left            =   6360
         TabIndex        =   115
         Tag             =   "11775"
         Top             =   1080
         Width           =   495
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
         Left            =   7680
         TabIndex        =   114
         Tag             =   "11775"
         Top             =   1080
         Width           =   735
      End
   End
   Begin VB.Frame frameSingleJoint 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame4"
      Height          =   495
      Left            =   0
      TabIndex        =   108
      Top             =   4920
      Width           =   9735
      Begin VB.Frame frameSignSingleJoint 
         Height          =   495
         Left            =   5880
         TabIndex        =   112
         Tag             =   "9735"
         Top             =   0
         Width           =   2295
         Begin VB.OptionButton optSignSingle 
            Caption         =   "Single"
            Height          =   255
            Left            =   120
            TabIndex        =   53
            Tag             =   "2295"
            ToolTipText     =   "Single"
            Top             =   120
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.OptionButton optSignJoint 
            Caption         =   "Joint"
            Height          =   255
            Left            =   1200
            TabIndex        =   54
            Tag             =   "2295"
            ToolTipText     =   "Joint"
            Top             =   120
            Width           =   855
         End
      End
      Begin VB.Frame frameAcSingleJoint 
         Height          =   495
         Left            =   1440
         TabIndex        =   109
         Tag             =   "9735"
         Top             =   0
         Width           =   2295
         Begin VB.OptionButton optJoint 
            Caption         =   "Joint"
            Height          =   255
            Left            =   1200
            TabIndex        =   52
            Tag             =   "2295"
            ToolTipText     =   "Joint"
            Top             =   120
            Width           =   855
         End
         Begin VB.OptionButton OptSingle 
            Caption         =   "Single"
            Height          =   255
            Left            =   120
            TabIndex        =   51
            Tag             =   "2295"
            ToolTipText     =   "Single"
            Top             =   120
            Value           =   -1  'True
            Width           =   735
         End
      End
      Begin VB.Label lblNatureOfSign 
         BackColor       =   &H00BFD87E&
         Caption         =   "Nature of signature"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   111
         Tag             =   "9735"
         Top             =   120
         Width           =   1815
      End
      Begin VB.Label lblSingleOrJointAcc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Single/Joint A/c"
         BeginProperty Font 
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
         TabIndex        =   110
         Tag             =   "9735"
         Top             =   120
         Width           =   1695
      End
   End
   Begin VB.Frame frameAccountDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1335
      Left            =   0
      TabIndex        =   89
      Top             =   3480
      Width           =   11775
      Begin VB.ComboBox cmbOtherAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   47
         Tag             =   "11775"
         Top             =   960
         Width           =   1335
      End
      Begin VB.ComboBox cmbSavingAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   43
         Tag             =   "11775"
         Top             =   600
         Width           =   1335
      End
      Begin VB.ComboBox cmbCurrentAcStatus 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   36
         Tag             =   "11775"
         Top             =   120
         Width           =   1335
      End
      Begin VB.Frame frameOtherAccCheckBook 
         Height          =   495
         Left            =   10320
         TabIndex        =   93
         Tag             =   "11775"
         Top             =   840
         Width           =   1455
         Begin VB.OptionButton optOtherAcCheckBookYes 
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   49
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
         Begin VB.OptionButton optOtherAcCheckBookNo 
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   50
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbOtherAcStmtFreq 
         Height          =   315
         Left            =   8280
         Style           =   2  'Dropdown List
         TabIndex        =   48
         Tag             =   "11775"
         Top             =   960
         Width           =   975
      End
      Begin VB.ComboBox cmbOtherAcCurrency 
         Height          =   315
         Left            =   3360
         Style           =   2  'Dropdown List
         TabIndex        =   46
         Tag             =   "11775"
         Top             =   960
         Width           =   1455
      End
      Begin VB.ComboBox cmbOtherAccount 
         Height          =   315
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   45
         Tag             =   "11775"
         Top             =   960
         Width           =   1215
      End
      Begin VB.ComboBox cmbSavingAcStmtFreq 
         Height          =   315
         Left            =   8280
         Style           =   2  'Dropdown List
         TabIndex        =   44
         Tag             =   "11775"
         Top             =   600
         Width           =   975
      End
      Begin VB.ComboBox cmbSavingAcCurrency 
         Height          =   315
         Left            =   3360
         Style           =   2  'Dropdown List
         TabIndex        =   42
         Tag             =   "11775"
         Top             =   600
         Width           =   1455
      End
      Begin VB.Frame Frame3 
         Height          =   495
         Left            =   1200
         TabIndex        =   92
         Tag             =   "11775"
         Top             =   480
         Width           =   1455
         Begin VB.OptionButton optSavingAcYes 
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   40
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
         Begin VB.OptionButton optSavingAcNo 
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   41
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame Frame2 
         Height          =   495
         Left            =   10320
         TabIndex        =   91
         Tag             =   "11775"
         Top             =   0
         Width           =   1455
         Begin VB.OptionButton optCurrentAcCheckBookYes 
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   38
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optCurrentAcCheckBookNo 
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   39
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   120
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbCurrentAcStmtFreq 
         Height          =   315
         Left            =   8280
         Style           =   2  'Dropdown List
         TabIndex        =   37
         Top             =   120
         Width           =   975
      End
      Begin VB.ComboBox cmbCurrentAcCurrency 
         Height          =   315
         Left            =   3360
         Style           =   2  'Dropdown List
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   120
         Width           =   1455
      End
      Begin VB.Frame Frame13 
         Height          =   495
         Left            =   1200
         TabIndex        =   90
         Tag             =   "11775"
         Top             =   0
         Width           =   1455
         Begin VB.OptionButton optCurrentAcYes 
            Caption         =   "Yes"
            Height          =   195
            Left            =   120
            TabIndex        =   33
            Tag             =   "1455"
            ToolTipText     =   "Yes"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optCurrentAcNo 
            Caption         =   "No"
            Height          =   255
            Left            =   720
            TabIndex        =   34
            Tag             =   "1455"
            ToolTipText     =   "No"
            Top             =   120
            Width           =   615
         End
      End
      Begin VB.Label lblSavingAcStmtFreq 
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
         Left            =   7200
         TabIndex        =   107
         Tag             =   "11775"
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label lblOtherAcStatus 
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
         Left            =   4800
         TabIndex        =   106
         Tag             =   "11775"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label lblSavingAcStatus 
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
         Left            =   4800
         TabIndex        =   105
         Tag             =   "11775"
         Top             =   600
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
         Left            =   4800
         TabIndex        =   104
         Tag             =   "11775"
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label lblOtherAccheckBook 
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
         Left            =   9240
         TabIndex        =   103
         Tag             =   "11775"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label lblOtherAcStmtFreq 
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
         Left            =   7200
         TabIndex        =   102
         Tag             =   "11775"
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label lblOtherAccurrency 
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
         TabIndex        =   101
         Tag             =   "11775"
         Top             =   960
         Width           =   495
      End
      Begin VB.Label lblOtherAccount 
         BackColor       =   &H00BFD87E&
         Caption         =   "Other A/c"
         BeginProperty Font 
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
         TabIndex        =   100
         Tag             =   "11775"
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label lblSavingAcCurrency 
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
         TabIndex        =   99
         Tag             =   "11775"
         Top             =   600
         Width           =   495
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
         Left            =   9240
         TabIndex        =   98
         Tag             =   "11775"
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label lblSavingAcc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Saving A/c"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Top             =   600
         Width           =   1215
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
         Left            =   7200
         TabIndex        =   96
         Tag             =   "11775"
         Top             =   120
         Width           =   1095
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
         TabIndex        =   95
         Tag             =   "11775"
         Top             =   120
         Width           =   495
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
         TabIndex        =   94
         Tag             =   "11775"
         Top             =   120
         Width           =   1335
      End
   End
   Begin VB.Frame FrameCardDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   2295
      Left            =   0
      TabIndex        =   75
      Top             =   5520
      Width           =   11655
      Begin VB.Frame framePrimaryIntlCard 
         Height          =   400
         Left            =   1440
         TabIndex        =   78
         Tag             =   "11655"
         Top             =   75
         Width           =   1575
         Begin VB.OptionButton optPrimaryElectronIntlCardYes 
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   55
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
         Begin VB.OptionButton optPrimaryElectronIntlCardNo 
            Caption         =   "No"
            Height          =   255
            Left            =   840
            TabIndex        =   56
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame frameSuppIntlCard 
         Height          =   495
         Left            =   1440
         TabIndex        =   77
         Tag             =   "11655"
         Top             =   480
         Width           =   1575
         Begin VB.OptionButton optSecondaryElectronIntlCardYes 
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   58
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
         Begin VB.OptionButton optSecondaryElectronIntlCardNo 
            Caption         =   "No"
            Height          =   255
            Left            =   840
            TabIndex        =   59
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.TextBox txtPrimaryElectronIntlCardName 
         Height          =   285
         Left            =   5160
         MaxLength       =   26
         TabIndex        =   57
         Tag             =   "11655"
         Top             =   240
         Width           =   3495
      End
      Begin VB.TextBox txtSecondaryElectronIntlCardName 
         Height          =   285
         Left            =   5160
         MaxLength       =   26
         TabIndex        =   60
         Tag             =   "11655"
         Top             =   600
         Width           =   3495
      End
      Begin VB.TextBox txtDeliveryAddr1 
         Enabled         =   0   'False
         Height          =   285
         Left            =   1440
         MaxLength       =   30
         TabIndex        =   63
         Tag             =   "11655"
         Top             =   1560
         Width           =   3375
      End
      Begin VB.TextBox txtDeliveryPOBox 
         Enabled         =   0   'False
         Height          =   285
         Left            =   1440
         TabIndex        =   65
         Tag             =   "11655"
         Top             =   1920
         Width           =   1455
      End
      Begin VB.ComboBox cmbDeliveryCity 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4320
         TabIndex        =   66
         Tag             =   "11655"
         Text            =   "Riyadh"
         Top             =   1920
         Width           =   1575
      End
      Begin VB.TextBox txtDeliveryZipcode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7320
         TabIndex        =   67
         Tag             =   "11655"
         Top             =   1920
         Width           =   1095
      End
      Begin VB.TextBox txtDeliveryAddr2 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7320
         MaxLength       =   30
         TabIndex        =   64
         Tag             =   "11655"
         Top             =   1560
         Width           =   3495
      End
      Begin VB.Frame Frame10 
         Height          =   495
         Left            =   1440
         TabIndex        =   76
         Tag             =   "11655"
         Top             =   960
         Width           =   4815
         Begin VB.OptionButton optCardDeliveredToReqBranch 
            Caption         =   "Req.Branch"
            Height          =   255
            Left            =   120
            TabIndex        =   139
            Tag             =   "4815"
            ToolTipText     =   "Request Branch"
            Top             =   120
            Width           =   1815
         End
         Begin VB.OptionButton optCardDeliveredToBranch 
            Caption         =   "branch"
            Height          =   255
            Left            =   1920
            TabIndex        =   61
            Tag             =   "4815"
            ToolTipText     =   "Cust. Branch"
            Top             =   120
            Value           =   -1  'True
            Width           =   1695
         End
         Begin VB.OptionButton optCardDeliveredToPOBox 
            Caption         =   "PO Box"
            Height          =   255
            Left            =   3600
            TabIndex        =   62
            Tag             =   "4815"
            ToolTipText     =   "Mail"
            Top             =   120
            Width           =   1095
         End
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
         TabIndex        =   88
         Tag             =   "11655"
         Top             =   240
         Width           =   2175
      End
      Begin VB.Label lblSecondaryElectronIntlCard 
         BackColor       =   &H00BFD87E&
         Caption         =   "Secondary Int'l card"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Tag             =   "11655"
         Top             =   600
         Width           =   2295
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
         Left            =   3480
         TabIndex        =   86
         Tag             =   "11655"
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label lblSecondaryElectronIntlCardName 
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
         Left            =   3480
         TabIndex        =   85
         Tag             =   "11655"
         Top             =   600
         Width           =   1695
      End
      Begin VB.Label lblDeliveryAddress1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Delivery Address1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Tag             =   "11655"
         Top             =   1560
         Width           =   1935
      End
      Begin VB.Label lblDeliveryPOBox 
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
         Left            =   0
         TabIndex        =   83
         Tag             =   "11655"
         Top             =   1920
         Width           =   1815
      End
      Begin VB.Label lblDeliveryCity 
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
         Left            =   3120
         TabIndex        =   82
         Tag             =   "11655"
         Top             =   1920
         Width           =   1095
      End
      Begin VB.Label lblDeliveryZipCode 
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
         Left            =   6000
         TabIndex        =   81
         Tag             =   "11655"
         Top             =   1920
         Width           =   1335
      End
      Begin VB.Label lblDeliveryAddress2 
         BackColor       =   &H00BFD87E&
         Caption         =   "Address2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   80
         Tag             =   "11655"
         Top             =   1560
         Width           =   1455
      End
      Begin VB.Label lblCardDeliveredTo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Card delivered to"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         Tag             =   "11655"
         Top             =   1080
         Width           =   1695
      End
   End
   Begin VB.CommandButton cmdPrevPage 
      Caption         =   "Previous Page"
      Height          =   375
      Left            =   720
      TabIndex        =   68
      ToolTipText     =   "Previous Page"
      Top             =   7800
      Width           =   1575
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2400
      TabIndex        =   69
      ToolTipText     =   "Reject"
      Top             =   7800
      Width           =   1335
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "Approve"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3840
      TabIndex        =   70
      ToolTipText     =   "Approve"
      Top             =   7800
      Width           =   1455
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print Application"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5400
      TabIndex        =   71
      ToolTipText     =   "Print Application"
      Top             =   7800
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   9480
      TabIndex        =   74
      ToolTipText     =   "Cancel"
      Top             =   7800
      Width           =   1335
   End
   Begin VB.CommandButton cmdJointAcc 
      Caption         =   "Joint Account"
      Height          =   375
      Left            =   8160
      TabIndex        =   73
      ToolTipText     =   "Joint Account"
      Top             =   7800
      Width           =   1215
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Create"
      Height          =   375
      Left            =   6855
      TabIndex        =   72
      ToolTipText     =   "Create/Update"
      Top             =   7800
      Width           =   1215
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
      ForeColor       =   &H00400000&
      Height          =   255
      Left            =   0
      TabIndex        =   138
      Top             =   7920
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblUpdatedForSama 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cust.updated for SAMA"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   615
      Left            =   0
      TabIndex        =   137
      Top             =   2280
      Width           =   1935
   End
   Begin VB.Label lblRelationshipManager 
      BackColor       =   &H00BFD87E&
      Caption         =   "Relationship Manager"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   136
      Top             =   2280
      Width           =   2295
   End
   Begin VB.Label lblGeneralMemo 
      BackColor       =   &H00BFD87E&
      Caption         =   "General Memo"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   135
      Top             =   2640
      Width           =   2415
   End
   Begin VB.Label lblCustomerAdvice 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cust.Advice Flag"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      Top             =   3000
      Width           =   1575
   End
   Begin VB.Label lblInternetBank 
      BackColor       =   &H00BFD87E&
      Caption         =   "Internet Bank "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   128
      Top             =   3000
      Width           =   2775
   End
   Begin VB.Line Line6 
      X1              =   0
      X2              =   11640
      Y1              =   7680
      Y2              =   7680
   End
End
Attribute VB_Name = "frmCustomer2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmbCurrentAcCurrency_Click()
   If Len(RTrim(cmbCurrentAcCurrency.text)) <> 0 Then
      If Mid$(cmbCurrentAcCurrency.text, 1, 2) <> "01" Then
         frmCustomer2.optCurrentAcCheckBookNo.Value = True
         frmCustomer2.optCurrentAcCheckBookYes.Enabled = False
      Else
         frmCustomer2.optCurrentAcCheckBookYes.Enabled = True
      End If
   End If
End Sub

Private Sub cmbDeliveryCity_KeyPress(KeyAscii As Integer)
  If KeyAscii > 128 Then
     KeyAscii = 0
     MsgBox (errNoArabicCharacters(UserLang))
     Exit Sub
  End If
End Sub

Private Sub cmbOtherAccount_Click()
   If Mid$(cmbOtherAccount.text, 1, 3) = "160" And _
      Mid$(cmbOtherAcCurrency.text, 1, 2) = "01" Then
      frmCustomer2.optOtherAcCheckBookYes.Enabled = True
   Else
      frmCustomer2.optOtherAcCheckBookNo.Value = True
      frmCustomer2.optOtherAcCheckBookYes.Enabled = False
   End If
End Sub

Private Sub cmbOtherAcCurrency_Click()
   If Len(RTrim(frmCustomer2.cmbOtherAccount.text)) <> 0 Then
      If Mid$(frmCustomer2.cmbOtherAccount.text, 1, 3) = "160" Then
         If Len(RTrim(frmCustomer2.cmbOtherAcCurrency.text)) <> 0 Then
            If Mid$(frmCustomer2.cmbOtherAcCurrency.text, 1, 2) <> "01" Then
               frmCustomer2.optOtherAcCheckBookNo.Value = True
               frmCustomer2.optOtherAcCheckBookYes.Enabled = False
            Else
               frmCustomer2.optOtherAcCheckBookYes.Enabled = True
            End If
         End If
      End If
   End If
End Sub
Public Sub approveTpinSelect()
   frmAcceptTPin.txtCustNo = recvSuperDecisionMsg.custNo
   
   If custInfo.langPref = "0" Then
      frmAcceptTPin.txtCustName = frmCustomer.txtArabShortName
   Else
      frmAcceptTPin.txtCustName = frmCustomer.txtEngFirstName
   End If
   frmAcceptTPin.optTPinSelectedYes.Value = True
   frmAcceptTPin.tag = "A"   '  Approve Tpin
   frmAcceptTPin.Show vbModal
End Sub
Public Sub unloadSupForms()
  Dim tCustNo As String
  If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
     tCustNo = Space(7)
  Else
     tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
  End If
  Unload Me
  Unload frmCustomer
  Unload frmSupervisorApproval
  frmEnquiry.readPendingList "00000", "S", tCustNo
  frmSupervisorApproval.Show
End Sub

Public Sub bringOldFlag()
    If updateAction Or (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
       If Len(RTrim(recvSuperActionMsg.packagedAcc)) = 0 Then
          tCode = "0"
       Else
          tCode = recvSuperActionMsg.packagedAcc
       End If
    Else
       tCode = "0"
    End If
    If tCode <> "" Then
       For i = 0 To frmCustomer2.cmbPackageAcc.ListCount
           If Mid(frmCustomer2.cmbPackageAcc.List(i), 1, 1) = tCode Then
              frmCustomer2.cmbPackageAcc.ListIndex = i
              Exit For
            End If
        Next i
    Else
        frmCustomer2.cmbPackageAcc.ListIndex = -1
    End If
    If i > frmCustomer2.cmbPackageAcc.ListCount Then
        frmCustomer2.cmbPackageAcc.text = tCode & "-Not defined in local"
    End If
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
      
     If cardProductionAtBranch = True Then
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

Private Sub cmdApprove_Click()
   Dim tuserId, tSupervisorId, tDateTime, tBranchCode, tPrimaryAcc As String
   Dim mQry As String
   Dim tmpStr As String

'   If realOrPseudo = "1" Then
'      If updateBranchpower = 1 Then
'         unloadSupForms
'         Exit Sub
'      End If
'   End If
      
   frmSupervisorApproval.MSFlexGrid1.Col = 0
   tuserId = Format(frmSupervisorApproval.MSFlexGrid1.text, "!@@@@@@@@@@")
   frmSupervisorApproval.MSFlexGrid1.Col = 1
   tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
   tBranchCode = gBranchCode
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
   tpinUserId = tuserId  ' used for tpin approval
   tpinDateTime = tDateTime   ' used for tpin approval
   tpinSupervisorId = tSupervisorId    ' used for tpin approval
   
   If recvSuperActionMsg.newOrUpdate = "N" Then
      If frmCustomer2.optCurrentAcYes.Value = True Then
         tPrimaryAcc = Mid$(frmCustomer2.cmbCurrentAcCurrency, 1, 2) + "008"
      ElseIf Mid$(frmCustomer2.cmbOtherAccount.text, 1, 3) = "160" Then
         tPrimaryAcc = Mid$(frmCustomer2.cmbOtherAcCurrency.text, 1, 2) + "160"
      ElseIf frmCustomer2.optSavingAcYes.Value = True Then
         tPrimaryAcc = Mid$(frmCustomer2.cmbSavingAcCurrency.text, 1, 2) + "009"
      End If
   Else
      tPrimaryAcc = Space(5)
   End If
   
   SendMsg = "000268" + "19" + gBranchCode + "A" + tBranchCode + tuserId + tDateTime + _
             tSupervisorId + Space(200) + recvSuperActionMsg.newOrUpdate + tPrimaryAcc + frmCustomer.txtCustomerNo
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   
   frmCustomer2.MousePointer = vbHourglass
   frmCustomer2.cmdApprove.Enabled = False
   frmCustomer2.cmdReject.Enabled = False
   frmCustomer2.cmdCancel.Enabled = False
   frmCustomer2.cmdPrevPage.Enabled = False
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmCustomer2.MousePointer = vbDefault
      frmCustomer2.cmdApprove.Enabled = True
      frmCustomer2.cmdReject.Enabled = True
      frmCustomer2.cmdCancel.Enabled = True
      frmCustomer2.cmdPrevPage.Enabled = True
      unloadSupForms
      Exit Sub
   End If

   If recvSuperDecisionMsg.status = "000" Then
      frmCustomer2.MousePointer = vbDefault
      MsgBox errSuccessful(UserLang) '"transaction successfully completed..."
      If recvSuperActionMsg.newOrUpdate = "N" Then
         If UserLang = ARABIC Then
            tmpStr = "ÑÞã ÇáÚãíá" + recvSuperDecisionMsg.custNo
         Else
            tmpStr = "Customer Number Alloted is " + recvSuperDecisionMsg.custNo
         End If
         MsgBox tmpStr
         If cardProductionAtBranch = True Or pinSelectAtBranch = True Then
            If Len(RTrim(recvSuperDecisionMsg.primaryCard.cardNo)) > 0 Then
               If recvSuperDecisionMsg.primaryCard.branchPinSelect = "Y" Then
                  updateCardPrdn "P"
               ElseIf Len(RTrim(recvSuperDecisionMsg.suppCard.cardNo)) > 0 And _
                       recvSuperDecisionMsg.suppCard.branchPinSelect = "Y" Then
                   updateCardPrdn "S"
               Else
                  If realOrPseudo = "1" Then
                     updateBranchpower
                  Else
                     unloadSupForms
                  End If
               End If
            Else
               If realOrPseudo = "1" Then
                  updateBranchpower
               Else
                  unloadSupForms
               End If
            End If
         Else
            If realOrPseudo = "1" Then
               updateBranchpower
            Else
               unloadSupForms
            End If
         End If
      Else
         If realOrPseudo = "1" Then
            updateBranchpower
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
      frmCustomer2.MousePointer = vbDefault
      unloadSupForms
      Exit Sub
   End If
End Sub
   
Public Function updateBranchpower()

   frmCustomer2.MousePointer = vbHourglass
   frmCustomer.txtCustomerNo = recvSuperDecisionMsg.custNo
   formatNewCustomerRequest
   
   'now form the customer buffer to insert into BranchPower
   If openCustFile = 1 Then
      frmCustomer2.MousePointer = vbDefault
      frmCustomer2.cmdApprove.Enabled = True
      frmCustomer2.cmdReject.Enabled = True
      frmCustomer2.cmdCancel.Enabled = True
      frmCustomer2.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchpower = 1
      Exit Function
   End If
   
   If recvSuperActionMsg.newOrUpdate = "U" Then
      If readClient = 1 Then
         frmCustomer2.MousePointer = vbDefault
         frmCustomer2.cmdApprove.Enabled = True
         frmCustomer2.cmdReject.Enabled = True
         frmCustomer2.cmdCancel.Enabled = True
         frmCustomer2.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchpower = 1
         Exit Function
      End If
   End If
   
   CustBuf.recType = "02"
   CustBuf.clientNo = Format(recvSuperDecisionMsg.custNo, "!@@@@@@@@@")
   If recvSuperActionMsg.newOrUpdate = "N" Then
      If custInfo.langPref = "0" Then
         If custInfo.custType = "0" Then
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(custInfo.aShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(custInfo.aLastName, 1, 3) + Mid$(custInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = custInfo.aShortName
               CustBuf.alphacode = Format(Mid$(custInfo.aLastName, 1, 3) + Mid$(custInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
         Else
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(custInfo.aOrgShortName)
               CustBuf.alphacode = windowToAsmo(custInfo.orgAlphaSearch)
            Else
               CustBuf.shortName1 = custInfo.aOrgShortName
               CustBuf.alphacode = custInfo.orgAlphaSearch
            End If
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "0"
      Else
         If custInfo.custType = "0" Then
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(custInfo.eShortName)
               CustBuf.alphacode = windowToAsmo(Format(Mid$(custInfo.eLastName, 1, 3) + Mid$(custInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
            Else
               CustBuf.shortName1 = custInfo.eShortName
               CustBuf.alphacode = Format(Mid$(custInfo.eLastName, 1, 3) + Mid$(custInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
            End If
         Else
            If branchPowerEnv = "DOS" Then
               CustBuf.shortName1 = windowToAsmo(custInfo.eOrgShortName)
               CustBuf.alphacode = windowToAsmo(custInfo.orgAlphaSearch)
            Else
               CustBuf.shortName1 = custInfo.eOrgShortName
               CustBuf.alphacode = custInfo.orgAlphaSearch
            End If
         End If
         CustBuf.shortName2 = Space(30)
         CustBuf.langPref = "1"
      End If
      If branchPowerEnv = "DOS" Then
         CustBuf.address1 = windowToAsmo(Format(custInfo.address1, "!" + String(45, "@")))
         CustBuf.address2 = windowToAsmo(Format(Mid$(custInfo.poBox, 1, 10) + Mid$(custInfo.cityName, 1, 20) + Mid$(custInfo.zipCode, 7), "!" + String(45, "@")))
         If custInfo.custType = "0" Then
            CustBuf.address3 = windowToAsmo(Format(custInfo.idType + custInfo.idNo, "!" + String(45, "@")))
         Else
            CustBuf.address3 = windowToAsmo(Format("C" + custInfo.crNo, "!" + String(45, "@")))
         End If
      Else
         CustBuf.address1 = Format(custInfo.address1, "!" + String(45, "@"))
         CustBuf.address2 = Format(Mid$(custInfo.poBox, 1, 10) + Mid$(custInfo.cityName, 1, 20) + Mid$(custInfo.zipCode, 7), "!" + String(45, "@"))
         If custInfo.custType = "0" Then
            CustBuf.address3 = Format(custInfo.idType + custInfo.idNo, "!" + String(45, "@"))
         Else
            CustBuf.address3 = Format("C" + custInfo.crNo, "!" + String(45, "@"))
         End If
      End If
   Else
      If recvSuperDecisionMsg.nameChanged = "1" Then
         If custInfo.langPref = "0" Then
            If custInfo.custType = "0" Then
               If branchPowerEnv = "DOS" Then
                  CustBuf.shortName1 = windowToAsmo(custInfo.aShortName)
                  CustBuf.alphacode = windowToAsmo(Format(Mid$(custInfo.aLastName, 1, 3) + Mid$(custInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
               Else
                  CustBuf.shortName1 = custInfo.aShortName
                  CustBuf.alphacode = Format(Mid$(custInfo.aLastName, 1, 3) + Mid$(custInfo.aFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
               End If
            Else
               If branchPowerEnv = "DOS" Then
                  CustBuf.shortName1 = windowToAsmo(custInfo.aOrgShortName)
                  CustBuf.alphacode = windowToAsmo(custInfo.orgAlphaSearch)
               Else
                  CustBuf.shortName1 = custInfo.aOrgShortName
                  CustBuf.alphacode = custInfo.orgAlphaSearch
               End If
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "0"
         Else
            If custInfo.custType = "0" Then
               If branchPowerEnv = "DOS" Then
                  CustBuf.shortName1 = windowToAsmo(custInfo.eShortName)
                  CustBuf.alphacode = windowToAsmo(Format(Mid$(custInfo.eLastName, 1, 3) + Mid$(custInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@"))
               Else
                  CustBuf.shortName1 = custInfo.eShortName
                  CustBuf.alphacode = Format(Mid$(custInfo.eLastName, 1, 3) + Mid$(custInfo.eFirstName, 1, 3), "!@@@@@@@@@@@@@@@")
               End If
            Else
               If branchPowerEnv = "DOS" Then
                  CustBuf.shortName1 = windowToAsmo(custInfo.eOrgShortName)
                  CustBuf.alphacode = windowToAsmo(custInfo.orgAlphaSearch)
               Else
                  CustBuf.shortName1 = custInfo.eOrgShortName
                  CustBuf.alphacode = custInfo.orgAlphaSearch
               End If
            End If
            CustBuf.shortName2 = Space(30)
            CustBuf.langPref = "1"
         End If
      End If
      If recvSuperDecisionMsg.addressChanged = "1" Then
         If branchPowerEnv = "DOS" Then
            CustBuf.address1 = windowToAsmo(Format(custInfo.address1, "!" + String(45, "@")))
            CustBuf.address2 = windowToAsmo(Format(Mid$(custInfo.poBox, 1, 10) + Mid$(custInfo.cityName, 1, 20) + Mid$(custInfo.zipCode, 7), "!" + String(45, "@")))
            If custInfo.custType = "0" Then
               CustBuf.address3 = windowToAsmo(Format(custInfo.idType + custInfo.idNo, "!" + String(45, "@")))
            Else
               CustBuf.address3 = windowToAsmo(Format("C" + custInfo.crNo, "!" + String(45, "@")))
            End If
        Else
            CustBuf.address1 = Format(custInfo.address1, "!" + String(45, "@"))
            CustBuf.address2 = Format(Mid$(custInfo.poBox, 1, 10) + Mid$(custInfo.cityName, 1, 20) + Mid$(custInfo.zipCode, 7), "!" + String(45, "@"))
            If custInfo.custType = "0" Then
               CustBuf.address3 = Format(custInfo.idType + custInfo.idNo, "!" + String(45, "@"))
            Else
               CustBuf.address3 = Format("C" + custInfo.crNo, "!" + String(45, "@"))
            End If
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
   
   If recvSuperActionMsg.newOrUpdate = "N" Then
      If insertClient = 1 Then
         frmCustomer2.MousePointer = vbDefault
         frmCustomer2.cmdApprove.Enabled = True
         frmCustomer2.cmdReject.Enabled = True
         frmCustomer2.cmdCancel.Enabled = True
         frmCustomer2.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchpower = 1
         Exit Function
      End If
   Else
      If updateClient = 1 Then
         frmCustomer2.MousePointer = vbDefault
         frmCustomer2.cmdApprove.Enabled = True
         frmCustomer2.cmdReject.Enabled = True
         frmCustomer2.cmdCancel.Enabled = True
         frmCustomer2.cmdPrevPage.Enabled = True
         closeClient
         unloadSupForms
         updateBranchpower = 1
         Exit Function
      End If
   End If
   
   closeClient
   
   If recvSuperActionMsg.newOrUpdate = "U" Then
      frmCustomer2.MousePointer = vbDefault
      frmCustomer2.cmdApprove.Enabled = True
      frmCustomer2.cmdReject.Enabled = True
      frmCustomer2.cmdCancel.Enabled = True
      frmCustomer2.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchpower = 0
      Exit Function
   End If
  
   If openAcctFile = 1 Then
      frmCustomer2.MousePointer = vbDefault
      frmCustomer2.cmdApprove.Enabled = True
      frmCustomer2.cmdReject.Enabled = True
      frmCustomer2.cmdCancel.Enabled = True
      frmCustomer2.cmdPrevPage.Enabled = True
      unloadSupForms
      updateBranchpower = 1
      Exit Function
   End If
         
   If frmCustomer2.optCurrentAcYes.Value = True Then
      formatAcctInfo "008", Left$(frmCustomer2.cmbCurrentAcCurrency.text, 2), _
                     Left$(frmCustomer2.cmbCurrentAcStatus.text, 2), _
                     Left$(frmCustomer2.cmbCurrentAcStmtFreq.text, 2), _
                     IIf(frmCustomer2.optCurrentAcCheckBookYes, "0", "1"), "0", _
                     recvSuperDecisionMsg.custNo
                     
       ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " + _
                                  "'" + Mid$(AccBuf.accNo, 1, 2) + "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = rs(0)
       Else
          AccBuf.currency = "SAR"
       End If
       AccBuf.accType = Space(4)
       AccBuf.Description = Format("Current A/C", "!" + String(30, "@"))
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
       AccBuf.lastDate = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + Format(CStr(Day(Date)), "00")
       AccBuf.altAccNo = Space(20)
       AccBuf.pwProtected = "0"
       AccBuf.filler1 = Space(65)
 
       If insertAccount = 1 Then
          frmCustomer2.MousePointer = vbDefault
          frmCustomer2.cmdApprove.Enabled = True
          frmCustomer2.cmdReject.Enabled = True
          frmCustomer2.cmdCancel.Enabled = True
          frmCustomer2.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchpower = 1
          Exit Function
       End If
    End If
    
    If frmCustomer2.optSavingAcYes.Value = True Then
       formatAcctInfo "009", Left$(frmCustomer2.cmbSavingAcCurrency.text, 2), _
                      Left$(frmCustomer2.cmbSavingAcStatus.text, 2), _
                      Left$(frmCustomer2.cmbSavingAcStmtFreq.text, 2), _
                      Space(1), "0", recvSuperDecisionMsg.custNo
                     
       ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " + _
                                  "'" + Mid$(AccBuf.accNo, 1, 2) + "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = rs(0)
       Else
          AccBuf.currency = "SAR"
       End If
       AccBuf.accType = Space(4)
       AccBuf.Description = Format("savings A/C", "!" + String(30, "@"))
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
       AccBuf.lastDate = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + Format(CStr(Day(Date)), "00")
       AccBuf.altAccNo = Space(20)
       AccBuf.pwProtected = "0"
       AccBuf.filler1 = Space(100)
 
       If insertAccount = 1 Then
          frmCustomer2.MousePointer = vbDefault
          frmCustomer2.cmdApprove.Enabled = True
          frmCustomer2.cmdReject.Enabled = True
          frmCustomer2.cmdCancel.Enabled = True
          frmCustomer2.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchpower = 1
          Exit Function
       End If
    End If
    
    If frmCustomer2.cmbOtherAccount.ListIndex >= 0 And _
       Mid$(frmCustomer2.cmbOtherAccount.text, 1, 3) <> "000" Then
       formatAcctInfo Left$(frmCustomer2.cmbOtherAccount.text, 3), _
                      Left$(frmCustomer2.cmbOtherAcCurrency.text, 2), _
                      Left$(frmCustomer2.cmbOtherAcStatus.text, 2), _
                      Left$(frmCustomer2.cmbOtherAcStmtFreq.text, 2), _
                      IIf(Left$(frmCustomer2.cmbOtherAccount.text, 3) = "160", _
                      IIf(frmCustomer2.optOtherAcCheckBookYes, "0", "1"), _
                      Space(1)), "0", recvSuperDecisionMsg.custNo
                              
        ' form the acctinfo to insert into BranchPower DB
       AccBuf.recType = "02"
       AccBuf.accNo = Format(acctInfo.acctNo, "!@@@@@@@@@@@@@@@@@@@@")
       AccBuf.ledgerSubLedg = Space(4)
       Set rs = db.OpenRecordset("select isocurrcode from currencyinfo where currencycode = " + _
                                  "'" + Mid$(AccBuf.accNo, 1, 2) + "'")
       If rs.recordCount > 0 Then
          AccBuf.currency = rs(0)
       Else
          AccBuf.currency = "SAR"
       End If
       AccBuf.accType = Space(4)
       AccBuf.Description = Format("Other A/C", "!" + String(30, "@"))
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
       AccBuf.lastDate = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + Format(CStr(Day(Date)), "00")
       AccBuf.altAccNo = Space(20)
       AccBuf.pwProtected = "0"
       AccBuf.filler1 = Space(65)
 
       If insertAccount = 1 Then
          frmCustomer2.MousePointer = vbDefault
          frmCustomer2.cmdApprove.Enabled = True
          frmCustomer2.cmdReject.Enabled = True
          frmCustomer2.cmdCancel.Enabled = True
          frmCustomer2.cmdPrevPage.Enabled = True
          closeAcct
          unloadSupForms
          updateBranchpower = 1
          Exit Function
       End If
  End If
  
  closeAcct
  updateBranchpower = 0
    
  frmCustomer2.MousePointer = vbDefault
  frmCustomer2.cmdApprove.Enabled = True
  frmCustomer2.cmdReject.Enabled = True
  frmCustomer2.cmdCancel.Enabled = True
  frmCustomer2.cmdPrevPage.Enabled = True

  unloadSupForms
End Function

Private Sub cmdCancel_Click()
   Unload Me
'   frmCustomer.Show
End Sub

Private Sub cmdCreate_Click()
        
    If validatefrmCustomer2 = 1 Then
       Exit Sub
    End If
    If Len(RTrim(gDateTime)) = 0 Then
       gDateTime = getUnixDateTime
       If Trim(gDateTime) = "ERROR" Then
          gDateTime = Space(14)
          Exit Sub
       End If
    End If
    
    If frmCustomer2.optJoint.Value = True Then
       frmJointAccName.Caption = frmJointAccNameCaption(0, UserLang)
       frmJointAccName.lblJointAccNameOnCheck.Caption = frmJointAccNameCaption(1, UserLang)
       frmJointAccName.lblLine2.Caption = frmJointAccNameCaption(2, UserLang)
       frmJointAccName.lblJointAccNameOnReports.Caption = frmJointAccNameCaption(3, UserLang)
       frmJointAccName.cmdOk.Caption = frmJointAccNameCaption(4, UserLang)
       frmJointAccName.txtJointAccNameOnCheck.Enabled = True
       frmJointAccName.txtJointAccNameOnCheck1.Enabled = True
       frmJointAccName.txtJointAccNameOnReports.Enabled = True
       If tellerAction Or updateAction Then
          frmJointAccName.txtJointAccNameOnCheck = Mid$(recvSuperActionMsg.jointAccNameOnCheck, 1, 30)
          frmJointAccName.txtJointAccNameOnCheck1 = Mid$(recvSuperActionMsg.jointAccNameOnCheck, 31, 30)
          frmJointAccName.txtJointAccNameOnReports = recvSuperActionMsg.jointAccNameOnReports
       Else
          If frmCustomer.optLangEnglish.Value = True Then
             frmJointAccName.txtJointAccNameOnCheck.Alignment = 0
             frmJointAccName.txtJointAccNameOnCheck1.Alignment = 0
             frmJointAccName.txtJointAccNameOnReports.Alignment = 0
             frmJointAccName.txtJointAccNameOnCheck = _
                                frmCustomer.txtEngFirstName + _
                                " " + frmCustomer.txtEnglish2ndName + _
                                " " + frmCustomer.txtEnglish3rdName + _
                                " " + frmCustomer.txtEngLastName
             If Len(frmJointAccName.txtJointAccNameOnCheck) > 27 Then
                frmJointAccName.txtJointAccNameOnCheck = _
                                frmCustomer.txtEngFirstName + _
                                " " + frmCustomer.txtEnglish2ndName + _
                                " " + frmCustomer.txtEnglish3rdName
                If Len(frmJointAccName.txtJointAccNameOnCheck) > 28 Then
                   frmJointAccName.txtJointAccNameOnCheck = _
                                frmCustomer.txtEngFirstName + _
                                " " + frmCustomer.txtEnglish2ndName
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmCustomer.txtEnglish3rdName + _
                                " " + frmCustomer.txtEngLastName
                Else
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmCustomer.txtEngLastName
                End If
            End If
            frmJointAccName.txtJointAccNameOnReports = frmCustomer.txtEngFirstName + " " + frmCustomer.txtEngLastName
        Else
            frmJointAccName.txtJointAccNameOnCheck.Alignment = 1
            frmJointAccName.txtJointAccNameOnCheck1.Alignment = 1
            frmJointAccName.txtJointAccNameOnReports.Alignment = 1
            frmJointAccName.txtJointAccNameOnCheck = _
                                frmCustomer.txtArabFirstName + _
                                " " + frmCustomer.txtArabic2ndName + _
                                " " + frmCustomer.txtArabic3rdName + _
                                " " + frmCustomer.txtArabLastName
             If Len(frmJointAccName.txtJointAccNameOnCheck) > 27 Then
                frmJointAccName.txtJointAccNameOnCheck = _
                                frmCustomer.txtArabFirstName + _
                                " " + frmCustomer.txtArabic2ndName + _
                                " " + frmCustomer.txtArabic3rdName
                If Len(frmJointAccName.txtJointAccNameOnCheck) > 28 Then
                   frmJointAccName.txtJointAccNameOnCheck = _
                                frmCustomer.txtArabFirstName + _
                                " " + frmCustomer.txtArabic2ndName
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmCustomer.txtArabic3rdName + _
                                " " + frmCustomer.txtArabLastName
                Else
                   frmJointAccName.txtJointAccNameOnCheck1 = _
                                frmCustomer.txtArabLastName
                End If
             End If
             frmJointAccName.txtJointAccNameOnReports = frmCustomer.txtArabFirstName + " " + frmCustomer.txtArabLastName
         End If
      End If
      frmJointAccName.Show vbModal
    Else
       frmJointAccName.txtJointAccNameOnCheck = Space(30)
       frmJointAccName.txtJointAccNameOnCheck1 = Space(30)
       frmJointAccName.txtJointAccNameOnReports = Space(30)
       If updateAction = True Or tellerAction = True Then
          If checkAddressChange = True Then
             frmCardAddress.Show
             frmCardAddress.txtDeliveryAddr1 = custInfo.address1
             frmCardAddress.txtDeliveryAddr2 = "(*)" + IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") + _
                                              IIf(Mid$(frmCustomer.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") + _
                                              "BR.CODE:" + Right$(gBranchCode, 3)
             frmCardAddress.txtDeliveryPOBox = custInfo.poBox
             frmCardAddress.cmbDeliveryCity = custInfo.cityName
             frmCardAddress.txtDeliveryZipcode = custInfo.zipCode
          Else
             custInfo.updateCardAddressReqd = "0"
             createCustomer
          End If
       Else
           createCustomer
       End If
    End If
    
 End Sub

Private Sub cmdJointAcc_Click()

   Dim tCode, tuserId, tDateTime, tBranchCode As String
     
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If validatefrmCustomer2 = 1 Then
         Exit Sub
      End If
      If Len(RTrim(gDateTime)) = 0 Then
         gDateTime = getUnixDateTime
         If Trim(gDateTime) = "ERROR" Then
            gDateTime = Space(14)
            Exit Sub
         End If
      End If
      If frmCustomer2.optSingle.Value = True Then
         MsgBox errNotAJointAccount(UserLang) ' "This account is not a joint account..."
         Exit Sub
      End If
      If Not tellerAction And Not updateAction Then
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
      End If
   End If
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      frmCustomer2.MousePointer = vbHourglass
      CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
      frmCustomer3.Hide
      frmCustomer3.fetchNextJointInfo Space(2)
      frmCustomer2.MousePointer = vbDefault
      CSD_mdiForm.staticStatus.Panels(3).text = " "
      If recvJointInfo.status <> "000" Then
         Exit Sub
      End If
   End If
   
   frmCustomer3.Caption = frmCustomer3Caption(0, UserLang)
   frmCustomer3.lblIdType.Caption = frmCustomer3Caption(1, UserLang)
   frmCustomer3.lblIdNumber.Caption = frmCustomer3Caption(2, UserLang)
   frmCustomer3.lblIdIssuedAt.Caption = frmCustomer3Caption(3, UserLang)
   frmCustomer3.lblIdDateType.Caption = frmCustomer3Caption(4, UserLang)
   frmCustomer3.optIdDateHijri.Caption = frmCustomer3Caption(5, UserLang)
   frmCustomer3.optIdDateGregorian.Caption = frmCustomer3Caption(6, UserLang)
   frmCustomer3.lblIdIssueDate.Caption = frmCustomer3Caption(7, UserLang)
   frmCustomer3.lblIdExpiryDate.Caption = frmCustomer3Caption(8, UserLang)
   frmCustomer3.lblLangPref.Caption = frmCustomer3Caption(9, UserLang)
   frmCustomer3.optLangArabic.Caption = frmCustomer3Caption(10, UserLang)
   frmCustomer3.optLangEnglish.Caption = frmCustomer3Caption(11, UserLang)
   frmCustomer3.lblNationality.Caption = frmCustomer3Caption(12, UserLang)
   frmCustomer3.lblTitleCode.Caption = frmCustomer3Caption(13, UserLang)
   frmCustomer3.lblFirstName.Caption = frmCustomer3Caption(14, UserLang)
   frmCustomer3.lbl2ndName.Caption = frmCustomer3Caption(15, UserLang)
   frmCustomer3.lbl3rdName.Caption = frmCustomer3Caption(16, UserLang)
   frmCustomer3.lblLastName.Caption = frmCustomer3Caption(17, UserLang)
   frmCustomer3.lblArabicName.Caption = frmCustomer3Caption(18, UserLang)
   frmCustomer3.lblArabicShortName.Caption = frmCustomer3Caption(19, UserLang)
   frmCustomer3.lblEnglishName.Caption = frmCustomer3Caption(20, UserLang)
'   frmCustomer3.lblEnglishShortName.Caption = frmCustomer3Caption(21, UserLang)
   frmCustomer3.lblDOBDateType.Caption = frmCustomer3Caption(22, UserLang)
   frmCustomer3.optDOBHijri.Caption = frmCustomer3Caption(5, UserLang)
   frmCustomer3.optDOBGreg.Caption = frmCustomer3Caption(6, UserLang)
   frmCustomer3.lblDateOfBirth.Caption = frmCustomer3Caption(23, UserLang)
   frmCustomer3.lblGender.Caption = frmCustomer3Caption(24, UserLang)
   frmCustomer3.optGenderMale.Caption = frmCustomer3Caption(25, UserLang)
   frmCustomer3.optGenderFemale.Caption = frmCustomer3Caption(26, UserLang)
   frmCustomer3.lblMaritalStatus.Caption = frmCustomer3Caption(27, UserLang)
   frmCustomer3.optMarried.Caption = frmCustomer3Caption(28, UserLang)
   frmCustomer3.optSingle.Caption = frmCustomer3Caption(29, UserLang)
   frmCustomer3.optOthers.Caption = frmCustomer3Caption(30, UserLang)
   frmCustomer3.lblDependents.Caption = frmCustomer3Caption(31, UserLang)
   frmCustomer3.frameResidentStatus.Caption = frmCustomer3Caption(32, UserLang)
   frmCustomer3.optResident.Caption = frmCustomer3Caption(33, UserLang)
   frmCustomer3.optNonResident.Caption = frmCustomer3Caption(34, UserLang)
   frmCustomer3.lblBusinessType.Caption = frmCustomer3Caption(35, UserLang)
   frmCustomer3.lblAddress1.Caption = frmCustomer3Caption(36, UserLang)
'   frmCustomer3.lblAddress2.Caption = frmCustomer3Caption(37, UserLang)
   frmCustomer3.lblPOBox.Caption = frmCustomer3Caption(38, UserLang)
   frmCustomer3.lblCity.Caption = frmCustomer3Caption(39, UserLang)
   frmCustomer3.lblZipCode.Caption = frmCustomer3Caption(40, UserLang)
   frmCustomer3.lblCountry.Caption = frmCustomer3Caption(41, UserLang)
   frmCustomer3.lblOffPhone.Caption = frmCustomer3Caption(42, UserLang)
   frmCustomer3.lblResPhone.Caption = frmCustomer3Caption(43, UserLang)
   frmCustomer3.lblFax.Caption = frmCustomer3Caption(44, UserLang)
   frmCustomer3.lblMobileNo.Caption = frmCustomer3Caption(45, UserLang)
   frmCustomer3.lblPager.Caption = frmCustomer3Caption(46, UserLang)
   frmCustomer3.lblEmailAddress.Caption = frmCustomer3Caption(47, UserLang)
   frmCustomer3.lblEducation.Caption = frmCustomer3Caption(48, UserLang)
   frmCustomer3.lblProfession.Caption = frmCustomer3Caption(49, UserLang)
   frmCustomer3.lblPosition.Caption = frmCustomer3Caption(50, UserLang)
   frmCustomer3.lblMonthlyIncome.Caption = frmCustomer3Caption(51, UserLang)
   frmCustomer3.lblOwnership.Caption = frmCustomer3Caption(52, UserLang)
   frmCustomer3.chkRentHome.Caption = frmCustomer3Caption(53, UserLang)
   frmCustomer3.chkOwnHouse.Caption = frmCustomer3Caption(54, UserLang)
   frmCustomer3.chkCompanyAccomodation.Caption = frmCustomer3Caption(55, UserLang)
   frmCustomer3.chkRentCar.Caption = frmCustomer3Caption(56, UserLang)
   frmCustomer3.chkOwnCar.Caption = frmCustomer3Caption(57, UserLang)
   frmCustomer3.chkCompanyTrans.Caption = frmCustomer3Caption(58, UserLang)
   frmCustomer3.lblEmployerName.Caption = frmCustomer3Caption(59, UserLang)
   frmCustomer3.lblDepartment.Caption = frmCustomer3Caption(60, UserLang)
   frmCustomer3.lblEmployerPoBox.Caption = frmCustomer3Caption(61, UserLang)
   frmCustomer3.lblEmployerCity.Caption = frmCustomer3Caption(62, UserLang)
   frmCustomer3.lblEmployerZipCode.Caption = frmCustomer3Caption(63, UserLang)
   frmCustomer3.cmdNextJoint.Caption = frmCustomer3Caption(64, UserLang)
   frmCustomer3.cmdDone.Caption = frmCustomer3Caption(65, UserLang)
   frmCustomer3.cmdCancel.Caption = frmCustomer3Caption(66, UserLang)
   frmCustomer3.lblSegmentation.Caption = frmCustomer3Caption(67, UserLang)
   frmCustomer3.optVipYes.Caption = frmCustomer3Caption(68, UserLang)
   frmCustomer3.optVipNo.Caption = frmCustomer3Caption(69, UserLang)
   
   frmCustomer3.Show
End Sub

Private Sub cmdPrevPage_Click()
    Me.Hide
'    frmCustomer.Show
End Sub

Private Sub cmdReject_Click()
   frmSupervisorRejection.Show 1
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim tCode, mQry As String
   
   If InStr(recvLoginMsg.authorityLevel, "~02") > 0 And _
      supervisorAction Then
      frmCustomer2.cmdApprove.Enabled = True
      frmCustomer2.cmdReject.Enabled = True
      frmCustomer2.cmdCreate.Enabled = False
   End If
   If InStr(recvLoginMsg.authorityLevel, "~01") <> 0 Then
      frmCustomer2.cmdCreate.Enabled = True
   Else
      frmCustomer2.cmdCreate.Enabled = False
   End If
   
   If custHistoryAction Then
      frmCustomer2.lblHistory.Visible = True
      frmCustomer2.lblHistory.Refresh
   Else
      frmCustomer2.lblHistory.Visible = False
   End If
   
   If supervisorAction Or searchAction Or custHistoryAction Then
      frmCustomer2.cmdCreate.Enabled = False
      frmCustomer2.FrameCustomerDetail2.Enabled = False
      frmCustomer2.frameDocuments.Enabled = False
      frmCustomer2.framePackagedAcc.Enabled = False
      frmCustomer2.FrameInternetFlag.Enabled = False
      frmCustomer2.frameCustomerAdvice.Enabled = False
      frmCustomer2.frameAccountDetails.Enabled = False
      frmCustomer2.frameSingleJoint.Enabled = False
      frmCustomer2.FrameCardDetails.Enabled = False
      frmCustomer2.FrameUpdateForSama.Enabled = False
      frmCustomer2.txtRelationshipManager.Enabled = False
      frmCustomer2.txtGeneralMemo.Enabled = False
   Else
      frmCustomer2.FrameCustomerDetail2.Enabled = True
      frmCustomer2.frameDocuments.Enabled = True
      frmCustomer2.FrameInternetFlag.Enabled = True
      frmCustomer2.frameCustomerAdvice.Enabled = True
      frmCustomer2.frameSingleJoint.Enabled = True
      frmCustomer2.FrameUpdateForSama.Enabled = True
      frmCustomer2.txtRelationshipManager.Enabled = True
      frmCustomer2.txtGeneralMemo.Enabled = True
      'If gBranchCode = "0499" Then
      If InStr(recvLoginMsg.authorityLevel, "~7") > 0 Then 'And updateAction Or _
                               (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
         frmCustomer2.framePackagedAcc.Enabled = True
      Else
         frmCustomer2.framePackagedAcc.Enabled = False
      End If
      If updateAction Then
         frmCustomer2.frameAccountDetails.Enabled = False
         frmCustomer2.FrameCardDetails.Enabled = False
         frmCustomer2.frameAcSingleJoint.Enabled = False
      Else
         If tellerAction And _
            recvSuperActionMsg.newOrUpdate = "U" Then
'            'If gBranchCode = "0499" Then
'            If InStr(recvLoginMsg.AuthorityLevel, "~7") > 0 Then  'And updateAction Or _
'                                 (tellerAction And recvSuperActionMsg.newOrUpdate = "U") Then
'               frmCustomer2.framePackagedAcc.Enabled = True
'            End If
            frmCustomer2.frameAccountDetails.Enabled = False
            frmCustomer2.FrameCardDetails.Enabled = False
            frmCustomer2.frameAcSingleJoint.Enabled = False
         Else
            frmCustomer2.frameAccountDetails.Enabled = True
            If Mid$(frmCustomer.cmbCustomerType, 1, 1) <> "0" Then
               frmCustomer2.FrameCardDetails.Enabled = False
            Else
               frmCustomer2.FrameCardDetails.Enabled = True  ' disabled in ver 1.3 and enabled in 2.0
            End If
         End If
         If tellerAction And recvSuperActionMsg.newOrUpdate = "N" Then
            If Mid$(frmCustomer.cmbCustomerType, 1, 1) <> "0" Then
               frmCustomer2.FrameCardDetails.Enabled = False
            Else
               frmCustomer2.FrameCardDetails.Enabled = True
               frmCustomer2.framePrimaryIntlCard.Enabled = False
               frmCustomer2.frameSuppIntlCard.Enabled = False
            End If
         End If
      End If
   End If
  
   If UserLang = ARABIC Then
      ChangePositions frmCustomer2, 11800
      frmCustomer2.Hide
      frmCustomer2.RightToLeft = True
   End If
     
   mQry = "select * from cityinfo"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbDeliveryCity.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbDeliveryCity.AddItem rs("englishname")
          Else
             frmCustomer2.cmbDeliveryCity.AddItem rs("englishname")
          End If
          rs.MoveNext
       Loop
   End If
   
   Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmCustomer.cmbBranchCode, 1, 4) + "'")

   If frmCustomer2.optCardDeliveredToBranch = True Then
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & rs(0)
         txtDeliveryAddr2 = "(*)" & IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") & _
                             IIf(Mid$(frmCustomer.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                             "BR.CODE:" & Mid$(frmCustomer.cmbBranchCode, 2, 3)
         txtDeliveryPOBox = rs(2)
         txtDeliveryZipcode = rs(3)

         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                     " where citycode = '" & tCode & "'")

         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = rs(0)
         Else
            cmbDeliveryCity.text = " "
         End If
       End If
   End If
   
   Set rs = db.OpenRecordset("select citycode from branchinfo " & _
               " where branchcode = '" & gBranchCode & "'")
   If rs.recordCount > 0 Then
      tCode = rs(0)
      Set rs = db.OpenRecordset("select englishname,arabicname,telareacode from cityinfo " & _
                    " where citycode = '" & tCode & "'")
      If rs.recordCount > 0 Then
         If UserLang = ENGLISH Then
            cmbDeliveryCity.text = rs(0)
         Else
            cmbDeliveryCity.text = rs(0)
         End If
      Else
         frmCustomer2.cmbDeliveryCity.text = ""
      End If
  End If

  Set rs = db.OpenRecordset("select * from segmentationinfo")
  If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbSegmentation.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbSegmentation.AddItem Right(rs("segmentationcode"), 1) & "-" & rs("englishname")
         Else
            cmbSegmentation.AddItem Right(rs("segmentationcode"), 1) & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If

  Set rs = db.OpenRecordset("select * from packageaccinfo")
  If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbPackageAcc.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbPackageAcc.AddItem Right(rs("packagetypecode"), 1) & "-" & rs("englishname")
         Else
            cmbPackageAcc.AddItem Right(rs("packagetypecode"), 1) & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
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
'      cmbProfession.ListIndex = 0
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
'      cmbMonthlyIncome.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from currencyinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcCurrency.Clear
      cmbSavingAcCurrency.Clear
      cmbOtherAcCurrency.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbCurrentAcCurrency.AddItem rs("currencycode") & " - " & rs("arabicname")
            cmbSavingAcCurrency.AddItem rs("currencycode") & " - " & rs("arabicname")
            cmbOtherAcCurrency.AddItem rs("currencycode") & " - " & rs("arabicname")
         Else
            cmbCurrentAcCurrency.AddItem rs("currencycode") & " - " & rs("englishname")
            cmbSavingAcCurrency.AddItem rs("currencycode") & " - " & rs("englishname")
            cmbOtherAcCurrency.AddItem rs("currencycode") & " - " & rs("englishname")
         End If
         rs.MoveNext
      Loop
      cmbCurrentAcCurrency.ListIndex = 0
      cmbSavingAcCurrency.ListIndex = 0
      cmbOtherAcCurrency.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from accountstatusinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcStatus.Clear
      cmbSavingAcStatus.Clear
      cmbOtherAcStatus.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbCurrentAcStatus.AddItem rs("statuscode") & " - " & rs("englishname")
            cmbSavingAcStatus.AddItem rs("statuscode") & " - " & rs("englishname")
            cmbOtherAcStatus.AddItem rs("statuscode") & " - " & rs("englishname")
         Else
            cmbCurrentAcStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
            cmbSavingAcStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
            cmbOtherAcStatus.AddItem rs("statuscode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
      Loop
      cmbCurrentAcStatus.ListIndex = 0
      cmbSavingAcStatus.ListIndex = 0
      cmbOtherAcStatus.ListIndex = 0
   End If
   
   Set rs = db.OpenRecordset("select * from statementfrequencyinfo")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbCurrentAcStmtFreq.Clear
      cmbSavingAcStmtFreq.Clear
      cmbOtherAcStmtFreq.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbCurrentAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("englishname")
            cmbSavingAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("englishname")
            cmbOtherAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("englishname")
         Else
            cmbCurrentAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("arabicname")
            cmbSavingAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("arabicname")
            cmbOtherAcStmtFreq.AddItem rs("frequencycode") & " - " & rs("arabicname")
         End If
         rs.MoveNext
     Loop
   End If
   If rs.recordCount > 3 Then
      cmbCurrentAcStmtFreq.ListIndex = 3
      cmbSavingAcStmtFreq.ListIndex = 3
      cmbOtherAcStmtFreq.ListIndex = 3
   End If
   
   Set rs = db.OpenRecordset("select * from bmledgerinfo where accCreationAllowed = '1'")
   If rs.recordCount > 0 Then
      rs.MoveFirst
      cmbOtherAccount.Clear
      Do While Not rs.EOF
         If UserLang = ARABIC Then
            cmbOtherAccount.AddItem rs("ledgercode") & "-" & rs("arabicname")
         Else
            cmbOtherAccount.AddItem rs("ledgercode") & "-" & rs("englishname")
         End If
         rs.MoveNext
      Loop
   End If
   
   If supervisorAction Or tellerAction Or searchAction Or updateAction Or custHistoryAction Then
      fillFrmCustomer2
   End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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

Private Sub FrameCustomerDetail2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameDocuments_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameSingleJoint_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optCardDeliveredToBranch_Click()
   Dim tCode As String
   
   txtDeliveryAddr1.Enabled = False
   txtDeliveryPOBox.Enabled = False
   cmbDeliveryCity.Enabled = False
   txtDeliveryZipcode.Enabled = False
   
   If Not updateAction And Not supervisorAction And _
          optCardDeliveredToBranch.Value = True Then
      FrameCardDetails.Enabled = True
      
      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmCustomer.cmbBranchCode, 1, 4) & "'")
   
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & rs(0)
         txtDeliveryAddr2 = "(*)" & IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmCustomer.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmCustomer.cmbBranchCode, 2, 3)
         txtDeliveryPOBox = rs(2)
         txtDeliveryZipcode = rs(3)
      
         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                       " where citycode = '" & tCode & "'")
                        
         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = rs(0)
         Else
            cmbDeliveryCity.text = " "
         End If
       End If
   End If
End Sub

Private Sub optCardDeliveredToPOBox_Click()
   
   txtDeliveryAddr1.Enabled = True
   txtDeliveryPOBox.Enabled = True
   cmbDeliveryCity.Enabled = True
   txtDeliveryZipcode.Enabled = True
   txtDeliveryAddr2 = "   " & IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmCustomer.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmCustomer.cmbBranchCode, 2, 3)
   txtDeliveryPOBox = frmCustomer.txtPOBox
   txtDeliveryZipcode = frmCustomer.txtPinCode

   If frmCustomer.optLangEnglish.Value = True Then
      txtDeliveryAddr1 = frmCustomer.txtAddress1
      If arabicCharFound(frmCustomer.cmbCity) Then
         Set rs = db.OpenRecordset("select englishname from cityinfo where arabicname = '" & _
                             frmCustomer.cmbCity.text & "'")
         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = rs(0)
         Else
            cmbDeliveryCity.text = " "
         End If
      Else
         cmbDeliveryCity.text = frmCustomer.cmbCity.text
      End If
   Else
      txtDeliveryAddr1 = " "
      cmbDeliveryCity.text = " "
   End If
End Sub

Private Sub optCardDeliveredToReqBranch_Click()
    Dim tCode As String
   
   txtDeliveryAddr1.Enabled = False
   txtDeliveryPOBox.Enabled = False
   cmbDeliveryCity.Enabled = False
   txtDeliveryZipcode.Enabled = False
   
   If Not updateAction And Not supervisorAction And _
          optCardDeliveredToReqBranch.Value = True Then
      FrameCardDetails.Enabled = True
      
      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & gBranchCode & "'")
   
      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & rs(0)
         txtDeliveryAddr2 = "(*)" & IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmCustomer.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(gBranchCode, 2, 3)
         txtDeliveryPOBox = rs(2)
         txtDeliveryZipcode = rs(3)
      
         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                       " where citycode = '" & tCode & "'")
                        
         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = rs(0)
         Else
            cmbDeliveryCity.text = " "
         End If
       End If
   End If
End Sub

Private Sub optCurrentAcNo_Click()
'   optPrimaryElectronCardNo.Value = True
'   txtPrimaryElectronCardName = ""
'   optSecondaryElectronCardNo.Value = True
'   txtSecondaryElectronCardName = ""
   optPrimaryElectronIntlCardNo.Value = True
   txtPrimaryElectronIntlCardName = ""
   optSecondaryElectronIntlCardNo.Value = True
   txtSecondaryElectronIntlCardName = ""
   txtDeliveryAddr1 = ""
   txtDeliveryAddr2 = ""
   txtDeliveryPOBox = ""
   txtDeliveryZipcode = ""
   FrameCardDetails.Enabled = False
End Sub
  
Private Sub optCurrentAcYes_Click()
   Dim tCode As String
   
   If Not updateAction And Not supervisorAction And _
          optCardDeliveredToBranch.Value = True Then
      FrameCardDetails.Enabled = True  'disabled in ver 1.3 and enabled in ver 2.0

'      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
'               " where branchcode = '" & gBranchCode & "'")

      Set rs = db.OpenRecordset("select englishname,citycode,pobox,zipcode from branchinfo " & _
               " where branchcode = '" & Mid$(frmCustomer.cmbBranchCode, 1, 4) & "'")


      If rs.recordCount > 0 Then
         txtDeliveryAddr1 = "BRANCH:" & rs(0)
         txtDeliveryAddr2 = "(*)" & IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") & _
                               IIf(Mid$(frmCustomer.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                               "BR.CODE:" & Mid$(frmCustomer.cmbBranchCode, 2, 3)
         txtDeliveryPOBox = rs(2)
         txtDeliveryZipcode = rs(3)

         tCode = rs(1)
         Set rs = db.OpenRecordset("select englishname from cityinfo " & _
                       " where citycode = '" & tCode & "'")

         If rs.recordCount > 0 Then
            cmbDeliveryCity.text = rs(0)
         Else
            cmbDeliveryCity.text = " "
         End If
       End If
   End If
   
End Sub

Private Sub optJoint_Click()
  If optJoint.Value = True Then
     cmdJointAcc.Enabled = True
  End If
End Sub

Private Sub optOtherAcCheckBookYes_Click()
   If Mid$(cmbOtherAccount, 1, 3) <> "160" Then
      MsgBox errNoChequeBook(UserLang) '"Cheque Book is allowed only for Account 160"
      optOtherAcCheckBookNo.Value = True
   End If
End Sub

Private Sub optPrimaryElectronIntlCardNo_Click()
   txtPrimaryElectronIntlCardName = ""
   If optSecondaryElectronIntlCardYes.Value = True Then
      optSecondaryElectronIntlCardNo.Value = True
      txtSecondaryElectronIntlCardName = ""
  End If
End Sub

Private Sub optPrimaryElectronIntlCardYes_Click()
   txtPrimaryElectronIntlCardName = UCase(frmCustomer.txtEngFirstName & " " & frmCustomer.txtEnglish2ndName & " " & frmCustomer.txtEngLastName)
   If Len(txtPrimaryElectronIntlCardName) > 26 Then
      txtPrimaryElectronIntlCardName = UCase(frmCustomer.txtEngFirstName)
   End If
End Sub

Private Sub optSecondaryElectronIntlCardYes_Click()
  If optPrimaryElectronIntlCardNo.Value = True Then
     MsgBox errNoPrimaryCard(UserLang)
     optSecondaryElectronIntlCardNo.Value = True
  End If
End Sub

Private Sub OptSingle_Click()
  If optSingle.Value = True Then
     cmdJointAcc.Enabled = False
  End If
End Sub

Public Function checkAddressChange() As Boolean
    formatNewCustomerRequest
    If Trim(custInfo.address1) <> Trim(recvSuperActionMsg.address1) Or _
       Trim(custInfo.address2) <> Trim(recvSuperActionMsg.address2) Or _
       Trim(custInfo.poBox) <> Trim(recvSuperActionMsg.poBox) Or _
       Trim(custInfo.cityName) <> Trim(recvSuperActionMsg.cityName) Or _
       Trim(custInfo.zipCode) <> Trim(recvSuperActionMsg.zipCode) Then
       checkAddressChange = True
    Else
        checkAddressChange = False
    End If
End Function

Public Sub createCustomer1()
    
    atmPin = Space(4)
    atmPin2 = Space(4)
    If Not (updateAction Or recvSuperActionMsg.newOrUpdate = "U") Then
       If pinSelectAtBranch = True Then
          If frmCustomer2.optPrimaryElectronIntlCardYes = True Then
             frmAcceptPin.tag = "P" ' primary card
             frmAcceptPin.txtCardType = "Primary"
             frmAcceptPin.txtNameOnTheCard = frmCustomer2.txtPrimaryElectronIntlCardName
             frmAcceptPin.Show vbModal
             frmAcceptPin.txtPinNo.SetFocus
          Else
             'customerCreateWithCard
          End If
       Else
          'customerCreateWithCard
       End If
    Else
       'customerCreateWithCard
    End If
End Sub

Public Sub createCustomer()
    Dim strmsglen
   
    formatNewCustomerRequest
    currentAccInfo = Space(12)
    savingAccInfo = Space(12)
    otherAccInfo = Space(12)
    If frmCustomer2.optCurrentAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvSuperActionMsg.currentAccInfo)) = 0 Then
             formatCurrentAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatCurrentAcc "0", "U"
          End If
       Else
          formatCurrentAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvSuperActionMsg.currentAccInfo)) <> 0 Then
          formatCurrentAcc "1", "U"
       End If
    End If
    
    If frmCustomer2.optSavingAcYes.Value = True Then
       If tellerAction Then
          If Len(RTrim(recvSuperActionMsg.savingsAccInfo)) = 0 Then
             formatSavingAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatSavingAcc "0", "U"
          End If
       Else
          formatSavingAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvSuperActionMsg.savingsAccInfo)) <> 0 Then
          formatSavingAcc "1", "U"
       End If
    End If
    
    If frmCustomer2.cmbOtherAccount.ListIndex >= 0 And _
       Mid$(frmCustomer2.cmbOtherAccount.text, 1, 3) <> "000" Then
       If tellerAction Then
          If Len(RTrim(recvSuperActionMsg.otherAccInfo)) = 0 Then
             formatOtherAcc "0", "C" ' 0 is for "Not dropped"
          Else
             formatOtherAcc "0", "U"
          End If
       Else
          formatOtherAcc "0", "C"
       End If
    Else
       If tellerAction And _
          Len(RTrim(recvSuperActionMsg.otherAccInfo)) <> 0 Then
          formatOtherAcc "1", "U"
       End If
    End If

    SendMsg = custInfo.msgLen + custInfo.service + gBranchCode + custInfo.userId + custInfo.branchCode + custInfo.dateTime + _
              custInfo.creationOrUpdate + custInfo.NewOrUpdateFlag + _
              custInfo.bmUpdateStatus + custInfo.customerNo + custInfo.supervisorId + custInfo.custBranchCode + custInfo.idNo + custInfo.idType + _
              custInfo.idIssuedAt + custInfo.idDateType + custInfo.idIssueDateH + custInfo.idIssueDateG + custInfo.idExpiryDateH + custInfo.idExpiryDateG + _
              custInfo.langPref + custInfo.nationality + Mid$(custInfo.titleCode, 1, 2) + custInfo.dobDateType + custInfo.dobDateH + custInfo.dobDateG + _
              custInfo.sexCode + custInfo.vipCode + custInfo.maritalStatus + custInfo.noOfDependents + custInfo.residentStatus + Mid$(custInfo.businessType, 1, 3) + " " + custInfo.crNo + _
              custInfo.crIssuedAt + custInfo.crIssuedDateType + custInfo.crIssueDateH + custInfo.crIssueDateG + custInfo.aOrgName1 + custInfo.aOrgName2 + custInfo.aOrgShortName + _
              custInfo.eOrgName1 + custInfo.eOrgName2 + custInfo.eOrgShortName + custInfo.aFirstName + custInfo.a2ndName + custInfo.a3rdName + custInfo.aLastName + _
              custInfo.aShortName + custInfo.eFirstName + custInfo.e2ndName + custInfo.e3rdName + custInfo.eLastName + custInfo.eShortName + custInfo.address1 + custInfo.address2 + _
              custInfo.poBox + custInfo.cityName + custInfo.zipCode + custInfo.country + custInfo.telOffAreaCode + custInfo.telOffNo + custInfo.telOffExt + _
              custInfo.telHomeAreaCode + custInfo.telHomeNo + custInfo.telHomeExt + custInfo.faxAreaCode + custInfo.faxNo + custInfo.faxExt + custInfo.mobileNo + custInfo.pagerNo + custInfo.eMail + _
              custInfo.educationCode + custInfo.professionCode + custInfo.positionCode + custInfo.monthlyIncome + custInfo.segmentation + custInfo.ownerShip + custInfo.employerName + custInfo.department + _
              custInfo.employerPoBox + custInfo.employerCity + custInfo.employerZipCode + custInfo.documents + custInfo.documentOther + custInfo.singleJointAcc + custInfo.packagedAcc + custInfo.noOfJointAcc + _
              custInfo.jointAccNameOnCheck + custInfo.jointAccNameOnReports + custInfo.signatureNature + custInfo.electronCardRequired + custInfo.electronCardName + custInfo.elctronSuppRequired + _
              custInfo.electronSuppName + custInfo.electronIntlRequired + custInfo.electronIntlName + custInfo.electronIntlSuppRequired + custInfo.electronIntlSuppName + custInfo.deliveryToBranchOrPO + custInfo.deliveryAddress1 + custInfo.deliveryAddress2 + custInfo.deliveryPoBox + custInfo.deliveryCity + _
              custInfo.deliveryZip + custInfo.supervisorComments + custInfo.custType + custInfo.updateCardAddressReqd + custInfo.internetBankAcc + custInfo.custAdviceFlag + custInfo.altBranchCode + _
              custInfo.phaseFlag + custInfo.orgAlphaSearch + currentAccInfo + savingAccInfo + otherAccInfo + custInfo.updatedForSama + _
              custInfo.relationshipManager + custInfo.generalMemo + Space(50)
           
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCustomer2.MousePointer = vbHourglass
    frmCustomer2.cmdCreate.Enabled = False
    frmCustomer2.cmdJointAcc.Enabled = False
    frmCustomer2.cmdCancel.Enabled = False
    frmCustomer2.cmdPrevPage.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmCustomer2.cmdCreate.Enabled = True
       frmCustomer2.cmdCancel.Enabled = True
       If frmCustomer2.optJoint = True Then
          frmCustomer2.cmdJointAcc.Enabled = True
       End If
       frmCustomer2.cmdPrevPage.Enabled = True
       frmCustomer2.MousePointer = vbDefault
       Exit Sub
    End If
    frmCustomer2.MousePointer = vbDefault
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
       If custInfo.NewOrUpdateFlag = "N" And custInfo.creationOrUpdate = "C" Then
          gCustNo = recvCustomerMsg.custNo
          frmCustomer.txtCustomerNo = recvCustomerMsg.custNo
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
       unloadForms
       Exit Sub
    End If
    
    If updateAction Or (tellerAction And custInfo.NewOrUpdateFlag = "U") Then
       unloadForms
       Exit Sub
    End If
    
    frmCustomer2.MousePointer = vbHourglass
    
    If custInfo.NewOrUpdateFlag = "N" And custInfo.creationOrUpdate = "C" Then
       If pinSelectAtBranch = True Then
          atmPin = Space(4)
          atmPin2 = Space(4)
          If frmCustomer2.optPrimaryElectronIntlCardYes = True Then
             frmAcceptPin.tag = "P" ' primary card
             frmAcceptPin.txtCardType = "Primary"
             frmAcceptPin.txtNameOnTheCard = frmCustomer2.txtPrimaryElectronIntlCardName
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
Public Sub formatCurrentAcc(droppedFlag As String, creationOrUpdate As String)

currentAccInfo = "008" & Left$(frmCustomer2.cmbCurrentAcCurrency.text, 2) & _
                      Left$(frmCustomer2.cmbCurrentAcStatus.text, 2) & _
                      Left$(frmCustomer2.cmbCurrentAcStmtFreq.text, 2) & _
                      IIf(frmCustomer2.optCurrentAcCheckBookYes, "1", "0") & droppedFlag & _
                      creationOrUpdate

End Sub
Public Sub formatSavingAcc(droppedFlag As String, creationOrUpdate As String)

savingAccInfo = "009" & Left$(frmCustomer2.cmbSavingAcCurrency.text, 2) & _
                      Left$(frmCustomer2.cmbSavingAcStatus.text, 2) & _
                      Left$(frmCustomer2.cmbSavingAcStmtFreq.text, 2) & _
                      " " & droppedFlag & creationOrUpdate

End Sub
Public Sub formatOtherAcc(droppedFlag As String, creationOrUpdate As String)
   Dim otherAcc As String

If droppedFlag = "1" Then
   otherAcc = Mid$(recvSuperActionMsg.otherAccInfo, 3, 3)
Else
   otherAcc = Left$(frmCustomer2.cmbOtherAccount.text, 3)
End If
   
otherAccInfo = otherAcc & Left$(frmCustomer2.cmbOtherAcCurrency.text, 2) & _
               Left$(frmCustomer2.cmbOtherAcStatus.text, 2) & _
               Left$(frmCustomer2.cmbOtherAcStmtFreq.text, 2) & _
               IIf(Left$(frmCustomer2.cmbOtherAccount.text, 3) = "160", _
               IIf(frmCustomer2.optOtherAcCheckBookYes, "1", "0"), Space(1)) & _
               droppedFlag & creationOrUpdate
End Sub
Public Sub acceptTpin()
   frmAcceptTPin.txtCustNo = gCustNo
   
   If custInfo.langPref = "0" Then
      frmAcceptTPin.txtCustName = frmCustomer.txtArabShortName
   Else
      frmAcceptTPin.txtCustName = frmCustomer.txtEngShortName
   End If
   frmAcceptTPin.tag = "C"
   frmAcceptTPin.Show vbModal
End Sub
Public Sub unloadForms()
   Dim tCustNo As String
   If Len(Trim(frmSupervisorApproval.txtCustomerNo)) = 0 Then
      tCustNo = Space(7)
   Else
      tCustNo = Format(frmSupervisorApproval.txtCustomerNo, "0000000")
   End If
   frmCustomer2.MousePointer = vbDefault
   frmCustomer2.cmdCreate.Enabled = True
   If frmCustomer2.optJoint = True Then
      frmCustomer2.cmdJointAcc.Enabled = True
   End If
   frmCustomer2.cmdCancel.Enabled = True
   frmCustomer2.cmdPrevPage.Enabled = True
   Unload Me
   Unload frmCustomer3
   Unload frmCustomer2
   Unload frmCustomer
   If tellerAction = True Then
      Unload frmSupervisorApproval
      frmEnquiry.readPendingList "00000", "T", tCustNo
      frmSupervisorApproval.Show
   Else
      Unload frmEnquirySelect
'      frmEnquiry.Show
   End If
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub
Private Sub txtDeliveryAddr1_KeyPress(KeyAscii As Integer)
  If KeyAscii > 128 Then
     KeyAscii = 0
     MsgBox (errNoArabicCharacters(UserLang))
     Exit Sub
  End If
End Sub

Private Sub txtDeliveryAddr2_KeyPress(KeyAscii As Integer)
  If KeyAscii > 128 Then
     KeyAscii = 0
     MsgBox (errNoArabicCharacters(UserLang))
     Exit Sub
  End If
End Sub

Private Sub txtDeliveryPOBox_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtDeliveryZipcode_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtPrimaryElectronIntlCardName_GotFocus()
  If optPrimaryElectronIntlCardYes.Value = True Then
     txtPrimaryElectronIntlCardName = UCase(frmCustomer.txtEngFirstName + " " + frmCustomer.txtEnglish2ndName + " " + frmCustomer.txtEngLastName)
     If Len(txtPrimaryElectronIntlCardName) > 26 Then
        txtPrimaryElectronIntlCardName = UCase(frmCustomer.txtEngFirstName)
     End If
  End If
End Sub

Private Sub txtPrimaryElectronIntlCardName_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
      KeyAscii = 0
      MsgBox (errNoArabicCharacters(UserLang))
      Exit Sub
   End If
End Sub

Private Sub txtPrimaryElectronIntlCardName_LostFocus()
   txtPrimaryElectronIntlCardName = UCase(txtPrimaryElectronIntlCardName)
End Sub

Private Sub txtSecondaryElectronIntlCardName_KeyPress(KeyAscii As Integer)
   If KeyAscii > 128 Then
      KeyAscii = 0
      MsgBox (errNoArabicCharacters(UserLang))
      Exit Sub
   End If
End Sub

Private Sub txtSecondaryElectronIntlCardName_LostFocus()
   txtSecondaryElectronIntlCardName = UCase(txtSecondaryElectronIntlCardName)
End Sub
