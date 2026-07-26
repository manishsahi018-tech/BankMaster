VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmManualBlkPendingList 
   BackColor       =   &H00BFD87E&
   Caption         =   "Manual Blocking Pending List"
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
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4485
      TabIndex        =   6
      ToolTipText     =   "Check pending List"
      Top             =   810
      Width           =   2295
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   285
      Left            =   2685
      MaxLength       =   7
      TabIndex        =   5
      Top             =   855
      Width           =   1575
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   2400
      TabIndex        =   2
      ToolTipText     =   "More"
      Top             =   6720
      Width           =   1695
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   6120
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   6720
      Width           =   1695
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   495
      Left            =   4080
      TabIndex        =   0
      ToolTipText     =   "Verify Selected Record"
      Top             =   6720
      Width           =   2055
   End
   Begin MSFlexGridLib.MSFlexGrid manualBlkPendingGrid 
      Height          =   4935
      Left            =   600
      TabIndex        =   3
      Top             =   1320
      Width           =   10335
      _ExtentX        =   18230
      _ExtentY        =   8705
      _Version        =   393216
      Rows            =   26
      Cols            =   8
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
      Left            =   675
      TabIndex        =   7
      Top             =   855
      Width           =   1935
   End
   Begin VB.Label lblManualBlkPendingList 
      BackColor       =   &H00BFD87E&
      Caption         =   "Manual Blocking Pending List"
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
      Left            =   1680
      TabIndex        =   4
      Top             =   195
      Width           =   9015
   End
End
Attribute VB_Name = "frmManualBlkPendingList"
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
  If blockSupervisorAction = True Then
     frmEnquiry.readBlockPendingList "00000", "S", frmManualBlkPendingList.tag, Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readBlockPendingList "00000", "T", frmManualBlkPendingList.tag, Format(txtCustomerNo, "0000000")
  End If
    
  If recvStopChqPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load
End Sub

