VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmEnquiry 
   BackColor       =   &H00BFD87E&
   Caption         =   "Static Data Maintenance"
   ClientHeight    =   8310
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   11850
   ControlBox      =   0   'False
   Icon            =   "frmCustomerSearch.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8310
   ScaleWidth      =   11850
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdGeneralCustomerStatus 
      Caption         =   "Customer opened through phone"
      Enabled         =   0   'False
      Height          =   375
      Left            =   9855
      TabIndex        =   39
      ToolTipText     =   "Customer opened through phone"
      Top             =   10335
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.TextBox txtMobileNo 
      Height          =   285
      Left            =   5085
      MaxLength       =   10
      TabIndex        =   6
      Top             =   2880
      Width           =   1455
   End
   Begin VB.CommandButton cmdReturnMail 
      Caption         =   "Returned mail Handling"
      Enabled         =   0   'False
      Height          =   375
      Left            =   12765
      TabIndex        =   22
      ToolTipText     =   "Returned mail handling"
      Top             =   10335
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.CommandButton cmdHistoricalStmt 
      Caption         =   "Historical Statement"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4455
      TabIndex        =   21
      ToolTipText     =   "Historical Statement for deleted accounts"
      Top             =   7230
      Width           =   2115
   End
   Begin VB.CommandButton cmdNameSearch 
      Caption         =   "Name Search"
      Height          =   375
      Left            =   11670
      TabIndex        =   37
      ToolTipText     =   "Search Name for TList"
      Top             =   9885
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton cmdBillEnq 
      Caption         =   "Utility Bill Enquiry"
      Enabled         =   0   'False
      Height          =   375
      Left            =   12375
      TabIndex        =   36
      ToolTipText     =   "Utility Bill Enquiry"
      Top             =   9375
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.TextBox txtSecondName 
      Height          =   285
      Left            =   5100
      MaxLength       =   15
      TabIndex        =   9
      Top             =   3840
      Width           =   2535
   End
   Begin VB.ComboBox cmbMainCategory 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      ItemData        =   "frmCustomerSearch.frx":030A
      Left            =   5085
      List            =   "frmCustomerSearch.frx":030C
      TabIndex        =   12
      Text            =   "cmbMainCategory"
      Top             =   5280
      Width           =   4215
   End
   Begin VB.CommandButton cmdCustomer 
      Caption         =   "&Customer"
      Default         =   -1  'True
      Height          =   375
      Left            =   2880
      TabIndex        =   15
      ToolTipText     =   "Customer"
      Top             =   6720
      Width           =   1335
   End
   Begin VB.ComboBox cmbSubCategory 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      ItemData        =   "frmCustomerSearch.frx":030E
      Left            =   5100
      List            =   "frmCustomerSearch.frx":0310
      TabIndex        =   13
      Text            =   "cmbSubCategory"
      Top             =   5760
      Width           =   4215
   End
   Begin VB.ComboBox cmbBranch 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      ItemData        =   "frmCustomerSearch.frx":0312
      Left            =   5085
      List            =   "frmCustomerSearch.frx":031F
      TabIndex        =   14
      Text            =   "cmbBranch"
      Top             =   6240
      Width           =   2535
   End
   Begin VB.TextBox txtCrNo 
      Height          =   285
      Left            =   5085
      MaxLength       =   15
      TabIndex        =   11
      Top             =   4800
      Width           =   2535
   End
   Begin VB.CommandButton cmdMerchant 
      Caption         =   "Merchant"
      Height          =   375
      Left            =   2880
      TabIndex        =   19
      ToolTipText     =   "Merchant Statement"
      Top             =   7215
      Width           =   1335
   End
   Begin VB.CommandButton cmdPenEnquiry 
      Caption         =   "Pension Enquiry"
      Enabled         =   0   'False
      Height          =   375
      Left            =   10305
      TabIndex        =   18
      ToolTipText     =   "Pension Enquiry"
      Top             =   9435
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.TextBox txtCardNumber 
      Height          =   285
      Left            =   5085
      MaxLength       =   19
      TabIndex        =   3
      Top             =   1440
      Width           =   1935
   End
   Begin VB.CommandButton cmdAtmCard 
      Caption         =   "ATM Cards"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5880
      TabIndex        =   17
      ToolTipText     =   "ATM Cards"
      Top             =   6720
      Width           =   1455
   End
   Begin VB.CommandButton cmdAcctInfo 
      Caption         =   "Account"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4440
      TabIndex        =   16
      ToolTipText     =   "Account"
      Top             =   6705
      Width           =   1335
   End
   Begin VB.TextBox txtAccountNumber 
      Height          =   285
      Left            =   5085
      MaxLength       =   16
      TabIndex        =   2
      Top             =   960
      Width           =   1965
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   360
      Top             =   720
   End
   Begin VB.TextBox txtLastName 
      Height          =   285
      Left            =   5085
      MaxLength       =   15
      TabIndex        =   10
      Top             =   4320
      Width           =   2535
   End
   Begin VB.TextBox txtPhoneExt 
      Height          =   285
      Left            =   7440
      TabIndex        =   7
      Top             =   2400
      Width           =   735
   End
   Begin VB.TextBox txtPhone 
      Height          =   285
      Left            =   5085
      TabIndex        =   5
      Top             =   2400
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      BackColor       =   &H00BFD87E&
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   7425
      MaskColor       =   &H00BFD87E&
      TabIndex        =   20
      ToolTipText     =   "Exit"
      Top             =   6720
      UseMaskColor    =   -1  'True
      Width           =   1335
   End
   Begin VB.TextBox txtFirstName 
      Height          =   285
      Left            =   5100
      MaxLength       =   15
      TabIndex        =   8
      Top             =   3360
      Width           =   2535
   End
   Begin VB.TextBox txtIdNo 
      Height          =   285
      Left            =   5085
      MaxLength       =   15
      TabIndex        =   4
      Top             =   1905
      Width           =   1935
   End
   Begin VB.TextBox txtCustomerNo 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "xxxxxxx"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   0
      EndProperty
      Height          =   285
      Left            =   5085
      MaxLength       =   8
      TabIndex        =   1
      Top             =   480
      Width           =   1290
   End
   Begin MSWinsockLib.Winsock tcpClient 
      Left            =   360
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   "ndev"
      RemotePort      =   8102
   End
   Begin VB.Label lblMobileNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Mobile Number"
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
      Left            =   2880
      TabIndex        =   38
      Top             =   2880
      Width           =   2175
   End
   Begin VB.Label lblSecondName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Second Name"
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
      Left            =   2880
      TabIndex        =   35
      Top             =   3840
      Width           =   2055
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Main Category"
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
      Left            =   2880
      TabIndex        =   34
      Top             =   5340
      Width           =   1845
   End
   Begin VB.Label lblSubCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Sub Category"
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
      Left            =   2880
      TabIndex        =   33
      Top             =   5775
      Width           =   1845
   End
   Begin VB.Label lblBranch 
      BackColor       =   &H00BFD87E&
      Caption         =   "Branch"
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
      Left            =   2880
      TabIndex        =   32
      Top             =   6240
      Width           =   1815
   End
   Begin VB.Label lblCompanyRegnNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Company Regn. No."
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
      Height          =   300
      Left            =   2880
      TabIndex        =   31
      Top             =   4800
      Width           =   2250
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00E0E0E0&
      BorderColor     =   &H00C00000&
      BorderStyle     =   6  'Inside Solid
      FillColor       =   &H00404040&
      Height          =   8295
      Left            =   1665
      Top             =   15
      Width           =   8295
   End
   Begin VB.Label lblCustomerNumber 
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
      Left            =   2880
      TabIndex        =   30
      Top             =   480
      Width           =   2055
   End
   Begin VB.Label lblEnquiryIdNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "ID  Number"
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
      Left            =   2880
      TabIndex        =   29
      Top             =   1920
      Width           =   2055
   End
   Begin VB.Label lblFirstName 
      BackColor       =   &H00BFD87E&
      Caption         =   "First Name"
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
      Left            =   2880
      TabIndex        =   28
      Top             =   3360
      Width           =   2055
   End
   Begin VB.Label lblPhone 
      BackColor       =   &H00BFD87E&
      Caption         =   "Home Phone No"
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
      Left            =   2880
      TabIndex        =   27
      Top             =   2400
      Width           =   2175
   End
   Begin VB.Label lblLastName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Last Name"
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
      Left            =   2880
      TabIndex        =   26
      Top             =   4320
      Width           =   2055
   End
   Begin VB.Label lblAccNumber 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account No"
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
      Left            =   2880
      TabIndex        =   25
      Top             =   960
      Width           =   2055
   End
   Begin VB.Label lblCardNumber 
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
      Left            =   2880
      TabIndex        =   24
      Top             =   1440
      Width           =   2055
   End
   Begin VB.Label lblExtn 
      BackColor       =   &H00BFD87E&
      Caption         =   "Extn"
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
      Left            =   6600
      TabIndex        =   23
      Top             =   2400
      Width           =   735
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11880
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Label lblEnquiryHead 
      BackColor       =   &H00BFD87E&
      Caption         =   "Enquiry Search Menu"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   3480
      TabIndex        =   0
      Top             =   0
      Width           =   6135
   End
   Begin VB.Menu mnuReport 
      Caption         =   "Report"
      Begin VB.Menu mnuCardActivityReport 
         Caption         =   "Report on ATM card activity for the current date"
      End
      Begin VB.Menu mnuAtmPinReport 
         Caption         =   "Report on ATM pin select activity for the current date"
      End
   End
   Begin VB.Menu mnuCSO 
      Caption         =   "Customer Service"
      Begin VB.Menu mnuCardPendingActionCso 
         Caption         =   "Card Entries Pending Actions"
      End
      Begin VB.Menu mnuAtmCardFromFinacle 
         Caption         =   "ATM Cards requested through Finacle"
      End
      Begin VB.Menu mnuChangePassword 
         Caption         =   "Change Password"
      End
      Begin VB.Menu mnuChangeScreenLangCso 
         Caption         =   "Change screen language"
      End
   End
   Begin VB.Menu mnuSupervisor 
      Caption         =   "Supervisor"
      Begin VB.Menu mnuCardPendingActivitySup 
         Caption         =   "Card Entries Pending Activities"
      End
      Begin VB.Menu mnuAccOpeningCardPrint 
         Caption         =   "Print Account opening Card"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
      Begin VB.Menu mnuSupChangePassword 
         Caption         =   "Change Password"
      End
      Begin VB.Menu mnuChangeScreenLangSupervisor 
         Caption         =   "Change Screen Language"
      End
      Begin VB.Menu mnuCompactLocalDB 
         Caption         =   "Compact Local Database"
      End
      Begin VB.Menu mnuRefreshLocalDB 
         Caption         =   "Refresh Local Database"
         Begin VB.Menu mnuPartialRefresh 
            Caption         =   "Partial Refresh"
         End
         Begin VB.Menu mnuFullRefresh 
            Caption         =   "Full Refresh"
         End
      End
   End
   Begin VB.Menu mnuCardProdn 
      Caption         =   "Card Production Centre"
      Begin VB.Menu mnuUpdateStatus 
         Caption         =   "Update status from Card production"
      End
   End
   Begin VB.Menu mnuAbout 
      Caption         =   "About"
      Begin VB.Menu mnuAboutCSD 
         Caption         =   "About CSD"
      End
   End
End
Attribute VB_Name = "frmEnquiry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public page As Integer
Dim lines As Integer
Public textStream, tStream As Object
Public fsys As Object
Public langChar As String
Private Sub cmbBranch_Change()
   If Len(RTrim(cmbBranch)) > 0 Then
      txtCustomerNo.text = ""
      txtIdNo = ""
      txtPhone = ""
      txtPhoneExt = ""
      txtFirstName = ""
      txtSecondName = ""
      txtLastName = ""
      txtMobileNo = ""
      txtCardNumber = ""
      txtAccountNumber = ""
      cmbMainCategory.text = ""
      cmbSubCategory.text = ""
   End If
End Sub

Private Sub cmbBranch_Click()
   If Len(RTrim(cmbBranch)) > 0 Then
      txtCustomerNo.text = ""
      txtIdNo = ""
      txtPhone = ""
      txtPhoneExt = ""
      txtFirstName = ""
      txtSecondName = ""
      txtLastName = ""
      txtCardNumber = ""
      txtAccountNumber = ""
      cmbMainCategory.text = ""
      cmbSubCategory.text = ""
   End If
End Sub

Private Sub cmbBranch_LostFocus()
Dim i As Integer
   Dim tCode As String
   If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
   Else
       On Error Resume Next
       If Len(RTrim(cmbBranch.text)) <> 0 Then
          tCode = Mid$(cmbBranch.text, 1, 4)
          For i = 0 To cmbBranch.ListCount
              If Mid$(cmbBranch.List(i), 1, 4) = tCode Then
                 cmbBranch.ListIndex = i
                 Exit For
              End If
           Next i
       End If
            
       If i > cmbBranch.ListCount Then
          MsgBox errInvalidBranchCode(UserLang)  '"Invalid Branch Code...Please re-enter.."
          cmbBranch.SetFocus
       End If
  End If
  On Error GoTo 0
   

End Sub

Private Sub cmbMainCategory_Change()
    If Len(RTrim(cmbMainCategory)) > 0 Then
       txtCustomerNo = ""
       txtIdNo = ""
       txtCrNo = ""
       txtPhone = ""
       txtFirstName = ""
       txtSecondName = ""
       txtPhoneExt = ""
       txtCardNumber = ""
       txtMobileNo = ""
       txtAccountNumber = ""
       cmbBranch.text = ""
    End If
End Sub

Private Sub cmbMainCategory_Click()
    If Len(RTrim(cmbMainCategory)) > 0 Then
       txtCustomerNo = ""
       txtIdNo = ""
       txtCrNo = ""
       txtPhone = ""
       txtFirstName = ""
       txtSecondName = ""
       txtPhoneExt = ""
       txtCardNumber = ""
       txtAccountNumber = ""
       cmbBranch.text = ""
    End If
End Sub

Private Sub cmbMainCategory_LostFocus()
Dim i As Integer
Dim tCode As String


If Screen.ActiveControl.Name = "cmdCancel" Then
    DoEvents
Else
   On Error Resume Next
   If Len(RTrim(cmbMainCategory.text)) <> 0 Then
      tCode = Mid$(cmbMainCategory.text, 1, 2)
      For i = 0 To cmbMainCategory.ListCount
          If Mid$(cmbMainCategory.List(i), 1, 2) = tCode Then
             cmbMainCategory.ListIndex = i
             Exit For
          End If
      Next i
   End If
   If i > cmbMainCategory.ListCount Then
      MsgBox errInvalidMainCategory(UserLang)
      cmbMainCategory.SetFocus
   End If
 End If
 On Error GoTo 0


End Sub

Private Sub cmbSubCategory_Change()
    If Len(RTrim(cmbSubCategory)) > 0 Then
       If Len(RTrim(cmbMainCategory)) = 0 Then
          MsgBox errSelectMainCategoryFirst(UserLang)
          cmbSubCategory.text = ""
          Exit Sub
       End If
       txtCustomerNo = ""
       txtIdNo = ""
       txtCrNo = ""
       txtPhone = ""
       txtFirstName = ""
       txtSecondName = ""
       txtPhoneExt = ""
       txtMobileNo = ""
       txtCardNumber = ""
       txtAccountNumber = ""
       cmbBranch.text = ""
    End If
End Sub

Private Sub cmbSubCategory_Click()
    If Len(RTrim(cmbSubCategory)) > 0 Then
       If Len(RTrim(cmbMainCategory)) = 0 Then
          MsgBox errSelectMainCategoryFirst(UserLang)
          cmbSubCategory.text = ""
          Exit Sub
       End If
       txtCustomerNo = ""
       txtIdNo = ""
       txtCrNo = ""
       txtPhone = ""
       txtFirstName = ""
       txtSecondName = ""
       txtPhoneExt = ""
       txtCardNumber = ""
       txtAccountNumber = ""
       cmbBranch.text = ""
    End If

End Sub

Private Sub cmbSubCategory_LostFocus()
Dim i As Integer
Dim tCode As String

If Screen.ActiveControl.Name = "cmdCancel" Then
    DoEvents
Else
   On Error Resume Next
   If Len(RTrim(cmbSubCategory.text)) <> 0 Then
      tCode = Mid$(cmbSubCategory.text, 1, 2)
      For i = 0 To cmbSubCategory.ListCount
          If Mid$(cmbSubCategory.List(i), 1, 2) = tCode Then
             cmbSubCategory.ListIndex = i
             Exit For
          End If
      Next i
   End If
   If i > cmbSubCategory.ListCount Then
      MsgBox errInvalidSubCategory(UserLang)
      cmbSubCategory.SetFocus
   End If
 End If
 On Error GoTo 0
End Sub

Private Sub cmdAcctInfo_Click()
   If Len(RTrim(txtCustomerNo)) = 0 And _
      Len(RTrim(txtAccountNumber)) = 0 And _
      Len(RTrim(txtCardNumber)) = 0 Then
      MsgBox errInvalidSearchCriteria(UserLang)
      Exit Sub
   End If
   
   MsgBox errBmNotice(UserLang)   '"The information being fetched from BANKMASTER as on Cut-over Date; NOT FROM FINACLE "
   
   If doAccSearch("00000") = "-0001" Then
      Exit Sub
   End If
   If recvAccSearchMsg.status <> "000" Then
      Exit Sub
   End If
   If UserLang = ARABIC Then
      ChangePositions frmAccountGrid, 11800
      frmAccountGrid.RightToLeft = True
      frmAccountGrid.lblCustNo.RightToLeft = True
      frmAccountGrid.lblCustName.RightToLeft = True
      frmAccountGrid.txtCustNo.RightToLeft = True
      frmAccountGrid.txtCustName.RightToLeft = True
      frmAccountGrid.txtCustName.Alignment = 1
      frmAccountGrid.txtCustNo.Alignment = 1
    End If
   frmAccountGrid.Show
End Sub

Private Sub cmdAcctInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdAtmCard_Click()
  If Len(RTrim(txtCustomerNo)) = 0 And _
     Len(RTrim(txtAccountNumber)) = 0 And _
     Len(RTrim(txtCardNumber)) = 0 Then
     MsgBox errInvalidSearchCriteria(UserLang)
     Exit Sub
  End If
  If searchCard("00000") = "-0001" Then
     Exit Sub
  End If
  If recvCardSearchMsg.status <> "000" Then
     Exit Sub
  End If
'  gCardCustNo = recvCardSearchMsg.custNo
'  gcardECustname = recvCardSearchMsg.eShortName
'  gCardACustName = recvCardSearchMsg.aShortName
'  gCardCustBrCode = recvCardSearchMsg.custBranchCode
  If UserLang = ARABIC Then
     ChangePositions frmCardGrid, 12000
     frmCardGrid.RightToLeft = True
     frmCardGrid.lblCustNo.RightToLeft = True
     frmCardGrid.lblCustName.RightToLeft = True
     frmCardGrid.txtCustNo.RightToLeft = True
     frmCardGrid.txtCustName.RightToLeft = True
     frmCardGrid.txtCustName.Alignment = 1
     frmCardGrid.txtCustNo.Alignment = 1
  End If
  frmCardGrid.Show
End Sub

Private Sub cmdAtmCard_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdBillEnq_Click()
    Dim tCode As String
    Dim i As Integer
    If Len(RTrim(frmEnquiry.txtCustomerNo)) > 0 Or _
       Len(RTrim(frmEnquiry.txtAccountNumber)) > 0 Then
       doSearch ("00000")
       If recvSearchMsg.status <> "000" Then
          Exit Sub
       End If
       If recvSearchMsg.noOfRecs > "00" Then
          'The following lines are used for utility bill enquiry for new version
          frmSadadMain.txtCustName = recvSearchMsg.details(1).shortName
          frmSadadMain.txtIdNumber = recvSearchMsg.details(1).idNo
          tCode = recvSearchMsg.details(1).idType
          If Len(RTrim(tCode)) <> 0 Then
             For i = 0 To frmSadadMain.cmbIdType.ListCount
                 If Mid$(frmSadadMain.cmbIdType.List(i), 1, 1) = tCode Then
                    frmSadadMain.cmbIdType.ListIndex = i
                    Exit For
                 End If
             Next i
          End If
       Else
          frmSadadMain.cmbIdType.ListIndex = -1
       End If
       If i > frmSadadMain.cmbIdType.ListCount Then
          frmSadadMain.cmbIdType.ListIndex = -1
       End If
       If Len(RTrim(frmEnquiry.txtCustomerNo)) <> 0 Then
          frmSadadMain.txtCustomerNo = frmEnquiry.txtCustomerNo
       ElseIf Len(RTrim(frmEnquiry.txtAccountNumber)) <> 0 Then
          frmSadadMain.txtCustomerNo = Mid$(frmEnquiry.txtAccountNumber, 6, 7)
       End If
    End If
    frmSadadMain.Show
      
    'The following single line will be used for utility bill enquiry for old version
    'frmBillEnquiry.Show
'        frmBillEnquiry.txtCustName = recvSearchMsg.details(1).shortName
'          frmBillEnquiry.txtIdNumber = recvSearchMsg.details(1).idNo
'          tCode = recvSearchMsg.details(1).idType
'          If Len(RTrim(tCode)) <> 0 Then
'             For i = 0 To frmBillEnquiry.cmbIdType.ListCount
'                 If Mid(frmBillEnquiry.cmbIdType.List(i), 1, 1) = tCode Then
'                    frmBillEnquiry.cmbIdType.ListIndex = i
'                    Exit For
'                 End If
'             Next i
'          Else
'             frmBillEnquiry.cmbIdType.ListIndex = -1
'          End If
'          If i > frmBillEnquiry.cmbIdType.ListCount Then
'             frmBillEnquiry.cmbIdType.ListIndex = -1
'          End If
'       End If
'    End If
'    If Len(RTrim(frmEnquiry.txtCustomerNo)) <> 0 Then
'       frmBillEnquiry.txtCustomerNo = frmEnquiry.txtCustomerNo
'    ElseIf Len(RTrim(frmEnquiry.txtAccountNumber)) <> 0 Then
'       frmBillEnquiry.txtCustomerNo = Mid$(frmEnquiry.txtAccountNumber, 6, 7)
'    End If
       
End Sub

Private Sub cmdBillEnq_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdCancel_Click()
   Dim strmsglen As String
   SendMsg = "000090" & "63" & gBranchCode & Format(gUserId, "!@@@@@@@@@@")
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   CSD_mdiForm.staticStatus.Panels(3).text = errLoggingOut(UserLang)
   frmEnquiry.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmEnquiry.MousePointer = vbNormal
      Exit Sub
   End If
   cmdCustomer.Enabled = False
   cmdAcctInfo.Enabled = False
   cmdAtmCard.Enabled = False
   cmdMerchant.Enabled = False
   cmdPenEnquiry.Enabled = False
   cmdBillEnq.Enabled = False
   cmdNameSearch.Enabled = False
   cmdHistoricalStmt.Enabled = False
   cmdReturnMail.Enabled = False
   cmdGeneralCustomerStatus.Enabled = False
   frmEnquiry.MousePointer = vbHourglass
   delay (1.5)
   frmEnquiry.MousePointer = vbNormal
   CSD_mdiForm.staticStatus.Panels(3).text = "          "
   CSD_mdiForm.staticStatus.Panels(4).text = "          "
   userLoggedIn = False
   tcpClient.Close
   Unload Me
End Sub

Private Sub cmdCustHistory_Click()
    frmCustUpdateHistory.Show
End Sub

