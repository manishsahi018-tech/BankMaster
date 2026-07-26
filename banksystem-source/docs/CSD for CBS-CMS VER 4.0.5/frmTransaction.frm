VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmTransaction 
   BackColor       =   &H00BFD87E&
   Caption         =   "Transaction Enquiry"
   ClientHeight    =   8325
   ClientLeft      =   555
   ClientTop       =   375
   ClientWidth     =   11340
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8325
   ScaleWidth      =   11340
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2400
      TabIndex        =   18
      ToolTipText     =   "Next"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdFirst 
      Caption         =   "First"
      Enabled         =   0   'False
      Height          =   375
      Left            =   960
      TabIndex        =   17
      ToolTipText     =   "First"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go"
      Height          =   375
      Left            =   7665
      TabIndex        =   5
      ToolTipText     =   "Go"
      Top             =   1680
      Width           =   1335
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "Previous"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3840
      TabIndex        =   6
      ToolTipText     =   "Previous"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdMenu 
      Caption         =   "Return to Account Menu"
      Height          =   375
      Left            =   5280
      TabIndex        =   7
      ToolTipText     =   "Return to Account Menu"
      Top             =   7920
      Width           =   2055
   End
   Begin VB.ComboBox cmbStartDate 
      Height          =   315
      Left            =   5280
      TabIndex        =   2
      Top             =   1680
      Width           =   615
   End
   Begin VB.ComboBox cmbStartMonth 
      Height          =   315
      Left            =   5880
      TabIndex        =   3
      Top             =   1680
      Width           =   615
   End
   Begin VB.TextBox txtStartYear 
      Height          =   285
      Left            =   6480
      MaxLength       =   4
      TabIndex        =   4
      Top             =   1680
      Width           =   615
   End
   Begin VB.TextBox txtStartTrans 
      Height          =   285
      Left            =   2040
      TabIndex        =   1
      Top             =   1680
      Width           =   1215
   End
   Begin VB.TextBox txtNoOfTrans 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1920
      TabIndex        =   12
      Top             =   1080
      Width           =   1215
   End
   Begin VB.TextBox txtName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6360
      TabIndex        =   10
      Top             =   600
      Width           =   2895
   End
   Begin VB.TextBox txtAcctNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1920
      TabIndex        =   8
      Top             =   600
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid TransGrid 
      Height          =   5775
      Left            =   120
      TabIndex        =   15
      Top             =   2040
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   10186
      _Version        =   393216
      Rows            =   2000
      Cols            =   12
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      ScrollBars      =   1
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblTransEnquiry 
      BackColor       =   &H00BFD87E&
      Caption         =   "Transaction Enquiry"
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
      TabIndex        =   16
      Top             =   120
      Width           =   2895
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11880
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Label lblStartDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Start Date"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   4080
      TabIndex        =   14
      Top             =   1680
      Width           =   1095
   End
   Begin VB.Label lblStartTran 
      BackColor       =   &H00BFD87E&
      Caption         =   "Start Txn number"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   360
      TabIndex        =   13
      Top             =   1680
      Width           =   1575
   End
   Begin VB.Label lblNoOfTran 
      BackColor       =   &H00BFD87E&
      Caption         =   "No. of Trans"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   480
      TabIndex        =   11
      Top             =   1080
      Width           =   1215
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
      Left            =   4560
      TabIndex        =   9
      Top             =   600
      Width           =   1695
   End
   Begin VB.Label lblAcctNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account No"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   480
      TabIndex        =   0
      Top             =   600
      Width           =   1335
   End
End
Attribute VB_Name = "frmTransaction"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public cfBalance As Double
Public coinDenomination As Integer
Public coinPrecision As Integer
Public amtToPrint As Double
Public tranAmt As Double
Public displayFromLocal As Boolean
Public recordNo As Long
Public totalRecord As Long
Public recordsDisplayed As Integer
Dim prevRecordCount(2) As Integer
Public ctr As Integer
Public startTrans As Integer
Public onlgwConnected As Boolean

