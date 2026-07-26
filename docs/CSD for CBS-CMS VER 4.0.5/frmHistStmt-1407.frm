VERSION 5.00
Begin VB.Form frmHistStmt 
   BackColor       =   &H00BFD87E&
   Caption         =   "Historical Statement Input Form"
   ClientHeight    =   3225
   ClientLeft      =   2340
   ClientTop       =   1845
   ClientWidth     =   4680
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
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3225
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdPrintHoStmt 
      Caption         =   "Print HO stmt"
      Height          =   495
      Left            =   8160
      TabIndex        =   23
      ToolTipText     =   "Print HO Statement"
      Top             =   6600
      Width           =   2055
   End
   Begin VB.CommandButton cmdPrintAnalysis 
      Caption         =   "Print Analysis"
      Height          =   495
      Left            =   6000
      TabIndex        =   22
      ToolTipText     =   "Print analysis"
      Top             =   6600
      Width           =   2175
   End
   Begin VB.CommandButton cmdPrintStmt 
      Caption         =   "Print Statement"
      Height          =   495
      Left            =   6000
      TabIndex        =   21
      ToolTipText     =   "Print statement"
      Top             =   6120
      Width           =   2175
   End
   Begin VB.CommandButton cmdViewHoStmt 
      Caption         =   "View HO stmt"
      Height          =   495
      Left            =   8175
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
      Left            =   3840
      TabIndex        =   10
      ToolTipText     =   "View analysis"
      Top             =   6600
      Width           =   2175
   End
   Begin VB.CommandButton cmdViewStmt 
      Caption         =   "View Statement"
      Height          =   495
      Left            =   3840
      TabIndex        =   11
      ToolTipText     =   "View statement"
      Top             =   6120
      Width           =   2175
   End
   Begin VB.CommandButton cmdAnalyse 
      Caption         =   "Analysis"
      Height          =   495
      Left            =   1800
      TabIndex        =   9
      ToolTipText     =   "Analysis"
      Top             =   6600
      Width           =   2055
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   5040
      TabIndex        =   12
      ToolTipText     =   "Exit"
      Top             =   7080
      Width           =   2055
   End
   Begin VB.CommandButton cmdGenerate 
      Caption         =   "Generate Stmt"
      Default         =   -1  'True
      Height          =   495
      Left            =   1800
      TabIndex        =   8
      ToolTipText     =   "Generate  statement"
      Top             =   6120
      Width           =   2055
   End
   Begin VB.Image anbLogo 
      Height          =   720
      Left            =   2520
      Picture         =   "frmHistStmt.frx":0000
      Stretch         =   -1  'True
      Top             =   360
      Width           =   6345
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
      Top             =   1320
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

Private Sub cmbBranchCode_Change()

End Sub

Private Sub cmbBranchCode_LostFocus()
   Dim i As Integer
   Dim tCode As String
   If Screen.ActiveControl.Name = "cmdExit" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbBranchCode.Text)) <> 0 Then
         tCode = Mid$(cmbBranchCode.Text, 1, 4)
         For i = 0 To cmbBranchCode.ListCount
             If Mid$(cmbBranchCode.List(i), 1, 4) = tCode Then
                cmbBranchCode.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceBranchCode(UserLang)   '"Branch Code Cannot be spaces.. Please enter.."
         cmbBranchCode.SetFocus
         Exit Sub
      End If
        
      If i > cmbBranchCode.ListCount Then
         MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbBranchCode.SetFocus
      End If
   End If
   On Error GoTo 0
End Sub

Private Sub cmbFromMonth_Change()
   disableButtons
   If Len(RTrim(cmbFromMonth.Text)) <> 0 Then
      If Len(cmbFromMonth.Text) = 2 Then
         If cmbFromMonth < 1 Or cmbFromMonth > 12 Then
'           MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            MsgBox "Enter a valid Date"
            cmbFromMonth.Text = ""
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
   If Len(RTrim(cmbToMonth.Text)) <> 0 Then
      If Len(cmbToMonth.Text) = 2 Then
         If cmbToMonth < 1 Or cmbToMonth > 12 Then
'           MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
            MsgBox "Enter a valid Date"
            cmbToMonth.Text = ""
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
    
    CSD_mdiForm.staticStatus.Panels(3).Text = errWaitAnalysis(UserLang)
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
    CSD_mdiForm.staticStatus.Panels(3).Text = errAnalysisSuccess(UserLang)
    MsgBox errAnalysisSuccess(UserLang)
    
End Sub

Private Sub cmdExit_Click()
   Unload Me
End Sub

Private Sub cmdGenerate_Click()
   Dim strmsglen As String * 4
   Dim mQry As String
   Dim tCode As String
   Dim tmpStr As String
   
   CSD_mdiForm.staticStatus.Panels(3).Text = " "
   
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
   
'   tCode = Mid$(txtAccNo, 1, 2)
'   mQry = "select arabicname, englishname from currencyinfo where currencycode = '" & _
'                                                tCode & "'"
'   Set rs = db.OpenRecordset(mQry)
'   If rs.RecordCount > 0 Then
'      If UserLang = ARABIC Then
'         txtCurrDesc = tCode & "-" & rs(0)
'      Else
'         txtCurrDesc = tCode & "-" & rs(1)
'      End If
'   End If
'
'   tCode = Mid$(txtAccNo, 3, 3)
'   mQry = "select arabicname, englishname from bmledgerinfo where ledgercode = '" & _
'                                                tCode & "'"
'   Set rs = db.OpenRecordset(mQry)
'   If rs.RecordCount > 0 Then
'      If UserLang = ARABIC Then
'         txtAcctDesc = tCode & "-" & rs(0)
'      Else
'         txtAcctDesc = tCode & "-" & rs(1)
'      End If
'   End If
   
   If txtBranchCode = "0175" And gBranchCode <> "0175" Then
      MsgBox errNotAuthorisedForStaffAcc(UserLang) ' "Not authorized to print the statement for the staff branch"
      Exit Sub
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
   Printer.PaperSize = vbPRPSA4
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
   Dim firstLine As Boolean
   Dim continuedStmt As Boolean
   
   Set hoOutFile = fso.OpenTextFile(outPath & "prtall.$e!", ForReading)
   
   Printer.FontName = "Courier New (Arabic)"
   Printer.FontSize = 10
   If stmtLang = "e" Then
      Printer.RightToLeft = False
      Printer.PaperSize = vbPRPSLetter
   Else
      Printer.RightToLeft = True
      Printer.PaperSize = vbPRPSA4
   End If
    'Printer.PaintPicture anbLogo, 2500, 150
    Printer.PaintPicture anbLogo, 2500, 150
    For i = 1 To 4
        Printer.Print vbCrLf
    Next
    lines = 0
    firstLine = True
    continuedStmt = False
    While hoOutFile.AtEndOfStream = False
          tLine = hoOutFile.ReadLine
          If InStr(tLine, "Ì »‹‹‹‹‹‹‹‹‹‹⁄") > 0 Or _
             InStr(tLine, "Continued on next page") > 0 Then
             continuedStmt = True
          End If
          'Printer.Print tLine
          'lines = lines + 1
          If firstLine = False Then
            If Len(Trim(tLine)) > 0 Then
               If Mid$(tLine, 1, 1) = "a" Or Mid$(tLine, 1, 1) = "e" Then
                  If Mid$(tLine, 1, 1) = "a" Then
                     stmtLang = "a"
                  Else
                     stmtLang = "e"
                  End If
                  Printer.NewPage
                  Printer.PaintPicture anbLogo, 2500, 150
                  For i = 1 To 4
                     Printer.Print vbCrLf
                  Next
                  lines = 0
                  continuedStmt = False
               End If
            End If
          End If
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
          If continuedStmt = True Then
             If lines > 62 Then
                Printer.NewPage
                Printer.PaintPicture anbLogo, 2500, 150
                For i = 1 To 4
                    Printer.Print vbCrLf
                Next
                lines = 0
                continuedStmt = False
             End If
          End If
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
    Set fso = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(reqPath & "prtall.$s!") = False Then
       MsgBox errNoHoStmtFile(UserLang) '"Statement file (prtall.$s!) not available in " & stmtPath & "req  " & " directory..Please call HO .."
       Exit Sub
    End If
    
    frmHistStmt.Enabled = False
    frmHistStmt.MousePointer = vbHourglass
    On Error GoTo err_handler
    Set hoInFile = fso.OpenTextFile(reqPath & "prtall.$s!", ForReading)
   ' Set hoOutFile = fso.OpenTextFile(outPath & "prtall.$e!", ForWriting, True)
    
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 10
    Printer.PaperSize = vbPRPSLetter
    Printer.PaintPicture anbLogo, 2500, 150
    For i = 1 To 4
        Printer.Print vbCrLf
    Next
    lines = 0
    While hoInFile.AtEndOfStream = False
          tLine = hoInFile.ReadLine
          windowStr = asmoToWindow(tLine)
          Printer.Print windowStr
          lines = lines + 1
          If lines > 62 Then
             Printer.NewPage
             Printer.PaintPicture anbLogo, 2500, 150
             For i = 1 To 4
                 Printer.Print vbCrLf
             Next
             lines = 0
          End If
          'hoOutFile.WriteLine (windowStr)
    Wend
    Printer.EndDoc
    hoInFile.Close