Private Sub cmdCancel_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdCustomer_Click()
   If Len(RTrim(txtCustomerNo)) = 0 And _
      Len(RTrim(txtIdNo)) = 0 And _
      Len(RTrim(txtPhone)) = 0 And _
      Len(RTrim(txtFirstName)) = 0 And _
      Len(Trim(txtSecondName)) = 0 And _
      Len(RTrim(txtLastName)) = 0 And _
      Len(RTrim(txtAccountNumber)) = 0 And _
      Len(RTrim(cmbMainCategory)) = 0 And _
      Len(RTrim(cmbSubCategory)) = 0 And _
      Len(RTrim(cmbBranch)) = 0 And _
      Len(RTrim(txtCrNo)) = 0 And _
      Len(RTrim(txtCardNumber)) = 0 And _
      Len(RTrim(txtMobileNo)) = 0 Then
      MsgBox errInvalidSearchCriteria(UserLang)
      Exit Sub
   End If
   
   MsgBox errBmNotice(UserLang)   '"The information being fetched from BANKMASTER as on Cut-over Date; NOT FROM FINACLE "
      
   doSearch ("00000")
   If recvSearchMsg.status <> "000" Then
      Exit Sub
   End If
   searchAction = True
   
   updateAction = False
   supervisorAction = False
   tellerAction = False
   custHistoryAction = False
      
   If UserLang = ARABIC Then
      ChangePositions frmEnquirySelect, 11800
      frmEnquirySelect.RightToLeft = True
   End If
   If Len(RTrim(txtCustomerNo)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(2, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Trim(txtCustomerNo)
   ElseIf Len(RTrim(txtAccountNumber)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(26, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Trim(txtAccountNumber)
   ElseIf Len(RTrim(txtCardNumber)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(24, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = maskCardNo(Trim(txtCardNumber))
   ElseIf Len(RTrim(txtIdNo)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(4, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Trim(txtIdNo)
   ElseIf Len(RTrim(txtPhone)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(5, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Trim(txtPhone)
      If Len(RTrim(txtPhoneExt)) <> 0 Then
         frmEnquirySelect.txtSearchCriteria = Trim(txtPhone) & "-" & Trim(txtPhoneExt)
      End If
   ElseIf Len(RTrim(txtMobileNo)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(25, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Trim(txtMobileNo)
   ElseIf Len(RTrim(txtFirstName)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(7, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Trim(txtFirstName)
      If Len(RTrim(txtSecondName)) <> 0 Then
         frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(7, UserLang) & _
                                                      "+" & frmEnquirySelectCaption(8, UserLang)
         frmEnquirySelect.txtSearchCriteria.text = Trim(txtFirstName) & "+" & _
                                                   Trim(txtSecondName)
      End If
      
      If Len(RTrim(txtLastName)) <> 0 Then
         frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelect.lblSearchCriteria.Caption & _
                                                      "+" & frmEnquirySelectCaption(9, UserLang)
         frmEnquirySelect.txtSearchCriteria.text = frmEnquirySelect.txtSearchCriteria.text & _
                                                   "+" & Trim(txtLastName)
      End If
   ElseIf Len(RTrim(txtSecondName)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(8, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Trim(txtSecondName)
      If Len(RTrim(txtLastName)) <> 0 Then
         frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(8, UserLang) & _
                                                      "+" & frmEnquirySelectCaption(9, UserLang)
         frmEnquirySelect.txtSearchCriteria.text = Trim(txtSecondName) & "+" & _
                                                   Trim(txtLastName)
      End If
  ElseIf Len(RTrim(txtLastName)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(9, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Trim(txtLastName)
  ElseIf Len(RTrim(cmbBranch)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(11, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Mid$(cmbBranch, 1, 4)
  ElseIf Len(RTrim(cmbMainCategory)) <> 0 Then
      frmEnquirySelect.lblSearchCriteria.Caption = frmEnquirySelectCaption(12, UserLang) & _
                                                   "+" & frmEnquirySelectCaption(13, UserLang)
      frmEnquirySelect.txtSearchCriteria.text = Mid$(cmbMainCategory, 1, 2) & "+" & _
                                                Mid$(cmbSubCategory, 1, 2)
  End If
  frmEnquirySelect.Show
End Sub

Private Sub cmdEnquiry_Click()
   If Len(RTrim(txtCustomerNo)) = 0 And _
      Len(RTrim(txtIdNo)) = 0 And _
      Len(RTrim(txtPhone)) = 0 And Len(RTrim(txtFirstName)) = 0 And _
      Len(RTrim(txtLastName)) = 0 And _
      Len(RTrim(txtAccountNumber)) = 0 Then
      LogData errInvalidSearchCriteria(1)
      MsgBox errInvalidSearchCriteria(UserLang)
      Exit Sub
   End If
   searchAction = True
   updateAction = False
   supervisorAction = False
   tellerAction = False
   custHistoryAction = False
   doSearch ("00000")
   If UserLang = ARABIC Then
      ChangePositions frmEnquirySelect, 11800
      frmEnquirySelect.RightToLeft = True
   End If
   frmEnquirySelect.Show
End Sub

Private Sub cmdCustomer_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdGeneralCustomerStatus_Click()
    'MsgBox "—ﬁ„ «·Õ”«» ÂÊ:67008502656000" & Chr$(13) & errIban(0) & Chr$(253) + ":" + Chr$(253) + "SA2830300067008502656000"
    frmGeneralCustStatus.Show
End Sub

Private Sub cmdHistoricalStmt_Click()
    frmHistStmt.Show
    frmHistStmt.tag = "D" ' historical statement for deleted accounts
    If InStr(recvLoginMsg.authorityLevel, "~87") > 0 Then
       frmHistStmt.txtAccNo.Enabled = True
    End If
End Sub

Private Sub cmdMerchant_Click()
    On Error GoTo err_handler
    frmEnquiry.MousePointer = vbHourglass
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang) '"Loading form...Please wait"
    frmMerchantStmt.Show
    frmEnquiry.MousePointer = vbNormal
    frmEnquiry.Enabled = True
    CSD_mdiForm.staticStatus.Panels(3).text = "                         "
    On Error GoTo 0
    Exit Sub
err_handler:
    frmEnquiry.MousePointer = vbNormal
    frmEnquiry.Enabled = True
    CSD_mdiForm.staticStatus.Panels(3).text = "                         "
    Exit Sub
End Sub

Private Sub cmdNewCustomer_Click()
    Dim tCode As String, mQry As String
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang) '"Loading form...Please wait"
    custHistoryAction = False
    supervisorAction = False
    tellerAction = False
    searchAction = False
    updateAction = False
    noOfJoint = "0"
    frmEnquiry.MousePointer = vbHourglass
    frmCustomer.Show
    frmCustomer.cmbBranchCode = gBranchCode
    tCode = gBranchCode
    
    mQry = "select arabicname, englishname from branchinfo " + _
           "where branchcode = '" + tCode + "'"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmCustomer.cmbBranchCode = tCode + "-" + rs(0)
       Else
          frmCustomer.cmbBranchCode = tCode + "-" + rs(1)
       End If
    Else
       frmCustomer.cmbBranchCode.text = tCode + "Not defined in local"
    End If
    
    If recvLoginMsg.globalUpdatePriv = "1" Then   ' MISYS
       frmCustomer.cmbBranchCode.Enabled = True
    End If
           
    If recvLoginMsg.globalUpdatePriv = "2" Then   ' MISYS
       If recvLoginMsg.mainBrEditAllowed = "1" Then
          frmCustomer.cmbBranchCode.Enabled = True
       End If
    End If

    frmEnquiry.MousePointer = vbDefault
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
End Sub

Private Sub cmdMerchant_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdNameSearch_Click()
    frmSearchEngine.txtName.Enabled = True
    frmSearchEngine.cmdSearch.Enabled = True
    frmSearchEngine.Show vbModal
End Sub

Private Sub cmdPenEnquiry_Click()
    frmPensionEnquiry.Show
    If Len(RTrim(frmEnquiry.txtIdNo)) > 0 Then
       frmPensionEnquiry.txtIdNo = frmEnquiry.txtIdNo
    End If
    If Len(RTrim(frmEnquiry.txtAccountNumber)) > 0 Then
       frmPensionEnquiry.txtPenAccNo = frmEnquiry.txtAccountNumber
    End If
End Sub

Private Sub cmdtest_Click()

      'frmIndividualJoint.Show
      'frmIndividualSaudi2.Show
      frmJuristicOwner.Show
  
'    SendMsg = "000000" & "19" & gBranchCode & String(1000, "A") & String(1000, "B") & String(1000, "C") & _
'              String(1000, "D") & String(1000, "E") & String(1000, "F") & String(4000, "G")
'
'    strmsglen = Format(Len(SendMsg), "000000")
'    Mid$(SendMsg, 1, 6) = strmsglen
'    DataReceivedFlag = False
'    frmEnquiry.MousePointer = vbHourglass
'
'    reterr = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)

'    MsgBox "12345" & String(3, "0")

'    Dim str1 As String * 100
'
'    str1 = "RAJESH"
'    MsgBox Len(Trim(str1))

'  Printer.Orientation = 2
'  Printer.FontName = "Track 1 - Magnetic stripe"
'  Printer.Print track1
'  Printer.FontName = "Track 2 - Magnetic stripe"
'  Printer.Print track2
          
'  cardNo = "4550360150013582"
'  cardExpiryDate = "200403"
'  branchCode = "131"
'  nameOnTheCard = "ALIGNMENT TESTING"
'
'
'  Printer.Orientation = 2
'  Printer.Print
'  Printer.Print
'  Printer.Font = "Arial"
'  Printer.FontBold = False
'  Printer.Print
'  Printer.Print
'  Printer.Print
'  Printer.Print
'  Printer.Print
'  Printer.FontSize = 18
'  If Len(Trim(cardNo)) >= 19 Then
'     Printer.Print "     " + Mid$(cardNo, 1, 7) + "  " + _
'                             Mid$(cardNo, 8, 8) + "  " + _
'                             Mid$(cardNo, 16, 4)
'     Printer.Print "     "
'     Printer.FontSize = 12
'     Printer.FontBold = False
'     Printer.Print "             " + Mid$(cardExpiryDate, 5, 2) + " / " + _
'                                     Mid$(cardExpiryDate, 3, 2) + _
'                 "                            " + Mid$(branchCode, 2, 3)
'  Else
'     Printer.Print "    " + Mid$(cardNo, 1, 4) + "  " + _
'                            Mid$(cardNo, 5, 4) + "  " + _
'                            Mid$(cardNo, 9, 4) + "  " + _
'                            Mid$(cardNo, 13, 4)
'     Printer.FontSize = 7
'     Printer.Print "           "
'     Printer.FontSize = 12
'     Printer.FontBold = False
'     Printer.Print "                                 " + Mid$(cardExpiryDate, 5, 2) + " / " + _
'                                                             Mid$(cardExpiryDate, 3, 2)
'     Printer.Print "                                            " + branchCode
'
'  End If
'
'  Printer.FontBold = True
'  Printer.FontSize = 9
'  Printer.Print "       " + nameOnTheCard
'  Printer.EndDoc
'
'  delay (15)



'    frmPrintingCard.Show vbModal
  
End Sub

Private Sub cmdUpdate_Click()
   If Len(RTrim(txtCustomerNo)) = 0 And _
      Len(RTrim(txtIdNo)) = 0 And _
      Len(RTrim(txtPhone)) = 0 And Len(RTrim(txtFirstName)) = 0 And _
      Len(RTrim(txtLastName)) = 0 And _
      Len(RTrim(txtAccountNumber)) = 0 Then
      MsgBox errInvalidSearchCriteria(UserLang)
      Exit Sub
   End If
   updateAction = True
   searchAction = False
   supervisorAction = False
   tellerAction = False
   custHistoryAction = False
   doSearch ("00000")
   If UserLang = ARABIC Then
      ChangePositions frmEnquirySelect, 11800
      frmEnquirySelect.RightToLeft = True
   End If
   noOfJoint = "0"
   frmEnquirySelect.Show
End Sub

Private Sub Command1_Click()
    Dim i As Integer
'   For i = 28 To 5000
'       mQry = "insert into transinfo (seqno, userId, postdate, valuedate, transtype, transamt,narrative1, narrative2, narrative3,cfbalance,refno,supervisorid, transctr, statementflag) " & _
'                                      "values (" & i & ",'ATM' ,'20020523','20020523','79','-0000050000','WITHDRAWAL -ATM - OTHERS ','8888007692RG30  2200523  ',  " & _
'                                              "'101 OMAR MUKHTAR BR. ','4184237','9991050380',  " & _
'                                              "'ATM','00004','0')"
'        db.Execute (mQry)
'    Next
    DBEngine.RepairDatabase (dbPath)
    MsgBox "done"
End Sub

Private Sub Command6_Click()

End Sub

Private Sub cmdPenEnquiry_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdReturnMail_Click()
    Dim tCustNo As String
    tCustNo = Space(7)
    If Len(Trim(txtCustomerNo)) > 0 Then
       tCustNo = Format(txtCustomerNo, "0000000")
    End If
    If Len(Trim(txtAccountNumber)) > 0 Then
       tCustNo = Mid$(txtAccountNumber, 6, 7)
    End If
    If Len(Trim(tCustNo)) <> 0 Then
       frmReturnMailPendingList.tag = "S" ' specific customer enquiry
       frmReturnMailPendingList.Caption = frmReturnedMailPendingListCaption(4, UserLang)  ' "List of returned mails for specific customer "
       frmReturnMailPendingList.lblPendingReturnMails = frmReturnedMailPendingListCaption(4, UserLang)   '"List of returned mails for specific customer "
       frmReturnMailPendingList.lblCustomerNo.Visible = True
       frmReturnMailPendingList.lblCustomerNo.Refresh
       frmReturnMailPendingList.txtCustomerNo.Visible = True
       frmReturnMailPendingList.txtCustomerNo.Refresh
       frmReturnMailPendingList.cmdCheckPendingMails.Visible = True
       frmReturnMailPendingList.cmdCheckPendingMails.Refresh
       frmReturnMailPendingList.txtCustomerNo = tCustNo
       frmReturnMailPendingList.readRetMailPendingList "00000", "S", tCustNo
       frmReturnMailPendingList.fillRetMailPendingListForm
       frmReturnMailPendingList.Show
    Else
       frmMailDetail.Show
    End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
  readCfgFile
  If ConnectServer(tcpClient, Timer1, hostName, port) = LocalCommsError Then
     Unload Me
     LogData "Could not connect to static server.."
     frmLogin.Show
     Timer1.Interval = 0 'deactivate the timer
     Exit Sub
  End If
  Timer1.Interval = 0 'deactivate the timer
  Me.Show
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
   tcpClient.Close
End Sub

Private Sub mnuAboutCSD_Click()
   frmAbout.Show vbModal
End Sub

Private Sub mnuAccOpeningCardPrint_Click()
  frmPrintAccOpeningCard.frameAccountInput.Enabled = True
  frmPrintAccOpeningCard.frameAccountInput.Visible = True
  frmPrintAccOpeningCard.frameAccountInput.Refresh
  frmPrintAccOpeningCard.cmdFetchDetails.Enabled = True
  frmPrintAccOpeningCard.cmdFetchDetails.Visible = True
  frmPrintAccOpeningCard.cmdFetchDetails.Refresh
  frmPrintAccOpeningCard.cmdOk.Enabled = False
  
  frmPrintAccOpeningCard.Show vbModal
End Sub

Private Sub mnuAccountPendingActionCso_Click()
   accSearchAction = False
   accUpdateAction = False
   accSupervisorAction = False
   accTellerAction = True
   accHistoryAction = False
   frmEnquiry.readAccPendingList "00000", "T", Space(7)
   If UserLang = ARABIC Then
      'ChangePositions frmAcctPendingList, 11800
      'frmAcctPendingList.RightToLeft = True
   End If
   'frmAcctPendingList.Show
End Sub

Private Sub mnuAccountPendingActivitySup_Click()
'   accSupervisorAction = True
'   accTellerAction = False
'   accSearchAction = False
'   accUpdateAction = False
'   accHistoryAction = False
'   frmEnquiry.readAccPendingList "00000", "S", Space(7)
'   If UserLang = ARABIC Then
'      ChangePositions frmAcctPendingList, 12000
'      frmAcctPendingList.RightToLeft = True
'   End If
'   frmAcctPendingList.Show
End Sub

Private Sub mnuAcctBlockPendingCso_Click()
   blockSupervisorAction = False
   blockTellerAction = True
   CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdCustomer.Enabled = False
   frmEnquiry.MousePointer = vbHourglass
   readBlockPendingList "00000", "T", "A", Space(7)
   If UserLang = ARABIC Then
      'ChangePositions frmManualBlkPendingList, 11800
      'frmManualBlkPendingList.RightToLeft = True
      'frmManualBlkPendingList.Hide
   End If
   'frmManualBlkPendingList.Show
   'frmManualBlkPendingList.tag = "A"
   frmEnquiry.cmdCancel.Enabled = True
   frmEnquiry.cmdCustomer.Enabled = True
   frmEnquiry.MousePointer = vbDefault
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
   'frmManualBlkPendingList.Show
End Sub

Private Sub mnuAcctBlockPendingSup_Click()
   blockSupervisorAction = True
   blockTellerAction = False
   CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdCustomer.Enabled = False
   frmEnquiry.MousePointer = vbHourglass
   readBlockPendingList "00000", "S", "A", Space(7)
   If UserLang = ARABIC Then
      'ChangePositions frmManualBlkPendingList, 11800
      'frmManualBlkPendingList.RightToLeft = True
      'frmManualBlkPendingList.Hide
   End If
   'frmManualBlkPendingList.Show
   'frmManualBlkPendingList.tag = "A"
   frmEnquiry.cmdCancel.Enabled = True
   frmEnquiry.cmdCustomer.Enabled = True
   frmEnquiry.MousePointer = vbDefault
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
   'frmManualBlkPendingList.Show
End Sub

Private Sub mnuApprovalFromSupervisor_Click()
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
   sadadSupervisorAction = False
   sadadTellerAction = True
   readSadadReversalPendingList "00000", "T", Space(10)
   If UserLang = ARABIC Then
      'ChangePositions frmSadadReversalPendingList, 11800
      'frmSadadReversalPendingList.RightToLeft = True
   End If
   'frmSadadReversalPendingList.Show
End Sub

Private Sub mnuAtmCardFromFinacle_Click()
    activityFlag = "F" ' Card request from finacle
    branchActionDateTime = Space(14)
    cbsCardCreationAction = True
    cardTellerAction = False
    cardSupervisorAction = False
    cardSearchAction = False
    cardUpdateAction = False
    cardHistoryAction = False
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.MousePointer = vbHourglass
    readCardPendingList "00000", "C", Space(7)
    If UserLang = ARABIC Then
       ChangePositions frmCardPendingList, 11800
       frmCardPendingList.RightToLeft = True
       frmCardPendingList.Hide
    End If
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.MousePointer = vbDefault
    CSD_mdiForm.staticStatus.Panels(3).text = errSelectCriteria(UserLang) '"Select any of the criteria"
    frmCardPendingList.Show
End Sub

Private Sub mnuAtmPinReport_Click()
    Dim strmsglen As String
    
    SendMsg = "000000" & "AL" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & "00000" & recvLoginMsg.bankingDate & "P" & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass

    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       Exit Sub
    End If
    frmEnquiry.MousePointer = vbDefault

    parsePinActivityReportDetails
    
    If recvPinActivityReport.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvPinActivityReport.aRemarks
       Else
          MsgBox recvPinActivityReport.eRemarks
       End If
       Exit Sub
    End If
    page = 1
    generatePinActivityReport
End Sub

Private Sub mnuCardActivityReport_Click()
    Dim strmsglen As String
    
    SendMsg = "000000" & "AL" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & "00000" & recvLoginMsg.bankingDate & "C" & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass

    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       Exit Sub
    End If
    frmEnquiry.MousePointer = vbDefault

    parseCardActivityReportDetails

    If recvCardActivityReport.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCardActivityReport.aRemarks
       Else
          MsgBox recvCardActivityReport.eRemarks
       End If
       Exit Sub
    End If
    page = 1
    generateCardActivityReport
End Sub

Private Sub mnuCardPendingActionCso_Click()
   cardTellerAction = True
   cardSupervisorAction = False
   cardSearchAction = False
   cardUpdateAction = False
   cardHistoryAction = False
   cbsCardCreationAction = False
   readCardPendingList "00000", "T", Space(7)
   If UserLang = ARABIC Then
      ChangePositions frmCardPendingList, 11800
      frmCardPendingList.RightToLeft = True
      frmCardPendingList.Hide
    End If
   frmCardPendingList.Show
End Sub

Private Sub mnuCardPendingActivitySup_Click()
   cardSupervisorAction = True
   cardTellerAction = False
   cardSearchAction = False
   cardUpdateAction = False
   cardHistoryAction = False
   cbsCardCreationAction = False
   CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdCustomer.Enabled = False
   frmEnquiry.MousePointer = vbHourglass
   readCardPendingList "00000", "S", Space(7)
   If UserLang = ARABIC Then
      ChangePositions frmCardPendingList, 11800
      frmCardPendingList.RightToLeft = True
      frmCardPendingList.Hide
   End If
   frmCardPendingList.Show
   frmEnquiry.cmdCancel.Enabled = True
   frmEnquiry.cmdCustomer.Enabled = True
   frmEnquiry.MousePointer = vbDefault
   CSD_mdiForm.staticStatus.Panels(3).text = errSelectCriteria(UserLang) '"Select any of the criteria"
   frmCardPendingList.Show
End Sub

Private Sub mnuChangePassword_Click()
   passwordChange = True
   frmChangePassword.Show vbModal
End Sub

Private Sub mnuChangePasswordChiefTeller_Click()
    passwordChange = True
   frmChangePassword.Show vbModal
End Sub

Private Sub mnuChangePasswordTeller_Click()
   passwordChange = True
   frmChangePassword.Show vbModal
End Sub

Private Sub mnuChangeScreenLangChiefTeller_Click()
    frmChangeScreenLang.Show vbModal
End Sub

Private Sub mnuChangeScreenLangCso_Click()
    frmChangeScreenLang.Show vbModal
End Sub

Private Sub mnuChangeScreenLangSupervisor_Click()
    frmChangeScreenLang.Show vbModal
End Sub

Private Sub mnuChangeScreenLangTeller_Click()
    frmChangeScreenLang.Show vbModal
End Sub

Private Sub mnuChequeBookReport_Click()
    frmChequeBookReport.Show vbModal
End Sub

Private Sub mnuCompactLocalDB_Click()
    Dim fso As Object
    Set fso = CreateObject("Scripting.FileSystemObject")
    If (Not fso.FolderExists("c:\temp")) Then
       fso.CreateFolder ("c:\temp")
    End If
    On Error Resume Next
    db.Close
    transDb.Close
    On Error GoTo 0
    frmEnquiry.Enabled = False
    frmEnquiry.MousePointer = vbHourglass
    CSD_mdiForm.staticStatus.Panels(3).text = errCompactControlDatabase(UserLang)
    'œ„Ã ﬁ«⁄œ… «·»Ì«‰«  «·„Õ·Ì…
    '"«·—Ã«¡ «·«‰ Ÿ«— Ã«—Ì œ„Ã ﬁ«⁄œ… «·»Ì«‰«  «·„Õ·Ì…"
    On Error GoTo err_compactDb
    CompactDatabase dbPath, "c:\temp\temp.mdb"
    Kill dbPath
    fso.MoveFile "C:\temp\temp.mdb", dbPath
    CSD_mdiForm.staticStatus.Panels(3).text = errCompactTransDatabase(UserLang)
    '"«·—Ã«¡ «·«‰ Ÿ«— Ã«—Ì œ„Ã Õ—ﬂ«  ﬁ«⁄œ… «·»Ì«‰« "
    CompactDatabase transDbPath, "c:\temp\temp.mdb"
    Kill transDbPath
    fso.MoveFile "C:\temp\temp.mdb", transDbPath
    CSD_mdiForm.staticStatus.Panels(3).text = " "
    frmEnquiry.MousePointer = vbNormal
    frmEnquiry.Enabled = True
    MsgBox errCompactSuccessful(UserLang)
    '" „ »‰Ã«Õ œ„Ã ﬁ«⁄œ… «·»Ì«‰«  "
    Set db = OpenDatabase(dbPath)
    Set transDb = OpenDatabase(transDbPath)
    Exit Sub
err_compactDb:
    If UserLang = ARABIC Then
       MsgBox "Error  " & Err.Number & "   " & Err.Description & "   «·—Ã«¡ Œ—ÊÃ Ã„Ì⁄ «·„” Œœ„Ì‰ „‰  «·‰Ÿ«„"
    Else
       MsgBox "Error  " & Err.Number & "   " & Err.Description & "   occured while compacting Database.. Please check.. Please ask all other users to logoff from STATIC DATA"
    End If
    frmEnquiry.MousePointer = vbNormal
    frmEnquiry.Enabled = True
    CSD_mdiForm.staticStatus.Panels(3).text = " "
    Exit Sub
End Sub

Private Sub mnuFullRefresh_Click()
    doRefresh ("1")
End Sub

Private Sub mnuManualBlockPendingCso_Click()
   blockSupervisorAction = False
   blockTellerAction = True
   CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdCustomer.Enabled = False
   frmEnquiry.MousePointer = vbHourglass
   readBlockPendingList "00000", "T", "C", Space(7)
   If UserLang = ARABIC Then
      'ChangePositions frmManualBlkPendingList, 11800
      'frmManualBlkPendingList.RightToLeft = True
      'frmManualBlkPendingList.Hide
   End If
   'frmManualBlkPendingList.Show
   'frmManualBlkPendingList.tag = "C"
   frmEnquiry.cmdCancel.Enabled = True
   frmEnquiry.cmdCustomer.Enabled = True
   frmEnquiry.MousePointer = vbDefault
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
   'frmManualBlkPendingList.Show
End Sub

Private Sub mnuManualBlockPendingSup_Click()
   blockSupervisorAction = True
   blockTellerAction = False
   CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdCustomer.Enabled = False
   frmEnquiry.MousePointer = vbHourglass
   readBlockPendingList "00000", "S", "C", Space(7)
   If UserLang = ARABIC Then
      'ChangePositions frmManualBlkPendingList, 11800
      'frmManualBlkPendingList.RightToLeft = True
      'frmManualBlkPendingList.Hide
   End If
   'frmManualBlkPendingList.Show
   'frmManualBlkPendingList.tag = "C"
   frmEnquiry.cmdCancel.Enabled = True
   frmEnquiry.cmdCustomer.Enabled = True
   frmEnquiry.MousePointer = vbDefault
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
   'frmManualBlkPendingList.Show
End Sub

Private Sub mnuNewCustomerReport_Click()
    Dim strmsglen As String
    
    SendMsg = "000000" & "AF" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & "00000" & recvLoginMsg.bankingDate & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass

    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       Exit Sub
    End If
    frmEnquiry.MousePointer = vbDefault

    parseNewCustomerReportDetails

    If recvNewCustomerReport.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvNewCustomerReport.aRemarks
       Else
          MsgBox recvNewCustomerReport.eRemarks
       End If
       Exit Sub
    End If
    page = 0
    generateNewCustomerReport
End Sub

Private Sub mnuPartialRefresh_Click()
   doRefresh ("0")
End Sub

Private Sub mnuRenewalRequest_Click()
   'frmCardRenewal.Show
End Sub

Private Sub mnuResetPassword_Click()
   frmResetPassword.Show vbModal
End Sub

Private Sub mnuStatement_Click()
   frmInputform.Show
End Sub

Private Sub mnuPendingReqFromTeller_Click()
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
   sadadSupervisorAction = True
   sadadTellerAction = False
   readSadadReversalPendingList "00000", "S", Space(10)
   If UserLang = ARABIC Then
      'ChangePositions frmSadadReversalPendingList, 11800
      'frmSadadReversalPendingList.RightToLeft = True
   End If
   'frmSadadReversalPendingList.Show
End Sub

Private Sub mnuPhoneCustomerOpen_Click()
    activityFlag = "P" ' Customer opened through phone
    branchActionDateTime = Space(14)
    supervisorAction = False
    tellerAction = True
    updateAction = False
    searchAction = False
    custHistoryAction = False
    phoneCustOpenAction = False
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    frmEnquiry.MousePointer = vbHourglass
    readPendingList "00000", "P", Space(7)
    If UserLang = ARABIC Then
       ChangePositions frmSupervisorApproval, 11800
       frmSupervisorApproval.RightToLeft = True
       frmSupervisorApproval.Hide
   End If
    Load frmSupervisorApproval
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    frmEnquiry.MousePointer = vbDefault
    CSD_mdiForm.staticStatus.Panels(3).text = errSelectCriteria(UserLang) '"Select any of the criteria"
    frmSupervisorApproval.Show
End Sub

Private Sub mnuStdOrdActionCso_Click()
   stdOrdSupervisorAction = False
   stdOrdTellerAction = True
   stdOrdSearchAction = False
   stdOrdUpdateAction = False
   readSodPendingList "00000", "T", Space(7)
   If UserLang = ARABIC Then
      'ChangePositions frmStdOrdPendingList, 11800
      'frmStdOrdPendingList.RightToLeft = True
   End If
   'frmStdOrdPendingList.Show
End Sub

Private Sub mnuStdOrdPendingActivitySup_Click()
    stdOrdSupervisorAction = True
    stdOrdTellerAction = False
    stdOrdSearchAction = False
    stdOrdUpdateAction = False
    readSodPendingList "00000", "S", Space(7)
    If UserLang = ARABIC Then
       'ChangePositions frmStdOrdPendingList, 11800
       'frmStdOrdPendingList.RightToLeft = True
    End If
    'frmStdOrdPendingList.Show
End Sub

Private Sub mnuStopChqActionCso_Click()
    stopChqSupervisorAction = False
    stopChqTellerAction = True
    stopChqSearchAction = False
    stopChqCreateAction = False
    readStopChqPendingList "00000", "T", Space(7)
    If UserLang = ARABIC Then
       'ChangePositions frmStopChqPendingList, 11800
       'frmStopChqPendingList.RightToLeft = True
    End If
    'frmStopChqPendingList.Show
End Sub

Private Sub mnuStopChqPendingActivitySup_Click()
    stopChqSupervisorAction = True
    stopChqTellerAction = False
    stopChqSearchAction = False
    stopChqCreateAction = False
    readStopChqPendingList "00000", "S", Space(7)
    If UserLang = ARABIC Then
       'ChangePositions frmStopChqPendingList, 11800
       'frmStopChqPendingList.RightToLeft = True
    End If
    'frmStopChqPendingList.Show
End Sub

Private Sub mnuSupChangePassword_Click()
   passwordChange = True
   frmChangePassword.Show vbModal
End Sub

Private Sub mnuSupervisorPending_Click()
   activityFlag = "S"
   supervisorAction = True
   tellerAction = False
   searchAction = False
   updateAction = False
   custHistoryAction = False
   CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdCustomer.Enabled = False
   frmEnquiry.MousePointer = vbHourglass
   readPendingList "00000", "S", Space(7)
   If UserLang = ARABIC Then
      ChangePositions frmSupervisorApproval, 11800
      frmSupervisorApproval.RightToLeft = True
      frmSupervisorApproval.Hide
   End If
   Load frmSupervisorApproval
   frmEnquiry.cmdCancel.Enabled = True
   frmEnquiry.cmdCustomer.Enabled = True
   frmEnquiry.MousePointer = vbDefault
   frmSupervisorApproval.Show
End Sub

Private Sub mnuSupSwiftTransferEnq_Click()
    frmSwiftTransferEnq.Show
End Sub

Private Sub mnuSwiftCentreReport_Click()
'    frmSwiftTransferReport.cmbReportDate = Mid$(recvLoginMsg.currentDateG, 7, 2)
'    frmSwiftTransferReport.cmbReportMonth = Mid$(recvLoginMsg.currentDateG, 5, 2)
'    frmSwiftTransferReport.txtReportYear = Mid$(recvLoginMsg.currentDateG, 1, 4)
'    frmSwiftTransferReport.Show vbModal
End Sub

Private Sub mnuSwiftPending_Click()
   swiftUpdateAction = False
   swiftTellerAction = False
   swiftEnquiryAction = False
   swiftSupervisorAction = True
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
   readSwiftTransferPendingList "00000", "S", Space(4)
   If UserLang = ARABIC Then
      'ChangePositions frmSwiftTransferPendingList, 11800
      'frmSwiftTransferPendingList.RightToLeft = True
   End If
   'frmSwiftTransferPendingList.Show
End Sub

Private Sub mnuSwiftPendingFromBranch_Click()
   formatBranchSwiftTransferEnqRequest "00000", Space(8), Space(4)
   frmEnquiry.MousePointer = vbHourglass
   frmEnquiry.cmdCancel.Enabled = False
   frmEnquiry.cmdCustomer.Enabled = False
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmEnquiry.MousePointer = vbDefault
      frmEnquiry.cmdCancel.Enabled = True
      frmEnquiry.cmdCustomer.Enabled = True
      CSD_mdiForm.staticStatus.Panels(3).text = "   "
      Exit Sub
   End If
   parseBranchSwiftTransferDetails
   frmEnquiry.MousePointer = vbDefault
   frmEnquiry.cmdCancel.Enabled = True
   frmEnquiry.cmdCustomer.Enabled = True
   If recvBrSwiftTranferMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvBrSwiftTranferMsg.aRemarks
      Else
         MsgBox recvBrSwiftTranferMsg.eRemarks
      End If
   End If
   CSD_mdiForm.staticStatus.Panels(3).text = "   "
   frmSwiftTransferBranchActivity.Show
End Sub

Private Sub mnuSwiftPendingFromSupervisor_Click()
   swiftUpdateAction = False
   swiftTellerAction = True
   swiftEnquiryAction = False
   swiftSupervisorAction = False
   readSwiftTransferPendingList "00000", "T", Space(4)
   If UserLang = ARABIC Then
      'ChangePositions frmSwiftTransferPendingList, 11800
      'frmSwiftTransferPendingList.RightToLeft = True
   End If
   'frmSwiftTransferPendingList.Show
End Sub

Private Sub mnuSwiftTransferEnq_Click()
    frmSwiftTransferEnq.Show
End Sub

Private Sub mnuCsoPendingAction_Click()
    activityFlag = "T"
    supervisorAction = False
    tellerAction = True
    updateAction = False
    searchAction = False
    custHistoryAction = False
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    frmEnquiry.MousePointer = vbHourglass
    readPendingList "00000", "T", Space(7)
    If UserLang = ARABIC Then
       ChangePositions frmSupervisorApproval, 11800
       frmSupervisorApproval.RightToLeft = True
       frmSupervisorApproval.Hide
   End If
    Load frmSupervisorApproval
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    frmEnquiry.MousePointer = vbDefault
    CSD_mdiForm.staticStatus.Panels(3).text = errSelectCriteria(UserLang) '"Select any of the criteria"
    frmSupervisorApproval.Show
End Sub

Private Sub mnuTellerFacilities_Click()
    'frmTellerFacilities.Show
End Sub

Private Sub mnuTellerRefreshLocalDb_Click()
    doRefresh ("0")
End Sub

Private Sub mnuTimeDepositPendingCso_Click()
    tdSupervisorAction = False
    tdTellerAction = True
    tdSearchAction = False
    tdUpdateAction = False
    readTimeDepositPendingList "00000", "T", Space(7)
    If UserLang = ARABIC Then
       'ChangePositions frmTimeDepositPendingList, 11800
       'frmTimeDepositPendingList.RightToLeft = True
    End If
    'frmTimeDepositPendingList.Show
End Sub

Private Sub mnuTimeDepositPendingSup_Click()
    tdSupervisorAction = True
    tdTellerAction = False
    tdSearchAction = False
    tdUpdateAction = False
    readTimeDepositPendingList "00000", "S", Space(7)
    If UserLang = ARABIC Then
       'ChangePositions frmTimeDepositPendingList, 11800
       'frmTimeDepositPendingList.RightToLeft = True
    End If
    'frmTimeDepositPendingList.Show
End Sub

Private Sub mnuTpinReport_Click()
    Dim strmsglen As String
    
    SendMsg = "000000" & "AL" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & "00000" & recvLoginMsg.bankingDate & "T" & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass

    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       Exit Sub
    End If
    frmEnquiry.MousePointer = vbDefault

    parseTpinActivityReportDetails
    
    If recvTpinActivityReport.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTpinActivityReport.aRemarks
       Else
          MsgBox recvTpinActivityReport.eRemarks
       End If
       Exit Sub
    End If
    page = 1
    generateTpinActivityReport
End Sub

Private Sub mnuTpinSelectPending_Click()
    supervisorAction = True
    tellerAction = False
    searchAction = False
    updateAction = False
    custHistoryAction = False
    readTpinPendingList "00000", Space(7)
    If UserLang = ARABIC Then
       'ChangePositions frmTpinPendingList, 11800
       'frmTpinPendingList.RightToLeft = True
    End If
    'frmTpinPendingList.Show
End Sub

Private Sub mnuTransEnqChiefTeller_Click()
    frmSadadTransEnq.Show
End Sub

Private Sub mnuTransEnqTeller_Click()
    frmSadadTransEnq.Show
End Sub

Private Sub mnuUpdateStatus_Click()
   Dim strmsglen, tUserid As String
   
   tUserid = Format(Trim(gUserId), "!@@@@@@@@@@")
   
   SendMsg = "000000" & "31" & gBranchCode & tUserid
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmEnquiry.MousePointer = vbHourglass
   If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
      LoadError = True
      frmEnquiry.MousePointer = vbDefault
      Exit Sub
   End If

   frmEnquiry.MousePointer = vbDefault
   
   If recvCustomerMsg.status = "000" Then
      MsgBox errDC9000LogSuccess(UserLang)
   Else
      If UserLang = ENGLISH Then
         MsgBox recvCustomerMsg.eRemarks
      Else
         MsgBox recvCustomerMsg.aRemarks
      End If
   End If
   
End Sub

Private Sub tcpClient_Connect()
    HostConnected = True
End Sub

Private Sub tcpClient_DataArrival(ByVal bytesTotal As Long)
  Dim blockedMsg As String
  Dim s As String
  On Error GoTo err_handler
  
  If MsgWouldBlock = False Then
     s = "1"
     tcpClient.GetData recvMsg.msgLen, vbString, 6
     RecvStr = ""
     s = "2"
     tcpClient.GetData RecvStr, vbString, bytesTotal - 6
     s = "3"
     If bytesTotal < CLng(recvMsg.msgLen) Then
      '  Debug.Print "Received= " + CStr(bytesTotal) + " Actual= " + recvMsg.msgLen
        MsgWouldBlock = True
        DoEvents
     End If
  Else
     s = "4"
     tcpClient.GetData blockedMsg, vbString, bytesTotal
     s = "5"
     RecvStr = RecvStr & blockedMsg
     'Debug.Print "Received; Finally = " + CStr(Len(RecvStr))
     s = "6"
     If Len(RecvStr) < (CLng(recvMsg.msgLen) - 6) Then
        DoEvents
     Else
        MsgWouldBlock = False
     End If
  End If
  If MsgWouldBlock = False Then
     DataReceivedFlag = True
  End If
  Exit Sub
err_handler:
  LogData "Unexpected error  " + str(Err.Number) + "   " + Err.Description + "  occured in line " + s + "  [tcpClient_dataArrival]"
  Resume Next
End Sub

Private Sub tcpClient_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
  Dim response As Integer
  If Number = sckConnectionRefused Or _
     Number = sckHostNotFound Or _
     Number = sckHostNotFoundTryAgain Then
   MsgBox (errConnectProblem(UserLang) + CStr(Number) + ": " + errConnectionRejected(UserLang) _
           + Chr(13) + errHostName(UserLang) + hostName + "; " + errPortNo(UserLang) + CStr(port) _
           + Chr(13) + errCallHeadOffice(UserLang))
   Unload frmEnquiry
   frmLogin.Show
   userLoggedIn = False
   frmLogin.MousePointer = vbDefault
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   CSD_mdiForm.staticStatus.Panels(3).text = errLogon(UserLang)  '"Login with UserId and Password"
ElseIf Number = sckBadState Or _
        Number = sckNotConnected Or _
        Number = sckSocketShutdown Or _
        Number = sckTimedout Then
    frmLogin.MousePointer = vbDefault
    frmLogin.cmdOk.Enabled = True
    frmLogin.cmdExit.Enabled = True
    response = MsgBox(errConnectProblem(UserLang) + " (" + CStr(Number) + ") " + Description _
        + Chr(13) + Chr(13) + errShouldIReconnect(UserLang), vbOKCancel)
    If response = vbOK Then
        tcpClient.Close
        tcpClient.Connect
    ElseIf response = vbCancel Then
        Unload frmEnquiry
        frmLogin.Show
        userLoggedIn = False
        CSD_mdiForm.staticStatus.Panels(3).text = errLogon(UserLang) '"Login with UserId and Password"
    End If
ElseIf Number = sckWouldBlock Then
    MsgWouldBlock = True
Else
  MsgBox (errConnectProblem(UserLang) + CStr(Number) + ": " + Description _
          + Chr(13) + Chr(13) + errUnexpectedError(UserLang))
  Unload frmEnquiry
  frmLogin.Show
  userLoggedIn = False
  frmLogin.MousePointer = vbDefault
  frmLogin.cmdOk.Enabled = True
  frmLogin.cmdExit.Enabled = True
  CSD_mdiForm.staticStatus.Panels(3).text = errLogon(UserLang) '"Login with UserId and Password"
End If
End Sub

Private Sub Timer1_Timer()
    TimeOutFlag = True
    Timer1.Enabled = False
End Sub

Private Sub txtAccountNumber_Change()
   If Len(RTrim(txtAccountNumber)) > 0 Then
      If InStr(recvLoginMsg.authorityLevel, "~6") > 0 Or _
          InStr(recvLoginMsg.authorityLevel, "~32") > 0 Then
         cmdAcctInfo.Enabled = True
      Else
         cmdAcctInfo.Enabled = False
      End If
      If InStr(recvLoginMsg.authorityLevel, "~4") <> 0 Then
         cmdAtmCard.Enabled = True
      Else
         cmdAtmCard.Enabled = False
      End If
      txtIdNo = ""
      txtCrNo = ""
      txtPhone = ""
      txtPhoneExt = ""
      txtFirstName = ""
      txtSecondName = ""
      txtLastName = ""
      txtCardNumber = ""
      txtCustomerNo = ""
      txtMobileNo = ""
      cmbMainCategory.text = ""
      cmbSubCategory.text = ""
      cmbBranch.text = ""
   Else
      cmdAcctInfo.Enabled = False
      cmdAtmCard.Enabled = False
   End If
End Sub

Private Sub txtCardNumber_Change()
    If Len(RTrim(txtCardNumber)) > 0 Then
       If InStr(recvLoginMsg.authorityLevel, "~6") > 0 Then
          cmdAcctInfo.Enabled = True
       Else
          cmdAcctInfo.Enabled = False
       End If
       If InStr(recvLoginMsg.authorityLevel, "~4") <> 0 Then
          cmdAtmCard.Enabled = True
       Else
          cmdAtmCard.Enabled = False
       End If
       txtIdNo = ""
       txtCrNo = ""
       txtMobileNo = ""
       txtPhone = ""
       txtPhoneExt = ""
       txtFirstName = ""
       txtSecondName = ""
       txtLastName = ""
       txtCustomerNo = ""
       txtAccountNumber = ""
       cmbMainCategory.text = ""
       cmbSubCategory.text = ""
       cmbBranch.text = ""
   Else
       cmdAcctInfo.Enabled = False
       cmdAtmCard.Enabled = False
   End If
End Sub

Private Sub txtCardNumber_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtCrNo_Change()
   If Len(RTrim(txtCrNo)) > 0 Then
      txtCustomerNo.text = ""
      txtIdNo = ""
      txtPhone = ""
      txtPhoneExt = ""
      txtFirstName = ""
      txtSecondName = ""
      txtMobileNo = ""
      txtLastName = ""
      txtCardNumber = ""
      txtAccountNumber = ""
      cmbMainCategory.text = ""
      cmbSubCategory.text = ""
      cmbBranch.text = ""
   End If
End Sub

Private Sub txtCustomerNo_Change()
   If Len(RTrim(txtCustomerNo)) > 0 Then
       txtIdNo = ""
       txtCrNo = ""
       txtPhone = ""
       txtPhoneExt = ""
       txtFirstName = ""
       txtSecondName = ""
       txtLastName = ""
       txtCardNumber = ""
       txtMobileNo = ""
       txtAccountNumber = ""
       cmbMainCategory.text = ""
       cmbSubCategory.text = ""
       cmbBranch.text = ""
       If InStr(recvLoginMsg.authorityLevel, "~6") > 0 Or _
          InStr(recvLoginMsg.authorityLevel, "~32") > 0 Then
          cmdAcctInfo.Enabled = True
       Else
          cmdAcctInfo.Enabled = False
       End If
       If InStr(recvLoginMsg.authorityLevel, "~4") > 0 Then
          cmdAtmCard.Enabled = True
       End If
   Else
       cmdAcctInfo.Enabled = False
       cmdAtmCard.Enabled = False
   End If
End Sub

Private Sub txtCustomerNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtFirstName_Change()
   If Len(RTrim(txtFirstName)) > 0 Then
      txtCustomerNo = ""
      txtPhone = ""
      txtPhoneExt = ""
      txtIdNo = ""
      txtMobileNo = ""
      'txtLastName = ""
      txtCardNumber = ""
      txtAccountNumber = ""
      cmbMainCategory.text = ""
      cmbSubCategory.text = ""
      cmbBranch.text = ""
   End If
End Sub

Private Sub txtIdNo_Change()
  If Len(RTrim(txtIdNo)) > 0 Then
      txtCustomerNo = ""
      txtCrNo = ""
      txtPhone = ""
      txtPhoneExt = ""
      txtFirstName = ""
      txtSecondName = ""
      txtLastName = ""
      txtCardNumber = ""
      txtMobileNo = ""
      txtAccountNumber = ""
      cmbMainCategory.text = ""
      cmbSubCategory.text = ""
      cmbBranch.text = ""
  End If
End Sub

Private Sub txtLastName_Change()
   If Len(RTrim(txtLastName)) > 0 Then
     txtCustomerNo = ""
     txtIdNo = ""
     txtCrNo = ""
     txtPhone = ""
     txtMobileNo = ""
     'txtFirstName = ""
     txtPhoneExt = ""
     txtCardNumber = ""
     txtAccountNumber = ""
     cmbMainCategory.text = ""
     cmbSubCategory.text = ""
     cmbBranch.text = ""
  End If
End Sub

Private Sub txtMobileNo_Change()
   If Len(RTrim(txtMobileNo)) > 0 Then
      txtCustomerNo = ""
      txtCrNo = ""
      txtIdNo = ""
      txtPhone = ""
      txtPhoneExt = ""
      txtFirstName = ""
      txtSecondName = ""
      txtLastName = ""
      txtCardNumber = ""
      txtAccountNumber = ""
      cmbMainCategory.text = ""
      cmbSubCategory.text = ""
      cmbBranch.text = ""
  End If
End Sub

Private Sub txtMobileNo_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtPhone_Change()
   If Len(RTrim(txtPhone)) > 0 Then
     txtCustomerNo = ""
     txtIdNo = ""
     txtFirstName = ""
     txtSecondName = ""
     txtLastName = ""
     txtCrNo = ""
     txtCardNumber = ""
     txtMobileNo = ""
     txtAccountNumber = ""
     cmbMainCategory.text = ""
     cmbSubCategory.text = ""
     cmbBranch.text = ""
  End If
End Sub

Private Sub txtPhone_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtPhoneExt_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub
Public Sub readPendingList(lastRecRead As String, activityFlag As String, custNo As String)
    Dim userId As String * 10
    Dim strmsglen As String

    userId = Format(gUserId, "!@@@@@@@@@@")

    SendMsg = "000038" & "12" & gBranchCode & userId & lastRecRead & activityFlag & custNo & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
       Exit Sub
    End If
    parsePendingList
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    CSD_mdiForm.staticStatus.Panels(3).text = " "
    
    If recvPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvPendingList.aRemarks
       Else
          MsgBox recvPendingList.eRemarks
       End If
    End If
    
    frmSupervisorApproval.txtCustomerNo = Trim(custNo)
End Sub
Public Function parsePendingList() As String
     Dim i, pos As Integer

     recvPendingList.status = Mid$(RecvStr, 1, 3)
     recvPendingList.service = Mid$(RecvStr, 4, 2)
     recvPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvPendingList.lastRecRead = Mid$(RecvStr, 106, 5)
     recvPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvPendingList.filler = Mid$(RecvStr, 113, 10)
     pos = 123
     For i = 1 To Val(recvPendingList.noOfRecs)
         recvPendingList.details(i).userId = Mid$(RecvStr, pos, 20)
         pos = pos + 20
         recvPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvPendingList.details(i).customerNo = Mid$(RecvStr, pos, 7)
         pos = pos + 7
         recvPendingList.details(i).shortName = Mid$(RecvStr, pos, 30)
         pos = pos + 30
         recvPendingList.details(i).idType = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvPendingList.details(i).idNumber = Mid$(RecvStr, pos, 15)
         pos = pos + 15
         recvPendingList.details(i).mainCategoryCode = Mid$(RecvStr, pos, 2)
         pos = pos + 2
         recvPendingList.details(i).subCategoryCode = Mid$(RecvStr, pos, 2)
         pos = pos + 2
    Next i
    parsePendingList = Success
End Function

Public Sub readAccPendingList(lastRecRead As String, activityFlag As String, custNo As String)
    Dim userId As String * 10
    Dim strmsglen As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000038" & "22" & gBranchCode & userId & lastRecRead & activityFlag & custNo & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
       Exit Sub
    End If
    parseAccPendingList
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    If recvAccPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvAccPendingList.aRemarks
       Else
          MsgBox recvAccPendingList.eRemarks
       End If
    End If
    'frmAcctPendingList.txtCustomerNo = Trim(custNo)
    CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
End Sub

Public Function parseAccPendingList() As String
     Dim i, pos As Integer
     
     recvAccPendingList.status = Mid$(RecvStr, 1, 3)
     recvAccPendingList.service = Mid$(RecvStr, 4, 2)
     recvAccPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvAccPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvAccPendingList.lastRecCount = Mid$(RecvStr, 106, 5)
     recvAccPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvAccPendingList.lastRecNum = Mid$(RecvStr, 113, 8)
     recvAccPendingList.filler = Mid$(RecvStr, 121, 2)
     pos = 123
     For i = 1 To Val(recvAccPendingList.noOfRecs)
         recvAccPendingList.details(i).userId = Mid$(RecvStr, pos, 20)
         pos = pos + 20
         recvAccPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvAccPendingList.details(i).accNo = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvAccPendingList.details(i).accStatus = Mid$(RecvStr, pos, 2)
         pos = pos + 2
         recvAccPendingList.details(i).branchCode = Mid$(RecvStr, pos, 4)
         pos = pos + 4
    Next i
    parseAccPendingList = Success
End Function

Public Sub readCardPendingList(lastRecRead As String, activityFlag As String, custNo As String)
    Dim tUserid As String * 10
    Dim strmsglen As String
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000038" & "23" & gBranchCode & tUserid & lastRecRead & activityFlag & custNo & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
       Exit Sub
    End If
    parseCardPendingList
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    If recvCardPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvCardPendingList.aRemarks
       Else
          MsgBox recvCardPendingList.eRemarks
       End If
    End If
    frmCardPendingList.txtCustomerNo = Trim(custNo)
    CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
End Sub
Public Function parseCardPendingList() As String
     Dim i, pos As Integer
     
     recvCardPendingList.status = Mid$(RecvStr, 1, 3)
     recvCardPendingList.service = Mid$(RecvStr, 4, 2)
     recvCardPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvCardPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvCardPendingList.lastRecCount = Mid$(RecvStr, 106, 5)
     recvCardPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvCardPendingList.filler = Mid$(RecvStr, 113, 10)
     pos = 123
     For i = 1 To Val(recvCardPendingList.noOfRecs)
         recvCardPendingList.details(i).userId = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvCardPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvCardPendingList.details(i).cardNo = Mid$(RecvStr, pos, 19)
         pos = pos + 19
         recvCardPendingList.details(i).nameOnTheCard = Mid$(RecvStr, pos, 26)
         pos = pos + 26
         recvCardPendingList.details(i).cardType = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvCardPendingList.details(i).natureOfCard = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvCardPendingList.details(i).pendingType = Mid$(RecvStr, pos, 10)
         pos = pos + 10
    Next i
    parseCardPendingList = Success
End Function

Public Sub readSodPendingList(lastRecRead As String, activityFlag As String, custNo As String)
    Dim userId As String * 10
    Dim strmsglen As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000038" & "51" & gBranchCode & userId & lastRecRead & activityFlag & custNo & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = "   "
       Exit Sub
    End If
    parseSodPendingList
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    If recvStdOrdPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvStdOrdPendingList.aRemarks
       Else
          MsgBox recvStdOrdPendingList.eRemarks
       End If
    End If
    'frmStdOrdPendingList.txtCustomerNo = Trim(custNo)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Public Function parseSodPendingList() As String
     Dim i, pos As Integer
     
     recvStdOrdPendingList.status = Mid$(RecvStr, 1, 3)
     recvStdOrdPendingList.service = Mid$(RecvStr, 4, 2)
     recvStdOrdPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvStdOrdPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvStdOrdPendingList.lastRecCount = Mid$(RecvStr, 106, 5)
     recvStdOrdPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvStdOrdPendingList.filler = Mid$(RecvStr, 113, 10)
     pos = 123
     For i = 1 To Val(recvStdOrdPendingList.noOfRecs)
         recvStdOrdPendingList.details(i).userId = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvStdOrdPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvStdOrdPendingList.details(i).accNo = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvStdOrdPendingList.details(i).sodNo = Mid$(RecvStr, pos, 6)
         pos = pos + 6
         recvStdOrdPendingList.details(i).paymentType = Mid$(RecvStr, pos, 1)
         pos = pos + 1
    Next i
    parseSodPendingList = Success
End Function

Public Sub readStopChqPendingList(lastRecRead As String, activityFlag As String, custNo As String)
    Dim userId As String * 10
    Dim strmsglen As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000038" & "53" & gBranchCode & userId & lastRecRead & activityFlag & custNo & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
       Exit Sub
    End If
    parseStopChqPendingList
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    If recvStopChqPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvStopChqPendingList.aRemarks
       Else
          MsgBox recvStopChqPendingList.eRemarks
       End If
    End If
    'frmStopChqPendingList.txtCustomerNo = Trim(custNo)
    CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
End Sub

Public Function parseStopChqPendingList()
  Dim i, pos As Integer
     
     recvStopChqPendingList.status = Mid$(RecvStr, 1, 3)
     recvStopChqPendingList.service = Mid$(RecvStr, 4, 2)
     recvStopChqPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvStopChqPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvStopChqPendingList.lastRecCount = Mid$(RecvStr, 106, 5)
     recvStopChqPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvStopChqPendingList.filler = Mid$(RecvStr, 113, 10)
     pos = 123
     For i = 1 To Val(recvStopChqPendingList.noOfRecs)
         recvStopChqPendingList.details(i).userId = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvStopChqPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvStopChqPendingList.details(i).accNo = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvStopChqPendingList.details(i).chequeNo = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvStopChqPendingList.details(i).reason = Mid$(RecvStr, pos, 25)
         pos = pos + 25
         recvStopChqPendingList.details(i).pendingType = Mid$(RecvStr, pos, 15)
         pos = pos + 15
    Next i
    parseStopChqPendingList = Success
    
End Function

Public Function readTpinPendingList(lastRecRead As String, custNo) As Integer
    Dim userId As String * 10
    Dim strmsglen As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000038" & "69" & gBranchCode & userId & lastRecRead & custNo & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
       readTpinPendingList = -1
       Exit Function
    End If
    parseTpinPendingList
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    If recvTpinPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTpinPendingList.aRemarks
       Else
          MsgBox recvTpinPendingList.eRemarks
       End If
       readTpinPendingList = -1
       'frmTpinPendingList.txtCustomerNo = custNo
       Exit Function
    End If
    'frmTpinPendingList.txtCustomerNo = custNo
    readTpinPendingList = 0
End Function

Public Function parseTpinPendingList()
     Dim i, pos As Integer
     
     recvTpinPendingList.status = Mid$(RecvStr, 1, 3)
     recvTpinPendingList.service = Mid$(RecvStr, 4, 2)
     recvTpinPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvTpinPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvTpinPendingList.lastRecCount = Mid$(RecvStr, 106, 5)
     recvTpinPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvTpinPendingList.filler = Mid$(RecvStr, 113, 10)
     pos = 123
     For i = 1 To Val(recvTpinPendingList.noOfRecs)
         recvTpinPendingList.details(i).userId = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvTpinPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvTpinPendingList.details(i).custNo = Mid$(RecvStr, pos, 7)
         pos = pos + 7
         recvTpinPendingList.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
         pos = pos + 4
         recvTpinPendingList.details(i).custShortName = Mid$(RecvStr, pos, 30)
         pos = pos + 30
    Next i
    parseTpinPendingList = Success
    
End Function

Private Sub txtSecondName_Change()
If Len(RTrim(txtSecondName)) > 0 Then
     txtCustomerNo = ""
     txtIdNo = ""
     txtCrNo = ""
     txtPhone = ""
     txtMobileNo = ""
     'txtFirstName = ""
     txtPhoneExt = ""
     txtCardNumber = ""
     txtAccountNumber = ""
     cmbMainCategory.text = ""
     cmbSubCategory.text = ""
     cmbBranch.text = ""
  End If
End Sub

Public Sub readBlockPendingList(lastRecRead As String, activityFlag As String, cardOrAcct As String, custNo As String)
    Dim tUserid As String * 10
    Dim strmsglen As String
    
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000038" & "89" & gBranchCode & tUserid & lastRecRead & activityFlag & cardOrAcct & custNo & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = errSearchIncomplete(UserLang)
       Exit Sub
    End If
    parseBlockPendingList
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    If recvBlockPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvBlockPendingList.aRemarks
       Else
          MsgBox recvBlockPendingList.eRemarks
       End If
       Exit Sub
    End If
    'frmManualBlkPendingList.txtCustomerNo = Trim(custNo)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Public Function parseBlockPendingList() As String
     Dim i, pos As Integer
     
     recvBlockPendingList.status = Mid$(RecvStr, 1, 3)
     recvBlockPendingList.service = Mid$(RecvStr, 4, 2)
     recvBlockPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvBlockPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvBlockPendingList.lastRecCount = Mid$(RecvStr, 106, 5)
     recvBlockPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvBlockPendingList.filler = Mid$(RecvStr, 113, 50)
     pos = 163
     For i = 1 To Val(recvBlockPendingList.noOfRecs)
         recvBlockPendingList.details(i).userId = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvBlockPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvBlockPendingList.details(i).cardNo = Mid$(RecvStr, pos, 16)
         pos = pos + 16
         recvBlockPendingList.details(i).bmAccNo = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvBlockPendingList.details(i).action = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         recvBlockPendingList.details(i).oldAmt = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvBlockPendingList.details(i).blockAmt = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvBlockPendingList.details(i).supervisorComments = Mid$(RecvStr, pos, 200)
         pos = pos + 200
         pos = pos + 10 ' for the filler
    Next i
    parseBlockPendingList = Success
End Function
Public Sub readTimeDepositPendingList(lastRecRead As String, activityFlag As String, custNo As String)
    Dim userId As String * 10
    Dim strmsglen As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000038" & "AI" & gBranchCode & userId & lastRecRead & activityFlag & custNo & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = "   "
       Exit Sub
    End If
    parseTimeDepositPendingList
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    If recvTimeDepositPendingList.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTimeDepositPendingList.aRemarks
       Else
          MsgBox recvTimeDepositPendingList.eRemarks
       End If
    End If
    'frmTimeDepositPendingList.txtCustomerNo = Trim(custNo)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub
Public Function parseTimeDepositPendingList() As String
     Dim i As Integer, pos As Integer
     
     recvTimeDepositPendingList.status = Mid$(RecvStr, 1, 3)
     recvTimeDepositPendingList.service = Mid$(RecvStr, 4, 2)
     recvTimeDepositPendingList.aRemarks = Mid$(RecvStr, 6, 50)
     recvTimeDepositPendingList.eRemarks = Mid$(RecvStr, 56, 50)
     recvTimeDepositPendingList.lastRecCount = Mid$(RecvStr, 106, 5)
     recvTimeDepositPendingList.noOfRecs = Mid$(RecvStr, 111, 2)
     recvTimeDepositPendingList.filler = Mid$(RecvStr, 113, 50)
     pos = 163
     For i = 1 To Val(recvTimeDepositPendingList.noOfRecs)
         recvTimeDepositPendingList.details(i).userId = Mid$(RecvStr, pos, 10)
         pos = pos + 10
         recvTimeDepositPendingList.details(i).dateTime = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvTimeDepositPendingList.details(i).custNo = Mid$(RecvStr, pos, 7)
         pos = pos + 7
         recvTimeDepositPendingList.details(i).accNo = Mid$(RecvStr, pos, 14)
         pos = pos + 14
         recvTimeDepositPendingList.details(i).custName = Mid$(RecvStr, pos, 30)
         pos = pos + 30
         recvTimeDepositPendingList.details(i).tdCurrency = Mid$(RecvStr, pos, 2)
         pos = pos + 2
         recvTimeDepositPendingList.details(i).tdLedger = Mid$(RecvStr, pos, 3)
         pos = pos + 3
         recvTimeDepositPendingList.details(i).newOrUpdate = Mid$(RecvStr, pos, 1)
         pos = pos + 1
         pos = pos + 50
    Next i
    parseTimeDepositPendingList = Success
End Function
Public Sub parseTpinActivityReportDetails()
    Dim i As Integer, pos As Integer
    pos = 1
    recvTpinActivityReport.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvTpinActivityReport.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTpinActivityReport.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTpinActivityReport.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvTpinActivityReport.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvTpinActivityReport.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvTpinActivityReport.reportDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvTpinActivityReport.reportType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvTpinActivityReport.filler = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    
    For i = 1 To Val(recvTpinActivityReport.noOfRecs)
        recvTpinActivityReport.details(i).userId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvTpinActivityReport.details(i).dateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvTpinActivityReport.details(i).newOrUpdate = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvTpinActivityReport.details(i).custNo = Mid$(RecvStr, pos, 7)
        pos = pos + 7
        recvTpinActivityReport.details(i).supervisorId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvTpinActivityReport.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvTpinActivityReport.details(i).pendingStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvTpinActivityReport.details(i).lastUpdateDateTime = Mid$(RecvStr, pos, 14)
        pos = pos + 14
        recvTpinActivityReport.details(i).custName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvTpinActivityReport.details(i).filler = Mid$(RecvStr, pos, 50)
        pos = pos + 50
    Next i
End Sub

Public Sub parsePinActivityReportDetails()
    Dim i As Integer, pos As Integer
    pos = 1
    recvPinActivityReport.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvPinActivityReport.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvPinActivityReport.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvPinActivityReport.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvPinActivityReport.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvPinActivityReport.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvPinActivityReport.reportDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvPinActivityReport.reportType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvPinActivityReport.filler = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    For i = 1 To Val(recvPinActivityReport.noOfRecs)
        recvPinActivityReport.details(i).coreAccNo = Mid$(RecvStr, pos, 16)
        pos = pos + 16
        recvPinActivityReport.details(i).cardNo = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvPinActivityReport.details(i).requestType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvPinActivityReport.details(i).requestStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvPinActivityReport.details(i).issueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvPinActivityReport.details(i).expireDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvPinActivityReport.details(i).customerBranch = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvPinActivityReport.details(i).requestUser = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvPinActivityReport.details(i).nameOnProduct = Mid$(RecvStr, pos, 26)
        pos = pos + 26
        recvPinActivityReport.details(i).deliveryToBranchOrPO = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvPinActivityReport.details(i).pendingStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvPinActivityReport.details(i).supervisorId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvPinActivityReport.details(i).filler = Mid$(RecvStr, pos, 50)
        pos = pos + 50
    Next i
End Sub
Public Sub parseCardActivityReportDetails()
    Dim i As Integer, pos As Integer
    pos = 1
    recvCardActivityReport.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvCardActivityReport.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvCardActivityReport.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvCardActivityReport.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvCardActivityReport.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvCardActivityReport.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvCardActivityReport.reportDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvCardActivityReport.reportType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvCardActivityReport.filler = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    For i = 1 To Val(recvCardActivityReport.noOfRecs)
        recvCardActivityReport.details(i).coreAccNo = Mid$(RecvStr, pos, 16)
        pos = pos + 16
        recvCardActivityReport.details(i).cardNo = Mid$(RecvStr, pos, 19)
        pos = pos + 19
        recvCardActivityReport.details(i).requestType = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvCardActivityReport.details(i).requestStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvCardActivityReport.details(i).issueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvCardActivityReport.details(i).expireDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        recvCardActivityReport.details(i).requestBranch = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvCardActivityReport.details(i).requestUser = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardActivityReport.details(i).nameOnProduct = Mid$(RecvStr, pos, 26)
        pos = pos + 26
        recvCardActivityReport.details(i).deliveryToBranchOrPO = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvCardActivityReport.details(i).pendingStatus = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvCardActivityReport.details(i).supervisorId = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        recvCardActivityReport.details(i).filler = Mid$(RecvStr, pos, 50)
        pos = pos + 50
    Next i
End Sub
Public Sub parseNewCustomerReportDetails()
    Dim i As Integer, pos As Integer
    pos = 1
    recvNewCustomerReport.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvNewCustomerReport.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvNewCustomerReport.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvNewCustomerReport.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvNewCustomerReport.lastRecCount = Mid$(RecvStr, pos, 5)
    pos = pos + 5
    recvNewCustomerReport.noOfRecs = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvNewCustomerReport.reportDate = Mid$(RecvStr, pos, 8)
    pos = pos + 8
    recvNewCustomerReport.filler = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    For i = 1 To Val(recvNewCustomerReport.noOfRecs)
        recvNewCustomerReport.details(i).custNo = Mid$(RecvStr, pos, 7)
        pos = pos + 7
        recvNewCustomerReport.details(i).custBranchCode = Mid$(RecvStr, pos, 4)
        pos = pos + 4
        recvNewCustomerReport.details(i).custName = Mid$(RecvStr, pos, 30)
        pos = pos + 30
        recvNewCustomerReport.details(i).createdThroQuickScreen = Mid$(RecvStr, pos, 1)
        pos = pos + 1
        recvNewCustomerReport.details(i).filler = Mid$(RecvStr, pos, 50)
        pos = pos + 50
    Next i
End Sub
Public Sub generateTpinActivityReport()
    Dim i As Integer
    Dim reportFile As String
    Dim pendingStatus As String, requestTypeDesc As String
    Dim oldBranchCode As String
    Dim strmsglen As String
    Dim recsRejected As Integer
    Dim recsSuccessful As Integer, recsPending As Integer
    Dim recsTotal As Integer
    Dim tmpStr As String, tCode As String
    Dim requestType As String
    Dim response
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    
    recsTotal = 0

    'langChar = Chr$(253)  ' for english
    
    langChar = Chr$(254)  ' for arabic
    
    oldBranchCode = "--------"
    
    Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 12
    Printer.FontBold = False
    'Printer.RightToLeft = False '  for english
    Printer.RightToLeft = True ' for arabic
    
    tpinHeaderPrint
    Do While True
        On Error Resume Next
        For i = 1 To Val(recvTpinActivityReport.noOfRecs)
            recsTotal = recsTotal + 1
            
            Printer.Print recvTpinActivityReport.details(i).custNo & langChar & _
                     "  " & recvTpinActivityReport.details(i).custName & langChar & _
                     " " & recvTpinActivityReport.details(i).custBranchCode & langChar & _
                     "   " & recvTpinActivityReport.details(i).userId & langChar & _
                     " " & recvTpinActivityReport.details(i).supervisorId & langChar & _
                     " " & formatDate(Mid$(recvTpinActivityReport.details(i).dateTime, 1, 8)) & _
                     " " & formatTime(Mid$(recvTpinActivityReport.details(i).dateTime, 9, 6)) & langChar & _
                     "  " & formatDate(Mid$(recvTpinActivityReport.details(i).lastUpdateDateTime, 1, 8)) & _
                     " " & formatTime(Mid$(recvTpinActivityReport.details(i).lastUpdateDateTime, 9, 6)) & langChar
                     
            lines = lines + 1
            If lines > 40 Then
               Printer.NewPage
               page = page + 1
               tpinHeaderPrint
            End If
       Next
       If recvTpinActivityReport.noOfRecs = "50" Then
          SendMsg = "000000" & "AL" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & recvTpinActivityReport.lastRecCount & recvLoginMsg.bankingDate & "T" & Space(50)
          strmsglen = Format(Len(SendMsg), "000000")
          Mid$(SendMsg, 1, 6) = strmsglen
          DataReceivedFlag = False
          frmEnquiry.MousePointer = vbHourglass

          ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
          If ReturnStatus = LocalCommsError Then
             LoadError = True
             frmEnquiry.MousePointer = vbDefault
             Exit Sub
          End If
          frmEnquiry.MousePointer = vbDefault

          parseTpinActivityReportDetails

          If recvTpinActivityReport.status <> "000" Then
             Exit Do
          Else
             If recvTpinActivityReport.noOfRecs = "00" Then
                Exit Do
             End If
          End If
       Else
          Exit Do
       End If
    Loop
    
    Printer.Print vbCrLf
    Printer.Print String(110, "-")
    Printer.Print langChar & "  ⁄œœ «·«—ﬁ«„  «·”—Ì… ··Â« ›:" & langChar & recsTotal
    Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    'Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
    
    tmpStr = errWannaPrint(UserLang)
    response = MsgBox(tmpStr, vbYesNo)
    If response = vbYes Then
       Printer.EndDoc
    Else
       Printer.KillDoc
    End If
End Sub


Public Sub generatePinActivityReport()
    Dim i As Integer
    Dim reportFile As String
    Dim pendingStatus As String, requestTypeDesc As String
    Dim oldBranchCode As String
    Dim strmsglen As String
    Dim recsAddressedToBranch As Integer
    Dim recsAddressedToMail As Integer
    Dim recsRejected As Integer
    Dim recsSuccessful As Integer, recsPending As Integer
    Dim recsTotal As Integer
    Dim tmpStr As String, tCode As String
    Dim requestType As String
    Dim response
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    
    recsAddressedToBranch = 0
    recsAddressedToMail = 0
    recsTotal = 0

'    Set fsys = CreateObject("scripting.filesystemobject")
'
'    Set fso = CreateObject("Scripting.FileSystemObject")
'    If (Not fso.FolderExists("c:\reports")) Then
'       fso.CreateFolder ("c:\reports")
''       Set Fold = fso.GetFolder("c:\")
''       Set SubFold = Fold.SubFolders
''       Set CreaFold = SubFold.Add("reports")
'    End If
'
'    reportFile = "c:\reports\newcustomer.prt"
'
'    Set textStream = fsys.CreateTextFile(reportFile, True)
    
    'langChar = Chr$(253)  ' for english
    
    langChar = Chr$(254)  ' for arabic
    
    oldBranchCode = "--------"
    
    Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 12
    Printer.FontBold = False
    'Printer.RightToLeft = False '  for english
    Printer.RightToLeft = True ' for arabic
    
    pinHeaderPrint
    Do While True
        On Error Resume Next
        For i = 1 To Val(recvPinActivityReport.noOfRecs)
            If recvPinActivityReport.details(i).deliveryToBranchOrPO = "C" Or _
               recvPinActivityReport.details(i).deliveryToBranchOrPO = "R" Or _
               recvPinActivityReport.details(i).deliveryToBranchOrPO = "B" Then
               recsAddressedToBranch = recsAddressedToBranch + 1
            Else
               recsAddressedToMail = recsAddressedToMail + 1
            End If
            recsTotal = recsTotal + 1
            tCode = recvPinActivityReport.details(i).pendingStatus
            
            If recvPinActivityReport.details(i).requestStatus >= "8" Then
               recsRejected = recsRejected + 1
               pendingStatus = "„— Ã⁄Â  "
            ElseIf recvPinActivityReport.details(i).pendingStatus = "1" Or _
                   recvPinActivityReport.details(i).pendingStatus = "2" Then
               recsPending = recsPending + 1
               pendingStatus = "„⁄·ﬁÂ"
            Else
               recsSuccessful = recsSuccessful + 1
               pendingStatus = "»‰Ã«Õ   "
            End If
            If recvPinActivityReport.details(i).requestType = "0" Then
               'requestType = "»ÿ«ﬁ… ÃœÌœÂ"
                requestType = "—ﬁ„ ”—Ì ÃœÌœ"
            ElseIf recvPinActivityReport.details(i).requestType = "1" Then
               requestType = "»ÿ«ﬁ… „ÃœœÂ "
            ElseIf recvPinActivityReport.details(i).requestType = "2" Then
               requestType = "»ÿ«ﬁ… »œÌ·Â"
            ElseIf recvPinActivityReport.details(i).requestType = "3" Then
               requestType = "—ﬁ„ ”—Ì »œÌ·"
            ElseIf recvPinActivityReport.details(i).requestType = "4" Then
               requestType = "«Ìﬁ«›       "
            ElseIf recvPinActivityReport.details(i).requestType = "5" Then
               requestType = " ‘€Ì·     "
            ElseIf recvPinActivityReport.details(i).requestType = "6" Then
               requestType = " €ÌÌ—  ⁄‰Ê«‰  "
            ElseIf recvPinActivityReport.details(i).requestType = "7" Then
               requestType = " Õ›Ÿ  "
            ElseIf recvPinActivityReport.details(i).requestType = "8" Then
               requestType = "›ﬂ  Õ›Ÿ   "
            ElseIf recvPinActivityReport.details(i).requestType = "9" Then
               requestType = "„—›Ê÷   "
            ElseIf recvPinActivityReport.details(i).requestType = "C" Then
               requestType = "ÕÊ·   «·Ï œÊ·ÌÂ"
            Else
                requestType = recvPinActivityReport.details(i).requestType & _
                              "-€Ì—  „⁄—Ê›"
            End If
                    
            Printer.Print recvPinActivityReport.details(i).coreAccNo & langChar & _
                     "  " & maskCardNo(recvPinActivityReport.details(i).cardNo) & langChar & _
                     " " & recvPinActivityReport.details(i).nameOnProduct & langChar & _
                     " " & Format(recvPinActivityReport.details(i).customerBranch, "!@@@@") & langChar & _
                     "  " & Format(requestType, "!@@@@@@@@@@@@") & _
                     "       " & Format(pendingStatus, "!@@@@@@@@@@@@")
            Printer.Print Format(recvPinActivityReport.details(i).requestUser, "!@@@@@@@@@@") & langChar & _
                     "      " & Format(recvPinActivityReport.details(i).supervisorId, "!@@@@@@@@@@")
                              
            lines = lines + 1
            lines = lines + 1
            If lines > 40 Then
               Printer.NewPage
               page = page + 1
               pinHeaderPrint
            End If
       Next
       If recvPinActivityReport.noOfRecs = "50" Then
          SendMsg = "000000" & "AL" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & recvPinActivityReport.lastRecCount & recvLoginMsg.bankingDate & "P" & Space(50)
          strmsglen = Format(Len(SendMsg), "000000")
          Mid$(SendMsg, 1, 6) = strmsglen
          DataReceivedFlag = False
          frmEnquiry.MousePointer = vbHourglass

          ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
          If ReturnStatus = LocalCommsError Then
             LoadError = True
             frmEnquiry.MousePointer = vbDefault
             Exit Sub
          End If
          frmEnquiry.MousePointer = vbDefault

          parsePinActivityReportDetails

          If recvPinActivityReport.status <> "000" Then
             Exit Do
          Else
             If recvPinActivityReport.noOfRecs = "00" Then
                Exit Do
             End If
          End If
       Else
          Exit Do
       End If
    Loop
    
    Printer.Print vbCrLf
    Printer.Print String(110, "-")
    Printer.Print langChar & "  „Ã„Ê⁄ ÿ·»«  «·»ÿ«ﬁ«   :" & langChar & str(recsPending + recsRejected + recsSuccessful)
    Printer.Print langChar & "  «·»ÿ«ﬁ«  «·’«œ—Â     : " & langChar & str(recsSuccessful)
    Printer.Print langChar & "  «·ÿ·»«  «·„⁄«œÂ   : " & langChar & str(recsRejected)
    Printer.Print langChar & "  «·ÿ·»«  «·„⁄·ﬁÂ   : " & langChar & str(recsPending)
    Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    'Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
    
    tmpStr = errWannaPrint(UserLang)
    response = MsgBox(tmpStr, vbYesNo)
    If response = vbYes Then
       Printer.EndDoc
    Else
       Printer.KillDoc
    End If
End Sub
Public Sub generateCardActivityReport()
    Dim i As Integer
    Dim reportFile As String
    Dim pendingStatus As String, requestTypeDesc As String
    Dim oldBranchCode As String
    Dim strmsglen As String
    Dim recsAddressedToBranch As Integer
    Dim recsAddressedToMail As Integer
    Dim recsRejected As Integer
    Dim recsSuccessful As Integer, recsPending As Integer
    Dim recsTotal As Integer
    Dim tmpStr As String, tCode As String
    Dim requestType As String
    Dim response
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    
    recsAddressedToBranch = 0
    recsAddressedToMail = 0
    recsTotal = 0

'    Set fsys = CreateObject("scripting.filesystemobject")
'
'    Set fso = CreateObject("Scripting.FileSystemObject")
'    If (Not fso.FolderExists("c:\reports")) Then
'       fso.CreateFolder ("c:\reports")
''       Set Fold = fso.GetFolder("c:\")
''       Set SubFold = Fold.SubFolders
''       Set CreaFold = SubFold.Add("reports")
'    End If
'
'    reportFile = "c:\reports\newcustomer.prt"
'
'    Set textStream = fsys.CreateTextFile(reportFile, True)
    
    'langChar = Chr$(253)  ' for english
    
    langChar = Chr$(254)  ' for arabic
    
    oldBranchCode = "--------"
    
    Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 12
    Printer.FontBold = False
    'Printer.RightToLeft = False '  for english
    Printer.RightToLeft = True ' for arabic
    
    cardHeaderPrint
    Do While True
        On Error Resume Next
        For i = 1 To Val(recvCardActivityReport.noOfRecs)
            If recvCardActivityReport.details(i).deliveryToBranchOrPO = "C" Or _
               recvCardActivityReport.details(i).deliveryToBranchOrPO = "R" Or _
               recvCardActivityReport.details(i).deliveryToBranchOrPO = "B" Then
               recsAddressedToBranch = recsAddressedToBranch + 1
            Else
               recsAddressedToMail = recsAddressedToMail + 1
            End If
            recsTotal = recsTotal + 1
            tCode = recvCardActivityReport.details(i).pendingStatus
            
            If recvCardActivityReport.details(i).requestStatus >= "8" Then
               recsRejected = recsRejected + 1
               pendingStatus = "„— Ã⁄Â  "
            ElseIf recvCardActivityReport.details(i).pendingStatus = "1" Or _
                   recvCardActivityReport.details(i).pendingStatus = "2" Then
               recsPending = recsPending + 1
               pendingStatus = "„⁄·ﬁÂ"
            Else
               recsSuccessful = recsSuccessful + 1
               pendingStatus = "»‰Ã«Õ   "
            End If
            If recvCardActivityReport.details(i).requestType = "0" Then
               requestType = "»ÿ«ﬁ… ÃœÌœÂ"
            ElseIf recvCardActivityReport.details(i).requestType = "1" Then
               requestType = "»ÿ«ﬁ… „ÃœœÂ "
            ElseIf recvCardActivityReport.details(i).requestType = "2" Then
               requestType = "»ÿ«ﬁ… »œÌ·Â"
            ElseIf recvCardActivityReport.details(i).requestType = "3" Then
               requestType = "—ﬁ„ ”—Ì »œÌ·"
            ElseIf recvCardActivityReport.details(i).requestType = "4" Then
               requestType = "«Ìﬁ«›       "
            ElseIf recvCardActivityReport.details(i).requestType = "5" Then
               requestType = " ‘€Ì·     "
            ElseIf recvCardActivityReport.details(i).requestType = "6" Then
               requestType = " €ÌÌ—  ⁄‰Ê«‰  "
            ElseIf recvCardActivityReport.details(i).requestType = "7" Then
               requestType = " Õ›Ÿ  "
            ElseIf recvCardActivityReport.details(i).requestType = "8" Then
               requestType = "›ﬂ  Õ›Ÿ   "
            ElseIf recvCardActivityReport.details(i).requestType = "9" Then
               requestType = "„—›Ê÷   "
            ElseIf recvCardActivityReport.details(i).requestType = "C" Then
               requestType = "ÕÊ·   «·Ï œÊ·ÌÂ"
            Else
                requestType = recvCardActivityReport.details(i).requestType & _
                              "-€Ì—  „⁄—Ê›"
            End If
                    
            'Printer.Print ("Account Number " & "Card Number  " & "      Name on the card " & _
                            "     Issue Date" & "   Pending Status   " & _
                            "   Request Type  " & "  Customer Branch " & "   User requested   ")
            
            Printer.Print recvCardActivityReport.details(i).coreAccNo & langChar & _
                     "  " & maskCardNo(recvCardActivityReport.details(i).cardNo) & langChar & _
                     " " & recvCardActivityReport.details(i).nameOnProduct & langChar & _
                     " " & formatDate(recvCardActivityReport.details(i).issueDate) & langChar & _
                     "     " & pendingStatus & _
                     "  " & requestType
            Printer.Print "    " & Format(recvCardActivityReport.details(i).requestBranch, "!@@@@") & langChar & _
                     "      " & Format(recvCardActivityReport.details(i).requestUser, "!@@@@@@@@@@") & langChar & _
                     "      " & Format(recvCardActivityReport.details(i).supervisorId, "!@@@@@@@@@@")
                              
            lines = lines + 1
            lines = lines + 1
            If lines > 40 Then
               Printer.NewPage
               page = page + 1
               cardHeaderPrint
            End If
       Next
       If recvCardActivityReport.noOfRecs = "50" Then
          SendMsg = "000000" & "AL" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & recvCardActivityReport.lastRecCount & recvLoginMsg.bankingDate & "C" & Space(50)
          strmsglen = Format(Len(SendMsg), "000000")
          Mid$(SendMsg, 1, 6) = strmsglen
          DataReceivedFlag = False
          frmEnquiry.MousePointer = vbHourglass

          ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
          If ReturnStatus = LocalCommsError Then
             LoadError = True
             frmEnquiry.MousePointer = vbDefault
             Exit Sub
          End If
          frmEnquiry.MousePointer = vbDefault

          parseCardActivityReportDetails

          If recvCardActivityReport.status <> "000" Then
             Exit Do
          Else
             If recvCardActivityReport.noOfRecs = "00" Then
                Exit Do
             End If
          End If
       Else
          Exit Do
       End If
    Loop
    
    Printer.Print vbCrLf
    Printer.Print String(110, "-")
    Printer.Print langChar & "  „Ã„Ê⁄ ÿ·»«  «·»ÿ«ﬁ«   :" & langChar & str(recsPending + recsRejected + recsSuccessful)
    Printer.Print langChar & "  «·»ÿ«ﬁ«  «·’«œ—Â     : " & langChar & str(recsSuccessful)
    Printer.Print langChar & "  «·ÿ·»«  «·„⁄«œÂ   : " & langChar & str(recsRejected)
    Printer.Print langChar & "  «·ÿ·»«  «·„⁄·ﬁÂ   : " & langChar & str(recsPending)
    Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    'Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
    
    tmpStr = errWannaPrint(UserLang)
    response = MsgBox(tmpStr, vbYesNo)
    If response = vbYes Then
       Printer.EndDoc
    Else
       Printer.KillDoc
    End If
End Sub

Public Sub generateNewCustomerReport()
    Dim i As Integer
    Dim reportFile As String
    Dim tChequeType As String, tRequestStatus As String
    Dim oldBranchCode As String
    Dim strmsglen As String
    Dim recsCreatedThroughQuickScreen As Integer
    Dim recsCreatedNormal As Integer
    Dim recsTotal As Integer
    Dim tmpStr As String
    Dim response
    Dim fso As FileSystemObject
    Dim Fold, SubFold, CreaFold, ts
    
    recsCreatedThroughQuickScreen = 0
    recsCreatedNormal = 0
    recsTotal = 0

    Set fsys = CreateObject("scripting.filesystemobject")
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    If (Not fso.FolderExists("c:\reports")) Then
       fso.CreateFolder ("c:\reports")
'       Set Fold = fso.GetFolder("c:\")
'       Set SubFold = Fold.SubFolders
'       Set CreaFold = SubFold.Add("reports")
    End If
    
    reportFile = "c:\reports\newcustomer.prt"

    Set textStream = fsys.CreateTextFile(reportFile, True)
    
    'langChar = Chr$(253)  ' for english
    
    langChar = Chr$(254)  ' for arabic
    
    oldBranchCode = "--------"
    
    Printer.Orientation = vbPRORLandscape    ' for landscape
    Printer.FontName = "Courier New (Arabic)"
    Printer.FontSize = 12
    Printer.FontBold = False
    'Printer.RightToLeft = False '  for english
    Printer.RightToLeft = True ' for arabic
    
    headerPrint
    Do While True
        On Error Resume Next
        For i = 1 To Val(recvNewCustomerReport.noOfRecs)
        
            If recvNewCustomerReport.details(i).createdThroQuickScreen = "1" Then
               recsCreatedThroughQuickScreen = recsCreatedThroughQuickScreen + 1
            Else
               recsCreatedNormal = recsCreatedNormal + 1
            End If
            recsTotal = recsTotal + 1
            
            textStream.WriteLine (recvNewCustomerReport.details(i).custNo & langChar & _
                              "       " & Trim(recvNewCustomerReport.details(i).custName) & langChar & _
                              "       " & recvNewCustomerReport.details(i).custBranchCode & _
                              "      " & recvNewCustomerReport.details(i).createdThroQuickScreen & langChar)
            Printer.Print recvNewCustomerReport.details(i).custNo & langChar & _
                              "       " & recvNewCustomerReport.details(i).custName & langChar & _
                              "       " & recvNewCustomerReport.details(i).custBranchCode & _
                              "      " & IIf(recvNewCustomerReport.details(i).createdThroQuickScreen = "1", "  ‰⁄„  ", "  ·«  ") & langChar
                              
            lines = lines + 1
            If lines > 50 Then
               Printer.NewPage
               page = page + 1
               headerPrint
            End If
        Next
        If recvNewCustomerReport.noOfRecs = "50" Then
           SendMsg = "000000" & "AF" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & recvNewCustomerReport.lastRecCount & recvLoginMsg.bankingDate & Space(50)
           strmsglen = Format(Len(SendMsg), "000000")
           Mid$(SendMsg, 1, 6) = strmsglen
           DataReceivedFlag = False
           frmEnquiry.MousePointer = vbHourglass

           ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
           If ReturnStatus = LocalCommsError Then
              LoadError = True
              frmEnquiry.MousePointer = vbDefault
              Exit Sub
           End If
           frmEnquiry.MousePointer = vbDefault

           parseNewCustomerReportDetails

           If recvNewCustomerReport.status <> "000" Then
              Exit Do
           Else
              If recvNewCustomerReport.noOfRecs = "00" Then
                 Exit Do
              End If
           End If
        Else
           Exit Do
        End If
    Loop
    
    textStream.WriteLine
    Printer.Print vbCrLf
    textStream.WriteLine (String(110, "-"))
    Printer.Print String(110, "-")
    textStream.WriteLine "Number of new customers opened :" & str(recsCreatedThroughQuickScreen + recsCreatedNormal)
       'Printer.Print langChar + "⁄œœ œ›« — «·‘Ìﬂ«  «·„ÿ·Ê»… :" + langChar + str(recsCreated) + langChar
    Printer.Print langChar & "„Ã„Ê⁄ «·⁄„·«¡ «·Ãœœ  :" & langChar & str(recsCreatedThroughQuickScreen + recsCreatedNormal)
    Printer.Print langChar & "„Ã„Ê⁄ «·⁄„·« «·„‰‘∆Ì‰ „‰ Œ·«· «·› Õ «·”—Ì⁄     : " & langChar & str(recsCreatedThroughQuickScreen)
    Printer.Print langChar & "„Ã„Ê⁄ «·⁄„·«¡ «·„‰‘∆Ì‰ „‰ Œ·«· «·› Õ «·⁄«œÌ   : " & langChar & str(recsCreatedNormal)
    textStream.WriteLine (String(50, "-") & "END OF REPORT" & String(50, "-"))
    Printer.Print String(50, "-") + "‰Â«Ì… «· ﬁ—Ì—" + langChar + String(50, "-")
    'Printer.Print (String(50, "-") & "END OF REPORT" & String(50, "-"))
        
    textStream.Close
    tmpStr = errWannaPrint(UserLang)
    response = MsgBox(tmpStr, vbYesNo)
    If response = vbYes Then
       Printer.EndDoc
    Else
       Printer.KillDoc
    End If
End Sub
Public Sub tpinHeaderPrint()
   Dim branchName As String * 30
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
      
   Set rs = db.OpenRecordset("select arabicname from branchinfo where branchcode = '" & gBranchCode & "'")
   
   If rs.recordCount > 0 Then
      branchName = rs(0)
   Else
      branchName = "—ﬁ„ «·›—⁄ Œÿ√ [" + gBranchCode + "]"
   End If
   
   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   
   Printer.Print "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì        (CSD05)                                                   «· «—ÌŒ : " & Format(tDay, "00") & "/" & _
                                                                                                                    Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   Printer.Print "                          «· ﬁ—Ì—  «·ÌÊ„Ì ·«—ﬁ«„  «·Â« › «·”—Ì…  " & formatDate(recvTpinActivityReport.reportDate) & langChar & _
                                        "             «·Êﬁ  : " & Format(Time, "hh:mm:ss")
   Printer.Print "›—⁄ :" & gBranchCode & langChar & "     " & branchName & langChar _
                            ; "                                           ’›ÕÂ : " & CStr(page) & langChar
   'Printer.Print "Branch :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                 Page : " & CStr(page) & langChar
   Printer.Print String(110, "-")
   
   Printer.Print "—ﬁ„ «·⁄„Ì·   " & "«·«”„ «·„Œ ’— " & "         ›—⁄ «·⁄„Ì·  " & " «·„” Œœ„" & "  «·„‘—›   " & _
                            "      «· «—Œ/«·Êﬁ  " & "      «—ÌŒ/Êﬁ  «·„Ê«›ﬁ…   "
   'Printer.Print "  «·„” Œœ„ " & "  ÂÊÌ… «·„‘—›   "
   Printer.Print String(110, "-")
   lines = 6
End Sub

Public Sub pinHeaderPrint()
   Dim branchName As String * 30
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
      
   Set rs = db.OpenRecordset("select arabicname from branchinfo where branchcode = '" & gBranchCode & "'")
   
   If rs.recordCount > 0 Then
      branchName = rs(0)
   Else
      branchName = "—ﬁ„ «·›—⁄ Œÿ√ [" + gBranchCode + "]"
   End If
   
   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   
   Printer.Print "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì        (CSD04)                                                   «· «—ÌŒ : " & Format(tDay, "00") & "/" & _
                                                                                                                    Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   Printer.Print "                           ﬁ—Ì— «·«—ﬁ«„ «·”—Ì… ·»ÿ«ﬁ«  «·’—«›  " & formatDate(recvPinActivityReport.reportDate) & langChar & _
                                        "              «·Êﬁ  : " & Format(Time, "hh:mm:ss")
   Printer.Print "›—⁄ :" & gBranchCode & langChar & "     " & branchName & langChar _
                            ; "                                           ’›ÕÂ : " & CStr(page) & langChar
   'Printer.Print "Branch :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                 Page : " & CStr(page) & langChar
   Printer.Print String(110, "-")
   Printer.Print "—ﬁ„ «·Õ”«» " & "        —ﬁ„ «·»ÿ«ﬁÂ  " & " «”„ ’«Õ» «·»ÿ«ﬁÂ   " & _
                            "  ›—⁄ «·⁄„Ì· " & "      ‰Ê⁄ «·ÿ·»   " & _
                            "      Õ«·… «·ÿ·»   "
   Printer.Print " ÂÊÌ… «·„” Œœ„ " & "  ÂÊÌ… «·„‘—›   "
   Printer.Print String(110, "-")
   lines = 7
End Sub

Public Sub cardHeaderPrint()
   Dim branchName As String * 30
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
      
   Set rs = db.OpenRecordset("select arabicname from branchinfo where branchcode = '" & gBranchCode & "'")
   
   If rs.recordCount > 0 Then
      branchName = rs(0)
   Else
      branchName = "—ﬁ„ «·›—⁄ Œÿ√ [" + gBranchCode + "]"
   End If
   
   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   
   Printer.Print "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì        (CSD03)                                                   «· «—ÌŒ : " & Format(tDay, "00") & "/" & _
                                                                                                                    Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   Printer.Print "                           ﬁ—Ì—  «·Õ—ﬂ«   «·ÌÊ„ÌÂ ··»ÿ«ﬁ«   " & formatDate(recvCardActivityReport.reportDate) & langChar & _
                                        "                 «·Êﬁ  : " & Format(Time, "hh:mm:ss")
   Printer.Print "›—⁄ :" & gBranchCode & langChar & "     " & branchName & langChar _
                            ; "                                           ’›ÕÂ : " & CStr(page) & langChar
   'Printer.Print "Branch :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                 Page : " & CStr(page) & langChar
   Printer.Print String(110, "-")
   Printer.Print "—ﬁ„ «·Õ”«» " & "       —ﬁ„ «·»ÿ«ﬁÂ  " & "      «”„ ’«Õ» «·»ÿ«ﬁÂ   " & _
                            "      «—ÌŒ «·«’œ«— " & "      Õ«·…   " & _
                            "   ‰Ê⁄ «·ÿ·»  "
   Printer.Print "   ›—⁄ «·⁄„Ì·  " & "  «·„” Œœ„   " & "  ÂÊÌ… «·„‘—›   "
   Printer.Print String(110, "-")
   lines = 7
End Sub

Public Sub headerPrint()
   Dim branchName As String
   Dim tDay As String
   Dim tMonth As String
   Dim tYear As String
      
   Set rs = db.OpenRecordset("select arabicname from branchinfo where branchcode = '" & gBranchCode & "'")
   
   If rs.recordCount > 0 Then
      branchName = rs(0)
   Else
      branchName = "—ﬁ„ «·›—⁄ Œÿ√ [" + gBranchCode + "]"
   End If
   
   tDay = Day(Date$)
   tMonth = Month(Date$)
   tYear = Year(Date$)
   
   page = page + 1
   Printer.CurrentX = 0
   Printer.CurrentY = 0
   
   textStream.WriteLine ("«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì                                                 «· «—ÌŒ   : " & Format(Date$, "dd/mm/yyyy") & "      Time  : " & Format(Time, "hh:mm:ss"))
   
   Printer.Print "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì        (CSD02)                                                 «· «—ÌŒ   : " & Format(tDay, "00") & "/" & _
                                                                                                                    Format(tMonth, "00") & "/" & Format(tYear, "0000") 'Format(Date$, "dd/mm/yyyy")
   textStream.WriteLine ("                          New customers opened for " & formatDate(recvNewCustomerReport.reportDate) & langChar)
   Printer.Print "                          ”Ã·«  «·⁄„·«¡ «·Ãœœ «·„› ÊÕ… » «—ÌŒ  " & formatDate(recvNewCustomerReport.reportDate) & langChar & _
                                        "                 «·Êﬁ  : " & Format(Time, "hh:mm:ss")
   textStream.WriteLine ("Branch : " + gBranchCode + "     " + branchName + langChar + _
                         "                                                                Page  : " + CStr(page) + langChar)
   Printer.Print "›—⁄ :" + gBranchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                 ’›ÕÂ  : " + CStr(page) + langChar
   'Printer.Print "Branch :" + branchCode + langChar + "     " + branchName + langChar _
                            ; "                                                                 Page : " & CStr(page) & langChar
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   textStream.WriteLine ("—ﬁ„ «·⁄„Ì·  " & "«”„ «·⁄„Ì·           " & "—ﬁ„ ›—⁄ «·⁄„Ì· " & _
                            "√‰‘∆ „‰ Œ·«· «·› Õ «·”—Ì⁄")
   Printer.Print ("—ﬁ„ «·⁄„Ì·  " & "   «”„ «·⁄„Ì·           " & "      —ﬁ„ ›—⁄ «·⁄„Ì· " & _
                            "     √‰‘∆ „‰ Œ·«· «·› Õ «·”—Ì⁄")
   textStream.WriteLine (String(110, "-"))
   Printer.Print String(110, "-")
   lines = 6
End Sub
Public Sub readSwiftTransferPendingList(lastRecRead As String, activityFlag As String, branchCode As String)
    Dim userId As String * 10
    Dim strmsglen As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    
    formatSwiftTransferPendingListRequest activityFlag, lastRecRead, branchCode
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    frmEnquiry.cmdCustomer.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       frmEnquiry.cmdCustomer.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = "   "
       Exit Sub
    End If
    parseSwiftTransferPendingListDetails
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    frmEnquiry.cmdCustomer.Enabled = True
    'frmSwiftTransferPendingList.cmbBranchcode = branchCode
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Public Sub readSadadReversalPendingList(lastRecRead As String, pendingFlag As String, transRefNo As String)
    Dim userId As String * 10
    Dim strmsglen As String
    
    userId = Format(gUserId, "!@@@@@@@@@@")
    
    formatSadadReversalPendingListRequest lastRecRead, pendingFlag, transRefNo
    frmEnquiry.MousePointer = vbHourglass
    frmEnquiry.cmdCancel.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmEnquiry.MousePointer = vbDefault
       frmEnquiry.cmdCancel.Enabled = True
       CSD_mdiForm.staticStatus.Panels(3).text = "   "
       Exit Sub
    End If
    parseSadadReversalPendingListDetails
    frmEnquiry.MousePointer = vbDefault
    frmEnquiry.cmdCancel.Enabled = True
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub


