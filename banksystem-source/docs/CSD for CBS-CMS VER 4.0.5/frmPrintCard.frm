VERSION 5.00
Begin VB.Form frmPrintCard 
   BackColor       =   &H00BFD87E&
   Caption         =   "Printing Card Plastics"
   ClientHeight    =   4305
   ClientLeft      =   1890
   ClientTop       =   2310
   ClientWidth     =   9180
   ForeColor       =   &H00800000&
   LinkTopic       =   "Form1"
   ScaleHeight     =   4305
   ScaleWidth      =   9180
   Begin VB.Frame frameRequestType 
      Height          =   495
      Left            =   3120
      TabIndex        =   8
      Top             =   2160
      Width           =   4215
      Begin VB.OptionButton optCardOnly 
         Caption         =   "Card Only"
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
         Left            =   2760
         TabIndex        =   11
         Top             =   120
         Width           =   1215
      End
      Begin VB.OptionButton optPinOnly 
         Caption         =   "Pin only"
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
         Left            =   1560
         TabIndex        =   10
         Top             =   120
         Width           =   1095
      End
      Begin VB.OptionButton optCardPin 
         Caption         =   "Card and Pin"
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
         TabIndex        =   9
         Top             =   120
         Value           =   -1  'True
         Width           =   1455
      End
   End
   Begin VB.TextBox txtPinNo 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   3120
      MaxLength       =   4
      PasswordChar    =   "*"
      TabIndex        =   2
      Top             =   1200
      Width           =   735
   End
   Begin VB.TextBox txtRetypePin 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   3120
      MaxLength       =   4
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   1680
      Width           =   735
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3960
      TabIndex        =   5
      Top             =   2880
      Width           =   1575
   End
   Begin VB.CommandButton cmdPrintCard 
      Caption         =   "Print Card"
      Height          =   375
      Left            =   2400
      TabIndex        =   4
      Top             =   2880
      Width           =   1575
   End
   Begin VB.TextBox txtCardNo 
      Height          =   345
      Left            =   3120
      TabIndex        =   1
      Top             =   600
      Width           =   2535
   End
   Begin VB.Label lblRequestType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Request Type"
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
      Height          =   375
      Left            =   1440
      TabIndex        =   12
      Top             =   2280
      Width           =   1575
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
      Left            =   1440
      TabIndex        =   7
      Top             =   1200
      Width           =   1215
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
      Left            =   1440
      TabIndex        =   6
      Top             =   1680
      Width           =   1695
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
      Left            =   1440
      TabIndex        =   0
      Top             =   600
      Width           =   1215
   End
End
Attribute VB_Name = "frmPrintCard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdPrintCard_Click()
   Dim tCardNo As String
   Dim requestType As String
   
   If optCardPin.Value = True Or optPinOnly.Value = True Then
      If Trim(txtPinNo) <> Trim(txtRetypePin) Then
         MsgBox "Pin numbers does not match.. Please reenter.."
         Exit Sub
      End If
   End If
   
   If optCardPin.Value = True Then
      requestType = "0"
   ElseIf optPinOnly.Value = True Then
      requestType = "1"
   ElseIf optCardOnly.Value = True Then
      requestType = "2"
   Else
      requestType = "9" 'Invalid Code
   End If

   tCardNo = Format(frmPrintCard.txtCardNo, "!@@@@@@@@@@@@@@@@@@@")
   
   SendMsg = "000000" + "59" + gBranchCode + tUserId + _
             tCardNo + txtPinNo + requestType

   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
              
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      Exit Sub
   End If
    
   parsePrintCardMsg
    
   If recvPrintCardMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvPrintCardMsg.aRemarks
      Else
         MsgBox recvPrintCardMsg.eRemarks
      End If
      Exit Sub
   End If
   
   If requestType = "0" Or requestType = "1" Then
      printPlasticCard
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

Private Sub txtPinNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Public Sub printPlasticCard()
    
    MsgBox recvPrintCardMsg.pinOffSet
    Printer.Orientation = 2
    Printer.FontName = "Track 1 - Magnetic stripe"
    Printer.Print recvPrintCardMsg.track1
    Printer.FontName = "Track 2 - Magnetic stripe"
    Printer.Print recvPrintCardMsg.track2
       
    Printer.Font = "Arial"
    Printer.FontBold = False
    Printer.Print
    Printer.Print
    Printer.Print
    Printer.Print
    Printer.Print
    Printer.FontSize = 18
    If Len(Trim(recvPrintCardMsg.cardNo)) >= 19 Then
       Printer.Print "    " + Mid$(recvPrintCardMsg.cardNo, 1, 7) + "  " + _
                              Mid$(recvPrintCardMsg.cardNo, 8, 8) + "  " + _
                              Mid$(recvPrintCardMsg.cardNo, 16, 4)
    Else
       Printer.Print "    " + Mid$(recvPrintCardMsg.cardNo, 1, 4) + "  " + _
                              Mid$(recvPrintCardMsg.cardNo, 5, 4) + "  " + _
                              Mid$(recvPrintCardMsg.cardNo, 9, 4) + "  " + _
                              Mid$(recvPrintCardMsg.cardNo, 13, 4)
    End If
    
    Printer.Print "     "
    Printer.FontSize = 12
    Printer.FontBold = False
    Printer.Print "             " + Mid$(recvPrintCardMsg.cardExpiryDate, 5, 2) + "/" + _
                               Mid$(recvPrintCardMsg.cardExpiryDate, 3, 2) + _
                  "                            " + Mid$(recvPrintCardMsg.custBranchCode, 2, 3)
    Printer.FontBold = True
    Printer.FontSize = 10
    Printer.Print "     " + recvPrintCardMsg.nameOnTheCard
    Printer.EndDoc
End Sub

Private Sub txtRetypePin_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
