VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmJuristicSignatory 
   BackColor       =   &H00BFD87E&
   Caption         =   "Signatory Details"
   ClientHeight    =   7530
   ClientLeft      =   3330
   ClientTop       =   2460
   ClientWidth     =   6420
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7530
   ScaleWidth      =   6420
   Begin VB.Frame frameSignatoryIdInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   120
      TabIndex        =   45
      Top             =   3120
      Width           =   11775
      Begin VB.TextBox txtIdIssueYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   5595
         MaxLength       =   4
         TabIndex        =   8
         Tag             =   "11775"
         Top             =   600
         Width           =   585
      End
      Begin VB.ComboBox cmbIdIssueMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   5010
         TabIndex        =   7
         Tag             =   "11775"
         Text            =   "01"
         Top             =   600
         Width           =   615
      End
      Begin VB.ComboBox cmbIdIssueDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   4395
         TabIndex        =   6
         Tag             =   "11775"
         Text            =   "01"
         Top             =   600
         Width           =   615
      End
      Begin VB.Frame FrameIdDateType 
         BackColor       =   &H00BFD87E&
         Height          =   495
         Left            =   1320
         TabIndex        =   46
         Tag             =   "11775"
         Top             =   465
         Width           =   1935
         Begin VB.OptionButton optIdDateGreg 
            BackColor       =   &H00BFD87E&
            Caption         =   "Gregorian"
            Height          =   195
            Left            =   720
            TabIndex        =   5
            Tag             =   "1935"
            ToolTipText     =   "Gregorian"
            Top             =   180
            Width           =   1095
         End
         Begin VB.OptionButton optIdDateHijri 
            BackColor       =   &H00BFD87E&
            Caption         =   "Hijri"
            Height          =   255
            Left            =   120
            TabIndex        =   4
            Tag             =   "1935"
            ToolTipText     =   "Hijri"
            Top             =   180
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbIdType 
         Height          =   315
         Left            =   1335
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Tag             =   "11775"
         Top             =   180
         Width           =   1440
      End
      Begin VB.ComboBox cmbIdExpiryDate 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   8805
         TabIndex        =   9
         Tag             =   "11775"
         Text            =   "01"
         Top             =   645
         Width           =   615
      End
      Begin VB.ComboBox cmbIdExpiryMonth 
         BackColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9405
         TabIndex        =   10
         Tag             =   "11775"
         Text            =   "01"
         Top             =   645
         Width           =   615
      End
      Begin VB.TextBox txtIdExpiryYear 
         BackColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   10035
         MaxLength       =   4
         TabIndex        =   11
         Tag             =   "11775"
         Top             =   660
         Width           =   585
      End
      Begin VB.CommandButton cmdCheckIdExistance 
         Caption         =   "&Check Existence"
         Height          =   315
         Left            =   6165
         TabIndex        =   2
         Tag             =   "11775"
         Top             =   150
         Width           =   1410
      End
      Begin VB.TextBox txtIdNo 
         Height          =   315
         Left            =   3915
         MaxLength       =   15
         TabIndex        =   1
         Tag             =   "11775"
         Top             =   120
         Width           =   2055
      End
      Begin VB.ComboBox cmbIdIssuedAt 
         Height          =   315
         Left            =   8835
         TabIndex        =   3
         Tag             =   "11775"
         Text            =   "Riyadh"
         Top             =   120
         Width           =   1815
      End
      Begin VB.Label lblIdNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "ID No."
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
         Height          =   195
         Left            =   2880
         TabIndex        =   52
         Tag             =   "11775"
         Top             =   180
         Width           =   930
      End
      Begin VB.Label lblIdIssueDate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Issue Date"
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
         Height          =   195
         Left            =   3300
         TabIndex        =   51
         Tag             =   "11775"
         Top             =   675
         Width           =   1155
      End
      Begin VB.Label lblIdDateType 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Date Type"
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
         Height          =   195
         Left            =   120
         TabIndex        =   50
         Tag             =   "11775"
         Top             =   690
         Width           =   900
      End
      Begin VB.Label lblIdType 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "ID Type"
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
         Height          =   195
         Left            =   135
         TabIndex        =   49
         Tag             =   "11775"
         Top             =   240
         Width           =   690
      End
      Begin VB.Label lblIdExpiryDate 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Expiry Date"
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
         Height          =   195
         Left            =   7605
         TabIndex        =   48
         Tag             =   "11775"
         Top             =   705
         Width           =   990
      End
      Begin VB.Label lblIdIssuedAt 
         AutoSize        =   -1  'True
         BackColor       =   &H00BFD87E&
         Caption         =   "Issued At"
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
         Height          =   195
         Left            =   7770
         TabIndex        =   47
         Tag             =   "11775"
         Top             =   210
         Width           =   810
      End
   End
   Begin VB.TextBox txtDiplomaticPpNo 
      Height          =   315
      Left            =   1320
      MaxLength       =   15
      TabIndex        =   22
      Tag             =   "11775"
      Top             =   5400
      Width           =   1815
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   420
      Left            =   6720
      TabIndex        =   28
      ToolTipText     =   "Cancel"
      Top             =   6675
      Width           =   1320
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "&Add"
      Height          =   420
      Left            =   4080
      TabIndex        =   26
      ToolTipText     =   "Add"
      Top             =   6675
      Width           =   1320
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Update"
      Height          =   420
      Left            =   5370
      TabIndex        =   27
      ToolTipText     =   "Update"
      Top             =   6675
      Width           =   1320
   End
   Begin VB.Frame FrameSignEnable 
      BackColor       =   &H00BFD87E&
      Caption         =   "Signature Enabled"
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
      Height          =   540
      Left            =   165
      TabIndex        =   41
      Top             =   5865
      Width           =   1830
      Begin VB.OptionButton optSignEnableNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "No"
         Height          =   300
         Left            =   960
         TabIndex        =   24
         Tag             =   "1830"
         Top             =   210
         Width           =   705
      End
      Begin VB.OptionButton optSignEnableYes 
         BackColor       =   &H00BFD87E&
         Caption         =   "Yes"
         Height          =   300
         Left            =   135
         TabIndex        =   23
         Tag             =   "1830"
         Top             =   210
         Value           =   -1  'True
         Width           =   705
      End
   End
   Begin VB.ComboBox cmbDisableReason 
      Enabled         =   0   'False
      Height          =   315
      Left            =   5040
      TabIndex        =   25
      Text            =   "Reasons for disabled"
      Top             =   5940
      Width           =   3555
   End
   Begin VB.Frame FrameSignatoryNameInfo 
      BackColor       =   &H00BFD87E&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   165
      TabIndex        =   29
      Top             =   4230
      Width           =   11775
      Begin VB.TextBox txtArabFirstName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   12
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
      End
      Begin VB.TextBox txtArabic2ndName 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   13
         Tag             =   "11775"
         Top             =   240
         Width           =   1815
      End
      Begin VB.TextBox txtArabLastName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   15
         Tag             =   "11775"
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtArabShortName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   16
         Tag             =   "11775"
         Top             =   240
         Width           =   3015
      End
      Begin VB.TextBox txtEngFirstName 
         Height          =   315
         Left            =   1200
         MaxLength       =   15
         TabIndex        =   17
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEnglish2ndName 
         Height          =   315
         Left            =   3120
         MaxLength       =   15
         TabIndex        =   18
         Tag             =   "11775"
         Top             =   600
         Width           =   1815
      End
      Begin VB.TextBox txtEngLastName 
         Height          =   315
         Left            =   6720
         MaxLength       =   15
         TabIndex        =   20
         Tag             =   "11775"
         Top             =   600
         Width           =   1695
      End
      Begin VB.TextBox txtEngShortName 
         Height          =   285
         Left            =   8640
         MaxLength       =   30
         TabIndex        =   21
         Tag             =   "11775"
         Top             =   600
         Width           =   3015
      End
      Begin VB.TextBox txtArabic3rdName 
         Alignment       =   1  'Right Justify
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   14
         Tag             =   "11775"
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox txtEnglish3rdName 
         Height          =   285
         Left            =   5040
         MaxLength       =   15
         TabIndex        =   19
         Tag             =   "11775"
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label lblFirstName 
         BackColor       =   &H00BFD87E&
         Caption         =   "First Name"
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
         Height          =   255
         Left            =   1185
         TabIndex        =   36
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.Label lbl2ndName 
         BackColor       =   &H00BFD87E&
         Caption         =   "2nd Name"
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
         Height          =   255
         Left            =   3120
         TabIndex        =   35
         Tag             =   "11775"
         Top             =   0
         Width           =   1815
      End
      Begin VB.Label lblLastName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Last Name"
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
         Height          =   255
         Left            =   6720
         TabIndex        =   34
         Tag             =   "11775"
         Top             =   0
         Width           =   1695
      End
      Begin VB.Label lblArabicName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Arabic Name"
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
         Height          =   255
         Left            =   15
         TabIndex        =   33
         Tag             =   "11775"
         Top             =   255
         Width           =   1215
      End
      Begin VB.Label lblEnglishName 
         BackColor       =   &H00BFD87E&
         Caption         =   "English Name"
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
         Height          =   255
         Left            =   0
         TabIndex        =   32
         Tag             =   "11775"
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label lblShortName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Short Name"
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
         Height          =   255
         Left            =   8655
         TabIndex        =   31
         Tag             =   "11775"
         Top             =   0
         Width           =   2895
      End
      Begin VB.Label lbl3rdName 
         BackColor       =   &H00BFD87E&
         Caption         =   "3rd Name"
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
         Height          =   255
         Left            =   5040
         TabIndex        =   30
         Tag             =   "11775"
         Top             =   0
         Width           =   1575
      End
   End
   Begin MSFlexGridLib.MSFlexGrid signatoryInfoGrid 
      Height          =   2145
      Left            =   120
      TabIndex        =   43
      Top             =   915
      Width           =   11700
      _ExtentX        =   20638
      _ExtentY        =   3784
      _Version        =   393216
      Rows            =   100
      Cols            =   5
      FixedCols       =   0
      BackColor       =   12572798
      ForeColor       =   8388608
      BackColorBkg    =   12572798
      AllowUserResizing=   1
   End
   Begin VB.Label lblHistory 
      BackColor       =   &H00BFD87E&
      Caption         =   "History"
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
      Height          =   255
      Left            =   360
      TabIndex        =   53
      Top             =   6840
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblSubCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Juristic"
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
      Left            =   7200
      TabIndex        =   44
      Top             =   240
      Width           =   4245
   End
   Begin VB.Label lblReasonForDisable 
      BackColor       =   &H00BFD87E&
      Caption         =   "Reasons for Disabled Signature"
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
      Height          =   600
      Left            =   3285
      TabIndex        =   42
      Tag             =   "11775"
      Top             =   5880
      Width           =   1740
   End
   Begin VB.Label lblMainCategoryDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Juristic"
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
      TabIndex        =   40
      Top             =   240
      Width           =   3165
   End
   Begin VB.Label lblMainCategory 
      BackColor       =   &H00BFD87E&
      Caption         =   "Category:"
      Height          =   270
      Left            =   3000
      TabIndex        =   39
      Top             =   240
      Width           =   780
   End
   Begin VB.Label lblDiplomaticPPNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Diplomatic PP Number"
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
      Height          =   435
      Left            =   135
      TabIndex        =   38
      Tag             =   "11775"
      Top             =   5325
      Width           =   1170
   End
   Begin VB.Shape Shape1 
      Height          =   540
      Left            =   150
      Top             =   6615
      Width           =   11640
   End
   Begin VB.Label lblSignatoryDetails 
      AutoSize        =   -1  'True
      BackColor       =   &H00BFD87E&
      Caption         =   "Signatory Details"
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
      TabIndex        =   37
      Top             =   180
      Width           =   2070
   End
   Begin VB.Shape Shape2 
      Height          =   540
      Left            =   135
      Top             =   105
      Width           =   11640
   End
   Begin VB.Line Line5 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      DrawMode        =   4  'Mask Not Pen
      X1              =   165
      X2              =   11685
      Y1              =   4620
      Y2              =   4620
   End
End
Attribute VB_Name = "frmJuristicSignatory"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public signatoryAddAction As Boolean
Public signatoryUpdateAction As Boolean

Private Sub cmbIdExpiryDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdExpiryDate.text)) <> 0 Then
         If Len(cmbIdExpiryDate) = 2 Then
            If cmbIdExpiryDate < 1 Or _
               cmbIdExpiryDate > IIf(optIdDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIdExpiryDate.text = ""
               cmbIdExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbIdExpiryMonth.SetFocus
            End If
         End If
      End If
   ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
      If Len(RTrim(cmbIdExpiryDate.text)) <> 0 Then
         If Len(cmbIdExpiryDate) = 2 Then
            If cmbIdExpiryDate < 1 Or _
               cmbIdExpiryDate > IIf(optIdDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIdExpiryDate.text = ""
               cmbIdExpiryDate.SetFocus
            Else
               On Error Resume Next
               cmbIdExpiryMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdExpiryDate_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errOnlyNumeralsAllowed(UserLang))
        Exit Sub
    End If
End Sub

Private Sub cmbIdExpiryMonth_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdExpiryMonth.text)) <> 0 Then
         If Len(cmbIdExpiryMonth.text) = 2 Then
            If cmbIdExpiryMonth < 1 Or cmbIdExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIdExpiryMonth.text = ""
               cmbIdExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtIdExpiryYear.SetFocus
            End If
         End If
      End If
   ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
      If Len(RTrim(cmbIdExpiryMonth.text)) <> 0 Then
         If Len(cmbIdExpiryMonth.text) = 2 Then
            If cmbIdExpiryMonth < 1 Or cmbIdExpiryMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIdExpiryMonth.text = ""
               cmbIdExpiryMonth.SetFocus
            Else
               On Error Resume Next
               txtIdExpiryYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdExpiryMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIdIssueDate_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdIssueDate.text)) <> 0 Then
         If Len(cmbIdIssueDate.text) = 2 Then
            If cmbIdIssueDate < 1 Or _
               cmbIdIssueDate > IIf(optIdDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIdIssueDate.text = ""
               cmbIdIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbIdIssueMonth.SetFocus
            End If
         End If
      End If
   ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
     If Len(RTrim(cmbIdIssueDate.text)) <> 0 Then
         If Len(cmbIdIssueDate.text) = 2 Then
            If cmbIdIssueDate < 1 Or _
               cmbIdIssueDate > IIf(optIdDateGreg.Value = True, 31, 30) Then
               MsgBox errEnterValidDate(UserLang) '"Enter a valid Date"
               cmbIdIssueDate.text = ""
               cmbIdIssueDate.SetFocus
            Else
               On Error Resume Next
               cmbIdIssueMonth.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdIssueDate_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIdIssueMonth_Change()
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(cmbIdIssueMonth.text)) <> 0 Then
         If Len(cmbIdIssueMonth.text) = 2 Then
            If cmbIdIssueMonth < 1 Or cmbIdIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIdIssueMonth.text = ""
               cmbIdIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtIdIssueYear.SetFocus
            End If
         End If
      End If
   ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
      If Len(RTrim(cmbIdIssueMonth.text)) <> 0 Then
         If Len(cmbIdIssueMonth.text) = 2 Then
            If cmbIdIssueMonth < 1 Or cmbIdIssueMonth > 12 Then
               MsgBox errEnterValidMonth(UserLang) '"Enter a valid Month"
               cmbIdIssueMonth.text = ""
               cmbIdIssueMonth.SetFocus
            Else
               On Error Resume Next
               txtIdIssueYear.SetFocus
            End If
         End If
      End If
   End If

End Sub

Private Sub cmbIdIssueMonth_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub cmbIdType_Click()
   If Len(RTrim(cmbIdType.text)) <> 0 Then
      If Mid$(cmbIdType.text, 1, 1) = "I" Or _
         Mid$(cmbIdType.text, 1, 1) = "Q" Then
         txtIdNo = ""
      End If
   End If
End Sub

Private Sub cmdAdd_Click()
    Dim tmpSignatoryNo As String
    Dim custNo As String
    Dim recdIdNo As String, recdIdType As String
    Dim tmpRow As Integer
    Dim tmpIdType As String, tmpIdNo As String
    
    recdIdType = Mid$(cmbIdType.text, 1, 1)
    recdIdNo = Format(txtIdNo, "!@@@@@@@@@@@@@@@")
    tmpRow = 1
    Do While True
       signatoryInfoGrid.Row = tmpRow
       signatoryInfoGrid.Col = 0
       custNo = signatoryInfoGrid.text
       signatoryInfoGrid.Col = 1
       tmpSignatoryNo = signatoryInfoGrid.text
       If Len(RTrim(tmpSignatoryNo)) = 0 Then
          Exit Do
       End If
       signatoryInfoGrid.Col = 4
       tmpIdType = Mid$(signatoryInfoGrid.text, 1, 1)
       tmpIdNo = Mid$(signatoryInfoGrid.text, 3)
       
       If recdIdType = tmpIdType And Trim(recdIdNo) = Trim(tmpIdNo) Then
          MsgBox errIdAlreadySelected(UserLang) & tmpSignatoryNo & errCannotSelectAgain(UserLang)
          Exit Sub
       End If
       tmpRow = tmpRow + 1
    Loop
    
    If validateFrmJuristicSignatory = 1 Then
       Exit Sub
    End If
    signatoryAddAction = True
    signatoryUpdateAction = False
    createSignatory
    If recvSignatoryMsg.status <> "000" And recvSignatoryMsg.status <> "122" Then
       noOfSignatory = noOfSignatory - 1
    End If
End Sub

Private Sub cmdCancel_Click()
    Me.Hide
    If signatoryUpdatedByCSO = True Then
       MsgBox errPressCreateToCompleteSignatoryUpd(UserLang) '"Please press create button to complete the signatory update..."
    End If
    CSD_mdiForm.staticStatus.Panels(3).text = " "
End Sub

Private Sub cmdCheckIdExistance_Click()
    Dim strmsglen As String
    Dim issueDate As String
    Dim expiryDate As String
    
    SendMsg = "000000" & "74" & gBranchCode & Mid$(cmbIdType, 1, 1) & Format(txtIdNo, "!@@@@@@@@@@@@@@@") & Space(50)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmJuristicSignatory.MousePointer = vbDefault
       frmJuristicSignatory.cmdCancel.Enabled = True
       frmJuristicSignatory.cmdAdd.Enabled = True
       frmJuristicSignatory.cmdUpdate.Enabled = True
       Exit Sub
    End If
    parseCheckIdRequest
    
    If recvCheckIdMsg.status <> "000" Then
       If UserLang = ENGLISH Then
          MsgBox recvCheckIdMsg.eRemarks
       Else
          MsgBox recvCheckIdMsg.aRemarks
       End If
       Exit Sub
   End If
   
   If recvCheckIdMsg.idExistFlag = "1" Then  ' id found
      cmbIdIssuedAt.text = recvCheckIdMsg.idIssuedAt
      If recvCheckIdMsg.idDateType = "0" Then
         optIdDateHijri.Value = True
         issueDate = recvCheckIdMsg.idIssueDateH
         expiryDate = recvCheckIdMsg.idExpiryDateH
      Else
         optIdDateGreg.Value = True
         issueDate = recvCheckIdMsg.idIssueDateG
         expiryDate = recvCheckIdMsg.idExpiryDateG
      End If
      
      cmbIdIssueDate = Mid$(issueDate, 7, 2)
      cmbIdIssueMonth = Mid$(issueDate, 5, 2)
      txtIdIssueYear = Mid$(issueDate, 1, 4)
      
      cmbIdExpiryDate = Mid$(expiryDate, 7, 2)
      cmbIdExpiryMonth = Mid$(expiryDate, 5, 2)
      txtIdExpiryYear = Mid$(expiryDate, 1, 4)
      txtArabFirstName.SetFocus
   Else
      MsgBox errIdNotFound(UserLang)
      cmbIdIssuedAt.SetFocus
   End If

End Sub

Private Sub cmdUpdate_Click()
    If validateFrmJuristicSignatory = 1 Then
       Exit Sub
    End If
    signatoryAddAction = False
    signatoryUpdateAction = True
    createSignatory
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
   Dim num As String
   Dim mQry As String, rowTitle(8) As String
   Dim tListIndex As Integer
   Dim tWidth As Integer, colwidth(8) As Integer
    
   If UserLang = ARABIC Then
      ChangePositions frmJuristicSignatory, 11800
      frmJuristicSignatory.Hide
      frmJuristicSignatory.RightToLeft = True
   End If
    lblMainCategoryDesc = mainCategoryDesc
    lblSubCategoryDesc = subCategoryDesc
    
    frmJuristicSignatory.Caption = frmJuristicSignatoryCaption(0, UserLang)
    lblSignatoryDetails.Caption = frmJuristicSignatoryCaption(0, UserLang)
    lblMainCategory.Caption = frmIndividualOthers1Caption(2, UserLang)
    
    lblIdType.Caption = frmJuristicSignatoryCaption(1, UserLang)
    lblIdNo.Caption = frmJuristicSignatoryCaption(2, UserLang)
    cmdCheckIdExistance.Caption = frmJuristicSignatoryCaption(3, UserLang)
    lblIdIssuedAt.Caption = frmJuristicSignatoryCaption(4, UserLang)
    lblIdDateType.Caption = frmJuristicSignatoryCaption(5, UserLang)
    optIdDateHijri.Caption = frmJuristicSignatoryCaption(6, UserLang)
    optIdDateGreg.Caption = frmJuristicSignatoryCaption(7, UserLang)
    lblIdIssueDate.Caption = frmJuristicSignatoryCaption(8, UserLang)
    lblIdExpiryDate.Caption = frmJuristicSignatoryCaption(9, UserLang)
    lblFirstName.Caption = frmJuristicSignatoryCaption(10, UserLang)
    lbl2ndName.Caption = frmJuristicSignatoryCaption(11, UserLang)
    lbl3rdName.Caption = frmJuristicSignatoryCaption(12, UserLang)
    lblLastName.Caption = frmJuristicSignatoryCaption(13, UserLang)
    lblShortName.Caption = frmJuristicSignatoryCaption(15, UserLang)
    lblArabicName.Caption = frmJuristicSignatoryCaption(14, UserLang)
    lblEnglishName.Caption = frmJuristicSignatoryCaption(16, UserLang)
    lblDiplomaticPPNo.Caption = frmJuristicSignatoryCaption(17, UserLang)
    FrameSignEnable.Caption = frmJuristicSignatoryCaption(18, UserLang)
    optSignEnableYes.Caption = frmJuristicSignatoryCaption(19, UserLang)
    optSignEnableNo.Caption = frmJuristicSignatoryCaption(20, UserLang)
    lblReasonForDisable.Caption = frmJuristicSignatoryCaption(21, UserLang)
    cmdAdd.Caption = frmJuristicSignatoryCaption(22, UserLang)
    cmdUpdate.Caption = frmJuristicSignatoryCaption(23, UserLang)
    cmdCancel.Caption = frmJuristicSignatoryCaption(24, UserLang)
    
    
    colwidth(0) = 1200
    colwidth(1) = 500
    colwidth(2) = 3500
    colwidth(3) = 1500
    colwidth(4) = 2500
    
'    rowTitle(0) = "Account #"
'    rowTitle(1) = "Signature #"
'    rowTitle(2) = "Signatory Name"
'    rowTitle(3) = "Customer branch code"
'    rowTitle(4) = "IdType-id Number"
      
    signatoryInfoGrid.Clear
    signatoryInfoGrid.Row = 0
    signatoryInfoGrid.Font.Bold = True
     
    tWidth = 0
    For i = 0 To 4
      signatoryInfoGrid.Col = i
      If UserLang = ARABIC Then
         signatoryInfoGrid.CellAlignment = flexAlignRightCenter
      Else
         signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
      End If
      signatoryInfoGrid.text = frmJuristicSignatoryCaption(i + 25, UserLang)
      signatoryInfoGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    signatoryInfoGrid.Width = tWidth + 100
    signatoryInfoGrid.Row = 1
 
    mQry = "select * from idinfo"
    Set rs = db.OpenRecordset(mQry)
    tListIndex = 0
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbIdType.Clear
       Do While Not rs.EOF
          If rs("idcode") <> "C" And rs("idcode") <> "L" Then
             If UserLang = ENGLISH Then
                cmbIdType.AddItem rs("idcode") & "-" & rs("englishname")
             Else
                cmbIdType.AddItem rs("idcode") & "-" & rs("arabicname")
             End If
             If rs("idcode") = "I" Then
                tListIndex = cmbIdType.ListCount
             End If
          End If
          rs.MoveNext
       Loop
    End If
    cmbIdType.ListIndex = tListIndex - 1
            
    mQry = "select * from cityinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
        rs.MoveFirst
        cmbIdIssuedAt.Clear
        Do While Not rs.EOF
           If UserLang = ENGLISH Then
              cmbIdIssuedAt.AddItem rs("englishname")
           Else
              cmbIdIssuedAt.AddItem rs("arabicname")
           End If
           rs.MoveNext
        Loop
    End If
    
    Set rs = db.OpenRecordset("select * from reasoncodeinfo")
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbDisableReason.Clear
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbDisableReason.AddItem rs("englishname")
          Else
             cmbDisableReason.AddItem rs("arabicname")
          End If
          rs.MoveNext
       Loop
       'cmbDisableReason.ListIndex = 1
    End If

    
    cmbIdIssueDate.Clear
    cmbIdIssueMonth.Clear
    cmbIdExpiryDate.Clear
    cmbIdExpiryMonth.Clear
    For i = 1 To 30
       If i < 10 Then
          num = "0" + CStr(i)
       Else
          num = CStr(i)
       End If
       cmbIdIssueDate.AddItem num
       cmbIdExpiryDate.AddItem num
       If i < 13 Then
          cmbIdIssueMonth.AddItem num
          cmbIdExpiryMonth.AddItem num
       End If
    Next
    
   If custHistoryAction Or accHistoryAction Then
      lblHistory.Visible = True
      lblHistory.Refresh
   Else
      lblHistory.Visible = False
   End If

   If supervisorAction Or searchAction Or custHistoryAction Then
      cmdAdd.Enabled = False
      cmdUpdate.Enabled = False
      frameSignatoryIdInfo.Enabled = False
      FrameSignatoryNameInfo.Enabled = False
      FrameSignEnable.Enabled = False
      cmbDisableReason.Enabled = False
      txtDiplomaticPpNo.Enabled = False
   Else
      cmdAdd.Enabled = True
      cmdUpdate.Enabled = True
      frameSignatoryIdInfo.Enabled = True
      FrameSignatoryNameInfo.Enabled = True
      FrameSignEnable.Enabled = True
      'cmbDisableReason.Enabled = True
      txtDiplomaticPpNo.Enabled = True
   End If
   
   cmdUpdate.Enabled = False ' added by rajesh on 9 dec 03 to avoid duplicates
                             ' during supervisor approval
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameSignatoryIdInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub FrameSignatoryNameInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub optIdDateGreg_Click()
   If cmbIdIssueDate.ListCount = 30 Then
      cmbIdIssueDate.AddItem 31
      cmbIdExpiryDate.AddItem 31
   End If
   cmbIdIssueDate = ""
   cmbIdIssueMonth = ""
   txtIdIssueYear = ""
   cmbIdExpiryDate = ""
   cmbIdExpiryMonth = ""
   txtIdExpiryYear = ""
End Sub

Private Sub optIdDateHijri_Click()
    If cmbIdIssueDate.ListCount = 31 Then
       cmbIdIssueDate.RemoveItem 30
       cmbIdExpiryDate.RemoveItem 30
    End If
    cmbIdIssueDate = ""
    cmbIdIssueMonth = ""
    txtIdIssueYear = ""
    cmbIdExpiryDate = ""
    cmbIdExpiryMonth = ""
    txtIdExpiryYear = ""
End Sub

Private Sub optSignEnableNo_Click()
    cmbDisableReason.Enabled = True
End Sub

Private Sub optSignEnableYes_Click()
    cmbDisableReason.Enabled = False
End Sub

Private Sub signatoryInfoGrid_DblClick()
    Dim signatoryNo As String
    Dim acctNo As String
    signatoryInfoGrid.Col = 0
    acctNo = signatoryInfoGrid.text
    signatoryInfoGrid.Col = 1
    signatoryNo = signatoryInfoGrid.text
    If Len(RTrim(signatoryNo)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang)
       Exit Sub
    End If
    fetchSignatoryInfo acctNo, signatoryNo
End Sub

Private Sub signatoryInfoGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtArabFirstName_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If

End Sub

Private Sub txtArabic2ndName_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If

End Sub

Private Sub txtArabic3rdName_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If

End Sub

Private Sub txtArabLastName_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If

End Sub

Private Sub txtArabShortName_GotFocus()
  If Not searchAction And Not custHistoryAction Then
     txtArabShortName = txtArabLastName + " " + txtArabFirstName
     If Len(txtArabShortName) + Len(txtArabic2ndName) < 30 Then
        txtArabShortName = txtArabShortName + " " + txtArabic2ndName
        If Len(txtArabShortName) + Len(txtArabic3rdName) < 30 Then
           txtArabShortName = txtArabShortName + " " + txtArabic3rdName
        End If
     End If
  ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
     txtArabShortName = txtArabLastName + " " + txtArabFirstName
     If Len(txtArabShortName) + Len(txtArabic2ndName) < 30 Then
        txtArabShortName = txtArabShortName + " " + txtArabic2ndName
        If Len(txtArabShortName) + Len(txtArabic3rdName) < 30 Then
           txtArabShortName = txtArabShortName + " " + txtArabic3rdName
        End If
     End If
  End If
End Sub

Private Sub txtArabShortName_KeyPress(KeyAscii As Integer)
  If ((KeyAscii > 64 And KeyAscii < 91) Or _
      (KeyAscii > 96 And KeyAscii < 123)) And KeyAscii <> 8 Then
        KeyAscii = 0
        MsgBox (errNoEnglishCharacters(UserLang))
        Exit Sub
    End If
    If KeyAscii = 220 Then
       MsgBox errNoDecorativeChars(UserLang)   '"Decorative Characters not allowed.."
       KeyAscii = 0
       Exit Sub
    End If

End Sub

Private Sub txtEngFirstName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEngFirstName_LostFocus()
   
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEngFirstName)) > 0 Then
         tmpStr = Trim(txtEngFirstName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngFirstName = tmpStr
      End If
   ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
      If Len(RTrim(txtEngFirstName)) > 0 Then
         tmpStr = Trim(txtEngFirstName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngFirstName = tmpStr
      End If
   End If
End Sub

Private Sub txtEngLastName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEngLastName_LostFocus()
   
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEngLastName)) > 0 Then
         tmpStr = Trim(txtEngLastName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngLastName = tmpStr
      End If
   ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
      If Len(RTrim(txtEngLastName)) > 0 Then
         tmpStr = Trim(txtEngLastName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngLastName = tmpStr
      End If
   End If
End Sub

Private Sub txtEnglish2ndName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEnglish2ndName_LostFocus()
   
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEnglish2ndName)) > 0 Then
         tmpStr = Trim(txtEnglish2ndName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEnglish2ndName = tmpStr
      End If
   ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
      If Len(RTrim(txtEnglish2ndName)) > 0 Then
         tmpStr = Trim(txtEnglish2ndName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEnglish2ndName = tmpStr
      End If
   End If
End Sub

Private Sub txtEnglish3rdName_KeyPress(KeyAscii As Integer)
If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEnglish3rdName_LostFocus()
   
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEnglish3rdName)) > 0 Then
         tmpStr = Trim(txtEnglish3rdName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEnglish3rdName = tmpStr
      End If
   ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
      If Len(RTrim(txtEnglish3rdName)) > 0 Then
         tmpStr = Trim(txtEnglish3rdName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEnglish3rdName = tmpStr
      End If
   End If
End Sub

Private Sub txtEngShortName_GotFocus()
 If Not searchAction And Not custHistoryAction Then
   txtEngShortName = txtEngLastName + " " + txtEngFirstName
   If Len(txtEngShortName) + Len(txtEnglish2ndName) < 30 Then
       txtEngShortName = txtEngShortName + " " + txtEnglish2ndName
       If Len(txtEngShortName) + Len(txtEnglish3rdName) < 30 Then
           txtEngShortName = txtEngShortName + " " + txtEnglish3rdName
       End If
    End If
 ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
    txtEngShortName = txtEngLastName + " " + txtEngFirstName
    If Len(txtEngShortName) + Len(txtEnglish2ndName) < 30 Then
       txtEngShortName = txtEngShortName + " " + txtEnglish2ndName
       If Len(txtEngShortName) + Len(txtEnglish3rdName) < 30 Then
           txtEngShortName = txtEngShortName + " " + txtEnglish3rdName
       End If
    End If
 End If
 
End Sub

Private Sub txtEngShortName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtEngshortName_LostFocus()
   
   Dim tmpStr As String
   
   If Not supervisorAction And Not searchAction And Not custHistoryAction Then
      If Len(RTrim(txtEngShortName)) > 0 Then
         tmpStr = Trim(txtEngShortName)
         Mid$(tmpStr, 1, 1) = UCase(Mid$(tmpStr, 1, 1))
         txtEngShortName = tmpStr
      End If
   End If
End Sub

Public Sub parseCheckIdRequest()
    recvCheckIdMsg.status = Mid$(RecvStr, 1, 3)
    recvCheckIdMsg.service = Mid$(RecvStr, 4, 2)
    recvCheckIdMsg.aRemarks = Mid$(RecvStr, 6, 50)
    recvCheckIdMsg.eRemarks = Mid$(RecvStr, 56, 50)
    recvCheckIdMsg.idType = RTrim(Mid$(RecvStr, 106, 1))
    recvCheckIdMsg.idNo = RTrim(Mid$(RecvStr, 107, 15))
    recvCheckIdMsg.idExistFlag = Mid$(RecvStr, 122, 1)
    recvCheckIdMsg.idIssuedAt = RTrim(Mid$(RecvStr, 123, 20))
    recvCheckIdMsg.idDateType = Mid$(RecvStr, 143, 1)
    recvCheckIdMsg.idIssueDateH = RTrim(Mid$(RecvStr, 144, 8))
    recvCheckIdMsg.idIssueDateG = RTrim(Mid$(RecvStr, 152, 8))
    recvCheckIdMsg.idExpiryDateH = RTrim(Mid$(RecvStr, 160, 8))
    recvCheckIdMsg.idExpiryDateG = RTrim(Mid$(RecvStr, 168, 8))
End Sub

Public Function validateFrmJuristicSignatory() As Integer
    Dim tIssueDate As String, tExpiryDate As String
    Dim langCode As String
    
    validateFrmJuristicSignatory = 0
    If Len(RTrim(cmbIdType.text)) = 0 Then
        MsgBox errSpaceIdType(UserLang)
        cmbIdType.SetFocus
        validateFrmJuristicSignatory = 1
        Exit Function
     Else
        validateFrmJuristicSignatory = 0
     End If
     
     If subCategoryCode = "26" Or subCategoryCode = "27" Or _
        subCategoryCode = "28" Or subCategoryCode = "29" Or _
        subCategoryCode = "30" Or subCategoryCode = "31" Or _
        subCategoryCode = "34" Or subCategoryCode = "35" Or _
        subCategoryCode = "24" Or subCategoryCode = "32" Or _
        subCategoryCode = "33" Or subCategoryCode = "36" Or _
        subCategoryCode = "37" Or subCategoryCode = "47" Or _
        subCategoryCode = "58" Or subCategoryCode = "64" Then
        If Mid$(cmbIdType.text, 1, 1) <> "I" And _
           Mid$(cmbIdType.text, 1, 1) <> "Q" Then
           MsgBox errOnlyIdIqamaAllowed(UserLang)
           cmbIdType.SetFocus
           validateFrmJuristicSignatory = 1
           Exit Function
        Else
           validateFrmJuristicSignatory = 0
        End If
    End If  ' subcateogycode = 26,27,28,29,30,31, 34, 35, 24, 32,33, 36,37,47 or 63
    
    If subCategoryCode = "44" Then
       If Mid$(cmbIdType.text, 1, 1) <> "P" Then
          MsgBox errOnlyPpAllowed(UserLang)
          cmbIdType.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If  ' subcategorycode = 44
     
     If Len(RTrim(txtIdNo)) = 0 Then
        MsgBox errSpaceId(UserLang) '"Id number cannot be spaces...Please enter.."
        txtIdNo.SetFocus
        validateFrmJuristicSignatory = 1
        Exit Function
     Else
        validateFrmJuristicSignatory = 0
     End If
     
     If Mid$(cmbIdType.text, 1, 1) = "I" Or _
        Mid$(cmbIdType.text, 1, 1) = "Q" Then
        If Len(Trim(txtIdNo)) <> 10 Then
           MsgBox errInvalidId(UserLang)
           txtIdNo.SetFocus
           validateFrmJuristicSignatory = 1
           Exit Function
        Else
           validateFrmJuristicSignatory = 0
        End If
        
        If Mid$(cmbIdType.text, 1, 1) = "I" Then
           If Mid$(txtIdNo, 1, 1) <> "1" Then
              MsgBox errInvalidIdCategory(UserLang)
              txtIdNo.SetFocus
              validateFrmJuristicSignatory = 1
              Exit Function
           Else
              validateFrmJuristicSignatory = 0
           End If
        ElseIf Mid$(cmbIdType.text, 1, 1) = "Q" Then
           If Mid$(txtIdNo, 1, 1) <> "2" And _
              Mid$(txtIdNo, 1, 1) <> "3" And _
              Mid$(txtIdNo, 1, 1) <> "5" Then
              MsgBox errInvalidIdCategory(UserLang)
              txtIdNo.SetFocus
              validateFrmJuristicSignatory = 1
              Exit Function
           Else
              validateFrmJuristicSignatory = 0
           End If
        End If
        
        If validIdNumber(Trim(txtIdNo)) = False Then
           MsgBox errInvalidIdNo(UserLang)
           txtIdNo.SetFocus
           validateFrmJuristicSignatory = 1
           Exit Function
        Else
           validateFrmJuristicSignatory = 0
        End If
     End If
     
     If Len(RTrim(cmbIdIssuedAt)) = 0 Then
        MsgBox errSpaceIdIssuedAt(UserLang)
        cmbIdIssuedAt.SetFocus
        validateFrmJuristicSignatory = 1
        Exit Function
     Else
        validateFrmJuristicSignatory = 0
     End If
     
     If Len(RTrim(cmbIdIssueDate.text)) = 0 Or _
        Len(RTrim(cmbIdIssueMonth.text)) = 0 Or _
        Len(RTrim(txtIdIssueYear)) = 0 Then
        MsgBox errSpaceIssueDate(UserLang)
        cmbIdIssueDate.SetFocus
        validateFrmJuristicSignatory = 1
        Exit Function
     Else
        validateFrmJuristicSignatory = 0
     End If

     tIssueDate = CStr(txtIdIssueYear) + _
                  CStr(cmbIdIssueMonth.text) + _
                  CStr(cmbIdIssueDate.text)
     tExpiryDate = CStr(txtIdExpiryYear) + _
                   CStr(cmbIdExpiryMonth.text) + _
                   CStr(cmbIdExpiryDate.text)
                           
     If optIdDateGreg.Value = True Then
        If Not validDate(tIssueDate) Then
           MsgBox errInvalidDate(UserLang)
           cmbIdIssueDate.SetFocus
           validateFrmJuristicSignatory = 1
           Exit Function
        Else
           validateFrmJuristicSignatory = 0
        End If
               
        If Not validDate(tExpiryDate) Then
           MsgBox errInvalidDate(UserLang)
           cmbIdExpiryDate.SetFocus
           validateFrmJuristicSignatory = 1
           Exit Function
        Else
           validateFrmJuristicSignatory = 0
        End If
     End If
                         
     If tExpiryDate < tIssueDate Then
        MsgBox errGreaterExpiryYear(UserLang)
        txtIdExpiryYear.SetFocus
        validateFrmJuristicSignatory = 1
        Exit Function
     Else
        validateFrmJuristicSignatory = 0
     End If
     
     If optIdDateHijri = True Then
        If tExpiryDate < currentHijriDate Then
           MsgBox errExpiryDateLessThanToday(UserLang)
           txtIdExpiryYear.SetFocus
           validateFrmJuristicSignatory = 1
           Exit Function
        Else
           validateFrmJuristicSignatory = 0
        End If
     Else
        If tExpiryDate < currentGregDate Then
           MsgBox errExpiryDateLessThanToday(UserLang)
           txtIdExpiryYear.SetFocus
           validateFrmJuristicSignatory = 1
           Exit Function
        Else
           validateFrmJuristicSignatory = 0
        End If
     End If
     
    If Len(RTrim(txtArabFirstName)) = 0 And _
       Len(RTrim(txtArabic2ndName)) = 0 And _
       Len(RTrim(txtArabic3rdName)) = 0 And _
       Len(RTrim(txtArabLastName)) = 0 And _
       Len(RTrim(txtEngFirstName)) = 0 And _
       Len(RTrim(txtEnglish2ndName)) = 0 And _
       Len(RTrim(txtEnglish3rdName)) = 0 And _
       Len(RTrim(txtEngLastName)) = 0 Then
       MsgBox errSpaceNames(UserLang) '"Atleast one name should be entered...Please enter"
       txtArabFirstName.SetFocus
       validateFrmJuristicSignatory = 1
       Exit Function
    Else
       validateFrmJuristicSignatory = 0
    End If
        
    If Len(RTrim(txtArabShortName)) = 0 And _
       Len(RTrim(txtEngShortName)) = 0 Then
       MsgBox errSpaceShortName(UserLang)
       txtArabShortName.SetFocus
       validateFrmJuristicSignatory = 1
       Exit Function
    Else
       validateFrmJuristicSignatory = 0
    End If
    
    If Len(RTrim(txtArabFirstName)) > 0 Then
       If englishCharFound(txtArabFirstName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabFirstName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtArabic2ndName)) > 0 Then
       If englishCharFound(txtArabic2ndName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabic2ndName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtArabic3rdName)) > 0 Then
       If englishCharFound(txtArabic3rdName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabic3rdName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtArabLastName)) > 0 Then
       If englishCharFound(txtArabLastName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabLastName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtArabShortName)) > 0 Then
       If englishCharFound(txtArabShortName) = True Then
          MsgBox errNoEnglishCharacters(UserLang)
          txtArabShortName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtEngFirstName)) > 0 Then
       If arabicCharFound(txtEngFirstName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngFirstName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtEnglish2ndName)) > 0 Then
       If arabicCharFound(txtEnglish2ndName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEnglish2ndName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtEnglish3rdName)) > 0 Then
       If arabicCharFound(txtEnglish3rdName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEnglish3rdName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtEngLastName)) > 0 Then
       If arabicCharFound(txtEngLastName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngLastName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If Len(RTrim(txtEngShortName)) > 0 Then
       If arabicCharFound(txtEngShortName) = True Then
          MsgBox errNoArabicCharacters(UserLang)
          txtEngShortName.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If
    
    If subCategoryCode = "43" Then
       If Len(RTrim(txtDiplomaticPpNo)) = 0 Then
          MsgBox errSpaceDiplomaticPpNo(UserLang)
          txtDiplomaticPpNo.SetFocus
          validateFrmJuristicSignatory = 1
          Exit Function
       Else
          validateFrmJuristicSignatory = 0
       End If
    End If ' subcategorycode = 43
     
     If optSignEnableNo.Value = True Then
        If Len(RTrim(cmbDisableReason)) = 0 Then
           MsgBox errSpaceDisableReason(UserLang)
           cmbDisableReason.SetFocus
           validateFrmJuristicSignatory = 1
           Exit Function
        Else
           validateFrmJuristicSignatory = 0
        End If
    End If
    
End Function

Public Sub createSignatory()
    Dim strmsglen As String
    Dim tmpAccNo As String
    signatoryInfoGrid.Col = 0
    tmpAccNo = signatoryInfoGrid.text
    
    formatNewSignatoryRequest
   
    SendMsg = signatoryInfo.msgLen & signatoryInfo.service & gBranchCode & signatoryInfo.userId & signatoryInfo.dateTime & _
              signatoryInfo.creationOrUpdate & signatoryInfo.NewOrUpdateFlag & _
              signatoryInfo.bmUpdateStatus & signatoryInfo.accNo & signatoryInfo.signatoryNo & signatoryInfo.supervisorId & signatoryInfo.custBranchCode & _
              signatoryInfo.idType & signatoryInfo.idNo & _
              signatoryInfo.idIssuedAt & signatoryInfo.idDateType & signatoryInfo.idIssueDateH & signatoryInfo.idIssueDateG & _
              signatoryInfo.idExpiryDateH & signatoryInfo.idExpiryDateG & signatoryInfo.aFirstName & signatoryInfo.a2ndName & _
              signatoryInfo.a3rdName & signatoryInfo.aLastName & _
              signatoryInfo.aShortName & signatoryInfo.eFirstName & signatoryInfo.e2ndName & signatoryInfo.e3rdName & signatoryInfo.eLastName & _
              signatoryInfo.eShortName & signatoryInfo.diplomaticPpNo & signatoryInfo.activeStatus & _
              signatoryInfo.disableReason & Space(50)
           
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmJuristicSignatory.MousePointer = vbHourglass
    frmJuristicSignatory.cmdAdd.Enabled = False
    frmJuristicSignatory.cmdUpdate.Enabled = False
    frmJuristicSignatory.cmdCancel.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    
    If retStatus = LocalCommsError Then
       LoadError = True
       frmJuristicSignatory.cmdAdd.Enabled = True
       'frmJuristicSignatory.cmdUpdate.Enabled = True commented by rajesh on 9 dec 03
                                                   ' to avoid duplicates during supervisor
                                                   ' approval
       frmJuristicSignatory.cmdCancel.Enabled = True
       frmJuristicSignatory.MousePointer = vbDefault
       Exit Sub
    End If
    
    frmJuristicSignatory.cmdAdd.Enabled = True
    'frmJuristicSignatory.cmdUpdate.Enabled = True  commented by rajesh on 9 dec 03
                                                   ' to avoid duplicates during supervisor
                                                   ' approval
                                                    
    frmJuristicSignatory.cmdCancel.Enabled = True
    frmJuristicSignatory.MousePointer = vbDefault
    
    parseSignatoryResponse
    If recvSignatoryMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvSignatoryMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvSignatoryMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
    ElseIf recvSignatoryMsg.status = "122" Then
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
       MsgBox errAlreadySignatoryForOthers(UserLang) & "  " & recvSignatoryMsg.duplicateAccNo
    Else
       If UserLang = ARABIC Then
          MsgBox recvSignatoryMsg.aRemarks
       Else
          MsgBox recvSignatoryMsg.eRemarks
       End If
       Exit Sub
    End If
    If frmJuristicSignatory.tag = "A" Then
       signatoryUpdatedByCSO = True
    End If
    
    'this is for clearing the form
    For i = 0 To Screen.ActiveForm.Controls.Count - 1
        If TypeOf Screen.ActiveForm.Controls(i) Is TextBox Then
           Screen.ActiveForm.Controls(i).text = ""
        End If
        If TypeOf Screen.ActiveForm.Controls(i) Is CheckBox Then
           Screen.ActiveForm.Controls(i).Value = 0
        End If
    Next
    
    signatoryKeyUserId = signatoryInfo.userId
    signatoryKeyBranch = gBranchCode
    signatoryKeyDateTime = signatoryInfo.dateTime
    
    ' Now adding the new signatory information to the grid
    
    signatoryInfoGrid.Row = Val(signatoryInfo.signatoryNo)
    signatoryInfoGrid.Col = 0
    signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
    signatoryInfoGrid.text = signatoryInfo.accNo
    signatoryInfoGrid.Col = 1
    signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
    signatoryInfoGrid.text = signatoryInfo.signatoryNo
    signatoryInfoGrid.Col = 2
    signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
    If Len(Trim(signatoryInfo.aShortName)) <> 0 Then
       signatoryInfoGrid.text = signatoryInfo.aShortName
    Else
       signatoryInfoGrid.text = signatoryInfo.eShortName
    End If
    signatoryInfoGrid.Col = 3
    signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
    signatoryInfoGrid.text = signatoryInfo.custBranchCode
    signatoryInfoGrid.Col = 4
    signatoryInfoGrid.CellAlignment = flexAlignLeftCenter
    signatoryInfoGrid.text = signatoryInfo.idType & "-" & signatoryInfo.idNo
    
End Sub

Public Sub formatNewSignatoryRequest()
    Dim mQry As String
    Dim tmpStr As String
 
    signatoryInfo.msgLen = Space(6) ' to be calculated
    signatoryInfo.service = "75"  ' 75 is for New signatory creation
    signatoryInfo.userId = gUserId

    If frmJuristicSignatory.tag = "A" Then
       If accTellerAction Then
          frmAcctPendingList.accPendingGrid.Col = 1
          signatoryInfo.dateTime = Format(frmAcctPendingList.accPendingGrid.text, "!@@@@@@@@@@@@@@")
          signatoryInfo.supervisorId = recvAccPendingDetail.supervisorId
          signatoryInfo.creationOrUpdate = "U"
       Else
          signatoryInfo.dateTime = gDateTime
          signatoryInfo.creationOrUpdate = "C"
          signatoryInfo.supervisorId = Space(10)
       End If
    ElseIf tellerAction Then
       frmSupervisorApproval.MSFlexGrid1.Col = 1
       signatoryInfo.dateTime = Format(frmSupervisorApproval.MSFlexGrid1.text, "00000000000000")
       signatoryInfo.supervisorId = Left(recvJuristicMsg.supervisorId, 10)
       signatoryInfo.creationOrUpdate = "U"
    Else
       signatoryInfo.dateTime = gDateTime
       signatoryInfo.creationOrUpdate = "C"
       signatoryInfo.supervisorId = Space(10)
    End If
    
    If frmJuristicSignatory.tag = "A" And accUpdateAction Or _
                            (accTellerAction And recvAccPendingDetail.newOrUpdate = "U") Then
       signatoryInfo.NewOrUpdateFlag = "U"
    Else
       signatoryInfo.NewOrUpdateFlag = "N"
    End If
    
    signatoryInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
    If frmJuristicSignatory.tag = "A" Then
       signatoryInfo.accNo = recvAccPendingDetail.accNo
    Else
       signatoryInfoGrid.Col = 0
       signatoryInfo.accNo = signatoryInfoGrid.text
    End If
    signatoryInfo.homeBranch = gBranchCode
    
    If screenSetNo = "3" Or screenSetNo = "4" Then
       signatoryInfo.custBranchCode = frmJuristicMain.cmbBranchCode
    ElseIf screenSetNo = "6" Then
       signatoryInfo.custBranchCode = frmJuristicNonResident.cmbBranchCode
    ElseIf screenSetNo = "5" Then
       signatoryInfo.custBranchCode = frmJuristicDiplomats.cmbBranchCode
    Else
       signatoryInfo.custBranchCode = Mid$(frmAccount.cmbBranchCode, 1, 4)
    End If
    
    If signatoryAddAction Then
       noOfSignatory = noOfSignatory + 1
       signatoryInfo.creationOrUpdate = "C"
       signatoryInfo.NewOrUpdateFlag = "N"
    ElseIf signatoryUpdateAction Then
       signatoryInfo.signatoryNo = recvSignatoryDetailMsg.signatoryNo
       'signatoryInfo.creationOrUpdate = "U"
       signatoryInfo.NewOrUpdateFlag = "U"
    End If

'    If Not tellerAction Then
'       noOfSignatory = noOfSignatory + 1
'    ElseIf signatoryAddAction Then
'       noOfSignatory = noOfSignatory + 1
'       signatoryInfo.creationOrUpdate = "C"
'    End If
    
    If Not signatoryUpdateAction Then
       signatoryInfo.signatoryNo = Format(noOfSignatory, "0000")
    End If
    
    signatoryInfo.idNo = Format(txtIdNo, "!@@@@@@@@@@@@@@@")
    signatoryInfo.idType = cmbIdType.text
    
    If optIdDateHijri Then
       signatoryInfo.idDateType = "0"
       signatoryInfo.idExpiryDateH = Format(txtIdExpiryYear, "0000") & Format(cmbIdExpiryMonth, "00") & Format(cmbIdExpiryDate, "00")
       signatoryInfo.idIssueDateH = Format(txtIdIssueYear, "0000") & Format(cmbIdIssueMonth.text, "00") & Format(cmbIdIssueDate, "00")
       signatoryInfo.idIssueDateG = Space(8)
       signatoryInfo.idExpiryDateG = Space(8)
    Else
       signatoryInfo.idDateType = "1"
       signatoryInfo.idExpiryDateG = Format(txtIdExpiryYear, "0000") & Format(cmbIdExpiryMonth, "00") & Format(cmbIdExpiryDate, "00")
       signatoryInfo.idIssueDateG = Format(txtIdIssueYear, "0000") & Format(cmbIdIssueMonth.text, "00") & Format(cmbIdIssueDate, "00")
       signatoryInfo.idIssueDateH = Space(8)
       signatoryInfo.idExpiryDateH = Space(8)
    End If
    
    signatoryInfo.idIssuedAt = cmbIdIssuedAt.text
    
    signatoryInfo.aFirstName = txtArabFirstName
    signatoryInfo.a2ndName = txtArabic2ndName
    signatoryInfo.a3rdName = txtArabic3rdName
    signatoryInfo.aLastName = txtArabLastName
    signatoryInfo.aShortName = txtArabShortName
    signatoryInfo.eFirstName = txtEngFirstName
    signatoryInfo.e2ndName = txtEnglish2ndName
    signatoryInfo.e3rdName = txtEnglish3rdName
    signatoryInfo.eLastName = txtEngLastName
    signatoryInfo.eShortName = txtEngShortName
    
    signatoryInfo.diplomaticPpNo = Format(txtDiplomaticPpNo, "!@@@@@@@@@@@@@@@")
    If optSignEnableYes = True Then
       signatoryInfo.activeStatus = "1"
    Else
       signatoryInfo.activeStatus = "0"
    End If
    signatoryInfo.disableReason = cmbDisableReason

End Sub

Public Sub fetchSignatoryInfo(accNo As String, signatoryNo As String)
    Dim strmsglen As String, tCode As String, tuserId As String, tDateTime As String, tBranchCode As String
    Dim recType As String * 2
   
    If frmJuristicSignatory.tag = "A" Then  ' if entered into signatory form through account form
       If accSearchAction Then
          recType = "02" ' get the information from stsigntab
          tuserId = Space(10)
          tDateTime = Space(14)
          tBranchCode = gBranchCode
       Else
          recType = "01" 'get the information from stsignlog
          tuserId = signatoryKeyUserId
          tBranchCode = signatoryKeyBranch
          tDateTime = signatoryKeyDateTime
       End If
    ElseIf searchAction Then
       recType = "02"
       tuserId = Space(10)
       tDateTime = Space(14)
       tBranchCode = gBranchCode
    Else
       recType = "01"
       tuserId = signatoryKeyUserId
       tBranchCode = signatoryKeyBranch
       tDateTime = signatoryKeyDateTime
    End If
'    ElseIf custHistoryAction Then
'       recType = "01"
'       frmCustUpdateHistory.custHistoryGrid.Col = 0
'       tBranchCode = Format(frmCustUpdateHistory.custHistoryGrid.Text, "0000")
'       frmCustUpdateHistory.custHistoryGrid.Col = 1
'       tUserId = Format(frmCustUpdateHistory.custHistoryGrid.Text, "!@@@@@@@@@@")
'       frmCustUpdateHistory.custHistoryGrid.Col = 2
'       tmpStr = frmCustUpdateHistory.custHistoryGrid.Text
'       tDateTime = Mid$(tmpStr, 7, 4) & Mid$(tmpStr, 4, 2) & Mid$(tmpStr, 1, 2) & _
'                   Mid$(tmpStr, 12, 2) & Mid$(tmpStr, 15, 2) & Mid$(tmpStr, 18, 2)
'       tDateTime = Format(tDateTime, "00000000000000")
'    Else
'        recType = "01"
'        frmSupervisorApproval.MSFlexGrid1.Col = 0
'        tUserId = Format(frmSupervisorApproval.MSFlexGrid1.Text, "!@@@@@@@@@@")
'        frmSupervisorApproval.MSFlexGrid1.Col = 1
'        tDateTime = Format(frmSupervisorApproval.MSFlexGrid1.Text, "00000000000000")
'        tBranchCode = gBranchCode
'    End If
        
    SendMsg = "000057" & "77" & gBranchCode & recType & tBranchCode & tuserId & tDateTime & accNo & signatoryNo
    frmJuristicSignatory.MousePointer = vbHourglass
    frmJuristicSignatory.cmdCancel.Enabled = False
    'frmJuristicSignatory.cmdAdd.Enabled = False
    'frmJuristicSignatory.cmdUpdate.Enabled = False
    CSD_mdiForm.staticStatus.Panels(3).text = errLoadingForm(UserLang)
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmJuristicSignatory.MousePointer = vbDefault
       frmJuristicSignatory.cmdCancel.Enabled = True
       Exit Sub
    End If
    frmJuristicSignatory.MousePointer = vbDefault
    frmJuristicSignatory.cmdCancel.Enabled = True
    parseSignatoryDetailResponse
    If recvSignatoryDetailMsg.status = "000" Then
       tCode = recvSignatoryDetailMsg.idType
       If tCode <> "" Then
          For i = 0 To frmJuristicSignatory.cmbIdType.ListCount
              If Mid(frmJuristicSignatory.cmbIdType.List(i), 1, 1) = tCode Then
                 frmJuristicSignatory.cmbIdType.ListIndex = i
                 Exit For
              End If
          Next i
        Else
          frmJuristicSignatory.cmbIdType.ListIndex = -1
        End If
        If i > frmJuristicSignatory.cmbIdType.ListCount Then
          frmJuristicSignatory.cmbIdType.ListIndex = -1
'          frmCustomer3.cmbIdType.AddItem tCode & "-Not defined in local"
'          frmCustomer3.cmbIdType.ListIndex = frmCustomer3.cmbIdType.ListCount - 1
        End If
       
       frmJuristicSignatory.txtIdNo = recvSignatoryDetailMsg.idNo
       frmJuristicSignatory.cmbIdIssuedAt.text = recvSignatoryDetailMsg.idIssuedAt
       
       If recvSignatoryDetailMsg.idDateType = "0" Or _
          recvSignatoryDetailMsg.idDateType = " " Then
          frmJuristicSignatory.optIdDateHijri.Value = True
          frmJuristicSignatory.cmbIdIssueDate.text = _
                  Right$(recvSignatoryDetailMsg.idIssueDateH, 2)
          frmJuristicSignatory.cmbIdIssueMonth.text = _
                  Mid$(recvSignatoryDetailMsg.idIssueDateH, 5, 2)
          frmJuristicSignatory.txtIdIssueYear = Mid$(recvSignatoryDetailMsg.idIssueDateH, 1, 4)
          frmJuristicSignatory.cmbIdExpiryDate.text = _
                  Right$(recvSignatoryDetailMsg.idExpiryDateH, 2)
          frmJuristicSignatory.cmbIdExpiryMonth.text = _
                  Mid$(recvSignatoryDetailMsg.idExpiryDateH, 5, 2)
          frmJuristicSignatory.txtIdExpiryYear = Mid$(recvSignatoryDetailMsg.idExpiryDateH, 1, 4)
       Else
          frmJuristicSignatory.optIdDateGreg.Value = True
          frmJuristicSignatory.cmbIdIssueDate.text = _
                  Right$(recvSignatoryDetailMsg.idIssueDateG, 2)
          frmJuristicSignatory.cmbIdIssueMonth.text = _
                  Mid$(recvSignatoryDetailMsg.idIssueDateG, 5, 2)
          frmJuristicSignatory.txtIdIssueYear = Mid$(recvSignatoryDetailMsg.idIssueDateG, 1, 4)
          frmJuristicSignatory.cmbIdExpiryDate.text = _
                  Right$(recvSignatoryDetailMsg.idExpiryDateG, 2)
          frmJuristicSignatory.cmbIdExpiryMonth.text = _
                  Mid$(recvSignatoryDetailMsg.idExpiryDateG, 5, 2)
          frmJuristicSignatory.txtIdExpiryYear = Mid$(recvSignatoryDetailMsg.idExpiryDateG, 1, 4)
       End If
         
       frmJuristicSignatory.txtArabFirstName = _
             recvSignatoryDetailMsg.aFirstName
       frmJuristicSignatory.txtArabic2ndName = _
             recvSignatoryDetailMsg.a2ndName
       frmJuristicSignatory.txtArabic3rdName = _
             recvSignatoryDetailMsg.a3rdName
       frmJuristicSignatory.txtArabLastName = _
             recvSignatoryDetailMsg.aLastName
       frmJuristicSignatory.txtArabShortName = _
             recvSignatoryDetailMsg.aShortName
         
       frmJuristicSignatory.txtEngFirstName = _
             recvSignatoryDetailMsg.eFirstName
       frmJuristicSignatory.txtEnglish2ndName = _
             recvSignatoryDetailMsg.e2ndName
       frmJuristicSignatory.txtEnglish3rdName = _
             recvSignatoryDetailMsg.e3rdName
       frmJuristicSignatory.txtEngLastName = _
             recvSignatoryDetailMsg.eLastName
       frmJuristicSignatory.txtEngShortName = _
             recvSignatoryDetailMsg.eShortName
       
       frmJuristicSignatory.txtDiplomaticPpNo = recvSignatoryDetailMsg.diplomaticPpNo
       If recvSignatoryDetailMsg.activeStatus = "1" Then
          frmJuristicSignatory.optSignEnableYes.Value = True
       Else
          frmJuristicSignatory.optSignEnableNo.Value = True
       End If
       frmJuristicSignatory.cmbDisableReason = recvSignatoryDetailMsg.disableReason
       If frmJuristicSignatory.tag = "A" Then
          If Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
             cmdUpdate.Enabled = True
          End If
       ElseIf Not supervisorAction And Not searchAction And Not custHistoryAction Then
          cmdUpdate.Enabled = True ' added by rajesh on 9 dec 03 to avoid duplicates
                                   ' during supervisor approval
       End If
       If cmdUpdate.Enabled = True Then
          If optSignEnableYes.Value = True Then
             cmbDisableReason.Enabled = False
          Else
             cmbDisableReason.Enabled = True
          End If
       End If
    Else
         If UserLang = ARABIC Then
            MsgBox recvSignatoryDetailMsg.aRemarks
         Else
            MsgBox recvSignatoryDetailMsg.eRemarks
         End If
         CSD_mdiForm.staticStatus.Panels(3).text = "  "
         Exit Sub
    End If  ' recvsignatoryDetailmsg.status = "000"
    
    CSD_mdiForm.staticStatus.Panels(3).text = "   "

End Sub
Public Sub parseSignatoryResponse()
    Dim pos As Integer
    pos = 1
        
    recvSignatoryMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSignatoryMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSignatoryMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSignatoryMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSignatoryMsg.duplicateAccNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14

End Sub
Public Sub parseSignatoryDetailResponse()
    Dim pos As Integer
    
    pos = 1
    
    recvSignatoryDetailMsg.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvSignatoryDetailMsg.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvSignatoryDetailMsg.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSignatoryDetailMsg.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvSignatoryDetailMsg.accNo = Mid$(RecvStr, pos, 14)
    pos = pos + 14
    recvSignatoryDetailMsg.signatoryNo = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvSignatoryDetailMsg.newOrUpdate = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSignatoryDetailMsg.supervisorId = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvSignatoryDetailMsg.custBranchCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvSignatoryDetailMsg.idType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSignatoryDetailMsg.idNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.idIssuedAt = RTrim(Mid$(RecvStr, pos, 20))
    pos = pos + 20
    recvSignatoryDetailMsg.idDateType = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvSignatoryDetailMsg.idIssueDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSignatoryDetailMsg.idIssueDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSignatoryDetailMsg.idExpiryDateH = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSignatoryDetailMsg.idExpiryDateG = RTrim(Mid$(RecvStr, pos, 8))
    pos = pos + 8
    recvSignatoryDetailMsg.aFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.a2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.a3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.aLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.aShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSignatoryDetailMsg.eFirstName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.e2ndName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.e3rdName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.eLastName = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.eShortName = RTrim(Mid$(RecvStr, pos, 30))
    pos = pos + 30
    recvSignatoryDetailMsg.diplomaticPpNo = RTrim(Mid$(RecvStr, pos, 15))
    pos = pos + 15
    recvSignatoryDetailMsg.disableReason = RTrim(Mid$(RecvStr, pos, 25))
    pos = pos + 25
    recvSignatoryDetailMsg.activeStatus = Mid$(RecvStr, pos, 1)
    pos = pos + 1
End Sub

Private Sub txtIdExpiryYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIdExpiryYear)) <> 0 Then
        If Len(txtIdExpiryYear) = 4 Then
           txtParentCompanyName.SetFocus
        End If
     End If
     On Error GoTo 0
  ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIdExpiryYear)) <> 0 Then
        If Len(txtIdExpiryYear) = 4 Then
           txtParentCompanyName.SetFocus
        End If
     End If
     On Error GoTo 0
  End If

End Sub

Private Sub txtIdExpiryYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtIdExpiryYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbIdExpiryDate)) > 0 And Len(RTrim(cmbIdExpiryMonth)) > 0 Then
          If Len(RTrim(txtIdExpiryYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtIdExpiryYear.text = ""
             txtIdExpiryYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtIdExpiryYear)) <> 0 Then
          If optIdDateHijri.Value = True Then
             If txtIdExpiryYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdExpiryYear.Enabled = True Then
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                Else
                   txtIdExpiryYear.Enabled = True
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                End If
             End If
          Else
             If txtIdExpiryYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdExpiryYear.Enabled = True Then
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                Else
                   txtIdExpiryYear.Enabled = True
                   txtIdExpiryYear.text = ""
                   txtIdExpiryYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtIdIssueYear_Change()
  If Not supervisorAction And Not searchAction And Not custHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIdIssueYear)) <> 0 Then
        If Len(txtIdIssueYear) = 4 Then
           cmbIdExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  ElseIf frmJuristicSignatory.tag = "A" And Not accSupervisorAction And Not accSearchAction And Not accHistoryAction Then
     On Error Resume Next
     If Len(RTrim(txtIdIssueYear)) <> 0 Then
        If Len(txtIdIssueYear) = 4 Then
           cmbIdExpiryDate.SetFocus
        End If
     End If
     On Error GoTo 0
  End If
End Sub

Private Sub txtIdIssueYear_KeyPress(KeyAscii As Integer)
  If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtIdIssueYear_LostFocus()
If Not supervisorAction And Not searchAction And Not custHistoryAction Then
    If Screen.ActiveControl.Name = "cmdCancel" Then
       DoEvents
    Else
       If Len(RTrim(cmbIdIssueDate)) > 0 And Len(RTrim(cmbIdIssueMonth)) > 0 Then
          If Len(RTrim(txtIdIssueYear)) <> 4 Then
             MsgBox errEnterValidYear(UserLang)
             txtIdIssueYear.text = ""
             txtIdIssueYear.SetFocus
             Exit Sub
          End If
       End If
       On Error Resume Next
       If Len(RTrim(txtIdIssueYear)) <> 0 Then
          If optIdDateHijri.Value = True Then
             If txtIdIssueYear > 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdIssueYear.Enabled = True Then
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                Else
                   txtIdIssueYear.Enabled = True
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                End If
             End If
          Else
             If txtIdIssueYear < 1600 Then
                MsgBox errEnterValidYear(UserLang) '"Enter a valid Year"
                If txtIdIssueYear.Enabled = True Then
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                Else
                   txtIdIssueYear.Enabled = True
                   txtIdIssueYear.text = ""
                   txtIdIssueYear.SetFocus
                End If
             End If
          End If
       End If
    End If
    On Error GoTo 0
 End If

End Sub

Private Sub txtIdNo_KeyPress(KeyAscii As Integer)
  If Mid$(cmbIdType, 1, 1) = "I" Or _
     Mid$(cmbIdType, 1, 1) = "Q" Then
     If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
         KeyAscii = 0
         MsgBox (errOnlyNumeralsAllowed(UserLang))
         Exit Sub
     End If
  End If
End Sub

Private Sub txtIdNo_LostFocus()
'  If Screen.ActiveControl.Name = "cmdCancel" Then
'       DoEvents
'  Else
'    On Error Resume Next
'    If Mid$(cmbIdType, 1, 1) = "I" Or _
'       Mid$(cmbIdType, 1, 1) = "Q" Then
'       If Len(Trim(txtIdNo)) <> 10 Then
'          MsgBox errInvalidId(UserLang)
'          txtIdNo.SetFocus
'          Exit Sub
'       End If
'    End If
'    On Error GoTo 0
'  End If
End Sub
