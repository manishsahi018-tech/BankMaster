VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFlxGrd.Ocx"
Begin VB.Form frmSearchEngine 
   BackColor       =   &H00BFD87E&
   Caption         =   "TList Enquiry"
   ClientHeight    =   8340
   ClientLeft      =   555
   ClientTop       =   360
   ClientWidth     =   11340
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   8340
   ScaleWidth      =   11340
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdSearch 
      Caption         =   "Search"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   375
      Left            =   6960
      TabIndex        =   1
      ToolTipText     =   "Search"
      Top             =   720
      Width           =   1335
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4800
      TabIndex        =   2
      ToolTipText     =   "Exit"
      Top             =   7320
      Width           =   1455
   End
   Begin VB.TextBox txtName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2160
      MaxLength       =   60
      TabIndex        =   0
      Top             =   720
      Width           =   4575
   End
   Begin MSFlexGridLib.MSFlexGrid searchEngineGrid 
      Height          =   5775
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   10186
      _Version        =   393216
      Rows            =   2000
      Cols            =   9
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblTlistEnq 
      BackColor       =   &H00BFD87E&
      Caption         =   "TList Enquiry"
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
      Left            =   4680
      TabIndex        =   5
      Top             =   120
      Width           =   2295
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11880
      Y1              =   1200
      Y2              =   1200
   End
   Begin VB.Label lblName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name"
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
      Left            =   360
      TabIndex        =   3
      Top             =   720
      Width           =   1695
   End
End
Attribute VB_Name = "frmSearchEngine"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdSearch_Click()
    Dim tName As String
    Dim strmsglen As String
    
    If Len(RTrim(txtName)) = 0 Then
       MsgBox errSpaceName(UserLang) '"Name cannot be spaces...Please check"
       txtName.SetFocus
       Exit Sub
    End If
    
    tName = Format(txtName, "!" & String(60, "@"))

    SendMsg = "000090" & "80" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tName & Space(7) & " "
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSearchEngine.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpclient, frmEnquiry.Timer1) = LocalCommsError Then
       frmSearchEngine.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    frmSearchEngine.MousePointer = vbNormal
    parseSearchEngineResponse
    fillSearchEngineGridHeading
    If recvSearchEngineMsg.status <> "000" Then
       If recvSearchEngineMsg.status = "003" Then
          MsgBox errIncorrectMsg(UserLang) '"Incorrect Message received from client"
       ElseIf recvSearchEngineMsg.status = "009" Then
          MsgBox errNotFoundInTlist(UserLang) '"No match found in T-List for this Name...."
       ElseIf UserLang = ARABIC Then
          MsgBox recvSearchEngineMsg.aRemarks
       Else
          MsgBox recvSearchEngineMsg.eRemarks
       End If
       Exit Sub
    End If
    
    fillSearchEngineForm Val(recvSearchEngineMsg.noOfRecs)

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As Integer, tWidth As Integer, colwidth(15) As Integer
    Dim rowTitle(10) As String
    Dim tmpStr As String, tCode As String
    Static lastRecRead As String * 3
    
'    rowTitle(0) = "Source"
'    rowTitle(1) = "English Name"
'    rowTitle(2) = "Arabic Name"
'    rowTitle(3) = "Id Number"
'    rowTitle(4) = "Date of birth"
'    rowTitle(5) = "Place of birth"
'    rowTitle(6) = "Position"
'    rowTitle(7) = "Additional Info"
'    rowTitle(8) = "Extract Flag"

    colwidth(0) = 700
    colwidth(1) = 2000
    colwidth(2) = 2000
    colwidth(3) = 1500
    colwidth(4) = 1300
    colwidth(5) = 1300
    colwidth(6) = 1300
    colwidth(7) = 3000
    colwidth(8) = 500
    
    If UserLang = ARABIC Then
      ChangePositions frmSearchEngine, 11800
      frmSearchEngine.RightToLeft = True
    End If
    
    frmSearchEngine.Caption = frmSearchEngineCaption(0, UserLang)
    frmSearchEngine.lblTlistEnq.Caption = frmSearchEngineCaption(0, UserLang)
    frmSearchEngine.lblName.Caption = frmSearchEngineCaption(1, UserLang)
    frmSearchEngine.cmdSearch.Caption = frmSearchEngineCaption(2, UserLang)
    frmSearchEngine.cmdExit.Caption = frmSearchEngineCaption(3, UserLang)
    
    fillSearchEngineGridHeading
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub searchEngineGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub txtStartTrans_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Sub fillSearchEngineGridHeading()
    Dim tWidth As Integer, colwidth(15) As Integer
    Dim rowTitle(10) As String
    Dim i As Integer
    
'    rowTitle(0) = "Source"
'    rowTitle(1) = "English Name"
'    rowTitle(2) = "Arabic Name"
'    rowTitle(3) = "Id Number"
'    rowTitle(4) = "Date of birth"
'    rowTitle(5) = "Place of birth"
'    rowTitle(6) = "Position"
'    rowTitle(7) = "Additional Info"
'    rowTitle(8) = "Extract Flag"
    

    colwidth(0) = 700
    colwidth(1) = 2000
    colwidth(2) = 2000
    colwidth(3) = 1500
    colwidth(4) = 1300
    colwidth(5) = 1300
    colwidth(6) = 1300
    colwidth(7) = 3000
    colwidth(8) = 500
    
    searchEngineGrid.Clear
    searchEngineGrid.Row = 0
    searchEngineGrid.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 8
        searchEngineGrid.Col = i
        If UserLang = ARABIC Then
           searchEngineGrid.CellAlignment = flexAlignRightCenter
        Else
           searchEngineGrid.CellAlignment = flexAlignLeftCenter
        End If
        'searchEngineGrid.Text = rowTitle(i)
        searchEngineGrid.Text = frmSearchEngineCaption(i + 4, UserLang)
        searchEngineGrid.colwidth(i) = colwidth(i)
        tWidth = tWidth + colwidth(i)
    Next i
End Sub
