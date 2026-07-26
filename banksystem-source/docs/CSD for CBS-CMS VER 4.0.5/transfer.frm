VERSION 5.00
Begin VB.Form transfer 
   Caption         =   "Transferring Data"
   ClientHeight    =   1470
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3825
   LinkTopic       =   "Form1"
   ScaleHeight     =   1470
   ScaleWidth      =   3825
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Left            =   1680
      Top             =   120
   End
   Begin VB.Label Label1 
      Caption         =   "Transferring Data From HPANB server to the Selected branch ... Please wait"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   600
      TabIndex        =   0
      Top             =   720
      Width           =   2895
   End
End
Attribute VB_Name = "transfer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
