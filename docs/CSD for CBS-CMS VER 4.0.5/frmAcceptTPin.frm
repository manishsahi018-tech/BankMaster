VERSION 5.00
Begin VB.Form frmAcceptTPin 
   BackColor       =   &H00BFD87E&
   Caption         =   "Telephone Pin select"
   ClientHeight    =   4920
   ClientLeft      =   210
   ClientTop       =   2055
   ClientWidth     =   6195
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4920
   ScaleWidth      =   6195
   Begin VB.Frame frameTpinSelect 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   3495
      Left            =   0
      TabIndex        =   6
      Top             =   720
      Width           =   6135
      Begin VB.TextBox txtTPinNo 
         Height          =   345
         IMEMode         =   3  'DISABLE
         Left            =   3075
         MaxLength       =   4
         PasswordChar    =   "*"
         TabIndex        =   0
         Tag             =   "6135"
         Top             =   2535
         Width           =   735
      End
      Begin VB.TextBox txtRetypeTPin 
         Height          =   345
         IMEMode         =   3  'DISABLE
         Left            =   3075
         MaxLength       =   4
         PasswordChar    =   "*"
         TabIndex        =   1
         Tag             =   "6135"
         Top             =   3015
         Width           =   735
      End
      Begin VB.TextBox txtCustNo 
         Enabled         =   0   'False
         Height          =   345
         IMEMode         =   3  'DISABLE
         Left            =   3075
         MaxLength       =   7
         TabIndex        =   14
         Tag             =   "6135"
         Top             =   480
         Width           =   1740
      End
      Begin VB.TextBox txtCustName 
         Enabled         =   0   'False
         Height          =   345
         IMEMode         =   3  'DISABLE
         Left            =   3075
         TabIndex        =   13
         Tag             =   "6135"
         Top             =   1005
         Width           =   2340
      End
      Begin VB.Frame FrameTpinSelected 
         BackColor       =   &H00BFD87E&
         Enabled         =   0   'False
         Height          =   435
         Left            =   3075
         TabIndex        =   10
         Tag             =   "6135"
         Top             =   1395
         Width           =   2145
         Begin VB.OptionButton optTPinSelectedYes 
            BackColor       =   &H00BFD87E&
            Caption         =   "Yes"
            Height          =   195
            Left            =   135
            TabIndex        =   12
            Tag             =   "2145"
            Top             =   150
            Width           =   810
         End
         Begin VB.OptionButton optTpinSelectedNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "No"
            Height          =   195
            Left            =   1080
            TabIndex        =   11
            Tag             =   "2145"
            Top             =   165
            Value           =   -1  'True
            Width           =   585
         End
      End
      Begin VB.Frame FrameTpinStatus 
         BackColor       =   &H00BFD87E&
         Enabled         =   0   'False
         Height          =   435
         Left            =   3075
         TabIndex        =   7
         Tag             =   "6135"
         Top             =   1905
         Width           =   2130
         Begin VB.OptionButton optTpinInactive 
            BackColor       =   &H00BFD87E&
            Caption         =   "Inactive"
            Height          =   195
            Left            =   1080
            TabIndex        =   9
            Tag             =   "2130"
            Top             =   150
            Value           =   -1  'True
            Width           =   975
         End
         Begin VB.OptionButton optTpinActive 
            BackColor       =   &H00BFD87E&
            Caption         =   "Active"
            Height          =   195
            Left            =   135
            TabIndex        =   8
            Tag             =   "2130"
            Top             =   165
            Width           =   810
         End
      End
      Begin VB.Label lblTPin 
         BackColor       =   &H00BFD87E&
         Caption         =   "TPin No"
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
         Left            =   1035
         TabIndex        =   20
         Tag             =   "6135"
         Top             =   2535
         Width           =   1215
      End
      Begin VB.Label lblReTypeTPin 
         BackColor       =   &H00BFD87E&
         Caption         =   "Retype TPin No"
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
         Left            =   1035
         TabIndex        =   19
         Tag             =   "6135"
         Top             =   3015
         Width           =   1695
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
         Left            =   1050
         TabIndex        =   18
         Tag             =   "6135"
         Top             =   480
         Width           =   1935
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
         Left            =   1050
         TabIndex        =   17
         Tag             =   "6135"
         Top             =   960
         Width           =   1815
      End
      Begin VB.Label lblTpinSelected 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "TPin Selected"
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
         Height          =   240
         Left            =   1035
         TabIndex        =   16
         Tag             =   "6135"
         Top             =   1455
         Width           =   1470
      End
      Begin VB.Label lblTpinStatus 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "TPin Status"
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
         Height          =   240
         Left            =   1035
         TabIndex        =   15
         Tag             =   "6135"
         Top             =   1965
         Width           =   1185
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00808080&
         BorderStyle     =   6  'Inside Solid
         Tag             =   "6135"
         X1              =   0
         X2              =   6195
         Y1              =   2430
         Y2              =   2430
      End
   End
   Begin VB.CommandButton cmdApprove 
      Caption         =   "&Approve"
      Height          =   375
      Left            =   2100
      TabIndex        =   3
      ToolTipText     =   "Approve"
      Top             =   4410
      Width           =   1095
   End
   Begin VB.CommandButton cmdReject 
      Caption         =   "&Reject"
      Height          =   375
      Left            =   3195
      TabIndex        =   4
      ToolTipText     =   "Reject"
      Top             =   4410
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4320
      TabIndex        =   5
      ToolTipText     =   "Cancel"
      Top             =   4410
      Width           =   1095
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Create"
      Default         =   -1  'True
      Height          =   375
      Left            =   1005
      TabIndex        =   2
      ToolTipText     =   "Create"
      Top             =   4410
      Width           =   1095
   End
   Begin VB.Label lblTpinSelect 
      BackColor       =   &H00BFD87E&
      Caption         =   "Telephone Pin Selection"
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
      Left            =   1080
      TabIndex        =   21
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "frmAcceptTPin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdApprove_Click()
   supervisorDecision "A", Space(200)
