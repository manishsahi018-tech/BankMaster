VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSupervisorApproval 
   BackColor       =   &H00BFD87E&
   Caption         =   "Supervisor Approval"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtCustomerNo 
      Height          =   285
      Left            =   2535
      MaxLength       =   7
      TabIndex        =   0
      Top             =   840
      Width           =   1575
   End
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4335
      TabIndex        =   1
      ToolTipText     =   "Check pending List"
      Top             =   840
      Width           =   2295
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   960
      TabIndex        =   4
      ToolTipText     =   "More"
      Top             =   7200
      Width           =   1695
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   4680
      TabIndex        =   6
      ToolTipText     =   "Cancel"
      Top             =   7200
      Width           =   1695
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   495
      Left            =   2640
      TabIndex        =   5
      ToolTipText     =   "Verify Selected Record"
      Top             =   7200
      Width           =   2055
   End
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Height          =   5415
      Left            =   480
      TabIndex        =   3
      Top             =   1320
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   9551
      _Version        =   393216
      Rows            =   30
      Cols            =   8
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
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
      Left            =   525
      TabIndex        =   7
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label lblSuperviosorPendingActivities 
      BackColor       =   &H00BFD87E&
      Caption         =   "Supervisor  Pending List"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   555
      Left            =   1560
      TabIndex        =   2
      Top             =   135
      Width           =   9015
   End
End
Attribute VB_Name = "frmSupervisorApproval"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    Unload Me
'    frmEnquiry.Show
 End Sub

Private Sub cmdCheckPendingMails_Click()

End Sub

Private Sub cmdCheckPendingList_Click()
  Dim tCustNo As String
  If Len(Trim(txtCustomerNo)) = 0 Then
     MsgBox errSpaceCustomerNo(UserLang)
     txtCustomerNo.SetFocus
     Exit Sub
  End If
  If supervisorAction = True Then
     frmEnquiry.readPendingList "00000", "S", Format(txtCustomerNo, "0000000")
  ElseIf tellerAction = True And activityFlag = "T" Then
     frmEnquiry.readPendingList "00000", "T", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readPendingList "00000", "P", Format(txtCustomerNo, "0000000")
  End If
  If recvPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  
  Form_Load
End Sub

Private Sub cmdMore_Click()
 If recvPendingList.noOfRecs <> 20 Then
    MsgBox errNoMatchFound(UserLang) '"No more match found..."
    Exit Sub
  End If
  If supervisorAction = True Then
     frmEnquiry.readPendingList recvPendingList.lastRecRead, "S", Format(txtCustomerNo, "0000000")
  ElseIf tellerAction = True And activityFlag = "T" Then
     frmEnquiry.readPendingList recvPendingList.lastRecRead, "T", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readPendingList recvPendingList.lastRecRead, "P", Format(txtCustomerNo, "0000000")
  End If
    
  If recvPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdVerify_Click()
  loadDetails
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim flexRow, flexCol, tWidth As Integer
   Static lastRecRead As String * 3
   Dim tmpStr As String
   
   Dim colwidth(15) As Integer
   colwidth(0) = 1200
   colwidth(1) = 1600
   colwidth(2) = 1200
   colwidth(3) = 3000
   colwidth(4) = 700
   colwidth(5) = 1700
   colwidth(6) = 700
   colwidth(7) = 700
   CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang) '"Loading....Please wait.."
    
   frmSupervisorApproval.Caption = frmSupervisorApprovalCaption(0, UserLang)
   If activityFlag = "S" Then
      frmSupervisorApproval.lblSuperviosorPendingActivities.Caption = frmSupervisorApprovalCaption(1, UserLang)
   ElseIf activityFlag = "T" Then
      frmSupervisorApproval.lblSuperviosorPendingActivities.Caption = frmSupervisorApprovalCaption(2, UserLang)
   Else
      frmSupervisorApproval.lblSuperviosorPendingActivities.Caption = frmSupervisorApprovalCaption(13, UserLang)
   End If
   frmSupervisorApproval.cmdMore.Caption = frmEnquirySelectCaption(14, UserLang)
   frmSupervisorApproval.cmdVerify.Caption = frmSupervisorApprovalCaption(11, UserLang)
   frmSupervisorApproval.cmdCancel.Caption = frmSupervisorApprovalCaption(12, UserLang)
   
   lblCustomerNo.Caption = errCustomerNo(UserLang)
   cmdCheckPendingList.Caption = errCheckPendingList(UserLang)
   
   MSFlexGrid1.Clear
   MSFlexGrid1.Row = 0
   MSFlexGrid1.Font.Bold = True
   tWidth = 0
   For i = 0 To 7
      MSFlexGrid1.Col = i
      MSFlexGrid1.text = frmSupervisorApprovalCaption(i + 3, UserLang)
      MSFlexGrid1.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
   Next
    
   MSFlexGrid1.Width = tWidth + 100

   For i = 1 To Val(recvPendingList.noOfRecs)
      MSFlexGrid1.Row = i
      MSFlexGrid1.Col = 0
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
      MSFlexGrid1.text = Left(recvPendingList.details(i).userId, 10)
      MSFlexGrid1.Col = 1
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
      MSFlexGrid1.text = recvPendingList.details(i).dateTime
      MSFlexGrid1.Col = 2
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
      MSFlexGrid1.text = recvPendingList.details(i).customerNo
      MSFlexGrid1.Col = 3
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
      MSFlexGrid1.text = recvPendingList.details(i).shortName
      MSFlexGrid1.Col = 4
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
      MSFlexGrid1.text = recvPendingList.details(i).idType
      MSFlexGrid1.Col = 5
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
      MSFlexGrid1.text = recvPendingList.details(i).idNumber
      MSFlexGrid1.Col = 6
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
      MSFlexGrid1.text = recvPendingList.details(i).mainCategoryCode
      MSFlexGrid1.Col = 7
      MSFlexGrid1.CellAlignment = flexAlignLeftCenter
      MSFlexGrid1.text = recvPendingList.details(i).subCategoryCode
   Next i
   MSFlexGrid1.Row = 1
   CSD_mdiForm.staticStatus.Panels(3).text = errVerifyRecord(UserLang)  '"Select any record for verification"
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
CSD_mdiForm.staticStatus.Panels(3).text = "  "
End Sub

Private Sub MSFlexGrid1_DblClick()
   loadDetails
End Sub

