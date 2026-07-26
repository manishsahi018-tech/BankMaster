VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmTimeDepositPendingList 
   BackColor       =   &H00BFD87E&
   Caption         =   "Time Deposit Pending List"
   ClientHeight    =   3195
   ClientLeft      =   4890
   ClientTop       =   1860
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtCustomerNo 
      Height          =   285
      Left            =   2760
      MaxLength       =   7
      TabIndex        =   6
      Top             =   915
      Width           =   1575
   End
   Begin VB.CommandButton cmdCheckPendingList 
      Caption         =   "Check pending List"
      Default         =   -1  'True
      Height          =   375
      Left            =   4560
      TabIndex        =   5
      ToolTipText     =   "Check pending List"
      Top             =   870
      Width           =   2295
   End
   Begin VB.CommandButton cmdVerify 
      Caption         =   "Verify Selected Record"
      Height          =   495
      Left            =   4440
      TabIndex        =   2
      ToolTipText     =   "Verify Selected Record"
      Top             =   6840
      Width           =   2055
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   6480
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   6840
      Width           =   1695
   End
   Begin VB.CommandButton cmdMore 
      Caption         =   "More"
      Height          =   495
      Left            =   2760
      TabIndex        =   0
      ToolTipText     =   "More"
      Top             =   6840
      Width           =   1695
   End
   Begin MSFlexGridLib.MSFlexGrid tdPendingGrid 
      Height          =   4935
      Left            =   720
      TabIndex        =   3
      Top             =   1380
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   8705
      _Version        =   393216
      Rows            =   26
      Cols            =   8
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblCustomerNo 
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
      Left            =   750
      TabIndex        =   7
      Top             =   915
      Width           =   1935
   End
   Begin VB.Label lblTimeDepositPendingList 
      BackColor       =   &H00BFD87E&
      Caption         =   "Time Deposit Pending List"
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
      Height          =   495
      Left            =   3105
      TabIndex        =   4
      Top             =   165
      Width           =   7455
   End
End
Attribute VB_Name = "frmTimeDepositPendingList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdCheckPendingList_Click()
  Dim tCustNo As String
  If Len(Trim(txtCustomerNo)) = 0 Then
     MsgBox errSpaceCustomerNo(UserLang)
     txtCustomerNo.SetFocus
     Exit Sub
  End If
  If tdSupervisorAction = True Then
     frmEnquiry.readTimeDepositPendingList "00000", "S", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readTimeDepositPendingList "00000", "T", Format(txtCustomerNo, "0000000")
  End If
    
  If recvTimeDepositPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load
End Sub

Private Sub cmdMore_Click()
  If recvTimeDepositPendingList.noOfRecs <> 20 Then
     MsgBox errNoMatchFound(UserLang) '"No more match found..."
     Exit Sub
  End If
  If tdSupervisorAction = True Then
     frmEnquiry.readTimeDepositPendingList recvTimeDepositPendingList.lastRecCount, "S", Format(txtCustomerNo, "0000000")
  Else
     frmEnquiry.readTimeDepositPendingList recvTimeDepositPendingList.lastRecCount, "T", Format(txtCustomerNo, "0000000")
  End If
    
  If recvTimeDepositPendingList.noOfRecs = "00" Then
     MsgBox errNoMatchFound(UserLang)
     Exit Sub
  End If
  Form_Load

End Sub

Private Sub cmdVerify_Click()
    tdPendingGrid_DblClick
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim flexRow As Integer, tWidth As Integer, colwidth(8) As Integer
   Dim rowTitle(8) As String
   Dim tCode As String, tmpStr, mQry As String
  
   colwidth(0) = 1200
   colwidth(1) = 1600
   colwidth(2) = 1200
   colwidth(3) = 2500
   colwidth(4) = 1600
   colwidth(5) = 1800
   colwidth(6) = 1400
   colwidth(7) = 1700
   
'   If UserLang = ARABIC Then
'      ChangePositions frmStdOrdPendingList, 12000
'      frmStdOrdPendingList.RightToLeft = True
'   End If
   
   If tdSupervisorAction Then
      frmTimeDepositPendingList.Caption = frmTimeDepositPendingListCaption(0, UserLang)
      frmTimeDepositPendingList.lblTimeDepositPendingList.Caption = frmTimeDepositPendingListCaption(0, UserLang)
   Else
      frmTimeDepositPendingList.Caption = frmTimeDepositPendingListCaption(1, UserLang)
      frmTimeDepositPendingList.lblTimeDepositPendingList.Caption = frmTimeDepositPendingListCaption(1, UserLang)
   End If
   frmTimeDepositPendingList.CmdMore.Caption = frmTimeDepositPendingListCaption(4, UserLang)
   frmTimeDepositPendingList.cmdVerify.Caption = frmTimeDepositPendingListCaption(5, UserLang)
   frmTimeDepositPendingList.cmdCancel.Caption = frmTimeDepositPendingListCaption(6, UserLang)
   lblCustomerNo.Caption = errCustomerNo(UserLang)
   cmdCheckPendingList.Caption = errCheckPendingList(UserLang)
   
   rowTitle(0) = "User Id"
   rowTitle(1) = "Date&Time"
   rowTitle(2) = "Customer Number"
   rowTitle(3) = "Customer Name"
   rowTitle(4) = "Account Number"
   rowTitle(5) = "Pending Type"
   rowTitle(6) = "Deposit Currency"
   rowTitle(7) = "Deposit Ledger"
            
   tdPendingGrid.Clear
   tdPendingGrid.Row = 0
   tdPendingGrid.Font.Bold = True
     
   tWidth = 0
   For i = 0 To 7
      tdPendingGrid.Col = i
      If UserLang = ARABIC Then
         tdPendingGrid.CellAlignment = flexAlignRightCenter
      Else
         tdPendingGrid.CellAlignment = flexAlignLeftCenter
      End If
      tdPendingGrid.text = frmTimeDepositPendingListCaption(i + 7, UserLang)
      'tdPendingGrid.text = rowTitle(i)
      tdPendingGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
   Next i
'   tdPendingGrid.Width = tWidth + 100
    
   For i = 1 To Val(recvTimeDepositPendingList.noOfRecs)
      tdPendingGrid.Row = i
      tdPendingGrid.Col = 0
      tdPendingGrid.text = recvTimeDepositPendingList.details(i).userId
      tdPendingGrid.Col = 1
      tdPendingGrid.text = recvTimeDepositPendingList.details(i).dateTime
      tdPendingGrid.Col = 2
      tdPendingGrid.CellAlignment = flexAlignLeftCenter
      tdPendingGrid.text = recvTimeDepositPendingList.details(i).custNo
      tdPendingGrid.Col = 3
      tdPendingGrid.CellAlignment = flexAlignLeftCenter
      tdPendingGrid.text = recvTimeDepositPendingList.details(i).custName
      tdPendingGrid.Col = 4
      tdPendingGrid.CellAlignment = flexAlignLeftCenter
      tdPendingGrid.text = recvTimeDepositPendingList.details(i).accNo
      tdPendingGrid.Col = 5
      tdPendingGrid.CellAlignment = flexAlignLeftCenter
      If recvTimeDepositPendingList.details(i).newOrUpdate = "N" Then
         tmpStr = errNewTimeDeposit(UserLang) '"New Time Deposit"
      Else
         tmpStr = errRenewTimeDeposit(UserLang) '"Renew Time Deposit"
      End If
      tdPendingGrid.text = tmpStr
      tdPendingGrid.Col = 6
      tCode = recvTimeDepositPendingList.details(i).tdCurrency
      mQry = "select arabicname, englishname from currencyInfo where " & _
             "currencyCode = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            tmpStr = rs(0)
         Else
            tmpStr = rs(1)
         End If
      Else
         tmpStr = "Not found in Local DB"
      End If
      tdPendingGrid.CellAlignment = flexAlignLeftCenter
      tdPendingGrid.text = tCode & "-" & tmpStr
      tdPendingGrid.Col = 7
      tCode = recvTimeDepositPendingList.details(i).tdLedger
      mQry = "select arabicname, englishname from bmLedgerInfo where " & _
             "ledgerCode = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            tmpStr = rs(0)
         Else
            tmpStr = rs(1)
         End If
      Else
         tmpStr = "Not found in Local DB"
      End If
      tdPendingGrid.CellAlignment = flexAlignLeftCenter
      tdPendingGrid.text = tCode & " - " & tmpStr
   Next i
   tdPendingGrid.Row = 1
   
'   CSD_mdiForm.staticStatus.Panels(3).Text = errSelectOneMatch(UserLang)
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Unload(Cancel As Integer)
    CSD_mdiForm.staticStatus.Panels(3).text = "   "
End Sub

Private Sub tdPendingGrid_DblClick()
    Dim tuserId As String * 10
    Dim tDateTime As String * 14
    Dim strmsglen As String
    Dim tCode As String
    Dim tmpStr As String
    
    tdPendingGrid.Col = 0
    tuserId = Format(tdPendingGrid.text, "!@@@@@@@@@@")
    tdPendingGrid.Col = 1
    tDateTime = Format(tdPendingGrid.text, "00000000000000")
     
    If Len(RTrim(tuserId)) = 0 And _
       Len(RTrim(tDateTime)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
  
    SendMsg = "000000" & "AJ" & gBranchCode & "01" & tuserId & tDateTime & Space(7) & Space(50)
    
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmTimeDepositPendingList.MousePointer = vbHourglass
    frmTimeDepositPendingList.cmdCancel.Enabled = False
    frmTimeDepositPendingList.cmdVerify.Enabled = False
    frmTimeDepositPendingList.CmdMore.Enabled = False

     
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmTimeDepositPendingList.MousePointer = vbNormal
       frmTimeDepositPendingList.cmdCancel.Enabled = True
       frmTimeDepositPendingList.cmdVerify.Enabled = True
       frmTimeDepositPendingList.CmdMore.Enabled = True
       Exit Sub
    End If
    frmTimeDepositPendingList.MousePointer = vbNormal
    frmTimeDepositPendingList.cmdCancel.Enabled = True
    frmTimeDepositPendingList.cmdVerify.Enabled = True
    frmTimeDepositPendingList.CmdMore.Enabled = True
    parseTimeDepositDetail
    
    If recvTimeDepositDetailMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvTimeDepositDetailMsg.aRemarks
       Else
          MsgBox recvTimeDepositDetailMsg.eRemarks
       End If
       Exit Sub
    End If
    fillFrmTimeDepositOpen
    frmTimeDepositOpen.Show
    
    ''Added by Mohit on 20-Feb-2007 as change reported by Arul
    If recvTimeDepositDetailMsg.overrideValueDate = "1" Then
       If UserLang = ARABIC Then
          tmpStr = "› Õ ÊœÌ⁄… „—»Êÿ… » «—ÌŒ ”«»ﬁ Õﬁ " & _
                   Mid$(recvTimeDepositDetailMsg.valueDate, 7, 2) & "/" & Mid$(recvTimeDepositDetailMsg.valueDate, 5, 2) & _
                   "/" & Mid$(recvTimeDepositDetailMsg.valueDate, 1, 4)
       Else
          tmpStr = "Back Value dated Time deposit created with Value Date as " & _
                    Mid$(recvTimeDepositDetailMsg.valueDate, 7, 2) & "/" & Mid$(recvTimeDepositDetailMsg.valueDate, 5, 2) & _
                    "/" & Mid$(recvTimeDepositDetailMsg.valueDate, 1, 4)
       End If
       MsgBox tmpStr
    End If
       
    If recvTimeDepositDetailMsg.overrideIntRate = "1" Then
       If UserLang = ARABIC Then
          tmpStr = " „  €ÌÌ— ‰”»… «·›«∆œ… „‰ ﬁ»· „‘—› Œœ„«  «·⁄„·«¡ ; ‰”»… «·›«∆œ… «·⁄«œÌ… " & _
                   Val(recvTimeDepositDetailMsg.orgFundIntRate) / 1000000 & "  ; ‰”»… «·›«∆œ… «·„⁄œ·…  " & _
                   Val(recvTimeDepositDetailMsg.fundIntRate) / 1000000
       Else
          tmpStr = "Customer Service officer has modified the interest rate ; Interest rate returned by Bankmaster is " & _
                   Val(recvTimeDepositDetailMsg.orgFundIntRate) / 1000000 & "  ; modified interest rate is  " & _
                   Val(recvTimeDepositDetailMsg.fundIntRate) / 1000000
       End If
       
       MsgBox tmpStr
    End If
      
          'Code made by Arshad on 26th feb 2007
          
    If tdSupervisorAction Or tdSearchAction Then
        If recvTimeDepositDetailMsg.newOrUpdate <> "U" Then
            If Trim(frmTimeDepositOpen.txtCustomerNo.text) <> Trim(frmTimeDepositOpen.txtPayCustNo.text) Then
                If UserLang = ARABIC Then
                    tmpStr = "Õ”«» «·„” ›Ìœ ÌŒ ·› ⁄‰ Õ”«» «·⁄„Ì·"
                Else
                    tmpStr = "Payee Customer is Different than Deposit Customer."
                End If
                MsgBox tmpStr
            End If
        End If
    End If
    ' change of code  ends here
    
    
    
    ''Added by Mohit on 18-Feb-2007 as change requested by Mr. Shoaib Hyder (mail on 18th Feb 2007 from Arul)
    ''If recvTimeDepositDetailMsg.tdCurrency <> Mid$(recvTimeDepositDetailMsg.debitAccNo, 1, 2) Then
    ''   If UserLang = ARABIC Then
    ''      tmpStr = "«·ÊœÌ⁄… „ÕÊ·… „‰ Õ”«» «·—Ì«· ··«Ã‰»Ì ..«·—Ã«¡ «· «ﬂœ „‰ ”⁄— «·’—›"
    ''   Else
    ''      tmpStr = "It's a cross currency Time Deposit, Please verify the exchange Rate."
    ''   End If
    ''   MsgBox tmpStr
    ''End If
    ''Till here
    
    If recvTimeDepositDetailMsg.overrideExRate = "1" Then
       If UserLang = ARABIC Then
          tmpStr = " „  ⁄œÌ· ”⁄— «·’—› „‰ ﬁ»· „‘—› Œœ„«  «·⁄„·«¡ ; ”⁄— «·’—› «·›⁄·Ì " & _
                   Val(recvTimeDepositDetailMsg.orgExRate) / 100000000 & "  ; ”⁄— «·’—› «·„⁄œ·  " & _
                   Val(recvTimeDepositDetailMsg.exRate) / 100000000
       Else
          tmpStr = "Customer Service officer has modified the exchange rate ; Exchange rate returned by Bankmaster is " & _
                   Val(recvTimeDepositDetailMsg.orgExRate) / 100000000 & "  ; modified exchange rate is  " & _
                   Val(recvTimeDepositDetailMsg.exRate) / 100000000
       End If
       MsgBox tmpStr
    End If
End Sub

Private Sub tdPendingGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
