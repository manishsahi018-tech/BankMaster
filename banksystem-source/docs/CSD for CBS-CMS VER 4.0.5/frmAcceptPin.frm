VERSION 5.00
Begin VB.Form frmAcceptPin 
   BackColor       =   &H00BFD87E&
   Caption         =   "Please Enter your ATM pin"
   ClientHeight    =   3690
   ClientLeft      =   1980
   ClientTop       =   2745
   ClientWidth     =   6135
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3690
   ScaleWidth      =   6135
   Begin VB.TextBox txtCardType 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2400
      TabIndex        =   8
      Top             =   960
      Width           =   1575
   End
   Begin VB.TextBox txtNameOnTheCard 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2400
      TabIndex        =   7
      Top             =   1440
      Width           =   2895
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2640
      TabIndex        =   5
      ToolTipText     =   "Cancel"
      Top             =   3000
      Width           =   1095
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   1440
      TabIndex        =   4
      ToolTipText     =   "Ok"
      Top             =   3000
      Width           =   1095
   End
   Begin VB.TextBox txtRetypePin 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2400
      MaxLength       =   4
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   2400
      Width           =   735
   End
   Begin VB.TextBox txtPinNo 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   2400
      MaxLength       =   4
      PasswordChar    =   "*"
      TabIndex        =   0
      Top             =   1920
      Width           =   735
   End
   Begin VB.Label lblAtmPinSelct 
      BackColor       =   &H00BFD87E&
      Caption         =   "ATM Pin selection"
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
      Left            =   1440
      TabIndex        =   10
      Top             =   120
      Width           =   3495
   End
   Begin VB.Label lblCardType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Type"
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
      Top             =   960
      Width           =   1575
   End
   Begin VB.Label lblNameOnTheCard 
      BackColor       =   &H00BFD87E&
      Caption         =   "Name on the card"
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
      TabIndex        =   6
      Top             =   1440
      Width           =   1935
   End
   Begin VB.Label lblReTypePin 
      BackColor       =   &H00BFD87E&
      Caption         =   "Retype Pin No"
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
      TabIndex        =   3
      Top             =   2400
      Width           =   1695
   End
   Begin VB.Label lblPin 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pin No"
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
      TabIndex        =   2
      Top             =   1920
      Width           =   1215
   End
End
Attribute VB_Name = "frmAcceptPin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdCancel_Click()
       
    If frmAcceptPin.Tag = "I" Then
       If cardTellerAction Then
          Unload Me
          frmCardDetails.unloadCardTellerForms
       Else
          Unload Me
          'Unload frmCardDetails 'Commented by Mohit on 03-12-2006 as frmCardDetails form should not be
                                 'unloaded so that user can get an option to print Card or Pin application. Arul requested
       End If
    ElseIf frmAcceptPin.Tag = "F" Then
       Unload Me
       'Unload frmCardDetails 'Commented by Mohit on 03-12-2006 as frmCardDetails form should not be
                              'unloaded so that user can get an option to print Card or Pin application. Arul requested
    Else
       
    End If
End Sub

Private Sub cmdOk_Click()
    Dim primaryOrSupplementary As String
    If Len(RTrim(txtPinNo)) = 0 And Len(RTrim(txtRetypePin)) = 0 Then
       MsgBox errSpacePin(UserLang) ' "Pin cannot be blank...Please enter.."
       txtPinNo.SetFocus
       Exit Sub
    End If
    
    If Trim(txtPinNo) <> Trim(txtRetypePin) Then
       MsgBox errPinNotMatching(UserLang) '"Pin numbers does not match.. Please reenter.."
       txtPinNo.SetFocus
       Exit Sub
    End If
    
    If Len(Trim(txtPinNo)) <> 4 Then
       MsgBox errPinLessThan4Chars(UserLang)
       txtPinNo.text = ""
       txtRetypePin.text = ""
       txtPinNo.SetFocus
       Exit Sub
    End If
    
    atmPin = Trim(txtPinNo)
    txtPinNo.text = ""
    txtRetypePin.text = ""
    
    If frmAcceptPin.Tag = "I" Then
       If frmCardDetails.optPrimary = True Then
          primaryOrSupplementary = "P"
       Else
          primaryOrSupplementary = "S"
       End If
       processPinRequest primaryOrSupplementary, cardInfo.dateTime
       If recvCustomerMsg.status <> "000" Then
          txtPinNo.text = ""
          txtRetypePin.text = ""
          txtPinNo.SetFocus
          Exit Sub
       End If
       If cardTellerAction Then
          Unload Me
          frmCardDetails.unloadCardTellerForms
          Exit Sub
       Else
          Unload Me
          'Unload frmCardDetails 'Commented by Mohit on 03-12-2006 as frmCardDetails form should not be
                                 'unloaded so that user can get an option to print Card or Pin application. Arul requested
          Exit Sub
       End If
    ElseIf frmAcceptPin.Tag = "F" Then
       If frmCardDetails.optPrimary = True Then
          primaryOrSupplementary = "P"
       Else
          primaryOrSupplementary = "S"
       End If
       processPinRequest primaryOrSupplementary, recvCardMsg.dateTime
       If recvCustomerMsg.status <> "000" Then
          txtPinNo.text = ""
          txtRetypePin.text = ""
          txtPinNo.SetFocus
          Exit Sub
       End If
       Unload Me
       'Unload frmCardDetails 'Commented by Mohit on 03-12-2006 as frmCardDetails form should not be
                              'unloaded so that user can get an option to print Card or Pin application. Arul requested
       Exit Sub
    End If
End Sub
Public Sub processPinRequest(opt As String, dateTime As String)
    Dim strmsglen As String
    Dim tmpStr As String
    
    tmpStr = Encrypt(atmPin)
    SendMsg = "000000" & "60" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & dateTime & opt & tmpStr
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmAcceptPin.cmdOk.Enabled = False
    frmAcceptPin.cmdCancel.Enabled = False
    frmAcceptPin.MousePointer = vbHourglass
              
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmAcceptPin.MousePointer = vbNormal
       frmAcceptPin.cmdOk.Enabled = True
       frmAcceptPin.cmdCancel.Enabled = True
       Exit Sub
    End If
    frmAcceptPin.MousePointer = vbNormal
    frmAcceptPin.cmdOk.Enabled = True
    frmAcceptPin.cmdCancel.Enabled = True
    
    If recvCustomerMsg.status <> "000" Then
       If recvCustomerMsg.status = "009" Then
          MsgBox errTPinSame(UserLang)
       ElseIf UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
       Exit Sub
    Else
       MsgBox errSuccessful(UserLang)
    End If
    
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmAcceptPin, 6240
       frmAcceptPin.RightToLeft = True
    End If
    
    atmPin1 = Space(4)
    atmPin2 = Space(4)
    
    frmAcceptPin.Caption = frmAcceptPinCaption(0, UserLang)
    frmAcceptPin.lblAtmPinSelct.Caption = frmAcceptPinCaption(7, UserLang)
    frmAcceptPin.lblCardType.Caption = frmAcceptPinCaption(1, UserLang)
    frmAcceptPin.lblNameOnTheCard.Caption = frmAcceptPinCaption(2, UserLang)
    frmAcceptPin.lblPin.Caption = frmAcceptPinCaption(3, UserLang)
    frmAcceptPin.lblReTypePin.Caption = frmAcceptPinCaption(4, UserLang)
    frmAcceptPin.cmdOk.Caption = frmAcceptPinCaption(5, UserLang)
    frmAcceptPin.cmdCancel.Caption = frmAcceptPinCaption(6, UserLang)

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

