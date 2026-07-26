VERSION 5.00
Begin VB.Form frmReturnMail 
   Appearance      =   0  'Flat
   BackColor       =   &H00BFD87E&
   Caption         =   "Returned mail handling"
   ClientHeight    =   4785
   ClientLeft      =   1710
   ClientTop       =   1845
   ClientWidth     =   9975
   ControlBox      =   0   'False
   DrawWidth       =   5
   FillColor       =   &H00BFD87E&
   FillStyle       =   0  'Solid
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4785
   ScaleWidth      =   9975
   WindowState     =   2  'Maximized
   Begin VB.Frame frameAddressType 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   1920
      TabIndex        =   78
      Tag             =   "11775"
      Top             =   1320
      Width           =   1935
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
         TabIndex        =   80
         Tag             =   "2310"
         ToolTipText     =   "Saudi Post"
         Top             =   60
         Width           =   915
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
         TabIndex        =   79
         Tag             =   "2310"
         ToolTipText     =   "PO Box"
         Top             =   30
         Value           =   -1  'True
         Width           =   975
      End
   End
   Begin VB.TextBox txtBranchCode 
      Enabled         =   0   'False
      Height          =   285
      Left            =   10800
      MaxLength       =   30
      TabIndex        =   74
      Top             =   0
      Width           =   735
   End
   Begin VB.ComboBox cmbDespatchDate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   7560
      TabIndex        =   73
      Text            =   "01"
      Top             =   0
      Width           =   615
   End
   Begin VB.ComboBox cmbDespathMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   8160
      TabIndex        =   72
      Text            =   "01"
      Top             =   0
      Width           =   615
   End
   Begin VB.TextBox txtDespatchYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   8760
      MaxLength       =   4
      TabIndex        =   71
      Top             =   0
      Width           =   615
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
      Left            =   120
      TabIndex        =   60
      Top             =   2040
      Width           =   11535
      Begin VB.ComboBox cmbReturnedReason 
         Height          =   315
         ItemData        =   "frmReturnMail.frx":0000
         Left            =   9360
         List            =   "frmReturnMail.frx":0019
         TabIndex        =   69
         Tag             =   "11535"
         Top             =   240
         Width           =   2040
      End
      Begin VB.ComboBox cmbReturnDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   1320
         TabIndex        =   65
         Tag             =   "11535"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.ComboBox cmbReturnMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   1920
         TabIndex        =   64
         Tag             =   "11535"
         Text            =   "01"
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtReturnYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2520
         MaxLength       =   4
         TabIndex        =   63
         Tag             =   "11535"
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtRegisteredUser 
         Height          =   285
         Left            =   4800
         TabIndex        =   62
         Tag             =   "11535"
         Top             =   240
         Width           =   1095
      End
      Begin VB.TextBox txtRegisteredBranch 
         Height          =   285
         Left            =   7680
         MaxLength       =   30
         TabIndex        =   61
         Tag             =   "11535"
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblReturnedReason 
         BackColor       =   &H00BFD87E&
         Caption         =   "Reason"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
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
         TabIndex        =   70
         Tag             =   "11535"
         Top             =   240
         Width           =   735
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
         TabIndex        =   68
         Tag             =   "11535"
         Top             =   240
         Width           =   1215
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
         Left            =   3240
         TabIndex        =   67
         Tag             =   "11535"
         Top             =   240
         Width           =   1455
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
         Left            =   6000
         TabIndex        =   66
         Tag             =   "11535"
         Top             =   240
         Width           =   1575
      End
   End
   Begin VB.CommandButton cmdUpdCust 
      Caption         =   "Update Customer"
      Height          =   405
      Left            =   6720
      TabIndex        =   55
      ToolTipText     =   "Update Customer"
      Top             =   7680
      Width           =   1785
   End
   Begin VB.ComboBox cmbSegmentType 
      Enabled         =   0   'False
      Height          =   315
      Left            =   9480
      TabIndex        =   45
      Top             =   960
      Width           =   2295
   End
   Begin VB.Frame frameBranchActions 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch actions"
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
      Left            =   120
      TabIndex        =   41
      Top             =   6000
      Width           =   11415
      Begin VB.Frame Frame7 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   2040
         TabIndex        =   56
         Tag             =   "11415"
         Top             =   720
         Width           =   1815
         Begin VB.OptionButton optDeliveredToCustYes 
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
            TabIndex        =   58
            Tag             =   "1815"
            ToolTipText     =   "Yes"
            Top             =   0
            Value           =   -1  'True
            Width           =   975
         End
         Begin VB.OptionButton optDeliveredToCustNo 
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
            Left            =   1080
            TabIndex        =   57
            Tag             =   "1815"
            ToolTipText     =   "No"
            Top             =   0
            Width           =   615
         End
      End
      Begin VB.Frame Frame6 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1800
         TabIndex        =   51
         Tag             =   "11415"
         Top             =   120
         Width           =   8535
         Begin VB.OptionButton optBranchAddrNotUpd 
            BackColor       =   &H00BFD87E&
            Caption         =   "Address not updated"
            BeginProperty Font 
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
            Left            =   2280
            TabIndex        =   54
            Tag             =   "8535"
            ToolTipText     =   "Address not updated"
            Top             =   120
            Value           =   -1  'True
            Width           =   3495
         End
         Begin VB.OptionButton optBranchAddrUpd 
            BackColor       =   &H00BFD87E&
            Caption         =   "Address Updated"
            BeginProperty Font 
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
            Left            =   120
            TabIndex        =   53
            Tag             =   "8535"
            ToolTipText     =   "Address Updated"
            Top             =   120
            Width           =   1935
         End
         Begin VB.OptionButton optBranchStmtDisabled 
            BackColor       =   &H00BFD87E&
            Caption         =   "Statement Disabled"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   52
            Tag             =   "8535"
            ToolTipText     =   "Statement Disabled"
            Top             =   120
            Width           =   2535
         End
      End
      Begin VB.TextBox txtBranchRemarks 
         Height          =   285
         Left            =   1800
         MaxLength       =   75
         TabIndex        =   42
         Tag             =   "11415"
         Top             =   1080
         Width           =   5775
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
         TabIndex        =   59
         Tag             =   "11415"
         Top             =   720
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
         TabIndex        =   44
         Tag             =   "11415"
         Top             =   1080
         Width           =   975
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
         TabIndex        =   43
         Tag             =   "11415"
         Top             =   240
         Width           =   615
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
      Left            =   120
      TabIndex        =   37
      Top             =   4920
      Width           =   11415
      Begin VB.Frame Frame4 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1800
         TabIndex        =   47
         Tag             =   "11415"
         Top             =   120
         Width           =   8535
         Begin VB.OptionButton optCallCentreCustNotReach 
            BackColor       =   &H00BFD87E&
            Caption         =   "Customer not reachable"
            BeginProperty Font 
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
            Left            =   5760
            TabIndex        =   50
            Tag             =   "8535"
            ToolTipText     =   "Customer not reachable"
            Top             =   120
            Width           =   2535
         End
         Begin VB.OptionButton optCallCentreAddrUpd 
            BackColor       =   &H00BFD87E&
            Caption         =   "Address Updated"
            BeginProperty Font 
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
            Left            =   120
            TabIndex        =   49
            Tag             =   "8535"
            ToolTipText     =   "Address Updated"
            Top             =   120
            Width           =   1935
         End
         Begin VB.OptionButton optCallCentreAddrNotUpd 
            BackColor       =   &H00BFD87E&
            Caption         =   "Address not updated"
            BeginProperty Font 
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
            Left            =   2280
            TabIndex        =   48
            Tag             =   "8535"
            ToolTipText     =   "Address not updated"
            Top             =   120
            Value           =   -1  'True
            Width           =   3495
         End
      End
      Begin VB.TextBox txtCallCentreRemarks 
         Height          =   285
         Left            =   1800
         MaxLength       =   75
         TabIndex        =   38
         Tag             =   "11415"
         Top             =   600
         Width           =   5775
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
         TabIndex        =   40
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
         TabIndex        =   39
         Tag             =   "11415"
         Top             =   600
         Width           =   975
      End
   End
   Begin VB.Frame frameMandateActions 
      BackColor       =   &H00BFD87E&
      Caption         =   "Mandate actions"
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
      Left            =   120
      TabIndex        =   30
      Top             =   3840
      Width           =   11415
      Begin VB.TextBox txtMandateRemarks 
         Height          =   285
         Left            =   1560
         MaxLength       =   75
         TabIndex        =   34
         Tag             =   "11415"
         Top             =   600
         Width           =   6015
      End
      Begin VB.Frame frameMandateStatus 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1560
         TabIndex        =   31
         Tag             =   "11415"
         Top             =   120
         Width           =   6015
         Begin VB.OptionButton optMandateAddrNotUpd 
            BackColor       =   &H00BFD87E&
            Caption         =   "Addr.Same; Forwarded to call centre"
            BeginProperty Font 
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
            Left            =   2280
            TabIndex        =   33
            Tag             =   "6015"
            ToolTipText     =   "Addr.Same; Forwarded to call centre"
            Top             =   120
            Value           =   -1  'True
            Width           =   3495
         End
         Begin VB.OptionButton optMandateAddrUpd 
            BackColor       =   &H00BFD87E&
            Caption         =   "Diff.Address; Fixed"
            BeginProperty Font 
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
            Left            =   120
            TabIndex        =   32
            Tag             =   "6015"
            ToolTipText     =   "Diff.Address; Fixed"
            Top             =   120
            Width           =   1935
         End
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
         TabIndex        =   36
         Tag             =   "11415"
         Top             =   600
         Width           =   975
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
         TabIndex        =   35
         Tag             =   "11415"
         Top             =   240
         Width           =   615
      End
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
      Left            =   120
      TabIndex        =   19
      Top             =   2760
      Width           =   11415
      Begin VB.TextBox txtOffTelNo 
         Height          =   285
         Left            =   960
         TabIndex        =   24
         Tag             =   "11415"
         Top             =   240
         Width           =   2295
      End
      Begin VB.TextBox txtHomeTelNo 
         Height          =   285
         Left            =   4680
         TabIndex        =   23
         Tag             =   "11415"
         Top             =   240
         Width           =   2415
      End
      Begin VB.TextBox txtMobileNo 
         Height          =   285
         Left            =   8160
         TabIndex        =   22
         Tag             =   "11415"
         Top             =   240
         Width           =   2295
      End
      Begin VB.TextBox txtFaxNo 
         Height          =   285
         Left            =   960
         TabIndex        =   21
         Tag             =   "11415"
         Top             =   600
         Width           =   2295
      End
      Begin VB.TextBox txtEmailAddr 
         Height          =   285
         Left            =   4680
         TabIndex        =   20
         Tag             =   "11415"
         Top             =   600
         Width           =   3375
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
         TabIndex        =   29
         Tag             =   "11415"
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblHomeTel 
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
         TabIndex        =   28
         Tag             =   "11415"
         Top             =   240
         Width           =   855
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
         TabIndex        =   27
         Tag             =   "11415"
         Top             =   240
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
         Left            =   240
         TabIndex        =   26
         Tag             =   "11415"
         Top             =   600
         Width           =   615
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
         TabIndex        =   25
         Tag             =   "11415"
         Top             =   600
         Width           =   1575
      End
   End
   Begin VB.TextBox txtProductNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6000
      MaxLength       =   30
      TabIndex        =   17
      Top             =   600
      Width           =   3015
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
      Left            =   2025
      TabIndex        =   15
      Top             =   960
      Width           =   1575
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update Action"
      Height          =   405
      Left            =   3360
      TabIndex        =   14
      ToolTipText     =   "Update Action"
      Top             =   7680
      Width           =   1785
   End
   Begin VB.TextBox txtCustName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5160
      MaxLength       =   30
      TabIndex        =   12
      Top             =   960
      Width           =   3015
   End
   Begin VB.TextBox txtZipCode 
      Enabled         =   0   'False
      Height          =   285
      Left            =   8400
      TabIndex        =   7
      Top             =   1680
      Width           =   1215
   End
   Begin VB.ComboBox cmbCity 
      Enabled         =   0   'False
      Height          =   315
      Left            =   4680
      TabIndex        =   6
      Text            =   "Riyadh"
      Top             =   1680
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
      Left            =   2025
      TabIndex        =   5
      Tag             =   "11775"
      Top             =   1680
      Width           =   1575
   End
   Begin VB.TextBox txtAddress1 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5145
      MaxLength       =   30
      TabIndex        =   4
      Tag             =   "11775"
      Top             =   1320
      Width           =   3015
   End
   Begin VB.TextBox txtRefNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2040
      MaxLength       =   30
      TabIndex        =   3
      Tag             =   "11775"
      Top             =   600
      Width           =   1815
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   405
      Left            =   5280
      TabIndex        =   1
      ToolTipText     =   "Exit"
      Top             =   7680
      Width           =   1305
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
      Left            =   240
      TabIndex        =   81
      Tag             =   "11775"
      Top             =   1320
      Width           =   1335
   End
   Begin VB.Label lblUnit 
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
      Left            =   360
      TabIndex        =   77
      Top             =   1680
      Visible         =   0   'False
      Width           =   1215
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
      Left            =   9480
      TabIndex        =   76
      Top             =   0
      Width           =   1215
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
      Left            =   6120
      TabIndex        =   75
      Top             =   0
      Width           =   1335
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
      TabIndex        =   46
      Top             =   1005
      Width           =   1230
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
      Left            =   4200
      TabIndex        =   18
      Top             =   600
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
      Left            =   240
      TabIndex        =   16
      Tag             =   "11775"
      Top             =   960
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
      TabIndex        =   13
      Tag             =   "11775"
      Top             =   960
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
      Left            =   7200
      TabIndex        =   11
      Top             =   1680
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
      Left            =   3825
      TabIndex        =   10
      Top             =   1680
      Width           =   855
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
      Left            =   240
      TabIndex        =   9
      Tag             =   "11775"
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
      TabIndex        =   8
      Tag             =   "11775"
      Top             =   1320
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
      Left            =   240
      TabIndex        =   2
      Tag             =   "11775"
      Top             =   600
      Width           =   1605
   End
   Begin VB.Label lblReturnMailActions 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Returned mail handling"
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
      Left            =   240
      TabIndex        =   0
      Top             =   0
      Width           =   5655
   End
