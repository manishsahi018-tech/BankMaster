VERSION 5.00
Begin VB.Form frmManualBlock 
   BackColor       =   &H00BFD87E&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Credit Card manual blocking"
   ClientHeight    =   3690
   ClientLeft      =   1785
   ClientTop       =   1935
   ClientWidth     =   6135
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3690
   ScaleWidth      =   6135
   Begin VB.CommandButton cmdComments 
      Caption         =   "Comments"
      Height          =   375
      Left            =   240
      TabIndex        =   14
      ToolTipText     =   "Supervisor Comments"
      Top             =   3120
      Width           =   1455
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "&Reject"
      Height          =   375
      Left            =   3885
      TabIndex        =   6
      ToolTipText     =   "Reject"
      Top             =   3120
      Width           =   1095
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "&Approve"
      Height          =   375
      Left            =   2790
      TabIndex        =   5
      ToolTipText     =   "Approve"
      Top             =   3120
      Width           =   1095
   End
   Begin VB.TextBox txtCardNo 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2400
      MaxLength       =   16
      TabIndex        =   0
      Top             =   1080
      Width           =   2895
   End
   Begin VB.TextBox txtAccNo 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2400
      TabIndex        =   1
      Top             =   1560
      Width           =   1695
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4980
      TabIndex        =   7
      ToolTipText     =   "Cancel"
      Top             =   3120
      Width           =   1095
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   1695
      TabIndex        =   4
      ToolTipText     =   "Ok"
      Top             =   3120
      Width           =   1095
   End
   Begin VB.TextBox txtBlockAmt 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2400
      MaxLength       =   14
      TabIndex        =   3
      Top             =   2520
      Width           =   1695
   End
   Begin VB.TextBox txtOldAmt 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2400
      TabIndex        =   2
      Top             =   2040
      Width           =   1695
   End
   Begin VB.Label lblAction 
      BackColor       =   &H00BFD87E&
      Caption         =   "Add New blocking"
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
      Left            =   2400
      TabIndex        =   13
      Top             =   600
      Width           =   2895
   End
   Begin VB.Label lblManualBlocking 
      BackColor       =   &H00BFD87E&
      Caption         =   "Credit Card manual blocking"
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
      Left            =   1320
      TabIndex        =   12
      Top             =   120
      Width           =   4455
   End
   Begin VB.Label lblCardNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Credit card number"
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
      TabIndex        =   11
      Top             =   1080
      Width           =   2055
   End
   Begin VB.Label lblAccNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account number"
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
      Top             =   1560
      Width           =   1935
   End
   Begin VB.Label lblBlockedAmt 
      BackColor       =   &H00BFD87E&
      Caption         =   "Block Amount"
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
      TabIndex        =   9
      Top             =   2520
      Width           =   1935
   End
   Begin VB.Label lblOldAmt 
      BackColor       =   &H00BFD87E&
      Caption         =   "Old Amount"
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
      TabIndex        =   8
      Top             =   2040
      Width           =   1815
   End
End
Attribute VB_Name = "frmManualBlock"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public tComments As String
Private Sub cmdApprove_Click()
    supervisorDecision "A", Space(200)
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdComments_Click()
    MsgBox Trim(tComments)
End Sub

Private Sub cmdOk_Click()
    Dim tmpStr As String
    Dim tAccNo As String
    Dim tCardNo As String
    Dim tag As String
    Dim tuserId As String, tDateTime As String
    Dim creationOrUpdate As String
    Dim oldAmt As String, blockAmt As String
    Dim action As String
    Dim tCode As String
    Dim tDecimalPlace As String
    Dim amtDenom As Integer
    
    If blockAddAction = True And frmManualBlock.tag <> "A" Then
       If Len(Trim(txtCardNo)) = 0 Then
          MsgBox errSpaceCardNo(UserLang)
          txtCardNo.SetFocus
          Exit Sub
       End If
       If Len(Trim(txtCardNo)) <> 16 Then
          MsgBox errCcNoLessThan16(UserLang)
          txtCardNo.SetFocus
          Exit Sub
       End If
    End If
    
    If Not blockDelAction Then
       If Len(Trim(txtBlockAmt)) = 0 Then
          MsgBox errSpaceAmount(UserLang)
          txtBlockAmt.SetFocus
          Exit Sub
       End If
       If Val(txtBlockAmt) < 0 Then
          MsgBox errNegativeBlockAmt(UserLang)
          txtBlockAmt.SetFocus
          Exit Sub
       End If
    End If
    
    tCode = Mid$(txtAccNo, 1, 2)
    Set rs = db.OpenRecordset("select decimalplace from currencyinfo " & _
                           "where currencycode = '" & tCode & "'")

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
    
    If blockUpdAction = True Then
       oldAmt = Format(Val(txtOldAmt) * amtDenom, "00000000000000")
    Else
       oldAmt = Space(14)
    End If
          
    blockAmt = Format(Val(txtBlockAmt) * amtDenom, "00000000000000")
    
    action = " "
    If blockAddAction Then
       action = "N"
    ElseIf blockUpdAction Then
       action = "A"
    ElseIf blockDelAction Then
       action = "D"
    End If
    
    If blockTellerAction Then
       creationOrUpdate = "U"
       frmManualBlkPendingList.manualBlkPendingGrid.Col = 0
       tuserId = Format(frmManualBlkPendingList.manualBlkPendingGrid.text, "!@@@@@@@@@@")
       frmManualBlkPendingList.manualBlkPendingGrid.Col = 1
       tDateTime = Format(frmManualBlkPendingList.manualBlkPendingGrid.text, "00000000000000")
    Else
       creationOrUpdate = "C"
       tuserId = gUserId
       tDateTime = Space(14)
    End If
    
    If frmManualBlock.tag = "C" Then
       tCardNo = Format(txtCardNo, "0000000000000000")
    Else
       tCardNo = Space(16)
    End If
    
    tAccNo = Format(txtAccNo, "00000000000000")
        
    SendMsg = "000000" & "88" & gBranchCode & Format(tuserId, "!@@@@@@@@@@") & _
              tDateTime & action & creationOrUpdate & tCardNo & _
              tAccNo & oldAmt & blockAmt & frmManualBlock.tag & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    cmdOk.Enabled = False
    cmdCancel.Enabled = False
              
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       cmdOk.Enabled = True
       cmdCancel.Enabled = True
       Exit Sub
    End If
        
    If recvCustomerMsg.status <> "000" Then
       If frmManualBlock.tag = "C" Then
          If recvCustomerMsg.status = "109" Then ' if the credit card is already blocked
             tmpStr = errCcAlreadyBlocked(UserLang) & Trim(recvCustomerMsg.aRemarks)
          ElseIf recvCustomerMsg.status = "110" Then ' if the attached a/c for the CC is not match with selected account
             tmpStr = errCcSettleAccNotMatch(UserLang) & Trim(recvCustomerMsg.aRemarks)
          ElseIf recvCustomerMsg.status = "009" Then
             tmpStr = errInvalidCcNo(UserLang)
          ElseIf recvCustomerMsg.status = "112" Then ' if the a/c is blocked by different branch
             tmpStr = errBlockedNotAllowed(UserLang)
          ElseIf UserLang = ARABIC Then
             tmpStr = recvCustomerMsg.aRemarks
          Else
             tmpStr = recvCustomerMsg.eRemarks
          End If
       ElseIf frmManualBlock.tag = "A" Then
          If recvCustomerMsg.status = "112" Then
             tmpStr = errBlockedNotAllowed(UserLang)
          ElseIf UserLang = ARABIC Then
             tmpStr = recvCustomerMsg.aRemarks
          Else
             tmpStr = recvCustomerMsg.eRemarks
          End If
       ElseIf UserLang = ARABIC Then
          tmpStr = recvCustomerMsg.aRemarks
       Else
          tmpStr = recvCustomerMsg.eRemarks
       End If
       MsgBox tmpStr
       cmdOk.Enabled = True
       cmdCancel.Enabled = True
    Else
       If blockAddAction = True Then
          MsgBox errNewBlockingSuccess(UserLang)
       ElseIf blockUpdAction = True Then
          MsgBox errUpdBlockingSuccess(UserLang)
       ElseIf blockDelAction = True Then
          MsgBox errDelBlockingSuccess(UserLang)
       Else
           MsgBox errSuccessful(UserLang)
       End If
       cmdOk.Enabled = True
       cmdCancel.Enabled = True
    End If
    
    tag = frmManualBlock.tag
    Unload Me
'    If blockTellerAction Then
'       If Len(Trim(frmManualBlkPendingList.txtCustomerNo)) = 0 Then
'          tCustNo = Space(7)
'       Else
'          tCustNo = Format(frmManualBlkPendingList.txtCustomerNo, "0000000")
'       End If
'       Unload frmManualBlkPendingList
'       frmEnquiry.readBlockPendingList "00000", "T", tag, tCustNo
'       If UserLang = ARABIC Then
'          ChangePositions frmManualBlkPendingList, 11800
'          frmManualBlkPendingList.RightToLeft = True
'          frmManualBlkPendingList.Hide
'       End If
'       frmManualBlkPendingList.tag = tag
'       frmManualBlkPendingList.Show
'    End If
End Sub

