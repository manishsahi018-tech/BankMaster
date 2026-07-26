VERSION 5.00
Begin VB.Form frmJointAccName 
   BackColor       =   &H00BFD87E&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Joint Account Names"
   ClientHeight    =   4110
   ClientLeft      =   1470
   ClientTop       =   1935
   ClientWidth     =   9795
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4110
   ScaleWidth      =   9795
   Begin VB.TextBox txtJointAccNameOnCheck1 
      Height          =   495
      Left            =   4560
      MaxLength       =   30
      TabIndex        =   2
      Top             =   1320
      Width           =   4575
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4920
      TabIndex        =   4
      ToolTipText     =   "Ok"
      Top             =   3120
      Width           =   975
   End
   Begin VB.TextBox txtJointAccNameOnReports 
      Height          =   495
      Left            =   4560
      MaxLength       =   30
      TabIndex        =   3
      Top             =   2160
      Width           =   4575
   End
   Begin VB.TextBox txtJointAccNameOnCheck 
      Height          =   495
      Left            =   4560
      MaxLength       =   30
      TabIndex        =   1
      Top             =   600
      Width           =   4575
   End
   Begin VB.Label lblLine2 
      BackColor       =   &H00BFD87E&
      Caption         =   " Line-2"
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
      Height          =   255
      Left            =   3240
      TabIndex        =   6
      Top             =   1440
      Width           =   1215
   End
   Begin VB.Label lblJointAccNameOnReports 
      BackColor       =   &H00BFD87E&
      Caption         =   "Joint Account Name on Reports"
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
      Height          =   615
      Left            =   240
      TabIndex        =   5
      Top             =   2160
      Width           =   4095
   End
   Begin VB.Label lblJointAccNameOnCheck 
      BackColor       =   &H00BFD87E&
      Caption         =   "Joint Account Name on Cheque                                               Line-1"
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
      Height          =   615
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   4215
   End
End
Attribute VB_Name = "frmJointAccName"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdOk_Click()
   If supervisorAction Then
      Unload Me
      Exit Sub
   End If
   
   If searchAction Or custHistoryAction Then
      Unload Me
      Exit Sub
   End If
   
   If (Len(RTrim(txtJointAccNameOnCheck)) = 0 And _
      Len(RTrim(txtJointAccNameOnCheck1)) = 0) Or _
      Len(RTrim(txtJointAccNameOnReports)) = 0 Then
      MsgBox errSpaceJointAccName(UserLang)
      Exit Sub
   End If
   
   Me.Hide
   If updateAction Or tellerAction Then
      If screenSetNo = "1" Or screenSetNo = "A" Then  ' individual saudi info
         'If frmIndividualSaudiAcctInfo.checkSaudiIndividualAddressChange = True Then
         If recvSaudiIndividualMsg.newOrUpdate = "U" Then
            frmCardAddress.Show
            If frmIndividualSaudi.optPoBox = True Then
               frmCardAddress.tag = "0"
               frmCardAddress.poBoxEnableControls
               frmCardAddress.txtDeliveryAddr1 = frmIndividualSaudi.txtAddress1
               frmCardAddress.txtDeliveryPOBox = frmIndividualSaudi.txtPOBox
               frmCardAddress.txtDeliveryZipcode = frmIndividualSaudi.txtPinCode
            Else
               frmCardAddress.tag = "1"
               frmCardAddress.GPSEnableControls
               frmCardAddress.txtGPSNo = frmIndividualSaudi.txtSaudiPostGPSNo
               frmCardAddress.txtGPSStreetName = frmIndividualSaudi.txtSaudiPostStreetName
               frmCardAddress.txtGPSUnit = frmIndividualSaudi.txtSaudiPostUnit
               frmCardAddress.txtGPSZipCode = frmIndividualSaudi.txtSaudiPostZipCode
               frmCardAddress.txtGPSAdditionalNo = frmIndividualSaudi.txtSaudiPostAdditionalNo
            End If
            frmCardAddress.txtDeliveryAddr2 = "(*)" & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                                              IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                                              "BR.CODE:" & Mid$(frmIndividualSaudi.cmbBranchCode, 2, 3)
            frmCardAddress.cmbDeliveryCity = individualSaudiInfo.cityName
         Else
            individualSaudiInfo.updateCardAddressReqd = "0"
            frmIndividualSaudiAcctInfo.createSaudiCustomer
         End If
      ElseIf screenSetNo = "2" Then  ' individual others info
         'If frmIndividualOthersAcctInfo.checkOtherIndividualAddressChange = True Then
         If recvOtherIndividualMsg.newOrUpdate = "U" Then
            frmCardAddress.Show
            If frmIndividualOthers.optPoBox = True Then
               frmCardAddress.tag = "0"
               frmCardAddress.poBoxEnableControls
               frmCardAddress.txtDeliveryAddr1 = frmIndividualOthers.txtAddress1
               frmCardAddress.txtDeliveryPOBox = frmIndividualOthers.txtPOBox
               frmCardAddress.txtDeliveryZipcode = frmIndividualOthers.txtPinCode
            Else
               frmCardAddress.tag = "1"
               frmCardAddress.GPSEnableControls
               frmCardAddress.txtGPSNo = frmIndividualOthers.txtSaudiPostGPSNo
               frmCardAddress.txtGPSStreetName = frmIndividualOthers.txtSaudiPostStreetName
               frmCardAddress.txtGPSUnit = frmIndividualOthers.txtSaudiPostUnit
               frmCardAddress.txtGPSZipCode = frmIndividualOthers.txtSaudiPostZipCode
               frmCardAddress.txtGPSAdditionalNo = frmIndividualOthers.txtSaudiPostAdditionalNo
            End If
            frmCardAddress.txtDeliveryAddr2 = "(*)" & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                                              IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                                              "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
            
            frmCardAddress.cmbDeliveryCity = individualOthersInfo.cityName
         Else
            individualOthersInfo.updateCardAddressReqd = "0"
            frmIndividualOthersAcctInfo.createOtherIndividualCustomer
         End If
      'ElseIf frmCustomer2.checkAddressChange = True Then
      ElseIf recvSuperActionMsg.newOrUpdate = "U" Then
         frmCardAddress.Show
         frmCardAddress.txtDeliveryAddr1 = custInfo.address1
         frmCardAddress.txtDeliveryAddr2 = "(*)" & IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") & _
                                           IIf(Mid$(frmCustomer.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                                           "BR.CODE:" & Mid$(frmCustomer.cmbBranchCode, 2, 3)
         frmCardAddress.txtDeliveryPOBox = custInfo.poBox
         frmCardAddress.cmbDeliveryCity = custInfo.cityName
         frmCardAddress.txtDeliveryZipcode = custInfo.zipCode
       Else
         custInfo.updateCardAddressReqd = "0"
         frmCustomer2.createCustomer
       End If
    Else
       If screenSetNo = "2" Then
          individualOthersInfo.updateCardAddressReqd = "0"
          frmIndividualOthersAcctInfo.createOtherIndividualCustomer
       ElseIf screenSetNo = "1" Or screenSetNo = "A" Then
          individualSaudiInfo.updateCardAddressReqd = "0"
          frmIndividualSaudiAcctInfo.createSaudiCustomer
       Else
          custInfo.updateCardAddressReqd = "0"
          frmCustomer2.createCustomer
       End If
    End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    If UserLang = ARABIC Then
       ChangePositions frmJointAccName, 9885
       frmJointAccName.RightToLeft = True
    End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtJointAccNameOnCheck_KeyPress(KeyAscii As Integer)
   Dim customerLang As String
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudi.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthers.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   Else
      If frmCustomer.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   End If
      
   If customerLang = "0" Then
      txtJointAccNameOnCheck.Alignment = 1
      If ((KeyAscii > 64 And KeyAscii < 91) Or _
         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errNoEnglishCharacters(UserLang))
          Exit Sub
      End If
      If KeyAscii = 220 Then
         MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
         KeyAscii = 0
         Exit Sub
      End If
   Else
      txtJointAccNameOnCheck.Alignment = 0
      If KeyAscii > 128 Then
         KeyAscii = 0
         MsgBox (errNoArabicCharacters(UserLang))
         Exit Sub
      End If
    End If
End Sub

Private Sub txtJointAccNameOnCheck_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtJointAccNameOnCheck1_KeyPress(KeyAscii As Integer)
   Dim customerLang As String
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudi.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthers.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   Else
      If frmCustomer.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   End If
      
   If customerLang = "0" Then
      txtJointAccNameOnCheck1.Alignment = 1
      If ((KeyAscii > 64 And KeyAscii < 91) Or _
         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errNoEnglishCharacters(UserLang))
          Exit Sub
      End If
      If KeyAscii = 220 Then
         MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
         KeyAscii = 0
         Exit Sub
      End If
   Else
      txtJointAccNameOnCheck1.Alignment = 0
      If KeyAscii > 128 Then
         KeyAscii = 0
         MsgBox (errNoArabicCharacters(UserLang))
         Exit Sub
      End If
   End If
End Sub


Private Sub txtJointAccNameOnCheck1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtJointAccNameOnReports_KeyPress(KeyAscii As Integer)
   Dim customerLang As String
   If screenSetNo = "1" Or screenSetNo = "A" Then
      If frmIndividualSaudi.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   ElseIf screenSetNo = "2" Then
      If frmIndividualOthers.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   Else
      If frmCustomer.optLangArabic.Value = True Then
         customerLang = "0"
      Else
         customerLang = "1"
      End If
   End If
      
   If customerLang = "0" Then
      txtJointAccNameOnReports.Alignment = 1
      If ((KeyAscii > 64 And KeyAscii < 91) Or _
         (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
          KeyAscii = 0
          MsgBox (errNoEnglishCharacters(UserLang))
          Exit Sub
      End If
      If KeyAscii = 220 Then
         MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
         KeyAscii = 0
         Exit Sub
      End If
   Else
      txtJointAccNameOnReports.Alignment = 0
      If KeyAscii > 128 Then
         KeyAscii = 0
         MsgBox (errNoArabicCharacters(UserLang))
         Exit Sub
      End If
   End If
End Sub

Private Sub txtJointAccNameOnReports_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
