VERSION 5.00
Begin VB.Form frmPensionDetail 
   BackColor       =   &H00BFD87E&
   Caption         =   "Pension Enquiry Form"
   ClientHeight    =   7305
   ClientLeft      =   660
   ClientTop       =   375
   ClientWidth     =   10980
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7305
   ScaleWidth      =   10980
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdCashPay 
      Caption         =   "Cash payment enquiry"
      Height          =   495
      Left            =   3720
      TabIndex        =   77
      ToolTipText     =   "Cash Payment Enquiry"
      Top             =   7920
      Width           =   1215
   End
   Begin VB.CommandButton cmdInh 
      Caption         =   "Inheritance"
      Height          =   495
      Left            =   4920
      TabIndex        =   76
      ToolTipText     =   "Inheritance"
      Top             =   7920
      Width           =   1815
   End
   Begin VB.TextBox txtSubCard 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   9600
      MaxLength       =   4
      TabIndex        =   75
      Tag             =   "11775"
      Top             =   4440
      Width           =   615
   End
   Begin VB.TextBox txtNotes15 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7320
      MaxLength       =   50
      TabIndex        =   72
      Top             =   7080
      Width           =   4455
   End
   Begin VB.TextBox txtNotes14 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7320
      MaxLength       =   50
      TabIndex        =   70
      Top             =   6720
      Width           =   4455
   End
   Begin VB.TextBox txtNotes13 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7320
      MaxLength       =   50
      TabIndex        =   68
      Top             =   6360
      Width           =   4455
   End
   Begin VB.TextBox txtNotes12 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7320
      MaxLength       =   50
      TabIndex        =   66
      Top             =   6000
      Width           =   4455
   End
   Begin VB.TextBox txtNotes11 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7320
      MaxLength       =   50
      TabIndex        =   64
      Top             =   5640
      Width           =   4455
   End
   Begin VB.TextBox txtNotes10 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7320
      MaxLength       =   50
      TabIndex        =   62
      Top             =   5280
      Width           =   4455
   End
   Begin VB.TextBox txtNotes9 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7320
      MaxLength       =   50
      TabIndex        =   60
      Top             =   4920
      Width           =   4455
   End
   Begin VB.TextBox txtNotes8 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      MaxLength       =   50
      TabIndex        =   58
      Top             =   7440
      Width           =   4455
   End
   Begin VB.TextBox txtNotes7 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      MaxLength       =   50
      TabIndex        =   56
      Top             =   7080
      Width           =   4455
   End
   Begin VB.TextBox txtNotes6 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      MaxLength       =   50
      TabIndex        =   55
      Top             =   6720
      Width           =   4455
   End
   Begin VB.TextBox txtNotes5 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      MaxLength       =   50
      TabIndex        =   53
      Top             =   6360
      Width           =   4455
   End
   Begin VB.TextBox txtNotes4 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      MaxLength       =   50
      TabIndex        =   51
      Top             =   6000
      Width           =   4455
   End
   Begin VB.TextBox txtNotes3 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      MaxLength       =   50
      TabIndex        =   49
      Top             =   5640
      Width           =   4455
   End
   Begin VB.TextBox txtNotes2 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      MaxLength       =   50
      TabIndex        =   48
      Top             =   5280
      Width           =   4455
   End
   Begin VB.TextBox txtNotes1 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1560
      MaxLength       =   50
      TabIndex        =   47
      Top             =   4920
      Width           =   4455
   End
   Begin VB.TextBox txtCardPosNo 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   2400
      MaxLength       =   4
      TabIndex        =   43
      Tag             =   "11775"
      Top             =   3960
      Width           =   615
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   6720
      TabIndex        =   40
      ToolTipText     =   "Exit"
      Top             =   7920
      Width           =   1455
   End
   Begin VB.TextBox txtPenAccNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1920
      TabIndex        =   39
      Top             =   1320
      Width           =   1695
   End
   Begin VB.TextBox txtPaymentType 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6480
      MaxLength       =   9
      TabIndex        =   37
      Top             =   4440
      Width           =   1455
   End
   Begin VB.TextBox txtCardStatus 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2400
      MaxLength       =   9
      TabIndex        =   35
      Top             =   4320
      Width           =   1455
   End
   Begin VB.TextBox txtCardType 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5400
      MaxLength       =   9
      TabIndex        =   33
      Top             =   3960
      Width           =   1455
   End
   Begin VB.ComboBox cmbIssuedate 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   8400
      TabIndex        =   31
      Tag             =   "11775"
      Text            =   "01"
      Top             =   3600
      Width           =   615
   End
   Begin VB.ComboBox cmbIssueMonth 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   315
      Left            =   9000
      TabIndex        =   30
      Tag             =   "11775"
      Text            =   "01"
      Top             =   3600
      Width           =   615
   End
   Begin VB.TextBox txtIssueYear 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   285
      Left            =   9600
      MaxLength       =   4
      TabIndex        =   29
      Tag             =   "11775"
      Top             =   3600
      Width           =   615
   End
   Begin VB.TextBox txtExportNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5400
      MaxLength       =   9
      TabIndex        =   27
      Top             =   3600
      Width           =   1455
   End
   Begin VB.TextBox txtBeneficiary 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2400
      TabIndex        =   25
      Top             =   3600
      Width           =   1095
   End
   Begin VB.TextBox txtNetAmt 
      Enabled         =   0   'False
      Height          =   285
      Left            =   8400
      MaxLength       =   9
      TabIndex        =   23
      Top             =   3240
      Width           =   1455
   End
   Begin VB.TextBox txtDedn 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5400
      MaxLength       =   9
      TabIndex        =   21
      Top             =   3240
      Width           =   1455
   End
   Begin VB.TextBox txtPenSalAmt 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2400
      MaxLength       =   9
      TabIndex        =   19
      Top             =   3240
      Width           =   1455
   End
   Begin VB.TextBox txtProxyHafIssSrc 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2640
      TabIndex        =   17
      Top             =   2760
      Width           =   1815
   End
   Begin VB.TextBox txtProxyHafNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   7080
      MaxLength       =   10
      TabIndex        =   15
      Top             =   2280
      Width           =   1815
   End
   Begin VB.TextBox txtProxyName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2160
      MaxLength       =   30
      TabIndex        =   13
      Top             =   2280
      Width           =   2775
   End
   Begin VB.TextBox txtSaudiIdNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   6120
      TabIndex        =   11
      Top             =   1800
      Width           =   1815
   End
   Begin VB.TextBox txtIssuanceSource 
      Enabled         =   0   'False
      Height          =   285
      Left            =   2160
      TabIndex        =   9
      Top             =   1800
      Width           =   1815
   End
   Begin VB.TextBox txtHafIssSrc 
      Enabled         =   0   'False
      Height          =   285
      Left            =   9600
      TabIndex        =   7
      Top             =   1320
      Width           =   735
   End
   Begin VB.TextBox txtHfzNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5520
      TabIndex        =   5
      Top             =   1320
      Width           =   1815
   End
   Begin VB.TextBox txtPensionName 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5520
      TabIndex        =   3
      Top             =   840
      Width           =   3015
   End
   Begin VB.TextBox txtPenCardNo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   1920
      MaxLength       =   9
      TabIndex        =   1
      Top             =   840
      Width           =   1455
   End
   Begin VB.Label lblSubCard 
      BackColor       =   &H00BFD87E&
      Caption         =   "Sub Card"
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
      Left            =   8160
      TabIndex        =   74
      Top             =   4440
      Width           =   1215
   End
   Begin VB.Label lblNotes15 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-15"
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
      Left            =   6120
      TabIndex        =   73
      Top             =   7080
      Width           =   1215
   End
   Begin VB.Label lblNotes14 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-14"
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
      Left            =   6120
      TabIndex        =   71
      Top             =   6720
      Width           =   1215
   End
   Begin VB.Label lblNotes13 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-13"
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
      Left            =   6120
      TabIndex        =   69
      Top             =   6360
      Width           =   1215
   End
   Begin VB.Label lblNotes12 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-12"
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
      Left            =   6120
      TabIndex        =   67
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Label lblNotes11 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-11"
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
      Left            =   6120
      TabIndex        =   65
      Top             =   5640
      Width           =   1215
   End
   Begin VB.Label lblNotes10 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-10"
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
      Left            =   6120
      TabIndex        =   63
      Top             =   5280
      Width           =   1215
   End
   Begin VB.Label lblNotes9 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-9"
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
      Left            =   6120
      TabIndex        =   61
      Top             =   4920
      Width           =   1215
   End
   Begin VB.Label lblNotes8 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-8"
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
      TabIndex        =   59
      Top             =   7440
      Width           =   1335
   End
   Begin VB.Label lblNotes7 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-7"
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
      TabIndex        =   57
      Top             =   7080
      Width           =   1335
   End
   Begin VB.Label lblNotes6 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-6"
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
      TabIndex        =   54
      Top             =   6720
      Width           =   1335
   End
   Begin VB.Label lblNotes5 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-5"
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
      TabIndex        =   52
      Top             =   6360
      Width           =   1215
   End
   Begin VB.Label lblNotes4 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-4"
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
      TabIndex        =   50
      Top             =   6000
      Width           =   1335
   End
   Begin VB.Line Line2 
      X1              =   0
      X2              =   11880
      Y1              =   4800
      Y2              =   4800
   End
   Begin VB.Label lblNotes1 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-1"
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
      TabIndex        =   46
      Top             =   4920
      Width           =   1335
   End
   Begin VB.Label lblNotes3 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-3"
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
      TabIndex        =   45
      Top             =   5640
      Width           =   1215
   End
   Begin VB.Label lblNotes2 
      BackColor       =   &H00BFD87E&
      Caption         =   "Notes-2"
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
      TabIndex        =   44
      Top             =   5280
      Width           =   1335
   End
   Begin VB.Label lblCardPosNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Position No"
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
      TabIndex        =   42
      Top             =   3960
      Width           =   2055
   End
   Begin VB.Label lblPensionDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Pension Details"
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
      Left            =   3840
      TabIndex        =   41
      Top             =   120
      Width           =   3855
   End
   Begin VB.Label lblPenAccNo 
      BackColor       =   &H00BFD87E&
      Caption         =   " Pen Acc No"
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
      TabIndex        =   38
      Top             =   1320
      Width           =   1575
   End
   Begin VB.Label lblPaymentType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Payment Type"
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
      Left            =   4320
      TabIndex        =   36
      Top             =   4440
      Width           =   1695
   End
   Begin VB.Label lblCardStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Status"
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
      TabIndex        =   34
      Top             =   4320
      Width           =   1815
   End
   Begin VB.Label lblCardType 
      BackColor       =   &H00BFD87E&
      Caption         =   "Card Type"
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
      Left            =   3720
      TabIndex        =   32
      Top             =   3960
      Width           =   1215
   End
   Begin VB.Label lblIssueDate 
      BackColor       =   &H00BFD87E&
      Caption         =   " Issue Date"
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
      Left            =   6960
      TabIndex        =   28
      Top             =   3600
      Width           =   1335
   End
   Begin VB.Label lblExportNo 
      BackColor       =   &H00BFD87E&
      Caption         =   "Export Number"
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
      Left            =   3720
      TabIndex        =   26
      Top             =   3600
      Width           =   1695
   End
   Begin VB.Label lblBeneficiary 
      BackColor       =   &H00BFD87E&
      Caption         =   " Beneficiary "
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
      TabIndex        =   24
      Top             =   3600
      Width           =   2055
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
      Left            =   6960
      TabIndex        =   22
      Top             =   3240
      Width           =   1335
   End
   Begin VB.Label lblDedn 
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
      Left            =   3960
      TabIndex        =   20
      Top             =   3240
      Width           =   1335
   End
   Begin VB.Label lblPenSalAmt 
      BackColor       =   &H00BFD87E&
      Caption         =   " Pension Salary Amt"
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
      TabIndex        =   18
      Top             =   3240
      Width           =   2175
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   11880
      Y1              =   3120
      Y2              =   3120
   End
   Begin VB.Label lblProxyHafIssSrc 
      BackColor       =   &H00BFD87E&
      Caption         =   " Proxy Haf Iss.Src"
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
      Top             =   2760
      Width           =   2295
   End
   Begin VB.Label lblProxyHafNo 
      BackColor       =   &H00BFD87E&
      Caption         =   " Proxy Hafiza No"
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
      Left            =   5040
      TabIndex        =   14
      Top             =   2280
      Width           =   1815
   End
   Begin VB.Label lblProxyName 
      BackColor       =   &H00BFD87E&
      Caption         =   " Proxy Name"
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
      TabIndex        =   12
      Top             =   2280
      Width           =   1815
   End
   Begin VB.Label lblSaudiIdNo 
      BackColor       =   &H00BFD87E&
      Caption         =   " Saudi Id No."
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
      Left            =   4200
      TabIndex        =   10
      Top             =   1800
      Width           =   1815
   End
   Begin VB.Label lblIssSource 
      BackColor       =   &H00BFD87E&
      Caption         =   " Issuance Source Code"
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
      TabIndex        =   8
      Top             =   1800
      Width           =   1935
   End
   Begin VB.Label lblHafIssSource 
      BackColor       =   &H00BFD87E&
      Caption         =   " Haf. Issue Source"
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
      Left            =   7560
      TabIndex        =   6
      Top             =   1320
      Width           =   1935
   End
   Begin VB.Label lblHfzNo 
      BackColor       =   &H00BFD87E&
      Caption         =   " Pen Hafiza No"
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
      Left            =   3720
      TabIndex        =   4
      Top             =   1320
      Width           =   1695
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
      Left            =   3840
      TabIndex        =   2
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
      TabIndex        =   0
      Top             =   840
      Width           =   1695
   End
