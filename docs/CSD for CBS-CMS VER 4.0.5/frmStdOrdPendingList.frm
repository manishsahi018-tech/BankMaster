VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmStdOrdPendingList 
   BackColor       =   &H00BFD87E&
   Caption         =   "Standing Order Pending List"
   ClientHeight    =   3195
   ClientLeft      =   4890
   ClientTop       =   1860
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
      Left            =   4530
      TabIndex        =   6
      ToolTipText     =   "Check pending List"
      Top             =   915
      Width           =   2295
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   285
      Left            =   2730
      MaxLength       =   7
      TabIndex        =   5
      Top             =   960
      Width           =   1575
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   495
      Left            =   2880
      TabIndex        =   2
      ToolTipText     =   "Verify Selected Record"
      Top             =   6840
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   4920
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   6840
      Width           =   1695
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   1200
      TabIndex        =   0
      ToolTipText     =   "More"
      Top             =   6840
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid stdOrdPendingGrid 
      Height          =   4935
      Left            =   720
      TabIndex        =   3
      Top             =   1410
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   8705
      _Version        =   393216
      Rows            =   26
      Cols            =   6
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
      Left            =   720
      TabIndex        =   7
      Top             =   960
      Width           =   1935
   End
   Begin VB.Label lblPendingActivities 
      BackColor       =   &H00BFD87E&
      Caption         =   "Standing Order Pending List"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   615
      Left            =   1080
      TabIndex        =   4
      Top             =   180
      Width           =   10215
   End
End
Attribute VB_Name = "frmStdOrdPendingList"
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
  If stdOrdSupervisorAction = True Then
     frmEnquiry.readSodPendingList "00000", "S", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readSodPendingList "00000", "T", Format(txtCustomerNo, "0000000")
  End If
    
  If recvStdOrdPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load
End Sub

Private Sub cmdMore_Click()
  If recvStdOrdPendingList.noOfRecs <> 20 Then
     MsgBox errNoMatchFound(UserLang) '"No more match found..."
     Exit Sub
  End If
  If stdOrdSupervisorAction = True Then
     frmEnquiry.readSodPendingList recvStdOrdPendingList.lastRecCount, "S", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readSodPendingList recvStdOrdPendingList.lastRecCount, "T", Format(txtCustomerNo, "0000000")
  End If
    
  If recvStdOrdPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdVerify_Click()
    stdOrdPendingGrid_DblClick
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
   colwidth(4) = 1700
   
'   If UserLang = ARABIC Then
'      ChangePositions frmStdOrdPendingList, 12000
'      frmStdOrdPendingList.RightToLeft = True
'   End If
   
   If stdOrdSupervisorAction Then
      frmStdOrdPendingList.Caption = frmStdOrdPendingListCaption(0, UserLang)
      frmStdOrdPendingList.lblPendingActivities.Caption = frmStdOrdPendingListCaption(0, UserLang)
   Else
      frmStdOrdPendingList.Caption = frmStdOrdPendingListCaption(1, UserLang)
      frmStdOrdPendingList.lblPendingActivities.Caption = frmStdOrdPendingListCaption(1, UserLang)
   End If
   frmStdOrdPendingList.cmdMore.Caption = frmStdOrdPendingListCaption(7, UserLang)
   frmStdOrdPendingList.cmdVerify.Caption = frmStdOrdPendingListCaption(8, UserLang)
   frmStdOrdPendingList.cmdCancel.Caption = frmStdOrdPendingListCaption(9, UserLang)
   
   lblCustomerNo.Caption = errCustomerNo(UserLang)
   cmdCheckPendingList.Caption = errCheckPendingList(UserLang)
   
'   rowTitle(0) = "User Id"
'   rowTitle(1) = "Date&Time"
'   rowTitle(2) = "Account Number"
'   rowTitle(3) = "Sod Number"
'   rowTitle(4) = "Payment Type"
            
   stdOrdPendingGrid.Clear
   stdOrdPendingGrid.Row = 0
   stdOrdPendingGrid.Font.Bold = True
     
   tWidth = 0
   For i = 0 To 4
      stdOrdPendingGrid.Col = i
      If UserLang = ARABIC Then
         stdOrdPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         stdOrdPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      stdOrdPendingGrid.text = frmStdOrdPendingListCaption(i + 2, UserLang)
      stdOrdPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
   Next i
'   stdOrdPendingGrid.Width = tWidth + 100
    
   For i = 1 To Val(recvStdOrdPendingList.noOfRecs)
      stdOrdPendingGrid.Row = i
      stdOrdPendingGrid.Col = 0
      stdOrdPendingGrid.text = recvStdOrdPendingList.details(i).userId
      stdOrdPendingGrid.Col = 1
      stdOrdPendingGrid.text = recvStdOrdPendingList.details(i).dateTime
      stdOrdPendingGrid.Col = 2
      stdOrdPendingGrid.CellAlignment = flexAlignLeftCenter
      stdOrdPendingGrid.text = recvStdOrdPendingList.details(i).accNo
      stdOrdPendingGrid.Col = 3
      stdOrdPendingGrid.text = recvStdOrdPendingList.details(i).sodNo
      stdOrdPendingGrid.Col = 4
      tCode = recvStdOrdPendingList.details(i).paymentType
      mQry = "select arabicname, englishname from paymenttypeinfo where " & _
             "paymenttype = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            tmpStr = rs(0)
         Else
            tmpStr = rs(1)
         End If
      End If
      stdOrdPendingGrid.CellAlignment = flexAlignLeftCenter
      stdOrdPendingGrid.text = tCode & " - " & tmpStr
   Next i
   stdOrdPendingGrid.Row = 1
   
'   CSD_mdiForm.staticStatus.Panels(3).Text = errSelectOneMatch(UserLang)
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Private Sub stdOrdPendingGrid_DblClick()
   Dim tUserid As String * 10
    Dim tDateTime As String * 14
    Dim strmsglen As String
    Dim tCode As String
    Dim tmpStr As String
    
    stdOrdPendingGrid.Col = 0
    tUserid = Format(stdOrdPendingGrid.text, "!@@@@@@@@@@")
    stdOrdPendingGrid.Col = 1
    tDateTime = Format(stdOrdPendingGrid.text, "00000000000000")
     
    If Len(RTrim(tUserid)) = 0 And _
       Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
  
    SendMsg = "000000" & "43" & gBranchCode & "01" & tUserid & tDateTime & Space(6)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
     
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
    frmStdOrdGrid.parseStdOrdDetail
    frmStandingOrderDetail.Show
    frmStdOrdGrid.fillFrmStdOrdDetail
    frmStandingOrderDetail.Show
End Sub

Private Sub stdOrdPendingGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
