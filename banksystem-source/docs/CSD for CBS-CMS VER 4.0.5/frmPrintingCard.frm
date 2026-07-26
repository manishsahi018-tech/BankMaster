VERSION 5.00
Begin VB.Form frmPrintingCard 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card Production Approval"
   ClientHeight    =   5325
   ClientLeft      =   1815
   ClientTop       =   1530
   ClientWidth     =   9945
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5325
   ScaleWidth      =   9945
   Begin VB.Frame framePinApproval 
      Height          =   495
      Left            =   5400
      TabIndex        =   13
      Top             =   3720
      Width           =   1575
      Begin VB.OptionButton optPinSelectNo 
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   15
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
      Begin VB.OptionButton optPinSelectYes 
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   14
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
   End
   Begin VB.Frame frameCardApproval 
      Height          =   495
      Left            =   2280
      TabIndex        =   10
      Top             =   3840
      Width           =   1575
      Begin VB.OptionButton optCardPrdnYes 
         Caption         =   "Yes"
         Height          =   315
         Left            =   120
         TabIndex        =   12
         Tag             =   "1575"
         ToolTipText     =   "Yes"
         Top             =   120
         Width           =   615
      End
      Begin VB.OptionButton optCardPrdnNo 
         Caption         =   "No"
         Height          =   255
         Left            =   840
         TabIndex        =   11
         Tag             =   "1575"
         ToolTipText     =   "No"
         Top             =   120
         Value           =   -1  'True
         Width           =   615
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4800
      TabIndex        =   8
      ToolTipText     =   "Cancel"
      Top             =   4440
      Width           =   1935
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   3225
      TabIndex        =   7
      ToolTipText     =   "Ok"
      Top             =   4440
      Width           =   1575
   End
   Begin VB.TextBox txtCardType 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   3360
      TabIndex        =   4
      Top             =   2280
      Width           =   1575
   End
   Begin VB.TextBox txtNameOnCard 
      Enabled         =   0   'False
      Height          =   345
      Left            =   3360
      MaxLength       =   26
      TabIndex        =   2
      Top             =   1680
      Width           =   3255
   End
   Begin VB.TextBox txtCardNo 
      Enabled         =   0   'False
      Height          =   345
      Left            =   3360
      TabIndex        =   0
      Top             =   1080
      Width           =   2535
   End
   Begin VB.Label lblPin 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pin"
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
      Left            =   3960
      TabIndex        =   16
      Top             =   3840
      Width           =   1335
   End
   Begin VB.Label lblCard 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card"
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
      TabIndex        =   9
      Top             =   3840
      Width           =   735
   End
   Begin VB.Label lblConfirmMsg 
      BackColor       =   &H00BFD87E&
      Caption         =   "Would you like to approve ?"
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
      Height          =   375
      Left            =   2400
      TabIndex        =   6
      Top             =   3120
      Width           =   3975
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
      Left            =   1560
      TabIndex        =   5
      Top             =   2280
      Width           =   1575
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
      Left            =   1080
      TabIndex        =   3
      Top             =   1680
      Width           =   2175
   End
   Begin VB.Label lblCardNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card No"
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
      Left            =   1800
      TabIndex        =   1
      Top             =   1080
      Width           =   1455
   End
End
Attribute VB_Name = "frmPrintingCard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    If frmPrintingCard.tag <> "P" And frmPrintingCard.tag <> "S" Then
       Unload Me
       frmCardDetails.unloadCardForms
    Else
       If frmPrintingCard.tag = "P" Then
          If Len(RTrim(recvSuperDecisionMsg.suppCard.cardNo)) > 0 Then
             If recvSuperDecisionMsg.suppCard.branchPinSelect = "Y" Then
                txtCardNo = recvSuperDecisionMsg.suppCard.cardNo
                txtCardType = "Supplementary"
                txtNameOnCard = recvSuperDecisionMsg.suppCard.nameOnTheCard
                frmPrintingCard.tag = "S"
                If cardProductionAtBranch = True Then
                   frmPrintingCard.frameCardApproval.Enabled = True
                   frmPrintingCard.optCardPrdnYes.Value = True
                Else
                   frmPrintingCard.frameCardApproval.Enabled = False
                   frmPrintingCard.optCardPrdnNo.Value = True
                End If
                If pinSelectAtBranch = True Then
                   frmPrintingCard.framePinApproval.Enabled = True
                   frmPrintingCard.optPinSelectYes.Value = True
                Else
                   frmPrintingCard.framePinApproval.Enabled = False
                   frmPrintingCard.optCardPrdnNo.Value = True
                End If
                frmPrintingCard.cmdOk.SetFocus
             Else
                unloadForms
             End If
          Else
             unloadForms
          End If
        Else
           unloadForms
        End If
    End If
End Sub

Private Sub cmdOk_Click()
   Dim printStatus As Integer
   printStatus = 0
      
   If frmPrintingCard.tag <> "P" And frmPrintingCard.tag <> "S" Then
      If optCardPrdnYes = True Then
         If recvCardPendingDetail.requestType = "0" Or recvCardPendingDetail.requestType = "2" Then
            If optCardPrdnYes = True Then
               cmdOk.Enabled = False
               cmdCancel.Enabled = False
               printCard recvCardApprovalMsg.track1, recvCardApprovalMsg.track2, _
                         recvCardApprovalMsg.cardNo, recvCardApprovalMsg.nameOnTheCard, _
                         recvCardApprovalMsg.custBranchCode, recvCardApprovalMsg.cardExpiryDate, printStatus
                cmdOk.Enabled = True
                cmdCancel.Enabled = True
                If printStatus = 1 Then
                   response = MsgBox(errCardPrintedOk(UserLang), vbYesNo, "Card print confirmation")
                   If response = vbNo Then
                      updateConfirmation "9"
                   Else
                      If optPinSelectYes = True Then
                         updateConfirmation recvCardPendingDetail.requestType
                      Else
                         updateConfirmation "2"
                      End If
                   End If
                End If
            End If
         ElseIf optPinSelectYes Then
            updateConfirmation recvCardPendingDetail.requestType
         Else
            Unload Me
            frmCardDetails.unloadCardForms
         End If
     ElseIf optPinSelectYes Then
         updateConfirmation "3"
     Else
         Unload Me
         frmCardDetails.unloadCardForms
     End If
 Else
     If optCardPrdnYes = True Then
        cmdOk.Enabled = False
        cmdCancel.Enabled = False
        If frmPrintingCard.tag = "P" Then
           printCard recvSuperDecisionMsg.primaryCard.trk1, recvSuperDecisionMsg.primaryCard.trk2, _
                     recvSuperDecisionMsg.primaryCard.cardNo, recvSuperDecisionMsg.primaryCard.nameOnTheCard, _
                     recvSuperDecisionMsg.primaryCard.custBranchCode, recvSuperDecisionMsg.primaryCard.cardExpiryDate, printStatus
        Else
           printCard recvSuperDecisionMsg.suppCard.trk1, recvSuperDecisionMsg.suppCard.trk2, _
                     recvSuperDecisionMsg.suppCard.cardNo, recvSuperDecisionMsg.suppCard.nameOnTheCard, _
                     recvSuperDecisionMsg.suppCard.custBranchCode, recvSuperDecisionMsg.suppCard.cardExpiryDate, printStatus
        End If
        cmdOk.Enabled = True
        cmdCancel.Enabled = True
        If printStatus = 1 Then
           response = MsgBox(errCardPrintedOk(UserLang), vbYesNo, "Card print confirmation")
           If response = vbNo Then
              updateConfirmation "9"
           Else
              If optPinSelectYes = True Then
                 updateConfirmation "0"
              Else
                 updateConfirmation "2"
              End If
           End If
        End If
     ElseIf optPinSelectYes = True Then
        updateConfirmation "3"
     Else
        If frmPrintingCard.tag = "P" Then
           If Len(RTrim(recvSuperDecisionMsg.suppCard.cardNo)) > 0 Then
              If recvSuperDecisionMsg.suppCard.branchPinSelect = "Y" Then
                 txtCardNo = recvSuperDecisionMsg.suppCard.cardNo
                 txtCardType = "Supplementary"
                 txtNameOnCard = recvSuperDecisionMsg.suppCard.nameOnTheCard
                 frmPrintingCard.tag = "S"
                 If cardProductionAtBranch = True Then
                    frmPrintingCard.frameCardApproval.Enabled = True
                    frmPrintingCard.optCardPrdnYes.Value = True
                 Else
                    frmPrintingCard.frameCardApproval.Enabled = False
                    frmPrintingCard.optCardPrdnNo.Value = True
                 End If
                 If pinSelectAtBranch = True Then
                    frmPrintingCard.framePinApproval.Enabled = True
                    frmPrintingCard.optPinSelectYes.Value = True
                 Else
                    frmPrintingCard.framePinApproval.Enabled = False
                    frmPrintingCard.optCardPrdnNo.Value = True
                 End If
                 frmPrintingCard.cmdOk.SetFocus
              Else
                 unloadForms
              End If
           Else
              unloadForms
           End If
        Else
           unloadForms
        End If
     End If
 End If
 
End Sub

Public Sub updateConfirmation(requestType As String)
   Dim tCardNo As String
   Dim tUserid As String
   
   tUserid = Format(gUserId, "!@@@@@@@@@@")
   
   'tCardNo = Format(frmPrintingCard.txtCardNo, "!@@@@@@@@@@@@@@@@@@@")
   tCardNo = Format(frmCardDetails.txtFullCardNo, "!@@@@@@@@@@@@@@@@@@@")
   
   SendMsg = "000000" & "59" & gBranchCode & tUserid & _
             tCardNo & requestType & Space(50)

   frmPrintingCard.MousePointer = vbHourglass
   frmPrintingCard.cmdOk.Enabled = False
   frmPrintingCard.cmdCancel.Enabled = False
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
              
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
     
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmPrintingCard.MousePointer = vbNormal
      frmPrintingCard.cmdOk.Enabled = True
      frmPrintingCard.cmdCancel.Enabled = True
      Exit Sub
   End If
   
   frmPrintingCard.MousePointer = vbNormal
   frmPrintingCard.cmdOk.Enabled = True
   frmPrintingCard.cmdCancel.Enabled = True
    
   parsePrintCardMsg
   frmPrintingCard.cmdCancel.Enabled = True
   frmPrintingCard.cmdOk.Enabled = True
    
   If recvPrintCardMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvPrintCardMsg.aRemarks
      Else
         MsgBox recvPrintCardMsg.eRemarks
      End If
   Else
      MsgBox errSuccessful(UserLang)
   End If
   If frmPrintingCard.tag <> "P" And frmPrintingCard.tag <> "S" Then
      Unload Me
      frmCardDetails.unloadCardForms
   Else
      If frmPrintingCard.tag = "P" Then
         If Len(RTrim(recvSuperDecisionMsg.suppCard.cardNo)) > 0 Then
            If recvSuperDecisionMsg.suppCard.branchPinSelect = "Y" Then
               txtCardNo = recvSuperDecisionMsg.suppCard.cardNo
               txtCardType = "Supplementary"
               txtNameOnCard = recvSuperDecisionMsg.suppCard.nameOnTheCard
               frmPrintingCard.tag = "S"
'               If cardProductionAtBranch = True Then
'                  frmPrintingCard.frameCardApproval.Enabled = True
'                  frmPrintingCard.optCardPrdnYes.Value = True
'               Else
'                  frmPrintingCard.frameCardApproval.Enabled = False
'                  frmPrintingCard.optCardPrdnNo.Value = True
'               End If
               If pinSelectAtBranch = True Then
                  frmPrintingCard.framePinApproval.Enabled = True
                  frmPrintingCard.optPinSelectYes.Value = True
               Else
                  frmPrintingCard.framePinApproval.Enabled = False
                  frmPrintingCard.optCardPrdnNo.Value = True
               End If
               frmPrintingCard.cmdOk.SetFocus
            Else
               unloadForms
            End If
         Else
            unloadForms
         End If
      Else
         unloadForms
      End If
   End If

End Sub

Public Sub parsePrintCardMsg()
   recvPrintCardMsg.status = Mid$(RecvStr, 1, 3)
   recvPrintCardMsg.service = Mid$(RecvStr, 4, 2)
   recvPrintCardMsg.aRemarks = Mid$(RecvStr, 6, 50)
   recvPrintCardMsg.eRemarks = Mid$(RecvStr, 56, 50)
   recvPrintCardMsg.cardNo = Mid$(RecvStr, 106, 19)
   recvPrintCardMsg.nameOnTheCard = Mid$(RecvStr, 125, 26)
   recvPrintCardMsg.cardExpiryDate = Mid$(RecvStr, 151, 6)
   recvPrintCardMsg.custBranchCode = Mid$(RecvStr, 157, 4)
   recvPrintCardMsg.pinOffSet = Mid$(RecvStr, 161, 4)
   recvPrintCardMsg.track1 = Mid$(RecvStr, 165, 75)
   recvPrintCardMsg.track2 = Mid$(RecvStr, 240, 37)
End Sub

Public Sub printCard(track1 As String, track2 As String, cardNo As String, nameOnTheCard As String, branchCode As String, cardExpiryDate As String, printStatus As Integer)
  Dim currentPrinter As Printer, PRNTR As Printer
  Dim tmpPrinter As String
  Dim cardPrinterDefaulted As Boolean
  
  cardPrinterDefaulted = False
  If Len(Trim(cardPrinterName)) = 0 Or cardPrinterName = "" Then
     cardPrinterName = "Smart Driver"
  End If
  If Printer.DeviceName <> cardPrinterName Then
     tmpPrinter = Printer.DeviceName
     For Each PRNTR In Printers
         If PRNTR.DeviceName = cardPrinterName Then
            Set Printer = PRNTR
            cardPrinterDefaulted = True
            Exit For
         End If
     Next
  
     If cardPrinterDefaulted = False Then
        MsgBox errCardPrinterNotFound(UserLang)
        Exit Sub
     End If
  End If
    
  Printer.Orientation = vbPRORLandscape
  If InStr(cardPrinterName, "Matica") > 0 Then
     Printer.Print "|1" & "B" & track1 & "|"
     Printer.Print "|2" & track2 & "|"
  Else
     Printer.FontName = "Track 1 - Magnetic stripe"
     Printer.Print "B" & track1
     Printer.FontName = "Track 2 - Magnetic stripe"
     Printer.Print track2
  End If
  
 '  The following command should be used for printing the card in MATICA printer
'  Printer.Print "|1" & "B" & track1 & "|"
'  Printer.Print "|2" & track2 & "|"
  
  Printer.Font = "Arial"
  Printer.FontBold = False
  Printer.Print
  Printer.Print
  Printer.Print
  Printer.Print
  Printer.Print
  Printer.FontSize = 7
  Printer.Print "           "
  Printer.FontSize = 17
  Printer.RightToLeft = False
  If Len(Trim(cardNo)) >= 19 Then
     Printer.Print "     " & Mid$(cardNo, 1, 7) & "  " & _
                             Mid$(cardNo, 8, 8) & "  " & _
                             Mid$(cardNo, 16, 4)
     Printer.Print "     "
     Printer.FontSize = 12
     Printer.FontBold = False
     Printer.Print "             " & Mid$(cardExpiryDate, 5, 2) & " / " & _
                                     Mid$(cardExpiryDate, 3, 2) & _
                 "                            " & Mid$(branchCode, 2, 3)
  Else
     Printer.Print "    " + Mid$(cardNo, 1, 4) & "  " & _
                            Mid$(cardNo, 5, 4) & "  " & _
                            Mid$(cardNo, 9, 4) & "  " & _
                            Mid$(cardNo, 13, 4)
     Printer.FontSize = 7
     Printer.Print "           "
     Printer.FontSize = 12
     Printer.FontBold = False
     Printer.Print "                                 " & Mid$(cardExpiryDate, 5, 2) & " / " & _
                                                             Mid$(cardExpiryDate, 3, 2)
     Printer.Print "                                            " & Mid$(branchCode, 2, 3)

  End If

  Printer.FontBold = True
  Printer.FontSize = 9
  Printer.Print "       " & nameOnTheCard
  