Private Sub loadDetails()
    
    Dim tUserid As String * 10
    Dim tDateTime As String * 14
    Dim tBranchCode As String * 4
    Dim strmsglen
    Dim tCode As String
    Dim abcStr As String
    Dim tmpStr As String
    
    MSFlexGrid1.Col = 0
    tUserid = Format(MSFlexGrid1.text, "!@@@@@@@@@@")
    MSFlexGrid1.Col = 1
    tDateTime = Format(MSFlexGrid1.text, "00000000000000")
    tBranchCode = gBranchCode
    MSFlexGrid1.Col = 6
    mainCategoryCode = Mid$(MSFlexGrid1.text, 1, 2)
    MSFlexGrid1.Col = 7
    subCategoryCode = Mid$(MSFlexGrid1.text, 1, 2)
    
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
    
    If Len(RTrim(tUserid)) = 0 And Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    CSD_mdiForm.staticStatus.Panels(3).text = " "
          
    SendMsg = "000048" & "11" & gBranchCode & "01" & tBranchCode & tUserid & tDateTime & screenSetNo & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSupervisorApproval.MousePointer = vbHourglass
    frmSupervisorApproval.cmdMore.Enabled = False
    frmSupervisorApproval.cmdCancel.Enabled = False
    frmSupervisorApproval.cmdVerify.Enabled = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmSupervisorApproval.MousePointer = vbDefault
       frmSupervisorApproval.cmdMore.Enabled = True
       frmSupervisorApproval.cmdCancel.Enabled = True
       frmSupervisorApproval.cmdVerify.Enabled = True
       Exit Sub
    End If
    frmSupervisorApproval.MousePointer = vbDefault
    frmSupervisorApproval.cmdMore.Enabled = True
    frmSupervisorApproval.cmdCancel.Enabled = True
    frmSupervisorApproval.cmdVerify.Enabled = True
    If screenSetNo <> "0" Then
       If screenSetNo = "1" Or screenSetNo = "A" Then
          parseSaudiIndividualDetail
          loadSaudiIndividualForm
       ElseIf screenSetNo = "2" Then
          parseIndividualOthersDetail
          loadOtherIndividualForm
       ElseIf screenSetNo = "3" Or screenSetNo = "4" Or screenSetNo = "5" Or screenSetNo = "6" Then
          parseJuristicDetail
          loadJuristicForm
          If recvJuristicMsg.signatoryForOthers = "1" Then
             MsgBox errSignatoryForOthers(UserLang)
          End If
       ElseIf screenSetNo = "7" Or screenSetNo = "8" Or screenSetNo = "9" Then   ''screenSetNo 9 added by Mohit on 12-Dec-2006 under Quick Pension customer opening
          parseQuickCustomerDetail
          If screenSetNo = "7" Then
             loadQuickCustomerForm
          ElseIf screenSetNo = "8" Then   ' Internal Customer
             loadInternalCustomerForm
          ElseIf screenSetNo = "9" Then   ' Quick Pension customer      ''added by Mohit on 12-Dec-2006 under Quick Pension customer opening
            loadQuickPenCustomerForm
          End If
       ElseIf screenSetNo = "E" Then
          parseEstmtStatusMsg
          fillFrmEstmtRegn
          frmEstmtRegn.Show vbModal
       End If
    ElseIf recvSuperActionMsg.status = "000" Then
       Me.Hide
       If activityFlag = "S" Then
          supervisorAction = True
          tellerAction = False
       Else
          tellerAction = True
          supervisorAction = False
       End If
       searchAction = False
       updateAction = False
       custHistoryAction = False
       
       frmCustomer.Show
       frmCustomer.MousePointer = vbDefault
       frmCustomer.cmdSupervisorComments.Enabled = True
       fillFrmCustomer
       If recvSuperActionMsg.foundInAList = "1" Or _
          recvSuperActionMsg.foundInBList = "1" Or _
          recvSuperActionMsg.foundInCList = "1" Then
          If UserLang = ARABIC Then
             abcStr = "«·⁄„Ì· „ÊÃÊœ ⁄·Ï «·ﬁ«∆„… «·”Êœ«¡"
          Else
             abcStr = "Customer is found as BlackList on "
          End If
       
          If recvSuperActionMsg.foundInAList = "1" Then
             abcStr = abcStr & "A "
          End If
          If recvSuperActionMsg.foundInBList = "1" Then
             abcStr = abcStr & ",B "
          End If
          If recvSuperActionMsg.foundInCList = "1" Then
             abcStr = abcStr & ",C "
          End If
          If UserLang = ARABIC Then
             abcStr = abcStr & "„‰ ﬁ»· :" & recvSuperActionMsg.reportedBank & _
                      " «”„ «·⁄„Ì· :" & recvSuperActionMsg.nameInABCList
          Else
             abcStr = abcStr & "reported by : " & recvSuperActionMsg.reportedBank & _
                      " in the name :" & recvSuperActionMsg.nameInABCList
          End If
          MsgBox abcStr
       End If
    
       If recvSuperActionMsg.exisingCustomer = "1" Then
          If UserLang = ARABIC Then
             tmpStr = "«·⁄„Ì· „œŒ· ”«»ﬁ« .. —ﬁ„ «·⁄„Ì·:" & _
                 recvSuperActionMsg.existCustNo + "  Ê " & _
                 "«”„ «·⁄„Ì·:" & recvSuperActionMsg.existCustName
          Else
              tmpStr = "Customer Already Exists,  CustNo :" & _
                 recvSuperActionMsg.existCustNo & "  and " & _
                 "Customer Name :" & recvSuperActionMsg.existCustName
          End If
          MsgBox tmpStr
       End If
    Else
       If UserLang = ARABIC Then
          MsgBox recvSuperActionMsg.aRemarks
       Else
          MsgBox recvSuperActionMsg.eRemarks
       End If
       Unload Me
    End If
