VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmPensionGrid 
   BackColor       =   &H00BFD87E&
   Caption         =   "Pension Infomation"
   ClientHeight    =   3210
   ClientLeft      =   60
   ClientTop       =   330
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3210
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.CommandButton CmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4920
      TabIndex        =   4
      ToolTipText     =   "Exit"
      Top             =   7680
      Width           =   1215
   End
   Begin VB.CommandButton CmdOk 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3480
      TabIndex        =   3
      ToolTipText     =   "View Details"
      Top             =   7680
      Width           =   1215
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   2040
      TabIndex        =   2
      ToolTipText     =   "Get Next Set of Records"
      Top             =   7680
      Width           =   1215
   End
   Begin MSFlexGridLib.MSFlexGrid pensionGrid 
      Height          =   5415
      Left            =   360
      TabIndex        =   0
      Top             =   1320
      Width           =   10740
      _ExtentX        =   18944
      _ExtentY        =   9551
      _Version        =   393216
      Rows            =   22
      Cols            =   7
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   1
   End
   Begin VB.Label lblPensionInfo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pension Information"
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
      Height          =   615
      Left            =   3600
      TabIndex        =   1
      Top             =   360
      Width           =   5895
   End
End
Attribute VB_Name = "frmPensionGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdMore_Click()
   If recvPensionSearchMsg.noOfRecs <> "20" Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   frmPensionEnquiry.searchPension recvPensionSearchMsg.lastRecCount
   
   If recvPensionSearchMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   
   Form_Load
       
End Sub

Private Sub cmdOk_Click()
   pensionGrid_DblClick
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow, tWidth, amtDenom, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim mQry, accStatus As String
    Dim tCcy, tDecimalPlace As String
    Static lastRecRead As String * 3
    
    colwidth(0) = 1300
    colwidth(1) = 1800
    colwidth(2) = 1300
    colwidth(3) = 1700
    colwidth(4) = 1300
    colwidth(5) = 1600
    colwidth(6) = 1600
    
'    If UserLang = ARABIC Then
'       ChangePositions frmPensionGrid, 12000
'       frmPensionGrid.RightToLeft = True
'    End If
    
    frmPensionGrid.Caption = frmPensionGridCaption(0, UserLang)
    frmPensionGrid.lblPensionInfo.Caption = frmPensionGridCaption(0, UserLang)
    frmPensionGrid.cmdMore.Caption = frmPensionGridCaption(8, UserLang)
    frmPensionGrid.cmdOk.Caption = frmPensionGridCaption(9, UserLang)
    frmPensionGrid.cmdCancel.Caption = frmPensionGridCaption(10, UserLang)
    
'    rowTitle(0) = "Pen Card No"
'    rowTitle(1) = " Pen Card Name "
'    rowTitle(2) = "Pen Id No"
'    rowTitle(3) = "Pen Hafiza No"
'    rowTitle(4) = "Pen Salary Amt"
'    rowTitle(5) = "Net Amount"
'    rowTitle(6) = "Payment Type"
        
    pensionGrid.Clear
    pensionGrid.Row = 0
    pensionGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 6
      pensionGrid.Col = i
      If UserLang = ARABIC Then
         pensionGrid.CellAlignment = flexAlignRightCenter
      Else
         pensionGrid.CellAlignment = flexAlignLeftCenter
      End If
      pensionGrid.text = frmPensionGridCaption(i + 1, UserLang)
      pensionGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
     
'    pensionGrid.Width = tWidth + 200
    
    For i = 1 To Val(recvPensionSearchMsg.noOfRecs)
         pensionGrid.Row = i
         pensionGrid.Col = 0
         pensionGrid.CellAlignment = flexAlignLeftCenter
         pensionGrid.text = recvPensionSearchMsg.details(i).penCardNo
         pensionGrid.Col = 1
         pensionGrid.CellAlignment = flexAlignRightCenter
         pensionGrid.text = recvPensionSearchMsg.details(i).penName
         pensionGrid.Col = 2
         pensionGrid.CellAlignment = flexAlignLeftCenter
         pensionGrid.text = recvPensionSearchMsg.details(i).penIdNo
         pensionGrid.Col = 3
         pensionGrid.CellAlignment = flexAlignLeftCenter
         pensionGrid.text = recvPensionSearchMsg.details(i).penHafNo
         pensionGrid.Col = 4
         pensionGrid.CellAlignment = flexAlignRightCenter
         pensionGrid.text = Format(Val(recvPensionSearchMsg.details(i).penSalAmt) / 100, "###########0.00")
         pensionGrid.Col = 5
         pensionGrid.CellAlignment = flexAlignRightCenter
         pensionGrid.text = Format(Val(recvPensionSearchMsg.details(i).netAmt) / 100, "###########0.00")
         pensionGrid.Col = 6
         pensionGrid.CellAlignment = flexAlignRightCenter
         pensionGrid.text = recvPensionSearchMsg.details(i).paymentType
   Next i
   
   pensionGrid.Row = 1
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub

Private Sub pensionGrid_DblClick()
    Dim tPenCardNo As String * 9
    Dim strmsglen As String
    Dim tCode As String
    Dim tUserid As String
    
    pensionGrid.Col = 0
    tPenCardNo = Format(pensionGrid.text, "!@@@@@@@@@")
    
    If Len(RTrim(tPenCardNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000048" + "41" + gBranchCode + tUserid + tPenCardNo
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmPensionGrid.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmPensionGrid.MousePointer = vbDefault
       Exit Sub
    End If
    frmPensionGrid.MousePointer = vbDefault
    
    parsePensionDetail
    
    If recvPensionDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvPensionDetail.aRemarks
       Else
          MsgBox recvPensionDetail.eRemarks
       End If
       Unload Me
       Exit Sub
    End If
    frmPensionDetail.Show
    fillPensionDetailsForm
    
End Sub

Public Sub parsePensionDetail()
    Dim i As Integer
    
    recvPensionDetail.status = Mid$(RecvStr, 1, 3)
    recvPensionDetail.service = Mid$(RecvStr, 4, 2)
    recvPensionDetail.aRemarks = Mid$(RecvStr, 6, 50)
    recvPensionDetail.eRemarks = Mid$(RecvStr, 56, 50)
    recvPensionDetail.penCardNo = Mid$(RecvStr, 106, 9)
    recvPensionDetail.penName = Mid$(RecvStr, 115, 40)
    recvPensionDetail.penHafNo = Mid$(RecvStr, 155, 10)
    recvPensionDetail.penHafPlC = Mid$(RecvStr, 165, 3)
    recvPensionDetail.penHafPl = Mid$(RecvStr, 168, 15)
    recvPensionDetail.penBtNo = Mid$(RecvStr, 183, 15)
    recvPensionDetail.reprName = Mid$(RecvStr, 198, 30)
    recvPensionDetail.reprIdNo = Mid$(RecvStr, 228, 10)
    recvPensionDetail.reprIdPl = Mid$(RecvStr, 238, 15)
    recvPensionDetail.penAccNo = Mid$(RecvStr, 253, 14)
    recvPensionDetail.penAmt = Mid$(RecvStr, 267, 9)
    recvPensionDetail.penDedn = Mid$(RecvStr, 276, 9)
    recvPensionDetail.penNett = Mid$(RecvStr, 285, 9)
    recvPensionDetail.branchCode = Mid$(RecvStr, 294, 3)
    recvPensionDetail.issuerNo = Mid$(RecvStr, 297, 9)
    recvPensionDetail.issueDate = Mid$(RecvStr, 306, 8)
    recvPensionDetail.cashStat = Mid$(RecvStr, 314, 16)
    recvPensionDetail.inHrNo = Mid$(RecvStr, 330, 2)
    recvPensionDetail.cardType = Mid$(RecvStr, 332, 7)
    recvPensionDetail.cardStat = Mid$(RecvStr, 339, 7)
    recvPensionDetail.paymentType = Mid$(RecvStr, 346, 5)
    recvPensionDetail.notes1 = Mid$(RecvStr, 351, 50)
    recvPensionDetail.notes2 = Mid$(RecvStr, 401, 50)
    recvPensionDetail.notes3 = Mid$(RecvStr, 451, 50)
    recvPensionDetail.notes4 = Mid$(RecvStr, 501, 50)
    recvPensionDetail.notes5 = Mid$(RecvStr, 551, 50)
    recvPensionDetail.notes6 = Mid$(RecvStr, 601, 50)
    recvPensionDetail.notes7 = Mid$(RecvStr, 651, 50)
    recvPensionDetail.notes8 = Mid$(RecvStr, 701, 50)
    recvPensionDetail.notes9 = Mid$(RecvStr, 751, 50)
    recvPensionDetail.notes10 = Mid$(RecvStr, 801, 50)
    recvPensionDetail.notes11 = Mid$(RecvStr, 851, 50)
    recvPensionDetail.notes12 = Mid$(RecvStr, 901, 50)
    recvPensionDetail.notes13 = Mid$(RecvStr, 951, 50)
    recvPensionDetail.notes14 = Mid$(RecvStr, 1001, 50)
    recvPensionDetail.notes15 = Mid$(RecvStr, 1051, 50)
    recvPensionDetail.subCard = Mid$(RecvStr, 1101, 2)
End Sub

Public Sub fillPensionDetailsForm()
    frmPensionDetail.txtPenCardNo = recvPensionDetail.penCardNo
    frmPensionDetail.txtPensionName = recvPensionDetail.penName
    frmPensionDetail.txtHfzNo = recvPensionDetail.penHafNo
    frmPensionDetail.txtHafIssSrc = recvPensionDetail.penHafPlC
    frmPensionDetail.txtIssuanceSource = recvPensionDetail.penHafPl
    frmPensionDetail.txtSaudiIdNo = recvPensionDetail.penBtNo
    frmPensionDetail.txtPenAccNo = recvPensionDetail.penAccNo
    frmPensionDetail.txtProxyName = recvPensionDetail.reprName
    frmPensionDetail.txtProxyHafNo = recvPensionDetail.reprIdNo
    frmPensionDetail.txtProxyHafIssSrc = recvPensionDetail.reprIdPl
    frmPensionDetail.txtPenSalAmt = Format(Val(recvPensionDetail.penAmt) / 100, "###########0.00")
    frmPensionDetail.txtDedn = Format(Val(recvPensionDetail.penDedn) / 100, "###########0.00")
    frmPensionDetail.txtNetAmt = Format(Val(recvPensionDetail.penNett) / 100, "###########0.00")
    frmPensionDetail.txtBeneficiary = recvPensionDetail.branchCode
    frmPensionDetail.txtExportNo = recvPensionDetail.issuerNo
    frmPensionDetail.cmbIssueDate = Mid$(recvPensionDetail.issueDate, 7, 2)
    frmPensionDetail.cmbIssueMonth = Mid$(recvPensionDetail.issueDate, 5, 2)
    frmPensionDetail.txtIssueYear = Mid$(recvPensionDetail.issueDate, 1, 4)
    'frmPensionDetail.txtCardPosition = recvPensionDetail.cashStat
    frmPensionDetail.txtCardPosNo = recvPensionDetail.inHrNo
    frmPensionDetail.txtCardType = recvPensionDetail.cardType
    frmPensionDetail.txtCardStatus = recvPensionDetail.cardStat
    frmPensionDetail.txtPaymentType = recvPensionDetail.paymentType
    frmPensionDetail.txtSubCard = recvPensionDetail.subCard
    frmPensionDetail.txtNotes1 = recvPensionDetail.notes1
    frmPensionDetail.txtNotes2 = recvPensionDetail.notes2
    frmPensionDetail.txtNotes3 = recvPensionDetail.notes3
    frmPensionDetail.txtNotes4 = recvPensionDetail.notes4
    frmPensionDetail.txtNotes5 = recvPensionDetail.notes5
    frmPensionDetail.txtNotes6 = recvPensionDetail.notes6
    frmPensionDetail.txtNotes7 = recvPensionDetail.notes7
    frmPensionDetail.txtNotes8 = recvPensionDetail.notes8
    frmPensionDetail.txtNotes9 = recvPensionDetail.notes9
    frmPensionDetail.txtNotes10 = recvPensionDetail.notes10
    frmPensionDetail.txtNotes11 = recvPensionDetail.notes11
    frmPensionDetail.txtNotes12 = recvPensionDetail.notes12
    frmPensionDetail.txtNotes13 = recvPensionDetail.notes13
    frmPensionDetail.txtNotes14 = recvPensionDetail.notes14
    frmPensionDetail.txtNotes15 = recvPensionDetail.notes15
End Sub

Private Sub pensionGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