Private Sub cmbStartDate_Change()
  If Len(RTrim(cmbStartDate.text)) <> 0 Then
       If Len(cmbStartDate.text) = 2 Then
          If cmbStartDate < 1 Or cmbStartDate > 31 Then
             MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
             cmbStartDate.text = ""
             cmbStartDate.SetFocus
          Else
             On Error Resume Next
             cmbStartMonth.SetFocus
          End If
       End If
    End If
End Sub

Private Sub cmbStartDate_GotFocus()
   cmdGo.Default = False
End Sub

Private Sub cmbStartDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbStartMonth_Change()
   If Len(RTrim(cmbStartMonth.text)) <> 0 Then
      If Len(cmbStartMonth.text) = 2 Then
         If cmbStartMonth < 1 Or cmbStartMonth > 12 Then
            MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            cmbStartMonth.text = ""
            cmbStartMonth.SetFocus
          Else
            On Error Resume Next
            txtStartYear.SetFocus
          End If
      End If
  End If
End Sub

Private Sub cmbStartMonth_GotFocus()
    cmdGo.Default = False
End Sub

Private Sub cmbStartMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmdFirst_Click()
    If startTrans = 1 Then
       MsgBox errAlreadyInFirst(UserLang) ' "Already in first list"
       Exit Sub
    End If
    recordsDisplayed = 0
    startTrans = 1
    fillGridFromLocalDb
End Sub

