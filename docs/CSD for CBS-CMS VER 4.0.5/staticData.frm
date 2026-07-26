VERSION 5.00
Begin VB.Form frmLogin 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00BFD87E&
   Caption         =   "STATIC DATA MAINTENANCE"
   ClientHeight    =   8565
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   8880
   ControlBox      =   0   'False
   Icon            =   "staticData.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8565
   ScaleWidth      =   8880
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer2 
      Interval        =   500
      Left            =   495
      Top             =   2385
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   7875
      Left            =   15
      TabIndex        =   0
      Top             =   60
      Width           =   11535
      Begin VB.TextBox txtDate 
         BackColor       =   &H00BFD87E&
         Enabled         =   0   'False
         ForeColor       =   &H00800000&
         Height          =   375
         Left            =   9120
         TabIndex        =   9
         Text            =   "dd/mm/yyyy"
         Top             =   990
         Visible         =   0   'False
         Width           =   975
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "Exit"
         Height          =   375
         Left            =   6270
         TabIndex        =   8
         Top             =   5760
         Width           =   1575
      End
      Begin VB.CommandButton cmdOK 
         Caption         =   "OK"
         Default         =   -1  'True
         Height          =   375
         Left            =   4440
         TabIndex        =   7
         Top             =   5760
         Width           =   1575
      End
      Begin VB.TextBox txtPassword 
         BackColor       =   &H8000000A&
         Height          =   375
         IMEMode         =   3  'DISABLE
         Left            =   5280
         MaxLength       =   16
         PasswordChar    =   "*"
         TabIndex        =   4
         Top             =   4680
         Width           =   1815
      End
      Begin VB.TextBox txtUserId 
         BackColor       =   &H8000000B&
         Height          =   375
         Left            =   5280
         MaxLength       =   20
         TabIndex        =   3
         Text            =   " "
         Top             =   4080
         Width           =   1815
      End
      Begin VB.Image anbLogo1 
         Height          =   885
         Left            =   4515
         Picture         =   "staticData.frx":030A
         Top             =   840
         Visible         =   0   'False
         Width           =   1905
      End
      Begin VB.Label lblDate 
         Appearance      =   0  'Flat
         BackColor       =   &H00BFD87E&
         Caption         =   "Date"
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
         Height          =   375
         Left            =   8925
         TabIndex        =   14
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label lblArbUserId 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00BFD87E&
         Caption         =   "User Id"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   375
         Left            =   7680
         TabIndex        =   13
         Top             =   4080
         Width           =   1335
      End
      Begin VB.Label lblArbPass 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00BFD87E&
         Caption         =   "Password"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   375
         Left            =   7680
         TabIndex        =   12
         Top             =   4680
         Width           =   1335
      End
      Begin VB.Label lblVersion 
         BackColor       =   &H00BFD87E&
         Caption         =   "Ver 2.5"
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
         Left            =   4920
         TabIndex        =   11
         Top             =   3360
         Width           =   975
      End
      Begin VB.Image anbLogo 
         Height          =   1335
         Left            =   135
         Picture         =   "staticData.frx":5BCC
         Top             =   240
         Width           =   2775
      End
      Begin VB.Label lblTime 
         Appearance      =   0  'Flat
         BackColor       =   &H00BFD87E&
         Caption         =   "Time"
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
         Height          =   375
         Left            =   10200
         TabIndex        =   10
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label4 
         BackColor       =   &H00BFD87E&
         Caption         =   "LOGON WINDOW "
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   14.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   495
         Left            =   4320
         TabIndex        =   6
         Top             =   2880
         Width           =   2655
      End
      Begin VB.Label Label3 
         BackColor       =   &H00BFD87E&
         Caption         =   "STATIC DATA MAINTENANCE"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   21.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   735
         Left            =   2640
         TabIndex        =   5
         Top             =   1920
         Width           =   6975
      End
      Begin VB.Label Label2 
         BackColor       =   &H00BFD87E&
         Caption         =   "Password"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   375
         Left            =   3840
         TabIndex        =   2
         Top             =   4680
         Width           =   1335
      End
      Begin VB.Label Label1 
         BackColor       =   &H00BFD87E&
         Caption         =   "User Id"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   375
         Left            =   3840
         TabIndex        =   1
         Top             =   4080
         Width           =   1335
      End
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Modification History