End Sub

Public Sub loadOtherIndividualForm()
    Dim tmpStr As String
    If recvOtherIndividualMsg.status = "000" Then
       If activityFlag = "S" Then
          supervisorAction = True
          tellerAction = False
       Else
          tellerAction = True
          supervisorAction = False
       End If
       searchAction = False
       updateAction = False
       custHistoryAction = False
       If recvOtherIndividualMsg.exisingCustomer = "1" Then
          If UserLang = ARABIC Then
             tmpStr = "«·⁄„Ì· „œŒ· ”«»ﬁ« .. —ﬁ„ «·⁄„Ì·:" + _
                 recvOtherIndividualMsg.existCustNo + "  Ê " + _
                 "«”„ «·⁄„Ì·:" + recvOtherIndividualMsg.existCustName
          Else
              tmpStr = "Customer Already Exists,  CustNo :" + _
                 recvOtherIndividualMsg.existCustNo + "  and " + _
                 "Customer Name :" + recvOtherIndividualMsg.existCustName
          End If
          If recvOtherIndividualMsg.displayWarningMsgOnDuplicateId = "0" Then   ' stop the process
             MsgBox tmpStr & errOperationNotPossible(UserLang), vbCritical
          Else
             MsgBox tmpStr
          End If
       End If
       Me.Hide
       frmIndividualOthers.MousePointer = vbDefault
       'frmIndividualOthers.cmdSupervisorComments.Enabled = True
       fillFrmIndividualOthers
       If recvOtherIndividualMsg.foundInAList = "1" Or _
          recvOtherIndividualMsg.foundInBList = "1" Or _
          recvOtherIndividualMsg.foundInCList = "1" Then
          If UserLang = ARABIC Then
             abcStr = "«·⁄„Ì· „ÊÃÊœ ⁄·Ï «·ﬁ«∆„… «·”Êœ«¡"
          Else
             abcStr = "Customer is found as BlackList on "
          End If
    
          If recvOtherIndividualMsg.foundInAList = "1" Then
             abcStr = abcStr + "A "
          End If
          If recvOtherIndividualMsg.foundInBList = "1" Then
             abcStr = abcStr + ",B "
          End If
          If recvOtherIndividualMsg.foundInCList = "1" Then
             abcStr = abcStr + ",C "
          End If
          If UserLang = ARABIC Then
             abcStr = abcStr + "„‰ ﬁ»· :" + recvOtherIndividualMsg.reportedBank + _
                      " «”„ «·⁄„Ì· :" + recvOtherIndividualMsg.nameInABCList
          Else
             abcStr = abcStr + "reported by : " + recvOtherIndividualMsg.reportedBank + _
                      " in the name :" + recvOtherIndividualMsg.nameInABCList
          End If
          MsgBox abcStr
       End If
    
       If recvOtherIndividualMsg.foundInTlist = "1" Then
          response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
          If response = vbYes Then
             fillSearchEngineForm Val(recvOtherIndividualMsg.noOfRecs)
             frmSearchEngine.Show vbModal
          End If
       End If
       
       If recvOtherIndividualMsg.overrideForNoSamaAuth = "1" Then
          MsgBox errNoSamaAuthEntered(UserLang)
       End If
       frmIndividualOthers.Show
    Else
       If UserLang = ARABIC Then
          MsgBox recvOtherIndividualMsg.aRemarks
       Else
          MsgBox recvOtherIndividualMsg.eRemarks
       End If
       Unload Me
    End If
End Sub


Public Sub loadSaudiIndividualForm()
    Dim tmpStr As String
    Dim response
    If recvSaudiIndividualMsg.status = "000" Then
       If activityFlag = "S" Then
          supervisorAction = True
          tellerAction = False
       Else
          tellerAction = True
          supervisorAction = False
       End If
       searchAction = False
       updateAction = False
       custHistoryAction = False
       If recvSaudiIndividualMsg.exisingCustomer = "1" Then
          If UserLang = ARABIC Then
             tmpStr = "«·⁄„Ì· „œŒ· ”«»ﬁ« .. —ﬁ„ «·⁄„Ì·:" + _
                 recvSaudiIndividualMsg.existCustNo + "  Ê " + _
                 "«”„ «·⁄„Ì·:" + recvSaudiIndividualMsg.existCustName
          Else
              tmpStr = "Customer Already Exists,  CustNo :" + _
                 recvSaudiIndividualMsg.existCustNo + "  and " + _
                 "Customer Name :" + recvSaudiIndividualMsg.existCustName
          End If

          If recvSaudiIndividualMsg.displayWarningMsgOnDuplicateId = "0" Then   ' Stop the process
             MsgBox tmpStr & errOperationNotPossible(UserLang), vbCritical
          Else
             MsgBox tmpStr
          End If
       End If
       Me.Hide
           
       frmIndividualSaudi.MousePointer = vbDefault
       'frmIndividualOthers.cmdSupervisorComments.Enabled = True
       fillFrmIndividualSaudi
       If recvSaudiIndividualMsg.foundInAList = "1" Or _
          recvSaudiIndividualMsg.foundInBList = "1" Or _
          recvSaudiIndividualMsg.foundInCList = "1" Then
          If UserLang = ARABIC Then
             abcStr = "«·⁄„Ì· „ÊÃÊœ ⁄·Ï «·ﬁ«∆„… «·”Êœ«¡"
          Else
             abcStr = "Customer is found as BlackList on "
          End If
    
          If recvSaudiIndividualMsg.foundInAList = "1" Then
             abcStr = abcStr + "A "
          End If
          If recvSaudiIndividualMsg.foundInBList = "1" Then
             abcStr = abcStr + ",B "
          End If
          If recvSaudiIndividualMsg.foundInCList = "1" Then
             abcStr = abcStr + ",C "
          End If
          If UserLang = ARABIC Then
             abcStr = abcStr + "„‰ ﬁ»· :" + recvSaudiIndividualMsg.reportedBank + _
                      " «”„ «·⁄„Ì· :" + recvSaudiIndividualMsg.nameInABCList
          Else
             abcStr = abcStr + "reported by : " + recvSaudiIndividualMsg.reportedBank + _
                      " in the name :" + recvSaudiIndividualMsg.nameInABCList
          End If
          MsgBox abcStr
       End If
    
'       If recvSaudiIndividualMsg.exisingCustomer = "1" Then
'          If UserLang = ARABIC Then
'             tmpStr = "«·⁄„Ì· „œŒ· ”«»ﬁ« .. —ﬁ„ «·⁄„Ì·:" + _
'                 recvSaudiIndividualMsg.existCustNo + "  Ê " + _
'                 "«”„ «·⁄„Ì·:" + recvSaudiIndividualMsg.existCustName
'          Else
'              tmpStr = "Customer Already Exists,  CustNo :" + _
'                 recvSaudiIndividualMsg.existCustNo + "  and " + _
'                 "Customer Name :" + recvSaudiIndividualMsg.existCustName
'          End If
'          MsgBox tmpStr
'
''          If recvCheckCustMsg.displayWarningMsg = "1" Then
''             MsgBox tmpStr
''          Else
''             MsgBox tmpStr & errOperationNotPossible(UserLang), vbCritical
''             checkCustomerExistance = 1
''             Exit Function
''           End If
'       End If
       
       If recvSaudiIndividualMsg.foundInTlist = "1" Then
          response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
          If response = vbYes Then
             fillSearchEngineForm Val(recvSaudiIndividualMsg.noOfRecs)
             frmSearchEngine.Show vbModal
          End If
       End If
       frmIndividualSaudi.Show
    Else
       If UserLang = ARABIC Then
          MsgBox recvSaudiIndividualMsg.aRemarks
       Else
          MsgBox recvSaudiIndividualMsg.eRemarks
       End If
       Unload Me
    End If
End Sub

Public Sub loadJuristicForm()
    Dim tmpStr As String
    
    If recvJuristicMsg.status = "000" Then
       If activityFlag = "S" Then
          supervisorAction = True
          tellerAction = False
       Else
          tellerAction = True
          supervisorAction = False
       End If
       searchAction = False
       updateAction = False
       custHistoryAction = False
       
       If recvJuristicMsg.exisingCustomer = "1" Then
          If UserLang = ARABIC Then
             tmpStr = "«·⁄„Ì· „œŒ· ”«»ﬁ« .. —ﬁ„ «·⁄„Ì·:" + _
                 recvJuristicMsg.existCustNo + "  Ê " + _
                 "«”„ «·⁄„Ì·:" + recvJuristicMsg.existCustName
          Else
              tmpStr = "Customer Already Exists,  CustNo :" + _
                 recvJuristicMsg.existCustNo + "  and " + _
                 "Customer Name :" + recvJuristicMsg.existCustName
          End If
          MsgBox tmpStr
       End If
       
       If recvJuristicMsg.foundInTlist = "1" Then
          response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
          If response = vbYes Then
             fillSearchEngineForm Val(recvJuristicMsg.noOfRecs)
             frmSearchEngine.Show vbModal
          End If
       End If
          
       If recvJuristicMsg.overrideForNoSamaAuth = "1" Then
          MsgBox errNoSamaAuthEntered(UserLang)
       End If
          
       If recvJuristicMsg.overrideForNonSaudi = "1" Then
          MsgBox errNonSaudiSignatoryFound(UserLang)
       End If
       Me.Hide
       If screenSetNo = "3" Or screenSetNo = "4" Then
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
       End If
    Else
       If UserLang = ARABIC Then
          MsgBox recvJuristicMsg.aRemarks
       Else
          MsgBox recvJuristicMsg.eRemarks
       End If
       Unload Me
    End If
End Sub
Public Sub loadQuickCustomerForm()
   Dim tmpStr As String
    If recvQuickCustMsg.status = "000" Then
       If activityFlag = "S" Then
          supervisorAction = True
          tellerAction = False
       Else
          tellerAction = True
          supervisorAction = False
       End If
       searchAction = False
       updateAction = False
       custHistoryAction = False
       If recvQuickCustMsg.exisingCustomer = "1" Then
          If UserLang = ARABIC Then
             tmpStr = "«·⁄„Ì· „œŒ· ”«»ﬁ« .. —ﬁ„ «·⁄„Ì·:" + _
                 recvQuickCustMsg.existCustNo + "  Ê " + _
                 "«”„ «·⁄„Ì·:" + recvQuickCustMsg.existCustName
          Else
              tmpStr = "Customer Already Exists,  CustNo :" + _
                 recvQuickCustMsg.existCustNo + "  and " + _
                 "Customer Name :" + recvQuickCustMsg.existCustName
          End If

          If recvQuickCustMsg.displayWarningMsgOnDuplicateId = "0" Then   ' Stop the process
             MsgBox tmpStr & errOperationNotPossible(UserLang), vbCritical
          Else
             MsgBox tmpStr
          End If
       End If
       Me.Hide
           
       frmQuickCustOpen.MousePointer = vbDefault
       'frmIndividualOthers.cmdSupervisorComments.Enabled = True
       fillFrmQuickCustOpen
       If recvQuickCustMsg.foundInAList = "1" Or _
          recvQuickCustMsg.foundInBList = "1" Or _
          recvQuickCustMsg.foundInCList = "1" Then
          If UserLang = ARABIC Then
             abcStr = "«·⁄„Ì· „ÊÃÊœ ⁄·Ï «·ﬁ«∆„… «·”Êœ«¡"
          Else
             abcStr = "Customer is found as BlackList on "
          End If
    
          If recvQuickCustMsg.foundInAList = "1" Then
             abcStr = abcStr & "A "
          End If
          If recvQuickCustMsg.foundInBList = "1" Then
             abcStr = abcStr & ",B "
          End If
          If recvQuickCustMsg.foundInCList = "1" Then
             abcStr = abcStr & ",C "
          End If
          If UserLang = ARABIC Then
             abcStr = abcStr & "„‰ ﬁ»· :" & recvQuickCustMsg.reportedBank & _
                      " «”„ «·⁄„Ì· :" & recvQuickCustMsg.nameInABCList
          Else
             abcStr = abcStr & "reported by : " & recvQuickCustMsg.reportedBank & _
                      " in the name :" & recvQuickCustMsg.nameInABCList
          End If
          MsgBox abcStr
       End If
    
       If recvQuickCustMsg.foundInTlist = "1" Then
          response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
          If response = vbYes Then
             fillSearchEngineForm Val(recvQuickCustMsg.noOfRecs)
             frmSearchEngine.Show vbModal
          End If
       End If
       frmQuickCustOpen.Show
    Else
       If UserLang = ARABIC Then
          MsgBox recvQuickCustMsg.aRemarks
       Else
          MsgBox recvQuickCustMsg.eRemarks
       End If
       Unload Me
    End If
