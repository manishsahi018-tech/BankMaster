VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSadadProfileAdd 
   BackColor       =   &H00BFD87E&
   Caption         =   "SADAD Customer profile Addition"
   ClientHeight    =   3195
   ClientLeft      =   1365
   ClientTop       =   5325
   ClientWidth     =   4680
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.ComboBox cmbCompanyId 
      Height          =   315
      Left            =   3600
      Style           =   2  'Dropdown List
      TabIndex        =   9
      Top             =   1080
      Width           =   3015
   End
   Begin VB.TextBox txtSubscriptionNo 
      Height          =   285
      Left            =   3600
      TabIndex        =   8
      Top             =   1680
      Width           =   3015
   End
   Begin VB.CommandButton cmdAddToList 
      Caption         =   "Add Bill to List"
      Height          =   375
      Left            =   6960
      TabIndex        =   7
      ToolTipText     =   "All Bill to the list"
      Top             =   1320
      Width           =   1335
   End
   Begin VB.TextBox txtIdNumber 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5880
      TabIndex        =   4
      Top             =   360
      Width           =   1935
   End
   Begin VB.ComboBox cmbIdType 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2640
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   360
      Width           =   1575
   End
   Begin VB.CommandButton cmdAddBills 
      Caption         =   "Add Bills to profile"
      Height          =   375
      Left            =   3480
      TabIndex        =   2
      ToolTipText     =   "Add Bills to profile"
      Top             =   7920
      Width           =   1575
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5280
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   7920
      Width           =   1335
   End
   Begin MSFlexGridLib.MSFlexGrid profileInfoGrid 
      Height          =   5535
      Left            =   2400
      TabIndex        =   0
      Top             =   2160
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   9763
      _Version        =   393216
      Rows            =   100
      Cols            =   4
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      SelectionMode   =   1
      AllowUserResizing=   3
   End
   Begin VB.Label lblSubscriptionNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Subscription Number"
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
      Left            =   960
      TabIndex        =   11
      Top             =   1680
      Width           =   2535
   End
   Begin VB.Label lblCompanyId 
      BackColor       =   &H00BFD87E&
      Caption         =   "Utility company Id"
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
      Left            =   1080
      TabIndex        =   10
      Top             =   1080
      Width           =   2295
   End
   Begin VB.Label lblIdNumber 
      BackColor       =   &H00BFD87E&
      Caption         =   "ID Number"
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
      Left            =   4560
      TabIndex        =   6
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label lblIdType 
      BackColor       =   &H00BFD87E&
      Caption         =   "ID Type"
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
      Left            =   1080
      TabIndex        =   5
      Top             =   360
      Width           =   1335
   End
End
Attribute VB_Name = "frmSadadProfileAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public currRow As Integer
Public noOfRecs As Integer
Private Sub cardInfoGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmdAddBills_Click()
   Dim strmsglen As String, tCode As String
   Dim errorMsg As String
   Dim mQry As String, tmpStr As String
   Dim tmpCompanyId As String, tmpSubscriptionNo As String
   Dim recCount As Integer, tmpRow As Integer, i As Integer
   recCount = 0
   
   formatSadadProfileMsg Mid$(cmbIdType, 1, 1), Format(txtIdNumber, "!@@@@@@@@@@@@@@@"), "A"
   sadadProfileMsg.recordCount = Format(str(currRow - noOfRecs), "000")
   
   SendMsg = sadadProfileMsg.msgLen & sadadProfileMsg.service & sadadProfileMsg.homeBranch & _
             sadadProfileMsg.userId & sadadProfileMsg.langInd & sadadProfileMsg.idNo & _
             sadadProfileMsg.idType & sadadProfileMsg.action & sadadProfileMsg.recordCount
   
   tmpRow = noOfRecs + 1
   Do While True
       profileInfoGrid.Row = tmpRow
       profileInfoGrid.Col = 0
       tmpCompanyId = Mid$(profileInfoGrid.text, 1, 3)
       profileInfoGrid.Col = 1
       tmpSubscriptionNo = profileInfoGrid.text
       If Len(Trim(tmpSubscriptionNo)) = 0 Then
          Exit Do
       End If
       recCount = recCount + 1
       sadadProfileMsg.details(recCount).billerId = tmpCompanyId
       sadadProfileMsg.details(recCount).billerAcct = Format(tmpSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
       SendMsg = SendMsg & sadadProfileMsg.details(recCount).billerAcct & _
                           sadadProfileMsg.details(recCount).billerId
       tmpRow = tmpRow + 1
    Loop
     
   'noOfRecs = Val(sadadProfileMsg.recordCount)
             
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmSadadProfileAdd.MousePointer = vbHourglass
   cmdAddBills.Enabled = False
   cmdAddToList.Enabled = False
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmSadadProfileAdd.MousePointer = vbDefault
      cmdAddBills.Enabled = True
      cmdAddToList.Enabled = True
      Exit Sub
   End If
   frmSadadProfileAdd.MousePointer = vbDefault
   cmdAddBills.Enabled = True
   cmdAddToList.Enabled = True
   
   parseSadadProfileUpdMsg
   
   If recvSadadProfileUpdMsg.status <> "000" Then
      If UserLang = ARABIC Then
         MsgBox recvSadadProfileUpdMsg.aRemarks
      Else
         MsgBox recvSadadProfileUpdMsg.eRemarks
      End If
      Exit Sub
   End If
   
   If Trim(recvSadadProfileUpdMsg.msgStatusCode) <> "0" Then
      tCode = recvSadadProfileUpdMsg.msgStatusCode
      mQry = "select * from sadadupdstatusinfo where updstatuscode = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            tmpStr = tCode & "-" & rs("arabicdescription")
         Else
            tmpStr = tCode & "-" & rs("englishdescription")
         End If
      Else
         tmpStr = tCode & "-" & "Not defined in local DB"
      End If
      If UserLang = ENGLISH Then
         errorMsg = "Error(MessageStatus Code) " & recvSadadProfileUpdMsg.msgStatusCode & " [" & tmpStr & "] received from SADAD.. Please check and try again"
      Else
         errorMsg = "Error(MessageStatus Code) " & recvSadadProfileUpdMsg.msgStatusCode & " [" & tmpStr & "] received from SADAD.. Please check and try again"
      End If
      MsgBox errorMsg
      Exit Sub
   End If
   
   If Val(recvSadadProfileUpdMsg.recordCount) > 0 Then
      tmpRow = noOfRecs + 1
      i = 1
      Do While True
         profileInfoGrid.Row = tmpRow
         profileInfoGrid.Col = 0
         tmpCompanyId = Mid$(profileInfoGrid.text, 1, 3)
         profileInfoGrid.Col = 1
         tmpSubscriptionNo = profileInfoGrid.text
         If Len(Trim(tmpSubscriptionNo)) = 0 Then
            Exit Do
         End If
         profileInfoGrid.Col = 2
         If UserLang = ARABIC Then
            profileInfoGrid.CellAlignment = flexAlignRightCenter
         Else
            profileInfoGrid.CellAlignment = flexAlignLeftCenter
         End If
         profileInfoGrid.text = recvSadadProfileUpdMsg.details(i).isInProfile
         profileInfoGrid.Col = 3
         If UserLang = ARABIC Then
            profileInfoGrid.CellAlignment = flexAlignRightCenter
         Else
            profileInfoGrid.CellAlignment = flexAlignLeftCenter
         End If
         tCode = recvSadadProfileUpdMsg.details(i).updStatusCode
          
         mQry = "select * from sadadupdstatusinfo where updstatuscode = '" & tCode & "'"
         Set rs = db.OpenRecordset(mQry)
         If rs.recordCount > 0 Then
            If UserLang = ARABIC Then
               profileInfoGrid.text = tCode & "-" & rs("arabicdescription")
            Else
               profileInfoGrid.text = tCode & "-" & rs("englishdescription")
            End If
         Else
            profileInfoGrid.text = tCode & "-" & "Not defined in local DB"
         End If
                
         tmpRow = tmpRow + 1
         i = i + 1
    Loop
    End If
    
End Sub

Private Sub cmdAddToList_Click()

    Dim tmpRow As Integer
    Dim tmpCompanyId As String, tmpSubscriptionNo As String
    Dim newCompanyId As String, newSubscriptionNo As String

    If Len(RTrim(txtSubscriptionNo)) = 0 Then
       MsgBox errSpaceSubscriptionNo(UserLang)
       txtSubscriptionNo.SetFocus
       Exit Sub
    End If
    
    If Len(RTrim(cmbCompanyId)) = 0 Then
       MsgBox errSpaceCompanyId(UserLang)
       cmbCompanyId.SetFocus
       Exit Sub
    End If
    
    newCompanyId = Mid$(cmbCompanyId.text, 1, 3)
    newSubscriptionNo = Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@")
    tmpRow = 1
    Do While True
       profileInfoGrid.Row = tmpRow
       profileInfoGrid.Col = 0
       tmpCompanyId = Mid$(profileInfoGrid.text, 1, 3)
       profileInfoGrid.Col = 1
       tmpSubscriptionNo = profileInfoGrid.text
       If Len(Trim(tmpSubscriptionNo)) = 0 Then
          Exit Do
       End If
       
       If tmpCompanyId = newCompanyId And Trim(tmpSubscriptionNo) = Trim(newSubscriptionNo) Then
          MsgBox errBillAlreadyExists(UserLang) '"Biller Id & biller account already exists....."
          Exit Sub
       End If
       tmpRow = tmpRow + 1
    Loop
    
    currRow = currRow + 1
    profileInfoGrid.Row = currRow
    profileInfoGrid.Col = 0
    If UserLang = ARABIC Then
       profileInfoGrid.CellAlignment = flexAlignRightCenter
    Else
       profileInfoGrid.CellAlignment = flexAlignLeftCenter
    End If
    profileInfoGrid.text = Mid$(cmbCompanyId, 1, 3) & Mid$(cmbCompanyId, 5)
    profileInfoGrid.Col = 1
    If UserLang = ARABIC Then
       profileInfoGrid.CellAlignment = flexAlignRightCenter
    Else
       profileInfoGrid.CellAlignment = flexAlignLeftCenter
    End If
    profileInfoGrid.text = txtSubscriptionNo
        
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim flexRow As String, tWidth As String, colwidth(8) As Integer
    Dim rowTitle(8) As String
    Dim mQry As String
    Dim tmpStr As String, tCode As String
    Dim i As Integer
        
    colwidth(0) = 1500
    colwidth(1) = 2000
    colwidth(2) = 1400
    colwidth(3) = 2000
    colwidth(4) = 1400
    
    If UserLang = ARABIC Then
       ChangePositions frmSadadProfileAdd, 11800
       frmSadadProfileAdd.RightToLeft = True
    End If
    
    rowTitle(0) = "Biller Id"
    rowTitle(1) = "Billing Account"
    rowTitle(2) = "Is in profile"
    rowTitle(3) = "Update Status code"
    
    frmSadadProfileAdd.Caption = frmSadadProfileUpdCaption(0, UserLang)
    lblIdType.Caption = frmSadadProfileUpdCaption(1, UserLang)
    lblIdNumber.Caption = frmSadadProfileUpdCaption(2, UserLang)
    lblCompanyId.Caption = frmSadadProfileUpdCaption(3, UserLang)
    lblSubscriptionNo.Caption = frmSadadProfileUpdCaption(4, UserLang)
    cmdAddToList.Caption = frmSadadProfileUpdCaption(5, UserLang)
    cmdAddBills.Caption = frmSadadProfileUpdCaption(10, UserLang)
    cmdCancel.Caption = frmSadadProfileUpdCaption(11, UserLang)
           
    profileInfoGrid.Clear
    profileInfoGrid.Row = 0
    profileInfoGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 3
      profileInfoGrid.Col = i
      If UserLang = ARABIC Then
         profileInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         profileInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      profileInfoGrid.text = frmSadadProfileUpdCaption(i + 6, UserLang)
      'profileInfoGrid.text = rowTitle(i)
      profileInfoGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
      
   profileInfoGrid.width = tWidth + 100
    
   profileInfoGrid.Row = 1
   
   mQry = "select * from companyidinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbCompanyId.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbCompanyId.AddItem Format(rs("companyid"), "!@@@@") & "-" & rs("englishname")
          Else
             cmbCompanyId.AddItem Format(rs("companyid"), "!@@@@") & "-" & rs("arabicname")
          End If
          rs.MoveNext
       Loop
    End If
    
    mQry = "select * from idinfo where displayforutilityenq = '1'"
   Set rs = db.OpenRecordset(mQry)
   If rs.recordCount > 0 Then
      cmbIdType.Clear
      Do While Not rs.EOF
         If UserLang = ENGLISH Then
            cmbIdType.AddItem rs("idcode") & "-" & rs("englishname")
         Else
            cmbIdType.AddItem rs("idcode") & "-" & rs("arabicname")
         End If
         rs.MoveNext
      Loop
   End If
   
   noOfRecs = Val(recvSadadProfileEnqMsg.recordCount)
   currRow = noOfRecs
   For i = 1 To noOfRecs
      profileInfoGrid.Row = i
      profileInfoGrid.Col = 0
      If UserLang = ARABIC Then
         profileInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         profileInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      tCode = recvSadadProfileEnqMsg.details(i).billerId
      mQry = "select * from companyidinfo where companyid = '" & tCode & "'"
      Set rs = db.OpenRecordset(mQry)
      If rs.recordCount > 0 Then
         If UserLang = ARABIC Then
            profileInfoGrid.text = tCode & "-" & rs("arabicname")
         Else
            profileInfoGrid.text = tCode & "-" & rs("englishname")
         End If
      Else
         profileInfoGrid.text = tCode & "-" & "Not defined in local DB"
      End If
      
      profileInfoGrid.Col = 1
      If UserLang = ARABIC Then
         profileInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         profileInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      profileInfoGrid.text = recvSadadProfileEnqMsg.details(i).billingAcct
      
      profileInfoGrid.Col = 2
      If UserLang = ARABIC Then
         profileInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         profileInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      profileInfoGrid.text = recvSadadProfileEnqMsg.details(i).isInProfile
   Next
      
   frmSadadProfileAdd.Show
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
