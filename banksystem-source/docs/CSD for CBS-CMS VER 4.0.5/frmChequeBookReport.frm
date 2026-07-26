VERSION 5.00
Begin VB.Form frmChequeBookReport 
   BackColor       =   &H00BFD87E&
   Caption         =   "Daily Cheque book request report "
   ClientHeight    =   4020
   ClientLeft      =   2145
   ClientTop       =   2310
   ClientWidth     =   7050
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4020
   ScaleWidth      =   7050
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3720
      TabIndex        =   8
      ToolTipText     =   "Cancel"
      Top             =   2400
      Width           =   1335
   End
   Begin VB.CommandButton cmdGenerateReport 
      Caption         =   "Generate Report"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1560
      TabIndex        =   7
      ToolTipText     =   "Generate Report"
      Top             =   2400
      Width           =   2175
   End
   Begin VB.TextBox txtReportYear 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4320
      MaxLength       =   4
      TabIndex        =   6
      Top             =   1680
      Width           =   615
   End
   Begin VB.ComboBox cmbReportMonth 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   3720
      TabIndex        =   5
      Text            =   "01"
      Top             =   1680
      Width           =   615
   End
   Begin VB.ComboBox cmbReportDate 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   3120
      TabIndex        =   4
      Text            =   "01"
      Top             =   1680
      Width           =   615
   End
   Begin VB.Frame frameSelection 
      Height          =   615
      Left            =   1680
      TabIndex        =   1
      Top             =   960
      Width           =   3015
      Begin VB.OptionButton optOtherDate 
         Caption         =   "Other Date"
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
         Height          =   195
         Left            =   1320
         TabIndex        =   3
         Tag             =   "3015"
         Top             =   240
         Width           =   1575
      End
      Begin VB.OptionButton optToday 
         Caption         =   "Today"
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
         Height          =   195
         Left            =   120
         TabIndex        =   2
         Tag             =   "3015"
         Top             =   240
         Value           =   -1  'True
         Width           =   1095
      End
   End
   Begin VB.Label lblEnterDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Enter Date"
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
      Left            =   1680
      TabIndex        =   0
      Top             =   1680
      Width           =   1335
   End
End
Attribute VB_Name = "frmChequeBookReport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public page As Integer
Dim lines As Integer
Public textStream, tStream As Object
Public fsys As Object
Public langChar As String

Private Sub cmbReportDate_Change()
  If Len(RTrim(cmbReportDate.text)) <> 0 Then
     If Len(cmbReportDate.text) = 2 Then
        If cmbReportDate < 1 Or _
           cmbReportDate > 31 Then
           MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
           cmbReportDate.text = ""
           cmbReportDate.SetFocus
        Else
           On Error Resume Next
           cmbReportMonth.SetFocus
        End If
      End If
  End If
End Sub

Private Sub cmbReportMonth_Change()
If Len(RTrim(cmbReportMonth.text)) <> 0 Then
   If Len(cmbReportMonth.text) = 2 Then
      If cmbReportMonth < 1 Or _
         cmbReportMonth > 31 Then
         MsgBox errEnterValidMonth(UserLang) '"Enter a valid Date"
         cmbReportMonth.text = ""
         cmbReportMonth.SetFocus
      Else
         On Error Resume Next
         txtReportYear.SetFocus
      End If
    End If
  End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdGenerateReport_Click()
    Dim tReportDate As String
    Dim strmsglen As String
    
    If optOtherDate.Value = True Then
       tReportDate = txtReportYear + cmbReportMonth + cmbReportDate
       If validDate(tReportDate) = False Then
          MsgBox errInvalidDate(UserLang)
          cmbReportDate.SetFocus
          Exit Sub
       End If
    Else
       tReportDate = Space(8)
    End If
    
    SendMsg = "000000" & "58" & gBranchCode & "00000" & tReportDate
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmChequeBookReport.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmChequeBookReport.MousePointer = vbDefault
       Exit Sub
    End If
    frmChequeBookReport.MousePointer = vbDefault
    
    parseChequeBookReportDetails
       
    If recvChequeBookReport.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvChequeBookReport.aRemarks
       Else
          MsgBox recvChequeBookReport.eRemarks
       End If
       Exit Sub
    End If
    page = 0
    generateChequeBookReport tReportDate

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim i As Integer
    Dim num As String
        
    If UserLang = ARABIC Then
       ChangePositions frmChequeBookReport, 7170
       frmChequeBookReport.RightToLeft = True
    End If
    
    frmChequeBookReport.Caption = frmChequeBookReportCaption(0, UserLang)
    frmChequeBookReport.optToday.Caption = frmChequeBookReportCaption(1, UserLang)
    frmChequeBookReport.optOtherDate.Caption = frmChequeBookReportCaption(2, UserLang)
    frmChequeBookReport.lblEnterDate.Caption = frmChequeBookReportCaption(3, UserLang)
    frmChequeBookReport.cmdGenerateReport.Caption = frmChequeBookReportCaption(4, UserLang)
    frmChequeBookReport.cmdCancel.Caption = frmChequeBookReportCaption(5, UserLang)
    cmbReportDate.Enabled = False
    cmbReportMonth.Enabled = False
    txtReportYear.Enabled = False
    
    For i = 1 To 30
        If i < 10 Then
           num = "0" + CStr(i)
        Else
           num = CStr(i)
        End If
        cmbReportDate.AddItem num
        If i < 13 Then
           cmbReportMonth.AddItem num
        End If
     Next

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optOtherDate_Click()
    cmbReportDate.Enabled = True
    cmbReportMonth.Enabled = True
    txtReportYear.Enabled = True
End Sub

Private Sub optToday_Click()
    cmbReportDate.Enabled = False
    cmbReportMonth.Enabled = False
    txtReportYear.Enabled = False
End Sub

Public Sub parseChequeBookReportDetails()
    Dim i, pos As Integer
    
    recvChequeBookReport.status = Mid$(RecvStr, 1, 3)
    recvChequeBookReport.service = Mid$(RecvStr, 4, 2)
    recvChequeBookReport.aRemarks = Mid$(RecvStr, 6, 50)
    recvChequeBookReport.eRemarks = Mid$(RecvStr, 56, 50)
    recvChequeBookReport.lastRecCount = Mid$(RecvStr, 106, 5)
    recvChequeBookReport.noOfRecs = Mid$(RecvStr, 111, 2)
    recvChequeBookReport.reportDate = Mid$(RecvStr, 113, 8)
    recvChequeBookReport.filler = Mid$(RecvStr, 121, 10)
    pos = 131
    For i = 1 To Val(recvChequeBookReport.noOfRecs)
        recvChequeBookReport.details(i).accNo = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvChequeBookReport.details(i).chequeType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvChequeBookReport.details(i).booksRequested = Mid$(RecvStr, pos, 2)
        pos = pos + 2
        recvChequeBookReport.details(i).requestUserId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvChequeBookReport.details(i).requestStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvChequeBookReport.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvChequeBookReport.details(i).chequeNoFrom = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvChequeBookReport.details(i).chequeNoTo = Mid$(RecvStr, pos, 8)
        pos = pos + 8
    Next i
End Sub

Public Sub generateChequeBookReport(tRequestDate As String)
    Dim i As Integer
    Dim reportFile As String
    Dim tChequeType As String, tRequestStatus As String
    Dim oldUserId As String
    Dim strmsglen As String
    Dim recsCreated As Integer
    Dim recsTotal As Integer
    Dim tmpStr As String
    Dim response
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    
    recsCreated = 0
    recsTotal = 0

    Set fsys = CreateObject("scripting.filesystemobject")
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    If (Not fso.FolderExists("c:\reports")) Then
       fso.CreateFolder ("c:\reports")
'       Set Fold = fso.GetFolder("c:\")
'       Set SubFold = Fold.SubFolders
'       Set CreaFold = SubFold.Add("reports")
    End If
    
    reportFile = "c:\reports\ANB689." & Mid$(gBranchCode, 2, 3)

    Set textStream = fsys.CreateTextFile(reportFile, True)
    
    langChar = Chr$(254)
    
    oldUserId = "-----------"
    
    Printer.Orientation = 2   ' for landscape
    Printer.RightToLeft = True ' for arabic
    Printer.FontName = "Courier New (Arabic)"
    Printer.fontSize = 12
    Printer.FontBold = False
'    Printer.PaperSize = vbPRPSA4   'for A4
    
    Do While True
        On Error Resume Next
        For i = 1 To Val(recvChequeBookReport.noOfRecs)
        
            If oldUserId <> recvChequeBookReport.details(i).requestUserId Then
               If oldUserId = "-----------" Then
                  oldUserId = recvChequeBookReport.details(i).requestUserId
                  headerPrint (oldUserId)
               Else
                  textStream.WriteLine
                  Printer.Print vbCrLf
                  textStream.WriteLine (String(110, "-"))
                  Printer.Print String(110, "-")
                  textStream.WriteLine "Number of Cheque book requested :" + str(recsCreated)
                  Printer.Print langChar + "⁄œœ œ›« — «·‘Ìﬂ«  «·„ÿ·Ê»… :" + langChar + str(recsCreated) + langChar
                  textStream.WriteLine Chr(12)
                  Printer.NewPage
                  recsCreated = 0
                  oldUserId = recvChequeBookReport.details(i).requestUserId
                  headerPrint (oldUserId)
               End If
            End If
            
    '        textStream.WriteLine ("Account No" + langChar + "Cheque Book Type " + langChar + _
    '                         "# Books Requested" + langChar + "Request Status " + langChar + "Cust BrCode" + _
    '                         langChar + "From Cheque No" + langChar + "To Cheque No " + langChar)
            
            recsCreated = recsCreated + 1
            recsTotal = recsTotal + 1
            If recvChequeBookReport.details(i).chequeType = "1" Then
               tChequeType = "‘Œ’Ì"
            Else
               tChequeType = " Ã«—Ì"
            End If
            
            If recvChequeBookReport.details(i).requestStatus = "1" Then
               tRequestStatus = "‰›–"
            ElseIf recvChequeBookReport.details(i).requestStatus = "2" Then
               tRequestStatus = "«·„ﬁœ„…"
            ElseIf recvChequeBookReport.details(i).requestStatus = "3" Then
               tRequestStatus = "«·Ê«—œÂ «·Ï «·›—⁄"
            ElseIf recvChequeBookReport.details(i).requestStatus = "4" Then
               tRequestStatus = "«·’«œ—Â ··⁄„·«¡"
            Else
               tRequestStatus = "«·Õ«·Â Œÿ√ [" + recvChequeBookReport.details(i).requestStatus + "]"
            End If
            
            textStream.WriteLine (recvChequeBookReport.details(i).accNo + langChar + "    " + tChequeType + langChar + _
                              "             " + recvChequeBookReport.details(i).booksRequested + _
                              langChar + "         " + tRequestStatus + langChar + _
                              "       " + recvChequeBookReport.details(i).custBranchCode + langChar + _
                              "       " + recvChequeBookReport.details(i).chequeNoFrom + langChar + _
                              "      " + recvChequeBookReport.details(i).chequeNoTo + langChar)
            Printer.Print recvChequeBookReport.details(i).accNo + langChar + "    " + tChequeType + langChar + _
                              "             " + recvChequeBookReport.details(i).booksRequested + _
                              langChar + "          " + recvChequeBookReport.details(i).requestStatus + "-" + _
                                                       tRequestStatus + langChar + _
                              "       " + recvChequeBookReport.details(i).custBranchCode + langChar + _
                              "       " + recvChequeBookReport.details(i).chequeNoFrom + langChar + _
                              "      " + recvChequeBookReport.details(i).chequeNoTo + langChar
                              
            lines = lines + 1
            If lines > 50 Then
               page = page + 1
               headerPrint (oldUserId)
            End If
        Next
        If recvChequeBookReport.noOfRecs = "50" Then
             SendMsg = "000000" + "58" + gBranchCode + recvChequeBookReport.lastRecCount + tRequestDate
             strmsglen = Format(Len(SendMsg), "000000")
             Mid$(SendMsg, 1, 6) = strmsglen
             DataReceivedFlag = False
             frmChequeBookReport.MousePointer = vbHourglass
            
             ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
             If ReturnStatus = LocalCommsError Then
                LoadError = True
                frmChequeBookReport.MousePointer = vbDefault
                LogData "Cheque book report aborted after initial request sent to server"
                Exit Do
             End If
             frmChequeBookReport.MousePointer = vbDefault
             
             parseChequeBookReportDetails
               
             If recvChequeBookReport.status <> "000" Then
                Exit Do
             Else
                If recvChequeBookReport.noOfRecs = "00" Then
                   Exit Do
                End If
             End If
        Else
           Exit Do
        End If
    Loop
    
    If oldUserId <> "-----------" Then
       textStream.WriteLine
       Printer.Print vbCrLf
       textStream.WriteLine (String(110, "-"))
       Printer.Print String(110, "-")
       textStream.WriteLine "Number of Cheque book requested :" + str(recsCreated)
       Printer.Print langChar + "⁄œœ œ›« — «·‘Ìﬂ«  «·„ÿ·Ê»… :" + langChar + str(recsCreated) + langChar
       textStream.WriteLine "Total Number of Cheque books    :" + str(recsTotal)
       Printer.Print langChar + "„Ã„Ê⁄ œ›« — «·‘Ìﬂ«     :" + langChar + str(recsTotal) + langChar
       textStream.WriteLine (String(50, "-") + "END OF REPORT" + String(50, "-"))
       Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    Else
       If Val(recvChequeBookReport.noOfRecs) = 0 Then
          headerPrint (oldUserId)
          textStream.WriteLine "No Transaction found for this date"
          Printer.Print "·« ÌÊÃœ Õ—ﬂ«  ·· ‰›Ì–"
          textStream.WriteLine
          Printer.Print vbCrLf
          textStream.WriteLine (String(110, "-"))
          Printer.Print String(110, "-")
          textStream.WriteLine "Number of Cheque book requested :" + str(recsCreated)
          Printer.Print langChar + "⁄œœ œ›« — «·‘Ìﬂ«  «·„ÿ·Ê»…  :" + langChar + str(recsCreated) + langChar
          textStream.WriteLine "Total Number of Cheque books    :" + str(recsTotal)
          Printer.Print langChar + "„Ã„Ê⁄ œ›« — «·‘Ìﬂ«     :" + langChar + str(recsTotal) + langChar
          textStream.WriteLine (String(50, "-") + "END OF REPORT" + String(50, "-"))
          Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + String(50, "-")
       End If
    End If
    
    textStream.Close
    tmpStr = errWannaPrint(UserLang)
    response = MsgBox(tmpStr, vbYesNo)
    If response = vbYes Then
       Printer.EndDoc
    Else
       Printer.KillDoc
    End If
    
