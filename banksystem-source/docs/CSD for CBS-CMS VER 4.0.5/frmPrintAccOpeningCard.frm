VERSION 5.00
Begin VB.Form frmPrintAccOpeningCard 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account opening card print"
   ClientHeight    =   4215
   ClientLeft      =   1140
   ClientTop       =   1620
   ClientWidth     =   9945
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4215
   ScaleWidth      =   9945
   Begin VB.TextBox txtCustNo 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   7125
      MaxLength       =   7
      TabIndex        =   33
      Top             =   1050
      Width           =   1575
   End
   Begin VB.Frame frameAccountInput 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   615
      Left            =   225
      TabIndex        =   28
      Top             =   210
      Width           =   4545
      Begin VB.TextBox txtSubAcc 
         Height          =   285
         Left            =   3825
         MaxLength       =   2
         TabIndex        =   16
         Tag             =   "4545"
         Text            =   "00"
         Top             =   240
         Width           =   375
      End
      Begin VB.TextBox txtCustomerNo 
         Height          =   285
         Left            =   2625
         MaxLength       =   7
         TabIndex        =   0
         Tag             =   "4545"
         Top             =   240
         Width           =   960
      End
      Begin VB.TextBox txtCurrencyNo 
         Height          =   285
         Left            =   225
         MaxLength       =   2
         TabIndex        =   14
         Tag             =   "4545"
         Text            =   "01"
         Top             =   240
         Width           =   375
      End
      Begin VB.ComboBox cmbLedger 
         Height          =   315
         Left            =   885
         TabIndex        =   1
         Tag             =   "4545"
         Top             =   240
         Width           =   1635
      End
      Begin VB.Label lblCurrency 
         BackColor       =   &H00BFD87E&
         Caption         =   "Currency"
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
         Left            =   45
         TabIndex        =   32
         Tag             =   "4545"
         Top             =   0
         Width           =   780
      End
      Begin VB.Label lblLedger 
         BackColor       =   &H00BFD87E&
         Caption         =   "Ledger"
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
         Left            =   1365
         TabIndex        =   31
         Tag             =   "4545"
         Top             =   0
         Width           =   660
      End
      Begin VB.Label lblCustomerNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Customer No."
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
         Left            =   2565
         TabIndex        =   30
         Tag             =   "4545"
         Top             =   0
         Width           =   1185
      End
      Begin VB.Label lblSubAcc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Sub A/c"
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
         Left            =   3825
         TabIndex        =   29
         Tag             =   "4545"
         Top             =   0
         Width           =   855
      End
   End
   Begin VB.ComboBox cmbCustOpenDate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   6210
      TabIndex        =   26
      Text            =   "01"
      Top             =   2715
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.ComboBox cmbCustOpenMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   6810
      TabIndex        =   25
      Text            =   "01"
      Top             =   2715
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txtCustOpenYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   7410
      MaxLength       =   4
      TabIndex        =   24
      Top             =   2715
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Frame frameLang 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      Height          =   495
      Left            =   1950
      TabIndex        =   20
      Top             =   1995
      Width           =   1935
      Begin VB.OptionButton optLangArabic 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Tag             =   "1935"
         ToolTipText     =   "Arabic"
         Top             =   150
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton optLangEnglish 
         BackColor       =   &H00BFD87E&
         Caption         =   "English"
         Height          =   255
         Left            =   990
         TabIndex        =   21
         TabStop         =   0   'False
         Tag             =   "1935"
         ToolTipText     =   "English"
         Top             =   150
         Width           =   855
      End
   End
   Begin VB.CommandButton cmdFetchDetails 
      Caption         =   "Fetch Details"
      Default         =   -1  'True
      Height          =   375
      Left            =   4830
      TabIndex        =   2
      ToolTipText     =   "Ok"
      Top             =   390
      Width           =   1575
   End
   Begin VB.ComboBox cmbBranchCode 
      Enabled         =   0   'False
      Height          =   315
      Left            =   5790
      TabIndex        =   18
      Top             =   2100
      Width           =   2535
   End
   Begin VB.TextBox txtAccOpenYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   3150
      MaxLength       =   4
      TabIndex        =   15
      Top             =   2730
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.ComboBox cmbAccOpenMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   2550
      TabIndex        =   13
      Text            =   "01"
      Top             =   2730
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.ComboBox cmbAccOpenDate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   1950
      TabIndex        =   12
      Text            =   "01"
      Top             =   2730
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4845
      TabIndex        =   10
      ToolTipText     =   "Cancel"
      Top             =   3615
      Width           =   1935
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   3270
      TabIndex        =   9
      ToolTipText     =   "Ok"
      Top             =   3615
      Width           =   1575
   End
   Begin VB.TextBox txtIban 
      Enabled         =   0   'False
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   5460
      TabIndex        =   6
      Top             =   1635
      Width           =   4230
   End
   Begin VB.TextBox txtCustName 
      Enabled         =   0   'False
      Height          =   345
      Left            =   1980
      MaxLength       =   48
      TabIndex        =   4
      Top             =   1065
      Width           =   4965
   End
   Begin VB.TextBox txtAccNo 
      Enabled         =   0   'False
      Height          =   345
      Left            =   1965
      TabIndex        =   3
      Top             =   1605
      Width           =   2355
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
      Left            =   7215
      TabIndex        =   34
      Top             =   660
      Width           =   1455
   End
   Begin VB.Label lblCustOpenDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Open Date"
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
      Left            =   3945
      TabIndex        =   27
      Top             =   2730
      Visible         =   0   'False
      Width           =   2220
   End
   Begin VB.Label lblLangPref 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Language"
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
      Height          =   195
      Left            =   225
      TabIndex        =   23
      Top             =   2145
      Width           =   1695
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch Code"
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
      Left            =   4170
      TabIndex        =   19
      Top             =   2130
      Width           =   1575
   End
   Begin VB.Label lblAccOpeningDate 
      BackColor       =   &H00BFD87E&
      Caption         =   "A/c Open Date"
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
      Left            =   270
      TabIndex        =   17
      Top             =   2745
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.Label lblAcctNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account No."
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
      TabIndex        =   11
      Top             =   1635
      Width           =   1455
   End
   Begin VB.Label lblConfirmMsg 
      BackColor       =   &H00BFD87E&
      Caption         =   "Would you like to Print A/c opening card?"
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
      Height          =   345
      Left            =   2550
      TabIndex        =   8
      Top             =   3135
      Width           =   5190
   End
   Begin VB.Label lblIBAN 
      BackColor       =   &H00BFD87E&
      Caption         =   "IBAN "
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
      Left            =   4515
      TabIndex        =   7
      Top             =   1635
      Width           =   765
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
      Left            =   165
      TabIndex        =   5
      Top             =   1095
      Width           =   1770
   End
End
Attribute VB_Name = "frmPrintAccOpeningCard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim firstName As String
Dim secondName As String
Dim lastName As String
Private Sub cmbLedger_Click()
   txtAccNo = ""
   txtCustNo = ""
   txtCustName = ""
   txtIban = ""
   cmbAccOpenDate = ""
   cmbAccOpenMonth = ""
   txtAccOpenYear = ""
   cmbCustOpenDate = ""
   cmbCustOpenMonth = ""
   txtCustOpenYear = ""
   cmbBranchCode = ""
   cmdOk.Enabled = False
End Sub

Private Sub cmbLedger_KeyPress(KeyAscii As Integer)
   txtAccNo = ""
   txtCustNo = ""
   txtCustName = ""
   txtIban = ""
   cmbAccOpenDate = ""
   cmbAccOpenMonth = ""
   txtAccOpenYear = ""
   cmbCustOpenDate = ""
   cmbCustOpenMonth = ""
   txtCustOpenYear = ""
   cmbBranchCode = ""
   cmdOk.Enabled = False
End Sub

Private Sub cmbLedger_LostFocus()
   Dim i As Integer
   Dim tCode As String
   
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      If Len(RTrim(cmbLedger.text)) <> 0 Then
         tCode = Mid$(cmbLedger.text, 1, 3)
         For i = 0 To cmbLedger.ListCount
             If Mid$(cmbLedger.List(i), 1, 3) = tCode Then
                cmbLedger.ListIndex = i
                Exit For
             End If
         Next i
      Else
         MsgBox errSpaceLedger(UserLang)
         cmbLedger.SetFocus
         Exit Sub
      End If
        
      If i > cmbLedger.ListCount Then
         MsgBox errInvalidLedger(UserLang)
         cmbLedger.SetFocus
         Exit Sub
      End If
   End If
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdFetchDetails_Click()
   Dim tCustNo As String
   Dim tAccNo As String
   Dim tUserid As String
   Dim tCode As String, tmpStr As String
   Dim accTypeDesc As String
   Dim strmsglen As String
   
   tUserid = Format(gUserId, "!@@@@@@@@@@")
   
   'tCustNo = Format(frmPrintAccOpeningCard.txtCustNo, "0000000")
   tAccNo = Format(txtCurrencyNo, "!@@") & _
            Format(Mid$(cmbLedger, 1, 3), "!@@@") & _
            Format(txtCustomerNo, "0000000") & _
            Format(txtSubAcc, "!@@")
   
   If Len(Trim(tAccNo)) = 0 Then
      MsgBox errSpaceAccNo(UserLang)
      Exit Sub
   End If
   
   SendMsg = "000000" & "AZ" & gBranchCode & tUserid & _
             tAccNo & Space(50)

   frmPrintAccOpeningCard.MousePointer = vbHourglass
   frmPrintAccOpeningCard.cmdOk.Enabled = False
   frmPrintAccOpeningCard.cmdCancel.Enabled = False
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
              
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
     
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmPrintAccOpeningCard.MousePointer = vbNormal
      'frmPrintAccOpeningCard.cmdOk.Enabled = True
      frmPrintAccOpeningCard.cmdCancel.Enabled = True
      Exit Sub
   End If
   
   frmPrintAccOpeningCard.MousePointer = vbNormal
   frmPrintAccOpeningCard.cmdCancel.Enabled = True
    
   parseAccOpeningCardMsg
   frmPrintAccOpeningCard.cmdCancel.Enabled = True
   If recvAccOpeningCardMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvAccOpeningCardMsg.aRemarks
      Else
         MsgBox recvAccOpeningCardMsg.eRemarks
      End If
      Exit Sub
   End If
   frmPrintAccOpeningCard.cmdOk.Enabled = True
   assignNameToGlobalVar recvAccOpeningCardMsg.firstName, recvAccOpeningCardMsg.secondName, recvAccOpeningCardMsg.lastName
   
   txtAccNo = recvAccOpeningCardMsg.accNo
   
   txtCustNo = Mid$(recvAccOpeningCardMsg.accNo, 6, 7)
   txtIban = displayIban(recvAccOpeningCardMsg.iban)
   If recvAccOpeningCardMsg.customerLang = "0" Then
      optLangArabic.Value = True
      'txtCustName = recvAccOpeningCardMsg.aShortName
   Else
      optLangEnglish.Value = True
      'txtCustName = recvAccOpeningCardMsg.eShortName
   End If
   
   txtCustName = Trim(recvAccOpeningCardMsg.firstName) & " " & Trim(recvAccOpeningCardMsg.secondName) & " " & _
                 Trim(recvAccOpeningCardMsg.lastName)
   
   cmbAccOpenDate = Mid$(recvAccOpeningCardMsg.accOpenDate, 7, 2)
   cmbAccOpenMonth = Mid$(recvAccOpeningCardMsg.accOpenDate, 5, 2)
   txtAccOpenYear = Mid$(recvAccOpeningCardMsg.accOpenDate, 1, 4)
   
   cmbCustOpenDate = Mid$(recvAccOpeningCardMsg.custOpenDate, 7, 2)
   cmbCustOpenMonth = Mid$(recvAccOpeningCardMsg.custOpenDate, 5, 2)
   txtCustOpenYear = Mid$(recvAccOpeningCardMsg.custOpenDate, 1, 4)
   
   tCode = recvAccOpeningCardMsg.custBranchCode
   Set rs = db.OpenRecordset("select arabicname, englishName from branchinfo where branchcode = '" & tCode & "'")
   
   If rs.recordCount > 0 Then
      If recvAccOpeningCardMsg.customerLang = "0" Then
         tmpStr = tCode & "-" & rs(0)
      Else
         tmpStr = tCode & "-" & rs(1)
      End If
   Else
      tmpStr = tCode & "-Undefined"
   End If
   
   cmbBranchCode = tmpStr
      
End Sub
Public Sub parseAccOpeningCardMsg()
    Dim pos As Integer
    recvAccOpeningCardMsg.status = Mid$(RecvStr, 1, 3)
    recvAccOpeningCardMsg.service = Mid$(RecvStr, 4, 2)
    recvAccOpeningCardMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvAccOpeningCardMsg.eRemarks = Mid$(RecvStr, 56, 50)
    pos = 106
    recvAccOpeningCardMsg.custNo = Mid$(RecvStr, pos, 7)
    pos = pos + 7
    recvAccOpeningCardMsg.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvAccOpeningCardMsg.iban = Mid$(RecvStr, pos, 24)
    pos = pos + 24
    recvAccOpeningCardMsg.customerLang = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvAccOpeningCardMsg.aShortName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvAccOpeningCardMsg.eShortName = Mid$(RecvStr, pos, 30)
    pos = pos + 30
    recvAccOpeningCardMsg.custOpenDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvAccOpeningCardMsg.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvAccOpeningCardMsg.accOpenDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvAccOpeningCardMsg.firstName = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvAccOpeningCardMsg.secondName = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvAccOpeningCardMsg.thirdName = Mid$(RecvStr, pos, 15)
    pos = pos + 15
    recvAccOpeningCardMsg.lastName = Mid$(RecvStr, pos, 15)
    pos = pos + 15
