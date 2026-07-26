VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmCardHistory 
   BackColor       =   &H00BFD87E&
   Caption         =   "Card / Pin History"
   ClientHeight    =   7350
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7200
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   11235
   ScaleWidth      =   15360
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtNameOnCard 
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
      Left            =   5760
      TabIndex        =   7
      Top             =   120
      Width           =   4095
   End
   Begin VB.TextBox txtCardNo 
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
      Left            =   2760
      TabIndex        =   6
      Top             =   120
      Width           =   2775
   End
   Begin VB.CommandButton cmdReturn 
      Caption         =   "Return to Card Details"
      Height          =   375
      Left            =   4320
      TabIndex        =   4
      ToolTipText     =   "Return to Card Details"
      Top             =   7560
      Width           =   2295
   End
   Begin MSFlexGridLib.MSFlexGrid CardHistory 
      Height          =   5775
      Left            =   120
      TabIndex        =   0
      Top             =   1440
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   10186
      _Version        =   393216
      Rows            =   1000
      Cols            =   4
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   1
   End
   Begin MSFlexGridLib.MSFlexGrid pinHistory 
      Height          =   5775
      Left            =   5880
      TabIndex        =   1
      Top             =   1440
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   10186
      _Version        =   393216
      Rows            =   1000
      Cols            =   4
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   1
   End
   Begin VB.Label lblCardNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Number"
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
      Left            =   840
      TabIndex        =   5
      Top             =   120
      Width           =   1695
   End
   Begin VB.Label lblPinHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pin History"
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
      Left            =   6840
      TabIndex        =   3
      Top             =   600
      Width           =   2775
   End
   Begin VB.Label lblCardHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card History"
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
      Left            =   1680
      TabIndex        =   2
      Top             =   720
      Width           =   2415
   End
End
Attribute VB_Name = "frmCardHistory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub CardHistory_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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
    Dim cardRow As Integer
    Dim pinRow As Integer
    Dim rowTitle(8) As String
    Dim mQry As String, tCode As String, tmpStr As String
    Dim i As Integer
    Static lastRecRead As String * 3
    
'    colwidth(0) = 1300
'    colwidth(1) = 1200
'    colwidth(2) = 2000
'    colwidth(3) = 1400

    colwidth(0) = 1200
    colwidth(1) = 900
    colwidth(2) = 2000
    colwidth(3) = 1400


'    rowTitle(0) = "Date"
'    rowTitle(1) = "Action"
'    rowTitle(2) = "User Id"

    If UserLang = ARABIC Then
       ChangePositions frmCardHistory, 11800
       frmCardHistory.RightToLeft = True
       frmCardHistory.Hide
    End If
    
    frmCardHistory.Caption = frmCardHistoryCaption(0, UserLang)
    frmCardHistory.lblCardNo.Caption = frmCardHistoryCaption(1, UserLang)
    frmCardHistory.lblCardHistory.Caption = frmCardHistoryCaption(2, UserLang)
    frmCardHistory.lblPinHistory.Caption = frmCardHistoryCaption(3, UserLang)
    frmCardHistory.cmdReturn.Caption = frmCardHistoryCaption(21, UserLang)
    

    CardHistory.Clear
    pinHistory.Clear
    CardHistory.Row = 0
    pinHistory.Row = 0
    CardHistory.Font.Bold = True
    pinHistory.Font.Bold = True

    tWidth = 0
    For i = 0 To 3
       CardHistory.Col = i
       pinHistory.Col = i
       If UserLang = ARABIC Then
          CardHistory.CellAlignment = flexAlignRightCenter
          pinHistory.CellAlignment = flexAlignRightCenter
       Else
          CardHistory.CellAlignment = flexAlignLeftCenter
          pinHistory.CellAlignment = flexAlignLeftCenter
       End If
       CardHistory.text = frmCardHistoryCaption(i + 4, UserLang)
       pinHistory.text = frmCardHistoryCaption(i + 4, UserLang)
       If i = 1 Then
          CardHistory.text = frmCardHistoryCaption(25, UserLang)
          pinHistory.text = frmCardHistoryCaption(25, UserLang)
       ElseIf i > 1 Then
          CardHistory.text = frmCardHistoryCaption(i + 3, UserLang)
          pinHistory.text = frmCardHistoryCaption(i + 3, UserLang)
       End If
       CardHistory.colwidth(i) = colwidth(i)
       pinHistory.colwidth(i) = colwidth(i)
       tWidth = tWidth + colwidth(i)
    Next i

