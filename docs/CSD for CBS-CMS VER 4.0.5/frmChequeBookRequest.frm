VERSION 5.00
Begin VB.Form frmChequeBookRequest 
   BackColor       =   &H00BFD87E&
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Cheque Book Request"
   ClientHeight    =   3195
   ClientLeft      =   1560
   ClientTop       =   3300
   ClientWidth     =   9660
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   9660
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdPrintAppln 
      Caption         =   "Print Application"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1440
      TabIndex        =   15
      ToolTipText     =   "Print Application"
      Top             =   2640
      Width           =   1455
   End
   Begin VB.ComboBox cmbDeliveryBranchCode 
      Height          =   315
      Left            =   2520
      Style           =   2  'Dropdown List
      TabIndex        =   13
      Top             =   2160
      Width           =   2295
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4320
      TabIndex        =   12
      ToolTipText     =   "Cancel"
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Create/Update"
      Height          =   375
      Left            =   2880
      TabIndex        =   11
      ToolTipText     =   "Create/Update"
      Top             =   2640
      Width           =   1455
   End
   Begin VB.TextBox txtNoOfChequeBook 
      Height          =   285
      Left            =   7200
      MaxLength       =   2
      TabIndex        =   10
      Text            =   "1"
      Top             =   1560
      Width           =   855
   End
   Begin VB.Frame frameChequeBook 
      Height          =   495
      Left            =   2520
      TabIndex        =   6
      Top             =   1440
      Width           =   2535
      Begin VB.OptionButton optPersonal 
         Caption         =   "Personal"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00400000&
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Tag             =   "2535"
         Top             =   120
         Value           =   -1  'True
         Width           =   1215
      End
      Begin VB.OptionButton optCorporate 
         Caption         =   "Corporate"
         Height          =   255
         Left            =   1320
         TabIndex        =   7
         Tag             =   "2535"
         Top             =   120
         Width           =   1095
      End
   End
   Begin VB.TextBox txtName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6480
      TabIndex        =   3
      Top             =   840
      Width           =   3015
   End
   Begin VB.TextBox txtAcctNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2520
      TabIndex        =   2
      Top             =   840
      Width           =   2535
   End
   Begin VB.Label lblDeliveryBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Delivery Branch Code"
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
      Left            =   480
      TabIndex        =   14
      Top             =   2160
      Width           =   1935
   End
   Begin VB.Label lblNoOfChequeBook 
      BackColor       =   &H00BFD87E&
      Caption         =   "# of Cheque Book"
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
      Left            =   5400
      TabIndex        =   9
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Label lblChequeBookType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cheque Book Type"
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
      Left            =   600
      TabIndex        =   5
      Top             =   1560
      Width           =   1695
   End
   Begin VB.Label lblName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Name"
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
      Left            =   5400
      TabIndex        =   4
      Top             =   840
      Width           =   855
   End
   Begin VB.Label lblAcctNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Number"
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
      Left            =   600
      TabIndex        =   1
      Top             =   840
      Width           =   1935
   End
   Begin VB.Label lblChequeBookRequest 
      BackColor       =   &H00BFD87E&
      Caption         =   "Request for Cheque Book"
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
      Left            =   2880
      TabIndex        =   0
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "frmChequeBookRequest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Cancel_Click()
   Unload Me
End Sub

Private Sub cmdCancel_Click()
   Unload Me
End Sub

Private Sub cmdCreate_Click()
   Dim tuserId As String
   Dim tAccNo As String, chequeBookType As String
   Dim newOrUpdate As String, accBranchCode As String
   Dim strmsglen As String, deliveryBranchCode As String
   
   
   tuserId = Format(gUserId, "!@@@@@@@@@@")
   tAccNo = Format(frmChequeBookRequest.txtAcctNo, "!@@@@@@@@@@@@@@")
   
   If frmChequeBookRequest.optCorporate.Value = True Then
      chequeBookType = "2"
   Else
      chequeBookType = "1"
   End If
   
   If Len(RTrim(frmChequeBookRequest.txtNoOfChequeBook)) = 0 Then
      MsgBox errSpaceNoOfChqBook(UserLang)  '"# of cheque book should be entered.. Please enter.."
      frmChequeBookRequest.txtNoOfChequeBook.SetFocus
      Exit Sub
   End If
   
   If chequeBookCreateAction Then
      newOrUpdate = "N"
   Else
      newOrUpdate = "U"
   End If
   accBranchCode = recvAccSearchMsg.custBranchCode
   deliveryBranchCode = Mid$(cmbDeliveryBranchCode, 1, 4)
   If deliveryBranchCode = "0000" Then
      deliveryBranchCode = Space(4)
   End If
   
   SendMsg = "000000" & "37" & gBranchCode & tuserId & _
             newOrUpdate & accBranchCode & tAccNo & chequeBookType & _
             Format(frmChequeBookRequest.txtNoOfChequeBook, "00") & _
             Format(recvAccSearchMsg.samaMainCategory, "!@@") & _
             Format(recvAccSearchMsg.samaSubCategory, "!@@") & _
             deliveryBranchCode & Space(50)
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmChequeBookRequest.MousePointer = vbHourglass
    frmChequeBookRequest.cmdCreate.Enabled = False
    frmChequeBookRequest.cmdCancel.Enabled = False
          
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmChequeBookRequest.MousePointer = vbDefault
       frmChequeBookRequest.cmdCreate.Enabled = False
       frmChequeBookRequest.cmdCancel.Enabled = True
       Exit Sub
    End If
     
    frmChequeBookRequest.MousePointer = vbDefault
    frmChequeBookRequest.cmdCreate.Enabled = False
    frmChequeBookRequest.cmdCancel.Enabled = True
    
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
    frmChequeBookRequest.cmdPrintAppln.Enabled = True
     
    Unload Me
    tuserId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000000" & "55" & gBranchCode & tuserId & "00000" & tAccNo & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
     
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       Exit Sub
    End If
   
    frmAccountGrid.parseChequeBookSearchMsg
    Unload frmChequeBookGrid
    If UserLang = ARABIC Then
       ChangePositions frmChequeBookGrid, 12000
       frmChequeBookGrid.RightToLeft = True
       frmChequeBookGrid.txtCustNo.RightToLeft = True
       frmChequeBookGrid.txtCustName.RightToLeft = True
       frmChequeBookGrid.txtCustName.Alignment = 1
       frmChequeBookGrid.txtCustNo.Alignment = 1
    End If
    'frmChequeBookGrid.Show
    frmChequeBookGrid.txtAcctNo = tAccNo
    'Me.Show

End Sub

Private Sub cmdPrintAppln_Click()
    Dim i As Integer
    Dim applnFile As String
    Dim applnLang As Integer
    Dim strmsglen As String
    Dim tmpStr As String
    Dim cityName As String
    Dim tCode As String
    Dim response
    Dim fso As FileSystemObject
    Dim page As Integer
    Dim lines As Integer
    Dim textStream As Object
    Dim fsys As Object
    Dim langChar As String
    Dim idNumber As String
    Dim tmpStr1 As String, tmpStr2 As String, tmpStr3 As String, tmpStr4 As String
    Dim tmpStr5 As String, tmpStr6 As String, tmpStr7 As String, tmpStr8 As String
    Dim tmpStr9 As String, tmpStr10 As String
    
    If Len(RTrim(frmChequeBookRequest.txtNoOfChequeBook)) = 0 Then
       MsgBox errSpaceNoOfChqBook(UserLang)  '"# of cheque book should be entered.. Please enter.."
       frmChequeBookRequest.txtNoOfChequeBook.SetFocus
       Exit Sub
    End If
    
    Set fsys = CreateObject("scripting.filesystemobject")

    Set fso = CreateObject("Scripting.FileSystemObject")
    If recvAccSearchMsg.customerLang = "0" Then
       applnLang = 0 ' Arabic
    Else
       applnLang = 1 ' for english
    End If
    
    If applnLang = 0 Then
       langChar = Chr$(254) ' for arabic
       Printer.RightToLeft = True ' for arabic
    Else
       langChar = Chr$(253) ' for english
       Printer.RightToLeft = False ' for english
    End If
           
    Printer.Orientation = vbPRORPortrait
    Printer.FontName = "Courier New (Arabic)"
    Printer.fontSize = 10
    Printer.CurrentX = 0
    Printer.CurrentY = 0
    
    'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
    Printer.PaintPicture frmLogin.anbLogo1, 50, 200
    For i = 1 To 6
        Printer.Print
    Next
    lines = 4
    page = 1
    Printer.FontBold = True
    Printer.fontSize = 20
    Printer.Print Space(5) & appChequeBookRequestAppln(applnLang) & langChar
    Printer.FontBold = False
    Printer.fontSize = 10
    Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
    Printer.Print
    Printer.Print
    Printer.Print Format(appDate(applnLang), "!@@@@@@@@@@") & langChar & ":" & Format(Date$, "dd/mm/yyyy") & langChar
    tCode = gBranchCode
    Set rs = db.OpenRecordset("select * from branchinfo where branchcode='" & tCode & "'")
    If rs.recordCount > 0 Then
       If applnLang = ENGLISH Then
          tmpStr = rs("branchcode") & " - " & rs("englishname")
       Else
          tmpStr = rs("branchcode") & " - " & rs("arabicname")
       End If
    Else
       tmpStr = tCode & "-" & appUnknown(applnLang)
    End If
    Printer.Print Format(appBranch(applnLang), "!@@@@@@@@@@") & langChar & ":" & tmpStr & langChar
    lines = lines + 1
    Printer.Print
    Printer.Print
    Printer.Print Format(appAcctNo(applnLang), "!@@@@@@@@@@@@@@@@@@@@@@@@@@@") & langChar & txtAcctNo
    If applnLang = ENGLISH Then
       If Len(RTrim(recvAccSearchMsg.eShortName)) = 0 Then
          tmpStr = recvAccSearchMsg.aShortName
       Else
          tmpStr = recvAccSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvAccSearchMsg.aShortName)) = 0 Then
          tmpStr = recvAccSearchMsg.eShortName
       Else
          tmpStr = recvAccSearchMsg.aShortName
       End If
    End If
    Printer.Print Format(appAccHoldersName(applnLang), "!@@@@@@@@@@@@@@@@@@@@@@@@@@@") & langChar & tmpStr & langChar
    Printer.Print
    Printer.Print
    Printer.Print
    
    Printer.Print appPlsProvideChqBook(applnLang) & langChar
    Printer.Print
    If frmChequeBookRequest.optCorporate = True Then
       Printer.Print Space(5) & app50chequeLeaves(applnLang) & Space(5) & appQuantity(applnLang) & langChar & Space(5) & frmChequeBookRequest.txtNoOfChequeBook & langChar
    Else
       Printer.Print Space(5) & app25ChequeLeaves(applnLang) & Space(5) & appQuantity(applnLang) & langChar & Space(5) & frmChequeBookRequest.txtNoOfChequeBook & langChar
    End If
    Printer.Print
    Printer.Print
    Printer.Print appChqReceipt(applnLang) & langChar
    Printer.Print
    Printer.Print
    Printer.Print
    Printer.Print
   Printer.fontSize = 10
   On Error GoTo err_handler
   If applnLang = ENGLISH Then
      tmpStr10 = App.Path & "\chequeBookTerms_eng.txt"
   Else
      tmpStr10 = App.Path & "\chequeBookTerms_arb.txt"
   End If
   tCode = "0"
   Set textStream = fsys.OpenTextFile(tmpStr10, 1, False, False)

   tmpStr = ""
   If tCode = "0" Then
      While textStream.AtEndOfStream = False
          tmpStr = textStream.ReadLine
          Printer.Print tmpStr & langChar
          lines = lines + 1
          If lines > 70 Then
             Printer.Print Space(40) & appContd(applnLang) & langChar
             Printer.NewPage
             page = page + 1
             'Printer.PaintPicture frmLogin.anbLogo, 2500, 150
             Printer.PaintPicture frmLogin.anbLogo1, 50, 200
             For i = 1 To 6
                 'Printer.Print vbCrLf
                 Printer.Print
             Next
             lines = 4
             'Printer.Print Space(60) & appPage(applnLang) & Space(3) & ":" & page
             'lines = lines + 1
          End If
      Wend
      textStream.Close
   End If
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   ' commented by Rajesh as CSR signature is reported as repeative by Tanenah - 23/04/2007
   'Printer.Print Space(10) & appCustomerSignature(applnLang) & langChar & Space(20) & appCSRSignature(applnLang)
   Printer.FontBold = True
   Printer.Print Space(35) & appCustomerSignature(applnLang) & langChar
   Printer.FontBold = False
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print

   'Added by Rajesh on 8th April 2007 as per mail from Tanenah on 24 Mar 2007 to
   'include customer signature verification information on all application forms
   Printer.Print
   Printer.Print
   Printer.FontBold = True
   Printer.Print Space(25) & appCustSignVerif(applnLang) & langChar & Space(24)
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.Print
   Printer.FontBold = False
   Printer.Print appCustSrvRepNameSign(applnLang) & langChar & Space(16) & appCustSrvSuprNameSign(applnLang) & langChar
   Printer.EndDoc
   On Error GoTo 0
   Exit Sub

err_handler:

If Err.Number = 53 Or Err.Number = 76 Then
   If UserLang = ARABIC Then
      tmpStr = tmpStr10 & "„·› «·≈ﬁ—«—/«·‘—Êÿ Ê«·√Õﬂ«„ €Ì— „ÊÃÊœ ; «·≈ﬁ—«—/«·‘—Êÿ Ê«·√Õﬂ«„ ·‰  ÿ»⁄.."
   Else
      tmpStr = "Declaration/Terms&conditions  file (" & tmpStr10 & ") does not exist ; Declaration/Terms&conditions will not be printed.."
   End If
   MsgBox tmpStr
   tCode = "1"
   Resume Next
Else
   Resume Next
End If
    
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim tAccNo As String
   Dim tCode As String, tmpStr As String
   Dim noOfBranch As Integer
    
   If UserLang = ARABIC Then
      ChangePositions frmChequeBookRequest, 9780
      frmChequeBookRequest.RightToLeft = True
      frmChequeBookRequest.txtName.Alignment = 1
   End If
   
   frmChequeBookRequest.Caption = frmChequeBookRequestCaption(0, UserLang)
   frmChequeBookRequest.lblChequeBookRequest.Caption = frmChequeBookRequestCaption(1, UserLang)
   frmChequeBookRequest.lblAcctNo.Caption = frmChequeBookRequestCaption(2, UserLang)
   frmChequeBookRequest.lblName.Caption = frmChequeBookRequestCaption(3, UserLang)
   frmChequeBookRequest.lblChequeBookType.Caption = frmChequeBookRequestCaption(4, UserLang)
   frmChequeBookRequest.optPersonal.Caption = frmChequeBookRequestCaption(5, UserLang)
   frmChequeBookRequest.optCorporate.Caption = frmChequeBookRequestCaption(6, UserLang)
   frmChequeBookRequest.lblNoOfChequeBook.Caption = frmChequeBookRequestCaption(7, UserLang)
   frmChequeBookRequest.cmdCreate.Caption = frmChequeBookRequestCaption(8, UserLang)
   frmChequeBookRequest.cmdCancel.Caption = frmChequeBookRequestCaption(9, UserLang)
   frmChequeBookRequest.lblDeliveryBranchCode.Caption = frmChequeBookRequestCaption(10, UserLang)
   frmChequeBookRequest.cmdPrintAppln.Caption = frmChequeBookRequestCaption(11, UserLang)
      
   frmChequeBookRequest.txtAcctNo = frmChequeBookGrid.txtAcctNo
   If UserLang = ARABIC Then
      If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
         frmChequeBookRequest.txtName = recvAccSearchMsg.aShortName
      Else
         frmChequeBookRequest.txtName = recvAccSearchMsg.eShortName
      End If
   Else
      If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
         frmChequeBookRequest.txtName = recvAccSearchMsg.eShortName
      Else
         frmChequeBookRequest.txtName = recvAccSearchMsg.aShortName
      End If
   End If
   
   cmbDeliveryBranchCode.Clear
   tCode = recvChequeBookSearchMsg.alternativeBranchCode
   Set rs = db.OpenRecordset("select * from branchinfo where branchcode='" & tCode & "'")
   If rs.recordCount > 0 Then
      If UserLang = ENGLISH Then
         cmbDeliveryBranchCode.AddItem rs("branchcode") & " - " & rs("englishname")
      Else
         cmbDeliveryBranchCode.AddItem rs("branchcode") & " - " & rs("arabicname")
      End If
   End If
   
   tCode = recvAccSearchMsg.custBranchCode
   Set rs = db.OpenRecordset("select * from branchinfo where branchcode='" & tCode & "'")
   If rs.recordCount > 0 Then
      If rs("realOrPseudo") = "1" Or rs("realOrPseudo") = "2" Then
         If UserLang = ENGLISH Then
            cmbDeliveryBranchCode.AddItem rs("branchcode") & " - " & rs("englishname")
         Else
            cmbDeliveryBranchCode.AddItem rs("branchcode") & " - " & rs("arabicname")
         End If
       Else
         LogData "Branch code " & tCode & "  is not added to delivery branch code list since " & _
                 "the branch is defined as Pseudo branch "
      End If
   Else
      tmpStr = tCode & "-Not defined in Local DB"
      cmbDeliveryBranchCode.AddItem tmpStr
   End If
   ' If the request branch & customer branch code are same
   ' the branch code should be populated in the list box
   ' only one time, thats why if the branch codes are
   ' same, then skip
   If gBranchCode <> recvAccSearchMsg.custBranchCode And gBranchCode <> recvChequeBookSearchMsg.alternativeBranchCode Then
      tCode = gBranchCode
      Set rs = db.OpenRecordset("select * from branchinfo where branchcode='" & tCode & "'")
      If rs.recordCount > 0 Then
         'Pseudo branches should not be added as a delivery branch code
         'Only read branches should be added
         If rs("realOrPseudo") = "1" Or rs("realOrPseudo") = "2" Then
            If UserLang = ENGLISH Then
               cmbDeliveryBranchCode.AddItem rs("branchcode") & " - " & rs("englishname")
            Else
               cmbDeliveryBranchCode.AddItem rs("branchcode") & " - " & rs("arabicname")
            End If
         Else
            LogData "Branch code " & tCode & "  is not added to delivery branch code list since " & _
                    "the branch is defined as Pseudo branch "
         End If
      End If
   End If
   
   If cmbDeliveryBranchCode.ListCount > 0 Then
      cmbDeliveryBranchCode.ListIndex = 0
   End If

'   Set db = OpenDatabase(dbPath)
'   tCode = Mid$(txtAcctNo, 3, 3)
'   mQry = "select arabicname,englishname from bmledgerinfo " + _
'          "where ledgercode = '" + tCode + "'"
'
'   Set rs = db.OpenRecordset(mQry)
'   If rs.RecordCount > 0 Then
'      If UserLang = ARABIC Then
'         frmChequeBookRequest.txtName = tCode + "-" + rs(0)
'      Else
'         frmChequeBookRequest.txtName = tCode + "-" + rs(1)
'      End If
'   End If

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtNoOfChequeBook_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
