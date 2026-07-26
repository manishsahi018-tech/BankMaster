VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmAccountGrid 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   8595
   ScaleWidth      =   11880
   StartUpPosition =   3  'Windows Default
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Height          =   5295
      Left            =   840
      TabIndex        =   6
      Top             =   1200
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   9340
      _Version        =   393216
      Rows            =   22
      Cols            =   5
      FixedCols       =   0
      BackColor       =   12572798
   End
   Begin VB.CommandButton cmdStatement 
      Caption         =   "Statement"
      Height          =   495
      Left            =   5520
      TabIndex        =   5
      Top             =   6600
      Width           =   1095
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   4320
      TabIndex        =   4
      Top             =   6600
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnquiry 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Enquiry"
      Height          =   495
      Left            =   3120
      TabIndex        =   3
      Top             =   6600
      Width           =   1215
   End
   Begin VB.CommandButton cmdUpdateAc 
      Caption         =   "Update A/C"
      Height          =   495
      Left            =   1920
      TabIndex        =   2
      Top             =   6600
      Width           =   1215
   End
   Begin VB.CommandButton cmdNewAcct 
      Caption         =   "New A/C"
      Height          =   495
      Left            =   720
      TabIndex        =   1
      Top             =   6600
      Width           =   1215
   End
   Begin VB.Label lblAccount 
      BackColor       =   &H00BFD87E&
      Caption         =   "      Account Information"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   3240
      TabIndex        =   0
      Top             =   240
      Width           =   4455
   End
End
Attribute VB_Name = "frmAccountGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