End
Attribute VB_Name = "frmReturnMail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdUpdate_Click()
    Dim tRefNo As String
    Dim tag As String
    Dim deliveredToCust As String
    Dim strmsglen As String
    Dim actionTaken As String
    Dim remarks As String
    Dim tCustNo As String
    
    tRefNo = Format(txtRefNo, "!" & String(16, "@"))
    deliveredToCust = " "
    
    If frmReturnMail.tag = "M" Then  'mandate actions
       If optMandateAddrUpd = False And optMandateAddrNotUpd = False Then
          MsgBox errOneOptionReqd(UserLang) '"Either one of the action should be selected; please check.. "
          Exit Sub
       End If
       
'       If Len(Trim(txtMandateRemarks)) = 0 Then
'          MsgBox "Remarks should be entered...Please enter and re-try..."
'          txtMandateRemarks.SetFocus
'          Exit Sub
'       End If
       
       If optMandateAddrUpd = True Then
          actionTaken = "1"
       Else
          actionTaken = "2"
       End If
       If Len(RTrim(txtMandateRemarks)) = 0 Then
          txtMandateRemarks = Space(75)
       Else
          txtMandateRemarks = Trim(txtMandateRemarks)
       End If
       remarks = Format(txtMandateRemarks, "!" & String(75, "@"))
    ElseIf frmReturnMail.tag = "C" Then ' Call centre actions
       If optCallCentreAddrUpd = False And optCallCentreAddrNotUpd = False And _
          optCallCentreCustNotReach = False Then
          MsgBox errOneOptionReqd(UserLang) '"Either one of the action should be selected; please check.. "
          Exit Sub
       End If
       
'       If Len(Trim(txtCallCentreRemarks)) = 0 Then
'          MsgBox "Remarks should be entered...Please enter and re-try..."
'          txtCallCentreRemarks.SetFocus
'          Exit Sub
'       End If
       
       If optCallCentreAddrUpd = True Then
          actionTaken = "1"
       ElseIf optCallCentreAddrNotUpd = True Then
          actionTaken = "2"
       Else
          actionTaken = "3"
       End If
       If Len(RTrim(txtCallCentreRemarks)) = 0 Then
          txtCallCentreRemarks = Space(75)
       Else
          txtCallCentreRemarks = Trim(txtCallCentreRemarks)
       End If
       remarks = Format(txtCallCentreRemarks, "!" & String(75, "@"))
    ElseIf frmReturnMail.tag = "B" Then ' Branch actions
       If optBranchAddrUpd = False And optBranchAddrNotUpd = False And _
          optBranchStmtDisabled = False Then
          MsgBox errOneOptionReqd(UserLang) '"Either one of the action should be selected; please check.. "
          Exit Sub
       End If
       
'       If Len(Trim(txtBranchRemarks)) = 0 Then
'          MsgBox "Remarks should be entered...Please enter and re-try..."
'          txtBranchRemarks.SetFocus
'          Exit Sub
'       End If
       
       If optBranchAddrUpd = True Then
          actionTaken = "1"
       ElseIf optBranchAddrNotUpd = True Then
          actionTaken = "2"
       Else
          actionTaken = "3"
       End If
       If Len(RTrim(txtBranchRemarks)) = 0 Then
          txtBranchRemarks = Space(75)
       Else
          txtBranchRemarks = Trim(txtBranchRemarks)
       End If
       remarks = Format(txtBranchRemarks, "!" & String(75, "@"))
       If optDeliveredToCustYES = True Then
          deliveredToCust = "1"
       Else
          deliveredToCust = "0"
       End If
    End If

    SendMsg = "000090" & "AD" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & frmReturnMail.tag & tRefNo & actionTaken & deliveredToCust & remarks & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmReturnMail.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmReturnMail.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    frmReturnMail.MousePointer = vbNormal
    
    If recvCustomerMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
       Exit Sub
    Else
       MsgBox errSuccessful(UserLang)
    End If
    
    tag = frmReturnMail.tag
    Unload Me
    ' re-show the pending list form
    If tag = "M" Then
       Unload frmReturnMailPendingList
       frmReturnMailPendingList.tag = tag
       frmReturnMailPendingList.Caption = frmReturnedMailPendingListCaption(1, UserLang) '"List of pending returned mails-Mandate Branch"
       frmReturnMailPendingList.lblPendingReturnMails = frmReturnedMailPendingListCaption(1, UserLang) '"List of pending returned mails-Mandate Branch"
       frmReturnMailPendingList.lblCustomerNo.Visible = False
       frmReturnMailPendingList.txtCustomerNo.Visible = False
       frmReturnMailPendingList.cmdCheckPendingMails.Visible = False
       frmReturnMailPendingList.readRetMailPendingList "00000", "M", Space(7)
       frmReturnMailPendingList.fillRetMailPendingListForm
    ElseIf tag = "C" Then
        Unload frmReturnMailPendingList
        frmReturnMailPendingList.tag = tag
        frmReturnMailPendingList.Caption = frmReturnedMailPendingListCaption(2, UserLang) '"List of pending returned mails-Call centre"
        frmReturnMailPendingList.lblPendingReturnMails = frmReturnedMailPendingListCaption(2, UserLang) '"List of pending returned mails-Call centre"
        frmReturnMailPendingList.lblCustomerNo.Visible = False
        frmReturnMailPendingList.txtCustomerNo.Visible = False
        frmReturnMailPendingList.cmdCheckPendingMails.Visible = False
        frmReturnMailPendingList.readRetMailPendingList "00000", "C", Space(7)
        frmReturnMailPendingList.fillRetMailPendingListForm
    ElseIf tag = "B" Then
        If Len(Trim(frmReturnMailPendingList.txtCustomerNo)) = 0 Then
           tCustNo = Space(7)
        Else
           tCustNo = Format(frmReturnMailPendingList.txtCustomerNo, "0000000")
        End If
        Unload frmReturnMailPendingList
        frmReturnMailPendingList.tag = tag
        frmReturnMailPendingList.Caption = frmReturnedMailPendingListCaption(3, UserLang) '"List of pending returned mails-Branch "
        frmReturnMailPendingList.lblPendingReturnMails = frmReturnedMailPendingListCaption(3, UserLang) '"List of pending returned mails-Branch "
        frmReturnMailPendingList.lblCustomerNo.Visible = True
        frmReturnMailPendingList.lblCustomerNo.Refresh
        frmReturnMailPendingList.txtCustomerNo.Visible = True
        frmReturnMailPendingList.txtCustomerNo.Refresh
        frmReturnMailPendingList.txtCustomerNo = tCustNo
        frmReturnMailPendingList.cmdCheckPendingMails.Visible = True
        frmReturnMailPendingList.cmdCheckPendingMails.Refresh
        frmReturnMailPendingList.readRetMailPendingList "00000", "B", tCustNo
        frmReturnMailPendingList.fillRetMailPendingListForm
    End If
    
