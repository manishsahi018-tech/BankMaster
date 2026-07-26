VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmStopChequeGrid 
   BackColor       =   &H00BFD87E&
   Caption         =   "Stop Cheque Grid"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8025
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   8025
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtCustNo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
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
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   2280
      TabIndex        =   9
      Top             =   720
      Width           =   1215
   End
   Begin VB.TextBox txtCustName 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
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
      ForeColor       =   &H00800000&
      Height          =   375
      Left            =   5640
      TabIndex        =   8
      Top             =   720
      Width           =   4095
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "New Stop Cheque"
      Height          =   375
      Left            =   2145
      TabIndex        =   7
      ToolTipText     =   "New Stop Cheque"
      Top             =   7950
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.CommandButton cmdModify 
      Caption         =   "Cancel Stop Cheque"
      Height          =   375
      Left            =   3825
      TabIndex        =   6
      ToolTipText     =   "Cancel Stop Cheque"
      Top             =   7950
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.CommandButton cmdEnquiry 
      Caption         =   "Enquiry"
      Height          =   375
      Left            =   1650
      TabIndex        =   5
      Top             =   7035
      Width           =   1455
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   375
      Left            =   3090
      TabIndex        =   4
      ToolTipText     =   "More"
      Top             =   7035
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4530
      TabIndex        =   3
      ToolTipText     =   "Exit"
      Top             =   7035
      Width           =   1455
   End
   Begin VB.TextBox txtAcctNo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
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
      Height          =   405
      Left            =   7560
      TabIndex        =   1
      Top             =   120
      Width           =   2415
   End
   Begin MSFlexGridLib.MSFlexGrid stopChqGrid 
      Height          =   5415
      Left            =   600
      TabIndex        =   2
      Top             =   1455
      Width           =   8700
      _ExtentX        =   15346
      _ExtentY        =   9551
      _Version        =   393216
      Rows            =   22
      Cols            =   5
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   1
   End
   Begin VB.Label lblCustNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer # :"
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
      Left            =   600
      TabIndex        =   11
      Top             =   720
      Width           =   1575
   End
   Begin VB.Label lblCustName 
      BackColor       =   &H00BFD87E&
      Caption         =   "Customer Name :"
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
      Left            =   3600
      TabIndex        =   10
      Top             =   720
      Width           =   1815
   End
   Begin VB.Label lblStopChqInfo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Stop cheque Info for account #"
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
      Left            =   1080
      TabIndex        =   0
      Top             =   120
      Width           =   6135
   End
End
Attribute VB_Name = "frmStopChequeGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAdd_Click()
    Dim tAccNo As String
    stopChqSearchAction = False
    stopChqTellerAction = False
    stopChqSupervisorAction = False
    stopChqCreateAction = True
    frmStopChqDetails.Show
End Sub

Private Sub cmdCancel_Click()
    frmAccountGrid.tag = " "
    Unload Me
End Sub

Private Sub cmdEnquiry_Click()
    stopChqSearchAction = True
    stopChqTellerAction = False
    stopChqSupervisorAction = False
    stopChqCreateAction = False
    getStopChqDetails
End Sub

Private Sub cmdModify_Click()
    Dim tUserid As String * 10
    Dim tAccNo As String * 14
    Dim tChqNo As String * 10
    
    stopChqGrid.Col = 0
    tChqNo = Format(stopChqGrid.text, "!@@@@@@@@@@")
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
    
    If Len(RTrim(tChqNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
        
    SendMsg = "000000" & "46" & gBranchCode & "03" & tUserid & tAccNo & tChqNo
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
     
    frmStopChequeGrid.MousePointer = vbHourglass
    
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmStopChequeGrid.MousePointer = vbDfault
       Exit Sub
    End If
    frmStopChequeGrid.MousePointer = vbDefault
    parseStopChqDetail
    
    If recvStopChqDetail.status = "000" Then
       MsgBox errSuccessful(UserLang)
    Else
       If UserLang = ARABIC Then
          MsgBox recvStopChqDetail.aRemarks
       Else
          MsgBox recvStopChqDetail.eRemarks
       End If
    End If
    
    Unload Me
    
End Sub

Private Sub cmdMore_Click()
   If recvStopChqSearchMsg.noOfRecs <> 20 Then
      MsgBox errNoMatchFound(UserLang) '"No more match found..."
      Exit Sub
   End If
   frmAccountGrid.searchStopChq recvStopChqSearchMsg.lastRecCount, frmStopChequeGrid.tag
    
   If recvStopChqSearchMsg.noOfRecs = "00" Then
      MsgBox errNoMatchFound(UserLang)
      Exit Sub
   End If
   Form_Load
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim tWidth, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim mQry, tCode As String
    
    colwidth(0) = 1800
    colwidth(1) = 2000
    colwidth(2) = 1700
    colwidth(3) = 2200
    colwidth(4) = 1800
    
    If (Not stopChqTellerAction And Not stopChqSupervisorAction) Then
       frmStopChequeGrid.tag = frmAccountGrid.tag
    End If
    
'    If UserLang = ARABIC Then
'       ChangePositions frmStopChequeGrid, 11800
'       frmStopChequeGrid.RightToLeft = True
'    End If
    
    If frmStopChequeGrid.tag = "1" Then
       frmStopChequeGrid.Caption = frmStopChqGridCaption(11, UserLang)
       frmStopChequeGrid.lblStopChqInfo.Caption = frmStopChqGridCaption(12, UserLang)
       frmStopChequeGrid.cmdAdd.Caption = frmStopChqGridCaption(13, UserLang)
       frmStopChequeGrid.cmdModify.Caption = frmStopChqGridCaption(14, UserLang)
    Else
       frmStopChequeGrid.Caption = frmStopChqGridCaption(0, UserLang)
       frmStopChequeGrid.lblStopChqInfo.Caption = frmStopChqGridCaption(1, UserLang)
       frmStopChequeGrid.cmdAdd.Caption = frmStopChqGridCaption(6, UserLang)
       frmStopChequeGrid.cmdModify.Caption = frmStopChqGridCaption(7, UserLang)
    End If
    frmStopChequeGrid.cmdEnquiry.Caption = frmStopChqGridCaption(8, UserLang)
    frmStopChequeGrid.cmdMore.Caption = frmStopChqGridCaption(9, UserLang)
    frmStopChequeGrid.cmdCancel.Caption = frmStopChqGridCaption(10, UserLang)
    frmStopChequeGrid.lblCustNo.Caption = frmAccountGridCaption(22, UserLang)
    frmStopChequeGrid.lblCustName.Caption = frmAccountGridCaption(23, UserLang)
    
'    rowTitle(0) = "Cheque Number"
'    rowTitle(1) = "Amount"
'    rowTitle(2) = "Date Stopped"
'    rowTitle(3) = "Details"
          
    txtCustNo = recvAccSearchMsg.custNo
    
    If UserLang = ARABIC Then
       If Len(RTrim(recvAccSearchMsg.aShortName)) <> 0 Then
          txtCustName = recvAccSearchMsg.aShortName
       Else
          txtCustName = recvAccSearchMsg.eShortName
       End If
    Else
       If Len(RTrim(recvAccSearchMsg.eShortName)) <> 0 Then
          txtCustName = recvAccSearchMsg.eShortName
       Else
          txtCustName = recvAccSearchMsg.aShortName
       End If
    End If
           
    stopChqGrid.Clear
    stopChqGrid.Row = 0
    stopChqGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 3
      stopChqGrid.Col = i
      If UserLang = ARABIC Then
         stopChqGrid.CellAlignment = flexAlignRightCenter
      Else
         stopChqGrid.CellAlignment = flexAlignLeftCenter
      End If
      stopChqGrid.text = frmStopChqGridCaption(i + 2, UserLang)
      stopChqGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    stopChqGrid.Col = 4
    If UserLang = ARABIC Then
       stopChqGrid.CellAlignment = flexAlignRightCenter
    Else
       stopChqGrid.CellAlignment = flexAlignLeftCenter
    End If
    stopChqGrid.text = frmStopChqGridCaption(15, UserLang)
    stopChqGrid.colwidth(4) = colwidth(4)
    tWidth = tWidth + colwidth(4)
    
    stopChqGrid.Width = tWidth + 100
    
    For i = 1 To Val(recvStopChqSearchMsg.noOfRecs)
         stopChqGrid.Row = i
         stopChqGrid.Col = 0
         stopChqGrid.CellAlignment = flexAlignRightCenter
         stopChqGrid.text = recvStopChqSearchMsg.details(i).chequeNo
         stopChqGrid.Col = 1
         stopChqGrid.text = Format(Val(recvStopChqSearchMsg.details(i).amount) / 100, "###########0.00")
         stopChqGrid.Col = 2
         stopChqGrid.CellAlignment = flexAlignLeftCenter
         stopChqGrid.text = formatDate(recvStopChqSearchMsg.details(i).dateStop)
         stopChqGrid.Col = 3
         stopChqGrid.CellAlignment = flexAlignLeftCenter
         stopChqGrid.text = recvStopChqSearchMsg.details(i).details
         stopChqGrid.Col = 4
         stopChqGrid.CellAlignment = flexAlignLeftCenter
         stopChqGrid.text = recvStopChqSearchMsg.details(i).fromChequeNo
   Next i
   stopChqGrid.Row = 1
   
'   If frmStopChequeGrid.tag = "1" Then ' tag = "1" means it is for destroy cheque
'      If InStr(recvLoginMsg.authorityLevel, "~62") > 0 Then
'         cmdAdd.Enabled = True
'         cmdModify.Enabled = False
'      Else
'         cmdAdd.Enabled = False
'         cmdModify.Enabled = False
'      End If
'   Else
'      If InStr(recvLoginMsg.authorityLevel, "~61") > 0 Then
'         cmdAdd.Enabled = True
'         cmdModify.Enabled = True
'      Else
'         cmdAdd.Enabled = False
'         cmdModify.Enabled = False
'      End If
'   End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
    frmAccountGrid.tag = " "
End Sub

Private Sub stopChqGrid_DblClick()
   stopChqTellerAction = False
   stopChqSupervisorAction = False
   stopChqSearchAction = True
   stopChqCreateAction = False
   getStopChqDetails
End Sub

Public Sub getStopChqDetails()
    Dim tUserid As String * 10
    Dim tAccNo As String * 14
    Dim tChqNo As String * 10
    
    stopChqGrid.Col = 0
    tChqNo = Format(stopChqGrid.text, "!@@@@@@@@@@")
    tUserid = Format(gUserId, "!@@@@@@@@@@")
    tAccNo = Format(txtAcctNo, "!@@@@@@@@@@@@@@")
    
    If Len(RTrim(tChqNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
        
    SendMsg = "000000" + "46" + gBranchCode + "02" + tUserid + tAccNo + tChqNo
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
     
    frmStopChequeGrid.MousePointer = vbHourglass
    
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmStopChequeGrid.MousePointer = vbDefault
       Exit Sub
    End If
    frmStopChequeGrid.MousePointer = vbDefault
    parseStopChqDetail
    frmStopChqDetails.Show
    fillFrmStopChqDetail
    frmStopChqDetails.Show
    frmStopChqDetails.frameStopChqDetails.Enabled = False

End Sub

Private Sub stopChqGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