End Sub

Private Sub cmdCancel_Click()
    If frmAcceptTPin.tag = "C" Then
       Unload Me
       If screenSetNo = "2" Then
          frmIndividualOthersAcctInfo.unloadOtherIndividualForms
       ElseIf screenSetNo = "1" Or screenSetNo = "A" Then
          frmIndividualSaudiAcctInfo.unloadForms
       ElseIf screenSetNo = "7" Then
          frmQuickCustOpen.unloadForms
       Else
          frmCustomer2.unloadForms
       End If
       Exit Sub
    ElseIf frmAcceptTPin.tag = "A" Then
       unloadForms
    Else
       Unload Me
    End If
End Sub

Private Sub cmdOk_Click()
    Dim telephonePin As String
    Dim newOrUpdate As String
    Dim dateTime As String
    Dim strmsglen As String
    Dim tmpStr As String
    
    
    If Len(RTrim(txtTPinNo)) = 0 And Len(RTrim(txtRetypeTPin)) = 0 Then
       MsgBox errSpacePin(UserLang) ' "Pin cannot be blank...Please enter.."
       txtTPinNo.SetFocus
       Exit Sub
    End If
    
    If Trim(txtTPinNo) <> Trim(txtRetypeTPin) Then
       MsgBox errPinNotMatching(UserLang) '"Pin numbers does not match.. Please reenter.."
       txtTPinNo.SetFocus
       Exit Sub
    End If
    
    If Len(Trim(txtTPinNo)) <> 4 Then
       MsgBox errPinLessThan4Chars(UserLang)
       txtTPinNo.text = ""
       txtRetypeTPin.text = ""
       txtTPinNo.SetFocus
       Exit Sub
    End If
    
    telephonePin = Trim(txtTPinNo)
    
    If frmAcceptTPin.tag = "C" Then
       If telephonePin = atmPin1 Or telephonePin = atmPin2 Then
          MsgBox errATMPinSame(UserLang)
          txtTPinNo.text = ""
          txtRetypeTPin.text = ""
          txtTPinNo.SetFocus
          Exit Sub
       End If
    End If
    
    txtTPinNo.text = ""
    txtRetypeTPin.text = ""
    
    If telephonePin <> Space(4) Then
       tmpStr = Encrypt(telephonePin)
    Else
       tmpStr = Space(4)
    End If
    
    SendMsg = "000090" & "68" & gBranchCode & "3" & Format(gUserId, "!@@@@@@@@@@") & Space(14) & Format(txtCustNo, "!@@@@@@@") & tmpStr & Space(100)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmAcceptTPin.MousePointer = vbHourglass
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       frmAcceptTPin.MousePointer = vbNormal
       LoadError = True
       Exit Sub
    End If
    frmAcceptTPin.MousePointer = vbNormal
    parseTpinStatusDetails
    
    If recvTpinStatusMsg.status <> "000" Then
       If recvTpinStatusMsg.status = "008" Then
          MsgBox errWeakTpinEntered(UserLang)
       ElseIf recvTpinStatusMsg.status = "009" Then
          MsgBox errATMPinSame(UserLang)
       Else
          cmdCancel.Enabled = True
          If UserLang = ARABIC Then
             MsgBox recvTpinStatusMsg.aRemarks
          Else
             MsgBox recvTpinStatusMsg.eRemarks
          End If
       End If
       txtTPinNo.SetFocus
       Exit Sub
    End If
   
    If optTPinSelectedYes.Value = True Then
       newOrUpdate = "U"
    Else
       newOrUpdate = "N"
    End If
    
    If frmAcceptTPin.tag = "C" Then
       If screenSetNo = "2" Then
          dateTime = individualOthersInfo.dateTime
       ElseIf screenSetNo = "1" Or screenSetNo = "A" Then
          dateTime = individualSaudiInfo.dateTime
       ElseIf screenSetNo = "7" Then
          dateTime = quickCustInfo.dateTime
       Else
          dateTime = custInfo.dateTime
       End If
    Else
       dateTime = Space(14)
    End If
    
    SendMsg = "000000" & "68" & gBranchCode & "1" & Format(gUserId, "!@@@@@@@@@@") & dateTime & Format(txtCustNo, "!@@@@@@@") & tmpStr & newOrUpdate & Space(1) & Space(10)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
              
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
    parseTpinStatusDetails
    
    If recvTpinStatusMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTpinStatusMsg.aRemarks
       Else
          MsgBox recvTpinStatusMsg.eRemarks
       End If
       cmdCancel.Enabled = True
       Exit Sub
    Else
       MsgBox errSuccessful(UserLang)
    End If
    If frmAcceptTPin.tag = "C" Then
       Unload Me
       If screenSetNo = "2" Then
          frmIndividualOthersAcctInfo.unloadOtherIndividualForms
       ElseIf screenSetNo = "1" Or screenSetNo = "A" Then
          frmIndividualSaudiAcctInfo.unloadForms
       ElseIf screenSetNo = "7" Then
          frmQuickCustOpen.unloadForms
       Else
          frmCustomer2.unloadForms
       End If
       Exit Sub
    Else
       Unload Me
    End If
End Sub

Private Sub cmdReject_Click()
    'frmTpinRejection.Show vbModal
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmAcceptTPin, 6240
       frmAcceptTPin.RightToLeft = True
    End If
    
    frmAcceptTPin.Caption = frmAcceptTpinCaption(0, UserLang)
    frmAcceptTPin.lblTpinSelect.Caption = frmAcceptTpinCaption(0, UserLang)
    frmAcceptTPin.lblCustNo.Caption = frmAcceptTpinCaption(1, UserLang)
    frmAcceptTPin.lblCustName.Caption = frmAcceptTpinCaption(2, UserLang)
    frmAcceptTPin.lblTpinSelected.Caption = frmAcceptTpinCaption(3, UserLang)
    frmAcceptTPin.optTPinSelectedYes.Caption = frmAcceptTpinCaption(4, UserLang)
    frmAcceptTPin.optTpinSelectedNo.Caption = frmAcceptTpinCaption(5, UserLang)
    frmAcceptTPin.lblTpinStatus.Caption = frmAcceptTpinCaption(6, UserLang)
    frmAcceptTPin.optTpinActive.Caption = frmAcceptTpinCaption(7, UserLang)
    frmAcceptTPin.optTpinInactive.Caption = frmAcceptTpinCaption(8, UserLang)
    frmAcceptTPin.lblTPin.Caption = frmAcceptTpinCaption(9, UserLang)
    frmAcceptTPin.lblReTypeTPin.Caption = frmAcceptTpinCaption(10, UserLang)
    frmAcceptTPin.cmdOk.Caption = frmAcceptTpinCaption(11, UserLang)
    frmAcceptTPin.cmdApprove.Caption = frmAcceptTpinCaption(12, UserLang)
    frmAcceptTPin.cmdReject.Caption = frmAcceptTpinCaption(13, UserLang)
    frmAcceptTPin.cmdCancel.Caption = frmAcceptTpinCaption(14, UserLang)
        
    If InStr(recvLoginMsg.authorityLevel, "~01") > 0 And _
       tpinSelectAtBranch Then
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       cmdOk.Enabled = True
    ElseIf InStr(recvLoginMsg.authorityLevel, "~02") > 0 And _
            supervisorAction Then
       cmdOk.Enabled = False
       cmdApprove.Enabled = True
       cmdReject.Enabled = True
       frameTpinSelect.Enabled = False
    Else
       cmdOk.Enabled = False
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       frameTpinSelect.Enabled = False
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameTpinSelect_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtTPinNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtRetypeTPin_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
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
 
   If frmAcceptTPin.tag = "A" Then
      tuserId = tpinUserId
      tDateTime = tpinDateTime
   Else
      'frmTpinPendingList.tpinPendingGrid.Col = 0
      'tuserId = Format(frmTpinPendingList.tpinPendingGrid.text, "!@@@@@@@@@@")
      'frmTpinPendingList.tpinPendingGrid.Col = 1
      'tDateTime = Format(frmTpinPendingList.tpinPendingGrid.text, "00000000000000")
   End If
   
   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
    
   SendMsg = "000268" & "68" & gBranchCode & "2" & tuserId & tDateTime & _
             frmAcceptTPin.txtCustNo & Space(4) & Space(1) & appRejectFlag & tSupervisorId & _
             supervisorComments & Space(50)
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmAcceptTPin.MousePointer = vbHourglass
   
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
   parseTpinStatusDetails
   
   frmAcceptTPin.MousePointer = vbDefault
   cmdApprove.Enabled = True
   cmdCancel.Enabled = True
   cmdReject.Enabled = True
   
   If recvTpinStatusMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvTpinStatusMsg.aRemarks
      Else
         MsgBox recvTpinStatusMsg.eRemarks
      End If
   End If
   If appRejectFlag = "R" Then
      'Unload frmTpinRejection
      unloadForms
   Else
      unloadForms
   End If