Private Sub cmdReject_Click()
    frmManualBlkRejection.Show vbModal
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmManualBlock, 6240
       frmManualBlock.RightToLeft = True
    End If
    
    If blockSupervisorAction Or blockTellerAction Then
       If frmManualBlkPendingList.tag = "A" Then
          frmManualBlock.Caption = frmManualBlockCaption(14, UserLang)
          frmManualBlock.lblManualBlocking.Caption = frmManualBlockCaption(14, UserLang)
       Else
          frmManualBlock.Caption = frmManualBlockCaption(0, UserLang)
          frmManualBlock.lblManualBlocking.Caption = frmManualBlockCaption(0, UserLang)
       End If
    Else
       If frmBlockedAmtBreakup.tag = "A" Then
          frmManualBlock.Caption = frmManualBlockCaption(14, UserLang)
          frmManualBlock.lblManualBlocking.Caption = frmManualBlockCaption(14, UserLang)
       Else
          frmManualBlock.Caption = frmManualBlockCaption(0, UserLang)
          frmManualBlock.lblManualBlocking.Caption = frmManualBlockCaption(0, UserLang)
       End If
    End If
    frmManualBlock.lblCardNo.Caption = frmManualBlockCaption(4, UserLang)
    frmManualBlock.lblAccNo.Caption = frmManualBlockCaption(5, UserLang)
    frmManualBlock.lblOldAmt.Caption = frmManualBlockCaption(6, UserLang)
    If blockUpdAction Then
       frmManualBlock.lblBlockedAmt.Caption = frmManualBlockCaption(8, UserLang)
    Else
       frmManualBlock.lblBlockedAmt.Caption = frmManualBlockCaption(7, UserLang)
    End If
    frmManualBlock.cmdOk.Caption = frmManualBlockCaption(9, UserLang)
    frmManualBlock.cmdApprove.Caption = frmManualBlockCaption(10, UserLang)
    frmManualBlock.cmdReject.Caption = frmManualBlockCaption(11, UserLang)
    frmManualBlock.cmdComments.Caption = frmManualBlockCaption(12, UserLang)
    frmManualBlock.cmdCancel.Caption = frmManualBlockCaption(13, UserLang)
    
    tComments = Space(50)
    If blockSupervisorAction Then
       txtCardNo.Enabled = False
       txtBlockAmt.Enabled = False
       cmdOk.Enabled = False
       cmdApprove.Enabled = True
       cmdReject.Enabled = True
       frmManualBlkPendingList.manualBlkPendingGrid.Col = 7
       tComments = frmManualBlkPendingList.manualBlkPendingGrid.text
    ElseIf blockTellerAction Then
       If blockAddAction Then
          txtCardNo.Enabled = True
       Else
          txtCardNo.Enabled = False
       End If
       txtBlockAmt.Enabled = True
       cmdOk.Enabled = True
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       frmManualBlkPendingList.manualBlkPendingGrid.Col = 7
       tComments = frmManualBlkPendingList.manualBlkPendingGrid.text
    Else
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdComments.Enabled = False
    End If
    
    If Len(Trim(tComments)) = 0 Then
       cmdComments.Enabled = False
    Else
       cmdComments.Enabled = True
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtNameOnTheCard_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtPinNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtRetypePin_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtBlockAmt_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 And KeyAscii <> 46 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Function supervisorDecision(appRejectFlag As String, supervisorComments As String) As Integer
   Dim tuserId As String
   Dim tDateTime As String
   Dim tSupervisorId As String
   Dim strmsglen As String
 
   frmManualBlkPendingList.manualBlkPendingGrid.Col = 0
   tuserId = Format(frmManualBlkPendingList.manualBlkPendingGrid.text, "!@@@@@@@@@@")
   frmManualBlkPendingList.manualBlkPendingGrid.Col = 1
   tDateTime = Format(frmManualBlkPendingList.manualBlkPendingGrid.text, "00000000000000")

   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
    
   SendMsg = "000268" & "92" & gBranchCode & appRejectFlag & tuserId & tDateTime & _
             frmManualBlock.txtCardNo & tSupervisorId & supervisorComments & _
             frmManualBlock.tag & Space(50)
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmManualBlock.MousePointer = vbHourglass
   
   cmdApprove.Enabled = False
   cmdCancel.Enabled = False
   cmdReject.Enabled = False
      
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmAcceptTPin.MousePointer = vbDefault
      cmdApprove.Enabled = True
      cmdCancel.Enabled = True
      cmdReject.Enabled = True
      Exit Function
   End If
      
   frmAcceptTPin.MousePointer = vbDefault
   cmdApprove.Enabled = True
   cmdCancel.Enabled = True
   cmdReject.Enabled = True
   
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvCustomerMsg.aRemarks
      Else
         MsgBox recvCustomerMsg.eRemarks
      End If
   End If
   If appRejectFlag = "R" Or appRejectFlag = "F" Then
      Unload frmManualBlkRejection
   End If
   unloadManualBlockForms
  
End Function

Public Sub unloadManualBlockForms()
  Dim tag As String
  Dim tCustNo As String
  tag = frmManualBlock.tag
  Unload Me
'  If Len(Trim(frmManualBlkPendingList.txtCustomerNo)) = 0 Then
'     tCustNo = Space(7)
'  Else
'     tCustNo = Format(frmManualBlkPendingList.txtCustomerNo, "0000000")
'  End If
'  Unload frmManualBlkPendingList
'  frmEnquiry.readBlockPendingList "00000", "S", tag, tCustNo
'  If UserLang = ARABIC Then
'     ChangePositions frmManualBlkPendingList, 11800
'     frmManualBlkPendingList.RightToLeft = True
'     frmManualBlkPendingList.Hide
'  End If
'  frmManualBlkPendingList.tag = tag
'  frmManualBlkPendingList.Show
End Sub



