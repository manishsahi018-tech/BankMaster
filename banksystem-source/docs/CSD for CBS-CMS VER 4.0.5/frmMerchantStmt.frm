VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMerchantStmt 
   BackColor       =   &H00BFD87E&
   Caption         =   "Merchant Statement form"
   ClientHeight    =   8295
   ClientLeft      =   750
   ClientTop       =   840
   ClientWidth     =   10935
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8295
   ScaleWidth      =   10935
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdGenerate 
      Caption         =   "Generate Statement"
      Default         =   -1  'True
      Height          =   495
      Left            =   3240
      TabIndex        =   8
      ToolTipText     =   "Generate Statement"
      Top             =   5160
      Width           =   2055
   End
   Begin VB.CommandButton cmdView 
      Caption         =   "View Statement"
      Height          =   495
      Left            =   3240
      TabIndex        =   9
      ToolTipText     =   "View Statement"
      Top             =   5640
      Width           =   2055
   End
   Begin VB.Frame frameReportType 
      Height          =   495
      Left            =   5520
      TabIndex        =   17
      Top             =   4200
      Width           =   5535
      Begin VB.OptionButton optOutlet 
         Caption         =   "Outlet"
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
         Left            =   4320
         TabIndex        =   18
         Tag             =   "5535"
         ToolTipText     =   "Outlet"
         Top             =   120
         Width           =   1095
      End
      Begin VB.OptionButton optChain 
         Caption         =   "Chain"
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
         Left            =   3120
         TabIndex        =   7
         Tag             =   "5535"
         ToolTipText     =   "Chain"
         Top             =   120
         Width           =   1095
      End
      Begin VB.OptionButton optGroup 
         Caption         =   "Groupwise"
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
         Left            =   1680
         TabIndex        =   6
         Tag             =   "5535"
         ToolTipText     =   "Groupwise"
         Top             =   120
         Width           =   1335
      End
      Begin VB.OptionButton optItem 
         Caption         =   "Itemwise"
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
         Left            =   120
         TabIndex        =   5
         Tag             =   "5535"
         ToolTipText     =   "Itemwise"
         Top             =   120
         Value           =   -1  'True
         Width           =   1575
      End
   End
   Begin VB.Timer merchantTimer 
      Left            =   480
      Top             =   0
   End
   Begin VB.TextBox txtMerchantNo 
      Height          =   375
      Left            =   5520
      MaxLength       =   16
      TabIndex        =   0
      Top             =   2640
      Width           =   1935
   End
   Begin VB.ComboBox cmbFromMonth 
      Height          =   315
      Left            =   5520
      TabIndex        =   1
      Top             =   3240
      Width           =   615
   End
   Begin VB.TextBox txtFromYear 
      Height          =   285
      Left            =   6120
      MaxLength       =   4
      TabIndex        =   2
      Top             =   3240
      Width           =   735
   End
   Begin VB.ComboBox cmbToMonth 
      Height          =   315
      Left            =   5520
      TabIndex        =   3
      Top             =   3720
      Width           =   615
   End
   Begin VB.TextBox txtToYear 
      Height          =   285
      Left            =   6120
      MaxLength       =   4
      TabIndex        =   4
      Top             =   3720
      Width           =   735
   End
   Begin VB.CommandButton cmdPrintStmt 
      Caption         =   "Print Statement"
      Height          =   495
      Left            =   5280
      TabIndex        =   10
      ToolTipText     =   "Print Statement"
      Top             =   5640
      Width           =   2055
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   5280
      TabIndex        =   11
      ToolTipText     =   "Exit"
      Top             =   5160
      Width           =   2055
   End
   Begin MSWinsockLib.Winsock MerchantTcp 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   "ndev"
      RemotePort      =   8200
   End
   Begin VB.Label lblStmtType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Statement Type"
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
      Left            =   3120
      TabIndex        =   16
      Top             =   4320
      Width           =   2295
   End
   Begin VB.Label lblMerchantNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Merchant Number"
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
      Left            =   3120
      TabIndex        =   15
      Top             =   2640
      Width           =   2415
   End
   Begin VB.Label lblFromDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "From Date"
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
      Left            =   3120
      TabIndex        =   14
      Top             =   3240
      Width           =   1455
   End
   Begin VB.Label lblToDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "To Date"
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
      Left            =   3120
      TabIndex        =   13
      Top             =   3720
      Width           =   1215
   End
   Begin VB.Label lblMerchantStmt 
      BackColor       =   &H00BFD87E&
      Caption         =   "Merchant Statement Printing"
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
      Left            =   3840
      TabIndex        =   12
      Top             =   1320
      Width           =   5175
   End
   Begin VB.Image anbLogo 
      Height          =   720
      Left            =   3600
      Picture         =   "frmMerchantStmt.frx":0000
      Top             =   240
      Width           =   5865
   End
End
Attribute VB_Name = "frmMerchantStmt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public reportFile As String
Public outputFile As Object
Public fsys As Object
Public reportFoundFlag As Boolean

Private Sub cmbFromMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbToMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmdGenerate_Click()
   Dim tDate As String
   Dim tmpToDate As String
   
   reportFoundFlag = False
   If Len(RTrim(txtMerchantNo)) = 0 Then
      MsgBox errSpaceAccNo(UserLang)      '"Account Number cannot be empty..Please enter"
      txtMerchantNo.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(cmbFromMonth)) = 0 Or _
      Len(RTrim(txtFromYear)) = 0 Then
      MsgBox errInvalidDate(UserLang)   '"From Date is blank or Incomplete From Date"
      cmbFromMonth.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(cmbToMonth)) = 0 Or _
      Len(RTrim(txtToYear)) = 0 Then
      MsgBox errInvalidDate(UserLang)    '"To_Date is blank or Incomplete To Date"
      cmbToMonth.SetFocus
      Exit Sub
   End If
   
   If optItem.Value = True Then
      If IsNumeric(Mid$(Trim(txtMerchantNo), 1, 1)) = True Then
         If Len(Trim(txtMerchantNo)) <> 12 And Len(Trim(txtMerchantNo)) <> 16 Then
            MsgBox errInvalidMerchantNo(UserLang)  '"Invalid Merchant no.. Please check and correct...."
            txtMerchantNo.SetFocus
            Exit Sub
         End If
      Else
         If UCase(Mid$(Trim(txtMerchantNo), 1, 2)) = "S1" Then
            If Len(Trim(txtMerchantNo)) <> 8 Then
               MsgBox errInvalidMerchantNo(UserLang) '"Invalid merchant no... please check and correct.."
               txtMerchantNo.SetFocus
               Exit Sub
            End If
        End If
     End If
  ElseIf optChain.Value = True Or optOutlet.Value = True Then
     If Len(Trim(txtMerchantNo)) <> 16 Then
        MsgBox errInvalidMerchantNo(UserLang)  '"Invalid merchant no for this type.. please check and correct"
        txtMerchantNo.SetFocus
        Exit Sub
     End If
  End If

  tDate = CStr(txtFromYear) + _
          CStr(cmbFromMonth.Text) + _
          "01"

   If validDate(tDate) = False Then
      MsgBox errInvalidDate(UserLang)
      cmbFromMonth.SetFocus
      Exit Sub
   End If

   tDate = CStr(txtToYear) + _
           CStr(cmbToMonth.Text) + _
           "01"

   If validDate(tDate) = False Then
      MsgBox errInvalidDate(UserLang)
      cmbToMonth.SetFocus
      Exit Sub
   End If

   tDate = CStr(txtToYear) + _
           CStr(cmbToMonth.Text)
        
   tDate = tDate + lastDay(tDate)

   formatMerchRequest ("00000")
   SendMsg = reqMerchMsg.msgLen + reqMerchMsg.service + reqMerchMsg.homeBranch + _
             reqMerchMsg.userId + reqMerchMsg.lastTransPtr + reqMerchMsg.stmtType + _
             reqMerchMsg.merchantNo + reqMerchMsg.fromDate + reqMerchMsg.toDate

   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
   frmMerchantStmt.MousePointer = vbHourglass
   cmdGenerate.Enabled = False
   cmdExit.Enabled = False
   If HandleMerchMsgTraffic(MerchantTcp, merchantTimer) = LocalCommsError Then
      CSD_mdiForm.staticStatus.Panels(3).Text = "Error occured while talking to Merchant Server"
      frmMerchantStmt.MousePointer = vbDefault
      cmdGenerate.Enabled = True
      cmdExit.Enabled = True
      LoadError = True
      Exit Sub
   End If

   frmMerchantStmt.MousePointer = vbDefault
   cmdExit.Enabled = True
   cmdGenerate.Enabled = True
   If recvMerchStmtMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvMerchStmtMsg.aRemarks
      Else
         MsgBox recvMerchStmtMsg.eRemarks
      End If
      Exit Sub
   End If

   Set fso = CreateObject("Scripting.FileSystemObject")
   If (Not fso.FolderExists("c:\merchStmt")) Then
      fso.CreateFolder ("c:\merchStmt")
   End If

   reportFile = "c:\merchStmt\mrchstmt.prt"
   Set outputFile = fso.CreateTextFile(reportFile, True)

   generateMerchStmt

   outputFile.Close

   If reportFoundFlag = True Then
      MsgBox errStmtSuccess(UserLang)
      cmdPrintStmt.Enabled = True
      cmdView.Enabled = True
      cmdGenerate.Enabled = False
   Else
      MsgBox errNoMerchantStmt(UserLang)  '  "No report found for this merchant for the given period"
   End If
End Sub

Private Sub cmdPrintStmt_Click()
   Dim lines As Integer
   Set fsys = CreateObject("Scripting.FileSystemObject")
   Set outputFile = fsys.OpenTextFile(reportFile, 1, False, False)

   lines = 0
   Printer.FontName = "Courier New (Arabic)"
   Printer.FontSize = 10
   Printer.Orientation = vbPRORLandscape
   While outputFile.AtEndOfStream = False
         tLine = outputFile.ReadLine
         If Asc(Mid$(tLine, 1, 1)) = 12 Then
            Printer.NewPage
            lines = 0
         End If
         Printer.Print tLine
         lines = lines + 1
   Wend
   Printer.EndDoc
   outputFile.Close

End Sub

Public Sub generateMerchStmt()
   Dim linesReqd As Integer
   Dim tmpStr As String
   Dim noOfTrans As Integer
      
   Do While True
      On Error Resume Next
      noOfTrans = CInt(recvMerchStmtMsg.noOfRecs)
      For j = 1 To noOfTrans
          outputFile.WriteLine (recvMerchStmtMsg.transDetails(j))
      Next
      If noOfTrans > 0 Then
         reportFoundFlag = True
      End If
      If recvMerchStmtMsg.completionFlag <> "1" Then
          formatMerchRequest (recvMerchStmtMsg.lastRecCount)
          SendMsg = reqMerchMsg.msgLen + reqMerchMsg.service + reqMerchMsg.homeBranch + _
                    reqMerchMsg.userId + reqMerchMsg.lastTransPtr + reqMerchMsg.stmtType + _
                    reqMerchMsg.merchantNo + reqMerchMsg.fromDate + reqMerchMsg.toDate

          strmsglen = Format(Len(SendMsg), "000000")
          Mid$(SendMsg, 1, 6) = strmsglen
          DataReceivedFlag = False
          TimeOutFlag = False
          MsgWouldBlock = False
          frmMerchantStmt.MousePointer = vbHourglass
          cmdGenerate.Enabled = False
          cmdExit.Enabled = False
          If HandleMerchMsgTraffic(MerchantTcp, merchantTimer) = LocalCommsError Then
             CSD_mdiForm.staticStatus.Panels(3).Text = "Error occured while talking to Merchant Server"
             frmMerchantStmt.MousePointer = vbDefault
             cmdGenerate.Enabled = True
             cmdExit.Enabled = True
             LoadError = True
             Exit Sub
          End If
   
          frmMerchantStmt.MousePointer = vbDefault
          cmdGenerate.Enabled = True
          cmdExit.Enabled = True
          If recvMerchStmtMsg.status <> "000" Then
             Exit Do
          End If
       Else
          Exit Do
       End If
  Loop

End Sub


Private Sub cmbFromDate_Change()
   disableButton
    If Len(RTrim(cmbFromDate.Text)) <> 0 Then
       If Len(cmbFromDate.Text) = 2 Then
          If cmbFromDate < 1 Or cmbFromDate > 31 Then
             MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
             cmbFromDate.Text = ""
             cmbFromDate.SetFocus
          Else
             On Error Resume Next
             cmbFromMonth.SetFocus
          End If
       End If
    End If
End Sub

Private Sub cmbFromMonth_Change()
   disableButton
   If Len(RTrim(cmbFromMonth.Text)) <> 0 Then
      If Len(cmbFromMonth.Text) = 2 Then
         If cmbFromMonth < 1 Or cmbFromMonth > 12 Then
            MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            cmbFromMonth.Text = ""
            cmbFromMonth.SetFocus
          Else
            On Error Resume Next
            txtFromYear.SetFocus
          End If
      End If
  End If
End Sub

Private Sub cmbToDate_Change()
  disableButton
  If Len(RTrim(cmbToDate.Text)) <> 0 Then
     If Len(cmbToDate.Text) = 2 Then
        If cmbToDate < 1 Or cmbToDate > 31 Then
           MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
           cmbToDate.Text = ""
           cmbToDate.SetFocus
        Else
           On Error Resume Next
           cmbToMonth.SetFocus
        End If
     End If
  End If
End Sub

Private Sub cmbToMonth_Change()
   disableButton
   If Len(RTrim(cmbToMonth.Text)) <> 0 Then
      If Len(cmbToMonth.Text) = 2 Then
         If cmbToMonth < 1 Or cmbToMonth > 12 Then
            MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            cmbToMonth.Text = ""
            cmbToMonth.SetFocus
          Else
            On Error Resume Next
            txtToYear.SetFocus
          End If
      End If
  End If
End Sub

Private Sub cmdExit_Click()
   If MerchantTcp.State = sckConnected Then
      MerchantTcp.Close
   End If
   Unload Me
End Sub

Private Sub cmdView_Click()
      
   Shell utilPath & "wordpad  " & reportFile, vbMaximizedFocus
   delay (10)

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub Form_Load()
    
   If readParam = 1 Then
      Unload Me
      Exit Sub
   End If
    
   If ConnectServer(MerchantTcp, merchantTimer, merchantHost, merchantPort) = LocalCommsError Then
      merchantTimer.Interval = 0 'deactivate the timer
      Exit Sub
   End If
   merchantTimer.Interval = 0
   
   If UserLang = ARABIC Then
      ChangePositions frmMerchantStmt, 11800
      frmMerchantStmt.RightToLeft = True
   End If
   
   frmMerchantStmt.Caption = frmMerchantStmtCaption(0, UserLang)
   frmMerchantStmt.lblMerchantStmt.Caption = frmMerchantStmtCaption(1, UserLang)
   frmMerchantStmt.lblMerchantNo.Caption = frmMerchantStmtCaption(2, UserLang)
   frmMerchantStmt.lblFromDate.Caption = frmMerchantStmtCaption(3, UserLang)
   frmMerchantStmt.lblToDate.Caption = frmMerchantStmtCaption(4, UserLang)
   frmMerchantStmt.lblStmtType.Caption = frmMerchantStmtCaption(5, UserLang)
   frmMerchantStmt.optItem.Caption = frmMerchantStmtCaption(6, UserLang)
   frmMerchantStmt.optGroup.Caption = frmMerchantStmtCaption(7, UserLang)
   frmMerchantStmt.optChain.Caption = frmMerchantStmtCaption(8, UserLang)
   frmMerchantStmt.optOutlet.Caption = frmMerchantStmtCaption(9, UserLang)
   frmMerchantStmt.cmdGenerate.Caption = frmMerchantStmtCaption(10, UserLang)
   frmMerchantStmt.cmdView.Caption = frmMerchantStmtCaption(11, UserLang)
   frmMerchantStmt.cmdPrintStmt.Caption = frmMerchantStmtCaption(12, UserLang)
   frmMerchantStmt.cmdExit.Caption = frmMerchantStmtCaption(13, UserLang)

   cmbFromMonth.Clear
   cmbToMonth.Clear
   For i = 1 To 12
       If i < 10 Then
          num = "0" + CStr(i)
       Else
          num = CStr(i)
       End If
       cmbFromMonth.AddItem num
       cmbToMonth.AddItem num
   Next
   txtToYear = CStr(Year(Date))
   cmbToMonth = Format(CStr(Month(Date)), "00")
     
   frmMerchantStmt.Show
   frmMerchantStmt.cmdPrintStmt.Enabled = False
   frmMerchantStmt.cmdView.Enabled = False
   
   
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub frameReportType_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub MerchantTcp_Connect()
    HostConnected = True
End Sub

Private Sub MerchantTcp_DataArrival(ByVal bytesTotal As Long)
Dim blockedMsg As String
  Dim s As String
  On Error GoTo err_handler
  
  If MsgWouldBlock = False Then
     s = "1"
     MerchantTcp.GetData recvMsg.msgLen, vbString, 6
     RecvStr = ""
     s = "2"
     MerchantTcp.GetData RecvStr, vbString, bytesTotal - 6
     s = "3"
     If bytesTotal < CLng(recvMsg.msgLen) Then
      '  Debug.Print "Received= " + CStr(bytesTotal) + " Actual= " + recvMsg.msgLen
        MsgWouldBlock = True
        DoEvents
     End If
  Else
     s = "4"
     MerchantTcp.GetData blockedMsg, vbString, bytesTotal
     s = "5"
     RecvStr = RecvStr & blockedMsg
     'Debug.Print "Received; Finally = " + CStr(Len(RecvStr))
     s = "6"
     If Len(RecvStr) < (CLng(recvMsg.msgLen) - 6) Then
        DoEvents
     Else
        MsgWouldBlock = False
     End If
  End If
  If MsgWouldBlock = False Then
     DataReceivedFlag = True
  End If
  Exit Sub
err_handler:
  LogData "Unexpected error  " + str(Err.Number) + "   " + Err.Description + "  occured in line " + s + "  [tcpClient_dataArrival]"
  Resume Next

End Sub

Private Sub MerchantTcp_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
  Dim response As Integer
  
  If Number = sckConnectionRefused Or _
     Number = sckHostNotFound Or _
     Number = sckHostNotFoundTryAgain Then
   MsgBox (errConnectProblem(UserLang) + CStr(Number) + ": " + errConnectionRejected(UserLang) _
           + Chr(13) + errHostName(UserLang) + merchantHost + "; " + errPortNo(UserLang) + CStr(merchantPort) _
           + Chr(13) + errCallHeadOffice2(UserLang))
    Unload frmMerchantStmt
    frmEnquiry.MousePointer = vbNormal
    frmEnquiry.Enabled = True
    CSD_mdiForm.staticStatus.Panels(3).Text = "                         "
'   Unload frmEnquiry
'   frmLogin.Show
'   frmLogin.MousePointer = vbDefault
'   frmLogin.cmdOk.Enabled = True
'   frmLogin.cmdExit.Enabled = True
'   CSD_mdiForm.staticStatus.Panels(3).Text = errLogon(UserLang)  '"Login with UserId and Password"
ElseIf Number = sckBadState Or _
        Number = sckNotConnected Or _
        Number = sckSocketShutdown Or _
        Number = sckTimedout Then
'    frmLogin.MousePointer = vbDefault
'    frmLogin.cmdOk.Enabled = True
'    frmLogin.cmdExit.Enabled = True
    response = MsgBox(errConnectProblem(UserLang) + " (" + CStr(Number) + ") " + Description _
        + Chr(13) + " while connecting to Merchant statement server " + _
        Chr(13) + errHostName(UserLang) + merchantHost + "; " + errPortNo(UserLang) + CStr(merchantPort) + Chr(13) + _
        Chr(13) + errShouldIReconnect(UserLang), vbOKCancel)
    If response = vbOK Then
        tcpclient.Close
        tcpclient.Connect
    ElseIf response = vbCancel Then
        Unload frmMerchantStmt
        frmEnquiry.MousePointer = vbNormal
        frmEnquiry.Enabled = True
        CSD_mdiForm.staticStatus.Panels(3).Text = "                         "
    End If
ElseIf Number = sckWouldBlock Then
    MsgWouldBlock = True
Else
  MsgBox (errConnectProblem(UserLang) + CStr(Number) + ": " + Description _
          + Chr(13) + Chr(13) + errUnexpectedError(UserLang))
  Unload frmMerchantStmt
  frmEnquiry.MousePointer = vbNormal
  frmEnquiry.Enabled = True
  CSD_mdiForm.staticStatus.Panels(3).Text = "                         "
End If
End Sub

Private Sub merchantTimer_Timer()
    TimeOutFlag = True
End Sub
Public Function HandleMerchMsgTraffic(merchSocket As Winsock, merchTimer As timer) As String
    
    Dim reLoginMsg, strmsglen As String
    ' send message
    MsgWouldBlock = False
    TimeOutFlag = False
    DataReceivedFlag = False
    merchTimer.Interval = ReceiveTimeOut
    merchTimer.Enabled = True
    
    Err.Number = 0
    On Error Resume Next
    SendMsg = windowToAsmo(SendMsg)
    merchSocket.SendData SendMsg
    If Err.Number <> 0 Then
       LogData errMsgSendError(1) + "  " + str(Err.Number) + " (" + Err.Description + ") , hostname =" + merchantHost + "port#" + CStr(merchantPort)
       MsgBox (errMsgSendError(UserLang) _
          + Chr(13) + errHostName(UserLang) + merchantHost + "; " + errPortNo(UserLang) + CStr(merchantPort) _
          + Chr(13) + str(Err.Number) + " : " + Err.Description _
          + Chr(13) + errEnterToContinue(UserLang))
        merchSocket.Close
        If ConnectServer(merchSocket, merchTimer, merchantHost, merchantPort) = Success Then
           MsgBox (errTryAgain(UserLang))
        End If
        Err.Number = 0
        On Error GoTo 0
        HandleMerchMsgTraffic = LocalCommsError
        merchTimer.Enabled = False
        Exit Function
    End If
    If TimeOutFlag = True Then
       LogData errTimeOut(1) + errMsgSendError(1) + "  Host name:" + merchantHost + "  Port#" + CStr(merchantPort)
       MsgBox (errTimeOut(UserLang) + errMsgSendError(UserLang) + _
          Chr(13) + errHostName(UserLang) + merchantHost + ";" + errPortNo(UserLang) + CStr(merchantPort) _
          + Chr(13) + errEnterToContinue(UserLang))
        merchSocket.Close
        If ConnectServer(merchSocket, merchTimer, merchantHost, merchantPort) = Success Then
            MsgBox (errTryAgain(UserLang))
        End If
        On Error GoTo 0
        HandleMerchMsgTraffic = LocalCommsError
        Exit Function
    End If
    
    ' start receving
    merchTimer.Enabled = False
    TimeOutFlag = False
    DataReceivedFlag = False
    merchTimer.Interval = ReceiveTimeOut
    merchTimer.Enabled = True
    Do While (DataReceivedFlag = False And TimeOutFlag = False)
         DoEvents
    Loop
    If DataReceivedFlag = False And TimeOutFlag = True Then
       LogData errTimeOut(1) + errMsgReceiveError(1) + "  hostname:" + merchantHost + "  Port#" + CStr(merchantPort)
       LogData "err.number :" + CStr(Err.Number) + " (" + Err.Description + ")"
       MsgBox (errTimeOut(UserLang) + errMsgReceiveError(UserLang) _
          + Chr(13) + errHostName(UserLang) + merchantHost + "; " + errPortNo(UserLang) + CStr(merchantPort) _
          + Chr(13) + CStr(Err.Number) + " : " + Err.Description _
          + Chr(13) + errEnterToContinue(UserLang))
        merchSocket.Close
        If ConnectServer(merchSocket, merchTimer, merchantHost, merchantPort) = Success Then
            MsgBox (errTryAgain(UserLang))
        End If
        merchTimer.Enabled = False
        On Error GoTo 0
        HandleMerchMsgTraffic = LocalCommsError
        Exit Function
    End If
    merchTimer.Enabled = False
    
    RecvStr = asmoToWindow(RecvStr)
    'Received the message; parse it to the required variables
    If Mid$(SendMsg, 7, 2) = "00" Then
       If parseMerchStmtMessage = Success Then
          HandleMerchMsgTraffic = Success
       ElseIf recvMerchStmtMsg.status = CommsError Or recvMerchStmtMsg.status = timeOut Then
          LogData errErrorAtServer(1) + recvMerchStmtMsg.status
          MsgBox (errErrorAtServer(UserLang))
          merchSocket.Close
          If ConnectServer(merchSocket, merchTimer, merchantHost, merchantPort) = LocalCommsError Then
             recvMerchStmtMsg.eRemarks = errConnectProblem(UserLang)
             HandleMerchMsgTraffic = LocalCommsError
             Exit Function
          End If
          HandleMerchMsgTraffic = recvMerchStmtMsg.status
       End If
    End If
    HandleMerchMsgTraffic = recvMerchStmtMsg.status
End Function

Private Sub formatMerchRequest(lastTransPointer As String)
    Dim tDate As String
    Dim tmpStr As String
    
    reqMerchMsg.msgLen = "00386"
    reqMerchMsg.homeBranch = gBranchCode
    reqMerchMsg.service = "00"
    reqMerchMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    reqMerchMsg.lastTransPtr = lastTransPointer
    If optItem.Value = True Then
       reqMerchMsg.stmtType = "0"
    ElseIf optGroup.Value = True Then
       reqMerchMsg.stmtType = "1"
    ElseIf optChain.Value = True Then
       reqMerchMsg.stmtType = "2"
    Else
       reqMerchMsg.stmtType = "3"
    End If
    reqMerchMsg.merchantNo = Format(frmMerchantStmt.txtMerchantNo, "!@@@@@@@@@@@@@@@@")
    tmpStr = txtFromYear + cmbFromMonth
    tDate = incMonth(tmpStr) & "01"
    reqMerchMsg.fromDate = tDate
    tmpStr = CStr(txtToYear) + _
           CStr(cmbToMonth.Text)
    tDate = incMonth(tmpStr)
    tDate = tDate + lastDay(tDate)
    reqMerchMsg.toDate = tDate
    
End Sub

Public Function parseMerchStmtMessage()
     Dim i, pos As Integer
     
     recvMerchStmtMsg.status = Mid$(RecvStr, 1, 3)
     recvMerchStmtMsg.service = Mid$(RecvStr, 4, 2)
     recvMerchStmtMsg.aRemarks = Mid$(RecvStr, 6, 50)
     recvMerchStmtMsg.eRemarks = Mid$(RecvStr, 56, 50)
     recvMerchStmtMsg.lastRecCount = Mid$(RecvStr, 106, 5)
     recvMerchStmtMsg.noOfRecs = Mid$(RecvStr, 111, 2)
     recvMerchStmtMsg.merchNo = Mid$(RecvStr, 113, 16)
     recvMerchStmtMsg.completionFlag = Mid$(RecvStr, 129, 1)
     recvMerchStmtMsg.filler = Mid$(RecvStr, 130, 10)
     pos = 140
     For i = 1 To Val(recvMerchStmtMsg.noOfRecs)
         recvMerchStmtMsg.transDetails(i) = Mid$(RecvStr, pos, 150)
         pos = pos + 150
    Next i
    parseMerchStmtMsg = Success

End Function

Public Function readParam() As Integer

    Dim tmpStr As String
    Dim iniPath As String
    Dim objFs, objReadFile
     
     iniPath = App.Path + "\mrchdata.ini"
     On Error GoTo err_handler
     Set objFs = CreateObject("Scripting.FileSystemObject")
     Set objReadFile = objFs.OpenTextFile(iniPath, 1)
     
     merchantHost = IniRead(iniPath, "host")
     If Len(RTrim(merchantHost)) = 0 Then
        MsgBox "Merchant Host name is not defined in the configuration file.."
        Unload Me
        readParam = 1
        Exit Function
     End If
     
     ' get port number from ini file
    merchantPort = IniRead(iniPath, "Port")
    If merchantPort = 0 Then
        MsgBox ("Could not get Merchant port name from ini file")
        readParam = 1
        Exit Function
    End If
    readParam = 0
    Exit Function
err_handler:

If Err.Number = 53 Or Err.Number = 76 Then
   MsgBox "Merchant Configuaration file (mrchdata.ini) does not exist in " & App.Path
   readParam = 1
   Exit Function
Else
   Resume Next
End If

End Function

Private Sub txtFromYear_Change()
    disableButton
End Sub

Private Sub txtFromYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtMerchantNo_Change()
    disableButton
End Sub

Public Sub disableButton()
    cmdGenerate.Enabled = True
    cmdPrintStmt.Enabled = False
    cmdView.Enabled = False
End Sub

Private Sub txtToYear_Change()
    disableButton
End Sub

Private Sub txtToYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Function incMonth(tDate As String) As String
   Dim tmpStr As String
   Dim tYear As Integer
   Dim tMonth As Integer
   
   If Mid$(tDate, 5, 2) = "12" Then
      tYear = CInt(Mid$(tDate, 1, 4)) + 1
      incMonth = CStr(tYear) & "01"
   Else
      tMonth = CInt(Mid$(tDate, 5, 2)) + 1
      incMonth = Mid$(tDate, 1, 4) & Format(CStr(tMonth), "00")
   End If
    
End Function
