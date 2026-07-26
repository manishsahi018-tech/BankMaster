VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmStdOrdGrid 
   BackColor       =   &H00BFD87E&
   Caption         =   "Standing Order Information"
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
   Begin VB.TextBox txtCustNo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
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
      Height          =   375
      Left            =   2160
      TabIndex        =   9
      Top             =   600
      Width           =   1215
   End
   Begin VB.TextBox txtCustName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
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
      Height          =   375
      Left            =   5520
      TabIndex        =   8
      Top             =   600
      Width           =   5175
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   6960
      TabIndex        =   7
      ToolTipText     =   "Exit"
      Top             =   6600
      Width           =   1455
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   5520
      TabIndex        =   6
      ToolTipText     =   "More"
      Top             =   6600
      Width           =   1455
   End
   Begin VB.CommandButton cmdEnquiry 
      Caption         =   "Enquiry"
      Height          =   375
      Left            =   4080
      TabIndex        =   5
      ToolTipText     =   "Enquiry"
      Top             =   6600
      Width           =   1455
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop Standing Order"
      Height          =   375
      Left            =   2400
      TabIndex        =   4
      ToolTipText     =   "Stop Standing order"
      Top             =   6600
      Width           =   1695
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "New Standing Order"
      Height          =   375
      Left            =   720
      TabIndex        =   3
      ToolTipText     =   "New Standing Order"
      Top             =   6600
      Width           =   1695
   End
   Begin VB.TextBox txtAcctNo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   7080
      TabIndex        =   2
      Top             =   120
      Width           =   2655
   End
   Begin MSFlexGridLib.MSFlexGrid stOrdGrid 
      Height          =   5415
      Left            =   360
      TabIndex        =   0
      Top             =   960
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
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer # :"
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
      Height          =   375
      Left            =   480
      TabIndex        =   11
      Top             =   600
      Width           =   1575
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name :"
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
      Height          =   375
      Left            =   3600
      TabIndex        =   10
      Top             =   600
      Width           =   1815
   End
   Begin VB.Label lblStdOrd 
      BackColor       =   &H00BFD87E&
      Caption         =   "Standing Orders for the account number  :"
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
      Left            =   600
      TabIndex        =   1
      Top             =   120
      Width           =   6135
   End
End
Attribute VB_Name = "frmStdOrdGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAdd_Click()
   Dim tCode As String

   If dormantFlag = "1" And dormantActivationAllowed = False Then
      MsgBox errDormantAcc(UserLang)
      Exit Sub
   End If
   stdOrdUpdateAction = False
   stdOrdSearchAction = False
   stdOrdSupervisorAction = False
   stdOrdTellerAction = False
   frmStandingOrderDetail.Show
   frmStandingOrderDetail.txtAcctNo = txtAcctNo
   frmStandingOrderDetail.txtCustName = txtCustName
   tCode = gBranchCode
   
   Set rs = db.OpenRecordset("Select arabicname, englishname from branchinfo where " + _
                         "branchcode = '" + tCode + "'")
   If rs.recordCount > 0 Then
      If UserLang = ARABIC Then
         frmStandingOrderDetail.cmbBranchCode = tCode + " - " + rs(0)
      Else
         frmStandingOrderDetail.cmbBranchCode = tCode + " - " + rs(1)
      End If
   End If
   
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdEnquiry_Click()
   stdOrdUpdateAction = False
   stdOrdSearchAction = True
   stdOrdSupervisorAction = False
   stdOrdTellerAction = False
   getStdOrdDetails
End Sub

Private Sub cmdModify_Click()
'    stdOrdUpdateAction = True
'    stdOrdSearchAction = False
'    stdOrdSupervisorAction = False
'    stdOrdTellerAction = False
'    getStdOrdDetails
End Sub

Private Sub cmdMore_Click()
   If recvStdOrdSearchMsg.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   frmAccountGrid.searchStdOrd recvStdOrdSearchMsg.lastRecCount
    
   If recvStdOrdSearchMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   Form_Load
End Sub

Private Sub cmdStop_Click()

    stdOrdUpdateAction = True
    stdOrdSearchAction = False
    stdOrdSupervisorAction = False
    stdOrdTellerAction = False
    getStdOrdDetails
'    Dim tUserId As String * 10
'    Dim tAccNo As String * 14
'    Dim tSodNo As String * 6
'    Dim tPaymentType As String * 1
'
'    stOrdGrid.Col = 0
'    tSodNo = Format(stOrdGrid.text, "!@@@@@@")
'    tUserId = Format(gUserId, "!@@@@@@@@@@")
'    tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
'
'    stOrdGrid.Col = 1
'    tPaymentType = Mid$(stOrdGrid.text, 1, 1)
'
'    If Len(RTrim(tSodNo)) = 0 Then
'       MsgBox errEmptyRowSelected(UserLang)
'       Exit Sub
'    End If
'
'    If tPaymentType = "4" Or tPaymentType = "5" Then
'       MsgBox errStdOrdAlreadyStopped(UserLang)   '"Standing already stopped...Cannot Stop again..."
'       Exit Sub
'    End If
'
'    SendMsg = "000000" & "43" & gBranchCode & "03" & tUserId & tAccNo & tSodNo
'
'    strmsglen = Format(Len(SendMsg), "000000")
'    Mid$(SendMsg, 1, 6) = strmsglen
'    DataReceivedFlag = False
'
'    frmStdOrdGrid.MousePointer = vbHourglass
'
'    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
'       LoadError = True
'       frmStdOrdGrid.MousePointer = vbDfault
'       Exit Sub
'    End If
'    frmStdOrdGrid.MousePointer = vbDefault
'
'    If recvCustomerMsg.status = "000" Then
'       MsgBox errSuccessful(UserLang)
'    Else
'       If UserLang = ARABIC Then
'          MsgBox recvCustomerMsg.aRemarks
'       Else
'          MsgBox recvCustomerMsg.eRemarks
'       End If
'    End If
'    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow, tWidth, amtDenom, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim mQry, tCode As String
    Dim tCcy As String, tDecimalPlace As String
    Static lastRecRead As String * 3
    
    colwidth(0) = 1800
    colwidth(1) = 1500
    colwidth(2) = 1700
    colwidth(3) = 1700
    colwidth(4) = 1700
    colwidth(5) = 2000
    colwidth(6) = 1000
    
'    If UserLang = ARABIC Then
'       ChangePositions frmStdOrdGrid, 11800
'       frmStdOrdGrid.RightToLeft = True
'    End If
    
    frmStdOrdGrid.Caption = frmStdOrdGridCaption(0, UserLang)
    frmStdOrdGrid.lblStdOrd.Caption = frmStdOrdGridCaption(1, UserLang)
    frmStdOrdGrid.cmdAdd.Caption = frmStdOrdGridCaption(9, UserLang)
    frmStdOrdGrid.cmdStop.Caption = frmStdOrdGridCaption(10, UserLang)
    frmStdOrdGrid.cmdEnquiry.Caption = frmStdOrdGridCaption(11, UserLang)
    frmStdOrdGrid.cmdMore.Caption = frmStdOrdGridCaption(12, UserLang)
    frmStdOrdGrid.cmdCancel.Caption = frmStdOrdGridCaption(13, UserLang)
    frmStdOrdGrid.lblCustNo.Caption = frmAccountGridCaption(22, UserLang)
    frmStdOrdGrid.lblCustName.Caption = frmAccountGridCaption(23, UserLang)
    
'    rowTitle(0) = "S/O Number"
'    rowTitle(1) = "Payment Type"
'    rowTitle(2) = "Payment Amount"
'    rowTitle(3) = "Pay Acc No"
'    rowTitle(4) = "Order Type"
'    rowTitle(5) = "Payment Freq"
'    rowTitle(6) = "Branch Code"
        
    txtCustNo = recvAccSearchMsg.custNo
    If UserLang = ARABIC Then
       If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
          txtCustName = recvAccSearchMsg.aShortName
       Else
          txtCustName = recvAccSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
          txtCustName = recvAccSearchMsg.eShortName
       Else
          txtCustName = recvAccSearchMsg.aShortName
       End If
    End If
     
    stOrdGrid.Clear
    stOrdGrid.Row = 0
    stOrdGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 5
      stOrdGrid.Col = i
      If UserLang = ARABIC Then
         stOrdGrid.CellAlignment = flexAlignRightCenter
      Else
         stOrdGrid.CellAlignment = flexAlignLeftCenter
      End If
      stOrdGrid.text = frmStdOrdGridCaption(i + 2, UserLang)
      stOrdGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
'    stOrdGrid.Width = tWidth + 50
    
    For i = 1 To Val(recvStdOrdSearchMsg.noOfRecs)
         stOrdGrid.Row = i
         stOrdGrid.Col = 0
         stOrdGrid.CellAlignment = flexAlignLeftCenter
         stOrdGrid.text = recvStdOrdSearchMsg.details(i).sodNo
         stOrdGrid.Col = 1
         tCode = recvStdOrdSearchMsg.details(i).paymentType
         Set rs = db.OpenRecordset("select arabicname, englishname from paymentTypeinfo " & _
                                "where paymenttype = '" & tCode & "'")
         stOrdGrid.CellAlignment = flexAlignLeftCenter
         If rs.recordCount > 0 Then
            If UserLang = ARABIC Then
               stOrdGrid.text = tCode & "-" & rs(0)
            Else
               stOrdGrid.text = tCode & "-" & rs(1)
            End If
         Else
            stOrdGrid.text = tCode & "-" & "Invalid Code "
         End If
         tCcy = Mid$(recvStdOrdSearchMsg.details(i).payAccNo, 1, 2)
         Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                                 "where currencycode = '" & tCcy & "'")
                               
         If rs.recordCount > 0 Then
            tDecimalPlace = rs(0)
         Else
            tDecimalPlace = "2"
         End If
      
         If tDecimalPlace = "3" Then
            amtDenom = 1000
         ElseIf tDecimalPlace = "2" Then
            amtDenom = 100
         ElseIf tDecimalPlace = "1" Then
            amtDenom = 10
         Else
            amtDenom = 1
         End If
         stOrdGrid.Col = 2
         stOrdGrid.CellAlignment = flexAlignRightCenter
         stOrdGrid.text = Format(Val(recvStdOrdSearchMsg.details(i).paymentAmt) / amtDenom, "###########0" & _
                                IIf(CInt(tDecimalPlace) <> 0, "." & String(CInt(tDecimalPlace), "0"), ""))
         stOrdGrid.Col = 3
         stOrdGrid.CellAlignment = flexAlignLeftCenter
         stOrdGrid.text = recvStdOrdSearchMsg.details(i).payAccNo
         stOrdGrid.Col = 4
         tCode = recvStdOrdSearchMsg.details(i).orderType
         Set rs = db.OpenRecordset("select arabicname, englishname from sodTypeinfo " & _
                                "where ordertype = '" & tCode & "'")
         stOrdGrid.CellAlignment = flexAlignLeftCenter
         If rs.recordCount > 0 Then
            If UserLang = ARABIC Then
               stOrdGrid.text = rs(0)
            Else
               stOrdGrid.text = rs(1)
            End If
         Else
            stOrdGrid.text = "Invalid Code [" & tCode & "]"
         End If
         stOrdGrid.Col = 5
         tCode = recvStdOrdSearchMsg.details(i).paymentFrequency
         Set rs = db.OpenRecordset("select arabicname, englishname from payfreqinfo " & _
                                "where payfreqcode = '" & tCode & "'")
         stOrdGrid.CellAlignment = flexAlignLeftCenter
         If rs.recordCount > 0 Then
            If UserLang = ARABIC Then
               stOrdGrid.text = rs(0)
            Else
               stOrdGrid.text = rs(1)
            End If
         Else
            stOrdGrid.text = "Invalid Code [" & tCode & "]"
         End If
         stOrdGrid.Col = 6
         stOrdGrid.CellAlignment = flexAlignLeftCenter
         stOrdGrid.text = recvStdOrdSearchMsg.details(i).branchCode
   Next i
   stOrdGrid.Row = 1
   
   If InStr(recvLoginMsg.AuthorityLevel, "~61") > 0 And recvLoginMsg.stdOrdReqAllowed = "1" Then
      cmdAdd.Enabled = True
      cmdStop.Enabled = True
   Else
      cmdAdd.Enabled = False
      cmdStop.Enabled = False
   End If
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub stOrdGrid_DblClick()
   stdOrdUpdateAction = False
   stdOrdSearchAction = True
   stdOrdSupervisorAction = False
   stdOrdTellerAction = False
   getStdOrdDetails
End Sub

