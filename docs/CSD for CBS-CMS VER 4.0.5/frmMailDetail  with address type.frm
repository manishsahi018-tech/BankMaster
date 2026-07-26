VERSION 5.00
Begin VB.Form frmMailDetail 
   Appearance      =   0  'Flat
   BackColor       =   &H00BFD87E&
   Caption         =   "Information about the mail"
   ClientHeight    =   4755
   ClientLeft      =   1710
   ClientTop       =   1875
   ClientWidth     =   9975
   ControlBox      =   0   'False
   DrawWidth       =   5
   FillColor       =   &H00BFD87E&
   FillStyle       =   0  'Solid
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4755
   ScaleWidth      =   9975
   WindowState     =   2  'Maximized
   Begin VB.Frame frameAddressType 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   2040
      TabIndex        =   102
      Tag             =   "11775"
      Top             =   1680
      Width           =   1935
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
         TabIndex        =   104
         Tag             =   "2310"
         ToolTipText     =   "PO Box"
         Top             =   30
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
         TabIndex        =   103
         Tag             =   "2310"
         ToolTipText     =   "Saudi Post"
         Top             =   60
         Width           =   915
      End
   End
   Begin VB.CommandButton cmdCustomerEnq 
      Caption         =   "Enquiry on Customer "
      Height          =   405
      Left            =   4080
      TabIndex        =   101
      ToolTipText     =   "Enquiry on Customer"
      Top             =   7920
      Width           =   1425
   End
   Begin VB.TextBox txtPrevOcc 
      Enabled         =   0   'False
      Height          =   285
      Left            =   9000
      TabIndex        =   99
      Top             =   2040
      Width           =   735
   End
   Begin VB.ComboBox cmbReturnedReason 
      Enabled         =   0   'False
      Height          =   315
      ItemData        =   "frmMailDetail.frx":0000
      Left            =   6960
      List            =   "frmMailDetail.frx":0019
      TabIndex        =   95
      Top             =   600
      Width           =   2640
   End
   Begin VB.CommandButton cmdReport 
      Caption         =   "Generate Returned mail report"
      Height          =   405
      Left            =   1920
      TabIndex        =   94
      ToolTipText     =   "Generate Returned mail report"
      Top             =   7920
      Width           =   2025
   End
   Begin VB.ComboBox cmbSegmentType 
      Enabled         =   0   'False
      Height          =   315
      Left            =   9480
      TabIndex        =   63
      Top             =   1320
      Width           =   2295
   End
   Begin VB.Frame frameContactInfo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Contact Information"
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
      Height          =   975
      Left            =   360
      TabIndex        =   48
      Top             =   2400
      Width           =   11415
      Begin VB.TextBox txtEmailAddr 
         Height          =   285
         Left            =   4680
         TabIndex        =   57
         Tag             =   "11415"
         Top             =   600
         Width           =   3375
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   960
         TabIndex        =   55
         Tag             =   "11415"
         Top             =   600
         Width           =   2295
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   8160
         TabIndex        =   53
         Tag             =   "11415"
         Top             =   240
         Width           =   2295
      End
      Begin VB.TextBox txtHomeTelNo 
         Height          =   285
         Left            =   4680
         TabIndex        =   51
         Tag             =   "11415"
         Top             =   240
         Width           =   2415
      End
      Begin VB.TextBox txtOfficeTelNo 
         Height          =   285
         Left            =   960
         TabIndex        =   49
         Tag             =   "11415"
         Top             =   240
         Width           =   2295
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
         Left            =   3360
         TabIndex        =   58
         Tag             =   "11415"
         Top             =   600
         Width           =   1335
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
         Left            =   240
         TabIndex        =   56
         Tag             =   "11415"
         Top             =   600
         Width           =   615
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
         Left            =   7200
         TabIndex        =   54
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblHomePhoneNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Home"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   52
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblOfficeTel 
         BackColor       =   &H00BFD87E&
         Caption         =   "Office"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   50
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.TextBox txtDespatchYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   7920
      MaxLength       =   4
      TabIndex        =   39
      Top             =   120
      Width           =   615
   End
   Begin VB.ComboBox cmbDespathMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   7320
      TabIndex        =   38
      Text            =   "01"
      Top             =   120
      Width           =   615
   End
   Begin VB.ComboBox cmbDespatchDate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   6720
      TabIndex        =   37
      Text            =   "01"
      Top             =   120
      Width           =   615
   End
   Begin VB.TextBox txtBranchCode 
      Enabled         =   0   'False
      Height          =   285
      Left            =   9960
      MaxLength       =   30
      TabIndex        =   36
      Top             =   120
      Width           =   975
   End
   Begin VB.CommandButton cmdBranchAction 
      Caption         =   "Branch Actions"
      Height          =   405
      Left            =   8880
      TabIndex        =   35
      ToolTipText     =   "Branch Actions pending List"
      Top             =   7920
      Width           =   1545
   End
   Begin VB.CommandButton cmdCallCentreAction 
      Caption         =   "Call Centre Action"
      Height          =   405
      Left            =   7200
      TabIndex        =   34
      ToolTipText     =   "Call Centre actions pending List"
      Top             =   7920
      Width           =   1545
   End
   Begin VB.CommandButton cmdRegister 
      Caption         =   "Register Return mail"
      Enabled         =   0   'False
      Height          =   405
      Left            =   120
      TabIndex        =   33
      ToolTipText     =   "Register Return mail"
      Top             =   7920
      Width           =   1665
   End
   Begin VB.CommandButton cmdMandateAction 
      Caption         =   "Mandate Action"
      Height          =   405
      Left            =   5640
      TabIndex        =   32
      ToolTipText     =   "Mandate Action Pending List"
      Top             =   7920
      Width           =   1425
   End
   Begin VB.TextBox txtMailType 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6600
      MaxLength       =   30
      TabIndex        =   30
      Top             =   960
      Width           =   2175
   End
   Begin VB.TextBox txtProductId 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2040
      MaxLength       =   30
      TabIndex        =   29
      Top             =   960
      Width           =   3015
   End
   Begin VB.TextBox txtCustomerName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5160
      MaxLength       =   30
      TabIndex        =   28
      Top             =   1320
      Width           =   3015
   End
   Begin VB.Frame frameBranchActions 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Actions"
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
      Height          =   1455
      Left            =   360
      TabIndex        =   27
      Top             =   6360
      Width           =   11415
      Begin VB.ComboBox cmbBranchStatus 
         Height          =   315
         ItemData        =   "frmMailDetail.frx":009C
         Left            =   1320
         List            =   "frmMailDetail.frx":00AC
         TabIndex        =   98
         Tag             =   "11415"
         Top             =   240
         Width           =   2880
      End
      Begin VB.TextBox txtBranchBrCode 
         Height          =   285
         Left            =   10080
         MaxLength       =   30
         TabIndex        =   89
         Tag             =   "11415"
         Top             =   240
         Width           =   1095
      End
      Begin VB.TextBox txtBranchActionUser 
         Height          =   285
         Left            =   7800
         TabIndex        =   88
         Tag             =   "11415"
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtBranchActionYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   6360
         MaxLength       =   4
         TabIndex        =   87
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbBranchActionMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   5760
         TabIndex        =   86
         Tag             =   "11415"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbBranchActionDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   5160
         TabIndex        =   85
         Tag             =   "11415"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.Frame frameDeliveredToCust 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   255
         Left            =   2040
         TabIndex        =   59
         Tag             =   "11415"
         Top             =   600
         Width           =   1815
         Begin VB.OptionButton optDeliveredToCustNO 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            BeginProperty Font 
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
            Left            =   960
            TabIndex        =   61
            Tag             =   "1815"
            ToolTipText     =   "No"
            Top             =   0
            Width           =   615
         End
         Begin VB.OptionButton optDeliveredToCustYES 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            BeginProperty Font 
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
            TabIndex        =   60
            Tag             =   "1815"
            ToolTipText     =   "Yes"
            Top             =   0
            Value           =   -1  'True
            Width           =   735
         End
      End
      Begin VB.TextBox txtBranchRemarks 
         Height          =   285
         Left            =   1320
         MaxLength       =   75
         TabIndex        =   46
         Tag             =   "11415"
         Top             =   960
         Width           =   8535
      End
      Begin VB.Label lblBranchBrCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Br.Code"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   9120
         TabIndex        =   93
         Tag             =   "11415"
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblBranchActionUser 
         BackColor       =   &H00BFD87E&
         Caption         =   "User"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   92
         Tag             =   "11415"
         Top             =   240
         Width           =   495
      End
      Begin VB.Label lblBranchActionDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Date"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4560
         TabIndex        =   91
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblBranchStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Status"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   90
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblDeliveredToCust 
         BackColor       =   &H00BFD87E&
         Caption         =   "Delivered to Customer"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   62
         Tag             =   "11415"
         Top             =   600
         Width           =   1935
      End
      Begin VB.Label lblBranchRemarks 
         BackColor       =   &H00BFD87E&
         Caption         =   "Remarks"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   47
         Tag             =   "11415"
         Top             =   960
         Width           =   975
      End
   End
   Begin VB.Frame frameCallCentreActions 
      BackColor       =   &H00BFD87E&
      Caption         =   "Call centre actions"
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
      Height          =   975
      Left            =   360
      TabIndex        =   26
      Top             =   5280
      Width           =   11415
      Begin VB.ComboBox cmbCallCentreStatus 
         Height          =   315
         ItemData        =   "frmMailDetail.frx":00FB
         Left            =   1320
         List            =   "frmMailDetail.frx":010B
         TabIndex        =   97
         Tag             =   "11415"
         Top             =   240
         Width           =   2880
      End
      Begin VB.TextBox txtCallCentreBrCode 
         Height          =   285
         Left            =   10080
         MaxLength       =   30
         TabIndex        =   71
         Tag             =   "11415"
         Top             =   240
         Width           =   1095
      End
      Begin VB.TextBox txtCallCentreActionUser 
         Height          =   285
         Left            =   7800
         TabIndex        =   70
         Tag             =   "11415"
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtCallCentreActionYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   6360
         MaxLength       =   4
         TabIndex        =   69
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbCallCentreActionMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   5760
         TabIndex        =   68
         Tag             =   "11415"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbCallCentreActionDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   5160
         TabIndex        =   67
         Tag             =   "11415"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtCallCentreRemarks 
         Height          =   285
         Left            =   1320
         MaxLength       =   75
         TabIndex        =   44
         Tag             =   "11415"
         Top             =   600
         Width           =   8535
      End
      Begin VB.Label lblCallCentreBrCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Br.Code"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   9120
         TabIndex        =   75
         Tag             =   "11415"
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblCallCentreActionUser 
         BackColor       =   &H00BFD87E&
         Caption         =   "User"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   74
         Tag             =   "11415"
         Top             =   240
         Width           =   495
      End
      Begin VB.Label lblCallCentreActionDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Date"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4560
         TabIndex        =   73
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblCallCentreStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Status"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   72
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblCallCentreRemarks 
         BackColor       =   &H00BFD87E&
         Caption         =   "Remarks"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   45
         Tag             =   "11415"
         Top             =   600
         Width           =   975
      End
   End
   Begin VB.Frame frameAddrVerificationActions 
      BackColor       =   &H00BFD87E&
      Caption         =   "Address verification actions"
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
      Height          =   975
      Left            =   360
      TabIndex        =   25
      Top             =   4200
      Width           =   11415
      Begin VB.ComboBox cmbMandateStatus 
         Height          =   315
         ItemData        =   "frmMailDetail.frx":015E
         Left            =   1320
         List            =   "frmMailDetail.frx":016B
         TabIndex        =   96
         Tag             =   "11415"
         Top             =   240
         Width           =   2880
      End
      Begin VB.ComboBox cmbMandateActionDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   5160
         TabIndex        =   80
         Tag             =   "11415"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbMandateActionMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   5760
         TabIndex        =   79
         Tag             =   "11415"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtMandateActionYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   6360
         MaxLength       =   4
         TabIndex        =   78
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtMandateUser 
         Height          =   285
         Left            =   7800
         TabIndex        =   77
         Tag             =   "11415"
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtMandateBrCode 
         Height          =   285
         Left            =   9960
         MaxLength       =   30
         TabIndex        =   76
         Tag             =   "11415"
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtAddrVerifyRemarks 
         Height          =   285
         Left            =   1320
         MaxLength       =   75
         TabIndex        =   42
         Tag             =   "11415"
         Top             =   600
         Width           =   8535
      End
      Begin VB.Label lblMandateActionDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Date"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4560
         TabIndex        =   84
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblMandateActionUser 
         BackColor       =   &H00BFD87E&
         Caption         =   "User"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   83
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblMandateBrCode 
         BackColor       =   &H00BFD87E&
         Caption         =   "Br.Code"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   9120
         TabIndex        =   82
         Tag             =   "11415"
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblMandateStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Status"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   81
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblMandateRemarks 
         BackColor       =   &H00BFD87E&
         Caption         =   "Remarks"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   43
         Tag             =   "11415"
         Top             =   600
         Width           =   975
      End
   End
   Begin VB.Frame frameReturnedInfo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Returned Info"
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
      Height          =   615
      Left            =   360
      TabIndex        =   16
      Top             =   3480
      Width           =   9495
      Begin VB.TextBox txtRegisteredBranch 
         Height          =   285
         Left            =   8160
         MaxLength       =   30
         TabIndex        =   23
         Tag             =   "9495"
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox txtRegisteredUser 
         Height          =   285
         Left            =   5160
         TabIndex        =   21
         Tag             =   "9495"
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtReturnYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2760
         MaxLength       =   4
         TabIndex        =   19
         Tag             =   "9495"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbReturnMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   2160
         TabIndex        =   18
         Tag             =   "9495"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbReturnDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   1560
         TabIndex        =   17
         Tag             =   "9495"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblRegBranch 
         BackColor       =   &H00BFD87E&
         Caption         =   "Reg.Branch Code"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   24
         Tag             =   "9495"
         Top             =   240
         Width           =   1575
      End
      Begin VB.Label lblRegUser 
         BackColor       =   &H00BFD87E&
         Caption         =   "User Registered"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   22
         Tag             =   "9495"
         Top             =   240
         Width           =   1455
      End
      Begin VB.Label lblReturnedDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Return Date"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   20
         Tag             =   "9495"
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.TextBox txtCustNo 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   1
      EndProperty
      Enabled         =   0   'False
      Height          =   285
      Left            =   2040
      TabIndex        =   13
      Top             =   1320
      Width           =   1575
   End
   Begin VB.CommandButton cmdGetDetails 
      Caption         =   "Get Details"
      Default         =   -1  'True
      Height          =   285
      Left            =   3960
      TabIndex        =   11
      ToolTipText     =   "Get Details"
      Top             =   600
      Width           =   1185
   End
   Begin VB.TextBox txtZipCode 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5760
      TabIndex        =   6
      Top             =   2040
      Width           =   1575
   End
   Begin VB.ComboBox cmbCity 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2040
      TabIndex        =   5
      Top             =   2040
      Width           =   2295
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
      Enabled         =   0   'False
      Height          =   285
      Left            =   9480
      TabIndex        =   4
      Top             =   1680
      Width           =   1575
   End
   Begin VB.TextBox txtAddress1 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5160
      MaxLength       =   30
      TabIndex        =   3
      Top             =   1680
      Width           =   2895
   End
   Begin VB.TextBox txtRefNo 
      Height          =   285
      Left            =   2040
      MaxLength       =   30
      TabIndex        =   2
      Top             =   600
      Width           =   1815
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   405
      Left            =   10560
      TabIndex        =   0
      ToolTipText     =   "Exit"
      Top             =   7920
      Width           =   1305
   End
   Begin VB.Label lblUnit 
      BackColor       =   &H00BFD87E&
      Caption         =   "Unit "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   106
      Top             =   1680
      Visible         =   0   'False
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
      Left            =   360
      TabIndex        =   105
      Tag             =   "11775"
      Top             =   1680
      Width           =   1335
   End
   Begin VB.Label lblPrevOccurance 
      BackColor       =   &H00BFD87E&
      Caption         =   "Prev. Occurance"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   100
      Top             =   2040
      Width           =   1455
   End
   Begin VB.Label lblMailEnq 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Information about mail"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   360
      Left            =   360
      TabIndex        =   66
      Top             =   120
      Width           =   3450
   End
   Begin VB.Label lblReturnedReason 
      BackColor       =   &H00BFD87E&
      Caption         =   "Returned Reason"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   5280
      TabIndex        =   65
      Top             =   600
      Width           =   1575
   End
   Begin VB.Label lblSegmentType 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Segment Type"
      BeginProperty Font 
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
      Left            =   8160
      TabIndex        =   64
      Top             =   1365
      Width           =   1230
   End
   Begin VB.Label lblDateDespatched 
      BackColor       =   &H00BFD87E&
      Caption         =   " Date Desp"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   5280
      TabIndex        =   41
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   40
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblMailType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Mail Type"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   5400
      TabIndex        =   31
      Top             =   960
      Width           =   1095
   End
   Begin VB.Label lblProductId 
      BackColor       =   &H00BFD87E&
      Caption         =   "Product Number"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   15
      Tag             =   "11775"
      Top             =   960
      Width           =   1455
   End
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer No."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   14
      Tag             =   "11775"
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
      TabIndex        =   12
      Top             =   1320
      Width           =   1455
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
      Left            =   4440
      TabIndex        =   10
      Top             =   2040
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
      Left            =   345
      TabIndex        =   9
      Tag             =   "11775"
      Top             =   2040
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
      Left            =   8160
      TabIndex        =   8
      Top             =   1680
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
      Left            =   4080
      TabIndex        =   7
      Tag             =   "11775"
      Top             =   1680
      Width           =   975
   End
   Begin VB.Label lblRefNo 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Reference Number"
      BeginProperty Font 
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
      TabIndex        =   1
      Tag             =   "11775"
      Top             =   600
      Width           =   1605
   End
End
Attribute VB_Name = "frmMailDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdBranchAction_Click()
   Unload Me
   Unload frmReturnMailPendingList
   frmReturnMailPendingList.tag = "B"
   frmReturnMailPendingList.Caption = frmReturnedMailPendingListCaption(3, UserLang) '"List of pending returned mails-Branch "
   frmReturnMailPendingList.lblPendingReturnMails = frmReturnedMailPendingListCaption(3, UserLang) '"List of pending returned mails-Branch "
   frmReturnMailPendingList.lblCustomerNo.Visible = True
   frmReturnMailPendingList.lblCustomerNo.Refresh
   frmReturnMailPendingList.txtCustomerNo.Visible = True
   frmReturnMailPendingList.txtCustomerNo.Refresh
   frmReturnMailPendingList.cmdCheckPendingMails.Visible = True
   frmReturnMailPendingList.cmdCheckPendingMails.Refresh
   frmReturnMailPendingList.readRetMailPendingList "00000", "B", Space(7)
   frmReturnMailPendingList.fillRetMailPendingListForm
   frmReturnMailPendingList.Show
End Sub

Private Sub cmdCallCentreAction_Click()
   Unload Me
   Unload frmReturnMailPendingList
   frmReturnMailPendingList.tag = "C"
   frmReturnMailPendingList.Caption = frmReturnedMailPendingListCaption(2, UserLang) '"List of pending returned mails-Call centre"
   frmReturnMailPendingList.lblPendingReturnMails = frmReturnedMailPendingListCaption(2, UserLang) '"List of pending returned mails-Call centre"
   frmReturnMailPendingList.lblCustomerNo.Visible = False
   frmReturnMailPendingList.txtCustomerNo.Visible = False
   frmReturnMailPendingList.cmdCheckPendingMails.Visible = False
   frmReturnMailPendingList.readRetMailPendingList "00000", "C", Space(7)
   frmReturnMailPendingList.fillRetMailPendingListForm
   frmReturnMailPendingList.Show