'   Ver       Author   Date            Details
'   ----------------------------------------------
'   1.1      Rajesh    Jan '01        Changed the Mouse pointer to Hour glass
'                                     during access to server
'
'   1.2      Rajesh    Feb '01        i) disabled delivery address modification
'                                        When delivery to Branch is selected and kept the branch address
'                                        enabled only when delivery to POBox is selected
'                                    ii) in the refresh local DB procedure, while updating Branchinfo
'                                        there were two mid$(recvstr,130,10). The later one has been changed to
'                                        to mid$(recvstr,140,10)
'
'   1.3      Rajesh    Mar '01      Diabled ATM Card Frame due to the
'                                   problem of A2000 refreshing card data
'                                   to CPDB.
'
'   2.0      Rajesh    Sep.'01      Included Card Management System ; Enabled the ATM Card frame
'                                   at the time of opening the customer also
'
'   2.1      Rajesh    Sep.'01      Added MDI form to the CMS
'
'   2.2      Rajesh    Dec.01       Static Data Phase-II.  Added Account Maintenance; Standing Order;
'                                   Stop Cheque ; Cheque book request ; On-demand statement ;
'                                   Transaction enquiry ; Cheque book tracking ;
'                                   A/c status change history
'
'   2.3      Rajesh    Dec.01        i)Included customer # and customer name in account grid and
'                                      also in all the enquiry like standing order, stop cheque etc..
'                                   ii)While issuing the new card, if the requested card
'                                      is a primary card, then the customer name will be defaulted
'                                      in name on the card also(only if it is a english name)
'
'   2.5.0   Rajesh    July 2004        Modified the client for SAMA account opening regulations
'
'   2.5.1   Rajesh    July 2004     Incorporated the printing of Historical statements from Static
'                                   data replacing DOS version of Historical statement from branches
'
'   2.5.2   Rajesh
'
'   2.5.3   Rajesh    Sep 2004      1. Introduced the SADAD enquiry for utility bills
'                                   2. SARIE/SWIFT Transfer enquiry (for payments section)
'                                   3. TPIN is made mandatory while opening new customers
'                                   4. Enhanced Historical statement printing
'                                   5. Handled Idle timeout from client. After Idle timeout
'                                      it will ask the password to proceed
'                                   6. Prevented same user to login from two different workstation
'
'  2.5.4    Rajesh    Nov 2004      1. Prevent the user from terminating CSD window
'                                      by pressing 'X' button(top right). Forced the
'                                      user to exit using
'
'  2.5.5    Rajesh    Feb 2005      As part of Credit card arrear blocking project,
'                                   CSD is enhanced to show the breakup of blocking amount
'
'  2.5.6    Rajesh    Feb 2005      As per Collection dept request, a manual credit card
'                                   blocking feature is introduced
'
'  2.5.7    Rajesh    May 2005      Introduced "SEARCH ENGINE" feature to check the
'                                   name in TLIST or not (while opening new customer/account)
'
'  2.5.8    Rajesh    Jan 2006      Modified the Standing order creation as follows
'                                    1. Auto generation of SOD number for every account
'                                       instead of SOD number being entered by user
'                                    2. S/O creation is made centralized only from BOC
'                                       (i.e., only configured branch can create S/O)
'
'
' 2.5.9     Rajesh    Jan 2006      Incorporated the comments in standing order to prevent
'                                   important s/o being closed by mistake.  i.e., Users will
'                                   write their comments while creating the important s/o.
'                                   And, anybody trying to cancel that s/o will get that
'                                   comments. so, they will stop cancelling that S/o
'
'
' 2.6.0     Rajesh    Feb 2006     Enhanced for the following feature
'                                   - Avoid opening multiple customers numbers for
'                                     the same ID (Saudi ID or Iqama)
'                                   - Avoid update of customer name from
'                                     branches (updates allowed only by Mandate branch)
'                                   - Restrict enquiries for private banking accounts
'                                   -  Manual Account blocking
'                                   -  Facility to print Historical statement for
'                                      deleted accounts (Facility only allowed for Historical
'                                      statement delivery unit, Sulay).
'                                   - Modified CARDS portion to request smart card type cards
'                                     and it is made configuarable on branch
'
' 2.6.1     Rajesh    Mar 2006     Opening customers through Quick screen to speed up
'                                  customer opening from branches.
'
' 2.6.2     Rajesh    Apr 2006     - Added Date of birth field in Quick screen
'                                  - Returned mail handling
'                                  - Customer searching using mobile number
'                                  - Added a new field "Marketing memo" in customer opening
'                                    for upscale purpose
'
'
' 2.6.3     Rajesh    Jun 2006     Enhanced for new Saudi GPS postal customer address


Private Type sysCtrl
   recType As String * 2
   sortCode As String * 8
   branchCode As String * 4
   branchName As String * 30
   filler As String * 600
End Type

Private Sub cmdExit_Click()
   Unload Me
   End
End Sub

Private Sub cmdOk_Click()
Static NoOfTries As String, tUserid As String
Dim tPassword As String
Dim mDate, mMonth, mYear, noOfDays
Dim nDate As Date
Dim tmpStr As String

If Len(RTrim(txtUserId.text)) = 0 Or Len(RTrim(txtPassword)) = 0 Then
   MsgBox errLogon(UserLang) '"Please  Logon using your Userid & password"
   frmLogin.txtUserId.SetFocus
   Exit Sub
End If

If NoOfTries < "1" Then
   tUserid = Trim(frmLogin.txtUserId)
   NoOfTries = "1"
End If
If Trim(tUserid) <> Trim(frmLogin.txtUserId) Then
   NoOfTries = "1"
   tUserid = Trim(frmLogin.txtUserId)
End If
populateCaptionArrays
populateCaptionArrays1
populateCaptionArrayForSAR
populateApplicationCaptions
CSD_mdiForm.staticStatus.Panels(3).text = errLoggingOn(UserLang)  '   "Logging on...Please wait..."
frmLogin.MousePointer = vbHourglass
frmLogin.txtUserId.Enabled = False
frmLogin.txtPassword.Enabled = False
frmLogin.cmdOk.Enabled = False
frmLogin.cmdExit.Enabled = False
gUserId = Trim(txtUserId)

gBranchCode = rBranchCode
tPassword = Encrypt(txtPassword)

FormatLoginRequest Trim(txtUserId), tPassword, gBranchCode, NoOfTries, False
CSD_mdiForm.staticStatus.Panels(3).text = errReceiveFromHost(UserLang)
frmEnquiry.Hide ' this line will call form_load procedure
                ' of frmenquiry which connects to static server
DataReceivedFlag = False
retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
If retStatus = LocalCommsError Then
   LoadError = True
   Unload frmEnquiry
   frmLogin.MousePointer = vbDefault
   frmLogin.txtUserId.Enabled = True
   frmLogin.txtPassword.Enabled = True
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   CSD_mdiForm.staticStatus.Panels(3).text = errErrorAtServer(UserLang)  '  "Communication error while reading from server"
   Exit Sub
End If
If UserLang = ENGLISH Then
   CSD_mdiForm.staticStatus.Panels(3).text = recvLoginMsg.eRemarks
Else
   CSD_mdiForm.staticStatus.Panels(3).text = recvLoginMsg.aRemarks
End If
gUserId = Trim(txtUserId)

If recvLoginMsg.status = "000" Then
   LogData "User " & gUserId & "  Successfully logged in"
   NoOfTries = "0"
   If recvLoginMsg.langPref = "0" Then
      UserLang = ARABIC   ' 0 is for Arabic
   Else
      UserLang = ENGLISH  ' 1 is for English
   End If
   formatAuthLevel
   If InStr(recvLoginMsg.authorityLevel, "~00") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~01") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~02") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~4") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~6") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~3") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~99") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~8") = 0 Then
      LogData "user not authorized to access this application due to insufficient priviledges"
      CSD_mdiForm.staticStatus.Panels(3).text = errNotAuthorised(UserLang)
      frmLogin.MousePointer = vbDefault
      MsgBox errNotAuthorised(UserLang) '"You are not authorised to access this application..Contact Security officer"
      Unload Me
      End
    End If
    
    If InStr(recvLoginMsg.authorityLevel, "~99") = 0 Then  ' if the authoritylevel does not contain 70
        If gBranchCode <> recvLoginMsg.branchCode Then
           LogData "User is not authorized to access the application in this branch"
           LogData "This branch code is =" + gBranchCode + " and the user's branch code is " + recvLoginMsg.branchCode
           CSD_mdiForm.staticStatus.Panels(3).text = errNotAuthorisedBranch(UserLang)
           frmLogin.MousePointer = vbDefault
           MsgBox errNotAuthorisedBranch(UserLang)
           Unload Me
           End
        End If
    End If
    If recvLoginMsg.passwdChngAlertFlag = "1" Then
       response = MsgBox(errPasswordAlert(UserLang), vbYesNo)
       If response = vbYes Then
          passwordChange = False
          CSD_mdiForm.staticStatus.Panels(3).text = " "
          frmLogin.MousePointer = vbDefault
          frmLogin.txtUserId.Enabled = True
          frmLogin.txtPassword.Enabled = True
          frmLogin.cmdOk.Enabled = True
          frmLogin.cmdExit.Enabled = True
          frmChangePassword.Show vbModal
       Else
          frmLogin.MousePointer = vbDefault
          frmLogin.txtUserId.Enabled = True
          frmLogin.txtPassword.Enabled = True
          frmLogin.cmdOk.Enabled = True
          frmLogin.cmdExit.Enabled = True
          loadEnquiryForm
       End If
    Else
       frmLogin.MousePointer = vbDefault
       frmLogin.txtUserId.Enabled = True
       frmLogin.txtPassword.Enabled = True
       frmLogin.cmdOk.Enabled = True
       frmLogin.cmdExit.Enabled = True
       loadEnquiryForm
    End If
    
ElseIf recvLoginMsg.status = "107" Then
    frmEnquiry.Hide
    frmLogin.MousePointer = vbDefault
    If recvLoginMsg.langPref = "0" Then
       UserLang = ARABIC
    Else
       UserLang = ENGLISH
    End If
    formatAuthLevel
    If InStr(recvLoginMsg.authorityLevel, "~00") = 0 And _
       InStr(recvLoginMsg.authorityLevel, "~01") = 0 And _
       InStr(recvLoginMsg.authorityLevel, "~02") = 0 And _
       InStr(recvLoginMsg.authorityLevel, "~4") = 0 And _
       InStr(recvLoginMsg.authorityLevel, "~6") = 0 And _
       InStr(recvLoginMsg.authorityLevel, "~3") = 0 And _
       InStr(recvLoginMsg.authorityLevel, "~99") = 0 And _
       InStr(recvLoginMsg.authorityLevel, "~8") = 0 Then
       frmLogin.MousePointer = vbDefault
       LogData "User not authorized to access this application due to insufficient priviledges"
       MsgBox errNotAuthorised(UserLang) '"You are not authorised to access this application..Contact Security officer"
       Unload Me
       End
    End If
    If InStr(recvLoginMsg.authorityLevel, "~99") = 0 Then
       If gBranchCode <> recvLoginMsg.branchCode Then
          CSD_mdiForm.staticStatus.Panels(3).text = errNotAuthorisedBranch(UserLang)
          LogData "User is not authorized to access the application in this branch"
          LogData "This branch code is =" + gBranchCode + " and the user's branch code is " + recvLoginMsg.branchCode
          frmLogin.MousePointer = vbDefault
          MsgBox errNotAuthorisedBranch(UserLang)
          Unload Me
          End
      End If
    End If
    LogData "Password has been expired..Please change"
    MsgBox errExpiredPassword(UserLang) '"Your Password has been expired..Please change your password"
    passwordChange = False
    CSD_mdiForm.staticStatus.Panels(3).text = " "
    frmLogin.MousePointer = vbDefault
    frmLogin.txtUserId.Enabled = True
    frmLogin.txtPassword.Enabled = True
    frmLogin.cmdOk.Enabled = True
    frmLogin.cmdExit.Enabled = True
    frmChangePassword.Show vbModal
