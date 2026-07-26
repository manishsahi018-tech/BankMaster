VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmAcctStatusHistory 
   BackColor       =   &H00BFD87E&
   Caption         =   "Account Status Change History Details"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtAccNo 
      BackColor       =   &H00BFD87E&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   375
      Left            =   3360
      TabIndex        =   1
      Top             =   360
      Width           =   2775
   End
   Begin VB.CommandButton cmdReturn 
      Caption         =   "Return"
      Height          =   375
      Left            =   4920
      TabIndex        =   0
      ToolTipText     =   "Return"
      Top             =   7800
      Width           =   2055
   End
   Begin MSFlexGridLib.MSFlexGrid acctStatusHistory 
      Height          =   5775
      Left            =   240
      TabIndex        =   2
      Top             =   1560
      Width           =   10815
      _ExtentX        =   19076
      _ExtentY        =   10186
      _Version        =   393216
      Rows            =   1000
      Cols            =   9
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   1
   End
   Begin VB.Label lblAcctNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account Number"
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
      Left            =   1200
      TabIndex        =   4
      Top             =   360
      Width           =   2055
   End
   Begin VB.Label lblAcctStatusHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Account status change history"
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
      Height          =   495
      Left            =   1920
      TabIndex        =   3
      Top             =   960
      Width           =   5295
   End
End
Attribute VB_Name = "frmAcctStatusHistory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub acctStatusHistory_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdReturn_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim tWidth As Integer
    Dim colwidth(8) As Integer
    Dim cRow    As Integer
    Dim rowTitle(8) As String
    Dim i As Integer
    Static lastRecRead As String * 3
    Dim tCode As String, tmpStr As String
    
    colwidth(0) = 1500
    colwidth(1) = 1000
    colwidth(2) = 1300
    colwidth(3) = 1300
    colwidth(4) = 1200
    colwidth(5) = 1000
    colwidth(6) = 1200
    colwidth(7) = 1200
    colwidth(8) = 2000
 
'    rowTitle(0) = "Date"
'    rowTitle(1) = "User Id"
'    rowTitle(2) = "Supervisor Id"
'    rowTitle(3) = "From Status"
'    rowTitle(4) = "To Status"

    If UserLang = ARABIC Then
       ChangePositions frmAcctStatusHistory, 11800
       frmAcctStatusHistory.RightToLeft = True
       frmAcctStatusHistory.Hide
    End If
    
   
   frmAcctStatusHistory.lblAcctNo.Caption = frmAcctStatusHistoryCaption(1, UserLang)
   If frmAccount.tag = "0" Then
      frmAcctStatusHistory.lblAcctStatusHistory.Caption = frmAcctStatusHistoryCaption(2, UserLang)
      frmAcctStatusHistory.Caption = frmAcctStatusHistoryCaption(0, UserLang)
   Else
      frmAcctStatusHistory.lblAcctStatusHistory.Caption = frmAcctStatusHistoryCaption(13, UserLang)
      frmAcctStatusHistory.Caption = frmAcctStatusHistoryCaption(13, UserLang)
   End If
   frmAcctStatusHistory.cmdReturn.Caption = frmAcctStatusHistoryCaption(12, UserLang)

    acctStatusHistory.Clear
    acctStatusHistory.Row = 0
    acctStatusHistory.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 8
       acctStatusHistory.Col = i
       If UserLang = ARABIC Then
          acctStatusHistory.CellAlignment = flexAlignRightCenter
       Else
          acctStatusHistory.CellAlignment = flexAlignLeftCenter
       End If
       acctStatusHistory.text = frmAcctStatusHistoryCaption(i + 3, UserLang)
       acctStatusHistory.colwidth(i) = colwidth(i)
       tWidth = tWidth + colwidth(i)
    Next i
    If UserLang = ENGLISH Then
       acctStatusHistory.Width = tWidth + 100
    End If
    
    For i = 1 To Val(recvAcctStatusHistory.noOfRecs)
        acctStatusHistory.Row = i
        acctStatusHistory.Col = 0
        acctStatusHistory.CellAlignment = flexAlignLeftCenter
        acctStatusHistory.text = formatDate(Mid$(recvAcctStatusHistory.details(i).changeDate, 1, 8))
        acctStatusHistory.Col = 1
        acctStatusHistory.text = formatTime(Mid$(recvAcctStatusHistory.details(i).changeDate, 9, 6))
        acctStatusHistory.Col = 2
        acctStatusHistory.CellAlignment = flexAlignLeftCenter
        acctStatusHistory.text = recvAcctStatusHistory.details(i).userId
        acctStatusHistory.Col = 3
        acctStatusHistory.CellAlignment = flexAlignLeftCenter
        acctStatusHistory.text = recvAcctStatusHistory.details(i).supervisorId
        acctStatusHistory.Col = 4
        acctStatusHistory.CellAlignment = flexAlignLeftCenter
        acctStatusHistory.text = formatDate(Mid$(recvAcctStatusHistory.details(i).lastUpdateDateTime, 1, 8))
        acctStatusHistory.Col = 5
        acctStatusHistory.CellAlignment = flexAlignLeftCenter
        acctStatusHistory.text = formatTime(Mid$(recvAcctStatusHistory.details(i).lastUpdateDateTime, 9, 6))
        acctStatusHistory.Col = 6
        acctStatusHistory.CellAlignment = flexAlignLeftCenter
        tCode = recvAcctStatusHistory.details(i).fromStatus
        If frmAccount.tag = "0" Then
           Set rs = db.OpenRecordset("select arabicname,englishname from accountstatusinfo " + _
                                    "where statuscode = '" + tCode + "'")
        Else
           Set rs = db.OpenRecordset("select arabicname,englishname from samaacctstatusinfo " + _
                                    "where samastatuscode = '" + tCode + "'")
        End If
        If rs.recordCount > 0 Then
           If UserLang = ENGLISH Then
              tmpStr = tCode + "-" + rs(1)
           Else
              tmpStr = tCode + "-" + rs(0)
           End If
        Else
           tmpStr = tCode & "-" & "Not defined in local"
        End If
        acctStatusHistory.text = tmpStr
        acctStatusHistory.Col = 7
        acctStatusHistory.CellAlignment = flexAlignLeftCenter
        tCode = recvAcctStatusHistory.details(i).toStatus
        If frmAccount.tag = "0" Then
           Set rs = db.OpenRecordset("select arabicname,englishname from accountstatusinfo " + _
                                    "where statuscode = '" + tCode + "'")
        Else
           Set rs = db.OpenRecordset("select arabicname,englishname from samaacctstatusinfo " + _
                                    "where samastatuscode = '" + tCode + "'")
        End If
        If rs.recordCount > 0 Then
           If UserLang = ENGLISH Then
              tmpStr = tCode + "-" + rs(1)
           Else
              tmpStr = tCode + "-" + rs(0)
           End If
        Else
           tmpStr = tCode & "-" & "Not defined in local"
        End If
        acctStatusHistory.text = tmpStr
        If frmAccount.tag = "0" Then
           acctStatusHistory.Col = 8
           acctStatusHistory.text = recvAcctStatusHistory.details(i).accStatusChangeReason
        End If
    Next
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
