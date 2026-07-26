VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm CSD_mdiForm 
   BackColor       =   &H00BFD87E&
   Caption         =   "Static Data Management-CBS (MDI)"
   ClientHeight    =   3195
   ClientLeft      =   2655
   ClientTop       =   1905
   ClientWidth     =   4680
   LinkTopic       =   "MDIForm1"
   WindowState     =   2  'Maximized
   Begin VB.Timer inactiveTimer 
      Interval        =   65535
      Left            =   4560
      Top             =   3360
   End
   Begin VB.Timer mdiTimer 
      Interval        =   65535
      Left            =   4440
      Top             =   4200
   End
   Begin MSComctlLib.StatusBar staticStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   2880
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            TextSave        =   "24/06/2009"
            Object.ToolTipText     =   "System Date"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            TextSave        =   "10:20 AM"
            Object.ToolTipText     =   "System Time"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   10584
            MinWidth        =   10584
            Text            =   "Login using userId and password"
            TextSave        =   "Login using userId and password"
            Object.ToolTipText     =   "Login using userId and password"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   706
            MinWidth        =   706
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "CSD_mdiForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub mnuAboutCSD_Click()
    frmAbout.Show vbModal
End Sub

Private Sub inactiveTimer_Timer()
    Dim strmsglen As String
    If userLoggedIn Then
       inactiveTimer.Enabled = False
       secsUserInactive = secsUserInactive + 1
       staticStatus.Panels(5).text = secsUserInactive
       If secsUserInactive > gInactiveTime Then
          staticStatus.Panels(3).text = "User Inactive"
          Beep
          Beep
          Beep
          SendMsg = "000090" & "63" & gBranchCode & Format(gUserId, "!@@@@@@@@@@")
          strmsglen = Format(Len(SendMsg), "000000")
          Mid$(SendMsg, 1, 6) = strmsglen
          DataReceivedFlag = False
          CSD_mdiForm.staticStatus.Panels(3).text = errLoggingOut(UserLang)
          If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
             LoadError = True
             Exit Sub
          End If
          delay (1)
          CSD_mdiForm.staticStatus.Panels(3).text = "    "
          frmEnquiry.tcpClient.Close
          secsUserInactive = 0
          frmIdleTimePassword.Show vbModal
          'frmIdleTimePassword.SetFocus
       End If
       inactiveTimer.Enabled = True
    Else
    End If
End Sub

Private Sub MDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    MsgBox errUseExitButtonToExit(UserLang)  '"Operation not allowed. Please Use Exit Button to Quit the Application"
    Cancel = True
End Sub

Private Sub mdiTimer_Timer()
    staticStatus.Panels(1).Style = sbrDate
    staticStatus.Panels(2).Style = sbrTime
End Sub
