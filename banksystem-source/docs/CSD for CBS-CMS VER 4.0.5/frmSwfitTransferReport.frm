VERSION 5.00
Begin VB.Form frmSwiftTransferReport 
   BackColor       =   &H00BFD87E&
   Caption         =   "Daily Swift Transfer report "
   ClientHeight    =   3150
   ClientLeft      =   495
   ClientTop       =   1515
   ClientWidth     =   10680
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3150
   ScaleWidth      =   10680
   Begin VB.Frame FrameRecordStatus 
      Height          =   615
      Left            =   1905
      TabIndex        =   8
      Tag             =   "10620"
      Top             =   420
      Width           =   8550
      Begin VB.OptionButton optSummary 
         Caption         =   "Summary"
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
         Left            =   7395
         TabIndex        =   13
         Tag             =   "8550"
         Top             =   240
         Width           =   1095
      End
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
         Left            =   3465
         TabIndex        =   12
         Tag             =   "8550"
         Top             =   240
         Width           =   1125
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
         Left            =   2145
         TabIndex        =   11
         Tag             =   "8550"
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton optPendingWithBranch 
         Caption         =   "Pending with Central unit"
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
         Height          =   300
         Left            =   4695
         TabIndex        =   10
         Tag             =   "8550"
         Top             =   225
         Width           =   2670
      End
      Begin VB.OptionButton optInitiatedFromBranch 
         Caption         =   "Pending for update"
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
         Height          =   315
         Left            =   120
         TabIndex        =   9
         Tag             =   "8550"
         Top             =   195
         Value           =   -1  'True
         Width           =   1995
      End
   End
   Begin VB.Frame frameReportDate 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   510
      Left            =   4710
      TabIndex        =   4
      Top             =   1485
      Width           =   2010
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
         Left            =   90
         TabIndex        =   7
         Tag             =   "2010"
         Text            =   "01"
         Top             =   90
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
         Left            =   690
         TabIndex        =   6
         Tag             =   "2010"
         Text            =   "01"
         Top             =   105
         Width           =   615
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
         Height          =   360
         Left            =   1305
         MaxLength       =   4
         TabIndex        =   5
         Tag             =   "2010"
         Top             =   90
         Width           =   615
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5595
      TabIndex        =   2
      Tag             =   "10620"
      ToolTipText     =   "Cancel"
      Top             =   2340
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
      Left            =   3435
      TabIndex        =   1
      Tag             =   "10620"
      ToolTipText     =   "Generate Report"
      Top             =   2355
      Width           =   2175
   End
   Begin VB.Label lblReportType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Report Type"
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
      Left            =   510
      TabIndex        =   3
      Tag             =   "10620"
      Top             =   570
      Width           =   1335
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
      Left            =   3225
      TabIndex        =   0
      Tag             =   "10620"
      Top             =   1605
      Width           =   1335
   End
End
Attribute VB_Name = "frmSwiftTransferReport"
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
Public coinPrecision As Integer
Public coinDenomination As Integer
Public tDecimalPlace As String
Public recordNo As Integer

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

Private Sub cmbReportDate_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
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

