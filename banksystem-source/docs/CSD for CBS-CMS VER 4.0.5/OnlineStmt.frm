VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmInputform 
   BackColor       =   &H00BFD87E&
   Caption         =   "Online Statement Input Form"
   ClientHeight    =   3180
   ClientLeft      =   165
   ClientTop       =   465
   ClientWidth     =   4680
   ControlBox      =   0   'False
   FillColor       =   &H80000012&
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3180
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtIBAN 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5685
      TabIndex        =   19
      Top             =   7365
      Visible         =   0   'False
      Width           =   2775
   End
   Begin VB.TextBox txtAccountType 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5640
      TabIndex        =   18
      Top             =   4680
      Width           =   2775
   End
   Begin VB.TextBox txtCurrency 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5640
      TabIndex        =   17
      Top             =   4080
      Width           =   2775
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7200
      TabIndex        =   16
      ToolTipText     =   "Exit"
      Top             =   6480
      Width           =   1815
   End
   Begin VB.CommandButton cmdPrintStmt 
      Caption         =   "Print Statement"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5160
      TabIndex        =   14
      ToolTipText     =   "Print Statement"
      Top             =   6480
      Width           =   2055
   End
   Begin VB.TextBox txtToYear 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   6840
      MaxLength       =   4
      TabIndex        =   13
      Top             =   5760
      Width           =   735
   End
   Begin VB.ComboBox cmbToMonth 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6240
      TabIndex        =   12
      Top             =   5760
      Width           =   615
   End
   Begin VB.ComboBox cmbToDate 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5640
      TabIndex        =   11
      Top             =   5760
      Width           =   615
   End
   Begin VB.TextBox txtFromYear 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   6840
      MaxLength       =   4
      TabIndex        =   10
      Top             =   5280
      Width           =   735
   End
   Begin VB.ComboBox cmbFromMonth 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6240
      TabIndex        =   9
      Top             =   5280
      Width           =   615
   End
   Begin VB.ComboBox cmbFromDate 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5640
      TabIndex        =   7
      Top             =   5280
      Width           =   615
   End
   Begin VB.TextBox txtAccName 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5640
      TabIndex        =   8
      Top             =   3480
      Width           =   2775
   End
   Begin VB.TextBox txtAccNo 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5640
      MaxLength       =   14
      TabIndex        =   6
      Top             =   2760
      Width           =   1935
   End
   Begin VB.Timer onlineTimer 
      Left            =   570
      Top             =   3735
   End
   Begin MSWinsockLib.Winsock OnlineTcp 
      Left            =   90
      Top             =   3735
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   "ndev"
      RemotePort      =   2006
   End
   Begin VB.Label lblIban 
      BackColor       =   &H00BFD87E&
      Caption         =   "IBAN"
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
      Height          =   300
      Left            =   3450
      TabIndex        =   20
      Top             =   7350
      Visible         =   0   'False
      Width           =   840
   End
   Begin VB.Image anbLogo1 
      Height          =   885
      Left            =   5685
      Picture         =   "OnlineStmt.frx":0000
      Top             =   450
      Visible         =   0   'False
      Width           =   1905
   End
   Begin VB.Image anbLogo 
      Height          =   1335
      Left            =   45
      Picture         =   "OnlineStmt.frx":58C2
      Top             =   45
      Width           =   2775
   End
   Begin VB.Label lblOnlineStmt 
      BackColor       =   &H00BFD87E&
      Caption         =   "OnLine Statement Printing"
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
      Left            =   4560
      TabIndex        =   15
      Top             =   1440
      Width           =   4695
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
      Left            =   3240
      TabIndex        =   5
      Top             =   5760
      Width           =   1215
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
      Left            =   3240
      TabIndex        =   4
      Top             =   5265
      Width           =   1455
   End
   Begin VB.Label lblAccountType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Type"
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
      Height          =   300
      Left            =   3240
      TabIndex        =   3
      Top             =   4650
      Width           =   1815
   End
   Begin VB.Label lblCurrency 
      BackColor       =   &H00BFD87E&
      Caption         =   "Currency"
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
      Height          =   360
      Left            =   3255
      TabIndex        =   2
      Top             =   4020
      Width           =   1215
   End
   Begin VB.Label lblAccName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Name"
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
      Left            =   3240
      TabIndex        =   1
      Top             =   3480
      Width           =   2175
   End
   Begin VB.Label lblAccNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Number"
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
      Left            =   3240
      TabIndex        =   0
      Top             =   2760
      Width           =   2415
   End
End
Attribute VB_Name = "frmInputform"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public page As Integer
Public textStream As Object, tStream As Object
Public csvFp As Object
Public fsys As Object
Public accName As String, ccyName As String
Public noOfTrans As Integer
Public fromDate, toDate As String
Public cfBalance As Double
Public drCrFlag As String
Public coinDenomination As Integer
Public coinPrecision As Integer
Public drTrans, crTrans, lines As Integer
Public drAmt, crAmt, amtToPrint As Double
Public tranAmt As Double
Public langChar As String

Private Sub cmbFromDate_Change()
    If Len(RTrim(cmbFromDate.text)) <> 0 Then
       If Len(cmbFromDate.text) = 2 Then
          If cmbFromDate < 1 Or cmbFromDate > 31 Then
             MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
             cmbFromDate.text = ""
             cmbFromDate.SetFocus
          Else
             On Error Resume Next
             cmbFromMonth.SetFocus
          End If
       End If
    End If
End Sub

Private Sub cmbFromDate_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbFromMonth_Change()
   If Len(RTrim(cmbFromMonth.text)) <> 0 Then
      If Len(cmbFromMonth.text) = 2 Then
         If cmbFromMonth < 1 Or cmbFromMonth > 12 Then
            MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            cmbFromMonth.text = ""
            cmbFromMonth.SetFocus
          Else
            On Error Resume Next
            txtFromYear.SetFocus
          End If
      End If
  End If
End Sub

Private Sub cmbFromMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbToDate_Change()
  If Len(RTrim(cmbToDate.text)) <> 0 Then
     If Len(cmbToDate.text) = 2 Then
        If cmbToDate < 1 Or cmbToDate > 31 Then
           MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
           cmbToDate.text = ""
           cmbToDate.SetFocus
        Else
           On Error Resume Next
           cmbToMonth.SetFocus
        End If
     End If
  End If
End Sub

Private Sub cmbToDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbToMonth_Change()
   If Len(RTrim(cmbToMonth.text)) <> 0 Then
      If Len(cmbToMonth.text) = 2 Then
         If cmbToMonth < 1 Or cmbToMonth > 12 Then
            MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            cmbToMonth.text = ""
            cmbToMonth.SetFocus
          Else
            On Error Resume Next
            txtToYear.SetFocus
          End If
      End If
  End If
End Sub

Private Sub cmbToMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmdExit_Click()
   If OnlineTcp.State = sckConnected Then
      OnlineTcp.Close
   End If
   Unload Me
End Sub

Private Sub cmdPrintStmt_Click()
   Dim strmsglen As String * 4
   Dim accNo, ccyNo, tLine As String
   Dim reportFile As String
   Dim csvFile As String
   Dim tCode, mQry As String
   Dim tDate As String
   Dim fso, Fold, SubFold, CreaFold, ts
   
   page = 0
   drAmt = 0
   crAmt = 0
   drTrans = 0
   crTrans = 0
   
   If Len(RTrim(txtAccNo)) = 0 Then
      MsgBox errSpaceAccNo(UserLang)      '"Account Number cannot be empty..Please enter"
      txtAccNo.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(cmbFromDate)) = 0 Or _
      Len(RTrim(cmbFromMonth)) = 0 Or _
      Len(RTrim(txtFromYear)) = 0 Then
      MsgBox errInvalidDate(UserLang)   '"From Date is blank or Incomplete From Date"
      cmbFromDate.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(cmbToDate)) = 0 Or _
      Len(RTrim(cmbToMonth)) = 0 Or _
      Len(RTrim(txtToYear)) = 0 Then
      MsgBox errInvalidDate(UserLang)    '"To_Date is blank or Incomplete To Date"
      cmbToDate.SetFocus
      Exit Sub
   End If
   
   tDate = CStr(txtFromYear) & _
           CStr(cmbFromMonth.text) & _
           CStr(cmbFromDate.text)
   
   If validDate(tDate) = False Then
      MsgBox errInvalidDate(UserLang)
      cmbFromDate.SetFocus
      Exit Sub
   End If
   
   tDate = CStr(txtToYear) & _
           CStr(cmbToMonth.text) & _
           CStr(cmbToDate.text)
   
   If validDate(tDate) = False Then
      MsgBox errInvalidDate(UserLang)
      cmbToDate.SetFocus
      Exit Sub
   End If
      
'   tcode = Mid$(txtAccNo, 3, 3)
'   mQry = "select arabicname,englishname from bmledgerinfo " & _
'          "where ledgercode = '" & tcode & "'"
'
'   Set db = OpenDatabase(dbPath)
'   Set rs = db.OpenRecordset(mQry)
'   If rs.RecordCount > 0 Then
'      If UserLang = ARABIC Then
'         txtAccountType = tcode & "-" & rs(0)
'      Else
'         txtAccountType = tcode & "-" & rs(1)
'      End If
'   End If
'
'   tcode = Mid$(txtAccNo, 1, 2)
'   mQry = "select arabicname,englishname from currencyinfo" & _
'          " where currencycode = '" & tcode & "'"
'   Set rs = db.OpenRecordset(mQry)
'   If rs.RecordCount > 0 Then
'      If UserLang = ARABIC Then
'         txtCurrency = tcode & "-" & rs(0)
'      Else
'         txtCurrency = tcode & "-" & rs(1)
'      End If
'   End If
        
   formatRequest ("00000")
   SendMsg = reqMsg.msgLen & reqMsg.checkSum & reqMsg.branchName & reqMsg.Source & reqMsg.service & _
             reqMsg.mainAccNo & reqMsg.fromDate & reqMsg.toDate & _
             reqMsg.lastTransPointer & reqMsg.userId & reqMsg.filler & reqMsg.EOT
             
   strmsglen = Format(Len(SendMsg), "0000")
   Mid$(SendMsg, 1, 4) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
   frmInputform.MousePointer = vbHourglass
   cmdPrintStmt.Enabled = False
   cmdExit.Enabled = False
   LogData "Ondemand statement for the acct No : " & txtAccNo
   If HandleOnlineTraffic(OnlineTcp, onlineTimer, onlineHostName, OnlinePort) = LocalCommsError Then
      CSD_mdiForm.staticStatus.Panels(3).text = "Error occured while talking to bmrtServer"
      frmInputform.MousePointer = vbDefault
      cmdPrintStmt.Enabled = True
      cmdExit.Enabled = True
      LoadError = True
      Exit Sub
   End If
   
   If resMsg.responseStatus <> "00" And _
      resMsg.responseStatus <> "01" Then
      frmInputform.MousePointer = vbDefault
      cmdPrintStmt.Enabled = True
      cmdExit.Enabled = True
      If resMsg.responseStatus = "03" Then
         MsgBox errIncorrectMsgSent(UserLang)  '"Incorrect Message sent..Check the Account Number and Dates"
      ElseIf resMsg.responseStatus = "05" Then
         MsgBox errIncorrectMainAcc(UserLang)  '"Given Main Account is incorrect...Please Check"
      ElseIf resMsg.responseStatus = "06" Then
         MsgBox errIncorrectContraAcc(UserLang)   '"Given contra Account is incorrect..Please Check"
      ElseIf resMsg.responseStatus = "08" Then
         MsgBox errRestrictedAccount(UserLang)  '"Restricted Account.. Please Check.."
      ElseIf resMsg.responseStatus = "12" Then
         MsgBox errCommsError(UserLang)  '"Communication Error occured..Try Again.."
      Else
         MsgBox errErrorRecdFromOnlineGateway(UserLang)    '"Error  " & resMsg.responseStatus & "occurred during communication"
      End If
      Exit Sub
   End If
   If resMsg.branchCode = "0175" And gBranchCode <> "0175" Then
      MsgBox errNotAuthorizedToViewStaffAcc(UserLang)  '"You are not authorised to view STAFF ACCOUNT'S Statement "
      frmInputform.MousePointer = vbDefault
      cmdPrintStmt.Enabled = True
      cmdExit.Enabled = True
      Exit Sub
   End If
   
   If resMsg.branchCode = "0176" And gBranchCode <> "0176" Then
      MsgBox errStmtRestrictedBranch(UserLang)
      cmdPrintStmt.Enabled = True
      cmdExit.Enabled = True
      Exit Sub
   End If
   
   mQry = "select arabicname,englishname from branchinfo " & _
          "where branchcode = '" & resMsg.branchCode & "'"
          
   Set rs = db.OpenRecordset(mQry)
      
   Set fso = CreateObject("Scripting.FileSystemObject")
   If (Not fso.FolderExists("c:\reports")) Then
      fso.CreateFolder ("c:\reports")
   End If
   
   If fso.FileExists("c:\reports\*.csv") = True Then
      fso.DeleteFile ("c:\reports\*.csv")
   End If

   reportFile = "c:\reports\OS" & Mid$(resMsg.accNo, 6, 7) & ".prt"
   csvFile = "c:\reports\OS" & Trim(resMsg.accNo) & ".csv"
   If resMsg.langCode = "0" Then
      reportLang = ARABIC
   Else
      reportLang = ENGLISH
   End If
   
   If rs.recordCount > 0 Then
      If reportLang = ARABIC Then
         resMsg.branchName = rs(0)
      Else
         resMsg.branchName = rs(1)
      End If
   Else
      resMsg.branchName = "                    "
   End If
   
   Set textStream = fso.CreateTextFile(reportFile, True)
   Set csvFp = fso.CreateTextFile(csvFile, True)
   accNo = Mid$(resMsg.accNo, 3, 3)
   ccyNo = Mid$(resMsg.accNo, 1, 2)
   Set rs = db.OpenRecordset("select arabicname,englishname from bmledgerinfo " & _
                             "where ledgercode = '" & accNo & "'")
   If rs.recordCount > 0 Then
      If reportLang = ENGLISH Then
         accName = rs(1)
      Else
         accName = rs(0)
      End If
   End If
   Set rs = db.OpenRecordset("select arabicname,englishname from currencyinfo " & _
                             "where currencycode = '" & ccyNo & "'")
   If rs.recordCount > 0 Then
      If reportLang = ENGLISH Then
         ccyName = rs(1)
      Else
         ccyName = rs(0)
      End If
   End If
   If resMsg.decimalPlace = "2" Then
      coinDenomination = 100
      coinPrecision = 2
   ElseIf resMsg.decimalPlace = "3" Then
      coinDenomination = 1000
      coinPrecision = 3
   ElseIf resMsg.decimalPlace = "1" Then
      coinDenomination = 10
      coinPrecision = 1
   Else
      coinDenomination = 1
      coinPrecision = 0
   End If
   On Error Resume Next
   cfBalance = CDbl(resMsg.bfBalance)
   If reportLang = ENGLISH Then
      langChar = Chr$(253)
      statementHeader
   Else
      langChar = Chr$(254)
      arabicHeader
   End If
   If reportLang = ENGLISH Then
      csvFp.WriteLine ("A/C  No  : " & "," & resMsg.accNo & Chr$(253) & "," & resMsg.custName)
      csvFp.WriteLine ("Currency : " & "," & ccyName)
      csvFp.WriteLine ("From     : " & "," & Mid$(resMsg.fromDate, 7, 2) & "/" & Mid$(resMsg.fromDate, 5, 2) & "/" & Mid$(resMsg.fromDate, 1, 4))
      csvFp.WriteLine ("To       : " & "," & Mid$(resMsg.toDate, 7, 2) & "/" & Mid$(resMsg.toDate, 5, 2) & "/" & Mid$(resMsg.toDate, 1, 4))
   
      csvFp.WriteLine ("Userid , Posting Date, Value Date, Narrative 1, Narrative 2 , Narrative 3, Debit Amount, Credit Amount, C/f Balance")
   Else
      csvFp.WriteLine ("—ﬁ„ «·Õ”«»  : " & "," & resMsg.accNo & Chr$(253) & "," & resMsg.custName)
      csvFp.WriteLine ("«·⁄„·Â     :" & "," & ccyName)
      csvFp.WriteLine ("„‰         :" & "," & Mid$(resMsg.fromDate, 7, 2) & "/" & Mid$(resMsg.fromDate, 5, 2) & "/" & Mid$(resMsg.fromDate, 1, 4))
      csvFp.WriteLine ("«·Ï         :" & "," & Mid$(resMsg.toDate, 7, 2) & "/" & Mid$(resMsg.toDate, 5, 2) & "/" & Mid$(resMsg.toDate, 1, 4))
   
      csvFp.WriteLine ("ÂÊÌ… «· ·— ,  «—ÌŒ «·«œŒ«·,  «—ÌŒ «·Õﬁ, ‘—Õ 1, ‘—Õ - 2 , ‘—Õ - 3, «·„»·€ «·„œÌ‰, «·„»·€ «·œ«∆‰, «·—’Ìœ")
   End If

   csvFp.Write ("    " & "," & Mid$(resMsg.fromDate, 7, 2) & "/" & Mid$(resMsg.fromDate, 5, 2) & "/" & Mid$(resMsg.fromDate, 1, 4) & ", ,")
  
   If reportLang = ENGLISH Then
      csvFp.Write ("Balance Brought Forward           " & ", , , , ,")
   Else
      csvFp.Write ("—’Ì‹‹œ „‹‹‹œÊ—                     " & ", , , , ,")
   End If
   
   If cfBalance > 0 Then
      csvFp.WriteLine ("               " & Format(cfBalance / coinDenomination, "############0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")) & "C")
   ElseIf cfBalance < 0 Then
      csvFp.WriteLine ("               " & Format(Abs(cfBalance) / coinDenomination, "############0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")) & "D")
   Else
      csvFp.WriteLine ("               " & Format(cfBalance / coinDenomination, "############0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")))
   End If

   generateReport
   Do While lines <= 64
      textStream.WriteLine
      lines = lines + 1
   Loop
   
   textStream.WriteLine (String(110, "-"))
   If reportLang = ENGLISH Then
      textStream.WriteLine ("                                  Value of Movements" & langChar & _
                           Format(Format(drAmt / coinDenomination, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar & _
                           Format(Format(crAmt / coinDenomination, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar)
      textStream.WriteLine ("                                 Number of Movements                 " & langChar & _
                         Format(drTrans, "##,###,###,###,##0") & langChar & _
                         "                 " & Format(crTrans, "##,###,###,###,##0") & langChar)
   Else
      textStream.WriteLine ("                                  „Ã„Ê⁄ «·Õ—ﬂ« " & langChar & _
                          Format(Format(drAmt / coinDenomination, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar & _
                          Format(Format(crAmt / coinDenomination, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar)
      textStream.WriteLine ("                                 ⁄œœ «·Õ—ﬂ‹‹‹‹«        " & langChar & _
                         Format(Format(drTrans, "##,###,###,###,##0"), "!@@@@@@@@@@@@@@@@@@") & langChar & _
                         "" & Format(Format(crTrans, "##,###,###,###,##0"), "!@@@@@@@@@@@@@@@@@@") & langChar)
   End If
   
   textStream.WriteLine (String(110, "-"))
   If reportLang = ENGLISH Then
      textStream.Write ("   Issued Upon your request.                     NOT A SUBSTITUTE FOR PERIODIC STATEMENT       " & langChar)
   Else
      textStream.Write ("    „ «’œ«— «·ﬂ‘› Õ”» ÿ·»ﬂ„                     ÊÂÊ ·« Ì€‰Ì ⁄‰ ﬂ‘› Õ”«»ﬂ„ «·œÊ—Ì      " & langChar)
   End If
   textStream.Close
   csvFp.Close
   
   frmInputform.MousePointer = vbDefault
   cmdPrintStmt.Enabled = True
   cmdExit.Enabled = True
   
   Set textStream = fsys.OpenTextFile(reportFile, 1, False, False)
   
   lines = 0
'   tmpStr = errWannaPrint(UserLang)
'   response = MsgBox(tmpStr, vbYesNo)
'   If response = vbYes Then
      Printer.Orientation = vbPRORPortrait
      Printer.FontName = "Courier New (Arabic)"
      Printer.FontSize = 8
      If reportLang = ENGLISH Then
         Printer.RightToLeft = False
      Else
         Printer.RightToLeft = True
      End If
      'Printer.PaintPicture anbLogo, 2500, 150
      'Printer.PaintPicture anbLogo, 4500, 400
      Printer.PaintPicture frmLogin.anbLogo1, 50, 200
      For i = 1 To 4
         Printer.Print vbCrLf
         lines = lines + 1
      Next
      Printer.FontBold = False
      While textStream.AtEndOfStream = False
          tLine = textStream.ReadLine
          Printer.Print tLine
          lines = lines + 1
          If lines > 74 Then
             Printer.NewPage
             lines = 0
             'Printer.PaintPicture anbLogo, 2500, 150
             Printer.PaintPicture frmLogin.anbLogo1, 50, 200
             For i = 1 To 4
                 Printer.Print vbCrLf
                 lines = lines + 1
             Next
          End If
      Wend
      Printer.EndDoc
'   End If

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim num As String
   
   If ConnectServer(OnlineTcp, onlineTimer, onlineHostName, OnlinePort) = LocalCommsError Then
      onlineTimer.Interval = 0 'deactivate the timer
      frmAccountGrid.Show
      Exit Sub
   End If
   onlineTimer.Interval = 0 'deactivate the timer
   'anbLogo.Picture = LoadPicture(App.Path & "\ANB Logo new.bmp")
   
   If UserLang = ARABIC Then
      ChangePositions frmInputform, 11800
      frmInputform.RightToLeft = True
      frmInputform.txtAccName.Alignment = 1
      frmInputform.txtCurrency.Alignment = 1
      frmInputform.txtAccountType.Alignment = 1
   End If
     
   
   frmInputform.Caption = frmInputFormCaption(0, UserLang)
   frmInputform.lblOnlineStmt.Caption = frmInputFormCaption(1, UserLang)
   frmInputform.lblAccNo.Caption = frmInputFormCaption(2, UserLang)
   frmInputform.lblAccName.Caption = frmInputFormCaption(3, UserLang)
   frmInputform.lblCurrency.Caption = frmInputFormCaption(4, UserLang)
   frmInputform.lblAccountType.Caption = frmInputFormCaption(5, UserLang)
   frmInputform.lblFromDate.Caption = frmInputFormCaption(6, UserLang)
   frmInputform.lblToDate.Caption = frmInputFormCaption(7, UserLang)
   frmInputform.cmdPrintStmt.Caption = frmInputFormCaption(8, UserLang)
   frmInputform.cmdExit.Caption = frmInputFormCaption(9, UserLang)
   
   Set fsys = CreateObject("scripting.filesystemobject")
    
   cmbFromDate.Clear
   cmbToDate.Clear
   cmbFromMonth.Clear
   cmbToMonth.Clear
   For i = 1 To 31
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbFromDate.AddItem num
       cmbToDate.AddItem num
       If i < 13 Then
          cmbFromMonth.AddItem num
          cmbToMonth.AddItem num
       End If
   Next
'   txtToYear = CStr(Year(Date))
'   cmbToMonth = Format(CStr(Month(Date)), "00")
'   cmbToDate = Format(CStr(Day(Date)), "00")

    txtToYear = "2009"
    cmbToMonth = "07"
    cmbToDate = "11"
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
CSD_mdiForm.staticStatus.Panels(3).text = "  "
End Sub

Private Sub OnlineTcp_Connect()
   HostConnected = True
End Sub

Private Sub OnlineTcp_DataArrival(ByVal bytesTotal As Long)
   Dim blockedMsg As String
   Dim s As String
   On Error GoTo err_handler
  
   If MsgWouldBlock = False Then
      s = "1"
      OnlineTcp.GetData resMsg.msgLen, vbString, 4
      RecvStr = ""
      s = "2"
      OnlineTcp.GetData RecvStr, vbString, bytesTotal - 4
      s = "3"
      If bytesTotal < CLng(resMsg.msgLen) Then
         MsgWouldBlock = True
         DoEvents
      End If
   Else
      s = "4"
      OnlineTcp.GetData blockedMsg, vbString, bytesTotal
      s = "5"
      RecvStr = RecvStr & blockedMsg
      s = "6"
      If Len(RecvStr) < (CLng(resMsg.msgLen) - 4) Then
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
   LogData "Unexpected error  " & str(Err.Number) & "   " & Err.Description & "  occured in line  " & s & "  [onlineTcp_DataArrival]"
   Resume Next
End Sub

Private Sub OnlineTcp_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
 Dim response As Integer
 If Number = sckConnectionRefused Or _
    Number = sckHostNotFound Or _
    Number = sckHostNotFoundTryAgain Then
    MsgBox (errConnectProblem(UserLang) & CStr(Number) & ": " & errConnectionRejected(UserLang) _
          & Chr(13) & errHostName(UserLang) & onlineHostName & "; " & errPortNo(UserLang) & CStr(OnlinePort) _
          & Chr(13) & errCallHeadOffice1(UserLang))
    Unload Me
    frmAccountGrid.MousePointer = vbNormal
ElseIf Number = sckBadState Or _
       Number = sckNotConnected Or _
       Number = sckSocketShutdown Or _
       Number = sckTimedout Then
    response = MsgBox(errConnectProblem(UserLang) & " (" & CStr(Number) & ") " & Description _
        & Chr(13) & Chr(13) & errShouldIReconnect(UserLang), vbOKCancel)
    If response = vbOK Then
        OnlineTcp.Close
        OnlineTcp.Connect
    ElseIf response = vbCancel Then
        Unload Me
        frmAccountGrid.MousePointer = vbNormal
    End If
ElseIf Number = sckWouldBlock Then
    MsgWouldBlock = True
Else
    MsgBox (errConnectProblem(UserLang) & CStr(Number) & ": " & Description _
            & Chr(13) & Chr(13) & errUnexpectedError(UserLang))
    Unload Me
    frmAccountGrid.MousePointer = vbNormal
End If
End Sub


Private Sub onlineTimer_Timer()
    TimeOutFlag = True
    onlineTimer.Enabled = False
End Sub

Private Sub formatRequest(lastTransPointer As String)
    reqMsg.msgLen = "0386"
    reqMsg.checkSum = Space(1)
    reqMsg.branchName = Format(gBranch, "!@@@@@@@@@@")
    reqMsg.Source = Space(2)
    reqMsg.service = "07"
    reqMsg.mainAccNo = Format(frmInputform.txtAccNo, "!@@@@@@@@@@@@@@")
    reqMsg.fromDate = txtFromYear & cmbFromMonth & cmbFromDate
    reqMsg.toDate = txtToYear & cmbToMonth & cmbToDate
    reqMsg.lastTransPointer = lastTransPointer
    reqMsg.userId = "STMT"
    reqMsg.filler = Space(327)
    reqMsg.EOT = "Z"
End Sub

Private Sub txtFromYear_Change()
   If Len(RTrim(txtFromYear)) <> 0 Then
      If Len(txtFromYear) = 4 Then
         On Error Resume Next
         cmbToDate.SetFocus
      End If
   End If
End Sub

Private Sub txtFromYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtToYear_Change()
   If Len(RTrim(txtToYear)) <> 0 Then
      If Len(txtToYear) = 4 Then
         On Error Resume Next
         cmdPrintStmt.SetFocus
      End If
   End If
End Sub

Public Sub statementHeader()
 
   page = page + 1
   
'   textStream.WriteLine ("                            " & resMsg.branchName & langChar & _
                         "                  Date:" & CStr(Date) & "               Page : " & CStr(page) & langChar)
   textStream.WriteLine ("          " & resMsg.branchName & langChar & _
                         "                                      Date:" & CStr(Date) & "                      Page : " & CStr(page) & langChar)
   textStream.WriteLine ("          ON  DEMAND STATEMENT              " & langChar)
   textStream.WriteLine
   textStream.WriteLine ("                             " & _
                        "                          " & resMsg.custName & langChar)
   textStream.WriteLine ("                             " & _
                        "                          " & Mid$(resMsg.address, 1, 30) & langChar)
'   textStream.WriteLine ("                             " & _
'                        "                          " & Mid$(resMsg.address, 31, 30) & langChar)
   
   textStream.WriteLine ("Type     : " & langChar & Format(accName, "!" & String(30, "@")) & langChar & _
                        "              " & Mid$(resMsg.address, 31, 30) & langChar)
   'textStream.WriteLine ("A/C  No  : " & langChar & resMsg.accNo & langChar & Space(30) & errIban(1) & ":" & langChar & displayIban(txtIBAN) & langChar)
   textStream.WriteLine ("A/C  No  : " & langChar & resMsg.accNo & langChar)
   textStream.WriteLine ("IBAN     : " & langChar & displayIban(txtIban) & langChar)
   textStream.WriteLine ("Currency : " & langChar & ccyName & langChar)
   textStream.WriteLine ("From     : " & langChar & Mid$(resMsg.fromDate, 7, 2) & "/" & Mid$(resMsg.fromDate, 5, 2) & "/" & Mid$(resMsg.fromDate, 1, 4) & langChar)
   textStream.WriteLine ("To       : " & langChar & Mid$(resMsg.toDate, 7, 2) & "/" & Mid$(resMsg.toDate, 5, 2) & "/" & Mid$(resMsg.toDate, 1, 4) & langChar)
   textStream.WriteLine (String(110, "-"))
   textStream.WriteLine ("Tlr  " & langChar & "Trans.    " & langChar & "P A R T I C U L A R S       " & langChar & "Value                 " & langChar & "M O V E M E N T S                 " & langChar & "Balance " & langChar & "D-Dr  " & langChar)
   textStream.WriteLine ("Id   " & langChar & "Date                                  " & langChar & "Date                " & langChar & "DEBIT            " & langChar & "CREDIT                     " & langChar & "C-Cr  " & langChar)
   textStream.WriteLine (String(110, "-"))
   
   If page = 1 Then
      textStream.Write ("    " & Mid$(resMsg.fromDate, 7, 2) & "/" & Mid$(resMsg.fromDate, 5, 2) & "/" & Mid$(resMsg.fromDate, 1, 4) & langChar)
   Else
      textStream.Write ("              ")
   End If
      
   textStream.Write ("  Balance Brought Forward                                  " & langChar)
   
   If cfBalance > 0 Then
      textStream.WriteLine ("               " & Format(Format(cfBalance / coinDenomination, "#,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar & "C")
   ElseIf cfBalance < 0 Then
      textStream.WriteLine ("               " & Format(Format(Abs(cfBalance) / coinDenomination, "#,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar & "D")
   Else
      textStream.WriteLine ("               " & Format(Format(cfBalance / coinDenomination, "#,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar)
   End If
   
   lines = 16

End Sub

Public Sub generateReport()
   Dim noOfSpaceRequired As Integer
   Dim linesReqd As Integer
   Dim tmpStr As String
   Dim dateSeparator As String
   If reportLang = ARABIC Then
      dateSeparator = "\"
   Else
      dateSeparator = "/"
   End If
   Do While True
      On Error Resume Next
      noOfTrans = CInt(resMsg.noOfTransHere)
      For j = 1 To noOfTrans
          linesReqd = 1
          If Mid$(resMsg.transDetails(j).transAmt, 1, 1) = "+" Then
             drCrFlag = "Cr"
          Else
             drCrFlag = "Dr"
          End If
          If Len(RTrim(resMsg.transDetails(j).narrative2)) > 0 Then
             linesReqd = linesReqd + 1
          End If
          If Len(RTrim(resMsg.transDetails(j).narrative3)) > 0 Then
             linesReqd = linesReqd + 1
          End If
          If lines + linesReqd > 68 Then
             Do While lines <= 68
                textStream.WriteLine
                lines = lines + 1
             Loop
             textStream.WriteLine
             textStream.WriteLine ("------------------------------------------" & IIf(reportLang = ENGLISH, "Contd...", "Ì »‹⁄...") & langChar & CStr(page + 1) & "------------------------------------------------------")
             If reportLang = ENGLISH Then
                statementHeader
             Else
                arabicHeader
             End If
          End If
          'On Error GoTo errHandler
          On Error Resume Next
          tranAmt = Abs(CDbl(resMsg.transDetails(j).transAmt))
          amtToPrint = tranAmt / coinDenomination
          'On Error GoTo 0
          csvFp.Write (resMsg.transDetails(j).userId & "," & Mid$(resMsg.transDetails(j).postDate, 7, 2) & "/" & Mid$(resMsg.transDetails(j).postDate, 5, 2) & "/" & Mid$(resMsg.transDetails(j).postDate, 1, 4) & ",")
          csvFp.Write (Mid$(resMsg.transDetails(j).valueDate, 7, 2) & "/" & Mid$(resMsg.transDetails(j).valueDate, 5, 2) & "/" & Mid$(resMsg.transDetails(j).valueDate, 1, 4) & ",")
          csvFp.Write (resMsg.transDetails(j).narrative1 & Chr$(253) & ",")
          csvFp.Write (resMsg.transDetails(j).narrative2 & Chr$(253) & "," & resMsg.transDetails(j).narrative3 & Chr$(253) & ",")
          If drCrFlag = "Cr" Then
             crAmt = crAmt + tranAmt
             cfBalance = cfBalance + tranAmt
             textStream.Write (resMsg.transDetails(j).userId & langChar & " " & Mid$(resMsg.transDetails(j).postDate, 7, 2) & dateSeparator & Mid$(resMsg.transDetails(j).postDate, 5, 2) & dateSeparator & Mid$(resMsg.transDetails(j).postDate, 1, 4) & langChar)
             If Len(RTrim(resMsg.transDetails(j).narrative1)) <> 0 Then
                noOfSpaceRequired = 0
                noOfSpaceRequired = checkNarrative(resMsg.transDetails(j).narrative1)
                textStream.Write ("  " & IIf(noOfSpaceRequired > 0, resMsg.transDetails(j).narrative1 & langChar & Space(noOfSpaceRequired + 1), resMsg.transDetails(j).narrative1 & langChar & " "))
                
             Else
                textStream.Write ("                            ")
             End If
             textStream.Write (Mid$(resMsg.transDetails(j).valueDate, 7, 2) & dateSeparator & Mid$(resMsg.transDetails(j).valueDate, 5, 2) & dateSeparator & Mid$(resMsg.transDetails(j).valueDate, 1, 4) & langChar & _
                              "                  " & langChar & Format(Format(amtToPrint, "##,###,###,###,##0" & _
                                    IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@") & langChar)
             csvFp.Write (" " & "," & Format(amtToPrint, "#############0" & _
                                    IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")) & ",")
             If cfBalance >= 0 Then
                textStream.WriteLine (" " & Format(Format(cfBalance / coinDenomination, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar & _
                                      IIf(reportLang = ENGLISH, "C", " œ") & langChar)
                csvFp.WriteLine (Format(cfBalance / coinDenomination, "#############0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")) & "C" & ",")
             Else
                 textStream.WriteLine (" " & Format(Format(Abs(cfBalance) / coinDenomination, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar & _
                                      IIf(reportLang = ENGLISH, "D", " „") & langChar)
                 csvFp.WriteLine (Format(Abs(cfBalance) / coinDenomination, "#############0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")) & "D" & ",")
             End If
             lines = lines + 1
             crTrans = crTrans + 1
          Else
             drAmt = drAmt + tranAmt
             cfBalance = cfBalance - tranAmt
             textStream.Write (resMsg.transDetails(j).userId & langChar & " " & Mid$(resMsg.transDetails(j).postDate, 7, 2) & dateSeparator & Mid$(resMsg.transDetails(j).postDate, 5, 2) & dateSeparator & Mid$(resMsg.transDetails(j).postDate, 1, 4) & langChar)
             If Len(RTrim(resMsg.transDetails(j).narrative1)) <> 0 Then
                noOfSpaceRequired = 0
                noOfSpaceRequired = checkNarrative(resMsg.transDetails(j).narrative1)
                textStream.Write ("  " & IIf(noOfSpaceRequired > 0, resMsg.transDetails(j).narrative1 & langChar & Space(noOfSpaceRequired + 1), resMsg.transDetails(j).narrative1 & langChar & " "))
             Else
                textStream.Write ("                            ")
             End If
             textStream.Write (Mid$(resMsg.transDetails(j).valueDate, 7, 2) & dateSeparator & Mid$(resMsg.transDetails(j).valueDate, 5, 2) & dateSeparator & Mid$(resMsg.transDetails(j).valueDate, 1, 4) & langChar & _
                              " " & Format(Format(amtToPrint, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@") & langChar)
             csvFp.Write (Format(amtToPrint, "#############0" & _
                                    IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")) & " ," & ",")
             If cfBalance >= 0 Then
                textStream.WriteLine ("                  " & Format(Format(cfBalance / coinDenomination, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar & _
                                      IIf(reportLang = ENGLISH, "C", " œ") & langChar)
                csvFp.WriteLine (Format(cfBalance / coinDenomination, "#############0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")) & "C" & ",")
             Else
                textStream.WriteLine ("                  " & Format(Format(Abs(cfBalance) / coinDenomination, "##,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & langChar & _
                                      IIf(reportLang = ENGLISH, "D", " „") & langChar)
                csvFp.WriteLine (Format(Abs(cfBalance) / coinDenomination, "#############0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")) & "D" & ",")
             End If
             lines = lines + 1
             drTrans = drTrans + 1
          End If
          If Len(RTrim(resMsg.transDetails(j).narrative2)) <> 0 Then
             textStream.WriteLine ("                " & resMsg.transDetails(j).narrative2 & langChar)
             lines = lines + 1
          End If
          If Len(RTrim(resMsg.transDetails(j).narrative3)) <> 0 Then
             textStream.WriteLine ("                " & resMsg.transDetails(j).narrative3 & langChar)
             lines = lines + 1
          End If
       Next
       If resMsg.completionFlag <> "1" Then
          'formatRequest (resMsg.lastTransPtr)
          reqMsg.lastTransPointer = resMsg.lastTransPtr
          SendMsg = reqMsg.msgLen & reqMsg.checkSum & reqMsg.branchName & reqMsg.Source & reqMsg.service & _
                    reqMsg.mainAccNo & reqMsg.fromDate & reqMsg.toDate & _
                    reqMsg.lastTransPointer & reqMsg.userId & reqMsg.filler & reqMsg.EOT
          strmsglen = Format(Len(SendMsg), "0000")
          Mid$(SendMsg, 1, 4) = strmsglen
          DataReceivedFlag = False
          If HandleOnlineTraffic(OnlineTcp, onlineTimer, onlineHostName, OnlinePort) = LocalCommsError Then
             CSD_mdiForm.staticStatus.Panels(3).text = "Error occured while talking to bmrtServer"
             LoadError = True
             Exit Sub
          End If
          If resMsg.responseStatus <> "00" And _
             resMsg.responseStatus <> "01" Then
             Exit Do
          End If
       Else
          Exit Do
       End If
  Loop
  Exit Sub
errHandler:
   MsgBox "Error " & Err.Number & " " & Err.Description & " occurred in transaction amount; Report the problem to Help Desk "
   Exit Sub
End Sub
Public Function checkNarrative(narrative As String) As Integer
    Dim noOfChar As Integer
    Dim i As Integer
    Dim rChar As String
    Dim rFile As String
    noOfChar = 0
    If Len(RTrim(stmtArabicChars)) = 0 Then
       stmtArabicChars = "·„·Ì —"
    End If
'       rFile = "c:\reports\arabic.txt"
'       On Error GoTo err_handler
'       Set tStream = fsys.OpenTextFile(rFile, 1, False, False)
'       While tStream.AtEndOfStream = False
'             rChar = tStream.Read(2)
'             If InStr(narrative, rChar) > 0 Then
'                noOfChar = noOfChar + 1
'             End If
'       Wend
'       tStream.Close
    
    For i = 1 To Len(Trim(stmtArabicChars)) Step 2
        rChar = Mid$(stmtArabicChars, i, 2)
        If InStr(narrative, rChar) > 0 Then
           noOfChar = noOfChar + 1
        End If
    Next
    checkNarrative = noOfChar
    Exit Function
err_handler:
    LogData "The arabic text file [" & rFile & "] could not be opened"
    LogData "Error Received while opening is  " & Err.Number & "   " & Err.Description
    Exit Function
End Function
Public Sub arabicHeader()
   page = page + 1
   
'   textStream.WriteLine ("                       " & resMsg.branchName & langChar & _
'                         "              «—ÌŒ:" & CStr(Day(Date)) & "\" & CStr(Month(Date)) & "\" & CStr(Year(Date)) & langChar & "                    ’›ÕÂ: " & CStr(page) & langChar)
   textStream.WriteLine ("          " & resMsg.branchName & langChar & _
                         "                                         «—ÌŒ:" & CStr(Day(Date)) & "\" & CStr(Month(Date)) & "\" & CStr(Year(Date)) & langChar & "                    ’›ÕÂ: " & CStr(page) & langChar)
   textStream.WriteLine ("          ﬂ‘› „ƒﬁ               " & langChar)
   textStream.WriteLine
   textStream.WriteLine ("                             " & _
                        "                          " & resMsg.custName & langChar)
   textStream.WriteLine ("                             " & _
                        "                          " & Mid$(resMsg.address, 1, 30) & langChar)
'   textStream.WriteLine ("                             " & _
'                        "                          " & Mid$(resMsg.address, 31, 30) & langChar)
   
   textStream.WriteLine ("‰Ê⁄ «·Õ”«»  : " & langChar & Format(accName, "!" & String(30, "@")) & _
                        "             " & Mid$(resMsg.address, 31, 30) & langChar)
   'textStream.WriteLine ("—ﬁ„ «·Õ”«»  : " & langChar & resMsg.accNo & langChar & Space(27) & errIban(0) & ":" & langChar & displayIban(txtIBAN) & langChar)
   textStream.WriteLine ("—ﬁ„ «·Õ”«»  : " & langChar & resMsg.accNo & langChar)
   textStream.WriteLine ("¬Ì»«‰      : " & langChar & displayIban(txtIban) & langChar)
   textStream.WriteLine ("«·⁄„·Â     : " & langChar & ccyName)
   textStream.WriteLine ("„‰         : " & langChar & Mid$(resMsg.fromDate, 7, 2) & "\" & Mid$(resMsg.fromDate, 5, 2) & "\" & Mid$(resMsg.fromDate, 1, 4))
   textStream.WriteLine ("«·Ï         : " & langChar & Mid$(resMsg.toDate, 7, 2) & "\" & Mid$(resMsg.toDate, 5, 2) & "\" & Mid$(resMsg.toDate, 1, 4))
   textStream.WriteLine (String(110, "-"))
   textStream.WriteLine ("ÂÊÌÂ    " & langChar & " «—ÌŒ        " & langChar & "«· ›«’Ì‹‹‹‹‹·          " & langChar & " «—ÌŒ              " & langChar & "«·Õ—ﬂ‹‹‹‹‹‹«                       " & langChar & "—’Ìœ „-„‰Â " & langChar)
   textStream.WriteLine ("«· ·—  " & langChar & "«·Õ—ﬂÂ                                   " & langChar & "«·Õﬁ        " & langChar & "„œÌ‹‹‰            " & langChar & "œ«∆‹‰                     " & langChar & "œ-·‹Â  " & langChar)
   textStream.WriteLine (String(110, "-"))
   
   If page = 1 Then
      textStream.Write ("    " & Mid$(resMsg.fromDate, 7, 2) & "\" & Mid$(resMsg.fromDate, 5, 2) & "\" & Mid$(resMsg.fromDate, 1, 4))
   Else
      textStream.Write ("              ")
   End If
      
   textStream.Write ("  —’Ì‹‹œ „‹‹‹œÊ—                                           " & langChar)
   
   If cfBalance > 0 Then
      textStream.WriteLine ("               " & Format(Format(cfBalance / coinDenomination, "#,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & " œ")
   ElseIf cfBalance < 0 Then
      textStream.WriteLine ("               " & Format(Format(Abs(cfBalance) / coinDenomination, "#,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@") & " „")
   Else
      textStream.WriteLine ("               " & Format(Format(cfBalance / coinDenomination, "#,###,###,###,##0" & IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "@@@@@@@@@@@@@@@@@@"))
   End If
   
   lines = 16

End Sub

Private Sub txtToYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
