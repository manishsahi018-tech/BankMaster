VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmChqReceipt 
   BackColor       =   &H00BFD87E&
   Caption         =   "Cheque Book Received By Branch"
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
   Begin VB.CheckBox chkSelectAll 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10200
      TabIndex        =   26
      Top             =   360
      Width           =   255
   End
   Begin VB.CheckBox chk1 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   22
      Top             =   1440
      Width           =   255
   End
   Begin VB.CheckBox chk2 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   21
      Top             =   1680
      Width           =   255
   End
   Begin VB.CheckBox chk15 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   20
      Top             =   4800
      Width           =   255
   End
   Begin VB.CheckBox chk12 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   19
      Top             =   4080
      Width           =   255
   End
   Begin VB.CheckBox chk13 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   18
      Top             =   4320
      Width           =   255
   End
   Begin VB.CheckBox chk11 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   17
      Top             =   3840
      Width           =   255
   End
   Begin VB.CheckBox chk3 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   16
      Top             =   1920
      Width           =   255
   End
   Begin VB.CheckBox chk9 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   15
      Top             =   3360
      Width           =   255
   End
   Begin VB.CheckBox chk6 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   14
      Top             =   2640
      Width           =   255
   End
   Begin VB.CheckBox chk14 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   13
      Top             =   4560
      Width           =   255
   End
   Begin VB.CheckBox chk8 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   12
      Top             =   3120
      Width           =   255
   End
   Begin VB.CheckBox chk10 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   11
      Top             =   3600
      Width           =   255
   End
   Begin VB.CheckBox chk5 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   10
      Top             =   2400
      Width           =   255
   End
   Begin VB.CheckBox chk4 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   9
      Top             =   2160
      Width           =   255
   End
   Begin VB.CheckBox chk7 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   8
      Top             =   2880
      Width           =   255
   End
   Begin VB.CheckBox chk18 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   7
      Top             =   5520
      Width           =   255
   End
   Begin VB.CheckBox chk16 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   6
      Top             =   5040
      Width           =   255
   End
   Begin VB.CheckBox chk19 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   5
      Top             =   5760
      Width           =   255
   End
   Begin VB.CheckBox chk17 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   4
      Top             =   5280
      Width           =   255
   End
   Begin VB.CheckBox chk20 
      BackColor       =   &H00BFD87E&
      Height          =   255
      Left            =   10800
      TabIndex        =   3
      Top             =   6000
      Width           =   255
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4320
      TabIndex        =   2
      ToolTipText     =   "Cancel"
      Top             =   7320
      Width           =   1335
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update Status"
      Height          =   375
      Left            =   3000
      TabIndex        =   1
      ToolTipText     =   "Update Status"
      Top             =   7320
      Width           =   1335
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   1680
      TabIndex        =   0
      ToolTipText     =   "More"
      Top             =   7320
      Width           =   1335
   End
   Begin MSFlexGridLib.MSFlexGrid chqBkInfo 
      Height          =   5535
      Left            =   360
      TabIndex        =   23
      Top             =   1200
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   9763
      _Version        =   393216
      Rows            =   26
      Cols            =   7
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label Label1 
      BackColor       =   &H00BFD87E&
      Caption         =   "Select all"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   10560
      TabIndex        =   27
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label lblChequeReceipt 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cheque-Book Received by Branch"
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
      Left            =   3480
      TabIndex        =   25
      Top             =   360
      Width           =   5055
   End
   Begin VB.Label lblOK 
      BackColor       =   &H00BFD87E&
      Caption         =   "Received"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   10560
      TabIndex        =   24
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "frmChqReceipt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub chkSelectAll_Click()
    If chkSelectAll.Value = "1" Then
       chk1.Value = "1"
       chk2.Value = "1"
       chk3.Value = "1"
       chk4.Value = "1"
       chk5.Value = "1"
       chk6.Value = "1"
       chk7.Value = "1"
       chk8.Value = "1"
       chk9.Value = "1"
       chk10.Value = "1"
       chk11.Value = "1"
       chk12.Value = "1"
       chk13.Value = "1"
       chk14.Value = "1"
       chk15.Value = "1"
       chk16.Value = "1"
       chk17.Value = "1"
       chk18.Value = "1"
       chk19.Value = "1"
       chk20.Value = "1"
    Else
       chk1.Value = "0"
       chk2.Value = "0"
       chk3.Value = "0"
       chk4.Value = "0"
       chk5.Value = "0"
       chk6.Value = "0"
       chk7.Value = "0"
       chk8.Value = "0"
       chk9.Value = "0"
       chk10.Value = "0"
       chk11.Value = "0"
       chk12.Value = "0"
       chk13.Value = "0"
       chk14.Value = "0"
       chk15.Value = "0"
       chk16.Value = "0"
       chk17.Value = "0"
       chk18.Value = "0"
       chk19.Value = "0"
       chk20.Value = "0"
    End If
End Sub

Private Sub chqBkInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub

Private Sub cmdCancel_Click()
  Unload Me
End Sub

Private Sub cmdMore_Click()
   If recvChqBkStatusListMsg.noOfRecs <> "20" Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   frmAccountGrid.readChqBkStatusList recvChqBkStatusListMsg.lastRecCount, frmChqReceipt.tag
 
   If recvChqBkStatusListMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   
   Form_Load
End Sub

Private Sub cmdUpdate_Click()
  Dim i As Integer, noOfRecs As Integer
  Dim chkVar As String
  Dim tAccNo As String
  Dim tReqDate As String
  Dim tmpStr As String
  Dim strmsglen As String
  
  chqBkStatusUpdateMsg.msgLen = "000000"
  chqBkStatusUpdateMsg.service = "39"
  chqBkStatusUpdateMsg.homeBranch = gBranchCode
  chqBkStatusUpdateMsg.userId = Format(gUserId, "!@@@@@@@@@@")
  If frmChqReceipt.tag = "2" Then
     chqBkStatusUpdateMsg.requestStatus = "3"
  Else
     chqBkStatusUpdateMsg.requestStatus = "4"
  End If
  chqBkStatusUpdateMsg.noOfRecs = "00"
  
  noOfRecs = 0
  For i = 1 To Val(recvChqBkStatusListMsg.noOfRecs)
      chqBkInfo.Row = i
      chqBkInfo.Col = 0
      tAccNo = Format(chqBkInfo.text, "!@@@@@@@@@@@@@@@@@@@")
      chqBkInfo.Col = 4
      tmpStr = chqBkInfo.text
      tReqDate = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2)
      
      If Len(RTrim(tAccNo)) = 0 And Len(RTrim(tReqDate)) = 0 Then
         Exit For
      End If
      
      If i = 1 Then
         If chk1.Value = 1 Then
            noOfRecs = noOfRecs + 1
            chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
            chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
         End If
      ElseIf i = 2 And chk2.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
         chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 3 And chk3.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
         chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 4 And chk4.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
         chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 5 And chk5.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
         chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 6 And chk6.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
         chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 7 And chk7.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 8 And chk8.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 9 And chk9.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 10 And chk10.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 11 And chk11.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 12 And chk12.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 13 And chk13.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 14 And chk14.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 15 And chk15.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 16 And chk16.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 17 And chk17.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 18 And chk18.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 19 And chk19.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
          chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      ElseIf i = 20 And chk20.Value = 1 Then
         noOfRecs = noOfRecs + 1
         chqBkStatusUpdateMsg.accNo(noOfRecs) = tAccNo
         chqBkStatusUpdateMsg.requestDate(noOfRecs) = tReqDate
      End If
  Next
  
  chqBkStatusUpdateMsg.noOfRecs = Format(str(noOfRecs), "00")
  
  If noOfRecs = 0 Then
     MsgBox errNoRowSelectedForUpdate(UserLang)   ' "No row selected for update..Please select and click update"
     Exit Sub
  End If

  SendMsg = chqBkStatusUpdateMsg.msgLen + chqBkStatusUpdateMsg.service + _
            chqBkStatusUpdateMsg.homeBranch + chqBkStatusUpdateMsg.userId + _
            chqBkStatusUpdateMsg.noOfRecs + _
            chqBkStatusUpdateMsg.requestStatus + Space(10)
            
   For i = 1 To Val(chqBkStatusUpdateMsg.noOfRecs)
       SendMsg = SendMsg + chqBkStatusUpdateMsg.accNo(i) + chqBkStatusUpdateMsg.requestDate(i)
   Next
     
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
      
   frmChqReceipt.MousePointer = vbHourglass
   frmChqReceipt.cmdCancel.Enabled = False
   frmChqReceipt.cmdUpdate.Enabled = False
   frmChqReceipt.cmdMore.Enabled = False
   frmChqReceipt.chqBkInfo.Enabled = False
   
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmChqReceipt.MousePointer = vbDefault
      frmChqReceipt.cmdCancel.Enabled = True
      frmChqReceipt.cmdUpdate.Enabled = True
      frmChqReceipt.cmdMore.Enabled = True
      frmChqReceipt.chqBkInfo.Enabled = True
      Exit Sub
   End If
   
   frmChqReceipt.MousePointer = vbDefault
   frmChqReceipt.cmdCancel.Enabled = True
   frmChqReceipt.cmdUpdate.Enabled = True
   frmChqReceipt.cmdMore.Enabled = True
   frmChqReceipt.chqBkInfo.Enabled = True
   
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ENGLISH Then
         MsgBox recvCustomerMsg.eRemarks
      Else
         MsgBox recvCustomerMsg.aRemarks
      End If
      Unload Me
      Exit Sub
   End If
   
   cmdUpdate.tag = ""
   frmChqReceipt.tag = ""
   Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
End Sub

Private Sub Form_Load()
   Dim flexRow As Integer, tWidth As Integer, colwidth(8) As Integer
   Dim rowTitle(8) As String
   Dim tmpStr As String, tCode As String
   Dim i As Integer
   Static lastRecRead As String * 3
    
   colwidth(0) = 1700
   colwidth(1) = 2500
   colwidth(2) = 1200
   colwidth(3) = 1200
   colwidth(4) = 1400
   colwidth(5) = 1400
   colwidth(6) = 900
    
'   If UserLang = ARABIC Then
'      ChangePositions frmChqReceipt, 11800
'      frmChqReceipt.RightToLeft = True
'      frmChqReceipt.Hide
'   End If
   
'   rowTitle(0) = "Account Number"
'   rowTitle(1) = "Account Name"
'   rowTitle(2) = "Request.Branch"
'   rowTitle(3) = "Cheque Type"
'   rowTitle(4) = "ChqBook req.Date"
'   rowTitle(5) = "ChqBook Prod.Date"
'   rowTitle(6) = "# Books Requested"
   
   frmChqReceipt.cmdMore.Caption = frmChqReceiptCaption(9, UserLang)
   frmChqReceipt.cmdUpdate.Caption = frmChqReceiptCaption(10, UserLang)
   frmChqReceipt.cmdCancel.Caption = frmChqReceiptCaption(11, UserLang)
   
   chqBkInfo.Clear
   chqBkInfo.Row = 0
   chqBkInfo.Font.Bold = True
   
   tWidth = 0
   For i = 0 To 6
       chqBkInfo.Col = i
       If UserLang = ARABIC Then
          chqBkInfo.CellAlignment = flexAlignRightCenter
       Else
          chqBkInfo.CellAlignment = flexAlignLeftCenter
       End If
       chqBkInfo.text = frmChqReceiptCaption(i + 2, UserLang)
       chqBkInfo.colwidth(i) = colwidth(i)
       tWidth = tWidth + colwidth(i)
   Next i
   
   chqBkInfo.Width = tWidth + 100
   
   For i = 1 To Val(recvChqBkStatusListMsg.noOfRecs)
      chqBkInfo.Row = i
      chqBkInfo.Col = 0
      chqBkInfo.CellAlignment = flexAlignLeftCenter
      chqBkInfo.text = recvChqBkStatusListMsg.details(i).accNo
'      tCode = Mid$(recvChqBkStatusListMsg.details(i).accNo, 3, 3)
'      tmpStr = "select arabicname, englishname from bmledgerinfo " & _
'               "where ledgercode = '" & tCode & "'"
'      chqBkInfo.Col = 1
'      chqBkInfo.CellAlignment = flexAlignLeftCenter
'      Set rs = db.OpenRecordset(tmpStr)
'      If rs.recordCount > 0 Then
'         If UserLang = ARABIC Then
'            chqBkInfo.text = rs(0)
'         Else
'            chqBkInfo.text = rs(1)
'         End If
'      End If

      chqBkInfo.Col = 1
      chqBkInfo.CellAlignment = flexAlignLeftCenter
      chqBkInfo.text = recvChqBkStatusListMsg.details(i).custName
      chqBkInfo.Col = 2
      chqBkInfo.CellAlignment = flexAlignLeftCenter
      chqBkInfo.text = recvChqBkStatusListMsg.details(i).requestUserId
      chqBkInfo.Col = 3
      chqBkInfo.CellAlignment = flexAlignLeftCenter
      If recvChqBkStatusListMsg.details(i).chequeType = "1" Then
         chqBkInfo.text = frmChequeBookGridCaption(15, UserLang)    '"Personal"
      Else
         chqBkInfo.text = frmChequeBookGridCaption(16, UserLang)    '"Corporate"
      End If
      chqBkInfo.Col = 4
      chqBkInfo.CellAlignment = flexAlignLeftCenter
      chqBkInfo.text = formatDate(recvChqBkStatusListMsg.details(i).requestedDate)
      chqBkInfo.Col = 5
      chqBkInfo.CellAlignment = flexAlignLeftCenter
      chqBkInfo.text = formatDate(recvChqBkStatusListMsg.details(i).producedDate)
      chqBkInfo.Col = 6
      chqBkInfo.CellAlignment = flexAlignLeftCenter
      chqBkInfo.text = recvChqBkStatusListMsg.details(i).booksRequested
   Next i
   chqBkInfo.Row = 1
   
   frmChqReceipt.Show
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
End Sub
