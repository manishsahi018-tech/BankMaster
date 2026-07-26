VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmAcctPendingList 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account Pending Activities"
   ClientHeight    =   3195
   ClientLeft      =   2580
   ClientTop       =   1920
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4185
      TabIndex        =   6
      ToolTipText     =   "Check pending List"
      Top             =   735
      Width           =   2295
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   285
      Left            =   2385
      MaxLength       =   7
      TabIndex        =   5
      Top             =   780
      Width           =   1575
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   1560
      TabIndex        =   4
      ToolTipText     =   "More"
      Top             =   7650
      Width           =   1575
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   495
      Left            =   3120
      TabIndex        =   3
      ToolTipText     =   "Verify Selected Record"
      Top             =   7650
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5160
      TabIndex        =   2
      ToolTipText     =   "Cancel"
      Top             =   7650
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid accPendingGrid 
      Height          =   6255
      Left            =   360
      TabIndex        =   1
      Top             =   1290
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   11033
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
      Left            =   375
      TabIndex        =   7
      Top             =   780
      Width           =   1935
   End
   Begin VB.Label lblPendingActivities 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Pending Activities"
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
      Left            =   2160
      TabIndex        =   0
      Top             =   165
      Width           =   6855
   End
End
Attribute VB_Name = "frmAcctPendingList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub accPendingGrid_DblClick()
    Dim tuserId As String * 10
    Dim tDateTime As String * 14
    Dim tBranchCode As String * 4
    Dim strmsglen
    Dim response
    Dim abcStr As String
    Dim tmpStr As String
    
    accPendingGrid.Col = 0
    tuserId = Format(accPendingGrid.text, "!@@@@@@@@@@")
    accPendingGrid.Col = 1
    tDateTime = Format(accPendingGrid.text, "00000000000000")
    tBranchCode = gBranchCode
    
    If Len(RTrim(tuserId)) = 0 And Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
          
    SendMsg = "000048" & "33" & tBranchCode & "01" & tuserId & tDateTime & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmAcctPendingList.MousePointer = vbHourglass
    frmAcctPendingList.cmdCancel.Enabled = False
    frmAcctPendingList.cmdVerify.Enabled = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
       
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmAcctPendingList.MousePointer = vbDefault
       frmAcctPendingList.cmdCancel.Enabled = True
       frmAcctPendingList.cmdVerify.Enabled = True
       Exit Sub
    End If
    parseAcctDetailMsg
    frmAcctPendingList.MousePointer = vbDefault
    frmAcctPendingList.cmdCancel.Enabled = True
    frmAcctPendingList.cmdVerify.Enabled = True
    If recvAccPendingDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvAccPendingDetail.aRemarks
       Else
          MsgBox recvAccPendingDetail.eRemarks
       End If
       Exit Sub
    End If
    
    If recvAccPendingDetail.foundInTlist = "1" Then
       response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
       If response = vbYes Then
          fillSearchEngineForm Val(recvAccPendingDetail.noOfRecs)
          frmSearchEngine.Show vbModal
       End If
    End If
    
    If recvAccPendingDetail.domantActivationUpd = "1" Then
       frmAccDormant.Show
       frmAccDormant.txtDateTime = formatDate(Mid$(tDateTime, 1, 8)) & " " & _
                                    formatTime(Mid$(tDateTime, 9, 6))
       frmAccDormant.txtCsoUserId = tuserId
       fillAccDormantForm
    Else
       frmAccount.Show
       fillAccountDetailsForm
       If recvAccPendingDetail.signatoryForOthers = "1" Then
          MsgBox errSignatoryForOthers(UserLang)
       End If
    End If

End Sub

Private Sub accPendingGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

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
  If accSupervisorAction = True Then
     frmEnquiry.readAccPendingList "00000", "S", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readAccPendingList "00000", "T", Format(txtCustomerNo, "0000000")
  End If
    
  If recvAccPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load
End Sub

