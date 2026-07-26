VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmChequeBookGrid 
   BackColor       =   &H00BFD87E&
   Caption         =   "Cheque Book Request Information"
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
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete Cheque book request"
      Enabled         =   0   'False
      Height          =   495
      Left            =   3840
      TabIndex        =   12
      ToolTipText     =   "Delete Cheque book request"
      Top             =   7080
      Width           =   1575
   End
   Begin VB.TextBox txtCustNo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
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
      Height          =   375
      Left            =   2160
      TabIndex        =   9
      Top             =   960
      Width           =   1215
   End
   Begin VB.TextBox txtCustName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
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
      Height          =   375
      Left            =   5520
      TabIndex        =   8
      Top             =   960
      Width           =   5175
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   6855
      TabIndex        =   7
      ToolTipText     =   "More"
      Top             =   7080
      Width           =   1455
   End
   Begin VB.TextBox txtAcctNo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
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
      Height          =   375
      Left            =   7320
      TabIndex        =   4
      Top             =   240
      Width           =   2655
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "New Cheque Book Request"
      Enabled         =   0   'False
      Height          =   495
      Left            =   465
      TabIndex        =   3
      ToolTipText     =   "New Cheque Book Request"
      Top             =   7080
      Width           =   1695
   End
   Begin VB.CommandButton cmdAmend 
      Caption         =   "Amend Cheque Book Request"
      Enabled         =   0   'False
      Height          =   495
      Left            =   2160
      TabIndex        =   2
      ToolTipText     =   "Amend Cheque Book Request"
      Top             =   7080
      Width           =   1695
   End
   Begin VB.CommandButton cmdHistory 
      Caption         =   "History"
      Height          =   495
      Left            =   5415
      TabIndex        =   1
      ToolTipText     =   "History"
      Top             =   7080
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   8310
      TabIndex        =   0
      ToolTipText     =   "Exit"
      Top             =   7080
      Width           =   1455
   End
   Begin MSFlexGridLib.MSFlexGrid chequeBookGrid 
      Height          =   5415
      Left            =   240
      TabIndex        =   5
      Top             =   1440
      Width           =   11460
      _ExtentX        =   20214
      _ExtentY        =   9551
      _Version        =   393216
      Rows            =   22
      Cols            =   8
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   1
   End
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer # :"
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
      Height          =   375
      Left            =   360
      TabIndex        =   11
      Top             =   960
      Width           =   1575
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name :"
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
      Height          =   375
      Left            =   3480
      TabIndex        =   10
      Top             =   960
      Width           =   1815
   End
   Begin VB.Label lblChequeBookRequest 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cheque Book Requested for  account No."
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
      Height          =   495
      Left            =   840
      TabIndex        =   6
      Top             =   240
      Width           =   6255
   End
End
Attribute VB_Name = "frmChequeBookGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chequeBookGrid_DblClick()
    cmdHistory_Click
