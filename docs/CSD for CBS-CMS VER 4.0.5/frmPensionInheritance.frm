VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmPensionInheritance 
   BackColor       =   &H00BFD87E&
   Caption         =   "Pension Inheritance"
   ClientHeight    =   5325
   ClientLeft      =   1800
   ClientTop       =   1935
   ClientWidth     =   6585
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5325
   ScaleWidth      =   6585
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtPenSalary 
      Enabled         =   0   'False
      Height          =   285
      Left            =   8400
      MaxLength       =   9
      TabIndex        =   11
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox txtBranchCode 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2760
      MaxLength       =   9
      TabIndex        =   8
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox txtNoOfInh 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5640
      TabIndex        =   7
      Top             =   1200
      Width           =   735
   End
   Begin VB.TextBox txtPenCardNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2760
      MaxLength       =   9
      TabIndex        =   3
      Top             =   720
      Width           =   1455
   End
   Begin VB.TextBox txtPensionName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6600
      TabIndex        =   2
      Top             =   720
      Width           =   3015
   End
   Begin MSFlexGridLib.MSFlexGrid penInhGrid 
      Height          =   5895
      Left            =   720
      TabIndex        =   1
      Top             =   1680
      Width           =   10575
      _ExtentX        =   18653
      _ExtentY        =   10398
      _Version        =   393216
      Rows            =   27
      Cols            =   4
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      BackColorBkg    =   12572798
      ScrollBars      =   2
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
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      ToolTipText     =   "Exit"
      Top             =   7800
      Width           =   2295
   End
   Begin VB.Label lblPenSalary 
      BackColor       =   &H00BFD87E&
      Caption         =   " Pen Salary"
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
      Left            =   6600
      TabIndex        =   12
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code"
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
      Left            =   960
      TabIndex        =   10
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label lblNoOfInh 
      BackColor       =   &H00BFD87E&
      Caption         =   "No. of inh"
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
      Left            =   4320
      TabIndex        =   9
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label lblPenInh 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pension Inheritence details"
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
      Left            =   3720
      TabIndex        =   6
      Top             =   120
      Width           =   5055
   End
   Begin VB.Label lblPenCardNo 
      BackColor       =   &H00BFD87E&
      Caption         =   " Pen Card No"
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
      Left            =   960
      TabIndex        =   5
      Top             =   720
      Width           =   1695
   End
   Begin VB.Label lblName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Name"
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
      Left            =   4920
      TabIndex        =   4
      Top             =   720
      Width           =   1335
   End
End
Attribute VB_Name = "frmPensionInheritance"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub Form_Load()
  Dim i As Integer
  
  Dim rowTitle(5) As String
  Dim rowWidth(5) As String
  
'  rowTitle(0) = "Relation"
'  rowTitle(1) = "Date of birth"
'  rowTitle(2) = "Pension Amount"
'  rowTitle(3) = "Name"
  
  rowWidth(0) = 1000
  rowWidth(1) = 2500
  rowWidth(2) = 2600
  rowWidth(3) = 5000
 

  If UserLang = ARABIC Then
     ChangePositions frmPensionInheritance, 11800
     frmPensionInheritance.RightToLeft = True
     frmPensionInheritance.txtPensionName.Alignment = 1
  End If
    
  frmPensionInheritance.Caption = frmPensionInheritanceCaption(0, UserLang)
  frmPensionInheritance.lblPenInh.Caption = frmPensionInheritanceCaption(1, UserLang)
  frmPensionInheritance.lblPenCardNo.Caption = frmPensionDetailCaption(2, UserLang)
  frmPensionInheritance.lblName.Caption = frmPensionDetailCaption(3, UserLang)
  frmPensionInheritance.lblBranchCode.Caption = frmPensionInheritanceCaption(3, UserLang)
  frmPensionInheritance.lblNoOfInh.Caption = frmPensionInheritanceCaption(2, UserLang)
  frmPensionInheritance.lblPenSalary.Caption = frmPensionInheritanceCaption(4, UserLang)
  frmPensionInheritance.cmdExit.Caption = frmPensionInheritanceCaption(6, UserLang)

'  If UserLang = ARABIC Then
'     penInhGrid.Col = 1
'     penInhGrid.colwidth(0) = 9000
'     penInhGrid.colwidth(1) = 1300
'  Else
'     penInhGrid.Col = 0
'     penInhGrid.colwidth(0) = 1300
'     penInhGrid.colwidth(1) = 9000
'  End If
 
  penInhGrid.Row = 0
  tWidth = 0
  For i = 0 To 3
      penInhGrid.Col = i
      penInhGrid.CellFontBold = True
      penInhGrid.CellAlignment = vbAlignLeft
      penInhGrid.colwidth(i) = rowWidth(i)
      penInhGrid.Text = frmPensionInheritanceCaption(i + 7, UserLang)
  Next
    
  frmPensionInheritance.Show
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub penInhGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub
