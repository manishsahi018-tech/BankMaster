VERSION 5.00
Begin VB.Form frmEnquiry 
   BackColor       =   &H8000000D&
   Caption         =   "Main Menu"
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   LinkTopic       =   "Form1"
   ScaleHeight     =   8595
   ScaleWidth      =   11880
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdInquiry 
      Caption         =   "Pending Actions"
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      Top             =   5160
      Width           =   4215
   End
   Begin VB.CommandButton cmdAtmCard 
      Caption         =   "ATM Card Maintenance"
      Height          =   375
      Left            =   3600
      TabIndex        =   4
      Top             =   4560
      Width           =   4215
   End
   Begin VB.CommandButton cmdAccount 
      Caption         =   "Existing Customer Details"
      Height          =   375
      Left            =   3600
      TabIndex        =   3
      Top             =   3960
      Width           =   4215
   End
   Begin VB.CommandButton cmdCustomer 
      Caption         =   "New Customer Details"
      Height          =   375
      Left            =   3600
      TabIndex        =   2
      Top             =   3360
      Width           =   4215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000B&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808000&
      Height          =   390
      Left            =   3120
      TabIndex        =   0
      TabStop         =   0   'False
      Text            =   "STATIC DATA MAINTENANCE"
      Top             =   1320
      Width           =   5295
   End
   Begin VB.Label Label1 
      BackColor       =   &H8000000A&
      Caption         =   "Main Menu"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808000&
      Height          =   375
      Left            =   4920
      TabIndex        =   1
      Top             =   2040
      Width           =   1695
   End
End
Attribute VB_Name = "frmEnquiry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
