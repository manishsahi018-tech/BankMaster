VERSION 5.00
Begin VB.Form frmPenCashPayment 
   BackColor       =   &H00BFD87E&
   Caption         =   "Cash payment form for pensioners"
   ClientHeight    =   8370
   ClientLeft      =   525
   ClientTop       =   885
   ClientWidth     =   11550
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8370
   ScaleWidth      =   11550
   Begin VB.Frame frameMessage 
      BackColor       =   &H00BFD87E&
      Caption         =   "Messages"
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
      Height          =   2415
      Left            =   960
      TabIndex        =   18
      Top             =   4560
      Width           =   9855
      Begin VB.TextBox txtMessage4 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   22
         Tag             =   "9855"
         Top             =   1920
         Width           =   4455
      End
      Begin VB.TextBox txtMessage3 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   21
         Tag             =   "9855"
         Top             =   1440
         Width           =   4455
      End
      Begin VB.TextBox txtMessage2 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   20
         Tag             =   "9855"
         Top             =   960
         Width           =   4455
      End
      Begin VB.TextBox txtMessage1 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   19
         Tag             =   "9855"
         Top             =   480
         Width           =   4455
      End
      Begin VB.Label lblMsg4 
         BackColor       =   &H00BFD87E&
         Caption         =   "Message-4"
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
         Left            =   240
         TabIndex        =   26
         Tag             =   "9855"
         Top             =   1920
         Width           =   1695
      End
      Begin VB.Label lblMsg1 
         BackColor       =   &H00BFD87E&
         Caption         =   "Message-1"
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
         Left            =   240
         TabIndex        =   25
         Tag             =   "9855"
         Top             =   480
         Width           =   1575
      End
      Begin VB.Label lblMsg3 
         BackColor       =   &H00BFD87E&
         Caption         =   "Message-3"
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
         Left            =   240
         TabIndex        =   24
         Tag             =   "9855"
         Top             =   1440
         Width           =   1575
      End
      Begin VB.Label lblMsg2 
         BackColor       =   &H00BFD87E&
         Caption         =   "Message-2"
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
         Left            =   240
         TabIndex        =   23
         Tag             =   "9855"
         Top             =   960
         Width           =   1575
      End
   End
   Begin VB.Frame framePaymentDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Payment Details"
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
      Height          =   1455
      Left            =   960
      TabIndex        =   8
      Top             =   3000
      Width           =   9855
      Begin VB.TextBox txtPaymentStatus 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         MaxLength       =   9
         TabIndex        =   12
         Tag             =   "9855"
         Top             =   840
         Width           =   615
      End
      Begin VB.TextBox txtNetAmt 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8040
         TabIndex        =   11
         Tag             =   "9855"
         Top             =   360
         Width           =   1695
      End
      Begin VB.TextBox txtTotAmt 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         TabIndex        =   10
         Tag             =   "9855"
         Top             =   360
         Width           =   1455
      End
      Begin VB.TextBox txtDeduction 
         Enabled         =   0   'False
         Height          =   285
         Left            =   5040
         TabIndex        =   9
         Tag             =   "9855"
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label lblPaymentStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment Status"
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
         Left            =   120
         TabIndex        =   16
         Tag             =   "9855"
         Top             =   840
         Width           =   1815
      End
      Begin VB.Label lblNetAmount 
         BackColor       =   &H00BFD87E&
         Caption         =   "Net Amount"
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
         Left            =   6720
         TabIndex        =   15
         Tag             =   "9855"
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label lblTotAmt 
         BackColor       =   &H00BFD87E&
         Caption         =   "Total Amt "
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
         Left            =   120
         TabIndex        =   14
         Tag             =   "9855"
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label lblDeduction 
         BackColor       =   &H00BFD87E&
         Caption         =   "Deduction"
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
         Left            =   3840
         TabIndex        =   13
         Tag             =   "9855"
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame framePensionerDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pensioner Details"
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
      Height          =   1935
      Left            =   960
      TabIndex        =   1
      Top             =   840
      Width           =   9855
      Begin VB.TextBox txtPenProxyName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         TabIndex        =   7
         Tag             =   "9855"
         Top             =   1410
         Width           =   3015
      End
      Begin VB.TextBox txtPensionName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         TabIndex        =   3
         Tag             =   "9855"
         Top             =   840
         Width           =   3015
      End
      Begin VB.TextBox txtPenCardNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2280
         MaxLength       =   9
         TabIndex        =   2
         Tag             =   "9855"
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label lblPensionOrProxy 
         BackColor       =   &H00BFD87E&
         Caption         =   "Pensioner / Proxy "
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
         Left            =   240
         TabIndex        =   6
         Tag             =   "9855"
         Top             =   1440
         Width           =   2055
      End
      Begin VB.Label lblName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Name"
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
         Left            =   240
         TabIndex        =   5
         Tag             =   "9855"
         Top             =   840
         Width           =   1335
      End
      Begin VB.Label lblPenCardNo 
         BackColor       =   &H00BFD87E&
         Caption         =   " Pen Card No"
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
         Left            =   120
         TabIndex        =   4
         Tag             =   "9855"
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Return to Pension menu"
      Height          =   375
      Left            =   4800
      TabIndex        =   0
      ToolTipText     =   "Return to Pension menu"
      Top             =   7680
      Width           =   2415
   End
   Begin VB.Label lblCashPayment 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pension Cash Payment Enquiry"
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
      Left            =   3120
      TabIndex        =   17
      Top             =   240
      Width           =   4815
   End
