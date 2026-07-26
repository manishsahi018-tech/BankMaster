VERSION 5.00
Begin VB.Form frmCustCategorize 
   Appearance      =   0  'Flat
   BackColor       =   &H00BFD87E&
   Caption         =   "Customer Categorization"
   ClientHeight    =   7020
   ClientLeft      =   2325
   ClientTop       =   1920
   ClientWidth     =   8850
   ControlBox      =   0   'False
   DrawWidth       =   5
   FillColor       =   &H00C0FFC0&
   FillStyle       =   0  'Solid
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7020
   ScaleWidth      =   8850
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtCustName 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   2895
      TabIndex        =   15
      Top             =   2190
      Width           =   4815
   End
   Begin VB.TextBox txtCustNo 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2895
      TabIndex        =   14
      Top             =   1860
      Width           =   1185
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00BFD87E&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   1320
      TabIndex        =   0
      Top             =   2700
      Width           =   6330
      Begin VB.CommandButton cmdQuickPenCustomer 
         BackColor       =   &H00FFC0C0&
         Caption         =   "Quick &Pension Customer"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   4065
         MaskColor       =   &H00FFC0C0&
         TabIndex        =   16
         Tag             =   "6330"
         ToolTipText     =   "Quick Pension Customer"
         Top             =   2235
         Width           =   1575
      End
      Begin VB.CommandButton cmdPbNewCust 
         BackColor       =   &H00FFC0C0&
         Caption         =   "New Customer via phone"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   765
         MaskColor       =   &H00FFC0C0&
         TabIndex        =   4
         Tag             =   "6330"
         ToolTipText     =   "New Customer via phone"
         Top             =   2235
         Width           =   1575
      End
      Begin VB.CommandButton cmdInternalCust 
         BackColor       =   &H00FFC0C0&
         Caption         =   "&Internal Customer"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   2400
         MaskColor       =   &H00FFC0C0&
         TabIndex        =   6
         Tag             =   "6330"
         ToolTipText     =   "Internal Customer"
         Top             =   2235
         Width           =   1590
      End
      Begin VB.ComboBox cmbMainCategory 
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2160
         TabIndex        =   1
         Tag             =   "6330"
         Text            =   "cmbMainCategory"
         Top             =   720
         Width           =   3495
      End
      Begin VB.CommandButton cmdQuickCustomer 
         BackColor       =   &H00FFC0C0&
         Caption         =   "&Quick Customer"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2415
         MaskColor       =   &H00FFC0C0&
         TabIndex        =   5
         Tag             =   "6330"
         ToolTipText     =   "Quick Customer"
         Top             =   1800
         Width           =   1575
      End
      Begin VB.CommandButton cmdCancel 
         BackColor       =   &H00FFC0C0&
         Caption         =   "&Cancel"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   4065
         MaskColor       =   &H00FFC0C0&
         TabIndex        =   7
         Tag             =   "6330"
         ToolTipText     =   "Cancel"
         Top             =   1800
         Width           =   1575
      End
      Begin VB.CommandButton cmdNewUpdCust 
         BackColor       =   &H00FFC0C0&
         Caption         =   "&New/Upd Customer"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   765
         MaskColor       =   &H00FFC0C0&
         TabIndex        =   3
         Tag             =   "6330"
         ToolTipText     =   "New/Upd Customer"
         Top             =   1800
         Width           =   1575
      End
      Begin VB.ComboBox cmbSubCategory 
         BackColor       =   &H00E0E0E0&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2160
         TabIndex        =   2
         Tag             =   "6330"
         Text            =   "cmbSubCategory"
         Top             =   1080
         Width           =   3495
      End
      Begin VB.Label lblMainCategory 
         BackColor       =   &H00BFD87E&
         Caption         =   "Main Category:"
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
         Left            =   465
         TabIndex        =   10
         Tag             =   "6330"
         Top             =   705
         Width           =   1455
      End
      Begin VB.Label lblSubCategory 
         BackColor       =   &H00BFD87E&
         Caption         =   "Sub Category:"
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
         Left            =   465
         TabIndex        =   9
         Tag             =   "6330"
         Top             =   1200
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackColor       =   &H00BFD87E&
         Caption         =   " "
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   600
         TabIndex        =   8
         Top             =   1680
         Width           =   1095
      End
   End
   Begin VB.Label lblCustomerName 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name"
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
      Height          =   195
      Left            =   1365
      TabIndex        =   13
      Top             =   2220
      Width           =   1335
   End
   Begin VB.Label lblCustomerNo 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer No."
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
      Height          =   195
      Left            =   1365
      TabIndex        =   12
      Top             =   1860
      Width           =   1155
   End
   Begin VB.Label lblCustomerCategory 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Static Data - Customer Creation"
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
      Height          =   360
      Left            =   3600
      TabIndex        =   11
      Top             =   1215
      Width           =   6495
   End
   Begin VB.Image Image1 
      Height          =   1335
      Left            =   30
      Picture         =   "frmCustCategorize.frx":0000
      Top             =   -15
      Width           =   2775
   End