Private Sub cmbReportMonth_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdGenerateReport_Click()
    Dim tReportDate As String
    Dim reportType As String
    Dim strmsglen As String
    
    tReportDate = txtReportYear & cmbReportMonth & cmbReportDate
    If Len(Trim(tReportDate)) > 0 Then
       If validDate(tReportDate) = False Then
          MsgBox errInvalidDate(UserLang)
          cmbReportDate.SetFocus
          Exit Sub
       End If
    Else
       tReportDate = Space(8)
    End If
    If optInitiatedFromBranch Then
       reportType = "0"
    ElseIf optCompleted Then
       reportType = "1"
    ElseIf optRejected Then
       reportType = "2"
    ElseIf optPendingWithBranch Then
       reportType = "3"
    Else
       getSwiftTransferSummaryDetails
       Exit Sub
    End If
    
    formatSwiftTransferEnqRequest "00000", tReportDate, Space(4), reportType
   
    frmSwiftTransferReport.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmSwiftTransferReport.MousePointer = vbNormal
       Exit Sub
    End If
    frmSwiftTransferReport.MousePointer = vbDefault
    parseSwiftTransferEnquiryDetails
    
    If recvSwiftTranferEnqMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvSwiftTranferEnqMsg.aRemarks
       Else
          MsgBox recvSwiftTranferEnqMsg.eRemarks
       End If
       Exit Sub
    End If
    
    page = 1
    
    If reportType = "0" Then
       loadResponseInLocalDb tReportDate, reportType
       generateSwiftTransferBranchReport tReportDate, reportType
    Else
       generateSwiftTransferCentreReport tReportDate, reportType
    End If

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim i As Integer
    Dim num As String
        
    If UserLang = ARABIC Then
       'ChangePositions frmSwiftTransferReport, 7170
       ChangePositions frmSwiftTransferReport, 10800
       frmSwiftTransferReport.RightToLeft = True
    End If
    
    frmSwiftTransferReport.Caption = frmSwiftTransferReportCaption(0, UserLang)
    lblReportType = frmSwiftTransferReportCaption(1, UserLang)
    optInitiatedFromBranch.Caption = frmSwiftTransferReportCaption(2, UserLang)
    optCompleted.Caption = frmSwiftTransferReportCaption(3, UserLang)
    optRejected.Caption = frmSwiftTransferReportCaption(4, UserLang)
    optPendingWithBranch.Caption = frmSwiftTransferReportCaption(5, UserLang)
    optSummary.Caption = frmSwiftTransferReportCaption(6, UserLang)
    lblEnterDate.Caption = frmSwiftTransferReportCaption(7, UserLang)
    cmdGenerateReport.Caption = frmSwiftTransferReportCaption(8, UserLang)
    cmdCancel.Caption = frmSwiftTransferReportCaption(9, UserLang)
    
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

Public Sub generateSwiftTransferCentreReport(reportDate As String, reportType As String)
    Dim i As Integer
    Dim reportFile As String
    Dim pendingStatus As String
    Dim oldBranchCode As String
    Dim strmsglen As String
    Dim recsAddressedToBranch As Integer
    Dim recsAddressedToMail As Integer
    Dim recsRejected As Integer
    Dim recsSuccessful As Integer, recsPending As Integer
    Dim recsTotal As Integer, branchTotal As Integer
    Dim tmpStr As String, tCode As String
    Dim tranAmt As Double, amtToPrint As Double
    Dim requestType As String
    Dim response
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    
    branchTotal = 0
    recsTotal = 0

    langChar = Chr$(253)  ' for english
    
    'langChar = Chr$(254)  ' for arabic
    
    oldBranchCode = "----"
    
    Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.FontName = "Courier New (Arabic)"
    Printer.fontSize = 12
    Printer.FontBold = False
    Printer.RightToLeft = False '  for english
    'Printer.RightToLeft = True ' for arabic
    
    recsTotal = 0
    Do While True
        On Error Resume Next
        For i = 1 To Val(recvSwiftTranferEnqMsg.noOfRecs)
            If recvSwiftTranferEnqMsg.details(i).branchCode <> oldBranchCode Then
               If oldBranchCode <> "----" Then
                  Printer.Print String(110, "-")
                  Printer.Print "Total  for Branch:" & oldBranchCode & "   " & branchTotal
                  Printer.Print String(110, "-")
                  Printer.NewPage
                  'Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
               End If
               oldBranchCode = recvSwiftTranferEnqMsg.details(i).branchCode
               branchTotal = 0
               swiftTransferCentreHeaderPrint oldBranchCode, reportType
            End If
            recsTotal = recsTotal + 1
            branchTotal = branchTotal + 1
            tCode = recvSwiftTranferEnqMsg.details(i).pendingStatus
            
            If tCode = "3" Then
               recsRejected = recsRejected + 1
               pendingStatus = "Rejected"
            ElseIf tCode = "1" Then
               recsPending = recsPending + 1
               pendingStatus = "Pending with supervisor"
            ElseIf tCode = "2" Then
               recsPending = recsPending + 1
               pendingStatus = "Pending with CSO"
            Else
               recsSuccessful = recsSuccessful + 1
               pendingStatus = "Completed "
            End If
            
            pendingStatus = tCode & "-" & pendingStatus
            
            tCode = recvSwiftTranferEnqMsg.details(i).transCurr
            Set rs = db.OpenRecordset("select arabicname, englishname,decimalplace from currencyinfo " & _
                                      "where isocurrcode = '" & tCode & "'")
            If rs.recordCount > 0 Then
               tDecimalPlace = rs(2)
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
           
            If Not IsNumeric(Right(Trim(recvSwiftTranferEnqMsg.details(i).transAmt), 1)) Then
               tmpStr = "-" & bmAmtToDbl(recvSwiftTranferEnqMsg.details(i).transAmt)
               tranAmt = CDbl(tmpStr)
            Else
               tranAmt = CDbl(recvSwiftTranferEnqMsg.details(i).transAmt)
            End If
                 
            amtToPrint = tranAmt / coinDenomination
            
            Printer.Print recvSwiftTranferEnqMsg.details(i).transRefNo & _
                     "      " & formatDate(recvSwiftTranferEnqMsg.details(i).transDate) & _
                     "    " & recvSwiftTranferEnqMsg.details(i).transCurr & _
                     " " & Format(Format(amtToPrint, "##,###,###,###,##0" & _
                            IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@") & _
                     " " & recvSwiftTranferEnqMsg.details(i).drAccNo & _
                     "  " & Mid$(recvSwiftTranferEnqMsg.details(i).senderName, 1, 25) & _
                     "  " & pendingStatus
            Printer.Print recvSwiftTranferEnqMsg.details(i).csoUserId & _
                     "   " & formatDate(Mid$(recvSwiftTranferEnqMsg.details(i).csoActionDateTime, 1, 8)) & " " & _
                             formatTime(Mid$(recvSwiftTranferEnqMsg.details(i).csoActionDateTime, 9, 6)) & _
                     "   " & recvSwiftTranferEnqMsg.details(i).supervisorId & _
                     "   " & formatDate(Mid$(recvSwiftTranferEnqMsg.details(i).approvedDateTime, 1, 8)) & " " & _
                             formatTime(Mid$(recvSwiftTranferEnqMsg.details(i).approvedDateTime, 9, 6))
            Printer.Print
            lines = lines + 1
            lines = lines + 1
            lines = lines + 1
            If lines > 40 Then
               Printer.NewPage
               page = page + 1
               swiftTransferCentreHeaderPrint oldBranchCode, reportType
            End If
       Next
       If recvSwiftTranferEnqMsg.noOfRecs = "20" Then
          formatSwiftTransferEnqRequest recvSwiftTranferEnqMsg.lastRecCount, reportDate, Space(4), reportType
          If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
             LoadError = True
             frmSwiftTransferReport.MousePointer = vbNormal
             Exit Sub
          End If
          frmSwiftTransferReport.MousePointer = vbNormal
   
          parseSwiftTransferEnquiryDetails
      
          If recvSwiftTranferEnqMsg.status <> "000" Then
             Exit Do
          End If
          
          If recvSwiftTranferEnqMsg.noOfRecs = "00" Then
             Exit Do
          End If
       Else
          Exit Do
       End If
    Loop
    
    Printer.Print String(110, "-")
    If oldBranchCode <> "----" Then
       Printer.Print langChar & "  Total  for Branch:" & oldBranchCode & langChar & "   " & branchTotal
    End If
    
    Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
    'Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    Printer.Print String(110, "-")
    Printer.EndDoc
    
'    tmpStr = errWannaPrint(UserLang)
'    response = MsgBox(tmpStr, vbYesNo)
'    If response = vbYes Then
'       Printer.EndDoc
'    Else
'       Printer.KillDoc
'    End If
End Sub

Public Sub generateSwiftTransferBranchReport(reportDate As String, reportType As String)
    Dim i As Integer
    Dim reportFile As String
    Dim pendingStatus As String, requestTypeDesc As String
    Dim oldBranchCode As String
    Dim strmsglen As String
    Dim recsBranchTotal As Integer
    Dim recsSuccessful As Integer, recsPending As Integer
    Dim recsTotal As Integer
    Dim tmpStr As String, tCode As String
    Dim requestType As String
    Dim tranAmt As Double, amtToPrint As Double
    Dim response
    Dim tmpRs As Recordset
    Dim objDc
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    
    recsBranchTotal = 0
    recsTotal = 0
    page = 1

    langChar = Chr$(253)  ' for english
    
    'langChar = Chr$(254)  ' for arabic
    
    oldBranchCode = "----"
        
    Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.FontName = "Courier New (Arabic)"
    Printer.fontSize = 12
    Printer.FontBold = False
    Printer.RightToLeft = False '  for english
    'Printer.RightToLeft = True ' for arabic
    
    Set rs = transDb.OpenRecordset("Select * from swiftTransferReportinfo")

   i = 0
   rs.MoveFirst
   Do While Not rs.EOF
       On Error Resume Next
       If rs("branchCode") <> oldBranchCode Then
          If oldBranchCode <> "----" Then
             Printer.Print String(110, "-")
             Printer.Print "  Total Swift Transfers  from Branch  " & oldBranchCode & " :" & recsBranchTotal
             Printer.Print String(110, "-")
             Printer.NewPage
             'Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
          End If
             oldBranchCode = rs("branchCode")
             recsBranchTotal = 0
             swiftTransferBranchHeaderPrint oldBranchCode, reportDate
       End If
       recsTotal = recsTotal + 1
       recsBranchTotal = recsBranchTotal + 1
       
       tCode = rs("transCurrency")
       Set tmpRs = db.OpenRecordset("select arabicname, englishname,decimalplace from currencyinfo " & _
                                 "where isocurrcode = '" & tCode & "'")
        If tmpRs.recordCount > 0 Then
           tDecimalPlace = tmpRs(2)
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
           
        If Not IsNumeric(Right(Trim(rs("transAmt")), 1)) Then
           tmpStr = "-" & bmAmtToDbl(rs("transAmt"))
           tranAmt = CDbl(tmpStr)
        Else
           tranAmt = CDbl(rs("transAmt"))
        End If
                 
        amtToPrint = tranAmt / coinDenomination
            
        Printer.Print "   " & rs("transRefNo") & "     " & formatDate(rs("issuedate")) & _
                      "      " & rs("transCurrency") & " " & Format(Format(amtToPrint, "##,###,###,###,##0" & _
                             IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@") & _
                      "  " & rs("debitAccNo") & "     " & rs("applicantName")
        lines = lines + 1
        If lines > 40 Then
           Printer.NewPage
           page = page + 1
           swiftTransferBranchHeaderPrint oldBranchCode, reportDate
        End If
        rs.MoveNext
    Loop
    Printer.Print vbCrLf
    Printer.Print String(110, "-")
    If oldBranchCode <> "----" Then
       Printer.Print "  Total Swift Transfers  from Branch  " & oldBranchCode & " :" & recsBranchTotal
       Printer.Print
       Printer.Print
    End If
    Printer.Print " Final Total transfers     :" & recsTotal
    'Printer.Print String(50, "-") & "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
    Printer.EndDoc
    
'    tmpStr = errWannaPrint(UserLang)
'    response = MsgBox(tmpStr, vbYesNo)
'    If response = vbYes Then
'       Printer.EndDoc
'    Else
'       Printer.KillDoc
'    End If
End Sub
Public Sub swiftTransferCentreHeaderPrint(branchCode As String, reportType)
   Dim branchName As String * 30
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
   Dim reportName As String
   Dim reportTitle As String
      
   Set rs = db.OpenRecordset("select englishname from branchinfo where branchcode = '" & branchCode & "'")
   
   If rs.recordCount > 0 Then
      branchName = rs(0)
   Else
      branchName = "[" & branchCode & "]-Unknown"
   End If
   
   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   If reportType = "1" Then
      reportName = "CSD07"
      reportTitle = "Report on completed swift transfer by transfer centre " & IIf(recvSwiftTranferEnqMsg.reqdDate = Space(8), "               ", "for  " & formatDate(recvSwiftTranferEnqMsg.reqdDate))
   ElseIf reportType = "2" Then
      reportName = "CSD08"
      reportTitle = "Report on rejected swift transfer by transfer centre  " & IIf(recvSwiftTranferEnqMsg.reqdDate = Space(8), "               ", "for  " & formatDate(recvSwiftTranferEnqMsg.reqdDate))
   Else
      reportName = "CSD09"
      reportTitle = "Report on swift transfer pending at transfer centre        " & Space(10)
   End If
   
   
   Printer.Print "arab national bank         (" & reportName & ")                                                         Date : " & Format(tDay, "00") & "/" & _
                                                                                                                     Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   Printer.Print "              " & reportTitle & _
                                        "        Time : " & Format(Time, "hh:mm:ss")
   Printer.Print "Branch :" & branchCode & "     " & branchName & _
                             "                                            Page : " & page
   Printer.Print String(110, "-")
   
   Printer.Print "Trans.Ref.No.  " & "  Trans.Date  " & "  Trans. Amount   " & "  Applicant A/c No.    " & "  Applicant Name    " & "  Status    "
   Printer.Print "CSO ID     " & "CSO action Date & Time      " & "Supervisor Id     " & "   Supervisor action Date & Time "
   Printer.Print String(110, "-")
   lines = 7

End Sub

Public Sub swiftTransferBranchHeaderPrint(branchCode As String, reportDate As String)
   Dim branchName As String * 30
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
   Dim tmpRs As Recordset
      
   Set tmpRs = db.OpenRecordset("select englishname from branchinfo where branchcode = '" & branchCode & "'")
   
   If tmpRs.recordCount > 0 Then
      branchName = tmpRs(0)
   Else
      branchName = branchCode & "-Not defined in Local"
   End If
   tmpRs.Close
   
   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   
   Printer.Print "arab national bank         (CSD06)                                                   Date : " & Format(tDay, "00") & "/" & _
                                                                                                                    Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   Printer.Print "              Report on Swift transfer initiated from branch " & IIf(reportDate = Space(8), "     ", "for  " & formatDate(reportDate)) & _
                                        "         Time : " & Format(Time, "hh:mm:ss")
                                        
   Printer.Print "Branch :" & branchCode & "     " & branchName & _
                             "                                      Page : " & page
   Printer.Print String(110, "-")
   
   Printer.Print " Trans.Ref.No.  " & "  Trans.Date  " & "  Trans. Amount   " & "  Applicant A/c No.    " & "  Applicant Name    "
   Printer.Print String(110, "-")
   lines = 6

End Sub

Private Sub optCompletedAtSwiftCentre_Click()
    frameReportDate.Enabled = True
End Sub

Private Sub optIniatedFromBranch_Click()
    frameReportDate.Enabled = True
End Sub

Private Sub FrameRecordStatus_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optCompleted_Click()
   frameReportDate.Enabled = True
   cmbReportDate = ""
   cmbReportMonth = ""
   txtReportYear = ""
End Sub

Private Sub optInitiatedFromBranch_Click()
    frameReportDate.Enabled = True
    cmbReportDate = ""
    cmbReportMonth = ""
    txtReportYear = ""
End Sub

Private Sub optPendingWithBranch_Click()
    cmbReportDate = Space(2)
    cmbReportMonth = Space(2)
    txtReportYear = Space(4)
    frameReportDate.Enabled = False
End Sub

Private Sub optRejected_Click()
    frameReportDate.Enabled = True
    cmbReportDate = ""
    cmbReportMonth = ""
    txtReportYear = ""
End Sub

Private Sub optSummary_Click()
    cmbReportDate = Space(2)
    cmbReportMonth = Space(2)
    txtReportYear = Space(4)
    frameReportDate.Enabled = False
End Sub
Public Sub loadLocalDb()
    Dim noOfTrans As Integer
    Dim mQry As String
    Dim i As Integer
    noOfTrans = Val(recvSwiftTranferEnqMsg.noOfRecs)
    On Error GoTo err_handler
    For i = 1 To noOfTrans
        mQry = "insert into swiftTransferReportinfo (seqno, branchCode, transrefno, issuedate, valuedate, debitAccNo, transCurrency," & _
            "transAmt, applicantName, pendingStatus) values (" & recordNo & ",'" & recvSwiftTranferEnqMsg.details(i).branchCode & "','" & recvSwiftTranferEnqMsg.details(i).transRefNo & _
            "','" & recvSwiftTranferEnqMsg.details(i).transDate & "','" & recvSwiftTranferEnqMsg.details(i).valueDate & "','" & _
          recvSwiftTranferEnqMsg.details(i).drAccNo & "','" & recvSwiftTranferEnqMsg.details(i).transCurr & "','" & _
          recvSwiftTranferEnqMsg.details(i).transAmt & "','" & recvSwiftTranferEnqMsg.details(i).senderName & "','" & _
          recvSwiftTranferEnqMsg.details(i).pendingStatus & "')"
        transDb.Execute (mQry)
        If Err.Number = 0 Then
           recordNo = recordNo + 1
        End If
    Next i
    Exit Sub
    
err_handler:
   LogData "Error   " & Err.Number & "    " & Err.Description & "  during transaction loading into local db"
   Resume Next
End Sub

Public Sub loadResponseInLocalDb(reportDate As String, reportType As String)
    recordNo = 1
    If recvSwiftTranferEnqMsg.noOfRecs = "00" Then
       MsgBox errNoMatchFound(UserLang)
       frmSwiftTransferReport.MousePointer = vbNormal
       Exit Sub
     End If
     If reportType <> "4" Then
        transDb.Execute ("delete from swiftTransferReportInfo")
     End If
   
     On Error Resume Next
   
     loadLocalDb
     Do While recvSwiftTranferEnqMsg.noOfRecs = "20"
        frmSwiftTransferReport.MousePointer = vbHourglass
        formatSwiftTransferEnqRequest recvSwiftTranferEnqMsg.lastRecCount, reportDate, Space(4), reportType
        If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
           LoadError = True
           frmSwiftTransferReport.MousePointer = vbNormal
           Exit Sub
        End If
        frmSwiftTransferReport.MousePointer = vbNormal
   
        parseSwiftTransferEnquiryDetails
      
        If recvSwiftTranferEnqMsg.status <> "000" Then
           If UserLang = ARABIC Then
              MsgBox recvSwiftTranferEnqMsg.aRemarks
           Else
              MsgBox recvSwiftTranferEnqMsg.eRemarks
           End If
           frmSwiftTransferReport.MousePointer = vbNormal
           Exit Do
        End If
        loadLocalDb
     Loop
End Sub

Public Sub getSwiftTransferSummaryDetails()
    Dim reportType As String
        
    formatSwiftTransferEnqRequest "00000", Space(8), Space(4), "0"
   
    frmSwiftTransferReport.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmSwiftTransferReport.MousePointer = vbNormal
       Exit Sub
    End If
    frmSwiftTransferReport.MousePointer = vbDefault
    parseSwiftTransferEnquiryDetails
    
    If recvSwiftTranferEnqMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvSwiftTranferEnqMsg.aRemarks
       Else
          MsgBox recvSwiftTranferEnqMsg.eRemarks
       End If
       Exit Sub
    End If
    
    page = 0
    
    loadResponseInLocalDb Space(8), "0"
    
    formatSwiftTransferEnqRequest "00000", Space(8), Space(4), "4"
    
    frmSwiftTransferReport.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmSwiftTransferReport.MousePointer = vbNormal
       Exit Sub
    End If
    frmSwiftTransferReport.MousePointer = vbNormal
    parseSwiftTransferEnquiryDetails
    
    If recvSwiftTranferEnqMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvSwiftTranferEnqMsg.aRemarks
       Else
          MsgBox recvSwiftTranferEnqMsg.eRemarks
       End If
       Exit Sub
    End If
    
    page = 0
    
    loadResponseInLocalDb Space(8), "4"
    
    generateSwiftTransferSummaryReport
    
End Sub

Public Sub generateSwiftTransferSummaryReport()
    Dim i As Integer
    Dim oldBranchCode As String
    Dim recsInitiatedFromBrnTotal As Integer
    Dim recsSuccessful As Integer, recsPending As Integer, recsRejected
    Dim finalTotInitiatedFromBrn As Integer, finalTotSuccessful As Integer
    Dim finalTotPending As Integer, finalTotRejected As Integer
    Dim tmpStr As String, tCode As String
    Dim response
    Dim tmpRs As Recordset
    Dim objDc
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    Dim branchName As String
      
   recsInitiatedFromBrnTotal = 0
   recsSuccessful = 0
   recsPending = 0
   recsRejected = 0
   finalTotInitiatedFromBrn = 0
   finalTotSuccessful = 0
   finalTotPending = 0
   finalTotRejected = 0
    
   page = 1

   langChar = Chr$(253)  ' for english
    
   'langChar = Chr$(254)  ' for arabic
    
   oldBranchCode = "----"
        
   Printer.Orientation = vbPRORLandscape    ' for landscape
   Printer.FontName = "Courier New (Arabic)"
   Printer.fontSize = 12
   Printer.FontBold = False
   Printer.RightToLeft = False '  for english
    'Printer.RightToLeft = True ' for arabic
   
   Set rs = transDb.OpenRecordset("Select * from swiftTransferReportinfo")

   i = 0
   swiftTransferSummaryHeaderPrint
   rs.MoveFirst
   Do While Not rs.EOF
       On Error Resume Next
       If rs("branchCode") <> oldBranchCode Then
          If oldBranchCode <> "----" Then
             Set tmpRs = db.OpenRecordset("select englishname from branchinfo where branchcode = '" & oldBranchCode & "'")
   
             If tmpRs.recordCount > 0 Then
                branchName = tmpRs(0)
             Else
                branchName = oldBranchCode & "-Not defined in Local"
             End If
             tmpRs.Close
             Printer.Print oldBranchCode & "    " & Format(branchName, "!" & String(30, "@")) & "         " & Format(recsInitiatedFromBrnTotal, "####0") & _
                           "            " & Format(recsSuccessful, "####0") & "               " & Format(recsRejected, "####0") & _
                           "                " & Format(recsPending, "####0")
             Printer.Print
             lines = lines + 1
             lines = lines + 1
             If lines > 40 Then
                Printer.NewPage
                page = page + 1
                swiftTransferSummaryHeaderPrint
             End If
          End If
          oldBranchCode = rs("branchCode")
          recsInitiatedFromBrnTotal = 0
          recsSuccessful = 0
          recsPending = 0
          recsRejected = 0
       End If
       If rs("pendingStatus") = " " Or rs("pendingstatus") = "" Then
          recsInitiatedFromBrnTotal = recsInitiatedFromBrnTotal + 1
          finalTotInitiatedFromBrn = finalTotInitiatedFromBrn + 1
       ElseIf rs("pendingstatus") = "9" Then
          recsSuccessful = recsSuccessful + 1
          finalTotSuccessful = finalTotSuccessful + 1
       ElseIf rs("pendingstatus") = "3" Then
          recsRejected = recsRejected + 1
          finalTotRejected = finalTotRejected + 1
       ElseIf rs("pendingstatus") = "1" Or rs("pendingstatus") = "2" Then
          recsPending = recsPending + 1
          finalTotPending = finalTotPending + 1
       End If
       rs.MoveNext
    Loop

    If oldBranchCode <> "----" Then
       Set tmpRs = db.OpenRecordset("select englishname from branchinfo where branchcode = '" & oldBranchCode & "'")
   
       If tmpRs.recordCount > 0 Then
          branchName = tmpRs(0)
       Else
          branchName = oldBranchCode & "-Not defined in Local"
       End If
       tmpRs.Close
       Printer.Print oldBranchCode & "    " & Format(branchName, "!" & String(30, "@")) & "         " & Format(recsInitiatedFromBrnTotal, "####0") & _
                           "            " & Format(recsSuccessful, "####0") & "               " & Format(recsRejected, "####0") & _
                           "                " & Format(recsPending, "####0")
    End If
    Printer.Print String(110, "-")
    Printer.Print " Final Total :" & Space(22) & "          " & Format(finalTotInitiatedFromBrn, "####0") & _
                           "            " & Format(finalTotSuccessful, "####0") & "               " & Format(finalTotRejected, "####0") & _
                           "                " & Format(finalTotPending, "####0")
    Printer.Print String(110, "-")
    'Printer.Print String(50, "-") & "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
    Printer.EndDoc
    
'    tmpStr = errWannaPrint(UserLang)
'    response = MsgBox(tmpStr, vbYesNo)
'    If response = vbYes Then
'       Printer.EndDoc
'    Else
'       Printer.KillDoc
'    End If
End Sub

Public Sub swiftTransferSummaryHeaderPrint()
   Dim branchName As String * 30
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
      
   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   
   Printer.Print "arab national bank         (CSD10)                                                        Date : " & Format(tDay, "00") & "/" & _
                                                                                                                    Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   Printer.Print "                        Summary Report on Swift transfer                     " & _
                                        "             Time : " & Format(Time, "hh:mm:ss")
                                        
   Printer.Print "                 " & Space(30) & _
                             "                                           Page : " & page
   Printer.Print String(110, "-")
   
   Printer.Print "Branch   " & " Branch Name       " & "  Total pending for update" & " Total Completed  " & "  Total Rejected   " & "  Total Pending   "
   Printer.Print String(110, "-")
   lines = 6


End Sub

Private Sub txtReportYear_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
