VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmBlockedAmtBreakup 
   BackColor       =   &H00BFD87E&
   Caption         =   "Breakup of Blocked Amount"
   ClientHeight    =   3210
   ClientLeft      =   3075
   ClientTop       =   780
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3210
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   5280
      TabIndex        =   14
      ToolTipText     =   "Return"
      Top             =   7560
      Width           =   1455
   End
   Begin VB.Frame frameAccount 
      Caption         =   "Account"
      Height          =   735
      Left            =   6960
      TabIndex        =   10
      ToolTipText     =   "Account"
      Top             =   7320
      Width           =   4575
      Begin VB.CommandButton cmdDeleteAccBlock 
         Caption         =   "Delete blocking"
         Enabled         =   0   'False
         Height          =   375
         Left            =   3000
         TabIndex        =   13
         Tag             =   "4575"
         ToolTipText     =   "Delete manual A/c blocking"
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdAmendAccBlock 
         Caption         =   "Amend blocking"
         Enabled         =   0   'False
         Height          =   375
         Left            =   1560
         TabIndex        =   12
         Tag             =   "4575"
         ToolTipText     =   "Amend A/c blocking"
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdNewAccBlock 
         Caption         =   "New blocking"
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Tag             =   "4575"
         ToolTipText     =   "New A/c blocking"
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.Frame frameCreditCard 
      Caption         =   "Credit Card "
      Height          =   735
      Left            =   480
      TabIndex        =   6
      ToolTipText     =   "Credit Card"
      Top             =   7320
      Width           =   4575
      Begin VB.CommandButton cmdNewCcBlock 
         Caption         =   "New blocking"
         Height          =   375
         Left            =   120
         TabIndex        =   9
         Tag             =   "4575"
         ToolTipText     =   "New CC  blocking"
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdAmendCcBlock 
         Caption         =   "Amend blocking"
         Enabled         =   0   'False
         Height          =   375
         Left            =   1560
         TabIndex        =   8
         Tag             =   "4575"
         ToolTipText     =   "Amend CC blocking"
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdDeleteCcBlock 
         Caption         =   "Delete blocking"
         Enabled         =   0   'False
         Height          =   375
         Left            =   3000
         TabIndex        =   7
         Tag             =   "4575"
         ToolTipText     =   "Delete manual CC blocking"
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.TextBox txtBlockedAmt 
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
      Left            =   7920
      TabIndex        =   4
      Top             =   120
      Width           =   2775
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
      Left            =   2640
      TabIndex        =   0
      Top             =   120
      Width           =   2775
   End
   Begin MSFlexGridLib.MSFlexGrid blockedAmtBreakup 
      Height          =   5775
      Left            =   1680
      TabIndex        =   1
      Top             =   1320
      Width           =   7455
      _ExtentX        =   13150
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
   Begin VB.Label lblBlockedAmt 
      BackColor       =   &H00BFD87E&
      Caption         =   "Blocked Amount"
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
      Left            =   5760
      TabIndex        =   5
      Top             =   120
      Width           =   2055
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
      Left            =   480
      TabIndex        =   3
      Top             =   120
      Width           =   2055
   End
   Begin VB.Label lblBlockedAmtBreakup 
      BackColor       =   &H00BFD87E&
      Caption         =   "Breakup of blocked balance"
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
      TabIndex        =   2
      Top             =   720
      Width           =   5055
   End
End
Attribute VB_Name = "frmBlockedAmtBreakup"
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

Private Sub blockedAmtBreakup_Click()
    blockedAmtBreakup.Col = 0
    If Mid$(blockedAmtBreakup.text, 1, 1) = "C" Or _
       Mid$(blockedAmtBreakup.text, 1, 1) = "M" Then
       If InStr(recvLoginMsg.AuthorityLevel, "~82") > 0 Then
          cmdAmendCcBlock.Enabled = True
       Else
          cmdAmendCcBlock.Enabled = False
       End If
    Else
        cmdAmendCcBlock.Enabled = False
    End If
    If Mid$(blockedAmtBreakup.text, 1, 1) = "M" Then
       If InStr(recvLoginMsg.AuthorityLevel, "~82") > 0 Then
          cmdDeleteCcBlock.Enabled = True
       Else
          cmdDeleteCcBlock.Enabled = False
       End If
    Else
       cmdDeleteCcBlock.Enabled = False
    End If
    
    If Mid$(blockedAmtBreakup.text, 1, 1) = "A" Then
       If InStr(recvLoginMsg.AuthorityLevel, "~84") > 0 Then
          cmdAmendAccBlock.Enabled = True
          cmdDeleteAccBlock.Enabled = True
       Else
          cmdAmendAccBlock.Enabled = False
          cmdDeleteAccBlock.Enabled = False
       End If
    Else
        cmdAmendAccBlock.Enabled = False
        cmdDeleteAccBlock.Enabled = False
    End If
End Sub

Private Sub cmdAmendAccBlock_Click()
    amendBlock ("A")
End Sub

Private Sub cmdAmendCcBlock_Click()
   amendBlock ("C")
End Sub

Private Sub cmdDeleteAccBlock_Click()
    deleteBlock ("A")
End Sub

Private Sub cmdDeleteCcBlock_Click()
    deleteBlock ("C")
End Sub

Private Sub cmdExit_Click()
    frmAccountGrid.tag = " "
    Unload Me
End Sub

Private Sub cmdNewAccBlock_Click()
    
    If Mid$(Trim(txtAccNo), 3, 3) <> "008" And _
       Mid$(Trim(txtAccNo), 3, 3) <> "009" And _
       Mid$(Trim(txtAccNo), 3, 3) <> "160" Then
     
       MsgBox errManualBlockNotAllowed(UserLang)
       Exit Sub
    End If
    
    newBlock ("A")
End Sub

Private Sub cmdNewCcBlock_Click()
    newBlock ("C")
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim tWidth As Integer, colwidth(8) As Integer, cRow As Integer
    Dim i As Integer
    Dim rowTitle(8) As String
    Dim productDesc(8, 2) As String
    Dim tCode As String, tmpStr As String
    Dim tDecimalPlace As String
    Dim amtDenom As Integer
    
    colwidth(0) = 2000
    colwidth(1) = 2000
    colwidth(2) = 2000
    colwidth(3) = 1000
    
    productDesc(0, 0) = "ÞÑÖ ÈÇäß ãÇÓÊÑ"
    productDesc(0, 1) = "Bankmaster Loan"
    productDesc(1, 0) = "ÞÑÖ Ýä æä"
    productDesc(1, 1) = "Finnone Loan"
    productDesc(2, 0) = "ÈØÇÞÉ ÃÆÊãÇäíÉ"
    productDesc(2, 1) = "Credit Card"
    productDesc(3, 0) = "ÍÌÒ ÈØÇÞÉ íÏæí"
    productDesc(3, 1) = "Manual CC blocking"
    productDesc(4, 0) = "ÍÌæÒÇÊ ÃÎÑì"
    productDesc(4, 1) = "Other blocking"
    productDesc(5, 0) = "ÇáÊÍÝÙ ÇáíÏæí Úáì ÇáÍÓÇÈÇÊ"
    productDesc(5, 1) = "Manual A/c blocking"
 
    If UserLang = ARABIC Then
       ChangePositions frmBlockedAmtBreakup, 11800
       frmBlockedAmtBreakup.RightToLeft = True
       frmBlockedAmtBreakup.frameAccount.RightToLeft = True
       frmBlockedAmtBreakup.frameCreditCard.RightToLeft = True
       frmBlockedAmtBreakup.Hide
    End If
    
   frmBlockedAmtBreakup.lblAcctNo.Caption = frmBlockedAmtBreakupCaption(1, UserLang)
   frmBlockedAmtBreakup.lblBlockedAmt.Caption = frmBlockedAmtBreakupCaption(2, UserLang)
   frmBlockedAmtBreakup.lblBlockedAmtBreakup.Caption = frmBlockedAmtBreakupCaption(0, UserLang)
   frmBlockedAmtBreakup.Caption = frmBlockedAmtBreakupCaption(0, UserLang)
   frmBlockedAmtBreakup.cmdExit.Caption = frmBlockedAmtBreakupCaption(7, UserLang)
   
   frmBlockedAmtBreakup.frameCreditCard.Caption = frmBlockedAmtBreakupCaption(12, UserLang)
   frmBlockedAmtBreakup.cmdNewCcBlock.Caption = frmBlockedAmtBreakupCaption(8, UserLang)
   frmBlockedAmtBreakup.cmdAmendCcBlock.Caption = frmBlockedAmtBreakupCaption(9, UserLang)
   frmBlockedAmtBreakup.cmdDeleteCcBlock.Caption = frmBlockedAmtBreakupCaption(10, UserLang)
    
   frmBlockedAmtBreakup.frameAccount.Caption = frmBlockedAmtBreakupCaption(13, UserLang)
   frmBlockedAmtBreakup.cmdNewAccBlock.Caption = frmBlockedAmtBreakupCaption(8, UserLang)
   frmBlockedAmtBreakup.cmdAmendAccBlock.Caption = frmBlockedAmtBreakupCaption(9, UserLang)
   frmBlockedAmtBreakup.cmdDeleteAccBlock.Caption = frmBlockedAmtBreakupCaption(10, UserLang)


    blockedAmtBreakup.Clear
    blockedAmtBreakup.Row = 0
    blockedAmtBreakup.Font.Bold = True
    
    tWidth = 0
    For i = 0 To 3
       blockedAmtBreakup.Col = i
       If UserLang = ARABIC Then
          blockedAmtBreakup.CellAlignment = flexAlignRightCenter
       Else
          blockedAmtBreakup.CellAlignment = flexAlignLeftCenter
       End If
       blockedAmtBreakup.text = frmBlockedAmtBreakupCaption(i + 3, UserLang)
       blockedAmtBreakup.colwidth(i) = colwidth(i)
       tWidth = tWidth + colwidth(i)
    Next i
    If UserLang = ENGLISH Then
       blockedAmtBreakup.Width = tWidth + 200
    Else
       blockedAmtBreakup.Width = tWidth
    End If
      
    tCode = Mid$(recvBlockBreakupMsg.accNo, 1, 2)
    Set rs = db.OpenRecordset("select decimalplace from currencyinfo " + _
                           "where currencycode = '" & tCode & "'")

    If rs.recordCount > 0 Then
       tDecimalPlace = rs(0)
    Else
       tDecimalPlace = "2"
    End If

    If tDecimalPlace = "3" Then
       amtDenom = 1000
    ElseIf tDecimalPlace = "2" Then
       amtDenom = 100
    ElseIf tDecimalPlace = "1" Then
       amtDenom = 10
    Else
       amtDenom = 1
    End If
    
    txtBlockedAmt = Format(Val(recvBlockBreakupMsg.blockedBal) / amtDenom, "##########0" & IIf(CInt(tDecimalPlace) <> 0, "." & String(CInt(tDecimalPlace), "0"), ""))
       
    For i = 1 To Val(recvBlockBreakupMsg.noOfRecs)
        blockedAmtBreakup.Row = i
        blockedAmtBreakup.Col = 0
        blockedAmtBreakup.CellAlignment = flexAlignLeftCenter
        If recvBlockBreakupMsg.details(i).productType = "B" Then
           tmpStr = productDesc(0, UserLang) ' Bankmaster loan
        ElseIf recvBlockBreakupMsg.details(i).productType = "F" Then
           tmpStr = productDesc(1, UserLang)  '"Finnone Loans"
        ElseIf recvBlockBreakupMsg.details(i).productType = "C" Then
           tmpStr = productDesc(2, UserLang) '"Credit Card"
        ElseIf recvBlockBreakupMsg.details(i).productType = "M" Then
           tmpStr = productDesc(3, UserLang) '"Manual blocking"
        ElseIf recvBlockBreakupMsg.details(i).productType = "A" Then
           tmpStr = productDesc(5, UserLang) 'Manul A/c blocking
        Else
           tmpStr = productDesc(4, UserLang) '"Other blocking"
        End If
        
        blockedAmtBreakup.text = recvBlockBreakupMsg.details(i).productType & "-" & tmpStr
        blockedAmtBreakup.Col = 1
        blockedAmtBreakup.CellAlignment = flexAlignLeftCenter
        blockedAmtBreakup.text = recvBlockBreakupMsg.details(i).productNo
        blockedAmtBreakup.Col = 2
        blockedAmtBreakup.CellAlignment = flexAlignRightCenter
        blockedAmtBreakup.text = Format(Val(recvBlockBreakupMsg.details(i).blockedAmt) / amtDenom, "##########0" & IIf(CInt(tDecimalPlace) <> 0, "." & String(CInt(tDecimalPlace), "0"), ""))
        blockedAmtBreakup.Col = 3
        blockedAmtBreakup.CellAlignment = flexAlignLeftCenter
        blockedAmtBreakup.text = recvBlockBreakupMsg.details(i).userId
    Next
    
    If InStr(recvLoginMsg.AuthorityLevel, "~82") > 0 Then ' Credit card arrear blocking/
       cmdNewCcBlock.Enabled = True
    Else
       cmdNewCcBlock.Enabled = False
       cmdAmendAccBlock.Enabled = False
       cmdDeleteCcBlock.Enabled = False
    End If
    
    If InStr(recvLoginMsg.AuthorityLevel, "~84") > 0 Then 'Manual Account blocking
       cmdNewAccBlock.Enabled = True
    Else
       cmdNewAccBlock.Enabled = False
       cmdAmendAccBlock.Enabled = False
       cmdDeleteAccBlock.Enabled = False
    End If
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
   frmAccountGrid.tag = " "
End Sub
Public Sub newBlock(cardOrAcct As String)
    blockAddAction = True
    blockUpdAction = False
    blockDelAction = False
    blockSupervisorAction = False
    blockTellerAction = False
    frmBlockedAmtBreakup.tag = cardOrAcct
    frmManualBlock.lblAction.Caption = frmManualBlockCaption(1, UserLang)
    frmManualBlock.txtAccNo = txtAccNo
    frmManualBlock.lblOldAmt.Visible = False
    frmManualBlock.txtOldAmt.Visible = False
    If cardOrAcct = "A" Then
       frmManualBlock.txtCardNo.Enabled = False
       frmManualBlock.txtCardNo.Visible = False
       frmManualBlock.lblCardNo.Visible = False
    Else
       frmManualBlock.txtCardNo.Visible = True
       frmManualBlock.txtCardNo.Refresh
       frmManualBlock.lblCardNo.Visible = True
       frmManualBlock.lblCardNo.Refresh
       frmManualBlock.txtCardNo.Enabled = True
    End If
    frmManualBlock.txtBlockAmt.Enabled = True
    frmManualBlock.tag = cardOrAcct
    frmManualBlock.Show vbModal
End Sub

Public Sub amendBlock(cardOrAcct As String)
    
    blockedAmtBreakup.Col = 0
    If cardOrAcct = "C" Then
        If Mid$(blockedAmtBreakup.text, 1, 1) <> "C" And _
           Mid$(blockedAmtBreakup.text, 1, 1) <> "M" Then
           MsgBox errBlockOnlyForCc(UserLang)
           Exit Sub
        End If
    ElseIf cardOrAcct = "A" Then
      If Mid$(blockedAmtBreakup.text, 1, 1) <> "A" Then
      End If
    End If
    
    blockAddAction = False
    blockUpdAction = True
    blockDelAction = False
    blockSupervisorAction = False
    blockTellerAction = False
    frmBlockedAmtBreakup.tag = cardOrAcct
    frmManualBlock.lblAction = frmManualBlockCaption(2, UserLang)
    frmManualBlock.txtAccNo = txtAccNo
    blockedAmtBreakup.Col = 1
    frmManualBlock.txtCardNo = blockedAmtBreakup.text
    frmManualBlock.lblOldAmt.Visible = True
    frmManualBlock.txtOldAmt.Visible = True
    frmManualBlock.lblOldAmt.Refresh
    frmManualBlock.txtOldAmt.Refresh
    blockedAmtBreakup.Col = 2
    frmManualBlock.txtOldAmt = blockedAmtBreakup.text
    frmManualBlock.txtCardNo.Enabled = False
    frmManualBlock.txtOldAmt.Enabled = False
    frmManualBlock.txtBlockAmt.Enabled = True
    If cardOrAcct = "A" Then
       frmManualBlock.txtCardNo.Enabled = False
       frmManualBlock.txtCardNo.Visible = False
       frmManualBlock.lblCardNo.Visible = False
    Else
       frmManualBlock.txtCardNo.Visible = True
       frmManualBlock.txtCardNo.Refresh
       frmManualBlock.lblCardNo.Visible = True
       frmManualBlock.lblCardNo.Refresh
    End If
    frmManualBlock.tag = cardOrAcct
    frmManualBlock.Show vbModal

End Sub

Public Sub deleteBlock(cardOrAcct As String)
    blockedAmtBreakup.Col = 0
    If cardOrAcct = "C" Then
       If Mid$(blockedAmtBreakup.text, 1, 1) <> "M" Then
          MsgBox errDeleteForManualBlockOnly(UserLang)
          Exit Sub
       End If
    ElseIf cardOrAcct = "A" Then
       If Mid$(blockedAmtBreakup.text, 1, 1) <> "A" Then
       End If
    End If
    
    blockAddAction = False
    blockUpdAction = False
    blockDelAction = True
    blockSupervisorAction = False
    blockTellerAction = False
    frmBlockedAmtBreakup.tag = cardOrAcct
    frmManualBlock.lblAction = frmManualBlockCaption(3, UserLang)
    frmManualBlock.txtAccNo = txtAccNo
    blockedAmtBreakup.Col = 1
    frmManualBlock.txtCardNo = blockedAmtBreakup.text
    frmManualBlock.lblOldAmt.Visible = False
    frmManualBlock.txtOldAmt.Visible = False
    blockedAmtBreakup.Col = 2
    frmManualBlock.txtBlockAmt = blockedAmtBreakup.text
    frmManualBlock.txtCardNo.Enabled = False
    frmManualBlock.txtBlockAmt.Enabled = False
    If cardOrAcct = "A" Then
       frmManualBlock.txtCardNo.Enabled = False
       frmManualBlock.txtCardNo.Visible = False
       frmManualBlock.lblCardNo.Visible = False
    Else
       frmManualBlock.txtCardNo.Visible = True
       frmManualBlock.txtCardNo.Refresh
       frmManualBlock.lblCardNo.Visible = True
       frmManualBlock.lblCardNo.Refresh
    End If
    frmManualBlock.tag = cardOrAcct
    frmManualBlock.Show vbModal
End Sub