End
Attribute VB_Name = "frmCustCategorize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmbMainCategory_Click()
 Dim tCode As String
 Dim mQry As String
 Dim rs1 As Recordset
 
 tCode = Mid$(cmbMainCategory, 1, 2)
 mQry = "select samasubcategory from categoryconfiginfo where samamaincategory = '" & _
                                                              tCode & "'"
 Set rs = db.OpenRecordset(mQry)
 If rs.recordCount > 0 Then
    cmbSubCategory.Clear
    rs.MoveFirst
    Do While Not rs.EOF
       tCode = rs(0)
       mQry = "select arabicname,englishname from samasubcategoryinfo where " & _
                    "subcategorycode = '" & tCode & "'"
       Set rs1 = db.OpenRecordset(mQry)
       If rs1.recordCount > 0 Then
          If UserLang = ENGLISH Then
             cmbSubCategory.AddItem tCode & "-" & rs1(1)
          Else
             cmbSubCategory.AddItem tCode & "-" & rs1(0)
          End If
       Else
          cmbSubCategory.AddItem tCode & "-Not defined in local"
       End If
       rs.MoveNext
    Loop
Else
   cmbSubCategory.Clear
End If
frmCustCategorize.Refresh

End Sub

Private Sub cmbMainCategory_LostFocus()
Dim i As Integer
Dim tCode As String

If Screen.ActiveControl.Name = "cmdCancel" Then
    DoEvents
Else
   On Error Resume Next
   If Len(RTrim(cmbMainCategory.text)) <> 0 Then
      tCode = Mid$(cmbMainCategory.text, 1, 2)
      For i = 0 To cmbMainCategory.ListCount
          If Mid$(cmbMainCategory.List(i), 1, 2) = tCode Then
             cmbMainCategory.ListIndex = i
             Exit For
          End If
      Next i
   End If
   If i > cmbMainCategory.ListCount Then
      MsgBox errInvalidMainCategory(UserLang)
      cmbMainCategory.SetFocus
      Exit Sub
   End If
 End If
 On Error GoTo 0

End Sub

Private Sub cmbSubCategory_Click()
    frmCustCategorize.Refresh
End Sub

Private Sub cmbSubCategory_LostFocus()
Dim i As Integer
Dim tCode As String

If Screen.ActiveControl.Name = "cmdCancel" Then
    DoEvents
Else
   On Error Resume Next
   If Len(RTrim(cmbSubCategory.text)) <> 0 Then
      tCode = Mid$(cmbSubCategory.text, 1, 2)
      For i = 0 To cmbSubCategory.ListCount
          If Mid$(cmbSubCategory.List(i), 1, 2) = tCode Then
             cmbSubCategory.ListIndex = i
             Exit For
          End If
      Next i
   End If
   If i > cmbSubCategory.ListCount Then
      MsgBox errInvalidSubCategory(UserLang)
      cmbSubCategory.SetFocus
      Exit Sub
   End If
 End If
 On Error GoTo 0
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdInternalCust_Click()
    screenSetNo = "8"
    phoneCustOpenAction = False
    frmCustCategorize.tag = "I"
    frmInternalCustOpen.Show
End Sub

