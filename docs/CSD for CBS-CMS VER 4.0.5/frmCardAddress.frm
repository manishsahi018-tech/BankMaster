VERSION 5.00
Begin VB.Form frmCardAddress 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card Address Confirmation"
   ClientHeight    =   4185
   ClientLeft      =   90
   ClientTop       =   2745
   ClientWidth     =   11880
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4185
   ScaleWidth      =   11880
   Begin VB.TextBox txtGPSAdditionalNo 
      Height          =   285
      Left            =   9120
      MaxLength       =   4
      TabIndex        =   17
      Top             =   1440
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox txtGPSNo 
      Height          =   285
      Left            =   2160
      MaxLength       =   5
      TabIndex        =   16
      Top             =   840
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox txtGPSZipCode 
      Height          =   285
      Left            =   7920
      MaxLength       =   5
      TabIndex        =   15
      Top             =   1440
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox txtGPSUnit 
      Height          =   285
      Left            =   2160
      MaxLength       =   5
      TabIndex        =   14
      Top             =   1440
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.TextBox txtGPSStreetName 
      Height          =   285
      Left            =   3480
      MaxLength       =   24
      TabIndex        =   13
      Top             =   840
      Visible         =   0   'False
      Width           =   3255
   End
   Begin VB.CommandButton cmdNo 
      Caption         =   "No"
      Height          =   375
      Left            =   3720
      TabIndex        =   12
      ToolTipText     =   "No"
      Top             =   2880
      Width           =   1335
   End
   Begin VB.CommandButton cmdYes 
      Caption         =   "Yes"
      Height          =   375
      Left            =   2400
      TabIndex        =   11
      ToolTipText     =   "Yes"
      Top             =   2880
      Width           =   1335
   End
   Begin VB.TextBox txtDeliveryAddr2 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   7920
      MaxLength       =   30
      TabIndex        =   4
      Tag             =   "11655"
      Top             =   840
      Width           =   3495
   End
   Begin VB.TextBox txtDeliveryZipcode 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   8160
      TabIndex        =   3
      Tag             =   "11655"
      Top             =   1440
      Width           =   1095
   End
   Begin VB.ComboBox cmbDeliveryCity 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5280
      TabIndex        =   2
      Tag             =   "11655"
      Text            =   "Riyadh"
      Top             =   1440
      Width           =   1575
   End
   Begin VB.TextBox txtDeliveryPOBox 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   2160
      TabIndex        =   1
      Tag             =   "11655"
      Top             =   1440
      Width           =   1455
   End
   Begin VB.TextBox txtDeliveryAddr1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   2160
      MaxLength       =   30
      TabIndex        =   0
      Tag             =   "11655"
      Top             =   840
      Width           =   3375
   End
   Begin VB.Label lblGPSZipCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Zip code"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   6960
      TabIndex        =   21
      Top             =   1440
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label lblGPSUnit 
      BackColor       =   &H00BFD87E&
      Caption         =   "Unit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   120
      TabIndex        =   20
      Top             =   1440
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label lblGPSAddress1 
      BackColor       =   &H00BFD87E&
      Caption         =   "GPS #-Street/Area Name"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   0
      TabIndex        =   19
      Top             =   840
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.Label lblGPSAdditionalNo 
      Appearance      =   0  'Flat
      BackColor       =   &H00BFD87E&
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00400000&
      Height          =   255
      Left            =   8880
      TabIndex        =   18
      Top             =   1395
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Label lblConfirmUpdate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Do you want this address to be updated in all cards"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   480
      TabIndex        =   10
      Tag             =   "11655"
      Top             =   2160
      Width           =   6615
   End
   Begin VB.Label lblDeliveryAddress2 
      BackColor       =   &H00BFD87E&
      Caption         =   "Address2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   6960
      TabIndex        =   9
      Tag             =   "11655"
      Top             =   840
      Width           =   1455
   End
   Begin VB.Label lblDeliveryZipCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Zip code"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   6960
      TabIndex        =   8
      Tag             =   "11655"
      Top             =   1440
      Width           =   1335
   End
   Begin VB.Label lblDeliveryCity 
      BackColor       =   &H00BFD87E&
      Caption         =   "City"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   4320
      TabIndex        =   7
      Tag             =   "11655"
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Label lblDeliveryPOBox 
      BackColor       =   &H00BFD87E&
      Caption         =   "PO Box"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Tag             =   "11655"
      Top             =   1440
      Width           =   1335
   End
   Begin VB.Label lblDeliveryAddress1 
      BackColor       =   &H00BFD87E&
      Caption         =   "Delivery Address1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Tag             =   "11655"
      Top             =   840
      Width           =   1935
   End
End
Attribute VB_Name = "frmCardAddress"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdNo_Click()
   Me.Hide
   If screenSetNo = "1" Or screenSetNo = "A" Then
      individualSaudiInfo.updateCardAddressReqd = "0"
      frmIndividualSaudiAcctInfo.createSaudiCustomer
   ElseIf screenSetNo = "2" Then
      individualOthersInfo.updateCardAddressReqd = "0"
      frmIndividualOthersAcctInfo.createOtherIndividualCustomer
   Else
      custInfo.updateCardAddressReqd = "0"
      frmCustomer2.createCustomer
   End If
End Sub

Private Sub cmdYes_Click()
    
    If frmCardAddress.tag = "1" Then ' GPS address
       If Len(RTrim(txtGPSNo)) = 0 Or _
          Len(RTrim(txtGPSStreetName)) = 0 Or _
          Len(RTrim(txtGPSUnit)) = 0 Or _
          Len(RTrim(cmbDeliveryCity)) = 0 Or _
          Len(RTrim(txtGPSZipCode)) = 0 Or _
          Len(RTrim(txtGPSAdditionalNo)) = 0 Then
          
          MsgBox errSpaceDeliveryGPSAddress(UserLang)
          txtGPSNo.SetFocus
          Exit Sub
       End If
    Else ' POBOX address
       If Len(RTrim(txtDeliveryAddr1)) = 0 Or _
          Len(RTrim(txtDeliveryPOBox)) = 0 Or _
          Len(RTrim(txtDeliveryZipcode)) = 0 Or _
          Len(RTrim(cmbDeliveryCity.text)) = 0 Then
       
          MsgBox errSpaceDeliveryAddress(UserLang)
          txtDeliveryAddr1.SetFocus
          Exit Sub
       End If
     End If
    
'    If arabicCharFound(txtDeliveryAddr1) Or _
'       arabicCharFound(cmbDeliveryCity) Then
'       MsgBox errNoArabicAddress(UserLang)
'       Exit Sub
'    End If
    If screenSetNo = "1" Or screenSetNo = "A" Then
       individualSaudiInfo.updateCardAddressReqd = "1"
       individualSaudiInfo.deliveryAddress2 = "(*)" & IIf(frmIndividualSaudi.optVipYes.Value = True, "(V)", "   ") & _
                                   IIf(Mid$(frmIndividualSaudi.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                                   "BR.CODE:" & Mid$(frmIndividualSaudi.cmbBranchCode, 2, 3)
       individualSaudiInfo.deliveryCity = cmbDeliveryCity
       If frmCardAddress.tag = "1" Then
          'individualSaudiInfo.deliveryAddress1 = Format(txtGPSNo, "!@@@@@") & "-" & txtGPSStreetName
          individualSaudiInfo.deliveryAddress1 = Format(txtGPSNo, "!@@@@@") & " " & txtGPSStreetName
          individualSaudiInfo.deliveryPoBox = txtGPSUnit
          individualSaudiInfo.deliveryZip = Format(txtGPSZipCode, "!@@@@@") & "-" & txtGPSAdditionalNo
       Else
          individualSaudiInfo.deliveryAddress1 = txtDeliveryAddr1
          individualSaudiInfo.deliveryPoBox = txtDeliveryPOBox
          individualSaudiInfo.deliveryZip = txtDeliveryZipcode
       End If
       Me.Hide
       frmIndividualSaudiAcctInfo.createSaudiCustomer
    ElseIf screenSetNo = "2" Then
       individualOthersInfo.updateCardAddressReqd = "1"
       individualOthersInfo.deliveryAddress2 = "(*)" & IIf(frmIndividualOthers.optVipYes.Value = True, "(V)", "   ") & _
                                   IIf(Mid$(frmIndividualOthers.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                                   "BR.CODE:" & Mid$(frmIndividualOthers.cmbBranchCode, 2, 3)
       individualOthersInfo.deliveryCity = cmbDeliveryCity
       If frmCardAddress.tag = "1" Then
          'individualOthersInfo.deliveryAddress1 = Format(txtGPSNo, "!@@@@@") & "-" & txtGPSStreetName
          individualOthersInfo.deliveryAddress1 = Format(txtGPSNo, "!@@@@@") & " " & txtGPSStreetName
          individualOthersInfo.deliveryPoBox = txtGPSUnit
          individualOthersInfo.deliveryZip = Format(txtGPSZipCode, "!@@@@@") & "-" & txtGPSAdditionalNo
       Else
          individualOthersInfo.deliveryAddress1 = txtDeliveryAddr1
          individualOthersInfo.deliveryPoBox = txtDeliveryPOBox
          individualOthersInfo.deliveryZip = txtDeliveryZipcode
       End If
       Me.Hide
       frmIndividualOthersAcctInfo.createOtherIndividualCustomer
    Else
       custInfo.updateCardAddressReqd = "1"
       custInfo.deliveryAddress1 = txtDeliveryAddr1
       custInfo.deliveryAddress2 = "(*)" & IIf(frmCustomer.optVipYes.Value = True, "(V)", "   ") & _
                                   IIf(Mid$(frmCustomer.cmbBusinessType.text, 1, 3) = "029", "(R)", "   ") & _
                                   "BR.CODE:" & Mid$(frmCustomer.cmbBranchCode, 2, 3)
       custInfo.deliveryPoBox = txtDeliveryPOBox
       custInfo.deliveryCity = cmbDeliveryCity
       custInfo.deliveryZip = txtDeliveryZipcode
       Me.Hide
       frmCustomer2.createCustomer
    End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    
    If UserLang = ARABIC Then
       ChangePositions frmCardAddress, 12000
       frmCardAddress.RightToLeft = True
    End If
    
    mQry = "select * from cityinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbDeliveryCity.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbDeliveryCity.AddItem rs("englishname")
          Else
             cmbDeliveryCity.AddItem rs("englishname")
          End If
          rs.MoveNext
       Loop
    End If

    frmCardAddress.lblDeliveryAddress1.Caption = frmCustomer2Caption(49, UserLang)
    frmCardAddress.lblDeliveryAddress2.Caption = frmCustomer2Caption(50, UserLang)
    frmCardAddress.lblDeliveryPOBox.Caption = frmCustomer2Caption(51, UserLang)
    frmCardAddress.lblDeliveryCity.Caption = frmCustomer2Caption(52, UserLang)
    frmCardAddress.lblDeliveryZipCode.Caption = frmCustomer2Caption(53, UserLang)
    
        lblGPSAddress1.Caption = gpsCardDeliveryAddressCaption(1, UserLang)
    lblGPSUnit.Caption = gpsCardDeliveryAddressCaption(2, UserLang)
    lblGPSZipCode.Caption = gpsCardDeliveryAddressCaption(3, UserLang)
    
    frmCardAddress.Caption = frmCardChangeAddressCaption(0, UserLang)
    frmCardAddress.lblConfirmUpdate.Caption = frmCardChangeAddressCaption(1, UserLang)
    frmCardAddress.cmdYes.Caption = frmCustomerCaption(34, UserLang)
    frmCardAddress.cmdNo.Caption = frmCustomerCaption(35, UserLang)

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
Public Sub poBoxEnableControls()
   lblGPSAddress1.Visible = False
   lblGPSUnit.Visible = False
   lblGPSAdditionalNo.Visible = False
   lblGPSZipCode.Visible = False
   txtGPSNo.Visible = False
   txtGPSStreetName.Visible = False
   txtGPSUnit.Visible = False
   txtGPSZipCode.Visible = False
   txtGPSAdditionalNo.Visible = False
   txtDeliveryAddr1.Visible = True
   txtDeliveryPOBox.Visible = True
   txtDeliveryZipcode.Visible = True
   lblDeliveryAddress1.Visible = True
   lblDeliveryPOBox.Visible = True
   lblDeliveryZipCode.Visible = True
   txtDeliveryAddr1.Refresh
   txtDeliveryPOBox.Refresh
   txtDeliveryZipcode.Refresh
   lblDeliveryZipCode.Refresh
   lblDeliveryAddress1.Refresh
   lblDeliveryPOBox.Refresh

End Sub

Public Sub GPSEnableControls()
   lblGPSAddress1.Visible = True
   lblGPSAddress1.Refresh
   lblGPSUnit.Visible = True
   lblGPSUnit.Refresh
   lblGPSAdditionalNo.Visible = True
   lblGPSAdditionalNo.Refresh
   lblGPSZipCode.Visible = True
   lblGPSZipCode.Refresh
   txtGPSNo.Visible = True
   txtGPSNo.Refresh
   txtGPSStreetName.Visible = True
   txtGPSStreetName.Refresh
   txtGPSUnit.Visible = True
   txtGPSUnit.Refresh
   txtGPSZipCode.Visible = True
   txtGPSZipCode.Refresh
   txtGPSAdditionalNo.Visible = True
   txtGPSAdditionalNo.Refresh
   
   txtDeliveryAddr1.Visible = False
   txtDeliveryPOBox.Visible = False
   txtDeliveryZipcode.Visible = False
   lblDeliveryAddress1.Visible = False
   lblDeliveryPOBox.Visible = False
   lblDeliveryZipCode.Visible = False

End Sub

Private Sub txtDeliveryPOBox_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtDeliveryZipcode_KeyPress(KeyAscii As Integer)
If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtGPSAdditionalNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtGPSNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtGPSUnit_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtGPSZipCode_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