Private Sub cmdGo_Click()
   Dim tDate As String
   
   If Len(RTrim(txtStartTrans)) <> 0 Then
      If Val(txtStartTrans) > 0 Then
         cmbStartDate.text = ""
         cmbStartMonth.text = ""
         txtStartYear.text = ""
      End If
   Else
      If Len(RTrim(cmbStartDate.text)) = 0 Or _
         Len(RTrim(cmbStartMonth.text)) = 0 Or _
         Len(RTrim(txtStartYear)) = 0 Then
         MsgBox errInvalidDate(UserLang)
         cmbStartDate.SetFocus
         Exit Sub
      End If
      tDate = CStr(txtStartYear) + _
              CStr(cmbStartMonth.text) + _
              CStr(cmbStartDate.text)
          
      If validDate(tDate) = False Then
         MsgBox errInvalidDate(UserLang)
         cmbStartDate.SetFocus
         Exit Sub
      End If
   End If
       
   frmInputform.Hide   '  this line will call form_load of online statement form which
                       '  will connect to online gateway server
                       
   If Len(RTrim(frmTransaction.txtStartTrans)) = 0 Then
      startTransaction = "00000"
   Else
      startTransaction = Format(frmTransaction.txtStartTrans - 1, "00000")
   End If
   
   formatTransEnquiryRequest (startTransaction)
   SendMsg = transReqMsg.msgLen & transReqMsg.checkSum & transReqMsg.branchName & transReqMsg.Source & transReqMsg.service & _
             transReqMsg.mainAccNo & transReqMsg.fromDate & transReqMsg.toDate & _
             transReqMsg.lastTransPointer & transReqMsg.filler & transReqMsg.userId & transReqMsg.filler2 & transReqMsg.EOT
             
   strmsglen = Format(Len(SendMsg), "0000")
   Mid$(SendMsg, 1, 4) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
   LogData "Transaction enquiry for the account no : " & frmTransaction.txtAcctNo
   If HandleOnlineTraffic(frmInputform.OnlineTcp, frmInputform.onlineTimer, onlineHostName, OnlinePort) = LocalCommsError Then
      LoadError = True
      Exit Sub
   End If
   
   If transResMsg.responseStatus <> "00" And _
      transResMsg.responseStatus <> "01" Then
      If transResMsg.responseStatus = "03" Then
         MsgBox errIncorrectMsgSent(UserLang)    '"Incorrect Message sent..Check the Account Number and Dates"
      ElseIf transResMsg.responseStatus = "05" Then
         MsgBox errIncorrectMainAcc(UserLang)  '"Given Main Account is incorrect...Please Check"
      ElseIf transResMsg.responseStatus = "06" Then
         MsgBox errIncorrectContraAcc(UserLang)  '"Given contra Account is incorrect..Please Check"
      ElseIf transResMsg.responseStatus = "08" Then
         MsgBox errRestrictedAccount(UserLang)  '"Restricted Account.. Please Check.."
      ElseIf transResMsg.responseStatus = "12" Then
         MsgBox errCommsError(UserLang)  '"Communication Error occured..Try Again.."
      Else
         MsgBox errErrorRecdFromOnlineGateway(UserLang)  '"Error  " + transresmsg.responseStatus + "occurred during communication"
      End If
      Exit Sub
   End If
   
   If transResMsg.branchCode = "0175" And gBranchCode <> "0175" Then
      MsgBox errNotAuthorizedToViewStaffAcc(UserLang)  '"You are not authorised to view STAFF ACCOUNT'S transaction details "
      Exit Sub
   End If
   
   recordNo = 1
   recordsDisplayed = 0
   ctr = 1
   transDb.Execute ("delete from transinfo")
      
   lang = transResMsg.langCode
   
   If transResMsg.noOfTransHere = "000" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   
   If transResMsg.decimalPlace = "2" Then
      coinDenomination = 100
      coinPrecision = 2
   ElseIf transResMsg.decimalPlace = "3" Then
      coinDenomination = 1000
      coinPrecision = 3
   ElseIf transResMsg.decimalPlace = "1" Then
      coinDenomination = 10
      coinPrecision = 1
   Else
      coinDenomination = 1
      coinPrecision = 0
   End If
   On Error Resume Next
   cfBalance = CDbl(transResMsg.bfBalance)

   Form_Load
   onlgwConnected = True
   cmdGo.Enabled = False
   frmTransaction.MousePointer = vbHourglass
   loadLocalDb
   Do While transResMsg.completionFlag = "0"
      formatTransEnquiryRequest (transResMsg.lastTransPtr)
      SendMsg = transReqMsg.msgLen + transReqMsg.checkSum + transReqMsg.branchName + transReqMsg.Source + transReqMsg.service + _
                transReqMsg.mainAccNo + transReqMsg.fromDate + transReqMsg.toDate + _
                transReqMsg.lastTransPointer + transReqMsg.filler + transReqMsg.userId + transReqMsg.filler2 + transReqMsg.EOT
             
      strmsglen = Format(Len(SendMsg), "0000")
      Mid$(SendMsg, 1, 4) = strmsglen
      DataReceivedFlag = False
      If HandleOnlineTraffic(frmInputform.OnlineTcp, frmInputform.onlineTimer, hostName, OnlinePort) = LocalCommsError Then
         LoadError = True
         Exit Do
      End If

      If transResMsg.responseStatus <> "00" And _
         transResMsg.responseStatus <> "01" Then
         MsgBox errErrorRecdFromOnlineGateway(UserLang)   '"Error  <" + resMsg.responseStatus + "> received from Online gateway"
         Exit Do
      End If
      loadLocalDb
   Loop
   Set rs = transDb.OpenRecordset("select count(*) from transinfo")
   
   If rs.recordCount > 0 Then
      totalRecord = rs(0)
   Else
      totalRecord = 1
   End If
   
   TransGrid.Rows = (totalRecord * 4) + 2
   
   startTrans = 1
   fillGridFromLocalDb
   
   cmdFirst.Enabled = True
   cmdNext.Enabled = True
   cmdPrev.Enabled = True
   
   cmdGo.Enabled = True
   frmTransaction.MousePointer = vbNormal
   
End Sub

Private Sub cmdMenu_Click()
   If onlgwConnected = True Then
      If frmInputform.OnlineTcp.State = sckConnected Then
         frmInputform.OnlineTcp.Close
      End If
      Unload frmInputform
   End If
   Unload Me
End Sub

Private Sub cmdNext_Click()
    If recordsDisplayed >= totalRecord Then
       MsgBox errNoMatchFound(UserLang)
       Exit Sub
    End If
    startTrans = recordsDisplayed + 1
    fillGridFromLocalDb
End Sub

