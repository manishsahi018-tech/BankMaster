VERSION 5.00
Begin VB.Form frmDocuments 
   BackColor       =   &H00BFD87E&
   Caption         =   "Essential Documents"
   ClientHeight    =   8760
   ClientLeft      =   885
   ClientTop       =   1395
   ClientWidth     =   12060
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8760
   ScaleWidth      =   12060
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdExit 
      Caption         =   "&Exit"
      Height          =   435
      Left            =   5880
      TabIndex        =   5
      ToolTipText     =   "Exit"
      Top             =   4335
      Width           =   1185
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "&OK"
      Height          =   435
      Left            =   4785
      TabIndex        =   4
      ToolTipText     =   "Ok"
      Top             =   4335
      Width           =   1080
   End
   Begin VB.Frame frameDocuments 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   2940
      Left            =   195
      TabIndex        =   1
      Top             =   825
      Width           =   11865
      Begin VB.ListBox lstSelectedDoc 
         Height          =   1425
         ItemData        =   "frmDocuments.frx":0000
         Left            =   6360
         List            =   "frmDocuments.frx":0002
         TabIndex        =   11
         Tag             =   "11865"
         Top             =   480
         Width           =   3855
      End
      Begin VB.ListBox lstCategoryDocs 
         Height          =   1425
         ItemData        =   "frmDocuments.frx":0004
         Left            =   840
         List            =   "frmDocuments.frx":0006
         TabIndex        =   10
         Tag             =   "11865"
         Top             =   480
         Width           =   3855
      End
      Begin VB.CommandButton cmdRemoveDoc 
         Appearance      =   0  'Flat
         Caption         =   "<<"
         Height          =   495
         Left            =   5355
         TabIndex        =   7
         Tag             =   "11865"
         Top             =   1260
         Width           =   735
      End
      Begin VB.CommandButton cmdAddDoc 
         Appearance      =   0  'Flat
         Caption         =   ">>"
         Height          =   495
         Left            =   5355
         TabIndex        =   6
         Tag             =   "11865"
         Top             =   765
         Width           =   735
      End
      Begin VB.TextBox txtDocOthers 
         Height          =   315
         Left            =   1800
         MaxLength       =   50
         TabIndex        =   2
         Tag             =   "11865"
         Text            =   " "
         Top             =   2445
         Width           =   5325
      End
      Begin VB.Label lblDocumentsSubmitted 
         BackColor       =   &H00BFD87E&
         Caption         =   "Documents Submitted"
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
         Height          =   210
         Left            =   8040
         TabIndex        =   9
         Tag             =   "11865"
         Top             =   240
         Width           =   2760
      End
      Begin VB.Label lblDocumentsListForCategory 
         BackColor       =   &H00BFD87E&
         Caption         =   "Documents List for Sub Category :< >"
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
         Height          =   210
         Left            =   2160
         TabIndex        =   8
         Tag             =   "11865"
         Top             =   240
         Width           =   3285
      End
      Begin VB.Label lblOthers 
         BackColor       =   &H00BFD87E&
         Caption         =   "Others"
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
         Height          =   285
         Left            =   795
         TabIndex        =   3
         Tag             =   "11865"
         Top             =   2430
         Width           =   795
      End
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Other Individuals"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Left            =   6960
      TabIndex        =   14
      Top             =   240
      Width           =   4245
   End
   Begin VB.Label lblMainCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Individual"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Left            =   3840
      TabIndex        =   13
      Top             =   240
      Width           =   2925
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   3000
      TabIndex        =   12
      Top             =   240
      Width           =   780
   End
   Begin VB.Shape Shape1 
      Height          =   540
      Left            =   150
      Top             =   4290
      Width           =   11640
   End
   Begin VB.Label lblEssentialDocuements 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Essential Documents"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   360
      Left            =   195
      TabIndex        =   0
      Top             =   180
      Width           =   2640
   End
   Begin VB.Shape Shape2 
      Height          =   540
      Left            =   135
      Top             =   105
      Width           =   11640
   End
End
Attribute VB_Name = "frmDocuments"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdAddDoc_Click()
   Dim i As Integer
If lstCategoryDocs.ListIndex >= 0 Then
      For i = 0 To lstCategoryDocs.ListCount
        If Left$(lstCategoryDocs.text, 3) = Left(lstSelectedDoc.List(i), 3) Then
           MsgBox errDocAlreadySelected(UserLang) ' "Document already added..."
           Exit Sub
        End If
    Next i
     lstSelectedDoc.AddItem lstCategoryDocs.text
Else
     MsgBox ("Select an item to add")
End If

End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdOk_Click()
  If supervisorAction Or searchAction Or custHistoryAction Then
     Unload Me
  Else
     documentsSelected = ""
     For i = 0 To lstSelectedDoc.ListCount - 1
         documentsSelected = documentsSelected & Left$(lstSelectedDoc.List(i), 3)
     Next
     documentsSelected = documentsSelected & Space(60 - Len(documentsSelected))
     otherDocumentsEntered = txtDocOthers
     Unload Me
  End If
End Sub

Private Sub cmdRemoveDoc_Click()
If lstSelectedDoc.ListIndex >= 0 Then
   For i = 0 To lstCategoryDocs.ListCount
       If Left$(lstSelectedDoc.text, 3) = Left(lstCategoryDocs.List(i), 3) Then
          lstSelectedDoc.RemoveItem (lstSelectedDoc.ListIndex)
          Exit Sub
       End If
    Next i
    lstCategoryDocs.AddItem lstSelectedDoc.text
    lstSelectedDoc.RemoveItem (lstSelectedDoc.ListIndex)
Else
    MsgBox ("Select an item to remove")
End If

End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim categoryDocuments As String
    Dim tCode As String
    Dim tmpStr As String
    Dim tmpDocuments As String
    Dim i  As Integer
    Dim j As Integer, pos As Integer
    
    lblMainCategoryDesc = mainCategoryDesc
    lblSubCategoryDesc = subCategoryDesc
    
    If UserLang = ARABIC Then
       ChangePositions frmDocuments, 11800
       frmDocuments.RightToLeft = True
    End If
    
    frmDocuments.Caption = frmDocumentsCaption(0, UserLang)
    lblEssentialDocuements.Caption = frmDocumentsCaption(0, UserLang)
    lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
    'lblSubCategory.Caption = frmIndividualOthers1Caption(3, UserLang)
    lblDocumentsListForCategory.Caption = frmDocumentsCaption(1, UserLang)
    lblDocumentsSubmitted.Caption = frmDocumentsCaption(2, UserLang)
    lblOthers.Caption = frmDocumentsCaption(3, UserLang)
    cmdOk.Caption = frmDocumentsCaption(4, UserLang)
    cmdExit.Caption = frmDocumentsCaption(5, UserLang)
    
    Set rs = db.OpenRecordset("select * from categorydocinfo where maincategorycode = '" & _
                               mainCategoryCode & "' and subCategoryCode = '" & _
                               subCategoryCode & "'")
                               
    If rs.recordCount > 0 Then
       categoryDocuments = rs("documents")
    Else
       If Not supervisorAction And Not searchAction And Not custHistoryAction Then
          MsgBox errNoDocDefined(UserLang)
       End If
    End If
    
    For i = 1 To Len(categoryDocuments) Step 3
        tCode = Mid$(categoryDocuments, i, 3)
        If Len(Trim(tCode)) = 0 Then
           Exit For
        End If
        Set rs = db.OpenRecordset("select * from documentinfo where " & _
                                   " documentcode = '" & tCode & "'")
        
        If rs.recordCount > 0 Then
           If UserLang = ARABIC Then
              tmpStr = tCode & "-" & rs("arabicname")
           Else
              tmpStr = tCode & "-" & rs("englishname")
           End If
        Else
           tmpStr = tCode & "-Not defined in local"
        End If
        lstCategoryDocs.AddItem tmpStr
    Next
    
    If supervisorAction Or searchAction Or custHistoryAction Then
       lstCategoryDocs.Enabled = False
       lstSelectedDoc.Enabled = False
       cmdAddDoc.Enabled = False
       cmdRemoveDoc.Enabled = False
       txtDocOthers.Enabled = False
    Else
       lstCategoryDocs.Enabled = True
       lstSelectedDoc.Enabled = True
       cmdAddDoc.Enabled = True
       cmdRemoveDoc.Enabled = True
       txtDocOthers.Enabled = True
    End If
    
    'If supervisorAction Or searchAction Or updateAction Or tellerAction Or custHistoryAction Then
    If Len(RTrim(documentsSelected)) > 0 Or Len(RTrim(otherDocumentsEntered)) > 0 Then
       pos = 1
       j = 0
       lstSelectedDoc.Clear
       tmpDocuments = ""
       For i = 1 To Len(RTrim(documentsSelected)) Step 3
           tmpDocuments = tmpDocuments & "~" & Mid(documentsSelected, i, 3)
       Next i
       For i = 0 To lstCategoryDocs.ListCount - 1
           If InStr(tmpDocuments, Mid$(lstCategoryDocs.List(i), 1, 3)) > 0 Then
              lstSelectedDoc.List(j) = lstCategoryDocs.List(i)
              j = j + 1
              pos = pos + 3
           End If
       Next i
       
       txtDocOthers = otherDocumentsEntered
    End If
    
    If phoneCustOpenAction = True Then
       txtDocOthers = "To be collected at the branches"
    End If

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameDocuments_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub lstCategoryDocs_DblClick()
   cmdAddDoc_Click
End Sub

Private Sub lstCategoryDocs_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub lstSelectedDoc_DblClick()
   cmdRemoveDoc_Click
End Sub

Private Sub lstSelectedDoc_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtDocOthers_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub
