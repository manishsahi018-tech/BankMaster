VERSION 5.00
Begin VB.Form frmStopChqDetails 
   BackColor       =   &H00BFD87E&
   Caption         =   "Stop Cheque Details "
   ClientHeight    =   7575
   ClientLeft      =   1440
   ClientTop       =   735
   ClientWidth     =   11760
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7575
   ScaleWidth      =   11760
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdReject 
      Caption         =   "Reject"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1965
      TabIndex        =   9
      ToolTipText     =   "Reject"
      Top             =   5670
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton cmdSupervisorComment 
      Caption         =   "Supervisor Comments"
      Height          =   375
      Left            =   135
      TabIndex        =   8
      ToolTipText     =   "Supervisor Comments"
      Top             =   5670
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "Approve"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3405
      TabIndex        =   10
      ToolTipText     =   "Approve"
      Top             =   5670
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Frame frameStopChqDetails 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   3135
      Left            =   0
      TabIndex        =   13
      Top             =   1800
      Width           =   11535
      Begin VB.TextBox txtUserStopped 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3360
         TabIndex        =   22
         Top             =   2040
         Width           =   1695
      End
      Begin VB.TextBox txtAcctNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2520
         TabIndex        =   14
         Top             =   240
         Width           =   2055
      End
      Begin VB.TextBox txtChequeNo 
         Height          =   285
         Left            =   6840
         MaxLength       =   10
         TabIndex        =   3
         Top             =   840
         Width           =   2055
      End
      Begin VB.TextBox txtChqAmt 
         Height          =   285
         Left            =   2520
         TabIndex        =   2
         Top             =   840
         Width           =   2055
      End
      Begin VB.TextBox txtFromCheque 
         Height          =   285
         Left            =   6840
         TabIndex        =   1
         Top             =   240
         Width           =   2055
      End
      Begin VB.ComboBox cmbStopDate 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   6840
         TabIndex        =   4
         Tag             =   "11775"
         Text            =   "01"
         Top             =   2040
         Width           =   615
      End
      Begin VB.ComboBox cmbStopMonth 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   315
         Left            =   7440
         TabIndex        =   5
         Tag             =   "11775"
         Text            =   "01"
         Top             =   2040
         Width           =   615
      End
      Begin VB.TextBox txtStopYear 
         BackColor       =   &H00FFFFFF&
         Enabled         =   0   'False
         Height          =   285
         Left            =   8040
         MaxLength       =   4
         TabIndex        =   6
         Tag             =   "11775"
         Top             =   2040
         Width           =   615
      End
      Begin VB.TextBox txtDetails 
         Height          =   285
         Left            =   2520
         MaxLength       =   25
         TabIndex        =   7
         Top             =   1440
         Width           =   3735
      End
      Begin VB.Label lblStoppedUserId 
         BackColor       =   &H00BFD87E&
         Caption         =   "User stopped the cheque"
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
         TabIndex        =   21
         Top             =   2040
         Width           =   2655
      End
      Begin VB.Label lblAcctNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Account Number"
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
         Left            =   480
         TabIndex        =   20
         Top             =   240
         Width           =   1935
      End
      Begin VB.Label lblToCheque 
         BackColor       =   &H00BFD87E&
         Caption         =   "To Cheque No."
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
         Left            =   4800
         TabIndex        =   19
         Top             =   840
         Width           =   1935
      End
      Begin VB.Label lblChequeAmt 
         BackColor       =   &H00BFD87E&
         Caption         =   "Cheque Amount"
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
         Left            =   480
         TabIndex        =   18
         Top             =   840
         Width           =   1815
      End
      Begin VB.Label lblFromCheque 
         BackColor       =   &H00BFD87E&
         Caption         =   "From Cheque "
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
         Left            =   4800
         TabIndex        =   17
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label lblStopDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Stop Date"
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
         Left            =   5400
         TabIndex        =   16
         Top             =   2040
         Width           =   1815
      End
      Begin VB.Label lblDetails 
         BackColor       =   &H00BFD87E&
         Caption         =   "Reason"
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
         Left            =   480
         TabIndex        =   15
         Top             =   1440
         Width           =   1815
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4800
      TabIndex        =   12
      ToolTipText     =   "Cancel"
      Top             =   5220
      Width           =   1335
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Create"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4845
      TabIndex        =   11
      ToolTipText     =   "Create"
      Top             =   5670
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Label lblStopChequeDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Stop Cheque Details"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   3720
      TabIndex        =   0
      Top             =   600
      Width           =   3855
   End
End
Attribute VB_Name = "frmStopChqDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdApprove_Click()
   Dim tUserid As String, tDateTime As String, tBranchCode As String, tSupervisorId As String
   Dim tCustNo As String
   
'   If realOrPseudo = "1" Then
'      If updateLocalStopChq = 1 Then
'         unloadStopChqForms
'         Exit Sub
'      End If
'   End If
   
   frmStopChqPendingList.stopChqPendingGrid.Col = 0
   tUserid = Format(frmStopChqPendingList.stopChqPendingGrid.text, "!@@@@@@@@@@")
   frmStopChqPendingList.stopChqPendingGrid.Col = 1
   tDateTime = Format(frmStopChqPendingList.stopChqPendingGrid.text, "00000000000000")
      
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
    
   SendMsg = "000268" & "54" & gBranchCode & "A" & tUserid & tDateTime & _
             frmStopChqDetails.txtAcctNo & tSupervisorId & Space(200) & _
             recvStopChqDetail.newOrUpdate & Space(50)
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmStopChqDetails.MousePointer = vbHourglass
   
   cmdApprove.Enabled = False
   cmdCancel.Enabled = False
   cmdCreate.Enabled = False
   cmdReject.Enabled = False
   
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmStopChqDetails.MousePointer = vbDefault
      cmdApprove.Enabled = True
      cmdCancel.Enabled = True
      cmdCreate.Enabled = False
      cmdReject.Enabled = True
      Exit Sub
   End If
   
   frmStopChqDetails.MousePointer = vbDefault
   cmdApprove.Enabled = True
   cmdCancel.Enabled = True
   cmdCreate.Enabled = False
   cmdReject.Enabled = True
   
   If recvStopChqApprovalMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvStopChqApprovalMsg.aRemarks
      Else
         MsgBox recvStopChqApprovalMsg.eRemarks
      End If
      unloadStopChqForms
      Exit Sub
   End If
   
   If realOrPseudo = "1" Then
      frmStopChqDetails.MousePointer = vbHourglass
      updateLocalStopChq
      frmStopChqDetails.MousePointer = vbNormal
   End If
   
   unloadStopChqForms

End Sub
Public Function updateLocalStopChq() As Integer

   If openStopChqFile = 1 Then
      frmStopChqDetails.MousePointer = vbDefault
      frmStopChqDetails.cmdApprove.Enabled = True
      frmStopChqDetails.cmdReject.Enabled = True
      frmStopChqDetails.cmdCancel.Enabled = True
      updateLocalStopChq = 1
      Exit Function
   End If
   
   If recvStopChqDetail.newOrUpdate = "U" Then
      KeyBuffer$ = Format(recvStopChqDetail.accNo, "!@@@@@@@@@@@@@@@@@@@@") & Format(recvStopChqDetail.chequeNo, "!@@@@@@@@@@@@")
      If readStopChq = 1 Then
         frmStopChqDetails.MousePointer = vbDefault
         frmStopChqDetails.cmdApprove.Enabled = True
         frmStopChqDetails.cmdReject.Enabled = True
         frmStopChqDetails.cmdCancel.Enabled = True
         closeStopChq
         updateLocalStopChq = 1
         Exit Function
      End If
   End If
 
   StopChqBuf.stopChqAccNo = Format(recvStopChqDetail.accNo, "!@@@@@@@@@@@@@@@@@@@@")
   StopChqBuf.chqNo = Format(recvStopChqDetail.chequeNo, "000000000000")
   StopChqBuf.chqAmt = Format(recvStopChqDetail.amount, "000000000000000000")
   StopChqBuf.chqDtDrawn = recvStopChqDetail.dateStop
   StopChqBuf.chqPayeeNarr = recvStopChqDetail.payeeName
   StopChqBuf.chqStopChqFlag = "0"
   StopChqBuf.chqFromNo = Format(recvStopChqDetail.chequeFrom, "000000000000")
      
   If recvStopChqDetail.newOrUpdate = "N" Then
      If insertStopChq = 1 Then
         frmStopChqDetails.MousePointer = vbDefault
         frmStopChqDetails.cmdApprove.Enabled = True
         frmStopChqDetails.cmdReject.Enabled = True
         frmStopChqDetails.cmdCancel.Enabled = True
         closeStopChq
         updateLocalStopChq = 1
         Exit Function
      End If
   Else
      If updateStopChq = 1 Then
         frmStopChqDetails.MousePointer = vbDefault
         frmStopChqDetails.cmdApprove.Enabled = True
         frmStopChqDetails.cmdReject.Enabled = True
         frmStopChqDetails.cmdCancel.Enabled = True
         closeStopChq
         updateLocalStopChq = 1
         Exit Function
      End If
   End If
   
   closeStopChq
   updateLocalStopChq = 0

End Function
Public Sub unloadStopChqForms()
   Dim tCustNo As String
'   If Len(Trim(frmStopChqPendingList.txtCustomerNo)) = 0 Then
'      tCustNo = Space(7)
'   Else
'      tCustNo = Format(frmStopChqPendingList.txtCustomerNo, "0000000")
'   End If
'   Unload Me
'   Unload frmStopChqPendingList
'   frmEnquiry.readStopChqPendingList "00000", "S", tCustNo
'   If UserLang = ARABIC Then
'      ChangePositions frmStopChqPendingList, 11800
'      frmStopChqPendingList.RightToLeft = True
'   End If
'   frmStopChqPendingList.Show
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdCreate_Click()
    Dim tDate As String
    Dim destroyFlag As String
    
    If recvStopChqDetail.newOrUpdate <> "U" Then
       If Len(RTrim(txtChequeNo)) = 0 Then
          MsgBox errSpaceChequeNo(UserLang)   '"To Cheque No Cannot be spaces....Please enter.. "
          txtChequeNo.SetFocus
          Exit Sub
       End If
       
       If Val(Trim(txtChequeNo)) = 0 Then
          MsgBox errZeroChqNo(UserLang)
          txtChequeNo.SetFocus
          Exit Sub
       End If
       
       If Val(Trim(txtFromCheque)) = 0 Then
          MsgBox errZeroChqNo(UserLang)
          txtFromCheque.SetFocus
          Exit Sub
       End If
       
       If Val(Trim(txtFromCheque)) > Val(Trim(txtChequeNo)) Then
          MsgBox errFromChqNoGreater(UserLang)
          'txtFromCheque.SetFocus
          Exit Sub
       End If
    
'       If Len(RTrim(txtChqAmt)) = 0 Then
'          MsgBox errSpaceChequeAmt(UserLang)   '"Cheque Amount Cannot be spaces...Please enter..."
'          txtChqAmt.SetFocus
'          Exit Sub
'       End If
    
       tDate = txtStopYear & cmbStopMonth & cmbStopDate
       If Not validDate(tDate) Then
          MsgBox errInvalidDate(UserLang)
          cmbStopDate.SetFocus
          Exit Sub
       End If
    End If
    
    If frmStopChqDetails.tag = "1" Then
       destroyFlag = "1"
    Else
       destroyFlag = "0"
    End If
    
    formatNewStopChqRequest
    
    SendMsg = stopChqInfo.msgLen & stopChqInfo.service & _
              stopChqInfo.homeBranch & stopChqInfo.userId & stopChqInfo.dateTime & _
              stopChqInfo.creationOrUpdate & stopChqInfo.newOrUpdate & _
              stopChqInfo.accNo & stopChqInfo.chequeNo & stopChqInfo.amount & _
              stopChqInfo.dateStop & stopChqInfo.payeeName & _
              stopChqInfo.chequeFrom & destroyFlag & Space(50)
              
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False

    frmStopChqDetails.MousePointer = vbHourglass
             
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmStopChqDetails.MousePointer = vbDefault
       Exit Sub
    End If
    
    If recvCustomerMsg.status = "000" Then
       MsgBox errSuccessful(UserLang)
    Else
       If UserLang = ENGLISH Then
          MsgBox recvCustomerMsg.eRemarks
       Else
          MsgBox recvCustomerMsg.aRemarks
       End If
    End If
    
    frmStopChqDetails.MousePointer = vbDefault
'    If stopChqTellerAction Then
'       If Len(Trim(frmStopChqPendingList.txtCustomerNo)) = 0 Then
'          tCustNo = Space(7)
'       Else
'          tCustNo = Format(frmStopChqPendingList.txtCustomerNo, "0000000")
'       End If
'       Unload Me
'       Unload frmStopChqPendingList
'       frmEnquiry.readStopChqPendingList "00000", "T", tCustNo
'       If UserLang = ARABIC Then
'          ChangePositions frmStopChqPendingList, 11800
'          frmStopChqPendingList.RightToLeft = True
'       End If
'       frmStopChqPendingList.Show
'    Else
'       Unload Me
'    End If
   
End Sub

