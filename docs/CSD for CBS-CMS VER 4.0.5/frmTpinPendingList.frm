VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmTpinPendingList 
   BackColor       =   &H00BFD87E&
   Caption         =   "Telephone Pin Pending List"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtCustomerNo 
      Height          =   285
      Left            =   2670
      MaxLength       =   7
      TabIndex        =   6
      Top             =   780
      Width           =   1575
   End
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4470
      TabIndex        =   5
      ToolTipText     =   "Check pending List"
      Top             =   735
      Width           =   2295
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   1080
      TabIndex        =   2
      ToolTipText     =   "More"
      Top             =   6600
      Width           =   1695
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   4800
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   6600
      Width           =   1695
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   495
      Left            =   2760
      TabIndex        =   0
      ToolTipText     =   "Verify Selected Record"
      Top             =   6600
      Width           =   2055
   End
   Begin MSFlexGridLib.MSFlexGrid tpinPendingGrid 
      Height          =   4935
      Left            =   600
      TabIndex        =   3
      Top             =   1200
      Width           =   10335
      _ExtentX        =   18230
      _ExtentY        =   8705
      _Version        =   393216
      Rows            =   26
      Cols            =   5
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblCustomerNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Number"
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
      Left            =   660
      TabIndex        =   7
      Top             =   780
      Width           =   1935
   End
   Begin VB.Label lblPendingActivities 
      BackColor       =   &H00BFD87E&
      Caption         =   "Telepone Pin  Pending List"
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
      Left            =   2880
      TabIndex        =   4
      Top             =   150
      Width           =   5055
   End
End
Attribute VB_Name = "frmTpinPendingList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdCheckPendingList_Click()
  Dim tCustNo As String
  If Len(Trim(txtCustomerNo)) = 0 Then
     MsgBox errSpaceCustomerNo(UserLang)
     txtCustomerNo.SetFocus
     Exit Sub
  End If
  frmEnquiry.readTpinPendingList "00000", Format(txtCustomerNo, "0000000")
    
  If recvTpinPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load
End Sub

Private Sub cmdMore_Click()
  If Val(RTrim(recvTpinPendingList.noOfRecs)) <> 20 Then
     MsgBox errNoMatchFound(UserLang) '"No more match found..."
     Exit Sub
  End If
  
  frmEnquiry.readTpinPendingList recvTpinPendingList.lastRecCount, Format(txtCustomerNo, "0000000")
 
  If recvTpinPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdVerify_Click()
    tpinPendingGrid_DblClick
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow, tWidth, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim tCode, tmpStr, mQry As String
  
    colwidth(0) = 1200
    colwidth(1) = 1600
    colwidth(2) = 1700
    colwidth(3) = 1500
    colwidth(4) = 2500
   
    frmTpinPendingList.Caption = frmTpinPendingListCaption(0, UserLang)
    frmTpinPendingList.lblPendingActivities.Caption = frmTpinPendingListCaption(0, UserLang)
    frmTpinPendingList.cmdMore.Caption = frmTpinPendingListCaption(6, UserLang)
    frmTpinPendingList.cmdVerify.Caption = frmTpinPendingListCaption(7, UserLang)
    frmTpinPendingList.cmdCancel.Caption = frmTpinPendingListCaption(8, UserLang)
    lblCustomerNo.Caption = errCustomerNo(UserLang)
    cmdCheckPendingList.Caption = errCheckPendingList(UserLang)
    
'    rowTitle(0) = "User Id"
'    rowTitle(1) = "Date&Time"
'    rowTitle(2) = "Customer Number"
'    rowTitle(3) = "Customer Branch code"
'    rowTitle(4) = "Customer Short Name"
            
    tpinPendingGrid.Clear
    tpinPendingGrid.Row = 0
    tpinPendingGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 4
      tpinPendingGrid.Col = i
      If UserLang = ARABIC Then
         tpinPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         tpinPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      tpinPendingGrid.text = frmTpinPendingListCaption(i + 1, UserLang)
      'tpinPendingGrid.Text = rowTitle(i)
      tpinPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    tpinPendingGrid.Width = tWidth + 300
    
    For i = 1 To Val(recvTpinPendingList.noOfRecs)
      tpinPendingGrid.Row = i
      tpinPendingGrid.Col = 0
      tpinPendingGrid.text = recvTpinPendingList.details(i).userId
      tpinPendingGrid.Col = 1
      tpinPendingGrid.text = recvTpinPendingList.details(i).dateTime
      tpinPendingGrid.Col = 2
      tpinPendingGrid.CellAlignment = flexAlignLeftCenter
      tpinPendingGrid.text = recvTpinPendingList.details(i).custNo
      tpinPendingGrid.Col = 3
      tpinPendingGrid.text = recvTpinPendingList.details(i).custBranchCode
      tpinPendingGrid.Col = 4
      tpinPendingGrid.text = recvTpinPendingList.details(i).custShortName
   Next i
   tpinPendingGrid.Row = 1
   
   CSD_mdiForm.staticStatus.Panels(3).text = errSelectOneMatch(UserLang)
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Private Sub tpinPendingGrid_DblClick()
    Dim tuserId As String * 10
    Dim tDateTime As String * 14
    Dim tCustNo As String
    Dim tCustName As String
    
    tpinPendingGrid.Col = 0
    tuserId = Format(tpinPendingGrid.text, "!@@@@@@@@@@")
    tpinPendingGrid.Col = 1
    tDateTime = Format(tpinPendingGrid.text, "!@@@@@@@@@@@@@@")
    tpinPendingGrid.Col = 2
    tCustNo = Format(tpinPendingGrid.text, "!@@@@@@@")
    tpinPendingGrid.Col = 4
    tCustName = Format(tpinPendingGrid.text, "!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    
    If Len(RTrim(tuserId)) = 0 And Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    
    frmAcceptTPin.txtCustNo = tCustNo
    frmAcceptTPin.txtCustName = tCustName
    frmAcceptTPin.optTPinSelectedYes.Value = True
    
    frmAcceptTPin.Show vbModal
End Sub

Private Sub tpinPendingGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
