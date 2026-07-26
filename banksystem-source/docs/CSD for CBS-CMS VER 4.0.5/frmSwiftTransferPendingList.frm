VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSwiftTransferPendingList 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00BFD87E&
   Caption         =   "Swift Transfer Pending List for centre branch"
   ClientHeight    =   7095
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12060
   ControlBox      =   0   'False
   LinkTopic       =   "Form3"
   MDIChild        =   -1  'True
   ScaleHeight     =   7095
   ScaleWidth      =   12060
   WindowState     =   2  'Maximized
   Begin VB.ComboBox cmbBranchcode 
      Height          =   315
      Left            =   2220
      TabIndex        =   6
      Top             =   750
      Width           =   1980
   End
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4665
      TabIndex        =   5
      ToolTipText     =   "Check pending List"
      Top             =   750
      Width           =   2295
   End
   Begin VB.CommandButton cmdGetDetails 
      Caption         =   "Get Details"
      Height          =   375
      Left            =   4320
      TabIndex        =   4
      Top             =   7260
      Width           =   1815
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   6315
      TabIndex        =   3
      Top             =   7230
      Width           =   1695
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   2475
      TabIndex        =   2
      Top             =   7245
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid swiftPendingGrid 
      Height          =   5640
      Left            =   810
      TabIndex        =   1
      Top             =   1290
      Width           =   10035
      _ExtentX        =   17701
      _ExtentY        =   9948
      _Version        =   393216
      Rows            =   26
      Cols            =   7
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
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
   Begin VB.Label lblBranchCode 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code"
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
      Left            =   990
      TabIndex        =   7
      Top             =   780
      Width           =   1095
   End
   Begin VB.Label lblSwiftPendingActivity 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Swift Pending Activity For Supervisor"
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
      Height          =   435
      Left            =   2985
      TabIndex        =   0
      Top             =   120
      Width           =   6480
   End
End
Attribute VB_Name = "frmSwiftTransferPendingList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmbBranchCode_Validate(Cancel As Boolean)
   Dim i As Integer
   Dim tCode As String
   
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbBranchcode.text)) <> 0 Then
         tCode = Mid$(cmbBranchcode.text, 1, 4)
         For i = 0 To cmbBranchcode.ListCount
             If Mid$(cmbBranchcode.List(i), 1, 4) = tCode Then
                cmbBranchcode.ListIndex = i
                Exit For
             End If
         Next i
      End If
             
      If i > cmbBranchcode.ListCount Then
         MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbBranchcode.SetFocus
         Cancel = True
      End If
   End If
   On Error GoTo 0
End Sub

Private Sub cmdCheckPendingList_Click()
  Dim tCustNo As String
  If Len(Trim(Mid$(cmbBranchcode, 1, 4))) = 0 Then
     cmbBranchcode = Space(4)
  End If
  If swiftSupervisorAction = True Then
     frmEnquiry.readSwiftTransferPendingList "00000", "S", Mid$(cmbBranchcode, 1, 4)
  Else
     frmEnquiry.readSwiftTransferPendingList "00000", "T", Mid$(cmbBranchcode, 1, 4)
  End If
  CSD_mdiForm.staticStatus.Panels(3).text = "   "
  displayResponseInGrid
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdGetDetails_Click()
    getSwiftTransferPendingDetails
End Sub

Private Sub cmdMore_Click()
   Dim reqdBranch As String
   If recvSwiftTransferPendingList.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
      
   If Len(RTrim(cmbBranchcode)) <> 0 Then
      reqdBranch = Mid$(cmbBranchcode, 1, 4)
   Else
      reqdBranch = Space(10)
   End If
   
   If swiftSupervisorAction = True Then
      frmEnquiry.readSwiftTransferPendingList recvSwiftTransferPendingList.lastRecCount, "S", reqdBranch
   Else
      frmEnquiry.readSwiftTransferPendingList recvSwiftTransferPendingList.lastRecCount, "T", reqdBranch
   End If
   
   If recvSwiftTransferPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
   End If
      
   displayResponseInGrid
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If swiftSupervisorAction = True Then
       frmSwiftTransferPendingList.Caption = frmSwiftTransferPendingListCaption(0, UserLang)
       lblSwiftPendingActivity.Caption = frmSwiftTransferPendingListCaption(0, UserLang)
    Else
       frmSwiftTransferPendingList.Caption = frmSwiftTransferPendingListCaption(1, UserLang)
       lblSwiftPendingActivity.Caption = frmSwiftTransferPendingListCaption(1, UserLang)
    End If
    lblBranchCode.Caption = frmSwiftTransferPendingListCaption(2, UserLang)
    cmdCheckPendingList.Caption = frmSwiftTransferPendingListCaption(3, UserLang)
    cmdMore.Caption = frmSwiftTransferPendingListCaption(4, UserLang)
    cmdGetDetails.Caption = frmSwiftTransferPendingListCaption(5, UserLang)
    cmdExit.Caption = frmSwiftTransferPendingListCaption(6, UserLang)

    mQry = "select branchcode,arabicname,englishname from branchinfo"
    Set rs = db.OpenRecordset(mQry)

    If rs.recordCount > 0 Then
       cmbBranchcode.Clear
       rs.MoveFirst
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbBranchcode.AddItem rs(0) & "-" & rs(2)
          Else
             cmbBranchcode.AddItem rs(0) & "-" & rs(1)
          End If
          rs.MoveNext
       Loop
    End If
    
    displayResponseInGrid
End Sub

Public Sub displayResponseInGrid()

  printGridHeading
  For i = 1 To Val(recvSwiftTransferPendingList.noOfRecs)
      swiftPendingGrid.Row = i
      swiftPendingGrid.Col = 0
      swiftPendingGrid.text = recvSwiftTransferPendingList.details(i).userId
      swiftPendingGrid.Col = 1
      swiftPendingGrid.text = recvSwiftTransferPendingList.details(i).dateTime
      swiftPendingGrid.Col = 2
      swiftPendingGrid.CellAlignment = flexAlignLeftCenter
      swiftPendingGrid.text = recvSwiftTransferPendingList.details(i).transRefNo
      swiftPendingGrid.Col = 3
      swiftPendingGrid.CellAlignment = flexAlignLeftCenter
      swiftPendingGrid.text = formatDate(recvSwiftTransferPendingList.details(i).issueDate)
      swiftPendingGrid.Col = 4
      swiftPendingGrid.CellAlignment = flexAlignLeftCenter
      swiftPendingGrid.text = recvSwiftTransferPendingList.details(i).branchCode
      swiftPendingGrid.Col = 5
      swiftPendingGrid.CellAlignment = flexAlignLeftCenter
      swiftPendingGrid.text = recvSwiftTransferPendingList.details(i).applicantName
      swiftPendingGrid.Col = 6
      swiftPendingGrid.CellAlignment = flexAlignLeftCenter
      swiftPendingGrid.text = recvSwiftTransferPendingList.details(i).benefName
   Next i
   swiftPendingGrid.Row = 1
End Sub

Public Sub printGridHeading()
   Dim tWidth As Integer
   Dim colwidth(8) As Integer
   Dim rowTitle(8) As String
   
   colwidth(0) = 1000
   colwidth(1) = 1500
   colwidth(2) = 1000
   colwidth(3) = 1500
   colwidth(4) = 1000
   colwidth(5) = 2000
   colwidth(6) = 2000
    

   rowTitle(0) = "User Id"
   rowTitle(1) = "Date & Time"
   rowTitle(2) = "Trans Ref.No."
   rowTitle(3) = "Trans.Date"
   rowTitle(4) = "Issue Branch Code"
   rowTitle(5) = "Applicant Name"
   rowTitle(6) = "Beneficiary Name"

   tWidth = 0
   swiftPendingGrid.Clear
   swiftPendingGrid.Row = 0
   For i = 0 To 6
      swiftPendingGrid.Col = i
      If UserLang = ARABIC Then
         swiftPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         swiftPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      swiftPendingGrid.text = frmSwiftTransferPendingListCaption(i + 7, UserLang)
      'swiftPendingGrid.text = rowTitle(i)
      swiftPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
   Next i
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub swiftPendingGrid_DblClick()
    getSwiftTransferPendingDetails
End Sub

Public Sub getSwiftTransferPendingDetails()

    Dim tTransRefNo As String
    Dim tDateTime As String
    Dim strmsglen As String
    Dim tCode As String
    Dim tUserid As String
    
    swiftPendingGrid.Col = 0
    tUserid = Format(swiftPendingGrid.text, "!@@@@@@@@@@")
    swiftPendingGrid.Col = 1
    tDateTime = swiftPendingGrid.text
       
    If Len(RTrim(tUserid)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    SendMsg = "000048" & "83" & gBranchCode & tUserid & Space(10) & Space(8) & "02" & gBranchCode & tDateTime & Space(50)
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSwiftTransferPendingList.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmSwiftTransferPendingList.MousePointer = vbDefault
       Exit Sub
    End If
    frmSwiftTransferPendingList.MousePointer = vbDefault
    
    parseSarieTransferDetail
    
    If recvTransferDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTransferDetail.aRemarks
       Else
          MsgBox recvTransferDetail.eRemarks
       End If
       Exit Sub
    End If
    frmSwiftTransferDetail.Show
    fillFrmSwiftTransferDetail
End Sub

Private Sub swiftPendingGrid_KeyDown(KeyCode As Integer, Shift As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