Public Sub parseStdOrdDetail()

    recvStdOrdDetail.status = Mid$(RecvStr, 1, 3)
    recvStdOrdDetail.service = Mid$(RecvStr, 4, 2)
    recvStdOrdDetail.aRemarks = Mid$(RecvStr, 6, 50)
    recvStdOrdDetail.eRemarks = Mid$(RecvStr, 56, 50)
    recvStdOrdDetail.accNo = Mid$(RecvStr, 106, 14)
    recvStdOrdDetail.sodNo = Mid$(RecvStr, 120, 6)
    recvStdOrdDetail.orderType = Mid$(RecvStr, 126, 1)
    recvStdOrdDetail.paymentType = Mid$(RecvStr, 127, 1)
    recvStdOrdDetail.paymentMode = Mid$(RecvStr, 128, 1)
    recvStdOrdDetail.paymentFrequency = Mid$(RecvStr, 129, 1)
    recvStdOrdDetail.firstPaymentDate = Mid$(RecvStr, 130, 8)
    recvStdOrdDetail.nextPaymentDate = Mid$(RecvStr, 138, 8)
    recvStdOrdDetail.finalPaymentDate = Mid$(RecvStr, 146, 8)
    recvStdOrdDetail.lastProcessedDate = Mid$(RecvStr, 154, 8)
    recvStdOrdDetail.paymentsToBeMade = Mid$(RecvStr, 162, 3)
    recvStdOrdDetail.paymentsMade = Mid$(RecvStr, 165, 3)
    recvStdOrdDetail.limitInExcessFlag = Mid$(RecvStr, 168, 1)
    recvStdOrdDetail.commissionFlag = Mid$(RecvStr, 169, 1)
    recvStdOrdDetail.processNextDayFlag = Mid$(RecvStr, 170, 1)
    recvStdOrdDetail.thresholdAmt = Mid$(RecvStr, 171, 10)
    recvStdOrdDetail.paymentAmt = Mid$(RecvStr, 181, 14)
    recvStdOrdDetail.totalPaidToDate = Mid$(RecvStr, 195, 14)
    recvStdOrdDetail.totalToPay = Mid$(RecvStr, 209, 14)
    recvStdOrdDetail.payAccNo = Mid$(RecvStr, 223, 14)
    recvStdOrdDetail.drNarrative1 = Mid$(RecvStr, 237, 20)
    recvStdOrdDetail.drNarrative2 = Mid$(RecvStr, 257, 20)
    recvStdOrdDetail.crNarrative1 = Mid$(RecvStr, 277, 20)
    recvStdOrdDetail.crNarrative2 = Mid$(RecvStr, 297, 20)
    recvStdOrdDetail.transactionDateFlag = Mid$(RecvStr, 317, 1)
    recvStdOrdDetail.branchCode = Mid$(RecvStr, 318, 4)
    recvStdOrdDetail.newOrUpdate = Mid$(RecvStr, 322, 1)
    recvStdOrdDetail.supervisorComments = Mid$(RecvStr, 323, 200)
    recvStdOrdDetail.payeeCustName = Mid$(RecvStr, 523, 30)
    recvStdOrdDetail.lastUpdateUserId = Mid$(RecvStr, 553, 10)
    recvStdOrdDetail.lastUpdateDate = Mid$(RecvStr, 563, 8)
    recvStdOrdDetail.custName = Mid$(RecvStr, 571, 30)
    recvStdOrdDetail.custBranchCode = Mid$(RecvStr, 601, 4)
    recvStdOrdDetail.remarks = Mid$(RecvStr, 605, 25)
    
End Sub