'    CardHistory.Width = tWidth + 10
'    pinHistory.Width = tWidth + 10

    cardRow = 1
    pinRow = 1
    CardHistory.Row = cardRow
    pinHistory.Row = pinRow
    i = 1
    For i = 1 To Val(recvCardHistory.noOfRecs)
        If recvCardHistory.details(i).requestType = "0" Then
           CardHistory.Row = cardRow
           pinHistory.Row = pinRow
           CardHistory.Col = 0
           pinHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           pinHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           pinHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           pinHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           pinHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(7, UserLang)  '"Requested"
           pinHistory.text = frmCardHistoryCaption(7, UserLang)  '"Requested"
           CardHistory.Col = 3
           pinHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           pinHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
           CardHistory.Row = cardRow
           If Len(RTrim(recvCardHistory.details(i).rejectedDateTime)) > 0 Then
              CardHistory.Col = 0
              CardHistory.CellAlignment = flexAlignLeftCenter
              CardHistory.text = formatDate(recvCardHistory.details(i).rejectedDateTime)
              CardHistory.Col = 1
              CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).rejectedDateTime, 9, 6))
              CardHistory.Col = 2
              CardHistory.text = frmCardHistoryCaption(15, UserLang) & "( " & recvCardHistory.details(i).rejectedReason & ")"
              CardHistory.Col = 3
              CardHistory.CellAlignment = flexAlignLeftCenter
              CardHistory.text = recvCardHistory.details(i).rejectedUserId
              cardRow = cardRow + 1
           Else
              pinRow = pinRow + 1
              pinHistory.Row = pinRow
              CardHistory.Col = 0
              pinHistory.Col = 0
              CardHistory.CellAlignment = flexAlignLeftCenter
              pinHistory.CellAlignment = flexAlignLeftCenter
              CardHistory.text = formatDate(recvCardHistory.details(i).lastUpdateDateTime)
              pinHistory.text = formatDate(recvCardHistory.details(i).lastUpdateDateTime)
              CardHistory.Col = 1
              pinHistory.Col = 1
              CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).lastUpdateDateTime, 9, 6))
              pinHistory.text = formatTime(Mid$(recvCardHistory.details(i).lastUpdateDateTime, 9, 6))
              CardHistory.Col = 2
              pinHistory.Col = 2
              CardHistory.text = frmCardHistoryCaption(8, UserLang)  '"Approved"
              pinHistory.text = frmCardHistoryCaption(8, UserLang)  '"Approved"
              CardHistory.Col = 3
              pinHistory.Col = 3
              CardHistory.CellAlignment = flexAlignLeftCenter
              pinHistory.CellAlignment = flexAlignLeftCenter
              CardHistory.text = recvCardHistory.details(i).supervisorId
              pinHistory.text = recvCardHistory.details(i).supervisorId
              cardRow = cardRow + 1
              pinRow = pinRow + 1
          End If
       ElseIf recvCardHistory.details(i).requestType = "1" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(9, UserLang)   '"Card Renewed"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
       ElseIf recvCardHistory.details(i).requestType = "2" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(10, UserLang)  '"Force Card"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
           CardHistory.Row = cardRow
           If Len(RTrim(recvCardHistory.details(i).rejectedDateTime)) > 0 Then
              CardHistory.Col = 0
              CardHistory.CellAlignment = flexAlignLeftCenter
              CardHistory.text = formatDate(recvCardHistory.details(i).rejectedDateTime)
              CardHistory.Col = 1
              CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).rejectedDateTime, 9, 6))
              CardHistory.Col = 2
              CardHistory.text = frmCardHistoryCaption(15, UserLang) & "( " & recvCardHistory.details(i).rejectedReason & ")"
              CardHistory.Col = 3
              CardHistory.CellAlignment = flexAlignLeftCenter
              CardHistory.text = recvCardHistory.details(i).rejectedUserId
              cardRow = cardRow + 1
           Else
              CardHistory.Col = 0
              CardHistory.CellAlignment = flexAlignLeftCenter
              pinHistory.CellAlignment = flexAlignLeftCenter
              CardHistory.text = formatDate(recvCardHistory.details(i).lastUpdateDateTime)
              CardHistory.Col = 1
              CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).lastUpdateDateTime, 9, 6))
              CardHistory.Col = 2
              CardHistory.text = frmCardHistoryCaption(10, UserLang) & "  " & frmCardHistoryCaption(8, UserLang) '"Approved"
              CardHistory.Col = 3
              CardHistory.CellAlignment = flexAlignLeftCenter
              CardHistory.text = recvCardHistory.details(i).supervisorId
              cardRow = cardRow + 1
            End If
        ElseIf recvCardHistory.details(i).requestType = "3" Then
           pinHistory.Row = pinRow
           pinHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           pinHistory.Col = 1
           pinHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           pinHistory.Col = 2
           pinHistory.text = frmCardHistoryCaption(11, UserLang)  '"Force pin"
           pinHistory.Col = 3
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = recvCardHistory.details(i).requestUserId
           pinRow = pinRow + 1
           pinHistory.Row = pinRow
           pinHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = formatDate(recvCardHistory.details(i).lastUpdateDateTime)
           pinHistory.Col = 1
           pinHistory.text = formatTime(Mid$(recvCardHistory.details(i).lastUpdateDateTime, 9, 6))
           pinHistory.Col = 2
           pinHistory.text = frmCardHistoryCaption(11, UserLang) + " " + frmCardHistoryCaption(8, UserLang) '"Approved"
           pinHistory.Col = 3
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = recvCardHistory.details(i).supervisorId
           pinRow = pinRow + 1
        ElseIf recvCardHistory.details(i).requestType = "4" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(12, UserLang)  '"Card Deactivated"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
'           continue
        ElseIf recvCardHistory.details(i).requestType = "5" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(13, UserLang)  '"Activation Requested"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).lastUpdateDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).lastUpdateDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(14, UserLang)  '"Activation Approved"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).supervisorId
           cardRow = cardRow + 1
        ElseIf recvCardHistory.details(i).requestType = "6" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(22, UserLang)   ' "Change Address"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
        ElseIf recvCardHistory.details(i).requestType = "7" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(23, UserLang) & "  " & frmCardHistoryCaption(7, UserLang) '"Restriction Requested"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).lastUpdateDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).lastUpdateDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(23, UserLang) & "  " & frmCardHistoryCaption(8, UserLang) '"Restriction Approved"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).supervisorId
           cardRow = cardRow + 1
        ElseIf recvCardHistory.details(i).requestType = "C" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(26, UserLang)
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
        ElseIf recvCardHistory.details(i).requestType = "P" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(27, UserLang)
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
        ElseIf recvCardHistory.details(i).requestType = "8" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(24, UserLang) & "  " & frmCardHistoryCaption(7, UserLang) '"Unrestriction Requested"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).lastUpdateDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).lastUpdateDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(24, UserLang) & "  " & frmCardHistoryCaption(8, UserLang) '"Unrestriction Approved"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).supervisorId
           cardRow = cardRow + 1
        ElseIf recvCardHistory.details(i).requestType = "9" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).rejectedDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).rejectedDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(15, UserLang) & "( " & recvCardHistory.details(i).rejectedReason & ")"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).rejectedUserId
           cardRow = cardRow + 1
        Else
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).requestDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).requestDateTime, 9, 6))
           CardHistory.Col = 2
           tCode = recvCardHistory.details(i).requestType
           mQry = "select * from requestTypeInfo where requesttype = '" & tCode & "'"
           Set rs = db.OpenRecordset(mQry)
           If rs.recordCount > 0 Then
              If UserLang = ARABIC Then
                 tmpStr = rs("arabicname")
              Else
                 tmpStr = rs("englishname")
              End If
           Else
              tmpStr = tCode & "-Not defined in local"
           End If
           CardHistory.text = tmpStr
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).requestUserId
           cardRow = cardRow + 1
        End If

        If Len(RTrim(recvCardHistory.details(i).processDateTime)) <> 0 And _
           Len(RTrim(recvCardHistory.details(i).rejectedDateTime)) = 0 And _
           (recvCardHistory.details(i).requestType = "0" Or _
            recvCardHistory.details(i).requestType = "1" Or _
            recvCardHistory.details(i).requestType = "2") Then
