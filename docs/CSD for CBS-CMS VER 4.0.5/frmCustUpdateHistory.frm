VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCustUpdateHistory 
   BackColor       =   &H00BFD87E&
   Caption         =   "Customer Update History"
   ClientHeight    =   5325
   ClientLeft      =   3720
   ClientTop       =   1020
   ClientWidth     =   6585
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5325
   ScaleWidth      =   6585
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtCustBranchCode 
      Enabled         =   0   'False
      Height          =   285
      Left            =   8400
      TabIndex        =   9
      Top             =   1320
      Width           =   735
   End
   Begin VB.TextBox txtCustName 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2880
      TabIndex        =   7
      Top             =   1320
      Width           =   2895
   End
   Begin VB.TextBox txtCustNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2880
      TabIndex        =   5
      Top             =   960
      Width           =   1695
   End
   Begin VB.CommandButton cmdViewDetail 
      Caption         =   "View Detail"
      Default         =   -1  'True
      Height          =   495
      Left            =   2640
      TabIndex        =   2
      ToolTipText     =   "View Detail"
      Top             =   7560
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   4680
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   7560
      Width           =   1695
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   960
      TabIndex        =   0
      ToolTipText     =   "More"
      Top             =   7560
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid custHistoryGrid 
      Height          =   4935
      Left            =   480
      TabIndex        =   3
      Top             =   1920
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   8705
      _Version        =   393216
      Rows            =   26
      Cols            =   8
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblCustUpdateHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Update History"
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
      Left            =   3720
      TabIndex        =   10
      Top             =   120
      Width           =   4575
   End
   Begin VB.Label lblCustBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Br.Code"
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
      Left            =   6000
      TabIndex        =   8
      Top             =   1320
      Width           =   2055
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
      Left            =   840
      TabIndex        =   6
      Top             =   1320
      Width           =   1815
   End
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer No"
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
      Left            =   840
      TabIndex        =   4
      Top             =   960
      Width           =   1815
   End
End
Attribute VB_Name = "frmCustUpdateHistory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdMore_Click()
    If recvCustHistoryMsg.noOfRecs <> 20 Then
       MsgBox errNoMatchFound(UserLang) '"No more match found..."
       Exit Sub
    End If
    If getCustHistory(recvCustHistoryMsg.lastRecCount, recvCustHistoryMsg.custNo, frmEnquirySelect.tag) = -1 Then
       Exit Sub
    End If
       
    If recvCustHistoryMsg.noOfRecs = "00" Then
       MsgBox errNoMatchFound(UserLang)
       Exit Sub
    End If
    Form_Load
End Sub

Private Sub cmdViewDetail_Click()
    getCustDetails
End Sub

Private Sub custHistoryGrid_DblClick()
    If frmCustUpdateHistory.tag = "0" Then
       getCustDetails
    End If
End Sub

Private Sub custHistoryGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow, flexCol, tWidth As Integer
    Static lastRecRead As String * 3
    Dim tmpStr As String
    Dim tCode As String
    Dim rowTitle(7) As String
   
   Dim colwidth(9) As Integer
   colwidth(0) = 500
   colwidth(1) = 1000
   colwidth(2) = 2200
   colwidth(3) = 1800
   colwidth(4) = 1600
   colwidth(5) = 2600
   colwidth(6) = 700
   colwidth(7) = 700
   frmCustUpdateHistory.tag = frmEnquirySelect.tag
   If frmEnquirySelect.tag = "0" Then
      frmCustUpdateHistory.Caption = frmCustUpdateHistoryCaption(0, UserLang)
      frmCustUpdateHistory.lblCustUpdateHistory.Caption = frmCustUpdateHistoryCaption(0, UserLang)
      frmCustUpdateHistory.cmdViewDetail.Enabled = True
   Else
      frmCustUpdateHistory.Caption = frmCustUpdateHistoryCaption(15, UserLang)
      frmCustUpdateHistory.lblCustUpdateHistory.Caption = frmCustUpdateHistoryCaption(15, UserLang)
      frmCustUpdateHistory.cmdViewDetail.Enabled = False
   End If
   
   frmCustUpdateHistory.lblCustNo.Caption = frmCustUpdateHistoryCaption(1, UserLang)
   frmCustUpdateHistory.lblCustName.Caption = frmCustUpdateHistoryCaption(2, UserLang)
   frmCustUpdateHistory.lblCustBranchCode.Caption = frmCustUpdateHistoryCaption(3, UserLang)
   frmCustUpdateHistory.cmdMore.Caption = frmCustUpdateHistoryCaption(12, UserLang)
   frmCustUpdateHistory.cmdViewDetail.Caption = frmCustUpdateHistoryCaption(13, UserLang)
   frmCustUpdateHistory.cmdCancel.Caption = frmCustUpdateHistoryCaption(14, UserLang)
     
'   rowTitle(0) = "Branch code"
'   rowTitle(1) = "User Id"
'   rowTitle(2) = "Date Time"
'   rowTitle(3) = "Pending Status"
'   rowTitle(4) = "Supervisor Id"
'   rowTitle(5) = "Approved Date Time"
   
   custHistoryGrid.Clear
   custHistoryGrid.Row = 0
   custHistoryGrid.Font.Bold = True
   tWidth = 0
   For i = 0 To 7
      custHistoryGrid.Col = i
      custHistoryGrid.text = frmCustUpdateHistoryCaption(i + 4, UserLang)
      custHistoryGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
      custHistoryGrid.CellAlignment = flexAlignLeftCenter
   Next
    
   custHistoryGrid.Width = tWidth + 100
   
   txtCustNo = recvCustHistoryMsg.custNo
   
   txtCustName = recvCustHistoryMsg.custName
   txtCustBranchCode = recvCustHistoryMsg.custBranchCode
   For i = 1 To Val(recvCustHistoryMsg.noOfRecs)
       custHistoryGrid.Row = i
       custHistoryGrid.Col = 0
       custHistoryGrid.CellAlignment = flexAlignLeftCenter
       custHistoryGrid.text = recvCustHistoryMsg.details(i).branchCode
       custHistoryGrid.Col = 1
       custHistoryGrid.CellAlignment = flexAlignLeftCenter
       custHistoryGrid.text = Left(recvCustHistoryMsg.details(i).userId, 10)
       custHistoryGrid.Col = 2
       custHistoryGrid.CellAlignment = flexAlignLeftCenter
       'custHistoryGrid.Text = recvCustHistoryMsg.details(i).dateTime
       custHistoryGrid.text = formatDate(Mid$(recvCustHistoryMsg.details(i).dateTime, 1, 8)) & " " & _
                              formatTime(Mid$(recvCustHistoryMsg.details(i).dateTime, 9, 6))
       custHistoryGrid.Col = 3
       custHistoryGrid.CellAlignment = flexAlignLeftCenter
       tCode = recvCustHistoryMsg.details(i).pendingStatus
       If recvCustHistoryMsg.details(i).pendingStatus = "1" Then
          custHistoryGrid.text = tCode & "-" & errPendingWithSupervisor(UserLang) '" Pending with Supervisor"
       ElseIf recvCustHistoryMsg.details(i).pendingStatus = "2" Then
          custHistoryGrid.text = tCode & "-" & errPendingWithCso(UserLang) '"Pending with CSO"
       ElseIf recvCustHistoryMsg.details(i).pendingStatus = "3" Then
          custHistoryGrid.text = tCode & "-" & errRejected(UserLang) ' Rejected by supervisor"
       ElseIf recvCustHistoryMsg.details(i).pendingStatus = "4" Then
          custHistoryGrid.text = tCode & "-" & errCustomerNotYetVisted(UserLang)  '"Entered by PBO"
       ElseIf recvCustHistoryMsg.details(i).pendingStatus = "5" Then
          custHistoryGrid.text = tCode & "-" & errRejectedByBranchCso(UserLang)  ' Rejected by Branch CSO"
       ElseIf recvCustHistoryMsg.details(i).pendingStatus = "P" Then
          custHistoryGrid.text = tCode & "-" & errEnteredByPBO(UserLang) '"Entered by PBO"
       ElseIf recvCustHistoryMsg.details(i).pendingStatus = "9" Then
          custHistoryGrid.text = tCode & "-Update successful"
       Else
          custHistoryGrid.text = tCode & "-Invalid status  "
       End If
       
       custHistoryGrid.Col = 4
       custHistoryGrid.CellAlignment = flexAlignLeftCenter
       custHistoryGrid.text = recvCustHistoryMsg.details(i).supervisorId
       custHistoryGrid.Col = 5
       custHistoryGrid.CellAlignment = flexAlignLeftCenter
       custHistoryGrid.text = formatDate(Mid$(recvCustHistoryMsg.details(i).approvedDateTime, 1, 8)) & " " & _
                              formatTime(Mid$(recvCustHistoryMsg.details(i).approvedDateTime, 9, 6))
       custHistoryGrid.Col = 6
       custHistoryGrid.CellAlignment = flexAlignLeftCenter
       custHistoryGrid.text = recvCustHistoryMsg.details(i).mainCategoryCode
       custHistoryGrid.Col = 7
       custHistoryGrid.CellAlignment = flexAlignLeftCenter
       custHistoryGrid.text = recvCustHistoryMsg.details(i).subCategoryCode
   Next i
   custHistoryGrid.Row = 1
   
End Sub

Public Sub getCustDetails()
    Dim tUserid As String * 10
    Dim tDateTime As String * 14
    Dim tApprovedDateTime As String
    Dim tBranchCode As String * 4
    Dim strmsglen
    Dim tCode As String
    Dim abcStr As String
    Dim tmpStr As String
    
    custHistoryGrid.Col = 0
    tBranchCode = Format(custHistoryGrid.text, "!@@@@")
    custHistoryGrid.Col = 1
    tUserid = Format(custHistoryGrid.text, "!@@@@@@@@@@")
    custHistoryGrid.Col = 2
    tmpStr = custHistoryGrid.text
    tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
                Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
    tDateTime = Format(tDateTime, "00000000000000")
    
    custHistoryGrid.Col = 5
    tApprovedDateTime = Mid$(custHistoryGrid.text, 1, 10) ' this date is used to display in the customer detail screen
    
    custHistoryGrid.Col = 6
    mainCategoryCode = Mid$(custHistoryGrid.text, 1, 2)
    custHistoryGrid.Col = 7
    subCategoryCode = Mid$(custHistoryGrid.text, 1, 2)
    
    If Len(RTrim(tUserid)) = 0 And Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    If Len(RTrim(mainCategoryCode)) > 0 And Len(RTrim(subCategoryCode)) > 0 Then
       screenSetNo = getScreenSetNo
       If screenSetNo = "-1" Then
          MsgBox errGetingScreenNo(UserLang) '   "Error while getting screen set no for main category " & mainCategoryCode & " sub category   " & subCategoryCode & _
                                             '   "Please call SUPPORT"
          Exit Sub
       End If
       Set rs = db.OpenRecordset("select arabicname, englishname from samamaincategoryinfo where maincategorycode = '" & mainCategoryCode & "'")
       If rs.recordCount > 0 Then
          If UserLang = ENGLISH Then
             mainCategoryDesc = rs(1)
          Else
             mainCategoryDesc = rs(0)
          End If
       End If
       Set rs = db.OpenRecordset("select arabicname, englishname from samasubcategoryinfo where subcategorycode = '" & subCategoryCode & "'")
       If rs.recordCount > 0 Then
          If UserLang = ENGLISH Then
             subCategoryDesc = rs(1)
          Else
             subCategoryDesc = rs(0)
          End If
       End If
    Else
       screenSetNo = "0"
    End If
    
    SendMsg = "000048" & "11" & gBranchCode & "01" & tBranchCode & tUserid & tDateTime & screenSetNo & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCustUpdateHistory.MousePointer = vbHourglass
    frmCustUpdateHistory.cmdCancel.Enabled = False
    'frmCustUpdateHistory.cmdVerify.Enabled = False
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
       
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCustUpdateHistory.MousePointer = vbDefault
       frmCustUpdateHistory.cmdCancel.Enabled = True
      ' frmCustUpdateHistory.cmdVerify.Enabled = True
       Exit Sub
    End If
    frmCustUpdateHistory.MousePointer = vbDefault
    frmCustUpdateHistory.cmdCancel.Enabled = True
    'frmCustUpdateHistory.cmdVerify.Enabled = True
    If screenSetNo <> "0" Then
       If screenSetNo = "1" Or screenSetNo = "A" Then
          parseSaudiIndividualDetail
       ElseIf screenSetNo = "2" Then
          parseIndividualOthersDetail
       ElseIf screenSetNo = "3" Or screenSetNo = "4" Or screenSetNo = "5" Or screenSetNo = "6" Then
          parseJuristicDetail
       ElseIf screenSetNo = "7" Or screenSetNo = "8" Or screenSetNo = "9" Then   ''screenSetNo 9 was added by Mohit on 12-Dec-2006 under Quick Pension customer opening
          parseQuickCustomerDetail
       ElseIf screenSetNo = "E" Then
          parseEstmtStatusMsg
       End If
       loadCorrespondingForm
    ElseIf recvSuperActionMsg.status = "000" Then
       searchAction = False
       updateAction = False
       supervisorAction = False
       tellerAction = False
       custHistoryAction = True
       phoneCustOpenAction = False
       frmCustomer.Show
       frmCustomer.txtSysDate = tApprovedDateTime
       frmCustomer.MousePointer = vbDefault
       frmCustomer.cmdSupervisorComments.Enabled = True
       fillFrmCustomer
    Else
       If UserLang = ARABIC Then
          MsgBox recvSuperActionMsg.aRemarks
       Else
          MsgBox recvSuperActionMsg.eRemarks
       End If
       Unload Me
    End If
End Sub
Public Sub loadCorrespondingForm()
    Dim tmpStr As String
    Dim custBrCode As String
    Dim restirctedBranchFlag As String
    Dim status As String
    Dim aRemarks As String
    Dim eRemarks As String
    
    If screenSetNo = "1" Or screenSetNo = "A" Then
       custBrCode = recvSaudiIndividualMsg.custBranchCode
       status = recvSaudiIndividualMsg.status
       restirctedBranchFlag = recvSaudiIndividualMsg.restrictedBranchFlag
       aRemarks = recvSaudiIndividualMsg.aRemarks
       eRemarks = recvSaudiIndividualMsg.eRemarks
     ElseIf screenSetNo = "2" Then
       custBrCode = recvOtherIndividualMsg.custBranchCode
       status = recvOtherIndividualMsg.status
       restirctedBranchFlag = recvOtherIndividualMsg.restrictedBranchFlag
       aRemarks = recvOtherIndividualMsg.aRemarks
       eRemarks = recvOtherIndividualMsg.eRemarks
     ElseIf screenSetNo = "3" Or screenSetNo = "4" Or screenSetNo = "5" Or screenSetNo = "6" Then
       custBrCode = recvJuristicMsg.custBranchCode
       status = recvJuristicMsg.status
       restirctedBranchFlag = recvJuristicMsg.restrictedBranchFlag
       aRemarks = recvJuristicMsg.aRemarks
       eRemarks = recvJuristicMsg.eRemarks
     ElseIf screenSetNo = "7" Or screenSetNo = "8" Or screenSetNo = "9" Then    ''screeSetNo 9 was added by Mohit on 12-Dec-2006 under Quick Pension customer opening
       custBrCode = recvQuickCustMsg.custBranchCode
       status = recvQuickCustMsg.status
       restirctedBranchFlag = recvQuickCustMsg.restrictedBranchFlag
       aRemarks = recvQuickCustMsg.aRemarks
       eRemarks = recvQuickCustMsg.eRemarks
     ElseIf screenSetNo = "E" Then
       custBrCode = recvEstmtStatusMsg.branchCode
       status = recvEstmtStatusMsg.status
       restirctedBranchFlag = " "
       aRemarks = recvEstmtStatusMsg.aRemarks
       eRemarks = recvEstmtStatusMsg.eRemarks
     End If
    
    If status = "000" Then
       Me.Hide
       'Unload Me
       searchAction = False
       updateAction = False
       supervisorAction = False
       tellerAction = False
       custHistoryAction = True
              
       If screenSetNo = "1" Or screenSetNo = "A" Then
          frmIndividualSaudi.Show
          frmIndividualSaudi.txtSysDate = tApprovedDateTime
          frmIndividualSaudi.MousePointer = vbDefault
          fillFrmIndividualSaudi
       ElseIf screenSetNo = "2" Then
          frmIndividualOthers.Show
          frmIndividualOthers.txtSysDate = tApprovedDateTime
          frmIndividualOthers.MousePointer = vbDefault
          fillFrmIndividualOthers
       ElseIf screenSetNo = "3" Or screenSetNo = "4" Then
          frmJuristicMain.Show
          frmJuristicMain.txtSysDate = tApprovedDateTime
          frmJuristicMain.MousePointer = vbDefault
          fillFrmJuristicMain
       ElseIf screenSetNo = "5" Then
          frmJuristicDiplomats.Show
          frmJuristicDiplomats.txtSysDate = tApprovedDateTime
          frmJuristicDiplomats.MousePointer = vbDefault
          fillFrmJuristicDiplomats
       ElseIf screenSetNo = "6" Then
          frmJuristicNonResident.Show
          frmJuristicNonResident.txtSysDate = tApprovedDateTime
          frmJuristicNonResident.MousePointer = vbDefault
          fillfrmJuristicNonresident
       ElseIf screenSetNo = "7" Then
          frmQuickCustOpen.Show
          frmQuickCustOpen.txtSysDate = tApprovedDateTime
          frmQuickCustOpen.MousePointer = vbDefault
          fillFrmQuickCustOpen
       ElseIf screenSetNo = "8" Then
          frmInternalCustOpen.Show
          frmInternalCustOpen.MousePointer = vbDefault
          fillFrmInternalCustOpen
       ElseIf screenSetNo = "9" Then  ''Added by Mohit on 12-Dec-2006 under Quick Pension Customer
          frmQuickPenCustOpen.Show
          frmQuickPenCustOpen.MousePointer = vbDefault
          fillFrmQuickPenCustOpen
       ElseIf screenSetNo = "E" Then
          fillFrmEstmtRegn
          frmEstmtRegn.Show vbModal
       End If
    Else
       If UserLang = ARABIC Then
          MsgBox aRemarks
       Else
          MsgBox eRemarks
       End If
       Unload Me
    End If
End Sub


Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