Private Sub cmdReject_Click()
    frmStopChqRejection.Show vbModal
End Sub

Private Sub cmdSupervisorComment_Click()
    MsgBox recvStopChqDetail.supervisorComments
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
            
    If stopChqCreateAction = True Then
       frmStopChqDetails.txtAcctNo = frmStopChequeGrid.txtAcctNo
       frmStopChqDetails.frameStopChqDetails.Enabled = True
    End If
    
    If UserLang = ARABIC Then
       ChangePositions frmStopChqDetails, 11805
       frmStopChqDetails.RightToLeft = True
    End If
    If Not stopChqTellerAction And Not stopChqSupervisorAction Then
       frmStopChqDetails.tag = frmStopChequeGrid.tag
    End If
    If frmStopChqDetails.tag = "1" Then
       frmStopChqDetails.Caption = frmStopChqDetailCaption(13, UserLang)
       frmStopChqDetails.lblStopChequeDetails.Caption = frmStopChqDetailCaption(13, UserLang)
    Else
       frmStopChqDetails.Caption = frmStopChqDetailCaption(0, UserLang)
       frmStopChqDetails.lblStopChequeDetails.Caption = frmStopChqDetailCaption(0, UserLang)
    End If
    
    frmStopChqDetails.lblAcctNo.Caption = frmStopChqDetailCaption(1, UserLang)
    frmStopChqDetails.lblToCheque.Caption = frmStopChqDetailCaption(2, UserLang)
    frmStopChqDetails.lblChequeAmt.Caption = frmStopChqDetailCaption(3, UserLang)
    frmStopChqDetails.lblFromCheque.Caption = frmStopChqDetailCaption(4, UserLang)
    frmStopChqDetails.lblStopDate.Caption = frmStopChqDetailCaption(5, UserLang)
    frmStopChqDetails.lblDetails.Caption = frmStopChqDetailCaption(6, UserLang)
    frmStopChqDetails.lblStoppedUserId.Caption = frmStopChqDetailCaption(12, UserLang)
    frmStopChqDetails.cmdSupervisorComment.Caption = frmStopChqDetailCaption(7, UserLang)
    frmStopChqDetails.cmdReject.Caption = frmStopChqDetailCaption(8, UserLang)
    frmStopChqDetails.cmdApprove.Caption = frmStopChqDetailCaption(9, UserLang)
    frmStopChqDetails.cmdCreate.Caption = frmStopChqDetailCaption(10, UserLang)
    frmStopChqDetails.cmdCancel.Caption = frmStopChqDetailCaption(11, UserLang)
    
    For i = 1 To 31
       If i < 10 Then
          num = "0" + CStr(i)
       Else
          num = CStr(i)
       End If
       cmbStopDate.AddItem num
       If i < 13 Then
          cmbStopMonth.AddItem num
       End If
    Next
    
    cmbStopDate.text = Mid$(bankingDate, 7, 2)
    cmbStopMonth.text = Mid$(bankingDate, 5, 2)
    txtStopYear.text = Mid$(bankingDate, 1, 4)
            
    If stopChqTellerAction Then
'       If recvStopChqDetail.newOrUpdate = "U" Then
'          frameStopChqDetails.Enabled = False
'       Else
'          frameStopChqDetails.Enabled = True
'          frmStopChqDetails.txtUserStopped = gUserId
'       End If
       'cmdCreate.Enabled = True
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdSupervisorComment.Enabled = True
    ElseIf stopChqSupervisorAction Then
       If frmStopChqDetails.tag = "1" Then
          'frameStopChqDetails.Enabled = True
          'cmdCreate.Enabled = True
          cmdApprove.Enabled = False
          cmdReject.Enabled = False
          cmdSupervisorComment.Enabled = False
       Else
          frameStopChqDetails.Enabled = False
          cmdCreate.Enabled = False
          'cmdApprove.Enabled = True
          'cmdReject.Enabled = True
          cmdSupervisorComment.Enabled = True
       End If
    ElseIf stopChqSearchAction Then
       cmdCreate.Enabled = False
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdSupervisorComment.Enabled = False
       frameStopChqDetails.Enabled = False
    Else
       'cmdCreate.Enabled = True
       frmStopChqDetails.txtUserStopped = gUserId
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdSupervisorComment.Enabled = False
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
End Sub

Private Sub frameStopChqDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtChequeNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtFromCheque_Change()
   If stopChqCreateAction Then
      txtChequeNo = txtFromCheque
   End If
End Sub

Private Sub txtFromCheque_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