'           recvCardHistory.details(i).requestType <> "3" And _
'           recvCardHistory.details(i).requestType <> "4" And _
'           recvCardHistory.details(i).requestType <> "5" And _
'           recvCardHistory.details(i).requestType <> "6" And _
'           recvCardHistory.details(i).requestType <> "7" And _
'           recvCardHistory.details(i).requestType <> "8" And _
'           recvCardHistory.details(i).requestType <> "9" And _
'           recvCardHistory.details(i).requestType <> "C" And _
'           recvCardHistory.details(i).requestType <> "P" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).processDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).processDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(16, UserLang)  '"Sent to DC9000"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = "EOD-Extract"
           cardRow = cardRow + 1
        End If

        If Len(RTrim(recvCardHistory.details(i).cardGeneratedDateTime)) <> 0 And _
           (recvCardHistory.details(i).requestType = "0" Or _
            recvCardHistory.details(i).requestType = "1" Or _
            recvCardHistory.details(i).requestType = "2") Then
'           recvCardHistory.details(i).requestType <> "3" And _
'           recvCardHistory.details(i).requestType <> "4" And _
'           recvCardHistory.details(i).requestType <> "5" And _
'           recvCardHistory.details(i).requestType <> "6" And _
'           recvCardHistory.details(i).requestType <> "7" And _
'           recvCardHistory.details(i).requestType <> "8" And _
'           recvCardHistory.details(i).requestType <> "9" And _
'           recvCardHistory.details(i).requestType <> "C" And _
'           recvCardHistory.details(i).requestType <> "P" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).cardGeneratedDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).cardGeneratedDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(17, UserLang)  '"Produced at DC9000"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).cardGeneratedUserId
           cardRow = cardRow + 1
        End If

        If Len(RTrim(recvCardHistory.details(i).cBranchReceiptDateTime)) <> 0 And _
           (recvCardHistory.details(i).requestType = "0" Or _
            recvCardHistory.details(i).requestType = "1" Or _
            recvCardHistory.details(i).requestType = "2") Then
'           recvCardHistory.details(i).requestType <> "3" And _
'           recvCardHistory.details(i).requestType <> "4" And _
'           recvCardHistory.details(i).requestType <> "5" And _
'           recvCardHistory.details(i).requestType <> "6" And _
'           recvCardHistory.details(i).requestType <> "7" And _
'           recvCardHistory.details(i).requestType <> "8" And _
'           recvCardHistory.details(i).requestType <> "9" And _
'           recvCardHistory.details(i).requestType <> "C" And _
'           recvCardHistory.details(i).requestType <> "P" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).cBranchReceiptDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).cBranchReceiptDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(18, UserLang)  '"Received By Branch"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).cBranchReceiptUserId
           cardRow = cardRow + 1
        End If

        If Len(RTrim(recvCardHistory.details(i).cCustIssueDateTime)) <> 0 And _
           (recvCardHistory.details(i).requestType = "0" Or _
            recvCardHistory.details(i).requestType = "1" Or _
            recvCardHistory.details(i).requestType = "2") Then
'           recvCardHistory.details(i).requestType <> "3" And _
'           recvCardHistory.details(i).requestType <> "4" And _
'           recvCardHistory.details(i).requestType <> "5" And _
'           recvCardHistory.details(i).requestType <> "6" And _
'           recvCardHistory.details(i).requestType <> "7" And _
'           recvCardHistory.details(i).requestType <> "8" And _
'           recvCardHistory.details(i).requestType <> "9" And _
'           recvCardHistory.details(i).requestType <> "C" And _
'           recvCardHistory.details(i).requestType <> "P" Then
           CardHistory.Row = cardRow
           CardHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = formatDate(recvCardHistory.details(i).cCustIssueDateTime)
           CardHistory.Col = 1
           CardHistory.text = formatTime(Mid$(recvCardHistory.details(i).cCustIssueDateTime, 9, 6))
           CardHistory.Col = 2
           CardHistory.text = frmCardHistoryCaption(19, UserLang)  '"Issued to customer"
           CardHistory.Col = 3
           CardHistory.CellAlignment = flexAlignLeftCenter
           CardHistory.text = recvCardHistory.details(i).cCustIssueUserId
           cardRow = cardRow + 1
        End If

        If Len(RTrim(recvCardHistory.details(i).pinGeneratedDateTime)) <> 0 And _
           (recvCardHistory.details(i).requestType = "0" Or _
            recvCardHistory.details(i).requestType = "3") Then
'           recvCardHistory.details(i).requestType <> "2" And _
'           recvCardHistory.details(i).requestType <> "4" And _
'           recvCardHistory.details(i).requestType <> "5" And _
'           recvCardHistory.details(i).requestType <> "6" And _
'           recvCardHistory.details(i).requestType <> "7" And _
'           recvCardHistory.details(i).requestType <> "8" And _
'           recvCardHistory.details(i).requestType <> "9" And _
'           recvCardHistory.details(i).requestType <> "C" And _
'           recvCardHistory.details(i).requestType <> "P" Then
           pinHistory.Row = pinRow
           pinHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = formatDate(recvCardHistory.details(i).pinGeneratedDateTime)
           pinHistory.Col = 1
           pinHistory.text = formatTime(Mid$(recvCardHistory.details(i).pinGeneratedDateTime, 9, 6))
           pinHistory.Col = 2
           pinHistory.text = frmCardHistoryCaption(20, UserLang)  '"Printed at HSM"
           pinHistory.Col = 3
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = recvCardHistory.details(i).pinGeneratedUserId
           pinRow = pinRow + 1
        End If

        If Len(RTrim(recvCardHistory.details(i).pBranchReceiptDateTime)) <> 0 And _
           (recvCardHistory.details(i).requestType = "0" Or _
            recvCardHistory.details(i).requestType = "3") Then
'           recvCardHistory.details(i).requestType <> "2" And _
'           recvCardHistory.details(i).requestType <> "4" And _
'           recvCardHistory.details(i).requestType <> "5" And _
'           recvCardHistory.details(i).requestType <> "6" And _
'           recvCardHistory.details(i).requestType <> "7" And _
'           recvCardHistory.details(i).requestType <> "8" And _
'           recvCardHistory.details(i).requestType <> "9" And _
'           recvCardHistory.details(i).requestType <> "C" And _
'           recvCardHistory.details(i).requestType <> "P" Then
           pinHistory.Row = pinRow
           pinHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = formatDate(recvCardHistory.details(i).pBranchReceiptDateTime)
           pinHistory.Col = 1
           pinHistory.text = formatTime(Mid$(recvCardHistory.details(i).pBranchReceiptDateTime, 9, 6))
           pinHistory.Col = 2
           pinHistory.text = frmCardHistoryCaption(18, UserLang)  '"Received by branch"
           pinHistory.Col = 3
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = recvCardHistory.details(i).pBranchReceiptUserId
           pinRow = pinRow + 1
        End If

        If Len(RTrim(recvCardHistory.details(i).pCustIssueDateTime)) <> 0 And _
           (recvCardHistory.details(i).requestType = "0" Or _
            recvCardHistory.details(i).requestType = "3") Then
'           recvCardHistory.details(i).requestType <> "2" And _
'           recvCardHistory.details(i).requestType <> "4" And _
'           recvCardHistory.details(i).requestType <> "5" And _
'           recvCardHistory.details(i).requestType <> "7" And _
'           recvCardHistory.details(i).requestType <> "8" And _
'           recvCardHistory.details(i).requestType <> "9" And _
'           recvCardHistory.details(i).requestType <> "C" And _
'           recvCardHistory.details(i).requestType <> "P" Then
           pinHistory.Row = pinRow
           pinHistory.Col = 0
           CardHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = formatDate(recvCardHistory.details(i).pCustIssueDateTime)
           pinHistory.Col = 1
           pinHistory.text = formatTime(Mid$(recvCardHistory.details(i).pCustIssueDateTime, 9, 6))
           pinHistory.Col = 2
           pinHistory.text = frmCardHistoryCaption(19, UserLang)  '"Issue to customer"
           pinHistory.Col = 3
           pinHistory.CellAlignment = flexAlignLeftCenter
           pinHistory.text = recvCardHistory.details(i).pCustIssueUserId
           pinRow = pinRow + 1
        End If
   Next
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub pinHistory_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
