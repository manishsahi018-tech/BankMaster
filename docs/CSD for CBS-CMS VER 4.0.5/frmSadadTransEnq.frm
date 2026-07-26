VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSadadTransEnq 
   BackColor       =   &H00BFD87E&
   Caption         =   "SADAD Transaction enquiry"
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
   Begin VB.TextBox txtSubscriptionNo 
      Height          =   285
      Left            =   7875
      TabIndex        =   17
      Top             =   615
      Width           =   3015
   End
   Begin VB.CommandButton cmdFirst 
      Caption         =   "First"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1620
      TabIndex        =   16
      ToolTipText     =   "Next"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.TextBox txtTellerId 
      Height          =   285
      Left            =   5625
      MaxLength       =   10
      TabIndex        =   4
      Top             =   1080
      Width           =   1215
   End
   Begin VB.ComboBox cmbCompanyId 
      Height          =   315
      Left            =   2325
      TabIndex        =   0
      Text            =   "cmbCompanyId"
      Top             =   555
      Width           =   2655
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Print"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6600
      TabIndex        =   13
      ToolTipText     =   "Print"
      Top             =   7920
      Width           =   1575
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "Previous"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3150
      TabIndex        =   12
      ToolTipText     =   "Previous"
      Top             =   7920
      Width           =   1935
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Enabled         =   0   'False
      Height          =   375
      Left            =   240
      TabIndex        =   11
      ToolTipText     =   "Refresh"
      Top             =   7920
      Width           =   1335
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go"
      Default         =   -1  'True
      Height          =   375
      Left            =   7080
      TabIndex        =   5
      ToolTipText     =   "Go"
      Top             =   1020
      Width           =   1335
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5100
      TabIndex        =   6
      ToolTipText     =   "Next"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   8220
      TabIndex        =   7
      ToolTipText     =   "Return to Account Menu"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.ComboBox cmbTransDate 
      Height          =   315
      Left            =   2310
      TabIndex        =   1
      Top             =   1080
      Width           =   615
   End
   Begin VB.ComboBox cmbTransMonth 
      Height          =   315
      Left            =   2910
      TabIndex        =   2
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox txtTransYear 
      Height          =   285
      Left            =   3510
      MaxLength       =   4
      TabIndex        =   3
      Top             =   1080
      Width           =   615
   End
   Begin MSFlexGridLib.MSFlexGrid sadadTransGrid 
      Height          =   5910
      Left            =   195
      TabIndex        =   9
      Top             =   1545
      Width           =   11400
      _ExtentX        =   20108
      _ExtentY        =   10425
      _Version        =   393216
      Rows            =   2000
      Cols            =   12
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblSubscriptionNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Subscription Number"
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
      Left            =   5415
      TabIndex        =   18
      Top             =   600
      Width           =   2325
   End
   Begin VB.Label lblTellerId 
      BackColor       =   &H00BFD87E&
      Caption         =   "Teller Id"
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
      Left            =   4530
      TabIndex        =   15
      Top             =   1080
      Width           =   1005
   End
   Begin VB.Label lblCompanyId 
      BackColor       =   &H00BFD87E&
      Caption         =   "Utility company Id"
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
      Left            =   180
      TabIndex        =   14
      Top             =   555
      Width           =   2055
   End
   Begin VB.Label lblSadadTransEnq 
      BackColor       =   &H00BFD87E&
      Caption         =   "SADAD Transaction enquiry"
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
      Left            =   4020
      TabIndex        =   10
      Top             =   60
      Width           =   4110
   End
   Begin VB.Label lblTransDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Transaction Date"
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
      TabIndex        =   8
      Top             =   1110
      Width           =   1530
   End
End
Attribute VB_Name = "frmSadadTransEnq"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public coinDenomination As Integer
Public coinPrecision As Integer
Public amtToPrint As Double
Public billAmt As Double
Public totalTransAmt As Double
Public displayFromLocal As Boolean
Public recordNo As Long
Public totalRecord As Long
Public recordsDisplayed As Integer
Public fso As FileSystemObject
Public outFile As Object
Public lines As Integer
Public page As Integer
Public langChar As String
Dim prevRecordCount(2) As Integer
Public ctr As Integer
Public startTrans As Integer

Private Sub cmbCompanyId_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdıExit" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbCompanyId.text)) <> 0 Then
         tCode = Trim(Mid$(cmbCompanyId.text, 1, 4))
         For i = 0 To cmbCompanyId.ListCount
             If Trim(Mid$(cmbCompanyId.List(i), 1, 4)) = tCode Then
                cmbCompanyId.ListIndex = i
                Exit For
             End If
         Next i
      End If
  End If
  On Error GoTo 0
End Sub

Private Sub cmbTransDate_Change()
If Len(RTrim(cmbTransDate.text)) <> 0 Then
   If Len(cmbTransDate.text) = 2 Then
      If cmbTransDate < 1 Or cmbTransDate > 31 Then
         MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
         cmbTransDate.text = ""
         cmbTransDate.SetFocus
      Else
         On Error Resume Next
         cmbTransMonth.SetFocus
      End If
   End If
End If
End Sub

Private Sub cmbTransDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbTransMonth_Change()
   If Len(RTrim(cmbTransMonth.text)) <> 0 Then
      If Len(cmbTransMonth.text) = 2 Then
         If cmbTransMonth < 1 Or cmbTransMonth > 12 Then
            MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            cmbTransMonth.text = ""
            cmbTransMonth.SetFocus
          Else
            On Error Resume Next
            txtTransYear.SetFocus
          End If
      End If
  End If
End Sub

Private Sub cmbTransMonth_KeyPress(KeyAscii As Integer)
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

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdGo_Click()
   Dim tDate As String, tDecimalPlace As String
   
'   If Len(RTrim(cmbStartDate)) = 0 Or _
'      Len(RTrim(cmbStartMonth)) = 0 Or _
'      Len(RTrim(txtStartYear)) = 0 Then
'      MsgBox errInvalidDate(UserLang)   '"From Date is blank or Incomplete From Date"
'      cmbStartDate.SetFocus
'      Exit Sub
'   End If
'
'   If Len(RTrim(cmbEndDate)) = 0 Or _
'      Len(RTrim(cmbEndMonth)) = 0 Or _
'      Len(RTrim(txtEndYear)) = 0 Then
'      MsgBox errInvalidDate(UserLang)    '"To_Date is blank or Incomplete To Date"
'      cmbToDate.SetFocus
'      Exit Sub
'   End If
   
   tDate = Format(txtTransYear, "0000") & _
           Format(cmbTransMonth, "00") & _
           Format(cmbTransDate, "00")
   
   If Len(tDate) > 0 Then
      If validDate(tDate) = False Then
         MsgBox errInvalidDate(UserLang)
         cmbTransDate.SetFocus
         Exit Sub
      End If
   End If
   
   If Len(RTrim(txtSubscriptionNo)) > 0 Then
      If Len(RTrim(cmbCompanyId)) = 0 Then
         MsgBox errSpaceCompanyId(UserLang)
         cmbCompanyId.SetFocus
         Exit Sub
      End If
   End If
   
   If Len(RTrim(cmbCompanyId)) > 0 Then
      tCode = Mid$(cmbCompanyId, 1, 4)
      mQry = "select * from companyIdInfo where  companyId = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount <= 0 Then
         MsgBox errBillerIdNotDefined(UserLang)  '"Biller Id not defined in local DB.. Please check.."
         Exit Sub
      End If
   End If
   
   formatSadadTransEnqRequest ("00000")
   cmdGo.Enabled = False
   cmdRefresh.Enabled = False
   cmdFirst.Enabled = False
   cmdNext.Enabled = False
   cmdPrev.Enabled = False
   cmdPrint.Enabled = False
   cmdExit.Enabled = False
   frmSadadTransEnq.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmSadadTransEnq.MousePointer = vbNormal
      Exit Sub
   End If
   
   parseSadadTransEnq
   frmSadadTransEnq.MousePointer = vbNormal
   
   If recvSadadTransEnqMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvSadadTransEnqMsg.aRemarks
      Else
         MsgBox recvSadadTransEnqMsg.eRemarks
      End If
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      Exit Sub
   End If
   cmdGo.Enabled = True
   cmdExit.Enabled = True
        
   recordNo = 1
   recordsDisplayed = 0
   totalTransAmt = 0
   ctr = 1
   transDb.Execute ("delete from sadadTransInfo")
      
   If recvSadadTransEnqMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      Exit Sub
   End If
   
   On Error Resume Next
   
   printGridHeading
   cmdGo.Enabled = False
   cmdExit.Enabled = False
   frmSadadTransEnq.MousePointer = vbHourglass
   loadLocalDb
   Do While recvSadadTransEnqMsg.completionFlag = "0"
      formatSadadTransEnqRequest (recvSadadTransEnqMsg.lastRecCount)
      cmdGo.Enabled = False
      cmdRefresh.Enabled = False
      cmdFirst.Enabled = False
      cmdNext.Enabled = False
      cmdPrev.Enabled = False
      cmdPrint.Enabled = False
      cmdExit.Enabled = False
      frmSadadTransEnq.MousePointer = vbHourglass
      If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
         LoadError = True
         cmdGo.Enabled = True
         cmdExit.Enabled = True
         frmSadadTransEnq.MousePointer = vbNormal
         Exit Sub
      End If
      cmdGo.Enabled = True
      cmdExit.Enabled = True
   
      parseSadadTransEnq
      frmSadadTransEnq.MousePointer = vbNormal
   
      If recvSadadTransEnqMsg.status <> "000" Then
         If UserLang = ARABIC Then
            MsgBox recvSadadTransEnqMsg.aRemarks
         Else
            MsgBox recvSadadTransEnqMsg.eRemarks
         End If
         cmdGo.Enabled = True
         cmdExit.Enabled = True
         Exit Sub
      End If
      loadLocalDb
   Loop
   Set rs = transDb.OpenRecordset("select count(*) from sadadTransInfo")
   
   If rs.recordCount > 0 Then
      totalRecord = rs(0)
   Else
      totalRecord = 1
   End If
   
   sadadTrandgrid.Rows = (totalRecord * 4) + 2
   
   startTrans = 1
   fillGridFromLocalDb
   
   cmdFirst.Enabled = True
   cmdRefresh.Enabled = True
   cmdNext.Enabled = True
   cmdPrev.Enabled = True
   cmdPrint.Enabled = True
   cmdExit.Enabled = True
   
   cmdGo.Enabled = True
   frmSadadTransEnq.MousePointer = vbNormal
   
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
        
    MsgBox errOnlyLocalBrnTxn(UserLang) '"Only transaction originated from your branch will be printed on the report"
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    If fso.FolderExists(reportPath) = False Then
       fso.CreateFolder reportPath
    End If
    
    Set outFile = fso.OpenTextFile(reportPath & "sadadTransN.prt", ForWriting, True)
    
    generateReport "N"
    On Error GoTo 0
    Set outFile = fso.OpenTextFile(reportPath & "sadadTransR.prt", ForWriting, True)
    generateReport "R"
    On Error GoTo 0
    
End Sub

Public Sub generateReport(normalOrReversal As String)
    Dim strTransAmt As String, strCompanyId As String
    Dim strPaymentStatus As String, strPostingStatus As String
    Dim tmpStr As String
    Dim cashTotal As Double, accTotal As Double
    Dim totalNoOfBills As Integer
    Dim mQry As String, tDecimalPlace As String
 
    page = 0
    lines = 0
    totalNoOfBills = 0
    cashTotal = 0
    accTotal = 0
     'langChar = Chr$(253)  ' for english
    
    langChar = Chr$(254)  ' for arabic
    On Error GoTo prn_err
    'Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.Orientation = vbPRORPortrait    ' for Portrait
    Printer.FontName = "Courier New (Arabic)"
    Printer.fontSize = 10
    Printer.FontBold = False
    'Printer.RightToLeft = False '  for english
    Printer.RightToLeft = True ' for arabic
    
    If normalOrReversal = "R" Then
       Set rs = transDb.OpenRecordset("select * from sadadTransInfo where branchCode ='" & gBranchCode & "' and (postingStatus = 'R' or postingstatus = 'T')")
    Else
       Set rs = transDb.OpenRecordset("select * from sadadTransInfo where branchCode ='" & gBranchCode & "' and postingStatus = 'N'")
    End If
    sadadTransHeaderPrint normalOrReversal
    Do While Not rs.EOF
       If Len(RTrim(rs("billAmt"))) = 0 Then
          billAmt = 0
       Else
          billAmt = Val(rs("billAmt"))
       End If
       If rs("cashOrAcc") = "C" Then
          cashTotal = cashTotal + billAmt
       Else
          accTotal = accTotal + billAmt
       End If
       coinPrecision = 2
       coinDenomination = 100
       amtToPrint = billAmt / coinDenomination
       strTransAmt = Format(Format(amtToPrint, "#,###,##0" & _
                     IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@")
       tCode = rs("paymentType")
       mQry = "select arabicname, englishname from sadadPaymentTypeInfo where  " & _
              "sadadPaymentType = '" & tCode & "'"
       Set tmpRs = db.OpenRecordset(mQry)
       If tmpRs.recordCount > 0 Then
          strPaymentStatus = tCode & "-" & tmpRs(0)
       Else
          strPaymentStatus = tCode & "-" & errUnknown(0) '"Undefined"
       End If
       
       strPaymentStatus = Format(strPaymentStatus, "!@@@@@@@@@@@@@@@")
       
       tCode = rs("companyId")
       mQry = "select arabicName, englishName from companyIdInfo " & _
              "where companyId = '" & tCode & "'"
       Set tmpRs = db.OpenRecordset(mQry)
       If tmpRs.recordCount > 0 Then
          strCompanyId = tCode & "-" & Format(tmpRs(0), "!@@@@@@@@@@")
       Else
          strCompanyId = tCode & Format(errUnknown(0), "!@@@@@@@@@@")
       End If
       
       tCode = rs("postingstatus")
       If tCode = "N" Then
          tmpStr = errBillPaid(0)  '"Bill Paid"
       ElseIf tCode = "R" Then
          tmpStr = errBillReversed(0) '"Bill Reversed"
       ElseIf tCode = "T" Then
          tmpStr = errBillTerminated(0) '"Bill Terminated"
       Else
          tmpStr = errUnknown(0) '"Undefined"
       End If
       strPostingStatus = tCode & "-" & tmpStr
       outFile.WriteLine (formatDate(rs("transdate")) & "   " & langChar & "    " & strCompanyId & "   " & langChar & Format(rs("subsNo"), "@@@@@@@@@@@@@@@@") & langChar & _
                      Format(rs("debitAccNo"), "!@@@@@@@@@@@@@@@") & "   " & langChar & strTransAmt)
       outFile.WriteLine (rs("tellerId") & "   " & langChar & "  " & Format(rs("transRefNo"), "!@@@@@@@@@@@") & _
                          "   " & formatDate(rs("valuedate")) & "   " & langChar & strPaymentStatus & _
                          "   " & langChar & strPostingStatus & langChar)
       'Printer.Print (formatDate(rs("transdate")) & "   " & rs("tellerId") & "  " & langChar & Format(rs("transRefNo"), "!@@@@@@@@@@@") & langChar & _
                      strCompanyId & " " & langChar & Format(rs("subsNo"), "@@@@@@@@@@@@@@@@") & langChar & "  " & _
                      Format(rs("debitAccNo"), "!@@@@@@@@@@@@@@@") & "  " & langChar & strTransAmt & langChar & rs("postingStatus") & langChar)
       Printer.Print (formatDate(rs("transdate")) & "  " & langChar & Format(rs("transRefNo"), "!@@@@@@@@@@@") & langChar & _
                      strCompanyId & " " & langChar & Format(rs("subsNo"), "@@@@@@@@@@@@@@@@") & langChar & "  " & _
                      Format(rs("debitAccNo"), "!@@@@@@@@@@@@@@@") & "  " & langChar & strTransAmt & langChar & rs("postingStatus") & langChar)
       Printer.Print
       lines = lines + 1
       lines = lines + 1
       totalNoOfBills = totalNoOfBills + 1
       If lines > 65 Then
          Printer.Print (String(60, "-") & "«” „—«—..." & String(90, "-"))
          Printer.NewPage
          lines = 0
          sadadTransHeaderPrint normalOrReversal
       End If
      rs.MoveNext
    Loop
    outFile.WriteLine String(160, "-")
    Printer.Print String(160, "-")
    outFile.WriteLine ("         ⁄œœ «·›Ê« Ì—     " & totalNoOfBills)
    Printer.Print ("         ⁄œœ «·›Ê« Ì—     " & totalNoOfBills & langChar)
    coinPrecision = 2
    coinDenomination = 100
    amtToPrint = cashTotal / coinDenomination
    strTransAmt = Format(Format(amtToPrint, "##,###,###,###,##0" & _
                  IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
    Printer.Print ("     „Ã„Ê⁄ Õ—ﬂ«  «·‰ﬁœ  : " & strTransAmt & langChar)
    amtToPrint = accTotal / coinDenomination
    strTransAmt = Format(Format(amtToPrint, "##,###,###,###,##0" & _
                  IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
    Printer.Print ("     „Ã„Ê⁄ Õ—ﬂ«  «·Õ”«»  : " & strTransAmt & langChar)
    
    outFile.WriteLine String(160, "-")
    Printer.Print String(160, "-")
    outFile.Close
    
    Printer.EndDoc
    Exit Sub
prn_err:
    MsgBox "Error  " & Err.Number & "  " & Err.Description & "  occured while printing .. Please check.."
    Exit Sub
 
End Sub

Private Sub cmdRefresh_Click()
    cmdGo_Click
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
    
    If UserLang = ARABIC Then
       ChangePositions frmSadadTransEnq, 11800
       frmSadadTransEnq.RightToLeft = True
    End If
    
    frmSadadTransEnq.Caption = frmSadadTransEnqCaption(0, UserLang)
    lblSadadTransEnq.Caption = frmSadadTransEnqCaption(0, UserLang)
    lblCompanyId.Caption = frmSadadTransEnqCaption(1, UserLang)
    lblSubscriptionNo.Caption = frmSadadTransEnqCaption(2, UserLang)
    lblTransDate.Caption = frmSadadTransEnqCaption(3, UserLang)
    lblTellerId.Caption = frmSadadTransEnqCaption(4, UserLang)
    cmdGo.Caption = frmSadadTransEnqCaption(5, UserLang)
    cmdRefresh.Caption = frmSadadTransEnqCaption(6, UserLang)
    cmdFirst.Caption = frmSadadTransEnqCaption(7, UserLang)
    cmdPrev.Caption = frmSadadTransEnqCaption(8, UserLang)
    cmdNext.Caption = frmSadadTransEnqCaption(9, UserLang)
    cmdPrint.Caption = frmSadadTransEnqCaption(10, UserLang)
    cmdExit.Caption = frmSadadTransEnqCaption(11, UserLang)
    
    mQry = "select * from companyidinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbCompanyId.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbCompanyId.AddItem Format(rs("companyid"), "!@@@@") & "-" & rs("englishname")
          Else
             cmbCompanyId.AddItem Format(rs("companyid"), "!@@@@") & "-" & rs("arabicname")
          End If
          rs.MoveNext
       Loop
    End If
    
    For i = 1 To 31
        If i < 10 Then
           num = "0" & i
        Else
           num = i
        End If
        cmbTransDate.AddItem num
        If i < 13 Then
           cmbTransMonth.AddItem num
        End If
    Next
        
    printGridHeading
      
End Sub

Public Sub formatSadadTransEnqRequest(lastTransPointer As String)
    Dim strmsglen As String
    
    sadadTransEnqMsg.msgLen = "000000"
    sadadTransEnqMsg.service = "AY"
    sadadTransEnqMsg.homeBranch = Format(gBranchCode, "!@@@@")
    sadadTransEnqMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    sadadTransEnqMsg.tellerId = Format(recvLoginMsg.bpUserId, "!@@@")
    sadadTransEnqMsg.companyId = Format(Mid$(cmbCompanyId, 1, 4), "!@@@@")
    sadadTransEnqMsg.transDate = txtTransYear & cmbTransMonth & cmbTransDate
    sadadTransEnqMsg.enqTellerId = Format(UCase(txtTellerId), "!@@@")
    sadadTransEnqMsg.subscriptionNo = Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
    sadadTransEnqMsg.lastRecCount = lastTransPointer
    
    SendMsg = sadadTransEnqMsg.msgLen & sadadTransEnqMsg.service & sadadTransEnqMsg.homeBranch & _
              sadadTransEnqMsg.userId & sadadTransEnqMsg.tellerId & sadadTransEnqMsg.companyId & _
              sadadTransEnqMsg.transDate & sadadTransEnqMsg.enqTellerId & sadadTransEnqMsg.subscriptionNo & _
              sadadTransEnqMsg.lastRecCount
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False

End Sub

Public Sub loadLocalDb()
    Dim noOfTrans As Integer
    Dim mQry As String
    noOfTrans = Val(recvSadadTransEnqMsg.noOfRecs)
    On Error GoTo err_handler
    For i = 1 To noOfTrans
        Err.Number = 0
        mQry = "insert into sadadTransInfo (seqno, transDate, branchCode, tellerId, companyId, subsNo, debitAccNo, billAmt, transrefno, valuedate," & _
            "paymentType, preOrPostpaid, transType, postingStatus, cashOrAcc, supervisorId) values (" & recordNo & ",'" & recvSadadTransEnqMsg.details(i).transDate & _
            "','" & recvSadadTransEnqMsg.details(i).branchCode & "','" & recvSadadTransEnqMsg.details(i).tellerId & "','" & recvSadadTransEnqMsg.details(i).companyId & "','" & _
           recvSadadTransEnqMsg.details(i).subsNo & "','" & recvSadadTransEnqMsg.details(i).drAccNo & "','" & _
           recvSadadTransEnqMsg.details(i).billAmt & "','" & recvSadadTransEnqMsg.details(i).transRefNo & "','" & _
           recvSadadTransEnqMsg.details(i).valueDate & "','" & recvSadadTransEnqMsg.details(i).paymentType & "','" & _
           recvSadadTransEnqMsg.details(i).preOrPostpaid & "','" & recvSadadTransEnqMsg.details(i).transType & "','" & _
           recvSadadTransEnqMsg.details(i).postingStatus & "','" & recvSadadTransEnqMsg.details(i).cashOrAcc & "','" & _
           recvSadadTransEnqMsg.details(i).supervisorId & "')"
        transDb.Execute (mQry)
        If Err.Number = 0 Then
           recordNo = recordNo + 1
        End If
    Next i
    On Error GoTo 0
    Exit Sub
    
err_handler:
   LogData "Error   " & Err.Number & "    " & Err.Description & "  during SADAD transaction loading into local db"
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
   Dim tmpRs As Recordset
   Dim tDecimalPlace As String, isoCode As String
   Dim tmpStr As String
   
   Set rs = transDb.OpenRecordset("Select * from sadadTransInfo")

   i = 0
   k = 0
   If ctr = 1 Then
      ctr = 2
   Else
      prevRecordCount(1) = prevRecordCount(2)
   End If
   prevRecordCount(ctr) = 0
   rowsReqd = 1
   printGridHeading
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
            sadadTransGrid.Row = i
            sadadTransGrid.Col = 0
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            sadadTransGrid.text = formatDate(rs("transDate"))
            sadadTransGrid.Col = 1
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            sadadTransGrid.text = rs("branchCode")
            sadadTransGrid.Col = 2
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            sadadTransGrid.text = rs("tellerId")
            sadadTransGrid.Col = 3
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            tCode = rs("companyId")
            mQry = "select arabicName, englishName from companyIdInfo " & _
                   "where companyId = '" & tCode & "'"
            Set tmpRs = db.OpenRecordset(mQry)
            If tmpRs.recordCount > 0 Then
               If UserLang = ARABIC Then
                  sadadTransGrid.text = tCode & "-" & tmpRs(0)
               Else
                  sadadTransGrid.text = tCode & "-" & tmpRs(1)
               End If
            Else
               sadadTransGrid.text = tCode & "-Not defined in localDB"
            End If
               
            sadadTransGrid.Col = 4
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            sadadTransGrid.text = rs("subsNo")
            sadadTransGrid.Col = 5
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            If rs("cashorAcc") = "C" Then
               sadadTransGrid.text = "CASH"
            Else
               sadadTransGrid.text = rs("debitAccNo")
            End If
            sadadTransGrid.Col = 6
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            If Len(RTrim(rs("billAmt"))) = 0 Then
               billAmt = 0
            Else
               billAmt = Val(rs("billAmt"))
            End If
            coinPrecision = 2
            coinDenomination = 100
            
            amtToPrint = billAmt / coinDenomination
            
            sadadTransGrid.text = Format(Format(amtToPrint, "##,###,###,###,##0" & _
                             IIf(coinPrecision <> 0, "." + String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
            sadadTransGrid.Col = 7
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            sadadTransGrid.text = rs("transrefno")
            sadadTransGrid.Col = 8
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            sadadTransGrid.text = formatDate(rs("valueDate"))
            sadadTransGrid.Col = 9
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            tCode = rs("paymentType")
            mQry = "select arabicname, englishname from sadadPaymentTypeInfo where  " & _
                   "sadadPaymentType = '" & tCode & "'"
            Set tmpRs = db.OpenRecordset(mQry)
            If tmpRs.recordCount > 0 Then
               If UserLang = ARABIC Then
                  tmpStr = tCode & "-" & tmpRs(0)
               Else
                  tmpStr = tCode & "-" & tmpRs(1)
               End If
            Else
               tmpStr = tCode & "-" & "Not defined in local"
            End If
            sadadTransGrid.text = tmpStr
            sadadTransGrid.Col = 10
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            tCode = rs("postingstatus")
            If tCode = "N" Then
               tmpStr = errBillPaid(UserLang)  '"Bill Paid"
            ElseIf tCode = "R" Then
               tmpStr = errBillReversed(UserLang) '"Bill Reversed"
            ElseIf tCode = "T" Then
               tmpStr = errBillTerminated(UserLang) '"Bill Terminated"
            Else
               tmpStr = errUnknown(UserLang) '"Undefined"
            End If
            
            sadadTransGrid.text = tCode & "-" & tmpStr
            sadadTransGrid.Col = 11
            sadadTransGrid.CellAlignment = flexAlignLeftCenter
            sadadTransGrid.text = rs("supervisorId")
            
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

Private Sub SadadTransGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtTransYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Sub parseSadadTransEnq()
    Dim pos As Integer, i As Integer
    pos = 1
    recvSadadTransEnqMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSadadTransEnqMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSadadTransEnqMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSadadTransEnqMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSadadTransEnqMsg.totalTrans = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvSadadTransEnqMsg.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvSadadTransEnqMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSadadTransEnqMsg.companyId = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvSadadTransEnqMsg.transDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvSadadTransEnqMsg.enqTellerId = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSadadTransEnqMsg.subscriptionNo = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvSadadTransEnqMsg.completionFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    pos = pos + 50 ' for the fillers
    For i = 1 To Val(recvSadadTransEnqMsg.noOfRecs)
        recvSadadTransEnqMsg.details(i).transDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvSadadTransEnqMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvSadadTransEnqMsg.details(i).tellerId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        recvSadadTransEnqMsg.details(i).companyId = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvSadadTransEnqMsg.details(i).subsNo = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvSadadTransEnqMsg.details(i).drAccNo = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvSadadTransEnqMsg.details(i).billAmt = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvSadadTransEnqMsg.details(i).transRefNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvSadadTransEnqMsg.details(i).valueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvSadadTransEnqMsg.details(i).paymentType = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvSadadTransEnqMsg.details(i).preOrPostpaid = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvSadadTransEnqMsg.details(i).transType = Mid$(RecvStr, pos, 2)
        pos = pos + 2
        recvSadadTransEnqMsg.details(i).postingStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvSadadTransEnqMsg.details(i).cashOrAcc = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvSadadTransEnqMsg.details(i).supervisorId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        pos = pos + 50
    Next i
End Sub

Public Sub sadadTransHeaderPrint(normalOrReversal As String)
   Dim tDate As String

   tDate = Format(txtTransYear, "0000") & _
           Format(cmbTransMonth, "00") & _
           Format(cmbTransDate, "00")
   
   page = page + 1
  
   'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
   'Printer.PaintPicture frmLogin.anbLogo, 0, 0
   Printer.PaintPicture frmLogin.anbLogo1, 50, 200
   
   For i = 1 To 3
       Printer.Print vbCrLf
   Next
   outFile.WriteLine ("arab national bank               SADAD Transaction Details                                                                                             Date  : " & Format(Date$, "dd/mm/yyyy"))
   outFile.WriteLine (IIf(Len(Trim(cmbCompanyId)) > 0, "Company Id   " & Format(cmbCompanyId, "!@@@@@@@@@@@@@@@@@@@@"), Space(20)) & langChar & "                                     «·Êﬁ   : " & Format(Time, "hh:mm:ss"))
   outFile.WriteLine (IIf(Len(Trim(tDate)) > 0, " «—ÌŒ «·Õ—ﬂÂ :" & formatDate(tDate), Space(28)) & langChar & "                                                           ’›ÕÂ  : " & page)
   outFile.WriteLine (IIf(Len(Trim(txtTellerId)) > 0, "Teller Id:" & Trim(txtTellerId), Space(13)) & langChar & "                                                           ")
   outFile.WriteLine (String(160, "-"))
   Printer.Print ("                                 ›«’Ì· Õ—ﬂ… ”œ«œ( " & IIf(normalOrReversal = "N", "⁄«œÌ        ", "„⁄ﬂÊ”… «·ﬁÌœ") & langChar & ")          «· «—ÌŒ  : " & Format(Date$, "dd/mm/yyyy"))
   Printer.Print (IIf(Len(Trim(cmbCompanyId)) > 0, "—ﬁ„ «·‘—ﬂ…   :" & Format(cmbCompanyId, "!@@@@@@@@@@@@@@@@@@@@"), Space(34)) & langChar & _
                  IIf(Len(Trim(txtSubscriptionNo)) > 0, Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@"), Space(15)) & langChar & "                          «·Êﬁ   : " & Format(Time, "hh:mm:ss") & langChar)
   Printer.Print (IIf(Len(Trim(tDate)) > 0, " «—ÌŒ «·Õ—ﬂÂ :" & formatDate(tDate), Space(23)) & langChar & "                                                     ’›ÕÂ  : " & page & langChar)
   Printer.Print (IIf(Len(Trim(txtTellerId)) > 0, "ÂÊÌ… «· ·—:" & Trim(txtTellerId), Space(13)) & langChar & "                                                           ")
   Printer.Print (String(160, "-"))
   outFile.WriteLine ("Trans.Date    " & "   Branch code  " & "   Teller Id   " & "  Company Id " & " Subscription number ")
   outFile.WriteLine ("Debit A/c number " & "     Bill Amount  " & " Trans.Ref.No.  " & "Value Date   " & "Payment Type   " & " Posting Status  ")
   'Printer.Print (" «—ÌŒ «·Õ—ﬂÂ  " & "ÂÊÌ… «· ·—" & "—ﬁ„ «·Õ—ﬂÂ  " & "   —ﬁ„ «·‘—ﬂ… " & "  —ﬁ„ «·«‘ —«ﬂ " & " —ﬁ„ «·Õ”«» «·„œÌ‰ " & "  „»·€ «·›« Ê—Â  " & "Õ«·… ")
   Printer.Print (" «—ÌŒ «·Õ—ﬂÂ  " & "—ﬁ„ «·Õ—ﬂÂ  " & "   —ﬁ„ «·‘—ﬂ… " & "  —ﬁ„ «·«‘ —«ﬂ " & " —ﬁ„ «·Õ”«» «·„œÌ‰ " & "  „»·€ «·›« Ê—Â  " & "    Õ«·… ")
   outFile.WriteLine (String(160, "-"))
   Printer.Print (String(160, "-"))
   lines = 7
End Sub

Public Sub printGridHeading()
    Dim tWidth As Integer, colwidth(15) As Integer
    Dim rowTitle(11) As String
    Dim tmpStr As String, tCode As String
    Dim i As Integer
    
    colwidth(0) = 1300
    colwidth(1) = 1000
    colwidth(2) = 1000
    colwidth(3) = 1600
    colwidth(4) = 1600
    colwidth(5) = 1600
    colwidth(6) = 1700
    colwidth(7) = 1300
    colwidth(8) = 1300
    colwidth(9) = 1200
    colwidth(10) = 1200
    colwidth(11) = 1200
    
    rowTitle(0) = "Trans.Date"
    rowTitle(1) = "Branch Code"
    rowTitle(2) = "Teller Id"
    rowTitle(3) = "Company Id"
    rowTitle(4) = "Subs.Number"
    rowTitle(5) = "Debit A/c #"
    rowTitle(6) = "Bill Amount"
    rowTitle(7) = "Trans.Ref.No."
    rowTitle(8) = "Value Date"
    rowTitle(9) = "Payment Type"
    rowTitle(10) = "Posting Status"
    rowTitle(11) = "Supervisor Id"
        
    sadadTransGrid.Clear
    sadadTransGrid.Row = 0
    sadadTransGrid.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 11
      sadadTransGrid.Col = i
      If UserLang = ARABIC Then
         sadadTransGrid.CellAlignment = flexAlignRightCenter
      Else
         sadadTransGrid.CellAlignment = flexAlignLeftCenter
      End If
      sadadTransGrid.text = frmSadadTransEnqCaption(i + 12, UserLang)
      'sadadTransGrid.text = rowTitle(i)
      sadadTransGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
'    sadadTransGrid.Width = tWidth

End Sub