End Sub


Public Sub headerPrint(tUserid As String)
   Dim branchName As String
      
   Set rs = db.OpenRecordset("select arabicname from branchinfo where branchcode = '" + gBranchCode + "'")
   
   If rs.recordCount > 0 Then
      branchName = rs(0)
   Else
      branchName = "—ﬁ„ «·›—⁄ Œÿ√ [" + gBranchCode + "]"
   End If
   
   page = page + 1
  
   textStream.WriteLine ("«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì                                                 «· «—ÌŒ   : " + Format(Date$, "dd/mm/yyyy") + "      Time  : " + Format(Time, "hh:mm:ss"))
   Printer.Print "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì             (ANB517)                           «· «—ÌŒ   : " + Format(Date$, "dd/mm/yyyy") + "      «·Êﬁ   : " + Format(Time, "hh:mm:ss")
   textStream.WriteLine ("Branch : " + gBranchCode + "     " + branchName + langChar + _
                         "                                                                  Page  : " + CStr(page) + langChar)
   Printer.Print "›—⁄ :" + gBranchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                   ’›ÕÂ  : " + CStr(page) + langChar
   textStream.WriteLine ("                          DAILY ACTIVITIY REPORT ON CHEQUE BOOK REQUEST  for " + formatDate(recvChequeBookReport.reportDate) + langChar)
   Printer.Print "                           ﬁ—Ì— ÿ·»«  œ›« — «·‘Ìﬂ«  ·ÌÊ„ " + formatDate(recvChequeBookReport.reportDate) + langChar
   textStream.WriteLine ("ÂÊÌ… «·„” Œœ„ :" + langChar + tUserid + langChar)
   Printer.Print langChar + "ÂÊÌ… «·„” Œœ„ :" + langChar + tUserid + langChar
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   textStream.WriteLine ("—ﬁ„ «·Õ”«»      " + "‰Ê⁄ œ› — «·‘Ìﬂ«  " + _
                         "⁄œœ «·œ›« — «·„ÿ·Ê»…  " + "Ê÷⁄ «·ÿ·»" + "—ﬁ„ ›—⁄ «·⁄„Ì·" + _
                          "  „‰ ‘Ìﬂ —ﬁ„" + "«·Ï ‘Ìﬂ —ﬁ„ ")
   Printer.Print "—ﬁ„ «·Õ”«»      " + "‰Ê⁄ œ› — «·‘Ìﬂ«  " + _
                         "  ⁄œœ «·‘Ìﬂ«  «·„ÿ·Ê»…    " + "Õ«·… «·ÿ·»  " + "—ﬁ„ ›—⁄ «·⁄„Ì·   " + _
                         "„‰ ‘Ìﬂ —ﬁ„" + "     «·Ï ‘Ìﬂ —ﬁ„ "
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   lines = 7

End Sub