End Sub

Private Sub cmdCustomerEnq_Click()
   Dim tCustNo As String
   Unload frmReturnMailPendingList
   frmReturnMailPendingList.tag = "S" ' specific customer enquiry
   frmReturnMailPendingList.Caption = frmReturnedMailPendingListCaption(4, UserLang)
   frmReturnMailPendingList.lblPendingReturnMails = frmReturnedMailPendingListCaption(4, UserLang)
   frmReturnMailPendingList.lblCustomerNo.Visible = True
   frmReturnMailPendingList.lblCustomerNo.Refresh
   frmReturnMailPendingList.txtCustomerNo.Visible = True
   frmReturnMailPendingList.txtCustomerNo.Refresh
   frmReturnMailPendingList.cmdCheckPendingMails.Visible = True
   frmReturnMailPendingList.cmdCheckPendingMails.Refresh
   If Len(Trim(txtCustNo)) > 0 Then
      tCustNo = Format(txtCustNo, "0000000")
      frmReturnMailPendingList.txtCustomerNo = tCustNo
      frmReturnMailPendingList.readRetMailPendingList "00000", "S", tCustNo
      frmReturnMailPendingList.fillRetMailPendingListForm
   Else
      frmReturnMailPendingList.txtCustomerNo.SetFocus
   End If
   frmReturnMailPendingList.Show
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdGetDetails_Click()
    Dim tRefNo As String
    Dim strmsglen As String
    
    If Len(RTrim(txtRefNo)) = 0 Then
       MsgBox errSpaceRefNo(UserLang) '"Reference number cannot be spaces...Please check"
       txtRefNo.SetFocus
       Exit Sub
    End If
    
    tRefNo = UCase(Format(txtRefNo, "!" & String(16, "@")))

    SendMsg = "000090" & "AB" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tRefNo & "0" & Space(7) & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmMailDetail.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmMailDetail.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    frmMailDetail.MousePointer = vbNormal
    parseMailDetailResponse
    
    If recvMailDetailMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvMailDetailMsg.aRemarks
       Else
          MsgBox recvMailDetailMsg.eRemarks
       End If
       Exit Sub
    End If
    
    fillMailDetailForm
    
    If recvMailDetailMsg.returnedDate = Space(8) Then
       If recvLoginMsg.mailCentreBranch = "1" Then
          cmdRegister.Enabled = True
          cmbReturnedReason.Enabled = True
       Else
          cmdRegister.Enabled = False
          cmbReturnedReason.Enabled = False
       End If
    Else
       cmdRegister.Enabled = False
       cmbReturnedReason.Enabled = False
    End If

End Sub

Private Sub cmdMandateAction_Click()
   Unload Me
   Unload frmReturnMailPendingList
   frmReturnMailPendingList.tag = "M"
   frmReturnMailPendingList.Caption = frmReturnedMailPendingListCaption(1, UserLang) '"List of pending returned mails-Mandate Branch"
   frmReturnMailPendingList.lblPendingReturnMails = frmReturnedMailPendingListCaption(1, UserLang) '"List of pending returned mails-Mandate Branch"
   frmReturnMailPendingList.lblCustomerNo.Visible = False
   frmReturnMailPendingList.txtCustomerNo.Visible = False
   frmReturnMailPendingList.cmdCheckPendingMails.Visible = False
   frmReturnMailPendingList.readRetMailPendingList "00000", "M", Space(7)
   frmReturnMailPendingList.fillRetMailPendingListForm
   frmReturnMailPendingList.Show
End Sub

Private Sub cmdRegister_Click()
   Dim tRefNo As String
    Dim strmsglen As String
    
    If Len(RTrim(txtRefNo)) = 0 Then
       MsgBox errSpaceRefNo(UserLang) '"Reference number cannot be spaces...Please check"
       txtRefNo.SetFocus
       Exit Sub
    End If
    
    tRefNo = Format(txtRefNo, "!" & String(16, "@"))
    
    If Len(Trim(cmbReturnedReason)) = 0 Then
       MsgBox errSpaceReturnedReason(UserLang)  '"Returned reason must be entered...Please re-enter and try again ..."
       cmbReturnedReason.SetFocus
       Exit Sub
    End If
    
    SendMsg = "000090" & "AB" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tRefNo & "1" & Space(7) & Mid$(cmbReturnedReason, 1, 1) & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmMailDetail.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmMailDetail.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    frmMailDetail.MousePointer = vbNormal
    parseMailDetailResponse
    
    If recvMailDetailMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvMailDetailMsg.aRemarks
       Else
          MsgBox recvMailDetailMsg.eRemarks
       End If
       Exit Sub
    Else
       MsgBox errReturnMailRegisterSuccessful(UserLang)
    End If
    
    Unload Me