End
Attribute VB_Name = "frmPenCashPayment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub Form_Load()
    
    
    If UserLang = ARABIC Then
       ChangePositions frmPenCashPayment, 11800
       frmPenCashPayment.RightToLeft = True
       frmPenCashPayment.frameMessage.RightToLeft = True
       frmPenCashPayment.framePaymentDetails.RightToLeft = True
       frmPenCashPayment.framePensionerDetails.RightToLeft = True
    End If
    
    frmPenCashPayment.Caption = frmPenCashPaymentCaption(0, UserLang)
    frmPenCashPayment.lblCashPayment = frmPenCashPaymentCaption(1, UserLang)
    frmPenCashPayment.framePensionerDetails.Caption = frmPenCashPaymentCaption(2, UserLang)
    frmPenCashPayment.lblPenCardNo.Caption = frmPenCashPaymentCaption(3, UserLang)
    frmPenCashPayment.lblName.Caption = frmPenCashPaymentCaption(4, UserLang)
    frmPenCashPayment.lblPensionOrProxy.Caption = frmPenCashPaymentCaption(5, UserLang)
    frmPenCashPayment.framePaymentDetails.Caption = frmPenCashPaymentCaption(6, UserLang)
    frmPenCashPayment.lblTotAmt.Caption = frmPenCashPaymentCaption(7, UserLang)
    frmPenCashPayment.lblDeduction.Caption = frmPenCashPaymentCaption(8, UserLang)
    frmPenCashPayment.lblNetAmount.Caption = frmPenCashPaymentCaption(9, UserLang)
    frmPenCashPayment.lblPaymentStatus.Caption = frmPenCashPaymentCaption(10, UserLang)
    frmPenCashPayment.frameMessage.Caption = frmPenCashPaymentCaption(11, UserLang)
    frmPenCashPayment.lblMsg1.Caption = frmPenCashPaymentCaption(12, UserLang)
    frmPenCashPayment.lblMsg2.Caption = frmPenCashPaymentCaption(13, UserLang)
    frmPenCashPayment.lblMsg3.Caption = frmPenCashPaymentCaption(14, UserLang)
    frmPenCashPayment.lblMsg4.Caption = frmPenCashPaymentCaption(15, UserLang)
    frmPenCashPayment.cmdExit.Caption = frmPenCashPaymentCaption(16, UserLang)
    frmPenCashPayment.Show
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub frameMessage_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub framePaymentDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub framePensionerDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub
