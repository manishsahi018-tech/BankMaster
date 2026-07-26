VERSION 5.00
Begin VB.Form frmHistStmt 
   BackColor       =   &H00BFD87E&
   Caption         =   "Historical Statement Input Form"
   ClientHeight    =   3225
   ClientLeft      =   2370
   ClientTop       =   1875
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
   ScaleHeight     =   15630
   ScaleWidth      =   28560
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdCsv 
      Caption         =   "Csv"
      Enabled         =   0   'False
      Height          =   495
      Left            =   7110
      TabIndex        =   27
      ToolTipText     =   "Send statement to branch"
      Top             =   7095
      Visible         =   0   'False
      Width           =   2040
   End
   Begin VB.CommandButton cmdFtp 
      Caption         =   "FTP"
      Enabled         =   0   'False
      Height          =   495
      Left            =   2760
      TabIndex        =   26
      ToolTipText     =   "Send statement to branch"
      Top             =   7080
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.CommandButton cmdAnalysisHoStmt 
      Caption         =   "Analysis HO stmt"
      Height          =   495
      Left            =   9120
      TabIndex        =   25
      ToolTipText     =   "Analysis HO statement"
      Top             =   6120
      Width           =   2055
   End
   Begin VB.CommandButton cmdViewHOAnalysis 
      Caption         =   "View HO Analysis"
      Enabled         =   0   'False
      Height          =   495
      Left            =   9120
      TabIndex        =   24
      ToolTipText     =   "View HO Analysis"
      Top             =   6600
      Width           =   2055
   End
   Begin VB.CommandButton cmdPrintHoStmt 
      Caption         =   "Print HO stmt"
      Height          =   495
      Left            =   7080
      TabIndex        =   23
      ToolTipText     =   "Print HO Statement"
      Top             =   6600
      Width           =   2055
   End
   Begin VB.CommandButton cmdPrintAnalysis 
      Caption         =   "Print Analysis"
      Height          =   495
      Left            =   4920
      TabIndex        =   22
      ToolTipText     =   "Print analysis"
      Top             =   6600
      Width           =   2175
   End
   Begin VB.CommandButton cmdPrintStmt 
      Caption         =   "Print Statement"
      Height          =   495
      Left            =   4920
      TabIndex        =   21
      ToolTipText     =   "Print statement"
      Top             =   6120
      Width           =   2175
   End
   Begin VB.CommandButton cmdViewHoStmt 
      Caption         =   "View HO stmt"
      Height          =   495
      Left            =   7080
      TabIndex        =   20
      ToolTipText     =   "View HO  stmt"
      Top             =   6120
      Width           =   2055
   End
   Begin VB.TextBox txtAccNo 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   5280
      MaxLength       =   14
      TabIndex        =   1
      Top             =   3000
      Width           =   1455
   End
   Begin VB.ComboBox cmbFromMonth 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   5880
      TabIndex        =   5
      Top             =   4560
      Width           =   615
   End
   Begin VB.TextBox txtFromYear 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   5280
      MaxLength       =   4
      TabIndex        =   4
      Top             =   4560
      Width           =   615
   End
   Begin VB.ComboBox cmbToMonth 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   5880
      TabIndex        =   7
      Top             =   5040
      Width           =   615
   End
   Begin VB.TextBox txtToYear 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   5280
      MaxLength       =   4
      TabIndex        =   6
      Top             =   5040
      Width           =   615
   End
   Begin VB.TextBox txtCurrDesc 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   5280
      TabIndex        =   2
      Top             =   3480
      Width           =   2775
   End
   Begin VB.TextBox txtAcctDesc 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5280
      TabIndex        =   3
      Top             =   3960
      Width           =   2775
   End
   Begin VB.TextBox txtBranchCode 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   5280
      MaxLength       =   4
      TabIndex        =   0
      Top             =   2520
      Width           =   735
   End
   Begin VB.CommandButton cmdViewAnalysis 
      Caption         =   "View Analysis"
      Height          =   495
      Left            =   2760
      TabIndex        =   10
      ToolTipText     =   "View analysis"
      Top             =   6600
      Width           =   2175
   End
   Begin VB.CommandButton cmdViewStmt 
      Caption         =   "View Statement"
      Height          =   495
      Left            =   2760
      TabIndex        =   11
      ToolTipText     =   "View statement"
      Top             =   6120
      Width           =   2175
   End
   Begin VB.CommandButton cmdAnalyse 
      Caption         =   "Analysis"
      Height          =   495
      Left            =   720
      TabIndex        =   9
      ToolTipText     =   "Analysis"
      Top             =   6600
      Width           =   2055
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   4920
      TabIndex        =   12
      ToolTipText     =   "Exit"
      Top             =   7080
      Width           =   2175
   End
   Begin VB.CommandButton cmdGenerate 
      Caption         =   "Generate Stmt"
      Default         =   -1  'True
      Height          =   495
      Left            =   705
      TabIndex        =   8
      ToolTipText     =   "Generate  statement"
      Top             =   6105
      Width           =   2055
   End
   Begin VB.Image anbLogo1 
      Height          =   885
      Left            =   8970
      Picture         =   "frmHistStmt.frx":0000
      Top             =   480
      Visible         =   0   'False
      Width           =   1905
   End
   Begin VB.Image anbLogo 
      Height          =   1335
      Left            =   30
      Picture         =   "frmHistStmt.frx":58C2
      Top             =   30
      Width           =   2775
   End
   Begin VB.Label lblAccNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Number"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   2880
      TabIndex        =   19
      Top             =   3000
      Width           =   2295
   End
   Begin VB.Label lblCurrency 
      BackColor       =   &H00BFD87E&
      Caption         =   "Currency"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
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
      Top             =   3480
      Width           =   1935
   End
   Begin VB.Label lblAccountType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Type"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   2880
      TabIndex        =   17
      Top             =   3960
      Width           =   2175
   End
   Begin VB.Label lblFromDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "From Date"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   2880
      TabIndex        =   16
      Top             =   4560
      Width           =   2295
   End
   Begin VB.Label lblToDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "To Date"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   2880
      TabIndex        =   15
      Top             =   5040
      Width           =   2295
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   2880
      TabIndex        =   14
      Top             =   2520
      Width           =   2175
   End
   Begin VB.Shape Shape1 
      Height          =   3735
      Left            =   2400
      Top             =   2160
      Width           =   6615
   End
   Begin VB.Label lblHistStmt 
      BackColor       =   &H00BFD87E&
      Caption         =   "Historical Statement Printing"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   3000
      TabIndex        =   13
      Top             =   1410
      Width           =   5415
   End
End
Attribute VB_Name = "frmHistStmt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public accName, ccyName As String
Public fromYearMonth, toYear As String
Public requiredAccNo As String
Public langChar As String
Public DATA_LEN As String
Public fso As FileSystemObject
Public CreaFile, outFile, mergedFile, inFile, actualMergeFile
Public passwd As String
Public sequence As Integer
Public stmtLang As String

Private Sub cmbFromMonth_Change()
   disableButtons
   If Len(RTrim(cmbFromMonth.text)) <> 0 Then
      If Len(cmbFromMonth.text) = 2 Then
         If cmbFromMonth < 1 Or cmbFromMonth > 12 Then
'           MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            MsgBox "Enter a valid Date"
            cmbFromMonth.text = ""
            cmbFromMonth.SetFocus
          Else
            On Error Resume Next
            txtToYear.SetFocus
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

Private Sub cmbToMonth_Change()
   disableButtons
   If Len(RTrim(cmbToMonth.text)) <> 0 Then
      If Len(cmbToMonth.text) = 2 Then
         If cmbToMonth < 1 Or cmbToMonth > 12 Then
'           MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            MsgBox "Enter a valid Date"
            cmbToMonth.text = ""
            cmbToMonth.SetFocus
          Else
            On Error Resume Next
            cmdPrintStmt.SetFocus
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

Private Sub cmdAnalyse_Click()
    Dim fso As FileSystemObject
    Dim retVar As Variant
    Dim tmpStr As String
    Set fso = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(utilPath & "analyse.exe") = False Then
       MsgBox errNoAnalysisPgm(UserLang)   '"Analysis program is not available in target directory..Please call support.."
       Exit Sub
    End If
    'frmHistStmt.Enabled = False
    frmHistStmt.MousePointer = vbHourglass
    
    CSD_mdiForm.staticStatus.Panels(3).text = errWaitAnalysis(UserLang)
    retVar = Shell(utilPath & "analyse " & outPath & "prtall.$s! " & outPath & "prtall.$a!")
    delay (10)
    cmdPrintAnalysis.Enabled = True
    cmdViewAnalysis.Enabled = True
     
    frmHistStmt.Enabled = True
    frmHistStmt.MousePointer = vbNormal
'    If UserLang = ARABIC Then
'       tmpstr = "«‰ ÂÏ «· Õ·Ì· »‰Ã«Õ.."
'    Else
'       tmpstr = "Analysis successfully completed.."
'    End If
    CSD_mdiForm.staticStatus.Panels(3).text = errAnalysisSuccess(UserLang)
    MsgBox errAnalysisSuccess(UserLang)
    
End Sub

Private Sub cmdAnalysisHoStmt_Click()
    Dim retVar As Variant
    Dim tmpStr As String
    Set fso = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(utilPath & "analyse.exe") = False Then
       MsgBox errNoAnalysisPgm(UserLang)   '"Analysis program is not available in target directory..Please call support.."
       Exit Sub
    End If
    If fso.FileExists(reqPath & "prtall.$s!") = False Then
       MsgBox errNoHoStmtFile(UserLang) '"Statement file (prtall.$s!) not available in " & reqPath & " directory..Please call HO .."
       Exit Sub
    End If
    'frmHistStmt.Enabled = False
    frmHistStmt.MousePointer = vbHourglass
    
    CSD_mdiForm.staticStatus.Panels(3).text = errWaitAnalysis(UserLang)
    retVar = Shell(utilPath & "analyse " & reqPath & "prtall.$s! " & outPath & "prtall.$h!")
    delay (10)
    cmdViewHOAnalysis.Enabled = True
     
    frmHistStmt.Enabled = True
    frmHistStmt.MousePointer = vbNormal
    
'    If UserLang = ARABIC Then
'       tmpstr = "«‰ ÂÏ «· Õ·Ì· »‰Ã«Õ.."
'    Else
'       tmpstr = "Analysis successfully completed.."
'    End If
    CSD_mdiForm.staticStatus.Panels(3).text = errAnalysisSuccess(UserLang)
    MsgBox errAnalysisSuccess(UserLang)

End Sub

Private Sub cmdCsv_Click()
   Dim hoInFile, hoOutFile
   Dim csvFile
   Dim tLine As String
   Dim windowStr As String
   Dim firstLine As Boolean
   Dim continuedStmt As Boolean
   Dim dontPrint As Boolean
   
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set hoOutFile = fso.OpenTextFile(outPath & "prtall.$s!", ForReading)
   Set csvFile = fso.CreateTextFile(outPath & Trim(txtAccNo) & ".csv", ForWriting)
   tLine = hoOutFile.ReadLine  ' just to ignore printing of first line
   If Asc(Mid$(tLine, 1, 1)) = 12 Or Asc(Mid$(tLine, 1, 1)) = 27 Then
      If Mid$(tLine, 47, 1) = "0" Then
         stmtLang = "a"
         langChar = Chr$(254)
      ElseIf Mid$(tLine, 47, 1) = "3" Then
         stmtLang = "e"
         langChar = Chr$(253)
      Else
         stmtLang = "a"
         langChar = Chr$(254)
      End If
   End If
   
    lines = 0
    firstLine = True
    continuedStmt = False
    dontPrint = False
lp1: While hoOutFile.AtEndOfStream = False
          tLine = hoOutFile.ReadLine
          If Len(Trim(tLine)) > 0 And firstLine = False Then
             If Asc(Mid$(tLine, 1, 1)) = 12 Or Asc(Mid$(tLine, 1, 1)) = 27 Then
'                If Mid$(tLine, 47, 1) = "0" Then
'                   stmtLang = "a"
'                   langChar = Chr$(254)
'                ElseIf Mid$(tLine, 47, 1) = "3" Then
'                   stmtLang = "e"
'                   langChar = Chr$(253)
'                Else
'                   stmtLang = "a"
'                   langChar = Chr$(254)
'                End If

                Printer.NewPage
                'Printer.PaintPicture anbLogo, 2500, 150
                Printer.PaintPicture anbLogo1, 50, 200
                For i = 1 To 4
                    Printer.Print vbCrLf
                Next
                lines = 0
                continuedStmt = False
                GoTo lp1
            End If
         End If
         windowStr = asmoToWindow(tLine)
         If stmtLang = "a" Then
            If Len(RTrim(windowStr)) <> 0 Then
               If Asc(Mid$(windowStr, 1, 1)) >= 65 And Asc(Mid$(windowStr, 1, 1)) <= 90 Then
                  Mid$(windowStr, 4, 1) = Chr(254) & Chr(254)
                  Mid$(windowStr, 42, 1) = Chr(254) & Chr(254)
               End If
            End If
         End If
         tLine = windowStr & langChar
        
'         If InStr(tLine, "Ì »‹‹‹‹‹‹‹‹‹‹⁄") > 0 Or _
'            InStr(tLine, "Continued on next page") > 0 Then
'            continuedStmt = True
'         End If
         'Printer.Print tLine
         'lines = lines + 1
         If stmtLang = "e" Then
            If Len(Trim(tLine)) > 4 Then
               If Mid$(tLine, 1, 4) = "‹‹‹‹" Then
                  Mid$(tLine, 1, 5) = Space(5)
               End If
            End If
         Else
            If Len(Trim(tLine)) > 5 Then
               If Mid$(tLine, Len(tLine) - 5, 5) = "_____" Then
                  Mid$(tLine, Len(tLine) - 5, 5) = Space(5)
               End If
            End If
         End If
         lines = lines + 1
         If firstLine Then
            firstLine = False
         End If
'         If continuedStmt = True Then
'            If lines > 62 Then
'               Printer.NewPage
'               Printer.PaintPicture anbLogo, 2500, 150
'               For i = 1 To 4
'                   Printer.Print vbCrLf
'               Next
'               lines = 0
'               continuedStmt = False
'            End If
'         End If
   Wend
   hoOutFile.Close

End Sub

Private Sub cmdExit_Click()
   Unload Me
End Sub

Private Sub cmdFtp_Click()
    frmSendFile.txtBranchCode = Mid$(txtBranchCode, 2, 3)
    frmSendFile.Show vbModal
End Sub

Private Sub cmdGenerate_Click()
   Dim strmsglen As String * 6
   Dim accNo As String
   Dim mQry As String
   Dim tCode As String
   Dim tmpStr As String
   
   CSD_mdiForm.staticStatus.Panels(3).text = " "
   
   If Len(RTrim(txtBranchCode)) < 4 Then
      MsgBox errBranchCodeNot4Chars(UserLang)  '  "Branch Code should be 4 characters..Please enter it again"
      txtBranchCode.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(txtAccNo)) = 0 Then
      MsgBox errSpaceAccountNo(UserLang)  '"Account number cannot be spaces...Please enter it..."
      txtAccNo.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(txtFromYear)) = 0 Then
      MsgBox errInvalidFromYear(UserLang)  ' "From year cannot be blank...please enter it .."
      txtFromYear.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(cmbFromMonth)) = 0 Then
      MsgBox errInvalidFromMonth(UserLang)   '"From month cannot be blank..please enter it..."
      cmbFromMonth.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(txtToYear)) = 0 Then
      MsgBox errInvalidToYear(UserLang)  '"To Date cannot be blank...please enter it .."
      txtToYear.SetFocus
      Exit Sub
   End If
   
   If Len(RTrim(cmbToMonth)) = 0 Then
      MsgBox errInvalidToMonth(UserLang)  '"To month cannot be blank..please enter it..."
      cmbToMonth.SetFocus
      Exit Sub
   End If
   
   If frmHistStmt.tag = "D" Then ' if the user requested historical statements through deleted a/c route
      accNo = Format(txtAccNo, "!@@@@@@@@@@@@@@")
      SendMsg = "000090" & "21" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & "00000" & Space(7) & accNo & Space(19)
      strmsglen = Format(Len(SendMsg), "000000")
      Mid$(SendMsg, 1, 6) = strmsglen
      DataReceivedFlag = False
      
      If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
         LoadError = True
         frmHistStmt.MousePointer = vbDefault
         Exit Sub
      End If
      parseAccSearchMsg
   
      If recvAccSearchMsg.status <> "000" Then
         If UserLang = ARABIC Then
            MsgBox recvAccSearchMsg.aRemarks
         Else
            MsgBox recvAccSearchMsg.eRemarks
         End If
         frmHistStmt.MousePointer = vbDefault
         Exit Sub
      End If
      frmHistStmt.MousePointer = vbDefault
      If recvAccSearchMsg.noOfRecs <> "00" Then
         MsgBox errHistStmtNotAllowed(UserLang)
         Exit Sub
      End If
       tCode = Mid$(txtAccNo, 1, 2)
       mQry = "select arabicname, englishname from currencyinfo where currencycode = '" & _
                                                    tCode & "'"
       Set rs = db.OpenRecordset(mQry)
       If rs.recordCount > 0 Then
          If UserLang = ARABIC Then
             txtCurrDesc = tCode & "-" & rs(0)
          Else
             txtCurrDesc = tCode & "-" & rs(1)
          End If
       End If
    
       tCode = Mid$(txtAccNo, 3, 3)
       mQry = "select arabicname, englishname from bmledgerinfo where ledgercode = '" & _
                                                    tCode & "'"
       Set rs = db.OpenRecordset(mQry)
       If rs.recordCount > 0 Then
          If UserLang = ARABIC Then
             txtAcctDesc = tCode & "-" & rs(0)
          Else
             txtAcctDesc = tCode & "-" & rs(1)
          End If
       End If
   End If
   If frmHistStmt.tag <> "D" Then ' check the staff check only for user requesting historical statements through deleted a/c route
      If txtBranchCode = "0175" And gBranchCode <> "0175" Then
         MsgBox errNotAuthorisedForStaffAcc(UserLang) ' "Not authorized to print the statement for the staff branch"
         Exit Sub
      End If
   End If
   fromYearMonth = convertYear2Bm(txtFromYear) & Format(cmbFromMonth, "00")
   requiredAccNo = convertAcc2Bm(txtAccNo)
   generateReport stmtPath, Right(txtBranchCode, 3)
End Sub

Private Sub cmdPrintAnalysis_Click()
    Dim hoInFile, hoOutFile
    Dim tLine As String
    
    If fso.FileExists(outPath & "prtall.$a!") = False Then
       MsgBox errNoAnalysisFile(UserLang)  '"Analysis file (prtall.$a!) not available in " & outPath & " directory..Please call HO .."
       Exit Sub
    End If
   
   Set hoOutFile = fso.OpenTextFile(outPath & "prtall.$a!", ForReading)
   Printer.FontName = "Courier New (Arabic)"
   Printer.FontSize = 10
   Printer.Orientation = vbPRORPortrait
   Printer.PaperSize = vbPRPSA4
   Printer.FontBold = False
   While hoOutFile.AtEndOfStream = False
         tLine = hoOutFile.ReadLine
         Printer.Print tLine
    Wend
    hoOutFile.Close
    Printer.EndDoc
End Sub

Private Sub cmdPrintStmt_Click()
   Dim hoInFile, hoOutFile
   Dim tLine As String
   Dim windowStr As String
   Dim firstLine As Boolean
   Dim continuedStmt As Boolean
   Dim dontPrint As Boolean
   
   Set hoOutFile = fso.OpenTextFile(outPath & "prtall.$s!", ForReading)
   tLine = hoOutFile.ReadLine  ' just to ignore printing of first line
   If Asc(Mid$(tLine, 1, 1)) = 12 Or Asc(Mid$(tLine, 1, 1)) = 27 Then
      If Mid$(tLine, 47, 1) = "0" Then
         stmtLang = "a"
         langChar = Chr$(254)
      ElseIf Mid$(tLine, 47, 1) = "3" Then
         stmtLang = "e"
         langChar = Chr$(253)
      Else
         stmtLang = "a"
         langChar = Chr$(254)
      End If
   End If
  
   Printer.FontName = "Courier New (Arabic)"
   Printer.FontSize = 10
   Printer.Orientation = vbPRORPortrait
   If stmtLang = "e" Then
      Printer.RightToLeft = False
      Printer.PaperSize = vbPRPSLetter
   Else
     Printer.RightToLeft = True
     Printer.PaperSize = vbPRPSA4
   End If
   'Printer.PaintPicture anbLogo, 2500, 150
   'Printer.PaintPicture anbLogo, 4500, 400
   Printer.PaintPicture anbLogo1, 50, 200
   For i = 1 To 4
       Printer.Print vbCrLf
   Next
   lines = 0
   firstLine = True
   continuedStmt = False
   dontPrint = False
   Printer.FontBold = False
lp1: While hoOutFile.AtEndOfStream = False
          tLine = hoOutFile.ReadLine
          If Len(Trim(tLine)) > 0 And firstLine = False Then
             If Asc(Mid$(tLine, 1, 1)) = 12 Or Asc(Mid$(tLine, 1, 1)) = 27 Then
'                If Mid$(tLine, 47, 1) = "0" Then
'                   stmtLang = "a"
'                   langChar = Chr$(254)
'                ElseIf Mid$(tLine, 47, 1) = "3" Then
'                   stmtLang = "e"
'                   langChar = Chr$(253)
'                Else
'                   stmtLang = "a"
'                   langChar = Chr$(254)
'                End If
                Printer.NewPage
                'Printer.PaintPicture anbLogo, 2500, 150
                Printer.PaintPicture anbLogo1, 50, 200
                For i = 1 To 4
                    Printer.Print vbCrLf
                Next
                lines = 0
                continuedStmt = False
                GoTo lp1
            End If
         End If
         windowStr = asmoToWindow(tLine)
         If stmtLang = "a" Then
            If Len(RTrim(windowStr)) <> 0 Then
               If Asc(Mid$(windowStr, 1, 1)) >= 65 And Asc(Mid$(windowStr, 1, 1)) <= 90 Then
                  Mid$(windowStr, 4, 1) = Chr(254) & Chr(254)
                  Mid$(windowStr, 42, 1) = Chr(254) & Chr(254)
               End If
            End If
         End If
         tLine = windowStr & langChar
        
'         If InStr(tLine, "Ì »‹‹‹‹‹‹‹‹‹‹⁄") > 0 Or _
'            InStr(tLine, "Continued on next page") > 0 Then
'            continuedStmt = True
'         End If
         'Printer.Print tLine
         'lines = lines + 1
         If stmtLang = "e" Then
            If Len(Trim(tLine)) > 4 Then
               If Mid$(tLine, 1, 4) = "‹‹‹‹" Then
                  Mid$(tLine, 1, 5) = Space(5)
               End If
            End If
         Else
            If Len(Trim(tLine)) > 5 Then
               If Mid$(tLine, Len(tLine) - 5, 5) = "_____" Then
                  Mid$(tLine, Len(tLine) - 5, 5) = Space(5)
               End If
            End If
         End If
         Printer.Print tLine
         lines = lines + 1
         If firstLine Then
            firstLine = False
         End If
'         If continuedStmt = True Then
'            If lines > 62 Then
'               Printer.NewPage
'               Printer.PaintPicture anbLogo, 2500, 150
'               For i = 1 To 4
'                   Printer.Print vbCrLf
'               Next
'               lines = 0
'               continuedStmt = False
'            End If
'         End If
   Wend
   hoOutFile.Close
   Printer.EndDoc
End Sub

Private Sub cmdPrintHoStmt_Click()
    Dim fso As FileSystemObject
    Dim hoInFile, hoOutFile
    Dim tLine As String
    Dim lines As Integer
    Dim windowStr As String
    Dim retVar As Variant
    Dim firstLine As Boolean
    Dim continuedStmt As Boolean
    Dim dontPrint As Boolean
    Set fso = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(reqPath & "prtall.$s!") = False Then
       MsgBox errNoHoStmtFile(UserLang) '"Statement file (prtall.$s!) not available in " & stmtPath & "req  " & " directory..Please call HO .."
       Exit Sub
    End If
    
    'frmHistStmt.Enabled = False
    frmHistStmt.MousePointer = vbHourglass
    On Error GoTo err_handler
    Set hoInFile = fso.OpenTextFile(reqPath & "prtall.$s!", ForReading)
   ' Set hoOutFile = fso.OpenTextFile(outPath & "prtall.$e!", ForWriting, True)
    tLine = hoInFile.ReadLine
    If Mid$(tLine, 47, 1) = "0" Then
       stmtLang = "a"
       langChar = Chr$(254)
    ElseIf Mid$(tLine, 47, 1) = "3" Then
       stmtLang = "e"
       langChar = Chr$(253)
    Else
       stmtLang = "a"
       langChar = Chr$(254)
    End If
    lines = 0
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 10
    Printer.Orientation = vbPRORPortrait
    If stmtLang = "a" Then
       Printer.RightToLeft = True
       Printer.PaperSize = vbPRPSA4
    Else
       Printer.RightToLeft = False
       Printer.PaperSize = vbPRPSLetter
    End If
    'Printer.PaintPicture anbLogo, 2500, 150
    'Printer.PaintPicture anbLogo, 4500, 400
    Printer.PaintPicture anbLogo1, 50, 200
    For i = 1 To 4
        Printer.Print vbCrLf
    Next
    firstLine = True
    continuedStmt = False
    dontPrint = False
    Printer.FontBold = False
    While hoInFile.AtEndOfStream = False
          dontPrint = False
          tLine = hoInFile.ReadLine
          If Len(RTrim(tLine)) > 0 And firstLine = False Then
             If Asc(Mid$(tLine, 1, 1)) = 12 Or Asc(Mid$(tLine, 1, 1)) = 27 Then
                Printer.NewPage
                'Printer.PaintPicture anbLogo, 2500, 150
                Printer.PaintPicture anbLogo1, 50, 200
                For i = 1 To 4
                    Printer.Print vbCrLf
                Next
                lines = 0
                dontPrint = True
                If Mid$(tLine, 47, 1) = "0" Then
                   stmtLang = "a"
                   langChar = Chr$(254)
                ElseIf Mid$(tLine, 47, 1) = "3" Then
                   stmtLang = "e"
                   langChar = Chr$(253)
                Else
                   stmtLang = "a"
                   langChar = Chr$(254)
                End If
            End If
          End If
          windowStr = asmoToWindow(tLine) & langChar
          If stmtLang = "e" Then
             If Len(Trim(windowStr)) > 4 Then
                If Mid$(windowStr, 1, 4) = "‹‹‹‹" Then
                   Mid$(windowStr, 1, 5) = Space(5)
                End If
             End If
          Else
             If Len(Trim(windowStr)) > 5 Then
                If Mid$(windowStr, Len(windowStr) - 5, 5) = "_____" Then
                   Mid$(windowStr, Len(windowStr) - 5, 5) = Space(5)
                End If
             End If
          End If
          If firstLine = False Then
             If stmtLang = "a" Then
                If Len(RTrim(windowStr)) <> 0 Then
                   If Asc(Mid$(windowStr, 1, 1)) >= 65 And Asc(Mid$(windowStr, 1, 1)) <= 90 Then
                      Mid$(windowStr, 4, 1) = Chr(254) & Chr(254)
                      Mid$(windowStr, 42, 1) = Chr(254) & Chr(254)
                   End If
                End If
             End If
          End If
          If dontPrint = False Then
             Printer.Print windowStr
          End If
          lines = lines + 1
          If firstLine Then
             firstLine = False
          End If
    Wend
    Printer.EndDoc
    hoInFile.Close
'    hoOutFile.Close
    
    frmHistStmt.Enabled = True
    frmHistStmt.MousePointer = vbNormal
    CSD_mdiForm.staticStatus.Panels(3).text = " "
    On Error GoTo 0
    Exit Sub
    
err_handler:

    MsgBox "Error  " & Err.Number & "   " & Err.Description & "  " & "occured .. please check "
    frmHistStmt.MousePointer = vbNormal
    Exit Sub
End Sub

Private Sub cmdPrint_Click()
   
End Sub

Private Sub cmdViewAnalysis_Click()
    Shell "notepad  " & outPath & "prtall.$a!", vbMaximizedFocus
    delay (5)
End Sub

Private Sub cmdViewHOAnalysis_Click()
    Shell "notepad  " & outPath & "prtall.$h!", vbMaximizedFocus
    delay (5)
End Sub

Private Sub cmdViewHoStmt_Click()
    Dim hoInFile, hoOutFile
    Dim tLine As String
    Dim windowStr As String
    Dim retVar As Variant
    Set fso = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(reqPath & "prtall.$s!") = False Then
       MsgBox errNoHoStmtFile(UserLang) '"Statement file (prtall.$s!) not available in " & reqPath & " directory..Please call HO .."
       Exit Sub
    End If
    
    'frmHistStmt.Enabled = False
    frmHistStmt.MousePointer = vbHourglass
    On Error GoTo err_handler
    Set hoInFile = fso.OpenTextFile(reqPath & "prtall.$s!", ForReading)
    Set hoOutFile = fso.OpenTextFile(outPath & "prtall.$e!", ForWriting, True)
    
    While hoInFile.AtEndOfStream = False
          tLine = hoInFile.ReadLine
          windowStr = asmoToWindow(tLine)
          hoOutFile.WriteLine (windowStr)
    Wend
    hoInFile.Close
    hoOutFile.Close
    
    frmHistStmt.Enabled = True
    frmHistStmt.MousePointer = vbNormal
    CSD_mdiForm.staticStatus.Panels(3).text = " "
    Shell utilPath & "wordpad  " & outPath & "prtall.$e!", vbMaximizedFocus
    On Error GoTo 0
    Exit Sub
    
err_handler:

    MsgBox "Error  " & Err.Number & "   " & Err.Description & "  " & "occured .. please check "
    frmHistStmt.MousePointer = vbNormal
    Exit Sub
   
End Sub

Private Sub cmdViewStmt_Click()
'    Dim fso As FileSystemObject
    Dim retVar As Variant
    Dim tmpStr As String
'    Set fso = CreateObject("Scripting.FileSystemObject")
'    If fso.FileExists(utilPath & "a2w.exe") = False Then
'       MsgBox errNoArabicPgm(UserLang) '    "Arabic Converion program(a2w.exe) is not available in target directory..Please call support.."
'       Exit Sub
'    End If
'    frmHistStmt.Enabled = False
'    frmHistStmt.MousePointer = vbHourglass
''    If UserLang = ARABIC Then
''       tmpstr = "«·—Ã«¡ «·«‰Ÿ«—..Ì „  Õ„Ì· «·«’œ«— «·⁄—»Ì"
''    Else
''       tmpstr = "Please wait...arabic conversion is in progress...."
''    End If
'    frmHistStmt.StatusBar1.SimpleText = errWaitConv(UserLang)
'    retVar = Shell(utilPath & "a2w " & outPath & "prtall.$s! " & outPath & "prtall.$e!")
'    delay (10)
    frmHistStmt.Enabled = True
    frmHistStmt.MousePointer = vbNormal
    CSD_mdiForm.staticStatus.Panels(3).text = " "
    Shell utilPath & "wordpad  " & outPath & "prtall.$e!", vbMaximizedFocus
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim num As String
   Dim mQry As String
   
   cmdGenerate.Visible = True
   
   'anbLogo.Picture = LoadPicture(App.Path & "\ANB Logo new.bmp")
      
   disableButtons
   
    On Error GoTo 0
        
    If UserLang = ARABIC Then
       ChangePositions frmHistStmt, 11800
       frmHistStmt.RightToLeft = True
    End If
    
    frmHistStmt.lblHistStmt.Caption = frmHistStmtCaption(0, UserLang)
    frmHistStmt.lblBranchCode.Caption = frmHistStmtCaption(1, UserLang)
    frmHistStmt.lblAccNo.Caption = frmHistStmtCaption(2, UserLang)
    frmHistStmt.lblCurrency.Caption = frmHistStmtCaption(3, UserLang)
    frmHistStmt.lblAccountType.Caption = frmHistStmtCaption(4, UserLang)
    frmHistStmt.lblFromDate.Caption = frmHistStmtCaption(5, UserLang)
    frmHistStmt.lblToDate.Caption = frmHistStmtCaption(6, UserLang)
    frmHistStmt.cmdPrintStmt.Caption = frmHistStmtCaption(9, UserLang)
    frmHistStmt.cmdGenerate.Caption = frmHistStmtCaption(10, UserLang)
    frmHistStmt.cmdAnalyse.Caption = frmHistStmtCaption(11, UserLang)
    frmHistStmt.cmdPrintAnalysis.Caption = frmHistStmtCaption(12, UserLang)
    frmHistStmt.cmdViewAnalysis.Caption = frmHistStmtCaption(13, UserLang)
    frmHistStmt.cmdViewStmt.Caption = frmHistStmtCaption(14, UserLang)
    frmHistStmt.cmdPrintHoStmt.Caption = frmHistStmtCaption(15, UserLang)
    frmHistStmt.cmdViewHoStmt.Caption = frmHistStmtCaption(16, UserLang)
    frmHistStmt.cmdAnalysisHoStmt.Caption = frmHistStmtCaption(17, UserLang)
    frmHistStmt.cmdViewHOAnalysis.Caption = frmHistStmtCaption(18, UserLang)
    frmHistStmt.cmdExit.Caption = frmHistStmtCaption(19, UserLang)
    frmHistStmt.cmdFtp.Caption = frmHistStmtCaption(20, UserLang)
       
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
   
'    txtToYear = CStr(Year(Date))
'    cmbToMonth = Format(CStr(Month(Date)), "00")

     txtToYear = "2009"
     cmbToMonth = "07"      ' since Finacle is implemented on Jul'2009, historical end date is defaulted to Jul.2009
    
    txtBranchCode = gBranchCode
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
End Sub

Private Sub txtAccNo_Change()
    disableButtons
End Sub

Private Sub txtBranchCode_Change()
    disableButtons
End Sub

Private Sub txtFromYear_Change()
   disableButtons
   If Len(RTrim(txtFromYear)) <> 0 Then
      If Len(txtFromYear) = 4 Then
         On Error Resume Next
         cmbFromMonth.SetFocus
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
   disableButtons
   If Len(RTrim(txtToYear)) <> 0 Then
      If Len(txtToYear) = 4 Then
         On Error Resume Next
         cmbToMonth.SetFocus
      End If
   End If
End Sub

Private Sub generateReport(dirname As String, brnum As String)
Dim fileName As String
Dim tmpFileName As String
Dim tmpStr As String
Dim foundFlag As Boolean
Dim reportFoundFlag As Boolean
Dim fromDate As Long, toDate As Long, fileSize As Long
Dim tmpVar As Long
Dim phid As Long
Dim shellVar As Variant
Dim tDate As String
Dim lineNo As String

On Error GoTo err_handler
lineNo = "1"
fromDate = CLng(txtFromYear & cmbFromMonth)
toDate = CLng(txtToYear & cmbToMonth)
lineNo = "2"
Set fso = CreateObject("Scripting.FileSystemObject")
lineNo = "3"
If fso.FolderExists(stmtPath) = False Then
   MsgBox "STMTPATH [" & stmtPath & "] " & errDriveNotMapped(UserLang)   '"STMTPATH [" & stmtPath & "] not found; may be the drive is not mapped; Please Check & re-try"
   Exit Sub
End If
If fso.FolderExists(outPath) = False Then
   fso.CreateFolder (outPath)
End If
lineNo = "4"

tmpFileName = outPath & "prtall.$s!"
If fso.FileExists(tmpFileName) = True Then
   fso.DeleteFile tmpFileName, True
End If

lineNo = "5"

tmpFileName = outPath & "prtall.$e!"
If fso.FileExists(tmpFileName) = True Then
   fso.DeleteFile tmpFileName, True
End If
lineNo = "6"
tmpFileName = outPath & "extract.bat"
If fso.FileExists(tmpFileName) = True Then
   fso.DeleteFile tmpFileName, True
End If
lineNo = "6a"
Set CreaFile = fso.OpenTextFile(outPath & "extract.bat", ForWriting, True)
'lineNo = "6b"
'Set mergedFile = fso.OpenTextFile(outPath & "prtall.$e!", ForAppending, True)
'lineNo = "7"
'Set actualMergeFile = fso.OpenTextFile(outPath & "prtall.$s!", ForAppending, True)
lineNo = "7"
reportFoundFlag = False
sequence = 1
'frmHistStmt.Enabled = False
frmHistStmt.MousePointer = vbHourglass
frmHistStmt.cmdGenerate.Enabled = False
frmHistStmt.cmdExit.Enabled = False
frmHistStmt.cmdViewHoStmt.Enabled = False
frmHistStmt.cmdPrintHoStmt.Enabled = False
frmHistStmt.cmdAnalysisHoStmt.Enabled = False
If fso.FolderExists("c:\staticLog") = False Then
   fso.CreateFolder ("c:\staticLog\")
End If
tmpFileName = "c:\staticLog\histstmt.log"

Set histLogFile = fso.OpenTextFile(tmpFileName, ForWriting, True)

histLogFile.WriteLine (CStr(Date) & "|" & CStr(Time) & ":" & "Historical Statement Requested for the account number [" & _
                      txtAccNo & "] from " & txtFromYear & "/" & Format(cmbFromMonth, "00") & _
                                 "   to " & txtToYear & "/" & Format(cmbToMonth, "00"))
lineNo = "9"
For i = fromDate To toDate
    histLogFile.WriteLine
    lineNo = "10"
    If CInt(Mid$(CStr(i), 5, 2)) > 12 Then
       tmpVar = CInt(Mid$(CStr(i), 1, 4)) + 1
       tmpVar = CLng(tmpVar & "01")
       i = tmpVar
    End If
    lineNo = "11"
    tDate = convertYear2Bm(Mid$(CStr(i), 1, 4))
    lineNo = "12"
    tDate = tDate + Mid$(CStr(i), 5, 2)
    lineNo = "13"
    fileName = dirname & brnum & "\s" & brnum & tDate & ".idx"
    lineNo = "14"
    tmpFileName = dirname & brnum & "\s" & brnum & tDate
    lineNo = "15"
    foundFlag = fso.FileExists(fileName)
    lineNo = "16"
    If foundFlag = False Then
       fileName = dirname & "s" & brnum & tDate & ".idx"
       tmpFileName = dirname & "s" & brnum & tDate
       foundFlag = fso.FileExists(fileName)
    End If
    lineNo = "17"
    If foundFlag = True Then
       If openHistFile(fileName) = 0 Then
          'CreaFile.WriteLine ("@echo test > prtall.$e!")
          If processStmt(CStr(i), tmpFileName) = True Then
             reportFoundFlag = True
          End If
          KeyBuffer$ = fileName
          keybuflen = Len(fileName)
          histLogFile.WriteLine (CStr(Time) & ":" & "About to close the file [" & fileName & "]")
          status = BTRCALL(BCLOSE, posBlk$, stmtBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)
          If status <> 0 Then
             If UserLang = ARABIC Then
                MsgBox "9018-Œÿ√  " & status & " √À‰«¡ «€·«ﬁ «·„·› "
             Else
                MsgBox "9018-Error  " & status & " while closing the file "
             End If
             histLogFile.WriteLine (CStr(Time) & ":" & "Error  " & status & " while closing the file [" & fileName & "]")
          End If
          histLogFile.WriteLine (CStr(Time) & ":" & "The file [" & fileName & "] closed successfully....")
       End If
    Else
       histLogFile.WriteLine (CStr(Time) & ":" & "Stmt Btrieve file [" & fileName & "] not found; proceeding to next filename")
    End If
Next
histLogFile.WriteLine (CStr(Time) & ":" & "Finished extracting statements from " & fromDate & " to " & toDate)
lineNo = "18"
'mergedFile.Close
'lineNo = "19"
'actualMergeFile.Close
lineNo = "20"
CreaFile.WriteLine ("@" & utilPath & "a2w " & outPath & "prtall.$s! " & outPath & "prtall.$e!")
CreaFile.Close
histLogFile.Close
lineNo = "21"
If reportFoundFlag = True Then
   'fileSize = FileLen(outPath & "prtall.$s!")
   shellVar = Shell(outPath & "extract.bat  " & utilPath, vbMaximizedFocus)
'   If (fileSize / 1024) > 1000 Then
'      delay (30)
'   Else
'      delay (10)
'   End If
   Do While Dir(outPath & "prtall.$e!") = ""
      DoEvents
   Loop
  'retVar = Shell(utilPath & "a2w " & outPath & "prtall.$s! " & outPath & "prtall.$e!")
'   delay (20)
   frmHistStmt.Enabled = True
   frmHistStmt.MousePointer = vbNormal
   enablePrintButtons
End If
lineNo = "22"

frmHistStmt.cmdViewHoStmt.Enabled = True
frmHistStmt.cmdPrintHoStmt.Enabled = True
frmHistStmt.cmdAnalysisHoStmt.Enabled = True

If reportFoundFlag = True Then
   If UserLang = ARABIC Then
      tmpStr = " „  ‰›Ì– ﬂ‘› «·Õ”«» »‰Ã«Õ..."
   Else
      tmpStr = "Statement extracted successfully....."
   End If
   CSD_mdiForm.staticStatus.Panels(3).text = tmpStr
Else
   MsgBox errNoReportFound(UserLang)   ' "No report found for this account for a given period"
   frmHistStmt.cmdGenerate.Enabled = True
   frmHistStmt.cmdExit.Enabled = True
   frmHistStmt.MousePointer = vbNormal
   Exit Sub
End If

'If reportFoundFlag = True Then
'   frmHistStmt.Enabled = True
'   frmHistStmt.MousePointer = vbNormal
'   enablePrintButtons
'End If
Exit Sub

err_handler:

    MsgBox "Runtime error " & Err.Number & "-" & Err.Description & "  occured on line number " & lineNo
    End

End Sub

Public Function processStmt(yyyymm As String, tFileName As String) As Boolean
Dim driveLetter As String

KeyBuffer$ = Format(requiredAccNo, "!@@@@@@@@@@@@@@@@@@@@")
stat = readStmtFile(BGETGREATEROREQUAL)

If stat <> 0 Then
   histLogFile.WriteLine (CStr(Time) & ":" & "Read/GTEQ Error [" & stat & "] received on file [" & tFileName & ".idx]" & _
                         " for the key [" & KeyBuffer$ & "]")
End If

If requiredAccNo <> stmtBuf.accNo Then
'   MsgBox "Account #" & txtAccNo & "  not found in  " & Right(yyyymm, 2) + "/" + Left(yyyymm, 4)
   histLogFile.WriteLine (CStr(Time) & ":" & "Account #" & txtAccNo & "  not found in file [" & _
                          tFileName & ".idx]")
   processStmt = False
   Exit Function
End If

histLogFile.WriteLine (CStr(Time) & ":" & "Account #" & txtAccNo & "  found in file [" & _
                          tFileName & ".idx]..Extracting the statements...")

processStmt = False
Do While stat = 0 And requiredAccNo = stmtBuf.accNo
   stmtLang = stmtBuf.lang
   If sequence = 1 Then
      CreaFile.WriteLine ("@echo Please wait...")
      CreaFile.WriteLine ("@echo Extracting statements..")
      CreaFile.WriteLine ("@if exist " & outPath & "*.$s! del " & outPath & "*.$s!")
      driveLetter = fso.GetDriveName(outPath)
      CreaFile.WriteLine ("@" & driveLetter)
      CreaFile.WriteLine ("@cd " & outPath)
      CreaFile.WriteLine ("@cd > " & outPath & "getst.log")
   Else
      CreaFile.WriteLine ("@echo  " + String(sequence, "."))
   End If
 
   If stmtLang = "e" Then
      langChar = Chr$(253) ' language character for english
   Else
      langChar = Chr$(254) ' language character for arabic
   End If
   processStmt = True
   
   'CreaFile.WriteLine ("@%17z x " & tFileName & ".0" & stmtBuf.zipFileNo & " -o" & outPath & " -y" & " " & _
                                  stmtBuf.stmtFile & " >> " & outPath & "getst.log")
   CreaFile.WriteLine ("@%1unzip -C -o " & tFileName & ".0" & stmtBuf.zipFileNo & " " & stmtBuf.stmtFile & " -d " & outPath & " >> " & outPath & "getst.log")
   CreaFile.WriteLine ("@ren " & outPath & stmtBuf.stmtFile & "  " & sequence & ".$s!")
   CreaFile.WriteLine ("@%1lanfix " & outPath & sequence & ".$s!  " & stmtBuf.lang)
   lang = stmtBuf.lang
   CreaFile.WriteLine ("@%1fmerge " & outPath & sequence & ".$s!  " & outPath & "prtall.$s! " & lang)
   sequence = sequence + 1
   
   'retVar = Shell(utilPath & "pkunzip -o " & tFileName & ".0" & stmtBuf.zipFileNo & "  " & stmtBuf.stmtFile & "  " & outPath)
   'delay (10)
   'storeInMergeFile
   
   stat = readStmtFile(BGETNEXT)
Loop
    
End Function
Public Sub storeInMergeFile()
    Dim tLine As String
    Dim tmpStr As String
    Dim firstLine As Boolean
    Dim windowStr As String
    If fso.FileExists(outPath & stmtBuf.stmtFile) = False Then
       If UserLang = ARABIC Then
          tmpStr = "„·› ﬂ‘› «·Õ”«»" & outPath & stmtBuf.stmtFile & " €Ì— „ÊÃÊœ..."
       Else
          tmpStr = "Statement File " & outPath & stmtBuf.stmtFile & " Not found..."
       End If
       MsgBox tmpStr
       frmHistStmt.MousePointer = vbNormal
       disableButtons
       mergedFile.Close
       actualMergeFile.Close
       Exit Sub
    End If
    Set inFile = fso.OpenTextFile(outPath & stmtBuf.stmtFile, ForReading)
    firstLine = True
    While inFile.AtEndOfStream = False
          tLine = inFile.ReadLine
          actualMergeFile.WriteLine tLine
          windowStr = asmoToWindow(tLine)
          If firstLine Then
             mergedFile.WriteLine (stmtLang & windowStr & langChar)
             firstLine = False
          Else
             If stmtLang = "a" Then
                If Len(RTrim(windowStr)) <> 0 Then
                   If Asc(Mid$(windowStr, 1, 1)) >= 65 And Asc(Mid$(windowStr, 1, 1)) <= 90 Then
                      Mid$(windowStr, 4, 1) = Chr(254) & Chr(254)
                      Mid$(windowStr, 42, 1) = Chr(254) & Chr(254)
                   End If
                End If
             End If
             mergedFile.WriteLine (windowStr & langChar)
          End If
    Wend
    inFile.Close
End Sub
Public Function convertYear2Bm(tYear As String)
  Dim retStr As String
   
  retStr = Right(tYear, 2)
  If Val(tYear) >= 2000 Then
     Mid$(retStr, 1, 1) = Chr$(Asc(Mid$(retStr, 1, 1)) + 17)
  End If
  convertYear2Bm = retStr
End Function

Public Function convertAcc2Bm(accNo As String) As String

    Dim retStr As String
    Dim tCode As String
    
    retStr = Mid$(accNo, 1, 5) + Mid$(accNo, 7, 8)
    
    tCode = Mid$(retStr, 6, 1)
    If Mid$(accNo, 6, 1) > "0" Then
       tCode = Chr$(Asc(tCode) + Asc(Mid$(accNo, 6, 1)) * 10 - 473)
       Mid$(retStr, 6, 1) = tCode
    End If
    
    If tCode > "Z" Then
       tCode = Chr(Asc(tCode) + 6)
       Mid$(retStr, 6, 1) = tCode
    End If
    
    convertAcc2Bm = retStr

End Function

Private Sub txtToYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
Public Sub disableButtons()
   cmdGenerate.Enabled = True
   cmdExit.Enabled = True
   cmdAnalysisHoStmt.Enabled = True
   cmdViewHoStmt.Enabled = True
   cmdPrintHoStmt.Enabled = True
   cmdViewStmt.Enabled = False
   cmdPrintStmt.Enabled = False
   cmdAnalyse.Enabled = False
   cmdPrintAnalysis.Enabled = False
   cmdViewAnalysis.Enabled = False
   cmdFtp.Enabled = False
   If InStr(recvLoginMsg.authorityLevel, "~94") > 0 Then
      cmdFtp.Visible = True
      cmdFtp.Refresh
   End If

End Sub

Public Sub enablePrintButtons()
   cmdGenerate.Enabled = False
   cmdExit.Enabled = True
   cmdViewStmt.Enabled = True
   cmdPrintStmt.Enabled = True
   cmdAnalyse.Enabled = True
   If InStr(recvLoginMsg.authorityLevel, "~94") > 0 Then
      cmdFtp.Enabled = True
      cmdFtp.Visible = True
      cmdFtp.Refresh
   End If
   cmdViewAnalysis.Enabled = False
End Sub
