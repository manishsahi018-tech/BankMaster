VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmUnclaimedAccount 
   BackColor       =   &H00BFD87E&
   Caption         =   "Static Data Maintenance - List of Unclaimed Accounts - Report Generation"
   ClientHeight    =   7755
   ClientLeft      =   30
   ClientTop       =   285
   ClientWidth     =   11445
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7755
   ScaleWidth      =   11445
   WindowState     =   2  'Maximized
   Begin VB.Frame frameCustomerRange 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer/Account Number Range"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   720
      Left            =   1080
      TabIndex        =   5
      Top             =   2625
      Width           =   8460
      Begin VB.TextBox txtToCustomer 
         Height          =   285
         Left            =   6000
         TabIndex        =   8
         Top             =   270
         Width           =   2310
      End
      Begin VB.TextBox txtFromCustomer 
         Height          =   285
         Left            =   1695
         TabIndex        =   6
         Top             =   270
         Width           =   2310
      End
      Begin VB.Label lblToCustomer 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "To:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00340A98&
         Height          =   240
         Left            =   5430
         TabIndex        =   9
         Top             =   285
         Width           =   345
      End
      Begin VB.Label lblFromCustomer 
         BackColor       =   &H00BFD87E&
         Caption         =   "From:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00340A98&
         Height          =   255
         Left            =   135
         TabIndex        =   7
         Top             =   285
         Width           =   1575
      End
   End
   Begin VB.TextBox txtBranchCode 
      BackColor       =   &H8000000B&
      Height          =   285
      Left            =   2760
      TabIndex        =   4
      Top             =   2250
      Width           =   735
   End
   Begin VB.CommandButton cmdGenerateReport 
      BackColor       =   &H00BFD87E&
      Caption         =   "&Generate Report"
      Height          =   375
      Left            =   4005
      MaskColor       =   &H00BFD87E&
      TabIndex        =   2
      ToolTipText     =   "Exit"
      Top             =   3960
      UseMaskColor    =   -1  'True
      Width           =   1395
   End
   Begin VB.Timer Timer1 
      Left            =   2070
      Top             =   7950
   End
   Begin MSWinsockLib.Winsock tcpclient 
      Left            =   1680
      Top             =   7965
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00BFD87E&
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   5400
      MaskColor       =   &H00BFD87E&
      TabIndex        =   1
      ToolTipText     =   "Exit"
      Top             =   3960
      UseMaskColor    =   -1  'True
      Width           =   1395
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   1155
      TabIndex        =   3
      Top             =   2250
      Width           =   1575
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11880
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Label lblListofUnclaimedAccounts 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "List of Unclaimed Accounts"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404080&
      Height          =   480
      Left            =   2535
      TabIndex        =   0
      Top             =   1395
      Width           =   5460
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00E0E0E0&
      BorderColor     =   &H00C00000&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   6  'Mask Pen Not
      FillColor       =   &H00404040&
      Height          =   4095
      Left            =   675
      Top             =   1080
      Width           =   9330
   End
End
Attribute VB_Name = "frmUnclaimedAccount"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub

Private Sub frameCustomerRange_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub
