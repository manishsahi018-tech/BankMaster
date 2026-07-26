VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmStopChqPendingList 
   BackColor       =   &H00BFD87E&
   Caption         =   "Stop Cheque Pending List"
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
      Left            =   2625
      MaxLength       =   7
      TabIndex        =   0
      Top             =   1020
      Width           =   1575
   End
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4425
      TabIndex        =   1
      ToolTipText     =   "Check pending List"
      Top             =   975
      Width           =   2295
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   1080
      TabIndex        =   2
      ToolTipText     =   "More"
      Top             =   6735
      Width           =   1695
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   4800
      TabIndex        =   6
      ToolTipText     =   "Cancel"
      Top             =   6735
      Width           =   1695
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   495
      Left            =   2760
      TabIndex        =   4
      ToolTipText     =   "Verify Selected Record"
      Top             =   6735
      Width           =   2055
   End
   Begin MSFlexGridLib.MSFlexGrid stopChqPendingGrid 
      Height          =   4935
      Left            =   600
      TabIndex        =   3
      Top             =   1455
      Width           =   11055
      _ExtentX        =   19500
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
      Left            =   615
      TabIndex        =   7
      Top             =   1020
      Width           =   1935
   End
   Begin VB.Label lblPendingActivities 
      BackColor       =   &H00BFD87E&
      Caption         =   "Stop Cheque Pending List"
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
      Left            =   1200
      TabIndex        =   5
      Top             =   165
      Width           =   10695
   End
End
Attribute VB_Name = "frmStopChqPendingList"
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
  If stopChqSupervisorAction = True Then
     frmEnquiry.readStopChqPendingList "00000", "S", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readStopChqPendingList "00000", "T", Format(txtCustomerNo, "0000000")
  End If
    
  If recvStopChqPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load
End Sub

Private Sub cmdMore_Click()
  If recvStopChqPendingList.noOfRecs <> 20 Then
     MsgBox errNoMatchFound(UserLang) '"No more match found..."
     Exit Sub
  End If
  If stopChqSupervisorAction = True Then
     frmEnquiry.readStopChqPendingList recvStopChqPendingList.lastRecCount, "S", Format(txtcustomernumber, "0000000")
  Else
     frmEnquiry.readStopChqPendingList recvStopChqPendingList.lastRecCount, "T", Format(txtcustomernumber, "0000000")
  End If
    
  If recvStopChqPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdVerify_Click()
    stopChqPendingGrid_DblClick
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
    colwidth(5) = 2000
   
'    If UserLang = ARABIC Then
'       ChangePositions frmStopChqPendingList, 12000
'       frmStopChqPendingList.RightToLeft = True
'    End If
    
    If stopChqSupervisorAction Then
       frmStopChqPendingList.Caption = frmStopChqPendingListCaption(0, UserLang)
       frmStopChqPendingList.lblPendingActivities.Caption = frmStopChqPendingListCaption(0, UserLang)
    Else
       frmStopChqPendingList.Caption = frmStopChqPendingListCaption(1, UserLang)
       frmStopChqPendingList.lblPendingActivities.Caption = frmStopChqPendingListCaption(1, UserLang)
    End If
    
    frmStopChqPendingList.cmdMore.Caption = frmStopChqPendingListCaption(8, UserLang)
    frmStopChqPendingList.cmdVerify.Caption = frmStopChqPendingListCaption(9, UserLang)
    frmStopChqPendingList.cmdCancel.Caption = frmStopChqPendingListCaption(10, UserLang)
    lblCustomerNo.Caption = errCustomerNo(UserLang)
    cmdCheckPendingList.Caption = errCheckPendingList(UserLang)
    
'    rowTitle(0) = "User Id"
'    rowTitle(1) = "Date&Time"
'    rowTitle(2) = "Account Number"
'    rowTitle(3) = "Cheque Number"
'    rowTitle(4) = "Reason"
'    rowTitle(5) = "Pending Type"
            
    stopChqPendingGrid.Clear
    stopChqPendingGrid.Row = 0
    stopChqPendingGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 5
      stopChqPendingGrid.Col = i
      If UserLang = ARABIC Then
         stopChqPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         stopChqPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      stopChqPendingGrid.text = frmStopChqPendingListCaption(i + 2, UserLang)
      stopChqPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    stopChqPendingGrid.Width = tWidth + 300
    
    For i = 1 To Val(recvStopChqPendingList.noOfRecs)
      stopChqPendingGrid.Row = i
      stopChqPendingGrid.Col = 0
      stopChqPendingGrid.text = recvStopChqPendingList.details(i).userId
      stopChqPendingGrid.Col = 1
      stopChqPendingGrid.text = recvStopChqPendingList.details(i).dateTime
      stopChqPendingGrid.Col = 2
      stopChqPendingGrid.CellAlignment = flexAlignLeftCenter
      stopChqPendingGrid.text = recvStopChqPendingList.details(i).accNo
      stopChqPendingGrid.Col = 3
      stopChqPendingGrid.text = recvStopChqPendingList.details(i).chequeNo
      stopChqPendingGrid.Col = 4
      stopChqPendingGrid.CellAlignment = flexAlignLeftCenter
      stopChqPendingGrid.text = recvStopChqPendingList.details(i).reason
      stopChqPendingGrid.Col = 5
      stopChqPendingGrid.CellAlignment = flexAlignLeftCenter
      stopChqPendingGrid.text = recvStopChqPendingList.details(i).pendingType
   Next i
   stopChqPendingGrid.Row = 1
   
   CSD_mdiForm.staticStatus.Panels(3).text = errSelectOneMatch(UserLang)
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Private Sub stopChqPendingGrid_DblClick()
    Dim tUserid As String * 10
    Dim tDateTime As String * 14
    Dim tChqNo As String * 10
    
    stopChqPendingGrid.Col = 0
    tUserid = Format(stopChqPendingGrid.text, "!@@@@@@@@@@")
    stopChqPendingGrid.Col = 1
    tDateTime = Format(stopChqPendingGrid.text, "!@@@@@@@@@@@@@@")
        
    If Len(RTrim(tUserid)) = 0 And Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
        
    SendMsg = "000000" + "46" + gBranchCode + "01" + tUserid + tDateTime + Space(10)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
     
    frmStopChqPendingList.MousePointer = vbHourglass
    
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmStopChqPendingList.MousePointer = vbDfault
       Exit Sub
    End If
    frmStopChqPendingList.MousePointer = vbDefault
    parseStopChqDetail
    frmStopChqDetails.Show
    fillFrmStopChqDetail
    frmStopChqDetails.Show
End Sub

Private Sub stopChqPendingGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
