VERSION 5.00
Begin VB.Form frmPensionEnquiry 
   BackColor       =   &H00BFD87E&
   Caption         =   "Pension Enquiry Form"
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
   Begin VB.CommandButton cmdCashPay 
      Caption         =   "Cash payment enquiry"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   495
      Left            =   3600
      TabIndex        =   11
      ToolTipText     =   "Cash Payment Enquiry"
      Top             =   5640
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5880
      TabIndex        =   5
      ToolTipText     =   "Exit"
      Top             =   5640
      Width           =   1095
   End
   Begin VB.TextBox txtCardNo 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "xxxxxxx"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   0
      EndProperty
      Height          =   285
      Left            =   4680
      MaxLength       =   10
      TabIndex        =   0
      Top             =   3360
      Width           =   1335
   End
   Begin VB.TextBox txtIdNo 
      Height          =   285
      Left            =   4680
      MaxLength       =   15
      TabIndex        =   3
      Top             =   4800
      Width           =   1935
   End
   Begin VB.CommandButton cmdEnquiry 
      Caption         =   "General Enquiry"
      Height          =   495
      Left            =   4800
      TabIndex        =   4
      ToolTipText     =   "Search"
      Top             =   5640
      Width           =   1095
   End
   Begin VB.TextBox txtPenAccNo 
      Height          =   285
      Left            =   4680
      MaxLength       =   14
      TabIndex        =   1
      Top             =   3840
      Width           =   1935
   End
   Begin VB.TextBox txtHafNo 
      Height          =   285
      Left            =   4680
      MaxLength       =   15
      TabIndex        =   2
      Top             =   4320
      Width           =   1935
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00E0E0E0&
      BorderColor     =   &H00C00000&
      BorderStyle     =   6  'Inside Solid
      FillColor       =   &H00404040&
      Height          =   5175
      Left            =   1080
      Top             =   1560
      Width           =   8655
   End
   Begin VB.Label lblEnquiryHead 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pension Enquiry Search "
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
      Height          =   495
      Left            =   3600
      TabIndex        =   10
      Top             =   1920
      Width           =   5895
   End
   Begin VB.Label lblCardNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Number"
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
      Left            =   3000
      TabIndex        =   9
      Top             =   3360
      Width           =   1575
   End
   Begin VB.Label lblIdNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Saudi ID  No"
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
      Left            =   3000
      TabIndex        =   8
      Top             =   4800
      Width           =   1575
   End
   Begin VB.Label lblPenAccNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pen Acct No "
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
      Left            =   3000
      TabIndex        =   7
      Top             =   3840
      Width           =   1575
   End
   Begin VB.Label lblHafNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Hafiza Number"
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
      Left            =   3000
      TabIndex        =   6
      Top             =   4320
      Width           =   1575
   End
End
Attribute VB_Name = "frmPensionEnquiry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdCashPay_Click()
    Dim tCardNo As String
    Dim tUserid As String
    
    tCardNo = Format(txtCardNo, "!@@@@@@@@@@")
    
    If Len(RTrim(tCardNo)) = 0 Then
       MsgBox errInvalidCardNo(UserLang)
       Exit Sub
    End If
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000048" + "61" + gBranchCode + tUserid + tCardNo
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmPensionEnquiry.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmPensionEnquiry.MousePointer = vbDefault
       Exit Sub
    End If
    frmPensionEnquiry.MousePointer = vbDefault
    
    parsePenCashDetail

    If recvPenCashDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvPenCashDetail.aRemarks
       Else
          MsgBox recvPenCashDetail.eRemarks
       End If
       Exit Sub
    End If
    frmPenCashPayment.Show
    fillCashPaymentForm
    
End Sub

Private Sub cmdEnquiry_Click()
    If Len(RTrim(txtCardNo)) = 0 And _
       Len(RTrim(txtHafNo)) = 0 And _
       Len(RTrim(txtIdNo)) = 0 And _
       Len(RTrim(txtPenAccNo)) = 0 Then
       MsgBox errInvalidSearchCriteria(UserLang)
       Exit Sub
    End If
    searchPension ("00000")
    
    If recvPensionSearchMsg.status <> "000" Then
       Exit Sub
    End If
    If UserLang = ARABIC Then
       ChangePositions frmPensionGrid, 11800
       frmPensionGrid.RightToLeft = True
    End If
    frmPensionGrid.Show
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    
   If UserLang = ARABIC Then
      ChangePositions frmPensionEnquiry, 12000
      frmPensionEnquiry.RightToLeft = True
   End If
   
   frmPensionEnquiry.Caption = frmPensionEnquiryCaption(0, UserLang)
   frmPensionEnquiry.lblEnquiryHead.Caption = frmPensionEnquiryCaption(1, UserLang)
   frmPensionEnquiry.lblCardNo.Caption = frmPensionEnquiryCaption(2, UserLang)
   frmPensionEnquiry.lblPenAccNo.Caption = frmPensionEnquiryCaption(3, UserLang)
   frmPensionEnquiry.lblHafNo.Caption = frmPensionEnquiryCaption(4, UserLang)
   frmPensionEnquiry.lblIdNo.Caption = frmPensionEnquiryCaption(5, UserLang)
   frmPensionEnquiry.cmdEnquiry.Caption = frmPensionEnquiryCaption(6, UserLang)
   frmPensionEnquiry.cmdCancel.Caption = frmPensionEnquiryCaption(7, UserLang)
   frmPensionEnquiry.cmdCashPay.Caption = frmPensionEnquiryCaption(8, UserLang)

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtCardNo_Change()
  If Len(RTrim(txtCardNo)) > 0 Then
     txtPenAccNo = ""
     txtHafNo = ""
     txtIdNo = ""
     cmdCashPay.Enabled = True
  Else
     cmdCashPay.Enabled = False
  End If
End Sub

Private Sub txtHafNo_Change()
  If Len(RTrim(txtHafNo)) > 0 Then
     txtCardNo = ""
     txtPenAccNo = ""
     txtIdNo = ""
  End If
End Sub

Private Sub txtIdNo_Change()
   If Len(RTrim(txtIdNo)) > 0 Then
     txtCardNo = ""
     txtPenAccNo = ""
     txtHafNo = ""
  End If
End Sub

Private Sub txtPenAccNo_Change()
  If Len(RTrim(txtPenAccNo)) > 0 Then
     txtCardNo = ""
     txtHafNo = ""
     txtIdNo = ""
  End If
End Sub


Public Sub searchPension(lastRecCount As String)
   Dim tUserid As String
   Dim tCardNo As String * 9
   Dim tPenAccNo As String * 14
   Dim tHafNo As String * 13
   Dim tIdNo As String * 15
   
   tCardNo = Format(txtCardNo, "000000000")
   tPenAccNo = Format(txtPenAccNo, "00000000000000")
   tHafNo = Format(txtHafNo, "0000000000000")
   tIdNo = Format(txtIdNo, "000000000000000")
   tUserid = Format(gUserId, "!@@@@@@@@@@")
   SendMsg = "000000" + "40" + gBranchCode + tUserid + lastRecCount + _
             tCardNo + tPenAccNo + tHafNo + tIdNo
    
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  frmPensionEnquiry.MousePointer = vbHourglass
  frmPensionEnquiry.cmdEnquiry.Enabled = False
  frmPensionEnquiry.cmdCancel.Enabled = False
  
  If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
     LoadError = True
     frmPensionEnquiry.MousePointer = vbDefault
     frmPensionEnquiry.cmdEnquiry.Enabled = True
     frmPensionEnquiry.cmdCancel.Enabled = True
     Exit Sub
  End If
   
  frmPensionEnquiry.MousePointer = vbDefault
  frmPensionEnquiry.cmdEnquiry.Enabled = True
  frmPensionEnquiry.cmdCancel.Enabled = True
  
  parsePensionSearchMsg
  
  If recvPensionSearchMsg.status <> "000" Then
     If UserLang = ENGLISH Then
        MsgBox recvPensionSearchMsg.eRemarks
     Else
        MsgBox recvPensionSearchMsg.aRemarks
     End If
     Exit Sub
  End If
  
End Sub

Public Function parsePensionSearchMsg() As String
    Dim i, pos As Integer
     
     recvPensionSearchMsg.status = Mid$(RecvStr, 1, 3)
     recvPensionSearchMsg.service = Mid$(RecvStr, 4, 2)
     recvPensionSearchMsg.aRemarks = Mid$(RecvStr, 6, 50)
     recvPensionSearchMsg.eRemarks = Mid$(RecvStr, 56, 50)
     recvPensionSearchMsg.lastRecCount = Mid$(RecvStr, 106, 5)
     recvPensionSearchMsg.noOfRecs = Mid$(RecvStr, 111, 2)
     recvPensionSearchMsg.filler = Mid$(RecvStr, 113, 10)
     pos = 123
     For i = 1 To Val(recvPensionSearchMsg.noOfRecs)
         recvPensionSearchMsg.details(i).penCardNo = Mid$(RecvStr, pos, 9)
         pos = pos + 9
         recvPensionSearchMsg.details(i).penName = Mid$(RecvStr, pos, 40)
         pos = pos + 40
         recvPensionSearchMsg.details(i).penIdNo = Mid$(RecvStr, pos, 15)
         pos = pos + 15
         recvPensionSearchMsg.details(i).penHafNo = Mid$(RecvStr, pos, 13)
         pos = pos + 13
         recvPensionSearchMsg.details(i).penSalAmt = Mid$(RecvStr, pos, 9)
         pos = pos + 9
         recvPensionSearchMsg.details(i).netAmt = Mid$(RecvStr, pos, 9)
         pos = pos + 9
         recvPensionSearchMsg.details(i).paymentType = Mid$(RecvStr, pos, 5)
         pos = pos + 5
    Next i
    parsePensionSearchMsg = Success
End Function

Public Sub parsePenCashDetail()
    Dim i As Integer
    
    recvPenCashDetail.status = Mid$(RecvStr, 1, 3)
    recvPenCashDetail.service = Mid$(RecvStr, 4, 2)
    recvPenCashDetail.aRemarks = Mid$(RecvStr, 6, 50)
    recvPenCashDetail.eRemarks = Mid$(RecvStr, 56, 50)
    recvPenCashDetail.penCardNo = Mid$(RecvStr, 106, 10)
    recvPenCashDetail.netAmt = Mid$(RecvStr, 116, 14)
    recvPenCashDetail.paymentStatus = Mid$(RecvStr, 130, 1)
    recvPenCashDetail.totAmt = Mid$(RecvStr, 131, 14)
    recvPenCashDetail.deduction = Mid$(RecvStr, 147, 14)
    recvPenCashDetail.penProxyName = Mid$(RecvStr, 161, 30)
    recvPenCashDetail.pensionerName = Mid$(RecvStr, 191, 35)
    recvPenCashDetail.message1 = Mid$(RecvStr, 226, 35)
    recvPenCashDetail.message2 = Mid$(RecvStr, 261, 35)
    recvPenCashDetail.message3 = Mid$(RecvStr, 296, 35)
    recvPenCashDetail.message4 = Mid$(RecvStr, 331, 35)
End Sub

Public Sub fillCashPaymentForm()
    frmPenCashPayment.txtPenCardNo = recvPenCashDetail.penCardNo
    frmPenCashPayment.txtNetAmt = Format(Val(recvPenCashDetail.netAmt) / 100, "##########0.00")
    frmPenCashPayment.txtPaymentStatus = recvPenCashDetail.paymentStatus
    frmPenCashPayment.txtTotAmt = Format(Val(recvPenCashDetail.totAmt) / 100, "##########0.00")
    frmPenCashPayment.txtDeduction = Format(Val(recvPenCashDetail.deduction) / 100, "##########0.00")
    frmPenCashPayment.txtPenProxyName = recvPenCashDetail.penProxyName
    frmPenCashPayment.txtPensionName = recvPenCashDetail.pensionerName
    frmPenCashPayment.txtMessage1 = recvPenCashDetail.message1
    frmPenCashPayment.txtMessage2 = recvPenCashDetail.message2
    frmPenCashPayment.txtMessage3 = recvPenCashDetail.message3
    frmPenCashPayment.txtMessage4 = recvPenCashDetail.message4
End Sub