End Sub

Private Sub cmdOk_Click()
   Dim printStatus As Integer
   Dim customerLang As Integer
   Dim custName1 As String, custName2 As String, custName3 As String
   Dim currentPrinter As Printer, PRNTR As Printer
   Dim tmpPrinter As String
   Dim tmpStr As String, tCode As String
   Dim cardPrinterDefaulted As Boolean
   Dim langChar As String
   Dim accTypeDesc As String
   Dim response
  
   Dim accName(2) As String
   Dim accAcNo(2) As String
   Dim accIban(2) As String
   Dim accAccOpenDate(2) As String
   Dim accBranch(2) As String
   Dim accAccType(2) As String
   Dim accCustOpenDate(2) As String
   
   Dim accCurrentAcc(2) As String
   Dim accSavingAcc(2) As String
   Dim accOdAcc(2) As String
      
   printStatus = 0
      
   accName(0) = " «·«”„: "
   accAcNo(0) = " «·Õ”«»: "
   accBranch(0) = " «·›—⁄: "
   accIban(0) = " ¬Ì»«‰: "
   'accIban(0) = "—ﬁ„ ¬Ì »«‰"
   accAccType(0) = "‰Ê⁄ «·Õ”«»"
   
   'accIban(0) = "IBAN     "
   
   accAccOpenDate(0) = " «—ÌŒ › Õ «·Õ”«»"
   accCustOpenDate(0) = "  «‰‘«¡ «·⁄„Ì· "
      
   accName(1) = " Name : "
   accAcNo(1) = " A/C   : "
   accBranch(1) = " Branch: "
   accIban(1) = " IBAN  : "
   
   If optLangArabic = True Then
      customerLang = 0
      langChar = Chr$(254)  ' for arabic
   Else
      customerLang = 1
      langChar = Chr$(253)  ' for english
   End If
   
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
  Printer.FontName = "Courier New (Arabic)"
  'Printer.FontName = "Arial"
  Printer.FontSize = 11
  Printer.FontBold = True
  Printer.CurrentX = 0
  Printer.CurrentY = 0
  Printer.Print
   tCode = Mid$(cmbBranchCode, 1, 4)
  Set rs = db.OpenRecordset("select arabicname, englishName from branchinfo where branchcode = '" & tCode & "'")
   
  If rs.recordCount > 0 Then
     If customerLang = 0 Then
        tmpStr = Mid$(tCode, 2, 3) & " " & rs(0)
     Else
        tmpStr = Mid$(tCode, 2, 3) & " " & rs(1)
     End If
  Else
     tmpStr = Mid$(tCode, 2, 3) & " Undefined"
  End If
  Printer.Print
  Printer.Print
  
  Printer.Print  ' Added on 26th Apr as per Fahad's suggestion
  If customerLang = 1 Then
     Printer.RightToLeft = False
  Else
     Printer.RightToLeft = True
  End If
  
  Printer.Print
  custName1 = txtCustName
  custName2 = Space(20)
  custName3 = Space(20)
  
  If Len(Trim(custName1)) > 26 Then
     custName1 = Trim(firstName) & " " & Trim(secondName)
     custName2 = Trim(lastName)
     If Len(Trim(custName1)) > 26 Then
        custName1 = Trim(firstName)
        custName2 = Trim(secondName) & " " & Trim(lastName)
        If Len(Trim(custName2)) > 25 Then
           custName2 = Trim(secondName)
           custName3 = Trim(lastName)
        End If
     End If
  End If
    
  Printer.Print Space(1) & langChar & accName(customerLang) & langChar & Format(custName1, "!" & String(63, "@")) & langChar
  If Len(Trim(custName2)) > 0 Then
     Printer.Print Space(1) & langChar & Space(Len(accName(customerLang))) & langChar & Format(custName2, "!" & String(32, "@")) & langChar
  Else
     Printer.Print
  End If
'  If Len(Trim(custName3)) > 0 Then
'     Printer.Print Space(1) & langChar & Space(Len(accName(customerLang))) & langChar & Format(custName3, "!" & String(32, "@")) & langChar
'  Else
'     Printer.Print
'  End If
  Printer.FontSize = 10
  Printer.Print Space(1) & langChar & accAcNo(customerLang) & langChar & Format(txtAccNo, "!" & String(14, "@")) & langChar
  If customerLang = 2 Then
     Printer.Print
  End If
  Printer.Print Space(1) & langChar & accIban(customerLang) & langChar & Format(txtIban, "!" & String(29, "@")) & langChar
  Printer.Print
  'Printer.Print
  'Printer.Print Space(1) & langChar & accAccType(customerLang) & langChar & ":" & langChar & accTypeDesc & langChar
  'Printer.Print Space(1) & langChar & accAccOpenDate(customerLang) & ":" & langChar & Format(cmbAccOpenDate & "/" & cmbAccOpenMonth & "/" & txtAccOpenYear, "!" & String(10, "@")) & langChar
  'Printer.Print Space(1) & langChar & accCustOpenDate(customerLang) & ":" & langChar & Format(cmbCustOpenDate & "/" & cmbCustOpenMonth & "/" & txtCustOpenYear, "!" & String(10, "@")) & langChar
  Printer.Print Space(1) & langChar & accBranch(customerLang) & langChar & Format(tmpStr, "!" & String(35, "@")) & langChar

  cmdOk.Enabled = False
  cmdCancel.Enabled = False
  cmdFetchDetails.Enabled = False
  Printer.EndDoc
  
  delay (10)
  
  If cardPrinterDefaulted = True Then
     For Each PRNTR In Printers
        If PRNTR.DeviceName = tmpPrinter Then
           Set Printer = PRNTR
           Exit For
        End If
     Next
  End If
  cmdOk.Enabled = True
  cmdCancel.Enabled = True
  cmdFetchDetails.Enabled = True
  response = MsgBox(errCardPrintedOk(UserLang), vbYesNo, "A/c open Card print confirmation")
  If response = vbNo Then
     Exit Sub
  Else
     updateConfirmation "1"
  End If
    
