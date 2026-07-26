VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmGeneralCustStatus 
   BackColor       =   &H00BFD87E&
   Caption         =   "Customers opened Through phone"
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
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1560
      TabIndex        =   12
      ToolTipText     =   "Next"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4470
      TabIndex        =   14
      ToolTipText     =   "Return to Account Menu"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.Frame FrameRecordStatus 
      Height          =   615
      Left            =   1920
      TabIndex        =   21
      Top             =   1230
      Width           =   7815
      Begin VB.OptionButton optRejected 
         Caption         =   "Rejected"
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
         Left            =   2400
         TabIndex        =   8
         Tag             =   "7815"
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton optAll 
         Caption         =   "All"
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
         TabIndex        =   6
         Tag             =   "7815"
         Top             =   240
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton optCompleted 
         Caption         =   "Completed"
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
         Left            =   960
         TabIndex        =   7
         Tag             =   "7815"
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton optPendingWithBranch 
         Caption         =   "Pending with Branch"
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
         Height          =   375
         Left            =   3720
         TabIndex        =   9
         Tag             =   "7815"
         Top             =   120
         Width           =   1695
      End
      Begin VB.OptionButton optPendingWithCustomer 
         Caption         =   "Customer not visited the branch"
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
         Height          =   375
         Left            =   5520
         TabIndex        =   10
         Tag             =   "7815"
         Top             =   120
         Width           =   2055
      End
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Screen Print"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5925
      TabIndex        =   15
      ToolTipText     =   "Screen Print"
      Top             =   7920
      Width           =   1575
   End
   Begin VB.TextBox txtEndYear 
      Height          =   285
      Left            =   7560
      MaxLength       =   4
      TabIndex        =   5
      Top             =   720
      Width           =   615
   End
   Begin VB.ComboBox cmbEndMonth 
      Height          =   315
      Left            =   6960
      TabIndex        =   4
      Top             =   720
      Width           =   615
   End
   Begin VB.ComboBox cmbEndDate 
      Height          =   315
      Left            =   6360
      TabIndex        =   3
      Top             =   720
      Width           =   615
   End
   Begin VB.CommandButton cmdCustInfo 
      Caption         =   "Customer Info"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3015
      TabIndex        =   13
      ToolTipText     =   "Transfer Details"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go"
      Height          =   375
      Left            =   9840
      TabIndex        =   11
      ToolTipText     =   "Go"
      Top             =   1320
      Width           =   1335
   End
   Begin VB.ComboBox cmbStartDate 
      Height          =   315
      Left            =   2280
      TabIndex        =   0
      Top             =   720
      Width           =   615
   End
   Begin VB.ComboBox cmbStartMonth 
      Height          =   315
      Left            =   2880
      TabIndex        =   1
      Top             =   720
      Width           =   615
   End
   Begin VB.TextBox txtStartYear 
      Height          =   285
      Left            =   3480
      MaxLength       =   4
      TabIndex        =   2
      Top             =   720
      Width           =   615
   End
   Begin MSFlexGridLib.MSFlexGrid generalCustStatusGrid 
      Height          =   5535
      Left            =   120
      TabIndex        =   17
      Top             =   2040
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   9763
      _Version        =   393216
      Rows            =   2000
      Cols            =   11
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
      Left            =   360
      TabIndex        =   20
      Top             =   1455
      Width           =   1455
   End
   Begin VB.Label lblEndDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "End Date"
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
      Top             =   750
      Width           =   1095
   End
   Begin VB.Label lblGeneralCustOpenStatusEnq 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customers opened Through phone"
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
      Left            =   3360
      TabIndex        =   18
      Top             =   120
      Width           =   5655
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
      TabIndex        =   16
      Top             =   750
      Width           =   1095
   End
End
Attribute VB_Name = "frmGeneralCustStatus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public lines As Integer
Public page As String
Public textStream, tStream As Object
Public fsys As Object
Public langChar As String

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

Private Sub cmdCustInfo_Click()
  Dim tCustNo As String
  Dim tmpCode As String
  Dim retStr As String

  generalCustStatusGrid.Col = 3
  tCustNo = Format(generalCustStatusGrid.text, "!@@@@@@@")
  If Len(RTrim(tCustNo)) = 0 Then
     MsgBox errInvalidSearchCriteria(UserLang)
     Exit Sub
  End If
  generalCustStatusGrid.Col = 5
  tmpCode = Mid$(generalCustStatusGrid.text, 1, 1)
  If tmpCode <> "9" Then
     frmGeneralCustStatus.MousePointer = vbHourglass
     If getCustHistory("00000", tCustNo, "0") = -1 Then
        frmGeneralCustStatus.MousePointer = vbNormal
        Exit Sub
     End If
     frmGeneralCustStatus.MousePointer = vbNormal
    
     frmEnquirySelect.tag = "0"
     frmEnquirySelect.Hide
     If UserLang = ARABIC Then
        ChangePositions frmCustUpdateHistory, 11800
        frmCustUpdateHistory.RightToLeft = True
     End If
    
     frmCustUpdateHistory.Show
     Unload frmEnquirySelect
     Exit Sub
  End If
  retStr = doSearch1("00000", tCustNo)
  If retStr <> "-0001" Then
     supervisorAction = False
     tellerAction = False
     searchAction = True
     updateAction = False
     custHistoryAction = False
     phoneCustOpenAction = False
     If UserLang = ARABIC Then
        ChangePositions frmEnquirySelect, 11800
        frmEnquirySelect.RightToLeft = True
     End If
     frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(2, UserLang)
     frmEnquirySelect.txtSearchCriteria.text = Trim(tCustNo)
     frmEnquirySelect.Show
  End If
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
      cmbEndDate.SetFocus
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
       
   formatGeneralCustStatusEnquiry ("00000")
   If doGeneralCustStatusEnq = 1 Then ' failure
      Exit Sub
   End If
           
   If recvGeneralCustStatusEnqMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      fillGeneralCustGridHeading
      frmGeneralCustStatus.MousePointer = vbNormal
      Exit Sub
   End If
   
   On Error Resume Next
   
'   Form_Load
'   cmdGo.Enabled = False
'   cmdExit.Enabled = False
'   recvGeneralCustStatusEnqMsg.MousePointer = vbHourglass
'   loadLocalDb
'   Do While recvTransferEnqMsg.completionFlag = "0"
'      formatTransferEnqRequest (recvTransferEnqMsg.lastRecCount)
'      SendMsg = transferEnqMsg.msgLen & transferEnqMsg.service & transferEnqMsg.homeBranch & _
'                transferEnqMsg.userId & transferEnqMsg.accNo & transferEnqMsg.fromDate & _
'                transferEnqMsg.toDate & transferEnqMsg.bpRefNo & transferEnqMsg.recordStatus & _
'                transferEnqMsg.lastRecCount
'
'      strmsglen = Format(Len(SendMsg), "000000")
'      Mid$(SendMsg, 1, 6) = strmsglen
'      DataReceivedFlag = False
'      TimeOutFlag = False
'      MsgWouldBlock = False
'      If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
'         LoadError = True
'         cmdGo.Enabled = True
'         cmdExit.Enabled = True
'         frmSarieTransferEnq.MousePointer = vbNormal
'         Exit Sub
'      End If
'
'      parseTransferEnq
'
'      If recvTransferEnqMsg.status <> "000" Then
'         If UserLang = ARABIC Then
'            MsgBox recvTransferEnqMsg.aRemarks
'         Else
'            MsgBox recvTransferEnqMsg.eRemarks
'         End If
'         cmdGo.Enabled = True
'         cmdExit.Enabled = True
'         frmSarieTransferEnq.MousePointer = vbNormal
'         Exit Do
'      End If
'      loadLocalDb
'   Loop
'   Set rs = transDb.OpenRecordset("select count(*) from transferinfo")
'
'   If rs.recordCount > 0 Then
'      totalRecord = rs(0)
'   Else
'      totalRecord = 1
'   End If
'
'   generalCustStatusGrid.Rows = (totalRecord * 4) + 2
   
   fillGeneralCustStatusGrid
     
   cmdMore.Enabled = True
   cmdPrint.Enabled = True
   cmdCustInfo.Enabled = True
   cmdExit.Enabled = True
   
   cmdGo.Enabled = True
   frmGeneralCustStatus.MousePointer = vbNormal
   
End Sub

Private Sub cmdMenu_Click()
   Unload Me
End Sub

Private Sub cmdMore_Click()
  If recvGeneralCustStatusEnqMsg.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   formatGeneralCustStatusEnquiry (recvGeneralCustStatusEnqMsg.lastRecCount)
   If doGeneralCustStatusEnq = 1 Then ' failure
      Exit Sub
   End If
    
   If recvGeneralCustStatusEnqMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   
   fillGeneralCustStatusGrid

End Sub

Private Sub cmdRefresh_Click()
    cmdGo_Click
End Sub

Private Sub cmdTxferInfo_Click()
    generalCustStatusGrid_DblClick
End Sub

Private Sub cmdPrint_Click()
    generateCustStatusReport
End Sub
Public Sub generateCustStatusReport()
    Dim i As Integer
    Dim reportFile As String
    Dim tChequeType As String, tRequestStatus As String
    Dim oldBranchCode As String
    Dim tCode As String
    Dim strmsglen As String
    Dim recsTotal As Integer
    Dim tmpStr As String
    Dim response
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    
    recsTotal = 0

    Set fsys = CreateObject("scripting.filesystemobject")
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    If (Not fso.FolderExists("c:\reports")) Then
       fso.CreateFolder ("c:\reports")
    End If
    
    reportFile = "c:\reports\custstatus.prt"

    Set textStream = fsys.CreateTextFile(reportFile, True)
    
    'langChar = Chr$(253)  ' for english
    
    langChar = Chr$(254)  ' for arabic
    
    oldBranchCode = "--------"
    
    Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.FontName = "Courier New (Arabic)"
    Printer.fontSize = 12
    Printer.FontBold = False
    'Printer.RightToLeft = False '  for english
    Printer.RightToLeft = True ' for arabic
    
    page = Val(generalCustStatusEnqMsg.lastRecCount) / 20 + 1
    custStatusHeaderPrint
    On Error Resume Next
    For i = 1 To Val(recvGeneralCustStatusEnqMsg.noOfRecs)
    
        recsTotal = recsTotal + 1
        tCode = recvGeneralCustStatusEnqMsg.details(i).pendingStatus
        If tCode = "1" Then
            tmpStr = errPendingWithSupervisor(0) '"Pending with branch supervisor"
         ElseIf tCode = "2" Then
            tmpStr = errPendingWithCso(0) '"Pending with branch CSO"
         ElseIf tCode = "3" Then
            tmpStr = errRejected(0) '"Rejected by the branch supervisor"
         ElseIf tCode = "4" Then
            tmpStr = errCustomerNotYetVisted(0) '"Customer not yet visited the branch"
         ElseIf tCode = "5" Then
            tmpStr = errRejectedByBranchCso(0)   '" Rejected by Branch CSO"
         ElseIf tCode = "9" Then
            tmpStr = errCompleted(0) '"Completed"
         Else
            tmpStr = errUnknown(0)  '"Unknown"
         End If
        
        'Printer.Print "Branch code   User Id     Date & Time       Customer Number    Cust.Branch Code     Pending Status    Branch UserId     Branch Action Date&Time   "
        textStream.WriteLine recvGeneralCustStatusEnqMsg.details(i).branchCode & langChar & Space(5) & _
                      formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).dateTime, 1, 8)) & langChar & Space(1) & _
                      formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).dateTime, 9, 6)) & langChar & Space(3) & _
                      recvGeneralCustStatusEnqMsg.details(i).custNo & langChar & Space(5) & _
                      recvGeneralCustStatusEnqMsg.details(i).custBranchCode & langChar & Space(5) & _
                      tCode & "-" & Format(tmpStr, "!" & String(37, "@")) & langChar & Space(5) & _
                      recvGeneralCustStatusEnqMsg.details(i).branchUserId & langChar & Space(5)

        Printer.Print Space(3) & recvGeneralCustStatusEnqMsg.details(i).branchCode & langChar & Space(3) & _
                      recvGeneralCustStatusEnqMsg.details(i).userId & Space(3) & _
                      formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).dateTime, 1, 8)) & langChar & Space(1) & _
                      formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).dateTime, 9, 6)) & langChar & Space(3) & _
                      recvGeneralCustStatusEnqMsg.details(i).custNo & langChar & Space(3) & _
                      recvGeneralCustStatusEnqMsg.details(i).custBranchCode & langChar & Space(2) & _
                      Space(5) & tCode & "-" & Format(tmpStr, "!" & String(37, "@")) & langChar & Space(2) & _
                      recvGeneralCustStatusEnqMsg.details(i).branchUserId & langChar
        lines = lines + 1
        'Printer.Print "Branch supervisor id     Approved Date&Time      Customer Open Date "
        textStream.WriteLine formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).branchActionDateTime, 1, 8)) & Space(1) & langChar & _
                             formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).branchActionDateTime, 9, 6)) & langChar & _
                             recvGeneralCustStatusEnqMsg.details(i).branchSupervisorId & langChar & Space(5) & _
                             formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).approvedDateTime, 1, 8)) & Space(1) & langChar & _
                             formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).approvedDateTime, 9, 6)) & Space(5) & langChar & _
                             formatDate(recvGeneralCustStatusEnqMsg.details(i).custOpenDate) & langChar
        Printer.Print formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).branchActionDateTime, 1, 8)) & Space(1) & langChar & _
                      formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).branchActionDateTime, 9, 6)) & langChar & Space(5) & _
                      recvGeneralCustStatusEnqMsg.details(i).branchSupervisorId & langChar & Space(5) & _
                      formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).approvedDateTime, 1, 8)) & Space(1) & langChar & _
                      formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).approvedDateTime, 9, 6)) & Space(5) & langChar & _
                      formatDate(recvGeneralCustStatusEnqMsg.details(i).custOpenDate) & langChar
        Printer.Print
        lines = lines + 1
        lines = lines + 1
        If lines > 37 Then
           Printer.NewPage
           page = page & "a"
           custStatusHeaderPrint
        End If
    Next

    textStream.WriteLine
    Printer.Print vbCrLf
    textStream.WriteLine (String(110, "-"))
    Printer.Print String(110, "-")
'    textStream.WriteLine "Total number of new customers :" & str(recsTotal)
'    Printer.Print langChar & "„Ã„Ê⁄ «·⁄„·«¡ «·Ãœœ  :" & langChar & str(recsTotal)
'    textStream.WriteLine (String(50, "-") & "END OF REPORT" & String(50, "-"))
'    Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    'Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
        
    textStream.Close
    tmpStr = errWannaPrint(UserLang)
    response = MsgBox(tmpStr, vbYesNo)
    If response = vbYes Then
       Printer.EndDoc
    Else
       Printer.KillDoc
    End If
    
End Sub


Public Sub custStatusHeaderPrint()
   Dim branchName As String
   Dim tmpInt As Integer
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
   Dim fromDate As String
   Dim toDate As String
   
   fromDate = CStr(txtStartYear) & _
              CStr(cmbStartMonth.text) & _
              CStr(cmbStartDate.text)
   
   toDate = CStr(txtEndYear) & _
            CStr(cmbEndMonth.text) & _
            CStr(cmbEndDate.text)

   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   
   textStream.WriteLine ("«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì                                                 «· «—ÌŒ   : " & Format(Date$, "dd/mm/yyyy") & "      Time  : " & Format(Time, "hh:mm:ss"))
   
   Printer.Print "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì        (CSD03)          ”Ã·«  «·⁄„·«¡ «·„› ÊÕ… »Ê«”ÿ… «·Â« ›               «· «—ÌŒ  : " & Format(tDay, "00") & "/" & _
                                                                                                                    Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   textStream.WriteLine ("                          Customers opened through phone from  " & formatDate(fromDate) & langChar & "   to " & formatDate(toDate) & langChar)
   Printer.Print Space(35) & "       „‰  «—ÌŒ   " & formatDate(fromDate) & langChar & "  ≈·Ï  " & formatDate(toDate) & _
                 "              «·Êﬁ  : " & Format(Time, "hh:mm:ss")
   Printer.Print Space(93) & "‘«‘…  : " + CStr(page) & langChar
'   textStream.WriteLine ("Branch : " + gBranchCode + "     " + branchName + langChar + _
'                         "                                                                Page  : " + CStr(page) + langChar)
'   Printer.Print "›—⁄ :" + gBranchCode + langChar + "     " + branchName + langChar _
'                            ; "                                                                 ’›ÕÂ  : " + CStr(page) + langChar
   'Printer.Print "Branch :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                 Page : " & CStr(page) & langChar
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
'   textStream.WriteLine ("—ﬁ„ «·⁄„Ì·  " & "«”„ «·⁄„Ì·           " & "—ﬁ„ ›—⁄ «·⁄„Ì· " & _
'                            "√‰‘∆ „‰ Œ·«· «·› Õ «·”—Ì⁄")
'   Printer.Print ("—ﬁ„ «·⁄„Ì·  " & "   «”„ «·⁄„Ì·           " & "      —ﬁ„ ›—⁄ «·⁄„Ì· " & _
'                            "     √‰‘∆ „‰ Œ·«· «·› Õ «·”—Ì⁄")
   textStream.WriteLine "Branch code   User Id     Date & Time       Customer Number    Cust.Branch Code     Pending Status    Branch UserId     Branch Action Date&Time   "
   Printer.Print "—„“ «·›—⁄   ÂÊÌ… «·„” Œœ„  «· «—ÌŒ Ê«·Êﬁ        —ﬁ„ «·⁄„Ì·    —ﬁ„ ›—⁄ «·⁄„Ì·     «·Õ«·…    „ÊŸ› «·›—⁄        "
   textStream.WriteLine "Branch supervisor id     Approved Date&Time      Customer Open Date "
   Printer.Print " «—ÌŒ ÊÊﬁ  «Ã—«¡ «·›—⁄    „‘—› «·›—⁄      «—ÌŒ ÊÊﬁ  «·„Ê«›ﬁ…       «—ÌŒ «·«‰‘«¡ "
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   lines = 7
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As Integer, tWidth As Integer, colwidth(15) As Integer
    Dim rowTitle(15) As String
    Dim tmpStr As String, tCode As String
    Dim num As String
    Dim i As Integer
    
    If UserLang = ARABIC Then
       ChangePositions frmGeneralCustStatus, 11800
       frmGeneralCustStatus.RightToLeft = True
    End If
    
    frmGeneralCustStatus.Caption = frmGeneralCustStatusCaption(0, UserLang)
    lblGeneralCustOpenStatusEnq.Caption = frmGeneralCustStatusCaption(0, UserLang)
    lblStartDate.Caption = frmGeneralCustStatusCaption(1, UserLang)
    lblEndDate.Caption = frmGeneralCustStatusCaption(2, UserLang)
    lblRecordStatus.Caption = frmGeneralCustStatusCaption(3, UserLang)
    optAll.Caption = frmGeneralCustStatusCaption(4, UserLang)
    optCompleted.Caption = frmGeneralCustStatusCaption(5, UserLang)
    optRejected.Caption = frmGeneralCustStatusCaption(6, UserLang)
    optPendingWithBranch.Caption = frmGeneralCustStatusCaption(7, UserLang)
    optPendingWithCustomer.Caption = frmGeneralCustStatusCaption(8, UserLang)
    cmdGo.Caption = frmGeneralCustStatusCaption(9, UserLang)
    cmdMore.Caption = frmGeneralCustStatusCaption(10, UserLang)
    cmdCustInfo.Caption = frmGeneralCustStatusCaption(11, UserLang)
    cmdExit.Caption = frmGeneralCustStatusCaption(12, UserLang)
    cmdPrint.Caption = frmGeneralCustStatusCaption(13, UserLang)
    
'    rowTitle(0) = "Branch Code"
'    rowTitle(1) = "User Id"
'    rowTitle(2) = "Date & Time"
'    rowTitle(3) = "Customer Number"
'    rowTitle(4) = "Customer Branch Code"
'    rowTitle(5) = "Pending Status"
'    rowTitle(6) = "Branch User Id"
'    rowTitle(7) = "Branch action Date & Time"
'    rowTitle(8) = "Branch supervisor Id"
'    rowTitle(9) = "Approved Date & Time"
'    rowTitle(10) = "Customer Open Date"

    cmbStartDate.Clear
    cmbStartMonth.Clear
    cmbEndDate.Clear
    cmbEndMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" & CStr(i)
       Else
          num = CStr(i)
       End If
       cmbStartDate.AddItem num
       cmbEndDate.AddItem num
       If i < 13 Then
          cmbStartMonth.AddItem num
          cmbEndMonth.AddItem num
       End If
    Next
    
    fillGeneralCustGridHeading
    
    If enableGeneralCustOpen = True Then
       cmdPrint.Enabled = True
       cmdPrint.Visible = True
       cmdPrint.Refresh
    Else
       cmdPrint.Enabled = False
       cmdPrint.Visible = False
    End If
'
'    generalCustStatusGrid.Clear
'    generalCustStatusGrid.Row = 0
'    generalCustStatusGrid.Font.Bold = True
'
'    tWidth = 0
'    For i = 0 To 10
'      generalCustStatusGrid.Col = i
'      If UserLang = ARABIC Then
'         generalCustStatusGrid.CellAlignment = flexAlignRightCenter
'      Else
'         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
'      End If
'      'generalCustStatusGrid.text = frmTransferEnquiryCaption(i + 15, UserLang)
'      generalCustStatusGrid.text = rowTitle(i)
'      generalCustStatusGrid.colwidth(i) = colwidth(i)
'      tWidth = tWidth + colwidth(i)
'    Next i
      
End Sub

Public Sub formatGeneralCustStatusEnquiry(lastTransPointer As String)
    Dim tmpRecordStatus As String
    generalCustStatusEnqMsg.msgLen = "000000"
    generalCustStatusEnqMsg.service = "30"
    generalCustStatusEnqMsg.homeBranch = Format(gBranchCode, "!@@@@")
    generalCustStatusEnqMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    generalCustStatusEnqMsg.fromDate = txtStartYear & cmbStartMonth & cmbStartDate
    generalCustStatusEnqMsg.toDate = txtEndYear & cmbEndMonth & cmbEndDate
    If optAll Then
       tmpRecordStatus = "A"
    ElseIf optCompleted Then
       tmpRecordStatus = "9"
    ElseIf optPendingWithBranch Then
       tmpRecordStatus = "B"
    ElseIf optPendingWithCustomer Then
       tmpRecordStatus = "4"
    ElseIf optRejected Then
       tmpRecordStatus = "R"
    Else
       tmpRecordStatus = "0" ' Invalid Status
    End If
    
    generalCustStatusEnqMsg.recordStatus = tmpRecordStatus
    generalCustStatusEnqMsg.lastRecCount = lastTransPointer
End Sub
Private Sub fillGeneralCustGridHeading()
    Dim tWidth As Integer, colwidth(15) As Integer
    Dim rowTitle(15) As String
    Dim tmpStr As String, tCode As String
    Dim i As Integer
    
    colwidth(0) = 1000
    colwidth(1) = 1000
    colwidth(2) = 1900
    colwidth(3) = 900
    colwidth(4) = 1000
    colwidth(5) = 1900
    colwidth(6) = 1000
    colwidth(7) = 1900
    colwidth(8) = 1000
    colwidth(9) = 1700
    colwidth(10) = 1200

'    rowTitle(0) = "Branch Code"
'    rowTitle(1) = "User Id"
'    rowTitle(2) = "Date & Time"
'    rowTitle(3) = "Customer Number"
'    rowTitle(4) = "Customer Branch Code"
'    rowTitle(5) = "Pending Status"
'    rowTitle(6) = "Branch User Id"
'    rowTitle(7) = "Branch action Date & Time"
'    rowTitle(8) = "Branch supervisor Id"
'    rowTitle(9) = "Approved Date & Time"
'    rowTitle(10) = "Customer Open Date"
        
    generalCustStatusGrid.Clear
    generalCustStatusGrid.Row = 0
    generalCustStatusGrid.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 10
      generalCustStatusGrid.Col = i
      If UserLang = ARABIC Then
         generalCustStatusGrid.CellAlignment = flexAlignRightCenter
      Else
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
      End If
      generalCustStatusGrid.text = frmGeneralCustStatusCaption(i + 14, UserLang)
      'generalCustStatusGrid.text = rowTitle(i)
      generalCustStatusGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
End Sub

Private Sub fillGeneralCustStatusGrid()
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
   
   fillGeneralCustGridHeading
   For i = 1 To Val(recvGeneralCustStatusEnqMsg.noOfRecs)
         generalCustStatusGrid.Row = i
         generalCustStatusGrid.Col = 0
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         generalCustStatusGrid.text = recvGeneralCustStatusEnqMsg.details(i).branchCode
         generalCustStatusGrid.Col = 1
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         generalCustStatusGrid.text = recvGeneralCustStatusEnqMsg.details(i).userId
         generalCustStatusGrid.Col = 2
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         If Len(RTrim(recvGeneralCustStatusEnqMsg.details(i).dateTime)) <> 0 Then
            tmpStr = formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).dateTime, 1, 8)) & _
                     "  " & formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).dateTime, 9, 6))
         Else
            tmpStr = Space(14)
         End If
         generalCustStatusGrid.text = tmpStr
         generalCustStatusGrid.Col = 3
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         generalCustStatusGrid.text = recvGeneralCustStatusEnqMsg.details(i).custNo
         generalCustStatusGrid.Col = 4
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         generalCustStatusGrid.text = recvGeneralCustStatusEnqMsg.details(i).custBranchCode
         generalCustStatusGrid.Col = 5
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         tCode = recvGeneralCustStatusEnqMsg.details(i).pendingStatus
         If tCode = "1" Then
            tmpStr = errPendingWithSupervisor(UserLang) '"Pending with branch supervisor"
         ElseIf tCode = "2" Then
            tmpStr = errPendingWithCso(UserLang) '"Pending with branch CSO"
         ElseIf tCode = "3" Then
            tmpStr = errRejected(UserLang) '"Rejected by the branch supervisor"
         ElseIf tCode = "4" Then
            tmpStr = errCustomerNotYetVisted(UserLang) '"Customer not yet visited the branch"
         ElseIf tCode = "5" Then
            tmpStr = errRejectedByBranchCso(UserLang)   '" Rejected by Branch CSO"
         ElseIf tCode = "9" Then
            tmpStr = errCompleted(UserLang) '"Completed"
         Else
            tmpStr = errUnknown(UserLang)  '"Unknown"
         End If
         generalCustStatusGrid.text = tCode & "-" & tmpStr
         generalCustStatusGrid.Col = 6
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         generalCustStatusGrid.text = recvGeneralCustStatusEnqMsg.details(i).branchUserId
         generalCustStatusGrid.Col = 7
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         If Len(RTrim(recvGeneralCustStatusEnqMsg.details(i).branchActionDateTime)) <> 0 Then
            tmpStr = formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).branchActionDateTime, 1, 8)) & _
                     "  " & formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).branchActionDateTime, 9, 6))
         Else
            tmpStr = Space(14)
         End If
         generalCustStatusGrid.text = tmpStr
         generalCustStatusGrid.Col = 8
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         generalCustStatusGrid.text = recvGeneralCustStatusEnqMsg.details(i).branchSupervisorId
         generalCustStatusGrid.Col = 9
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         If Len(RTrim(recvGeneralCustStatusEnqMsg.details(i).approvedDateTime)) <> 0 Then
            tmpStr = formatDate(Mid$(recvGeneralCustStatusEnqMsg.details(i).approvedDateTime, 1, 8)) & _
                     "  " & formatTime(Mid$(recvGeneralCustStatusEnqMsg.details(i).approvedDateTime, 9, 6))
         Else
            tmpStr = Space(14)
         End If
         generalCustStatusGrid.text = tmpStr
         generalCustStatusGrid.Col = 10
         generalCustStatusGrid.CellAlignment = flexAlignLeftCenter
         If Len(RTrim(recvGeneralCustStatusEnqMsg.details(i).custOpenDate)) <> 0 Then
            tmpStr = formatDate(recvGeneralCustStatusEnqMsg.details(i).custOpenDate)
         Else
            tmpStr = Space(8)
         End If
         generalCustStatusGrid.text = tmpStr
   Next i
   generalCustStatusGrid.Row = 1
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub generalCustStatusGrid_DblClick()
   cmdCustInfo_Click
End Sub

Private Sub generalCustStatusGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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

Public Sub parseGeneralCustStatusEnq()
    Dim pos As Integer, i As Integer
    pos = 1
    recvGeneralCustStatusEnqMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvGeneralCustStatusEnqMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvGeneralCustStatusEnqMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvGeneralCustStatusEnqMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
'    recvGeneralCustStatusEnqMsg.totNoOfTrans = Mid$(RecvStr, pos, 5)
'    pos = pos + 5
    recvGeneralCustStatusEnqMsg.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvGeneralCustStatusEnqMsg.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvGeneralCustStatusEnqMsg.completionFlag = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    pos = pos + 20 ' for the filler
    For i = 1 To Val(recvGeneralCustStatusEnqMsg.noOfRecs)
        recvGeneralCustStatusEnqMsg.details(i).branchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvGeneralCustStatusEnqMsg.details(i).userId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvGeneralCustStatusEnqMsg.details(i).dateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvGeneralCustStatusEnqMsg.details(i).custNo = Mid$(RecvStr, pos, 7)
        pos = pos + 7
        recvGeneralCustStatusEnqMsg.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvGeneralCustStatusEnqMsg.details(i).pendingStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvGeneralCustStatusEnqMsg.details(i).branchUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvGeneralCustStatusEnqMsg.details(i).branchActionDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvGeneralCustStatusEnqMsg.details(i).branchSupervisorId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvGeneralCustStatusEnqMsg.details(i).approvedDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvGeneralCustStatusEnqMsg.details(i).custOpenDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        pos = pos + 20  ' for the filler
    Next i
End Sub
Private Function doGeneralCustStatusEnq() As Integer
  Dim strmsglen As String

  SendMsg = generalCustStatusEnqMsg.msgLen & generalCustStatusEnqMsg.service & generalCustStatusEnqMsg.homeBranch & _
            generalCustStatusEnqMsg.userId & generalCustStatusEnqMsg.fromDate & generalCustStatusEnqMsg.toDate & _
            generalCustStatusEnqMsg.recordStatus & generalCustStatusEnqMsg.lastRecCount & Space(20)
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   TimeOutFlag = False
   MsgWouldBlock = False
   cmdGo.Enabled = False
   cmdMore.Enabled = False
   cmdPrint.Enabled = False
   cmdCustInfo.Enabled = False
   cmdExit.Enabled = False
   frmGeneralCustStatus.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmGeneralCustStatus.MousePointer = vbNormal
      doGeneralCustStatusEnq = 1
      Exit Function
   End If
   
   parseGeneralCustStatusEnq
   
   If recvGeneralCustStatusEnqMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvGeneralCustStatusEnqMsg.aRemarks
      Else
         MsgBox recvGeneralCustStatusEnqMsg.eRemarks
      End If
      cmdGo.Enabled = True
      cmdExit.Enabled = True
      frmGeneralCustStatus.MousePointer = vbNormal
      doGeneralCustStatusEnq = 1
      Exit Function
   End If
   cmdGo.Enabled = True
   cmdExit.Enabled = True
   cmdMore.Enabled = True
   cmdPrint.Enabled = True
   cmdCustInfo.Enabled = True
   
   doGeneralCustStatusEnq = 0
   frmGeneralCustStatus.MousePointer = vbNormal
   
End Function