'  Printer.NewPage
'  Printer.Print
'  Printer.Print
'  Printer.Print
'  Printer.Print
'  Printer.Print
'  Printer.Print " CVV2                       " & "233"
  
  Printer.EndDoc
  printStatus = 1
    
  If InStr(cardPrinterName, "Matica") > 0 Then
     delay (5)
  Else
     delay (10)
  End If
  If cardPrinterDefaulted = True Then
     For Each PRNTR In Printers
        If PRNTR.DeviceName = tmpPrinter Then
           Set Printer = PRNTR
           Exit For
        End If
     Next
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmPrintingCard, 10065
       frmPrintingCard.RightToLeft = True
    End If
    
    frmPrintingCard.Caption = frmPrintingCardCaption(0, UserLang)
    frmPrintingCard.lblCardNo.Caption = frmPrintingCardCaption(1, UserLang)
    frmPrintingCard.lblNameOnCard.Caption = frmPrintingCardCaption(2, UserLang)
    frmPrintingCard.lblCardType.Caption = frmPrintingCardCaption(3, UserLang)
    If UserLang = ARABIC Then
       frmPrintingCard.lblConfirmMsg.RightToLeft = True
    Else
       frmPrintingCard.lblConfirmMsg.RightToLeft = False
    End If
    frmPrintingCard.lblConfirmMsg.Caption = frmPrintingCardCaption(4, UserLang)
    frmPrintingCard.lblCard.Caption = frmPrintingCardCaption(5, UserLang)
    frmPrintingCard.optCardPrdnYes.Caption = frmPrintingCardCaption(6, UserLang)
    frmPrintingCard.optCardPrdnNo.Caption = frmPrintingCardCaption(7, UserLang)
    frmPrintingCard.lblPin.Caption = frmPrintingCardCaption(8, UserLang)
    frmPrintingCard.optPinSelectYes.Caption = frmPrintingCardCaption(6, UserLang)
    frmPrintingCard.optPinSelectNo.Caption = frmPrintingCardCaption(7, UserLang)
    frmPrintingCard.cmdOk.Caption = frmPrintingCardCaption(9, UserLang)
    frmPrintingCard.cmdCancel.Caption = frmPrintingCardCaption(10, UserLang)
    
End Sub
Public Sub unloadForms()
    Unload Me
    If recvSuperDecisionMsg.tpinSelected = "Y" Then
       If screenSetNo = "1" Or screenSetNo = "A" Then
          frmIndividualSaudiAcctInfo.approveTpinSelect
       ElseIf screenSetNo = "2" Then
          frmIndividualOthersAcctInfo.approveTpinSelect
       ElseIf screenSetNo = "7" Then
          frmQuickCustOpen.approveTpinSelect
       Else
          frmCustomer2.approveTpinSelect
       End If
    ElseIf realOrPseudo = "1" Then
       If screenSetNo = "1" Or screenSetNo = "A" Then
          frmIndividualSaudiAcctInfo.updateBranchPower
       ElseIf screenSetNo = "2" Then
          frmIndividualOthersAcctInfo.updateBranchPower
       ElseIf screenSetNo = "7" Then
          frmQuickCustOpen.updateBranchPower
       Else
          frmCustomer2.updateBranchPower
       End If
    Else
       If screenSetNo = "1" Or screenSetNo = "A" Then
          frmIndividualSaudiAcctInfo.unloadSupForms
       ElseIf screenSetNo = "2" Then
          frmIndividualOthersAcctInfo.unloadOtherIndividualSupForms
       ElseIf screenSetNo = "7" Then
          frmQuickCustOpen.unloadSupForms
       Else
          frmCustomer2.unloadSupForms
       End If
    End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
