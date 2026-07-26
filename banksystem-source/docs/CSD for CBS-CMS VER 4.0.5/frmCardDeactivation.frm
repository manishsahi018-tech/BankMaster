VERSION 5.00
Begin VB.Form frmCardDeactivation 
   BackColor       =   &H00BFD87E&
   Caption         =   "Deactivation of Card"
   ClientHeight    =   4770
   ClientLeft      =   2205
   ClientTop       =   2205
   ClientWidth     =   7215
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4770
   ScaleWidth      =   7215
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3960
      TabIndex        =   18
      ToolTipText     =   "Cancel"
      Top             =   4200
      Width           =   1455
   End
   Begin VB.CommandButton cmdDeactivate 
      Caption         =   "Deactivate"
      Height          =   375
      Left            =   2520
      TabIndex        =   17
      ToolTipText     =   "Deactivate"
      Top             =   4200
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Height          =   495
      Left            =   3240
      TabIndex        =   16
      Top             =   3360
      Width           =   3615
      Begin VB.OptionButton optLost 
         Caption         =   "Lost"
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
         Left            =   2400
         TabIndex        =   3
         Tag             =   "3615"
         ToolTipText     =   "Lost"
         Top             =   120
         Value           =   -1  'True
         Width           =   1095
      End
      Begin VB.OptionButton optDamaged 
         Caption         =   "Damaged"
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
         TabIndex        =   1
         Tag             =   "3615"
         ToolTipText     =   "Damaged"
         Top             =   120
         Width           =   1215
      End
      Begin VB.OptionButton optStolen 
         Caption         =   "Stolen"
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
         Left            =   1440
         TabIndex        =   2
         Tag             =   "3615"
         ToolTipText     =   "Stolen"
         Top             =   120
         Width           =   975
      End
   End
   Begin VB.ComboBox cmbExpiryDate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   3240
      TabIndex        =   13
      Text            =   "01"
      Top             =   2760
      Width           =   615
   End
   Begin VB.ComboBox cmbExpiryMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   3840
      TabIndex        =   12
      Text            =   "01"
      Top             =   2760
      Width           =   615
   End
   Begin VB.TextBox txtExpiryYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   4440
      MaxLength       =   4
      TabIndex        =   11
      Top             =   2760
      Width           =   615
   End
   Begin VB.ComboBox cmbIssuedate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   3240
      TabIndex        =   9
      Text            =   "01"
      Top             =   2160
      Width           =   615
   End
   Begin VB.ComboBox cmbIssueMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   3840
      TabIndex        =   8
      Text            =   "01"
      Top             =   2160
      Width           =   615
   End
   Begin VB.TextBox txtIssueYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   4440
      MaxLength       =   4
      TabIndex        =   7
      Top             =   2160
      Width           =   615
   End
   Begin VB.TextBox txtNameOnCard 
      Enabled         =   0   'False
      Height          =   345
      Left            =   3240
      MaxLength       =   26
      TabIndex        =   5
      Top             =   1560
      Width           =   3255
   End
   Begin VB.TextBox txtCardNo 
      Enabled         =   0   'False
      Height          =   345
      Left            =   3240
      TabIndex        =   0
      Top             =   960
      Width           =   3135
   End
   Begin VB.Label lblDeactivation 
      BackColor       =   &H00BFD87E&
      Caption         =   "Deactivation of Card"
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
      Height          =   375
      Left            =   2160
      TabIndex        =   19
      Top             =   240
      Width           =   3735
   End
   Begin VB.Label lblDeactivationType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Deactivation Type"
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
      Left            =   960
      TabIndex        =   15
      Top             =   3480
      Width           =   2055
   End
   Begin VB.Label lblCardExpiryDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Expiry Date"
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
      Left            =   960
      TabIndex        =   14
      Top             =   2760
      Width           =   1935
   End
   Begin VB.Label lblCardIssueDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Issue Date"
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
      Left            =   960
      TabIndex        =   10
      Top             =   2160
      Width           =   1695
   End
   Begin VB.Label lblNameOnCard 
      BackColor       =   &H00BFD87E&
      Caption         =   "Name On the Card"
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
      Left            =   960
      TabIndex        =   6
      Top             =   1560
      Width           =   2055
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
      Left            =   960
      TabIndex        =   4
      Top             =   1080
      Width           =   1815
   End