Public Sub fillFrmStdOrdDetail()
    Dim tCode As String
    Dim tCcy As String, tDecimalPlace As String
    Dim amtDenom As Integer
    
    frmStandingOrderDetail.txtAcctNo = recvStdOrdDetail.accNo
    frmStandingOrderDetail.txtSoNo = recvStdOrdDetail.sodNo
    tCode = recvStdOrdDetail.orderType
    Set rs = db.OpenRecordset("select arabicname, englishname from sodtypeinfo " + _
                                "where ordertype = '" + tCode + "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmStandingOrderDetail.cmbSoType.text = tCode + " - " + rs(0)
       Else
          frmStandingOrderDetail.cmbSoType.text = tCode + " - " + rs(1)
       End If
    Else
       frmStandingOrderDetail.cmbSoType.text = tCode + " - " + "Invalid Code "
    End If
    tCode = recvStdOrdDetail.paymentType
    Set rs = db.OpenRecordset("select arabicname, englishname from paymenttypeinfo " + _
                                "where paymenttype = '" + tCode + "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmStandingOrderDetail.cmbPayType.text = tCode + " - " + rs(0)
       Else
          frmStandingOrderDetail.cmbPayType.text = tCode + " - " + rs(1)
       End If
    Else
       frmStandingOrderDetail.cmbPayType.text = tCode + " - " + "Invalid Code "
    End If
    
    tCode = recvStdOrdDetail.paymentMode
    
    Set rs = db.OpenRecordset("select arabicname, englishname from paymodeinfo " + _
                                "where paymodecode = '" + tCode + "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmStandingOrderDetail.cmbPayMode.text = tCode + " - " + rs(0)
       Else
          frmStandingOrderDetail.cmbPayMode.text = tCode + " - " + rs(1)
       End If
    Else
       frmStandingOrderDetail.cmbPayMode.text = tCode + " - " + "Invalid Code "
    End If
    
    tCode = recvStdOrdDetail.paymentFrequency
        
    Set rs = db.OpenRecordset("select arabicname, englishname from payfreqinfo " + _
                                "where payfreqcode = '" + tCode + "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmStandingOrderDetail.cmbPayFreq.text = tCode + " - " + rs(0)
       Else
          frmStandingOrderDetail.cmbPayFreq.text = tCode + " - " + rs(1)
       End If
    Else
       frmStandingOrderDetail.cmbPayFreq.text = tCode + " - " + "Invalid Code "
    End If
        
    frmStandingOrderDetail.cmbFirstPayDate = Mid$(recvStdOrdDetail.firstPaymentDate, 7, 2)
    frmStandingOrderDetail.cmbFirstPayMonth = Mid$(recvStdOrdDetail.firstPaymentDate, 5, 2)
    frmStandingOrderDetail.txtFirstPayYear = Mid$(recvStdOrdDetail.firstPaymentDate, 1, 4)
    frmStandingOrderDetail.cmbNextPayDate = Mid$(recvStdOrdDetail.nextPaymentDate, 7, 2)
    frmStandingOrderDetail.cmbNextPayMonth = Mid$(recvStdOrdDetail.nextPaymentDate, 5, 2)
    frmStandingOrderDetail.txtNextPayYear = Mid$(recvStdOrdDetail.nextPaymentDate, 1, 4)
    frmStandingOrderDetail.cmbFinalPayDate = Mid$(recvStdOrdDetail.finalPaymentDate, 7, 2)
    frmStandingOrderDetail.cmbFinalPayMonth = Mid$(recvStdOrdDetail.finalPaymentDate, 5, 2)
    frmStandingOrderDetail.txtFinalPayYear = Mid$(recvStdOrdDetail.finalPaymentDate, 1, 4)
    frmStandingOrderDetail.cmbLastProcessDate = Mid$(recvStdOrdDetail.lastProcessedDate, 7, 2)
    frmStandingOrderDetail.cmbLastProcessMonth = Mid$(recvStdOrdDetail.lastProcessedDate, 5, 2)
    frmStandingOrderDetail.txtLastProcessYear = Mid$(recvStdOrdDetail.lastProcessedDate, 1, 4)
    
    frmStandingOrderDetail.txtNoOfPayments = recvStdOrdDetail.paymentsToBeMade
    frmStandingOrderDetail.txtNoOfPaymentsMade = recvStdOrdDetail.paymentsMade
    
    If recvStdOrdDetail.commissionFlag = "0" Then
       frmStandingOrderDetail.optCommNo.Value = True
    Else
       frmStandingOrderDetail.optCommYes.Value = True
    End If
    If recvStdOrdDetail.processNextDayFlag = "0" Then
       frmStandingOrderDetail.optProcessSameDay.Value = True
    Else
       frmStandingOrderDetail.optProcessNextDay.Value = True
    End If
    
    
    tCcy = Mid$(recvStdOrdDetail.accNo, 1, 2)
    Set rs = db.OpenRecordset("select decimalplace from currencyinfo " + _
                             "where currencycode = '" + tCcy + "'")
                             
    If rs.recordCount > 0 Then
       tDecimalPlace = rs(0)
    Else
       tDecimalPlace = "2"
    End If
      
    If tDecimalPlace = "3" Then
       amtDenom = 1000
    ElseIf tDecimalPlace = "2" Then
       amtDenom = 100
    ElseIf tDecimalPlace = "1" Then
       amtDenom = 10
    Else
       amtDenom = 1
    End If
    
    frmStandingOrderDetail.txtThreshold = Format(Val(recvStdOrdDetail.thresholdAmt) / amtDenom, "#########0" + _
                                IIf(CInt(tDecimalPlace) <> 0, "." + String(CInt(tDecimalPlace), "0"), ""))
    
    frmStandingOrderDetail.txtPayAmt = Format(Val(recvStdOrdDetail.paymentAmt) / amtDenom, "###########0" + _
                                IIf(CInt(tDecimalPlace) <> 0, "." + String(CInt(tDecimalPlace), "0"), ""))
    frmStandingOrderDetail.txtAmtPaidToDate = Format(Val(recvStdOrdDetail.totalPaidToDate) / amtDenom, "###########0" + _
                                IIf(CInt(tDecimalPlace) <> 0, "." + String(CInt(tDecimalPlace), "0"), ""))
    frmStandingOrderDetail.txtTotalAmtToPay = Format(Val(recvStdOrdDetail.totalToPay) / amtDenom, "##########0" + _
                                IIf(CInt(tDecimalPlace) <> 0, "." + String(CInt(tDecimalPlace), "0"), ""))
    frmStandingOrderDetail.txtPayeeAcc = recvStdOrdDetail.payAccNo
    frmStandingOrderDetail.txtPayeeName = recvStdOrdDetail.payeeCustName
    frmStandingOrderDetail.txtDrNarrative1 = recvStdOrdDetail.drNarrative1
    frmStandingOrderDetail.txtDrNarrative2 = recvStdOrdDetail.drNarrative2
    frmStandingOrderDetail.txtCrNarrative1 = recvStdOrdDetail.crNarrative1
    frmStandingOrderDetail.txtCrNarrative2 = recvStdOrdDetail.crNarrative2
    
    tCode = recvStdOrdDetail.branchCode
    
    Set rs = db.OpenRecordset("Select arabicname, englishname from branchinfo where " + _
                         "branchcode = '" + tCode + "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmStandingOrderDetail.cmbBranchCode = tCode + " - " + rs(0)
       Else
          frmStandingOrderDetail.cmbBranchCode = tCode + " - " + rs(1)
       End If
    Else
       frmStandingOrderDetail.cmbBranchCode = tCode + " - not found in database"
    End If
    tCode = recvStdOrdDetail.custBranchCode
    
    Set rs = db.OpenRecordset("Select arabicname, englishname from branchinfo where " & _
                         "branchcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmStandingOrderDetail.cmbCustBranchCode = tCode & " - " & rs(0)
       Else
          frmStandingOrderDetail.cmbCustBranchCode = tCode & " - " & rs(1)
       End If
    Else
       frmStandingOrderDetail.cmbCustBranchCode = tCode & " - not defined in local db"
    End If
    frmStandingOrderDetail.txtRemarks = recvStdOrdDetail.remarks
    frmStandingOrderDetail.txtLastUpdateUser = recvStdOrdDetail.lastUpdateUserId
    frmStandingOrderDetail.cmbLastUpdateDate = Mid$(recvStdOrdDetail.lastUpdateDate, 7, 2)
    frmStandingOrderDetail.cmbLastUpdateMonth = Mid$(recvStdOrdDetail.lastUpdateDate, 5, 2)
    frmStandingOrderDetail.txtLastUpdateYear = Mid$(recvStdOrdDetail.lastUpdateDate, 1, 4)
    frmStandingOrderDetail.txtCustName = recvStdOrdDetail.custName
    If stdOrdUpdateAction Or recvStdOrdDetail.newOrUpdate = "U" Then
       If Len(Trim(recvStdOrdDetail.remarks)) > 0 And _
          Trim(recvStdOrdDetail.remarks) <> String(25, "0") Then
          MsgBox recvStdOrdDetail.remarks
       End If
    End If

End Sub

Public Sub getStdOrdDetails()
    Dim tUserid As String * 10
    Dim tAccNo As String * 14
    Dim tSodNo As String * 6
     
    stOrdGrid.Col = 0
    tSodNo = Format(stOrdGrid.text, "!@@@@@@")
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
    
    If Len(RTrim(tSodNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
        
    SendMsg = "000000" & "43" & gBranchCode & "02" & tUserid & tAccNo & tSodNo
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
     
    frmStdOrdGrid.MousePointer = vbHourglass
    
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmStdOrdGrid.MousePointer = vbDfault
       Exit Sub
    End If
    frmStdOrdGrid.MousePointer = vbDefault
    parseStdOrdDetail
    frmStandingOrderDetail.Show
    fillFrmStdOrdDetail
    frmStandingOrderDetail.txtCustName = txtCustName
    frmStandingOrderDetail.Show
End Sub

Private Sub stOrdGrid_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub stOrdGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
