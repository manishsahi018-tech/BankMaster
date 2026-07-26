VERSION 5.00
Begin VB.Form frmReturnedMailReport 
   BackColor       =   &H00BFD87E&
   Caption         =   "Registered returned mail report"
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
   Begin VB.ComboBox cmbBranchCode 
      Height          =   315
      Left            =   3120
      TabIndex        =   6
      Top             =   1200
      Width           =   2295
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3720
      TabIndex        =   5
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
      TabIndex        =   4
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
      TabIndex        =   3
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
      TabIndex        =   2
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
      TabIndex        =   1
      Text            =   "01"
      Top             =   1680
      Width           =   615
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code"
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
      TabIndex        =   7
      Top             =   1200
      Width           =   1215
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
Attribute VB_Name = "frmReturnedMailReport"
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

Private Sub cmbBranchCode_Validate(Cancel As Boolean)
Dim tCode As String
Dim i As Integer
If Len(RTrim(cmbBranchCode.text)) <> 0 Then
   tCode = Mid$(cmbBranchCode.text, 1, 4)
   For i = 0 To cmbBranchCode.ListCount
       If Mid$(cmbBranchCode.List(i), 1, 4) = tCode Then
          cmbBranchCode.ListIndex = i
          Exit For
       End If
   Next i
Else
   MsgBox errSpaceBranchCode(UserLang)   '"Branch Code Cannot be spaces.. Please enter.."
   cmbBranchCode.SetFocus
   Cancel = True
   Exit Sub
End If
             
If i > cmbBranchCode.ListCount Then
   MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
   cmbBranchCode.SetFocus
   Cancel = True
End If
End Sub

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
    Dim tReportDate As String, tBranchCode As String
    Dim strmsglen As String
    
    tReportDate = txtReportYear & cmbReportMonth & cmbReportDate
    If Len(Trim(tReportDate)) = 0 Then
       MsgBox errInvalidDate(UserLang)
       cmbReportDate.SetFocus
       Exit Sub
    End If
    
    If validDate(tReportDate) = False Then
       MsgBox errInvalidDate(UserLang)
       cmbReportDate.SetFocus
       Exit Sub
    End If
    
    If Len(Trim(cmbBranchCode)) = 0 Then
       MsgBox errSpaceBranchCode(UserLang)
       cmbBranchCode.SetFocus
       Exit Sub
    End If
    
    tBranchCode = Mid$(cmbBranchCode, 1, 4)

    SendMsg = "000000" & "AE" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & "00000" & tReportDate & tBranchCode
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmReturnedMailReport.MousePointer = vbHourglass

    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmReturnedMailReport.MousePointer = vbDefault
       Exit Sub
    End If
    frmReturnedMailReport.MousePointer = vbDefault

    parseReturnedMailReportDetails

    If recvRetMailReport.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvRetMailReport.aRemarks
       Else
          MsgBox recvRetMailReport.eRemarks
       End If
       Exit Sub
    End If
    page = 0
    generateReturnedMailReport tReportDate, tBranchCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim i As Integer
    Dim num As String, mQry As String
        
    If UserLang = ARABIC Then
       ChangePositions frmReturnedMailReport, 7170
       frmReturnedMailReport.RightToLeft = True
    End If
    
    frmReturnedMailReport.Caption = frmReturnedMailReportCaption(0, UserLang)
    frmReturnedMailReport.lblBranchCode.Caption = frmReturnedMailReportCaption(1, UserLang)
    frmReturnedMailReport.lblEnterDate.Caption = frmReturnedMailReportCaption(2, UserLang)
    frmReturnedMailReport.cmdGenerateReport.Caption = frmReturnedMailReportCaption(3, UserLang)
    frmReturnedMailReport.cmdCancel.Caption = frmReturnedMailReportCaption(4, UserLang)
    
    
    For i = 1 To 31
        If i < 10 Then
           num = "0" & CStr(i)
        Else
           num = CStr(i)
        End If
        cmbReportDate.AddItem num
        If i < 13 Then
           cmbReportMonth.AddItem num
        End If
     Next
     
     mQry = "select branchcode,arabicname,englishname from branchinfo"
     Set rs = db.OpenRecordset(mQry)
    
     If rs.recordCount > 0 Then
        cmbBranchCode.Clear
        rs.MoveFirst
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbBranchCode.AddItem rs(0) & "-" & rs(2)
           Else
              cmbBranchCode.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
        Loop
     End If
     If UserLang = ARABIC Then
        cmbBranchCode.AddItem "ALL -Ã„Ì⁄ «·›—Ê⁄"
        cmbBranchCode.text = "ALL -Ã„Ì⁄ «·›—Ê⁄"
     Else
        cmbBranchCode.AddItem "ALL -All Branches"
        cmbBranchCode.text = "ALL -All Branches"
     End If

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