End
Attribute VB_Name = "frmCardDeactivation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdDeactivate_Click()
    Dim strmsglen As String
    Dim tmpStr As String
    Dim cardType As String
    Dim response
    Dim tUserid, tCardNo As String
    Dim deactivationType As String
    
    If optDamaged.Value = True Then
       deactivationType = "D"
    ElseIf optLost.Value = True Then
       deactivationType = "L"
    Else
       deactivationType = "S"
    End If
   
    'tCardNo = Format(txtCardNo, "!@@@@@@@@@@@@@@@@@@@")
    tCardNo = Format(frmCardDetails.txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    LogData "Message sent for deactivating card no " & txtCardNo & "  for the reason : [" & deactivationType & "]"
    SendMsg = "000268" & "28" & gBranchCode & tUserid & tCardNo & "D" & deactivationType & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmCardDeactivation.MousePointer = vbHourglass
    frmCardDeactivation.cmdDeactivate.Enabled = False
    frmCardDeactivation.cmdCancel.Enabled = False
   
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmCardDeactivation.MousePointer = vbDefault
       frmCardDeactivation.cmdDeactivate.Enabled = True
       frmCardDeactivation.cmdCancel.Enabled = True
       Exit Sub
    End If
    frmCardDeactivation.MousePointer = vbDefault
    frmCardDeactivation.cmdDeactivate.Enabled = True
    frmCardDeactivation.cmdCancel.Enabled = True
    
    If recvCustomerMsg.status = "000" Then
       MsgBox errSuccessful(UserLang)
    Else
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
       frmUnload
       Exit Sub
    End If
    
    tmpStr = errWannaReplacementCard(UserLang)
    
    response = MsgBox(tmpStr, vbYesNo, tmpStr)
    
    If response = vbYes Then
       replacementCardRequest deactivationType
    Else
       frmUnload
    End If

End Sub
Public Sub frmUnload()
    Unload Me
    Unload frmCardDetails
End Sub
Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmCardDeactivation, 7335
       frmCardDeactivation.RightToLeft = True
    End If
    
   'frmCardDeactivation.txtCardNo = frmCardDetails.txtFullCardNo
   frmCardDeactivation.txtCardNo = frmCardDetails.txtCardNo
   frmCardDeactivation.txtNameOnCard = frmCardDetails.txtNameOnCard
   frmCardDeactivation.cmbIssueDate = frmCardDetails.cmbIssueDate
   frmCardDeactivation.cmbIssueMonth = frmCardDetails.cmbIssueMonth
   frmCardDeactivation.txtIssueYear = frmCardDetails.txtIssueYear
   frmCardDeactivation.cmbExpiryDate = frmCardDetails.cmbExpiryDate
   frmCardDeactivation.cmbExpiryMonth = frmCardDetails.cmbExpiryMonth
   frmCardDeactivation.txtExpiryYear = frmCardDetails.txtExpiryYear
   
    frmCardDeactivation.Caption = frmCardDeactivationCaption(0, UserLang)
    frmCardDeactivation.lblDeactivation.Caption = frmCardDeactivationCaption(0, UserLang)
    frmCardDeactivation.lblCardNo.Caption = frmCardDeactivationCaption(1, UserLang)
    frmCardDeactivation.lblNameOnCard.Caption = frmCardDeactivationCaption(2, UserLang)
    frmCardDeactivation.lblCardIssueDate.Caption = frmCardDeactivationCaption(3, UserLang)
    frmCardDeactivation.lblCardExpiryDate.Caption = frmCardDeactivationCaption(4, UserLang)
    frmCardDeactivation.lblDeactivationType.Caption = frmCardDeactivationCaption(5, UserLang)
    frmCardDeactivation.optDamaged.Caption = frmCardDeactivationCaption(6, UserLang)
    frmCardDeactivation.optStolen.Caption = frmCardDeactivationCaption(7, UserLang)
    frmCardDeactivation.optLost.Caption = frmCardDeactivationCaption(8, UserLang)
    frmCardDeactivation.cmdDeactivate.Caption = frmCardDeactivationCaption(9, UserLang)
    frmCardDeactivation.cmdCancel.Caption = frmCardDeactivationCaption(10, UserLang)
    
End Sub

Public Sub replacementCardRequest(deactivationType As String)
    Dim strmsglen As String
    Dim response
    Dim cardType As String
    
    cardType = " "
    If frmCardDetails.optPayroll.Value = True Then
       cardType = "C"
    End If
    If cardType <> "C" Then
       If smartCardEnabled = True Then
          response = MsgBox(errWannaChipCard(UserLang), vbYesNo, errWannaChipCard(UserLang))
          If response = vbYes Then
             cardType = "S"
          Else
             cardType = "I"
          End If
       Else
          cardType = "I"
       End If
    End If

    formatCardInfo cardType
    SendMsg = cardInfo.msgLen & cardInfo.service & cardInfo.homeBranch & _
              cardInfo.userId & cardInfo.branchCode & cardInfo.dateTime & _
              cardInfo.creationOrUpdate & cardInfo.newOrUpdate & cardInfo.supervisorId & _
              cardInfo.custNo & cardInfo.cardNo & cardInfo.cardType & cardInfo.newOrReplacement & _
              cardInfo.primaryOrSupplementary & cardInfo.cardStatus & _
              cardInfo.regionCode & cardInfo.languageCode & cardInfo.customerBranch & _
              cardInfo.nameOnTheCard & cardInfo.subAcc & cardInfo.deliveryToBranchOrPO & _
              cardInfo.address1 & cardInfo.address2 & cardInfo.poBox & _
              cardInfo.cityName & cardInfo.zipCode & cardInfo.firstIssueDate & _
              cardInfo.expiryDate & cardInfo.supervisorComments & deactivationType & _
              cardInfo.idNo & cardInfo.coreAccNo & cardInfo.oldCardNo & cardInfo.oldExpiryDate & _
              Space(50)

    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    
    frmCardDeactivation.MousePointer = vbHourglass
    frmCardDeactivation.cmdDeactivate.Enabled = False
    frmCardDeactivation.cmdCancel.Enabled = False
                 
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmCardDeactivation.MousePointer = vbNormal
       frmCardDeactivation.cmdDeactivate.Enabled = True
       frmCardDeactivation.cmdCancel.Enabled = True
       Exit Sub
       Unload Me
    End If
    
    If recvCardMsg.status = "000" Then
       frmCardDeactivation.MousePointer = vbNormal
       frmCardDeactivation.cmdDeactivate.Enabled = True
       frmCardDeactivation.cmdCancel.Enabled = True
       MsgBox errSuccessful(UserLang)
       If cardInfo.newOrUpdate = "N" And cardInfo.creationOrUpdate = "C" Then
          MsgBox errCardNoAlloted(UserLang) & maskCardNo(recvCardMsg.cardNo)
          frmCardDetails.txtCardNo = maskCardNo(recvCardMsg.cardNo)
          frmCardDetails.txtFullCardNo = recvCardMsg.cardNo
       End If
       cardInfo.dateTime = recvCardMsg.dateTime
    Else
       If UserLang = ENGLISH Then
          MsgBox recvCardMsg.eRemarks
       Else
          MsgBox recvCardMsg.aRemarks
       End If
       frmCardDeactivation.MousePointer = vbNormal
       frmCardDeactivation.cmdDeactivate.Enabled = True
       frmCardDeactivation.cmdCancel.Enabled = True
       frmUnload
       Exit Sub
    End If
    
    If pinSelectAtBranch = True Then
      atmPin = Space(4)
      Unload Me
      frmAcceptPin.tag = "I" ' Initiated from CMS
      If cardInfo.primaryOrSupplementary = "P" Then
         frmAcceptPin.txtCardType = "Primary"
      Else
         frmAcceptPin.txtCardType = "Supplementary"
      End If
      frmAcceptPin.txtNameOnTheCard = cardInfo.nameOnTheCard
      frmAcceptPin.Show vbModal
   Else
      frmUnload
   End If

End Sub

Private Sub formatCardInfo(cardType As String)
    
    gDateTime = Space(14)
       
    cardInfo.msgLen = "000050"
    cardInfo.service = "20"
    cardInfo.homeBranch = gBranchCode
    cardInfo.userId = Format(gUserId, "!@@@@@@@@@@")
    cardInfo.branchCode = gBranchCode
    cardInfo.dateTime = gDateTime
    cardInfo.creationOrUpdate = "C"
    cardInfo.supervisorId = Space(10)
    cardInfo.supervisorComments = Space(200)
    cardInfo.regionCode = Mid$(recvCardSearchMsg.custBranchCode, 2, 1)
    cardInfo.customerBranch = recvCardSearchMsg.custBranchCode
    cardInfo.newOrUpdate = "N"
    cardInfo.custNo = Format(frmCardDetails.txtCustNo, "00000000")
    cardInfo.cardNo = Space(19)
    cardInfo.cardType = cardType
    cardInfo.newOrReplacement = "R"
    If frmCardDetails.optPrimary.Value = True Then
       cardInfo.primaryOrSupplementary = "P"
    Else
       cardInfo.primaryOrSupplementary = "S"
    End If
    cardInfo.cardStatus = "0" ' Requested
    
    If frmCardDetails.optArabic Then
       cardInfo.languageCode = "0"
    ElseIf frmCardDetails.optEnglish Then
       cardInfo.languageCode = "1"
    Else
       cardInfo.languageCode = "2"
    End If
    
    cardInfo.nameOnTheCard = UCase(frmCardDetails.txtNameOnCard)
    cardInfo.subAcc = frmCardDetails.txtSubAcc
    If frmCardDetails.optBranch.Value = True Then
       cardInfo.deliveryToBranchOrPO = "C"
    ElseIf frmCardDetails.optReqBranch.Value = True Then
       cardInfo.deliveryToBranchOrPO = "R"
    ElseIf frmCardDetails.optGPS.Value = True Then
       cardInfo.deliveryToBranchOrPO = "G"
    Else
       cardInfo.deliveryToBranchOrPO = "P"
    End If
    cardInfo.address2 = frmCardDetails.txtDeliveryAddr2
    cardInfo.cityName = frmCardDetails.cmbDeliveryCity
    If cardInfo.deliveryToBranchOrPO <> "G" Then
       cardInfo.address1 = frmCardDetails.txtDeliveryAddr1
       cardInfo.poBox = Format(frmCardDetails.txtDeliveryPOBox, "!@@@@@@@@@@")
       cardInfo.zipCode = Format(frmCardDetails.txtDeliveryZipcode, "!@@@@@@@@@@")
    Else ' GPS address is selected
       cardInfo.address1 = Format(frmCardDetails.txtGPSNo, "!@@@@@") & "-" & frmCardDetails.txtGPSStreetName
       cardInfo.poBox = Format(frmCardDetails.txtGPSUnit, "!@@@@@@@@@@")
       cardInfo.zipCode = Format(frmCardDetails.txtGPSZipCode, "!@@@@@") & "-" & frmCardDetails.txtGPSAdditionalNo
    End If
    cardInfo.firstIssueDate = Format(frmCardDetails.txtIssueYear, "!@@@@") & frmCardDetails.cmbIssueMonth & frmCardDetails.cmbIssueDate
    cardInfo.expiryDate = Format(frmCardDetails.txtExpiryYear, "!@@@@") & frmCardDetails.cmbExpiryMonth & frmCardDetails.cmbExpiryDate
    If cardType = "C" Then
       cardInfo.idNo = Mid$(frmCardDetails.txtFullCardNo, 7, 10)
    Else
       cardInfo.idNo = Space(10)
    End If
    cardInfo.coreAccNo = Format(frmCardDetails.txtCurrency, "!@@") & Format(Mid$(frmCardDetails.cmbLedger, 1, 2), "!@@") & _
                       Format(frmCardDetails.txtCustomerNo, "!@@@@@@@@") & Format(frmCardDetails.txtSubAcc, "!@@@@")
    cardInfo.oldCardNo = Space(19)
    cardInfo.oldExpiryDate = Space(4)
    cardInfo.oldCardNo = Format(frmCardDetails.txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
    cardInfo.oldExpiryDate = Format(Mid$(frmCardDetails.txtExpiryYear, 3, 2), "!@@") & frmCardDetails.cmbExpiryMonth
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtCardNo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtNameOnCard_KeyDown(KeyCode As Integer, Shift As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
