VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmEnquirySelect 
   BackColor       =   &H00BFD87E&
   Caption         =   "Enquiry Select screen"
   ClientHeight    =   8190
   ClientLeft      =   1560
   ClientTop       =   615
   ClientWidth     =   11880
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8190
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdEstmtRegn 
      Caption         =   "Register E-Statement"
      Height          =   375
      Left            =   9945
      TabIndex        =   12
      ToolTipText     =   "Register E-Statement"
      Top             =   8130
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.TextBox txtSearchCriteria 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   285
      Left            =   4320
      MaxLength       =   30
      TabIndex        =   11
      Tag             =   "11775"
      Top             =   960
      Width           =   6615
   End
   Begin VB.CommandButton cmdNewCustomer 
      Caption         =   "&New Customer"
      Enabled         =   0   'False
      Height          =   375
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   9
      ToolTipText     =   "New Customer"
      Top             =   7200
      Width           =   1215
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1800
      TabIndex        =   8
      ToolTipText     =   "Update"
      Top             =   7200
      Width           =   1695
   End
   Begin VB.CommandButton cmdEnquiry 
      Caption         =   "Enquiry"
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   7
      ToolTipText     =   "Enquiry"
      Top             =   7200
      Width           =   1215
   End
   Begin VB.CommandButton cmdTpinHistory 
      Caption         =   "T-Pin history"
      Enabled         =   0   'False
      Height          =   375
      Left            =   10005
      TabIndex        =   6
      ToolTipText     =   "Telephone pin select history"
      Top             =   7695
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.CommandButton cmdTpin 
      Caption         =   "Telephone Pin"
      Enabled         =   0   'False
      Height          =   375
      Left            =   10065
      TabIndex        =   5
      ToolTipText     =   "Telephone pin select"
      Top             =   7170
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.CommandButton cmdHistory 
      Caption         =   "Customer Update History"
      Height          =   375
      Left            =   4920
      TabIndex        =   4
      ToolTipText     =   "Customer Update History"
      Top             =   7200
      Width           =   2175
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   7200
      TabIndex        =   2
      ToolTipText     =   "Get Next Set of Records"
      Top             =   7200
      Width           =   1215
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   8565
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   7185
      Width           =   1215
   End
   Begin MSFlexGridLib.MSFlexGrid SearchResultGrid 
      Height          =   5175
      Left            =   240
      TabIndex        =   0
      Top             =   1560
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   9128
      _Version        =   393216
      Rows            =   21
      Cols            =   12
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      BackColorSel    =   12632256
      BackColorBkg    =   12632256
      SelectionMode   =   1
      AllowUserResizing=   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblSearchCriteria 
      BackColor       =   &H00BFD87E&
      Caption         =   "Search Criteria"
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
      Left            =   360
      TabIndex        =   10
      Top             =   960
      Width           =   3855
   End
   Begin VB.Label lblSearchResults 
      BackColor       =   &H00BFD87E&
      Caption         =   "Search Results"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   615
      Left            =   3720
      TabIndex        =   3
      Top             =   120
      Width           =   5895
   End
End
Attribute VB_Name = "frmEnquirySelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdEnquiry_Click()
   searchAction = True
   updateAction = False
   supervisorAction = False
   tellerAction = False
   custHistoryAction = False
   phoneCustOpenAction = False
   fetchDetails
End Sub

Private Sub cmdEstmtRegn_Click()
    Dim tCustNo As String
    Dim tBranchCode As String
    
    SearchResultGrid.Col = 0
    tCustNo = Format(SearchResultGrid.text, "0000000")
    
    SearchResultGrid.Col = 9
    tBranchCode = SearchResultGrid.text
    
    If Len(Trim(tCustNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
     
    SendMsg = "000048" & "BC" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & tCustNo & Space(50)
    frmEnquirySelect.MousePointer = vbHourglass
    frmEnquirySelect.cmdCancel.Enabled = False
    frmEnquirySelect.cmdMore.Enabled = False
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    frmEnquirySelect.MousePointer = vbDefault
    frmEnquirySelect.cmdCancel.Enabled = True
    frmEnquirySelect.cmdMore.Enabled = True
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
    
    parseEstmtStatusMsg
    
    If recvEstmtStatusMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvEstmtStatusMsg.aRemarks
       Else
          MsgBox recvEstmtStatusMsg.eRemarks
       End If
       Exit Sub
    End If
    searchAction = True
    updateAction = False
    supervisorAction = False
    tellerAction = False
    custHistoryAction = False
    phoneCustOpenAction = False
    fillFrmEstmtRegn
     
    frmEstmtRegn.Show vbModal
End Sub

Private Sub cmdHistory_Click()
    Dim custNo As String * 7
    
    SearchResultGrid.Col = 0
    If Len(RTrim(SearchResultGrid.text)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    custNo = Format(SearchResultGrid.text, "0000000")
    frmEnquirySelect.MousePointer = vbHourglass
    If getCustHistory("00000", custNo, "0") = -1 Then
       frmEnquirySelect.MousePointer = vbNormal
       Exit Sub
    End If
    frmEnquirySelect.MousePointer = vbNormal
    
    frmEnquirySelect.tag = "0"
    If UserLang = ARABIC Then
       ChangePositions frmCustUpdateHistory, 11800
       frmCustUpdateHistory.RightToLeft = True
    End If
    
    frmCustUpdateHistory.Show
    
End Sub

Private Sub cmdMore_Click()
    Dim tmpSearchLabel As String
    If recvSearchMsg.noOfRecs <> 20 Then
       MsgBox errNoMatchFound(UserLang) '"No more match found..."
       Exit Sub
    End If
    frmEnquirySelect.Enabled = False
    doSearch (recvSearchMsg.lastRecCount)
    frmEnquirySelect.Enabled = True
    
    If recvSearchMsg.noOfRecs = "00" Then
       MsgBox errNoMatchFound(UserLang)
       Exit Sub
    End If
    tmpSearchLabel = lblSearchCriteria
    Form_Load
    lblSearchCriteria = tmpSearchLabel
End Sub

Private Sub cmdNewCustomer_Click()
   searchAction = False
   updateAction = False
   supervisorAction = False
   tellerAction = False
   custHistoryAction = False
   noOfJoint = "0"
   noOfOwners = "0"
   noOfSignatory = "0"
   noOfReference = "0"
   CSD_mdiForm.staticStatus.Panels(3).text = "    "
   frmCustCategorize.Show
End Sub

Private Sub cmdOk_Click()
   fetchDetails
End Sub

Private Sub Command1_Click()

End Sub

Private Sub cmdTpin_Click()
    Dim custNo As String * 7
    Dim custName As String
    Dim strmsglen As String * 6
    Dim userId As String * 10
    
    SearchResultGrid.Col = 8
    custName = SearchResultGrid.text
    SearchResultGrid.Col = 0
    If Len(RTrim(SearchResultGrid.text)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    custNo = Format(SearchResultGrid.text, "0000000")
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000090" + "68" + gBranchCode + "0" + userId + Space(14) + custNo + Space(100)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquirySelect.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmEnquirySelect.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    parseTpinStatusDetails
    frmEnquirySelect.MousePointer = vbNormal
    
    If recvTpinStatusMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTpinStatusMsg.aRemarks
       Else
          MsgBox recvTpinStatusMsg.eRemarks
       End If
       Exit Sub
    End If
    
    frmAcceptTPin.txtCustNo = recvTpinStatusMsg.custNo
    frmAcceptTPin.txtCustName = custName
    If recvTpinStatusMsg.tpinExistFlag = "0" Then
       frmAcceptTPin.optTpinSelectedNo.Value = True
    Else
       frmAcceptTPin.optTPinSelectedYes.Value = True
    End If
    
    If recvTpinStatusMsg.tpinStatus = "1" Then
       frmAcceptTPin.optTpinActive.Value = True
    Else
       frmAcceptTPin.optTpinInactive.Value = True
    End If
    
'    If updateAction And pinSelectAtBranch Then
'       frmAcceptTPin.cmdOk.Enabled = True
'       frmAcceptTPin.frameTpinSelect.Enabled = True
'    Else
'       frmAcceptTPin.cmdOk.Enabled = False
'       frmAcceptTPin.frameTpinSelect.Enabled = False
'    End If
    
    frmAcceptTPin.Show vbModal

End Sub

Private Sub cmdTpinHistory_Click()
    Dim custNo As String * 7
    
    SearchResultGrid.Col = 0
    If Len(RTrim(SearchResultGrid.text)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    custNo = Format(SearchResultGrid.text, "0000000")
    If getCustHistory("00000", custNo, "1") = -1 Then
       Exit Sub
    End If
    
    frmEnquirySelect.tag = "1"
    If UserLang = ARABIC Then
       ChangePositions frmCustUpdateHistory, 11800
       frmCustUpdateHistory.RightToLeft = True
    End If
    
    frmCustUpdateHistory.Show

End Sub

Private Sub cmdUpdate_Click()
   Dim tCustNo As String
   Dim tCustName As String
   searchAction = False
   updateAction = True
   supervisorAction = False
   tellerAction = False
   custHistoryAction = False
   phoneCustOpenAction = False
   noOfJoint = "0"
   SearchResultGrid.Col = 0
   
   tCustNo = Format(SearchResultGrid.text, "0000000")
   SearchResultGrid.Col = 8
   tCustName = Format(SearchResultGrid.text, "!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
   If Len(RTrim(tCustNo)) = 0 Then
      MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
      Exit Sub
   End If
   frmCustCategorize.Show
   frmCustCategorize.txtCustNo = tCustNo
   frmCustCategorize.txtCustName = tCustName
   SearchResultGrid.Col = 10
   mainCategoryCode = RTrim(Mid$(SearchResultGrid.text, 1, 2))
   SearchResultGrid.Col = 11
   subCategoryCode = RTrim(Mid$(SearchResultGrid.text, 1, 2))
   tCode = mainCategoryCode
   If tCode <> "" Then
      For i = 0 To frmCustCategorize.cmbMainCategory.ListCount
          If Mid$(frmCustCategorize.cmbMainCategory.List(i), 1, 2) = tCode Then
             frmCustCategorize.cmbMainCategory.ListIndex = i
             Exit For
          End If
      Next i
   Else
      frmCustCategorize.cmbMainCategory.ListIndex = -1
   End If
   If i > frmCustCategorize.cmbMainCategory.ListCount Then
       frmCustCategorize.cmbMainCategory.text = tCode & "-Not defined in local"
   End If
   tCode = subCategoryCode
   If tCode <> "" Then
      For i = 0 To frmCustCategorize.cmbSubCategory.ListCount
          If Mid$(frmCustCategorize.cmbSubCategory.List(i), 1, 2) = tCode Then
             frmCustCategorize.cmbSubCategory.ListIndex = i
             Exit For
           End If
       Next i
    Else
       frmCustCategorize.cmbSubCategory.ListIndex = -1
    End If
    If i > frmCustCategorize.cmbSubCategory.ListCount Then
       frmCustCategorize.cmbSubCategory.text = tCode & "-Not defined in local"
    End If

   'fetchDetails
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow, tWidth, colwidth(15) As Integer
    
    colwidth(0) = 1200
    colwidth(1) = 300
    colwidth(2) = 1300
    colwidth(3) = 1000
    colwidth(4) = 400
    
    colwidth(5) = 1200
    colwidth(6) = 1200
    colwidth(7) = 1200
    
    colwidth(8) = 1500
    
    colwidth(9) = 500
    colwidth(10) = 300
    colwidth(11) = 300
          
    CSD_mdiForm.staticStatus.Panels(3).text = errSearchInProgress(UserLang)
    
    frmEnquirySelect.Caption = frmEnquirySelectCaption(0, UserLang)
    frmEnquirySelect.lblSearchResults.Caption = frmEnquirySelectCaption(1, UserLang)
    frmEnquirySelect.cmdMore.Caption = frmEnquirySelectCaption(14, UserLang)
    frmEnquirySelect.cmdEnquiry.Caption = frmEnquirySelectCaption(22, UserLang)
    frmEnquirySelect.cmdCancel.Caption = frmEnquirySelectCaption(16, UserLang)
    frmEnquirySelect.cmdHistory.Caption = frmEnquirySelectCaption(17, UserLang)
    frmEnquirySelect.cmdNewCustomer.Caption = frmEnquirySelectCaption(18, UserLang)
    frmEnquirySelect.cmdUpdate.Caption = frmEnquirySelectCaption(19, UserLang)
    frmEnquirySelect.cmdTpin.Caption = frmEnquirySelectCaption(20, UserLang)
    frmEnquirySelect.cmdTpinHistory.Caption = frmEnquirySelectCaption(21, UserLang)
    frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(23, UserLang)
    frmEnquirySelect.cmdEstmtRegn.Caption = frmEnquirySelectCaption(27, UserLang)
       
    SearchResultGrid.Clear
    SearchResultGrid.Row = 0
    SearchResultGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 11
      SearchResultGrid.Col = i
      If UserLang = ARABIC Then
         SearchResultGrid.CellAlignment = flexAlignRightCenter
      Else
         SearchResultGrid.CellAlignment = flexAlignLeftCenter
      End If
      SearchResultGrid.text = frmEnquirySelectCaption(i + 2, UserLang)
      SearchResultGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    SearchResultGrid.Width = tWidth + 130
    
    If searchAction Then
         For i = 1 To Val(recvSearchMsg.noOfRecs)
           SearchResultGrid.Row = i
           SearchResultGrid.Col = 0
           SearchResultGrid.text = recvSearchMsg.details(i).custNo
           SearchResultGrid.Col = 1
           SearchResultGrid.text = recvSearchMsg.details(i).idType
           SearchResultGrid.Col = 2
           SearchResultGrid.CellAlignment = flexAlignLeftCenter
           SearchResultGrid.text = recvSearchMsg.details(i).idNo
           SearchResultGrid.Col = 3
           SearchResultGrid.text = recvSearchMsg.details(i).telNo
           SearchResultGrid.Col = 4
           SearchResultGrid.text = recvSearchMsg.details(i).telExt
           SearchResultGrid.Col = 5
           If UserLang = ARABIC Then
              SearchResultGrid.CellAlignment = flexAlignRightCenter
           Else
              SearchResultGrid.CellAlignment = flexAlignLeftCenter
           End If
           SearchResultGrid.text = recvSearchMsg.details(i).firstName
           SearchResultGrid.Col = 6
           If UserLang = ARABIC Then
              SearchResultGrid.CellAlignment = flexAlignRightCenter
           Else
              SearchResultGrid.CellAlignment = flexAlignLeftCenter
           End If
           SearchResultGrid.text = recvSearchMsg.details(i).secondName
           SearchResultGrid.Col = 7
           If UserLang = ARABIC Then
              SearchResultGrid.CellAlignment = flexAlignRightCenter
           Else
              SearchResultGrid.CellAlignment = flexAlignLeftCenter
           End If
           SearchResultGrid.text = recvSearchMsg.details(i).lastName
           SearchResultGrid.Col = 8
           If UserLang = ARABIC Then
              SearchResultGrid.CellAlignment = flexAlignRightCenter
           Else
              SearchResultGrid.CellAlignment = flexAlignLeftCenter
           End If
           SearchResultGrid.text = recvSearchMsg.details(i).shortName
           SearchResultGrid.Col = 9
           SearchResultGrid.text = recvSearchMsg.details(i).branchCode
           SearchResultGrid.Col = 10
           SearchResultGrid.text = recvSearchMsg.details(i).mainCategoryCode
           SearchResultGrid.Col = 11
           SearchResultGrid.text = recvSearchMsg.details(i).subCategoryCode
        Next i
   End If
   SearchResultGrid.Row = 1
   
   'Added by Mohit on 13-Dec-2006 under quick pension opening and bug fixing
   SearchResultGrid.Col = 11
   glb_subCategoryCode = Mid$(SearchResultGrid.text, 1, 2)
   'Till here added by Mohit on 13-Dec-2006
   
   
 
   If searchAction = True Then
      cmdMore.Enabled = True
   Else
      cmdMore.Enabled = False
   End If
   
    If InStr(recvLoginMsg.authorityLevel, "~01") <> 0 Then
'       cmdNewCustomer.Enabled = True
'       cmdUpdate.Enabled = True
    Else
       cmdNewCustomer.Enabled = False
       cmdUpdate.Enabled = False
    End If
   
   
   CSD_mdiForm.staticStatus.Panels(3).text = errSelectOneMatch(UserLang)
       
   'CSD_mdiForm.staticStatus.Panels(3).Text  = "Search resulted in many matches, please select a particular one"
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
End Sub

Private Sub SearchResultGrid_DblClick()
   searchAction = True
   updateAction = False
   tellerAction = False
   supervisorAction = False
   custHistoryAction = False
   fetchDetails
End Sub

Private Sub fetchDetails()
    Dim tBranchCode As String
    Dim tCustNo As String
    
    SearchResultGrid.Col = 0
    tCustNo = Format(SearchResultGrid.text, "0000000")
    
    SearchResultGrid.Col = 9
    tBranchCode = SearchResultGrid.text
    
    SearchResultGrid.Col = 10
    mainCategoryCode = Mid$(SearchResultGrid.text, 1, 2)
    SearchResultGrid.Col = 11
    subCategoryCode = Mid$(SearchResultGrid.text, 1, 2)
    
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
    
    If Len(Trim(tCustNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
     
    SendMsg = "000048" & "11" & gBranchCode & "02" & tCustNo & Space(21) & screenSetNo & Space(50)
    frmEnquirySelect.MousePointer = vbHourglass
    frmEnquirySelect.cmdCancel.Enabled = False
    frmEnquirySelect.cmdMore.Enabled = False
    'frmEnquirySelect.cmdOk.Enabled = False
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    frmEnquirySelect.MousePointer = vbDefault
    frmEnquirySelect.cmdCancel.Enabled = True
    frmEnquirySelect.cmdMore.Enabled = True
    'frmEnquirySelect.cmdOk.Enabled = True
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
    If screenSetNo <> "0" Then
       If screenSetNo = "1" Or screenSetNo = "A" Then
          parseSaudiIndividualDetail
       ElseIf screenSetNo = "2" Then
          parseIndividualOthersDetail
       ElseIf screenSetNo = "3" Or screenSetNo = "4" Or screenSetNo = "5" Or screenSetNo = "6" Then
          parseJuristicDetail
       ElseIf screenSetNo = "7" Or screenSetNo = "8" Or screenSetNo = "9" Then   ''screenSetNo 9 was added by Mohit on 12-Dec-2006 under Quick pension customer opening
          parseQuickCustomerDetail
       End If
       loadCorrespondingForm
    ElseIf recvSuperActionMsg.status = "000" Then
       If updateAction And _
          recvLoginMsg.globalUpdatePriv = "0" Then
           tBranchCode = recvSuperActionMsg.custBranchCode
           If tBranchCode <> gBranchCode Then
              MsgBox errUpdateNotAllowed(UserLang)
              Exit Sub
           End If
       End If
       
       ' The following if statement added after giving the source to MISYS
       
       If updateAction And recvLoginMsg.globalUpdatePriv = "2" Then
          If recvSuperActionMsg.custBranchCode <> gBranchCode Then
             If recvSuperActionMsg.restrictedBranchFlag = "1" Then
                MsgBox errRestrictedBranch(UserLang), vbCritical '"Update is restricted for this Branch customer..Please check"
                Exit Sub
             End If
          End If
       End If

       Unload Me
       supervisorAction = False
       tellerAction = False
       custHistoryAction = False
'       SearchResultGrid.Col = 5
'       tCustName = Format(SearchResultGrid.Text, "!@@@@@@@@@@@@@@@")
'       frmCustCategorize.Show
'       frmCustCategorize.txtCustNo = tCustNo
'       frmCustCategorize.txtCustName = tCustName
'       frmCustCategorize.cmbMainCategory = " "
'       frmCustCategorize.cmbSubCategory = " "
'       saveRecvStr = RecvStr
'       saveMainCategory = Space(2)
'       saveSubCategory = Space(2)

       frmCustomer.Show
       fillFrmCustomer
    Else
       If UserLang = ARABIC Then
          MsgBox recvSuperActionMsg.aRemarks
       Else
          MsgBox recvSuperActionMsg.eRemarks
       End If
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
   ElseIf screenSetNo = "7" Or screenSetNo = "8" Or screenSetNo = "9" Then   ''screenSetNo 9 was added by Mohit on 12-Dec-2006 under Quick pension customer opening
       custBrCode = recvQuickCustMsg.custBranchCode
       status = recvQuickCustMsg.status
       restirctedBranchFlag = recvQuickCustMsg.restrictedBranchFlag
       aRemarks = recvQuickCustMsg.aRemarks
       eRemarks = recvQuickCustMsg.eRemarks
   End If
    
    If status = "000" Then
       If updateAction And _
          recvLoginMsg.globalUpdatePriv = "0" Then
           tBranchCode = custBrCode
            ' The following validation are commented by Rajesh on 25/9/2006 as per mail from
            ' Mr. Anwar Alfaraj on 20/09/2006
'           If tBranchCode <> gBranchCode Then
'              MsgBox errUpdateNotAllowed(UserLang)
'              Exit Sub
'           End If
       End If
       
       ' The following if statement added after giving the source to MISYS
       
       If updateAction And recvLoginMsg.globalUpdatePriv = "2" Then
          If custBrCode <> gBranchCode Then
             If restirctedBranchFlag = "1" Then
                MsgBox errRestrictedBranch(UserLang), vbCritical '"Update is restricted for this Branch customer..Please check"
                Exit Sub
             End If
          End If
       End If

       Unload Me
       supervisorAction = False
       tellerAction = False
       custHistoryAction = False
              
       If screenSetNo = "1" Or screenSetNo = "A" Then
          frmIndividualSaudi.Show
          frmIndividualSaudi.MousePointer = vbDefault
          fillFrmIndividualSaudi
       ElseIf screenSetNo = "2" Then
          frmIndividualOthers.Show
          frmIndividualOthers.MousePointer = vbDefault
          fillFrmIndividualOthers
       ElseIf screenSetNo = "3" Or screenSetNo = "4" Then
          frmJuristicMain.Show
          frmJuristicMain.MousePointer = vbDefault
          fillFrmJuristicMain
       ElseIf screenSetNo = "5" Then
          frmJuristicDiplomats.Show
          frmJuristicDiplomats.MousePointer = vbDefault
          fillFrmJuristicDiplomats
       ElseIf screenSetNo = "6" Then
          frmJuristicNonResident.Show
          frmJuristicNonResident.MousePointer = vbDefault
          fillfrmJuristicNonresident
       ElseIf screenSetNo = "7" Then
          frmQuickCustOpen.Show
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

Private Sub SearchResultGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtSearchCriteria_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