End Sub
Public Sub loadInternalCustomerForm()
   Dim tmpStr As String
    If recvQuickCustMsg.status = "000" Then
       Me.Hide
       If activityFlag = "S" Then
          supervisorAction = True
          tellerAction = False
       Else
          tellerAction = True
          supervisorAction = False
       End If
       searchAction = False
       updateAction = False
       custHistoryAction = False
           
       frmInternalCustOpen.MousePointer = vbDefault
       'frmIndividualOthers.cmdSupervisorComments.Enabled = True
       fillFrmInternalCustOpen
       If recvQuickCustMsg.foundInAList = "1" Or _
          recvQuickCustMsg.foundInBList = "1" Or _
          recvQuickCustMsg.foundInCList = "1" Then
          If UserLang = ARABIC Then
             abcStr = "«·⁄„Ì· „ÊÃÊœ ⁄·Ï «·ﬁ«∆„… «·”Êœ«¡"
          Else
             abcStr = "Customer is found as BlackList on "
          End If
    
          If recvQuickCustMsg.foundInAList = "1" Then
             abcStr = abcStr & "A "
          End If
          If recvQuickCustMsg.foundInBList = "1" Then
             abcStr = abcStr & ",B "
          End If
          If recvQuickCustMsg.foundInCList = "1" Then
             abcStr = abcStr & ",C "
          End If
          If UserLang = ARABIC Then
             abcStr = abcStr & "„‰ ﬁ»· :" & recvQuickCustMsg.reportedBank & _
                      " «”„ «·⁄„Ì· :" & recvQuickCustMsg.nameInABCList
          Else
             abcStr = abcStr & "reported by : " & recvQuickCustMsg.reportedBank & _
                      " in the name :" & recvQuickCustMsg.nameInABCList
          End If
          MsgBox abcStr
       End If
    
       If recvQuickCustMsg.exisingCustomer = "1" Then
          If UserLang = ARABIC Then
             tmpStr = "«·⁄„Ì· „œŒ· ”«»ﬁ« .. —ﬁ„ «·⁄„Ì·:" & _
                 recvQuickCustMsg.existCustNo & "  Ê " & _
                 "«”„ «·⁄„Ì·:" & recvQuickCustMsg.existCustName
          Else
              tmpStr = "Customer Already Exists,  CustNo :" & _
                 recvQuickCustMsg.existCustNo & "  and " & _
                 "Customer Name :" & recvQuickCustMsg.existCustName
          End If
          MsgBox tmpStr
       End If
       If recvQuickCustMsg.foundInTlist = "1" Then
          response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
          If response = vbYes Then
             fillSearchEngineForm Val(recvQuickCustMsg.noOfRecs)
             frmSearchEngine.Show vbModal
          End If
       End If
       frmInternalCustOpen.Show
    Else
       If UserLang = ARABIC Then
          MsgBox recvQuickCustMsg.aRemarks
       Else
          MsgBox recvQuickCustMsg.eRemarks
       End If
       Unload Me
    End If