Private Sub cmdMore_Click()
  If recvBlockPendingList.noOfRecs <> 20 Then
     MsgBox errNoMatchFound(UserLang) '"No more match found..."
     Exit Sub
  End If
   If blockSupervisorAction = True Then
      frmEnquiry.readBlockPendingList recvBlockPendingList.lastRecCount, "S", frmManualBlkPendingList.tag, Format(txtCustomerNo, "0000000")
   Else
      frmEnquiry.readBlockPendingList recvBlockPendingList.lastRecCount, "T", frmManualBlkPendingList.tag, Format(txtCustomerNo, "0000000")
   End If
    
  If recvBlockPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdVerify_Click()
    manualBlkPendingGrid_DblClick
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As Integer
    Dim tWidth As Integer
    Dim amtDenom As Integer
    Dim colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim tmpStr As String
    Dim mQry As String, accStatus As String
    Dim tCcy As String, tDecimalPlace As String
    Dim tCode As String
    Dim i As Integer
    Static lastRecRead As String * 3
    
    colwidth(0) = 1300
    colwidth(1) = 1600
    colwidth(2) = 1600
    colwidth(3) = 1500
    colwidth(4) = 1000
    colwidth(5) = 1500
    colwidth(6) = 1500
    colwidth(7) = 100
    
    If blockTellerAction Then
       frmManualBlkPendingList.Caption = frmBlockPendingListCaption(1, UserLang)
       frmManualBlkPendingList.lblManualBlkPendingList = frmBlockPendingListCaption(3, UserLang)
    ElseIf blockSupervisorAction Then
       frmManualBlkPendingList.Caption = frmBlockPendingListCaption(0, UserLang)
       frmManualBlkPendingList.lblManualBlkPendingList = frmBlockPendingListCaption(2, UserLang)
    End If
    
    frmManualBlkPendingList.cmdVerify.Caption = frmBlockPendingListCaption(12, UserLang)
    frmManualBlkPendingList.cmdCancel.Caption = frmBlockPendingListCaption(13, UserLang)
    frmManualBlkPendingList.cmdMore.Caption = frmBlockPendingListCaption(14, UserLang)
    
    lblCustomerNo.Caption = errCustomerNo(UserLang)
    cmdCheckPendingList.Caption = errCheckPendingList(UserLang)
    
    manualBlkPendingGrid.Clear
    manualBlkPendingGrid.Row = 0
    manualBlkPendingGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 7
      manualBlkPendingGrid.Col = i
      If UserLang = ARABIC Then
         manualBlkPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      manualBlkPendingGrid.text = frmBlockPendingListCaption(i + 4, UserLang)
      manualBlkPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    
    manualBlkPendingGrid.Width = tWidth + 100

    For i = 1 To Val(recvBlockPendingList.noOfRecs)
      manualBlkPendingGrid.Row = i
      manualBlkPendingGrid.Col = 0
      manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      manualBlkPendingGrid.text = recvBlockPendingList.details(i).userId
      manualBlkPendingGrid.Col = 1
      manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      manualBlkPendingGrid.text = recvBlockPendingList.details(i).dateTime
      manualBlkPendingGrid.Col = 2
      manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      manualBlkPendingGrid.text = recvBlockPendingList.details(i).cardNo
      manualBlkPendingGrid.Col = 3
      manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      manualBlkPendingGrid.text = recvBlockPendingList.details(i).bmAccNo
      manualBlkPendingGrid.Col = 4
      manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      tCode = recvBlockPendingList.details(i).action
      If tCode = "N" Then
         tmpStr = tCode & "-New blocking"
      ElseIf tCode = "A" Then
         tmpStr = tCode & "-Amend"
      ElseIf tCode = "D" Then
         tmpStr = tCode & "-Delete"
      Else
         tmpStr = tCode & "-Invalid action"
      End If
      tCode = Mid$(recvBlockPendingList.details(i).bmAccNo, 1, 2)
      Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                                "where currencycode = '" & tCode & "'")

      If rs.recordCount > 0 Then
         tDecimalPlace = rs(0)
      Else
         tDecimalPlace = "2"
      End If

      If tDecimalPlace = "3" Then
         amtDenom = 1000
      ElseIf tDecimalPlace = "2" Then
         amtDenom = 100
      ElseIf tDecimalPlace = "1" Then
         amtDenom = 10
      Else
         amtDenom = 1
      End If

      manualBlkPendingGrid.text = tmpStr
      manualBlkPendingGrid.Col = 5
      manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      manualBlkPendingGrid.text = Format(Val(recvBlockPendingList.details(i).oldAmt) / amtDenom, "##########0" & _
                                                     IIf(CInt(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
          
      manualBlkPendingGrid.Col = 6
      manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      manualBlkPendingGrid.text = Format(Val(recvBlockPendingList.details(i).blockAmt) / amtDenom, "##########0" & _
                                                     IIf(CInt(tDecimalPlace) <> 0, "." & String(Val(tDecimalPlace), "0"), ""))
      manualBlkPendingGrid.Col = 7
      manualBlkPendingGrid.CellAlignment = flexAlignLeftCenter
      manualBlkPendingGrid.text = recvBlockPendingList.details(i).supervisorComments
   Next i
   manualBlkPendingGrid.Row = 1
   
   CSD_mdiForm.staticStatus.Panels(3).text = " "
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Private Sub manualBlkPendingGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub manualBlkPendingGrid_DblClick()
   Dim tuserId As String * 10
    Dim tDateTime As String * 14
    Dim tAccNo As String
    Dim tCardNo As String
    Dim tCustName As String
    Dim tOldAmt As String
    Dim tBlockAmt As String
    Dim tAction As String
    
    manualBlkPendingGrid.Col = 0
    tuserId = Format(manualBlkPendingGrid.text, "!@@@@@@@@@@")
    manualBlkPendingGrid.Col = 1
    tDateTime = Format(manualBlkPendingGrid.text, "!@@@@@@@@@@@@@@")
    manualBlkPendingGrid.Col = 2
    tCardNo = Format(manualBlkPendingGrid.text, "!@@@@@@@@@@@@@@@@")
    manualBlkPendingGrid.Col = 3
    tAccNo = Format(manualBlkPendingGrid.text, "!@@@@@@@@@@@@@@")
    manualBlkPendingGrid.Col = 4
    tAction = Mid$(manualBlkPendingGrid.text, 1, 1)
    manualBlkPendingGrid.Col = 5
    tOldAmt = manualBlkPendingGrid.text
    manualBlkPendingGrid.Col = 6
    tBlockAmt = manualBlkPendingGrid.text
    
    If Len(RTrim(tuserId)) = 0 And Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    
    frmManualBlock.txtCardNo = tCardNo
    frmManualBlock.txtAccNo = tAccNo
    If tAction = "N" Then
       blockAddAction = True
       blockUpdAction = False
       blockDelAction = False
       frmManualBlock.lblAction = frmManualBlockCaption(1, UserLang)
       frmManualBlock.lblOldAmt.Visible = False
       frmManualBlock.txtOldAmt.Visible = False
    ElseIf tAction = "A" Then  ' only for amend, old amount should be displayed
       frmManualBlock.lblOldAmt.Visible = True
       frmManualBlock.txtOldAmt.Visible = True
       frmManualBlock.lblOldAmt.Refresh
       frmManualBlock.txtOldAmt.Refresh
       frmManualBlock.txtOldAmt = tOldAmt
       frmManualBlock.lblAction = frmManualBlockCaption(2, UserLang)
       blockUpdAction = True
       blockAddAction = False
       blockDelAction = False
    ElseIf tAction = "D" Then
       frmManualBlock.lblAction = frmManualBlockCaption(3, UserLang)
       blockDelAction = True
       blockAddAction = False
       blockUpdAction = False
       frmManualBlock.lblOldAmt.Visible = False
       frmManualBlock.txtOldAmt.Visible = False
    End If
    If frmManualBlkPendingList.tag = "A" Then
       frmManualBlock.txtCardNo.Enabled = False
       frmManualBlock.txtCardNo.Visible = False
       frmManualBlock.lblCardNo.Visible = False
    Else
       frmManualBlock.txtCardNo.Visible = True
       frmManualBlock.txtCardNo.Refresh
       frmManualBlock.lblCardNo.Visible = True
       frmManualBlock.lblCardNo.Refresh
    End If
    frmManualBlock.txtBlockAmt = tBlockAmt
    frmManualBlock.tag = frmManualBlkPendingList.tag
        
    frmManualBlock.Show vbModal
End Sub