ElseIf recvLoginMsg.status = "101" Then
   frmEnquiry.Hide
   If recvLoginMsg.langPref = "0" Then
      UserLang = ARABIC
   Else
      UserLang = ENGLISH
   End If
   formatAuthLevel
   If InStr(recvLoginMsg.authorityLevel, "~00") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~01") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~02") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~4") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~6") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~3") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~99") = 0 And _
      InStr(recvLoginMsg.authorityLevel, "~8") = 0 Then
      frmLogin.MousePointer = vbDefault
      LogData "User not authorized to access this application due to insufficient priviledges"
      MsgBox errNotAuthorised(UserLang) '"You are not authorised to access this application..Contact Security officer"
      Unload Me
      End
   End If
   If InStr(recvLoginMsg.authorityLevel, "~99") = 0 Then
        If gBranchCode <> recvLoginMsg.branchCode Then
            CSD_mdiForm.staticStatus.Panels(3).text = errNotAuthorisedBranch(UserLang)
            LogData "User is not authorized to access the application in this branch"
            LogData "This branch code is =" + gBranchCode + " and the user's branch code is " + recvLoginMsg.branchCode
            frmLogin.MousePointer = vbDefault
            MsgBox errNotAuthorisedBranch(UserLang)
            Unload Me
            End
        End If
   End If
   frmLogin.MousePointer = vbDefault
   frmLogin.txtUserId.Enabled = True
   frmLogin.txtPassword.Enabled = True
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   MsgBox errChangePassword(UserLang) '"Please change your password"
   passwordChange = False
   CSD_mdiForm.staticStatus.Panels(3).text = " "
   frmChangePassword.Show vbModal
ElseIf recvLoginMsg.status = "102" Then
   frmEnquiry.Hide
   frmLogin.MousePointer = vbDefault
   frmLogin.txtUserId.Enabled = True
   frmLogin.txtPassword.Enabled = True
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   frmLogin.txtUserId.text = ""
   frmLogin.txtPassword.text = ""
   LogData "Invalid UserId .. Please check"
   MsgBox errInvalidUserId(UserLang) '"Invalid UserID.....please try again "
   frmLogin.txtUserId.SetFocus
ElseIf recvLoginMsg.status = "103" Then
   frmEnquiry.Hide
   frmLogin.txtPassword.text = ""
   frmLogin.MousePointer = vbDefault
   frmLogin.txtUserId.Enabled = True
   frmLogin.txtPassword.Enabled = True
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   If NoOfTries <= "3" Then
        If UserLang = ENGLISH Then
            MsgBox recvLoginMsg.eRemarks
        Else
            MsgBox recvLoginMsg.aRemarks
        End If
   Else
      LogData errMaxTries(1)
      MsgBox errMaxTries(UserLang) ' "More than 3 unsuccessful tries...Your account has been locked...Please call headoffice   "
      NoOfTries = "0"
   End If
   NoOfTries = NoOfTries + 1
   frmLogin.txtPassword.SetFocus
ElseIf recvLoginMsg.status = "104" Then
   frmEnquiry.Hide
   frmLogin.txtUserId.text = ""
   frmLogin.txtPassword.text = ""
   frmLogin.MousePointer = vbDefault
   frmLogin.txtUserId.Enabled = True
   frmLogin.txtPassword.Enabled = True
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   LogData errAccountLocked(1)
   MsgBox errAccountLocked(UserLang) '"User Account Locked...Call HeadOffice to activate"
   End
ElseIf recvLoginMsg.status = "105" Then
   frmEnquiry.Hide
   frmLogin.MousePointer = vbDefault
   frmLogin.txtUserId.Enabled = True
   frmLogin.txtPassword.Enabled = True
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   LogData errAccountClosed(1)
   MsgBox errAccountClosed(UserLang) '"Your Account has been closed....Please contact security Officer.."
   End
ElseIf recvLoginMsg.status = "108" Then
   frmEnquiry.Hide
   frmLogin.MousePointer = vbDefault
   frmLogin.txtUserId.Enabled = True
   frmLogin.txtPassword.Enabled = True
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   LogData errUserAlreadyLogged(1)
   MsgBox errUserAlreadyLogged(UserLang) '"User Already Logged in.. Cannot login again"
   End
Else
   frmEnquiry.Hide
   frmLogin.MousePointer = vbDefault
   frmLogin.txtUserId.Enabled = True
   frmLogin.txtPassword.Enabled = True
   frmLogin.cmdOk.Enabled = True
   frmLogin.cmdExit.Enabled = True
   LogData "Other Error " & recvLoginMsg.status & " had occured "
   LogData recvLoginMsg.eRemarks
   If UserLang = ARABIC Then
      MsgBox recvLoginMsg.aRemarks
   Else
      MsgBox recvLoginMsg.eRemarks
   End If
   frmLogin.txtPassword = ""
   frmLogin.txtUserId = ""
   frmLogin.txtUserId.SetFocus
End If
End Sub

Private Sub Form_Load()
    Dim iniPath As String
    Dim fso, objFs, objReadFile
    noOfJoint = "00"
    noOfSignatory = "0000"
    noOfOwners = "0000"
    noOfReference = "0000"
    noOfHeir = "0000"

    Set fso = CreateObject("Scripting.FileSystemObject")
        
    frmLogin.lblVersion = "Ver " & App.Major & "." & App.Minor & "." & App.Revision
        
    If App.PrevInstance Then
       MsgBox "Branch Interface is already running...Please Check.."
       LogData "Branch Interface is already running...Please Check.."
       End
    End If
     
    txtDate = Date
    lblDate = Date
    
    'anbLogo.Picture = LoadPicture(App.Path & "\ANB Logo new.bmp")
    
    iniPath = App.Path & "\statdata.ini"
    On Error GoTo err_handler
    Set objFs = CreateObject("Scripting.FileSystemObject")
    Set objReadFile = fso.OpenTextFile(iniPath, 1)
   
    ' get Startup Language from ini file
    startupLang = IniRead(iniPath, "startupLang")
    If startupLang = "" Then
        MsgBox ("Could not get startup Language from registry; defaulted to 1")
        startupLang = "1"
    End If
    
    ' get Branch Code from ini file
    rBranchCode = IniRead(iniPath, "rbranchcode")
    If rBranchCode = "" Then
       MsgBox ("Could not get Branch Code from registry; defaulted to 0499")
       rBranchCode = "0173"
    End If
    
    If rBranchCode = "0000" Or Len(Trim(rBranchCode)) <> 4 Then
       MsgBox "Invalid branch code " & Trim(rBranchCode) & " defined in statdata.ini file"
       End
    End If
    
'    ' get Branch power EXE path from ini file
'    bpExePath = IniRead(iniPath, "bpexepath")
'    If bpExePath = "" Then
'       MsgBox ("Could not get utilpath from ini file; defaulted to i:\bpower\exe\")
'       bpExePath = "i:\bpower\exe\"
'    End If
'    bpExePath = Trim(bpExePath)
    
    lblArbUserId.Caption = "ÂÊÌ… «·„” Œœ„"
    lblArbPass.Caption = "ﬂ·„… «·”‹‹—"
    
    UserLang = Val(startupLang)
    populateErrMsg
    populateHistStmtErrMsg
    Exit Sub
err_handler:

   If Err.Number = 53 Or Err.Number = 76 Then
      MsgBox "Configuaration file (statdata.ini) does not exist in " & App.Path
      End
   Else
      Resume Next
   End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
   If realOrPseudo = "1" Then
      reset
   End If
   End
End Sub

Private Sub Timer2_Timer()
   If lblTime.Caption <> CStr(Time) Then
      lblTime.Caption = Time
   End If
End Sub

Private Sub txtPassword_GotFocus()
    cmdOk.Default = True
End Sub

Private Sub txtPassword_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtUserId_GotFocus()
    cmdOk.Default = False
End Sub

Private Sub txtUserId_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then  ' 13 for Enter key
       If Len(RTrim(txtUserId)) <> 0 Then
          txtPassword.SetFocus
       End If
    End If
End Sub

Private Sub txtUserId_LostFocus()
   If txtUserId <> "" Then
      If Asc(txtUserId) > 96 And Asc(txtUserId) < 123 Then
         txtUserId = UCase(txtUserId)
      End If
   End If
End Sub

  
Private Function getBranchCode() As String

    Dim sysData As sysCtrl
    Dim sysPos As String
    Dim sysKeyBuf As String
    Dim sysRecLen, sysKeyNum As Integer
    Dim iniPath As String
    Dim fso, objFs, objReadFile
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    sysKeyBuf = Space(256)
    sysPos = Space(128)
    sysRecLen = Len(sysData)
    
    iniPath = App.Path + "\statdata.ini"
    On Error GoTo err_handler
    Set objFs = CreateObject("Scripting.FileSystemObject")
    Set objReadFile = fso.OpenTextFile(iniPath, 1)
    
    ' get BranchPowerDb dir from ini file
    bpdbPath = IniRead(iniPath, "bpdbpath")
    If bpdbPath = "" Then
       MsgBox ("Could not get bpdbpath from registry; defaulted to g:\bpower\data\")
       bpdbPath = "g:\bpower\data\"
    End If
    
    branchPowerEnv = IniRead(iniPath, "branchpower")
    If branchPowerEnv = "" Then
       branchPowerEnv = "DOS"
    End If
    
    If branchPowerEnv = "DOS" Then
       sysKeyBuf = bpdbPath + "bsysctrl.dat"
       sysKeyNum = 1
    Else
       sysKeyBuf = bpdbPath + "bsysbr.dat"
       sysKeyNum = 0
    End If
    Dim CreaFile
    On Error GoTo errHandler
    Set CreaFile = fso.OpenTextFile(sysKeyBuf, ForReading, True)
    
    
    On Error Resume Next
    'tatus = BTRCALL(BOPEN, sysPos, sysData, sysRecLen, ByVal sysKeyBuf, Len(sysKeyBuf), sysKeyNum)
    If status <> 0 Then
       msg$ = "Error Opening system control file! " & str$(status)
       'MsgBox (Msg$)
       LogData "Error Opening system control file! " & str$(status)
       getBranchCode = "E" & str$(status)
       Exit Function
    Else
       LogData "system control File Opened Succesfully!"
       msg$ = "system control File Opened Succesfully!"
      'MsgBox (Msg$)
    End If
    
    'ysKeyBuf = "BR                        "
    On Error Resume Next
    'tatus = BTRCALL(BGETGREATEROREQUAL, sysPos, sysData, sysRecLen, ByVal sysKeyBuf, Len(sysKeyBuf), sysKeyNum)
    
    If status <> 0 Then
       msg$ = "Error Reading System Control File!!" & str$(status)
       LogData "Error Reading System Control File!!" & str$(status)
       'MsgBox (Msg$)
       getBranchCode = "E" + str$(status)
    Else
       LogData "Branch code Read Successfully and it is " & sysData.branchCode
       getBranchCode = sysData.branchCode
    End If
    
    On Error Resume Next
    'status = BTRCALL(BCLOSE, sysPos, sysData, sysRecLen, ByVal sysKeyBuf, Len(sysKeyBuf), sysKeyNum)
    'LogData "Status after closing the file bsysctrl.dat " & str(status)
    Exit Function

err_handler:
   If Err.Number = 53 Or Err.Number = 76 Then
      MsgBox "Configuaration file (statdata.ini) does not exist in " & App.Path
      End
   Else
      Resume Next
   End If
    
errHandler:
   
   getBranchCode = "ERROR"
    
End Function