End Sub

Private Sub cmdUpdCust_Click()
  Dim retStr As String
  Dim tCode As String
  Dim tCustNo As String, tCustName As String
  Dim mainCategoryCode As String, subCategoryCode As String
  Dim i As Integer
   
  If Len(RTrim(txtCustNo)) = 0 Then
     MsgBox errInvalidSearchCriteria(UserLang)
     Exit Sub
  End If
  retStr = doSearch1("00000", txtCustNo)
  If retStr <> "-0001" Then
     If recvSearchMsg.noOfRecs = "00" Then
        MsgBox errInvalidCustNo(UserLang)
        Exit Sub
     End If
     supervisorAction = False
     tellerAction = False
     searchAction = False
     updateAction = True
     custHistoryAction = False
     noOfJoint = "0"
     tCustNo = Format(txtCustNo, "0000000")
     tCustName = Format(recvSearchMsg.details(1).shortName, "!" & String(30, "@"))
     frmCustCategorize.Show
     frmCustCategorize.txtCustNo = tCustNo
     frmCustCategorize.txtCustName = tCustName
     mainCategoryCode = recvSearchMsg.details(1).mainCategoryCode
     subCategoryCode = recvSearchMsg.details(1).subCategoryCode
     tCode = mainCategoryCode
     If tCode <> "" Then
        For i = 0 To frmCustCategorize.cmbMainCategory.ListCount
            If Mid$(frmCustCategorize.cmbMainCategory.List(i), 1, 2) = tCode Then
               frmCustCategorize.cmbMainCategory.ListIndex = i
               Exit For
            End If
        Next i
     Else
        frmCustCategorize.cmbMainCategory.ListIndex = -1
     End If
     If i > frmCustCategorize.cmbMainCategory.ListCount Then
        frmCustCategorize.cmbMainCategory.text = tCode & "-Not defined in local"
     End If
     tCode = subCategoryCode
     If tCode <> "" Then
        For i = 0 To frmCustCategorize.cmbSubCategory.ListCount
            If Mid$(frmCustCategorize.cmbSubCategory.List(i), 1, 2) = tCode Then
               frmCustCategorize.cmbSubCategory.ListIndex = i
               Exit For
            End If
        Next i
     Else
        frmCustCategorize.cmbSubCategory.ListIndex = -1
     End If
     If i > frmCustCategorize.cmbSubCategory.ListCount Then
        frmCustCategorize.cmbSubCategory.text = tCode & "-Not defined in local"
     End If
     CSD_mdiForm.staticStatus.Panels(3).text = "   "
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    
    If UserLang = ARABIC Then
       ChangePositions frmReturnMail, 11800
       frmReturnMail.RightToLeft = True
       frameBranchActions.RightToLeft = True
       frameMandateActions.RightToLeft = True
       frameCallCentreActions.RightToLeft = True
       frameContactInfo.RightToLeft = True
       frameReturnedInfo.RightToLeft = True
       txtMandateRemarks.Alignment = vbRightJustify
       txtCallCentreRemarks.Alignment = vbRightJustify
       txtBranchRemarks.Alignment = vbRightJustify
    End If
    
    frmReturnMail.Caption = frmReturnedMailCaption(0, UserLang)
    frmReturnMail.lblReturnMailActions.Caption = frmReturnedMailCaption(0, UserLang)
    frmReturnMail.lblDateDespatched.Caption = frmReturnedMailCaption(41, UserLang)
    frmReturnMail.lblBranchCode.Caption = frmReturnedMailCaption(42, UserLang)
    frmReturnMail.lblRefNo.Caption = frmReturnedMailCaption(1, UserLang)
    frmReturnMail.lblProductId.Caption = frmReturnedMailCaption(2, UserLang)
    frmReturnMail.lblCustNo.Caption = frmReturnedMailCaption(3, UserLang)
    frmReturnMail.lblCustName.Caption = frmReturnedMailCaption(4, UserLang)
    frmReturnMail.lblSegmentType.Caption = frmReturnedMailCaption(5, UserLang)
    frmReturnMail.lblAddress1.Caption = frmReturnedMailCaption(6, UserLang)
    frmReturnMail.lblPOBox.Caption = frmReturnedMailCaption(7, UserLang)
    frmReturnMail.lblCity.Caption = frmReturnedMailCaption(8, UserLang)
    frmReturnMail.lblZipCode.Caption = frmReturnedMailCaption(9, UserLang)
    frmReturnMail.frameReturnedInfo.Caption = frmReturnedMailCaption(10, UserLang)
    frmReturnMail.lblReturnedDate.Caption = frmReturnedMailCaption(11, UserLang)
    frmReturnMail.lblRegUser.Caption = frmReturnedMailCaption(12, UserLang)
    frmReturnMail.lblRegBranch.Caption = frmReturnedMailCaption(13, UserLang)
    frmReturnMail.lblReturnedReason.Caption = frmReturnedMailCaption(14, UserLang)
    frmReturnMail.frameContactInfo.Caption = frmReturnedMailCaption(15, UserLang)
    frmReturnMail.lblOfficeTel.Caption = frmReturnedMailCaption(16, UserLang)
    frmReturnMail.lblHomeTel.Caption = frmReturnedMailCaption(17, UserLang)
    frmReturnMail.lblMobileNo.Caption = frmReturnedMailCaption(18, UserLang)
    frmReturnMail.lblFax.Caption = frmReturnedMailCaption(19, UserLang)
    frmReturnMail.lblEmail.Caption = frmReturnedMailCaption(20, UserLang)
    frmReturnMail.frameMandateActions.Caption = frmReturnedMailCaption(21, UserLang)
    frmReturnMail.lblMandateStatus.Caption = frmReturnedMailCaption(22, UserLang)
    frmReturnMail.optMandateAddrUpd.Caption = frmReturnedMailCaption(23, UserLang)
    frmReturnMail.optMandateAddrNotUpd.Caption = frmReturnedMailCaption(24, UserLang)
    frmReturnMail.lblMandateRemarks.Caption = frmReturnedMailCaption(25, UserLang)
    
    frmReturnMail.frameCallCentreActions.Caption = frmReturnedMailCaption(26, UserLang)
    frmReturnMail.lblCallCentreStatus.Caption = frmReturnedMailCaption(22, UserLang)
    frmReturnMail.optCallCentreAddrUpd.Caption = frmReturnedMailCaption(27, UserLang)
    frmReturnMail.optCallCentreAddrNotUpd.Caption = frmReturnedMailCaption(28, UserLang)
    frmReturnMail.optCallCentreCustNotReach.Caption = frmReturnedMailCaption(29, UserLang)
    frmReturnMail.lblCallCentreRemarks.Caption = frmReturnedMailCaption(25, UserLang)
    frmReturnMail.frameBranchActions.Caption = frmReturnedMailCaption(30, UserLang)
    frmReturnMail.lblBranchStatus.Caption = frmReturnedMailCaption(22, UserLang)
    frmReturnMail.optBranchAddrUpd.Caption = frmReturnedMailCaption(27, UserLang)
    frmReturnMail.optBranchAddrNotUpd.Caption = frmReturnedMailCaption(28, UserLang)
    frmReturnMail.optBranchStmtDisabled.Caption = frmReturnedMailCaption(31, UserLang)
    frmReturnMail.lblDeliveredToCust.Caption = frmReturnedMailCaption(32, UserLang)
    frmReturnMail.optDeliveredToCustYES.Caption = frmReturnedMailCaption(33, UserLang)
    frmReturnMail.optDeliveredToCustNO.Caption = frmReturnedMailCaption(34, UserLang)
    frmReturnMail.lblBranchRemarks.Caption = frmReturnedMailCaption(25, UserLang)
    frmReturnMail.cmdUpdate.Caption = frmReturnedMailCaption(35, UserLang)
    frmReturnMail.cmdExit.Caption = frmReturnedMailCaption(36, UserLang)
    frmReturnMail.cmdUpdCust.Caption = frmReturnedMailCaption(37, UserLang)
    

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
    
    If InStr(recvLoginMsg.AuthorityLevel, "~01") > 0 Then
       cmdUpdCust.Enabled = True
    Else
       cmdUpdCust.Enabled = False
    End If
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub lblCountry_Click()

End Sub

Private Sub txtMandateRemarks_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
      txtMandateRemarks.Alignment = vbLeftJustify
  End If
  If KeyAscii > 128 Then
     txtMandateRemarks.Alignment = vbRightJustify
  End If
End Sub