End
Attribute VB_Name = "frmPensionDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCashPay_Click()
    Dim tCardNo As String
    Dim tuserId As String
    
    tCardNo = Format(txtPenCardNo, "!@@@@@@@@@@")
    
    If Len(RTrim(tCardNo)) = 0 Then
       MsgBox errInvalidCardNo(UserLang)
       Exit Sub
    End If
    
    tuserId = Format(gUserId, "!@@@@@@@@@@")
    
    SendMsg = "000048" + "61" + gBranchCode + tuserId + tCardNo
        
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmPensionDetail.MousePointer = vbHourglass
    
    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpclient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmPensionDetail.MousePointer = vbDefault
       Exit Sub
    End If
    frmPensionDetail.MousePointer = vbDefault
    
    frmPensionEnquiry.parsePenCashDetail

    If recvPenCashDetail.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvPenCashDetail.aRemarks
       Else
          MsgBox recvPenCashDetail.eRemarks
       End If
       Exit Sub
    End If
    frmPenCashPayment.Show
    frmPensionEnquiry.fillCashPaymentForm
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdInh_Click()
    Dim tCardNo As String
    Dim tuserId As String

    tCardNo = Format(frmPensionDetail.txtPenCardNo, "!@@@@@@@@@")
    
    If Len(RTrim(tCardNo)) = 0 Then
       MsgBox errInvalidCardNo(UserLang)
       Exit Sub
    End If

    tuserId = Format(gUserId, "!@@@@@@@@@@")

    SendMsg = "000048" + "66" + gBranchCode + tuserId + tCardNo

    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmPensionDetail.MousePointer = vbHourglass

    ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpclient, frmEnquiry.Timer1)
    If ReturnStatus = LocalCommsError Then
       LoadError = True
       frmPensionDetail.MousePointer = vbDefault
       Exit Sub
    End If
    frmPensionDetail.MousePointer = vbDefault

    parsePenInhDetail

    If recvPensionInh.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvPensionInh.aRemarks
       Else
          MsgBox recvPensionInh.eRemarks
       End If
       Exit Sub
    End If
    frmPensionInheritance.Show
    fillPenInhForm

    
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub

Private Sub Form_Load()
    
   If UserLang = ARABIC Then
      ChangePositions frmPensionDetail, 11800
      frmPensionDetail.RightToLeft = True
      frmPensionDetail.txtPensionName.Alignment = 1
      frmPensionDetail.txtProxyName.Alignment = 1
   End If
   
   frmPensionDetail.Caption = frmPensionDetailCaption(0, UserLang)
   frmPensionDetail.lblPensionDetails.Caption = frmPensionDetailCaption(1, UserLang)
   frmPensionDetail.lblPenCardNo.Caption = frmPensionDetailCaption(2, UserLang)
   frmPensionDetail.lblName.Caption = frmPensionDetailCaption(3, UserLang)
   frmPensionDetail.lblPenAccNo.Caption = frmPensionDetailCaption(4, UserLang)
   frmPensionDetail.lblHfzNo.Caption = frmPensionDetailCaption(5, UserLang)
   frmPensionDetail.lblHafIssSource.Caption = frmPensionDetailCaption(6, UserLang)
   frmPensionDetail.lblIssSource.Caption = frmPensionDetailCaption(7, UserLang)
   frmPensionDetail.lblSaudiIdNo.Caption = frmPensionDetailCaption(8, UserLang)
   frmPensionDetail.lblProxyName.Caption = frmPensionDetailCaption(9, UserLang)
   frmPensionDetail.lblProxyHafNo.Caption = frmPensionDetailCaption(10, UserLang)
   frmPensionDetail.lblProxyHafIssSrc.Caption = frmPensionDetailCaption(11, UserLang)
   frmPensionDetail.lblPenSalAmt.Caption = frmPensionDetailCaption(12, UserLang)
   frmPensionDetail.lblDedn.Caption = frmPensionDetailCaption(13, UserLang)
   frmPensionDetail.lblNetAmount.Caption = frmPensionDetailCaption(14, UserLang)
   frmPensionDetail.lblBeneficiary.Caption = frmPensionDetailCaption(15, UserLang)
   frmPensionDetail.lblExportNo.Caption = frmPensionDetailCaption(16, UserLang)
   frmPensionDetail.lblIssueDate.Caption = frmPensionDetailCaption(17, UserLang)
   'frmPensionDetail.lblCardPosition.Caption = frmPensionDetailCaption(18, UserLang)
   frmPensionDetail.lblCardPosNo.Caption = frmPensionDetailCaption(19, UserLang)
   frmPensionDetail.lblCardType.Caption = frmPensionDetailCaption(20, UserLang)
   frmPensionDetail.lblCardStatus.Caption = frmPensionDetailCaption(21, UserLang)
   frmPensionDetail.lblPaymentType.Caption = frmPensionDetailCaption(22, UserLang)
   frmPensionDetail.lblNotes1 = frmPensionDetailCaption(23, UserLang)
   frmPensionDetail.lblNotes2 = frmPensionDetailCaption(24, UserLang)
   frmPensionDetail.lblNotes3 = frmPensionDetailCaption(25, UserLang)
   frmPensionDetail.lblNotes4 = frmPensionDetailCaption(26, UserLang)
   frmPensionDetail.lblNotes5 = frmPensionDetailCaption(27, UserLang)
   frmPensionDetail.lblNotes6 = frmPensionDetailCaption(28, UserLang)
   frmPensionDetail.lblNotes7 = frmPensionDetailCaption(29, UserLang)
   frmPensionDetail.lblNotes8 = frmPensionDetailCaption(30, UserLang)
   frmPensionDetail.lblNotes9 = frmPensionDetailCaption(31, UserLang)
   frmPensionDetail.lblNotes10 = frmPensionDetailCaption(32, UserLang)
   frmPensionDetail.lblNotes11 = frmPensionDetailCaption(33, UserLang)
   frmPensionDetail.lblNotes12 = frmPensionDetailCaption(34, UserLang)
   frmPensionDetail.lblNotes13 = frmPensionDetailCaption(35, UserLang)
   frmPensionDetail.lblNotes14 = frmPensionDetailCaption(36, UserLang)
   frmPensionDetail.lblNotes15 = frmPensionDetailCaption(37, UserLang)
   frmPensionDetail.cmdExit.Caption = frmPensionDetailCaption(38, UserLang)
   frmPensionDetail.lblSubCard.Caption = frmPensionDetailCaption(39, UserLang)
   frmPensionDetail.cmdInh.Caption = frmPensionDetailCaption(40, UserLang)
   frmPensionDetail.cmdCashPay.Caption = frmPensionDetailCaption(41, UserLang)
    
    