'    hoOutFile.Close
    
    frmHistStmt.Enabled = True
    frmHistStmt.MousePointer = vbNormal
    CSD_mdiForm.staticStatus.Panels(3).Text = " "
    On Error GoTo 0
    Exit Sub
    
err_handler:

    MsgBox "Error  " & Err.Number & "   " & Err.Description & "  " & "occured .. please check "
    Exit Sub
End Sub

Private Sub cmdPrint_Click()
   
End Sub

Private Sub cmdViewAnalysis_Click()
    Shell "notepad  " & outPath & "prtall.$a!", vbMaximizedFocus
    delay (5)
End Sub

Private Sub cmdViewHoStmt_Click()
    Dim fso As FileSystemObject
    Dim hoInFile, hoOutFile
    Dim tLine As String
    Dim windowStr As String
    Dim retVar As Variant
    Set fso = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(reqPath & "prtall.$s!") = False Then
       MsgBox errNoHoStmtFile(UserLang) '"Statement file (prtall.$s!) not available in " & reqPath & " directory..Please call HO .."
       Exit Sub
    End If
    
    frmHistStmt.Enabled = False
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
    CSD_mdiForm.staticStatus.Panels(3).Text = " "
    Shell utilPath & "wordpad  " & outPath & "prtall.$e!", vbMaximizedFocus
    On Error GoTo 0
    Exit Sub
    
err_handler:

    MsgBox "Error  " & Err.Number & "   " & Err.Description & "  " & "occured .. please check "
    Exit Sub
   
End Sub

Private Sub cmdViewStmt_Click()
    Dim fso As FileSystemObject
    Dim retVar As Variant
    Dim tmpStr As String
    Set fso = CreateObject("Scripting.FileSystemObject")
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
    CSD_mdiForm.staticStatus.Panels(3).Text = " "
    Shell utilPath & "wordpad  " & outPath & "prtall.$e!", vbMaximizedFocus
End Sub

Private Sub Form_Load()
   Dim num As String
   Dim mQry As String
   
   cmdGenerate.Visible = True
      
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
    frmHistStmt.cmdExit.Caption = frmHistStmtCaption(17, UserLang)
    
   
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
    
    txtBranchCode = gBranchCode

End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).Text = "  "
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
Dim fromDate, toDate As Long
Dim tmpVar As Long
Dim shellVar As Variant
Dim tDate As String

fromDate = CLng(txtFromYear + cmbFromMonth)
toDate = CLng(txtToYear + cmbToMonth)
Set fso = CreateObject("Scripting.FileSystemObject")

If fso.FolderExists(outPath) = False Then
   fso.CreateFolder (outPath)
End If

tmpFileName = outPath & "extract.bat"
If fso.FileExists(tmpFileName) = True Then
   fso.DeleteFile tmpFileName, True
End If

tmpFileName = outPath & "prtall.$e!"
If fso.FileExists(tmpFileName) = True Then
   fso.DeleteFile tmpFileName, True
End If

tmpFileName = outPath & "prtall.$s!"
If fso.FileExists(tmpFileName) = True Then
   fso.DeleteFile tmpFileName, True
End If

Set CreaFile = fso.OpenTextFile(outPath & "extract.bat", ForWriting, True)
Set outFile = fso.OpenTextFile(outPath & "printit.bat", ForWriting, True)
Set mergedFile = fso.OpenTextFile(outPath & "prtall.$e!", ForAppending, True)
Set actualMergeFile = fso.OpenTextFile(outPath & "prtall.$s!", ForAppending, True)
reportFoundFlag = False
sequence = 1
'frmHistStmt.Enabled = False
frmHistStmt.MousePointer = vbHourglass
frmHistStmt.cmdGenerate.Enabled = False
frmHistStmt.cmdExit.Enabled = False
frmHistStmt.cmdViewHoStmt.Enabled = False
frmHistStmt.cmdPrintHoStmt.Enabled = False
For i = fromDate To toDate
    If CInt(Mid$(CStr(i), 5, 2)) > 12 Then
       tmpVar = CInt(Mid$(CStr(i), 1, 4)) + 1
       tmpVar = CLng(tmpVar & "01")
       i = tmpVar
    End If
    tDate = convertYear2Bm(Mid$(CStr(i), 1, 4))
    tDate = tDate + Mid$(CStr(i), 5, 2)
    fileName = dirname & brnum & "\s" & brnum & tDate & ".idx"
    tmpFileName = dirname & brnum & "\s" & brnum & tDate
    foundFlag = fso.FileExists(fileName)
    If foundFlag = False Then
       fileName = dirname & "s" & brnum & tDate & ".idx"
       tmpFileName = dirname & "s" & brnum & tDate
       foundFlag = fso.FileExists(fileName)
    End If
    If foundFlag = True Then
       If openHistFile(fileName) = 0 Then
          If processStmt(CStr(i), tmpFileName) = True Then
             reportFoundFlag = True
          End If
          KeyBuffer$ = fileName
          Keybuflen = Len(fileName)
          status = BTRCALL(BCLOSE, posBlk$, stmtBuf, BufLen, ByVal KeyBuffer$, Keybuflen, 0)
          If status <> 0 Then
             If UserLang = ARABIC Then
                MsgBox "1018-Œÿ√  " & status & " √À‰«¡ «€·«ﬁ «·„·› "
             Else
                MsgBox "1018-Error  " & status & " while closing the file "
             End If
          End If
       Else
          MsgBox "File  " & fileName & "  could not be opened.."
       End If
    End If
Next

frmHistStmt.cmdViewHoStmt.Enabled = True
frmHistStmt.cmdPrintHoStmt.Enabled = True

If reportFoundFlag = True Then
   If UserLang = ARABIC Then
      tmpStr = " „  ‰›Ì– ﬂ‘› «·Õ”«» »‰Ã«Õ..."
   Else
      tmpStr = "Statement extracted successfully....."
   End If
   CSD_mdiForm.staticStatus.Panels(3).Text = tmpStr
Else
   CreaFile.WriteLine ("@echo nothing to extract")
   outFile.WriteLine ("@echo nothing to print")
   MsgBox errNoReportFound(UserLang)   ' "No report found for this account for a given period"
   outFile.Close
   mergedFile.Close
   CreaFile.Close
   tmpFileName = outPath + "extract.bat"
   If fso.FileExists(tmpFileName) = True Then
      fso.DeleteFile tmpFileName, True
   End If
   frmHistStmt.Enabled = True
   frmHistStmt.cmdGenerate.Enabled = True
   frmHistStmt.cmdExit.Enabled = True
   frmHistStmt.cmdViewHoStmt.Enabled = True
   frmHistStmt.MousePointer = vbNormal
   Exit Sub
End If
outFile.Close
mergedFile.Close
actualMergeFile.Close
CreaFile.Close

If reportFoundFlag = True Then
'   shellVar = Shell(outPath & "extract.bat  " & utilPath, vbMaximizedFocus)
'   delay (5)
   frmHistStmt.Enabled = True
   frmHistStmt.MousePointer = vbNormal
   enablePrintButtons
End If

End Sub

Public Function processStmt(yyyymm As String, tFileName As String) As Boolean
Dim driveLetter As String

KeyBuffer$ = Format(requiredAccNo, "!@@@@@@@@@@@@@@@@@@@@")
stat = readStmtFile(BGETGREATEROREQUAL)

If requiredAccNo <> stmtBuf.accNo Then
'   MsgBox "Account #" & txtAccNo & "  not found in  " & Right(yyyymm, 2) + "/" + Left(yyyymm, 4)
   processStmt = False
   Exit Function
End If

processStmt = False
Do While stat = 0 And requiredAccNo = stmtBuf.accNo
   stmtLang = stmtBuf.lang
   If stmtLang = "e" Then
      langChar = Chr$(253) ' language character for english
   Else
      langChar = Chr$(254) ' language character for arabic
   End If
   processStmt = True
   
   retVar = Shell(utilPath & "pkunzip -o " & tFileName & ".0" & stmtBuf.zipFileNo & "  " & stmtBuf.stmtFile & "  " & outPath)
   delay (10)
   storeInMergeFile
   
   stat = readStmtFile(BGETNEXT)
Loop
    
End Function
Public Sub storeInMergeFile()
    Dim tLine As String
    Dim firstLine As Boolean
    Dim windowStr As String
    If fso.FileExists(outPath & stmtBuf.stmtFile) = False Then
       MsgBox "Statement File " & outPath & stmtBuf.stmtFile & " Not found..."
       frmHistStmt.MousePointer = vbNormal
       disableButtons
       outFile.Close
       mergedFile.Close
       actualMergeFile.Close
       CreaFile.Close
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
   cmdViewStmt.Enabled = False
   cmdPrintStmt.Enabled = False
   cmdAnalyse.Enabled = False
   cmdPrintAnalysis.Enabled = False
   cmdViewAnalysis.Enabled = False
End Sub

Public Sub enablePrintButtons()
   cmdGenerate.Enabled = False
   cmdExit.Enabled = True
   cmdViewStmt.Enabled = True
   cmdPrintStmt.Enabled = True
   cmdAnalyse.Enabled = True
   cmdViewAnalysis.Enabled = False
End Sub