Private Sub cmdNewUpdCust_Click()
    Dim tCustNo As String
    Dim strmsglen As String
            
    mainCategoryCode = Mid$(cmbMainCategory, 1, 2)
    subCategoryCode = Mid$(cmbSubCategory, 1, 2)
    
    If Len(RTrim(mainCategoryCode)) = 0 Or Len(RTrim(subCategoryCode)) = 0 Then
       MsgBox errSelectCategory(UserLang)
       Exit Sub
    End If
        
    If mainCategoryCode = "00" And subCategoryCode = "00" Then
       MsgBox errInvalidCategory(UserLang)
       Exit Sub
    End If
    
    ''Added by Mohit on 12-Dec-2006 because -
    ''1. Customer with sub-category 56(Internal customer) should not be updated with some other sub-category.
    ''2. Customer with sub-category 99(Quick Pension customer) should not be updated with sub-category 56 & 99.
    ''3. It should display error message on click of "New Customer" button when sub-category is 56 or 99. Requested by Arul
    If Not updateAction Then
        If mainCategoryCode = "00" And subCategoryCode = "99" Then      '99 - Pensioner Initial Opening
           MsgBox errInvalidCategory(UserLang)
           Exit Sub
        End If
    End If
    
    If updateAction Then
        If glb_subCategoryCode = "99" Then      'Quick Pension Customer
           If subCategoryCode = "56" Or subCategoryCode = "99" Then      ' 56 - Internal Customer;  99 - Pensioner Initial Opening
                MsgBox errInvalidCategory(UserLang)
                Exit Sub
            End If
         ElseIf glb_subCategoryCode = "56" And subCategoryCode <> "56" Then     ' Internal Customer
            MsgBox errInvalidCategory(UserLang)
            Exit Sub
         ElseIf glb_subCategoryCode <> "56" And glb_subCategoryCode <> "99" Then     ' Internal Customer and Quick Pension customer
           If subCategoryCode = "56" Or subCategoryCode = "99" Then      ' 56 - Internal Customer;  99 - Pensioner Initial Opening
                MsgBox errInvalidCategory(UserLang)
                Exit Sub
            End If
         End If
     End If
     'Till here by Mohit on 12-Dec-2006
    
    mainCategoryDesc = Mid(cmbMainCategory, 4)
    subCategoryDesc = Mid(cmbSubCategory, 4)
    
    SendMsg = "000000" & "70" & gBranchCode & mainCategoryCode & subCategoryCode
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
     
    parseCheckCategoryResponse
    
    If recvCheckCategoryMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCheckCategoryMsg.aRemarks
       Else
          MsgBox recvCheckCategoryMsg.eRemarks
       End If
       Exit Sub
    End If
     
    If recvCheckCategoryMsg.categoryStatus = "0" Then
       MsgBox errInvalidCategory(UserLang)
       Exit Sub
    End If
    
    If Not updateAction Then
       noOfJoint = "0"
       noOfOwners = "0"
       noOfSignatory = "0"
       noOfReference = "0"
       noOfHeir = "0"
       documentsSelected = Space(60)
       otherDocumentsEntered = Space(50)
    End If

    screenSetNo = getScreenSetNo()   ' before calling this function, main & sub category should be set
    
    If screenSetNo = "-1" Then
       MsgBox errGetingScreenNo(UserLang) '   "Error while getting screen set no for main category " & mainCategoryCode & " sub category   " & subCategoryCode & _
                                          '   "Please call SUPPORT"
       Exit Sub
    End If
    phoneCustOpenAction = False
    
    gDateTime = Space(14)
   
    If updateAction Then
       tCustNo = Format(Trim(txtCustNo), "!@@@@@@@")
       SendMsg = "000048" & "11" & gBranchCode & "02" & tCustNo & Space(21) & screenSetNo & "1"
       frmCustCategorize.MousePointer = vbHourglass
       frmCustCategorize.cmdCancel.Enabled = False
       frmCustCategorize.cmdNewUpdCust.Enabled = False
       frmCustCategorize.cmdQuickCustomer.Enabled = False
       strmsglen = Format(Len(SendMsg), "000000")
       Mid$(SendMsg, 1, 6) = strmsglen
       DataReceivedFlag = False
       ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
       frmCustCategorize.MousePointer = vbDefault
       frmCustCategorize.cmdCancel.Enabled = True
       frmCustCategorize.cmdNewUpdCust.Enabled = True
       If ReturnStatus = LocalCommsError Then
          LoadError = True
          Exit Sub
       End If
       If screenSetNo = "1" Or screenSetNo = "A" Then
          parseSaudiIndividualDetail
          gDateTime = recvSaudiIndividualMsg.keyDateTime
       ElseIf screenSetNo = "2" Then
          parseIndividualOthersDetail
          gDateTime = recvOtherIndividualMsg.keyDateTime
       ElseIf screenSetNo = "3" Or screenSetNo = "4" Or screenSetNo = "5" Or screenSetNo = "6" Then
          parseJuristicDetail
          gDateTime = recvJuristicMsg.keyDateTime
       ElseIf screenSetNo = "8" Or screenSetNo = "9" Then   ''screenSetNo 9, was added by Mohit on 12-Dec-2006 under Quick pension customer opening
          parseQuickCustomerDetail
          gDateTime = recvQuickCustMsg.keyDateTime
       End If
       frmEnquirySelect.loadCorrespondingForm
    ElseIf screenSetNo = "1" Or screenSetNo = "A" Then
       frmIndividualSaudi.Show
    ElseIf screenSetNo = "2" Then
       frmIndividualOthers.Show
    ElseIf screenSetNo = "3" Or screenSetNo = "4" Then
       frmJuristicMain.Show
    ElseIf screenSetNo = "5" Then
       frmJuristicDiplomats.Show
    ElseIf screenSetNo = "6" Then
       frmJuristicNonResident.Show