End Sub

Public Sub fillPenInhForm()
   Dim i As Integer
   
   frmPensionInheritance.txtPenCardNo = recvPensionInh.penCardNo
   frmPensionInheritance.txtPensionName = recvPensionDetail.penName
   frmPensionInheritance.txtBranchCode = recvPensionInh.branchCode
   frmPensionInheritance.txtNoOfInh = recvPensionInh.noOfInh
   frmPensionInheritance.txtPenSalary = Format(Val(recvPensionInh.penSalary), "###########0.00")
      
   For i = 1 To 25
       frmPensionInheritance.penInhGrid.Row = i
       frmPensionInheritance.penInhGrid.Col = 0
       frmPensionInheritance.penInhGrid.Text = recvPensionInh.names(i).relation
       frmPensionInheritance.penInhGrid.Col = 1
       frmPensionInheritance.penInhGrid.Text = recvPensionInh.names(i).dobDate
       frmPensionInheritance.penInhGrid.Col = 2
       frmPensionInheritance.penInhGrid.Text = recvPensionInh.names(i).penAmt
       frmPensionInheritance.penInhGrid.Col = 3
       frmPensionInheritance.penInhGrid.CellAlignment = vbAlignRight
       frmPensionInheritance.penInhGrid.Text = recvPensionInh.names(i).penName
   Next

End Sub

Public Sub parsePenInhDetail()
    Dim pos As Integer
    Dim i As Integer
    
    recvPensionInh.status = Mid$(RecvStr, 1, 3)
    recvPensionInh.service = Mid$(RecvStr, 4, 2)
    recvPensionInh.aRemarks = Mid$(RecvStr, 6, 50)
    recvPensionInh.eRemarks = Mid$(RecvStr, 56, 50)
    recvPensionInh.penCardNo = Mid$(RecvStr, 106, 9)
    recvPensionInh.branchCode = Mid$(RecvStr, 115, 3)
    recvPensionInh.noOfInh = Mid$(RecvStr, 118, 2)
    recvPensionInh.penSalary = Mid$(RecvStr, 120, 9)
    pos = 129
    For i = 1 To 25
       recvPensionInh.names(i).relation = Mid$(RecvStr, pos, 7)
       pos = pos + 7
       recvPensionInh.names(i).dobDate = Mid$(RecvStr, pos, 12)
       pos = pos + 12
       recvPensionInh.names(i).penAmt = Mid$(RecvStr, pos, 11)
       pos = pos + 11
       recvPensionInh.names(i).penName = Mid$(RecvStr, pos, 30)
       pos = pos + 30
    Next
 
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    secsUserInactive = 0
    CSD_mdiForm.staticStatus.Panels(5).Text = secsUserInactive
End Sub
