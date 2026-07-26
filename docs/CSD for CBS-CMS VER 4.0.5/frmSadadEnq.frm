VERSION 5.00
Begin VB.Form frmSadadEnq 
   BackColor       =   &H00BFD87E&
   Caption         =   "Utility Bill Enquiry "
   ClientHeight    =   8370
   ClientLeft      =   1800
   ClientTop       =   285
   ClientWidth     =   11685
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8370
   ScaleWidth      =   11685
   WindowState     =   2  'Maximized
   Begin VB.Frame frameIncludePaidBills 
      Height          =   495
      Left            =   8280
      TabIndex        =   31
      Top             =   4800
      Width           =   1575
      Begin VB.OptionButton optInclPaidBillsYes 
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   11
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
      Begin VB.OptionButton optInclPaidBillsNo 
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   12
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.Frame frameIncludePayments 
      Height          =   495
      Left            =   4440
      TabIndex        =   29
      Top             =   4800
      Width           =   1575
      Begin VB.OptionButton optInclPaymtsNo 
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   10
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optInclPaymtsYes 
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   9
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
   End
   Begin VB.TextBox txtStartYear 
      Height          =   285
      Left            =   5640
      MaxLength       =   4
      TabIndex        =   5
      Top             =   3840
      Width           =   615
   End
   Begin VB.ComboBox cmbStartMonth 
      Height          =   315
      Left            =   5040
      TabIndex        =   4
      Top             =   3840
      Width           =   615
   End
   Begin VB.ComboBox cmbStartDate 
      Height          =   315
      Left            =   4440
      TabIndex        =   3
      Top             =   3840
      Width           =   615
   End
   Begin VB.ComboBox cmbEndDate 
      Height          =   315
      Left            =   4440
      TabIndex        =   6
      Top             =   4320
      Width           =   615
   End
   Begin VB.ComboBox cmbEndMonth 
      Height          =   315
      Left            =   5040
      TabIndex        =   7
      Top             =   4320
      Width           =   615
   End
   Begin VB.TextBox txtEndYear 
      Height          =   285
      Left            =   5640
      MaxLength       =   4
      TabIndex        =   8
      Top             =   4320
      Width           =   615
   End
   Begin VB.TextBox txtBillNo 
      Height          =   285
      Left            =   4440
      TabIndex        =   1
      Top             =   2640
      Width           =   3015
   End
   Begin VB.CommandButton cmdBillDetails 
      Caption         =   "Get Bill Details"
      Height          =   375
      Left            =   3120
      TabIndex        =   13
      Top             =   6240
      Width           =   2415
   End
   Begin VB.TextBox txtCustomerNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3240
      MaxLength       =   7
      TabIndex        =   19
      Top             =   720
      Width           =   1575
   End
   Begin VB.TextBox txtSubscriptionNo 
      Height          =   285
      Left            =   4440
      TabIndex        =   2
      Top             =   3240
      Width           =   3015
   End
   Begin VB.ComboBox cmbCompanyId 
      Height          =   315
      Left            =   4440
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   2040
      Width           =   3015
   End
   Begin VB.TextBox txtCustName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6840
      TabIndex        =   18
      Top             =   720
      Width           =   3015
   End
   Begin VB.ComboBox cmbIdType 
      Enabled         =   0   'False
      Height          =   315
      Left            =   3240
      Style           =   2  'Dropdown List
      TabIndex        =   17
      Top             =   1080
      Width           =   1575
   End
   Begin VB.TextBox txtIdNumber 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6840
      TabIndex        =   16
      Top             =   1080
      Width           =   1695
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Return to Main menu"
      Height          =   375
      Left            =   5880
      TabIndex        =   15
      ToolTipText     =   "Return to Main menu"
      Top             =   6240
      Width           =   2055
   End
   Begin VB.Label lblInclPaidBills 
      BackColor       =   &H00BFD87E&
      Caption         =   "Include Paid Bills"
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
      Left            =   6240
      TabIndex        =   32
      Top             =   4920
      Width           =   1815
   End
   Begin VB.Label lblIncludePayments 
      BackColor       =   &H00BFD87E&
      Caption         =   "Include Payments"
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
      Left            =   1800
      TabIndex        =   30
      Top             =   4920
      Width           =   2415
   End
   Begin VB.Label lblStartDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Start Date"
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
      Left            =   1800
      TabIndex        =   28
      Top             =   3840
      Width           =   1335
   End
   Begin VB.Label lblEndDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "To Date"
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
      Left            =   1800
      TabIndex        =   27
      Top             =   4320
      Width           =   1095
   End
   Begin VB.Label lblBillNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Bill Number"
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
      Left            =   1800
      TabIndex        =   26
      Top             =   2640
      Width           =   2175
   End
   Begin VB.Label lblCustomerNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Number"
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
      Left            =   600
      TabIndex        =   25
      Top             =   720
      Width           =   1935
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
      Left            =   1800
      TabIndex        =   24
      Top             =   2040
      Width           =   2055
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
      Left            =   1800
      TabIndex        =   23
      Top             =   3240
      Width           =   2535
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name"
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
      Left            =   5040
      TabIndex        =   22
      Top             =   720
      Width           =   1935
   End
   Begin VB.Label lblIdType 
      BackColor       =   &H00BFD87E&
      Caption         =   "ID Type"
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
      Left            =   600
      TabIndex        =   21
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label lblIdNumber 
      BackColor       =   &H00BFD87E&
      Caption         =   "ID Number"
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
      Left            =   5040
      TabIndex        =   20
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Label lblUtilityBillEnquiry 
      BackColor       =   &H00BFD87E&
      Caption         =   "Utility Bill Enquiry"
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
      Left            =   4320
      TabIndex        =   14
      Top             =   0
      Width           =   3015
   End
End
Attribute VB_Name = "frmSadadEnq"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmbEndDate_Change()
      If Len(RTrim(cmbEndDate.text)) <> 0 Then
         If Len(cmbEndDate.text) = 2 Then
            If cmbEndDate < 1 Or _
               cmbEndDate > 31 Then
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

Private Sub cmbEndMonth_Change()
      If Len(RTrim(cmbEndMonth.text)) <> 0 Then
         If Len(cmbEndMonth.text) = 2 Then
            If cmbEndMonth < 1 Or cmbEndMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbEndMonth.text = ""
               cmbEndMonth.SetFocus
            Else
               On Error Resume Next
               txtEndYear.SetFocus
            End If
         End If
      End If
End Sub

Private Sub cmbStartDate_Change()
    If Len(RTrim(cmbStartDate.text)) <> 0 Then
         If Len(cmbStartDate.text) = 2 Then
            If cmbStartDate < 1 Or _
               cmbStartDate > 31 Then
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

Private Sub cmbStartMonth_Change()
    If Len(RTrim(cmbStartMonth.text)) <> 0 Then
         If Len(cmbStartMonth.text) = 2 Then
            If cmbStartMonth < 1 Or cmbStartMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbStartMonth.text = ""
               cmbStartMonth.SetFocus
            Else
               On Error Resume Next
               txtStartYear.SetFocus
            End If
         End If
      End If
End Sub

Private Sub cmdBillDetails_Click()
    Dim tCode As String
    Dim errorMsg As String
    Dim mQry As String, tmpStr As String
    Dim startDate As String, endDate As String
    Dim strmsglen As String
    Dim i As Integer
    
    startDate = Format(txtStartYear, "0000") & Format(cmbStartMonth, "00") & _
                               Format(cmbStartDate, "00")
    endDate = Format(txtEndYear, "0000") & Format(cmbEndMonth, "00") & _
                               Format(cmbEndDate, "00")

    
    If Len(RTrim(startDate)) > 0 And Len(RTrim(endDate)) > 0 Then
       On Error Resume Next
       If CLng(endDate) < CLng(startDate) Then
          MsgBox errStartEndDate(UserLang) '"Start Date should be greater than the end date...Please Re-enter.."
          Exit Sub
       End If
       On Error GoTo 0
    End If
    
    formatBillRequestMsg
   
    SendMsg = billEnquiryMsg.msgLen & billEnquiryMsg.service & billEnquiryMsg.homeBranch & _
              billEnquiryMsg.userId & billEnquiryMsg.langInd & billEnquiryMsg.custNo & _
              billEnquiryMsg.idType & billEnquiryMsg.idNo & billEnquiryMsg.subscriptionNo & _
              billEnquiryMsg.companyId & billEnquiryMsg.newLangId & billEnquiryMsg.billNo & _
              billEnquiryMsg.startDate & billEnquiryMsg.endDate & billEnquiryMsg.inclPayments & _
              billEnquiryMsg.inclPaidBills & Space(50)
            
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    
    frmSadadEnq.MousePointer = vbHourglass
    cmdBillDetails.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmSadadEnq.MousePointer = vbDefault
       cmdBillDetails.Enabled = True
       Exit Sub
    End If
    frmSadadEnq.MousePointer = vbDefault
    cmdBillDetails.Enabled = True
        
    parseBillRequestMsg
    
    If recvBillEnqMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvBillEnqMsg.aRemarks
       Else
          MsgBox recvBillEnqMsg.eRemarks
       End If
       Exit Sub
    End If
    
    If Trim(recvBillEnqMsg.errorCode) <> "0" And Trim(recvBillEnqMsg.errorCode) <> "0040" Then
       tCode = recvBillEnqMsg.errorCode
       mQry = "select * from sadaderrorinfo where errorcode = '" & tCode & "'"
       Set rs = db.OpenRecordset(mQry)
       If rs.recordCount > 0 Then
          If UserLang = ARABIC Then
             tmpStr = tCode & "-" & rs("arabicdescription")
          Else
             tmpStr = tCode & "-" & rs("englishdescription")
          End If
       Else
          tmpStr = tCode & "-" & "Not defined in local DB"
       End If
       MsgBox errError(UserLang) & "(Error Code) [" & tmpStr & "] " & errRecdFromSADAD(UserLang)
       Exit Sub
    End If
    
    If Trim(recvBillEnqMsg.statusCode) <> "0" And Trim(recvBillEnqMsg.statusCode) <> "0040" Then
       tCode = recvBillEnqMsg.statusCode
       mQry = "select * from sadadstatusinfo where statuscode = '" & tCode & "'"
       Set rs = db.OpenRecordset(mQry)
       If rs.recordCount > 0 Then
          If UserLang = ARABIC Then
             tmpStr = tCode & "-" & rs("arabicdescription")
          Else
             tmpStr = tCode & "-" & rs("englishdescription")
          End If
       Else
          tmpStr = tCode & "-" & "Not defined in local DB"
       End If
       MsgBox errError(UserLang) & "(Status Code) [" & tmpStr & "] " & errRecdFromSADAD(UserLang)
       Exit Sub
    End If
    
    i = 0
    
    frmSadadDetail.txtIdNumber = txtIdNumber
    tCode = Mid$(cmbIdType, 1, 1)
    If Len(RTrim(tCode)) <> 0 Then
       For i = 0 To frmSadadDetail.cmbIdType.ListCount
           If Mid(frmSadadDetail.cmbIdType.List(i), 1, 1) = tCode Then
              frmSadadDetail.cmbIdType.ListIndex = i
              Exit For
           End If
       Next i
    Else
       frmSadadDetail.cmbIdType.ListIndex = -1
    End If
    If i > frmSadadDetail.cmbIdType.ListCount Then
       frmSadadDetail.cmbIdType.ListIndex = -1
    End If
    
'    tCode = Mid$(cmbCompanyId, 1, 4)
'    If Len(RTrim(tCode)) <> 0 Then
'       For i = 0 To frmSadadDetail.cmbCompanyId.ListCount
'           If Mid(frmSadadDetail.cmbCompanyId.List(i), 1, 4) = tCode Then
'              frmSadadDetail.cmbCompanyId.ListIndex = i
'              Exit For
'           End If
'       Next i
'    Else
'       frmSadadDetail.cmbCompanyId.ListIndex = -1
'    End If
'    If i > frmSadadDetail.cmbCompanyId.ListCount Then
'       frmSadadDetail.cmbCompanyId.ListIndex = -1
'    End If
'    frmSadadDetail.txtSubscriptionNo = txtSubscriptionNo
    
    fillSadadDetailFrm 1

End Sub
Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    Dim num As String
    Dim i As Integer
    
    If UserLang = ARABIC Then
       ChangePositions frmSadadEnq, 11800
       frmSadadEnq.RightToLeft = True
    End If
    
    frmSadadEnq.Caption = frmSadadEnqCaption(0, UserLang)
    frmSadadEnq.lblUtilityBillEnquiry.Caption = frmSadadEnqCaption(0, UserLang)
    frmSadadEnq.lblCustomerNo.Caption = frmSadadEnqCaption(1, UserLang)
    frmSadadEnq.lblCustName.Caption = frmSadadEnqCaption(2, UserLang)
    frmSadadEnq.lblidType.Caption = frmSadadEnqCaption(3, UserLang)
    frmSadadEnq.lblIdNumber.Caption = frmSadadEnqCaption(4, UserLang)
    frmSadadEnq.lblCompanyId.Caption = frmSadadEnqCaption(5, UserLang)
    frmSadadEnq.lblBillNo.Caption = frmSadadEnqCaption(6, UserLang)
    frmSadadEnq.lblSubscriptionNo.Caption = frmSadadEnqCaption(7, UserLang)
    frmSadadEnq.lblStartDate.Caption = frmSadadEnqCaption(8, UserLang)
    frmSadadEnq.lblEndDate.Caption = frmSadadEnqCaption(9, UserLang)
    frmSadadEnq.lblIncludePayments.Caption = frmSadadEnqCaption(10, UserLang)
    frmSadadEnq.lblInclPaidBills.Caption = frmSadadEnqCaption(11, UserLang)
    frmSadadEnq.optInclPaymtsYes.Caption = frmSadadEnqCaption(12, UserLang)
    frmSadadEnq.optInclPaymtsNo.Caption = frmSadadEnqCaption(13, UserLang)
    frmSadadEnq.optInclPaidBillsYes.Caption = frmSadadEnqCaption(12, UserLang)
    frmSadadEnq.optInclPaidBillsNo.Caption = frmSadadEnqCaption(13, UserLang)
    frmSadadEnq.cmdBillDetails.Caption = frmSadadEnqCaption(14, UserLang)
    frmSadadEnq.cmdExit.Caption = frmSadadEnqCaption(15, UserLang)
    
    cmbStartDate.Clear
    cmbEndDate.Clear
    cmbStartMonth.Clear
    cmbEndMonth.Clear
    For i = 1 To 31
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
    
    mQry = "select * from idinfo where displayforutilityenq = '1'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      cmbIdType.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbIdType.AddItem rs("idcode") & "-" & rs("englishname")
         Else
            cmbIdType.AddItem rs("idcode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   frmSadadEnq.Show
    
End Sub

Public Sub formatBillRequestMsg()
    Dim tmpStr As String
    Dim tCode As String

    billEnquiryMsg.msgLen = "000000"
    billEnquiryMsg.service = "81"
    billEnquiryMsg.homeBranch = gBranchCode
    billEnquiryMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    billEnquiryMsg.langInd = "N" ' to indicate that we should use the new layout
'    If UserLang = ARABIC Then
'       billEnquiryMsg.langInd = "A"
'    Else
'       billEnquiryMsg.langInd = "E"
'    End If
    billEnquiryMsg.custNo = Format(txtCustomerNo, "!@@@@@@@")
    billEnquiryMsg.idType = Mid$(cmbIdType.text, 1, 1)
    billEnquiryMsg.idNo = Format(txtIdNumber, "!@@@@@@@@@@@@@@@")
    billEnquiryMsg.subscriptionNo = Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
    tCode = Trim(Mid$(cmbCompanyId, 1, 4))
    'billEnquiryMsg.companyId = Format(Mid$(cmbCompanyId, 1, 2), "!@@@@")
    billEnquiryMsg.companyId = Format(tCode, "!@@@@")
    If UserLang = ARABIC Then
       billEnquiryMsg.newLangId = "ar-sa"
    Else
       billEnquiryMsg.newLangId = "en-gb"
    End If
    billEnquiryMsg.billNo = Format(txtBillNo, "!@@@@@@@@@@@@@@@@@@@")
    billEnquiryMsg.startDate = Format(txtStartYear, "0000") & Format(cmbStartMonth, "00") & _
                               Format(cmbStartDate, "00")
    billEnquiryMsg.endDate = Format(txtEndYear, "0000") & Format(cmbEndMonth, "00") & _
                               Format(cmbEndDate, "00")
                               
    If optInclPaymtsYes = True Then
        billEnquiryMsg.inclPayments = "1"
    Else
        billEnquiryMsg.inclPayments = "0"
    End If
    
    If optInclPaidBillsYes = True Then
       billEnquiryMsg.inclPaidBills = "1"
    Else
       billEnquiryMsg.inclPaidBills = "0"
    End If
    
                               
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameBillDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameEnquiryDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub framePaymentDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtStartYear_Change()
     If Len(RTrim(txtStartYear)) <> 0 Then
        If Len(RTrim(txtStartYear)) = 4 Then
           cmbEndDate.SetFocus
        End If
     End If
End Sub
