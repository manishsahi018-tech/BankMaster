VERSION 5.00
Begin VB.Form frmCardRenewal 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card Renewal"
   ClientHeight    =   4575
   ClientLeft      =   2865
   ClientTop       =   2745
   ClientWidth     =   6495
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4575
   ScaleWidth      =   6495
   Begin VB.ComboBox cmbToBranch 
      Height          =   315
      Left            =   3360
      TabIndex        =   3
      Top             =   2640
      Width           =   2055
   End
   Begin VB.ComboBox cmbFromBranch 
      Height          =   315
      Left            =   3360
      TabIndex        =   2
      Top             =   2040
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      ToolTipText     =   "Cancel"
      Top             =   3600
      Width           =   1335
   End
   Begin VB.CommandButton cmdRenew 
      Caption         =   "Renew"
      Height          =   375
      Left            =   2280
      TabIndex        =   4
      ToolTipText     =   "Renew"
      Top             =   3600
      Width           =   1335
   End
   Begin VB.TextBox txtFreqDays 
      Height          =   285
      Left            =   3360
      TabIndex        =   1
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Label lblToBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "To Branch Code"
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
      Left            =   1200
      TabIndex        =   8
      Top             =   2640
      Width           =   1815
   End
   Begin VB.Label lblFromBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "From Branch Code"
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
      Left            =   1200
      TabIndex        =   7
      Top             =   2040
      Width           =   2055
   End
   Begin VB.Label lblFrequencyDays 
      BackColor       =   &H00BFD87E&
      Caption         =   "Frequency Days"
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
      Left            =   1200
      TabIndex        =   6
      Top             =   1440
      Width           =   1815
   End
   Begin VB.Label lblRenewalProcess 
      BackColor       =   &H00BFD87E&
      Caption         =   "R E N E W A L  O F  C A R D S"
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
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   4455
   End
End
Attribute VB_Name = "frmCardRenewal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmbFromBranch_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbFromBranch.Text)) <> 0 Then
         tCode = Mid$(cmbFromBranch.Text, 1, 4)
         For i = 0 To cmbFromBranch.ListCount
             If Mid$(cmbFromBranch.List(i), 1, 4) = tCode Then
                cmbFromBranch.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceBranchCode(UserLang)   '"Branch Code Cannot be spaces.. Please enter.."
         cmbFromBranch.SetFocus
         Exit Sub
      End If
        
      If i > cmbFromBranch.ListCount Then
         MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
         cmbFromBranch.SetFocus
      End If
   End If

End Sub

Private Sub cmbToBranch_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbToBranch.Text)) <> 0 Then
         tCode = Mid$(cmbToBranch.Text, 1, 4)
         For i = 0 To cmbToBranch.ListCount
             If Mid$(cmbToBranch.List(i), 1, 4) = tCode Then
                cmbToBranch.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceBranchCode(UserLang)     '"Branch Code Cannot be spaces.. Please enter.."
         cmbToBranch.SetFocus
         Exit Sub
      End If
        
      If i > cmbToBranch.ListCount Then
         MsgBox errInvalidBranchCode(UserLang)   '"Invalid Branch Code...Please re-enter.."
         cmbToBranch.SetFocus
      End If
   End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdRenew_Click()
  Dim strmsglen As String
  Dim tuserId As String
  
  
    
  If Len(RTrim(txtFreqDays)) = 0 Then
     MsgBox errSpaceFreqDays(UserLang)
     txtFreqDays.SetFocus
     Exit Sub
  End If
  
  If Len(RTrim(cmbFromBranch.Text)) = 0 Then
     MsgBox errSpaceBranchCode(UserLang)
     cmbFromBranch.SetFocus
     Exit Sub
  End If
  
  If Len(RTrim(cmbToBranch.Text)) = 0 Then
     MsgBox errSpaceBranchCode(UserLang)
     cmbToBranch.SetFocus
     Exit Sub
  End If
  
  tuserId = Format(gUserId, "!@@@@@@@@@@")
  
  SendMsg = "000268" + "30" + gBranchCode + tuserId + _
            Format(txtFreqDays, "000") + Format(Mid$(cmbFromBranch, 1, 4), "0000") + _
            Format(Mid$(cmbToBranch, 1, 4), "0000")
 
  strmsglen = Format(Len(SendMsg), "000000")
  Mid$(SendMsg, 1, 6) = strmsglen
  DataReceivedFlag = False
  
  frmCardRenewal.MousePointer = vbHourglass
  frmCardRenewal.cmdRenew.Enabled = False
  frmCardRenewal.cmdCancel.Enabled = False
  
  ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpclient, frmEnquiry.Timer1)
  If ReturnStatus = LocalCommsError Then
     LoadError = True
     frmCardRenewal.MousePointer = vbDefault
     frmCardRenewal.cmdRenew.Enabled = True
     frmCardRenewal.cmdCancel.Enabled = True
     Exit Sub
  End If
 
  frmCardRenewal.MousePointer = vbDefault
  frmCardRenewal.cmdRenew.Enabled = True
  frmCardRenewal.cmdCancel.Enabled = True
  
  If recvCustomerMsg.status = "000" Then
     MsgBox errSuccessful(UserLang)
  Else
     If UserLang = ARABIC Then
        MsgBox recvCustomerMsg.aRemarks
     Else
        MsgBox recvCustomerMsg.eRemarks
     End If
     Unload Me
     Exit Sub
  End If
 
  Unload Me
   
End Sub

Private Sub Form_Load()
   Dim mQry As String
   
   If UserLang = ARABIC Then
      ChangePositions frmCardRenewal, 6615
      frmCardRenewal.RightToLeft = True
   End If
   
   mQry = "select branchcode,arabicname,englishname from branchinfo"
   Set rs = db.OpenRecordset(mQry)
   
   If rs.RecordCount > 0 Then
      cmbFromBranch.Clear
      cmbToBranch.Clear
      rs.MoveFirst
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbFromBranch.AddItem rs(0) + "-" + rs(2)
            cmbToBranch.AddItem rs(0) + "-" + rs(2)
         Else
            cmbFromBranch.AddItem rs(0) + "-" + rs(1)
            cmbToBranch.AddItem rs(0) + "-" + rs(1)
         End If
         rs.MoveNext
      Loop
      cmbFromBranch.ListIndex = 1
      cmbToBranch.ListIndex = 1
   End If
   
   frmCardRenewal.Caption = frmCardRenewalCaption(0, UserLang)
   frmCardRenewal.lblRenewalProcess.Caption = frmCardRenewalCaption(1, UserLang)
   frmCardRenewal.lblFrequencyDays.Caption = frmCardRenewalCaption(2, UserLang)
   frmCardRenewal.lblFromBranchCode.Caption = frmCardRenewalCaption(3, UserLang)
   frmCardRenewal.lblToBranchCode.Caption = frmCardRenewalCaption(4, UserLang)
   frmCardRenewal.cmdRenew.Caption = frmCardRenewalCaption(5, UserLang)
   frmCardRenewal.cmdCancel.Caption = frmCardRenewalCaption(6, UserLang)
End Sub