End Sub

Private Sub cmdReport_Click()
    frmReturnedMailReport.cmbReportDate = Mid$(recvLoginMsg.currentDateG, 7, 2)
    frmReturnedMailReport.cmbReportMonth = Mid$(recvLoginMsg.currentDateG, 5, 2)
    frmReturnedMailReport.txtReportYear = Mid$(recvLoginMsg.currentDateG, 1, 4)
    frmReturnedMailReport.Show vbModal
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    
    If UserLang = ARABIC Then
       ChangePositions frmMailDetail, 11800
       frmMailDetail.RightToLeft = True
       frmMailDetail.frameAddrVerificationActions.RightToLeft = True
       frmMailDetail.frameBranchActions.RightToLeft = True
       frmMailDetail.frameCallCentreActions.RightToLeft = True
       frmMailDetail.frameContactInfo.RightToLeft = True
       frmMailDetail.frameReturnedInfo.RightToLeft = True
    End If
    
    frmMailDetail.Caption = frmMailDetailCaption(0, UserLang)
    frmMailDetail.lblMailEnq.Caption = frmMailDetailCaption(0, UserLang)
    frmMailDetail.lblDateDespatched.Caption = frmMailDetailCaption(1, UserLang)
    frmMailDetail.lblBranchCode.Caption = frmMailDetailCaption(2, UserLang)
    frmMailDetail.lblRefNo.Caption = frmMailDetailCaption(3, UserLang)
    frmMailDetail.cmdGetDetails.Caption = frmMailDetailCaption(4, UserLang)
    frmMailDetail.lblReturnedReason.Caption = frmMailDetailCaption(5, UserLang)
    frmMailDetail.lblProductId.Caption = frmMailDetailCaption(6, UserLang)
    frmMailDetail.lblMailType.Caption = frmMailDetailCaption(7, UserLang)
    frmMailDetail.lblCustNo.Caption = frmMailDetailCaption(8, UserLang)
    frmMailDetail.lblCustName.Caption = frmMailDetailCaption(9, UserLang)
    frmMailDetail.lblSegmentType.Caption = frmMailDetailCaption(10, UserLang)
    frmMailDetail.lblAddress1.Caption = frmMailDetailCaption(11, UserLang)
    frmMailDetail.lblPOBox.Caption = frmMailDetailCaption(12, UserLang)
    frmMailDetail.lblCity.Caption = frmMailDetailCaption(13, UserLang)
    frmMailDetail.lblZipCode.Caption = frmMailDetailCaption(14, UserLang)
    frmMailDetail.lblPrevOccurance.Caption = frmMailDetailCaption(15, UserLang)
    frmMailDetail.frameContactInfo.Caption = frmMailDetailCaption(16, UserLang)
    frmMailDetail.lblOfficeTel.Caption = frmMailDetailCaption(17, UserLang)
    frmMailDetail.lblHomePhoneNo.Caption = frmMailDetailCaption(18, UserLang)
    frmMailDetail.lblMobileNo.Caption = frmMailDetailCaption(19, UserLang)
    frmMailDetail.lblFax.Caption = frmMailDetailCaption(20, UserLang)
    frmMailDetail.lblEmail.Caption = frmMailDetailCaption(21, UserLang)
    frmMailDetail.frameReturnedInfo.Caption = frmMailDetailCaption(22, UserLang)
    frmMailDetail.lblReturnedDate.Caption = frmMailDetailCaption(23, UserLang)
    frmMailDetail.lblRegUser.Caption = frmMailDetailCaption(24, UserLang)
    frmMailDetail.lblRegBranch.Caption = frmMailDetailCaption(25, UserLang)
    frmMailDetail.frameAddrVerificationActions.Caption = frmMailDetailCaption(26, UserLang)
    
    frmMailDetail.lblMandateStatus.Caption = frmMailDetailCaption(27, UserLang)
    frmMailDetail.lblMandateActionDate.Caption = frmMailDetailCaption(28, UserLang)
    frmMailDetail.lblMandateActionUser.Caption = frmMailDetailCaption(29, UserLang)
    frmMailDetail.lblMandateBrCode.Caption = frmMailDetailCaption(30, UserLang)
    frmMailDetail.lblMandateRemarks.Caption = frmMailDetailCaption(31, UserLang)
    
    frmMailDetail.frameCallCentreActions.Caption = frmMailDetailCaption(32, UserLang)
    
    frmMailDetail.lblCallCentreStatus.Caption = frmMailDetailCaption(27, UserLang)
    frmMailDetail.lblCallCentreActionDate.Caption = frmMailDetailCaption(28, UserLang)
    frmMailDetail.lblCallCentreActionUser.Caption = frmMailDetailCaption(29, UserLang)
    frmMailDetail.lblCallCentreBrCode.Caption = frmMailDetailCaption(30, UserLang)
    frmMailDetail.lblCallCentreRemarks.Caption = frmMailDetailCaption(31, UserLang)
    
    frmMailDetail.frameBranchActions.Caption = frmMailDetailCaption(33, UserLang)
    
    frmMailDetail.lblBranchStatus.Caption = frmMailDetailCaption(27, UserLang)
    frmMailDetail.lblBranchActionDate.Caption = frmMailDetailCaption(28, UserLang)
    frmMailDetail.lblBranchActionUser.Caption = frmMailDetailCaption(29, UserLang)
    frmMailDetail.lblBranchBrCode.Caption = frmMailDetailCaption(30, UserLang)
    frmMailDetail.lblBranchRemarks.Caption = frmMailDetailCaption(31, UserLang)
    
    frmMailDetail.lblDeliveredToCust.Caption = frmMailDetailCaption(34, UserLang)
    frmMailDetail.optDeliveredToCustYES.Caption = frmMailDetailCaption(35, UserLang)
    frmMailDetail.optDeliveredToCustNO.Caption = frmMailDetailCaption(36, UserLang)
    
    frmMailDetail.cmdRegister.Caption = frmMailDetailCaption(37, UserLang)
    frmMailDetail.cmdReport.Caption = frmMailDetailCaption(38, UserLang)
    frmMailDetail.cmdCustomerEnq.Caption = frmMailDetailCaption(39, UserLang)
    frmMailDetail.cmdMandateAction.Caption = frmMailDetailCaption(40, UserLang)
    frmMailDetail.cmdCallCentreAction.Caption = frmMailDetailCaption(41, UserLang)
    frmMailDetail.cmdBranchAction.Caption = frmMailDetailCaption(42, UserLang)
    frmMailDetail.cmdExit.Caption = frmMailDetailCaption(43, UserLang)

    Set rs = db.OpenRecordset("select * from packageaccinfo")
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbSegmentType.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbSegmentType.AddItem Right(rs("packagetypecode"), 1) & "-" & rs("englishname")
          Else
             cmbSegmentType.AddItem Right(rs("packagetypecode"), 1) & "-" & rs("arabicname")
          End If
          rs.MoveNext
       Loop
    End If
    
    Set rs = db.OpenRecordset("select * from returnedreasoninfo")
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbReturnedReason.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbReturnedReason.AddItem Right(rs("reasoncode"), 1) & "-" & rs("englishname")
          Else
             cmbReturnedReason.AddItem Right(rs("reasoncode"), 1) & "-" & rs("arabicname")
          End If
          rs.MoveNext
       Loop
    End If
    
    If recvLoginMsg.mailCentreBranch = "1" Then
       cmdReport.Enabled = True
    Else
       cmdReport.Enabled = False
    End If
    
    If recvLoginMsg.mandateBranch = "1" Then
       cmdMandateAction.Enabled = True
    Else
       cmdMandateAction.Enabled = False
    End If
    
    If recvLoginMsg.callCentreBranch = "1" Then
       cmdCallCentreAction.Enabled = True
    Else
       cmdCallCentreAction.Enabled = False
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameAddrVerificationActions_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameBranchActions_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameCallCentreActions_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameContactInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameReturnedInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optPoBox_Click()
    lblUnit.Visible = False
    lblPOBox.Visible = True
    lblPOBox.Refresh
End Sub

Private Sub optSaudiPost_Click()
    lblPOBox.Visible = False
    lblUnit.Visible = True
    lblUnit.Refresh
End Sub