Public Sub parseReturnedMailReportDetails()
    Dim i As Integer, pos As Integer
    pos = 1
    recvRetMailReport.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvRetMailReport.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvRetMailReport.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvRetMailReport.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvRetMailReport.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvRetMailReport.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvRetMailReport.reportDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvRetMailReport.branchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvRetMailReport.filler = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    For i = 1 To Val(recvRetMailReport.noOfRecs)
        recvRetMailReport.details(i).refNo = Mid$(RecvStr, pos, 16)
        pos = pos + 16
        recvRetMailReport.details(i).branchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvRetMailReport.details(i).letterTypeDesc = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvRetMailReport.details(i).custNo = Mid$(RecvStr, pos, 7)
        pos = pos + 7
        recvRetMailReport.details(i).custName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvRetMailReport.details(i).productId = Mid$(RecvStr, pos, 20)
        pos = pos + 20
        recvRetMailReport.details(i).filler = Mid$(RecvStr, pos, 50)
        pos = pos + 50
    Next i
End Sub

Public Sub generateReturnedMailReport(tRequestDate As String, tBranchCode As String)
    Dim i As Integer
    Dim reportFile As String
    Dim tChequeType As String, tRequestStatus As String
    Dim oldBranchCode As String
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
    
    reportFile = "c:\reports\retmail.prt"

    Set textStream = fsys.CreateTextFile(reportFile, True)
    
    'langChar = Chr$(253)  ' for english
    
    langChar = Chr$(254)  ' for arabic
    
    oldBranchCode = "--------"
    
    Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 12
    'Printer.RightToLeft = False '  for english
    Printer.RightToLeft = True ' for arabic
    
    Do While True
        On Error Resume Next
        For i = 1 To Val(recvRetMailReport.noOfRecs)
        
            If oldBranchCode <> recvRetMailReport.details(i).branchCode Then
               If oldBranchCode = "--------" Then
                  oldBranchCode = recvRetMailReport.details(i).branchCode
                  headerPrint (oldBranchCode)
               Else
                  textStream.WriteLine
                  Printer.Print vbCrLf
                  textStream.WriteLine (String(110, "-"))
                  Printer.Print String(110, "-")
                  textStream.WriteLine "Number of Returned mail registered :" & str(recsCreated)
                  'Printer.Print langChar & "Number of Returned mail registered :" & langChar & str(recsCreated)
                  Printer.Print langChar & "„Ã„Ê⁄ «·—”«∆· «·„” —Ã⁄… «·„”Ã·…  :" & langChar & str(recsCreated)
                  textStream.WriteLine (String(50, "-") & "END OF REPORT" & String(50, "-"))
                  'Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
                  Printer.Print (String(50, "-") & "‰Â«Ì… «· ﬁ—Ì—" & String(50, "-"))
                  textStream.WriteLine Chr(12)
                  Printer.NewPage
                  recsCreated = 0
                  page = 0
                  oldBranchCode = recvRetMailReport.details(i).branchCode
                  headerPrint (oldBranchCode)
               End If
            End If
            
            recsCreated = recsCreated + 1
            recsTotal = recsTotal + 1
            
            textStream.WriteLine (recvRetMailReport.details(i).refNo + langChar + "    " + _
                              Trim(recvRetMailReport.details(i).letterTypeDesc) + _
                              langChar + "         " + recvRetMailReport.details(i).custNo + langChar + _
                              "       " + Trim(recvRetMailReport.details(i).custName) + langChar + _
                              "       " + recvRetMailReport.details(i).productId + langChar)
            Printer.Print recvRetMailReport.details(i).refNo & langChar & "   " & _
                              Trim(recvRetMailReport.details(i).letterTypeDesc) & _
                              langChar & "       " & recvRetMailReport.details(i).custNo & langChar & _
                              langChar & "         " & recvRetMailReport.details(i).custName & langChar & _
                              "    " & recvRetMailReport.details(i).productId & langChar
                              
            lines = lines + 1
            If lines > 55 Then
               page = page + 1
               headerPrint (oldBranchCode)
            End If
        Next
        If recvRetMailReport.noOfRecs = "50" Then
           SendMsg = "000000" & "AE" & gBranchCode & recvRetMailReport.lastRecCount & tRequestDate & tBranchCode
           strmsglen = Format(Len(SendMsg), "000000")
           Mid$(SendMsg, 1, 6) = strmsglen
           DataReceivedFlag = False
           frmReturnedMailReport.MousePointer = vbHourglass

           ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
           If ReturnStatus = LocalCommsError Then
              LoadError = True
              frmReturnedMailReport.MousePointer = vbDefault
              Exit Sub
           End If
           frmReturnedMailReport.MousePointer = vbDefault

           parseReturnedMailReportDetails

           If recvRetMailReport.status <> "000" Then
              Exit Do
           Else
              If recvRetMailReport.noOfRecs = "00" Then
                 Exit Do
              End If
           End If
        Else
           Exit Do
        End If
    Loop
    
    If oldBranchCode <> "--------" Then
       textStream.WriteLine
       Printer.Print vbCrLf
       textStream.WriteLine (String(110, "-"))
       Printer.Print String(110, "-")
       textStream.WriteLine "Number of returned mails registered :" & str(recsCreated)
       'Printer.Print langChar + "⁄œœ œ›« — «·‘Ìﬂ«  «·„ÿ·Ê»… :" + langChar + str(recsCreated) + langChar
       Printer.Print langChar & "„Ã„Ê⁄ «·—”«∆· «·„” —Ã⁄… «·„”Ã·… :" & langChar & str(recsCreated)
       textStream.WriteLine (String(50, "-") & "END OF REPORT" & String(50, "-"))
       Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
       'Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
    Else
       If Val(recvRetMailReport.noOfRecs) = 0 Then
          headerPrint oldBranchCode
          textStream.WriteLine "No Transaction found for this date"
          Printer.Print "·« ÌÊÃœ Õ—ﬂ«  ·· ‰›Ì–"
          textStream.WriteLine
          Printer.Print vbCrLf
          textStream.WriteLine (String(110, "-"))
          Printer.Print String(110, "-")
          textStream.WriteLine "Number of returned mails registered :" & str(recsCreated)
          Printer.Print langChar + "⁄œœ œ›« — «·‘Ìﬂ«  «·„ÿ·Ê»…  :" & langChar & str(recsCreated) + langChar
          textStream.WriteLine (String(50, "-") & "END OF REPORT" & String(50, "-"))
          Printer.Print String(50, "-") & "‰Â«Ì… «· ﬁ—Ì—" & String(50, "-")
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


Public Sub headerPrint(branchCode As String)
   Dim branchName As String
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
      
   Set rs = db.OpenRecordset("select arabicname from branchinfo where branchcode = '" & branchCode & "'")
   
   If rs.recordCount > 0 Then
      branchName = rs(0)
   Else
      branchName = "—ﬁ„ «·›—⁄ Œÿ√ [" + branchCode + "]"
   End If
   
   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   page = page + 1
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   
   textStream.WriteLine ("«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì                                                 «· «—ÌŒ   : " & Format(Date$, "dd/mm/yyyy") & "      Time  : " & Format(Time, "hh:mm:ss"))
   
   Printer.Print "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì           (RETMAIL)                                            «· «—ÌŒ   : " & Format(tDay, "00") & "/" & _
                                                                                                                    Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   'Printer.Print "arab national bank    (RETMAIL)                                                         Date : " & Format(Date$, "dd/mm/yyyy")
   textStream.WriteLine ("                          RETURNED MAIL registered for " & formatDate(recvRetMailReport.reportDate) & langChar)
   Printer.Print "                                »—Ìœ „” —Ã⁄ „”Ã· » «—ÌŒ  " & formatDate(recvRetMailReport.reportDate) & langChar & _
                                        "                    «·Êﬁ  : " & Format(Time, "hh:mm:ss")
   textStream.WriteLine ("Branch : " + branchCode + "     " + branchName + langChar + _
                         "                                                                Page  : " + CStr(page) + langChar)
   Printer.Print "›—⁄ :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                  ’›ÕÂ  : " + CStr(page) + langChar
   'Printer.Print "Branch :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                 Page : " & CStr(page) & langChar
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   textStream.WriteLine ("Reference Number  " & "Letter type     " & _
                         "Customer Nubmer  " & "Customer Name           " & "Product ID  ")
   Printer.Print ("—ﬁ„ «·„—Ã⁄  " & "         ‰Ê⁄ «·—”«·…     " & _
                         "       —ﬁ„ «·⁄„Ì·  " & "   «”„ «·⁄„Ì·           " & "       —ﬁ„ «·„‰ Ã  ")
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   lines = 6
End Sub

Public Sub headerPrintEng(branchCode As String)
   Dim branchName As String
      
   Set rs = db.OpenRecordset("select arabicname from branchinfo where branchcode = '" & branchCode & "'")
   
   If rs.recordCount > 0 Then
      branchName = rs(0)
   Else
      branchName = "—ﬁ„ «·›—⁄ Œÿ√ [" + branchCode + "]"
   End If
   
   page = page + 1
   Printer.CurrentX = 0
   Printer.CurrentY = 0
  
   textStream.WriteLine ("«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì                                                 «· «—ÌŒ   : " & Format(Date$, "dd/mm/yyyy") & "      Time  : " & Format(Time, "hh:mm:ss"))
   'Printer.Print "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì           (RETMAIL)                           «· «—ÌŒ   : " + Format(Date$, "dd/mm/yyyy") + "      «·Êﬁ   : " + Format(Time, "hh:mm:ss")
   Printer.Print "arab national bank    (RETMAIL)                                                         Date : " & Format(Date$, "dd/mm/yyyy")
   textStream.WriteLine ("                          RETURNED MAIL registered for " & formatDate(recvRetMailReport.reportDate) & langChar)
   Printer.Print "                                Returned Mail registered for  " & formatDate(recvRetMailReport.reportDate) & langChar & _
                                        "                Time : " & Format(Time, "hh:mm:ss")
   textStream.WriteLine ("Branch : " + branchCode + "     " + branchName + langChar + _
                         "                                                                Page  : " + CStr(page) + langChar)
   'Printer.Print "›—⁄ :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                   ’›ÕÂ  : " + CStr(page) + langChar
   Printer.Print "Branch :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                 Page : " & CStr(page) & langChar
   'textStream.WriteLine ("ÂÊÌ… «·„” Œœ„ :" + langChar + tUserid + langChar)
   'Printer.Print langChar + "ÂÊÌ… «·„” Œœ„ :" + langChar + tUserid + langChar
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   textStream.WriteLine ("Reference Number  " & "Letter type     " & _
                         "Customer Nubmer  " & "Customer Name           " & "Product ID  ")
   Printer.Print ("Reference Number  " & "    Letter type     " & _
                         "Customer Nubmer  " & "   Customer Name           " & "       Product ID  ")
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   lines = 6
End Sub