Private Sub cmdMore_Click()
     
  If recvAccPendingList.noOfRecs <> 20 Then
     MsgBox errNoMatchFound(UserLang) '"No more match found..."
     Exit Sub
  End If
  If accSupervisorAction = True Then
     frmEnquiry.readAccPendingList recvAccPendingList.lastRecCount, "S", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readAccPendingList recvAccPendingList.lastRecCount, "T", Format(txtCustomerNo, "0000000")
  End If
    
  If recvAccPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdVerify_Click()
    accPendingGrid_DblClick
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim flexRow, tWidth, colwidth(8) As Integer
   Dim rowTitle(8) As String
   Dim i As Integer
   Static lastRecRead As String * 3
   Dim tCode, tmpStr As String
    
   colwidth(0) = 1200
   colwidth(1) = 1600
   colwidth(2) = 1700
   colwidth(3) = 1500
   colwidth(4) = 1200
             
'    rowTitle(0) = "User Id"
'    rowTitle(1) = "Date&Time"
'    rowTitle(2) = "Account Number"
'    rowTitle(3) = "Account Status"
'    rowTitle(4) = "Branch code"

'    If UserLang = ARABIC Then
'       ChangePositions frmAcctPendingList, 12000
'       frmAcctPendingList.RightToLeft = True
'    End If
    
    If accSupervisorAction Then
       frmAcctPendingList.Caption = frmAcctPendingListCaption(0, UserLang)
       frmAcctPendingList.lblPendingActivities = frmAcctPendingListCaption(0, UserLang)
    Else
       frmAcctPendingList.Caption = frmAcctPendingListCaption(1, UserLang)
       frmAcctPendingList.lblPendingActivities = frmAcctPendingListCaption(1, UserLang)
    End If
    
    frmAcctPendingList.cmdMore.Caption = frmAcctPendingListCaption(7, UserLang)
    frmAcctPendingList.cmdVerify.Caption = frmAcctPendingListCaption(8, UserLang)
    frmAcctPendingList.cmdCancel.Caption = frmAcctPendingListCaption(9, UserLang)
    lblCustomerNo.Caption = errCustomerNo(UserLang)
    cmdCheckPendingList.Caption = errCheckPendingList(UserLang)
        
    accPendingGrid.Clear
    accPendingGrid.Row = 0
    accPendingGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 4
      accPendingGrid.Col = i
      If UserLang = ARABIC Then
         accPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         accPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      accPendingGrid.text = frmAcctPendingListCaption(i + 2, UserLang)
      accPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    accPendingGrid.Width = tWidth + 500
    
    For i = 1 To Val(recvAccPendingList.noOfRecs)
      accPendingGrid.Row = i
      accPendingGrid.Col = 0
      accPendingGrid.CellAlignment = flexAlignLeftCenter
      accPendingGrid.text = Left(recvAccPendingList.details(i).userId, 10)
      accPendingGrid.Col = 1
      accPendingGrid.text = recvAccPendingList.details(i).dateTime
      accPendingGrid.Col = 2
      accPendingGrid.CellAlignment = flexAlignLeftCenter
      accPendingGrid.text = recvAccPendingList.details(i).accNo
      accPendingGrid.Col = 3
      tCode = recvAccPendingList.details(i).accStatus
      Set rs = db.OpenRecordset("select arabicname,englishname from accountstatusinfo " + _
                               "where statuscode = '" + tCode + "'")
      If rs.recordCount > 0 Then
         If UserLang = ENGLISH Then
            tmpStr = tCode + "-" + rs(1)
         Else
            tmpStr = tCode + "-" + rs(0)
         End If
      End If
      accPendingGrid.text = tmpStr
      accPendingGrid.Col = 4
      accPendingGrid.text = recvAccPendingList.details(i).branchCode
   Next i
   accPendingGrid.Row = 1
   
   CSD_mdiForm.staticStatus.Panels(3).text = errSelectOneMatch(UserLang)
        
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