End Sub

Private Sub MSFlexGrid1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
''Added by Mohit on 12-Dec-2006 under Quick Pension Customer opening
Public Sub loadQuickPenCustomerForm()
   Dim tmpStr As String
    If recvQuickCustMsg.status = "000" Then
    
       ''Me.Hide    'Commented by Mohit on 13-Dec-2006,
                    'because it generates a bug when supervisor opens "Supervisor Pending list" screen for approval
                    'The senarios is -
                    '1. Open "CSO Pending list" screen from Customer Enteris pending action menu.
                    '2. Select any customer to update or just to open a customer updation screen.
                    '3. And then close it. You will get Customer Enquiry screen.
                    '4. Now logoff from CSO id and login as Supervisor.
                    '5. Now click for "Customer Enteris Pending Approval" menu.
                    '6. Here is the issue - It will display the same "CSO Pending List" screen.
       If activityFlag = "S" Then
          supervisorAction = True
          tellerAction = False
       Else
          tellerAction = True
          supervisorAction = False
       End If
       searchAction = False
       updateAction = False
       custHistoryAction = False
           
       frmQuickPenCustOpen.MousePointer = vbDefault
       'frmQuickPenCustOpen.cmdSupervisorComments.Enabled = True
       fillFrmQuickPenCustOpen
       If recvQuickCustMsg.foundInAList = "1" Or _
          recvQuickCustMsg.foundInBList = "1" Or _
          recvQuickCustMsg.foundInCList = "1" Then
          If UserLang = ARABIC Then
             abcStr = "«·⁄„Ì· „ÊÃÊœ ⁄·Ï «·ﬁ«∆„… «·”Êœ«¡"
          Else
             abcStr = "Customer is found as BlackList on "
          End If
    
          If recvQuickCustMsg.foundInAList = "1" Then
             abcStr = abcStr & "A "
          End If
          If recvQuickCustMsg.foundInBList = "1" Then
             abcStr = abcStr & ",B "
          End If
          If recvQuickCustMsg.foundInCList = "1" Then
             abcStr = abcStr & ",C "
          End If
          If UserLang = ARABIC Then
             abcStr = abcStr & "„‰ ﬁ»· :" & recvQuickCustMsg.reportedBank & _
                      " «”„ «·⁄„Ì· :" & recvQuickCustMsg.nameInABCList
          Else
             abcStr = abcStr & "reported by : " & recvQuickCustMsg.reportedBank & _
                      " in the name :" & recvQuickCustMsg.nameInABCList
          End If
          MsgBox abcStr
       End If
    
       If recvQuickCustMsg.exisingCustomer = "1" Then
          If UserLang = ARABIC Then
             tmpStr = "«·⁄„Ì· „œŒ· ”«»ﬁ« .. —ﬁ„ «·⁄„Ì·:" & _
                 recvQuickCustMsg.existCustNo & "  Ê " & _
                 "«”„ «·⁄„Ì·:" & recvQuickCustMsg.existCustName
          Else
              tmpStr = "Customer Already Exists,  CustNo :" & _
                 recvQuickCustMsg.existCustNo & "  and " & _
                 "Customer Name :" & recvQuickCustMsg.existCustName
          End If
          MsgBox tmpStr
       End If
       If recvQuickCustMsg.foundInTlist = "1" Then
          response = MsgBox(errFoundInTlist(UserLang), vbYesNo)
          If response = vbYes Then
             fillSearchEngineForm Val(recvQuickCustMsg.noOfRecs)
             frmSearchEngine.Show vbModal
          End If
       End If
       frmQuickPenCustOpen.Show
    Else
       If UserLang = ARABIC Then
          MsgBox recvQuickCustMsg.aRemarks
       Else
          MsgBox recvQuickCustMsg.eRemarks
       End If
       Unload Me
    End If
End Sub