Private Sub cmdPrev_Click()
    If startTrans <= 1 Then
       MsgBox errNoMatchFound(UserLang)
       Exit Sub
    End If
    startTrans = startTrans - prevRecordCount(1)
    recordsDisplayed = startTrans - 1
    fillGridFromLocalDb
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow, tWidth, colwidth(15) As Integer
    Dim rowTitle(8) As String
    Dim tmpStr, tCode As String
    Static lastRecRead As String * 3
    

    colwidth(0) = 500
    colwidth(1) = 1300
    colwidth(2) = 1300
    colwidth(3) = 2500
    colwidth(4) = 2000
    colwidth(5) = 1600
    colwidth(6) = 1800
    colwidth(7) = 500
    colwidth(8) = 1300
    colwidth(9) = 500

    
    frmTransaction.Caption = frmTransactionCaption(0, UserLang)
    frmTransaction.lblTransEnquiry.Caption = frmTransactionCaption(0, UserLang)
    frmTransaction.lblAcctNo.Caption = frmTransactionCaption(1, UserLang)
    frmTransaction.lblName.Caption = frmTransactionCaption(2, UserLang)
    frmTransaction.lblNoOfTran.Caption = frmTransactionCaption(3, UserLang)
    frmTransaction.lblStartTran.Caption = frmTransactionCaption(4, UserLang)
    frmTransaction.lblStartDate.Caption = frmTransactionCaption(5, UserLang)
    frmTransaction.cmdGo.Caption = frmTransactionCaption(18, UserLang)
'    frmTransaction.cmdMore.Caption = frmTransactionCaption(19, UserLang)
    frmTransaction.cmdFirst.Caption = frmTransactionCaption(20, UserLang)
    frmTransaction.cmdPrev.Caption = frmTransactionCaption(21, UserLang)
    frmTransaction.cmdNext.Caption = frmTransactionCaption(22, UserLang)
    frmTransaction.cmdMenu.Caption = frmTransactionCaption(23, UserLang)
       
    
'    rowTitle(0) = "Tlr Id"
'    rowTitle(1) = "Post Date"
'    rowTitle(2) = "Value Date"
'    rowTitle(3) = "Narrative-1"
'    rowTitle(4) = "Debit Amt"
'    rowTitle(5) = "Credit Amt"
'    rowTitle(6) = "Balance"
'    rowTitle(7) = "Narrative-2"
'    rowTitle(8) = "Narrative-3"
        
    TransGrid.Clear
    TransGrid.Row = 0
    TransGrid.Font.Bold = True
    
    For i = 1 To 31
        If i < 10 Then
           num = "0" + CStr(i)
        Else
           num = CStr(i)
        End If
        cmbStartDate.AddItem num
        If i < 13 Then
           cmbStartMonth.AddItem num
        End If
    Next
     
    tWidth = 0
    For i = 0 To 9
      TransGrid.Col = i
      If UserLang = ARABIC Then
         TransGrid.CellAlignment = flexAlignRightCenter
      Else
         TransGrid.CellAlignment = flexAlignLeftCenter
      End If
      TransGrid.text = frmTransactionCaption(i + 6, UserLang)
      TransGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
      
End Sub


Public Sub formatTransRequest(lastTransPointer As String)
    reqMsg.msgLen = "0386"
    reqMsg.checkSum = Space(1)
    reqMsg.branchName = Format(gBranch, "!@@@@@@@@@@")
    reqMsg.Source = Space(2)
    reqMsg.service = "07"
    reqMsg.mainAccNo = Format(frmTransaction.txtAcctNo, "!@@@@@@@@@@@@@@")
    reqMsg.fromDate = txtStartYear + cmbStartMonth + cmbStartDate
    reqMsg.toDate = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + _
                    Format(CStr(Day(Date)), "00")
    reqMsg.lastTransPointer = lastTransPointer
    reqMsg.userId = "STMT"
    reqMsg.filler = Space(327)
    reqMsg.EOT = "Z"

End Sub