'    ElseIf screenSetNo = "A" Then
'       frmIndividualHeirs.Show
    End If
    
End Sub

Public Sub parseCheckCategoryResponse()

recvCheckCategoryMsg.status = Mid$(RecvStr, 1, 3)
recvCheckCategoryMsg.service = Mid$(RecvStr, 4, 2)
recvCheckCategoryMsg.aRemarks = Mid$(RecvStr, 6, 50)
recvCheckCategoryMsg.eRemarks = Mid$(RecvStr, 56, 50)
recvCheckCategoryMsg.samaMainCategory = Mid$(RecvStr, 106, 2)
recvCheckCategoryMsg.samaSubCategory = Mid$(RecvStr, 108, 2)
recvCheckCategoryMsg.categoryStatus = Mid$(RecvStr, 110, 1)
recvCheckCategoryMsg.generalCustOpenAllowed = Mid$(RecvStr, 111, 1)

End Sub

Private Sub cmdPbNewCust_Click()
    Dim tCustNo As String
    Dim strmsglen As String
        
    mainCategoryCode = Mid$(cmbMainCategory, 1, 2)
    subCategoryCode = Mid$(cmbSubCategory, 1, 2)
    
    If Len(RTrim(mainCategoryCode)) = 0 Or Len(RTrim(subCategoryCode)) = 0 Then
       MsgBox errSelectCategory(UserLang)
       Exit Sub
    End If
        
    If mainCategoryCode = "00" And subCategoryCode = "00" Then
       MsgBox errInvalidCategory(UserLang)
       Exit Sub
    End If
    
    mainCategoryDesc = Mid(cmbMainCategory, 4)
    subCategoryDesc = Mid(cmbSubCategory, 4)
    
    If mainCategoryCode <> "01" Then 'Only Retail customer can be opened througe phone
       MsgBox errOnlyIndividualCustAllowed(UserLang)  '"Only Individual customer can be opened throgh phone banking...please try again.."
       Exit Sub
    End If
    
    SendMsg = "000000" & "70" & gBranchCode & mainCategoryCode & subCategoryCode
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
     
    parseCheckCategoryResponse
    
    If recvCheckCategoryMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCheckCategoryMsg.aRemarks
       Else
          MsgBox recvCheckCategoryMsg.eRemarks
       End If
       Exit Sub
    End If
     
    If recvCheckCategoryMsg.categoryStatus <> "1" Then
       MsgBox errInvalidCategory(UserLang)
       Exit Sub
    End If
    
    If recvCheckCategoryMsg.generalCustOpenAllowed <> "1" Then
       MsgBox errGeneralCustOpenNotAllowed(UserLang)   '"General customer opening not allowed for this category ... Please check .. "
       Exit Sub
    End If
    
    If Not updateAction Then
       noOfJoint = "0"
       noOfOwners = "0"
       noOfSignatory = "0"
       noOfReference = "0"
       documentsSelected = Space(60)
       otherDocumentsEntered = Space(50)
    End If

    screenSetNo = getScreenSetNo()   ' before calling this function, main & sub category should be set
    
    If screenSetNo = "-1" Then
       MsgBox errGetingScreenNo(UserLang) '   "Error while getting screen set no for main category " & mainCategoryCode & " sub category   " & subCategoryCode & _
                                          '   "Please call SUPPORT"
       Exit Sub
    End If
    phoneCustOpenAction = True
    
    gDateTime = Space(14)
    If screenSetNo = "1" Or screenSetNo = "A" Then
       frmIndividualSaudi.Show
    ElseIf screenSetNo = "2" Then
       frmIndividualOthers.Show
    End If
    
End Sub

Private Sub cmdQuickCustomer_Click()
    screenSetNo = "7"
    phoneCustOpenAction = False
    frmCustCategorize.tag = " "
    frmQuickCustOpen.Show
End Sub

'cmdQuickPenCustomer button added by Mohit on 27-Nov-2006 under Pension account opening
Private Sub cmdQuickPenCustomer_Click()
    screenSetNo = "9"
    phoneCustOpenAction = False
    frmCustCategorize.tag = " "
    frmQuickPenCustOpen.Show
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    Dim tmpStr As String
    
    If UserLang = ARABIC Then
       ChangePositions frmCustCategorize, 11800
       frmCustCategorize.RightToLeft = True
    End If
    
    
    mQry = "select maincategorycode,arabicname,englishname from samamaincategoryinfo"
    Set rs = db.OpenRecordset(mQry)
    
    If rs.recordCount > 0 Then
       cmbMainCategory.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbMainCategory.AddItem rs(0) & "-" & rs(2)
           Else
              cmbMainCategory.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If
    
    mQry = "select subcategorycode,arabicname,englishname from samasubcategoryinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       cmbSubCategory.Clear
       rs.MoveFirst
       Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbSubCategory.AddItem rs(0) & "-" & rs(2)
           Else
              cmbSubCategory.AddItem rs(0) & "-" & rs(1)
           End If
           rs.MoveNext
       Loop
    End If
    
    If updateAction Then
       tmpStr = frmCustCategoryCaption(0, UserLang) & "-" & frmCustCategoryCaption(7, UserLang)
    Else
       tmpStr = frmCustCategoryCaption(0, UserLang) & "-" & frmCustCategoryCaption(6, UserLang)
    End If
    frmCustCategorize.lblCustomerCategory.Caption = tmpStr
    frmCustCategorize.Caption = frmCustCategoryCaption(0, UserLang)
    frmCustCategorize.lblCustomerNo.Caption = frmCustCategoryCaption(1, UserLang)
    frmCustCategorize.lblCustomerName.Caption = frmCustCategoryCaption(2, UserLang)
    frmCustCategorize.lblMainCategory.Caption = frmCustCategoryCaption(3, UserLang)
    frmCustCategorize.lblSubCategory.Caption = frmCustCategoryCaption(4, UserLang)
    frmCustCategorize.cmdQuickCustomer.Caption = frmCustCategoryCaption(5, UserLang)
    If updateAction Then
       frmCustCategorize.cmdNewUpdCust.Caption = frmCustCategoryCaption(7, UserLang)
    Else
       frmCustCategorize.cmdNewUpdCust.Caption = frmCustCategoryCaption(6, UserLang)
    End If
    frmCustCategorize.cmdCancel.Caption = frmCustCategoryCaption(8, UserLang)
    frmCustCategorize.cmdInternalCust.Caption = frmCustCategoryCaption(9, UserLang)
    frmCustCategorize.cmdPbNewCust.Caption = frmCustCategoryCaption(10, UserLang)
    frmCustCategorize.cmdQuickPenCustomer.Caption = frmCustCategoryCaption(11, UserLang) 'Added by Mohit on 12-Dec-2006. Under Quick Pension customer opening
    If updateAction Then
       cmdQuickCustomer.Enabled = False
       cmdInternalCust.Enabled = False
       cmdInternalCust.Visible = False
       cmdPbNewCust.Enabled = False
       cmdPbNewCust.Visible = False
       'Added by Mohit on 28-Nov-2006. Under Quick Pension customer opening
       cmdQuickPenCustomer.Enabled = False
       cmdQuickPenCustomer.Visible = False
       
    Else
       cmdQuickCustomer.Enabled = True 'Nad Nov 17th 03
                                       'enabled as true by Rajesh on 11th feb 2006
       'If recvLoginMsg.internalCustOpenAllowed = "1" Then
       If enableInternalCustOpen = True Then
          cmdInternalCust.Enabled = True
          cmdInternalCust.Visible = True
          cmdInternalCust.Refresh
       Else
          cmdInternalCust.Enabled = False
          cmdInternalCust.Visible = False
       End If
       
       'Added by Mohit on 28-Nov-2006. Under Quick Pension customer opening
       If enablePensionCustOpen = True Then
          cmdQuickPenCustomer.Enabled = True
          cmdQuickPenCustomer.Visible = True
          cmdQuickPenCustomer.Refresh
       Else
          cmdQuickPenCustomer.Enabled = False
          cmdQuickPenCustomer.Visible = False
       End If
       'Till here
       
       If enableGeneralCustOpen = True Then
          cmdQuickCustomer.Enabled = False
          cmdNewUpdCust.Enabled = False
          cmdQuickPenCustomer.Enabled = False   'Added by Mohit on 28-Nov-2006. Under Quick Pension customer opening
          cmdPbNewCust.Enabled = True
          cmdPbNewCust.Visible = True
          cmdPbNewCust.Refresh
       Else
          cmdPbNewCust.Enabled = False
          cmdPbNewCust.Visible = False
       End If
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