End Sub
Private Sub cmdOkMAJEED_Click()
   Dim printStatus As Integer
   Dim customerLang As Integer
   Dim currentPrinter As Printer, PRNTR As Printer
   Dim tmpPrinter As String
   Dim tmpStr As String, tCode As String
   Dim cardPrinterDefaulted As Boolean
   Dim langChar As String
   Dim response
  
   Dim accName(2) As String
   Dim accAcNo(2) As String
   Dim accIban(2) As String
   Dim accAccOpenDate(2) As String
   Dim accBranch(2) As String
   
   printStatus = 0
      
   accName(0) = "«·«”„ "
   accName(1) = "Name   "
   accAcNo(0) = "«·Õ”«»"
   accAcNo(1) = "A/C No."
   accIban(0) = "IBAN "
   accIban(1) = "IBAN   "
   accAccOpenDate(0) = " «—ÌŒ › Õ «·Õ”«»"
   accAccOpenDate(1) = "A/C Opening Date"
   accBranch(0) = "«·›—⁄"
   accBranch(1) = "Branch "
   
   If optLangArabic = True Then
      customerLang = 0
      langChar = Chr$(254)  ' for arabic
   Else
      customerLang = 1
      langChar = Chr$(253)  ' for english
   End If
  
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
  Printer.FontName = "Courier New (Arabic)"
  Printer.FontSize = 10
  Printer.FontBold = True
  Printer.CurrentX = 0
  Printer.CurrentY = 0
  Printer.Print
  'Printer.Print
  tCode = Mid$(cmbBranchCode, 1, 4)
  Set rs = db.OpenRecordset("select arabicname, englishName from branchinfo where branchcode = '" & tCode & "'")
   
  If rs.recordCount > 0 Then
     If customerLang = 0 Then
        tmpStr = tCode & " " & rs(0)
     Else
        tmpStr = tCode & " " & rs(1)
     End If
  Else
     tmpStr = tCode & " Undefined"
  End If
  Printer.RightToLeft = True
  Printer.Print Space(3) & Chr(254) & accBranch(customerLang) & Chr(254)
  'Printer.Print Space(3) & langChar & accBranch(customerLang) & langChar & ":" & langChar & Format(tmpStr, "!" & String(35, "@")) & langChar
  Printer.Print Space(3) & Chr(254) & Format(tmpStr, "!" & String(35, "@")) & Chr(254)
  If customerLang = 1 Then
     'Printer.Font = "Arial"
     Printer.RightToLeft = False
  Else
     Printer.RightToLeft = True
  End If
  
  Printer.Print
  Printer.Print
    
  Printer.Print Space(3) & langChar & accName(customerLang) & ":" & langChar & Format(txtCustName, "!" & String(30, "@")) & langChar
  Printer.Print
  Printer.Print Space(3) & langChar & accAcNo(customerLang) & ":" & langChar & Format(txtAccNo, "!" & String(14, "@")) & langChar
  If customerLang = 2 Then
     Printer.Print
  End If
  Printer.Print Space(3) & langChar & accIban(customerLang) & langChar & ":" & langChar & Format(txtIban, "!" & String(29, "@")) & langChar
  Printer.Print
  Printer.Print
  Printer.Print Space(10) & langChar & accAccOpenDate(customerLang) & ":" & langChar & Format(cmbAccOpenDate & "/" & cmbAccOpenMonth & "/" & txtAccOpenYear, "!" & String(10, "@")) & langChar
    
  Printer.EndDoc
  'printStatus = 1
    
  delay (10)
  
  If cardPrinterDefaulted = True Then
     For Each PRNTR In Printers
        If PRNTR.DeviceName = tmpPrinter Then
           Set Printer = PRNTR
           Exit For
        End If
     Next
  End If

   response = MsgBox(errCardPrintedOk(UserLang), vbYesNo, "A/c open Card print confirmation")
   If response = vbNo Then
      Exit Sub
   Else
      updateConfirmation "1"
   End If
    
