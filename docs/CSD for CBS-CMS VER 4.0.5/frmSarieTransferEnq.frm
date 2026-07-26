VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSarieTransferEnq 
   BackColor       =   &H00BFD87E&
   Caption         =   "Transfer Enquiry"
   ClientHeight    =   8340
   ClientLeft      =   540
   ClientTop       =   360
   ClientWidth     =   11355
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8340
   ScaleWidth      =   11355
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4485
      TabIndex        =   23
      ToolTipText     =   "Print"
      Top             =   7920
      Width           =   1575
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "Previous"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6060
      TabIndex        =   22
      ToolTipText     =   "Previous"
      Top             =   7920
      Width           =   1935
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Height          =   375
      Left            =   240
      TabIndex        =   21
      ToolTipText     =   "Refresh"
      Top             =   7920
      Width           =   1335
   End
   Begin VB.ComboBox cmbTransferStatus 
      Height          =   315
      Left            =   6360
      TabIndex        =   9
      Top             =   1560
      Width           =   2415
   End
   Begin VB.TextBox txtEndYear 
      Height          =   285
      Left            =   7560
      MaxLength       =   4
      TabIndex        =   7
      Top             =   1080
      Width           =   615
   End
   Begin VB.ComboBox cmbEndMonth 
      Height          =   315
      Left            =   6960
      TabIndex        =   6
      Top             =   1080
      Width           =   615
   End
   Begin VB.ComboBox cmbEndDate 
      Height          =   315
      Left            =   6360
      TabIndex        =   5
      Top             =   1080
      Width           =   615
   End
   Begin VB.CommandButton cmdTxferInfo 
      Caption         =   "Transfer Info"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3030
      TabIndex        =   18
      ToolTipText     =   "Transfer Details"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdBmTxn 
      Caption         =   "BM Trxn"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1575
      TabIndex        =   17
      ToolTipText     =   "BM Transaction Details"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go"
      Height          =   375
      Left            =   8880
      TabIndex        =   10
      ToolTipText     =   "Go"
      Top             =   1560
      Width           =   1335
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next"
      Enabled         =   0   'False
      Height          =   375
      Left            =   7995
      TabIndex        =   11
      ToolTipText     =   "Next"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   9450
      TabIndex        =   12
      ToolTipText     =   "Return to Account Menu"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.ComboBox cmbStartDate 
      Height          =   315
      Left            =   2280
      TabIndex        =   2
      Top             =   1080
      Width           =   615
   End
   Begin VB.ComboBox cmbStartMonth 
      Height          =   315
      Left            =   2880
      TabIndex        =   3
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox txtStartYear 
      Height          =   285
      Left            =   3480
      MaxLength       =   4
      TabIndex        =   4
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox txtBpRefNo 
      Height          =   285
      Left            =   2400
      MaxLength       =   10
      TabIndex        =   8
      Top             =   1680
      Width           =   1215
   End
   Begin VB.TextBox txtAcctNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2280
      TabIndex        =   1
      Top             =   600
      Width           =   1815
   End
   Begin MSFlexGridLib.MSFlexGrid SarieTransGrid 
      Height          =   5175
      Left            =   120
      TabIndex        =   15
      Top             =   2040
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   9128
      _Version        =   393216
      Rows            =   2000
      Cols            =   7
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblRecordStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "Record Status"
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
      Left            =   4440
      TabIndex        =   20
      Top             =   1590
      Width           =   1695
   End
   Begin VB.Label lblEndDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "To Date"
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
      Left            =   4560
      TabIndex        =   19
      Top             =   1110
      Width           =   1095
   End
   Begin VB.Label lblTransferEnq 
      BackColor       =   &H00BFD87E&
      Caption         =   "Transfer enquiry"
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
      Left            =   3960
      TabIndex        =   16
      Top             =   120
      Width           =   3375
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
      Left            =   480
      TabIndex        =   14
      Top             =   1110
      Width           =   1095
   End
   Begin VB.Label lblBpRefNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "BP Reference No."
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
      Top             =   615
      Width           =   1695
   End
End
Attribute VB_Name = "frmSarieTransferEnq"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public coinDenomination As Integer
Public coinPrecision As Integer
Public amtToPrint As Double
Public tranAmt As Double
Public totalTransAmt As Double
Public displayFromLocal As Boolean
Public recordNo As Long
Public totalRecord As Long
Public recordsDisplayed As Integer
Public fso As FileSystemObject
Public outFile As Object
Public lines As Integer
Public page As Integer
Dim prevRecordCount(2) As Integer
Public ctr As Integer
Public startTrans As Integer

Private Sub cmbEndDate_Change()
If Len(RTrim(cmbEndDate.text)) <> 0 Then
   If Len(cmbEndDate.text) = 2 Then
      If cmbEndDate < 1 Or cmbEndDate > 31 Then
         MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
         cmbEndDate.text = ""
         cmbEndDate.SetFocus
      Else
         On Error Resume Next
         cmbEndMonth.SetFocus
      End If
   End If
End If
End Sub

Private Sub cmbEndDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbEndMonth_Change()
   If Len(RTrim(cmbEndMonth.text)) <> 0 Then
      If Len(cmbEndMonth.text) = 2 Then
         If cmbEndMonth < 1 Or cmbEndMonth > 12 Then
            MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            cmbEndMonth.text = ""
            cmbEndMonth.SetFocus
          Else
            On Error Resume Next
            txtEndYear.SetFocus
          End If
      End If
  End If
End Sub

Private Sub cmbEndMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

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

Private Sub cmdBmTxn_Click()
    Dim tTransRefNo As String
    Dim strmsglen As String
    Dim tCode As String
    Dim tmpStr As String
    Dim tuserId As String, tAccNo As String, tValueDate As String
    
    SarieTransGrid.Col = 2
    tmpStr = SarieTransGrid.text
    tValueDate = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2)
    
    SarieTransGrid.Col = 0
    tTransRefNo = Format(SarieTransGrid.text, "!@@@@@@@@@@")
    
    If Len(RTrim(tTransRefNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    tuserId = Format(gUserId, "!@@@@@@@@@@")
    
    tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
    
    SendMsg = "000044" & "84" & gBranchCode & tuserId & tAccNo & tTransRefNo & tValueDate
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSarieTransferEnq.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmSarieTransferEnq.MousePointer = vbDefault
       Exit Sub
    End If
    frmSarieTransferEnq.MousePointer = vbDefault
    parseBmTransDetails
    If recvBmTransDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvBmTransDetail.aRemarks
       Else
          MsgBox recvBmTransDetail.eRemarks
       End If
       Exit Sub
    End If
    fillFrmBMTransDetails
    frmBMTransDetails.Show
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdGo_Click()
   Dim tDate As String, tDecimalPlace As String
   
   If Len(RTrim(cmbStartDate)) = 0 Or _
      Len(RTrim(cmbStartMonth)) = 0 Or _
      Len(RTrim(txtStartYear)) = 0 Then
      MsgBox errInvalidDate(UserLang)   '"From Date is blank or Incomplete From Date"
      cmbStartDate.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(cmbEndDate)) = 0 Or _
      Len(RTrim(cmbEndMonth)) = 0 Or _
      Len(RTrim(txtEndYear)) = 0 Then
      MsgBox errInvalidDate(UserLang)    '"To_Date is blank or Incomplete To Date"
      cmbToDate.SetFocus
      Exit Sub
   End If
   
   tDate = CStr(txtStartYear) & _
           CStr(cmbStartMonth.text) & _
           CStr(cmbStartDate.text)
   
   If validDate(tDate) = False Then
      MsgBox errInvalidDate(UserLang)
      cmbStartDate.SetFocus
      Exit Sub
   End If
   
   tDate = CStr(txtEndYear) & _
           CStr(cmbEndMonth.text) & _
           CStr(cmbEndDate.text)
   
   If validDate(tDate) = False Then
      MsgBox errInvalidDate(UserLang)
      cmbEndDate.SetFocus
      Exit Sub
   End If
       
   formatTransferEnqRequest ("00000")
   SendMsg = transferEnqMsg.msgLen & transferEnqMsg.service & transferEnqMsg.homeBranch & _
             transferEnqMsg.userId & transferEnqMsg.accNo & transferEnqMsg.fromDate & _
             transferEnqMsg.toDate & transferEnqMsg.bpRefNo & transferEnqMsg.recordStatus & _
             transferEnqMsg.lastRecCount
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
   cmdGo.Enabled = False
   cmdRefresh.Enabled = False
   cmdNext.Enabled = False
   cmdPrev.Enabled = False
   cmdPrint.Enabled = False
   cmdBmTxn.Enabled = False
   cmdTxferInfo.Enabled = False
   cmdExit.Enabled = False
   frmSarieTransferEnq.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmSarieTransferEnq.MousePointer = vbNormal
      Exit Sub
   End If
   
   parseTransferEnq
   
   If recvTransferEnqMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvTransferEnqMsg.aRemarks
      Else
         MsgBox recvTransferEnqMsg.eRemarks
      End If
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmSarieTransferEnq.MousePointer = vbNormal
      Exit Sub
   End If
        
   recordNo = 1
   recordsDisplayed = 0
   totalTransAmt = 0
   ctr = 1
   transDb.Execute ("delete from transferInfo")
      
   If recvTransferEnqMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmSarieTransferEnq.MousePointer = vbNormal
      Exit Sub
   End If
   
   On Error Resume Next
   
   Form_Load
   cmdGo.Enabled = False
   cmdExit.Enabled = False
   frmSarieTransferEnq.MousePointer = vbHourglass
   loadLocalDb
   Do While recvTransferEnqMsg.completionFlag = "0"
      formatTransferEnqRequest (recvTransferEnqMsg.lastRecCount)
      SendMsg = transferEnqMsg.msgLen & transferEnqMsg.service & transferEnqMsg.homeBranch & _
                transferEnqMsg.userId & transferEnqMsg.accNo & transferEnqMsg.fromDate & _
                transferEnqMsg.toDate & transferEnqMsg.bpRefNo & transferEnqMsg.recordStatus & _
                transferEnqMsg.lastRecCount
             
      strmsglen = Format(Len(SendMsg), "000000")
      Mid$(SendMsg, 1, 6) = strmsglen
      DataReceivedFlag = False
      TimeOutFlag = False
      MsgWouldBlock = False
      If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
         LoadError = True
         cmdGo.Enabled = True
         cmdExit.Enabled = True
         frmSarieTransferEnq.MousePointer = vbNormal
         Exit Sub
      End If
   
      parseTransferEnq
      
      If recvTransferEnqMsg.status <> "000" Then
         If UserLang = ARABIC Then
            MsgBox recvTransferEnqMsg.aRemarks
         Else
            MsgBox recvTransferEnqMsg.eRemarks
         End If
         cmdGo.Enabled = True
         cmdExit.Enabled = True
         frmSarieTransferEnq.MousePointer = vbNormal
         Exit Do
      End If
      loadLocalDb
   Loop
   Set rs = transDb.OpenRecordset("select count(*) from transferinfo")
   
   If rs.recordCount > 0 Then
      totalRecord = rs(0)
   Else
      totalRecord = 1
   End If
   
   SarieTransGrid.Rows = (totalRecord * 4) + 2
   
   startTrans = 1
   fillGridFromLocalDb
   
   'cmdFirst.Enabled = True
   cmdRefresh.Enabled = True
   cmdNext.Enabled = True
   cmdPrev.Enabled = True
   cmdPrint.Enabled = True
   cmdBmTxn.Enabled = True
   cmdTxferInfo.Enabled = True
   cmdExit.Enabled = True
   
   cmdGo.Enabled = True
   frmSarieTransferEnq.MousePointer = vbNormal
   
End Sub

Private Sub cmdMenu_Click()
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

Private Sub cmdPrint_Click()
    Dim strTransAmt As String, strPaymentAmt As String
    Dim strPaymentStatus As String
    Dim tmpStr As String
    Dim mQry As String, tDecimalPlace As String
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    If fso.FolderExists(reportPath) = False Then
       fso.CreateFolder reportPath
    End If
    
    Set outFile = fso.OpenTextFile(reportPath & "sarieTrans.out", ForWriting, True)
    page = 0
    lines = 0
    Set rs = transDb.OpenRecordset("select * from transferInfo")
    Printer.Orientation = vbPRORPortrait
    Printer.RightToLeft = False  ' for english
    Printer.FontName = "Arial"
    Printer.fontSize = 10
    transferHeaderPrint
    Do While Not rs.EOF
       If Len(RTrim(rs("transamt"))) = 0 Then
          tranAmt = 0
       Else
          If Not IsNumeric(Right(Trim(rs("transamt")), 1)) Then
             tmpStr = "-" & bmAmtToDbl(rs("transamt"))
             tranAmt = CDbl(tmpStr)
          Else
             tranAmt = CDbl(rs("transAmt"))
          End If
       End If
       mQry = "select decimalplace from currencyinfo " & _
              "where isocurrcode = '" & rs("transCurrency") & "'"
            
       Set currRS = db.OpenRecordset(mQry)
                             
       If currRS.recordCount > 0 Then
          tDecimalPlace = currRS(0)
       Else
          tDecimalPlace = "2"
       End If
   
       If tDecimalPlace = "3" Then
          coinPrecision = 3
          coinDenomination = 1000
      ElseIf tDecimalPlace = "2" Then
          coinPrecision = 2
          coinDenomination = 100
      ElseIf tDecimalPlace = "1" Then
          coinPrecision = 1
          coinDenomination = 10
      Else
          coinPrecision = 0
          coinDenomination = 1
      End If

      amtToPrint = tranAmt / coinDenomination
      strTransAmt = rs("transcurrency") & " " & Format(Format(amtToPrint, "##,###,###,###,##0" + _
                          IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
      If Len(RTrim(rs("paymentAmt"))) = 0 Then
         tranAmt = 0
      Else
         If Not IsNumeric(Right(Trim(rs("paymentAmt")), 1)) Then
            tmpStr = "-" & bmAmtToDbl(rs("paymentAmt"))
            tranAmt = CDbl(tmpStr)
          Else
            tranAmt = CDbl(rs("paymentAmt"))
          End If
      End If
         
      Set currRS = db.OpenRecordset("select decimalplace from currencyinfo " & _
                   "where isocurrcode = '" & rs("paymentCurrency") & "'")
                          
      If currRS.recordCount > 0 Then
         tDecimalPlace = currRS(0)
      Else
         tDecimalPlace = "2"
      End If

      If tDecimalPlace = "3" Then
         coinPrecision = 3
         coinDenomination = 1000
      ElseIf tDecimalPlace = "2" Then
         coinPrecision = 2
         coinDenomination = 100
      ElseIf tDecimalPlace = "1" Then
         coinPrecision = 1
         coinDenomination = 10
      Else
         coinPrecision = 0
         coinDenomination = 1
      End If

      amtToPrint = tranAmt / coinDenomination
 
      strPaymentAmt = rs("paymentcurrency") & " " & Format(Format(amtToPrint, "##,###,###,###,##0" + _
                     IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
                     
      tCode = rs("recordstatus")
      mQry = "select arabicname, englishname from transferStatusInfo where  " & _
             "transferStatusCode = '" & tCode & "'"
      Set currRS = db.OpenRecordset(mQry)
      If currRS.recordCount > 0 Then
         If UserLang = ARABIC Then
            strPaymentStatus = tCode & "-" & currRS(0)
         Else
            strPaymentStatus = tCode & "-" & currRS(1)
         End If
      Else
         strPaymentStatus = tCode & "-" & "Not defined in local"
      End If
      
      outFile.WriteLine (Format(rs("transRefNo"), "!@@@@@@@@@@@") & "   " & formatDate(rs("issuedate")) & "   " & _
                         formatDate(rs("valuedate")) & "    " & rs("debitAccNo") & _
                         "  " & strTransAmt & "  " & strPaymentAmt & "  " & strPaymentStatus)
      Printer.Print (rs("transRefNo") & "   " & formatDate(rs("issuedate")) & "   " & _
                         formatDate(rs("valuedate")) & "    " & rs("debitAccNo") & _
                         "  " & strTransAmt & "  " & strPaymentAmt & "  " & strPaymentStatus)
      lines = lines + 1
      If lines > 73 Then
         Printer.Print (String(60, "-") & "Contd..." & String(90, "-"))
         Printer.NewPage
         lines = 0
         transferHeaderPrint
      End If
      rs.MoveNext
    Loop
    Set currRS = db.OpenRecordset("select decimalplace,isocurrcode from currencyinfo " & _
                             "where currencycode = '" & Mid$(txtAcctNo, 1, 2) & "'")
                             
   If currRS.recordCount > 0 Then
      tDecimalPlace = currRS(0)
      isoCode = currRS(1)
   Else
      tDecimalPlace = "2"
      isoCode = "UNK"
   End If
     
   If tDecimalPlace = "3" Then
      coinPrecision = 3
      coinDenomination = 1000
   ElseIf tDecimalPlace = "2" Then
      coinPrecision = 2
      coinDenomination = 100
   ElseIf tDecimalPlace = "1" Then
      coinPrecision = 1
      coinDenomination = 10
   Else
      coinPrecision = 0
      coinDenomination = 1
   End If
   
   amtToPrint = totalTransAmt / coinDenomination
   
   strTransAmt = isoCode & Format(Format(amtToPrint, "##,###,###,###,##0" + _
                 IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")

    outFile.WriteLine String(160, "-")
    Printer.Print String(160, "-")
    outFile.WriteLine ("                                                                                Total    " & strTransAmt)
    Printer.Print ("                                                                                    Total    " & strTransAmt)
    outFile.WriteLine String(160, "-")
    Printer.Print String(160, "-")
    outFile.Close
    
    Printer.EndDoc
    
End Sub


Private Sub cmdRefresh_Click()
    cmdGo_Click
End Sub

Private Sub cmdTxferInfo_Click()
    SarieTransGrid_DblClick
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As Integer, tWidth As Integer, colwidth(15) As Integer
    Dim rowTitle(8) As String
    Dim tmpStr As String, tCode As String
    Static lastRecRead As String * 3
    Dim i As Integer
    
    colwidth(0) = 1300
    colwidth(1) = 1300
    colwidth(2) = 1300
    colwidth(3) = 1700
    colwidth(4) = 2300
    colwidth(5) = 2300
    colwidth(6) = 1200
    colwidth(7) = 500
    colwidth(8) = 1300
    colwidth(9) = 500
    
    frmSarieTransferEnq.Caption = frmTransferEnquiryCaption(0, UserLang)
    frmSarieTransferEnq.lblTransferEnq.Caption = frmTransferEnquiryCaption(0, UserLang)
    frmSarieTransferEnq.lblAcctNo.Caption = frmTransferEnquiryCaption(1, UserLang)
    frmSarieTransferEnq.lblStartDate.Caption = frmTransferEnquiryCaption(2, UserLang)
    frmSarieTransferEnq.lblEndDate.Caption = frmTransferEnquiryCaption(3, UserLang)
    frmSarieTransferEnq.lblBpRefNo.Caption = frmTransferEnquiryCaption(4, UserLang)
    frmSarieTransferEnq.lblRecordStatus.Caption = frmTransferEnquiryCaption(5, UserLang)
    frmSarieTransferEnq.cmdGo.Caption = frmTransferEnquiryCaption(6, UserLang)
    frmSarieTransferEnq.cmdRefresh.Caption = frmTransferEnquiryCaption(7, UserLang)
    frmSarieTransferEnq.cmdBmTxn.Caption = frmTransferEnquiryCaption(8, UserLang)
    frmSarieTransferEnq.cmdTxferInfo.Caption = frmTransferEnquiryCaption(9, UserLang)
    frmSarieTransferEnq.cmdPrint.Caption = frmTransferEnquiryCaption(10, UserLang)
    frmSarieTransferEnq.cmdPrev.Caption = frmTransferEnquiryCaption(11, UserLang)
    frmSarieTransferEnq.cmdNext.Caption = frmTransferEnquiryCaption(12, UserLang)
    frmSarieTransferEnq.cmdExit.Caption = frmTransferEnquiryCaption(13, UserLang)
    
'    rowTitle(0) = "Trans. Ref"
'    rowTitle(1) = "Issue Date"
'    rowTitle(2) = "Value Date"
'    rowTitle(3) = "Debit A/C #"
'    rowTitle(4) = "Tran Currency & Amount"
'    rowTitle(5) = "Payment Currency & Amount"
'    rowTitle(6) = "Record Status"
        
    SarieTransGrid.Clear
    SarieTransGrid.Row = 0
    SarieTransGrid.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 6
      SarieTransGrid.Col = i
      If UserLang = ARABIC Then
         SarieTransGrid.CellAlignment = flexAlignRightCenter
      Else
         SarieTransGrid.CellAlignment = flexAlignLeftCenter
      End If
      SarieTransGrid.text = frmTransferEnquiryCaption(i + 15, UserLang)
      'SarieTransGrid.Text = rowTitle(i)
      SarieTransGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
      
End Sub

Public Sub formatTransferEnqRequest(lastTransPointer As String)
    transferEnqMsg.msgLen = "000000"
    transferEnqMsg.service = "82"
    transferEnqMsg.homeBranch = Format(gBranchCode, "!@@@@")
    transferEnqMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    transferEnqMsg.accNo = Format(frmSarieTransferEnq.txtAcctNo, "!@@@@@@@@@@@@@@")
    transferEnqMsg.fromDate = txtStartYear & cmbStartMonth & cmbStartDate
    transferEnqMsg.toDate = txtEndYear & cmbEndMonth & cmbEndDate
    transferEnqMsg.bpRefNo = Format(txtBpRefNo, "!@@@@@@@@@@")
    transferEnqMsg.recordStatus = Mid$(cmbTransferStatus, 1, 1)
    transferEnqMsg.lastRecCount = lastTransPointer
End Sub

Public Sub loadLocalDb()
    Dim noOfTrans As Integer
    Dim mQry As String
    noOfTrans = Val(recvTransferEnqMsg.noOfRecs)
    On Error GoTo err_handler
    For i = 1 To noOfTrans
        mQry = "insert into transferinfo (seqno, transrefno, issuedate, valuedate, debitAccNo, transCurrency," & _
            "transAmt, paymentCurrency, paymentAmt, recordStatus) values (" & recordNo & ",'" & recvTransferEnqMsg.details(i).transRefNo & _
            "','" & recvTransferEnqMsg.details(i).issueDate & "','" & recvTransferEnqMsg.details(i).valueDate & "','" & _
          recvTransferEnqMsg.details(i).drAccNo & "','" & recvTransferEnqMsg.details(i).transCurr & "','" & _
          recvTransferEnqMsg.details(i).transAmt & "','" & recvTransferEnqMsg.details(i).paymentCurr & "','" & _
          recvTransferEnqMsg.details(i).paymentAmt & "','" & recvTransferEnqMsg.details(i).recordStatus & "')"
        transDb.Execute (mQry)
        If Err.Number = 0 Then
           recordNo = recordNo + 1
        End If
        If Not IsNumeric(Right(Trim(recvTransferEnqMsg.details(i).transAmt), 1)) Then
           tmpStr = "-" & bmAmtToDbl(recvTransferEnqMsg.details(i).transAmt)
        Else
           tmpStr = recvTransferEnqMsg.details(i).transAmt
        End If
        totalTransAmt = totalTransAmt + CDbl(tmpStr)
    Next i
    Exit Sub
    
err_handler:
   LogData "Error   " & Err.Number & "    " & Err.Description & "  during transaction loading into local db"
   Resume Next
End Sub

Private Sub fillGridFromLocalDb()
   Dim drCrFlag As String
   Dim refNo As String
   Dim i As Integer
   Dim tmpVar As Integer
   Dim mQry As String, tCode As String
   Dim rowsReqd As Integer
   Dim seqNo As Integer
   Dim k As Integer
   Dim currRS As Recordset
   Dim tDecimalPlace As String, isoCode As String
   Dim tmpStr As String
   
   Set rs = transDb.OpenRecordset("Select * from transferinfo")

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
            If i + rowsReqd > 18 Then
               Exit Do
            End If
            SarieTransGrid.Row = i
            SarieTransGrid.Col = 0
            If Mid$(rs("transAmt"), 1, 1) = "+" Then
               drCrFlag = "Cr"
            Else
               drCrFlag = "Dr"
            End If
            SarieTransGrid.text = rs("transrefno")
            SarieTransGrid.Col = 1
            SarieTransGrid.text = formatDate(rs("issuedate"))
            SarieTransGrid.Col = 2
            SarieTransGrid.text = formatDate(rs("valueDate"))
            SarieTransGrid.Col = 3
            SarieTransGrid.text = rs("debitAccNo")
            If Len(RTrim(rs("transamt"))) = 0 Then
               tranAmt = 0
            Else
               If Not IsNumeric(Right(Trim(rs("transamt")), 1)) Then
                  tmpStr = "-" & bmAmtToDbl(rs("transamt"))
                  tranAmt = CDbl(tmpStr)
               Else
                  tranAmt = CDbl(rs("transAmt"))
               End If
            End If
            mQry = "select decimalplace from currencyinfo " & _
                   "where isocurrcode = '" & rs("transCurrency") & "'"
            
            Set currRS = db.OpenRecordset(mQry)
                             
            If currRS.recordCount > 0 Then
               tDecimalPlace = currRS(0)
            Else
               tDecimalPlace = "2"
            End If
            currRS.Close
   
            If tDecimalPlace = "3" Then
               coinPrecision = 3
               coinDenomination = 1000
            ElseIf tDecimalPlace = "2" Then
               coinPrecision = 2
               coinDenomination = 100
            ElseIf tDecimalPlace = "1" Then
               coinPrecision = 1
               coinDenomination = 10
            Else
               coinPrecision = 0
               coinDenomination = 1
            End If

            amtToPrint = tranAmt / coinDenomination
            SarieTransGrid.Col = 4
            SarieTransGrid.CellAlignment = flexAlignLeftCenter
            SarieTransGrid.text = rs("transcurrency") & " " & Format(Format(amtToPrint, "##,###,###,###,##0" + _
                             IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
            If Len(RTrim(rs("paymentAmt"))) = 0 Then
               tranAmt = 0
            Else
               If Not IsNumeric(Right(Trim(rs("paymentamt")), 1)) Then
                  tmpStr = "-" & bmAmtToDbl(rs("paymentamt"))
                  tranAmt = CDbl(tmpStr)
               Else
                  tranAmt = CDbl(rs("paymentAmt"))
               End If
            End If
            
            Set currRS = db.OpenRecordset("select decimalplace from currencyinfo " & _
                             "where isocurrcode = '" & rs("paymentCurrency") & "'")
                             
            If currRS.recordCount > 0 Then
               tDecimalPlace = currRS(0)
            Else
               tDecimalPlace = "2"
            End If
            currRS.Close
   
            If tDecimalPlace = "3" Then
               coinPrecision = 3
               coinDenomination = 1000
            ElseIf tDecimalPlace = "2" Then
               coinPrecision = 2
               coinDenomination = 100
            ElseIf tDecimalPlace = "1" Then
               coinPrecision = 1
               coinDenomination = 10
            Else
               coinPrecision = 0
               coinDenomination = 1
            End If

            amtToPrint = tranAmt / coinDenomination
            SarieTransGrid.Col = 5
            SarieTransGrid.CellAlignment = flexAlignLeftCenter
            SarieTransGrid.text = rs("paymentcurrency") & " " & Format(Format(amtToPrint, "##,###,###,###,##0" + _
                             IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
            SarieTransGrid.Col = 6
            SarieTransGrid.CellAlignment = flexAlignLeftCenter
            tCode = rs("recordstatus")
            mQry = "select arabicname, englishname from transferStatusInfo where  " & _
                   "transferStatusCode = '" & tCode & "'"
            Set currRS = db.OpenRecordset(mQry)
            If currRS.recordCount > 0 Then
               If UserLang = ARABIC Then
                  tmpStr = tCode & "-" & currRS(0)
               Else
                  tmpStr = tCode & "-" & currRS(1)
               End If
            Else
               tmpStr = tCode & "-" & "Not defined in local"
            End If
            SarieTransGrid.text = tmpStr
            recordsDisplayed = recordsDisplayed + 1
            prevRecordCount(ctr) = prevRecordCount(ctr) + 1
            rs.MoveNext
       End If
   Loop
   Set currRS = db.OpenRecordset("select decimalplace,isocurrcode from currencyinfo " & _
                             "where currencycode = '" & Mid$(txtAcctNo, 1, 2) & "'")
                             
   If currRS.recordCount > 0 Then
      tDecimalPlace = currRS(0)
      isoCode = currRS(1)
   Else
      tDecimalPlace = "2"
      isoCode = "UNK"
   End If
     
   If tDecimalPlace = "3" Then
      coinPrecision = 3
      coinDenomination = 1000
   ElseIf tDecimalPlace = "2" Then
      coinPrecision = 2
      coinDenomination = 100
   ElseIf tDecimalPlace = "1" Then
      coinPrecision = 1
      coinDenomination = 10
   Else
      coinPrecision = 0
      coinDenomination = 1
   End If
   
   amtToPrint = totalTransAmt / coinDenomination
   
   SarieTransGrid.Row = i + 1
   SarieTransGrid.Col = 3
   SarieTransGrid.CellAlignment = flexAlignRightCenter
   SarieTransGrid.text = frmTransferEnquiryCaption(14, UserLang)
   SarieTransGrid.Col = 4
   SarieTransGrid.CellAlignment = flexAlignLeftCenter
   SarieTransGrid.text = isoCode & Format(Format(amtToPrint, "##,###,###,###,##0" + _
                    IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub SarieTransGrid_DblClick()
    Dim tTransRefNo As String
    Dim strmsglen As String
    Dim tCode As String
    Dim tuserId As String
    Dim tTransDate As String
    
    SarieTransGrid.Col = 0
    tTransRefNo = Format(SarieTransGrid.text, "!@@@@@@@@@@")
    SarieTransGrid.Col = 1
    tmpStr = SarieTransGrid.text
    tTransDate = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2)
    
    If Len(RTrim(tTransRefNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    tuserId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000048" & "83" & gBranchCode & tuserId & tTransRefNo & tTransDate & Space(10)
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSarieTransferEnq.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmSarieTransferEnq.MousePointer = vbDefault
       Exit Sub
    End If
    frmSarieTransferEnq.MousePointer = vbDefault
    
    parseSarieTransferDetail
    
    If recvTransferDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTransferDetail.aRemarks
       Else
          MsgBox recvTransferDetail.eRemarks
       End If
       Exit Sub
    End If
    frmSarieTransDetails.Show
    fillFrmSarieTransDetails
End Sub

Private Sub SarieTransGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
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

Private Sub txtEndYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtStartYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Sub parseTransferEnq()
    Dim pos As Integer, i As Integer
    pos = 1
    recvTransferEnqMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTransferEnqMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTransferEnqMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTransferEnqMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTransferEnqMsg.totNoOfTrans = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvTransferEnqMsg.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvTransferEnqMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTransferEnqMsg.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvTransferEnqMsg.completionFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    pos = pos + 10 ' for the fillers
    For i = 1 To CInt(recvTransferEnqMsg.noOfRecs)
        recvTransferEnqMsg.details(i).transRefNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvTransferEnqMsg.details(i).issueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvTransferEnqMsg.details(i).valueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvTransferEnqMsg.details(i).drAccNo = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvTransferEnqMsg.details(i).transCurr = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvTransferEnqMsg.details(i).transAmt = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvTransferEnqMsg.details(i).paymentCurr = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvTransferEnqMsg.details(i).paymentAmt = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvTransferEnqMsg.details(i).recordStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
    Next i
End Sub

Public Sub fillFrmSarieTransDetails()
    Dim tCode As String
    Dim tDecimalPlace As String
    
    frmSarieTransDetails.txtAcctNo = recvTransferDetail.accNo
    frmSarieTransDetails.txtCustName = recvTransferDetail.custName
    frmSarieTransDetails.txtTransRefNo = recvTransferDetail.transRefNo
    frmSarieTransDetails.txtDrAccNo = recvTransferDetail.drAccNo
    frmSarieTransDetails.cmbIssuedate = Mid$(recvTransferDetail.issueDate, 7, 2)
    frmSarieTransDetails.cmbIssueMonth = Mid$(recvTransferDetail.issueDate, 5, 2)
    frmSarieTransDetails.txtIssueYear = Mid$(recvTransferDetail.issueDate, 1, 4)
    frmSarieTransDetails.cmbValueDate = Mid$(recvTransferDetail.valueDate, 7, 2)
    frmSarieTransDetails.cmbValueMonth = Mid$(recvTransferDetail.valueDate, 5, 2)
    frmSarieTransDetails.txtValueYear = Mid$(recvTransferDetail.valueDate, 1, 4)
    tCode = recvTransferDetail.transCurrCode
    Set rs = db.OpenRecordset("select arabicname, englishname,decimalplace from currencyinfo " & _
                              "where isocurrcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSarieTransDetails.txtTransCurrency = tCode & "-" & rs(0)
       Else
          frmSarieTransDetails.txtTransCurrency = tCode & "-" & rs(1)
       End If
       tDecimalPlace = rs(2)
    Else
       frmSarieTransDetails.txtTransCurrency = tCode & "-Not defined in Local"
       tDecimalPlace = "2"
    End If
    If tDecimalPlace = "3" Then
       coinPrecision = 3
       coinDenomination = 1000
    ElseIf tDecimalPlace = "2" Then
       coinPrecision = 2
       coinDenomination = 100
    ElseIf tDecimalPlace = "1" Then
       coinPrecision = 1
       coinDenomination = 10
    Else
       coinPrecision = 0
       coinDenomination = 1
    End If
   
    If Not IsNumeric(Right(Trim(recvTransferDetail.transAmt), 1)) Then
       tmpStr = "-" & bmAmtToDbl(recvTransferDetail.transAmt)
       tranAmt = CDbl(tmpStr)
    Else
       tranAmt = CDbl(recvTransferDetail.transAmt)
    End If
    
    amtToPrint = tranAmt / coinDenomination
    frmSarieTransDetails.txtTransAmt = Format(Format(amtToPrint, "##,###,###,###,##0" + _
                             IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
    
    tCode = recvTransferDetail.paymentCurrCode
    Set rs = db.OpenRecordset("select arabicname, englishname, decimalplace from currencyinfo " & _
                              "where isocurrcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSarieTransDetails.txtPaymentCurrency = tCode & "-" & rs(0)
       Else
          frmSarieTransDetails.txtPaymentCurrency = tCode & "-" & rs(1)
       End If
       tDecimalPlace = rs(2)
    Else
       frmSarieTransDetails.txtPaymentCurrency = tCode & "-Not defined in Local"
       tDecimalPlace = "2"
    End If
    If tDecimalPlace = "3" Then
       coinPrecision = 3
       coinDenomination = 1000
    ElseIf tDecimalPlace = "2" Then
       coinPrecision = 2
       coinDenomination = 100
    ElseIf tDecimalPlace = "1" Then
       coinPrecision = 1
       coinDenomination = 10
    Else
       coinPrecision = 0
       coinDenomination = 1
    End If
    If Not IsNumeric(Right(Trim(recvTransferDetail.paymentAmt), 1)) Then
       tmpStr = "-" & bmAmtToDbl(recvTransferDetail.paymentAmt)
       tranAmt = CDbl(tmpStr)
    Else
       tranAmt = CDbl(recvTransferDetail.paymentAmt)
    End If
    
    amtToPrint = tranAmt / coinDenomination
    frmSarieTransDetails.txtPaymentAmt = Format(Format(amtToPrint, "##,###,###,###,##0" + _
                             IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
    
    frmSarieTransDetails.txtApplicantName = recvTransferDetail.applicantName
    frmSarieTransDetails.txtBenefName = recvTransferDetail.benefName
    frmSarieTransDetails.txtBenefAddr1 = recvTransferDetail.benefAddr1
    frmSarieTransDetails.txtBenefAddr2 = recvTransferDetail.benefAddr2
    frmSarieTransDetails.txtBenefBank = recvTransferDetail.benefBank
    frmSarieTransDetails.txtCorresBank = recvTransferDetail.correspondentBank
    
    tCode = recvTransferDetail.transType
    Set rs = db.OpenRecordset("select arabicname, englishname from transfertypeinfo " & _
                              "where transfertypecode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSarieTransDetails.txtTransferType = tCode & "-" & rs(0)
       Else
          frmSarieTransDetails.txtTransferType = tCode & "-" & rs(1)
       End If
    Else
       frmSarieTransDetails.txtTransferType = tCode & "-Not defined in Local"
    End If
    
    tCode = recvTransferDetail.paymentStatus
    Set rs = db.OpenRecordset("select arabicname, englishname from transferstatusinfo " & _
                              "where transferstatuscode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSarieTransDetails.txtPaymentStatus = tCode & "-" & rs(0)
       Else
          frmSarieTransDetails.txtPaymentStatus = tCode & "-" & rs(1)
       End If
    Else
       frmSarieTransDetails.txtPaymentStatus = tCode & "-Not defined in Local"
    End If
    
    tCode = recvTransferDetail.branchCode
    Set rs = db.OpenRecordset("select arabicname, englishname from branchinfo " & _
                              "where branchcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSarieTransDetails.txtBranchCode = tCode & "-" & rs(0)
       Else
          frmSarieTransDetails.txtBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmSarieTransDetails.txtBranchCode = tCode & "-Not defined in Local"
    End If
    
    frmSarieTransDetails.txtMessage1 = recvTransferDetail.message1
    frmSarieTransDetails.txtMessage2 = recvTransferDetail.message2
    frmSarieTransDetails.txtMessage3 = recvTransferDetail.message3
    frmSarieTransDetails.txtMessage4 = recvTransferDetail.message4
    
End Sub

Public Sub transferHeaderPrint()

   page = page + 1
  
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   'Printer.PaintPicture frmLogin.anbLogo, 4500, 400
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   For i = 1 To 3
       Printer.Print vbCrLf
   Next
   outFile.WriteLine ("arab national bank                                                  Date  : " & Format(Date$, "dd/mm/yyyy") & "      Time  : " & Format(Time, "hh:mm:ss"))
   Printer.Print ("                                                                                                                                                       Date  : " & Format(Date$, "dd/mm/yyyy"))
   Printer.Print ("                                                                                                                                                       Time  : " & Format(Time, "hh:mm:ss"))
   outFile.WriteLine ("                                                                                                                                                   Page  : " & page)
   Printer.Print ("                                                                                                                                                       Page  : " & page)
   outFile.WriteLine ("            TRANSFER Details  for Account number " & transferEnqMsg.accNo & _
                                        " for the period from " & formatDate(transferEnqMsg.fromDate) & " to " & formatDate(transferEnqMsg.toDate))
   Printer.Print ("            TRANSFER Details  for Account number " & transferEnqMsg.accNo & _
                                        " for the period from " & formatDate(transferEnqMsg.fromDate) & " to " & formatDate(transferEnqMsg.toDate))

   outFile.WriteLine (String(160, "-"))
   Printer.Print (String(160, "-"))
   outFile.WriteLine ("Trans.Ref.No  " & "   Issue Date  " & "   Value Date  " & "  Debit Acc No." & _
                      "Transaction Amount " & "     Payment Amount  " & " Payment Status  ")
   Printer.Print ("Trans.Ref.No  " & "   Issue Date  " & "   Value Date  " & "  Debit Acc No." & _
                      "Transaction Amount " & "     Payment Amount  " & " Payment Status  ")
   outFile.WriteLine (String(160, "-"))
   Printer.Print (String(160, "-"))
   lines = 6
End Sub




