VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmTransEnq 
   BackColor       =   &H00BFD87E&
   Caption         =   "Transaction Enquiry using specific type"
   ClientHeight    =   8325
   ClientLeft      =   540
   ClientTop       =   375
   ClientWidth     =   11355
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8325
   ScaleWidth      =   11355
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go"
      Height          =   375
      Left            =   5160
      TabIndex        =   9
      ToolTipText     =   "Go"
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   8955
      TabIndex        =   15
      ToolTipText     =   "Return to Account Menu"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next"
      Height          =   375
      Left            =   7500
      TabIndex        =   14
      ToolTipText     =   "Next"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Height          =   375
      Left            =   1200
      TabIndex        =   10
      ToolTipText     =   "Refresh"
      Top             =   7920
      Width           =   1335
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "Previous"
      Height          =   375
      Left            =   5565
      TabIndex        =   13
      ToolTipText     =   "Previous"
      Top             =   7920
      Width           =   1935
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Height          =   375
      Left            =   3990
      TabIndex        =   12
      ToolTipText     =   "Print"
      Top             =   7920
      Width           =   1575
   End
   Begin VB.CommandButton cmdDetail 
      Caption         =   "Detail"
      Height          =   375
      Left            =   2535
      TabIndex        =   11
      ToolTipText     =   "Get Detail"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.ComboBox cmbTransType 
      Height          =   315
      ItemData        =   "frmTransEnq.frx":0000
      Left            =   3000
      List            =   "frmTransEnq.frx":000A
      TabIndex        =   8
      Top             =   1560
      Width           =   1815
   End
   Begin VB.TextBox txtEndYear 
      Height          =   285
      Left            =   8760
      MaxLength       =   4
      TabIndex        =   7
      Top             =   1080
      Width           =   615
   End
   Begin VB.ComboBox cmbEndMonth 
      Height          =   315
      Left            =   8160
      TabIndex        =   6
      Top             =   1080
      Width           =   615
   End
   Begin VB.ComboBox cmbEndDate 
      Height          =   315
      Left            =   7560
      TabIndex        =   5
      Top             =   1080
      Width           =   615
   End
   Begin VB.ComboBox cmbStartDate 
      Height          =   315
      Left            =   3000
      TabIndex        =   2
      Top             =   1080
      Width           =   615
   End
   Begin VB.ComboBox cmbStartMonth 
      Height          =   315
      Left            =   3600
      TabIndex        =   3
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox txtStartYear 
      Height          =   285
      Left            =   4200
      MaxLength       =   4
      TabIndex        =   4
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox txtAcctNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3000
      TabIndex        =   1
      Top             =   600
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid BmTransGrid 
      Height          =   5295
      Left            =   1080
      TabIndex        =   17
      Top             =   2040
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   9340
      _Version        =   393216
      Rows            =   2000
      Cols            =   6
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      ScrollBars      =   1
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblTransType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Trans Type"
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
      Left            =   1200
      TabIndex        =   20
      Top             =   1560
      Width           =   1455
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
      Left            =   5760
      TabIndex        =   19
      Top             =   1080
      Width           =   1095
   End
   Begin VB.Label lblBmTransEnq 
      BackColor       =   &H00BFD87E&
      Caption         =   "Transaction Enquiry using specific type"
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
      Left            =   2880
      TabIndex        =   18
      Top             =   120
      Width           =   5775
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
      Left            =   1200
      TabIndex        =   16
      Top             =   1080
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
      Left            =   1200
      TabIndex        =   0
      Top             =   600
      Width           =   1575
   End
End
Attribute VB_Name = "frmTransEnq"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public cfBalance As Double
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

Private Sub BmTransGrid_DblClick()
    Dim tTransRefNo As String
    Dim strmsglen As String
    Dim tCode As String
    Dim tmpStr As String
    Dim tUserid As String, tAccNo As String, tValueDate As String
    
    tValueDate = Space(8)
    
    BmTransGrid.Col = 0
    tTransRefNo = Format(BmTransGrid.text, "!@@@@@@@@@@")
    
    If Len(RTrim(tTransRefNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
    
    SendMsg = "000044" & "84" & gBranchCode & tUserid & tAccNo & tTransRefNo & tValueDate
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmTransEnq.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmTransEnq.MousePointer = vbDefault
       Exit Sub
    End If
    frmTransEnq.MousePointer = vbDefault
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

Private Sub cmdDetail_Click()
    BmTransGrid_DblClick
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
       
   formatBmTransEnqRequest ("00000")
   SendMsg = bmTransEnq.msgLen & bmTransEnq.service & bmTransEnq.homeBranch & _
             bmTransEnq.userId & bmTransEnq.accNo & bmTransEnq.fromDate & _
             bmTransEnq.toDate & bmTransEnq.transType & bmTransEnq.lastRecCount
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
   cmdGo.Enabled = False
   cmdRefresh.Enabled = False
   cmdDetail.Enabled = False
   cmdPrint.Enabled = False
   cmdPrev.Enabled = False
   cmdNext.Enabled = False
   cmdExit.Enabled = False
   frmTransEnq.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmTransEnq.MousePointer = vbNormal
      Exit Sub
   End If
   
   parseBmTransEnq
      
   If recvBmTransEnqMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvBmTransEnqMsg.aRemarks
      Else
         MsgBox recvBmTransEnqMsg.eRemarks
      End If
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmTransEnq.MousePointer = vbNormal
      Exit Sub
   End If
        
   recordNo = 1
   recordsDisplayed = 0
   totalTransAmt = 0
   ctr = 1
   transDb.Execute ("delete from bmTransInfo")
      
   If recvBmTransEnqMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmTransEnq.MousePointer = vbNormal
      Exit Sub
   End If
   
   On Error Resume Next
   
   Form_Load
   cmdGo.Enabled = False
   frmTransEnq.MousePointer = vbHourglass
   loadLocalDb
   Do While recvBmTransEnqMsg.completionFlag = "0"
      formatBmTransEnqRequest (recvBmTransEnqMsg.lastRecCount)
      SendMsg = bmTransEnq.msgLen & bmTransEnq.service & bmTransEnq.homeBranch & _
                bmTransEnq.userId & bmTransEnq.accNo & bmTransEnq.fromDate & _
                bmTransEnq.toDate & bmTransEnq.transType & bmTransEnq.lastRecCount
             
      strmsglen = Format(Len(SendMsg), "000000")
      Mid$(SendMsg, 1, 6) = strmsglen
      DataReceivedFlag = False
      TimeOutFlag = False
      MsgWouldBlock = False
      If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
         LoadError = True
         cmdGo.Enabled = True
         cmdExit.Enabled = True
         frmTransEnq.MousePointer = vbNormal
         Exit Sub
      End If
   
      parseBmTransEnq
      
      If recvBmTransEnqMsg.status <> "000" Then
         If UserLang = ARABIC Then
            MsgBox recvBmTransEnqMsg.aRemarks
         Else
            MsgBox recvBmTransEnqMsg.eRemarks
         End If
         cmdGo.Enabled = True
         cmdExit.Enabled = True
         frmTransEnq.MousePointer = vbNormal
         Exit Do
      End If
      loadLocalDb
   Loop
   Set rs = transDb.OpenRecordset("select count(*) from bmtransinfo")
   
   If rs.recordCount > 0 Then
      totalRecord = rs(0)
   Else
      totalRecord = 1
   End If
   
   BmTransGrid.Rows = (totalRecord * 4) + 2
   
   startTrans = 1
   fillGridFromLocalDb
   
   cmdNext.Enabled = True
   cmdPrev.Enabled = True
   cmdPrint.Enabled = True
   cmdDetail.Enabled = True
   cmdRefresh.Enabled = True
   cmdExit.Enabled = True
   
   cmdGo.Enabled = True
   frmTransEnq.MousePointer = vbNormal
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

Private Sub Command1_Click()
    frmBMTransDetails.Show
End Sub

Private Sub cmdPrint_Click()
    Dim strTransAmt As String, strPaymentAmt As String
    Dim strTransType As String
    Dim currRS As Recordset
    Dim mQry As String, tDecimalPlace As String, isoCode As String
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    If fso.FolderExists(reportPath) = False Then
       fso.CreateFolder reportPath
    End If
    
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
    
    Set outFile = fso.OpenTextFile(reportPath & "bmTrans.out", ForWriting, True)
    page = 0
    lines = 0
    Set rs = transDb.OpenRecordset("select * from bmtransInfo")
    Printer.Orientation = vbPRORPortrait
    Printer.RightToLeft = False  ' for english
    Printer.FontName = "Arial"
    Printer.fontSize = 10
    bmTransHeaderPrint
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
      
      amtToPrint = tranAmt / coinDenomination
      
      strTransAmt = Format(Format(amtToPrint, "##,###,###,###,##0" + _
                             IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
                           
      tCode = rs("transtype")
      mQry = "select arabicname, englishname from transtypeInfo where  " & _
             "transtypeCode = '" & tCode & "'"
      Set currRS = db.OpenRecordset(mQry)
      If currRS.recordCount > 0 Then
         If UserLang = ARABIC Then
            strTransType = tCode & "-" & currRS(0)
         Else
            strTransType = tCode & "-" & currRS(1)
         End If
      Else
         strTransType = tCode & "-" & "Not defined in local"
      End If
      outFile.WriteLine (Format(rs("transRefNo"), "!@@@@@@@@@@@") & "   " & rs("userid") & "   " & _
                         formatDate(rs("transdate")) & "   " & formatDate(rs("valuedate")) & _
                                       "    " & strTransAmt & "   " & rs("transctr") & "    " & _
                                        strTransType)
      Printer.Print (Format(rs("transRefNo"), "!@@@@@@@@@@@") & "       " & rs("userid") & "          " & _
                         formatDate(rs("transdate")) & "   " & formatDate(rs("valuedate")) & _
                              "         " & strTransAmt & "          " & rs("transctr") & _
                              "      " & strTransType)
      lines = lines + 1
      If lines > 73 Then
         Printer.Print (String(60, "-") & "Contd..." & String(90, "-"))
         Printer.NewPage
         lines = 0
         bmTransHeaderPrint
      End If
      rs.MoveNext
    Loop
   
    amtToPrint = totalTransAmt / coinDenomination
   
    strTransAmt = Format(Format(amtToPrint, "##,###,###,###,##0" + _
                  IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
    outFile.WriteLine String(160, "-")
    Printer.Print String(160, "-")
    outFile.WriteLine ("                                                                          Total    " & strTransAmt)
    Printer.Print ("                                                                              Total    " & strTransAmt)
    outFile.WriteLine String(160, "-")
    Printer.Print String(160, "-")
    
    Printer.EndDoc
    outFile.Close

End Sub

Private Sub cmdRefresh_Click()
    cmdGo_Click
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

    colwidth(0) = 1500
    colwidth(1) = 800
    colwidth(2) = 1500
    colwidth(3) = 2200
    colwidth(4) = 1200
    colwidth(5) = 1600
    colwidth(6) = 1800
    colwidth(7) = 500
    colwidth(8) = 1300
    colwidth(9) = 500
    
    frmTransEnq.Caption = frmBmTransEnqCaption(0, UserLang)
    frmTransEnq.lblBmTransEnq.Caption = frmBmTransEnqCaption(0, UserLang)
    frmTransEnq.lblAcctNo.Caption = frmBmTransEnqCaption(1, UserLang)
    frmTransEnq.lblStartDate.Caption = frmBmTransEnqCaption(2, UserLang)
    frmTransEnq.lblEndDate.Caption = frmBmTransEnqCaption(3, UserLang)
    frmTransEnq.lblTransType.Caption = frmBmTransEnqCaption(4, UserLang)
    frmTransEnq.cmdGo.Caption = frmBmTransEnqCaption(5, UserLang)
    frmTransEnq.cmdRefresh.Caption = frmBmTransEnqCaption(6, UserLang)
    frmTransEnq.cmdDetail.Caption = frmBmTransEnqCaption(7, UserLang)
    frmTransEnq.cmdPrint.Caption = frmBmTransEnqCaption(8, UserLang)
    frmTransEnq.cmdPrev.Caption = frmBmTransEnqCaption(9, UserLang)
    frmTransEnq.cmdNext.Caption = frmBmTransEnqCaption(10, UserLang)
    frmTransEnq.cmdExit.Caption = frmBmTransEnqCaption(11, UserLang)
    
'    rowTitle(0) = "Trans. Ref"
'    rowTitle(1) = "User Id"
'    rowTitle(2) = "Transaction Date"
'    rowTitle(3) = "Trans Amount"
'    rowTitle(4) = "Trans Counter"
'    rowTitle(5) = "Trans Type"
     
    BmTransGrid.Clear
    BmTransGrid.Row = 0
    BmTransGrid.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 5
      BmTransGrid.Col = i
      If UserLang = ARABIC Then
         BmTransGrid.CellAlignment = flexAlignRightCenter
      Else
         BmTransGrid.CellAlignment = flexAlignLeftCenter
      End If
      BmTransGrid.text = frmBmTransEnqCaption(i + 13, UserLang)
      'BmTransGrid.Text = rowTitle(i)
      BmTransGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    
    BmTransGrid.Width = tWidth + 100
      
End Sub


Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub bmTransGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
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
Public Sub formatBmTransEnqRequest(lastTransPointer As String)
     
    bmTransEnq.msgLen = "000000"
    bmTransEnq.service = "85"
    bmTransEnq.homeBranch = Format(gBranchCode, "!@@@@")
    bmTransEnq.userId = Format(gUserId, "!@@@@@@@@@@")
    bmTransEnq.accNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
    bmTransEnq.fromDate = txtStartYear & cmbStartMonth & cmbStartDate
    bmTransEnq.toDate = txtEndYear & cmbEndMonth & cmbEndDate
    bmTransEnq.transType = Mid$(cmbTransType, 1, 2)
    bmTransEnq.lastRecCount = lastTransPointer
End Sub

Public Sub loadLocalDb()
    Dim noOfTrans As Integer
    Dim mQry As String
    Dim tmpStr As String
    noOfTrans = Val(recvBmTransEnqMsg.noOfRecs)
    On Error GoTo err_handler
    For i = 1 To noOfTrans
        mQry = "insert into bmTransInfo (seqno, transrefno, userid, transdate, valuedate, " & _
            "transAmt, transCtr, transtype) values (" & recordNo & ",'" & recvBmTransEnqMsg.details(i).transRefNo & _
            "','" & recvBmTransEnqMsg.details(i).userId & "','" & recvBmTransEnqMsg.details(i).transDate & "','" & recvBmTransEnqMsg.details(i).valueDate & "','" & _
          recvBmTransEnqMsg.details(i).transAmt & "','" & _
          recvBmTransEnqMsg.details(i).transCtr & "','" & _
          recvBmTransEnqMsg.details(i).transType & "')"
        transDb.Execute (mQry)
        If Err.Number = 0 Then
           recordNo = recordNo + 1
        End If
        If Not IsNumeric(Right(Trim(recvBmTransEnqMsg.details(i).transAmt), 1)) Then
           tmpStr = "-" & bmAmtToDbl(recvBmTransEnqMsg.details(i).transAmt)
        Else
           tmpStr = recvBmTransEnqMsg.details(i).transAmt
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
   Dim tDecimalPlace As String
   Dim tmpStr As String, isoCode As String
   
   Set rs = transDb.OpenRecordset("Select * from bmtransinfo")
     
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
            BmTransGrid.Row = i
            BmTransGrid.Col = 0
            If Mid$(rs("transAmt"), 1, 1) = "+" Then
               drCrFlag = "Cr"
            Else
               drCrFlag = "Dr"
            End If
            BmTransGrid.text = rs("transrefno")
            BmTransGrid.Col = 1
            BmTransGrid.text = rs("userid")
            BmTransGrid.Col = 2
            BmTransGrid.text = formatDate(rs("transdate"))
'            BmTransGrid.Col = 2
'            BmTransGrid.Text = formatDate(rs("valueDate"))
            BmTransGrid.Col = 3
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
            
            amtToPrint = tranAmt / coinDenomination
            BmTransGrid.CellAlignment = flexAlignLeftCenter
            BmTransGrid.text = Format(Format(amtToPrint, "##,###,###,###,##0" & _
                             IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
            BmTransGrid.Col = 4
            BmTransGrid.CellAlignment = flexAlignLeftCenter
            BmTransGrid.text = rs("transctr")
            
            BmTransGrid.Col = 5
            BmTransGrid.CellAlignment = flexAlignLeftCenter
            
            tCode = rs("transtype")
            mQry = "select arabicname, englishname from transtypeInfo where  " & _
                   "transtypeCode = '" & tCode & "'"
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
            BmTransGrid.text = tmpStr
            
            recordsDisplayed = recordsDisplayed + 1
            prevRecordCount(ctr) = prevRecordCount(ctr) + 1
            rs.MoveNext
       End If
   Loop
   
   amtToPrint = totalTransAmt / coinDenomination
   
   BmTransGrid.Row = i + 1
   BmTransGrid.Col = 2
   BmTransGrid.CellAlignment = flexAlignRightCenter
   BmTransGrid.text = frmBmTransEnqCaption(12, UserLang)
   BmTransGrid.Col = 3
   BmTransGrid.CellAlignment = flexAlignLeftCenter
   BmTransGrid.text = Format(Format(amtToPrint, "##,###,###,###,##0" + _
                    IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")

End Sub

Public Sub parseBmTransEnq()
    Dim pos As Integer, i As Integer
    pos = 1
    recvBmTransEnqMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBmTransEnqMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBmTransEnqMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBmTransEnqMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBmTransEnqMsg.totNoOfTrans = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvBmTransEnqMsg.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvBmTransEnqMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBmTransEnqMsg.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvBmTransEnqMsg.completionFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    pos = pos + 10 ' for the fillers
    For i = 1 To CInt(recvBmTransEnqMsg.noOfRecs)
        recvBmTransEnqMsg.details(i).transRefNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvBmTransEnqMsg.details(i).transDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvBmTransEnqMsg.details(i).valueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvBmTransEnqMsg.details(i).userId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvBmTransEnqMsg.details(i).transAmt = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvBmTransEnqMsg.details(i).transCtr = Mid$(RecvStr, pos, 5)
        pos = pos + 5
        recvBmTransEnqMsg.details(i).transType = Mid$(RecvStr, pos, 2)
        pos = pos + 2
    Next i
End Sub

Public Sub bmTransHeaderPrint()
   page = page + 1
   
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   For i = 1 To 3
       Printer.Print vbCrLf
   Next
   outFile.WriteLine ("arab national bank                                                  Date  : " & Format(Date$, "dd/mm/yyyy") & "      Time  : " & Format(Time, "hh:mm:ss"))
   Printer.Print ("                                                                                                                                                       Date  : " & Format(Date$, "dd/mm/yyyy"))
   Printer.Print ("                                                                                                                                                       Time  : " & Format(Time, "hh:mm:ss"))
   outFile.WriteLine ("                                                                                                                                                   Page  : " & page)
   Printer.Print ("                                                                                                                                                       Page  : " & page)
   outFile.WriteLine ("            BM Transaction Details  for Account number " & bmTransEnq.accNo & _
                                        " for the period from " & formatDate(bmTransEnq.fromDate) & " to " & formatDate(bmTransEnq.toDate))
   Printer.Print ("            BM Transaction Details  for Account number " & bmTransEnq.accNo & _
                                        " for the period from " & formatDate(bmTransEnq.fromDate) & " to " & formatDate(bmTransEnq.toDate))

   outFile.WriteLine (String(160, "-"))
   Printer.Print (String(160, "-"))
   outFile.WriteLine ("Trans.Ref.No  " & "  User Id" & "    Trans Date  " & "   Value Date  " & _
                      "Transaction Amount " & " Trans. Counter     Trans.type   ")
   Printer.Print ("Trans.Ref.No  " & "  User Id" & "    Trans Date  " & "   Value Date  " & _
                      "Transaction Amount " & " Trans. Counter    Trans.Type    ")
   outFile.WriteLine (String(160, "-"))
   Printer.Print (String(160, "-"))
   lines = 6

End Sub