End Sub

Public Sub updateConfirmation(requestType As String)
   Dim tCustNo As String
   Dim tUserid As String
   Dim tIban As String
   Dim strmsglen As String
   
   tUserid = Format(gUserId, "!@@@@@@@@@@")
   
   tCustNo = Format(txtCustNo, "!@@@@@@@")
   
   tIban = Mid$(txtIban, 1, 4) & Mid$(txtIban, 6, 4) & Mid$(txtIban, 11, 4) & Mid$(txtIban, 16, 4) & _
           Mid$(txtIban, 21, 4) & Mid$(txtIban, 26, 4)
      
   SendMsg = "000000" & "BA" & gBranchCode & tUserid & _
              tCustNo & requestType & Format(txtAccNo, "!@@@@@@@@@@@@@@") & _
              Format(tIban, "!" & String(24, "@")) & _
              IIf(optLangArabic = True, "0", "1") & _
              Format(txtCustName, "!" & String(30, "@")) & _
              Format(txtAccOpenYear & cmbAccOpenMonth & cmbAccOpenDate, "!@@@@@@@@") & _
              Mid$(cmbBranchCode, 1, 4) & Space(50)

   frmPrintAccOpeningCard.MousePointer = vbHourglass
   frmPrintAccOpeningCard.cmdOk.Enabled = False
   frmPrintAccOpeningCard.cmdCancel.Enabled = False
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
              
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
     
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmPrintAccOpeningCard.MousePointer = vbNormal
      frmPrintAccOpeningCard.cmdOk.Enabled = True
      frmPrintAccOpeningCard.cmdCancel.Enabled = True
      Exit Sub
   End If
   
   frmPrintAccOpeningCard.MousePointer = vbNormal
   frmPrintAccOpeningCard.cmdOk.Enabled = True
   frmPrintAccOpeningCard.cmdCancel.Enabled = True
    
   frmPrintAccOpeningCard.cmdCancel.Enabled = True
   frmPrintAccOpeningCard.cmdOk.Enabled = True
    
   If recvCustomerMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvCustomerMsg.aRemarks
      Else
         MsgBox recvCustomerMsg.eRemarks
      End If
      Exit Sub
   Else
      MsgBox errSuccessful(UserLang)
   End If
   
   Unload Me
   
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()

    If UserLang = ARABIC Then
       ChangePositions frmPrintAccOpeningCard, 10065
       frmPrintAccOpeningCard.RightToLeft = True
    End If
    
    frmPrintAccOpeningCard.Caption = frmPrintAccOpeningCardCaption(0, UserLang)
    If UserLang = ARABIC Then
       frmPrintAccOpeningCard.lblConfirmMsg.RightToLeft = True
    Else
       frmPrintAccOpeningCard.lblConfirmMsg.RightToLeft = False
    End If
    lblCustNo.Caption = frmPrintAccOpeningCardCaption(1, UserLang)
    cmdFetchDetails.Caption = frmPrintAccOpeningCardCaption(2, UserLang)
    lblAcctNo.Caption = frmPrintAccOpeningCardCaption(3, UserLang)
    lblCustName.Caption = frmPrintAccOpeningCardCaption(4, UserLang)
    lblIBAN.Caption = frmPrintAccOpeningCardCaption(5, UserLang)
    lblAccOpeningDate.Caption = frmPrintAccOpeningCardCaption(6, UserLang)
    lblBranchCode.Caption = frmPrintAccOpeningCardCaption(7, UserLang)
    lblLangPref.Caption = frmPrintAccOpeningCardCaption(8, UserLang)
    optLangArabic.Caption = frmPrintAccOpeningCardCaption(9, UserLang)
    optLangEnglish.Caption = frmPrintAccOpeningCardCaption(10, UserLang)
    lblConfirmMsg.Caption = frmPrintAccOpeningCardCaption(11, UserLang)
    cmdOk.Caption = frmPrintAccOpeningCardCaption(12, UserLang)
    cmdCancel.Caption = frmPrintAccOpeningCardCaption(13, UserLang)
    lblCurrency.Caption = frmPrintAccOpeningCardCaption(14, UserLang)
    lblLedger.Caption = frmPrintAccOpeningCardCaption(15, UserLang)
    lblCustomerNo.Caption = frmPrintAccOpeningCardCaption(16, UserLang)
    lblSubAcc.Caption = frmPrintAccOpeningCardCaption(17, UserLang)
    
    Set rs = db.OpenRecordset("select * from bmledgerinfo where accCreationAllowed = '1'")
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbLedger.Clear
       Do While Not rs.EOF
          If rs("ledgercode") <> "000" Then
             If UserLang = ARABIC Then
                cmbLedger.AddItem rs("ledgercode") & "-" & rs("arabicname")
             Else
                cmbLedger.AddItem rs("ledgercode") & "-" & rs("englishname")
             End If
          End If
          rs.MoveNext
       Loop
       cmbLedger.ListIndex = 0
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtCurrencyNo_Change()
    If Len(txtCurrencyNo) = txtCurrencyNo.MaxLength Then
       cmbLedger.SetFocus
    End If
End Sub

Private Sub txtCurrencyNo_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If
   
   txtAccNo = ""
   txtCustNo = ""
   txtCustName = ""
   txtIban = ""
   cmbAccOpenDate = ""
   cmbAccOpenMonth = ""
   txtAccOpenYear = ""
   cmbCustOpenDate = ""
   cmbCustOpenMonth = ""
   txtCustOpenYear = ""
   cmbBranchCode = ""
   cmdOk.Enabled = False
End Sub

Private Sub txtCustomerNo_Change()
    If Len(txtCustomerNo) = txtCustomerNo.MaxLength Then
       cmdFetchDetails.SetFocus
    End If
End Sub

Private Sub txtCustomerNo_KeyPress(KeyAscii As Integer)
   If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
       KeyAscii = 0
       MsgBox (errOnlyNumeralsAllowed(UserLang))
       Exit Sub
   End If
   
   txtAccNo = ""
   txtCustNo = ""
   txtCustName = ""
   txtIban = ""
   cmbAccOpenDate = ""
   cmbAccOpenMonth = ""
   txtAccOpenYear = ""
   cmbCustOpenDate = ""
   cmbCustOpenMonth = ""
   txtCustOpenYear = ""
   cmbBranchCode = ""
   cmdOk.Enabled = False
End Sub

Private Sub txtSubAcc_Change()
    If Len(txtSubAcc) = txtSubAcc.MaxLength Then
       cmdFetchDetails.SetFocus
    End If
End Sub

Private Sub txtSubAcc_KeyPress(KeyAscii As Integer)
   txtAccNo = ""
   txtCustNo = ""
   txtCustName = ""
   txtIban = ""
   cmbAccOpenDate = ""
   cmbAccOpenMonth = ""
   txtAccOpenYear = ""
   cmbCustOpenDate = ""
   cmbCustOpenMonth = ""
   txtCustOpenYear = ""
   cmbBranchCode = ""
   cmdOk.Enabled = False
End Sub

Public Sub assignNameToGlobalVar(pFirstName As String, pSecondName As String, pLastName As String)
   firstName = pFirstName
   secondName = pSecondName
   lastName = pLastName
End Sub
 