End Function

Public Sub unloadForms()
  Dim tCustNo As String

  If frmAcceptTPin.tag = "A" Then
     Unload Me
     If screenSetNo = "2" Then
        If realOrPseudo = "1" Then
           frmIndividualOthersAcctInfo.updateBranchPower
        Else
           frmIndividualOthersAcctInfo.unloadOtherIndividualSupForms
        End If
     ElseIf screenSetNo = "1" Or screenSetNo = "A" Then
        If realOrPseudo = "1" Then
           frmIndividualSaudiAcctInfo.updateBranchPower
        Else
           frmIndividualSaudiAcctInfo.unloadSupForms
        End If
     ElseIf screenSetNo = "7" Then
        If realOrPseudo = "1" Then
           frmQuickCustOpen.updateBranchPower
        Else
           frmQuickCustOpen.unloadSupForms
        End If
     Else
        If realOrPseudo = "1" Then
           frmCustomer2.updateBranchPower
        Else
           frmCustomer2.unloadSupForms
        End If
     End If
  Else
     Unload Me
'     If Len(Trim(frmTpinPendingList.txtCustomerNo)) = 0 Then
'        tCustNo = Space(7)
'     Else
'        tCustNo = Format(frmTpinPendingList.txtCustomerNo, "0000000")
'     End If
     'Unload frmTpinPendingList
'     frmEnquiry.readTpinPendingList "00000", tCustNo
'     If UserLang = ARABIC Then
'        ChangePositions frmTpinPendingList, 11800
'        frmTpinPendingList.RightToLeft = True
'     End If
'     frmTpinPendingList.Show
  End If
End Sub

