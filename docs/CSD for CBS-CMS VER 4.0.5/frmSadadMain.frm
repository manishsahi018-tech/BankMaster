VERSION 5.00
Begin VB.Form frmSadadMain 
   BackColor       =   &H00BFD87E&
   Caption         =   "SADAD Main Menu"
   ClientHeight    =   8265
   ClientLeft      =   120
   ClientTop       =   360
   ClientWidth     =   11565
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8265
   ScaleWidth      =   11565
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete Bills from Profile"
      Height          =   375
      Left            =   4320
      TabIndex        =   5
      ToolTipText     =   "Delete Bills from Profile"
      Top             =   4200
      Width           =   2055
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add Bills to Profile"
      Height          =   375
      Left            =   4320
      TabIndex        =   4
      ToolTipText     =   "Add Bills to Profile"
      Top             =   3600
      Width           =   2055
   End
   Begin VB.CommandButton cmdProfileEnq 
      Caption         =   "Profile Enquiry"
      Height          =   375
      Left            =   4320
      TabIndex        =   3
      ToolTipText     =   "Profile Enquiry"
      Top             =   3000
      Width           =   2055
   End
   Begin VB.CommandButton cmdPaymentEnq 
      Caption         =   "Payment Enquiry"
      Height          =   375
      Left            =   4320
      TabIndex        =   2
      ToolTipText     =   "Payment Enquiry"
      Top             =   2400
      Width           =   2055
   End
   Begin VB.TextBox txtCustomerNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3360
      MaxLength       =   7
      TabIndex        =   9
      Top             =   960
      Width           =   1575
   End
   Begin VB.TextBox txtCustName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6960
      TabIndex        =   8
      Top             =   960
      Width           =   3015
   End
   Begin VB.ComboBox cmbIdType 
      Height          =   315
      Left            =   3360
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   1320
      Width           =   1575
   End
   Begin VB.TextBox txtIdNumber 
      Height          =   285
      Left            =   6960
      TabIndex        =   1
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4320
      TabIndex        =   7
      ToolTipText     =   "Exit"
      Top             =   4800
      Width           =   2055
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
      Left            =   720
      TabIndex        =   13
      Top             =   960
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
      Left            =   5160
      TabIndex        =   12
      Top             =   960
      Width           =   1935
   End
   Begin VB.Label lblidType 
      BackColor       =   &H00BFD87E&
      Caption         =   "ID Type"
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
      Left            =   720
      TabIndex        =   11
      Top             =   1320
      Width           =   1335
   End
   Begin VB.Label lblIdNumber 
      BackColor       =   &H00BFD87E&
      Caption         =   "ID Number"
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
      Left            =   5160
      TabIndex        =   10
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Label lblSADADMain 
      BackColor       =   &H00BFD87E&
      Caption         =   "SADAD Main Menu"
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
      Left            =   4440
      TabIndex        =   6
      Top             =   240
      Width           =   3015
   End
End
Attribute VB_Name = "frmSadadMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAdd_Click()
   Dim tCode As String
   Dim i As Integer
   Dim strmsglen As String
   
   If validateIdEntry <> 0 Then
      Exit Sub
   End If
   
   If getProfileEnq <> 0 Then
      Exit Sub
   End If
   profileEnqAction = False
   profileDelAction = False
   profileAddAction = True
    
   i = 0
'   frmSadadProfileAdd.txtIdNumber = txtIdNumber
'   tCode = Mid$(cmbIdType, 1, 1)
'   If Len(RTrim(tCode)) <> 0 Then
'      For i = 0 To frmSadadProfileAdd.cmbIdType.ListCount
'          If Mid(frmSadadProfileAdd.cmbIdType.List(i), 1, 1) = tCode Then
'             frmSadadProfileAdd.cmbIdType.ListIndex = i
'             Exit For
'          End If
'      Next i
'   Else
'      frmSadadProfileAdd.cmbIdType.ListIndex = -1
'   End If
'   If i > frmSadadProfileAdd.cmbIdType.ListCount Then
'      frmSadadProfileAdd.cmbIdType.ListIndex = -1
'   End If
'
'   frmSadadProfileAdd.Show
End Sub

Private Sub cmdDelete_Click()
    Dim tCode As String
   Dim i As Integer
   Dim strmsglen As String
   
   If validateIdEntry <> 0 Then
      Exit Sub
   End If
   
   If getProfileEnq <> 0 Then
      Exit Sub
   End If
    
   profileEnqAction = False
   profileDelAction = True
   profileAddAction = False
   i = 0
'   frmSadadProfileEnq.txtIdNumber = txtIdNumber
'   tCode = Mid$(cmbIdType, 1, 1)
'   If Len(RTrim(tCode)) <> 0 Then
'      For i = 0 To frmSadadProfileEnq.cmbIdType.ListCount
'          If Mid(frmSadadProfileEnq.cmbIdType.List(i), 1, 1) = tCode Then
'             frmSadadProfileEnq.cmbIdType.ListIndex = i
'             Exit For
'          End If
'      Next i
'   Else
'      frmSadadProfileEnq.cmbIdType.ListIndex = -1
'   End If
'   If i > frmSadadProfileEnq.cmbIdType.ListCount Then
'      frmSadadProfileEnq.cmbIdType.ListIndex = -1
'   End If
'
'   frmSadadProfileEnq.Show
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdPaymentEnq_Click()
   Dim tCode As String
   Dim i As Integer
   
   If validateIdEntry <> 0 Then
      Exit Sub
   End If
   
   i = 0
   frmSadadEnq.txtCustomerNo = txtCustomerNo
   frmSadadEnq.txtCustName = txtCustName
   frmSadadEnq.txtIdNumber = txtIdNumber
   tCode = Mid$(cmbIdType, 1, 1)
   If Len(RTrim(tCode)) <> 0 Then
      For i = 0 To frmSadadEnq.cmbIdType.ListCount
          If Mid(frmSadadEnq.cmbIdType.List(i), 1, 1) = tCode Then
             frmSadadEnq.cmbIdType.ListIndex = i
             Exit For
          End If
      Next i
   Else
      frmSadadEnq.cmbIdType.ListIndex = -1
   End If
   If i > frmSadadEnq.cmbIdType.ListCount Then
      frmSadadEnq.cmbIdType.ListIndex = -1
   End If
   frmSadadEnq.Show
End Sub

Private Sub cmdProfileEnq_Click()
   Dim tCode As String
   Dim i As Integer, noOfRecs As Integer
   Dim mQry As String
   Dim strmsglen As String
    
   If validateIdEntry <> 0 Then
      Exit Sub
   End If
     
   If getProfileEnq <> 0 Then
      Exit Sub
   End If
   profileEnqAction = True
   profileDelAction = False
   profileAddAction = False
   
   i = 0
'   frmSadadProfileEnq.txtIdNumber = txtIdNumber
'   tCode = Mid$(cmbIdType, 1, 1)
'   If Len(RTrim(tCode)) <> 0 Then
'      For i = 0 To frmSadadProfileEnq.cmbIdType.ListCount
'          If Mid(frmSadadProfileEnq.cmbIdType.List(i), 1, 1) = tCode Then
'             frmSadadProfileEnq.cmbIdType.ListIndex = i
'             Exit For
'          End If
'      Next i
'   Else
'      frmSadadProfileEnq.cmbIdType.ListIndex = -1
'   End If
'   If i > frmSadadProfileEnq.cmbIdType.ListCount Then
'      frmSadadProfileEnq.cmbIdType.ListIndex = -1
'   End If
'
'   frmSadadProfileEnq.Show
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    
    If UserLang = ARABIC Then
       ChangePositions frmSadadMain, 11670
       frmSadadMain.RightToLeft = True
    End If
    
    frmSadadMain.Caption = frmSadadMainCaption(0, UserLang)
    frmSadadMain.lblSADADMain.Caption = frmSadadMainCaption(0, UserLang)
    frmSadadMain.lblCustomerNo.Caption = frmSadadMainCaption(1, UserLang)
    frmSadadMain.lblCustName.Caption = frmSadadMainCaption(2, UserLang)
    frmSadadMain.lblidType.Caption = frmSadadMainCaption(3, UserLang)
    frmSadadMain.lblIdNumber.Caption = frmSadadMainCaption(4, UserLang)
    frmSadadMain.cmdPaymentEnq.Caption = frmSadadMainCaption(5, UserLang)
    frmSadadMain.cmdProfileEnq.Caption = frmSadadMainCaption(6, UserLang)
    frmSadadMain.cmdAdd.Caption = frmSadadMainCaption(7, UserLang)
    frmSadadMain.cmdDelete.Caption = frmSadadMainCaption(8, UserLang)
    frmSadadMain.cmdExit.Caption = frmSadadMainCaption(9, UserLang)
        
    
   mQry = "select * from idinfo where displayforutilityenq = '1'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      cmbIdType.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbIdType.AddItem rs("idcode") & "-" & rs("englishname")
         Else
            cmbIdType.AddItem rs("idcode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   
   If InStr(recvLoginMsg.authorityLevel, "~01") > 0 Then
      cmdAdd.Enabled = True
      cmdDelete.Enabled = True
   Else
      cmdAdd.Enabled = False
      cmdDelete.Enabled = False
   End If
   
   If enableSadadProfile = True Then
      If InStr(recvLoginMsg.authorityLevel, "~01") > 0 Then
         cmdAdd.Enabled = True
         cmdDelete.Enabled = True
      End If
      cmdProfileEnq.Enabled = True
   Else
      cmdAdd.Enabled = False
      cmdDelete.Enabled = False
      cmdProfileEnq.Enabled = False
   End If
   
   frmSadadMain.Show
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Public Function getProfileEnq() As Integer
   Dim strmsglen As String, tmpStr As String, tCode As String
   Dim errorMsg As String
   Dim mQry As String

   formatSadadProfileMsg Mid$(cmbIdType, 1, 1), Format(txtIdNumber, "!@@@@@@@@@@@@@@@"), "E"
   
   SendMsg = sadadProfileMsg.msgLen & sadadProfileMsg.service & sadadProfileMsg.homeBranch & _
             sadadProfileMsg.userId & sadadProfileMsg.langInd & sadadProfileMsg.idNo & _
             sadadProfileMsg.idType & sadadProfileMsg.action & sadadProfileMsg.recordCount

   'noOfRecs = Val(sadadProfileMsg.recordCount)
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmSadadMain.MousePointer = vbHourglass
   cmdAdd.Enabled = False
   cmdDelete.Enabled = False
   cmdPaymentEnq.Enabled = False
   cmdProfileEnq.Enabled = False
     
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      getProfileEnq = 1
      frmSadadMain.MousePointer = vbNormal
      If InStr(recvLoginMsg.authorityLevel, "~01") > 0 Then
         cmdAdd.Enabled = True
         cmdDelete.Enabled = True
      End If
      cmdPaymentEnq.Enabled = True
      cmdProfileEnq.Enabled = True
      Exit Function
   End If
   frmSadadMain.MousePointer = vbNormal
   If InStr(recvLoginMsg.authorityLevel, "~01") > 0 Then
      cmdAdd.Enabled = True
      cmdDelete.Enabled = True
   End If
   cmdPaymentEnq.Enabled = True
   cmdProfileEnq.Enabled = True
   
   parseSadadProfileEnqMsg
   
   If recvSadadProfileEnqMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvSadadProfileEnqMsg.aRemarks
      Else
         MsgBox recvSadadProfileEnqMsg.eRemarks
      End If
      getProfileEnq = 1
      Exit Function
   End If
   
   If Trim(recvSadadProfileEnqMsg.queryStatusCode) <> "0" Then
      tCode = recvSadadProfileEnqMsg.queryStatusCode
      mQry = "select * from sadadupdstatusinfo where updstatuscode = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            tmpStr = tCode & "-" & rs("arabicdescription")
         Else
            tmpStr = tCode & "-" & rs("englishdescription")
         End If
      Else
         tmpStr = tCode & "-" & "Not defined in local DB"
      End If
      MsgBox errError(UserLang) & "(QueryStatus Code) [" & tmpStr & "] " & errRecdFromSADAD(UserLang)
      getProfileEnq = 1
      Exit Function
   End If
   
   getProfileEnq = 0
   
End Function

Public Function validateIdEntry() As Integer
   Dim tCode As String
   
   tCode = Mid$(cmbIdType.text, 1, 1)
   
   If Len(RTrim(tCode)) = 0 Then
      MsgBox errSpaceIdType(UserLang)
      validateIdEntry = 1
      Exit Function
   End If
    
   If Len(RTrim(txtIdNumber)) = 0 Then
      MsgBox errSpaceId(UserLang)
      txtIdNumber.SetFocus
      validateIdEntry = 1
      Exit Function
   End If
   
   If Mid$(cmbIdType.text, 1, 1) = "I" Or Mid$(cmbIdType.text, 1, 1) = "Q" Then
       If Len(RTrim(txtIdNumber)) <> 10 Then
          MsgBox errInvalidId(UserLang)
          txtIdNumber.SetFocus
          validateIdEntry = 1
          Exit Function
       End If
       If Mid$(cmbIdType, 1, 1) = "Q" Then
          If Mid$(txtIdNumber, 1, 1) <> "2" And _
             Mid$(txtIdNumber, 1, 1) <> "3" And _
             Mid$(txtIdNumber, 1, 1) <> "5" Then
             MsgBox errInvalidIdCategory(UserLang)
             validateIdEntry = 1
             Exit Function
          End If
       Else  ' Saudi Id Number
          If Mid$(txtIdNumber, 1, 1) <> "1" Then
             MsgBox errInvalidIdCategory(UserLang)
             txtIdNumber.SetFocus
             validateIdEntry = 1
             Exit Function
          End If
       End If
       If validIdNumber(txtIdNumber) = False Then
          MsgBox errInvalidIdNo(UserLang)
          txtIdNumber.SetFocus
          validateIdEntry = 1
          Exit Function
       End If
  End If
  validateIdEntry = 0
End Function

