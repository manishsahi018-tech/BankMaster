VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmChequeBookHistory 
   BackColor       =   &H00BFD87E&
   Caption         =   "Cheque Book History"
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
   Begin VB.CommandButton cmdReturn 
      Caption         =   "Return"
      Height          =   375
      Left            =   4680
      TabIndex        =   4
      ToolTipText     =   "Return"
      Top             =   7920
      Width           =   2055
   End
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
      Left            =   3120
      TabIndex        =   0
      Top             =   480
      Width           =   2775
   End
   Begin MSFlexGridLib.MSFlexGrid chequeBookHistory 
      Height          =   5775
      Left            =   840
      TabIndex        =   1
      Top             =   1680
      Width           =   9495
      _ExtentX        =   16748
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
   Begin VB.Label lblChequeBookHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Cheque Book History"
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
      Left            =   3480
      TabIndex        =   3
      Top             =   1080
      Width           =   4095
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
      Left            =   960
      TabIndex        =   2
      Top             =   480
      Width           =   2055
   End
End
Attribute VB_Name = "frmChequeBookHistory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub chequeBookHistory_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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
    Dim tWidth As Integer, colwidth(8) As Integer, cRow    As Integer
    Dim i As Integer
    Dim rowTitle(8) As String
    Static lastRecRead As String * 3
    
    colwidth(0) = 2000
    colwidth(1) = 1500
    colwidth(2) = 3800
    colwidth(3) = 2000

'    rowTitle(0) = "Date"
'    rowTitle(1) = "Action"
'    rowTitle(2) = "User Id"

    If UserLang = ARABIC Then
       ChangePositions frmChequeBookHistory, 11800
       frmChequeBookHistory.RightToLeft = True
       frmChequeBookHistory.Hide
    End If
    
    frmChequeBookHistory.Caption = frmChequeBookHistoryCaption(0, UserLang)
    frmChequeBookHistory.lblAcctNo.Caption = frmChequeBookHistoryCaption(1, UserLang)
    frmChequeBookHistory.lblChequeBookHistory.Caption = frmChequeBookHistoryCaption(0, UserLang)
    frmChequeBookHistory.cmdReturn.Caption = frmChequeBookHistoryCaption(6, UserLang)
        
    chequeBookHistory.Clear
    chequeBookHistory.Row = 0
    chequeBookHistory.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 3
       chequeBookHistory.Col = i
       If UserLang = ARABIC Then
          chequeBookHistory.CellAlignment = flexAlignRightCenter
       Else
          chequeBookHistory.CellAlignment = flexAlignLeftCenter
       End If
       chequeBookHistory.text = frmChequeBookHistoryCaption(i + 2, UserLang)
       chequeBookHistory.colwidth(i) = colwidth(i)
       tWidth = tWidth + colwidth(i)
    Next i
    If UserLang = ENGLISH Then
       chequeBookHistory.Width = tWidth + 100
    End If
    
    cRow = 1
    chequeBookHistory.Row = cRow
    
    For i = 1 To Val(recvChequeBookHistory.noOfRecs)
        If Len(RTrim(recvChequeBookHistory.details(i).requestDate)) > 0 Then
           chequeBookHistory.Col = 0
           chequeBookHistory.text = formatDate(recvChequeBookHistory.details(i).requestDate)
           chequeBookHistory.Col = 1
           chequeBookHistory.text = formatTime(recvChequeBookHistory.details(i).requestTime)
           chequeBookHistory.Col = 2
           chequeBookHistory.text = frmChequeBookGridCaption(17, UserLang)    '"Processed"
           chequeBookHistory.Col = 3
           chequeBookHistory.CellAlignment = flexAlignLeftCenter
           chequeBookHistory.text = recvChequeBookHistory.details(i).requestUserId
           cRow = cRow + 1
           chequeBookHistory.Row = cRow
        End If
        If Len(RTrim(recvChequeBookHistory.details(i).producedDate)) > 0 Then
           chequeBookHistory.Col = 0
           chequeBookHistory.text = formatDate(recvChequeBookHistory.details(i).producedDate)
           chequeBookHistory.Col = 1
           chequeBookHistory.text = formatTime(recvChequeBookHistory.details(i).producedTime)
           chequeBookHistory.Col = 2
           chequeBookHistory.text = frmChequeBookGridCaption(18, UserLang)  '"Produced"
           chequeBookHistory.Col = 3
           chequeBookHistory.CellAlignment = flexAlignLeftCenter
           chequeBookHistory.text = recvChequeBookHistory.details(i).producedUserId
           cRow = cRow + 1
           chequeBookHistory.Row = cRow
        End If
        If Len(RTrim(recvChequeBookHistory.details(i).recdByBranchDate)) > 0 Then
           chequeBookHistory.Col = 0
           chequeBookHistory.text = formatDate(recvChequeBookHistory.details(i).recdByBranchDate)
           chequeBookHistory.Col = 1
           chequeBookHistory.text = formatTime(recvChequeBookHistory.details(i).recdByBranchTime)
           chequeBookHistory.Col = 2
           chequeBookHistory.text = frmChequeBookGridCaption(19, UserLang)  '"Received By Branch"
           chequeBookHistory.Col = 3
           chequeBookHistory.CellAlignment = flexAlignLeftCenter
           chequeBookHistory.text = recvChequeBookHistory.details(i).recdByBranchUserId
           cRow = cRow + 1
           chequeBookHistory.Row = cRow
        End If
        
        If Len(RTrim(recvChequeBookHistory.details(i).issuedToCustDate)) > 0 Then
           chequeBookHistory.Col = 0
           chequeBookHistory.text = formatDate(recvChequeBookHistory.details(i).issuedToCustDate)
           chequeBookHistory.Col = 1
           chequeBookHistory.text = formatTime(recvChequeBookHistory.details(i).issuedToCustTime)
           chequeBookHistory.Col = 2
           chequeBookHistory.text = frmChequeBookGridCaption(20, UserLang)       '"Issued to customer"
           chequeBookHistory.Col = 3
           chequeBookHistory.CellAlignment = flexAlignLeftCenter
           chequeBookHistory.text = recvChequeBookHistory.details(i).issuedToCustUserId
           cRow = cRow + 1
           chequeBookHistory.Row = cRow
        End If
        
        If Len(RTrim(recvChequeBookHistory.details(i).rejectedDate)) <> 0 Then
           chequeBookHistory.Col = 0
           chequeBookHistory.text = formatDate(recvChequeBookHistory.details(i).rejectedDate)
           chequeBookHistory.Col = 1
           chequeBookHistory.text = formatTime(recvChequeBookHistory.details(i).rejectedTime)
           chequeBookHistory.Col = 2
           chequeBookHistory.text = " Rejected  (" & recvChequeBookHistory.details(i).rejectedReason & ")"     'frmChequeBookGridCaption(19, UserLang)       '"Issued to customer"
           chequeBookHistory.Col = 3
           chequeBookHistory.CellAlignment = flexAlignLeftCenter
           chequeBookHistory.text = recvChequeBookHistory.details(i).rejectedUserId
           cRow = cRow + 1
           chequeBookHistory.Row = cRow
        End If
    Next
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