End Sub
Public Sub getChequeBookDetails()
  Dim tAccNo As String
  Dim tReqDate As String, tmpStr As String
  Dim strmsglen As String, tCode As String
  Dim i As Integer
  
  tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
  chequeBookGrid.Col = 4
  tmpStr = chequeBookGrid.text
  
  If Len(RTrim(tmpStr)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
  
  tReqDate = Mid$(tmpStr, 7, 4) + Mid$(tmpStr, 4, 2) + Mid$(tmpStr, 1, 2)

  LogData "Sending Request message for getting details for the account # : " & tAccNo & "  the request date " & tReqDate
  SendMsg = "000000" & "56" & gBranchCode & tAccNo & tReqDate & "D" & Space(10)
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmChequeBookGrid.MousePointer = vbHourglass
    
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmChequeBookGrid.MousePointer = vbDefault
     Exit Sub
  End If
  frmChequeBookGrid.MousePointer = vbDefault
    
  parseChequeBookDetails
  If recvChequeBookDetail.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvChequeBookDetail.aRemarks
     Else
        MsgBox recvChequeBookDetail.eRemarks
     End If
     Exit Sub
  End If
'  frmChequeBookRequest.txtAcctNo = recvChequeBookDetail.accNo
'  If recvChequeBookDetail.chequeType = "1" Then
'     frmChequeBookRequest.optPersonal = True
'  Else
'     frmChequeBookRequest.optCorporate = True
'  End If
'
'  frmChequeBookRequest.txtNoOfChequeBook = Val(recvChequeBookDetail.booksRequested)
'  tCode = recvChequeBookDetail.deliveryBranchCode
'
'  If tCode <> "" Then
'     For i = 0 To frmChequeBookRequest.cmbDeliveryBranchCode.ListCount
'         If Mid(frmChequeBookRequest.cmbDeliveryBranchCode.List(i), 1, 4) = tCode Then
'            frmChequeBookRequest.cmbDeliveryBranchCode.ListIndex = i
'            Exit For
'         End If
'     Next i
'  Else
'     frmChequeBookRequest.cmbDeliveryBranchCode.ListIndex = -1
'  End If
'  If i > frmChequeBookRequest.cmbDeliveryBranchCode.ListCount Then
'     'frmAccount.cmbBranchCode.ListIndex = -1
'     frmChequeBookRequest.cmbDeliveryBranchCode.AddItem tCode & "-not defined"
'     frmChequeBookRequest.cmbDeliveryBranchCode.ListIndex = frmChequeBookRequest.cmbDeliveryBranchCode.ListCount - 1
'  End If
'  frmChequeBookRequest.frameChequeBook.Enabled = False
'  frmChequeBookRequest.txtNoOfChequeBook.Enabled = False
'  frmChequeBookRequest.cmbDeliveryBranchCode.Enabled = False
'  frmChequeBookRequest.cmdCreate.Enabled = False
'
'  frmChequeBookRequest.Show vbModal

End Sub

Private Sub chequeBookGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdAdd_Click()
   Dim tAccNo As String
   Dim tCode As String, chqBookAllowedFlag As String
   Dim mQry As String
   
   If dormantFlag = "1" And dormantActivationAllowed = False Then
      MsgBox errDormantAcc(UserLang)
      Exit Sub
   End If
   
   mainCategoryCode = recvAccSearchMsg.samaMainCategory
   subCategoryCode = recvAccSearchMsg.samaSubCategory
   mQry = "select checkbookallowed, atmcardallowed from categoryconfiginfo " & _
          "where samamaincategory = '" & mainCategoryCode & "' " & _
          "  and samasubcategory = '" & subCategoryCode & "'"
         
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If rs(0) <> "1" Then
          MsgBox errChequeBookNotAllowed(UserLang)
          Exit Sub
       End If
    End If

   tAccNo = Format(txtAcctNo.text, "!@@@@@@@@@@@@@@")
   
   If Mid$(tAccNo, 1, 2) <> "01" Then
      MsgBox errOnlySaudiRiyalAcc(UserLang)       '"Cheque Book can be issued only to Saudi Riyal account"
      Exit Sub
   End If
   
   mQry = "select * from bmledgerinfo where ledgerCode = '" & Mid$(txtAcctNo, 3, 3) & "'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      tCode = "0"
      On Error Resume Next
      tCode = IIf(rs("chqBookAllowed") = "" Or IsNull(rs("chqBookAllowed")) = True, " ", rs("chqBookAllowed"))
      On Error GoTo 0
      If tCode <> "1" Then
         MsgBox errChequeBookNotAllowedForThisMemo(UserLang)   ' "Cheque Book not allowed for this memo...Please check"
         Exit Sub
      End If
   End If
   
'   If Mid$(tAccNo, 3, 3) <> "008" And _
'      Mid$(tAccNo, 3, 3) <> "160" Then
'      MsgBox errChequeBookOnlyFor008160(UserLang)    ' "Cheque Book can be issued only to 008/160 accounts"
'      Exit Sub
'   End If
   
   chequeBookCreateAction = True
   chequeBookUpdateAction = False
   
'   frmChequeBookRequest.frameChequeBook.Enabled = True
'   frmChequeBookRequest.txtNoOfChequeBook.Enabled = True
'   frmChequeBookRequest.cmbDeliveryBranchCode.Enabled = True
'   frmChequeBookRequest.cmdCreate.Enabled = True
'   frmChequeBookRequest.cmdPrintAppln.Enabled = True 'Enabled by Mohit on 02-12-2006 as per Arul
'   'frmChequeBookRequest.cmdPrintAppln.Enabled = False
'
'   frmChequeBookRequest.Show vbModal

End Sub

Private Sub cmdAmend_Click()
   Dim tBranchCode As String
   Dim tCode As String
   Dim tChequeType As String, booksRequested As String
   Dim requestStatus As String, tAccNo As String
   Dim mQry As String
   
   chequeBookCreateAction = False
   chequeBookUpdateAction = True
  
   tAccNo = Format(txtAcctNo.text, "!@@@@@@@@@@@@@@")
   chequeBookGrid.Col = 0
   tBranchCode = chequeBookGrid.text
   
   If Len(RTrim(tBranchCode)) = 0 Then
      MsgBox errEmptyRowSelected(UserLang)
      Exit Sub
   End If
   
   If dormantFlag = "1" And dormantActivationAllowed = False Then
      MsgBox errDormantAcc(UserLang)
      Exit Sub
   End If
   
   chequeBookGrid.Col = 2
   tChequeType = Mid$(chequeBookGrid.text, 1, 1)
   chequeBookGrid.Col = 3
   booksRequested = chequeBookGrid.text
   chequeBookGrid.Col = 5
   requestStatus = Mid$(chequeBookGrid.text, 1, 1)
   
   If requestStatus <> "1" Then
      MsgBox errChequeBookAlreadyProcessed(UserLang)     '"Cheque book Already Processed...Cannot Modify.."
      Exit Sub
   End If
  
'   frmChequeBookRequest.txtAcctNo = tAccNo
'   tCode = Mid$(tAccNo, 3, 3)
'   mQry = "select arabicname,englishname from bmledgerinfo " & _
'          "where ledgercode = '" & tCode & "'"
'
'   Set rs = db.OpenRecordset(mQry)
'   If rs.recordCount > 0 Then
'      If UserLang = ARABIC Then
'         frmChequeBookRequest.txtName = tCode & "-" & rs(0)
'      Else
'         frmChequeBookRequest.txtName = tCode & "-" & rs(1)
'      End If
'   End If
'
'   If tChequeType = "1" Then
'      frmChequeBookRequest.optPersonal.Value = True
'   Else
'      frmChequeBookRequest.optCorporate.Value = True
'   End If
'
'   frmChequeBookRequest.txtNoOfChequeBook = booksRequested
'   frmChequeBookRequest.cmdPrintAppln.Enabled = True   'Enabled by Mohit on 02-12-2006 as per Arul
'   'frmChequeBookRequest.cmdPrintAppln.Enabled = False
'
'   frmChequeBookRequest.Show vbModal
   
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdDelete_Click()
  Dim tAccNo As String
  Dim tReqDate As String, tmpStr As String
  Dim requestStatus As String
  Dim strmsglen As String
  Dim tUserid As String
  
  tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
  chequeBookGrid.Col = 4
  tmpStr = chequeBookGrid.text
  
  If Len(RTrim(tmpStr)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
  
  If dormantFlag = "1" And dormantActivationAllowed = False Then
      MsgBox errDormantAcc(UserLang)
      Exit Sub
   End If
  
  chequeBookGrid.Col = 5
  requestStatus = Mid$(chequeBookGrid.text, 1, 1)
   
   If requestStatus <> "1" Then
      MsgBox errChequeBookAlreadyProcessed(UserLang)     '"Cheque book Already Processed...Cannot Modify.."
      Exit Sub
   End If
 
  tReqDate = Mid$(tmpStr, 7, 4) + Mid$(tmpStr, 4, 2) + Mid$(tmpStr, 1, 2)

  LogData "Sending Request message to delete the cheque book request for the account # : " + tAccNo
  SendMsg = "000000" + "64" + gBranchCode + tAccNo + tReqDate
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmChequeBookGrid.MousePointer = vbHourglass
    
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmChequeBookGrid.MousePointer = vbDefault
     Exit Sub
  End If
  frmChequeBookGrid.MousePointer = vbDefault
  
  If recvCustomerMsg.status = "000" Then
     MsgBox errSuccessful(UserLang)
  Else
     If UserLang = ARABIC Then
        MsgBox recvCustomerMsg.aRemarks
     Else
        MsgBox recvCustomerMsg.eRemarks
     End If
     Exit Sub
  End If
  
  tUserid = Format(gUserId, "!@@@@@@@@@@")
    
  SendMsg = "000000" + "55" + gBranchCode + tUserid + "00000" + tAccNo
    
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
     
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     Exit Sub
  End If
   
  frmAccountGrid.parseChequeBookSearchMsg
  Unload frmChequeBookGrid
  If UserLang = ARABIC Then
     ChangePositions frmChequeBookGrid, 12000
     frmChequeBookGrid.RightToLeft = True
     frmChequeBookGrid.txtCustNo.RightToLeft = True
     frmChequeBookGrid.txtCustName.RightToLeft = True
     frmChequeBookGrid.txtCustName.Alignment = 1
     frmChequeBookGrid.txtCustNo.Alignment = 1
  End If
  frmChequeBookGrid.Show
  frmChequeBookGrid.txtAcctNo = tAccNo

End Sub

Private Sub cmdEnquiry_Click()
    chequeBookGrid_DblClick
End Sub

Private Sub cmdHistory_Click()
  Dim tAccNo As String
  Dim tReqDate As String, tmpStr As String
  Dim strmsglen As String
  
  tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
  chequeBookGrid.Col = 4
  tmpStr = chequeBookGrid.text
  
  If Len(RTrim(tmpStr)) = 0 Then
     MsgBox errEmptyRowSelected(UserLang)
     Exit Sub
  End If
  
  tReqDate = Mid$(tmpStr, 7, 4) + Mid$(tmpStr, 4, 2) + Mid$(tmpStr, 1, 2)

  LogData "Sending Request message for getting History details for the account # : " + tAccNo
  SendMsg = "000000" & "56" & gBranchCode & tAccNo & tReqDate & "H" & Space(10)
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmChequeBookGrid.MousePointer = vbHourglass
    
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmChequeBookGrid.MousePointer = vbDefault
     Exit Sub
  End If
  frmChequeBookGrid.MousePointer = vbDefault
    
  parseChequeBookHistoryDetails
  If recvChequeBookHistory.status <> "000" Then
     If UserLang = ARABIC Then
        MsgBox recvChequeBookHistory.aRemarks
     Else
        MsgBox recvChequeBookHistory.eRemarks
     End If
     Exit Sub
  End If

  frmChequeBookHistory.Show
  frmChequeBookHistory.txtAccNo = txtAcctNo
End Sub

Private Sub cmdMore_Click()
   If recvChequeBookSearchMsg.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   frmAccountGrid.searchChequeBook recvChequeBookSearchMsg.lastRecCount
    
   If recvChequeBookSearchMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   Form_Load
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim i As Integer
    Dim tWidth, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim mQry, tCode, tmpStr As String
    
    colwidth(0) = 1250
    colwidth(1) = 1400
    colwidth(2) = 1200
    colwidth(3) = 1300
    colwidth(4) = 1400
    colwidth(5) = 2000
    colwidth(6) = 1400
    colwidth(7) = 1400
    
'    rowTitle(0) = "Branch Code"
'    rowTitle(1) = "Request UserId"
'    rowTitle(2) = "Cheque Type"
'    rowTitle(3) = "# Books Requested"
'    rowTitle(4) = "Req.Date"
'    rowTitle(5) = "Request status"
'    rowTitle(6) = "From Cheque No"
'    rowTitle(7) = "To Cheque No"
    
    frmChequeBookGrid.Caption = frmChequeBookGridCaption(0, UserLang)
    frmChequeBookGrid.lblChequeBookRequest.Caption = frmChequeBookGridCaption(1, UserLang)
    frmChequeBookGrid.cmdAdd.Caption = frmChequeBookGridCaption(10, UserLang)
    frmChequeBookGrid.cmdAmend.Caption = frmChequeBookGridCaption(11, UserLang)
    frmChequeBookGrid.cmdMore.Caption = frmChequeBookGridCaption(12, UserLang)
    frmChequeBookGrid.cmdHistory.Caption = frmChequeBookGridCaption(13, UserLang)
    frmChequeBookGrid.cmdCancel.Caption = frmChequeBookGridCaption(14, UserLang)
    frmChequeBookGrid.cmdDelete.Caption = frmChequeBookGridCaption(22, UserLang)
    frmChequeBookGrid.lblCustNo.Caption = frmAccountGridCaption(22, UserLang)
    frmChequeBookGrid.lblCustName.Caption = frmAccountGridCaption(23, UserLang)
    
    txtCustNo = recvAccSearchMsg.custNo
    
    If UserLang = ARABIC Then
       If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
          txtCustName = recvAccSearchMsg.aShortName
       Else
          txtCustName = recvAccSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
          txtCustName = recvAccSearchMsg.eShortName
       Else
          txtCustName = recvAccSearchMsg.aShortName
       End If
    End If
    
    chequeBookGrid.Clear
    chequeBookGrid.Row = 0
    chequeBookGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 7
      chequeBookGrid.Col = i
      If UserLang = ARABIC Then
         chequeBookGrid.CellAlignment = flexAlignRightCenter
      Else
         chequeBookGrid.CellAlignment = flexAlignLeftCenter
      End If
      chequeBookGrid.text = frmChequeBookGridCaption(i + 2, UserLang)
      chequeBookGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    If UserLang = ENGLISH Then
       chequeBookGrid.Width = tWidth + 200
    End If
    
    For i = 1 To Val(recvChequeBookSearchMsg.noOfRecs)
         chequeBookGrid.Row = i
         chequeBookGrid.Col = 0
         chequeBookGrid.CellAlignment = flexAlignLeftCenter
         chequeBookGrid.text = recvChequeBookSearchMsg.details(i).branchCode
         chequeBookGrid.Col = 1
         chequeBookGrid.CellAlignment = flexAlignLeftCenter
         chequeBookGrid.text = recvChequeBookSearchMsg.details(i).requestUserId
         chequeBookGrid.Col = 2
         If recvChequeBookSearchMsg.details(i).chequeType = "1" Then
            tmpStr = frmChequeBookGridCaption(15, UserLang)  ' Personal
         Else
            tmpStr = frmChequeBookGridCaption(16, UserLang)  '"Corporate"
         End If
         chequeBookGrid.text = recvChequeBookSearchMsg.details(i).chequeType & "-" & tmpStr
         chequeBookGrid.Col = 3
         chequeBookGrid.CellAlignment = flexAlignLeftCenter
         chequeBookGrid.text = recvChequeBookSearchMsg.details(i).booksRequested
         chequeBookGrid.Col = 4
         chequeBookGrid.CellAlignment = flexAlignLeftCenter
         chequeBookGrid.text = formatDate(recvChequeBookSearchMsg.details(i).requestDate)
         chequeBookGrid.Col = 5
         chequeBookGrid.CellAlignment = flexAlignLeftCenter
         If recvChequeBookSearchMsg.details(i).requestStatus = "1" Then
            tmpStr = frmChequeBookGridCaption(17, UserLang)  ' "Requested"
         ElseIf recvChequeBookSearchMsg.details(i).requestStatus = "2" Then
            tmpStr = frmChequeBookGridCaption(18, UserLang)    '"Produced"
         ElseIf recvChequeBookSearchMsg.details(i).requestStatus = "3" Then
            tmpStr = frmChequeBookGridCaption(19, UserLang)   '"Received by branch"
         ElseIf recvChequeBookSearchMsg.details(i).requestStatus = "4" Then
            tmpStr = frmChequeBookGridCaption(20, UserLang)   '"Issued to customer"
         ElseIf recvChequeBookSearchMsg.details(i).requestStatus = "9" Then
            tmpStr = frmChequeBookGridCaption(21, UserLang)   '"Rejected"
         Else
            tmpStr = errUnknown(UserLang)  '  "Unknown"
         End If
         chequeBookGrid.text = recvChequeBookSearchMsg.details(i).requestStatus & "-" & tmpStr
         chequeBookGrid.Col = 6
         chequeBookGrid.text = recvChequeBookSearchMsg.details(i).chequeNoFrom
         chequeBookGrid.Col = 7
         chequeBookGrid.text = recvChequeBookSearchMsg.details(i).chequeNoTo
   Next i
   chequeBookGrid.Row = 1
   
   If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
'      cmdAdd.Enabled = True
'      cmdAmend.Enabled = True
'      cmdDelete.Enabled = True
   Else
      cmdAdd.Enabled = False
      cmdAmend.Enabled = False
      cmdDelete.Enabled = False
   End If
    
End Sub
Public Function parseChequeBookDetails()
    Dim i As Integer, pos As Integer
    pos = 1
    
    recvChequeBookDetail.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvChequeBookDetail.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvChequeBookDetail.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvChequeBookDetail.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvChequeBookDetail.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvChequeBookDetail.requestDateTime = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvChequeBookDetail.chequeType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvChequeBookDetail.booksRequested = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvChequeBookDetail.requestStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvChequeBookDetail.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvChequeBookDetail.chequeNoFrom = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvChequeBookDetail.chequeNoTo = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvChequeBookDetail.deliveryBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
End Function

Public Function parseChequeBookHistoryDetails() As String
    Dim i As Integer, pos As Integer
    
    recvChequeBookHistory.status = Mid$(RecvStr, 1, 3)
    recvChequeBookHistory.service = Mid$(RecvStr, 4, 2)
    recvChequeBookHistory.aRemarks = Mid$(RecvStr, 6, 50)
    recvChequeBookHistory.eRemarks = Mid$(RecvStr, 56, 50)
    recvChequeBookHistory.noOfRecs = Mid$(RecvStr, 106, 2)
    recvChequeBookHistory.filler = Mid$(RecvStr, 108, 10)
    pos = 118
    For i = 1 To Val(recvChequeBookHistory.noOfRecs)
        recvChequeBookHistory.details(i).requestUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvChequeBookHistory.details(i).requestDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvChequeBookHistory.details(i).producedDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvChequeBookHistory.details(i).producedUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvChequeBookHistory.details(i).recdByBranchDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvChequeBookHistory.details(i).recdByBranchUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvChequeBookHistory.details(i).issuedToCustDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvChequeBookHistory.details(i).issuedToCustUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvChequeBookHistory.details(i).rejectedDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvChequeBookHistory.details(i).rejectedUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvChequeBookHistory.details(i).rejectedReason = Mid$(RecvStr, pos, 20)
        pos = pos + 20
        recvChequeBookHistory.details(i).requestTime = Mid$(RecvStr, pos, 6)
        pos = pos + 6
        recvChequeBookHistory.details(i).producedTime = Mid$(RecvStr, pos, 6)
        pos = pos + 6
        recvChequeBookHistory.details(i).recdByBranchTime = Mid$(RecvStr, pos, 6)
        pos = pos + 6
        recvChequeBookHistory.details(i).issuedToCustTime = Mid$(RecvStr, pos, 6)
        pos = pos + 6
        recvChequeBookHistory.details(i).rejectedTime = Mid$(RecvStr, pos, 6)
        pos = pos + 6
    Next i
End Function

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
