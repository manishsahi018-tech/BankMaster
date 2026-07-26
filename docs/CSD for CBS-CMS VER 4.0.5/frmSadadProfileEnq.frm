VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSadadProfileEnq 
   BackColor       =   &H00BFD87E&
   Caption         =   "SADAD profile Enquiry"
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
   Begin VB.TextBox txtIdNumber 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5880
      TabIndex        =   4
      Tag             =   "9855"
      Top             =   360
      Width           =   1695
   End
   Begin VB.ComboBox cmbIdType 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2640
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Tag             =   "9855"
      Top             =   360
      Width           =   1575
   End
   Begin VB.CommandButton cmdDeleteBill 
      Caption         =   "Delete Bill"
      Height          =   375
      Left            =   3720
      TabIndex        =   2
      ToolTipText     =   "Delete Bill"
      Top             =   7440
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5280
      TabIndex        =   1
      ToolTipText     =   "Cancel"
      Top             =   7440
      Width           =   1335
   End
   Begin MSFlexGridLib.MSFlexGrid profileInfoGrid 
      Height          =   5535
      Left            =   2280
      TabIndex        =   0
      Top             =   1320
      Width           =   6255
      _ExtentX        =   11033
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
      Tag             =   "9855"
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
      Tag             =   "9855"
      Top             =   360
      Width           =   1335
   End
End
Attribute VB_Name = "frmSadadProfileEnq"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdDeleteBill_Click()
   Dim strmsglen As String
   Dim tmpStr As String, tCode As String, mQry As String
   Dim tmpCompanyId As String, tmpSubscriptionNo As String
   Dim recCount As Integer, tmpRow As Integer, i As Integer
   recCount = 0
   
   formatSadadProfileMsg Mid$(cmbIdType, 1, 1), Format(txtIdNumber, "!@@@@@@@@@@@@@@@"), "D"
   sadadProfileMsg.recordCount = "001"
   
   SendMsg = sadadProfileMsg.msgLen & sadadProfileMsg.service & sadadProfileMsg.homeBranch & _
             sadadProfileMsg.userId & sadadProfileMsg.langInd & sadadProfileMsg.idNo & _
             sadadProfileMsg.idType & sadadProfileMsg.action & sadadProfileMsg.recordCount
   
   
    profileInfoGrid.Col = 0
    tmpCompanyId = Mid$(profileInfoGrid.text, 1, 3)
    profileInfoGrid.Col = 1
    tmpSubscriptionNo = profileInfoGrid.text
    
    sadadProfileMsg.details(1).billerId = tmpCompanyId
    sadadProfileMsg.details(1).billerAcct = Format(tmpSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
    SendMsg = SendMsg & sadadProfileMsg.details(1).billerAcct & _
                        sadadProfileMsg.details(1).billerId
               
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmSadadProfileEnq.MousePointer = vbHourglass
   cmdDeleteBill.Enabled = False
       
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmSadadProfileEnq.MousePointer = vbDefault
      cmdDeleteBill.Enabled = True
      Exit Sub
   End If
   frmSadadProfileEnq.MousePointer = vbDefault
   cmdDeleteBill.Enabled = True
   
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
      MsgBox errError(UserLang) & "(MessageStatusCode) [" & tmpStr & "] & errRecdFromSADAD(userlang)  "
      Exit Sub
   End If
   
   profileInfoGrid.Col = 2
   If UserLang = ARABIC Then
      profileInfoGrid.CellAlignment = flexAlignRightCenter
   Else
      profileInfoGrid.CellAlignment = flexAlignLeftCenter
   End If
   profileInfoGrid.text = recvSadadProfileUpdMsg.details(1).isInProfile
   profileInfoGrid.Col = 3
   If UserLang = ARABIC Then
      profileInfoGrid.CellAlignment = flexAlignRightCenter
   Else
      profileInfoGrid.CellAlignment = flexAlignLeftCenter
   End If
   tCode = recvSadadProfileUpdMsg.details(1).updStatusCode
          
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
    Dim i As Integer, noOfRecs As Integer
        
    colwidth(0) = 1500
    colwidth(1) = 2000
    colwidth(2) = 1400
    colwidth(3) = 2000
    colwidth(4) = 1400
    
    If UserLang = ARABIC Then
       ChangePositions frmSadadProfileEnq, 11800
       frmSadadProfileEnq.RightToLeft = True
    End If
    
    rowTitle(0) = "Biller Id"
    rowTitle(1) = "Billing Account"
    rowTitle(2) = "Is in profile"
    rowTitle(3) = "Profile Status Code"
    
    frmSadadProfileEnq.Caption = frmSadadProfileEnqCaption(0, UserLang)
    lblIdType.Caption = frmSadadProfileEnqCaption(1, UserLang)
    lblIdNumber.Caption = frmSadadProfileEnqCaption(2, UserLang)
    cmdDeleteBill.Caption = frmSadadProfileEnqCaption(7, UserLang)
    cmdCancel.Caption = frmSadadProfileEnqCaption(8, UserLang)
   
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
      profileInfoGrid.text = frmSadadProfileEnqCaption(i + 3, UserLang)
      'profileInfoGrid.text = rowTitle(i)
      profileInfoGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
      
   profileInfoGrid.Width = tWidth + 100
    
   profileInfoGrid.Row = 1
   
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
   
   If profileDelAction Then
      cmdDeleteBill.Enabled = True
   Else
      cmdDeleteBill.Enabled = False
   End If
      
   frmSadadProfileEnq.Show
   
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

