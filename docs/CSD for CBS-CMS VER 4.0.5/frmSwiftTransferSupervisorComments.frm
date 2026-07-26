VERSION 5.00
Begin VB.Form frmSwiftTransferSupervisorComments 
   BackColor       =   &H00BFD87E&
   Caption         =   "Swift Transfer Supervisor Comments"
   ClientHeight    =   2670
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8760
   LinkTopic       =   "Form4"
   ScaleHeight     =   2670
   ScaleWidth      =   8760
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtSuperVisorComments 
      Height          =   495
      Left            =   2160
      TabIndex        =   3
      Text            =   " "
      Top             =   600
      Width           =   5415
   End
   Begin VB.CommandButton cmdForward 
      Caption         =   "Forward to CSO"
      Height          =   495
      Left            =   3600
      TabIndex        =   2
      ToolTipText     =   "Forward to CSO"
      Top             =   1680
      Width           =   2295
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5880
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   1680
      Width           =   1455
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Height          =   495
      Left            =   2040
      TabIndex        =   0
      ToolTipText     =   "Reject"
      Top             =   1680
      Width           =   1575
   End
   Begin VB.Label lblComments 
      BackColor       =   &H00BFD87E&
      Caption         =   "Comments"
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
      Height          =   375
      Left            =   360
      TabIndex        =   4
      Top             =   600
      Width           =   1695
   End
End
Attribute VB_Name = "frmSwiftTransferSupervisorComments"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