Public Sub loadLocalDb()
    Dim noOfTrans As Integer
    Dim mQry As String
    noOfTrans = Val(transResMsg.noOfTransHere)
    On Error GoTo err_handler
    For i = 1 To noOfTrans
            If Mid$(transResMsg.transDetails(i).transAmt, 1, 1) = "+" Then
               drCrFlag = "Cr"
            Else
               drCrFlag = "Dr"
            End If
            tranAmt = Abs(CDbl(transResMsg.transDetails(i).transAmt))
            amtToPrint = tranAmt / coinDenomination
            If Len(RTrim(frmTransaction.txtStartTrans)) > 0 And _
               Val(frmTransaction.txtStartTrans) > 1 Then
               cfBalance = 0
            Else
               If drCrFlag = "Cr" Then
                  cfBalance = cfBalance + tranAmt
               Else
                  cfBalance = cfBalance - tranAmt
               End If
            End If
        mQry = "insert into transinfo (seqno, userId, postdate, valuedate, transtype, transamt," & _
          "narrative1, narrative2, narrative3,cfbalance,refno,supervisorid, transctr, statementflag) values (" & recordNo & ",'" & transResMsg.transDetails(i).userId & _
          "','" & transResMsg.transDetails(i).postDate & "','" & transResMsg.transDetails(i).valueDate & "','" & _
          transResMsg.transDetails(i).transType & "','" & transResMsg.transDetails(i).transAmt & "','" & _
          transResMsg.transDetails(i).narrative1 & "','" & transResMsg.transDetails(i).narrative2 & "','" & _
          transResMsg.transDetails(i).narrative3 & "','" & CStr(cfBalance) & "','" & _
          transResMsg.transDetails(i).referenceNo & "','" & _
          transResMsg.transDetails(i).supervisorId & "','" & transResMsg.transDetails(i).transCounter & _
          "','" & transResMsg.transDetails(i).stmtFlag & "')"
        transDb.Execute (mQry)
        If Err.Number = 0 Then
           recordNo = recordNo + 1
        End If
    Next i
    Exit Sub

err_handler:
   LogData "Error   " & Err.Number & "    " & Err.Description & "  during transaction loading into local db"
   Resume Next
End Sub

Private Sub fillGridFromLocalDb()
   Dim drCrFlag As String
   Dim narrative2, narrative3 As String
   Dim refNo As String
   Dim i As Integer
   Dim tmpVar As Integer
   Dim rowsReqd As Integer
   Dim seqNo As Integer
   Dim k As Integer
   Dim cfBal As Double
   
   Set rs = transDb.OpenRecordset("Select * from transinfo")
     
   i = 0
   k = 0
   If ctr = 1 Then
      ctr = 2
   Else
      prevRecordCount(1) = prevRecordCount(2)
   End If
   prevRecordCount(ctr) = 0
   rowsReqd = 1
   Form_Load
   rs.MoveFirst
   Do While Not rs.EOF
       k = 0
       seqNo = rs("seqno")
       If seqNo < startTrans Then
          rs.MoveNext
       Else
            i = i + 1
            rowsReqd = 1
            narrative2 = rs("narrative2")
            narrative3 = rs("narrative3")
            refNo = rs("refno")
            If Len(RTrim(narrative2)) <> 0 Then
               rowsReqd = rowsReqd + 1
            End If
            If Len(RTrim(narrative3)) <> 0 Then
               rowsReqd = rowsReqd + 1
            End If
            If Len(RTrim(refNo)) <> 0 Then
               rowsReqd = rowsReqd + 1
            End If
            If i + rowsReqd > 22 Then
               Exit Do
            End If
            TransGrid.Row = i
            TransGrid.Col = 0
            If Mid$(rs("transAmt"), 1, 1) = "+" Then
               drCrFlag = "Cr"
            Else
               drCrFlag = "Dr"
            End If
            tranAmt = Abs(CDbl(rs("transAmt")))
            amtToPrint = tranAmt / coinDenomination
            cfBal = CDbl(rs("cfbalance"))
            TransGrid.text = rs("userid")
            TransGrid.Col = 1
            TransGrid.text = formatDate(rs("postdate"))
            TransGrid.Col = 2
            TransGrid.text = formatDate(rs("valueDate"))
            TransGrid.Col = 3
            TransGrid.CellAlignment = flexAlignLeftCenter
            If Len(RTrim(rs("narrative1"))) <> 0 Then
               TransGrid.text = rs("narrative1")
            Else
               TransGrid.text = "                         "
            End If
            If drCrFlag = "Dr" Then
               TransGrid.Col = 4
            Else
               TransGrid.Col = 5
            End If
            TransGrid.CellAlignment = flexAlignRightCenter
            TransGrid.text = Format(Format(amtToPrint, "##,###,###,###,##0" + _
                             IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
            TransGrid.Col = 6
            If Len(RTrim(frmTransaction.txtStartTrans)) > 0 And _
               Val(frmTransaction.txtStartTrans) > 1 Then
               TransGrid.text = "          "
            Else
               If cfBal >= 0 Then
                  TransGrid.text = "Cr" + Format(Format(cfBal / coinDenomination, "##,###,###,###,##0" + _
                                   IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@@")
               Else
                  TransGrid.text = "Dr" + Format(Format(Abs(cfBal) / coinDenomination, "##,###,###,###,##0" + _
                                   IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@@")
               End If
            End If
            TransGrid.Col = 7
            TransGrid.text = rs("supervisorid")
            TransGrid.Col = 8
            TransGrid.text = rs("transctr")
            TransGrid.Col = 9
            TransGrid.text = rs("statementflag")
            If Len(RTrim(rs("narrative2"))) <> 0 Then
               k = i + 1
               TransGrid.Row = k
               TransGrid.Col = 3
               TransGrid.CellAlignment = flexAlignLeftCenter
               TransGrid.text = rs("narrative2")
               i = k
            End If
            If Len(RTrim(rs("narrative3"))) <> 0 Then
               If k <> 0 Then
                  k = k + 1
               Else
                  k = i + 1
               End If
               i = k
               TransGrid.Row = k
               TransGrid.Col = 3
               TransGrid.CellAlignment = flexAlignLeftCenter
               TransGrid.text = rs("narrative3")
            End If
            If Len(RTrim(rs("refno"))) <> 0 Then
               If k <> 0 Then
                  k = k + 1
               Else
                  k = i + 1
               End If
               i = k
               TransGrid.Row = k
               TransGrid.Col = 3
               TransGrid.CellAlignment = flexAlignLeftCenter
               TransGrid.text = "REF:" & rs("refno")
            End If
            recordsDisplayed = recordsDisplayed + 1
            prevRecordCount(ctr) = prevRecordCount(ctr) + 1
            rs.MoveNext
       End If
   Loop
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Terminate()
    onlgwConnected = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
    onlgwConnected = False
End Sub

Private Sub TransGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtStartTrans_GotFocus()
    cmdGo.Default = True
End Sub

Private Sub txtStartTrans_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtStartTrans_LostFocus()
  If Len(RTrim(txtStartTrans)) <> 0 Then
     If Val(txtStartTrans) > 0 Then
        cmbStartDate.text = ""
        cmbStartMonth.text = ""
        txtStartYear.text = ""
     End If
   End If
End Sub

Private Sub txtStartYear_GotFocus()
   cmdGo.Default = True
End Sub

Private Sub txtStartYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Sub formatTransEnquiryRequest(lastTransPointer As String)
    transReqMsg.msgLen = "0386"
    transReqMsg.checkSum = Space(1)
    transReqMsg.branchName = Format(gBranch, "!@@@@@@@@@@")
    transReqMsg.Source = Space(2)
    transReqMsg.service = "11"
    transReqMsg.mainAccNo = Format(frmTransaction.txtAcctNo, "!@@@@@@@@@@@@@@")
    transReqMsg.fromDate = txtStartYear + cmbStartMonth + cmbStartDate
    'transReqMsg.toDate = CStr(Year(Date)) + Format(CStr(Month(Date)), "00") + _
                    Format(CStr(Day(Date)), "00")
    transReqMsg.toDate = Space(8) ' moved as spaces because sometimes, PC date is not set
                                  ' properly, ONLINE gateway is also modified to
                                  ' move the current system if the incoming toDate is
                                  ' spaces
    transReqMsg.lastTransPointer = lastTransPointer
    transReqMsg.filler = Space(52)
    transReqMsg.userId = "STMT"
    transReqMsg.filler2 = Space(275)
    transReqMsg.EOT = "Z"

End Sub

Private Sub txtStartYear_LostFocus()
    If Len(RTrim(cmbStartDate.text)) > 0 And _
       Len(RTrim(cmbStartMonth.text)) > 0 And _
       Len(RTrim(txtStartYear)) > 0 Then
       
       txtStartTrans = ""
   End If
End Sub

